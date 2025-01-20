@interface MTACircleButton
+ (double)buttonWidthForSize:(unint64_t)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTACircleButton)initWithFrame:(CGRect)a3;
- (double)preferredHorizontalMargin;
- (unint64_t)buttonCircleSize;
- (void)handleContentSizeChange;
- (void)setButtonCircleSize:(unint64_t)a3;
@end

@implementation MTACircleButton

+ (double)buttonWidthForSize:(unint64_t)a3
{
  v4 = +[UIApplication sharedApplication];
  v5 = [v4 keyWindow];
  v6 = [v5 traitCollection];

  [v6 horizontalSizeClass];
  v7 = +[UIApplication sharedApplication];
  v8 = [v7 keyWindow];
  [v8 frame];

  v9 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v10 = v9;
  if (!a3)
  {
    v11 = &qword_100082A48;
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    v11 = &qword_100082A50;
LABEL_5:
    [v9 _scaledValueForValue:*(double *)v11];
  }
  MTUIRoundToPixel();
  double v13 = v12;

  return v13;
}

- (MTACircleButton)initWithFrame:(CGRect)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MTACircleButton;
  v3 = -[MTACircleButton initWithFrame:](&v23, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_buttonCircleSize = -1;
    v5 = +[UIColor whiteColor];
    [(MTACircleButton *)v4 setTintColor:v5];

    v6 = [(MTACircleButton *)v4 titleLabel];
    [v6 setTextAlignment:1];

    v7 = [(MTACircleButton *)v4 titleLabel];
    [v7 setBaselineAdjustment:1];

    v8 = [(MTACircleButton *)v4 titleLabel];
    [v8 setAdjustsFontSizeToFitWidth:1];

    v9 = [(MTACircleButton *)v4 titleLabel];
    v10 = +[NAUITextStyleDescriptor descriptorWithTextStyle:UIFontTextStyleBody];
    v11 = [v10 descriptorByDisallowingSmallSizes];
    [v9 naui_setDynamicFontTextStyleDescriptor:v11];

    double v12 = +[NSMutableArray array];
    double v13 = [(MTACircleButton *)v4 titleLabel];
    [v13 setTranslatesAutoresizingMaskIntoConstraints:0];

    [(MTACircleButton *)v4 setAutoresizingMask:0];
    v14 = +[NSLayoutConstraint constraintWithItem:v4 attribute:7 relatedBy:0 toItem:v4 attribute:8 multiplier:1.0 constant:0.0];
    [v12 addObject:v14];

    v15 = [(MTACircleButton *)v4 titleLabel];
    v16 = +[NSLayoutConstraint constraintWithItem:v15 attribute:5 relatedBy:0 toItem:v4 attribute:5 multiplier:1.0 constant:8.0];
    [v12 addObject:v16];

    v17 = [(MTACircleButton *)v4 titleLabel];
    v18 = +[NSLayoutConstraint constraintWithItem:v17 attribute:6 relatedBy:0 toItem:v4 attribute:6 multiplier:1.0 constant:-8.0];
    [v12 addObject:v18];

    v19 = [(MTACircleButton *)v4 titleLabel];
    v20 = +[NSLayoutConstraint constraintWithItem:v19 attribute:9 relatedBy:0 toItem:v4 attribute:9 multiplier:1.0 constant:-8.0];

    LODWORD(v21) = 1148829696;
    [v20 setPriority:v21];
    [v12 addObject:v20];
    +[NSLayoutConstraint activateConstraints:v12];
  }
  return v4;
}

- (void)setButtonCircleSize:(unint64_t)a3
{
  if (self->_buttonCircleSize != a3)
  {
    self->_buttonCircleSize = a3;
    v5 = +[UIApplication sharedApplication];
    v6 = [v5 preferredContentSizeCategory];
    v7 = sub_1000215B4(a3, v6);

    id v8 = [v7 imageWithRenderingMode:2];

    [(MTACircleButton *)self setBackgroundImage:v8 forState:0];
  }
}

- (void)handleContentSizeChange
{
  unint64_t buttonCircleSize = self->_buttonCircleSize;
  v4 = +[UIApplication sharedApplication];
  v5 = [v4 preferredContentSizeCategory];
  v6 = sub_1000215B4(buttonCircleSize, v5);

  id v7 = [v6 imageWithRenderingMode:2];

  [(MTACircleButton *)self setBackgroundImage:v7 forState:0];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v12.receiver = self;
  v12.super_class = (Class)MTACircleButton;
  -[MTACircleButton sizeThatFits:](&v12, "sizeThatFits:", a3.width, a3.height);
  double v5 = v4;
  double v7 = v6;
  id v8 = [(MTACircleButton *)self titleLabel];
  unsigned int v9 = [v8 adjustsFontSizeToFitWidth];

  if (v9) {
    double v10 = v7;
  }
  else {
    double v10 = v5;
  }
  double v11 = v10;
  result.height = v11;
  result.width = v10;
  return result;
}

- (double)preferredHorizontalMargin
{
  v2 = [(MTACircleButton *)self window];
  [v2 frame];
  double v4 = v3;
  double v6 = v5;

  if (MTUIShouldUseLargePadLayout())
  {
    BOOL v7 = v6 <= 1024.0 && v4 <= 1024.0;
    double result = 90.0;
    if (!v7) {
      return 132.0;
    }
  }
  else
  {
    BOOL v9 = v6 <= 768.0 && v4 <= 768.0;
    double result = 82.0;
    if (v9) {
      return 29.0;
    }
  }
  return result;
}

- (unint64_t)buttonCircleSize
{
  return self->_buttonCircleSize;
}

@end