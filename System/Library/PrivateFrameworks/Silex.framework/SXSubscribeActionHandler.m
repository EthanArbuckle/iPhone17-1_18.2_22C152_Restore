@interface SXSubscribeActionHandler
- (void)handleSubscribeActionOnPresenter:(id)a3 completionBlock:(id)a4;
- (void)handleSubscribeActionOnPresenter:(id)a3 inAppPurchaseIdKey:(id)a4 completionBlock:(id)a5;
@end

@implementation SXSubscribeActionHandler

- (void)handleSubscribeActionOnPresenter:(id)a3 completionBlock:(id)a4
{
  v9 = (void (**)(id, void))a4;
  v5 = (void *)MEMORY[0x263F1C3F8];
  id v6 = a3;
  v7 = [v5 alertControllerWithTitle:@"Failed To Subscribe" message:&stru_26D5311C0 preferredStyle:1];
  v8 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
  [v7 addAction:v8];
  [v6 presentViewController:v7 animated:1];

  if (v9) {
    v9[2](v9, 0);
  }
}

- (void)handleSubscribeActionOnPresenter:(id)a3 inAppPurchaseIdKey:(id)a4 completionBlock:(id)a5
{
  v10 = (void (**)(id, void))a5;
  id v6 = (void *)MEMORY[0x263F1C3F8];
  id v7 = a3;
  v8 = [v6 alertControllerWithTitle:@"Failed To Subscribe with specific IAP" message:&stru_26D5311C0 preferredStyle:1];
  v9 = [MEMORY[0x263F1C3F0] actionWithTitle:@"OK" style:0 handler:0];
  [v8 addAction:v9];
  [v7 presentViewController:v8 animated:1];

  if (v10) {
    v10[2](v10, 0);
  }
}

@end