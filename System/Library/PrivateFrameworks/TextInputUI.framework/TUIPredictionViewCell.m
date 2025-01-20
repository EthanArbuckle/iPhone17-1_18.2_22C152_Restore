@interface TUIPredictionViewCell
+ (BOOL)_useSeparatorViews;
+ (id)cellHighlightColorForDarkStyle:(BOOL)a3;
+ (id)cellHighlightColorForRenderConfig:(id)a3;
- (BOOL)_isEmojiCandidate:(id)a3;
- (BOOL)_isSecureCandidate:(id)a3;
- (BOOL)_isSmartReplyCandidate:(id)a3;
- (BOOL)_isStickerCandidate:(id)a3;
- (BOOL)_isTextEffectsCandidate:(id)a3;
- (BOOL)_isWritingToolsCandidate:(id)a3;
- (BOOL)_renderConfigUsesDarkStyle:(id)a3;
- (BOOL)_useFloatingStyle;
- (BOOL)_usePadStyle;
- (BOOL)_usesMorphingLabelForCandidate:(id)a3;
- (BOOL)candidateRequiresShrinkingForBoundingWidth:(double)a3;
- (BOOL)candidateRequiresTruncationForBoundingWidth:(double)a3;
- (BOOL)highlighted;
- (BOOL)isLabelTruncated;
- (BOOL)shouldShowScalingAnimation;
- (BOOL)shouldUseRTLForMathEquations;
- (BOOL)useAutofillStyle;
- (BOOL)useContinuousCornerInHighlight;
- (BOOL)useWritingToolsStyle;
- (CGSize)intrinsicContentSize;
- (CGSize)labelTextSizeForCandidate:(id)a3;
- (TIKeyboardCandidate)candidate;
- (TUIGradientView)lightEffectsContainer;
- (TUIPredictionViewCell)initWithFrame:(CGRect)a3;
- (UIColor)backgroundViewHighlightColor;
- (UIColor)highlightColor;
- (UIColor)imageTintColor;
- (UIColor)preferredBackgroundColor;
- (UIColor)preferredForegroundColor;
- (UIColor)separatorColor;
- (UIColor)textColor;
- (UIFont)labelFont;
- (UIImage)image;
- (UIImageView)imageView;
- (UIKBRenderConfig)renderConfig;
- (UIKBVisualEffectView)vibrantBackgroundView;
- (UILabel)normalLabel;
- (UIMorphingLabel)morphingLabel;
- (UIScrollView)maskingScrollView;
- (UITextView)animationsLabelView;
- (UIView)backgroundView;
- (UIView)customView;
- (UIView)leftSeparatorView;
- (UIView)rightSeparatorView;
- (UIView)secureCandidateLabel;
- (_NSTextAnimator)activeAnimator;
- (_UIDirectionalLightConfiguration)smartReplyLightConfiguration;
- (double)highlightCornerRadius;
- (double)highlightMargin;
- (double)separatorMargin;
- (id)_displayLabelForCandidate:(id)a3;
- (id)_localizedTitleForAnimationName:(id)a3;
- (id)_preferredBackgroundColor;
- (id)_preferredTextColorForHighlighted:(BOOL)a3 useDarkStyle:(BOOL)a4;
- (id)_preferredTextColorForRenderConfig:(id)a3 highlighted:(BOOL)a4;
- (id)attributedStringRepresentationOfCandidate:(id)a3;
- (id)centerTruncatedStringForString:(id)a3 withAttributes:(id)a4 fittingWidth:(double)a5;
- (id)currentBackgroundView;
- (id)currentTextSuggestion;
- (id)displayTextAttributesForMultiline:(BOOL)a3 header:(BOOL)a4 shrink:(BOOL)a5;
- (id)headerTextAttributes;
- (id)labelView;
- (id)labelViewForCandidate:(id)a3;
- (int64_t)layoutType;
- (unint64_t)predictionPosition;
- (unint64_t)roundedHighlightEdges;
- (unint64_t)visibleSeparatorEdges;
- (void)_applyTextEffectAnimationAttribute:(id)a3 attributedCandidateString:(id)a4;
- (void)_applyTextEffectStyleAttribute:(id)a3 attributedCandidateString:(id)a4 fontDescriptor:(id)a5;
- (void)_resetViewForUnanimatedBackdrop:(id)a3;
- (void)_setMorphingLabelWithCandidate:(id)a3 animated:(BOOL)a4;
- (void)_setNormalLabelWithCandidate:(id)a3 animated:(BOOL)a4;
- (void)_setSecureCandidate:(id)a3 animated:(BOOL)a4;
- (void)_setSmartReplyCandidate:(id)a3 animated:(BOOL)a4;
- (void)_setTextEffectsCandidate:(id)a3 animated:(BOOL)a4;
- (void)_updateColorsForRenderConfig:(id)a3 highlighted:(BOOL)a4;
- (void)_updateCornerRadius;
- (void)_updateForAnimatedBackdropIfNeeded:(id)a3 highlighted:(BOOL)a4;
- (void)_updateViewForAnimatedBackdrop:(id)a3 usingAlpha:(double)a4 darkConfiguration:(BOOL)a5;
- (void)endAnimations;
- (void)layoutSubviews;
- (void)scrollViewDidScroll:(id)a3;
- (void)setActiveAnimator:(id)a3;
- (void)setAnimationsLabelView:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBackgroundViewHighlightColor:(id)a3;
- (void)setCandidate:(id)a3;
- (void)setCandidate:(id)a3 animated:(BOOL)a4;
- (void)setCustomView:(id)a3;
- (void)setHighlightColor:(id)a3;
- (void)setHighlightCornerRadius:(double)a3;
- (void)setHighlightMargin:(double)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setImageTintColor:(id)a3;
- (void)setImageView:(id)a3;
- (void)setLabelFont:(id)a3;
- (void)setLabelTruncated:(BOOL)a3;
- (void)setLeftSeparatorView:(id)a3;
- (void)setLightEffectsContainer:(id)a3;
- (void)setLightingEffectEnabled:(BOOL)a3;
- (void)setMaskingScrollView:(id)a3;
- (void)setMorphingLabel:(id)a3;
- (void)setNormalLabel:(id)a3;
- (void)setPredictionPosition:(unint64_t)a3;
- (void)setPreferredBackgroundColor:(id)a3;
- (void)setPreferredForegroundColor:(id)a3;
- (void)setRenderConfig:(id)a3;
- (void)setRightSeparatorView:(id)a3;
- (void)setRoundedHighlightEdges:(unint64_t)a3;
- (void)setSecureCandidateLabel:(id)a3;
- (void)setSeparatorColor:(id)a3;
- (void)setSeparatorMargin:(double)a3;
- (void)setShouldShowScalingAnimation:(BOOL)a3;
- (void)setSmartReplyLightConfiguration:(id)a3;
- (void)setTextColor:(id)a3;
- (void)setUseContinuousCornerInHighlight:(BOOL)a3;
- (void)setVibrantBackgroundView:(id)a3;
- (void)setVisibleSeparatorEdges:(unint64_t)a3;
@end

@implementation TUIPredictionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_smartReplyLightConfiguration, 0);
  objc_storeStrong((id *)&self->_lightEffectsContainer, 0);
  objc_destroyWeak((id *)&self->_activeAnimator);
  objc_storeStrong((id *)&self->_animationsLabelView, 0);
  objc_storeStrong((id *)&self->_secureCandidateLabel, 0);
  objc_storeStrong((id *)&self->_morphingLabel, 0);
  objc_storeStrong((id *)&self->_normalLabel, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_rightSeparatorView, 0);
  objc_storeStrong((id *)&self->_leftSeparatorView, 0);
  objc_storeStrong((id *)&self->_backgroundViewHighlightColor, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_vibrantBackgroundView, 0);
  objc_storeStrong((id *)&self->_preferredBackgroundColor, 0);
  objc_storeStrong((id *)&self->_preferredForegroundColor, 0);
  objc_storeStrong((id *)&self->_highlightColor, 0);
  objc_storeStrong((id *)&self->_separatorColor, 0);
  objc_storeStrong((id *)&self->_imageTintColor, 0);
  objc_storeStrong((id *)&self->_textColor, 0);
  objc_storeStrong((id *)&self->_maskingScrollView, 0);
  objc_storeStrong((id *)&self->_renderConfig, 0);
  objc_storeStrong((id *)&self->_customView, 0);
  objc_storeStrong((id *)&self->_candidate, 0);
}

- (void)setSmartReplyLightConfiguration:(id)a3
{
}

- (_UIDirectionalLightConfiguration)smartReplyLightConfiguration
{
  return self->_smartReplyLightConfiguration;
}

- (void)setLightEffectsContainer:(id)a3
{
}

- (TUIGradientView)lightEffectsContainer
{
  return self->_lightEffectsContainer;
}

- (void)setActiveAnimator:(id)a3
{
}

- (_NSTextAnimator)activeAnimator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAnimator);
  return (_NSTextAnimator *)WeakRetained;
}

- (void)setAnimationsLabelView:(id)a3
{
}

- (UITextView)animationsLabelView
{
  return self->_animationsLabelView;
}

- (void)setSecureCandidateLabel:(id)a3
{
}

- (UIView)secureCandidateLabel
{
  return self->_secureCandidateLabel;
}

- (void)setMorphingLabel:(id)a3
{
}

- (UIMorphingLabel)morphingLabel
{
  return self->_morphingLabel;
}

- (void)setNormalLabel:(id)a3
{
}

- (UILabel)normalLabel
{
  return self->_normalLabel;
}

- (void)setLabelTruncated:(BOOL)a3
{
  self->_labelTruncated = a3;
}

