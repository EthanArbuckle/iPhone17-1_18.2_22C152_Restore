@interface SFMagicHeadWheelView
+ (Class)layerClass;
+ (double)clampedRotationDegrees:(double)a3;
+ (double)rotationWithShortestDistanceFromDegrees:(double)a3 toDegrees:(double)a4;
- (BOOL)canChangeSelectionWhenInRotationState:(int64_t)a3 guidanceState:(int64_t)a4 description:(id *)a5 ignoreDisabling:(BOOL)a6;
- (BOOL)canChangeSelectionWithDescription:(id *)a3;
- (BOOL)canChangeSelectionWithDescription:(id *)a3 ignoreDisabling:(BOOL)a4;
- (BOOL)configureSelectedHeadWithNode:(id)a3 slotNode:(id)a4 isSameAsSelected:(BOOL)a5;
- (BOOL)guidanceStatesEnabled;
- (BOOL)inGuidanceStates;
- (BOOL)inGuidanceStatesWhenInState:(int64_t)a3;
- (BOOL)invalidated;
- (BOOL)isEnabled;
- (BOOL)isMagicHead;
- (BOOL)noUWBCapableDevices;
- (BOOL)rotatedAfterSelectionWasMade;
- (BOOL)transitionToGuidanceState:(int64_t)a3;
- (BOOL)updateSelectedHead:(id)a3;
- (BOOL)updateSelectedNode:(id)a3;
- (BOOL)updateSelectedSlotNode:(id)a3;
- (CGPoint)centerOfContentBounds;
- (CGRect)squareBounds;
- (NSMutableArray)dots;
- (NSMutableDictionary)identifierToSelectionMarkerView;
- (NSUUID)nodeIdentifier;
- (OS_dispatch_source)suppressGuidanceHapticsTimer;
- (SFFloatSpringProperty)pitchSpringProperty;
- (SFFloatSpringProperty)rollSpringProperty;
- (SFFloatSpringProperty)rotationSpringProperty;
- (SFMagicHead)selectedHead;
- (SFMagicHeadPlaceholderView)placeHolderView;
- (SFMagicHeadSettings)settings;
- (SFMagicHeadWheelView)initWithNumberOfDots:(unint64_t)a3 dotsRadius:(double)a4 isMagicHead:(BOOL)a5;
- (SFMagicHeadWheelViewDelegate)delegate;
- (UIColor)dotsColor;
- (UIControl)selectedHeadControl;
- (UIImageView)canChangeSelectionView;
- (UIView)contentView;
- (UIViewPropertyAnimator)selectionAnimator;
- (UIVisualEffectView)dotsContainer;
- (double)dotsRadius;
- (double)previousAngle;
- (double)radius;
- (int64_t)consecutiveRotationChangeRequests;
- (int64_t)guidanceState;
- (int64_t)proposedRotationState;
- (int64_t)rotationState;
- (int64_t)triggerCountForCandidateRotationState:(int64_t)a3;
- (unint64_t)numberOfDots;
- (void)cozyUpAnimationForHead:(id)a3;
- (void)createSprings;
- (void)dealloc;
- (void)deviceRotatedToDegrees:(double)a3 withPitch:(double)a4 andRoll:(double)a5;
- (void)hapticsForHideDots:(BOOL)a3;
- (void)hideDots:(BOOL)a3 withAnimationDuration:(double)a4;
- (void)hideSelection:(BOOL)a3;
- (void)invalidate;
- (void)layoutSubviews;
- (void)loadSettings;
- (void)lostSelectedNode;
- (void)magicHead:(id)a3 requestingSubtitleTextChangeForState:(int64_t)a4;
- (void)magicHeadDidFinishTransferForHead:(id)a3;
- (void)magicHeadDidStartTransferForHead:(id)a3;
- (void)magicHeadDidTerminateTransferForHead:(id)a3;
- (void)pulseSelectedHead;
- (void)scaleDots:(BOOL)a3;
- (void)selectAnimationForHead:(id)a3 withDismissHead:(id)a4;
- (void)selectedHeadHighlighted;
- (void)selectedHeadHightlightCancel;
- (void)selectedHeadTapped;
- (void)setCanChangeSelectionView:(id)a3;
- (void)setConsecutiveRotationChangeRequests:(int64_t)a3;
- (void)setContentView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDots:(id)a3;
- (void)setDotsColor:(id)a3;
- (void)setDotsContainer:(id)a3;
- (void)setDotsRadius:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setGuidanceState:(int64_t)a3;
- (void)setIdentifierToSelectionMarkerView:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setMarkerViewForIdentifier:(id)a3 atPositionDegree:(double)a4;
- (void)setNoUWBCapableDevices:(BOOL)a3;
- (void)setNumberOfDots:(unint64_t)a3;
- (void)setPitchSpringProperty:(id)a3;
- (void)setPlaceHolderView:(id)a3;
- (void)setPreviousAngle:(double)a3;
- (void)setProposedRotationState:(int64_t)a3;
- (void)setRadius:(double)a3;
- (void)setRollSpringProperty:(id)a3;
- (void)setRotatedAfterSelectionWasMade:(BOOL)a3;
- (void)setRotationSpringProperty:(id)a3;
- (void)setRotationState:(int64_t)a3;
- (void)setSelectedHead:(id)a3;
- (void)setSelectedHeadControl:(id)a3;
- (void)setSelectionAnimator:(id)a3;
- (void)setSettings:(id)a3;
- (void)setSuppressGuidanceHapticsTimer:(id)a3;
- (void)startSuppressGuidanceHapticsTimer;
- (void)stopSuppressGuidanceHapticsTimer;
- (void)transitionToRotationState:(int64_t)a3 bypassSampling:(BOOL)a4;
- (void)updateCanChangeSelectionUI;
- (void)updatePlaceHolderView;
- (void)updateSelectionControlState;
- (void)updateVelocityWithCurrentAngle:(double)a3;
- (void)updateVisibilityOfComponents;
@end

