@interface WFCompactPlatterPresentationController
+ (CGRect)presentedViewFrameInContainerView:(id)a3 containerViewSize:(CGSize)a4 withSizeCalculation:(BOOL)a5 ofPresentedPlatter:(id)a6;
+ (CGRect)usableFrameForPresentingInContainerViewOfSize:(CGSize)a3;
+ (CGSize)preferredSizeForPresentingInContainerViewOfSize:(CGSize)a3;
- (BOOL)_containerIgnoresDirectTouchEvents;
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (CGRect)frameOfDismissedViewInContainerView;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGRect)presentedViewFrameInContainerViewOfSize:(CGSize)a3 withSizeCalculation:(BOOL)a4;
- (UIViewControllerTransitionCoordinator)activeTransitionCoordinator;
- (WFCompactPlatterPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (double)maximumExpectedHeightForPlatterPresentation:(id)a3;
- (int64_t)transitionState;
- (void)dealloc;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)keyboardWillChange;
- (void)platterPresentationDidInvalidateSize:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setActiveTransitionCoordinator:(id)a3;
- (void)setTransitionState:(int64_t)a3;
- (void)updatePresentedViewFrameAnimatedAlongsideKeyboard:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WFCompactPlatterPresentationController

- (void).cxx_destruct
{
}

- (void)setActiveTransitionCoordinator:(id)a3
{
}

- (UIViewControllerTransitionCoordinator)activeTransitionCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransitionCoordinator);
  return (UIViewControllerTransitionCoordinator *)WeakRetained;
}

- (void)setTransitionState:(int64_t)a3
{
  self->_transitionState = a3;
}

- (int64_t)transitionState
{
  return self->_transitionState;
}

- (CGRect)presentedViewFrameInContainerViewOfSize:(CGSize)a3 withSizeCalculation:(BOOL)a4
{
  BOOL v4 = a4;
  double height = a3.height;
  double width = a3.width;
  v8 = objc_opt_class();
  v9 = [(WFCompactPlatterPresentationController *)self containerView];
  v10 = [(WFCompactPlatterPresentationController *)self presentedViewController];
  objc_msgSend(v8, "presentedViewFrameInContainerView:containerViewSize:withSizeCalculation:ofPresentedPlatter:", v9, v4, v10, width, height);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  double v19 = v12;
  double v20 = v14;
  double v21 = v16;
  double v22 = v18;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (void)keyboardWillChange
{
  if (self->_transitionState == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransitionCoordinator);

    if (!WeakRetained)
    {
      [(WFCompactPlatterPresentationController *)self updatePresentedViewFrameAnimatedAlongsideKeyboard:1];
    }
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v8 = v7;
  memset(&v33, 0, sizeof(v33));
  if (v7) {
    [v7 targetTransform];
  }
  CGAffineTransform v32 = v33;
  if (!CGAffineTransformIsIdentity(&v32))
  {
    v9 = [(WFCompactPlatterPresentationController *)self containerView];
    [v9 bounds];
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    CGAffineTransform v32 = v33;
    v34.origin.CGFloat x = v11;
    v34.origin.CGFloat y = v13;
    v34.size.double width = v15;
    v34.size.double height = v17;
    CGRect v35 = CGRectApplyAffineTransform(v34, &v32);
    CGFloat x = v35.origin.x;
    CGFloat y = v35.origin.y;
    CGFloat v20 = v35.size.width;
    CGFloat v21 = v35.size.height;
    CGAffineTransformMakeTranslation(&v31, -v35.origin.x, -v35.origin.y);
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.double width = v20;
    v36.size.double height = v21;
    CGRect v37 = CGRectApplyAffineTransform(v36, &v31);
    double width = v37.size.width;
    double height = v37.size.height;
  }
  objc_storeWeak((id *)&self->_activeTransitionCoordinator, v8);
  v30.receiver = self;
  v30.super_class = (Class)WFCompactPlatterPresentationController;
  -[WFCompactPlatterPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v30, sel_viewWillTransitionToSize_withTransitionCoordinator_, v8, width, height);
  double v22 = [(WFCompactPlatterPresentationController *)self presentedView];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __93__WFCompactPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v25[3] = &unk_2649CAE30;
  id v26 = v22;
  v27 = self;
  double v28 = width;
  double v29 = height;
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __93__WFCompactPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v24[3] = &unk_2649CAE58;
  v24[4] = self;
  id v23 = v22;
  [v8 animateAlongsideTransition:v25 completion:v24];
}

uint64_t __93__WFCompactPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 40), "presentedViewFrameInContainerViewOfSize:withSizeCalculation:", 1, *(double *)(a1 + 48), *(double *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 32), "setFrame:");
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

void __93__WFCompactPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 360), 0);
  v2 = [MEMORY[0x263F865C0] sharedKeyboard];
  int v3 = [v2 isVisible];

  if (v3)
  {
    BOOL v4 = *(void **)(a1 + 32);
    [v4 keyboardWillChange];
  }
}

