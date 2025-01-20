@interface PLViewControllerAnimator
+ (BOOL)drivesAnimation;
- (BOOL)_isTransitionAnimated;
- (BOOL)includePresentingViewInAnimation;
- (BOOL)isPresenting;
- (BOOL)runAlongsideAnimationsManually;
- (UIViewPropertyAnimator)propertyAnimator;
- (double)transitionDuration:(id)a3;
- (id)_newPropertyAnimator;
- (id)_presentedExpandedPlatterForPresentedView:(id)a3;
- (id)_presentedViewControllerForPresentation:(BOOL)a3 withTransitionContext:(id)a4;
- (id)_presentedViewForPresentation:(BOOL)a3 withTransitionContext:(id)a4;
- (id)_presentingViewControllerForPresentation:(BOOL)a3 withTransitionContext:(id)a4;
- (id)_presentingViewForPresentation:(BOOL)a3 withTransitionContext:(id)a4;
- (id)_previewInteractionPresentableViewControllerForPresentation:(BOOL)a3 withTransitionContext:(id)a4;
- (id)_sourceViewForPresentation:(BOOL)a3 withTransitionContext:(id)a4;
- (id)initForPresentation:(BOOL)a3 withSourceView:(id)a4;
- (void)_animateTransitionWithContext:(id)a3 completion:(id)a4;
- (void)_notifyObserversWithBlock:(id)a3;
- (void)_performTransitionWithContext:(id)a3;
- (void)addObserver:(id)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)performTransitionWithContext:(id)a3;
- (void)prepareForTransitionWithContext:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setIncludePresentingViewInAnimation:(BOOL)a3;
- (void)setRunAlongsideAnimationsManually:(BOOL)a3;
@end

@implementation PLViewControllerAnimator

+ (BOOL)drivesAnimation
{
  return 0;
}

- (id)initForPresentation:(BOOL)a3 withSourceView:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLViewControllerAnimator;
  v8 = [(PLViewControllerAnimator *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_presenting = a3;
    objc_storeStrong((id *)&v8->_sourceView, a4);
  }

  return v9;
}

- (UIViewPropertyAnimator)propertyAnimator
{
  propertyAnimator = self->_propertyAnimator;
  if (!propertyAnimator)
  {
    v4 = [(PLViewControllerAnimator *)self _newPropertyAnimator];
    v5 = self->_propertyAnimator;
    self->_propertyAnimator = v4;

    propertyAnimator = self->_propertyAnimator;
  }
  return propertyAnimator;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    observers = self->_observers;
    id v9 = v5;
    if (!observers)
    {
      id v7 = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:5];
      v8 = self->_observers;
      self->_observers = v7;

      observers = self->_observers;
    }
    id v4 = (id)[(NSPointerArray *)observers addPointer:v9];
    id v5 = v9;
  }
  MEMORY[0x1F41817F8](v4, v5);
}

- (void)removeObserver:(id)a3
{
  id v6 = a3;
  if (v6)
  {
    observers = self->_observers;
    if (observers)
    {
      [(NSPointerArray *)observers compact];
      if ([(NSPointerArray *)self->_observers count])
      {
        uint64_t v5 = 0;
        while ([(NSPointerArray *)self->_observers pointerAtIndex:v5] != v6)
        {
          if (++v5 >= [(NSPointerArray *)self->_observers count]) {
            goto LABEL_9;
          }
        }
        [(NSPointerArray *)self->_observers removePointerAtIndex:v5];
      }
    }
  }
LABEL_9:
}

- (void)_notifyObserversWithBlock:(id)a3
{
  id v4 = (void (**)(id, id, void *))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      [(NSPointerArray *)observers compact];
      if ([(NSPointerArray *)self->_observers count])
      {
        unint64_t v6 = 0;
        do
        {
          objc_initWeak(&location, self);
          id v7 = [(NSPointerArray *)self->_observers pointerAtIndex:v6];
          id v8 = objc_loadWeakRetained(&location);
          v4[2](v4, v8, v7);

          objc_destroyWeak(&location);
          ++v6;
        }
        while (v6 < [(NSPointerArray *)self->_observers count]);
      }
    }
  }
}

- (BOOL)_isTransitionAnimated
{
  return !UIAccessibilityIsReduceMotionEnabled();
}

