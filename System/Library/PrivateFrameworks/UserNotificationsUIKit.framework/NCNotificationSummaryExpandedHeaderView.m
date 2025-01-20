@interface NCNotificationSummaryExpandedHeaderView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)dismissModalFullScreenIfNeeded;
- (BOOL)isOnboarding;
- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate;
- (NCNotificationSummaryExpandedHeaderView)initWithFrame:(CGRect)a3;
- (NCNotificationSummaryExpandedHeaderViewDelegate)delegate;
- (NSDate)date;
- (NSString)subtitle;
- (NSString)title;
- (NSTimeZone)timeZone;
- (double)_allowedWidthForButtonInRect:(CGRect)a3;
- (id)_newOnboardingButtonWithTitle:(id)a3;
- (id)containerViewForToggleControlClickInteractionPresentedContent:(id)a3;
- (int64_t)dateFormatStyle;
- (unint64_t)_maximumNumberOfLinesForTitleText;
- (unint64_t)_numberOfLinesForSubtitleTextInFrame:(CGRect)a3;
- (unint64_t)_numberOfLinesForTitleTextInFrame:(CGRect)a3;
- (void)_configureControlsViewIfNecessary;
- (void)_configureDividerViewIfNecessary;
- (void)_configureOnboardingButtonsIfNecessary;
- (void)_configureTimeStampLabel;
- (void)_configureTimeStampLabelIfNecessary;
- (void)_handleClearAll:(id)a3;
- (void)_handleClearControlPrimaryAction:(id)a3;
- (void)_handleClearControlTouchUpInside:(id)a3;
- (void)_handleCollapseControlPrimaryAction:(id)a3;
- (void)_layoutControlsView;
- (void)_layoutDividerView;
- (void)_layoutOnboardingButtons;
- (void)_layoutSubtitleLabel;
- (void)_layoutTimeStampLabel;
- (void)_layoutTitleLabel;
- (void)_recycleTimeStampLabel;
- (void)_summaryOnboardingAccepted:(id)a3;
- (void)_summaryOnboardingRejected:(id)a3;
- (void)_tearDownTimeStampLabel;
- (void)_updateTextAttributes;
- (void)_updateTextAttributesForButtonLabel:(id)a3;
- (void)_updateTextAttributesForDateLabel;
- (void)_updateTextAttributesForSubtitleTextLabel;
- (void)_updateTextAttributesForTitleTextLabel;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)layoutSubviews;
- (void)resetClearButtonStateAnimated:(BOOL)a3;
- (void)setDate:(id)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setHandlerDelegate:(id)a3;
- (void)setOnboarding:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setTitle:(id)a3;
- (void)toggleControlDidBeginClickInteraction:(id)a3;
- (void)toggleControlDidDismssClickInteractionPresentedContent:(id)a3;
- (void)toggleControlDidPresentClickInteractionPresentedContent:(id)a3;
@end

@implementation NCNotificationSummaryExpandedHeaderView

- (NCNotificationSummaryExpandedHeaderView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationSummaryExpandedHeaderView;
  result = -[NCNotificationListBaseContentView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_onboarding = 0;
    result->_animateCollapseButtonLayout = 0;
  }
  return result;
}

