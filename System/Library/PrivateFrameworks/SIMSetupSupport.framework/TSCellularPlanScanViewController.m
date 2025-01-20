@interface TSCellularPlanScanViewController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)confirmationCodeRequired;
- (BOOL)manualCardInfoEntry;
- (BOOL)transferViaQRCode;
- (CGPoint)makeCGPoint:(id)a3;
- (NSString)fauxCardData;
- (TSCellularPlanQRCodeScannerView)scannerView;
- (TSCellularPlanScanViewController)initWithBackButton:(BOOL)a3;
- (TSSIMSetupFlowDelegate)delegate;
- (UIButton)btLearnMore;
- (UIButton)enterDetailsManuallyButton;
- (UILabel)positionQRCodeLabel;
- (UILabel)scanQRCodeLabel;
- (UIView)cutoutView;
- (UIView)scanView;
- (unint64_t)entryPoint;
- (void)_addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)didChangeValueForKey:(id)a3;
- (void)drawQRBox:(id)a3;
- (void)enterFauxCardDataManually:(id)a3;
- (void)learnMoreTapped:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setBtLearnMore:(id)a3;
- (void)setCutoutView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnterDetailsManuallyButton:(id)a3;
- (void)setEntryPoint:(unint64_t)a3;
- (void)setPositionQRCodeLabel:(id)a3;
- (void)setScanQRCodeLabel:(id)a3;
- (void)setScanView:(id)a3;
- (void)setScannerView:(id)a3;
- (void)startScanning;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation TSCellularPlanScanViewController

- (TSCellularPlanScanViewController)initWithBackButton:(BOOL)a3
{
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8.receiver = self;
  v8.super_class = (Class)TSCellularPlanScanViewController;
  v6 = [(TSCellularPlanScanViewController *)&v8 initWithNibName:@"TSCellularPlanScanView" bundle:v5];

  if (v6)
  {
    [(TSCellularPlanScanViewController *)v6 setModalInPresentation:1];
    v6->_withBackButton = a3;
    v6->_confirmationCodeRequired = 0;
    v6->_manualCardInfoEntry = 0;
    v6->_transferViaQRCode = 0;
    [(TSCellularPlanScanViewController *)v6 setEntryPoint:0];
  }
  return v6;
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)TSCellularPlanScanViewController;
  [(SSUIViewController *)&v28 viewDidLoad];
  v3 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v4 = [(TSCellularPlanScanViewController *)self view];
  [v4 setBackgroundColor:v3];

  v5 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v6 = [(TSCellularPlanScanViewController *)self navigationController];
  v7 = [v6 view];
  [v7 setBackgroundColor:v5];

  if (!self->_scannerView)
  {
    objc_super v8 = [TSCellularPlanQRCodeScannerView alloc];
    v9 = -[TSCellularPlanQRCodeScannerView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    scannerView = self->_scannerView;
    self->_scannerView = v9;

    [(TSCellularPlanQRCodeScannerView *)self->_scannerView setDelegate:self];
    [(TSCellularPlanQRCodeScannerView *)self->_scannerView setupCameraSession];
    v11 = self->_scannerView;
    v12 = [MEMORY[0x263F825C8] blackColor];
    [(TSCellularPlanQRCodeScannerView *)v11 setBackgroundColor:v12];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_scanView);
    [WeakRetained addSubview:self->_scannerView];

    v14 = [MEMORY[0x263F15880] layer];
    holeOutlineLayer = self->_holeOutlineLayer;
    self->_holeOutlineLayer = v14;

    id v16 = [MEMORY[0x263F825C8] clearColor];
    -[CAShapeLayer setFillColor:](self->_holeOutlineLayer, "setFillColor:", [v16 CGColor]);

    id v17 = [MEMORY[0x263F825C8] systemYellowColor];
    -[CAShapeLayer setStrokeColor:](self->_holeOutlineLayer, "setStrokeColor:", [v17 CGColor]);

    [(CAShapeLayer *)self->_holeOutlineLayer setLineWidth:2.0];
    id v18 = objc_loadWeakRetained((id *)&self->_cutoutView);
    v19 = [v18 layer];
    [v19 addSublayer:self->_holeOutlineLayer];

    id v20 = objc_loadWeakRetained((id *)&self->_cutoutView);
    [v20 setAlpha:0.0];
  }
  if (self->_withBackButton)
  {
    if (+[TSUtilities isPad])
    {
      v21 = [(TSCellularPlanScanViewController *)self delegate];
      [v21 setDefaultNavigationItems:self];
    }
    BOOL v22 = +[TSUtilities isBackAllowed:self];
    v23 = [(TSCellularPlanScanViewController *)self navigationController];
    v24 = [v23 navigationItem];
    [v24 setHidesBackButton:!v22];
    goto LABEL_9;
  }
  v25 = [(TSCellularPlanScanViewController *)self delegate];
  [v25 setDefaultNavigationItems:self];

  if (!+[TSUtilities isBackAllowed:self])
  {
    v23 = [(TSCellularPlanScanViewController *)self navigationController];
    v24 = [v23 navigationItem];
    [v24 setHidesBackButton:1 animated:0];
LABEL_9:
  }
  [(TSCellularPlanScanViewController *)self setEdgesForExtendedLayout:0];
  BOOL v26 = +[TSUtilities inBuddy];
  id v27 = objc_loadWeakRetained((id *)&self->_btLearnMore);
  [v27 setHidden:v26];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)TSCellularPlanScanViewController;
  [(TSCellularPlanScanViewController *)&v7 viewWillAppear:a3];
  self->_confirmationCodeRequired = 0;
  self->_manualCardInfoEntry = 0;
  self->_transferViaQRCode = 0;
  v4 = [(TSCellularPlanScanViewController *)self view];
  [v4 setUserInteractionEnabled:1];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_enterDetailsManuallyButton);
  [WeakRetained setEnabled:1];

  id v6 = objc_loadWeakRetained((id *)&self->_cutoutView);
  [v6 setAlpha:0.0];

  [(TSCellularPlanQRCodeScannerView *)self->_scannerView startRunning];
}

