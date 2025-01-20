@interface SBUIFaceIDCameraGlyphView
- (CALayer)maskContainerLayer;
- (CALayer)maskLeftLayer;
- (CALayer)maskRightLayer;
- (CALayer)maskTopLayer;
- (CGAffineTransform)localTransform;
- (MTMaterialView)arrowBackgroundView;
- (SBUIFaceIDCameraGlyphView)initWithFrame:(CGRect)a3;
- (SBUILegibilityLabel)callToActionLabel;
- (UIView)arrowContainer;
- (UIView)localRotationView;
- (_UILegibilitySettings)legibilitySettings;
- (_UILegibilityView)arrowHead;
- (_UILegibilityView)arrowTail;
- (unint64_t)state;
- (void)_fadeComponentsIn:(id)a3 completion:(id)a4;
- (void)_fadeComponentsOut:(id)a3 completion:(id)a4;
- (void)_flyInWithText:(BOOL)a3 delay:(double)a4;
- (void)_installMask;
- (void)_removeAnimations;
- (void)_setAlpha:(double)a3 onComponents:(id)a4 completion:(id)a5;
- (void)_updateCallToActionLabelFont;
- (void)layoutSubviews;
- (void)setArrowBackgroundView:(id)a3;
- (void)setArrowContainer:(id)a3;
- (void)setArrowHead:(id)a3;
- (void)setArrowTail:(id)a3;
- (void)setCallToActionLabel:(id)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLocalRotationView:(id)a3;
- (void)setLocalTransform:(CGAffineTransform *)a3;
- (void)setMaskContainerLayer:(id)a3;
- (void)setMaskLeftLayer:(id)a3;
- (void)setMaskRightLayer:(id)a3;
- (void)setMaskTopLayer:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setState:(unint64_t)a3 delay:(double)a4;
@end

@implementation SBUIFaceIDCameraGlyphView

