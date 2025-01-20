@interface PLClickPresentationInteractionManager
+ (void)initialize;
- (BOOL)_delegateShouldAllowLongPressGesture;
- (BOOL)_delegateShouldBeginInteractionWithTouchAtLocation:(CGPoint)a3;
- (BOOL)_dismissIfPossibleWithTrigger:(int64_t)a3;
- (BOOL)_willPresent;
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (BOOL)clickPresentationInteractionShouldPresent:(id)a3;
- (BOOL)didInteractionInitiateWithHint;
- (BOOL)dismissIfPossible:(id)a3;
- (BOOL)hasCommittedToPresentation;
- (BOOL)presentIfPossible:(id)a3;
- (PLClickPresentationInteractionManager)initWithPresentingViewController:(id)a3;
- (PLClickPresentationInteractionManager)initWithPresentingViewController:(id)a3 delegate:(id)a4;
- (PLClickPresentationInteractionManagerDelegate)delegate;
- (PLClickPresentationInteractionPresentable)presentedViewController;
- (UIGestureRecognizer)gestureRecognizerForExclusionRelationship;
- (id)_delegateContainerView;
- (id)_delegatePresentedViewController;
- (id)_delegateTransitioningDelegate;
- (id)_presentedViewController;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3;
- (void)_clickInteractionDidEnd;
- (void)_clickPresentationTransitionDidDismiss:(BOOL)a3;
- (void)_clickPresentationTransitionDidPresent:(BOOL)a3;
- (void)_delegateDeclinedDismissingPresentedContentWithTrigger:(int64_t)a3;
- (void)_delegateDidEndUserInteraction;
- (void)_delegateShouldFinishInteractionThatReachedForceThreshold:(BOOL)a3 withCompletionBlock:(id)a4;
- (void)_delegateWillBeginUserInteraction;
- (void)_delegateWillDismissPresentedContentWithTrigger:(int64_t)a3;
- (void)_setDidInteractionInitiateWithHint:(BOOL)a3;
- (void)_setPresentingViewControllerHighlighted:(BOOL)a3 animated:(BOOL)a4;
- (void)_setWillPresent:(BOOL)a3;
- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)resetForInitialInteraction;
- (void)setDelegate:(id)a3;
@end

@implementation PLClickPresentationInteractionManager

+ (void)initialize
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    PLRegisterPlatterKitLogging();
  }
}

- (PLClickPresentationInteractionManager)initWithPresentingViewController:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PLClickPresentationInteractionManager;
  v8 = [(PLClickPresentationInteractionManager *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentingViewController, v6);
    [(PLClickPresentationInteractionManager *)v9 setDelegate:v7];
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F430E8]) initWithDelegate:v9];
    clickPresentationInteraction = v9->_clickPresentationInteraction;
    v9->_clickPresentationInteraction = (_UIClickPresentationInteraction *)v10;

    v12 = [v6 viewForPreview];
    [v12 addInteraction:v9->_clickPresentationInteraction];
  }
  return v9;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFFE | objc_opt_respondsToSelector() & 1;
    if (objc_opt_respondsToSelector()) {
      __int16 v5 = 2;
    }
    else {
      __int16 v5 = 0;
    }
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFFD | v5;
    if (objc_opt_respondsToSelector()) {
      __int16 v6 = 4;
    }
    else {
      __int16 v6 = 0;
    }
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFFB | v6;
    if (objc_opt_respondsToSelector()) {
      __int16 v7 = 8;
    }
    else {
      __int16 v7 = 0;
    }
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFF7 | v7;
    if (objc_opt_respondsToSelector()) {
      __int16 v8 = 16;
    }
    else {
      __int16 v8 = 0;
    }
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFEF | v8;
    if (objc_opt_respondsToSelector()) {
      __int16 v9 = 32;
    }
    else {
      __int16 v9 = 0;
    }
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFDF | v9;
    if (objc_opt_respondsToSelector()) {
      __int16 v10 = 64;
    }
    else {
      __int16 v10 = 0;
    }
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFFBF | v10;
    if (objc_opt_respondsToSelector()) {
      __int16 v11 = 128;
    }
    else {
      __int16 v11 = 0;
    }
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFF7F | v11;
    if (objc_opt_respondsToSelector()) {
      __int16 v12 = 256;
    }
    else {
      __int16 v12 = 0;
    }
    *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags = *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0xFEFF | v12;
  }
}

