@interface _UIRefreshControlModernContentView
- (BOOL)areAnimationsValid;
- (BOOL)horizontallyCenteredFramesNeedUpdate;
- (CGAffineTransform)_bloomedSeedTransform;
- (CGAffineTransform)_unbloomedSeedTransform;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UILabel)textLabel;
- (_UIRefreshControlModernContentView)initWithFrame:(CGRect)a3;
- (double)_currentTimeOffset;
- (double)_heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen;
- (double)_maximumSnappingHeightScalingForScrollViewHeight;
- (double)_percentageShowing;
- (double)currentPopStiffness;
- (double)impactIntensity;
- (double)maximumSnappingHeight;
- (id)_effectiveTintColor;
- (id)_effectiveTintColorWithAlpha:(double)a3;
- (id)attributedTitle;
- (int64_t)style;
- (void)_bloom;
- (void)_cleanUpAfterRevealing;
- (void)_goAway;
- (void)_removeAllAnimations;
- (void)_resetToRevealingState;
- (void)_reveal;
- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3;
- (void)_setBloomedAppearance;
- (void)_setSpunAppearance;
- (void)_setUnbloomedAppearance;
- (void)_snappingMagic;
- (void)_spin;
- (void)_tick;
- (void)_tickDueToProgrammaticRefresh;
- (void)_unbloom;
- (void)_updateTimeOffsetOfRelevantLayers;
- (void)didTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
- (void)layoutSubviews;
- (void)setAreAnimationsValid:(BOOL)a3;
- (void)setAttributedTitle:(id)a3;
- (void)setCurrentPopStiffness:(double)a3;
- (void)setHorizontallyCenteredFramesNeedUpdate:(BOOL)a3;
- (void)setImpactIntensity:(double)a3;
- (void)setRefreshControl:(id)a3;
- (void)setTintColor:(id)a3;
- (void)willTransitionFromState:(int64_t)a3 toState:(int64_t)a4;
@end

@implementation _UIRefreshControlModernContentView

- (void)layoutSubviews
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52___UIRefreshControlModernContentView_layoutSubviews__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView performWithoutAnimation:v2];
}

- (void)_safeAreaInsetsDidChangeFromOldInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  [(UIView *)self safeAreaInsets];
  if (self->_horizontallyCenteredFramesNeedUpdate || v8 != left)
  {
    self->_horizontallyCenteredFramesNeedUpdate = 1;
LABEL_7:
    [(UIView *)self setNeedsLayout];
    goto LABEL_8;
  }
  self->_horizontallyCenteredFramesNeedUpdate = v9 != right;
  if (v9 != right) {
    goto LABEL_7;
  }
LABEL_8:
  v11.receiver = self;
  v11.super_class = (Class)_UIRefreshControlModernContentView;
  -[UIView _safeAreaInsetsDidChangeFromOldInsets:](&v11, sel__safeAreaInsetsDidChangeFromOldInsets_, top, left, bottom, right);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  [(UIView *)self->_textLabel frame];
  if (v5 <= 0.0)
  {
    double v7 = 60.0;
  }
  else
  {
    [(UIView *)self->_textLabel frame];
    double v7 = v6 + 62.0 + 5.0;
  }
  double v8 = width;
  result.height = v7;
  result.CGFloat width = v8;
  return result;
}

- (void)setImpactIntensity:(double)a3
{
  self->_impactIntensity = a3;
}

- (void)_reveal
{
  v3 = [(UIView *)self->_replicatorView layer];
  [v3 setSpeed:0.0];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45___UIRefreshControlModernContentView__reveal__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView animateWithDuration:0 delay:v4 options:0 animations:1.0 completion:0.0];
  [(_UIRefreshControlModernContentView *)self _updateTimeOffsetOfRelevantLayers];
}