- (BOOL)isLabelTruncated
{
  return self->_labelTruncated;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setRightSeparatorView:(id)a3
{
}

- (UIView)rightSeparatorView
{
  return self->_rightSeparatorView;
}

- (void)setLeftSeparatorView:(id)a3
{
}

- (UIView)leftSeparatorView
{
  return self->_leftSeparatorView;
}

- (void)setBackgroundViewHighlightColor:(id)a3
{
}

- (UIColor)backgroundViewHighlightColor
{
  return self->_backgroundViewHighlightColor;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setVibrantBackgroundView:(id)a3
{
}

- (UIKBVisualEffectView)vibrantBackgroundView
{
  return self->_vibrantBackgroundView;
}

- (void)setPredictionPosition:(unint64_t)a3
{
  self->_predictionPosition = a3;
}

- (unint64_t)predictionPosition
{
  return self->_predictionPosition;
}

- (void)setShouldShowScalingAnimation:(BOOL)a3
{
  self->_shouldShowScalingAnimation = a3;
}

- (BOOL)shouldShowScalingAnimation
{
  return self->_shouldShowScalingAnimation;
}

- (UIColor)preferredBackgroundColor
{
  return self->_preferredBackgroundColor;
}

- (UIColor)preferredForegroundColor
{
  return self->_preferredForegroundColor;
}

- (void)setHighlightColor:(id)a3
{
}

- (UIColor)highlightColor
{
  return self->_highlightColor;
}

- (UIColor)separatorColor
{
  return self->_separatorColor;
}

- (UIColor)imageTintColor
{
  return self->_imageTintColor;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (void)setMaskingScrollView:(id)a3
{
}

- (UIScrollView)maskingScrollView
{
  return self->_maskingScrollView;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (UIView)customView
{
  return self->_customView;
}

- (TIKeyboardCandidate)candidate
{
  return self->_candidate;
}

- (double)separatorMargin
{
  return self->_separatorMargin;
}

- (unint64_t)visibleSeparatorEdges
{
  return self->_visibleSeparatorEdges;
}

- (void)setRoundedHighlightEdges:(unint64_t)a3
{
  self->_roundedHighlightEdges = a3;
}

- (unint64_t)roundedHighlightEdges
{
  return self->_roundedHighlightEdges;
}

- (BOOL)useContinuousCornerInHighlight
{
  return self->_useContinuousCornerInHighlight;
}

- (double)highlightCornerRadius
{
  return self->_highlightCornerRadius;
}

- (void)setHighlightMargin:(double)a3
{
  self->_highlightMargin = a3;
}

- (double)highlightMargin
{
  return self->_highlightMargin;
}

- (BOOL)highlighted
{
  return self->_highlighted;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v28 = a3;
  [(TUIPredictionViewCell *)self bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([v28 isScrollEnabled])
  {
    v12 = [(TUIPredictionViewCell *)self maskingScrollView];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;
    v17 = [(TUIPredictionViewCell *)self maskingScrollView];
    [v17 contentInset];
    double v9 = v14 - (v18 + v19);
    double v11 = v16 - (v20 + v21);

    [v28 contentOffset];
    double v23 = v22;
    double v7 = v24;
    v25 = [(TUIPredictionViewCell *)self maskingScrollView];
    [v25 contentInset];
    double v5 = v23 + v26;
  }
  v27 = [(TUIPredictionViewCell *)self morphingLabel];
  objc_msgSend(v27, "setVisibleRect:", v5, v7, v9, v11);
}

- (void)setLightingEffectEnabled:(BOOL)a3
{
  if (a3)
  {
    double v4 = (float)((float)[(TUIPredictionViewCell *)self predictionPosition] * 0.625);
    double v5 = [(TUIPredictionViewCell *)self smartReplyLightConfiguration];

    if (!v5)
    {
      double v6 = (void *)MEMORY[0x1E4FB2058];
      double v7 = [(TUIPredictionViewCell *)self textColor];
      double v8 = [(TUIPredictionViewCell *)self textColor];
      double v9 = objc_msgSend(v6, "_tui_intelligenceAmbientPaletteWithStartColor:endColor:", v7, v8);
      double v10 = objc_msgSend(v9, "_tui_scaledColorSpaceForAmbientText");

      double v11 = (void *)[objc_alloc(MEMORY[0x1E4FB20A8]) initWithColorPalette:v10];
      [v11 setDirection:0];
      [v11 setDuration:2.0];
      [(TUIPredictionViewCell *)self setSmartReplyLightConfiguration:v11];
    }
    v12 = [(TUIPredictionViewCell *)self smartReplyLightConfiguration];
    double v13 = [(TUIPredictionViewCell *)self lightEffectsContainer];
    [v13 setLightConfiguration:v12];

    double v14 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A090]];
    double v15 = [(TUIPredictionViewCell *)self maskingScrollView];
    double v16 = [v15 layer];
    [v16 setCompositingFilter:v14];

    dispatch_time_t v17 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__TUIPredictionViewCell_setLightingEffectEnabled___block_invoke;
    block[3] = &unk_1E55941A8;
    block[4] = self;
    dispatch_after(v17, MEMORY[0x1E4F14428], block);
  }
  else
  {
    double v18 = [(TUIPredictionViewCell *)self lightEffectsContainer];
    [v18 setLightConfiguration:0];

    id v20 = [(TUIPredictionViewCell *)self maskingScrollView];
    double v19 = [v20 layer];
    [v19 setCompositingFilter:0];
  }
}

void __50__TUIPredictionViewCell_setLightingEffectEnabled___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) lightEffectsContainer];
  [v1 runAnimationCount:1 duration:2.0];
}

- (id)currentBackgroundView
{
  v3 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(TUIPredictionViewCell *)self backgroundView];
  }
  double v6 = v5;

  return v6;
}

- (void)_updateCornerRadius
{
  BOOL v3 = [(TUIPredictionViewCell *)self useContinuousCornerInHighlight];
  [(TUIPredictionViewCell *)self highlightCornerRadius];
  double v5 = v4;
  double v6 = [(TUIPredictionViewCell *)self currentBackgroundView];
  id v7 = v6;
  if (v3) {
    [v6 _setContinuousCornerRadius:v5];
  }
  else {
    [v6 _setCornerRadius:v5];
  }
}

- (void)_resetViewForUnanimatedBackdrop:(id)a3
{
  id v3 = a3;
  [v3 setAlpha:1.0];
  double v4 = [v3 layer];
  [v4 setCompositingFilter:0];

  id v5 = [v3 layer];

  [v5 setAllowsEdgeAntialiasing:0];
}

- (void)_updateViewForAnimatedBackdrop:(id)a3 usingAlpha:(double)a4 darkConfiguration:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  [v7 setAlpha:a4];
  double v8 = (void *)MEMORY[0x1E4F3A2E0];
  if (v5) {
    double v8 = (void *)MEMORY[0x1E4F3A2E8];
  }
  double v9 = [MEMORY[0x1E4F39BC0] filterWithType:*v8];
  double v10 = [v7 layer];
  [v10 setCompositingFilter:v9];

  id v11 = [v7 layer];

  [v11 setAllowsEdgeAntialiasing:1];
}

- (void)_updateForAnimatedBackdropIfNeeded:(id)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  id v56 = a3;
  if ([v56 animatedBackground])
  {
    BOOL v6 = [(TUIPredictionViewCell *)self _renderConfigUsesDarkStyle:v56];
    id v7 = [(TUIPredictionViewCell *)self layer];
    [v7 setAllowsGroupOpacity:0];

    double v8 = [(TUIPredictionViewCell *)self layer];
    [v8 setAllowsGroupBlending:0];

    double v9 = [(TUIPredictionViewCell *)self maskingScrollView];
    double v10 = [v9 layer];
    [v10 setAllowsGroupOpacity:0];

    id v11 = [(TUIPredictionViewCell *)self maskingScrollView];
    v12 = [v11 layer];
    [v12 setAllowsGroupBlending:0];

    double v13 = [(TUIPredictionViewCell *)self labelView];
    [(TUIPredictionViewCell *)self _updateViewForAnimatedBackdrop:v13 usingAlpha:v6 darkConfiguration:0.6];

    double v14 = [(TUIPredictionViewCell *)self morphingLabel];
    double v15 = [v14 layer];
    [v15 setAllowsGroupOpacity:0];

    double v16 = [(TUIPredictionViewCell *)self morphingLabel];
    dispatch_time_t v17 = [v16 layer];
    [v17 setAllowsGroupBlending:0];

    double v18 = [(TUIPredictionViewCell *)self rightSeparatorView];
    [(TUIPredictionViewCell *)self _updateViewForAnimatedBackdrop:v18 usingAlpha:v6 darkConfiguration:1.0];

    double v19 = [(TUIPredictionViewCell *)self leftSeparatorView];
    [(TUIPredictionViewCell *)self _updateViewForAnimatedBackdrop:v19 usingAlpha:v6 darkConfiguration:1.0];

    id v20 = [(TUIPredictionViewCell *)self vibrantBackgroundView];

    if (!v20)
    {
      id v21 = objc_alloc(MEMORY[0x1E4FB18C8]);
      double v22 = objc_msgSend(v21, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(TUIPredictionViewCell *)self setVibrantBackgroundView:v22];

      double v23 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
      double v24 = [v23 layer];
      [v24 setCornerRadius:5.0];

      v25 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
      double v26 = [v25 layer];
      [v26 setMasksToBounds:1];

      v27 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
      [v27 setHidden:1];

      id v28 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
      v29 = [(TUIPredictionViewCell *)self maskingScrollView];
      [(TUIPredictionViewCell *)self insertSubview:v28 belowSubview:v29];

      v30 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
      [v30 transitionToStyle:3905];
    }
    v31 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
    v32 = v31;
    if (v4)
    {
      [v31 setHidden:0];

      v33 = [(id)objc_opt_class() cellHighlightColorForRenderConfig:v56];
      v34 = [v33 colorWithAlphaComponent:0.75];
      v35 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
      [v35 setBackgroundColor:v34];

      v36 = [MEMORY[0x1E4F39BC0] filterWithType:*MEMORY[0x1E4F3A2E8]];
      v37 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
      v38 = [v37 layer];
      [v38 setCompositingFilter:v36];

      if (v6) {
        double v39 = 1.0;
      }
      else {
        double v39 = 0.15;
      }
      v40 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
      [v40 setAlpha:v39];
    }
    else
    {
      [v31 setHidden:1];
    }
  }
  else
  {
    v41 = [(TUIPredictionViewCell *)self vibrantBackgroundView];

    if (v41)
    {
      v42 = [(TUIPredictionViewCell *)self layer];
      [v42 setAllowsGroupOpacity:1];

      v43 = [(TUIPredictionViewCell *)self layer];
      [v43 setAllowsGroupBlending:1];

      v44 = [(TUIPredictionViewCell *)self maskingScrollView];
      v45 = [v44 layer];
      [v45 setAllowsGroupOpacity:1];

      v46 = [(TUIPredictionViewCell *)self maskingScrollView];
      v47 = [v46 layer];
      [v47 setAllowsGroupBlending:1];

      v48 = [(TUIPredictionViewCell *)self morphingLabel];
      [(TUIPredictionViewCell *)self _resetViewForUnanimatedBackdrop:v48];

      v49 = [(TUIPredictionViewCell *)self animationsLabelView];
      [(TUIPredictionViewCell *)self _resetViewForUnanimatedBackdrop:v49];

      v50 = [(TUIPredictionViewCell *)self normalLabel];
      [(TUIPredictionViewCell *)self _resetViewForUnanimatedBackdrop:v50];

      v51 = [(TUIPredictionViewCell *)self secureCandidateLabel];
      [(TUIPredictionViewCell *)self _resetViewForUnanimatedBackdrop:v51];

      v52 = [(TUIPredictionViewCell *)self rightSeparatorView];
      [(TUIPredictionViewCell *)self _resetViewForUnanimatedBackdrop:v52];

      v53 = [(TUIPredictionViewCell *)self leftSeparatorView];
      [(TUIPredictionViewCell *)self _resetViewForUnanimatedBackdrop:v53];

      v54 = [(TUIPredictionViewCell *)self vibrantBackgroundView];

      if (v54)
      {
        v55 = [(TUIPredictionViewCell *)self vibrantBackgroundView];
        [v55 removeFromSuperview];

        [(TUIPredictionViewCell *)self setVibrantBackgroundView:0];
      }
    }
  }
}