- (id)_newPropertyAnimator
{
  id v2 = objc_alloc(MEMORY[0x1E4F43008]);
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F42E18]) initWithDampingRatio:1.0];
  id v4 = (void *)[v2 initWithDuration:v3 timingParameters:0.3];

  return v4;
}

- (id)_presentingViewForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F43EB8];
  if (!a3) {
    id v4 = (void *)MEMORY[0x1E4F43EC8];
  }
  return (id)[a4 viewForKey:*v4];
}

- (id)_presentedViewForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F43EC8];
  if (!a3) {
    id v4 = (void *)MEMORY[0x1E4F43EB8];
  }
  return (id)[a4 viewForKey:*v4];
}

- (id)_sourceViewForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  sourceView = self->_sourceView;
  if (sourceView)
  {
    uint64_t v5 = sourceView;
  }
  else
  {
    uint64_t v5 = [(PLViewControllerAnimator *)self _presentingViewForPresentation:a3 withTransitionContext:a4];
  }
  return v5;
}

- (id)_presentingViewControllerForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F43EB0];
  if (!a3) {
    id v4 = (void *)MEMORY[0x1E4F43EC0];
  }
  return (id)[a4 viewControllerForKey:*v4];
}

- (id)_presentedViewControllerForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  id v4 = (void *)MEMORY[0x1E4F43EC0];
  if (!a3) {
    id v4 = (void *)MEMORY[0x1E4F43EB0];
  }
  return (id)[a4 viewControllerForKey:*v4];
}

- (id)_previewInteractionPresentableViewControllerForPresentation:(BOOL)a3 withTransitionContext:(id)a4
{
  id v4 = [(PLViewControllerAnimator *)self _presentedViewControllerForPresentation:a3 withTransitionContext:a4];
  if ([v4 conformsToProtocol:&unk_1F337DF90]) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_presentedExpandedPlatterForPresentedView:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_1F336C850])
  {
    id v4 = v3;
LABEL_5:
    uint64_t v5 = v4;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 expandedPlatterView];
    goto LABEL_5;
  }
  uint64_t v5 = 0;
LABEL_7:

  return v5;
}

