@interface PNPPlatterShadowView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (CGSize)shadowOffset;
- (UIBezierPath)shadowPath;
- (UIColor)shadowColor;
- (double)shadowOpacity;
- (double)shadowRadius;
- (void)setShadowColor:(id)a3;
- (void)setShadowOffset:(CGSize)a3;
- (void)setShadowOpacity:(double)a3;
- (void)setShadowPath:(id)a3;
- (void)setShadowRadius:(double)a3;
@end

@implementation PNPPlatterShadowView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PNPPlatterShadowView;
  if ([(PNPPlatterShadowView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 containsString:@"shadow"];
  }

  return v5;
}

- (void)setShadowColor:(id)a3
{
  id v4 = a3;
  id v7 = [(PNPPlatterShadowView *)self layer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setShadowColor:v6];
}

- (UIColor)shadowColor
{
  v2 = (void *)MEMORY[0x263F1C550];
  v3 = [(PNPPlatterShadowView *)self layer];
  id v4 = objc_msgSend(v2, "colorWithCGColor:", objc_msgSend(v3, "shadowColor"));

  return (UIColor *)v4;
}

- (void)setShadowOffset:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v5 = [(PNPPlatterShadowView *)self layer];
  objc_msgSend(v5, "setShadowOffset:", width, height);
}

- (CGSize)shadowOffset
{
  v2 = [(PNPPlatterShadowView *)self layer];
  [v2 shadowOffset];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)setShadowOpacity:(double)a3
{
  id v5 = [(PNPPlatterShadowView *)self layer];
  *(float *)&double v4 = a3;
  [v5 setShadowOpacity:v4];
}

- (double)shadowOpacity
{
  v2 = [(PNPPlatterShadowView *)self layer];
  [v2 shadowOpacity];
  double v4 = v3;

  return v4;
}

- (void)setShadowRadius:(double)a3
{
  id v4 = [(PNPPlatterShadowView *)self layer];
  [v4 setShadowRadius:a3];
}

- (double)shadowRadius
{
  v2 = [(PNPPlatterShadowView *)self layer];
  [v2 shadowRadius];
  double v4 = v3;

  return v4;
}

- (void)setShadowPath:(id)a3
{
  id v4 = a3;
  id v7 = [(PNPPlatterShadowView *)self layer];
  id v5 = v4;
  uint64_t v6 = [v5 CGPath];

  [v7 setShadowPath:v6];
}

- (UIBezierPath)shadowPath
{
  v2 = (void *)MEMORY[0x263F1C478];
  double v3 = [(PNPPlatterShadowView *)self layer];
  id v4 = objc_msgSend(v2, "bezierPathWithCGPath:", objc_msgSend(v3, "shadowPath"));

  return (UIBezierPath *)v4;
}

@end