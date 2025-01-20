@interface PLExpandedPlatterPresentationController
+ (CGRect)useableContainerViewBoundsForExpandedPlatter:(id)a3 inContainerViewWithBounds:(CGRect)a4;
+ (CGSize)_sizeOfExpandedPlatter:(id)a3 withPreferredContentSize:(CGSize)a4 inContainerViewWithBounds:(CGRect)a5;
+ (CGSize)_sizeOfViewWithPreferredContentSize:(CGSize)a3 inUseableContainerViewBounds:(CGRect)a4;
- (BOOL)_actuateFeedbackForDismissalIfNecessary;
- (BOOL)_isKeyboardHomeAffordanceVisible;
- (BOOL)_isLocalHomeAffordanceVisible;
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (BOOL)_shouldMakePresentedViewControllerFirstResponder;
- (BOOL)isHomeAffordanceVisible;
- (CGPoint)_contentOffsetForPresentedExpandedPlatterView:(id)a3;
- (CGPoint)additionalContentTranslation;
- (CGRect)_dismissLabelContainerViewFrameForPresentedViewFrame:(CGRect)a3;
- (CGRect)_frameOfPresentedViewInContainerViewWithBounds:(CGRect)a3;
- (CGRect)_keyboardFrame;
- (CGRect)_sourceViewFinalDismissalFrame;
- (CGRect)_sourceViewFinalPresentationFrame;
- (CGRect)_sourceViewInitialPresentationFrame;
- (CGRect)finalDismissalFrameOfPresentingViewInContainerView;
- (CGRect)finalPresentationFrameOfPresentingViewInContainerView;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGRect)initialFrameOfPresentedViewInContainerView;
- (PLExpandedPlatterPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5 sourceView:(id)a6;
- (PLExpandedPlatterPresentationControllerDelegate)presentationControllerDelegate;
- (PLKeyboardHomeAffordanceAssertion)_keyboardHomeAffordance;
- (UIEdgeInsets)_contentInsetWithPresentedFrame:(CGRect)a3 inContainerViewWithBounds:(CGRect)a4;
- (UIPanGestureRecognizer)homeAffordancePanGesture;
- (double)additionalHomeAffordanceSpacing;
- (id)_clickPresentationInteractionManager;
- (id)_presentedExpandedPlatter;
- (void)_actuateFeedbackForDismissalInvalidationIfNecessary;
- (void)_configureDismissFeedbackIfNecessary;
- (void)_configureDismissLabelIfNecessary;
- (void)_dismissExpandedPlatterWithTrigger:(int64_t)a3;
- (void)_fireHomeGesture;
- (void)_handleBackgroundTap:(id)a3;
- (void)_handleHomeAffordancePan:(id)a3;
- (void)_popDismissLabel;
- (void)_setHomeAffordanceVisible:(BOOL)a3;
- (void)_setKeyboardFrame:(CGRect)a3;
- (void)_setKeyboardHomeAffordance:(id)a3;
- (void)_setKeyboardHomeAffordanceVisible:(BOOL)a3;
- (void)_setLocalHomeAffordanceVisible:(BOOL)a3;
- (void)_settleHomeAffordance;
- (void)completeDismissal;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionWillBegin;
- (void)hintDismissalWithCommitProgress:(double)a3 overallProgress:(double)a4;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionWillBegin;
- (void)setAdditionalContentTranslation:(CGPoint)a3;
- (void)setAdditionalHomeAffordanceSpacing:(double)a3;
- (void)setHomeAffordancePanGesture:(id)a3;
- (void)setHomeAffordanceVisible:(BOOL)a3;
- (void)setPresentationControllerDelegate:(id)a3;
- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PLExpandedPlatterPresentationController

+ (CGRect)useableContainerViewBoundsForExpandedPlatter:(id)a3 inContainerViewWithBounds:(CGRect)a4
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F42D90] mainScreen];
  [v5 _peripheryInsets];
  double v7 = v6;

  if (v7 > 0.0) {
    [v4 dismissControlInsets];
  }
  UIRectInset();
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  double v16 = v9;
  double v17 = v11;
  double v18 = v13;
  double v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

