@interface BKGradientView
+ (Class)layerClass;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (id)color;
- (void)setColors:(id)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setLocations:(id)a3;
- (void)setStartPoint:(CGPoint)a3;
@end

@implementation BKGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (id)color
{
  v2 = [(BKGradientView *)self layer];
  v3 = [v2 colors];

  return v3;
}

- (void)setColors:(id)a3
{
  id v4 = a3;
  id v5 = [(BKGradientView *)self layer];
  [v5 setColors:v4];
}

- (NSArray)colors
{
  v2 = [(BKGradientView *)self layer];
  v3 = [v2 colors];

  return (NSArray *)v3;
}

- (NSArray)locations
{
  v2 = [(BKGradientView *)self layer];
  v3 = [v2 locations];

  return (NSArray *)v3;
}

- (void)setLocations:(id)a3
{
  id v4 = a3;
  id v5 = [(BKGradientView *)self layer];
  [v5 setLocations:v4];
}

- (CGPoint)startPoint
{
  v2 = [(BKGradientView *)self layer];
  [v2 startPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)setStartPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(BKGradientView *)self layer];
  [v5 setStartPoint:x, y];
}

- (CGPoint)endPoint
{
  v2 = [(BKGradientView *)self layer];
  [v2 endPoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.double y = v8;
  result.double x = v7;
  return result;
}

- (void)setEndPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = [(BKGradientView *)self layer];
  [v5 setEndPoint:x, y];
}

@end