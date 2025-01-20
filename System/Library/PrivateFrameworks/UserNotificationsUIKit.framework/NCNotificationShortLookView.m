@interface NCNotificationShortLookView
- (BOOL)_isBanner;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)alignContentToBottom;
- (BOOL)auxiliaryOptionsVisible;
- (BOOL)disableDimming;
- (BOOL)hasShadow;
- (BOOL)hideDate;
- (BOOL)isBackgroundBlurred;
- (BOOL)isDateAllDay;
- (BOOL)isHighlighted;
- (BOOL)isNotificationContentViewHidden;
- (BOOL)isTruncatingSecondaryText;
- (BOOL)screenCaptureProhibited;
- (CGSize)_sizeThatFitsContentWithSize:(CGSize)a3 withAuxiliaryOptionsViewVisible:(BOOL)a4;
- (CGSize)contentSizeForSize:(CGSize)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3;
- (MTMaterialView)backgroundMaterialView;
- (MTVisualStylingProvider)importantTextVisualStylingProvider;
- (NCBadgedIconView)badgedIconView;
- (NCNotificationShortLookView)initWithFrame:(CGRect)a3;
- (NCNotificationShortLookViewDelegate)delegate;
- (NSArray)auxiliaryOptionActions;
- (NSArray)auxiliaryOptionButtons;
- (NSAttributedString)contentSummaryText;
- (NSAttributedString)importantAttributedText;
- (NSAttributedString)secondaryText;
- (NSDate)date;
- (NSString)auxiliaryOptionsSummaryText;
- (NSString)footerText;
- (NSString)importantText;
- (NSString)materialGroupNameBase;
- (NSString)primarySubtitleText;
- (NSString)primaryText;
- (NSString)title;
- (NSTimeZone)timeZone;
- (UIAction)inlineAction;
- (UIImage)thumbnail;
- (UIImageConfiguration)importantTextImageConfiguration;
- (UIView)accessoryView;
- (UIView)customContentView;
- (double)_continuousCornerRadius;
- (double)_cornerRadius;
- (double)backgroundAlpha;
- (double)contentAlpha;
- (double)dateAlpha;
- (id)_fontProvider;
- (id)_newNotificationContentView;
- (id)_notificationContentView;
- (id)notificationContentView;
- (int64_t)dateFormatStyle;
- (int64_t)materialRecipe;
- (unint64_t)maximumNumberOfPrimaryTextLines;
- (unint64_t)maximumNumberOfSecondaryTextLines;
- (void)_configureAuxiliaryOptionsViewIfNecessary;
- (void)_configureNotificationContentViewIfNecessary;
- (void)_configurePlatterViewIfNeccesary;
- (void)_layoutAuxiliaryOptionsView;
- (void)_layoutNotificationContentView;
- (void)_setBanner:(BOOL)a3;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_setFontProvider:(id)a3;
- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3;
- (void)didInvalidateSizeFromNotificationSeamlessContentView:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAlignContentToBottom:(BOOL)a3;
- (void)setAuxiliaryOptionActions:(id)a3;
- (void)setAuxiliaryOptionsSummaryText:(id)a3;
- (void)setAuxiliaryOptionsVisible:(BOOL)a3;
- (void)setBackgroundAlpha:(double)a3;
- (void)setBackgroundBlurred:(BOOL)a3;
- (void)setBadgedIconView:(id)a3;
- (void)setContentAlpha:(double)a3;
- (void)setContentSummaryText:(id)a3;
- (void)setDate:(id)a3;
- (void)setDateAllDay:(BOOL)a3;
- (void)setDateAlpha:(double)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableDimming:(BOOL)a3;
- (void)setFooterText:(id)a3;
- (void)setHasShadow:(BOOL)a3;
- (void)setHideDate:(BOOL)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImportantAttributedText:(id)a3;
- (void)setImportantText:(id)a3;
- (void)setImportantTextVisualStylingProvider:(id)a3;
- (void)setInlineAction:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setMaterialRecipe:(int64_t)a3;
- (void)setMaximumNumberOfPrimaryTextLines:(unint64_t)a3;
- (void)setMaximumNumberOfSecondaryTextLines:(unint64_t)a3;
- (void)setNotificationContentViewHidden:(BOOL)a3;
- (void)setPrimarySubtitleText:(id)a3;
- (void)setPrimaryText:(id)a3;
- (void)setScreenCaptureProhibited:(BOOL)a3;
- (void)setSecondaryText:(id)a3;
- (void)setThumbnail:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)startLightEffect;
- (void)stopLightEffect;
@end

