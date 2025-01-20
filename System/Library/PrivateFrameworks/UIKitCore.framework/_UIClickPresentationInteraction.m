@interface _UIClickPresentationInteraction
+ (void)_setDefaultDriverClasses:(id)a3 forIdiom:(int64_t)a4;
- (BOOL)_canPerformPresentation;
- (BOOL)_delegate_shouldAllowDragAfterDismiss;
- (BOOL)_isActive;
- (BOOL)_isControlledByCC;
- (BOOL)_reachedForceThreshold;
- (BOOL)_supportsRapidRestart;
- (BOOL)allowSimultaneousRecognition;
- (BOOL)beginDragIfPossibleWithTouch:(id)a3;
- (BOOL)clickDriver:(id)a3 shouldBeDelayedByGestureRecognizer:(id)a4;
- (BOOL)clickDriver:(id)a3 shouldDelayGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CAPoint3D)initialLocation;
- (CGPoint)locationInView:(id)a3;
- (NSArray)allDrivers;
- (NSArray)overrideDrivers;
- (NSArray)secondaryEffectPreviews;
- (NSString)debugIdentifier;
- (NSString)presentationTypeDebugString;
- (UIDragInteraction)associatedDragInteraction;
- (UIDragInteraction)latentAssociatedDragInteraction;
- (UIGestureRecognizer)gestureRecognizerForBeginningDragRelationships;
- (UITargetedPreview)primaryEffectPreview;
- (UIView)view;
- (_UIClickInteractionDriving)activeDriver;
- (_UIClickPresentation)pendingPresentation;
- (_UIClickPresentationAssisting)presentationAssistant;
- (_UIClickPresentationFeedbackGenerator)feedbackGenerator;
- (_UIClickPresentationInteraction)initWithDelegate:(id)a3;
- (_UIClickPresentationInteractionDelegate)delegate;
- (_UIRelationshipGestureRecognizer)exclusionRelationshipGestureRecognizer;
- (_UIRelationshipGestureRecognizer)failureRelationshipGestureRecognizer;
- (id)_activeEffect;
- (id)_candidateInteractionsForAssociation;
- (id)_clickDragDriver;
- (id)_clickDriverTouch;
- (id)_dragInteractionPresentation:(id)a3 previewForCancellingItem:(id)a4 defaultPreview:(id)a5 proposedPreview:(id)a6;
- (unint64_t)activatedDriverStyle;
- (unint64_t)fallbackDriverStyle;
- (unint64_t)inputPrecision;
- (void)_associateWithActiveDragInteraction;
- (void)_attemptDragLiftAtLocation:(CGPoint)a3 useDefaultLiftAnimation:(BOOL)a4;
- (void)_cancelAllDrivers;
- (void)_cancelWithReason:(unint64_t)a3 alongsideActions:(id)a4 completion:(id)a5;
- (void)_delegate_interactionEndedWithContext:(const InteractionEndingContext *)a3;
- (void)_dragInteractionPresentation:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)_dragInteractionPresentation:(id)a3 sessionDidEnd:(id)a4 withoutBeginning:(BOOL)a5;
- (void)_driverClickedDown;
- (void)_driverClickedUp;
- (void)_driverEnded;
- (void)_endInteractionDidComplete:(void *)a1 completion:(void *)a2;
- (void)_endInteractionEffectIfNeeded;
- (void)_endInteractionWithContext:(const InteractionEndingContext *)a3;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_performPresentation;
- (void)_performPreviewPresentation;
- (void)_prepareInteractionEffect;
- (void)_refreshAllDrivers;
- (void)_setDelegate:(id)a3;
- (void)_viewTraitCollectionDidChange:(id)a3;
- (void)beginPanInteraction;
- (void)cancelInteraction;
- (void)clickDriver:(id)a3 didPerformEvent:(unint64_t)a4;
- (void)clickDriver:(id)a3 didUpdateHighlightProgress:(double)a4;
- (void)clickDriver:(id)a3 shouldBegin:(id)a4;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)endPanInteraction;
- (void)present;
- (void)setActiveDriver:(id)a3;
- (void)setAllDrivers:(id)a3;
- (void)setAllowSimultaneousRecognition:(BOOL)a3;
- (void)setAssociatedDragInteraction:(id)a3;
- (void)setDebugIdentifier:(id)a3;
- (void)setExclusionRelationshipGestureRecognizer:(id)a3;
- (void)setFailureRelationshipGestureRecognizer:(id)a3;
- (void)setFallbackDriverStyle:(unint64_t)a3;
- (void)setFeedbackGenerator:(id)a3;
- (void)setInitialLocation:(CAPoint3D)a3;
- (void)setLatentAssociatedDragInteraction:(id)a3;
- (void)setOverrideDrivers:(id)a3;
- (void)setPendingPresentation:(id)a3;
- (void)setPresentationAssistant:(id)a3;
- (void)setPresentationTypeDebugString:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation _UIClickPresentationInteraction

