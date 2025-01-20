@interface UIDragInteraction
+ (NSCopying)visualStyleRegistryIdentity;
+ (void)_cancelAllDrags;
- (BOOL)_accessibilityAddItemsToDragSessionAtPoint:(CAPoint3D)a3;
- (BOOL)_accessibilityCanAddItemsToDragSession;
- (BOOL)_additionalTouchesCancelLift;
- (BOOL)_allowsMultipleSessions;
- (BOOL)_allowsPointerDragBeforeLiftDelay;
- (BOOL)_automaticallyAddsFailureRelationships;
- (BOOL)_beginLiftForItems:(id)a3 session:(id)a4 animated:(BOOL)a5;
- (BOOL)_competingLongPressOnLift;
- (BOOL)_delegateRespondsToAddingItems;
- (BOOL)_isActive;
- (BOOL)_isCancellationTimerEnabled;
- (BOOL)_isPointerDriver:(id)a3;
- (BOOL)_itemsForAddingToSession:(id)a3 atPoint:(CAPoint3D)a4 completion:(id)a5;
- (BOOL)_session:(id)a3 item:(id)a4 shouldDelaySetDownAnimationWithCompletion:(id)a5;
- (BOOL)_sessionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3;
- (BOOL)_sessionPrefersFullSizePreviews:(id)a3;
- (BOOL)_supportsAddingItemsAsynchronously;
- (BOOL)_viewRestrictsDragToSourceApp:(id)a3;
- (BOOL)allowsSimultaneousRecognitionDuringLift;
- (BOOL)dragDriver:(id)a3 canExcludeCompetingGestureRecognizer:(id)a4;
- (BOOL)dragDriver:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4;
- (BOOL)dragDriver:(id)a3 shouldBeginAtLocation3D:(CAPoint3D)a4;
- (BOOL)dragDriver:(id)a3 shouldBeginAtLocation:(CGPoint)a4;
- (BOOL)dragDriver:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4;
- (BOOL)dragDriver:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)dragDriverBeginLift:(id)a3;
- (BOOL)dragDriverWantsExclusionOverride:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isEnabled;
- (CGPoint)_locationInView:(id)a3;
- (NSArray)_allowedTouchTypes;
- (NSSet)_initiationDrivers;
- (UIDragInteraction)initWithDelegate:(id)delegate;
- (UIDragInteractionEffect)interactionEffect;
- (UIView)view;
- (_UIDragInteractionPresentationDelegate)_presentationDelegate;
- (double)_cancellationDelay;
- (double)_competingLongPressDelay;
- (double)_liftDelay;
- (double)_liftMoveHysteresis;
- (double)_pointerLiftDelay;
- (double)_pointerLiftMoveHysteresis;
- (double)liftDelay;
- (id)_createDefaultInitiationDrivers;
- (id)_initiationDriver;
- (id)_itemsToDragFromView:(id)a3;
- (id)_queryDelegate:(id)a3 forItemsForBeginningSession:(id)a4;
- (id)_requiredContextIDsForDragSessionInView:(id)a3;
- (id)_session:(id)a3 customSpringAnimationBehaviorForCancellingItem:(id)a4;
- (id)_session:(id)a3 targetedPreviewForCancellingItem:(id)a4 duiPreview:(id)a5 snapshotView:(id)a6 container:(id)a7;
- (id)_viewDragSessionProperties:(id)a3;
- (id)delegate;
- (int64_t)_addItemsGestureConfiguration;
- (int64_t)_dataOwnerOfDragFromView:(id)a3;
- (uint64_t)_addItemsWithPoint:(double)a3;
- (unint64_t)_session:(id)a3 sourceOperationMaskForDraggingWithinApp:(BOOL)a4;
- (void)_accessibilityPrepareForDragAtPoint:(CAPoint3D)a3 completion:(id)a4;
- (void)_beginDragWithTouches:(id)a3 itemUpdater:(id)a4;
- (void)_cancelDrag;
- (void)_cancelLift;
- (void)_endLiftWithoutDragging;
- (void)_finalizeLiftCancellation;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_handoffSession:(id)a3;
- (void)_immediatelyBeginDragWithTouch:(id)a3 completion:(id)a4;
- (void)_prepareForLiftAtPoint:(void *)a3 invocationType:(double)a4 completion:(double)a5;
- (void)_prepareForSession:(id)a3 completion:(id)a4;
- (void)_queryDelegate:(id)a3 forLiftPreviewsUsingItems:(id)a4 session:(id)a5;
- (void)_session:(id)a3 item:(id)a4 willCancelWithAnimator:(id)a5;
- (void)_session:(id)a3 willAddItems:(id)a4 forInteraction:(id)a5;
- (void)_sessionDidEnd:(id)a3 withOperation:(unint64_t)a4;
- (void)_sessionDidMove:(id)a3;
- (void)_sessionDidTransferItems:(id)a3;
- (void)_sessionHandedOffDragImage:(id)a3;
- (void)_sessionWillEnd:(id)a3 withOperation:(unint64_t)a4;
- (void)_setAddItemsGestureConfiguration:(int64_t)a3;
- (void)_setAdditionalTouchesCancelLift:(BOOL)a3;
- (void)_setAllowedTouchTypes:(id)a3;
- (void)_setAllowsMultipleSessions:(BOOL)a3;
- (void)_setAllowsPointerDragBeforeLiftDelay:(BOOL)a3;
- (void)_setAutomaticallyAddsFailureRelationships:(BOOL)a3;
- (void)_setCancellationDelay:(double)a3;
- (void)_setCancellationTimerEnabled:(BOOL)a3;
- (void)_setCompetingLongPressDelay:(double)a3;
- (void)_setCompetingLongPressOnLift:(BOOL)a3;
- (void)_setInitiationDrivers:(id)a3;
- (void)_setLiftDelay:(double)a3;
- (void)_setLiftMoveHysteresis:(double)a3;
- (void)_setPointerLiftDelay:(double)a3;
- (void)_setPointerLiftMoveHysteresis:(double)a3;
- (void)_setPresentationDelegate:(id)a3;
- (void)_updateDriverParameters;
- (void)_updateInteractionEffectWithContext:(id)a3 notifyDelegate:(BOOL)a4;
- (void)_view:(id)a3 willBeginDraggingWithSession:(id)a4;
- (void)_viewFailedToDrag:(id)a3;
- (void)didMoveToView:(id)a3;
- (void)dragDriver:(id)a3 beginDragWithTouches:(id)a4 itemUpdater:(id)a5 beginningSessionHandler:(id)a6;
- (void)dragDriver:(id)a3 prepareToLiftWithCompletion:(id)a4;
- (void)dragDriverCancelAddItemsGesture:(id)a3;
- (void)dragDriverCancelLift:(id)a3;
- (void)setAllowsSimultaneousRecognitionDuringLift:(BOOL)allowsSimultaneousRecognitionDuringLift;
- (void)setDragCancellationDelay:(double)a3;
- (void)setEnabled:(BOOL)enabled;
- (void)setInteractionEffect:(id)a3;
- (void)setLiftDelay:(double)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UIDragInteraction

- (void)_setLiftDelay:(double)a3
{
  self->_liftDelay = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_updateDriverParameters
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_initiationDrivers;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v18 + 1) + 8 * v7);
        [(UIDragInteraction *)self _liftDelay];
        double v10 = v9;
        unsigned int v11 = [(UIDragInteraction *)self _additionalTouchesCancelLift];
        [(UIDragInteraction *)self _liftMoveHysteresis];
        double v13 = v12;
        if ([(UIDragInteraction *)self _isPointerDriver:v8])
        {
          [(UIDragInteraction *)self _pointerLiftDelay];
          double v10 = v14;
          [(UIDragInteraction *)self _pointerLiftMoveHysteresis];
          double v13 = v15;
          double v16 = 0.0;
        }
        else
        {
          double v16 = (double)v11;
        }
        objc_msgSend(v8, "setAutomaticallyAddsFailureRelationships:", -[UIDragInteraction _automaticallyAddsFailureRelationships](self, "_automaticallyAddsFailureRelationships"));
        objc_msgSend(v8, "setAllowsSimultaneousRecognitionDuringLift:", -[UIDragInteraction allowsSimultaneousRecognitionDuringLift](self, "allowsSimultaneousRecognitionDuringLift"));
        [v8 setAdditionalTouchesCancelLift:v16 != 0.0];
        [v8 setLiftDelay:v10];
        [(UIDragInteraction *)self _competingLongPressDelay];
        objc_msgSend(v8, "setCompetingLongPressDelay:");
        objc_msgSend(v8, "setCancellationTimerEnabled:", -[UIDragInteraction _isCancellationTimerEnabled](self, "_isCancellationTimerEnabled"));
        [(UIDragInteraction *)self _cancellationDelay];
        objc_msgSend(v8, "setCancellationDelay:");
        [v8 setLiftMoveHysteresis:v13];
        objc_msgSend(v8, "setEnabled:", -[UIDragInteraction isEnabled](self, "isEnabled"));
        v17 = [(UIDragInteraction *)self view];
        [v8 setView:v17];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (BOOL)isEnabled
{
  if (self->_didSetEnabled)
  {
    LOBYTE(v3) = self->_enabled;
  }
  else
  {
    if ([(id)objc_opt_class() isEnabledByDefault])
    {
      int v3 = 1;
    }
    else if ((*((unsigned char *)&self->_delegateImplements + 2) & 2) != 0)
    {
      uint64_t v4 = [(UIDragInteraction *)self delegate];
      int v3 = [v4 _dragInteractionAllowsDragOverridingMasterSwitch:self];
    }
    else
    {
      int v3 = 0;
    }
    if (self->_enabled != v3)
    {
      self->_enabled = v3;
      [(UIDragInteraction *)self _updateDriverParameters];
    }
  }
  return v3;
}

