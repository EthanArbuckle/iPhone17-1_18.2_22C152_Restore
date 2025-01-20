@interface PNPChargingStatusView
- (BOOL)_showBatteryStatus;
- (BOOL)alphaOutName;
- (BOOL)didStartBatteryTransition;
- (BOOL)isTransitioningToBatteryUI;
- (BOOL)showsCharging;
- (CGSize)intrinsicContentSize;
- (PNPChargingStatusView)initWithFrame:(CGRect)a3;
- (PNPChargingStatusViewDelegate)delegate;
- (PNPDeviceState)deviceState;
- (int64_t)chargingState;
- (void)_performAnimations:(id)a3 completion:(id)a4;
- (void)_setAndAnimateChargingStateToConnecting;
- (void)beginPairing;
- (void)layoutSubviews;
- (void)setAlphaOutName:(BOOL)a3;
- (void)setChargingState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDeviceState:(id)a3;
- (void)setDidStartBatteryTransition:(BOOL)a3;
- (void)setIsTransitioningToBatteryUI:(BOOL)a3;
- (void)setShowsCharging:(BOOL)a3;
- (void)updateChargingState:(int64_t)a3;
- (void)updateConstraints;
@end

@implementation PNPChargingStatusView

- (void)layoutSubviews
{
  v50.receiver = self;
  v50.super_class = (Class)PNPChargingStatusView;
  [(PNPChargingStatusView *)&v50 layoutSubviews];
  v3 = [(PNPChargingStatusView *)self deviceState];
  [v3 batteryLevel];
  double v5 = v4;
  double v6 = v4 * 100.0;
  uint64_t v7 = vcvtmd_s64_f64(v6);
  double v8 = (double)(uint64_t)floor(v6);
  uint64_t v9 = [(UILabel *)self->_deviceNameLabel text];
  if (!v9 || (v10 = (void *)v9, uint64_t v11 = [v3 deviceType], v10, v11))
  {
    deviceNameLabel = self->_deviceNameLabel;
    v13 = [v3 displayName];
    [(UILabel *)deviceNameLabel setText:v13];
  }
  uint64_t v14 = 1;
  [(UILabel *)self->_deviceNameLabel setTextAlignment:1];
  percentageLabel = self->_percentageLabel;
  if (v7 < 21) {
    uint64_t v14 = 2;
  }
  v16 = [MEMORY[0x263F1C550] batteryTextColorLowPower:v7 < 21];
  [(UILabel *)percentageLabel setTextColor:v16];

  tapToConnectButton = self->_tapToConnectButton;
  v18 = [MEMORY[0x263F1C550] defaultButtonColor];
  [(PNPConnectButton *)tapToConnectButton setTitleColor:v18 forState:0];

  -[_UIBatteryView setChargingState:](self->_batteryView, "setChargingState:", [v3 isCharging]);
  [(_UIBatteryView *)self->_batteryView setChargePercent:v5];
  [(_UIBatteryView *)self->_batteryView setLowBatteryMode:v14];
  batteryView = self->_batteryView;
  v20 = [MEMORY[0x263F1C550] batteryBodyColor];
  [(_UIBatteryView *)batteryView setBodyColor:v20];

  v21 = (void *)MEMORY[0x263F08A30];
  v22 = [NSNumber numberWithDouble:v8 / 100.0];
  v23 = [v21 localizedStringFromNumber:v22 numberStyle:3];

  [(UILabel *)self->_percentageLabel setText:v23];
  [(UILabel *)self->_percentageLabel setTextAlignment:1];
  if (self->_alphaOutName)
  {
    spinnerView = self->_spinnerView;
LABEL_8:
    double v25 = 0.0;
LABEL_9:
    [(UIActivityIndicatorView *)spinnerView setAlpha:v25];
    goto LABEL_10;
  }
  if ([(PNPChargingStatusView *)self _showBatteryStatus])
  {
    spinnerView = self->_spinnerView;
    if (self->_isTransitioningToBatteryUI) {
      goto LABEL_8;
    }
    [(UIActivityIndicatorView *)spinnerView stopAnimating];
  }
  else if ([(PNPChargingStatusView *)self chargingState] == 1)
  {
    spinnerView = self->_spinnerView;
    double v25 = 1.0;
    goto LABEL_9;
  }
LABEL_10:
  memset(&v49, 0, sizeof(v49));
  CGAffineTransformMakeScale(&v49, 0.8, 0.8);
  switch(self->_chargingState)
  {
    case 1:
      double v26 = 0.6;
      if (self->_isFadingOutDeviceName) {
        double v26 = 1.0;
      }
      [(UILabel *)self->_deviceNameLabel setAlpha:v26];
      goto LABEL_14;
    case 2:
      [(UILabel *)self->_deviceNameLabel setAlpha:1.0];
      [(UIView *)self->_batterySectionView setAlpha:1.0];
      [(PNPConnectButton *)self->_tapToConnectButton setAlpha:0.0];
      CGAffineTransform v48 = v49;
      [(UILabel *)self->_deviceNameLabel setTransform:&v48];
      batterySectionView = self->_batterySectionView;
      long long v31 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v47[0] = *MEMORY[0x263F000D0];
      v47[1] = v31;
      v47[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      [(UIView *)batterySectionView setTransform:v47];
      goto LABEL_23;
    case 3:
      CGAffineTransform v44 = v49;
      [(UILabel *)self->_deviceNameLabel setTransform:&v44];
      v32 = self->_tapToConnectButton;
      long long v33 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v43[0] = *MEMORY[0x263F000D0];
      v43[1] = v33;
      v43[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      v34 = v43;
      goto LABEL_21;
    case 4:
      CGAffineTransform v46 = v49;
      [(UILabel *)self->_deviceNameLabel setTransform:&v46];
      v32 = self->_tapToConnectButton;
      long long v35 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v45[0] = *MEMORY[0x263F000D0];
      v45[1] = v35;
      v45[2] = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      v34 = v45;
LABEL_21:
      [(PNPConnectButton *)v32 setTransform:v34];
      [(UILabel *)self->_deviceNameLabel setAlpha:1.0];
      [(PNPConnectButton *)self->_tapToConnectButton setAlpha:1.0];
      v29 = (PNPConnectButton *)self->_batterySectionView;
      break;
    default:
LABEL_14:
      v27 = self->_deviceNameLabel;
      long long v38 = *(_OWORD *)(MEMORY[0x263F000D0] + 16);
      v41[0] = *MEMORY[0x263F000D0];
      v41[1] = v38;
      long long v42 = *(_OWORD *)(MEMORY[0x263F000D0] + 32);
      -[UILabel setTransform:](v27, "setTransform:", v41, v42, v41[0], v38);
      v28 = self->_batterySectionView;
      v40[0] = v37;
      v40[1] = v39;
      v40[2] = v36;
      [(UIView *)v28 setTransform:v40];
      [(UIView *)self->_batterySectionView setAlpha:0.0];
      v29 = self->_tapToConnectButton;
      break;
  }
  [(PNPConnectButton *)v29 setAlpha:0.0];
LABEL_23:
}

- (void)_performAnimations:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x263F1CB60];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __55__PNPChargingStatusView__performAnimations_completion___block_invoke;
  v12[3] = &unk_264DA5768;
  id v13 = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __55__PNPChargingStatusView__performAnimations_completion___block_invoke_2;
  v10[3] = &unk_264DA5800;
  id v11 = v6;
  id v8 = v6;
  id v9 = v5;
  [v7 animateWithDuration:4 delay:v12 usingSpringWithDamping:v10 initialSpringVelocity:0.6 options:0.0 animations:0.7 completion:0.0];
}

