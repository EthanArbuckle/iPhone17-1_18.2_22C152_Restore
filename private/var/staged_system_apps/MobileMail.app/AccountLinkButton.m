@interface AccountLinkButton
- (AccountLinkButton)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation AccountLinkButton

- (AccountLinkButton)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)AccountLinkButton;
  v3 = -[AccountLinkButton initWithFrame:](&v13, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v5 = [(AccountLinkButton *)v3 titleLabel];
    [v5 setShadowOffset:0.0, 1.0];

    v6 = +[UIFont boldSystemFontOfSize:16.0];
    v7 = [(AccountLinkButton *)v4 titleLabel];
    [v7 setFont:v6];

    v8 = +[UIColor colorWithRed:0.298039228 green:0.337254912 blue:0.423529416 alpha:1.0];
    [(AccountLinkButton *)v4 setTitleColor:v8 forState:0];

    v9 = +[UIColor whiteColor];
    [(AccountLinkButton *)v4 setTitleShadowColor:v9 forState:0];

    v10 = +[UIColor whiteColor];
    [(AccountLinkButton *)v4 setTitleColor:v10 forState:1];

    v11 = +[UIColor clearColor];
    [(AccountLinkButton *)v4 setTitleShadowColor:v11 forState:1];
  }
  return v4;
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AccountLinkButton;
  [(AccountLinkButton *)&v4 setHighlighted:a3];
  [(AccountLinkButton *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  [(AccountLinkButton *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(AccountLinkButton *)self isHighlighted])
  {
    v12 = +[UIColor colorWithWhite:0.0 alpha:0.400000006];
    [v12 set];

    objc_super v13 = +[UIBezierPath roundedRectBezierPath:withRoundedCorners:withCornerRadius:](UIBezierPath, "roundedRectBezierPath:withRoundedCorners:withCornerRadius:", -1, v5, v7, v9, v11, 4.0);
    [v13 fill];
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  id v15 = [(AccountLinkButton *)self state];
  v16 = [(AccountLinkButton *)self titleColorForState:v15];
  [v16 set];

  -[AccountLinkButton contentRectForBounds:](self, "contentRectForBounds:", v5, v7, v9, v11);
  -[AccountLinkButton titleRectForContentRect:](self, "titleRectForContentRect:");
  CGFloat x = v30.origin.x;
  CGFloat y = v30.origin.y;
  CGFloat width = v30.size.width;
  CGFloat height = v30.size.height;
  CGFloat MinX = CGRectGetMinX(v30);
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  double v22 = CGRectGetMaxY(v31) + -2.0;
  v32.origin.CGFloat x = x;
  v32.origin.CGFloat y = y;
  v32.size.CGFloat width = width;
  v32.size.CGFloat height = height;
  CGFloat v23 = CGRectGetWidth(v32);
  v33.size.CGFloat height = 1.0;
  v33.origin.CGFloat x = MinX;
  v33.origin.CGFloat y = v22;
  v33.size.CGFloat width = v23;
  CGContextFillRect(CurrentContext, v33);
  v24 = [(AccountLinkButton *)self titleShadowColorForState:v15];
  [v24 set];

  double v26 = 1.0;
  CGFloat v27 = MinX;
  CGFloat v28 = v23;

  double v25 = v22 + 1.0;
  CGContextFillRect(CurrentContext, *(CGRect *)&v27);
}

@end