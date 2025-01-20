@interface NCExpandedPlatterView
- (BOOL)_tapGestureRecognizerShouldReceiveTouch:(id)a3;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hideDate;
- (BOOL)hidesNotificationContent;
- (BOOL)isDateAllDay;
- (BOOL)isScrollViewPinnedToBottom;
- (BOOL)screenCaptureProhibited;
- (CGRect)_mainContentViewFrame;
- (CGSize)_contentViewSize;
- (CGSize)contentSizeForSize:(CGSize)a3;
- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3;
- (MTVisualStylingProvider)importantTextVisualStylingProvider;
- (NCBadgedIconView)badgedIconView;
- (NCExpandedPlatterView)initWithFrame:(CGRect)a3;
- (NSArray)menuActions;
- (NSAttributedString)importantAttributedText;
- (NSAttributedString)secondaryText;
- (NSDate)date;
- (NSString)footerText;
- (NSString)importantText;
- (NSString)primarySubtitleText;
- (NSString)primaryText;
- (NSTimeZone)timeZone;
- (UIImageConfiguration)importantTextImageConfiguration;
- (UITapGestureRecognizer)defaultTapGestureRecognizer;
- (id)accessibilityIdentifier;
- (int64_t)dateFormatStyle;
- (void)_configureDefaultTapGestureRecognizerIfNecessary;
- (void)_configureNotificationContentViewIfNecessary;
- (void)_layoutNotificationContentView;
- (void)_layoutSubviews;
- (void)layoutSubviews;
- (void)notificationSeamlessContentView:(id)a3 requestsInteractionWithURL:(id)a4;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setBadgedIconView:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateAllDay:(BOOL)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setFooterText:(id)a3;
- (void)setHideDate:(BOOL)a3;
- (void)setHidesNotificationContent:(BOOL)a3;
- (void)setImportantAttributedText:(id)a3;
- (void)setImportantText:(id)a3;
- (void)setImportantTextVisualStylingProvider:(id)a3;
- (void)setMenuActions:(id)a3;
- (void)setPrimarySubtitleText:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setScrollViewPinnedToBottom:(BOOL)a3;
- (void)setSecondaryText:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation NCExpandedPlatterView

- (void)setHidesNotificationContent:(BOOL)a3
{
  if (self->_hidesNotificationContent != a3)
  {
    self->_hidesNotificationContent = a3;
    if (a3)
    {
      [(NCNotificationSeamlessContentView *)self->_notificationContentView removeFromSuperview];
      notificationContentView = self->_notificationContentView;
      self->_notificationContentView = 0;
    }
    v5 = [(PLExpandedPlatterView *)self _mainContentView];
    [v5 setNeedsLayout];

    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (UITapGestureRecognizer)defaultTapGestureRecognizer
{
  [(NCExpandedPlatterView *)self _configureDefaultTapGestureRecognizerIfNecessary];
  defaultTapGestureRecognizer = self->_defaultTapGestureRecognizer;

  return defaultTapGestureRecognizer;
}

- (NCExpandedPlatterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCExpandedPlatterView;
  v3 = -[PLExpandedPlatterView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    [(NCExpandedPlatterView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (void)layoutSubviews
{
  objc_initWeak(&location, self);
  uint64_t v3 = MEMORY[0x1E4F143A8];
  uint64_t v4 = 3221225472;
  v5 = __39__NCExpandedPlatterView_layoutSubviews__block_invoke;
  objc_super v6 = &unk_1E6A919A0;
  objc_copyWeak(&v7, &location);
  v2 = (void (**)(void))_Block_copy(&v3);
  if (objc_msgSend(MEMORY[0x1E4FB1EB0], "_isInAnimationBlockWithAnimationsEnabled", v3, v4, v5, v6)
    && [MEMORY[0x1E4FB1EB0] _isInRetargetableAnimationBlock])
  {
    [MEMORY[0x1E4FB1EB0] _animateByRetargetingAnimations:v2 completion:0];
  }
  else
  {
    v2[2](v2);
  }

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __39__NCExpandedPlatterView_layoutSubviews__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _layoutSubviews];
}

- (CGRect)_mainContentViewFrame
{
  v16.receiver = self;
  v16.super_class = (Class)NCExpandedPlatterView;
  [(PLExpandedPlatterView *)&v16 _mainContentViewFrame];
  double v6 = v5;
  double v8 = v7;
  double v9 = v3;
  double v10 = v4;
  if (!self->_hidesNotificationContent)
  {
    -[NCNotificationSeamlessContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v3, v4);
    double v10 = v10 + v11;
  }
  double v12 = v6;
  double v13 = v8;
  double v14 = v9;
  double v15 = v10;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGSize)_contentViewSize
{
  v12.receiver = self;
  v12.super_class = (Class)NCExpandedPlatterView;
  [(PLExpandedPlatterView *)&v12 _contentViewSize];
  double v4 = v3;
  double v6 = v5;
  if (!self->_hidesNotificationContent)
  {
    [(NCExpandedPlatterView *)self bounds];
    -[NCExpandedPlatterView contentSizeForSize:](self, "contentSizeForSize:", v7, v8);
    -[NCNotificationSeamlessContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:");
    double v6 = v6 + v9;
  }
  double v10 = v4;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)NCExpandedPlatterView;
  -[PLExpandedPlatterView sizeThatFitsContentWithSize:](&v13, sel_sizeThatFitsContentWithSize_, a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  notificationContentView = self->_notificationContentView;
  if (notificationContentView)
  {
    -[NCNotificationSeamlessContentView sizeThatFits:](notificationContentView, "sizeThatFits:", width, 1.79769313e308);
    double v8 = v8 + v10;
  }
  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  double width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)NCExpandedPlatterView;
  -[PLExpandedPlatterView contentSizeForSize:](&v13, sel_contentSizeForSize_, a3.width, a3.height);
  double v6 = v5;
  double v8 = v7;
  notificationContentView = self->_notificationContentView;
  if (notificationContentView)
  {
    -[NCNotificationSeamlessContentView sizeThatFits:](notificationContentView, "sizeThatFits:", width, 1.79769313e308);
    if (v8 - v10 >= 0.0) {
      double v8 = v8 - v10;
    }
    else {
      double v8 = 0.0;
    }
  }
  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.double width = v11;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCExpandedPlatterView;
  [(NCExpandedPlatterView *)&v4 traitCollectionDidChange:a3];
  [(NCExpandedPlatterView *)self adjustForContentSizeCategoryChange];
}

- (NCBadgedIconView)badgedIconView
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView badgedIconView];
}

- (void)setBadgedIconView:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self badgedIconView];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationSeamlessContentView *)self->_notificationContentView setBadgedIconView:v6];
    }
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (NSString)primaryText
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView primaryText];
}

