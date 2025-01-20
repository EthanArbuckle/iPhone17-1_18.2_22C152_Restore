@interface _UIRelationshipGestureRecognizer
- (BOOL)_isGestureType:(int64_t)a3;
- (BOOL)failsOnTouchesCancelled;
- (BOOL)succeedsOnTouchesEnded;
- (_UIRelationshipGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)_fail;
- (void)_succeed;
- (void)setFailsOnTouchesCancelled:(BOOL)a3;
- (void)setSucceedsOnTouchesEnded:(BOOL)a3;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UIRelationshipGestureRecognizer

- (BOOL)_isGestureType:(int64_t)a3
{
  return a3 == 14;
}

- (_UIRelationshipGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIRelationshipGestureRecognizer;
  result = [(UIGestureRecognizer *)&v5 initWithTarget:a3 action:a4];
  if (result) {
    result->_failsOnTouchesCancelled = 1;
  }
  return result;
}

- (void)_fail
{
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(_UIRelationshipGestureRecognizer *)self succeedsOnTouchesEnded])
  {
    [(_UIRelationshipGestureRecognizer *)self _succeed];
  }
  else
  {
    [(_UIRelationshipGestureRecognizer *)self _fail];
  }
}

- (BOOL)succeedsOnTouchesEnded
{
  return self->_succeedsOnTouchesEnded;
}

- (void)_succeed
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(_UIRelationshipGestureRecognizer *)self failsOnTouchesCancelled])
  {
    [(_UIRelationshipGestureRecognizer *)self _fail];
  }
  else
  {
    [(_UIRelationshipGestureRecognizer *)self _succeed];
  }
}

- (void)setSucceedsOnTouchesEnded:(BOOL)a3
{
  self->_succeedsOnTouchesEnded = a3;
}

- (BOOL)failsOnTouchesCancelled
{
  return self->_failsOnTouchesCancelled;
}

- (void)setFailsOnTouchesCancelled:(BOOL)a3
{
  self->_failsOnTouchesCancelled = a3;
}

@end