- (void)cancelInteraction
{
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  v6 = (_UIRelationshipGestureRecognizer *)a3;
  id v7 = a4;
  v8 = [(_UIClickPresentationInteraction *)self exclusionRelationshipGestureRecognizer];

  if (v8 != v6)
  {
    v9 = [(_UIClickPresentationInteraction *)self failureRelationshipGestureRecognizer];

    if (v9 != v6)
    {
      char isKindOfClass = self->_gestureRecognizerForBeginningDragRelationships == v6;
      goto LABEL_11;
    }
LABEL_8:
    char isKindOfClass = 1;
    goto LABEL_11;
  }
  if (![v7 _isGestureType:1])
  {
    if (![(_UIClickPresentationInteraction *)self _isControlledByCC])
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if ([v7 _isGestureType:3]) {
    char isKindOfClass = 0;
  }
  else {
    char isKindOfClass = [v7 _prefersToBeExclusiveWithCompetingLongPressGestureRecognizers] ^ 1;
  }
LABEL_11:

  return isKindOfClass & 1;
}

- (BOOL)_isControlledByCC
{
  if ([(id)UIApp _isSpringBoard])
  {
    v3 = [(_UIClickPresentationInteraction *)self delegate];
    NSClassFromString(&cfstr_Ccuicontentmod.isa);
    if (objc_opt_isKindOfClass())
    {
      char isKindOfClass = 1;
    }
    else
    {
      v5 = [(_UIClickPresentationInteraction *)self delegate];
      NSClassFromString(&cfstr_Ccuicontentmod_0.isa);
      char isKindOfClass = objc_opt_isKindOfClass();
    }
  }
  else
  {
    char isKindOfClass = 0;
  }
  return isKindOfClass & 1;
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = objc_storeWeak((id *)&self->_view, a3);
  if (a3)
  {
    [(_UIClickPresentationInteraction *)self _refreshAllDrivers];
    v6 = [(_UIClickPresentationInteraction *)self exclusionRelationshipGestureRecognizer];

    if (!v6)
    {
      id v7 = objc_opt_new();
      [v7 setName:@"com.apple.UIKit.clickPresentationExclusion"];
      [v7 setDelegate:self];
      [(_UIClickPresentationInteraction *)self setExclusionRelationshipGestureRecognizer:v7];
    }
    v8 = [(_UIClickPresentationInteraction *)self failureRelationshipGestureRecognizer];

    if (!v8)
    {
      v9 = objc_opt_new();
      [v9 setName:@"com.apple.UIKit.clickPresentationFailure"];
      [v9 setDelegate:self];
      [(_UIClickPresentationInteraction *)self setFailureRelationshipGestureRecognizer:v9];
    }
    id WeakRetained = objc_loadWeakRetained((id *)p_view);
    v11 = [(_UIClickPresentationInteraction *)self exclusionRelationshipGestureRecognizer];
    [WeakRetained addGestureRecognizer:v11];

    id v12 = objc_loadWeakRetained((id *)p_view);
    v13 = [(_UIClickPresentationInteraction *)self failureRelationshipGestureRecognizer];
    [v12 addGestureRecognizer:v13];

    if (self->_gestureRecognizerForBeginningDragRelationships)
    {
      id v14 = objc_loadWeakRetained((id *)p_view);
      v15 = [(_UIClickPresentationInteraction *)self gestureRecognizerForBeginningDragRelationships];
      [v14 addGestureRecognizer:v15];
    }
    _UIContextMenuRegisterDefaultPlatformMetricsIfNecessary();
    id v16 = objc_loadWeakRetained((id *)p_view);
    v17 = [v16 traitCollection];
    v18 = _UIContextMenuGetPlatformMetrics([v17 userInterfaceIdiom]);

    v19 = [_UIClickPresentationFeedbackGenerator alloc];
    v20 = [v18 presentationFeedbackConfiguration];
    id v21 = objc_loadWeakRetained((id *)p_view);
    v22 = [(_UIClickPresentationFeedbackGenerator *)v19 initWithConfiguration:v20 view:v21];
    [(_UIClickPresentationInteraction *)self setFeedbackGenerator:v22];
  }
}

- (void)setFailureRelationshipGestureRecognizer:(id)a3
{
}

- (void)setExclusionRelationshipGestureRecognizer:(id)a3
{
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIClickPresentationInteraction *)self exclusionRelationshipGestureRecognizer];

  if (v5 == v4)
  {
    if ([(_UIClickPresentationInteraction *)self _isActive]) {
      [(_UIClickPresentationInteraction *)self _cancelAllDrivers];
    }
    v6 = [(_UIClickPresentationInteraction *)self failureRelationshipGestureRecognizer];
    [v6 _fail];

    gestureRecognizerForBeginningDragRelationships = self->_gestureRecognizerForBeginningDragRelationships;
    [(_UIRelationshipGestureRecognizer *)gestureRecognizerForBeginningDragRelationships _fail];
  }
}

- (void)willMoveToView:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = [(_UIClickPresentationInteraction *)self allDrivers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v9 setView:0];
        [v9 setDelegate:0];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  v10 = [(_UIClickPresentationInteraction *)self exclusionRelationshipGestureRecognizer];
  v11 = [v10 view];
  id v12 = [(_UIClickPresentationInteraction *)self exclusionRelationshipGestureRecognizer];
  [v11 removeGestureRecognizer:v12];

  v13 = [(_UIClickPresentationInteraction *)self failureRelationshipGestureRecognizer];
  id v14 = [v13 view];
  v15 = [(_UIClickPresentationInteraction *)self failureRelationshipGestureRecognizer];
  [v14 removeGestureRecognizer:v15];

  [(_UIClickPresentationInteraction *)self setFeedbackGenerator:0];
  [(_UIClickPresentationInteraction *)self setAssociatedDragInteraction:0];
  objc_storeWeak((id *)&self->_view, 0);
}

- (_UIRelationshipGestureRecognizer)exclusionRelationshipGestureRecognizer
{
  return self->_exclusionRelationshipGestureRecognizer;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_UIClickPresentationInteraction *)self failureRelationshipGestureRecognizer];
  if (v8 == v6 && [v7 _isGestureType:1])
  {
    v9 = [(_UIClickPresentationInteraction *)self allDrivers];
    if ([v9 count]
      && ![v7 _prefersNotToBePreventedByCompetingLongPressGestureRecognizers])
    {
      id v12 = [v7 name];
      char v13 = [v12 isEqualToString:@"PKSelectionDragGesture"];

      if ((v13 & 1) == 0)
      {
        BOOL v10 = ![(_UIClickPresentationInteraction *)self allowSimultaneousRecognition];
        goto LABEL_8;
      }
    }
    else
    {
    }
  }
  else
  {
  }
  LOBYTE(v10) = 0;
LABEL_8:

  return v10;
}

- (_UIRelationshipGestureRecognizer)failureRelationshipGestureRecognizer
{
  return self->_failureRelationshipGestureRecognizer;
}

- (void)setFeedbackGenerator:(id)a3
{
}

- (void)_refreshAllDrivers
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  v3 = [(_UIClickPresentationInteraction *)self allDrivers];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v43 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        [v8 setView:0];
        [v8 setDelegate:0];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v5);
  }

  v9 = [(_UIClickPresentationInteraction *)self view];

  if (v9)
  {
    BOOL v10 = [(_UIClickPresentationInteraction *)self overrideDrivers];

    if (v10)
    {
      v11 = [(_UIClickPresentationInteraction *)self overrideDrivers];
      [(_UIClickPresentationInteraction *)self setAllDrivers:v11];
    }
    else
    {
      v11 = [MEMORY[0x1E4F1CA48] array];
      id v12 = (void *)_driverClassesByIdiom;
      char v13 = NSNumber;
      id v14 = [(_UIClickPresentationInteraction *)self view];
      v15 = [v14 traitCollection];
      long long v16 = objc_msgSend(v13, "numberWithInteger:", objc_msgSend(v15, "userInterfaceIdiom"));
      long long v17 = [v12 objectForKeyedSubscript:v16];

      if (![v17 count])
      {
        if (self->_delegateImplements.activationStyle)
        {
          long long v18 = [(_UIClickPresentationInteraction *)self delegate];
          [v18 activationStyleForClickPresentationInteraction:self];
        }
        uint64_t v19 = _UIClickInteractionDefaultDrivers();

        long long v17 = (void *)v19;
      }
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v20 = v17;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
      if (v21)
      {
        uint64_t v22 = v21;
        uint64_t v23 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v39 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = objc_opt_new();
            [v11 addObject:v25];
            if (objc_opt_respondsToSelector())
            {
              [v25 setBehavior:1];
              v26 = objc_opt_new();
              [v26 setBehavior:2];
              [v11 addObject:v26];
            }
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v38 objects:v47 count:16];
        }
        while (v22);
      }

      [(_UIClickPresentationInteraction *)self setAllDrivers:v11];
    }

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    v27 = [(_UIClickPresentationInteraction *)self allDrivers];
    uint64_t v28 = [v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v35 != v30) {
            objc_enumerationMutation(v27);
          }
          v32 = *(void **)(*((void *)&v34 + 1) + 8 * k);
          v33 = [(_UIClickPresentationInteraction *)self view];
          [v32 setView:v33];

          [v32 setDelegate:self];
          objc_msgSend(v32, "setAllowableMovement:", _UIClickPresentationAllowableMovementForDriver(v32, 0));
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v29);
    }
  }
}