- (BOOL)allowsSimultaneousRecognitionDuringLift
{
  return self->_allowsSimultaneousRecognitionDuringLift;
}

- (double)_liftMoveHysteresis
{
  return self->_liftMoveHysteresis;
}

- (double)_liftDelay
{
  return self->_liftDelay;
}

- (BOOL)_isPointerDriver:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 behavior];

  return v4;
}

- (BOOL)_isCancellationTimerEnabled
{
  return self->_cancellationTimerEnabled;
}

- (double)_competingLongPressDelay
{
  return self->_competingLongPressDelay;
}

- (double)_cancellationDelay
{
  return self->_cancellationDelay;
}

- (BOOL)_automaticallyAddsFailureRelationships
{
  return self->_automaticallyAddsFailureRelationships;
}

- (BOOL)_additionalTouchesCancelLift
{
  return self->_additionalTouchesCancelLift;
}

- (double)_pointerLiftMoveHysteresis
{
  return self->_pointerLiftMoveHysteresis;
}

- (double)_pointerLiftDelay
{
  return self->_pointerLiftDelay;
}

- (void)willMoveToView:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  if (WeakRetained)
  {
    uint64_t v6 = WeakRetained;
    id v7 = objc_loadWeakRetained((id *)&self->_view);

    if (v7 != v4)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      v8 = self->_initiationDrivers;
      uint64_t v9 = [(NSSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        uint64_t v11 = *(void *)v18;
        do
        {
          uint64_t v12 = 0;
          do
          {
            if (*(void *)v18 != v11) {
              objc_enumerationMutation(v8);
            }
            objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v12++), "setView:", 0, (void)v17);
          }
          while (v10 != v12);
          uint64_t v10 = [(NSSet *)v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v10);
      }

      id v13 = objc_loadWeakRetained((id *)&self->_view);
      [v13 removeGestureRecognizer:self->_gestureRecognizerForAddingItems];

      id v14 = objc_loadWeakRetained((id *)&self->_view);
      double v15 = [v14 _draggingSourceDelegate];

      if (v15 == self)
      {
        id v16 = objc_loadWeakRetained((id *)&self->_view);
        [v16 _setDraggingSourceDelegate:0];
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedTouchTypes, 0);
  objc_storeStrong((id *)&self->_interactionEffect, 0);
  objc_destroyWeak((id *)&self->_presentationDelegate);
  objc_storeStrong((id *)&self->_initiationDrivers, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultDriverProvider, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerForAddingItems, 0);
  objc_storeStrong((id *)&self->_interactionContext, 0);
  objc_storeStrong((id *)&self->_sessionForAddingItems, 0);
  objc_storeStrong((id *)&self->_preliminarySession, 0);
}

- (void)_setAllowsPointerDragBeforeLiftDelay:(BOOL)a3
{
  if (self->_allowsPointerDragBeforeLiftDelay != a3)
  {
    self->_allowsPointerDragBeforeLiftDelay = a3;
    id v4 = [(UIDragInteraction *)self _createDefaultInitiationDrivers];
    [(UIDragInteraction *)self _setInitiationDrivers:v4];
  }
}

- (UIDragInteraction)initWithDelegate:(id)delegate
{
  id v4 = delegate;
  v94.receiver = self;
  v94.super_class = (Class)UIDragInteraction;
  uint64_t v5 = [(UIDragInteraction *)&v94 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    interactionEffect = v5->_interactionEffect;
    v5->_interactionEffect = (UIDragInteractionEffect *)v6;

    v5->_automaticallyAddsFailureRelationships = 1;
    v5->_additionalTouchesCancelLift = 0;
    int v8 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB2570E8, @"DragInteractionDefaultLiftDelay", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v9 = *(double *)&qword_1EB2570F0;
    if (v8) {
      double v9 = 0.325;
    }
    v5->_liftDelay = v9;
    v5->_pointerLiftDelay = _UIDragInteractionDefaultPointerLiftDelay();
    v5->_allowsPointerDragBeforeLiftDelay = 1;
    int v10 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257108, @"DragInteractionDefaultCompetingLongPressDelay", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v11 = *(double *)&qword_1EB257110;
    if (v10) {
      double v11 = 1.0;
    }
    v5->_competingLongPressDelay = v11;
    char v12 = _UIInternalPreferenceUsesDefault(&_MergedGlobals_905, @"DragInteractionCancellationTimerEnabled", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
    if (byte_1EB2570D4) {
      char v13 = 1;
    }
    else {
      char v13 = v12;
    }
    v5->_cancellationTimerEnabled = v13;
    int v14 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB2570F8, @"DragInteractionDefaultCancellationDelay", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v15 = *(double *)&qword_1EB257100;
    if (v14) {
      double v15 = 3.0;
    }
    v5->_cancellationDelay = v15;
    int v16 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257118, @"DragInteractionDefaultLiftMoveHysteresis", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v17 = *(double *)&qword_1EB257120;
    if (v16) {
      double v17 = 10.0;
    }
    v5->_liftMoveHysteresis = v17;
    int v18 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257148, @"DragInteractionDefaultPointerLiftMoveHysteresis", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
    double v19 = *(double *)&qword_1EB257150;
    if (v18) {
      double v19 = 3.0;
    }
    v5->_pointerLiftMoveHysteresis = v19;
    long long v20 = objc_alloc_init(_UIDragAddItemsGesture);
    [(UIGestureRecognizer *)v20 setName:@"com.apple.UIKit.dragAddingItems"];
    [(UIGestureRecognizer *)v20 setDelegate:v5];
    [(UIGestureRecognizer *)v20 setDelaysTouchesBegan:1];
    gestureRecognizerForAddingItems = v5->_gestureRecognizerForAddingItems;
    v5->_gestureRecognizerForAddingItems = v20;

    int v22 = _UIInternalPreferenceUsesDefault((int *)&algn_1EB2570D5[3], @"DragInteractionAddItemsGestureConfiguration", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateInteger);
    unint64_t v23 = qword_1EB2570E0;
    if (v22) {
      unint64_t v23 = 0;
    }
    if (v23 >= 4) {
      unint64_t v24 = 0;
    }
    else {
      unint64_t v24 = v23;
    }
    [(UIDragInteraction *)v5 _setAddItemsGestureConfiguration:v24];
    objc_storeWeak((id *)&v5->_delegate, v4);
    id v25 = v4;
    _UIValidateAccountBasedDelegateRespondsToSelector(v25, (uint64_t)sel__dragInteraction_dataOwnerForSession_);
    if (objc_opt_respondsToSelector()) {
      _UIValidateAccountBasedDelegateRespondsToSelector(v25, (uint64_t)sel__dragInteraction_dataOwnerForAddingToSession_withTouchAtPoint_);
    }

    v26 = [(UIDragInteraction *)v5 _createDefaultInitiationDrivers];
    [(UIDragInteraction *)v5 _setInitiationDrivers:v26];

    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFFELL | objc_opt_respondsToSelector() & 1);
    char v27 = objc_opt_respondsToSelector();
    uint64_t v28 = 2;
    if ((v27 & 1) == 0) {
      uint64_t v28 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFFDLL | v28);
    char v29 = objc_opt_respondsToSelector();
    uint64_t v30 = 4;
    if ((v29 & 1) == 0) {
      uint64_t v30 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFFBLL | v30);
    char v31 = objc_opt_respondsToSelector();
    uint64_t v32 = 8;
    if ((v31 & 1) == 0) {
      uint64_t v32 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFF7 | v32);
    char v33 = objc_opt_respondsToSelector();
    uint64_t v34 = 16;
    if ((v33 & 1) == 0) {
      uint64_t v34 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFEFLL | v34);
    char v35 = objc_opt_respondsToSelector();
    uint64_t v36 = 32;
    if ((v35 & 1) == 0) {
      uint64_t v36 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFDFLL | v36);
    char v37 = objc_opt_respondsToSelector();
    uint64_t v38 = 64;
    if ((v37 & 1) == 0) {
      uint64_t v38 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFFBFLL | v38);
    char v39 = objc_opt_respondsToSelector();
    uint64_t v40 = 128;
    if ((v39 & 1) == 0) {
      uint64_t v40 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFF7FLL | v40);
    char v41 = objc_opt_respondsToSelector();
    uint64_t v42 = 256;
    if ((v41 & 1) == 0) {
      uint64_t v42 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFEFFLL | v42);
    char v43 = objc_opt_respondsToSelector();
    uint64_t v44 = 512;
    if ((v43 & 1) == 0) {
      uint64_t v44 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFDFFLL | v44);
    char v45 = objc_opt_respondsToSelector();
    uint64_t v46 = 1024;
    if ((v45 & 1) == 0) {
      uint64_t v46 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFFBFFLL | v46);
    char v47 = objc_opt_respondsToSelector();
    uint64_t v48 = 2048;
    if ((v47 & 1) == 0) {
      uint64_t v48 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFF7FFLL | v48);
    char v49 = objc_opt_respondsToSelector();
    uint64_t v50 = 4096;
    if ((v49 & 1) == 0) {
      uint64_t v50 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFEFFFLL | v50);
    char v51 = objc_opt_respondsToSelector();
    uint64_t v52 = 0x2000;
    if ((v51 & 1) == 0) {
      uint64_t v52 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFDFFFLL | v52);
    char v53 = objc_opt_respondsToSelector();
    uint64_t v54 = 0x4000;
    if ((v53 & 1) == 0) {
      uint64_t v54 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFFBFFFLL | v54);
    char v55 = objc_opt_respondsToSelector();
    uint64_t v56 = 0x8000;
    if ((v55 & 1) == 0) {
      uint64_t v56 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFF7FFFLL | v56);
    char v57 = objc_opt_respondsToSelector();
    uint64_t v58 = 0x10000;
    if ((v57 & 1) == 0) {
      uint64_t v58 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFEFFFFLL | v58);
    char v59 = objc_opt_respondsToSelector();
    uint64_t v60 = 0x20000;
    if ((v59 & 1) == 0) {
      uint64_t v60 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFDFFFFLL | v60);
    char v61 = objc_opt_respondsToSelector();
    uint64_t v62 = 0x40000;
    if ((v61 & 1) == 0) {
      uint64_t v62 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFFBFFFFLL | v62);
    char v63 = objc_opt_respondsToSelector();
    uint64_t v64 = 0x80000;
    if ((v63 & 1) == 0) {
      uint64_t v64 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFF7FFFFLL | v64);
    char v65 = objc_opt_respondsToSelector();
    uint64_t v66 = 0x100000;
    if ((v65 & 1) == 0) {
      uint64_t v66 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFEFFFFFLL | v66);
    char v67 = objc_opt_respondsToSelector();
    uint64_t v68 = 0x200000;
    if ((v67 & 1) == 0) {
      uint64_t v68 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFDFFFFFLL | v68);
    char v69 = objc_opt_respondsToSelector();
    uint64_t v70 = 0x400000;
    if ((v69 & 1) == 0) {
      uint64_t v70 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFFBFFFFFLL | v70);
    char v71 = objc_opt_respondsToSelector();
    uint64_t v72 = 0x800000;
    if ((v71 & 1) == 0) {
      uint64_t v72 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFF7FFFFFLL | v72);
    char v73 = objc_opt_respondsToSelector();
    uint64_t v74 = 0x1000000;
    if ((v73 & 1) == 0) {
      uint64_t v74 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFEFFFFFFLL | v74);
    char v75 = objc_opt_respondsToSelector();
    uint64_t v76 = 0x2000000;
    if ((v75 & 1) == 0) {
      uint64_t v76 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFDFFFFFFLL | v76);
    char v77 = objc_opt_respondsToSelector();
    uint64_t v78 = 0x4000000;
    if ((v77 & 1) == 0) {
      uint64_t v78 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFFBFFFFFFLL | v78);
    char v79 = objc_opt_respondsToSelector();
    uint64_t v80 = 0x8000000;
    if ((v79 & 1) == 0) {
      uint64_t v80 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFF7FFFFFFLL | v80);
    char v81 = objc_opt_respondsToSelector();
    uint64_t v82 = 0x10000000;
    if ((v81 & 1) == 0) {
      uint64_t v82 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFEFFFFFFFLL | v82);
    char v83 = objc_opt_respondsToSelector();
    uint64_t v84 = 0x20000000;
    if ((v83 & 1) == 0) {
      uint64_t v84 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFDFFFFFFFLL | v84);
    char v85 = objc_opt_respondsToSelector();
    uint64_t v86 = 0x40000000;
    if ((v85 & 1) == 0) {
      uint64_t v86 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFFBFFFFFFFLL | v86);
    char v87 = objc_opt_respondsToSelector();
    uint64_t v88 = 0x200000000;
    if ((v87 & 1) == 0) {
      uint64_t v88 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFDFFFFFFFFLL | v88);
    char v89 = objc_opt_respondsToSelector();
    uint64_t v90 = 0x400000000;
    if ((v89 & 1) == 0) {
      uint64_t v90 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFFBFFFFFFFFLL | v90);
    char v91 = objc_opt_respondsToSelector();
    uint64_t v92 = 0x800000000;
    if ((v91 & 1) == 0) {
      uint64_t v92 = 0;
    }
    v5->_delegateImplements = ($5085CE7CFA788EAAD109EB8248308696)(*(void *)&v5->_delegateImplements & 0xFFFFFFF7FFFFFFFFLL | v92);
  }

  return v5;
}

