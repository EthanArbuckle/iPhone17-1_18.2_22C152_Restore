@interface NCNotificationListCountIndicatorView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)shouldAllowLongPressInteraction;
- (CGRect)_insetBounds;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCNotificationListCountIndicatorView)initWithFrame:(CGRect)a3;
- (NCNotificationListCountIndicatorViewDelegate)delegate;
- (NSString)preferredContentSizeCategory;
- (double)_availableWidth;
- (id)_fontProvider;
- (id)_newIndicatorButtonWithTitle:(id)a3 symbolName:(id)a4 font:(id)a5;
- (id)_subtitleLabelFont;
- (id)_titleLabelFont;
- (void)_configureContainerViewIfNecessary;
- (void)_configureSubtitleLabelIfNecessary;
- (void)_configureTitleLabelIfNecessary;
- (void)_invalidateButton:(id)a3 animated:(BOOL)a4;
- (void)_invalidateSubtitleLabelAnimated:(BOOL)a3;
- (void)_invalidateTitleLabelAnimated:(BOOL)a3;
- (void)_layoutVerticallyCenter;
- (void)_performLayout:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_sizeToFitSubtitleLabelIfNecessary;
- (void)_sizeToFitTitleLabelIfNecessary;
- (void)_updateTitleLabelNumberOfLines;
- (void)adjustForLegibilitySettingsChange:(id)a3;
- (void)assertion:(id)a3 didCancelWithError:(id)a4;
- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4;
- (void)assertionWasAcquired:(id)a3;
- (void)buttonWasLongPressed:(id)a3;
- (void)buttonWasTapped:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)queue_acquireBacklightAnimationAssertion;
- (void)queue_releaseBacklightAnimationAssertion;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setShouldAllowLongPressInteraction:(BOOL)a3;
- (void)updateCount:(unint64_t)a3 title:(id)a4 symbolImageName:(id)a5 contentHidden:(BOOL)a6;
@end

@implementation NCNotificationListCountIndicatorView

- (NCNotificationListCountIndicatorView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NCNotificationListCountIndicatorView;
  v3 = -[NCNotificationListCountIndicatorView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(NCNotificationListCountIndicatorView *)v3 setMaximumContentSizeCategory:*MEMORY[0x1E4FB27B0]];
    v4->_animateLayoutForContentTransition = 0;
    v4->_titleLabelRepresentsNotificationCount = 0;
    v4->_backlightAnimationAssertingCount = 0;
    v5 = [(NCNotificationListCountIndicatorView *)v4 layer];
    objc_msgSend(v5, "setAnchorPoint:", 0.5, 0.5);
  }
  return v4;
}

