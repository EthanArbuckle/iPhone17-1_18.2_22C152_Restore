@interface OBHeaderView
- (BOOL)allowFullWidthIcon;
- (BOOL)iconInheritsTint;
- (BOOL)underlineLinks;
- (NSArray)detailLabelConstraints;
- (NSArray)imageViewConstraints;
- (NSArray)subtitleLabelConstraints;
- (NSArray)topAssetContainerConstraints;
- (OBAnimationView)animationView;
- (OBHeaderAccessoryButton)accessoryButton;
- (OBHeaderView)initWithTitle:(id)a3;
- (OBHeaderView)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (OBHeaderView)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (OBHeaderView)initWithTitle:(id)a3 icon:(id)a4;
- (OBHeaderView)initWithTitle:(id)a3 symbolName:(id)a4;
- (OBImageView)imageView;
- (OBTemplateHeaderDetailLabel)detailLabel;
- (OBTemplateLabel)headerLabel;
- (OBTemplateLabel)subtitleLabel;
- (UIImage)originalIconImage;
- (UIView)customIconContainerView;
- (UIView)topAssetContainer;
- (double)_setupAssistantIconHeight;
- (double)bottomPadding;
- (double)detailLabelToAccessoryButtonPadding;
- (double)headerLabelToDetailAndSubtitleLabelPadding;
- (double)iconHeight;
- (double)iconToHeaderLabelPadding;
- (double)topPadding;
- (id)_createDetailLabelIfNeeded;
- (id)_createImageView:(id)a3;
- (id)_detailFont;
- (id)_headerFontOverride;
- (id)_headerTextStyle;
- (id)_subtitleFont;
- (id)_symbolIconForHeaderStyle:(id)a3 configuration:(id)a4;
- (id)headerFont;
- (id)symbolConfiguration;
- (id)title;
- (unint64_t)headerStyle;
- (unint64_t)templateType;
- (void)_animateDetailLabelAlpha:(double)a3 duration:(double)a4;
- (void)_createHeaderLabelIfNeeded;
- (void)_insertAndLayoutImageViewIfNeeded;
- (void)_layoutTopAssetContainer;
- (void)_updateConstraintsForDetailLabel;
- (void)_updateConstraintsForSubtitle;
- (void)_updateHeaderLabelFont;
- (void)addAccessoryButton:(id)a3;
- (void)animationView;
- (void)customIconContainerView;
- (void)extendedInitWithTitle:(id)a3 detailText:(id)a4;
- (void)overrideSpansAllLines:(unint64_t)a3;
- (void)removeAccessoryButton;
- (void)removeAccessoryButtonFromSuperview;
- (void)removeDetailLabelFromSuperview;
- (void)setAccessoryButton:(id)a3;
- (void)setAllowFullWidthIcon:(BOOL)a3;
- (void)setAnimationView:(id)a3;
- (void)setCustomIconContainerView:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setDetailLabelConstraints:(id)a3;
- (void)setDetailText:(id)a3;
- (void)setDetailTextAccessibilityIdentifier:(id)a3;
- (void)setDetailedTextHeader:(id)a3 detailedTextBody:(id)a4;
- (void)setHeaderLabel:(id)a3;
- (void)setHeaderStyle:(unint64_t)a3;
- (void)setIcon:(id)a3 accessibilityLabel:(id)a4;
- (void)setIconAccessibilityIdentifier:(id)a3;
- (void)setIconInheritsTint:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setImageViewConstraints:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setOriginalIconImage:(id)a3;
- (void)setSubtitleLabel:(id)a3;
- (void)setSubtitleLabelConstraints:(id)a3;
- (void)setSubtitleText:(id)a3;
- (void)setSymbol:(id)a3 accessibilityLabel:(id)a4;
- (void)setTemplateType:(unint64_t)a3;
- (void)setTitle:(id)a3;
- (void)setTitleAccessibilityIdentifier:(id)a3;
- (void)setTitleHyphenationFactor:(float)a3;
- (void)setTitleStyle:(unint64_t)a3;
- (void)setTitleTrailingSymbol:(id)a3;
- (void)setTopAssetContainer:(id)a3;
- (void)setTopAssetContainerConstraints:(id)a3;
- (void)setUnderlineLinks:(BOOL)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation OBHeaderView

- (OBHeaderView)initWithTitle:(id)a3
{
  return [(OBHeaderView *)self initWithTitle:a3 detailText:0 icon:0];
}

- (OBHeaderView)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)OBHeaderView;
  v11 = -[OBHeaderView initWithFrame:](&v17, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    if (v10)
    {
      v11->_usingSymbolImage = 1;
      v13 = [(OBHeaderView *)v11 symbolConfiguration];
      v14 = [(OBHeaderView *)v12 _symbolIconForHeaderStyle:v10 configuration:v13];

      v15 = [(OBHeaderView *)v12 _createImageView:v14];
      [(OBHeaderView *)v12 setImageView:v15];
    }
    [(OBHeaderView *)v12 extendedInitWithTitle:v8 detailText:v9];
  }

  return v12;
}

- (OBHeaderView)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)OBHeaderView;
  v11 = -[OBHeaderView initWithFrame:](&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v12 = v11;
  if (v11)
  {
    if (v10)
    {
      v13 = [(OBHeaderView *)v11 _createImageView:v10];
      [(OBHeaderView *)v12 setImageView:v13];
    }
    [(OBHeaderView *)v12 extendedInitWithTitle:v8 detailText:v9];
  }

  return v12;
}