- (void)_updateColorsForRenderConfig:(id)a3 highlighted:(BOOL)a4
{
  BOOL v4 = a4;
  id v19 = a3;
  BOOL v6 = [(TUIPredictionViewCell *)self _renderConfigUsesDarkStyle:v19];
  id v7 = [(TUIPredictionViewCell *)self _preferredTextColorForRenderConfig:v19 highlighted:v4];
  [(TUIPredictionViewCell *)self setTextColor:v7];
  [(TUIPredictionViewCell *)self setImageTintColor:v7];
  if ([(id)objc_opt_class() _useSeparatorViews])
  {
    double v8 = [(TUIPredictionViewCell *)self separatorColor];
    if (!v8)
    {
      double v8 = UIKeyboardGetLightCandidateSeparatorColor();
      if (v6)
      {
        uint64_t v9 = [MEMORY[0x1E4FB1618] colorWithWhite:1.0 alpha:0.1];

        double v8 = (void *)v9;
      }
    }
    if (v4)
    {
      uint64_t v10 = [MEMORY[0x1E4FB1618] clearColor];

      double v8 = (void *)v10;
    }
    id v11 = [(TUIPredictionViewCell *)self leftSeparatorView];
    [v11 setBackgroundColor:v8];

    v12 = [(TUIPredictionViewCell *)self rightSeparatorView];
    [v12 setBackgroundColor:v8];
  }
  double v13 = [(TUIPredictionViewCell *)self _preferredBackgroundColor];
  if (v4)
  {
    double v14 = [(TUIPredictionViewCell *)self highlightColor];
    double v15 = v14;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      id v16 = [(id)objc_opt_class() cellHighlightColorForDarkStyle:v6];
    }
    id v17 = v16;

    double v13 = v17;
  }
  [(TUIPredictionViewCell *)self _updateForAnimatedBackdropIfNeeded:v19 highlighted:v4];
  if (([v19 animatedBackground] & 1) == 0)
  {
    double v18 = [(TUIPredictionViewCell *)self backgroundView];
    [v18 setBackgroundColor:v13];
  }
}

- (BOOL)_renderConfigUsesDarkStyle:(id)a3
{
  if (a3) {
    return [a3 lightKeyboard] ^ 1;
  }
  else {
    return 0;
  }
}

- (id)labelView
{
  id v3 = [(TUIPredictionViewCell *)self candidate];
  BOOL v4 = [(TUIPredictionViewCell *)self labelViewForCandidate:v3];

  return v4;
}

- (void)setRenderConfig:(id)a3
{
  BOOL v5 = (UIKBRenderConfig *)a3;
  if (self->_renderConfig != v5)
  {
    objc_storeStrong((id *)&self->_renderConfig, a3);
    [(TUIPredictionViewCell *)self _updateColorsForRenderConfig:v5 highlighted:self->_highlighted];
  }
}

- (void)setCustomView:(id)a3
{
  id v8 = a3;
  id v5 = [(TUIPredictionViewCell *)self customView];

  BOOL v6 = v8;
  if (v5 != v8)
  {
    id v7 = self->_customView;
    objc_storeStrong((id *)&self->_customView, a3);
    [(UIView *)v7 removeFromSuperview];
    if (v8)
    {
      [(TUIPredictionViewCell *)self addSubview:v8];
      [(TUIPredictionViewCell *)self setNeedsLayout];
    }

    BOOL v6 = v8;
  }
}

- (UIImage)image
{
  v2 = [(TUIPredictionViewCell *)self imageView];
  id v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(TUIPredictionViewCell *)self imageView];
  if (v9)
  {

    if (!v4)
    {
      id v5 = objc_alloc(MEMORY[0x1E4FB1838]);
      BOOL v6 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [(TUIPredictionViewCell *)self setImageView:v6];

      id v7 = [(TUIPredictionViewCell *)self imageView];
      [(TUIPredictionViewCell *)self addSubview:v7];
    }
  }
  else
  {
    [v4 removeFromSuperview];

    [(TUIPredictionViewCell *)self setImageView:0];
  }
  id v8 = [(TUIPredictionViewCell *)self imageView];
  [v8 setImage:v9];

  [(TUIPredictionViewCell *)self setNeedsLayout];
}

- (void)setVisibleSeparatorEdges:(unint64_t)a3
{
  self->_visibleSeparatorEdges = a3;
  [(TUIPredictionViewCell *)self setNeedsLayout];
}

- (void)setCandidate:(id)a3
{
}

- (void)setCandidate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v15 = a3;
  id v7 = [(TIKeyboardCandidate *)self->_candidate candidate];
  id v8 = [v15 candidate];
  int v9 = [v7 isEqual:v8];

  objc_storeStrong((id *)&self->_candidate, a3);
  uint64_t v10 = [(TUIPredictionViewCell *)self morphingLabel];
  [v10 setHidden:1];

  id v11 = [(TUIPredictionViewCell *)self normalLabel];
  [v11 setHidden:1];

  v12 = [(TUIPredictionViewCell *)self secureCandidateLabel];
  [v12 setHidden:1];

  double v13 = [(TUIPredictionViewCell *)self animationsLabelView];
  [v13 setHidden:1];

  [(TUIPredictionViewCell *)self endAnimations];
  double v14 = [(TUIPredictionViewCell *)self animationsLabelView];
  [v14 setText:0];

  [(TUIPredictionViewCell *)self setLabelTruncated:0];
  [(TUIPredictionViewCell *)self setLightingEffectEnabled:0];
  [(TUIPredictionViewCell *)self setAccessibilityIdentifier:0];
  if ([(TUIPredictionViewCell *)self _isSecureCandidate:v15])
  {
    [(TUIPredictionViewCell *)self _setSecureCandidate:v15 animated:v4];
  }
  else if ([(TUIPredictionViewCell *)self _isTextEffectsCandidate:v15])
  {
    [(TUIPredictionViewCell *)self _setTextEffectsCandidate:v15 animated:v4];
  }
  else if ([(TUIPredictionViewCell *)self _isSmartReplyCandidate:v15])
  {
    [(TUIPredictionViewCell *)self _setSmartReplyCandidate:v15 animated:(v9 ^ 1) & v4];
  }
  else if ([(TUIPredictionViewCell *)self _usesMorphingLabelForCandidate:v15])
  {
    [(TUIPredictionViewCell *)self _setMorphingLabelWithCandidate:v15 animated:v4];
  }
  else
  {
    [(TUIPredictionViewCell *)self _setNormalLabelWithCandidate:v15 animated:v4];
  }
  [(TUIPredictionViewCell *)self invalidateIntrinsicContentSize];
  [(TUIPredictionViewCell *)self setNeedsLayout];
}

- (void)endAnimations
{
  p_activeAnimator = &self->_activeAnimator;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activeAnimator);
  [WeakRetained invalidate];

  objc_storeWeak((id *)p_activeAnimator, 0);
}

- (void)_setSmartReplyCandidate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  -[TUIPredictionViewCell _setMorphingLabelWithCandidate:animated:](self, "_setMorphingLabelWithCandidate:animated:", a3);
  [(TUIPredictionViewCell *)self setLightingEffectEnabled:v4];
  [(TUIPredictionViewCell *)self setAccessibilityIdentifier:@"SmartReply"];
}

- (void)_applyTextEffectAnimationAttribute:(id)a3 attributedCandidateString:(id)a4
{
  id v18 = a4;
  id v6 = a3;
  id v7 = [v6 candidate];
  uint64_t v8 = [v7 length];

  int v9 = (void *)MEMORY[0x1E4FB23C0];
  uint64_t v10 = [v6 textEffectName];

  id v11 = [v9 animationWithName:v10];

  if (v11)
  {
    objc_msgSend(v18, "addAttribute:value:range:", *MEMORY[0x1E4FB0788], v11, 0, v8);
    v12 = [(TUIPredictionViewCell *)self animationsLabelView];
    [v12 setAttributedText:v18];

    double v13 = [(TUIPredictionViewCell *)self animationsLabelView];
    double v14 = [v13 _animatorForTextAnimation:v11 notify:&__block_literal_global_6404];
    p_activeAnimator = &self->_activeAnimator;
    objc_storeWeak((id *)p_activeAnimator, v14);

    id WeakRetained = objc_loadWeakRetained((id *)p_activeAnimator);
    if (WeakRetained)
    {
      id v17 = objc_loadWeakRetained((id *)p_activeAnimator);
      [v17 start];
    }
  }
}

void __86__TUIPredictionViewCell__applyTextEffectAnimationAttribute_attributedCandidateString___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 state] == 1) {
    [v2 start];
  }
}

- (void)_applyTextEffectStyleAttribute:(id)a3 attributedCandidateString:(id)a4 fontDescriptor:(id)a5
{
  id v26 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [v26 candidate];
  uint64_t v11 = [v10 length];

  v12 = [v26 textEffectName];
  int v13 = [v12 isEqualToString:@"bold"];

  if (v13)
  {
    double v14 = v9;
    uint64_t v15 = 2;
LABEL_5:
    id v18 = [v14 fontDescriptorWithSymbolicTraits:v15];
    id v19 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v18 size:17.0];
    objc_msgSend(v8, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v19, 0, v11);

    goto LABEL_11;
  }
  id v16 = [v26 textEffectName];
  int v17 = [v16 isEqualToString:@"italic"];

  if (v17)
  {
    double v14 = v9;
    uint64_t v15 = 1;
    goto LABEL_5;
  }
  id v20 = [v26 textEffectName];
  int v21 = [v20 isEqualToString:@"underline"];

  if (v21)
  {
    double v22 = (void *)MEMORY[0x1E4FB0808];
  }
  else
  {
    double v23 = [v26 textEffectName];
    int v24 = [v23 isEqualToString:@"strikeThrough"];

    if (!v24) {
      goto LABEL_11;
    }
    double v22 = (void *)MEMORY[0x1E4FB0768];
  }
  objc_msgSend(v8, "addAttribute:value:range:", *v22, &unk_1EDC79A58, 0, v11);