- (BOOL)hasCommittedToPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  v4 = WeakRetained;
  if (self->_willPresent)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    __int16 v6 = [WeakRetained presentingViewController];
    if (v6) {
      int v5 = [v4 isBeingDismissed] ^ 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (UIGestureRecognizer)gestureRecognizerForExclusionRelationship
{
  return (UIGestureRecognizer *)[(_UIClickPresentationInteraction *)self->_clickPresentationInteraction gestureRecognizerForExclusionRelationship];
}

- (BOOL)presentIfPossible:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PLClickPresentationInteractionManager *)self hasCommittedToPresentation];
  if (!v5)
  {
    self->_didInteractionInitiateWithHint = 0;
    __int16 v6 = (void *)[v4 copy];
    id presentationCompletion = self->_presentationCompletion;
    self->_id presentationCompletion = v6;

    [(_UIClickPresentationInteraction *)self->_clickPresentationInteraction present];
  }

  return !v5;
}

- (BOOL)dismissIfPossible:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  __int16 v6 = [WeakRetained presentedViewController];

  BOOL v7 = !self->_didPresent || v6 == 0;
  if (v7 || ([v6 isBeingDismissed] & 1) != 0)
  {
    BOOL v8 = 0;
  }
  else
  {
    self->_didPresent = 0;
    __int16 v9 = (void *)[v4 copy];
    id dismissalCompletion = self->_dismissalCompletion;
    self->_id dismissalCompletion = v9;

    [(_UIClickPresentationInteraction *)self->_clickPresentationInteraction cancelInteraction];
    objc_storeWeak((id *)&self->_presentedViewController, 0);
    BOOL v8 = 1;
  }

  return v8;
}

- (void)_clickPresentationTransitionDidPresent:(BOOL)a3
{
  BOOL v3 = a3;
  self->_willPresent = 0;
  *(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags &= ~0x200u;
  [(PLClickPresentationInteractionManager *)self _setPresentingViewControllerHighlighted:0 animated:0];
  if (v3)
  {
    self->_didPresent = 1;
    uint64_t v7 = MEMORY[0x1D948D440](self->_presentationCompletion);
    id presentationCompletion = self->_presentationCompletion;
    self->_id presentationCompletion = 0;

    __int16 v6 = (void *)v7;
    if (v7)
    {
      (*(void (**)(uint64_t))(v7 + 16))(v7);
      __int16 v6 = (void *)v7;
    }
  }
}

- (void)_clickInteractionDidEnd
{
  self->_didPresent = 0;
  *(_WORD *)&self->_didInteractionInitiateWithHint = 0;
  if ((*(unsigned char *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x20) != 0) {
    [(PLClickPresentationInteractionManager *)self _delegateDidEndUserInteraction];
  }
  uint64_t v5 = MEMORY[0x1D948D440](self->_dismissalCompletion, a2);
  id dismissalCompletion = self->_dismissalCompletion;
  self->_id dismissalCompletion = 0;

  id v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    id v4 = (void *)v5;
  }
}

- (void)_clickPresentationTransitionDidDismiss:(BOOL)a3
{
  if (a3) {
    [(PLClickPresentationInteractionManager *)self _clickInteractionDidEnd];
  }
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if ([WeakRetained isBeingDismissed]) {
    goto LABEL_2;
  }
  __int16 v6 = [WeakRetained view];
  uint64_t v7 = [v6 window];
  uint64_t v5 = v7;
  if (!v7) {
    goto LABEL_15;
  }
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 4) == 0)
  {

LABEL_7:
    __int16 v6 = [(PLClickPresentationInteractionManager *)self _presentedViewController];
    if (v6)
    {
      if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x10) != 0) {
        [(PLClickPresentationInteractionManager *)self _delegateWillBeginUserInteraction];
      }
      __int16 v10 = [WeakRetained presentedViewController];
      if (!v10)
      {
        LOBYTE(v5) = 1;
        goto LABEL_15;
      }
      __int16 v11 = v10;
      LOBYTE(v5) = [v10 isBeingDismissed];
    }
    else
    {
      __int16 v11 = [WeakRetained presentedViewController];
      LOBYTE(v5) = 0;
    }

