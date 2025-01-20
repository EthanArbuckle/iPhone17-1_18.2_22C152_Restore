@interface MBApplePushServicePlugin
- (BOOL)shouldRestoreContentWithPolicy:(id)a3 atPath:(id)a4;
@end

@implementation MBApplePushServicePlugin

- (BOOL)shouldRestoreContentWithPolicy:(id)a3 atPath:(id)a4
{
  id v5 = a3;
  if ([a4 isEqualToString:@"/var/mobile/Library/Preferences/com.apple.apsd.plist"]
    && ([v5 isRestoringToSameDevice] & 1) == 0)
  {
    v7 = [v5 osBuildVersionOfBackup];
    unsigned __int8 v8 = [v7 hasPrefix:@"8A"];

    char v6 = v8 ^ 1;
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

@end