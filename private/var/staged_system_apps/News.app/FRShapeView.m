@interface FRShapeView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (FRShapeView)initWithFrame:(CGRect)a3;
- (UIBezierPath)path;
- (UIColor)fillColor;
- (UIColor)strokeColor;
- (double)lineWidth;
- (void)setFillColor:(id)a3;
- (void)setLineWidth:(double)a3;
- (void)setPath:(id)a3;
- (void)setStrokeColor:(id)a3;
@end

@implementation FRShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (FRShapeView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)FRShapeView;
  v3 = -[FRShapeView initWithFrame:](&v8, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[FRMacros deviceScreenScaleFromPotentialBackgroundThread];
    double v5 = v4;
    v6 = [(FRShapeView *)v3 layer];
    [v6 setContentsScale:v5];
  }
  return v3;
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  double v5 = (UIBezierPath *)[v4 copy];
  path = self->_path;
  self->_path = v5;

  id v7 = v4;
  id v8 = [v7 CGPath];

  v9 = [(FRShapeView *)self layer];
  [v9 setPath:v8];

  [(FRShapeView *)self invalidateIntrinsicContentSize];
}

- (void)setFillColor:(id)a3
{
  objc_storeStrong((id *)&self->_fillColor, a3);
  id v5 = a3;
  id v6 = [v5 CGColor];

  id v7 = [(FRShapeView *)self layer];
  [v7 setFillColor:v6];
}

- (void)setStrokeColor:(id)a3
{
  objc_storeStrong((id *)&self->_strokeColor, a3);
  id v5 = a3;
  id v6 = [v5 CGColor];

  id v7 = [(FRShapeView *)self layer];
  [v7 setStrokeColor:v6];
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
  id v4 = [(FRShapeView *)self layer];
  [v4 setLineWidth:a3];
}

- (CGSize)intrinsicContentSize
{
  v3 = [(FRShapeView *)self path];
  [v3 bounds];
  double Width = CGRectGetWidth(v16);
  id v5 = [(FRShapeView *)self path];
  [v5 lineWidth];
  double v7 = Width + v6;
  id v8 = [(FRShapeView *)self path];
  [v8 bounds];
  double Height = CGRectGetHeight(v17);
  v10 = [(FRShapeView *)self path];
  [v10 lineWidth];
  double v12 = Height + v11;

  double v13 = v7;
  double v14 = v12;
  result.height = v14;
  result.width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(FRShapeView *)self intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (qword_1000EE3B0 != -1) {
    dispatch_once(&qword_1000EE3B0, &stru_1000CA020);
  }
  v7.receiver = self;
  v7.super_class = (Class)FRShapeView;
  if ([(FRShapeView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    unsigned __int8 v5 = 1;
  }
  else {
    unsigned __int8 v5 = [(id)qword_1000EE3A8 containsObject:v4];
  }

  return v5;
}

- (UIBezierPath)path
{
  return self->_path;
}

- (UIColor)fillColor
{
  return self->_fillColor;
}

- (UIColor)strokeColor
{
  return self->_strokeColor;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeColor, 0);
  objc_storeStrong((id *)&self->_fillColor, 0);

  objc_storeStrong((id *)&self->_path, 0);
}

@end