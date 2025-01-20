@interface PencilHandwritingEducationElementViewController
- (AVPlayer)player;
- (AVPlayerLayer)playerLayer;
- (BOOL)_canShowWhileLocked;
- (BOOL)animationInProgress;
- (BOOL)didDisappear;
- (BOOL)didEnableAutoRefine;
- (BOOL)didRunInitialAppearActions;
- (BOOL)hasRemainingAnimation;
- (BOOL)isPlayerHidden;
- (CALayer)canvasMaskLayer;
- (NSMutableSet)nonRefinableStrokes;
- (NSMutableSet)originalStrokes;
- (NSMutableSet)refinedStrokes;
- (PKCanvasView)canvasView;
- (PencilHandwritingEducationElementData)elementData;
- (PencilHandwritingEducationElementViewController)initWithElementData:(id)a3;
- (PencilHandwritingEducationElementViewControllerDelegate)delegate;
- (TextLineLayer)textLineLayer;
- (UIButton)clearButton;
- (UIButton)replayButton;
- (UIButton)seeOriginalButton;
- (UIButton)seeRefinedButton;
- (UILabel)titleLabel;
- (UIPencilInteraction)pencilInteraction;
- (UIStackView)stackView;
- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3;
- (id)createElementButtonWithTitle:(id)a3 image:(id)a4;
- (int64_t)type;
- (void)applicationDidBecomeActive:(id)a3;
- (void)applicationWillResignActive:(id)a3;
- (void)beginAnimation;
- (void)cancelAnimation;
- (void)canvasView:(id)a3 didRefineStrokes:(id)a4 withNewStrokes:(id)a5;
- (void)canvasViewDidBeginUsingTool:(id)a3;
- (void)canvasViewDrawingDidChange:(id)a3;
- (void)clearButtonPressed:(id)a3;
- (void)clearCanvas;
- (void)clearTrackedStrokes;
- (void)dealloc;
- (void)hidePlayer:(BOOL)a3;
- (void)initCanvasMaskLayer;
- (void)initCanvasView;
- (void)initClearButton;
- (void)initPlayer;
- (void)initReplayButton;
- (void)initSeeOriginalButton;
- (void)initSeeRefinedButton;
- (void)initStackView;
- (void)initTextLine;
- (void)initTitleLabel;
- (void)notNowPressed:(id)a3;
- (void)playerItemDidFinish:(id)a3;
- (void)processVideoRequest:(id)a3;
- (void)reloadStrings;
- (void)replayButtonPressed:(id)a3;
- (void)seeOriginalButtonPressed:(id)a3;
- (void)seeRefinedButtonPressed:(id)a3;
- (void)setButton:(id)a3 hidden:(BOOL)a4 animated:(BOOL)a5;
- (void)setCanvasMaskLayer:(id)a3;
- (void)setCanvasView:(id)a3;
- (void)setClearButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidDisappear:(BOOL)a3;
- (void)setDidEnableAutoRefine:(BOOL)a3;
- (void)setDidRunInitialAppearActions:(BOOL)a3;
- (void)setElementData:(id)a3;
- (void)setNonRefinableStrokes:(id)a3;
- (void)setOriginalStrokes:(id)a3;
- (void)setPencilInteraction:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setPlayerLayer:(id)a3;
- (void)setRefinedStrokes:(id)a3;
- (void)setReplayButton:(id)a3;
- (void)setSeeOriginalButton:(id)a3;
- (void)setSeeRefinedButton:(id)a3;
- (void)setStackView:(id)a3;
- (void)setTextLineLayer:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)showPlayer:(BOOL)a3;
- (void)startObservingNotifications;
- (void)stopPlayer;
- (void)turnOnPressed:(id)a3;
- (void)updateButtonTray:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PencilHandwritingEducationElementViewController

- (PencilHandwritingEducationElementViewController)initWithElementData:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PencilHandwritingEducationElementViewController;
  v6 = [(PencilHandwritingEducationElementViewController *)&v15 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_elementData, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    nonRefinableStrokes = v7->_nonRefinableStrokes;
    v7->_nonRefinableStrokes = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    originalStrokes = v7->_originalStrokes;
    v7->_originalStrokes = v10;

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    refinedStrokes = v7->_refinedStrokes;
    v7->_refinedStrokes = v12;
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PencilHandwritingEducationElementViewController;
  [(PencilHandwritingEducationElementViewController *)&v4 dealloc];
}

- (void)initStackView
{
  id v3 = objc_alloc_init(MEMORY[0x263F1C9B8]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 setAlignment:3];
  [v3 setAxis:1];
  [v3 setSpacing:15.0];
  [(PencilHandwritingEducationElementViewController *)self setStackView:v3];
}

- (void)initTitleLabel
{
  id v7 = objc_alloc_init(MEMORY[0x263F1C768]);
  [v7 setNumberOfLines:0];
  [v7 setTextAlignment:1];
  id v3 = (void *)MEMORY[0x263F81708];
  uint64_t v4 = *MEMORY[0x263F1D260];
  id v5 = [(PencilHandwritingEducationElementViewController *)self traitCollection];
  v6 = [v3 preferredFontForTextStyle:v4 compatibleWithTraitCollection:v5];

  [v7 setFont:v6];
  [(PencilHandwritingEducationElementViewController *)self setTitleLabel:v7];
}

