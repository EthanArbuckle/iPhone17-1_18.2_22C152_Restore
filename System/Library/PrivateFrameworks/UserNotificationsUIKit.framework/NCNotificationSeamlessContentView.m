@interface NCNotificationSeamlessContentView
+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6;
- (BOOL)_needsTextAttributesUpdate;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)alignContentToBottom;
- (BOOL)areTextMenusEnabled;
- (BOOL)hideDate;
- (BOOL)isDateAllDay;
- (BOOL)isHorizontalMarginPaddingDisabled;
- (BOOL)isThumbnailAlignedWithSecondaryText;
- (BOOL)isTruncatingSecondaryText;
- (BOOL)isURLInteractionEnabled;
- (BOOL)screenCaptureProhibited;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (CGRect)_textFrameForBounds:(CGRect)a3 ignoreBadgedIconView:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (MTVisualStylingProvider)importantTextVisualStylingProvider;
- (NCBadgedIconView)badgedIconView;
- (NCNotificationSeamlessContentView)initWithFrame:(CGRect)a3;
- (NCNotificationSeamlessContentViewDelegate)delegate;
- (NSArray)requiredVisualStyleCategories;
- (NSAttributedString)contentSummaryText;
- (NSAttributedString)importantAttributedText;
- (NSAttributedString)secondaryText;
- (NSDate)date;
- (NSString)footerText;
- (NSString)importantText;
- (NSString)preferredContentSizeCategory;
- (NSString)primarySubtitleText;
- (NSString)primaryText;
- (NSTimeZone)timeZone;
- (UIAction)inlineAction;
- (UIImage)thumbnail;
- (UIImageConfiguration)importantTextImageConfiguration;
- (double)dateAlpha;
- (id)_createContentSummaryLabel;
- (id)_dateLabelFont;
- (id)_dateLabelPreferredFont;
- (id)_updateAttributedString:(id)a3 withTextStyle:(id)a4 additionalTraits:(unsigned int)a5;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)dateFormatStyle;
- (unint64_t)_footerTextMaximumNumberOfLines;
- (unint64_t)_importantTextMaximumNumberOfLines;
- (unint64_t)primarySubtitleTextMaximumNumberOfLines;
- (unint64_t)primaryTextMaximumNumberOfLines;
- (unint64_t)secondaryTextMaximumNumberOfLines;
- (void)_adjustInlineActionButtonBackgroundColor;
- (void)_configureContentSummaryTextElementsIfNecessary;
- (void)_configureCrossfadingContentViewIfNecessary;
- (void)_configureDateLabel;
- (void)_configureDateLabelIfNecessary;
- (void)_configureImportantTextLabelIfNecessary;
- (void)_configureSecondaryLabelIfNecessary;
- (void)_configureSecondaryTextElementIfNecessary;
- (void)_configureSecondaryTextViewIfNecessary;
- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4;
- (void)_recycleDateLabel;
- (void)_setNeedsTextAttributesUpdate;
- (void)_tearDownDateLabel;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForContentSummaryTextLabel;
- (void)_updateTextAttributesForDateLabel;
- (void)_updateTextAttributesForFooterTextLabel;
- (void)_updateTextAttributesForImportantTextLabel;
- (void)_updateTextAttributesForInlineActionButton;
- (void)_updateTextAttributesForPrimarySubtitleTextLabel;
- (void)_updateTextAttributesForPrimaryTextLabel;
- (void)_updateTextAttributesForSecondaryTextElement;
- (void)_updateTextAttributesIfNecessary;
- (void)_updateVisualStylingOfImageView:(id)a3 ifSymbolImageWithStyle:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)dateLabelDidChange:(id)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAlignContentToBottom:(BOOL)a3;
- (void)setBadgedIconView:(id)a3;
- (void)setContentSummaryText:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateAllDay:(BOOL)a3;
- (void)setDateAlpha:(double)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setFooterText:(id)a3;
- (void)setHideDate:(BOOL)a3;
- (void)setHorizontalMarginPaddingDisabled:(BOOL)a3;
- (void)setImportantAttributedText:(id)a3;
- (void)setImportantText:(id)a3;
- (void)setImportantTextVisualStylingProvider:(id)a3;
- (void)setInlineAction:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setPrimarySubtitleText:(id)a3;
- (void)setPrimarySubtitleTextMaximumNumberOfLines:(unint64_t)a3;
- (void)setPrimaryText:(id)a3;
- (void)setPrimaryTextMaximumNumberOfLines:(unint64_t)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextMaximumNumberOfLines:(unint64_t)a3;
- (void)setTextMenusEnabled:(BOOL)a3;
- (void)setThumbnail:(id)a3;
- (void)setThumbnailAlignedWithSecondaryText:(BOOL)a3;
- (void)setTimeZone:(id)a3;
- (void)setURLInteractionEnabled:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCNotificationSeamlessContentView

- (NCNotificationSeamlessContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationSeamlessContentView;
  v3 = -[NCNotificationSeamlessContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NCNotificationSeamlessContentView *)v3 setAccessibilityIdentifier:@"ShortLook.Platter.Content.Seamless"];
    v4->_adjustsFontForContentSizeCategory = 1;
    v4->_dateAlpha = 1.0;
  }
  return v4;
}

