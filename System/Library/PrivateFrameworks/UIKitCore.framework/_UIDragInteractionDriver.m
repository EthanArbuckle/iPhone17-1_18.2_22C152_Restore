@interface _UIDragInteractionDriver
- (BOOL)additionalTouchesCancelLift;
- (BOOL)allowsSimultaneousRecognitionDuringLift;
- (BOOL)automaticallyAddsFailureRelationships;
- (BOOL)cancellationTimerEnabled;
- (BOOL)competingLongPressOnLift;
- (BOOL)isActive;
- (BOOL)isEnabled;
- (BOOL)isGestureRecognizerForDragInitiation:(id)a3;
- (BOOL)shouldAnimateLift;
- (CGPoint)initialLocationInWindow;
- (NSArray)allowedTouchTypes;
- (UIGestureRecognizer)gestureRecognizerForDragInitiation;
- (UIView)view;
- (_UIDragInteractionDriver)init;
- (_UIDragInteractionDriverDelegate)delegate;
- (double)cancellationDelay;
- (double)competingLongPressDelay;
- (double)liftDelay;
- (double)liftMoveHysteresis;
- (id)itemUpdater;
- (unint64_t)_state;
- (void)_handleEvent:(unint64_t)a3;
- (void)cancel;
- (void)didTransitionToCancelState;
- (void)didTransitionToInflightState;
- (void)didTransitionToPreparing;
- (void)setAdditionalTouchesCancelLift:(BOOL)a3;
- (void)setAllowedTouchTypes:(id)a3;
- (void)setAllowsSimultaneousRecognitionDuringLift:(BOOL)a3;
- (void)setAutomaticallyAddsFailureRelationships:(BOOL)a3;
- (void)setCancellationDelay:(double)a3;
- (void)setCancellationTimerEnabled:(BOOL)a3;
- (void)setCompetingLongPressDelay:(double)a3;
- (void)setCompetingLongPressOnLift:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setInitialLocationInWindow:(CGPoint)a3;
- (void)setLiftDelay:(double)a3;
- (void)setLiftMoveHysteresis:(double)a3;
- (void)setShouldAnimateLift:(BOOL)a3;
- (void)setView:(id)a3;
@end

@implementation _UIDragInteractionDriver

- (void)setView:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_view);

    if (v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_view);
      [(_UIDragInteractionDriver *)self detachFromView:v6];
    }
    id v7 = objc_storeWeak((id *)&self->_view, obj);

    if (obj)
    {
      id v8 = objc_loadWeakRetained((id *)&self->_view);
      [(_UIDragInteractionDriver *)self attachToView:v8];
    }
  }
}

- (double)liftMoveHysteresis
{
  return self->_liftMoveHysteresis;
}

- (void)setCompetingLongPressDelay:(double)a3
{
  self->_competingLongPressDelay = a3;
}

- (void)setCancellationDelay:(double)a3
{
  self->_cancellationDelay = a3;
}

- (void)setLiftMoveHysteresis:(double)a3
{
  self->_liftMoveHysteresis = a3;
}

