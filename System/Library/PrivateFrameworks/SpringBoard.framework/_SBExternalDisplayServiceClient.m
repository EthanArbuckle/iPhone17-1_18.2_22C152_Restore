@interface _SBExternalDisplayServiceClient
- (BSAuditToken)auditToken;
- (BSProcessHandle)remoteProcess;
- (BSServiceConnection)connection;
- (_SBExternalDisplayServiceClient)initWithConnection:(id)a3 remoteProcess:(id)a4;
- (id)description;
- (int)pid;
@end

@implementation _SBExternalDisplayServiceClient

- (_SBExternalDisplayServiceClient)initWithConnection:(id)a3 remoteProcess:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 33, @"Invalid parameter not satisfying: %@", @"connection" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"_SBExternalDisplayServiceConnectionListener.m", 34, @"Invalid parameter not satisfying: %@", @"remoteProcess" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)_SBExternalDisplayServiceClient;
  v11 = [(_SBExternalDisplayServiceClient *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a3);
    objc_storeStrong((id *)&v12->_remoteProcess, a4);
  }

  return v12;
}

- (int)pid
{
  v2 = [(_SBExternalDisplayServiceClient *)self auditToken];
  int v3 = [v2 pid];

  return v3;
}

- (BSAuditToken)auditToken
{
  return (BSAuditToken *)[(BSProcessHandle *)self->_remoteProcess auditToken];
}

- (id)description
{
  int v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; connection: <%p> pid:%i>",
    v5,
    self,
    self->_connection,
  v6 = [(_SBExternalDisplayServiceClient *)self pid]);

  return v6;
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (BSProcessHandle)remoteProcess
{
  return self->_remoteProcess;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteProcess, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end