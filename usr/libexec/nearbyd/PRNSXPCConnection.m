@interface PRNSXPCConnection
- (NSXPCConnection)connection;
- (PRNSXPCConnection)initWithConnection:(id)a3;
- (unint64_t)maxAllowedOutgoingMessages;
- (void)actOnRemoteObjectAndScheduleBarrierBlock:(id)a3;
- (void)invalidate;
- (void)setConnection:(id)a3;
- (void)setMaxAllowedOutgoingMessages:(unint64_t)a3;
@end

@implementation PRNSXPCConnection

- (PRNSXPCConnection)initWithConnection:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRNSXPCConnection;
  v6 = [(PRNSXPCConnection *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v7->_maxAllowedOutgoingMessages = 1000;
    atomic_store(0, &v7->outgoingMessagesCount.__a_.__a_value);
  }

  return v7;
}

- (void)actOnRemoteObjectAndScheduleBarrierBlock:(id)a3
{
  v4 = (void (**)(id, void))a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1002C4458;
  v20 = sub_1002C4468;
  id v21 = 0;
  id v5 = [(PRNSXPCConnection *)self connection];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002C4470;
  v15[3] = &unk_10085E318;
  v15[4] = &v16;
  v6 = [v5 remoteObjectProxyWithErrorHandler:v15];

  if (v17[5])
  {
    v4[2](v4, 0);
  }
  else
  {
    unint64_t v7 = atomic_fetch_add((atomic_ullong *volatile)&self->outgoingMessagesCount, 1uLL) + 1;
    if (v7 <= [(PRNSXPCConnection *)self maxAllowedOutgoingMessages])
    {
      ((void (*)(void (**)(id, void), void *, uint64_t))v4[2])(v4, v6, v17[5]);
      if (__ROR8__(0x8F5C28F5C28F5C29 * v7, 2) <= 0x28F5C28F5C28F5CuLL)
      {
        connection = self->_connection;
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1002C4480;
        v14[3] = &unk_1008473B0;
        v14[4] = self;
        [(NSXPCConnection *)connection scheduleSendBarrierBlock:v14];
      }
    }
    else
    {
      v8 = qword_1008ABDE0;
      if (os_log_type_enabled((os_log_t)qword_1008ABDE0, OS_LOG_TYPE_ERROR)) {
        sub_10042B520(v7, v8);
      }
      NSErrorUserInfoKey v22 = NSLocalizedDescriptionKey;
      CFStringRef v23 = @"FATAL CLIENT ERROR: Client hasn't dequeued xpc messages. Invalidating connection.";
      objc_super v9 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      uint64_t v10 = PRErrorWithCodeAndUserInfo(2001, v9);
      v11 = (void *)v17[5];
      v17[5] = v10;

      ((void (*)(void (**)(id, void), void, uint64_t))v4[2])(v4, 0, v17[5]);
      v12 = [(PRNSXPCConnection *)self connection];
      [v12 invalidate];
    }
  }

  _Block_object_dispose(&v16, 8);
}

- (void)invalidate
{
  v3 = [(PRNSXPCConnection *)self connection];
  [v3 invalidate];

  [(PRNSXPCConnection *)self setConnection:0];
}

- (unint64_t)maxAllowedOutgoingMessages
{
  return self->_maxAllowedOutgoingMessages;
}

- (void)setMaxAllowedOutgoingMessages:(unint64_t)a3
{
  self->_maxAllowedOutgoingMessages = a3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

@end