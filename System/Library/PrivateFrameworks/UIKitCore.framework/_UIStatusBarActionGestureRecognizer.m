@interface _UIStatusBarActionGestureRecognizer
- (BOOL)highlighted;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setHighlighted:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIStatusBarActionGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 1, a4);
  [(UIGestureRecognizer *)self setState:1];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ((unint64_t)[v10 count] < 2)
  {
    v7 = [v10 anyObject];
    v8 = [(UIGestureRecognizer *)self view];
    v9 = [(UIGestureRecognizer *)self view];
    [v7 locationInView:v9];
    -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", objc_msgSend(v8, "pointInside:withEvent:", v6));
  }
  else
  {
    [(_UIStatusBarActionGestureRecognizer *)self setHighlighted:0];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(_UIStatusBarActionGestureRecognizer *)self highlighted]) {
    uint64_t v5 = 3;
  }
  else {
    uint64_t v5 = 5;
  }
  [(UIGestureRecognizer *)self setState:v5];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
  [(UIGestureRecognizer *)self setState:4];
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  if (_UIPressesContainsPressType(a3, 4))
  {
    [(_UIStatusBarActionGestureRecognizer *)self setHighlighted:1];
    [(UIGestureRecognizer *)self setState:1];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  if (_UIPressesContainsPressType(a3, 4))
  {
    if ([(_UIStatusBarActionGestureRecognizer *)self highlighted]) {
      uint64_t v5 = 3;
    }
    else {
      uint64_t v5 = 5;
    }
    [(UIGestureRecognizer *)self setState:v5];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  -[_UIStatusBarActionGestureRecognizer setHighlighted:](self, "setHighlighted:", 0, a4);
  [(UIGestureRecognizer *)self setState:4];
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    if ([(UIGestureRecognizer *)self state] >= UIGestureRecognizerStateBegan)
    {
      [(UIGestureRecognizer *)self setState:2];
    }
  }
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

@end