- (void)dealloc
{
  [(BLSAssertion *)self->_backlightAnimationAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NCNotificationListCountIndicatorView;
  [(NCNotificationListCountIndicatorView *)&v3 dealloc];
}

- (void)updateCount:(unint64_t)a3 title:(id)a4 symbolImageName:(id)a5 contentHidden:(BOOL)a6
{
  int v6 = a6;
  id v10 = a4;
  id v11 = a5;
  id v12 = v10;
  v13 = (__CFString *)v11;
  v33 = v12;
  if (!a3) {
    goto LABEL_5;
  }
  v14 = NSString;
  v15 = NCUserNotificationsUIKitFrameworkBundle();
  v16 = [v15 localizedStringForKey:@"NOTIFICATION_STRING_STATE_COUNT_TEXT" value:&stru_1F2F516F8 table:0];
  v17 = objc_msgSend(v14, "localizedStringWithFormat:", v16, a3, 0);

  if (v17)
  {
    id v18 = v17;
    v19 = v18;
    v32 = v18;
    if (v12)
    {
      BOOL v20 = 0;
      v21 = v18;
      obj = v13;
      v19 = v12;
    }
    else
    {

      v21 = 0;
      BOOL v20 = 1;
      obj = @"circlebadge.fill";
    }
    self->_titleLabelRepresentsNotificationCount = v20;
  }
  else
  {
LABEL_5:
    v32 = 0;
    v21 = 0;
    obj = v13;
    v19 = v12;
  }
  if (BSEqualStrings()) {
    int v22 = BSEqualStrings() ^ 1;
  }
  else {
    int v22 = 1;
  }
  int v23 = BSEqualStrings();
  char v24 = v23;
  int contentHidden = self->_contentHidden;
  if ((v22 & 1) != 0 || (v23 ? (BOOL v26 = contentHidden == v6) : (BOOL v26 = 0), !v26))
  {
    objc_storeStrong((id *)&self->_titleString, v19);
    objc_storeStrong((id *)&self->_titleSymbol, obj);
    objc_storeStrong((id *)&self->_subtitleString, v21);
    self->_int contentHidden = v6;
    if (v22) {
      [(NCNotificationListCountIndicatorView *)self _invalidateTitleLabelAnimated:1];
    }
    if ((v24 & 1) == 0) {
      [(NCNotificationListCountIndicatorView *)self _invalidateSubtitleLabelAnimated:1];
    }
    NSUInteger v27 = [(NSString *)self->_subtitleString length];
    unint64_t v28 = 1;
    if (!v27) {
      unint64_t v28 = 2;
    }
    self->_titleLabelNumberOfLines = v28;
    if (contentHidden != v6 && (v6 & 1) == 0) {
      [(UIView *)self->_containerView setHidden:0];
    }
    if (contentHidden != v6)
    {
      containerView = self->_containerView;
      if (v6)
      {
        long long v30 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
        *(_OWORD *)&v41.a = *MEMORY[0x1E4F1DAB8];
        *(_OWORD *)&v41.c = v30;
        *(_OWORD *)&v41.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
      }
      else
      {
        CGAffineTransformMakeScale(&v41, 0.25, 0.25);
      }
      [(UIView *)containerView setTransform:&v41];
    }
    [(NCNotificationListCountIndicatorView *)self frame];
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __88__NCNotificationListCountIndicatorView_updateCount_title_symbolImageName_contentHidden___block_invoke;
    v38[3] = &unk_1E6A91DA0;
    BOOL v39 = contentHidden != v6;
    v38[4] = self;
    char v40 = v6;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __88__NCNotificationListCountIndicatorView_updateCount_title_symbolImageName_contentHidden___block_invoke_2;
    v35[3] = &unk_1E6A91DA0;
    BOOL v36 = contentHidden != v6;
    char v37 = v6;
    v35[4] = self;
    [(NCNotificationListCountIndicatorView *)self _performLayout:v38 animated:v31 > 1.0 completion:v35];
  }
}

uint64_t __88__NCNotificationListCountIndicatorView_updateCount_title_symbolImageName_contentHidden___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v2 = *(void **)(*(void *)(a1 + 32) + 464);
    if (*(unsigned char *)(a1 + 41))
    {
      CGAffineTransformMakeScale(&v6, 0.25, 0.25);
    }
    else
    {
      long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
      *(_OWORD *)&v6.a = *MEMORY[0x1E4F1DAB8];
      *(_OWORD *)&v6.c = v3;
      *(_OWORD *)&v6.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    }
    [v2 setTransform:&v6];
    double v4 = 0.0;
    if (!*(unsigned char *)(a1 + 41)) {
      double v4 = 1.0;
    }
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setAlpha:", v4, *(_OWORD *)&v6.a, *(_OWORD *)&v6.c, *(_OWORD *)&v6.tx);
  }
  [*(id *)(a1 + 32) setNeedsLayout];
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __88__NCNotificationListCountIndicatorView_updateCount_title_symbolImageName_contentHidden___block_invoke_2(uint64_t result)
{
  if (*(unsigned char *)(result + 40))
  {
    if (*(unsigned char *)(result + 41)) {
      return [*(id *)(*(void *)(result + 32) + 464) setHidden:1];
    }
  }
  return result;
}

