@interface UIAlertControllerTextFieldViewController
@end

@implementation UIAlertControllerTextFieldViewController

uint64_t __60___UIAlertControllerTextFieldViewController_viewWillAppear___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) becomeFirstResponder];
}

void __65___UIAlertControllerTextFieldViewController_updateTextFieldStyle__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v12 = a2;
  v5 = [v12 containerView];

  if (!v5)
  {
    unint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = 2;
    if (v6 - 1 == a3) {
      uint64_t v7 = 3;
    }
    if (!a3) {
      uint64_t v7 = 1;
    }
    if (v6 >= 2) {
      uint64_t v8 = v7;
    }
    else {
      uint64_t v8 = 0;
    }
    v9 = [*(id *)(a1 + 32) container];
    v10 = [v12 textField];
    v11 = [v9 _textFieldContainingViewWithTextField:v10 position:v8];
    [v12 setContainerView:v11];
  }
}

@end