@implementation SFMagicHeadWheelView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (SFMagicHeadWheelView)initWithNumberOfDots:(unint64_t)a3 dotsRadius:(double)a4 isMagicHead:(BOOL)a5
{
  v53.receiver = self;
  v53.super_class = (Class)SFMagicHeadWheelView;
  double v8 = *MEMORY[0x263F001A8];
  double v9 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v10 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v11 = *(double *)(MEMORY[0x263F001A8] + 24);
  v12 = -[SFMagicHeadWheelView initWithFrame:](&v53, sel_initWithFrame_, *MEMORY[0x263F001A8], v9, v10, v11);
  v13 = v12;
  if (v12)
  {
    [(SFMagicHeadWheelView *)v12 loadSettings];
    v13->_magicHead = a5;
    v14 = objc_opt_new();
    [(SFMagicHeadWheelView *)v13 setIdentifierToSelectionMarkerView:v14];

    v15 = [MEMORY[0x263F825C8] clearColor];
    [(SFMagicHeadWheelView *)v13 setBackgroundColor:v15];

    if ([(SFMagicHeadWheelView *)v13 guidanceStatesEnabled])
    {
      v16 = [(SFMagicHeadWheelView *)v13 layer];
      long long v17 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
      v48[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
      v48[3] = v17;
      v48[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
      uint64_t v18 = *(void *)(MEMORY[0x263F15740] + 80);
      long long v19 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
      v48[0] = *MEMORY[0x263F15740];
      v48[1] = v19;
      uint64_t v49 = v18;
      unint64_t v50 = 0xBF40624DD2F1A9FCLL;
      long long v20 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
      long long v51 = *(_OWORD *)(MEMORY[0x263F15740] + 96);
      long long v52 = v20;
      [v16 setSublayerTransform:v48];
    }
    v21 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v8, v9, v10, v11);
    [(SFMagicHeadWheelView *)v13 setContentView:v21];

    v22 = [MEMORY[0x263F825C8] clearColor];
    v23 = [(SFMagicHeadWheelView *)v13 contentView];
    [v23 setBackgroundColor:v22];

    v24 = [(SFMagicHeadWheelView *)v13 contentView];
    [(SFMagicHeadWheelView *)v13 addSubview:v24];

    if (![(SFMagicHeadWheelView *)v13 isMagicHead])
    {
      v25 = -[SFMagicHeadPlaceholderView initWithFrame:]([SFMagicHeadPlaceholderView alloc], "initWithFrame:", v8, v9, v10, v11);
      [(SFMagicHeadWheelView *)v13 setPlaceHolderView:v25];

      v26 = [(SFMagicHeadWheelView *)v13 contentView];
      v27 = [(SFMagicHeadWheelView *)v13 placeHolderView];
      [v26 addSubview:v27];
    }
    v28 = [MEMORY[0x263F824D8] effectWithStyle:9];
    v29 = [MEMORY[0x263F82DF0] effectForBlurEffect:v28 style:2];
    v30 = (void *)[objc_alloc(MEMORY[0x263F82E50]) initWithEffect:v29];
    [(SFMagicHeadWheelView *)v13 setDotsContainer:v30];

    v31 = [(SFMagicHeadWheelView *)v13 contentView];
    v32 = [(SFMagicHeadWheelView *)v13 dotsContainer];
    [v31 addSubview:v32];

    v33 = objc_opt_new();
    [(SFMagicHeadWheelView *)v13 setDots:v33];

    [(SFMagicHeadWheelView *)v13 setNumberOfDots:a3];
    [(SFMagicHeadWheelView *)v13 setDotsRadius:a4];
    for (; a3; --a3)
    {
      v34 = objc_opt_new();
      objc_msgSend(v34, "setBounds:", 0.0, 0.0, a4 + a4, a4 + a4);
      v35 = [v34 layer];
      [v35 setCornerRadius:a4];

      v36 = [MEMORY[0x263F825C8] whiteColor];
      [v34 setBackgroundColor:v36];

      [v34 setUserInteractionEnabled:0];
      [v34 setAlpha:0.0];
      v37 = [(SFMagicHeadWheelView *)v13 dots];
      [v37 addObject:v34];

      v38 = [(SFMagicHeadWheelView *)v13 dotsContainer];
      v39 = [v38 contentView];
      [v39 addSubview:v34];
    }
    if (![(SFMagicHeadWheelView *)v13 isMagicHead])
    {
      v40 = objc_msgSend(objc_alloc(MEMORY[0x263F82638]), "initWithFrame:", v8, v9, v10, v11);
      [(SFMagicHeadWheelView *)v13 setSelectedHeadControl:v40];

      v41 = [(SFMagicHeadWheelView *)v13 selectedHeadControl];
      [v41 addTarget:v13 action:sel_selectedHeadTapped forControlEvents:64];

      v42 = [(SFMagicHeadWheelView *)v13 selectedHeadControl];
      [v42 addTarget:v13 action:sel_selectedHeadHighlighted forControlEvents:1];

      v43 = [(SFMagicHeadWheelView *)v13 selectedHeadControl];
      [v43 addTarget:v13 action:sel_selectedHeadHightlightCancel forControlEvents:256];

      v44 = [(SFMagicHeadWheelView *)v13 selectedHeadControl];
      [v44 addTarget:v13 action:sel_selectedHeadHightlightCancel forControlEvents:128];

      v45 = [(SFMagicHeadWheelView *)v13 contentView];
      v46 = [(SFMagicHeadWheelView *)v13 selectedHeadControl];
      [v45 addSubview:v46];
    }
    [(SFMagicHeadWheelView *)v13 setRotatedAfterSelectionWasMade:1];
    [(SFMagicHeadWheelView *)v13 setNoUWBCapableDevices:1];
    v13->_guidanceState = -1;
    [(SFMagicHeadWheelView *)v13 transitionToGuidanceState:0];
    [(SFMagicHeadWheelView *)v13 transitionToRotationState:[(SFMagicHeadWheelView *)v13 isMagicHead] ^ 1 bypassSampling:1];
    [(SFMagicHeadWheelView *)v13 updateVisibilityOfComponents];
  }
  return v13;
}

- (void)loadSettings
{
  id v4 = [MEMORY[0x263F6C2C0] rootSettings];
  v3 = [v4 magicHeadSettings];
  [(SFMagicHeadWheelView *)self setSettings:v3];
}

- (void)invalidate
{
  if (![(SFMagicHeadWheelView *)self invalidated])
  {
    [(SFMagicHeadWheelView *)self setInvalidated:1];
    [(SFMagicHeadWheelView *)self stopSuppressGuidanceHapticsTimer];
    v3 = [(SFMagicHeadWheelView *)self rotationSpringProperty];
    [v3 invalidate];

    id v4 = [(SFMagicHeadWheelView *)self pitchSpringProperty];
    [v4 invalidate];

    v5 = [(SFMagicHeadWheelView *)self rollSpringProperty];
    [v5 invalidate];

    [(SFMagicHeadWheelView *)self setSelectionAnimator:0];
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    if (a3)
    {
      [(SFMagicHeadWheelView *)self setNeedsLayout];
    }
    else
    {
      self->_guidanceState = 0;
      self->_rotationState = 0;
    }
  }
}

- (void)setNoUWBCapableDevices:(BOOL)a3
{
  if (self->_noUWBCapableDevices != a3)
  {
    self->_noUWBCapableDevices = a3;
    [(SFMagicHeadWheelView *)self updatePlaceHolderView];
  }
}

- (void)dealloc
{
  [(SFMagicHeadWheelView *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SFMagicHeadWheelView;
  [(SFMagicHeadWheelView *)&v3 dealloc];
}

- (void)createSprings
{
  v14[3] = *MEMORY[0x263EF8340];
  objc_super v3 = __37__SFMagicHeadWheelView_createSprings__block_invoke();
  [(SFMagicHeadWheelView *)self setRotationSpringProperty:v3];

  id v4 = __37__SFMagicHeadWheelView_createSprings__block_invoke();
  [(SFMagicHeadWheelView *)self setPitchSpringProperty:v4];

  v5 = __37__SFMagicHeadWheelView_createSprings__block_invoke();
  [(SFMagicHeadWheelView *)self setRollSpringProperty:v5];

  id location = 0;
  objc_initWeak(&location, self);
  v6 = (void *)MEMORY[0x263F82E00];
  v7 = [(SFMagicHeadWheelView *)self rotationSpringProperty];
  v14[0] = v7;
  double v8 = [(SFMagicHeadWheelView *)self pitchSpringProperty];
  v14[1] = v8;
  double v9 = [(SFMagicHeadWheelView *)self rollSpringProperty];
  v14[2] = v9;
  double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:3];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __37__SFMagicHeadWheelView_createSprings__block_invoke_2;
  v11[3] = &unk_264471E48;
  objc_copyWeak(&v12, &location);
  [v6 _createTransformerWithInputAnimatableProperties:v10 presentationValueChangedCallback:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

id __37__SFMagicHeadWheelView_createSprings__block_invoke()
{
  v0 = objc_opt_new();
  [v0 setDampingRatio:1.0 response:0.55];
  [v0 setTrackingDampingRatio:0.86 response:0.125];
  [v0 setTracking:1];
  return v0;
}

void __37__SFMagicHeadWheelView_createSprings__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setNeedsLayout];
}

+ (double)rotationWithShortestDistanceFromDegrees:(double)a3 toDegrees:(double)a4
{
  float v5 = a4 - a3 + 180.0;
  return fmodf(v5, 360.0) + a3 + -180.0;
}

- (void)deviceRotatedToDegrees:(double)a3 withPitch:(double)a4 andRoll:(double)a5
{
  double v8 = [(SFMagicHeadWheelView *)self pitchSpringProperty];

  if (!v8) {
    [(SFMagicHeadWheelView *)self createSprings];
  }
  float v9 = a4;
  float v10 = v9 * 57.2957795;
  double v11 = v10;
  id v12 = [(SFMagicHeadWheelView *)self pitchSpringProperty];
  [v12 setInput:v11];

  float v13 = a5;
  float v14 = v13 * 57.2957795;
  double v15 = v14;
  v16 = [(SFMagicHeadWheelView *)self rollSpringProperty];
  [v16 setInput:v15];

  long long v17 = objc_opt_class();
  id v21 = [(SFMagicHeadWheelView *)self rotationSpringProperty];
  [v21 input];
  objc_msgSend(v17, "rotationWithShortestDistanceFromDegrees:toDegrees:");
  double v19 = v18;
  long long v20 = [(SFMagicHeadWheelView *)self rotationSpringProperty];
  [v20 setInput:v19];
}

- (int64_t)triggerCountForCandidateRotationState:(int64_t)a3
{
  BOOL v5 = [(SFMagicHeadWheelView *)self isMagicHead];
  v6 = [(SFMagicHeadWheelView *)self settings];
  v7 = v6;
  if (a3 == 1)
  {
    if (v5) {
      uint64_t v8 = [v6 rotationStartGatingResponsiveness];
    }
    else {
      uint64_t v8 = [v6 rotationStartBigHeadGatingResponsiveness];
    }
  }
  else if (v5)
  {
    uint64_t v8 = [v6 rotationStopGatingResponsiveness];
  }
  else
  {
    uint64_t v8 = [v6 rotationStopBigHeadGatingResponsiveness];
  }
  int64_t v9 = v8;

  return v9;
}

- (void)transitionToRotationState:(int64_t)a3 bypassSampling:(BOOL)a4
{
  unint64_t v5 = a3;
  uint64_t v25 = *MEMORY[0x263EF8340];
  if ([(SFMagicHeadWheelView *)self proposedRotationState] != a3)
  {
    [(SFMagicHeadWheelView *)self setProposedRotationState:v5];
    [(SFMagicHeadWheelView *)self setConsecutiveRotationChangeRequests:0];
  }
  int64_t v7 = [(SFMagicHeadWheelView *)self triggerCountForCandidateRotationState:[(SFMagicHeadWheelView *)self proposedRotationState]];
  if (v5 <= 1)
  {
    int64_t v8 = v7;
    int64_t v9 = [(SFMagicHeadWheelView *)self proposedRotationState];
    if (v9 != [(SFMagicHeadWheelView *)self rotationState]
      && [(SFMagicHeadWheelView *)self consecutiveRotationChangeRequests] < v8
      && !a4)
    {
      [(SFMagicHeadWheelView *)self setConsecutiveRotationChangeRequests:[(SFMagicHeadWheelView *)self consecutiveRotationChangeRequests] + 1];
      unint64_t v5 = [(SFMagicHeadWheelView *)self rotationState];
    }
  }
  if ([(SFMagicHeadWheelView *)self rotationState] != v5)
  {
    int64_t v10 = [(SFMagicHeadWheelView *)self rotationState];
    [(SFMagicHeadWheelView *)self setRotationState:v5];
    id v18 = 0;
    [(SFMagicHeadWheelView *)self canChangeSelectionWithDescription:&v18];
    id v11 = v18;
    id v12 = magic_head_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      if (v10 == 1) {
        float v13 = "Rotating";
      }
      else {
        float v13 = "?";
      }
      if (v10) {
        float v14 = v13;
      }
      else {
        float v14 = "Resting";
      }
      int64_t v15 = [(SFMagicHeadWheelView *)self rotationState];
      if (v15 == 1) {
        v16 = "Rotating";
      }
      else {
        v16 = "?";
      }
      *(_DWORD *)buf = 136315650;
      long long v20 = v14;
      if (!v15) {
        v16 = "Resting";
      }
      __int16 v21 = 2080;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v11;
      _os_log_impl(&dword_21DB23000, v12, OS_LOG_TYPE_DEFAULT, "Transitioning rotation state from %s to %s. %@", buf, 0x20u);
    }

    [(SFMagicHeadWheelView *)self updateVisibilityOfComponents];
  }
  if (![(SFMagicHeadWheelView *)self rotatedAfterSelectionWasMade]
    && [(SFMagicHeadWheelView *)self rotationState] == 1)
  {
    [(SFMagicHeadWheelView *)self setRotatedAfterSelectionWasMade:1];
    long long v17 = magic_head_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21DB23000, v17, OS_LOG_TYPE_DEFAULT, "Re-enabled guidance UI due to rotating", buf, 2u);
    }
  }
}