uint64_t __55__PNPChargingStatusView__performAnimations_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __55__PNPChargingStatusView__performAnimations_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)_showBatteryStatus
{
  v3 = [(PNPChargingStatusView *)self deviceState];
  BOOL v4 = ([v3 batteryLevelUnknown] & 1) == 0
    && [(PNPChargingStatusView *)self showsCharging]
    && [(PNPChargingStatusView *)self chargingState] == 2;

  return v4;
}

- (void)updateChargingState:(int64_t)a3
{
  int64_t chargingState = self->_chargingState;
  if (!a3 && chargingState == 4)
  {
    self->_int64_t chargingState = 0;
LABEL_4:
    [(PNPChargingStatusView *)self setNeedsUpdateConstraints];
    [(PNPChargingStatusView *)self setNeedsLayout];
    [(PNPChargingStatusView *)self layoutIfNeeded];
    return;
  }
  if (a3 != 1 || chargingState)
  {
    if (a3 == 4)
    {
      self->_int64_t chargingState = 4;
      return;
    }
    if (a3 != 3)
    {
      if (a3 != 2) {
        return;
      }
      id v5 = [(PNPChargingStatusView *)self layer];
      [v5 removeAllAnimations];

      id v6 = [(UILabel *)self->_deviceNameLabel layer];
      [v6 removeAllAnimations];

      self->_int64_t chargingState = 2;
      goto LABEL_4;
    }
    self->_int64_t chargingState = 3;
    [(PNPConnectButton *)self->_tapToConnectButton setHidden:0];
    tapToConnectButton = self->_tapToConnectButton;
    id v8 = PencilPairingUIBundle();
    id v9 = [v8 localizedStringForKey:@"INTERNET_CONNECTION_REQUIRED" value:&stru_26ECD9920 table:0];
    [(PNPConnectButton *)tapToConnectButton setTitle:v9 forState:0];

    id v10 = [(PNPConnectButton *)self->_tapToConnectButton titleLabel];
    [v10 setAdjustsFontSizeToFitWidth:1];
  }
  else
  {
    [(PNPChargingStatusView *)self _setAndAnimateChargingStateToConnecting];
  }
}