- (void)viewDidLayoutSubviews
{
  v60.receiver = self;
  v60.super_class = (Class)TSCellularPlanScanViewController;
  [(TSCellularPlanScanViewController *)&v60 viewDidLayoutSubviews];
  v3 = [(TSCellularPlanScanViewController *)self view];
  [v3 layoutIfNeeded];

  scannerView = self->_scannerView;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanView);
  [WeakRetained bounds];
  -[TSCellularPlanQRCodeScannerView setFrame:](scannerView, "setFrame:");

  id v6 = [(TSCellularPlanScanViewController *)self enterDetailsManuallyButton];
  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v15 = [(TSCellularPlanScanViewController *)self positionQRCodeLabel];
  [v15 frame];
  v62.origin.x = v16;
  v62.origin.y = v17;
  v62.size.width = v18;
  v62.size.height = v19;
  v61.origin.x = v8;
  v61.origin.y = v10;
  v61.size.width = v12;
  v61.size.height = v14;
  BOOL v20 = CGRectIntersectsRect(v61, v62);

  if (v20)
  {
    v21 = [(TSCellularPlanScanViewController *)self enterDetailsManuallyButton];
    [v21 frame];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    objc_super v28 = [(TSCellularPlanScanViewController *)self enterDetailsManuallyButton];
    v29 = [v28 superview];
    [v29 frame];
    double v31 = v30;
    v32 = [(TSCellularPlanScanViewController *)self enterDetailsManuallyButton];
    v33 = [v32 superview];
    [v33 frame];
    double v35 = v31 - v34;
    v36 = [(TSCellularPlanScanViewController *)self positionQRCodeLabel];
    [v36 origin];
    double v38 = v37;
    v39 = [(TSCellularPlanScanViewController *)self positionQRCodeLabel];
    [v39 size];
    double v41 = v35 - (v38 + v40);
    v42 = [(TSCellularPlanScanViewController *)self enterDetailsManuallyButton];
    [v42 frame];
    double v44 = v41 - v43;

    if (v44 <= 0.0)
    {
      v45 = [(TSCellularPlanScanViewController *)self positionQRCodeLabel];
      [v45 origin];
      double v52 = v51;
      v48 = [(TSCellularPlanScanViewController *)self positionQRCodeLabel];
      [v48 size];
      double v50 = v52 + v53 + 1.0;
    }
    else if (v44 >= 10.0)
    {
      v45 = [(TSCellularPlanScanViewController *)self enterDetailsManuallyButton];
      v48 = [v45 superview];
      [v48 frame];
      double v55 = v54;
      v56 = [(TSCellularPlanScanViewController *)self enterDetailsManuallyButton];
      v57 = [v56 superview];
      [v57 frame];
      double v50 = v55 - v58 - v27 + -10.0;
    }
    else
    {
      v45 = [(TSCellularPlanScanViewController *)self positionQRCodeLabel];
      [v45 origin];
      double v47 = v46;
      v48 = [(TSCellularPlanScanViewController *)self positionQRCodeLabel];
      [v48 size];
      double v50 = v44 * 0.5 + v47 + v49;
    }

    v59 = [(TSCellularPlanScanViewController *)self enterDetailsManuallyButton];
    objc_msgSend(v59, "setFrame:", v23, v50, v25, v27);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(TSCellularPlanQRCodeScannerView *)self->_scannerView stopRunning];
  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanScanViewController;
  [(TSCellularPlanScanViewController *)&v6 viewDidDisappear:v3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained receivedResponse];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  scannerView = self->_scannerView;
  id v9 = a5;
  id v10 = a3;
  [(TSCellularPlanQRCodeScannerView *)scannerView stopRunning];
  v11.receiver = self;
  v11.super_class = (Class)TSCellularPlanScanViewController;
  [(TSCellularPlanScanViewController *)&v11 presentViewController:v10 animated:v5 completion:v9];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)TSCellularPlanScanViewController;
  id v7 = a4;
  -[TSCellularPlanScanViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__TSCellularPlanScanViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_264827E08;
  v8[4] = self;
  [v7 animateAlongsideTransition:0 completion:v8];
}

