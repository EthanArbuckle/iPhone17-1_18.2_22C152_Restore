@interface NCNotificationContentView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)isThumbnailContactImage;
- (BOOL)screenCaptureProhibited;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (BOOL)useSmallTopMargin;
- (BSUIFontProvider)fontProvider;
- (CGRect)_frameForThumbnailInRect:(CGRect)a3 withContentViewInsets:(UIEdgeInsets)a4;
- (CGRect)_primaryLabelBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5;
- (CGRect)_primarySubtitleLabelBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5;
- (CGRect)_secondaryTextViewBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5;
- (CGRect)_summaryLabelBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5;
- (CGSize)_sizeThatFits:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationContentView)initWithStyle:(int64_t)a3;
- (NCNotificationContentViewDelegate)delegate;
- (NSArray)requiredVisualStyleCategories;
- (NSAttributedString)secondaryText;
- (NSString)debugDescription;
- (NSString)preferredContentSizeCategory;
- (NSString)primarySubtitleText;
- (NSString)primaryText;
- (NSString)summaryText;
- (UIEdgeInsets)_contentInsets;
- (UIEdgeInsets)_contentInsetsForLongLook;
- (UIEdgeInsets)_contentInsetsForShortLook;
- (UIEdgeInsets)_contentInsetsForStyle:(int64_t)a3;
- (UIImage)thumbnail;
- (UILabel)_secondaryLabel;
- (UITextView)_secondaryTextView;
- (UIView)accessoryView;
- (double)_primarySubtitleTextBaselineOffsetForCurrentStyle;
- (double)_primaryTextBaselineOffsetForCurrentStyle;
- (double)_primaryTextBaselineOffsetWithBaseValue:(double)a3;
- (double)_secondaryTextBaselineOffsetForCurrentStyle;
- (double)_secondaryTextBaselineOffsetFromBottomWithBaseValue:(double)a3;
- (double)_secondaryTextBaselineOffsetWithBaseValue:(double)a3;
- (double)_summaryTextBaselineOffsetForCurrentStyle;
- (double)_summaryTextBaselineOffsetWithBaseValue:(double)a3;
- (double)topMarginToPrimaryLabelForCurrentStyle;
- (id)_lazyPrimaryLabel;
- (id)_lazyPrimarySubtitleLabel;
- (id)_lazySecondaryLabel;
- (id)_lazySecondaryTextSupportingView;
- (id)_lazySecondaryTextView;
- (id)_lazySummaryLabel;
- (id)_lazyThumbnailImageView;
- (id)_newPrimaryLabel;
- (id)_newSecondaryLabel;
- (id)_newSecondaryTextView;
- (id)_newSummaryLabel;
- (id)_secondaryTextSupportingView;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)textView:(id)a3 writingToolsIgnoredRangesInEnclosingRange:(_NSRange)a4;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (unint64_t)_cachedNumberOfMeasuredLinesForText:(id)a3 withFont:(id)a4 forWidth:(double)a5 scale:(double)a6;
- (unint64_t)_numberOfMeasuredLinesForText:(id)a3 withFont:(id)a4 forSize:(CGSize)a5;
- (unint64_t)_primarySubtitleTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4;
- (unint64_t)_primarySubtitleTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3;
- (unint64_t)_primaryTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4;
- (unint64_t)_primaryTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3;
- (unint64_t)_secondaryTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4;
- (unint64_t)_secondaryTextNumberOfLines;
- (unint64_t)_secondaryTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3;
- (unint64_t)_summaryTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4;
- (unint64_t)_summaryTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3;
- (unint64_t)maximumNumberOfPrimaryLargeTextLines;
- (unint64_t)maximumNumberOfPrimaryTextLines;
- (unint64_t)maximumNumberOfSecondaryLargeTextLines;
- (unint64_t)maximumNumberOfSecondaryTextLines;
- (unint64_t)primarySubtitleTextMaximumNumberOfLines;
- (unint64_t)primaryTextMaximumNumberOfLines;
- (unint64_t)secondaryTextMaximumNumberOfLines;
- (void)_clearCacheForFont:(id)a3;
- (void)_configureTextSupportingView:(id)a3;
- (void)_configureThumbnailAsContactImage:(BOOL)a3;
- (void)_invalidateNumberOfLinesCache;
- (void)_layoutSubviews;
- (void)_setPrimaryLabel:(id)a3;
- (void)_setPrimarySubtitleLabel:(id)a3;
- (void)_setSummaryLabel:(id)a3;
- (void)_updateContentInsets;
- (void)_updateContentModeForThumbnailImage:(id)a3;
- (void)_updateStyleForPrimaryLabel:(id)a3 withStyle:(int64_t)a4;
- (void)_updateStyleForSecondaryTextSupportingView:(id)a3 withStyle:(int64_t)a4;
- (void)_updateStyleForSummaryLabel:(id)a3 withStyle:(int64_t)a4;
- (void)_updateStyleForThumbnailImage:(id)a3 withStyle:(int64_t)a4;
- (void)_updateTextAttributesForPrimaryLabel:(id)a3 withStyle:(int64_t)a4;
- (void)_updateTextAttributesForSecondaryTextSupportingView:(id)a3 withStyle:(int64_t)a4;
- (void)_updateTextAttributesForSummaryLabel:(id)a3 withStyle:(int64_t)a4;
- (void)layoutSubviews;
- (void)setAccessoryView:(id)a3;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setFontProvider:(id)a3;
- (void)setMaximumNumberOfPrimaryLargeTextLines:(unint64_t)a3;
- (void)setMaximumNumberOfPrimaryTextLines:(unint64_t)a3;
- (void)setMaximumNumberOfSecondaryLargeTextLines:(unint64_t)a3;
- (void)setMaximumNumberOfSecondaryTextLines:(unint64_t)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setPrimarySubtitleText:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setSecondaryText:(id)a3;
- (void)setSummaryText:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setThumbnailIsContactImage:(BOOL)a3;
- (void)setUseSmallTopMargin:(BOOL)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCNotificationContentView

- (NCNotificationContentView)initWithStyle:(int64_t)a3
{
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationContentView;
  v4 = -[NCNotificationContentView initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_lookStyle = a3;
    p_contentInsets = &v4->_contentInsets;
    [(NCNotificationContentView *)v4 _contentInsetsForStyle:a3];
    *(void *)&p_contentInsets->top = v7;
    v5->_contentInsets.left = v8;
    v5->_contentInsets.bottom = v9;
    v5->_contentInsets.right = v10;
    v11 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentView = v5->_contentView;
    v5->_contentView = v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    widthToFontToStringToMeasuredNumLines = v5->_widthToFontToStringToMeasuredNumLines;
    v5->_widthToFontToStringToMeasuredNumLines = v13;

    [(NCNotificationContentView *)v5 addSubview:v5->_contentView];
  }
  return v5;
}

- (double)_primaryTextBaselineOffsetWithBaseValue:(double)a3
{
  v5 = [(NCNotificationContentView *)self _lazyPrimaryLabel];
  v6 = [v5 font];

  v7 = [(NCNotificationContentView *)self primaryText];
  objc_msgSend(v6, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", objc_msgSend(v6, "unui_hasExuberatedLineHeightForText:", v7), a3);
  double v9 = v8;

  return v9;
}

- (double)_secondaryTextBaselineOffsetWithBaseValue:(double)a3
{
  v5 = [(NCNotificationContentView *)self _lazySecondaryTextSupportingView];
  v6 = [v5 font];

  v7 = [(NCNotificationContentView *)self secondaryText];
  double v8 = [v7 string];
  objc_msgSend(v6, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", objc_msgSend(v6, "unui_hasExuberatedLineHeightForText:", v8), a3);
  double v10 = v9;

  return v10;
}

- (double)_secondaryTextBaselineOffsetFromBottomWithBaseValue:(double)a3
{
  v5 = [(NCNotificationContentView *)self _lazyPrimaryLabel];
  v6 = [v5 font];

  v7 = [(NCNotificationContentView *)self primaryText];
  objc_msgSend(v6, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", objc_msgSend(v6, "unui_hasExuberatedLineHeightForText:", v7), a3);
  double v9 = v8;

  return v9;
}

- (double)_summaryTextBaselineOffsetWithBaseValue:(double)a3
{
  v5 = [(NCNotificationContentView *)self _lazySummaryLabel];
  v6 = [v5 font];

  v7 = [(NCNotificationContentView *)self summaryText];
  objc_msgSend(v6, "unui_effectiveScaledValueForValue:hasExuberatedLineHeight:", objc_msgSend(v6, "unui_hasExuberatedLineHeightForText:", v7), a3);
  double v9 = v8;

  return v9;
}

- (UIEdgeInsets)_contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)_contentInsetsForShortLook
{
  double v3 = 5.0;
  if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection]) {
    double v4 = 5.0;
  }
  else {
    double v4 = 2.0;
  }
  if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection]) {
    double v5 = 2.0;
  }
  else {
    double v5 = 5.0;
  }
  v6 = [MEMORY[0x1E4FB1438] sharedApplication];
  v7 = [v6 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v7);

  double v9 = 0.0;
  if (IsAX)
  {
    if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection])double v4 = 5.0; {
    else
    }
      double v4 = 2.0;
    if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection]) {
      double v5 = 2.0;
    }
    else {
      double v5 = 5.0;
    }
    double v9 = 28.0;
    double v3 = 6.0;
  }
  double v10 = v4;
  double v11 = v3;
  double v12 = v5;
  result.double right = v12;
  result.double bottom = v11;
  result.double left = v10;
  result.double top = v9;
  return result;
}

