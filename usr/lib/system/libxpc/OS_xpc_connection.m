@interface OS_xpc_connection
- (void)_xref_dispose;
- (void)release;
@end

@implementation OS_xpc_connection

- (void)_xref_dispose
{
  _xpc_connection_last_xref_cancel((uint64_t)self, (uint64_t)a2, v2, v3, v4, v5, v6, v7);
  v9.receiver = self;
  v9.super_class = (Class)OS_xpc_connection;
  [(OS_object *)&v9 _xref_dispose];
}

- (void)release
{
}

@end