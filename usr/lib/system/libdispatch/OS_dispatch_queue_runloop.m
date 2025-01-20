@interface OS_dispatch_queue_runloop
- (OS_dispatch_queue_runloop)init;
- (void)_xref_dispose;
@end

@implementation OS_dispatch_queue_runloop

- (OS_dispatch_queue_runloop)init
{
  qword_1E91199C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  _dispatch_queue_xref_dispose((uint64_t)self);
  _dispatch_runloop_queue_xref_dispose((atomic_ullong *)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_dispatch_queue_runloop;
  [(OS_dispatch_queue *)&v3 _xref_dispose];
}

@end