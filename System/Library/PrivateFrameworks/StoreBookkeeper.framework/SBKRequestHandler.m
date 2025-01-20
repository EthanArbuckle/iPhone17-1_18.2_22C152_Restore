@interface SBKRequestHandler
- (SBKRequestHandler)initWithBagContext:(id)a3;
- (SBKStoreURLBagContext)bagContext;
- (void)cancel;
- (void)timeout;
@end

@implementation SBKRequestHandler

- (void).cxx_destruct
{
}

- (SBKStoreURLBagContext)bagContext
{
  return self->_bagContext;
}

- (void)cancel
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBKRequestHandler.m" lineNumber:31 description:@"Subclass must implement"];
}

- (void)timeout
{
  id v4 = [MEMORY[0x263F08690] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBKRequestHandler.m" lineNumber:26 description:@"Subclass must implement"];
}

- (SBKRequestHandler)initWithBagContext:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBKRequestHandler;
  v6 = [(SBKRequestHandler *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_bagContext, a3);
  }

  return v7;
}

@end