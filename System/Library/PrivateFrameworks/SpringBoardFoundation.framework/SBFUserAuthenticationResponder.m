@interface SBFUserAuthenticationResponder
+ (id)responderWithSuccessHandler:(id)a3 failureHandler:(id)a4 invalidHandler:(id)a5;
- (SBFUserAuthenticationResponder)initWithSuccessHandler:(id)a3 failureHandler:(id)a4 invalidHandler:(id)a5;
- (id)failureHandler;
- (id)invalidHandler;
- (id)successHandler;
- (void)handleFailedAuthenticationRequest:(id)a3 error:(id)a4;
- (void)handleInvalidAuthenticationRequest:(id)a3;
- (void)handleSuccessfulAuthenticationRequest:(id)a3;
- (void)setFailureHandler:(id)a3;
- (void)setInvalidHandler:(id)a3;
- (void)setSuccessHandler:(id)a3;
@end

@implementation SBFUserAuthenticationResponder

+ (id)responderWithSuccessHandler:(id)a3 failureHandler:(id)a4 invalidHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[objc_alloc((Class)a1) initWithSuccessHandler:v10 failureHandler:v9 invalidHandler:v8];

  return v11;
}

- (SBFUserAuthenticationResponder)initWithSuccessHandler:(id)a3 failureHandler:(id)a4 invalidHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SBFUserAuthenticationResponder;
  v11 = [(SBFUserAuthenticationResponder *)&v19 init];
  if (v11)
  {
    uint64_t v12 = MEMORY[0x18C133210](v8);
    id successHandler = v11->_successHandler;
    v11->_id successHandler = (id)v12;

    uint64_t v14 = MEMORY[0x18C133210](v9);
    id failureHandler = v11->_failureHandler;
    v11->_id failureHandler = (id)v14;

    uint64_t v16 = MEMORY[0x18C133210](v10);
    id invalidHandler = v11->_invalidHandler;
    v11->_id invalidHandler = (id)v16;
  }
  return v11;
}

- (void)handleSuccessfulAuthenticationRequest:(id)a3
{
  id successHandler = (void (**)(void))self->_successHandler;
  if (successHandler) {
    successHandler[2]();
  }
}

- (void)handleFailedAuthenticationRequest:(id)a3 error:(id)a4
{
  id failureHandler = (void (**)(id, id))self->_failureHandler;
  if (failureHandler) {
    failureHandler[2](failureHandler, a4);
  }
}

- (void)handleInvalidAuthenticationRequest:(id)a3
{
  id invalidHandler = (void (**)(void))self->_invalidHandler;
  if (invalidHandler) {
    invalidHandler[2]();
  }
}

- (id)successHandler
{
  return self->_successHandler;
}

- (void)setSuccessHandler:(id)a3
{
}

- (id)failureHandler
{
  return self->_failureHandler;
}

- (void)setFailureHandler:(id)a3
{
}

- (id)invalidHandler
{
  return self->_invalidHandler;
}

- (void)setInvalidHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidHandler, 0);
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong(&self->_successHandler, 0);
}

@end