@interface MTSwitch
- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (BOOL)isOn;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGRect)thumbRectForOffset:(double)a3;
- (CGRect)thumbRectForOn:(BOOL)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTSwitch)initWithFrame:(CGRect)a3;
- (void)cancelTrackingWithEvent:(id)a3;
- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4;
- (void)layoutSubviews;
- (void)setOn:(BOOL)a3;
- (void)setOn:(BOOL)a3 animated:(BOOL)a4;
- (void)swiped:(id)a3;
@end

@implementation MTSwitch

- (MTSwitch)initWithFrame:(CGRect)a3
{
  v22.receiver = self;
  v22.super_class = (Class)MTSwitch;
  v3 = -[MTSwitch initWithFrame:](&v22, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc((Class)UIImageView);
    v5 = +[UIImage imageNamed:@"TunerSwitchWell"];
    v6 = [v5 resizableImageWithCapInsets:0.0, 7.0, 0.0, 7.0];
    v7 = (UIImageView *)[v4 initWithImage:v6];
    backgroundImageView = v3->_backgroundImageView;
    v3->_backgroundImageView = v7;

    v9 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    thumbView = v3->_thumbView;
    v3->_thumbView = v9;

    id v11 = objc_alloc((Class)UIImageView);
    v12 = +[UIImage imageNamed:@"TunerSwitchKnob"];
    v13 = +[UIImage imageNamed:@"TunerSwitchKnobPressed"];
    v14 = (UIImageView *)[v11 initWithImage:v12 highlightedImage:v13];
    thumbImageView = v3->_thumbImageView;
    v3->_thumbImageView = v14;

    [(UIView *)v3->_thumbView setClipsToBounds:0];
    v16 = v3->_thumbView;
    [(UIImageView *)v3->_thumbImageView frame];
    CGRect v24 = CGRectInset(v23, 2.0, 2.0);
    -[UIView setFrame:](v16, "setFrame:", v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
    v17 = v3->_thumbImageView;
    v18 = [(UIImageView *)v17 image];
    [v18 size];
    -[UIImageView setFrame:](v17, "setFrame:", -1.0, -1.0, v19, v20);

    [(UIView *)v3->_thumbView addSubview:v3->_thumbImageView];
    [(MTSwitch *)v3 addSubview:v3->_backgroundImageView];
    [(MTSwitch *)v3 addSubview:v3->_thumbView];
  }
  return v3;
}

- (void)layoutSubviews
{
  backgroundImageView = self->_backgroundImageView;
  [(MTSwitch *)self bounds];
  -[UIImageView setFrame:](backgroundImageView, "setFrame:");
  thumbView = self->_thumbView;
  [(MTSwitch *)self thumbRectForOn:self->_on];

  -[UIView setFrame:](thumbView, "setFrame:");
}

- (void)setOn:(BOOL)a3
{
}

- (void)setOn:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  self->_on = a3;
  [(MTSwitch *)self setNeedsLayout];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100092C10;
  v8[3] = &unk_10054D570;
  v8[4] = self;
  v6 = objc_retainBlock(v8);
  v7 = v6;
  if (v4) {
    +[UIView animateWithDuration:v6 animations:0.200000003];
  }
  else {
    ((void (*)(void *))v6[2])(v6);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  v3 = [(UIImageView *)self->_backgroundImageView image];
  [v3 size];
  double v5 = v4;

  double v6 = 60.0;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)beginTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  self->_trackingOffset = 0.0;
  [a3 locationInView:self];
  self->_trackingStartLocation = v5;
  [(UIView *)self->_thumbView frame];
  self->_startThumbRect.origin.x = v6;
  self->_startThumbRect.origin.y = v7;
  self->_startThumbRect.size.width = v8;
  self->_startThumbRect.size.height = v9;
  v10 = +[NSDate date];
  trackingStartTime = self->_trackingStartTime;
  self->_trackingStartTime = v10;

  [(UIImageView *)self->_thumbImageView setHighlighted:1];
  return 1;
}

- (BOOL)continueTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  [a3 locationInView:self];
  self->_trackingOffset = v5 - self->_trackingStartLocation;
  thumbView = self->_thumbView;
  -[MTSwitch thumbRectForOffset:](self, "thumbRectForOffset:");
  -[UIView setFrame:](thumbView, "setFrame:");
  [(UIImageView *)self->_thumbImageView setHighlighted:1];
  return 1;
}