- (UIEdgeInsets)_contentInsetsForLongLook
{
  if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection]) {
    double v3 = 15.0;
  }
  else {
    double v3 = 17.0;
  }
  if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection]) {
    double v4 = 17.0;
  }
  else {
    double v4 = 15.0;
  }
  double v5 = 0.0;
  double v6 = 16.0;
  double v7 = v3;
  result.double right = v4;
  result.double bottom = v6;
  result.double left = v7;
  result.double top = v5;
  return result;
}

- (UIEdgeInsets)_contentInsetsForStyle:(int64_t)a3
{
  if (a3 == 1) {
    [(NCNotificationContentView *)self _contentInsetsForLongLook];
  }
  else {
    [(NCNotificationContentView *)self _contentInsetsForShortLook];
  }
  result.double right = v6;
  result.double bottom = v5;
  result.double left = v4;
  result.double top = v3;
  return result;
}

- (double)topMarginToPrimaryLabelForCurrentStyle
{
  double result = 0.0;
  if (self->_lookStyle == 1)
  {
    BOOL v3 = [(NCNotificationContentView *)self useSmallTopMargin];
    double result = 8.0;
    if (v3) {
      return -6.0;
    }
  }
  return result;
}

- (double)_primaryTextBaselineOffsetForCurrentStyle
{
  double v2 = 23.0;
  if (self->_lookStyle == 1)
  {
    BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v4 = [v3 preferredContentSizeCategory];
    if (_NCSizeCategoryIsAX(v4)) {
      double v2 = 22.0;
    }
    else {
      double v2 = 20.0;
    }
  }
  return v2;
}

- (double)_primarySubtitleTextBaselineOffsetForCurrentStyle
{
  int64_t lookStyle = self->_lookStyle;
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v4 = [v3 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v4);

  double result = 19.0;
  if (IsAX) {
    double result = 21.0;
  }
  double v7 = 20.0;
  if (IsAX) {
    double v7 = 22.0;
  }
  if (lookStyle == 1) {
    return v7;
  }
  return result;
}

- (double)_secondaryTextBaselineOffsetForCurrentStyle
{
  int64_t lookStyle = self->_lookStyle;
  BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v4 = [v3 preferredContentSizeCategory];
  BOOL IsAX = _NCSizeCategoryIsAX(v4);

  double result = 19.0;
  if (IsAX) {
    double result = 21.0;
  }
  double v7 = 20.0;
  if (IsAX) {
    double v7 = 22.0;
  }
  if (lookStyle == 1) {
    return v7;
  }
  return result;
}

- (double)_summaryTextBaselineOffsetForCurrentStyle
{
  double v2 = 0.0;
  if (self->_lookStyle != 1)
  {
    BOOL v3 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v4 = [v3 preferredContentSizeCategory];
    if (_NCSizeCategoryIsAX(v4)) {
      double v2 = 20.0;
    }
    else {
      double v2 = 24.0;
    }
  }
  return v2;
}

- (unint64_t)_primaryTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4
{
  double v7 = [(NCNotificationContentView *)self primaryText];
  unint64_t v8 = [v7 length] != 0;

  double v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v10 = [v9 preferredContentSizeCategory];
  if (_NCSizeCategoryIsAX(v10)) {
    unint64_t v11 = [(NCNotificationContentView *)self maximumNumberOfPrimaryLargeTextLines];
  }
  else {
    unint64_t v11 = [(NCNotificationContentView *)self maximumNumberOfPrimaryTextLines];
  }
  unint64_t v12 = v11;

  if (v12 == 1) {
    return v8;
  }
  v14 = [(NCNotificationContentView *)self _lazyPrimaryLabel];
  v15 = [v14 text];
  objc_super v16 = [v14 font];
  unint64_t v17 = [(NCNotificationContentView *)self _cachedNumberOfMeasuredLinesForText:v15 withFont:v16 forWidth:a3 scale:a4];

  return v17;
}

- (unint64_t)_primaryTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3
{
  double v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v6 = [v5 preferredContentSizeCategory];
  if (_NCSizeCategoryIsAX(v6))
  {
    if (![(NCNotificationContentView *)self maximumNumberOfPrimaryLargeTextLines])goto LABEL_10; {
  }
    }
  else if (![(NCNotificationContentView *)self maximumNumberOfPrimaryTextLines])
  {
    goto LABEL_10;
  }
  double v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  unint64_t v8 = [v7 preferredContentSizeCategory];
  if (_NCSizeCategoryIsAX(v8)) {
    unint64_t v9 = [(NCNotificationContentView *)self maximumNumberOfPrimaryLargeTextLines];
  }
  else {
    unint64_t v9 = [(NCNotificationContentView *)self maximumNumberOfPrimaryTextLines];
  }
  unint64_t v10 = v9;

  if (a3 >= v10) {
    a3 = v10;
  }
LABEL_10:

  return a3;
}

- (CGRect)_primaryLabelBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5
{
  double v6 = [(NCNotificationContentView *)self primaryText];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    [(NCNotificationContentView *)self _primaryTextBaselineOffsetForCurrentStyle];
    -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
    double v8 = NCRectWithSize();
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (unint64_t)_primarySubtitleTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4
{
  uint64_t v7 = [(NCNotificationContentView *)self primarySubtitleText];
  unint64_t v8 = [v7 length] != 0;

  double v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v10 = [v9 preferredContentSizeCategory];
  if (_NCSizeCategoryIsAX(v10)) {
    unint64_t v11 = [(NCNotificationContentView *)self maximumNumberOfPrimaryLargeTextLines];
  }
  else {
    unint64_t v11 = [(NCNotificationContentView *)self maximumNumberOfPrimaryTextLines];
  }
  unint64_t v12 = v11;

  if (v12 == 1) {
    return v8;
  }
  v14 = [(NCNotificationContentView *)self _lazyPrimarySubtitleLabel];
  v15 = [v14 text];
  objc_super v16 = [v14 font];
  unint64_t v17 = [(NCNotificationContentView *)self _cachedNumberOfMeasuredLinesForText:v15 withFont:v16 forWidth:a3 scale:a4];

  return v17;
}

- (unint64_t)_primarySubtitleTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3
{
  double v5 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v6 = [v5 preferredContentSizeCategory];
  if (_NCSizeCategoryIsAX(v6))
  {
    if (![(NCNotificationContentView *)self maximumNumberOfPrimaryLargeTextLines])goto LABEL_10; {
  }
    }
  else if (![(NCNotificationContentView *)self maximumNumberOfPrimaryTextLines])
  {
    goto LABEL_10;
  }
  uint64_t v7 = [MEMORY[0x1E4FB1438] sharedApplication];
  unint64_t v8 = [v7 preferredContentSizeCategory];
  if (_NCSizeCategoryIsAX(v8)) {
    unint64_t v9 = [(NCNotificationContentView *)self maximumNumberOfPrimaryLargeTextLines];
  }
  else {
    unint64_t v9 = [(NCNotificationContentView *)self maximumNumberOfPrimaryTextLines];
  }
  unint64_t v10 = v9;

  if (a3 >= v10) {
    a3 = v10;
  }
LABEL_10:

  return a3;
}

- (CGRect)_primarySubtitleLabelBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5
{
  double v6 = [(NCNotificationContentView *)self primarySubtitleText];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    [(NCNotificationContentView *)self _primarySubtitleTextBaselineOffsetForCurrentStyle];
    -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
    unint64_t v8 = [(NCNotificationContentView *)self primaryText];
    uint64_t v9 = [v8 length];

    if (!v9)
    {
      [(NCNotificationContentView *)self _primaryTextBaselineOffsetForCurrentStyle];
      -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
    }
    double v10 = NCRectWithSize();
  }
  else
  {
    double v10 = *MEMORY[0x1E4F1DB28];
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v13;
  result.size.width = v12;
  result.origin.y = v11;
  result.origin.x = v10;
  return result;
}

- (unint64_t)_secondaryTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4
{
  uint64_t v7 = [(NCNotificationContentView *)self _lazySecondaryTextSupportingView];
  unint64_t v8 = [(NCNotificationContentView *)self secondaryText];
  uint64_t v9 = [v8 length];

  if (a3 <= 0.0 || v9 == 0)
  {
    unint64_t v14 = 0;
  }
  else
  {
    double v11 = [(NCNotificationContentView *)self secondaryText];
    double v12 = [v11 string];
    double v13 = [v7 font];
    unint64_t v14 = [(NCNotificationContentView *)self _cachedNumberOfMeasuredLinesForText:v12 withFont:v13 forWidth:a3 scale:a4];
  }
  return v14;
}

- (unint64_t)_secondaryTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3
{
  id v5 = [(NCNotificationContentView *)self _lazySecondaryTextSupportingView];
  int64_t v6 = [(NCNotificationContentView *)self _secondaryTextNumberOfLines];
  if (a3 >= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = a3;
  }
  if (v6 <= 0) {
    return a3;
  }
  else {
    return v7;
  }
}

- (CGRect)_secondaryTextViewBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5
{
  double bottom = a4.bottom;
  unint64_t v7 = [(NCNotificationContentView *)self secondaryText];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    [(NCNotificationContentView *)self _secondaryTextBaselineOffsetForCurrentStyle];
    -[NCNotificationContentView _secondaryTextBaselineOffsetWithBaseValue:](self, "_secondaryTextBaselineOffsetWithBaseValue:");
    uint64_t v9 = [(NCNotificationContentView *)self _lazySecondaryTextSupportingView];
    double v10 = [v9 font];
    double v11 = [(NCNotificationContentView *)self secondaryText];
    double v12 = [v11 string];
    objc_msgSend(v10, "unui_effectiveLineHeightForText:", v12);

    double v13 = [(NCNotificationContentView *)self primaryText];
    uint64_t v14 = [v13 length];

    if (!v14)
    {
      [(NCNotificationContentView *)self _primaryTextBaselineOffsetForCurrentStyle];
      -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
    }
    [(NCNotificationContentView *)self _secondaryTextBaselineOffsetFromBottomWithBaseValue:bottom];
    double v15 = NCRectWithSize();
  }
  else
  {
    double v15 = *MEMORY[0x1E4F1DB28];
    double v16 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v17 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v18 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (unint64_t)_summaryTextMeasuredNumberOfLinesForWidth:(double)a3 scale:(double)a4
{
  unint64_t v7 = [(NCNotificationContentView *)self _lazySummaryLabel];
  uint64_t v8 = [v7 text];
  uint64_t v9 = [v8 length];

  if (a3 <= 0.0 || v9 == 0)
  {
    unint64_t v13 = 0;
  }
  else
  {
    double v11 = [v7 text];
    double v12 = [v7 font];
    unint64_t v13 = [(NCNotificationContentView *)self _cachedNumberOfMeasuredLinesForText:v11 withFont:v12 forWidth:a3 scale:a4];
  }
  return v13;
}

- (unint64_t)_summaryTextNumberOfLinesWithMeasuredNumberOfLines:(unint64_t)a3
{
  if (a3 >= 2) {
    return 2;
  }
  else {
    return a3;
  }
}

- (CGRect)_summaryLabelBoundsForSize:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4 andNumberOfLines:(unint64_t)a5
{
  int64_t v6 = [(NCNotificationContentView *)self summaryText];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    [(NCNotificationContentView *)self _summaryTextBaselineOffsetForCurrentStyle];
    -[NCNotificationContentView _summaryTextBaselineOffsetWithBaseValue:](self, "_summaryTextBaselineOffsetWithBaseValue:");
    uint64_t v8 = [(NCNotificationContentView *)self _lazySummaryLabel];
    uint64_t v9 = [v8 font];
    double v10 = [(NCNotificationContentView *)self summaryText];
    objc_msgSend(v9, "unui_effectiveLineHeightForText:", v10);

    double v11 = NCRectWithSize();
  }
  else
  {
    double v11 = *MEMORY[0x1E4F1DB28];
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v14 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)_invalidateNumberOfLinesCache
{
}

- (void)_clearCacheForFont:(id)a3
{
  id v8 = a3;
  double v4 = [(NSMutableDictionary *)self->_widthToFontToStringToMeasuredNumLines allKeys];
  id v5 = [v4 firstObject];

  if (v8 && v5)
  {
    int64_t v6 = [(NSMutableDictionary *)self->_widthToFontToStringToMeasuredNumLines objectForKey:v5];
    uint64_t v7 = [v6 objectForKey:v8];
    [v7 removeAllObjects];
  }
}

- (unint64_t)_cachedNumberOfMeasuredLinesForText:(id)a3 withFont:(id)a4 forWidth:(double)a5 scale:(double)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = [v9 length];
  unint64_t v12 = v11 != 0;
  if (a5 > 0.0 && v11 != 0)
  {
    UIFloorToScale();
    double v15 = v14;
    double v16 = objc_msgSend(NSNumber, "numberWithDouble:");
    id v17 = [(NSMutableDictionary *)self->_widthToFontToStringToMeasuredNumLines objectForKey:v16];
    if (!v17)
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [(NCNotificationContentView *)self _invalidateNumberOfLinesCache];
      [(NSMutableDictionary *)self->_widthToFontToStringToMeasuredNumLines setObject:v17 forKey:v16];
    }
    id v18 = [v17 objectForKey:v10];
    if (!v18)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v17 setObject:v18 forKey:v10];
    }
    v19 = [v18 objectForKey:v9];
    v20 = v19;
    if (v19)
    {
      unint64_t v12 = [v19 unsignedIntegerValue];
    }
    else
    {
      unint64_t v12 = -[NCNotificationContentView _numberOfMeasuredLinesForText:withFont:forSize:](self, "_numberOfMeasuredLinesForText:withFont:forSize:", v9, v10, v15, 1.79769313e308);
      v21 = [NSNumber numberWithUnsignedInteger:v12];
      [v18 setObject:v21 forKey:v9];
    }
  }

  return v12;
}