- (void)setLiftDelay:(double)a3
{
  self->_liftDelay = a3;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setCancellationTimerEnabled:(BOOL)a3
{
  self->_cancellationTimerEnabled = a3;
}

- (void)setAllowsSimultaneousRecognitionDuringLift:(BOOL)a3
{
  self->_allowsSimultaneousRecognitionDuringLift = a3;
}

- (void)setAdditionalTouchesCancelLift:(BOOL)a3
{
  self->_additionalTouchesCancelLift = a3;
}

- (BOOL)automaticallyAddsFailureRelationships
{
  return self->_automaticallyAddsFailureRelationships;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (void)setShouldAnimateLift:(BOOL)a3
{
  self->_shouldAnimateLift = a3;
}

- (void)setAutomaticallyAddsFailureRelationships:(BOOL)a3
{
  self->_automaticallyAddsFailureRelationships = a3;
}

- (double)liftDelay
{
  return self->_liftDelay;
}

- (_UIDragInteractionDriver)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIDragInteractionDriver;
  result = [(_UIDragInteractionDriver *)&v3 init];
  if (result)
  {
    result->_stateMachine.state = 1;
    result->_stateMachine.eventsQueueEnd = 0;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gestureRecognizerForDragInitiation, 0);
  objc_storeStrong(&self->_itemUpdater, 0);
  objc_storeStrong((id *)&self->_allowedTouchTypes, 0);
  objc_destroyWeak((id *)&self->_view);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
}

- (_UIDragInteractionDriverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (_UIDragInteractionDriverDelegate *)WeakRetained;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)additionalTouchesCancelLift
{
  return self->_additionalTouchesCancelLift;
}

- (void)cancel
{
  if (self) {
    _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->_stateMachine, (uint64_t)self, 5);
  }
}

- (BOOL)isGestureRecognizerForDragInitiation:(id)a3
{
  return 0;
}

- (BOOL)isActive
{
  return self->_stateMachine.state != 1;
}

- (void)didTransitionToPreparing
{
  objc_super v3 = [(_UIDragInteractionDriver *)self delegate];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52___UIDragInteractionDriver_didTransitionToPreparing__block_invoke;
  v4[3] = &unk_1E52DC3A0;
  v4[4] = self;
  [v3 dragDriver:self prepareToLiftWithCompletion:v4];
}

- (void)didTransitionToInflightState
{
  objc_super v3 = [(_UIDragInteractionDriver *)self delegate];
  char v4 = [v3 dragDriverBeginLift:self];

  if ((v4 & 1) == 0)
  {
    [(_UIDragInteractionDriver *)self cancel];
  }
}

- (void)didTransitionToCancelState
{
  objc_super v3 = [(_UIDragInteractionDriver *)self delegate];
  [v3 dragDriverCancelLift:self];

  char v4 = [(_UIDragInteractionDriver *)self delegate];
  [v4 dragDriverCancelAddItemsGesture:self];

  if (self)
  {
    _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->_stateMachine, (uint64_t)self, 7);
  }
}

- (CGPoint)initialLocationInWindow
{
  double x = self->_initialLocationInWindow.x;
  double y = self->_initialLocationInWindow.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setInitialLocationInWindow:(CGPoint)a3
{
  self->_initialLocationInWindow.double x = a3.x;
  self->_initialLocationInWindow.double y = a3.y;
  self->_initialLocationInWindow.z = 0.0;
}

- (unint64_t)_state
{
  if (self) {
    return *(void *)(self + 8);
  }
  return self;
}

- (void)_handleEvent:(unint64_t)a3
{
  if (self) {
    _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->_stateMachine, (uint64_t)self, a3);
  }
}

- (BOOL)allowsSimultaneousRecognitionDuringLift
{
  return self->_allowsSimultaneousRecognitionDuringLift;
}

- (BOOL)shouldAnimateLift
{
  return self->_shouldAnimateLift;
}

- (BOOL)cancellationTimerEnabled
{
  return self->_cancellationTimerEnabled;
}

- (BOOL)competingLongPressOnLift
{
  return self->_competingLongPressOnLift;
}

- (void)setCompetingLongPressOnLift:(BOOL)a3
{
  self->_competingLongPressOnLift = a3;
}

- (double)cancellationDelay
{
  return self->_cancellationDelay;
}

- (double)competingLongPressDelay
{
  return self->_competingLongPressDelay;
}

- (NSArray)allowedTouchTypes
{
  return self->_allowedTouchTypes;
}

- (void)setAllowedTouchTypes:(id)a3
{
}

- (id)itemUpdater
{
  return self->_itemUpdater;
}

- (UIGestureRecognizer)gestureRecognizerForDragInitiation
{
  return self->_gestureRecognizerForDragInitiation;
}

@end