+ (CGSize)_sizeOfExpandedPlatter:(id)a3 withPreferredContentSize:(CGSize)a4 inContainerViewWithBounds:(CGRect)a5
{
  double height = a4.height;
  double width = a4.width;
  objc_msgSend(a1, "useableContainerViewBoundsForExpandedPlatter:inContainerViewWithBounds:", a3, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  objc_msgSend(a1, "_sizeOfViewWithPreferredContentSize:inUseableContainerViewBounds:", width, height, v8, v9, v10, v11);
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (PLExpandedPlatterPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5 sourceView:(id)a6
{
  id v9 = a3;
  id v10 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLExpandedPlatterPresentationController;
  double v11 = [(PLExpandedPlatterPresentationController *)&v15 initWithPresentedViewController:v9 presentingViewController:a4];
  if (v11)
  {
    if ([v9 conformsToProtocol:&unk_1F337DAC8]) {
      [(PLExpandedPlatterPresentationController *)v11 setPresentationControllerDelegate:v9];
    }
    objc_storeWeak((id *)&v11->_sourceView, v10);
    id WeakRetained = objc_loadWeakRetained((id *)&v11->_presentationControllerDelegate);
    if (objc_opt_respondsToSelector()) {
      char v13 = [WeakRetained expandedPlatterPresentationControllerShouldAllowKeyboardOnAppearance:v11];
    }
    else {
      char v13 = 0;
    }
    v11->_listenToKeyboardEvents = v13;
  }
  return v11;
}

- (id)_presentedExpandedPlatter
{
  p_presentedExpandedPlatter = &self->_presentedExpandedPlatter;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedExpandedPlatter);
  if ((*(unsigned char *)&self->_expandedPlatterPresentationControllerHelperFlags & 1) == 0)
  {
    *(unsigned char *)&self->_expandedPlatterPresentationControllerHelperFlags |= 1u;
    v5 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
    if (objc_opt_respondsToSelector())
    {
      double v6 = [v5 viewWithContent];
    }
    else
    {
      double v7 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
      double v6 = [v7 view];
    }
    if ([v6 conformsToProtocol:&unk_1F336C850])
    {
      id v8 = v6;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      id v8 = [v6 expandedPlatterView];
    }
    id v9 = v8;

    objc_storeWeak((id *)p_presentedExpandedPlatter, v9);
    id WeakRetained = v9;
    goto LABEL_10;
  }
LABEL_11:
  return WeakRetained;
}

- (id)_clickPresentationInteractionManager
{
  v2 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
  if (objc_opt_respondsToSelector())
  {
    v3 = [v2 presenter];
  }
  else
  {
    v3 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 clickPresentationInteractionManager];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (CGRect)_frameOfPresentedViewInContainerViewWithBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v8 = [(PLExpandedPlatterPresentationController *)self _presentedExpandedPlatter];
  objc_msgSend((id)objc_opt_class(), "useableContainerViewBoundsForExpandedPlatter:inContainerViewWithBounds:", v8, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
  [v17 preferredContentSize];
  double v19 = v18;
  double v21 = v20;

  objc_msgSend((id)objc_opt_class(), "_sizeOfViewWithPreferredContentSize:inUseableContainerViewBounds:", v19, v21, v10, v12, v14, v16);
  BSRectWithSize();
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = objc_opt_class();
  CGFloat v80 = v27;
  objc_msgSend(v8, "platterFrameForFrame:", v23, v25, v27, v29);
  double v76 = v14;
  objc_msgSend(v30, "_sizeOfViewWithPreferredContentSize:inUseableContainerViewBounds:", v31, v32, v10, v12, v14, v16);
  BSRectWithSize();
  double v77 = v33;
  double v82 = v34;
  [(PLExpandedPlatterPresentationController *)self _sourceViewFinalPresentationFrame];
  if (!CGRectIsEmpty(v83))
  {
    UIRectCenteredIntegralRect();
    double v23 = v35;
    double v25 = v36;
  }
  v84.origin.double x = v10;
  v84.origin.double y = v12;
  v84.size.double width = v14;
  v84.size.double height = v16;
  double MinY = CGRectGetMinY(v84);
  v85.origin.double x = v23;
  v85.origin.double y = v25;
  v85.size.double height = v29;
  v85.size.double width = v80;
  double v38 = CGRectGetMinY(v85);
  if (MinY >= v38) {
    double v39 = MinY;
  }
  else {
    double v39 = v38;
  }
  p_keyboardFrame = &self->_keyboardFrame;
  if (CGRectIsEmpty(self->_keyboardFrame))
  {
    v41 = [MEMORY[0x1E4F42D90] mainScreen];
    [v41 _peripheryInsets];

    UIRectInset();
    double v44 = v43;
    CGFloat v78 = v46;
    CGFloat v79 = v45;
  }
  else
  {
    v86.origin.double x = p_keyboardFrame->origin.x;
    v86.origin.double y = self->_keyboardFrame.origin.y;
    v86.size.double width = self->_keyboardFrame.size.width;
    v86.size.double height = self->_keyboardFrame.size.height;
    double v47 = CGRectGetMinY(v86);
    v87.origin.double x = v10;
    v87.origin.double y = v12;
    v87.size.double width = v14;
    v87.size.double height = v16;
    CGFloat v48 = v47 - CGRectGetMinY(v87);
    double v44 = v10;
    double v42 = v12;
    CGFloat v78 = v48;
    CGFloat v79 = v76;
  }
  CGFloat rect = v42;
  CGFloat v75 = v44;
  UIRectCenteredXInRect();
  double MinX = CGRectGetMinX(v88);
  objc_msgSend(v8, "frameForPlatterFrame:", MinX, v39, v77, v82);
  CGRectGetMinX(v89);
  UIRectContainInRect();
  double v51 = v50;
  CGFloat v53 = v52;
  double v55 = v54;
  double v57 = v56;
  v90.origin.double x = p_keyboardFrame->origin.x;
  v90.origin.double y = self->_keyboardFrame.origin.y;
  v90.size.double width = self->_keyboardFrame.size.width;
  v90.size.double height = self->_keyboardFrame.size.height;
  IsEmptdouble y = CGRectIsEmpty(v90);
  if (IsEmpty) {
    double MinX = v51;
  }
  else {
    CGFloat v53 = v39;
  }
  if (IsEmpty) {
    CGFloat v59 = v55;
  }
  else {
    CGFloat v59 = v77;
  }
  if (IsEmpty) {
    CGFloat v60 = v57;
  }
  else {
    CGFloat v60 = v82;
  }
  v91.origin.double x = MinX;
  v91.origin.double y = v53;
  v91.size.double width = v59;
  v91.size.double height = v60;
  double MaxY = CGRectGetMaxY(v91);
  v92.origin.double x = v75;
  v92.origin.double y = rect;
  v92.size.double height = v78;
  v92.size.double width = v79;
  double v62 = CGRectGetMaxY(v92);
  if (MaxY > v62) {
    double MaxY = v62;
  }
  v93.origin.double x = MinX;
  v93.origin.double y = v53;
  v93.size.double width = v59;
  v93.size.double height = v60;
  objc_msgSend(v8, "frameForPlatterFrame:", v51, MaxY - CGRectGetHeight(v93), v55, v57);
  v95.origin.double y = CGRectGetMinY(v94);
  v95.origin.double x = v51;
  v95.size.double width = v55;
  v95.size.double height = v57;
  CGRectGetMinY(v95);
  v96.origin.double x = v75;
  v96.origin.double y = rect;
  v96.size.double height = v78;
  v96.size.double width = v79;
  CGRectGetMinY(v96);
  PLMainScreenScale();
  UIRectIntegralWithScale();
  double v64 = v63;
  double v66 = v65;
  double v68 = v67;
  double v70 = v69;

  double v71 = v64;
  double v72 = v66;
  double v73 = v68;
  double v74 = v70;
  result.size.double height = v74;
  result.size.double width = v73;
  result.origin.double y = v72;
  result.origin.double x = v71;
  return result;
}

- (UIEdgeInsets)_contentInsetWithPresentedFrame:(CGRect)a3 inContainerViewWithBounds:(CGRect)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = [(PLExpandedPlatterPresentationController *)self _presentedExpandedPlatter];
  [v9 minimumScrollViewContentInsets];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  p_keyboardFrame = &self->_keyboardFrame;
  if (!CGRectIsEmpty(*p_keyboardFrame))
  {
    CGFloat rect = height;
    [v9 sizeExcludingActions];
    v32.size.CGFloat height = v19;
    v32.origin.CGFloat x = x;
    v32.origin.CGFloat y = y;
    v32.size.CGFloat width = width;
    double MaxY = CGRectGetMaxY(v32);
    if (MaxY > CGRectGetMinY(*p_keyboardFrame))
    {
      objc_msgSend(v9, "actionsSizeThatFits:", a4.size.width, a4.size.height);
      double v29 = v21;
      double v22 = CGRectGetHeight(a4);
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = rect;
      CGFloat v23 = CGRectGetMaxY(v33);
      double v24 = CGRectGetHeight(*p_keyboardFrame) - (v29 + (double)((int)(v22 - v23) & ~((int)(v22 - v23) >> 31)));
      if (v24 > 0.0) {
        double v15 = v24;
      }
    }
  }

  double v25 = v11;
  double v26 = v13;
  double v27 = v15;
  double v28 = v17;
  result.right = v28;
  result.bottom = v27;
  result.left = v26;
  result.top = v25;
  return result;
}

- (CGPoint)_contentOffsetForPresentedExpandedPlatterView:(id)a3
{
  id v4 = a3;
  v5 = [v4 scrollView];
  [v5 contentOffset];
  double v36 = v6;
  [v4 contentSizeExcludingActions];
  double v35 = v7;
  id v8 = [(PLExpandedPlatterPresentationController *)self presentedView];
  [v8 frame];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  [v4 scrollViewFrame];
  double v18 = v17;
  double v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  v38.origin.CGFloat x = v10;
  v38.origin.CGFloat y = v12;
  v38.size.CGFloat width = v14;
  v38.size.CGFloat height = v16;
  CGFloat v25 = CGRectGetMinX(v38) + v18;
  v39.origin.CGFloat x = v10;
  v39.origin.CGFloat y = v12;
  v39.size.CGFloat width = v14;
  v39.size.CGFloat height = v16;
  CGFloat v26 = v20 + CGRectGetMinY(v39);
  [v4 minimumScrollViewContentInsets];
  double v28 = v27;

  double v29 = -v28;
  double MinY = CGRectGetMinY(self->_keyboardFrame);
  v40.origin.CGFloat x = v25;
  v40.origin.CGFloat y = v26;
  v40.size.CGFloat width = v22;
  v40.size.CGFloat height = v24;
  double v31 = v35 - (MinY - CGRectGetMinY(v40));
  if (v31 <= v29) {
    double v32 = v29;
  }
  else {
    double v32 = v31;
  }

  double v33 = v36;
  double v34 = v32;
  result.CGFloat y = v34;
  result.CGFloat x = v33;
  return result;
}

- (void)setAdditionalContentTranslation:(CGPoint)a3
{
  if (a3.x != self->_additionalContentTranslation.x || a3.y != self->_additionalContentTranslation.y)
  {
    self->_additionalContentTranslation = a3;
    id v4 = [(PLExpandedPlatterPresentationController *)self containerView];
    [v4 setNeedsLayout];
  }
}

- (void)setHomeAffordanceVisible:(BOOL)a3
{
  if (self->_homeAffordanceVisible != a3)
  {
    self->_homeAffordanceVisible = a3;
    if (!a3
      || ([(PLExpandedPlatterPresentationController *)self presentedViewController],
          id v4 = objc_claimAutoreleasedReturnValue(),
          int v5 = [v4 _appearState],
          v4,
          v5 == 2))
    {
      -[PLExpandedPlatterPresentationController _setHomeAffordanceVisible:](self, "_setHomeAffordanceVisible:");
    }
  }
}

- (void)_setHomeAffordanceVisible:(BOOL)a3
{
  if (a3)
  {
    if (CGRectIsEmpty(self->_keyboardFrame))
    {
      [(PLExpandedPlatterPresentationController *)self _setLocalHomeAffordanceVisible:1];
      return;
    }
    id v4 = self;
    uint64_t v5 = 1;
  }
  else
  {
    -[PLExpandedPlatterPresentationController _setLocalHomeAffordanceVisible:](self, "_setLocalHomeAffordanceVisible:");
    id v4 = self;
    uint64_t v5 = 0;
  }
  [(PLExpandedPlatterPresentationController *)v4 _setKeyboardHomeAffordanceVisible:v5];
}

- (BOOL)_isLocalHomeAffordanceVisible
{
  homeAffordanceView = self->_homeAffordanceView;
  if (homeAffordanceView) {
    LOBYTE(homeAffordanceView) = [(MTLumaDodgePillView *)homeAffordanceView isHidden] ^ 1;
  }
  return (char)homeAffordanceView;
}

- (void)_setLocalHomeAffordanceVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && !self->_homeAffordanceView)
  {
    uint64_t v5 = (MTLumaDodgePillView *)objc_alloc_init(MEMORY[0x1E4F743C0]);
    homeAffordanceView = self->_homeAffordanceView;
    self->_homeAffordanceView = v5;

    [(MTLumaDodgePillView *)self->_homeAffordanceView setStyle:3];
    double v7 = [(PLExpandedPlatterPresentationController *)self containerView];
    [v7 addSubview:self->_homeAffordanceView];
  }
  if (self->_homeAffordanceView)
  {
    int v8 = [MEMORY[0x1E4F42FF0] areAnimationsEnabled];
    double v9 = self->_homeAffordanceView;
    if (v8)
    {
      if (v3)
      {
        [(MTLumaDodgePillView *)v9 setHidden:0];
        [(MTLumaDodgePillView *)self->_homeAffordanceView setAlpha:0.0];
        CGFloat v10 = self->_homeAffordanceView;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
        [WeakRetained unhideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:self];
      }
      else
      {
        CGFloat v10 = v9;
        id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
        [WeakRetained hideHomeAffordanceAnimationSettingsForExpandedPlatterPresentationController:self];
      CGFloat v12 = };
      double v13 = (void *)MEMORY[0x1E4F4F898];
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __74__PLExpandedPlatterPresentationController__setLocalHomeAffordanceVisible___block_invoke;
      v22[3] = &unk_1E6B5F828;
      double v23 = v10;
      BOOL v24 = v3;
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      double v18 = __74__PLExpandedPlatterPresentationController__setLocalHomeAffordanceVisible___block_invoke_2;
      double v19 = &unk_1E6B5F850;
      BOOL v21 = v3;
      CGFloat v14 = v23;
      double v20 = v14;
      [v13 animateWithSettings:v12 options:6 actions:v22 completion:&v16];
      if (([(MTLumaDodgePillView *)self->_homeAffordanceView isHidden] & 1) == 0)
      {
        double v15 = [(PLExpandedPlatterPresentationController *)self containerView];
        [v15 setNeedsLayout];
      }
    }
    else
    {
      [(MTLumaDodgePillView *)v9 setHidden:!v3];
    }
  }
}

