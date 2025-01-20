@interface HKSPXPCClient
+ (id)clientForConnection:(id)a3 clientIdentifierProvider:(id)a4 clientLink:(id)a5;
+ (id)clientForConnection:(id)a3 clientLink:(id)a4;
- (BOOL)isEqual:(id)a3;
- (HKSPClient)clientLink;
- (HKSPXPCClient)initWithConnection:(id)a3 clientIdentifierProvider:(id)a4 clientLink:(id)a5;
- (HKSPXPCClientIdentifier)clientIdentifier;
- (NAFuture)clientIdentifierProvider;
- (NSString)description;
- (NSXPCConnection)connection;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)processID;
- (unint64_t)hash;
- (void)setClientIdentifier:(id)a3;
@end

@implementation HKSPXPCClient

- (NSString)description
{
  return (NSString *)[(HKSPXPCClient *)self descriptionWithMultilinePrefix:0];
}

uint64_t __25__HKSPXPCClient_isEqual___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) connection];
}

- (NAFuture)clientIdentifierProvider
{
  return self->_clientIdentifierProvider;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(HKSPXPCClient *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)succinctDescriptionBuilder
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)objc_msgSend(v3, "appendInt:withName:", -[HKSPXPCClient processID](self, "processID"), @"pid");
  v5 = [(HKSPXPCClient *)self clientIdentifier];
  v6 = [v5 loggingIdentifier];
  id v7 = (id)[v3 appendObject:v6 withName:@"id" skipIfNil:1];

  return v3;
}

- (int)processID
{
  v2 = [(HKSPXPCClient *)self connection];
  int v3 = [v2 processIdentifier];

  return v3;
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (HKSPXPCClientIdentifier)clientIdentifier
{
  return (HKSPXPCClientIdentifier *)objc_getProperty(self, a2, 24, 1);
}

+ (id)clientForConnection:(id)a3 clientIdentifierProvider:(id)a4 clientLink:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (void *)[objc_alloc((Class)objc_opt_class()) initWithConnection:v9 clientIdentifierProvider:v8 clientLink:v7];

  return v10;
}

- (HKSPXPCClient)initWithConnection:(id)a3 clientIdentifierProvider:(id)a4 clientLink:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v21.receiver = self;
  v21.super_class = (Class)HKSPXPCClient;
  v12 = [(HKSPXPCClient *)&v21 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_connection, a3);
    objc_storeStrong((id *)&v13->_clientIdentifierProvider, a4);
    objc_initWeak(&location, v13);
    clientIdentifierProvider = v13->_clientIdentifierProvider;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __72__HKSPXPCClient_initWithConnection_clientIdentifierProvider_clientLink___block_invoke;
    v18[3] = &unk_1E5D33DE0;
    objc_copyWeak(&v19, &location);
    id v15 = (id)[(NAFuture *)clientIdentifierProvider addSuccessBlock:v18];
    objc_storeStrong((id *)&v13->_clientLink, a5);
    v16 = v13;
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v13;
}

void __72__HKSPXPCClient_initWithConnection_clientIdentifierProvider_clientLink___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v4 = HKSPNilify(v3);

  [WeakRetained setClientIdentifier:v4];
}

- (void)setClientIdentifier:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HKSPXPCClient *)a3;
  if (self == v4)
  {
    char v10 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [MEMORY[0x1E4F4F738] builderWithObject:v5 ofExpectedClass:objc_opt_class()];
      connection = self->_connection;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __25__HKSPXPCClient_isEqual___block_invoke;
      v12[3] = &unk_1E5D33E08;
      v13 = v5;
      id v8 = v5;
      id v9 = (id)[v6 appendObject:connection counterpart:v12];
      char v10 = [v6 isEqual];
    }
    else
    {
      char v10 = 0;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F4F758] builder];
  id v4 = (id)[v3 appendObject:self->_connection];
  unint64_t v5 = [v3 hash];

  return v5;
}

+ (id)clientForConnection:(id)a3 clientLink:(id)a4
{
  return (id)[a1 clientForConnection:a3 clientIdentifierProvider:0 clientLink:a4];
}

- (id)succinctDescription
{
  v2 = [(HKSPXPCClient *)self succinctDescriptionBuilder];
  id v3 = [v2 build];

  return v3;
}

- (HKSPClient)clientLink
{
  return self->_clientLink;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientLink, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end