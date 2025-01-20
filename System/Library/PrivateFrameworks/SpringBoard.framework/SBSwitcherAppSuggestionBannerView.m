@interface SBSwitcherAppSuggestionBannerView
- (BOOL)_isSingleLine;
- (BOOL)isHighlighted;
- (SBBestAppSuggestion)representedAppSuggestion;
- (SBSwitcherAppSuggestionBannerView)initWithFrame:(CGRect)a3 appSuggestion:(id)a4 style:(unint64_t)a5;
- (SBSwitcherAppSuggestionBannerView)initWithRecipe:(int64_t)a3;
- (id)_appTitleForSuggestion:(id)a3;
- (id)_descriptionFont;
- (id)_descriptionStringForSuggestion:(id)a3;
- (id)_firstWakeGreetingString;
- (id)_iconImageCache;
- (id)_iconImageFromAppWithBundleIdentifier:(id)a3 withIconImageCache:(id)a4;
- (id)_iconImageViewFromAppWithBundleIdentifier:(id)a3 withIconImageCache:(id)a4;
- (id)_meCardShortName;
- (id)_textStyle;
- (id)_titleFont;
- (unint64_t)style;
- (void)_configureConstraints;
- (void)_createAppLabelForSuggestion:(id)a3;
- (void)_createDarkeningView;
- (void)_createDescriptionLabelForSuggestion:(id)a3;
- (void)_createIconViewForSuggestion:(id)a3;
- (void)_updateAppearanceForCurrentUserInterfaceStyle;
- (void)_updateIconViewImage;
- (void)setHighlighted:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation SBSwitcherAppSuggestionBannerView