@implementation NCNotificationShortLookView

- (NCNotificationShortLookView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)NCNotificationShortLookView;
  v3 = -[NCNotificationShortLookView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_backgroundAlpha = 1.0;
    v3->_contentAlpha = 1.0;
    v3->_disableDimming = 0;
    [(NCNotificationShortLookView *)v3 _configurePlatterViewIfNeccesary];
  }
  return v4;
}

- (NSString)title
{
  return 0;
}

- (BOOL)isNotificationContentViewHidden
{
  [(NCNotificationContentDisplaying *)self->_notificationContentView alpha];
  return v2 == 0.0;
}

- (void)setNotificationContentViewHidden:(BOOL)a3
{
  if (a3) {
    double v4 = 0.0;
  }
  else {
    double v4 = 1.0;
  }
  v5 = [(NCNotificationShortLookView *)self _notificationContentView];
  [v5 setAlpha:v4];

  auxiliaryOptionsView = self->_auxiliaryOptionsView;

  [(NCAuxiliaryOptionsView *)auxiliaryOptionsView setAlpha:v4];
}

- (MTMaterialView)backgroundMaterialView
{
  return [(PLPlatterView *)self->_platterView backgroundMaterialView];
}

- (BOOL)isHighlighted
{
  return [(PLPlatterView *)self->_platterView isHighlighted];
}

- (void)setHighlighted:(BOOL)a3
{
}

- (BOOL)isTruncatingSecondaryText
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  notificationContentView = self->_notificationContentView;

  return [(NCNotificationContentDisplaying *)notificationContentView isTruncatingSecondaryText];
}

- (void)setAlignContentToBottom:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    notificationContentView = self->_notificationContentView;
    [(NCNotificationContentDisplaying *)notificationContentView setAlignContentToBottom:v3];
  }
}

- (void)setDisableDimming:(BOOL)a3
{
  if (self->_disableDimming != a3)
  {
    self->_disableDimming = a3;
    -[NCNotificationListStackDimmingOverlayView setHidden:](self->_stackDimmingOverlayView, "setHidden:");
  }
}

- (void)configureStackDimmingForTransform:(CGAffineTransform *)a3
{
  if (a3->a <= 0.94) {
    double v4 = dbl_1D7D95CC0[a3->a < 0.94];
  }
  else {
    double v4 = 0.0;
  }
  if (v4 > 0.0 && !self->_stackDimmingOverlayView)
  {
    v5 = [NCNotificationListStackDimmingOverlayView alloc];
    [(NCNotificationShortLookView *)self bounds];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [(PLPlatterView *)self->_platterView _continuousCornerRadius];
    v15 = -[NCNotificationListStackDimmingOverlayView initWithFrame:cornerRadius:](v5, "initWithFrame:cornerRadius:", v7, v9, v11, v13, v14);
    stackDimmingOverlayView = self->_stackDimmingOverlayView;
    self->_stackDimmingOverlayView = v15;

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__NCNotificationShortLookView_configureStackDimmingForTransform___block_invoke;
    v17[3] = &unk_1E6A91BB0;
    v17[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v17];
  }
  [(NCNotificationListStackDimmingOverlayView *)self->_stackDimmingOverlayView setAlpha:v4];
  [(NCNotificationListStackDimmingOverlayView *)self->_stackDimmingOverlayView setHidden:self->_disableDimming];
}

