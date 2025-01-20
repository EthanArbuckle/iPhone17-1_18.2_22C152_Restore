@interface PedestrianARHeadingView
- (BOOL)isVisible;
- (PedestrianARHeadingView)initWithDataSource:(id)a3;
- (PedestrianARHeadingViewDataSource)dataSource;
- (UIImageView)imageView;
- (UILabel)textLabel;
- (void)redraw;
- (void)setImageView:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)transitionFromText:(id)a3 toText:(id)a4;
- (void)updateFadeTransitionToHide;
- (void)updateFadeTransitionToShow;
@end

@implementation PedestrianARHeadingView

- (PedestrianARHeadingView)initWithDataSource:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    v28 = sub_1005762E4();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315906;
      v41 = "-[PedestrianARHeadingView initWithDataSource:]";
      __int16 v42 = 2080;
      v43 = "PedestrianARHeadingView.m";
      __int16 v44 = 1024;
      int v45 = 31;
      __int16 v46 = 2080;
      v47 = "dataSource != nil";
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Invalid parameter not satisfying: %s", buf, 0x26u);
    }

    if (sub_100BB36BC())
    {
      v29 = sub_1005762E4();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = +[NSThread callStackSymbols];
        *(_DWORD *)buf = 138412290;
        v41 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v37.receiver = self;
  v37.super_class = (Class)PedestrianARHeadingView;
  v5 = -[PedestrianARHeadingView initWithFrame:](&v37, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_dataSource, v4);
    [(PedestrianARHeadingView *)v6 setAlpha:0.0];
    v7 = [(PedestrianARHeadingView *)v6 textLabel];
    [(PedestrianARHeadingView *)v6 addSubview:v7];

    v8 = [(PedestrianARHeadingView *)v6 imageView];
    [(PedestrianARHeadingView *)v6 addSubview:v8];

    v33 = objc_opt_new();
    v34 = [(PedestrianARHeadingView *)v6 imageView];
    v31 = [v34 centerYAnchor];
    v32 = [(PedestrianARHeadingView *)v6 textLabel];
    v9 = [v32 centerYAnchor];
    v10 = [v31 constraintEqualToAnchor:v9];
    v39[0] = v10;
    v11 = [(PedestrianARHeadingView *)v6 imageView];
    v12 = [v11 rightAnchor];
    [(PedestrianARHeadingView *)v6 textLabel];
    v13 = id v36 = v4;
    v14 = [v13 leftAnchor];
    v15 = [v12 constraintEqualToAnchor:v14 constant:-10.0];
    v39[1] = v15;
    v16 = +[NSArray arrayWithObjects:v39 count:2];
    [v33 addObjectsFromArray:v16];

    v35 = [(PedestrianARHeadingView *)v6 textLabel];
    v17 = [v35 centerXAnchor];
    v18 = [(PedestrianARHeadingView *)v6 centerXAnchor];
    v19 = [v17 constraintEqualToAnchor:v18];
    v38[0] = v19;
    v20 = [(PedestrianARHeadingView *)v6 textLabel];
    v21 = [v20 centerYAnchor];
    v22 = [(PedestrianARHeadingView *)v6 centerYAnchor];
    v23 = [v21 constraintEqualToAnchor:v22];
    v38[1] = v23;
    v24 = +[NSArray arrayWithObjects:v38 count:2];
    [v33 addObjectsFromArray:v24];

    +[NSLayoutConstraint activateConstraints:v33];
    v25 = +[UIColor blackColor];
    v26 = [v25 colorWithAlphaComponent:0.800000012];
    [(PedestrianARHeadingView *)v6 setBackgroundColor:v26];

    id v4 = v36;
  }

  return v6;
}

- (BOOL)isVisible
{
  if ([(PedestrianARHeadingView *)self isHidden]) {
    return 0;
  }
  id v4 = [(PedestrianARHeadingView *)self textLabel];
  v5 = [v4 text];
  BOOL v3 = v5 != 0;

  return v3;
}

