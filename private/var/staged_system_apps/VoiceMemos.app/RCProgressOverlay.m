@interface RCProgressOverlay
- (RCEditingProgressIndicator)progressIndicator;
- (RCProgressOverlay)initWithCoder:(id)a3;
- (RCProgressOverlay)initWithFrame:(CGRect)a3;
- (UIColor)dimmingBackgroundColor;
- (UIColor)progressIndicatorColor;
- (UILabel)textLabel;
- (UIView)dimmingView;
- (float)progress;
- (int64_t)style;
- (void)_commonInit;
- (void)_setupProgressIndicator;
- (void)_setupTextIfNeeded;
- (void)dismiss;
- (void)layoutSubviews;
- (void)presentInView:(id)a3;
- (void)restyle;
- (void)setDimmingBackgroundColor:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setProgress:(float)a3;
- (void)setProgressIndicator:(id)a3;
- (void)setProgressIndicatorColor:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTextLabel:(id)a3;
@end

@implementation RCProgressOverlay

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)RCProgressOverlay;
  -[RCProgressOverlay setFrame:](&v4, "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(RCProgressOverlay *)self setNeedsLayout];
}

- (void)setProgress:(float)a3
{
  self->_progress = a3;
  id v5 = [(RCProgressOverlay *)self progressIndicator];
  *(float *)&double v4 = a3;
  [v5 setProgress:v4];
}

- (RCEditingProgressIndicator)progressIndicator
{
  progressIndicator = self->_progressIndicator;
  if (!progressIndicator)
  {
    double v4 = (RCEditingProgressIndicator *)objc_opt_new();
    id v5 = self->_progressIndicator;
    self->_progressIndicator = v4;

    v6 = [(RCProgressOverlay *)self progressIndicatorColor];

    if (v6)
    {
      v7 = [(RCProgressOverlay *)self progressIndicatorColor];
      [(RCEditingProgressIndicator *)self->_progressIndicator setProgressColor:v7];
    }
    [(RCProgressOverlay *)self progress];
    -[RCEditingProgressIndicator setProgress:](self->_progressIndicator, "setProgress:");
    progressIndicator = self->_progressIndicator;
  }

  return progressIndicator;
}

- (void)setProgressIndicatorColor:(id)a3
{
  self->_progressIndicatorColor = (UIColor *)a3;
  id v4 = a3;
  id v5 = [(RCProgressOverlay *)self progressIndicator];
  [v5 setProgressColor:v4];

  id v6 = [(RCProgressOverlay *)self textLabel];
  [v6 setTextColor:v4];
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
  id v7 = [(RCProgressOverlay *)self progressIndicator];
  id v5 = +[RCRecorderStyleProvider sharedStyleProvider];
  id v6 = [(RCProgressOverlay *)self dimmingView];
  if (a3 == 1)
  {
    [(RCProgressOverlay *)self _setupTextIfNeeded];
    [v5 editingProgressIndicatorDiameterPlayback];
    [v7 setDiameter:];
    [v5 editingProgressOuterRingThicknessPlayback];
    [v7 setOuterRingThickness:];
    [(RCProgressOverlay *)self addSubviewAndPinToEdges:v6];
    [(RCProgressOverlay *)self sendSubviewToBack:v6];
  }
  else if (!a3)
  {
    [v5 editingProgressIndicatorDiameterCell];
    [v7 setDiameter:];
    [v5 editingProgressOuterRingThicknessCell];
    [v7 setOuterRingThickness:];
  }
  [(RCProgressOverlay *)self _setupProgressIndicator];
}

- (void)setDimmingBackgroundColor:(id)a3
{
  id v4 = a3;
  id v5 = [(RCProgressOverlay *)self dimmingView];
  [v5 setBackgroundColor:v4];
}

- (UIColor)dimmingBackgroundColor
{
  v2 = [(RCProgressOverlay *)self dimmingView];
  v3 = [v2 backgroundColor];

  return (UIColor *)v3;
}

- (RCProgressOverlay)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCProgressOverlay;
  v3 = [(RCProgressOverlay *)&v6 initWithCoder:a3];
  id v4 = v3;
  if (v3) {
    [(RCProgressOverlay *)v3 _commonInit];
  }
  return v4;
}

- (RCProgressOverlay)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)RCProgressOverlay;
  v3 = -[RCProgressOverlay initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = v3;
  if (v3) {
    [(RCProgressOverlay *)v3 _commonInit];
  }
  return v4;
}