- (NSString)title
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setTitle:(id)a3
{
  id v10 = a3;
  objc_super v4 = [(UILabel *)self->_titleLabel text];
  char v5 = [v4 isEqualToString:v10];

  if ((v5 & 1) == 0)
  {
    titleLabel = self->_titleLabel;
    if (!titleLabel)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v8 = self->_titleLabel;
      self->_titleLabel = v7;

      [(NCNotificationSummaryExpandedHeaderView *)self addSubview:self->_titleLabel];
      [(NCNotificationSummaryExpandedHeaderView *)self _updateTextAttributesForTitleTextLabel];
      v9 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
      [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_titleLabel style:0 visualStylingProvider:v9 outgoingProvider:0];

      titleLabel = self->_titleLabel;
    }
    [(UILabel *)titleLabel setText:v10];
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (NSString)subtitle
{
  return [(UILabel *)self->_subtitleLabel text];
}

- (void)setSubtitle:(id)a3
{
  id v10 = a3;
  objc_super v4 = [(UILabel *)self->_subtitleLabel text];
  char v5 = [v4 isEqualToString:v10];

  if ((v5 & 1) == 0)
  {
    subtitleLabel = self->_subtitleLabel;
    if (!subtitleLabel)
    {
      v7 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
      v8 = self->_subtitleLabel;
      self->_subtitleLabel = v7;

      [(NCNotificationSummaryExpandedHeaderView *)self addSubview:self->_subtitleLabel];
      [(NCNotificationSummaryExpandedHeaderView *)self _updateTextAttributesForSubtitleTextLabel];
      v9 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
      [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_subtitleLabel style:0 visualStylingProvider:v9 outgoingProvider:0];

      subtitleLabel = self->_subtitleLabel;
    }
    [(UILabel *)subtitleLabel setText:v10];
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (void)setDate:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_super v4 = (NSDate *)[v6 copy];
    date = self->_date;
    self->_date = v4;

    [(NCNotificationSummaryExpandedHeaderView *)self _tearDownTimeStampLabel];
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (void)setTimeZone:(id)a3
{
  id v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_super v4 = (NSTimeZone *)[v6 copy];
    timeZone = self->_timeZone;
    self->_timeZone = v4;

    [(NCNotificationSummaryExpandedHeaderView *)self _tearDownTimeStampLabel];
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (void)setDateFormatStyle:(int64_t)a3
{
  if (self->_dateFormatStyle != a3)
  {
    self->_dateFormatStyle = a3;
    [(NCNotificationSummaryExpandedHeaderView *)self _tearDownTimeStampLabel];
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (void)setOnboarding:(BOOL)a3
{
  if (self->_onboarding != a3)
  {
    self->_onboarding = a3;
    if (!a3)
    {
      [(UIButton *)self->_onboardingAcceptButton removeFromSuperview];
      onboardingAcceptButton = self->_onboardingAcceptButton;
      self->_onboardingAcceptButton = 0;

      [(UIButton *)self->_onboardingRejectButton removeFromSuperview];
      onboardingRejectButton = self->_onboardingRejectButton;
      self->_onboardingRejectButton = 0;
    }
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  timeStampLabel = self->_timeStampLabel;
  if (timeStampLabel)
  {
    v7 = [(BSUIDateLabel *)timeStampLabel font];
    [v7 lineHeight];
  }
  double v8 = width + -6.0;
  titleLabel = self->_titleLabel;
  if (titleLabel) {
    -[UILabel unui_measuringHeightWithNumberOfLines:](titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v8, height));
  }
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel) {
    -[UILabel unui_measuringHeightWithNumberOfLines:](subtitleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForSubtitleTextInFrame:](self, "_numberOfLinesForSubtitleTextInFrame:", 0.0, 0.0, v8, height));
  }
  if ([(NCNotificationSummaryExpandedHeaderView *)self isOnboarding])
  {
    -[NCNotificationSummaryExpandedHeaderView _allowedWidthForButtonInRect:](self, "_allowedWidthForButtonInRect:", 0.0, 0.0, width, height);
    double v12 = v11;
    -[UIButton sizeThatFits:](self->_onboardingAcceptButton, "sizeThatFits:");
    -[UIButton sizeThatFits:](self->_onboardingRejectButton, "sizeThatFits:", v12, height);
    v13 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    UIContentSizeCategoryIsAccessibilityCategory(v13);
  }
  v14 = [(NCNotificationSummaryExpandedHeaderView *)self traitCollection];
  [v14 displayScale];
  UICeilToScale();
  double v16 = v15;

  double v17 = width;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryExpandedHeaderView;
  [(NCNotificationSummaryExpandedHeaderView *)&v3 layoutSubviews];
  [(NCNotificationSummaryExpandedHeaderView *)self _configureTimeStampLabelIfNecessary];
  [(NCNotificationSummaryExpandedHeaderView *)self _configureDividerViewIfNecessary];
  [(NCNotificationSummaryExpandedHeaderView *)self _configureOnboardingButtonsIfNecessary];
  [(NCNotificationSummaryExpandedHeaderView *)self _configureControlsViewIfNecessary];
  [(NCNotificationSummaryExpandedHeaderView *)self _layoutTimeStampLabel];
  [(NCNotificationSummaryExpandedHeaderView *)self _layoutControlsView];
  [(NCNotificationSummaryExpandedHeaderView *)self _layoutTitleLabel];
  [(NCNotificationSummaryExpandedHeaderView *)self _layoutSubtitleLabel];
  [(NCNotificationSummaryExpandedHeaderView *)self _layoutOnboardingButtons];
  [(NCNotificationSummaryExpandedHeaderView *)self _layoutDividerView];
}

- (void)_configureDividerViewIfNecessary
{
  if (self->_onboarding && !self->_dividerView)
  {
    id v3 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    objc_super v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    dividerView = self->_dividerView;
    self->_dividerView = v4;

    id v6 = self->_dividerView;
    v7 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v6 setBackgroundColor:v7];

    double v8 = self->_dividerView;
    v9 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
    [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:v8 style:3 visualStylingProvider:v9 outgoingProvider:0];

    id v10 = self->_dividerView;
    [(NCNotificationSummaryExpandedHeaderView *)self addSubview:v10];
  }
}

- (void)_configureOnboardingButtonsIfNecessary
{
  if (self->_onboarding)
  {
    if (self->_onboardingAcceptButton) {
      goto LABEL_4;
    }
    id v3 = NCUserNotificationsUIKitFrameworkBundle();
    objc_super v4 = [v3 localizedStringForKey:@"NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_BUTTON_TITLE_ACCEPT" value:&stru_1F2F516F8 table:0];
    char v5 = [(NCNotificationSummaryExpandedHeaderView *)self _newOnboardingButtonWithTitle:v4];
    onboardingAcceptButton = self->_onboardingAcceptButton;
    self->_onboardingAcceptButton = v5;

    [(UIButton *)self->_onboardingAcceptButton addTarget:self action:sel__summaryOnboardingAccepted_ forControlEvents:64];
    if (self->_onboarding)
    {
LABEL_4:
      if (!self->_onboardingRejectButton)
      {
        v7 = NCUserNotificationsUIKitFrameworkBundle();
        double v8 = [v7 localizedStringForKey:@"NOTIFICATION_SUMMARY_ONBOARDING_SUGGESTION_BUTTON_TITLE_REJECT" value:&stru_1F2F516F8 table:0];
        v9 = [(NCNotificationSummaryExpandedHeaderView *)self _newOnboardingButtonWithTitle:v8];
        onboardingRejectButton = self->_onboardingRejectButton;
        self->_onboardingRejectButton = v9;

        double v11 = self->_onboardingRejectButton;
        [(UIButton *)v11 addTarget:self action:sel__summaryOnboardingRejected_ forControlEvents:64];
      }
    }
  }
}

- (id)_newOnboardingButtonWithTitle:(id)a3
{
  id v4 = a3;
  char v5 = objc_alloc_init(NCNotificationSummaryOnboardingButton);
  id v6 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  [(NCNotificationSummaryOnboardingButton *)v5 setTitleColor:v6 forState:0];

  [(NCNotificationSummaryOnboardingButton *)v5 setTitle:v4 forState:0];
  [(NCNotificationSummaryExpandedHeaderView *)self _updateTextAttributesForButtonLabel:v5];
  v7 = [(NCNotificationSummaryOnboardingButton *)v5 titleLabel];
  [v7 setAdjustsFontSizeToFitWidth:1];

  [(NCNotificationSummaryExpandedHeaderView *)self addSubview:v5];
  return v5;
}

- (void)_configureControlsViewIfNecessary
{
  if (!self->_controlsView)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __76__NCNotificationSummaryExpandedHeaderView__configureControlsViewIfNecessary__block_invoke;
    v2[3] = &unk_1E6A91BB0;
    v2[4] = self;
    [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
  }
}

void __76__NCNotificationSummaryExpandedHeaderView__configureControlsViewIfNecessary__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  uint64_t v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(void **)(v4 + 504);
  *(void *)(v4 + 504) = v3;

  [*(id *)(a1 + 32) addSubview:*(void *)(*(void *)(a1 + 32) + 504)];
  id v20 = [*(id *)(a1 + 32) delegate];
  id v6 = [v20 materialGroupNameBaseForNotificationSummaryExpandedHeaderView:*(void *)(a1 + 32)];
  v7 = (void *)MEMORY[0x1E4FB1830];
  double v8 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB2998]];
  v9 = [v7 configurationWithFont:v8 scale:2];

  id v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"chevron.down" withConfiguration:v9];
  double v11 = (void *)[objc_alloc(MEMORY[0x1E4F91430]) initWithMaterialRecipe:1];
  [v11 setGlyph:v10];
  [v11 setMaterialGroupNameBase:v6];
  [v11 setAccessibilityIdentifier:@"notification-summary-collapse-control"];
  [v11 addTarget:*(void *)(a1 + 32) action:sel__handleCollapseControlPrimaryAction_ forControlEvents:0x2000];
  [*(id *)(*(void *)(a1 + 32) + 504) addSubview:v11];
  uint64_t v12 = *(void *)(a1 + 32);
  v13 = *(void **)(v12 + 488);
  *(void *)(v12 + 488) = v11;
  id v14 = v11;

  double v15 = NCUserNotificationsUIKitFrameworkBundle();
  double v16 = [v15 localizedStringForKey:@"NOTIFICATION_LIST_CLEAR_ALL" value:&stru_1F2F516F8 table:0];
  double v17 = +[NCToggleControl dismissControlWithMaterialRecipe:1 clearAllText:v16];

  [v17 setDelegate:*(void *)(a1 + 32)];
  [v17 setMaterialGroupNameBase:v6];
  [v17 setAdjustsFontForContentSizeCategory:1];
  [v17 addTarget:*(void *)(a1 + 32) action:sel__handleClearControlTouchUpInside_ forControlEvents:64];
  [v17 addTarget:*(void *)(a1 + 32) action:sel__handleClearControlPrimaryAction_ forControlEvents:0x2000];
  [v17 addTarget:*(void *)(a1 + 32) forPreviewInteractionPresentedContentWithAction:sel__handleClearAll_];
  [*(id *)(*(void *)(a1 + 32) + 504) addSubview:v17];
  uint64_t v18 = *(void *)(a1 + 32);
  v19 = *(void **)(v18 + 496);
  *(void *)(v18 + 496) = v17;
}

