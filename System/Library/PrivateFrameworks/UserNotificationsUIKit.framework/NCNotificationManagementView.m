@interface NCNotificationManagementView
- (CGSize)_explanationSizeForPlatterWidth:(double)a3;
- (CGSize)_titleSizeForPlatterWidth:(double)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationManagementBlueButton)deliveryButton;
- (NCNotificationManagementBlueButton)onOffToggleButton;
- (NCNotificationManagementView)initWithIcon:(id)a3 title:(id)a4 subtitle:(id)a5 sectionSettings:(id)a6 criticalAlert:(BOOL)a7;
- (double)_separatorHeight;
- (id)_newSeparatorView;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (void)_configureDeliveryButtonIfNeccessary:(id)a3;
- (void)_configureExplanationIfNeccessary:(id)a3;
- (void)_configureIconIfNeccessary:(id)a3;
- (void)_configureOnOffToggleButtonIfNeccessary:(id)a3;
- (void)_configureSubtitleIfNeccessary:(id)a3;
- (void)_configureTitleIfNeccessary:(id)a3;
- (void)_configureTopSeparatorIfNeccessary;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_updateExplanationVisualStyling;
- (void)_updateTopSeparatorVisualStyling;
- (void)layoutSubviews;
@end

@implementation NCNotificationManagementView

- (NCNotificationManagementView)initWithIcon:(id)a3 title:(id)a4 subtitle:(id)a5 sectionSettings:(id)a6 criticalAlert:(BOOL)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v20.receiver = self;
  v20.super_class = (Class)NCNotificationManagementView;
  v16 = [(NCNotificationManagementView *)&v20 init];
  v17 = v16;
  if (v16)
  {
    v16->_isCriticalAlert = a7;
    [(NCNotificationManagementView *)v16 _configureIconIfNeccessary:v12];
    [(NCNotificationManagementView *)v17 _configureTitleIfNeccessary:v13];
    [(NCNotificationManagementView *)v17 _configureSubtitleIfNeccessary:v14];
    [(NCNotificationManagementView *)v17 _configureDeliveryButtonIfNeccessary:v15];
    [(NCNotificationManagementView *)v17 _configureExplanationIfNeccessary:v15];
    [(NCNotificationManagementView *)v17 _configureOnOffToggleButtonIfNeccessary:v15];
    v18 = [(NCNotificationManagementView *)v17 layer];
    [v18 setAllowsGroupBlending:0];
  }
  return v17;
}

- (void)_configureIconIfNeccessary:(id)a3
{
  if (!self->_icon)
  {
    v4 = (objc_class *)MEMORY[0x1E4FB1838];
    id v5 = a3;
    v6 = (UIImageView *)[[v4 alloc] initWithImage:v5];

    icon = self->_icon;
    self->_icon = v6;

    v8 = self->_icon;
    [(NCNotificationManagementView *)self addSubview:v8];
  }
}

- (void)_configureTitleIfNeccessary:(id)a3
{
  if (!self->_titleLabel)
  {
    v4 = (void *)MEMORY[0x1E4FB08E8];
    uint64_t v5 = *MEMORY[0x1E4FB2980];
    id v6 = a3;
    id v16 = [v4 preferredFontDescriptorWithTextStyle:v5 addingSymbolicTraits:2 options:0];
    v7 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2990] addingSymbolicTraits:2 options:0];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    titleLabel = self->_titleLabel;
    self->_titleLabel = v8;

    [(UILabel *)self->_titleLabel setText:v6];
    v10 = self->_titleLabel;
    v11 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v16 size:0.0];
    [(UILabel *)v10 setFont:v11];

    [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
    id v12 = self->_titleLabel;
    [v7 pointSize];
    double v14 = v13;
    [v16 pointSize];
    [(UILabel *)v12 setMinimumScaleFactor:v14 / v15];
    [(NCNotificationManagementView *)self addSubview:self->_titleLabel];
  }
}

- (void)_configureSubtitleIfNeccessary:(id)a3
{
  if (!self->_subtitleLabel)
  {
    v4 = (objc_class *)MEMORY[0x1E4FB1930];
    id v5 = a3;
    id v6 = (UILabel *)objc_alloc_init(v4);
    subtitleLabel = self->_subtitleLabel;
    self->_subtitleLabel = v6;

    [(UILabel *)self->_subtitleLabel setText:v5];
    v8 = self->_subtitleLabel;
    v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(UILabel *)v8 setFont:v9];

    v10 = self->_subtitleLabel;
    [(NCNotificationManagementView *)self addSubview:v10];
  }
}

