@interface TSWPTapAndTouchGestureRecognizer
- (unint64_t)numberOfTapsRequired;
- (void)p_failBecauseFingerStayedUpTooLongAfterTap;
- (void)reset;
- (void)setNumberOfTapsRequired:(unint64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TSWPTapAndTouchGestureRecognizer

- (void)p_failBecauseFingerStayedUpTooLongAfterTap
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_p_failBecauseFingerStayedUpTooLongAfterTap object:0];
  v10.receiver = self;
  v10.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  [(TSWPTapAndTouchGestureRecognizer *)&v10 touchesBegan:a3 withEvent:a4];
  if ((unint64_t)objc_msgSend((id)objc_msgSend(a4, "allTouches"), "count") >= 2) {
    goto LABEL_5;
  }
  v7 = (void *)[a3 anyObject];
  if ([v7 tapCount] < self->_numberOfTapsRequired + 1) {
    return;
  }
  if ([v7 tapCount] == self->_numberOfTapsRequired + 1)
  {
    v8 = self;
    uint64_t v9 = 1;
  }
  else
  {
LABEL_5:
    v8 = self;
    uint64_t v9 = 5;
  }
  [(TSWPTapAndTouchGestureRecognizer *)v8 setState:v9];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  [(TSWPTapAndTouchGestureRecognizer *)&v6 touchesMoved:a3 withEvent:a4];
  if ([(TSWPTapAndTouchGestureRecognizer *)self state] == 1
    || [(TSWPTapAndTouchGestureRecognizer *)self state] == 2)
  {
    uint64_t v5 = 2;
  }
  else if ([(TSWPTapAndTouchGestureRecognizer *)self state])
  {
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = 5;
  }
  [(TSWPTapAndTouchGestureRecognizer *)self setState:v5];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  [(TSWPTapAndTouchGestureRecognizer *)&v7 touchesEnded:a3 withEvent:a4];
  if ([(TSWPTapAndTouchGestureRecognizer *)self state] == 1
    || [(TSWPTapAndTouchGestureRecognizer *)self state] == 2)
  {
    uint64_t v5 = self;
    uint64_t v6 = 3;
LABEL_4:
    [(TSWPTapAndTouchGestureRecognizer *)v5 setState:v6];
    return;
  }
  if ([(TSWPTapAndTouchGestureRecognizer *)self state])
  {
    uint64_t v5 = self;
    uint64_t v6 = 4;
    goto LABEL_4;
  }
  [(TSWPTapAndTouchGestureRecognizer *)self setState:0];
  [(TSWPTapAndTouchGestureRecognizer *)self performSelector:sel_p_failBecauseFingerStayedUpTooLongAfterTap withObject:0 afterDelay:0.400000006];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  [(TSWPTapAndTouchGestureRecognizer *)&v5 touchesCancelled:a3 withEvent:a4];
  [(TSWPTapAndTouchGestureRecognizer *)self setState:4];
}

- (void)reset
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_p_failBecauseFingerStayedUpTooLongAfterTap object:0];
  v3.receiver = self;
  v3.super_class = (Class)TSWPTapAndTouchGestureRecognizer;
  [(TSWPTapAndTouchGestureRecognizer *)&v3 reset];
  [(TSWPTapAndTouchGestureRecognizer *)self delegate];
  [(id)TSUProtocolCast() didReset:self];
}

- (unint64_t)numberOfTapsRequired
{
  return self->_numberOfTapsRequired;
}

- (void)setNumberOfTapsRequired:(unint64_t)a3
{
  self->_numberOfTapsRequired = a3;
}

@end