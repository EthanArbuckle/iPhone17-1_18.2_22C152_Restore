@interface OS_xpc_event_publisher
- (OS_xpc_event_publisher)init;
- (id)description;
- (void)_xref_dispose;
- (void)dealloc;
- (void)release;
@end

@implementation OS_xpc_event_publisher

- (void)release
{
}

- (OS_xpc_event_publisher)init
{
  v2 = _xpc_asprintf("Calling -init", a2);
  _xpc_api_misuse(v2);
}

- (void)_xref_dispose
{
  _xpc_event_publisher_xref_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_event_publisher;
  [(OS_object *)&v3 _xref_dispose];
}

- (void)dealloc
{
  _xpc_event_publisher_dispose((uint64_t)self);
  v3.receiver = self;
  v3.super_class = (Class)OS_xpc_event_publisher;
  [(OS_xpc_event_publisher *)&v3 dealloc];
}

- (id)description
{
  return 0;
}

@end