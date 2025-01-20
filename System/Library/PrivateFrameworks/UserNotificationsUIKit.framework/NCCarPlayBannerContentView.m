@interface NCCarPlayBannerContentView
+ (id)_textColor;
- (BOOL)_hasSubtitle;
- (BOOL)_shouldShowOKButton;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)canBecomeFirstResponder;
- (BOOL)isDateAllDay;
- (BOOL)screenCaptureProhibited;
- (CGSize)sizeThatFits:(CGSize)result;
- (NCBadgedIconView)badgedIconView;
- (NCCarPlayBannerContentView)init;
- (NCCarPlayBannerContentViewDelegate)delegate;
- (NSArray)requiredVisualStyleCategories;
- (NSDate)date;
- (NSString)primarySubtitleText;
- (NSString)primaryText;
- (NSTimeZone)timeZone;
- (UIEdgeInsets)_iconImageInsets;
- (id)_boundedTraitCollectionForLabelFont;
- (id)_defaultRelevanceDateFont;
- (id)_primaryFont;
- (id)_subtitleFont;
- (int64_t)dateFormatStyle;
- (unint64_t)primarySubtitleTextMaximumNumberOfLines;
- (unint64_t)primaryTextMaximumNumberOfLines;
- (void)_layoutForButton:(id)a3 contentFrame:(CGRect)a4;
- (void)_reloadDisplayPropertiesIfNecessary;
- (void)_setRelevanceDate:(id)a3 allDay:(BOOL)a4 timeZone:(id)a5 style:(int64_t)a6;
- (void)_updateButtonStates;
- (void)dealloc;
- (void)invalidateDisplayProperties;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setBadgedIconView:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateAllDay:(BOOL)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPrimarySubtitleText:(id)a3;
- (void)setPrimarySubtitleTextMaximumNumberOfLines:(unint64_t)a3;
- (void)setPrimaryText:(id)a3;
- (void)setPrimaryTextMaximumNumberOfLines:(unint64_t)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setTimeZone:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCCarPlayBannerContentView

- (NCCarPlayBannerContentView)init
{
  v19.receiver = self;
  v19.super_class = (Class)NCCarPlayBannerContentView;
  v2 = -[NCCarPlayBannerContentView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] clearColor];
    [(NCCarPlayBannerContentView *)v2 setBackgroundColor:v3];

    v4 = [(NCCarPlayBannerContentView *)v2 _primaryFont];
    v5 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primaryTextLabel = v2->_primaryTextLabel;
    v2->_primaryTextLabel = v5;

    [(UILabel *)v2->_primaryTextLabel setFont:v4];
    v7 = v2->_primaryTextLabel;
    v8 = [(id)objc_opt_class() _textColor];
    [(UILabel *)v7 setTextColor:v8];

    v9 = [(NCCarPlayBannerContentView *)v2 _subtitleFont];

    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    primarySubtitleTextLabel = v2->_primarySubtitleTextLabel;
    v2->_primarySubtitleTextLabel = v10;

    [(UILabel *)v2->_primarySubtitleTextLabel setFont:v9];
    v12 = v2->_primarySubtitleTextLabel;
    v13 = [(id)objc_opt_class() _textColor];
    [(UILabel *)v12 setTextColor:v13];

    uint64_t v14 = [MEMORY[0x1E4F57F28] buttonWithOK];
    okButton = v2->_okButton;
    v2->_okButton = (CPUIBannerViewButton *)v14;

    uint64_t v16 = [MEMORY[0x1E4F57F28] buttonWithChevronImage];
    actionButton = v2->_actionButton;
    v2->_actionButton = (CPUIBannerViewButton *)v16;

    [(NCCarPlayBannerContentView *)v2 _updateButtonStates];
    [(NCCarPlayBannerContentView *)v2 addSubview:v2->_primaryTextLabel];
    [(NCCarPlayBannerContentView *)v2 addSubview:v2->_primarySubtitleTextLabel];
    [(NCCarPlayBannerContentView *)v2 addSubview:v2->_okButton];
    [(NCCarPlayBannerContentView *)v2 addSubview:v2->_actionButton];
  }
  return v2;
}

- (void)dealloc
{
  [(NCCarPlayBannerContentView *)self _setRelevanceDate:0 allDay:0 timeZone:0 style:0];
  v3.receiver = self;
  v3.super_class = (Class)NCCarPlayBannerContentView;
  [(NCCarPlayBannerContentView *)&v3 dealloc];
}