LABEL_15:
    goto LABEL_16;
  }
  clickPresentationInteraction = self->_clickPresentationInteraction;
  __int16 v9 = [WeakRetained viewForPreview];
  [(_UIClickPresentationInteraction *)clickPresentationInteraction locationInView:v9];
  LODWORD(clickPresentationInteraction) = -[PLClickPresentationInteractionManager _delegateShouldBeginInteractionWithTouchAtLocation:](self, "_delegateShouldBeginInteractionWithTouchAtLocation:");

  if (clickPresentationInteraction) {
    goto LABEL_7;
  }
LABEL_2:
  LOBYTE(v5) = 0;
LABEL_16:
  self->_didInteractionInitiateWithHint = 1;

  return (char)v5;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLClickPresentationInteractionManager *)self _presentedViewController];
  if (!v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
    BOOL v8 = PLLogTransition;
    if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v15 = WeakRetained;
      _os_log_impl(&dword_1D93DD000, v8, OS_LOG_TYPE_DEFAULT, "No view controller to present from presenting view controller %{public}@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x208) == 8)
  {
LABEL_7:
    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __83__PLClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke;
    block[3] = &unk_1E6B5FD48;
    objc_copyWeak(&v13, (id *)buf);
    id v11 = v4;
    __int16 v12 = self;
    dispatch_async(MEMORY[0x1E4F14428], block);

    objc_destroyWeak(&v13);
    objc_destroyWeak((id *)buf);
    BOOL v6 = 0;
    goto LABEL_8;
  }
  BOOL v6 = 1;
LABEL_8:

  return v6;
}

void __83__PLClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v3 = [*(id *)(a1 + 32) _reachedForceThreshold];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__PLClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke_2;
  v6[3] = &unk_1E6B5FD20;
  v6[4] = WeakRetained;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [WeakRetained _delegateShouldFinishInteractionThatReachedForceThreshold:v3 withCompletionBlock:v6];
}

uint64_t __83__PLClickPresentationInteractionManager_clickPresentationInteractionShouldPresent___block_invoke_2(id *a1, int a2)
{
  id v4 = [a1[4] presentedViewController];

  if (v4) {
    BOOL v5 = a2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    [a1[5] cancelInteraction];
    [a1[6] _setPresentingViewControllerHighlighted:0 animated:1];
    id v6 = a1[6];
    return [v6 _clickInteractionDidEnd];
  }
  else
  {
    *((_WORD *)a1[4] + 28) |= 0x200u;
    id v8 = a1[5];
    return [v8 present];
  }
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  self->_willPresent = 1;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  if (!WeakRetained)
  {
    id v9 = objc_loadWeakRetained((id *)&self->_presentingViewController);
    __int16 v10 = PLLogTransition;
    if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      id v31 = v9;
      _os_log_impl(&dword_1D93DD000, v10, OS_LOG_TYPE_DEFAULT, "No view controller to present from presenting view controller %{public}@", buf, 0xCu);
    }
  }
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 2) != 0)
  {
    id v11 = [(PLClickPresentationInteractionManager *)self _delegateTransitioningDelegate];
  }
  else
  {
    id v11 = objc_alloc_init(PLExpandedPlatterTransitioningDelegate);
  }
  __int16 v12 = v11;
  id v13 = objc_alloc(MEMORY[0x1E4F430E0]);
  objc_super v14 = [(PLExpandedPlatterTransitioningDelegate *)v12 presentationControllerForPresentedViewController:WeakRetained presentingViewController:v7 sourceViewController:v7];
  id v15 = (void *)[v13 initWithPresentedViewController:WeakRetained presentationController:v14];

  objc_storeWeak((id *)&self->_clickPresentation, v15);
  if (*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags)
  {
    uint64_t v16 = [(PLClickPresentationInteractionManager *)self _delegateContainerView];
    if (v16) {
      [v15 setCustomContainerView:v16];
    }
  }
  objc_initWeak((id *)buf, self);
  v17 = [PLClickPresentationPresentationTransition alloc];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __110__PLClickPresentationInteractionManager_clickPresentationInteraction_presentationForPresentingViewController___block_invoke;
  v28[3] = &unk_1E6B5F990;
  objc_copyWeak(&v29, (id *)buf);
  v18 = [(PLClickPresentationPresentationTransition *)v17 initWithTransitionDelegate:v12 presentingViewController:v7 presentedViewController:WeakRetained completion:v28];
  [(PLClickPresentationTransition *)v18 setPropagatesPresentingViewTransform:[(PLClickPresentationInteractionManager *)self didInteractionInitiateWithHint]];
  [v15 setAppearanceTransition:v18];
  v19 = [PLClickPresentationDismissalTransition alloc];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  v25 = __110__PLClickPresentationInteractionManager_clickPresentationInteraction_presentationForPresentingViewController___block_invoke_2;
  v26 = &unk_1E6B5F990;
  objc_copyWeak(&v27, (id *)buf);
  v20 = [(PLClickPresentationDismissalTransition *)v19 initWithTransitionDelegate:v12 presentingViewController:v7 presentedViewController:WeakRetained completion:&v23];
  -[PLClickPresentationDismissalTransition setPresentationTransition:](v20, "setPresentationTransition:", v18, v23, v24, v25, v26);
  [v15 setDisappearanceTransition:v20];
  [WeakRetained loadViewIfNeeded];
  if (objc_opt_respondsToSelector())
  {
    v21 = [WeakRetained viewForTouchContinuation];
    [v15 setCustomViewForTouchContinuation:v21];
  }
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);

  return v15;
}

