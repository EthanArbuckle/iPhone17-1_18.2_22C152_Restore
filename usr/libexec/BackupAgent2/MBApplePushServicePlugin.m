@interface MBApplePushServicePlugin
- (BOOL)shouldRestoreContentWithPolicy:(id)a3 atPath:(id)a4;
@end

@implementation MBApplePushServicePlugin

- (BOOL)shouldRestoreContentWithPolicy:(id)a3 atPath:(id)a4
{
  return ![a4 isEqualToString:@"/var/mobile/Library/Preferences/com.apple.apsd.plist"] || (objc_msgSend(a3, "isRestoringToSameDevice") & 1) != 0 || (objc_msgSend(objc_msgSend(a3, "osBuildVersionOfBackup"), "hasPrefix:", @"8A") & 1) == 0;
}

@end