- (void)_viewTraitCollectionDidChange:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 forceTouchCapability];
  uint64_t v5 = [(_UIClickPresentationInteraction *)self view];
  uint64_t v6 = [v5 traitCollection];
  if (v4 != [v6 forceTouchCapability])
  {

    goto LABEL_5;
  }
  uint64_t v7 = [v11 userInterfaceIdiom];
  id v8 = [(_UIClickPresentationInteraction *)self view];
  v9 = [v8 traitCollection];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if (v7 != v10) {
LABEL_5:
  }
    [(_UIClickPresentationInteraction *)self _refreshAllDrivers];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (NSArray)allDrivers
{
  return self->_allDrivers;
}

- (NSArray)overrideDrivers
{
  return self->_overrideDrivers;
}

- (BOOL)clickDriver:(id)a3 shouldBeDelayedByGestureRecognizer:(id)a4
{
  if (!self->_delegateImplements.shouldBeDelayedByGestureRecognizer) {
    return 0;
  }
  uint64_t v4 = self;
  id v5 = a4;
  uint64_t v6 = [(_UIClickPresentationInteraction *)v4 delegate];
  LOBYTE(v4) = [v6 _clickPresentationInteraction:v4 shouldBeDelayedByGestureRecognizer:v5];

  return (char)v4;
}

- (_UIClickPresentationInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIClickPresentationInteractionDelegate *)WeakRetained;
}

- (BOOL)clickDriver:(id)a3 shouldDelayGestureRecognizer:(id)a4
{
  id v4 = a4;
  if ([v4 _isGestureType:8]) {
    BOOL v5 = [v4 state] < 1;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)setAllDrivers:(id)a3
{
}

- (void)setAssociatedDragInteraction:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
      [v6 _setInitiationDrivers:0];
    }
    id v7 = objc_storeWeak((id *)&self->_associatedDragInteraction, obj);

    if (obj)
    {
      id v8 = (void *)MEMORY[0x1E4F1CAD0];
      v9 = objc_opt_new();
      uint64_t v10 = [v8 setWithObject:v9];
      id v11 = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
      [v11 _setInitiationDrivers:v10];

      id v12 = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
      [v12 _setPresentationDelegate:self];
    }
  }
}

- (BOOL)allowSimultaneousRecognition
{
  return self->_allowSimultaneousRecognition;
}

- (_UIClickPresentationInteraction)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIClickPresentationInteraction;
  id v5 = [(_UIClickPresentationInteraction *)&v8 init];
  id v6 = v5;
  if (v5)
  {
    [(_UIClickPresentationInteraction *)v5 _setDelegate:v4];
    -[_UIClickPresentationInteraction setInitialLocation:](v6, "setInitialLocation:", 1.79769313e308, 1.79769313e308, 1.79769313e308);
    [(_UIClickPresentationInteraction *)v6 setFallbackDriverStyle:0];
  }

  return v6;
}

- (void)setInitialLocation:(CAPoint3D)a3
{
  self->_initialLocation = a3;
}

- (void)setFallbackDriverStyle:(unint64_t)a3
{
  self->_fallbackDriverStyle = a3;
}

- (void)_setDelegate:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateImplements.shouldBegin = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.previewForHighlightingAtLocation = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldPresent = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.ended = objc_opt_respondsToSelector() & 1;
    if ([(id)UIApp _isSpringBoard]) {
      self->_delegateImplements.activationStyle = objc_opt_respondsToSelector() & 1;
    }
    self->_delegateImplements.asyncShouldBegin = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldAllowRapidRestart = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldAssociateWithDrag = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldAllowDragAfterDismiss = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.liveDragPreviewForPresentation = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.previewForCancellingDragItem = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.willAnimateDragCancelWithAnimator = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.dragSessionDidEndForItems = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.interactionEffectForTargetedPreview = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.endedForPresentation = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldPlayFeedbacuint64_t k = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldPresentWithCompletion = objc_opt_respondsToSelector() & 1;
    self->_delegateImplements.shouldBeDelayedByGestureRecognizer = objc_opt_respondsToSelector() & 1;
    id v6 = [(_UIClickPresentationInteraction *)self delegate];
    self->_delegateImplements.secondaryPreviews = objc_opt_respondsToSelector() & 1;

    id v7 = [(_UIClickPresentationInteraction *)self delegate];
    self->_delegateImplements.shouldMaintainKeyboardAssertion = objc_opt_respondsToSelector() & 1;

    id v8 = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = obj;
    if (v8) {
      self->_currentState = 1;
    }
  }
}

- (void)setPresentationTypeDebugString:(id)a3
{
}

- (void)setDebugIdentifier:(id)a3
{
}

- (void)setOverrideDrivers:(id)a3
{
  id v5 = a3;
  overrideDrivers = self->_overrideDrivers;
  v9 = (NSArray *)v5;
  id v7 = overrideDrivers;
  if (v7 == v9)
  {

    goto LABEL_9;
  }
  if (!v9 || !v7)
  {

    goto LABEL_8;
  }
  char v8 = [(NSArray *)v9 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    objc_storeStrong((id *)&self->_overrideDrivers, a3);
    [(_UIClickPresentationInteraction *)self _refreshAllDrivers];
  }
LABEL_9:
}

- (void)_cancelWithReason:(unint64_t)a3 alongsideActions:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  if (self->_currentState > 3
    || ![(_UIClickPresentationInteraction *)self _supportsRapidRestart])
  {
    v10[0] = self;
    v10[1] = 0;
    v10[2] = a3;
    id v11 = 0;
    id v12 = _Block_copy(v8);
    id v13 = _Block_copy(v9);
    [(_UIClickPresentationInteraction *)self _endInteractionWithContext:v10];
  }
}

- (BOOL)_supportsRapidRestart
{
  if (!self->_delegateImplements.shouldAllowRapidRestart) {
    return 0;
  }
  v2 = self;
  v3 = [(_UIClickPresentationInteraction *)self delegate];
  LOBYTE(v2) = [v3 _clickPresentationInteractionShouldAllowRapidRestart:v2];

  return (char)v2;
}

- (void)_endInteractionDidComplete:(void *)a1 completion:(void *)a2
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    v5[0] = a1;
    v5[1] = 0;
    id v6 = 0;
    id v7 = 0;
    v5[2] = 0;
    id v8 = _Block_copy(v3);
    [a1 _endInteractionWithContext:v5];
  }
}

- (void)_endInteractionWithContext:(const InteractionEndingContext *)a3
{
  unint64_t currentState = self->_currentState;
  if (currentState < 2)
  {
    id v5 = [(_UIClickPresentationInteraction *)self exclusionRelationshipGestureRecognizer];
    [v5 _fail];

    [(_UIRelationshipGestureRecognizer *)self->_gestureRecognizerForBeginningDragRelationships _fail];
    self->_unableToClicuint64_t k = 0;
  }
  else
  {
    handleEvent(stateMachineSpec_3, currentState, 3, (uint64_t)a3, (uint64_t *)&self->_currentState);
  }
}

