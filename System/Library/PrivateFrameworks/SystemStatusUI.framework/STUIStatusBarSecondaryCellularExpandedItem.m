@interface STUIStatusBarSecondaryCellularExpandedItem
- (id)cellularDataEntryKey;
@end

@implementation STUIStatusBarSecondaryCellularExpandedItem

- (id)cellularDataEntryKey
{
  return (id)*MEMORY[0x1E4FA97C8];
}

@end