- (unint64_t)_numberOfMeasuredLinesForText:(id)a3 withFont:(id)a4 forSize:(CGSize)a5
{
  double height = a5.height;
  double width = a5.width;
  v17[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!self->_drawingContext)
  {
    uint64_t v11 = (NSStringDrawingContext *)objc_alloc_init(MEMORY[0x1E4FB0860]);
    drawingContext = self->_drawingContext;
    self->_drawingContext = v11;

    [(NSStringDrawingContext *)self->_drawingContext setWantsNumberOfLineFragments:1];
  }
  uint64_t v16 = *MEMORY[0x1E4FB06F8];
  v17[0] = v10;
  double v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  objc_msgSend(v9, "boundingRectWithSize:options:attributes:context:", 1, v13, self->_drawingContext, width, height);

  unint64_t v14 = [(NSStringDrawingContext *)self->_drawingContext numberOfLineFragments];
  return v14;
}

- (CGSize)_sizeThatFits:(CGSize)a3 withContentInsets:(UIEdgeInsets)a4
{
  if (a3.width <= 0.0)
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v14 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    goto LABEL_23;
  }
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  if (self->_lookStyle)
  {
    double v9 = *MEMORY[0x1E4FB2848];
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v12 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v11 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    double v11 = *MEMORY[0x1E4F91480];
    double v9 = 0.0;
    double v12 = *MEMORY[0x1E4F91480];
    double v10 = *MEMORY[0x1E4F91480];
  }
  double v40 = v9;
  CGFloat width = a3.width;
  double v15 = NCSizeApplyInsets(a3.width, a3.height, v9, v10, v12, v11);
  double v17 = NCSizeApplyInsets(v15, v16, top, left, bottom, right);
  id v18 = [(NCNotificationContentView *)self thumbnail];
  if (v18)
  {

LABEL_9:
    if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection]) {
      double v20 = 50.0;
    }
    else {
      double v20 = 35.0;
    }
    int v21 = [(NCNotificationContentView *)self _shouldReverseLayoutDirection];
    double v22 = 15.0;
    if (v21) {
      double v22 = 0.0;
    }
    double v17 = v17 - (v20 + v22);
    goto LABEL_15;
  }
  v19 = [(NCNotificationContentView *)self accessoryView];

  if (v19) {
    goto LABEL_9;
  }
