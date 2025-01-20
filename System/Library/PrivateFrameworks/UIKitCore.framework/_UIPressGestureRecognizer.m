@interface _UIPressGestureRecognizer
- (BOOL)_shouldReceivePress:(id)a3;
- (BOOL)shouldReceiveEvent:(id)a3;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation _UIPressGestureRecognizer

- (BOOL)shouldReceiveEvent:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 type] == 3 || objc_msgSend(v3, "type") == 4;

  return v4;
}

- (void)setDelegate:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIPressGestureRecognizer;
  id v4 = a3;
  [(UIGestureRecognizer *)&v6 setDelegate:v4];
  char v5 = objc_opt_respondsToSelector();

  *(unsigned char *)&self->_delegateRespondsTo = *(unsigned char *)&self->_delegateRespondsTo & 0xFE | v5 & 1;
}

- (BOOL)_shouldReceivePress:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPressGestureRecognizer;
  if ([(UIGestureRecognizer *)&v8 _shouldReceivePress:v4])
  {
    char v5 = 1;
  }
  else if (*(unsigned char *)&self->_delegateRespondsTo)
  {
    objc_super v6 = [(UIGestureRecognizer *)self delegate];
    char v5 = [v6 pressGestureRecognizer:self shouldAllowPress:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPressGestureRecognizer;
  [(UIGestureRecognizer *)&v5 pressesBegan:a3 withEvent:a4];
  [(UIGestureRecognizer *)self setState:1];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPressGestureRecognizer;
  [(UIGestureRecognizer *)&v5 pressesEnded:a3 withEvent:a4];
  [(UIGestureRecognizer *)self setState:3];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPressGestureRecognizer;
  [(UIGestureRecognizer *)&v5 pressesCancelled:a3 withEvent:a4];
  [(UIGestureRecognizer *)self setState:4];
}

@end