- (BOOL)_allowsPointerDragBeforeLiftDelay
{
  return self->_allowsPointerDragBeforeLiftDelay;
}

- (void)_setInitiationDrivers:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v5 = self->_initiationDrivers;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        [v10 setView:0];
        [v10 setDelegate:0];
      }
      uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  if (!v4 || ![v4 count])
  {
    uint64_t v11 = [(UIDragInteraction *)self _createDefaultInitiationDrivers];

    id v4 = (id)v11;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  char v12 = (NSSet *)v4;
  uint64_t v13 = [(NSSet *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v19 != v15) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * j), "setDelegate:", self, (void)v18);
      }
      uint64_t v14 = [(NSSet *)v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v14);
  }

  initiationDrivers = self->_initiationDrivers;
  self->_initiationDrivers = v12;

  [(UIDragInteraction *)self _updateDriverParameters];
}

- (id)_createDefaultInitiationDrivers
{
  if (_createDefaultInitiationDrivers_onceToken != -1) {
    dispatch_once(&_createDefaultInitiationDrivers_onceToken, &__block_literal_global_163);
  }
  defaultDriverProvider = self->_defaultDriverProvider;
  if (!defaultDriverProvider)
  {
    id v4 = +[UIDevice currentDevice];
    uint64_t v5 = +[_UIVisualStyleRegistry registryForIdiom:](_UIVisualStyleRegistry, "registryForIdiom:", [v4 userInterfaceIdiom]);
    [v5 visualStyleClassForStylableClass:objc_opt_class()];

    uint64_t v6 = (_UIDragInteractionDefaultDriverProvider *)objc_opt_new();
    uint64_t v7 = self->_defaultDriverProvider;
    self->_defaultDriverProvider = v6;

    defaultDriverProvider = self->_defaultDriverProvider;
  }
  return (id)[(_UIDragInteractionDefaultDriverProvider *)defaultDriverProvider createDefaultDriversForDragInteraction:self];
}

- (void)_setAddItemsGestureConfiguration:(int64_t)a3
{
  self->_addItemsGestureConfiguration = a3;
  if ((unint64_t)a3 <= 3)
  {
    uint64_t v4 = qword_186B94D00[a3];
    [(UITapGestureRecognizer *)self->_gestureRecognizerForAddingItems setNumberOfTapsRequired:qword_186B94CE0[a3]];
    gestureRecognizerForAddingItems = self->_gestureRecognizerForAddingItems;
    [(UITapGestureRecognizer *)gestureRecognizerForAddingItems setNumberOfTouchesRequired:v4];
  }
}

- (void)setEnabled:(BOOL)enabled
{
  self->_didSetEnabled = 1;
  self->_enabled = enabled;
  [(UIDragInteraction *)self _updateDriverParameters];
}

void __52__UIDragInteraction__createDefaultInitiationDrivers__block_invoke()
{
  v0 = +[_UIVisualStyleRegistry defaultRegistry];
  uint64_t v1 = objc_opt_class();
  [v0 registerVisualStyleClass:v1 forStylableClass:objc_opt_class()];

  v2 = +[_UIVisualStyleRegistry registryForIdiom:1];
  uint64_t v3 = objc_opt_class();
  [v2 registerVisualStyleClass:v3 forStylableClass:objc_opt_class()];

  uint64_t v4 = +[_UIVisualStyleRegistry registryForIdiom:0];
  uint64_t v5 = objc_opt_class();
  [v4 registerVisualStyleClass:v5 forStylableClass:objc_opt_class()];

  id v7 = +[_UIVisualStyleRegistry registryForIdiom:5];
  uint64_t v6 = objc_opt_class();
  [v7 registerVisualStyleClass:v6 forStylableClass:objc_opt_class()];
}

+ (NSCopying)visualStyleRegistryIdentity
{
  return (NSCopying *)@"UIDragInteraction";
}

- (BOOL)dragDriver:(id)a3 shouldReceiveTouch:(id)a4
{
  if ((*((unsigned char *)&self->_delegateImplements + 4) & 8) != 0)
  {
    p_delegate = &self->_delegate;
    id v7 = a4;
    id v8 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    int v10 = [v8 view];

    [v7 locationInView:v10];
    double v12 = v11;
    double v14 = v13;

    objc_msgSend(WeakRetained, "_dragInteraction:delayForLiftBeginningAtLocation:", self, v12, v14);
    -[UIDragInteraction _setLiftDelay:](self, "_setLiftDelay:");
  }
  return 1;
}

- (BOOL)dragDriverWantsExclusionOverride:(id)a3
{
  return (*((unsigned __int8 *)&self->_delegateImplements + 2) >> 6) & 1;
}

- (BOOL)dragDriver:(id)a3 canExcludeCompetingGestureRecognizer:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UIDragInteraction *)self delegate];
  LOBYTE(self) = [v6 _dragInteraction:self canExcludeCompetingGestureRecognizer:v5];

  return (char)self;
}