LABEL_15:
  v23 = [(NCNotificationContentView *)self window];
  double v39 = v12;
  if (v23)
  {
    v24 = [(NCNotificationContentView *)self window];
    v25 = [v24 screen];
    [v25 scale];
    double v27 = v26;
  }
  else
  {
    v24 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v24 scale];
    double v27 = v28;
  }

  unint64_t v29 = [(NCNotificationContentView *)self _primaryTextNumberOfLinesWithMeasuredNumberOfLines:[(NCNotificationContentView *)self _primaryTextMeasuredNumberOfLinesForWidth:v17 scale:v27]];
  unint64_t v30 = [(NCNotificationContentView *)self _primarySubtitleTextNumberOfLinesWithMeasuredNumberOfLines:[(NCNotificationContentView *)self _primarySubtitleTextMeasuredNumberOfLinesForWidth:v17 scale:v27]];
  unint64_t v31 = [(NCNotificationContentView *)self _secondaryTextNumberOfLinesWithMeasuredNumberOfLines:[(NCNotificationContentView *)self _secondaryTextMeasuredNumberOfLinesForWidth:v17 scale:v27]];
  unint64_t v32 = [(NCNotificationContentView *)self _summaryTextNumberOfLinesWithMeasuredNumberOfLines:[(NCNotificationContentView *)self _summaryTextMeasuredNumberOfLinesForWidth:v17 scale:v27]];
  [(NCNotificationContentView *)self topMarginToPrimaryLabelForCurrentStyle];
  -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
  -[NCNotificationContentView _primaryLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_primaryLabelBoundsForSize:withContentInsets:andNumberOfLines:", v29, v17, 1.79769313e308, top, left, bottom, right);
  CGRectGetHeight(v43);
  -[NCNotificationContentView _primarySubtitleLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_primarySubtitleLabelBoundsForSize:withContentInsets:andNumberOfLines:", v30, v17, 1.79769313e308, top, left, bottom, right);
  CGRectGetHeight(v44);
  -[NCNotificationContentView _secondaryTextViewBoundsForSize:withContentInsets:andNumberOfLines:](self, "_secondaryTextViewBoundsForSize:withContentInsets:andNumberOfLines:", v31, v17, 1.79769313e308, top, left, bottom, right);
  CGFloat Height = CGRectGetHeight(v45);
  double v34 = right;
  double v35 = bottom;
  double v36 = Height;
  -[NCNotificationContentView _summaryLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_summaryLabelBoundsForSize:withContentInsets:andNumberOfLines:", v32, v17, 1.79769313e308, top, left, v35, v34);
  CGRectGetHeight(v46);
  if (fabs(v36) < 2.22044605e-16) {
    [(NCNotificationContentView *)self _secondaryTextBaselineOffsetFromBottomWithBaseValue:v35];
  }
  v37 = [(NCNotificationContentView *)self thumbnail];
  if (!v37)
  {
    [(NCNotificationContentView *)self accessoryView];
  }
  UIRoundToViewScale();
  double v14 = v39 + v40 + v38;
  double v13 = width;
LABEL_23:
  result.double height = v14;
  result.CGFloat width = v13;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[NCNotificationContentView _sizeThatFits:withContentInsets:](self, "_sizeThatFits:withContentInsets:", a3.width, a3.height, self->_contentInsets.top, self->_contentInsets.left, self->_contentInsets.bottom, self->_contentInsets.right);
  result.double height = v4;
  result.CGFloat width = v3;
  return result;
}

- (void)_updateContentInsets
{
  p_contentInsets = &self->_contentInsets;
  [(NCNotificationContentView *)self _contentInsetsForStyle:self->_lookStyle];
  p_contentInsets->double top = v3;
  p_contentInsets->double left = v4;
  p_contentInsets->double bottom = v5;
  p_contentInsets->double right = v6;
}

- (void)_updateTextAttributesForPrimaryLabel:(id)a3 withStyle:(int64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    id v18 = v6;
    if (a4 == 1)
    {
      id v7 = (id)*MEMORY[0x1E4FB2908];
      uint64_t v8 = 8;
    }
    else
    {
      double v9 = [MEMORY[0x1E4FB1438] sharedApplication];
      double v10 = [v9 preferredContentSizeCategory];
      BOOL IsAX = _NCSizeCategoryIsAX(v10);
      double v12 = (id *)MEMORY[0x1E4FB28C8];
      if (!IsAX) {
        double v12 = (id *)MEMORY[0x1E4FB2950];
      }
      id v7 = *v12;

      uint64_t v8 = 12;
    }
    double v13 = [(NCNotificationContentView *)self fontProvider];
    double v14 = [v13 preferredFontForTextStyle:v7 hiFontStyle:v8];
    [v18 setFont:v14];

    double v15 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v16 = [v15 preferredContentSizeCategory];
    if (_NCSizeCategoryIsAX(v16)) {
      unint64_t v17 = [(NCNotificationContentView *)self maximumNumberOfPrimaryLargeTextLines];
    }
    else {
      unint64_t v17 = [(NCNotificationContentView *)self maximumNumberOfPrimaryTextLines];
    }
    [v18 setNumberOfLines:v17];

    id v6 = v18;
  }
}

- (void)_updateStyleForPrimaryLabel:(id)a3 withStyle:(int64_t)a4
{
  id v7 = a3;
  objc_msgSend(v7, "mt_removeAllVisualStyling");
  if (a4 == 1)
  {
    id v6 = [MEMORY[0x1E4FB1618] labelColor];
    [v7 setTextColor:v6];
  }
  else
  {
    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:v7 withStyle:0];
  }
}

- (id)_newPrimaryLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [(NCNotificationContentView *)self _updateTextAttributesForPrimaryLabel:v3 withStyle:self->_lookStyle];
  return v3;
}

- (id)_lazyPrimaryLabel
{
  primaryLabel = self->_primaryLabel;
  if (!primaryLabel)
  {
    CGFloat v4 = [(NCNotificationContentView *)self _newPrimaryLabel];
    CGFloat v5 = self->_primaryLabel;
    self->_primaryLabel = v4;

    [(UIView *)self->_contentView addSubview:self->_primaryLabel];
    [(NCNotificationContentView *)self _updateStyleForPrimaryLabel:self->_primaryLabel withStyle:self->_lookStyle];
    primaryLabel = self->_primaryLabel;
  }

  return primaryLabel;
}

- (NSString)primaryText
{
  return [(UILabel *)self->_primaryLabel text];
}

- (void)setPrimaryText:(id)a3
{
  id v8 = a3;
  CGFloat v4 = [(NCNotificationContentView *)self primaryText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    id v6 = [(NCNotificationContentView *)self _lazyPrimaryLabel];
    id v7 = [v6 font];
    [(NCNotificationContentView *)self _clearCacheForFont:v7];

    [v6 setText:v8];
    self->_hasUpdatedContent = 1;
    [(NCNotificationContentView *)self setNeedsLayout];
  }
}

- (id)_lazyPrimarySubtitleLabel
{
  primarySubtitleLabel = self->_primarySubtitleLabel;
  if (!primarySubtitleLabel)
  {
    CGFloat v4 = [(NCNotificationContentView *)self _newPrimaryLabel];
    char v5 = self->_primarySubtitleLabel;
    self->_primarySubtitleLabel = v4;

    [(UIView *)self->_contentView addSubview:self->_primarySubtitleLabel];
    [(NCNotificationContentView *)self _updateStyleForPrimaryLabel:self->_primarySubtitleLabel withStyle:self->_lookStyle];
    primarySubtitleLabel = self->_primarySubtitleLabel;
  }

  return primarySubtitleLabel;
}

- (NSString)primarySubtitleText
{
  return [(UILabel *)self->_primarySubtitleLabel text];
}

- (void)setPrimarySubtitleText:(id)a3
{
  id v8 = a3;
  CGFloat v4 = [(NCNotificationContentView *)self primarySubtitleText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    id v6 = [(NCNotificationContentView *)self _lazyPrimarySubtitleLabel];
    id v7 = [v6 font];
    [(NCNotificationContentView *)self _clearCacheForFont:v7];

    [v6 setText:v8];
    self->_hasUpdatedContent = 1;
    [(NCNotificationContentView *)self setNeedsLayout];
  }
}

- (id)_lazyThumbnailImageView
{
  thumbnailImageView = self->_thumbnailImageView;
  if (!thumbnailImageView)
  {
    CGFloat v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    char v5 = self->_thumbnailImageView;
    self->_thumbnailImageView = v4;

    [(UIImageView *)self->_thumbnailImageView setClipsToBounds:1];
    [(NCNotificationContentView *)self _configureThumbnailAsContactImage:[(NCNotificationContentView *)self isThumbnailContactImage]];
    [(UIView *)self->_contentView addSubview:self->_thumbnailImageView];
    [(NCNotificationContentView *)self _updateContentModeForThumbnailImage:self->_thumbnailImageView];
    [(NCNotificationContentView *)self _updateStyleForThumbnailImage:self->_thumbnailImageView withStyle:self->_lookStyle];
    thumbnailImageView = self->_thumbnailImageView;
  }

  return thumbnailImageView;
}

- (void)_updateTextAttributesForSecondaryTextSupportingView:(id)a3 withStyle:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v16 = v5;
    if (self->_lookStyle == 1)
    {
      id v6 = (id)*MEMORY[0x1E4FB28C8];
    }
    else
    {
      id v7 = [MEMORY[0x1E4FB1438] sharedApplication];
      id v8 = [v7 preferredContentSizeCategory];
      BOOL IsAX = _NCSizeCategoryIsAX(v8);
      double v10 = (id *)MEMORY[0x1E4FB28C8];
      if (!IsAX) {
        double v10 = (id *)MEMORY[0x1E4FB2950];
      }
      id v6 = *v10;
    }
    double v11 = [(NCNotificationContentView *)self fontProvider];
    double v12 = [v11 preferredFontForTextStyle:v6 hiFontStyle:8];
    [v16 setFont:v12];

    double v13 = [MEMORY[0x1E4FB1438] sharedApplication];
    double v14 = [v13 preferredContentSizeCategory];
    if (_NCSizeCategoryIsAX(v14)) {
      unint64_t v15 = [(NCNotificationContentView *)self maximumNumberOfSecondaryLargeTextLines];
    }
    else {
      unint64_t v15 = [(NCNotificationContentView *)self maximumNumberOfSecondaryTextLines];
    }
    objc_msgSend(v16, "nc_setNumberOfLines:", v15);

    id v5 = v16;
  }
}

- (unint64_t)_secondaryTextNumberOfLines
{
  if (self->_lookStyle == 1)
  {
    double v2 = [(UITextView *)self->_secondaryTextView textContainer];
    unint64_t v3 = [v2 maximumNumberOfLines];

    return v3;
  }
  else
  {
    secondaryLabel = self->_secondaryLabel;
    return [(UILabel *)secondaryLabel numberOfLines];
  }
}

- (void)setMaximumNumberOfPrimaryTextLines:(unint64_t)a3
{
  if (self->_maximumNumberOfPrimaryTextLines != a3)
  {
    self->_maximumNumberOfPrimaryTextLines = a3;
    CGFloat v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v5 = [v4 preferredContentSizeCategory];
    BOOL IsAX = _NCSizeCategoryIsAX(v5);

    if (!IsAX)
    {
      [(NCNotificationContentView *)self _updateTextAttributesForPrimaryLabel:self->_primaryLabel withStyle:self->_lookStyle];
      primarySubtitleLabel = self->_primarySubtitleLabel;
      int64_t lookStyle = self->_lookStyle;
      [(NCNotificationContentView *)self _updateTextAttributesForPrimaryLabel:primarySubtitleLabel withStyle:lookStyle];
    }
  }
}

