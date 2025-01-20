@interface UIButton
- (void)rc_setEnabled:(BOOL)a3;
@end

@implementation UIButton

- (void)rc_setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIButton setUserInteractionEnabled:](self, "setUserInteractionEnabled:");
  double v5 = 0.2;
  if (v3) {
    double v5 = 1.0;
  }
  [(UIButton *)self setAlpha:v5];

  [(UIButton *)self setNeedsUpdateConfiguration];
}

@end