- (void)_updateTimeOffsetOfRelevantLayers
{
  if (!self->_hasFinishedRevealing)
  {
    [(_UIRefreshControlModernContentView *)self _currentTimeOffset];
    double v4 = v3;
    double v5 = [(UIView *)self->_replicatorView layer];
    [v5 setTimeOffset:v4];
  }
  textLabel = self->_textLabel;
  [(_UIRefreshControlModernContentView *)self _percentageShowing];
  -[UIView setAlpha:](textLabel, "setAlpha:");
}

- (double)_currentTimeOffset
{
  uint64_t v3 = [(_UIRefreshControlContentView *)self refreshControl];
  if (!v3
    || (double v4 = (void *)v3,
        [(_UIRefreshControlContentView *)self refreshControl],
        double v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 refreshControlState],
        v5,
        v4,
        double result = 0.0,
        v6 == 1))
  {
    [(_UIRefreshControlModernContentView *)self _percentageShowing];
    if (result >= 1.0) {
      return 0.999999881;
    }
  }
  return result;
}

- (double)_percentageShowing
{
  uint64_t v3 = [(_UIRefreshControlContentView *)self refreshControl];
  [v3 _visibleHeight];
  double v5 = v4;

  [(_UIRefreshControlModernContentView *)self maximumSnappingHeight];
  double result = v5 / v6;
  if (result > 1.0) {
    return 1.0;
  }
  return result;
}

- (double)maximumSnappingHeight
{
  [(UIView *)self->_textLabel frame];
  double v4 = (v3 + 100.0) * 1.125;
  [(_UIRefreshControlModernContentView *)self _maximumSnappingHeightScalingForScrollViewHeight];
  return v5 * v4;
}

- (double)_maximumSnappingHeightScalingForScrollViewHeight
{
  v2 = [(_UIRefreshControlContentView *)self refreshControl];
  [v2 _scrollViewHeight];
  double v4 = v3;

  double result = v4 / 568.0;
  if (v4 < 372.0) {
    return 0.654929577;
  }
  return result;
}

- (double)_heightAtWhichNoneOfTheInterfaceElementsAreVisibleEvenIfTheControlIsStillPartiallyOnScreen
{
  return 5.0;
}

- (void)setCurrentPopStiffness:(double)a3
{
  self->_currentPopStiffness = a3;
}

- (void)setTintColor:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_UIRefreshControlModernContentView;
  [(_UIRefreshControlContentView *)&v4 setTintColor:a3];
  [(UIView *)self setNeedsLayout];
}

- (void)setRefreshControl:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)_UIRefreshControlModernContentView;
  id v4 = a3;
  [(_UIRefreshControlContentView *)&v11 setRefreshControl:v4];
  double v5 = objc_msgSend(v4, "_scrollView", v11.receiver, v11.super_class);

  double v6 = [(_UIRefreshControlContentView *)self impactFeedbackGenerator];
  double v7 = [v6 view];

  if (v7 != v5)
  {
    double v8 = +[_UIImpactFeedbackGeneratorConfiguration refreshConfiguration];
    double v9 = [v8 tweakedConfigurationForClass:objc_opt_class() usage:@"refresh"];

    v10 = [(UIFeedbackGenerator *)[UIImpactFeedbackGenerator alloc] initWithConfiguration:v9 view:v5];
    [(_UIRefreshControlContentView *)self setImpactFeedbackGenerator:v10];
  }
}