- (void)updateVelocityWithCurrentAngle:(double)a3
{
  unint64_t v5 = [(SFMagicHeadWheelView *)self settings];
  [v5 rotationGateThresholdDegrees];
  double v7 = v6;

  [(SFMagicHeadWheelView *)self previousAngle];
  double v9 = a3 - v8;
  if (v9 < 0.0) {
    double v9 = -v9;
  }
  [(SFMagicHeadWheelView *)self transitionToRotationState:v9 >= v7 bypassSampling:0];
  [(SFMagicHeadWheelView *)self setPreviousAngle:a3];
}

+ (double)clampedRotationDegrees:(double)a3
{
  float v3 = 0.0;
  if (a3 < 0.0) {
    float v3 = -1.0;
  }
  if (a3 <= 0.0) {
    float v4 = v3;
  }
  else {
    float v4 = 1.0;
  }
  if (a3 < 0.0) {
    a3 = -a3;
  }
  float v5 = a3;
  float v6 = v4 * fmodf(v5, 360.0);
  if (v6 >= 0.0) {
    return v6;
  }
  else {
    return v6 + 360.0;
  }
}

- (BOOL)canChangeSelectionWhenInRotationState:(int64_t)a3 guidanceState:(int64_t)a4 description:(id *)a5 ignoreDisabling:(BOOL)a6
{
  if (a6
    || [(SFMagicHeadWheelView *)self isMagicHead]
    || ([(SFMagicHeadWheelView *)self settings],
        int64_t v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 selectionDisabled],
        v10,
        !v11))
  {
    if ((unint64_t)(a4 - 3) > 1)
    {
      float v14 = [(SFMagicHeadWheelView *)self settings];
      int v15 = [v14 rotationGatedSelectionEnabled];
      BOOL v16 = a3 != 1;

      char v12 = v16 & v15 ^ 1;
      float v13 = @"Selection can change";
      if ((v16 & v15) != 0) {
        float v13 = @"Selection cannot change due to Not Rotating";
      }
      if (a5) {
        goto LABEL_12;
      }
    }
    else
    {
      char v12 = 0;
      if (a5)
      {
        float v13 = @"Selection cannot change due to Tilted";
        goto LABEL_12;
      }
    }
  }
  else
  {
    char v12 = 0;
    if (a5)
    {
      float v13 = @"Selection cannot change due to being Disabled";
LABEL_12:
      *a5 = v13;
    }
  }
  return v12 & 1;
}

- (BOOL)canChangeSelectionWithDescription:(id *)a3 ignoreDisabling:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t v7 = [(SFMagicHeadWheelView *)self rotationState];
  int64_t v8 = [(SFMagicHeadWheelView *)self guidanceState];
  return [(SFMagicHeadWheelView *)self canChangeSelectionWhenInRotationState:v7 guidanceState:v8 description:a3 ignoreDisabling:v4];
}

- (BOOL)canChangeSelectionWithDescription:(id *)a3
{
  return [(SFMagicHeadWheelView *)self canChangeSelectionWithDescription:a3 ignoreDisabling:0];
}

- (BOOL)inGuidanceStatesWhenInState:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 2;
}

- (BOOL)inGuidanceStates
{
  int64_t v3 = [(SFMagicHeadWheelView *)self guidanceState];
  return [(SFMagicHeadWheelView *)self inGuidanceStatesWhenInState:v3];
}

- (BOOL)guidanceStatesEnabled
{
  if ([(SFMagicHeadWheelView *)self isMagicHead])
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    BOOL v4 = [(SFMagicHeadWheelView *)self settings];
    if ([v4 guidanceEnabled]
      && [(SFMagicHeadWheelView *)self rotatedAfterSelectionWasMade])
    {
      BOOL v3 = ![(SFMagicHeadWheelView *)self noUWBCapableDevices];
    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (BOOL)transitionToGuidanceState:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  if ([(SFMagicHeadWheelView *)self guidanceState] == a3) {
    return 1;
  }
  int64_t v6 = [(SFMagicHeadWheelView *)self guidanceState];
  BOOL v7 = a3 != 2 && v6 == 1;
  BOOL v5 = !v7;
  if (v7)
  {
    int64_t v10 = magic_head_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = [(SFMagicHeadWheelView *)self guidanceState];
      if (v13 > 4) {
        float v14 = "?";
      }
      else {
        float v14 = off_264472018[v13];
      }
      if ((unint64_t)a3 > 4) {
        BOOL v16 = "?";
      }
      else {
        BOOL v16 = off_264471FF0[a3];
      }
      *(_DWORD *)buf = 136315394;
      v22 = v14;
      __int16 v23 = 2080;
      id v24 = v16;
      _os_log_impl(&dword_21DB23000, v10, OS_LOG_TYPE_DEFAULT, "Cannot transition guidance state from %s to %s", buf, 0x16u);
    }
  }
  else
  {
    unint64_t v8 = [(SFMagicHeadWheelView *)self guidanceState];
    [(SFMagicHeadWheelView *)self setGuidanceState:a3];
    if ([(SFMagicHeadWheelView *)self rotatedAfterSelectionWasMade]
      && [(SFMagicHeadWheelView *)self guidanceState] == 2)
    {
      [(SFMagicHeadWheelView *)self transitionToRotationState:0 bypassSampling:1];
      double v9 = magic_head_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DB23000, v9, OS_LOG_TYPE_DEFAULT, "Disabled guidance UI due to Selected", buf, 2u);
      }

      [(SFMagicHeadWheelView *)self setRotatedAfterSelectionWasMade:0];
    }
    id v20 = 0;
    [(SFMagicHeadWheelView *)self canChangeSelectionWithDescription:&v20];
    int64_t v10 = v20;
    int v11 = magic_head_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      if (v8 > 4) {
        char v12 = "?";
      }
      else {
        char v12 = off_264472018[v8];
      }
      if ((unint64_t)a3 > 4) {
        int v15 = "?";
      }
      else {
        int v15 = off_264472018[a3];
      }
      *(_DWORD *)buf = 136315650;
      v22 = v12;
      __int16 v23 = 2080;
      id v24 = v15;
      __int16 v25 = 2112;
      v26 = v10;
      _os_log_impl(&dword_21DB23000, v11, OS_LOG_TYPE_DEFAULT, "Transitioning guidance state from %s to %s. %@", buf, 0x20u);
    }

    [(SFMagicHeadWheelView *)self updateSelectionControlState];
    [(SFMagicHeadWheelView *)self updateVisibilityOfComponents];
    BOOL v17 = [(SFMagicHeadWheelView *)self inGuidanceStatesWhenInState:v8];
    if (v17 != [(SFMagicHeadWheelView *)self inGuidanceStatesWhenInState:a3])
    {
      id v18 = [(SFMagicHeadWheelView *)self delegate];
      objc_msgSend(v18, "magicHeadSelectedHeadRequestingDisabledState:", -[SFMagicHeadWheelView inGuidanceStatesWhenInState:](self, "inGuidanceStatesWhenInState:", a3));
    }
  }

  return v5;
}

- (void)updateVisibilityOfComponents
{
  BOOL v3 = [(SFMagicHeadWheelView *)self dots];
  BOOL v4 = [v3 firstObject];
  [v4 alpha];
  double v6 = v5;

  if (![(SFMagicHeadWheelView *)self isMagicHead])
  {
    unint64_t v7 = [(SFMagicHeadWheelView *)self guidanceState];
    if (fabs(v6) >= 0.00000011920929 == v7 > 2)
    {
      unint64_t v8 = v7;
      BOOL v9 = v7 > 2;
      [(SFMagicHeadWheelView *)self hideDots:v9 withAnimationDuration:0.2];
      [(SFMagicHeadWheelView *)self scaleDots:v9];
      int64_t v10 = [(SFMagicHeadWheelView *)self window];

      if (v10) {
        [(SFMagicHeadWheelView *)self hapticsForHideDots:v8 > 2];
      }
      [(SFMagicHeadWheelView *)self hideSelection:v8 > 2];
    }
    [(SFMagicHeadWheelView *)self updatePlaceHolderView];
  }
  [(SFMagicHeadWheelView *)self updateCanChangeSelectionUI];
}

- (void)setFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFMagicHeadWheelView;
  -[SFMagicHeadWheelView setFrame:](&v4, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  [(SFMagicHeadWheelView *)self setNeedsLayout];
}

- (CGRect)squareBounds
{
  [(SFMagicHeadWheelView *)self radius];
  double v3 = v2 + v2;
  double v4 = 0.0;
  double v5 = 0.0;
  double v6 = v3;
  result.size.height = v6;
  result.size.width = v3;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGPoint)centerOfContentBounds
{
  double v3 = [(SFMagicHeadWheelView *)self contentView];
  [v3 bounds];
  CGFloat MidX = CGRectGetMidX(v10);
  double v5 = [(SFMagicHeadWheelView *)self contentView];
  [v5 bounds];
  CGFloat MidY = CGRectGetMidY(v11);

  double v7 = MidX;
  double v8 = MidY;
  result.y = v8;
  result.x = v7;
  return result;
}

