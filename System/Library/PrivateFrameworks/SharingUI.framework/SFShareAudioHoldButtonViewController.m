@interface SFShareAudioHoldButtonViewController
- (NSLayoutConstraint)movieViewHeightConstraint;
- (NSLayoutConstraint)movieViewLeadingConstraint;
- (NSLayoutConstraint)movieViewTrailingConstraint;
- (SFMediaPlayerView)productMovieView;
- (UIButton)cancelButton;
- (UIImageView)shareImageView;
- (UILabel)infoLabel;
- (unsigned)colorCode;
- (unsigned)productID;
- (void)_updateDeviceVisual:(id)a3;
- (void)eventCancel:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setColorCode:(unsigned int)a3;
- (void)setInfoLabel:(id)a3;
- (void)setMovieViewHeightConstraint:(id)a3;
- (void)setMovieViewLeadingConstraint:(id)a3;
- (void)setMovieViewTrailingConstraint:(id)a3;
- (void)setProductID:(unsigned int)a3;
- (void)setProductMovieView:(id)a3;
- (void)setShareImageView:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SFShareAudioHoldButtonViewController

- (void)viewDidLoad
{
  v129[16] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F828E0]);
  [(SFShareAudioBaseViewController *)self setTitleLabel:v3];

  v4 = [(SFShareAudioBaseViewController *)self titleLabel];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  v5 = [MEMORY[0x263F825C8] whiteColor];
  v6 = [(SFShareAudioBaseViewController *)self titleLabel];
  [v6 setColor:v5];

  v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83610]];
  v8 = [(SFShareAudioBaseViewController *)self titleLabel];
  [v8 setFont:v7];

  v9 = [(SFShareAudioBaseViewController *)self titleLabel];
  [v9 setTextAlignment:1];

  v10 = [(SFShareAudioBaseViewController *)self titleLabel];
  [v10 setAdjustsFontSizeToFitWidth:1];

  v11 = [(SFShareAudioBaseViewController *)self titleLabel];
  [v11 setMinimumScaleFactor:0.5];

  v12 = [(SFShareAudioHoldButtonViewController *)self view];
  v13 = [(SFShareAudioBaseViewController *)self titleLabel];
  [v12 addSubview:v13];

  id v14 = objc_alloc_init(MEMORY[0x263F82828]);
  [(SFShareAudioHoldButtonViewController *)self setShareImageView:v14];

  v15 = [(SFShareAudioHoldButtonViewController *)self shareImageView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(SFShareAudioHoldButtonViewController *)self view];
  v17 = [(SFShareAudioHoldButtonViewController *)self shareImageView];
  [v16 addSubview:v17];

  v18 = objc_alloc_init(SFMediaPlayerView);
  [(SFShareAudioHoldButtonViewController *)self setProductMovieView:v18];

  v19 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

  v20 = [(SFShareAudioHoldButtonViewController *)self view];
  v21 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
  [v20 addSubview:v21];

  id v22 = objc_alloc_init(MEMORY[0x263F828E0]);
  [(SFShareAudioHoldButtonViewController *)self setInfoLabel:v22];

  v23 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  v24 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  [v24 setNumberOfLines:2];

  v25 = [MEMORY[0x263F825C8] whiteColor];
  v26 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  [v26 setColor:v25];

  v27 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  v28 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  [v28 setFont:v27];

  v29 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  [v29 setTextAlignment:1];

  v30 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  [v30 setAdjustsFontSizeToFitWidth:1];

  v31 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  [v31 setMinimumScaleFactor:0.5];

  v32 = [(SFShareAudioHoldButtonViewController *)self view];
  v33 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  [v32 addSubview:v33];

  v34 = [MEMORY[0x263F824E8] buttonWithType:1];
  [(SFShareAudioHoldButtonViewController *)self setCancelButton:v34];

  v35 = [MEMORY[0x263F825C8] whiteColor];
  v36 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  [v36 setTintColor:v35];

  v37 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  v38 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  v39 = [v38 titleLabel];
  [v39 setFont:v37];

  v40 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  [v40 setTranslatesAutoresizingMaskIntoConstraints:0];

  v41 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  v42 = SFLocalizedStringForKey();
  [v41 setTitle:v42 forState:0];

  v43 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  [v43 addTarget:self action:sel_eventCancel_ forControlEvents:64];

  v44 = [(SFShareAudioHoldButtonViewController *)self view];
  v45 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  [v44 addSubview:v45];

  v46 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
  v47 = [v46 leadingAnchor];
  v48 = [(SFShareAudioHoldButtonViewController *)self view];
  v49 = [v48 leadingAnchor];
  v50 = [v47 constraintEqualToAnchor:v49 constant:8.0];
  [(SFShareAudioHoldButtonViewController *)self setMovieViewLeadingConstraint:v50];

  v51 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
  v52 = [v51 trailingAnchor];
  v53 = [(SFShareAudioHoldButtonViewController *)self view];
  v54 = [v53 trailingAnchor];
  v55 = [v52 constraintEqualToAnchor:v54 constant:-8.0];
  [(SFShareAudioHoldButtonViewController *)self setMovieViewTrailingConstraint:v55];

  v56 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
  v57 = [v56 heightAnchor];
  v58 = [v57 constraintEqualToConstant:281.0];
  [(SFShareAudioHoldButtonViewController *)self setMovieViewHeightConstraint:v58];

  v100 = (void *)MEMORY[0x263F08938];
  v128 = [(SFShareAudioBaseViewController *)self titleLabel];
  v126 = [v128 leadingAnchor];
  v127 = [(SFShareAudioHoldButtonViewController *)self view];
  v125 = [v127 leadingAnchor];
  v124 = [v126 constraintEqualToAnchor:v125 constant:36.0];
  v129[0] = v124;
  v123 = [(SFShareAudioBaseViewController *)self titleLabel];
  v121 = [v123 trailingAnchor];
  v122 = [(SFShareAudioHoldButtonViewController *)self view];
  v120 = [v122 trailingAnchor];
  v119 = [v121 constraintEqualToAnchor:v120 constant:-36.0];
  v129[1] = v119;
  v118 = [(SFShareAudioBaseViewController *)self titleLabel];
  v116 = [v118 topAnchor];
  v117 = [(SFShareAudioHoldButtonViewController *)self view];
  v115 = [v117 topAnchor];
  v114 = [v116 constraintEqualToAnchor:v115 constant:36.0];
  v129[2] = v114;
  v113 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
  v111 = [v113 topAnchor];
  v112 = [(SFShareAudioBaseViewController *)self titleLabel];
  v110 = [v112 topAnchor];
  v109 = [v111 constraintEqualToAnchor:v110];
  v129[3] = v109;
  v108 = [(SFShareAudioHoldButtonViewController *)self movieViewHeightConstraint];
  v129[4] = v108;
  v107 = [(SFShareAudioHoldButtonViewController *)self movieViewLeadingConstraint];
  v129[5] = v107;
  v106 = [(SFShareAudioHoldButtonViewController *)self movieViewTrailingConstraint];
  v129[6] = v106;
  v105 = [(SFShareAudioHoldButtonViewController *)self shareImageView];
  v103 = [v105 centerXAnchor];
  v104 = [(SFShareAudioHoldButtonViewController *)self view];
  v102 = [v104 centerXAnchor];
  v101 = [v103 constraintEqualToAnchor:v102];
  v129[7] = v101;
  v99 = [(SFShareAudioHoldButtonViewController *)self shareImageView];
  v97 = [v99 topAnchor];
  v98 = [(SFShareAudioBaseViewController *)self titleLabel];
  v96 = [v98 bottomAnchor];
  v95 = [v97 constraintGreaterThanOrEqualToAnchor:v96 constant:26.0];
  v129[8] = v95;
  v94 = [(SFShareAudioHoldButtonViewController *)self shareImageView];
  v92 = [v94 bottomAnchor];
  v93 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  v91 = [v93 topAnchor];
  v90 = [v92 constraintLessThanOrEqualToAnchor:v91 constant:-16.0];
  v129[9] = v90;
  v89 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  v87 = [v89 leadingAnchor];
  v88 = [(SFShareAudioHoldButtonViewController *)self view];
  v86 = [v88 leadingAnchor];
  v85 = [v87 constraintGreaterThanOrEqualToAnchor:v86 constant:16.0];
  v129[10] = v85;
  v84 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  v82 = [v84 trailingAnchor];
  v83 = [(SFShareAudioHoldButtonViewController *)self view];
  v81 = [v83 trailingAnchor];
  v80 = [v82 constraintLessThanOrEqualToAnchor:v81 constant:-16.0];
  v129[11] = v80;
  v79 = [(SFShareAudioHoldButtonViewController *)self infoLabel];
  v77 = [v79 bottomAnchor];
  v78 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  v76 = [v78 topAnchor];
  v75 = [v77 constraintEqualToAnchor:v76 constant:-26.0];
  v129[12] = v75;
  v74 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  v72 = [v74 leadingAnchor];
  v73 = [(SFShareAudioHoldButtonViewController *)self view];
  v71 = [v73 leadingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71 constant:36.0];
  v129[13] = v70;
  v69 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  v59 = [v69 trailingAnchor];
  v60 = [(SFShareAudioHoldButtonViewController *)self view];
  v61 = [v60 trailingAnchor];
  v62 = [v59 constraintEqualToAnchor:v61 constant:-36.0];
  v129[14] = v62;
  v63 = [(SFShareAudioHoldButtonViewController *)self cancelButton];
  v64 = [v63 bottomAnchor];
  v65 = [(SFShareAudioHoldButtonViewController *)self view];
  v66 = [v65 bottomAnchor];
  v67 = [v64 constraintEqualToAnchor:v66 constant:-21.0];
  v129[15] = v67;
  v68 = [MEMORY[0x263EFF8C0] arrayWithObjects:v129 count:16];
  [v100 activateConstraints:v68];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v52[1] = *MEMORY[0x263EF8340];
  p_inst_props = &OBJC_PROTOCOL___SFAirDropActivityViewControllerDelegate.inst_props;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v49.receiver = self;
  v49.super_class = (Class)SFShareAudioHoldButtonViewController;
  [(SFShareAudioBaseViewController *)&v49 viewWillAppear:v3];
  v6 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
  v7 = (void *)[objc_alloc(MEMORY[0x263F6C278]) initWithProductID:self->_colorCode];
  v8 = [MEMORY[0x263F6C278] airPodsMax];

  if (v7 == v8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"Localizable-PID_%d", self->_colorCode);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v14 = (void *)MEMORY[0x263F08938];
    v15 = [(SFShareAudioHoldButtonViewController *)self movieViewHeightConstraint];
    v52[0] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:1];
    [v14 deactivateConstraints:v16];

    v17 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
    v18 = [v17 heightAnchor];
    v19 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
    v20 = [v19 widthAnchor];
    v21 = [v18 constraintEqualToAnchor:v20 multiplier:0.9375];
    [(SFShareAudioHoldButtonViewController *)self setMovieViewHeightConstraint:v21];

    id v22 = (void *)MEMORY[0x263F08938];
    v23 = [(SFShareAudioHoldButtonViewController *)self movieViewHeightConstraint];
    v51 = v23;
    v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v51 count:1];
    [v22 activateConstraints:v24];

    v25 = [(SFShareAudioHoldButtonViewController *)self movieViewLeadingConstraint];
    [v25 setConstant:0.0];

    v26 = [(SFShareAudioHoldButtonViewController *)self movieViewTrailingConstraint];
    [v26 setConstant:0.0];

    v27 = [(SFShareAudioHoldButtonViewController *)self view];
    [v27 layoutIfNeeded];

    id v28 = objc_alloc_init(MEMORY[0x263F82E00]);
    v29 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
    [v29 bounds];
    objc_msgSend(v28, "setFrame:");

    id v30 = objc_alloc_init(MEMORY[0x263F157D0]);
    [v28 bounds];
    objc_msgSend(v30, "setFrame:");
    [v30 setLocations:&unk_26CE7E2F0];
    id v31 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.0];
    uint64_t v32 = [v31 CGColor];

    v50[0] = v32;
    id v33 = [MEMORY[0x263F825C8] whiteColor];
    v50[1] = [v33 CGColor];
    id v34 = [MEMORY[0x263F825C8] whiteColor];
    v50[2] = [v34 CGColor];
    v50[3] = v32;
    v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:v50 count:4];
    [v30 setColors:v35];

    p_inst_props = (__objc2_prop_list **)(&OBJC_PROTOCOL___SFAirDropActivityViewControllerDelegate + 56);
    v36 = [v28 layer];
    [v36 addSublayer:v30];

    v37 = [(SFShareAudioHoldButtonViewController *)self productMovieView];
    [v37 setMaskView:v28];

