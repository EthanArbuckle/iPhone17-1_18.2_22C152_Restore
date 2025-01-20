@interface _UIDragInteractionLongPressDriver
- (BOOL)_wantsTimeDelayedFailureRequirementGate;
- (BOOL)canExcludeCompetingGestureRecognizer:(id)a3;
- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasExceededAllowableMovement;
- (BOOL)hasMoveHysteresisBeenReached;
- (BOOL)isGestureRecognizerForDragInitiation:(id)a3;
- (BOOL)shouldDelayCompetingGestureRecognizer:(id)a3;
- (_UIDragInteractionLongPressDriver)init;
- (_UIDragInteractionLongPressDriver)initWithBehavior:(unint64_t)a3;
- (_UIRelationshipGestureRecognizer)gestureRecognizerForExclusionRelationship;
- (_UIRelationshipGestureRecognizer)gestureRecognizerForFailureRelationship;
- (double)translationInWindow;
- (id)gestureRecognizerForDragInitiation;
- (unint64_t)behavior;
- (void)_dragInitiationGestureStateChanged:(id)a3;
- (void)_gateCompetingGestureRecognizers;
- (void)_gestureRecognizerFailed:(id)a3;
- (void)_updateLiftMoveHysteresisInDragInitiationGesture;
- (void)attachToView:(id)a3;
- (void)detachFromView:(id)a3;
- (void)didTransitionToBeginState;
- (void)didTransitionToCancelState;
- (void)didTransitionToDeferred;
- (void)didTransitionToInactiveState;
- (void)didTransitionToInflightState;
- (void)didTransitionToPreparing;
- (void)dragInitiationGestureStateChanged:(id)a3;
- (void)invalidateCancellationTimer;
- (void)invalidateCompetingGestureRecognizerGateTimer;
- (void)openCompetingGestureRecognizerGateCancelingGestures:(id)a3;
- (void)openGateCancelingAddItemsGestures;
- (void)reset;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setAutomaticallyAddsFailureRelationships:(BOOL)a3;
- (void)setLiftDelay:(double)a3;
- (void)setLiftMoveHysteresis:(double)a3;
@end

