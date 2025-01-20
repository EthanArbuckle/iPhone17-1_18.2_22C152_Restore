@interface STUIStatusBarIndicatorAssistantItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation STUIStatusBarIndicatorAssistantItem

- (id)indicatorEntryKey
{
  return (id)*MEMORY[0x1E4FA9718];
}

- (BOOL)flipsForRightToLeftLayoutDirection
{
  return 0;
}

- (id)systemImageNameForUpdate:(id)a3
{
  return @"mic.fill";
}

- (id)imageNameForUpdate:(id)a3
{
  return 0;
}

@end