- (void)invalidateDisplayProperties
{
  self->_displayPropertiesValid = 0;
  [(NCCarPlayBannerContentView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3 = 60.0;
  result.height = v3;
  return result;
}

- (void)layoutSubviews
{
  [(NCCarPlayBannerContentView *)self _reloadDisplayPropertiesIfNecessary];
  [(NCCarPlayBannerContentView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  BOOL v11 = [(NCCarPlayBannerContentView *)self _shouldShowOKButton];
  actionButton = self->_actionButton;
  if (v11)
  {
    [(CPUIBannerViewButton *)actionButton setHidden:1];
    [(CPUIBannerViewButton *)self->_okButton setHidden:0];
    -[NCCarPlayBannerContentView _layoutForButton:contentFrame:](self, "_layoutForButton:contentFrame:", self->_okButton, v4, v6, v8, v10);
    [(CPUIBannerViewButton *)self->_okButton bounds];
    double Width = CGRectGetWidth(v69);
    if ([(NCCarPlayBannerContentView *)self _shouldReverseLayoutDirection])
    {
      [(CPUIBannerViewButton *)self->_okButton frame];
      double MinX = CGRectGetMinX(v70);
      [(CPUIBannerViewButton *)self->_okButton bounds];
      double v4 = v4 + MinX + CGRectGetWidth(v71);
    }
  }
  else
  {
    [(CPUIBannerViewButton *)actionButton setHidden:0];
    -[NCCarPlayBannerContentView _layoutForButton:contentFrame:](self, "_layoutForButton:contentFrame:", self->_actionButton, v4, v6, v8, v10);
    [(CPUIBannerViewButton *)self->_actionButton bounds];
    double Width = CGRectGetWidth(v72);
    if ([(NCCarPlayBannerContentView *)self _shouldReverseLayoutDirection])
    {
      [(CPUIBannerViewButton *)self->_actionButton frame];
      double v15 = CGRectGetMinX(v73);
      [(CPUIBannerViewButton *)self->_actionButton bounds];
      double v4 = v4 + v15 + CGRectGetWidth(v74);
    }
    [(CPUIBannerViewButton *)self->_okButton setHidden:1];
  }
  double v16 = v8 - (Width + 12.0 + 12.0);
  [(NCCarPlayBannerContentView *)self _iconImageInsets];
  double v19 = v18;
  if (self->_badgedIconView)
  {
    double v20 = v6 + v17;
    int v21 = [(NCCarPlayBannerContentView *)self _shouldReverseLayoutDirection];
    double v22 = v4;
    double v23 = v6;
    double v24 = v16;
    double v25 = v10;
    if (v21) {
      double v26 = CGRectGetMaxX(*(CGRect *)&v22) - v19 + -40.0;
    }
    else {
      double v26 = v19 + CGRectGetMinX(*(CGRect *)&v22);
    }
    double v19 = v19 + 48.0;
    badgedIconView = self->_badgedIconView;
    uint64_t v28 = 0x4044000000000000;
    double v29 = v20;
    uint64_t v30 = 0x4044000000000000;
    CGRect v75 = CGRectIntegral(*(CGRect *)&v26);
    -[NCBadgedIconView setFrame:](badgedIconView, "setFrame:", v75.origin.x, v75.origin.y, v75.size.width, v75.size.height);
  }
  int v31 = [(NCCarPlayBannerContentView *)self _shouldReverseLayoutDirection];
  double v32 = -0.0;
  if (!v31) {
    double v32 = v19;
  }
  double v33 = v4 + v32;
  double v34 = v16 - v19;
  v35 = [(BSUIDateLabel *)self->_relevanceDateLabel attributedText];
  [v35 size];
  double v37 = v36;
  CGFloat v67 = v38;

  double v39 = v37 + 8.0;
  if (!self->_relevanceDateLabel) {
    double v39 = 0.0;
  }
  double v40 = v34 - v39;
  p_primaryTextLabel = (id *)&self->_primaryTextLabel;
  -[UILabel sizeThatFits:](self->_primaryTextLabel, "sizeThatFits:", v34 - v39, v10);
  if (v40 >= v42) {
    double v44 = v42;
  }
  else {
    double v44 = v40;
  }
  if (v10 >= v43) {
    double v45 = v43;
  }
  else {
    double v45 = v10;
  }
  double v46 = v33;
  if ([(NCCarPlayBannerContentView *)self _shouldReverseLayoutDirection])
  {
    v76.origin.x = v33;
    v76.origin.y = v6;
    v76.size.width = v34;
    v76.size.height = v10;
    double v46 = CGRectGetMaxX(v76) - v44;
  }
  if ([(NCCarPlayBannerContentView *)self _hasSubtitle])
  {
    v77.origin.y = v6 + 24.0 - self->_primaryAscender;
    id v47 = *p_primaryTextLabel;
    v77.origin.x = v46;
    v77.size.width = v44;
    v77.size.height = v45;
    CGRect v78 = CGRectIntegral(v77);
    objc_msgSend(v47, "setFrame:", v78.origin.x, v78.origin.y, v78.size.width, v78.size.height);
    p_primarySubtitleTextLabel = &self->_primarySubtitleTextLabel;
    -[UILabel sizeThatFits:](self->_primarySubtitleTextLabel, "sizeThatFits:", v34, v10);
    if (v34 >= v49) {
      double v44 = v49;
    }
    else {
      double v44 = v34;
    }
    if (v10 >= v50) {
      double v45 = v50;
    }
    else {
      double v45 = v10;
    }
    if ([(NCCarPlayBannerContentView *)self _shouldReverseLayoutDirection])double v46 = v34 + v33 - v44; {
    else
    }
      double v46 = v33;
    double v51 = v6 + 41.0 - self->_subTitleAscender;
  }
  else
  {
    double v51 = v6 + floor((v10 - v45) * 0.5);
    p_primarySubtitleTextLabel = &self->_primaryTextLabel;
  }
  v52 = *p_primarySubtitleTextLabel;
  double v53 = v46;
  double v54 = v44;
  double v55 = v45;
  CGRect v79 = CGRectIntegral(*(CGRect *)(&v51 - 1));
  -[UILabel setFrame:](v52, "setFrame:", v79.origin.x, v79.origin.y, v79.size.width, v79.size.height);
  if (self->_relevanceDateLabel)
  {
    [*p_primaryTextLabel frame];
    CGFloat v57 = v56;
    double v59 = v58 + 2.0;
    if ([(NCCarPlayBannerContentView *)self _shouldReverseLayoutDirection])
    {
      [*p_primaryTextLabel frame];
      double v60 = CGRectGetMinX(v80);
      v81.origin.x = v57;
      v81.origin.y = v59;
      v81.size.width = v37;
      CGFloat v61 = v67;
      v81.size.height = v67;
      double v62 = v60 - CGRectGetWidth(v81) + -8.0;
    }
    else
    {
      [*p_primaryTextLabel frame];
      double v62 = CGRectGetMaxX(v82) + 8.0;
      CGFloat v61 = v67;
    }
    relevanceDateLabel = self->_relevanceDateLabel;
    double v64 = v59;
    double v65 = v37;
    CGFloat v66 = v61;
    CGRect v83 = CGRectIntegral(*(CGRect *)&v62);
    -[BSUIDateLabel setFrame:](relevanceDateLabel, "setFrame:", v83.origin.x, v83.origin.y, v83.size.width, v83.size.height);
  }
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  v14.receiver = self;
  v14.super_class = (Class)NCCarPlayBannerContentView;
  id v4 = a3;
  [(NCCarPlayBannerContentView *)&v14 traitCollectionDidChange:v4];
  [(NCCarPlayBannerContentView *)self invalidateDisplayProperties];
  [(NCCarPlayBannerContentView *)self _updateButtonStates];
  double v5 = [v4 preferredContentSizeCategory];

  double v6 = [(NCCarPlayBannerContentView *)self traitCollection];
  double v7 = [v6 preferredContentSizeCategory];

  if (v5 != v7)
  {
    primaryTextLabel = self->_primaryTextLabel;
    double v9 = [(NCCarPlayBannerContentView *)self _primaryFont];
    [(UILabel *)primaryTextLabel setFont:v9];

    primarySubtitleTextLabel = self->_primarySubtitleTextLabel;
    BOOL v11 = [(NCCarPlayBannerContentView *)self _subtitleFont];
    [(UILabel *)primarySubtitleTextLabel setFont:v11];

    relevanceDateLabel = self->_relevanceDateLabel;
    v13 = [(NCCarPlayBannerContentView *)self _defaultRelevanceDateFont];
    [(BSUIDateLabel *)relevanceDateLabel setFont:v13];

    [(NCCarPlayBannerContentView *)self setNeedsLayout];
  }
}

- (void)_layoutForButton:(id)a3 contentFrame:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  id v16 = a3;
  [v16 bounds];
  double v8 = v7;
  double v10 = v9;
  int v11 = [(NCCarPlayBannerContentView *)self _shouldReverseLayoutDirection];
  double v12 = width - v8 + -12.0;
  if (v11) {
    double v12 = 12.0;
  }
  double v13 = round((height - v10) * 0.5);
  double v14 = v8;
  double v15 = v10;
  CGRect v18 = CGRectIntegral(*(CGRect *)&v12);
  objc_msgSend(v16, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
  [v16 setHidden:0];
}

- (UIEdgeInsets)_iconImageInsets
{
  [(NCCarPlayBannerContentView *)self bounds];
  double v3 = [(NCCarPlayBannerContentView *)self traitCollection];
  [v3 displayScale];
  UIRoundToScale();
  double v5 = v4;

  double v6 = 10.0;
  double v7 = 10.0;
  double v8 = v5;
  double v9 = v5;
  result.right = v7;
  result.bottom = v9;
  result.left = v6;
  result.top = v8;
  return result;
}

- (BOOL)_hasSubtitle
{
  v2 = [(UILabel *)self->_primarySubtitleTextLabel text];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)_primaryFont
{
  v17[1] = *MEMORY[0x1E4F143B8];
  BOOL v3 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v4 = *MEMORY[0x1E4FB2950];
  double v5 = [(NCCarPlayBannerContentView *)self _boundedTraitCollectionForLabelFont];
  double v6 = [v3 preferredFontDescriptorWithTextStyle:v4 compatibleWithTraitCollection:v5];

  uint64_t v16 = *MEMORY[0x1E4FB0950];
  uint64_t v14 = *MEMORY[0x1E4FB09F0];
  double v7 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09B8]];
  double v15 = v7;
  double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  v17[0] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
  double v10 = [v6 fontDescriptorByAddingAttributes:v9];

  int v11 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v10 size:0.0];
  [v11 ascender];
  self->_primaryAscender = v12;

  return v11;
}

- (id)_subtitleFont
{
  BOOL v3 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v4 = *MEMORY[0x1E4FB2950];
  double v5 = [(NCCarPlayBannerContentView *)self _boundedTraitCollectionForLabelFont];
  double v6 = [v3 preferredFontDescriptorWithTextStyle:v4 compatibleWithTraitCollection:v5];

  double v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v6 size:0.0];
  [v7 ascender];
  self->_subTitleAscender = v8;

  return v7;
}