uint64_t __74__PLExpandedPlatterPresentationController__setLocalHomeAffordanceVisible___block_invoke(uint64_t a1)
{
  double v1 = 1.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __74__PLExpandedPlatterPresentationController__setLocalHomeAffordanceVisible___block_invoke_2(uint64_t a1)
{
  uint64_t result = [MEMORY[0x1E4F42FF0] _isInAnimationBlock];
  if ((result & 1) == 0 && !*(unsigned char *)(a1 + 40))
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 setHidden:1];
  }
  return result;
}

- (BOOL)_isKeyboardHomeAffordanceVisible
{
  return self->_keyboardHomeAffordance != 0;
}

- (void)_setKeyboardHomeAffordanceVisible:(BOOL)a3
{
  keyboardHomeAffordance = self->_keyboardHomeAffordance;
  if (a3)
  {
    if (keyboardHomeAffordance) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
    if (objc_opt_respondsToSelector())
    {
      uint64_t v5 = [(PLExpandedPlatterPresentationController *)self containerView];
      double v6 = [v5 window];
      double v7 = [WeakRetained expandedPlatterPresentationController:self keyboardAssertionForGestureWindow:v6];
      [(PLExpandedPlatterPresentationController *)self _setKeyboardHomeAffordance:v7];
    }
    int v8 = (PLKeyboardHomeAffordanceAssertion *)WeakRetained;
  }
  else
  {
    if (!keyboardHomeAffordance) {
      return;
    }
    [(PLKeyboardHomeAffordanceAssertion *)keyboardHomeAffordance invalidate];
    int v8 = self->_keyboardHomeAffordance;
    self->_keyboardHomeAffordance = 0;
  }
}

- (void)setAdditionalHomeAffordanceSpacing:(double)a3
{
  if (self->_additionalHomeAffordanceSpacing != a3)
  {
    self->_double additionalHomeAffordanceSpacing = a3;
    if ([(PLExpandedPlatterPresentationController *)self isHomeAffordanceVisible])
    {
      if ([(PLExpandedPlatterPresentationController *)self _isLocalHomeAffordanceVisible])
      {
        [(MTLumaDodgePillView *)self->_homeAffordanceView frame];
        homeAffordanceView = self->_homeAffordanceView;
        PLMainScreenScale();
        UIRectIntegralWithScale();
        -[MTLumaDodgePillView setFrame:](homeAffordanceView, "setFrame:");
      }
      else
      {
        keyboardHomeAffordance = self->_keyboardHomeAffordance;
        double additionalHomeAffordanceSpacing = self->_additionalHomeAffordanceSpacing;
        [(PLKeyboardHomeAffordanceAssertion *)keyboardHomeAffordance setAdditionalEdgeMargin:additionalHomeAffordanceSpacing];
      }
    }
  }
}

- (void)setHomeAffordancePanGesture:(id)a3
{
  uint64_t v5 = (UIPanGestureRecognizer *)a3;
  homeAffordancePanGesture = self->_homeAffordancePanGesture;
  if (homeAffordancePanGesture != v5)
  {
    double v7 = v5;
    if (homeAffordancePanGesture) {
      [(UIPanGestureRecognizer *)homeAffordancePanGesture removeTarget:self action:sel__handleHomeAffordancePan_];
    }
    objc_storeStrong((id *)&self->_homeAffordancePanGesture, a3);
    homeAffordancePanGesture = (UIPanGestureRecognizer *)[(UIPanGestureRecognizer *)self->_homeAffordancePanGesture addTarget:self action:sel__handleHomeAffordancePan_];
    uint64_t v5 = v7;
  }
  MEMORY[0x1F41817F8](homeAffordancePanGesture, v5);
}

