@interface PXFloatingCardPresentationController
- (BOOL)isPresenting;
- (PXFloatingCardContainer)containerViewController;
- (PXFloatingCardGestureCoordinator)gestureCoordinator;
- (PXFloatingCardLayout)layout;
- (PXFloatingCardPresentationController)initWithContainerViewController:(id)a3;
- (PXFloatingCardPresentationControllerDelegate)delegate;
- (PXFloatingCardViewController)cardViewController;
- (double)availableHeightForCardViewController:(id)a3;
- (void)_addChildViewController:(id)a3 toParentViewController:(id)a4;
- (void)_applyLayout;
- (void)_removeChildViewControllerFromParent:(id)a3;
- (void)cardViewController:(id)a3 didUpdateHeight:(double)a4;
- (void)cardViewController:(id)a3 didUpdatePosition:(unint64_t)a4;
- (void)dimAnimated:(BOOL)a3;
- (void)dismissAnimated:(BOOL)a3;
- (void)floatingCardViewControllerDismissTapped:(id)a3;
- (void)gestureCoordinatorDidBeginInteraction:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4;
- (void)setCardViewController:(id)a3;
- (void)setContainerViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setGestureCoordinator:(id)a3;
- (void)setIsPresenting:(BOOL)a3;
- (void)setLayout:(id)a3;
- (void)setLayout:(id)a3 animated:(BOOL)a4;
@end

@implementation PXFloatingCardPresentationController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureCoordinator, 0);
  objc_destroyWeak((id *)&self->_cardViewController);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layout, 0);
}

- (void)setGestureCoordinator:(id)a3
{
}

- (PXFloatingCardGestureCoordinator)gestureCoordinator
{
  return self->_gestureCoordinator;
}

- (void)setCardViewController:(id)a3
{
}

- (PXFloatingCardViewController)cardViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cardViewController);
  return (PXFloatingCardViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (PXFloatingCardContainer)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  return (PXFloatingCardContainer *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PXFloatingCardPresentationControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFloatingCardPresentationControllerDelegate *)WeakRetained;
}

- (void)setLayout:(id)a3
{
}

- (PXFloatingCardLayout)layout
{
  return self->_layout;
}

- (void)setIsPresenting:(BOOL)a3
{
  self->_isPresenting = a3;
}

- (BOOL)isPresenting
{
  return self->_isPresenting;
}

- (void)floatingCardViewControllerDismissTapped:(id)a3
{
  id v4 = a3;
  id v5 = [(PXFloatingCardPresentationController *)self delegate];
  [v5 presentationController:self dismissTappedForViewController:v4];
}

- (void)cardViewController:(id)a3 didUpdatePosition:(unint64_t)a4
{
  id v5 = [(PXFloatingCardPresentationController *)self layout];
  [v5 didUpdateCardPosition:a4];
}

- (void)cardViewController:(id)a3 didUpdateHeight:(double)a4
{
  id v5 = [(PXFloatingCardPresentationController *)self layout];
  [v5 didUpdateCardHeight:a4];
}

- (void)gestureCoordinatorDidBeginInteraction:(id)a3
{
  id v5 = [(PXFloatingCardPresentationController *)self containerViewController];
  v3 = [v5 view];
  id v4 = [v3 window];
  [v4 endEditing:1];
}

- (double)availableHeightForCardViewController:(id)a3
{
  v3 = [(PXFloatingCardPresentationController *)self containerViewController];
  id v4 = [v3 view];
  id v5 = [v4 safeAreaLayoutGuide];

  [v5 layoutFrame];
  double v7 = v6 + -30.0;

  return v7;
}

- (void)_removeChildViewControllerFromParent:(id)a3
{
  id v4 = a3;
  [v4 willMoveToParentViewController:0];
  v3 = [v4 view];
  [v3 removeFromSuperview];

  [v4 removeFromParentViewController];
}

- (void)_addChildViewController:(id)a3 toParentViewController:(id)a4
{
  id v5 = a4;
  id v8 = a3;
  [v5 addChildViewController:v8];
  double v6 = [v5 view];
  double v7 = [v8 view];
  [v6 addSubview:v7];

  [v8 didMoveToParentViewController:v5];
}

