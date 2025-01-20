@interface SelectedColorButton
+ (id)buttonWithType:(int64_t)a3 radius:(double)a4 color:(id)a5;
+ (id)imageWithColor:(id)a3;
- (CALayer)donut;
- (void)layoutSubviews;
- (void)setDonut:(id)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation SelectedColorButton

+ (id)imageWithColor:(id)a3
{
  id v3 = a3;
  v9.width = 1.0;
  v9.height = 1.0;
  UIGraphicsBeginImageContextWithOptions(v9, 0, 0.0);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v5 = v3;
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v5 CGColor]);
  v10.origin.x = 0.0;
  v10.origin.y = 0.0;
  v10.size.width = 1.0;
  v10.size.height = 1.0;
  CGContextFillRect(CurrentContext, v10);
  v6 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v6;
}

+ (id)buttonWithType:(int64_t)a3 radius:(double)a4 color:(id)a5
{
  id v8 = a5;
  v24.receiver = a1;
  v24.super_class = (Class)&OBJC_METACLASS___SelectedColorButton;
  CGSize v9 = [super buttonWithType:a3];
  CGRect v10 = [a1 imageWithColor:v8];
  [v9 setImage:v10 forState:0];

  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v9 setContentHorizontalAlignment:3];
  [v9 setContentVerticalAlignment:3];
  v11 = [v9 layer];
  [v11 setMasksToBounds:1];

  v12 = [v9 layer];
  [v12 setCornerRadius:a4];

  v13 = [v9 widthAnchor];
  v14 = [v13 constraintEqualToConstant:a4 + a4];
  v25[0] = v14;
  v15 = [v9 heightAnchor];
  v16 = [v9 widthAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v25[1] = v17;
  v18 = +[NSArray arrayWithObjects:v25 count:2];

  +[NSLayoutConstraint activateConstraints:v18];
  v19 = +[CALayer layer];
  double v20 = a4 * 2.0 + -5.0;
  [v19 setCornerRadius:v20 * 0.5];
  id v21 = +[UIColor clearColor];
  [v19 setBackgroundColor:[v21 CGColor]];

  [v19 setBorderWidth:2.0];
  [v9 setDonut:v19];
  [v19 setFrame:2.5, 2.5, v20, v20];
  v22 = [v9 layer];
  [v22 addSublayer:v19];

  return v9;
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)SelectedColorButton;
  [(SelectedColorButton *)&v6 layoutSubviews];
  id v3 = +[UIColor systemBackgroundColor];
  id v4 = [v3 CGColor];
  id v5 = [(SelectedColorButton *)self donut];
  [v5 setBorderColor:v4];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SelectedColorButton;
  -[SelectedColorButton setSelected:](&v7, "setSelected:");
  BOOL v5 = !v3;
  objc_super v6 = [(SelectedColorButton *)self donut];
  [v6 setHidden:v5];
}

- (CALayer)donut
{
  return self->_donut;
}

- (void)setDonut:(id)a3
{
}

- (void).cxx_destruct
{
}

@end