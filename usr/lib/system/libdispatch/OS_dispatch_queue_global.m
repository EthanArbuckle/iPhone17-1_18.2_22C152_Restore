@interface OS_dispatch_queue_global
- (OS_dispatch_queue_global)init;
@end

@implementation OS_dispatch_queue_global

- (OS_dispatch_queue_global)init
{
  qword_1E91199C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end