@interface SBSAssertion
- (BOOL)isValid;
- (BSMachPortReceiveRight)receiveRight;
- (NSString)assertionName;
- (NSString)reason;
- (SBSAssertion)init;
- (SBSAssertion)initWithAssertionName:(id)a3 reason:(id)a4 port:(unsigned int)a5;
- (SBSAssertion)initWithAssertionName:(id)a3 reason:(id)a4 receiveRight:(id)a5;
- (void)addHandler:(id)a3 forDeathOfServerPort:(id)a4;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBSAssertion

- (SBSAssertion)initWithAssertionName:(id)a3 reason:(id)a4 receiveRight:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SBSAssertion;
  v11 = [(SBSAssertion *)&v17 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    assertionName = v11->_assertionName;
    v11->_assertionName = (NSString *)v12;

    uint64_t v14 = [v9 copy];
    reason = v11->_reason;
    v11->_reason = (NSString *)v14;

    objc_storeStrong((id *)&v11->_receiveRight, a5);
  }

  return v11;
}

- (SBSAssertion)initWithAssertionName:(id)a3 reason:(id)a4 port:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = (objc_class *)MEMORY[0x1E4F4F768];
  id v9 = a4;
  id v10 = a3;
  v11 = (void *)[[v8 alloc] initWithPort:v5];
  uint64_t v12 = [(SBSAssertion *)self initWithAssertionName:v10 reason:v9 receiveRight:v11];

  return v12;
}

- (SBSAssertion)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"SBSAssertion.m" lineNumber:41 description:@"use initWithAssertionName:..."];

  return 0;
}

- (void)dealloc
{
  [(SBSAssertion *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBSAssertion;
  [(SBSAssertion *)&v3 dealloc];
}

- (void)invalidate
{
}

- (BOOL)isValid
{
  return [(BSMachPortReceiveRight *)self->_receiveRight isValid];
}

- (void)addHandler:(id)a3 forDeathOfServerPort:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  id v8 = (void *)MEMORY[0x1E4F4F7E0];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __48__SBSAssertion_addHandler_forDeathOfServerPort___block_invoke;
  v10[3] = &unk_1E566D6B0;
  objc_copyWeak(&v12, &location);
  id v9 = v6;
  id v11 = v9;
  [v8 monitorSendRight:v7 withHandler:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __48__SBSAssertion_addHandler_forDeathOfServerPort___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained isValid]) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (NSString)assertionName
{
  return self->_assertionName;
}

- (NSString)reason
{
  return self->_reason;
}

- (BSMachPortReceiveRight)receiveRight
{
  return self->_receiveRight;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiveRight, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_assertionName, 0);
}

@end