- (_UIRefreshControlModernContentView)initWithFrame:(CGRect)a3
{
  v24.receiver = self;
  v24.super_class = (Class)_UIRefreshControlModernContentView;
  double v3 = -[UIView initWithFrame:](&v24, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc_init(UILabel);
    textLabel = v3->_textLabel;
    v3->_textLabel = v4;

    double v6 = v3->_textLabel;
    double v7 = [off_1E52D39B8 preferredFontForTextStyle:@"UICTFontTextStyleCaption1"];
    [(UILabel *)v6 setFont:v7];

    double v8 = v3->_textLabel;
    double v9 = +[UIColor labelColor];
    [(UILabel *)v8 setTextColor:v9];

    [(UILabel *)v3->_textLabel setTextAlignment:1];
    [(UILabel *)v3->_textLabel setNumberOfLines:1];
    v10 = v3->_textLabel;
    objc_super v11 = +[UIColor clearColor];
    [(UIView *)v10 setBackgroundColor:v11];

    [(UIView *)v3 setAutoresizingMask:2];
    v12 = objc_alloc_init(UIView);
    replicatorContainer = v3->_replicatorContainer;
    v3->_replicatorContainer = v12;

    v14 = objc_alloc_init(_UIRefreshControlModernReplicatorView);
    replicatorView = v3->_replicatorView;
    v3->_replicatorView = v14;

    v16 = objc_alloc_init(_UIRefreshControlSeedView);
    seed = v3->_seed;
    v3->_seed = v16;

    v18 = [(UIView *)v3->_seed layer];
    [v18 setAllowsEdgeAntialiasing:1];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __52___UIRefreshControlModernContentView_initWithFrame___block_invoke;
    v22[3] = &unk_1E52D9F70;
    v19 = v3;
    v23 = v19;
    +[UIView performWithoutAnimation:v22];
    [(UIView *)v3->_replicatorView addSubview:v3->_seed];
    v20 = [(UIView *)v3->_replicatorView layer];
    [v20 setInstanceCount:8];

    [(UIView *)v3->_replicatorContainer addSubview:v3->_replicatorView];
    [(UIView *)v19 addSubview:v3->_replicatorContainer];
    [(_UIRefreshControlModernContentView *)v19 _resetToRevealingState];
    [(_UIRefreshControlModernContentView *)v19 _updateTimeOffsetOfRelevantLayers];
    [(UIView *)v19 addSubview:v3->_textLabel];
  }
  return v3;
}

- (void)_resetToRevealingState
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __60___UIRefreshControlModernContentView__resetToRevealingState__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  +[UIView performWithoutAnimation:v3];
  self->_hasFinishedRevealing = 0;
  [(_UIRefreshControlModernContentView *)self _reveal];
}

- (void)willTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)_UIRefreshControlModernContentView;
  -[_UIRefreshControlContentView willTransitionFromState:toState:](&v8, sel_willTransitionFromState_toState_);
  if (a3 == 6 || a3 != 1 && a4 == 1)
  {
    [(_UIRefreshControlModernContentView *)self _resetToRevealingState];
  }
  else if (a4 == 3)
  {
    [(_UIRefreshControlModernContentView *)self _spin];
  }
  double v7 = [(UIView *)self->_textLabel layer];
  [v7 removeAllAnimations];
}

- (void)didTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  switch(a4)
  {
    case 0:
      goto LABEL_8;
    case 1:
      if (a3 == 4) {
        goto LABEL_9;
      }
      [(_UIRefreshControlModernContentView *)self _updateTimeOffsetOfRelevantLayers];
      goto LABEL_16;
    case 2:
      double v7 = [(_UIRefreshControlContentView *)self impactFeedbackGenerator];
      char v8 = [v7 isActive];

      if ((v8 & 1) == 0)
      {
        double v9 = [(_UIRefreshControlContentView *)self impactFeedbackGenerator];
        [v9 activateWithCompletionBlock:0];
      }
      [(_UIRefreshControlModernContentView *)self _snappingMagic];
      goto LABEL_8;
    case 3:
      if (a3)
      {
LABEL_8:
        if (a3 == 4) {
LABEL_9:
        }
          [(_UIRefreshControlModernContentView *)self _resetToRevealingState];
      }
      else
      {
        [(_UIRefreshControlModernContentView *)self _tickDueToProgrammaticRefresh];
      }
LABEL_16:
      v13.receiver = self;
      v13.super_class = (Class)_UIRefreshControlModernContentView;
      [(_UIRefreshControlContentView *)&v13 didTransitionFromState:a3 toState:a4];
      return;
    case 4:
      [(_UIRefreshControlModernContentView *)self _goAway];
      goto LABEL_13;
    case 5:
      if (a3 == 4) {
        [(_UIRefreshControlModernContentView *)self _resetToRevealingState];
      }
LABEL_13:
      v10 = [(_UIRefreshControlContentView *)self impactFeedbackGenerator];
      int v11 = [v10 isActive];

      if (v11)
      {
        v12 = [(_UIRefreshControlContentView *)self impactFeedbackGenerator];
        [v12 deactivate];
      }
      goto LABEL_16;
    case 6:
      goto LABEL_9;
    default:
      goto LABEL_16;
  }
}

