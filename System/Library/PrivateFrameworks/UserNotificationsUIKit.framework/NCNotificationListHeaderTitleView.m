@interface NCNotificationListHeaderTitleView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isPrimary;
- (BSUIFontProvider)_fontProvider;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)preferredContentSizeCategory;
- (NSString)title;
- (SBUILegibilityLabel)titleLabel;
- (_UILegibilitySettings)legibilitySettings;
- (id)_labelFont;
- (void)_configureTitleLabelIfNecessary;
- (void)_invalidateTitleLabel;
- (void)_layoutTitleLabel;
- (void)_setFontProvider:(id)a3;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setPrimary:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCNotificationListHeaderTitleView

- (void)setTitle:(id)a3
{
  id v8 = a3;
  v5 = [(SBUILegibilityLabel *)self->_titleLabel string];
  v6 = [(SBUILegibilityLabel *)self->_titleLabel superview];
  if (v6 == self)
  {
    char v7 = BSEqualStrings();

    if (v7) {
      goto LABEL_5;
    }
  }
  else
  {
  }
  objc_storeStrong((id *)&self->_title, a3);
  [(NCNotificationListHeaderTitleView *)self _invalidateTitleLabel];
LABEL_5:
}

- (void)setPrimary:(BOOL)a3
{
  if (self->_primary != a3)
  {
    self->_primary = a3;
    [(NCNotificationListHeaderTitleView *)self _invalidateTitleLabel];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListHeaderTitleView;
  [(NCNotificationListHeaderTitleView *)&v3 layoutSubviews];
  [(NCNotificationListHeaderTitleView *)self _configureTitleLabelIfNecessary];
  [(NCNotificationListHeaderTitleView *)self _layoutTitleLabel];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  [(NCNotificationListHeaderTitleView *)self _configureTitleLabelIfNecessary];
  -[SBUILegibilityLabel sizeThatFits:](self->_titleLabel, "sizeThatFits:", width, height);
  double v7 = fmin(v6, height);
  double v9 = fmin(v8, width);
  result.double height = v7;
  result.double width = v9;
  return result;
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v5 = a3;
  if (([v5 isEqual:self->_legibilitySettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(SBUILegibilityLabel *)self->_titleLabel setLegibilitySettings:v5];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    if (a3) {
      [(NCNotificationListHeaderTitleView *)self adjustForContentSizeCategoryChange];
    }
  }
}

- (NSString)preferredContentSizeCategory
{
  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E4FB27F0]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }

  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  objc_super v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  v4 = [v3 preferredContentSizeCategory];

  if ([(NCNotificationListHeaderTitleView *)self adjustsFontForContentSizeCategory]
    && ([(NCNotificationListHeaderTitleView *)self preferredContentSizeCategory],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v4 isEqualToString:v5],
        v5,
        (v6 & 1) == 0))
  {
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    [(NCNotificationListHeaderTitleView *)self setPreferredContentSizeCategory:v4];
    [(NCNotificationListHeaderTitleView *)self _invalidateTitleLabel];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationListHeaderTitleView;
  id v4 = a3;
  [(NCNotificationListHeaderTitleView *)&v10 traitCollectionDidChange:v4];
  id v5 = [(NCNotificationListHeaderTitleView *)self traitCollection];
  uint64_t v6 = [v5 legibilityWeight];
  uint64_t v7 = [v4 legibilityWeight];

  if (v6 != v7)
  {
    titleLabel = self->_titleLabel;
    if (titleLabel)
    {
      double v9 = [(NCNotificationListHeaderTitleView *)self _labelFont];
      [(SBUILegibilityLabel *)titleLabel setFont:v9];
    }
    [(NCNotificationListHeaderTitleView *)self setNeedsLayout];
  }
}

- (BSUIFontProvider)_fontProvider
{
  if (!self->_fontProvider)
  {
    if ([(NCNotificationListHeaderTitleView *)self adjustsFontForContentSizeCategory])
    {
      [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    }
    else
    {
      [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    }
    objc_super v3 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;
  }
  id v5 = self->_fontProvider;

  return v5;
}

- (id)_labelFont
{
  objc_super v3 = [(NCNotificationListHeaderTitleView *)self _fontProvider];
  id v4 = v3;
  if (self->_primary) {
    id v5 = (void *)MEMORY[0x1E4FB2988];
  }
  else {
    id v5 = (void *)MEMORY[0x1E4FB2990];
  }
  uint64_t v6 = [v3 preferredFontForTextStyle:*v5 hiFontStyle:1];

  return v6;
}

- (void)_invalidateTitleLabel
{
  objc_super v3 = [(SBUILegibilityLabel *)self->_titleLabel superview];

  if (v3 == self) {
    [(SBUILegibilityLabel *)self->_titleLabel removeFromSuperview];
  }
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;

  [(NCNotificationListHeaderTitleView *)self setNeedsLayout];
}

- (void)_configureTitleLabelIfNecessary
{
  if (!self->_titleLabel && self->_title)
  {
    id v9 = [(NCNotificationListHeaderTitleView *)self _labelFont];
    objc_super v3 = +[NCNotificationListLegibilityLabelCache sharedInstance];
    id v4 = [(NCNotificationListHeaderTitleView *)self title];
    id v5 = [v3 legibilityLabelForTitle:v4 forSuperview:self font:v9];
    titleLabel = self->_titleLabel;
    self->_titleLabel = v5;

    [(SBUILegibilityLabel *)self->_titleLabel setNumberOfLines:0];
    [(SBUILegibilityLabel *)self->_titleLabel setLineBreakMode:4];
    LODWORD(v7) = 1036831949;
    [(SBUILegibilityLabel *)self->_titleLabel setHyphenationFactor:v7];
    [(SBUILegibilityLabel *)self->_titleLabel setOptions:2];
    double v8 = [(SBUILegibilityLabel *)self->_titleLabel superview];

    if (v8 == self) {
      [(SBUILegibilityLabel *)self->_titleLabel removeFromSuperview];
    }
    [(SBUILegibilityLabel *)self->_titleLabel setLegibilitySettings:self->_legibilitySettings];
    [(NCNotificationListHeaderTitleView *)self addSubview:self->_titleLabel];
  }
}

- (void)_layoutTitleLabel
{
  titleLabel = self->_titleLabel;
  [(NCNotificationListHeaderTitleView *)self bounds];

  -[SBUILegibilityLabel setFrame:](titleLabel, "setFrame:");
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isPrimary
{
  return self->_primary;
}

- (SBUILegibilityLabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
}

- (void)_setFontProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
}

@end