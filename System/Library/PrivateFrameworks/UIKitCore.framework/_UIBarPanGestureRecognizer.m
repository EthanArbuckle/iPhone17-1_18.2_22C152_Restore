@interface _UIBarPanGestureRecognizer
- (BOOL)canPreventGestureRecognizer:(id)a3;
- (_UIBarPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (double)bias;
- (id)description;
- (int64_t)barAction;
- (void)_setDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation _UIBarPanGestureRecognizer

- (_UIBarPanGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIBarPanGestureRecognizer;
  v4 = [(UIPanGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UIPanGestureRecognizer *)v4 setMinimumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v5 setMaximumNumberOfTouches:1];
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
}

- (void)_setDelegate:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)_UIBarPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v3 setDelegate:a3];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_barAction = 0;
  self->_bias = 0.0;
  v4.receiver = self;
  v4.super_class = (Class)_UIBarPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v4 touchesBegan:a3 withEvent:a4];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)_UIBarPanGestureRecognizer;
  [(UIPanGestureRecognizer *)&v14 touchesMoved:a3 withEvent:a4];
  v5 = [(UIGestureRecognizer *)self delegate];
  char v6 = [v5 isNavigationBarHidden];

  if (!self->_barAction)
  {
    objc_super v7 = [(UIGestureRecognizer *)self view];
    [(UIPanGestureRecognizer *)self translationInView:v7];
    double v9 = v8;

    [(UIPanGestureRecognizer *)self _hysteresis];
    if (v9 > v10) {
      char v11 = v6;
    }
    else {
      char v11 = 0;
    }
    if (v11)
    {
      int64_t v12 = 2;
LABEL_12:
      self->_bias = v9;
      self->_barAction = v12;
      return;
    }
    if (v9 >= -v10) {
      char v13 = 1;
    }
    else {
      char v13 = v6;
    }
    if ((v13 & 1) == 0)
    {
      int64_t v12 = 1;
      goto LABEL_12;
    }
  }
}

- (BOOL)canPreventGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([v4 _isGestureType:8])
  {
    BOOL v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIBarPanGestureRecognizer;
    BOOL v5 = [(UIGestureRecognizer *)&v7 canPreventGestureRecognizer:v4];
  }

  return v5;
}

- (id)description
{
  unint64_t barAction = self->_barAction;
  if (barAction > 2) {
    objc_super v3 = &stru_1ED0E84C0;
  }
  else {
    objc_super v3 = off_1E52DDE18[barAction];
  }
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_UIBarPanGestureRecognizer;
  BOOL v5 = [(UIGestureRecognizer *)&v8 description];
  char v6 = [v4 stringWithFormat:@"%@ action=%@", v5, v3];

  return v6;
}

- (int64_t)barAction
{
  return self->_barAction;
}

- (double)bias
{
  return self->_bias;
}

@end