- (id)_effectiveTintColorWithAlpha:(double)a3
{
  id v4 = [(_UIRefreshControlModernContentView *)self _effectiveTintColor];
  double v5 = [v4 colorWithAlphaComponent:a3];

  return v5;
}

- (id)_effectiveTintColor
{
  v2 = [(_UIRefreshControlContentView *)self tintColor];
  double v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[UIColor labelColor];
  }
  double v5 = v4;

  return v5;
}

- (void)_setUnbloomedAppearance
{
  seed = self->_seed;
  [(_UIRefreshControlModernContentView *)self _unbloomedSeedTransform];
  [(UIView *)seed setTransform:&v3];
}

- (CGAffineTransform)_unbloomedSeedTransform
{
  uint64_t v3 = MEMORY[0x1E4F1DAB8];
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->c = v4;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v3 + 32);
  return self;
}

- (int64_t)style
{
  return 2;
}

- (void)_tickDueToProgrammaticRefresh
{
  [(_UIRefreshControlModernContentView *)self _cleanUpAfterRevealing];
  [(_UIRefreshControlModernContentView *)self _setSpunAppearance];
  [(_UIRefreshControlModernContentView *)self _tick];
}

- (void)_removeAllAnimations
{
  id v2 = [(UIView *)self->_replicatorView layer];
  [v2 removeAllAnimations];
}

- (void)_cleanUpAfterRevealing
{
  self->_hasFinishedRevealing = 1;
  id v3 = [(UIView *)self->_replicatorView layer];
  LODWORD(v2) = 1.0;
  [v3 setSpeed:v2];
}

- (void)_setSpunAppearance
{
  replicatorContainer = self->_replicatorContainer;
  CGAffineTransformMakeRotation(&v11, 3.13159265);
  [(UIView *)replicatorContainer setTransform:&v11];
  long long v4 = [(UIView *)self->_replicatorView layer];
  LODWORD(v5) = *(_DWORD *)"\nף=";
  [v4 setInstanceAlphaOffset:v5];

  os_variant_has_internal_diagnostics();
  double v6 = +[UITraitCollection _currentTraitCollectionIfExists]();
  double v7 = [(UIView *)self traitCollection];
  +[UITraitCollection setCurrentTraitCollection:v7];

  char v8 = (void *)_UISetCurrentFallbackEnvironment(self);
  double v9 = [(UIView *)self->_replicatorView layer];
  id v10 = [(_UIRefreshControlModernContentView *)self _effectiveTintColorWithAlpha:0.0];
  objc_msgSend(v9, "setInstanceColor:", objc_msgSend(v10, "CGColor"));

  _UIRestorePreviousFallbackEnvironment(v8);
  +[UITraitCollection setCurrentTraitCollection:v6];
}

- (void)_setBloomedAppearance
{
  seed = self->_seed;
  [(_UIRefreshControlModernContentView *)self _bloomedSeedTransform];
  [(UIView *)seed setTransform:&v3];
}

- (CGAffineTransform)_bloomedSeedTransform
{
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  [(_UIRefreshControlModernContentView *)self _unbloomedSeedTransform];
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeScale(&v13, 1.2, 1.2);
  memset(&v12, 0, sizeof(v12));
  CGAffineTransformMakeTranslation(&v12, 0.0, -2.0);
  long long v4 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransform v9 = v13;
  CGAffineTransformConcat(&v11, &t1, &v9);
  long long v5 = *(_OWORD *)&v11.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  long long v6 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransform v9 = v12;
  double result = CGAffineTransformConcat(&v11, &t1, &v9);
  long long v8 = *(_OWORD *)&v11.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v11.a;
  *(_OWORD *)&retstr->c = v8;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v11.tx;
  return result;
}

