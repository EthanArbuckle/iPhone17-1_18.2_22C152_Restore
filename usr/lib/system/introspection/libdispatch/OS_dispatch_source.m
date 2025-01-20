@interface OS_dispatch_source
- (OS_dispatch_source)init;
- (void)_xref_dispose;
@end

@implementation OS_dispatch_source

- (OS_dispatch_source)init
{
  qword_6D1C0 = (uint64_t)"BUG IN CLIENT OF LIBDISPATCH: -init called directly";
  __break(1u);
  return self;
}

- (void)_xref_dispose
{
  _dispatch_queue_xref_dispose((uint64_t)self);
  _dispatch_source_xref_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_dispatch_source;
  [(OS_object *)&v3 _xref_dispose];
}

@end