- (id)_defaultRelevanceDateFont
{
  v2 = (void *)MEMORY[0x1E4FB08E8];
  uint64_t v3 = *MEMORY[0x1E4FB28D8];
  uint64_t v4 = [(NCCarPlayBannerContentView *)self _boundedTraitCollectionForLabelFont];
  double v5 = [v2 preferredFontDescriptorWithTextStyle:v3 compatibleWithTraitCollection:v4];

  double v6 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v5 size:0.0];

  return v6;
}

- (id)_boundedTraitCollectionForLabelFont
{
  v18[7] = *MEMORY[0x1E4F143B8];
  v2 = [(NCCarPlayBannerContentView *)self traitCollection];
  uint64_t v3 = [v2 preferredContentSizeCategory];

  id v4 = v3;
  uint64_t v5 = *MEMORY[0x1E4FB27B0];
  v18[0] = *MEMORY[0x1E4FB27B8];
  v18[1] = v5;
  uint64_t v6 = *MEMORY[0x1E4FB2790];
  v18[2] = *MEMORY[0x1E4FB2798];
  v18[3] = v6;
  uint64_t v7 = *MEMORY[0x1E4FB2780];
  v18[4] = *MEMORY[0x1E4FB2788];
  v18[5] = v7;
  v18[6] = *MEMORY[0x1E4FB2778];
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:7];
  char v9 = [v8 containsObject:v4];

  if (v9)
  {
    double v10 = (id *)MEMORY[0x1E4FB27C0];
  }
  else
  {
    uint64_t v11 = *MEMORY[0x1E4FB27C8];
    v17[0] = *MEMORY[0x1E4FB27E8];
    v17[1] = v11;
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:2];
    int v13 = [v12 containsObject:v4];

    id v14 = v4;
    if (!v13) {
      goto LABEL_6;
    }
    double v10 = (id *)MEMORY[0x1E4FB27D8];
  }
  id v14 = *v10;

