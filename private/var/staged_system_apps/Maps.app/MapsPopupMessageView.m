@interface MapsPopupMessageView
- (BOOL)isDismissing;
- (MapsPopupMessageView)initWithMessage:(id)a3 timeout:(double)a4 timeoutHandler:(id)a5;
- (NSString)message;
- (double)timeout;
- (void)_preferredContentSizeDidChange;
- (void)_userInterfaceStyleDidChange;
- (void)dismissAnimated:(BOOL)a3 completion:(id)a4;
- (void)layoutSubviews;
- (void)presentFromView:(id)a3 animated:(BOOL)a4;
- (void)resetTimerAnimated:(BOOL)a3;
@end

@implementation MapsPopupMessageView

- (MapsPopupMessageView)initWithMessage:(id)a3 timeout:(double)a4 timeoutHandler:(id)a5
{
  id v71 = a3;
  id v70 = a5;
  v73.receiver = self;
  v73.super_class = (Class)MapsPopupMessageView;
  v8 = -[MapsPopupMessageView initWithFrame:](&v73, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  if (v8)
  {
    v9 = (NSString *)[v71 copy];
    message = v8->_message;
    v8->_message = v9;

    v8->_timeout = a4;
    id v11 = [v70 copy];
    id timeoutHandler = v8->_timeoutHandler;
    v8->_id timeoutHandler = v11;

    [(MapsPopupMessageView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v13 = +[UIColor blackColor];
    id v14 = [v13 CGColor];
    v15 = [(MapsPopupMessageView *)v8 layer];
    [v15 setShadowColor:v14];

    v16 = [(MapsPopupMessageView *)v8 layer];
    [v16 setShadowOffset:0.0, 2.0];

    v17 = [(MapsPopupMessageView *)v8 layer];
    [v17 setShadowRadius:8.0];

    v18 = [(MapsPopupMessageView *)v8 layer];
    LODWORD(v19) = *(_DWORD *)"\nף=";
    [v18 setShadowOpacity:v19];

    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x2050000000;
    v20 = (void *)qword_10160EC10;
    uint64_t v77 = qword_10160EC10;
    if (!qword_10160EC10)
    {
      *(void *)buf = _NSConcreteStackBlock;
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = sub_100401124;
      v82 = &unk_1012E9390;
      v83 = &v74;
      sub_100401124((uint64_t)buf);
      v20 = (void *)v75[3];
    }
    id v21 = v20;
    _Block_object_dispose(&v74, 8);
    id obj = (id)objc_opt_new();
    if (obj)
    {
      v22 = +[NSBundle bundleForClass:objc_opt_class()];
      [obj setRecipeName:@"coaching-material" fromBundle:v22];

      [obj setWeighting:1.0];
      CALayerCornerCurve v23 = kCACornerCurveContinuous;
      [obj setCornerCurve:kCACornerCurveContinuous];
      objc_storeStrong((id *)&v8->_materialLayer, obj);
    }
    else
    {
      v24 = sub_1005762E4();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        *(void *)&buf[4] = "-[MapsPopupMessageView initWithMessage:timeout:timeoutHandler:]";
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "MapsPopupMessageView.m";
        *(_WORD *)&buf[22] = 1024;
        LODWORD(v82) = 67;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        v25 = sub_1005762E4();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          v26 = +[NSThread callStackSymbols];
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v26;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
        }
      }
      uint64_t v27 = objc_opt_new();
      materialLayer = v8->_materialLayer;
      v8->_materialLayer = (CALayer *)v27;

      CALayerCornerCurve v23 = kCACornerCurveContinuous;
    }
    v29 = [(MapsPopupMessageView *)v8 layer];
    [v29 addSublayer:v8->_materialLayer];

    uint64_t v30 = objc_opt_new();
    backgroundView = v8->_backgroundView;
    v8->_backgroundView = (UIView *)v30;

    [(UIView *)v8->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    v32 = +[UIColor colorWithWhite:1.0 alpha:0.200000003];
    [(UIView *)v8->_backgroundView setBackgroundColor:v32];

    [(MapsPopupMessageView *)v8 addSubview:v8->_backgroundView];
    uint64_t v33 = objc_opt_new();
    borderLayer = v8->_borderLayer;
    v8->_borderLayer = (CALayer *)v33;

    [(CALayer *)v8->_borderLayer setBorderWidth:1.0];
    [(CALayer *)v8->_materialLayer setCornerCurve:v23];
    v35 = [(UIView *)v8->_backgroundView layer];
    [v35 addSublayer:v8->_borderLayer];

    v36 = objc_opt_new();
    [v36 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v36 setNumberOfLines:4];
    v37 = +[UIColor secondaryLabelColor];
    [v36 setTextColor:v37];

    [v36 setText:v8->_message];
    [v36 setTextAlignment:1];
    [(UIView *)v8->_backgroundView addSubview:v36];
    objc_storeStrong((id *)&v8->_messageLabel, v36);
    [(MapsPopupMessageView *)v8 _userInterfaceStyleDidChange];
    [(MapsPopupMessageView *)v8 _preferredContentSizeDidChange];
    v69 = [(MapsPopupMessageView *)v8 widthAnchor];
    v68 = [v69 constraintLessThanOrEqualToConstant:340.0];
    v80[0] = v68;
    v67 = [(UIView *)v8->_backgroundView leadingAnchor];
    v66 = [(MapsPopupMessageView *)v8 leadingAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v80[1] = v65;
    v63 = [(UIView *)v8->_backgroundView trailingAnchor];
    v64 = [(MapsPopupMessageView *)v8 trailingAnchor];
    v62 = [v63 constraintEqualToAnchor:v64];
    v80[2] = v62;
    v61 = [(UIView *)v8->_backgroundView topAnchor];
    v60 = [(MapsPopupMessageView *)v8 topAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v80[3] = v59;
    v57 = [(UIView *)v8->_backgroundView bottomAnchor];
    v58 = [(MapsPopupMessageView *)v8 bottomAnchor];
    v56 = [v57 constraintEqualToAnchor:v58];
    v80[4] = v56;
    v55 = [v36 leadingAnchor];
    v54 = [(MapsPopupMessageView *)v8 leadingAnchor];
    v53 = [v55 constraintEqualToAnchor:v54 constant:16.0];
    v80[5] = v53;
    v51 = [v36 trailingAnchor];
    v52 = [(MapsPopupMessageView *)v8 trailingAnchor];
    v38 = [v51 constraintEqualToAnchor:v52 constant:-16.0];
    v80[6] = v38;
    v39 = [v36 topAnchor];
    v40 = [(MapsPopupMessageView *)v8 topAnchor];
    v41 = [v39 constraintEqualToAnchor:v40 constant:8.0];
    v80[7] = v41;
    v42 = [v36 bottomAnchor];
    v43 = [(MapsPopupMessageView *)v8 bottomAnchor];
    v44 = [v42 constraintEqualToAnchor:v43 constant:-8.0];
    v80[8] = v44;
    v45 = +[NSArray arrayWithObjects:v80 count:9];
    +[NSLayoutConstraint activateConstraints:v45];

    uint64_t v79 = objc_opt_class();
    v46 = +[NSArray arrayWithObjects:&v79 count:1];
    id v47 = [(MapsPopupMessageView *)v8 registerForTraitChanges:v46 withTarget:v8 action:"_userInterfaceStyleDidChange"];

    uint64_t v78 = objc_opt_class();
    v48 = +[NSArray arrayWithObjects:&v78 count:1];
    id v49 = [(MapsPopupMessageView *)v8 registerForTraitChanges:v48 withTarget:v8 action:"_preferredContentSizeDidChange"];
  }
  return v8;
}

- (void)layoutSubviews
{
  v11.receiver = self;
  v11.super_class = (Class)MapsPopupMessageView;
  [(MapsPopupMessageView *)&v11 layoutSubviews];
  [(MapsPopupMessageView *)self bounds];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  id v3 = objc_claimAutoreleasedReturnValue();
  id v4 = [v3 CGPath];
  v5 = [(MapsPopupMessageView *)self layer];
  [v5 setShadowPath:v4];

  v6 = [(MapsPopupMessageView *)self layer];
  [v6 bounds];
  -[CALayer setFrame:](self->_materialLayer, "setFrame:");

  [(UIView *)self->_backgroundView bounds];
  CGRect v13 = CGRectInset(v12, -1.0, -1.0);
  -[CALayer setFrame:](self->_borderLayer, "setFrame:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  [(MapsPopupMessageView *)self frame];
  double v8 = v7 * 0.5;
  materialLayer = self->_materialLayer;
  if (v7 * 0.5 <= 19.0)
  {
    [(CALayer *)materialLayer setCornerRadius:v7 * 0.5];
    [(UIView *)self->_backgroundView _setContinuousCornerRadius:v8];
    double v10 = v8 + 1.0;
  }
  else
  {
    [(CALayer *)materialLayer setCornerRadius:16.0];
    [(UIView *)self->_backgroundView _setContinuousCornerRadius:16.0];
    double v10 = 17.0;
  }
  [(CALayer *)self->_borderLayer setCornerRadius:v10];
}

- (void)presentFromView:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 addSubview:self];
  [(MapsPopupMessageView *)self setAlpha:0.0];
  [(NSLayoutConstraint *)self->_activeTopConstraint setActive:0];
  timer = self->_timer;
  self->_timer = 0;

  if (sub_1000BBB44(self) == 5)
  {
    double v8 = [(MapsPopupMessageView *)self leadingAnchor];
    v9 = [v6 leadingAnchor];
    double v10 = 8.0;
    objc_super v11 = [v8 constraintEqualToAnchor:v9 constant:8.0];
  }
  else
  {
    double v8 = [(MapsPopupMessageView *)self centerXAnchor];
    v9 = [v6 centerXAnchor];
    objc_super v11 = [v8 constraintEqualToAnchor:v9];
    double v10 = 4.0;
  }

  BOOL v12 = sub_1000BBB44(self) == 1;
  CGRect v13 = [(MapsPopupMessageView *)self bottomAnchor];
  if (v12)
  {
    id v14 = [v6 safeAreaLayoutGuide];
    v15 = [v14 topAnchor];
    v16 = [v13 constraintEqualToAnchor:v15];

    v17 = [(MapsPopupMessageView *)self topAnchor];
    v18 = [v6 safeAreaLayoutGuide];
    double v19 = [v18 topAnchor];
    v20 = [v17 constraintEqualToAnchor:v19 constant:v10];
  }
  else
  {
    id v21 = [v6 topAnchor];
    v16 = [v13 constraintEqualToAnchor:v21];

    v17 = [(MapsPopupMessageView *)self topAnchor];
    v18 = [v6 topAnchor];
    v20 = [v17 constraintEqualToAnchor:v18 constant:v10];
  }

  [v11 setActive:1];
  [v16 setActive:1];
  [v6 layoutIfNeeded];
  objc_initWeak(&location, self);
  v22 = sub_1004006AC();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v39 = v4;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Presenting popup, animated: %d", buf, 8u);
  }

  if (v4) {
    double v23 = 0.3;
  }
  else {
    double v23 = 0.0;
  }
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100400700;
  v32[3] = &unk_1012E92F0;
  objc_copyWeak(&v36, &location);
  id v24 = v16;
  id v33 = v24;
  id v25 = v20;
  id v34 = v25;
  id v26 = v6;
  id v35 = v26;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_100400774;
  v28[3] = &unk_1012E9318;
  objc_copyWeak(&v30, &location);
  id v27 = v25;
  id v29 = v27;
  BOOL v31 = v4;
  +[UIView animateWithDuration:v32 animations:v28 completion:v23];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);
}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  double v7 = [(MapsPopupMessageView *)self superview];
  if (v7 && !self->_isDismissing)
  {
    self->_isDismissing = 1;
    v9 = [(MapsPopupMessageView *)self bottomAnchor];
    double v10 = [v7 topAnchor];
    objc_super v11 = [v9 constraintEqualToAnchor:v10];

    BOOL v12 = sub_1004006AC();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Dismissing popup, animated %d", (uint8_t *)&buf, 8u);
    }

    objc_initWeak(&buf, self);
    if (v4) {
      double v13 = 0.3;
    }
    else {
      double v13 = 0.0;
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100400AD4;
    v18[3] = &unk_1012E9340;
    objc_copyWeak(&v21, &buf);
    id v14 = v11;
    id v19 = v14;
    id v20 = v7;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100400B54;
    v15[3] = &unk_1012E7DB8;
    objc_copyWeak(&v17, &buf);
    v16 = v6;
    +[UIView animateWithDuration:v18 animations:v15 completion:v13];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&buf);
  }
  else
  {
    double v8 = sub_1004006AC();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ignoring dismiss", (uint8_t *)&buf, 2u);
    }

    if (v6) {
      v6[2](v6);
    }
  }
}