uint64_t __87__TSCellularPlanScanViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 orientation];

  if ((unint64_t)(v3 - 2) >= 3) {
    uint64_t v4 = 1;
  }
  else {
    uint64_t v4 = v3;
  }
  BOOL v5 = *(void **)(*(void *)(a1 + 32) + 1040);
  return [v5 setOrientation:v4];
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = _TSLogDomain();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v7;
    __int16 v20 = 2080;
    v21 = "-[TSCellularPlanScanViewController captureOutput:didOutputMetadataObjects:fromConnection:]";
    _os_log_impl(&dword_227A17000, v9, OS_LOG_TYPE_DEFAULT, "%@ @%s", buf, 0x16u);
  }

  if (!self->_nextTimeToAcceptScan
    || ([MEMORY[0x263EFF910] date],
        id v10 = objc_claimAutoreleasedReturnValue(),
        uint64_t v11 = [v10 compare:self->_nextTimeToAcceptScan],
        v10,
        v11 != -1))
  {
    CGFloat v12 = [MEMORY[0x263EFF910] dateWithTimeIntervalSinceNow:5.0];
    nextTimeToAcceptScan = self->_nextTimeToAcceptScan;
    self->_nextTimeToAcceptScan = v12;

    objc_initWeak((id *)buf, self);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke;
    block[3] = &unk_264827E30;
    objc_copyWeak(&v17, (id *)buf);
    id v15 = v8;
    CGFloat v16 = self;
    dispatch_async(MEMORY[0x263EF83A0], block);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = [*(id *)(a1 + 32) firstObject];
  BOOL v5 = [v4 stringValue];
  objc_super v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v5;
    __int16 v20 = 2080;
    v21 = "-[TSCellularPlanScanViewController captureOutput:didOutputMetadataObjects:fromConnection:]_block_invoke";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "scannedCode %@ @%s", buf, 0x16u);
  }

  if (v5)
  {
    if ([v5 hasPrefix:@"LPA:1$TR$"]) {
      *((unsigned char *)WeakRetained + 1002) = 1;
    }
    id v7 = [WeakRetained btLearnMore];
    [v7 setEnabled:0];

    id v8 = [WeakRetained enterDetailsManuallyButton];
    [v8 setEnabled:0];

    uint64_t v9 = [v5 copy];
    id v10 = (void *)*((void *)WeakRetained + 128);
    *((void *)WeakRetained + 128) = v9;

    [*((id *)WeakRetained + 130) stopRunning];
    uint64_t v11 = [WeakRetained view];
    [v11 setUserInteractionEnabled:0];

    CGFloat v12 = *(void **)(a1 + 40);
    double v13 = [v4 corners];
    [v12 drawQRBox:v13];

    CGFloat v14 = (void *)MEMORY[0x263F82E00];
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_48;
    v17[3] = &unk_2648279D0;
    v17[4] = WeakRetained;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_2;
    v15[3] = &unk_264827958;
    objc_copyWeak(&v16, v2);
    v15[4] = WeakRetained;
    [v14 animateWithDuration:v17 animations:v15 completion:0.25];
    objc_destroyWeak(&v16);
  }
}

