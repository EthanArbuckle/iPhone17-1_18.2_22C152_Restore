@interface _RWIRelayConnectionToApplication
- (BOOL)available;
- (NSString)tag;
- (OS_xpc_object)connection;
- (_RWIRelayConnectionToApplication)initWithConnection:(id)a3;
- (_RWIRelayConnectionToApplicationDelegate)delegate;
- (id)_deserializeMessage:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)close;
- (void)dealloc;
- (void)sendMessage:(id)a3 userInfo:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setTag:(id)a3;
@end

@implementation _RWIRelayConnectionToApplication

- (_RWIRelayConnectionToApplication)initWithConnection:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_RWIRelayConnectionToApplication;
  v6 = [(_RWIRelayConnectionToApplication *)&v14 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    xpc_connection_set_target_queue(v7->_connection, MEMORY[0x263EF83A0]);
    connection = v7->_connection;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __55___RWIRelayConnectionToApplication_initWithConnection___block_invoke;
    handler[3] = &unk_2647F7480;
    v9 = v7;
    v13 = v9;
    xpc_connection_set_event_handler(connection, handler);
    xpc_connection_resume(v7->_connection);
    v10 = v9;
  }
  return v7;
}

- (void)close
{
  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    v4 = self->_connection;
    self->_connection = 0;
  }
}

- (void)dealloc
{
  [(_RWIRelayConnectionToApplication *)self close];
  v3.receiver = self;
  v3.super_class = (Class)_RWIRelayConnectionToApplication;
  [(_RWIRelayConnectionToApplication *)&v3 dealloc];
}

- (id)_deserializeMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = MEMORY[0x22A670F20]();
  uint64_t v6 = MEMORY[0x263EF8708];
  if (v5 != MEMORY[0x263EF8708])
  {
    v7 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = xpc_dictionary_get_value(v4, "msgData");
  v9 = (void *)v8;
  if (v8 && MEMORY[0x22A670F20](v8) == v6)
  {
    id v12 = (id)_CFXPCCreateCFObjectFromXPCMessage();
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v12 = v12;
      v7 = v12;
LABEL_11:

      goto LABEL_12;
    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 xpcConnection:self unhandledMessage:v4];
    goto LABEL_10;
  }
  v7 = 0;
LABEL_12:

LABEL_13:
  return v7;
}

- (void)_handleEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_connection)
  {
    uint64_t v6 = MEMORY[0x22A670F20](v4);
    uint64_t v7 = MEMORY[0x263EF8720];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v9 = WeakRetained;
    if (v6 == v7)
    {
      [WeakRetained xpcConnectionFailed:self];

      [(_RWIRelayConnectionToApplication *)self close];
    }
    else
    {

      if (v9)
      {
        v10 = [(_RWIRelayConnectionToApplication *)self _deserializeMessage:v5];
        char v11 = objc_opt_class();
        if (objc_opt_isKindOfClass())
        {

          id v12 = RWIMessageTraceLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
            -[_RWIRelayConnectionToApplication _handleEvent:](self);
          }

          char v11 = [v10 objectForKey:@"messageName"];
          objc_opt_class();
          id v13 = (id)objc_claimAutoreleasedReturnValue();
          if (objc_opt_isKindOfClass())
          {

            id v13 = [v10 objectForKey:@"userInfo"];
            objc_super v14 = objc_opt_class();
            if (v13 && (objc_opt_isKindOfClass() & 1) == 0)
            {
              v18 = objc_opt_class();
              logUnexpectedType(v18, v14);
            }
            else
            {

              id v15 = objc_loadWeakRetained((id *)&self->_delegate);
              [v15 xpcConnection:self receivedMessage:v11 userInfo:v13];
            }
          }
          else
          {
            v17 = objc_opt_class();
            logUnexpectedType(v17, v13);
          }
        }
        else
        {
          v16 = objc_opt_class();
          logUnexpectedType(v16, v11);
        }
      }
    }
  }
}

- (void)sendMessage:(id)a3 userInfo:(id)a4
{
  id v6 = a4;
  if (self->_connection)
  {
    uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithObject:a3 forKey:@"messageName"];
    uint64_t v8 = v7;
    if (v6) {
      [v7 setObject:v6 forKey:@"userInfo"];
    }
    v9 = RWIMessageTraceLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[_RWIRelayConnectionToApplication sendMessage:userInfo:](self);
    }

    v10 = (void *)_CFXPCCreateXPCMessageWithCFObject();
    if (v10)
    {
      xpc_object_t v11 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_value(v11, "msgData", v10);
      xpc_connection_send_message(self->_connection, v11);
    }
  }
}

- (BOOL)available
{
  return self->_connection != 0;
}

- (_RWIRelayConnectionToApplicationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_RWIRelayConnectionToApplicationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (NSString)tag
{
  return self->_tag;
}

- (void)setTag:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tag, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_handleEvent:(void *)a1 .cold.1(void *a1)
{
  v1 = [a1 tag];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226FA0000, v2, v3, "IPC app[%{public}@]->relay: %{private}@", v4, v5, v6, v7, v8);
}

- (void)sendMessage:(void *)a1 userInfo:.cold.1(void *a1)
{
  v1 = [a1 tag];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_226FA0000, v2, v3, "IPC relay->app[%{public}@]: %{private}@", v4, v5, v6, v7, v8);
}

@end