- (void)setLayout:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = (PXFloatingCardLayout *)a3;
  if (self->_layout != v7)
  {
    objc_storeStrong((id *)&self->_layout, a3);
    id v8 = [(PXFloatingCardPresentationController *)self gestureCoordinator];
    [v8 setLayout:v7];

    if (v4)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __59__PXFloatingCardPresentationController_setLayout_animated___block_invoke;
      v9[3] = &unk_1E5DD36F8;
      v9[4] = self;
      [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v9 options:0 animations:0.25 completion:0.0];
    }
    else
    {
      [(PXFloatingCardPresentationController *)self _applyLayout];
    }
  }
}

uint64_t __59__PXFloatingCardPresentationController_setLayout_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _applyLayout];
}

- (void)dimAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = [(PXFloatingCardPresentationController *)self cardViewController];
  id v5 = v4;
  if (v4)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __52__PXFloatingCardPresentationController_dimAnimated___block_invoke;
    aBlock[3] = &unk_1E5DD36F8;
    id v12 = v4;
    double v6 = (void (**)(void))_Block_copy(aBlock);
    double v7 = v6;
    if (v3)
    {
      id v8 = (void *)MEMORY[0x1E4FB1EB0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__PXFloatingCardPresentationController_dimAnimated___block_invoke_2;
      v9[3] = &unk_1E5DD3128;
      v10 = v6;
      [v8 animateWithDuration:v9 animations:0.25];
    }
    else
    {
      v6[2](v6);
    }
  }
}

void __52__PXFloatingCardPresentationController_dimAnimated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  [v1 setAlpha:0.699999988];
}

uint64_t __52__PXFloatingCardPresentationController_dimAnimated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(PXFloatingCardPresentationController *)self isPresenting])
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2 object:self file:@"PXFloatingCardPresentationController.m" lineNumber:86 description:@"Attempting to dismiss a floating card while one is not presented."];
  }
  [(PXFloatingCardPresentationController *)self setIsPresenting:0];
  double v6 = [(PXFloatingCardPresentationController *)self cardViewController];

  if (v6)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke;
    aBlock[3] = &unk_1E5DD36F8;
    void aBlock[4] = self;
    double v7 = _Block_copy(aBlock);
    id v8 = v7;
    if (v3)
    {
      v9 = [(PXFloatingCardPresentationController *)self cardViewController];
      v10 = [v9 view];
      [v10 frame];
      uint64_t v12 = v11;
      double v14 = v13;
      uint64_t v16 = v15;
      uint64_t v18 = v17;

      v19 = (void *)MEMORY[0x1E4FB1EB0];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke_2;
      v23[3] = &unk_1E5DD3630;
      v23[4] = self;
      v23[5] = v12;
      *(double *)&v23[6] = v14 + -15.0;
      v23[7] = v16;
      v23[8] = v18;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke_3;
      v21[3] = &unk_1E5DCCA98;
      id v22 = v8;
      [v19 animateWithDuration:0 delay:v23 options:v21 animations:0.25 completion:0.0];
    }
    else
    {
      (*((void (**)(void *))v7 + 2))(v7);
    }
  }
}

uint64_t __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 cardViewController];
  [v2 _removeChildViewControllerFromParent:v3];

  [*(id *)(a1 + 32) setCardViewController:0];
  BOOL v4 = *(void **)(a1 + 32);
  return [v4 setGestureCoordinator:0];
}

void __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) cardViewController];
  BOOL v3 = [v2 view];
  [v3 setAlpha:0.0];

  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  id v9 = [*(id *)(a1 + 32) cardViewController];
  id v8 = [v9 view];
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);
}

uint64_t __56__PXFloatingCardPresentationController_dismissAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_applyLayout
{
  BOOL v3 = [(PXFloatingCardPresentationController *)self layout];
  [v3 width];
  double v5 = v4;
  [v3 initialHeight];
  double v7 = v6;
  id v8 = [(PXFloatingCardPresentationController *)self cardViewController];
  objc_msgSend(v8, "setSize:", v5, v7);

  id v9 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __52__PXFloatingCardPresentationController__applyLayout__block_invoke;
  uint64_t v17 = &unk_1E5DD32A8;
  uint64_t v18 = self;
  id v19 = v3;
  id v10 = v3;
  [v9 performWithoutAnimation:&v14];
  uint64_t v11 = [(PXFloatingCardPresentationController *)self cardViewController];
  uint64_t v12 = [v11 view];
  [v12 setAutoresizingMask:33];

  double v13 = [(PXFloatingCardPresentationController *)self gestureCoordinator];
  [v13 layoutDidChange];
}

