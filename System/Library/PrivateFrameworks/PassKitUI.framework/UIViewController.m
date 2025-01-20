@interface UIViewController
@end

@implementation UIViewController

uint64_t __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) navigationController];
    objc_msgSend(v2, "_pk_popToViewController:animated:", *(void *)(a1 + 32), 0);
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke_2(uint64_t a1)
{
}

void __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke_3(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 60) && (uint64_t v2 = *(unsigned int *)(a1 + 56), v2)) {
    [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) withTransition:v2 completion:0];
  }
  else {
    [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 60) != 0 completion:0];
  }
  v3 = [*(id *)(a1 + 32) transitionCoordinator];
  if (v3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke_4;
    v4[3] = &unk_1E59D04E8;
    id v5 = *(id *)(a1 + 48);
    [v3 animateAlongsideTransition:0 completion:v4];
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

uint64_t __139__UIViewController_PKPaymentSetupProtocols___pk_presentViewController_animated_transition_popToViewControllerAfterPresentation_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end