- (void)endTrackingWithTouch:(id)a3 withEvent:(id)a4
{
  thumbImageView = self->_thumbImageView;
  id v6 = a3;
  [(UIImageView *)thumbImageView setHighlighted:0];
  [v6 locationInView:self];
  double v8 = v7;

  self->_trackingOffset = v8 - self->_trackingStartLocation;
  BOOL on = self->_on;
  -[MTSwitch thumbRectForOffset:](self, "thumbRectForOffset:");
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  double v18 = self->_startThumbRect.origin.x - v10;
  if (v18 < 0.0) {
    double v18 = -v18;
  }
  if (v18 >= 8.0
    || (+[NSDate date],
        double v19 = objc_claimAutoreleasedReturnValue(),
        [v19 timeIntervalSinceDate:self->_trackingStartTime],
        double v21 = v20,
        v19,
        v21 >= 0.5))
  {
    v25.origin.x = v11;
    v25.origin.y = v13;
    v25.size.width = v15;
    v25.size.height = v17;
    double MidX = CGRectGetMidX(v25);
    [(MTSwitch *)self bounds];
    BOOL v22 = MidX >= CGRectGetWidth(v26) * 0.5;
  }
  else
  {
    BOOL v22 = !self->_on;
  }
  [(MTSwitch *)self setOn:v22 animated:1];
  if (on != self->_on)
  {
    [(MTSwitch *)self sendActionsForControlEvents:4096];
  }
}

- (void)cancelTrackingWithEvent:(id)a3
{
  [(UIImageView *)self->_thumbImageView setHighlighted:0];
  BOOL on = self->_on;
  [(MTSwitch *)self thumbRectForOffset:self->_trackingOffset];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  double trackingOffset = self->_trackingOffset;
  if (trackingOffset < 0.0) {
    double trackingOffset = -trackingOffset;
  }
  if (trackingOffset >= 8.0
    || (+[NSDate date],
        double v14 = objc_claimAutoreleasedReturnValue(),
        [v14 timeIntervalSinceDate:self->_trackingStartTime],
        double v16 = v15,
        v14,
        v16 >= 0.5))
  {
    v20.origin.x = v6;
    v20.origin.y = v8;
    v20.size.width = v10;
    v20.size.height = v12;
    double MidX = CGRectGetMidX(v20);
    [(MTSwitch *)self bounds];
    BOOL v17 = MidX >= CGRectGetWidth(v21) * 0.5;
  }
  else
  {
    BOOL v17 = !self->_on;
  }
  [(MTSwitch *)self setOn:v17 animated:1];
  if (on != self->_on)
  {
    [(MTSwitch *)self sendActionsForControlEvents:4096];
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(MTSwitch *)self bounds];
  CGRect v11 = CGRectInset(v10, -25.0, -25.0);
  CGFloat v6 = x;
  CGFloat v7 = y;

  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (void)swiped:(id)a3
{
  id v4 = [a3 direction];
  if (v4 == (id)1)
  {
    if (self->_on) {
      return;
    }
    uint64_t v5 = 1;
  }
  else
  {
    if (v4 != (id)2 || !self->_on) {
      return;
    }
    uint64_t v5 = 0;
  }

  [(MTSwitch *)self setOn:v5 animated:1];
}

- (CGRect)thumbRectForOffset:(double)a3
{
  CGFloat y = self->_startThumbRect.origin.y;
  CGFloat width = self->_startThumbRect.size.width;
  CGFloat height = self->_startThumbRect.size.height;
  double v6 = self->_startThumbRect.origin.x + a3;
  double v7 = 0.0;
  if (v6 >= 0.0)
  {
    v14.origin.CGFloat x = v6;
    v14.origin.CGFloat y = self->_startThumbRect.origin.y;
    v14.size.CGFloat width = self->_startThumbRect.size.width;
    v14.size.CGFloat height = self->_startThumbRect.size.height;
    CGFloat v9 = v6 + CGRectGetWidth(v14);
    [(MTSwitch *)self frame];
    if (v9 >= CGRectGetWidth(v15))
    {
      [(MTSwitch *)self frame];
      double v10 = CGRectGetWidth(v16);
      v17.origin.CGFloat x = v6;
      v17.origin.CGFloat y = y;
      v17.size.CGFloat width = width;
      v17.size.CGFloat height = height;
      double v7 = v10 - CGRectGetWidth(v17);
    }
    else
    {
      double v7 = v6;
    }
  }
  double v11 = y;
  double v12 = width;
  double v13 = height;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v11;
  result.origin.CGFloat x = v7;
  return result;
}

- (CGRect)thumbRectForOn:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIView *)self->_thumbView frame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  double v11 = 0.0;
  if (v3)
  {
    [(MTSwitch *)self bounds];
    double Width = CGRectGetWidth(v16);
    v17.origin.CGFloat y = 0.0;
    v17.origin.CGFloat x = v6;
    v17.size.CGFloat width = v8;
    v17.size.CGFloat height = v10;
    double v11 = Width - CGRectGetWidth(v17);
  }
  double v13 = 0.0;
  double v14 = v8;
  double v15 = v10;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)isOn
{
  return self->_on;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trackingStartTime, 0);
  objc_storeStrong((id *)&self->_thumbView, 0);
  objc_storeStrong((id *)&self->_thumbImageView, 0);

  objc_storeStrong((id *)&self->_backgroundImageView, 0);
}

@end