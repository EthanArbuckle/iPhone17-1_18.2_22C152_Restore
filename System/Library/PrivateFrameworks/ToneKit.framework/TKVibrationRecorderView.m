@interface TKVibrationRecorderView
- (BOOL)vibrationRecorderTouchSurfaceDidEnterRecordingMode:(id)a3;
- (TKVibrationRecorderView)initWithVibrationPatternMaximumDuration:(double)a3;
- (TKVibrationRecorderViewDelegate)delegate;
- (id)_titleForControlsToolbarButtonWithIdentifier:(int)a3;
- (void)_enterWaitingModeWithAnimation:(BOOL)a3 enablePlayButton:(BOOL)a4;
- (void)_exitWaitingModeWithAnimation:(BOOL)a3;
- (void)_handleLeftButtonTapped:(id)a3;
- (void)_handleRightButtonTapped:(id)a3;
- (void)_handleScreenPeripheryInsetsDidChangeNotification:(id)a3;
- (void)_setLeftButtonIdentifier:(int)a3 enabled:(BOOL)a4 rightButtonIdentifier:(int)a5 enabled:(BOOL)a6 animated:(BOOL)a7;
- (void)_updateBottomLineToolbarForPeripheryInsetsChange;
- (void)_updateProgress:(id)a3;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)enterRecordingMode;
- (void)enterReplayModeWithVibrationPattern:(id)a3;
- (void)exitRecordingModeWithPlayButtonEnabled:(BOOL)a3;
- (void)exitReplayMode;
- (void)safeAreaInsetsDidChange;
- (void)setDelegate:(id)a3;
- (void)startAnimatingProgress;
- (void)stopAnimatingProgress;
- (void)vibrationComponentDidEndForVibrationRecorderTouchSurface:(id)a3;
- (void)vibrationComponentDidStartForVibrationRecorderTouchSurface:(id)a3;
- (void)vibrationRecorderTouchSurface:(id)a3 didExitRecordingModeWithContextObject:(id)a4;
- (void)vibrationRecorderTouchSurfaceDidFinishReplayingVibration:(id)a3;
@end

@implementation TKVibrationRecorderView

