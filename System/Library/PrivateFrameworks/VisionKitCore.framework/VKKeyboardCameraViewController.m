@interface VKKeyboardCameraViewController
+ (BOOL)isOpticalFlowForTextEnabled;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialRecordingTimestamp;
- (BOOL)_canShowWhileLocked;
- (BOOL)didDismiss;
- (BOOL)didOverrideComparisonPoint;
- (BOOL)didSetInitialComparisonPoint;
- (BOOL)isPinchToZoomInProgress;
- (BOOL)isRecording;
- (BOOL)isTextLifted;
- (BOOL)liftTextWithSnapshot:(id)a3;
- (NSMutableArray)dataForRadar;
- (NSString)liftedString;
- (NSString)previousString;
- (NSString)textContentType;
- (NSTimer)timeWithoutTextTimer;
- (UIPinchGestureRecognizer)pinchGestureRecognizer;
- (UITapGestureRecognizer)tapGestureRecognizer;
- (UIView)hitTestView;
- (VKAVCaptureFrameProvider)frameProvider;
- (VKCaptureTextAnalyzer)textAnalyzer;
- (VKFeedbackProvider)feedbackProvider;
- (VKHomographyFrameProcessor)homographyProcessor;
- (VKImageAnalysisButton)liftTextButton;
- (VKKeyboardCameraCloseButton)closeButton;
- (VKKeyboardCameraGuidanceView)guidanceView;
- (VKKeyboardCameraInsertButton)insertButton;
- (VKKeyboardCameraReticleView)reticleView;
- (VKKeyboardCameraViewController)init;
- (VKKeyboardCameraViewControllerDelegate)delegate;
- (VKRecognizedText)closestItem;
- (VKTextFrameProcessor)textProcessor;
- (VKTextLiftingView)textLiftingView;
- (VKTextWithTrackingFrameProcessor)optFlowTextProcessor;
- (double)initialPinchZoom;
- (id)findTextLocalizedStringKey;
- (unint64_t)dataType;
- (void)addButtons;
- (void)animate:(id)a3;
- (void)animateAlongsideFadeOutForTextLiftingView:(id)a3;
- (void)animateAlongsideTextLiftingForView:(id)a3;
- (void)cancelTimeWithoutTextTimer;
- (void)clearFoundItemAndRemoveLiftTextButton:(BOOL)a3;
- (void)configureConstraints;
- (void)dealloc;
- (void)didEndPinchToZoom;
- (void)dismissLiftedText;
- (void)frameProvider:(id)a3 didChangeSceneStabilityState:(unint64_t)a4;
- (void)liftTextIfPossible;
- (void)liftTextWithCompletion:(id)a3;
- (void)loadView;
- (void)onCancel;
- (void)onInsert;
- (void)onLiftTextButton:(id)a3;
- (void)onPinch:(id)a3;
- (void)onSelectionChanged:(id)a3;
- (void)onTap:(id)a3;
- (void)request:(id)a3 didFailWithError:(id)a4;
- (void)request:(id)a3 didRecgonizeTextWithAnalysis:(id)a4;
- (void)resetToDefaultComparisonPoint;
- (void)setCloseButton:(id)a3;
- (void)setClosestItem:(id)a3;
- (void)setDataForRadar:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDismiss:(BOOL)a3;
- (void)setDidOverrideComparisonPoint:(BOOL)a3;
- (void)setDidSetInitialComparisonPoint:(BOOL)a3;
- (void)setFeedbackProvider:(id)a3;
- (void)setFrameProvider:(id)a3;
- (void)setGuidanceView:(id)a3;
- (void)setHitTestView:(id)a3;
- (void)setHomographyProcessor:(id)a3;
- (void)setInitialPinchZoom:(double)a3;
- (void)setInitialRecordingTimestamp:(id *)a3;
- (void)setInsertButton:(id)a3;
- (void)setIsPinchToZoomInProgress:(BOOL)a3;
- (void)setIsTextLifted:(BOOL)a3;
- (void)setLiftTextButton:(id)a3;
- (void)setLiftedString:(id)a3;
- (void)setOptFlowTextProcessor:(id)a3;
- (void)setPinchGestureRecognizer:(id)a3;
- (void)setPreviousString:(id)a3;
- (void)setRecording:(BOOL)a3;
- (void)setReticleView:(id)a3;
- (void)setTapGestureRecognizer:(id)a3;
- (void)setTextAnalyzer:(id)a3;
- (void)setTextContentType:(id)a3;
- (void)setTextLiftingView:(id)a3;
- (void)setTextProcessor:(id)a3;
- (void)setTimeWithoutTextTimer:(id)a3;
- (void)startTimeWithoutTextTimer;
- (void)textLiftingAnimationDidEndForView:(id)a3;
- (void)textProcessorResult:(id)a3;
- (void)updateInsertButtonWithRecognizedString:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBeginPinchToZoom;
@end

@implementation VKKeyboardCameraViewController

+ (BOOL)isOpticalFlowForTextEnabled
{
  int v2 = vk_supportsOpticalFlowTracking();
  if (v2)
  {
    if (vk_isInternalBuild())
    {
      LOBYTE(v2) = +[VKCInternalSettings isOpticalFlowForTextEnabled];
    }
    else
    {
      LOBYTE(v2) = 1;
    }
  }
  return v2;
}