- (void)_setAndAnimateChargingStateToConnecting
{
  if (self->_alphaOutName)
  {
    self->_int64_t chargingState = 1;
    [(UILabel *)self->_deviceNameLabel setAlpha:1.0];
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __64__PNPChargingStatusView__setAndAnimateChargingStateToConnecting__block_invoke;
    v4[3] = &unk_264DA56A0;
    v4[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:28 delay:v4 options:0 animations:0.8 completion:0.0];
  }
  else
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __64__PNPChargingStatusView__setAndAnimateChargingStateToConnecting__block_invoke_2;
    v3[3] = &unk_264DA56A0;
    v3[4] = self;
    [MEMORY[0x263F1CB60] _animateWithDuration:4 delay:v3 options:0 animations:0 start:0.8 completion:0.0];
  }
}

uint64_t __64__PNPChargingStatusView__setAndAnimateChargingStateToConnecting__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 432) setAlpha:0.6];
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

uint64_t __64__PNPChargingStatusView__setAndAnimateChargingStateToConnecting__block_invoke_2(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 520) = 1;
  [*(id *)(a1 + 32) setNeedsLayout];
  v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (CGSize)intrinsicContentSize
{
  deviceNameLabel = self->_deviceNameLabel;
  [(UILabel *)deviceNameLabel frame];
  -[UILabel sizeThatFits:](deviceNameLabel, "sizeThatFits:", v4, 1.79769313e308);
  double v6 = fmax(self->_maxPillWidth, fmin(fmax(v5 + 60.0, 188.0), 260.0));
  self->_maxPillWidth = v6;
  double v7 = 56.0;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)setDeviceState:(id)a3
{
  objc_storeStrong((id *)&self->_deviceState, a3);
  [(PNPChargingStatusView *)self setNeedsLayout];
  [(PNPChargingStatusView *)self layoutIfNeeded];
  [(PNPChargingStatusView *)self setNeedsUpdateConstraints];
}

- (void)setShowsCharging:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__PNPChargingStatusView_setShowsCharging___block_invoke;
  v3[3] = &unk_264DA5740;
  v3[4] = self;
  BOOL v4 = a3;
  [(PNPChargingStatusView *)self _performAnimations:v3 completion:&__block_literal_global_11];
}

uint64_t __42__PNPChargingStatusView_setShowsCharging___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 506) = *(unsigned char *)(a1 + 40);
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  v2 = *(void **)(a1 + 32);
  return [v2 setNeedsUpdateConstraints];
}

- (PNPDeviceState)deviceState
{
  return self->_deviceState;
}

- (void)setIsTransitioningToBatteryUI:(BOOL)a3
{
  self->_isTransitioningToBatteryUI = a3;
  [(PNPChargingStatusView *)self setNeedsUpdateConstraints];
  [(PNPChargingStatusView *)self setNeedsLayout];
  [(PNPChargingStatusView *)self layoutIfNeeded];
}