void __110__PLClickPresentationInteractionManager_clickPresentationInteraction_presentationForPresentingViewController___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clickPresentationTransitionDidPresent:a2];
}

void __110__PLClickPresentationInteractionManager_clickPresentationInteraction_presentationForPresentingViewController___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _clickPresentationTransitionDidDismiss:a2];
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  id v6 = [WeakRetained viewForPreview];

  [(PLClickPresentationInteractionManager *)self _setPresentingViewControllerHighlighted:1 animated:1];
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F43360]) initWithView:v6];

  return v7;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  [(PLClickPresentationInteractionManager *)self _setPresentingViewControllerHighlighted:0 animated:1];
  [(PLClickPresentationInteractionManager *)self _clickInteractionDidEnd];
}

- (unint64_t)activationStyleForClickPresentationInteraction:(id)a3
{
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x100) != 0) {
    return [(PLClickPresentationInteractionManager *)self _delegateShouldAllowLongPressGesture] ^ 1;
  }
  else {
    return 0;
  }
}

- (id)_presentedViewController
{
  p_presentedViewController = &self->_presentedViewController;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  if (!WeakRetained)
  {
    id WeakRetained = [(PLClickPresentationInteractionManager *)self _delegatePresentedViewController];
    objc_storeWeak((id *)p_presentedViewController, WeakRetained);
  }
  return WeakRetained;
}

- (void)_setPresentingViewControllerHighlighted:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (objc_opt_respondsToSelector())
  {
    if (v4)
    {
      id v7 = (void *)[MEMORY[0x1E4F743C8] newDefaultHighlightAnimator];
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      __int16 v10 = __90__PLClickPresentationInteractionManager__setPresentingViewControllerHighlighted_animated___block_invoke;
      id v11 = &unk_1E6B5F828;
      id v12 = WeakRetained;
      BOOL v13 = v5;
      [v7 addAnimations:&v8];
      objc_msgSend(v7, "startAnimation", v8, v9, v10, v11);
    }
    else
    {
      [WeakRetained setHighlighted:v5];
    }
  }
}

uint64_t __90__PLClickPresentationInteractionManager__setPresentingViewControllerHighlighted_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHighlighted:*(unsigned __int8 *)(a1 + 40)];
}

- (BOOL)_delegateShouldAllowLongPressGesture
{
  if ((*(_WORD *)&self->_clickPresentationInteractionManagerDelegateFlags & 0x100) == 0) {
    return 0;
  }
  uint64_t v3 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v3) = [WeakRetained clickPresentationInteractionManagerShouldAllowLongPressGesture:v3];

  return (char)v3;
}

- (PLClickPresentationInteractionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLClickPresentationInteractionManagerDelegate *)WeakRetained;
}

- (PLClickPresentationInteractionPresentable)presentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentedViewController);
  return (PLClickPresentationInteractionPresentable *)WeakRetained;
}

- (BOOL)didInteractionInitiateWithHint
{
  return self->_didInteractionInitiateWithHint;
}

- (void)_setDidInteractionInitiateWithHint:(BOOL)a3
{
  self->_didInteractionInitiateWithHint = a3;
}