void __65__NCNotificationShortLookView_configureStackDimmingForTransform___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = *(void **)(v1 + 408);
  uint64_t v3 = *(void *)(v1 + 440);
  id v4 = [v2 customContentView];
  [v2 insertSubview:v3 belowSubview:v4];
}

- (id)notificationContentView
{
  return self->_notificationContentView;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[NCNotificationShortLookView contentSizeForSize:](self, "contentSizeForSize:", a3.width, a3.height);

  -[NCNotificationShortLookView sizeThatFitsContentWithSize:](self, "sizeThatFitsContentWithSize:");
  result.height = v5;
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationShortLookView;
  [(NCNotificationShortLookView *)&v3 layoutSubviews];
  [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
  [(NCNotificationShortLookView *)self _layoutNotificationContentView];
  [(NCNotificationShortLookView *)self _layoutAuxiliaryOptionsView];
}

- (double)_continuousCornerRadius
{
  [(PLPlatterView *)self->_platterView _continuousCornerRadius];
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
}

- (double)_cornerRadius
{
  [(PLPlatterView *)self->_platterView _cornerRadius];
  return result;
}

- (void)_setCornerRadius:(double)a3
{
}

- (UIView)customContentView
{
  return [(PLPlatterView *)self->_platterView customContentView];
}

- (BOOL)hasShadow
{
  return [(PLPlatterView *)self->_platterView hasShadow];
}

- (void)setHasShadow:(BOOL)a3
{
}

- (BOOL)isBackgroundBlurred
{
  return [(PLPlatterView *)self->_platterView isBackgroundBlurred];
}

- (void)setBackgroundBlurred:(BOOL)a3
{
}

- (void)startLightEffect
{
  double v2 = self->_platterView;
  NSSelectorFromString(&cfstr_Startlighteffe.isa);
  if (objc_opt_respondsToSelector()) {
    [(PLPlatterView *)v2 performSelector:NSSelectorFromString(&cfstr_Startlighteffe.isa)];
  }
}

- (void)stopLightEffect
{
  double v2 = self->_platterView;
  NSSelectorFromString(&cfstr_Stoplighteffec.isa);
  if (objc_opt_respondsToSelector()) {
    [(PLPlatterView *)v2 performSelector:NSSelectorFromString(&cfstr_Stoplighteffec.isa)];
  }
}

- (CGSize)contentSizeForSize:(CGSize)a3
{
  -[PLPlatterView contentSizeForSize:](self->_platterView, "contentSizeForSize:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CGSize)sizeThatFitsContentWithSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  BOOL v6 = [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView auxiliaryOptionsVisible];

  -[NCNotificationShortLookView _sizeThatFitsContentWithSize:withAuxiliaryOptionsViewVisible:](self, "_sizeThatFitsContentWithSize:withAuxiliaryOptionsViewVisible:", v6, width, height);
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (NSString)primaryText
{
  return (NSString *)[(NCNotificationContentDisplaying *)self->_notificationContentView primaryText];
}

- (void)setPrimaryText:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationContentDisplaying *)self->_notificationContentView primaryText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationContentDisplaying *)self->_notificationContentView setPrimaryText:v6];
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (NSString)primarySubtitleText
{
  return (NSString *)[(NCNotificationContentDisplaying *)self->_notificationContentView primarySubtitleText];
}

- (void)setContentSummaryText:(id)a3
{
  id v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    double v4 = [(NCNotificationContentDisplaying *)self->_notificationContentView contentSummaryText];
    char v5 = BSEqualObjects();

    if ((v5 & 1) == 0)
    {
      [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
      if (objc_opt_respondsToSelector()) {
        [(NCNotificationContentDisplaying *)self->_notificationContentView setContentSummaryText:v6];
      }
      [(NCNotificationShortLookView *)self setNeedsLayout];
    }
  }
}

- (NSAttributedString)contentSummaryText
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView contentSummaryText];
  }
  else
  {
    double v3 = 0;
  }

  return (NSAttributedString *)v3;
}