- (void)_handleHomeAffordancePan:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
  if (![v5 isBeingPresented])
  {
    double v6 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
    char v7 = [v6 isBeingDismissed];

    if (v7) {
      goto LABEL_4;
    }
    uint64_t v5 = [(PLExpandedPlatterPresentationController *)self containerView];
    [v5 bounds];
    double MaxY = CGRectGetMaxY(v21);
    [v4 locationInView:v5];
    double v10 = MaxY - v9;
    switch([v4 state])
    {
      case 1:
        if (!self->_homeAffordanceFeedbackGenerator)
        {
          id v11 = objc_alloc(MEMORY[0x1E4F42C10]);
          CGFloat v12 = (void *)MEMORY[0x1E4F43268];
          double v13 = [MEMORY[0x1E4F1CAD0] setWithObject:&unk_1F3358D70];
          CGFloat v14 = [v12 privateConfigurationForTypes:v13];
          double v15 = (UINotificationFeedbackGenerator *)[v11 initWithConfiguration:v14];
          homeAffordanceFeedbackGenerator = self->_homeAffordanceFeedbackGenerator;
          self->_homeAffordanceFeedbackGenerator = v15;

          [(UINotificationFeedbackGenerator *)self->_homeAffordanceFeedbackGenerator activateWithCompletionBlock:0];
        }
        goto LABEL_9;
      case 2:
LABEL_9:
        if (v10 > 100.0) {
          goto LABEL_12;
        }
        long long v20 = 0u;
        BYTE8(v20) = 1;
        long long v19 = 0u;
        BYTE8(v19) = 1;
        BSIntervalMap();
        -[PLExpandedPlatterPresentationController setAdditionalHomeAffordanceSpacing:](self, "setAdditionalHomeAffordanceSpacing:", v17 * 15.0 + 0.0, 0, *((void *)&v19 + 1), 0x3FF0000000000000, 1, 0, *((void *)&v20 + 1), 0x4059000000000000, 1);
        break;
      case 3:
        [v4 velocityInView:v5];
        if (v10 + v18 * -0.15 <= 100.0) {
          goto LABEL_6;
        }
LABEL_12:
        [(PLExpandedPlatterPresentationController *)self _fireHomeGesture];
        break;
      case 4:
      case 5:
LABEL_6:
        [(PLExpandedPlatterPresentationController *)self _settleHomeAffordance];
        break;
      default:
        break;
    }
  }

LABEL_4:
}

- (void)_dismissExpandedPlatterWithTrigger:(int64_t)a3
{
  uint64_t v5 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v8 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
    char v7 = [v8 dismisser];
    [v7 expandedPlatterPresentable:v8 requestsDismissalWithTrigger:a3];
  }
  else
  {
    id v8 = [(PLExpandedPlatterPresentationController *)self _clickPresentationInteractionManager];
    [v8 _dismissIfPossibleWithTrigger:a3];
  }
}

- (void)_fireHomeGesture
{
  [(PLExpandedPlatterPresentationController *)self _dismissExpandedPlatterWithTrigger:2];
  homeAffordanceFeedbackGenerator = self->_homeAffordanceFeedbackGenerator;
  [(UINotificationFeedbackGenerator *)homeAffordanceFeedbackGenerator _privateNotificationOccurred:1010];
}

- (void)_settleHomeAffordance
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__PLExpandedPlatterPresentationController__settleHomeAffordance__block_invoke;
  v6[3] = &unk_1E6B5F800;
  v6[4] = self;
  BOOL v3 = (void *)MEMORY[0x1D948D440](v6, a2);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [WeakRetained settleHomeAffordanceAnimationBehaviorDescriptionForExpandedPlatterPresentationController:self];
    [MEMORY[0x1E4F42FF0] _animateUsingSpringBehavior:v5 tracking:0 animations:v3 completion:0];
  }
}

uint64_t __64__PLExpandedPlatterPresentationController__settleHomeAffordance__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAdditionalHomeAffordanceSpacing:0.0];
}

- (void)_handleBackgroundTap:(id)a3
{
  id v4 = a3;
  id v9 = [(PLExpandedPlatterPresentationController *)self _presentedExpandedPlatter];
  [v4 locationInView:v9];
  double v6 = v5;
  double v8 = v7;

  if ((objc_msgSend(v9, "pointInside:withEvent:", 0, v6, v8) & 1) == 0) {
    [(PLExpandedPlatterPresentationController *)self _dismissExpandedPlatterWithTrigger:3];
  }
}

- (void)_configureDismissFeedbackIfNecessary
{
  if (!self->_dismissFeedbackBehavior)
  {
    BOOL v3 = [(PLExpandedPlatterPresentationController *)self containerView];
    if (v3)
    {
      id v8 = v3;
      id v4 = objc_alloc(MEMORY[0x1E4F43308]);
      double v5 = [(PLExpandedPlatterPresentationController *)self _presentedExpandedPlatter];
      double v6 = (_UIStatesFeedbackGenerator *)[v4 initWithStyle:1 view:v5];
      dismissFeedbackBehavior = self->_dismissFeedbackBehavior;
      self->_dismissFeedbackBehavior = v6;

      [(_UIStatesFeedbackGenerator *)self->_dismissFeedbackBehavior prepare];
      BOOL v3 = v8;
    }
  }
}

- (BOOL)_actuateFeedbackForDismissalIfNecessary
{
  BOOL didPlayDismissHaptic = self->_didPlayDismissHaptic;
  if (!self->_didPlayDismissHaptic)
  {
    self->_BOOL didPlayDismissHaptic = 1;
    [(_UIStatesFeedbackGenerator *)self->_dismissFeedbackBehavior transitionToState:*MEMORY[0x1E4F44180] ended:1];
  }
  return !didPlayDismissHaptic;
}

- (void)_actuateFeedbackForDismissalInvalidationIfNecessary
{
  if (self->_didPlayDismissHaptic)
  {
    self->_BOOL didPlayDismissHaptic = 0;
    [(_UIStatesFeedbackGenerator *)self->_dismissFeedbackBehavior transitionToState:*MEMORY[0x1E4F44188] ended:1];
  }
}

- (void)_configureDismissLabelIfNecessary
{
  if (!self->_dismissLabel)
  {
    BOOL v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    dismissLabel = self->_dismissLabel;
    self->_dismissLabel = v3;

    double v5 = self->_dismissLabel;
    double v6 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    double v7 = [v6 preferredFontForTextStyle:*MEMORY[0x1E4F43890] hiFontStyle:8];
    [(UILabel *)v5 setFont:v7];

    id v8 = self->_dismissLabel;
    id v9 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UILabel *)v8 setTextColor:v9];

    double v10 = self->_dismissLabel;
    id v11 = PlatterKitFrameworkBundle();
    CGFloat v12 = [v11 localizedStringForKey:@"EXPANDED_PLATTER_DISMISS_HINT" value:&stru_1F334C238 table:0];
    double v13 = [v12 localizedUppercaseString];
    [(UILabel *)v10 setText:v13];

    [(UILabel *)self->_dismissLabel setContentMode:4];
    [(UILabel *)self->_dismissLabel setTextAlignment:1];
    id v14 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v15 = self->_dismissLabel;
    uint64_t v16 = [(PLExpandedPlatterPresentationController *)self containerView];
    [v16 bounds];
    -[UILabel sizeThatFits:](v15, "sizeThatFits:", v17, v18);
    BSRectWithSize();
    long long v19 = (UIView *)objc_msgSend(v14, "initWithFrame:");
    dismissLabelContainerView = self->_dismissLabelContainerView;
    self->_dismissLabelContainerView = v19;

    [(UIView *)self->_dismissLabelContainerView setUserInteractionEnabled:0];
    [(UIView *)self->_dismissLabelContainerView setAutoresizesSubviews:1];
    CGRect v21 = self->_dismissLabel;
    [(UIView *)self->_dismissLabelContainerView bounds];
    -[UILabel setFrame:](v21, "setFrame:");
    [(UIView *)self->_dismissLabelContainerView addSubview:self->_dismissLabel];
    [(UILabel *)self->_dismissLabel setAutoresizingMask:18];
    CGFloat v22 = [(PLExpandedPlatterPresentationController *)self containerView];
    [v22 addSubview:self->_dismissLabelContainerView];

    id v23 = [(PLExpandedPlatterPresentationController *)self containerView];
    [v23 setNeedsLayout];
  }
}