- (void)initCanvasView
{
  id v5 = objc_alloc_init(MEMORY[0x263F14AD0]);
  id v3 = [v5 _tiledView];
  [v3 setIsAutoRefineEnabled:1];

  uint64_t v4 = [MEMORY[0x263F1C550] clearColor];
  [v5 setBackgroundColor:v4];

  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v5 setDelegate:self];
  [(PencilHandwritingEducationElementViewController *)self setCanvasView:v5];
}

- (void)initTextLine
{
  uint64_t v4 = objc_alloc_init(TextLineLayer);
  [(TextLineLayer *)v4 setLineWidth:1.0];
  [(TextLineLayer *)v4 setCenterOffset:12.5];
  id v3 = [MEMORY[0x263F1C550] systemGrayColor];
  [(TextLineLayer *)v4 setLineColor:v3];

  [(TextLineLayer *)v4 setZPosition:-1.0];
  -[TextLineLayer setInsets:](v4, "setInsets:", 0.0, 24.0, 0.0, 24.0);
  [(PencilHandwritingEducationElementViewController *)self setTextLineLayer:v4];
}

- (void)initPlayer
{
  id v3 = PencilPairingUIBundle();
  uint64_t v4 = [v3 URLForResource:@"autoRefineSample" withExtension:@"mov"];

  id v5 = [MEMORY[0x263EFA800] playerItemWithURL:v4];
  v6 = [MEMORY[0x263EFA7F0] playerWithPlayerItem:v5];
  id v7 = (void *)MEMORY[0x263EFA8D8];
  v8 = [v6 currentItem];
  v9 = [v8 asset];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __61__PencilHandwritingEducationElementViewController_initPlayer__block_invoke;
  v13[3] = &unk_264DA5DA8;
  v13[4] = self;
  v10 = [v7 videoCompositionWithAsset:v9 applyingCIFiltersWithHandler:v13];

  v11 = [v6 currentItem];
  [v11 setVideoComposition:v10];

  [(PencilHandwritingEducationElementViewController *)self setPlayer:v6];
  v12 = [MEMORY[0x263EFA838] playerLayerWithPlayer:v6];
  [v12 setVideoGravity:*MEMORY[0x263EF9C70]];
  [(PencilHandwritingEducationElementViewController *)self setPlayerLayer:v12];
}

uint64_t __61__PencilHandwritingEducationElementViewController_initPlayer__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) processVideoRequest:a2];
}

- (void)initCanvasMaskLayer
{
  id v3 = (id)objc_opt_new();
  [v3 setCornerRadius:10.0];
  [v3 setBlurRadius:8.0];
  objc_msgSend(v3, "setInsets:", 5.0, 5.0, 50.0, 24.0);
  [(PencilHandwritingEducationElementViewController *)self setCanvasMaskLayer:v3];
}

- (void)initReplayButton
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"REPLAY_BUTTON_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  id v5 = [MEMORY[0x263F1C6B0] systemImageNamed:@"arrow.counterclockwise"];
  id v6 = [(PencilHandwritingEducationElementViewController *)self createElementButtonWithTitle:v4 image:v5];

  [v6 setHidden:1];
  [v6 addTarget:self action:sel_replayButtonPressed_ forControlEvents:64];
  [(PencilHandwritingEducationElementViewController *)self setReplayButton:v6];
}

- (void)initSeeRefinedButton
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"SEE_REFINED_BUTTON_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  id v5 = [(PencilHandwritingEducationElementViewController *)self createElementButtonWithTitle:v4 image:0];

  [v5 setHidden:1];
  [v5 addTarget:self action:sel_seeRefinedButtonPressed_ forControlEvents:64];
  [(PencilHandwritingEducationElementViewController *)self setSeeRefinedButton:v5];
}

- (void)initSeeOriginalButton
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"SEE_ORIGINAL_BUTTON_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
  id v5 = [(PencilHandwritingEducationElementViewController *)self createElementButtonWithTitle:v4 image:0];

  [v5 setHidden:1];
  [v5 addTarget:self action:sel_seeOriginalButtonPressed_ forControlEvents:64];
  [(PencilHandwritingEducationElementViewController *)self setSeeOriginalButton:v5];
}

- (id)createElementButtonWithTitle:(id)a3 image:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x263F1C488]);
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  v9 = [(PencilHandwritingEducationElementViewController *)self view];
  v10 = [v9 tintColor];

  v11 = [v8 imageView];
  [v11 setTintColor:v10];

  [v8 setTitleColor:v10 forState:0];
  if (v6) {
    [v8 setTitle:v6 forState:0];
  }
  if (v7) {
    [v8 setImage:v7 forState:0];
  }
  v12 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F1D260] variant:1024];
  v13 = [v8 titleLabel];
  [v13 setFont:v12];

  if (v7)
  {
    v14 = [MEMORY[0x263F1C6C8] configurationWithFont:v12 scale:-1];
    objc_super v15 = [(PencilHandwritingEducationElementViewController *)self traitCollection];
    if ([v15 layoutDirection] == 1) {
      double v16 = 7.0;
    }
    else {
      double v16 = -7.0;
    }

    objc_msgSend(v8, "setImageEdgeInsets:", 0.0, v16, 0.0, 0.0);
    [v8 setPreferredSymbolConfiguration:v14 forImageInState:0];
  }

  return v8;
}

- (void)initClearButton
{
  id v8 = (id)objc_opt_new();
  id v3 = [MEMORY[0x263F1C6B0] systemImageNamed:@"xmark.circle.fill"];
  [v8 setImage:v3 forState:0];

  [v8 setHidden:1];
  uint64_t v4 = [v8 imageView];
  id v5 = [MEMORY[0x263F1C550] systemGrayColor];
  [v4 setTintColor:v5];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v8 addTarget:self action:sel_clearButtonPressed_ forControlEvents:64];
  id v6 = [v8 widthAnchor];
  id v7 = [v6 constraintEqualToConstant:24.0];
  [v7 setActive:1];

  [(PencilHandwritingEducationElementViewController *)self setClearButton:v8];
}

