//
//  InputSourceManager.swift
//  LT
//
//  Created by 이돈혁 on 5/19/25.
//
import Carbon

class InputSourceManager {
    static func toggleInputSource() {
        guard let current = TISCopyCurrentKeyboardInputSource()?.takeRetainedValue(),
              let currentID = TISGetInputSourceProperty(current, kTISPropertyInputSourceID) as? String else { return }

        let sources = TISCreateInputSourceList(nil, false).takeRetainedValue() as! [TISInputSource]

        for source in sources {
            guard let id = TISGetInputSourceProperty(source, kTISPropertyInputSourceID) as? String else { continue }

            if currentID.contains("Hangul") && id.contains("Roman") {
                TISSelectInputSource(source)
                break
            } else if currentID.contains("Roman") && id.contains("Hangul") {
                TISSelectInputSource(source)
                break
            }
        }
    }
}