- (void)setShouldAllowLongPressInteraction:(BOOL)a3
{
  self->_shouldAllowLongPressInteraction = a3;
  -[NCNotificationListCountIndicatorButton setShouldAllowLongPressInteraction:](self->_titleLabel, "setShouldAllowLongPressInteraction:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  [(NCNotificationListCountIndicatorView *)self _configureTitleLabelIfNecessary];
  [(NCNotificationListCountIndicatorView *)self _configureSubtitleLabelIfNecessary];
  [(NCNotificationListCountIndicatorView *)self _availableWidth];
  double v6 = v5;
  subtitleLabel = self->_subtitleLabel;
  if (subtitleLabel) {
    -[NCNotificationListCountIndicatorButton sizeThatFits:](subtitleLabel, "sizeThatFits:", v5, height);
  }
  -[NCNotificationListCountIndicatorButton sizeThatFits:](self->_titleLabel, "sizeThatFits:", v6, height);
  v8 = [(NCNotificationListCountIndicatorView *)self traitCollection];
  [v8 displayScale];
  UICeilToScale();
  double v10 = v9;

  id v11 = [(NCNotificationListCountIndicatorView *)self traitCollection];
  [v11 displayScale];
  UICeilToScale();
  double v13 = v12;

  double v14 = v10;
  double v15 = v13;
  result.double height = v15;
  result.width = v14;
  return result;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NCNotificationListCountIndicatorView;
  [(NCNotificationListCountIndicatorView *)&v4 layoutSubviews];
  [(NCNotificationListCountIndicatorView *)self _configureTitleLabelIfNecessary];
  [(NCNotificationListCountIndicatorView *)self _configureSubtitleLabelIfNecessary];
  [(NCNotificationListCountIndicatorView *)self _updateTitleLabelNumberOfLines];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __54__NCNotificationListCountIndicatorView_layoutSubviews__block_invoke;
  v3[3] = &unk_1E6A91BB0;
  v3[4] = self;
  [MEMORY[0x1E4FB1EB0] _performWithAnimation:v3];
}

uint64_t __54__NCNotificationListCountIndicatorView_layoutSubviews__block_invoke(uint64_t a1)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v9 = 0u;
  v2 = *(void **)(*(void *)(a1 + 32) + 464);
  if (v2)
  {
    [v2 transform];
    v2 = *(void **)(*(void *)(a1 + 32) + 464);
  }
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  long long v6 = *MEMORY[0x1E4F1DAB8];
  long long v7 = v3;
  long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v2 setTransform:&v6];
  [*(id *)(a1 + 32) _sizeToFitTitleLabelIfNecessary];
  [*(id *)(a1 + 32) _sizeToFitSubtitleLabelIfNecessary];
  [*(id *)(a1 + 32) _layoutVerticallyCenter];
  objc_super v4 = *(void **)(*(void *)(a1 + 32) + 464);
  long long v6 = v9;
  long long v7 = v10;
  long long v8 = v11;
  return [v4 setTransform:&v6];
}

- (void)adjustForLegibilitySettingsChange:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v6 = *MEMORY[0x1E4FB3778];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      -[NCNotificationListCountIndicatorView adjustForLegibilitySettingsChange:](v6);
    }
  }
  if (([v5 isEqual:self->_legibilitySettings] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(NCNotificationListCountIndicatorButton *)self->_titleLabel setLegibilitySettings:v5];
    [(NCNotificationListCountIndicatorButton *)self->_subtitleLabel setLegibilitySettings:v5];
    [(NCNotificationListCountIndicatorView *)self setNeedsLayout];
  }
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  if (self->_adjustsFontForContentSizeCategory != a3)
  {
    self->_adjustsFontForContentSizeCategory = a3;
    if (a3) {
      [(NCNotificationListCountIndicatorView *)self adjustForContentSizeCategoryChange];
    }
  }
}

