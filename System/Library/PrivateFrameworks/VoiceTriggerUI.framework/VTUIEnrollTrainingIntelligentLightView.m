@interface VTUIEnrollTrainingIntelligentLightView
- (AVCaptureSession)captureSession;
- (BOOL)radarButtonHidden;
- (BOOL)skipButtonHidden;
- (BSUICAPackageView)lightView;
- (SUICIntelligentLightLayer)lightLayer;
- (SiriUIContentButton)radarButton;
- (UIButton)radarExitButton;
- (UIButton)skipButton;
- (UILabel)statusLabel;
- (VTUIEnrollTrainingIntelligentLightView)initWithFrame:(CGRect)a3;
- (VTUIEnrollTrainingViewDelegate)delegate;
- (VTUIPagedLabel)instructionPagedLabel;
- (_TtC14VoiceTriggerUI21GMEnrollmentViewModel)enrollmentViewModel;
- (_TtC14VoiceTriggerUI27GMEnrollmentTextViewManager)enrollmentTextViewManager;
- (void)_setupUI;
- (void)animateSuccessfulStepWithCompletion:(id)a3;
- (void)clearInstructionLabel;
- (void)dealloc;
- (void)setCaptureSession:(id)a3;
- (void)setContinuationAndPreludeLabelHidden:(BOOL)a3;
- (void)setContinuationLabel:(id)a3;
- (void)setContinuationLabelHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setEnrollmentTextViewManager:(id)a3;
- (void)setEnrollmentViewModel:(id)a3;
- (void)setInstructionPagedLabel:(id)a3;
- (void)setLightLayer:(id)a3;
- (void)setLightView:(id)a3;
- (void)setPreludeLabel:(id)a3;
- (void)setPreludeLabelHidden:(BOOL)a3;
- (void)setRadarButton:(id)a3;
- (void)setRadarButtonHidden:(BOOL)a3;
- (void)setSkipButton:(id)a3;
- (void)setSkipButtonHidden:(BOOL)a3;
- (void)showRadarExitButton:(id)a3;
- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5;
@end

@implementation VTUIEnrollTrainingIntelligentLightView

- (VTUIEnrollTrainingIntelligentLightView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingIntelligentLightView;
  v3 = -[VTUIEnrollTrainingIntelligentLightView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VTUIEnrollTrainingIntelligentLightView *)v3 _setupUI];
  }
  return v4;
}