- (TKVibrationRecorderView)initWithVibrationPatternMaximumDuration:(double)a3
{
  v70.receiver = self;
  v70.super_class = (Class)TKVibrationRecorderView;
  v4 = [(TKVibrationRecorderView *)&v70 init];
  v5 = v4;
  if (v4)
  {
    v4->_vibrationPatternMaximumDuration = a3;
    v6 = objc_alloc_init(TKStyleProvider);
    styleProvider = v5->_styleProvider;
    v5->_styleProvider = (TKVibrationRecorderStyleProvider *)v6;

    v8 = [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderBarsBackgroundColor];
    [(TKVibrationRecorderView *)v5 setBackgroundColor:v8];

    v9 = [(TKVibrationRecorderView *)v5 safeAreaLayoutGuide];
    v10 = (UIToolbar *)objc_alloc_init(MEMORY[0x263F1CAE0]);
    bottomLineToolbar = v5->_bottomLineToolbar;
    v5->_bottomLineToolbar = v10;

    [(UIToolbar *)v5->_bottomLineToolbar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TKVibrationRecorderView *)v5 addSubview:v5->_bottomLineToolbar];
    [(UIToolbar *)v5->_bottomLineToolbar intrinsicContentSize];
    uint64_t v13 = [(UIToolbar *)v5->_bottomLineToolbar tk_addedConstraintForLayoutAttribute:4 asEqualToValueOfItem:v9 withOffset:v12];
    bottomLineToolbarBottomConstraint = v5->_bottomLineToolbarBottomConstraint;
    v5->_bottomLineToolbarBottomConstraint = (NSLayoutConstraint *)v13;

    [(UIToolbar *)v5->_bottomLineToolbar tk_constrainLayoutAttribute:1 asEqualToValueOfItem:v5];
    [(UIToolbar *)v5->_bottomLineToolbar tk_constrainLayoutAttribute:2 asEqualToValueOfItem:v5];
    v15 = (UIToolbar *)objc_alloc_init(MEMORY[0x263F1CAE0]);
    controlsToolbar = v5->_controlsToolbar;
    v5->_controlsToolbar = v15;

    [(UIToolbar *)v5->_controlsToolbar setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TKVibrationRecorderView *)v5 addSubview:v5->_controlsToolbar];
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderControlsToolbarVerticalOffset];
    double v18 = v17;
    [(UIToolbar *)v5->_controlsToolbar intrinsicContentSize];
    double v20 = v19;
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderControlsToolbarAdditionalHeight];
    double v22 = v21;
    uint64_t v23 = [(UIToolbar *)v5->_controlsToolbar tk_addedConstraintForLayoutAttribute:4 asEqualToLayoutAttribute:3 ofItem:v5->_bottomLineToolbar withOffset:v18];
    controlsToolbarTopConstraint = v5->_controlsToolbarTopConstraint;
    v5->_controlsToolbarTopConstraint = (NSLayoutConstraint *)v23;

    [(UIToolbar *)v5->_controlsToolbar tk_constrainLayoutAttribute:1 asEqualToValueOfItem:v5];
    [(UIToolbar *)v5->_controlsToolbar tk_constrainLayoutAttribute:2 asEqualToValueOfItem:v5];
    [(UIToolbar *)v5->_controlsToolbar tk_constrainLayoutAttribute:8 asEqualToConstant:v20 + v22];
    id v25 = objc_alloc_init(MEMORY[0x263F1CAE0]);
    [v25 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TKVibrationRecorderView *)v5 addSubview:v25];
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderProgressToolbarVerticalOffset];
    double v27 = v26;
    [v25 intrinsicContentSize];
    double v29 = v28;
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderProgressToolbarAdditionalHeight];
    double v31 = v30;
    uint64_t v32 = objc_msgSend(v25, "tk_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofItem:withOffset:", 4, 3, v5->_controlsToolbar, v27);
    progressToolbarBottomConstraint = v5->_progressToolbarBottomConstraint;
    v5->_progressToolbarBottomConstraint = (NSLayoutConstraint *)v32;

    objc_msgSend(v25, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 1, v5);
    objc_msgSend(v25, "tk_constrainLayoutAttribute:asEqualToValueOfItem:", 2, v5);
    objc_msgSend(v25, "tk_constrainLayoutAttribute:asEqualToConstant:", 8, v29 + v31);
    v34 = [[TKVibrationRecorderProgressView alloc] initWithMaximumTimeInterval:v5->_styleProvider styleProvider:a3];
    progressView = v5->_progressView;
    v5->_progressView = v34;

    [(TKVibrationRecorderProgressView *)v5->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TKVibrationRecorderView *)v5 addSubview:v5->_progressView];
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderProgressViewHorizontalOffsetFromEdge];
    double v37 = v36;
    -[UIView tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:](v5->_progressView, "tk_constrainLayoutAttribute:asEqualToValueOfItem:withOffset:", 1, v9);
    [(UIView *)v5->_progressView tk_constrainLayoutAttribute:2 asEqualToValueOfItem:v9 withOffset:-v37];
    [(UIView *)v5->_progressView tk_constrainLayoutAttribute:10 asEqualToValueOfItem:v25];
    v38 = TLLocalizedString();
    v39 = [[TKVibrationRecorderTouchSurface alloc] initWithVibrationPatternMaximumDuration:v5->_styleProvider styleProvider:a3];
    touchSurface = v5->_touchSurface;
    v5->_touchSurface = v39;

    [(TKVibrationRecorderTouchSurface *)v5->_touchSurface setDelegate:v5];
    [(TKVibrationRecorderTouchSurface *)v5->_touchSurface setAccessibilityHint:v38];
    [(TKVibrationRecorderTouchSurface *)v5->_touchSurface setTranslatesAutoresizingMaskIntoConstraints:0];
    [(TKVibrationRecorderView *)v5 insertSubview:v5->_touchSurface belowSubview:v5->_bottomLineToolbar];
    [(UIView *)v5->_touchSurface tk_constrainLayoutAttribute:1 asEqualToValueOfItem:v5];
    [(UIView *)v5->_touchSurface tk_constrainLayoutAttribute:2 asEqualToValueOfItem:v5];
    uint64_t v41 = [(UIView *)v5->_touchSurface tk_addedConstraintForLayoutAttribute:3 asEqualToValueOfItem:v5];
    touchSurfaceTopConstraint = v5->_touchSurfaceTopConstraint;
    v5->_touchSurfaceTopConstraint = (NSLayoutConstraint *)v41;

    [(UIView *)v5->_touchSurface tk_constrainLayoutAttribute:4 asEqualToLayoutAttribute:3 ofItem:v25];
    v43 = v5->_touchSurface;
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderRippleFingerStillSpeed];
    -[TKVibrationRecorderRippleView setFingerStillSpeed:](v43, "setFingerStillSpeed:");
    v44 = v5->_touchSurface;
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderRippleFingerMovingSpeed];
    -[TKVibrationRecorderRippleView setFingerMovingSpeed:](v44, "setFingerMovingSpeed:");
    v45 = v5->_touchSurface;
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderRippleInitialRadius];
    -[TKVibrationRecorderRippleView setFirstRippleInitialRadius:](v45, "setFirstRippleInitialRadius:");
    v46 = v5->_touchSurface;
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderRippleFinalRadius];
    -[TKVibrationRecorderRippleView setFadeOutRadius:](v46, "setFadeOutRadius:");
    v47 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
    instructionsLabel = v5->_instructionsLabel;
    v5->_instructionsLabel = v47;

    [(UILabel *)v5->_instructionsLabel setTranslatesAutoresizingMaskIntoConstraints:0];
    v49 = v5->_instructionsLabel;
    v50 = [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderInstructionsLabelFont];
    [(UILabel *)v49 setFont:v50];

    v51 = v5->_instructionsLabel;
    v52 = [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderInstructionsLabelTextColor];
    [(UILabel *)v51 setTextColor:v52];

    v53 = v5->_instructionsLabel;
    v54 = [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderInstructionsLabelBackgroundColor];
    [(UILabel *)v53 setBackgroundColor:v54];

    [(UILabel *)v5->_instructionsLabel setText:v38];
    [(UILabel *)v5->_instructionsLabel setTextAlignment:1];
    [(UILabel *)v5->_instructionsLabel setLineBreakMode:0];
    [(UILabel *)v5->_instructionsLabel setNumberOfLines:0];
    [(UILabel *)v5->_instructionsLabel setUserInteractionEnabled:0];
    [(UILabel *)v5->_instructionsLabel setIsAccessibilityElement:0];
    [(TKVibrationRecorderView *)v5 addSubview:v5->_instructionsLabel];
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderInstructionsLabelEdgeInsets];
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    [(TKVibrationRecorderStyleProvider *)v5->_styleProvider vibrationRecorderInstructionsLabelPositionOffset];
    double v64 = v63;
    double v66 = v65;
    [(UILabel *)v5->_instructionsLabel tk_constrainLayoutAttribute:1 asGreaterThanOrEqualToValueOfItem:v9 withOffset:v58];
    [(UILabel *)v5->_instructionsLabel tk_constrainLayoutAttribute:2 asLessThanOrEqualToValueOfItem:v9 withOffset:-v62];
    [(UILabel *)v5->_instructionsLabel tk_constrainLayoutAttribute:3 asGreaterThanOrEqualToValueOfItem:v5 withOffset:v56];
    [(UILabel *)v5->_instructionsLabel tk_constrainLayoutAttribute:4 asLessThanOrEqualToValueOfItem:v5 withOffset:-v60];
    [(UILabel *)v5->_instructionsLabel tk_constrainLayoutAttribute:9 asEqualToValueOfItem:v5->_touchSurface withOffset:v64];
    [(UILabel *)v5->_instructionsLabel tk_constrainLayoutAttribute:10 asEqualToValueOfItem:v5->_touchSurface withOffset:v66];
    [(TKVibrationRecorderView *)v5 _enterWaitingModeWithAnimation:0 enablePlayButton:0];
    v67 = +[TKDisplayLinkManager currentDisplayLinkManager];
    [v67 beginRequiringWarmUpMode];

    v68 = [MEMORY[0x263F08A00] defaultCenter];
    [v68 addObserver:v5 selector:sel__handleScreenPeripheryInsetsDidChangeNotification_ name:*MEMORY[0x263F1D898] object:0];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263F1D898] object:0];

  v4 = +[TKDisplayLinkManager currentDisplayLinkManager];
  [v4 endRequiringWarmUpMode];

  [(TKVibrationRecorderTouchSurface *)self->_touchSurface setDelegate:0];
  v5.receiver = self;
  v5.super_class = (Class)TKVibrationRecorderView;
  [(TKVibrationRecorderView *)&v5 dealloc];
}

