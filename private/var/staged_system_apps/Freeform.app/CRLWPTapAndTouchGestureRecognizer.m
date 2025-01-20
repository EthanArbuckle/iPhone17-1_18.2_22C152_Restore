@interface CRLWPTapAndTouchGestureRecognizer
- (int64_t)inputType;
- (unint64_t)numberOfTapsRequired;
- (void)p_failBecauseFingerStayedUpTooLongAfterTap;
- (void)reset;
- (void)setInputType:(int64_t)a3;
- (void)setNumberOfTapsRequired:(unint64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CRLWPTapAndTouchGestureRecognizer

- (void)p_failBecauseFingerStayedUpTooLongAfterTap
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"p_failBecauseFingerStayedUpTooLongAfterTap" object:0];
  v12.receiver = self;
  v12.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  [(CRLWPTapAndTouchGestureRecognizer *)&v12 touchesBegan:v6 withEvent:v7];
  v8 = [v7 allTouches];

  id v9 = [v8 count];
  if ((unint64_t)v9 < 2)
  {
    v10 = [v6 anyObject];
    -[CRLWPTapAndTouchGestureRecognizer setInputType:](self, "setInputType:", sub_10036FEA4((BOOL)[v10 type]));
    if ((unint64_t)[v10 tapCount] >= self->_numberOfTapsRequired + 1)
    {
      if ([v10 tapCount] == (id)(self->_numberOfTapsRequired + 1)) {
        uint64_t v11 = 1;
      }
      else {
        uint64_t v11 = 5;
      }
      [(CRLWPTapAndTouchGestureRecognizer *)self setState:v11];
    }
  }
  else
  {
    [(CRLWPTapAndTouchGestureRecognizer *)self setState:5];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  [(CRLWPTapAndTouchGestureRecognizer *)&v6 touchesMoved:a3 withEvent:a4];
  if ([(CRLWPTapAndTouchGestureRecognizer *)self state] == (id)1
    || [(CRLWPTapAndTouchGestureRecognizer *)self state] == (id)2)
  {
    uint64_t v5 = 2;
  }
  else if ([(CRLWPTapAndTouchGestureRecognizer *)self state])
  {
    uint64_t v5 = 4;
  }
  else
  {
    uint64_t v5 = 5;
  }
  [(CRLWPTapAndTouchGestureRecognizer *)self setState:v5];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  [(CRLWPTapAndTouchGestureRecognizer *)&v7 touchesEnded:a3 withEvent:a4];
  if ([(CRLWPTapAndTouchGestureRecognizer *)self state] == (id)1
    || [(CRLWPTapAndTouchGestureRecognizer *)self state] == (id)2)
  {
    uint64_t v5 = self;
    uint64_t v6 = 3;
LABEL_4:
    [(CRLWPTapAndTouchGestureRecognizer *)v5 setState:v6];
    return;
  }
  if ([(CRLWPTapAndTouchGestureRecognizer *)self state])
  {
    uint64_t v5 = self;
    uint64_t v6 = 4;
    goto LABEL_4;
  }
  [(CRLWPTapAndTouchGestureRecognizer *)self setState:0];
  [(CRLWPTapAndTouchGestureRecognizer *)self performSelector:"p_failBecauseFingerStayedUpTooLongAfterTap" withObject:0 afterDelay:0.400000006];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  [(CRLWPTapAndTouchGestureRecognizer *)&v5 touchesCancelled:a3 withEvent:a4];
  [(CRLWPTapAndTouchGestureRecognizer *)self setState:4];
}

- (void)reset
{
  [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:"p_failBecauseFingerStayedUpTooLongAfterTap" object:0];
  v11.receiver = self;
  v11.super_class = (Class)CRLWPTapAndTouchGestureRecognizer;
  [(CRLWPTapAndTouchGestureRecognizer *)&v11 reset];
  v3 = [(CRLWPTapAndTouchGestureRecognizer *)self delegate];
  v10 = sub_100246AC8(v3, 1, v4, v5, v6, v7, v8, v9, (uint64_t)&OBJC_PROTOCOL___CRLGestureDelegate);

  [v10 didReset:self];
}

- (int64_t)inputType
{
  return self->_inputType;
}

- (void)setInputType:(int64_t)a3
{
  self->_inputType = a3;
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