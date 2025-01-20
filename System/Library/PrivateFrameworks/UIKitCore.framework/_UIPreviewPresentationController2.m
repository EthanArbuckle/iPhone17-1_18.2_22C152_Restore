@interface _UIPreviewPresentationController2
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (BOOL)_shouldReduceMotion;
- (BOOL)hasPerformedInitialLayout;
- (BOOL)shouldEnableUserInteractionOnPlatter;
- (BOOL)shouldScaleContentViewToAspectFitPlatter;
- (CGAffineTransform)preferredContentPlatterTransform;
- (CGRect)_computedPlatterFrame;
- (CGRect)_preferredContentPlatterRectForContainerRect:(CGRect)a3;
- (UIViewControllerPreviewing_Internal)previewingContext;
- (UIViewPropertyAnimator)currentTransitionAnimator;
- (_UIPreviewInteractionHighlighting)currentHighlighter;
- (_UIPreviewPresentationController2)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 previewingContext:(id)a5;
- (_UIPreviewPresentationPlatterView)contentPlatterView;
- (_UIPreviewPresentationPlatterView)revealPlatterView;
- (double)interactiveTransitionFraction;
- (void)_layoutContentViews;
- (void)_performDismissAnimationsWithTransitionContext:(id)a3;
- (void)_performPresentationAnimationsWithTransitionContext:(id)a3;
- (void)_performReducedMotionDismissAnimationsWithTransitionContext:(id)a3;
- (void)_performReducedMotionPresentationAnimationsWithTransitionContext:(id)a3;
- (void)_performTransitionAnimations:(id)a3;
- (void)_prepareContentPlatterViewForPresentationTransitionIfNeeded:(id)a3;
- (void)_prepareContentViewsForPresentationAnimationsIfNeeded;
- (void)_prepareRevealPlatterViewForPresentationTransitionIfNeeded:(id)a3;
- (void)_presentationTransitionWillBeginForContainerEffectView:(id)a3;
- (void)_updateFromInteractionEffect:(id)a3;
- (void)containerViewDidLayoutSubviews;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setContentPlatterView:(id)a3;
- (void)setCurrentHighlighter:(id)a3;
- (void)setCurrentTransitionAnimator:(id)a3;
- (void)setHasPerformedInitialLayout:(BOOL)a3;
- (void)setInteractiveTransitionFraction:(double)a3;
- (void)setPreferredContentPlatterTransform:(CGAffineTransform *)a3;
- (void)setPreviewingContext:(id)a3;
- (void)setRevealPlatterView:(id)a3;
- (void)setShouldEnableUserInteractionOnPlatter:(BOOL)a3;
- (void)setShouldScaleContentViewToAspectFitPlatter:(BOOL)a3;
- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3;
@end

@implementation _UIPreviewPresentationController2

- (_UIPreviewPresentationController2)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4 previewingContext:(id)a5
{
  id v8 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_UIPreviewPresentationController2;
  v9 = [(UIPreviewPresentationController *)&v15 initWithPresentedViewController:a3 presentingViewController:a4];
  v10 = v9;
  if (v9)
  {
    [(_UIPreviewPresentationController2 *)v9 setShouldScaleContentViewToAspectFitPlatter:1];
    [(_UIPreviewPresentationController2 *)v10 setPreviewingContext:v8];
    long long v11 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    v14[0] = *MEMORY[0x1E4F1DAB8];
    v14[1] = v11;
    v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    [(_UIPreviewPresentationController2 *)v10 setPreferredContentPlatterTransform:v14];
    v12 = v10;
  }

  return v10;
}