LABEL_11:
  v25 = [(TUIPredictionViewCell *)self animationsLabelView];
  [v25 setAttributedText:v8];
}

- (void)_setTextEffectsCandidate:(id)a3 animated:(BOOL)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [(TUIPredictionViewCell *)self animationsLabelView];
  [v6 setHidden:0];

  id v7 = [v5 textEffectName];
  id v8 = [(TUIPredictionViewCell *)self _localizedTitleForAnimationName:v7];

  id v9 = NSString;
  uint64_t v10 = [v5 candidate];
  uint64_t v11 = [v9 stringWithFormat:@"%@\n%@", v10, v8];

  v34 = (void *)v11;
  v12 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v11];
  uint64_t v13 = [v12 length];
  double v14 = [v5 candidate];
  uint64_t v33 = [v14 length] + 1;
  v35 = v8;
  uint64_t v15 = [v8 length];

  id v16 = [MEMORY[0x1E4FB19A8] preferredFontWithSize:17.0];
  v36 = [v16 fontDescriptor];
  id v17 = objc_alloc_init(MEMORY[0x1E4FB0848]);
  [v17 setAlignment:1];
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E4FB0738], v17, 0, v13);
  uint64_t v18 = *MEMORY[0x1E4FB06F8];
  objc_msgSend(v12, "addAttribute:value:range:", *MEMORY[0x1E4FB06F8], v16, 0, v13);
  uint64_t v19 = *MEMORY[0x1E4FB0700];
  id v20 = [(TUIPredictionViewCell *)self textColor];
  objc_msgSend(v12, "addAttribute:value:range:", v19, v20, 0, v13);

  int v21 = [MEMORY[0x1E4FB08E0] systemFontOfSize:11.0];
  double v22 = (void *)MEMORY[0x1E4F1CA60];
  v37[1] = v19;
  v38[0] = v21;
  v37[0] = v18;
  double v23 = [MEMORY[0x1E4FB1618] systemGrayColor];
  v38[1] = v23;
  int v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v38 forKeys:v37 count:2];
  v25 = [v22 dictionaryWithDictionary:v24];

  objc_msgSend(v12, "addAttributes:range:", v25, v33, v15);
  id v26 = (void *)MEMORY[0x1E4F610C0];
  v27 = [v5 textEffectName];
  uint64_t v28 = [v26 textEffectTypeForAnimationName:v27];

  if ((unint64_t)(v28 - 1) >= 8)
  {
    if ((unint64_t)(v28 - 9) < 4) {
      [(TUIPredictionViewCell *)self _applyTextEffectStyleAttribute:v5 attributedCandidateString:v12 fontDescriptor:v36];
    }
  }
  else
  {
    [(TUIPredictionViewCell *)self _applyTextEffectAnimationAttribute:v5 attributedCandidateString:v12];
  }
  v29 = NSString;
  v30 = [v5 candidate];
  v31 = [v5 textEffectName];
  v32 = [v29 stringWithFormat:@"%@-TextEffect(%@)", v30, v31];
  [(TUIPredictionViewCell *)self setAccessibilityIdentifier:v32];
}

- (id)_localizedTitleForAnimationName:(id)a3
{
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [&unk_1EDC79E10 objectForKeyedSubscript:v3];

  id v6 = [v4 localizedStringInDeviceLanguageForKey:v5];

  return v6;
}

- (void)_setSecureCandidate:(id)a3 animated:(BOOL)a4
{
  id v5 = objc_msgSend(MEMORY[0x1E4F39B58], "objectForSlot:", objc_msgSend(a3, "slotID"));
  id v6 = [(TUIPredictionViewCell *)self secureCandidateLabel];
  id v7 = [v6 layer];
  [v7 setContents:v5];

  id v8 = [(TUIPredictionViewCell *)self secureCandidateLabel];
  [v8 setHidden:0];
}

- (void)_setMorphingLabelWithCandidate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = (void *)MEMORY[0x1E4FB1EB0];
    if (PredictionViewAnimationFrameRateOptions_onceToken != -1) {
      dispatch_once(&PredictionViewAnimationFrameRateOptions_onceToken, &__block_literal_global_464);
    }
    uint64_t v8 = PredictionViewAnimationFrameRateOptions_frameRateOptions;
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    double v14 = __65__TUIPredictionViewCell__setMorphingLabelWithCandidate_animated___block_invoke;
    uint64_t v15 = &unk_1E55942D8;
    id v16 = self;
    id v17 = v6;
    [v7 animateWithDuration:v8 delay:&v12 options:0 animations:0.0 completion:0.0];
  }
  else
  {
    id v9 = [(TUIPredictionViewCell *)self _displayLabelForCandidate:v6];
    uint64_t v10 = [(TUIPredictionViewCell *)self morphingLabel];
    [v10 setText:v9];
  }
  uint64_t v11 = [(TUIPredictionViewCell *)self morphingLabel];
  [v11 setHidden:0];

  if ([v6 customInfoType] == 0x8000) {
    [(TUIPredictionViewCell *)self setAccessibilityIdentifier:@"Text Effects Button"];
  }
}

void __65__TUIPredictionViewCell__setMorphingLabelWithCandidate_animated___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _displayLabelForCandidate:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) morphingLabel];
  [v2 setText:v3];
}

- (void)_setNormalLabelWithCandidate:(id)a3 animated:(BOOL)a4
{
  id v5 = -[TUIPredictionViewCell attributedStringRepresentationOfCandidate:](self, "attributedStringRepresentationOfCandidate:", a3, a4);
  id v6 = [(TUIPredictionViewCell *)self normalLabel];
  [v6 setAttributedText:v5];

  id v7 = [(TUIPredictionViewCell *)self normalLabel];
  [v7 setHidden:0];
}

- (void)setLabelFont:(id)a3
{
  id v4 = a3;
  id v11 = v4;
  if (!v4)
  {
    id v4 = [MEMORY[0x1E4FB19A8] preferredFontWithSize:17.0];
  }
  id v5 = [(TUIPredictionViewCell *)self morphingLabel];
  [v5 setFont:v4];

  if (v11)
  {
    id v6 = [(TUIPredictionViewCell *)self normalLabel];
    [v6 setFont:v11];

    id v7 = v11;
  }
  else
  {

    uint64_t v8 = [(TUIPredictionViewCell *)self normalLabel];
    [v8 setFont:0];

    id v7 = [MEMORY[0x1E4FB19A8] preferredFontWithSize:17.0];
  }
  id v9 = [(TUIPredictionViewCell *)self animationsLabelView];
  [v9 setFont:v7];

  uint64_t v10 = v11;
  if (!v11)
  {

    uint64_t v10 = 0;
  }
}

- (UIFont)labelFont
{
  id v2 = [(TUIPredictionViewCell *)self morphingLabel];
  id v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setSeparatorMargin:(double)a3
{
  if (self->_separatorMargin != a3)
  {
    self->_separatorMargin = a3;
    id v4 = [(TUIPredictionViewCell *)self renderConfig];
    [(TUIPredictionViewCell *)self _updateColorsForRenderConfig:v4 highlighted:[(TUIPredictionViewCell *)self highlighted]];
  }
}

- (void)setSeparatorColor:(id)a3
{
  id v5 = (UIColor *)a3;
  p_separatorColor = &self->_separatorColor;
  if (self->_separatorColor != v5)
  {
    uint64_t v8 = v5;
    objc_storeStrong((id *)p_separatorColor, a3);
    id v7 = [(TUIPredictionViewCell *)self renderConfig];
    [(TUIPredictionViewCell *)self _updateColorsForRenderConfig:v7 highlighted:[(TUIPredictionViewCell *)self highlighted]];

    id v5 = v8;
  }
  MEMORY[0x1F41817F8](p_separatorColor, v5);
}

- (void)setHighlighted:(BOOL)a3
{
  if (self->_highlighted != a3)
  {
    BOOL v3 = a3;
    self->_highlighted = a3;
    id v5 = [(TUIPredictionViewCell *)self renderConfig];
    [(TUIPredictionViewCell *)self _updateColorsForRenderConfig:v5 highlighted:v3];
  }
}

- (void)setUseContinuousCornerInHighlight:(BOOL)a3
{
  if (self->_useContinuousCornerInHighlight != a3)
  {
    self->_useContinuousCornerInHighlight = a3;
    [(TUIPredictionViewCell *)self _updateCornerRadius];
  }
}

- (void)setHighlightCornerRadius:(double)a3
{
  if (self->_highlightCornerRadius != a3)
  {
    self->_highlightCornerRadius = a3;
    [(TUIPredictionViewCell *)self _updateCornerRadius];
  }
}

- (void)setPreferredBackgroundColor:(id)a3
{
  id v5 = (UIColor *)a3;
  preferredBackgroundColor = self->_preferredBackgroundColor;
  if (preferredBackgroundColor != v5)
  {
    id v9 = v5;
    if ((-[UIColor isEqual:](preferredBackgroundColor, "isEqual:") & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredBackgroundColor, a3);
      id v7 = v9;
      if (!v9)
      {
        id v7 = [(TUIPredictionViewCell *)self _preferredBackgroundColor];
      }
      uint64_t v8 = [(TUIPredictionViewCell *)self currentBackgroundView];
      [v8 setBackgroundColor:v7];

      if (!v9) {
    }
      }
  }
  MEMORY[0x1F4181820]();
}

- (void)setPreferredForegroundColor:(id)a3
{
  id v5 = a3;
  uint64_t preferredForegroundColor = (uint64_t)self->_preferredForegroundColor;
  if ((id)preferredForegroundColor != v5)
  {
    id v10 = v5;
    uint64_t preferredForegroundColor = [(id)preferredForegroundColor isEqual:v5];
    id v5 = v10;
    if ((preferredForegroundColor & 1) == 0)
    {
      objc_storeStrong((id *)&self->_preferredForegroundColor, a3);
      id v7 = [(TUIPredictionViewCell *)self renderConfig];
      BOOL v8 = [(TUIPredictionViewCell *)self _renderConfigUsesDarkStyle:v7];

      if (v10)
      {
        uint64_t preferredForegroundColor = [(TUIPredictionViewCell *)self setTextColor:v10];
      }
      else
      {
        id v9 = [(TUIPredictionViewCell *)self _preferredTextColorForHighlighted:0 useDarkStyle:v8];
        [(TUIPredictionViewCell *)self setTextColor:v9];
      }
      id v5 = v10;
    }
  }
  MEMORY[0x1F41817F8](preferredForegroundColor, v5);
}

- (void)setImageTintColor:(id)a3
{
  id v4 = (UIColor *)a3;
  id v5 = [(TUIPredictionViewCell *)self imageView];

  if (!v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
    id v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(TUIPredictionViewCell *)self setImageView:v7];

    BOOL v8 = [(TUIPredictionViewCell *)self imageView];
    [(TUIPredictionViewCell *)self addSubview:v8];
  }
  imageTintColor = self->_imageTintColor;
  self->_imageTintColor = v4;
  id v10 = v4;

  id v11 = [(TUIPredictionViewCell *)self imageView];
  [v11 setTintColor:v10];
}

