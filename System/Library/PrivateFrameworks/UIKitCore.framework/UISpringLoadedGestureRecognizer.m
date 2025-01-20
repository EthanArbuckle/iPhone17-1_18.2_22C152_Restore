@interface UISpringLoadedGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (CGPoint)locationInView:(id)a3;
- (void)_draggingEndedWithEvent:(id)a3;
- (void)_draggingEnteredWithEvent:(id)a3;
- (void)_draggingExitedWithEvent:(id)a3;
- (void)_draggingUpdatedWithEvent:(id)a3;
- (void)spring;
@end

@implementation UISpringLoadedGestureRecognizer

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)UISpringLoadedGestureRecognizer;
    BOOL v5 = [(UIDragGestureRecognizer *)&v7 canPreventGestureRecognizer:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)UISpringLoadedGestureRecognizer;
    BOOL v5 = [(UIDragGestureRecognizer *)&v7 canBePreventedByGestureRecognizer:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (CGPoint)locationInView:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIDragGestureRecognizer *)self _dragEvent];
  v6 = v5;
  if (v4)
  {
    [v5 locationInView:v4];
    double v8 = v7;
    double v10 = v9;
  }
  else
  {
    v11 = [(UIGestureRecognizer *)self view];
    [v6 locationInView:v11];
    double v8 = v12;
    double v10 = v13;
  }
  double v14 = v8;
  double v15 = v10;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 9 && (objc_msgSend(v4, "isFromAccessibilitySession") & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)UISpringLoadedGestureRecognizer;
    BOOL v5 = [(UIDragGestureRecognizer *)&v7 shouldReceiveEvent:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_draggingEnteredWithEvent:(id)a3
{
}

- (void)_draggingUpdatedWithEvent:(id)a3
{
}

- (void)_draggingExitedWithEvent:(id)a3
{
  if ([(UIGestureRecognizer *)self state] <= UIGestureRecognizerStateChanged)
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)_draggingEndedWithEvent:(id)a3
{
  if ([(UIGestureRecognizer *)self state] <= UIGestureRecognizerStateChanged)
  {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)spring
{
  if ([(UIGestureRecognizer *)self state] < UIGestureRecognizerStateBegan
    || [(UIGestureRecognizer *)self state] >= UIGestureRecognizerStateEnded)
  {
    uint64_t v3 = 5;
  }
  else
  {
    uint64_t v3 = 3;
  }
  [(UIGestureRecognizer *)self setState:v3];
}

@end