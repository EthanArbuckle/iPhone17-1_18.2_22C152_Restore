@interface TUIDrawingView
+ (Class)layerClass;
- (UIBezierPath)path;
- (void)setPath:(id)a3;
@end

@implementation TUIDrawingView

- (void).cxx_destruct
{
}

- (UIBezierPath)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
  id v5 = a3;
  id v8 = [(TUIDrawingView *)self shapeLayer];
  id v6 = v5;
  uint64_t v7 = [v6 CGPath];

  [v8 setPath:v7];
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end