- (void)setTextColor:(id)a3
{
  objc_storeStrong((id *)&self->_textColor, a3);
  id v5 = a3;
  id v6 = [(TUIPredictionViewCell *)self morphingLabel];
  [v6 setTextColor:v5];

  id v7 = [(TUIPredictionViewCell *)self normalLabel];
  [v7 setTextColor:v5];

  BOOL v8 = [(TUIPredictionViewCell *)self animationsLabelView];
  [v8 setTextColor:v5];

  id v9 = [(TUIPredictionViewCell *)self imageView];
  [v9 setTintColor:v5];

  [(TUIPredictionViewCell *)self setSmartReplyLightConfiguration:0];
  BOOL v10 = [(TUIPredictionViewCell *)self _isSmartReplyCandidate:self->_candidate];

  [(TUIPredictionViewCell *)self setLightingEffectEnabled:v10];
}

- (int64_t)layoutType
{
  BOOL v3 = [(TUIPredictionViewCell *)self candidate];
  id v4 = [(TUIPredictionViewCell *)self _displayLabelForCandidate:v3];
  if ([v4 length])
  {
  }
  else
  {
    id v7 = [(TUIPredictionViewCell *)self image];

    if (v7) {
      return 1;
    }
  }
  id v5 = [(TUIPredictionViewCell *)self customView];
  int64_t v6 = v5 != 0;

  return v6;
}

- (CGSize)intrinsicContentSize
{
  double v3 = *MEMORY[0x1E4FB30D8];
  id v4 = [(TUIPredictionViewCell *)self candidate];
  uint64_t v5 = [v4 customInfoType];

  if (v5 != 0x8000)
  {
    id v7 = [(TUIPredictionViewCell *)self candidate];
    if ([v7 customInfoType] == 0x10000)
    {
      BOOL v8 = [(TUIPredictionViewCell *)self _useFloatingStyle];

      if (v8)
      {
        *(double *)&uint64_t v9 = 48.0;
LABEL_17:
        double v6 = *(double *)&v9;
        goto LABEL_18;
      }
    }
    else
    {
    }
    BOOL v10 = [(TUIPredictionViewCell *)self candidate];
    id v11 = [(TUIPredictionViewCell *)self _displayLabelForCandidate:v10];
    if ([v11 length])
    {
    }
    else
    {
      uint64_t v15 = [(TUIPredictionViewCell *)self image];

      if (v15)
      {
        uint64_t v13 = [(TUIPredictionViewCell *)self image];
        [v13 size];
        double v6 = v16 + 40.0;
        goto LABEL_15;
      }
    }
    uint64_t v12 = [(TUIPredictionViewCell *)self customView];

    if (!v12)
    {
      *(double *)&uint64_t v9 = 120.0;
      goto LABEL_17;
    }
    uint64_t v13 = [(TUIPredictionViewCell *)self customView];
    [v13 intrinsicContentSize];
    double v6 = v14;
LABEL_15:

    goto LABEL_18;
  }
  if ([(TUIPredictionViewCell *)self _usePadStyle]) {
    double v6 = 62.0;
  }
  else {
    double v6 = 48.0;
  }
LABEL_18:
  double v17 = v6;
  double v18 = v3;
  result.height = v18;
  result.width = v17;
  return result;
}

