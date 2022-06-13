//
// Copyright 2021 New Vector Ltd
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

import SwiftUI
import Combine

typealias SplashScreenViewModelType = StateStoreViewModel<SplashScreenViewState, SplashScreenViewAction>

class SplashScreenViewModel: SplashScreenViewModelType, SplashScreenViewModelProtocol {

    // MARK: - Properties

    // MARK: Private

    // MARK: Public

    var callback: ((SplashScreenViewModelAction) -> Void)?

    // MARK: - Setup

    init() {
        super.init(initialViewState: SplashScreenViewState())
    }

    // MARK: - Public

    override func process(viewAction: SplashScreenViewAction) async {
        switch viewAction {
        case .register:
            register()
        case .login:
            login()
        }
    }

    private func register() {
        callback?(.register)
    }

    private func login() {
        callback?(.login)
    }
}
