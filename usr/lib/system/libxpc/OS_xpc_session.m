@interface OS_xpc_session
- (OS_xpc_session)init;
- (id)description;
- (void)_xref_dispose;
- (void)dealloc;
- (void)release;
@end

@implementation OS_xpc_session

- (void)release
{
}

- (OS_xpc_session)init
{
  v2 = _xpc_asprintf("Calling -init", a2);
  _xpc_api_misuse(v2);
}

- (void)_xref_dispose
{
  _xpc_session_xref_dispose((os_unfair_lock_s *)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_session;
  [(OS_object *)&v3 _xref_dispose];
}

- (void)dealloc
{
  _xpc_session_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_session;
  [(OS_xpc_session *)&v3 dealloc];
}

- (id)description
{
  return 0;
}

@end