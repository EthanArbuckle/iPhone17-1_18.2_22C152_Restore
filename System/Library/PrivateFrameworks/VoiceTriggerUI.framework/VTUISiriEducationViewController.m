@interface VTUISiriEducationViewController
- (VTUISiriEducationViewController)initWithTitle:(id)a3 detailText:(id)a4 style:(id)a5 delegate:(id)a6;
- (void)_continueButtonPressed;
- (void)_fadeInSubViews;
- (void)_setupContinueButton;
- (void)_setupImageContainerViewForTraitCollection:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VTUISiriEducationViewController

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUISiriEducationViewController;
  [(VTUISiriEducationViewController *)&v6 viewWillAppear:a3];
  v4 = [(VTUISiriEducationViewController *)self headerView];
  [v4 setAlpha:0.0];

  v5 = [(VTUISiriEducationViewController *)self contentView];
  [v5 setAlpha:0.0];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VTUISiriEducationViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(VTUISiriEducationViewController *)self _fadeInSubViews];
}

- (VTUISiriEducationViewController)initWithTitle:(id)a3 detailText:(id)a4 style:(id)a5 delegate:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)VTUISiriEducationViewController;
  v13 = [(VTUISiriEducationViewController *)&v17 initWithTitle:a3 detailText:a4 icon:0 contentLayout:2];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_style, a5);
    objc_storeWeak((id *)&v14->_delegate, v12);
    v15 = [(VTUISiriEducationViewController *)v14 traitCollection];
    [(VTUISiriEducationViewController *)v14 _setupImageContainerViewForTraitCollection:v15];

    [(VTUISiriEducationViewController *)v14 _setupContinueButton];
  }

  return v14;
}

- (void)_setupContinueButton
{
  id v6 = [MEMORY[0x263F5B898] boldButton];
  v3 = +[VTUIStringsHelper sharedStringsHelper];
  objc_super v4 = [v3 uiLocalizedStringForKey:@"BUTTON_CONTINUE_SETUP"];
  [v6 setTitle:v4 forState:0];

  [v6 addTarget:self action:sel__continueButtonPressed forControlEvents:64];
  v5 = [(VTUISiriEducationViewController *)self buttonTray];
  [v5 addButton:v6];
}

- (void)_setupImageContainerViewForTraitCollection:(id)a3
{
  v54[4] = *MEMORY[0x263EF8340];
  objc_super v4 = [(VTUIStyle *)self->_style educationAssetNameForTraitCollection:a3];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = NSURL;
  v7 = [v5 pathForResource:v4 ofType:@"mov"];
  v8 = [v6 fileURLWithPath:v7];

  v9 = (void *)[objc_alloc(MEMORY[0x263EFA800]) initWithURL:v8];
  v10 = (void *)[objc_alloc(MEMORY[0x263EFA860]) initWithPlayerItem:v9];
  p_player = &self->_player;
  objc_storeStrong((id *)&self->_player, v10);
  id v12 = objc_alloc(MEMORY[0x263EFA840]);
  long long v13 = *(_OWORD *)(MEMORY[0x263F010C0] + 16);
  v53[0] = *MEMORY[0x263F010C0];
  v53[1] = v13;
  v53[2] = *(_OWORD *)(MEMORY[0x263F010C0] + 32);
  v14 = (AVPlayerLooper *)[v12 initWithPlayer:v10 templateItem:v9 timeRange:v53];
  playerLooper = self->_playerLooper;
  self->_playerLooper = v14;

  playerViewController = self->_playerViewController;
  if (!playerViewController)
  {
    v50 = v8;
    objc_super v17 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x263EFA9C8]);
    [(AVPlayerViewController *)v17 setShowsPlaybackControls:0];
    [(AVPlayerViewController *)v17 setAllowsPictureInPicturePlayback:0];
    [(AVPlayerViewController *)v17 view];
    v18 = v49 = v9;
    [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

    v19 = [(AVPlayerViewController *)v17 view];
    [MEMORY[0x263F825C8] systemBackgroundColor];
    v20 = v52 = v4;
    [v19 setBackgroundColor:v20];

    v21 = self->_playerViewController;
    self->_playerViewController = v17;
    v45 = v17;

    v22 = [(VTUISiriEducationViewController *)self contentView];
    v23 = [(AVPlayerViewController *)v45 view];
    [v22 addSubview:v23];

    [(VTUIStyle *)self->_style educationAssetSize];
    double v25 = v24;
    double v27 = v26;
    [(VTUIStyle *)self->_style educationAssetTopPadding];
    float v29 = v28;
    v41 = (void *)MEMORY[0x263F08938];
    v48 = [(AVPlayerViewController *)self->_playerViewController view];
    v46 = [v48 topAnchor];
    v47 = [(VTUISiriEducationViewController *)self contentView];
    v44 = [v47 topAnchor];
    v43 = [v46 constraintEqualToAnchor:v44 constant:v29];
    v54[0] = v43;
    v42 = [(AVPlayerViewController *)self->_playerViewController view];
    v39 = [v42 centerXAnchor];
    v40 = [(VTUISiriEducationViewController *)self contentView];
    v38 = [v40 centerXAnchor];
    v37 = [v39 constraintEqualToAnchor:v38 constant:0.0];
    v54[1] = v37;
    v30 = [(AVPlayerViewController *)self->_playerViewController view];
    [v30 heightAnchor];
    v31 = v51 = v5;
    v32 = [v31 constraintEqualToConstant:v27];
    v54[2] = v32;
    v33 = [(AVPlayerViewController *)self->_playerViewController view];
    v34 = [v33 widthAnchor];
    v35 = [v34 constraintEqualToConstant:v25];
    v54[3] = v35;
    v36 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:4];
    [v41 activateConstraints:v36];

    v9 = v49;
    v8 = v50;

    p_player = &self->_player;
    v5 = v51;

    objc_super v4 = v52;
    playerViewController = self->_playerViewController;
  }
  [(AVPlayerViewController *)playerViewController setPlayer:*p_player];
}

- (void)traitCollectionDidChange:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VTUISiriEducationViewController;
  [(VTUISiriEducationViewController *)&v5 traitCollectionDidChange:a3];
  objc_super v4 = [(VTUISiriEducationViewController *)self traitCollection];
  [(VTUISiriEducationViewController *)self _setupImageContainerViewForTraitCollection:v4];
}

- (void)_continueButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained siriEducationViewControllerContinuePressed:self];
}

- (void)_fadeInSubViews
{
  v3 = [(VTUISiriEducationViewController *)self headerView];
  [v3 setAlpha:0.0];

  objc_super v4 = [(VTUISiriEducationViewController *)self contentView];
  [v4 setAlpha:0.0];

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke;
  v7[3] = &unk_264D4C280;
  v7[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v7 options:0 animations:0.400000006 completion:0.0];
  v5[4] = self;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke_2;
  v6[3] = &unk_264D4C280;
  v6[4] = self;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke_3;
  v5[3] = &unk_264D4C5B0;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v6 options:v5 animations:0.400000006 completion:0.300000012];
}

void __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) headerView];
  [v1 setAlpha:1.0];
}

void __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contentView];
  [v1 setAlpha:1.0];
}

uint64_t __50__VTUISiriEducationViewController__fadeInSubViews__block_invoke_3(uint64_t a1, double a2)
{
  LODWORD(a2) = 1.0;
  return [*(id *)(*(void *)(a1 + 32) + 1216) playImmediatelyAtRate:a2];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerLooper, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_style, 0);
}

@end