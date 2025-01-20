@interface UIView
- (CALayer)currentLayer;
- (id)rotateView:(id)a3 byAngle:(double)a4;
@end

@implementation UIView

- (CALayer)currentLayer
{
  v3 = [(UIView *)self layer];
  v4 = [v3 presentationLayer];

  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(UIView *)self layer];
  }
  v6 = v5;

  return (CALayer *)v6;
}

- (id)rotateView:(id)a3 byAngle:(double)a4
{
  return 0;
}

@end