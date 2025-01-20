@interface NCDigestMosaicFeaturedNotificationContentView
- (BOOL)_isAXSize;
- (BOOL)_isContentViewStyleLarge;
- (BOOL)_isContentViewStyleMedium;
- (BOOL)_isContentViewStyleSmall;
- (BOOL)screenCaptureProhibited;
- (CGRect)_labelSizingBoundsForRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCBadgedIconView)badgedIconView;
- (NSAttributedString)secondaryText;
- (NSString)footerText;
- (NSString)primarySubtitleText;
- (NSString)primaryText;
- (NSString)sectionIdentifier;
- (UIImage)thumbnail;
- (double)_imageHeightForBounds:(CGRect)a3;
- (double)horizontalMarginForContentOverlap;
- (double)imageAttachmentSizeRatio;
- (unint64_t)_maximumNumberOfLinesForFooterText;
- (unint64_t)_maximumNumberOfLinesForPrimarySubtitleText;
- (unint64_t)_maximumNumberOfLinesForPrimaryText;
- (unint64_t)_maximumNumberOfLinesForSecondaryText;
- (unint64_t)_numberOfLinesForFooterTextInFrame:(CGRect)a3;
- (unint64_t)_numberOfLinesForPrimarySubtitleTextInFrame:(CGRect)a3;
- (unint64_t)_numberOfLinesForPrimaryTextInFrame:(CGRect)a3;
- (unint64_t)_numberOfLinesForSecondaryTextInFrame:(CGRect)a3;
- (unint64_t)contentViewStyle;
- (unint64_t)secondaryTextMaximumNumberOfLines;
- (void)_configureBackgroundColorViewIfNecessary;
- (void)_configureBackgroundViewIfNecessary;
- (void)_configureClippingViewIfNecessary;
- (void)_configureCrossfadingContentViewIfNecessary;
- (void)_configureImageBoundingViewIfNecessary;
- (void)_layoutBackgroundView;
- (void)_layoutFooterTextLabel;
- (void)_layoutIconImageView;
- (void)_layoutImageBoundingView;
- (void)_layoutPrimarySubtitleTextLabel;
- (void)_layoutPrimaryTextLabel;
- (void)_layoutSecondaryTextLabel;
- (void)_layoutSubviews;
- (void)_layoutThumbnailImageView;
- (void)_updateBackgroundColorForIconImageDominantColor:(id)a3;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForFooterTextLabel;
- (void)_updateTextAttributesForPrimarySubtitleTextLabel;
- (void)_updateTextAttributesForPrimaryTextLabel;
- (void)_updateTextAttributesForSecondaryTextElement;
- (void)_updateVisualStylingProviderForBackgroundColorView;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)layoutSubviews;
- (void)setBadgedIconView:(id)a3;
- (void)setContentViewStyle:(unint64_t)a3;
- (void)setFooterText:(id)a3;
- (void)setHorizontalMarginForContentOverlap:(double)a3;
- (void)setPrimarySubtitleText:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextMaximumNumberOfLines:(unint64_t)a3;
- (void)setSectionIdentifier:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation NCDigestMosaicFeaturedNotificationContentView

- (void)setContentViewStyle:(unint64_t)a3
{
  if (self->_contentViewStyle != a3)
  {
    self->_contentViewStyle = a3;
    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
  }
}

- (void)setHorizontalMarginForContentOverlap:(double)a3
{
  self->_horizontalMarginForContentOverlap = a3;
  [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
}

- (double)imageAttachmentSizeRatio
{
  if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
    return 0.6;
  }
  BOOL v4 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
  double result = 0.666666667;
  if (!v4) {
    return 1.0;
  }
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCDigestMosaicFeaturedNotificationContentView;
  [(NCDigestMosaicFeaturedNotificationContentView *)&v3 layoutSubviews];
  [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
  if (CGRectGetWidth(v4) > 0.0)
  {
    [(NCDigestMosaicFeaturedNotificationContentView *)self _layoutSubviews];
    if (self->_hasUpdatedContent)
    {
      [(UIView *)self->_crossfadingContentView pl_performCrossFadeIfNecessary];
      self->_hasUpdatedContent = 0;
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  thumbnailImageView = self->_thumbnailImageView;
  if (self->_imageBoundingView)
  {
    if (thumbnailImageView)
    {
      -[NCDigestMosaicFeaturedNotificationContentView _imageHeightForBounds:](self, "_imageHeightForBounds:", 0.0, 0.0, a3.width, a3.height);
      if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      }
    }
    else
    {
      if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      }
      if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      }
      if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      }
    }
  }
  -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:", 0.0, 0.0, width, height);
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  BOOL v15 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall]
     || [(NCDigestMosaicFeaturedNotificationContentView *)self _isAXSize];
  if (self->_primaryTextLabel
    && (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall]
     || !thumbnailImageView))
  {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", self->_primaryTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", v8, v10, v12, v14));
  }
  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (primarySubtitleTextLabel) {
    char v17 = v15;
  }
  else {
    char v17 = 1;
  }
  if ((v17 & 1) == 0) {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", primarySubtitleTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", v8, v10, v12, v14));
  }
  secondaryTextLabel = self->_secondaryTextLabel;
  if (secondaryTextLabel) {
    char v19 = v15;
  }
  else {
    char v19 = 1;
  }
  if ((v19 & 1) == 0)
  {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", secondaryTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", v8, v10, v12, v14));
    if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
      [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
    }
  }
  footerTextLabel = self->_footerTextLabel;
  if (footerTextLabel) {
    char v21 = v15;
  }
  else {
    char v21 = 1;
  }
  if ((v21 & 1) == 0) {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", footerTextLabel, -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", v8, v10, v12, v14));
  }
  if ((![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall]
     || !thumbnailImageView)
    && ![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
  {
    [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
  }

  UISizeRoundToScale();
  result.double height = v23;
  result.double width = v22;
  return result;
}

- (void)setBadgedIconView:(id)a3
{
  p_badgedIconView = &self->_badgedIconView;
  id v9 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    [(NCBadgedIconView *)*p_badgedIconView removeFromSuperview];
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView)
    {
      [(NCDigestMosaicFeaturedNotificationContentView *)self _configureImageBoundingViewIfNecessary];
      [(UIView *)self->_imageBoundingView addSubview:*p_badgedIconView];
      v6 = *p_badgedIconView;
    }
    else
    {
      v6 = 0;
    }
    double v7 = [(NCBadgedIconView *)v6 dominantColor];
    [(NCDigestMosaicFeaturedNotificationContentView *)self _updateBackgroundColorForIconImageDominantColor:v7];

    if ([v9 isFeaturingSymbol])
    {
      double v8 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
    }
    else
    {
      double v8 = 0;
    }
    [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:*p_badgedIconView style:0 visualStylingProvider:v8 outgoingProvider:v8];
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
  }
}

