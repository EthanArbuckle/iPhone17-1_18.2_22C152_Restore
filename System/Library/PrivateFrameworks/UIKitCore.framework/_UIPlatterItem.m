@interface _UIPlatterItem
- (CGAffineTransform)transform;
- (CGPoint)center;
- (CGRect)bounds;
- (UIView)heldView;
- (_UIPlatterItem)initWithView:(id)a3;
- (void)setCenter:(CGPoint)a3;
@end

@implementation _UIPlatterItem

- (_UIPlatterItem)initWithView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPlatterItem;
  v5 = [(_UIPlatterItem *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_heldView, v4);
  }

  return v6;
}

- (void)setCenter:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heldView);
  objc_msgSend(WeakRetained, "setCenter:", x, y);
}

- (CGPoint)center
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heldView);
  [WeakRetained center];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (CGAffineTransform)transform
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heldView);
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    [WeakRetained transform];
    id WeakRetained = v6;
  }
  else
  {
    *(_OWORD *)&retstr->c = 0u;
    *(_OWORD *)&retstr->tdouble x = 0u;
    *(_OWORD *)&retstr->a = 0u;
  }

  return result;
}

- (CGRect)bounds
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heldView);
  [WeakRetained bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (UIView)heldView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_heldView);
  return (UIView *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end