- (SBSwitcherAppSuggestionBannerView)initWithRecipe:(int64_t)a3
{
  return -[SBSwitcherAppSuggestionBannerView initWithFrame:appSuggestion:style:](self, "initWithFrame:appSuggestion:style:", 0, 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (SBSwitcherAppSuggestionBannerView)initWithFrame:(CGRect)a3 appSuggestion:(id)a4 style:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v29[3] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v14 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:0];
  v28[0] = v14;
  v29[0] = @"cmdTabLight";
  v15 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:1];
  v28[1] = v15;
  v29[1] = @"cmdTabLight";
  v16 = [MEMORY[0x1E4F42F80] traitCollectionWithUserInterfaceStyle:2];
  v28[2] = v16;
  v29[2] = @"cmdTabDark";
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:3];

  v27.receiver = self;
  v27.super_class = (Class)SBSwitcherAppSuggestionBannerView;
  v18 = [(PLPlatterView *)&v27 initWithRecipeNamesByTraitCollection:v17 inBundle:v13];
  v19 = v18;
  if (v18)
  {
    v18->_style = a5;
    p_suggestion = &v18->_suggestion;
    objc_storeStrong((id *)&v18->_suggestion, a4);
    [(PLPlatterView *)v19 setHasShadow:1];
    int v24 = 1036831949;
    long long v25 = xmmword_1D8FD12D0;
    uint64_t v26 = 0x4036800000000000;
    [(PLPlatterView *)v19 setShadowAttributes:&v24];
    -[SBSwitcherAppSuggestionBannerView setFrame:](v19, "setFrame:", x, y, width, height);
    [(SBSwitcherAppSuggestionBannerView *)v19 _createAppLabelForSuggestion:*p_suggestion];
    [(SBSwitcherAppSuggestionBannerView *)v19 _createIconViewForSuggestion:*p_suggestion];
    [(SBSwitcherAppSuggestionBannerView *)v19 _createDescriptionLabelForSuggestion:*p_suggestion];
    [(SBSwitcherAppSuggestionBannerView *)v19 _createDarkeningView];
    [(SBSwitcherAppSuggestionBannerView *)v19 _configureConstraints];
    [(SBSwitcherAppSuggestionBannerView *)v19 _updateAppearanceForCurrentUserInterfaceStyle];
    v21 = [(SBSwitcherAppSuggestionBannerView *)v19 _borderView];
    [(PLPlatterView *)v19 _continuousCornerRadius];
    objc_msgSend(v21, "_setContinuousCornerRadius:");
    v22 = [v21 layer];
    [v22 setBorderWidth:0.3];
  }
  return v19;
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    [(UIView *)self->_highlightDarkeningView setHidden:!a3];
  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (SBBestAppSuggestion)representedAppSuggestion
{
  return self->_suggestion;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v5 = [(SBSwitcherAppSuggestionBannerView *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7)
  {
    [(SBSwitcherAppSuggestionBannerView *)self _updateAppearanceForCurrentUserInterfaceStyle];
  }
}

- (void)_updateAppearanceForCurrentUserInterfaceStyle
{
  v3 = [(SBSwitcherAppSuggestionBannerView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  v5 = [(SBSwitcherAppSuggestionBannerView *)self _borderView];
  uint64_t v6 = [v5 layer];
  double v7 = 0.0;
  if (v4 == 2) {
    double v7 = 1.0;
  }
  id v8 = [MEMORY[0x1E4F428B8] colorWithWhite:v7 alpha:0.08];
  objc_msgSend(v6, "setBorderColor:", objc_msgSend(v8, "CGColor"));

  [(SBSwitcherAppSuggestionBannerView *)self _updateIconViewImage];
}

- (id)_textStyle
{
  id v3 = (id)*MEMORY[0x1E4F43880];
  if ([(SBSwitcherAppSuggestionBannerView *)self _isSingleLine])
  {
    id v4 = (id)*MEMORY[0x1E4F43890];

    id v3 = v4;
  }
  return v3;
}

- (id)_titleFont
{
  id v3 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
  id v4 = [(SBSwitcherAppSuggestionBannerView *)self _textStyle];
  v5 = [v3 preferredFontForTextStyle:v4 hiFontStyle:4];

  return v5;
}

- (id)_descriptionFont
{
  id v3 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
  id v4 = [(SBSwitcherAppSuggestionBannerView *)self _textStyle];
  v5 = [v3 preferredFontForTextStyle:v4 hiFontStyle:1];

  return v5;
}

- (BOOL)_isSingleLine
{
  return self->_style == 0;
}

- (void)_configureConstraints
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v3 = [(PLPlatterView *)self customContentView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  [v4 setObject:self->_appLabel forKey:@"appLabel"];
  [v4 setObject:self->_descriptionLabel forKey:@"descriptionLabel"];
  [v4 setObject:self->_iconView forKey:@"iconView"];
  [v4 setObject:v3 forKey:@"contentView"];
  [v4 setObject:self->_highlightDarkeningView forKey:@"darkeningView"];
  v29[0] = @"spaceFromLeftEdge";
  v5 = [NSNumber numberWithDouble:8.0];
  v30[0] = v5;
  v29[1] = @"iconMargin";
  uint64_t v6 = [NSNumber numberWithDouble:8.0];
  v30[1] = v6;
  v29[2] = @"iconLabelMargin";
  double v7 = [NSNumber numberWithDouble:8.0];
  v30[2] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:3];

  v9 = [MEMORY[0x1E4F1CA48] array];
  v10 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|[contentView]|" options:0 metrics:v8 views:v4];
  [v9 addObjectsFromArray:v10];

  v11 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[contentView]|" options:0 metrics:v8 views:v4];
  [v9 addObjectsFromArray:v11];

  id v12 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"|[darkeningView]|" options:0 metrics:v8 views:v4];
  [v9 addObjectsFromArray:v12];

  v13 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[darkeningView]|" options:0 metrics:v8 views:v4];
  [v9 addObjectsFromArray:v13];

  [MEMORY[0x1E4F28DC8] activateConstraints:v9];
  [MEMORY[0x1E4F28DC8] activateConstraints:v9];
  v14 = [(SBSwitcherAppSuggestionBannerView *)self _titleFont];
  v15 = [MEMORY[0x1E4F1CA48] array];
  if ([(SBSwitcherAppSuggestionBannerView *)self _isSingleLine])
  {
    v16 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:3 relatedBy:0 toItem:self->_appLabel attribute:11 multiplier:1.0 constant:-24.0];
    [v15 addObject:v16];

    v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:3 relatedBy:0 toItem:self->_descriptionLabel attribute:11 multiplier:1.0 constant:-24.0];
    v18 = @"|-iconMargin-[iconView]-iconLabelMargin-[appLabel][descriptionLabel]-(>=spaceFromLeftEdge)-|";
  }
  else
  {
    [v14 _scaledValueForValue:18.0];
    double v20 = -v19;
    [v14 _scaledValueForValue:13.0];
    double v22 = -v21;
    v23 = [MEMORY[0x1E4F28DC8] constraintWithItem:v3 attribute:3 relatedBy:0 toItem:self->_appLabel attribute:11 multiplier:1.0 constant:v20];
    [v15 addObject:v23];

    int v24 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_appLabel attribute:11 relatedBy:0 toItem:self->_descriptionLabel attribute:11 multiplier:1.0 constant:v22];
    [v15 addObject:v24];

    long long v25 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_appLabel attribute:5 relatedBy:0 toItem:self->_descriptionLabel attribute:5 multiplier:1.0 constant:0.0];
    [v15 addObject:v25];

    uint64_t v26 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_appLabel attribute:6 relatedBy:-1 toItem:v3 attribute:6 multiplier:1.0 constant:-8.0];
    [v15 addObject:v26];

    v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_descriptionLabel attribute:6 relatedBy:-1 toItem:v3 attribute:6 multiplier:1.0 constant:-8.0];
    v18 = @"|-iconMargin-[iconView]-iconLabelMargin-[appLabel]";
  }
  [v15 addObject:v17];

  objc_super v27 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v18 options:0 metrics:v8 views:v4];
  [v15 addObjectsFromArray:v27];

  v28 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_iconView attribute:10 relatedBy:0 toItem:v3 attribute:10 multiplier:1.0 constant:0.0];
  [v15 addObject:v28];

  [MEMORY[0x1E4F28DC8] activateConstraints:v15];
}