- (void)_setupUI
{
  v134[4] = *MEMORY[0x263EF8340];
  v3 = +[VTUIStyle sharedStyle];
  v126 = [(VTUIEnrollTrainingIntelligentLightView *)self readableContentGuide];
  v127 = v3;
  if ([v3 isIpad]) {
    [MEMORY[0x263F825C8] systemBackgroundColor];
  }
  else {
  v4 = [MEMORY[0x263F825C8] blackColor];
  }
  [(VTUIEnrollTrainingIntelligentLightView *)self setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x263F29D30]);
  objc_super v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v7 = (BSUICAPackageView *)[v5 initWithPackageName:@"BurstEffectForLightLayer" inBundle:v6];
  lightView = self->_lightView;
  self->_lightView = v7;

  [(VTUIEnrollTrainingIntelligentLightView *)self addSubview:self->_lightView];
  v9 = (SUICIntelligentLightLayer *)objc_alloc_init(MEMORY[0x263F75430]);
  lightLayer = self->_lightLayer;
  self->_lightLayer = v9;

  v11 = self->_lightLayer;
  [(BSUICAPackageView *)self->_lightView bounds];
  -[SUICIntelligentLightLayer setFrame:](v11, "setFrame:");
  [(SUICIntelligentLightLayer *)self->_lightLayer setIsQuicktationPill:0];
  [(SUICIntelligentLightLayer *)self->_lightLayer setMinimumPowerLevel:0.0];
  [(SUICIntelligentLightLayer *)self->_lightLayer setColorPalette:104];
  [(SUICIntelligentLightLayer *)self->_lightLayer setPaused:0];
  v12 = [(BSUICAPackageView *)self->_lightView publishedObjectWithName:@"lightlayer"];
  v13 = [v12 superlayer];
  [v13 insertSublayer:self->_lightLayer above:v12];

  v125 = v12;
  [v12 removeFromSuperlayer];
  [(VTUIEnrollTrainingIntelligentLightView *)self bounds];
  double v15 = v14;
  [(VTUIEnrollTrainingIntelligentLightView *)self bounds];
  *(float *)&double v15 = vabdd_f64(v15, v16) * 0.5;
  [(BSUICAPackageView *)self->_lightView setTranslatesAutoresizingMaskIntoConstraints:0];
  v114 = (void *)MEMORY[0x263F08938];
  v123 = [(BSUICAPackageView *)self->_lightView topAnchor];
  v121 = [(VTUIEnrollTrainingIntelligentLightView *)self topAnchor];
  v119 = [v123 constraintEqualToAnchor:v121];
  v134[0] = v119;
  v117 = [(BSUICAPackageView *)self->_lightView bottomAnchor];
  v17 = [(VTUIEnrollTrainingIntelligentLightView *)self bottomAnchor];
  v18 = [v117 constraintEqualToAnchor:v17];
  v134[1] = v18;
  v19 = [(BSUICAPackageView *)self->_lightView trailingAnchor];
  v20 = [(VTUIEnrollTrainingIntelligentLightView *)self trailingAnchor];
  v21 = [v19 constraintEqualToAnchor:v20 constant:*(float *)&v15];
  v134[2] = v21;
  v22 = [(BSUICAPackageView *)self->_lightView leadingAnchor];
  v23 = [(VTUIEnrollTrainingIntelligentLightView *)self leadingAnchor];
  v24 = [v22 constraintEqualToAnchor:v23 constant:(float)-*(float *)&v15];
  v134[3] = v24;
  v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v134 count:4];
  [v114 activateConstraints:v25];

  v26 = [MEMORY[0x263F829A0] appearance];
  uint64_t v132 = *MEMORY[0x263F81500];
  v27 = [MEMORY[0x263F825C8] whiteColor];
  v133 = v27;
  v28 = [NSDictionary dictionaryWithObjects:&v133 forKeys:&v132 count:1];
  [v26 setTitleTextAttributes:v28];

  v29 = (_TtC14VoiceTriggerUI27GMEnrollmentTextViewManager *)objc_opt_new();
  enrollmentTextViewManager = self->_enrollmentTextViewManager;
  self->_enrollmentTextViewManager = v29;

  v31 = [_TtC14VoiceTriggerUI21GMEnrollmentTextModel alloc];
  v32 = [v127 instructionPreAndPostfixFont];
  v33 = [v127 VTUIDeviceSpecificString:@"TEXT_LABEL_SAY_FIRST"];
  uint64_t v34 = [(GMEnrollmentTextModel *)v31 initWithFont:v32 label:v33 hidden:0];

  v35 = [_TtC14VoiceTriggerUI21GMEnrollmentTextModel alloc];
  v36 = [v127 instructionLabelFont];
  uint64_t v37 = [(GMEnrollmentTextModel *)v35 initWithFont:v36 label:&stru_26EB8DDE0 hidden:0];

  v38 = [_TtC14VoiceTriggerUI21GMEnrollmentTextModel alloc];
  v39 = [v127 instructionPreAndPostfixFont];
  v40 = [v127 VTUIDeviceSpecificString:@"TEXT_LABEL_TO_FIRST"];
  uint64_t v41 = [(GMEnrollmentTextModel *)v38 initWithFont:v39 label:v40 hidden:0];

  v122 = (void *)v37;
  v124 = (void *)v34;
  v120 = (void *)v41;
  v42 = [[_TtC14VoiceTriggerUI21GMEnrollmentViewModel alloc] initWithPrelude:v34 instruction:v37 continuation:v41];
  enrollmentViewModel = self->_enrollmentViewModel;
  self->_enrollmentViewModel = v42;

  v118 = [(GMEnrollmentTextViewManager *)self->_enrollmentTextViewManager createViewControllerWithEnrollmentViewModel:self->_enrollmentViewModel];
  v44 = [v118 view];
  objc_msgSend(v44, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  v45 = [MEMORY[0x263F825C8] clearColor];
  [v44 setBackgroundColor:v45];

  [(VTUIEnrollTrainingIntelligentLightView *)self addSubview:v44];
  v46 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v46;

  [(UILabel *)self->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_statusLabel setTextAlignment:1];
  v48 = [v127 instructionLabelFont];
  [(UILabel *)self->_statusLabel setFont:v48];

  [(UILabel *)self->_statusLabel setNumberOfLines:4];
  v49 = [MEMORY[0x263F825C8] systemWhiteColor];
  [(UILabel *)self->_statusLabel setTextColor:v49];

  [(VTUIEnrollTrainingIntelligentLightView *)self addSubview:self->_statusLabel];
  v50 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
  skipButton = self->_skipButton;
  self->_skipButton = v50;

  v52 = self->_skipButton;
  v53 = [MEMORY[0x263F825C8] systemWhiteColor];
  [(UIButton *)v52 setTitleColor:v53 forState:0];

  [(UIButton *)self->_skipButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v54 = self->_skipButton;
  v55 = [v127 VTUIDeviceSpecificString:@"BUTTON_SET_UP_LATER"];
  [(UIButton *)v54 setTitle:v55 forState:0];

  [(VTUIEnrollTrainingIntelligentLightView *)self addSubview:self->_skipButton];
  v100 = (void *)MEMORY[0x263F08938];
  v109 = [v44 topAnchor];
  v115 = [(VTUIEnrollTrainingIntelligentLightView *)self safeAreaLayoutGuide];
  v105 = [v115 topAnchor];
  [v127 instructionOffsetFromTopTrainingForGM];
  v102 = objc_msgSend(v109, "constraintEqualToAnchor:constant:", v105);
  v131[0] = v102;
  v56 = [v44 leadingAnchor];
  v57 = [v126 leadingAnchor];
  v58 = [v56 constraintEqualToAnchor:v57];
  v131[1] = v58;
  v59 = [v44 trailingAnchor];
  v60 = [v126 trailingAnchor];
  v61 = [v59 constraintEqualToAnchor:v60];
  v131[2] = v61;
  v62 = [MEMORY[0x263EFF8C0] arrayWithObjects:v131 count:3];
  [v100 activateConstraints:v62];

  LODWORD(v63) = 1148846080;
  [v44 setContentHuggingPriority:1 forAxis:v63];
  v103 = (void *)MEMORY[0x263F08938];
  v110 = [(UILabel *)self->_statusLabel topAnchor];
  v116 = v44;
  v106 = [v44 topAnchor];
  v64 = [v110 constraintEqualToAnchor:v106 constant:72.0];
  v130[0] = v64;
  v65 = [(UILabel *)self->_statusLabel leadingAnchor];
  v66 = [v126 leadingAnchor];
  v67 = [v65 constraintEqualToAnchor:v66];
  v130[1] = v67;
  v68 = [(UILabel *)self->_statusLabel trailingAnchor];
  v69 = [v126 trailingAnchor];
  v70 = [v68 constraintEqualToAnchor:v69];
  v130[2] = v70;
  v71 = [MEMORY[0x263EFF8C0] arrayWithObjects:v130 count:3];
  [v103 activateConstraints:v71];

  v101 = (void *)MEMORY[0x263F08938];
  v111 = [(UIButton *)self->_skipButton leftAnchor];
  v107 = [v126 leftAnchor];
  v104 = [v111 constraintEqualToAnchor:v107];
  v129[0] = v104;
  v72 = [(UIButton *)self->_skipButton rightAnchor];
  v73 = [v126 rightAnchor];
  v74 = [v72 constraintEqualToAnchor:v73];
  v129[1] = v74;
  v75 = [(UIButton *)self->_skipButton bottomAnchor];
  v76 = [(VTUIEnrollTrainingIntelligentLightView *)self safeAreaLayoutGuide];
  v77 = [v76 bottomAnchor];
  [v127 footerSkipButtonBaselineFromBottom];
  v79 = [v75 constraintEqualToAnchor:v77 constant:-v78];
  v129[2] = v79;
  v80 = [MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:3];
  [v101 activateConstraints:v80];

  v81 = [MEMORY[0x263F086E0] bundleWithPath:@"/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"];
  if (v81)
  {
    v113 = v81;
    v82 = [MEMORY[0x263F827E8] imageNamed:@"radarBug" inBundle:v81 compatibleWithTraitCollection:0];
    v112 = [v82 imageWithRenderingMode:2];

    v83 = [MEMORY[0x263F753A8] buttonWithImageTemplate:v112 style:0];
    radarButton = self->_radarButton;
    self->_radarButton = v83;

    [(SiriUIContentButton *)self->_radarButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v85 = [MEMORY[0x263F825C8] systemWhiteColor];
    v86 = [v85 colorWithAlphaComponent:0.6];
    [(SiriUIContentButton *)self->_radarButton setDefaultColorForTemplate:v86];

    v87 = [MEMORY[0x263F825C8] systemWhiteColor];
    v88 = [v87 colorWithAlphaComponent:0.2];
    [(SiriUIContentButton *)self->_radarButton setHighlightColorForTemplate:v88];

    [(VTUIEnrollTrainingIntelligentLightView *)self setRadarButtonHidden:0];
    [(VTUIEnrollTrainingIntelligentLightView *)self addSubview:self->_radarButton];
    v108 = (void *)MEMORY[0x263F08938];
    v89 = [(SiriUIContentButton *)self->_radarButton trailingAnchor];
    v90 = [(VTUIEnrollTrainingIntelligentLightView *)self safeAreaLayoutGuide];
    v91 = [v90 trailingAnchor];
    [v127 radarBtnHorizontalPadding];
    v93 = [v89 constraintEqualToAnchor:v91 constant:-v92];
    v128[0] = v93;
    v94 = [(SiriUIContentButton *)self->_radarButton bottomAnchor];
    v95 = [(VTUIEnrollTrainingIntelligentLightView *)self safeAreaLayoutGuide];
    v96 = [v95 bottomAnchor];
    [v127 radarBtnVerticalPadding];
    v98 = [v94 constraintEqualToAnchor:v96 constant:-v97];
    v128[1] = v98;
    v99 = [MEMORY[0x263EFF8C0] arrayWithObjects:v128 count:2];
    [v108 activateConstraints:v99];

    [(BSUICAPackageView *)self->_lightView setHidden:1];
    v81 = v113;
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)VTUIEnrollTrainingIntelligentLightView;
  [(VTUIEnrollTrainingIntelligentLightView *)&v2 dealloc];
}

- (void)showRadarExitButton:(id)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F824E8];
  id v5 = a3;
  objc_super v6 = [v4 buttonWithType:0];
  radarExitButton = self->_radarExitButton;
  self->_radarExitButton = v6;

  [(SiriUIContentButton *)self->_radarButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v8 = [(UIButton *)self->_radarExitButton titleLabel];
  [v8 setTextAlignment:1];

  [(UIButton *)self->_radarExitButton setTitle:v5 forState:0];
  v9 = self->_radarExitButton;
  v10 = [MEMORY[0x263F825C8] systemBlueColor];
  [(UIButton *)v9 setTitleColor:v10 forState:0];

  [(VTUIEnrollTrainingIntelligentLightView *)self addSubview:self->_radarExitButton];
  v21 = (void *)MEMORY[0x263F08938];
  v23 = [(UIButton *)self->_radarExitButton leftAnchor];
  v24 = [(VTUIEnrollTrainingIntelligentLightView *)self readableContentGuide];
  v22 = [v24 leftAnchor];
  v11 = [v23 constraintEqualToAnchor:v22];
  v25[0] = v11;
  v12 = [(UIButton *)self->_radarExitButton rightAnchor];
  v13 = [(VTUIEnrollTrainingIntelligentLightView *)self readableContentGuide];
  double v14 = [v13 rightAnchor];
  double v15 = [v12 constraintEqualToAnchor:v14];
  v25[1] = v15;
  double v16 = [(UIButton *)self->_radarExitButton bottomAnchor];
  v17 = [(VTUIEnrollTrainingIntelligentLightView *)self safeAreaLayoutGuide];
  v18 = [v17 bottomAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v25[2] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  [v21 activateConstraints:v20];
}

- (void)setDelegate:(id)a3
{
  id v5 = a3;
  -[UIButton addTarget:action:forControlEvents:](self->_skipButton, "addTarget:action:forControlEvents:");
  radarButton = self->_radarButton;
  if (radarButton) {
    [(SiriUIContentButton *)radarButton addTarget:v5 action:sel_enrollTrainingViewRadarButtonPressed_ forControlEvents:64];
  }
}

- (void)setSkipButtonHidden:(BOOL)a3
{
}

- (void)setRadarButtonHidden:(BOOL)a3
{
}

- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __76__VTUIEnrollTrainingIntelligentLightView_slideInText_afterDelay_completion___block_invoke;
  block[3] = &unk_264D4CA40;
  block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_after(v10, MEMORY[0x263EF83A0], block);
}

uint64_t __76__VTUIEnrollTrainingIntelligentLightView_slideInText_afterDelay_completion___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) enrollmentViewModel];
  [v2 setIntructionLabel:*(void *)(a1 + 40)];

  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (void)clearInstructionLabel
{
  id v2 = [(VTUIEnrollTrainingIntelligentLightView *)self enrollmentViewModel];
  [v2 setIntructionLabel:&stru_26EB8DDE0];
}