- (VKKeyboardCameraViewController)init
{
  v26.receiver = self;
  v26.super_class = (Class)VKKeyboardCameraViewController;
  int v2 = [(VKKeyboardCameraViewController *)&v26 init];
  if (v2)
  {
    v3 = objc_alloc_init(VKFrameProviderConfiguration);
    [(VKFrameProviderConfiguration *)v3 setResolutionPreset:5];
    v4 = [[VKAVCaptureFrameProvider alloc] initWithConfiguration:v3];
    frameProvider = v2->_frameProvider;
    v2->_frameProvider = v4;

    [(VKAVCaptureFrameProvider *)v2->_frameProvider setDelegate:v2 queue:MEMORY[0x1E4F14428]];
    if (+[VKKeyboardCameraViewController isOpticalFlowForTextEnabled])
    {
      v6 = objc_alloc_init(VKTextWithTrackingFrameProcessor);
      optFlowTextProcessor = v2->_optFlowTextProcessor;
      v2->_optFlowTextProcessor = v6;

      v8 = (void *)MEMORY[0x1E4F14428];
      [(VKFrameProcessor *)v2->_optFlowTextProcessor setResultHandlerQueue:MEMORY[0x1E4F14428]];

      objc_initWeak(&location, v2);
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __38__VKKeyboardCameraViewController_init__block_invoke;
      v23[3] = &unk_1E6BF0C28;
      v9 = &v24;
      objc_copyWeak(&v24, &location);
      [(VKTextWithTrackingFrameProcessor *)v2->_optFlowTextProcessor setResultHandler:v23];
      [(VKFrameProvider *)v2->_frameProvider registerProcessor:v2->_optFlowTextProcessor];
    }
    else
    {
      v10 = objc_alloc_init(VKTextFrameProcessor);
      textProcessor = v2->_textProcessor;
      v2->_textProcessor = v10;

      v12 = (void *)MEMORY[0x1E4F14428];
      [(VKFrameProcessor *)v2->_textProcessor setResultHandlerQueue:MEMORY[0x1E4F14428]];

      objc_initWeak(&location, v2);
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __38__VKKeyboardCameraViewController_init__block_invoke_2;
      v21[3] = &unk_1E6BF0C28;
      v9 = &v22;
      objc_copyWeak(&v22, &location);
      [(VKTextFrameProcessor *)v2->_textProcessor setResultHandler:v21];
      v13 = objc_alloc_init(VKHomographyFrameProcessor);
      homographyProcessor = v2->_homographyProcessor;
      v2->_homographyProcessor = v13;

      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __38__VKKeyboardCameraViewController_init__block_invoke_3;
      v19 = &unk_1E6BF0C50;
      objc_copyWeak(&v20, &location);
      [(VKHomographyFrameProcessor *)v2->_homographyProcessor setResultHandler:&v16];
      -[VKFrameProvider registerProcessor:](v2->_frameProvider, "registerProcessor:", v2->_textProcessor, v16, v17, v18, v19);
      [(VKFrameProvider *)v2->_frameProvider registerProcessor:v2->_homographyProcessor];
      objc_destroyWeak(&v20);
    }
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __38__VKKeyboardCameraViewController_init__block_invoke(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained textProcessorResult:v3];
}

void __38__VKKeyboardCameraViewController_init__block_invoke_2(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained textProcessorResult:v3];
}

void __38__VKKeyboardCameraViewController_init__block_invoke_3(uint64_t a1, void *a2)
{
  int v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [WeakRetained textProcessor];
  [v3 warpTransform];
  double v9 = v6;
  double v10 = v5;
  double v8 = v7;

  objc_msgSend(v4, "applyHomographyWarpTransform:", v10, v9, v8);
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)VKKeyboardCameraViewController;
  [(VKKeyboardCameraViewController *)&v15 viewDidLoad];
  [(VKKeyboardCameraViewController *)self setPreviousString:&stru_1F35566F8];
  id v3 = [(VKKeyboardCameraViewController *)self view];
  [v3 setUserInteractionEnabled:1];
  v4 = +[VKKeyboardCameraDefaults sharedInstance];
  double v5 = objc_alloc_init(VKKeyboardCameraReticleView);
  [(VKKeyboardCameraReticleView *)v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v5];
  [v4 doubleForKey:@"DimmingRadius"];
  -[VKKeyboardCameraReticleView setSpotlightBlurRadius:](v5, "setSpotlightBlurRadius:");
  [v4 doubleForKey:@"DimmingOpacity"];
  -[VKKeyboardCameraReticleView setInvertedShadowAlpha:](v5, "setInvertedShadowAlpha:");
  [(VKKeyboardCameraViewController *)self setReticleView:v5];
  id v6 = objc_alloc_init(MEMORY[0x1E4F42FF0]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v7 = [MEMORY[0x1E4F428B8] blackColor];
  double v8 = [v7 colorWithAlphaComponent:0.01];
  [v6 setBackgroundColor:v8];

  [v3 addSubview:v6];
  [(VKKeyboardCameraViewController *)self setHitTestView:v6];
  [(VKKeyboardCameraViewController *)self addButtons];
  double v9 = objc_alloc_init(VKKeyboardCameraGuidanceView);
  [(VKKeyboardCameraGuidanceView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:v9];
  [(VKKeyboardCameraViewController *)self setGuidanceView:v9];
  double v10 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_onTap_];
  [(VKKeyboardCameraViewController *)self setTapGestureRecognizer:v10];

  v11 = [(VKKeyboardCameraViewController *)self tapGestureRecognizer];
  [v3 addGestureRecognizer:v11];

  v12 = (void *)[objc_alloc(MEMORY[0x1E4F42C80]) initWithTarget:self action:sel_onPinch_];
  [(VKKeyboardCameraViewController *)self setPinchGestureRecognizer:v12];

  v13 = [(VKKeyboardCameraViewController *)self view];
  v14 = [(VKKeyboardCameraViewController *)self pinchGestureRecognizer];
  [v13 addGestureRecognizer:v14];

  [(VKKeyboardCameraViewController *)self configureConstraints];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VKKeyboardCameraViewController;
  [(VKKeyboardCameraViewController *)&v4 dealloc];
}

