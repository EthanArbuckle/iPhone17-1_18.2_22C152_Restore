@interface SBUIShapeView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (void)setFillColor:(id)a3;
- (void)setFillRule:(int64_t)a3;
- (void)setPath:(id)a3;
@end

@implementation SBUIShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)setPath:(id)a3
{
  id v4 = a3;
  id v7 = [(SBUIShapeView *)self _shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGPath];

  [v7 setPath:v6];
}

- (void)setFillColor:(id)a3
{
  id v4 = a3;
  id v7 = [(SBUIShapeView *)self _shapeLayer];
  id v5 = v4;
  uint64_t v6 = [v5 CGColor];

  [v7 setFillColor:v6];
}

- (void)setFillRule:(int64_t)a3
{
  id v4 = [(SBUIShapeView *)self _shapeLayer];
  id v6 = v4;
  id v5 = (void *)MEMORY[0x1E4F39FB8];
  if (a3 != 1) {
    id v5 = (void *)MEMORY[0x1E4F39FC0];
  }
  [v4 setFillRule:*v5];
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBUIShapeView;
  if ([(SBUIShapeView *)&v7 _shouldAnimatePropertyWithKey:v4]) {
    char v5 = 1;
  }
  else {
    char v5 = [v4 isEqualToString:@"path"];
  }

  return v5;
}

@end