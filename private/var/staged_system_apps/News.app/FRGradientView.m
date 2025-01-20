@interface FRGradientView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (BOOL)passThroughTouches;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGPoint)endPoint;
- (CGPoint)startPoint;
- (NSArray)colors;
- (NSArray)locations;
- (void)setColors:(id)a3;
- (void)setEndPoint:(CGPoint)a3;
- (void)setLocations:(id)a3;
- (void)setPassThroughTouches:(BOOL)a3;
- (void)setStartPoint:(CGPoint)a3;
@end

@implementation FRGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (NSArray)colors
{
  v2 = [(FRGradientView *)self layer];
  v3 = [v2 colors];

  return (NSArray *)v3;
}

- (void)setColors:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v11;
          v13 = [v12 CGColor:v16];
          [v5 addObject:v13];
        }
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  id v14 = [v5 copy];
  v15 = [(FRGradientView *)self layer];
  [v15 setColors:v14];
}

- (NSArray)locations
{
  v2 = [(FRGradientView *)self layer];
  v3 = [v2 locations];

  return (NSArray *)v3;
}

- (void)setLocations:(id)a3
{
  id v4 = a3;
  id v5 = [(FRGradientView *)self layer];
  [v5 setLocations:v4];
}

- (CGPoint)startPoint
{
  v2 = [(FRGradientView *)self layer];
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
  id v5 = [(FRGradientView *)self layer];
  [v5 setStartPoint:x, y];
}

- (CGPoint)endPoint
{
  v2 = [(FRGradientView *)self layer];
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
  id v5 = [(FRGradientView *)self layer];
  [v5 setEndPoint:x, y];
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(FRGradientView *)self passThroughTouches])
  {
    BOOL v8 = 0;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)FRGradientView;
    BOOL v8 = -[FRGradientView pointInside:withEvent:](&v10, "pointInside:withEvent:", v7, x, y);
  }

  return v8;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FRGradientView;
  if ([(FRGradientView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"colors"] & 1) != 0
    || ([v4 isEqualToString:@"startPoint"] & 1) != 0
    || ([v4 isEqualToString:@"endPoint"] & 1) != 0)
  {
    unsigned __int8 v5 = 1;
  }
  else
  {
    unsigned __int8 v5 = [v4 isEqualToString:@"locations"];
  }

  return v5;
}

- (BOOL)passThroughTouches
{
  return self->_passThroughTouches;
}

- (void)setPassThroughTouches:(BOOL)a3
{
  self->_passThroughTouches = a3;
}

@end