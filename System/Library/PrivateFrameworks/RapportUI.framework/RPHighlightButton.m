@interface RPHighlightButton
- (void)setHighlighted:(BOOL)a3;
@end

@implementation RPHighlightButton

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)RPHighlightButton;
  -[RPHighlightButton setHighlighted:](&v6, sel_setHighlighted_);
  double v5 = 1.0;
  if (v3) {
    double v5 = 0.5;
  }
  [(RPHighlightButton *)self setAlpha:v5];
}

@end