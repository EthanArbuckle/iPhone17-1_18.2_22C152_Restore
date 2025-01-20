@interface SBLostModeBiometricAuthenticationTransientOverlayViewController
- (BOOL)_hasTelephonyCapability;
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)isLocked;
- (BOOL)showPasscode;
- (BOOL)unlockFromSource:(int)a3;
- (NSString)coverSheetIdentifier;
- (SBLostModeBiometricAuthenticationTransientOverlayViewController)initWithLockScreenManager:(id)a3 biometricResource:(id)a4;
- (SBLostModeBiometricAuthenticationTransientOverlayViewControllerDelegate)delegate;
- (double)_buttonsBottomSpacing;
- (id)_biometricAuthenticationButtonAction;
- (id)_biometricCapabilityText;
- (int64_t)participantState;
- (void)_handleCancelButtonAction;
- (void)_handleEmergencyButtonAction;
- (void)_runLocalAuthenticationEvaluation;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBLostModeBiometricAuthenticationTransientOverlayViewController

- (SBLostModeBiometricAuthenticationTransientOverlayViewController)initWithLockScreenManager:(id)a3 biometricResource:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBLostModeBiometricAuthenticationTransientOverlayViewController;
  v9 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_lockScreenManager, a3);
    objc_storeStrong((id *)&v10->_biometricResource, a4);
    v11 = [v7 coverSheetViewController];
    [v11 registerExternalLockProvider:v10];
  }
  return v10;
}

- (void)dealloc
{
  v3 = [(SBLockScreenManager *)self->_lockScreenManager coverSheetViewController];
  [v3 unregisterExternalLockProvider:self];
  if (!self->_didAuthenticate)
  {
    v4 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self delegate];
    [v4 lostModeBiometricAuthenticationViewControllerDidFailOrCancelAuthentication:self];
  }
  v5.receiver = self;
  v5.super_class = (Class)SBLostModeBiometricAuthenticationTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v5 dealloc];
}