- (void)prepareForTransitionWithContext:(id)a3
{
  id v4 = a3;
  self->_didPrepareForTransition = 1;
  if (self->_presenting)
  {
    uint64_t v5 = [(PLViewControllerAnimator *)self _presentedViewForPresentation:1 withTransitionContext:v4];
    id v6 = [(PLViewControllerAnimator *)self _presentedExpandedPlatterForPresentedView:v5];
    [v6 setClipsVisibleContentToBounds:1];
    id v7 = [(PLViewControllerAnimator *)self _presentedViewControllerForPresentation:self->_presenting withTransitionContext:v4];
    id v8 = [v7 expandedPlatterPresentationController];
    id v9 = [v5 superview];
    [v8 initialFrameOfPresentedViewInContainerView];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = [v8 containerView];
    objc_msgSend(v9, "convertRect:fromView:", v18, v11, v13, v15, v17);
    double v20 = v19;
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;

    objc_msgSend(v5, "setFrame:", v20, v22, v24, v26);
    [v5 layoutIfNeeded];
    if ([(PLViewControllerAnimator *)self includePresentingViewInAnimation])
    {
      memset(&v48, 0, sizeof(v48));
      if (v4) {
        [v4 targetTransform];
      }
      CGAffineTransform v47 = v48;
      if (CGAffineTransformIsIdentity(&v47))
      {
        long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v47.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v47.c = v27;
        long long v28 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      else
      {
        *(_OWORD *)&v47.a = *(_OWORD *)&v48.a;
        *(_OWORD *)&v47.c = *(_OWORD *)&v48.c;
        long long v28 = *(_OWORD *)&v48.tx;
      }
      *(_OWORD *)&v47.tx = v28;
      v46[0] = *(_OWORD *)&v47.a;
      v46[1] = *(_OWORD *)&v47.c;
      v46[2] = v28;
      [v5 setTransform:v46];
    }
    [v5 setAlpha:0.1];
    [v6 setActionsHidden:1];
LABEL_15:

    goto LABEL_16;
  }
  if ([(PLViewControllerAnimator *)self includePresentingViewInAnimation])
  {
    uint64_t v5 = [(PLViewControllerAnimator *)self _presentedViewControllerForPresentation:self->_presenting withTransitionContext:v4];
    id v6 = [v5 expandedPlatterPresentationController];
    [v6 finalPresentationFrameOfPresentingViewInContainerView];
    double v30 = v29;
    double v32 = v31;
    double v34 = v33;
    double v36 = v35;
    v37 = [(PLViewControllerAnimator *)self _previewInteractionPresentableViewControllerForPresentation:self->_presenting withTransitionContext:v4];
    v38 = [v37 presenter];
    id v7 = [v38 viewForPreview];

    v39 = [v7 superview];
    v40 = [v6 containerView];
    objc_msgSend(v39, "convertRect:fromView:", v40, v30, v32, v34, v36);
    objc_msgSend(v7, "setFrame:");

    [v7 layoutIfNeeded];
    id v8 = [v4 viewForKey:*MEMORY[0x1E4F43EC8]];
    v41 = [v8 superview];
    v42 = [v6 containerView];
    objc_msgSend(v41, "convertRect:fromView:", v42, v30, v32, v34, v36);
    objc_msgSend(v8, "setFrame:");

    memset(&v48, 0, sizeof(v48));
    if (v4) {
      [v4 targetTransform];
    }
    CGAffineTransform v47 = v48;
    if (!CGAffineTransformIsIdentity(&v47))
    {
      CGAffineTransform v47 = v48;
      [v8 setTransform:&v47];
    }
    goto LABEL_15;
  }
LABEL_16:
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __60__PLViewControllerAnimator_prepareForTransitionWithContext___block_invoke;
  v44[3] = &unk_1E6B5FBE0;
  id v45 = v4;
  id v43 = v4;
  [(PLViewControllerAnimator *)self _notifyObserversWithBlock:v44];
}

void __60__PLViewControllerAnimator_prepareForTransitionWithContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v5 = a3;
  if [v6 isPresenting] && (objc_opt_respondsToSelector())
  {
    [v5 viewControllerAnimator:v6 willBeginPresentationAnimationWithTransitionContext:*(void *)(a1 + 32)];
  }
  else if ([v6 isPresenting] & 1) == 0 && (objc_opt_respondsToSelector())
  {
    [v5 viewControllerAnimator:v6 willBeginDismissalAnimationWithTransitionContext:*(void *)(a1 + 32)];
  }
}