- (void)setPrimaryText:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self primaryText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setPrimaryText:v6];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (NSString)primarySubtitleText
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView primarySubtitleText];
}

- (void)setPrimarySubtitleText:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self primarySubtitleText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setPrimarySubtitleText:v6];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (NSAttributedString)secondaryText
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView secondaryText];
}

- (void)setSecondaryText:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self secondaryText];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setSecondaryText:v6];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (NSString)importantText
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView importantText];
}

- (id)accessibilityIdentifier
{
  return @"notification-expanded-view";
}

- (void)setImportantText:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self importantText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setImportantText:v6];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (NSAttributedString)importantAttributedText
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView importantAttributedText];
}

- (void)setImportantAttributedText:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self importantAttributedText];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setImportantAttributedText:v6];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (UIImageConfiguration)importantTextImageConfiguration
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView importantTextImageConfiguration];
}

- (MTVisualStylingProvider)importantTextVisualStylingProvider
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView importantTextVisualStylingProvider];
}

- (void)setImportantTextVisualStylingProvider:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self importantTextVisualStylingProvider];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setImportantTextVisualStylingProvider:v6];
    [(NCExpandedPlatterView *)self setNeedsDisplay];
  }
}

- (NSString)footerText
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView footerText];
}

- (void)setFooterText:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self footerText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setFooterText:v6];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (NSDate)date
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView date];
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self date];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setDate:v6];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (BOOL)isDateAllDay
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView isDateAllDay];
}

- (void)setDateAllDay:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCExpandedPlatterView *)self isDateAllDay] != a3)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setDateAllDay:v3];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (NSTimeZone)timeZone
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView timeZone];
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  objc_super v4 = [(NCExpandedPlatterView *)self timeZone];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setTimeZone:v6];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (int64_t)dateFormatStyle
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView dateFormatStyle];
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if ([(NCExpandedPlatterView *)self dateFormatStyle] != a3)
  {
    [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setDateFormatStyle:a3];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (BOOL)hideDate
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView hideDate];
}

- (void)setHideDate:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCExpandedPlatterView *)self hideDate] != a3)
  {
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setHideDate:v3];
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
}

- (BOOL)screenCaptureProhibited
{
  return [(NCNotificationSeamlessContentView *)self->_notificationContentView screenCaptureProhibited];
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  BOOL v3 = a3;
  [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationSeamlessContentView *)notificationContentView setScreenCaptureProhibited:v3];
}

