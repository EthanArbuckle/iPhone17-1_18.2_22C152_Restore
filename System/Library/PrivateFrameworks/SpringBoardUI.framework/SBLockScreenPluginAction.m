@interface SBLockScreenPluginAction
+ (id)action;
+ (id)actionWithCompletion:(id)a3;
- (BOOL)isApplicationAction;
- (BOOL)isCallAction;
- (BOOL)isEmergencyDialerAction;
- (NSString)label;
- (SBLockScreenPluginAction)init;
- (SBLockScreenPluginAction)initWithCompletion:(id)a3;
- (id)completion;
- (int64_t)authenticationPolicy;
- (void)sendResponseWithSuccess:(BOOL)a3;
- (void)setAuthenticationPolicy:(int64_t)a3;
- (void)setLabel:(id)a3;
@end

@implementation SBLockScreenPluginAction

- (BOOL)isCallAction
{
  return 0;
}

+ (id)action
{
  return (id)[a1 actionWithCompletion:0];
}

+ (id)actionWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithCompletion:v4];

  return v5;
}

- (SBLockScreenPluginAction)init
{
  return [(SBLockScreenPluginAction *)self initWithCompletion:0];
}

- (SBLockScreenPluginAction)initWithCompletion:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBLockScreenPluginAction;
  v5 = [(SBLockScreenPluginAction *)&v17 init];
  v6 = v5;
  if (v4 && v5)
  {
    v7 = (void *)[v4 copy];
    uint64_t v8 = MEMORY[0x223C8BC20]();
    id completion = v6->_completion;
    v6->_id completion = (id)v8;

    id v10 = objc_alloc(MEMORY[0x263F29BB0]);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__SBLockScreenPluginAction_initWithCompletion___block_invoke;
    v15[3] = &unk_2645D41A0;
    id v16 = v7;
    id v11 = v7;
    uint64_t v12 = [v10 initWithInfo:0 timeout:MEMORY[0x263EF83A0] forResponseOnQueue:v15 withHandler:0.0];
    action = v6->_action;
    v6->_action = (BSAction *)v12;
  }
  return v6;
}

void __47__SBLockScreenPluginAction_initWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    id v3 = [a2 error];
    (*(void (**)(uint64_t, BOOL, void))(v2 + 16))(v2, [v3 code] == 0, 0);
  }
}

- (void)sendResponseWithSuccess:(BOOL)a3
{
  action = self->_action;
  objc_msgSend(MEMORY[0x263F29BC0], "response", a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(BSAction *)action sendResponse:v4];
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (int64_t)authenticationPolicy
{
  return self->_authenticationPolicy;
}

- (void)setAuthenticationPolicy:(int64_t)a3
{
  self->_authenticationPolicy = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (BOOL)isApplicationAction
{
  return 0;
}

- (BOOL)isEmergencyDialerAction
{
  return 0;
}

@end