- (OBHeaderView)initWithTitle:(id)a3 symbolName:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)OBHeaderView;
  id v8 = -[OBHeaderView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v9 = v8;
  if (v8)
  {
    if (v7)
    {
      v8->_usingSymbolImage = 1;
      id v10 = [(OBHeaderView *)v8 symbolConfiguration];
      v11 = [(OBHeaderView *)v9 _symbolIconForHeaderStyle:v7 configuration:v10];

      v12 = [(OBHeaderView *)v9 _createImageView:v11];
      [(OBHeaderView *)v9 setImageView:v12];
    }
    v13 = &stru_1EEC28768;
    if (v6) {
      v13 = v6;
    }
    v14 = v13;

    [(OBHeaderView *)v9 extendedInitWithTitle:v14 detailText:0];
    v6 = v14;
  }

  return v9;
}

- (OBHeaderView)initWithTitle:(id)a3 icon:(id)a4
{
  v6 = (__CFString *)a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)OBHeaderView;
  id v8 = -[OBHeaderView initWithFrame:](&v14, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  id v9 = v8;
  if (v8)
  {
    if (v7)
    {
      id v10 = [(OBHeaderView *)v8 _createImageView:v7];
      [(OBHeaderView *)v9 setImageView:v10];
    }
    v11 = &stru_1EEC28768;
    if (v6) {
      v11 = v6;
    }
    v12 = v11;

    [(OBHeaderView *)v9 extendedInitWithTitle:v12 detailText:0];
    v6 = v12;
  }

  return v9;
}

- (void)extendedInitWithTitle:(id)a3 detailText:(id)a4
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  [(OBHeaderView *)self _createHeaderLabelIfNeeded];
  id v8 = [(OBHeaderView *)self headerLabel];
  [v8 setText:v7];

  id v9 = [(OBHeaderView *)self headerLabel];
  [(OBHeaderView *)self addSubview:v9];

  if ([v6 length])
  {
    id v10 = [(OBHeaderView *)self _createDetailLabelIfNeeded];
    [(OBHeaderView *)self setDetailLabel:v10];

    v11 = [(OBHeaderView *)self detailLabel];
    [v11 setText:v6];
  }
  v12 = [(OBHeaderView *)self detailLabel];
  [(OBHeaderView *)self addSubview:v12];

  v22 = (void *)MEMORY[0x1E4F28DC8];
  v13 = [(OBHeaderView *)self leftAnchor];
  objc_super v14 = [(OBHeaderView *)self headerLabel];
  objc_super v15 = [v14 leftAnchor];
  objc_super v16 = [v13 constraintEqualToAnchor:v15];
  v24[0] = v16;
  objc_super v17 = [(OBHeaderView *)self rightAnchor];
  v18 = [(OBHeaderView *)self headerLabel];
  v19 = [v18 rightAnchor];
  [v17 constraintEqualToAnchor:v19];
  v20 = v23 = v6;
  v24[1] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  [v22 activateConstraints:v21];

  [(OBHeaderView *)self _insertAndLayoutImageViewIfNeeded];
  [(OBHeaderView *)self _updateConstraintsForDetailLabel];
}

- (void)_createHeaderLabelIfNeeded
{
  v3 = [(OBHeaderView *)self headerLabel];

  if (!v3)
  {
    v4 = objc_alloc_init(OBTemplateLabel);
    [(OBHeaderView *)self setHeaderLabel:v4];

    v5 = [(OBHeaderView *)self headerLabel];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v6 = [MEMORY[0x1E4FB1618] labelColor];
    id v7 = [(OBHeaderView *)self headerLabel];
    [v7 setTextColor:v6];

    id v8 = [MEMORY[0x1E4FB1618] clearColor];
    id v9 = [(OBHeaderView *)self headerLabel];
    [v9 setBackgroundColor:v8];

    [(OBHeaderView *)self _updateHeaderLabelFont];
    id v10 = [(OBHeaderView *)self headerLabel];
    [v10 setNumberOfLines:0];
  }
}

- (void)setAllowFullWidthIcon:(BOOL)a3
{
  self->_allowFullWidthIcon = a3;
  [(OBHeaderView *)self _insertAndLayoutImageViewIfNeeded];
}

- (void)setIconInheritsTint:(BOOL)a3
{
  self->_iconInheritsTint = a3;
  [(OBHeaderView *)self tintColorDidChange];
}

- (void)setIcon:(id)a3 accessibilityLabel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (*(_OWORD *)&self->_animationView == 0)
  {
    objc_super v16 = [(OBHeaderView *)self imageView];

    if (!v16)
    {
      objc_super v17 = [(OBHeaderView *)self _createImageView:v6];
      [(OBHeaderView *)self setImageView:v17];

      [(OBHeaderView *)self _insertAndLayoutImageViewIfNeeded];
    }
    v18 = [(OBHeaderView *)self imageView];
    [v18 setContentMode:1];

    v19 = [(OBHeaderView *)self imageView];
    [v19 setImage:v6];

    [(OBHeaderView *)self setOriginalIconImage:v6];
    BOOL v20 = [v7 length] != 0;
    v21 = [(OBHeaderView *)self imageView];
    [v21 setIsAccessibilityElement:v20];

    v22 = [(OBHeaderView *)self imageView];
    [v22 setAccessibilityLabel:v7];

    self->_usingSymbolImage = 0;
  }
  else
  {
    id v8 = _OBLoggingFacility();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[OBHeaderView setIcon:accessibilityLabel:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

- (void)setSymbol:(id)a3 accessibilityLabel:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(OBHeaderView *)self symbolConfiguration];
  id v9 = [(OBHeaderView *)self _symbolIconForHeaderStyle:v7 configuration:v8];

  [(OBHeaderView *)self setIcon:v9 accessibilityLabel:v6];
  self->_usingSymbolImage = 1;
}

- (id)title
{
  v2 = [(OBHeaderView *)self headerLabel];
  v3 = [v2 text];

  return v3;
}

- (void)setTitle:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(OBHeaderView *)self headerLabel];
    [v5 setText:v4];
  }
}

