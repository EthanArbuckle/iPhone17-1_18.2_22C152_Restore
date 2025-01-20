@interface OS_channel_dispatch
- (void)_xref_dispose;
- (void)dealloc;
- (void)release;
@end

@implementation OS_channel_dispatch

- (void)release
{
}

- (void)dealloc
{
  channel_dispatch_dispose((id *)&self->super.super.super.isa);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel_dispatch;
  [(OS_channel *)&v3 dealloc];
}

- (void)_xref_dispose
{
  channel_dispatch_xref_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_channel_dispatch;
  [(OS_object *)&v3 _xref_dispose];
}

@end