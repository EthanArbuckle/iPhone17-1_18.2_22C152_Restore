@interface NCNotificationRichContentView
- (BOOL)_isAXSize;
- (BOOL)hideDate;
- (BOOL)isAttachmentImageFeatured;
- (BOOL)isDateAllDay;
- (BOOL)screenCaptureProhibited;
- (CGRect)_labelSizingBoundsForRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCBadgedIconView)badgedIconView;
- (NCNotificationRichContentView)initWithFrame:(CGRect)a3;
- (NSAttributedString)secondaryText;
- (NSDate)date;
- (NSString)footerText;
- (NSString)primarySubtitleText;
- (NSString)primaryText;
- (NSTimeZone)timeZone;
- (UIImage)thumbnail;
- (double)_featuredImageHeightForBounds:(CGRect)a3;
- (double)_labelLayoutHorizontalMargin;
- (double)dateAlpha;
- (id)_dateLabelPreferredFont;
- (int64_t)_dateFormatStyleForDate:(id)a3;
- (int64_t)dateFormatStyle;
- (unint64_t)_maximumNumberOfLinesForFooterText;
- (unint64_t)_maximumNumberOfLinesForPrimarySubtitleText;
- (unint64_t)_maximumNumberOfLinesForPrimaryText;
- (unint64_t)_maximumNumberOfLinesForSecondaryText;
- (unint64_t)_numberOfLinesForFooterTextInFrame:(CGRect)a3;
- (unint64_t)_numberOfLinesForPrimarySubtitleTextInFrame:(CGRect)a3;
- (unint64_t)_numberOfLinesForPrimaryTextInFrame:(CGRect)a3;
- (unint64_t)_numberOfLinesForSecondaryTextInFrame:(CGRect)a3;
- (unint64_t)secondaryTextMaximumNumberOfLines;
- (void)_configureCrossfadingContentViewIfNecessary;
- (void)_configureDateLabel;
- (void)_configureDateLabelIfNecessary;
- (void)_layoutBadgedIconView;
- (void)_layoutDateLabel;
- (void)_layoutFooterTextLabel;
- (void)_layoutImageBoundingView;
- (void)_layoutPrimarySubtitleTextLabel;
- (void)_layoutPrimaryTextLabel;
- (void)_layoutSecondaryTextLabel;
- (void)_layoutSubviews;
- (void)_layoutThumbnailImageView;
- (void)_recycleDateLabel;
- (void)_tearDownDateLabel;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForDateLabel;
- (void)_updateTextAttributesForFooterTextLabel;
- (void)_updateTextAttributesForPrimarySubtitleTextLabel;
- (void)_updateTextAttributesForPrimaryTextLabel;
- (void)_updateTextAttributesForSecondaryTextElement;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)dateLabelDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setAttachmentImageFeatured:(BOOL)a3;
- (void)setBadgedIconView:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateAllDay:(BOOL)a3;
- (void)setDateAlpha:(double)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setFooterText:(id)a3;
- (void)setHideDate:(BOOL)a3;
- (void)setPrimarySubtitleText:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSecondaryTextMaximumNumberOfLines:(unint64_t)a3;
- (void)setThumbnail:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation NCNotificationRichContentView

- (NCNotificationRichContentView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationRichContentView;
  v3 = -[NCNotificationListBaseContentView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_attachmentImageFeatured = 0;
    v3->_dateAlpha = 1.0;
    [(NCNotificationRichContentView *)v3 _setContinuousCornerRadius:23.5];
  }
  return v4;
}

- (void)setAttachmentImageFeatured:(BOOL)a3
{
  if (self->_attachmentImageFeatured != a3)
  {
    self->_attachmentImageFeatured = a3;
    -[NCNotificationRichContentView setClipsToBounds:](self, "setClipsToBounds:");
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationRichContentView;
  [(NCNotificationRichContentView *)&v3 layoutSubviews];
  [(NCNotificationRichContentView *)self bounds];
  if (CGRectGetWidth(v4) > 0.0)
  {
    [(NCNotificationRichContentView *)self _layoutSubviews];
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
  -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:", 0.0, 0.0, a3.width, a3.height);
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  primaryTextLabel = self->_primaryTextLabel;
  if (primaryTextLabel) {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", primaryTextLabel, -[NCNotificationRichContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", v6, v7, v8, v9));
  }
  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (primarySubtitleTextLabel) {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", primarySubtitleTextLabel, -[NCNotificationRichContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", v10, v11, v12, v13));
  }
  secondaryTextLabel = self->_secondaryTextLabel;
  if (secondaryTextLabel) {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", secondaryTextLabel, -[NCNotificationRichContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", v10, v11, v12, v13));
  }
  footerTextLabel = self->_footerTextLabel;
  if (footerTextLabel) {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", footerTextLabel, -[NCNotificationRichContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", v10, v11, v12, v13));
  }
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    -[NCNotificationListBaseContentView _sizeMeasuringHeightForLabel:withNumberOfLines:](self, "_sizeMeasuringHeightForLabel:withNumberOfLines:", dateLabel, 1, 0.0);
    [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
  }
  if (self->_badgedIconView)
  {
    if (![(NCNotificationRichContentView *)self isAttachmentImageFeatured])
    {
      [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
      if (![(NCNotificationRichContentView *)self isAttachmentImageFeatured])
      {
        [(NCNotificationRichContentView *)self badgedIconView];
      }
    }
  }
  if ([(NCNotificationRichContentView *)self isAttachmentImageFeatured]
    && self->_imageBoundingView
    && self->_thumbnailImageView)
  {
    -[NCNotificationRichContentView _featuredImageHeightForBounds:](self, "_featuredImageHeightForBounds:", 0.0, 0.0, width, height);
  }

  UISizeRoundToScale();
  result.double height = v20;
  result.double width = v19;
  return result;
}