- (void)_configureTopSeparatorIfNeccessary
{
  if (!self->_topSeparator)
  {
    v3 = [(NCNotificationManagementView *)self _newSeparatorView];
    topSeparator = self->_topSeparator;
    self->_topSeparator = v3;

    [(NCNotificationManagementView *)self addSubview:self->_topSeparator];
    [(NCNotificationManagementView *)self _updateTopSeparatorVisualStyling];
  }
}

- (void)_configureDeliveryButtonIfNeccessary:(id)a3
{
  id v4 = a3;
  if (!self->_deliveryButton && !self->_isCriticalAlert)
  {
    id v12 = v4;
    int v5 = [v4 isDeliveredQuietly];
    id v6 = NCUserNotificationsUIKitFrameworkBundle();
    v7 = v6;
    if (v5) {
      v8 = @"NOTIFICATION_MANAGEMENT_DELIVER_PROMINENTLY";
    }
    else {
      v8 = @"NOTIFICATION_MANAGEMENT_DELIVER_QUIETLY";
    }
    v9 = [v6 localizedStringForKey:v8 value:&stru_1F2F516F8 table:0];

    v10 = +[NCNotificationManagementBlueButton buttonWithTitle:v9];
    deliveryButton = self->_deliveryButton;
    self->_deliveryButton = v10;

    [(NCNotificationManagementView *)self addSubview:self->_deliveryButton];
    id v4 = v12;
  }
}

- (void)_configureOnOffToggleButtonIfNeccessary:(id)a3
{
  id v4 = a3;
  if (!self->_onOffToggleButton)
  {
    id v12 = v4;
    if (self->_isCriticalAlert)
    {
      char v5 = [v4 criticalAlertsEnabled];
      id v6 = NCUserNotificationsUIKitFrameworkBundle();
      if (v5) {
        v7 = @"NOTIFICATION_MANAGEMENT_TURN_OFF_CRITICAL_ALERTS";
      }
      else {
        v7 = @"NOTIFICATION_MANAGEMENT_TURN_ON_CRITICAL_ALERTS";
      }
    }
    else
    {
      char v8 = [v4 notificationsEnabled];
      id v6 = NCUserNotificationsUIKitFrameworkBundle();
      if (v8) {
        v7 = @"NOTIFICATION_MANAGEMENT_TURN_OFF_DEFAULT";
      }
      else {
        v7 = @"NOTIFICATION_MANAGEMENT_TURN_ON_DEFAULT";
      }
    }
    v9 = [v6 localizedStringForKey:v7 value:&stru_1F2F516F8 table:0];

    v10 = +[NCNotificationManagementBlueButton buttonWithTitle:v9];
    onOffToggleButton = self->_onOffToggleButton;
    self->_onOffToggleButton = v10;

    [(NCNotificationManagementView *)self addSubview:self->_onOffToggleButton];
    id v4 = v12;
  }
}

- (void)_updateExplanationVisualStyling
{
  explanation = self->_explanation;
  if (explanation)
  {
    id v4 = [(NCNotificationManagementView *)self visualStylingProviderForCategory:1];
    v3 = [v4 _visualStylingForStyle:1];
    [(UILabel *)explanation mt_replaceVisualStyling:v3];
  }
}