- (BOOL)dragDriver:(id)a3 shouldDelayCompetingGestureRecognizer:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UIDragInteraction *)self delegate];
  id v7 = v6;
  if ((*((unsigned char *)&self->_delegateImplements + 2) & 0x20) != 0) {
    char v8 = [v6 _dragInteraction:self shouldDelayCompetingGestureRecognizer:v5];
  }
  else {
    char v8 = 1;
  }

  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = (_UIDragAddItemsGesture *)a3;
  id v8 = a4;
  if (![(UIDragInteraction *)self isEnabled])
  {
    BOOL v9 = 0;
    goto LABEL_6;
  }
  if (self->_gestureRecognizerForAddingItems == v7 && !self->_sessionForAddingItems)
  {
    double v11 = [(UIDragInteraction *)self delegate];
    if (![(UIDragInteraction *)self _delegateRespondsToAddingItems]
      && ![(UIDragInteraction *)self _supportsAddingItemsAsynchronously])
    {
      BOOL v9 = 0;
LABEL_31:

      goto LABEL_6;
    }
    double v12 = _sessionsAvailableForAddingItems();
    if ([v12 count])
    {
      double v13 = [(UIDragInteraction *)self view];
      [v8 locationInView:v13];
      double v15 = v14;
      double v17 = v16;

      if ([v12 count] == 1)
      {
        long long v18 = [v12 anyObject];
      }
      else if ((*((unsigned char *)&self->_delegateImplements + 1) & 0x10) != 0)
      {
        long long v19 = [v12 allObjects];
        objc_msgSend(v11, "dragInteraction:sessionForAddingItems:withTouchAtPoint:", self, v19, v15, v17);
        long long v18 = (_UIDragSessionImpl *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          int v20 = dyld_program_sdk_at_least();
          char v21 = [v12 containsObject:v18];
          if (v20)
          {
            if ((v21 & 1) == 0)
            {
              long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
              long long v23 = NSStringFromSelector(sel_dragInteraction_sessionForAddingItems_withTouchAtPoint_);
              [v22 handleFailureInMethod:a2, self, @"UIDragInteraction.m", 1136, @"delegate (%@) returned a object (%@) from %@ that is not a local drag session.", v11, v18, v23 object file lineNumber description];
            }
          }
          else if ((v21 & 1) == 0)
          {
            uint64_t v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &gestureRecognizer_shouldReceiveTouch____s_category)+ 8);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              char v29 = v28;
              uint64_t v30 = NSStringFromSelector(sel_dragInteraction_sessionForAddingItems_withTouchAtPoint_);
              *(_DWORD *)buf = 138412802;
              uint64_t v32 = v11;
              __int16 v33 = 2112;
              uint64_t v34 = v18;
              __int16 v35 = 2112;
              uint64_t v36 = v30;
              _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_ERROR, "delegate (%@) returned a object (%@) from %@ that is not a local drag session.", buf, 0x20u);
            }
          }
        }
      }
      else
      {
        long long v18 = 0;
      }
      if (_UIShouldEnforceOpenInRulesInAccountBasedApp())
      {
        long long v24 = [(_UIDragSessionImpl *)v18 _internalDragSession];
        uint64_t v25 = [v24 dataOwner];

        uint64_t v26 = (*((unsigned char *)&self->_delegateImplements + 3) & 2) != 0
            ? objc_msgSend(v11, "_dragInteraction:dataOwnerForAddingToSession:withTouchAtPoint:", self, v18, v15, v17)
            : 0;
        if (v25 != v26)
        {
          BOOL v9 = 0;
          goto LABEL_29;
        }
      }
      if (v18)
      {
        sessionForAddingItems = self->_sessionForAddingItems;
        self->_sessionForAddingItems = v18;
        BOOL v9 = 1;
        long long v18 = sessionForAddingItems;
LABEL_29:

        goto LABEL_30;
      }
    }
    BOOL v9 = 0;
LABEL_30:

    goto LABEL_31;
  }
  BOOL v9 = 1;
LABEL_6:

  return v9;
}

- (void)didMoveToView:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_storeWeak((id *)&self->_view, v4);
  if (v4)
  {
    [v4 addGestureRecognizer:self->_gestureRecognizerForAddingItems];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = self->_initiationDrivers;
    uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9++), "setView:", v4, (void)v12);
        }
        while (v7 != v9);
        uint64_t v7 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    int v10 = [(UIDragInteraction *)self delegate];
    double v11 = v10;
    if ((*((unsigned char *)&self->_delegateImplements + 4) & 4) == 0
      || [v10 _dragInteractionShouldBecomeDraggingSourceDelegate:self])
    {
      objc_msgSend(v4, "_setDraggingSourceDelegate:", self, (void)v12);
    }
  }
}

- (BOOL)dragDriver:(id)a3 competingGestureRecognizerShouldDelayLift:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [(UIDragInteraction *)self delegate];
  uint64_t v7 = v6;
  if ((*((unsigned char *)&self->_delegateImplements + 2) & 0x80) != 0) {
    char v8 = [v6 _dragInteraction:self competingGestureRecognizerShouldDelayLift:v5];
  }
  else {
    char v8 = 0;
  }

  return v8;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (BOOL)_delegateRespondsToAddingItems
{
  return (*(_DWORD *)&self->_delegateImplements & 0xA0000800) != 0;
}

- (void)_setPointerLiftDelay:(double)a3
{
  self->_pointerLiftDelay = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_setPresentationDelegate:(id)a3
{
  p_presentationDelegate = &self->_presentationDelegate;
  id v5 = a3;
  objc_storeWeak((id *)p_presentationDelegate, v5);
  *(unsigned char *)&self->_presentationDelegateImplements = *(unsigned char *)&self->_presentationDelegateImplements & 0xFE | objc_opt_respondsToSelector() & 1;
  if (objc_opt_respondsToSelector()) {
    char v6 = 2;
  }
  else {
    char v6 = 0;
  }
  *(unsigned char *)&self->_presentationDelegateImplements = *(unsigned char *)&self->_presentationDelegateImplements & 0xFD | v6;
  char v7 = objc_opt_respondsToSelector();

  if (v7) {
    char v8 = 4;
  }
  else {
    char v8 = 0;
  }
  *(unsigned char *)&self->_presentationDelegateImplements = *(unsigned char *)&self->_presentationDelegateImplements & 0xFB | v8;
}

- (id)_initiationDriver
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = self->_initiationDrivers;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    char v6 = 0;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (!-[UIDragInteraction _isPointerDriver:](self, "_isPointerDriver:", v9, (void)v12))
        {
          id v10 = v9;

          char v6 = v10;
        }
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

+ (void)_cancelAllDrags
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = +[_UIDragSessionImpl activeSessions];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) _cancelDrag];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_cancelDrag
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v3 = +[_UIDragSessionImpl activeSessions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        long long v9 = [v8 trackedInteractions];
        int v10 = [v9 containsObject:self];

        if (v10) {
          [v8 _cancelDrag];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (BOOL)_isActive
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v3 = +[_UIDragSessionImpl activeSessions];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        long long v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        long long v9 = [v8 trackedInteractions];
        if ([v9 containsObject:self])
        {
          char v10 = [v8 _isActive];

          if (v10)
          {
            BOOL v11 = 1;
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }
  BOOL v11 = 0;
LABEL_13:

  return v11;
}

- (void)setDragCancellationDelay:(double)a3
{
  if (setDragCancellationDelay__once != -1) {
    dispatch_once(&setDragCancellationDelay__once, &__block_literal_global_284_0);
  }
  [(UIDragInteraction *)self _setCancellationDelay:a3];
}

void __46__UIDragInteraction_setDragCancellationDelay___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Please use -[UIDragInteraction_Private _setCancellationDelay:] instead.", v1, 2u);
  }
}

- (void)setLiftDelay:(double)a3
{
  if (setLiftDelay__once != -1) {
    dispatch_once(&setLiftDelay__once, &__block_literal_global_287);
  }
  [(UIDragInteraction *)self _setLiftDelay:a3];
}

void __34__UIDragInteraction_setLiftDelay___block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke_2___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Please use -[UIDragInteraction_Private _setLiftDelay:] instead.", v1, 2u);
  }
}

- (double)liftDelay
{
  if (liftDelay_once != -1) {
    dispatch_once(&liftDelay_once, &__block_literal_global_289);
  }
  [(UIDragInteraction *)self _liftDelay];
  return result;
}

void __30__UIDragInteraction_liftDelay__block_invoke()
{
  v0 = *(NSObject **)(__UILogGetCategoryCachedImpl("Warning", &_UIInternalPreference_DragInteractionDefaultPointerLiftMoveHysteresis_block_invoke_3___s_category)+ 8);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)uint64_t v1 = 0;
    _os_log_impl(&dword_1853B0000, v0, OS_LOG_TYPE_ERROR, "Please use -[UIDragInteraction_Private _liftDelay] instead.", v1, 2u);
  }
}

