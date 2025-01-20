@interface MessageView
- (MessageView)initWithTitle:(id)a3;
- (NSLayoutConstraint)offsetConstraint;
- (void)createAnimation;
- (void)layoutSubviews;
- (void)setOffsetConstraint:(id)a3;
@end

@implementation MessageView

- (MessageView)initWithTitle:(id)a3
{
  id v4 = a3;
  v58.receiver = self;
  v58.super_class = (Class)MessageView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[MessageView initWithFrame:](&v58, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  if (v8)
  {
    uint64_t v9 = +[UIColor colorNamed:@"HUD"];
    color = v8->_color;
    v8->_color = (UIColor *)v9;

    v11 = +[UIColor colorWithWhite:0.0 alpha:0.100000001];
    [(MessageView *)v8 setBackgroundColor:v11];

    [(MessageView *)v8 setUserInteractionEnabled:0];
    id v12 = objc_alloc((Class)UIVisualEffectView);
    v13 = +[UIBlurEffect effectWithStyle:7];
    v14 = (UIVisualEffectView *)[v12 initWithEffect:v13];

    [(UIVisualEffectView *)v14 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MessageView *)v8 addSubview:v14];
    v15 = [(UIVisualEffectView *)v14 layer];
    [v15 setCornerRadius:15.0];

    [(UIVisualEffectView *)v14 setClipsToBounds:1];
    visualEffectView = v8->_visualEffectView;
    v8->_visualEffectView = v14;
    v17 = v14;

    v18 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(UIView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
    v19 = [(UIVisualEffectView *)v17 contentView];
    [v19 addSubview:v18];

    animationView = v8->_animationView;
    v8->_animationView = v18;
    v21 = v18;

    id v22 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    [v22 setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = [(UIVisualEffectView *)v17 contentView];
    [v23 addSubview:v22];

    [v22 setTextAlignment:1];
    [v22 setAttributedText:v4];
    [v22 setTextColor:v8->_color];
    [v22 setNumberOfLines:0];
    v24 = [(UIVisualEffectView *)v17 centerYAnchor];
    v25 = [(MessageView *)v8 centerYAnchor];
    uint64_t v26 = [v24 constraintEqualToAnchor:v25];
    offsetConstraint = v8->_offsetConstraint;
    v8->_offsetConstraint = (NSLayoutConstraint *)v26;

    v57 = [(UIVisualEffectView *)v17 centerXAnchor];
    v56 = [(MessageView *)v8 centerXAnchor];
    v54 = [v57 constraintEqualToAnchor:v56];
    v59[0] = v54;
    v59[1] = v8->_offsetConstraint;
    v53 = [(UIVisualEffectView *)v17 widthAnchor];
    v52 = [v53 constraintEqualToConstant:156.0];
    v59[2] = v52;
    v51 = [(UIView *)v21 centerXAnchor];
    v50 = [(UIVisualEffectView *)v17 centerXAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v59[3] = v49;
    v48 = [(UIView *)v21 topAnchor];
    v47 = [(UIVisualEffectView *)v17 topAnchor];
    v46 = [v48 constraintEqualToAnchor:v47 constant:30.0];
    v59[4] = v46;
    v45 = [(UIView *)v21 heightAnchor];
    v44 = [v45 constraintEqualToConstant:56.0];
    v59[5] = v44;
    v43 = [(UIView *)v21 widthAnchor];
    v42 = [v43 constraintEqualToConstant:60.0];
    v59[6] = v42;
    v41 = [v22 leadingAnchor];
    v40 = [(UIVisualEffectView *)v17 leadingAnchor];
    v39 = [v41 constraintEqualToAnchor:v40 constant:16.0];
    v59[7] = v39;
    v38 = [v22 trailingAnchor];
    v37 = [(UIVisualEffectView *)v17 trailingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37 constant:-16.0];
    v59[8] = v36;
    v35 = [v22 topAnchor];
    v28 = [(UIView *)v21 bottomAnchor];
    v29 = [v35 constraintEqualToAnchor:v28 constant:16.0];
    v59[9] = v29;
    v30 = [v22 bottomAnchor];
    [(UIVisualEffectView *)v17 bottomAnchor];
    v31 = id v55 = v4;
    v32 = [v30 constraintEqualToAnchor:v31 constant:-16.0];
    v59[10] = v32;
    v33 = +[NSArray arrayWithObjects:v59 count:11];
    +[NSLayoutConstraint activateConstraints:v33];

    id v4 = v55;
  }

  return v8;
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)MessageView;
  [(MessageView *)&v7 layoutSubviews];
  if (!self->_animationStarted)
  {
    [(UIVisualEffectView *)self->_visualEffectView frame];
    if (CGRectGetWidth(v8) != 0.0)
    {
      self->_animationStarted = 1;
      objc_initWeak(&location, self);
      dispatch_time_t v3 = dispatch_time(0, 100000000);
      v4[0] = _NSConcreteStackBlock;
      v4[1] = 3221225472;
      v4[2] = sub_1007D04B0;
      v4[3] = &unk_1012E6708;
      objc_copyWeak(&v5, &location);
      dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, v4);
      objc_destroyWeak(&v5);
      objc_destroyWeak(&location);
    }
  }
}

- (void)createAnimation
{
  dispatch_time_t v3 = self->_animationView;
  id v26 = +[UITraitCollection _currentTraitCollection];
  id v4 = [(UIView *)v3 traitCollection];
  +[UITraitCollection _setCurrentTraitCollection:v4];

  [(UIView *)v3 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  id v13 = objc_alloc_init((Class)UIBezierPath);
  v28.origin.x = v6;
  v28.origin.double y = v8;
  v28.size.double width = v10;
  v28.size.double height = v12;
  CGFloat v14 = CGRectGetWidth(v28) * 0.129999995;
  v29.origin.x = v6;
  v29.origin.double y = v8;
  v29.size.double width = v10;
  v29.size.double height = v12;
  [v13 moveToPoint:v14, CGRectGetHeight(v29) * 0.5];
  v30.origin.x = v6;
  v30.origin.double y = v8;
  v30.size.double width = v10;
  v30.size.double height = v12;
  CGFloat v15 = CGRectGetWidth(v30) * 0.449999988;
  v31.origin.x = v6;
  v31.origin.double y = v8;
  v31.size.double width = v10;
  v31.size.double height = v12;
  [v13 addLineToPoint:v15, CGRectGetMaxY(v31) * 0.899999976];
  v32.origin.x = v6;
  v32.origin.double y = v8;
  v32.size.double width = v10;
  v32.size.double height = v12;
  CGFloat v16 = CGRectGetMaxX(v32) * 0.899999976;
  v33.origin.x = v6;
  v33.origin.double y = v8;
  v33.size.double width = v10;
  v33.size.double height = v12;
  [v13 addLineToPoint:v16, CGRectGetHeight(v33) * 0.100000001];
  id v17 = objc_alloc_init((Class)CAShapeLayer);
  id v18 = v13;
  objc_msgSend(v17, "setPath:", objc_msgSend(v18, "CGPath"));
  [v17 setStrokeColor:[self->_color CGColor]];
  id v19 = +[UIColor clearColor];
  objc_msgSend(v17, "setFillColor:", objc_msgSend(v19, "CGColor"));

  [v17 setLineWidth:7.0];
  [v17 setLineJoin:kCALineJoinRound];
  [v17 setLineCap:kCALineCapRound];
  v20 = [(UIView *)v3 layer];

  [v20 addSublayer:v17];
  v21 = +[CABasicAnimation animationWithKeyPath:@"strokeEnd"];
  id v22 = +[NSNumber numberWithFloat:0.0];
  [v21 setFromValue:v22];

  LODWORD(v23) = 1.0;
  v24 = +[NSNumber numberWithFloat:v23];
  [v21 setToValue:v24];

  [v21 setDuration:0.349999994];
  v25 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v21 setTimingFunction:v25];

  [v17 addAnimation:v21 forKey:@"drawRectStroke"];
  +[UITraitCollection _setCurrentTraitCollection:v26];
}

- (NSLayoutConstraint)offsetConstraint
{
  return self->_offsetConstraint;
}

- (void)setOffsetConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offsetConstraint, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_animationView, 0);

  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end