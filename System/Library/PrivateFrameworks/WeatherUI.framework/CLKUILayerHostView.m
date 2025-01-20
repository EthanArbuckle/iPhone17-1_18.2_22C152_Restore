@interface CLKUILayerHostView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIView)superviewDelegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setSuperviewDelegate:(id)a3;
@end

@implementation CLKUILayerHostView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(CLKUILayerHostView *)self superviewDelegate];
  v9 = objc_msgSend(v8, "hitTest:withEvent:", v7, x, y);

  return v9;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(CLKUILayerHostView *)self superviewDelegate];
  char v9 = objc_msgSend(v8, "pointInside:withEvent:", v7, x, y);

  return v9;
}

- (UIView)superviewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_superviewDelegate);
  return (UIView *)WeakRetained;
}

- (void)setSuperviewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end