LABEL_12:
    goto LABEL_13;
  }
  uint64_t v9 = [MEMORY[0x263F6C278] b768e];
  if (v7 == (void *)v9)
  {
    id v28 = v7;
    v13 = @"Localizable-PID_8219";
    goto LABEL_12;
  }
  v10 = (void *)v9;
  v11 = [MEMORY[0x263F6C278] b768m];

  if (v7 == v11)
  {
    v13 = @"Localizable-PID_8219";
  }
  else
  {
    uint64_t colorCode = self->_colorCode;
    if (colorCode == 8203) {
      goto LABEL_9;
    }
    v41 = (void *)[objc_alloc(MEMORY[0x263F6C278]) initWithProductID:colorCode];
    if (v41)
    {
      v42 = v41;
      uint64_t v43 = [v41 buttonLocation];

      if (!v43) {
        goto LABEL_9;
      }
    }
    uint64_t v44 = self->_colorCode;
    v13 = @"Localizable-ShareAudio";
    if (((v44 - 8194) > 0xD || ((1 << (v44 - 2)) & 0x3001) == 0) && v44 != 0x10000)
    {
      v45 = (void *)[objc_alloc(MEMORY[0x263F6C278]) initWithProductID:v44];
      [v45 isAirPods];

LABEL_9:
      v13 = @"Localizable-ShareAudio";
    }
  }
