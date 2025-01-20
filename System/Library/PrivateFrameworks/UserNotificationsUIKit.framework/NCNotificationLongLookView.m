@interface NCNotificationLongLookView
- (BOOL)_lookViewTapGestureRecognizerShouldReceiveTouch:(id)a3;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)disableDimming;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hideDate;
- (BOOL)hidesNotificationContent;
- (BOOL)screenCaptureProhibited;
- (CGRect)_actionsViewFrame;
- (CGRect)_mainContentViewFrame;
- (CGSize)_contentSizeThatFitsContentWithSizeExcludingActions:(CGSize)a3;
- (CGSize)_contentViewSize;
- (NSAttributedString)contentSummaryText;
- (NSAttributedString)secondaryText;
- (NSString)primarySubtitleText;
- (NSString)primaryText;
- (UITapGestureRecognizer)lookViewTapGestureRecognizer;
- (double)backgroundAlpha;
- (double)contentAlpha;
- (double)dateAlpha;
- (int64_t)lookStyle;
- (unint64_t)customContentLocation;
- (unint64_t)maximumNumberOfPrimaryLargeTextLines;
- (unint64_t)maximumNumberOfPrimaryTextLines;
- (unint64_t)maximumNumberOfSecondaryLargeTextLines;
- (unint64_t)maximumNumberOfSecondaryTextLines;
- (void)_configureCustomContentView;
- (void)_configureLookViewTapGestureRecognizerIfNecessary;
- (void)_configureNotificationContentViewIfNecessary;
- (void)_layoutCustomContentView;
- (void)_layoutCustomContentViewInRelationToContentView;
- (void)_layoutNotificationContentView;
- (void)_updateTopMargin;
- (void)layoutSubviews;
- (void)notificationContentView:(id)a3 willInteractWithURL:(id)a4;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setContentSummaryText:(id)a3;
- (void)setCustomContentLocation:(unint64_t)a3;
- (void)setCustomContentSize:(CGSize)a3;
- (void)setDateAlpha:(double)a3;
- (void)setDisableDimming:(BOOL)a3;
- (void)setHideDate:(BOOL)a3;
- (void)setHidesNotificationContent:(BOOL)a3;
- (void)setMaximumNumberOfPrimaryLargeTextLines:(unint64_t)a3;
- (void)setMaximumNumberOfPrimaryTextLines:(unint64_t)a3;
- (void)setMaximumNumberOfSecondaryLargeTextLines:(unint64_t)a3;
- (void)setMaximumNumberOfSecondaryTextLines:(unint64_t)a3;
- (void)setPrimarySubtitleText:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setSecondaryText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCNotificationLongLookView

- (UITapGestureRecognizer)lookViewTapGestureRecognizer
{
  [(NCNotificationLongLookView *)self _configureLookViewTapGestureRecognizerIfNecessary];
  lookViewTapGestureRecognizer = self->_lookViewTapGestureRecognizer;

  return lookViewTapGestureRecognizer;
}

- (void)setCustomContentLocation:(unint64_t)a3
{
  if (self->_customContentLocation != a3)
  {
    self->_customContentLocation = a3;
    [(NCNotificationLongLookView *)self _updateTopMargin];
    [(NCNotificationLongLookView *)self setNeedsLayout];
  }
}

- (void)setCustomContentSize:(CGSize)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView setCustomContentSize:](&v4, sel_setCustomContentSize_, a3.width, a3.height);
  [(NCNotificationLongLookView *)self _updateTopMargin];
}

- (void)_updateTopMargin
{
  [(PLExpandedPlatterView *)self customContentSize];
  if (fabs(v3) >= 2.22044605e-16)
  {
    unint64_t customContentLocation = self->_customContentLocation;
    if (!customContentLocation)
    {
      uint64_t v5 = 0;
      goto LABEL_6;
    }
    if (customContentLocation != 1) {
      return;
    }
  }
  uint64_t v5 = 1;
LABEL_6:
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentView *)notificationContentView setUseSmallTopMargin:v5];
}

- (void)setHidesNotificationContent:(BOOL)a3
{
  if (self->_hidesNotificationContent != a3)
  {
    self->_hidesNotificationContent = a3;
    if (a3)
    {
      [(NCNotificationContentView *)self->_notificationContentView removeFromSuperview];
      notificationContentView = self->_notificationContentView;
      self->_notificationContentView = 0;
    }
    uint64_t v5 = [(PLExpandedPlatterView *)self _mainContentView];
    [v5 setNeedsLayout];

    [(NCNotificationLongLookView *)self setNeedsLayout];
  }
}

- (NSString)primaryText
{
  return [(NCNotificationContentView *)self->_notificationContentView primaryText];
}

