@interface CAScrollLayer
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4;
@end

@implementation CAScrollLayer

- (void)setContentOffset:(CGPoint)a3
{
}

- (void)setContentOffset:(CGPoint)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  [(CAScrollLayer *)self bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  TSDRectWithOriginAndSize();
  -[CAScrollLayer setBounds:](self, "setBounds:");
  if (v4)
  {
    v14 = +[CABasicAnimation animationWithKeyPath:@"bounds"];
    [(CABasicAnimation *)v14 setDuration:0.2];
    [(CABasicAnimation *)v14 setTimingFunction:+[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [(CABasicAnimation *)v14 setFromValue:+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v7, v9, v11, v13)];
    [(CAScrollLayer *)self addAnimation:v14 forKey:@"scrollAnimation"];
  }
}

@end