- (void)_setAutomaticallyAddsFailureRelationships:(BOOL)a3
{
  self->_automaticallyAddsFailureRelationships = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_setAllowedTouchTypes:(id)a3
{
  objc_storeStrong((id *)&self->_allowedTouchTypes, a3);
  id v5 = a3;
  [(UIGestureRecognizer *)self->_gestureRecognizerForAddingItems setAllowedTouchTypes:v5];

  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_setLiftMoveHysteresis:(double)a3
{
  self->_liftMoveHysteresis = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_setPointerLiftMoveHysteresis:(double)a3
{
  self->_pointerLiftMoveHysteresis = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)setAllowsSimultaneousRecognitionDuringLift:(BOOL)allowsSimultaneousRecognitionDuringLift
{
  self->_allowsSimultaneousRecognitionDuringLift = allowsSimultaneousRecognitionDuringLift;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_setCancellationTimerEnabled:(BOOL)a3
{
  self->_cancellationTimerEnabled = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_setCancellationDelay:(double)a3
{
  self->_cancellationDelay = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_setCompetingLongPressDelay:(double)a3
{
  self->_competingLongPressDelay = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_setCompetingLongPressOnLift:(BOOL)a3
{
  self->_competingLongPressOnLift = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (void)_setAdditionalTouchesCancelLift:(BOOL)a3
{
  self->_additionalTouchesCancelLift = a3;
  [(UIDragInteraction *)self _updateDriverParameters];
}

- (CGPoint)_locationInView:(id)a3
{
  id v6 = a3;
  int64_t v7 = [(UIDragInteractionContextImpl *)self->_interactionContext invocationType];
  if (v7 == 1)
  {
    [(UIDragInteractionContextImpl *)self->_interactionContext initialLocation];
    double v12 = v11;
    double v14 = v13;
    long long v8 = [(UIDragInteraction *)self view];
    long long v15 = [v8 window];
    objc_msgSend(v15, "convertPoint:toView:", v6, v12, v14);
    double v3 = v16;
    double v4 = v17;

    goto LABEL_5;
  }
  if (!v7)
  {
    long long v8 = [(UIDragInteractionContextImpl *)self->_interactionContext initiationTouch];
    [v8 locationInView:v6];
    double v3 = v9;
    double v4 = v10;
LABEL_5:
  }
  double v18 = v3;
  double v19 = v4;
  result.y = v19;
  result.x = v18;
  return result;
}

- (void)_immediatelyBeginDragWithTouch:(id)a3 completion:(id)a4
{
  id v7 = a3;
  long long v8 = (void (**)(id, void))a4;
  if (!v7)
  {
    double v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"UIDragInteraction.m", 681, @"Invalid parameter not satisfying: %@", @"touch" object file lineNumber description];
  }
  if (self->_interactionContext)
  {
    if (v8) {
      v8[2](v8, 0);
    }
  }
  else
  {
    double v9 = [(UIDragInteraction *)self view];
    [v7 locationInView:v9];
    double v11 = v10;
    double v13 = v12;

    double v14 = [(UIDragInteraction *)self view];
    objc_msgSend(v14, "convertPoint:toView:", 0, v11, v13);
    double v16 = v15;
    double v18 = v17;

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __63__UIDragInteraction__immediatelyBeginDragWithTouch_completion___block_invoke;
    v20[3] = &unk_1E52EBD00;
    v20[4] = self;
    id v21 = v7;
    long long v22 = v8;
    -[UIDragInteraction _prepareForLiftAtPoint:invocationType:completion:]((id *)&self->super.isa, 0, v20, v16, v18, 0.0);
  }
}

void __63__UIDragInteraction__immediatelyBeginDragWithTouch_completion___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  if (!v10) {
    goto LABEL_4;
  }
  [*(id *)(*(void *)(a1 + 32) + 32) setInitiationTouch:*(void *)(a1 + 40)];
  double v3 = *(void **)(a1 + 32);
  double v4 = [v3 delegate];
  id v5 = [v3 _queryDelegate:v4 forItemsForBeginningSession:v10];

  LODWORD(v4) = [*(id *)(a1 + 32) _beginLiftForItems:v5 session:v10 animated:0];
  if (v4)
  {
    id v6 = *(void **)(a1 + 32);
    id v7 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    [v6 _beginDragWithTouches:v7 itemUpdater:0];

    uint64_t v8 = 1;
  }
  else
  {
LABEL_4:
    [*(id *)(a1 + 32) _finalizeLiftCancellation];
    uint64_t v8 = 0;
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v9, v8);
  }
}

- (void)_prepareForLiftAtPoint:(void *)a3 invocationType:(double)a4 completion:(double)a5
{
  id v11 = a3;
  if (a1)
  {
    double v12 = [a1 delegate];
    double v13 = [[_UIDragSessionImpl alloc] initWithInteraction:a1];
    uint64_t v14 = objc_opt_new();
    id v15 = a1[4];
    a1[4] = (id)v14;

    [a1[4] setInvocationType:a2];
    objc_msgSend(a1[4], "setInitialLocation:", a4, a5, a6);
    objc_initWeak(&location, a1[4]);
    objc_initWeak(&from, a1);
    id v16 = a1[4];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __70__UIDragInteraction__prepareForLiftAtPoint_invocationType_completion___block_invoke;
    v21[3] = &unk_1E52DC2E0;
    objc_copyWeak(&v22, &from);
    objc_copyWeak(&v23, &location);
    [v16 addCompletion:v21];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __70__UIDragInteraction__prepareForLiftAtPoint_invocationType_completion___block_invoke_2;
    v18[3] = &unk_1E52EBD50;
    v18[4] = a1;
    id v20 = v11;
    double v17 = v13;
    double v19 = v17;
    [a1 _prepareForSession:v17 completion:v18];

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
}

- (void)_beginDragWithTouches:(id)a3 itemUpdater:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  if (![(UIDragInteractionContextImpl *)self->_interactionContext hasBegunDrag])
  {
    [(UIDragInteractionContextImpl *)self->_interactionContext setHasBegunDrag:1];
    id v20 = [(UIDragInteraction *)self delegate];
    uint64_t v8 = [(UIDragInteraction *)self view];
    uint64_t v9 = [v8 window];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = [(UIDragInteractionContextImpl *)self->_interactionContext items];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v22 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          if (v7) {
            v7[2](v7, *(void *)(*((void *)&v21 + 1) + 8 * i));
          }
          id v16 = [v15 _targetedLiftPreview];
          [(UIDragInteractionContextImpl *)self->_interactionContext initialLocation];
          objc_msgSend(v16, "takeLiftAnchorPoint:fromView:", v9);

          if (*((unsigned char *)&self->_delegateImplements + 2))
          {
            double v17 = [v20 _dragInteraction:self viewToSnapshotItem:v15];
            if (v17)
            {
              double v18 = [v15 _targetedLiftPreview];
              [v18 _setViewToSnapshot:v17];
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v12);
    }

    double v19 = [(UIDragInteraction *)self view];
    [v19 _beginDragWithInteractionTouches:v6];
  }
}

- (void)_handoffSession:(id)a3
{
  [(_UIDragSessionImpl *)self->_preliminarySession _setInternalDragSession:a3];
  preliminarySession = self->_preliminarySession;
  self->_preliminarySession = 0;
}

- (id)_queryDelegate:(id)a3 forItemsForBeginningSession:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (*(unsigned char *)&self->_delegateImplements)
  {
    uint64_t v9 = [v6 dragInteraction:self itemsForBeginningSession:v7];
    uint64_t v8 = (void *)[v9 copy];

    if (!v8)
    {
      id v10 = [(UIDragInteraction *)self view];
      uint64_t v11 = [v10 _effectiveActivityItemsConfigurationForSender:self];

      if (v11)
      {
        uint64_t v12 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v13 = [v11 itemProvidersForActivityItemsConfiguration];
        uint64_t v8 = objc_msgSend(v12, "arrayWithCapacity:", objc_msgSend(v13, "count"));

        long long v32 = 0u;
        long long v33 = 0u;
        long long v30 = 0u;
        long long v31 = 0u;
        uint64_t v14 = [v11 itemProvidersForActivityItemsConfiguration];
        uint64_t v15 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v31;
          do
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v31 != v17) {
                objc_enumerationMutation(v14);
              }
              double v19 = [[UIDragItem alloc] initWithItemProvider:*(void *)(*((void *)&v30 + 1) + 8 * i)];
              [v8 addObject:v19];
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v30 objects:v35 count:16];
          }
          while (v16);
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  else
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v20 = v8;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v22; ++j)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(v20);
        }
        objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * j), "_setDragDropSession:", v7, (void)v26);
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v22);
  }

  return v20;
}

- (BOOL)_itemsForAddingToSession:(id)a3 atPoint:(CAPoint3D)a4 completion:(id)a5
{
  double y = a4.y;
  double x = a4.x;
  id v9 = a5;
  id v10 = a3;
  id v11 = [(UIDragInteraction *)self delegate];
  id v12 = v10;
  id v13 = v9;
  uint64_t v14 = (void (**)(void, void))v13;
  if (self)
  {
    $5085CE7CFA788EAAD109EB8248308696 delegateImplements = self->_delegateImplements;
    if ((*(_WORD *)&delegateImplements & 0x800) != 0)
    {
      uint64_t v16 = objc_msgSend(v11, "dragInteraction:itemsForAddingToSession:withTouchAtPoint:", self, v12, x, y);
      ((void (**)(void, void *))v14)[2](v14, v16);
      LOBYTE(self) = [v16 count] != 0;
    }
    else if ((*(_DWORD *)&delegateImplements & 0x20000000) != 0)
    {
      objc_msgSend(v11, "_dragInteraction:itemsForAddingToSession:withTouchAtPoint:completion:", self, v12, v13, x, y);
      LOBYTE(self) = 1;
    }
    else
    {
      (*((void (**)(id, void))v13 + 2))(v13, MEMORY[0x1E4F1CBF0]);
      LOBYTE(self) = 0;
    }
  }

  return (char)self;
}

- (void)_queryDelegate:(id)a3 forLiftPreviewsUsingItems:(id)a4 session:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v20;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(v9);
        }
        uint64_t v15 = *(void **)(*((void *)&v19 + 1) + 8 * v14);
        if ((*(unsigned char *)&self->_delegateImplements & 2) != 0)
        {
          double v18 = [v8 dragInteraction:self previewForLiftingItem:*(void *)(*((void *)&v19 + 1) + 8 * v14) session:v10];
        }
        else
        {
          uint64_t v16 = [UITargetedDragPreview alloc];
          uint64_t v17 = [(UIDragInteraction *)self view];
          double v18 = [(UITargetedDragPreview *)v16 initWithView:v17];
        }
        [v15 setTargetedLiftPreview:v18];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v12);
  }
}

- (uint64_t)_addItemsWithPoint:(double)a3
{
  if (!a1) {
    return 0;
  }
  id v5 = *(void **)(a1 + 24);
  if (!v5) {
    return 0;
  }
  id v6 = *(void **)(a1 + 16);
  if (v6)
  {
    id v7 = [v6 items];
    uint64_t v8 = [v7 count];
    uint64_t v9 = v8 != 0;
    if (v8) {
      [*(id *)(a1 + 24) addItems:v7 forDragSourceInteraction:a1];
    }
    id v10 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = 0;

    uint64_t v11 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;
  }
  else
  {
    id v15 = v5;
    uint64_t v16 = *(void *)(a1 + 24);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __40__UIDragInteraction__addItemsWithPoint___block_invoke;
    v18[3] = &unk_1E52E4778;
    v18[4] = a1;
    id v19 = v15;
    id v7 = v15;
    uint64_t v9 = objc_msgSend((id)a1, "_itemsForAddingToSession:atPoint:completion:", v16, v18, a2, a3, a4);
    uint64_t v11 = v19;
  }

  return v9;
}

