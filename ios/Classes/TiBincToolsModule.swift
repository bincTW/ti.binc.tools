//
//  binc.tools
//  Created by Thomas Weber
//  Copyright (c) 2022 binaries included
//  Version 1.0.0 (beta)
//  MIT License

import UIKit
import TitaniumKit

@objc(TiBincToolsModule)
class TiBincToolsModule: TiModule {

    func moduleGUID() -> String {
        return "543d9af1-119c-42d9-8053-6a534119f956"
    }

    override func moduleId() -> String! {
        return "binc.tools"
    }

    override func startup() {
        super.startup()
        debugPrint("[DEBUG] \(self) loaded")
    }

    @objc(relativeDate:)
    @available(iOS 13.0, *)
    func relativeDate(arguments: Array<Any>?) -> String? {
        guard let arguments = arguments, let params = arguments[0] as? [String: Any] else { return nil }

        let dateFormatString = params["dateFormat"] as? String ?? "yyyy-MM-dd HH:mm:ss"
        let ts = params["timestamp"] as? Double
        let dateString = params["date"] as? String
        let languageString = params["language"] as? String
        var output:String = "";
        let formatter = RelativeDateTimeFormatter()

        if languageString != nil {
            formatter.locale = Locale(identifier: languageString! )
        }

        if dateString != nil {

            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = dateFormatString
            let d = dateFormatter.date(from: dateString!) as Date?
            if (d != nil )
            {
                output = formatter.localizedString(for: Date(timeIntervalSince1970: d!.timeIntervalSince1970 ), relativeTo: Date())
            }
        }

        if ts != nil {
            output = formatter.localizedString(for: Date(timeIntervalSince1970: ts! ), relativeTo: Date())
        }

        return output
    }

    @objc(getApplicationState:)
    func getApplicationState(unused: [Any]?) -> String? {

        var appState:String = "unkown";
        switch UIApplication.shared.applicationState {
        case .active:
            appState="active"
            break
        case .inactive:
            appState="inactive"
            break
        case .background:
            appState="background"
            break
        }
        return appState
    }

    @objc(createUUID:)
    func createUUID(args: [Any]?) -> Any? {
        guard let args = args
        else {
            return UUID().uuidString
        }

        let quant = args[0] as? Int ?? 1
        let lower = (args.count > 1) ? args[1] as? Bool ?? false : false;
        var output: [String] = []

        for _ in 1...quant {
            output.append( (lower) ? UUID().uuidString.lowercased() :  UUID().uuidString  )
        }
        return output
    }


}
