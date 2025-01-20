@interface _PKPaymentCameraCaptureViewController
- (BOOL)hideSetupLaterButton;
- (BOOL)showTapToProvisionButton;
- (BOOL)showTypeCardNumberButton;
- (PKPaymentCameraCaptureViewControllerDelegate)flowItemDelegate;
- (PKProvisioningAnalyticsSessionUIReporter)reporter;
- (_PKPaymentCameraCaptureViewController)init;
- (_PKPaymentCameraCaptureViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4;
- (void)_cancelButtonPressed;
- (void)_manualEntryButtonPressed:(id)a3;
- (void)_setupLater:(id)a3;
- (void)_tapToProvisionButtonPressed:(id)a3;
- (void)cameraReader:(id)a3 didFailWithError:(id)a4;
- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4;
- (void)cameraReaderDidEnd:(id)a3;
- (void)configureForModalPresentation;
- (void)loadView;
- (void)setFlowItemDelegate:(id)a3;
- (void)setHideSetupLaterButton:(BOOL)a3;
- (void)setReporter:(id)a3;
- (void)setShowTapToProvisionButton:(BOOL)a3;
- (void)setShowTypeCardNumberButton:(BOOL)a3;
- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation _PKPaymentCameraCaptureViewController

- (_PKPaymentCameraCaptureViewController)init
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)_PKPaymentCameraCaptureViewController;
  v2 = [(CRCameraReader *)&v6 init];
  if (v2)
  {
    uint64_t v3 = *MEMORY[0x1E4F5CD10];
    v7[0] = *MEMORY[0x1E4F5CD08];
    v7[1] = v3;
    v7[2] = *MEMORY[0x1E4F5CD18];
    v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
    [(CRCameraReader *)v2 setOutputObjectTypes:v4];

    [(CRCameraReader *)v2 setDelegate:v2];
    [(CRCameraReader *)v2 setHidePlacementText:1];
    v2->_showTypeCardNumberButton = 1;
  }
  return v2;
}

- (_PKPaymentCameraCaptureViewController)initWithProvisioningController:(id)a3 context:(int64_t)a4
{
  id v7 = a3;
  v8 = [(_PKPaymentCameraCaptureViewController *)self init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_provisioningController, a3);
    v9->_context = a4;
  }

  return v9;
}

- (void)configureForModalPresentation
{
  self->_hideSetupLaterButton = 1;
  self->_showTapToProvisionButton = 0;
  self->_showTypeCardNumberButton = 0;
  id v4 = (id)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:24 target:self action:sel__cancelButtonPressed];
  uint64_t v3 = [(_PKPaymentCameraCaptureViewController *)self navigationItem];
  [v3 setLeftBarButtonItem:v4];
}

