@interface SESDCKAssertion
- (NSString)appletIdentifier;
- (NSString)keyIdentifier;
- (SESDCKAssertion)initWithKeyIdentifier:(id)a3;
- (id)proxy;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)didInvalidate;
- (void)invalidate;
- (void)setProxy:(id)a3;
@end

@implementation SESDCKAssertion

- (SESDCKAssertion)initWithKeyIdentifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SESDCKAssertion;
  v6 = [(SESDCKAssertion *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_keyIdentifier, a3);
    appletIdentifier = v7->_appletIdentifier;
    v7->_appletIdentifier = (NSString *)@"A000000809434343444B417631";
  }
  return v7;
}

- (void)dealloc
{
  [(SESDCKAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SESDCKAssertion;
  [(SESDCKAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  id v2 = [(SESDCKAssertion *)self synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global];
  [v2 invalidate:&__block_literal_global_471];
}

void __29__SESDCKAssertion_invalidate__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    objc_super v3 = SESDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_2146ED000, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void __29__SESDCKAssertion_invalidate__block_invoke_469(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    objc_super v3 = SESDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_2146ED000, v3, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v4, 0xCu);
    }
  }
}

- (void)didInvalidate
{
}

- (id)proxy
{
  id v2 = self;
  objc_sync_enter(v2);
  objc_super v3 = v2->_proxy;
  objc_sync_exit(v2);

  return v3;
}

- (void)setProxy:(id)a3
{
  int v4 = (SESAssertionInterface *)a3;
  obj = self;
  objc_sync_enter(obj);
  proxy = obj->_proxy;
  obj->_proxy = v4;

  objc_sync_exit(obj);
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  int v4 = (void (**)(id, void *))a3;
  id v5 = [(SESDCKAssertion *)self proxy];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  if (!v6)
  {
    v7 = SESDefaultLogObject();
    v8 = SESCreateAndLogError();
    v4[2](v4, v8);
  }
  return v6;
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)appletIdentifier
{
  return self->_appletIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appletIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
}

@end