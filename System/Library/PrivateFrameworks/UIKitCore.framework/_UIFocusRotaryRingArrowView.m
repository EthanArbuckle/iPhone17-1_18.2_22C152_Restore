@interface _UIFocusRotaryRingArrowView
- (_UIFocusRotaryRingArrowView)initWithFrame:(CGRect)a3 color:(id)a4;
- (id)_trianglePath;
- (void)_updateShapePath;
- (void)layoutSubviews;
- (void)updateArrowColor:(id)a3;
@end

@implementation _UIFocusRotaryRingArrowView

- (_UIFocusRotaryRingArrowView)initWithFrame:(CGRect)a3 color:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)_UIFocusRotaryRingArrowView;
  v10 = -[UIView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  if (v10)
  {
    v11 = (CAShapeLayer *)objc_alloc_init(MEMORY[0x1E4F39C88]);
    shapeLayer = v10->_shapeLayer;
    v10->_shapeLayer = v11;

    _UIFocusRotaryRingConfigureShadowForLayer(v10->_shapeLayer);
    v13 = [(UIView *)v10 layer];
    [v13 addSublayer:v10->_shapeLayer];

    [(UIView *)v10 setAutoresizingMask:0];
    [(_UIFocusRotaryRingArrowView *)v10 updateArrowColor:v9];
    [(_UIFocusRotaryRingArrowView *)v10 _updateShapePath];
  }

  return v10;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFocusRotaryRingArrowView;
  [(UIView *)&v3 layoutSubviews];
  [(_UIFocusRotaryRingArrowView *)self _updateShapePath];
}

- (void)updateArrowColor:(id)a3
{
  uint64_t v4 = [a3 CGColor];
  shapeLayer = self->_shapeLayer;
  [(CAShapeLayer *)shapeLayer setFillColor:v4];
}

- (void)_updateShapePath
{
  id v3 = [(_UIFocusRotaryRingArrowView *)self _trianglePath];
  -[CAShapeLayer setPath:](self->_shapeLayer, "setPath:", [v3 CGPath]);
}

- (id)_trianglePath
{
  [(UIView *)self bounds];
  CGFloat v3 = v2;
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  v10 = +[UIBezierPath bezierPath];
  v16.origin.double x = v3;
  v16.origin.double y = v5;
  v16.size.double width = v7;
  v16.size.double height = v9;
  double MinX = CGRectGetMinX(v16);
  v17.origin.double x = v3;
  v17.origin.double y = v5;
  v17.size.double width = v7;
  v17.size.double height = v9;
  objc_msgSend(v10, "moveToPoint:", MinX, CGRectGetMaxY(v17));
  v18.origin.double x = v3;
  v18.origin.double y = v5;
  v18.size.double width = v7;
  v18.size.double height = v9;
  double MidX = CGRectGetMidX(v18);
  v19.origin.double x = v3;
  v19.origin.double y = v5;
  v19.size.double width = v7;
  v19.size.double height = v9;
  objc_msgSend(v10, "addLineToPoint:", MidX, CGRectGetMinY(v19));
  v20.origin.double x = v3;
  v20.origin.double y = v5;
  v20.size.double width = v7;
  v20.size.double height = v9;
  double MaxX = CGRectGetMaxX(v20);
  v21.origin.double x = v3;
  v21.origin.double y = v5;
  v21.size.double width = v7;
  v21.size.double height = v9;
  objc_msgSend(v10, "addLineToPoint:", MaxX, CGRectGetMaxY(v21));
  [v10 closePath];
  return v10;
}

- (void).cxx_destruct
{
}

@end