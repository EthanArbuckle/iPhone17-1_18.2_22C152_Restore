@interface STUIStatusBarPersonNameItem
- (id)nameEntryKey;
@end

@implementation STUIStatusBarPersonNameItem

- (id)nameEntryKey
{
  return (id)*MEMORY[0x1E4FA9798];
}

@end