- (void)_createAppLabelForSuggestion:(id)a3
{
  id v13 = [(SBSwitcherAppSuggestionBannerView *)self _appTitleForSuggestion:a3];
  id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  appLabel = self->_appLabel;
  self->_appLabel = v5;

  [(UILabel *)self->_appLabel setText:v13];
  double v7 = self->_appLabel;
  id v8 = [(SBSwitcherAppSuggestionBannerView *)self _titleFont];
  [(UILabel *)v7 setFont:v8];

  v9 = self->_appLabel;
  v10 = [MEMORY[0x1E4F428B8] labelColor];
  v11 = [v10 colorWithAlphaComponent:0.75];
  [(UILabel *)v9 setTextColor:v11];

  [(UILabel *)self->_appLabel setTextAlignment:0];
  [(UILabel *)self->_appLabel setLineBreakMode:5];
  [(UILabel *)self->_appLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = [(PLPlatterView *)self customContentView];
  [v12 addSubview:self->_appLabel];
}

- (id)_appTitleForSuggestion:(id)a3
{
  id v3 = a3;
  id v4 = [v3 bundleIdentifier];
  v5 = +[SBApplicationController sharedInstance];
  uint64_t v6 = [v5 applicationWithBundleIdentifier:v4];

  if (v6)
  {
    if (([v3 isLocationPredictionOfType:0] & 1) != 0
      || [v3 isLocationPredictionOfType:1])
    {
      double v7 = [MEMORY[0x1E4F28B50] mainBundle];
      id v8 = v7;
      v9 = @"LOCATION_DIRECTION_LAUNCH_SUGGESTION_FORMAT";
LABEL_5:
      v10 = [v7 localizedStringForKey:v9 value:&stru_1F3084718 table:@"SpringBoard"];

      v11 = NSString;
      id v12 = [v3 suggestedLocationName];
      id v13 = [v6 displayName];
      objc_msgSend(v11, "stringWithFormat:", v10, v12, v13);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_8:
      goto LABEL_13;
    }
    if ([v3 isLocationPredictionOfType:2])
    {
      double v7 = [MEMORY[0x1E4F28B50] mainBundle];
      id v8 = v7;
      v9 = @"LOCATION_RIDE_LAUNCH_SUGGESTION_FORMAT";
      goto LABEL_5;
    }
    v14 = [v6 displayName];
  }
  else
  {
    if ([v3 isSiriSuggestion])
    {
      v10 = [MEMORY[0x1E4F28B50] mainBundle];
      v14 = [v10 localizedStringForKey:@"SIRI" value:&stru_1F3084718 table:@"SpringBoard"];
      goto LABEL_8;
    }
    v14 = &stru_1F3084718;
  }
LABEL_13:

  return v14;
}

- (id)_meCardShortName
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:1000];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v8[0] = v2;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  v5 = objc_msgSend(v3, "_ios_meContactWithKeysToFetch:error:", v4, 0);

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:1000];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)_firstWakeGreetingString
{
  v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 localizedStringForKey:@"FIRST_WAKE_SUGGESTION_NONAME" value:&stru_1F3084718 table:@"SpringBoard"];

  return v3;
}