- (void)layoutSubviews
{
  v193.receiver = self;
  v193.super_class = (Class)TUIPredictionViewCell;
  [(TUIPredictionViewCell *)&v193 layoutSubviews];
  [(TUIPredictionViewCell *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  [(TUIPredictionViewCell *)self _usePadStyle];
  [(TUIPredictionViewCell *)self highlightMargin];
  UIRectInsetEdges();
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [(TUIPredictionViewCell *)self currentBackgroundView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  id v20 = [(TUIPredictionViewCell *)self candidate];
  BOOL v21 = [(TUIPredictionViewCell *)self _usesMorphingLabelForCandidate:v20];

  if (!v21)
  {
    [(TUIPredictionViewCell *)self bounds];
    if ([(TUIPredictionViewCell *)self candidateRequiresTruncationForBoundingWidth:v22]|| [(TUIPredictionViewCell *)self isLabelTruncated])
    {
      double v23 = [(TUIPredictionViewCell *)self candidate];
      int v24 = [(TUIPredictionViewCell *)self attributedStringRepresentationOfCandidate:v23];
      v25 = [(TUIPredictionViewCell *)self normalLabel];
      [v25 setAttributedText:v24];
    }
  }
  id v26 = [(TUIPredictionViewCell *)self image];

  if (v26)
  {
    v27 = [(TUIPredictionViewCell *)self maskingScrollView];
    [v27 contentInset];
    double v29 = v28;

    double v30 = 6.0;
    if (v29 != 6.0)
    {
      v31 = [(TUIPredictionViewCell *)self maskingScrollView];
      objc_msgSend(v31, "setContentInset:", 0.0, 6.0, 0.0, 6.0);
    }
  }
  else
  {
    double v30 = 3.0;
  }
  v32 = [(TUIPredictionViewCell *)self candidate];
  [(TUIPredictionViewCell *)self labelTextSizeForCandidate:v32];
  double v34 = v33;

  double v35 = 0.0;
  if (v8 + v30 * -2.0 >= 0.0) {
    double v36 = v8 + v30 * -2.0;
  }
  else {
    double v36 = 0.0;
  }
  v37 = [(TUIPredictionViewCell *)self candidate];
  uint64_t v38 = [(TUIPredictionViewCell *)self labelViewForCandidate:v37];

  double v39 = [(TUIPredictionViewCell *)self imageView];
  [v39 sizeToFit];

  v40 = [(TUIPredictionViewCell *)self candidate];
  uint64_t v41 = [v40 customInfoType];

  uint64_t v189 = v41;
  BOOL v42 = v41 != 0x8000
     && [(TUIPredictionViewCell *)self effectiveUserInterfaceLayoutDirection] == 1;
  v43 = [(TUIPredictionViewCell *)self imageView];
  [v43 frame];
  double Width = CGRectGetWidth(v194);
  double v45 = 6.0;
  if (v34 <= 0.00000011920929) {
    double v45 = 0.0;
  }
  if (v26) {
    double v35 = v45;
  }

  v46 = [(TUIPredictionViewCell *)self image];
  if (v46)
  {
    BOOL v47 = 1;
  }
  else
  {
    v48 = [(TUIPredictionViewCell *)self candidate];
    BOOL v47 = [(TUIPredictionViewCell *)self _isEmojiCandidate:v48];
  }
  double v49 = Width + v35;

  BOOL v50 = 0;
  v51 = (void *)v38;
  if (v34 > 0.00000011920929 && v36 > 0.0)
  {
    if (v34 + v49 + 2.0 <= v36)
    {
      BOOL v50 = 0;
    }
    else
    {
      v52 = [(TUIPredictionViewCell *)self currentTextSuggestion];
      if (v52)
      {
        v53 = [(TUIPredictionViewCell *)self image];
        BOOL v50 = v53 != 0;
      }
      else
      {
        BOOL v50 = 1;
      }
    }
  }
  v54 = [(TUIPredictionViewCell *)self candidate];
  BOOL v55 = [(TUIPredictionViewCell *)self _isSecureCandidate:v54];

  if (v55) {
    double v56 = v36;
  }
  else {
    double v56 = v34;
  }
  if (v47 || v50) {
    double v57 = v56;
  }
  else {
    double v57 = v36;
  }
  v58 = [(TUIPredictionViewCell *)self candidate];
  BOOL v59 = [(TUIPredictionViewCell *)self _isStickerCandidate:v58];

  v60 = [(TUIPredictionViewCell *)self candidate];
  [(TUIPredictionViewCell *)self _isTextEffectsCandidate:v60];

  v61 = [(TUIPredictionViewCell *)self candidate];
  BOOL v62 = [(TUIPredictionViewCell *)self _isWritingToolsCandidate:v61];

  v63 = [(TUIPredictionViewCell *)self candidate];
  BOOL v64 = [(TUIPredictionViewCell *)self _isTextEffectsCandidate:v63];

  if (v64)
  {
    v65 = [(TUIPredictionViewCell *)self animationsLabelView];
    objc_msgSend(v65, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
    double v67 = v66;

    v68 = [(TUIPredictionViewCell *)self currentBackgroundView];
    [v68 bounds];
    double v70 = v67 - v69;

    v71 = [(TUIPredictionViewCell *)self currentBackgroundView];
    [v71 frame];
    v73 = v51;
    objc_msgSend(v51, "setFrame:", 0.0, v72 - fmax(v70, 0.0) + -3.0, v57, v67);
  }
  else
  {
    double v74 = 0.0;
    if (![(TUIPredictionViewCell *)self _usePadStyle] && (!v55 || v59) && !v62)
    {
      v75 = [(TUIPredictionViewCell *)self currentBackgroundView];
      [v75 frame];
      double v74 = v76 * 0.5;
    }
    v73 = v51;
    if (![(TUIPredictionViewCell *)self _usePadStyle] && v62)
    {
      [(TUIPredictionViewCell *)self highlightMargin];
      double v74 = v74 + v77 * 0.5;
    }
    objc_msgSend(v51, "setFrame:", 0.0, v74, v57, v10);
  }
  double v78 = -0.0;
  if (v50 && v26 != 0) {
    double v78 = 6.0;
  }
  double v79 = v49 + v78;
  [v73 frame];
  double MaxX = CGRectGetMaxX(v195);
  v190[0] = MEMORY[0x1E4F143A8];
  v190[1] = 3221225472;
  v190[2] = __39__TUIPredictionViewCell_layoutSubviews__block_invoke;
  v190[3] = &unk_1E5593D90;
  v190[4] = self;
  BOOL v191 = v42;
  BOOL v192 = v50;
  *(double *)&v190[5] = v79;
  *(double *)&v190[6] = v4;
  *(double *)&v190[7] = v6;
  *(double *)&v190[8] = v8;
  *(double *)&v190[9] = v10;
  *(double *)&v190[10] = MaxX;
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v190];
  v81 = [(TUIPredictionViewCell *)self maskingScrollView];
  objc_msgSend(v81, "setContentSize:", MaxX, v10);

  v82 = [(TUIPredictionViewCell *)self maskingScrollView];
  [v82 setScrollEnabled:v50];

  if (v50)
  {
    v83 = [(TUIPredictionViewCell *)self maskingScrollView];
    [v83 frame];
    double v85 = v84;
    double v87 = v86;
    double v89 = v88;
    double v91 = v90;
    v92 = [(TUIPredictionViewCell *)self maskingScrollView];
    [v92 contentInset];
    double v94 = v85 + v93;
    double v96 = v87 + v95;
    double v98 = v89 - (v93 + v97);
    double v100 = v91 - (v95 + v99);

    if ([(TUIPredictionViewCell *)self _isSmartReplyCandidate:self->_candidate])
    {
      v101 = [(TUIPredictionViewCell *)self maskingScrollView];
      [v101 contentOffset];
      double v103 = v102;

      if (v103 == 0.0)
      {
LABEL_61:
        v131 = [(TUIPredictionViewCell *)self morphingLabel];
        objc_msgSend(v131, "setVisibleRect:", v94, v96, v98, v100);
        goto LABEL_62;
      }
      v104 = [(TUIPredictionViewCell *)self maskingScrollView];
      objc_msgSend(v104, "setContentOffset:animated:", 0, 0.0, 0.0);
    }
    else
    {
      double v132 = 0.0;
      if (!v42)
      {
        v196.origin.double x = v94;
        v196.origin.double y = v96;
        v196.size.width = v98;
        v196.size.double height = v100;
        double v132 = ceil(MaxX - CGRectGetWidth(v196));
      }
      v104 = [(TUIPredictionViewCell *)self maskingScrollView];
      objc_msgSend(v104, "scrollRectToVisible:animated:", 0, v132, v96, v98, v100);
      double v94 = v132;
    }

    goto LABEL_61;
  }
  v105 = [(TUIPredictionViewCell *)self morphingLabel];
  objc_msgSend(v105, "setVisibleRect:", v4, v6, v8, v10);

  v106 = [(TUIPredictionViewCell *)self lightEffectsContainer];
  [v106 frame];
  UIRectCenteredXInRect();
  double v108 = v107;
  double v110 = v109;
  double v112 = v111;
  double v114 = v113;
  v115 = [(TUIPredictionViewCell *)self lightEffectsContainer];
  objc_msgSend(v115, "setFrame:", v108, v110, v112, v114);

  if (v26)
  {
    v116 = [(TUIPredictionViewCell *)self lightEffectsContainer];
    [v116 frame];
    double v118 = v117;
    double v120 = v119;
    double v122 = v121;
    double v124 = v123;

    double v125 = 0.5;
    if (v42) {
      double v125 = -0.5;
    }
    double v126 = v125 * v49 + v118;
    v127 = [(TUIPredictionViewCell *)self lightEffectsContainer];
    objc_msgSend(v127, "setFrame:", v126, v120, v122, v124);
  }
  v128 = [(TUIPredictionViewCell *)self maskingScrollView];
  [v128 contentOffset];
  double v130 = v129;

  if (v130 != 0.0)
  {
    v131 = [(TUIPredictionViewCell *)self maskingScrollView];
    objc_msgSend(v131, "setContentOffset:animated:", 0, 0.0, 0.0);
LABEL_62:
  }
  v133 = [(TUIPredictionViewCell *)self imageView];
  [v133 frame];

  v134 = [(TUIPredictionViewCell *)self maskingScrollView];
  [v134 frame];

  v135 = [(TUIPredictionViewCell *)self lightEffectsContainer];
  [v135 frame];

  if (v42 && v50) {
    [(TUIPredictionViewCell *)self bounds];
  }
  [(TUIPredictionViewCell *)self bounds];
  UIRectCenteredYInRect();
  double x = v136;
  double y = v138;
  double v141 = v140;
  double height = v142;
  if (![(TUIPredictionViewCell *)self _usePadStyle] && v62)
  {
    [(TUIPredictionViewCell *)self highlightMargin];
    CGFloat v145 = v144 * 0.5;
    v197.origin.double x = x;
    v197.origin.double y = y;
    v197.size.width = v141;
    v197.size.double height = height;
    CGRect v198 = CGRectOffset(v197, 0.0, v145);
    double x = v198.origin.x;
    double y = v198.origin.y;
    double v141 = v198.size.width;
    double height = v198.size.height;
  }
  if (v189 == 0x8000)
  {
    v199.origin.double x = x;
    v199.origin.double y = y;
    v199.size.width = v141;
    v199.size.double height = height;
    CGRect v200 = CGRectOffset(v199, 0.0, 3.0);
    double x = v200.origin.x;
    double y = v200.origin.y;
    double v141 = v200.size.width;
    double height = v200.size.height;
  }
  v146 = [(TUIPredictionViewCell *)self imageView];
  objc_msgSend(v146, "setFrame:", x, y, v141, height);

  v147 = [MEMORY[0x1E4FB19A8] preferredFontWithSize:17.0];
  v148 = [(TUIPredictionViewCell *)self animationsLabelView];
  [v148 bounds];
  double v150 = v149;
  [v147 lineHeight];
  double v152 = (v150 - v151) * 0.5;
  v153 = [(TUIPredictionViewCell *)self animationsLabelView];
  objc_msgSend(v153, "setTextContainerInset:", v152, 0.0, 0.0, 0.0);

  if ([(id)objc_opt_class() _useSeparatorViews])
  {
    [(TUIPredictionViewCell *)self bounds];
    double v155 = v154;
    double v157 = v156;
    char v158 = [(TUIPredictionViewCell *)self visibleSeparatorEdges];
    v159 = [(TUIPredictionViewCell *)self leftSeparatorView];
    v160 = v159;
    if ((v158 & 2) != 0)
    {
      [v159 setHidden:0];

      [(TUIPredictionViewCell *)self separatorMargin];
      double v162 = v161;
      BOOL v163 = [(TUIPredictionViewCell *)self _usePadStyle];
      double v164 = 0.0;
      if (!v163)
      {
        [(TUIPredictionViewCell *)self highlightMargin];
        double v164 = v165 * 0.5;
      }
      double v166 = v162 + v164;
      [(TUIPredictionViewCell *)self separatorMargin];
      double v168 = v157 + v167 * -2.0;
      v169 = [(TUIPredictionViewCell *)self leftSeparatorView];
      objc_msgSend(v169, "setFrame:", 0.0, v166, 1.0, v168);

      double v170 = *(double *)&kTUISeparatorCornerRadius;
      v160 = [(TUIPredictionViewCell *)self leftSeparatorView];
      [v160 _setCornerRadius:v170];
    }
    else
    {
      [v159 setHidden:1];
    }

    char v171 = [(TUIPredictionViewCell *)self visibleSeparatorEdges];
    v172 = [(TUIPredictionViewCell *)self rightSeparatorView];
    v173 = v172;
    if ((v171 & 8) != 0)
    {
      [v172 setHidden:0];

      double v174 = v155 + -1.0;
      [(TUIPredictionViewCell *)self separatorMargin];
      double v176 = v175;
      BOOL v177 = [(TUIPredictionViewCell *)self _usePadStyle];
      double v178 = 0.0;
      if (!v177)
      {
        [(TUIPredictionViewCell *)self highlightMargin];
        double v178 = v179 * 0.5;
      }
      double v180 = v176 + v178;
      [(TUIPredictionViewCell *)self separatorMargin];
      double v182 = v157 + v181 * -2.0;
      v183 = [(TUIPredictionViewCell *)self rightSeparatorView];
      objc_msgSend(v183, "setFrame:", v174, v180, 1.0, v182);

      double v184 = *(double *)&kTUISeparatorCornerRadius;
      v173 = [(TUIPredictionViewCell *)self rightSeparatorView];
      [v173 _setCornerRadius:v184];
    }
    else
    {
      [v172 setHidden:1];
    }

    int64_t v185 = ((int64_t)([(TUIPredictionViewCell *)self roundedHighlightEdges] << 62) >> 63) & 5;
    if (([(TUIPredictionViewCell *)self roundedHighlightEdges] & 8) != 0) {
      uint64_t v186 = v185 | 0xA;
    }
    else {
      uint64_t v186 = v185;
    }
    v187 = [(TUIPredictionViewCell *)self currentBackgroundView];
    v188 = [v187 layer];
    [v188 setMaskedCorners:v186];
  }
  [(TUIPredictionViewCell *)self updateTextLabelVibrancyIfNeeded];
}

void __39__TUIPredictionViewCell_layoutSubviews__block_invoke(uint64_t a1)
{
  double v2 = 0.0;
  if (!*(unsigned char *)(a1 + 88)) {
    double v2 = *(double *)(a1 + 40);
  }
  if (*(unsigned char *)(a1 + 89)) {
    double v3 = *(double *)(a1 + 64) - *(double *)(a1 + 40);
  }
  else {
    double v3 = *(double *)(a1 + 80);
  }
  double v4 = *(double *)(a1 + 72);
  double v5 = [*(id *)(a1 + 32) lightEffectsContainer];
  objc_msgSend(v5, "setFrame:", v2, 0.0, v3, v4);

  double v6 = *MEMORY[0x1E4F1DAD8];
  double v7 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  id v13 = [*(id *)(a1 + 32) lightEffectsContainer];
  [v13 frame];
  double v9 = v8;
  double v11 = v10;
  double v12 = [*(id *)(a1 + 32) maskingScrollView];
  objc_msgSend(v12, "setFrame:", v6, v7, v9, v11);
}

- (id)attributedStringRepresentationOfCandidate:(id)a3
{
  id v4 = a3;
  [(TUIPredictionViewCell *)self bounds];
  double v6 = v5 + -6.0;
  double v7 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1EDC653C0 attributes:0];
  double v8 = [(TUIPredictionViewCell *)self currentTextSuggestion];
  double v9 = [v8 headerText];

  uint64_t v10 = [v9 length];
  if (v10)
  {
    double v11 = [(TUIPredictionViewCell *)self headerTextAttributes];
    if ([(TUIPredictionViewCell *)self candidateRequiresTruncationForBoundingWidth:v6])
    {
      uint64_t v12 = [(TUIPredictionViewCell *)self centerTruncatedStringForString:v9 withAttributes:v11 fittingWidth:v6];

      double v9 = (void *)v12;
    }
    uint64_t v13 = [v9 stringByAppendingString:@"\n"];

    double v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13 attributes:v11];
    [v7 appendAttributedString:v14];

    double v9 = (void *)v13;
  }
  BOOL v15 = v10 != 0;
  double v16 = [(TUIPredictionViewCell *)self _displayLabelForCandidate:v4];
  double v17 = -[TUIPredictionViewCell displayTextAttributesForMultiline:header:shrink:](self, "displayTextAttributesForMultiline:header:shrink:", [v16 containsString:@"\n"], v15, -[TUIPredictionViewCell candidateRequiresShrinkingForBoundingWidth:](self, "candidateRequiresShrinkingForBoundingWidth:", v6));
  if ([(TUIPredictionViewCell *)self candidateRequiresTruncationForBoundingWidth:v6])
  {
    uint64_t v18 = [(TUIPredictionViewCell *)self centerTruncatedStringForString:v16 withAttributes:v17 fittingWidth:v6];

    double v16 = (void *)v18;
  }
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16 attributes:v17];
  [v7 appendAttributedString:v19];

  return v7;
}

