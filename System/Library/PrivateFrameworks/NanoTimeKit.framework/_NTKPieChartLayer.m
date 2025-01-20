@interface _NTKPieChartLayer
+ (BOOL)needsDisplayForKey:(id)a3;
- (_NTKPieChartLayer)init;
- (id)actionForKey:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation _NTKPieChartLayer

- (_NTKPieChartLayer)init
{
  v5.receiver = self;
  v5.super_class = (Class)_NTKPieChartLayer;
  v2 = [(_NTKPieChartLayer *)&v5 init];
  v3 = v2;
  if (v2) {
    [(_NTKPieChartLayer *)v2 setProgress:0.01];
  }
  return v3;
}

+ (BOOL)needsDisplayForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"progress"])
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS____NTKPieChartLayer;
    unsigned __int8 v5 = objc_msgSendSuper2(&v7, sel_needsDisplayForKey_, v4);
  }

  return v5;
}

- (id)actionForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"progress"])
  {
    unsigned __int8 v5 = [MEMORY[0x1E4F39B48] animationWithKeyPath:v4];
    v6 = [(_NTKPieChartLayer *)self presentationLayer];
    objc_super v7 = [v6 valueForKey:v4];
    [v5 setFromValue:v7];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)_NTKPieChartLayer;
    unsigned __int8 v5 = [(_NTKPieChartLayer *)&v9 actionForKey:v4];
  }

  return v5;
}

- (void)drawInContext:(CGContext *)a3
{
  [(_NTKPieChartLayer *)self progress];
  CLKInterpolateBetweenFloatsClipped();
  double v6 = v5;
  id v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.7];
  v8 = (CGColor *)[v7 CGColor];

  CGContextSetFillColorWithColor(a3, v8);
  [(_NTKPieChartLayer *)self bounds];
  double MidX = CGRectGetMidX(v13);
  [(_NTKPieChartLayer *)self bounds];
  double MidY = CGRectGetMidY(v14);
  if (MidX >= MidY) {
    double MidX = MidY;
  }
  [(_NTKPieChartLayer *)self bounds];
  CGFloat v11 = CGRectGetMidY(v15);
  CGContextMoveToPoint(a3, MidX, v11);
  CGContextAddArc(a3, MidX, v11, MidX, -1.57079633, (v6 + v6) * 3.14159265 + -1.57079633, 1);
  CGContextClosePath(a3);
  CGContextFillPath(a3);
  v12.receiver = self;
  v12.super_class = (Class)_NTKPieChartLayer;
  [(_NTKPieChartLayer *)&v12 drawInContext:a3];
}

@end