- (id)_titleForControlsToolbarButtonWithIdentifier:(int)a3
{
  return (id)TLLocalizedString();
}

- (void)_setLeftButtonIdentifier:(int)a3 enabled:(BOOL)a4 rightButtonIdentifier:(int)a5 enabled:(BOOL)a6 animated:(BOOL)a7
{
  BOOL v29 = a7;
  BOOL v7 = a6;
  uint64_t v8 = *(void *)&a5;
  BOOL v9 = a4;
  v30[5] = *MEMORY[0x263EF8340];
  self->_leftButtonIdentifier = a3;
  self->_rightButtonIdentifier = a5;
  v11 = -[TKVibrationRecorderView _titleForControlsToolbarButtonWithIdentifier:](self, "_titleForControlsToolbarButtonWithIdentifier:");
  double v12 = [(TKVibrationRecorderView *)self _titleForControlsToolbarButtonWithIdentifier:v8];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:v11 style:0 target:self action:sel__handleLeftButtonTapped_];
  [v13 setEnabled:v9];
  v14 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithTitle:v12 style:0 target:self action:sel__handleRightButtonTapped_];
  [v14 setEnabled:v7];
  [(TKVibrationRecorderView *)self safeAreaInsets];
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = objc_msgSend(MEMORY[0x263F1CB60], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[UIToolbar semanticContentAttribute](self->_controlsToolbar, "semanticContentAttribute"));
  [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderControlsToolbarItemsHorizontalOffsetFromEdge];
  double v21 = v20;
  double v22 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
  uint64_t v23 = v22;
  if (v19) {
    double v24 = v18;
  }
  else {
    double v24 = v16;
  }
  double v25 = v24 + v21;
  if (!v19) {
    double v16 = v18;
  }
  [v22 setWidth:v25];
  double v26 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:6 target:0 action:0];
  [v26 setWidth:v16 + v21];
  double v27 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
  v30[0] = v23;
  v30[1] = v13;
  v30[2] = v27;
  v30[3] = v14;
  v30[4] = v26;
  double v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v30 count:5];
  [(UIToolbar *)self->_controlsToolbar setItems:v28 animated:v29];
}

