@interface PKPaymentSetupController
+ (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4;
- (void)presentPaymentSetupRequest:(id)a3 completion:(id)a4;
@end

@implementation PKPaymentSetupController

+ (void)paymentSetupFeaturesForConfiguration:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F84898];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 sharedInstance];
  [v8 paymentSetupFeaturesForConfiguration:v7 completion:v6];
}

- (void)presentPaymentSetupRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  if (PKIsPad())
  {
    id v7 = NSNumber;
    id v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    v9 = [v8 windows];
    v10 = [v9 firstObject];
    v11 = [v10 windowScene];
    objc_msgSend(v7, "numberWithInteger:", objc_msgSend(v11, "interfaceOrientation"));
    id v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v13 = &unk_1EF2B9930;
  }
  v12 = [MEMORY[0x1E4F84898] sharedInstance];
  [v12 presentPaymentSetupRequest:v6 orientation:v13 completion:v5];
}

@end