- (void)setPreludeLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(VTUIEnrollTrainingIntelligentLightView *)self enrollmentViewModel];
  [v5 setPreludeLabel:v4];
}

- (void)setContinuationLabel:(id)a3
{
  id v4 = a3;
  id v5 = [(VTUIEnrollTrainingIntelligentLightView *)self enrollmentViewModel];
  [v5 setContinuationLabel:v4];
}

- (void)setContinuationAndPreludeLabelHidden:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    [(BSUICAPackageView *)self->_lightView setHidden:0];
  }
  id v5 = [(VTUIEnrollTrainingIntelligentLightView *)self enrollmentViewModel];
  [v5 setContinuationLabelHidden:v3];

  id v6 = [(VTUIEnrollTrainingIntelligentLightView *)self enrollmentViewModel];
  [v6 setPreludeLabelHidden:v3];
}

- (void)setPreludeLabelHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(VTUIEnrollTrainingIntelligentLightView *)self enrollmentViewModel];
  [v4 setPreludeLabelHidden:v3];
}

- (void)setContinuationLabelHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  if (a4)
  {
    id v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR)) {
      -[VTUIEnrollTrainingIntelligentLightView setContinuationLabelHidden:animated:](v6);
    }
  }
  v7 = [(VTUIEnrollTrainingIntelligentLightView *)self enrollmentViewModel];
  [v7 setContinuationLabelHidden:v4];
}