- (void)viewDidLoad
{
  v130[2] = *MEMORY[0x1E4F143B8];
  v127.receiver = self;
  v127.super_class = (Class)SBLostModeBiometricAuthenticationTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v127 viewDidLoad];
  v3 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (CSPasscodeBackgroundView *)objc_alloc_init(MEMORY[0x1E4F5E438]);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  [(CSPasscodeBackgroundView *)self->_backgroundView setAutoresizingMask:18];
  -[CSPasscodeBackgroundView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v11);
  [(CSPasscodeBackgroundView *)self->_backgroundView setWeighting:1.0];
  [v3 addSubview:self->_backgroundView];
  v14 = NSString;
  v15 = [MEMORY[0x1E4F28B50] mainBundle];
  v16 = [v15 localizedStringForKey:@"LOST_MODE_BIO_AUTHENTICATION_TITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  v17 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self _biometricCapabilityText];
  uint64_t v18 = objc_msgSend(v14, "stringWithFormat:", v16, v17);

  v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v19;

  v21 = self->_titleLabel;
  v22 = [MEMORY[0x1E4FA5F68] pinKeypadStatusTitleViewTitleFont];
  [(UILabel *)v21 setFont:v22];

  v23 = self->_titleLabel;
  v24 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)v23 setTextColor:v24];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  v125 = (void *)v18;
  [(UILabel *)self->_titleLabel setText:v18];
  v25 = NSString;
  v26 = [MEMORY[0x1E4F28B50] mainBundle];
  v27 = [v26 localizedStringForKey:@"LOST_MODE_BIO_AUTHENTICATION_SUBTITLE" value:&stru_1F3084718 table:@"SpringBoard"];
  v28 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self _biometricCapabilityText];
  uint64_t v29 = objc_msgSend(v25, "stringWithFormat:", v27, v28);

  v30 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v30;

  v32 = self->_subtitleLabel;
  v33 = [MEMORY[0x1E4FA5F68] pinKeypadStatusSubtitleViewTitleFont];
  [(UILabel *)v32 setFont:v33];

  v34 = self->_subtitleLabel;
  v35 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)v34 setTextColor:v35];

  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  [(UILabel *)self->_subtitleLabel setNumberOfLines:0];
  [(UILabel *)self->_subtitleLabel setAdjustsFontSizeToFitWidth:1];
  v124 = (void *)v29;
  [(UILabel *)self->_subtitleLabel setText:v29];
  id v36 = objc_alloc(MEMORY[0x1E4F42E20]);
  v37 = self->_subtitleLabel;
  v130[0] = self->_titleLabel;
  v130[1] = v37;
  v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v130 count:2];
  v39 = (UIStackView *)[v36 initWithArrangedSubviews:v38];
  labelsStackView = self->_labelsStackView;
  self->_labelsStackView = v39;

  [(UIStackView *)self->_labelsStackView setAxis:1];
  [(UIStackView *)self->_labelsStackView setSpacing:5.0];
  [(UIStackView *)self->_labelsStackView setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_labelsStackView];
  v41 = [MEMORY[0x1E4F427E8] filledButtonConfiguration];
  v42 = [MEMORY[0x1E4F428B8] colorWithWhite:1.0 alpha:0.3];
  [v41 setBaseBackgroundColor:v42];

  v43 = [MEMORY[0x1E4F428B8] whiteColor];
  [v41 setBaseForegroundColor:v43];

  [v41 setCornerStyle:4];
  v44 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self _biometricCapabilityText];
  [v41 setTitle:v44];

  v45 = (void *)MEMORY[0x1E4F427E0];
  v46 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self _biometricAuthenticationButtonAction];
  v123 = v41;
  v47 = [v45 buttonWithConfiguration:v41 primaryAction:v46];
  biometricAuthButton = self->_biometricAuthButton;
  self->_biometricAuthButton = v47;

  v49 = self->_biometricAuthButton;
  v50 = (void *)MEMORY[0x1E4F42A30];
  v51 = [MEMORY[0x1E4F42A38] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4F438F8] addingSymbolicTraits:0x8000 options:1];
  v52 = [v50 fontWithDescriptor:v51 size:0.0];
  [(UIButton *)v49 setFont:v52];

  [(UIButton *)self->_biometricAuthButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [v3 addSubview:self->_biometricAuthButton];
  v53 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v54 = [v53 localizedStringForKey:@"LOST_MODE_BIO_AUTHENTICATION_CANCEL" value:&stru_1F3084718 table:@"SpringBoard"];

  v55 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
  v122 = (void *)v54;
  [v55 setTitle:v54];
  v56 = [MEMORY[0x1E4F428B8] whiteColor];
  [v55 setBaseForegroundColor:v56];

  v57 = [MEMORY[0x1E4F427E0] buttonWithType:1];
  cancelButton = self->_cancelButton;
  self->_cancelButton = v57;

  v121 = v55;
  [(UIButton *)self->_cancelButton setConfiguration:v55];
  v59 = self->_cancelButton;
  v60 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UIButton *)v59 setTitleColor:v60 forState:0];

  [(UIButton *)self->_cancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)self->_cancelButton addTarget:self action:sel__handleCancelButtonAction forControlEvents:64];
  v126 = v3;
  [v3 addSubview:self->_cancelButton];
  if ([(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self _hasTelephonyCapability])
  {
    v61 = [MEMORY[0x1E4F28B50] mainBundle];
    v62 = [v61 localizedStringForKey:@"LOST_MODE_BIO_AUTHENTICATION_EMERGENCY" value:&stru_1F3084718 table:@"SpringBoard"];

    v63 = [MEMORY[0x1E4F427E8] plainButtonConfiguration];
    [v63 setTitle:v62];
    v64 = [MEMORY[0x1E4F428B8] whiteColor];
    [v63 setBaseForegroundColor:v64];

    v65 = [MEMORY[0x1E4F427E0] buttonWithType:1];
    emergencyButton = self->_emergencyButton;
    self->_emergencyButton = v65;

    [(UIButton *)self->_emergencyButton setConfiguration:v63];
    v67 = self->_emergencyButton;
    v68 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIButton *)v67 setTitleColor:v68 forState:0];

    [(UIButton *)self->_emergencyButton setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIButton *)self->_emergencyButton addTarget:self action:sel__handleEmergencyButtonAction forControlEvents:64];
    [v3 addSubview:self->_emergencyButton];
  }
  v69 = (UILayoutGuide *)objc_alloc_init(MEMORY[0x1E4F42B48]);
  layoutGuide = self->_layoutGuide;
  self->_layoutGuide = v69;

  [v3 addLayoutGuide:self->_layoutGuide];
  v105 = (void *)MEMORY[0x1E4F28DC8];
  v120 = [(UILayoutGuide *)self->_layoutGuide topAnchor];
  v119 = [v3 topAnchor];
  v118 = [v120 constraintEqualToAnchor:v119];
  v129[0] = v118;
  v117 = [(UILayoutGuide *)self->_layoutGuide leadingAnchor];
  v116 = [v3 leadingAnchor];
  v115 = [v117 constraintEqualToAnchor:v116];
  v129[1] = v115;
  v114 = [(UILayoutGuide *)self->_layoutGuide trailingAnchor];
  v113 = [v3 trailingAnchor];
  v112 = [v114 constraintEqualToAnchor:v113];
  v129[2] = v112;
  v111 = [(UILayoutGuide *)self->_layoutGuide heightAnchor];
  v110 = [v3 heightAnchor];
  v109 = [v111 constraintEqualToAnchor:v110 multiplier:0.5];
  v129[3] = v109;
  v108 = [(UIStackView *)self->_labelsStackView bottomAnchor];
  v107 = [(UILayoutGuide *)self->_layoutGuide bottomAnchor];
  v106 = [v108 constraintEqualToAnchor:v107 constant:-10.0];
  v129[4] = v106;
  v104 = [(UIStackView *)self->_labelsStackView leadingAnchor];
  v103 = [v3 leadingAnchor];
  v102 = [v104 constraintEqualToAnchor:v103 constant:50.0];
  v129[5] = v102;
  v101 = [(UIStackView *)self->_labelsStackView trailingAnchor];
  v100 = [v3 trailingAnchor];
  v99 = [v101 constraintEqualToAnchor:v100 constant:-50.0];
  v129[6] = v99;
  v98 = [(UIButton *)self->_biometricAuthButton heightAnchor];
  v97 = [v98 constraintEqualToConstant:50.0];
  v129[7] = v97;
  v96 = [(UIButton *)self->_biometricAuthButton centerXAnchor];
  v95 = [v3 centerXAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v129[8] = v94;
  v93 = [(UIButton *)self->_biometricAuthButton topAnchor];
  v92 = [(UILayoutGuide *)self->_layoutGuide bottomAnchor];
  v91 = [v93 constraintEqualToAnchor:v92 constant:10.0];
  v129[9] = v91;
  v71 = [(UIButton *)self->_biometricAuthButton widthAnchor];
  v72 = [v71 constraintEqualToConstant:175.0];
  v129[10] = v72;
  v73 = [(UIButton *)self->_cancelButton trailingAnchor];
  v74 = [v126 trailingAnchor];
  v75 = [v73 constraintEqualToAnchor:v74 constant:-30.0];
  v129[11] = v75;
  v76 = [(UIButton *)self->_cancelButton bottomAnchor];
  v77 = [v126 bottomAnchor];
  [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self _buttonsBottomSpacing];
  v79 = [v76 constraintLessThanOrEqualToAnchor:v77 constant:-v78];
  v129[12] = v79;
  v80 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:13];
  [v105 activateConstraints:v80];

  v81 = self->_emergencyButton;
  if (v81)
  {
    v82 = (void *)MEMORY[0x1E4F28DC8];
    v83 = [(UIButton *)v81 leadingAnchor];
    v84 = [v126 leadingAnchor];
    v85 = [v83 constraintEqualToAnchor:v84 constant:30.0];
    v128[0] = v85;
    v86 = [(UIButton *)self->_emergencyButton bottomAnchor];
    v87 = [v126 bottomAnchor];
    [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self _buttonsBottomSpacing];
    v89 = [v86 constraintLessThanOrEqualToAnchor:v87 constant:-v88];
    v128[1] = v89;
    v90 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
    [v82 activateConstraints:v90];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SBLostModeBiometricAuthenticationTransientOverlayViewController;
  [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)&v5 viewWillAppear:a3];
  if (!self->_didAuthenticate)
  {
    double v4 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self delegate];
    [v4 lostModeBiometricAuthenticationViewControllerDidFailOrCancelAuthentication:self];
  }
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return 1;
}