- (BOOL)_isActive
{
  return self->_currentState != 1;
}

- (void)clickDriver:(id)a3 didPerformEvent:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(_UIClickPresentationInteraction *)self activeDriver];

  if (a4 == 3)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = [(_UIClickPresentationInteraction *)self allDrivers];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * v12) primaryGestureRecognizer];
          unsigned __int8 v14 = -[UIGestureRecognizer _isActive](v13);

          if (v14)
          {
            int v15 = 0;
            goto LABEL_13;
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }
    int v15 = 1;
LABEL_13:
  }
  else
  {
    int v15 = 0;
  }
  if (v7 == v6 || v15)
  {
    switch(a4)
    {
      case 3uLL:
        [(_UIClickPresentationInteraction *)self _driverEnded];
        break;
      case 2uLL:
        [(_UIClickPresentationInteraction *)self _driverClickedUp];
        break;
      case 1uLL:
        [(_UIClickPresentationInteraction *)self _driverClickedDown];
        break;
    }
  }
}

- (_UIClickInteractionDriving)activeDriver
{
  return self->_activeDriver;
}

- (void)_driverEnded
{
  if (self->_activatedFeedbackGeneratorForClick)
  {
    id v3 = [(_UIClickPresentationInteraction *)self feedbackGenerator];
    [v3 userInteractionEnded];

    self->_activatedFeedbackGeneratorForClicuint64_t k = 0;
  }
  if (self->_currentState <= 4)
  {
    -[_UIClickPresentationInteraction _endInteractionDidComplete:completion:](self, 0);
  }
}

- (void)setAllowSimultaneousRecognition:(BOOL)a3
{
  self->_allowSimultaneousRecognition = a3;
}

- (void)dealloc
{
  id v3 = [(_UIClickPresentationInteraction *)self view];
  [v3 removeInteraction:self];

  v4.receiver = self;
  v4.super_class = (Class)_UIClickPresentationInteraction;
  [(_UIClickPresentationInteraction *)&v4 dealloc];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideDrivers, 0);
  objc_storeStrong((id *)&self->_presentationTypeDebugString, 0);
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_associatedDragInteraction);
  objc_storeStrong((id *)&self->_feedbackGenerator, 0);
  objc_storeStrong((id *)&self->_pendingPresentation, 0);
  objc_storeStrong((id *)&self->_presentationAssistant, 0);
  objc_storeStrong((id *)&self->_failureRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_exclusionRelationshipGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_allDrivers, 0);
  objc_storeStrong((id *)&self->_activeDriver, 0);
  objc_storeStrong((id *)&self->_latentAssociatedDragInteraction, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_activeEffectKey, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerForBeginningDragRelationships, 0);
}

- (void)present
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    unint64_t currentState = self->_currentState;
    if (currentState == 4)
    {
LABEL_4:
      [(_UIClickPresentationInteraction *)self _performPreviewPresentation];
      return;
    }
  }
  else
  {
    unint64_t currentState = MEMORY[8];
  }
  if (currentState == 1) {
    goto LABEL_4;
  }
  if (os_variant_has_internal_diagnostics())
  {
    id v6 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      unint64_t v7 = self->_currentState;
      int v8 = 134217984;
      unint64_t v9 = v7;
      _os_log_fault_impl(&dword_1853B0000, v6, OS_LOG_TYPE_FAULT, "Called -present on an active interaction. Current state: %lu.", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    objc_super v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &present___s_category) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = self->_currentState;
      int v8 = 134217984;
      unint64_t v9 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Called -present on an active interaction. Current state: %lu.", (uint8_t *)&v8, 0xCu);
    }
  }
  if (self->_currentState != 5) {
    -[_UIClickPresentationInteraction _endInteractionDidComplete:completion:](self, 0);
  }
}

- (void)beginPanInteraction
{
  if (self->_shouldAllowFeedback)
  {
    id v2 = [(_UIClickPresentationInteraction *)self feedbackGenerator];
    [v2 userInteractionStarted];
  }
}

- (void)endPanInteraction
{
  if (self->_shouldAllowFeedback)
  {
    id v2 = [(_UIClickPresentationInteraction *)self feedbackGenerator];
    [v2 userInteractionEnded];
  }
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  [(_UIClickPresentationInteraction *)self initialLocation];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(_UIClickPresentationInteraction *)self view];
  if (v9)
  {
    uint64_t v10 = (void *)v9;
    uint64_t v11 = [(_UIClickPresentationInteraction *)self activeDriver];
    if (v11)
    {

      if (v6 == 1.79769313e308 && v8 == 1.79769313e308)
      {
        uint64_t v12 = [(_UIClickPresentationInteraction *)self activeDriver];
        id v13 = [(_UIClickPresentationInteraction *)self view];
        [v12 locationInCoordinateSpace:v13];
        -[_UIClickPresentationInteraction setInitialLocation:](self, "setInitialLocation:");

        [(_UIClickPresentationInteraction *)self initialLocation];
        double v6 = v14;
        double v8 = v15;
      }
    }
    else
    {
    }
  }
  *(double *)&uint64_t v16 = 1.79769313e308;
  BOOL v17 = v6 == 1.79769313e308 && v8 == 1.79769313e308;
  *(double *)&uint64_t v18 = 1.79769313e308;
  if (!v17)
  {
    id v19 = [(_UIClickPresentationInteraction *)self view];

    if (v19 == v4)
    {
      *(double *)&uint64_t v16 = v8;
      *(double *)&uint64_t v18 = v6;
    }
    else
    {
      id v20 = [(_UIClickPresentationInteraction *)self view];
      objc_msgSend(v20, "convertPoint:toView:", v4, v6, v8);
      uint64_t v18 = v21;
      uint64_t v16 = v22;
    }
  }

  double v23 = *(double *)&v18;
  double v24 = *(double *)&v16;
  result.y = v24;
  result.x = v23;
  return result;
}

- (unint64_t)inputPrecision
{
  id v2 = [(_UIClickPresentationInteraction *)self activeDriver];
  unint64_t v3 = [v2 inputPrecision];

  return v3;
}

- (UITargetedPreview)primaryEffectPreview
{
  unint64_t v3 = [(_UIClickPresentationInteraction *)self _activeEffect];
  id v4 = [UITargetedPreview alloc];
  double v5 = [(_UIClickPresentationInteraction *)self view];
  double v6 = [(UITargetedPreview *)v4 initWithView:v5];
  double v7 = [v3 previewForContinuingToEffectWithPreview:v6];

  return (UITargetedPreview *)v7;
}

- (NSArray)secondaryEffectPreviews
{
  id v2 = [(_UIClickPresentationInteraction *)self _activeEffect];
  unint64_t v3 = [v2 secondaryBodyPreviews];

  return (NSArray *)v3;
}

- (BOOL)_reachedForceThreshold
{
  id v2 = [(_UIClickPresentationInteraction *)self activeDriver];
  char v3 = [v2 isCurrentlyAcceleratedByForce];

  return v3;
}