- (void)setPrimarySubtitleText:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationContentDisplaying *)self->_notificationContentView primarySubtitleText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationContentDisplaying *)self->_notificationContentView setPrimarySubtitleText:v6];
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (NSAttributedString)secondaryText
{
  return (NSAttributedString *)[(NCNotificationContentDisplaying *)self->_notificationContentView secondaryText];
}

- (void)setSecondaryText:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationContentDisplaying *)self->_notificationContentView secondaryText];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationContentDisplaying *)self->_notificationContentView setSecondaryText:v6];
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (NSString)importantText
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView importantText];
  }
  else
  {
    double v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setImportantText:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationShortLookView *)self importantText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setImportantText:v6];
    }
  }
}

- (NSAttributedString)importantAttributedText
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView importantAttributedText];
  }
  else
  {
    double v3 = 0;
  }

  return (NSAttributedString *)v3;
}

- (void)setImportantAttributedText:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationShortLookView *)self importantAttributedText];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setImportantAttributedText:v6];
    }
  }
}

- (UIImageConfiguration)importantTextImageConfiguration
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView importantTextImageConfiguration];
  }
  else
  {
    double v3 = 0;
  }

  return (UIImageConfiguration *)v3;
}

- (MTVisualStylingProvider)importantTextVisualStylingProvider
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView importantTextVisualStylingProvider];
  }
  else
  {
    double v3 = 0;
  }

  return (MTVisualStylingProvider *)v3;
}

- (void)setImportantTextVisualStylingProvider:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationShortLookView *)self importantTextVisualStylingProvider];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setImportantTextVisualStylingProvider:v6];
    }
  }
}

- (NSString)footerText
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView footerText];
  }
  else
  {
    double v3 = 0;
  }

  return (NSString *)v3;
}

- (void)setFooterText:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationShortLookView *)self footerText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setFooterText:v6];
    }
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (UIAction)inlineAction
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView inlineAction];
  }
  else
  {
    double v3 = 0;
  }

  return (UIAction *)v3;
}

- (void)setInlineAction:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationShortLookView *)self inlineAction];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setInlineAction:v6];
    }
  }
}

- (NCBadgedIconView)badgedIconView
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView badgedIconView];
  }
  else
  {
    double v3 = 0;
  }

  return (NCBadgedIconView *)v3;
}

- (void)setBadgedIconView:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationShortLookView *)self badgedIconView];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setBadgedIconView:v6];
    }
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (UIImage)thumbnail
{
  return (UIImage *)[(NCNotificationContentDisplaying *)self->_notificationContentView thumbnail];
}

- (void)setThumbnail:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationContentDisplaying *)self->_notificationContentView thumbnail];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    [(NCNotificationContentDisplaying *)self->_notificationContentView setThumbnail:v6];
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (NSDate)date
{
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView date];
  }
  else
  {
    double v3 = 0;
  }

  return (NSDate *)v3;
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationShortLookView *)self date];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setDate:v6];
    }
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (BOOL)isDateAllDay
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  notificationContentView = self->_notificationContentView;

  return [(NCNotificationContentDisplaying *)notificationContentView isDateAllDay];
}

- (void)setDateAllDay:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCNotificationShortLookView *)self isDateAllDay] != a3)
  {
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setDateAllDay:v3];
    }
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (NSTimeZone)timeZone
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(NCNotificationContentDisplaying *)self->_notificationContentView timeZone];
  }
  else
  {
    BOOL v3 = 0;
  }

  return (NSTimeZone *)v3;
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationShortLookView *)self timeZone];
  char v5 = BSEqualObjects();

  if ((v5 & 1) == 0)
  {
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setTimeZone:v6];
    }
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (int64_t)dateFormatStyle
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  notificationContentView = self->_notificationContentView;

  return [(NCNotificationContentDisplaying *)notificationContentView dateFormatStyle];
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if ([(NCNotificationShortLookView *)self dateFormatStyle] != a3)
  {
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setDateFormatStyle:a3];
    }
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (BOOL)hideDate
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  notificationContentView = self->_notificationContentView;

  return [(NCNotificationContentDisplaying *)notificationContentView hideDate];
}

