@interface WTUISceneHostingActivationController
- (BSAction)startupAction;
- (WTUISceneHostingActivationController)initWithStartupAction:(id)a3 invalidationHandler:(id)a4;
- (_UISceneHostingActivationHandle)activationHandle;
- (id)invalidationHandler;
- (void)activationHandleDidUpdate:(id)a3 forHostingController:(id)a4;
- (void)endManagingHostedSceneActivationForHostingController:(id)a3;
- (void)hostingController:(id)a3 isMovingToParentScene:(id)a4;
- (void)setActivationHandle:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setStartupAction:(id)a3;
@end

@implementation WTUISceneHostingActivationController

- (WTUISceneHostingActivationController)initWithStartupAction:(id)a3 invalidationHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)WTUISceneHostingActivationController;
  v9 = [(WTUISceneHostingActivationController *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_startupAction, a3);
    uint64_t v11 = MEMORY[0x263E4F630](v8);
    id invalidationHandler = v10->_invalidationHandler;
    v10->_id invalidationHandler = (id)v11;
  }
  return v10;
}

- (void)endManagingHostedSceneActivationForHostingController:(id)a3
{
}

- (void)hostingController:(id)a3 isMovingToParentScene:(id)a4
{
  v6 = [(WTUISceneHostingActivationController *)self activationHandle];
  char v7 = [v6 isActive];

  if (a4)
  {
    if ((v7 & 1) == 0)
    {
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __80__WTUISceneHostingActivationController_hostingController_isMovingToParentScene___block_invoke;
      v10[3] = &unk_26558E960;
      v10[4] = self;
      id v8 = (void *)MEMORY[0x263E4F630](v10);
      v9 = [(WTUISceneHostingActivationController *)self activationHandle];
      [v9 activate:v8];
    }
  }
}

void __80__WTUISceneHostingActivationController_hostingController_isMovingToParentScene___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x263EFFA08];
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v6 = [v3 startupAction];
  v5 = [v2 setWithObject:v6];
  [v4 setActions:v5];
}

- (void)activationHandleDidUpdate:(id)a3 forHostingController:(id)a4
{
  id v9 = a4;
  v5 = [(WTUISceneHostingActivationController *)self activationHandle];
  char v6 = [v5 isActive];

  if ((v6 & 1) == 0)
  {
    char v7 = [(WTUISceneHostingActivationController *)self invalidationHandler];

    if (v7)
    {
      id v8 = [(WTUISceneHostingActivationController *)self invalidationHandler];
      v8[2]();
    }
    [v9 invalidate];
  }
}

- (_UISceneHostingActivationHandle)activationHandle
{
  return (_UISceneHostingActivationHandle *)objc_getProperty(self, a2, 8, 1);
}

- (void)setActivationHandle:(id)a3
{
}

- (BSAction)startupAction
{
  return (BSAction *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStartupAction:(id)a3
{
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_startupAction, 0);

  objc_storeStrong((id *)&self->_activationHandle, 0);
}

@end