- (id)_descriptionStringForSuggestion:(id)a3
{
  id v4 = a3;
  if ([v4 isArrivedAtHomePrediction])
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v6 = v5;
    double v7 = @"ARRIVED_AT_HOME_SUGGESTION";
LABEL_7:
    id v8 = [v5 localizedStringForKey:v7 value:&stru_1F3084718 table:@"SpringBoard"];
LABEL_8:

    goto LABEL_9;
  }
  if ([v4 isArrivedAtWorkPrediction])
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v6 = v5;
    double v7 = @"ARRIVED_AT_WORK_SUGGESTION";
    goto LABEL_7;
  }
  if ([v4 isLocationBasedSuggestion])
  {
    v5 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v6 = v5;
    double v7 = @"CONTINUITY_LOCATION_BASED_SUGGESTION";
    goto LABEL_7;
  }
  if (([v4 isLocationPredictionFromSource:0] & 1) != 0
    || [v4 isLocationPredictionFromSource:1])
  {
    id v13 = +[SBApplicationController sharedInstance];
    v14 = [v4 originatingBundleIdentifier];
    uint64_t v6 = [v13 applicationWithBundleIdentifier:v14];

    int v15 = [v4 isLocationPredictionFromSource:0];
    v16 = @"LOCATION_COPIED_IN_APP_SUGGESTION_FORMAT";
    if (v15) {
      v16 = @"LOCATION_DONATED_IN_APP_SUGGESTION_FORMAT";
    }
    v17 = (void *)MEMORY[0x1E4F28B50];
    v18 = v16;
    double v19 = [v17 mainBundle];
    double v20 = [v19 localizedStringForKey:v18 value:&stru_1F3084718 table:@"SpringBoard"];

    double v21 = NSString;
    double v22 = [v6 displayName];
    objc_msgSend(v21, "stringWithFormat:", v20, v22);
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_8;
  }
  if (([v4 isLocallyGeneratedSuggestion] & 1) == 0)
  {
    v23 = [v4 originatingDeviceName];
    uint64_t v24 = [v23 length];

    if (v24)
    {
      long long v25 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v26 = v25;
      objc_super v27 = @"CONTINUITY_ORIGINATOR_NAME_FORMAT";
LABEL_31:
      uint64_t v6 = [v25 localizedStringForKey:v27 value:&stru_1F3084718 table:@"SpringBoard"];

      v30 = NSString;
      v31 = [v4 originatingDeviceName];
      objc_msgSend(v30, "stringWithFormat:", v6, v31);
      id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

      goto LABEL_8;
    }
  }
  if ([v4 isPrediction] && objc_msgSend(v4, "isFirstWakePrediction"))
  {
    id v8 = [(SBSwitcherAppSuggestionBannerView *)self _firstWakeGreetingString];
  }
  else
  {
    if ([v4 isPrediction] && objc_msgSend(v4, "isCarPlayPrediction"))
    {
      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v6 = v5;
      double v7 = @"CARPLAY_CONNECTED_SUGGESTION";
      goto LABEL_7;
    }
    if ([v4 isPrediction])
    {
      v28 = [v4 originatingDeviceName];
      uint64_t v29 = [v28 length];

      if (v29)
      {
        long long v25 = [MEMORY[0x1E4F28B50] mainBundle];
        uint64_t v26 = v25;
        objc_super v27 = @"DEVICE_CONNECTED_SUGGESTION_NAME_FORMAT";
        goto LABEL_31;
      }
    }
    if ([v4 isPrediction] && objc_msgSend(v4, "isHeadphonesPrediction"))
    {
      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v6 = v5;
      double v7 = @"HEADPHONES_CONNECTED_SUGGESTION";
      goto LABEL_7;
    }
    if ([v4 isPrediction] && objc_msgSend(v4, "isBluetoothPrediction"))
    {
      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v6 = v5;
      double v7 = @"BLUETOOTH_DEVICE_CONNECTED_SUGGESTION";
      goto LABEL_7;
    }
    if ([v4 isPrediction])
    {
      v5 = [MEMORY[0x1E4F28B50] mainBundle];
      uint64_t v6 = v5;
      double v7 = @"GENERIC_DEVICE_CONNECTED_SUGGESTION";
      goto LABEL_7;
    }
    id v8 = &stru_1F3084718;
  }
