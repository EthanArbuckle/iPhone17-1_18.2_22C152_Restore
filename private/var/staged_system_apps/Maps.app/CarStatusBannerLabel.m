@interface CarStatusBannerLabel
- (CGImage)maskImage;
- (CarStatusBannerLabel)initWithChromeViewController:(id)a3;
- (void)dealloc;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)reloadContent;
- (void)valueChangedForGEOConfigKey:(id)a3;
@end

@implementation CarStatusBannerLabel

- (CarStatusBannerLabel)initWithChromeViewController:(id)a3
{
  id v4 = a3;
  v75.receiver = self;
  v75.super_class = (Class)CarStatusBannerLabel;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v8 = -[CarFocusableBlurControl initWithFrame:](&v75, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v9 = v8;
  if (v8)
  {
    [(CarFocusableBlurControl *)v8 setCastsShadow:0];
    [(CarFocusableBlurControl *)v9 setHidesBlur:1];
    [(CarStatusBannerLabel *)v9 setAccessibilityIdentifier:@"CarStatusBannerLabel"];
    id v10 = objc_storeWeak((id *)&v9->_chromeViewController, v4);
    v9->_sceneType = (int64_t)[v4 sceneType];
    id v74 = v4;

    v11 = [objc_alloc((Class)MUBlurView) initWithVariableBlurWithRadius:-[CarStatusBannerLabel maskImage](v9, "maskImage") maskImage:2.0];
    blurView = v9->_blurView;
    v9->_blurView = v11;

    [(MUBlurView *)v9->_blurView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CarFocusableControl *)v9 addSubview:v9->_blurView];
    v13 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
    titleLabel = v9->_titleLabel;
    v9->_titleLabel = v13;

    [(MapsFadingLabel *)v9->_titleLabel setAccessibilityIdentifier:@"TitleLabel"];
    [(MapsFadingLabel *)v9->_titleLabel setNumberOfLines:1];
    [(MapsFadingLabel *)v9->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v15) = 1148846080;
    [(MapsFadingLabel *)v9->_titleLabel setContentHuggingPriority:0 forAxis:v15];
    LODWORD(v16) = 1132068864;
    [(MapsFadingLabel *)v9->_titleLabel setContentCompressionResistancePriority:0 forAxis:v16];
    [(MapsFadingLabel *)v9->_titleLabel setTextAlignment:1];
    v17 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleCaption2 weight:UIFontWeightRegular];
    [(MapsFadingLabel *)v9->_titleLabel setFont:v17];

    v18 = +[UIColor clearColor];
    [(MapsFadingLabel *)v9->_titleLabel setBackgroundColor:v18];

    [(MapsFadingLabel *)v9->_titleLabel setBaselineAdjustment:1];
    v19 = (UIImageView *)objc_alloc_init((Class)UIImageView);
    chevronImageView = v9->_chevronImageView;
    v9->_chevronImageView = v19;

    [(UIImageView *)v9->_chevronImageView setAccessibilityIdentifier:@"ChevronImageView"];
    [(UIImageView *)v9->_chevronImageView setContentMode:1];
    v21 = +[UIColor darkGrayColor];
    [(UIImageView *)v9->_chevronImageView setTintColor:v21];

    [(UIImageView *)v9->_chevronImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v22) = 1148846080;
    [(UIImageView *)v9->_chevronImageView setContentHuggingPriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIImageView *)v9->_chevronImageView setContentCompressionResistancePriority:0 forAxis:v23];
    [(UIImageView *)v9->_chevronImageView setHidden:1];
    id v24 = objc_alloc((Class)UIStackView);
    v77[0] = v9->_titleLabel;
    v77[1] = v9->_chevronImageView;
    v25 = +[NSArray arrayWithObjects:v77 count:2];
    id v26 = [v24 initWithArrangedSubviews:v25];

    [v26 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v26 setAxis:0];
    [v26 setDistribution:0];
    [v26 setSpacing:3.0];
    [v26 setAlignment:3];
    [(CarFocusableControl *)v9 addSubview:v26];
    v27 = [(MUBlurView *)v9->_blurView widthAnchor];
    uint64_t v28 = [v27 constraintEqualToConstant:165.0];
    widthConstraint = v9->_widthConstraint;
    v9->_widthConstraint = (NSLayoutConstraint *)v28;

    id WeakRetained = objc_loadWeakRetained((id *)&v9->_chromeViewController);
    id v31 = [WeakRetained sceneType];

    if (v31 == (id)1) {
      [(NSLayoutConstraint *)v9->_widthConstraint setActive:1];
    }
    v32 = [(MUBlurView *)v9->_blurView topAnchor];
    v33 = [(CarStatusBannerLabel *)v9 topAnchor];
    uint64_t v34 = [v32 constraintEqualToAnchor:v33];
    topConstraint = v9->_topConstraint;
    v9->_topConstraint = (NSLayoutConstraint *)v34;

    v36 = [(MUBlurView *)v9->_blurView bottomAnchor];
    v37 = [(CarStatusBannerLabel *)v9 bottomAnchor];
    uint64_t v38 = [v36 constraintEqualToAnchor:v37];
    bottomConstraint = v9->_bottomConstraint;
    v9->_bottomConstraint = (NSLayoutConstraint *)v38;

    v40 = [v26 leadingAnchor];
    v41 = [(CarStatusBannerLabel *)v9 leadingAnchor];
    uint64_t v42 = [v40 constraintGreaterThanOrEqualToAnchor:v41 constant:6.0];
    leadingConstraint = v9->_leadingConstraint;
    v9->_leadingConstraint = (NSLayoutConstraint *)v42;

    v44 = [v26 trailingAnchor];
    v45 = [(CarStatusBannerLabel *)v9 trailingAnchor];
    uint64_t v46 = [v44 constraintLessThanOrEqualToAnchor:v45 constant:-6.0];
    trailingConstraint = v9->_trailingConstraint;
    v9->_trailingConstraint = (NSLayoutConstraint *)v46;

    v73 = [(MUBlurView *)v9->_blurView leadingAnchor];
    v72 = [(CarStatusBannerLabel *)v9 leadingAnchor];
    v71 = [v73 constraintEqualToAnchor:v72];
    v76[0] = v71;
    v70 = [(MUBlurView *)v9->_blurView trailingAnchor];
    v69 = [(CarStatusBannerLabel *)v9 trailingAnchor];
    v68 = [v70 constraintEqualToAnchor:v69];
    v76[1] = v68;
    v76[2] = v9->_topConstraint;
    v76[3] = v9->_bottomConstraint;
    v67 = [v26 topAnchor];
    v66 = [(CarStatusBannerLabel *)v9 topAnchor];
    v65 = [v67 constraintEqualToAnchor:v66];
    v76[4] = v65;
    v64 = [v26 bottomAnchor];
    v63 = [(CarStatusBannerLabel *)v9 bottomAnchor];
    v62 = [v64 constraintEqualToAnchor:v63];
    v76[5] = v62;
    v76[6] = v9->_leadingConstraint;
    v76[7] = v9->_trailingConstraint;
    v61 = [v26 centerXAnchor];
    v60 = [(CarStatusBannerLabel *)v9 centerXAnchor];
    v48 = [v61 constraintEqualToAnchor:v60];
    v76[8] = v48;
    v49 = [v26 heightAnchor];
    v50 = [v49 constraintEqualToConstant:20.0];
    v76[9] = v50;
    v51 = [(UIImageView *)v9->_chevronImageView widthAnchor];
    v52 = [v51 constraintEqualToConstant:14.0];
    v76[10] = v52;
    v53 = [(UIImageView *)v9->_chevronImageView heightAnchor];
    v54 = [v53 constraintEqualToConstant:14.0];
    v76[11] = v54;
    v55 = +[NSArray arrayWithObjects:v76 count:12];
    +[NSLayoutConstraint activateConstraints:v55];

    v56 = +[MapsLightLevelController sharedController];
    [v56 addObserver:v9];

    _GEOConfigAddDelegateListenerForKey();
    v57 = +[NSUserDefaults standardUserDefaults];
    [v57 addObserver:v9 forKeyPath:@"NavigationCarPlayPersistedGuidanceSignStyle" options:0 context:&off_1012E94B8];

    v58 = +[NSUserDefaults standardUserDefaults];
    v9->_navigationGuidanceSignStyle = (int64_t)[v58 integerForKey:@"NavigationCarPlayPersistedGuidanceSignStyle"];

    v9->_disableBlur = GEOConfigGetBOOL();
    [(CarStatusBannerLabel *)v9 reloadContent];

    id v4 = v74;
  }

  return v9;
}