void __40__UIDragInteraction__addItemsWithPoint___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 count] && *(void *)(*(void *)(a1 + 32) + 24) == *(void *)(a1 + 40))
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v4 = (id)[v3 copy];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "_setDragDropSession:", *(void *)(*(void *)(a1 + 32) + 24), (void)v17);
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    uint64_t v9 = *(void **)(a1 + 32);
    id v10 = [v9 delegate];
    [v9 _queryDelegate:v10 forLiftPreviewsUsingItems:v4 session:*(void *)(*(void *)(a1 + 32) + 24)];

    uint64_t v11 = [*(id *)(a1 + 32) delegate];
    uint64_t v12 = *(void *)(a1 + 32);
    if ((*(unsigned char *)(v12 + 56) & 4) != 0)
    {
      uint64_t v13 = objc_opt_new();
      [v13 pauseAnimation];
      uint64_t v14 = [[_UIDragAnimatingWrapper alloc] initWithPropertyAnimator:v13];
      [v11 dragInteraction:*(void *)(a1 + 32) willAnimateLiftWithAnimator:v14 session:*(void *)(*(void *)(a1 + 32) + 24)];
      [v13 startAnimation];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "addItems:forDragSourceInteraction:", v4);
      [v13 stopAnimation:0];
      [v13 finishAnimationAtPosition:0];
    }
    else
    {
      objc_msgSend(*(id *)(v12 + 24), "addItems:forDragSourceInteraction:", v4);
    }
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(v15 + 24);
    *(void *)(v15 + 24) = 0;
  }
}

- (void)_updateInteractionEffectWithContext:(id)a3 notifyDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v6)
    {
      uint64_t v9 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Attempting to update a nil context", buf, 2u);
      }
    }
  }
  else if (!v6)
  {
    id v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateInteractionEffectWithContext_notifyDelegate____s_category)+ 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_ERROR, "Attempting to update a nil context", v11, 2u);
    }
  }
  uint64_t v7 = [(UIDragInteraction *)self interactionEffect];
  [v7 interaction:self didChangeWithContext:v6];

  if (v4)
  {
    uint64_t v8 = [(UIDragInteraction *)self delegate];
    if ((*((unsigned char *)&self->_delegateImplements + 2) & 8) != 0) {
      objc_msgSend(v8, "_dragInteraction:liftAnimationDidChangeDirection:", self, objc_msgSend(v6, "state") == 0);
    }
  }
}

- (UIDragInteractionEffect)interactionEffect
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = self->_initiationDrivers;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v9 = objc_msgSend(v8, "interactionEffect", (void)v12);

          if (v9)
          {
            id v10 = [v8 interactionEffect];

            goto LABEL_12;
          }
        }
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  id v10 = self->_interactionEffect;
LABEL_12:
  return v10;
}

- (void)_accessibilityPrepareForDragAtPoint:(CAPoint3D)a3 completion:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  uint64_t v8 = [(UIDragInteraction *)self view];
  objc_msgSend(v8, "convertPoint:toView:", 0, x, y);
  double v10 = v9;
  double v12 = v11;

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __68__UIDragInteraction__accessibilityPrepareForDragAtPoint_completion___block_invoke;
  v14[3] = &unk_1E52EBD28;
  v14[4] = self;
  id v15 = v7;
  id v13 = v7;
  -[UIDragInteraction _prepareForLiftAtPoint:invocationType:completion:]((id *)&self->super.isa, 1, v14, v10, v12, 0.0);
}

void __68__UIDragInteraction__accessibilityPrepareForDragAtPoint_completion___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if (v8)
  {
    id v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 delegate];
    uint64_t v5 = [v3 _queryDelegate:v4 forItemsForBeginningSession:v8];

    uint64_t v6 = [*(id *)(a1 + 32) _beginLiftForItems:v5 session:v8 animated:0];
    [*(id *)(*(void *)(a1 + 32) + 32) setHasBegunDrag:v6];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, v6);
  }
}

- (BOOL)_accessibilityAddItemsToDragSessionAtPoint:(CAPoint3D)a3
{
  double z = a3.z;
  double y = a3.y;
  double x = a3.x;
  int v7 = [(UIDragInteraction *)self _accessibilityCanAddItemsToDragSession];
  if (v7)
  {
    id v8 = _sessionsAvailableForAddingItems();
    double v9 = [v8 anyObject];
    sessionForAddingItems = self->_sessionForAddingItems;
    self->_sessionForAddingItems = v9;

    LOBYTE(v7) = -[UIDragInteraction _addItemsWithPoint:]((uint64_t)self, x, y, z);
  }
  return v7;
}

- (BOOL)_accessibilityCanAddItemsToDragSession
{
  id v3 = [(UIDragInteraction *)self delegate];
  if (![(UIDragInteraction *)self isEnabled]) {
    goto LABEL_7;
  }
  uint64_t v4 = _sessionsAvailableForAddingItems();
  if ([v4 count] != 1)
  {

    goto LABEL_7;
  }
  sessionForAddingItems = self->_sessionForAddingItems;

  if (sessionForAddingItems)
  {
LABEL_7:
    BOOL v6 = 0;
    goto LABEL_8;
  }
  BOOL v6 = [(UIDragInteraction *)self _delegateRespondsToAddingItems]
    || [(UIDragInteraction *)self _supportsAddingItemsAsynchronously];
LABEL_8:

  return v6;
}

void __70__UIDragInteraction__prepareForLiftAtPoint_invocationType_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained[4])
    {
      id v4 = objc_loadWeakRetained((id *)(a1 + 40));
      id v5 = (id)WeakRetained[4];

      if (v4 == v5) {
        [WeakRetained _finalizeLiftCancellation];
      }
    }
  }
}

uint64_t __70__UIDragInteraction__prepareForLiftAtPoint_invocationType_completion___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(*(void *)(a1 + 32) + 32) setPreparedForLift:1];
  }
  id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (void)_prepareForSession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIDragInteraction *)self delegate];
  if ((*((unsigned char *)&self->_delegateImplements + 2) & 4) != 0)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__UIDragInteraction__prepareForSession_completion___block_invoke;
    v9[3] = &unk_1E52DA040;
    id v10 = v7;
    [v8 _dragInteraction:self prepareForSession:v6 completion:v9];
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

uint64_t __51__UIDragInteraction__prepareForSession_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_beginLiftForItems:(id)a3 session:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 count];
  if (v10)
  {
    objc_storeStrong((id *)&self->_preliminarySession, a4);
    [(_UIDragSessionImpl *)self->_preliminarySession addItems:v8 forDragSourceInteraction:self];
    [(UIDragInteractionContextImpl *)self->_interactionContext setItems:v8];
    [(UIDragInteractionContextImpl *)self->_interactionContext setShouldAnimateLift:v5];
    double v11 = [(UIDragInteraction *)self delegate];
    [(UIDragInteraction *)self _queryDelegate:v11 forLiftPreviewsUsingItems:v8 session:v9];
    if ((*(unsigned char *)&self->_delegateImplements & 4) != 0) {
      [v11 dragInteraction:self willAnimateLiftWithAnimator:self->_interactionContext session:v9];
    }
    long long v20 = v11;
    id v21 = v9;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v8;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * v16), "_targetedLiftPreview", v20);
          long long v18 = [v17 _previewContainer];
          [v18 _animateLiftAlongsideAnimator:self->_interactionContext completion:&__block_literal_global_307];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v14);
    }

    [(UIDragInteractionContextImpl *)self->_interactionContext setState:1];
    [(UIDragInteraction *)self _updateInteractionEffectWithContext:self->_interactionContext notifyDelegate:0];

    id v9 = v21;
  }

  return v10 != 0;
}

- (void)_endLiftWithoutDragging
{
  interactionContext = self->_interactionContext;
  if (interactionContext)
  {
    [(UIDragInteractionContextImpl *)interactionContext setState:0];
    [(UIDragInteraction *)self _updateInteractionEffectWithContext:self->_interactionContext notifyDelegate:1];
    id v4 = [(UIDragInteraction *)self delegate];
    if ((*((unsigned char *)&self->_delegateImplements + 2) & 0x10) != 0)
    {
      id v5 = v4;
      [v4 _dragInteractionDidCancelLiftWithoutDragging:self];
      id v4 = v5;
    }
  }
}

- (void)_cancelLift
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v2 = self->_initiationDrivers;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "cancel", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_finalizeLiftCancellation
{
  preliminarySession = self->_preliminarySession;
  self->_preliminarySession = 0;

  interactionContext = self->_interactionContext;
  self->_interactionContext = 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_gestureRecognizerForAddingItems != a3) {
    return 0;
  }
  id v5 = a3;
  uint64_t v6 = [(UIDragInteraction *)self view];
  [v5 locationInView:v6];
  double v8 = v7;
  double v10 = v9;

  return -[UIDragInteraction _addItemsWithPoint:]((uint64_t)self, v8, v10, 0.0);
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_gestureRecognizerForAddingItems == a3)
  {
    id v5 = a4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    char v4 = isKindOfClass ^ 1;
  }
  else
  {
    char v4 = 0;
  }
  return v4 & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  uint64_t v6 = (_UIDragAddItemsGesture *)a3;
  id v7 = a4;
  double v8 = v7;
  BOOL v9 = self->_gestureRecognizerForAddingItems == v6 && ([v7 _isGestureType:0] & 1) != 0;

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_gestureRecognizerForAddingItems == a3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    double v8 = self->_initiationDrivers;
    uint64_t v7 = [(NSSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "isGestureRecognizerForDragInitiation:", v6, (void)v12))
          {
            LOBYTE(v7) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [(NSSet *)v8 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  if (self->_gestureRecognizerForAddingItems == a3)
  {
    sessionForAddingItems = self->_sessionForAddingItems;
    self->_sessionForAddingItems = 0;
  }
}

- (id)_itemsToDragFromView:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = [(_UIDragSessionImpl *)self->_preliminarySession items];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * i) _setSourceVisualTarget:self->_preliminarySession];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v9 = [(_UIDragSessionImpl *)self->_preliminarySession items];
  double v10 = (void *)[v9 copy];

  return v10;
}