- (void)startObservingNotifications
{
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = *MEMORY[0x263EFA050];
  uint64_t v4 = [(PencilHandwritingEducationElementViewController *)self player];
  id v5 = [v4 currentItem];
  [v6 addObserver:self selector:sel_playerItemDidFinish_ name:v3 object:v5];

  [v6 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x263F1D0D8] object:0];
  [v6 addObserver:self selector:sel_applicationDidBecomeActive_ name:*MEMORY[0x263F1D038] object:0];
}

- (void)viewDidLoad
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  v92.receiver = self;
  v92.super_class = (Class)PencilHandwritingEducationElementViewController;
  [(PencilHandwritingEducationElementViewController *)&v92 viewDidLoad];
  [(PencilHandwritingEducationElementViewController *)self initStackView];
  [(PencilHandwritingEducationElementViewController *)self initTitleLabel];
  [(PencilHandwritingEducationElementViewController *)self initCanvasView];
  [(PencilHandwritingEducationElementViewController *)self initTextLine];
  [(PencilHandwritingEducationElementViewController *)self initPlayer];
  [(PencilHandwritingEducationElementViewController *)self initCanvasMaskLayer];
  [(PencilHandwritingEducationElementViewController *)self initReplayButton];
  [(PencilHandwritingEducationElementViewController *)self initSeeRefinedButton];
  [(PencilHandwritingEducationElementViewController *)self initSeeOriginalButton];
  [(PencilHandwritingEducationElementViewController *)self initClearButton];
  id v3 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v4 = [v3 heightAnchor];
  id v5 = [v4 constraintEqualToConstant:5.0];
  [v5 setActive:1];

  id v6 = objc_alloc_init(MEMORY[0x263F1CB60]);
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v7 = [v6 heightAnchor];
  id v8 = [v7 constraintGreaterThanOrEqualToConstant:20.0];
  [v8 setActive:1];

  v9 = [(PencilHandwritingEducationElementViewController *)self stackView];
  v10 = [(PencilHandwritingEducationElementViewController *)self titleLabel];
  v11 = [(PencilHandwritingEducationElementViewController *)self canvasView];
  [v9 addArrangedSubview:v3];
  [v9 addArrangedSubview:v10];
  [v9 addArrangedSubview:v11];
  [v9 addArrangedSubview:v6];
  v12 = [(PencilHandwritingEducationElementViewController *)self view];
  [v12 addSubview:v9];

  v13 = [v9 leadingAnchor];
  v14 = [(PencilHandwritingEducationElementViewController *)self view];
  objc_super v15 = [v14 leadingAnchor];
  double v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [v9 trailingAnchor];
  v18 = [(PencilHandwritingEducationElementViewController *)self view];
  v19 = [v18 trailingAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v20 setActive:1];

  v21 = [v9 topAnchor];
  v22 = [(PencilHandwritingEducationElementViewController *)self view];
  v23 = [v22 topAnchor];
  v24 = [v21 constraintEqualToAnchor:v23];
  [v24 setActive:1];

  v25 = [v9 bottomAnchor];
  v26 = [(PencilHandwritingEducationElementViewController *)self view];
  v27 = [v26 bottomAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  LODWORD(v29) = 1148846080;
  [v9 setContentCompressionResistancePriority:1 forAxis:v29];
  v86 = v3;
  v30 = [v3 widthAnchor];
  v31 = [v9 widthAnchor];
  v32 = [v30 constraintEqualToAnchor:v31 multiplier:1.0];
  [v32 setActive:1];

  v85 = v6;
  v33 = [v6 widthAnchor];
  v34 = [v9 widthAnchor];
  v35 = [v33 constraintEqualToAnchor:v34 multiplier:1.0];
  [v35 setActive:1];

  v36 = [v11 heightAnchor];
  v37 = [v36 constraintEqualToConstant:250.0];
  [v37 setActive:1];

  v38 = [v11 widthAnchor];
  v87 = v9;
  v39 = [v9 widthAnchor];
  v40 = [v38 constraintEqualToAnchor:v39];
  [v40 setActive:1];

  LODWORD(v41) = 1148846080;
  [v11 setContentHuggingPriority:1 forAxis:v41];
  LODWORD(v42) = 1148846080;
  [v11 setContentCompressionResistancePriority:1 forAxis:v42];
  LODWORD(v43) = 1148846080;
  [v10 setContentHuggingPriority:1 forAxis:v43];
  v84 = v10;
  LODWORD(v44) = 1148846080;
  [v10 setContentCompressionResistancePriority:1 forAxis:v44];
  uint64_t v45 = [(PencilHandwritingEducationElementViewController *)self playerLayer];
  v46 = [v11 layer];
  v47 = [v11 layer];
  v83 = (void *)v45;
  [v46 insertSublayer:v45 above:v47];

  v48 = [(PencilHandwritingEducationElementViewController *)self textLineLayer];
  v49 = [v11 layer];
  [v49 bounds];
  objc_msgSend(v48, "setFrame:");

  v50 = [(PencilHandwritingEducationElementViewController *)self view];
  v51 = [v50 layer];
  v82 = v48;
  [v51 insertSublayer:v48 atIndex:0];

  v52 = [(PencilHandwritingEducationElementViewController *)self canvasMaskLayer];
  v53 = [v11 layer];
  [v53 bounds];
  objc_msgSend(v52, "setFrame:");

  v54 = v11;
  v55 = [v11 layer];
  v81 = v52;
  [v55 setMask:v52];

  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  v56 = [(PencilHandwritingEducationElementViewController *)self replayButton];
  v93[0] = v56;
  v57 = [(PencilHandwritingEducationElementViewController *)self seeOriginalButton];
  v93[1] = v57;
  v58 = self;
  v59 = [(PencilHandwritingEducationElementViewController *)self seeRefinedButton];
  v93[2] = v59;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:3];

  uint64_t v61 = [v60 countByEnumeratingWithState:&v88 objects:v94 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v89;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v89 != v63) {
          objc_enumerationMutation(v60);
        }
        v65 = *(void **)(*((void *)&v88 + 1) + 8 * v64);
        v66 = [(PencilHandwritingEducationElementViewController *)v58 view];
        [v66 addSubview:v65];

        v67 = [v65 topAnchor];
        v68 = [v54 centerYAnchor];
        v69 = [v67 constraintEqualToAnchor:v68 constant:31.5];
        [v69 setActive:1];

        v70 = [v65 centerXAnchor];
        v71 = [v87 centerXAnchor];
        v72 = [v70 constraintEqualToAnchor:v71];
        [v72 setActive:1];

        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [v60 countByEnumeratingWithState:&v88 objects:v94 count:16];
    }
    while (v62);
  }

  v73 = [(PencilHandwritingEducationElementViewController *)v58 clearButton];
  v74 = [(PencilHandwritingEducationElementViewController *)v58 view];
  [v74 addSubview:v73];

  v75 = [v73 rightAnchor];
  v76 = [v54 rightAnchor];
  v77 = [v75 constraintEqualToAnchor:v76 constant:-24.0];
  [v77 setActive:1];

  v78 = [v73 centerYAnchor];
  v79 = [v54 centerYAnchor];
  v80 = [v78 constraintEqualToAnchor:v79 constant:-11.5];
  [v80 setActive:1];

  [(PencilHandwritingEducationElementViewController *)v58 reloadStrings];
  [(PencilHandwritingEducationElementViewController *)v58 startObservingNotifications];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PencilHandwritingEducationElementViewController;
  [(PencilHandwritingEducationElementViewController *)&v4 viewWillAppear:a3];
  if (![(PencilHandwritingEducationElementViewController *)self didRunInitialAppearActions]|| [(PencilHandwritingEducationElementViewController *)self didDisappear])
  {
    [(PencilHandwritingEducationElementViewController *)self setDidRunInitialAppearActions:1];
    [(PencilHandwritingEducationElementViewController *)self setDidDisappear:0];
    [(PencilHandwritingEducationElementViewController *)self reloadStrings];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PencilHandwritingEducationElementViewController;
  [(PencilHandwritingEducationElementViewController *)&v8 viewDidAppear:a3];
  objc_super v4 = [(PencilHandwritingEducationElementViewController *)self delegate];
  [v4 elementControllerDidAppear:self];

  if (![(PencilHandwritingEducationElementViewController *)self isPlayerHidden])
  {
    id v5 = [(PencilHandwritingEducationElementViewController *)self player];
    [v5 play];
  }
  id v6 = objc_alloc_init(MEMORY[0x263F1C848]);
  id v7 = [(PencilHandwritingEducationElementViewController *)self view];
  [v7 addInteraction:v6];

  [v6 setDelegate:self];
  [(PencilHandwritingEducationElementViewController *)self setPencilInteraction:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PencilHandwritingEducationElementViewController;
  [(PencilHandwritingEducationElementViewController *)&v5 viewWillDisappear:0];
  if (![(PencilHandwritingEducationElementViewController *)self isPlayerHidden])
  {
    objc_super v4 = [(PencilHandwritingEducationElementViewController *)self player];
    [v4 pause];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PencilHandwritingEducationElementViewController;
  [(PencilHandwritingEducationElementViewController *)&v7 viewDidDisappear:a3];
  if (![(PencilHandwritingEducationElementViewController *)self isPlayerHidden])
  {
    objc_super v4 = [(PencilHandwritingEducationElementViewController *)self player];
    [v4 pause];
  }
  [(PencilHandwritingEducationElementViewController *)self setDidDisappear:1];
  objc_super v5 = [(PencilHandwritingEducationElementViewController *)self view];
  id v6 = [(PencilHandwritingEducationElementViewController *)self pencilInteraction];
  [v5 removeInteraction:v6];
}

- (void)viewDidLayoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)PencilHandwritingEducationElementViewController;
  [(PencilHandwritingEducationElementViewController *)&v28 viewDidLayoutSubviews];
  id v3 = [(PencilHandwritingEducationElementViewController *)self playerLayer];
  objc_super v4 = [(PencilHandwritingEducationElementViewController *)self canvasView];
  objc_super v5 = [v4 layer];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  objc_msgSend(v3, "setFrame:", v7, v9 + -8.0, v11, v13);
  [v3 setNeedsDisplay];
  v14 = [(PencilHandwritingEducationElementViewController *)self view];
  [v4 bounds];
  objc_msgSend(v14, "convertRect:fromView:", v4);
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(PencilHandwritingEducationElementViewController *)self textLineLayer];
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  v24 = [(PencilHandwritingEducationElementViewController *)self textLineLayer];
  [v24 setNeedsDisplay];

  v25 = [(PencilHandwritingEducationElementViewController *)self canvasMaskLayer];
  v26 = [v4 layer];
  [v26 bounds];
  objc_msgSend(v25, "setFrame:");

  v27 = [(PencilHandwritingEducationElementViewController *)self canvasMaskLayer];
  [v27 setNeedsDisplay];
}