- (void)dealloc
{
  v3 = +[MapsLightLevelController sharedController];
  [v3 removeObserver:self];

  GEOConfigRemoveDelegateListenerForAllKeys();
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 removeObserver:self forKeyPath:@"NavigationCarPlayPersistedGuidanceSignStyle"];

  v5.receiver = self;
  v5.super_class = (Class)CarStatusBannerLabel;
  [(CarStatusBannerLabel *)&v5 dealloc];
}

- (CGImage)maskImage
{
  v2 = +[UIImage imageNamed:@"OfflineBannerBlur"];
  v7.double width = 195.0;
  v7.double height = 50.0;
  UIGraphicsBeginImageContextWithOptions(v7, 0, 0.0);
  [v2 drawInRect:CGRectMake(0.0, 0.0, 195.0, 50.0)];
  v3 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v4 = v3;
  objc_super v5 = (CGImage *)[v4 CGImage];

  return v5;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10
    && a6 == &off_1012E94B8
    && [v10 isEqualToString:@"NavigationCarPlayPersistedGuidanceSignStyle"])
  {
    v13 = +[NSUserDefaults standardUserDefaults];
    self->_navigationGuidanceSignStyle = (int64_t)[v13 integerForKey:@"NavigationCarPlayPersistedGuidanceSignStyle"];

    [(CarStatusBannerLabel *)self reloadContent];
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)CarStatusBannerLabel;
    [(CarStatusBannerLabel *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CarStatusBannerLabel;
  [(CarFocusableControl *)&v10 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  CGSize v7 = [v6 nextFocusedItem];
  if (v7 == self)
  {

LABEL_5:
    [(CarStatusBannerLabel *)self reloadContent];
    goto LABEL_6;
  }
  v8 = v7;
  v9 = [v6 previouslyFocusedItem];

  if (v9 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)reloadContent
{
  if (self->_navigationGuidanceSignStyle == 1)
  {
    v3 = +[MNNavigationService sharedService];
    if ([v3 isInNavigatingState]) {
      BOOL v4 = self->_sceneType == 1;
    }
    else {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }
  if (([(CarStatusBannerLabel *)self isFocused] & 1) != 0
    || ([(CarStatusBannerLabel *)self isSelected] & 1) != 0)
  {
    unsigned int v5 = 1;
  }
  else
  {
    unsigned int v5 = [(CarStatusBannerLabel *)self isHighlighted];
  }
  id v6 = +[NSBundle mainBundle];
  CGSize v7 = v6;
  if (v4) {
    CFStringRef v8 = @"Offline";
  }
  else {
    CFStringRef v8 = @"Using Offline Maps";
  }
  if (v4) {
    double v9 = 100.0;
  }
  else {
    double v9 = 165.0;
  }
  objc_super v10 = [v6 localizedStringForKey:v8 value:@"localized string not found" table:nil];
  [(MapsFadingLabel *)self->_titleLabel setText:v10];

  [(NSLayoutConstraint *)self->_widthConstraint setConstant:v9];
  uint64_t BOOL = GEOConfigGetBOOL();
  [(CarFocusableControl *)self setEnabled:BOOL];
  [(UIImageView *)self->_chevronImageView setHidden:BOOL ^ 1];
  if (v5) {
    CFStringRef v12 = @"chevron.forward.circle.fill";
  }
  else {
    CFStringRef v12 = @"chevron.forward";
  }
  v13 = +[UIImage systemImageNamed:v12];
  [(UIImageView *)self->_chevronImageView setImage:v13];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  double v15 = [WeakRetained lightLevelController];
  if ([v15 shouldUseNightMode]) {
    +[UIColor systemWhiteColor];
  }
  else {
  id v27 = +[UIColor systemBlackColor];
  }

  id v16 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  v17 = [v16 lightLevelController];
  if ([v17 shouldUseNightMode]) {
    +[UIColor systemBlackColor];
  }
  else {
  v18 = +[UIColor systemWhiteColor];
  }

  if (v5) {
    id v19 = v18;
  }
  else {
    id v19 = v27;
  }
  [(MapsFadingLabel *)self->_titleLabel setTextColor:v19];
  [(UIImageView *)self->_chevronImageView setTintColor:v19];
  if (v5)
  {
    v20 = +[UIColor _carSystemFocusColor];
    p_blurView = &self->_blurView;
    [(MUBlurView *)self->_blurView setNonBlurredColor:v20];

    double v22 = 0.0;
    double v23 = -4.0;
    uint64_t v24 = 2;
    double v25 = 0.0;
  }
  else
  {
    id v26 = +[UIColor clearColor];
    p_blurView = &self->_blurView;
    [(MUBlurView *)self->_blurView setNonBlurredColor:v26];

    uint64_t v24 = 2 * self->_disableBlur;
    double v25 = -15.0;
    double v22 = 15.0;
    double v23 = -6.0;
  }
  [(MUBlurView *)*p_blurView setStyle:v24];
  [(MUBlurView *)*p_blurView _setContinuousCornerRadius:10.0];
  [(NSLayoutConstraint *)self->_topConstraint setConstant:v25];
  [(NSLayoutConstraint *)self->_bottomConstraint setConstant:v22];
  [(NSLayoutConstraint *)self->_trailingConstraint setConstant:v23];
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == MapsConfig_OfflineOnlyData && a3.var1 == off_1015F0B08) {
    [(CarStatusBannerLabel *)self reloadContent];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingConstraint, 0);
  objc_storeStrong((id *)&self->_leadingConstraint, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_topConstraint, 0);
  objc_storeStrong((id *)&self->_widthConstraint, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_chevronImageView, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end