- (void)_commonInit
{
  id v3 = (id)objc_opt_new();
  [v3 setAlpha:1.0];
  [(RCProgressOverlay *)self setDimmingView:v3];
}

- (void)presentInView:(id)a3
{
  id v6 = a3;
  [(RCProgressOverlay *)self setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [(RCProgressOverlay *)self superview];

  id v5 = v6;
  if (v4 != v6)
  {
    [v6 addSubviewAndPinToEdges:self];
    [(RCProgressOverlay *)self setAlpha:1.0];
    id v5 = v6;
  }
}

- (void)dismiss
{
  id v3 = [(RCProgressOverlay *)self superview];

  if (v3)
  {
    id v4 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v4 progressViewDisplayDismissTime];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100071764;
    v6[3] = &unk_100221278;
    v6[4] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100071770;
    v5[3] = &unk_100221DB8;
    v5[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v6, v5);
  }
}

- (void)_setupProgressIndicator
{
  id v4 = [(RCProgressOverlay *)self progressIndicator];
  [(RCProgressOverlay *)self progress];
  [v4 setProgress:];
  int64_t v3 = [(RCProgressOverlay *)self style];
  if (v3 == 1)
  {
    [(RCProgressOverlay *)self addSubviewAndCenter:v4];
  }
  else if (!v3)
  {
    [(RCProgressOverlay *)self addSubview:v4];
  }
  [(RCProgressOverlay *)self bringSubviewToFront:v4];
}

- (void)_setupTextIfNeeded
{
  int64_t v3 = [(RCProgressOverlay *)self textLabel];
  if (!v3)
  {
    int64_t v3 = objc_opt_new();
    [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(RCProgressOverlay *)self setTextLabel:v3];
    id v4 = +[NSBundle mainBundle];
    id v5 = [v4 localizedStringForKey:@"SAVING_CHANGES" value:&stru_100228BC8 table:0];
    [v3 setText:v5];

    [v3 setTextAlignment:1];
    id v6 = +[RCRecorderStyleProvider sharedStyleProvider];
    [v6 progressTextFontSize];
    id v7 = +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:");
    [v3 setFont:v7];

    v8 = [(RCProgressOverlay *)self progressIndicator];
    v9 = [v8 progressColor];
    [v3 setTextColor:v9];

    [(RCProgressOverlay *)self addSubview:v3];
    v10 = [(RCProgressOverlay *)self progressIndicator];
    [v6 progressTextYSpacing];
    v12 = +[NSLayoutConstraint constraintWithItem:v3 attribute:3 relatedBy:0 toItem:v10 attribute:4 multiplier:1.0 constant:v11];

    v13 = [(RCProgressOverlay *)self progressIndicator];
    v14 = +[NSLayoutConstraint constraintWithItem:v3 attribute:9 relatedBy:0 toItem:v13 attribute:9 multiplier:1.0 constant:0.0];

    v16[0] = v12;
    v16[1] = v14;
    v15 = +[NSArray arrayWithObjects:v16 count:2];
    [(RCProgressOverlay *)self addConstraints:v15];
  }
}

- (void)layoutSubviews
{
  v18.receiver = self;
  v18.super_class = (Class)RCProgressOverlay;
  [(RCProgressOverlay *)&v18 layoutSubviews];
  if (![(RCProgressOverlay *)self style])
  {
    [(RCProgressOverlay *)self frame];
    double v4 = v3;
    double v6 = v5;
    id v7 = [(RCProgressOverlay *)self progressIndicator];
    [v7 frame];
    double v9 = v8;
    double v11 = v10;

    v12 = [(RCProgressOverlay *)self progressIndicator];
    [v12 diameter];
    double v14 = v13;

    float v15 = (v6 - v11) * 0.5;
    double v16 = roundf(v15);
    v17 = [(RCProgressOverlay *)self progressIndicator];
    [v17 setFrame:v4 - v9, v16, v14, v14];
  }
}

- (void)restyle
{
  id v2 = [(RCProgressOverlay *)self progressIndicator];
  [v2 restyle];
}

- (int64_t)style
{
  return self->_style;
}

- (float)progress
{
  return self->_progress;
}

- (UIColor)progressIndicatorColor
{
  return self->_progressIndicatorColor;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (void)setProgressIndicator:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_progressIndicator, 0);

  objc_storeStrong((id *)&self->_dimmingView, 0);
}

@end