- (void)_configureExplanationIfNeccessary:(id)a3
{
  id v4 = a3;
  if (!self->_explanation)
  {
    id v18 = v4;
    char v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    explanation = self->_explanation;
    self->_explanation = v5;

    if (self->_isCriticalAlert)
    {
      v7 = [MEMORY[0x1E4F4F7D0] sharedInstance];
      int v8 = [v7 deviceClass];

      if (v8 == 2)
      {
        v9 = NCUserNotificationsUIKitFrameworkBundle();
        v10 = v9;
        v11 = @"NOTIFICATION_MANAGEMENT_CRITICAL_EXPLANATION_IPAD";
LABEL_12:
        double v15 = [v9 localizedStringForKey:v11 value:&stru_1F2F516F8 table:0];

        [(UILabel *)self->_explanation setText:v15];
        [(UILabel *)self->_explanation setContentMode:4];
        [(UILabel *)self->_explanation setTextAlignment:1];
        id v16 = [MEMORY[0x1E4F4F8B8] preferredFontProvider];
        v17 = [v16 preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] hiFontStyle:8];

        [(UILabel *)self->_explanation setFont:v17];
        [(UILabel *)self->_explanation setNumberOfLines:0];
        [(NCNotificationManagementView *)self _updateExplanationVisualStyling];
        [(NCNotificationManagementView *)self addSubview:self->_explanation];

        id v4 = v18;
        goto LABEL_13;
      }
      double v13 = [MEMORY[0x1E4F4F7D0] sharedInstance];
      int v14 = [v13 deviceClass];

      v10 = NCUserNotificationsUIKitFrameworkBundle();
      if (v14 == 1) {
        v11 = @"NOTIFICATION_MANAGEMENT_CRITICAL_EXPLANATION_IPOD";
      }
      else {
        v11 = @"NOTIFICATION_MANAGEMENT_CRITICAL_EXPLANATION_IPHONE";
      }
    }
    else
    {
      int v12 = [v18 isDeliveredQuietly];
      v10 = NCUserNotificationsUIKitFrameworkBundle();
      if (v12) {
        v11 = @"NOTIFICATION_MANAGEMENT_PROMINENT_EXPLANATION";
      }
      else {
        v11 = @"NOTIFICATION_MANAGEMENT_QUIET_EXPLANATION";
      }
    }
    v9 = v10;
    goto LABEL_12;
  }
LABEL_13:
}

- (double)_separatorHeight
{
  return 1.0 / _NCMainScreenScale();
}

- (void)_updateTopSeparatorVisualStyling
{
  topSeparator = self->_topSeparator;
  if (topSeparator)
  {
    id v4 = [(NCNotificationManagementView *)self visualStylingProviderForCategory:2];
    v3 = [v4 _visualStylingForStyle:3];
    [(UIView *)topSeparator mt_replaceVisualStyling:v3];
  }
}

- (id)_newSeparatorView
{
  id v2 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
  [v2 setUserInteractionEnabled:0];
  [v2 setAutoresizingMask:2];
  v3 = [MEMORY[0x1E4FB1618] whiteColor];
  [v2 setBackgroundColor:v3];

  return v2;
}

