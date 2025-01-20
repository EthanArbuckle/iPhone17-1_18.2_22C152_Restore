@interface TSKReverseShadowButton
- (void)setHighlighted:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation TSKReverseShadowButton

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = (void *)[(TSKReverseShadowButton *)self titleLabel];
  double v6 = -1.0;
  if (!v3) {
    double v6 = 1.0;
  }
  objc_msgSend(v5, "setShadowOffset:", 0.0, v6);
  [(TSKReverseShadowButton *)self setNeedsDisplay];
  v7.receiver = self;
  v7.super_class = (Class)TSKReverseShadowButton;
  [(TSKReverseShadowButton *)&v7 setSelected:v3];
}

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    objc_msgSend((id)-[TSKReverseShadowButton titleLabel](self, "titleLabel"), "setShadowOffset:", 0.0, 1.0);
  }
  [(TSKReverseShadowButton *)self setNeedsDisplay];
  v5.receiver = self;
  v5.super_class = (Class)TSKReverseShadowButton;
  [(TSKReverseShadowButton *)&v5 setHighlighted:v3];
}

@end