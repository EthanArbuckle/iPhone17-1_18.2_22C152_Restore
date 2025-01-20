@interface SHListeningLayer
- (BOOL)shouldPerformIntroAnimation;
- (CALayer)autoShadowContainerLayer;
- (CALayer)innerCirclesContainerLayer;
- (CALayer)innerCirclesSecondaryContainerLayer;
- (SHInnerCircleMaskLayer)autoShadowToShazamButtonMaskLayer;
- (SHInnerCircleMaskLayer)innerCircleToAutoShadowMaskLayer;
- (SHInnerCircleMaskLayer)innerCircleToShazamButtonMaskLayer;
- (SHListeningAutoShadowLayer)autoShadowLayer;
- (SHListeningInnerCirclesLayer)innerCirclesLayer;
- (SHListeningLayer)init;
- (SHListeningLayer)initWithIntroAnimation:(BOOL)a3 useCustomCompatibleBackground:(BOOL)a4;
- (SHListeningLayerDelegate)viewDelegate;
- (SHListeningOuterCirclesLayer)outerCirclesLayer;
- (SHPalette)palette;
- (SHShazamButtonLayer)shazamButtonLayer;
- (double)bass;
- (double)treble;
- (int64_t)state;
- (void)addAutoAnimationInitialShazamButtonPulse;
- (void)addAutoShadowLayer;
- (void)addAutoShadowToShazamButtonMaskLayer;
- (void)addInnerCircleToAutoShadowMaskLayer;
- (void)addInnerCirclesLayer;
- (void)addInnerCirclesToShazamButtonMaskLayer;
- (void)addOuterCirclesLayer;
- (void)addTouchDownAnimation;
- (void)animateToStoppedStateWithCompletion:(id)a3;
- (void)buildView;
- (void)buttonWillFinishDrawingShazamShape;
- (void)centerLayer:(id)a3 inSuperLayer:(id)a4 withRelativeSize:(double)a5;
- (void)layoutSublayers;
- (void)processBass:(double)a3 treble:(double)a4;
- (void)processBassForInnerCircle:(double)a3;
- (void)processBassForShazamButton:(double)a3;
- (void)processTrebleForOuterCircles:(double)a3;
- (void)removeAnimationLayers;
- (void)setAutoShadowContainerLayer:(id)a3;
- (void)setAutoShadowLayer:(id)a3;
- (void)setAutoShadowToShazamButtonMaskLayer:(id)a3;
- (void)setBass:(double)a3;
- (void)setInnerCircleToAutoShadowMaskLayer:(id)a3;
- (void)setInnerCircleToShazamButtonMaskLayer:(id)a3;
- (void)setInnerCirclesContainerLayer:(id)a3;
- (void)setInnerCirclesLayer:(id)a3;
- (void)setInnerCirclesSecondaryContainerLayer:(id)a3;
- (void)setOuterCirclesLayer:(id)a3;
- (void)setShazamButtonLayer:(id)a3;
- (void)setShouldPerformIntroAnimation:(BOOL)a3;
- (void)setState:(int64_t)a3;
- (void)setTreble:(double)a3;
- (void)setViewDelegate:(id)a3;
- (void)startActiveListeningAnimation;
- (void)startIdleAnimation;
- (void)startPassiveListeningAnimation;
- (void)startShazamButtonIdleAnimation;
- (void)stopAllAnimations;
@end

@implementation SHListeningLayer

- (SHListeningLayer)init
{
  return [(SHListeningLayer *)self initWithIntroAnimation:0 useCustomCompatibleBackground:0];
}

- (SHListeningLayer)initWithIntroAnimation:(BOOL)a3 useCustomCompatibleBackground:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SHListeningLayer;
  v6 = [(SHListeningLayer *)&v12 init];
  if (v6)
  {
    if (v4)
    {
      v7 = objc_alloc_init(SHCustomBackgroundCompatiblePalette);
    }
    else
    {
      v7 = +[SHPalette default];
    }
    palette = v6->_palette;
    v6->_palette = &v7->super;

    v6->_state = 1;
    v6->_shouldPerformIntroAnimation = v5;
    [(SHListeningLayer *)v6 buildView];
    v9 = [(SHListeningLayer *)v6 shazamButtonLayer];
    v10 = v9;
    if (v5) {
      [v9 performSDrawingIntroAnimation];
    }
    else {
      [v9 skipIntroAnimation];
    }
  }
  return v6;
}

