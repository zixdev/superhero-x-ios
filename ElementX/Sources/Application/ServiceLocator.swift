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

class ServiceLocator {
    private(set) static var shared = ServiceLocator()
    
    private init() { }
    
    private(set) var userIndicatorController: UserIndicatorControllerProtocol!
    
    func register(userIndicatorController: UserIndicatorControllerProtocol) {
        self.userIndicatorController = userIndicatorController
    }
    
    private(set) var settings: AppSettings!
    
    func register(appSettings: AppSettings) {
        settings = appSettings
    }
    
    private(set) var networkMonitor: NetworkMonitor!
    
    func register(networkMonitor: NetworkMonitor) {
        self.networkMonitor = networkMonitor
    }
    
    private(set) var analytics: AnalyticsService!
    
    func register(analytics: AnalyticsService) {
        self.analytics = analytics
    }
    
    private(set) var bugReportService: BugReportServiceProtocol!
    
    func register(bugReportService: BugReportServiceProtocol) {
        self.bugReportService = bugReportService
    }
}
