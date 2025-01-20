@interface VTUIEnrollTrainingView
- (BOOL)checkMarkViewHidden;
- (BOOL)radarButtonHidden;
- (BOOL)skipButtonHidden;
- (SUICOrbView)orbView;
- (SiriUIContentButton)radarButton;
- (UIButton)radarExitButton;
- (UIButton)skipButton;
- (UILabel)instructionContinuationLabel;
- (UILabel)instructionPreludeLabel;
- (UILabel)statusLabel;
- (VTUICheckMarkView)checkMark;
- (VTUIEnrollTrainingView)initWithFrame:(CGRect)a3;
- (VTUIEnrollTrainingViewDelegate)delegate;
- (VTUIPagedLabel)instructionPagedLabel;
- (void)_setupUI;
- (void)clearInstructionLabel;
- (void)dealloc;
- (void)setCheckMark:(id)a3;
- (void)setCheckMarkViewHidden:(BOOL)a3;
- (void)setContinuationAndPreludeLabelHidden:(BOOL)a3;
- (void)setContinuationLabelHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)setInstructionPagedLabel:(id)a3;
- (void)setPreludeLabelHidden:(BOOL)a3;
- (void)setRadarButton:(id)a3;
- (void)setRadarButtonHidden:(BOOL)a3;
- (void)setSkipButton:(id)a3;
- (void)setSkipButtonHidden:(BOOL)a3;
- (void)showRadarExitButton:(id)a3;
- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5;
- (void)startCheckMarkAnimation:(BOOL)a3 completion:(id)a4;
@end

@implementation VTUIEnrollTrainingView

- (VTUIEnrollTrainingView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingView;
  v3 = -[VTUIEnrollTrainingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(VTUIEnrollTrainingView *)v3 _setupUI];
  }
  return v4;
}