- (void)_view:(id)a3 willBeginDraggingWithSession:(id)a4
{
}

- (BOOL)_viewRestrictsDragToSourceApp:(id)a3
{
  if ((*(unsigned char *)&self->_delegateImplements & 0x20) == 0) {
    return 0;
  }
  char v4 = self;
  uint64_t v5 = [(UIDragInteraction *)self delegate];
  LOBYTE(v4) = [v5 dragInteraction:v4 sessionIsRestrictedToDraggingApplication:v4->_preliminarySession];

  return (char)v4;
}

- (void)_viewFailedToDrag:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_initiationDrivers;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cancel", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)_viewDragSessionProperties:(id)a3
{
  uint64_t v4 = [(UIDragInteraction *)self delegate];
  uint64_t v5 = v4;
  if ((*((unsigned char *)&self->_delegateImplements + 3) & 0x10) == 0
    || ([v4 _dragInteraction:self sessionPropertiesForSession:self->_preliminarySession],
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = objc_opt_new();
    if ((*((unsigned char *)&self->_delegateImplements + 3) & 4) != 0) {
      objc_msgSend(v6, "set_supportsSystemDrag:", objc_msgSend(v5, "_dragInteraction:sessionSupportsSystemDrag:", self, self->_preliminarySession));
    }
  }

  return v6;
}

- (id)_requiredContextIDsForDragSessionInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIDragInteraction *)self delegate];
  if (v5 == self || (objc_opt_respondsToSelector() & 1) == 0)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v6 = [(UIDragInteraction *)v5 _requiredContextIDsForDragSessionInView:v4];
  }

  return v6;
}

- (int64_t)_dataOwnerOfDragFromView:(id)a3
{
  id v4 = [(UIDragInteraction *)self delegate];
  uint64_t v5 = v4;
  if (*((unsigned char *)&self->_delegateImplements + 3)) {
    int64_t v6 = [v4 _dragInteraction:self dataOwnerForSession:self->_preliminarySession];
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_session:(id)a3 sourceOperationMaskForDraggingWithinApp:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(UIDragInteraction *)self delegate];
  long long v8 = v7;
  if (v4)
  {
    if ((*(unsigned char *)&self->_delegateImplements & 0x10) != 0
      && ![v7 dragInteraction:self sessionAllowsMoveOperation:v6])
    {
      unint64_t v9 = 1;
    }
    else
    {
      unint64_t v9 = 17;
    }
  }
  else
  {
    long long v10 = [v6 _internalDragSession];
    int v11 = [v10 shouldCancelOnAppDeactivation];

    if (v11)
    {
      unint64_t v9 = 0;
    }
    else
    {
      long long v12 = [v6 _internalDragSession];
      int v13 = [v12 restrictedToSourceApp];

      unint64_t v9 = v13 ^ 1u;
    }
  }

  return v9;
}

- (BOOL)_sessionPrefersFullSizePreviews:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIDragInteraction *)self delegate];
  id v6 = v5;
  if ((*(unsigned char *)&self->_delegateImplements & 0x40) != 0) {
    char v7 = [v5 dragInteraction:self prefersFullSizePreviewsForSession:v4];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)_sessionDynamicallyUpdatesPrefersFullSizePreviews:(id)a3
{
  id v4 = [(UIDragInteraction *)self delegate];
  uint64_t v5 = v4;
  if ((*((unsigned char *)&self->_delegateImplements + 4) & 2) != 0) {
    char v6 = [v4 _dragInteractionDynamicallyUpdatesPrefersFullSizePreviews:self];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)_sessionHandedOffDragImage:(id)a3
{
  id v4 = a3;
  if (self->_interactionContext)
  {
    id v10 = v4;
    uint64_t v5 = [(UIDragInteraction *)self delegate];
    char v6 = v5;
    if ((*(unsigned char *)&self->_delegateImplements & 8) != 0) {
      [v5 dragInteraction:self sessionWillBegin:v10];
    }
    [v10 _setSentSessionDidBegin:1];
    [(UIDragInteractionContextImpl *)self->_interactionContext setState:2];
    [(UIDragInteraction *)self _updateInteractionEffectWithContext:self->_interactionContext notifyDelegate:0];
    char v7 = [(UIDragInteractionContextImpl *)self->_interactionContext _sessionDidBegin];

    if (v7)
    {
      long long v8 = [(UIDragInteractionContextImpl *)self->_interactionContext _sessionDidBegin];
      ((void (**)(void, id))v8)[2](v8, v10);
    }
    interactionContext = self->_interactionContext;
    self->_interactionContext = 0;

    id v4 = v10;
  }
}

- (void)_sessionDidMove:(id)a3
{
  id v6 = a3;
  id v4 = [(UIDragInteraction *)self delegate];
  uint64_t v5 = v4;
  if ((*(unsigned char *)&self->_delegateImplements & 0x80) != 0) {
    [v4 dragInteraction:self sessionDidMove:v6];
  }
}

- (void)_session:(id)a3 willAddItems:(id)a4 forInteraction:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(UIDragInteraction *)self delegate];
  int v11 = v10;
  if ((*((unsigned char *)&self->_delegateImplements + 1) & 0x20) != 0) {
    [v10 dragInteraction:self session:v12 willAddItems:v8 forInteraction:v9];
  }
}

- (void)_sessionWillEnd:(id)a3 withOperation:(unint64_t)a4
{
  id v6 = a3;
  interactionContext = self->_interactionContext;
  id v17 = v6;
  if (interactionContext)
  {
    uint64_t v8 = [(UIDragInteractionContextImpl *)interactionContext state];
    id v6 = v17;
    if (v8 != 2)
    {
      [(UIDragInteraction *)self _endLiftWithoutDragging];
      [(UIDragInteraction *)self _finalizeLiftCancellation];
      id v9 = [(UIDragInteraction *)self _presentationDelegate];
      id v10 = v9;
      if ((*(unsigned char *)&self->_presentationDelegateImplements & 4) != 0) {
        [v9 _dragInteractionPresentation:self sessionDidEnd:v17 withoutBeginning:1];
      }

      id v6 = v17;
    }
  }
  int v11 = [v6 _sentSessionDidBegin];
  id v12 = v17;
  if (v11)
  {
    int v13 = [(UIDragInteraction *)self delegate];
    long long v14 = v13;
    if (*((unsigned char *)&self->_delegateImplements + 1))
    {
      uint64_t v15 = 2;
      if (a4 == 16) {
        uint64_t v15 = 3;
      }
      if (a4) {
        uint64_t v16 = v15;
      }
      else {
        uint64_t v16 = 0;
      }
      [v13 dragInteraction:self session:v17 willEndWithOperation:v16];
    }

    id v12 = v17;
  }
}

- (void)_sessionDidEnd:(id)a3 withOperation:(unint64_t)a4
{
  id v12 = a3;
  if ([v12 _sentSessionDidBegin])
  {
    id v6 = [(UIDragInteraction *)self delegate];
    char v7 = v6;
    if ((*((unsigned char *)&self->_delegateImplements + 1) & 2) != 0)
    {
      uint64_t v8 = 2;
      if (a4 == 16) {
        uint64_t v8 = 3;
      }
      if (a4) {
        uint64_t v9 = v8;
      }
      else {
        uint64_t v9 = 0;
      }
      [v6 dragInteraction:self session:v12 didEndWithOperation:v9];
    }
    id v10 = [(UIDragInteraction *)self _presentationDelegate];
    int v11 = v10;
    if ((*(unsigned char *)&self->_presentationDelegateImplements & 4) != 0) {
      [v10 _dragInteractionPresentation:self sessionDidEnd:v12 withoutBeginning:0];
    }
  }
}