- (CGRect)_dismissLabelContainerViewFrameForPresentedViewFrame:(CGRect)a3
{
  id v4 = [(PLExpandedPlatterPresentationController *)self containerView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  -[UILabel sizeThatFits:](self->_dismissLabel, "sizeThatFits:", v10, v12);
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_dismissLabel, "textRectForBounds:limitedToNumberOfLines:", 1, v6, v8, v10, v12);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGRect v21 = [(UILabel *)self->_dismissLabel font];
  v43.origin.CGFloat x = v14;
  v43.origin.CGFloat y = v16;
  v43.size.CGFloat width = v18;
  v43.size.CGFloat height = v20;
  CGRectGetMaxY(v43);
  [v21 descender];
  v44.origin.CGFloat x = v6;
  v44.origin.CGFloat y = v8;
  v44.size.CGFloat width = v10;
  v44.size.CGFloat height = v12;
  CGRectGetWidth(v44);
  [v21 lineHeight];
  BSRectWithSize();
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  CGRectGetMinY(a3);
  v45.origin.CGFloat x = v23;
  v45.origin.CGFloat y = v25;
  v45.size.CGFloat width = v27;
  v45.size.CGFloat height = v29;
  CGRectGetHeight(v45);
  PLMainScreenScale();
  UIRectIntegralWithScale();
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;

  double v38 = v31;
  double v39 = v33;
  double v40 = v35;
  double v41 = v37;
  result.size.CGFloat height = v41;
  result.size.CGFloat width = v40;
  result.origin.CGFloat y = v39;
  result.origin.CGFloat x = v38;
  return result;
}

- (void)_popDismissLabel
{
  if (self->_dismissLabel)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke;
    v3[3] = &unk_1E6B5F800;
    v3[4] = self;
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke_2;
    v2[3] = &unk_1E6B5F878;
    v2[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:196608 delay:v3 options:v2 animations:0.05 completion:0.0];
  }
}

uint64_t __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke(uint64_t a1)
{
  double v1 = *(void **)(*(void *)(a1 + 32) + 528);
  CGAffineTransformMakeScale(&v3, 1.2, 1.2);
  return [v1 setTransform:&v3];
}

uint64_t __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke_3;
  v2[3] = &unk_1E6B5F800;
  v2[4] = *(void *)(a1 + 32);
  return [MEMORY[0x1E4F42FF0] animateWithDuration:0 delay:v2 options:0 animations:0.15 completion:0.0];
}

