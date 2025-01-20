@interface TLKTapContainerButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (UIView)containerView;
- (void)setContainerView:(id)a3;
@end

@implementation TLKTapContainerButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  v8 = [(TLKTapContainerButton *)self containerView];
  if (v8)
  {
    v9 = [(TLKTapContainerButton *)self containerView];
    unsigned __int8 v10 = objc_msgSend(v9, "pointInside:withEvent:", v7, x, y);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TLKTapContainerButton;
    unsigned __int8 v10 = -[TLKTapContainerButton pointInside:withEvent:](&v12, sel_pointInside_withEvent_, v7, x, y);
  }

  return v10;
}

- (UIView)containerView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerView);
  return (UIView *)WeakRetained;
}

- (void)setContainerView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end