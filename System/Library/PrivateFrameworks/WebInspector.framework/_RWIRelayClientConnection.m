@interface _RWIRelayClientConnection
- (BOOL)sleeping;
- (NSString)tag;
- (_RWIRelayClientConnection)initWithDelegate:(id)a3;
- (_RWIRelayClientConnectionDelegate)delegate;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)_closeAndNotifyDelegate:(BOOL)a3;
- (void)close;
- (void)closeFromConnection;
- (void)closeInternal;
- (void)dealloc;
- (void)dispatchRelayMessage:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)sendMessage:(id)a3;
- (void)setSleeping:(BOOL)a3;
- (void)setTag:(id)a3;
@end

@implementation _RWIRelayClientConnection

- (_RWIRelayClientConnection)initWithDelegate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_RWIRelayClientConnection;
  result = [(_RWIRelayClientConnection *)&v5 init];
  if (result) {
    result->_delegate = (_RWIRelayClientConnectionDelegate *)a3;
  }
  return result;
}

- (void)dealloc
{
  [(_RWIRelayClientConnection *)self close];

  v3.receiver = self;
  v3.super_class = (Class)_RWIRelayClientConnection;
  [(_RWIRelayClientConnection *)&v3 dealloc];
}

- (void)_closeAndNotifyDelegate:(BOOL)a3
{
  if (!self->_closed)
  {
    BOOL v3 = a3;
    [(_RWIRelayClientConnection *)self closeInternal];
    self->_closed = 1;
    if (v3) {
      [(_RWIRelayClientConnectionDelegate *)self->_delegate clientConnectionDidClose:self];
    }
    self->_delegate = 0;
  }
}

- (void)close
{
}

- (void)closeFromConnection
{
}

- (void)sendMessage:(id)a3
{
}

- (void)closeInternal
{
}

- (void)dispatchRelayMessage:(id)a3
{
  objc_super v5 = RWIMessageTraceLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[_RWIRelayClientConnection dispatchRelayMessage:](self);
  }
  traceMessagePayloadIfKeyExists(@"WIRSocketDataKey", a3);
  v6 = (NSString *)[a3 objectForKey:@"__selector"];
  if (v6)
  {
    v7 = v6;
    if ([(NSString *)v6 hasPrefix:@"_rpc_"])
    {
      SEL v8 = NSSelectorFromString(v7);
      [(_RWIRelayClientConnection *)self delegate];
      if (objc_opt_respondsToSelector())
      {
        id v9 = (id)objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"__argument"), "mutableCopy");
        [v9 setValue:self forKey:@"RWIServiceConnectionKey"];
        [(_RWIRelayClientConnectionDelegate *)[(_RWIRelayClientConnection *)self delegate] performSelector:v8 withObject:v9];
      }
    }
  }
}

- (void)forwardInvocation:(id)a3
{
  objc_super v5 = NSStringFromSelector((SEL)[a3 selector]);
  uint64_t v9 = 0;
  [a3 getArgument:&v9 atIndex:2];
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v8 = v6;
  [v6 setObject:v5 forKey:@"__selector"];
  if (v9) {
    [v6 setObject:v9 forKey:@"__argument"];
  }
  v7 = RWIMessageTraceLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[_RWIRelayClientConnection forwardInvocation:](self);
  }
  traceMessagePayloadIfKeyExists(@"WIRMessageDataKey", v6);
  [a3 setArgument:&v8 atIndex:2];
  [a3 retainArguments];
  [a3 setTarget:self];
  [a3 setSelector:sel_sendMessage_];
  [a3 invoke];
}

- (id)methodSignatureForSelector:(SEL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_RWIRelayClientConnection;
  id result = [(_RWIRelayClientConnection *)&v4 methodSignatureForSelector:a3];
  if (!result) {
    return (id)[(id)objc_opt_class() instanceMethodSignatureForSelector:sel_sendMessage_];
  }
  return result;
}

- (_RWIRelayClientConnectionDelegate)delegate
{
  return self->_delegate;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (BOOL)sleeping
{
  return self->_sleeping;
}

- (void)setSleeping:(BOOL)a3
{
  self->_sleeping = a3;
}

- (void)dispatchRelayMessage:(void *)a1 .cold.1(void *a1)
{
  [a1 tag];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226FA0000, v1, v2, "IPC client[%{private}@]->relay: %{private}@", v3, v4, v5, v6, v7);
}

- (void)forwardInvocation:(void *)a1 .cold.1(void *a1)
{
  [a1 tag];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226FA0000, v1, v2, "IPC relay->client[%{private}@]: %{private}@", v3, v4, v5, v6, v7);
}

@end