- (void)buildView
{
  v3 = [SHShazamButtonLayer alloc];
  BOOL v4 = [(SHListeningLayer *)self palette];
  BOOL v5 = [(SHPaletteLayer *)v3 initWithPalette:v4];
  [(SHListeningLayer *)self setShazamButtonLayer:v5];

  v6 = [(SHListeningLayer *)self shazamButtonLayer];
  [v6 setButtonDelegate:self];

  v7 = [(SHListeningLayer *)self shazamButtonLayer];
  [(SHListeningLayer *)self addSublayer:v7];

  [(SHListeningLayer *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  id v16 = [(SHListeningLayer *)self shazamButtonLayer];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);
}

- (void)layoutSublayers
{
  v60.receiver = self;
  v60.super_class = (Class)SHListeningLayer;
  [(SHListeningLayer *)&v60 layoutSublayers];
  [(SHListeningLayer *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v11 = [(SHListeningLayer *)self shazamButtonLayer];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  double v12 = [(SHListeningLayer *)self autoShadowContainerLayer];
  [(SHListeningLayer *)self centerLayer:v12 inSuperLayer:self withRelativeSize:1.0];

  double v13 = [(SHListeningLayer *)self autoShadowLayer];
  double v14 = [(SHListeningLayer *)self autoShadowContainerLayer];
  [(SHListeningLayer *)self centerLayer:v13 inSuperLayer:v14 withRelativeSize:1.0];

  if ([(SHListeningLayer *)self state] == 4) {
    double v15 = 3.0;
  }
  else {
    double v15 = 2.70000005;
  }
  id v16 = [(SHListeningLayer *)self innerCirclesContainerLayer];
  [(SHListeningLayer *)self centerLayer:v16 inSuperLayer:self withRelativeSize:v15];

  v17 = [(SHListeningLayer *)self innerCirclesSecondaryContainerLayer];
  v18 = [(SHListeningLayer *)self innerCirclesContainerLayer];
  [(SHListeningLayer *)self centerLayer:v17 inSuperLayer:v18 withRelativeSize:1.0];

  v19 = [(SHListeningLayer *)self innerCirclesLayer];
  v20 = [(SHListeningLayer *)self innerCirclesSecondaryContainerLayer];
  [(SHListeningLayer *)self centerLayer:v19 inSuperLayer:v20 withRelativeSize:1.0];

  v21 = [(SHListeningLayer *)self outerCirclesLayer];
  [(SHListeningLayer *)self centerLayer:v21 inSuperLayer:self withRelativeSize:6.30000019];

  v22 = [(SHListeningLayer *)self innerCirclesContainerLayer];
  [v22 bounds];
  double MidX = CGRectGetMidX(v61);
  v24 = [(SHListeningLayer *)self innerCirclesContainerLayer];
  [v24 bounds];
  double MidY = CGRectGetMidY(v62);
  v26 = [(SHListeningLayer *)self innerCircleToShazamButtonMaskLayer];
  objc_msgSend(v26, "setPosition:", MidX, MidY);

  v27 = [(SHListeningLayer *)self shazamButtonLayer];
  [v27 bounds];
  CGFloat v28 = CGRectGetWidth(v63) * 3.5;
  v29 = [(SHListeningLayer *)self shazamButtonLayer];
  [v29 bounds];
  CGFloat v30 = CGRectGetHeight(v64) * 3.5;
  v31 = [(SHListeningLayer *)self innerCircleToShazamButtonMaskLayer];
  objc_msgSend(v31, "setBounds:", 0.0, 0.0, v28, v30);

  v32 = [(SHListeningLayer *)self innerCirclesSecondaryContainerLayer];
  [v32 bounds];
  double v33 = CGRectGetMidX(v65);
  v34 = [(SHListeningLayer *)self innerCirclesSecondaryContainerLayer];
  [v34 bounds];
  double v35 = CGRectGetMidY(v66);
  v36 = [(SHListeningLayer *)self innerCircleToAutoShadowMaskLayer];
  objc_msgSend(v36, "setPosition:", v33, v35);

  v37 = [(SHListeningLayer *)self shazamButtonLayer];
  [v37 bounds];
  CGFloat v38 = CGRectGetWidth(v67) * 3.5;
  v39 = [(SHListeningLayer *)self shazamButtonLayer];
  [v39 bounds];
  CGFloat v40 = CGRectGetHeight(v68) * 3.5;
  v41 = [(SHListeningLayer *)self innerCircleToAutoShadowMaskLayer];
  objc_msgSend(v41, "setBounds:", 0.0, 0.0, v38, v40);

  v42 = [(SHListeningLayer *)self autoShadowContainerLayer];
  [v42 bounds];
  double v43 = CGRectGetMidX(v69);
  v44 = [(SHListeningLayer *)self autoShadowContainerLayer];
  [v44 bounds];
  double v45 = CGRectGetMidY(v70);
  v46 = [(SHListeningLayer *)self autoShadowToShazamButtonMaskLayer];
  objc_msgSend(v46, "setPosition:", v43, v45);

  v47 = [(SHListeningLayer *)self autoShadowLayer];
  [v47 bounds];
  CGFloat v48 = CGRectGetWidth(v71) * 3.5;
  v49 = [(SHListeningLayer *)self autoShadowLayer];
  [v49 bounds];
  CGFloat v50 = CGRectGetHeight(v72) * 3.5;
  v51 = [(SHListeningLayer *)self autoShadowToShazamButtonMaskLayer];
  objc_msgSend(v51, "setBounds:", 0.0, 0.0, v48, v50);

  v52 = [(SHListeningLayer *)self shazamButtonLayer];
  [v52 setNeedsLayout];

  v53 = [(SHListeningLayer *)self shazamButtonLayer];
  [v53 layoutIfNeeded];

  v54 = [(SHListeningLayer *)self innerCirclesLayer];
  [v54 setNeedsLayout];

  v55 = [(SHListeningLayer *)self innerCirclesLayer];
  [v55 layoutIfNeeded];

  v56 = [(SHListeningLayer *)self outerCirclesLayer];
  [v56 setNeedsLayout];

  v57 = [(SHListeningLayer *)self outerCirclesLayer];
  [v57 layoutIfNeeded];

  v58 = [(SHListeningLayer *)self autoShadowLayer];
  [v58 setNeedsLayout];

  v59 = [(SHListeningLayer *)self autoShadowLayer];
  [v59 layoutIfNeeded];
}

- (void)centerLayer:(id)a3 inSuperLayer:(id)a4 withRelativeSize:(double)a5
{
  id v7 = a4;
  id v18 = a3;
  [v7 bounds];
  CGFloat v8 = CGRectGetWidth(v20) * a5;
  [v7 bounds];
  objc_msgSend(v18, "setBounds:", 0.0, 0.0, v8, CGRectGetHeight(v21) * a5);
  [v7 bounds];
  double MidX = CGRectGetMidX(v22);
  [v7 bounds];
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;

  v23.origin.x = v11;
  v23.origin.y = v13;
  v23.size.width = v15;
  v23.size.height = v17;
  objc_msgSend(v18, "setPosition:", MidX, CGRectGetMidY(v23));
}

- (double)bass
{
  return self->_bass;
}

- (void)setBass:(double)a3
{
  self->_bass = a3;
  [(SHListeningLayer *)self treble];
  [(SHListeningLayer *)self processBass:a3 treble:v5];
}

- (double)treble
{
  return self->_treble;
}

- (void)setTreble:(double)a3
{
  self->_treble = a3;
  [(SHListeningLayer *)self processBass:self->_bass treble:a3];
}

- (void)processBass:(double)a3 treble:(double)a4
{
  if ([(SHListeningLayer *)self state] == 4)
  {
    [(SHListeningLayer *)self processBassForInnerCircle:a3];
    [(SHListeningLayer *)self processBassForShazamButton:a3];
    [(SHListeningLayer *)self processTrebleForOuterCircles:a4];
  }
}

- (void)processBassForInnerCircle:(double)a3
{
  +[SHMaths interpolateValue:a3 leftMin:0.0 leftMax:1.0 rightMin:0.699999988 rightMax:1.29999995];
  CGFloat v6 = v5;
  +[SHMaths interpolateValue:a3 leftMin:0.0 leftMax:1.0 rightMin:0.5 rightMax:0.899999976];
  double v8 = v7;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setValue:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F15FC8]];
  CATransform3DMakeScale(&v13, v6, v6, 1.0);
  double v9 = [(SHListeningLayer *)self innerCirclesLayer];
  CATransform3D v12 = v13;
  [v9 setTransform:&v12];

  double v10 = [(SHListeningLayer *)self innerCirclesLayer];
  *(float *)&double v8 = v8;
  LODWORD(v11) = LODWORD(v8);
  [v10 setOpacity:v11];

  [MEMORY[0x263F158F8] commit];
}

- (void)processTrebleForOuterCircles:(double)a3
{
  +[SHMaths interpolateValue:a3 leftMin:0.0 leftMax:1.0 rightMin:0.899999976 rightMax:1.10000002];
  CGFloat v6 = v5;
  +[SHMaths interpolateValue:a3 leftMin:0.0 leftMax:1.0 rightMin:0.300000012 rightMax:0.699999988];
  double v8 = v7;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setValue:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F15FC8]];
  CATransform3DMakeScale(&v13, v6, v6, 1.0);
  double v9 = [(SHListeningLayer *)self outerCirclesLayer];
  CATransform3D v12 = v13;
  [v9 setTransform:&v12];

  double v10 = [(SHListeningLayer *)self outerCirclesLayer];
  *(float *)&double v8 = v8;
  LODWORD(v11) = LODWORD(v8);
  [v10 setOpacity:v11];

  [MEMORY[0x263F158F8] commit];
}

