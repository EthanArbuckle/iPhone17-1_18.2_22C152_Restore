@interface SharedTripNavBannerView
- (BOOL)bannerShouldShow;
- (NSLayoutDimension)contentHeightAnchor;
- (SharedTripNavBannerView)initWithFrame:(CGRect)a3;
- (double)buttonHeightConstant;
- (void)_updateButtonHeightConstraint;
- (void)_updateFonts;
- (void)addTarget:(id)a3 action:(SEL)a4;
- (void)dealloc;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateButtonTitle;
- (void)updateTheme;
@end

@implementation SharedTripNavBannerView

- (SharedTripNavBannerView)initWithFrame:(CGRect)a3
{
  v41.receiver = self;
  v41.super_class = (Class)SharedTripNavBannerView;
  v3 = -[SharedTripNavBannerView initWithFrame:](&v41, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    uint64_t v4 = +[MapsTheme visualEffectViewAllowingBlur:1];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIVisualEffectView *)v4;

    [(UIVisualEffectView *)v3->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SharedTripNavBannerView *)v3 addSubview:v3->_backgroundView];
    uint64_t v6 = +[UIButton buttonWithType:0];
    shareETAButton = v3->_shareETAButton;
    v3->_shareETAButton = (UIButton *)v6;

    [(UIButton *)v3->_shareETAButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(UIVisualEffectView *)v3->_backgroundView contentView];
    [v8 addSubview:v3->_shareETAButton];

    v9 = v3->_backgroundView;
    v10 = [(UIVisualEffectView *)v9 window];
    v11 = [v10 screen];
    if (v11)
    {
      v12 = [(UIVisualEffectView *)v9 window];
      v13 = [v12 screen];
      [v13 nativeScale];
      double v15 = v14;
    }
    else
    {
      v12 = +[UIScreen mainScreen];
      [v12 nativeScale];
      double v15 = v16;
    }

    if (v15 <= 0.0) {
      double v17 = 1.0;
    }
    else {
      double v17 = 1.0 / v15;
    }

    v18 = [(UIButton *)v3->_shareETAButton heightAnchor];
    uint64_t v19 = [v18 constraintEqualToConstant:0.0];
    buttonHeightConstraint = v3->_buttonHeightConstraint;
    v3->_buttonHeightConstraint = (NSLayoutConstraint *)v19;

    v40 = [(UIVisualEffectView *)v3->_backgroundView heightAnchor];
    v39 = [(SharedTripNavBannerView *)v3 heightAnchor];
    v38 = [v40 constraintEqualToAnchor:v39 constant:-v17];
    v42[0] = v38;
    v37 = [(UIVisualEffectView *)v3->_backgroundView widthAnchor];
    v36 = [(SharedTripNavBannerView *)v3 widthAnchor];
    v35 = [v37 constraintEqualToAnchor:v36];
    v42[1] = v35;
    v34 = [(UIVisualEffectView *)v3->_backgroundView topAnchor];
    v33 = [(SharedTripNavBannerView *)v3 topAnchor];
    v32 = [v34 constraintEqualToAnchor:v33 constant:v17];
    v42[2] = v32;
    v31 = [(UIButton *)v3->_shareETAButton widthAnchor];
    v21 = [(SharedTripNavBannerView *)v3 widthAnchor];
    v22 = [v31 constraintEqualToAnchor:v21];
    v42[3] = v22;
    v42[4] = v3->_buttonHeightConstraint;
    v23 = [(UIButton *)v3->_shareETAButton centerXAnchor];
    v24 = [(SharedTripNavBannerView *)v3 centerXAnchor];
    v25 = [v23 constraintEqualToAnchor:v24];
    v42[5] = v25;
    v26 = [(UIButton *)v3->_shareETAButton topAnchor];
    v27 = [(SharedTripNavBannerView *)v3 topAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    v42[6] = v28;
    v29 = +[NSArray arrayWithObjects:v42 count:7];
    +[NSLayoutConstraint activateConstraints:v29];

    [(SharedTripNavBannerView *)v3 _updateFonts];
    [(SharedTripNavBannerView *)v3 _updateButtonHeightConstraint];
  }
  return v3;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SharedTripNavBannerView;
  [(SharedTripNavBannerView *)&v4 dealloc];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SharedTripNavBannerView;
  id v4 = a3;
  [(MapsThemeView *)&v9 traitCollectionDidChange:v4];
  v5 = [(SharedTripNavBannerView *)self traitCollection];
  uint64_t v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  uint64_t v8 = sub_1000E93B0(v6, v7);
  if (v8)
  {
    [(SharedTripNavBannerView *)self _updateFonts];
    [(SharedTripNavBannerView *)self _updateButtonHeightConstraint];
  }
}

- (NSLayoutDimension)contentHeightAnchor
{
  return (NSLayoutDimension *)[(UIButton *)self->_shareETAButton heightAnchor];
}

- (BOOL)bannerShouldShow
{
  v2 = +[MSPSharedTripService sharedInstance];
  v3 = [v2 receivers];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (void)updateButtonTitle
{
  v3 = +[MSPSharedTripService sharedInstance];
  id v8 = [v3 receivers];

  BOOL v4 = +[NSBundle mainBundle];
  v5 = [v4 localizedStringForKey:@"[Share ETA] nav banner button" value:@"localized string not found" table:0];

  shareETAButton = self->_shareETAButton;
  v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, [v8 count]);
  [(UIButton *)shareETAButton setTitle:v7 forState:0];
}

- (void)_updateButtonHeightConstraint
{
  [(SharedTripNavBannerView *)self buttonHeightConstant];
  buttonHeightConstraint = self->_buttonHeightConstraint;

  -[NSLayoutConstraint setConstant:](buttonHeightConstraint, "setConstant:");
}

- (void)_updateFonts
{
  id v6 = [(SharedTripNavBannerView *)self traitCollection];
  v3 = [v6 _maps_traitCollectionByClampingContentSizeCategoryWithMinimumContentSizeCategory:0 maximumContentSizeCategory:UIContentSizeCategoryExtraExtraExtraLarge];
  BOOL v4 = +[UIFont system20CompatibleWithTraitCollection:v3];
  v5 = [(UIButton *)self->_shareETAButton titleLabel];
  [v5 setFont:v4];
}

- (double)buttonHeightConstant
{
  v2 = [(UIButton *)self->_shareETAButton titleLabel];
  v3 = [v2 font];
  [v3 _mapkit_scaledValueForValue:46.0];
  double v5 = v4;

  return v5;
}

- (void)updateTheme
{
  shareETAButton = self->_shareETAButton;
  id v4 = [(SharedTripNavBannerView *)self theme];
  v3 = [v4 keyColor];
  [(UIButton *)shareETAButton setTitleColor:v3 forState:0];
}

- (void)addTarget:(id)a3 action:(SEL)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonHeightConstraint, 0);
  objc_storeStrong((id *)&self->_shareETAButton, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end