- (BOOL)isLocked
{
  return 1;
}

- (BOOL)showPasscode
{
  return 0;
}

- (BOOL)unlockFromSource:(int)a3
{
  return 0;
}

- (NSString)coverSheetIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  return 2;
}

- (double)_buttonsBottomSpacing
{
  if ((unint64_t)([(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] - 1) > 1)
  {
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    long long v138 = 0uLL;
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    int v139 = 0;
    int v140 = 0;
    uint64_t v129 = 0;
    int v141 = 0;
    uint64_t v128 = 0;
    int v142 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v143 = 0;
    int v125 = 0;
    int v144 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    uint64_t v145 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    int v146 = 0;
    double v15 = 21.0;
    goto LABEL_69;
  }
  int v6 = __sb__runningInSpringBoard();
  if (v6)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v7 = 0;
      int v8 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    v123 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v123 userInterfaceIdiom] != 1)
    {
      int v7 = 0;
      int v8 = 1;
      goto LABEL_12;
    }
  }
  int v8 = v6 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v114 = [MEMORY[0x1E4F42D90] mainScreen];
      [v114 _referenceBounds];
    }
    int v7 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v28 == *(double *)(MEMORY[0x1E4FA6E50] + 272) && v27 == *(double *)(MEMORY[0x1E4FA6E50] + 280))
    {
      HIDWORD(v145) = v2 ^ 1;
      int v146 = v8;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      long long v138 = 0uLL;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      int v139 = 0;
      int v140 = 0;
      uint64_t v129 = 0;
      int v141 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v143 = 0;
      int v125 = 0;
      int v144 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      LODWORD(v145) = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 208);
      goto LABEL_69;
    }
  }
  else
  {
    int v7 = 0;
  }
LABEL_12:
  int v16 = __sb__runningInSpringBoard();
  HIDWORD(v145) = v7;
  int v146 = v8;
  if (v16)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v3 = 0;
      int v17 = 0;
      goto LABEL_21;
    }
  }
  else
  {
    v122 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v122 userInterfaceIdiom] != 1)
    {
      uint64_t v3 = 0;
      int v17 = 1;
      goto LABEL_21;
    }
  }
  int v17 = v16 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v113 = [MEMORY[0x1E4F42D90] mainScreen];
      [v113 _referenceBounds];
    }
    uint64_t v3 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v30 >= *(double *)(MEMORY[0x1E4FA6E50] + 424))
    {
      int v144 = v2 ^ 1;
      LODWORD(v145) = v17;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      long long v138 = 0uLL;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      int v139 = 0;
      int v140 = 0;
      uint64_t v129 = 0;
      int v141 = 0;
      uint64_t v128 = 0;
      int v142 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v143 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 248);
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_21:
  int v18 = __sb__runningInSpringBoard();
  int v144 = v3;
  LODWORD(v145) = v17;
  if (v18)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      uint64_t v4 = 0;
      int v19 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    v121 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v121 userInterfaceIdiom] != 1)
    {
      uint64_t v4 = 0;
      int v19 = 1;
      goto LABEL_30;
    }
  }
  int v19 = v18 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v112 = [MEMORY[0x1E4F42D90] mainScreen];
      [v112 _referenceBounds];
    }
    uint64_t v4 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v31 >= *(double *)(MEMORY[0x1E4FA6E50] + 360))
    {
      int v142 = v2 ^ 1;
      int v143 = v19;
      memset(v136, 0, sizeof(v136));
      memset(v135, 0, sizeof(v135));
      memset(v137, 0, sizeof(v137));
      long long v138 = 0uLL;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      int v139 = 0;
      int v140 = 0;
      uint64_t v129 = 0;
      int v141 = 0;
      uint64_t v128 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 232);
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_30:
  int v20 = __sb__runningInSpringBoard();
  int v142 = v4;
  int v143 = v19;
  if (v20)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      int v21 = 0;
      uint64_t v5 = 0;
      goto LABEL_39;
    }
  }
  else
  {
    v120 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v120 userInterfaceIdiom] != 1)
    {
      int v21 = 0;
      uint64_t v5 = 1;
      goto LABEL_39;
    }
  }
  uint64_t v5 = v20 ^ 1u;
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v117 = [MEMORY[0x1E4F42D90] mainScreen];
    [v117 _referenceBounds];
  }
  int v21 = v2 ^ 1;
  BSSizeRoundForScale();
  if (v22 >= *(double *)(MEMORY[0x1E4FA6E50] + 264))
  {
    int v140 = v2 ^ 1;
    int v141 = v5;
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    long long v138 = 0uLL;
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    int v139 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 240);
    goto LABEL_69;
  }