- (void)processBassForShazamButton:(double)a3
{
  +[SHMaths interpolateValue:a3 leftMin:0.0 leftMax:1.0 rightMin:0.75 rightMax:1.10000002];
  CGFloat v5 = v4;
  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setValue:*MEMORY[0x263EFFB40] forKey:*MEMORY[0x263F15FC8]];
  CATransform3DMakeScale(&v14, v5, v5, 1.0);
  CGFloat v6 = [(SHListeningLayer *)self shazamButtonLayer];
  CATransform3D v13 = v14;
  [v6 setSublayerTransform:&v13];

  CATransform3DMakeScale(&v12, v5, v5, 1.0);
  double v7 = [(SHListeningLayer *)self autoShadowToShazamButtonMaskLayer];
  CATransform3D v11 = v12;
  [v7 setTransform:&v11];

  CATransform3DMakeScale(&v10, v5, v5, 1.0);
  double v8 = [(SHListeningLayer *)self innerCircleToShazamButtonMaskLayer];
  CATransform3D v9 = v10;
  [v8 setTransform:&v9];

  [MEMORY[0x263F158F8] commit];
}

- (void)startShazamButtonIdleAnimation
{
  id v6 = [MEMORY[0x263F15760] animationWithKeyPath:@"sublayerTransform.scale"];
  [v6 setFromValue:&unk_26E9F98E0];
  [v6 setToValue:&unk_26E9F98F0];
  [v6 setDuration:1.0];
  [v6 setAutoreverses:1];
  LODWORD(v3) = 2139095040;
  [v6 setRepeatCount:v3];
  [v6 setRemovedOnCompletion:0];
  [v6 setFillMode:*MEMORY[0x263F15AB0]];
  double v4 = +[SHListeningMediaTimingFunctionProvider inOutSineMediaTimingFunction];
  [v6 setTimingFunction:v4];

  CGFloat v5 = [(SHListeningLayer *)self shazamButtonLayer];
  [v5 addAnimation:v6 forKey:@"SHListeningShazamButtonScaleAnimationKey"];
}