@implementation _UIDragInteractionLongPressDriver

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v6 = a4;
  if (self->_gestureRecognizerForDragInitiation == a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v7 = 1;
    }
    else
    {
      v8 = [(_UIDragInteractionDriver *)self delegate];
      char v7 = [v8 dragDriver:self competingGestureRecognizerShouldDelayLift:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6 = (_UIRelationshipGestureRecognizer *)a3;
  id v7 = a4;
  BOOL v8 = self->_gestureRecognizerForExclusionRelationship != v6
    && self->_gestureRecognizerForFailureRelationship == v6
    && [(_UIDragInteractionLongPressDriver *)self shouldDelayCompetingGestureRecognizer:v7];

  return v8;
}

- (BOOL)shouldDelayCompetingGestureRecognizer:(id)a3
{
  id v4 = a3;
  if (qword_1EB25D268 != -1) {
    dispatch_once(&qword_1EB25D268, &__block_literal_global_673);
  }
  id v5 = (id)qword_1EB25D260;
  char v6 = [v5 containsObject:objc_opt_class()];

  if ((v6 & 1) != 0 || ![v4 _isGestureType:1])
  {
    char v8 = 0;
  }
  else
  {
    id v7 = [(_UIDragInteractionDriver *)self delegate];
    char v8 = [v7 dragDriver:self shouldDelayCompetingGestureRecognizer:v4];
  }
  return v8;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  char v6 = (_UIRelationshipGestureRecognizer *)a3;
  id v7 = a4;
  if (self->_gestureRecognizerForFailureRelationship == v6)
  {
    char v8 = 1;
    goto LABEL_9;
  }
  if ((_UIRelationshipGestureRecognizer *)self->_gestureRecognizerForDragInitiation == v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
LABEL_8:
    char v8 = isKindOfClass ^ 1;
    goto LABEL_9;
  }
  if (self->_gestureRecognizerForExclusionRelationship == v6)
  {
    char isKindOfClass = [(_UIDragInteractionLongPressDriver *)self canExcludeCompetingGestureRecognizer:v7];
    goto LABEL_8;
  }
  char v8 = 0;
LABEL_9:

  return v8 & 1;
}

- (_UIDragInteractionLongPressDriver)initWithBehavior:(unint64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)_UIDragInteractionLongPressDriver;
  id v4 = [(_UIDragInteractionDriver *)&v19 init];
  id v5 = v4;
  if (v4)
  {
    v4->_unint64_t behavior = a3;
    [(_UIDragInteractionDriver *)v4 setShouldAnimateLift:1];
    [(_UIDragInteractionDriver *)v5 setCompetingLongPressDelay:_UIDragInteractionDefaultCompetingLongPressDelay()];
    [(_UIDragInteractionDriver *)v5 setCancellationDelay:_UIDragInteractionDefaultCancellationDelay()];
    if (v5->_behavior - 1 > 1)
    {
      [(_UIDragInteractionLongPressDriver *)v5 setLiftMoveHysteresis:_UIDragInteractionDefaultLiftMoveHysteresis()];
      double v6 = _UIDragInteractionDefaultLiftDelay();
    }
    else
    {
      [(_UIDragInteractionLongPressDriver *)v5 setLiftMoveHysteresis:_UIDragInteractionDefaultPointerLiftMoveHysteresis()];
      double v6 = _UIDragInteractionDefaultPointerLiftDelay();
    }
    [(_UIDragInteractionLongPressDriver *)v5 setLiftDelay:v6];
    id v7 = (objc_class *)objc_opt_class();
    unint64_t behavior = v5->_behavior;
    if (behavior == 1 || behavior == 2) {
      id v7 = (objc_class *)objc_opt_class();
    }
    v9 = (_UIDragLiftGestureRecognizer *)[[v7 alloc] initWithTarget:v5 action:sel_dragInitiationGestureStateChanged_];
    v10 = _UIDragGestureResolvedName(@"dragInitiation");
    [(UIGestureRecognizer *)v9 setName:v10];

    [(UIGestureRecognizer *)v9 setDelegate:v5];
    [(_UIDragInteractionDriver *)v5 liftDelay];
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v9, "setMinimumPressDuration:");
    [(UIGestureRecognizer *)v9 setCancelsTouchesInView:0];
    [(UILongPressGestureRecognizer *)v9 setNumberOfTouchesRequired:1];
    gestureRecognizerForDragInitiation = v5->_gestureRecognizerForDragInitiation;
    v5->_gestureRecognizerForDragInitiation = v9;

    [(_UIDragInteractionLongPressDriver *)v5 _updateLiftMoveHysteresisInDragInitiationGesture];
    v12 = (_UIRelationshipGestureRecognizer *)objc_opt_new();
    v13 = _UIDragGestureResolvedName(@"dragFailureRelationships");
    [(UIGestureRecognizer *)v12 setName:v13];

    [(UIGestureRecognizer *)v12 setDelegate:v5];
    gestureRecognizerForFailureRelationship = v5->_gestureRecognizerForFailureRelationship;
    v5->_gestureRecognizerForFailureRelationship = v12;

    v15 = (_UIRelationshipGestureRecognizer *)objc_opt_new();
    v16 = _UIDragGestureResolvedName(@"dragExclusionRelationships");
    [(UIGestureRecognizer *)v15 setName:v16];

    [(UIGestureRecognizer *)v15 setDelegate:v5];
    gestureRecognizerForExclusionRelationship = v5->_gestureRecognizerForExclusionRelationship;
    v5->_gestureRecognizerForExclusionRelationship = v15;
  }
  return v5;
}

- (void)setLiftMoveHysteresis:(double)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDragInteractionLongPressDriver;
  [(_UIDragInteractionDriver *)&v4 setLiftMoveHysteresis:a3];
  [(_UIDragInteractionLongPressDriver *)self _updateLiftMoveHysteresisInDragInitiationGesture];
}

