@interface UICoverSheetButton
- (BOOL)clickInteractionShouldBegin:(id)a3;
- (BOOL)isLatching;
- (BOOL)isPronounced;
- (BOOL)shouldUseContinuousCorners;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)backgroundEffectViewGroupName;
- (NSString)localizedAccessoryTitle;
- (NSString)statisticsIdentifier;
- (UIColor)selectedTintColor;
- (UICoverSheetButton)initWithFrame:(CGRect)a3;
- (UIEdgeInsets)edgeInsets;
- (UIImage)image;
- (UIImage)selectedImage;
- (id)_backgroundEffectsWithBrightness:(double)a3;
- (id)_firstActivationDurationStat;
- (id)_interactionCountStatWithActivation:(BOOL)a3;
- (id)_interactionDurationStat;
- (id)_maxForceStatWithActivation:(BOOL)a3;
- (id)highlightEffectForClickInteraction:(id)a3;
- (int64_t)imageContentMode;
- (unint64_t)_clickInteractionDefaultDriverType:(id)a3;
- (void)_animateEffectUpdateWithProgress:(double)a3 ended:(BOOL)a4;
- (void)clickInteraction:(id)a3 didObserveForce:(double)maxForceDuringInteraction;
- (void)clickInteractionDidClickUp:(id)a3;
- (void)clickInteractionDidEnd:(id)a3;
- (void)layoutIfNeededAnimated;
- (void)layoutSubviews;
- (void)setBackgroundEffectViewGroupName:(id)a3;
- (void)setEdgeInsets:(UIEdgeInsets)a3;
- (void)setImage:(id)a3;
- (void)setImageContentMode:(int64_t)a3;
- (void)setLatching:(BOOL)a3;
- (void)setLocalizedAccessoryTitle:(id)a3;
- (void)setPronounced:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedImage:(id)a3;
- (void)setSelectedTintColor:(id)a3;
- (void)setShouldUseContinuousCorners:(BOOL)a3;
- (void)setStatisticsIdentifier:(id)a3;
@end

@implementation UICoverSheetButton

- (UICoverSheetButton)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)UICoverSheetButton;
  v3 = -[UIControl initWithFrame:](&v36, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor whiteColor];
    [v3 setTintColor:v4];

    v5 = +[UIColor darkTextColor];
    [v3 setSelectedTintColor:v5];

    [v3 setClipsToBounds:0];
    v6 = +[UIColor clearColor];
    [v3 setBackgroundColor:v6];

    [v3 setOpaque:0];
    *(_OWORD *)(v3 + 584) = 0u;
    *(_OWORD *)(v3 + 600) = 0u;
    v3[530] = 0;
    [v3 bounds];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    v15 = -[UIView initWithFrame:]([UIView alloc], "initWithFrame:", v7, v9, v11, v13);
    [(UIView *)v15 setAutoresizingMask:18];
    v16 = +[UIColor clearColor];
    [(UIView *)v15 setBackgroundColor:v16];

    [(UIView *)v15 setOpaque:0];
    [(UIView *)v15 setClipsToBounds:0];
    [(UIView *)v15 setUserInteractionEnabled:0];
    [v3 addSubview:v15];
    v17 = (void *)*((void *)v3 + 57);
    *((void *)v3 + 57) = v15;

    v18 = -[UIVisualEffectView initWithFrame:]([UIVisualEffectView alloc], "initWithFrame:", v8, v10, v12, v14);
    v37.origin.x = v8;
    v37.origin.y = v10;
    v37.size.width = v12;
    v37.size.height = v14;
    [(UIVisualEffectView *)v18 _setCornerRadius:CGRectGetWidth(v37) * 0.5];
    [(UIView *)v18 setClipsToBounds:1];
    [(UIView *)v18 setUserInteractionEnabled:0];
    [*((id *)v3 + 57) addSubview:v18];
    v19 = (void *)*((void *)v3 + 59);
    *((void *)v3 + 59) = v18;

    v20 = +[UIColor colorWithRed:0.03125 green:0.03125 blue:0.03125 alpha:1.0];
    v21 = [*((id *)v3 + 59) contentView];
    [v21 setBackgroundColor:v20];

    v22 = [*((id *)v3 + 59) contentView];
    [v22 setAlpha:0.0];

    v23 = -[UIImageView initWithFrame:]([UIImageView alloc], "initWithFrame:", v8, v10, v12, v14);
    v24 = +[UIColor clearColor];
    [(UIImageView *)v23 setBackgroundColor:v24];

    [(UIView *)v23 setOpaque:0];
    [(UIView *)v23 setClipsToBounds:1];
    [(UIImageView *)v23 setContentMode:3];
    [*((id *)v3 + 57) addSubview:v23];
    v25 = (void *)*((void *)v3 + 58);
    *((void *)v3 + 58) = v23;

    uint64_t v26 = [v3 _backgroundEffectsWithBrightness:-0.13];
    v27 = (void *)*((void *)v3 + 60);
    *((void *)v3 + 60) = v26;

    uint64_t v28 = [v3 _backgroundEffectsWithBrightness:0.65];
    v29 = (void *)*((void *)v3 + 61);
    *((void *)v3 + 61) = v28;

    v30 = objc_alloc_init(_UIClickInteraction);
    [(_UIClickInteraction *)v30 setDelegate:v3];
    v31 = (void *)*((void *)v3 + 62);
    *((void *)v3 + 62) = v30;

    [v3 addInteraction:*((void *)v3 + 62)];
    [*((id *)v3 + 62) setDriverCancelsTouchesInView:0];
    if (_UIInternalPreferencesRevisionOnce != -1) {
      dispatch_once(&_UIInternalPreferencesRevisionOnce, &__block_literal_global_5_8);
    }
    int v32 = _UIInternalPreferencesRevisionVar;
    if (_UIInternalPreferencesRevisionVar >= 1)
    {
      int v35 = _UIInternalPreference_PrototypeHideCoverSheetButtons;
      if (_UIInternalPreferencesRevisionVar != _UIInternalPreference_PrototypeHideCoverSheetButtons)
      {
        while (v32 >= v35)
        {
          _UIInternalPreferenceSync(v32, &_UIInternalPreference_PrototypeHideCoverSheetButtons, @"PrototypeHideCoverSheetButtons", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
          int v35 = _UIInternalPreference_PrototypeHideCoverSheetButtons;
          if (v32 == _UIInternalPreference_PrototypeHideCoverSheetButtons) {
            goto LABEL_5;
          }
        }
        if (byte_1E8FD53AC) {
          [v3 setHidden:1];
        }
      }
    }
LABEL_5:
    v33 = v3;
  }

  return (UICoverSheetButton *)v3;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setImageContentMode:(int64_t)a3
{
}

