import Cocoa
import Carbon

class AppDelegate: NSObject, NSApplicationDelegate {

    var monitor: Any?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // 백그라운드 앱 (Dock & 메뉴바 숨김)
        NSApplication.shared.setActivationPolicy(.prohibited)

        // Caps Lock 키 감지
        monitor = NSEvent.addGlobalMonitorForEvents(matching: .flagsChanged) { event in
            if event.modifierFlags.contains(.capsLock) {
                InputSourceManager.toggleInputSource()
            }
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // 종료 시 이벤트 해제
        if let monitor = monitor {
            NSEvent.removeMonitor(monitor)
        }
    }
}