- (void)performTransitionWithContext:(id)a3
{
  id v6 = a3;
  -[PLViewControllerAnimator _performTransitionWithContext:](self, "_performTransitionWithContext:");
  if (self->_runAlongsideAnimationsManually && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v6, "__runAlongsideAnimations");
  }
  id v4 = [(PLViewControllerAnimator *)self _presentedViewControllerForPresentation:self->_presenting withTransitionContext:v6];
  id v5 = [v4 expandedPlatterPresentationController];
  [v5 completeDismissal];
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)_performTransitionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = [v4 viewForKey:*MEMORY[0x1E4F43EC8]];
  id v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v8 = [v4 viewControllerForKey:*MEMORY[0x1E4F43EC0]];
    id v7 = [v8 view];
  }
  id v9 = [v4 viewForKey:*MEMORY[0x1E4F43EB8]];
  double v10 = v9;
  if (v9)
  {
    id v11 = v9;
  }
  else
  {
    double v12 = [v4 viewControllerForKey:*MEMORY[0x1E4F43EB0]];
    id v11 = [v12 view];
  }
  [v7 _removeAllAnimations:1];
  double v13 = [(PLViewControllerAnimator *)self _presentedViewControllerForPresentation:self->_presenting withTransitionContext:v4];
  double v14 = [v13 expandedPlatterPresentationController];
  double v15 = v14;
  if (self->_presenting) {
    [v14 finalPresentationFrameOfPresentingViewInContainerView];
  }
  else {
    [v14 finalDismissalFrameOfPresentingViewInContainerView];
  }
  double v20 = v16;
  double v21 = v17;
  double v22 = v18;
  double v23 = v19;
  if (self->_presenting) {
    [v15 frameOfPresentedViewInContainerView];
  }
  else {
    [v15 initialFrameOfPresentedViewInContainerView];
  }
  double v28 = v24;
  double v29 = v25;
  double v30 = v26;
  double v31 = v27;
  if (self->_presenting) {
    double v32 = v11;
  }
  else {
    double v32 = v7;
  }
  id v61 = v32;
  double v33 = [(PLViewControllerAnimator *)self _previewInteractionPresentableViewControllerForPresentation:self->_presenting withTransitionContext:v4];
  double v34 = [v33 presenter];
  double v35 = [v34 viewForPreview];

  double v36 = [v13 view];
  v37 = [v36 superview];
  [v15 containerView];
  v38 = v13;
  v40 = v39 = v11;
  objc_msgSend(v37, "convertRect:fromView:", v40, v28, v29, v30, v31);
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;
  double v48 = v47;

  v49 = [(PLViewControllerAnimator *)self _presentedExpandedPlatterForPresentedView:v36];
  BOOL v50 = [(PLViewControllerAnimator *)self includePresentingViewInAnimation];
  v51 = v7;
  v52 = (long long *)MEMORY[0x1E4F1DAB8];
  if (v50)
  {
    v59 = v39;
    v60 = v51;
    v53 = [v35 superview];
    v54 = [v15 containerView];
    objc_msgSend(v53, "convertRect:fromView:", v54, v20, v21, v22, v23);
    objc_msgSend(v35, "setFrame:");

    [v35 layoutIfNeeded];
    if (self->_presenting)
    {
      long long v55 = v52[1];
      long long v62 = *v52;
      long long v63 = v55;
      long long v64 = v52[2];
      [v61 setTransform:&v62];
    }
    v56 = [v61 superview];
    v57 = [v15 containerView];
    objc_msgSend(v56, "convertRect:fromView:", v57, v20, v21, v22, v23);
    objc_msgSend(v61, "setFrame:");

    [v61 layoutIfNeeded];
    v39 = v59;
    v51 = v60;
  }
  [v49 setClipsVisibleContentToBounds:!self->_presenting];
  long long v58 = v52[1];
  long long v62 = *v52;
  long long v63 = v58;
  long long v64 = v52[2];
  [v36 setTransform:&v62];
  objc_msgSend(v36, "setFrame:", v42, v44, v46, v48);
  [v36 layoutIfNeeded];
  [v49 setActionsHidden:!self->_presenting];
  [v51 setAlpha:1.0];
  [v39 setAlpha:0.0];
}

- (void)_animateTransitionWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLViewControllerAnimator *)self propertyAnimator];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PLViewControllerAnimator__animateTransitionWithContext_completion___block_invoke;
  v12[3] = &unk_1E6B5FC08;
  v12[4] = self;
  id v9 = v6;
  id v13 = v9;
  [v8 addAnimations:v12];
  if (v7)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __69__PLViewControllerAnimator__animateTransitionWithContext_completion___block_invoke_2;
    v10[3] = &unk_1E6B5FC30;
    id v11 = v7;
    [v8 addCompletion:v10];
  }
  [v8 startAnimation];
}

uint64_t __69__PLViewControllerAnimator__animateTransitionWithContext_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performTransitionWithContext:*(void *)(a1 + 40)];
}

uint64_t __69__PLViewControllerAnimator__animateTransitionWithContext_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  if (!self->_didPrepareForTransition) {
    [(PLViewControllerAnimator *)self prepareForTransitionWithContext:v4];
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__PLViewControllerAnimator_animateTransition___block_invoke;
  v6[3] = &unk_1E6B5F878;
  id v7 = v4;
  id v5 = v4;
  [(PLViewControllerAnimator *)self _animateTransitionWithContext:v5 completion:v6];
}

uint64_t __46__PLViewControllerAnimator_animateTransition___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) completeTransition:a2];
}

- (void)animationEnded:(BOOL)a3
{
  self->_propertyAnimator = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)isPresenting
{
  return self->_presenting;
}

- (BOOL)includePresentingViewInAnimation
{
  return self->_includePresentingViewInAnimation;
}

- (void)setIncludePresentingViewInAnimation:(BOOL)a3
{
  self->_includePresentingViewInAnimation = a3;
}

- (BOOL)runAlongsideAnimationsManually
{
  return self->_runAlongsideAnimationsManually;
}

- (void)setRunAlongsideAnimationsManually:(BOOL)a3
{
  self->_runAlongsideAnimationsManually = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyAnimator, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
}

@end