- (void)setPrimaryText:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCNotificationContentView *)self->_notificationContentView primaryText];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationContentView *)self->_notificationContentView setPrimaryText:v6];
  }
}

- (NSString)primarySubtitleText
{
  return [(NCNotificationContentView *)self->_notificationContentView primarySubtitleText];
}

- (void)setPrimarySubtitleText:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCNotificationContentView *)self->_notificationContentView primarySubtitleText];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationContentView *)self->_notificationContentView setPrimarySubtitleText:v6];
  }
}

- (NSAttributedString)secondaryText
{
  return [(NCNotificationContentView *)self->_notificationContentView secondaryText];
}

- (void)setSecondaryText:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCNotificationContentView *)self->_notificationContentView secondaryText];
  char v5 = [v6 isEqual:v4];

  if ((v5 & 1) == 0)
  {
    [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationContentView *)self->_notificationContentView setSecondaryText:v6];
  }
}

- (void)setContentSummaryText:(id)a3
{
  id v4 = a3;
  if (objc_opt_respondsToSelector()) {
    [(NCNotificationContentView *)self->_notificationContentView setContentSummaryText:v4];
  }
}

- (NSAttributedString)contentSummaryText
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentView *)self->_notificationContentView contentSummaryText];
  }
  else
  {
    double v3 = 0;
  }

  return (NSAttributedString *)v3;
}

- (BOOL)screenCaptureProhibited
{
  return [(NCNotificationContentView *)self->_notificationContentView screenCaptureProhibited];
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLExpandedPlatterView *)self _configureMainContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentView *)notificationContentView setScreenCaptureProhibited:v3];
}

- (BOOL)hideDate
{
  return [(NCNotificationContentView *)self->_notificationContentView hideDate];
}

- (void)setHideDate:(BOOL)a3
{
  BOOL v3 = a3;
  [(PLExpandedPlatterView *)self _configureMainContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentView *)notificationContentView setHideDate:v3];
}

- (double)dateAlpha
{
  [(NCNotificationContentView *)self->_notificationContentView dateAlpha];
  return result;
}

- (void)setDateAlpha:(double)a3
{
  [(PLExpandedPlatterView *)self _configureMainContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentView *)notificationContentView setDateAlpha:a3];
}

- (CGSize)_contentSizeThatFitsContentWithSizeExcludingActions:(CGSize)a3
{
  double width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView _contentSizeThatFitsContentWithSizeExcludingActions:](&v12, sel__contentSizeThatFitsContentWithSizeExcludingActions_, a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  if (!self->_hidesNotificationContent)
  {
    [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", width, 0.0);
    double v8 = v8 + v9;
  }
  double v10 = v6;
  double v11 = v8;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (int64_t)lookStyle
{
  return 1;
}

- (void)_configureCustomContentView
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookView;
  [(PLExpandedPlatterView *)&v4 _configureCustomContentView];
  if (!self->_hidesNotificationContent && self->_customContentLocation != 1)
  {
    BOOL v3 = [(PLExpandedPlatterView *)self customContentView];
    [v3 _setContinuousCornerRadius:0.0];
  }
}

- (void)_configureNotificationContentViewIfNecessary
{
  if (!self->_notificationContentView && !self->_hidesNotificationContent)
  {
    [(PLExpandedPlatterView *)self _configureMainContentViewIfNecessary];
    BOOL v3 = [[NCNotificationContentView alloc] initWithStyle:[(NCNotificationLongLookView *)self lookStyle]];
    notificationContentView = self->_notificationContentView;
    self->_notificationContentView = v3;

    [(NCNotificationContentView *)self->_notificationContentView setDelegate:self];
    double v5 = [(NCNotificationContentView *)self->_notificationContentView layer];
    [v5 setMaskedCorners:12];

    [(NCNotificationContentView *)self->_notificationContentView _setContinuousCornerRadius:13.0];
    double v6 = self->_notificationContentView;
    double v7 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(NCNotificationContentView *)v6 setBackgroundColor:v7];

    id v8 = [(PLExpandedPlatterView *)self _mainContentView];
    [v8 addSubview:self->_notificationContentView];
  }
}

- (void)_configureLookViewTapGestureRecognizerIfNecessary
{
  if (!self->_lookViewTapGestureRecognizer)
  {
    BOOL v3 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
    lookViewTapGestureRecognizer = self->_lookViewTapGestureRecognizer;
    self->_lookViewTapGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->_lookViewTapGestureRecognizer setDelegate:self];
    double v5 = self->_lookViewTapGestureRecognizer;
    [(NCNotificationLongLookView *)self addGestureRecognizer:v5];
  }
}