LABEL_6:
  double v15 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:v14];

  return v15;
}

- (void)_setRelevanceDate:(id)a3 allDay:(BOOL)a4 timeZone:(id)a5 style:(int64_t)a6
{
  BOOL v8 = a4;
  id v25 = a3;
  id v10 = a5;
  id v11 = v25;
  double v12 = v10;
  if (v25)
  {
    if (!v10)
    {
      uint64_t v13 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      id v11 = v25;
      double v12 = (void *)v13;
    }
    relevanceDateLabel = self->_relevanceDateLabel;
    if (relevanceDateLabel)
    {
      [(BSUIDateLabel *)relevanceDateLabel setStartDate:v11 withTimeZone:v12];
      [(BSUIDateLabel *)self->_relevanceDateLabel setEndDate:v25 withTimeZone:v12];
      [(BSUIDateLabel *)self->_relevanceDateLabel setDelegate:self];
    }
    else
    {
      CGRect v18 = [MEMORY[0x1E4F4F8A8] sharedInstance];
      double v19 = [v18 startLabelWithStartDate:v25 endDate:0 timeZone:v12 allDay:v8 forStyle:a6];
      double v20 = self->_relevanceDateLabel;
      self->_relevanceDateLabel = v19;

      int v21 = self->_relevanceDateLabel;
      double v22 = [(NCCarPlayBannerContentView *)self _defaultRelevanceDateFont];
      [(BSUIDateLabel *)v21 setFont:v22];

      double v23 = self->_relevanceDateLabel;
      double v24 = [(id)objc_opt_class() _textColor];
      [(BSUIDateLabel *)v23 setTextColor:v24];

      [(BSUIDateLabel *)self->_relevanceDateLabel setDelegate:self];
      [(NCCarPlayBannerContentView *)self addSubview:self->_relevanceDateLabel];
    }
  }
  else
  {
    double v15 = self->_relevanceDateLabel;
    if (v15)
    {
      [(BSUIDateLabel *)v15 setDelegate:0];
      uint64_t v16 = [MEMORY[0x1E4F4F8A8] sharedInstance];
      [v16 recycleLabel:self->_relevanceDateLabel];

      double v17 = self->_relevanceDateLabel;
      self->_relevanceDateLabel = 0;
    }
  }
}

