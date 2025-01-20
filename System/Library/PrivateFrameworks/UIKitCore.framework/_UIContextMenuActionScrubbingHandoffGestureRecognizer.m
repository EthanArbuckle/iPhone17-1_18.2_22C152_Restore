@interface _UIContextMenuActionScrubbingHandoffGestureRecognizer
+ (BOOL)_supportsTouchContinuation;
- (BOOL)_gestureIsStillValid;
- (BOOL)_satisfiedHysteresis;
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (_UIContextMenuActionScrubbingHandoffGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)hysteresis;
- (void)_beginGestureIfPossible;
- (void)setHysteresis:(double)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIContextMenuActionScrubbingHandoffGestureRecognizer

- (_UIContextMenuActionScrubbingHandoffGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIContextMenuActionScrubbingHandoffGestureRecognizer;
  v4 = [(UIGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIGestureRecognizer *)v4 setName:@"com.apple.UIKit.ContextMenuActionPanHandoff"];
    [(UIGestureRecognizer *)v5 setCancelsTouchesInView:0];
    [(UIGestureRecognizer *)v5 _setAcceptsFailureRequiments:0];
    [(_UIContextMenuActionScrubbingHandoffGestureRecognizer *)v5 setHysteresis:10.0];
  }
  return v5;
}

+ (BOOL)_supportsTouchContinuation
{
  return 1;
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  p_initialLocation = &self->_initialLocation;
  -[UIGestureRecognizer locationInView:](self, "locationInView:", 0, a4);
  p_initialLocation->x = v6;
  p_initialLocation->y = v7;
  [(_UIContextMenuActionScrubbingHandoffGestureRecognizer *)self _beginGestureIfPossible];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  UIGestureRecognizerState v5 = [(UIGestureRecognizer *)self state];
  if (v5)
  {
    if (v5 <= UIGestureRecognizerStateChanged)
    {
      if ([(_UIContextMenuActionScrubbingHandoffGestureRecognizer *)self _gestureIsStillValid])
      {
        CGFloat v6 = self;
        uint64_t v7 = 2;
      }
      else
      {
        CGFloat v6 = self;
        uint64_t v7 = 4;
      }
      [(UIGestureRecognizer *)v6 setState:v7];
    }
  }
  else
  {
    [(_UIContextMenuActionScrubbingHandoffGestureRecognizer *)self _beginGestureIfPossible];
  }
}

- (void)_beginGestureIfPossible
{
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStatePossible)
  {
    if ([(_UIContextMenuActionScrubbingHandoffGestureRecognizer *)self _gestureIsStillValid])
    {
      if (![(_UIContextMenuActionScrubbingHandoffGestureRecognizer *)self _satisfiedHysteresis]) {
        return;
      }
      uint64_t v3 = 1;
    }
    else
    {
      uint64_t v3 = 5;
    }
    [(UIGestureRecognizer *)self setState:v3];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (BOOL)_gestureIsStillValid
{
  v2 = -[UIGestureRecognizer _activeTouchesEvent](self);
  uint64_t v3 = [v2 allTouches];
  BOOL v4 = (unint64_t)[v3 count] < 2;

  return v4;
}

- (BOOL)_satisfiedHysteresis
{
  p_initialLocation = &self->_initialLocation;
  [(UIGestureRecognizer *)self locationInView:0];
  double v6 = fabs(sqrt((v4 - p_initialLocation->x) * (v4 - p_initialLocation->x)+ (v5 - p_initialLocation->y) * (v5 - p_initialLocation->y)));
  [(_UIContextMenuActionScrubbingHandoffGestureRecognizer *)self hysteresis];
  return v6 >= v7;
}

- (double)hysteresis
{
  return self->_hysteresis;
}

- (void)setHysteresis:(double)a3
{
  self->_hysteresis = a3;
}

@end