LABEL_39:
  int v23 = __sb__runningInSpringBoard();
  int v140 = v21;
  int v141 = v5;
  if (v23)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      HIDWORD(v138) = 0;
      int v24 = 0;
      goto LABEL_49;
    }
  }
  else
  {
    v119 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v119 userInterfaceIdiom] != 1)
    {
      HIDWORD(v138) = 0;
      int v24 = 1;
      goto LABEL_49;
    }
  }
  int v24 = v23 ^ 1;
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v115 = [MEMORY[0x1E4F42D90] mainScreen];
    [v115 _referenceBounds];
  }
  HIDWORD(v138) = v2 ^ 1;
  BSSizeRoundForScale();
  if (v25 >= *(double *)(MEMORY[0x1E4FA6E50] + 248))
  {
    int v139 = v24;
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    *(void *)&long long v138 = 0;
    long long v134 = 0uLL;
    DWORD2(v138) = 0;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 224);
    goto LABEL_69;
  }
LABEL_49:
  int v26 = __sb__runningInSpringBoard();
  int v139 = v24;
  if (v26)
  {
    if (SBFEffectiveDeviceClass() != 2)
    {
      *(void *)((char *)&v138 + 4) = 0;
      goto LABEL_180;
    }
  }
  else
  {
    v118 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v118 userInterfaceIdiom] != 1)
    {
      *(void *)((char *)&v138 + 4) = 0x100000000;
      goto LABEL_180;
    }
  }
  DWORD2(v138) = v26 ^ 1;
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    v111 = [MEMORY[0x1E4F42D90] mainScreen];
    [v111 _referenceBounds];
  }
  DWORD1(v138) = v2 ^ 1;
  BSSizeRoundForScale();
  if (v33 >= *(double *)(MEMORY[0x1E4FA6E50] + 232))
  {
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    LODWORD(v138) = 0;
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 216);
    goto LABEL_69;
  }
LABEL_180:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() != 2) {
      goto LABEL_182;
    }
LABEL_188:
    memset(v136, 0, sizeof(v136));
    memset(v135, 0, sizeof(v135));
    memset(v137, 0, sizeof(v137));
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 200);
    LODWORD(v138) = v2 ^ 1;
    goto LABEL_69;
  }
  v116 = [MEMORY[0x1E4F42948] currentDevice];
  if ([v116 userInterfaceIdiom] == 1) {
    goto LABEL_188;
  }
LABEL_182:
  LODWORD(v138) = v2 ^ 1;
  if (!_SBF_Private_IsD94Like())
  {
LABEL_186:
    *(void *)v137 = 0;
    goto LABEL_196;
  }
  int v34 = __sb__runningInSpringBoard();
  if (v34)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_186;
    }
  }
  else
  {
    v109 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v109 userInterfaceIdiom])
    {
      *(_DWORD *)v137 = 0;
      *(_DWORD *)&v137[4] = 1;
      goto LABEL_196;
    }
  }
  *(_DWORD *)&v137[4] = v34 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v102 = [MEMORY[0x1E4F42D90] mainScreen];
      [v102 _referenceBounds];
    }
    *(_DWORD *)v137 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v37 >= *(double *)(MEMORY[0x1E4FA6E50] + 200))
    {
      memset(v136, 0, sizeof(v136));
      *(_DWORD *)&v137[8] = 0;
      memset(v135, 0, sizeof(v135));
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 168);
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)v137 = 0;
  }
LABEL_196:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[36] = 0;
      *(_DWORD *)&v137[8] = 0;
      goto LABEL_206;
    }
  }
  else
  {
    v110 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v110 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[36] = 0;
      *(_DWORD *)&v137[8] = 1;
      goto LABEL_206;
    }
  }
  *(_DWORD *)&v137[8] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v105 = [MEMORY[0x1E4F42D90] mainScreen];
      [v105 _referenceBounds];
    }
    *(_DWORD *)&v136[36] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v35 >= *(double *)(MEMORY[0x1E4FA6E50] + 200)) {
      goto LABEL_210;
    }
  }
  else
  {
    *(_DWORD *)&v136[36] = 0;
  }
LABEL_206:
  if (_SBF_Private_IsD94Like())
  {
    memset(v136, 0, 36);
    memset(v135, 0, sizeof(v135));
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 176);
    goto LABEL_69;
  }
LABEL_210:
  if (!_SBF_Private_IsD64Like())
  {
LABEL_214:
    *(void *)&v136[28] = 0;
    goto LABEL_224;
  }
  int v36 = __sb__runningInSpringBoard();
  if (v36)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_214;
    }
  }
  else
  {
    v106 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v106 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[28] = 0;
      *(_DWORD *)&v136[32] = 1;
      goto LABEL_224;
    }
  }
  *(_DWORD *)&v136[32] = v36 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v97 = [MEMORY[0x1E4F42D90] mainScreen];
      [v97 _referenceBounds];
    }
    *(_DWORD *)&v136[28] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v42 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      memset(v136, 0, 28);
      memset(v135, 0, sizeof(v135));
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 184);
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[28] = 0;
  }
LABEL_224:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[24] = 0;
      *(_DWORD *)&v136[16] = 0;
      goto LABEL_234;
    }
  }
  else
  {
    v108 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v108 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[16] = 0;
      *(_DWORD *)&v136[24] = 1;
      goto LABEL_234;
    }
  }
  *(_DWORD *)&v136[24] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v101 = [MEMORY[0x1E4F42D90] mainScreen];
      [v101 _referenceBounds];
    }
    *(_DWORD *)&v136[16] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v38 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_238;
    }
  }
  else
  {
    *(_DWORD *)&v136[16] = 0;
  }