- (NSString)primaryText
{
  return [(UILabel *)self->_primaryTextLabel text];
}

- (void)setPrimaryText:(id)a3
{
  id v13 = a3;
  CGRect v4 = [(NCNotificationRichContentView *)self primaryText];
  char v5 = BSEqualStrings();

  id v6 = v13;
  if ((v5 & 1) == 0)
  {
    primaryTextLabel = self->_primaryTextLabel;
    if (v13)
    {
      if (!primaryTextLabel)
      {
        double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        double v9 = self->_primaryTextLabel;
        self->_primaryTextLabel = v8;

        [(UILabel *)self->_primaryTextLabel setLineBreakMode:4];
        [(NCNotificationRichContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_primaryTextLabel];
        [(NCNotificationRichContentView *)self _updateTextAttributesForPrimaryTextLabel];
        double v10 = self->_primaryTextLabel;
        double v11 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:v10 style:0 visualStylingProvider:v11 outgoingProvider:0];

        id v6 = v13;
        primaryTextLabel = self->_primaryTextLabel;
      }
      [(UILabel *)primaryTextLabel setText:v6];
    }
    else
    {
      [(UILabel *)primaryTextLabel removeFromSuperview];
      double v12 = self->_primaryTextLabel;
      self->_primaryTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (NSString)primarySubtitleText
{
  return [(UILabel *)self->_primarySubtitleTextLabel text];
}

- (void)setPrimarySubtitleText:(id)a3
{
  id v13 = a3;
  CGRect v4 = [(NCNotificationRichContentView *)self primarySubtitleText];
  char v5 = BSEqualStrings();

  id v6 = v13;
  if ((v5 & 1) == 0)
  {
    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    if (v13)
    {
      if (!primarySubtitleTextLabel)
      {
        double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        double v9 = self->_primarySubtitleTextLabel;
        self->_primarySubtitleTextLabel = v8;

        [(UILabel *)self->_primarySubtitleTextLabel setLineBreakMode:4];
        [(NCNotificationRichContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_primarySubtitleTextLabel];
        [(NCNotificationRichContentView *)self _updateTextAttributesForPrimarySubtitleTextLabel];
        double v10 = self->_primarySubtitleTextLabel;
        double v11 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:v10 style:0 visualStylingProvider:v11 outgoingProvider:0];

        id v6 = v13;
        primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
      }
      [(UILabel *)primarySubtitleTextLabel setText:v6];
    }
    else
    {
      [(UILabel *)primarySubtitleTextLabel removeFromSuperview];
      double v12 = self->_primarySubtitleTextLabel;
      self->_primarySubtitleTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (NSAttributedString)secondaryText
{
  return [(UILabel *)self->_secondaryTextLabel attributedText];
}

- (void)setSecondaryText:(id)a3
{
  id v12 = a3;
  CGRect v4 = [(NCNotificationRichContentView *)self secondaryText];
  char v5 = BSEqualObjects();

  id v6 = v12;
  if ((v5 & 1) == 0)
  {
    secondaryTextLabel = self->_secondaryTextLabel;
    if (v12)
    {
      if (!secondaryTextLabel)
      {
        double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        double v9 = self->_secondaryTextLabel;
        self->_secondaryTextLabel = v8;

        [(UILabel *)self->_secondaryTextLabel _setTextAlignmentFollowsWritingDirection:1];
        [(UILabel *)self->_secondaryTextLabel setLineBreakMode:4];
        [(NCNotificationRichContentView *)self _configureCrossfadingContentViewIfNecessary];
        [(UIView *)self->_crossfadingContentView addSubview:self->_secondaryTextLabel];
        double v10 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_secondaryTextLabel style:0 visualStylingProvider:v10 outgoingProvider:0];
        if (v10) {
          [v10 automaticallyUpdateView:self->_secondaryTextLabel withStyle:0];
        }

        secondaryTextLabel = self->_secondaryTextLabel;
      }
      double v11 = [(UILabel *)secondaryTextLabel textColor];
      [(UILabel *)self->_secondaryTextLabel setAttributedText:v12];
      [(UILabel *)self->_secondaryTextLabel setTextColor:v11];
      [(NCNotificationRichContentView *)self _updateTextAttributesForSecondaryTextElement];
    }
    else
    {
      [(UILabel *)secondaryTextLabel removeFromSuperview];
      double v11 = self->_secondaryTextLabel;
      self->_secondaryTextLabel = 0;
    }

    self->_hasUpdatedContent = 1;
    [(NCNotificationRichContentView *)self setNeedsLayout];
    id v6 = v12;
  }
}

- (NSString)footerText
{
  return [(UILabel *)self->_footerTextLabel text];
}

- (void)setFooterText:(id)a3
{
  id v13 = a3;
  CGRect v4 = [(NCNotificationRichContentView *)self footerText];
  char v5 = BSEqualStrings();

  id v6 = v13;
  if ((v5 & 1) == 0)
  {
    footerTextLabel = self->_footerTextLabel;
    if (v13)
    {
      if (!footerTextLabel)
      {
        double v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        double v9 = self->_footerTextLabel;
        self->_footerTextLabel = v8;

        [(UILabel *)self->_footerTextLabel setLineBreakMode:4];
        [(UIView *)self->_crossfadingContentView addSubview:self->_footerTextLabel];
        [(NCNotificationRichContentView *)self _updateTextAttributesForFooterTextLabel];
        double v10 = self->_footerTextLabel;
        double v11 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
        [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:v10 style:1 visualStylingProvider:v11 outgoingProvider:0];

        id v6 = v13;
        footerTextLabel = self->_footerTextLabel;
      }
      [(UILabel *)footerTextLabel setText:v6];
    }
    else
    {
      [(UILabel *)footerTextLabel removeFromSuperview];
      id v12 = self->_footerTextLabel;
      self->_footerTextLabel = 0;
    }
    self->_hasUpdatedContent = 1;
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (void)setSecondaryTextMaximumNumberOfLines:(unint64_t)a3
{
  if (self->_secondaryTextMaximumNumberOfLines != a3)
  {
    self->_secondaryTextMaximumNumberOfLines = a3;
    CGRect v4 = [(NCNotificationRichContentView *)self secondaryText];
    uint64_t v5 = [v4 length];

    if (v5)
    {
      self->_hasUpdatedContent = 1;
      [(NCNotificationRichContentView *)self setNeedsLayout];
    }
  }
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCNotificationRichContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
  }
}

- (UIImage)thumbnail
{
  return [(UIImageView *)self->_thumbnailImageView image];
}

- (void)setThumbnail:(id)a3
{
  id v19 = a3;
  CGRect v4 = [(NCNotificationRichContentView *)self thumbnail];
  char v5 = BSEqualObjects();

  id v6 = v19;
  if ((v5 & 1) == 0)
  {
    thumbnailImageView = self->_thumbnailImageView;
    if (v19)
    {
      if (!thumbnailImageView)
      {
        double v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
        double v9 = self->_thumbnailImageView;
        self->_thumbnailImageView = v8;

        [(UIImageView *)self->_thumbnailImageView setContentMode:2];
        double v10 = self->_thumbnailImageView;
        BOOL v11 = [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
        double v12 = 14.0;
        if (v11) {
          double v12 = 0.0;
        }
        [(UIImageView *)v10 _setContinuousCornerRadius:v12];
        [(UIImageView *)self->_thumbnailImageView setClipsToBounds:1];
        imageBoundingView = self->_imageBoundingView;
        if (!imageBoundingView)
        {
          id v14 = objc_alloc(MEMORY[0x1E4FB1EB0]);
          v15 = (UIView *)objc_msgSend(v14, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
          v16 = self->_imageBoundingView;
          self->_imageBoundingView = v15;

          [(NCNotificationRichContentView *)self _configureCrossfadingContentViewIfNecessary];
          [(UIView *)self->_crossfadingContentView addSubview:self->_imageBoundingView];
          imageBoundingView = self->_imageBoundingView;
        }
        [(UIView *)imageBoundingView addSubview:self->_thumbnailImageView];
        thumbnailImageView = self->_thumbnailImageView;
        id v6 = v19;
      }
      [(UIImageView *)thumbnailImageView setImage:v6];
      v17 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
      [(NCNotificationListBaseContentView *)self _updateVisualStylingOfImageView:self->_thumbnailImageView ifSymbolImageWithStyle:0 visualStylingProvider:v17 outgoingProvider:v17];
    }
    else
    {
      [(UIImageView *)thumbnailImageView removeFromSuperview];
      v18 = self->_thumbnailImageView;
      self->_thumbnailImageView = 0;

      [(UIView *)self->_imageBoundingView removeFromSuperview];
      v17 = self->_imageBoundingView;
      self->_imageBoundingView = 0;
    }

    self->_hasUpdatedContent = 1;
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }

  MEMORY[0x1F4181820]();
}

- (void)setBadgedIconView:(id)a3
{
  id v9 = a3;
  p_badgedIconView = &self->_badgedIconView;
  char v6 = BSEqualObjects();
  double v7 = v9;
  if ((v6 & 1) == 0)
  {
    [(NCBadgedIconView *)*p_badgedIconView removeFromSuperview];
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView)
    {
      -[NCNotificationRichContentView addSubview:](self, "addSubview:");
      double v8 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
      [(NCBadgedIconView *)*p_badgedIconView updateVisualStylingOfProminentImageViewIfSymbolImageWithStyle:0 visualStylingProvider:v8 outgoingProvider:v8];
    }
    [(NCNotificationRichContentView *)self setNeedsLayout];
    double v7 = v9;
  }
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    CGRect v4 = (NSDate *)[v6 copy];
    date = self->_date;
    self->_date = v4;

    [(NCNotificationRichContentView *)self _tearDownDateLabel];
    [(NCNotificationRichContentView *)self _configureDateLabelIfNecessary];
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)setDateAllDay:(BOOL)a3
{
  if (self->_dateAllDay != a3)
  {
    self->_dateAllDay = a3;
    [(NCNotificationRichContentView *)self _tearDownDateLabel];
    [(NCNotificationRichContentView *)self _configureDateLabelIfNecessary];
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    [(NCNotificationRichContentView *)self _tearDownDateLabel];
    [(NCNotificationRichContentView *)self _configureDateLabelIfNecessary];
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)setHideDate:(BOOL)a3
{
  if (self->_hideDate != a3)
  {
    self->_hideDate = a3;
    [(NCNotificationRichContentView *)self _tearDownDateLabel];
    [(NCNotificationRichContentView *)self _configureDateLabelIfNecessary];
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)setDateAlpha:(double)a3
{
  if (self->_dateAlpha != a3)
  {
    self->_dateAlpha = a3;
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    CGRect v4 = (NSTimeZone *)[v6 copy];
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    [(NCNotificationRichContentView *)self _tearDownDateLabel];
    [(NCNotificationRichContentView *)self _configureDateLabelIfNecessary];
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)_layoutSubviews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__NCNotificationRichContentView__layoutSubviews__block_invoke;
  v2[3] = &unk_1E6A91BB0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

uint64_t __48__NCNotificationRichContentView__layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _layoutImageBoundingView];
  [*(id *)(a1 + 32) _layoutThumbnailImageView];
  [*(id *)(a1 + 32) _layoutBadgedIconView];
  [*(id *)(a1 + 32) _layoutPrimaryTextLabel];
  [*(id *)(a1 + 32) _layoutPrimarySubtitleTextLabel];
  [*(id *)(a1 + 32) _layoutSecondaryTextLabel];
  [*(id *)(a1 + 32) _layoutFooterTextLabel];
  v2 = *(void **)(a1 + 32);

  return [v2 _layoutDateLabel];
}

- (void)_layoutImageBoundingView
{
  imageBoundingView = self->_imageBoundingView;
  if (!imageBoundingView) {
    return;
  }
  [(UIView *)imageBoundingView frame];
  [(NCNotificationRichContentView *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(NCNotificationRichContentView *)self isAttachmentImageFeatured])
  {
    v15.origin.x = v5;
    v15.origin.y = v7;
    v15.size.double width = v9;
    v15.size.double height = v11;
    CGRectGetWidth(v15);
    if (self->_thumbnailImageView) {
      -[NCNotificationRichContentView _featuredImageHeightForBounds:](self, "_featuredImageHeightForBounds:", v5, v7, v9, v11);
    }
    if (![(NCNotificationRichContentView *)self _shouldReverseLayoutDirection])goto LABEL_12; {
  }
    }
  else if ([(NCNotificationRichContentView *)self _shouldReverseLayoutDirection])
  {
    goto LABEL_12;
  }
  v16.origin.x = v5;
  v16.origin.y = v7;
  v16.size.double width = v9;
  v16.size.double height = v11;
  CGRectGetMaxX(v16);
LABEL_12:
  UIRectIntegralWithScale();
  -[UIView setFrame:](self->_imageBoundingView, "setFrame:");
  double v12 = self->_imageBoundingView;
  double v13 = 1.0;
  if (!self->_thumbnailImageView) {
    double v13 = 0.0;
  }

  [(UIView *)v12 setAlpha:v13];
}

- (void)_layoutThumbnailImageView
{
  thumbnailImageView = self->_thumbnailImageView;
  if (thumbnailImageView)
  {
    [(UIImageView *)thumbnailImageView frame];
    [(UIView *)self->_imageBoundingView bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v12 = self->_thumbnailImageView;
    BOOL v13 = [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
    double v14 = 14.0;
    if (v13) {
      double v14 = 0.0;
    }
    [(UIImageView *)v12 _setContinuousCornerRadius:v14];
    CGRect v15 = self->_thumbnailImageView;
    -[UIImageView setFrame:](v15, "setFrame:", v5, v7, v9, v11);
  }
}

- (void)_layoutBadgedIconView
{
  badgedIconView = self->_badgedIconView;
  if (badgedIconView)
  {
    [(NCBadgedIconView *)badgedIconView frame];
    [(NCNotificationRichContentView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    BOOL v13 = [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
    if (!v13)
    {
      v2 = [(NCNotificationRichContentView *)self badgedIconView];
    }
    if (![(NCNotificationRichContentView *)self isAttachmentImageFeatured])
    {
      [(NCNotificationRichContentView *)self badgedIconView];
    }
    if (!v13) {

    }
    if ([(NCNotificationRichContentView *)self _shouldReverseLayoutDirection])
    {
      v16.origin.x = v6;
      v16.origin.y = v8;
      v16.size.double width = v10;
      v16.size.double height = v12;
      CGRectGetWidth(v16);
    }
    [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
    [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
    UIRectIntegralWithScale();
    -[NCBadgedIconView setFrame:](self->_badgedIconView, "setFrame:");
    double v14 = self->_badgedIconView;
    [(NCNotificationRichContentView *)self bringSubviewToFront:v14];
  }
}

- (void)_layoutPrimaryTextLabel
{
  primaryTextLabel = self->_primaryTextLabel;
  if (primaryTextLabel)
  {
    [(UILabel *)primaryTextLabel frame];
    [(NCNotificationRichContentView *)self bounds];
    -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
    double x = v18.origin.x;
    double y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
    double v8 = CGRectGetWidth(v18);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_primaryTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", x, y, width, height));
    CGFloat v10 = v9;
    double v11 = 13.0;
    if (self->_thumbnailImageView
      && [(NCNotificationRichContentView *)self isAttachmentImageFeatured])
    {
      [(UIView *)self->_imageBoundingView frame];
      double v11 = CGRectGetMaxY(v19) + 8.0;
    }
    if ([(NCNotificationRichContentView *)self _shouldReverseLayoutDirection])
    {
      [(NCNotificationRichContentView *)self bounds];
      CGFloat v12 = CGRectGetMaxX(v20) - v8;
      [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
      double v14 = v12 - v13;
    }
    else
    {
      [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
      double v14 = v15;
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_primaryTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForPrimaryTextInFrame:](self, "_numberOfLinesForPrimaryTextInFrame:", x, y, width, height));
    v21.origin.double x = v14;
    v21.origin.double y = v11;
    v21.size.double width = v8;
    v21.size.double height = v10;
    CGRectGetWidth(v21);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    CGRect v16 = self->_primaryTextLabel;
    -[UILabel setFrame:](v16, "setFrame:");
  }
}

- (void)_layoutPrimarySubtitleTextLabel
{
  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (!primarySubtitleTextLabel) {
    return;
  }
  [(UILabel *)primarySubtitleTextLabel frame];
  [(NCNotificationRichContentView *)self bounds];
  -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  double v8 = CGRectGetWidth(v24);
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_primarySubtitleTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", x, y, width, height));
  CGFloat v10 = v9;
  primaryTextLabel = self->_primaryTextLabel;
  if (primaryTextLabel)
  {
    [(UILabel *)primaryTextLabel frame];
    double v16 = 1.0;
LABEL_4:
    double v17 = CGRectGetMaxY(*(CGRect *)&v12) + v16;
    goto LABEL_5;
  }
  double v17 = 13.0;
  if (self->_thumbnailImageView
    && [(NCNotificationRichContentView *)self isAttachmentImageFeatured])
  {
    [(UIView *)self->_imageBoundingView frame];
    double v16 = 8.0;
    goto LABEL_4;
  }
LABEL_5:
  if ([(NCNotificationRichContentView *)self _shouldReverseLayoutDirection])
  {
    [(NCNotificationRichContentView *)self bounds];
    CGFloat v18 = CGRectGetMaxX(v25) - v8;
    [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
    double v20 = v18 - v19;
  }
  else
  {
    [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
    double v20 = v21;
  }
  -[UILabel unui_drawingHeightWithNumberOfLines:](self->_primarySubtitleTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForPrimarySubtitleTextInFrame:](self, "_numberOfLinesForPrimarySubtitleTextInFrame:", x, y, width, height));
  v26.origin.double x = v20;
  v26.origin.double y = v17;
  v26.size.double width = v8;
  v26.size.double height = v10;
  CGRectGetWidth(v26);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v22 = self->_primarySubtitleTextLabel;

  -[UILabel setFrame:](v22, "setFrame:");
}

- (void)_layoutSecondaryTextLabel
{
  secondaryTextLabel = self->_secondaryTextLabel;
  if (!secondaryTextLabel) {
    return;
  }
  [(UILabel *)secondaryTextLabel frame];
  [(NCNotificationRichContentView *)self bounds];
  -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  double v8 = CGRectGetWidth(v24);
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_secondaryTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", x, y, width, height));
  CGFloat v10 = v9;
  primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
  if (primarySubtitleTextLabel || (primarySubtitleTextLabel = self->_primaryTextLabel) != 0)
  {
    [(UILabel *)primarySubtitleTextLabel frame];
    double v16 = 1.0;
LABEL_5:
    double v17 = CGRectGetMaxY(*(CGRect *)&v12) + v16;
    goto LABEL_6;
  }
  double v17 = 13.0;
  if (self->_thumbnailImageView
    && [(NCNotificationRichContentView *)self isAttachmentImageFeatured])
  {
    [(UIView *)self->_imageBoundingView frame];
    double v16 = 8.0;
    goto LABEL_5;
  }
LABEL_6:
  if ([(NCNotificationRichContentView *)self _shouldReverseLayoutDirection])
  {
    [(NCNotificationRichContentView *)self bounds];
    CGFloat v18 = CGRectGetMaxX(v25) - v8;
    [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
    double v20 = v18 - v19;
  }
  else
  {
    [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
    double v20 = v21;
  }
  -[UILabel unui_drawingHeightWithNumberOfLines:](self->_secondaryTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForSecondaryTextInFrame:](self, "_numberOfLinesForSecondaryTextInFrame:", x, y, width, height));
  v26.origin.double x = v20;
  v26.origin.double y = v17;
  v26.size.double width = v8;
  v26.size.double height = v10;
  CGRectGetWidth(v26);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  v22 = self->_secondaryTextLabel;

  -[UILabel setFrame:](v22, "setFrame:");
}

- (void)_layoutFooterTextLabel
{
  footerTextLabel = self->_footerTextLabel;
  if (footerTextLabel)
  {
    [(UILabel *)footerTextLabel frame];
    [(NCNotificationRichContentView *)self bounds];
    -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:");
    double x = v18.origin.x;
    double y = v18.origin.y;
    double width = v18.size.width;
    double height = v18.size.height;
    double v8 = CGRectGetWidth(v18);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_footerTextLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", x, y, width, height));
    CGFloat v10 = v9;
    [(UILabel *)self->_secondaryTextLabel frame];
    CGFloat MaxY = CGRectGetMaxY(v19);
    if ([(NCNotificationRichContentView *)self _shouldReverseLayoutDirection])
    {
      [(NCNotificationRichContentView *)self bounds];
      CGFloat v12 = CGRectGetMaxX(v20) - v8;
      [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
      double v14 = v12 - v13;
    }
    else
    {
      [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
      double v14 = v15;
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_footerTextLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationRichContentView _numberOfLinesForFooterTextInFrame:](self, "_numberOfLinesForFooterTextInFrame:", x, y, width, height));
    v21.origin.double x = v14;
    v21.origin.double y = MaxY;
    v21.size.double width = v8;
    v21.size.double height = v10;
    CGRectGetWidth(v21);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    double v16 = self->_footerTextLabel;
    -[UILabel setFrame:](v16, "setFrame:");
  }
}

- (void)_layoutDateLabel
{
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    [(BSUIDateLabel *)dateLabel frame];
    [(NCNotificationRichContentView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    if ([(NCNotificationRichContentView *)self isAttachmentImageFeatured]) {
      double v12 = 12.0;
    }
    else {
      double v12 = 14.0;
    }
    v38.origin.double x = v5;
    v38.origin.double y = v7;
    v38.size.double width = v9;
    v38.size.double height = v11;
    CGRect v39 = CGRectInset(v38, v12, 0.0);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
    BOOL v17 = [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
    double v18 = height;
    double v19 = width;
    double v20 = y;
    double v21 = x;
    if (!v17) {
      -[NCNotificationRichContentView _labelSizingBoundsForRect:](self, "_labelSizingBoundsForRect:", x, y, width, height);
    }
    double v22 = CGRectGetWidth(*(CGRect *)&v21);
    [(BSUIDateLabel *)self->_dateLabel unui_measuringHeightWithNumberOfLines:1];
    double v24 = v23;
    footerTextLabel = self->_footerTextLabel;
    if (!footerTextLabel) {
      footerTextLabel = self->_secondaryTextLabel;
    }
    [(UILabel *)footerTextLabel frame];
    double MaxY = CGRectGetMaxY(v40);
    BOOL v27 = [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
    double v28 = 1.0;
    if (v27) {
      double v28 = 2.0;
    }
    double v29 = MaxY + v28;
    v41.origin.double x = x;
    v41.origin.double y = y;
    v41.size.double width = width;
    v41.size.double height = height;
    double v30 = CGRectGetMaxY(v41) - v24 + -12.0;
    if (v29 >= v30) {
      CGFloat v31 = v29;
    }
    else {
      CGFloat v31 = v30;
    }
    if ([(NCNotificationRichContentView *)self _shouldReverseLayoutDirection])
    {
      [(NCNotificationRichContentView *)self bounds];
      CGFloat v32 = CGRectGetMaxX(v42) - v22;
      [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
      double v34 = v32 - v33;
    }
    else
    {
      [(NCNotificationRichContentView *)self _labelLayoutHorizontalMargin];
      double v34 = v35;
    }
    [(BSUIDateLabel *)self->_dateLabel unui_drawingHeightWithNumberOfLines:1];
    v43.origin.double x = v34;
    v43.origin.double y = v31;
    v43.size.double width = v22;
    v43.size.double height = v24;
    CGRectGetWidth(v43);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    [(BSUIDateLabel *)self->_dateLabel setFrame:0];
    v36 = self->_dateLabel;
    [(NCNotificationRichContentView *)self dateAlpha];
    -[BSUIDateLabel setAlpha:](v36, "setAlpha:");
  }
}

- (void)dateLabelDidChange:(id)a3
{
  [(BSUIDateLabel *)self->_dateLabel sizeToFit];

  [(NCNotificationRichContentView *)self setNeedsLayout];
}

- (BOOL)_isAXSize
{
  v2 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v2);

  return IsAccessibilityCategory;
}

- (void)_configureCrossfadingContentViewIfNecessary
{
  if (!self->_crossfadingContentView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(NCNotificationRichContentView *)self bounds];
    double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
    crossfadingContentView = self->_crossfadingContentView;
    self->_crossfadingContentView = v4;

    [(NCNotificationRichContentView *)self addSubview:self->_crossfadingContentView];
    double v6 = self->_crossfadingContentView;
    [(UIView *)v6 setAutoresizingMask:18];
  }
}

- (double)_featuredImageHeightForBounds:(CGRect)a3
{
  CGRectGetWidth(a3);
  double v4 = [(NCNotificationRichContentView *)self traitCollection];
  [v4 displayScale];
  UICeilToScale();
  double v6 = v5;

  return v6;
}

- (CGRect)_labelSizingBoundsForRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v9 = CGRectGetWidth(a3);
  if (self->_thumbnailImageView
    && ![(NCNotificationRichContentView *)self isAttachmentImageFeatured])
  {
    double v10 = 98.0;
  }
  else if ([(NCNotificationRichContentView *)self isAttachmentImageFeatured])
  {
    double v10 = 12.0;
  }
  else
  {
    double v10 = 14.0;
  }
  if (self->_badgedIconView
    && ![(NCNotificationRichContentView *)self isAttachmentImageFeatured])
  {
    BOOL v16 = [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
    if (v16)
    {
      double v17 = 20.0;
    }
    else
    {
      id v3 = [(NCNotificationRichContentView *)self badgedIconView];
      if (v3) {
        double v17 = 38.0;
      }
      else {
        double v17 = 56.0;
      }
    }
    BOOL v18 = [(NCNotificationRichContentView *)self isAttachmentImageFeatured];
    double v19 = 10.0;
    if (!v18) {
      double v19 = 12.0;
    }
    double v11 = v17 + v19 + 12.0;
    if (!v16) {
  }
    }
  else if ([(NCNotificationRichContentView *)self isAttachmentImageFeatured])
  {
    double v11 = 12.0;
  }
  else
  {
    double v11 = 14.0;
  }
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  double v12 = CGRectGetHeight(v20);
  double v13 = 0.0;
  double v14 = 0.0;
  double v15 = v9 - v10 - v11;
  result.size.CGFloat height = v12;
  result.size.CGFloat width = v15;
  result.origin.CGFloat y = v14;
  result.origin.CGFloat x = v13;
  return result;
}

- (double)_labelLayoutHorizontalMargin
{
  if (self->_badgedIconView
    && ![(NCNotificationRichContentView *)self isAttachmentImageFeatured])
  {
    if ([(NCNotificationRichContentView *)self isAttachmentImageFeatured]) {
      double v5 = 22.0;
    }
    else {
      double v5 = 24.0;
    }
    if ([(NCNotificationRichContentView *)self isAttachmentImageFeatured])
    {
      return v5 + 20.0;
    }
    else
    {
      double v6 = [(NCNotificationRichContentView *)self badgedIconView];
      double v7 = 38.0;
      if (!v6) {
        double v7 = 56.0;
      }
      double v3 = v5 + v7;
    }
  }
  else if ([(NCNotificationRichContentView *)self isAttachmentImageFeatured])
  {
    return 12.0;
  }
  else
  {
    return 14.0;
  }
  return v3;
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NCNotificationRichContentView;
  id v8 = a5;
  id v9 = a3;
  [(NCNotificationListBaseContentView *)&v10 _visualStylingProviderDidChange:v9 forCategory:a4 outgoingProvider:v8];
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_primaryTextLabel, 0, v9, v8, v10.receiver, v10.super_class);
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_primarySubtitleTextLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_secondaryTextLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_footerTextLabel style:1 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfImageView:self->_thumbnailImageView ifSymbolImageWithStyle:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_dateLabel style:1 visualStylingProvider:v9 outgoingProvider:v8];
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
  unint64_t v9 = [(NCNotificationRichContentView *)self _maximumNumberOfLinesForPrimaryText];

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
  unint64_t v9 = [(NCNotificationRichContentView *)self _maximumNumberOfLinesForPrimarySubtitleText];

  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", primarySubtitleTextLabel, v9, x, y, width, height);
}

- (unint64_t)_maximumNumberOfLinesForSecondaryText
{
  unint64_t v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v3)) {
    unint64_t secondaryTextMaximumNumberOfLines = 0;
  }
  else {
    unint64_t secondaryTextMaximumNumberOfLines = self->_secondaryTextMaximumNumberOfLines;
  }

  return secondaryTextMaximumNumberOfLines;
}

- (unint64_t)_numberOfLinesForSecondaryTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  secondaryTextLabel = self->_secondaryTextLabel;
  unint64_t v9 = [(NCNotificationRichContentView *)self _maximumNumberOfLinesForSecondaryText];

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
  unint64_t v9 = [(NCNotificationRichContentView *)self _maximumNumberOfLinesForFooterText];

  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", footerTextLabel, v9, x, y, width, height);
}

- (void)_updateTextAttributes
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationRichContentView;
  [(NCNotificationListBaseContentView *)&v3 _updateTextAttributes];
  [(NCNotificationRichContentView *)self _updateTextAttributesForPrimaryTextLabel];
  [(NCNotificationRichContentView *)self _updateTextAttributesForPrimarySubtitleTextLabel];
  [(NCNotificationRichContentView *)self _updateTextAttributesForSecondaryTextElement];
  [(NCNotificationRichContentView *)self _updateTextAttributesForFooterTextLabel];
  [(NCNotificationRichContentView *)self _updateTextAttributesForDateLabel];
}

- (void)_updateTextAttributesForPrimaryTextLabel
{
  if (self->_primaryTextLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);
    double v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v5 = (id *)MEMORY[0x1E4FB2950];
    }
    id v6 = *v5;

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:self->_primaryTextLabel withTextStyle:v6 fontWeight:0 additionalTraits:[(NCNotificationRichContentView *)self _maximumNumberOfLinesForPrimaryText] maximumNumberOfLines:*MEMORY[0x1E4FB09E0]];
    self->_hasUpdatedContent = 1;
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForPrimarySubtitleTextLabel
{
  if (self->_primarySubtitleTextLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);
    double v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v5 = (id *)MEMORY[0x1E4FB2950];
    }
    id v6 = *v5;

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:self->_primarySubtitleTextLabel withTextStyle:v6 fontWeight:0 additionalTraits:[(NCNotificationRichContentView *)self _maximumNumberOfLinesForPrimarySubtitleText] maximumNumberOfLines:*MEMORY[0x1E4FB09E0]];
    self->_hasUpdatedContent = 1;
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForSecondaryTextElement
{
  if (self->_secondaryTextLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);
    double v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v5 = (id *)MEMORY[0x1E4FB28F0];
    }
    id v6 = *v5;

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:self->_secondaryTextLabel withTextStyle:v6 fontWeight:0 additionalTraits:[(NCNotificationRichContentView *)self _maximumNumberOfLinesForSecondaryText] maximumNumberOfLines:*MEMORY[0x1E4FB09D8]];
    self->_hasUpdatedContent = 1;
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForFooterTextLabel
{
  if (self->_footerTextLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);
    double v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v5 = (id *)MEMORY[0x1E4FB28E0];
    }
    id v6 = *v5;

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:self->_footerTextLabel withTextStyle:v6 fontWeight:0 additionalTraits:[(NCNotificationRichContentView *)self _maximumNumberOfLinesForFooterText] maximumNumberOfLines:*MEMORY[0x1E4FB09D8]];
    self->_hasUpdatedContent = 1;
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForDateLabel
{
  dateLabel = self->_dateLabel;
  if (dateLabel)
  {
    double v4 = [(NCNotificationRichContentView *)self _dateLabelPreferredFont];
    [(BSUIDateLabel *)dateLabel setFont:v4];

    [(BSUIDateLabel *)self->_dateLabel setNumberOfLines:1];
    [(BSUIDateLabel *)self->_dateLabel setLineBreakMode:3];
    [(NCNotificationRichContentView *)self setNeedsLayout];
  }
}

- (id)_dateLabelPreferredFont
{
  return [(NCNotificationListBaseContentView *)self _preferredFont:1 textStyle:*MEMORY[0x1E4FB28E0] weight:0 additionalTraits:*MEMORY[0x1E4FB09D8]];
}

- (void)_configureDateLabelIfNecessary
{
  if (!self->_dateLabel)
  {
    if (self->_date) {
      [(NCNotificationRichContentView *)self _configureDateLabel];
    }
  }
}

- (void)_configureDateLabel
{
  objc_super v3 = [MEMORY[0x1E4F4F8A8] sharedInstance];
  double v4 = [v3 startLabelWithStartDate:self->_date endDate:0 timeZone:self->_timeZone allDay:self->_dateAllDay forStyle:self->_dateFormatStyle];
  dateLabel = self->_dateLabel;
  self->_dateLabel = v4;

  [(BSUIDateLabel *)self->_dateLabel setDelegate:self];
  [(BSUIDateLabel *)self->_dateLabel setHidden:self->_hideDate];
  [(NCNotificationRichContentView *)self addSubview:self->_dateLabel];
  [(NCNotificationRichContentView *)self _updateTextAttributesForDateLabel];
  id v7 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_dateLabel style:1 visualStylingProvider:v7 outgoingProvider:0];
  id v6 = v7;
  if (v7)
  {
    [v7 automaticallyUpdateView:self->_dateLabel withStyle:1];
    id v6 = v7;
  }
}

- (void)_recycleDateLabel
{
  [(BSUIDateLabel *)self->_dateLabel setDelegate:0];
  [(BSUIDateLabel *)self->_dateLabel setHidden:0];
  objc_super v3 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
  [v3 stopAutomaticallyUpdatingView:self->_dateLabel];

  id v4 = [MEMORY[0x1E4F4F8A8] sharedInstance];
  [v4 recycleLabel:self->_dateLabel];
}

- (void)_tearDownDateLabel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __51__NCNotificationRichContentView__tearDownDateLabel__block_invoke;
  v2[3] = &unk_1E6A91BB0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __51__NCNotificationRichContentView__tearDownDateLabel__block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 496);
  if (v2)
  {
    [v2 removeFromSuperview];
    [*(id *)(a1 + 32) _recycleDateLabel];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 496);
    *(void *)(v3 + 496) = 0;
  }
}

- (int64_t)_dateFormatStyleForDate:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9A8];
  id v4 = a3;
  double v5 = [v3 currentCalendar];
  unsigned int v6 = [v5 isDateInToday:v4];

  return v6;
}

- (unint64_t)secondaryTextMaximumNumberOfLines
{
  return self->_secondaryTextMaximumNumberOfLines;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (NCBadgedIconView)badgedIconView
{
  return self->_badgedIconView;
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

- (BOOL)isAttachmentImageFeatured
{
  return self->_attachmentImageFeatured;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);
  objc_storeStrong((id *)&self->_imageBoundingView, 0);
  objc_storeStrong((id *)&self->_footerTextLabel, 0);
  objc_storeStrong((id *)&self->_secondaryTextLabel, 0);
  objc_storeStrong((id *)&self->_primarySubtitleTextLabel, 0);
  objc_storeStrong((id *)&self->_primaryTextLabel, 0);

  objc_storeStrong((id *)&self->_crossfadingContentView, 0);
}

@end