- (void)setMaximumNumberOfPrimaryLargeTextLines:(unint64_t)a3
{
  if (self->_maximumNumberOfPrimaryLargeTextLines != a3)
  {
    self->_maximumNumberOfPrimaryLargeTextLines = a3;
    CGFloat v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v5 = [v4 preferredContentSizeCategory];
    BOOL IsAX = _NCSizeCategoryIsAX(v5);

    if (IsAX)
    {
      [(NCNotificationContentView *)self _updateTextAttributesForPrimaryLabel:self->_primaryLabel withStyle:self->_lookStyle];
      primarySubtitleLabel = self->_primarySubtitleLabel;
      int64_t lookStyle = self->_lookStyle;
      [(NCNotificationContentView *)self _updateTextAttributesForPrimaryLabel:primarySubtitleLabel withStyle:lookStyle];
    }
  }
}

- (void)setMaximumNumberOfSecondaryTextLines:(unint64_t)a3
{
  if (self->_maximumNumberOfSecondaryTextLines != a3)
  {
    self->_maximumNumberOfSecondaryTextLines = a3;
    CGFloat v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v5 = [v4 preferredContentSizeCategory];
    BOOL IsAX = _NCSizeCategoryIsAX(v5);

    if (!IsAX)
    {
      id v7 = [(NCNotificationContentView *)self _secondaryTextSupportingView];
      [(NCNotificationContentView *)self _updateTextAttributesForSecondaryTextSupportingView:v7 withStyle:self->_lookStyle];
    }
  }
}

- (void)setMaximumNumberOfSecondaryLargeTextLines:(unint64_t)a3
{
  if (self->_maximumNumberOfSecondaryLargeTextLines != a3)
  {
    self->_maximumNumberOfSecondaryLargeTextLines = a3;
    CGFloat v4 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v5 = [v4 preferredContentSizeCategory];
    BOOL IsAX = _NCSizeCategoryIsAX(v5);

    if (IsAX)
    {
      id v7 = [(NCNotificationContentView *)self _secondaryTextSupportingView];
      [(NCNotificationContentView *)self _updateTextAttributesForSecondaryTextSupportingView:v7 withStyle:self->_lookStyle];
    }
  }
}

- (void)_updateStyleForSecondaryTextSupportingView:(id)a3 withStyle:(int64_t)a4
{
  id v5 = a3;
  if (v5)
  {
    id v7 = v5;
    objc_msgSend(v5, "mt_removeAllVisualStyling");
    if (self->_lookStyle == 1)
    {
      id v6 = [MEMORY[0x1E4FB1618] labelColor];
      [v7 setTextColor:v6];
    }
    else
    {
      [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:v7 withStyle:0];
    }
    id v5 = v7;
  }
}

- (void)_configureTextSupportingView:(id)a3
{
  id v3 = a3;
  [v3 setContentMode:4];
  id v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];
}

- (id)_newSecondaryLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  [v3 setLineBreakMode:4];
  [v3 _setTextAlignmentFollowsWritingDirection:1];
  [(NCNotificationContentView *)self _configureTextSupportingView:v3];
  [(NCNotificationContentView *)self _updateTextAttributesForSecondaryTextSupportingView:v3 withStyle:self->_lookStyle];
  return v3;
}

- (id)_newSecondaryTextView
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1DD8]);
  [v3 setShowsHorizontalScrollIndicator:0];
  [v3 setShowsVerticalScrollIndicator:0];
  [v3 setEditable:0];
  [v3 setSelectable:self->_lookStyle == 1];
  [v3 setDataDetectorTypes:3];
  [v3 _setInteractiveTextSelectionDisabled:1];
  [v3 setScrollEnabled:0];
  [(NCNotificationContentView *)self _configureTextSupportingView:v3];
  id v4 = [v3 textContainer];
  [v4 setLineFragmentPadding:0.0];

  id v5 = [v3 textContainer];
  [v5 setLineBreakMode:4];

  [(NCNotificationContentView *)self _updateTextAttributesForSecondaryTextSupportingView:v3 withStyle:self->_lookStyle];
  id v6 = [v3 layoutManager];
  [v6 setSynchronizesAlignmentToDirection:1];

  id v7 = [v3 layoutManager];
  [v7 setLimitsLayoutForSuspiciousContents:1];

  if (self->_lookStyle == 1) {
    [v3 setDelegate:self];
  }
  return v3;
}

- (id)_secondaryTextSupportingView
{
  if (self->_lookStyle == 1) {
    double v2 = &OBJC_IVAR___NCNotificationContentView__secondaryTextView;
  }
  else {
    double v2 = &OBJC_IVAR___NCNotificationContentView__secondaryLabel;
  }
  return *(id *)((char *)&self->super.super.super.isa + *v2);
}

- (id)_lazySecondaryLabel
{
  secondaryLabel = self->_secondaryLabel;
  if (!secondaryLabel)
  {
    if (self->_lookStyle == 1)
    {
      secondaryLabel = 0;
    }
    else
    {
      id v4 = [(NCNotificationContentView *)self _newSecondaryLabel];
      id v5 = self->_secondaryLabel;
      self->_secondaryLabel = v4;

      [(UIView *)self->_contentView addSubview:self->_secondaryLabel];
      [(NCNotificationContentView *)self _updateStyleForSecondaryTextSupportingView:self->_secondaryLabel withStyle:self->_lookStyle];
      secondaryLabel = self->_secondaryLabel;
    }
  }

  return secondaryLabel;
}

- (id)_lazySecondaryTextView
{
  secondaryTextView = self->_secondaryTextView;
  if (!secondaryTextView)
  {
    if (self->_lookStyle == 1)
    {
      id v4 = [(NCNotificationContentView *)self _newSecondaryTextView];
      id v5 = self->_secondaryTextView;
      self->_secondaryTextView = v4;

      [(UIView *)self->_contentView addSubview:self->_secondaryTextView];
      [(NCNotificationContentView *)self _updateStyleForSecondaryTextSupportingView:self->_secondaryTextView withStyle:self->_lookStyle];
      secondaryTextView = self->_secondaryTextView;
    }
    else
    {
      secondaryTextView = 0;
    }
  }

  return secondaryTextView;
}

- (id)_lazySecondaryTextSupportingView
{
  id v3 = [(NCNotificationContentView *)self _secondaryTextSupportingView];
  if (!v3)
  {
    if (self->_lookStyle == 1) {
      [(NCNotificationContentView *)self _lazySecondaryTextView];
    }
    else {
    id v3 = [(NCNotificationContentView *)self _lazySecondaryLabel];
    }
  }

  return v3;
}

- (NSAttributedString)secondaryText
{
  double v2 = [(NCNotificationContentView *)self _secondaryTextSupportingView];
  id v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setSecondaryText:(id)a3
{
  id v10 = a3;
  id v4 = [(NCNotificationContentView *)self secondaryText];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = [(NCNotificationContentView *)self _lazySecondaryTextSupportingView];
    id v7 = [v6 font];
    [(NCNotificationContentView *)self _clearCacheForFont:v7];

    id v8 = [(NCNotificationContentView *)self _lazySecondaryTextSupportingView];
    double v9 = [v8 textColor];
    [v8 setAttributedText:v10];
    [v8 setTextColor:v9];
    [(NCNotificationContentView *)self _updateTextAttributesForSecondaryTextSupportingView:v8 withStyle:self->_lookStyle];
    self->_hasUpdatedContent = 1;
    [(NCNotificationContentView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForSummaryLabel:(id)a3 withStyle:(int64_t)a4
{
  if (a3)
  {
    id v7 = a3;
    char v5 = [(NCNotificationContentView *)self fontProvider];
    id v6 = [v5 preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] hiFontStyle:8];
    [v7 setFont:v6];

    [v7 setNumberOfLines:2];
  }
}

- (void)_updateStyleForSummaryLabel:(id)a3 withStyle:(int64_t)a4
{
  id v5 = a3;
  objc_msgSend(v5, "mt_removeAllVisualStyling");
  [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:v5 withStyle:1];
}

- (id)_newSummaryLabel
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F4F8B0]);
  [(NCNotificationContentView *)self _updateTextAttributesForSummaryLabel:v3 withStyle:self->_lookStyle];
  return v3;
}

- (id)_lazySummaryLabel
{
  summaryLabel = self->_summaryLabel;
  if (!summaryLabel)
  {
    id v4 = [(NCNotificationContentView *)self _newSummaryLabel];
    id v5 = self->_summaryLabel;
    self->_summaryLabel = v4;

    [(NCNotificationContentView *)self _updateStyleForSummaryLabel:self->_summaryLabel withStyle:self->_lookStyle];
    [(UIView *)self->_contentView addSubview:self->_summaryLabel];
    [(BSUIEmojiLabelView *)self->_summaryLabel setAccessibilityIdentifier:@"summary-label"];
    summaryLabel = self->_summaryLabel;
  }

  return summaryLabel;
}

- (NSString)summaryText
{
  return (NSString *)[(BSUIEmojiLabelView *)self->_summaryLabel text];
}

- (void)setSummaryText:(id)a3
{
  id v8 = a3;
  id v4 = [(NCNotificationContentView *)self summaryText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    id v6 = [(NCNotificationContentView *)self _lazySummaryLabel];
    id v7 = [v6 font];
    [(NCNotificationContentView *)self _clearCacheForFont:v7];

    [v6 setText:v8];
    self->_hasUpdatedContent = 1;
    [(NCNotificationContentView *)self setNeedsLayout];
  }
}

- (UIImage)thumbnail
{
  return [(UIImageView *)self->_thumbnailImageView image];
}