- (SBUIFaceIDCameraGlyphView)initWithFrame:(CGRect)a3
{
  v57.receiver = self;
  v57.super_class = (Class)SBUIFaceIDCameraGlyphView;
  v3 = -[SBUIFaceIDCameraGlyphView initWithFrame:](&v57, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(SBUIFaceIDCameraGlyphView *)v3 bs_setHitTestingDisabled:1];
    v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 addObserver:v4 selector:sel__updateCallToActionLabelFont name:*MEMORY[0x1E4F43788] object:0];

    id v6 = objc_alloc(MEMORY[0x1E4F42FF0]);
    uint64_t v7 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    arrowContainer = v4->_arrowContainer;
    v4->_arrowContainer = (UIView *)v7;

    [(SBUIFaceIDCameraGlyphView *)v4 addSubview:v4->_arrowContainer];
    uint64_t v9 = [MEMORY[0x1E4F743C8] materialViewWithRecipe:1];
    arrowBackgroundView = v4->_arrowBackgroundView;
    v4->_arrowBackgroundView = (MTMaterialView *)v9;

    [(MTMaterialView *)v4->_arrowBackgroundView _setCornerRadius:15.0];
    [(MTMaterialView *)v4->_arrowBackgroundView setWeighting:1.0];
    [(UIView *)v4->_arrowContainer addSubview:v4->_arrowBackgroundView];
    v11 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    maskTopLayer = v4->_maskTopLayer;
    v4->_maskTopLayer = v11;

    id v13 = [MEMORY[0x1E4F428B8] redColor];
    -[CALayer setBackgroundColor:](v4->_maskTopLayer, "setBackgroundColor:", [v13 CGColor]);

    v14 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    maskLeftLayer = v4->_maskLeftLayer;
    v4->_maskLeftLayer = v14;

    id v16 = [MEMORY[0x1E4F428B8] redColor];
    -[CALayer setBackgroundColor:](v4->_maskLeftLayer, "setBackgroundColor:", [v16 CGColor]);

    v17 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    maskRightLayer = v4->_maskRightLayer;
    v4->_maskRightLayer = v17;

    id v19 = [MEMORY[0x1E4F428B8] redColor];
    -[CALayer setBackgroundColor:](v4->_maskRightLayer, "setBackgroundColor:", [v19 CGColor]);

    v20 = (CALayer *)objc_alloc_init(MEMORY[0x1E4F39BE8]);
    maskContainerLayer = v4->_maskContainerLayer;
    v4->_maskContainerLayer = v20;

    [(CALayer *)v4->_maskContainerLayer addSublayer:v4->_maskTopLayer];
    [(CALayer *)v4->_maskContainerLayer addSublayer:v4->_maskLeftLayer];
    [(CALayer *)v4->_maskContainerLayer addSublayer:v4->_maskRightLayer];
    v22 = (void *)MEMORY[0x1E4F42A80];
    v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v24 = [MEMORY[0x1E4F42D90] mainScreen];
    v25 = [v24 traitCollection];
    v26 = [v22 imageNamed:@"CameraCoveredTail" inBundle:v23 compatibleWithTraitCollection:v25];
    v27 = objc_msgSend(v26, "sbf_imageUsingContextType:", 4);

    id v28 = objc_alloc(MEMORY[0x1E4F43238]);
    v29 = [(SBUIFaceIDCameraGlyphView *)v4 legibilitySettings];
    uint64_t v30 = [v28 initWithSettings:v29 strength:v27 image:0.25];
    arrowTail = v4->_arrowTail;
    v4->_arrowTail = (_UILegibilityView *)v30;

    [(_UILegibilityView *)v4->_arrowTail setContentMode:4];
    [(MTMaterialView *)v4->_arrowBackgroundView addSubview:v4->_arrowTail];
    v32 = (void *)MEMORY[0x1E4F42A80];
    v33 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v34 = [MEMORY[0x1E4F42D90] mainScreen];
    v35 = [v34 traitCollection];
    v36 = [v32 imageNamed:@"CameraCovered" inBundle:v33 compatibleWithTraitCollection:v35];
    v37 = objc_msgSend(v36, "sbf_imageUsingContextType:", 4);

    id v38 = objc_alloc(MEMORY[0x1E4F43238]);
    v39 = [(SBUIFaceIDCameraGlyphView *)v4 legibilitySettings];
    uint64_t v40 = [v38 initWithSettings:v39 strength:v37 image:0.25];
    arrowHead = v4->_arrowHead;
    v4->_arrowHead = (_UILegibilityView *)v40;

    [(_UILegibilityView *)v4->_arrowHead setContentMode:4];
    [(MTMaterialView *)v4->_arrowBackgroundView addSubview:v4->_arrowHead];
    v42 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
    localRotationView = v4->_localRotationView;
    v4->_localRotationView = v42;

    [(SBUIFaceIDCameraGlyphView *)v4 addSubview:v4->_localRotationView];
    v44 = v4->_localRotationView;
    long long v45 = *(_OWORD *)&v4->_localTransform.a;
    long long v46 = *(_OWORD *)&v4->_localTransform.tx;
    v56[1] = *(_OWORD *)&v4->_localTransform.c;
    v56[2] = v46;
    v56[0] = v45;
    [(UIView *)v44 setTransform:v56];
    v47 = [SBUILegibilityLabel alloc];
    v48 = [(SBUIFaceIDCameraGlyphView *)v4 legibilitySettings];
    v49 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v50 = [v49 localizedStringForKey:@"CAMERA_COVERED_CALL_TO_ACTION" value:&stru_1EFCB7578 table:@"SpringBoardUIServices_Late_Fall_2018_iOS"];
    v51 = SBUICurrentPreferredFontForCoachingText();
    uint64_t v52 = [(SBUILegibilityLabel *)v47 initWithSettings:v48 strength:v50 string:v51 font:0.25];
    callToActionLabel = v4->_callToActionLabel;
    v4->_callToActionLabel = (SBUILegibilityLabel *)v52;

    [(SBUILegibilityLabel *)v4->_callToActionLabel setNumberOfLines:3];
    [(UIView *)v4->_localRotationView addSubview:v4->_callToActionLabel];
    v54 = [(MTMaterialView *)v4->_arrowBackgroundView layer];
    [v54 setAllowsGroupOpacity:1];

    [(UIView *)v4->_arrowContainer setAlpha:0.0];
    [(SBUILegibilityLabel *)v4->_callToActionLabel setAlpha:0.0];
    [(SBUIFaceIDCameraGlyphView *)v4 _installMask];
  }
  return v4;
}

- (void)_installMask
{
  maskContainerLayer = self->_maskContainerLayer;
  v4 = [(_UILegibilityView *)self->_arrowHead shadowImageView];
  v5 = [v4 layer];
  id v6 = [v5 mask];

  if (maskContainerLayer != v6)
  {
    uint64_t v7 = [(_UILegibilityView *)self->_arrowHead shadowImageView];
    v8 = [v7 layer];
    [v8 setMask:self->_maskContainerLayer];

    [(SBUIFaceIDCameraGlyphView *)self setNeedsLayout];
  }
}