uint64_t __59__PLExpandedPlatterPresentationController__popDismissLabel__block_invoke_3(uint64_t a1)
{
  double v1 = *(void **)(*(void *)(a1 + 32) + 528);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

- (void)hintDismissalWithCommitProgress:(double)a3 overallProgress:(double)a4
{
  [(PLExpandedPlatterPresentationController *)self _configureDismissFeedbackIfNecessary];
  CGFloat v7 = fmin(fmax(a4, 0.0), 1.0) * -0.1 + 1.0;
  double v8 = [(PLExpandedPlatterPresentationController *)self presentedView];
  CGAffineTransformMakeScale(&v30, v7, v7);
  [v8 setTransform:&v30];

  [(PLExpandedPlatterPresentationController *)self _configureDismissLabelIfNecessary];
  double v9 = fmax(a3, 0.0);
  if (v9 >= 1.0) {
    double v10 = 1.0;
  }
  else {
    double v10 = v9;
  }
  [(UILabel *)self->_dismissLabel setAlpha:v10];
  double v11 = [(PLExpandedPlatterPresentationController *)self _presentedExpandedPlatter];
  double v12 = [v11 superview];
  [v11 frame];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  CGRect v21 = [(PLExpandedPlatterPresentationController *)self containerView];
  objc_msgSend(v12, "convertRect:toView:", v21, v14, v16, v18, v20);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  -[PLExpandedPlatterPresentationController _dismissLabelContainerViewFrameForPresentedViewFrame:](self, "_dismissLabelContainerViewFrameForPresentedViewFrame:", v23, v25, v27, v29);
  -[UIView setFrame:](self->_dismissLabelContainerView, "setFrame:");
  if (v9 >= 1.0)
  {
    if ([(PLExpandedPlatterPresentationController *)self _actuateFeedbackForDismissalIfNecessary])
    {
      [(PLExpandedPlatterPresentationController *)self _popDismissLabel];
    }
  }
  else
  {
    [(PLExpandedPlatterPresentationController *)self _actuateFeedbackForDismissalInvalidationIfNecessary];
  }
}

- (void)completeDismissal
{
  if (self->_dismissLabel)
  {
    id v21 = [(PLExpandedPlatterPresentationController *)self _presentedExpandedPlatter];
    CGAffineTransform v3 = [v21 superview];
    [v21 frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = [(PLExpandedPlatterPresentationController *)self containerView];
    objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    -[PLExpandedPlatterPresentationController _dismissLabelContainerViewFrameForPresentedViewFrame:](self, "_dismissLabelContainerViewFrameForPresentedViewFrame:", v14, v16, v18, v20);
    -[UIView setFrame:](self->_dismissLabelContainerView, "setFrame:");
    [(UILabel *)self->_dismissLabel setAlpha:0.0];
  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  CGAffineTransform v3 = [(PLExpandedPlatterPresentationController *)self containerView];
  [v3 bounds];
  -[PLExpandedPlatterPresentationController _frameOfPresentedViewInContainerViewWithBounds:](self, "_frameOfPresentedViewInContainerViewWithBounds:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

- (CGRect)_sourceViewInitialPresentationFrame
{
  if ((*(unsigned char *)&self->_expandedPlatterPresentationControllerHelperFlags & 2) == 0)
  {
    *(unsigned char *)&self->_expandedPlatterPresentationControllerHelperFlags |= 2u;
    CGAffineTransform v3 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
    if (objc_opt_respondsToSelector())
    {
      double v4 = [v3 presenter];
      if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v4 initialPresentedFrameOfViewForPreview];
        self->_sourceViewInitialPresentationFrame.origin.double x = v5;
        self->_sourceViewInitialPresentationFrame.origin.double y = v6;
        self->_sourceViewInitialPresentationFrame.size.double width = v7;
        self->_sourceViewInitialPresentationFrame.size.double height = v8;
LABEL_9:

        goto LABEL_10;
      }
    }
    else
    {
      double v4 = 0;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceView);
    double v10 = [WeakRetained superview];
    [WeakRetained frame];
    objc_msgSend(v10, "convertRect:toView:", 0);
    self->_sourceViewInitialPresentationFrame.origin.double x = v11;
    self->_sourceViewInitialPresentationFrame.origin.double y = v12;
    self->_sourceViewInitialPresentationFrame.size.double width = v13;
    self->_sourceViewInitialPresentationFrame.size.double height = v14;

    goto LABEL_9;
  }
LABEL_10:
  double x = self->_sourceViewInitialPresentationFrame.origin.x;
  double y = self->_sourceViewInitialPresentationFrame.origin.y;
  double width = self->_sourceViewInitialPresentationFrame.size.width;
  double height = self->_sourceViewInitialPresentationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_sourceViewFinalPresentationFrame
{
  if ((*(unsigned char *)&self->_expandedPlatterPresentationControllerHelperFlags & 4) == 0)
  {
    *(unsigned char *)&self->_expandedPlatterPresentationControllerHelperFlags |= 4u;
    CGAffineTransform v3 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
    if (objc_opt_respondsToSelector())
    {
      double v4 = [v3 presenter];
      if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v4 finalPresentedFrameOfViewForPreview];
LABEL_9:
        self->_sourceViewFinalPresentationFrame.origin.double x = v5;
        self->_sourceViewFinalPresentationFrame.origin.double y = v6;
        self->_sourceViewFinalPresentationFrame.size.double width = v7;
        self->_sourceViewFinalPresentationFrame.size.double height = v8;

        goto LABEL_10;
      }
    }
    else
    {
      double v4 = 0;
    }
    [(PLExpandedPlatterPresentationController *)self _sourceViewInitialPresentationFrame];
    goto LABEL_9;
  }
LABEL_10:
  double x = self->_sourceViewFinalPresentationFrame.origin.x;
  double y = self->_sourceViewFinalPresentationFrame.origin.y;
  double width = self->_sourceViewFinalPresentationFrame.size.width;
  double height = self->_sourceViewFinalPresentationFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)_sourceViewFinalDismissalFrame
{
  if ((*(unsigned char *)&self->_expandedPlatterPresentationControllerHelperFlags & 8) == 0)
  {
    *(unsigned char *)&self->_expandedPlatterPresentationControllerHelperFlags |= 8u;
    CGAffineTransform v3 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
    if (objc_opt_respondsToSelector())
    {
      double v4 = [v3 presenter];
      if (v4 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        [v4 finalDismissedFrameOfViewForPreview];
LABEL_9:
        self->_sourceViewFinalDismissalFrame.origin.double x = v5;
        self->_sourceViewFinalDismissalFrame.origin.double y = v6;
        self->_sourceViewFinalDismissalFrame.size.double width = v7;
        self->_sourceViewFinalDismissalFrame.size.double height = v8;

        goto LABEL_10;
      }
    }
    else
    {
      double v4 = 0;
    }
    [(PLExpandedPlatterPresentationController *)self _sourceViewFinalPresentationFrame];
    goto LABEL_9;
  }
LABEL_10:
  double x = self->_sourceViewFinalDismissalFrame.origin.x;
  double y = self->_sourceViewFinalDismissalFrame.origin.y;
  double width = self->_sourceViewFinalDismissalFrame.size.width;
  double height = self->_sourceViewFinalDismissalFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)initialFrameOfPresentedViewInContainerView
{
  [(PLExpandedPlatterPresentationController *)self _sourceViewInitialPresentationFrame];
  double x = v43.origin.x;
  double y = v43.origin.y;
  double width = v43.size.width;
  double height = v43.size.height;
  if (CGRectIsEmpty(v43))
  {
    [(PLExpandedPlatterPresentationController *)self frameOfPresentedViewInContainerView];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  else
  {
    double v15 = [(PLExpandedPlatterPresentationController *)self _presentedExpandedPlatter];
    double v16 = [v15 superview];
    objc_msgSend(v16, "convertRect:fromView:", 0, x, y, width, height);
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;

    objc_msgSend(v15, "frameForPlatterFrame:", v18, v20, v22, v24);
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;
    double v32 = v31;
    double v33 = [(PLExpandedPlatterPresentationController *)self containerView];
    double v34 = [v15 superview];
    objc_msgSend(v33, "convertRect:fromView:", v34, v26, v28, v30, v32);
    double v8 = v35;
    double v10 = v36;
    double v12 = v37;
    double v14 = v38;
  }
  double v39 = v8;
  double v40 = v10;
  double v41 = v12;
  double v42 = v14;
  result.size.double height = v42;
  result.size.double width = v41;
  result.origin.double y = v40;
  result.origin.double x = v39;
  return result;
}

- (CGRect)finalPresentationFrameOfPresentingViewInContainerView
{
  CGAffineTransform v3 = [(PLExpandedPlatterPresentationController *)self _presentedExpandedPlatter];
  [(PLExpandedPlatterPresentationController *)self frameOfPresentedViewInContainerView];
  objc_msgSend(v3, "platterFrameForFrame:");
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (CGRect)finalDismissalFrameOfPresentingViewInContainerView
{
  CGAffineTransform v3 = [(PLExpandedPlatterPresentationController *)self containerView];
  [(PLExpandedPlatterPresentationController *)self _sourceViewFinalDismissalFrame];
  objc_msgSend(v3, "convertRect:fromView:", 0);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)presentationTransitionWillBegin
{
  CGAffineTransform v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_keyboardWillShow_ name:*MEMORY[0x1E4F43B88] object:0];

  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 addObserver:self selector:sel_keyboardWillHide_ name:*MEMORY[0x1E4F43B80] object:0];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PLExpandedPlatterPresentationController_presentationTransitionWillBegin__block_invoke;
  v7[3] = &unk_1E6B5F800;
  v7[4] = self;
  [MEMORY[0x1E4F42FF0] performWithoutAnimation:v7];
  double v5 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleBackgroundTap_];
  double v6 = [(PLExpandedPlatterPresentationController *)self containerView];
  [v6 addGestureRecognizer:v5];
}

void __74__PLExpandedPlatterPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  long long v2 = [*(id *)(a1 + 32) containerView];
  CGAffineTransform v3 = [*(id *)(a1 + 32) presentedView];
  [v2 addSubview:v3];

  double v4 = [MEMORY[0x1E4F42D90] mainScreen];
  [v4 _peripheryInsets];
  double v6 = v5;

  if (v6 > 0.0)
  {
    id v7 = [*(id *)(a1 + 32) _presentedExpandedPlatter];
    [v7 setContentBottomInset:v6];
  }
}

- (void)dismissalTransitionWillBegin
{
}

- (void)containerViewWillLayoutSubviews
{
  CGAffineTransform v3 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
  char v4 = [v3 isBeingDismissed];

  if ((v4 & 1) == 0)
  {
    double v5 = [(PLExpandedPlatterPresentationController *)self presentedView];
    [(PLExpandedPlatterPresentationController *)self frameOfPresentedViewInContainerView];
    PLSetViewFrameMaintainingTransform(v5, v6, v7, v8, v9);
  }
  if ([(PLExpandedPlatterPresentationController *)self isHomeAffordanceVisible])
  {
    double v10 = [(PLExpandedPlatterPresentationController *)self containerView];
    [v10 bounds];
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;

    v29.origin.double x = v12;
    v29.origin.double y = v14;
    v29.size.double width = v16;
    v29.size.double height = v18;
    [(MTLumaDodgePillView *)self->_homeAffordanceView suggestedSizeForContentWidth:CGRectGetWidth(v29)];
    BSRectWithSize();
    UIRectCenteredXInRect();
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;
    v30.origin.double x = v12;
    v30.origin.double y = v14;
    v30.size.double width = v16;
    v30.size.double height = v18;
    CGRectGetMaxY(v30);
    v31.origin.double x = v20;
    v31.origin.double y = v22;
    v31.size.double width = v24;
    v31.size.double height = v26;
    CGRectGetHeight(v31);
    [(MTLumaDodgePillView *)self->_homeAffordanceView suggestedEdgeSpacing];
    homeAffordanceView = self->_homeAffordanceView;
    PLMainScreenScale();
    UIRectIntegralWithScale();
    -[MTLumaDodgePillView setFrame:](homeAffordanceView, "setFrame:");
  }
}