- (void)resetTimerAnimated:(BOOL)a3
{
  if (self->_timeout > 0.0)
  {
    v5 = sub_1004006AC();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      double timeout = self->_timeout;
      *(_DWORD *)id buf = 134217984;
      double v15 = timeout;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Scheduling timer to dismiss pop in %f", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    double v7 = self->_timeout;
    id v8 = &_dispatch_main_q;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100400D94;
    v11[3] = &unk_1012E9368;
    objc_copyWeak(&v12, (id *)buf);
    BOOL v13 = a3;
    v9 = +[GCDTimer scheduledTimerWithTimeInterval:&_dispatch_main_q queue:v11 block:v7];
    timer = self->_timer;
    self->_timer = v9;

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
}

- (void)_userInterfaceStyleDidChange
{
  id v3 = [(MapsPopupMessageView *)self traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2)
  {
    v5 = +[UIColor colorWithWhite:1.0 alpha:0.800000012];
    [(UILabel *)self->_messageLabel setTextColor:v5];

    [(UILabel *)self->_messageLabel _setDrawsAsBackdropOverlayWithBlendMode:2];
    p_borderLayer = &self->_borderLayer;
    [(CALayer *)*p_borderLayer setCompositingFilter:kCAFilterLightenBlendMode];
    double v7 = 0.400000006;
    double v8 = 1.0;
  }
  else
  {
    v9 = +[UIColor secondaryLabelColor];
    [(UILabel *)self->_messageLabel setTextColor:v9];

    [(UILabel *)self->_messageLabel _setDrawsAsBackdropOverlayWithBlendMode:0];
    p_borderLayer = &self->_borderLayer;
    [(CALayer *)*p_borderLayer setCompositingFilter:kCAFilterDarkenBlendMode];
    double v7 = 0.0799999982;
    double v8 = 0.0;
  }
  id v10 = +[UIColor colorWithWhite:v8 alpha:v7];
  -[CALayer setBorderColor:](*p_borderLayer, "setBorderColor:", [v10 CGColor]);
}

- (void)_preferredContentSizeDidChange
{
  id v3 = [(MapsPopupMessageView *)self traitCollection];
  id v4 = [v3 _maps_traitCollectionWithMaximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  id v6 = +[UIFont _maps_fontWithTextStyle:UIFontTextStyleSubheadline weight:v4 compatibleWithTraitCollection:UIFontWeightSemibold];

  [(UILabel *)self->_messageLabel setFont:v6];
  v5 = [(MapsPopupMessageView *)self superview];
  [v5 setNeedsLayout];
}

- (NSString)message
{
  return self->_message;
}

- (double)timeout
{
  return self->_timeout;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong((id *)&self->_messageLabel, 0);
  objc_storeStrong((id *)&self->_activeTopConstraint, 0);
  objc_storeStrong((id *)&self->_borderLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_materialLayer, 0);

  objc_storeStrong((id *)&self->_timer, 0);
}

@end