- (NSString)primaryText
{
  return [(UILabel *)self->_primaryTextLabel text];
}

- (void)setPrimaryText:(id)a3
{
  id v12 = a3;
  CGRect v4 = [(NCDigestMosaicFeaturedNotificationContentView *)self primaryText];
  char v5 = BSEqualStrings();

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    primaryTextLabel = self->_primaryTextLabel;
    if (v12)
    {
      if (!primaryTextLabel)
      {
        double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        id v9 = self->_primaryTextLabel;
        self->_primaryTextLabel = v8;

        [(UILabel *)self->_primaryTextLabel setLineBreakMode:4];
        if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall]) {
          [(UILabel *)self->_primaryTextLabel setAdjustsFontSizeToFitWidth:1];
        }
        [(NCDigestMosaicFeaturedNotificationContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_primaryTextLabel];
        double v10 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_primaryTextLabel style:[(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall] ^ 1 visualStylingProvider:v10 outgoingProvider:0];
      }
      [(NCDigestMosaicFeaturedNotificationContentView *)self _updateTextAttributesForPrimaryTextLabel];
      [(UILabel *)self->_primaryTextLabel setText:v12];
    }
    else
    {
      [(UILabel *)primaryTextLabel removeFromSuperview];
      double v11 = self->_primaryTextLabel;
      self->_primaryTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
    v6 = v12;
  }
}

- (NSString)primarySubtitleText
{
  return [(UILabel *)self->_primarySubtitleTextLabel text];
}

- (void)setPrimarySubtitleText:(id)a3
{
  id v12 = a3;
  CGRect v4 = [(NCDigestMosaicFeaturedNotificationContentView *)self primarySubtitleText];
  char v5 = BSEqualStrings();

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    if (v12)
    {
      if (!primarySubtitleTextLabel)
      {
        double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        id v9 = self->_primarySubtitleTextLabel;
        self->_primarySubtitleTextLabel = v8;

        [(UILabel *)self->_primarySubtitleTextLabel setLineBreakMode:4];
        [(NCDigestMosaicFeaturedNotificationContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_primarySubtitleTextLabel];
        double v10 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_primarySubtitleTextLabel style:1 visualStylingProvider:v10 outgoingProvider:0];
      }
      [(NCDigestMosaicFeaturedNotificationContentView *)self _updateTextAttributesForPrimarySubtitleTextLabel];
      [(UILabel *)self->_primarySubtitleTextLabel setText:v12];
    }
    else
    {
      [(UILabel *)primarySubtitleTextLabel removeFromSuperview];
      double v11 = self->_primarySubtitleTextLabel;
      self->_primarySubtitleTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
    v6 = v12;
  }
}

- (NSAttributedString)secondaryText
{
  return [(UILabel *)self->_secondaryTextLabel attributedText];
}

- (void)setSecondaryText:(id)a3
{
  id v12 = a3;
  CGRect v4 = [(NCDigestMosaicFeaturedNotificationContentView *)self secondaryText];
  char v5 = BSEqualObjects();

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    secondaryTextLabel = self->_secondaryTextLabel;
    if (v12)
    {
      if (!secondaryTextLabel)
      {
        double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        id v9 = self->_secondaryTextLabel;
        self->_secondaryTextLabel = v8;

        [(UILabel *)self->_secondaryTextLabel _setTextAlignmentFollowsWritingDirection:1];
        [(UILabel *)self->_secondaryTextLabel setLineBreakMode:4];
        [(NCDigestMosaicFeaturedNotificationContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_secondaryTextLabel];
        double v10 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_secondaryTextLabel style:0 visualStylingProvider:v10 outgoingProvider:0];

        secondaryTextLabel = self->_secondaryTextLabel;
      }
      double v11 = [(UILabel *)secondaryTextLabel textColor];
      [(UILabel *)self->_secondaryTextLabel setAttributedText:v12];
      [(UILabel *)self->_secondaryTextLabel setTextColor:v11];
      [(NCDigestMosaicFeaturedNotificationContentView *)self _updateTextAttributesForSecondaryTextElement];
    }
    else
    {
      [(UILabel *)secondaryTextLabel removeFromSuperview];
      double v11 = self->_secondaryTextLabel;
      self->_secondaryTextLabel = 0;
    }

    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
    v6 = v12;
  }
}

