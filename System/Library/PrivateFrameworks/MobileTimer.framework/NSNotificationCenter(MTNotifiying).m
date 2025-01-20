@interface NSNotificationCenter(MTNotifiying)
- (uint64_t)mtNotifiyingQueue;
@end

@implementation NSNotificationCenter(MTNotifiying)

- (uint64_t)mtNotifiyingQueue
{
  uint64_t v0 = MEMORY[0x1E4F14428];
  id v1 = MEMORY[0x1E4F14428];
  return v0;
}

@end