- (NSString)preferredContentSizeCategory
{
  p_preferredContentSizeCategory = &self->_preferredContentSizeCategory;
  preferredContentSizeCategory = self->_preferredContentSizeCategory;
  if (!preferredContentSizeCategory)
  {
    objc_storeStrong((id *)p_preferredContentSizeCategory, (id)*MEMORY[0x1E4FB27F0]);
    preferredContentSizeCategory = *p_preferredContentSizeCategory;
  }

  return preferredContentSizeCategory;
}

- (BOOL)adjustForContentSizeCategoryChange
{
  long long v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  objc_super v4 = [v3 preferredContentSizeCategory];

  if (-[NCNotificationListCountIndicatorView adjustsFontForContentSizeCategory](self, "adjustsFontForContentSizeCategory")&& (-[NCNotificationListCountIndicatorView preferredContentSizeCategory](self, "preferredContentSizeCategory"), v5 = objc_claimAutoreleasedReturnValue(), char v6 = [v4 isEqualToString:v5], v5, (v6 & 1) == 0))
  {
    fontProvider = self->_fontProvider;
    self->_fontProvider = 0;

    [(NCNotificationListCountIndicatorView *)self setPreferredContentSizeCategory:v4];
    [(NCNotificationListCountIndicatorView *)self _invalidateTitleLabelAnimated:0];
    [(NCNotificationListCountIndicatorView *)self _invalidateSubtitleLabelAnimated:0];
    [(NCNotificationListCountIndicatorView *)self setNeedsLayout];
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_configureTitleLabelIfNecessary
{
  if (!self->_contentHidden && !self->_titleLabel)
  {
    titleString = self->_titleString;
    if (titleString)
    {
      titleSymbol = self->_titleSymbol;
      id v5 = [(NCNotificationListCountIndicatorView *)self _titleLabelFont];
      char v6 = [(NCNotificationListCountIndicatorView *)self _newIndicatorButtonWithTitle:titleString symbolName:titleSymbol font:v5];
      titleLabel = self->_titleLabel;
      self->_titleLabel = v6;

      [(NCNotificationListCountIndicatorButton *)self->_titleLabel setDelegate:self];
      [(NCNotificationListCountIndicatorButton *)self->_titleLabel setNumberOfLines:self->_titleLabelNumberOfLines];
      [(NCNotificationListCountIndicatorButton *)self->_titleLabel setShouldAllowLongPressInteraction:self->_shouldAllowLongPressInteraction];
      [(NCNotificationListCountIndicatorView *)self _sizeToFitTitleLabelIfNecessary];
    }
  }
}

- (void)_configureSubtitleLabelIfNecessary
{
  if (!self->_contentHidden && !self->_subtitleLabel)
  {
    subtitleString = self->_subtitleString;
    if (subtitleString)
    {
      objc_super v4 = [(NCNotificationListCountIndicatorView *)self _subtitleLabelFont];
      id v5 = [(NCNotificationListCountIndicatorView *)self _newIndicatorButtonWithTitle:subtitleString symbolName:0 font:v4];
      subtitleLabel = self->_subtitleLabel;
      self->_subtitleLabel = v5;

      [(NCNotificationListCountIndicatorView *)self _sizeToFitSubtitleLabelIfNecessary];
    }
  }
}

- (void)_updateTitleLabelNumberOfLines
{
  titleLabel = self->_titleLabel;
  if (titleLabel
    && [(NCNotificationListCountIndicatorButton *)titleLabel numberOfLines] != self->_titleLabelNumberOfLines)
  {
    -[NCNotificationListCountIndicatorButton setNumberOfLines:](self->_titleLabel, "setNumberOfLines:");
    [(NCNotificationListCountIndicatorView *)self _sizeToFitTitleLabelIfNecessary];
  }
}

- (id)_newIndicatorButtonWithTitle:(id)a3 symbolName:(id)a4 font:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [(NCNotificationListCountIndicatorView *)self _configureContainerViewIfNecessary];
  long long v11 = [[NCNotificationListCountIndicatorButton alloc] initWithTitle:v10 symbolName:v9 withFont:v8 legibilitySettings:self->_legibilitySettings];

  double v12 = [NSString stringWithFormat:@"focus-container-%@", v10];

  [(NCNotificationListCountIndicatorButton *)v11 setAccessibilityIdentifier:v12];
  [(NCNotificationListCountIndicatorButton *)v11 setDelegate:self];
  [(UIView *)self->_containerView addSubview:v11];
  [(UIView *)self->_containerView bringSubviewToFront:v11];

  return v11;
}

- (void)_configureContainerViewIfNecessary
{
  if (!self->_containerView)
  {
    long long v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    containerView = self->_containerView;
    self->_containerView = v3;

    id v5 = self->_containerView;
    [(NCNotificationListCountIndicatorView *)self addSubview:v5];
  }
}

- (void)_invalidateTitleLabelAnimated:(BOOL)a3
{
  [(NCNotificationListCountIndicatorView *)self _invalidateButton:self->_titleLabel animated:a3];
  titleLabel = self->_titleLabel;
  self->_titleLabel = 0;
}

- (void)_invalidateSubtitleLabelAnimated:(BOOL)a3
{
  [(NCNotificationListCountIndicatorView *)self _invalidateButton:self->_subtitleLabel animated:a3];
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = 0;
}

- (void)_invalidateButton:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __67__NCNotificationListCountIndicatorView__invalidateButton_animated___block_invoke;
    v8[3] = &unk_1E6A91BB0;
    id v9 = v6;
    [v9 hideContentAnimated:v4 completion:v8];
    [(NCNotificationListCountIndicatorView *)self setNeedsLayout];
  }
}