- (NSString)footerText
{
  return [(UILabel *)self->_footerTextLabel text];
}

- (void)setFooterText:(id)a3
{
  id v12 = a3;
  CGRect v4 = [(NCDigestMosaicFeaturedNotificationContentView *)self footerText];
  char v5 = BSEqualStrings();

  v6 = v12;
  if ((v5 & 1) == 0)
  {
    footerTextLabel = self->_footerTextLabel;
    if (v12)
    {
      if (!footerTextLabel)
      {
        double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        id v9 = self->_footerTextLabel;
        self->_footerTextLabel = v8;

        [(UILabel *)self->_footerTextLabel setLineBreakMode:4];
        [(NCDigestMosaicFeaturedNotificationContentView *)self addSubview:self->_footerTextLabel];
        double v10 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_footerTextLabel style:1 visualStylingProvider:v10 outgoingProvider:0];
      }
      [(NCDigestMosaicFeaturedNotificationContentView *)self _updateTextAttributesForFooterTextLabel];
      [(UILabel *)self->_footerTextLabel setText:v12];
    }
    else
    {
      [(UILabel *)footerTextLabel removeFromSuperview];
      double v11 = self->_footerTextLabel;
      self->_footerTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
    v6 = v12;
  }
}

- (void)setSecondaryTextMaximumNumberOfLines:(unint64_t)a3
{
  if (self->_secondaryTextMaximumNumberOfLines != a3)
  {
    self->_secondaryTextMaximumNumberOfLines = a3;
    CGRect v4 = [(NCDigestMosaicFeaturedNotificationContentView *)self secondaryText];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      self->_hasUpdatedContent = 1;
      [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
    }
  }
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCDigestMosaicFeaturedNotificationContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
  }
}

- (UIImage)thumbnail
{
  return [(UIImageView *)self->_thumbnailImageView image];
}

- (void)setThumbnail:(id)a3
{
  id v11 = a3;
  CGRect v4 = [(NCDigestMosaicFeaturedNotificationContentView *)self thumbnail];
  char v5 = BSEqualObjects();

  id v6 = v11;
  if ((v5 & 1) == 0)
  {
    thumbnailImageView = self->_thumbnailImageView;
    if (v11)
    {
      if (!thumbnailImageView)
      {
        double v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        id v9 = self->_thumbnailImageView;
        self->_thumbnailImageView = v8;

        [(UIImageView *)self->_thumbnailImageView setContentMode:2];
        [(NCDigestMosaicFeaturedNotificationContentView *)self _configureImageBoundingViewIfNecessary];
        [(UIView *)self->_imageBoundingView addSubview:self->_thumbnailImageView];
        id v6 = v11;
        thumbnailImageView = self->_thumbnailImageView;
      }
      [(UIImageView *)thumbnailImageView setImage:v6];
      double v10 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
      [(NCNotificationListBaseContentView *)self _updateVisualStylingOfImageView:self->_thumbnailImageView ifSymbolImageWithStyle:0 visualStylingProvider:v10 outgoingProvider:v10];
    }
    else
    {
      [(UIImageView *)thumbnailImageView removeFromSuperview];
      double v10 = self->_thumbnailImageView;
      self->_thumbnailImageView = 0;
    }

    [(NCDigestMosaicFeaturedNotificationContentView *)self _updateTextAttributes];
    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (void)_layoutSubviews
{
  [(NCDigestMosaicFeaturedNotificationContentView *)self _layoutImageBoundingView];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _layoutThumbnailImageView];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _layoutIconImageView];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _layoutBackgroundView];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _layoutPrimaryTextLabel];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _layoutPrimarySubtitleTextLabel];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _layoutSecondaryTextLabel];

  [(NCDigestMosaicFeaturedNotificationContentView *)self _layoutFooterTextLabel];
}

- (void)_layoutImageBoundingView
{
  imageBoundingView = self->_imageBoundingView;
  if (imageBoundingView)
  {
    [(UIView *)imageBoundingView frame];
    [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
    CGFloat v8 = v4;
    CGFloat v9 = v5;
    CGFloat v10 = v6;
    CGFloat v11 = v7;
    if (self->_thumbnailImageView)
    {
      -[NCDigestMosaicFeaturedNotificationContentView _imageHeightForBounds:](self, "_imageHeightForBounds:", v4, v5, v6, v7);
    }
    else
    {
      if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      }
      if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      }
      if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      }
    }
    v14.origin.x = v8;
    v14.origin.y = v9;
    v14.size.double width = v10;
    v14.size.double height = v11;
    CGRectGetWidth(v14);
    UIRectIntegralWithScale();
    id v12 = self->_imageBoundingView;
    -[UIView setFrame:](v12, "setFrame:");
  }
}

- (void)_layoutThumbnailImageView
{
  thumbnailImageView = self->_thumbnailImageView;
  if (thumbnailImageView)
  {
    [(UIImageView *)thumbnailImageView frame];
    [(UIView *)self->_imageBoundingView bounds];
    double v4 = self->_thumbnailImageView;
    -[UIImageView setFrame:](v4, "setFrame:");
  }
}

- (void)_layoutIconImageView
{
  if (self->_badgedIconView)
  {
    -[UIView bringSubviewToFront:](self->_imageBoundingView, "bringSubviewToFront:");
    [(NCBadgedIconView *)self->_badgedIconView frame];
    if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
      [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
    }
    if ([(NCDigestMosaicFeaturedNotificationContentView *)self _shouldReverseLayoutDirection])
    {
      [(UIView *)self->_imageBoundingView bounds];
      CGRectGetWidth(v5);
      if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      }
    }
    if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
      [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
    }
    if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
      [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
    }
    UIRectIntegralWithScale();
    badgedIconView = self->_badgedIconView;
    -[NCBadgedIconView setFrame:](badgedIconView, "setFrame:");
  }
}

