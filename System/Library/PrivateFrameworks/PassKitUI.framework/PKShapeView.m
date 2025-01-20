@interface PKShapeView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CAShapeLayer)shapeLayer;
- (PKShapeView)initWithFrame:(CGRect)a3;
@end

@implementation PKShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (PKShapeView)initWithFrame:(CGRect)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PKShapeView;
  v3 = -[PKShapeView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1618] blackColor];
    v5 = CGColorRetain((CGColorRef)[v4 CGColor]);

    uint64_t v6 = [(PKShapeView *)v3 layer];
    shapeLayer = v3->_shapeLayer;
    v3->_shapeLayer = (CAShapeLayer *)v6;

    [(CAShapeLayer *)v3->_shapeLayer setFillColor:v5];
    [(CAShapeLayer *)v3->_shapeLayer setStrokeColor:v5];
    CGColorRelease(v5);
  }
  return v3;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"path"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PKShapeView;
    BOOL v5 = [(PKShapeView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (CAShapeLayer)shapeLayer
{
  return self->_shapeLayer;
}

- (void).cxx_destruct
{
}

@end