- (void)updateConstraints
{
  [(UILabel *)self->_deviceNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = &OBJC_IVAR___PNPChargingStatusView__centerDeviceNameConstraint;
  BOOL v4 = &OBJC_IVAR___PNPChargingStatusView__alignDeviceNameToTopConstraint;
  if ([(PNPChargingStatusView *)self chargingState])
  {
    int64_t v5 = [(PNPChargingStatusView *)self chargingState];
    if (v5 == 1) {
      double v6 = &OBJC_IVAR___PNPChargingStatusView__alignDeviceNameToTopConstraint;
    }
    else {
      double v6 = &OBJC_IVAR___PNPChargingStatusView__centerDeviceNameConstraint;
    }
    if (v5 != 1) {
      v3 = &OBJC_IVAR___PNPChargingStatusView__alignDeviceNameToTopConstraint;
    }
    BOOL v4 = v6;
  }
  [(PNPChargingStatusView *)self removeConstraint:*(Class *)((char *)&self->super.super.super.isa + *v4)];
  [(PNPChargingStatusView *)self addConstraint:*(Class *)((char *)&self->super.super.super.isa + *v3)];
  v7.receiver = self;
  v7.super_class = (Class)PNPChargingStatusView;
  [(PNPChargingStatusView *)&v7 updateConstraints];
  [(NSLayoutConstraint *)self->_tapToConnectButtonWidthConstraint setConstant:self->_maxPillWidth * 0.85];
}

- (PNPChargingStatusView)initWithFrame:(CGRect)a3
{
  v96.receiver = self;
  v96.super_class = (Class)PNPChargingStatusView;
  v3 = -[PNPChargingStatusView initWithFrame:](&v96, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3->_maxPillWidth = 0.0;
  v3->_alphaOutName = 1;
  v3->_didStartBatteryAnimation = 0;
  BOOL v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  deviceNameLabel = v3->_deviceNameLabel;
  v3->_deviceNameLabel = v4;

  uint64_t v6 = [objc_alloc(MEMORY[0x263F1CC08]) initWithSizeCategory:1];
  batteryView = v3->_batteryView;
  v3->_batteryView = (_UIBatteryView *)v6;

  [(_UIBatteryView *)v3->_batteryView setShowsInlineChargingIndicator:1];
  id v8 = (UILabel *)objc_alloc_init(MEMORY[0x263F1C768]);
  percentageLabel = v3->_percentageLabel;
  v3->_percentageLabel = v8;

  id v10 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  contentAreaView = v3->_contentAreaView;
  v3->_contentAreaView = v10;

  v12 = (UIView *)objc_alloc_init(MEMORY[0x263F1CB60]);
  batterySectionView = v3->_batterySectionView;
  v3->_batterySectionView = v12;

  uint64_t v14 = (UIActivityIndicatorView *)objc_alloc_init(MEMORY[0x263F1C3D8]);
  spinnerView = v3->_spinnerView;
  v3->_spinnerView = v14;

  [(UIActivityIndicatorView *)v3->_spinnerView startAnimating];
  [(UIActivityIndicatorView *)v3->_spinnerView setAlpha:0.0];
  [(UIActivityIndicatorView *)v3->_spinnerView setActivityIndicatorViewStyle:2];
  uint64_t v16 = +[PNPConnectButton buttonWithType:1];
  tapToConnectButton = v3->_tapToConnectButton;
  v3->_tapToConnectButton = (PNPConnectButton *)v16;

  [(PNPConnectButton *)v3->_tapToConnectButton addTarget:v3 action:sel_beginPairing forControlEvents:64];
  double v18 = *MEMORY[0x263F81800];
  v95 = [MEMORY[0x263F81708] systemFontOfSize:12.0 weight:*MEMORY[0x263F81800]];
  v19 = [(PNPConnectButton *)v3->_tapToConnectButton titleLabel];
  [v19 setFont:v95];

  v20 = PencilPairingUIBundle();
  v21 = [v20 localizedStringForKey:@"APPLE_PENCIL_NAME" value:&stru_26ECD9920 table:0];
  [(UILabel *)v3->_deviceNameLabel setText:v21];

  v22 = v3->_tapToConnectButton;
  v23 = PencilPairingUIBundle();
  v24 = [v23 localizedStringForKey:@"TAP_TO_CONNECT" value:&stru_26ECD9920 table:0];
  [(PNPConnectButton *)v22 setTitle:v24 forState:0];

  v94 = [MEMORY[0x263F1CB00] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x263F1D180]];
  v93 = [MEMORY[0x263F81720] preferredFontDescriptorWithTextStyle:*MEMORY[0x263F1D298] compatibleWithTraitCollection:v94];
  double v25 = [MEMORY[0x263F81708] fontWithDescriptor:v93 size:0.0];
  double v26 = (void *)MEMORY[0x263F81708];
  [v25 pointSize];
  v92 = objc_msgSend(v26, "systemFontOfSize:weight:");

  v91 = [MEMORY[0x263F81708] systemFontOfSize:13.0 weight:v18];
  [(UILabel *)v3->_deviceNameLabel setFont:v92];
  [(UILabel *)v3->_percentageLabel setFont:v91];
  [(PNPChargingStatusView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v3->_deviceNameLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(_UIBatteryView *)v3->_batteryView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)v3->_percentageLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v3->_contentAreaView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v3->_batterySectionView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIActivityIndicatorView *)v3->_spinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PNPConnectButton *)v3->_tapToConnectButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PNPChargingStatusView *)v3 addSubview:v3->_spinnerView];
  [(PNPChargingStatusView *)v3 addSubview:v3->_contentAreaView];
  [(PNPChargingStatusView *)v3 addSubview:v3->_batterySectionView];
  [(PNPChargingStatusView *)v3 addSubview:v3->_deviceNameLabel];
  [(PNPChargingStatusView *)v3 addSubview:v3->_tapToConnectButton];
  [(UIView *)v3->_batterySectionView addSubview:v3->_batteryView];
  [(UIView *)v3->_batterySectionView addSubview:v3->_percentageLabel];
  v27 = [MEMORY[0x263EFF980] array];
  v28 = [(UIView *)v3->_contentAreaView leadingAnchor];
  v29 = [(PNPChargingStatusView *)v3 leadingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29 constant:30.0];
  [v27 addObject:v30];

  long long v31 = [(UIView *)v3->_contentAreaView trailingAnchor];
  v32 = [(PNPChargingStatusView *)v3 trailingAnchor];
  long long v33 = [v31 constraintEqualToAnchor:v32 constant:-30.0];
  [v27 addObject:v33];

  v34 = [(UIView *)v3->_contentAreaView centerYAnchor];
  long long v35 = [(PNPChargingStatusView *)v3 centerYAnchor];
  long long v36 = [v34 constraintEqualToAnchor:v35];
  [v27 addObject:v36];

  long long v37 = [(UIActivityIndicatorView *)v3->_spinnerView leadingAnchor];
  long long v38 = [(PNPChargingStatusView *)v3 leadingAnchor];
  long long v39 = [v37 constraintEqualToAnchor:v38 constant:15.0];
  [v27 addObject:v39];

  v40 = [(UIActivityIndicatorView *)v3->_spinnerView trailingAnchor];
  v41 = [(UIView *)v3->_contentAreaView leadingAnchor];
  long long v42 = [v40 constraintEqualToAnchor:v41 constant:-5.0];
  [v27 addObject:v42];

  v43 = [(UIActivityIndicatorView *)v3->_spinnerView centerYAnchor];
  CGAffineTransform v44 = [(PNPChargingStatusView *)v3 centerYAnchor];
  v45 = [v43 constraintEqualToAnchor:v44];
  [v27 addObject:v45];

  CGAffineTransform v46 = [(UILabel *)v3->_deviceNameLabel topAnchor];
  v47 = [(UIView *)v3->_contentAreaView topAnchor];
  uint64_t v48 = [v46 constraintEqualToAnchor:v47];
  alignDeviceNameToTopConstraint = v3->_alignDeviceNameToTopConstraint;
  v3->_alignDeviceNameToTopConstraint = (NSLayoutConstraint *)v48;

  objc_super v50 = [(UILabel *)v3->_deviceNameLabel centerYAnchor];
  v51 = [(UIView *)v3->_contentAreaView centerYAnchor];
  uint64_t v52 = [v50 constraintEqualToAnchor:v51];
  centerDeviceNameConstraint = v3->_centerDeviceNameConstraint;
  v3->_centerDeviceNameConstraint = (NSLayoutConstraint *)v52;

  [v27 addObject:v3->_alignDeviceNameToTopConstraint];
  v54 = [(UILabel *)v3->_deviceNameLabel leadingAnchor];
  v55 = [(PNPChargingStatusView *)v3 leadingAnchor];
  v56 = [v54 constraintEqualToAnchor:v55 constant:30.0];
  [v27 addObject:v56];

  v57 = [(UILabel *)v3->_deviceNameLabel trailingAnchor];
  v58 = [(PNPChargingStatusView *)v3 trailingAnchor];
  v59 = [v57 constraintEqualToAnchor:v58 constant:-30.0];
  [v27 addObject:v59];

  v60 = [(UIView *)v3->_batterySectionView centerXAnchor];
  v61 = [(UIView *)v3->_contentAreaView centerXAnchor];
  v62 = [v60 constraintEqualToAnchor:v61];
  [v27 addObject:v62];

  v63 = [(UILabel *)v3->_percentageLabel leadingAnchor];
  v64 = [(UIView *)v3->_batterySectionView leadingAnchor];
  v65 = [v63 constraintGreaterThanOrEqualToAnchor:v64];
  [v27 addObject:v65];

  v66 = [(UILabel *)v3->_percentageLabel lastBaselineAnchor];
  v67 = [(UILabel *)v3->_deviceNameLabel lastBaselineAnchor];
  v68 = [v66 constraintEqualToAnchor:v67 constant:18.0];
  [v27 addObject:v68];

  v69 = [(UILabel *)v3->_percentageLabel bottomAnchor];
  v70 = [(UIView *)v3->_contentAreaView bottomAnchor];
  v71 = [v69 constraintLessThanOrEqualToAnchor:v70];
  [v27 addObject:v71];

  v72 = [(_UIBatteryView *)v3->_batteryView leadingAnchor];
  v73 = [(UILabel *)v3->_percentageLabel trailingAnchor];
  v74 = [v72 constraintEqualToAnchor:v73 constant:8.0];
  [v27 addObject:v74];

  v75 = [(_UIBatteryView *)v3->_batteryView trailingAnchor];
  v76 = [(UIView *)v3->_batterySectionView trailingAnchor];
  v77 = [v75 constraintLessThanOrEqualToAnchor:v76];
  [v27 addObject:v77];

  v78 = [(_UIBatteryView *)v3->_batteryView centerYAnchor];
  v79 = [(UILabel *)v3->_percentageLabel centerYAnchor];
  v80 = [v78 constraintEqualToAnchor:v79];
  [v27 addObject:v80];

  v81 = [(PNPConnectButton *)v3->_tapToConnectButton lastBaselineAnchor];
  v82 = [(UILabel *)v3->_deviceNameLabel lastBaselineAnchor];
  v83 = [v81 constraintEqualToAnchor:v82 constant:18.0];
  [v27 addObject:v83];

  v84 = [(PNPConnectButton *)v3->_tapToConnectButton centerXAnchor];
  v85 = [(PNPChargingStatusView *)v3 centerXAnchor];
  v86 = [v84 constraintEqualToAnchor:v85];
  [v27 addObject:v86];

  v87 = [(PNPConnectButton *)v3->_tapToConnectButton widthAnchor];
  uint64_t v88 = [v87 constraintEqualToConstant:180.0];
  tapToConnectButtonWidthConstraint = v3->_tapToConnectButtonWidthConstraint;
  v3->_tapToConnectButtonWidthConstraint = (NSLayoutConstraint *)v88;

  [v27 addObject:v3->_tapToConnectButtonWidthConstraint];
  [MEMORY[0x263F08938] activateConstraints:v27];

  return v3;
}

