@interface OS_dispatch_queue_mgr
- (OS_dispatch_queue_mgr)init;
@end

@implementation OS_dispatch_queue_mgr

- (OS_dispatch_queue_mgr)init
{
  qword_1E91199C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end