- (double)maximumExpectedHeightForPlatterPresentation:(id)a3
{
  BOOL v4 = [(WFCompactPlatterPresentationController *)self containerView];
  [v4 bounds];
  -[WFCompactPlatterPresentationController presentedViewFrameInContainerViewOfSize:withSizeCalculation:](self, "presentedViewFrameInContainerViewOfSize:withSizeCalculation:", 0, v5, v6);
  double v8 = v7;

  return v8;
}

- (void)updatePresentedViewFrameAnimatedAlongsideKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(WFCompactPlatterPresentationController *)self presentedView];
  [(WFCompactPlatterPresentationController *)self frameOfPresentedViewInContainerView];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  [v5 frame];
  v28.origin.CGFloat x = v7;
  v28.origin.CGFloat y = v9;
  v28.size.double width = v11;
  v28.size.double height = v13;
  if (!CGRectEqualToRect(v27, v28))
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__WFCompactPlatterPresentationController_updatePresentedViewFrameAnimatedAlongsideKeyboard___block_invoke;
    aBlock[3] = &unk_2649CAFB8;
    id v22 = v5;
    CGFloat v23 = v7;
    CGFloat v24 = v9;
    CGFloat v25 = v11;
    CGFloat v26 = v13;
    double v14 = (void (**)(void))_Block_copy(aBlock);
    CGFloat v15 = [(WFCompactPlatterPresentationController *)self presentedViewController];
    if (objc_opt_respondsToSelector())
    {
      double v16 = [(WFCompactPlatterPresentationController *)self presentedViewController];
      int v17 = [v16 platterHeightAnimationsDisabled];

      if (v17)
      {
        v14[2](v14);
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
    }
    if (v3)
    {
      double v18 = [MEMORY[0x263F865C0] sharedKeyboard];
      double v19 = (void *)MEMORY[0x263F82E00];
      [v18 animationDuration];
      objc_msgSend(v19, "animateWithDuration:delay:options:animations:completion:", objc_msgSend(v18, "animationCurve") << 16, v14, 0, v20, 0.0);
    }
    else
    {
      [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:0 response:v14 tracking:0 dampingRatioSmoothing:1.0 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.998];
    }
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __92__WFCompactPlatterPresentationController_updatePresentedViewFrameAnimatedAlongsideKeyboard___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (void)platterPresentationDidInvalidateSize:(id)a3
{
  if (self->_transitionState == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_activeTransitionCoordinator);

    if (!WeakRetained)
    {
      [(WFCompactPlatterPresentationController *)self updatePresentedViewFrameAnimatedAlongsideKeyboard:0];
    }
  }
}

- (BOOL)_containerIgnoresDirectTouchEvents
{
  return 1;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFCompactPlatterPresentationController;
  -[WFCompactPlatterPresentationController dismissalTransitionDidEnd:](&v6, sel_dismissalTransitionDidEnd_);
  int64_t v5 = 2;
  if (v3) {
    int64_t v5 = 0;
  }
  self->_transitionState = v5;
}

- (void)dismissalTransitionWillBegin
{
  v3.receiver = self;
  v3.super_class = (Class)WFCompactPlatterPresentationController;
  [(WFCompactPlatterPresentationController *)&v3 dismissalTransitionWillBegin];
  self->_transitionState = 3;
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)WFCompactPlatterPresentationController;
  -[WFCompactPlatterPresentationController presentationTransitionDidEnd:](&v6, sel_presentationTransitionDidEnd_);
  int64_t v5 = 2;
  if (!v3) {
    int64_t v5 = 0;
  }
  self->_transitionState = v5;
}

- (void)presentationTransitionWillBegin
{
  v3.receiver = self;
  v3.super_class = (Class)WFCompactPlatterPresentationController;
  [(WFCompactPlatterPresentationController *)&v3 presentationTransitionWillBegin];
  self->_transitionState = 1;
}

- (CGRect)frameOfDismissedViewInContainerView
{
  [(WFCompactPlatterPresentationController *)self frameOfPresentedViewInContainerView];
  CGFloat x = v9.origin.x;
  CGFloat width = v9.size.width;
  CGFloat height = v9.size.height;
  double v5 = -CGRectGetHeight(v9);
  double v6 = x;
  double v7 = width;
  double v8 = height;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v7;
  result.origin.CGFloat y = v5;
  result.origin.CGFloat x = v6;
  return result;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  objc_super v3 = [(WFCompactPlatterPresentationController *)self containerView];
  [v3 bounds];
  -[WFCompactPlatterPresentationController presentedViewFrameInContainerViewOfSize:withSizeCalculation:](self, "presentedViewFrameInContainerViewOfSize:withSizeCalculation:", 1, v4, v5);
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = v7;
  double v15 = v9;
  double v16 = v11;
  double v17 = v13;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (void)dealloc
{
  objc_super v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F86618] object:0];

  v4.receiver = self;
  v4.super_class = (Class)WFCompactPlatterPresentationController;
  [(WFCompactPlatterPresentationController *)&v4 dealloc];
}

