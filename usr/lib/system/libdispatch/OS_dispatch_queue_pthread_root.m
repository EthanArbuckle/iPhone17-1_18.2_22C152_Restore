@interface OS_dispatch_queue_pthread_root
- (OS_dispatch_queue_pthread_root)init;
@end

@implementation OS_dispatch_queue_pthread_root

- (OS_dispatch_queue_pthread_root)init
{
  qword_1E91199C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end