LABEL_234:
  if (_SBF_Private_IsD64Like())
  {
    *(_DWORD *)&v136[20] = 0;
    *(_OWORD *)v136 = 0uLL;
    memset(v135, 0, sizeof(v135));
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 192);
    goto LABEL_69;
  }
LABEL_238:
  int v39 = __sb__runningInSpringBoard();
  if (v39)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)&v136[20] = 0;
      *(_DWORD *)&v136[12] = 0;
      goto LABEL_248;
    }
  }
  else
  {
    v107 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v107 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[12] = 0;
      *(_DWORD *)&v136[20] = 1;
      goto LABEL_248;
    }
  }
  *(_DWORD *)&v136[20] = v39 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v40 = __sb__runningInSpringBoard();
    if (v40)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v98 = [MEMORY[0x1E4F42D90] mainScreen];
      [v98 _referenceBounds];
    }
    uint64_t v2 = v40 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v136[12] = v2;
    if (v41 >= *(double *)(MEMORY[0x1E4FA6E50] + 136))
    {
      *(void *)v136 = 0;
      memset(v135, 0, sizeof(v135));
      *(_DWORD *)&v136[8] = 0;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 152);
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[12] = 0;
  }
LABEL_248:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(_DWORD *)v136 = 0;
      *(_DWORD *)v135 = 0;
      goto LABEL_258;
    }
  }
  else
  {
    v104 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v104 userInterfaceIdiom])
    {
      *(_DWORD *)v135 = 0;
      *(_DWORD *)v136 = 1;
      goto LABEL_258;
    }
  }
  *(_DWORD *)v136 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v96 = [MEMORY[0x1E4F42D90] mainScreen];
      [v96 _referenceBounds];
    }
    *(_DWORD *)v135 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v43 >= *(double *)(MEMORY[0x1E4FA6E50] + 136)) {
      goto LABEL_268;
    }
  }
  else
  {
    *(_DWORD *)v135 = 0;
  }
LABEL_258:
  if (_SBF_Private_IsD54())
  {
    *(void *)&v136[4] = 0;
    *(void *)&v135[4] = 0;
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 160);
    goto LABEL_69;
  }
LABEL_268:
  int v44 = __sb__runningInSpringBoard();
  if (v44)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v136[4] = 0;
      goto LABEL_278;
    }
  }
  else
  {
    v103 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v103 userInterfaceIdiom])
    {
      *(_DWORD *)&v136[4] = 0;
      *(_DWORD *)&v136[8] = 1;
      goto LABEL_278;
    }
  }
  *(_DWORD *)&v136[8] = v44 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v45 = __sb__runningInSpringBoard();
    if (v45)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v93 = [MEMORY[0x1E4F42D90] mainScreen];
      [v93 _referenceBounds];
    }
    uint64_t v2 = v45 ^ 1u;
    BSSizeRoundForScale();
    *(_DWORD *)&v136[4] = v2;
    if (v46 >= *(double *)(MEMORY[0x1E4FA6E50] + 120) && _SBF_Private_IsN84OrSimilarDevice())
    {
      *(void *)&v135[4] = 0;
      long long v134 = 0uLL;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 104);
      goto LABEL_69;
    }
  }
  else
  {
    *(_DWORD *)&v136[4] = 0;
  }
LABEL_278:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      *(void *)&v135[4] = 0;
      goto LABEL_288;
    }
  }
  else
  {
    v100 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v100 userInterfaceIdiom])
    {
      *(_DWORD *)&v135[4] = 0;
      *(_DWORD *)&v135[8] = 1;
      goto LABEL_288;
    }
  }
  *(_DWORD *)&v135[8] = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v92 = [MEMORY[0x1E4F42D90] mainScreen];
      [v92 _referenceBounds];
    }
    *(_DWORD *)&v135[4] = v2 ^ 1;
    BSSizeRoundForScale();
    if (v47 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_297;
    }
  }
  else
  {
    *(_DWORD *)&v135[4] = 0;
  }
LABEL_288:
  if (_SBF_Private_IsD33OrSimilarDevice() && _SBF_Private_IsN84ZoomedOrSimilarDevice())
  {
    long long v134 = 0uLL;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 112);
    goto LABEL_69;
  }
LABEL_297:
  if (!_SBF_Private_IsD93Like())
  {
LABEL_301:
    HIDWORD(v134) = 0;
    LODWORD(v134) = 0;
    goto LABEL_308;
  }
  int v48 = __sb__runningInSpringBoard();
  if (v48)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_301;
    }
  }
  else
  {
    v95 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v95 userInterfaceIdiom])
    {
      LODWORD(v134) = 0;
      HIDWORD(v134) = 1;
      goto LABEL_308;
    }
  }
  HIDWORD(v134) = v48 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v49 = __sb__runningInSpringBoard();
    if (v49)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v86 = [MEMORY[0x1E4F42D90] mainScreen];
      [v86 _referenceBounds];
    }
    uint64_t v2 = v49 ^ 1u;
    BSSizeRoundForScale();
    LODWORD(v134) = v2;
    if (v54 >= *(double *)(MEMORY[0x1E4FA6E50] + 184))
    {
      *(void *)((char *)&v134 + 4) = 0;
      uint64_t v132 = 0;
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 88);
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v134) = 0;
  }
LABEL_308:
  int v50 = __sb__runningInSpringBoard();
  if (v50)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      DWORD2(v134) = 0;
      uint64_t v2 = 0;
      goto LABEL_318;
    }
  }
  else
  {
    v99 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v99 userInterfaceIdiom])
    {
      uint64_t v2 = 0;
      DWORD2(v134) = 1;
      goto LABEL_318;
    }
  }
  DWORD2(v134) = v50 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v51 = __sb__runningInSpringBoard();
    if (v51)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v89 = [MEMORY[0x1E4F42D90] mainScreen];
      [v89 _referenceBounds];
    }
    uint64_t v2 = v51 ^ 1u;
    BSSizeRoundForScale();
    if (v52 >= *(double *)(MEMORY[0x1E4FA6E50] + 184)) {
      goto LABEL_322;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
LABEL_318:
  if (_SBF_Private_IsD93Like())
  {
    DWORD1(v134) = v2;
    uint64_t v132 = 0;
    int v133 = 0;
    int v131 = 0;
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 96);
    goto LABEL_69;
  }