- (void)_handleClearControlTouchUpInside:(id)a3
{
  uint64_t v4 = [(NCNotificationSummaryExpandedHeaderView *)self delegate];
  objc_msgSend(v4, "notificationSummaryExpandedHeaderView:didTransitionToClearState:", self, -[NCToggleControl isExpanded](self->_clearControl, "isExpanded") ^ 1);

  self->_animateCollapseButtonLayout = 1;

  [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
}

- (void)_handleClearControlPrimaryAction:(id)a3
{
  id v4 = [(NCNotificationSummaryExpandedHeaderView *)self delegate];
  [v4 notificationSummaryExpandedHeaderViewRequestsClearingSummary:self];
}

- (void)_handleCollapseControlPrimaryAction:(id)a3
{
  self->_animateCollapseButtonLayout = 0;
  [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  memset(&v10, 0, sizeof(v10));
  int v4 = [(NCNotificationSummaryExpandedHeaderView *)self _shouldReverseLayoutDirection];
  double v5 = 1.57;
  if (v4) {
    double v5 = -1.57;
  }
  CGAffineTransformMakeRotation(&v10, v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  CGAffineTransform v9 = v10;
  v8[2] = __79__NCNotificationSummaryExpandedHeaderView__handleCollapseControlPrimaryAction___block_invoke;
  v8[3] = &unk_1E6A931F8;
  v8[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __79__NCNotificationSummaryExpandedHeaderView__handleCollapseControlPrimaryAction___block_invoke_2;
  v7[3] = &unk_1E6A91EF8;
  v7[4] = self;
  [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:0 friction:v8 interactive:v7 animations:200.0 completion:25.0];
  id v6 = [(NCNotificationSummaryExpandedHeaderView *)self delegate];
  [v6 notificationSummaryExpandedHeaderViewRequestsCollapsingSummary:self];
}

uint64_t __79__NCNotificationSummaryExpandedHeaderView__handleCollapseControlPrimaryAction___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 488);
  long long v2 = *(_OWORD *)(a1 + 56);
  v4[0] = *(_OWORD *)(a1 + 40);
  v4[1] = v2;
  v4[2] = *(_OWORD *)(a1 + 72);
  return [v1 setTransform:v4];
}

uint64_t __79__NCNotificationSummaryExpandedHeaderView__handleCollapseControlPrimaryAction___block_invoke_2(uint64_t a1)
{
  long long v2 = *(void **)(*(void *)(a1 + 32) + 488);
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v5[0] = *MEMORY[0x1E4F1DAB8];
  v5[1] = v3;
  v5[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:v5];
  return [*(id *)(*(void *)(a1 + 32) + 496) setExpanded:0];
}

- (void)_handleClearAll:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained notificationSummaryExpandedHeaderViewRequestsClearAll:self];
  [(NCToggleControl *)self->_clearControl dismissModalFullScreenIfNeeded];
}