- (void)layoutSubviews
{
  uint64_t v110 = *MEMORY[0x263EF8340];
  v97.receiver = self;
  v97.super_class = (Class)SFMagicHeadWheelView;
  [(SFMagicHeadWheelView *)&v97 layoutSubviews];
  double v3 = [(SFMagicHeadWheelView *)self settings];
  [(SFMagicHeadWheelView *)self bounds];
  double Width = CGRectGetWidth(v111);
  [(SFMagicHeadWheelView *)self bounds];
  double Height = CGRectGetHeight(v112);
  if (Width < Height) {
    double Height = Width;
  }
  [(SFMagicHeadWheelView *)self setRadius:Height * 0.5];
  [(SFMagicHeadWheelView *)self squareBounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  float v14 = [(SFMagicHeadWheelView *)self contentView];
  objc_msgSend(v14, "setBounds:", v7, v9, v11, v13);

  [(SFMagicHeadWheelView *)self bounds];
  double MidX = CGRectGetMidX(v113);
  [(SFMagicHeadWheelView *)self bounds];
  double MidY = CGRectGetMidY(v114);
  BOOL v17 = [(SFMagicHeadWheelView *)self contentView];
  objc_msgSend(v17, "setCenter:", MidX, MidY);

  [(SFMagicHeadWheelView *)self centerOfContentBounds];
  double v19 = v18;
  double v21 = v20;
  [(SFMagicHeadWheelView *)self centerOfContentBounds];
  double v23 = v22;
  double v25 = v24;
  v26 = [(SFMagicHeadWheelView *)self canChangeSelectionView];
  objc_msgSend(v26, "setCenter:", v23, v25);

  uint64_t v27 = [(SFMagicHeadWheelView *)self placeHolderView];
  objc_msgSend(v27, "setBounds:", v7, v9, v11, v13);

  v28 = [(SFMagicHeadWheelView *)self placeHolderView];
  objc_msgSend(v28, "setCenter:", v19, v21);

  v29 = [(SFMagicHeadWheelView *)self selectedHeadControl];
  objc_msgSend(v29, "setBounds:", v7, v9, v11, v13);

  v30 = [(SFMagicHeadWheelView *)self selectedHeadControl];
  objc_msgSend(v30, "setCenter:", v19, v21);

  v31 = [(SFMagicHeadWheelView *)self dotsContainer];
  objc_msgSend(v31, "setBounds:", v7, v9, v11, v13);

  v32 = [(SFMagicHeadWheelView *)self dotsContainer];
  objc_msgSend(v32, "setCenter:", v19, v21);

  if ([(SFMagicHeadWheelView *)self isEnabled])
  {
    BOOL v33 = [(SFMagicHeadWheelView *)self guidanceStatesEnabled];
    if (v33)
    {
      v34 = [(SFMagicHeadWheelView *)self pitchSpringProperty];
      if ([v34 primed])
      {
        v35 = [(SFMagicHeadWheelView *)self pitchSpringProperty];
        [v35 output];
        double v37 = v36;
      }
      else
      {
        double v37 = 90.0;
      }
    }
    else
    {
      double v37 = 90.0;
    }
    if ([(SFMagicHeadWheelView *)self guidanceState] == 4)
    {
      [v3 guidanceTooFarDegrees];
      double v39 = v38;
      [v3 guidanceRecoveredDegreesDelta];
      if (v37 > v39 + v40)
      {
        uint64_t v41 = 3;
        goto LABEL_22;
      }
LABEL_15:
      [v3 guidanceFadeHeadDegrees];
      double v45 = v44;
      [v3 guidanceRestoreHeadDegreesDelta];
      if (v37 <= v45 + v46)
      {
LABEL_23:
        [v3 guidanceGoodAngleThreshold];
        double v49 = v48;
        [v3 guidanceGoodAngleThreshold];
        double v51 = v50;
        [v3 guidanceWorstAngleDegreesDelta];
        double v53 = v51 - v52;
        [v3 guidanceDipSpeed];
        double v55 = 0.0;
        double v56 = SFMathMap(v37, v53, v49, -(v49 * v54), 0.0);
        if (v56 < v53) {
          double v53 = v56;
        }
        [v3 guidanceRubberbandingStretchiness];
        double v58 = fmin(SFMathRubberband(v53, v49, v49, v57, 0.0), 0.0);
        if ([(SFMagicHeadWheelView *)self inGuidanceStates])
        {
          v59 = [(SFMagicHeadWheelView *)self contentView];
          v60 = [v59 layer];
          float v61 = v58;
          double v62 = v61 * 0.0174532925;
          *(float *)&double v62 = v62;
          v63 = [NSNumber numberWithFloat:v62];
          [v60 setValue:v63 forKeyPath:@"transform.rotation.x"];
        }
        if ([v3 rollEnabled])
        {
          v64 = [(SFMagicHeadWheelView *)self rollSpringProperty];
          if ([v64 primed])
          {
            v65 = [(SFMagicHeadWheelView *)self rollSpringProperty];
            [v65 output];
            double v55 = v66;
          }
        }
        [v3 rollMaxDegrees];
        double v68 = -v67;
        [v3 rollMaxDegrees];
        double v70 = v69;
        [v3 rollRubberbandingStretchiness];
        double v72 = v71;
        [v3 rollRubberbandingStretchiness];
        double v74 = SFMathRubberband(v55, v68, v70, v72, v73);
        if (v33)
        {
          v75 = [(SFMagicHeadWheelView *)self contentView];
          v76 = [v75 layer];
          float v77 = v74;
          double v78 = v77 * 0.0174532925;
          *(float *)&double v78 = v78;
          v79 = [NSNumber numberWithFloat:v78];
          [v76 setValue:v79 forKeyPath:@"transform.rotation.y"];
        }
        v80 = [(SFMagicHeadWheelView *)self rotationSpringProperty];
        double v81 = 0.0;
        if ([v80 primed])
        {
          v82 = [(SFMagicHeadWheelView *)self rotationSpringProperty];
          [v82 output];
          double v81 = v83;
        }
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __38__SFMagicHeadWheelView_layoutSubviews__block_invoke;
        block[3] = &unk_264471E70;
        block[4] = self;
        *(double *)&block[5] = v81;
        dispatch_async(MEMORY[0x263EF83A0], block);
        [(SFMagicHeadWheelView *)self updateVelocityWithCurrentAngle:v81];
        v84 = [(SFMagicHeadWheelView *)self dotsContainer];
        [v84 bounds];
        CGFloat v85 = CGRectGetMidX(v115);
        v86 = [(SFMagicHeadWheelView *)self dotsContainer];
        [v86 bounds];
        CGFloat v87 = CGRectGetMidY(v116);

        v88 = [(SFMagicHeadWheelView *)self dots];
        v95[0] = MEMORY[0x263EF8330];
        v95[1] = 3221225472;
        v95[2] = __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_2;
        v95[3] = &unk_264471E98;
        *(CGFloat *)&v95[5] = v85;
        *(CGFloat *)&v95[6] = v87;
        v95[4] = self;
        *(double *)&v95[7] = v81;
        [v88 enumerateObjectsUsingBlock:v95];

        v89 = [(SFMagicHeadWheelView *)self identifierToSelectionMarkerView];
        v90 = [v89 allValues];
        v94[0] = MEMORY[0x263EF8330];
        v94[1] = 3221225472;
        v94[2] = __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_4;
        v94[3] = &__block_descriptor_56_e38_v32__0__SFMagicHeadMarkerView_8Q16_B24l;
        *(CGFloat *)&v94[4] = v85;
        *(CGFloat *)&v94[5] = v87;
        *(double *)&v94[6] = v81;
        [v90 enumerateObjectsUsingBlock:v94];

        v91 = magic_head_log();
        if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
        {
          v92 = [(SFMagicHeadWheelView *)self rotationSpringProperty];
          [v92 input];
          *(_DWORD *)buf = 134219264;
          double v99 = v81;
          __int16 v100 = 2048;
          uint64_t v101 = v93;
          __int16 v102 = 2048;
          double v103 = v58;
          __int16 v104 = 2048;
          double v105 = v37;
          __int16 v106 = 2048;
          double v107 = v74;
          __int16 v108 = 2048;
          double v109 = v55;
          _os_log_debug_impl(&dword_21DB23000, v91, OS_LOG_TYPE_DEBUG, "Motion: (adjusted/raw) yaw: %f/%f, pitch: %f/%f, roll %f/%f", buf, 0x3Eu);
        }
        goto LABEL_38;
      }
      uint64_t v41 = 0;
LABEL_22:
      [(SFMagicHeadWheelView *)self transitionToGuidanceState:v41];
      goto LABEL_23;
    }
    int64_t v42 = [(SFMagicHeadWheelView *)self guidanceState];
    [v3 guidanceTooFarDegrees];
    if (v42 == 3)
    {
      if (v37 >= v43) {
        goto LABEL_15;
      }
    }
    else if (v37 >= v43)
    {
      [v3 guidanceFadeHeadDegrees];
      if (v37 >= v47) {
        uint64_t v41 = 0;
      }
      else {
        uint64_t v41 = 3;
      }
      goto LABEL_22;
    }
    uint64_t v41 = 4;
    goto LABEL_22;
  }
LABEL_38:
}

void __38__SFMagicHeadWheelView_layoutSubviews__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 magicHeadChangedFacingDegree:*(double *)(a1 + 40)];
}

