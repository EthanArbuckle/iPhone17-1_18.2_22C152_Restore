@interface COSScanWatchDynamicHelpViewController
- (BOOL)discoveredWatchNearby;
- (COSAppleWatchPairingDiscoveryLayingFlatViewController)layingFlatController;
- (COSAppleWatchPairingDiscoveryNoWatchViewController)noWatchController;
- (COSScanWatchDynamicHelpDelegate)scanDelegate;
- (UILabel)helpTitle;
- (UILabel)instruction;
- (UILabel)watchNearbyExplanation;
- (UIVisualEffectView)blurBackground;
- (int64_t)state;
- (void)setBlurBackground:(id)a3;
- (void)setDiscoveredWatchNearby:(BOOL)a3;
- (void)setHelpTitle:(id)a3;
- (void)setInstruction:(id)a3;
- (void)setLayingFlatController:(id)a3;
- (void)setNoWatchController:(id)a3;
- (void)setScanDelegate:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setState:(int64_t)a3 animated:(BOOL)a4;
- (void)setWatchNearbyExplanation:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation COSScanWatchDynamicHelpViewController

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)COSScanWatchDynamicHelpViewController;
  [(COSScanWatchDynamicHelpViewController *)&v37 viewDidLoad];
  v3 = [(COSScanWatchDynamicHelpViewController *)self view];
  id v4 = objc_alloc((Class)UIVisualEffectView);
  v5 = +[UIBlurEffect effectWithStyle:16];
  v6 = (UIVisualEffectView *)[v4 initWithEffect:v5];
  blurBackground = self->_blurBackground;
  self->_blurBackground = v6;

  v8 = self->_blurBackground;
  [v3 bounds];
  -[UIVisualEffectView setFrame:](v8, "setFrame:");
  v9 = [(COSScanWatchDynamicHelpViewController *)self view];
  [v9 addSubview:self->_blurBackground];

  v10 = objc_alloc_init(COSAppleWatchPairingDiscoveryLayingFlatViewController);
  layingFlatController = self->_layingFlatController;
  self->_layingFlatController = v10;

  v12 = [(COSScanWatchDynamicHelpViewController *)self view];
  [v12 bounds];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  v21 = [(COSAppleWatchPairingDiscoveryLayingFlatViewController *)self->_layingFlatController view];
  [v21 setFrame:v14, v16, v18, v20];

  v22 = [(COSAppleWatchPairingDiscoveryLayingFlatViewController *)self->_layingFlatController view];
  [v22 setAutoresizingMask:5];

  v23 = objc_alloc_init(COSAppleWatchPairingDiscoveryNoWatchViewController);
  noWatchController = self->_noWatchController;
  self->_noWatchController = v23;

  v25 = [(COSScanWatchDynamicHelpViewController *)self view];
  [v25 bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;

  v34 = [(COSAppleWatchPairingDiscoveryNoWatchViewController *)self->_noWatchController view];
  [v34 setFrame:v27, v29, v31, v33 + -50.0];

  v35 = [(COSAppleWatchPairingDiscoveryNoWatchViewController *)self->_noWatchController view];
  [v35 setAutoresizingMask:5];

  if (self->_discoveredWatchNearby) {
    int64_t v36 = 1;
  }
  else {
    int64_t v36 = 2;
  }
  self->_state = v36;
  -[COSScanWatchDynamicHelpViewController setState:animated:](self, "setState:animated:");
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)COSScanWatchDynamicHelpViewController;
  [(COSScanWatchDynamicHelpViewController *)&v5 viewDidDisappear:a3];
  +[PBBridgeCAReporter recordTransitionedDynamicHelpViewFromType:self->_state toType:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanDelegate);
  [WeakRetained dynamicHelpControllerDidDisappear:self];
}

- (void)setState:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000E2104;
  v11[3] = &unk_1002437D0;
  v11[4] = self;
  v11[5] = a3;
  v7 = objc_retainBlock(v11);
  +[PBBridgeCAReporter recordTransitionedDynamicHelpViewFromType:self->_state toType:a3];
  if (v4)
  {
    v8 = [(COSScanWatchDynamicHelpViewController *)self view];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000E2260;
    v9[3] = &unk_100244668;
    v10 = v7;
    +[UIView transitionWithView:v8 duration:5242880 options:v9 animations:&stru_100246D58 completion:0.45];
  }
  else
  {
    ((void (*)(void *))v7[2])(v7);
  }
  self->_state = a3;
}

- (BOOL)discoveredWatchNearby
{
  return self->_discoveredWatchNearby;
}

- (void)setDiscoveredWatchNearby:(BOOL)a3
{
  self->_discoveredWatchNearby = a3;
}

- (COSScanWatchDynamicHelpDelegate)scanDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanDelegate);

  return (COSScanWatchDynamicHelpDelegate *)WeakRetained;
}

- (void)setScanDelegate:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (COSAppleWatchPairingDiscoveryNoWatchViewController)noWatchController
{
  return self->_noWatchController;
}

- (void)setNoWatchController:(id)a3
{
}

- (COSAppleWatchPairingDiscoveryLayingFlatViewController)layingFlatController
{
  return self->_layingFlatController;
}

- (void)setLayingFlatController:(id)a3
{
}

- (UIVisualEffectView)blurBackground
{
  return self->_blurBackground;
}

- (void)setBlurBackground:(id)a3
{
}

- (UILabel)helpTitle
{
  return self->_helpTitle;
}

- (void)setHelpTitle:(id)a3
{
}

- (UILabel)watchNearbyExplanation
{
  return self->_watchNearbyExplanation;
}

- (void)setWatchNearbyExplanation:(id)a3
{
}

- (UILabel)instruction
{
  return self->_instruction;
}

- (void)setInstruction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instruction, 0);
  objc_storeStrong((id *)&self->_watchNearbyExplanation, 0);
  objc_storeStrong((id *)&self->_helpTitle, 0);
  objc_storeStrong((id *)&self->_blurBackground, 0);
  objc_storeStrong((id *)&self->_layingFlatController, 0);
  objc_storeStrong((id *)&self->_noWatchController, 0);

  objc_destroyWeak((id *)&self->_scanDelegate);
}

@end