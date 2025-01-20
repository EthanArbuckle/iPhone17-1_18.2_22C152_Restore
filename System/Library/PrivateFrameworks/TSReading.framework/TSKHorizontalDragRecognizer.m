@interface TSKHorizontalDragRecognizer
- (BOOL)canBePreventedByGestureRecognizer:(id)a3;
- (UIScrollView)containingScrollView;
- (void)setContainingScrollView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation TSKHorizontalDragRecognizer

- (BOOL)canBePreventedByGestureRecognizer:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (UIScrollView *)[a3 view];
    if (v5 == [(TSKHorizontalDragRecognizer *)self containingScrollView]
      && [(TSKHorizontalDragRecognizer *)self state] != 5)
    {
      return 0;
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)TSKHorizontalDragRecognizer;
  return [(TSKHorizontalDragRecognizer *)&v7 canBePreventedByGestureRecognizer:a3];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if ((unint64_t)[a3 count] < 2)
  {
    objc_msgSend((id)objc_msgSend(a3, "anyObject"), "locationInView:", -[TSKHorizontalDragRecognizer view](self, "view"));
    self->mStartPoint.x = v6;
    self->mStartPoint.y = v7;
  }
  else
  {
    [(TSKHorizontalDragRecognizer *)self setState:5];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  objc_msgSend((id)objc_msgSend(a3, "anyObject"), "locationInView:", -[TSKHorizontalDragRecognizer view](self, "view"));
  double v6 = v5;
  double v8 = v7;
  if ([(TSKHorizontalDragRecognizer *)self state] || vabdd_f64(v8, self->mStartPoint.y) <= 15.0)
  {
    if ([(TSKHorizontalDragRecognizer *)self state] || vabdd_f64(v6, self->mStartPoint.x) <= 10.0)
    {
      if ([(TSKHorizontalDragRecognizer *)self state] != 1
        && [(TSKHorizontalDragRecognizer *)self state] != 2)
      {
        return;
      }
      v9 = self;
      uint64_t v10 = 2;
    }
    else
    {
      v9 = self;
      uint64_t v10 = 1;
    }
  }
  else
  {
    v9 = self;
    uint64_t v10 = 5;
  }

  [(TSKHorizontalDragRecognizer *)v9 setState:v10];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(TSKHorizontalDragRecognizer *)self state] == 2)
  {
    uint64_t v5 = 3;
  }
  else if ([(TSKHorizontalDragRecognizer *)self state] == 1)
  {
    uint64_t v5 = 3;
  }
  else
  {
    uint64_t v5 = 5;
  }

  [(TSKHorizontalDragRecognizer *)self setState:v5];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (UIScrollView)containingScrollView
{
  return self->mContainingScrollView;
}

- (void)setContainingScrollView:(id)a3
{
  self->mContainingScrollView = (UIScrollView *)a3;
}

@end