- (void)setHideDate:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCNotificationShortLookView *)self hideDate] != a3)
  {
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setHideDate:v3];
    }
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (double)dateAlpha
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0.0;
  }
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentDisplaying *)notificationContentView dateAlpha];
  return result;
}

- (void)setDateAlpha:(double)a3
{
  [(NCNotificationShortLookView *)self dateAlpha];
  if (v5 != a3)
  {
    if (objc_opt_respondsToSelector()) {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setDateAlpha:a3];
    }
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

- (BOOL)screenCaptureProhibited
{
  return [(NCNotificationContentDisplaying *)self->_notificationContentView screenCaptureProhibited];
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  BOOL v3 = a3;
  [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentDisplaying *)notificationContentView setScreenCaptureProhibited:v3];
}

- (UIView)accessoryView
{
  return 0;
}

- (unint64_t)maximumNumberOfPrimaryTextLines
{
  return [(NCNotificationContentDisplaying *)self->_notificationContentView primaryTextMaximumNumberOfLines];
}

- (void)setMaximumNumberOfPrimaryTextLines:(unint64_t)a3
{
  [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
  [(NCNotificationContentDisplaying *)self->_notificationContentView setPrimaryTextMaximumNumberOfLines:a3];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentDisplaying *)notificationContentView setPrimarySubtitleTextMaximumNumberOfLines:a3];
}

- (unint64_t)maximumNumberOfSecondaryTextLines
{
  return [(NCNotificationContentDisplaying *)self->_notificationContentView secondaryTextMaximumNumberOfLines];
}

- (void)setMaximumNumberOfSecondaryTextLines:(unint64_t)a3
{
  [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  [(NCNotificationContentDisplaying *)notificationContentView setSecondaryTextMaximumNumberOfLines:a3];
}

- (NSString)auxiliaryOptionsSummaryText
{
  return [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView auxiliaryOptionsSummaryText];
}

- (void)setAuxiliaryOptionsSummaryText:(id)a3
{
  id v6 = a3;
  double v4 = [(NCNotificationShortLookView *)self auxiliaryOptionsSummaryText];
  char v5 = BSEqualStrings();

  if ((v5 & 1) == 0)
  {
    [(NCNotificationShortLookView *)self _configureAuxiliaryOptionsViewIfNecessary];
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsSummaryText:v6];
    [(NCNotificationShortLookView *)self setNeedsDisplay];
  }
}

- (NSArray)auxiliaryOptionButtons
{
  return [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView auxiliaryOptionButtons];
}

- (BOOL)auxiliaryOptionsVisible
{
  return [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView auxiliaryOptionsVisible];
}

- (void)setAuxiliaryOptionsVisible:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCNotificationShortLookView *)self auxiliaryOptionsVisible] != a3)
  {
    [(NCNotificationShortLookView *)self _configureAuxiliaryOptionsViewIfNecessary];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __58__NCNotificationShortLookView_setAuxiliaryOptionsVisible___block_invoke;
    v8[3] = &unk_1E6A91BB0;
    v8[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionsVisible:v3];
    char v5 = [(NCNotificationShortLookView *)self customContentView];
    id v6 = v5;
    double v7 = 23.5;
    if (!v3) {
      double v7 = 0.0;
    }
    [v5 _setContinuousCornerRadius:v7];

    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
}

uint64_t __58__NCNotificationShortLookView_setAuxiliaryOptionsVisible___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)setAuxiliaryOptionActions:(id)a3
{
  id v4 = a3;
  [(NCNotificationShortLookView *)self _configureAuxiliaryOptionsViewIfNecessary];
  [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAuxiliaryOptionActions:v4];

  [(NCNotificationShortLookView *)self setNeedsLayout];
}

- (NSArray)auxiliaryOptionActions
{
  return [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView auxiliaryOptionActions];
}