- (void)_layoutTimeStampLabel
{
  timeStampLabel = self->_timeStampLabel;
  if (timeStampLabel)
  {
    [(BSUIDateLabel *)timeStampLabel frame];
    [(NCNotificationSummaryExpandedHeaderView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(NCNotificationSummaryExpandedHeaderView *)self _shouldReverseLayoutDirection];
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.double width = v9;
    v16.size.double height = v11;
    CGRectGetWidth(v16);
    uint64_t v12 = [(BSUIDateLabel *)self->_timeStampLabel font];
    [v12 lineHeight];
    v13 = [(NCNotificationSummaryExpandedHeaderView *)self traitCollection];
    [v13 displayScale];
    UICeilToScale();

    UIRectIntegralWithScale();
    id v14 = self->_timeStampLabel;
    -[BSUIDateLabel setFrame:](v14, "setFrame:");
  }
}

- (void)_layoutControlsView
{
  controlsView = self->_controlsView;
  if (controlsView)
  {
    [(UIView *)controlsView frame];
    [(NCNotificationSummaryExpandedHeaderView *)self bounds];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    -[NCToggleControl sizeThatFits:](self->_clearControl, "sizeThatFits:", v8, v10);
    [(NCNotificationSummaryExpandedHeaderView *)self _shouldReverseLayoutDirection];
    UIRectIntegralWithScale();
    -[NCToggleControl setFrame:](self->_clearControl, "setFrame:");
    [(NCToggleControl *)self->_clearControl layoutIfNeeded];
    char v12 = [(NCNotificationSummaryExpandedHeaderView *)self _shouldReverseLayoutDirection];
    v13 = [(PLGlyphControl *)self->_clearControl _backgroundMaterialView];
    [v13 frame];
    if (v12) {
      CGRectGetMaxX(*(CGRect *)&v14);
    }
    else {
      CGRectGetMinX(*(CGRect *)&v14);
    }

    [(NCNotificationSummaryExpandedHeaderView *)self _shouldReverseLayoutDirection];
    UIRectIntegralWithScale();
    if (self->_animateCollapseButtonLayout)
    {
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __62__NCNotificationSummaryExpandedHeaderView__layoutControlsView__block_invoke;
      v23[3] = &unk_1E6A923E8;
      v23[4] = self;
      v23[5] = v18;
      v23[6] = v19;
      v23[7] = v20;
      v23[8] = v21;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __62__NCNotificationSummaryExpandedHeaderView__layoutControlsView__block_invoke_2;
      v22[3] = &unk_1E6A91EF8;
      v22[4] = self;
      [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:0 friction:v23 interactive:v22 animations:200.0 completion:25.0];
    }
    else
    {
      -[PLGlyphControl setFrame:](self->_collapseControl, "setFrame:");
    }
    if (([(NCNotificationSummaryExpandedHeaderView *)self _shouldReverseLayoutDirection] & 1) == 0)
    {
      v24.origin.x = v5;
      v24.origin.y = v7;
      v24.size.double width = v9;
      v24.size.double height = v11;
      CGRectGetMaxX(v24);
    }
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_controlsView, "setFrame:");
  }
}