- (void)_presentationTransitionWillBeginForContainerEffectView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewPresentationController2;
  id v4 = a3;
  [(UIPreviewPresentationController *)&v6 _presentationTransitionWillBeginForContainerEffectView:v4];
  -[_UIPreviewPresentationController2 _prepareRevealPlatterViewForPresentationTransitionIfNeeded:](self, "_prepareRevealPlatterViewForPresentationTransitionIfNeeded:", v4, v6.receiver, v6.super_class);
  [(_UIPreviewPresentationController2 *)self _prepareContentPlatterViewForPresentationTransitionIfNeeded:v4];

  v5 = [(UIPresentationController *)self containerView];
  [v5 setNeedsLayout];
  [v5 layoutIfNeeded];
  [(_UIPreviewPresentationController2 *)self _prepareContentViewsForPresentationAnimationsIfNeeded];
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  v11.receiver = self;
  v11.super_class = (Class)_UIPreviewPresentationController2;
  [(UIPreviewPresentationController *)&v11 presentationTransitionWillBegin];
  v3 = [(_UIPreviewPresentationController2 *)self previewingContext];

  if (v3)
  {
    id v4 = [(_UIPreviewPresentationController2 *)self revealPlatterView];
    v5 = [v4 contentView];

    objc_super v6 = [(_UIPreviewPresentationController2 *)self currentHighlighter];
    v7 = [(UIPresentationController *)self containerView];
    id v8 = [(_UIPreviewPresentationController2 *)self previewingContext];
    id v9 = (id)[v6 highlightShouldBeginInContainerView:v5 presentationContainerView:v7 previewingContext:v8];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68___UIPreviewPresentationController2_presentationTransitionWillBegin__block_invoke;
    v10[3] = &unk_1E52D9F70;
    v10[4] = self;
    [(_UIPreviewPresentationController2 *)self _performTransitionAnimations:v10];
  }
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController2;
  [(UIPreviewPresentationController *)&v3 presentationTransitionDidEnd:a3];
}

- (void)dismissalTransitionWillBegin
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewPresentationController2;
  [(UIPreviewPresentationController *)&v4 dismissalTransitionWillBegin];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65___UIPreviewPresentationController2_dismissalTransitionWillBegin__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  [(_UIPreviewPresentationController2 *)self _performTransitionAnimations:v3];
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController2;
  [(UIPreviewPresentationController *)&v3 dismissalTransitionDidEnd:a3];
}

- (void)containerViewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIPreviewPresentationController2;
  [(UIPresentationController *)&v3 containerViewDidLayoutSubviews];
  if (![(_UIPreviewPresentationController2 *)self hasPerformedInitialLayout])
  {
    [(_UIPreviewPresentationController2 *)self setHasPerformedInitialLayout:1];
    [(_UIPreviewPresentationController2 *)self _layoutContentViews];
  }
}