- (WFCompactPlatterPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)WFCompactPlatterPresentationController;
  double v7 = [(WFCompactPlatterPresentationController *)&v11 initWithPresentedViewController:v6 presentingViewController:a4];
  if (v7)
  {
    [v6 setPlatterContentContainer:v7];
    [MEMORY[0x263F865C0] beginObservingKeyboardNotifications];
    double v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 addObserver:v7 selector:sel_keyboardWillChange name:*MEMORY[0x263F86618] object:0];

    double v9 = v7;
  }

  return v7;
}

+ (CGRect)presentedViewFrameInContainerView:(id)a3 containerViewSize:(CGSize)a4 withSizeCalculation:(BOOL)a5 ofPresentedPlatter:(id)a6
{
  BOOL v7 = a5;
  double height = a4.height;
  double width = a4.width;
  id v10 = a3;
  id v11 = a6;
  objc_msgSend((id)objc_opt_class(), "usableFrameForPresentingInContainerViewOfSize:", width, height);
  CGFloat x = v52.origin.x;
  CGFloat y = v52.origin.y;
  CGFloat v14 = v52.size.width;
  CGFloat v15 = v52.size.height;
  double v16 = fmin(CGRectGetWidth(v52) + -16.0, 425.0);
  v53.origin.CGFloat x = x;
  v53.origin.CGFloat y = y;
  v53.size.double width = v14;
  v53.size.double height = v15;
  double v17 = CGRectGetHeight(v53) * 0.8;
  double v18 = v17;
  if (v7) {
    [v11 platterHeightForWidth:v16 withMaximumHeight:v17];
  }
  if (v17 >= v18) {
    double v17 = v18;
  }
  v54.origin.CGFloat x = x;
  v54.origin.CGFloat y = y;
  v54.size.double width = v14;
  v54.size.double height = v15;
  double MinX = CGRectGetMinX(v54);
  v55.origin.CGFloat x = x;
  v55.origin.CGFloat y = y;
  v55.size.double width = v14;
  v55.size.double height = v15;
  double v20 = MinX + (CGRectGetWidth(v55) - v16) * 0.5;
  v56.origin.CGFloat x = x;
  v56.origin.CGFloat y = y;
  v56.size.double width = v14;
  v56.size.double height = v15;
  CGFloat MinY = CGRectGetMinY(v56);
  id v22 = [MEMORY[0x263F865C0] sharedKeyboard];
  int v23 = [v22 isVisible];

  if (v23)
  {
    CGFloat v25 = [MEMORY[0x263F865C0] sharedKeyboard];
    [v25 keyboardFrameInView:v10];
    double v27 = v26;
    double v29 = v28;
    CGFloat rect = v30;
    double v32 = v31;

    double v33 = v32 + 10.0;
    double v34 = 0.0;
    if (height - v33 - v17 < 0.0)
    {
      CGFloat v35 = v27 + 0.0;
      CGFloat v36 = v29 + -10.0;
      v57.origin.CGFloat x = v20;
      v57.origin.CGFloat y = MinY;
      v57.size.double width = v16;
      v57.size.double height = v17;
      double MaxY = CGRectGetMaxY(v57);
      v58.origin.CGFloat x = v35;
      v58.origin.CGFloat y = v36;
      v58.size.double width = rect;
      v58.size.double height = v33;
      double v34 = MaxY - CGRectGetMinY(v58);
    }
    double v24 = v17 - v34;
  }
  v38 = objc_msgSend(MEMORY[0x263F82B60], "mainScreen", v24);
  [v38 scale];
  UIRectIntegralWithScale();
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  double v47 = v40;
  double v48 = v42;
  double v49 = v44;
  double v50 = v46;
  result.size.double height = v50;
  result.size.double width = v49;
  result.origin.CGFloat y = v48;
  result.origin.CGFloat x = v47;
  return result;
}

+ (CGSize)preferredSizeForPresentingInContainerViewOfSize:(CGSize)a3
{
  objc_msgSend((id)objc_opt_class(), "usableFrameForPresentingInContainerViewOfSize:", a3.width, a3.height);
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  double v7 = fmin(CGRectGetWidth(v11) + -16.0, 425.0);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v8 = fmin(CGRectGetHeight(v12) * 0.8, 425.0);
  double v9 = v7;
  result.CGFloat height = v8;
  result.CGFloat width = v9;
  return result;
}

+ (CGRect)usableFrameForPresentingInContainerViewOfSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  double v5 = [MEMORY[0x263F82B60] mainScreen];
  [v5 _peripheryInsets];
  double v7 = v6;

  double v8 = v7 + 8.0;
  double v9 = height - (v7 + 8.0);
  double v10 = 0.0;
  double v11 = width;
  result.size.double height = v9;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v8;
  result.origin.CGFloat x = v10;
  return result;
}

@end