@interface OS_dispatch_io
- (OS_dispatch_io)init;
@end

@implementation OS_dispatch_io

- (OS_dispatch_io)init
{
  qword_1E91199C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

@end