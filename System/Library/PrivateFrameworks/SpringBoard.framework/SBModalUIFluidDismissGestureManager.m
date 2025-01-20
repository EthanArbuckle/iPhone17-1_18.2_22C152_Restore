@interface SBModalUIFluidDismissGestureManager
- (BOOL)homeGestureInteraction:(id)a3 shouldReceiveTouch:(id)a4;
- (BSCompoundAssertion)observers;
- (SBHomeGestureInteraction)homeGestureInteraction;
- (SBHomeGestureSettings)homeGestureSettings;
- (SBModalUIFluidDismissGestureManager)initWithWindowScene:(id)a3 systemGestureManager:(id)a4;
- (SBModalUIFluidDismissGestureWorkspaceTransaction)currentTransaction;
- (SBSystemGestureManager)systemGestureManager;
- (SBWindowScene)windowScene;
- (id)addObserver:(id)a3 forReason:(id)a4;
- (id)customScreenEdgePanGestureRecognizerForHomeGestureInteraction:(id)a3;
- (id)viewForSystemGestureRecognizer:(id)a3;
- (int64_t)_dismissalTypeForCurrentContext;
- (int64_t)touchInterfaceOrientationForGestureRecognizer:(id)a3;
- (unint64_t)homeGestureInteraction:(id)a3 systemGestureTypeForType:(int64_t)a4;
- (void)_addOrRemoveGestureForCurrentSettings;
- (void)_notifyObserversDismissalEnded;
- (void)dealloc;
- (void)handleGestureBegan:(id)a3 initiatedFromBottomEdge:(BOOL)a4;
- (void)handleGestureBegan:(id)a3 initiatedFromBottomEdge:(BOOL)a4 dismissalThreshold:(double)a5 initiatedFromIndirectEdge:(BOOL)a6;
- (void)handleGestureChanged:(id)a3;
- (void)handleGestureEnded:(id)a3;
- (void)homeGestureInteractionBegan:(id)a3;
- (void)homeGestureInteractionChanged:(id)a3;
- (void)homeGestureInteractionEnded:(id)a3;
- (void)setCurrentTransaction:(id)a3;
- (void)setHomeGestureInteraction:(id)a3;
- (void)setHomeGestureSettings:(id)a3;
- (void)setObservers:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)transactionDidComplete:(id)a3;
@end

@implementation SBModalUIFluidDismissGestureManager

- (BOOL)homeGestureInteraction:(id)a3 shouldReceiveTouch:(id)a4
{
  return [(SBModalUIFluidDismissGestureManager *)self _dismissalTypeForCurrentContext] != 0;
}

- (int64_t)_dismissalTypeForCurrentContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  if (+[SBAssistantController isVisible])
  {
    v3 = [WeakRetained assistantController];
    v4 = [v3 assistantRootViewController];

    if ([v4 ownsHomeGesture])
    {
      v5 = [WeakRetained assistantController];
      v6 = [v5 presentationContext];
      uint64_t v7 = [v6 modality];

      if (v7 == 3) {
        int64_t v8 = 2;
      }
      else {
        int64_t v8 = 1;
      }
      goto LABEL_12;
    }
  }
  v4 = [WeakRetained transientOverlayPresenter];
  int64_t v8 = [v4 viewControllerForGestureDismissal];
  if (v8)
  {
    int v9 = [v4 ownsHomeGesture];

    if (v9)
    {
      int64_t v8 = 0;
      switch([v4 preferredGestureDismissalStyle])
      {
        case 1:
          int64_t v8 = 5;
          break;
        case 2:
          int64_t v8 = 4;
          break;
        case 4:
          int64_t v8 = 3;
          break;
        case 5:
          int64_t v8 = 6;
          break;
        default:
          break;
      }
    }
    else
    {
      int64_t v8 = 0;
    }
  }
LABEL_12:

  return v8;
}

- (SBModalUIFluidDismissGestureManager)initWithWindowScene:(id)a3 systemGestureManager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SBModalUIFluidDismissGestureManager;
  int64_t v8 = [(SBModalUIFluidDismissGestureManager *)&v15 init];
  int v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_systemGestureManager, a4);
    objc_storeWeak((id *)&v9->_windowScene, v6);
    uint64_t v10 = +[SBHomeGestureDomain rootSettings];
    homeGestureSettings = v9->_homeGestureSettings;
    v9->_homeGestureSettings = (SBHomeGestureSettings *)v10;

    [(PTSettings *)v9->_homeGestureSettings addKeyObserver:v9];
    uint64_t v12 = [MEMORY[0x1E4F4F6E8] assertionWithIdentifier:@"SBModalUIFluidDismissGestureManager observers"];
    observers = v9->_observers;
    v9->_observers = (BSCompoundAssertion *)v12;

    [(SBModalUIFluidDismissGestureManager *)v9 _addOrRemoveGestureForCurrentSettings];
  }

  return v9;
}

- (void)dealloc
{
  [(BSCompoundAssertion *)self->_observers invalidate];
  observers = self->_observers;
  self->_observers = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBModalUIFluidDismissGestureManager;
  [(SBModalUIFluidDismissGestureManager *)&v4 dealloc];
}

