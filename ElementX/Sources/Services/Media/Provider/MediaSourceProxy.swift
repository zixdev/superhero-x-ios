//
// Copyright 2022 New Vector Ltd
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

import Foundation
import MatrixRustSDK

struct MediaSourceProxy: Hashable {
    /// The media source provided by Rust.
    let underlyingSource: MediaSource
    /// The media's mime type, used when loading the media's file.
    /// This is optional when loading images and thumbnails in memory.
    let mimeType: String?
    
    init(source: MediaSource, mimeType: String?) {
        underlyingSource = source
        self.mimeType = mimeType
    }
    
    init(url: URL, mimeType: String?) {
        underlyingSource = mediaSourceFromUrl(url: url.absoluteString)
        self.mimeType = mimeType
    }

    var url: URL! {
        // Expecting these to always be valid URLs
        URL(string: underlyingSource.url())
    }
}

// MARK: - Hashable

extension MediaSource: Hashable {
    public static func == (lhs: MediaSource, rhs: MediaSource) -> Bool {
        lhs.url() == rhs.url()
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(url())
    }
}
