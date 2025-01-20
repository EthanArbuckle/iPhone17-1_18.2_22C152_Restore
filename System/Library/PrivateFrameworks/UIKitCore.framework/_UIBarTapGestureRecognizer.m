@interface _UIBarTapGestureRecognizer
- (BOOL)failWhenTappingInBars;
- (_UIBarTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (id)description;
- (int64_t)_categoryForTapLocation:(CGPoint)a3;
- (int64_t)tapCategory;
- (void)_setDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFailWhenTappingInBars:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation _UIBarTapGestureRecognizer

- (_UIBarTapGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIBarTapGestureRecognizer;
  v4 = [(UITapGestureRecognizer *)&v7 initWithTarget:a3 action:a4];
  v5 = v4;
  if (v4)
  {
    [(UITapGestureRecognizer *)v4 setNumberOfTapsRequired:1];
    [(UITapGestureRecognizer *)v5 setNumberOfTouchesRequired:1];
    [(UIGestureRecognizer *)v5 setCancelsTouchesInView:0];
    v5->_failWhenTappingInBars = 1;
  }
  return v5;
}

- (void)setDelegate:(id)a3
{
}

- (void)_setDelegate:(id)a3
{
  id v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (objc_opt_respondsToSelector() & 1) == 0)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"UIBarCommon.m", 679, @"delegate doesn't implement required methods (%@)", v5 object file lineNumber description];
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIBarTapGestureRecognizer;
  [(UIGestureRecognizer *)&v7 setDelegate:v5];
}

- (int64_t)_categoryForTapLocation:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v6 = [(UIGestureRecognizer *)self delegate];
  objc_super v7 = [v6 _existingNavigationBar];
  v8 = [v6 _existingToolbarWithItems];
  if (!v7) {
    goto LABEL_7;
  }
  if (![v6 isNavigationBarHidden])
  {
    v11 = [(UIGestureRecognizer *)self view];
    objc_msgSend(v7, "convertPoint:fromView:", v11, x, y);
    double v13 = v12;
    double v15 = v14;

    if (objc_msgSend(v7, "pointInside:withEvent:", 0, v13, v15))
    {
      int64_t v10 = 2;
      goto LABEL_14;
    }
LABEL_7:
    if (v8)
    {
      int v16 = [v6 isToolbarHidden];
      v17 = [(UIGestureRecognizer *)self view];
      v18 = v17;
      if (v16)
      {
        [v17 bounds];
        double v20 = v19;
        [v8 frame];
        double v22 = v20 - v21;

        if (y >= v22)
        {
          int64_t v10 = 5;
          goto LABEL_14;
        }
      }
      else
      {
        objc_msgSend(v8, "convertPoint:fromView:", v17, x, y);
        double v24 = v23;
        double v26 = v25;

        if (objc_msgSend(v8, "pointInside:withEvent:", 0, v24, v26))
        {
          int64_t v10 = 4;
          goto LABEL_14;
        }
      }
    }
    int64_t v10 = 1;
    goto LABEL_14;
  }
  [v7 _heightIncludingBackground];
  if (y > v9) {
    goto LABEL_7;
  }
  int64_t v10 = 3;
LABEL_14:

  return v10;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_tapCategordouble y = 0;
  v7.receiver = self;
  v7.super_class = (Class)_UIBarTapGestureRecognizer;
  [(UITapGestureRecognizer *)&v7 touchesBegan:a3 withEvent:a4];
  id v5 = [(UIGestureRecognizer *)self view];
  [(UITapGestureRecognizer *)self locationInView:v5];
  int64_t v6 = -[_UIBarTapGestureRecognizer _categoryForTapLocation:](self, "_categoryForTapLocation:");

  if (self->_failWhenTappingInBars && (v6 == 4 || v6 == 2)) {
    [(UIGestureRecognizer *)self setState:5];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)_UIBarTapGestureRecognizer;
  [(UITapGestureRecognizer *)&v6 touchesEnded:a3 withEvent:a4];
  if ([(UIGestureRecognizer *)self state] == UIGestureRecognizerStateEnded)
  {
    id v5 = [(UIGestureRecognizer *)self view];
    [(UITapGestureRecognizer *)self locationInView:v5];
    self->_tapCategordouble y = -[_UIBarTapGestureRecognizer _categoryForTapLocation:](self, "_categoryForTapLocation:");
  }
  else
  {
    self->_tapCategordouble y = 0;
  }
}

- (id)description
{
  tapCategordouble y = self->_tapCategory;
  if (tapCategory > 5) {
    v3 = &stru_1ED0E84C0;
  }
  else {
    v3 = off_1E52DDE30[tapCategory];
  }
  v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_UIBarTapGestureRecognizer;
  id v5 = [(UIGestureRecognizer *)&v8 description];
  objc_super v6 = [v4 stringWithFormat:@"%@ tapCategory=%@", v5, v3];

  return v6;
}

- (int64_t)tapCategory
{
  return self->_tapCategory;
}

- (BOOL)failWhenTappingInBars
{
  return self->_failWhenTappingInBars;
}

- (void)setFailWhenTappingInBars:(BOOL)a3
{
  self->_failWhenTappingInBars = a3;
}

@end