LABEL_13:
  v38 = SFLocalizedStringEx();
  [(UILabel *)self->_infoLabel setText:v38];

  v39 = SFLocalizedStringEx();
  [(UILabel *)self->super._titleLabel setText:v39];

  if (self->_colorCode)
  {
    int v40 = *((_DWORD *)p_inst_props + 202);
    if (v40 <= 30 && (v40 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v46 = objc_alloc_init(MEMORY[0x263F6C1F8]);
    [v46 setBluetoothProductID:LOWORD(self->_colorCode)];
    [v46 setColorCode:*((unsigned int *)&self->super._viewActive + 1)];
    [v46 setTimeoutSeconds:5.0];
    id v47 = objc_alloc_init(MEMORY[0x263F6C1F0]);
    v48[0] = MEMORY[0x263EF8330];
    v48[1] = 3221225472;
    v48[2] = __55__SFShareAudioHoldButtonViewController_viewWillAppear___block_invoke;
    v48[3] = &unk_264472DA0;
    v48[4] = v47;
    v48[5] = self;
    [v47 getDeviceAssets:v46 completion:v48];
  }
  else
  {
    [(SFShareAudioHoldButtonViewController *)self _updateDeviceVisual:0];
  }
}

void __55__SFShareAudioHoldButtonViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  [*(id *)(a1 + 32) invalidate];
  BOOL v3 = *(unsigned char **)(a1 + 40);
  if (v3[1000])
  {
    v4 = [v5 assetBundlePath];
    [v3 _updateDeviceVisual:v4];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v5.receiver = self;
  v5.super_class = (Class)SFShareAudioHoldButtonViewController;
  [(SFShareAudioBaseViewController *)&v5 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFShareAudioHoldButtonViewController;
  [(SFShareAudioHoldButtonViewController *)&v4 viewDidDisappear:a3];
  [(SFMediaPlayerView *)self->_productMovieView stop];
}

- (void)eventCancel:(id)a3
{
  id v4 = a3;
  if (gLogCategory_SFShareAudioViewController <= 30
    && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(SFShareAudioViewController *)self->super._mainController reportUserCancelled];
}

- (void)_updateDeviceVisual:(id)a3
{
  id v4 = a3;
  id v12 = v4;
  if (v4)
  {
    objc_super v5 = [MEMORY[0x263F086E0] bundleWithPath:v4];
  }
  else
  {
    objc_super v5 = 0;
  }
  v6 = [v5 pathForResource:*MEMORY[0x263F6C338] ofType:0];
  if (v6)
  {
    v7 = [v5 URLForResource:*MEMORY[0x263F6C318] withExtension:0];
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      v11 = v6;
      LogPrintF();
    }
    -[SFMediaPlayerView startMovieLoopWithPath:assetType:adjustmentsURL:](self->_productMovieView, "startMovieLoopWithPath:assetType:adjustmentsURL:", v6, 1, v7, v11);
    [(SFMediaPlayerView *)self->_productMovieView setHidden:0];
  }
  else
  {
    if (gLogCategory_SFShareAudioViewController <= 30
      && (gLogCategory_SFShareAudioViewController != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v8 = (void *)MEMORY[0x263F827E8];
    uint64_t v9 = [(SFShareAudioViewController *)self->super._mainController mainBundle];
    v10 = [v8 imageNamed:@"ShareAudioAirPods" inBundle:v9 compatibleWithTraitCollection:0];
    [(UIImageView *)self->_shareImageView setImage:v10];

    [(UIImageView *)self->_shareImageView setHidden:0];
  }
}

- (SFMediaPlayerView)productMovieView
{
  return self->_productMovieView;
}

- (void)setProductMovieView:(id)a3
{
}

- (UIImageView)shareImageView
{
  return self->_shareImageView;
}

- (void)setShareImageView:(id)a3
{
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (NSLayoutConstraint)movieViewLeadingConstraint
{
  return self->_movieViewLeadingConstraint;
}

- (void)setMovieViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)movieViewTrailingConstraint
{
  return self->_movieViewTrailingConstraint;
}

- (void)setMovieViewTrailingConstraint:(id)a3
{
}

- (NSLayoutConstraint)movieViewHeightConstraint
{
  return self->_movieViewHeightConstraint;
}

- (void)setMovieViewHeightConstraint:(id)a3
{
}

- (unsigned)colorCode
{
  return *((_DWORD *)&self->super._viewActive + 1);
}

- (void)setColorCode:(unsigned int)a3
{
  *((_DWORD *)&self->super._viewActive + 1) = a3;
}

- (unsigned)productID
{
  return self->_colorCode;
}

- (void)setProductID:(unsigned int)a3
{
  self->_uint64_t colorCode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movieViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_movieViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_movieViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_shareImageView, 0);
  objc_storeStrong((id *)&self->_productMovieView, 0);
}

@end