@interface SUSUIFollowUpBase
+ (id)uniqueIdentifier;
- (BOOL)allowNotification;
- (double)notificationFrequency;
- (id)actions;
- (id)groupIdentifier;
- (id)informativeFooterText;
- (id)informativeText;
- (id)notificationActivateAction;
- (id)notificationClearAction;
- (id)notificationInformativeText;
- (id)notificationOptions;
- (id)notificationTitle;
- (id)notificationUnlockActionLabel;
- (id)targetBundleIdentifier;
- (id)title;
- (id)userInfo;
- (unint64_t)displayStyle;
@end

@implementation SUSUIFollowUpBase

- (id)title
{
  return 0;
}

- (id)informativeText
{
  return 0;
}

- (id)informativeFooterText
{
  return 0;
}

+ (id)uniqueIdentifier
{
  return 0;
}

- (id)groupIdentifier
{
  return @"com.apple.softwareupdateservicesui";
}

- (id)targetBundleIdentifier
{
  return @"com.apple.Preferences";
}

- (id)userInfo
{
  return 0;
}

- (unint64_t)displayStyle
{
  return 0;
}

- (id)actions
{
  return 0;
}

- (BOOL)allowNotification
{
  return 1;
}

- (id)notificationTitle
{
  return 0;
}

- (id)notificationInformativeText
{
  return 0;
}

- (id)notificationUnlockActionLabel
{
  return 0;
}

- (double)notificationFrequency
{
  return 0.0;
}

- (id)notificationActivateAction
{
  return 0;
}

- (id)notificationClearAction
{
  return 0;
}

- (id)notificationOptions
{
  return 0;
}

@end