- (int64_t)imageContentMode
{
  return [(UIView *)self->_contentView contentMode];
}

- (void)setShouldUseContinuousCorners:(BOOL)a3
{
  if ([(UICoverSheetButton *)self shouldUseContinuousCorners] != a3)
  {
    self->_shouldUseContinuousCorners = a3;
    [(UIView *)self setNeedsLayout];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIControl *)self isSelected] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UICoverSheetButton;
    [(UIControl *)&v5 setSelected:v3];
    [(UIView *)self setNeedsLayout];
    [(UICoverSheetButton *)self layoutIfNeededAnimated];
  }
}

- (void)setPronounced:(BOOL)a3
{
  if ([(UICoverSheetButton *)self isPronounced] != a3)
  {
    self->_pronounced = a3;
    [(UIView *)self setNeedsLayout];
    [(UICoverSheetButton *)self layoutIfNeededAnimated];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  float64x2_t v3 = vaddq_f64(vaddq_f64(*(float64x2_t *)&self->_edgeInsets.top, *(float64x2_t *)&self->_edgeInsets.bottom), (float64x2_t)vdupq_n_s64(0x4049000000000000uLL));
  double v4 = v3.f64[1];
  result.height = v3.f64[0];
  result.width = v4;
  return result;
}

- (void)layoutSubviews
{
  v51.receiver = self;
  v51.super_class = (Class)UICoverSheetButton;
  [(UIView *)&v51 layoutSubviews];
  if (!self->_interactive) {
    [(UICoverSheetButton *)self isPronounced];
  }
  BOOL v3 = [(UIControl *)self isSelected];
  if (v3)
  {
    double v4 = [(UICoverSheetButton *)self selectedImage];
    objc_super v5 = &OBJC_IVAR___UICoverSheetButton__selectedBackgroundEffects;
    p_contentView = &self->_contentView;
    [(UIImageView *)self->_contentView setImage:v4];
    double v7 = [(UICoverSheetButton *)self selectedTintColor];
    [(UIView *)self->_contentView setTintColor:v7];
  }
  else
  {
    double v4 = [(UICoverSheetButton *)self image];
    objc_super v5 = &OBJC_IVAR___UICoverSheetButton__backgroundEffects;
    p_contentView = &self->_contentView;
    [(UIImageView *)self->_contentView setImage:v4];
    [(UIView *)self->_contentView setTintColor:0];
  }
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __36__UICoverSheetButton_layoutSubviews__block_invoke;
  v50[3] = &unk_1E52D9F70;
  v50[4] = self;
  +[UIView performWithoutAnimation:v50];
  [(UIVisualEffectView *)self->_backgroundEffectView setBackgroundEffects:*(Class *)((char *)&self->super.super.super.super.isa + *v5)];
  [(UIView *)self->_containerView bounds];
  double x = v52.origin.x;
  double y = v52.origin.y;
  double width = v52.size.width;
  double height = v52.size.height;
  double highlightProgress = self->_highlightProgress;
  double v13 = CGRectGetWidth(v52);
  v53.origin.double x = x;
  v53.origin.double y = y;
  v53.size.double width = width;
  v53.size.double height = height;
  double v14 = v13 + highlightProgress * (CGRectGetWidth(v53) * 1.6 - v13);
  v54.origin.double x = x;
  v54.origin.double y = y;
  v54.size.double width = width;
  v54.size.double height = height;
  double v15 = CGRectGetHeight(v54);
  v55.origin.double x = x;
  v55.origin.double y = y;
  v55.size.double width = width;
  v55.size.double height = height;
  double v49 = highlightProgress;
  double v16 = v15 + highlightProgress * (CGRectGetHeight(v55) * 1.6 - v15);
  double v17 = x + width * 0.5;
  double v18 = y + height * 0.5;
  v19 = [(UIView *)self traitCollection];
  [v19 displayScale];
  UIRectCenteredAboutPointScale(0.0, 0.0, v14, v16, v17, v18, v20);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  -[UIView setFrame:](self->_backgroundEffectView, "setFrame:", v22, v24, v26, v28);
  [(UIView *)self->_backgroundEffectView frame];
  double v29 = CGRectGetWidth(v56);
  [(UIView *)self->_backgroundEffectView frame];
  double v30 = CGRectGetHeight(v57);
  if (v29 < v30) {
    double v30 = v29;
  }
  double v31 = v30 * 0.5;
  backgroundEffectView = self->_backgroundEffectView;
  if (self->_shouldUseContinuousCorners) {
    [(UIVisualEffectView *)backgroundEffectView _setContinuousCornerRadius:v31];
  }
  else {
    [(UIVisualEffectView *)backgroundEffectView _setCornerRadius:v31];
  }
  -[UIImageView sizeThatFits:](*p_contentView, "sizeThatFits:", width, height);
  double v34 = v33 + v49 * (v33 * 1.6 - v33);
  double v36 = v35 + v49 * (v35 * 1.6 - v35);
  CGRect v37 = [(UIView *)self traitCollection];
  [v37 displayScale];
  UIRectCenteredAboutPointScale(0.0, 0.0, v34, v36, v17, v18, v38);
  double v40 = v39;
  double v42 = v41;
  double v44 = v43;
  double v46 = v45;

  -[UIImageView setFrame:](*p_contentView, "setFrame:", v40, v42, v44, v46);
  v47 = [(UIVisualEffectView *)self->_backgroundEffectView contentView];
  [v47 setAlpha:v49 * 0.5 + 0.0];

  v48 = [(UIVisualEffectView *)self->_backgroundEffectView contentView];
  [v48 setHidden:v3];
}

uint64_t __36__UICoverSheetButton_layoutSubviews__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) bounds];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  [*(id *)(a1 + 32) edgeInsets];
  double v14 = *(void **)(*(void *)(a1 + 32) + 456);
  return objc_msgSend(v14, "setFrame:", v3 + v11, v5 + v10, v7 - (v11 + v13), v9 - (v10 + v12));
}

