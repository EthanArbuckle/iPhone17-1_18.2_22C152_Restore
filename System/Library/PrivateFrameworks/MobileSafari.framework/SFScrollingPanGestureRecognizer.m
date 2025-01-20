@interface SFScrollingPanGestureRecognizer
- (BOOL)_shouldTryToBeginWithEvent:(id)a3;
- (SFScrollingPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation SFScrollingPanGestureRecognizer

- (SFScrollingPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SFScrollingPanGestureRecognizer;
  v4 = [(SFScrollingPanGestureRecognizer *)&v8 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(SFScrollingPanGestureRecognizer *)v4 setAllowedScrollTypesMask:3];
    v6 = v5;
  }

  return v5;
}

- (BOOL)_shouldTryToBeginWithEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SFScrollingPanGestureRecognizer;
  if ([(SFScrollingPanGestureRecognizer *)&v7 _shouldTryToBeginWithEvent:v4]) {
    BOOL v5 = [v4 buttonMask] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

@end