- (double)calculateFittingHeightByTemporarilyAdjustingFrameForWidth:(double)a3
{
  objc_super v5 = [(PencilHandwritingEducationElementViewController *)self view];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  v14 = [(PencilHandwritingEducationElementViewController *)self view];
  objc_msgSend(v14, "setFrame:", v7, v9, a3, v13);

  double v15 = [(PencilHandwritingEducationElementViewController *)self view];
  [v15 layoutIfNeeded];

  double v16 = [(PencilHandwritingEducationElementViewController *)self stackView];
  objc_msgSend(v16, "systemLayoutSizeFittingSize:", *MEMORY[0x263F1D490], *(double *)(MEMORY[0x263F1D490] + 8));
  double v18 = v17;

  double v19 = [(PencilHandwritingEducationElementViewController *)self view];
  objc_msgSend(v19, "setFrame:", v7, v9, v11, v13);

  return v18;
}

- (void)processVideoRequest:(id)a3
{
  id v4 = a3;
  id v37 = [v4 sourceImage];
  objc_super v5 = [(PencilHandwritingEducationElementViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];

  double v7 = (void *)MEMORY[0x263F00968];
  if (v6 == 2)
  {
    double v8 = [MEMORY[0x263F00640] colorInvertFilter];
    [v8 setValue:v37 forKey:*v7];
    uint64_t v9 = [v8 outputImage];

    id v37 = (id)v9;
  }
  double v10 = [(PencilHandwritingEducationElementViewController *)self traitCollection];
  if ([v10 userInterfaceStyle] == 2) {
    [MEMORY[0x263F00640] lightenBlendModeFilter];
  }
  else {
  double v11 = [MEMORY[0x263F00640] multiplyBlendModeFilter];
  }

  double v12 = [(PencilHandwritingEducationElementViewController *)self traitCollection];
  if ([v12 userInterfaceStyle] == 2) {
    [MEMORY[0x263F1C550] secondarySystemBackgroundColor];
  }
  else {
  double v13 = [MEMORY[0x263F1C550] systemBackgroundColor];
  }

  [v37 extent];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  v39.width = v14;
  v39.height = v16;
  UIGraphicsBeginImageContext(v39);
  [v13 setFill];
  v40.origin.x = 0.0;
  v40.origin.y = 0.0;
  v40.size.width = v15;
  v40.size.height = v17;
  UIRectFill(v40);
  double v18 = [(PencilHandwritingEducationElementViewController *)self textLineLayer];
  CurrentContext = UIGraphicsGetCurrentContext();
  double v20 = [MEMORY[0x263F1C920] mainScreen];
  [v20 scale];
  double v22 = v21;
  [v37 extent];
  double v24 = v23;
  [v18 bounds];
  double v26 = v22 * (v24 / v25);

  [v18 lineWidth];
  CGFloat v28 = v27 * v26;
  [v37 extent];
  float v29 = CGRectGetMidY(v41) + v26 * 20.5 + v28 * -0.5;
  CGFloat v30 = floorf(v29);
  [v37 extent];
  CGFloat v31 = CGRectGetWidth(v42) + v26 * -48.0;
  UIGraphicsPushContext(CurrentContext);
  id v32 = [v18 lineColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v32 CGColor]);

  CGContextSetLineWidth(CurrentContext, v28);
  v43.origin.x = v26 * 24.0;
  v43.origin.y = v30;
  v43.size.width = v31;
  v43.size.height = v28;
  CGContextFillRect(CurrentContext, v43);
  UIGraphicsPopContext();
  v33 = (void *)MEMORY[0x263F00650];
  UIGraphicsGetImageFromCurrentImageContext();
  id v34 = objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v33, "imageWithCGImage:", objc_msgSend(v34, "CGImage"));

  UIGraphicsEndImageContext();
  [v11 setValue:v37 forKey:*v7];
  [v11 setValue:v35 forKey:*MEMORY[0x263F00930]];
  v36 = [v11 outputImage];
  [v4 finishWithImage:v36 context:0];
}