- (void)_updateButtonStates
{
  id v4 = [(NCCarPlayBannerContentView *)self traitCollection];
  BOOL v3 = ([v4 interactionModel] & 2) != 0 || objc_msgSend(v4, "primaryInteractionModel") == 8;
  [(CPUIBannerViewButton *)self->_okButton setSelected:v3];
  [(CPUIBannerViewButton *)self->_actionButton setSelected:v3];
}

- (BOOL)_shouldShowOKButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    char v4 = [WeakRetained bannerContentViewShouldShowOKButton:self];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (void)_reloadDisplayPropertiesIfNecessary
{
  if (!self->_displayPropertiesValid)
  {
    self->_displayPropertiesValid = 1;
    id v5 = [(NCCarPlayBannerContentView *)self date];
    BOOL v3 = [(NCCarPlayBannerContentView *)self isDateAllDay];
    char v4 = [(NCCarPlayBannerContentView *)self timeZone];
    [(NCCarPlayBannerContentView *)self _setRelevanceDate:v5 allDay:v3 timeZone:v4 style:[(NCCarPlayBannerContentView *)self dateFormatStyle]];
  }
}

- (NSString)primaryText
{
  return [(UILabel *)self->_primaryTextLabel text];
}

- (void)setPrimaryText:(id)a3
{
  id v6 = a3;
  char v4 = [(NCCarPlayBannerContentView *)self primaryText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_primaryTextLabel setText:v6];
    [(NCCarPlayBannerContentView *)self invalidateDisplayProperties];
  }
}