uint64_t __67__NCNotificationListCountIndicatorView__invalidateButton_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)_performLayout:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = (void (**)(void))a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __75__NCNotificationListCountIndicatorView__performLayout_animated_completion___block_invoke;
  aBlock[3] = &unk_1E6A91DC8;
  aBlock[4] = self;
  id v10 = v9;
  id v16 = v10;
  long long v11 = (void (**)(void *, uint64_t, void))_Block_copy(aBlock);
  [(NCNotificationListCountIndicatorView *)self queue_acquireBacklightAnimationAssertion];
  if (v6)
  {
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __75__NCNotificationListCountIndicatorView__performLayout_animated_completion___block_invoke_2;
    v13[3] = &unk_1E6A91DF0;
    double v14 = v8;
    [v12 _animateUsingSpringWithDampingRatio:0 response:v13 tracking:v11 dampingRatioSmoothing:0.845 responseSmoothing:0.531 targetSmoothing:0.0 projectionDeceleration:0.0 animations:0.0 completion:0.0];
  }
  else
  {
    v8[2](v8);
    v11[2](v11, 1, 0);
  }
}

uint64_t __75__NCNotificationListCountIndicatorView__performLayout_animated_completion___block_invoke(uint64_t a1, int a2, char a3)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "queue_releaseBacklightAnimationAssertion");
  if (a2 && (a3 & 1) == 0)
  {
    BOOL v7 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v7();
  }
  return result;
}

void __75__NCNotificationListCountIndicatorView__performLayout_animated_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4FB1EB0], "nc_applyHighFrameRate:", *(void *)(a1 + 32));
  v1 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v1[2]();
}