- (BOOL)_delegate_shouldAllowDragAfterDismiss
{
  if (!self->_delegateImplements.shouldAllowDragAfterDismiss) {
    return 0;
  }
  id v2 = self;
  char v3 = [(_UIClickPresentationInteraction *)self delegate];
  LOBYTE(v2) = [v3 _clickPresentationInteractionShouldAllowDragAfterDismiss:v2];

  return (char)v2;
}

- (void)_delegate_interactionEndedWithContext:(const InteractionEndingContext *)a3
{
  BOOL endedForPresentation = self->_delegateImplements.endedForPresentation;
  double v6 = [(_UIClickPresentationInteraction *)self delegate];
  id v7 = v6;
  if (endedForPresentation) {
    [v6 _clickPresentationInteractionEnded:self forPresentation:a3->var3 reason:a3->var2];
  }
  else {
    [v6 clickPresentationInteractionEnded:self wasCancelled:!a3->var1];
  }
}

- (void)_performPreviewPresentation
{
  if (!self->_activeEffectKey) {
    [(_UIClickPresentationInteraction *)self _prepareInteractionEffect];
  }
  char v3 = self;
  handleEvent(stateMachineSpec_3, self->_currentState, 2, (uint64_t)&v3, (uint64_t *)&self->_currentState);
}

- (BOOL)_canPerformPresentation
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  char v3 = [(_UIClickPresentationInteraction *)self view];
  id v4 = [v3 _window];

  if (!v4)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v12 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        goto LABEL_12;
      }
      id v13 = [(_UIClickPresentationInteraction *)self view];
      int v30 = 138412290;
      v31 = v13;
      _os_log_fault_impl(&dword_1853B0000, v12, OS_LOG_TYPE_FAULT, "Attempting to present while the interaction's view (%@) is not in a window. Removing the interaction's view (or an ancestor) from the view hierarchy while the interaction is active is not recommended!", (uint8_t *)&v30, 0xCu);
    }
    else
    {
      uint64_t v11 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1189) + 8);
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      uint64_t v12 = v11;
      id v13 = [(_UIClickPresentationInteraction *)self view];
      int v30 = 138412290;
      v31 = v13;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "Attempting to present while the interaction's view (%@) is not in a window. Removing the interaction's view (or an ancestor) from the view hierarchy while the interaction is active is not recommended!", (uint8_t *)&v30, 0xCu);
    }

LABEL_12:
    return 0;
  }
  double v5 = [(_UIClickPresentationInteraction *)self presentationAssistant];

  if (!v5)
  {
    double v6 = [(_UIClickPresentationInteraction *)self view];
    id v7 = [v6 _viewControllerForAncestor];

    if (v7)
    {
LABEL_4:
      double v8 = [v7 presentedViewController];
      uint64_t v9 = v8;
      if (!v8 || ([v8 isBeingDismissed] & 1) != 0)
      {
        if (!v7)
        {
LABEL_7:
          BOOL v10 = 0;
LABEL_16:

          return v10;
        }
LABEL_15:
        uint64_t v16 = [(_UIClickPresentationInteraction *)self delegate];
        BOOL v17 = [v16 clickPresentationInteraction:self presentationForPresentingViewController:v7];
        [(_UIClickPresentationInteraction *)self setPendingPresentation:v17];

        uint64_t v18 = [(_UIClickPresentationInteraction *)self pendingPresentation];
        BOOL v10 = v18 != 0;

        goto LABEL_16;
      }
      double v14 = [(_UIClickPresentationInteraction *)self view];
      uint64_t v15 = +[UIViewController _viewControllerForFullScreenPresentationFromView:v14];

      id v7 = (void *)v15;
      if (v15) {
        goto LABEL_15;
      }
      if (os_variant_has_internal_diagnostics())
      {
        v26 = __UIFaultDebugAssertLog();
        if (!os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
          goto LABEL_29;
        }
        v27 = [(_UIClickPresentationInteraction *)self view];
        uint64_t v28 = [(_UIClickPresentationInteraction *)self view];
        uint64_t v29 = [v28 window];
        int v30 = 138412546;
        v31 = v27;
        __int16 v32 = 2112;
        v33 = v29;
        _os_log_fault_impl(&dword_1853B0000, v26, OS_LOG_TYPE_FAULT, "Failed to find a presenting view controller for view (%@) in window (%@). The interaction's view (or an ancestor) must have an associated view controller inside the window's root view controller hierarchy.", (uint8_t *)&v30, 0x16u);
      }
      else
      {
        v25 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2622E8) + 8);
        if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
          goto LABEL_7;
        }
        v26 = v25;
        v27 = [(_UIClickPresentationInteraction *)self view];
        uint64_t v28 = [(_UIClickPresentationInteraction *)self view];
        uint64_t v29 = [v28 window];
        int v30 = 138412546;
        v31 = v27;
        __int16 v32 = 2112;
        v33 = v29;
        _os_log_impl(&dword_1853B0000, v26, OS_LOG_TYPE_ERROR, "Failed to find a presenting view controller for view (%@) in window (%@). The interaction's view (or an ancestor) must have an associated view controller inside the window's root view controller hierarchy.", (uint8_t *)&v30, 0x16u);
      }

LABEL_29:
      goto LABEL_7;
    }
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v21 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        goto LABEL_24;
      }
      uint64_t v22 = [(_UIClickPresentationInteraction *)self view];
      double v23 = [(_UIClickPresentationInteraction *)self view];
      double v24 = [v23 window];
      int v30 = 138412546;
      v31 = v22;
      __int16 v32 = 2112;
      v33 = v24;
      _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "Failed to find a presenting view controller for view (%@) in window (%@). The interaction's view (or an ancestor) must have an associated view controller for presentation to work.", (uint8_t *)&v30, 0x16u);
    }
    else
    {
      id v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB2622E0) + 8);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_4;
      }
      uint64_t v21 = v20;
      uint64_t v22 = [(_UIClickPresentationInteraction *)self view];
      double v23 = [(_UIClickPresentationInteraction *)self view];
      double v24 = [v23 window];
      int v30 = 138412546;
      v31 = v22;
      __int16 v32 = 2112;
      v33 = v24;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_ERROR, "Failed to find a presenting view controller for view (%@) in window (%@). The interaction's view (or an ancestor) must have an associated view controller for presentation to work.", (uint8_t *)&v30, 0x16u);
    }

LABEL_24:
    goto LABEL_4;
  }
  return 0;
}

- (unint64_t)activatedDriverStyle
{
  uint64_t v3 = [(_UIClickPresentationInteraction *)self activeDriver];
  if (v3
    && (id v4 = (void *)v3,
        [(_UIClickPresentationInteraction *)self activeDriver],
        double v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = objc_opt_respondsToSelector(),
        v5,
        v4,
        (v6 & 1) != 0))
  {
    id v7 = [(_UIClickPresentationInteraction *)self activeDriver];
    unint64_t v8 = [v7 driverStyle];

    return v8;
  }
  else
  {
    BOOL v10 = [(_UIClickPresentationInteraction *)self activeDriver];

    if (v10)
    {
      return 0;
    }
    else
    {
      return [(_UIClickPresentationInteraction *)self fallbackDriverStyle];
    }
  }
}