- (void)setTitleTrailingSymbol:(id)a3
{
  id v4 = a3;
  id v5 = [(OBHeaderView *)self headerLabel];
  [v5 setTitleTrailingSymbol:v4];
}

- (void)setDetailText:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v5 = [(OBHeaderView *)self _createDetailLabelIfNeeded];
    id v6 = [(OBHeaderView *)self detailLabel];
    [v6 setText:v4];
  }
}

- (void)overrideSpansAllLines:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = _OBLoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(OBHeaderView *)self title];
    int v8 = 134218242;
    unint64_t v9 = a3;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    _os_log_impl(&dword_19BF0F000, v5, OS_LOG_TYPE_DEFAULT, "Overriding spansAllLines: (%li), for label with title:%@", (uint8_t *)&v8, 0x16u);
  }
  id v7 = [(OBHeaderView *)self detailLabel];
  [v7 overrideSpansAllLines:a3];
}

- (void)setLanguage:(id)a3
{
  id v4 = a3;
  id v5 = [(OBHeaderView *)self headerLabel];
  id v6 = [v5 _defaultAttributes];
  id v7 = (void *)[v6 mutableCopy];

  [v7 setObject:v4 forKeyedSubscript:@"NSLanguage"];
  int v8 = [(OBHeaderView *)self headerLabel];
  [v8 _setDefaultAttributes:v7];

  unint64_t v9 = [(OBHeaderView *)self detailLabel];
  __int16 v10 = [v9 _defaultAttributes];
  id v12 = (id)[v10 mutableCopy];

  [v12 setObject:v4 forKeyedSubscript:@"NSLanguage"];
  uint64_t v11 = [(OBHeaderView *)self detailLabel];
  [v11 _setDefaultAttributes:v12];
}

- (void)setDetailedTextHeader:(id)a3 detailedTextBody:(id)a4
{
  if (a3 && a4)
  {
    id v6 = a4;
    id v7 = a3;
    id v8 = [(OBHeaderView *)self _createDetailLabelIfNeeded];
    id v9 = [(OBHeaderView *)self detailLabel];
    [v9 setDetailedTextHeader:v7 detailedTextBody:v6];
  }
}

- (void)setSubtitleText:(id)a3
{
  id v16 = a3;
  id v4 = [(OBHeaderView *)self subtitleLabel];

  if (!v4)
  {
    id v5 = objc_alloc_init(OBTemplateLabel);
    [(OBHeaderView *)self setSubtitleLabel:v5];

    id v6 = [(OBHeaderView *)self subtitleLabel];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v7 = [(OBHeaderView *)self _subtitleFont];
    id v8 = [(OBHeaderView *)self subtitleLabel];
    [v8 setFont:v7];

    id v9 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    __int16 v10 = [(OBHeaderView *)self subtitleLabel];
    [v10 setTextColor:v9];

    uint64_t v11 = [(OBHeaderView *)self subtitleLabel];
    [v11 setNumberOfLines:0];

    id v12 = [(OBHeaderView *)self subtitleLabel];
    [(OBHeaderView *)self addSubview:v12];
  }
  uint64_t v13 = [v16 length];
  uint64_t v14 = [(OBHeaderView *)self subtitleLabel];
  uint64_t v15 = v14;
  if (v13)
  {
    [v14 setText:v16];
  }
  else
  {
    [v14 removeFromSuperview];

    [(OBHeaderView *)self setSubtitleLabel:0];
  }
  [(OBHeaderView *)self _updateConstraintsForDetailLabel];
  [(OBHeaderView *)self _updateConstraintsForSubtitle];
}

- (void)addAccessoryButton:(id)a3
{
  v27[4] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(OBHeaderView *)self detailLabel];

  if (!v5)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    BOOL v20 = @"Accessory button is not supported with no detail text.";
    goto LABEL_6;
  }
  id v6 = [(OBHeaderView *)self accessoryButton];

  if (v6)
  {
    v18 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v19 = *MEMORY[0x1E4F1C3B8];
    BOOL v20 = @"Only one accessory button is supported.";
LABEL_6:
    id v21 = [v18 exceptionWithName:v19 reason:v20 userInfo:0];
    objc_exception_throw(v21);
  }
  [(OBHeaderView *)self setAccessoryButton:v4];
  BOOL v7 = [(OBHeaderView *)self underlineLinks];
  id v8 = [(OBHeaderView *)self accessoryButton];
  [v8 setUnderlineLinks:v7];

  [(OBHeaderView *)self addSubview:v4];
  [(OBHeaderView *)self _updateConstraintsForDetailLabel];
  v22 = (void *)MEMORY[0x1E4F28DC8];
  v26 = [v4 leadingAnchor];
  v25 = [(OBHeaderView *)self leadingAnchor];
  v24 = [v26 constraintGreaterThanOrEqualToAnchor:v25];
  v27[0] = v24;
  v23 = [v4 trailingAnchor];
  id v9 = [(OBHeaderView *)self trailingAnchor];
  __int16 v10 = [v23 constraintLessThanOrEqualToAnchor:v9];
  v27[1] = v10;
  uint64_t v11 = [v4 centerXAnchor];
  id v12 = [(OBHeaderView *)self centerXAnchor];
  uint64_t v13 = [v11 constraintEqualToAnchor:v12];
  v27[2] = v13;
  uint64_t v14 = [v4 bottomAnchor];
  uint64_t v15 = [(OBHeaderView *)self bottomAnchor];
  id v16 = [v14 constraintEqualToAnchor:v15 constant:0.0];
  v27[3] = v16;
  objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
  [v22 activateConstraints:v17];
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)OBHeaderView;
  [(OBHeaderView *)&v8 traitCollectionDidChange:a3];
  [(OBHeaderView *)self _updateHeaderLabelFont];
  id v4 = [(OBHeaderView *)self _subtitleFont];
  id v5 = [(OBHeaderView *)self subtitleLabel];
  [v5 setFont:v4];

  id v6 = [(OBHeaderView *)self _detailFont];
  BOOL v7 = [(OBHeaderView *)self detailLabel];
  [v7 setFont:v6];
}

