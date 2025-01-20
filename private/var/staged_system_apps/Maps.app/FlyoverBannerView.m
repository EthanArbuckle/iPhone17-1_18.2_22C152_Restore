@interface FlyoverBannerView
- (CGSize)intrinsicContentSize;
- (FlyoverBannerView)initWithDelegate:(id)a3;
- (FlyoverBannerViewDelegate)delegate;
- (NSString)locationString;
- (UIButton)stopButton;
- (UILabel)textLabel;
- (UIVisualEffectView)effectView;
- (void)setDelegate:(id)a3;
- (void)setEffectView:(id)a3;
- (void)setLocationString:(id)a3;
- (void)setStopButton:(id)a3;
- (void)setTextLabel:(id)a3;
- (void)stopButtonPressed;
@end

@implementation FlyoverBannerView

- (FlyoverBannerView)initWithDelegate:(id)a3
{
  id v4 = a3;
  v54.receiver = self;
  v54.super_class = (Class)FlyoverBannerView;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[FlyoverBannerView initWithFrame:](&v54, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v4);
    [(FlyoverBannerView *)v9 setAccessibilityIdentifier:@"FlyoverBannerView"];
    id v10 = objc_alloc((Class)UIVisualEffectView);
    +[UIBlurEffect effectWithStyle:2];
    v11 = id v53 = v4;
    v12 = (UIVisualEffectView *)[v10 initWithEffect:v11];
    effectView = v9->_effectView;
    v9->_effectView = v12;

    [(UIVisualEffectView *)v9->_effectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIVisualEffectView *)v9->_effectView _setCornerRadius:1 continuous:15 maskedCorners:13.0];
    [(UIVisualEffectView *)v9->_effectView setAccessibilityIdentifier:@"FlyoverBannerEffectView"];
    [(FlyoverBannerView *)v9 addSubview:v9->_effectView];
    v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
    textLabel = v9->_textLabel;
    v9->_textLabel = v14;

    [(UILabel *)v9->_textLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v16 = +[NSBundle mainBundle];
    v17 = [v16 localizedStringForKey:@"Flyover [banner title]" value:@"localized string not found" table:0];
    [(UILabel *)v9->_textLabel setText:v17];

    [(UILabel *)v9->_textLabel setAccessibilityIdentifier:@"FlyoverBannerEffectTextLabel"];
    [(FlyoverBannerView *)v9 addSubview:v9->_textLabel];
    v18 = +[UIImage systemImageNamed:@"multiply.circle.fill"];
    v52 = [v18 imageWithRenderingMode:2];

    uint64_t v19 = +[UIButton buttonWithType:0];
    stopButton = v9->_stopButton;
    v9->_stopButton = (UIButton *)v19;

    [(UIButton *)v9->_stopButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = +[UIColor whiteColor];
    [(UIButton *)v9->_stopButton setTintColor:v21];

    [(UIButton *)v9->_stopButton addTarget:v9 action:"stopButtonPressed" forControlEvents:64];
    [(UIButton *)v9->_stopButton setImage:v52 forState:0];
    [(UIButton *)v9->_stopButton setAccessibilityIdentifier:@"FlyoverBannerEffectStopButton"];
    [(FlyoverBannerView *)v9 addSubview:v9->_stopButton];
    v51 = [(UIVisualEffectView *)v9->_effectView centerXAnchor];
    v50 = [(FlyoverBannerView *)v9 centerXAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v55[0] = v49;
    v48 = [(UIVisualEffectView *)v9->_effectView centerYAnchor];
    v47 = [(FlyoverBannerView *)v9 centerYAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v55[1] = v46;
    v45 = [(UIVisualEffectView *)v9->_effectView heightAnchor];
    v44 = [(FlyoverBannerView *)v9 heightAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v55[2] = v43;
    v42 = [(UIVisualEffectView *)v9->_effectView widthAnchor];
    v41 = [(FlyoverBannerView *)v9 widthAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v55[3] = v40;
    v39 = [(UILabel *)v9->_textLabel leadingAnchor];
    v38 = [(FlyoverBannerView *)v9 leadingAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:13.0];
    v55[4] = v37;
    v36 = [(UILabel *)v9->_textLabel centerYAnchor];
    v35 = [(FlyoverBannerView *)v9 centerYAnchor];
    v34 = [v36 constraintEqualToAnchor:v35];
    v55[5] = v34;
    v33 = [(UIButton *)v9->_stopButton trailingAnchor];
    v32 = [(FlyoverBannerView *)v9 trailingAnchor];
    v22 = [v33 constraintEqualToAnchor:v32 constant:-6.0];
    v55[6] = v22;
    v23 = [(UIButton *)v9->_stopButton centerYAnchor];
    v24 = [(FlyoverBannerView *)v9 centerYAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v55[7] = v25;
    v26 = [(UIButton *)v9->_stopButton heightAnchor];
    v27 = [v26 constraintEqualToConstant:20.0];
    v55[8] = v27;
    v28 = [(UIButton *)v9->_stopButton widthAnchor];
    v29 = [v28 constraintEqualToConstant:20.0];
    v55[9] = v29;
    v30 = +[NSArray arrayWithObjects:v55 count:10];
    +[NSLayoutConstraint activateConstraints:v30];

    id v4 = v53;
  }

  return v9;
}

- (CGSize)intrinsicContentSize
{
  double v2 = 360.0;
  double v3 = 26.0;
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (void)setLocationString:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_locationString, a3);
  if ([v5 length])
  {
    v6 = +[NSBundle mainBundle];
    v7 = [v6 localizedStringForKey:@"Flyover [banner title]" value:@"localized string not found" table:0];
    v8 = +[NSString stringWithFormat:@"%@ - %@", v7, v5];
  }
  else
  {
    v6 = +[NSBundle mainBundle];
    v8 = [v6 localizedStringForKey:@"Flyover [banner title]" value:@"localized string not found" table:0];
  }

  v9 = [(FlyoverBannerView *)self textLabel];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100D05380;
  v11[3] = &unk_1012E5D58;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  +[UIView transitionWithView:v9 duration:5242880 options:v11 animations:0 completion:0.300000012];
}

- (void)stopButtonPressed
{
  id v3 = [(FlyoverBannerView *)self delegate];
  [v3 stopFlyoverRequestedByBanner:self];
}

- (NSString)locationString
{
  return self->_locationString;
}

- (UIVisualEffectView)effectView
{
  return self->_effectView;
}

- (void)setEffectView:(id)a3
{
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (void)setTextLabel:(id)a3
{
}

- (UIButton)stopButton
{
  return self->_stopButton;
}

- (void)setStopButton:(id)a3
{
}

- (FlyoverBannerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FlyoverBannerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_effectView, 0);

  objc_storeStrong((id *)&self->_locationString, 0);
}

@end