- (void)setURLInteractionEnabled:(BOOL)a3
{
  if (self->_URLInteractionEnabled != a3)
  {
    self->_URLInteractionEnabled = a3;
    [(NCTextSupporting *)self->_secondaryTextElement removeFromSuperview];
    [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_secondaryTextElement style:0 visualStylingProvider:0 outgoingProvider:self->_strokeVisualStylingProvider];
    secondaryTextElement = self->_secondaryTextElement;
    self->_secondaryTextElement = 0;

    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)setTextMenusEnabled:(BOOL)a3
{
  if (self->_textMenusEnabled != a3)
  {
    self->_BOOL textMenusEnabled = a3;
    -[UILabel nc_setMenuEnabled:](self->_primaryTextLabel, "nc_setMenuEnabled:");
    [(UILabel *)self->_primarySubtitleTextLabel nc_setMenuEnabled:self->_textMenusEnabled];
    [(UILabel *)self->_importantTextLabel nc_setMenuEnabled:self->_textMenusEnabled];
    [(NCTextSupporting *)self->_secondaryTextElement nc_setMenuEnabled:self->_textMenusEnabled];
    [(UILabel *)self->_primaryContentSummaryLabel nc_setMenuEnabled:self->_textMenusEnabled];
    secondaryContentSummaryLabel = self->_secondaryContentSummaryLabel;
    BOOL textMenusEnabled = self->_textMenusEnabled;
    [(UILabel *)secondaryContentSummaryLabel nc_setMenuEnabled:textMenusEnabled];
  }
}

- (void)setThumbnailAlignedWithSecondaryText:(BOOL)a3
{
  if (self->_thumbnailAlignedWithSecondaryText != a3)
  {
    self->_thumbnailAlignedWithSecondaryText = a3;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (NSString)primaryText
{
  return [(UILabel *)self->_primaryTextLabel text];
}

- (void)setPrimaryText:(id)a3
{
  id v11 = a3;
  v4 = [(NCNotificationSeamlessContentView *)self primaryText];
  char v5 = BSEqualStrings();

  id v6 = v11;
  if ((v5 & 1) == 0)
  {
    primaryTextLabel = self->_primaryTextLabel;
    if (v11)
    {
      if (!primaryTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v9 = self->_primaryTextLabel;
        self->_primaryTextLabel = v8;

        [(UILabel *)self->_primaryTextLabel setAccessibilityIdentifier:@"NotificationTitle"];
        [(UILabel *)self->_primaryTextLabel nc_setMenuEnabled:self->_textMenusEnabled];
        [(UILabel *)self->_primaryTextLabel setLineBreakMode:4];
        [(NCNotificationSeamlessContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_primaryTextLabel];
        [(NCNotificationSeamlessContentView *)self _updateTextAttributesForPrimaryTextLabel];
        [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_primaryTextLabel style:0 visualStylingProvider:self->_strokeVisualStylingProvider outgoingProvider:0];
        id v6 = v11;
        primaryTextLabel = self->_primaryTextLabel;
      }
      [(UILabel *)primaryTextLabel setText:v6];
    }
    else
    {
      [(UILabel *)primaryTextLabel removeFromSuperview];
      v10 = self->_primaryTextLabel;
      self->_primaryTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (NSString)primarySubtitleText
{
  return [(UILabel *)self->_primarySubtitleTextLabel text];
}

- (void)setPrimarySubtitleText:(id)a3
{
  id v11 = a3;
  v4 = [(NCNotificationSeamlessContentView *)self primarySubtitleText];
  char v5 = BSEqualStrings();

  id v6 = v11;
  if ((v5 & 1) == 0)
  {
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    if (v11)
    {
      if (!primarySubtitleTextLabel)
      {
        v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        v9 = self->_primarySubtitleTextLabel;
        self->_primarySubtitleTextLabel = v8;

        [(UILabel *)self->_primarySubtitleTextLabel nc_setMenuEnabled:self->_textMenusEnabled];
        [(UILabel *)self->_primarySubtitleTextLabel setAccessibilityIdentifier:@"NotificationSubtitle"];
        [(UILabel *)self->_primarySubtitleTextLabel setLineBreakMode:4];
        [(NCNotificationSeamlessContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_primarySubtitleTextLabel];
        [(NCNotificationSeamlessContentView *)self _updateTextAttributesForPrimarySubtitleTextLabel];
        [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_primarySubtitleTextLabel style:0 visualStylingProvider:self->_strokeVisualStylingProvider outgoingProvider:0];
        id v6 = v11;
        primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
      }
      [(UILabel *)primarySubtitleTextLabel setText:v6];
    }
    else
    {
      [(UILabel *)primarySubtitleTextLabel removeFromSuperview];
      v10 = self->_primarySubtitleTextLabel;
      self->_primarySubtitleTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (NSAttributedString)secondaryText
{
  return (NSAttributedString *)[(NCTextSupporting *)self->_secondaryTextElement attributedText];
}

- (void)setSecondaryText:(id)a3
{
  id v9 = a3;
  v4 = [(NCNotificationSeamlessContentView *)self secondaryText];
  char v5 = BSEqualObjects();

  id v6 = v9;
  if ((v5 & 1) == 0)
  {
    secondaryTextElement = self->_secondaryTextElement;
    if (v9)
    {
      if (!secondaryTextElement)
      {
        [(NCNotificationSeamlessContentView *)self _configureSecondaryTextElementIfNecessary];
        secondaryTextElement = self->_secondaryTextElement;
      }
      v8 = [(NCTextSupporting *)secondaryTextElement textColor];
      [(NCTextSupporting *)self->_secondaryTextElement setAttributedText:v9];
      [(NCTextSupporting *)self->_secondaryTextElement setTextColor:v8];
      [(NCNotificationSeamlessContentView *)self _updateTextAttributesForSecondaryTextElement];
      [(MTVisualStylingProvider *)self->_strokeVisualStylingProvider automaticallyUpdateView:self->_secondaryTextElement withStyle:0];
    }
    else
    {
      [(NCTextSupporting *)secondaryTextElement removeFromSuperview];
      v8 = self->_secondaryTextElement;
      self->_secondaryTextElement = 0;
    }

    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
    id v6 = v9;
  }
}

- (void)setContentSummaryText:(id)a3
{
  id v4 = a3;
  char v5 = [(NCNotificationSeamlessContentView *)self contentSummaryText];
  char v6 = BSEqualObjects();

  if (v6)
  {
    v7 = v4;
  }
  else
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    id v9 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      id v9 = (id *)MEMORY[0x1E4FB2950];
    }
    id v10 = *v9;
    v7 = [(NCNotificationSeamlessContentView *)self _updateAttributedString:v4 withTextStyle:v10 additionalTraits:0x8000];

    objc_storeStrong((id *)&self->_contentSummaryText, v7);
    primaryContentSummaryLabel = self->_primaryContentSummaryLabel;
    if (v7)
    {
      if (!primaryContentSummaryLabel) {
        [(NCNotificationSeamlessContentView *)self _configureContentSummaryTextElementsIfNecessary];
      }
      v12 = (void *)[v7 mutableCopy];
      v13 = (void *)[v7 mutableCopy];
      v28[0] = 0;
      v28[1] = v28;
      v28[2] = 0x2020000000;
      v28[3] = 0x7FFFFFFFFFFFFFFFLL;
      uint64_t v14 = [v7 length];
      uint64_t v15 = *MEMORY[0x1E4FB06B8];
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __59__NCNotificationSeamlessContentView_setContentSummaryText___block_invoke;
      v24[3] = &unk_1E6A92398;
      id v16 = v12;
      id v25 = v16;
      v27 = v28;
      id v17 = v13;
      id v26 = v17;
      objc_msgSend(v16, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v14, 0, v24);
      v18 = self->_primaryContentSummaryLabel;
      v19 = (void *)[v16 copy];
      [(UILabel *)v18 setAttributedText:v19];

      secondaryContentSummaryLabel = self->_secondaryContentSummaryLabel;
      v21 = (void *)[v17 copy];
      [(UILabel *)secondaryContentSummaryLabel setAttributedText:v21];

      [(MTVisualStylingProvider *)self->_strokeVisualStylingProvider automaticallyUpdateView:self->_primaryContentSummaryLabel withStyle:0];
      [(MTVisualStylingProvider *)self->_strokeVisualStylingProvider automaticallyUpdateView:self->_secondaryContentSummaryLabel withStyle:1];

      _Block_object_dispose(v28, 8);
    }
    else
    {
      [(UILabel *)primaryContentSummaryLabel removeFromSuperview];
      v22 = self->_primaryContentSummaryLabel;
      self->_primaryContentSummaryLabel = 0;

      [(UILabel *)self->_secondaryContentSummaryLabel removeFromSuperview];
      v23 = self->_secondaryContentSummaryLabel;
      self->_secondaryContentSummaryLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

void __59__NCNotificationSeamlessContentView_setContentSummaryText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  if (v14)
  {
    v7 = objc_opt_new();
    v8 = [v14 image];
    id v9 = [MEMORY[0x1E4FB1618] clearColor];
    id v10 = [v8 imageWithTintColor:v9];
    [v7 setImage:v10];

    uint64_t v11 = *MEMORY[0x1E4FB06B8];
    objc_msgSend(*(id *)(a1 + 32), "removeAttribute:range:", *MEMORY[0x1E4FB06B8], a3, a4);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", v11, v7, a3, a4);
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
  }
  else
  {
    v12 = *(void **)(a1 + 40);
    uint64_t v13 = *MEMORY[0x1E4FB0700];
    v7 = [MEMORY[0x1E4FB1618] clearColor];
    objc_msgSend(v12, "addAttribute:value:range:", v13, v7, a3, a4);
  }
}

- (id)_updateAttributedString:(id)a3 withTextStyle:(id)a4 additionalTraits:(unsigned int)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = (void *)[v9 mutableCopy];
  uint64_t v11 = *MEMORY[0x1E4FB06F8];
  uint64_t v12 = [v9 length];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__NCNotificationSeamlessContentView__updateAttributedString_withTextStyle_additionalTraits___block_invoke;
  v18[3] = &unk_1E6A923C0;
  v18[4] = self;
  id v19 = v8;
  unsigned int v21 = a5;
  id v13 = v10;
  id v20 = v13;
  id v14 = v8;
  objc_msgSend(v9, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0x100000, v18);

  uint64_t v15 = v20;
  id v16 = v13;

  return v16;
}

void __92__NCNotificationSeamlessContentView__updateAttributedString_withTextStyle_additionalTraits___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v7 = [a2 fontDescriptor];
  id v8 = [v7 fontAttributes];
  id v15 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4FB0950]];

  id v9 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4FB09F0]];
  id v10 = v9;
  if (v9)
  {
    [v9 floatValue];
    double v12 = v11;
  }
  else
  {
    double v12 = *MEMORY[0x1E4FB09D8];
  }
  id v13 = [(id)objc_opt_class() _preferredFont:1 textStyle:*(void *)(a1 + 40) weight:*(unsigned int *)(a1 + 56) additionalTraits:v12];
  uint64_t v14 = *MEMORY[0x1E4FB06F8];
  objc_msgSend(*(id *)(a1 + 48), "removeAttribute:range:", *MEMORY[0x1E4FB06F8], a3, a4);
  objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", v14, v13, a3, a4);
}

- (NSString)importantText
{
  return [(UILabel *)self->_importantTextLabel text];
}

- (void)setImportantText:(id)a3
{
  id v7 = a3;
  id v4 = [(NCNotificationSeamlessContentView *)self importantText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      [(NCNotificationSeamlessContentView *)self _configureImportantTextLabelIfNecessary];
      [(UILabel *)self->_importantTextLabel setText:v7];
    }
    else
    {
      [(UILabel *)self->_importantTextLabel removeFromSuperview];
      importantTextLabel = self->_importantTextLabel;
      self->_importantTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (NSAttributedString)importantAttributedText
{
  return [(UILabel *)self->_importantTextLabel attributedText];
}

- (void)setImportantAttributedText:(id)a3
{
  id v7 = a3;
  id v4 = [(NCNotificationSeamlessContentView *)self importantAttributedText];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    if (v7)
    {
      [(NCNotificationSeamlessContentView *)self _configureImportantTextLabelIfNecessary];
      [(UILabel *)self->_importantTextLabel setAttributedText:v7];
    }
    else
    {
      [(UILabel *)self->_importantTextLabel removeFromSuperview];
      importantTextLabel = self->_importantTextLabel;
      self->_importantTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (UIImageConfiguration)importantTextImageConfiguration
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4FB1830];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
  id v4 = (void *)MEMORY[0x1E4FB28C8];
  if (!IsAccessibilityCategory) {
    id v4 = (void *)MEMORY[0x1E4FB28F0];
  }
  char v5 = [v2 configurationWithTextStyle:*v4 scale:1];
  char v6 = (void *)MEMORY[0x1E4FB1830];
  id v7 = [MEMORY[0x1E4FB1618] whiteColor];
  v13[0] = v7;
  id v8 = [MEMORY[0x1E4FB1618] tintColor];
  v13[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v10 = [v6 configurationWithPaletteColors:v9];
  float v11 = [v5 configurationByApplyingConfiguration:v10];

  return (UIImageConfiguration *)v11;
}

- (MTVisualStylingProvider)importantTextVisualStylingProvider
{
  importantTextVisualStylingProvider = self->_importantTextVisualStylingProvider;
  if (importantTextVisualStylingProvider)
  {
    v3 = importantTextVisualStylingProvider;
  }
  else
  {
    v3 = [(NCNotificationSeamlessContentView *)self visualStylingProviderForCategory:1];
  }

  return v3;
}

- (void)setImportantTextVisualStylingProvider:(id)a3
{
  id v8 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    char v5 = [(NCNotificationSeamlessContentView *)self importantTextVisualStylingProvider];
    if (([v5 isAutomaticallyUpdatingView:self->_importantTextLabel] & 1) == 0)
    {

      char v5 = 0;
    }
    objc_storeStrong((id *)&self->_importantTextVisualStylingProvider, a3);
    importantTextLabel = self->_importantTextLabel;
    id v7 = [(NCNotificationSeamlessContentView *)self importantTextVisualStylingProvider];
    [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:importantTextLabel style:1 visualStylingProvider:v7 outgoingProvider:v5];
  }
}

- (void)setInlineAction:(id)a3
{
  id v14 = a3;
  id v4 = [(NCNotificationSeamlessContentView *)self inlineAction];
  char v5 = BSEqualObjects();

  char v6 = v14;
  if ((v5 & 1) == 0)
  {
    id v7 = (UIAction *)[v14 copy];
    inlineAction = self->_inlineAction;
    self->_inlineAction = v7;

    id v9 = [(UIAction *)self->_inlineAction title];

    inlineActionButton = self->_inlineActionButton;
    if (v9)
    {
      if (!inlineActionButton)
      {
        float v11 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
        double v12 = self->_inlineActionButton;
        self->_inlineActionButton = v11;

        [(UIButton *)self->_inlineActionButton addAction:self->_inlineAction forControlEvents:64];
        [(NCNotificationSeamlessContentView *)self _adjustInlineActionButtonBackgroundColor];
        [(UIButton *)self->_inlineActionButton _setContinuousCornerRadius:6.0];
        [(UIButton *)self->_inlineActionButton setContentHorizontalAlignment:3];
        [(NCNotificationSeamlessContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_inlineActionButton];
        [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_inlineActionButton style:0 visualStylingProvider:self->_strokeVisualStylingProvider outgoingProvider:0];
      }
      [(NCNotificationSeamlessContentView *)self _updateTextAttributesForInlineActionButton];
    }
    else
    {
      [(UIButton *)inlineActionButton removeFromSuperview];
      id v13 = self->_inlineActionButton;
      self->_inlineActionButton = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
    char v6 = v14;
  }
}

- (NSString)footerText
{
  return [(UILabel *)self->_footerTextLabel text];
}

- (void)setFooterText:(id)a3
{
  id v11 = a3;
  id v4 = [(NCNotificationSeamlessContentView *)self footerText];
  char v5 = BSEqualStrings();

  id v6 = v11;
  if ((v5 & 1) == 0)
  {
    footerTextLabel = self->_footerTextLabel;
    if (v11)
    {
      if (!footerTextLabel)
      {
        id v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        id v9 = self->_footerTextLabel;
        self->_footerTextLabel = v8;

        [(UILabel *)self->_footerTextLabel setLineBreakMode:4];
        [(NCNotificationSeamlessContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_footerTextLabel];
        [(NCNotificationSeamlessContentView *)self _updateTextAttributesForFooterTextLabel];
        [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_footerTextLabel style:1 visualStylingProvider:self->_strokeVisualStylingProvider outgoingProvider:0];
        id v6 = v11;
        footerTextLabel = self->_footerTextLabel;
      }
      [(UILabel *)footerTextLabel setText:v6];
    }
    else
    {
      [(UILabel *)footerTextLabel removeFromSuperview];
      id v10 = self->_footerTextLabel;
      self->_footerTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (NSDate *)[v6 copy];
    date = self->_date;
    self->_date = v4;

    [(NCNotificationSeamlessContentView *)self _tearDownDateLabel];
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)setDateAllDay:(BOOL)a3
{
  if (self->_dateAllDay != a3)
  {
    self->_dateAllDay = a3;
    [(NCNotificationSeamlessContentView *)self _tearDownDateLabel];
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    [(NCNotificationSeamlessContentView *)self _tearDownDateLabel];
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)setHideDate:(BOOL)a3
{
  if (self->_hideDate != a3)
  {
    self->_hideDate = a3;
    [(NCNotificationSeamlessContentView *)self _tearDownDateLabel];
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)setDateAlpha:(double)a3
{
  if (self->_dateAlpha != a3)
  {
    self->_dateAlpha = a3;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    id v4 = (NSTimeZone *)[v6 copy];
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    [(NCNotificationSeamlessContentView *)self _tearDownDateLabel];
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (NCBadgedIconView)badgedIconView
{
  return self->_badgedIconView;
}

- (void)setBadgedIconView:(id)a3
{
  id v9 = a3;
  p_badgedIconView = &self->_badgedIconView;
  char v6 = BSEqualObjects();
  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    [(NCBadgedIconView *)*p_badgedIconView removeFromSuperview];
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView)
    {
      -[NCNotificationSeamlessContentView addSubview:](self, "addSubview:");
      id v8 = [(NCNotificationSeamlessContentView *)self visualStylingProviderForCategory:1];
      [(NCBadgedIconView *)*p_badgedIconView updateVisualStylingOfProminentImageViewIfSymbolImageWithStyle:0 visualStylingProvider:v8 outgoingProvider:v8];
    }
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
    id v7 = v9;
  }
}

- (UIImage)thumbnail
{
  return [(UIImageView *)self->_thumbnailImageView image];
}

- (void)setThumbnail:(id)a3
{
  id v12 = a3;
  id v4 = [(NCNotificationSeamlessContentView *)self thumbnail];
  char v5 = BSEqualObjects();

  id v6 = v12;
  if ((v5 & 1) == 0)
  {
    if (v12 && !self->_thumbnailImageView)
    {
      id v7 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
      thumbnailImageView = self->_thumbnailImageView;
      self->_thumbnailImageView = v7;

      [(UIImageView *)self->_thumbnailImageView setContentMode:1];
      [(UIImageView *)self->_thumbnailImageView _setContinuousCornerRadius:6.0];
      [(UIImageView *)self->_thumbnailImageView setClipsToBounds:1];
      [(NCNotificationSeamlessContentView *)self _configureCrossfadingContentViewIfNecessary];
      [(UIView *)self->_crossfadingContentView addSubview:self->_thumbnailImageView];
      id v6 = v12;
    }
    [(UIImageView *)self->_thumbnailImageView setImage:v6];
    id v9 = [(NCNotificationSeamlessContentView *)self visualStylingProviderForCategory:1];
    [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfImageView:self->_thumbnailImageView ifSymbolImageWithStyle:0 visualStylingProvider:v9 outgoingProvider:v9];
    if (!v12)
    {
      id v10 = self->_thumbnailImageView;
      if (v10)
      {
        [(UIImageView *)v10 removeFromSuperview];
        id v11 = self->_thumbnailImageView;
        self->_thumbnailImageView = 0;
      }
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (void)setPrimaryTextMaximumNumberOfLines:(unint64_t)a3
{
  if (self->_primaryTextMaximumNumberOfLines != a3)
  {
    self->_primaryTextMaximumNumberOfLines = a3;
    [(NCNotificationSeamlessContentView *)self _setNeedsTextAttributesUpdate];
    self->_hasUpdatedContent = 1;
  }
}

- (void)setPrimarySubtitleTextMaximumNumberOfLines:(unint64_t)a3
{
  if (self->_primarySubtitleTextMaximumNumberOfLines != a3)
  {
    self->_primarySubtitleTextMaximumNumberOfLines = a3;
    [(NCNotificationSeamlessContentView *)self _setNeedsTextAttributesUpdate];
    self->_hasUpdatedContent = 1;
  }
}

- (void)setSecondaryTextMaximumNumberOfLines:(unint64_t)a3
{
  if (self->_secondaryTextMaximumNumberOfLines != a3)
  {
    self->_secondaryTextMaximumNumberOfLines = a3;
    [(NCNotificationSeamlessContentView *)self _setNeedsTextAttributesUpdate];
    self->_hasUpdatedContent = 1;
  }
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCNotificationSeamlessContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
  }
}

+ (id)_preferredFont:(BOOL)a3 textStyle:(id)a4 weight:(double)a5 additionalTraits:(unsigned int)a6
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a3) {
    [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  else {
  id v7 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:a4 addingSymbolicTraits:*(void *)&a6 options:0];
  }
  uint64_t v16 = *MEMORY[0x1E4FB0950];
  uint64_t v14 = *MEMORY[0x1E4FB09F0];
  id v8 = [NSNumber numberWithDouble:a5];
  id v15 = v8;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  id v11 = [v7 fontDescriptorByAddingAttributes:v10];

  id v12 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v11 size:0.0];

  return v12;
}

- (void)setAlignContentToBottom:(BOOL)a3
{
  if (self->_alignContentToBottom != a3)
  {
    self->_alignContentToBottom = a3;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  long long v6 = *MEMORY[0x1E4F1DB30];
  BSRectWithSize();
  -[NCNotificationSeamlessContentView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", &v6);
  double v5 = *((double *)&v6 + 1);
  double v4 = *(double *)&v6;
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSeamlessContentView;
  [(NCNotificationSeamlessContentView *)&v3 layoutSubviews];
  [(NCNotificationSeamlessContentView *)self bounds];
  if (CGRectGetWidth(v4) > 0.0)
  {
    [(NCNotificationSeamlessContentView *)self bounds];
    -[NCNotificationSeamlessContentView _layoutSubviewInBounds:measuringOnly:](self, "_layoutSubviewInBounds:measuringOnly:", 0);
    if (self->_hasUpdatedContent)
    {
      [(UIView *)self->_crossfadingContentView pl_performCrossFadeIfNecessary];
      self->_hasUpdatedContent = 0;
    }
  }
}

- (void)didMoveToWindow
{
  objc_super v3 = [(NCNotificationSeamlessContentView *)self window];

  if (v3)
  {
    [(NCNotificationSeamlessContentView *)self adjustForContentSizeCategoryChange];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSeamlessContentView;
  [(NCNotificationSeamlessContentView *)&v4 traitCollectionDidChange:a3];
  [(NCNotificationSeamlessContentView *)self _adjustInlineActionButtonBackgroundColor];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
  {
    objc_super v4 = strokeVisualStylingProvider;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCNotificationSeamlessContentView;
    objc_super v4 = [(NCNotificationSeamlessContentView *)&v6 visualStylingProviderForCategory:a3];
  }

  return v4;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F84598;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  objc_super v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    id v11 = v6;
    id v8 = v6;
    id v9 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v8;
    id v10 = strokeVisualStylingProvider;

    [(NCNotificationSeamlessContentView *)self _visualStylingProviderDidChange:self->_strokeVisualStylingProvider forCategory:a4 outgoingProvider:v10];
    objc_super v6 = v11;
  }
}

- (void)dateLabelDidChange:(id)a3
{
  [(BSUIDateLabel *)self->_dateLabel sizeToFit];
  [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  objc_super v4 = [(NCNotificationSeamlessContentView *)self primaryText];
  uint64_t v5 = [v4 length];

  objc_super v6 = [(NCNotificationSeamlessContentView *)self contentSummaryText];
  uint64_t v7 = [v6 length];

  if (v5)
  {
    unint64_t v8 = [(UILabel *)self->_primaryTextLabel numberOfLines];
  }
  else
  {
    if (!v7) {
      return;
    }
    unint64_t v8 = [(UILabel *)self->_primaryContentSummaryLabel nc_numberOfLines];
  }
  if (v8 != 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained didInvalidateSizeFromNotificationSeamlessContentView:self];
    }
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v9 = a4;
  if (!a6 && self->_secondaryTextElement == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained notificationSeamlessContentView:self requestsInteractionWithURL:v9];
    }
  }
  return 0;
}

- (void)_configureCrossfadingContentViewIfNecessary
{
  if (!self->_crossfadingContentView)
  {
    objc_super v3 = [NCMaterialCrossFadingView alloc];
    [(NCNotificationSeamlessContentView *)self bounds];
    objc_super v4 = -[NCMaterialCrossFadingView initWithFrame:](v3, "initWithFrame:");
    crossfadingContentView = self->_crossfadingContentView;
    self->_crossfadingContentView = v4;

    [(UIView *)self->_crossfadingContentView setAccessibilityIdentifier:@"ShortLook.Platter.Content.Seamless.CrossFade"];
    [(NCNotificationSeamlessContentView *)self addSubview:self->_crossfadingContentView];
    objc_super v6 = self->_crossfadingContentView;
    [(UIView *)v6 setAutoresizingMask:18];
  }
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (void)_updateVisualStylingOfImageView:(id)a3 ifSymbolImageWithStyle:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v10 = a6;
    id v11 = a5;
    id v12 = a3;
    id v14 = [v12 image];
    if ([v14 isSymbolImage]) {
      id v13 = v11;
    }
    else {
      id v13 = 0;
    }
    [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:v12 style:a4 visualStylingProvider:v13 outgoingProvider:v10];
  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  badgedIconView = self->_badgedIconView;
  id v8 = a5;
  id v9 = a3;
  [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:badgedIconView style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_primaryTextLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_primarySubtitleTextLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_secondaryTextElement style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_primaryContentSummaryLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_secondaryContentSummaryLabel style:1 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_inlineActionButton style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_footerTextLabel style:1 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfImageView:self->_thumbnailImageView ifSymbolImageWithStyle:0 visualStylingProvider:v9 outgoingProvider:v8];
}

- (CGRect)_textFrameForBounds:(CGRect)a3 ignoreBadgedIconView:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(NCNotificationSeamlessContentView *)self isHorizontalMarginPaddingDisabled]) {
    double v10 = 0.0;
  }
  else {
    double v10 = 14.0;
  }
  if (!a4 && self->_badgedIconView) {
    double v10 = v10 + 50.0;
  }
  if ([(NCNotificationSeamlessContentView *)self isHorizontalMarginPaddingDisabled]) {
    double v11 = 0.0;
  }
  else {
    double v11 = 17.0;
  }
  if ([(NCNotificationSeamlessContentView *)self _shouldReverseLayoutDirection])double v12 = v11; {
  else
  }
    double v12 = v10;
  id v13 = [(NCNotificationSeamlessContentView *)self traitCollection];
  [v13 displayScale];
  UIFloorToScale();
  double v15 = v14;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  CGFloat v16 = CGRectGetWidth(v28) - v10 - v11;
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  double v17 = CGRectGetHeight(v29);
  v18 = [(NCNotificationSeamlessContentView *)self traitCollection];
  [v18 displayScale];
  UIFloorToScale();
  double v20 = v17 - v19;
  unsigned int v21 = [(NCNotificationSeamlessContentView *)self traitCollection];
  [v21 displayScale];
  UIFloorToScale();
  double v23 = v20 - v22;

  double v24 = v12;
  double v25 = v15;
  double v26 = v16;
  double v27 = v23;
  result.size.CGFloat height = v27;
  result.size.CGFloat width = v26;
  result.origin.CGFloat y = v25;
  result.origin.CGFloat x = v24;
  return result;
}

- (void)_layoutSubviewInBounds:(CGRect)a3 measuringOnly:(CGSize *)a4
{
  double width = a3.size.width;
  double height = a3.size.height;
  double x = a3.origin.x;
  double y = a3.origin.y;
  uint64_t v367 = *MEMORY[0x1E4F143B8];
  [(NCNotificationSeamlessContentView *)self _updateTextAttributesIfNecessary];
  r2_24 = a4;
  BOOL v6 = a4 == 0;
  int v256 = [(NCNotificationSeamlessContentView *)self _shouldReverseLayoutDirection];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
  uint64_t v7 = [(NCNotificationSeamlessContentView *)self traitCollection];
  [v7 displayScale];
  uint64_t v237 = v8;

  uint64_t v362 = 0;
  v363 = (double *)&v362;
  uint64_t v364 = 0x2020000000;
  uint64_t v365 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke;
  aBlock[3] = &unk_1E6A92410;
  BOOL v361 = v6;
  aBlock[5] = &v362;
  aBlock[4] = self;
  id v9 = (void (**)(void *, BSUIDateLabel *))_Block_copy(aBlock);
  BOOL v259 = [(NCNotificationSeamlessContentView *)self alignContentToBottom];
  -[NCNotificationSeamlessContentView _textFrameForBounds:ignoreBadgedIconView:](self, "_textFrameForBounds:ignoreBadgedIconView:", 0, x, y, width, height);
  CGFloat v243 = v11;
  CGFloat v244 = v10;
  CGFloat v242 = v12;
  CGFloat rect = v13;
  uint64_t v354 = 0;
  v355 = (CGRect *)&v354;
  uint64_t v356 = 0x4010000000;
  v357 = &unk_1D7DBF3F7;
  long long r1 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  long long r2 = *MEMORY[0x1E4F1DB28];
  long long v358 = *MEMORY[0x1E4F1DB28];
  long long v359 = r1;
  [(NCNotificationSeamlessContentView *)self _configureDateLabelIfNecessary];
  dateLabel = self->_dateLabel;
  [(NCNotificationSeamlessContentView *)self dateAlpha];
  objc_msgSend(dateLabel, "setAlpha:");
  double v15 = self->_dateLabel;
  if (v15) {
    char v16 = IsAccessibilityCategory;
  }
  else {
    char v16 = 1;
  }
  if (v16) {
    goto LABEL_17;
  }
  -[BSUIDateLabel sizeThatFits:](v15, "sizeThatFits:", width, height);
  BSRectWithSize();
  p_double x = (void *)&v355->origin.x;
  v355[1].origin.double x = v18;
  p_x[5] = v19;
  p_x[6] = v20;
  p_x[7] = v21;
  CGFloat v23 = v243;
  CGFloat v22 = v244;
  CGFloat v24 = v242;
  CGFloat v25 = rect;
  if (v256)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v22);
  }
  else
  {
    double MaxX = CGRectGetMaxX(*(CGRect *)&v22);
    double MinX = MaxX - CGRectGetWidth(v355[1]);
  }
  v355[1].origin.double x = MinX;
  if (v259
    && ([(NCNotificationSeamlessContentView *)self thumbnail],
        (dateLabel = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v368.origin.double x = x;
    v368.origin.double y = y;
    v368.size.double width = width;
    v368.size.double height = height;
    double v30 = CGRectGetHeight(v368);
    v31 = [(NCNotificationSeamlessContentView *)self traitCollection];
    [v31 displayScale];
    UIFloorToScale();
    v355[1].origin.double y = v30 - v32 - CGRectGetHeight(v355[1]);

    dateLabel = 0;
  }
  else
  {
    CGRect v28 = [(NCNotificationSeamlessContentView *)self traitCollection];
    [v28 displayScale];
    UIFloorToScale();
    v355[1].origin.double y = v29 + 2.0;

    if (!v259) {
      goto LABEL_14;
    }
  }

LABEL_14:
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E4FB27D8], self->_preferredContentSizeCategory) == NSOrderedDescending)
  {
    v33 = [(NCNotificationSeamlessContentView *)self _dateLabelFont];
    v34 = [(NCNotificationSeamlessContentView *)self traitCollection];
    [v34 displayScale];
    UIFloorToScale();
    [v33 _scaledValueForValue:v35 + 2.0];
    v355[1].origin.double y = v36;
  }
  UIRectIntegralWithScale();
  v37 = (void *)&v355->origin.x;
  v355[1].origin.double x = v38;
  v37[5] = v39;
  v37[6] = v40;
  v37[7] = v41;
  v9[2](v9, self->_dateLabel);
LABEL_17:
  uint64_t v42 = [(NCNotificationSeamlessContentView *)self thumbnail];

  uint64_t v348 = 0;
  v349 = (CGRect *)&v348;
  uint64_t v350 = 0x4010000000;
  v351 = &unk_1D7DBF3F7;
  long long v352 = r2;
  long long v353 = r1;
  v338[0] = MEMORY[0x1E4F143A8];
  v338[1] = 3221225472;
  v338[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_3;
  v338[3] = &unk_1E6A92438;
  char v346 = v256;
  v340 = &v348;
  v338[4] = self;
  double v342 = x;
  double v343 = y;
  double v344 = width;
  double v345 = height;
  v341 = &v354;
  BOOL v347 = v259;
  v43 = v9;
  v339 = v43;
  v245 = (void (**)(void))_Block_copy(v338);
  if (v42 && !self->_thumbnailAlignedWithSecondaryText && !CGRectIsEmpty(v355[1])) {
    v245[2]();
  }
  uint64_t v332 = 0;
  v333 = (CGRect *)&v332;
  uint64_t v334 = 0x4010000000;
  v335 = &unk_1D7DBF3F7;
  long long v336 = 0u;
  long long v337 = 0u;
  v369.origin.double x = v244;
  v369.origin.double y = v243;
  v369.size.double width = v242;
  v369.size.double height = rect;
  CGFloat v44 = CGRectGetMinX(v369);
  v370.origin.double x = v244;
  v370.origin.double y = v243;
  v370.size.double width = v242;
  v370.size.double height = rect;
  CGFloat MinY = CGRectGetMinY(v370);
  v371.origin.double x = v244;
  v371.origin.double y = v243;
  v371.size.double width = v242;
  v371.size.double height = rect;
  *(double *)&unint64_t v46 = CGRectGetWidth(v371);
  *(CGFloat *)&long long v336 = v44;
  *((CGFloat *)&v336 + 1) = MinY;
  long long v337 = v46;
  v330[0] = MEMORY[0x1E4F143A8];
  v330[1] = 3221225472;
  v330[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_4;
  v330[3] = &unk_1E6A92460;
  char v331 = v256;
  v330[4] = &v332;
  v47 = (double (**)(void *, UILabel *, uint64_t))_Block_copy(v330);
  v328[0] = MEMORY[0x1E4F143A8];
  v328[1] = 3221225472;
  v328[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_5;
  v328[3] = &__block_descriptor_33_e104__CGRect__CGPoint_dd__CGSize_dd__72__0_CGRect__CGPoint_dd__CGSize_dd__8_CGRect__CGPoint_dd__CGSize_dd__40l;
  char v329 = v256;
  v48 = _Block_copy(v328);
  v49 = [(NCNotificationSeamlessContentView *)self contentSummaryText];
  uint64_t v247 = [v49 length];

  v50 = [(NCNotificationSeamlessContentView *)self primaryText];
  uint64_t v240 = [v50 length];

  v51 = [(UILabel *)self->_primaryContentSummaryLabel text];
  if ([v51 length])
  {
    unint64_t v52 = 1;
  }
  else
  {
    v53 = [(UILabel *)self->_secondaryContentSummaryLabel text];
    unint64_t v52 = [v53 length] != 0;
  }
  v54 = [(NCNotificationSeamlessContentView *)self primaryText];
  if ([v54 length])
  {
    BOOL v55 = 1;
  }
  else
  {
    v56 = [(NCNotificationSeamlessContentView *)self primarySubtitleText];
    BOOL v55 = ([v56 length] | v42) != 0;
  }
  if (v247) {
    char v57 = v52;
  }
  else {
    char v57 = v55;
  }
  if (self->_dateLabel) {
    char v58 = (IsAccessibilityCategory | v57) ^ 1;
  }
  else {
    char v58 = 0;
  }
  v326[0] = 0;
  v326[1] = v326;
  v326[2] = 0x2020000000;
  char v238 = v58;
  if (self->_date)
  {
    char v59 = self->_hideDate || IsAccessibilityCategory;
    char v60 = v59 | v58;
  }
  else
  {
    char v60 = 1;
  }
  char v327 = v60;
  v317[0] = MEMORY[0x1E4F143A8];
  v317[1] = 3221225472;
  v317[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_6;
  v317[3] = &unk_1E6A924A8;
  double v322 = x;
  double v323 = y;
  double v324 = width;
  double v325 = height;
  v317[4] = self;
  v319 = v326;
  id v239 = v48;
  id v318 = v239;
  v320 = &v354;
  v321 = &v348;
  v61 = _Block_copy(v317);
  v314[0] = MEMORY[0x1E4F143A8];
  v314[1] = 3221225472;
  v314[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_7;
  v314[3] = &unk_1E6A924D0;
  BOOL v315 = v259;
  *(double *)&v314[6] = x;
  *(double *)&v314[7] = y;
  *(double *)&v314[8] = width;
  *(double *)&v314[9] = height;
  v314[4] = self;
  v314[5] = &v354;
  char v316 = v256;
  v241 = (double (**)(double, __n128, __n128, __n128, double, double, double, double))_Block_copy(v314);
  if (r2_24)
  {
    id v62 = 0;
  }
  else
  {
    id v62 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  v63 = [(NCNotificationSeamlessContentView *)self importantText];
  BOOL v64 = [v63 length] == 0;

  if (!v64)
  {
    (*((void (**)(void *, void, void))v61 + 2))(v61, 0, 0);
    double v65 = v47[2](v47, self->_importantTextLabel, 1);
    uint64_t v67 = v66;
    uint64_t v69 = v68;
    uint64_t v71 = v70;
    v308[0] = MEMORY[0x1E4F143A8];
    v308[1] = 3221225472;
    v308[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_8;
    v308[3] = &unk_1E6A924F8;
    v309 = v43;
    v308[4] = self;
    double v310 = v65;
    uint64_t v311 = v67;
    uint64_t v312 = v69;
    uint64_t v313 = v71;
    v72 = _Block_copy(v308);
    [v62 addObject:v72];
  }
  if (v240)
  {
    v73 = [(NCNotificationSeamlessContentView *)self importantText];
    if ([v73 length]) {
      BOOL v74 = v42 == 0;
    }
    else {
      BOOL v74 = 1;
    }
    uint64_t v75 = !v74;
    double v76 = (*((double (**)(void *, uint64_t, void))v61 + 2))(v61, v75, 0);
    double v78 = v77;
    double v80 = v79;
    double v82 = v81;

    double r2a = ((double (*)(double (**)(void *, UILabel *, uint64_t), UILabel *, BOOL, double, double, double, double))v47[2])(v47, self->_primaryTextLabel, !v259, v76, v78, v80, v82);
    double v249 = v83;
    double v250 = v84;
    double r1a = v85;
    if (!r2_24 && v259)
    {
      v372.origin.double x = x;
      v372.origin.double y = y;
      v372.size.double width = width;
      v372.size.double height = height;
      double v86 = CGRectGetHeight(v372);
      v87 = [(NCNotificationSeamlessContentView *)self traitCollection];
      [v87 displayScale];
      UIFloorToScale();
      double v89 = v88;
      v373.origin.double x = r2a;
      v373.origin.double y = v249;
      v373.size.double height = v250;
      v373.size.double width = r1a;
      double v90 = CGRectGetHeight(v373);

      if (self->_secondaryTextElement) {
        BOOL v91 = 1;
      }
      else {
        BOOL v91 = v247 != 0;
      }
      if (v91)
      {
        double v249 = v86 - v89 - v90;
      }
      else
      {
        UIRectCenteredXInRect();
        double r2a = v92;
        double v249 = v93;
        double v250 = v94;
        double r1a = v95;
      }
    }
    v302[0] = MEMORY[0x1E4F143A8];
    v302[1] = 3221225472;
    v302[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_10;
    v302[3] = &unk_1E6A924F8;
    v96 = v43;
    v303 = v96;
    v302[4] = self;
    double v304 = r2a;
    double v305 = v249;
    double v306 = r1a;
    double v307 = v250;
    unint64_t v52 = (unint64_t)_Block_copy(v302);
    [v62 addObject:v52];

    if (v42 && self->_thumbnailAlignedWithSecondaryText)
    {
      v245[2]();
      v374.origin.double x = r2a;
      v374.origin.double y = v249;
      v374.size.double height = v250;
      v374.size.double width = r1a;
      CGFloat MaxY = CGRectGetMaxY(v374);
      v98 = &v349->origin.x;
      v349[1].origin.double y = MaxY;
      ((void (*)(void (**)(void *, BSUIDateLabel *), UIImageView *, double, CGFloat, double, double))v96[2])(v96, self->_thumbnailImageView, v98[4], MaxY, v98[6], v98[7]);
    }
  }
  else
  {
    double r2a = *MEMORY[0x1E4F1DB28];
    double r1a = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v249 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v250 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  if (IsAccessibilityCategory && self->_date)
  {
    (*((void (**)(void *, BOOL, void))v61 + 2))(v61, v42 != 0, 0);
    CGFloat v99 = v47[2](v47, (UILabel *)self->_dateLabel, 1);
    v100 = (void *)&v355->origin.x;
    v355[1].origin.double x = v99;
    v100[5] = v101;
    v100[6] = v102;
    v100[7] = v103;
    v299[0] = MEMORY[0x1E4F143A8];
    v299[1] = 3221225472;
    v299[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_11;
    v299[3] = &unk_1E6A92520;
    v300 = v43;
    v299[4] = self;
    v301 = &v354;
    v104 = _Block_copy(v299);
    [v62 addObject:v104];
  }
  if (v42 && CGRectIsEmpty(v349[1])) {
    v245[2]();
  }
  v105 = [(NCNotificationSeamlessContentView *)self primarySubtitleText];
  BOOL v106 = [v105 length] == 0;

  if (!v106)
  {
    (*((void (**)(void *, BOOL, BOOL))v61 + 2))(v61, v42 != 0, IsAccessibilityCategory);
    double v107 = v47[2](v47, self->_primarySubtitleTextLabel, 1);
    uint64_t v109 = v108;
    uint64_t v111 = v110;
    uint64_t v113 = v112;
    v293[0] = MEMORY[0x1E4F143A8];
    v293[1] = 3221225472;
    v293[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_12;
    v293[3] = &unk_1E6A924F8;
    v294 = v43;
    v293[4] = self;
    double v295 = v107;
    uint64_t v296 = v109;
    uint64_t v297 = v111;
    uint64_t v298 = v113;
    v114 = _Block_copy(v293);
    [v62 addObject:v114];
  }
  uint64_t v115 = 440;
  if (v247)
  {
    if (v259) {
      unint64_t secondaryTextMaximumNumberOfLines = 1;
    }
    else {
      unint64_t secondaryTextMaximumNumberOfLines = self->_secondaryTextMaximumNumberOfLines;
    }
    [(UILabel *)self->_primaryContentSummaryLabel nc_setNumberOfLines:secondaryTextMaximumNumberOfLines];
    [(UILabel *)self->_secondaryContentSummaryLabel nc_setNumberOfLines:secondaryTextMaximumNumberOfLines];
    (*((void (**)(void *, BOOL, BOOL))v61 + 2))(v61, v42 != 0, IsAccessibilityCategory);
    double v117 = v47[2](v47, self->_primaryContentSummaryLabel, 1);
    CGFloat v121 = v117;
    double v122 = v118.n128_f64[0];
    CGFloat v123 = v119.n128_f64[0];
    CGFloat v124 = v120.n128_f64[0];
    if (!r2_24)
    {
      if (v240)
      {
        CGFloat v121 = v241[2](v117, v118, v119, v120, r2a, v249, r1a, v250);
        double v122 = v125;
        CGFloat v123 = v126;
        CGFloat v124 = v127;
      }
      else if (v259)
      {
        v375.origin.double x = x;
        v375.origin.double y = y;
        v375.size.double width = width;
        v375.size.double height = height;
        double v128 = CGRectGetHeight(v375);
        v129 = [(NCNotificationSeamlessContentView *)self traitCollection];
        [v129 displayScale];
        UIFloorToScale();
        double v131 = v130;
        v376.origin.double x = v121;
        v376.origin.double y = v122;
        v376.size.double width = v123;
        v376.size.double height = v124;
        double v132 = CGRectGetHeight(v376);

        double v122 = v128 - v131 - v132;
      }
    }
    v285[0] = MEMORY[0x1E4F143A8];
    v285[1] = 3221225472;
    v285[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_13;
    v285[3] = &unk_1E6A92548;
    v286 = v43;
    v285[4] = self;
    CGFloat v288 = v121;
    double v289 = v122;
    CGFloat v290 = v123;
    CGFloat v291 = v124;
    char v292 = v238;
    v287 = &v354;
    v133 = _Block_copy(v285);
    [v62 addObject:v133];
  }
  v134 = [(NCNotificationSeamlessContentView *)self secondaryText];
  BOOL v135 = [v134 length] == 0;

  if (!v135)
  {
    CGFloat v136 = (*((double (**)(void *, BOOL, BOOL))v61 + 2))(v61, v42 != 0, IsAccessibilityCategory);
    CGFloat v138 = v137;
    double v140 = v139;
    double v142 = v141;
    uint64_t v115 = 432;
    double v143 = v47[2](v47, (UILabel *)self->_secondaryTextElement, 1);
    double v145 = v144;
    double v147 = v146;
    double v149 = v148;
    secondaryTextElement = self->_secondaryTextElement;
    if (v259)
    {
      if ([(NCTextSupporting *)secondaryTextElement nc_numberOfLines] != 1)
      {
        unint64_t v151 = 1;
LABEL_87:
        [(NCTextSupporting *)self->_secondaryTextElement nc_setNumberOfLines:v151];
      }
    }
    else
    {
      uint64_t v152 = [(NCTextSupporting *)secondaryTextElement nc_numberOfLines];
      unint64_t v151 = self->_secondaryTextMaximumNumberOfLines;
      if (v152 != v151) {
        goto LABEL_87;
      }
    }
    if (!r2_24)
    {
      double v143 = ((double (*)(double, double, double, double, double, double, double, double))v241[2])(v143, v145, v147, v149, r2a, v249, r1a, v250);
      double v145 = v153;
      double v147 = v154;
      double v149 = v155;
      v156 = self->_secondaryTextElement;
      unint64_t v52 = 0x1E4FB1000uLL;
      uint64_t v157 = objc_opt_class();
      v158 = v156;
      if (v157)
      {
        if (objc_opt_isKindOfClass()) {
          v159 = v158;
        }
        else {
          v159 = 0;
        }
      }
      else
      {
        v159 = 0;
      }
      v160 = v159;

      if (v160)
      {
        -[NCTextSupporting sizeThatFits:](v160, "sizeThatFits:", v140, v142);
        double v248 = v161;
        uint64_t v115 = (uint64_t)self->_secondaryTextElement;
        uint64_t v162 = objc_opt_class();
        unint64_t v52 = (unint64_t)(id)v115;
        if (v162)
        {
          if (objc_opt_isKindOfClass()) {
            v163 = (void *)v52;
          }
          else {
            v163 = 0;
          }
        }
        else
        {
          v163 = 0;
        }
        id v164 = v163;

        v377.origin.double x = v136;
        v377.origin.double y = v138;
        v377.size.double width = v140;
        v377.size.double height = v142;
        CGRectGetWidth(v377);
        BSRectWithSize();
        objc_msgSend(v164, "textRectForBounds:limitedToNumberOfLines:", 0);
        double v166 = v165;

        self->_truncatingSecondaryText = round(v166) > round(v248);
      }
    }
    v279[0] = MEMORY[0x1E4F143A8];
    v279[1] = 3221225472;
    v279[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_14;
    v279[3] = &unk_1E6A924F8;
    v280 = v43;
    v279[4] = self;
    double v281 = v143;
    double v282 = v145;
    double v283 = v147;
    double v284 = v149;
    v167 = _Block_copy(v279);
    [v62 addObject:v167];
  }
  v168 = [(UIAction *)self->_inlineAction title];
  BOOL v169 = [v168 length] == 0;

  if (!v169)
  {
    (*((void (**)(void *, BOOL, BOOL))v61 + 2))(v61, v42 != 0, IsAccessibilityCategory);
    double v170 = v47[2](v47, (UILabel *)self->_inlineActionButton, 0);
    uint64_t v172 = v171;
    uint64_t v174 = v173;
    v333[1].size.double height = v333[1].size.height + 8.0;
    double v176 = v175 + 8.0;
    v273[0] = MEMORY[0x1E4F143A8];
    v273[1] = 3221225472;
    v273[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_15;
    v273[3] = &unk_1E6A924F8;
    v273[4] = self;
    v274 = v43;
    double v275 = v170;
    double v276 = v176;
    uint64_t v277 = v172;
    uint64_t v278 = v174;
    v177 = _Block_copy(v273);
    [v62 addObject:v177];
  }
  v178 = [(NCNotificationSeamlessContentView *)self footerText];
  BOOL v179 = [v178 length] == 0;

  if (!v179)
  {
    (*((void (**)(void *, BOOL, BOOL))v61 + 2))(v61, v42 != 0, IsAccessibilityCategory);
    double v180 = v47[2](v47, self->_footerTextLabel, 1);
    uint64_t v182 = v181;
    uint64_t v184 = v183;
    v333[1].size.double height = v333[1].size.height + 2.0;
    double v186 = v185 + 2.0;
    v267[0] = MEMORY[0x1E4F143A8];
    v267[1] = 3221225472;
    v267[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_16;
    v267[3] = &unk_1E6A924F8;
    v267[4] = self;
    v268 = v43;
    double v269 = v180;
    double v270 = v186;
    uint64_t v271 = v182;
    uint64_t v272 = v184;
    v187 = _Block_copy(v267);
    [v62 addObject:v187];
  }
  if (v256)
  {
    v378.origin.double x = x;
    v378.origin.double y = y;
    v378.size.double width = width;
    v378.size.double height = height;
    CGRectGetWidth(v378);
  }
  [(NCNotificationSeamlessContentView *)self isHorizontalMarginPaddingDisabled];
  UIRectCenteredYInRectScale();
  double v189 = v188;
  double v191 = v190;
  double v193 = v192;
  double v195 = v194;
  if ([(NCBadgedIconView *)self->_badgedIconView isFeaturingSymbol])
  {
    BSRectWithSize();
    uint64_t v236 = 0;
    UIRectCenteredIntegralRectScale();
    double v189 = v196;
    double v191 = v197;
    double v193 = v198;
    double v195 = v199;
  }
  if (r2_24) {
    BOOL v200 = 0;
  }
  else {
    BOOL v200 = v259;
  }
  if (v200)
  {
    [(NCNotificationSeamlessContentView *)self bounds];
    double v201 = CGRectGetHeight(v379);
    v202 = [(NCNotificationSeamlessContentView *)self traitCollection];
    [v202 displayScale];
    UIFloorToScale();
    double v204 = v203;
    v380.origin.double x = v189;
    v380.origin.double y = v191;
    v380.size.double width = v193;
    v380.size.double height = v195;
    double v205 = CGRectGetHeight(v380);

    if (v191 < v201 - v204 - v205) {
      double v191 = v201 - v204 - v205;
    }
  }
  if (IsAccessibilityCategory)
  {
    if (!CGRectIsEmpty(v355[1]))
    {
      v381.origin.double x = r2a;
      v381.origin.double y = v249;
      v381.size.double height = v250;
      v381.size.double width = r1a;
      CGRect v382 = CGRectUnion(v381, v355[1]);
      double r2a = v382.origin.x;
      double v249 = v382.origin.y;
      double v250 = v382.size.height;
      double r1a = v382.size.width;
    }
    v206 = [(NCNotificationSeamlessContentView *)self importantText];
    uint64_t v115 = [v206 length] == 0;

    if ((v115 & 1) == 0)
    {
      [(UILabel *)self->_importantTextLabel frame];
      v387.origin.double x = r2a;
      v387.origin.double y = v249;
      v387.size.double height = v250;
      v387.size.double width = r1a;
      CGRectUnion(v383, v387);
    }
    uint64_t v236 = v237;
    UIRectCenteredYInRectScale();
    double v189 = v207;
    double v191 = v208;
    double v193 = v209;
    double v195 = v210;
  }
  ((void (*)(void (**)(void *, BSUIDateLabel *), NCBadgedIconView *, double, double, double, double))v43[2])(v43, self->_badgedIconView, v189, v191, v193, v195);
  v211 = [(NCNotificationSeamlessContentView *)self traitCollection];
  [v211 displayScale];
  UIFloorToScale();
  double v213 = v212;
  double v214 = CGRectGetHeight(v333[1]);
  v215 = [(NCNotificationSeamlessContentView *)self traitCollection];
  [v215 displayScale];
  UIFloorToScale();
  double v217 = v216;

  if (self->_date && !UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory))
  {
    v211 = [(NCNotificationSeamlessContentView *)self traitCollection];
    [v211 displayScale];
    UIFloorToScale();
    double v221 = v220;
    uint64_t v115 = [(NCNotificationSeamlessContentView *)self _dateLabelFont];
    [(id)v115 lineHeight];
    uint64_t v42 = [(NCNotificationSeamlessContentView *)self traitCollection];
    [(id)v42 displayScale];
    UICeilToScale();
    double v223 = v222;
    unint64_t v52 = [(NCNotificationSeamlessContentView *)self traitCollection];
    [(id)v52 displayScale];
    UIFloorToScale();
    double v218 = v221 + 2.0 + v223 + v224;
    int v219 = 1;
  }
  else if (self->_thumbnailAlignedWithSecondaryText)
  {
    double v218 = CGRectGetMinY(v349[1]);
    int v219 = 0;
  }
  else
  {
    int v219 = 0;
    double v218 = 14.0;
  }
  v225 = [(NCNotificationSeamlessContentView *)self thumbnail];
  if (v225) {
    double v226 = 32.0;
  }
  else {
    double v226 = 0.0;
  }

  if (v219)
  {
  }
  double v227 = v213 + v214 + v217;
  double v228 = v218 + v226 + 14.0;
  if (r2_24)
  {
    v384.origin.double x = x;
    v384.origin.double y = y;
    v384.size.double width = width;
    v384.size.double height = height;
    CGRectGetWidth(v384);
    UISizeRoundToScale();
    r2_24->double width = v229;
    r2_24->double height = v230;
  }
  else
  {
    if (!v259 && fmax(v228, 66.0) > v227)
    {
      UIRectCenteredYInRectScale();
      double v231 = CGRectGetMinY(v385);
      v386.origin.double x = v244;
      v386.origin.double y = v243;
      v386.size.double width = v242;
      v386.size.double height = rect;
      v363[3] = v231 - CGRectGetMinY(v386);
    }
    long long v265 = 0u;
    long long v266 = 0u;
    long long v263 = 0u;
    long long v264 = 0u;
    id v232 = v62;
    uint64_t v233 = [v232 countByEnumeratingWithState:&v263 objects:v366 count:16];
    if (v233)
    {
      uint64_t v234 = *(void *)v264;
      do
      {
        for (uint64_t i = 0; i != v233; ++i)
        {
          if (*(void *)v264 != v234) {
            objc_enumerationMutation(v232);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v263 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v263 + 1) + 8 * i));
        }
        uint64_t v233 = [v232 countByEnumeratingWithState:&v263 objects:v366 count:16];
      }
      while (v233);
    }
  }
  _Block_object_dispose(v326, 8);

  _Block_object_dispose(&v332, 8);
  _Block_object_dispose(&v348, 8);
  _Block_object_dispose(&v354, 8);

  _Block_object_dispose(&v362, 8);
}

void __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v11 = a2;
  double v12 = v11;
  if (*(unsigned char *)(a1 + 48))
  {
    double v13 = a4 + *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    double v14 = [v11 superview];
    double v15 = v14;
    if (v14 == *(void **)(*(void *)(a1 + 32) + 408))
    {
    }
    else
    {
      [v12 frame];
      BOOL v16 = CGRectEqualToRect(v24, *MEMORY[0x1E4F1DB28]);

      if (!v16)
      {
        objc_msgSend(v12, "setFrame:", a3, v13, a5, a6);
        goto LABEL_7;
      }
    }
    double v17 = (void *)MEMORY[0x1E4FB1EB0];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_2;
    v18[3] = &unk_1E6A923E8;
    id v19 = v12;
    double v20 = a3;
    double v21 = v13;
    double v22 = a5;
    double v23 = a6;
    [v17 performWithoutAnimation:v18];
  }
LABEL_7:
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_3(uint64_t a1)
{
  BSRectWithSize();
  v2 = *(void **)(*(void *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
  if (*(unsigned char *)(a1 + 96))
  {
    int v7 = [*(id *)(a1 + 32) isHorizontalMarginPaddingDisabled];
    double v8 = 17.0;
    if (v7) {
      double v8 = 0.0;
    }
  }
  else
  {
    double Width = CGRectGetWidth(*(CGRect *)(a1 + 64));
    double v10 = Width - CGRectGetWidth(*(CGRect *)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    int v11 = [*(id *)(a1 + 32) isHorizontalMarginPaddingDisabled];
    double v12 = 17.0;
    if (v11) {
      double v12 = 0.0;
    }
    double v8 = v10 - v12;
  }
  *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v8;
  if (*(void *)(*(void *)(a1 + 32) + 480))
  {
    double MaxY = CGRectGetMaxY(*(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32));
    double v14 = [*(id *)(a1 + 32) traitCollection];
    [v14 displayScale];
    UIFloorToScale();
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = MaxY + v15;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = 0x402C000000000000;
  }
  uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  double v17 = *(double *)(v16 + 40);
  if (*(unsigned char *)(a1 + 97))
  {
    double Height = CGRectGetHeight(*(CGRect *)(a1 + 64));
    id v19 = [*(id *)(a1 + 32) traitCollection];
    [v19 displayScale];
    UIFloorToScale();
    double v21 = Height - v20 + -32.0;

    if (v17 < v21) {
      double v17 = v21;
    }
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
  }
  *(double *)(v16 + 40) = v17;
  UIRectIntegralWithScale();
  double v22 = *(void **)(*(void *)(a1 + 48) + 8);
  v22[4] = v25.n128_u64[0];
  v22[5] = v26.n128_u64[0];
  v22[6] = v27.n128_u64[0];
  v22[7] = v28.n128_u64[0];
  double v23 = *(void **)(*(void *)(a1 + 48) + 8);
  CGRect v24 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 40) + 16);
  v25.n128_u64[0] = v23[4];
  v26.n128_u64[0] = v23[5];
  v27.n128_u64[0] = v23[6];
  v28.n128_u64[0] = v23[7];

  return v24(v25, v26, v27, v28);
}

double __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_4(uint64_t a1, void *a2, int a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  objc_msgSend(a2, "sizeThatFits:", a6, a7);
  v23.origin.double x = a4;
  v23.origin.double y = a5;
  v23.size.double width = a6;
  v23.size.double height = a7;
  CGRectGetWidth(v23);
  CGFloat v13 = a4;
  CGFloat v14 = a5;
  CGFloat v15 = a6;
  CGFloat v16 = a7;
  if (a3) {
    CGRectGetMinX(*(CGRect *)&v13);
  }
  else {
    CGRectGetMinX(*(CGRect *)&v13);
  }
  CGRectGetMaxY(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32));
  UIRectIntegralWithScale();
  double v18 = v17;
  v24.origin.double x = v17;
  v24.origin.double y = v19;
  v24.size.double width = v20;
  v24.size.double height = v21;
  *(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8) + 32) = CGRectUnion(*(CGRect *)(*(void *)(*(void *)(a1 + 32) + 8)+ 32), v24);
  return v18;
}

CGFloat __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_5(uint64_t a1, double a2, double a3, double a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  v16.origin.double x = a6;
  v16.origin.double y = a7;
  v16.size.double width = a8;
  v16.size.double height = a9;
  CGRectGetWidth(v16);
  if (*(unsigned char *)(a1 + 32))
  {
    v17.origin.double x = a6;
    v17.origin.double y = a7;
    v17.size.double width = a8;
    v17.size.double height = a9;
    return CGRectGetMaxX(v17) + 10.0;
  }
  return a2;
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_6(uint64_t a1, int a2)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_textFrameForBounds:ignoreBadgedIconView:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    if (a2) {
      return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
  return result;
}

void __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_7(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  if (*(unsigned char *)(a1 + 80))
  {
    CGRect v33 = *(CGRect *)(a1 + 48);
    CGFloat height = v33.size.height;
    double v17 = CGRectGetHeight(v33);
    double v18 = [*(id *)(a1 + 32) traitCollection];
    [v18 displayScale];
    UIFloorToScale();
    double v20 = v17 - v19;
    v34.origin.double x = a2;
    v34.origin.double y = a3;
    v34.size.double width = a4;
    v34.size.CGFloat height = height;
    double v21 = CGRectGetHeight(v34);

    v35.origin.double x = a6;
    v35.origin.double y = a7;
    v35.size.double width = a8;
    v35.size.CGFloat height = a9;
    double v22 = a4 - (CGRectGetWidth(v35) + 5.0);
    CGRect v23 = [*(id *)(a1 + 32) thumbnail];
    double v24 = 0.0;
    if (!v23) {
      double v24 = CGRectGetWidth(*(CGRect *)(*(void *)(*(void *)(a1 + 40) + 8) + 32)) + 10.0;
    }
    double v25 = v20 - v21;
    double v26 = v22 - v24;

    double v27 = fmax(v26, 0.0);
    v36.origin.double x = a6;
    v36.origin.double y = a7;
    v36.size.double width = a8;
    v36.size.CGFloat height = a9;
    if (!CGRectEqualToRect(v36, *MEMORY[0x1E4F1DB28]))
    {
      CGFloat v28 = a6;
      CGFloat v29 = a7;
      CGFloat v30 = a8;
      CGFloat v31 = a9;
      if (*(unsigned char *)(a1 + 81))
      {
        CGRectGetMinX(*(CGRect *)&v28);
        v37.origin.double x = a2;
        v37.origin.double y = v25;
        v37.size.double width = v27;
        v37.size.CGFloat height = height;
        CGRectGetWidth(v37);
      }
      else
      {
        CGRectGetMaxX(*(CGRect *)&v28);
      }
    }
  }
}

void __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_8(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  int v7 = __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_9;
  double v8 = &unk_1E6A924F8;
  id v3 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = v3;
  long long v4 = *(_OWORD *)(a1 + 64);
  long long v11 = *(_OWORD *)(a1 + 48);
  long long v12 = v4;
  [v2 performWithoutAnimation:&v5];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 456), "setAlpha:", 1.0, v5, v6, v7, v8);
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 456), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_10(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 416), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_11(void *a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(a1[5] + 16))(a1[5], *(void *)(a1[4] + 480), *(double *)(*(void *)(a1[6] + 8) + 32), *(double *)(*(void *)(a1[6] + 8) + 40), *(double *)(*(void *)(a1[6] + 8) + 48), *(double *)(*(void *)(a1[6] + 8) + 56));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 424), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_13(uint64_t a1)
{
  (*(void (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  uint64_t result = (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 40) + 16))(*(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  if (*(unsigned char *)(a1 + 88))
  {
    double v3 = *(double *)(a1 + 64);
    [*(id *)(*(void *)(a1 + 32) + 440) _firstBaselineOffsetFromTop];
    double v5 = v3 + v4;
    [*(id *)(*(void *)(a1 + 32) + 480) _firstBaselineOffsetFromTop];
    *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v5 - v8.n128_f64[0];
    uint64_t v6 = *(void **)(*(void *)(a1 + 48) + 8);
    int v7 = *(uint64_t (**)(__n128, __n128, __n128, __n128))(*(void *)(a1 + 40) + 16);
    v8.n128_u64[0] = v6[4];
    v9.n128_u64[0] = v6[5];
    v10.n128_u64[0] = v6[6];
    v11.n128_u64[0] = v6[7];
    return v7(v8, v9, v10, v11);
  }
  return result;
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_14(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 432), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 472), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __74__NCNotificationSeamlessContentView__layoutSubviewInBounds_measuringOnly___block_invoke_16(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 464), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

- (unint64_t)_importantTextMaximumNumberOfLines
{
  return !UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
}

- (unint64_t)_footerTextMaximumNumberOfLines
{
  return !UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
}

- (void)_updateTextAttributesForPrimaryTextLabel
{
  if (self->_primaryTextLabel)
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    double v4 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v4 = (id *)MEMORY[0x1E4FB2950];
    }
    primaryTextLabel = self->_primaryTextLabel;
    id v6 = *v4;
    int v7 = [(id)objc_opt_class() _preferredFont:1 textStyle:v6 weight:0 additionalTraits:*MEMORY[0x1E4FB09E0]];

    [(UILabel *)primaryTextLabel setFont:v7];
    [(UILabel *)self->_primaryTextLabel setNumberOfLines:self->_primaryTextMaximumNumberOfLines];
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForPrimarySubtitleTextLabel
{
  if (self->_primarySubtitleTextLabel)
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    double v4 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v4 = (id *)MEMORY[0x1E4FB2950];
    }
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    id v6 = *v4;
    int v7 = [(id)objc_opt_class() _preferredFont:1 textStyle:v6 weight:0 additionalTraits:*MEMORY[0x1E4FB09E0]];

    [(UILabel *)primarySubtitleTextLabel setFont:v7];
    [(UILabel *)self->_primarySubtitleTextLabel setNumberOfLines:self->_primarySubtitleTextMaximumNumberOfLines];
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForSecondaryTextElement
{
  if (self->_secondaryTextElement)
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    double v4 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v4 = (id *)MEMORY[0x1E4FB2950];
    }
    secondaryTextElement = self->_secondaryTextElement;
    id v6 = *v4;
    int v7 = [(id)objc_opt_class() _preferredFont:1 textStyle:v6 weight:0x8000 additionalTraits:*MEMORY[0x1E4FB09D8]];

    [(NCTextSupporting *)secondaryTextElement setFont:v7];
    [(NCTextSupporting *)self->_secondaryTextElement nc_setNumberOfLines:self->_secondaryTextMaximumNumberOfLines];
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForContentSummaryTextLabel
{
  if (self->_primaryContentSummaryLabel) {
    [(NCNotificationSeamlessContentView *)self setContentSummaryText:self->_contentSummaryText];
  }
}

- (void)_updateTextAttributesForImportantTextLabel
{
  if (self->_importantTextLabel)
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    double v4 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v4 = (id *)MEMORY[0x1E4FB28F0];
    }
    importantTextLabel = self->_importantTextLabel;
    id v6 = *v4;
    int v7 = [(id)objc_opt_class() _preferredFont:1 textStyle:v6 weight:0 additionalTraits:*MEMORY[0x1E4FB09E0]];

    [(UILabel *)importantTextLabel setFont:v7];
    [(UILabel *)self->_importantTextLabel setNumberOfLines:[(NCNotificationSeamlessContentView *)self _importantTextMaximumNumberOfLines]];
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForInlineActionButton
{
  v14[1] = *MEMORY[0x1E4F143B8];
  double v3 = [(UIAction *)self->_inlineAction title];
  if ([v3 length])
  {
    double v4 = [(UIButton *)self->_inlineActionButton configuration];
    if (!v4)
    {
      double v4 = [MEMORY[0x1E4FB14D8] plainButtonConfiguration];
    }
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    id v6 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      id v6 = (id *)MEMORY[0x1E4FB2950];
    }
    id v7 = *v6;
    __n128 v8 = [(id)objc_opt_class() _preferredFont:1 textStyle:v7 weight:0 additionalTraits:*MEMORY[0x1E4FB09E0]];
    id v9 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v13 = *MEMORY[0x1E4FB06F8];
    v14[0] = v8;
    __n128 v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    __n128 v11 = (void *)[v9 initWithString:v3 attributes:v10];

    [v4 setAttributedTitle:v11];
    objc_msgSend(v4, "setContentInsets:", 8.0, 22.0, 8.0, 22.0);
    [v4 setButtonSize:0];
    [(UIButton *)self->_inlineActionButton setConfiguration:v4];
    long long v12 = [(UIButton *)self->_inlineActionButton titleLabel];
    [v12 setLineBreakMode:4];

    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForFooterTextLabel
{
  if (self->_footerTextLabel)
  {
    BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(self->_preferredContentSizeCategory);
    double v4 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v4 = (id *)MEMORY[0x1E4FB28F0];
    }
    footerTextLabel = self->_footerTextLabel;
    id v6 = *v4;
    id v7 = [(id)objc_opt_class() _preferredFont:1 textStyle:v6 weight:0 additionalTraits:*MEMORY[0x1E4FB09D8]];

    [(UILabel *)footerTextLabel setFont:v7];
    [(UILabel *)self->_footerTextLabel setNumberOfLines:[(NCNotificationSeamlessContentView *)self _footerTextMaximumNumberOfLines]];
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForDateLabel
{
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    double v4 = [(NCNotificationSeamlessContentView *)self _dateLabelPreferredFont];
    [(BSUIDateLabel *)dateLabel setFont:v4];

    [(BSUIDateLabel *)self->_dateLabel setNumberOfLines:1];
    [(BSUIDateLabel *)self->_dateLabel setLineBreakMode:3];
    self->_hasUpdatedContent = 1;
    [(NCNotificationSeamlessContentView *)self setNeedsLayout];
  }
}

- (BOOL)_needsTextAttributesUpdate
{
  return self->_preferredContentSizeCategory == 0;
}

- (void)_setNeedsTextAttributesUpdate
{
  preferredContentSizeCategordouble y = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategordouble y = 0;

  [(NCNotificationSeamlessContentView *)self setNeedsLayout];
}

- (void)_updateTextAttributes
{
  double v3 = [(NCNotificationSeamlessContentView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];
  preferredContentSizeCategordouble y = self->_preferredContentSizeCategory;
  self->_preferredContentSizeCategordouble y = v4;

  [(NCNotificationSeamlessContentView *)self _updateTextAttributesForPrimaryTextLabel];
  [(NCNotificationSeamlessContentView *)self _updateTextAttributesForPrimarySubtitleTextLabel];
  [(NCNotificationSeamlessContentView *)self _updateTextAttributesForSecondaryTextElement];
  [(NCNotificationSeamlessContentView *)self _updateTextAttributesForContentSummaryTextLabel];
  [(NCNotificationSeamlessContentView *)self _updateTextAttributesForImportantTextLabel];
  [(NCNotificationSeamlessContentView *)self _updateTextAttributesForInlineActionButton];
  [(NCNotificationSeamlessContentView *)self _updateTextAttributesForFooterTextLabel];

  [(NCNotificationSeamlessContentView *)self _updateTextAttributesForDateLabel];
}

- (void)_updateTextAttributesIfNecessary
{
  if ([(NCNotificationSeamlessContentView *)self _needsTextAttributesUpdate])
  {
    [(NCNotificationSeamlessContentView *)self _updateTextAttributes];
  }
}

- (void)_configureImportantTextLabelIfNecessary
{
  if (!self->_importantTextLabel)
  {
    double v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    importantTextLabel = self->_importantTextLabel;
    self->_importantTextLabel = v3;

    [(UILabel *)self->_importantTextLabel nc_setMenuEnabled:self->_textMenusEnabled];
    [(UILabel *)self->_importantTextLabel setLineBreakMode:4];
    [(NCNotificationSeamlessContentView *)self addSubview:self->_importantTextLabel];
    [(NCNotificationSeamlessContentView *)self _updateTextAttributesForImportantTextLabel];
    double v5 = self->_importantTextLabel;
    id v6 = [(NCNotificationSeamlessContentView *)self importantTextVisualStylingProvider];
    [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:v5 style:1 visualStylingProvider:v6 outgoingProvider:0];

    id v7 = self->_importantTextLabel;
    [(UILabel *)v7 setAlpha:0.0];
  }
}

- (void)_configureSecondaryLabelIfNecessary
{
  if (!self->_secondaryTextElement)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
    [v3 _setTextAlignmentFollowsWritingDirection:1];
    [v3 setLineBreakMode:4];
    objc_msgSend(v3, "nc_setMenuEnabled:", self->_textMenusEnabled);
    [v3 setAccessibilityIdentifier:@"NotificationBody"];
    secondaryTextElement = self->_secondaryTextElement;
    self->_secondaryTextElement = (NCTextSupporting *)v3;
  }
}

- (void)_configureSecondaryTextViewIfNecessary
{
  if (!self->_secondaryTextElement)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    objc_msgSend(v3, "nc_setMenuEnabled:", self->_textMenusEnabled);
    [v3 setShowsHorizontalScrollIndicator:0];
    [v3 setShowsVerticalScrollIndicator:0];
    [v3 setEditable:0];
    [v3 setSelectable:1];
    [v3 setDataDetectorTypes:3];
    [v3 _setInteractiveTextSelectionDisabled:1];
    [v3 setScrollEnabled:0];
    objc_msgSend(v3, "setTextContainerInset:", *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
    double v4 = [v3 textContainer];
    [v4 setLineFragmentPadding:0.0];

    double v5 = [v3 textContainer];
    [v5 setLineBreakMode:4];

    id v6 = [v3 layoutManager];
    [v6 setSynchronizesAlignmentToDirection:1];

    id v7 = [v3 layoutManager];
    [v7 setLimitsLayoutForSuspiciousContents:1];

    [v3 setDelegate:self];
    [v3 setAccessibilityIdentifier:@"NotificationBody"];
    secondaryTextElement = self->_secondaryTextElement;
    self->_secondaryTextElement = (NCTextSupporting *)v3;
  }
}

- (void)_configureSecondaryTextElementIfNecessary
{
  if (!self->_secondaryTextElement)
  {
    if (self->_URLInteractionEnabled) {
      [(NCNotificationSeamlessContentView *)self _configureSecondaryTextViewIfNecessary];
    }
    else {
      [(NCNotificationSeamlessContentView *)self _configureSecondaryLabelIfNecessary];
    }
    secondaryTextElement = self->_secondaryTextElement;
    double v4 = [MEMORY[0x1E4FB1618] clearColor];
    [(NCTextSupporting *)secondaryTextElement setBackgroundColor:v4];

    [(NCTextSupporting *)self->_secondaryTextElement setContentMode:4];
    [(NCNotificationSeamlessContentView *)self _configureCrossfadingContentViewIfNecessary];
    [(UIView *)self->_crossfadingContentView addSubview:self->_secondaryTextElement];
    [(NCNotificationSeamlessContentView *)self _updateTextAttributesForSecondaryTextElement];
    double v5 = self->_secondaryTextElement;
    strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
    [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:v5 style:0 visualStylingProvider:strokeVisualStylingProvider outgoingProvider:0];
  }
}

- (void)_configureContentSummaryTextElementsIfNecessary
{
  if (!self->_primaryContentSummaryLabel)
  {
    id v3 = [(NCNotificationSeamlessContentView *)self _createContentSummaryLabel];
    primaryContentSummaryLabel = self->_primaryContentSummaryLabel;
    self->_primaryContentSummaryLabel = v3;

    [(UILabel *)self->_primaryContentSummaryLabel setAccessibilityIdentifier:@"ContentSummary"];
    double v5 = [(NCNotificationSeamlessContentView *)self _createContentSummaryLabel];
    secondaryContentSummaryLabel = self->_secondaryContentSummaryLabel;
    self->_secondaryContentSummaryLabel = v5;

    [(NCNotificationSeamlessContentView *)self _configureCrossfadingContentViewIfNecessary];
    [(UIView *)self->_crossfadingContentView addSubview:self->_primaryContentSummaryLabel];
    [(UIView *)self->_crossfadingContentView addSubview:self->_secondaryContentSummaryLabel];
    [(NCNotificationSeamlessContentView *)self _updateTextAttributesForContentSummaryTextLabel];
    [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:self->_primaryContentSummaryLabel style:0 visualStylingProvider:self->_strokeVisualStylingProvider outgoingProvider:0];
    id v7 = self->_secondaryContentSummaryLabel;
    strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
    [(NCNotificationSeamlessContentView *)self _updateVisualStylingOfView:v7 style:1 visualStylingProvider:strokeVisualStylingProvider outgoingProvider:0];
  }
}

- (id)_createContentSummaryLabel
{
  id v3 = objc_alloc_init(NCClearableMaterialLabel);
  [(NCClearableMaterialLabel *)v3 setAccessibilityIdentifier:@"ContentSummary"];
  [(NCClearableMaterialLabel *)v3 _setTextAlignmentFollowsWritingDirection:1];
  [(NCClearableMaterialLabel *)v3 setLineBreakMode:4];
  [(UIView *)v3 nc_setMenuEnabled:self->_textMenusEnabled];
  double v4 = [MEMORY[0x1E4FB1618] clearColor];
  [(NCClearableMaterialLabel *)v3 setBackgroundColor:v4];

  [(NCClearableMaterialLabel *)v3 setContentMode:4];

  return v3;
}

- (id)_dateLabelFont
{
  id v3 = [(BSUIDateLabel *)self->_dateLabel font];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(NCNotificationSeamlessContentView *)self _dateLabelPreferredFont];
  }
  id v6 = v5;

  return v6;
}

- (id)_dateLabelPreferredFont
{
  v2 = objc_opt_class();
  uint64_t v3 = *MEMORY[0x1E4FB28F0];
  double v4 = *MEMORY[0x1E4FB09D8];

  return (id)[v2 _preferredFont:1 textStyle:v3 weight:0 additionalTraits:v4];
}

- (void)_configureDateLabelIfNecessary
{
  if (!self->_dateLabel)
  {
    if (self->_date) {
      [(NCNotificationSeamlessContentView *)self _configureDateLabel];
    }
  }
}

- (void)_configureDateLabel
{
  uint64_t v3 = [MEMORY[0x1E4F4F8A8] sharedInstance];
  double v4 = [v3 startLabelWithStartDate:self->_date endDate:0 timeZone:self->_timeZone allDay:self->_dateAllDay forStyle:self->_dateFormatStyle];
  dateLabel = self->_dateLabel;
  self->_dateLabel = v4;

  [(BSUIDateLabel *)self->_dateLabel setDelegate:self];
  [(BSUIDateLabel *)self->_dateLabel setHidden:self->_hideDate];
  [(NCNotificationSeamlessContentView *)self addSubview:self->_dateLabel];
  [(NCNotificationSeamlessContentView *)self _updateTextAttributesForDateLabel];
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
  {
    id v7 = self->_dateLabel;
    [(MTVisualStylingProvider *)strokeVisualStylingProvider automaticallyUpdateView:v7 withStyle:1];
  }
}

- (void)_adjustInlineActionButtonBackgroundColor
{
  inlineActionButton = self->_inlineActionButton;
  id v6 = [MEMORY[0x1E4FB1618] systemBlackColor];
  double v4 = [(NCNotificationSeamlessContentView *)self traitCollection];
  id v5 = objc_msgSend(v6, "colorWithAlphaComponent:", dbl_1D7D959D0[objc_msgSend(v4, "userInterfaceStyle") == 2]);
  [(UIButton *)inlineActionButton setBackgroundColor:v5];
}

- (void)_recycleDateLabel
{
  [(BSUIDateLabel *)self->_dateLabel setDelegate:0];
  [(BSUIDateLabel *)self->_dateLabel setHidden:0];
  [(MTVisualStylingProvider *)self->_strokeVisualStylingProvider stopAutomaticallyUpdatingView:self->_dateLabel];
  id v3 = [MEMORY[0x1E4F4F8A8] sharedInstance];
  [v3 recycleLabel:self->_dateLabel];
}

- (void)_tearDownDateLabel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __55__NCNotificationSeamlessContentView__tearDownDateLabel__block_invoke;
  v2[3] = &unk_1E6A91BB0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __55__NCNotificationSeamlessContentView__tearDownDateLabel__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 480);
  if (v2)
  {
    [v2 removeFromSuperview];
    [*(id *)(a1 + 32) _recycleDateLabel];
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(void **)(v3 + 480);
    *(void *)(v3 + 480) = 0;
  }
}

- (NSAttributedString)contentSummaryText
{
  return self->_contentSummaryText;
}

- (UIAction)inlineAction
{
  return self->_inlineAction;
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isDateAllDay
{
  return self->_dateAllDay;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (BOOL)hideDate
{
  return self->_hideDate;
}

- (double)dateAlpha
{
  return self->_dateAlpha;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (unint64_t)primaryTextMaximumNumberOfLines
{
  return self->_primaryTextMaximumNumberOfLines;
}

- (unint64_t)primarySubtitleTextMaximumNumberOfLines
{
  return self->_primarySubtitleTextMaximumNumberOfLines;
}

- (unint64_t)secondaryTextMaximumNumberOfLines
{
  return self->_secondaryTextMaximumNumberOfLines;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (BOOL)alignContentToBottom
{
  return self->_alignContentToBottom;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategordouble y = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NCNotificationSeamlessContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationSeamlessContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isURLInteractionEnabled
{
  return self->_URLInteractionEnabled;
}

- (BOOL)areTextMenusEnabled
{
  return self->_textMenusEnabled;
}

- (BOOL)isTruncatingSecondaryText
{
  return self->_truncatingSecondaryText;
}

- (BOOL)isThumbnailAlignedWithSecondaryText
{
  return self->_thumbnailAlignedWithSecondaryText;
}

- (BOOL)isHorizontalMarginPaddingDisabled
{
  return self->_horizontalMarginPaddingDisabled;
}

- (void)setHorizontalMarginPaddingDisabled:(BOOL)a3
{
  self->_horizontalMarginPaddingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_inlineAction, 0);
  objc_storeStrong((id *)&self->_importantTextVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_contentSummaryText, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_inlineActionButton, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
  objc_storeStrong((id *)&self->_importantTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryContentSummaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryContentSummaryLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextElement, 0);
  objc_storeStrong((id *)&self->_primarySubtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);

  objc_storeStrong((id *)&self->_crossfadingContentView, 0);
}

@end