- (void)_addOrRemoveGestureForCurrentSettings
{
  BOOL v3 = [(SBHomeGestureSettings *)self->_homeGestureSettings isHomeGestureEnabled];
  homeGestureInteraction = self->_homeGestureInteraction;
  if (v3)
  {
    if (homeGestureInteraction) {
      return;
    }
    v5 = [[SBHomeGestureInteraction alloc] initWithSystemGestureManager:self->_systemGestureManager delegate:self];
  }
  else
  {
    if (!homeGestureInteraction) {
      return;
    }
    [(SBHomeGestureInteraction *)homeGestureInteraction invalidate];
    v5 = 0;
  }
  id v6 = self->_homeGestureInteraction;
  self->_homeGestureInteraction = v5;
}

- (void)handleGestureBegan:(id)a3 initiatedFromBottomEdge:(BOOL)a4
{
}

- (void)handleGestureBegan:(id)a3 initiatedFromBottomEdge:(BOOL)a4 dismissalThreshold:(double)a5 initiatedFromIndirectEdge:(BOOL)a6
{
  id v10 = a3;
  v11 = [(SBModalUIFluidDismissGestureManager *)self currentTransaction];

  if (!v11)
  {
    uint64_t v12 = +[SBWorkspace mainWorkspace];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    v14 = [WeakRetained _fbsDisplayConfiguration];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_3;
    v15[3] = &unk_1E6B075E0;
    id v16 = v10;
    v17 = self;
    BOOL v19 = a4;
    double v18 = a5;
    BOOL v20 = a6;
    [v12 requestTransitionWithOptions:0 displayConfiguration:v14 builder:&__block_literal_global_254 validator:v15];
  }
}

void __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setSource:11];
  [v2 setEventLabel:@"SBModalUIFluidDismissSystemGesture"];
  [v2 modifyTransientOverlayContext:&__block_literal_global_12_2];
}

void __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = +[SBWorkspace mainWorkspace];
  BOOL v3 = [v4 transientOverlayPresentationManager];
  [v2 setPresentationManager:v3];
}

uint64_t __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) state];
  uint64_t v5 = [*(id *)(a1 + 40) _dismissalTypeForCurrentContext];
  if (v5) {
    BOOL v6 = (unint64_t)(v4 - 1) >= 2;
  }
  else {
    BOOL v6 = 1;
  }
  uint64_t v7 = !v6;
  if (v7 == 1)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_4;
    v11[3] = &unk_1E6B075B8;
    uint64_t v13 = v5;
    __int16 v15 = *(_WORD *)(a1 + 56);
    uint64_t v14 = *(void *)(a1 + 48);
    int8x16_t v10 = *(int8x16_t *)(a1 + 32);
    id v8 = (id)v10.i64[0];
    int8x16_t v12 = vextq_s8(v10, v10, 8uLL);
    [v3 setTransactionProvider:v11];
  }
  return v7;
}

SBModalUIFluidDismissGestureWorkspaceTransaction *__127__SBModalUIFluidDismissGestureManager_handleGestureBegan_initiatedFromBottomEdge_dismissalThreshold_initiatedFromIndirectEdge___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [SBModalUIFluidDismissGestureWorkspaceTransaction alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  BOOL v6 = [(SBModalUIFluidDismissGestureWorkspaceTransaction *)v4 initWithTransitionRequest:v3 windowScene:WeakRetained dismissalType:*(void *)(a1 + 48) initiatedFromBottomEdge:*(unsigned __int8 *)(a1 + 64)];

  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)v6 setDismissalThreshold:*(double *)(a1 + 56)];
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)v6 setAnimateGestureCancelationOrFailure:*(unsigned __int8 *)(a1 + 65)];
  [(SBModalUIFluidDismissGestureWorkspaceTransaction *)v6 addObserver:*(void *)(a1 + 32)];
  [(SBSystemGestureWorkspaceTransaction *)v6 setGestureRecognizer:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCurrentTransaction:v6];
  return v6;
}

- (void)handleGestureChanged:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SBModalUIFluidDismissGestureManager *)self currentTransaction];
  uint64_t v5 = v4;
  if (v4) {
    [v4 systemGestureStateChanged:v6];
  }
}

- (void)handleGestureEnded:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(SBModalUIFluidDismissGestureManager *)self currentTransaction];
  uint64_t v5 = v4;
  if (v4)
  {
    [v4 systemGestureStateChanged:v6];
  }
  else if ([v6 state] != 4)
  {
    [v6 setEnabled:0];
    [v6 setEnabled:1];
  }
}

- (id)addObserver:(id)a3 forReason:(id)a4
{
  return (id)[(BSCompoundAssertion *)self->_observers acquireForReason:a4 withContext:a3];
}

- (unint64_t)homeGestureInteraction:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) > 2) {
    return 0;
  }
  else {
    return qword_1D8FD2418[a4 - 1];
  }
}

