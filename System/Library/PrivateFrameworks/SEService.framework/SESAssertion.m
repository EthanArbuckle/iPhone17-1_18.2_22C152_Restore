@interface SESAssertion
- (NSString)appletIdentifier;
- (NSString)keyIdentifier;
- (SESAssertion)initWithKeyIdentifier:(id)a3 appletIdentifier:(id)a4;
- (id)proxy;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (void)dealloc;
- (void)didInvalidate;
- (void)invalidate;
- (void)setProxy:(id)a3;
@end

@implementation SESAssertion

- (SESAssertion)initWithKeyIdentifier:(id)a3 appletIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SESAssertion;
  v9 = [(SESAssertion *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyIdentifier, a3);
    objc_storeStrong((id *)&v10->_appletIdentifier, a4);
  }

  return v10;
}

- (void)dealloc
{
  [(SESAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SESAssertion;
  [(SESAssertion *)&v3 dealloc];
}

- (void)invalidate
{
  id v2 = [(SESAssertion *)self synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_9];
  [v2 invalidate:&__block_literal_global_468];
}

void __26__SESAssertion_invalidate__block_invoke(uint64_t a1, void *a2)
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

void __26__SESAssertion_invalidate__block_invoke_466(uint64_t a1, void *a2)
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
  id v5 = [(SESAssertion *)self proxy];
  uint64_t v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v4];

  if (!v6)
  {
    id v7 = SESDefaultLogObject();
    id v8 = SESCreateAndLogError();
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