- (void)addButtons
{
  id v3 = [(VKKeyboardCameraViewController *)self view];
  objc_super v4 = VKBundle();
  double v5 = [v4 localizedStringForKey:@"KC_INSERT_BUTTON" value:@"KC_INSERT_BUTTON" table:@"Localizable"];

  objc_initWeak(&location, self);
  id v6 = (void *)MEMORY[0x1E4F426E8];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __44__VKKeyboardCameraViewController_addButtons__block_invoke;
  v18 = &unk_1E6BF0C78;
  objc_copyWeak(&v19, &location);
  double v7 = [v6 actionWithTitle:v5 image:0 identifier:0 handler:&v15];
  double v8 = [VKKeyboardCameraInsertButton alloc];
  double v9 = -[VKKeyboardCameraInsertButton initWithPrimaryAction:](v8, "initWithPrimaryAction:", v7, v15, v16, v17, v18);
  [(VKKeyboardCameraInsertButton *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v10 = [(VKKeyboardCameraInsertButton *)v9 uiButton];
  [v10 setEnabled:0];

  [v3 addSubview:v9];
  [(VKKeyboardCameraViewController *)self setInsertButton:v9];
  v11 = objc_alloc_init(VKKeyboardCameraCloseButton);
  [(VKKeyboardCameraCloseButton *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  v12 = [(VKKeyboardCameraCloseButton *)v11 uiButton];
  [v12 addTarget:self action:sel_onCancel forControlEvents:64];

  [v3 addSubview:v11];
  [(VKKeyboardCameraViewController *)self setCloseButton:v11];
  v13 = +[VKImageAnalysisButton buttonWithType:1];
  [v13 addTarget:self action:sel_onLiftTextButton_ forControlEvents:64];
  [v13 setFunction:1];
  [v13 setGlyphConfiguration:1];
  [v13 setMode:0];
  v14 = [MEMORY[0x1E4F428B8] systemBlueColor];
  [v13 setTintColor:v14];

  [v13 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v13 setAlpha:0.0];
  [v3 addSubview:v13];
  [(VKKeyboardCameraViewController *)self setLiftTextButton:v13];

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
}

void __44__VKKeyboardCameraViewController_addButtons__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained onInsert];
    id WeakRetained = v2;
  }
}

- (void)animate:(id)a3
{
}

- (void)loadView
{
  id v4 = [(VKKeyboardCameraViewController *)self frameProvider];
  id v3 = [v4 previewView];
  [(VKKeyboardCameraViewController *)self setView:v3];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = objc_alloc_init(VKTextFrameProcessorConfiguration);
  [(VKTextFrameProcessorConfiguration *)v5 setIsForSingleItem:1];
  id v6 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  [(VKTextFrameProcessorConfiguration *)v5 setRecognitionLanguages:v6];

  [(VKTextFrameProcessorConfiguration *)v5 setDataType:[(VKKeyboardCameraViewController *)self dataType]];
  double v7 = [(VKKeyboardCameraViewController *)self textProcessor];
  [v7 setConfiguration:v5];

  double v8 = [(VKKeyboardCameraViewController *)self optFlowTextProcessor];
  [v8 setConfiguration:v5];

  double v9 = [(VKKeyboardCameraViewController *)self frameProvider];
  [v9 startRunning];

  double v10 = [(VKKeyboardCameraViewController *)self frameProvider];
  [v10 startProcessing];

  v11.receiver = self;
  v11.super_class = (Class)VKKeyboardCameraViewController;
  [(VKKeyboardCameraViewController *)&v11 viewWillAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKKeyboardCameraViewController;
  [(VKKeyboardCameraViewController *)&v4 viewWillDisappear:a3];
  [(VKKeyboardCameraViewController *)self setDidDismiss:1];
  [(VKKeyboardCameraViewController *)self setClosestItem:0];
  [(VKKeyboardCameraViewController *)self setReticleView:0];
  [(VKKeyboardCameraViewController *)self setFrameProvider:0];
  [(VKKeyboardCameraViewController *)self setTextProcessor:0];
  [(VKKeyboardCameraViewController *)self setOptFlowTextProcessor:0];
  [(VKKeyboardCameraViewController *)self setHomographyProcessor:0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VKKeyboardCameraViewController;
  [(VKKeyboardCameraViewController *)&v4 viewDidAppear:a3];
  [(VKKeyboardCameraViewController *)self startTimeWithoutTextTimer];
  [(VKKeyboardCameraViewController *)self setDidDismiss:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __85__VKKeyboardCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v4[3] = &unk_1E6BF0CA0;
  v4[4] = self;
  [a4 animateAlongsideTransition:v4 completion:0];
}

void __85__VKKeyboardCameraViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  objc_super v11 = [*(id *)(a1 + 32) textLiftingView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  id v12 = [*(id *)(a1 + 32) textLiftingView];
  [v12 layoutIfNeeded];
}

- (void)updateInsertButtonWithRecognizedString:(id)a3
{
  id v11 = a3;
  double v4 = [(VKKeyboardCameraViewController *)self previousString];
  char v5 = [v4 isEqualToString:v11];

  if ((v5 & 1) == 0)
  {
    [(VKKeyboardCameraViewController *)self setPreviousString:v11];
    BOOL v6 = [v11 length] != 0;
    uint64_t v7 = [(VKKeyboardCameraViewController *)self insertButton];
    double v8 = [(id)v7 uiButton];
    [v8 setEnabled:v6];

    double v9 = [(VKKeyboardCameraViewController *)self delegate];
    LOBYTE(v7) = objc_opt_respondsToSelector();

    if (v7)
    {
      double v10 = [(VKKeyboardCameraViewController *)self delegate];
      [v10 keyboardCamera:self didUpdateString:v11];
    }
  }
}

- (void)clearFoundItemAndRemoveLiftTextButton:(BOOL)a3
{
  char v5 = [(VKKeyboardCameraViewController *)self closestItem];

  if (v5) {
    [(VKKeyboardCameraViewController *)self resetToDefaultComparisonPoint];
  }
  [(VKKeyboardCameraViewController *)self setClosestItem:0];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__VKKeyboardCameraViewController_clearFoundItemAndRemoveLiftTextButton___block_invoke;
  v6[3] = &unk_1E6BF0CC8;
  BOOL v7 = a3;
  v6[4] = self;
  [(VKKeyboardCameraViewController *)self animate:v6];
}

void __72__VKKeyboardCameraViewController_clearFoundItemAndRemoveLiftTextButton___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) liftTextButton];
    [v2 setAlpha:0.0];
  }
  double v3 = [*(id *)(a1 + 32) reticleView];
  [v3 setReticleAlpha:0.0];

  id v4 = [*(id *)(a1 + 32) reticleView];
  [v4 collapseReticleRect];
}