- (id)highlightEffectForClickInteraction:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [_UIPercentDrivenInteractionEffect alloc];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__UICoverSheetButton_highlightEffectForClickInteraction___block_invoke;
  v8[3] = &unk_1E52EF070;
  objc_copyWeak(&v9, &location);
  double v6 = [(_UIPercentDrivenInteractionEffect *)v5 initWithProgressBlock:v8];
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return v6;
}

void __57__UICoverSheetButton_highlightEffectForClickInteraction___block_invoke(uint64_t a1, void *a2)
{
  double v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [v3 progress];
  double v5 = v4;
  uint64_t v6 = [v3 ended];

  [WeakRetained _animateEffectUpdateWithProgress:v6 ended:v5];
}

- (void)_animateEffectUpdateWithProgress:(double)a3 ended:(BOOL)a4
{
  double v4 = a3 + a3 + 18.0;
  v5[1] = 3221225472;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[2] = __61__UICoverSheetButton__animateEffectUpdateWithProgress_ended___block_invoke;
  v5[3] = &unk_1E52D9CD0;
  if (a4) {
    double v4 = v4 + 4.0;
  }
  v5[4] = self;
  *(double *)&v5[5] = a3;
  +[UIView _animateUsingSpringWithTension:0 friction:v5 interactive:0 animations:500.0 completion:v4];
}