- (void)_performPresentation
{
  uint64_t v3 = [(_UIClickPresentationInteraction *)self pendingPresentation];
  if (v3)
  {
    id v4 = [(_UIClickPresentationInteraction *)self _clickDriverTouch];

    if (v4)
    {
      double v5 = [(_UIClickPresentationInteraction *)self activeDriver];
      int v6 = [v5 isCurrentlyAcceleratedByForce];

      int64_t v7 = 1;
      if (v6) {
        int64_t v7 = 2;
      }
    }
    else
    {
      int64_t v7 = 3;
    }
    self->_statsPresentation = v7;
    objc_initWeak(location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke;
    aBlock[3] = &unk_1E52DC888;
    objc_copyWeak(&v31, location);
    unint64_t v8 = _Block_copy(aBlock);
    uint64_t v9 = (objc_class *)objc_opt_class();
    if ([(_UIClickPresentationInteraction *)self _supportsRapidRestart]) {
      uint64_t v9 = (objc_class *)objc_opt_class();
    }
    BOOL v10 = (void *)[[v9 alloc] initWithClickPresentation:v3];
    [(_UIClickPresentationInteraction *)self setPresentationAssistant:v10];

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke_26;
    v28[3] = &unk_1E5300838;
    objc_copyWeak(&v29, location);
    uint64_t v11 = [(_UIClickPresentationInteraction *)self presentationAssistant];
    [v11 setKeyboardAssertionInvalidationHandler:v28];

    uint64_t v12 = [(_UIClickPresentationInteraction *)self primaryEffectPreview];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __55___UIClickPresentationInteraction__performPresentation__block_invoke_2;
    v25[3] = &unk_1E52E3298;
    v25[4] = self;
    id v13 = v12;
    id v26 = v13;
    id v14 = v8;
    id v27 = v14;
    uint64_t v15 = (void (**)(void))_Block_copy(v25);
    uint64_t v16 = [v3 viewController];
    BOOL v17 = [v16 transitionCoordinator];

    if (v17) {
      goto LABEL_11;
    }
    uint64_t v18 = [v3 presentationController];
    id v19 = [v18 presentingViewController];
    BOOL v17 = [v19 transitionCoordinator];

    if (v17)
    {
LABEL_11:
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      uint64_t v22 = __55___UIClickPresentationInteraction__performPresentation__block_invoke_5;
      double v23 = &unk_1E52DA110;
      double v24 = v15;
      [v17 animateAlongsideTransition:0 completion:&v20];
    }
    else
    {
      v15[2](v15);
    }

    objc_destroyWeak(&v29);
    objc_destroyWeak(&v31);
    objc_destroyWeak(location);
  }
  -[_UIClickPresentationInteraction setPendingPresentation:](self, "setPendingPresentation:", 0, v20, v21, v22, v23);
}

- (void)clickDriver:(id)a3 shouldBegin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke;
  aBlock[3] = &unk_1E52E3298;
  void aBlock[4] = self;
  id v8 = v6;
  id v19 = v8;
  id v9 = v7;
  id v20 = v9;
  BOOL v10 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v11 = [(_UIClickPresentationInteraction *)self view];
  uint64_t v12 = [v11 window];
  id v13 = [v12 rootViewController];
  id v14 = [v13 presentedViewController];
  uint64_t v15 = [v14 transitionCoordinator];

  if ([(_UIClickPresentationInteraction *)self _supportsRapidRestart] || !v15)
  {
    v10[2](v10);
  }
  else
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __59___UIClickPresentationInteraction_clickDriver_shouldBegin___block_invoke_3;
    v16[3] = &unk_1E52DA110;
    BOOL v17 = v10;
    [v15 animateAlongsideTransition:0 completion:v16];
  }
}

- (void)clickDriver:(id)a3 didUpdateHighlightProgress:(double)a4
{
  id v6 = a3;
  if (!self->_unableToClick)
  {
    id v8 = v6;
    if ([(_UIClickPresentationInteraction *)self _isActive] && !self->_activeEffectKey) {
      [(_UIClickPresentationInteraction *)self _prepareInteractionEffect];
    }
    id v7 = [(_UIClickPresentationInteraction *)self _activeEffect];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v8 maximumEffectProgress];
      objc_msgSend(v7, "setMaxProgress:");
    }
    [v7 updateWithProgress:a4];

    id v6 = v8;
  }
}

- (void)_driverClickedDown
{
  id v2 = self;
  handleEvent(stateMachineSpec_3, self->_currentState, 1, (uint64_t)&v2, (uint64_t *)&self->_currentState);
}

- (void)_driverClickedUp
{
  id v2 = self;
  handleEvent(stateMachineSpec_3, self->_currentState, 2, (uint64_t)&v2, (uint64_t *)&self->_currentState);
}

+ (void)_setDefaultDriverClasses:(id)a3 forIdiom:(int64_t)a4
{
  id v9 = a3;
  double v5 = (void *)_driverClassesByIdiom;
  if (!_driverClassesByIdiom)
  {
    uint64_t v6 = objc_opt_new();
    id v7 = (void *)_driverClassesByIdiom;
    _driverClassesByIdiom = v6;

    double v5 = (void *)_driverClassesByIdiom;
  }
  id v8 = [NSNumber numberWithInteger:a4];
  [v5 setObject:v9 forKeyedSubscript:v8];
}

- (void)setActiveDriver:(id)a3
{
  p_activeDriver = &self->_activeDriver;
  BOOL v10 = (_UIClickInteractionDriving *)a3;
  if (*p_activeDriver != v10)
  {
    objc_storeStrong((id *)&self->_activeDriver, a3);
    if (*p_activeDriver)
    {
      uint64_t v6 = [(id)objc_opt_class() prefersCancelsTouchesInView];
      id v7 = [(_UIClickPresentationInteraction *)self exclusionRelationshipGestureRecognizer];
      [v7 setCancelsTouchesInView:v6];

      id v8 = [(_UIClickPresentationInteraction *)self failureRelationshipGestureRecognizer];
      [v8 setCancelsTouchesInView:v6];

      [(_UIClickInteractionDriving *)self->_activeDriver setCancelsTouchesInView:0];
      if ([(_UIClickPresentationInteraction *)self _delegate_shouldAllowDragAfterDismiss])
      {
        id v9 = [(_UIClickInteractionDriving *)*p_activeDriver primaryGestureRecognizer];
        [v9 _setKeepTouchesOnContinuation:1];
      }
    }
  }
}

- (void)_cancelAllDrivers
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = [(_UIClickPresentationInteraction *)self allDrivers];
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
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) cancelInteraction];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)_candidateInteractionsForAssociation
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v4 = [(_UIClickPresentationInteraction *)self _clickDriverTouch];
  if (v4)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = v4;
    obuint64_t j = [v4 gestureRecognizers];
    uint64_t v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(obj);
          }
          long long v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v9 = [v8 view];
          long long v10 = [v9 interactions];

          uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v12; ++j)
              {
                if (*(void *)v21 != v13) {
                  objc_enumerationMutation(v10);
                }
                uint64_t v15 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                if ((objc_opt_respondsToSelector() & 1) != 0 && [v15 _supportsAssociation]) {
                  [v3 addObject:v15];
                }
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v12);
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v6);
    }

    uint64_t v4 = v17;
  }

  return v3;
}