void __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1048));
  [WeakRetained setAlpha:1.0];
}

void __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    AudioServicesPlaySystemSound(0xFFFu);
    dispatch_time_t v3 = dispatch_time(0, 1000000000);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_3;
    v4[3] = &unk_264827B08;
    objc_copyWeak(&v5, (id *)(a1 + 40));
    v4[4] = *(void *)(a1 + 32);
    dispatch_after(v3, MEMORY[0x263EF83A0], v4);
    objc_destroyWeak(&v5);
  }
}

void __90__TSCellularPlanScanViewController_captureOutput_didOutputMetadataObjects_fromConnection___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _addNewPlanWithCardData:*(void *)(*(void *)(a1 + 32) + 1024) confirmationCode:0];
}

- (CGPoint)makeCGPoint:(id)a3
{
  id v4 = a3;
  id v5 = [v4 valueForKey:@"X"];
  [v5 floatValue];
  double v7 = v6;
  id v8 = [v4 valueForKey:@"Y"];

  [v8 floatValue];
  double v10 = v9;

  scannerView = self->_scannerView;
  -[TSCellularPlanQRCodeScannerView pointForCaptureDevicePointOfInterest:](scannerView, "pointForCaptureDevicePointOfInterest:", v7, v10);
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)drawQRBox:(id)a3
{
  id v35 = a3;
  if ([v35 count])
  {
    id v4 = [v35 objectAtIndexedSubscript:0];
    [(TSCellularPlanScanViewController *)self makeCGPoint:v4];
    double v6 = v5;
    double v8 = v7;

    float v9 = [v35 objectAtIndexedSubscript:2];
    [(TSCellularPlanScanViewController *)self makeCGPoint:v9];
    double v11 = v10;
    double v13 = v12;

    if (v11 - v6 <= v13 - v8) {
      double v14 = v13 - v8;
    }
    else {
      double v14 = v11 - v6;
    }
    if (v14 / 5.0 >= 5.0) {
      double v15 = v14 / 5.0;
    }
    else {
      double v15 = 5.0;
    }
    id v16 = [MEMORY[0x263F824C0] bezierPath];
    v37.origin.x = v6;
    v37.origin.y = v8;
    v37.size.double width = v14;
    v37.size.double height = v14;
    CGFloat v17 = CGRectGetMinX(v37) + 5.0;
    v38.origin.x = v6;
    v38.origin.y = v8;
    v38.size.double width = v14;
    v38.size.double height = v14;
    objc_msgSend(v16, "moveToPoint:", v17, CGRectGetMinY(v38));
    v39.origin.x = v6;
    v39.origin.y = v8;
    v39.size.double width = v14;
    v39.size.double height = v14;
    double v18 = v15 + CGRectGetMinX(v39);
    v40.origin.x = v6;
    v40.origin.y = v8;
    v40.size.double width = v14;
    v40.size.double height = v14;
    objc_msgSend(v16, "addLineToPoint:", v18, CGRectGetMinY(v40));
    v41.origin.x = v6;
    v41.origin.y = v8;
    v41.size.double width = v14;
    v41.size.double height = v14;
    CGFloat v19 = CGRectGetMaxX(v41) - v15;
    v42.origin.x = v6;
    v42.origin.y = v8;
    v42.size.double width = v14;
    v42.size.double height = v14;
    objc_msgSend(v16, "moveToPoint:", v19, CGRectGetMinY(v42));
    v43.origin.x = v6;
    v43.origin.y = v8;
    v43.size.double width = v14;
    v43.size.double height = v14;
    CGFloat v20 = CGRectGetMaxX(v43) + -5.0;
    v44.origin.x = v6;
    v44.origin.y = v8;
    v44.size.double width = v14;
    v44.size.double height = v14;
    objc_msgSend(v16, "addLineToPoint:", v20, CGRectGetMinY(v44));
    v45.origin.x = v6;
    v45.origin.y = v8;
    v45.size.double width = v14;
    v45.size.double height = v14;
    CGFloat v21 = CGRectGetMaxX(v45) + -5.0;
    v46.origin.x = v6;
    v46.origin.y = v8;
    v46.size.double width = v14;
    v46.size.double height = v14;
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v21, CGRectGetMinY(v46) + 5.0, 5.0);
    v47.origin.x = v6;
    v47.origin.y = v8;
    v47.size.double width = v14;
    v47.size.double height = v14;
    double MaxX = CGRectGetMaxX(v47);
    v48.origin.x = v6;
    v48.origin.y = v8;
    v48.size.double width = v14;
    v48.size.double height = v14;
    objc_msgSend(v16, "addLineToPoint:", MaxX, v15 + CGRectGetMinY(v48));
    v49.origin.x = v6;
    v49.origin.y = v8;
    v49.size.double width = v14;
    v49.size.double height = v14;
    double v23 = CGRectGetMaxX(v49);
    v50.origin.x = v6;
    v50.origin.y = v8;
    v50.size.double width = v14;
    v50.size.double height = v14;
    objc_msgSend(v16, "moveToPoint:", v23, CGRectGetMaxY(v50) - v15);
    v51.origin.x = v6;
    v51.origin.y = v8;
    v51.size.double width = v14;
    v51.size.double height = v14;
    double v24 = CGRectGetMaxX(v51);
    v52.origin.x = v6;
    v52.origin.y = v8;
    v52.size.double width = v14;
    v52.size.double height = v14;
    objc_msgSend(v16, "addLineToPoint:", v24, CGRectGetMaxY(v52) + -5.0);
    v53.origin.x = v6;
    v53.origin.y = v8;
    v53.size.double width = v14;
    v53.size.double height = v14;
    CGFloat v25 = CGRectGetMaxX(v53) + -5.0;
    v54.origin.x = v6;
    v54.origin.y = v8;
    v54.size.double width = v14;
    v54.size.double height = v14;
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v25, CGRectGetMaxY(v54) + -5.0, 5.0, 0.0, 1.57079633);
    v55.origin.x = v6;
    v55.origin.y = v8;
    v55.size.double width = v14;
    v55.size.double height = v14;
    CGFloat v26 = CGRectGetMaxX(v55) - v15;
    v56.origin.x = v6;
    v56.origin.y = v8;
    v56.size.double width = v14;
    v56.size.double height = v14;
    objc_msgSend(v16, "addLineToPoint:", v26, CGRectGetMaxY(v56));
    v57.origin.x = v6;
    v57.origin.y = v8;
    v57.size.double width = v14;
    v57.size.double height = v14;
    double v27 = v15 + CGRectGetMinX(v57);
    v58.origin.x = v6;
    v58.origin.y = v8;
    v58.size.double width = v14;
    v58.size.double height = v14;
    objc_msgSend(v16, "moveToPoint:", v27, CGRectGetMaxY(v58));
    v59.origin.x = v6;
    v59.origin.y = v8;
    v59.size.double width = v14;
    v59.size.double height = v14;
    CGFloat v28 = CGRectGetMinX(v59) + 5.0;
    v60.origin.x = v6;
    v60.origin.y = v8;
    v60.size.double width = v14;
    v60.size.double height = v14;
    objc_msgSend(v16, "addLineToPoint:", v28, CGRectGetMaxY(v60));
    v61.origin.x = v6;
    v61.origin.y = v8;
    v61.size.double width = v14;
    v61.size.double height = v14;
    CGFloat v29 = CGRectGetMinX(v61) + 5.0;
    v62.origin.x = v6;
    v62.origin.y = v8;
    v62.size.double width = v14;
    v62.size.double height = v14;
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v29, CGRectGetMaxY(v62) + -5.0, 5.0, 1.57079633, 3.14159265);
    v63.origin.x = v6;
    v63.origin.y = v8;
    v63.size.double width = v14;
    v63.size.double height = v14;
    double MinX = CGRectGetMinX(v63);
    v64.origin.x = v6;
    v64.origin.y = v8;
    v64.size.double width = v14;
    v64.size.double height = v14;
    objc_msgSend(v16, "addLineToPoint:", MinX, CGRectGetMaxY(v64) - v15);
    v65.origin.x = v6;
    v65.origin.y = v8;
    v65.size.double width = v14;
    v65.size.double height = v14;
    double v31 = CGRectGetMinX(v65);
    v66.origin.x = v6;
    v66.origin.y = v8;
    v66.size.double width = v14;
    v66.size.double height = v14;
    objc_msgSend(v16, "moveToPoint:", v31, v15 + CGRectGetMinY(v66));
    v67.origin.x = v6;
    v67.origin.y = v8;
    v67.size.double width = v14;
    v67.size.double height = v14;
    double v32 = CGRectGetMinX(v67);
    v68.origin.x = v6;
    v68.origin.y = v8;
    v68.size.double width = v14;
    v68.size.double height = v14;
    objc_msgSend(v16, "addLineToPoint:", v32, CGRectGetMinY(v68) + 5.0);
    v69.origin.x = v6;
    v69.origin.y = v8;
    v69.size.double width = v14;
    v69.size.double height = v14;
    CGFloat v33 = CGRectGetMinX(v69) + 5.0;
    v70.origin.x = v6;
    v70.origin.y = v8;
    v70.size.double width = v14;
    v70.size.double height = v14;
    objc_msgSend(v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v33, CGRectGetMinY(v70) + 5.0, 5.0, 3.14159265, 4.71238898);
    id v34 = v16;
    -[CAShapeLayer setPath:](self->_holeOutlineLayer, "setPath:", [v34 CGPath]);
  }
}