uint64_t __62__NCNotificationSummaryExpandedHeaderView__layoutControlsView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 488), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __62__NCNotificationSummaryExpandedHeaderView__layoutControlsView__block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 512) = 0;
  return result;
}

- (void)_layoutTitleLabel
{
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(UILabel *)titleLabel frame];
    [(NCNotificationSummaryExpandedHeaderView *)self bounds];
    CGFloat x = v17.origin.x;
    CGFloat y = v17.origin.y;
    CGFloat width = v17.size.width;
    CGFloat height = v17.size.height;
    double v8 = v17.size.width + -6.0;
    double v9 = CGRectGetHeight(v17);
    -[UILabel unui_measuringHeightWithNumberOfLines:](self->_titleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v8, v9));
    CGFloat v11 = v10;
    double v12 = 6.0;
    if ([(NCNotificationSummaryExpandedHeaderView *)self _shouldReverseLayoutDirection])
    {
      v18.origin.CGFloat x = x;
      v18.origin.CGFloat y = y;
      v18.size.CGFloat width = width;
      v18.size.CGFloat height = height;
      double v12 = CGRectGetMaxX(v18) + -6.0 - v8;
    }
    timeStampLabel = self->_timeStampLabel;
    if (timeStampLabel)
    {
      [(BSUIDateLabel *)timeStampLabel frame];
      double v14 = CGRectGetMaxY(v19) + 2.0;
    }
    else
    {
      double v14 = 55.0;
    }
    -[UILabel unui_drawingHeightWithNumberOfLines:](self->_titleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForTitleTextInFrame:](self, "_numberOfLinesForTitleTextInFrame:", 0.0, 0.0, v8, v9));
    v20.origin.CGFloat x = v12;
    v20.origin.CGFloat y = v14;
    v20.size.CGFloat width = v8;
    v20.size.CGFloat height = v11;
    CGRectGetWidth(v20);
    BSRectWithSize();
    UIRectCenteredIntegralRectScale();
    UIRectIntegralWithScale();
    double v15 = self->_titleLabel;
    -[UILabel setFrame:](v15, "setFrame:");
  }
}

- (void)_layoutSubtitleLabel
{
  subtitleLabel = self->_subtitleLabel;
  if (!subtitleLabel) {
    return;
  }
  [(UILabel *)subtitleLabel frame];
  [(NCNotificationSummaryExpandedHeaderView *)self bounds];
  CGFloat x = v18.origin.x;
  CGFloat y = v18.origin.y;
  CGFloat width = v18.size.width;
  CGFloat height = v18.size.height;
  double v8 = v18.size.width + -6.0;
  double v9 = CGRectGetHeight(v18);
  -[UILabel unui_measuringHeightWithNumberOfLines:](self->_subtitleLabel, "unui_measuringHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForSubtitleTextInFrame:](self, "_numberOfLinesForSubtitleTextInFrame:", 0.0, 0.0, v8, v9));
  CGFloat v11 = v10;
  double v12 = 6.0;
  if ([(NCNotificationSummaryExpandedHeaderView *)self _shouldReverseLayoutDirection])
  {
    v19.origin.CGFloat x = x;
    v19.origin.CGFloat y = y;
    v19.size.CGFloat width = width;
    v19.size.CGFloat height = height;
    double v12 = CGRectGetMaxX(v19) + -6.0 - v8;
  }
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    double v14 = 5.0;
  }
  else
  {
    titleLabel = self->_timeStampLabel;
    if (!titleLabel)
    {
      double v15 = 55.0;
      goto LABEL_10;
    }
    double v14 = 2.0;
  }
  [titleLabel frame];
  double v15 = CGRectGetMaxY(v20) + v14;
LABEL_10:
  -[UILabel unui_drawingHeightWithNumberOfLines:](self->_subtitleLabel, "unui_drawingHeightWithNumberOfLines:", -[NCNotificationSummaryExpandedHeaderView _numberOfLinesForSubtitleTextInFrame:](self, "_numberOfLinesForSubtitleTextInFrame:", 0.0, 0.0, v8, v9));
  v21.origin.CGFloat x = v12;
  v21.origin.CGFloat y = v15;
  v21.size.CGFloat width = v8;
  v21.size.CGFloat height = v11;
  CGRectGetWidth(v21);
  BSRectWithSize();
  UIRectCenteredIntegralRectScale();
  UIRectIntegralWithScale();
  CGRect v16 = self->_subtitleLabel;

  -[UILabel setFrame:](v16, "setFrame:");
}

