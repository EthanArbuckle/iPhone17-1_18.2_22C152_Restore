@interface _UIDragAutoScrollGestureRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (void)_draggingEndedWithEvent:(id)a3;
- (void)_draggingEnteredWithEvent:(id)a3;
- (void)_draggingExitedWithEvent:(id)a3;
- (void)_draggingUpdatedWithEvent:(id)a3;
@end

@implementation _UIDragAutoScrollGestureRecognizer

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v4 = a3;
  if ([v4 type] == 9 && (objc_msgSend(v4, "isFromAccessibilitySession") & 1) == 0)
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIDragAutoScrollGestureRecognizer;
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
  return 0;
}

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  return 0;
}

@end