LABEL_9:
  if ([(SBSwitcherAppSuggestionBannerView *)self _isSingleLine])
  {
    v9 = [MEMORY[0x1E4F28B50] mainBundle];
    v10 = [v9 localizedStringForKey:@"SINGLE_LINE_SUGGESTION_FORMAT" value:&stru_1F3084718 table:@"SpringBoard"];

    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", v10, v8);

    id v8 = (__CFString *)v11;
  }

  return v8;
}

- (void)_createDescriptionLabelForSuggestion:(id)a3
{
  id v13 = [(SBSwitcherAppSuggestionBannerView *)self _descriptionStringForSuggestion:a3];
  id v4 = objc_alloc(MEMORY[0x1E4F42B38]);
  v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v5;

  [(UILabel *)self->_descriptionLabel setText:v13];
  double v7 = self->_descriptionLabel;
  id v8 = [(SBSwitcherAppSuggestionBannerView *)self _descriptionFont];
  [(UILabel *)v7 setFont:v8];

  v9 = self->_descriptionLabel;
  v10 = [MEMORY[0x1E4F428B8] labelColor];
  uint64_t v11 = [v10 colorWithAlphaComponent:0.75];
  [(UILabel *)v9 setTextColor:v11];

  [(UILabel *)self->_descriptionLabel setTextAlignment:0];
  [(UILabel *)self->_descriptionLabel setLineBreakMode:5];
  [(UILabel *)self->_descriptionLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  id v12 = [(PLPlatterView *)self customContentView];
  [v12 addSubview:self->_descriptionLabel];
}

- (id)_iconImageFromAppWithBundleIdentifier:(id)a3 withIconImageCache:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[SBIconController sharedInstance];
  if ([v6 isEqualToString:@"com.apple.Siri"])
  {
    id v9 = [v8 notificationIconImageCache];

    if (v9 == v7) {
      v10 = @"siri-suggestion-landscape";
    }
    else {
      v10 = @"siri-suggestion";
    }
    id v7 = [MEMORY[0x1E4F42A80] imageNamed:v10];
    uint64_t v11 = [MEMORY[0x1E4F428B8] labelColor];
    id v12 = [v11 colorWithAlphaComponent:0.75];
    uint64_t v13 = [v7 _flatImageWithColor:v12];
  }
  else
  {
    v14 = [v8 model];
    uint64_t v11 = [v14 applicationIconForBundleIdentifier:v6];

    id v12 = [(SBSwitcherAppSuggestionBannerView *)self traitCollection];
    uint64_t v13 = [v7 imageForIcon:v11 compatibleWithTraitCollection:v12 options:2];
  }
  int v15 = (void *)v13;

  return v15;
}