- (void)_layoutOnboardingButtons
{
  if (self->_onboarding)
  {
    [(NCNotificationSummaryExpandedHeaderView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    -[NCNotificationSummaryExpandedHeaderView _allowedWidthForButtonInRect:](self, "_allowedWidthForButtonInRect:");
    double v12 = v11;
    v35.origin.CGFloat x = v4;
    v35.origin.CGFloat y = v6;
    v35.size.CGFloat width = v8;
    v35.size.CGFloat height = v10;
    double Height = CGRectGetHeight(v35);
    -[UIButton sizeThatFits:](self->_onboardingAcceptButton, "sizeThatFits:", v12, Height);
    double v15 = v14;
    -[UIButton sizeThatFits:](self->_onboardingRejectButton, "sizeThatFits:", v12, Height);
    if (v15 >= v16) {
      double v17 = v15;
    }
    else {
      double v17 = v16;
    }
    double v18 = v17 + 10.0;
    subtitleLabel = self->_subtitleLabel;
    if (subtitleLabel || (subtitleLabel = self->_titleLabel) != 0 || (subtitleLabel = self->_timeStampLabel) != 0)
    {
      [subtitleLabel frame];
      CGRectGetMaxY(v36);
    }
    UIRectIntegralWithScale();
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v28);

    if (IsAccessibilityCategory)
    {
      -[UIButton setFrame:](self->_onboardingRejectButton, "setFrame:", v21, v23, v25, v27);
      onboardingAcceptButton = self->_onboardingAcceptButton;
      double v31 = v18 + v23 + 10.0;
      double v32 = v21;
    }
    else
    {
      double v33 = v12 + 6.0 + 10.0;
      if ([(NCNotificationSummaryExpandedHeaderView *)self _shouldReverseLayoutDirection])
      {
        -[UIButton setFrame:](self->_onboardingAcceptButton, "setFrame:", v21, v23, v25, v27);
        onboardingAcceptButton = self->_onboardingRejectButton;
      }
      else
      {
        -[UIButton setFrame:](self->_onboardingRejectButton, "setFrame:", v21, v23, v25, v27);
        onboardingAcceptButton = self->_onboardingAcceptButton;
      }
      double v32 = v33;
      double v31 = v23;
    }
    -[UIButton setFrame:](onboardingAcceptButton, "setFrame:", v32, v31, v25, v27);
  }
}

- (void)_layoutDividerView
{
  dividerView = self->_dividerView;
  if (!dividerView) {
    return;
  }
  [(UIView *)dividerView frame];
  if (self->_onboarding)
  {
    onboardingAcceptButton = self->_onboardingAcceptButton;
LABEL_8:
    [onboardingAcceptButton frame];
    double MaxY = CGRectGetMaxY(v9);
    double v5 = 15.0;
    goto LABEL_9;
  }
  onboardingAcceptButton = self->_subtitleLabel;
  if (onboardingAcceptButton) {
    goto LABEL_8;
  }
  onboardingAcceptButton = self->_titleLabel;
  if (onboardingAcceptButton) {
    goto LABEL_8;
  }
  onboardingAcceptButton = self->_timeStampLabel;
  if (onboardingAcceptButton) {
    goto LABEL_8;
  }
LABEL_9:
  [(NCNotificationSummaryExpandedHeaderView *)self bounds];
  CGRectGetWidth(v10);
  UIRectIntegralWithScale();
  double v7 = self->_dividerView;

  -[UIView setFrame:](v7, "setFrame:");
}

- (void)resetClearButtonStateAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NCToggleControl *)self->_clearControl isExpanded])
  {
    self->_animateCollapseButtonLayout = 1;
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
    if (v3)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __73__NCNotificationSummaryExpandedHeaderView_resetClearButtonStateAnimated___block_invoke;
      v6[3] = &unk_1E6A91BB0;
      v6[4] = self;
      [MEMORY[0x1E4FB1EB0] _animateUsingSpringWithTension:0 friction:v6 interactive:0 animations:200.0 completion:25.0];
    }
    else
    {
      clearControl = self->_clearControl;
      [(NCToggleControl *)clearControl setExpanded:0];
    }
  }
}

uint64_t __73__NCNotificationSummaryExpandedHeaderView_resetClearButtonStateAnimated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 496) setExpanded:0];
}

- (BOOL)dismissModalFullScreenIfNeeded
{
  return [(NCToggleControl *)self->_clearControl dismissModalFullScreenIfNeeded];
}

