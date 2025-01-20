@interface _UIStatusBarIndicatorAssistantItem
- (BOOL)flipsForRightToLeftLayoutDirection;
- (id)imageNameForUpdate:(id)a3;
- (id)indicatorEntryKey;
- (id)systemImageNameForUpdate:(id)a3;
@end

@implementation _UIStatusBarIndicatorAssistantItem

- (id)indicatorEntryKey
{
  return @"assistantEntry";
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