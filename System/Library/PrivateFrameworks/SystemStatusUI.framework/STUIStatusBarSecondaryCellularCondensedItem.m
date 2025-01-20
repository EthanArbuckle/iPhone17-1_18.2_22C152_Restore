@interface STUIStatusBarSecondaryCellularCondensedItem
- (id)cellularDataEntryKey;
@end

@implementation STUIStatusBarSecondaryCellularCondensedItem

- (id)cellularDataEntryKey
{
  return (id)*MEMORY[0x1E4FA97C8];
}

@end