- (CGRect)_actionsViewFrame
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationLongLookView;
  [(PLExpandedPlatterView *)&v9 _actionsViewFrame];
  if (!self->_hidesNotificationContent)
  {
    [(NCNotificationLongLookView *)self bounds];
    -[PLExpandedPlatterView contentSizeForSize:](self, "contentSizeForSize:", v3, v4);
    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:");
  }
  _NCMainScreenScale();
  UIRectIntegralWithScale();
  result.size.height = v8;
  result.size.double width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

- (CGRect)_mainContentViewFrame
{
  v16.receiver = self;
  v16.super_class = (Class)NCNotificationLongLookView;
  [(PLExpandedPlatterView *)&v16 _mainContentViewFrame];
  double v6 = v5;
  double v8 = v7;
  double v9 = v3;
  double v10 = v4;
  if (!self->_hidesNotificationContent)
  {
    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v3, v4);
    double v10 = v10 + v11;
  }
  double v12 = v6;
  double v13 = v8;
  double v14 = v9;
  double v15 = v10;
  result.size.height = v15;
  result.size.double width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)_contentViewSize
{
  v12.receiver = self;
  v12.super_class = (Class)NCNotificationLongLookView;
  [(PLExpandedPlatterView *)&v12 _contentViewSize];
  double v4 = v3;
  double v6 = v5;
  if (!self->_hidesNotificationContent)
  {
    [(NCNotificationLongLookView *)self bounds];
    -[PLExpandedPlatterView contentSizeForSize:](self, "contentSizeForSize:", v7, v8);
    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:");
    double v6 = v6 + v9;
  }
  double v10 = v4;
  double v11 = v6;
  result.height = v11;
  result.double width = v10;
  return result;
}

- (void)_layoutNotificationContentView
{
  if (self->_notificationContentView)
  {
    [(PLExpandedPlatterView *)self _layoutMainContentViewIfNecessary];
    double v3 = [(PLExpandedPlatterView *)self _mainContentView];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;

    -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v5, v7);
    BSRectWithSize();
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    if ([(PLExpandedPlatterView *)self clipsVisibleContentToBounds])
    {
      v18.origin.x = v9;
      v18.origin.y = v11;
      v18.size.double width = v13;
      v18.size.height = v15;
      CGRectGetHeight(v18);
      [(NCNotificationLongLookView *)self bounds];
      -[PLExpandedPlatterView _flexibleAreaSizeForBounds:](self, "_flexibleAreaSizeForBounds:");
    }
    notificationContentView = self->_notificationContentView;
    _NCMainScreenScale();
    UIRectIntegralWithScale();
    -[NCNotificationContentView setFrame:](notificationContentView, "setFrame:");
  }
}

- (void)_layoutCustomContentView
{
  v9.receiver = self;
  v9.super_class = (Class)NCNotificationLongLookView;
  [(PLExpandedPlatterView *)&v9 _layoutCustomContentView];
  if (!self->_hidesNotificationContent && self->_notificationContentView)
  {
    if ([(PLExpandedPlatterView *)self clipsVisibleContentToBounds])
    {
      [(PLExpandedPlatterView *)self _layoutMainContentViewIfNecessary];
      double v3 = [(PLExpandedPlatterView *)self _mainContentView];
      [v3 frame];
      double v5 = v4;
      double v7 = v6;

      -[NCNotificationContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v5, v7);
      [(NCNotificationLongLookView *)self bounds];
      -[PLExpandedPlatterView _flexibleAreaSizeForBounds:](self, "_flexibleAreaSizeForBounds:");
      double v8 = [(PLExpandedPlatterView *)self customContentView];
      [v8 frame];
      objc_msgSend(v8, "setFrame:");
    }
  }
}

