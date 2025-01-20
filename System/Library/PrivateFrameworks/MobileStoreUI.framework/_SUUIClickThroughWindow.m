@interface _SUUIClickThroughWindow
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIView)interactionView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setInteractionView:(id)a3;
@end

@implementation _SUUIClickThroughWindow

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(_SUUIClickThroughWindow *)self interactionView];

  if (v8)
  {
    v9 = [(_SUUIClickThroughWindow *)self interactionView];
    -[_SUUIClickThroughWindow convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
    double v11 = v10;
    double v13 = v12;

    v14 = [(_SUUIClickThroughWindow *)self interactionView];
    char v15 = objc_msgSend(v14, "pointInside:withEvent:", v7, v11, v13);
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)_SUUIClickThroughWindow;
  -[_SUUIClickThroughWindow hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (_SUUIClickThroughWindow *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (UIView)interactionView
{
  return self->_interactionView;
}

- (void)setInteractionView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end