- (BOOL)shouldReceiveTouchAtPointInWindowSpace:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(UIView *)self->_controlsView frame];
  -[NCNotificationSummaryExpandedHeaderView convertRect:toView:](self, "convertRect:toView:", 0);
  v8.CGFloat x = x;
  v8.CGFloat y = y;
  BOOL v6 = CGRectContainsPoint(v9, v8);
  return [(NCToggleControl *)self->_clearControl isExpanded] && v6;
}

- (id)containerViewForToggleControlClickInteractionPresentedContent:(id)a3
{
  CGFloat v4 = [(NCNotificationSummaryExpandedHeaderView *)self delegate];
  double v5 = [v4 containerViewForClickInteractionPresentedContentForNotificationSummaryExpandedHeaderView:self];

  return v5;
}

- (void)toggleControlDidBeginClickInteraction:(id)a3
{
  id v4 = [(NCNotificationSummaryExpandedHeaderView *)self delegate];
  [v4 notificationSummaryExpandedHeaderViewDidBeginClickInteraction:self];
}

- (void)toggleControlDidPresentClickInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationSummaryExpandedHeaderView *)self delegate];
  [v4 notificationSummaryExpandedHeaderViewDidPresentClickInteractionPresentedContent:self];
}

- (void)toggleControlDidDismssClickInteractionPresentedContent:(id)a3
{
  id v4 = [(NCNotificationSummaryExpandedHeaderView *)self delegate];
  [v4 notificationSummaryExpandedHeaderViewDidDismssClickInteractionPresentedContent:self];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationSummaryExpandedHeaderView;
  [(NCNotificationListBaseContentView *)&v5 adjustForContentSizeCategoryChange];
  [(UIView *)self->_controlsView removeFromSuperview];
  controlsView = self->_controlsView;
  self->_controlsView = 0;

  [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  return 1;
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  titleLabel = self->_titleLabel;
  id v8 = a5;
  id v9 = a3;
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:titleLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_timeStampLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_dividerView style:3 visualStylingProvider:v9 outgoingProvider:v8];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:self->_subtitleLabel style:0 visualStylingProvider:v9 outgoingProvider:v8];
}

- (double)_allowedWidthForButtonInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  IsAccessibilityCategorCGFloat y = UIContentSizeCategoryIsAccessibilityCategory(v7);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v9 = CGRectGetWidth(v12) + -12.0;
  if (IsAccessibilityCategory) {
    double v10 = v9;
  }
  else {
    double v10 = (v9 + -10.0) * 0.5;
  }

  return v10;
}

- (unint64_t)_maximumNumberOfLinesForTitleText
{
  long long v2 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
  if (UIContentSizeCategoryIsAccessibilityCategory(v2)) {
    unint64_t v3 = 0;
  }
  else {
    unint64_t v3 = 2;
  }

  return v3;
}

- (unint64_t)_numberOfLinesForTitleTextInFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  titleLabel = self->_titleLabel;
  unint64_t v9 = [(NCNotificationSummaryExpandedHeaderView *)self _maximumNumberOfLinesForTitleText];

  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", titleLabel, v9, x, y, width, height);
}

- (unint64_t)_numberOfLinesForSubtitleTextInFrame:(CGRect)a3
{
  return -[NCNotificationListBaseContentView _numberOfLinesForLabel:maximumNumberOfLines:inFrame:](self, "_numberOfLinesForLabel:maximumNumberOfLines:inFrame:", self->_subtitleLabel, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)_updateTextAttributes
{
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationSummaryExpandedHeaderView;
  [(NCNotificationListBaseContentView *)&v3 _updateTextAttributes];
  [(NCNotificationSummaryExpandedHeaderView *)self _updateTextAttributesForDateLabel];
  [(NCNotificationSummaryExpandedHeaderView *)self _updateTextAttributesForTitleTextLabel];
  [(NCNotificationSummaryExpandedHeaderView *)self _updateTextAttributesForSubtitleTextLabel];
  [(NCNotificationSummaryExpandedHeaderView *)self _updateTextAttributesForButtonLabel:self->_onboardingAcceptButton];
  [(NCNotificationSummaryExpandedHeaderView *)self _updateTextAttributesForButtonLabel:self->_onboardingRejectButton];
}

- (void)_updateTextAttributesForDateLabel
{
  timeStampLabel = self->_timeStampLabel;
  if (timeStampLabel)
  {
    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:timeStampLabel withTextStyle:*MEMORY[0x1E4FB28F0] fontWeight:0 additionalTraits:1 maximumNumberOfLines:*MEMORY[0x1E4FB09C0]];
    [(BSUIDateLabel *)self->_timeStampLabel setNumberOfLines:1];
    [(BSUIDateLabel *)self->_timeStampLabel setLineBreakMode:3];
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForTitleTextLabel
{
  titleLabel = self->_titleLabel;
  if (titleLabel)
  {
    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:titleLabel withTextStyle:*MEMORY[0x1E4FB2988] fontWeight:0 additionalTraits:[(NCNotificationSummaryExpandedHeaderView *)self _maximumNumberOfLinesForTitleText] maximumNumberOfLines:*MEMORY[0x1E4FB09E0]];
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForSubtitleTextLabel
{
  if (self->_subtitleLabel)
  {
    objc_super v3 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v3);
    objc_super v5 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      objc_super v5 = (id *)MEMORY[0x1E4FB28F0];
    }
    id v6 = *v5;

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:self->_subtitleLabel withTextStyle:v6 fontWeight:0 additionalTraits:0 maximumNumberOfLines:*MEMORY[0x1E4FB09D8]];
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (void)_updateTextAttributesForButtonLabel:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    objc_super v5 = [(NCNotificationListBaseContentView *)self preferredContentSizeCategory];
    IsAccessibilityCategordouble y = UIContentSizeCategoryIsAccessibilityCategory(v5);
    double v7 = (id *)MEMORY[0x1E4FB28C8];
    if (!IsAccessibilityCategory) {
      double v7 = (id *)MEMORY[0x1E4FB2950];
    }
    id v8 = *v7;

    id v9 = [v4 titleLabel];

    [(NCNotificationListBaseContentView *)self _updateTextAttributesForLabel:v9 withTextStyle:v8 fontWeight:0 additionalTraits:0 maximumNumberOfLines:*MEMORY[0x1E4FB09D8]];
    [(NCNotificationSummaryExpandedHeaderView *)self setNeedsLayout];
  }
}