- (void)_handleLeftButtonTapped:(id)a3
{
  id v4 = [(TKVibrationRecorderView *)self delegate];
  [v4 vibrationRecorderView:self buttonTappedWithIdentifier:self->_leftButtonIdentifier];
}

- (void)_handleRightButtonTapped:(id)a3
{
  id v4 = [(TKVibrationRecorderView *)self delegate];
  [v4 vibrationRecorderView:self buttonTappedWithIdentifier:self->_rightButtonIdentifier];
}

- (void)_enterWaitingModeWithAnimation:(BOOL)a3 enablePlayButton:(BOOL)a4
{
  BOOL v5 = a3;
  if (a4) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = 2;
  }
  [(TKVibrationRecorderView *)self _setLeftButtonIdentifier:3 enabled:a4 rightButtonIdentifier:v7 enabled:a4 animated:a3];
  if (a4)
  {
    touchSurface = self->_touchSurface;
    TLLocalizedString();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
    [(TKVibrationRecorderTouchSurface *)touchSurface setAccessibilityHint:v12];
  }
  else
  {
    double v9 = 0.0;
    if (v5) {
      [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderInstructionsLabelFadeAnimationDuration];
    }
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __75__TKVibrationRecorderView__enterWaitingModeWithAnimation_enablePlayButton___block_invoke;
    v13[3] = &unk_2645898B8;
    v13[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v13 options:&__block_literal_global_2 animations:v9 completion:0.0];
    v10 = self->_touchSurface;
    v11 = [(UILabel *)self->_instructionsLabel text];
    [(TKVibrationRecorderTouchSurface *)v10 setAccessibilityHint:v11];
  }
}

uint64_t __75__TKVibrationRecorderView__enterWaitingModeWithAnimation_enablePlayButton___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:1.0];
}

