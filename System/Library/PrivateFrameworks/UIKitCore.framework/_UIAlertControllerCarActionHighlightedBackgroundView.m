@interface _UIAlertControllerCarActionHighlightedBackgroundView
- (void)setCornerRadius:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRoundedCornerPosition:(unint64_t)a3;
- (void)tintColorDidChange;
@end

@implementation _UIAlertControllerCarActionHighlightedBackgroundView

- (void)tintColorDidChange
{
  id v3 = [(UIView *)self tintColor];
  [(UIView *)self setBackgroundColor:v3];
}

- (void)setCornerRadius:(double)a3
{
  id v4 = [(UIView *)self layer];
  [v4 setCornerRadius:a3];
}

- (void)setRoundedCornerPosition:(unint64_t)a3
{
  id v4 = [(UIView *)self layer];
  [v4 setMaskedCorners:a3];
}

- (void)setHighlighted:(BOOL)a3
{
}

@end