@interface CarCardRoundedButton
+ ($3CC2805F0189FCCE51047C0D2B5A52A9)buttonMetrics;
+ (CarCardRoundedButton)buttonWithType:(int64_t)a3;
+ (id)button;
- (CGRect)imageRectForContentRect:(CGRect)a3;
- (CGRect)titleRectForContentRect:(CGRect)a3;
- (CarCardRoundedButton)initWithFrame:(CGRect)a3;
- (void)_commonInit;
- (void)layoutSubviews;
@end

@implementation CarCardRoundedButton

+ ($3CC2805F0189FCCE51047C0D2B5A52A9)buttonMetrics
{
  *(_OWORD *)&retstr->var0 = xmmword_100F6F990;
  *(_OWORD *)&retstr->var2 = unk_100F6F9A0;
  retstr->var4 = 36.0;
  return result;
}

+ (id)button
{
  return [a1 buttonWithType:0];
}

+ (CarCardRoundedButton)buttonWithType:(int64_t)a3
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___CarCardRoundedButton;
  v3 = [super buttonWithType:a3];
  [v3 _commonInit];

  return (CarCardRoundedButton *)v3;
}

- (CarCardRoundedButton)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CarCardRoundedButton;
  v3 = -[CarFocusableButton initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(CarCardRoundedButton *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  v3 = [(CarCardRoundedButton *)self layer];
  [v3 setCornerRadius:4.0];

  v4 = [(CarCardRoundedButton *)self layer];
  [v4 setMasksToBounds:1];

  [(CarCardRoundedButton *)self setContentHorizontalAlignment:0];
  [(CarCardRoundedButton *)self setContentVerticalAlignment:0];
  objc_super v5 = [(CarCardRoundedButton *)self titleLabel];
  [v5 setAccessibilityIdentifier:@"TitleLabel"];

  objc_super v6 = [(CarCardRoundedButton *)self titleLabel];
  [v6 setTextAlignment:4];

  v7 = [(CarCardRoundedButton *)self titleLabel];
  v8 = +[UIFont systemFontOfSize:15.0 weight:UIFontWeightMedium];
  [v7 setFont:v8];

  v9 = [(CarCardRoundedButton *)self imageView];
  [v9 setAccessibilityIdentifier:@"ImageView"];

  v10 = [(CarCardRoundedButton *)self imageView];
  [v10 setContentMode:1];

  [(CarFocusableButton *)self setModifiesBackgroundColor:1];
  [(CarFocusableButton *)self setAdjustsImageWhenDisabled:0];
  [(CarFocusableButton *)self setAdjustsImageWhenHighlighted:0];
  v11 = +[UIColor labelColor];
  [(CarFocusableButton *)self setNonFocusedTintColor:v11];

  v12 = +[UIColor _carSystemFocusLabelColor];
  [(CarFocusableButton *)self setFocusedTintColor:v12];

  v13 = sub_100D899B8();
  [(CarFocusableButton *)self setNonFocusedBackgroundColor:v13];

  id v14 = +[UIColor _carSystemFocusColor];
  [(CarFocusableButton *)self setFocusedBackgroundColor:v14];
}

- (CGRect)imageRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(CarCardRoundedButton *)self currentTitle];
  if (v8)
  {
    BOOL v9 = 0;
  }
  else
  {
    v10 = [(CarCardRoundedButton *)self currentAttributedTitle];
    BOOL v9 = v10 == 0;
  }
  v11 = [(CarCardRoundedButton *)self currentImage];
  v12 = v11;
  if (!v11 || v9)
  {
    v34.receiver = self;
    v34.super_class = (Class)CarCardRoundedButton;
    -[CarCardRoundedButton imageRectForContentRect:](&v34, "imageRectForContentRect:", x, y, width, height);
  }
  else
  {
    [v11 size];
    double v14 = 0.0;
    if (41.0 - v13 > 0.0)
    {
      [v12 size];
      double v14 = (41.0 - v15) * 0.5;
    }
    [v12 size];
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    -[CarCardRoundedButton titleRectForContentRect:](self, "titleRectForContentRect:", x, y, width, height);
    double MidY = CGRectGetMidY(v35);
    [v12 size];
    double v22 = sub_1005F854C(v14, MidY + v21 * -0.5, v17, v19, x, y, width, height);
  }
  double v26 = v22;
  double v27 = v23;
  double v28 = v24;
  double v29 = v25;

  double v30 = v26;
  double v31 = v27;
  double v32 = v28;
  double v33 = v29;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (CGRect)titleRectForContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = [(CarCardRoundedButton *)self currentImage];

  BOOL v9 = [(CarCardRoundedButton *)self currentTitle];
  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    v11 = [(CarCardRoundedButton *)self currentAttributedTitle];
    BOOL v10 = v11 == 0;
  }
  v30.receiver = self;
  v30.super_class = (Class)CarCardRoundedButton;
  -[CarCardRoundedButton titleRectForContentRect:](&v30, "titleRectForContentRect:", x, y, width, height);
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  if (v8 && !v10)
  {
    v31.origin.double x = x;
    v31.origin.double y = y;
    v31.size.double width = width;
    v31.size.double height = height;
    double v28 = CGRectGetWidth(v31);
    CGFloat v29 = height;
    v32.origin.double x = 41.0;
    v32.origin.double y = v14;
    v32.size.double width = v16;
    v32.size.double height = v18;
    CGFloat v19 = v28 - CGRectGetMinX(v32) + -6.0;
    v33.origin.double x = x;
    v33.origin.double y = y;
    v33.size.double width = width;
    v33.size.double height = height;
    double v20 = CGRectGetHeight(v33);
    v34.origin.double x = 41.0;
    v34.origin.double y = v14;
    v34.size.double width = v19;
    v34.size.double height = v18;
    CGFloat v21 = CGRectGetHeight(v34);
    double v12 = sub_1005F854C(41.0, (v20 - v21) * 0.5, v19, v18, x, y, width, v29);
    CGFloat v14 = v22;
    CGFloat v16 = v23;
    CGFloat v18 = v24;
  }
  double v25 = v14;
  double v26 = v16;
  double v27 = v18;
  result.size.double height = v27;
  result.size.double width = v26;
  result.origin.double y = v25;
  result.origin.double x = v12;
  return result;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)CarCardRoundedButton;
  [(MapsLargerHitTargetButton *)&v6 layoutSubviews];
  v3 = [(CarCardRoundedButton *)self currentImage];
  if (v3) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 1;
  }
  objc_super v5 = [(CarCardRoundedButton *)self titleLabel];
  [v5 setTextAlignment:v4];
}

@end