- (void)replayButtonPressed:(id)a3
{
  [(PencilHandwritingEducationElementViewController *)self reloadStrings];
  [(PencilHandwritingEducationElementViewController *)self clearCanvas];
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_replayButton hidden:1 animated:1];
  id v4 = [(PencilHandwritingEducationElementViewController *)self player];
  long long v5 = *MEMORY[0x263F010E0];
  uint64_t v6 = *(void *)(MEMORY[0x263F010E0] + 16);
  [v4 seekToTime:&v5];
  [(PencilHandwritingEducationElementViewController *)self showPlayer:0];
  [v4 play];
}

- (void)seeRefinedButtonPressed:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F14AE0]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v5 = self->_refinedStrokes;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addNewStroke:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v10 = self->_nonRefinableStrokes;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v4, "addNewStroke:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  [(PKCanvasView *)self->_canvasView setDrawing:v4];
  [(PKCanvasView *)self->_canvasView setNeedsDisplay];
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_seeRefinedButton hidden:1 animated:0];
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_seeOriginalButton hidden:0 animated:1];
}

- (void)seeOriginalButtonPressed:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263F14AE0]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v5 = self->_originalStrokes;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [v4 addNewStroke:*(void *)(*((void *)&v19 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  double v10 = self->_nonRefinableStrokes;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        objc_msgSend(v4, "addNewStroke:", *(void *)(*((void *)&v15 + 1) + 8 * v14++), (void)v15);
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }

  [(PKCanvasView *)self->_canvasView setDrawing:v4];
  [(PKCanvasView *)self->_canvasView setNeedsDisplay];
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_seeOriginalButton hidden:1 animated:0];
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_seeRefinedButton hidden:0 animated:1];
}

