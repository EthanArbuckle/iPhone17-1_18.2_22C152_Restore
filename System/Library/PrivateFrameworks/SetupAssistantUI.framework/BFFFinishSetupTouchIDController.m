@interface BFFFinishSetupTouchIDController
+ (id)finishSetupTouchIDController;
- (BFFFinishSetupTouchIDController)init;
- (id)createViewControllerWithPasscode:(id)a3 completion:(id)a4;
@end

@implementation BFFFinishSetupTouchIDController

+ (id)finishSetupTouchIDController
{
  v2 = objc_alloc_init(BFFFinishSetupTouchIDController);
  return v2;
}

- (BFFFinishSetupTouchIDController)init
{
  uint64_t v2 = *MEMORY[0x263F67FA8];
  v4.receiver = self;
  v4.super_class = (Class)BFFFinishSetupTouchIDController;
  return [(BFFFinishSetupBiometricAndPasscodeController *)&v4 initWithFlowSkipIdentifier:v2];
}

- (id)createViewControllerWithPasscode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = objc_alloc_init(BFFFinishSetupTouchIDViewController);
  [(BFFFinishSetupTouchIDViewController *)v8 setPasscode:v6];
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __79__BFFFinishSetupTouchIDController_createViewControllerWithPasscode_completion___block_invoke;
  v11[3] = &unk_26454AD68;
  objc_copyWeak(&v13, &location);
  id v9 = v7;
  id v12 = v9;
  [(BFFFinishSetupTouchIDViewController *)v8 setCompletion:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

  return v8;
}

void __79__BFFFinishSetupTouchIDController_createViewControllerWithPasscode_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v10 = a2;
  CFPreferencesSetValue(@"Mesa2Presented", (CFPropertyListRef)*MEMORY[0x263EFFB40], (CFStringRef)*MEMORY[0x263F67FC0], (CFStringRef)*MEMORY[0x263EFFE70], (CFStringRef)*MEMORY[0x263EFFE68]);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained paneFeatureAnalyticsManager];
    v8 = [NSNumber numberWithInt:a3 == 0];
    [v7 recordActionWithValue:v8 forFeature:12];
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, uint64_t))(v9 + 16))(v9, v10, a3);
  }
}

@end