void __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  objc_msgSend(v5, "setCenter:", *(double *)(a1 + 40), *(double *)(a1 + 48));
  double v6 = *(double *)(a1 + 56)
     + (double)a3 / (double)(unint64_t)[*(id *)(a1 + 32) numberOfDots] * 360.0;
  float v7 = v6;
  float v8 = v7 * 0.0174532925;
  memset(&v42, 0, sizeof(v42));
  CGAffineTransformMakeRotation(&v42, v8);
  memset(&v41, 0, sizeof(v41));
  [*(id *)(a1 + 32) radius];
  double v10 = v9;
  [*(id *)(a1 + 32) dotsRadius];
  CGAffineTransformMakeTranslation(&v41, 0.0, v11 - v10);
  CGAffineTransform t1 = v41;
  memset(&v40, 0, sizeof(v40));
  CGAffineTransform t2 = v42;
  CGAffineTransformConcat(&v40, &t1, &t2);
  uint64_t v12 = [*(id *)(a1 + 32) selectedHead];
  if (v12
    && (double v13 = (void *)v12, v14 = [*(id *)(a1 + 32) inGuidanceStates], v13, (v14 & 1) == 0))
  {
    [(id)objc_opt_class() clampedRotationDegrees:v6];
    int v17 = (int)v16;
    if ((int)v16 <= 180) {
      double v18 = 180.0 - (double)v17;
    }
    else {
      double v18 = (double)v17 + -180.0;
    }
    if ([*(id *)(a1 + 32) isMagicHead])
    {
      uint64_t v19 = [*(id *)(a1 + 32) rotationState];
      double v20 = 1.0;
      double v21 = 0.0;
      if (v19 != 1) {
        double v20 = 0.0;
      }
      if (v18 + -20.0 > 0.0) {
        double v21 = (v18 + -20.0) / 20.0;
      }
      if (v18 < 40.0 && v19 == 1) {
        double v23 = v21;
      }
      else {
        double v23 = v20;
      }
      double v24 = (void *)MEMORY[0x263F82E00];
      double v25 = objc_msgSend(*(id *)(a1 + 32), "settings", 40.0);
      v26 = v25;
      if (fabs(v23) < 0.00000011920929) {
        [v25 circlesFadeOutDurationS];
      }
      else {
        [v25 circlesFadeInDurationS];
      }
      double v29 = v27;
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_3;
      v35[3] = &unk_264471E70;
      id v36 = v5;
      double v37 = v23;
      [v24 animateWithDuration:v35 animations:v29];
    }
    else if (v18 < 40.0)
    {
      double v28 = 0.0;
      memset(&t1.c, 0, 32);
      if (v18 + -30.0 > 0.0) {
        double v28 = (v18 + -30.0) / 10.0;
      }
      *(_OWORD *)&t1.a = 0uLL;
      CGAffineTransformMakeScale(&t1, v28, v28);
      CGAffineTransform v34 = t1;
      CGAffineTransform v33 = v40;
      CGAffineTransformConcat(&t2, &v34, &v33);
      CGAffineTransform v40 = t2;
    }
    int v15 = (uint64_t *)&v32;
  }
  else
  {
    int v15 = &v31;
  }
  long long v30 = *(_OWORD *)&v40.c;
  *(_OWORD *)int v15 = *(_OWORD *)&v40.a;
  *((_OWORD *)v15 + 1) = v30;
  *((_OWORD *)v15 + 2) = *(_OWORD *)&v40.tx;
  objc_msgSend(v5, "setTransform:");
}

uint64_t __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 40)];
}

void __38__SFMagicHeadWheelView_layoutSubviews__block_invoke_4(double *a1, void *a2)
{
  double v3 = a1[4];
  double v4 = a1[5];
  id v5 = a2;
  objc_msgSend(v5, "setCenter:", v3, v4);
  [v5 updateMarkerWithDegreeOffset:a1[6]];
}

- (void)updateCanChangeSelectionUI
{
  if (IsAppleInternalBuild()
    && ([(SFMagicHeadWheelView *)self settings],
        double v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 showSelectionGateLock],
        v3,
        v4))
  {
    id v5 = [(SFMagicHeadWheelView *)self canChangeSelectionView];

    if (!v5)
    {
      double v6 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithSize:", 40.0, 40.0);
      [(SFMagicHeadWheelView *)self setCanChangeSelectionView:v6];

      float v7 = [(SFMagicHeadWheelView *)self canChangeSelectionView];
      float v8 = [v7 layer];
      [v8 setZPosition:9999.0];

      double v9 = [MEMORY[0x263F825C8] systemRedColor];
      double v10 = [(SFMagicHeadWheelView *)self canChangeSelectionView];
      [v10 setTintColor:v9];

      double v11 = [(SFMagicHeadWheelView *)self contentView];
      uint64_t v12 = [(SFMagicHeadWheelView *)self canChangeSelectionView];
      [v11 addSubview:v12];

      double v13 = [MEMORY[0x263F827E8] systemImageNamed:@"lock.fill"];
      char v14 = [(SFMagicHeadWheelView *)self canChangeSelectionView];
      [v14 setImage:v13];

      int v15 = [MEMORY[0x263F827E8] systemImageNamed:@"lock.open.fill"];
      double v16 = [(SFMagicHeadWheelView *)self canChangeSelectionView];
      [v16 setHighlightedImage:v15];
    }
    BOOL v17 = [(SFMagicHeadWheelView *)self canChangeSelectionWithDescription:0 ignoreDisabling:1];
    id v19 = [(SFMagicHeadWheelView *)self canChangeSelectionView];
    [v19 setHighlighted:v17];
  }
  else
  {
    double v18 = [(SFMagicHeadWheelView *)self canChangeSelectionView];
    [v18 removeFromSuperview];

    [(SFMagicHeadWheelView *)self setCanChangeSelectionView:0];
  }
}

- (void)setMarkerViewForIdentifier:(id)a3 atPositionDegree:(double)a4
{
  id v6 = a3;
  float v7 = [(SFMagicHeadWheelView *)self identifierToSelectionMarkerView];
  float v8 = [v7 objectForKeyedSubscript:v6];
  [v8 removeFromSuperview];

  double v9 = [SFMagicHeadMarkerView alloc];
  [(SFMagicHeadWheelView *)self radius];
  int v15 = [(SFMagicHeadMarkerView *)v9 initWithPositionDegree:a4 containerRadius:v10];
  double v11 = [(SFMagicHeadWheelView *)self settings];
  -[SFMagicHeadMarkerView setHidden:](v15, "setHidden:", [v11 showSelectionMarkers] ^ 1);

  uint64_t v12 = [(SFMagicHeadWheelView *)self dotsContainer];
  double v13 = [v12 contentView];
  [v13 addSubview:v15];

  char v14 = [(SFMagicHeadWheelView *)self identifierToSelectionMarkerView];
  [v14 setObject:v15 forKeyedSubscript:v6];

  [(SFMagicHeadWheelView *)self setNeedsLayout];
}

- (void)lostSelectedNode
{
}

- (BOOL)updateSelectedNode:(id)a3
{
  id v4 = a3;
  id v5 = [(SFMagicHeadWheelView *)self selectedHead];
  id v6 = [v5 node];
  float v7 = [v6 realName];
  float v8 = [v4 realName];
  id v9 = v7;
  id v10 = v8;
  double v11 = v10;
  if (v9 == v10)
  {
    uint64_t v12 = 1;
  }
  else if ((v9 == 0) == (v10 != 0))
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [v9 isEqual:v10];
  }

  BOOL v13 = [(SFMagicHeadWheelView *)self configureSelectedHeadWithNode:v4 slotNode:0 isSameAsSelected:v12];
  return v13;
}

- (BOOL)updateSelectedSlotNode:(id)a3
{
  id v4 = a3;
  id v5 = [(SFMagicHeadWheelView *)self selectedHead];
  id v6 = [v5 slotNode];
  float v7 = [v6 identifier];
  float v8 = [v4 identifier];
  id v9 = v7;
  id v10 = v8;
  double v11 = v10;
  if (v9 == v10)
  {
    uint64_t v12 = 1;
  }
  else if ((v9 == 0) == (v10 != 0))
  {
    uint64_t v12 = 0;
  }
  else
  {
    uint64_t v12 = [v9 isEqual:v10];
  }

  BOOL v13 = [(SFMagicHeadWheelView *)self configureSelectedHeadWithNode:0 slotNode:v4 isSameAsSelected:v12];
  return v13;
}

- (BOOL)configureSelectedHeadWithNode:(id)a3 slotNode:(id)a4 isSameAsSelected:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v8 = (uint64_t)a3;
  id v9 = a4;
  unint64_t v10 = (unint64_t)v9;
  if (!v9) {
    id v9 = (id)v8;
  }
  uint64_t v11 = [v9 selectionReason];
  if (v11 == 2)
  {
    if (!v5)
    {
      uint64_t v12 = magic_head_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21DB23000, v12, OS_LOG_TYPE_DEFAULT, "Selection can change due to CozyUp", buf, 2u);
      }
    }
    id v13 = 0;
    goto LABEL_16;
  }
  id v35 = 0;
  BOOL v14 = [(SFMagicHeadWheelView *)self canChangeSelectionWithDescription:&v35];
  id v13 = v35;
  if (v14)
  {
    if (v11 == 1)
    {
      if (v5)
      {
        int v15 = [(SFMagicHeadWheelView *)self selectedHead];
        char v16 = [v15 pointedAt];

        if ((v16 & 1) == 0)
        {
          BOOL v17 = magic_head_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[SFMagicHeadWheelView configureSelectedHeadWithNode:slotNode:isSameAsSelected:](v8, v17);
          }

          double v18 = [(SFMagicHeadWheelView *)self selectedHead];
          [v18 setPointedAt:1];

          [(SFMagicHeadWheelView *)self pulseSelectedHead];
          [(SFMagicHeadWheelView *)self triggerReSelectedHaptic];
          id v19 = [(SFMagicHeadWheelView *)self selectedHead];
          double v20 = [v19 nodeIdentifier];
          double v21 = [(SFMagicHeadWheelView *)self rotationSpringProperty];
          [v21 input];
          [(SFMagicHeadWheelView *)self setMarkerViewForIdentifier:v20 atPositionDegree:-v22];

          [(SFMagicHeadWheelView *)self transitionToGuidanceState:2];
        }
      }
      goto LABEL_20;
    }
