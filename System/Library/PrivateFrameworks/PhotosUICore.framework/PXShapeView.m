@interface PXShapeView
+ (Class)layerClass;
- (UIBezierPath)path;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (void)setFillColor:(id)a3;
- (void)setPath:(id)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation PXShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setStrokeColor:(id)a3
{
  v9 = (UIColor *)a3;
  v5 = self->_strokeColor;
  v6 = v9;
  if (v5 != v9)
  {
    char v7 = [(UIColor *)v9 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_strokeColor, a3);
    v8 = [(UIColor *)self->_strokeColor CGColor];
    v6 = [(PXShapeView *)self shapeLayer];
    [v6 setStrokeColor:v8];
  }

LABEL_5:
}

- (void)setFillColor:(id)a3
{
  v9 = (UIColor *)a3;
  v5 = self->_fillColor;
  v6 = v9;
  if (v5 != v9)
  {
    char v7 = [(UIColor *)v9 isEqual:v5];

    if (v7) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_fillColor, a3);
    v8 = [(UIColor *)self->_fillColor CGColor];
    v6 = [(PXShapeView *)self shapeLayer];
    [v6 setFillColor:v8];
  }

LABEL_5:
}

- (void)setPath:(id)a3
{
  id v11 = a3;
  if (([v11 isEqual:self->_path] & 1) == 0)
  {
    v4 = (UIBezierPath *)[v11 copy];
    path = self->_path;
    self->_path = v4;

    v6 = [(PXShapeView *)self shapeLayer];
    id v7 = v11;
    objc_msgSend(v6, "setPath:", objc_msgSend(v7, "CGPath"));
    [v7 lineWidth];
    objc_msgSend(v6, "setLineWidth:");
    LODWORD(v7) = [v7 usesEvenOddFillRule];
    v8 = [(PXShapeView *)self shapeLayer];
    v9 = v8;
    if (v7) {
      v10 = @"even-odd";
    }
    else {
      v10 = @"non-zero";
    }
    [v8 setFillRule:v10];
  }
}

@end