- (void)enterFauxCardDataManually:(id)a3
{
  self->_manualCardInfoEntry = 1;
  id v4 = [(TSCellularPlanScanViewController *)self delegate];
  [v4 viewControllerDidComplete:self];
}

- (void)learnMoreTapped:(id)a3
{
  if (+[TSUtilities isPad]) {
    dispatch_time_t v3 = @"https://support.apple.com/HT203089?cid=mc-ols-esim-article_ht203089-ipados_ui-07212023#esim";
  }
  else {
    dispatch_time_t v3 = @"https://support.apple.com/ht209096?cid=mc-ols-esim-article_ht209096-ios_ui-07192022";
  }
  +[TSUtilities launchURL:v3];
}

- (void)_addNewPlanWithCardData:(id)a3 confirmationCode:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained waitForResponse:self];

  objc_initWeak(&location, self);
  if (self->_transferViaQRCode)
  {
    float v9 = [(TSCellularPlanScanViewController *)self delegate];
    [v9 viewControllerDidComplete:self];
  }
  double v10 = +[TSCellularPlanManagerCache sharedInstance];
  id v11 = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v12 = [v11 signupUserConsentResponse];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke;
  v13[3] = &unk_264827EA8;
  objc_copyWeak(&v14, &location);
  v13[4] = self;
  [v10 addNewPlanWithCardData:v6 confirmationCode:v7 userConsentResponse:v12 completion:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_2;
  block[3] = &unk_264827E80;
  id v6 = v3;
  id v4 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  uint64_t v7 = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v8);
}