- (void)configureConstraints
{
  v71[17] = *MEMORY[0x1E4F143B8];
  double v3 = [(VKKeyboardCameraViewController *)self reticleView];
  id v4 = [(VKKeyboardCameraViewController *)self view];
  char v5 = [(VKKeyboardCameraViewController *)self hitTestView];
  BOOL v6 = [(VKKeyboardCameraViewController *)self insertButton];
  BOOL v7 = [(VKKeyboardCameraViewController *)self closeButton];
  double v8 = [(VKKeyboardCameraViewController *)self liftTextButton];
  double v9 = [(VKKeyboardCameraViewController *)self guidanceView];
  v47 = (void *)MEMORY[0x1E4F28DC8];
  v70 = [v5 topAnchor];
  v69 = [v4 topAnchor];
  v68 = [v70 constraintEqualToAnchor:v69];
  v71[0] = v68;
  v66 = [v5 leadingAnchor];
  v65 = [v4 leadingAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v71[1] = v64;
  v67 = v5;
  v63 = [v5 widthAnchor];
  v62 = [v4 widthAnchor];
  v61 = [v63 constraintEqualToAnchor:v62];
  v71[2] = v61;
  v59 = [v5 heightAnchor];
  v58 = [v4 heightAnchor];
  v57 = [v59 constraintEqualToAnchor:v58];
  v71[3] = v57;
  v56 = [v3 topAnchor];
  v55 = [v4 topAnchor];
  v54 = [v56 constraintEqualToAnchor:v55];
  v71[4] = v54;
  v53 = [v3 leadingAnchor];
  v52 = [v4 leadingAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v71[5] = v51;
  v60 = v3;
  v50 = [v3 widthAnchor];
  v49 = [v4 widthAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v71[6] = v48;
  v46 = [v3 heightAnchor];
  v44 = [v4 heightAnchor];
  v42 = [v46 constraintEqualToAnchor:v44];
  v71[7] = v42;
  v41 = [v7 topAnchor];
  v40 = [v4 topAnchor];
  v39 = [v41 constraintEqualToAnchor:v40 constant:20.0];
  v71[8] = v39;
  v37 = [v7 rightAnchor];
  v35 = [v4 rightAnchor];
  v34 = [v37 constraintEqualToAnchor:v35 constant:-20.0];
  v71[9] = v34;
  v33 = [v6 bottomAnchor];
  v32 = [v4 bottomAnchor];
  v31 = [v33 constraintEqualToAnchor:v32 constant:-36.0];
  v71[10] = v31;
  v45 = v6;
  v30 = [v6 centerXAnchor];
  v29 = [v4 centerXAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v71[11] = v28;
  v43 = v8;
  v27 = [v8 rightAnchor];
  double v10 = v7;
  v38 = v7;
  objc_super v26 = [v7 rightAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v71[12] = v25;
  id v24 = [v8 centerYAnchor];
  v23 = [v6 centerYAnchor];
  id v22 = [v24 constraintEqualToAnchor:v23];
  v71[13] = v22;
  v21 = [v9 widthAnchor];
  id v20 = [v4 widthAnchor];
  id v11 = [v21 constraintLessThanOrEqualToAnchor:v20 multiplier:0.666666667];
  v71[14] = v11;
  v36 = v9;
  id v12 = [v9 centerXAnchor];
  v13 = [v4 centerXAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v71[15] = v14;
  uint64_t v15 = [v9 firstBaselineAnchor];
  uint64_t v16 = [v10 uiButton];
  uint64_t v17 = [v16 firstBaselineAnchor];
  v18 = [v15 constraintEqualToAnchor:v17];
  v71[16] = v18;
  id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:17];
  [v47 activateConstraints:v19];
}

- (void)viewDidLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)VKKeyboardCameraViewController;
  [(VKKeyboardCameraViewController *)&v14 viewDidLayoutSubviews];
  double v3 = [(VKKeyboardCameraViewController *)self textLiftingView];

  if (v3)
  {
    id v4 = [(VKKeyboardCameraViewController *)self view];
    [v4 bounds];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    v13 = [(VKKeyboardCameraViewController *)self textLiftingView];
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
  }
  if (![(VKKeyboardCameraViewController *)self didSetInitialComparisonPoint])
  {
    [(VKKeyboardCameraViewController *)self resetToDefaultComparisonPoint];
    [(VKKeyboardCameraViewController *)self setDidSetInitialComparisonPoint:1];
  }
}

- (void)onInsert
{
  double v3 = [(VKKeyboardCameraViewController *)self frameProvider];
  [v3 stopProcessing];

  id v4 = [(VKKeyboardCameraViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(VKKeyboardCameraViewController *)self delegate];
    [v6 userDidAcceptWithKeyboardCamera:self];
  }
}

- (void)onCancel
{
  if ([(VKKeyboardCameraViewController *)self isTextLifted])
  {
    double v3 = [(VKKeyboardCameraViewController *)self textAnalyzer];
    [v3 cancelAllRequests];
  }
  id v4 = [(VKKeyboardCameraViewController *)self frameProvider];
  [v4 stopProcessing];

  char v5 = [(VKKeyboardCameraViewController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(VKKeyboardCameraViewController *)self delegate];
    [v7 userDidCancelWithKeyboardCamera:self];
  }
}

- (void)onSelectionChanged:(id)a3
{
  id v11 = a3;
  BOOL v4 = [(VKKeyboardCameraViewController *)self isTextLifted];
  char v5 = v11;
  if (v4)
  {
    char v6 = [v11 object];
    if (!v6) {
      +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "textSelectionView", "-[VKKeyboardCameraViewController onSelectionChanged:]", 0, 0, @"Unexpected: Missing text selection view for lifted text.");
    }
    id v7 = [v6 selectedVKRange];
    double v8 = v7;
    if (v7 && ![v7 isEmpty])
    {
      uint64_t v9 = [v6 selectedText];
    }
    else
    {
      uint64_t v9 = [(VKKeyboardCameraViewController *)self liftedString];
    }
    double v10 = (void *)v9;
    [(VKKeyboardCameraViewController *)self updateInsertButtonWithRecognizedString:v9];

    char v5 = v11;
  }
}

- (void)onLiftTextButton:(id)a3
{
  if ([(VKKeyboardCameraViewController *)self isTextLifted])
  {
    [(VKKeyboardCameraViewController *)self dismissLiftedText];
  }
  else
  {
    [(VKKeyboardCameraViewController *)self liftTextIfPossible];
  }
}

- (void)onTap:(id)a3
{
  if ([a3 state] != 3) {
    return;
  }
  if ([(VKKeyboardCameraViewController *)self isTextLifted])
  {
    [(VKKeyboardCameraViewController *)self dismissLiftedText];
    return;
  }
  id v24 = [(VKKeyboardCameraViewController *)self view];
  [v24 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  tapGestureRecognizer = self->_tapGestureRecognizer;
  id v11 = [(VKKeyboardCameraViewController *)self view];
  [(UITapGestureRecognizer *)tapGestureRecognizer locationInView:v11];

  VKMFlipPoint();
  double v14 = VKMNormalizedPointInRect(v12, v13, v5, v7, v9);
  double v16 = v15;
  uint64_t v17 = [(VKKeyboardCameraViewController *)self textProcessor];

  if (v17)
  {
    v18 = [(VKKeyboardCameraViewController *)self textProcessor];
    id v19 = [v18 configuration];

    objc_msgSend(v19, "setComparisonPoint:", v14, v16);
    id v20 = [(VKKeyboardCameraViewController *)self textProcessor];
LABEL_11:
    v23 = v20;
    [v20 setConfiguration:v19];

    goto LABEL_12;
  }
  v21 = [(VKKeyboardCameraViewController *)self optFlowTextProcessor];

  if (v21)
  {
    id v22 = [(VKKeyboardCameraViewController *)self optFlowTextProcessor];
    id v19 = [v22 configuration];

    objc_msgSend(v19, "setComparisonPoint:", v14, v16);
    id v20 = [(VKKeyboardCameraViewController *)self optFlowTextProcessor];
    goto LABEL_11;
  }
LABEL_12:
  [(VKKeyboardCameraViewController *)self setDidOverrideComparisonPoint:1];
}

- (void)onPinch:(id)a3
{
  id v11 = a3;
  uint64_t v4 = [v11 state];
  if ((unint64_t)(v4 - 3) < 2)
  {
    [(VKKeyboardCameraViewController *)self setIsPinchToZoomInProgress:0];
    [(VKKeyboardCameraViewController *)self didEndPinchToZoom];
  }
  else if (v4 == 2)
  {
    [(VKKeyboardCameraViewController *)self initialPinchZoom];
    double v7 = v6;
    [v11 scale];
    double v9 = v7 * v8;
    double v10 = [(VKKeyboardCameraViewController *)self frameProvider];
    [v10 setZoomFactor:v9];
  }
  else if (v4 == 1)
  {
    double v5 = [(VKKeyboardCameraViewController *)self frameProvider];
    [v5 zoomFactor];
    -[VKKeyboardCameraViewController setInitialPinchZoom:](self, "setInitialPinchZoom:");

    [(VKKeyboardCameraViewController *)self setIsPinchToZoomInProgress:1];
    [(VKKeyboardCameraViewController *)self willBeginPinchToZoom];
  }
}

- (void)willBeginPinchToZoom
{
  double v3 = [(VKKeyboardCameraViewController *)self frameProvider];
  [v3 stopProcessing];

  [(VKKeyboardCameraViewController *)self clearFoundItemAndRemoveLiftTextButton:1];
}

- (void)didEndPinchToZoom
{
  id v2 = [(VKKeyboardCameraViewController *)self frameProvider];
  [v2 startProcessing];
}

- (void)liftTextIfPossible
{
  if ([(VKKeyboardCameraViewController *)self isTextLifted]) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.isTextLifted", "[(VKKeyboardCameraViewController *)"request to lift text liftTextIfPossible]);
  }
  double v3 = [(VKKeyboardCameraViewController *)self closestItem];

  if (v3)
  {
    uint64_t v4 = [(VKKeyboardCameraViewController *)self frameProvider];
    [v4 stopProcessing];

    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __52__VKKeyboardCameraViewController_liftTextIfPossible__block_invoke;
    v5[3] = &unk_1E6BF0CF0;
    objc_copyWeak(&v6, &location);
    [(VKKeyboardCameraViewController *)self liftTextWithCompletion:v5];
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __52__VKKeyboardCameraViewController_liftTextIfPossible__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    if (a2)
    {
      uint64_t v4 = [WeakRetained liftTextButton];
      [v4 setSelected:1];

      double v5 = VKBundle();
      id v6 = [v5 localizedStringForKey:@"KC_LIFTED_TEXT_HELP" value:@"KC_LIFTED_TEXT_HELP" table:@"Localizable"];

      double v7 = [v8 guidanceView];
      [v7 showGuidanceWithText:v6];

      [v8 clearFoundItemAndRemoveLiftTextButton:0];
    }
    else
    {
      id v6 = [WeakRetained frameProvider];
      [v6 startProcessing];
    }

    id WeakRetained = v8;
  }
}

- (void)dismissLiftedText
{
  if (![(VKKeyboardCameraViewController *)self isTextLifted]) {
    +[VKAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](VKAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.isTextLifted", "[(VKKeyboardCameraViewController *)"request dismiss lifted text dismissLiftedText]);
  }
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"VKCImageTextSelectionViewSelectionDidChange" object:0];

  uint64_t v4 = [(VKKeyboardCameraViewController *)self textAnalyzer];
  [v4 cancelAllRequests];

  double v5 = [(VKKeyboardCameraViewController *)self textLiftingView];
  [v5 fadeOutAndRemoveFromSuperview];

  [(VKKeyboardCameraViewController *)self setTextLiftingView:0];
  [(VKKeyboardCameraViewController *)self setIsTextLifted:0];
  id v6 = [(VKKeyboardCameraViewController *)self insertButton];
  double v7 = [v6 uiButton];
  [v7 setEnabled:0];

  id v8 = [(VKKeyboardCameraViewController *)self liftTextButton];
  [v8 setSelected:0];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__VKKeyboardCameraViewController_dismissLiftedText__block_invoke;
  v10[3] = &unk_1E6BF0D18;
  v10[4] = self;
  [(VKKeyboardCameraViewController *)self animate:v10];
  double v9 = [(VKKeyboardCameraViewController *)self frameProvider];
  [v9 startProcessing];
}

void __51__VKKeyboardCameraViewController_dismissLiftedText__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) liftTextButton];
  [v1 setAlpha:0.0];
}

- (void)liftTextWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  double v5 = [(VKKeyboardCameraViewController *)self frameProvider];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke;
  v7[3] = &unk_1E6BF0D40;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 snapshotWithCompletion:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v5 = WeakRetained;
  if (v3 && WeakRetained)
  {
    if (([WeakRetained liftTextWithSnapshot:v3] & 1) == 0)
    {
      id v6 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke_cold_1();
      }
    }
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7)
    {
      id v8 = *(void (**)(void))(v7 + 16);
LABEL_14:
      v8();
    }
  }
  else if (WeakRetained)
  {
    id v9 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke_cold_2();
    }

    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v8 = *(void (**)(void))(v10 + 16);
      goto LABEL_14;
    }
  }
}

