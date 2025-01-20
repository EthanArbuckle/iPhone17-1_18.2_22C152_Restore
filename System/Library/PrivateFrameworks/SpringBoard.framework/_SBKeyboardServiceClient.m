@interface _SBKeyboardServiceClient
- (BSAuditToken)auditToken;
- (BSServiceConnectionContext)connectionContext;
- (_SBKeyboardServiceClient)initWithConnectionContext:(id)a3;
- (id)description;
- (int)pid;
@end

@implementation _SBKeyboardServiceClient

- (_SBKeyboardServiceClient)initWithConnectionContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SBKeyboardServiceClient;
  v6 = [(_SBKeyboardServiceClient *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connectionContext, a3);
  }

  return v7;
}

- (int)pid
{
  v2 = [(_SBKeyboardServiceClient *)self auditToken];
  int v3 = [v2 pid];

  return v3;
}

- (BSAuditToken)auditToken
{
  v2 = [(BSServiceConnectionContext *)self->_connectionContext remoteProcess];
  int v3 = [v2 auditToken];

  return (BSAuditToken *)v3;
}

- (id)description
{
  int v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p; connection: <%p> pid:%i>",
    v5,
    self,
    self->_connectionContext,
  v6 = [(_SBKeyboardServiceClient *)self pid]);

  return v6;
}

- (BSServiceConnectionContext)connectionContext
{
  return self->_connectionContext;
}

- (void).cxx_destruct
{
}

@end