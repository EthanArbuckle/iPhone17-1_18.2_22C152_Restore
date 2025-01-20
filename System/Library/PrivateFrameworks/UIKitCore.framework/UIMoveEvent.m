@interface UIMoveEvent
- (int64_t)_moveDirection;
- (int64_t)type;
- (unint64_t)_focusHeading;
- (void)_sendEventToResponder:(id)a3;
- (void)_setFocusHeading:(unint64_t)a3;
- (void)_setMoveDirection:(int64_t)a3;
@end

@implementation UIMoveEvent

- (int64_t)type
{
  return 5;
}

- (void)_sendEventToResponder:(id)a3
{
}

- (int64_t)_moveDirection
{
  return self->_moveDirection;
}

- (void)_setMoveDirection:(int64_t)a3
{
  self->_moveDirection = a3;
}

- (unint64_t)_focusHeading
{
  return self->_focusHeading;
}

- (void)_setFocusHeading:(unint64_t)a3
{
  self->_focusHeading = a3;
}

@end