- (void)_updateLiftMoveHysteresisInDragInitiationGesture
{
  unint64_t behavior = self->_behavior;
  [(_UIDragInteractionDriver *)self liftMoveHysteresis];
  gestureRecognizerForDragInitiation = self->_gestureRecognizerForDragInitiation;
  if (behavior == 1)
  {
    -[_UIDragLiftGestureRecognizer setLiftMoveHysteresis:](gestureRecognizerForDragInitiation, "setLiftMoveHysteresis:");
    [(UILongPressGestureRecognizer *)self->_gestureRecognizerForDragInitiation setAllowableMovement:1.79769313e308];
    id v5 = self->_gestureRecognizerForDragInitiation;
    [(UIGestureRecognizer *)v5 setDelaysTouchesEnded:0];
  }
  else
  {
    -[UILongPressGestureRecognizer setAllowableMovement:](gestureRecognizerForDragInitiation, "setAllowableMovement:");
  }
}

- (void)setLiftDelay:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDragInteractionLongPressDriver;
  -[_UIDragInteractionDriver setLiftDelay:](&v5, sel_setLiftDelay_);
  [(UILongPressGestureRecognizer *)self->_gestureRecognizerForDragInitiation setMinimumPressDuration:a3];
}

- (void)setAutomaticallyAddsFailureRelationships:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(_UIDragInteractionDriver *)self automaticallyAddsFailureRelationships] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)_UIDragInteractionLongPressDriver;
    [(_UIDragInteractionDriver *)&v8 setAutomaticallyAddsFailureRelationships:v3];
    objc_super v5 = [(_UIDragInteractionDriver *)self view];
    if (v5)
    {
      BOOL v6 = [(_UIDragInteractionDriver *)self automaticallyAddsFailureRelationships];
      gestureRecognizerForFailureRelationship = self->_gestureRecognizerForFailureRelationship;
      if (v6) {
        [v5 addGestureRecognizer:gestureRecognizerForFailureRelationship];
      }
      else {
        [v5 removeGestureRecognizer:gestureRecognizerForFailureRelationship];
      }
    }
  }
}

- (unint64_t)behavior
{
  return self->_behavior;
}

- (void)attachToView:(id)a3
{
  gestureRecognizerForDragInitiation = self->_gestureRecognizerForDragInitiation;
  id v5 = a3;
  [v5 addGestureRecognizer:gestureRecognizerForDragInitiation];
  [v5 addGestureRecognizer:self->_gestureRecognizerForExclusionRelationship];
  [v5 addGestureRecognizer:self->_gestureRecognizerForFailureRelationship];
}

- (void)detachFromView:(id)a3
{
  gestureRecognizerForDragInitiation = self->_gestureRecognizerForDragInitiation;
  id v5 = a3;
  [v5 removeGestureRecognizer:gestureRecognizerForDragInitiation];
  [v5 removeGestureRecognizer:self->_gestureRecognizerForExclusionRelationship];
  [v5 removeGestureRecognizer:self->_gestureRecognizerForFailureRelationship];
}

- (void)_gestureRecognizerFailed:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  objc_super v4 = (_UIRelationshipGestureRecognizer *)a3;
  if ([(UIGestureRecognizer *)self->_gestureRecognizerForDragInitiation state] == UIGestureRecognizerStateFailed
    || [(UIGestureRecognizer *)self->_gestureRecognizerForDragInitiation state] == UIGestureRecognizerStateCancelled)
  {
    [(_UIDragInteractionLongPressDriver *)self openCompetingGestureRecognizerGateCancelingGestures:0];
  }
  else if (self->_gestureRecognizerForExclusionRelationship == v4)
  {
    if (self->super._stateMachine.state == 1)
    {
      [(_UIDragInteractionLongPressDriver *)self invalidateCompetingGestureRecognizerGateTimer];
      [(_UIDragInteractionLongPressDriver *)self invalidateCancellationTimer];
      v6[0] = self->_gestureRecognizerForDragInitiation;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
      [(_UIDragInteractionLongPressDriver *)self openCompetingGestureRecognizerGateCancelingGestures:v5];
    }
    [(_UIDragInteractionDriver *)self cancel];
  }
}