- (void)animateSuccessfulStepWithCompletion:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  objc_initWeak(&location, self);
  [(BSUICAPackageView *)self->_lightView setState:@"State 1" animated:1];
  dispatch_time_t v5 = dispatch_time(0, 1000000000);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __78__VTUIEnrollTrainingIntelligentLightView_animateSuccessfulStepWithCompletion___block_invoke;
  v6[3] = &unk_264D4C258;
  objc_copyWeak(&v7, &location);
  dispatch_after(v5, MEMORY[0x263EF83A0], v6);
  v4[2](v4);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __78__VTUIEnrollTrainingIntelligentLightView_animateSuccessfulStepWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained lightView];
    [v2 setState:@"State 2" animated:0];

    id WeakRetained = v3;
  }
}

- (BOOL)skipButtonHidden
{
  return self->_skipButtonHidden;
}

- (BOOL)radarButtonHidden
{
  return self->_radarButtonHidden;
}

- (SUICIntelligentLightLayer)lightLayer
{
  return self->_lightLayer;
}

- (void)setLightLayer:(id)a3
{
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (UIButton)radarExitButton
{
  return self->_radarExitButton;
}

- (VTUIEnrollTrainingViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VTUIEnrollTrainingViewDelegate *)WeakRetained;
}

- (UIButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (SiriUIContentButton)radarButton
{
  return self->_radarButton;
}

- (void)setRadarButton:(id)a3
{
}

- (VTUIPagedLabel)instructionPagedLabel
{
  return self->_instructionPagedLabel;
}

- (void)setInstructionPagedLabel:(id)a3
{
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setCaptureSession:(id)a3
{
}

- (_TtC14VoiceTriggerUI27GMEnrollmentTextViewManager)enrollmentTextViewManager
{
  return self->_enrollmentTextViewManager;
}

- (void)setEnrollmentTextViewManager:(id)a3
{
}

- (_TtC14VoiceTriggerUI21GMEnrollmentViewModel)enrollmentViewModel
{
  return self->_enrollmentViewModel;
}

- (void)setEnrollmentViewModel:(id)a3
{
}

- (BSUICAPackageView)lightView
{
  return self->_lightView;
}

- (void)setLightView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lightView, 0);
  objc_storeStrong((id *)&self->_enrollmentViewModel, 0);
  objc_storeStrong((id *)&self->_enrollmentTextViewManager, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_instructionPagedLabel, 0);
  objc_storeStrong((id *)&self->_radarButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radarExitButton, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_lightLayer, 0);
}

- (void)setContinuationLabelHidden:(os_log_t)log animated:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[VTUIEnrollTrainingIntelligentLightView setContinuationLabelHidden:animated:]";
  _os_log_error_impl(&dword_238878000, log, OS_LOG_TYPE_ERROR, "%s Hiding countinuation label with animation is not supported", (uint8_t *)&v1, 0xCu);
}

@end