- (id)_session:(id)a3 targetedPreviewForCancellingItem:(id)a4 duiPreview:(id)a5 snapshotView:(id)a6 container:(id)a7
{
  id v11 = a4;
  id v46 = a5;
  id v12 = a6;
  id v13 = a7;
  long long v14 = [(UIDragInteraction *)self delegate];
  if ((*((unsigned char *)&self->_delegateImplements + 1) & 0x40) != 0
    || ([(UIDragInteraction *)self _presentationDelegate],
        uint64_t v15 = (UITargetedDragPreview *)objc_claimAutoreleasedReturnValue(),
        v15,
        v15))
  {
    uint64_t v16 = [(UIDragInteraction *)self view];
    uint64_t v17 = [v16 window];
    if (v17 && (long long v18 = (void *)v17, v19 = [v16 isHiddenOrHasHiddenAncestor], v18, !v19))
    {
      id v21 = v13;
      [v16 frame];
      double v26 = v25 + v24 * 0.5;
      double v29 = v28 + v27 * 0.5;
      long long v30 = [UIDragPreviewTarget alloc];
      long long v31 = [v16 superview];
      long long v22 = -[UIPreviewTarget initWithContainer:center:](v30, "initWithContainer:center:", v31, v26, v29);

      char v23 = 0;
    }
    else
    {
      long long v20 = [UIDragPreviewTarget alloc];
      [v12 center];
      id v21 = v13;
      long long v22 = -[UIPreviewTarget initWithContainer:center:](v20, "initWithContainer:center:", v13);
      char v23 = 1;
    }
    long long v32 = [UITargetedDragPreview alloc];
    long long v33 = [v46 parameters];
    uint64_t v15 = [(UITargetedDragPreview *)v32 initWithView:v12 parameters:v33 target:v22];

    [(UITargetedPreview *)v15 _setDefaultPreview:1];
  }
  else
  {
    id v21 = v13;
    char v23 = 0;
  }
  if ((*((unsigned char *)&self->_delegateImplements + 1) & 0x40) == 0)
  {
    uint64_t v34 = 0;
    goto LABEL_20;
  }
  __int16 v35 = [v14 dragInteraction:self previewForCancellingItem:v11 withDefault:v15];
  if (v35 == v15) {
    char v36 = v23;
  }
  else {
    char v36 = 0;
  }
  if (v36)
  {
    uint64_t v34 = 0;
    uint64_t v37 = v15;
  }
  else
  {
    uint64_t v34 = v35;
    if (!v35) {
      goto LABEL_20;
    }
    uint64_t v38 = [(UITargetedPreview *)v35 target];
    uint64_t v37 = [v38 container];

    uint64_t v39 = [v37 _window];
    if (!v39 || (uint64_t v40 = (void *)v39, v41 = [v37 isHiddenOrHasHiddenAncestor], v40, v41))
    {

      uint64_t v34 = 0;
    }
  }

LABEL_20:
  uint64_t v42 = [(UIDragInteraction *)self _presentationDelegate];
  char v43 = v42;
  if (*(unsigned char *)&self->_presentationDelegateImplements)
  {
    uint64_t v44 = [v42 _dragInteractionPresentation:self previewForCancellingItem:v11 defaultPreview:v15 proposedPreview:v34];

    uint64_t v34 = (void *)v44;
  }

  return v34;
}

- (void)_session:(id)a3 item:(id)a4 willCancelWithAnimator:(id)a5
{
  id v15 = a4;
  id v7 = a5;
  if (v15)
  {
    uint64_t v8 = [(UIDragInteraction *)self delegate];
    if ((*((unsigned char *)&self->_delegateImplements + 1) & 0x80) != 0)
    {
      uint64_t v9 = [[_UIDragAnimatingWrapper alloc] initWithPropertyAnimator:v7];
      [v8 dragInteraction:self item:v15 willAnimateCancelWithAnimator:v9];
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = [(UIDragInteraction *)self _presentationDelegate];
    if ((*(unsigned char *)&self->_presentationDelegateImplements & 2) != 0)
    {
      if (!v9) {
        uint64_t v9 = [[_UIDragAnimatingWrapper alloc] initWithPropertyAnimator:v7];
      }
      [v10 _dragInteractionPresentation:self item:v15 willAnimateCancelWithAnimator:v9];
    }
    id v11 = [v15 _targetedLiftPreview];
    id v12 = [v11 _previewContainer];

    if (v12)
    {
      if (!v9) {
        uint64_t v9 = [[_UIDragAnimatingWrapper alloc] initWithPropertyAnimator:v7];
      }
      id v13 = [v15 _targetedLiftPreview];
      long long v14 = [v13 _previewContainer];
      [v14 _animateLiftCancellationAlongsideAnimator:v9 completion:&__block_literal_global_317_0];
    }
  }
}

- (BOOL)_session:(id)a3 item:(id)a4 shouldDelaySetDownAnimationWithCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v9)
  {
    id v11 = [(UIDragInteraction *)self delegate];
    id v12 = v11;
    if ((*((unsigned char *)&self->_delegateImplements + 3) & 0x40) != 0) {
      char v13 = [v11 _dragInteraction:self item:v9 shouldDelaySetDownAnimationWithCompletion:v10];
    }
    else {
      char v13 = 0;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (id)_session:(id)a3 customSpringAnimationBehaviorForCancellingItem:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [(UIDragInteraction *)self delegate];
    id v7 = v6;
    if ((*((unsigned char *)&self->_delegateImplements + 3) & 8) != 0)
    {
      id v8 = [v6 _dragInteraction:self customSpringAnimationBehaviorForCancellingItem:v5];
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)_sessionDidTransferItems:(id)a3
{
  id v6 = a3;
  id v4 = [(UIDragInteraction *)self delegate];
  id v5 = v4;
  if ((*((unsigned char *)&self->_delegateImplements + 1) & 4) != 0) {
    [v4 dragInteraction:self sessionDidTransferItems:v6];
  }
}

- (BOOL)dragDriver:(id)a3 shouldBeginAtLocation:(CGPoint)a4
{
  return -[UIDragInteraction dragDriver:shouldBeginAtLocation3D:](self, "dragDriver:shouldBeginAtLocation3D:", a3, a4.x, a4.y, 0.0);
}

- (BOOL)dragDriver:(id)a3 shouldBeginAtLocation3D:(CAPoint3D)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if ([(UIDragInteraction *)self _isActive] && !self->_allowsMultipleSessions)
  {
    LOBYTE(v18) = 0;
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = self->_initiationDrivers;
    uint64_t v9 = [(NSSet *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v29 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(id *)(*((void *)&v28 + 1) + 8 * i);
          if (v13 != v7 && ([v13 isActive] & 1) != 0)
          {
            LOBYTE(v18) = 0;
            goto LABEL_28;
          }
        }
        uint64_t v10 = [(NSSet *)v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    interactionContext = self->_interactionContext;
    if (interactionContext
      && ([(UIDragInteractionContextImpl *)interactionContext items],
          id v15 = objc_claimAutoreleasedReturnValue(),
          uint64_t v16 = [v15 count],
          v15,
          v16))
    {
      id v8 = [(UIDragInteraction *)self view];
      long long v24 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      uint64_t v17 = [(UIDragInteractionContextImpl *)self->_interactionContext items];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v25;
        while (2)
        {
          for (uint64_t j = 0; j != v18; ++j)
          {
            if (*(void *)v25 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = [*(id *)(*((void *)&v24 + 1) + 8 * j) _targetedLiftPreview];
            char v22 = objc_msgSend(v21, "containsPoint:fromView:", v8, x, y);

            if (v22)
            {
              LOBYTE(v18) = 1;
              goto LABEL_27;
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_27:

LABEL_28:
    }
    else
    {
      LOBYTE(v18) = 1;
    }
  }

  return v18;
}

- (void)dragDriver:(id)a3 prepareToLiftWithCompletion:(id)a4
{
  id v6 = a4;
  if (self)
  {
    [a3 initialLocationInWindow];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    double v10 = 0.0;
    double v8 = 0.0;
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__UIDragInteraction_dragDriver_prepareToLiftWithCompletion___block_invoke;
  v12[3] = &unk_1E52EBD28;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  -[UIDragInteraction _prepareForLiftAtPoint:invocationType:completion:]((id *)&self->super.isa, 1, v12, v8, v10, 0.0);
}

void __60__UIDragInteraction_dragDriver_prepareToLiftWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), a2);
  id v4 = a2;
  (*(void (**)(void, BOOL))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v4 != 0);
}

- (BOOL)dragDriverBeginLift:(id)a3
{
  preliminarySession = self->_preliminarySession;
  self->_preliminarySession = 0;
  id v6 = preliminarySession;
  id v7 = a3;

  double v8 = [(UIDragInteraction *)self delegate];
  double v9 = [(UIDragInteraction *)self _queryDelegate:v8 forItemsForBeginningSession:v6];

  uint64_t v10 = [v7 shouldAnimateLift];
  LOBYTE(v7) = [(UIDragInteraction *)self _beginLiftForItems:v9 session:v6 animated:v10];

  return (char)v7;
}

- (void)dragDriverCancelLift:(id)a3
{
  id v4 = a3;
  interactionContext = self->_interactionContext;
  if (interactionContext)
  {
    id v7 = v4;
    BOOL v6 = [(UIDragInteractionContextImpl *)interactionContext hasBegunDrag];
    id v4 = v7;
    if (!v6)
    {
      [(UIDragInteraction *)self _endLiftWithoutDragging];
      [(UIDragInteraction *)self _finalizeLiftCancellation];
      id v4 = v7;
    }
  }
}

- (void)dragDriver:(id)a3 beginDragWithTouches:(id)a4 itemUpdater:(id)a5 beginningSessionHandler:(id)a6
{
  id v9 = a6;
  [(UIDragInteraction *)self _beginDragWithTouches:a4 itemUpdater:a5];
  [(UIDragInteractionContextImpl *)self->_interactionContext set_sessionDidBegin:v9];
}

- (void)dragDriverCancelAddItemsGesture:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = [(UIGestureRecognizer *)self->_gestureRecognizerForAddingItems _allActiveTouches];
  uint64_t v5 = [v4 count];

  if (!v5)
  {
    BOOL v6 = (void *)UIApp;
    v8[0] = self->_gestureRecognizerForAddingItems;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v6 _cancelGestureRecognizers:v7];
  }
}

- (BOOL)_supportsAddingItemsAsynchronously
{
  return 0;
}

- (void)setView:(id)a3
{
}

- (NSSet)_initiationDrivers
{
  return self->_initiationDrivers;
}

- (_UIDragInteractionPresentationDelegate)_presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentationDelegate);
  return (_UIDragInteractionPresentationDelegate *)WeakRetained;
}

- (void)setInteractionEffect:(id)a3
{
}

- (BOOL)_competingLongPressOnLift
{
  return self->_competingLongPressOnLift;
}

- (BOOL)_allowsMultipleSessions
{
  return self->_allowsMultipleSessions;
}

- (void)_setAllowsMultipleSessions:(BOOL)a3
{
  self->_allowsMultipleSessions = a3;
}

- (int64_t)_addItemsGestureConfiguration
{
  return self->_addItemsGestureConfiguration;
}

- (NSArray)_allowedTouchTypes
{
  return self->_allowedTouchTypes;
}

@end