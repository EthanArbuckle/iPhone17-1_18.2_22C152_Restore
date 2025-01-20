@interface COSInternalManualPairingViewController
- (COSInternalManualPairingDelegate)pairingDelegate;
- (COSInternalManualPairingViewController)init;
- (COSManualFlowView)manualView;
- (void)pressedCancel:(id)a3;
- (void)pressedDone:(id)a3;
- (void)setManualView:(id)a3;
- (void)setPairingDelegate:(id)a3;
- (void)tappedManualMode:(id)a3;
- (void)viewDidLoad;
@end

@implementation COSInternalManualPairingViewController

- (COSInternalManualPairingViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSInternalManualPairingViewController;
  v2 = [(COSInternalManualPairingViewController *)&v6 init];
  if (v2)
  {
    v3 = -[COSManualFlowView initWithFrame:]([COSManualFlowView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    manualView = v2->_manualView;
    v2->_manualView = v3;

    [(COSManualFlowView *)v2->_manualView setDelegate:v2];
  }
  return v2;
}

- (void)viewDidLoad
{
  v13.receiver = self;
  v13.super_class = (Class)COSInternalManualPairingViewController;
  [(COSInternalManualPairingViewController *)&v13 viewDidLoad];
  v3 = [(COSInternalManualPairingViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[COSManualFlowView setFrame:](self->_manualView, "setFrame:", v5, v7, v9, v11);
  v12 = [(COSInternalManualPairingViewController *)self view];
  [v12 addSubview:self->_manualView];
}

- (void)tappedManualMode:(id)a3
{
}

- (void)pressedCancel:(id)a3
{
}

- (void)pressedDone:(id)a3
{
  double v4 = [(COSManualFlowView *)self->_manualView btDataTextField];
  double v5 = [v4 text];
  double v6 = [(COSManualFlowView *)self->_manualView deviceNameTextField];
  double v7 = [v6 text];
  double v8 = _PBBridgeMagicCodeString();

  double v9 = pbb_bridge_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    double v11 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Code %@", (uint8_t *)&v10, 0xCu);
  }

  [(COSInternalManualPairingDelegate *)self->_pairingDelegate setManualPairingScannedCode:v8];
  [(COSInternalManualPairingDelegate *)self->_pairingDelegate processScannedCodeForManualPairing];
  [(COSInternalManualPairingDelegate *)self->_pairingDelegate doneManualPairing];
}

- (COSInternalManualPairingDelegate)pairingDelegate
{
  return self->_pairingDelegate;
}

- (void)setPairingDelegate:(id)a3
{
  self->_pairingDelegate = (COSInternalManualPairingDelegate *)a3;
}

- (COSManualFlowView)manualView
{
  return self->_manualView;
}

- (void)setManualView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end