- (void)clearButtonPressed:(id)a3
{
  [(PencilHandwritingEducationElementViewController *)self clearCanvas];
  [(PencilHandwritingEducationElementViewController *)self clearTrackedStrokes];
  if (![(PencilHandwritingEducationElementViewController *)self isPlayerHidden])
  {
    [(PencilHandwritingEducationElementViewController *)self stopPlayer];
    [(PencilHandwritingEducationElementViewController *)self hidePlayer:1];
  }
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_seeRefinedButton hidden:1 animated:0];
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_seeOriginalButton hidden:1 animated:0];
  replayButton = self->_replayButton;

  [(PencilHandwritingEducationElementViewController *)self setButton:replayButton hidden:0 animated:1];
}

- (void)clearTrackedStrokes
{
  [(NSMutableSet *)self->_originalStrokes removeAllObjects];
  [(NSMutableSet *)self->_refinedStrokes removeAllObjects];
  nonRefinableStrokes = self->_nonRefinableStrokes;

  [(NSMutableSet *)nonRefinableStrokes removeAllObjects];
}

- (void)updateButtonTray:(id)a3
{
  id v12 = a3;
  [v12 setHidden:1];
  [v12 removeAllButtons];
  id v4 = [(PencilHandwritingEducationElementViewController *)self elementData];
  uint64_t v5 = [v4 type];

  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263F5B898] boldButton];
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"AUTO_REFINE_TURN_ON_BUTTON_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
    [v6 setTitle:v8 forState:0];

    [v6 addTarget:self action:sel_turnOnPressed_ forControlEvents:64];
    [v12 addButton:v6];
    uint64_t v9 = [MEMORY[0x263F5B8D0] linkButton];
    double v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"AUTO_REFINE_NOT_NOW_BUTTON_TITLE" value:&stru_26ECD9920 table:@"PencilSettings"];
    [v9 setTitle:v11 forState:0];

    [v9 addTarget:self action:sel_notNowPressed_ forControlEvents:64];
    [v12 addButton:v9];
    [v12 setHidden:0];
  }
}

- (void)turnOnPressed:(id)a3
{
  id v4 = [(PencilHandwritingEducationElementViewController *)self elementData];
  uint64_t v5 = [v4 type];

  if (!v5)
  {
    uint64_t v6 = +[PencilSettings sharedPencilSettings];
    [v6 setAutoRefineEnabled:1];

    [(PencilHandwritingEducationElementViewController *)self setDidEnableAutoRefine:1];
    id v7 = [(PencilHandwritingEducationElementViewController *)self delegate];
    [v7 elementControllerShouldDismiss:self];
  }
}

- (void)notNowPressed:(id)a3
{
  id v4 = [(PencilHandwritingEducationElementViewController *)self elementData];
  uint64_t v5 = [v4 type];

  if (!v5)
  {
    uint64_t v6 = +[PencilSettings sharedPencilSettings];
    [v6 setAutoRefineEnabled:0];

    id v7 = [(PencilHandwritingEducationElementViewController *)self delegate];
    [v7 elementControllerShouldDismiss:self];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)reloadStrings
{
  id v5 = [(PencilHandwritingEducationElementViewController *)self elementData];
  id v3 = [v5 title];
  id v4 = [(PencilHandwritingEducationElementViewController *)self titleLabel];
  [v4 setAttributedText:v3];
}

- (void)clearCanvas
{
  id v3 = [(PencilHandwritingEducationElementViewController *)self canvasView];
  v2 = objc_opt_new();
  [v3 setDrawing:v2];

  [v3 setNeedsDisplay];
}

- (BOOL)hasRemainingAnimation
{
  return 0;
}

- (int64_t)type
{
  v2 = [(PencilHandwritingEducationElementViewController *)self elementData];
  int64_t v3 = [v2 type];

  return v3;
}

- (BOOL)animationInProgress
{
  return ![(PencilHandwritingEducationElementViewController *)self isPlayerHidden];
}

- (void)cancelAnimation
{
  if (![(PencilHandwritingEducationElementViewController *)self isPlayerHidden])
  {
    int64_t v3 = [(PencilHandwritingEducationElementViewController *)self player];
    [v3 pause];

    id v4 = [(PencilHandwritingEducationElementViewController *)self playerLayer];
    [v4 setHidden:1];
  }
}

- (void)beginAnimation
{
  if (![(PencilHandwritingEducationElementViewController *)self isPlayerHidden])
  {
    id v3 = [(PencilHandwritingEducationElementViewController *)self player];
    [v3 play];
  }
}

- (BOOL)isPlayerHidden
{
  v2 = [(PencilHandwritingEducationElementViewController *)self playerLayer];
  id v3 = [v2 superlayer];
  if (v3)
  {
    [v2 opacity];
    BOOL v5 = v4 != 1.0;
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)stopPlayer
{
  v2 = [(PencilHandwritingEducationElementViewController *)self player];
  [v2 pause];
  long long v3 = *MEMORY[0x263F010E0];
  uint64_t v4 = *(void *)(MEMORY[0x263F010E0] + 16);
  [v2 seekToTime:&v3];
}

- (void)hidePlayer:(BOOL)a3
{
  long long v3 = [(PencilHandwritingEducationElementViewController *)self playerLayer];
  uint64_t v4 = (void *)MEMORY[0x263F1CB60];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __62__PencilHandwritingEducationElementViewController_hidePlayer___block_invoke;
  v8[3] = &unk_264DA56A0;
  id v9 = v3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62__PencilHandwritingEducationElementViewController_hidePlayer___block_invoke_2;
  v6[3] = &unk_264DA5DD0;
  id v7 = v9;
  id v5 = v9;
  [v4 animateWithDuration:v8 animations:v6 completion:0.25];
}

uint64_t __62__PencilHandwritingEducationElementViewController_hidePlayer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setOpacity:0.0];
}

