@interface RAPVerticalBar
- (RAPVerticalBar)init;
- (void)layoutSubviews;
@end

@implementation RAPVerticalBar

- (RAPVerticalBar)init
{
  v10.receiver = self;
  v10.super_class = (Class)RAPVerticalBar;
  v2 = [(RAPVerticalBar *)&v10 init];
  if (v2)
  {
    v3 = (CAGradientLayer *)objc_alloc_init((Class)CAGradientLayer);
    gradientLayer = v2->_gradientLayer;
    v2->_gradientLayer = v3;

    v5 = [(RAPVerticalBar *)v2 layer];
    [v5 addSublayer:v2->_gradientLayer];

    id v6 = +[UIColor whiteColor];
    v11[0] = [v6 CGColor];
    id v7 = +[UIColor tableSeparatorDarkColor];
    v11[1] = [v7 CGColor];
    v8 = +[NSArray arrayWithObjects:v11 count:2];
    [(CAGradientLayer *)v2->_gradientLayer setColors:v8];
  }
  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)RAPVerticalBar;
  [(RAPVerticalBar *)&v3 layoutSubviews];
  [(RAPVerticalBar *)self bounds];
  -[CAGradientLayer setFrame:](self->_gradientLayer, "setFrame:");
}

- (void).cxx_destruct
{
}

@end