- (BOOL)adjustsFontForContentSizeCategory
{
  [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
  if ([(NCNotificationContentDisplaying *)self->_notificationContentView adjustsFontForContentSizeCategory])return 1; {
  if ((objc_opt_respondsToSelector() & 1) == 0)
  }
    return 0;
  platterView = self->_platterView;

  return [(PLPlatterView *)platterView adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector()) {
    [(PLPlatterView *)self->_platterView setAdjustsFontForContentSizeCategory:v3];
  }
  BOOL v5 = [(NCNotificationShortLookView *)self adjustsFontForContentSizeCategory];
  [(NCNotificationContentDisplaying *)self->_notificationContentView setAdjustsFontForContentSizeCategory:v5];
  auxiliaryOptionsView = self->_auxiliaryOptionsView;

  [(NCAuxiliaryOptionsView *)auxiliaryOptionsView setAdjustsFontForContentSizeCategory:v5];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  if (objc_opt_respondsToSelector()) {
    int v3 = [(PLPlatterView *)self->_platterView adjustForContentSizeCategoryChange];
  }
  else {
    int v3 = 0;
  }
  int v4 = [(NCNotificationContentDisplaying *)self->_notificationContentView adjustForContentSizeCategoryChange];
  int v5 = [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView adjustForContentSizeCategoryChange] | v4 | v3;
  if (v5 == 1) {
    [(NCNotificationShortLookView *)self setNeedsLayout];
  }
  return v5;
}

- (NSString)materialGroupNameBase
{
  return [(PLPlatterView *)self->_platterView materialGroupNameBase];
}

- (void)setMaterialGroupNameBase:(id)a3
{
  id v4 = a3;
  [(NCNotificationShortLookView *)self _configurePlatterViewIfNeccesary];
  [(PLPlatterView *)self->_platterView setMaterialGroupNameBase:v4];
  [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setMaterialGroupNameBase:v4];
}

- (int64_t)materialRecipe
{
  return [(PLPlatterView *)self->_platterView materialRecipe];
}

- (void)setMaterialRecipe:(int64_t)a3
{
  [(NCNotificationShortLookView *)self _configurePlatterViewIfNeccesary];
  [(PLPlatterView *)self->_platterView setMaterialRecipe:a3];
  auxiliaryOptionsView = self->_auxiliaryOptionsView;

  [(NCAuxiliaryOptionsView *)auxiliaryOptionsView setMaterialRecipe:a3];
}

- (void)setBackgroundAlpha:(double)a3
{
  if (self->_backgroundAlpha != a3)
  {
    self->_backgroundAlpha = a3;
    [(NCNotificationShortLookView *)self _configurePlatterViewIfNeccesary];
    int v5 = [(PLPlatterView *)self->_platterView backgroundMaterialView];

    if (!v5)
    {
      [(PLPlatterView *)self->_platterView setNeedsLayout];
      [(PLPlatterView *)self->_platterView layoutIfNeeded];
    }
    id v6 = [(PLPlatterView *)self->_platterView backgroundMaterialView];

    if (v6)
    {
      double v7 = [(PLPlatterView *)self->_platterView backgroundMaterialView];
      [v7 setAlpha:a3];

      id v8 = [(PLPlatterView *)self->_platterView backgroundMaterialView];
      [v8 setHidden:a3 < 0.001];
    }
  }
}

- (void)setContentAlpha:(double)a3
{
  if (self->_contentAlpha != a3)
  {
    self->_contentAlpha = a3;
    [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
    notificationContentView = self->_notificationContentView;
    [(NCNotificationContentDisplaying *)notificationContentView setAlpha:a3];
  }
}

- (CGSize)_sizeThatFitsContentWithSize:(CGSize)a3 withAuxiliaryOptionsViewVisible:(BOOL)a4
{
  BOOL v4 = a4;
  double width = a3.width;
  -[PLPlatterView sizeThatFitsContentWithSize:](self->_platterView, "sizeThatFitsContentWithSize:", a3.width, 0.0);
  double v8 = v7;
  double v10 = v9;
  [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
  -[NCNotificationContentDisplaying sizeThatFits:](self->_notificationContentView, "sizeThatFits:", width, 0.0);
  double v12 = v10 + v11;
  if (v4)
  {
    -[NCAuxiliaryOptionsView sizeThatFits:](self->_auxiliaryOptionsView, "sizeThatFits:", width, 0.0);
    double v12 = v12 + v13;
  }
  double v14 = v8;
  double v15 = v12;
  result.double height = v15;
  result.double width = v14;
  return result;
}

- (void)_configurePlatterViewIfNeccesary
{
  if (!self->_platterView)
  {
    int v3 = (PLPlatterView *)[objc_alloc(MEMORY[0x1E4F91460]) initWithRecipe:1];
    platterView = self->_platterView;
    self->_platterView = v3;

    [(PLPlatterView *)self->_platterView _setContinuousCornerRadius:23.5];
    [(PLPlatterView *)self->_platterView setAccessibilityIdentifier:@"ShortLook.Platter"];
    int v5 = [(PLPlatterView *)self->_platterView customContentView];
    [v5 setClipsToBounds:1];

    [(NCNotificationShortLookView *)self addSubview:self->_platterView];
    id v6 = self->_platterView;
    [(NCNotificationShortLookView *)self bounds];
    -[PLPlatterView setFrame:](v6, "setFrame:");
    double v7 = self->_platterView;
    [(PLPlatterView *)v7 setAutoresizingMask:18];
  }
}

- (id)_newNotificationContentView
{
  int v3 = objc_alloc_init(NCNotificationSeamlessContentView);
  [(NCNotificationSeamlessContentView *)v3 setDelegate:self];
  return v3;
}

- (void)_configureNotificationContentViewIfNecessary
{
  if (!self->_notificationContentView)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __75__NCNotificationShortLookView__configureNotificationContentViewIfNecessary__block_invoke;
    v2[3] = &unk_1E6A91BB0;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
  }
}

void __75__NCNotificationShortLookView__configureNotificationContentViewIfNecessary__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) _newNotificationContentView];
  uint64_t v3 = *(void *)(a1 + 32);
  BOOL v4 = *(void **)(v3 + 424);
  *(void *)(v3 + 424) = v2;

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v5 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "requiredVisualStyleCategories", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v16 + 1) + 8 * v9) integerValue];
        uint64_t v11 = *(void *)(a1 + 32);
        double v12 = *(void **)(v11 + 424);
        double v13 = [*(id *)(v11 + 408) visualStylingProviderForCategory:v10];
        [v12 setVisualStylingProvider:v13 forCategory:v10];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 424), "setAdjustsFontForContentSizeCategory:", objc_msgSend(*(id *)(a1 + 32), "adjustsFontForContentSizeCategory"));
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 424) setFontProvider:*(void *)(*(void *)(a1 + 32) + 416)];
  }
  double v14 = [*(id *)(a1 + 32) customContentView];
  [v14 setAccessibilityIdentifier:@"ShortLook.Platter.Content"];

  double v15 = [*(id *)(a1 + 32) customContentView];
  [v15 addSubview:*(void *)(*(void *)(a1 + 32) + 424)];
}