- (id)customScreenEdgePanGestureRecognizerForHomeGestureInteraction:(id)a3
{
  uint64_t v4 = +[SBHomeGesturePanGestureRecognizer homeGesturePanGestureRecognizerWithTarget:0 action:0];
  [v4 setInterfaceDelegate:self];
  [v4 setEdges:4];
  return v4;
}

- (void)homeGestureInteractionBegan:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 recognizedGestureType];
  if (v4 == 2)
  {
    [v8 indirectScreenEdgeGestureRecognitionDistance];
    double v6 = -v5;
  }
  else
  {
    double v6 = -200.0;
  }
  uint64_t v7 = [v8 recognizedGestureRecognizer];
  [(SBModalUIFluidDismissGestureManager *)self handleGestureBegan:v7 initiatedFromBottomEdge:1 dismissalThreshold:v4 == 2 initiatedFromIndirectEdge:v6];
}

- (void)homeGestureInteractionChanged:(id)a3
{
  id v4 = [a3 recognizedGestureRecognizer];
  [(SBModalUIFluidDismissGestureManager *)self handleGestureChanged:v4];
}

- (void)homeGestureInteractionEnded:(id)a3
{
  id v4 = [a3 recognizedGestureRecognizer];
  [(SBModalUIFluidDismissGestureManager *)self handleGestureEnded:v4];
}

- (id)viewForSystemGestureRecognizer:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  int64_t v5 = [(SBModalUIFluidDismissGestureManager *)self _dismissalTypeForCurrentContext];
  if ((unint64_t)(v5 - 3) < 4)
  {
    double v6 = [WeakRetained transientOverlayPresenter];
    uint64_t v7 = [v6 viewControllerForGestureDismissal];
LABEL_5:
    id v8 = v7;
    int v9 = [v7 view];

    goto LABEL_6;
  }
  if ((unint64_t)(v5 - 1) <= 1)
  {
    double v6 = [WeakRetained assistantController];
    uint64_t v7 = [v6 assistantRootViewController];
    goto LABEL_5;
  }
  int v9 = 0;
LABEL_6:

  return v9;
}

- (int64_t)touchInterfaceOrientationForGestureRecognizer:(id)a3
{
  id v3 = [(SBModalUIFluidDismissGestureManager *)self viewForSystemGestureRecognizer:a3];
  id v4 = v3;
  if (!v3) {
    goto LABEL_4;
  }
  int64_t v5 = [v3 window];
  double v6 = [v4 window];
  objc_msgSend(v4, "convertPoint:toView:", v6, 1.0, 1.0);
  objc_msgSend(v5, "_convertPointToSceneReferenceSpace:");
  double v8 = v7;
  double v10 = v9;
  v11 = [v4 window];
  int8x16_t v12 = [v4 window];
  objc_msgSend(v4, "convertPoint:toView:", v12, 0.0, 0.0);
  objc_msgSend(v11, "_convertPointToSceneReferenceSpace:");
  double v14 = v8 - v13;
  double v16 = v10 - v15;

  BOOL v17 = v14 <= 0.0;
  if (v14 <= 0.0 || v16 <= 0.0)
  {
    if (v14 > 0.0 || v16 > 0.0)
    {
      if (v16 > 0.0) {
        BOOL v17 = 1;
      }
      if (v17) {
        int64_t v18 = 3;
      }
      else {
        int64_t v18 = 4;
      }
    }
    else
    {
      int64_t v18 = 2;
    }
  }
  else
  {
LABEL_4:
    int64_t v18 = 1;
  }

  return v18;
}

- (void)_notifyObserversDismissalEnded
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(BSCompoundAssertion *)self->_observers orderedContext];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) noteModalUIFluidDismissalDidEnd:self];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)transactionDidComplete:(id)a3
{
  id v4 = a3;
  id v5 = [(SBModalUIFluidDismissGestureManager *)self currentTransaction];

  if (v5 == v4) {
    [(SBModalUIFluidDismissGestureManager *)self setCurrentTransaction:0];
  }
  [(SBModalUIFluidDismissGestureManager *)self _notifyObserversDismissalEnded];
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_homeGestureSettings == a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__SBModalUIFluidDismissGestureManager_settings_changedValueForKey___block_invoke;
    block[3] = &unk_1E6AF4AC0;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __67__SBModalUIFluidDismissGestureManager_settings_changedValueForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addOrRemoveGestureForCurrentSettings];
}

- (SBSystemGestureManager)systemGestureManager
{
  return self->_systemGestureManager;
}

- (SBWindowScene)windowScene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  return (SBWindowScene *)WeakRetained;
}

- (SBHomeGestureSettings)homeGestureSettings
{
  return self->_homeGestureSettings;
}

- (void)setHomeGestureSettings:(id)a3
{
}

- (SBHomeGestureInteraction)homeGestureInteraction
{
  return self->_homeGestureInteraction;
}

- (void)setHomeGestureInteraction:(id)a3
{
}

- (SBModalUIFluidDismissGestureWorkspaceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
}

- (BSCompoundAssertion)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_homeGestureInteraction, 0);
  objc_storeStrong((id *)&self->_homeGestureSettings, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_systemGestureManager, 0);
}

@end