- (void)_layoutContentViews
{
  objc_super v3 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  objc_super v4 = [v3 contentView];

  [v4 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  -[_UIPreviewPresentationController2 _preferredContentPlatterRectForContainerRect:](self, "_preferredContentPlatterRectForContainerRect:");
  double v14 = v13;
  double v16 = v15;
  double v39 = v18;
  double v40 = v17;
  v19 = [(_UIPreviewPresentationController2 *)self previewingContext];
  double v41 = v16;
  double v42 = v14;
  if (v19)
  {
    v20 = [(_UIPreviewPresentationController2 *)self previewingContext];
    [v20 preferredSourceViewRectInCoordinateSpace:v4];
    uint64_t v35 = v22;
    uint64_t v37 = v21;
    double v24 = v23;
    double v26 = v25;
  }
  else
  {
    double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    uint64_t v35 = *(void *)(MEMORY[0x1E4F1DB28] + 8);
    uint64_t v37 = *MEMORY[0x1E4F1DB28];
    double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }

  if ([(_UIPreviewPresentationController2 *)self shouldScaleContentViewToAspectFitPlatter])
  {
    v27 = [(UIPresentationController *)self presentedViewController];
    [v27 preferredContentSize];
    double Width = v28;
    double Height = v30;

    if (Width == 0.0)
    {
      v46.origin.x = v6;
      v46.origin.y = v8;
      v46.size.width = v10;
      v46.size.height = v12;
      double Width = CGRectGetWidth(v46);
    }
    if (Height == 0.0)
    {
      v47.origin.x = v6;
      v47.origin.y = v8;
      v47.size.width = v10;
      v47.size.height = v12;
      double Height = CGRectGetHeight(v47);
    }
  }
  else
  {
    double Width = *MEMORY[0x1E4F1DB30];
    double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v32 = [(_UIPreviewPresentationController2 *)self contentPlatterView];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __56___UIPreviewPresentationController2__layoutContentViews__block_invoke;
  v44[3] = &unk_1E52D9F70;
  id v45 = v32;
  id v33 = v32;
  +[UIView performWithoutAnimation:v44];
  objc_msgSend(v33, "setContentSize:", Width, Height);
  objc_msgSend(v33, "setFrame:", v42, v41, v40, v39);
  [v33 setCornerRadius:13.0];
  [v33 setDropShadowEnabled:1];
  [(_UIPreviewPresentationController2 *)self preferredContentPlatterTransform];
  *(_OWORD *)v43 = *(_OWORD *)&v43[7];
  *(_OWORD *)&v43[2] = *(_OWORD *)&v43[9];
  *(_OWORD *)&v43[4] = *(_OWORD *)&v43[11];
  [v33 setTransform:v43];
  v34 = [(_UIPreviewPresentationController2 *)self revealPlatterView];
  objc_msgSend(v34, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v24, v26);
  objc_msgSend(v34, "setCenter:", v38 + v24 * 0.5, v36 + v26 * 0.5);
  [v34 setDropShadowEnabled:0];
}

- (CGRect)_preferredContentPlatterRectForContainerRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (CGRectIsEmpty(a3))
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    _UIPreviewInteractionPlatterInsetsForRect(x, y, width, height);
    double v8 = x + v12;
    double v9 = y + v13;
    double v10 = width - (v12 + v14);
    double v11 = height - (v13 + v15);
    double v16 = [(UIPresentationController *)self presentedViewController];
    [v16 preferredContentSize];
    double v18 = v17;
    double v20 = v19;

    if (v18 != *MEMORY[0x1E4F1DB30] || v20 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      if (v18 <= 0.0) {
        double v22 = v10;
      }
      else {
        double v22 = v18;
      }
      if (v20 <= 0.0) {
        double v23 = v11;
      }
      else {
        double v23 = v20;
      }
      double v24 = v22 / v23;
      if (v24 <= v10 / v11)
      {
        double v25 = v11 * v24;
        double v26 = v11;
      }
      else
      {
        double v25 = v10;
        double v26 = v10 / v24;
      }
      v27 = [(UIPresentationController *)self traitCollection];
      [v27 displayScale];
      double v8 = UIRectCenteredIntegralRectScale(0.0, 0.0, v25, v26, v8, v9, v10, v11, v28);
      double v9 = v29;
      double v10 = v30;
      double v11 = v31;
    }
  }
  double v32 = v8;
  double v33 = v9;
  double v34 = v10;
  double v35 = v11;
  result.size.double height = v35;
  result.size.double width = v34;
  result.origin.double y = v33;
  result.origin.double x = v32;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIPreviewPresentationController2;
  [(UIPresentationController *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(_UIPreviewPresentationController2 *)self _layoutContentViews];
}

- (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPreviewPresentationController2;
  [(UIPresentationController *)&v5 systemLayoutFittingSizeDidChangeForChildContentContainer:a3];
  objc_super v4 = [(UIPresentationController *)self containerView];
  [v4 setNeedsLayout];
}

- (void)_prepareRevealPlatterViewForPresentationTransitionIfNeeded:(id)a3
{
  id v14 = a3;
  objc_super v4 = [(_UIPreviewPresentationController2 *)self revealPlatterView];

  if (!v4)
  {
    objc_super v5 = [(_UIPreviewPresentationController2 *)self previewingContext];

    if (v5)
    {
      CGFloat v6 = [(_UIPreviewPresentationController2 *)self previewingContext];
      [v6 preferredSourceViewRectInCoordinateSpace:0];
      double v8 = v7;
      double v10 = v9;

      double v11 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v8, v10);
      double v12 = [[_UIPreviewPresentationPlatterView alloc] initWithContentView:v11];
      [(UIView *)v12 setUserInteractionEnabled:0];
      double v13 = [v14 contentView];
      [v13 addSubview:v12];

      [(_UIPreviewPresentationController2 *)self setRevealPlatterView:v12];
    }
  }
}