- (id)_notificationContentView
{
  [(NCNotificationShortLookView *)self _configureNotificationContentViewIfNecessary];
  notificationContentView = self->_notificationContentView;

  return notificationContentView;
}

- (void)_configureAuxiliaryOptionsViewIfNecessary
{
  if (!self->_auxiliaryOptionsView)
  {
    uint64_t v3 = objc_alloc_init(NCAuxiliaryOptionsView);
    auxiliaryOptionsView = self->_auxiliaryOptionsView;
    self->_auxiliaryOptionsView = v3;

    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setFontProvider:self->_fontProvider];
    [(NCAuxiliaryOptionsView *)self->_auxiliaryOptionsView setAdjustsFontForContentSizeCategory:[(NCNotificationShortLookView *)self adjustsFontForContentSizeCategory]];
    int v5 = self->_auxiliaryOptionsView;
    [(NCNotificationShortLookView *)self _continuousCornerRadius];
    -[NCAuxiliaryOptionsView _setContinuousCornerRadius:](v5, "_setContinuousCornerRadius:");
    uint64_t v6 = [(NCNotificationShortLookView *)self customContentView];
    [v6 addSubview:self->_auxiliaryOptionsView];

    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__NCNotificationShortLookView__configureAuxiliaryOptionsViewIfNecessary__block_invoke;
    v7[3] = &unk_1E6A91BB0;
    v7[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v7];
  }
}

