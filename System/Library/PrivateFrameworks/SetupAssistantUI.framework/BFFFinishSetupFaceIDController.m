@interface BFFFinishSetupFaceIDController
+ (id)finishSetupFaceIDController;
- (BFFFinishSetupFaceIDController)init;
- (id)createViewControllerWithPasscode:(id)a3 completion:(id)a4;
- (void)performExtendedInitializationWithCompletion:(id)a3;
@end

@implementation BFFFinishSetupFaceIDController

+ (id)finishSetupFaceIDController
{
  v2 = objc_alloc_init(BFFFinishSetupFaceIDController);
  return v2;
}

- (BFFFinishSetupFaceIDController)init
{
  uint64_t v2 = *MEMORY[0x263F67F90];
  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupFaceIDController;
  return [(BFFFinishSetupBiometricAndPasscodeController *)&v4 initWithFlowSkipIdentifier:v2];
}

- (void)performExtendedInitializationWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(BFFFinishSetupFaceIDViewController);
  viewController = self->_viewController;
  self->_viewController = v5;

  v7 = self->_viewController;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __78__BFFFinishSetupFaceIDController_performExtendedInitializationWithCompletion___block_invoke;
  v9[3] = &unk_26454B058;
  id v10 = v4;
  id v8 = v4;
  [(BFFFaceIDViewController *)v7 performExtendedInitializationWithCompletion:v9];
}

void __78__BFFFinishSetupFaceIDController_performExtendedInitializationWithCompletion___block_invoke(uint64_t a1, int a2)
{
  v6[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  if (a2)
  {
    v3 = *(void (**)(uint64_t, uint64_t, void))(v2 + 16);
    uint64_t v4 = *(void *)(a1 + 32);
    v3(v4, 1, 0);
  }
  else
  {
    v6[0] = *MEMORY[0x263F67F90];
    v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:1];
    (*(void (**)(uint64_t, void, void *))(v2 + 16))(v2, 0, v5);
  }
}

- (id)createViewControllerWithPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BFFFinishSetupFaceIDViewController *)self->_viewController setPasscode:v6];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __78__BFFFinishSetupFaceIDController_createViewControllerWithPasscode_completion___block_invoke;
  v11[3] = &unk_26454AD68;
  objc_copyWeak(&v13, &location);
  id v8 = v7;
  id v12 = v8;
  [(BFFFinishSetupFaceIDViewController *)self->_viewController setCompletion:v11];
  v9 = self->_viewController;

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v9;
}

void __78__BFFFinishSetupFaceIDController_createViewControllerWithPasscode_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    if (a3)
    {
      id v7 = &unk_26D1D8588;
    }
    else
    {
      id v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(WeakRetained[7], "enrollmentConfiguration") + 1000);
    }
    id v8 = [v6 paneFeatureAnalyticsManager];
    [v8 recordActionWithValue:v7 forFeature:13];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, v10, a3);
  }
}

- (void).cxx_destruct
{
}

@end