uint64_t __62__PencilHandwritingEducationElementViewController_hidePlayer___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperlayer];
}

- (void)showPlayer:(BOOL)a3
{
  uint64_t v4 = [(PencilHandwritingEducationElementViewController *)self playerLayer];
  id v5 = [v4 superlayer];

  if (!v5)
  {
    uint64_t v6 = [(PencilHandwritingEducationElementViewController *)self canvasView];
    id v7 = [v6 layer];
    uint64_t v8 = [(PencilHandwritingEducationElementViewController *)self textLineLayer];
    [v7 insertSublayer:v4 above:v8];
  }
  id v9 = (void *)MEMORY[0x263F1CB60];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __62__PencilHandwritingEducationElementViewController_showPlayer___block_invoke;
  v11[3] = &unk_264DA56A0;
  id v12 = v4;
  id v10 = v4;
  [v9 animateWithDuration:v11 animations:0.25];
}

uint64_t __62__PencilHandwritingEducationElementViewController_showPlayer___block_invoke(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  return [*(id *)(a1 + 32) setOpacity:a2];
}

- (void)setButton:(id)a3 hidden:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  int v6 = a4;
  id v7 = a3;
  if ([v7 isHidden] != v6)
  {
    if ([v7 isHidden])
    {
      [v7 setAlpha:0.0];
      [v7 setHidden:0];
    }
    if (v5) {
      double v8 = 0.25;
    }
    else {
      double v8 = 0.0;
    }
    id v9 = (void *)MEMORY[0x263F1CB60];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __77__PencilHandwritingEducationElementViewController_setButton_hidden_animated___block_invoke;
    v13[3] = &unk_264DA5740;
    id v14 = v7;
    char v15 = v6;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __77__PencilHandwritingEducationElementViewController_setButton_hidden_animated___block_invoke_2;
    v10[3] = &unk_264DA5DF8;
    id v11 = v14;
    char v12 = v6;
    [v9 animateWithDuration:v13 animations:v10 completion:v8];
  }
}

uint64_t __77__PencilHandwritingEducationElementViewController_setButton_hidden_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

uint64_t __77__PencilHandwritingEducationElementViewController_setButton_hidden_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setHidden:*(unsigned __int8 *)(a1 + 40)];
}

- (void)playerItemDidFinish:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__PencilHandwritingEducationElementViewController_playerItemDidFinish___block_invoke;
  block[3] = &unk_264DA56A0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __71__PencilHandwritingEducationElementViewController_playerItemDidFinish___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  long long v3 = [v2 replayButton];
  [v2 setButton:v3 hidden:0 animated:1];

  id v4 = [*(id *)(a1 + 32) clearButton];
  [v4 setHidden:0];
}

- (void)applicationWillResignActive:(id)a3
{
  if (![(PencilHandwritingEducationElementViewController *)self isPlayerHidden])
  {
    id v4 = [(PencilHandwritingEducationElementViewController *)self player];
    [v4 pause];
  }
}

- (void)applicationDidBecomeActive:(id)a3
{
  if (![(PencilHandwritingEducationElementViewController *)self isPlayerHidden])
  {
    id v4 = [(PencilHandwritingEducationElementViewController *)self player];
    [v4 play];
  }
}

- (void)canvasViewDidBeginUsingTool:(id)a3
{
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_replayButton hidden:1 animated:0];
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_seeRefinedButton hidden:1 animated:0];
  [(PencilHandwritingEducationElementViewController *)self setButton:self->_seeOriginalButton hidden:1 animated:0];
  if (![(PencilHandwritingEducationElementViewController *)self isPlayerHidden])
  {
    [(PencilHandwritingEducationElementViewController *)self stopPlayer];
    [(PencilHandwritingEducationElementViewController *)self hidePlayer:0];
  }
}

- (void)canvasViewDrawingDidChange:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__PencilHandwritingEducationElementViewController_canvasViewDrawingDidChange___block_invoke;
  block[3] = &unk_264DA56A0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __78__PencilHandwritingEducationElementViewController_canvasViewDrawingDidChange___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) canvasView];
  v2 = [v6 drawing];
  long long v3 = [v2 strokes];
  BOOL v4 = [v3 count] == 0;
  BOOL v5 = [*(id *)(a1 + 32) clearButton];
  [v5 setHidden:v4];
}

