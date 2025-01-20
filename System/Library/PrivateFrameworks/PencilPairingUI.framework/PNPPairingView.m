@interface PNPPairingView
- (BOOL)shouldShowWhatsNew;
- (BOOL)showWizardContents;
- (BOOL)showsChargingStatusView;
- (CGAffineTransform)_pencilTransformForState:(SEL)a3 deviceState:(unint64_t)a4;
- (CGSize)_intrinsicContentSizeForState:(unint64_t)a3 deviceState:(id)a4;
- (CGSize)_pencilSizeForState:(unint64_t)a3;
- (CGSize)intrinsicContentSize;
- (PNPChargingStatusView)chargingStatusView;
- (PNPDeviceState)deviceState;
- (PNPPairingView)initWithFrame:(CGRect)a3;
- (PNPPairingViewDelegate)delegate;
- (PNPPencilView)pencilView;
- (PNPWizardViewController)wizardViewController;
- (id)backgroundColorForWizardController:(id)a3;
- (int64_t)deviceType;
- (unint64_t)state;
- (void)layoutSubviews;
- (void)prepareForTransitionToWizard;
- (void)setChargingStatusView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceState:(id)a3;
- (void)setDeviceType:(int64_t)a3;
- (void)setShouldShowWhatsNew:(BOOL)a3;
- (void)setShowWizardContents:(BOOL)a3;
- (void)setShowsChargingStatusView:(BOOL)a3;
- (void)setState:(unint64_t)a3;
- (void)setWizardViewController:(id)a3;
- (void)transitionToWizard;
- (void)unhideWizardIfNecessary;
- (void)wizardTransitionFinished;
- (void)wizardViewRequestsDismiss:(id)a3;
@end

@implementation PNPPairingView