LABEL_16:
    double v23 = [(SFMagicHeadWheelView *)self selectedHead];
    int v24 = [v23 pointedAt];

    if (v24)
    {
      double v25 = magic_head_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[SFMagicHeadWheelView configureSelectedHeadWithNode:slotNode:isSameAsSelected:](v25);
      }

      v26 = [(SFMagicHeadWheelView *)self selectedHead];
      [v26 setPointedAt:0];
    }
LABEL_20:
    if (v8 | v10)
    {
      double v27 = [SFMagicHead alloc];
      [(SFMagicHeadWheelView *)self radius];
      double v29 = v28;
      long long v30 = [(SFMagicHeadWheelView *)self settings];
      uint64_t v31 = [(SFMagicHead *)v27 initWithNode:v8 slotNode:v10 containerRadius:self delegate:v30 settings:v29];
      BOOL v32 = [(SFMagicHeadWheelView *)self updateSelectedHead:v31];
    }
    else
    {
      BOOL v32 = !v5;
    }
    goto LABEL_26;
  }
  CGAffineTransform v33 = magic_head_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
    -[SFMagicHeadWheelView configureSelectedHeadWithNode:slotNode:isSameAsSelected:]((uint64_t)v13, v33);
  }

  BOOL v32 = 0;
LABEL_26:

  return v32;
}

- (void)pulseSelectedHead
{
  double v3 = [(SFMagicHeadWheelView *)self settings];
  int v4 = [v3 selectedPulseEnabled];

  if (v4)
  {
    BOOL v5 = [(SFMagicHeadWheelView *)self selectionAnimator];
    char v6 = [v5 isRunning];

    if ((v6 & 1) == 0)
    {
      float v7 = [(SFMagicHeadWheelView *)self settings];
      [v7 selectedPulseScaleAmount];
      uint64_t v9 = v8;

      unint64_t v10 = (void *)MEMORY[0x263F82E00];
      uint64_t v11 = [(SFMagicHeadWheelView *)self settings];
      [v11 selectedPulseDurationS];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __41__SFMagicHeadWheelView_pulseSelectedHead__block_invoke;
      v19[3] = &unk_264471E70;
      v19[4] = self;
      v19[5] = v9;
      objc_msgSend(v10, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v19, 0);

      uint64_t v12 = (void *)MEMORY[0x263F82E00];
      id v13 = [(SFMagicHeadWheelView *)self settings];
      [v13 selectedPulseDurationS];
      double v15 = v14;
      char v16 = [(SFMagicHeadWheelView *)self settings];
      [v16 selectedPulseDurationS];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __41__SFMagicHeadWheelView_pulseSelectedHead__block_invoke_2;
      v18[3] = &unk_264471EE0;
      v18[4] = self;
      [v12 animateWithDuration:0 delay:v18 usingSpringWithDamping:0 initialSpringVelocity:v15 options:v17 * 0.5 animations:0.6 completion:0.0];
    }
  }
}

void __41__SFMagicHeadWheelView_pulseSelectedHead__block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) selectedHead];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

void __41__SFMagicHeadWheelView_pulseSelectedHead__block_invoke_2(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) selectedHead];
  long long v2 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v3[0] = *MEMORY[0x263F000D0];
  v3[1] = v2;
  v3[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [v1 setTransform:v3];
}

- (BOOL)updateSelectedHead:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v5 = a3;
  p_selectedHead = &self->_selectedHead;
  float v7 = [(SFMagicHead *)self->_selectedHead nodeIdentifier];
  uint64_t v8 = [v5 nodeIdentifier];
  id v9 = v7;
  id v10 = v8;
  uint64_t v11 = v10;
  if (v9 == v10)
  {
    int v12 = 1;
  }
  else if ((v9 == 0) == (v10 != 0))
  {
    int v12 = 0;
  }
  else
  {
    int v12 = [v9 isEqual:v10];
  }

  id v13 = [(SFMagicHead *)*p_selectedHead slotNode];
  int v14 = [v13 avatarImageSlotID];
  double v15 = [v5 slotNode];
  int v16 = [v15 avatarImageSlotID];

  if ((!v12 || v14 != v16)
    && [(SFMagicHeadWheelView *)self transitionToGuidanceState:1])
  {
    double v17 = *p_selectedHead;
    objc_storeStrong((id *)&self->_selectedHead, a3);
    double v18 = magic_head_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(SFMagicHead *)*p_selectedHead node];
      int v34 = 138412290;
      id v35 = v19;
      _os_log_impl(&dword_21DB23000, v18, OS_LOG_TYPE_DEFAULT, "Selecting %@", (uint8_t *)&v34, 0xCu);
    }
    if (*p_selectedHead)
    {
      double v20 = [v5 nodeIdentifier];
      double v21 = [(SFMagicHeadWheelView *)self rotationSpringProperty];
      [v21 input];
      [(SFMagicHeadWheelView *)self setMarkerViewForIdentifier:v20 atPositionDegree:-v22];

      [(SFMagicHead *)*p_selectedHead setUserInteractionEnabled:0];
      double v23 = [(SFMagicHeadWheelView *)self contentView];
      [v23 addSubview:*p_selectedHead];

      [(SFMagicHeadWheelView *)self centerOfContentBounds];
      -[SFMagicHead setCenter:](*p_selectedHead, "setCenter:");
      int v24 = [(SFMagicHead *)*p_selectedHead slotNode];
      double v25 = *p_selectedHead;
      if (v24) {
        [(SFMagicHead *)v25 slotNode];
      }
      else {
      double v29 = [(SFMagicHead *)v25 node];
      }
      uint64_t v30 = [v29 selectionReason];

      if (v30 != 1)
      {
        uint64_t v31 = [(SFMagicHeadWheelView *)self settings];
        int v32 = [v31 hapticForCozyUpSelectionEnabled];

        if (v32) {
          [(SFMagicHeadWheelView *)self triggerSelectedHaptic];
        }
        [(SFMagicHeadWheelView *)self cozyUpAnimationForHead:v5];
        goto LABEL_23;
      }
      [(SFMagicHeadWheelView *)self triggerSelectedHaptic];
      double v27 = self;
      id v28 = v5;
    }
    else
    {
      double v27 = self;
      id v28 = 0;
    }
    [(SFMagicHeadWheelView *)v27 selectAnimationForHead:v28 withDismissHead:v17];
LABEL_23:

    BOOL v26 = 1;
    goto LABEL_24;
  }
  BOOL v26 = 0;
LABEL_24:

  return v26;
}

- (void)updateSelectionControlState
{
  BOOL v3 = [(SFMagicHeadWheelView *)self inGuidanceStates];
  CGAffineTransform v4 = [(SFMagicHeadWheelView *)self selectedHeadControl];
  id v5 = v4;
  if (v3)
  {
    [v4 setEnabled:0];

    [(SFMagicHeadWheelView *)self selectedHeadHightlightCancel];
  }
  else
  {
    [v4 setEnabled:1];
  }
}

- (void)selectedHeadHighlighted
{
  id v2 = [(SFMagicHeadWheelView *)self selectedHead];
  [v2 setHighlighted:1];
}

- (void)selectedHeadHightlightCancel
{
  id v2 = [(SFMagicHeadWheelView *)self selectedHead];
  [v2 setHighlighted:0];
}

- (void)selectedHeadTapped
{
  BOOL v3 = [(SFMagicHeadWheelView *)self selectedHead];
  id v5 = [v3 node];

  if (v5)
  {
    CGAffineTransform v4 = [(SFMagicHeadWheelView *)self delegate];
    [v4 magicHeadSelectedNodeTapped:v5];

    [(SFMagicHeadWheelView *)self selectedHeadHightlightCancel];
  }
}

- (void)cozyUpAnimationForHead:(id)a3
{
  id v4 = a3;
  id v5 = [(SFMagicHeadWheelView *)self settings];
  [v4 setPosition:1];
  if ([v5 cozyUpAnimationEnabled])
  {
    [v4 setSize:0];
    char v6 = objc_opt_new();
    [(SFMagicHeadWheelView *)self setSelectionAnimator:v6];

    float v7 = [(SFMagicHeadWheelView *)self placeHolderView];
    uint64_t v8 = [(SFMagicHeadWheelView *)self selectionAnimator];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke;
    v18[3] = &unk_264471F30;
    id v19 = v5;
    id v20 = v4;
    id v9 = v7;
    id v21 = v9;
    [v8 addAnimations:v18];

    id location = 0;
    objc_initWeak(&location, self);
    selectionAnimator = self->_selectionAnimator;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke_3;
    v15[3] = &unk_264471F58;
    objc_copyWeak(&v16, &location);
    [(UIViewPropertyAnimator *)selectionAnimator addCompletion:v15];
    uint64_t v11 = [(SFMagicHeadWheelView *)self delegate];
    int v12 = [(SFMagicHeadWheelView *)self selectedHead];
    id v13 = [v12 node];
    [v11 magicHeadChangedSelectionToNode:v13];

    int v14 = [(SFMagicHeadWheelView *)self selectionAnimator];
    [v14 startAnimation];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    [v4 setSize:2];
  }
}

void __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke(id *a1)
{
  id v2 = (void *)MEMORY[0x263F82E00];
  [a1[4] cozyUpSelectDurationS];
  double v4 = v3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke_2;
  v5[3] = &unk_264471F08;
  id v6 = a1[5];
  id v7 = a1[6];
  [v2 animateWithDuration:v5 animations:v4];
}

uint64_t __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setSize:2];
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

void __47__SFMagicHeadWheelView_cozyUpAnimationForHead___block_invoke_3(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained transitionToGuidanceState:2];
  }
}