- (void)startIdleAnimation
{
  int64_t v3 = [(SHListeningLayer *)self state];
  [(SHListeningLayer *)self setState:2];
  if (v3 == 1)
  {
    double v4 = [(SHListeningLayer *)self shazamButtonLayer];
    [v4 removeAllAnimations];

    [(SHListeningLayer *)self startShazamButtonIdleAnimation];
  }
  else
  {
    CGFloat v5 = [(SHListeningLayer *)self innerCirclesLayer];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __38__SHListeningLayer_startIdleAnimation__block_invoke;
    v7[3] = &unk_264CC0118;
    id v8 = v5;
    CATransform3D v9 = self;
    id v6 = v5;
    [(SHListeningLayer *)self animateToStoppedStateWithCompletion:v7];
  }
}

void __38__SHListeningLayer_startIdleAnimation__block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  int64_t v3 = [*(id *)(a1 + 40) innerCirclesLayer];

  if (v2 == v3)
  {
    double v4 = *(void **)(a1 + 40);
    [v4 startShazamButtonIdleAnimation];
  }
}

- (void)startActiveListeningAnimation
{
  if ([(SHListeningLayer *)self state] == 2 || [(SHListeningLayer *)self state] == 1)
  {
    [(SHListeningLayer *)self setState:4];
    int64_t v3 = [(SHListeningLayer *)self shazamButtonLayer];
    [v3 removeAllAnimations];

    [(SHListeningLayer *)self addInnerCirclesLayer];
    [(SHListeningLayer *)self addOuterCirclesLayer];
    [(SHListeningLayer *)self addInnerCirclesToShazamButtonMaskLayer];
    double v4 = [(SHListeningLayer *)self innerCirclesLayer];
    [v4 startListeningAnimation];

    CGFloat v5 = [(SHListeningLayer *)self outerCirclesLayer];
    [v5 startListeningAnimation];

    [(SHListeningLayer *)self setNeedsLayout];
  }
}

- (void)startPassiveListeningAnimation
{
  if ([(SHListeningLayer *)self state] == 2 || [(SHListeningLayer *)self state] == 1)
  {
    [(SHListeningLayer *)self setState:3];
    [(SHListeningLayer *)self addAutoShadowLayer];
    [(SHListeningLayer *)self addInnerCirclesLayer];
    [(SHListeningLayer *)self addInnerCircleToAutoShadowMaskLayer];
    [(SHListeningLayer *)self addInnerCirclesToShazamButtonMaskLayer];
    [(SHListeningLayer *)self addAutoShadowToShazamButtonMaskLayer];
    [(SHListeningLayer *)self addAutoAnimationInitialShazamButtonPulse];
    int64_t v3 = [(SHListeningLayer *)self innerCirclesLayer];
    [v3 startListeningAnimation];

    [(SHListeningLayer *)self setNeedsLayout];
  }
}