- (BOOL)liftTextWithSnapshot:(id)a3
{
  v53[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(VKKeyboardCameraViewController *)self closestItem];
  if (v5)
  {
    id v6 = [(VKKeyboardCameraViewController *)self textAnalyzer];

    if (!v6)
    {
      uint64_t v7 = objc_alloc_init(VKCaptureTextAnalyzer);
      [(VKCaptureTextAnalyzer *)v7 setShouldCreateFeedbackProviders:0];
      [(VKKeyboardCameraViewController *)self setTextAnalyzer:v7];
    }
    id v8 = [v5 layerQuad];
    v51 = [[VKCaptureTextAnalysisRequest alloc] initWithImage:v4 focusQuad:v8 delegate:self];
    id v9 = [(VKKeyboardCameraViewController *)self textAnalyzer];
    [v9 processRequest:v51];

    uint64_t v10 = [(VKKeyboardCameraViewController *)self view];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    [(VKKeyboardCameraViewController *)self systemMinimumLayoutMargins];
    double v50 = v19;
    [(VKKeyboardCameraViewController *)self systemMinimumLayoutMargins];
    double v21 = v20;
    v54.origin.x = v12;
    v54.origin.y = v14;
    v54.size.width = v16;
    v54.size.height = v18;
    double Height = CGRectGetHeight(v54);
    v23 = [(VKKeyboardCameraViewController *)self insertButton];
    [v23 frame];
    double v24 = Height - CGRectGetMinY(v55) + 5.0;

    [v8 averagedAngleFromBottomAndTopEdges];
    double v26 = v25;
    v27 = [(VKKeyboardCameraViewController *)self view];
    v28 = [v8 normalizedQuadFromView:v27];

    v29 = [(VKKeyboardCameraViewController *)self view];
    [v29 bounds];
    double v32 = VKMAspectRatio(v30, v31);

    v33 = (void *)MEMORY[0x1E4F427D0];
    v53[0] = v28;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:1];
    v35 = objc_msgSend(v33, "vk_roundAndGroupNormalizedQuadsForHighlight:aspectRatio:expansionScale:radiusToAvgHeightRatio:", v34, v32, 0.1, 0.2);

    v36 = [(VKKeyboardCameraViewController *)self view];
    [v36 frame];
    CGFloat v38 = v37;
    v39 = [(VKKeyboardCameraViewController *)self view];
    [v39 frame];
    CGAffineTransformMakeScale(&v52, v38, v40);
    objc_msgSend(v35, "vk_applyTransform:", &v52);

    v41 = [[VKTextLiftingView alloc] initWithImage:v4 cutoutPath:v35 baselineAngle:v26];
    [(VKTextLiftingView *)v41 setDelegate:self];
    [(VKTextLiftingView *)v41 setMaxScale:2.0];
    -[VKTextLiftingView setFrame:](v41, "setFrame:", v12, v14, v16, v18);
    -[VKTextLiftingView setContentInsets:](v41, "setContentInsets:", 20.0, v50, v24, v21);
    [(VKTextLiftingView *)v41 setPresentsMenuForLiftedText:0];
    [(VKTextLiftingView *)v41 setHitTestPath:v35];
    v42 = [[VKCImageAnalysisInteraction alloc] initWithInteractionOptions:7];
    [(VKCImageAnalysisInteraction *)v42 setActiveInteractionTypes:1];
    [(VKCImageAnalysisInteraction *)v42 setAllowLongPressForDataDetectorsInTextMode:0];
    [(VKTextLiftingView *)v41 setImageInteraction:v42];
    v43 = [(VKKeyboardCameraViewController *)self closestItem];
    v44 = [v43 transcript];
    [(VKKeyboardCameraViewController *)self setLiftedString:v44];

    v45 = [(VKCImageAnalysisInteraction *)v42 baseView];
    v46 = [v45 textSelectionView];

    v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v47 addObserver:self selector:sel_onSelectionChanged_ name:@"VKCImageTextSelectionViewSelectionDidChange" object:v46];

    v48 = [(VKKeyboardCameraViewController *)self hitTestView];
    [v10 insertSubview:v41 aboveSubview:v48];

    [(VKTextLiftingView *)v41 performLiftAnimation];
    [(VKKeyboardCameraViewController *)self setTextLiftingView:v41];
    [(VKKeyboardCameraViewController *)self setIsTextLifted:1];
  }
  else
  {
    v28 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      -[VKKeyboardCameraViewController liftTextWithSnapshot:]();
    }
  }

  return v5 != 0;
}