- (void)openCompetingGestureRecognizerGateCancelingGestures:(id)a3
{
  if (a3)
  {
    objc_super v4 = (void *)UIApp;
    id v5 = a3;
    BOOL v6 = [v4 _gestureEnvironment];
    -[UIGestureEnvironment _cancelGestureRecognizers:]((uint64_t)v6, v5);
  }
  gestureRecognizerForFailureRelationship = self->_gestureRecognizerForFailureRelationship;
  [(_UIRelationshipGestureRecognizer *)gestureRecognizerForFailureRelationship _fail];
}

- (_UIDragInteractionLongPressDriver)init
{
  return [(_UIDragInteractionLongPressDriver *)self initWithBehavior:0];
}

- (BOOL)canExcludeCompetingGestureRecognizer:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDragInteractionDriver *)self delegate];
  if ([v5 dragDriverWantsExclusionOverride:self])
  {
    char v6 = [v5 dragDriver:self canExcludeCompetingGestureRecognizer:v4];
  }
  else
  {
    char v7 = [v4 _isGestureType:1];

    char v6 = v7 ^ 1;
  }

  return v6;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  char v6 = (_UIDragLiftGestureRecognizer *)a3;
  id v7 = a4;
  if (![(_UIDragInteractionDriver *)self isEnabled]) {
    goto LABEL_8;
  }
  objc_super v8 = [(_UIDragInteractionDriver *)self delegate];
  int v9 = [v8 dragDriver:self shouldReceiveTouch:v7];

  if (!v9) {
    goto LABEL_8;
  }
  unint64_t behavior = self->_behavior;
  if (behavior - 1 >= 2)
  {
    if (behavior || ([v7 _originatesFromPointerEvent] & 1) == 0) {
      goto LABEL_10;
    }
LABEL_8:
    BOOL v11 = 0;
    goto LABEL_9;
  }
  if (([v7 _originatesFromPointerEvent] & 1) == 0) {
    goto LABEL_8;
  }
LABEL_10:
  if ([(_UIDragInteractionDriver *)self additionalTouchesCancelLift])
  {
    v13 = [(UIGestureRecognizer *)self->_gestureRecognizerForDragInitiation _allActiveTouches];
    uint64_t v14 = [v13 count];

    if (v14 >= 1 && self->_gestureRecognizerForDragInitiation == v6 && self->super._stateMachine.state != 5) {
      [(_UIDragInteractionDriver *)self cancel];
    }
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizerForExclusionRelationship, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerForFailureRelationship, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerForDragInitiation, 0);
  objc_storeStrong((id *)&self->_cancellationTimer, 0);
  objc_storeStrong((id *)&self->_gateTimer, 0);
}

- (void)reset
{
  [(_UIDragInteractionLongPressDriver *)self invalidateCompetingGestureRecognizerGateTimer];
  [(_UIDragInteractionLongPressDriver *)self invalidateCancellationTimer];
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  -[_UIDragInteractionDriver setInitialLocationInWindow:](self, "setInitialLocationInWindow:", v3, v4);
}

- (void)didTransitionToPreparing
{
  [(_UIDragInteractionLongPressDriver *)self _gateCompetingGestureRecognizers];
  v3.receiver = self;
  v3.super_class = (Class)_UIDragInteractionLongPressDriver;
  [(_UIDragInteractionDriver *)&v3 didTransitionToPreparing];
}

- (void)didTransitionToDeferred
{
  if (dyld_program_sdk_at_least()) {
    [(_UIDragInteractionLongPressDriver *)self _gateCompetingGestureRecognizers];
  }
  v3.receiver = self;
  v3.super_class = (Class)_UIDragInteractionLongPressDriver;
  [(_UIDragInteractionDriver *)&v3 didTransitionToDeferred];
}

- (void)didTransitionToInflightState
{
  objc_super v3 = [(_UIDragInteractionDriver *)self delegate];
  char v4 = [v3 dragDriverBeginLift:self];

  if (v4)
  {
    if (![(_UIDragInteractionDriver *)self allowsSimultaneousRecognitionDuringLift])
    {
      gestureRecognizerForExclusionRelationship = self->_gestureRecognizerForExclusionRelationship;
      [(_UIRelationshipGestureRecognizer *)gestureRecognizerForExclusionRelationship _succeed];
    }
  }
  else
  {
    [(_UIDragInteractionDriver *)self cancel];
  }
}