- (id)_iconImageViewFromAppWithBundleIdentifier:(id)a3 withIconImageCache:(id)a4
{
  id v4 = [(SBSwitcherAppSuggestionBannerView *)self _iconImageFromAppWithBundleIdentifier:a3 withIconImageCache:a4];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4];

  return v5;
}

- (id)_iconImageCache
{
  id v3 = +[SBIconController sharedInstance];
  if ([(SBSwitcherAppSuggestionBannerView *)self _isSingleLine]) {
    [v3 notificationIconImageCache];
  }
  else {
  id v4 = [v3 tableUIIconImageCache];
  }

  return v4;
}

- (void)_createIconViewForSuggestion:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isSiriSuggestion] & 1) != 0
    || ([v4 bundleIdentifier],
        v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v6))
  {
    id v7 = [(SBSwitcherAppSuggestionBannerView *)self _iconImageCache];
    id v8 = [v4 bundleIdentifier];
    id v9 = [(SBSwitcherAppSuggestionBannerView *)self _iconImageViewFromAppWithBundleIdentifier:v8 withIconImageCache:v7];

    [v7 iconImageInfo];
    [(UIImageView *)v9 _setContinuousCornerRadius:v10];
    uint64_t v11 = [(UIImageView *)v9 layer];
    [v11 setMasksToBounds:1];

    [(UIImageView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SBSwitcherAppSuggestionBannerView *)self _isSingleLine];
    -[UIImageView setBounds:](v9, "setBounds:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 24.0, 24.0);
    id v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:24.0];
    v18[0] = v12;
    uint64_t v13 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:24.0];
    v18[1] = v13;
    v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];

    [(UIImageView *)v9 addConstraints:v14];
    iconView = self->_iconView;
    self->_iconView = v9;
    v16 = v9;

    v17 = [(PLPlatterView *)self customContentView];
    [v17 addSubview:self->_iconView];
  }
}

- (void)_updateIconViewImage
{
  id v5 = [(SBSwitcherAppSuggestionBannerView *)self _iconImageCache];
  id v3 = [(SBBestAppSuggestion *)self->_suggestion bundleIdentifier];
  id v4 = [(SBSwitcherAppSuggestionBannerView *)self _iconImageFromAppWithBundleIdentifier:v3 withIconImageCache:v5];
  [(UIImageView *)self->_iconView setImage:v4];
}

- (void)_createDarkeningView
{
  id v3 = objc_alloc(MEMORY[0x1E4F42FF0]);
  [(SBSwitcherAppSuggestionBannerView *)self bounds];
  id v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  highlightDarkeningView = self->_highlightDarkeningView;
  self->_highlightDarkeningView = v4;

  uint64_t v6 = self->_highlightDarkeningView;
  id v7 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.3];
  [(UIView *)v6 setBackgroundColor:v7];

  [(UIView *)self->_highlightDarkeningView setUserInteractionEnabled:0];
  [(UIView *)self->_highlightDarkeningView setHidden:1];
  id v8 = self->_highlightDarkeningView;
  [(PLPlatterView *)self _continuousCornerRadius];
  -[UIView _setContinuousCornerRadius:](v8, "_setContinuousCornerRadius:");
  id v9 = self->_highlightDarkeningView;
  [(SBSwitcherAppSuggestionBannerView *)self addSubview:v9];
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightDarkeningView, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_appLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end