uint64_t __61__UICoverSheetButton__animateEffectUpdateWithProgress_ended___block_invoke(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__UICoverSheetButton__animateEffectUpdateWithProgress_ended___block_invoke_2;
  v3[3] = &unk_1E52D9CD0;
  v3[4] = *(void *)(a1 + 32);
  v3[5] = *(void *)(a1 + 40);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __61__UICoverSheetButton__animateEffectUpdateWithProgress_ended___block_invoke_2(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  if (v2 > 1.2) {
    double v2 = 1.2;
  }
  *(double *)(*(void *)(a1 + 32) + 520) = v2;
  [*(id *)(a1 + 32) setNeedsLayout];
  id v3 = *(void **)(a1 + 32);
  return [v3 layoutIfNeeded];
}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  clickInteraction = self->_clickInteraction;
  if (clickInteraction == a3)
  {
    self->_interactive = 1;
    self->_didActivateDuringInteraction = 0;
    self->_maxForceDuringInteraction = 0.0;
    [(UIView *)self setNeedsLayout];
    [(UICoverSheetButton *)self layoutIfNeededAnimated];
    uint64_t v6 = [(UICoverSheetButton *)self _interactionDurationStat];
    [v6 startTimingForObject:self];

    double v7 = [(UICoverSheetButton *)self _firstActivationDurationStat];
    [v7 startTimingForObject:self];
  }
  return clickInteraction == a3;
}

- (void)clickInteractionDidClickUp:(id)a3
{
  if (self->_clickInteraction == a3)
  {
    [(UICoverSheetButton *)self setSelected:[(UIControl *)self isSelected] ^ 1];
    [(UIControl *)self sendActionsForControlEvents:0x2000];
    if (self->_interactive)
    {
      self->_didActivateDuringInteraction = 1;
      id v4 = [(UICoverSheetButton *)self _firstActivationDurationStat];
      [v4 recordTimingForObject:self];
    }
  }
}

- (void)clickInteraction:(id)a3 didObserveForce:(double)maxForceDuringInteraction
{
  if (self->_interactive)
  {
    if (self->_maxForceDuringInteraction >= maxForceDuringInteraction) {
      maxForceDuringInteraction = self->_maxForceDuringInteraction;
    }
    self->_maxForceDuringInteraction = maxForceDuringInteraction;
  }
}

- (void)clickInteractionDidEnd:(id)a3
{
  if (self->_clickInteraction == a3)
  {
    id v4 = [(UICoverSheetButton *)self _interactionCountStatWithActivation:self->_didActivateDuringInteraction];
    [v4 incrementValueBy:1];

    double v5 = [(UICoverSheetButton *)self _maxForceStatWithActivation:self->_didActivateDuringInteraction];
    [v5 recordDistributionValue:self->_maxForceDuringInteraction];

    self->_interactive = 0;
    self->_didActivateDuringInteraction = 0;
    self->_maxForceDuringInteraction = 0.0;
    [(UIView *)self setNeedsLayout];
    [(UICoverSheetButton *)self layoutIfNeededAnimated];
    uint64_t v6 = [(UICoverSheetButton *)self _interactionDurationStat];
    [v6 recordTimingForObject:self];

    id v7 = [(UICoverSheetButton *)self _firstActivationDurationStat];
    [v7 cancelTimingForObject:self];
  }
}

- (unint64_t)_clickInteractionDefaultDriverType:(id)a3
{
  id v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 forceTouchCapability];

  if (v4 == 2) {
    return 4;
  }
  else {
    return 3;
  }
}

- (void)layoutIfNeededAnimated
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44__UICoverSheetButton_layoutIfNeededAnimated__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView animateWithDuration:6 delay:v2 options:0 animations:0.0 completion:0.0];
}