- (void)_associateWithActiveDragInteraction
{
  id v2 = self;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_UIClickPresentationInteraction *)self _clickDriverTouch];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v4 = [v3 gestureRecognizers];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v18 = v2;
    uint64_t v19 = v3;
    uint64_t v7 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        long long v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (_isDragInteractionGestureRecognizer(v9))
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v10 = [v9 view];
          uint64_t v11 = [v10 interactions];

          uint64_t v12 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v21;
LABEL_9:
            uint64_t v15 = 0;
            while (1)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v11);
              }
              uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * v15);
              objc_opt_class();
              if (objc_opt_isKindOfClass()) {
                break;
              }
              if (v13 == ++v15)
              {
                uint64_t v13 = [v11 countByEnumeratingWithState:&v20 objects:v28 count:16];
                if (v13) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
            id v17 = v16;

            if (v17) {
              goto LABEL_20;
            }
          }
          else
          {
LABEL_15:
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v6);
    id v17 = 0;
LABEL_20:
    id v2 = v18;
    uint64_t v3 = v19;
  }
  else
  {
    id v17 = 0;
  }

  [(_UIClickPresentationInteraction *)v2 setAssociatedDragInteraction:v17];
}

- (id)_clickDragDriver
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(_UIClickPresentationInteraction *)self associatedDragInteraction];
  uint64_t v3 = [v2 _initiationDrivers];

  id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)_attemptDragLiftAtLocation:(CGPoint)a3 useDefaultLiftAnimation:(BOOL)a4
{
  BOOL v4 = a4;
  double y = a3.y;
  double x = a3.x;
  long long v8 = [(_UIClickPresentationInteraction *)self _clickDragDriver];
  if (objc_msgSend(v8, "canBeginLiftAtLocation:", x, y))
  {
    if (self->_unableToClick)
    {
      [v8 liftDelay];
      double v10 = v9;
      long long v11 = [(_UIClickPresentationInteraction *)self activeDriver];
      [v11 touchDuration];
      double v13 = v10 - v12;
    }
    else
    {
      double v13 = 0.0;
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __86___UIClickPresentationInteraction__attemptDragLiftAtLocation_useDefaultLiftAnimation___block_invoke;
    v14[3] = &unk_1E52DA660;
    id v15 = v8;
    uint64_t v16 = self;
    objc_msgSend(v15, "beginLiftAtLocation:useDefaultLiftAnimation:delay:completion:", v4, v14, x, y, v13);
  }
}

- (BOOL)beginDragIfPossibleWithTouch:(id)a3
{
  id v4 = a3;
  [(_UIRelationshipGestureRecognizer *)self->_gestureRecognizerForBeginningDragRelationships _fail];
  if (v4
    || ([(_UIClickPresentationInteraction *)self _clickDriverTouch],
        (id v4 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v5 = [(_UIClickPresentationInteraction *)self _clickDragDriver];
    if (([v5 isLifted] & 1) == 0)
    {
      [(_UIClickPresentationInteraction *)self locationInView:0];
      -[_UIClickPresentationInteraction _attemptDragLiftAtLocation:useDefaultLiftAnimation:](self, "_attemptDragLiftAtLocation:useDefaultLiftAnimation:", 0);
    }
    int v6 = [v5 isLifted];
    if (v6)
    {
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3032000000;
      v16[3] = __Block_byref_object_copy__159;
      void v16[4] = __Block_byref_object_dispose__159;
      id v17 = [MEMORY[0x1E4F1CA48] array];
      objc_initWeak(&location, self);
      uint64_t v7 = [MEMORY[0x1E4F1CAD0] setWithObject:v4];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke;
      v13[3] = &unk_1E5300888;
      objc_copyWeak(&v14, &location);
      v13[4] = v16;
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __64___UIClickPresentationInteraction_beginDragIfPossibleWithTouch___block_invoke_2;
      v12[3] = &unk_1E53008B0;
      v12[4] = self;
      v12[5] = v16;
      [v5 beginDragWithTouches:v7 itemIterator:v13 beginningSessionHandler:v12];

      if (self->_shouldAllowFeedback)
      {
        long long v8 = [(_UIClickPresentationInteraction *)self feedbackGenerator];
        [(_UIClickPresentationInteraction *)self locationInView:0];
        objc_msgSend(v8, "draggedAtLocation:");
      }
      if (self->_unableToClick)
      {
        double v9 = [(_UIClickPresentationInteraction *)self exclusionRelationshipGestureRecognizer];
        [v9 _succeed];

        double v10 = [(_UIClickPresentationInteraction *)self failureRelationshipGestureRecognizer];
        [v10 _succeed];
      }
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
      _Block_object_dispose(v16, 8);
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)_endInteractionEffectIfNeeded
{
  if (a1)
  {
    id v2 = [a1 _activeEffect];
    [v2 end];

    uint64_t v3 = (void *)a1[8];
    a1[8] = 0;
  }
}

- (UIGestureRecognizer)gestureRecognizerForBeginningDragRelationships
{
  if (!self->_gestureRecognizerForBeginningDragRelationships)
  {
    uint64_t v3 = (_UIRelationshipGestureRecognizer *)objc_opt_new();
    gestureRecognizerForBeginningDragRelationships = self->_gestureRecognizerForBeginningDragRelationships;
    self->_gestureRecognizerForBeginningDragRelationships = v3;

    [(UIGestureRecognizer *)self->_gestureRecognizerForBeginningDragRelationships setName:@"com.apple.UIKit.UICPI-beginning-drag-failure-relationship"];
    [(UIGestureRecognizer *)self->_gestureRecognizerForBeginningDragRelationships setDelegate:self];
    [(UIGestureRecognizer *)self->_gestureRecognizerForBeginningDragRelationships _setKeepTouchesOnContinuation:1];
    [(_UIRelationshipGestureRecognizer *)self->_gestureRecognizerForBeginningDragRelationships setSucceedsOnTouchesEnded:1];
    [(UIGestureRecognizer *)self->_gestureRecognizerForBeginningDragRelationships setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)self->_gestureRecognizerForBeginningDragRelationships setDelaysTouchesEnded:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained addGestureRecognizer:self->_gestureRecognizerForBeginningDragRelationships];

  int v6 = self->_gestureRecognizerForBeginningDragRelationships;
  return (UIGestureRecognizer *)v6;
}

- (void)_prepareInteractionEffect
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_UIClickPresentationInteraction *)self view];
  [(_UIClickPresentationInteraction *)self locationInView:v3];
  double v5 = v4;
  double v7 = v6;

  if (!self->_delegateImplements.previewForHighlightingAtLocation
    || ([(_UIClickPresentationInteraction *)self delegate],
        long long v8 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "clickPresentationInteraction:previewForHighlightingAtLocation:", self, v5, v7),
        double v9 = (UITargetedPreview *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
    double v10 = [UITargetedPreview alloc];
    long long v11 = [(_UIClickPresentationInteraction *)self view];
    double v9 = [(UITargetedPreview *)v10 initWithView:v11];
  }
  if ([(_UIClickPresentationInteraction *)self activatedDriverStyle] == 1)
  {
    double v12 = 0;
  }
  else
  {
    [(_UIClickPresentationInteraction *)self _candidateInteractionsForAssociation];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v50 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v47;
LABEL_8:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v46 + 1) + 8 * v16);
        if (objc_opt_respondsToSelector())
        {
          double v12 = [v17 _targetedPreviewForContinuingEffectWithPreview:v9];
          if (v12) {
            break;
          }
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v13 countByEnumeratingWithState:&v46 objects:v50 count:16];
          if (v14) {
            goto LABEL_8;
          }
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      double v12 = 0;
    }
  }
  uint64_t v18 = objc_opt_new();
  uint64_t v19 = [(_UIClickPresentationInteraction *)self view];
  [v18 setView:v19];

  objc_msgSend(v18, "setPoint:", v5, v7);
  long long v20 = objc_opt_new();
  [v20 setPrimaryPreview:v9];
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x3032000000;
  long long v43 = __Block_byref_object_copy__159;
  long long v44 = __Block_byref_object_dispose__159;
  id v45 = 0;
  if (self->_delegateImplements.interactionEffectForTargetedPreview)
  {
    long long v21 = [(_UIClickPresentationInteraction *)self delegate];
    uint64_t v22 = [v21 _clickPresentationInteraction:self interactionEffectForTargetedPreview:v9];
    long long v23 = (void *)v41[5];
    v41[5] = v22;

    if (v41[5]) {
      goto LABEL_21;
    }
  }
  if (!self->_delegateImplements.secondaryPreviews)
  {
LABEL_21:
    uint64_t v30 = +[_UIContentEffectManager sharedManager];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __60___UIClickPresentationInteraction__prepareInteractionEffect__block_invoke_2;
    v31[3] = &unk_1E5300C30;
    long long v36 = &v40;
    __int16 v32 = v9;
    id v33 = v12;
    id v34 = v20;
    id v35 = v18;
    long long v27 = [v30 compatibleEffectForKey:v35 descriptor:v34 constructor:v31];

    uint64_t v28 = (id *)&v32;
    id v29 = &v33;
    long long v26 = v34;
  }
  else
  {
    long long v24 = [(_UIClickPresentationInteraction *)self delegate];
    long long v25 = [v24 _secondaryPreviewsForClickPresentationInteraction:self];
    [v20 setSecondaryPreviews:v25];

    long long v26 = +[_UIContentEffectManager sharedManager];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __60___UIClickPresentationInteraction__prepareInteractionEffect__block_invoke;
    v37[3] = &unk_1E5300C08;
    id v38 = v20;
    id v39 = v12;
    long long v27 = [v26 compatibleEffectForKey:v18 descriptor:v38 constructor:v37];
    uint64_t v28 = &v38;
    id v29 = &v39;
  }

  if (v27)
  {
    objc_storeStrong((id *)&self->_activeEffectKey, v18);
    [v27 begin];
  }

  _Block_object_dispose(&v40, 8);
}