- (void)_layoutBackgroundView
{
  backgroundView = self->_backgroundView;
  if (backgroundView)
  {
    [(UIView *)backgroundView frame];
    [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    if (self->_thumbnailImageView)
    {
      [(UIView *)self->_imageBoundingView frame];
      CGRectGetMaxY(v15);
    }
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.double width = v9;
    v16.size.double height = v11;
    CGRectGetWidth(v16);
    thumbnailImageView = self->_thumbnailImageView;
    v17.origin.x = v5;
    v17.origin.y = v7;
    v17.size.double width = v9;
    v17.size.double height = v11;
    CGRectGetHeight(v17);
    if (thumbnailImageView)
    {
      [(UIView *)self->_imageBoundingView frame];
      CGRectGetMaxY(v18);
    }
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_backgroundView, "setFrame:");
    backgroundGradientLayer = self->_backgroundGradientLayer;
    [(UIView *)self->_backgroundView bounds];
    -[CAGradientLayer setFrame:](backgroundGradientLayer, "setFrame:");
  }
}

- (void)_layoutPrimaryTextLabel
{
  primaryTextLabel = self->_primaryTextLabel;
  if (primaryTextLabel)
  {
    [(UILabel *)primaryTextLabel frame];
    if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall]
      && (self->_thumbnailImageView || [(NCDigestMosaicFeaturedNotificationContentView *)self _isAXSize]))
    {
      double v4 = *MEMORY[0x1E4F1DB28];
      double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
      CGFloat v9 = v8;
      CGFloat v39 = v11;
      CGFloat v40 = v10;
      CGFloat rect = v12;
      -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
      double x = v42.origin.x;
      double y = v42.origin.y;
      double width = v42.size.width;
      double height = v42.size.height;
      double v17 = CGRectGetWidth(v42);
      double v35 = height;
      -[UILabel unui_measuringHeightWithNumberOfLines:](self->_primaryTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", x, y, width, height));
      double v36 = v18;
      [(UIView *)self->_imageBoundingView frame];
      double MaxY = CGRectGetMaxY(v43);
      if (self->_thumbnailImageView)
      {
        double v20 = 8.0;
        if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
        {
          if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium])
          {
            double v20 = 6.0;
          }
          else
          {
            double v20 = 4.0;
          }
        }
      }
      else
      {
        double v20 = 0.0;
      }
      CGFloat v37 = v9;
      if ([(NCDigestMosaicFeaturedNotificationContentView *)self _shouldReverseLayoutDirection])
      {
        v44.origin.double x = v9;
        v44.size.double width = v39;
        v44.origin.double y = v40;
        v44.size.double height = rect;
        double v21 = CGRectGetMaxX(v44) - v17;
        BOOL v22 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge];
        double v23 = 12.0;
        if (!v22)
        {
          [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
          double v23 = 10.0;
        }
        double v24 = v21 - v23;
      }
      else
      {
        double v24 = 12.0;
        if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
        {
          [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
          double v24 = 10.0;
        }
      }
      double v25 = MaxY + v20;
      v26 = [(NCBadgedIconView *)self->_badgedIconView superview];
      if (v26 == self)
      {
        [(NCBadgedIconView *)self->_badgedIconView frame];
        UIRectCenteredYInRect();
        double v24 = v30;
        CGFloat v27 = v31;
        CGFloat v28 = v32;
        CGFloat v29 = v33;
      }
      else
      {
        CGFloat v27 = v25;
        CGFloat v28 = v17;
        CGFloat v29 = v36;
      }

      -[UILabel unui_drawingHeightWithNumberOfLines:](self->_primaryTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", x, y, width, v35));
      v45.origin.double x = v37;
      v45.size.double height = rect;
      v45.size.double width = v39;
      v45.origin.double y = v40;
      CGRectGetHeight(v45);
      v46.origin.double x = v24;
      v46.origin.double y = v27;
      v46.size.double width = v28;
      v46.size.double height = v29;
      CGRectGetWidth(v46);
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
    }
    v34 = self->_primaryTextLabel;
    -[UILabel setFrame:](v34, "setFrame:", v4, v5, v6, v7);
  }
}