- (void)setState:(unint64_t)a3
{
}

- (void)setState:(unint64_t)a3 delay:(double)a4
{
  v19[1] = *MEMORY[0x1E4F143B8];
  unint64_t state = self->_state;
  if (state != a3)
  {
    self->_unint64_t state = a3;
    if (state)
    {
      if (a3)
      {
        if (a3 != 1)
        {
          if (a3 != 2) {
            return;
          }
          v19[0] = self->_callToActionLabel;
          id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 1, a4);
          [(SBUIFaceIDCameraGlyphView *)self _fadeComponentsIn:v6 completion:0];
          goto LABEL_13;
        }
        callToActionLabel = self->_callToActionLabel;
        id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &callToActionLabel, 1, a4);
        v10 = self;
        v11 = v6;
        uint64_t v9 = 0;
      }
      else
      {
        arrowContainer = self->_arrowContainer;
        v17[0] = self->_callToActionLabel;
        v17[1] = arrowContainer;
        id v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 2, a4);
        uint64_t v12 = MEMORY[0x1E4F143A8];
        uint64_t v13 = 3221225472;
        v14 = __44__SBUIFaceIDCameraGlyphView_setState_delay___block_invoke;
        v15 = &unk_1E5CCC6E8;
        id v16 = self;
        uint64_t v9 = &v12;
        v10 = self;
        v11 = v6;
      }
      -[SBUIFaceIDCameraGlyphView _fadeComponentsOut:completion:](v10, "_fadeComponentsOut:completion:", v11, v9, v12, v13, v14, v15, v16);
LABEL_13:

      return;
    }
    BOOL v7 = a3 == 2;
    [(SBUIFaceIDCameraGlyphView *)self _flyInWithText:v7 delay:a4];
  }
}

uint64_t __44__SBUIFaceIDCameraGlyphView_setState_delay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeAnimations];
}

- (void)_flyInWithText:(BOOL)a3 delay:(double)a4
{
  unint64_t v6 = 0x1E4F4F000uLL;
  unint64_t v7 = 0x1E4F4F000uLL;
  if (a3)
  {
    v8 = [MEMORY[0x1E4F4F7A8] settingsWithMass:3.0 stiffness:200.0 damping:38.0];
    [v8 setDelay:a4 + 0.045];
    uint64_t v9 = [(SBUIFaceIDCameraGlyphView *)self window];
    uint64_t v10 = [v9 interfaceOrientation];

    double v11 = 300.0;
    if (v10 != 3) {
      double v11 = 0.0;
    }
    if (v10 == 4) {
      double v11 = -300.0;
    }
    callToActionLabel = self->_callToActionLabel;
    CGAffineTransformMakeTranslation(&v38, v11, 0.0);
    [(SBUILegibilityLabel *)callToActionLabel setTransform:&v38];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke;
    v37[3] = &unk_1E5CCC580;
    v37[4] = self;
    [MEMORY[0x1E4F4F898] animateWithSettings:v8 actions:v37];
    uint64_t v13 = (void *)MEMORY[0x1E4F4F680];
    uint64_t v14 = *MEMORY[0x1E4F3A490];
    v15 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A490]];
    id v16 = [v13 settingsWithDuration:v15 delay:0.5 timingFunction:a4 + 0.265];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_2;
    v36[3] = &unk_1E5CCC580;
    v36[4] = self;
    [MEMORY[0x1E4F4F898] animateWithSettings:v16 actions:v36];
    v17 = [MEMORY[0x1E4F39BD8] animation];
    [v17 setDuration:0.7];
    [v17 setRemovedOnCompletion:1];
    [v17 setBeginTime:CACurrentMediaTime() + 0.335 + a4];
    [v17 setValues:&unk_1EFCEB048];
    [v17 setKeyTimes:&unk_1EFCEB060];
    v18 = [(_UILegibilityView *)self->_arrowTail layer];
    [v18 addAnimation:v17 forKey:@"transform.translation.y"];

    unint64_t v7 = 0x1E4F4F000;
    unint64_t v6 = 0x1E4F4F000;
  }
  else
  {
    uint64_t v14 = *MEMORY[0x1E4F3A490];
  }
  id v19 = [*(id *)(v6 + 1960) settingsWithMass:3.0 stiffness:250.0 damping:50.0];
  v20 = v19;
  double v21 = a4 + -0.005;
  if (a4 + -0.005 < 0.0) {
    double v21 = 0.0;
  }
  [v19 setDelay:v21];
  arrowContainer = self->_arrowContainer;
  CGAffineTransformMakeTranslation(&v35, 0.0, 300.0);
  [(UIView *)arrowContainer setTransform:&v35];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_48;
  v34[3] = &unk_1E5CCC580;
  v34[4] = self;
  [MEMORY[0x1E4F4F898] animateWithSettings:v20 actions:v34];
  v23 = *(void **)(v7 + 1664);
  v24 = [MEMORY[0x1E4F39C10] functionWithName:v14];
  v25 = [v23 settingsWithDuration:v24 delay:0.5 timingFunction:a4 + 0.04];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_2_49;
  v33[3] = &unk_1E5CCC580;
  v33[4] = self;
  [MEMORY[0x1E4F4F898] animateWithSettings:v25 actions:v33];
  v26 = [MEMORY[0x1E4F39B48] animation];
  [v26 setDuration:0.75];
  [v26 setBeginTime:CACurrentMediaTime() + 0.7464 + a4];
  [v26 setRemovedOnCompletion:0];
  [v26 setAutoreverses:1];
  LODWORD(v27) = 2139095040;
  [v26 setRepeatCount:v27];
  [v26 setKeyPath:@"transform.translation.y"];
  [v26 setFromValue:&unk_1EFCEAE00];
  [v26 setToValue:&unk_1EFCEAF78];
  LODWORD(v28) = 0.5;
  LODWORD(v29) = 0.5;
  LODWORD(v30) = 1.0;
  v31 = [MEMORY[0x1E4F39C10] functionWithControlPoints:v28 :0.0 :v29 :v30];
  [v26 setTimingFunction:v31];

  v32 = [(_UILegibilityView *)self->_arrowHead layer];
  [v32 addAnimation:v26 forKey:@"transform.translation.y"];
}

