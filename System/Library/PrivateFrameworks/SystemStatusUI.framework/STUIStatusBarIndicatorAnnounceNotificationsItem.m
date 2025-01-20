@interface STUIStatusBarIndicatorAnnounceNotificationsItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation STUIStatusBarIndicatorAnnounceNotificationsItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA9710];
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