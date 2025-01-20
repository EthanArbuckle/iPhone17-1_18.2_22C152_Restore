@interface RedeemFlowWrapper
+ (id)redeemViewControllerWithInitialCode:(id)a3;
@end

@implementation RedeemFlowWrapper

+ (id)redeemViewControllerWithInitialCode:(id)a3
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2050000000;
  v4 = (void *)getSKUIRedeemViewControllerClass_softClass;
  uint64_t v12 = getSKUIRedeemViewControllerClass_softClass;
  if (!getSKUIRedeemViewControllerClass_softClass)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = __getSKUIRedeemViewControllerClass_block_invoke;
    v8[3] = &unk_CCB698;
    v8[4] = &v9;
    __getSKUIRedeemViewControllerClass_block_invoke((uint64_t)v8);
    v4 = (void *)v10[3];
  }
  v5 = v4;
  _Block_object_dispose(&v9, 8);
  id v6 = [[v5 alloc] initWithRedeemCategory:1];
  [v6 setAttempsAutomaticRedeem:1];
  if (v3) {
    [v6 setInitialCode:v3];
  }

  return v6;
}

@end