- (void)stopAllAnimations
{
  if ([(SHListeningLayer *)self state] != 1)
  {
    int64_t v3 = [(SHListeningLayer *)self shazamButtonLayer];
    [v3 removeAllAnimations];

    [(SHListeningLayer *)self removeAnimationLayers];
    double v4 = [(SHListeningLayer *)self shazamButtonLayer];
    long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
    v9[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
    v9[5] = v5;
    long long v6 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
    v9[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
    v9[7] = v6;
    long long v7 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
    v9[0] = *MEMORY[0x263F15740];
    v9[1] = v7;
    long long v8 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
    v9[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
    v9[3] = v8;
    [v4 setSublayerTransform:v9];
  }
}

- (void)addAutoAnimationInitialShazamButtonPulse
{
  id v8 = [MEMORY[0x263F15890] animationWithKeyPath:@"sublayerTransform.scale"];
  [v8 setFromValue:&unk_26E9F9900];
  [v8 setToValue:&unk_26E9F9910];
  [v8 setDuration:0.200000003];
  [v8 setRemovedOnCompletion:0];
  uint64_t v3 = *MEMORY[0x263F15AB0];
  [v8 setFillMode:*MEMORY[0x263F15AB0]];
  double v4 = [(SHListeningLayer *)self shazamButtonLayer];
  [v4 addAnimation:v8 forKey:@"SHListeningShazamButtonScaleAnimationKey"];

  long long v5 = [MEMORY[0x263F15890] animationWithKeyPath:@"transform.scale"];
  [v5 setFromValue:&unk_26E9F9900];
  [v5 setToValue:&unk_26E9F9910];
  [v5 setDuration:0.200000003];
  [v5 setRemovedOnCompletion:0];
  [v5 setFillMode:v3];
  long long v6 = [(SHListeningLayer *)self innerCircleToShazamButtonMaskLayer];
  [v6 addAnimation:v5 forKey:@"SHListeningShazamButtonScaleAnimationKey"];

  long long v7 = [(SHListeningLayer *)self autoShadowToShazamButtonMaskLayer];
  [v7 addAnimation:v5 forKey:@"SHListeningShazamButtonScaleAnimationKey"];
}

- (void)addTouchDownAnimation
{
  id v8 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  uint64_t v3 = [(SHListeningLayer *)self shazamButtonLayer];
  double v4 = [v3 presentationLayer];
  long long v5 = [v4 valueForKeyPath:@"transform.scale"];
  [v8 setFromValue:v5];

  [v8 setToValue:&unk_26E9F9910];
  [v8 setDuration:0.349999994];
  [v8 setFillMode:*MEMORY[0x263F15AB0]];
  [v8 setRemovedOnCompletion:0];
  long long v6 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  [v8 setTimingFunction:v6];

  long long v7 = [(SHListeningLayer *)self shazamButtonLayer];
  [v7 addAnimation:v8 forKey:@"SHListeningShazamButtonScaleAnimationKey"];
}

- (void)animateToStoppedStateWithCompletion:(id)a3
{
  id v4 = a3;
  long long v5 = [(SHListeningLayer *)self innerCircleToShazamButtonMaskLayer];
  [v5 removeAllAnimations];

  long long v6 = [(SHListeningLayer *)self shazamButtonLayer];
  [v6 removeAllAnimations];

  long long v7 = [(SHListeningLayer *)self autoShadowToShazamButtonMaskLayer];
  [v7 removeAllAnimations];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setCompletionBlock:v4];

  id v8 = [(SHListeningLayer *)self shazamButtonLayer];
  CATransform3D v9 = [v8 presentationLayer];
  id v43 = [v9 valueForKeyPath:@"sublayerTransform.scale"];

  CATransform3D v10 = [MEMORY[0x263F15760] animationWithKeyPath:@"sublayerTransform.scale"];
  [v10 setFromValue:v43];
  [v10 setToValue:&unk_26E9F98E0];
  [v10 setDuration:0.349999994];
  [v10 setRemovedOnCompletion:0];
  uint64_t v11 = *MEMORY[0x263F15AB0];
  [v10 setFillMode:*MEMORY[0x263F15AB0]];
  uint64_t v12 = *MEMORY[0x263F15EC0];
  uint64_t v40 = *MEMORY[0x263F15EC0];
  CATransform3D v13 = [MEMORY[0x263F15808] functionWithName:*MEMORY[0x263F15EC0]];
  [v10 setTimingFunction:v13];

  CATransform3D v14 = [(SHListeningLayer *)self shazamButtonLayer];
  [v14 addAnimation:v10 forKey:@"SHListeningShazamButtonScaleAnimationKey"];

  CGFloat v15 = [(SHListeningLayer *)self innerCircleToShazamButtonMaskLayer];
  double v16 = [v15 presentationLayer];
  v42 = [v16 valueForKeyPath:@"transform.scale"];

  CGFloat v17 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  [v17 setFromValue:v42];
  [v17 setToValue:&unk_26E9F98E0];
  [v17 setDuration:0.349999994];
  [v17 setRemovedOnCompletion:0];
  [v17 setFillMode:v11];
  id v18 = [MEMORY[0x263F15808] functionWithName:v12];
  [v17 setTimingFunction:v18];

  v19 = [(SHListeningLayer *)self innerCircleToShazamButtonMaskLayer];
  [v19 addAnimation:v17 forKey:@"SHListeningShazamButtonScaleAnimationKey"];

  CGRect v20 = [(SHListeningLayer *)self autoShadowToShazamButtonMaskLayer];
  [v20 addAnimation:v17 forKey:@"SHListeningShazamButtonScaleAnimationKey"];

  CGRect v21 = [(SHListeningLayer *)self innerCirclesLayer];
  CGRect v22 = [v21 presentationLayer];
  v41 = [v22 valueForKeyPath:@"transform.scale"];

  CGRect v23 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  [v23 setFromValue:v41];
  [v23 setToValue:&unk_26E9F9920];
  [v23 setDuration:0.349999994];
  [v23 setRemovedOnCompletion:0];
  [v23 setFillMode:v11];
  uint64_t v38 = *MEMORY[0x263F15EB0];
  v24 = objc_msgSend(MEMORY[0x263F15808], "functionWithName:");
  [v23 setTimingFunction:v24];

  v25 = [(SHListeningLayer *)self innerCirclesLayer];
  [v25 addAnimation:v23 forKey:@"SHListeningInnerCirclesScaleAnimationKey"];

  v26 = [(SHListeningLayer *)self outerCirclesLayer];
  v27 = [v26 presentationLayer];
  v39 = [v27 valueForKeyPath:@"opacity"];

  CGFloat v28 = [MEMORY[0x263F15760] animationWithKeyPath:@"opacity"];
  [v28 setFromValue:v39];
  [v28 setToValue:&unk_26E9F9930];
  [v28 setDuration:0.5];
  [v28 setRemovedOnCompletion:0];
  [v28 setFillMode:v11];
  v29 = [MEMORY[0x263F15808] functionWithName:v40];
  [v28 setTimingFunction:v29];

  CGFloat v30 = [(SHListeningLayer *)self outerCirclesLayer];
  [v30 addAnimation:v28 forKey:@"SHListeningOuterCirclesOpacityAnimationKey"];

  v31 = [(SHListeningLayer *)self autoShadowLayer];
  v32 = [v31 presentationLayer];
  double v33 = [v32 valueForKeyPath:@"transform.scale"];

  v34 = [MEMORY[0x263F15760] animationWithKeyPath:@"transform.scale"];
  [v34 setFromValue:v33];
  [v34 setToValue:&unk_26E9F9940];
  [v34 setDuration:0.5];
  [v34 setRemovedOnCompletion:0];
  [v34 setFillMode:v11];
  double v35 = [MEMORY[0x263F15808] functionWithName:v38];
  [v34 setTimingFunction:v35];

  v36 = [(SHListeningLayer *)self autoShadowLayer];
  [v36 addAnimation:v34 forKey:0];

  v37 = [(SHListeningLayer *)self innerCircleToAutoShadowMaskLayer];
  [v37 addAnimation:v34 forKey:@"SHListeningAutoShadowScaleAnimationKey"];

  [MEMORY[0x263F158F8] commit];
}

- (void)addInnerCirclesLayer
{
  uint64_t v3 = [(SHListeningLayer *)self innerCirclesLayer];
  if (v3
    || ([(SHListeningLayer *)self innerCirclesContainerLayer],
        (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    id v4 = [(SHListeningLayer *)self innerCirclesLayer];
    [v4 removeFromSuperlayer];

    long long v5 = [(SHListeningLayer *)self innerCirclesContainerLayer];
    [v5 removeFromSuperlayer];

    long long v6 = [(SHListeningLayer *)self innerCirclesSecondaryContainerLayer];
    [v6 removeFromSuperlayer];

    goto LABEL_5;
  }
  CGFloat v17 = [(SHListeningLayer *)self innerCirclesSecondaryContainerLayer];

  if (v17) {
    goto LABEL_4;
  }
LABEL_5:
  id v7 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(SHListeningLayer *)self setInnerCirclesContainerLayer:v7];

  id v8 = [(SHListeningLayer *)self innerCirclesContainerLayer];
  CATransform3D v9 = [(SHListeningLayer *)self shazamButtonLayer];
  [(SHListeningLayer *)self insertSublayer:v8 below:v9];

  id v10 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(SHListeningLayer *)self setInnerCirclesSecondaryContainerLayer:v10];

  uint64_t v11 = [(SHListeningLayer *)self innerCirclesContainerLayer];
  uint64_t v12 = [(SHListeningLayer *)self innerCirclesSecondaryContainerLayer];
  [v11 addSublayer:v12];

  CATransform3D v13 = [SHListeningInnerCirclesLayer alloc];
  CATransform3D v14 = [(SHListeningLayer *)self palette];
  CGFloat v15 = [(SHPaletteLayer *)v13 initWithPalette:v14];
  [(SHListeningLayer *)self setInnerCirclesLayer:v15];

  id v18 = [(SHListeningLayer *)self innerCirclesSecondaryContainerLayer];
  double v16 = [(SHListeningLayer *)self innerCirclesLayer];
  [v18 addSublayer:v16];
}

- (void)addOuterCirclesLayer
{
  uint64_t v3 = [(SHListeningLayer *)self outerCirclesLayer];

  if (v3)
  {
    id v4 = [(SHListeningLayer *)self outerCirclesLayer];
    [v4 removeFromSuperlayer];
  }
  long long v5 = [SHListeningOuterCirclesLayer alloc];
  long long v6 = [(SHListeningLayer *)self palette];
  id v7 = [(SHPaletteLayer *)v5 initWithPalette:v6];
  [(SHListeningLayer *)self setOuterCirclesLayer:v7];

  id v8 = [(SHListeningLayer *)self outerCirclesLayer];
  [(SHListeningLayer *)self addSublayer:v8];
}

- (void)addAutoShadowLayer
{
  uint64_t v3 = [(SHListeningLayer *)self autoShadowLayer];
  if (v3)
  {
  }
  else
  {
    id v4 = [(SHListeningLayer *)self autoShadowContainerLayer];

    if (!v4) {
      goto LABEL_5;
    }
  }
  long long v5 = [(SHListeningLayer *)self autoShadowLayer];
  [v5 removeFromSuperlayer];

  long long v6 = [(SHListeningLayer *)self autoShadowContainerLayer];
  [v6 removeFromSuperlayer];

LABEL_5:
  id v7 = objc_alloc_init(MEMORY[0x263F157E8]);
  [(SHListeningLayer *)self setAutoShadowContainerLayer:v7];

  id v8 = [(SHListeningLayer *)self autoShadowContainerLayer];
  CATransform3D v9 = [(SHListeningLayer *)self shazamButtonLayer];
  [(SHListeningLayer *)self insertSublayer:v8 below:v9];

  id v10 = [SHListeningAutoShadowLayer alloc];
  uint64_t v11 = [(SHListeningLayer *)self palette];
  uint64_t v12 = [(SHPaletteLayer *)v10 initWithPalette:v11];
  [(SHListeningLayer *)self setAutoShadowLayer:v12];

  id v14 = [(SHListeningLayer *)self autoShadowContainerLayer];
  CATransform3D v13 = [(SHListeningLayer *)self autoShadowLayer];
  [v14 addSublayer:v13];
}

- (void)addInnerCirclesToShazamButtonMaskLayer
{
  uint64_t v3 = [SHInnerCircleMaskLayer alloc];
  id v4 = [(SHListeningLayer *)self palette];
  long long v5 = [(SHPaletteLayer *)v3 initWithPalette:v4];
  [(SHListeningLayer *)self setInnerCircleToShazamButtonMaskLayer:v5];

  long long v6 = [(SHListeningLayer *)self innerCircleToShazamButtonMaskLayer];
  [v6 setInnerCircleRelativeSize:3.5];

  id v8 = [(SHListeningLayer *)self innerCircleToShazamButtonMaskLayer];
  id v7 = [(SHListeningLayer *)self innerCirclesContainerLayer];
  [v7 setMask:v8];
}

- (void)addInnerCircleToAutoShadowMaskLayer
{
  uint64_t v3 = [SHInnerCircleMaskLayer alloc];
  id v4 = [(SHListeningLayer *)self palette];
  long long v5 = [(SHPaletteLayer *)v3 initWithPalette:v4];
  [(SHListeningLayer *)self setInnerCircleToAutoShadowMaskLayer:v5];

  long long v6 = [(SHListeningLayer *)self innerCircleToAutoShadowMaskLayer];
  [v6 setInnerCircleRelativeSize:3.5];

  id v8 = [(SHListeningLayer *)self innerCircleToAutoShadowMaskLayer];
  id v7 = [(SHListeningLayer *)self innerCirclesSecondaryContainerLayer];
  [v7 setMask:v8];
}

- (void)addAutoShadowToShazamButtonMaskLayer
{
  uint64_t v3 = [SHInnerCircleMaskLayer alloc];
  id v4 = [(SHListeningLayer *)self palette];
  long long v5 = [(SHPaletteLayer *)v3 initWithPalette:v4];
  [(SHListeningLayer *)self setAutoShadowToShazamButtonMaskLayer:v5];

  long long v6 = [(SHListeningLayer *)self autoShadowToShazamButtonMaskLayer];
  [v6 setInnerCircleRelativeSize:3.5];

  id v8 = [(SHListeningLayer *)self autoShadowToShazamButtonMaskLayer];
  id v7 = [(SHListeningLayer *)self autoShadowContainerLayer];
  [v7 setMask:v8];
}

- (void)removeAnimationLayers
{
  uint64_t v3 = [(SHListeningLayer *)self innerCirclesContainerLayer];
  [v3 removeFromSuperlayer];

  id v4 = [(SHListeningLayer *)self autoShadowContainerLayer];
  [v4 removeFromSuperlayer];

  long long v5 = [(SHListeningLayer *)self outerCirclesLayer];
  [v5 removeFromSuperlayer];

  [(SHListeningLayer *)self setInnerCirclesLayer:0];
  [(SHListeningLayer *)self setOuterCirclesLayer:0];
  [(SHListeningLayer *)self setAutoShadowLayer:0];
  [(SHListeningLayer *)self setInnerCirclesContainerLayer:0];
  [(SHListeningLayer *)self setInnerCirclesSecondaryContainerLayer:0];
  [(SHListeningLayer *)self setAutoShadowContainerLayer:0];
  [(SHListeningLayer *)self setInnerCircleToAutoShadowMaskLayer:0];
  [(SHListeningLayer *)self setInnerCircleToShazamButtonMaskLayer:0];
  [(SHListeningLayer *)self setAutoShadowToShazamButtonMaskLayer:0];
}

- (void)buttonWillFinishDrawingShazamShape
{
  id v2 = [(SHListeningLayer *)self viewDelegate];
  [v2 willFinishDrawingShazamShape];
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (SHListeningLayerDelegate)viewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewDelegate);
  return (SHListeningLayerDelegate *)WeakRetained;
}

- (void)setViewDelegate:(id)a3
{
}

- (SHShazamButtonLayer)shazamButtonLayer
{
  return self->_shazamButtonLayer;
}

- (void)setShazamButtonLayer:(id)a3
{
}

- (CALayer)autoShadowContainerLayer
{
  return self->_autoShadowContainerLayer;
}

- (void)setAutoShadowContainerLayer:(id)a3
{
}

- (CALayer)innerCirclesContainerLayer
{
  return self->_innerCirclesContainerLayer;
}

- (void)setInnerCirclesContainerLayer:(id)a3
{
}

- (CALayer)innerCirclesSecondaryContainerLayer
{
  return self->_innerCirclesSecondaryContainerLayer;
}

- (void)setInnerCirclesSecondaryContainerLayer:(id)a3
{
}

- (SHListeningInnerCirclesLayer)innerCirclesLayer
{
  return self->_innerCirclesLayer;
}

- (void)setInnerCirclesLayer:(id)a3
{
}

- (SHListeningOuterCirclesLayer)outerCirclesLayer
{
  return self->_outerCirclesLayer;
}

- (void)setOuterCirclesLayer:(id)a3
{
}

- (SHListeningAutoShadowLayer)autoShadowLayer
{
  return self->_autoShadowLayer;
}

- (void)setAutoShadowLayer:(id)a3
{
}

- (SHInnerCircleMaskLayer)innerCircleToShazamButtonMaskLayer
{
  return self->_innerCircleToShazamButtonMaskLayer;
}

- (void)setInnerCircleToShazamButtonMaskLayer:(id)a3
{
}

- (SHInnerCircleMaskLayer)innerCircleToAutoShadowMaskLayer
{
  return self->_innerCircleToAutoShadowMaskLayer;
}

- (void)setInnerCircleToAutoShadowMaskLayer:(id)a3
{
}

- (SHInnerCircleMaskLayer)autoShadowToShazamButtonMaskLayer
{
  return self->_autoShadowToShazamButtonMaskLayer;
}

- (void)setAutoShadowToShazamButtonMaskLayer:(id)a3
{
}

- (SHPalette)palette
{
  return self->_palette;
}

- (BOOL)shouldPerformIntroAnimation
{
  return self->_shouldPerformIntroAnimation;
}

- (void)setShouldPerformIntroAnimation:(BOOL)a3
{
  self->_shouldPerformIntroAnimation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_autoShadowToShazamButtonMaskLayer, 0);
  objc_storeStrong((id *)&self->_innerCircleToAutoShadowMaskLayer, 0);
  objc_storeStrong((id *)&self->_innerCircleToShazamButtonMaskLayer, 0);
  objc_storeStrong((id *)&self->_autoShadowLayer, 0);
  objc_storeStrong((id *)&self->_outerCirclesLayer, 0);
  objc_storeStrong((id *)&self->_innerCirclesLayer, 0);
  objc_storeStrong((id *)&self->_innerCirclesSecondaryContainerLayer, 0);
  objc_storeStrong((id *)&self->_innerCirclesContainerLayer, 0);
  objc_storeStrong((id *)&self->_autoShadowContainerLayer, 0);
  objc_storeStrong((id *)&self->_shazamButtonLayer, 0);
  objc_destroyWeak((id *)&self->_viewDelegate);
}

@end