- (UILabel)textLabel
{
  textLabel = self->_textLabel;
  if (!textLabel)
  {
    id v4 = (UILabel *)objc_opt_new();
    v5 = self->_textLabel;
    self->_textLabel = v4;

    [(UILabel *)self->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = +[UIColor whiteColor];
    [(UILabel *)self->_textLabel setTextColor:v6];

    [(UILabel *)self->_textLabel setNumberOfLines:0];
    v7 = +[UIFont systemFontOfSize:18.0];
    [(UILabel *)self->_textLabel setFont:v7];

    [(UILabel *)self->_textLabel setTextAlignment:1];
    textLabel = self->_textLabel;
  }

  return textLabel;
}

- (UIImageView)imageView
{
  imageView = self->_imageView;
  if (!imageView)
  {
    id v4 = (UIImageView *)objc_opt_new();
    v5 = self->_imageView;
    self->_imageView = v4;

    [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)self->_imageView setContentMode:4];
    [(UIImageView *)self->_imageView setAlpha:0.0];
    imageView = self->_imageView;
  }

  return imageView;
}

- (void)redraw
{
  BOOL v3 = [(PedestrianARHeadingView *)self textLabel];
  id v6 = [v3 text];

  id v4 = [(PedestrianARHeadingView *)self dataSource];
  v5 = [v4 textForDisplayInHeadingView:self];

  if ([v6 length] && !objc_msgSend(v5, "length"))
  {
    [(PedestrianARHeadingView *)self updateFadeTransitionToHide];
LABEL_11:
    [(PedestrianARHeadingView *)self transitionFromText:v6 toText:v5];
    goto LABEL_12;
  }
  if ([v5 length] && !objc_msgSend(v6, "length"))
  {
    [(PedestrianARHeadingView *)self updateFadeTransitionToShow];
    goto LABEL_11;
  }
  if ([v6 length]
    && [v5 length]
    && ([v6 isEqual:v5] & 1) == 0)
  {
    goto LABEL_11;
  }
LABEL_12:
}

- (void)transitionFromText:(id)a3 toText:(id)a4
{
  id v5 = a4;
  id v6 = [(PedestrianARHeadingView *)self dataSource];
  v7 = [v6 imageForDisplayInHeadingView:self];
  v8 = [(PedestrianARHeadingView *)self imageView];
  [v8 setImage:v7];

  [(PedestrianARHeadingView *)self layoutIfNeeded];
  v9 = +[CATransition animation];
  v10 = +[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
  [v9 setTimingFunction:v10];

  [v9 setType:kCATransitionFade];
  [v9 setDuration:0.4];
  v11 = [(PedestrianARHeadingView *)self textLabel];
  v12 = [v11 layer];
  [v12 addAnimation:v9 forKey:@"PedestrianARTextTransitionAnimationKey"];

  v13 = [(PedestrianARHeadingView *)self textLabel];
  [v13 setText:v5];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100D1B6A8;
  v14[3] = &unk_1012E5D08;
  v14[4] = self;
  +[UIView animateWithDuration:4 delay:v14 options:0 animations:0.4 completion:0.0];
}

- (void)updateFadeTransitionToHide
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100D1B7C8;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  +[UIView animateWithDuration:4 delay:v2 options:0 animations:0.4 completion:0.0];
}

- (void)updateFadeTransitionToShow
{
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_100D1B860;
  v2[3] = &unk_1012E5D08;
  v2[4] = self;
  +[UIView animateWithDuration:4 delay:v2 options:0 animations:0.4 completion:0.0];
}

- (PedestrianARHeadingViewDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (PedestrianARHeadingViewDataSource *)WeakRetained;
}

- (void)setTextLabel:(id)a3
{
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);

  objc_destroyWeak((id *)&self->_dataSource);
}

@end