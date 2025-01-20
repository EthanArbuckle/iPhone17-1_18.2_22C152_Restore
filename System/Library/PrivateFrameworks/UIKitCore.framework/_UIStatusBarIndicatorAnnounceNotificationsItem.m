@interface _UIStatusBarIndicatorAnnounceNotificationsItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorAnnounceNotificationsItem

- (id)indicatorEntryKey
{
  return @"announceNotificationsEntry";
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"bell.and.waveform.fill";
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end