- (void)_unbloom
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46___UIRefreshControlModernContentView__unbloom__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView animateWithDuration:0 delay:v2 options:0 animations:0.15 completion:0.0];
}

- (void)_bloom
{
  v2[4] = self;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44___UIRefreshControlModernContentView__bloom__block_invoke;
  v3[3] = &unk_1E52D9F70;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __44___UIRefreshControlModernContentView__bloom__block_invoke_2;
  v2[3] = &unk_1E52DC3A0;
  +[UIView animateWithDuration:196608 delay:v3 options:v2 animations:0.05 completion:0.0];
}

- (void)_spin
{
  [(_UIRefreshControlModernContentView *)self _cleanUpAfterRevealing];
  [(_UIRefreshControlModernContentView *)self currentPopStiffness];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __43___UIRefreshControlModernContentView__spin__block_invoke;
  v19[3] = &unk_1E52D9F70;
  v19[4] = self;
  +[UIView _animateUsingSpringWithDuration:196612 delay:v19 options:0 mass:4.0 stiffness:0.0 damping:1.0 initialVelocity:v3 animations:5000.0 completion:0.0];
  [(_UIRefreshControlModernContentView *)self _tick];
  [(_UIRefreshControlModernContentView *)self _bloom];
  long long v4 = [(_UIRefreshControlContentView *)self impactFeedbackGenerator];
  int v5 = [v4 isActive];

  if (v5)
  {
    long long v6 = [(_UIRefreshControlContentView *)self impactFeedbackGenerator];
    [(_UIRefreshControlModernContentView *)self impactIntensity];
    double v8 = v7;
    CGAffineTransform v9 = [(_UIRefreshControlContentView *)self refreshControl];
    id v10 = [v9 _scrollView];
    [(UIView *)self center];
    double v12 = v11;
    double v14 = v13;
    v15 = [(UIView *)self superview];
    objc_msgSend(v10, "convertPoint:fromView:", v15, v12, v14);
    objc_msgSend(v6, "impactOccurredWithIntensity:atLocation:", v8, v16, v17);

    v18 = [(_UIRefreshControlContentView *)self impactFeedbackGenerator];
    [v18 deactivate];
  }
}

- (void)_tick
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __43___UIRefreshControlModernContentView__tick__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView animateKeyframesWithDuration:117638156 delay:v2 options:0 animations:1.0 completion:0.0];
}

- (void)_goAway
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __45___UIRefreshControlModernContentView__goAway__block_invoke;
  v2[3] = &unk_1E52D9F70;
  v2[4] = self;
  +[UIView animateWithDuration:0 delay:v2 options:0 animations:0.3 completion:0.0];
}

- (void)_snappingMagic
{
  id v2 = [(_UIRefreshControlContentView *)self refreshControl];
  [v2 setRefreshControlState:3];
}

- (void)setAttributedTitle:(id)a3
{
  self->_animationsAreValid = 0;
}

- (id)attributedTitle
{
  return [(UILabel *)self->_textLabel attributedText];
}

- (BOOL)areAnimationsValid
{
  return self->_areAnimationsValid;
}

- (void)setAreAnimationsValid:(BOOL)a3
{
  self->_areAnimationsValid = a3;
}

- (UILabel)textLabel
{
  return self->_textLabel;
}

- (double)currentPopStiffness
{
  return self->_currentPopStiffness;
}

- (double)impactIntensity
{
  return self->_impactIntensity;
}

- (BOOL)horizontallyCenteredFramesNeedUpdate
{
  return self->_horizontallyCenteredFramesNeedUpdate;
}

- (void)setHorizontallyCenteredFramesNeedUpdate:(BOOL)a3
{
  self->_horizontallyCenteredFramesNeedUpdate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textLabel, 0);
  objc_storeStrong((id *)&self->_seed, 0);
  objc_storeStrong((id *)&self->_replicatorView, 0);
  objc_storeStrong((id *)&self->_replicatorContainer, 0);
}

@end