- (void)_layoutPrimarySubtitleTextLabel
{
  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (primarySubtitleTextLabel)
  {
    [(UILabel *)primarySubtitleTextLabel frame];
    if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall]
      || [(NCDigestMosaicFeaturedNotificationContentView *)self _isAXSize])
    {
      double v4 = *MEMORY[0x1E4F1DB28];
      double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      double v13 = v12;
      CGFloat v33 = v14;
      -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
      double x = v37.origin.x;
      double y = v37.origin.y;
      double width = v37.size.width;
      double height = v37.size.height;
      double v19 = CGRectGetWidth(v37);
      -[UILabel unui_measuringHeightWithNumberOfLines:](self->_primarySubtitleTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", x, y, width, height));
      primaryTextLabel = self->_primaryTextLabel;
      CGFloat v34 = v13;
      CGFloat v35 = v21;
      if (primaryTextLabel)
      {
        [(UILabel *)primaryTextLabel frame];
        double v22 = CGRectGetMaxY(v38) + 1.0;
      }
      else
      {
        imageBoundingView = self->_imageBoundingView;
        if (imageBoundingView)
        {
          [(UIView *)imageBoundingView frame];
          double MaxY = CGRectGetMaxY(v39);
          if (self->_thumbnailImageView)
          {
            BOOL v25 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge];
            double v26 = 8.0;
            if (!v25)
            {
              BOOL v27 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
              double v26 = 4.0;
              if (v27) {
                double v26 = 6.0;
              }
            }
          }
          else
          {
            double v26 = 0.0;
          }
          double v22 = MaxY + v26;
        }
        else
        {
          double v22 = 0.0;
        }
      }
      if ([(NCDigestMosaicFeaturedNotificationContentView *)self _shouldReverseLayoutDirection])
      {
        v40.origin.double x = v9;
        v40.origin.double y = v11;
        v40.size.double height = v33;
        v40.size.double width = v34;
        double v28 = CGRectGetMaxX(v40) - v19;
        BOOL v29 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge];
        double v30 = 12.0;
        if (!v29)
        {
          [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
          double v30 = 10.0;
        }
        double v31 = v28 - v30;
      }
      else
      {
        double v31 = 12.0;
        if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
        {
          [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
          double v31 = 10.0;
        }
      }
      -[UILabel unui_drawingHeightWithNumberOfLines:](self->_primarySubtitleTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", x, y, width, height));
      v41.origin.double x = v31;
      v41.origin.double y = v22;
      v41.size.double width = v19;
      v41.size.double height = v35;
      CGRectGetWidth(v41);
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
    }
    double v32 = self->_primarySubtitleTextLabel;
    -[UILabel setFrame:](v32, "setFrame:", v4, v5, v6, v7);
  }
}