- (void)tintColorDidChange
{
  v10.receiver = self;
  v10.super_class = (Class)OBHeaderView;
  [(OBHeaderView *)&v10 tintColorDidChange];
  if ([(OBHeaderView *)self iconInheritsTint])
  {
    v3 = [(OBHeaderView *)self tintColor];

    if (v3)
    {
      if (self->_usingSymbolImage)
      {
        id v4 = [(OBHeaderView *)self originalIconImage];
        id v5 = [(OBHeaderView *)self tintColor];
        id v6 = [v4 imageWithTintColor:v5 renderingMode:2];

        BOOL v7 = [(OBHeaderView *)self imageView];
        [v7 setImage:v6];
      }
      else
      {
        id v6 = [(OBHeaderView *)self imageView];
        BOOL v7 = [(OBHeaderView *)self originalIconImage];
        objc_super v8 = [(OBHeaderView *)self tintColor];
        id v9 = [v7 _flatImageWithColor:v8];
        [v6 setImage:v9];
      }
    }
  }
}

- (void)setTitleStyle:(unint64_t)a3
{
  [(OBHeaderView *)self setHeaderStyle:a3];
  [(OBHeaderView *)self _updateHeaderLabelFont];
}

- (id)headerFont
{
  v3 = [(OBHeaderView *)self _headerFontOverride];
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(OBHeaderView *)self _headerTextStyle];
    BOOL v7 = (void *)MEMORY[0x1E4FB08E8];
    objc_super v8 = [(OBHeaderView *)self traitCollection];
    id v9 = [v7 preferredFontDescriptorWithTextStyle:v6 compatibleWithTraitCollection:v8];

    objc_super v10 = (void *)MEMORY[0x1E4FB08E0];
    uint64_t v11 = [v9 fontDescriptorWithSymbolicTraits:2];
    id v5 = [v10 fontWithDescriptor:v11 size:0.0];
  }
  return v5;
}

- (void)setTitleHyphenationFactor:(float)a3
{
  id v5 = [(OBHeaderView *)self headerLabel];
  *(float *)&double v4 = a3;
  [v5 _setHyphenationFactor:v4];
}

- (void)removeDetailLabelFromSuperview
{
  v3 = [(OBHeaderView *)self detailLabel];
  [v3 removeFromSuperview];

  [(OBHeaderView *)self _updateConstraintsForDetailLabel];
}

- (void)removeAccessoryButtonFromSuperview
{
  v3 = [(OBHeaderView *)self accessoryButton];
  [v3 removeFromSuperview];

  [(OBHeaderView *)self _updateConstraintsForDetailLabel];
}

- (void)removeAccessoryButton
{
  v3 = [(OBHeaderView *)self accessoryButton];
  [v3 removeFromSuperview];

  [(OBHeaderView *)self setAccessoryButton:0];
  [(OBHeaderView *)self _updateConstraintsForDetailLabel];
}

- (void)setIconAccessibilityIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(OBHeaderView *)self imageView];
  [v5 setAccessibilityIdentifier:v4];
}

- (void)setTitleAccessibilityIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(OBHeaderView *)self headerLabel];
  [v5 setAccessibilityIdentifier:v4];
}

- (void)setDetailTextAccessibilityIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(OBHeaderView *)self detailLabel];
  [v5 setAccessibilityIdentifier:v4];
}

- (void)_updateHeaderLabelFont
{
  id v4 = [(OBHeaderView *)self headerFont];
  v3 = [(OBHeaderView *)self headerLabel];
  [v3 setFont:v4];
}