- (void)_setupUI
{
  v121[4] = *MEMORY[0x263EF8340];
  v3 = +[VTUIStyle sharedStyle];
  v115 = [(VTUIEnrollTrainingView *)self readableContentGuide];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  [(VTUIEnrollTrainingView *)self setBackgroundColor:v4];

  id v5 = objc_alloc(MEMORY[0x263F75438]);
  [v3 orbLength];
  double v7 = v6;
  [v3 orbLength];
  v9 = (SUICOrbView *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7, v8);
  orbView = self->_orbView;
  self->_orbView = v9;

  [(SUICOrbView *)self->_orbView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIEnrollTrainingView *)self addSubview:self->_orbView];
  v11 = objc_alloc_init(VTUICheckMarkView);
  checkMark = self->_checkMark;
  self->_checkMark = v11;

  [(VTUICheckMarkView *)self->_checkMark setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIEnrollTrainingView *)self addSubview:self->_checkMark];
  id v13 = objc_alloc(MEMORY[0x263F82BF8]);
  v14 = objc_msgSend(v13, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v14 setAxis:1];
  [v14 setSpacing:28.0];
  v15 = v14;
  [(VTUIEnrollTrainingView *)self addSubview:v14];
  v16 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  instructionPreludeLabel = self->_instructionPreludeLabel;
  self->_instructionPreludeLabel = v16;

  [(UILabel *)self->_instructionPreludeLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_instructionPreludeLabel setTextAlignment:1];
  v18 = [v3 instructionPreAndPostfixFont];
  [(UILabel *)self->_instructionPreludeLabel setFont:v18];

  [(UILabel *)self->_instructionPreludeLabel setNumberOfLines:4];
  v19 = [v3 VTUIDeviceSpecificString:@"TEXT_LABEL_SAY_FIRST"];
  [(UILabel *)self->_instructionPreludeLabel setText:v19];

  [v15 addArrangedSubview:self->_instructionPreludeLabel];
  [v15 setCustomSpacing:self->_instructionPreludeLabel afterView:10.0];
  v20 = [VTUIPagedLabel alloc];
  [(VTUIEnrollTrainingView *)self frame];
  v21 = -[VTUIPagedLabel initWithFrame:isProximity:forEnrollmentStyle:](v20, "initWithFrame:isProximity:forEnrollmentStyle:", 0, 0);
  instructionPagedLabel = self->_instructionPagedLabel;
  self->_instructionPagedLabel = v21;

  [(VTUIPagedLabel *)self->_instructionPagedLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  v113 = v15;
  [v15 addArrangedSubview:self->_instructionPagedLabel];
  v23 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  instructionContinuationLabel = self->_instructionContinuationLabel;
  self->_instructionContinuationLabel = v23;

  [(UILabel *)self->_instructionContinuationLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_instructionContinuationLabel setTextAlignment:1];
  v25 = [v3 instructionPreAndPostfixFont];
  [(UILabel *)self->_instructionContinuationLabel setFont:v25];

  [(UILabel *)self->_instructionContinuationLabel setNumberOfLines:4];
  v26 = [v3 VTUIDeviceSpecificString:@"TEXT_LABEL_TO_FIRST"];
  [(UILabel *)self->_instructionContinuationLabel setText:v26];

  [v15 addArrangedSubview:self->_instructionContinuationLabel];
  v27 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
  statusLabel = self->_statusLabel;
  self->_statusLabel = v27;

  [(UILabel *)self->_statusLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_statusLabel setTextAlignment:1];
  v29 = v3;
  v30 = [v3 instructionLabelFont];
  [(UILabel *)self->_statusLabel setFont:v30];

  [(UILabel *)self->_statusLabel setNumberOfLines:4];
  [(VTUIEnrollTrainingView *)self addSubview:self->_statusLabel];
  v31 = +[VTUIButton _vtuiButtonWithSecondaryStyle];
  skipButton = self->_skipButton;
  self->_skipButton = v31;

  [(UIButton *)self->_skipButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = self->_skipButton;
  v34 = [v3 VTUIDeviceSpecificString:@"BUTTON_SET_UP_LATER"];
  [(UIButton *)v33 setTitle:v34 forState:0];

  [(VTUIEnrollTrainingView *)self addSubview:self->_skipButton];
  v97 = (void *)MEMORY[0x263F08938];
  v100 = [(SUICOrbView *)self->_orbView topAnchor];
  v103 = [(VTUIEnrollTrainingView *)self safeAreaLayoutGuide];
  v99 = [v103 topAnchor];
  [v3 orbOffsetFromTopTraining];
  v98 = objc_msgSend(v100, "constraintEqualToAnchor:constant:", v99);
  v121[0] = v98;
  v35 = [(SUICOrbView *)self->_orbView centerXAnchor];
  v36 = [(VTUIEnrollTrainingView *)self centerXAnchor];
  v37 = [v35 constraintEqualToAnchor:v36];
  v121[1] = v37;
  v38 = [(SUICOrbView *)self->_orbView widthAnchor];
  v114 = v3;
  [v3 orbLength];
  v39 = objc_msgSend(v38, "constraintEqualToConstant:");
  v121[2] = v39;
  v40 = [(SUICOrbView *)self->_orbView heightAnchor];
  [v29 orbLength];
  v41 = objc_msgSend(v40, "constraintEqualToConstant:");
  v121[3] = v41;
  v42 = [MEMORY[0x263EFF8C0] arrayWithObjects:v121 count:4];
  [v97 activateConstraints:v42];

  v43 = (void *)MEMORY[0x263F08938];
  v44 = [(VTUICheckMarkView *)self->_checkMark centerXAnchor];
  v45 = [(SUICOrbView *)self->_orbView centerXAnchor];
  v46 = [v44 constraintEqualToAnchor:v45];
  v120[0] = v46;
  v47 = [(VTUICheckMarkView *)self->_checkMark centerYAnchor];
  v48 = [(SUICOrbView *)self->_orbView centerYAnchor];
  v49 = [v47 constraintEqualToAnchor:v48];
  v120[1] = v49;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v120 count:2];
  [v43 activateConstraints:v50];

  v101 = (void *)MEMORY[0x263F08938];
  v109 = [v113 topAnchor];
  v104 = [(SUICOrbView *)self->_orbView bottomAnchor];
  v51 = [v109 constraintEqualToAnchor:v104];
  v119[0] = v51;
  v52 = [v113 leadingAnchor];
  v53 = [v115 leadingAnchor];
  v54 = [v52 constraintEqualToAnchor:v53];
  v119[1] = v54;
  v55 = [v113 trailingAnchor];
  v56 = [v115 trailingAnchor];
  v57 = [v55 constraintEqualToAnchor:v56];
  v119[2] = v57;
  v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v119 count:3];
  [v101 activateConstraints:v58];

  LODWORD(v59) = 1148846080;
  [v113 setContentHuggingPriority:1 forAxis:v59];
  v102 = (void *)MEMORY[0x263F08938];
  v110 = [(UILabel *)self->_statusLabel topAnchor];
  v105 = [v113 topAnchor];
  v60 = [v110 constraintEqualToAnchor:v105];
  v118[0] = v60;
  v61 = [(UILabel *)self->_statusLabel leadingAnchor];
  v62 = [v115 leadingAnchor];
  v63 = [v61 constraintEqualToAnchor:v62];
  v118[1] = v63;
  v64 = [(UILabel *)self->_statusLabel trailingAnchor];
  v65 = [v115 trailingAnchor];
  v66 = [v64 constraintEqualToAnchor:v65];
  v118[2] = v66;
  v67 = [MEMORY[0x263EFF8C0] arrayWithObjects:v118 count:3];
  [v102 activateConstraints:v67];

  v106 = (void *)MEMORY[0x263F08938];
  v111 = [(UIButton *)self->_skipButton leftAnchor];
  v107 = [v115 leftAnchor];
  v68 = [v111 constraintEqualToAnchor:v107];
  v117[0] = v68;
  v69 = [(UIButton *)self->_skipButton rightAnchor];
  v70 = [v115 rightAnchor];
  v71 = [v69 constraintEqualToAnchor:v70];
  v117[1] = v71;
  v72 = [(UIButton *)self->_skipButton bottomAnchor];
  v73 = [(VTUIEnrollTrainingView *)self safeAreaLayoutGuide];
  v74 = [v73 bottomAnchor];
  [v114 footerSkipButtonBaselineFromBottom];
  v76 = [v72 constraintEqualToAnchor:v74 constant:-v75];
  v117[2] = v76;
  v77 = [MEMORY[0x263EFF8C0] arrayWithObjects:v117 count:3];
  [v106 activateConstraints:v77];

  v78 = [MEMORY[0x263F086E0] bundleWithPath:@"/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"];
  if (v78)
  {
    v79 = [MEMORY[0x263F827E8] imageNamed:@"radarBug" inBundle:v78 compatibleWithTraitCollection:0];
    v112 = [v79 imageWithRenderingMode:2];

    v80 = [MEMORY[0x263F753A8] buttonWithImageTemplate:v112 style:0];
    radarButton = self->_radarButton;
    self->_radarButton = v80;

    [(SiriUIContentButton *)self->_radarButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v82 = [MEMORY[0x263F825C8] blackColor];
    v83 = [v82 colorWithAlphaComponent:0.6];
    [(SiriUIContentButton *)self->_radarButton setDefaultColorForTemplate:v83];

    v84 = [MEMORY[0x263F825C8] blackColor];
    v85 = [v84 colorWithAlphaComponent:0.2];
    [(SiriUIContentButton *)self->_radarButton setHighlightColorForTemplate:v85];

    [(VTUIEnrollTrainingView *)self setRadarButtonHidden:0];
    [(VTUIEnrollTrainingView *)self addSubview:self->_radarButton];
    v108 = (void *)MEMORY[0x263F08938];
    v86 = [(SiriUIContentButton *)self->_radarButton trailingAnchor];
    v87 = [(VTUIEnrollTrainingView *)self safeAreaLayoutGuide];
    v88 = [v87 trailingAnchor];
    [v114 radarBtnHorizontalPadding];
    v90 = [v86 constraintEqualToAnchor:v88 constant:-v89];
    v116[0] = v90;
    v91 = [(SiriUIContentButton *)self->_radarButton bottomAnchor];
    v92 = [(VTUIEnrollTrainingView *)self safeAreaLayoutGuide];
    v93 = [v92 bottomAnchor];
    [v114 radarBtnVerticalPadding];
    v95 = [v91 constraintEqualToAnchor:v93 constant:-v94];
    v116[1] = v95;
    v96 = [MEMORY[0x263EFF8C0] arrayWithObjects:v116 count:2];
    [v108 activateConstraints:v96];
  }
}