LABEL_322:
  DWORD1(v134) = v2;
  if (!_SBF_Private_IsD63Like())
  {
LABEL_326:
    uint64_t v132 = 0;
    goto LABEL_336;
  }
  int v53 = __sb__runningInSpringBoard();
  if (v53)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1) {
      goto LABEL_326;
    }
  }
  else
  {
    v90 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v90 userInterfaceIdiom])
    {
      uint64_t v132 = 0x100000000;
      goto LABEL_336;
    }
  }
  HIDWORD(v132) = v53 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v82 = [MEMORY[0x1E4F42D90] mainScreen];
      [v82 _referenceBounds];
    }
    LODWORD(v132) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v59 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v133 = 0;
      int v131 = 0;
      uint64_t v128 = 0;
      uint64_t v129 = 0;
      uint64_t v127 = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 136);
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v132) = 0;
  }
LABEL_336:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v133 = 0;
      int v131 = 0;
      goto LABEL_346;
    }
  }
  else
  {
    v94 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v94 userInterfaceIdiom])
    {
      int v131 = 0;
      int v133 = 1;
      goto LABEL_346;
    }
  }
  int v133 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v85 = [MEMORY[0x1E4F42D90] mainScreen];
      [v85 _referenceBounds];
    }
    int v131 = v2 ^ 1;
    BSSizeRoundForScale();
    if (v55 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_350;
    }
  }
  else
  {
    int v131 = 0;
  }
LABEL_346:
  if (_SBF_Private_IsD63Like())
  {
    uint64_t v128 = 0;
    uint64_t v129 = 0;
    uint64_t v127 = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 144);
    goto LABEL_69;
  }
LABEL_350:
  int v56 = __sb__runningInSpringBoard();
  if (v56)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      HIDWORD(v129) = 0;
      HIDWORD(v127) = 0;
      goto LABEL_360;
    }
  }
  else
  {
    v91 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v91 userInterfaceIdiom])
    {
      HIDWORD(v127) = 0;
      HIDWORD(v129) = 1;
      goto LABEL_360;
    }
  }
  HIDWORD(v129) = v56 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v57 = __sb__runningInSpringBoard();
    if (v57)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v83 = [MEMORY[0x1E4F42D90] mainScreen];
      [v83 _referenceBounds];
    }
    uint64_t v2 = v57 ^ 1u;
    BSSizeRoundForScale();
    HIDWORD(v127) = v2;
    if (v58 >= *(double *)(MEMORY[0x1E4FA6E50] + 120))
    {
      LODWORD(v129) = 0;
      uint64_t v128 = 0;
      LODWORD(v127) = 0;
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 120);
      goto LABEL_69;
    }
  }
  else
  {
    HIDWORD(v127) = 0;
  }
LABEL_360:
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v129) = 0;
      HIDWORD(v128) = 0;
      goto LABEL_370;
    }
  }
  else
  {
    double v88 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v88 userInterfaceIdiom])
    {
      HIDWORD(v128) = 0;
      LODWORD(v129) = 1;
      goto LABEL_370;
    }
  }
  LODWORD(v129) = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v81 = [MEMORY[0x1E4F42D90] mainScreen];
      [v81 _referenceBounds];
    }
    HIDWORD(v128) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v60 >= *(double *)(MEMORY[0x1E4FA6E50] + 120)) {
      goto LABEL_380;
    }
  }
  else
  {
    HIDWORD(v128) = 0;
  }
LABEL_370:
  if (_SBF_Private_IsD33OrSimilarDevice())
  {
    LODWORD(v128) = 0;
    LODWORD(v127) = 0;
    int v126 = 0;
    int v130 = 0;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 128);
    goto LABEL_69;
  }
LABEL_380:
  int v61 = __sb__runningInSpringBoard();
  if (v61)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      LODWORD(v128) = 0;
      LODWORD(v127) = 0;
      goto LABEL_390;
    }
  }
  else
  {
    v87 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v87 userInterfaceIdiom])
    {
      LODWORD(v127) = 0;
      LODWORD(v128) = 1;
      goto LABEL_390;
    }
  }
  LODWORD(v128) = v61 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    uint64_t v2 = __sb__runningInSpringBoard();
    if (v2)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v80 = [MEMORY[0x1E4F42D90] mainScreen];
      [v80 _referenceBounds];
    }
    LODWORD(v127) = v2 ^ 1;
    BSSizeRoundForScale();
    if (v64 >= *(double *)(MEMORY[0x1E4FA6E50] + 104))
    {
      int v126 = 0;
      int v130 = 0;
      int v125 = 0;
      int v124 = 0;
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 72);
      goto LABEL_69;
    }
  }
  else
  {
    LODWORD(v127) = 0;
  }
LABEL_390:
  int v62 = __sb__runningInSpringBoard();
  if (v62)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v126 = 0;
      uint64_t v2 = 0;
      goto LABEL_400;
    }
  }
  else
  {
    v84 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v84 userInterfaceIdiom])
    {
      uint64_t v2 = 0;
      int v126 = 1;
      goto LABEL_400;
    }
  }
  int v126 = v62 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v63 = __sb__runningInSpringBoard();
    if (v63)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v79 = [MEMORY[0x1E4F42D90] mainScreen];
      [v79 _referenceBounds];
    }
    uint64_t v2 = v63 ^ 1u;
    BSSizeRoundForScale();
    if (v65 >= *(double *)(MEMORY[0x1E4FA6E50] + 104)) {
      goto LABEL_407;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }
LABEL_400:
  if (_SBF_Private_IsD53())
  {
    int v130 = v2;
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 80);
    goto LABEL_69;
  }
LABEL_407:
  int v130 = v2;
  if (_SBF_Private_IsD16() && _SBF_Private_IsD52OrSimilarDevice())
  {
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 40);
    goto LABEL_69;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice() && _SBF_Private_IsD16())
  {
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 48);
    goto LABEL_69;
  }
  if (_SBF_Private_IsD52OrSimilarDevice())
  {
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 24);
    goto LABEL_69;
  }
  if (_SBF_Private_IsD52ZoomedOrSimilarDevice())
  {
    int v125 = 0;
    int v124 = 0;
    int v9 = 0;
    int v10 = 0;
    int v11 = 0;
    int v12 = 0;
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 32);
    goto LABEL_69;
  }
  uint64_t v2 = __sb__runningInSpringBoard();
  if (v2)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v125 = 0;
      int v124 = 0;
      goto LABEL_427;
    }
  }
  else
  {
    double v78 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v78 userInterfaceIdiom])
    {
      int v124 = 0;
      int v125 = 1;
      goto LABEL_427;
    }
  }
  int v125 = v2 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v66 = __sb__runningInSpringBoard();
    if (v66)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v76 = [MEMORY[0x1E4F42D90] mainScreen];
      [v76 _referenceBounds];
    }
    int v124 = v66 ^ 1;
    BSSizeRoundForScale();
    if (v71 >= *(double *)(MEMORY[0x1E4FA6E50] + 88))
    {
      int v9 = 0;
      int v10 = 0;
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 56);
      goto LABEL_69;
    }
  }
  else
  {
    int v124 = 0;
  }
LABEL_427:
  int v67 = __sb__runningInSpringBoard();
  if (v67)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v9 = 0;
      int v10 = 0;
      goto LABEL_437;
    }
  }
  else
  {
    v77 = [MEMORY[0x1E4F42948] currentDevice];
    if ([v77 userInterfaceIdiom])
    {
      int v10 = 0;
      int v9 = 1;
      goto LABEL_437;
    }
  }
  int v9 = v67 ^ 1;
  if (SBFEffectiveHomeButtonType() == 2)
  {
    int v68 = __sb__runningInSpringBoard();
    if (v68)
    {
      __sb__mainScreenReferenceBounds();
    }
    else
    {
      v75 = [MEMORY[0x1E4F42D90] mainScreen];
      [v75 _referenceBounds];
    }
    int v10 = v68 ^ 1;
    BSSizeRoundForScale();
    if (v72 >= *(double *)(MEMORY[0x1E4FA6E50] + 72))
    {
      int v11 = 0;
      int v12 = 0;
      int v13 = 0;
      int v14 = 0;
      double v15 = *(double *)(MEMORY[0x1E4F5E378] + 64);
      goto LABEL_69;
    }
  }
  else
  {
    int v10 = 0;
  }
LABEL_437:
  int v69 = __sb__runningInSpringBoard();
  if (v69)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v11 = 0;
      int v12 = 0;
      goto LABEL_447;
    }
  }
  else
  {
    uint64_t v2 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v2 userInterfaceIdiom])
    {
      int v12 = 0;
      int v11 = 1;
      goto LABEL_447;
    }
  }
  int v11 = v69 ^ 1;
  uint64_t v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v4 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v4 _referenceBounds];
  }
  int v12 = v3 ^ 1;
  BSSizeRoundForScale();
  if (v70 >= *(double *)(MEMORY[0x1E4FA6E50] + 56))
  {
    int v13 = 0;
    int v14 = 0;
    double v15 = *(double *)(MEMORY[0x1E4F5E378] + 16);
    goto LABEL_69;
  }
LABEL_447:
  uint64_t v3 = __sb__runningInSpringBoard();
  if (v3)
  {
    if (SBFEffectiveDeviceClass() && SBFEffectiveDeviceClass() != 1)
    {
      int v13 = 0;
      int v14 = 0;
LABEL_464:
      double v15 = *MEMORY[0x1E4F5E378];
      goto LABEL_69;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F42948] currentDevice];
    if ([(id)v5 userInterfaceIdiom])
    {
      int v14 = 0;
      int v13 = 1;
      goto LABEL_464;
    }
  }
  int v13 = v3 ^ 1;
  int v73 = __sb__runningInSpringBoard();
  if (v73)
  {
    __sb__mainScreenReferenceBounds();
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F42D90] mainScreen];
    [(id)v3 _referenceBounds];
  }
  int v14 = v73 ^ 1;
  BSSizeRoundForScale();
  if (v74 < *(double *)(MEMORY[0x1E4FA6E50] + 40)) {
    goto LABEL_464;
  }
  double v15 = *(double *)(MEMORY[0x1E4F5E378] + 8);