- (id)_subtitleFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  v3 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v4 = *MEMORY[0x1E4FB28D0];
  id v5 = [(OBHeaderView *)self traitCollection];
  id v6 = [v3 preferredFontDescriptorWithTextStyle:v4 compatibleWithTraitCollection:v5];
  BOOL v7 = [v2 fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (id)_detailFont
{
  v2 = (void *)MEMORY[0x1E4FB08E0];
  v3 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v4 = *MEMORY[0x1E4FB28C8];
  id v5 = [(OBHeaderView *)self traitCollection];
  id v6 = [v3 preferredFontDescriptorWithTextStyle:v4 compatibleWithTraitCollection:v5];
  BOOL v7 = [v2 fontWithDescriptor:v6 size:0.0];

  return v7;
}

- (id)_createImageView:(id)a3
{
  id v4 = a3;
  [(OBHeaderView *)self setOriginalIconImage:v4];
  id v5 = [[OBImageView alloc] initWithImage:v4];

  [(OBImageView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  if (self->_usingSymbolImage) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 1;
  }
  [(OBImageView *)v5 setContentMode:v6];
  return v5;
}

- (void)_insertAndLayoutImageViewIfNeeded
{
  v46[3] = *MEMORY[0x1E4F143B8];
  v3 = [(OBHeaderView *)self imageView];

  if (v3)
  {
    [(OBHeaderView *)self iconHeight];
    double v5 = v4;
    uint64_t v6 = (void *)MEMORY[0x1E4F28DC8];
    BOOL v7 = [(OBHeaderView *)self imageViewConstraints];
    [v6 deactivateConstraints:v7];

    if (!self->_topAssetContainer)
    {
      id v8 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      id v9 = (UIView *)objc_msgSend(v8, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      topAssetContainer = self->_topAssetContainer;
      self->_topAssetContainer = v9;

      [(UIView *)self->_topAssetContainer setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v11 = [(OBHeaderView *)self topAssetContainer];
      [(OBHeaderView *)self addSubview:v11];
    }
    id v12 = [(OBHeaderView *)self imageView];
    [(OBHeaderView *)self addSubview:v12];

    v44 = [(OBHeaderView *)self imageView];
    v42 = [v44 topAnchor];
    v43 = [(OBHeaderView *)self topAssetContainer];
    v41 = [v43 topAnchor];
    v40 = [v42 constraintEqualToAnchor:v41];
    v46[0] = v40;
    v39 = [(OBHeaderView *)self centerXAnchor];
    uint64_t v13 = [(OBHeaderView *)self imageView];
    uint64_t v14 = [v13 centerXAnchor];
    uint64_t v15 = [v39 constraintEqualToAnchor:v14];
    v46[1] = v15;
    id v16 = [(OBHeaderView *)self imageView];
    objc_super v17 = [v16 bottomAnchor];
    v18 = [(OBHeaderView *)self topAssetContainer];
    uint64_t v19 = [v18 bottomAnchor];
    BOOL v20 = [v17 constraintEqualToAnchor:v19];
    v46[2] = v20;
    id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:3];
    v45 = (void *)[v21 mutableCopy];

    LODWORD(v16) = [(OBHeaderView *)self allowFullWidthIcon];
    v22 = [(OBHeaderView *)self imageView];
    v23 = v22;
    if (v16)
    {
      v24 = [v22 leadingAnchor];
      v25 = [(OBHeaderView *)self topAssetContainer];
      v26 = [v25 leadingAnchor];
      v27 = [v24 constraintEqualToAnchor:v26];
      v28 = v45;
      [v45 addObject:v27];

      v23 = [(OBHeaderView *)self imageView];
      v29 = [v23 trailingAnchor];
      v30 = [(OBHeaderView *)self topAssetContainer];
      v31 = [v30 trailingAnchor];
      v32 = [v29 constraintEqualToAnchor:v31];
      [v45 addObject:v32];
    }
    else
    {
      v29 = [v22 widthAnchor];
      v30 = [v29 constraintEqualToConstant:v5];
      v28 = v45;
      [v45 addObject:v30];
    }

    v33 = [(OBHeaderView *)self imageView];
    v34 = [v33 heightAnchor];
    [(OBHeaderView *)self iconHeight];
    v35 = objc_msgSend(v34, "constraintEqualToConstant:");
    [v28 addObject:v35];

    v36 = (void *)[v28 copy];
    [(OBHeaderView *)self setImageViewConstraints:v36];

    v37 = (void *)MEMORY[0x1E4F28DC8];
    v38 = [(OBHeaderView *)self imageViewConstraints];
    [v37 activateConstraints:v38];
  }
  [(OBHeaderView *)self _layoutTopAssetContainer];
}

- (void)_layoutTopAssetContainer
{
  v38[5] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0x1E4F28000uLL;
  double v4 = (void *)MEMORY[0x1E4F28DC8];
  double v5 = [(OBHeaderView *)self topAssetContainerConstraints];
  [v4 deactivateConstraints:v5];

  uint64_t v6 = [(OBHeaderView *)self topAssetContainer];

  BOOL v7 = [(OBHeaderView *)self topAnchor];
  if (v6)
  {
    v34 = [(OBHeaderView *)self topAssetContainer];
    uint64_t v32 = [v34 topAnchor];
    [(OBHeaderView *)self topPadding];
    uint64_t v30 = [v7 constraintEqualToAnchor:v32 constant:-v8];
    v38[0] = v30;
    v28 = [(OBHeaderView *)self topAssetContainer];
    v36 = [v28 leadingAnchor];
    v35 = [(OBHeaderView *)self leadingAnchor];
    v33 = [v36 constraintEqualToAnchor:v35];
    v38[1] = v33;
    v31 = [(OBHeaderView *)self topAssetContainer];
    v29 = [v31 trailingAnchor];
    v27 = [(OBHeaderView *)self trailingAnchor];
    v26 = [v29 constraintEqualToAnchor:v27];
    v38[2] = v26;
    v25 = [(OBHeaderView *)self topAssetContainer];
    id v9 = [v25 heightAnchor];
    [(OBHeaderView *)self iconHeight];
    objc_super v10 = objc_msgSend(v9, "constraintLessThanOrEqualToConstant:");
    v38[3] = v10;
    uint64_t v11 = [(OBHeaderView *)self topAssetContainer];
    id v12 = [v11 bottomAnchor];
    uint64_t v13 = [(OBHeaderView *)self headerLabel];
    uint64_t v14 = [v13 topAnchor];
    [(OBHeaderView *)self iconToHeaderLabelPadding];
    id v16 = [v12 constraintEqualToAnchor:v14 constant:-v15];
    v38[4] = v16;
    objc_super v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:5];
    [(OBHeaderView *)self setTopAssetContainerConstraints:v17];

    v18 = (void *)v30;
    uint64_t v19 = v28;

    BOOL v20 = (void *)v32;
    id v21 = v34;

    unint64_t v3 = 0x1E4F28000;
  }
  else
  {
    id v21 = [(OBHeaderView *)self headerLabel];
    BOOL v20 = [v21 topAnchor];
    [(OBHeaderView *)self topPadding];
    v18 = [v7 constraintEqualToAnchor:v20 constant:-v22];
    v37 = v18;
    uint64_t v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
    [(OBHeaderView *)self setTopAssetContainerConstraints:v19];
  }

  v23 = *(void **)(v3 + 3528);
  v24 = [(OBHeaderView *)self topAssetContainerConstraints];
  [v23 activateConstraints:v24];
}

- (id)_createDetailLabelIfNeeded
{
  unint64_t v3 = [(OBHeaderView *)self detailLabel];

  if (!v3)
  {
    double v4 = objc_alloc_init(OBTemplateHeaderDetailLabel);
    [(OBHeaderView *)self setDetailLabel:v4];

    double v5 = [(OBHeaderView *)self detailLabel];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v6 = [MEMORY[0x1E4FB1618] labelColor];
    BOOL v7 = [(OBHeaderView *)self detailLabel];
    [v7 setTextColor:v6];

    double v8 = [MEMORY[0x1E4FB1618] clearColor];
    id v9 = [(OBHeaderView *)self detailLabel];
    [v9 setBackgroundColor:v8];

    objc_super v10 = [(OBHeaderView *)self _detailFont];
    uint64_t v11 = [(OBHeaderView *)self detailLabel];
    [v11 setFont:v10];

    id v12 = [(OBHeaderView *)self detailLabel];
    [v12 setNumberOfLines:0];

    uint64_t v13 = [(OBHeaderView *)self detailLabel];
    [(OBHeaderView *)self addSubview:v13];

    [(OBHeaderView *)self _updateConstraintsForDetailLabel];
  }
  return [(OBHeaderView *)self detailLabel];
}

- (void)_updateConstraintsForDetailLabel
{
  v33[4] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(OBHeaderView *)self detailLabelConstraints];
  [(OBHeaderView *)self removeConstraints:v3];

  double v4 = [(OBHeaderView *)self detailLabel];
  double v5 = [v4 superview];

  if (v5 == self)
  {
    [(OBHeaderView *)self headerLabelToDetailAndSubtitleLabelPadding];
    double v12 = v11;
    uint64_t v13 = [(OBHeaderView *)self accessoryButton];

    double v14 = -v12;
    if (v13)
    {
      double v15 = [(OBHeaderView *)self detailLabel];
      id v16 = [v15 bottomAnchor];
      objc_super v17 = [(OBHeaderView *)self accessoryButton];
      v18 = [v17 topAnchor];
      uint64_t v19 = [v16 constraintEqualToAnchor:v18 constant:v14];
    }
    else
    {
      double v15 = [(OBHeaderView *)self bottomAnchor];
      id v16 = [(OBHeaderView *)self detailLabel];
      objc_super v17 = [v16 bottomAnchor];
      [(OBHeaderView *)self bottomPadding];
      uint64_t v19 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v17);
    }

    BOOL v7 = [(OBHeaderView *)self subtitleLabel];
    if (!v7)
    {
      BOOL v7 = [(OBHeaderView *)self headerLabel];
    }
    double v8 = [(OBHeaderView *)self leftAnchor];
    id v9 = [(OBHeaderView *)self detailLabel];
    objc_super v10 = [v9 leftAnchor];
    v31 = [v8 constraintEqualToAnchor:v10];
    v33[0] = v31;
    v29 = [(OBHeaderView *)self rightAnchor];
    uint64_t v30 = [(OBHeaderView *)self detailLabel];
    v28 = [v30 rightAnchor];
    v27 = [v29 constraintEqualToAnchor:v28];
    v33[1] = v27;
    v26 = [v7 bottomAnchor];
    BOOL v20 = [(OBHeaderView *)self detailLabel];
    id v21 = [v20 topAnchor];
    double v22 = [v26 constraintEqualToAnchor:v21 constant:v14];
    v33[2] = v22;
    v33[3] = v19;
    [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    v23 = uint64_t v6 = (void *)v19;
    [(OBHeaderView *)self setDetailLabelConstraints:v23];
  }
  else
  {
    uint64_t v6 = [(OBHeaderView *)self bottomAnchor];
    BOOL v7 = [(OBHeaderView *)self headerLabel];
    double v8 = [v7 bottomAnchor];
    [(OBHeaderView *)self bottomPadding];
    id v9 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v8);
    uint64_t v32 = v9;
    objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [(OBHeaderView *)self setDetailLabelConstraints:v10];
  }

  v24 = (void *)MEMORY[0x1E4F28DC8];
  v25 = [(OBHeaderView *)self detailLabelConstraints];
  [v24 activateConstraints:v25];
}