- (void)_exitWaitingModeWithAnimation:(BOOL)a3
{
  double v4 = 0.0;
  if (a3) {
    [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderInstructionsLabelFadeAnimationDuration];
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __57__TKVibrationRecorderView__exitWaitingModeWithAnimation___block_invoke;
  v5[3] = &unk_2645898B8;
  v5[4] = self;
  [MEMORY[0x263F1CB60] animateWithDuration:6 delay:v5 options:&__block_literal_global_33 animations:v4 completion:0.0];
  [(TKVibrationRecorderTouchSurface *)self->_touchSurface setAccessibilityHint:0];
}

uint64_t __57__TKVibrationRecorderView__exitWaitingModeWithAnimation___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) setAlpha:0.0];
}

- (void)enterRecordingMode
{
  [(TKVibrationRecorderView *)self _exitWaitingModeWithAnimation:1];
  [(TKVibrationRecorderView *)self _setLeftButtonIdentifier:3 enabled:0 rightButtonIdentifier:2 enabled:1 animated:1];
  [(TKVibrationRecorderProgressView *)self->_progressView clearAllVibrationComponents];
  [(TKVibrationRecorderProgressView *)self->_progressView setRoundedCornersCompensationDelayMode:1];
  [(TKVibrationRecorderProgressView *)self->_progressView setCurrentTimeInterval:0.0];
  touchSurface = self->_touchSurface;

  [(TKVibrationRecorderTouchSurface *)touchSurface enterRecordingMode];
}

- (void)exitRecordingModeWithPlayButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_isWaitingForEndOfCurrentVibrationComponent) {
    [(TKVibrationRecorderProgressView *)self->_progressView vibrationComponentDidEnd];
  }
  [(TKVibrationRecorderView *)self stopAnimatingProgress];
  [(TKVibrationRecorderProgressView *)self->_progressView setRoundedCornersCompensationDelayMode:0];
  [(TKVibrationRecorderProgressView *)self->_progressView setCurrentTimeInterval:0.0];
  self->_currentVibrationProgressDidStartTimestamp = 0.0;
  [(TKVibrationRecorderView *)self _enterWaitingModeWithAnimation:1 enablePlayButton:v3];
  touchSurface = self->_touchSurface;

  [(TKVibrationRecorderTouchSurface *)touchSurface exitRecordingMode];
}

- (void)enterReplayModeWithVibrationPattern:(id)a3
{
  if (!self->_isReplayModeEnabled)
  {
    self->_isReplayModeEnabled = 1;
    id v4 = a3;
    [(TKVibrationRecorderView *)self _exitWaitingModeWithAnimation:1];
    [(TKVibrationRecorderView *)self _setLeftButtonIdentifier:3 enabled:0 rightButtonIdentifier:4 enabled:1 animated:1];
    [(TKVibrationRecorderTouchSurface *)self->_touchSurface enterReplayModeWithVibrationPattern:v4];

    [(TKVibrationRecorderProgressView *)self->_progressView setRoundedCornersCompensationDelayMode:2];
    [(TKVibrationRecorderView *)self startAnimatingProgress];
  }
}

- (void)exitReplayMode
{
  if (self->_isReplayModeEnabled)
  {
    self->_isReplayModeEnabled = 0;
    [(TKVibrationRecorderView *)self stopAnimatingProgress];
    [(TKVibrationRecorderProgressView *)self->_progressView setRoundedCornersCompensationDelayMode:0];
    [(TKVibrationRecorderProgressView *)self->_progressView setCurrentTimeInterval:0.0];
    [(TKVibrationRecorderTouchSurface *)self->_touchSurface exitReplayMode];
    [(TKVibrationRecorderView *)self _enterWaitingModeWithAnimation:1 enablePlayButton:1];
  }
}

- (void)startAnimatingProgress
{
  self->_isAnimatingProgress = 1;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_currentVibrationProgressDidStartTimestamp = v3;
  [(TKVibrationRecorderProgressView *)self->_progressView setCurrentTimeInterval:0.0];
  id v4 = +[TKDisplayLinkManager currentDisplayLinkManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__TKVibrationRecorderView_startAnimatingProgress__block_invoke;
  v7[3] = &unk_264589D08;
  v7[4] = self;
  BOOL v5 = [v4 addObserverForFrameInterval:2 handler:v7];
  displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
  self->_displayLinkManagerObserverToken = v5;
}

uint64_t __49__TKVibrationRecorderView_startAnimatingProgress__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _updateProgress:a2];
}