uint64_t __44__UICoverSheetButton_layoutIfNeededAnimated__block_invoke(uint64_t a1)
{
  CAFrameRateRange v4 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__UICoverSheetButton_layoutIfNeededAnimated__block_invoke_2;
  v3[3] = &unk_1E52D9F70;
  v3[4] = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048613, v3, *(double *)&v4.minimum, *(double *)&v4.maximum, *(double *)&v4.preferred);
}

uint64_t __44__UICoverSheetButton_layoutIfNeededAnimated__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (id)_backgroundEffectsWithBrightness:(double)a3
{
  v13[5] = *MEMORY[0x1E4F143B8];
  CAFrameRateRange v4 = +[UIBlurEffect effectWithBlurRadius:30.0];
  double v5 = +[UIColor blackColor];
  uint64_t v6 = +[UIVisualEffect effectCompositingColor:v5 withMode:1010 alpha:0.12];
  v13[1] = v6;
  id v7 = +[UIImage kitImageNamed:@"UICoverSheetButtonLuminanceMap"];
  double v8 = +[UIColorEffect colorEffectLuminanceMap:v7 blendingAmount:0.7];
  v13[2] = v8;
  id v9 = +[UIColorEffect colorEffectSaturate:2.8];
  v13[3] = v9;
  double v10 = +[UIColorEffect colorEffectBrightness:a3];
  v13[4] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:5];

  return v11;
}

- (void)setBackgroundEffectViewGroupName:(id)a3
{
}

- (id)_interactionCountStatWithActivation:(BOOL)a3
{
  BOOL v3 = a3;
  CAFrameRateRange v4 = [(UICoverSheetButton *)self statisticsIdentifier];
  if (v4)
  {
    double v5 = +[_UIStatistics coverSheetButtonInteractionCountWithActivation:v3 category:v4];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (id)_interactionDurationStat
{
  double v2 = [(UICoverSheetButton *)self statisticsIdentifier];
  if (v2)
  {
    BOOL v3 = +[_UIStatistics coverSheetButtonInteractionDurationWithCategory:v2];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_firstActivationDurationStat
{
  double v2 = [(UICoverSheetButton *)self statisticsIdentifier];
  if (v2)
  {
    BOOL v3 = +[_UIStatistics coverSheetButtonFirstActivationDurationWithCategory:v2];
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)_maxForceStatWithActivation:(BOOL)a3
{
  BOOL v3 = a3;
  CAFrameRateRange v4 = [(UICoverSheetButton *)self statisticsIdentifier];
  if (v4)
  {
    double v5 = +[_UIStatistics coverSheetButtonMaximumForceWithActivation:v3 category:v4];
  }
  else
  {
    double v5 = 0;
  }

  return v5;
}

- (BOOL)isPronounced
{
  return self->_pronounced;
}

- (BOOL)isLatching
{
  return self->_latching;
}

- (void)setLatching:(BOOL)a3
{
  self->_latching = a3;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIImage)selectedImage
{
  return self->_selectedImage;
}

- (void)setSelectedImage:(id)a3
{
}

- (UIColor)selectedTintColor
{
  return self->_selectedTintColor;
}

- (void)setSelectedTintColor:(id)a3
{
}

- (UIEdgeInsets)edgeInsets
{
  double top = self->_edgeInsets.top;
  double left = self->_edgeInsets.left;
  double bottom = self->_edgeInsets.bottom;
  double right = self->_edgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)shouldUseContinuousCorners
{
  return self->_shouldUseContinuousCorners;
}

- (NSString)localizedAccessoryTitle
{
  return self->_localizedAccessoryTitle;
}

- (void)setLocalizedAccessoryTitle:(id)a3
{
}

- (NSString)backgroundEffectViewGroupName
{
  return self->_backgroundEffectViewGroupName;
}

- (NSString)statisticsIdentifier
{
  return self->_statisticsIdentifier;
}

- (void)setStatisticsIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsIdentifier, 0);
  objc_storeStrong((id *)&self->_backgroundEffectViewGroupName, 0);
  objc_storeStrong((id *)&self->_localizedAccessoryTitle, 0);
  objc_storeStrong((id *)&self->_selectedTintColor, 0);
  objc_storeStrong((id *)&self->_selectedImage, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_clickInteraction, 0);
  objc_storeStrong((id *)&self->_selectedBackgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffects, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end