- (id)_clickDriverTouch
{
  id v2 = [(_UIClickPresentationInteraction *)self activeDriver];
  uint64_t v3 = [v2 primaryGestureRecognizer];
  double v4 = [v3 _allActiveTouches];
  double v5 = [v4 anyObject];

  return v5;
}

- (id)_activeEffect
{
  uint64_t v3 = +[_UIContentEffectManager sharedManager];
  double v4 = [v3 objectForKeyedSubscript:self->_activeEffectKey];

  return v4;
}

- (NSString)presentationTypeDebugString
{
  presentationTypeDebugString = self->_presentationTypeDebugString;
  if (presentationTypeDebugString)
  {
    uint64_t v3 = presentationTypeDebugString;
  }
  else
  {
    double v4 = NSString;
    double v5 = [(_UIClickPresentationInteraction *)self delegate];
    uint64_t v3 = [v4 stringWithFormat:@"(delegate: %@)", objc_opt_class()];
  }
  return v3;
}

- (id)_dragInteractionPresentation:(id)a3 previewForCancellingItem:(id)a4 defaultPreview:(id)a5 proposedPreview:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  double v10 = [(_UIClickPresentationInteraction *)self delegate];
  long long v11 = v10;
  if (v9 && self->_delegateImplements.previewForCancellingDragItem)
  {
    double v12 = [v10 _clickPresentationInteraction:self previewForCancellingDragItem:v8];
    id v13 = [v9 target];
    uint64_t v14 = [v12 retargetedPreviewWithTarget:v13];

    [v14 _setPreviewMode:3];
    [v14 _setDefaultPreview:1];
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = v9;
  }
  id v16 = v15;

  return v16;
}

- (void)_dragInteractionPresentation:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  id v10 = a4;
  id v7 = a5;
  id v8 = [(_UIClickPresentationInteraction *)self delegate];
  id v9 = v8;
  if (self->_delegateImplements.willAnimateDragCancelWithAnimator) {
    [v8 _clickPresentationInteraction:self item:v10 willAnimateDragCancelWithAnimator:v7];
  }
}

- (void)_dragInteractionPresentation:(id)a3 sessionDidEnd:(id)a4 withoutBeginning:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __95___UIClickPresentationInteraction__dragInteractionPresentation_sessionDidEnd_withoutBeginning___block_invoke;
  v11[3] = &unk_1E52D9F98;
  v11[4] = self;
  id v12 = v7;
  id v8 = v7;
  id v9 = (void (**)(void))_Block_copy(v11);
  id v10 = v9;
  if (v5)
  {
    -[_UIClickPresentationInteraction _endInteractionDidComplete:completion:](self, v9);
    -[_UIClickPresentationInteraction _endInteractionEffectIfNeeded](self);
  }
  else
  {
    v9[2](v9);
  }
}

- (UIDragInteraction)latentAssociatedDragInteraction
{
  return self->_latentAssociatedDragInteraction;
}

- (void)setLatentAssociatedDragInteraction:(id)a3
{
}

- (_UIClickPresentationAssisting)presentationAssistant
{
  return self->_presentationAssistant;
}

- (void)setPresentationAssistant:(id)a3
{
}

- (_UIClickPresentation)pendingPresentation
{
  return self->_pendingPresentation;
}

- (void)setPendingPresentation:(id)a3
{
}

- (CAPoint3D)initialLocation
{
  double x = self->_initialLocation.x;
  double y = self->_initialLocation.y;
  double z = self->_initialLocation.z;
  result.double z = z;
  result.double y = y;
  result.double x = x;
  return result;
}

- (_UIClickPresentationFeedbackGenerator)feedbackGenerator
{
  return self->_feedbackGenerator;
}

- (UIDragInteraction)associatedDragInteraction
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_associatedDragInteraction);
  return (UIDragInteraction *)WeakRetained;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (unint64_t)fallbackDriverStyle
{
  return self->_fallbackDriverStyle;
}

@end