- (void)didTransitionToCancelState
{
  v5[1] = *MEMORY[0x1E4F143B8];
  [(_UIDragInteractionLongPressDriver *)self invalidateCompetingGestureRecognizerGateTimer];
  [(_UIDragInteractionLongPressDriver *)self invalidateCancellationTimer];
  v5[0] = self->_gestureRecognizerForDragInitiation;
  objc_super v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  [(_UIDragInteractionLongPressDriver *)self openCompetingGestureRecognizerGateCancelingGestures:v3];

  v4.receiver = self;
  v4.super_class = (Class)_UIDragInteractionLongPressDriver;
  [(_UIDragInteractionDriver *)&v4 didTransitionToCancelState];
}

- (void)didTransitionToBeginState
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v26.receiver = self;
  v26.super_class = (Class)_UIDragInteractionLongPressDriver;
  [(_UIDragInteractionDriver *)&v26 didTransitionToBeginState];
  if ([(_UIDragInteractionDriver *)self allowsSimultaneousRecognitionDuringLift])
  {
    [(_UIRelationshipGestureRecognizer *)self->_gestureRecognizerForExclusionRelationship _succeed];
  }
  [(_UIDragInteractionLongPressDriver *)self invalidateCompetingGestureRecognizerGateTimer];
  [(_UIDragInteractionLongPressDriver *)self invalidateCancellationTimer];
  objc_super v4 = self->_gestureRecognizerForDragInitiation;
  id v5 = [(UIGestureRecognizer *)v4 _allActiveTouches];
  if (![v5 count])
  {
    v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &_MergedGlobals_9_10) + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      id v7 = v10;
      objc_super v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v29 = self;
      __int16 v30 = 2112;
      v31 = v8;
      __int16 v32 = 2112;
      v33 = v4;
      int v9 = "%@ %@ gesture recognizer %@ has no touches that are not ended or cancelled, so it cannot be used to start a drag";
      goto LABEL_9;
    }
LABEL_10:
    [(_UIDragInteractionDriver *)self cancel];
    goto LABEL_19;
  }
  if ((unint64_t)[v5 count] >= 3)
  {
    char v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &qword_1EB25D258) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = v6;
      objc_super v8 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412802;
      v29 = self;
      __int16 v30 = 2112;
      v31 = v8;
      __int16 v32 = 2112;
      v33 = v4;
      int v9 = "%@ %@ gesture recognizer %@ has more than 2 touches that are not ended or cancelled, so it cannot be used to start a drag";
LABEL_9:
      _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, v9, buf, 0x20u);

      goto LABEL_10;
    }
    goto LABEL_10;
  }
  BOOL v11 = (void *)UIApp;
  v12 = [(_UIDragInteractionDriver *)self view];
  v13 = [v12 window];
  uint64_t v14 = [v11 _touchesEventForWindow:v13];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v5;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        -[UIGestureRecognizer _removeTouch:forEvent:](v4, "_removeTouch:forEvent:", *(void *)(*((void *)&v22 + 1) + 8 * i), v14, (void)v22);
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v17);
  }

  v20 = [(_UIDragInteractionDriver *)self delegate];
  v21 = [(_UIDragInteractionDriver *)self itemUpdater];
  [v20 dragDriver:self beginDragWithTouches:v15 itemUpdater:v21 beginningSessionHandler:0];

LABEL_19:
}

- (void)didTransitionToInactiveState
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDragInteractionLongPressDriver;
  [(_UIDragInteractionDriver *)&v3 didTransitionToInactiveState];
  [(_UIDragInteractionLongPressDriver *)self reset];
}

- (void)setAllowedTouchTypes:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDragInteractionLongPressDriver;
  id v4 = a3;
  [(_UIDragInteractionDriver *)&v5 setAllowedTouchTypes:v4];
  -[UIGestureRecognizer setAllowedTouchTypes:](self->_gestureRecognizerForDragInitiation, "setAllowedTouchTypes:", v4, v5.receiver, v5.super_class);
}