- (void)setThumbnail:(id)a3
{
  id v7 = a3;
  id v4 = [(NCNotificationContentView *)self thumbnail];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    id v6 = [(NCNotificationContentView *)self _lazyThumbnailImageView];
    [v6 setImage:v7];
    [(NCNotificationContentView *)self _updateContentModeForThumbnailImage:self->_thumbnailImageView];
    [(NCNotificationContentView *)self _updateStyleForThumbnailImage:self->_thumbnailImageView withStyle:self->_lookStyle];
    self->_hasUpdatedContent = 1;
    [(NCNotificationContentView *)self setNeedsLayout];
  }
}

- (void)setThumbnailIsContactImage:(BOOL)a3
{
  if (self->_thumbnailIsContactImage != a3)
  {
    self->_thumbnailIsContactImage = a3;
    -[NCNotificationContentView _configureThumbnailAsContactImage:](self, "_configureThumbnailAsContactImage:");
  }
}

- (unint64_t)primaryTextMaximumNumberOfLines
{
  return 0;
}

- (unint64_t)primarySubtitleTextMaximumNumberOfLines
{
  return 0;
}

- (unint64_t)secondaryTextMaximumNumberOfLines
{
  return 0;
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCNotificationContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
  }
}

- (void)_updateContentModeForThumbnailImage:(id)a3
{
  thumbnailImageView = self->_thumbnailImageView;
  id v5 = [a3 image];
  if ([v5 isSymbolImage]) {
    uint64_t v4 = 4;
  }
  else {
    uint64_t v4 = 1;
  }
  [(UIImageView *)thumbnailImageView setContentMode:v4];
}

- (void)_updateStyleForThumbnailImage:(id)a3 withStyle:(int64_t)a4
{
  id v8 = a3;
  objc_msgSend(v8, "mt_removeAllVisualStyling");
  id v6 = [v8 image];
  int v7 = [v6 isSymbolImage];

  if (a4 != 1 && v7) {
    [(MTVisualStylingProvider *)self->_visualStylingProvider automaticallyUpdateView:v8 withStyle:0];
  }
}

- (void)setAccessoryView:(id)a3
{
  id v5 = (UIView *)a3;
  accessoryView = self->_accessoryView;
  int v7 = v5;
  if (accessoryView != v5)
  {
    [(UIView *)accessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(UIView *)self->_contentView addSubview:v7];
  }
}

- (void)setUseSmallTopMargin:(BOOL)a3
{
  if (self->_useSmallTopMargin != a3)
  {
    self->_useSmallTopMargin = a3;
    [(NCNotificationContentView *)self setNeedsLayout];
  }
}

- (BSUIFontProvider)fontProvider
{
  if (!self->_fontProvider)
  {
    if ([(NCNotificationContentView *)self adjustsFontForContentSizeCategory]) {
      [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    }
    else {
    id v3 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    }
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;
  }
  id v5 = self->_fontProvider;

  return v5;
}

- (void)setFontProvider:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_fontProvider, a3);
    [(NCNotificationContentView *)self _updateTextAttributesForPrimaryLabel:self->_primaryLabel withStyle:self->_lookStyle];
    [(NCNotificationContentView *)self _updateTextAttributesForPrimaryLabel:self->_primarySubtitleLabel withStyle:self->_lookStyle];
    id v5 = [(NCNotificationContentView *)self _secondaryTextSupportingView];
    [(NCNotificationContentView *)self _updateTextAttributesForSecondaryTextSupportingView:v5 withStyle:self->_lookStyle];

    [(NCNotificationContentView *)self _updateTextAttributesForSummaryLabel:self->_summaryLabel withStyle:self->_lookStyle];
    [(NCNotificationContentView *)self setNeedsLayout];
  }
}

- (CGRect)_frameForThumbnailInRect:(CGRect)a3 withContentViewInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double left = a4.left;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection])
  {
    int v11 = [(NCNotificationContentView *)self _shouldReverseLayoutDirection];
    double v12 = 0.0;
    if (v11) {
      double v12 = 15.0;
    }
    double v13 = v12 - left;
  }
  else
  {
    v21.origin.CGFloat x = x;
    v21.origin.CGFloat y = y;
    v21.size.CGFloat width = width;
    v21.size.CGFloat height = height;
    double v14 = CGRectGetWidth(v21);
    if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection]) {
      double v15 = 15.0;
    }
    else {
      double v15 = 0.0;
    }
    double v16 = v14 - v15 + -35.0;
    if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection]) {
      double v17 = 0.0;
    }
    else {
      double v17 = 15.0;
    }
    double v13 = v16 - v17 - right;
  }
  double v18 = 35.0;
  double v19 = 0.0;
  double v20 = 35.0;
  result.size.CGFloat height = v20;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v19;
  result.origin.CGFloat x = v13;
  return result;
}

- (void)_configureThumbnailAsContactImage:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIImageView *)self->_thumbnailImageView layer];
  id v6 = v5;
  double v7 = 17.5;
  if (v3)
  {
    id v8 = (void *)MEMORY[0x1E4F39EA0];
  }
  else
  {
    double v7 = 3.0;
    id v8 = (void *)MEMORY[0x1E4F39EA8];
  }
  [v5 setCornerRadius:v7];

  id v9 = [(UIImageView *)self->_thumbnailImageView layer];
  [v9 setCornerCurve:*v8];
}

- (void)layoutSubviews
{
  [(NCNotificationContentView *)self bounds];
  if (CGRectGetWidth(v4) > 0.0)
  {
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __43__NCNotificationContentView_layoutSubviews__block_invoke;
    v3[3] = &unk_1E6A91BB0;
    v3[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
    if (self->_hasUpdatedContent)
    {
      [(NCNotificationContentView *)self pl_performCrossFadeIfNecessary];
      self->_hasUpdatedContent = 0;
    }
  }
}

uint64_t __43__NCNotificationContentView_layoutSubviews__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layoutSubviews];
}