- (void)beginPairing
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained didTapOnConnectButton];
}

- (PNPChargingStatusViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PNPChargingStatusViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showsCharging
{
  return self->_showsCharging;
}

- (BOOL)isTransitioningToBatteryUI
{
  return self->_isTransitioningToBatteryUI;
}

- (BOOL)didStartBatteryTransition
{
  return self->_didStartBatteryTransition;
}

- (void)setDidStartBatteryTransition:(BOOL)a3
{
  self->_didStartBatteryTransition = a3;
}

- (int64_t)chargingState
{
  return self->_chargingState;
}

- (void)setChargingState:(int64_t)a3
{
  self->_int64_t chargingState = a3;
}

- (BOOL)alphaOutName
{
  return self->_alphaOutName;
}

- (void)setAlphaOutName:(BOOL)a3
{
  self->_alphaOutName = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_tapToConnectButtonWidthConstraint, 0);
  objc_storeStrong((id *)&self->_centerDeviceNameConstraint, 0);
  objc_storeStrong((id *)&self->_alignDeviceNameToTopConstraint, 0);
  objc_storeStrong((id *)&self->_tapToConnectButton, 0);
  objc_storeStrong((id *)&self->_percentageLabel, 0);
  objc_storeStrong((id *)&self->_batteryView, 0);
  objc_storeStrong((id *)&self->_deviceNameLabel, 0);
  objc_storeStrong((id *)&self->_batterySectionView, 0);
  objc_storeStrong((id *)&self->_contentAreaView, 0);
  objc_storeStrong((id *)&self->_deviceState, 0);
}

@end