- (BOOL)isGestureRecognizerForDragInitiation:(id)a3
{
  return self->_gestureRecognizerForDragInitiation == a3;
}

- (id)gestureRecognizerForDragInitiation
{
  return self->_gestureRecognizerForDragInitiation;
}

- (BOOL)_wantsTimeDelayedFailureRequirementGate
{
  objc_super v3 = [(_UIDragInteractionDriver *)self view];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 horizontalSizeClass];

  if (v5 == 1) {
    return 0;
  }
  else {
    return ![(_UIDragInteractionDriver *)self competingLongPressOnLift];
  }
}

- (void)_gateCompetingGestureRecognizers
{
  BOOL v3 = [(_UIDragInteractionLongPressDriver *)self _wantsTimeDelayedFailureRequirementGate];
  gateTimer = self->_gateTimer;
  if (v3)
  {
    if (gateTimer)
    {
      [(UIDelayedAction *)gateTimer touch];
    }
    else
    {
      uint64_t v5 = [UIDelayedAction alloc];
      [(_UIDragInteractionDriver *)self competingLongPressDelay];
      char v6 = -[UIDelayedAction initWithTarget:action:userInfo:delay:](v5, "initWithTarget:action:userInfo:delay:", self, sel_openGateCancelingAddItemsGestures, 0);
      id v7 = self->_gateTimer;
      self->_gateTimer = v6;
    }
  }
  else if (gateTimer)
  {
    [(_UIDragInteractionLongPressDriver *)self invalidateCompetingGestureRecognizerGateTimer];
  }
  BOOL v8 = [(_UIDragInteractionDriver *)self cancellationTimerEnabled];
  cancellationTimer = self->_cancellationTimer;
  if (v8)
  {
    if (cancellationTimer)
    {
      [(UIDelayedAction *)cancellationTimer touch];
    }
    else
    {
      v10 = [UIDelayedAction alloc];
      [(_UIDragInteractionDriver *)self cancellationDelay];
      BOOL v11 = -[UIDelayedAction initWithTarget:action:userInfo:delay:](v10, "initWithTarget:action:userInfo:delay:", self, sel_cancel, 0);
      v12 = self->_cancellationTimer;
      self->_cancellationTimer = v11;
    }
  }
  else if (cancellationTimer)
  {
    [(_UIDragInteractionLongPressDriver *)self invalidateCancellationTimer];
  }
}

- (void)invalidateCompetingGestureRecognizerGateTimer
{
  [(UIDelayedAction *)self->_gateTimer cancel];
  gateTimer = self->_gateTimer;
  self->_gateTimer = 0;
}

- (void)invalidateCancellationTimer
{
  [(UIDelayedAction *)self->_cancellationTimer cancel];
  cancellationTimer = self->_cancellationTimer;
  self->_cancellationTimer = 0;
}

- (void)openGateCancelingAddItemsGestures
{
  [(_UIDragInteractionLongPressDriver *)self openCompetingGestureRecognizerGateCancelingGestures:0];
  id v3 = [(_UIDragInteractionDriver *)self delegate];
  [v3 dragDriverCancelAddItemsGesture:self];
}