- (void)cancelTimeWithoutTextTimer
{
  id v3 = [(VKKeyboardCameraViewController *)self guidanceView];
  [v3 hideGuidance];

  id v4 = [(VKKeyboardCameraViewController *)self timeWithoutTextTimer];
  [v4 invalidate];

  [(VKKeyboardCameraViewController *)self setTimeWithoutTextTimer:0];
}

- (void)startTimeWithoutTextTimer
{
  id v3 = [(VKKeyboardCameraViewController *)self timeWithoutTextTimer];

  if (!v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__VKKeyboardCameraViewController_startTimeWithoutTextTimer__block_invoke;
    v5[3] = &unk_1E6BF0D68;
    void v5[4] = self;
    id v4 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v5 block:3.0];
    [(VKKeyboardCameraViewController *)self setTimeWithoutTextTimer:v4];
  }
}

void __59__VKKeyboardCameraViewController_startTimeWithoutTextTimer__block_invoke(uint64_t a1)
{
  id v2 = VKBundle();
  id v3 = [*(id *)(a1 + 32) findTextLocalizedStringKey];
  id v4 = [*(id *)(a1 + 32) findTextLocalizedStringKey];
  id v6 = [v2 localizedStringForKey:v3 value:v4 table:@"Localizable"];

  double v5 = [*(id *)(a1 + 32) guidanceView];
  [v5 showGuidanceWithText:v6];

  [*(id *)(a1 + 32) setTimeWithoutTextTimer:0];
}

- (void)resetToDefaultComparisonPoint
{
  [(VKKeyboardCameraViewController *)self setDidOverrideComparisonPoint:0];
  id v11 = [(VKKeyboardCameraViewController *)self view];
  [v11 bounds];
  double Height = CGRectGetHeight(v13);
  if (Height > 0.0)
  {
    double v4 = Height;
    double v5 = [(VKKeyboardCameraViewController *)self insertButton];
    [v5 bounds];
    objc_msgSend(v11, "convertRect:fromView:", v5);
    double v6 = (v4 - CGRectGetMaxY(v14)) / v4 + 0.5;
    uint64_t v7 = [(VKKeyboardCameraViewController *)self textProcessor];
    id v8 = [v7 configuration];
    objc_msgSend(v8, "setComparisonPoint:", 0.5, v6);

    id v9 = [(VKKeyboardCameraViewController *)self optFlowTextProcessor];
    uint64_t v10 = [v9 configuration];
    objc_msgSend(v10, "setComparisonPoint:", 0.5, v6);
  }
}

- (unint64_t)dataType
{
  id v2 = [(VKKeyboardCameraViewController *)self textContentType];
  if ([v2 isEqualToString:*MEMORY[0x1E4F43E08]])
  {
    unint64_t v3 = 3;
  }
  else if ([v2 isEqualToString:*MEMORY[0x1E4F43D78]])
  {
    unint64_t v3 = 4;
  }
  else if ([v2 isEqualToString:*MEMORY[0x1E4F43E10]])
  {
    unint64_t v3 = 1;
  }
  else if ([v2 isEqualToString:*MEMORY[0x1E4F43D60]])
  {
    unint64_t v3 = 2;
  }
  else if ([v2 isEqualToString:*MEMORY[0x1E4F43D70]])
  {
    unint64_t v3 = 7;
  }
  else if ([v2 isEqualToString:*MEMORY[0x1E4F43DE8]])
  {
    unint64_t v3 = 8;
  }
  else if ([v2 isEqualToString:*MEMORY[0x1E4F43D58]])
  {
    unint64_t v3 = 5;
  }
  else
  {
    unint64_t v3 = 0;
  }

  return v3;
}

- (id)findTextLocalizedStringKey
{
  unint64_t v3 = [(VKKeyboardCameraViewController *)self textContentType];
  double v4 = (void *)*MEMORY[0x1E4F43E08];

  if (v3 == v4) {
    return @"KC_NO_PHONE_HELP";
  }
  double v5 = [(VKKeyboardCameraViewController *)self textContentType];
  double v6 = (void *)*MEMORY[0x1E4F43D78];

  if (v5 == v6) {
    return @"KC_NO_ADDRESS_HELP";
  }
  uint64_t v7 = [(VKKeyboardCameraViewController *)self textContentType];
  id v8 = (void *)*MEMORY[0x1E4F43E10];

  if (v7 == v8) {
    return @"KC_NO_URL_HELP";
  }
  id v9 = [(VKKeyboardCameraViewController *)self textContentType];
  uint64_t v10 = (void *)*MEMORY[0x1E4F43D60];

  if (v9 == v10) {
    return @"KC_NO_EMAIL_HELP";
  }
  id v11 = [(VKKeyboardCameraViewController *)self textContentType];
  double v12 = (void *)*MEMORY[0x1E4F43D70];

  if (v11 == v12) {
    return @"KC_NO_FLIGHT_HELP";
  }
  CGRect v13 = [(VKKeyboardCameraViewController *)self textContentType];
  CGRect v14 = (void *)*MEMORY[0x1E4F43DE8];

  if (v13 == v14) {
    return @"KC_NO_TRACKING_HELP";
  }
  double v15 = [(VKKeyboardCameraViewController *)self textContentType];
  double v16 = (void *)*MEMORY[0x1E4F43D58];

  if (v15 == v16) {
    return @"KC_NO_DATETIME_HELP";
  }
  else {
    return @"KC_NO_TEXT_HELP";
  }
}