- (void)_layoutCustomContentViewInRelationToContentView
{
  [(PLExpandedPlatterView *)self customContentSize];
  if (fabs(v3) >= 2.22044605e-16)
  {
    unint64_t customContentLocation = self->_customContentLocation;
    if (customContentLocation == 1)
    {
      [(NCNotificationContentView *)self->_notificationContentView frame];
      double v18 = v17;
      v19 = [(PLExpandedPlatterView *)self customContentView];
      [v19 frame];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;

      id v28 = [(PLExpandedPlatterView *)self customContentView];
      objc_msgSend(v28, "setFrame:", v21, v18 + v23, v25, v27);
    }
    else if (!customContentLocation)
    {
      [(NCNotificationContentView *)self->_notificationContentView frame];
      double v6 = v5;
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      CGFloat v13 = [(PLExpandedPlatterView *)self customContentView];
      [v13 frame];
      double v15 = v14;

      notificationContentView = self->_notificationContentView;
      -[NCNotificationContentView setFrame:](notificationContentView, "setFrame:", v6, v8 + v15, v10, v12);
    }
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationLongLookView;
  [(PLExpandedPlatterView *)&v3 layoutSubviews];
  [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
  if (!self->_hidesNotificationContent)
  {
    [(NCNotificationLongLookView *)self _layoutNotificationContentView];
    [(NCNotificationLongLookView *)self _layoutCustomContentViewInRelationToContentView];
  }
}

- (BOOL)_lookViewTapGestureRecognizerShouldReceiveTouch:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  double v6 = [(PLExpandedPlatterView *)self _headerContentView];
  if ([v5 isDescendantOfView:v6])
  {
    int v7 = 1;
  }
  else
  {
    double v8 = [(PLExpandedPlatterView *)self _mainContentView];
    int v7 = [v5 isDescendantOfView:v8];
  }
  double v9 = [(PLExpandedPlatterView *)self delegate];
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      char v10 = [v9 notificationLongLookView:self tapGestureRecognizerShouldReceiveTouch:v4];
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)maximumNumberOfPrimaryTextLines
{
  return [(NCNotificationContentView *)self->_notificationContentView maximumNumberOfPrimaryTextLines];
}

- (void)setMaximumNumberOfPrimaryTextLines:(unint64_t)a3
{
  [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentView *)notificationContentView setMaximumNumberOfPrimaryTextLines:a3];
}

- (unint64_t)maximumNumberOfPrimaryLargeTextLines
{
  return [(NCNotificationContentView *)self->_notificationContentView maximumNumberOfPrimaryLargeTextLines];
}

- (void)setMaximumNumberOfPrimaryLargeTextLines:(unint64_t)a3
{
  [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentView *)notificationContentView setMaximumNumberOfPrimaryLargeTextLines:a3];
}

- (unint64_t)maximumNumberOfSecondaryTextLines
{
  return [(NCNotificationContentView *)self->_notificationContentView secondaryTextMaximumNumberOfLines];
}

- (void)setMaximumNumberOfSecondaryTextLines:(unint64_t)a3
{
  [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentView *)notificationContentView setSecondaryTextMaximumNumberOfLines:a3];
}

- (unint64_t)maximumNumberOfSecondaryLargeTextLines
{
  return [(NCNotificationContentView *)self->_notificationContentView maximumNumberOfSecondaryLargeTextLines];
}

- (void)setMaximumNumberOfSecondaryLargeTextLines:(unint64_t)a3
{
  [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentView *)notificationContentView setMaximumNumberOfSecondaryLargeTextLines:a3];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_lookViewTapGestureRecognizer != a3
      || [(NCNotificationLongLookView *)self _lookViewTapGestureRecognizerShouldReceiveTouch:a4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_lookViewTapGestureRecognizer != a3) {
    return 0;
  }
  double v5 = self;
  double v6 = [a4 view];
  LOBYTE(v5) = [v6 isDescendantOfView:v5->_notificationContentView];

  return (char)v5;
}

- (double)backgroundAlpha
{
  return 1.0;
}

- (double)contentAlpha
{
  return 1.0;
}

- (void)notificationContentView:(id)a3 willInteractWithURL:(id)a4
{
  id v6 = a4;
  double v5 = [(PLExpandedPlatterView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 notificationLongLookView:self willInteractWithURL:v6];
  }
}

- (BOOL)adjustsFontForContentSizeCategory
{
  [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
  if ([(NCNotificationContentView *)self->_notificationContentView adjustsFontForContentSizeCategory])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookView;
  return [(PLExpandedPlatterView *)&v4 adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationLongLookView;
  -[PLExpandedPlatterView setAdjustsFontForContentSizeCategory:](&v5, sel_setAdjustsFontForContentSizeCategory_);
  [(NCNotificationLongLookView *)self _configureNotificationContentViewIfNecessary];
  [(NCNotificationContentView *)self->_notificationContentView setAdjustsFontForContentSizeCategory:v3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationLongLookView;
  unsigned int v3 = [(PLExpandedPlatterView *)&v6 adjustForContentSizeCategoryChange];
  int v4 = [(NCNotificationContentView *)self->_notificationContentView adjustForContentSizeCategoryChange] | v3;
  if (v4 == 1) {
    [(NCNotificationLongLookView *)self setNeedsLayout];
  }
  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationLongLookView;
  [(NCNotificationLongLookView *)&v4 traitCollectionDidChange:a3];
  [(NCNotificationLongLookView *)self adjustForContentSizeCategoryChange];
}

- (unint64_t)customContentLocation
{
  return self->_customContentLocation;
}

- (BOOL)hidesNotificationContent
{
  return self->_hidesNotificationContent;
}

- (BOOL)disableDimming
{
  return self->_disableDimming;
}

- (void)setDisableDimming:(BOOL)a3
{
  self->_disableDimming = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookViewTapGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_notificationContentView, 0);
}

@end