@interface CACElementActionsPresentationViewController
+ (BOOL)canShowElementActionsForElement:(id)a3;
+ (id)_elementActionManager;
- (BOOL)_canShowWhileLocked;
- (BOOL)isOverlay;
- (CACElementActionsPresentationViewController)init;
- (CACElementActionsPresentationViewControllerDelegate)elementActionsDelegate;
- (CGRect)sourceRect;
- (UIAlertController)alertController;
- (id)actionForAXAction:(id)a3;
- (int64_t)zOrder;
- (void)performHideWithCompletion:(id)a3;
- (void)prepareForPopoverPresentation:(id)a3;
- (void)setAlertController:(id)a3;
- (void)setElement:(id)a3;
- (void)setElementActionsDelegate:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CACElementActionsPresentationViewController

- (CACElementActionsPresentationViewController)init
{
  v9.receiver = self;
  v9.super_class = (Class)CACElementActionsPresentationViewController;
  v2 = [(CACElementActionsPresentationViewController *)&v9 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F82418];
    v4 = +[CACLocaleUtilities localizedUIStringForKey:@"ElementActions"];
    uint64_t v5 = [v3 alertControllerWithTitle:v4 message:0 preferredStyle:0];
    alertController = v2->_alertController;
    v2->_alertController = (UIAlertController *)v5;

    v7 = [(UIAlertController *)v2->_alertController popoverPresentationController];
    [v7 setDelegate:v2];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CACElementActionsPresentationViewController;
  [(CACElementActionsPresentationViewController *)&v5 viewDidAppear:a3];
  v4 = [(CACElementActionsPresentationViewController *)self alertController];
  [(CACElementActionsPresentationViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = [(CACElementActionsPresentationViewController *)self alertController];
  [v5 dismissViewControllerAnimated:1 completion:0];

  v6.receiver = self;
  v6.super_class = (Class)CACElementActionsPresentationViewController;
  [(CACElementActionsPresentationViewController *)&v6 viewWillDisappear:v3];
}

+ (id)_elementActionManager
{
  if (_elementActionManager_onceToken_0 != -1) {
    dispatch_once(&_elementActionManager_onceToken_0, &__block_literal_global_23);
  }
  v2 = (void *)_elementActionManager_sElementActionManager_0;
  return v2;
}

void __68__CACElementActionsPresentationViewController__elementActionManager__block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263F22250]);
  id v3 = +[CACAXDragManager sharedManager];
  uint64_t v1 = [v0 initWithDragManager:v3];
  v2 = (void *)_elementActionManager_sElementActionManager_0;
  _elementActionManager_sElementActionManager_0 = v1;
}

+ (BOOL)canShowElementActionsForElement:(id)a3
{
  id v4 = a3;
  objc_super v5 = [a1 _elementActionManager];
  char v6 = [v5 canShowActionsForElement:v4];

  return v6;
}

- (void)setElement:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_element, a3);
  char v6 = [(id)objc_opt_class() _elementActionManager];
  v7 = [v6 actionsForElement:v5];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [(CACElementActionsPresentationViewController *)self actionForAXAction:*(void *)(*((void *)&v20 + 1) + 8 * v12)];
        v14 = [(CACElementActionsPresentationViewController *)self alertController];
        [v14 addAction:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }

  v15 = (void *)MEMORY[0x263F82400];
  v16 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Cancel"];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __58__CACElementActionsPresentationViewController_setElement___block_invoke;
  v19[3] = &unk_264D115F8;
  v19[4] = self;
  v17 = [v15 actionWithTitle:v16 style:1 handler:v19];

  v18 = [(CACElementActionsPresentationViewController *)self alertController];
  [v18 addAction:v17];
}

uint64_t __58__CACElementActionsPresentationViewController_setElement___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performHideWithCompletion:0];
}

- (id)actionForAXAction:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F82400];
  char v6 = [v4 name];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke;
  v10[3] = &unk_264D11620;
  v10[4] = self;
  id v11 = v4;
  id v7 = v4;
  id v8 = [v5 actionWithTitle:v6 style:0 handler:v10];

  return v8;
}

void __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke_2;
  v5[3] = &unk_264D117C0;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  [v2 performHideWithCompletion:v5];
}

void __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) type] == 2)
  {
    dispatch_time_t v2 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke_3;
    block[3] = &unk_264D117C0;
    *(_OWORD *)uint64_t v4 = *(_OWORD *)(a1 + 32);
    id v3 = v4[0];
    int8x16_t v7 = vextq_s8(*(int8x16_t *)v4, *(int8x16_t *)v4, 8uLL);
    dispatch_after(v2, MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v5 = [(id)objc_opt_class() _elementActionManager];
    [v5 performAction:*(void *)(a1 + 32)];
  }
}

void __65__CACElementActionsPresentationViewController_actionForAXAction___block_invoke_3(uint64_t a1)
{
  id v2 = [(id)objc_opt_class() _elementActionManager];
  [v2 performAction:*(void *)(a1 + 40)];
}

- (void)prepareForPopoverPresentation:(id)a3
{
  id v4 = a3;
  id v5 = [(CACElementActionsPresentationViewController *)self view];
  [v4 setSourceView:v5];

  [v4 setCanOverlapSourceViewRect:1];
  [(CACElementActionsPresentationViewController *)self sourceRect];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  id v14 = [(CACElementActionsPresentationViewController *)self view];
  objc_msgSend(v4, "setSourceRect:", CACViewRectFromPortraitUpRect(v14, v7, v9, v11, v13));
}

- (int64_t)zOrder
{
  return 6;
}

- (BOOL)isOverlay
{
  return 0;
}

- (void)performHideWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CACElementActionsPresentationViewController *)self elementActionsDelegate];
  [v5 elementActionsPresentationViewController:self hideWithCompletion:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CACElementActionsPresentationViewControllerDelegate)elementActionsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementActionsDelegate);
  return (CACElementActionsPresentationViewControllerDelegate *)WeakRetained;
}

- (void)setElementActionsDelegate:(id)a3
{
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_destroyWeak((id *)&self->_elementActionsDelegate);
  objc_storeStrong((id *)&self->_element, 0);
}

@end