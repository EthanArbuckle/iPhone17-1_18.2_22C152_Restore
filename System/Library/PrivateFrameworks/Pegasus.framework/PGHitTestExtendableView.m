@interface PGHitTestExtendableView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIView)hitTestExtenderView;
- (void)setHitTestExtenderView:(id)a3;
@end

@implementation PGHitTestExtendableView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PGHitTestExtendableView;
  unsigned __int8 v8 = -[PGHitTestExtendableView pointInside:withEvent:](&v13, sel_pointInside_withEvent_, v7, x, y);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestExtenderView);

  if (WeakRetained)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_hitTestExtenderView);
    -[PGHitTestExtendableView convertPoint:toView:](self, "convertPoint:toView:", v10, x, y);
    char v11 = objc_msgSend(v10, "pointInside:withEvent:", v7);

    v8 |= v11;
  }

  return v8;
}

- (UIView)hitTestExtenderView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestExtenderView);

  return (UIView *)WeakRetained;
}

- (void)setHitTestExtenderView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end