@interface UIDropInteractionGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (void)_draggingEndedWithEvent:(id)a3;
- (void)_draggingEnteredWithEvent:(id)a3;
- (void)_draggingExitedWithEvent:(id)a3;
- (void)_draggingUpdatedWithEvent:(id)a3;
@end

@implementation UIDropInteractionGestureRecognizer

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
    [(UIGestureRecognizer *)self setState:4];
  }
}

- (void)_draggingEndedWithEvent:(id)a3
{
  if ([(UIGestureRecognizer *)self state] <= UIGestureRecognizerStateChanged)
  {
    [(UIGestureRecognizer *)self setState:3];
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7.receiver = self;
    v7.super_class = (Class)UIDropInteractionGestureRecognizer;
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
    v7.super_class = (Class)UIDropInteractionGestureRecognizer;
    BOOL v5 = [(UIDragGestureRecognizer *)&v7 canBePreventedByGestureRecognizer:v4];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

@end