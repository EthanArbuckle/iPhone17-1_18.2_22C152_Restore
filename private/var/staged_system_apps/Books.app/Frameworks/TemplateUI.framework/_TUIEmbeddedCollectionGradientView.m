@interface _TUIEmbeddedCollectionGradientView
+ (Class)layerClass;
- (void)configureGradientWithAxis:(unint64_t)a3 leading:(BOOL)a4;
@end

@implementation _TUIEmbeddedCollectionGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)configureGradientWithAxis:(unint64_t)a3 leading:(BOOL)a4
{
  BOOL v4 = a4;
  v6 = [(_TUIEmbeddedCollectionGradientView *)self gradientLayer];
  [v6 setCompositingFilter:kCAFilterDestOut];
  double v7 = (double)!v4;
  if (a3 == 2) {
    double v8 = 0.5;
  }
  else {
    double v8 = (double)!v4;
  }
  if (a3 == 2)
  {
    double v9 = 0.5;
  }
  else
  {
    double v7 = 0.5;
    double v9 = (double)v4;
  }
  if (a3 == 2) {
    double v10 = (double)v4;
  }
  else {
    double v10 = 0.5;
  }
  [v6 setStartPoint:v8, v7, (double)v4];
  [v6 setEndPoint:v9, v10];
  id v11 = +[UIColor blackColor];
  v14[0] = [v11 CGColor];
  id v12 = +[UIColor clearColor];
  v14[1] = [v12 CGColor];
  v13 = +[NSArray arrayWithObjects:v14 count:2];
  [v6 setColors:v13];
}

@end