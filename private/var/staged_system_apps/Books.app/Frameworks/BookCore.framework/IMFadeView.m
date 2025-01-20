@interface IMFadeView
- (IMFadeView)initWithFrame:(CGRect)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setDirection:(int)a3;
@end

@implementation IMFadeView

- (IMFadeView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)IMFadeView;
  v3 = -[IMFadeView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(IMFadeView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (void)setBackgroundColor:(id)a3
{
  id v4 = a3;
  CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)[v4 CGColor], 0.0);
  id v6 = v4;
  id v7 = [v6 CGColor];

  v8 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v7, CopyWithAlpha, 0);
  v9 = [(IMGradientView *)self gradientLayer];
  [v9 setColors:v8];

  CGColorRelease(CopyWithAlpha);
}

- (void)setDirection:(int)a3
{
  switch(a3)
  {
    case 0:
      double y = CGPointZero.y;
      id v6 = [(IMGradientView *)self gradientLayer];
      [v6 setStartPoint:CGPointZero.x, y];

      id v7 = [(IMGradientView *)self gradientLayer];
      double x = 0.0;
      double v9 = 1.0;
      goto LABEL_5;
    case 1:
      v10 = [(IMGradientView *)self gradientLayer];
      v11 = v10;
      double v12 = 0.0;
      double v13 = 1.0;
      goto LABEL_7;
    case 2:
      double v14 = CGPointZero.y;
      v15 = [(IMGradientView *)self gradientLayer];
      [v15 setStartPoint:CGPointZero.x, v14];

      id v7 = [(IMGradientView *)self gradientLayer];
      double x = 1.0;
      double v9 = 0.0;
LABEL_5:
      id v17 = v7;
      goto LABEL_8;
    case 3:
      v10 = [(IMGradientView *)self gradientLayer];
      v11 = v10;
      double v12 = 1.0;
      double v13 = 0.0;
LABEL_7:
      [v10 setStartPoint:v12, v13];

      CGFloat v16 = CGPointZero.y;
      id v7 = [(IMGradientView *)self gradientLayer];
      id v17 = v7;
      double x = CGPointZero.x;
      double v9 = v16;
LABEL_8:
      [v7 setEndPoint:x v9];

      break;
    default:
      return;
  }
}

@end