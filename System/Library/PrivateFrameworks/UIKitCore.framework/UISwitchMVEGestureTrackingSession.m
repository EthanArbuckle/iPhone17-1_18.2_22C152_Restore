@interface UISwitchMVEGestureTrackingSession
+ (BOOL)gestureIsInEndState:(int64_t)a3;
- (BOOL)_isMovementDirectionAndMagnitudeEnoughToPerformOnOffChange:(double)a3;
- (BOOL)_isMovementDirectionTrackableForPossibleOnOffChange:(double)a3;
- (BOOL)canApplyPendingOnValueForGesture:(id)a3;
- (BOOL)displayedOnValue;
- (BOOL)lastCommitedOnValue;
- (BOOL)pendingDisplayedOnValue;
- (BOOL)pendingDisplayedOnValueIsValid;
- (BOOL)updatePendingDisplayedOnValueIfMovementIsEnoughToInitiateChange:(double)a3 forGesture:(id)a4;
- (UIGestureRecognizer)pendingDisplayedOnValueInitiatingGesture;
- (UISwitchMVEGestureTrackingSession)initWithVisualElement:(id)a3;
- (UISwitchMVEGestureTrackingSessionElement)visualElement;
- (double)movementVectorForPanInitiatedChangeTargetOnValue;
- (double)movementVectorForPanInitiatedChangeY;
- (double)naturalLayoutDirection;
- (void)_applyPendingChangesIfNecessary;
- (void)_sendStateChangeActionsIfNecessary;
- (void)_updateMovementVectorForPanInitiatedChanges;
- (void)applyPendingDisplayedOnValueAndSendActions;
- (void)invalidatePendingOnValue;
- (void)reset;
- (void)setDisplayedOnValue:(BOOL)a3;
- (void)setPendingDisplayedOnValue:(BOOL)a3 forGesture:(id)a4;
- (void)setVisualElement:(id)a3;
@end

@implementation UISwitchMVEGestureTrackingSession

- (UISwitchMVEGestureTrackingSession)initWithVisualElement:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UISwitchMVEGestureTrackingSession;
  v5 = [(UISwitchMVEGestureTrackingSession *)&v11 init];
  v6 = v5;
  if (v5)
  {
    id v7 = objc_storeWeak((id *)&v5->_visualElement, v4);
    int v8 = [v4 _shouldReverseLayoutDirection];
    double v9 = 1.0;
    if (v8) {
      double v9 = -1.0;
    }
    v6->_naturalLayoutDirection = v9;

    [(UISwitchMVEGestureTrackingSession *)v6 reset];
  }

  return v6;
}

- (void)_updateMovementVectorForPanInitiatedChanges
{
  double naturalLayoutDirection = self->_naturalLayoutDirection;
  if (self->_displayedOnValue) {
    double naturalLayoutDirection = -naturalLayoutDirection;
  }
  double v3 = naturalLayoutDirection * 25.0;
  double v4 = 0.0;
  if (!self->_displayedOnValue) {
    double v4 = 1.0;
  }
  self->_movementVectorForPanInitiatedChangeY = v3;
  self->_movementVectorForPanInitiatedChangeTargetOnValue = v4;
}

- (void)setDisplayedOnValue:(BOOL)a3
{
  self->_displayedOnValue = a3;
  [(UISwitchMVEGestureTrackingSession *)self _updateMovementVectorForPanInitiatedChanges];
}

- (void)reset
{
  pendingDisplayedOnValueInitiatingGesture = self->_pendingDisplayedOnValueInitiatingGesture;
  self->_pendingDisplayedOnValueInitiatingGesture = 0;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualElement);
  self->_lastCommitedOnValue = [WeakRetained displayedOn];

  id v5 = objc_loadWeakRetained((id *)&self->_visualElement);
  self->_displayedOnValue = [v5 displayedOn];

  [(UISwitchMVEGestureTrackingSession *)self _updateMovementVectorForPanInitiatedChanges];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDisplayedOnValueInitiatingGesture, 0);
  objc_destroyWeak((id *)&self->_visualElement);
}

- (void)setPendingDisplayedOnValue:(BOOL)a3 forGesture:(id)a4
{
  self->_pendingDisplayedOnValue = a3;
  objc_storeStrong((id *)&self->_pendingDisplayedOnValueInitiatingGesture, a4);
  [(UISwitchMVEGestureTrackingSession *)self _updateMovementVectorForPanInitiatedChanges];
}

