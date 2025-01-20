@interface _UIDragInteractionClickPresentationDriver
- (BOOL)canBeginLiftAtLocation:(CGPoint)a3;
- (BOOL)isLifted;
- (BOOL)isPreparingToDrag;
- (void)_performDelayedLift;
- (void)beginDragWithTouches:(id)a3 itemIterator:(id)a4 beginningSessionHandler:(id)a5;
- (void)beginLiftAtLocation:(CGPoint)a3 useDefaultLiftAnimation:(BOOL)a4 delay:(double)a5 completion:(id)a6;
- (void)cancel;
- (void)didTransitionToBeginState;
- (void)didTransitionToInactiveState;
- (void)didTransitionToInflightState;
@end

@implementation _UIDragInteractionClickPresentationDriver

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)_UIDragInteractionClickPresentationDriver;
  [(_UIDragInteractionDriver *)&v4 cancel];
  [(UIDelayedAction *)self->_delayedLift cancel];
  delayedLift = self->_delayedLift;
  self->_delayedLift = 0;
}

- (BOOL)canBeginLiftAtLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v6 = [(_UIDragInteractionDriver *)self isEnabled];
  if (v6)
  {
    v7 = [(_UIDragInteractionDriver *)self delegate];
    char v8 = objc_msgSend(v7, "dragDriver:shouldBeginAtLocation:", self, x, y);

    LOBYTE(v6) = v8;
  }
  return v6;
}

- (BOOL)isPreparingToDrag
{
  return self && self->super._stateMachine.state - 3 < 2 || self->_delayedLift != 0;
}

- (BOOL)isLifted
{
  if (self) {
    LOBYTE(self) = self->super._stateMachine.state == 4;
  }
  return (char)self;
}

- (void)beginLiftAtLocation:(CGPoint)a3 useDefaultLiftAnimation:(BOOL)a4 delay:(double)a5 completion:(id)a6
{
  BOOL v7 = a4;
  double y = a3.y;
  double x = a3.x;
  id v11 = a6;
  [(_UIDragInteractionDriver *)self setShouldAnimateLift:v7];
  -[_UIDragInteractionDriver setInitialLocationInWindow:](self, "setInitialLocationInWindow:", x, y);
  v12 = _Block_copy(v11);

  id liftCompletion = self->_liftCompletion;
  self->_id liftCompletion = v12;

  if (a5 <= 0.0)
  {
    _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 0);
  }
  else
  {
    v14 = [[UIDelayedAction alloc] initWithTarget:self action:sel__performDelayedLift userInfo:0 delay:a5];
    delayedLift = self->_delayedLift;
    self->_delayedLift = v14;
  }
}

- (void)beginDragWithTouches:(id)a3 itemIterator:(id)a4 beginningSessionHandler:(id)a5
{
  v9 = (NSSet *)a3;
  id aBlock = a4;
  id v10 = a5;
  if (!v9)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"_UIDragInteractionClickPresentationDriver.m", 63, @"Invalid parameter not satisfying: %@", @"touches" object file lineNumber description];
  }
  touches = self->_touches;
  self->_touches = v9;
  v12 = v9;

  v13 = _Block_copy(aBlock);
  id itemIterator = self->_itemIterator;
  self->_id itemIterator = v13;

  v15 = _Block_copy(v10);
  id sessionHandler = self->_sessionHandler;
  self->_id sessionHandler = v15;

  _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 3);
}

- (void)_performDelayedLift
{
  delayedLift = self->_delayedLift;
  self->_delayedLift = 0;

  _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 0);
}

- (void)didTransitionToBeginState
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDragInteractionClickPresentationDriver;
  [(_UIDragInteractionDriver *)&v7 didTransitionToBeginState];
  v3 = [(_UIDragInteractionDriver *)self delegate];
  [v3 dragDriver:self beginDragWithTouches:self->_touches itemUpdater:self->_itemIterator beginningSessionHandler:self->_sessionHandler];

  objc_super v4 = [(NSSet *)self->_touches anyObject];
  v5 = [v4 window];
  BOOL v6 = [v5 windowScene];

  if (v6) {
    [(id)UIApp _cancelAllEventsOfType:0 onEventRoutingScene:v6];
  }
  _UIDragInteractionDriverStateMachineHandleEvent((uint64_t *)&self->super._stateMachine, (uint64_t)self, 4);
}

- (void)didTransitionToInactiveState
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDragInteractionClickPresentationDriver;
  [(_UIDragInteractionDriver *)&v7 didTransitionToInactiveState];
  touches = self->_touches;
  self->_touches = 0;

  id itemIterator = self->_itemIterator;
  self->_id itemIterator = 0;

  id sessionHandler = self->_sessionHandler;
  self->_id sessionHandler = 0;

  id liftCompletion = self->_liftCompletion;
  self->_id liftCompletion = 0;
}

- (void)didTransitionToInflightState
{
  v3 = [(_UIDragInteractionDriver *)self delegate];
  uint64_t v4 = [v3 dragDriverBeginLift:self];

  if ((v4 & 1) == 0) {
    [(_UIDragInteractionClickPresentationDriver *)self cancel];
  }
  id liftCompletion = (void (**)(id, uint64_t))self->_liftCompletion;
  if (liftCompletion)
  {
    liftCompletion[2](liftCompletion, v4);
    id v6 = self->_liftCompletion;
    self->_id liftCompletion = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayedLift, 0);
  objc_storeStrong(&self->_liftCompletion, 0);
  objc_storeStrong(&self->_sessionHandler, 0);
  objc_storeStrong(&self->_itemIterator, 0);
  objc_storeStrong((id *)&self->_touches, 0);
}

@end