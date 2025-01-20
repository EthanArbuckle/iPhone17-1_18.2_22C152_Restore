@interface STUIStatusBarDeviceNameItem
- (id)nameEntryKey;
@end

@implementation STUIStatusBarDeviceNameItem

- (id)nameEntryKey
{
  return (id)*MEMORY[0x1E4FA9758];
}

@end