- (void)selectAnimationForHead:(id)a3 withDismissHead:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SFMagicHeadWheelView *)self settings];
  if (v7)
  {
    id v9 = [(SFMagicHeadWheelView *)self identifierToSelectionMarkerView];
    id v10 = [v7 nodeIdentifier];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];
    [v11 currentOffset];
    uint64_t v13 = v12;
  }
  else
  {
    uint64_t v13 = 0;
  }
  [v6 setSize:1];
  [v6 setPosition:0];
  [v6 setAlpha:0.0];
  int v14 = objc_opt_new();
  [(SFMagicHeadWheelView *)self setSelectionAnimator:v14];

  double v15 = [(SFMagicHeadWheelView *)self placeHolderView];
  id v16 = [(SFMagicHeadWheelView *)self selectionAnimator];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke;
  v32[3] = &unk_264471F80;
  id v17 = v6;
  id v33 = v17;
  uint64_t v37 = 0x4077D00000000000;
  id v18 = v8;
  id v34 = v18;
  id v19 = v15;
  id v35 = v19;
  id v20 = v7;
  id v36 = v20;
  uint64_t v38 = v13;
  [v16 addAnimations:v32];

  id location = 0;
  objc_initWeak(&location, self);
  selectionAnimator = self->_selectionAnimator;
  uint64_t v26 = MEMORY[0x263EF8330];
  uint64_t v27 = 3221225472;
  id v28 = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_9;
  double v29 = &unk_264471F58;
  objc_copyWeak(&v30, &location);
  [(UIViewPropertyAnimator *)selectionAnimator addCompletion:&v26];
  double v22 = [(SFMagicHeadWheelView *)self delegate];
  double v23 = [(SFMagicHeadWheelView *)self selectedHead];
  int v24 = [v23 node];
  [v22 magicHeadChangedSelectionToNode:v24];

  double v25 = [(SFMagicHeadWheelView *)self selectionAnimator];
  [v25 startAnimation];

  objc_destroyWeak(&v30);
  objc_destroyWeak(&location);
}

void __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = (void *)MEMORY[0x263F82E00];
    double v3 = *(double *)(a1 + 64);
    [*(id *)(a1 + 40) selectionPositionFriction];
    double v5 = v4;
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_2;
    v45[3] = &unk_264471EE0;
    id v46 = *(id *)(a1 + 48);
    [v2 _animateUsingSpringWithTension:1 friction:v45 interactive:0 animations:v3 completion:v5];
    id v6 = (void *)MEMORY[0x263F82E00];
    double v7 = *(double *)(a1 + 64);
    [*(id *)(a1 + 40) selectionScaleFriction];
    double v9 = v8;
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_3;
    v43[3] = &unk_264471EE0;
    id v44 = *(id *)(a1 + 32);
    [v6 _animateUsingSpringWithTension:1 friction:v43 interactive:0 animations:v7 completion:v9];
    id v10 = (void *)MEMORY[0x263F82E00];
    double v11 = *(double *)(a1 + 64);
    [*(id *)(a1 + 40) selectionAlphaFriction];
    double v13 = v12;
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_4;
    v41[3] = &unk_264471EE0;
    id v42 = *(id *)(a1 + 32);
    [v10 _animateUsingSpringWithTension:1 friction:v41 interactive:0 animations:v11 completion:v13];
    int v14 = (void *)MEMORY[0x263F82E00];
    double v15 = *(double *)(a1 + 64);
    [*(id *)(a1 + 40) selectionPositionFriction];
    double v17 = v16;
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    v39[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_5;
    v39[3] = &unk_264471EE0;
    id v40 = *(id *)(a1 + 32);
    [v14 _animateUsingSpringWithTension:1 friction:v39 interactive:0 animations:v15 completion:v17];
  }
  else
  {
    [*(id *)(a1 + 48) setAlpha:1.0];
  }
  if (*(void *)(a1 + 56))
  {
    id v18 = (void *)MEMORY[0x263F82E00];
    double v19 = *(double *)(a1 + 64);
    [*(id *)(a1 + 40) dismissScaleFriction];
    double v21 = v20;
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_6;
    v37[3] = &unk_264471EE0;
    id v38 = *(id *)(a1 + 56);
    [v18 _animateUsingSpringWithTension:1 friction:v37 interactive:0 animations:v19 completion:v21];
    double v22 = (void *)MEMORY[0x263F82E00];
    double v23 = *(double *)(a1 + 64);
    [*(id *)(a1 + 40) dismissAlphaFriction];
    double v25 = v24;
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    v33[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_7;
    v33[3] = &unk_264471F30;
    id v34 = *(id *)(a1 + 56);
    id v35 = *(id *)(a1 + 32);
    id v36 = *(id *)(a1 + 48);
    [v22 _animateUsingSpringWithTension:1 friction:v33 interactive:0 animations:v23 completion:v25];
    uint64_t v26 = (void *)MEMORY[0x263F82E00];
    double v27 = *(double *)(a1 + 64);
    [*(id *)(a1 + 40) dismissPositionFriction];
    double v29 = v28;
    v30[0] = MEMORY[0x263EF8330];
    v30[1] = 3221225472;
    v30[2] = __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_8;
    v30[3] = &unk_264471E70;
    id v31 = *(id *)(a1 + 56);
    uint64_t v32 = *(void *)(a1 + 72);
    [v26 _animateUsingSpringWithTension:1 friction:v30 interactive:0 animations:v27 completion:v29];
  }
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSize:2];
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPosition:1];
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) setSize:0];
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_7(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) setAlpha:0.0];
  if (!*(void *)(a1 + 40))
  {
    double v3 = *(void **)(a1 + 48);
    return [v3 setAlpha:1.0];
  }
  return result;
}

uint64_t __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_8(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPositionDegreeOffsetWithOffset:*(double *)(a1 + 40)];
}

void __63__SFMagicHeadWheelView_selectAnimationForHead_withDismissHead___block_invoke_9(uint64_t a1, uint64_t a2)
{
  if (!a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained transitionToGuidanceState:2];
  }
}

- (void)hideSelection:(BOOL)a3
{
  double v5 = [(SFMagicHeadWheelView *)self selectedHead];

  if (v5)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __38__SFMagicHeadWheelView_hideSelection___block_invoke;
    v8[3] = &unk_264471FA8;
    v8[4] = self;
    BOOL v9 = a3;
    [MEMORY[0x263F82E00] performWithoutAnimation:v8];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__SFMagicHeadWheelView_hideSelection___block_invoke_2;
    v6[3] = &unk_264471FA8;
    v6[4] = self;
    BOOL v7 = a3;
    [MEMORY[0x263F82E00] animateWithDuration:v6 animations:0.2];
  }
}

void __38__SFMagicHeadWheelView_hideSelection___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  id v2 = [*(id *)(a1 + 32) placeHolderView];
  [v2 setAlpha:v1];
}

void __38__SFMagicHeadWheelView_hideSelection___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v1 = 0.0;
  }
  else {
    double v1 = 1.0;
  }
  id v2 = [*(id *)(a1 + 32) selectedHead];
  [v2 setAlpha:v1];
}

- (void)hideDots:(BOOL)a3 withAnimationDuration:(double)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SFMagicHeadWheelView_hideDots_withAnimationDuration___block_invoke;
  v4[3] = &unk_264471FA8;
  v4[4] = self;
  BOOL v5 = a3;
  [MEMORY[0x263F82E00] animateWithDuration:v4 animations:a4];
}

void __55__SFMagicHeadWheelView_hideDots_withAnimationDuration___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) dots];
  double v2 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  double v3 = [NSNumber numberWithDouble:v2];
  [v4 setValue:v3 forKey:@"alpha"];
}

- (void)scaleDots:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __34__SFMagicHeadWheelView_scaleDots___block_invoke;
  _OWORD v3[3] = &unk_264471FA8;
  BOOL v4 = a3;
  v3[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v3 usingSpringWithDamping:0 initialSpringVelocity:0.7 options:0.0 animations:0.6 completion:0.0];
}

void __34__SFMagicHeadWheelView_scaleDots___block_invoke(uint64_t a1)
{
  double v2 = 0.5;
  if (!*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  CGAffineTransformMakeScale(&v5, v2, v2);
  double v3 = [*(id *)(a1 + 32) dotsContainer];
  CGAffineTransform v4 = v5;
  [v3 setTransform:&v4];
}

- (void)updatePlaceHolderView
{
  int64_t v3 = [(SFMagicHeadWheelView *)self guidanceState];
  if ([(SFMagicHeadWheelView *)self inGuidanceStates])
  {
    BOOL v4 = 1;
  }
  else
  {
    CGAffineTransform v5 = [(SFMagicHeadWheelView *)self selectedHead];
    BOOL v4 = v5 != 0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SFMagicHeadWheelView_updatePlaceHolderView__block_invoke;
  v6[3] = &unk_264471FD0;
  v6[4] = self;
  BOOL v7 = v3 == 4;
  BOOL v8 = v4;
  [MEMORY[0x263F82E00] animateWithDuration:v6 animations:0.4];
}

void __45__SFMagicHeadWheelView_updatePlaceHolderView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) placeHolderView];
  objc_msgSend(v2, "setTiltedTooFarColor:useRaiseLabel:useNoUWBCapableLabel:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41), objc_msgSend(*(id *)(a1 + 32), "noUWBCapableDevices"));
}

- (void)magicHead:(id)a3 requestingSubtitleTextChangeForState:(int64_t)a4
{
  id v6 = a3;
  BOOL v7 = [(SFMagicHeadWheelView *)self selectedHead];
  id v10 = v6;
  id v8 = v7;
  if (v8 == v10)
  {

    goto LABEL_6;
  }
  if ((v10 == 0) == (v8 != 0))
  {

    goto LABEL_8;
  }
  int v9 = [v10 isEqual:v8];

  if (v9)
  {
LABEL_6:
    id v8 = [(SFMagicHeadWheelView *)self delegate];
    [v8 magicHeadSelectedHeadRequestingSubtitleTextChangeForState:a4];
LABEL_8:
  }
}