uint64_t __72__NCNotificationShortLookView__configureAuxiliaryOptionsViewIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 432) layoutIfNeeded];
}

- (void)_layoutNotificationContentView
{
  if (self->_notificationContentView)
  {
    uint64_t v3 = [(NCNotificationShortLookView *)self customContentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;

    -[NCNotificationContentDisplaying sizeThatFits:](self->_notificationContentView, "sizeThatFits:", v5, v7);
    BSRectWithSize();
    notificationContentView = self->_notificationContentView;
    _NCMainScreenScale();
    UIRectIntegralWithScale();
    -[NCNotificationContentDisplaying setFrame:](notificationContentView, "setFrame:");
  }
}

- (void)_layoutAuxiliaryOptionsView
{
  if (self->_auxiliaryOptionsView)
  {
    [(NCNotificationShortLookView *)self bounds];
    -[NCAuxiliaryOptionsView sizeThatFits:](self->_auxiliaryOptionsView, "sizeThatFits:", v3, v4);
    BSRectWithSize();
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    [(NCNotificationContentDisplaying *)self->_notificationContentView frame];
    -[NCAuxiliaryOptionsView setFrame:](self->_auxiliaryOptionsView, "setFrame:", v6, CGRectGetMaxY(v16), v8, v10);
    auxiliaryOptionsView = self->_auxiliaryOptionsView;
    BOOL v12 = [(NCAuxiliaryOptionsView *)auxiliaryOptionsView auxiliaryOptionsVisible];
    double v13 = 0.0;
    if (v12)
    {
      BOOL v14 = [(NCNotificationShortLookView *)self isNotificationContentViewHidden];
      double v13 = 1.0;
      if (v14) {
        double v13 = 0.0;
      }
    }
    [(NCAuxiliaryOptionsView *)auxiliaryOptionsView setAlpha:v13];
  }
}

- (id)_fontProvider
{
  if (!self->_fontProvider)
  {
    if ([(NCNotificationShortLookView *)self adjustsFontForContentSizeCategory]) {
      [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    }
    else {
    double v3 = [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    }
    [(NCNotificationShortLookView *)self _setFontProvider:v3];
  }
  fontProvider = self->_fontProvider;

  return fontProvider;
}

- (void)_setFontProvider:(id)a3
{
  double v5 = (BSUIFontProvider *)a3;
  if (self->_fontProvider != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)&self->_fontProvider, a3);
    char v6 = objc_opt_respondsToSelector();
    double v5 = v7;
    if (v6)
    {
      [(NCNotificationContentDisplaying *)self->_notificationContentView setFontProvider:self->_fontProvider];
      double v5 = v7;
    }
  }
}

- (void)didInvalidateSizeFromNotificationSeamlessContentView:(id)a3
{
  id v4 = [(NCNotificationShortLookView *)self delegate];
  [v4 didInvalidateSizeFromNotificationShortLookView:self];
}

- (BOOL)alignContentToBottom
{
  return self->_alignContentToBottom;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (double)contentAlpha
{
  return self->_contentAlpha;
}

- (BOOL)disableDimming
{
  return self->_disableDimming;
}

- (NCNotificationShortLookViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationShortLookViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)_isBanner
{
  return self->_banner;
}

- (void)_setBanner:(BOOL)a3
{
  self->_banner = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_stackDimmingOverlayView, 0);
  objc_storeStrong((id *)&self->_auxiliaryOptionsView, 0);
  objc_storeStrong((id *)&self->_notificationContentView, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);

  objc_storeStrong((id *)&self->_platterView, 0);
}

@end