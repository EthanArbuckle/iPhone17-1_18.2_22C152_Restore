@interface UIKBLightEffectsBackground
@end

@implementation UIKBLightEffectsBackground

uint64_t __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) addLightSourceViews];
  [*(id *)(a1 + 32) updateAlphaForAnimationStart:1];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_2(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldShowWaveView])
  {
    [*(id *)(a1 + 40) setAlpha:0.0];
    [*(id *)(a1 + 48) setConstant:-480.0 / *(double *)(a1 + 72)];
  }
  [*(id *)(a1 + 32) animatedTransitionToRenderConfig:*(void *)(a1 + 56)];
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);
  return [v3 layoutIfNeeded];
}

void __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) shouldShowWaveView])
  {
    if (_AXSEnhanceBackgroundContrastEnabled()) {
      uint64_t v2 = 2;
    }
    else {
      uint64_t v2 = 546;
    }
  }
  else
  {
    uint64_t v2 = 2;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_4;
  v7[3] = &unk_1E52DA040;
  id v8 = *(id *)(a1 + 48);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_5;
  v4[3] = &unk_1E52F0BC0;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  id v6 = *(id *)(a1 + 56);
  +[UIView _animateUsingSpringWithDuration:v2 delay:v7 options:v4 mass:1.6 stiffness:0.0 damping:1.0 initialVelocity:13.853 animations:7.444 completion:0.0];
}

uint64_t __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_4(uint64_t a1)
{
  CAFrameRateRange v5 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  uint64_t v2 = *(void *)(a1 + 32);
  return +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048619, v2, *(double *)&v5.minimum, *(double *)&v5.maximum, *(double *)&v5.preferred);
}

uint64_t __111___UIKBLightEffectsBackground_performTransitionToRenderConfig_fromRenderConfig_alongsideAnimations_completion___block_invoke_5(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  v3 = [v2 _inheritedRenderConfig];
  [v2 completeTransitionToRenderConfig:v3];

  v4 = (void *)a1[5];
  if (v4) {
    [v4 removeFromSuperview];
  }
  uint64_t result = a1[6];
  if (result)
  {
    id v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

void __49___UIKBLightEffectsBackground_showShadowEffects___block_invoke(uint64_t a1)
{
  v69[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [UIVisualEffectView alloc];
  v3 = +[UIBlurEffect effectWithStyle:8];
  v4 = [(UIVisualEffectView *)v2 initWithEffect:v3];

  [(UIView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  CAFrameRateRange v5 = +[UIColor systemBackgroundColor];
  [(UIView *)v4 setBackgroundColor:v5];

  [(UIVisualEffectView *)v4 _setContinuousCornerRadius:25.0];
  id v6 = +[UIColor whiteColor];
  id v7 = [v6 colorWithAlphaComponent:0.3];
  uint64_t v8 = [v7 CGColor];
  v9 = [(UIView *)v4 layer];
  [v9 setBorderColor:v8];

  v10 = [(UIView *)v4 layer];
  [v10 setBorderWidth:4.0];

  v11 = [(UIView *)v4 layer];
  [v11 setCornerRadius:25.0];

  uint64_t v12 = *MEMORY[0x1E4F39EA8];
  v13 = [(UIView *)v4 layer];
  [v13 setCornerCurve:v12];

  v14 = [(UIView *)v4 layer];
  [v14 setAllowsGroupOpacity:0];

  v15 = [(UIView *)v4 layer];
  [v15 setAllowsGroupBlending:0];

  v16 = [(UIView *)v4 layer];
  [v16 setAllowsEdgeAntialiasing:0];

  v17 = [_UIIntelligenceEdgeLightEffect alloc];
  v18 = +[_UIIntelligenceLightSourceDescriptor sharedShimmeringLight];
  v67 = [(_UIIntelligenceEdgeLightEffect *)v17 initWithLightSource:v18 radius:1 region:8.0];

  v69[0] = v67;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
  [(UIVisualEffectView *)v4 setBackgroundEffects:v19];

  v20 = objc_alloc_init(UIView);
  [(UIView *)v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = +[UIColor systemBackgroundColor];
  [(UIView *)v20 setBackgroundColor:v21];

  v22 = [(UIView *)v20 layer];
  [v22 setAllowsGroupOpacity:0];

  v23 = [(UIView *)v20 layer];
  [v23 setAllowsGroupBlending:0];

  v24 = [(UIView *)v20 layer];
  [v24 setAllowsEdgeAntialiasing:0];

  v25 = [(UIView *)v20 layer];
  [v25 setCornerRadius:25.0];

  v26 = [(UIView *)v20 layer];
  [v26 setCornerCurve:v12];

  v27 = [(UIView *)v20 layer];
  [v27 setShadowPathIsBounds:1];

  v28 = +[UIColor blackColor];
  id v29 = [v28 colorWithAlphaComponent:0.5];
  uint64_t v30 = [v29 CGColor];
  v31 = [(UIView *)v20 layer];
  [v31 setShadowColor:v30];

  v32 = [(UIView *)v20 layer];
  [v32 setShadowRadius:11.0];

  v33 = [(UIView *)v20 layer];
  LODWORD(v34) = 1053609165;
  [v33 setShadowOpacity:v34];

  v35 = [(UIView *)v20 layer];
  objc_msgSend(v35, "setShadowOffset:", 0.0, 8.0);

  v36 = [*(id *)(a1 + 32) backdropClippingView];
  [v36 addSubview:v20];

  v37 = [*(id *)(a1 + 32) backdropClippingView];
  [v37 addSubview:v4];

  v55 = (void *)MEMORY[0x1E4F5B268];
  v66 = [*(id *)(a1 + 32) fullBackdropLayoutGuide];
  v65 = [v66 topAnchor];
  v64 = [(UIView *)v4 bottomAnchor];
  v63 = [v65 constraintEqualToAnchor:v64 constant:0.0];
  v68[0] = v63;
  v60 = [(UIView *)v4 leadingAnchor];
  uint64_t v62 = a1;
  v61 = [*(id *)(a1 + 32) backdropClippingView];
  v59 = [v61 leadingAnchor];
  v58 = [v60 constraintEqualToSystemSpacingAfterAnchor:v59 multiplier:1.0];
  v68[1] = v58;
  v57 = [*(id *)(a1 + 32) backdropClippingView];
  v56 = [v57 trailingAnchor];
  v54 = [(UIView *)v4 trailingAnchor];
  v53 = [v56 constraintEqualToSystemSpacingAfterAnchor:v54 multiplier:1.0];
  v68[2] = v53;
  v52 = [(UIView *)v4 heightAnchor];
  v51 = [v52 constraintEqualToConstant:50.0];
  v68[3] = v51;
  v50 = [(UIView *)v20 leadingAnchor];
  v49 = [(UIView *)v4 leadingAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v68[4] = v48;
  v47 = [(UIView *)v4 trailingAnchor];
  v46 = [(UIView *)v20 trailingAnchor];
  v38 = [v47 constraintEqualToAnchor:v46];
  v68[5] = v38;
  v39 = [(UIView *)v4 bottomAnchor];
  v40 = [(UIView *)v20 bottomAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v68[6] = v41;
  v42 = [(UIView *)v20 heightAnchor];
  v43 = [(UIView *)v4 heightAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v68[7] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:8];
  [v55 activateConstraints:v45];

  [*(id *)(v62 + 32) layoutIfNeeded];
  [*(id *)(v62 + 32) setMirroredLightBorderView:v4];
  [*(id *)(v62 + 32) setMirroredShadowView:v20];
}

@end