- (void)loadView
{
  v38.receiver = self;
  v38.super_class = (Class)_PKPaymentCameraCaptureViewController;
  [(CRCameraReader *)&v38 loadView];
  uint64_t v3 = [(_PKPaymentCameraCaptureViewController *)self view];
  cameraView = self->_cameraView;
  self->_cameraView = v3;

  [(UIView *)self->_cameraView pkui_setExcludedFromScreenCapture:1 andBroadcasting:1];
  v5 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  objc_super v6 = [(_PKPaymentCameraCaptureViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    unsigned int IsSetupAssistant = PKPaymentSetupContextIsSetupAssistant();
  }
  else {
    unsigned int IsSetupAssistant = 0;
  }
  id v9 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v10 = *MEMORY[0x1E4F1DB28];
  double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v14 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], v11, v12, v13);
  [v14 setBackgroundColor:v5];
  [v14 addSubview:self->_cameraView];
  [(_PKPaymentCameraCaptureViewController *)self setView:v14];
  v15 = -[PKTableHeaderView initWithFrame:]([PKTableHeaderView alloc], "initWithFrame:", v10, v11, v12, v13);
  headerView = self->_headerView;
  self->_headerView = v15;

  [(PKTableHeaderView *)self->_headerView setBackgroundColor:v5];
  v17 = [(PKTableHeaderView *)self->_headerView titleLabel];
  v18 = PKLocalizedPaymentString(&cfstr_AddCard.isa);
  [v17 setText:v18];

  v19 = [(PKPaymentProvisioningController *)self->_provisioningController webService];
  v20 = [v19 targetDevice];
  v21 = [v20 deviceRegion];

  if (PKDeviceRegionSupportsDebit()) {
    v22 = @"POSITION_CARD";
  }
  else {
    v22 = @"POSITION_CARD_NO_DEBIT";
  }
  v23 = PKLocalizedPaymentString(&v22->isa);
  v24 = [(PKTableHeaderView *)self->_headerView subtitleLabel];
  [v24 setText:v23];

  [(PKTableHeaderView *)self->_headerView setStyle:IsSetupAssistant];
  [v14 addSubview:self->_headerView];
  double v25 = 10.0;
  if (IsSetupAssistant)
  {
    double v25 = 20.0;
    double v26 = 19.0;
  }
  else
  {
    double v26 = 9.0;
  }
  [(PKTableHeaderView *)self->_headerView setTopPadding:v25];
  [(PKTableHeaderView *)self->_headerView setBottomPadding:v26];
  v27 = objc_alloc_init(PKPaymentSetupDockView);
  dockView = self->_dockView;
  self->_dockView = v27;

  [(PKPaymentSetupDockView *)self->_dockView setBackgroundColor:v5];
  v29 = [(PKPaymentSetupDockView *)self->_dockView footerView];
  [v29 setSetupLaterButton:0];
  [v29 setManualEntryButton:0];
  [v29 setSkipCardButton:0];
  [v14 addSubview:self->_dockView];
  if (self->_showTypeCardNumberButton)
  {
    v30 = [(PKPaymentSetupDockView *)self->_dockView primaryButton];
    [v30 setEnabled:1];
    [v30 addTarget:self action:sel__manualEntryButtonPressed_ forControlEvents:0x2000];
    v31 = PKLocalizedPaymentString(&cfstr_EnterCardDetai.isa);
    [v30 setTitle:v31 forState:0];
  }
  v32 = (void *)MEMORY[0x1E4F85978];
  if (!self->_hideSetupLaterButton)
  {
    v33 = [v29 secondaryActionButton];
    v34 = PKLocalizedPaymentString(&cfstr_SetUpLaterButt.isa);
    [v33 setTitle:v34 forState:0];
    [v33 addTarget:self action:sel__setupLater_ forControlEvents:0x2000];
    [v33 setAccessibilityIdentifier:*v32];
  }
  if (self->_showTapToProvisionButton)
  {
    v35 = [v29 secondaryActionButton];
    v36 = PKLocalizedPaymentString(&cfstr_CameraCaptureT.isa);
    [v35 setTitle:v36 forState:0];
    [v35 addTarget:self action:sel__tapToProvisionButtonPressed_ forControlEvents:0x2000];
    [v35 setAccessibilityIdentifier:*v32];
  }
  v37 = [(_PKPaymentCameraCaptureViewController *)self view];
  [v37 setAccessibilityIdentifier:*MEMORY[0x1E4F857C8]];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)_PKPaymentCameraCaptureViewController;
  [(_PKPaymentCameraCaptureViewController *)&v9 viewDidLoad];
  uint64_t v3 = [(_PKPaymentCameraCaptureViewController *)self navigationItem];
  id v4 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v5 = PKLocalizedString(&cfstr_BackButtonTitl.isa);
  objc_super v6 = (void *)[v4 initWithTitle:v5 style:0 target:0 action:0];

  [v6 setAccessibilityIdentifier:*MEMORY[0x1E4F85488]];
  [v3 setBackBarButtonItem:v6];
  objc_msgSend(v3, "pkui_enableManualScrollEdgeAppearanceWithInitialProgress:", 1.0);
  int64_t context = self->_context;
  v8 = [(_PKPaymentCameraCaptureViewController *)self view];
  PKPaymentSetupApplyContextAppearance(context, v8);
}

