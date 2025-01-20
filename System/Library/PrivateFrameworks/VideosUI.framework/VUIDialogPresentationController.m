@interface VUIDialogPresentationController
- (CGSize)modalSize;
- (UIVisualEffectView)backdropView;
- (VUIDialogPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (id)completedAnimationBlock;
- (int64_t)presentationStyle;
- (void)_layoutPresentedView;
- (void)_tapGesture:(id)a3;
- (void)dealloc;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setCompletedAnimationBlock:(id)a3;
- (void)setModalSize:(CGSize)a3;
@end

@implementation VUIDialogPresentationController

- (VUIDialogPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)VUIDialogPresentationController;
  v4 = [(VUIDialogPresentationController *)&v8 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v4 action:sel__tapGesture_];
    v6 = [(VUIDialogPresentationController *)v4 backdropView];
    [v6 addGestureRecognizer:v5];
  }
  return v4;
}

- (void)dealloc
{
  v3 = [(VUIDialogPresentationController *)self backdropView];
  [v3 removeAllGestureRecognizers];

  v4.receiver = self;
  v4.super_class = (Class)VUIDialogPresentationController;
  [(VUIDialogPresentationController *)&v4 dealloc];
}

- (int64_t)presentationStyle
{
  return 5;
}

- (void)presentationTransitionWillBegin
{
  v14.receiver = self;
  v14.super_class = (Class)VUIDialogPresentationController;
  [(VUIDialogPresentationController *)&v14 presentationTransitionWillBegin];
  v3 = [(VUIDialogPresentationController *)self presentedView];
  [v3 _setContinuousCornerRadius:16.0];

  objc_super v4 = [(VUIDialogPresentationController *)self presentedView];
  [v4 setClipsToBounds:1];

  v5 = [(VUIDialogPresentationController *)self containerView];
  v6 = [(VUIDialogPresentationController *)self backdropView];
  [v5 addSubview:v6];

  v7 = [(VUIDialogPresentationController *)self backdropView];
  [v7 setAutoresizingMask:18];

  objc_super v8 = [(VUIDialogPresentationController *)self backdropView];
  v9 = [MEMORY[0x1E4FB1618] clearColor];
  [v8 setBackgroundColor:v9];

  v10 = [(VUIDialogPresentationController *)self backdropView];
  v11 = [(VUIDialogPresentationController *)self containerView];
  [v11 bounds];
  objc_msgSend(v10, "setFrame:");

  [(VUIDialogPresentationController *)self _layoutPresentedView];
  v12 = [(VUIDialogPresentationController *)self presentedViewController];
  v13 = [v12 transitionCoordinator];
  [v13 animateAlongsideTransition:0 completion:&__block_literal_global_145];
}

uint64_t __66__VUIDialogPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    v3 = (void *)MEMORY[0x1E4FB1F48];
    return [v3 _synchronizeDrawing];
  }
  return result;
}

- (void)dismissalTransitionWillBegin
{
  v5.receiver = self;
  v5.super_class = (Class)VUIDialogPresentationController;
  [(VUIDialogPresentationController *)&v5 dismissalTransitionWillBegin];
  v3 = [(VUIDialogPresentationController *)self presentedViewController];
  objc_super v4 = [v3 transitionCoordinator];
  [v4 animateAlongsideTransition:0 completion:&__block_literal_global_12_1];
}

uint64_t __63__VUIDialogPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if ((result & 1) == 0)
  {
    v3 = (void *)MEMORY[0x1E4FB1F48];
    return [v3 _synchronizeDrawing];
  }
  return result;
}

- (UIVisualEffectView)backdropView
{
  backdropView = self->_backdropView;
  if (!backdropView)
  {
    objc_super v4 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:0];
    objc_super v5 = self->_backdropView;
    self->_backdropView = v4;

    backdropView = self->_backdropView;
  }
  return backdropView;
}

- (void)_layoutPresentedView
{
  id v20 = [(VUIDialogPresentationController *)self presentedView];
  [(VUIDialogPresentationController *)self modalSize];
  double v4 = v3;
  double v6 = v5;
  v7 = [(VUIDialogPresentationController *)self containerView];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  double v13 = v12;
  double v15 = v14;

  v22.origin.x = v9;
  v22.origin.y = v11;
  v22.size.width = v13;
  v22.size.height = v15;
  double v16 = CGRectGetWidth(v22) + -33.0;
  v23.origin.x = v9;
  v23.origin.y = v11;
  v23.size.width = v13;
  v23.size.height = v15;
  double v17 = CGRectGetHeight(v23) + -33.0;
  if (v16 >= v4) {
    double v18 = v4;
  }
  else {
    double v18 = v16;
  }
  if (v17 >= v6) {
    double v19 = v6;
  }
  else {
    double v19 = v17;
  }
  objc_msgSend(v20, "setFrame:", (v13 - v18) * 0.5, (v15 - v19) * 0.5);
}

- (void)_tapGesture:(id)a3
{
  id v3 = [(VUIDialogPresentationController *)self presentedViewController];
  [v3 dismissViewControllerAnimated:1 completion:0];
}

- (CGSize)modalSize
{
  double width = self->_modalSize.width;
  double height = self->_modalSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setModalSize:(CGSize)a3
{
  self->_modalSize = a3;
}

- (id)completedAnimationBlock
{
  return self->_completedAnimationBlock;
}

- (void)setCompletedAnimationBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completedAnimationBlock, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end