- (void)queue_acquireBacklightAnimationAssertion
{
  v17[2] = *MEMORY[0x1E4F143B8];
  long long v3 = (os_log_t *)MEMORY[0x1E4FB3778];
  BOOL v4 = *MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v15 = 0;
    _os_log_impl(&dword_1D7C04000, v4, OS_LOG_TYPE_DEFAULT, "Acquiring backlight assertion for count indicator view animation.", v15, 2u);
  }
  ++self->_backlightAnimationAssertingCount;
  if (self->_backlightAnimationAssertion)
  {
    id v5 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)double v15 = 0;
      _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "Backlight assertion is already acquired.", v15, 2u);
    }
  }
  else
  {
    BOOL v6 = [(NCNotificationListCountIndicatorView *)self window];
    BOOL v7 = [v6 windowScene];
    id v8 = [v7 _FBSScene];

    if (v8)
    {
      id v9 = [MEMORY[0x1E4F4F530] requestUnrestrictedFramerateForFBSScene:v8];
      v17[0] = v9;
      id v10 = [MEMORY[0x1E4F4F518] cancelAfterInterval:3.0];
      v17[1] = v10;
      long long v11 = v17;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F4F530] requestUnrestrictedFramerate];
      v16[0] = v9;
      id v10 = [MEMORY[0x1E4F4F518] cancelAfterInterval:3.0];
      v16[1] = v10;
      long long v11 = v16;
    }
    double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];

    double v13 = (BLSAssertion *)[objc_alloc(MEMORY[0x1E4F4F4C0]) initWithExplanation:@"Finish notification count indicator animation" attributes:v12];
    backlightAnimationAssertion = self->_backlightAnimationAssertion;
    self->_backlightAnimationAssertion = v13;

    [(BLSAssertion *)self->_backlightAnimationAssertion acquireWithObserver:self];
  }
}

- (void)queue_releaseBacklightAnimationAssertion
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t backlightAnimationAssertingCount = self->_backlightAnimationAssertingCount;
  self->_int64_t backlightAnimationAssertingCount = backlightAnimationAssertingCount - 1;
  BOOL v4 = (os_log_t *)MEMORY[0x1E4FB3778];
  id v5 = *MEMORY[0x1E4FB3778];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT);
  if (backlightAnimationAssertingCount >= 2)
  {
    if (!v6) {
      return;
    }
    int64_t v7 = self->_backlightAnimationAssertingCount;
    int v14 = 134217984;
    int64_t v15 = v7;
    id v8 = "Still have %ld animation to complete; Not releasing backlight assertion.";
    id v9 = v5;
    uint32_t v10 = 12;
    goto LABEL_10;
  }
  if (v6)
  {
    LOWORD(v14) = 0;
    _os_log_impl(&dword_1D7C04000, v5, OS_LOG_TYPE_DEFAULT, "Releasing backlight assertion for count indicator view animation.", (uint8_t *)&v14, 2u);
  }
  backlightAnimationAssertion = self->_backlightAnimationAssertion;
  if (backlightAnimationAssertion)
  {
    [(BLSAssertion *)backlightAnimationAssertion invalidate];
    double v12 = self->_backlightAnimationAssertion;
    self->_backlightAnimationAssertion = 0;

    return;
  }
  self->_int64_t backlightAnimationAssertingCount = 0;
  os_log_t v13 = *v4;
  if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v14) = 0;
    id v8 = "Backlight assertion is already released!";
    id v9 = v13;
    uint32_t v10 = 2;
LABEL_10:
    _os_log_impl(&dword_1D7C04000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v14, v10);
  }
}

- (void)assertionWasAcquired:(id)a3
{
  long long v3 = *MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_1D7C04000, v3, OS_LOG_TYPE_DEFAULT, "Backlight assertion for notification count indicator animation is acquired.", v4, 2u);
  }
}

- (void)assertion:(id)a3 didCancelWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x1E4FB3778];
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
      -[NCNotificationListCountIndicatorView assertion:didCancelWithError:]((uint64_t)v7, v8);
    }
  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint32_t v10 = 0;
    _os_log_impl(&dword_1D7C04000, v8, OS_LOG_TYPE_DEFAULT, "Backlight assertion for notification count indicator animation is cancelled.", v10, 2u);
  }
  self->_int64_t backlightAnimationAssertingCount = 0;
  [(BLSAssertion *)self->_backlightAnimationAssertion invalidate];
  backlightAnimationAssertion = self->_backlightAnimationAssertion;
  self->_backlightAnimationAssertion = 0;
}

