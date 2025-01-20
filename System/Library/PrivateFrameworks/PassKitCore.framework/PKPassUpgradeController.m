@interface PKPassUpgradeController
- (PKPassUpgradeController)initWithWebService:(id)a3;
- (void)dealloc;
@end

@implementation PKPassUpgradeController

- (PKPassUpgradeController)initWithWebService:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__PKPassUpgradeController_initWithWebService___block_invoke;
  v10[3] = &unk_1E56F4E58;
  v11 = self;
  id v5 = v4;
  id v12 = v5;
  v9.receiver = v11;
  v9.super_class = (Class)PKPassUpgradeController;
  v6 = [(PKPassUpgradeControllerBase *)&v9 initWithWebService:v5 addPaymentPassToLibrary:v10];
  if (v6)
  {
    v7 = [MEMORY[0x1E4F28C40] defaultCenter];
    [v7 addObserver:v6 selector:sel__handleScriptsExecutedNotification_ name:@"com.apple.stockholm.tsm.script.executed" object:0];
  }
  return v6;
}

void __46__PKPassUpgradeController_initWithWebService___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v6 = *(void **)(a1 + 32);
  id v7 = a2;
  v8 = [v6 paymentWebService];
  objc_super v9 = [v8 targetDevice];
  uint64_t v10 = *(void *)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __46__PKPassUpgradeController_initWithWebService___block_invoke_2;
  v12[3] = &unk_1E56D8B30;
  id v13 = v5;
  id v11 = v5;
  [v9 paymentWebService:v10 addPaymentPass:v7 withCompletionHandlerV2:v12];
}

void __46__PKPassUpgradeController_initWithWebService___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  if (v4)
  {
    id v6 = v3;
    if (v3)
    {
      (*(void (**)(uint64_t, void))(v4 + 16))(v4, 0);
    }
    else
    {
      id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPaymentErrorDomain" code:3 userInfo:0];
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
    }
    id v3 = v6;
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28C40] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPassUpgradeController;
  [(PKPassUpgradeController *)&v4 dealloc];
}

@end