@interface SBPIPHitTestExtendableView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIView)hitTestExtenderView;
- (void)setHitTestExtenderView:(id)a3;
@end

@implementation SBPIPHitTestExtendableView

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBPIPHitTestExtendableView;
  unsigned int v8 = -[SBPIPHitTestExtendableView pointInside:withEvent:](&v11, sel_pointInside_withEvent_, v7, x, y);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hitTestExtenderView);
  if (WeakRetained)
  {
    -[SBPIPHitTestExtendableView convertPoint:toView:](self, "convertPoint:toView:", WeakRetained, x, y);
    v8 |= objc_msgSend(WeakRetained, "pointInside:withEvent:", v7);
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