- (void)textProcessorResult:(id)a3
{
  id v4 = a3;
  if (![(VKKeyboardCameraViewController *)self didDismiss])
  {
    double v5 = [(VKKeyboardCameraViewController *)self frameProvider];
    int v6 = [v5 isProcessing];

    if (v6)
    {
      uint64_t v7 = [v4 allItems];
      id v8 = [v7 firstObject];

      if (v8)
      {
        id v9 = [(VKKeyboardCameraViewController *)self closestItem];

        if (v8 != v9)
        {
          [(VKKeyboardCameraViewController *)self setClosestItem:v8];
          if ([(VKKeyboardCameraViewController *)self didOverrideComparisonPoint])
          {
            uint64_t v10 = [(VKKeyboardCameraViewController *)self view];
            [v10 bounds];
            double v12 = v11;
            double v14 = v13;
            double v16 = v15;
            double v17 = [(VKKeyboardCameraViewController *)self closestItem];
            double v18 = [v17 layerQuad];
            [v18 vertexCentroid];

            VKMFlipPoint();
            double v21 = VKMNormalizedPointInRect(v19, v20, v12, v14, v16);
            double v23 = v22;
            double v24 = [(VKKeyboardCameraViewController *)self textProcessor];
            double v25 = [v24 configuration];
            objc_msgSend(v25, "setComparisonPoint:", v21, v23);

            double v26 = [(VKKeyboardCameraViewController *)self optFlowTextProcessor];
            v27 = [v26 configuration];
            objc_msgSend(v27, "setComparisonPoint:", v21, v23);
          }
        }
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __54__VKKeyboardCameraViewController_textProcessorResult___block_invoke;
        v46[3] = &unk_1E6BF0D18;
        v46[4] = self;
        [(VKKeyboardCameraViewController *)self animate:v46];
        v28 = [v8 layerQuad];
        [v28 minimumBoundingRectWithoutRotation];
        double v30 = v29;
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        [v28 averagedAngleFromBottomAndTopEdges];
        double v38 = v37;
        v39 = [(VKKeyboardCameraViewController *)self reticleView];
        objc_msgSend(v39, "setReticleRect:angle:", v30, v32, v34, v36, v38);

        [(VKKeyboardCameraViewController *)self cancelTimeWithoutTextTimer];
      }
      else
      {
        [(VKKeyboardCameraViewController *)self clearFoundItemAndRemoveLiftTextButton:1];
        [(VKKeyboardCameraViewController *)self startTimeWithoutTextTimer];
      }
      CGFloat v40 = [(VKKeyboardCameraViewController *)self insertButton];
      v41 = [v40 uiButton];
      [v41 setEnabled:v8 != 0];

      uint64_t v42 = [v8 transcript];
      v43 = (void *)v42;
      v44 = &stru_1F35566F8;
      if (v42) {
        v44 = (__CFString *)v42;
      }
      v45 = v44;

      [(VKKeyboardCameraViewController *)self updateInsertButtonWithRecognizedString:v45];
    }
  }
}

void __54__VKKeyboardCameraViewController_textProcessorResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) liftTextButton];
  [v2 setAlpha:1.0];

  id v3 = [*(id *)(a1 + 32) reticleView];
  [v3 setReticleAlpha:1.0];
}

- (void)request:(id)a3 didFailWithError:(id)a4
{
  id v4 = a4;
  double v5 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    -[VKKeyboardCameraViewController request:didFailWithError:]((uint64_t)v4, v5);
  }
}

- (void)request:(id)a3 didRecgonizeTextWithAnalysis:(id)a4
{
  id v5 = a4;
  if ([(VKKeyboardCameraViewController *)self isTextLifted]
    && ([(VKKeyboardCameraViewController *)self textLiftingView],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    uint64_t v7 = [(VKKeyboardCameraViewController *)self textLiftingView];
    id v8 = [v7 imageInteraction];
    [v8 setAnalysis:v5];
  }
  else
  {
    uint64_t v7 = os_log_create("com.apple.VisionKit", "com.apple.VisionKit.keyboardCamera");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[VKKeyboardCameraViewController request:didRecgonizeTextWithAnalysis:]();
    }
  }
}

- (void)animateAlongsideTextLiftingForView:(id)a3
{
  id v4 = [(VKKeyboardCameraViewController *)self reticleView];
  [v4 setReticleAlpha:0.0];

  id v5 = [(VKKeyboardCameraViewController *)self reticleView];
  [v5 setInvertedShadowAlpha:0.5];
}

- (void)textLiftingAnimationDidEndForView:(id)a3
{
  objc_initWeak(&location, self);
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__VKKeyboardCameraViewController_textLiftingAnimationDidEndForView___block_invoke;
  v4[3] = &unk_1E6BF0D90;
  objc_copyWeak(&v5, &location);
  dispatch_after(v3, MEMORY[0x1E4F14428], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __68__VKKeyboardCameraViewController_textLiftingAnimationDidEndForView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained guidanceView];
    [v2 hideGuidance];

    id WeakRetained = v3;
  }
}

- (void)animateAlongsideFadeOutForTextLiftingView:(id)a3
{
  id v4 = [(VKKeyboardCameraViewController *)self reticleView];
  [v4 setAlpha:1.0];

  id v8 = +[VKKeyboardCameraDefaults sharedInstance];
  [v8 doubleForKey:@"DimmingOpacity"];
  double v6 = v5;
  uint64_t v7 = [(VKKeyboardCameraViewController *)self reticleView];
  [v7 setInvertedShadowAlpha:v6];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)frameProvider:(id)a3 didChangeSceneStabilityState:(unint64_t)a4
{
  id v10 = a3;
  if (![(VKKeyboardCameraViewController *)self isTextLifted]
    && ![(VKKeyboardCameraViewController *)self isPinchToZoomInProgress])
  {
    if (a4 < 2)
    {
      if (a4 == 1 && [v10 isProcessing])
      {
        [v10 stopProcessing];
        [(VKKeyboardCameraViewController *)self clearFoundItemAndRemoveLiftTextButton:1];
        [(VKKeyboardCameraViewController *)self updateInsertButtonWithRecognizedString:&stru_1F35566F8];
        uint64_t v7 = VKBundle();
        id v8 = [v7 localizedStringForKey:@"KC_STABILITY_HELP" value:@"KC_STABILITY_HELP" table:@"Localizable"];

        id v9 = [(VKKeyboardCameraViewController *)self guidanceView];
        [v9 showGuidanceWithText:v8];
      }
    }
    else if (([v10 isProcessing] & 1) == 0)
    {
      double v6 = [(VKKeyboardCameraViewController *)self guidanceView];
      [v6 hideGuidance];

      [v10 startProcessing];
    }
  }
}