- (BOOL)_shouldMakePresentedViewControllerFirstResponder
{
  return 0;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 0;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  id v5 = [(PLExpandedPlatterPresentationController *)self presentedViewController];

  if (v5 != v4) {
    goto LABEL_21;
  }
  double width = self->_childPreferredContentSize.width;
  double height = self->_childPreferredContentSize.height;
  [v4 preferredContentSize];
  self->_childPreferredContentSize.double width = v9;
  self->_childPreferredContentSize.double height = v8;
  if (width == v9 && height == v8) {
    goto LABEL_21;
  }
  unint64_t WeakRetained = (unint64_t)objc_loadWeakRetained((id *)&self->_activeTransitionCoordinator);
  if (WeakRetained)
  {
    unint64_t v12 = 0;
  }
  else
  {
    unint64_t v12 = (unint64_t)objc_alloc_init(MEMORY[0x1E4F433A0]);
    [(id)v12 _setIsAnimated:1];
    [(id)v12 _setDuration:0.25];
  }
  double v13 = [(PLExpandedPlatterPresentationController *)self containerView];
  CGFloat v14 = v13;
  if (v13)
  {
    [v13 bounds];
    double v16 = v15;
    double v18 = v17;
    if (!v12) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  CGRect v30 = [MEMORY[0x1E4F42D90] mainScreen];
  [v30 bounds];
  double v16 = v31;
  double v18 = v32;

  if (v12)
  {
LABEL_11:
    -[PLExpandedPlatterPresentationController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v4, v16, v18);
    double v20 = v19;
    double v22 = v21;
    double v23 = [(id)v12 _transitionCoordinator];
    objc_msgSend(v4, "viewWillTransitionToSize:withTransitionCoordinator:", v23, v20, v22);
  }
LABEL_12:
  objc_initWeak(&location, self);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
  v37[3] = &unk_1E6B5F8A0;
  v37[4] = self;
  id v24 = v14;
  id v38 = v24;
  double v40 = v16;
  double v41 = v18;
  id v25 = (id)v12;
  id v39 = v25;
  CGFloat v26 = (void (**)(void))MEMORY[0x1D948D440](v37);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2;
  v35[3] = &unk_1E6B5F878;
  id v27 = v25;
  id v36 = v27;
  double v28 = (void (**)(void, void))MEMORY[0x1D948D440](v35);
  if (v14 && WeakRetained | v12)
  {
    if (v12)
    {
      CGRect v29 = (void *)MEMORY[0x1E4F42FF0];
      [v27 _duration];
      objc_msgSend(v29, "animateWithDuration:delay:options:animations:completion:", 4, v26, v28);
    }
    else
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3;
      v33[3] = &unk_1E6B5F8C8;
      double v34 = v26;
      [(id)WeakRetained animateAlongsideTransition:v33 completion:0];
    }
  }
  else
  {
    v26[2](v26);
    v28[2](v28, 1);
  }

  objc_destroyWeak(&location);
LABEL_21:
}

void __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(id *a1)
{
  id v25 = a1[4];
  [a1[5] setNeedsLayout];
  [a1[5] layoutIfNeeded];
  [v25 _keyboardFrame];
  if (!CGRectIsEmpty(v27))
  {
    id v2 = a1[4];
    BSRectWithSize();
    objc_msgSend(v2, "_frameOfPresentedViewInContainerViewWithBounds:");
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    BSRectWithSize();
    objc_msgSend(v25, "_contentInsetWithPresentedFrame:inContainerViewWithBounds:", v4, v6, v8, v10, v11, v12, v13, v14);
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v23 = [v25 _presentedExpandedPlatter];
    id v24 = [v23 scrollView];
    objc_msgSend(v24, "setContentInset:", v16, v18, v20, v22);
    [v25 _contentOffsetForPresentedExpandedPlatterView:v23];
    objc_msgSend(v24, "setContentOffset:");
  }
  objc_msgSend(a1[6], "__runAlongsideAnimations");
}

uint64_t __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

uint64_t __97__PLExpandedPlatterPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PLExpandedPlatterPresentationController;
  -[PLExpandedPlatterPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  objc_storeWeak((id *)&self->_activeTransitionCoordinator, v7);
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __94__PLExpandedPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6B5F8F0;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
  objc_destroyWeak(&location);
}

void *__94__PLExpandedPlatterPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(void *result)
{
  uint64_t v1 = result[4];
  if (v1) {
    return objc_storeWeak((id *)(v1 + 512), 0);
  }
  return result;
}

- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(PLExpandedPlatterPresentationController *)self isHomeAffordanceVisible])
  {
    objc_initWeak(&location, self);
    [v6 transitionDuration:v7];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)((double)(uint64_t)(v8 * 1000000000.0) * 0.25));
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __118__PLExpandedPlatterPresentationController_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke;
    v10[3] = &unk_1E6B5F918;
    objc_copyWeak(&v11, &location);
    dispatch_after(v9, MEMORY[0x1E4F14428], v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __118__PLExpandedPlatterPresentationController_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _setHomeAffordanceVisible:1];
}

- (void)keyboardWillShow:(id)a3
{
  id v4 = a3;
  if (self->_listenToKeyboardEvents
    || ([(PLExpandedPlatterPresentationController *)self presentedViewController],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 _containsFirstResponder],
        v5,
        v6))
  {
    self->_listenToKeyboardEvents = 1;
    id v7 = [(PLExpandedPlatterPresentationController *)self presentedView];
    uint64_t v8 = [v7 window];
    dispatch_time_t v9 = [v4 userInfo];
    objc_super v10 = [v9 objectForKey:*MEMORY[0x1E4F43AF0]];
    [v10 CGRectValue];
    objc_msgSend((id)v8, "convertRect:fromWindow:", 0);
    self->_keyboardFrame.origin.double x = v11;
    self->_keyboardFrame.origin.double y = v12;
    self->_keyboardFrame.size.double width = v13;
    self->_keyboardFrame.size.double height = v14;

    self->_keyboardFrame.size.double height = self->_keyboardFrame.size.height + 8.0;
    self->_keyboardFrame.origin.double y = self->_keyboardFrame.origin.y + -8.0;
    double v15 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
    LOBYTE(v8) = [v15 isBeingDismissed];

    if ((v8 & 1) == 0)
    {
      [(PLExpandedPlatterPresentationController *)self _setLocalHomeAffordanceVisible:0];
      [(PLExpandedPlatterPresentationController *)self frameOfPresentedViewInContainerView];
      double v17 = v16;
      double v19 = v18;
      double v21 = v20;
      double v23 = v22;
      id v24 = [(PLExpandedPlatterPresentationController *)self containerView];
      [v24 bounds];
      -[PLExpandedPlatterPresentationController _contentInsetWithPresentedFrame:inContainerViewWithBounds:](self, "_contentInsetWithPresentedFrame:inContainerViewWithBounds:", *(double *)&v17, *(double *)&v19, *(double *)&v21, *(double *)&v23, v25, v26, v27, v28);
      CGFloat v48 = v30;
      v49 = v29;
      double v32 = v31;
      double v34 = v33;

      double v35 = [v4 userInfo];
      id v36 = [v35 objectForKey:*MEMORY[0x1E4F43AA0]];
      [v36 doubleValue];
      double v38 = v37;

      id v39 = [v4 userInfo];
      double v40 = [v39 objectForKey:*MEMORY[0x1E4F43A98]];
      uint64_t v41 = [v40 unsignedIntegerValue];

      double v42 = [(PLExpandedPlatterPresentationController *)self _presentedExpandedPlatter];
      CGRect v43 = [v42 scrollView];
      objc_initWeak(&location, self);
      CGRect v44 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v45 = PLViewAnimationOptionsForAnimationCurve(v41);
      if (v38 == 0.0) {
        double v38 = 0.25;
      }
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __60__PLExpandedPlatterPresentationController_keyboardWillShow___block_invoke;
      v52[3] = &unk_1E6B5F940;
      objc_copyWeak(v55, &location);
      v55[1] = v17;
      v55[2] = v19;
      v55[3] = v21;
      v55[4] = v23;
      id v46 = v42;
      id v53 = v46;
      id v47 = v43;
      id v54 = v47;
      v55[5] = v49;
      v55[6] = v48;
      v55[7] = v32;
      v55[8] = v34;
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __60__PLExpandedPlatterPresentationController_keyboardWillShow___block_invoke_2;
      v50[3] = &unk_1E6B5F968;
      objc_copyWeak(&v51, &location);
      v50[4] = self;
      [v44 animateWithDuration:v45 delay:v52 options:v50 animations:v38 completion:0.0];
      objc_destroyWeak(&v51);

      objc_destroyWeak(v55);
      objc_destroyWeak(&location);
    }
  }
}