- (void)_layoutSubviews
{
  [(NCNotificationContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  int v11 = [(NCNotificationContentView *)self window];
  if (v11)
  {
    double v12 = [(NCNotificationContentView *)self window];
    double v13 = [v12 screen];
    [v13 scale];
    double v15 = v14;
  }
  else
  {
    double v12 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v12 scale];
    double v15 = v16;
  }
  double v161 = v15;

  if (self->_lookStyle)
  {
    double v17 = *MEMORY[0x1E4FB2848];
    double v18 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v20 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v19 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  }
  else
  {
    [(NCNotificationContentView *)self _shouldReverseLayoutDirection];
    double v19 = *MEMORY[0x1E4F91480];
    double v17 = 0.0;
    double v20 = *MEMORY[0x1E4F91480];
    double v18 = *MEMORY[0x1E4F91480];
  }
  NCRectApplyInsets();
  double v149 = v22;
  double v150 = v21;
  double v163 = v24;
  double v164 = v23;
  v25 = [(NCNotificationContentView *)self thumbnail];
  if (v25)
  {
  }
  else
  {
    double v26 = [(NCNotificationContentView *)self accessoryView];

    if (!v26)
    {
      int v42 = 0;
      double v155 = *MEMORY[0x1E4F1DB28];
      double v157 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double rect = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      CGFloat v148 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
      double left = self->_contentInsets.left;
      double right = self->_contentInsets.right;
      double bottom = self->_contentInsets.bottom;
      double top = self->_contentInsets.top;
      goto LABEL_19;
    }
  }
  -[NCNotificationContentView _frameForThumbnailInRect:withContentViewInsets:](self, "_frameForThumbnailInRect:withContentViewInsets:", v4, v6, v8, v10, v17, v18, v20, v19);
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;
  double v34 = v33;
  double left = self->_contentInsets.left;
  double top = self->_contentInsets.top;
  double right = self->_contentInsets.right;
  double bottom = self->_contentInsets.bottom;
  int v37 = [(NCNotificationContentView *)self _shouldReverseLayoutDirection];
  if ([(NCNotificationContentView *)self _shouldReverseLayoutDirection]) {
    double v38 = 50.0;
  }
  else {
    double v38 = 35.0;
  }
  int v39 = [(NCNotificationContentView *)self _shouldReverseLayoutDirection];
  double v40 = 15.0;
  if (v39) {
    double v40 = 0.0;
  }
  double v41 = v38 + v40;
  double v155 = v28;
  double v157 = v30;
  double rect = v32;
  CGFloat v148 = v34;
  if (v37) {
    double left = left + v41;
  }
  else {
    double right = right + v41;
  }
  int v42 = 1;
LABEL_19:
  double v162 = left;
  NCRectApplyInsets();
  double Width = CGRectGetWidth(v166);
  unint64_t v43 = [(NCNotificationContentView *)self _primaryTextNumberOfLinesWithMeasuredNumberOfLines:[(NCNotificationContentView *)self _primaryTextMeasuredNumberOfLinesForWidth:Width scale:v161]];
  double v153 = right;
  -[NCNotificationContentView _primaryLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_primaryLabelBoundsForSize:withContentInsets:andNumberOfLines:", v43, v164, v163, top, left, bottom, right);
  CGFloat v45 = v44;
  CGFloat v47 = v46;
  CGFloat v49 = v48;
  CGFloat v51 = v50;
  -[UILabel setBounds:](self->_primaryLabel, "setBounds:");
  [(NCNotificationContentView *)self topMarginToPrimaryLabelForCurrentStyle];
  -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
  [(NCNotificationContentView *)self _primaryTextBaselineOffsetForCurrentStyle];
  -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
  [(UILabel *)self->_primaryLabel _firstLineBaselineOffsetFromBoundsTop];
  v167.origin.CGFloat x = v45;
  v167.origin.CGFloat y = v47;
  v167.size.CGFloat width = v49;
  v167.size.CGFloat height = v51;
  CGRectGetWidth(v167);
  v168.origin.CGFloat x = v45;
  v168.origin.CGFloat y = v47;
  v168.size.CGFloat width = v49;
  v168.size.CGFloat height = v51;
  CGRectGetHeight(v168);
  UIRectIntegralWithScale();
  double v146 = v53;
  double v147 = v52;
  double v144 = v55;
  double v145 = v54;
  if (v43) {
    int v56 = v42;
  }
  else {
    int v56 = 0;
  }
  if (v56 == 1)
  {
    v57 = [(UILabel *)self->_primaryLabel font];
    [v57 capHeight];
    UICeilToScale();
    double v157 = v58;

LABEL_25:
    double v59 = right;
    v60 = [(UILabel *)self->_primaryLabel font];
    v61 = [(NCNotificationContentView *)self primaryText];
    objc_msgSend(v60, "unui_effectiveLineHeightForText:", v61);

    goto LABEL_26;
  }
  if (v43) {
    goto LABEL_25;
  }
  double v59 = right;
LABEL_26:
  unint64_t v62 = [(NCNotificationContentView *)self _primarySubtitleTextNumberOfLinesWithMeasuredNumberOfLines:[(NCNotificationContentView *)self _primarySubtitleTextMeasuredNumberOfLinesForWidth:Width scale:v161]];
  -[NCNotificationContentView _primarySubtitleLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_primarySubtitleLabelBoundsForSize:withContentInsets:andNumberOfLines:", v62, v164, v163, top, v162, bottom, v59);
  CGFloat v64 = v63;
  CGFloat v66 = v65;
  CGFloat v68 = v67;
  CGFloat v70 = v69;
  -[UILabel setBounds:](self->_primarySubtitleLabel, "setBounds:");
  if (v43)
  {
    [(NCNotificationContentView *)self _primarySubtitleTextBaselineOffsetForCurrentStyle];
    -[NCNotificationContentView _primaryTextBaselineOffsetWithBaseValue:](self, "_primaryTextBaselineOffsetWithBaseValue:");
  }
  [(UILabel *)self->_primarySubtitleLabel _firstLineBaselineOffsetFromBoundsTop];
  v169.origin.CGFloat x = v64;
  v169.origin.CGFloat y = v66;
  v169.size.CGFloat width = v68;
  v169.size.CGFloat height = v70;
  CGRectGetWidth(v169);
  v170.origin.CGFloat x = v64;
  v170.origin.CGFloat y = v66;
  v170.size.CGFloat width = v68;
  v170.size.CGFloat height = v70;
  CGRectGetHeight(v170);
  UIRectIntegralWithScale();
  double v142 = v72;
  double v143 = v71;
  double v140 = v74;
  double v141 = v73;
  if (v43) {
    char v75 = 1;
  }
  else {
    char v75 = v42 ^ 1;
  }
  if ((v75 & 1) != 0 || !v62)
  {
    double v78 = v153;
    if (!v62) {
      goto LABEL_36;
    }
  }
  else
  {
    v76 = [(UILabel *)self->_primarySubtitleLabel font];
    [v76 capHeight];
    UICeilToScale();
    double v157 = v77;

    int v56 = 1;
    double v78 = v153;
  }
  v79 = [(UILabel *)self->_primarySubtitleLabel font];
  v80 = [(NCNotificationContentView *)self primarySubtitleText];
  objc_msgSend(v79, "unui_effectiveLineHeightForText:", v80);

LABEL_36:
  unint64_t v81 = [(NCNotificationContentView *)self _secondaryTextNumberOfLinesWithMeasuredNumberOfLines:[(NCNotificationContentView *)self _secondaryTextMeasuredNumberOfLinesForWidth:Width scale:v161]];
  -[NCNotificationContentView _secondaryTextViewBoundsForSize:withContentInsets:andNumberOfLines:](self, "_secondaryTextViewBoundsForSize:withContentInsets:andNumberOfLines:", v81, v164, v163, top, v162, bottom, v78);
  double v83 = v82;
  double v85 = v84;
  double v87 = v86;
  double v89 = v88;
  id v152 = [(NCNotificationContentView *)self _secondaryTextSupportingView];
  objc_msgSend(v152, "setBounds:", v83, v85, v87, v89);
  if (v43 | v62)
  {
    [(NCNotificationContentView *)self _secondaryTextBaselineOffsetForCurrentStyle];
    -[NCNotificationContentView _secondaryTextBaselineOffsetWithBaseValue:](self, "_secondaryTextBaselineOffsetWithBaseValue:");
  }
  secondaryTextView = self->_secondaryTextView;
  if (secondaryTextView
    && ([(UITextView *)secondaryTextView textContainerInset],
        (v91 = self->_secondaryTextView) != 0))
  {
    v92 = [(UITextView *)v91 layoutManager];
    [v92 baselineOffsetForGlyphAtIndex:0];
  }
  else
  {
    [(UILabel *)self->_secondaryLabel _firstLineBaselineOffsetFromBoundsTop];
  }
  v171.origin.CGFloat x = v83;
  v171.origin.CGFloat y = v85;
  v171.size.CGFloat width = v87;
  v171.size.CGFloat height = v89;
  CGRectGetWidth(v171);
  v172.origin.CGFloat x = v83;
  v172.origin.CGFloat y = v85;
  v172.size.CGFloat width = v87;
  v172.size.CGFloat height = v89;
  CGRectGetHeight(v172);
  double v93 = v162;
  double v94 = v161;
  UIRectIntegralWithScale();
  double v96 = v95;
  double v98 = v97;
  double v138 = v100;
  double v139 = v99;
  if ((v56 | v42 ^ 1))
  {
    double v101 = v155;
    double v102 = v157;
    double v103 = v153;
  }
  else
  {
    v104 = [(NCNotificationContentView *)self secondaryText];
    uint64_t v105 = [v104 length];

    double v101 = v155;
    double v102 = v157;
    double v103 = v153;
    if (v105)
    {
      v106 = [v152 font];
      [v106 capHeight];
      UICeilToScale();
      double v102 = v107;
    }
  }
  CGFloat v156 = v101;
  if (v81)
  {
    v108 = [v152 font];
    v109 = [(NCNotificationContentView *)self secondaryText];
    v110 = [v109 string];
    objc_msgSend(v108, "unui_effectiveLineHeightForText:", v110);
  }
  unint64_t v111 = v62 + v43 + v81;
  if (v42)
  {
    if (v111 == 1)
    {
      double v135 = _NCMainScreenScale();
      UIRectCenteredYInRectScale();
      double v94 = v161;
      double v93 = v162;
    }
    else
    {
      UIRectIntegralWithScale();
    }
    CGFloat v156 = v112;
    double rect = v114;
    CGFloat v148 = v115;
    CGFloat MinY = CGRectGetMinY(*(CGRect *)&v112);
    double v102 = (double)((int)MinY & ~((int)MinY >> 31));
  }
  -[NCNotificationContentView _summaryLabelBoundsForSize:withContentInsets:andNumberOfLines:](self, "_summaryLabelBoundsForSize:withContentInsets:andNumberOfLines:", -[NCNotificationContentView _summaryTextNumberOfLinesWithMeasuredNumberOfLines:](self, "_summaryTextNumberOfLinesWithMeasuredNumberOfLines:", -[NCNotificationContentView _summaryTextMeasuredNumberOfLinesForWidth:scale:](self, "_summaryTextMeasuredNumberOfLinesForWidth:scale:", Width, v94, *(void *)&v135)), v164, v163, top, v93, bottom, v103);
  CGFloat v118 = v117;
  CGFloat v120 = v119;
  CGFloat v122 = v121;
  CGFloat v124 = v123;
  -[BSUIEmojiLabelView setBounds:](self->_summaryLabel, "setBounds:");
  double v136 = v98;
  double v137 = v96;
  double v158 = v102;
  if (v111 <= 1)
  {
    double v126 = v156;
    v173.origin.CGFloat x = v156;
    v173.origin.CGFloat y = v102;
    v173.size.CGFloat width = rect;
    double v125 = v148;
    v173.size.CGFloat height = v148;
    CGRectGetMaxY(v173);
  }
  else
  {
    double v125 = v148;
    double v126 = v156;
  }
  [(NCNotificationContentView *)self _summaryTextBaselineOffsetForCurrentStyle];
  -[NCNotificationContentView _summaryTextBaselineOffsetWithBaseValue:](self, "_summaryTextBaselineOffsetWithBaseValue:");
  [(BSUIEmojiLabelView *)self->_summaryLabel _firstLineBaselineOffsetFromBoundsTop];
  v174.origin.CGFloat x = v118;
  v174.origin.CGFloat y = v120;
  v174.size.CGFloat width = v122;
  v174.size.CGFloat height = v124;
  CGRectGetWidth(v174);
  v175.origin.CGFloat x = v118;
  v175.origin.CGFloat y = v120;
  v175.size.CGFloat width = v122;
  v175.size.CGFloat height = v124;
  CGRectGetHeight(v175);
  UIRectIntegralWithScale();
  double v128 = v127;
  double v130 = v129;
  double v132 = v131;
  double v134 = v133;
  -[UIView setFrame:](self->_contentView, "setFrame:", v150, v149, v164, v163);
  -[UILabel setFrame:](self->_primaryLabel, "setFrame:", v147, v146, v145, v144);
  -[UILabel setFrame:](self->_primarySubtitleLabel, "setFrame:", v143, v142, v141, v140);
  objc_msgSend(v152, "setFrame:", v137, v136, v139, v138);
  -[BSUIEmojiLabelView setFrame:](self->_summaryLabel, "setFrame:", v128, v130, v132, v134);
  -[UIImageView setFrame:](self->_thumbnailImageView, "setFrame:", v126, v158, rect, v125);
  -[UIView setFrame:](self->_accessoryView, "setFrame:", v126, v158, rect, v125);
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (a3 == 1) {
    return self->_visualStylingProvider;
  }
  else {
    return 0;
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F84670;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  double v7 = (MTVisualStylingProvider *)a3;
  if (a4 == 1)
  {
    p_visualStylingProvider = &self->_visualStylingProvider;
    visualStylingProvider = self->_visualStylingProvider;
    if (visualStylingProvider != v7)
    {
      double v13 = v7;
      [(MTVisualStylingProvider *)visualStylingProvider stopAutomaticallyUpdatingView:self->_primaryLabel];
      [(MTVisualStylingProvider *)*p_visualStylingProvider stopAutomaticallyUpdatingView:self->_primarySubtitleLabel];
      double v10 = *p_visualStylingProvider;
      int v11 = [(NCNotificationContentView *)self _secondaryTextSupportingView];
      [(MTVisualStylingProvider *)v10 stopAutomaticallyUpdatingView:v11];

      [(MTVisualStylingProvider *)*p_visualStylingProvider stopAutomaticallyUpdatingView:self->_summaryLabel];
      [(MTVisualStylingProvider *)*p_visualStylingProvider stopAutomaticallyUpdatingView:self->_thumbnailImageView];
      objc_storeStrong((id *)&self->_visualStylingProvider, a3);
      [(NCNotificationContentView *)self _updateStyleForPrimaryLabel:self->_primaryLabel withStyle:self->_lookStyle];
      [(NCNotificationContentView *)self _updateStyleForPrimaryLabel:self->_primarySubtitleLabel withStyle:self->_lookStyle];
      double v12 = [(NCNotificationContentView *)self _secondaryTextSupportingView];
      [(NCNotificationContentView *)self _updateStyleForSecondaryTextSupportingView:v12 withStyle:self->_lookStyle];

      [(NCNotificationContentView *)self _updateStyleForSummaryLabel:self->_summaryLabel withStyle:self->_lookStyle];
      [(NCNotificationContentView *)self _updateStyleForThumbnailImage:self->_thumbnailImageView withStyle:self->_lookStyle];
      [(NCNotificationContentView *)self setNeedsDisplay];
      double v7 = v13;
    }
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategorCGFloat y = a3;
    if (a3)
    {
      double v4 = [MEMORY[0x1E4FB1438] sharedApplication];
      double v5 = [v4 preferredContentSizeCategory];
      [(NCNotificationContentView *)self setPreferredContentSizeCategory:v5];
    }
    [(NCNotificationContentView *)self adjustForContentSizeCategoryChange];
  }
}

- (NSString)preferredContentSizeCategory
{
  p_preferredContentSizeCategorCGFloat y = &self->_preferredContentSizeCategory;
  preferredContentSizeCategorCGFloat y = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E4FB27F0]);
    preferredContentSizeCategorCGFloat y = *p_preferredContentSizeCategory;
  }

  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  double v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  double v4 = [v3 preferredContentSizeCategory];

  double v5 = [(NCNotificationContentView *)self preferredContentSizeCategory];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(NCNotificationContentView *)self setPreferredContentSizeCategory:v4];
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    [(NCNotificationContentView *)self _updateContentInsets];
    [(NCNotificationContentView *)self _invalidateNumberOfLinesCache];
    [(NCNotificationContentView *)self _updateTextAttributesForPrimaryLabel:self->_primaryLabel withStyle:self->_lookStyle];
    [(NCNotificationContentView *)self _updateTextAttributesForPrimaryLabel:self->_primarySubtitleLabel withStyle:self->_lookStyle];
    double v8 = [(NCNotificationContentView *)self _secondaryTextSupportingView];
    [(NCNotificationContentView *)self _updateTextAttributesForSecondaryTextSupportingView:v8 withStyle:self->_lookStyle];

    [(NCNotificationContentView *)self _updateTextAttributesForSummaryLabel:self->_summaryLabel withStyle:self->_lookStyle];
  }

  return v6 ^ 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationContentView;
  [(NCNotificationContentView *)&v4 traitCollectionDidChange:a3];
  if ([(NCNotificationContentView *)self adjustsFontForContentSizeCategory]) {
    [(NCNotificationContentView *)self adjustForContentSizeCategoryChange];
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v9 = a4;
  if (!a6 && self->_secondaryTextView == a3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained notificationContentView:self willInteractWithURL:v9];
    }
    int v11 = dispatch_get_global_queue(25, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __80__NCNotificationContentView_textView_shouldInteractWithURL_inRange_interaction___block_invoke;
    block[3] = &unk_1E6A91BB0;
    id v14 = v9;
    dispatch_async(v11, block);
  }
  return 0;
}