- (VKKeyboardCameraViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VKKeyboardCameraViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)textContentType
{
  return self->_textContentType;
}

- (void)setTextContentType:(id)a3
{
  self->_textContentType = (NSString *)a3;
}

- (VKAVCaptureFrameProvider)frameProvider
{
  return self->_frameProvider;
}

- (void)setFrameProvider:(id)a3
{
}

- (VKTextFrameProcessor)textProcessor
{
  return self->_textProcessor;
}

- (void)setTextProcessor:(id)a3
{
}

- (VKTextWithTrackingFrameProcessor)optFlowTextProcessor
{
  return self->_optFlowTextProcessor;
}

- (void)setOptFlowTextProcessor:(id)a3
{
}

- (VKHomographyFrameProcessor)homographyProcessor
{
  return self->_homographyProcessor;
}

- (void)setHomographyProcessor:(id)a3
{
}

- (UIView)hitTestView
{
  return self->_hitTestView;
}

- (void)setHitTestView:(id)a3
{
}

- (VKKeyboardCameraCloseButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (VKTextLiftingView)textLiftingView
{
  return self->_textLiftingView;
}

- (void)setTextLiftingView:(id)a3
{
}

- (VKKeyboardCameraInsertButton)insertButton
{
  return self->_insertButton;
}

- (void)setInsertButton:(id)a3
{
}

- (VKImageAnalysisButton)liftTextButton
{
  return self->_liftTextButton;
}

- (void)setLiftTextButton:(id)a3
{
}

- (VKKeyboardCameraGuidanceView)guidanceView
{
  return self->_guidanceView;
}

- (void)setGuidanceView:(id)a3
{
}

- (VKKeyboardCameraReticleView)reticleView
{
  return self->_reticleView;
}

- (void)setReticleView:(id)a3
{
}

- (BOOL)didSetInitialComparisonPoint
{
  return self->_didSetInitialComparisonPoint;
}

- (void)setDidSetInitialComparisonPoint:(BOOL)a3
{
  self->_didSetInitialComparisonPoint = a3;
}

- (BOOL)didOverrideComparisonPoint
{
  return self->_didOverrideComparisonPoint;
}

- (void)setDidOverrideComparisonPoint:(BOOL)a3
{
  self->_didOverrideComparisonPoint = a3;
}

- (VKRecognizedText)closestItem
{
  return self->_closestItem;
}

- (void)setClosestItem:(id)a3
{
}

- (NSString)previousString
{
  return self->_previousString;
}

- (void)setPreviousString:(id)a3
{
}

- (NSString)liftedString
{
  return self->_liftedString;
}

- (void)setLiftedString:(id)a3
{
}

- (BOOL)didDismiss
{
  return self->_didDismiss;
}

- (void)setDidDismiss:(BOOL)a3
{
  self->_didDismiss = a3;
}

- (UITapGestureRecognizer)tapGestureRecognizer
{
  return self->_tapGestureRecognizer;
}

- (void)setTapGestureRecognizer:(id)a3
{
}

- (NSTimer)timeWithoutTextTimer
{
  return self->_timeWithoutTextTimer;
}

- (void)setTimeWithoutTextTimer:(id)a3
{
}

- (VKCaptureTextAnalyzer)textAnalyzer
{
  return self->_textAnalyzer;
}

- (void)setTextAnalyzer:(id)a3
{
}

- (BOOL)isTextLifted
{
  return self->_isTextLifted;
}

- (void)setIsTextLifted:(BOOL)a3
{
  self->_isTextLifted = a3;
}

- (UIPinchGestureRecognizer)pinchGestureRecognizer
{
  return self->_pinchGestureRecognizer;
}

- (void)setPinchGestureRecognizer:(id)a3
{
}

- (double)initialPinchZoom
{
  return self->_initialPinchZoom;
}

- (void)setInitialPinchZoom:(double)a3
{
  self->_initialPinchZoom = a3;
}

- (BOOL)isPinchToZoomInProgress
{
  return self->_isPinchToZoomInProgress;
}

- (void)setIsPinchToZoomInProgress:(BOOL)a3
{
  self->_isPinchToZoomInProgress = a3;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (VKFeedbackProvider)feedbackProvider
{
  return self->_feedbackProvider;
}

- (void)setFeedbackProvider:(id)a3
{
}

- (NSMutableArray)dataForRadar
{
  return self->_dataForRadar;
}

- (void)setDataForRadar:(id)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)initialRecordingTimestamp
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)((char *)self + 1168);
  return self;
}

- (void)setInitialRecordingTimestamp:(id *)a3
{
  int64_t var3 = a3->var3;
  *(_OWORD *)&self->_initialRecordingTimestamp.value = *(_OWORD *)&a3->var0;
  self->_initialRecordingTimestamp.epoch = var3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataForRadar, 0);
  objc_storeStrong((id *)&self->_feedbackProvider, 0);
  objc_storeStrong((id *)&self->_pinchGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_textAnalyzer, 0);
  objc_storeStrong((id *)&self->_timeWithoutTextTimer, 0);
  objc_storeStrong((id *)&self->_tapGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_liftedString, 0);
  objc_storeStrong((id *)&self->_previousString, 0);
  objc_storeStrong((id *)&self->_closestItem, 0);
  objc_storeStrong((id *)&self->_reticleView, 0);
  objc_storeStrong((id *)&self->_guidanceView, 0);
  objc_storeStrong((id *)&self->_liftTextButton, 0);
  objc_storeStrong((id *)&self->_insertButton, 0);
  objc_storeStrong((id *)&self->_textLiftingView, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_hitTestView, 0);
  objc_storeStrong((id *)&self->_homographyProcessor, 0);
  objc_storeStrong((id *)&self->_optFlowTextProcessor, 0);
  objc_storeStrong((id *)&self->_textProcessor, 0);
  objc_storeStrong((id *)&self->_frameProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Error lifting text", v2, v3, v4, v5, v6);
}

void __57__VKKeyboardCameraViewController_liftTextWithCompletion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Error creating snapshot image for lifting", v2, v3, v4, v5, v6);
}

- (void)liftTextWithSnapshot:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Trying to lift text without a closest-item.", v2, v3, v4, v5, v6);
}

- (void)request:(uint64_t)a1 didFailWithError:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DB266000, a2, OS_LOG_TYPE_ERROR, "Error analyzing image for lifted text. %@", (uint8_t *)&v2, 0xCu);
}

- (void)request:didRecgonizeTextWithAnalysis:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1DB266000, v0, v1, "Image analysis finished but text isn't lifted or there isn't a lifting-view.", v2, v3, v4, v5, v6);
}

@end