void __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_2(uint64_t a1)
{
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_2_cold_1(a1, v2);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = *(void **)(a1 + 32);
  if (v4
    && ([v4 domain],
        double v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:*MEMORY[0x263F31920]],
        v5,
        v6))
  {
    if ([*(id *)(a1 + 32) code] == 19)
    {
      WeakRetained[1000] = 1;
      uint64_t v7 = [WeakRetained delegate];
      [v7 viewControllerDidComplete:WeakRetained];
LABEL_9:

      goto LABEL_10;
    }
    if (!+[TSUtilities isRegulatoryRestrictionActive:](TSUtilities, "isRegulatoryRestrictionActive:", *(void *)(a1 + 32))&& [*(id *)(a1 + 32) code] == 2)
    {
      uint64_t v7 = +[TSUtilities getErrorTitleDetail:*(void *)(a1 + 32) forCarrier:&stru_26DBE8E78];
      id v8 = (void *)MEMORY[0x263F82418];
      float v9 = [v7 objectForKeyedSubscript:@"ErrorHeader"];
      double v10 = [v7 objectForKeyedSubscript:@"ErrorDetail"];
      id v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

      uint64_t v12 = (void *)MEMORY[0x263F82400];
      double v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_76;
      v19[3] = &unk_264827E58;
      id v20 = *(id *)(a1 + 32);
      CGFloat v21 = WeakRetained;
      uint64_t v22 = *(void *)(a1 + 40);
      double v15 = [v12 actionWithTitle:v14 style:1 handler:v19];
      [v11 addAction:v15];

      id v16 = [WeakRetained navigationController];
      CGFloat v17 = [v16 visibleViewController];
      [v17 presentViewController:v11 animated:1 completion:0];

      double v18 = [WeakRetained delegate];
      [v18 receivedResponse];

      goto LABEL_9;
    }
  }
  else if (WeakRetained[1002])
  {
    uint64_t v7 = [WeakRetained delegate];
    [v7 receivedResponse];
    goto LABEL_9;
  }
