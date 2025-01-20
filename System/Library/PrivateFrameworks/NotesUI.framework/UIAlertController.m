@interface UIAlertController
@end

@implementation UIAlertController

uint64_t __70__UIAlertController_IC__ic_showAlertWithTitle_message_viewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

@end