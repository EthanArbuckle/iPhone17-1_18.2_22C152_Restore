@interface OS_xpc_listener
- (OS_xpc_listener)init;
- (id)description;
- (void)_xref_dispose;
- (void)dealloc;
- (void)release;
@end

@implementation OS_xpc_listener

- (void)release
{
}

- (OS_xpc_listener)init
{
  v2 = _xpc_asprintf("Calling -init", a2);
  _xpc_api_misuse(v2);
}

- (void)_xref_dispose
{
  _xpc_listener_xref_dispose((os_unfair_lock_s *)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_listener;
  [(OS_object *)&v3 _xref_dispose];
}

- (void)dealloc
{
  _xpc_listener_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_listener;
  [(OS_xpc_listener *)&v3 dealloc];
}

- (id)description
{
  return 0;
}

@end