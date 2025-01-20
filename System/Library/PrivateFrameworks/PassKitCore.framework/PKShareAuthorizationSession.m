@interface PKShareAuthorizationSession
- (PKShareAuthorizationSession)init;
- (void)authorizeDeviceOwnerWithAuthHandler:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation PKShareAuthorizationSession

- (PKShareAuthorizationSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)PKShareAuthorizationSession;
  return [(PKShareAuthorizationSession *)&v3 init];
}

- (void)dealloc
{
  [(PKShareAuthorizationSession *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PKShareAuthorizationSession;
  [(PKShareAuthorizationSession *)&v3 dealloc];
}

- (void)invalidate
{
  [(LAContext *)self->_context invalidate];
  context = self->_context;
  self->_context = 0;
}

- (void)authorizeDeviceOwnerWithAuthHandler:(id)a3 completion:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  context = self->_context;
  if (!context)
  {
    v8 = (LAContext *)objc_alloc_init(MEMORY[0x1E4F30B50]);
    v9 = self->_context;
    self->_context = v8;

    context = self->_context;
  }
  +[PKShareAuthorizer _authorizeDeviceOwnerWithAuthHandler:v10 completion:v6 context:context invalidateContext:0];
}

- (void).cxx_destruct
{
}

@end