- (void)_updateConstraintsForSubtitle
{
  v36[4] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(OBHeaderView *)self subtitleLabel];

  if (v3)
  {
    double v4 = [(OBHeaderView *)self subtitleLabelConstraints];
    [(OBHeaderView *)self removeConstraints:v4];

    [(OBHeaderView *)self headerLabelToDetailAndSubtitleLabelPadding];
    double v6 = v5;
    BOOL v7 = [(OBHeaderView *)self detailLabel];

    if (v7)
    {
      double v8 = [(OBHeaderView *)self subtitleLabel];
      id v9 = [v8 bottomAnchor];
      objc_super v10 = [(OBHeaderView *)self detailLabel];
    }
    else
    {
      double v11 = [(OBHeaderView *)self accessoryButton];

      if (!v11)
      {
        v27 = [(OBHeaderView *)self bottomAnchor];
        v28 = [(OBHeaderView *)self subtitleLabel];
        v29 = [v28 bottomAnchor];
        [(OBHeaderView *)self bottomPadding];
        uint64_t v15 = objc_msgSend(v27, "constraintEqualToAnchor:constant:", v29);

        double v14 = -v6;
        goto LABEL_7;
      }
      double v8 = [(OBHeaderView *)self subtitleLabel];
      id v9 = [v8 bottomAnchor];
      objc_super v10 = [(OBHeaderView *)self accessoryButton];
    }
    double v12 = v10;
    uint64_t v13 = [v10 topAnchor];
    double v14 = -v6;
    uint64_t v15 = [v9 constraintEqualToAnchor:v13 constant:v14];

LABEL_7:
    uint64_t v30 = (void *)v15;
    v34 = [(OBHeaderView *)self leftAnchor];
    v35 = [(OBHeaderView *)self subtitleLabel];
    v33 = [v35 leftAnchor];
    uint64_t v32 = [v34 constraintEqualToAnchor:v33];
    v36[0] = v32;
    v31 = [(OBHeaderView *)self rightAnchor];
    id v16 = [(OBHeaderView *)self subtitleLabel];
    objc_super v17 = [v16 rightAnchor];
    v18 = [v31 constraintEqualToAnchor:v17];
    v36[1] = v18;
    uint64_t v19 = [(OBHeaderView *)self headerLabel];
    BOOL v20 = [v19 bottomAnchor];
    id v21 = [(OBHeaderView *)self subtitleLabel];
    double v22 = [v21 topAnchor];
    v23 = [v20 constraintEqualToAnchor:v22 constant:v14];
    v36[2] = v23;
    v36[3] = v15;
    v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
    [(OBHeaderView *)self setSubtitleLabelConstraints:v24];

    v25 = (void *)MEMORY[0x1E4F28DC8];
    v26 = [(OBHeaderView *)self subtitleLabelConstraints];
    [v25 activateConstraints:v26];
  }
}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
  [(OBHeaderView *)self _updateHeaderLabelFont];
  [(OBHeaderView *)self _insertAndLayoutImageViewIfNeeded];
}