- (void)canvasView:(id)a3 didRefineStrokes:(id)a4 withNewStrokes:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__PencilHandwritingEducationElementViewController_canvasView_didRefineStrokes_withNewStrokes___block_invoke;
  block[3] = &unk_264DA5E20;
  objc_copyWeak(&v18, &location);
  id v15 = v9;
  id v16 = v10;
  id v17 = v8;
  id v11 = v8;
  id v12 = v10;
  id v13 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __94__PencilHandwritingEducationElementViewController_canvasView_didRefineStrokes_withNewStrokes___block_invoke(uint64_t a1)
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));

  if (WeakRetained)
  {
    BOOL v4 = (id *)objc_loadWeakRetained(v2);
    [v4[137] addObjectsFromArray:*(void *)(a1 + 32)];
    [v4[138] addObjectsFromArray:*(void *)(a1 + 40)];
    id v5 = objc_alloc(MEMORY[0x263EFF980]);
    id v6 = [*(id *)(a1 + 48) drawing];
    id v7 = [v6 strokes];
    id v8 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v4[136], "count") + objc_msgSend(v7, "count"));

    id v9 = [*(id *)(a1 + 48) drawing];
    id v10 = [v9 strokes];
    [v8 addObjectsFromArray:v10];

    id v11 = [v4[136] allObjects];
    [v8 addObjectsFromArray:v11];

    id v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9A0]), "initWithCapacity:", objc_msgSend(v8, "count"));
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v13 = v8;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v36 != v16) {
            objc_enumerationMutation(v13);
          }
          id v18 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          long long v19 = [v18 _strokeUUID];
          [v12 setObject:v18 forKey:v19];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v35 objects:v40 count:16];
      }
      while (v15);
    }

    long long v20 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v4[138], "count") + objc_msgSend(v4[137], "count"));
    long long v21 = [v4[138] allObjects];
    [v20 addObjectsFromArray:v21];

    long long v22 = [v4[137] allObjects];
    [v20 addObjectsFromArray:v22];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v23 = v20;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v32;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v32 != v26) {
            objc_enumerationMutation(v23);
          }
          CGFloat v28 = [*(id *)(*((void *)&v31 + 1) + 8 * j) _strokeUUID];
          [v12 removeObjectForKey:v28];
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v25);
    }

    [v4[136] removeAllObjects];
    id v29 = v4[136];
    CGFloat v30 = [v12 allValues];
    [v29 addObjectsFromArray:v30];

    [v4 setButton:v4[134] hidden:1 animated:0];
    [v4 setButton:v4[132] hidden:1 animated:0];
    [v4 setButton:v4[135] hidden:0 animated:1];
  }
}

- (PencilHandwritingEducationElementViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PencilHandwritingEducationElementViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (PencilHandwritingEducationElementData)elementData
{
  return self->_elementData;
}

- (void)setElementData:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (PKCanvasView)canvasView
{
  return self->_canvasView;
}

- (void)setCanvasView:(id)a3
{
}

- (AVPlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayerLayer)playerLayer
{
  return self->_playerLayer;
}

- (void)setPlayerLayer:(id)a3
{
}

- (TextLineLayer)textLineLayer
{
  return self->_textLineLayer;
}

- (void)setTextLineLayer:(id)a3
{
}

- (CALayer)canvasMaskLayer
{
  return self->_canvasMaskLayer;
}

- (void)setCanvasMaskLayer:(id)a3
{
}

- (BOOL)didEnableAutoRefine
{
  return self->_didEnableAutoRefine;
}

- (void)setDidEnableAutoRefine:(BOOL)a3
{
  self->_didEnableAutoRefine = a3;
}

- (UIButton)replayButton
{
  return self->_replayButton;
}

- (void)setReplayButton:(id)a3
{
}

- (UIButton)clearButton
{
  return self->_clearButton;
}

- (void)setClearButton:(id)a3
{
}

- (UIButton)seeRefinedButton
{
  return self->_seeRefinedButton;
}

- (void)setSeeRefinedButton:(id)a3
{
}

- (UIButton)seeOriginalButton
{
  return self->_seeOriginalButton;
}

- (void)setSeeOriginalButton:(id)a3
{
}

- (BOOL)didDisappear
{
  return self->_didDisappear;
}

- (void)setDidDisappear:(BOOL)a3
{
  self->_didDisappear = a3;
}

- (BOOL)didRunInitialAppearActions
{
  return self->_didRunInitialAppearActions;
}

- (void)setDidRunInitialAppearActions:(BOOL)a3
{
  self->_didRunInitialAppearActions = a3;
}

- (NSMutableSet)nonRefinableStrokes
{
  return self->_nonRefinableStrokes;
}

- (void)setNonRefinableStrokes:(id)a3
{
}

- (NSMutableSet)originalStrokes
{
  return self->_originalStrokes;
}

- (void)setOriginalStrokes:(id)a3
{
}

- (NSMutableSet)refinedStrokes
{
  return self->_refinedStrokes;
}

- (void)setRefinedStrokes:(id)a3
{
}

- (UIPencilInteraction)pencilInteraction
{
  return self->_pencilInteraction;
}

- (void)setPencilInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pencilInteraction, 0);
  objc_storeStrong((id *)&self->_refinedStrokes, 0);
  objc_storeStrong((id *)&self->_originalStrokes, 0);
  objc_storeStrong((id *)&self->_nonRefinableStrokes, 0);
  objc_storeStrong((id *)&self->_seeOriginalButton, 0);
  objc_storeStrong((id *)&self->_seeRefinedButton, 0);
  objc_storeStrong((id *)&self->_clearButton, 0);
  objc_storeStrong((id *)&self->_replayButton, 0);
  objc_storeStrong((id *)&self->_canvasMaskLayer, 0);
  objc_storeStrong((id *)&self->_textLineLayer, 0);
  objc_storeStrong((id *)&self->_playerLayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_canvasView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_elementData, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end