- (void)viewDidLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)_PKPaymentCameraCaptureViewController;
  [(CRCameraReader *)&v20 viewDidLayoutSubviews];
  uint64_t v3 = [(_PKPaymentCameraCaptureViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v11 = v10;
  [v3 safeAreaInsets];
  double v13 = v12;
  CGFloat v15 = v14;
  memset(&slice, 0, sizeof(slice));
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  -[PKPaymentSetupDockView sizeThatFits:](self->_dockView, "sizeThatFits:", v9, v11);
  CGFloat v17 = v16;
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGRectDivide(v21, &slice, &v18, v15, CGRectMaxYEdge);
  CGRectDivide(v18, &slice, &v18, v17, CGRectMaxYEdge);
  -[PKPaymentSetupDockView setFrame:](self->_dockView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  -[PKTableHeaderView sizeThatFits:](self->_headerView, "sizeThatFits:", v9, v11);
  CGRect v22 = v18;
  CGRectDivide(v18, &slice, &v18, fmin(fmax(v18.size.height - v22.origin.y, 200.0), v13 + 281.0), CGRectMinYEdge);
  -[UIView setFrame:](self->_cameraView, "setFrame:", slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  [(UIView *)self->_cameraView setNeedsLayout];
  -[PKTableHeaderView setFrame:](self->_headerView, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PKPaymentCameraCaptureViewController;
  [(CRCameraReader *)&v4 viewWillAppear:a3];
  [(CRCameraReader *)self start];
  self->_cameraCaptureStartTime = mach_absolute_time();
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_PKPaymentCameraCaptureViewController;
  [(_PKPaymentCameraCaptureViewController *)&v4 viewDidAppear:a3];
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportViewAppeared];
}

- (void)cameraReader:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71___PKPaymentCameraCaptureViewController_cameraReader_didFailWithError___block_invoke;
  v7[3] = &unk_1E59CA870;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

- (void)cameraReaderDidEnd:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60___PKPaymentCameraCaptureViewController_cameraReaderDidEnd___block_invoke;
  block[3] = &unk_1E59CA7D0;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)cameraReader:(id)a3 didRecognizeObjects:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74___PKPaymentCameraCaptureViewController_cameraReader_didRecognizeObjects___block_invoke;
  v7[3] = &unk_1E59CA870;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_sync(MEMORY[0x1E4F14428], v7);
}

- (void)showLoadingUI:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  id v6 = [(_PKPaymentCameraCaptureViewController *)self view];
  [v6 setUserInteractionEnabled:v4 ^ 1];

  CGFloat v7 = [(PKPaymentSetupDockView *)self->_dockView primaryButton];
  [v7 setShowSpinner:v4];

  dockView = self->_dockView;

  [(PKPaymentSetupDockView *)dockView setButtonsEnabled:v4 ^ 1];
}

- (void)_manualEntryButtonPressed:(id)a3
{
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained cameraCaptureViewControllerDidSelectManualEntry:self];
}

- (void)_setupLater:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    CGFloat v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    double v9 = [(_PKPaymentCameraCaptureViewController *)self description];
    int v11 = 138412802;
    double v12 = v7;
    __int16 v13 = 2112;
    double v14 = v8;
    __int16 v15 = 2112;
    double v16 = v9;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v11, 0x20u);
  }
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained cameraCaptureViewControllerDidSelectSetupLater:self];
}

- (void)_tapToProvisionButtonPressed:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = PKLogFacilityTypeGetObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    CGFloat v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    double v9 = [(_PKPaymentCameraCaptureViewController *)self description];
    int v11 = 138412802;
    double v12 = v7;
    __int16 v13 = 2112;
    double v14 = v8;
    __int16 v15 = 2112;
    double v16 = v9;
    _os_log_impl(&dword_19F450000, v5, OS_LOG_TYPE_DEFAULT, "%@ - %@ - %@", (uint8_t *)&v11, 0x20u);
  }
  [(PKProvisioningAnalyticsSessionUIReporter *)self->_reporter reportButtonPressed:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained cameraCaptureViewControllerDidSelectTapToProvision:self];
}

- (void)_cancelButtonPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);
  [WeakRetained cameraCaptureViewControllerDidSelectSetupLater:self];
}

- (BOOL)showTapToProvisionButton
{
  return self->_showTapToProvisionButton;
}

- (void)setShowTapToProvisionButton:(BOOL)a3
{
  self->_showTapToProvisionButton = a3;
}

- (BOOL)showTypeCardNumberButton
{
  return self->_showTypeCardNumberButton;
}

- (void)setShowTypeCardNumberButton:(BOOL)a3
{
  self->_showTypeCardNumberButton = a3;
}

- (BOOL)hideSetupLaterButton
{
  return self->_hideSetupLaterButton;
}

- (void)setHideSetupLaterButton:(BOOL)a3
{
  self->_hideSetupLaterButton = a3;
}

- (PKPaymentCameraCaptureViewControllerDelegate)flowItemDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flowItemDelegate);

  return (PKPaymentCameraCaptureViewControllerDelegate *)WeakRetained;
}

- (void)setFlowItemDelegate:(id)a3
{
}

- (PKProvisioningAnalyticsSessionUIReporter)reporter
{
  return self->_reporter;
}

- (void)setReporter:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reporter, 0);
  objc_destroyWeak((id *)&self->_flowItemDelegate);
  objc_storeStrong((id *)&self->_dockView, 0);
  objc_storeStrong((id *)&self->_provisioningController, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_cameraView, 0);

  objc_storeStrong((id *)&self->_outputObjects, 0);
}

@end