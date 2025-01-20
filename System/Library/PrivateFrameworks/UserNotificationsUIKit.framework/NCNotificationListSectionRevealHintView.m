@interface NCNotificationListSectionRevealHintView
+ (double)minimumViewHeight;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isForceRevealed;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationListSectionRevealHintView)initWithFrame:(CGRect)a3;
- (SBUILegibilityLabel)revealHintTitle;
- (_UILegibilitySettings)legibilitySettings;
- (double)_alphaValueBasedOnRevealPercentage;
- (double)_hintTitleDisplacementForRevealPercentage:(double)a3;
- (double)hintingAlpha;
- (double)revealPercentage;
- (id)_labelFont;
- (void)_configureRevealHintTitleIfNecessary;
- (void)_layoutRevealHintTitle;
- (void)_updateAlpha;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setForceRevealed:(BOOL)a3;
- (void)setHintingAlpha:(double)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setRevealHintTitle:(id)a3;
- (void)setRevealPercentage:(double)a3;
@end

@implementation NCNotificationListSectionRevealHintView

- (NCNotificationListSectionRevealHintView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationListSectionRevealHintView;
  v3 = -[NCNotificationListSectionRevealHintView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NCNotificationListSectionRevealHintView *)v3 setRevealPercentage:1.0];
    [(NCNotificationListSectionRevealHintView *)v4 setHintingAlpha:0.0];
  }
  return v4;
}

- (void)setRevealPercentage:(double)a3
{
  if (self->_revealPercentage != a3)
  {
    self->_revealPercentage = a3;
    [(NCNotificationListSectionRevealHintView *)self _updateAlpha];
    [(NCNotificationListSectionRevealHintView *)self setNeedsLayout];
  }
}

- (void)setForceRevealed:(BOOL)a3
{
  double v4 = 0.0;
  if (a3) {
    double v4 = 1.0;
  }
  [(NCNotificationListSectionRevealHintView *)self setHintingAlpha:v4];

  [(NCNotificationListSectionRevealHintView *)self _updateAlpha];
}

+ (double)minimumViewHeight
{
  v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 _scaledValueForValue:100.0];
  _NCMainScreenScale();
  UICeilToScale();

  _NCMainScreenScale();

  UICeilToScale();
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(NCNotificationListSectionRevealHintView *)self _configureRevealHintTitleIfNecessary];
  [(NCNotificationListSectionRevealHintView *)self _layoutRevealHintTitle];
  revealHintTitle = self->_revealHintTitle;

  -[SBUILegibilityLabel sizeThatFits:](revealHintTitle, "sizeThatFits:", width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListSectionRevealHintView;
  [(NCNotificationListSectionRevealHintView *)&v3 layoutSubviews];
  [(NCNotificationListSectionRevealHintView *)self _configureRevealHintTitleIfNecessary];
  [(NCNotificationListSectionRevealHintView *)self _layoutRevealHintTitle];
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  objc_super v6 = (_UILegibilitySettings *)a3;
  if (self->_legibilitySettings != v6)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    v5 = [(NCNotificationListSectionRevealHintView *)self revealHintTitle];
    [v5 setLegibilitySettings:v6];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3) {
    self->_adjustsFontForContentSizeCategory = a3;
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  BOOL adjustsFontForContentSizeCategory = self->_adjustsFontForContentSizeCategory;
  if (self->_adjustsFontForContentSizeCategory)
  {
    [(SBUILegibilityLabel *)self->_revealHintTitle removeFromSuperview];
    revealHintTitle = self->_revealHintTitle;
    self->_revealHintTitle = 0;

    [(NCNotificationListSectionRevealHintView *)self setNeedsLayout];
  }
  return adjustsFontForContentSizeCategory;
}

- (void)_configureRevealHintTitleIfNecessary
{
  if (!self->_revealHintTitle)
  {
    objc_super v3 = +[NCNotificationListLegibilityLabelCache sharedInstance];
    double v4 = NCUserNotificationsUIKitFrameworkBundle();
    v5 = [v4 localizedStringForKey:@"NO_NOTIFICATION_HISTORY" value:&stru_1F2F516F8 table:0];
    objc_super v6 = [(NCNotificationListSectionRevealHintView *)self _labelFont];
    double v7 = [v3 legibilityLabelForTitle:v5 forSuperview:self font:v6];
    revealHintTitle = self->_revealHintTitle;
    self->_revealHintTitle = v7;

    v9 = self->_revealHintTitle;
    [(NCNotificationListSectionRevealHintView *)self _alphaValueBasedOnRevealPercentage];
    -[SBUILegibilityLabel setAlpha:](v9, "setAlpha:");
    [(SBUILegibilityLabel *)self->_revealHintTitle setLegibilitySettings:self->_legibilitySettings];
    v10 = self->_revealHintTitle;
    [(NCNotificationListSectionRevealHintView *)self addSubview:v10];
  }
}

- (void)_layoutRevealHintTitle
{
  [(NCNotificationListSectionRevealHintView *)self _configureRevealHintTitleIfNecessary];
  [(NCNotificationListSectionRevealHintView *)self bounds];
  -[SBUILegibilityLabel sizeThatFits:](self->_revealHintTitle, "sizeThatFits:", v3, v4);
  UIRectCenteredXInRect();
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(NCNotificationListSectionRevealHintView *)self revealPercentage];
  -[NCNotificationListSectionRevealHintView _hintTitleDisplacementForRevealPercentage:](self, "_hintTitleDisplacementForRevealPercentage:");
  revealHintTitle = self->_revealHintTitle;

  -[SBUILegibilityLabel setFrame:](revealHintTitle, "setFrame:", v6, v11 + 0.0, v8, v10);
}

- (double)_hintTitleDisplacementForRevealPercentage:(double)a3
{
  return a3 * 0.0;
}

- (id)_labelFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_preferredFontForTextStyle:hiFontStyle:", *MEMORY[0x1E4FB28C8], 1);
}

- (double)_alphaValueBasedOnRevealPercentage
{
  return self->_revealPercentage;
}

- (void)_updateAlpha
{
  [(NCNotificationListSectionRevealHintView *)self _alphaValueBasedOnRevealPercentage];
  double v4 = v3;
  [(NCNotificationListSectionRevealHintView *)self hintingAlpha];
  double v6 = v4 + v5;
  id v7 = [(NCNotificationListSectionRevealHintView *)self revealHintTitle];
  [v7 setAlpha:v6];
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (double)revealPercentage
{
  return self->_revealPercentage;
}

- (BOOL)isForceRevealed
{
  return self->_forceRevealed;
}

- (SBUILegibilityLabel)revealHintTitle
{
  return self->_revealHintTitle;
}

- (void)setRevealHintTitle:(id)a3
{
}

- (double)hintingAlpha
{
  return self->_hintingAlpha;
}

- (void)setHintingAlpha:(double)a3
{
  self->_hintingAlpha = a3;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);

  objc_storeStrong((id *)&self->_revealHintTitle, 0);
}

@end