- (CGSize)_titleSizeForPlatterWidth:(double)a3
{
  double v3 = a3 + -32.0 + -40.0 + -16.0;
  -[UILabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", v3, 1.79769313e308);
  _NCMainScreenScale();
  UISizeRoundToScale();
  if (v4 >= v3) {
    double v4 = v3;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_explanationSizeForPlatterWidth:(double)a3
{
  double v3 = a3 + -32.0;
  -[UILabel sizeThatFits:](self->_explanation, "sizeThatFits:", a3 + -32.0, 1.79769313e308);
  _NCMainScreenScale();
  UISizeRoundToScale();
  double v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  v38.receiver = self;
  v38.super_class = (Class)NCNotificationManagementView;
  [(NCNotificationManagementView *)&v38 layoutSubviews];
  [(NCNotificationManagementView *)self _configureTopSeparatorIfNeccessary];
  [(NCNotificationManagementView *)self bounds];
  double Width = CGRectGetWidth(v39);
  v37.receiver = self;
  v37.super_class = (Class)NCNotificationManagementView;
  unsigned int v4 = [(NCNotificationManagementView *)&v37 _shouldReverseLayoutDirection];
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  double v6 = v5;
  double v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  -[UIImageView setFrame:](self->_icon, "setFrame:");
  CGFloat v35 = v8;
  CGFloat v36 = v6;
  if (v4)
  {
    [(UILabel *)self->_titleLabel frame];
    double v13 = CGRectGetWidth(v40);
  }
  int v14 = [(UILabel *)self->_titleLabel font];
  [v14 lineHeight];

  [(NCNotificationManagementView *)self _titleSizeForPlatterWidth:Width];
  titleLabel = self->_titleLabel;
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[UILabel setFrame:](titleLabel, "setFrame:");
  [(UILabel *)self->_titleLabel _firstLineBaselineOffsetFromBoundsTop];
  id v16 = [(UILabel *)self->_subtitleLabel font];
  [v16 _scaledValueForValue:24.0];

  double v17 = NCRectWithSize();
  CGFloat v19 = v18;
  double v34 = Width;
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  -[UILabel setBounds:](self->_subtitleLabel, "setBounds:");
  [(UILabel *)self->_subtitleLabel _firstLineBaselineOffsetFromBoundsTop];
  if (v4)
  {
    v41.origin.x = v17;
    v41.origin.y = v19;
    v41.size.width = v21;
    v41.size.height = v23;
    CGRectGetWidth(v41);
  }
  v42.origin.y = v35;
  v42.origin.x = v36;
  v42.size.height = v12;
  v42.size.width = v10;
  CGRectGetMaxY(v42);
  subtitleLabel = self->_subtitleLabel;
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[UILabel setFrame:](subtitleLabel, "setFrame:");
  v25 = [(UILabel *)self->_subtitleLabel font];
  [v25 _scaledValueForValue:8.0];

  _NCMainScreenScale();
  UIPointRoundToScale();
  double v27 = v26;
  double v29 = v28;
  [(NCNotificationManagementView *)self _separatorHeight];
  -[UIView setFrame:](self->_topSeparator, "setFrame:", v27, v29, v34, v30);
  [(NCNotificationManagementView *)self _separatorHeight];
  deliveryButton = self->_deliveryButton;
  if (deliveryButton)
  {
    _NCMainScreenScale();
    UIRectIntegralWithScale();
    -[NCNotificationManagementBlueButton setFrame:](deliveryButton, "setFrame:");
  }
  onOffToggleButton = self->_onOffToggleButton;
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[NCNotificationManagementBlueButton setFrame:](onOffToggleButton, "setFrame:");
  [(NCNotificationManagementView *)self _explanationSizeForPlatterWidth:v34];
  explanation = self->_explanation;
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  -[UILabel setFrame:](explanation, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  [(NCNotificationManagementView *)self _configureTopSeparatorIfNeccessary];
  [(NCNotificationManagementView *)self _titleSizeForPlatterWidth:width];
  if (v5 <= 44.0) {
    double v6 = 60.0;
  }
  else {
    double v6 = v5 + 16.0;
  }
  double v7 = [(UILabel *)self->_subtitleLabel font];
  [v7 _scaledValueForValue:32.0];
  double v9 = v6 + v8;

  [(NCNotificationManagementView *)self _separatorHeight];
  double v11 = v9 + v10 + 8.0;
  if (self->_deliveryButton) {
    double v11 = v11 + 58.0;
  }
  double v12 = v11 + 82.0;
  [(NCNotificationManagementView *)self _explanationSizeForPlatterWidth:width];
  double v14 = v13 + v12 + 16.0;
  double v15 = width;
  result.height = v14;
  result.double width = v15;
  return result;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationManagementView;
  [(NCNotificationManagementView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(NSMutableDictionary *)self->_categoriesToProviders removeAllObjects];
  [(NCNotificationManagementView *)self _updateTopSeparatorVisualStyling];
  [(NCNotificationManagementView *)self _updateExplanationVisualStyling];
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (!self->_categoriesToProviders)
  {
    double v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    categoriesToProviders = self->_categoriesToProviders;
    self->_categoriesToProviders = v5;
  }
  double v7 = [NSNumber numberWithInteger:a3];
  double v8 = [(NSMutableDictionary *)self->_categoriesToProviders objectForKey:v7];
  if (!v8)
  {
    double v9 = (void *)MEMORY[0x1E4F743E8];
    double v10 = [(NCNotificationManagementView *)self traitCollection];
    double v8 = objc_msgSend(v9, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 53, a3, objc_msgSend(v10, "userInterfaceStyle"));

    if (v8) {
      [(NSMutableDictionary *)self->_categoriesToProviders setObject:v8 forKey:v7];
    }
  }

  return v8;
}

- (NCNotificationManagementBlueButton)deliveryButton
{
  return self->_deliveryButton;
}

- (NCNotificationManagementBlueButton)onOffToggleButton
{
  return self->_onOffToggleButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categoriesToProviders, 0);
  objc_storeStrong((id *)&self->_bottomSeparator, 0);
  objc_storeStrong((id *)&self->_explanation, 0);
  objc_storeStrong((id *)&self->_deliveryButton, 0);
  objc_storeStrong((id *)&self->_onOffToggleButton, 0);
  objc_storeStrong((id *)&self->_topSeparator, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_icon, 0);
}

@end