- (void)invalidatePendingOnValue
{
}

- (BOOL)pendingDisplayedOnValueIsValid
{
  return self->_pendingDisplayedOnValueInitiatingGesture != 0;
}

- (BOOL)updatePendingDisplayedOnValueIfMovementIsEnoughToInitiateChange:(double)a3 forGesture:(id)a4
{
  id v6 = a4;
  BOOL v7 = [(UISwitchMVEGestureTrackingSession *)self _isMovementDirectionAndMagnitudeEnoughToPerformOnOffChange:a3];
  if (v7) {
    [(UISwitchMVEGestureTrackingSession *)self setPendingDisplayedOnValue:self->_movementVectorForPanInitiatedChangeTargetOnValue != 0.0 forGesture:v6];
  }

  return v7;
}

- (BOOL)canApplyPendingOnValueForGesture:(id)a3
{
  return self->_pendingDisplayedOnValueInitiatingGesture == a3;
}

- (void)applyPendingDisplayedOnValueAndSendActions
{
  [(UISwitchMVEGestureTrackingSession *)self _applyPendingChangesIfNecessary];
  [(UISwitchMVEGestureTrackingSession *)self _sendStateChangeActionsIfNecessary];
}

- (void)_applyPendingChangesIfNecessary
{
  if ([(UISwitchMVEGestureTrackingSession *)self pendingDisplayedOnValueIsValid])
  {
    int pendingDisplayedOnValue = self->_pendingDisplayedOnValue;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_visualElement);
    int v5 = [WeakRetained displayedOn];

    if (pendingDisplayedOnValue != v5)
    {
      id v6 = objc_loadWeakRetained((id *)&self->_visualElement);
      [v6 interactiveChangeToDisplayedOn:self->_pendingDisplayedOnValue];
    }
    pendingDisplayedOnValueInitiatingGesture = self->_pendingDisplayedOnValueInitiatingGesture;
    self->_pendingDisplayedOnValueInitiatingGesture = 0;
  }
}

- (void)_sendStateChangeActionsIfNecessary
{
  BOOL displayedOnValue = self->_displayedOnValue;
  if (displayedOnValue != self->_lastCommitedOnValue)
  {
    self->_lastCommitedOnValue = displayedOnValue;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_visualElement);
    [WeakRetained sendStateChangeActions];
  }
}

- (BOOL)_isMovementDirectionTrackableForPossibleOnOffChange:(double)a3
{
  return (a3 <= 0.0) ^ (self->_movementVectorForPanInitiatedChangeY > 0.0);
}

- (BOOL)_isMovementDirectionAndMagnitudeEnoughToPerformOnOffChange:(double)a3
{
  BOOL v5 = -[UISwitchMVEGestureTrackingSession _isMovementDirectionTrackableForPossibleOnOffChange:](self, "_isMovementDirectionTrackableForPossibleOnOffChange:");
  if (v5) {
    LOBYTE(v5) = fabs(a3) > fabs(self->_movementVectorForPanInitiatedChangeY);
  }
  return v5;
}

+ (BOOL)gestureIsInEndState:(int64_t)a3
{
  return a3 == 3 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (UISwitchMVEGestureTrackingSessionElement)visualElement
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_visualElement);
  return (UISwitchMVEGestureTrackingSessionElement *)WeakRetained;
}

- (void)setVisualElement:(id)a3
{
}

- (BOOL)displayedOnValue
{
  return self->_displayedOnValue;
}

- (double)naturalLayoutDirection
{
  return self->_naturalLayoutDirection;
}

- (double)movementVectorForPanInitiatedChangeY
{
  return self->_movementVectorForPanInitiatedChangeY;
}

- (double)movementVectorForPanInitiatedChangeTargetOnValue
{
  return self->_movementVectorForPanInitiatedChangeTargetOnValue;
}

- (UIGestureRecognizer)pendingDisplayedOnValueInitiatingGesture
{
  return self->_pendingDisplayedOnValueInitiatingGesture;
}

- (BOOL)pendingDisplayedOnValue
{
  return self->_pendingDisplayedOnValue;
}

- (BOOL)lastCommitedOnValue
{
  return self->_lastCommitedOnValue;
}

@end