- (double)topPadding
{
  return 0.0;
}

- (double)iconToHeaderLabelPadding
{
  return 20.0;
}

- (double)headerLabelToDetailAndSubtitleLabelPadding
{
  v2 = +[OBDevice currentDevice];
  uint64_t v3 = [v2 templateType];

  double result = 0.0;
  if ((unint64_t)(v3 - 1) <= 9) {
    return dbl_19BF4D0A0[v3 - 1];
  }
  return result;
}

- (double)detailLabelToAccessoryButtonPadding
{
  v2 = +[OBDevice currentDevice];
  uint64_t v3 = [v2 templateType];

  double result = 0.0;
  if ((unint64_t)(v3 - 1) <= 9) {
    return dbl_19BF4D0A0[v3 - 1];
  }
  return result;
}

- (double)bottomPadding
{
  return 0.0;
}

- (double)iconHeight
{
  if ([(OBHeaderView *)self templateType] - 1 > 2) {
    return 80.0;
  }
  [(OBHeaderView *)self _setupAssistantIconHeight];
  return result;
}

- (double)_setupAssistantIconHeight
{
  v2 = +[OBDevice currentDevice];
  uint64_t v3 = [v2 templateType];

  double result = 0.0;
  if ((unint64_t)(v3 - 1) <= 9) {
    return dbl_19BF4D0F0[v3 - 1];
  }
  return result;
}

- (id)symbolConfiguration
{
  v2 = +[OBDevice currentDevice];
  uint64_t v3 = [v2 templateType];

  double v4 = 0.0;
  if ((unint64_t)(v3 - 1) <= 9) {
    double v4 = dbl_19BF4D140[v3 - 1];
  }
  double v5 = (void *)MEMORY[0x1E4FB1830];
  double v6 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v4];
  BOOL v7 = [v5 configurationWithFont:v6];

  return v7;
}

- (id)_symbolIconForHeaderStyle:(id)a3 configuration:(id)a4
{
  double v5 = (void *)MEMORY[0x1E4FB1818];
  id v6 = a4;
  BOOL v7 = [v5 _systemImageNamed:a3];
  double v8 = [v7 imageWithConfiguration:v6];

  return v8;
}

- (void)_animateDetailLabelAlpha:(double)a3 duration:(double)a4
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__OBHeaderView__animateDetailLabelAlpha_duration___block_invoke;
  v5[3] = &unk_1E58AEB30;
  v5[4] = self;
  *(double *)&v5[5] = a3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __50__OBHeaderView__animateDetailLabelAlpha_duration___block_invoke_2;
  v4[3] = &unk_1E58AEB58;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:v5 animations:v4 completion:a4];
}

void __50__OBHeaderView__animateDetailLabelAlpha_duration___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) detailLabel];
  [v2 setAlpha:v1];
}

void __50__OBHeaderView__animateDetailLabelAlpha_duration___block_invoke_2(uint64_t a1)
{
  BOOL v1 = *(double *)(a1 + 40) == 0.0;
  id v2 = [*(id *)(a1 + 32) detailLabel];
  [v2 setHidden:v1];
}

- (OBAnimationView)animationView
{
  uint64_t v3 = [(OBHeaderView *)self imageView];
  if (v3)
  {

LABEL_4:
    double v4 = _OBLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(OBHeaderView *)v4 animationView];
    }

    double v12 = 0;
    goto LABEL_7;
  }
  if (self->_customIconContainerView) {
    goto LABEL_4;
  }
  animationView = self->_animationView;
  if (!animationView)
  {
    uint64_t v15 = [(OBHeaderView *)self topAssetContainer];

    if (!v15)
    {
      id v16 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      objc_super v17 = objc_msgSend(v16, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(OBHeaderView *)self setTopAssetContainer:v17];

      v18 = [(OBHeaderView *)self topAssetContainer];
      [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

      uint64_t v19 = [(OBHeaderView *)self topAssetContainer];
      [(OBHeaderView *)self addSubview:v19];
    }
    BOOL v20 = [OBAnimationView alloc];
    [(OBHeaderView *)self iconHeight];
    double v22 = -[OBAnimationView initWithFrame:](v20, "initWithFrame:", 0.0, 0.0, 0.0, v21);
    v23 = self->_animationView;
    self->_animationView = v22;

    [(OBAnimationView *)self->_animationView setTranslatesAutoresizingMaskIntoConstraints:0];
    v24 = [(OBHeaderView *)self topAssetContainer];
    [v24 addSubview:self->_animationView];

    [(OBHeaderView *)self _layoutTopAssetContainer];
    v25 = self->_animationView;
    v26 = [(OBHeaderView *)self topAssetContainer];
    [(UIView *)v25 ob_pinToEdges:v26];

    animationView = self->_animationView;
  }
  double v12 = animationView;
LABEL_7:
  return v12;
}