- (void)dragInitiationGestureStateChanged:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(_UIDragInteractionLongPressDriver *)self gestureRecognizerForDragInitiation];

  if (v5 == v4)
  {
    [(_UIDragInteractionLongPressDriver *)self _dragInitiationGestureStateChanged:v4];
  }
  else
  {
    char v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Dragging", &dragInitiationGestureStateChanged____s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Invalid gesture recognizer sent to drag interaction %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)_dragInitiationGestureStateChanged:(id)a3
{
  id v17 = a3;
  uint64_t v4 = [v17 state];
  if (v4 == 3)
  {
    if (!self) {
      goto LABEL_17;
    }
    p_stateMachine = &self->super._stateMachine;
    v13 = self;
    uint64_t v14 = 4;
    goto LABEL_16;
  }
  if (v4 != 2)
  {
    if (v4 != 1)
    {
      [(_UIDragInteractionDriver *)self cancel];
      goto LABEL_17;
    }
    if (self->_behavior != 1)
    {
      id v15 = [(_UIDragInteractionDriver *)self view];
      uint64_t v16 = [v15 window];
      [v17 locationInView:v16];
      -[_UIDragInteractionDriver setInitialLocationInWindow:](self, "setInitialLocationInWindow:");

      p_stateMachine = &self->super._stateMachine;
      v13 = self;
      uint64_t v14 = 0;
LABEL_16:
      _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)p_stateMachine, (uint64_t)v13, v14);
      goto LABEL_17;
    }
    id v5 = [v17 view];
    [v17 startPoint];
    double v7 = v6;
    double v9 = v8;
    v10 = [(_UIDragInteractionDriver *)self view];
    BOOL v11 = [v10 window];
    objc_msgSend(v5, "convertPoint:toView:", v11, v7, v9);
    -[_UIDragInteractionDriver setInitialLocationInWindow:](self, "setInitialLocationInWindow:");

    _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 0);
LABEL_7:
    if (self->super._stateMachine.state == 3
      && [(_UIDragInteractionLongPressDriver *)self hasExceededAllowableMovement])
    {
      p_stateMachine = &self->super._stateMachine;
      v13 = self;
      uint64_t v14 = 2;
    }
    else
    {
      if (![(_UIDragInteractionLongPressDriver *)self hasMoveHysteresisBeenReached]) {
        goto LABEL_17;
      }
      p_stateMachine = &self->super._stateMachine;
      v13 = self;
      uint64_t v14 = 3;
    }
    goto LABEL_16;
  }
  if (self) {
    goto LABEL_7;
  }
  [0 hasMoveHysteresisBeenReached];
LABEL_17:
}

- (double)translationInWindow
{
  [(_UIDragInteractionDriver *)self initialLocationInWindow];
  double v4 = v3;
  double v6 = v5;
  gestureRecognizerForDragInitiation = self->_gestureRecognizerForDragInitiation;
  double v8 = [(_UIDragInteractionDriver *)self view];
  double v9 = [v8 window];
  [(UILongPressGestureRecognizer *)gestureRecognizerForDragInitiation locationInView:v9];
  double v12 = sqrt((v4 - v10) * (v4 - v10) + (v6 - v11) * (v6 - v11));

  return v12;
}

- (BOOL)hasMoveHysteresisBeenReached
{
  [(_UIDragInteractionLongPressDriver *)self translationInWindow];
  double v4 = v3;
  [(_UIDragInteractionDriver *)self liftMoveHysteresis];
  return v4 > v5;
}

- (BOOL)hasExceededAllowableMovement
{
  [(_UIDragInteractionLongPressDriver *)self translationInWindow];
  double v4 = v3;
  [(UILongPressGestureRecognizer *)self->_gestureRecognizerForDragInitiation allowableMovement];
  return v4 > v5;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  double v4 = (_UIRelationshipGestureRecognizer *)a3;
  if ((_UIRelationshipGestureRecognizer *)self->_gestureRecognizerForDragInitiation == v4
    && [(UIGestureRecognizer *)self->_gestureRecognizerForExclusionRelationship state] <= UIGestureRecognizerStateChanged)
  {
    double v5 = [(_UIDragInteractionDriver *)self view];
    [(UIGestureRecognizer *)v4 locationInView:v5];
    double v7 = v6;
    double v9 = v8;

    double v10 = [(_UIDragInteractionDriver *)self delegate];
    char v11 = objc_msgSend(v10, "dragDriver:shouldBeginAtLocation:", self, v7, v9);
  }
  else
  {
    char v11 = self->_gestureRecognizerForExclusionRelationship == v4;
  }

  return v11;
}

- (_UIRelationshipGestureRecognizer)gestureRecognizerForFailureRelationship
{
  return self->_gestureRecognizerForFailureRelationship;
}

- (_UIRelationshipGestureRecognizer)gestureRecognizerForExclusionRelationship
{
  return self->_gestureRecognizerForExclusionRelationship;
}

@end