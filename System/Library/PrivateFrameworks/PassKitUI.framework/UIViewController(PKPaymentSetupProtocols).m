@interface UIViewController(PKPaymentSetupProtocols)
- (uint64_t)pk_paymentSetupSetHideSetupLaterButton:()PKPaymentSetupProtocols;
- (uint64_t)pk_presentViewController:()PKPaymentSetupProtocols animated:popToViewControllerAfterPresentation:completion:;
- (uint64_t)pk_presentViewController:()PKPaymentSetupProtocols transition:popToViewControllerAfterPresentation:completion:;
- (void)_pk_presentViewController:()PKPaymentSetupProtocols animated:transition:popToViewControllerAfterPresentation:completion:;
- (void)pk_paymentSetupPreflight:()PKPaymentSetupProtocols;
@end

@implementation UIViewController(PKPaymentSetupProtocols)

- (uint64_t)pk_paymentSetupSetHideSetupLaterButton:()PKPaymentSetupProtocols
{
  uint64_t result = [a1 conformsToProtocol:&unk_1EF304FF8];
  if (result)
  {
    return [a1 setHideSetupLaterButton:a3];
  }
  return result;
}

- (void)pk_paymentSetupPreflight:()PKPaymentSetupProtocols
{
  v4 = a3;
  if ([a1 conformsToProtocol:&unk_1EF2FFE08]) {
    [a1 preflightWithCompletion:v4];
  }
  else {
    v4[2](v4, 1);
  }
}

- (uint64_t)pk_presentViewController:()PKPaymentSetupProtocols animated:popToViewControllerAfterPresentation:completion:
{
  return objc_msgSend(a1, "_pk_presentViewController:animated:transition:popToViewControllerAfterPresentation:completion:", a3, a4, 0, a5, a6);
}

- (uint64_t)pk_presentViewController:()PKPaymentSetupProtocols transition:popToViewControllerAfterPresentation:completion:
{
  return objc_msgSend(a1, "_pk_presentViewController:animated:transition:popToViewControllerAfterPresentation:completion:", a3, 1, a4, a5, a6);
}

- (void)_pk_presentViewController:()PKPaymentSetupProtocols animated:transition:popToViewControllerAfterPresentation:completion:
{
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke;
  aBlock[3] = &unk_1E59CE110;
  id v30 = v13;
  uint64_t v31 = a1;
  id v32 = v14;
  id v15 = v14;
  id v16 = v13;
  v17 = _Block_copy(aBlock);
  v18 = dispatch_group_create();
  dispatch_group_enter(v18);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke_2;
  v27[3] = &unk_1E59CB6D8;
  v28 = v18;
  v19 = v18;
  objc_msgSend(v12, "pk_paymentSetupPreflight:", v27);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke_3;
  v22[3] = &unk_1E59D0510;
  char v26 = a4;
  int v25 = a5;
  v22[4] = a1;
  id v23 = v12;
  id v24 = v17;
  id v20 = v17;
  id v21 = v12;
  dispatch_group_notify(v19, MEMORY[0x1E4F14428], v22);
}

@end