- (UIView)customIconContainerView
{
  uint64_t v3 = [(OBHeaderView *)self imageView];
  if (v3)
  {

LABEL_4:
    double v4 = _OBLoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      [(OBHeaderView *)v4 customIconContainerView];
    }

    double v12 = 0;
    goto LABEL_7;
  }
  if (self->_animationView) {
    goto LABEL_4;
  }
  customIconContainerView = self->_customIconContainerView;
  if (!customIconContainerView)
  {
    uint64_t v15 = [(OBHeaderView *)self topAssetContainer];

    if (v15)
    {
      double v16 = *MEMORY[0x1E4F1DB28];
      double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4FB1EB0]);
      double v16 = *MEMORY[0x1E4F1DB28];
      double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v19 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double v21 = objc_msgSend(v20, "initWithFrame:", *MEMORY[0x1E4F1DB28], v17, v18, v19);
      [(OBHeaderView *)self setTopAssetContainer:v21];

      double v22 = [(OBHeaderView *)self topAssetContainer];
      [v22 setTranslatesAutoresizingMaskIntoConstraints:0];

      v23 = [(OBHeaderView *)self topAssetContainer];
      [(OBHeaderView *)self addSubview:v23];
    }
    v24 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v16, v17, v18, v19);
    v25 = self->_customIconContainerView;
    self->_customIconContainerView = v24;

    [(UIView *)self->_customIconContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v26 = [(UIView *)self->_customIconContainerView layer];
    [v26 setMasksToBounds:1];

    v27 = [(OBHeaderView *)self topAssetContainer];
    [v27 addSubview:self->_customIconContainerView];

    [(OBHeaderView *)self _layoutTopAssetContainer];
    v28 = [(UIView *)self->_customIconContainerView heightAnchor];
    [(OBHeaderView *)self iconHeight];
    v29 = objc_msgSend(v28, "constraintEqualToConstant:");
    [v29 setActive:1];

    uint64_t v30 = self->_customIconContainerView;
    v31 = [(OBHeaderView *)self topAssetContainer];
    [(UIView *)v30 ob_pinToEdges:v31];

    customIconContainerView = self->_customIconContainerView;
  }
  double v12 = customIconContainerView;
LABEL_7:
  return v12;
}

- (id)_headerFontOverride
{
  return 0;
}

- (id)_headerTextStyle
{
  unint64_t v3 = [(OBHeaderView *)self templateType];
  double v4 = (id *)MEMORY[0x1E4FB2928];
  if (v3 - 2 < 2)
  {
    uint64_t v9 = (void *)*MEMORY[0x1E4FB2928];
LABEL_8:
    id v5 = v9;
    goto LABEL_10;
  }
  if (v3 == 1)
  {
    uint64_t v9 = (void *)*MEMORY[0x1E4FB2988];
    goto LABEL_8;
  }
  if (v3)
  {
    id v5 = 0;
  }
  else
  {
    id v5 = (id)*MEMORY[0x1E4FB2928];
    uint64_t v6 = +[OBDevice currentDevice];
    uint64_t v7 = [v6 templateType];

    if (v7 == 5)
    {
      id v8 = (id)*MEMORY[0x1E4FB2988];

      id v5 = v8;
    }
  }
LABEL_10:
  if (v5 == *v4
    && [(OBHeaderView *)self headerStyle]
    && [(OBHeaderView *)self headerStyle] == 1)
  {
    id v11 = (id)*MEMORY[0x1E4FB2988];

    id v5 = v11;
  }
  return v5;
}

- (BOOL)iconInheritsTint
{
  return self->_iconInheritsTint;
}

- (BOOL)allowFullWidthIcon
{
  return self->_allowFullWidthIcon;
}

- (void)setAnimationView:(id)a3
{
}

- (void)setCustomIconContainerView:(id)a3
{
}

- (OBImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIView)topAssetContainer
{
  return self->_topAssetContainer;
}

- (void)setTopAssetContainer:(id)a3
{
}

- (NSArray)topAssetContainerConstraints
{
  return self->_topAssetContainerConstraints;
}

- (void)setTopAssetContainerConstraints:(id)a3
{
}

- (OBTemplateLabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
}

- (OBTemplateLabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
}

- (OBTemplateHeaderDetailLabel)detailLabel
{
  return self->_detailLabel;
}

- (void)setDetailLabel:(id)a3
{
}

- (NSArray)imageViewConstraints
{
  return self->_imageViewConstraints;
}

- (void)setImageViewConstraints:(id)a3
{
}

- (NSArray)detailLabelConstraints
{
  return self->_detailLabelConstraints;
}

- (void)setDetailLabelConstraints:(id)a3
{
}

- (NSArray)subtitleLabelConstraints
{
  return self->_subtitleLabelConstraints;
}

- (void)setSubtitleLabelConstraints:(id)a3
{
}

- (OBHeaderAccessoryButton)accessoryButton
{
  return self->_accessoryButton;
}

- (void)setAccessoryButton:(id)a3
{
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (UIImage)originalIconImage
{
  return self->_originalIconImage;
}

- (void)setOriginalIconImage:(id)a3
{
}

- (BOOL)underlineLinks
{
  return self->_underlineLinks;
}

- (void)setUnderlineLinks:(BOOL)a3
{
  self->_underlineLinks = a3;
}

- (unint64_t)headerStyle
{
  return self->_headerStyle;
}

- (void)setHeaderStyle:(unint64_t)a3
{
  self->_headerStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalIconImage, 0);
  objc_storeStrong((id *)&self->_accessoryButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabelConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabelConstraints, 0);
  objc_storeStrong((id *)&self->_imageViewConstraints, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_topAssetContainerConstraints, 0);
  objc_storeStrong((id *)&self->_topAssetContainer, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_customIconContainerView, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
}

- (void)setIcon:(uint64_t)a3 accessibilityLabel:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)animationView
{
}

- (void)customIconContainerView
{
}

@end