- (void)_configureTimeStampLabelIfNecessary
{
  if (!self->_timeStampLabel)
  {
    if (self->_date) {
      [(NCNotificationSummaryExpandedHeaderView *)self _configureTimeStampLabel];
    }
  }
}

- (void)_configureTimeStampLabel
{
  objc_super v3 = [MEMORY[0x1E4F4F8A8] sharedInstance];
  id v4 = [v3 startLabelWithStartDate:self->_date endDate:0 timeZone:self->_timeZone allDay:0 forStyle:self->_dateFormatStyle];
  timeStampLabel = self->_timeStampLabel;
  self->_timeStampLabel = v4;

  [(BSUIDateLabel *)self->_timeStampLabel setDelegate:self];
  [(NCNotificationSummaryExpandedHeaderView *)self addSubview:self->_timeStampLabel];
  [(NCNotificationSummaryExpandedHeaderView *)self _updateTextAttributesForDateLabel];
  id v6 = self->_timeStampLabel;
  id v7 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:v6 style:0 visualStylingProvider:v7 outgoingProvider:0];
}

- (void)_recycleTimeStampLabel
{
  [(BSUIDateLabel *)self->_timeStampLabel setDelegate:0];
  timeStampLabel = self->_timeStampLabel;
  id v4 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
  [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:timeStampLabel style:0 visualStylingProvider:0 outgoingProvider:v4];

  id v5 = [MEMORY[0x1E4F4F8A8] sharedInstance];
  [v5 recycleLabel:self->_timeStampLabel];
}

- (void)_tearDownTimeStampLabel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__NCNotificationSummaryExpandedHeaderView__tearDownTimeStampLabel__block_invoke;
  v2[3] = &unk_1E6A91BB0;
  v2[4] = self;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v2];
}

void __66__NCNotificationSummaryExpandedHeaderView__tearDownTimeStampLabel__block_invoke(uint64_t a1)
{
  long long v2 = *(void **)(*(void *)(a1 + 32) + 440);
  if (v2)
  {
    [v2 removeFromSuperview];
    [*(id *)(a1 + 32) _recycleTimeStampLabel];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 440);
    *(void *)(v3 + 440) = 0;
  }
}

- (void)_summaryOnboardingAccepted:(id)a3
{
  id v4 = [(NCNotificationSummaryExpandedHeaderView *)self delegate];
  if (v4)
  {
    id v5 = v4;
    [v4 notificationSummaryExpandedHeaderView:self acceptedSummaryOnboarding:1];
    id v4 = v5;
  }
}

- (void)_summaryOnboardingRejected:(id)a3
{
  id v4 = [(NCNotificationSummaryExpandedHeaderView *)self delegate];
  if (v4)
  {
    id v5 = v4;
    [v4 notificationSummaryExpandedHeaderView:self acceptedSummaryOnboarding:0];
    id v4 = v5;
  }
}

- (NSDate)date
{
  return self->_date;
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (int64_t)dateFormatStyle
{
  return self->_dateFormatStyle;
}

- (NCNotificationListCoalescingControlsHandlerDelegate)handlerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_handlerDelegate);

  return (NCNotificationListCoalescingControlsHandlerDelegate *)WeakRetained;
}

- (void)setHandlerDelegate:(id)a3
{
}

- (NCNotificationSummaryExpandedHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationSummaryExpandedHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isOnboarding
{
  return self->_onboarding;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_handlerDelegate);
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_clearControl, 0);
  objc_storeStrong((id *)&self->_collapseControl, 0);
  objc_storeStrong((id *)&self->_onboardingRejectButton, 0);
  objc_storeStrong((id *)&self->_onboardingAcceptButton, 0);
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_timeStampLabel, 0);
}

@end