- (void)_prepareContentPlatterViewForPresentationTransitionIfNeeded:(id)a3
{
  id v9 = a3;
  objc_super v4 = [(_UIPreviewPresentationController2 *)self contentPlatterView];

  if (!v4)
  {
    objc_super v5 = [(UIPresentationController *)self presentedViewController];
    CGFloat v6 = [v5 view];

    double v7 = [[_UIPreviewPresentationPlatterView alloc] initWithContentView:v6];
    [(UIView *)v7 setUserInteractionEnabled:[(_UIPreviewPresentationController2 *)self shouldEnableUserInteractionOnPlatter]];
    double v8 = [v9 contentView];
    [v8 addSubview:v7];

    [(_UIPreviewPresentationController2 *)self setContentPlatterView:v7];
  }
}

- (void)_prepareContentViewsForPresentationAnimationsIfNeeded
{
  objc_super v3 = [(_UIPreviewPresentationController2 *)self currentTransitionAnimator];

  if (v3)
  {
    objc_super v4 = [(UIPresentationController *)self presentedViewController];
    objc_super v5 = [v4 transitionCoordinator];

    if (v5)
    {
      CGFloat v6 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
      double v7 = [(_UIPreviewPresentationController2 *)self contentPlatterView];
      [v7 frame];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat v15 = v14;
      double v16 = [(_UIPreviewPresentationController2 *)self previewingContext];
      double v17 = [v6 contentView];
      [v16 preferredSourceViewRectInCoordinateSpace:v17];
      CGFloat v19 = v18;
      CGFloat v21 = v20;
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v34 = v24;

      long long v36 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v40.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v40.c = v36;
      *(_OWORD *)&v40.tdouble x = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      v41.origin.double x = v19;
      v41.origin.double y = v21;
      v41.size.double width = v23;
      v41.size.double height = v25;
      double MidX = CGRectGetMidX(v41);
      v42.origin.double x = v9;
      v42.origin.double y = v11;
      v42.size.double width = v13;
      v42.size.double height = v15;
      tdouble x = MidX - CGRectGetMidX(v42);
      v43.origin.double x = v19;
      v43.origin.double y = v21;
      CGFloat v27 = v21;
      v43.size.double width = v23;
      v43.size.double height = v34;
      double MidY = CGRectGetMidY(v43);
      v44.origin.double x = v9;
      v44.origin.double y = v11;
      v44.size.double width = v13;
      v44.size.double height = v15;
      CGFloat v29 = CGRectGetMidY(v44);
      *(_OWORD *)&v39.a = *(_OWORD *)&v40.a;
      *(_OWORD *)&v39.c = v36;
      *(_OWORD *)&v39.tdouble x = *(_OWORD *)&v40.tx;
      CGAffineTransformTranslate(&v40, &v39, tx, MidY - v29);
      v45.origin.double x = v19;
      v45.origin.double y = v27;
      v45.size.double width = v23;
      v45.size.double height = v34;
      double Height = CGRectGetHeight(v45);
      v46.origin.double x = v9;
      v46.origin.double y = v11;
      v46.size.double width = v13;
      v46.size.double height = v15;
      CGFloat v31 = CGRectGetHeight(v46);
      CGAffineTransform v38 = v40;
      CGAffineTransformScale(&v39, &v38, Height / v31 * 1.2, Height / v31 * 1.2);
      *(_OWORD *)&v40.tdouble x = *(_OWORD *)&v39.tx;
      CGAffineTransform v37 = v39;
      [v7 setTransform:&v37];
      [v7 setAlpha:0.0];
      [v7 setBlurRadius:96.0];
      [v7 setDropShadowEnabled:0];
      double v32 = [(UIPresentationController *)self traitCollection];
      double v33 = +[UIForcePresentationHelper visualEffectForPresentationPhase:0 traitCollection:v32 variant:0];
      [v6 setEffect:v33];
    }
  }
}

- (void)_performTransitionAnimations:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIPreviewPresentationController2 *)self currentTransitionAnimator];
  [v5 addAnimations:v4];
}