- (id)centerTruncatedStringForString:(id)a3 withAttributes:(id)a4 fittingWidth:(double)a5
{
  id v8 = a3;
  objc_msgSend(v8, "tui_centerTruncatedStringWithAttributes:fittingWidth:", a4, a5);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [(TUIPredictionViewCell *)self setLabelTruncated:v9 != v8];
  return v9;
}

- (BOOL)candidateRequiresShrinkingForBoundingWidth:(double)a3
{
  return 0;
}

- (BOOL)candidateRequiresTruncationForBoundingWidth:(double)a3
{
  uint64_t v5 = [(TUIPredictionViewCell *)self currentTextSuggestion];
  if (v5)
  {
    double v6 = (void *)v5;
    double v7 = [(TUIPredictionViewCell *)self currentTextSuggestion];
    id v8 = [v7 headerText];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = [(TUIPredictionViewCell *)self currentTextSuggestion];

      if (v10)
      {
        double v11 = [(TUIPredictionViewCell *)self currentTextSuggestion];
        uint64_t v12 = [v11 headerText];
        uint64_t v13 = [(TUIPredictionViewCell *)self headerTextAttributes];
        [v12 sizeWithAttributes:v13];
        double v15 = v14;
      }
      else
      {
        double v15 = *MEMORY[0x1E4F1DB30];
      }
      double v16 = [(TUIPredictionViewCell *)self candidate];
      double v17 = [v16 label];
      uint64_t v18 = [v17 containsString:@"\n"];

      uint64_t v19 = [(TUIPredictionViewCell *)self candidate];
      id v20 = [v19 label];
      BOOL v21 = [(TUIPredictionViewCell *)self displayTextAttributesForMultiline:v18 header:1 shrink:[(TUIPredictionViewCell *)self candidateRequiresShrinkingForBoundingWidth:a3]];
      [v20 sizeWithAttributes:v21];
      double v23 = v22;

      LOBYTE(v5) = v23 > a3 || v15 > a3;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (CGSize)labelTextSizeForCandidate:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(TUIPredictionViewCell *)self _isSecureCandidate:v4])
  {
    double v5 = *MEMORY[0x1E4FB30D8];
    double v6 = *MEMORY[0x1E4FB30D8];
  }
  else
  {
    if ([(TUIPredictionViewCell *)self _usesMorphingLabelForCandidate:v4])
    {
      double v7 = [(TUIPredictionViewCell *)self morphingLabel];
      id v8 = [v7 text];
      uint64_t v19 = *MEMORY[0x1E4FB06F8];
      uint64_t v9 = [(TUIPredictionViewCell *)self morphingLabel];
      uint64_t v10 = [v9 font];
      v20[0] = v10;
      double v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
      [v8 sizeWithAttributes:v11];
      double v5 = v12;
      double v6 = v13;
    }
    else
    {
      if ([(TUIPredictionViewCell *)self _isTextEffectsCandidate:v4]) {
        [(TUIPredictionViewCell *)self animationsLabelView];
      }
      else {
      double v7 = [(TUIPredictionViewCell *)self normalLabel];
      }
      double v14 = [v7 attributedText];
      [v14 size];
      double v5 = v15;
      double v6 = v16;
    }
  }

  double v17 = v5;
  double v18 = v6;
  result.double height = v18;
  result.width = v17;
  return result;
}

- (id)headerTextAttributes
{
  v12[2] = *MEMORY[0x1E4F143B8];
  double v3 = 12.0;
  if ([(TUIPredictionViewCell *)self _usePadStyle]) {
    double v4 = 11.0;
  }
  else {
    double v4 = 12.0;
  }
  if (![(TUIPredictionViewCell *)self _usePadStyle]) {
    double v3 = 14.0;
  }
  BOOL v5 = [(TUIPredictionViewCell *)self useAutofillStyle];
  v11[0] = *MEMORY[0x1E4FB06F8];
  if (v5) {
    double v6 = v3;
  }
  else {
    double v6 = v4;
  }
  double v7 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v6];
  v12[0] = v7;
  v11[1] = *MEMORY[0x1E4FB0700];
  id v8 = [(TUIPredictionViewCell *)self textColor];
  v12[1] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  return v9;
}

- (id)displayTextAttributesForMultiline:(BOOL)a3 header:(BOOL)a4 shrink:(BOOL)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  if (![(TUIPredictionViewCell *)self useWritingToolsStyle]
    || (v9 = [(TUIPredictionViewCell *)self _usePadStyle], double v8 = 17.0, !v9))
  {
    if (a3 || (v10 = [(TUIPredictionViewCell *)self _usePadStyle], double v8 = 16.0, v10)) {
      double v8 = 14.0;
    }
  }
  double v11 = [MEMORY[0x1E4FB08E0] systemFontOfSize:v8];
  if (!a3 && !a4)
  {
    double v12 = [MEMORY[0x1E4FB17A8] defaultMetrics];
    uint64_t v13 = [v12 scaledFontForFont:v11];

    double v11 = (void *)v13;
  }
  double v14 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v15 = *MEMORY[0x1E4FB06F8];
  v22[0] = v11;
  uint64_t v16 = *MEMORY[0x1E4FB0700];
  v21[0] = v15;
  v21[1] = v16;
  double v17 = [(TUIPredictionViewCell *)self textColor];
  v22[1] = v17;
  double v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  uint64_t v19 = [v14 dictionaryWithDictionary:v18];

  return v19;
}

- (BOOL)useWritingToolsStyle
{
  double v2 = self;
  double v3 = [(TUIPredictionViewCell *)self candidate];
  LOBYTE(v2) = [(TUIPredictionViewCell *)v2 _isWritingToolsCandidate:v3];

  return (char)v2;
}

- (BOOL)useAutofillStyle
{
  double v3 = [(TUIPredictionViewCell *)self candidate];
  uint64_t v4 = [v3 customInfoType] & 0x18;
  BOOL v5 = v4 != 0;

  double v6 = [(TUIPredictionViewCell *)self currentTextSuggestion];

  if (v6)
  {
    double v7 = [(TUIPredictionViewCell *)self currentTextSuggestion];
    char v8 = [v7 displayStylePlain];
    if (v4) {
      BOOL v5 = 1;
    }
    else {
      BOOL v5 = v8;
    }
  }
  return v5;
}

- (id)currentTextSuggestion
{
  double v3 = [(TUIPredictionViewCell *)self candidate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    BOOL v5 = [(TUIPredictionViewCell *)self candidate];
    double v6 = [v5 textSuggestion];
  }
  else
  {
    double v6 = 0;
  }
  return v6;
}

- (id)labelViewForCandidate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(TUIPredictionViewCell *)self normalLabel];
  if ([(TUIPredictionViewCell *)self _isSecureCandidate:v4])
  {
    uint64_t v6 = [(TUIPredictionViewCell *)self secureCandidateLabel];
  }
  else if ([(TUIPredictionViewCell *)self _isTextEffectsCandidate:v4])
  {
    uint64_t v6 = [(TUIPredictionViewCell *)self animationsLabelView];
  }
  else
  {
    if (![(TUIPredictionViewCell *)self _usesMorphingLabelForCandidate:v4]) {
      goto LABEL_8;
    }
    uint64_t v6 = [(TUIPredictionViewCell *)self morphingLabel];
  }
  double v7 = (void *)v6;

  BOOL v5 = v7;
LABEL_8:

  return v5;
}

- (id)_displayLabelForCandidate:(id)a3
{
  id v4 = a3;
  [(TUIPredictionViewCell *)self contentHuggingPriorityForAxis:0];
  if (v5 != 1000.0 && [v4 customInfoType] == 32)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringInDeviceLanguageForKey:@"Passwords"];
LABEL_9:
    uint64_t v13 = (__CFString *)v7;
    goto LABEL_11;
  }
  if ([v4 candidateProperty] == 1
    && [(TUIPredictionViewCell *)self shouldUseRTLForMathEquations])
  {
    char v8 = [v4 candidate];
    BOOL v9 = [v8 componentsSeparatedByString:@"="];
    uint64_t v6 = [v9 objectAtIndex:0];

    BOOL v10 = [v4 candidate];
    double v11 = [v10 componentsSeparatedByString:@"="];
    double v12 = [v11 objectAtIndex:1];

    [NSString stringWithFormat:@"%@%@%@", v12, @"=", v6];
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  uint64_t v6 = [v4 label];
  if ([v6 length])
  {
    uint64_t v7 = [v4 label];
    goto LABEL_9;
  }
  uint64_t v13 = &stru_1EDC653C0;
LABEL_11:

  return v13;
}

- (BOOL)shouldUseRTLForMathEquations
{
  double v2 = [MEMORY[0x1E4FB1910] sharedInputModeController];
  double v3 = [v2 currentInputMode];
  id v4 = [v3 primaryLanguage];
  char v5 = [v4 isEqual:@"ar"];

  return v5;
}

- (BOOL)_isWritingToolsCandidate:(id)a3
{
  return ((unint64_t)[a3 customInfoType] >> 16) & 1;
}

- (BOOL)_isSmartReplyCandidate:(id)a3
{
  id v3 = a3;
  if (([v3 candidateProperty] & 2) != 0)
  {
    char v5 = [v3 candidate];
    int v4 = [v5 _containsEmoji] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (BOOL)_isTextEffectsCandidate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) != 0 && [v3 candidateProperty] == 4;

  return v4;
}

- (BOOL)_isStickerCandidate:(id)a3
{
  return [a3 customInfoType] == 4096;
}

- (BOOL)_isEmojiCandidate:(id)a3
{
  id v3 = [a3 label];
  char v4 = [v3 _containsEmojiOnly];

  return v4;
}

- (BOOL)_isSecureCandidate:(id)a3
{
  return [a3 slotID] != 0;
}

- (BOOL)_usesMorphingLabelForCandidate:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) == 0
    || [v4 customInfoType] == 32
    || [v4 customInfoType] == 0x8000
    || [v4 candidateProperty] == 8;
  BOOL v6 = v5 & ~[(TUIPredictionViewCell *)self _isTextEffectsCandidate:v4];

  return v6;
}