- (BOOL)_willPresent
{
  return self->_willPresent;
}

- (void)_setWillPresent:(BOOL)a3
{
  self->_willPresent = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_dismissalCompletion, 0);
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_destroyWeak((id *)&self->_clickPresentation);
  objc_storeStrong((id *)&self->_clickPresentationInteraction, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

- (id)_delegatePresentedViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = [WeakRetained presentedViewControllerForClickPresentationInteractionManager:self];

  return v4;
}

- (id)_delegateTransitioningDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = [WeakRetained transitioningDelegateForClickPresentationInteractionManager:self];

  return v4;
}

- (id)_delegateContainerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v4 = [WeakRetained containerViewForClickPresentationInteractionManager:self];

  return v4;
}

- (BOOL)_delegateShouldBeginInteractionWithTouchAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v5) = objc_msgSend(WeakRetained, "clickPresentationInteractionManager:shouldBeginInteractionWithTouchAtLocation:", v5, x, y);

  return (char)v5;
}

- (void)_delegateWillBeginUserInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clickPresentationInteractionManagerWillBeginUserInteraction:self];
}

- (void)_delegateDidEndUserInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clickPresentationInteractionManagerDidEndUserInteraction:self];
}

- (void)_delegateShouldFinishInteractionThatReachedForceThreshold:(BOOL)a3 withCompletionBlock:(id)a4
{
  BOOL v4 = a3;
  p_delegate = &self->_delegate;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained clickPresentationInteractionManager:self shouldFinishInteractionThatReachedForceThreshold:v4 withCompletionBlock:v7];
}

- (void)_delegateWillDismissPresentedContentWithTrigger:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clickPresentationInteractionManager:self willDismissPresentedContentWithTrigger:a3];
}

- (void)_delegateDeclinedDismissingPresentedContentWithTrigger:(int64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained clickPresentationInteractionManager:self declinedDismissingPresentedContentWithTrigger:a3];
}

- (BOOL)_dismissIfPossibleWithTrigger:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (void *)PLLogTransition;
  if (os_log_type_enabled((os_log_t)PLLogTransition, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a3 > 4) {
      id v6 = 0;
    }
    else {
      id v6 = off_1E6B5FD68[a3];
    }
    *(_DWORD *)id v11 = 138543362;
    *(void *)&v11[4] = v6;
    id v7 = v5;
    _os_log_impl(&dword_1D93DD000, v7, OS_LOG_TYPE_DEFAULT, "Asked to dismiss presented content with trigger '%{public}@'", v11, 0xCu);
  }
  BOOL v8 = -[PLClickPresentationInteractionManager dismissIfPossible:](self, "dismissIfPossible:", 0, *(_OWORD *)v11);
  __int16 clickPresentationInteractionManagerDelegateFlags = (__int16)self->_clickPresentationInteractionManagerDelegateFlags;
  if (v8)
  {
    if ((clickPresentationInteractionManagerDelegateFlags & 0x40) != 0) {
      [(PLClickPresentationInteractionManager *)self _delegateWillDismissPresentedContentWithTrigger:a3];
    }
  }
  else if ((clickPresentationInteractionManagerDelegateFlags & 0x80) != 0)
  {
    [(PLClickPresentationInteractionManager *)self _delegateDeclinedDismissingPresentedContentWithTrigger:a3];
  }
  return v8;
}

- (PLClickPresentationInteractionManager)initWithPresentingViewController:(id)a3
{
  return [(PLClickPresentationInteractionManager *)self initWithPresentingViewController:a3 delegate:0];
}

- (void)resetForInitialInteraction
{
  self->_didPresent = 0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  if (WeakRetained)
  {
    id v7 = WeakRetained;
    [(_UIClickPresentationInteraction *)self->_clickPresentationInteraction cancelInteraction];
    id WeakRetained = v7;
    if (!self->_clickPresentationInteraction)
    {
      BOOL v4 = (_UIClickPresentationInteraction *)[objc_alloc(MEMORY[0x1E4F430E8]) initWithDelegate:self];
      clickPresentationInteraction = self->_clickPresentationInteraction;
      self->_clickPresentationInteraction = v4;

      id v6 = [v7 viewForPreview];
      [v6 addInteraction:self->_clickPresentationInteraction];

      id WeakRetained = v7;
    }
  }
}

@end