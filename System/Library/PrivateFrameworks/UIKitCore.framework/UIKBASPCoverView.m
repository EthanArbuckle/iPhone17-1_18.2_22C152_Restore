@interface UIKBASPCoverView
+ (id)ASPCoverView:(BOOL)a3 withFrame:(CGRect)a4 isRightToLeft:(BOOL)a5 withTextWidth:(double)a6;
+ (id)ASPCoverViewColor;
- (CAGradientLayer)gradientLayer;
- (id)initCoverBackgroundViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4;
- (id)initCoverViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4 withTextWidth:(double)a5;
- (void)layoutSubviews;
- (void)setGradientLayer:(id)a3;
@end

@implementation UIKBASPCoverView

+ (id)ASPCoverView:(BOOL)a3 withFrame:(CGRect)a4 isRightToLeft:(BOOL)a5 withTextWidth:(double)a6
{
  BOOL v7 = a5;
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  BOOL v12 = a3;
  v13 = [UIKBASPCoverView alloc];
  if (v12) {
    id v14 = -[UIKBASPCoverView initCoverViewWithFrame:isRightToLeft:withTextWidth:](v13, "initCoverViewWithFrame:isRightToLeft:withTextWidth:", v7, x, y, width, height, a6);
  }
  else {
    id v14 = -[UIKBASPCoverView initCoverBackgroundViewWithFrame:isRightToLeft:](v13, "initCoverBackgroundViewWithFrame:isRightToLeft:", v7, x, y, width, height);
  }
  return v14;
}

- (id)initCoverBackgroundViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIKBASPCoverView;
  v4 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v4;
  if (v4)
  {
    [(UIView *)v4 setUserInteractionEnabled:0];
    v6 = [(id)objc_opt_class() ASPCoverViewColor];
    [(UIView *)v5 setBackgroundColor:v6];
  }
  return v5;
}

- (id)initCoverViewWithFrame:(CGRect)a3 isRightToLeft:(BOOL)a4 withTextWidth:(double)a5
{
  BOOL v6 = a4;
  double height = a3.size.height;
  v44[2] = *MEMORY[0x1E4F143B8];
  v41.receiver = self;
  v41.super_class = (Class)UIKBASPCoverView;
  objc_super v8 = -[UIView initWithFrame:](&v41, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width);
  p_isa = (id *)&v8->super.super.super.isa;
  if (v8)
  {
    [(UIView *)v8 setUserInteractionEnabled:0];
    v10 = +[UIColor clearColor];
    [p_isa setBackgroundColor:v10];

    uint64_t v11 = [MEMORY[0x1E4F39BD0] layer];
    id v12 = p_isa[51];
    p_isa[51] = (id)v11;

    v13 = +[UIScreen mainScreen];
    [v13 scale];
    if (v14 == 3.0) {
      double v15 = 4.0;
    }
    else {
      double v15 = 6.0;
    }

    [p_isa bounds];
    double v17 = v16 - v15;
    [p_isa bounds];
    objc_msgSend(p_isa[51], "setFrame:", 0.0, 0.0, v17);
    id v18 = +[UIColor colorWithRed:0.980392157 green:1.0 blue:0.741176471 alpha:0.0];
    v44[0] = [v18 CGColor];
    id v19 = +[UIColor colorWithRed:0.980392157 green:1.0 blue:0.741176471 alpha:1.0];
    v44[1] = [v19 CGColor];
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];

    [p_isa[51] setColors:v20];
    [p_isa[51] frame];
    double v22 = 0.45;
    if (v21 * 0.45 <= a5)
    {
      double v23 = 0.1;
    }
    else
    {
      double v23 = a5 * 0.1 / v21;
      double v22 = a5 * 0.65 / v21;
    }
    if (v6) {
      double v23 = 1.0 - v23;
    }
    double v24 = 1.0 - v22;
    if (v6) {
      double v25 = 1.0 - v22;
    }
    else {
      double v25 = v22;
    }
    objc_msgSend(p_isa[51], "setStartPoint:", v23, 0.0);
    objc_msgSend(p_isa[51], "setEndPoint:", v25, 0.0);
    v26 = [p_isa layer];
    [v26 addSublayer:p_isa[51]];

    v27 = _UINSLocalizedStringWithDefaultValue(@"Strong Password", @"Strong Password");
    v28 = [off_1E52D39B8 systemFontOfSize:14.0 weight:*(double *)off_1E52D6BF0];
    uint64_t v42 = *(void *)off_1E52D2040;
    v43 = v28;
    v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    [v27 sizeWithAttributes:v29];
    double v31 = v30;
    [p_isa[51] frame];
    if (v31 < v24 * v32)
    {
      v33 = -[UILabel initWithFrame:]([UILabel alloc], "initWithFrame:", 0.0, 0.0, v24 * v32, height);
      [(UILabel *)v33 setUserInteractionEnabled:0];
      [(UILabel *)v33 setText:v27];
      [(UILabel *)v33 setFont:v28];
      v34 = +[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
      [(UILabel *)v33 setTextColor:v34];

      [(UIView *)v33 setTranslatesAutoresizingMaskIntoConstraints:0];
      [p_isa addSubview:v33];
      v35 = [MEMORY[0x1E4F1CA48] array];
      if (v6) {
        uint64_t v36 = 1;
      }
      else {
        uint64_t v36 = 2;
      }
      double v37 = -v15;
      if (v6) {
        double v37 = (double)v6;
      }
      v38 = [MEMORY[0x1E4F5B268] constraintWithItem:v33 attribute:v36 relatedBy:0 toItem:p_isa attribute:v36 multiplier:1.0 constant:v37];
      [v35 addObject:v38];

      v39 = [MEMORY[0x1E4F5B268] constraintWithItem:v33 attribute:10 relatedBy:0 toItem:p_isa attribute:10 multiplier:1.0 constant:0.0];
      [v35 addObject:v39];

      [MEMORY[0x1E4F5B268] activateConstraints:v35];
    }
  }
  return p_isa;
}

+ (id)ASPCoverViewColor
{
  return +[UIColor colorWithRed:0.980392157 green:1.0 blue:0.741176471 alpha:1.0];
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)UIKBASPCoverView;
  [(UIView *)&v11 layoutSubviews];
  v3 = +[UIScreen mainScreen];
  [v3 scale];
  if (v4 == 3.0) {
    double v5 = 4.0;
  }
  else {
    double v5 = 6.0;
  }

  [(UIView *)self bounds];
  double v7 = v6 - v5;
  [(UIView *)self bounds];
  double v9 = v8;
  v10 = [(UIKBASPCoverView *)self gradientLayer];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, v7, v9);
}

- (CAGradientLayer)gradientLayer
{
  return self->_gradientLayer;
}

- (void)setGradientLayer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end