LABEL_10:
}

uint64_t __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_76(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) code];
  if (result == 2)
  {
    id v3 = [*(id *)(a1 + 40) delegate];
    [v3 receivedResponse];

    id v4 = [*(id *)(a1 + 40) delegate];
    [v4 setDefaultNavigationItems:*(void *)(a1 + 48)];

    double v5 = *(void **)(a1 + 40);
    return [v5 viewWillAppear:1];
  }
  return result;
}

- (void)didChangeValueForKey:(id)a3
{
  if ([a3 isEqualToString:@"userConsentAllowed"])
  {
    scannerView = self->_scannerView;
    [(TSCellularPlanQRCodeScannerView *)scannerView startRunning];
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)startScanning
{
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)entryPoint
{
  return self->_entryPoint;
}

- (void)setEntryPoint:(unint64_t)a3
{
  self->_entryPoint = a3;
}

- (NSString)fauxCardData
{
  return (NSString *)objc_getProperty(self, a2, 1024, 1);
}

- (BOOL)confirmationCodeRequired
{
  return self->_confirmationCodeRequired;
}

- (BOOL)manualCardInfoEntry
{
  return self->_manualCardInfoEntry;
}

- (BOOL)transferViaQRCode
{
  return self->_transferViaQRCode;
}

- (UIView)scanView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanView);
  return (UIView *)WeakRetained;
}

- (void)setScanView:(id)a3
{
}

- (TSCellularPlanQRCodeScannerView)scannerView
{
  return (TSCellularPlanQRCodeScannerView *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setScannerView:(id)a3
{
}

- (UIView)cutoutView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cutoutView);
  return (UIView *)WeakRetained;
}

- (void)setCutoutView:(id)a3
{
}

- (UIButton)enterDetailsManuallyButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_enterDetailsManuallyButton);
  return (UIButton *)WeakRetained;
}

- (void)setEnterDetailsManuallyButton:(id)a3
{
}

- (UILabel)scanQRCodeLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scanQRCodeLabel);
  return (UILabel *)WeakRetained;
}

- (void)setScanQRCodeLabel:(id)a3
{
}

- (UILabel)positionQRCodeLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_positionQRCodeLabel);
  return (UILabel *)WeakRetained;
}

- (void)setPositionQRCodeLabel:(id)a3
{
}

- (UIButton)btLearnMore
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_btLearnMore);
  return (UIButton *)WeakRetained;
}

- (void)setBtLearnMore:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_btLearnMore);
  objc_destroyWeak((id *)&self->_positionQRCodeLabel);
  objc_destroyWeak((id *)&self->_scanQRCodeLabel);
  objc_destroyWeak((id *)&self->_enterDetailsManuallyButton);
  objc_destroyWeak((id *)&self->_cutoutView);
  objc_storeStrong((id *)&self->_scannerView, 0);
  objc_destroyWeak((id *)&self->_scanView);
  objc_storeStrong((id *)&self->_fauxCardData, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_holeOutlineLayer, 0);
  objc_storeStrong((id *)&self->_nextTimeToAcceptScan, 0);
}

void __77__TSCellularPlanScanViewController__addNewPlanWithCardData_confirmationCode___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  int v6 = "-[TSCellularPlanScanViewController _addNewPlanWithCardData:confirmationCode:]_block_invoke_2";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]error: %@ @%s", (uint8_t *)&v3, 0x16u);
}

@end