void __60__PLExpandedPlatterPresentationController_keyboardWillShow___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v2 = [WeakRetained presentedView];
  objc_msgSend(v2, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  [*(id *)(a1 + 32) setActionsHidden:1];
  objc_msgSend(*(id *)(a1 + 40), "setContentInset:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  [WeakRetained _contentOffsetForPresentedExpandedPlatterView:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 40), "setContentOffset:");
}

void __60__PLExpandedPlatterPresentationController_keyboardWillShow___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained presentedViewController];
  if (([v2 isBeingDismissed] & 1) != 0
    || ![WeakRetained isHomeAffordanceVisible])
  {
    goto LABEL_5;
  }
  double v3 = [WeakRetained _keyboardHomeAffordance];
  if (v3)
  {

LABEL_5:
    goto LABEL_6;
  }
  [WeakRetained _keyboardFrame];
  IsEmptdouble y = CGRectIsEmpty(v7);

  if (!IsEmpty) {
    [*(id *)(a1 + 32) _setKeyboardHomeAffordanceVisible:1];
  }
LABEL_6:
}

- (void)keyboardWillHide:(id)a3
{
  id v4 = a3;
  if (self->_listenToKeyboardEvents)
  {
    CGSize v5 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
    self->_keyboardFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
    self->_keyboardFrame.size = v5;
    int v6 = [(PLExpandedPlatterPresentationController *)self presentedViewController];
    char v7 = [v6 isBeingDismissed];

    if ((v7 & 1) == 0)
    {
      [(PLExpandedPlatterPresentationController *)self _setKeyboardHomeAffordanceVisible:0];
      uint64_t v8 = [v4 userInfo];
      dispatch_time_t v9 = [v8 objectForKey:*MEMORY[0x1E4F43AA0]];
      [v9 doubleValue];
      double v11 = v10;

      CGFloat v12 = [v4 userInfo];
      CGFloat v13 = [v12 objectForKey:*MEMORY[0x1E4F43A98]];
      uint64_t v14 = [v13 unsignedIntegerValue];

      objc_initWeak(&location, self);
      double v15 = (void *)MEMORY[0x1E4F42FF0];
      uint64_t v16 = PLViewAnimationOptionsForAnimationCurve(v14);
      if (v11 == 0.0) {
        double v11 = 0.25;
      }
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __60__PLExpandedPlatterPresentationController_keyboardWillHide___block_invoke;
      v19[3] = &unk_1E6B5F918;
      objc_copyWeak(&v20, &location);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __60__PLExpandedPlatterPresentationController_keyboardWillHide___block_invoke_2;
      v17[3] = &unk_1E6B5F990;
      objc_copyWeak(&v18, &location);
      [v15 animateWithDuration:v16 delay:v19 options:v17 animations:v11 completion:0.0];
      objc_destroyWeak(&v18);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
  }
}

void __60__PLExpandedPlatterPresentationController_keyboardWillHide___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained presentedView];
  [WeakRetained frameOfPresentedViewInContainerView];
  objc_msgSend(v1, "setFrame:");

  id v2 = [WeakRetained _presentedExpandedPlatter];
  double v3 = [v2 scrollView];
  objc_msgSend(v3, "setContentInset:", *MEMORY[0x1E4F437F8], *(double *)(MEMORY[0x1E4F437F8] + 8), *(double *)(MEMORY[0x1E4F437F8] + 16), *(double *)(MEMORY[0x1E4F437F8] + 24));

  [v2 setActionsHidden:0];
  [v2 setNeedsLayout];
}

void __60__PLExpandedPlatterPresentationController_keyboardWillHide___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained presentedViewController];
  if (([v1 isBeingDismissed] & 1) != 0
    || ![WeakRetained isHomeAffordanceVisible])
  {
  }
  else
  {
    [WeakRetained _keyboardFrame];
    IsEmptdouble y = CGRectIsEmpty(v5);

    if (IsEmpty) {
      [WeakRetained _setLocalHomeAffordanceVisible:1];
    }
  }
}

- (PLExpandedPlatterPresentationControllerDelegate)presentationControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationControllerDelegate);
  return (PLExpandedPlatterPresentationControllerDelegate *)WeakRetained;
}

- (void)setPresentationControllerDelegate:(id)a3
{
}

- (BOOL)isHomeAffordanceVisible
{
  return self->_homeAffordanceVisible;
}

- (UIPanGestureRecognizer)homeAffordancePanGesture
{
  return self->_homeAffordancePanGesture;
}

- (double)additionalHomeAffordanceSpacing
{
  return self->_additionalHomeAffordanceSpacing;
}

- (CGPoint)additionalContentTranslation
{
  double x = self->_additionalContentTranslation.x;
  double y = self->_additionalContentTranslation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CGRect)_keyboardFrame
{
  double x = self->_keyboardFrame.origin.x;
  double y = self->_keyboardFrame.origin.y;
  double width = self->_keyboardFrame.size.width;
  double height = self->_keyboardFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)_setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (PLKeyboardHomeAffordanceAssertion)_keyboardHomeAffordance
{
  return self->_keyboardHomeAffordance;
}

- (void)_setKeyboardHomeAffordance:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyboardHomeAffordance, 0);
  objc_storeStrong((id *)&self->_homeAffordancePanGesture, 0);
  objc_destroyWeak((id *)&self->_presentationControllerDelegate);
  objc_storeStrong((id *)&self->_homeAffordanceView, 0);
  objc_storeStrong((id *)&self->_homeAffordanceFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_dismissFeedbackBehavior, 0);
  objc_storeStrong((id *)&self->_dismissLabel, 0);
  objc_storeStrong((id *)&self->_dismissLabelContainerView, 0);
  objc_destroyWeak((id *)&self->_activeTransitionCoordinator);
  objc_destroyWeak((id *)&self->_presentedExpandedPlatter);
  objc_destroyWeak((id *)&self->_sourceView);
}

+ (CGSize)_sizeOfViewWithPreferredContentSize:(CGSize)a3 inUseableContainerViewBounds:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double v8 = a3.height;
  double v9 = a3.width;
  double v10 = CGRectGetWidth(a4);
  if (v9 > v10) {
    double v9 = v10;
  }
  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v11 = CGRectGetHeight(v15);
  if (v8 <= v11) {
    double v12 = v8;
  }
  else {
    double v12 = v11;
  }
  double v13 = v9;
  result.CGFloat height = v12;
  result.CGFloat width = v13;
  return result;
}

@end