- (void)dealloc
{
  [(SUICOrbView *)self->_orbView invalidate];
  v3.receiver = self;
  v3.super_class = (Class)VTUIEnrollTrainingView;
  [(VTUIEnrollTrainingView *)&v3 dealloc];
}

- (void)showRadarExitButton:(id)a3
{
  v25[3] = *MEMORY[0x263EF8340];
  v4 = (void *)MEMORY[0x263F824E8];
  id v5 = a3;
  double v6 = [v4 buttonWithType:0];
  radarExitButton = self->_radarExitButton;
  self->_radarExitButton = v6;

  [(SiriUIContentButton *)self->_radarButton setTranslatesAutoresizingMaskIntoConstraints:0];
  double v8 = [(UIButton *)self->_radarExitButton titleLabel];
  [v8 setTextAlignment:1];

  [(UIButton *)self->_radarExitButton setTitle:v5 forState:0];
  v9 = self->_radarExitButton;
  v10 = [MEMORY[0x263F825C8] systemBlueColor];
  [(UIButton *)v9 setTitleColor:v10 forState:0];

  [(VTUIEnrollTrainingView *)self addSubview:self->_radarExitButton];
  v21 = (void *)MEMORY[0x263F08938];
  v23 = [(UIButton *)self->_radarExitButton leftAnchor];
  v24 = [(VTUIEnrollTrainingView *)self readableContentGuide];
  v22 = [v24 leftAnchor];
  v11 = [v23 constraintEqualToAnchor:v22];
  v25[0] = v11;
  v12 = [(UIButton *)self->_radarExitButton rightAnchor];
  id v13 = [(VTUIEnrollTrainingView *)self readableContentGuide];
  v14 = [v13 rightAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v25[1] = v15;
  v16 = [(UIButton *)self->_radarExitButton bottomAnchor];
  v17 = [(VTUIEnrollTrainingView *)self safeAreaLayoutGuide];
  v18 = [v17 bottomAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  v25[2] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v25 count:3];
  [v21 activateConstraints:v20];
}

- (void)startCheckMarkAnimation:(BOOL)a3 completion:(id)a4
{
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

- (void)setCheckMarkViewHidden:(BOOL)a3
{
}

- (void)setRadarButtonHidden:(BOOL)a3
{
}

- (void)slideInText:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
}

- (void)clearInstructionLabel
{
}

- (void)setContinuationAndPreludeLabelHidden:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = 1.0;
  if (a3) {
    double v5 = 0.0;
  }
  [(UILabel *)self->_instructionPreludeLabel setAlpha:v5];
  [(VTUIEnrollTrainingView *)self setContinuationLabelHidden:v3 animated:0];
}