- (void)_layoutSecondaryTextLabel
{
  secondaryTextLabel = self->_secondaryTextLabel;
  if (!secondaryTextLabel) {
    return;
  }
  [(UILabel *)secondaryTextLabel frame];
  if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall]
    && ![(NCDigestMosaicFeaturedNotificationContentView *)self _isAXSize])
  {
    [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    double v13 = v12;
    CGFloat v35 = v14;
    -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
    double v19 = CGRectGetWidth(v39);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_secondaryTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", x, y, width, height));
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    CGFloat v36 = v13;
    CGFloat v37 = v21;
    if (primarySubtitleTextLabel || (primarySubtitleTextLabel = self->_primaryTextLabel) != 0)
    {
      [(UILabel *)primarySubtitleTextLabel frame];
      double MaxY = CGRectGetMaxY(v40);
      BOOL v23 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge];
      double v24 = 6.0;
      if (!v23)
      {
        BOOL v25 = ![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
        double v24 = 1.0;
        double v26 = 2.0;
        goto LABEL_10;
      }
    }
    else
    {
      imageBoundingView = self->_imageBoundingView;
      if (!imageBoundingView)
      {
        double v27 = 0.0;
        goto LABEL_13;
      }
      [(UIView *)imageBoundingView frame];
      double MaxY = CGRectGetMaxY(v43);
      if (self->_thumbnailImageView)
      {
        BOOL v34 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge];
        double v24 = 8.0;
        if (!v34)
        {
          BOOL v25 = ![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
          double v24 = 4.0;
          double v26 = 6.0;
LABEL_10:
          if (!v25) {
            double v24 = v26;
          }
        }
      }
      else
      {
        double v24 = 0.0;
      }
    }
    double v27 = MaxY + v24;
LABEL_13:
    if ([(NCDigestMosaicFeaturedNotificationContentView *)self _shouldReverseLayoutDirection])
    {
      v41.origin.double x = v9;
      v41.origin.double y = v11;
      v41.size.double height = v35;
      v41.size.double width = v36;
      double v28 = CGRectGetMaxX(v41) - v19;
      BOOL v29 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge];
      double v30 = 12.0;
      if (!v29)
      {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
        double v30 = 10.0;
      }
      double v31 = v28 - v30;
    }
    else
    {
      double v31 = 12.0;
      if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
      {
        [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
        double v31 = 10.0;
      }
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_secondaryTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", x, y, width, height));
    v42.origin.double x = v31;
    v42.origin.double y = v27;
    v42.size.double width = v19;
    v42.size.double height = v37;
    CGRectGetWidth(v42);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    goto LABEL_20;
  }
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
LABEL_20:
  double v32 = self->_secondaryTextLabel;

  -[UILabel setFrame:](v32, "setFrame:", v4, v5, v6, v7);
}

- (void)_layoutFooterTextLabel
{
  footerTextLabel = self->_footerTextLabel;
  if (footerTextLabel)
  {
    [(UILabel *)footerTextLabel frame];
    if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall]
      || [(NCDigestMosaicFeaturedNotificationContentView *)self _isAXSize])
    {
      double v4 = *MEMORY[0x1E4F1DB28];
      double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
    else
    {
      [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
      CGFloat v9 = v8;
      CGFloat v11 = v10;
      CGFloat v13 = v12;
      CGFloat rect = v14;
      -[NCDigestMosaicFeaturedNotificationContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
      double x = v31.origin.x;
      double y = v31.origin.y;
      double width = v31.size.width;
      double height = v31.size.height;
      double v19 = CGRectGetWidth(v31);
      -[UILabel unui_measuringHeightWithNumberOfLines:](self->_footerTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", x, y, width, height));
      CGFloat v29 = v20;
      [(UILabel *)self->_secondaryTextLabel frame];
      CGFloat MaxY = CGRectGetMaxY(v32);
      if ([(NCDigestMosaicFeaturedNotificationContentView *)self _shouldReverseLayoutDirection])
      {
        v33.origin.double x = v9;
        v33.origin.double y = rect;
        v33.size.double width = v11;
        v33.size.double height = v13;
        double v21 = CGRectGetMaxX(v33) - v19;
        BOOL v22 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge];
        double v23 = 12.0;
        CGFloat v24 = v19;
        if (!v22)
        {
          [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
          double v23 = 10.0;
        }
        double v25 = v21 - v23;
      }
      else
      {
        double v25 = 12.0;
        CGFloat v24 = v19;
        if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
        {
          [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
          double v25 = 10.0;
        }
      }
      -[UILabel unui_drawingHeightWithNumberOfLines:](self->_footerTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCDigestMosaicFeaturedNotificationContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", x, y, width, height));
      v34.origin.double x = v25;
      v34.origin.double y = MaxY;
      v34.size.double width = v24;
      v34.size.double height = v29;
      CGRectGetWidth(v34);
      BSRectWithSize();
      UIRectCenteredIntegralRectScale();
    }
    double v26 = self->_footerTextLabel;
    -[UILabel setFrame:](v26, "setFrame:", v4, v5, v6, v7);
  }
}

- (void)_configureClippingViewIfNecessary
{
  if (!self->_clippingView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    clippingView = self->_clippingView;
    self->_clippingView = v4;

    [(UIView *)self->_clippingView setAutoresizingMask:18];
    [(UIView *)self->_clippingView setClipsToBounds:1];
    double v6 = self->_clippingView;
    BOOL v7 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge];
    double v8 = 18.0;
    if (!v7)
    {
      [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      double v8 = 15.0;
    }
    [(UIView *)v6 _setContinuousCornerRadius:v8];
    [(NCDigestMosaicFeaturedNotificationContentView *)self addSubview:self->_clippingView];
    CGFloat v9 = self->_clippingView;
    [(NCDigestMosaicFeaturedNotificationContentView *)self sendSubviewToBack:v9];
  }
}

- (void)_configureImageBoundingViewIfNecessary
{
  if (!self->_imageBoundingView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    imageBoundingView = self->_imageBoundingView;
    self->_imageBoundingView = v4;

    [(UIView *)self->_imageBoundingView setClipsToBounds:1];
    [(NCDigestMosaicFeaturedNotificationContentView *)self _configureCrossfadingContentViewIfNecessary];
    crossfadingContentView = self->_crossfadingContentView;
    BOOL v7 = self->_imageBoundingView;
    [(UIView *)crossfadingContentView addSubview:v7];
  }
}

- (void)_configureCrossfadingContentViewIfNecessary
{
  if (!self->_crossfadingContentView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    crossfadingContentView = self->_crossfadingContentView;
    self->_crossfadingContentView = v4;

    [(NCDigestMosaicFeaturedNotificationContentView *)self _configureClippingViewIfNecessary];
    [(UIView *)self->_clippingView addSubview:self->_crossfadingContentView];
    double v6 = self->_crossfadingContentView;
    [(UIView *)v6 setAutoresizingMask:18];
  }
}

- (void)_configureBackgroundViewIfNecessary
{
  if (!self->_backgroundView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    backgroundView = self->_backgroundView;
    self->_backgroundView = v4;

    double v6 = [MEMORY[0x1E4F39BD0] layer];
    backgroundGradientLayer = self->_backgroundGradientLayer;
    self->_backgroundGradientLayer = v6;

    [(CAGradientLayer *)self->_backgroundGradientLayer setType:*MEMORY[0x1E4F3A390]];
    -[CAGradientLayer setStartPoint:](self->_backgroundGradientLayer, "setStartPoint:", 0.5, 1.0);
    -[CAGradientLayer setEndPoint:](self->_backgroundGradientLayer, "setEndPoint:", 0.5, 0.0);
    double v8 = [(UIView *)self->_backgroundView layer];
    [v8 insertSublayer:self->_backgroundGradientLayer atIndex:0];

    [(NCDigestMosaicFeaturedNotificationContentView *)self _configureCrossfadingContentViewIfNecessary];
    [(UIView *)self->_crossfadingContentView addSubview:self->_backgroundView];
    crossfadingContentView = self->_crossfadingContentView;
    double v10 = self->_backgroundView;
    [(UIView *)crossfadingContentView sendSubviewToBack:v10];
  }
}

- (void)_configureBackgroundColorViewIfNecessary
{
  if (!self->_backgroundColorView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F743E0]);
    [(NCDigestMosaicFeaturedNotificationContentView *)self bounds];
    double v4 = (MTStylingProvidingSolidColorView *)objc_msgSend(v3, "initWithFrame:");
    backgroundColorView = self->_backgroundColorView;
    self->_backgroundColorView = v4;

    [(NCDigestMosaicFeaturedNotificationContentView *)self _configureClippingViewIfNecessary];
    [(UIView *)self->_clippingView addSubview:self->_backgroundColorView];
    [(UIView *)self->_clippingView sendSubviewToBack:self->_backgroundColorView];
    double v6 = self->_backgroundColorView;
    [(MTStylingProvidingSolidColorView *)v6 setAutoresizingMask:18];
  }
}

- (BOOL)_isAXSize
{
  v2 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (double)_imageHeightForBounds:(CGRect)a3
{
  CGRectGetWidth(a3);
  if (![(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge]) {
    [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
  }

  UICeilToScale();
  return result;
}

- (BOOL)_isContentViewStyleLarge
{
  return [(NCDigestMosaicFeaturedNotificationContentView *)self contentViewStyle] == 2;
}

- (BOOL)_isContentViewStyleMedium
{
  return [(NCDigestMosaicFeaturedNotificationContentView *)self contentViewStyle] == 0;
}

- (BOOL)_isContentViewStyleSmall
{
  return [(NCDigestMosaicFeaturedNotificationContentView *)self contentViewStyle] == 1;
}

- (CGRect)_labelSizingBoundsForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v8 = CGRectGetWidth(a3);
  BOOL v9 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge];
  double v10 = 12.0;
  if (!v9)
  {
    [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
    double v10 = 10.0;
  }
  double v11 = v8 + v10 * -2.0;
  [(NCDigestMosaicFeaturedNotificationContentView *)self horizontalMarginForContentOverlap];
  double v13 = v11 - v12;
  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  double v14 = CGRectGetHeight(v18);
  double v15 = 0.0;
  double v16 = 0.0;
  double v17 = v13;
  result.size.CGFloat height = v14;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

- (void)_updateBackgroundColorForIconImageDominantColor:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NCDigestMosaicFeaturedNotificationContentView *)self _configureBackgroundViewIfNecessary];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _configureBackgroundColorViewIfNecessary];
  double v5 = [(NCDigestMosaicFeaturedNotificationContentView *)self sectionIdentifier];
  double v6 = _NCNotificationBackgroundColorForSectionIdentifier(v5);

  if (v6) {
    BOOL v7 = v6;
  }
  else {
    BOOL v7 = v4;
  }
  id v8 = v7;

  if (!v8)
  {
    id v8 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  }
  double v17 = 0.0;
  double v18 = 0.0;
  double v15 = 0.0;
  double v16 = 0.0;
  [v8 getHue:&v18 saturation:&v17 brightness:&v16 alpha:&v15];
  BOOL v9 = [MEMORY[0x1E4FB1618] colorWithHue:v18 saturation:v17 brightness:v16 + dbl_1D7D95D00[v16 > 0.95] alpha:v15];
  backgroundGradientLayer = self->_backgroundGradientLayer;
  double v11 = (UIColor *)v8;
  v19[0] = [(UIColor *)v11 CGColor];
  id v12 = v9;
  v19[1] = [v12 CGColor];
  double v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  [(CAGradientLayer *)backgroundGradientLayer setColors:v13];

  [(MTStylingProvidingSolidColorView *)self->_backgroundColorView setBackgroundColor:v11];
  backgroundColor = self->_backgroundColor;
  self->_backgroundColor = v11;

  [(NCDigestMosaicFeaturedNotificationContentView *)self _updateVisualStylingProviderForBackgroundColorView];
}

- (void)_updateVisualStylingProviderForBackgroundColorView
{
  backgroundColorView = self->_backgroundColorView;
  if (backgroundColorView)
  {
    id v4 = [(MTStylingProvidingSolidColorView *)backgroundColorView visualStylingProviderForCategory:1];
    [(NCNotificationListBaseContentView *)self setVisualStylingProvider:v4 forCategory:1];
  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  badgedIconView = self->_badgedIconView;
  id v8 = a5;
  id v12 = a3;
  if ([(NCBadgedIconView *)badgedIconView isFeaturingSymbol]) {
    BOOL v9 = v12;
  }
  else {
    BOOL v9 = 0;
  }
  double v10 = self->_badgedIconView;
  id v11 = v9;
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:v10 style:0 visualStylingProvider:v11 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfImageView:self->_thumbnailImageView ifSymbolImageWithStyle:0 visualStylingProvider:v12 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_primaryTextLabel style:[(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleSmall] ^ 1 visualStylingProvider:v12 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_primarySubtitleTextLabel style:1 visualStylingProvider:v12 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_secondaryTextLabel style:0 visualStylingProvider:v12 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_footerTextLabel style:1 visualStylingProvider:v12 outgoingProvider:v8];
}

- (unint64_t)_maximumNumberOfLinesForPrimaryText
{
  v2 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v2)) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (unint64_t)_numberOfLinesForPrimaryTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  primaryTextLabel = self->_primaryTextLabel;
  unint64_t v9 = [(NCDigestMosaicFeaturedNotificationContentView *)self _maximumNumberOfLinesForPrimaryText];

  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", primaryTextLabel, v9, x, y, width, height);
}

- (unint64_t)_maximumNumberOfLinesForPrimarySubtitleText
{
  v2 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  unint64_t v3 = !UIContentSizeCategoryIsAccessibilityCategory(v2);

  return v3;
}

- (unint64_t)_numberOfLinesForPrimarySubtitleTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  unint64_t v9 = [(NCDigestMosaicFeaturedNotificationContentView *)self _maximumNumberOfLinesForPrimarySubtitleText];

  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", primarySubtitleTextLabel, v9, x, y, width, height);
}