uint64_t __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 424);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 424) setAlpha:1.0];
}

uint64_t __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_48(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 416);
  long long v2 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  return [v1 setTransform:v4];
}

uint64_t __50__SBUIFaceIDCameraGlyphView__flyInWithText_delay___block_invoke_2_49(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
}

- (void)_fadeComponentsIn:(id)a3 completion:(id)a4
{
}

- (void)_fadeComponentsOut:(id)a3 completion:(id)a4
{
}

- (void)_setAlpha:(double)a3 onComponents:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.2];
  uint64_t v10 = (void *)MEMORY[0x1E4F4F898];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __63__SBUIFaceIDCameraGlyphView__setAlpha_onComponents_completion___block_invoke;
  v15[3] = &unk_1E5CCC850;
  id v16 = v7;
  double v17 = a3;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__SBUIFaceIDCameraGlyphView__setAlpha_onComponents_completion___block_invoke_2;
  v13[3] = &unk_1E5CCC6C0;
  id v14 = v8;
  id v11 = v8;
  id v12 = v7;
  [v10 animateWithSettings:v9 actions:v15 completion:v13];
}

void __63__SBUIFaceIDCameraGlyphView__setAlpha_onComponents_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setAlpha:", *(double *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

uint64_t __63__SBUIFaceIDCameraGlyphView__setAlpha_onComponents_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_removeAnimations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  arrowTail = self->_arrowTail;
  v15[0] = self->_callToActionLabel;
  v15[1] = arrowTail;
  arrowHead = self->_arrowHead;
  arrowContainer = self->_arrowContainer;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v15[2] = arrowHead;
  v15[3] = arrowContainer;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 4, 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) layer];
        [v10 removeAllAnimations];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v7);
  }
}