- (void)setPreludeLabelHidden:(BOOL)a3
{
  double v3 = 1.0;
  if (a3) {
    double v3 = 0.0;
  }
  [(UILabel *)self->_instructionPreludeLabel setAlpha:v3];
}

- (void)setContinuationLabelHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (a3) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  instructionContinuationLabel = self->_instructionContinuationLabel;
  if (a4)
  {
    BOOL v7 = a3;
    int v8 = [(UILabel *)instructionContinuationLabel isHidden];
    if (v7)
    {
      if (v8) {
        return;
      }
    }
    else if (!v8)
    {
      return;
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__VTUIEnrollTrainingView_setContinuationLabelHidden_animated___block_invoke;
    v9[3] = &unk_264D4C9C8;
    v9[4] = self;
    *(double *)&v9[5] = v5;
    [MEMORY[0x263F82E00] animateWithDuration:0 delay:v9 options:&__block_literal_global_3 animations:0.3 completion:0.0];
    return;
  }
  [(UILabel *)instructionContinuationLabel setAlpha:v5];
}

uint64_t __62__VTUIEnrollTrainingView_setContinuationLabelHidden_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:*(double *)(a1 + 40)];
}

- (BOOL)skipButtonHidden
{
  return self->_skipButtonHidden;
}

- (BOOL)checkMarkViewHidden
{
  return self->_checkMarkViewHidden;
}

- (BOOL)radarButtonHidden
{
  return self->_radarButtonHidden;
}

- (SUICOrbView)orbView
{
  return self->_orbView;
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (UILabel)instructionPreludeLabel
{
  return self->_instructionPreludeLabel;
}

- (UILabel)instructionContinuationLabel
{
  return self->_instructionContinuationLabel;
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

- (VTUICheckMarkView)checkMark
{
  return self->_checkMark;
}

- (void)setCheckMark:(id)a3
{
}

- (VTUIPagedLabel)instructionPagedLabel
{
  return self->_instructionPagedLabel;
}

- (void)setInstructionPagedLabel:(id)a3
{
}

- (SiriUIContentButton)radarButton
{
  return self->_radarButton;
}

- (void)setRadarButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_radarButton, 0);
  objc_storeStrong((id *)&self->_instructionPagedLabel, 0);
  objc_storeStrong((id *)&self->_checkMark, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_radarExitButton, 0);
  objc_storeStrong((id *)&self->_instructionContinuationLabel, 0);
  objc_storeStrong((id *)&self->_instructionPreludeLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_orbView, 0);
}

@end