- (unint64_t)_maximumNumberOfLinesForSecondaryText
{
  unint64_t v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v3))
  {
    unint64_t v4 = 0;
  }
  else if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
  {
    if (self->_thumbnailImageView) {
      unint64_t v4 = 4;
    }
    else {
      unint64_t v4 = 5;
    }
  }
  else if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium])
  {
    unint64_t v4 = 5;
  }
  else
  {
    unint64_t v4 = 2;
  }

  return v4;
}

- (unint64_t)_numberOfLinesForSecondaryTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  secondaryTextLabel = self->_secondaryTextLabel;
  unint64_t v9 = [(NCDigestMosaicFeaturedNotificationContentView *)self _maximumNumberOfLinesForSecondaryText];

  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", secondaryTextLabel, v9, x, y, width, height);
}

- (unint64_t)_maximumNumberOfLinesForFooterText
{
  v2 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  unint64_t v3 = !UIContentSizeCategoryIsAccessibilityCategory(v2);

  return v3;
}

- (unint64_t)_numberOfLinesForFooterTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  footerTextLabel = self->_footerTextLabel;
  unint64_t v9 = [(NCDigestMosaicFeaturedNotificationContentView *)self _maximumNumberOfLinesForFooterText];

  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", footerTextLabel, v9, x, y, width, height);
}