LABEL_69:
  if (v14) {

  }
  if (v13) {
  if (v12)
  }

  if (v11) {
  if (v10)
  }

  if (v9) {
  if (v124)
  }

  if (v125) {
  if (v130)
  }

  if (v126) {
  if (v127)
  }

  if (v128) {
  if (HIDWORD(v128))
  }

  if (v129) {
  if (HIDWORD(v127))
  }

  if (HIDWORD(v129)) {
  if (v131)
  }

  if (v133) {
  if (v132)
  }

  if (HIDWORD(v132)) {
  if (DWORD1(v134))
  }

  if (DWORD2(v134)) {
  if (v134)
  }

  if (HIDWORD(v134)) {
  if (*(_DWORD *)&v135[4])
  }

  if (*(_DWORD *)&v135[8]) {
  if (*(_DWORD *)&v136[4])
  }

  if (*(_DWORD *)&v136[8]) {
  if (*(_DWORD *)v135)
  }

  if (*(_DWORD *)v136) {
  if (*(_DWORD *)&v136[12])
  }

  if (*(_DWORD *)&v136[20]) {
  if (*(_DWORD *)&v136[16])
  }

  if (*(_DWORD *)&v136[24]) {
  if (*(_DWORD *)&v136[28])
  }

  if (*(_DWORD *)&v136[32]) {
  if (*(_DWORD *)&v136[36])
  }

  if (*(_DWORD *)&v137[8]) {
  if (*(_DWORD *)v137)
  }

  if (*(_DWORD *)&v137[4]) {
  if (v138)
  }

  if (DWORD1(v138)) {
  if (DWORD2(v138))
  }

  if (HIDWORD(v138))
  {

    if (!v139) {
      goto LABEL_157;
    }
  }
  else if (!v139)
  {
LABEL_157:
    if (v140) {
      goto LABEL_158;
    }
    goto LABEL_168;
  }

  if (v140)
  {
LABEL_158:

    if (!v141) {
      goto LABEL_159;
    }
    goto LABEL_169;
  }
LABEL_168:
  if (!v141)
  {
LABEL_159:
    if (v142) {
      goto LABEL_160;
    }
    goto LABEL_170;
  }
LABEL_169:

  if (v142)
  {
LABEL_160:

    if (!v143) {
      goto LABEL_161;
    }
    goto LABEL_171;
  }
LABEL_170:
  if (!v143)
  {
LABEL_161:
    if (v144) {
      goto LABEL_162;
    }
    goto LABEL_172;
  }
LABEL_171:

  if (v144)
  {
LABEL_162:

    if (!v145) {
      goto LABEL_163;
    }
    goto LABEL_173;
  }
LABEL_172:
  if (!v145)
  {
LABEL_163:
    if (HIDWORD(v145)) {
      goto LABEL_164;
    }
    goto LABEL_174;
  }
LABEL_173:

  if (HIDWORD(v145))
  {
LABEL_164:

    if (!v146) {
      return v15;
    }
    goto LABEL_175;
  }
LABEL_174:
  if (v146) {
LABEL_175:
  }

  return v15;
}

- (void)_handleCancelButtonAction
{
  id v3 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self delegate];
  [v3 lostModeBiometricAuthenticationViewControllerDidFailOrCancelAuthentication:self];
}

- (void)_handleEmergencyButtonAction
{
  id v3 = [(SBLostModeBiometricAuthenticationTransientOverlayViewController *)self delegate];
  [v3 lostModeBiometricAuthenticationViewControllerDidTapEmergencyButton:self];
}

- (BOOL)_hasTelephonyCapability
{
  return MGGetBoolAnswer();
}

- (id)_biometricCapabilityText
{
  if ([(SBUIBiometricResource *)self->_biometricResource hasMesaSupport])
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = v3;
    uint64_t v5 = @"LOST_MODE_BIO_AUTHENTICATION_TOUCH_ID";
LABEL_5:
    int v6 = [v3 localizedStringForKey:v5 value:&stru_1F3084718 table:@"SpringBoard"];

    goto LABEL_7;
  }
  if ([(SBUIBiometricResource *)self->_biometricResource hasPearlSupport])
  {
    id v3 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v4 = v3;
    uint64_t v5 = @"LOST_MODE_BIO_AUTHENTICATION_FACE_ID";
    goto LABEL_5;
  }
  int v6 = 0;
LABEL_7:
  return v6;
}

- (id)_biometricAuthenticationButtonAction
{
  objc_initWeak(&location, self);
  uint64_t v2 = (void *)MEMORY[0x1E4F426E8];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __103__SBLostModeBiometricAuthenticationTransientOverlayViewController__biometricAuthenticationButtonAction__block_invoke;
  v5[3] = &unk_1E6AF9818;
  objc_copyWeak(&v6, &location);
  id v3 = [v2 actionWithHandler:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
  return v3;
}

void __103__SBLostModeBiometricAuthenticationTransientOverlayViewController__biometricAuthenticationButtonAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _runLocalAuthenticationEvaluation];
    id WeakRetained = v2;
  }
}

- (void)_runLocalAuthenticationEvaluation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Cannot evaluate local authentication policy with error: %@", (uint8_t *)&v2, 0xCu);
}

void __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke_2;
  v6[3] = &unk_1E6AF5290;
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke_2(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) delegate];
  uint64_t v3 = v2;
  if (*(void *)(a1 + 40))
  {
    id v4 = SBLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke_2_cold_1((uint64_t *)(a1 + 40), v4);
    }

    [v3 lostModeBiometricAuthenticationViewControllerDidFailOrCancelAuthentication:*(void *)(a1 + 32)];
  }
  else
  {
    *(unsigned char *)(*(void *)(a1 + 32) + 1488) = 1;
    [v2 lostModeBiometricAuthenticationViewControllerDidSucceedAuthentication:*(void *)(a1 + 32)];
  }
}

- (SBLostModeBiometricAuthenticationTransientOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBLostModeBiometricAuthenticationTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_emergencyButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_biometricAuthButton, 0);
  objc_storeStrong((id *)&self->_labelsStackView, 0);
  objc_storeStrong((id *)&self->_layoutGuide, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
}

void __100__SBLostModeBiometricAuthenticationTransientOverlayViewController__runLocalAuthenticationEvaluation__block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1D85BA000, a2, OS_LOG_TYPE_ERROR, "Failed lost mode biometric authentication with error: %@", (uint8_t *)&v3, 0xCu);
}

@end