- (void)magicHeadDidStartTransferForHead:(id)a3
{
  id v4 = a3;
  id v6 = [(SFMagicHeadWheelView *)self delegate];
  CGAffineTransform v5 = [v4 node];

  [v6 magicHeadDidStartTransferForNode:v5];
}

- (void)magicHeadDidTerminateTransferForHead:(id)a3
{
  id v4 = a3;
  id v6 = [(SFMagicHeadWheelView *)self delegate];
  CGAffineTransform v5 = [v4 node];

  [v6 magicHeadDidTerminateTransferForNode:v5];
}

- (void)magicHeadDidFinishTransferForHead:(id)a3
{
  id v4 = a3;
  id v6 = [(SFMagicHeadWheelView *)self delegate];
  CGAffineTransform v5 = [v4 node];

  [v6 magicHeadDidFinishTransferForNode:v5];
}

- (void)stopSuppressGuidanceHapticsTimer
{
  suppressGuidanceHapticsTimer = self->_suppressGuidanceHapticsTimer;
  if (suppressGuidanceHapticsTimer)
  {
    CGAffineTransform v5 = suppressGuidanceHapticsTimer;
    dispatch_source_cancel(v5);
    id v4 = self->_suppressGuidanceHapticsTimer;
    self->_suppressGuidanceHapticsTimer = 0;
  }
}

- (void)startSuppressGuidanceHapticsTimer
{
  [(SFMagicHeadWheelView *)self stopSuppressGuidanceHapticsTimer];
  dispatch_source_t v3 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
  [(SFMagicHeadWheelView *)self setSuppressGuidanceHapticsTimer:v3];

  id v4 = [(SFMagicHeadWheelView *)self settings];
  [v4 guidanceSuppressHapticsDurationS];
  unint64_t v6 = (unint64_t)v5;

  unint64_t v7 = 1000000000 * v6;
  id v8 = [(SFMagicHeadWheelView *)self suppressGuidanceHapticsTimer];
  dispatch_time_t v9 = dispatch_time(0, v7);
  dispatch_source_set_timer(v8, v9, v7, v7 >> 2);

  id v10 = [(SFMagicHeadWheelView *)self suppressGuidanceHapticsTimer];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __57__SFMagicHeadWheelView_startSuppressGuidanceHapticsTimer__block_invoke;
  handler[3] = &unk_264471EE0;
  handler[4] = self;
  dispatch_source_set_event_handler(v10, handler);

  double v11 = [(SFMagicHeadWheelView *)self suppressGuidanceHapticsTimer];
  dispatch_resume(v11);
}

uint64_t __57__SFMagicHeadWheelView_startSuppressGuidanceHapticsTimer__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopSuppressGuidanceHapticsTimer];
}

- (void)hapticsForHideDots:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(SFMagicHeadWheelView *)self settings];
  [v5 guidanceSuppressHapticsEnabled];
  double v7 = v6;

  if (v7 == 0.0)
  {
    if (v3)
    {
LABEL_7:
      [(SFMagicHeadWheelView *)self triggerContractDotsHaptic];
      return;
    }
  }
  else
  {
    id v8 = [(SFMagicHeadWheelView *)self suppressGuidanceHapticsTimer];

    if (v8) {
      return;
    }
    if (v3) {
      goto LABEL_7;
    }
    [(SFMagicHeadWheelView *)self startSuppressGuidanceHapticsTimer];
  }
  [(SFMagicHeadWheelView *)self triggerExpandDotsHaptic];
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)noUWBCapableDevices
{
  return self->_noUWBCapableDevices;
}

- (SFMagicHeadSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
}

- (SFMagicHeadWheelViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SFMagicHeadWheelViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUUID)nodeIdentifier
{
  return self->_nodeIdentifier;
}

- (SFMagicHead)selectedHead
{
  return self->_selectedHead;
}

- (void)setSelectedHead:(id)a3
{
}

- (BOOL)isMagicHead
{
  return self->_magicHead;
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (int64_t)guidanceState
{
  return self->_guidanceState;
}

- (void)setGuidanceState:(int64_t)a3
{
  self->_guidanceState = a3;
}

- (int64_t)rotationState
{
  return self->_rotationState;
}

- (void)setRotationState:(int64_t)a3
{
  self->_rotationState = a3;
}

- (BOOL)rotatedAfterSelectionWasMade
{
  return self->_rotatedAfterSelectionWasMade;
}

- (void)setRotatedAfterSelectionWasMade:(BOOL)a3
{
  self->_rotatedAfterSelectionWasMade = a3;
}

- (double)radius
{
  return self->_radius;
}

- (void)setRadius:(double)a3
{
  self->_radius = a3;
}

- (UIView)contentView
{
  return (UIView *)objc_getProperty(self, a2, 472, 1);
}

- (void)setContentView:(id)a3
{
}

- (UIImageView)canChangeSelectionView
{
  return (UIImageView *)objc_getProperty(self, a2, 480, 1);
}

- (void)setCanChangeSelectionView:(id)a3
{
}

- (UIVisualEffectView)dotsContainer
{
  return (UIVisualEffectView *)objc_getProperty(self, a2, 488, 1);
}

- (void)setDotsContainer:(id)a3
{
}

- (unint64_t)numberOfDots
{
  return self->_numberOfDots;
}

- (void)setNumberOfDots:(unint64_t)a3
{
  self->_numberOfDots = a3;
}

- (double)dotsRadius
{
  return self->_dotsRadius;
}

- (void)setDotsRadius:(double)a3
{
  self->_dotsRadius = a3;
}

- (UIColor)dotsColor
{
  return (UIColor *)objc_getProperty(self, a2, 512, 1);
}

- (void)setDotsColor:(id)a3
{
}

- (UIControl)selectedHeadControl
{
  return (UIControl *)objc_getProperty(self, a2, 520, 1);
}

- (void)setSelectedHeadControl:(id)a3
{
}

- (NSMutableDictionary)identifierToSelectionMarkerView
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 528, 1);
}

- (void)setIdentifierToSelectionMarkerView:(id)a3
{
}

- (SFMagicHeadPlaceholderView)placeHolderView
{
  return (SFMagicHeadPlaceholderView *)objc_getProperty(self, a2, 536, 1);
}

- (void)setPlaceHolderView:(id)a3
{
}

- (OS_dispatch_source)suppressGuidanceHapticsTimer
{
  return (OS_dispatch_source *)objc_getProperty(self, a2, 544, 1);
}

- (void)setSuppressGuidanceHapticsTimer:(id)a3
{
}

- (int64_t)proposedRotationState
{
  return self->_proposedRotationState;
}

- (void)setProposedRotationState:(int64_t)a3
{
  self->_proposedRotationState = a3;
}

- (int64_t)consecutiveRotationChangeRequests
{
  return self->_consecutiveRotationChangeRequests;
}

- (void)setConsecutiveRotationChangeRequests:(int64_t)a3
{
  self->_consecutiveRotationChangeRequests = a3;
}

- (SFFloatSpringProperty)rotationSpringProperty
{
  return (SFFloatSpringProperty *)objc_getProperty(self, a2, 568, 1);
}

- (void)setRotationSpringProperty:(id)a3
{
}

- (SFFloatSpringProperty)pitchSpringProperty
{
  return (SFFloatSpringProperty *)objc_getProperty(self, a2, 576, 1);
}

- (void)setPitchSpringProperty:(id)a3
{
}

- (SFFloatSpringProperty)rollSpringProperty
{
  return (SFFloatSpringProperty *)objc_getProperty(self, a2, 584, 1);
}

- (void)setRollSpringProperty:(id)a3
{
}

- (double)previousAngle
{
  return self->_previousAngle;
}

- (void)setPreviousAngle:(double)a3
{
  self->_previousAngle = a3;
}

- (NSMutableArray)dots
{
  return (NSMutableArray *)objc_getProperty(self, a2, 600, 1);
}

- (void)setDots:(id)a3
{
}

- (UIViewPropertyAnimator)selectionAnimator
{
  return (UIViewPropertyAnimator *)objc_getProperty(self, a2, 608, 1);
}

- (void)setSelectionAnimator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectionAnimator, 0);
  objc_storeStrong((id *)&self->_dots, 0);
  objc_storeStrong((id *)&self->_rollSpringProperty, 0);
  objc_storeStrong((id *)&self->_pitchSpringProperty, 0);
  objc_storeStrong((id *)&self->_rotationSpringProperty, 0);
  objc_storeStrong((id *)&self->_suppressGuidanceHapticsTimer, 0);
  objc_storeStrong((id *)&self->_placeHolderView, 0);
  objc_storeStrong((id *)&self->_identifierToSelectionMarkerView, 0);
  objc_storeStrong((id *)&self->_selectedHeadControl, 0);
  objc_storeStrong((id *)&self->_dotsColor, 0);
  objc_storeStrong((id *)&self->_dotsContainer, 0);
  objc_storeStrong((id *)&self->_canChangeSelectionView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_selectedHead, 0);
  objc_storeStrong((id *)&self->_nodeIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)configureSelectedHeadWithNode:(os_log_t)log slotNode:isSameAsSelected:.cold.1(os_log_t log)
{
  *(_WORD *)double v1 = 0;
  _os_log_debug_impl(&dword_21DB23000, log, OS_LOG_TYPE_DEBUG, "No longer pointing at anyone", v1, 2u);
}

- (void)configureSelectedHeadWithNode:(uint64_t)a1 slotNode:(NSObject *)a2 isSameAsSelected:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21DB23000, a2, OS_LOG_TYPE_DEBUG, "Re-pointing at selected person %@", (uint8_t *)&v2, 0xCu);
}

- (void)configureSelectedHeadWithNode:(uint64_t)a1 slotNode:(NSObject *)a2 isSameAsSelected:.cold.3(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_21DB23000, a2, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v2, 0xCu);
}

@end