- (void)_updateTextAttributes
{
  v3.receiver = self;
  v3.super_class = (Class)NCDigestMosaicFeaturedNotificationContentView;
  [(NCNotificationListBaseContentView *)&v3 _updateTextAttributes];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _updateTextAttributesForPrimaryTextLabel];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _updateTextAttributesForPrimarySubtitleTextLabel];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _updateTextAttributesForSecondaryTextElement];
  [(NCDigestMosaicFeaturedNotificationContentView *)self _updateTextAttributesForFooterTextLabel];
}

- (void)_updateTextAttributesForPrimaryTextLabel
{
  if (self->_primaryTextLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    {
      unint64_t v4 = (id *)MEMORY[0x1E4FB28C8];
    }
    else if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
    {
      unint64_t v4 = (id *)MEMORY[0x1E4FB28E0];
    }
    else
    {
      BOOL v5 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      unint64_t v4 = (id *)MEMORY[0x1E4FB28E0];
      if (!v5) {
        unint64_t v4 = (id *)MEMORY[0x1E4FB28D8];
      }
    }
    id v6 = *v4;

    primaryTextLabel = self->_primaryTextLabel;
    if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
    {
      id v8 = (double *)MEMORY[0x1E4FB09E0];
    }
    else
    {
      BOOL v9 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      id v8 = (double *)MEMORY[0x1E4FB09E0];
      if (!v9) {
        id v8 = (double *)MEMORY[0x1E4FB09D8];
      }
    }
    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:primaryTextLabel withTextStyle:v6 fontWeight:0 additionalTraits:[(NCDigestMosaicFeaturedNotificationContentView *)self _maximumNumberOfLinesForPrimaryText] maximumNumberOfLines:*v8];

    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForPrimarySubtitleTextLabel
{
  if (self->_primarySubtitleTextLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    {
      unint64_t v4 = (id *)MEMORY[0x1E4FB28C8];
    }
    else if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
    {
      unint64_t v4 = (id *)MEMORY[0x1E4FB28E0];
    }
    else
    {
      BOOL v5 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      unint64_t v4 = (id *)MEMORY[0x1E4FB28E0];
      if (!v5) {
        unint64_t v4 = (id *)MEMORY[0x1E4FB28D8];
      }
    }
    id v6 = *v4;

    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
    {
      id v8 = (double *)MEMORY[0x1E4FB09E0];
    }
    else
    {
      BOOL v9 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      id v8 = (double *)MEMORY[0x1E4FB09E0];
      if (!v9) {
        id v8 = (double *)MEMORY[0x1E4FB09D8];
      }
    }
    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:primarySubtitleTextLabel withTextStyle:v6 fontWeight:0 additionalTraits:[(NCDigestMosaicFeaturedNotificationContentView *)self _maximumNumberOfLinesForPrimarySubtitleText] maximumNumberOfLines:*v8];

    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForSecondaryTextElement
{
  if (self->_secondaryTextLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    if (UIContentSizeCategoryIsAccessibilityCategory(v3))
    {
      unint64_t v4 = (id *)MEMORY[0x1E4FB28C8];
    }
    else if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
    {
      unint64_t v4 = (id *)MEMORY[0x1E4FB28D0];
    }
    else
    {
      [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      unint64_t v4 = (id *)MEMORY[0x1E4FB28D8];
    }
    id v5 = *v4;

    secondaryTextLabel = self->_secondaryTextLabel;
    if ([(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleLarge])
    {
      BOOL v7 = (double *)MEMORY[0x1E4FB09E0];
    }
    else
    {
      BOOL v8 = [(NCDigestMosaicFeaturedNotificationContentView *)self _isContentViewStyleMedium];
      BOOL v7 = (double *)MEMORY[0x1E4FB09E0];
      if (!v8) {
        BOOL v7 = (double *)MEMORY[0x1E4FB09D8];
      }
    }
    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:secondaryTextLabel withTextStyle:v5 fontWeight:0 additionalTraits:[(NCDigestMosaicFeaturedNotificationContentView *)self _maximumNumberOfLinesForSecondaryText] maximumNumberOfLines:*v7];

    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForFooterTextLabel
{
  if (self->_footerTextLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);
    id v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      id v5 = (id *)MEMORY[0x1E4FB28F0];
    }
    id v6 = *v5;

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:self->_footerTextLabel withTextStyle:v6 fontWeight:0 additionalTraits:[(NCDigestMosaicFeaturedNotificationContentView *)self _maximumNumberOfLinesForFooterText] maximumNumberOfLines:*MEMORY[0x1E4FB09D8]];
    self->_hasUpdatedContent = 1;
    [(NCDigestMosaicFeaturedNotificationContentView *)self setNeedsLayout];
  }
}

- (NCBadgedIconView)badgedIconView
{
  return self->_badgedIconView;
}

- (unint64_t)secondaryTextMaximumNumberOfLines
{
  return self->_secondaryTextMaximumNumberOfLines;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (unint64_t)contentViewStyle
{
  return self->_contentViewStyle;
}

- (double)horizontalMarginForContentOverlap
{
  return self->_horizontalMarginForContentOverlap;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (void)setSectionIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundColorView, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundGradientLayer, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_imageBoundingView, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_primarySubtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
  objc_storeStrong((id *)&self->_crossfadingContentView, 0);

  objc_storeStrong((id *)&self->_clippingView, 0);
}

@end