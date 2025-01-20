@interface SCLSuppressSchoolModeAssertionClient
- (BOOL)isAcquired;
- (BOOL)isEntitled;
- (NSString)description;
- (NSString)explanation;
- (NSXPCConnection)connection;
- (SCLSuppressSchoolModeAssertionClient)initWithConnection:(id)a3;
- (SCLSuppressSchoolModeAssertionClientDelegate)delegate;
- (void)acquireWithExplanation:(id)a3 UUID:(id)a4 completion:(id)a5;
- (void)connectionDidInvalidate;
- (void)setAcquired:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEntitled:(BOOL)a3;
@end

@implementation SCLSuppressSchoolModeAssertionClient

- (SCLSuppressSchoolModeAssertionClient)initWithConnection:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SCLSuppressSchoolModeAssertionClient;
  v6 = [(SCLSuppressSchoolModeAssertionClient *)&v17 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    [(NSXPCConnection *)v7->_connection setExportedObject:v7];
    connection = v7->_connection;
    v9 = SCLSuppressSchoolModeAssertionXPCServerInterface();
    [(NSXPCConnection *)connection setExportedInterface:v9];

    v10 = [v5 valueForEntitlement:0x26DF07FF8];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v10 BOOLValue])
    {
      v7->_entitled = 1;
    }
    else
    {
      v11 = scl_framework_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[SCLSuppressSchoolModeAssertionClient initWithConnection:]((uint64_t)v5, v11);
      }
    }
    objc_initWeak(&location, v7);
    v12 = v7->_connection;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __59__SCLSuppressSchoolModeAssertionClient_initWithConnection___block_invoke;
    v14[3] = &unk_2648AC4E0;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v12 setInvalidationHandler:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v7;
}

void __59__SCLSuppressSchoolModeAssertionClient_initWithConnection___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionDidInvalidate];
}

- (NSString)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = [(SCLSuppressSchoolModeAssertionClient *)self explanation];
  v7 = [v3 stringWithFormat:@"<%@ %p; explanation: %@>", v5, self, v6];

  return (NSString *)v7;
}

- (void)connectionDidInvalidate
{
  [(SCLSuppressSchoolModeAssertionClient *)self setAcquired:0];
  id v3 = [(SCLSuppressSchoolModeAssertionClient *)self delegate];
  [v3 clientDidInvalidate:self];
}

- (void)acquireWithExplanation:(id)a3 UUID:(id)a4 completion:(id)a5
{
  v11 = (void (**)(id, uint64_t, void))a5;
  v7 = (NSString *)[a3 copy];
  explanation = self->_explanation;
  self->_explanation = v7;

  if ([(SCLSuppressSchoolModeAssertionClient *)self isEntitled])
  {
    if (![(SCLSuppressSchoolModeAssertionClient *)self isAcquired])
    {
      [(SCLSuppressSchoolModeAssertionClient *)self setAcquired:1];
      v9 = [(SCLSuppressSchoolModeAssertionClient *)self delegate];
      [v9 clientDidAcquireAssertion:self];
    }
    v11[2](v11, 1, 0);
  }
  else
  {
    v10 = SCLEntitlementError(0x26DF07FF8);
    ((void (**)(id, uint64_t, void *))v11)[2](v11, 0, v10);
  }
}

- (SCLSuppressSchoolModeAssertionClientDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SCLSuppressSchoolModeAssertionClientDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (BOOL)isAcquired
{
  return self->_acquired;
}

- (void)setAcquired:(BOOL)a3
{
  self->_acquired = a3;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (BOOL)isEntitled
{
  return self->_entitled;
}

- (void)setEntitled:(BOOL)a3
{
  self->_entitled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)initWithConnection:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_22B7B4000, a2, OS_LOG_TYPE_ERROR, "Client %@ is not entitled to acquire suppression assertions", (uint8_t *)&v2, 0xCu);
}

@end