void __52__PXFloatingCardPresentationController__applyLayout__block_invoke(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) gestureCoordinator];
  objc_msgSend(v8, "centerPointForPosition:", objc_msgSend(*(id *)(a1 + 40), "initialPosition"));
  double v3 = v2;
  double v5 = v4;
  double v6 = [*(id *)(a1 + 32) cardViewController];
  double v7 = [v6 view];
  objc_msgSend(v7, "setCenter:", v3, v5);
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  if ([(PXFloatingCardPresentationController *)self isPresenting])
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2 object:self file:@"PXFloatingCardPresentationController.m" lineNumber:45 description:@"Attempting to present a floating card while one is already being presented."];
  }
  [(PXFloatingCardPresentationController *)self setIsPresenting:1];
  id v8 = [[PXFloatingCardViewController alloc] initWithContentViewController:v7];
  [(PXFloatingCardViewController *)v8 setDelegate:self];
  [(PXFloatingCardPresentationController *)self setCardViewController:v8];
  if (v4) {
    double v9 = 0.0;
  }
  else {
    double v9 = 1.0;
  }
  id v10 = [(PXFloatingCardPresentationController *)self cardViewController];
  uint64_t v11 = [v10 view];
  [v11 setAlpha:v9];

  uint64_t v12 = [(PXFloatingCardPresentationController *)self containerViewController];
  [(PXFloatingCardPresentationController *)self _addChildViewController:v8 toParentViewController:v12];

  double v13 = [v7 view];

  uint64_t v14 = [v13 backgroundColor];
  uint64_t v15 = [(PXFloatingCardPresentationController *)self cardViewController];
  uint64_t v16 = [v15 grabberFooterView];
  [v16 setBackgroundColor:v14];

  uint64_t v17 = [PXFloatingCardGestureCoordinator alloc];
  uint64_t v18 = [(PXFloatingCardPresentationController *)self cardViewController];
  id v19 = [(PXFloatingCardPresentationController *)self layout];
  v20 = [(PXFloatingCardGestureCoordinator *)v17 initWithCardViewController:v18 layout:v19];
  [(PXFloatingCardPresentationController *)self setGestureCoordinator:v20];

  v21 = [(PXFloatingCardPresentationController *)self gestureCoordinator];
  [v21 setDelegate:self];

  [(PXFloatingCardPresentationController *)self _applyLayout];
  if (v4)
  {
    id v22 = [(PXFloatingCardPresentationController *)self cardViewController];
    v23 = [v22 view];
    [v23 frame];
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    CGFloat v31 = v30;

    v40.origin.double x = v25;
    v40.origin.double y = v27;
    v40.size.double width = v29;
    v40.size.double height = v31;
    CGRect v41 = CGRectOffset(v40, 0.0, -15.0);
    double x = v41.origin.x;
    double y = v41.origin.y;
    double width = v41.size.width;
    double height = v41.size.height;
    v36 = [(PXFloatingCardPresentationController *)self cardViewController];
    v37 = [v36 view];
    objc_msgSend(v37, "setFrame:", x, y, width, height);

    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __71__PXFloatingCardPresentationController_presentViewController_animated___block_invoke;
    v39[3] = &unk_1E5DD3630;
    v39[4] = self;
    *(CGFloat *)&v39[5] = v25;
    *(CGFloat *)&v39[6] = v27;
    *(CGFloat *)&v39[7] = v29;
    *(CGFloat *)&v39[8] = v31;
    [MEMORY[0x1E4FB1EB0] animateWithDuration:0 delay:v39 options:0 animations:0.25 completion:0.0];
  }
}

void __71__PXFloatingCardPresentationController_presentViewController_animated___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) cardViewController];
  double v3 = [v2 view];
  [v3 setAlpha:1.0];

  double v4 = *(double *)(a1 + 40);
  double v5 = *(double *)(a1 + 48);
  double v6 = *(double *)(a1 + 56);
  double v7 = *(double *)(a1 + 64);
  id v9 = [*(id *)(a1 + 32) cardViewController];
  id v8 = [v9 view];
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);
}

- (PXFloatingCardPresentationController)initWithContainerViewController:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PXFloatingCardPresentationController;
  double v5 = [(PXFloatingCardPresentationController *)&v8 init];
  double v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_containerViewController, v4);
  }

  return v6;
}

@end