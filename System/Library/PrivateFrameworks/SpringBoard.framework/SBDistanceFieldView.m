@interface SBDistanceFieldView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)invertsShape;
- (CGColor)foregroundColor;
- (NSString)renderMode;
- (double)lineWidth;
- (double)offset;
- (double)sharpness;
- (void)setForegroundColor:(CGColor *)a3;
- (void)setInvertsShape:(BOOL)a3;
- (void)setLineWidth:(double)a3;
- (void)setOffset:(double)a3;
- (void)setRenderMode:(id)a3;
- (void)setSharpness:(double)a3;
@end

@implementation SBDistanceFieldView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBDistanceFieldView;
  if ([(SBDistanceFieldView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"foregroundColor"] & 1) != 0
    || ([v4 isEqualToString:@"sharpness"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"offset"];
  }

  return v5;
}

- (NSString)renderMode
{
  v2 = [(SBDistanceFieldView *)self layer];
  v3 = [v2 renderMode];

  return (NSString *)v3;
}

- (void)setRenderMode:(id)a3
{
  id v4 = a3;
  id v5 = [(SBDistanceFieldView *)self layer];
  [v5 setRenderMode:v4];
}

- (BOOL)invertsShape
{
  v2 = [(SBDistanceFieldView *)self layer];
  char v3 = [v2 invertsShape];

  return v3;
}

- (void)setInvertsShape:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(SBDistanceFieldView *)self layer];
  [v4 setInvertsShape:v3];
}

- (CGColor)foregroundColor
{
  v2 = [(SBDistanceFieldView *)self layer];
  BOOL v3 = (CGColor *)[v2 foregroundColor];

  return v3;
}

- (void)setForegroundColor:(CGColor *)a3
{
  id v4 = [(SBDistanceFieldView *)self layer];
  [v4 setForegroundColor:a3];
}

- (double)offset
{
  v2 = [(SBDistanceFieldView *)self layer];
  [v2 offset];
  double v4 = v3;

  return v4;
}

- (void)setOffset:(double)a3
{
  id v4 = [(SBDistanceFieldView *)self layer];
  [v4 setOffset:a3];
}

- (double)sharpness
{
  v2 = [(SBDistanceFieldView *)self layer];
  [v2 sharpness];
  double v4 = v3;

  return v4;
}

- (void)setSharpness:(double)a3
{
  id v4 = [(SBDistanceFieldView *)self layer];
  [v4 setSharpness:a3];
}

- (double)lineWidth
{
  v2 = [(SBDistanceFieldView *)self layer];
  [v2 lineWidth];
  double v4 = v3;

  return v4;
}

- (void)setLineWidth:(double)a3
{
  id v4 = [(SBDistanceFieldView *)self layer];
  [v4 setLineWidth:a3];
}

@end