- (void)assertion:(id)a3 didFailToAcquireWithError:(id)a4
{
  id v5 = a4;
  id v6 = *MEMORY[0x1E4FB3778];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4FB3778], OS_LOG_TYPE_ERROR)) {
    -[NCNotificationListCountIndicatorView assertion:didFailToAcquireWithError:]((uint64_t)v5, v6);
  }
  self->_int64_t backlightAnimationAssertingCount = 0;
  [(BLSAssertion *)self->_backlightAnimationAssertion invalidate];
  backlightAnimationAssertion = self->_backlightAnimationAssertion;
  self->_backlightAnimationAssertion = 0;
}

- (void)buttonWasTapped:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained notificationListCountIndicatorViewTapped:self];
}

- (void)buttonWasLongPressed:(id)a3
{
  if (self->_titleLabel == a3)
  {
    if (self->_titleLabelRepresentsNotificationCount) {
      id v5 = a3;
    }
    else {
      id v5 = self;
    }
    p_delegate = &self->_delegate;
    id v7 = v5;
    id v9 = a3;
    id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    [WeakRetained notificationListCountIndicatorViewLongPressed:self presentingView:v7];
  }
}

- (double)_availableWidth
{
  [(NCNotificationListCountIndicatorView *)self _insetBounds];

  return CGRectGetWidth(*(CGRect *)&v2);
}

- (void)_sizeToFitTitleLabelIfNecessary
{
  if (self->_titleLabel)
  {
    [(NCNotificationListCountIndicatorView *)self _insetBounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(NCNotificationListCountIndicatorView *)self _availableWidth];
    double v12 = v11;
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.width = v8;
    v15.size.double height = v10;
    -[NCNotificationListCountIndicatorButton sizeThatFits:](self->_titleLabel, "sizeThatFits:", v12, CGRectGetHeight(v15));
    [(NCNotificationListCountIndicatorView *)self bounds];
    CGRectGetWidth(v16);
    UIRectIntegralWithScale();
    titleLabel = self->_titleLabel;
    -[NCNotificationListCountIndicatorButton setFrame:](titleLabel, "setFrame:");
  }
}

- (void)_sizeToFitSubtitleLabelIfNecessary
{
  if (self->_subtitleLabel)
  {
    [(NCNotificationListCountIndicatorView *)self _insetBounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(NCNotificationListCountIndicatorView *)self _availableWidth];
    double v12 = v11;
    v15.origin.x = v4;
    v15.origin.y = v6;
    v15.size.width = v8;
    v15.size.double height = v10;
    -[NCNotificationListCountIndicatorButton sizeThatFits:](self->_subtitleLabel, "sizeThatFits:", v12, CGRectGetHeight(v15));
    UIRectIntegralWithScale();
    -[NCNotificationListCountIndicatorButton setFrame:](self->_subtitleLabel, "setFrame:");
    subtitleLabel = self->_subtitleLabel;
    [(NCNotificationListCountIndicatorButton *)subtitleLabel setAlpha:1.0];
  }
}