- (void)layoutSubviews
{
  v66.receiver = self;
  v66.super_class = (Class)SBUIFaceIDCameraGlyphView;
  [(SBUIFaceIDCameraGlyphView *)&v66 layoutSubviews];
  [(SBUIFaceIDCameraGlyphView *)self bounds];
  double v6 = v5;
  double v8 = v7;
  uint64_t v9 = [(_UILegibilityView *)self->_arrowHead image];
  [v9 size];

  -[UIView setFrame:](self->_arrowContainer, "setFrame:", 0.0, 0.0, 80.0, 80.0);
  -[MTMaterialView setFrame:](self->_arrowBackgroundView, "setFrame:", 0.0, 0.0, 80.0, 80.0);
  uint64_t v10 = SBUIFaceIDCameraOrientationForDevice();
  int v11 = __sb__runningInSpringBoard();
  char v12 = v11;
  if (v11)
  {
    if (SBFEffectiveDeviceClass() != 2 || SBFEffectiveHomeButtonType() != 2) {
      goto LABEL_15;
    }
  }
  else
  {
    id v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v2 userInterfaceIdiom] != 1 || SBFEffectiveHomeButtonType() != 2)
    {
LABEL_14:

      goto LABEL_15;
    }
  }
  int v13 = __sb__runningInSpringBoard();
  char v14 = v13;
  if (v13)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [v3 _referenceBounds];
  }
  BSSizeRoundForScale();
  if ((v14 & 1) == 0) {

  }
  if ((v12 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_15:
  if (v6 >= v8) {
    double v15 = v6;
  }
  else {
    double v15 = v8;
  }
  if (v6 >= v8) {
    double v16 = v8;
  }
  else {
    double v16 = v6;
  }
  if (v10 != 2) {
    double v15 = v16;
  }
  double v62 = v15 * 0.5;
  -[UIView setCenter:](self->_arrowContainer, "setCenter:");
  uint64_t v17 = [(_UILegibilityView *)self->_arrowHead image];
  [v17 size];
  CGFloat v19 = (80.0 - v18) * 0.5;

  [(UIView *)self->_arrowContainer bounds];
  CGRect v68 = CGRectInset(v67, v19, 14.0);
  CGFloat x = v68.origin.x;
  CGFloat y = v68.origin.y;
  CGFloat width = v68.size.width;
  CGFloat height = v68.size.height;
  CGSize v57 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  slice.CGPoint origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  CGPoint origin = slice.origin;
  slice.size = v57;
  remainder.CGPoint origin = slice.origin;
  remainder.size = v57;
  v24 = [(_UILegibilityView *)self->_arrowHead image];
  [v24 size];
  CGFloat v26 = v25;
  v69.origin.CGFloat x = x;
  v69.origin.CGFloat y = y;
  CGFloat v59 = y;
  CGFloat v60 = width;
  v69.size.CGFloat width = width;
  CGFloat recta = height;
  v69.size.CGFloat height = height;
  CGRectDivide(v69, &slice, &remainder, v26, CGRectMinYEdge);

  -[_UILegibilityView setFrame:](self->_arrowHead, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  v63.CGPoint origin = origin;
  v63.size = v57;
  double v27 = [(_UILegibilityView *)self->_arrowTail image];
  [v27 size];
  CGFloat v29 = v28;
  v70.origin.CGFloat x = x;
  v70.origin.CGFloat y = y;
  v70.size.CGFloat width = width;
  v70.size.CGFloat height = height;
  CGRectDivide(v70, &v63, &remainder, v29, CGRectMaxYEdge);

  -[_UILegibilityView setFrame:](self->_arrowTail, "setFrame:", v63.origin.x, v63.origin.y, v63.size.width, v63.size.height);
  double v30 = [(_UILegibilityView *)self->_arrowHead shadowImageView];
  [v30 bounds];
  double v32 = v31;
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;

  -[CALayer setFrame:](self->_maskContainerLayer, "setFrame:", v32, v34, v36, v38);
  double v39 = v38 * 0.5 + slice.size.height * 0.5;
  uint64_t v40 = [(_UILegibilityView *)self->_arrowTail image];
  [v40 size];
  double v42 = (v36 - v41) * 0.5;
  double v43 = v38 - v39;

  v44 = [(_UILegibilityView *)self->_arrowTail image];
  [v44 size];
  double v46 = (v36 + v45) * 0.5;
  v47 = [(_UILegibilityView *)self->_arrowTail image];
  [v47 size];
  double v49 = (v36 - v48) * 0.5;

  -[CALayer setFrame:](self->_maskTopLayer, "setFrame:", 0.0, 0.0, v36, v39);
  -[CALayer setFrame:](self->_maskLeftLayer, "setFrame:", 0.0, v39, v42, v43);
  -[CALayer setFrame:](self->_maskRightLayer, "setFrame:", v46, v39, v49, v43);
  -[SBUILegibilityLabel sizeThatFits:](self->_callToActionLabel, "sizeThatFits:", 165.0, 1.79769313e308);
  double v51 = v50;
  double v53 = v52;
  v71.origin.CGFloat x = 0.0;
  v71.origin.CGFloat y = 0.0;
  v71.size.CGFloat width = v51;
  v71.size.CGFloat height = v53;
  CGFloat v54 = CGRectGetWidth(v71) * 0.5;
  v72.origin.CGFloat x = x;
  v72.origin.CGFloat y = v59;
  v72.size.CGFloat width = v60;
  v72.size.CGFloat height = recta;
  CGFloat v55 = v54 + CGRectGetMaxY(v72) + 20.0;
  -[UIView setBounds:](self->_localRotationView, "setBounds:", 0.0, 0.0, v51, v53);
  -[UIView setCenter:](self->_localRotationView, "setCenter:", v62, v55);
  callToActionLabel = self->_callToActionLabel;
  [(UIView *)self->_localRotationView bounds];
  -[SBUILegibilityLabel setFrame:](callToActionLabel, "setFrame:");
  [(MTMaterialView *)self->_arrowBackgroundView setWeighting:1.0];
}

- (void)setLegibilitySettings:(id)a3
{
  p_legibilitySettings = &self->_legibilitySettings;
  id v6 = a3;
  if ((-[_UILegibilitySettings isEqual:](*p_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    [(_UILegibilityView *)self->_arrowHead updateForChangedSettings:*p_legibilitySettings];
    [(_UILegibilityView *)self->_arrowTail updateForChangedSettings:*p_legibilitySettings];
    [(SBUILegibilityLabel *)self->_callToActionLabel setLegibilitySettings:*p_legibilitySettings];
    [(SBUIFaceIDCameraGlyphView *)self _installMask];
  }
}

- (void)setLocalTransform:(CGAffineTransform *)a3
{
  p_localTransform = &self->_localTransform;
  long long v6 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
  long long v7 = *(_OWORD *)&self->_localTransform.c;
  *(_OWORD *)&v12.a = *(_OWORD *)&self->_localTransform.a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tCGFloat x = *(_OWORD *)&self->_localTransform.tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_localTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_localTransform->tCGFloat x = v9;
    *(_OWORD *)&p_localTransform->a = v8;
    localRotationView = self->_localRotationView;
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&a3->tx;
    [(UIView *)localRotationView setTransform:&t1];
  }
}

- (void)_updateCallToActionLabelFont
{
  SBUICurrentPreferredFontForCoachingText();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(SBUILegibilityLabel *)self->_callToActionLabel setFont:v3];
  [(SBUIFaceIDCameraGlyphView *)self setNeedsLayout];
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (CGAffineTransform)localTransform
{
  long long v3 = *(_OWORD *)&self[10].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[10].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)&self[11].b;
  return self;
}

- (UIView)arrowContainer
{
  return self->_arrowContainer;
}

- (void)setArrowContainer:(id)a3
{
}

- (SBUILegibilityLabel)callToActionLabel
{
  return self->_callToActionLabel;
}

- (void)setCallToActionLabel:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (_UILegibilityView)arrowHead
{
  return self->_arrowHead;
}

- (void)setArrowHead:(id)a3
{
}

- (_UILegibilityView)arrowTail
{
  return self->_arrowTail;
}

- (void)setArrowTail:(id)a3
{
}

- (MTMaterialView)arrowBackgroundView
{
  return self->_arrowBackgroundView;
}

- (void)setArrowBackgroundView:(id)a3
{
}

- (CALayer)maskContainerLayer
{
  return self->_maskContainerLayer;
}

- (void)setMaskContainerLayer:(id)a3
{
}

- (CALayer)maskTopLayer
{
  return self->_maskTopLayer;
}

- (void)setMaskTopLayer:(id)a3
{
}

- (CALayer)maskLeftLayer
{
  return self->_maskLeftLayer;
}

- (void)setMaskLeftLayer:(id)a3
{
}

- (CALayer)maskRightLayer
{
  return self->_maskRightLayer;
}

- (void)setMaskRightLayer:(id)a3
{
}

- (UIView)localRotationView
{
  return self->_localRotationView;
}

- (void)setLocalRotationView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localRotationView, 0);
  objc_storeStrong((id *)&self->_maskRightLayer, 0);
  objc_storeStrong((id *)&self->_maskLeftLayer, 0);
  objc_storeStrong((id *)&self->_maskTopLayer, 0);
  objc_storeStrong((id *)&self->_maskContainerLayer, 0);
  objc_storeStrong((id *)&self->_arrowBackgroundView, 0);
  objc_storeStrong((id *)&self->_arrowTail, 0);
  objc_storeStrong((id *)&self->_arrowHead, 0);
  objc_storeStrong((id *)&self->_callToActionLabel, 0);
  objc_storeStrong((id *)&self->_arrowContainer, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end