- (BOOL)adjustsFontForContentSizeCategory
{
  [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
  if ([(NCNotificationSeamlessContentView *)self->_notificationContentView adjustsFontForContentSizeCategory])
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)NCExpandedPlatterView;
  return [(PLExpandedPlatterView *)&v4 adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCExpandedPlatterView;
  -[PLExpandedPlatterView setAdjustsFontForContentSizeCategory:](&v5, sel_setAdjustsFontForContentSizeCategory_);
  [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
  [(NCNotificationSeamlessContentView *)self->_notificationContentView setAdjustsFontForContentSizeCategory:v3];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v6.receiver = self;
  v6.super_class = (Class)NCExpandedPlatterView;
  unsigned int v3 = [(PLExpandedPlatterView *)&v6 adjustForContentSizeCategoryChange];
  int v4 = [(NCNotificationSeamlessContentView *)self->_notificationContentView adjustForContentSizeCategoryChange] | v3;
  if (v4 == 1) {
    [(NCExpandedPlatterView *)self setNeedsLayout];
  }
  return v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  return self->_defaultTapGestureRecognizer != a3
      || [(NCExpandedPlatterView *)self _tapGestureRecognizerShouldReceiveTouch:a4];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  if (self->_defaultTapGestureRecognizer != a3) {
    return 0;
  }
  objc_super v5 = self;
  objc_super v6 = [a4 view];
  LOBYTE(v5) = [v6 isDescendantOfView:v5->_notificationContentView];

  return (char)v5;
}

- (void)notificationSeamlessContentView:(id)a3 requestsInteractionWithURL:(id)a4
{
  id v6 = a4;
  objc_super v5 = [(PLExpandedPlatterView *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 expandedPlatterView:self requestsInteractionWithURL:v6];
  }
}

- (void)_configureNotificationContentViewIfNecessary
{
  if (!self->_notificationContentView && !self->_hidesNotificationContent)
  {
    [(PLExpandedPlatterView *)self _configureMainContentViewIfNecessary];
    unsigned int v3 = objc_alloc_init(NCNotificationSeamlessContentView);
    notificationContentView = self->_notificationContentView;
    self->_notificationContentView = v3;

    [(NCNotificationSeamlessContentView *)self->_notificationContentView setDelegate:self];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setURLInteractionEnabled:1];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView setTextMenusEnabled:1];
    id v5 = [(PLExpandedPlatterView *)self _mainContentView];
    [v5 addSubview:self->_notificationContentView];
  }
}

- (void)_layoutNotificationContentView
{
  if (self->_notificationContentView)
  {
    [(PLExpandedPlatterView *)self _layoutMainContentViewIfNecessary];
    unsigned int v3 = [(PLExpandedPlatterView *)self _mainContentView];
    [v3 frame];
    double v5 = v4;
    double v7 = v6;

    -[NCNotificationSeamlessContentView sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v5, v7);
    BSRectWithSize();
    notificationContentView = self->_notificationContentView;
    UIRectIntegralWithScale();
    -[NCNotificationSeamlessContentView setFrame:](notificationContentView, "setFrame:");
  }
}

- (void)_configureDefaultTapGestureRecognizerIfNecessary
{
  if (!self->_defaultTapGestureRecognizer)
  {
    unsigned int v3 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4FB1D38]);
    defaultTapGestureRecognizer = self->_defaultTapGestureRecognizer;
    self->_defaultTapGestureRecognizer = v3;

    [(UITapGestureRecognizer *)self->_defaultTapGestureRecognizer setDelegate:self];
    double v5 = self->_defaultTapGestureRecognizer;
    [(NCExpandedPlatterView *)self addGestureRecognizer:v5];
  }
}

- (void)_layoutSubviews
{
  v15.receiver = self;
  v15.super_class = (Class)NCExpandedPlatterView;
  [(PLExpandedPlatterView *)&v15 layoutSubviews];
  [(NCExpandedPlatterView *)self _configureNotificationContentViewIfNecessary];
  if (!self->_hidesNotificationContent)
  {
    [(NCExpandedPlatterView *)self _layoutNotificationContentView];
    [(NCNotificationSeamlessContentView *)self->_notificationContentView frame];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    double v11 = [(PLExpandedPlatterView *)self customContentView];
    [v11 frame];

    v16.origin.x = v4;
    v16.origin.y = v6;
    v16.size.double width = v8;
    v16.size.height = v10;
    CGRectGetHeight(v16);
    double v12 = [(PLExpandedPlatterView *)self customContentView];
    UIRectIntegralWithScale();
    objc_msgSend(v12, "setFrame:");
  }
  if (self->_scrollViewPinnedToBottom)
  {
    objc_super v13 = [(PLExpandedPlatterView *)self scrollView];
    [v13 contentSize];
    [(NCExpandedPlatterView *)self frame];
    CGRectGetHeight(v17);
    UICeilToScale();
    objc_msgSend(v13, "setContentOffset:", 0.0, v14);
  }
}

- (BOOL)_tapGestureRecognizerShouldReceiveTouch:(id)a3
{
  id v4 = a3;
  double v5 = [v4 view];
  CGFloat v6 = [(PLExpandedPlatterView *)self _mainContentView];
  int v7 = [v5 isDescendantOfView:v6];

  CGFloat v8 = [(PLExpandedPlatterView *)self delegate];
  if (v7)
  {
    if (objc_opt_respondsToSelector()) {
      char v9 = [v8 expandedPlatterView:self tapGestureRecognizerShouldReceiveTouch:v4];
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (NSArray)menuActions
{
  return self->_menuActions;
}

- (void)setMenuActions:(id)a3
{
}

- (BOOL)hidesNotificationContent
{
  return self->_hidesNotificationContent;
}

- (BOOL)isScrollViewPinnedToBottom
{
  return self->_scrollViewPinnedToBottom;
}

- (void)setScrollViewPinnedToBottom:(BOOL)a3
{
  self->_scrollViewPinnedToBottom = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuActions, 0);
  objc_storeStrong((id *)&self->_defaultTapGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_notificationContentView, 0);
}

@end