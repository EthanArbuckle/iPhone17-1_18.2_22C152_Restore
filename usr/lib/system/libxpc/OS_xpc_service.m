@interface OS_xpc_service
- (void)_xref_dispose;
- (void)release;
@end

@implementation OS_xpc_service

- (void)release
{
}

- (void)_xref_dispose
{
  _xpc_service_last_xref_cancel((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_service;
  [(OS_object *)&v3 _xref_dispose];
}

@end