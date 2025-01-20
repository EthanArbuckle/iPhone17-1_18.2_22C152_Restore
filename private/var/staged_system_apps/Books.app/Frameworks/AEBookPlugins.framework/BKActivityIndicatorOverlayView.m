@interface BKActivityIndicatorOverlayView
- (BKActivityIndicatorOverlayView)initWithBackgroundColor:(id)a3 foregroundColor:(id)a4;
- (UIActivityIndicatorView)activityIndicator;
- (void)_setAlpha:(double)a3 animated:(BOOL)a4 animationDelay:(double)a5;
- (void)hideIndicatorAnimated:(BOOL)a3 animationDelay:(double)a4;
- (void)setActivityIndicator:(id)a3;
- (void)setAlpha:(double)a3;
- (void)showIndicatorCenteredInView:(id)a3 animated:(BOOL)a4 animationDelay:(double)a5;
@end

@implementation BKActivityIndicatorOverlayView

- (BKActivityIndicatorOverlayView)initWithBackgroundColor:(id)a3 foregroundColor:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:101];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 setColor:v7];

  [v8 startAnimating];
  [v8 setHidesWhenStopped:0];
  [v8 sizeToFit];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGRectMultiply();
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;
  v45.receiver = self;
  v45.super_class = (Class)BKActivityIndicatorOverlayView;
  v25 = -[BKActivityIndicatorOverlayView initWithFrame:](&v45, "initWithFrame:");
  v26 = v25;
  if (v25)
  {
    [(BKActivityIndicatorOverlayView *)v25 setAutoresizingMask:45];
    [(BKActivityIndicatorOverlayView *)v26 setBackgroundColor:v6];
    v27 = [(BKActivityIndicatorOverlayView *)v26 layer];
    [v27 setCornerRadius:10.0];

    [(BKActivityIndicatorOverlayView *)v26 setUserInteractionEnabled:0];
    [(BKActivityIndicatorOverlayView *)v26 setAlpha:0.0];
    objc_storeStrong((id *)&v26->_activityIndicator, v8);
    [(BKActivityIndicatorOverlayView *)v26 addSubview:v26->_activityIndicator];
    v43 = [(UIActivityIndicatorView *)v26->_activityIndicator widthAnchor];
    v47.origin.x = v10;
    v47.origin.y = v12;
    v47.size.width = v14;
    v47.size.height = v16;
    v42 = [v43 constraintEqualToConstant:CGRectGetWidth(v47)];
    v46[0] = v42;
    v41 = [(UIActivityIndicatorView *)v26->_activityIndicator heightAnchor];
    v48.origin.x = v10;
    v48.origin.y = v12;
    v48.size.width = v14;
    v48.size.height = v16;
    v40 = [v41 constraintEqualToConstant:CGRectGetHeight(v48)];
    v46[1] = v40;
    v39 = [(BKActivityIndicatorOverlayView *)v26 widthAnchor];
    v49.origin.x = v18;
    v49.origin.y = v20;
    v49.size.width = v22;
    v49.size.height = v24;
    v38 = [v39 constraintEqualToConstant:CGRectGetWidth(v49)];
    v46[2] = v38;
    v37 = [(BKActivityIndicatorOverlayView *)v26 heightAnchor];
    v50.origin.x = v18;
    v50.origin.y = v20;
    v50.size.width = v22;
    v50.size.height = v24;
    v28 = [v37 constraintEqualToConstant:CGRectGetHeight(v50)];
    v46[3] = v28;
    [(UIActivityIndicatorView *)v26->_activityIndicator centerXAnchor];
    v29 = id v44 = v6;
    v30 = [(BKActivityIndicatorOverlayView *)v26 centerXAnchor];
    v31 = [v29 constraintEqualToAnchor:v30];
    v46[4] = v31;
    v32 = [(UIActivityIndicatorView *)v26->_activityIndicator centerYAnchor];
    v33 = [(BKActivityIndicatorOverlayView *)v26 centerYAnchor];
    v34 = [v32 constraintEqualToAnchor:v33];
    v46[5] = v34;
    v35 = +[NSArray arrayWithObjects:v46 count:6];
    +[NSLayoutConstraint activateConstraints:v35];

    id v6 = v44;
  }

  return v26;
}

- (void)setAlpha:(double)a3
{
  activityIndicator = self->_activityIndicator;
  if (a3 <= 0.0) {
    [(UIActivityIndicatorView *)activityIndicator stopAnimating];
  }
  else {
    [(UIActivityIndicatorView *)activityIndicator startAnimating];
  }
  v6.receiver = self;
  v6.super_class = (Class)BKActivityIndicatorOverlayView;
  [(BKActivityIndicatorOverlayView *)&v6 setAlpha:a3];
}

- (void)_setAlpha:(double)a3 animated:(BOOL)a4 animationDelay:(double)a5
{
  BOOL v6 = a4;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_7AECC;
  v14[3] = &unk_1DC500;
  v14[4] = self;
  *(double *)&v14[5] = a3;
  double v9 = objc_retainBlock(v14);
  CGFloat v10 = v9;
  if (v6)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_7AED8;
    v12[3] = &unk_1DADC0;
    double v13 = v9;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_7AEE8;
    v11[3] = &unk_1DC890;
    *(double *)&v11[5] = a3;
    v11[4] = self;
    +[UIView animateWithDuration:4 delay:v12 options:v11 animations:0.3 completion:a5];
  }
  else
  {
    ((void (*)(void *))v9[2])(v9);
  }
}

- (void)showIndicatorCenteredInView:(id)a3 animated:(BOOL)a4 animationDelay:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [v8 addSubview:self];
  [v8 bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v19.origin.x = v10;
  v19.origin.y = v12;
  v19.size.width = v14;
  v19.size.height = v16;
  double MidX = CGRectGetMidX(v19);
  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  -[BKActivityIndicatorOverlayView setCenter:](self, "setCenter:", MidX, CGRectGetMidY(v20));

  [(BKActivityIndicatorOverlayView *)self _setAlpha:v6 animated:1.0 animationDelay:a5];
}

- (void)hideIndicatorAnimated:(BOOL)a3 animationDelay:(double)a4
{
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (void).cxx_destruct
{
}

@end