- (void)layoutSubviews
{
  pencilView = self->_pencilView;
  v4 = [(PNPPairingView *)self deviceState];
  [(PNPPencilView *)pencilView setDeviceState:v4];

  [(PNPPairingView *)self bounds];
  uint64_t v5 = MEMORY[0x263F001A8];
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  v8 = [(PNPPairingView *)self deviceState];
  [(PNPPairingView *)self _intrinsicContentSizeForState:1 deviceState:v8];
  double v10 = v9;
  double v12 = v11;

  v13 = [(PNPWizardViewController *)self->_wizardViewController view];
  objc_msgSend(v13, "setFrame:", v6, v7, v10, v12);

  unint64_t v14 = [(PNPPairingView *)self state];
  v15 = [(PNPPairingView *)self deviceState];
  if (v14 == 1 || (double v16 = 1.0, [(PNPPairingView *)self showsChargingStatusView])) {
    double v16 = 0.0;
  }
  if (v14)
  {
    if (self->_finishedWizardTransition)
    {
      double v17 = *(double *)(v5 + 16);
      double v18 = *(double *)(v5 + 24);
      double v19 = v7;
      double v20 = v6;
    }
    else
    {
      [(PNPPairingView *)self _pencilSizeForState:v14];
      double v26 = v25;
      double v28 = v27;
      double x = self->_pencilSpinningRect.origin.x;
      double y = self->_pencilSpinningRect.origin.y;
      v31 = [(PNPWizardViewController *)self->_wizardViewController view];
      -[PNPPairingView convertRect:fromView:](self, "convertRect:fromView:", v31, x, y, v26, v28);
      double v20 = v32;
      double v19 = v33;
      double v17 = v34;
      double v18 = v35;
    }
  }
  else
  {
    [(PNPPairingView *)self _pencilSizeForState:0];
    UIRectCenteredIntegralRect();
    double v20 = v21;
    double v19 = v22;
    double v17 = v23;
    double v18 = v24;
    self->_pencilSpinningRect.origin.double x = v21;
    self->_pencilSpinningRect.origin.double y = v22;
    self->_pencilSpinningRect.size.width = v23;
    self->_pencilSpinningRect.size.height = v24;
  }
  [(PNPPencilView *)self->_pencilView setSpinning:v14 == 0];
  [(PNPPencilView *)self->_pencilView setAlpha:v16];
  v36 = [(PNPWizardViewController *)self->_wizardViewController view];
  if ([(PNPPairingView *)self showsChargingStatusView]) {
    double v37 = 0.0;
  }
  else {
    double v37 = 1.0;
  }
  [v36 setAlpha:v37];

  [MEMORY[0x263F158F8] begin];
  [MEMORY[0x263F158F8] setDisableActions:1];
  v38 = self->_pencilView;
  long long v39 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
  v54[0] = *MEMORY[0x263F000D0];
  v54[1] = v39;
  v54[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
  [(PNPPencilView *)v38 setTransform:v54];
  -[PNPPencilView setFrame:](self->_pencilView, "setFrame:", v20, v19, v17, v18);
  v40 = self->_pencilView;
  [(PNPPairingView *)self _pencilTransformForState:v14 deviceState:v15];
  [(PNPPencilView *)v40 setTransform:&v53];
  [MEMORY[0x263F158F8] commit];
  v41 = [(PNPPairingView *)self chargingStatusView];
  if ([(PNPPairingView *)self showsChargingStatusView]) {
    double v42 = 1.0;
  }
  else {
    double v42 = 0.0;
  }
  [v41 setAlpha:v42];

  v43 = [(PNPPairingView *)self chargingStatusView];
  [v43 intrinsicContentSize];

  [(PNPPairingView *)self bounds];
  UIRectCenteredIntegralRect();
  double v45 = v44;
  double v47 = v46;
  double v49 = v48;
  double v51 = v50;
  v52 = [(PNPPairingView *)self chargingStatusView];
  objc_msgSend(v52, "setFrame:", v45, v47, v49, v51);
}

- (CGSize)_intrinsicContentSizeForState:(unint64_t)a3 deviceState:(id)a4
{
  if (a3)
  {
    v4 = objc_opt_class();
    [v4 preferredContentSize];
  }
  else
  {
    pencilView = self->_pencilView;
    [(PNPPencilView *)pencilView comfortableContainingSizeForDeviceState:a4];
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)intrinsicContentSize
{
  if ([(PNPPairingView *)self showsChargingStatusView])
  {
    chargingStatusView = self->_chargingStatusView;
    [(PNPChargingStatusView *)chargingStatusView intrinsicContentSize];
  }
  else
  {
    unint64_t v6 = [(PNPPairingView *)self state];
    double v7 = [(PNPPairingView *)self deviceState];
    [(PNPPairingView *)self _intrinsicContentSizeForState:v6 deviceState:v7];
    double v9 = v8;
    double v11 = v10;

    double v4 = v9;
    double v5 = v11;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- (CGSize)_pencilSizeForState:(unint64_t)a3
{
  if (a3)
  {
    double v4 = [(PNPWizardViewController *)self->_wizardViewController view];
    [v4 frame];
    double v6 = v5 + self->_pencilSpinningRect.origin.x * -2.0;
    [(PNPPencilView *)self->_pencilView intrinsicContentSize];
    double v8 = v7 + -20.0;
  }
  else
  {
    pencilView = self->_pencilView;
    double v4 = objc_opt_new();
    [(PNPPencilView *)pencilView intrinsicSizeForDeviceState:v4];
    double v6 = v10;
    double v8 = v11;
  }

  double v12 = v6;
  double v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (CGAffineTransform)_pencilTransformForState:(SEL)a3 deviceState:(unint64_t)a4
{
  pencilView = (PNPPencilView *)a5;
  double v9 = pencilView;
  if (a4 == 1 && self->_finishedWizardTransition)
  {
    uint64_t v10 = MEMORY[0x263F000D0];
    long long v11 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x263F000D0];
    *(_OWORD *)&retstr->c = v11;
    *(_OWORD *)&retstr->tdouble x = *(_OWORD *)(v10 + 32);
  }
  else
  {
    pencilView = self->_pencilView;
    if (pencilView)
    {
      double v13 = v9;
      pencilView = [(PNPPencilView *)pencilView transformForDeviceState:v9];
      double v9 = v13;
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tdouble x = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }
  }
  return (CGAffineTransform *)MEMORY[0x270F9A758](pencilView, v9);
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
  id v5 = a3;
  pencilView = self->_pencilView;
  double v7 = [(PNPPairingView *)self deviceState];
  [(PNPPencilView *)pencilView setDeviceState:v7];

  [(PNPWizardViewController *)self->_wizardViewController deviceStateDidChange];
  double v8 = [(PNPPairingView *)self delegate];
  [v8 intrinsicContentSizeDidChangeForView:self];

  [(PNPPairingView *)self setNeedsLayout];
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    double v4 = [(PNPPairingView *)self delegate];
    [v4 intrinsicContentSizeDidChangeForView:self];

    [(PNPPairingView *)self setNeedsLayout];
  }
}

- (void)setShowWizardContents:(BOOL)a3
{
  if (self->_showWizardContents != a3)
  {
    self->_showWizardContents = a3;
    [(PNPPairingView *)self setNeedsLayout];
  }
}

- (void)prepareForTransitionToWizard
{
}

- (void)transitionToWizard
{
  v3 = [(PNPPairingView *)self pencilView];
  [v3 setAlpha:0.0];

  [(PNPPairingView *)self unhideWizardIfNecessary];
}

- (void)unhideWizardIfNecessary
{
  v3 = [(PNPWizardViewController *)self->_wizardViewController view];
  [v3 setHidden:0];

  id v4 = [(PNPWizardViewController *)self->_wizardViewController view];
  [v4 setAlpha:1.0];
}

- (void)wizardTransitionFinished
{
  self->_finishedWizardTransition = 1;
  v3 = [(PNPPairingView *)self pencilView];
  [v3 cleanupSpinningResources];

  [(PNPPairingView *)self setNeedsLayout];
}

- (void)wizardViewRequestsDismiss:(id)a3
{
  id v4 = [(PNPPairingView *)self delegate];
  [v4 viewRequestsDismiss:self];
}

- (id)backgroundColorForWizardController:(id)a3
{
  v3 = [(PNPPairingView *)self superview];
  id v4 = [v3 backgroundColor];

  return v4;
}

- (PNPPencilView)pencilView
{
  return self->_pencilView;
}

- (void)setChargingStatusView:(id)a3
{
  id v6 = a3;
  id v5 = [(PNPPairingView *)self chargingStatusView];

  if (v5 != v6)
  {
    [(PNPChargingStatusView *)self->_chargingStatusView removeFromSuperview];
    objc_storeStrong((id *)&self->_chargingStatusView, a3);
    if (self->_chargingStatusView)
    {
      -[PNPPairingView addSubview:](self, "addSubview:");
      [(PNPPairingView *)self setNeedsLayout];
    }
  }
}

- (void)setShowsChargingStatusView:(BOOL)a3
{
  self->_showsChargingStatusView = a3;
  [(PNPPairingView *)self setNeedsLayout];
}

- (PNPPairingView)initWithFrame:(CGRect)a3
{
  v13.receiver = self;
  v13.super_class = (Class)PNPPairingView;
  v3 = -[PNPPairingView initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  id v4 = [[PNPPencilView alloc] initWithVariant:0];
  pencilView = v3->_pencilView;
  v3->_pencilView = v4;

  [(PNPPairingView *)v3 addSubview:v3->_pencilView];
  id v6 = [[PNPWizardViewController alloc] initWithNibName:0 bundle:0];
  wizardViewController = v3->_wizardViewController;
  v3->_wizardViewController = v6;

  [(PNPWizardViewController *)v3->_wizardViewController setWizardDelegate:v3];
  double v8 = [(PNPWizardViewController *)v3->_wizardViewController view];
  [v8 setAlpha:0.0];

  double v9 = [(PNPWizardViewController *)v3->_wizardViewController view];
  [v9 setHidden:1];

  uint64_t v10 = [(PNPWizardViewController *)v3->_wizardViewController view];
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, 176.0, 176.0);

  long long v11 = [(PNPWizardViewController *)v3->_wizardViewController view];
  [(PNPPairingView *)v3 addSubview:v11];

  return v3;
}

- (PNPChargingStatusView)chargingStatusView
{
  return self->_chargingStatusView;
}

- (BOOL)showsChargingStatusView
{
  return self->_showsChargingStatusView;
}

- (unint64_t)state
{
  return self->_state;
}

- (PNPPairingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PNPPairingViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showWizardContents
{
  return self->_showWizardContents;
}

- (BOOL)shouldShowWhatsNew
{
  return self->_shouldShowWhatsNew;
}

- (void)setShouldShowWhatsNew:(BOOL)a3
{
  self->_shouldShowWhatsNew = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (PNPWizardViewController)wizardViewController
{
  return self->_wizardViewController;
}

- (void)setWizardViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wizardViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_chargingStatusView, 0);
  objc_storeStrong((id *)&self->_pencilView, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end