- (void)_performPresentationAnimationsWithTransitionContext:(id)a3
{
  id v4 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  CGFloat v13 = [(_UIPreviewPresentationController2 *)self contentPlatterView];
  double v14 = [(_UIPreviewPresentationController2 *)self revealPlatterView];
  -[_UIPreviewPresentationController2 _preferredContentPlatterRectForContainerRect:](self, "_preferredContentPlatterRectForContainerRect:", v6, v8, v10, v12);
  uint64_t v41 = v16;
  uint64_t v42 = v15;
  uint64_t v40 = v17;
  uint64_t v19 = v18;
  double v20 = [(_UIPreviewPresentationController2 *)self previewingContext];
  CGFloat v21 = [v4 contentView];
  [v20 preferredSourceViewRectInCoordinateSpace:v21];
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  uint64_t v29 = v28;

  double v30 = [(_UIPreviewPresentationController2 *)self currentTransitionAnimator];
  [v30 duration];
  double v32 = v31;

  [(_UIPreviewPresentationController2 *)self interactiveTransitionFraction];
  double v34 = v33;
  double v35 = [(UIPresentationController *)self traitCollection];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __89___UIPreviewPresentationController2__performPresentationAnimationsWithTransitionContext___block_invoke;
  v43[3] = &unk_1E53003D8;
  id v44 = v14;
  id v45 = v4;
  CGRect v46 = self;
  id v47 = v35;
  double v49 = v34;
  double v50 = 1.0 - v34;
  uint64_t v51 = v42;
  uint64_t v52 = v41;
  uint64_t v53 = v40;
  uint64_t v54 = v19;
  uint64_t v55 = v23;
  uint64_t v56 = v25;
  uint64_t v57 = v27;
  uint64_t v58 = v29;
  id v48 = v13;
  id v36 = v13;
  id v37 = v35;
  id v38 = v4;
  id v39 = v14;
  +[UIView animateKeyframesWithDuration:6 delay:v43 options:0 animations:v32 completion:0.0];
}

- (void)_performReducedMotionPresentationAnimationsWithTransitionContext:(id)a3
{
  id v4 = [(_UIPreviewPresentationController2 *)self contentPlatterView];
  [v4 setAlpha:1.0];

  double v5 = [(_UIPreviewPresentationController2 *)self revealPlatterView];
  [v5 setAlpha:0.0];

  double v6 = objc_opt_class();
  id v9 = [(UIPresentationController *)self traitCollection];
  double v7 = [v6 _backgroundEffectForTraitCollection:v9 interactive:0];
  double v8 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  [v8 setEffect:v7];
}

- (void)_performDismissAnimationsWithTransitionContext:(id)a3
{
  id v4 = a3;
  if ([(_UIPreviewPresentationController2 *)self _shouldReduceMotion])
  {
    [(_UIPreviewPresentationController2 *)self _performReducedMotionDismissAnimationsWithTransitionContext:v4];
  }
  else
  {
    double v5 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(_UIPreviewPresentationController2 *)self contentPlatterView];
    -[_UIPreviewPresentationController2 _preferredContentPlatterRectForContainerRect:](self, "_preferredContentPlatterRectForContainerRect:", v7, v9, v11, v13);
    uint64_t v37 = v15;
    uint64_t v17 = v16;
    uint64_t v19 = v18;
    uint64_t v21 = v20;
    uint64_t v22 = [(_UIPreviewPresentationController2 *)self previewingContext];
    uint64_t v23 = [v5 contentView];
    [v22 preferredSourceViewRectInCoordinateSpace:v23];
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    uint64_t v29 = v28;
    uint64_t v31 = v30;

    double v32 = [(_UIPreviewPresentationController2 *)self currentTransitionAnimator];
    [v32 duration];
    double v34 = v33;

    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __84___UIPreviewPresentationController2__performDismissAnimationsWithTransitionContext___block_invoke;
    v38[3] = &unk_1E52DF190;
    id v39 = v5;
    id v40 = v14;
    uint64_t v41 = v25;
    uint64_t v42 = v27;
    uint64_t v43 = v29;
    uint64_t v44 = v31;
    uint64_t v45 = v37;
    uint64_t v46 = v17;
    uint64_t v47 = v19;
    uint64_t v48 = v21;
    id v35 = v14;
    id v36 = v5;
    +[UIView animateKeyframesWithDuration:6 delay:v38 options:0 animations:v34 completion:0.0];
  }
}