- (void)stopAnimatingProgress
{
  if (self->_displayLinkManagerObserverToken)
  {
    double v3 = +[TKDisplayLinkManager currentDisplayLinkManager];
    [v3 removeObserverWithToken:self->_displayLinkManagerObserverToken];

    displayLinkManagerObserverToken = self->_displayLinkManagerObserverToken;
    self->_displayLinkManagerObserverToken = 0;
  }
  self->_isAnimatingProgress = 0;
}

- (void)_updateProgress:(id)a3
{
  id v4 = a3;
  if (self->_isAnimatingProgress)
  {
    id v8 = v4;
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v6 = v5;
    if (v5 - self->_currentVibrationProgressDidStartTimestamp > self->_vibrationPatternMaximumDuration)
    {
      [(TKVibrationRecorderView *)self stopAnimatingProgress];
      [(TKVibrationRecorderProgressView *)self->_progressView setRoundedCornersCompensationDelayMode:0];
      self->_currentVibrationProgressDidStartTimestamp = 0.0;
      uint64_t v7 = [(TKVibrationRecorderView *)self delegate];
      [v7 vibrationRecorderViewDidReachVibrationRecordingMaximumDuration:self];

LABEL_7:
      id v4 = v8;
      goto LABEL_8;
    }
    -[TKVibrationRecorderProgressView setCurrentTimeInterval:](self->_progressView, "setCurrentTimeInterval:");
    id v4 = v8;
    if (self->_isWaitingForEndOfCurrentVibrationComponent
      && v6 - self->_currentVibrationComponentDidStartTimestamp > 4.9)
    {
      [(TKVibrationRecorderTouchSurface *)self->_touchSurface currentVibrationComponentShouldEnd];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (void)didMoveToWindow
{
  v9.receiver = self;
  v9.super_class = (Class)TKVibrationRecorderView;
  [(TKVibrationRecorderView *)&v9 didMoveToWindow];
  double v3 = [(TKVibrationRecorderView *)self window];
  id v4 = v3;
  if (v3)
  {
    styleProvider = self->_styleProvider;
    double v6 = [v3 screen];
    [(TKVibrationRecorderStyleProvider *)styleProvider setScreen:v6];

    controlsToolbarTopConstraint = self->_controlsToolbarTopConstraint;
    [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderControlsToolbarVerticalOffset];
    -[NSLayoutConstraint setConstant:](controlsToolbarTopConstraint, "setConstant:");
    progressToolbarBottomConstraint = self->_progressToolbarBottomConstraint;
    [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderProgressToolbarVerticalOffset];
    -[NSLayoutConstraint setConstant:](progressToolbarBottomConstraint, "setConstant:");
  }
  [(TKVibrationRecorderView *)self _updateBottomLineToolbarForPeripheryInsetsChange];
}

- (void)_handleScreenPeripheryInsetsDidChangeNotification:(id)a3
{
  id v7 = [a3 object];
  id v4 = [(TKVibrationRecorderView *)self window];
  id v5 = [v4 screen];

  double v6 = v7;
  if (v7 == v5)
  {
    [(TKVibrationRecorderView *)self _updateBottomLineToolbarForPeripheryInsetsChange];
    double v6 = v7;
  }
}

- (void)_updateBottomLineToolbarForPeripheryInsetsChange
{
  [(UIToolbar *)self->_bottomLineToolbar intrinsicContentSize];
  double v4 = v3;
  id v5 = [(TKVibrationRecorderView *)self window];
  id v11 = [v5 screen];

  if (v11)
  {
    [v11 _peripheryInsets];
    BOOL v7 = TKFloatEqualToFloat(v6, 0.0);
    if (!v7)
    {
      [v11 scale];
      TKFloatGetSafeScaleForValue(v8);
      double v4 = v4 + 1.0 / v9;
    }
    BOOL v10 = !v7;
  }
  else
  {
    BOOL v10 = 0;
  }
  [(UIToolbar *)self->_bottomLineToolbar _setHidesShadow:v10];
  [(NSLayoutConstraint *)self->_bottomLineToolbarBottomConstraint setConstant:v4];
}

- (void)safeAreaInsetsDidChange
{
  v16.receiver = self;
  v16.super_class = (Class)TKVibrationRecorderView;
  [(TKVibrationRecorderView *)&v16 safeAreaInsetsDidChange];
  [(TKVibrationRecorderView *)self safeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  uint64_t v7 = objc_msgSend(MEMORY[0x263F1CB60], "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[UIToolbar semanticContentAttribute](self->_controlsToolbar, "semanticContentAttribute"));
  double v8 = [(UIToolbar *)self->_controlsToolbar items];
  [(TKVibrationRecorderStyleProvider *)self->_styleProvider vibrationRecorderControlsToolbarItemsHorizontalOffsetFromEdge];
  double v10 = v9;
  id v11 = [v8 firstObject];
  id v12 = v11;
  if (v7) {
    double v13 = v6;
  }
  else {
    double v13 = v4;
  }
  double v14 = v13 + v10;
  if (!v7) {
    double v4 = v6;
  }
  [v11 setWidth:v14];
  double v15 = [v8 lastObject];
  [v15 setWidth:v4 + v10];
  [(UIToolbar *)self->_controlsToolbar setNeedsLayout];
}

- (void)vibrationComponentDidStartForVibrationRecorderTouchSurface:(id)a3
{
  double v4 = [(TKVibrationRecorderView *)self delegate];
  [v4 vibrationComponentDidStartForVibrationRecorderView:self];

  [(TKVibrationRecorderProgressView *)self->_progressView vibrationComponentDidStart];
  self->_isWaitingForEndOfCurrentVibrationComponent = 1;
  [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
  self->_currentVibrationComponentDidStartTimestamp = v5;
}

- (void)vibrationComponentDidEndForVibrationRecorderTouchSurface:(id)a3
{
  double v4 = [(TKVibrationRecorderView *)self delegate];
  [v4 vibrationComponentDidEndForVibrationRecorderView:self];

  [(TKVibrationRecorderProgressView *)self->_progressView vibrationComponentDidEnd];
  self->_isWaitingForEndOfCurrentVibrationComponent = 0;
  self->_currentVibrationComponentDidStartTimestamp = 0.0;
}

- (void)vibrationRecorderTouchSurfaceDidFinishReplayingVibration:(id)a3
{
  double v4 = [(TKVibrationRecorderView *)self delegate];
  [v4 vibrationRecorderViewDidFinishReplayingVibration:self];

  [(TKVibrationRecorderView *)self stopAnimatingProgress];
  [(TKVibrationRecorderView *)self _enterWaitingModeWithAnimation:1 enablePlayButton:1];
  self->_isReplayModeEnabled = 0;
  [(TKVibrationRecorderProgressView *)self->_progressView setRoundedCornersCompensationDelayMode:0];
  if (self->_vibrationPatternMaximumDuration > 0.0)
  {
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    float v6 = (v5 - self->_currentVibrationProgressDidStartTimestamp) / self->_vibrationPatternMaximumDuration;
    if (v6 > 0.98)
    {
      progressView = self->_progressView;
      -[TKVibrationRecorderProgressView setCurrentTimeInterval:](progressView, "setCurrentTimeInterval:");
    }
  }
}

- (BOOL)vibrationRecorderTouchSurfaceDidEnterRecordingMode:(id)a3
{
  double v3 = self;
  double v4 = [(TKVibrationRecorderView *)self delegate];
  LOBYTE(v3) = [v4 vibrationRecorderViewDidEnterRecordingMode:v3];

  return (char)v3;
}

- (void)vibrationRecorderTouchSurface:(id)a3 didExitRecordingModeWithContextObject:(id)a4
{
  id v5 = a4;
  id v6 = [(TKVibrationRecorderView *)self delegate];
  [v6 vibrationRecorderView:self didExitRecordingModeWithContextObject:v5];
}

- (TKVibrationRecorderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TKVibrationRecorderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_displayLinkManagerObserverToken, 0);
  objc_storeStrong((id *)&self->_touchSurfaceTopConstraint, 0);
  objc_storeStrong((id *)&self->_progressToolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_controlsToolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomLineToolbarBottomConstraint, 0);
  objc_storeStrong((id *)&self->_touchSurface, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_controlsToolbar, 0);
  objc_storeStrong((id *)&self->_bottomLineToolbar, 0);
  objc_storeStrong((id *)&self->_instructionsLabel, 0);

  objc_storeStrong((id *)&self->_styleProvider, 0);
}

@end