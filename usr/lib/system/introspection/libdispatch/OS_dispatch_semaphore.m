@interface OS_dispatch_semaphore
- (OS_dispatch_semaphore)init;
@end

@implementation OS_dispatch_semaphore

- (OS_dispatch_semaphore)init
{
  qword_6D1C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end