- (void)_performReducedMotionDismissAnimationsWithTransitionContext:(id)a3
{
  id v4 = [(_UIPreviewPresentationController2 *)self contentPlatterView];
  [v4 setAlpha:0.0];

  double v5 = [(_UIPreviewPresentationController2 *)self revealPlatterView];
  [v5 setAlpha:0.0];

  id v6 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  [v6 setEffect:0];
}

- (BOOL)_shouldReduceMotion
{
  return _AXSReduceMotionEnabled() != 0;
}

- (CGRect)_computedPlatterFrame
{
  objc_super v3 = [(UIPreviewPresentationController *)self presentationContainerEffectView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[_UIPreviewPresentationController2 _preferredContentPlatterRectForContainerRect:](self, "_preferredContentPlatterRectForContainerRect:", v5, v7, v9, v11);
  result.size.double height = v15;
  result.size.double width = v14;
  result.origin.double y = v13;
  result.origin.double x = v12;
  return result;
}

- (void)_updateFromInteractionEffect:(id)a3
{
  if (a3)
  {
    [a3 preferredContentTransform];
  }
  else
  {
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
  }
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  [(_UIPreviewPresentationController2 *)self setPreferredContentPlatterTransform:v6];
  [(_UIPreviewPresentationController2 *)self preferredContentPlatterTransform];
  double v4 = [(_UIPreviewPresentationController2 *)self contentPlatterView];
  v5[0] = v5[3];
  v5[1] = v5[4];
  v5[2] = v5[5];
  [v4 setTransform:v5];
}

- (UIViewControllerPreviewing_Internal)previewingContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_previewingContext);
  return (UIViewControllerPreviewing_Internal *)WeakRetained;
}

- (void)setPreviewingContext:(id)a3
{
}

- (_UIPreviewPresentationPlatterView)revealPlatterView
{
  return self->_revealPlatterView;
}

- (void)setRevealPlatterView:(id)a3
{
}

- (BOOL)hasPerformedInitialLayout
{
  return self->_hasPerformedInitialLayout;
}

- (void)setHasPerformedInitialLayout:(BOOL)a3
{
  self->_hasPerformedInitialLayout = a3;
}

- (CGAffineTransform)preferredContentPlatterTransform
{
  long long v3 = *(_OWORD *)&self[10].tx;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].c;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[11].a;
  return self;
}

- (void)setPreferredContentPlatterTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_preferredContentPlatterTransform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_preferredContentPlatterTransform.c = v4;
  *(_OWORD *)&self->_preferredContentPlatterTransform.tdouble x = v3;
}

- (_UIPreviewInteractionHighlighting)currentHighlighter
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentHighlighter);
  return (_UIPreviewInteractionHighlighting *)WeakRetained;
}

- (void)setCurrentHighlighter:(id)a3
{
}

- (UIViewPropertyAnimator)currentTransitionAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentTransitionAnimator);
  return (UIViewPropertyAnimator *)WeakRetained;
}

- (void)setCurrentTransitionAnimator:(id)a3
{
}

- (double)interactiveTransitionFraction
{
  return self->_interactiveTransitionFraction;
}

- (void)setInteractiveTransitionFraction:(double)a3
{
  self->_interactiveTransitionFraction = a3;
}

- (_UIPreviewPresentationPlatterView)contentPlatterView
{
  return self->_contentPlatterView;
}

- (void)setContentPlatterView:(id)a3
{
}

- (BOOL)shouldScaleContentViewToAspectFitPlatter
{
  return self->_shouldScaleContentViewToAspectFitPlatter;
}

- (void)setShouldScaleContentViewToAspectFitPlatter:(BOOL)a3
{
  self->_shouldScaleContentViewToAspectFitPlatter = a3;
}

- (BOOL)shouldEnableUserInteractionOnPlatter
{
  return self->_shouldEnableUserInteractionOnPlatter;
}

- (void)setShouldEnableUserInteractionOnPlatter:(BOOL)a3
{
  self->_shouldEnableUserInteractionOnPlatter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentPlatterView, 0);
  objc_destroyWeak((id *)&self->_currentTransitionAnimator);
  objc_destroyWeak((id *)&self->_currentHighlighter);
  objc_storeStrong((id *)&self->_revealPlatterView, 0);
  objc_destroyWeak((id *)&self->_previewingContext);
}

@end