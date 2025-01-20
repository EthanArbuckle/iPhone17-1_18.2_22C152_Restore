@interface _UIBarCustomizationReservoirCell
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_UIBarCustomizationChiclet)chiclet;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setChiclet:(id)a3;
@end

@implementation _UIBarCustomizationReservoirCell

- (void)setChiclet:(id)a3
{
  v5 = (_UIBarCustomizationChiclet *)a3;
  p_chiclet = &self->_chiclet;
  chiclet = self->_chiclet;
  if (chiclet != v5)
  {
    v11 = v5;
    v8 = [(UIView *)chiclet superview];
    v9 = [(UICollectionViewCell *)self contentView];

    if (v8 == v9) {
      [(UIView *)*p_chiclet removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_chiclet, a3);
    v10 = [(UICollectionViewCell *)self contentView];
    [v10 addSubview:*p_chiclet];

    v5 = v11;
  }
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)_UIBarCustomizationReservoirCell;
  [(UICollectionViewCell *)&v11 layoutSubviews];
  v3 = [(UICollectionViewCell *)self contentView];
  [v3 bounds];
  double v6 = v5 + v4 * 0.5;
  double v9 = v8 + v7 * 0.5;
  v10 = [(_UIBarCustomizationReservoirCell *)self chiclet];
  objc_msgSend(v10, "setCenter:", v6, v9);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIBarCustomizationReservoirCell *)self chiclet];
  if (v8)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    char v9 = objc_msgSend(v8, "pointInside:withEvent:", v7);
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  double v8 = [(_UIBarCustomizationReservoirCell *)self chiclet];
  if (v8)
  {
    char v9 = [(_UIBarCustomizationReservoirCell *)self chiclet];
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v9, x, y);
    v10 = objc_msgSend(v9, "hitTest:withEvent:", v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (_UIBarCustomizationChiclet)chiclet
{
  return self->_chiclet;
}

- (void).cxx_destruct
{
}

@end