void __80__NCNotificationContentView_textView_shouldInteractWithURL_inRange_interaction___block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(a1 + 32);
  double v3 = (void *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithURL:*(void *)(a1 + 32)];
  if ([v3 isValid])
  {
    [v3 setShowUIPrompt:1];
    uint64_t v4 = [v3 URL];

    id v2 = (id)v4;
  }
  double v5 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  uint64_t v6 = *MEMORY[0x1E4F626A0];
  v8[0] = *MEMORY[0x1E4F62688];
  v8[1] = v6;
  v9[0] = MEMORY[0x1E4F1CC38];
  v9[1] = MEMORY[0x1E4F1CC38];
  double v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v5 openSensitiveURL:v2 withOptions:v7 error:0];
}

- (id)textView:(id)a3 writingToolsIgnoredRangesInEnclosingRange:(_NSRange)a4
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a4.location, a4.length);
  v7[0] = v4;
  double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

  return v5;
}

- (NSString)debugDescription
{
  return (NSString *)[(NCNotificationContentView *)self descriptionWithMultilinePrefix:0];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  double v3 = [(NCNotificationContentView *)self descriptionBuilderWithMultilinePrefix:a3];
  uint64_t v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x1E4F4F718];
  id v5 = a3;
  uint64_t v6 = [v4 builderWithObject:self];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__NCNotificationContentView_descriptionBuilderWithMultilinePrefix___block_invoke;
  v10[3] = &unk_1E6A91A68;
  id v7 = v6;
  id v11 = v7;
  double v12 = self;
  [v7 appendBodySectionWithName:0 multilinePrefix:v5 block:v10];

  id v8 = v7;
  return v8;
}

id __67__NCNotificationContentView_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) primaryText];
  [v2 appendString:v3 withName:@"primaryText" skipIfEmpty:1];

  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) primarySubtitleText];
  [v4 appendString:v5 withName:@"primarySubtitleText" skipIfEmpty:1];

  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) secondaryText];
  id v8 = (id)[v6 appendObject:v7 withName:@"secondaryText" skipIfNil:1];

  id v9 = *(void **)(a1 + 32);
  double v10 = [*(id *)(a1 + 40) thumbnail];
  id v11 = (id)[v9 appendObject:v10 withName:@"thumbnail" skipIfNil:1];

  double v12 = *(void **)(a1 + 32);
  double v13 = [*(id *)(a1 + 40) accessoryView];
  id v14 = (id)[v12 appendObject:v13 withName:@"accessoryView" skipIfNil:1];

  id v15 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfPrimaryTextLines"), @"maximumNumberOfPrimaryTextLines");
  id v16 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfPrimaryLargeTextLines"), @"maximumNumberOfPrimaryLargeTextLines");
  id v17 = (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfSecondaryTextLines"), @"maximumNumberOfSecondaryTextLines");
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendUnsignedInteger:withName:", objc_msgSend(*(id *)(a1 + 40), "maximumNumberOfSecondaryLargeTextLines"), @"maximumNumberOfSecondaryLargeTextLines");
}

- (unint64_t)maximumNumberOfSecondaryTextLines
{
  return self->_maximumNumberOfSecondaryTextLines;
}

- (UILabel)_secondaryLabel
{
  return self->_secondaryLabel;
}

- (UITextView)_secondaryTextView
{
  return self->_secondaryTextView;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NCNotificationContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isThumbnailContactImage
{
  return self->_thumbnailIsContactImage;
}

- (UIView)accessoryView
{
  return self->_accessoryView;
}

- (unint64_t)maximumNumberOfPrimaryTextLines
{
  return self->_maximumNumberOfPrimaryTextLines;
}

- (unint64_t)maximumNumberOfPrimaryLargeTextLines
{
  return self->_maximumNumberOfPrimaryLargeTextLines;
}

- (unint64_t)maximumNumberOfSecondaryLargeTextLines
{
  return self->_maximumNumberOfSecondaryLargeTextLines;
}

- (BOOL)useSmallTopMargin
{
  return self->_useSmallTopMargin;
}

- (void)_setPrimaryLabel:(id)a3
{
}

- (void)_setPrimarySubtitleLabel:(id)a3
{
}

- (void)_setSummaryLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryLabel, 0);
  objc_storeStrong((id *)&self->_primarySubtitleLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_accessoryView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_secondaryTextView, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_visualStylingProvider, 0);
  objc_storeStrong((id *)&self->_drawingContext, 0);
  objc_storeStrong((id *)&self->_widthToFontToStringToMeasuredNumLines, 0);
  objc_storeStrong((id *)&self->_thumbnailImageView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end