- (id)_preferredBackgroundColor
{
  id v3 = [MEMORY[0x1E4FB1618] clearColor];
  id v4 = [(TUIPredictionViewCell *)self preferredBackgroundColor];

  if (v4)
  {
    uint64_t v5 = [(TUIPredictionViewCell *)self preferredBackgroundColor];

    id v3 = (void *)v5;
  }
  return v3;
}

- (id)_preferredTextColorForHighlighted:(BOOL)a3 useDarkStyle:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] blackColor];
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v8 = [MEMORY[0x1E4FB1618] whiteColor];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.9];
    if (!v4) {
      goto LABEL_7;
    }
    uint64_t v8 = [MEMORY[0x1E4FB1618] colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.9];
  }
  BOOL v9 = (void *)v8;

  uint64_t v7 = v9;
LABEL_7:
  BOOL v10 = [(TUIPredictionViewCell *)self preferredForegroundColor];

  if (v10)
  {
    double v11 = [(TUIPredictionViewCell *)self preferredForegroundColor];
    [v11 alphaComponent];
    double v13 = v12;

    double v14 = [(TUIPredictionViewCell *)self preferredForegroundColor];
    uint64_t v15 = v14;
    if (!a3)
    {
      uint64_t v16 = [v14 colorWithAlphaComponent:v13 * 0.9];

      uint64_t v7 = v15;
      uint64_t v15 = (void *)v16;
    }

    uint64_t v7 = v15;
  }
  return v7;
}

- (id)_preferredTextColorForRenderConfig:(id)a3 highlighted:(BOOL)a4
{
  id v6 = a3;
  if ([(TUIPredictionViewCell *)self _renderConfigUsesDarkStyle:v6]) {
    [MEMORY[0x1E4FB1618] whiteColor];
  }
  else {
  uint64_t v7 = [MEMORY[0x1E4FB1618] blackColor];
  }
  char v8 = [v6 animatedBackground];

  if ((v8 & 1) == 0)
  {
    BOOL v9 = [(TUIPredictionViewCell *)self preferredForegroundColor];

    if (v9)
    {
      uint64_t v10 = [(TUIPredictionViewCell *)self preferredForegroundColor];

      uint64_t v7 = (void *)v10;
    }
    [v7 alphaComponent];
    if (!a4)
    {
      uint64_t v12 = [v7 colorWithAlphaComponent:v11 * 0.9];

      uint64_t v7 = (void *)v12;
    }
  }
  return v7;
}

- (BOOL)_useFloatingStyle
{
  return [MEMORY[0x1E4FB1900] isFloating];
}

- (BOOL)_usePadStyle
{
  double v2 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    return [MEMORY[0x1E4FB1900] isFloating] ^ 1;
  }
  else {
    return 0;
  }
}

- (TUIPredictionViewCell)initWithFrame:(CGRect)a3
{
  v67.receiver = self;
  v67.super_class = (Class)TUIPredictionViewCell;
  uint64_t v3 = -[TUIPredictionViewCell initWithFrame:](&v67, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v5 = *MEMORY[0x1E4F1DB28];
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    BOOL v9 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], v6, v7, v8);
    [(TUIPredictionViewCell *)v3 setBackgroundView:v9];

    uint64_t v10 = [(TUIPredictionViewCell *)v3 backgroundView];
    double v11 = [v10 layer];
    [v11 setCornerRadius:5.0];

    uint64_t v12 = [(TUIPredictionViewCell *)v3 backgroundView];
    double v13 = [v12 layer];
    [v13 setMasksToBounds:1];

    double v14 = [(TUIPredictionViewCell *)v3 backgroundView];
    [(TUIPredictionViewCell *)v3 addSubview:v14];

    if ([(id)objc_opt_class() _useSeparatorViews])
    {
      uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
      [(TUIPredictionViewCell *)v3 setLeftSeparatorView:v15];

      uint64_t v16 = [(TUIPredictionViewCell *)v3 leftSeparatorView];
      [(TUIPredictionViewCell *)v3 addSubview:v16];

      double v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
      [(TUIPredictionViewCell *)v3 setRightSeparatorView:v17];

      double v18 = [(TUIPredictionViewCell *)v3 rightSeparatorView];
      [(TUIPredictionViewCell *)v3 addSubview:v18];
    }
    uint64_t v19 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1BE0]), "initWithFrame:", v5, v6, v7, v8);
    [(TUIPredictionViewCell *)v3 setMaskingScrollView:v19];

    id v20 = [(TUIPredictionViewCell *)v3 maskingScrollView];
    [v20 setDelegate:v3];

    BOOL v21 = [(TUIPredictionViewCell *)v3 maskingScrollView];
    [v21 setShowsHorizontalScrollIndicator:0];

    double v22 = [(TUIPredictionViewCell *)v3 maskingScrollView];
    [v22 setShowsVerticalScrollIndicator:0];

    double v23 = [(TUIPredictionViewCell *)v3 maskingScrollView];
    objc_msgSend(v23, "setContentInset:", 0.0, 3.0, 0.0, 3.0);

    int v24 = -[TUIGradientView initWithFrame:]([TUIGradientView alloc], "initWithFrame:", v5, v6, v7, v8);
    [(TUIPredictionViewCell *)v3 setLightEffectsContainer:v24];

    v25 = [(TUIPredictionViewCell *)v3 lightEffectsContainer];
    [(TUIPredictionViewCell *)v3 addSubview:v25];

    id v26 = [(TUIPredictionViewCell *)v3 lightEffectsContainer];
    v27 = [(TUIPredictionViewCell *)v3 maskingScrollView];
    [v26 addSubview:v27];

    double v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB19A8]), "initWithFrame:", v5, v6, v7, v8);
    [(TUIPredictionViewCell *)v3 setMorphingLabel:v28];

    double v29 = [(TUIPredictionViewCell *)v3 morphingLabel];
    [v29 setOpaque:0];

    double v30 = [(TUIPredictionViewCell *)v3 morphingLabel];
    [v30 setTextAlignment:1];

    v31 = [(TUIPredictionViewCell *)v3 maskingScrollView];
    v32 = [(TUIPredictionViewCell *)v3 morphingLabel];
    [v31 addSubview:v32];

    double v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1930]), "initWithFrame:", v5, v6, v7, v8);
    [(TUIPredictionViewCell *)v3 setNormalLabel:v33];

    double v34 = [(TUIPredictionViewCell *)v3 normalLabel];
    [v34 setOpaque:0];

    double v35 = [(TUIPredictionViewCell *)v3 normalLabel];
    [v35 setNumberOfLines:0];

    double v36 = [(TUIPredictionViewCell *)v3 normalLabel];
    [v36 setTextAlignment:1];

    v37 = [(TUIPredictionViewCell *)v3 maskingScrollView];
    uint64_t v38 = [(TUIPredictionViewCell *)v3 normalLabel];
    [v37 addSubview:v38];

    double v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v5, v6, v7, v8);
    [(TUIPredictionViewCell *)v3 setSecureCandidateLabel:v39];

    v40 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v40 scale];
    double v42 = v41;
    v43 = [(TUIPredictionViewCell *)v3 secureCandidateLabel];
    v44 = [v43 layer];
    [v44 setContentsScale:v42];

    double v45 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v45 scale];
    double v47 = v46;
    v48 = [(TUIPredictionViewCell *)v3 secureCandidateLabel];
    double v49 = [v48 layer];
    [v49 setRasterizationScale:v47];

    uint64_t v50 = *MEMORY[0x1E4F3A3C0];
    v51 = [(TUIPredictionViewCell *)v3 secureCandidateLabel];
    v52 = [v51 layer];
    [v52 setContentsGravity:v50];

    v53 = [(TUIPredictionViewCell *)v3 maskingScrollView];
    v54 = [(TUIPredictionViewCell *)v3 secureCandidateLabel];
    [v53 addSubview:v54];

    BOOL v55 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1DD8]), "initReadonlyAndUnselectableWithFrame:textContainer:textLayoutManagerEnabled:", 0, 1, v5, v6, v7, v8);
    [(TUIPredictionViewCell *)v3 setAnimationsLabelView:v55];

    double v56 = [(TUIPredictionViewCell *)v3 animationsLabelView];
    [v56 setUserInteractionEnabled:0];

    double v57 = [(TUIPredictionViewCell *)v3 animationsLabelView];
    [v57 setAllowsTextAnimations:1];

    v58 = [MEMORY[0x1E4FB1618] clearColor];
    BOOL v59 = [(TUIPredictionViewCell *)v3 animationsLabelView];
    [v59 setBackgroundColor:v58];

    v60 = [(TUIPredictionViewCell *)v3 animationsLabelView];
    [v60 setTextAlignment:1];

    v61 = [(TUIPredictionViewCell *)v3 animationsLabelView];
    [v61 setScrollEnabled:0];

    BOOL v62 = [(TUIPredictionViewCell *)v3 animationsLabelView];
    v63 = [v62 textLayoutManager];
    [v63 setRequiresCTLineRef:1];

    BOOL v64 = [(TUIPredictionViewCell *)v3 maskingScrollView];
    v65 = [(TUIPredictionViewCell *)v3 animationsLabelView];
    [v64 addSubview:v65];

    [(TUIPredictionViewCell *)v3 _updateColorsForRenderConfig:0 highlighted:0];
  }
  return v3;
}

+ (BOOL)_useSeparatorViews
{
  return 1;
}

+ (id)cellHighlightColorForRenderConfig:(id)a3
{
  id v3 = a3;
  if ([v3 animatedBackground])
  {
    if ([v3 lightKeyboard]) {
      [MEMORY[0x1E4FB1618] whiteColor];
    }
    else {
    uint64_t v4 = [MEMORY[0x1E4FB1618] blackColor];
    }
  }
  else
  {
    uint64_t v4 = objc_msgSend((id)objc_opt_class(), "cellHighlightColorForDarkStyle:", objc_msgSend(v3, "lightKeyboard") ^ 1);
  }
  double v5 = (void *)v4;

  return v5;
}

+ (id)cellHighlightColorForDarkStyle:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v4 = UIKeyboardGetLightCandidateHighlightColor();
  if (v3)
  {
    double v5 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      double v7 = 0.337254902;
      double v8 = 0.329411765;
      double v9 = 0.333333333;
      double v10 = 1.0;
    }
    else
    {
      double v7 = 0.450980392;
      double v10 = 1.0;
      double v8 = 0.450980392;
      double v9 = 0.450980392;
    }
    uint64_t v11 = [MEMORY[0x1E4FB1618] colorWithRed:v7 green:v8 blue:v9 alpha:v10];

    uint64_t v4 = (void *)v11;
  }
  return v4;
}

@end