- (NSString)primarySubtitleText
{
  return [(UILabel *)self->_primarySubtitleTextLabel text];
}

- (void)setPrimarySubtitleText:(id)a3
{
  id v6 = a3;
  char v4 = [(NCCarPlayBannerContentView *)self primarySubtitleText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(UILabel *)self->_primarySubtitleTextLabel setText:v6];
    [(NCCarPlayBannerContentView *)self invalidateDisplayProperties];
  }
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    char v4 = (NSDate *)[v6 copy];
    date = self->_date;
    self->_date = v4;

    [(NCCarPlayBannerContentView *)self invalidateDisplayProperties];
  }
}

- (void)setDateAllDay:(BOOL)a3
{
  if (self->_dateAllDay != a3)
  {
    self->_dateAllDay = a3;
    [(NCCarPlayBannerContentView *)self invalidateDisplayProperties];
  }
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    char v4 = (NSTimeZone *)[v6 copy];
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    [(NCCarPlayBannerContentView *)self invalidateDisplayProperties];
  }
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    [(NCCarPlayBannerContentView *)self invalidateDisplayProperties];
  }
}

- (unint64_t)primaryTextMaximumNumberOfLines
{
  return [(UILabel *)self->_primaryTextLabel numberOfLines];
}

- (void)setPrimaryTextMaximumNumberOfLines:(unint64_t)a3
{
  if ([(NCCarPlayBannerContentView *)self primaryTextMaximumNumberOfLines] != a3)
  {
    [(UILabel *)self->_primaryTextLabel setNumberOfLines:a3];
    [(NCCarPlayBannerContentView *)self invalidateDisplayProperties];
  }
}

- (unint64_t)primarySubtitleTextMaximumNumberOfLines
{
  return [(UILabel *)self->_primarySubtitleTextLabel numberOfLines];
}

- (void)setPrimarySubtitleTextMaximumNumberOfLines:(unint64_t)a3
{
  if ([(NCCarPlayBannerContentView *)self primarySubtitleTextMaximumNumberOfLines] != a3)
  {
    [(UILabel *)self->_primarySubtitleTextLabel setNumberOfLines:a3];
    [(NCCarPlayBannerContentView *)self invalidateDisplayProperties];
  }
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  if (self->_screenCaptureProhibited != a3)
  {
    self->_screenCaptureProhibited = a3;
    -[NCCarPlayBannerContentView nc_setScreenCaptureProhibited:](self, "nc_setScreenCaptureProhibited:");
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F845E0;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    char v9 = v6;
    BOOL v8 = strokeVisualStylingProvider;
    objc_storeStrong((id *)&self->_strokeVisualStylingProvider, a3);
    if (self->_badgedIconView)
    {
      -[MTVisualStylingProvider stopAutomaticallyUpdatingView:](v8, "stopAutomaticallyUpdatingView:");
      [(MTVisualStylingProvider *)v9 automaticallyUpdateView:self->_badgedIconView withStyle:0];
    }

    id v6 = v9;
  }
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

- (void)setBadgedIconView:(id)a3
{
  id v8 = a3;
  p_badgedIconView = &self->_badgedIconView;
  char v6 = BSEqualObjects();
  uint64_t v7 = v8;
  if ((v6 & 1) == 0)
  {
    [(NCBadgedIconView *)*p_badgedIconView removeFromSuperview];
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView) {
      -[NCCarPlayBannerContentView addSubview:](self, "addSubview:");
    }
    [(NCCarPlayBannerContentView *)self setNeedsLayout];
    uint64_t v7 = v8;
  }
}

+ (id)_textColor
{
  return (id)[MEMORY[0x1E4FB1618] labelColor];
}

- (NSDate)date
{
  return self->_date;
}

- (BOOL)isDateAllDay
{
  return self->_dateAllDay;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->adjustsFontForContentSizeCategory = a3;
}

- (NCBadgedIconView)badgedIconView
{
  return self->_badgedIconView;
}

- (NCCarPlayBannerContentViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCCarPlayBannerContentViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_badgedIconView, 0);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_relevanceDateLabel, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_storeStrong((id *)&self->_okButton, 0);
  objc_storeStrong((id *)&self->_primarySubtitleTextLabel, 0);

  objc_storeStrong((id *)&self->_primaryTextLabel, 0);
}

@end