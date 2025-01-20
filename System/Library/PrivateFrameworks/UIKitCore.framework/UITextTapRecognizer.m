@interface UITextTapRecognizer
- (NSArray)touchesForTap;
- (UITextTapRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)touchBasedAllowableMovement;
- (void)setTouchBasedAllowableMovement:(double)a3;
- (void)setTouchesForTap:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation UITextTapRecognizer

- (UITextTapRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)UITextTapRecognizer;
  v4 = [(UITapGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UITapGestureRecognizer *)v4 setMaximumIntervalBetweenSuccessiveTaps:0.35];
    [(UITapGestureRecognizer *)v5 setAllowableMovement:1.79769313e308];
    [(UIGestureRecognizer *)v5 setName:@"com.apple.UIKit.textTap"];
    [(UITextTapRecognizer *)v5 setTouchBasedAllowableMovement:-1.0];
  }
  return v5;
}

- (void)setTouchBasedAllowableMovement:(double)a3
{
  self->_touchBasedAllowableMovement = a3;
}

- (void).cxx_destruct
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 anyObject];
  if ([v8 _isPointerTouch])
  {
    [(UITextTapRecognizer *)self touchBasedAllowableMovement];
    double v10 = v9;

    if (v10 < 0.0)
    {
      [(UITapGestureRecognizer *)self allowableMovement];
      -[UITextTapRecognizer setTouchBasedAllowableMovement:](self, "setTouchBasedAllowableMovement:");
      [(UITapGestureRecognizer *)self setAllowableMovement:1.0];
    }
  }
  else
  {
  }
  v11.receiver = self;
  v11.super_class = (Class)UITextTapRecognizer;
  [(UITapGestureRecognizer *)&v11 touchesBegan:v6 withEvent:v7];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(UITapGestureRecognizer *)self touches];
  [(UITextTapRecognizer *)self setTouchesForTap:v8];

  v10.receiver = self;
  v10.super_class = (Class)UITextTapRecognizer;
  [(UITapGestureRecognizer *)&v10 touchesEnded:v7 withEvent:v6];

  [(UITextTapRecognizer *)self touchBasedAllowableMovement];
  if (v9 > 0.0)
  {
    [(UITextTapRecognizer *)self touchBasedAllowableMovement];
    -[UITapGestureRecognizer setAllowableMovement:](self, "setAllowableMovement:");
    [(UITextTapRecognizer *)self setTouchBasedAllowableMovement:-1.0];
  }
}

- (NSArray)touchesForTap
{
  return self->_touchesForTap;
}

- (void)setTouchesForTap:(id)a3
{
}

- (double)touchBasedAllowableMovement
{
  return self->_touchBasedAllowableMovement;
}

@end