- (void)_layoutVerticallyCenter
{
  [(NCNotificationListCountIndicatorButton *)self->_titleLabel frame];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(NCNotificationListCountIndicatorButton *)self->_subtitleLabel frame];
  CGFloat v14 = v13;
  CGFloat v41 = v15;
  if (self->_titleLabel)
  {
    double v16 = v11;
    v43.origin.x = v4;
    double v17 = v12;
    v43.origin.y = v6;
    v43.size.width = v8;
    v43.size.double height = v10;
    CGRectGetWidth(v43);
    v44.size.double height = v10;
    v44.origin.x = v4;
    v44.origin.y = v6;
    v44.size.width = v8;
    CGRectGetMaxY(v44);
    double v12 = v17;
    CGFloat v11 = v16;
  }
  if (self->_subtitleLabel)
  {
    CGFloat v40 = v8;
    CGFloat v18 = v11;
    CGFloat v19 = v12;
    CGFloat v20 = v14;
    CGFloat v21 = v41;
    CGRectGetWidth(*(CGRect *)&v11);
    v45.origin.x = v18;
    v45.origin.y = v19;
    v45.size.width = v14;
    v45.size.double height = v41;
    CGRectGetHeight(v45);
  }
  [(NCNotificationListCountIndicatorView *)self bounds];
  UIRectCenteredRect();
  double v23 = v22;
  -[UIView setFrame:](self->_containerView, "setFrame:");
  [(UIView *)self->_containerView bounds];
  UIRectCenteredXInRect();
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  [(UIView *)self->_containerView bounds];
  UIRectCenteredXInRect();
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v38 = v23 - v36;
  -[NCNotificationListCountIndicatorButton setFrame:](self->_titleLabel, "setFrame:", v25, v27, v29, v31);
  subtitleLabel = self->_subtitleLabel;

  -[NCNotificationListCountIndicatorButton setFrame:](subtitleLabel, "setFrame:", v33, v38, v35, v37);
}

- (id)_fontProvider
{
  if (!self->_fontProvider)
  {
    if ([(NCNotificationListCountIndicatorView *)self adjustsFontForContentSizeCategory])
    {
      [MEMORY[0x1E4F4F8B8] preferredFontProvider];
    }
    else
    {
      [MEMORY[0x1E4F4F8B8] defaultFontProvider];
    }
    double v3 = (BSUIFontProvider *)objc_claimAutoreleasedReturnValue();
    fontProvider = self->_fontProvider;
    self->_fontProvider = v3;
  }
  double v5 = self->_fontProvider;

  return v5;
}

- (id)_titleLabelFont
{
  uint64_t v2 = [(NCNotificationListCountIndicatorView *)self _fontProvider];
  double v3 = [v2 preferredFontForTextStyle:*MEMORY[0x1E4FB2950] hiFontStyle:1];

  return v3;
}

- (id)_subtitleLabelFont
{
  uint64_t v2 = [(NCNotificationListCountIndicatorView *)self _fontProvider];
  double v3 = [v2 preferredFontForTextStyle:*MEMORY[0x1E4FB28F0] hiFontStyle:1];

  return v3;
}

- (CGRect)_insetBounds
{
  [(NCNotificationListCountIndicatorView *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGFloat v6 = CGRectGetWidth(v11) + -16.0;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v7 = CGRectGetHeight(v12);
  double v8 = 0.0;
  double v9 = 0.0;
  double v10 = v6;
  result.size.CGFloat height = v7;
  result.size.CGFloat width = v10;
  result.origin.CGFloat y = v9;
  result.origin.CGFloat x = v8;
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NCNotificationListCountIndicatorViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NCNotificationListCountIndicatorViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)shouldAllowLongPressInteraction
{
  return self->_shouldAllowLongPressInteraction;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_titleSymbol, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_backlightAnimationAssertion, 0);
  objc_storeStrong((id *)&self->_fontProvider, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);

  objc_storeStrong((id *)&self->_titleLabel, 0);
}

- (void)adjustForLegibilitySettingsChange:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7C04000, log, OS_LOG_TYPE_ERROR, "Notification list count indicator view is getting nil legibility settings!", v1, 2u);
}

- (void)assertion:(uint64_t)a1 didCancelWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_ERROR, "Backlight assertion for notification count indicator animation is cancelled with error %{public}@", (uint8_t *)&v2, 0xCu);
}

- (void)assertion:(uint64_t)a1 didFailToAcquireWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D7C04000, a2, OS_LOG_TYPE_ERROR, "Backlight assertion for notification count indicator animation failed to acquire with error %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end