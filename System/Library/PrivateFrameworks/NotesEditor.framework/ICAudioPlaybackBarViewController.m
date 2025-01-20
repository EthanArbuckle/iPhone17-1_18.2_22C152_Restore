@interface ICAudioPlaybackBarViewController
- (BOOL)isRegularHorizontalLayout;
- (ICAttachment)audioAttachment;
- (ICAudioPlayPauseView)playPauseView;
- (ICAudioPlaybackBarViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (ICAudioPlaybackScrubberView)scrubberView;
- (ICMediaTimeLabel)leadingTimeLabel;
- (ICMediaTimeLabel)trailingTimeLabel;
- (NSLayoutConstraint)scrubberLeftConstraint;
- (NSLayoutConstraint)scrubberRightConstraint;
- (NSLayoutConstraint)skipBackwardLeftConstraint;
- (NSLayoutConstraint)skipBackwardRightConstraint;
- (NSLayoutConstraint)skipForwardRightConstraint;
- (NSLayoutConstraint)trailingTimeWidthConstraint;
- (UIButton)skipBackwardButton;
- (UIButton)skipForwardButton;
- (UILabel)creationDateLabel;
- (void)attachmentWillBeDeletedNotification:(id)a3;
- (void)audioPlaybackTimeChangedNotification:(id)a3;
- (void)dealloc;
- (void)done:(id)a3;
- (void)noteWillBeDeletedNotification:(id)a3;
- (void)refreshTime:(id)a3;
- (void)registerForNotifications;
- (void)registerForTraitChanges;
- (void)scrubberValueChangedAction:(id)a3;
- (void)setAudioAttachment:(id)a3;
- (void)setCreationDateLabel:(id)a3;
- (void)setLeadingTimeLabel:(id)a3;
- (void)setPlayPauseView:(id)a3;
- (void)setScrubberLeftConstraint:(id)a3;
- (void)setScrubberRightConstraint:(id)a3;
- (void)setScrubberView:(id)a3;
- (void)setSkipBackwardButton:(id)a3;
- (void)setSkipBackwardLeftConstraint:(id)a3;
- (void)setSkipBackwardRightConstraint:(id)a3;
- (void)setSkipForwardButton:(id)a3;
- (void)setSkipForwardRightConstraint:(id)a3;
- (void)setTrailingTimeLabel:(id)a3;
- (void)setTrailingTimeWidthConstraint:(id)a3;
- (void)updateLayout;
- (void)updateMediaTimeAccessibilityLabels;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ICAudioPlaybackBarViewController

- (void)registerForNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_refreshTime_ name:*MEMORY[0x263EFF458] object:0];
  [v3 addObserver:self selector:sel_refreshTime_ name:*MEMORY[0x263F83390] object:0];
}

- (void)refreshTime:(id)a3
{
  v5 = [(ICAudioPlaybackBarViewController *)self audioAttachment];
  id v9 = [v5 attachmentModel];

  int v6 = [v9 recordedInNotes];
  if (v6)
  {
    v5 = [(ICAudioPlaybackBarViewController *)self audioAttachment];
    id v3 = [v5 creationDate];
    objc_msgSend(v3, "ic_shortFormattedDate");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = &stru_26C10E100;
  }
  v8 = [(ICAudioPlaybackBarViewController *)self creationDateLabel];
  [v8 setText:v7];

  if (v6)
  {
  }
}

- (ICAudioPlaybackBarViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v196.receiver = self;
  v196.super_class = (Class)ICAudioPlaybackBarViewController;
  v4 = [(ICAudioBarViewController *)&v196 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    [(ICAudioPlaybackBarViewController *)v4 registerForNotifications];
    [(ICAudioPlaybackBarViewController *)v5 registerForTraitChanges];
    int v6 = objc_msgSend(MEMORY[0x263F82670], "ic_isVision");
    double v7 = 54.0;
    if (v6) {
      double v7 = 70.0;
    }
    [(ICAudioBarViewController *)v5 setHeight:v7];
    id v8 = objc_alloc(MEMORY[0x263F5B248]);
    double v9 = *MEMORY[0x263F001A8];
    double v10 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v11 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 24);
    v13 = objc_msgSend(v8, "initWithFrame:", *MEMORY[0x263F001A8], v10, v11, v12);
    [(ICAudioPlaybackBarViewController *)v5 setPlayPauseView:v13];

    v14 = [(ICAudioPlaybackBarViewController *)v5 playPauseView];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = [(ICAudioPlaybackBarViewController *)v5 view];
    v16 = [(ICAudioPlaybackBarViewController *)v5 playPauseView];
    [v15 addSubview:v16];

    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
    {
      v17 = [(ICAudioPlaybackBarViewController *)v5 playPauseView];
      v18 = [v17 leadingAnchor];
      v19 = [(ICAudioPlaybackBarViewController *)v5 view];
      v20 = [v19 leadingAnchor];
      v21 = [v18 constraintEqualToAnchor:v20 constant:12.0];
      [v21 setActive:1];
    }
    else
    {
      v17 = [(ICAudioPlaybackBarViewController *)v5 view];
      v22 = (void *)MEMORY[0x263F08938];
      v18 = [(ICAudioPlaybackBarViewController *)v5 playPauseView];
      v19 = [(ICAudioPlaybackBarViewController *)v5 view];
      v20 = [v22 constraintWithItem:v18 attribute:5 relatedBy:0 toItem:v19 attribute:17 multiplier:1.0 constant:0.0];
      [v17 addConstraint:v20];
    }

    v23 = [(ICAudioPlaybackBarViewController *)v5 view];
    v24 = (void *)MEMORY[0x263F08938];
    v25 = [(ICAudioPlaybackBarViewController *)v5 playPauseView];
    v26 = [(ICAudioPlaybackBarViewController *)v5 view];
    v27 = [v24 constraintWithItem:v25 attribute:10 relatedBy:0 toItem:v26 attribute:10 multiplier:1.0 constant:0.0];
    [v23 addConstraint:v27];

    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
    {
      v28 = [(ICAudioPlaybackBarViewController *)v5 playPauseView];
      v29 = [v28 widthAnchor];
      v30 = [(ICAudioPlaybackBarViewController *)v5 playPauseView];
      v31 = [v30 heightAnchor];
      v32 = [v29 constraintEqualToAnchor:v31];
      [v32 setActive:1];

      v33 = [(ICAudioPlaybackBarViewController *)v5 playPauseView];
      v34 = [v33 widthAnchor];
      v35 = [v34 constraintEqualToConstant:44.0];
      [v35 setActive:1];
    }
    v36 = -[ICAudioPlaybackScrubberView initWithFrame:]([ICAudioPlaybackScrubberView alloc], "initWithFrame:", v9, v10, v11, v12);
    [(ICAudioPlaybackBarViewController *)v5 setScrubberView:v36];

    v37 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

    v38 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    [v38 addTarget:v5 action:sel_scrubberValueChangedAction_ forControlEvents:4096];

    v39 = [(ICAudioPlaybackBarViewController *)v5 view];
    v40 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    [v39 addSubview:v40];

    v41 = (void *)MEMORY[0x263F08938];
    v42 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    v43 = [(ICAudioPlaybackBarViewController *)v5 view];
    v44 = [v43 safeAreaLayoutGuide];
    v45 = [v41 constraintWithItem:v42 attribute:1 relatedBy:0 toItem:v44 attribute:1 multiplier:1.0 constant:0.0];
    [(ICAudioPlaybackBarViewController *)v5 setScrubberLeftConstraint:v45];

    v46 = [(ICAudioPlaybackBarViewController *)v5 view];
    v47 = [(ICAudioPlaybackBarViewController *)v5 scrubberLeftConstraint];
    [v46 addConstraint:v47];

    v48 = (void *)MEMORY[0x263F08938];
    v49 = [(ICAudioPlaybackBarViewController *)v5 view];
    v50 = [v49 safeAreaLayoutGuide];
    v51 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    v52 = [v48 constraintWithItem:v50 attribute:2 relatedBy:0 toItem:v51 attribute:2 multiplier:1.0 constant:0.0];
    [(ICAudioPlaybackBarViewController *)v5 setScrubberRightConstraint:v52];

    v53 = [(ICAudioPlaybackBarViewController *)v5 view];
    v54 = [(ICAudioPlaybackBarViewController *)v5 scrubberRightConstraint];
    [v53 addConstraint:v54];

    v55 = [(ICAudioPlaybackBarViewController *)v5 view];
    v56 = (void *)MEMORY[0x263F08938];
    v57 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    v58 = [(ICAudioPlaybackBarViewController *)v5 view];
    v59 = [v56 constraintWithItem:v57 attribute:10 relatedBy:0 toItem:v58 attribute:10 multiplier:1.0 constant:0.0];
    [v55 addConstraint:v59];

    id v60 = objc_alloc_init(MEMORY[0x263F5B3D0]);
    [(ICAudioPlaybackBarViewController *)v5 setLeadingTimeLabel:v60];

    v61 = (void *)[objc_alloc(MEMORY[0x263F5B3C8]) initWithSeconds:0.0];
    v62 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    [v62 setMediaTimeValue:v61];

    v63 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    [v63 setTextAlignment:2];

    v64 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorSecondaryLabelColor");
    v65 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    [v65 setTextColor:v64];

    uint64_t v66 = *MEMORY[0x263F83588];
    uint64_t v67 = *MEMORY[0x263F83470];
    uint64_t v195 = *MEMORY[0x263F83588];
    v68 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForTextStyle:maxContentSizeCategory:", *MEMORY[0x263F83588], *MEMORY[0x263F83470]);
    v69 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    [v69 setFont:v68];

    v70 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    [v70 setTranslatesAutoresizingMaskIntoConstraints:0];

    v71 = [(ICAudioPlaybackBarViewController *)v5 view];
    v72 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    [v71 addSubview:v72];

    v73 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    v74 = (void *)MEMORY[0x263F08938];
    v75 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    v76 = [v74 constraintWithItem:v75 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:40.0];
    [v73 addConstraint:v76];

    v77 = [(ICAudioPlaybackBarViewController *)v5 view];
    v78 = (void *)MEMORY[0x263F08938];
    v79 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    v80 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    v81 = [v78 constraintWithItem:v79 attribute:1 relatedBy:0 toItem:v80 attribute:2 multiplier:1.0 constant:10.0];
    [v77 addConstraint:v81];

    v82 = [(ICAudioPlaybackBarViewController *)v5 view];
    v83 = (void *)MEMORY[0x263F08938];
    v84 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    v85 = [(ICAudioPlaybackBarViewController *)v5 view];
    v86 = [v83 constraintWithItem:v84 attribute:10 relatedBy:0 toItem:v85 attribute:10 multiplier:1.0 constant:0.0];
    [v82 addConstraint:v86];

    id v87 = objc_alloc_init(MEMORY[0x263F5B3D0]);
    [(ICAudioPlaybackBarViewController *)v5 setTrailingTimeLabel:v87];

    v88 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    [v88 setTranslatesAutoresizingMaskIntoConstraints:0];

    v89 = (void *)[objc_alloc(MEMORY[0x263F5B3C8]) initWithSeconds:0.0];
    v90 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    [v90 setMediaTimeValue:v89];

    v91 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    [v91 setTextAlignment:0];

    v92 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorSecondaryLabelColor");
    v93 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    [v93 setTextColor:v92];

    v94 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForTextStyle:maxContentSizeCategory:", v66, v67);
    v95 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    [v95 setFont:v94];

    v96 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    objc_msgSend(v96, "setIc_preferredContentSizeCategory:", v67);

    v97 = [(ICAudioPlaybackBarViewController *)v5 view];
    v98 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    [v97 addSubview:v98];

    v99 = (void *)MEMORY[0x263F08938];
    v100 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    v101 = [v99 constraintWithItem:v100 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:40.0];
    [(ICAudioPlaybackBarViewController *)v5 setTrailingTimeWidthConstraint:v101];

    v102 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    v103 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeWidthConstraint];
    [v102 addConstraint:v103];

    v104 = [(ICAudioPlaybackBarViewController *)v5 view];
    v105 = (void *)MEMORY[0x263F08938];
    v106 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    v107 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    v108 = [v105 constraintWithItem:v106 attribute:1 relatedBy:0 toItem:v107 attribute:2 multiplier:1.0 constant:10.0];
    [v104 addConstraint:v108];

    v109 = [(ICAudioPlaybackBarViewController *)v5 view];
    v110 = (void *)MEMORY[0x263F08938];
    v111 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    v112 = [(ICAudioPlaybackBarViewController *)v5 view];
    v113 = [v110 constraintWithItem:v111 attribute:10 relatedBy:0 toItem:v112 attribute:10 multiplier:1.0 constant:0.0];
    [v109 addConstraint:v113];

    v194 = [MEMORY[0x263F823D0] actionWithHandler:&__block_literal_global_0];
    v114 = objc_msgSend(MEMORY[0x263F824F0], "ic_plainButtonConfiguration");
    v115 = objc_msgSend(MEMORY[0x263F827E8], "ic_largeSystemImageNamed:", @"gobackward.15");
    [v114 setImage:v115];

    v116 = [MEMORY[0x263F086E0] mainBundle];
    v117 = [v116 localizedStringForKey:@"Skip forward 15 seconds" value:&stru_26C10E100 table:0];
    [v114 setAccessibilityLabel:v117];

    v118 = [MEMORY[0x263F824E8] buttonWithConfiguration:v114 primaryAction:v194];
    [(ICAudioPlaybackBarViewController *)v5 setSkipBackwardButton:v118];

    v119 = [(ICAudioPlaybackBarViewController *)v5 skipBackwardButton];
    [v119 setTranslatesAutoresizingMaskIntoConstraints:0];

    v120 = [(ICAudioPlaybackBarViewController *)v5 skipBackwardButton];
    objc_msgSend(v120, "setIc_preferredContentSizeCategory:", v67);

    v121 = [(ICAudioPlaybackBarViewController *)v5 skipBackwardButton];
    LODWORD(v122) = 1148846080;
    [v121 setContentHuggingPriority:0 forAxis:v122];

    v123 = [(ICAudioPlaybackBarViewController *)v5 view];
    v124 = [(ICAudioPlaybackBarViewController *)v5 skipBackwardButton];
    [v123 addSubview:v124];

    v125 = (void *)MEMORY[0x263F08938];
    v126 = [(ICAudioPlaybackBarViewController *)v5 leadingTimeLabel];
    v127 = [(ICAudioPlaybackBarViewController *)v5 skipBackwardButton];
    LODWORD(v128) = 1144750080;
    v129 = objc_msgSend(v125, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v126, 1, 1, v127, 2, 1.0, 10.0, v128);
    [(ICAudioPlaybackBarViewController *)v5 setSkipBackwardRightConstraint:v129];

    v130 = [(ICAudioPlaybackBarViewController *)v5 view];
    v131 = [(ICAudioPlaybackBarViewController *)v5 skipBackwardRightConstraint];
    [v130 addConstraint:v131];

    v132 = (void *)MEMORY[0x263F08938];
    v133 = [(ICAudioPlaybackBarViewController *)v5 skipBackwardButton];
    v134 = [(ICAudioPlaybackBarViewController *)v5 view];
    LODWORD(v135) = 1140457472;
    v136 = objc_msgSend(v132, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v133, 1, 0, v134, 13, 1.0, 0.0, v135);
    [(ICAudioPlaybackBarViewController *)v5 setSkipBackwardLeftConstraint:v136];

    v137 = [(ICAudioPlaybackBarViewController *)v5 view];
    v138 = [(ICAudioPlaybackBarViewController *)v5 skipBackwardLeftConstraint];
    [v137 addConstraint:v138];

    v139 = [(ICAudioPlaybackBarViewController *)v5 view];
    v140 = (void *)MEMORY[0x263F08938];
    v141 = [(ICAudioPlaybackBarViewController *)v5 skipBackwardButton];
    v142 = [(ICAudioPlaybackBarViewController *)v5 view];
    v143 = [v140 constraintWithItem:v141 attribute:10 relatedBy:0 toItem:v142 attribute:10 multiplier:1.0 constant:0.0];
    [v139 addConstraint:v143];

    v144 = [MEMORY[0x263F823D0] actionWithHandler:&__block_literal_global_36];
    v145 = objc_msgSend(MEMORY[0x263F824F0], "ic_plainButtonConfiguration");
    v146 = objc_msgSend(MEMORY[0x263F827E8], "ic_largeSystemImageNamed:", @"goforward.15");
    [v145 setImage:v146];

    v147 = [MEMORY[0x263F086E0] mainBundle];
    v148 = [v147 localizedStringForKey:@"Skip forward 15 seconds" value:&stru_26C10E100 table:0];
    [v145 setAccessibilityLabel:v148];

    v149 = [MEMORY[0x263F824E8] buttonWithConfiguration:v145 primaryAction:v144];
    [(ICAudioPlaybackBarViewController *)v5 setSkipForwardButton:v149];

    v150 = [(ICAudioPlaybackBarViewController *)v5 skipForwardButton];
    [v150 setTranslatesAutoresizingMaskIntoConstraints:0];

    v151 = [(ICAudioPlaybackBarViewController *)v5 skipForwardButton];
    LODWORD(v152) = 1148846080;
    [v151 setContentHuggingPriority:0 forAxis:v152];

    v153 = [(ICAudioPlaybackBarViewController *)v5 skipForwardButton];
    objc_msgSend(v153, "setIc_preferredContentSizeCategory:", v67);

    v154 = [(ICAudioPlaybackBarViewController *)v5 view];
    v155 = [(ICAudioPlaybackBarViewController *)v5 skipForwardButton];
    [v154 addSubview:v155];

    v156 = [(ICAudioPlaybackBarViewController *)v5 view];
    v157 = (void *)MEMORY[0x263F08938];
    v158 = [(ICAudioPlaybackBarViewController *)v5 skipForwardButton];
    v159 = [(ICAudioPlaybackBarViewController *)v5 trailingTimeLabel];
    LODWORD(v160) = 1144750080;
    v161 = objc_msgSend(v157, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v158, 1, 1, v159, 2, 1.0, 10.0, v160);
    [v156 addConstraint:v161];

    v162 = (void *)MEMORY[0x263F08938];
    v163 = [(ICAudioPlaybackBarViewController *)v5 view];
    v164 = [(ICAudioPlaybackBarViewController *)v5 skipForwardButton];
    LODWORD(v165) = 1140457472;
    v166 = objc_msgSend(v162, "ic_constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v163, 14, 0, v164, 2, 1.0, 0.0, v165);
    [(ICAudioPlaybackBarViewController *)v5 setSkipForwardRightConstraint:v166];

    v167 = [(ICAudioPlaybackBarViewController *)v5 view];
    v168 = [(ICAudioPlaybackBarViewController *)v5 skipForwardRightConstraint];
    [v167 addConstraint:v168];

    v169 = [(ICAudioPlaybackBarViewController *)v5 view];
    v170 = (void *)MEMORY[0x263F08938];
    v171 = [(ICAudioPlaybackBarViewController *)v5 skipForwardButton];
    v172 = [(ICAudioPlaybackBarViewController *)v5 view];
    v173 = [v170 constraintWithItem:v171 attribute:10 relatedBy:0 toItem:v172 attribute:10 multiplier:1.0 constant:0.0];
    [v169 addConstraint:v173];

    id v174 = objc_alloc_init(MEMORY[0x263F828E0]);
    [(ICAudioPlaybackBarViewController *)v5 setCreationDateLabel:v174];

    v175 = [(ICAudioPlaybackBarViewController *)v5 creationDateLabel];
    [v175 setTranslatesAutoresizingMaskIntoConstraints:0];

    v176 = objc_msgSend(MEMORY[0x263F825C8], "ic_noteEditorSecondaryLabelColor");
    v177 = [(ICAudioPlaybackBarViewController *)v5 creationDateLabel];
    [v177 setTextColor:v176];

    v178 = objc_msgSend(MEMORY[0x263F81708], "ic_preferredFontForTextStyle:maxContentSizeCategory:", v195, v67);
    v179 = [(ICAudioPlaybackBarViewController *)v5 creationDateLabel];
    [v179 setFont:v178];

    v180 = [(ICAudioPlaybackBarViewController *)v5 view];
    v181 = [(ICAudioPlaybackBarViewController *)v5 creationDateLabel];
    v182 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    [v180 insertSubview:v181 belowSubview:v182];

    v183 = [(ICAudioPlaybackBarViewController *)v5 view];
    v184 = (void *)MEMORY[0x263F08938];
    v185 = [(ICAudioPlaybackBarViewController *)v5 creationDateLabel];
    v186 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    v187 = [v184 constraintWithItem:v185 attribute:9 relatedBy:0 toItem:v186 attribute:9 multiplier:1.0 constant:0.0];
    [v183 addConstraint:v187];

    v188 = [(ICAudioPlaybackBarViewController *)v5 view];
    v189 = (void *)MEMORY[0x263F08938];
    v190 = [(ICAudioPlaybackBarViewController *)v5 creationDateLabel];
    v191 = [(ICAudioPlaybackBarViewController *)v5 scrubberView];
    v192 = [v189 constraintWithItem:v190 attribute:3 relatedBy:0 toItem:v191 attribute:4 multiplier:1.0 constant:1.0];
    [v188 addConstraint:v192];

    [(ICAudioPlaybackBarViewController *)v5 updateLayout];
  }
  return v5;
}

void __59__ICAudioPlaybackBarViewController_initWithNibName_bundle___block_invoke()
{
  id v0 = [MEMORY[0x263F5B240] sharedAudioController];
  [v0 skipBackByInterval:0 completion:15.0];
}

void __59__ICAudioPlaybackBarViewController_initWithNibName_bundle___block_invoke_2()
{
  id v0 = [MEMORY[0x263F5B240] sharedAudioController];
  [v0 skipAheadByInterval:0 completion:15.0];
}

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ICAudioPlaybackBarViewController;
  [(ICAudioPlaybackBarViewController *)&v5 viewDidLayoutSubviews];
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    id v3 = [(ICAudioPlaybackBarViewController *)self playPauseView];
    v4 = [(ICAudioPlaybackBarViewController *)self playPauseView];
    [v4 bounds];
    objc_msgSend(v3, "ic_applyRoundedCornersWithRadius:", CGRectGetMidX(v6));

    [(ICAudioPlaybackBarViewController *)self updateLayout];
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICAudioPlaybackBarViewController;
  [(ICAudioBarViewController *)&v4 dealloc];
}

- (void)setAudioAttachment:(id)a3
{
  objc_super v5 = (ICAttachment *)a3;
  p_audioAttachment = (id *)&self->_audioAttachment;
  audioAttachment = self->_audioAttachment;
  if (audioAttachment != v5)
  {
    v20 = v5;
    id v8 = (void *)MEMORY[0x263F5B028];
    double v9 = (void *)MEMORY[0x263F5A9C0];
    if (audioAttachment)
    {
      double v10 = [MEMORY[0x263F08A00] defaultCenter];
      [v10 removeObserver:self name:*v8 object:*p_audioAttachment];

      double v11 = [MEMORY[0x263F08A00] defaultCenter];
      [v11 removeObserver:self name:*v9 object:*p_audioAttachment];
    }
    objc_storeStrong((id *)&self->_audioAttachment, a3);
    if (*p_audioAttachment)
    {
      double v12 = [*p_audioAttachment attachmentModel];
      v13 = [MEMORY[0x263F08A00] defaultCenter];
      [v13 addObserver:self selector:sel_audioPlaybackTimeChangedNotification_ name:*v8 object:*p_audioAttachment];

      v14 = [MEMORY[0x263F08A00] defaultCenter];
      [v14 addObserver:self selector:sel_attachmentWillBeDeletedNotification_ name:*v9 object:*p_audioAttachment];

      int v15 = [v12 recordedInNotes];
      if (v15)
      {
        p_audioAttachment = [*p_audioAttachment modificationDate];
        objc_msgSend(p_audioAttachment, "ic_shortFormattedDate");
        v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = &stru_26C10E100;
      }
      v17 = [(ICAudioPlaybackBarViewController *)self creationDateLabel];
      [v17 setText:v16];

      if (v15)
      {
      }
    }
    v18 = [(ICAudioPlaybackBarViewController *)self playPauseView];
    [v18 setAudioAttachment:v20];

    v19 = [(ICAudioPlaybackBarViewController *)self scrubberView];
    [v19 setAudioAttachment:v20];

    objc_super v5 = v20;
  }
}

- (void)scrubberValueChangedAction:(id)a3
{
  objc_super v4 = (objc_class *)MEMORY[0x263F5B3C8];
  id v5 = a3;
  id v6 = [v4 alloc];
  [v5 value];
  id v8 = (void *)[v6 initWithSeconds:v7];
  double v9 = [(ICAudioPlaybackBarViewController *)self leadingTimeLabel];
  [v9 setMediaTimeValue:v8];

  id v10 = objc_alloc(MEMORY[0x263F5B3C8]);
  [v5 value];
  float v12 = v11;

  id v14 = (id)[v10 initWithSeconds:v12];
  v13 = [(ICAudioPlaybackBarViewController *)self trailingTimeLabel];
  [v13 setMediaTimeValue:v14];
}

- (void)done:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x263F5B240];
  id v5 = a3;
  id v6 = [v4 sharedAudioController];
  [v6 stop];

  v7.receiver = self;
  v7.super_class = (Class)ICAudioPlaybackBarViewController;
  [(ICAudioBarViewController *)&v7 done:v5];
}

- (void)audioPlaybackTimeChangedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(ICAudioPlaybackBarViewController *)self audioAttachment];

  if (v5 == v6)
  {
    objc_super v7 = [v4 userInfo];
    id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F5B008]];

    double v9 = [(ICAudioPlaybackBarViewController *)self traitCollection];
    uint64_t v10 = [v9 horizontalSizeClass];

    id v11 = objc_alloc(MEMORY[0x263F5B3C8]);
    [v8 doubleValue];
    float v12 = objc_msgSend(v11, "initWithSeconds:");
    if (v10 == 2)
    {
      v13 = [(ICAudioPlaybackBarViewController *)self leadingTimeLabel];
      [v13 setMediaTimeValue:v12];

      id v14 = objc_alloc(MEMORY[0x263F5B3C8]);
      [v8 doubleValue];
      double v16 = v15;
      float v12 = [MEMORY[0x263F5B240] sharedAudioController];
      v17 = [v12 currentPlayer];
      v18 = [v17 currentItem];
      v19 = v18;
      if (v18) {
        [v18 duration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      v21 = (void *)[v14 initWithSeconds:v16 - CMTimeGetSeconds(&time)];
      v22 = [(ICAudioPlaybackBarViewController *)self trailingTimeLabel];
      [v22 setMediaTimeValue:v21];
    }
    else
    {
      v20 = [(ICAudioPlaybackBarViewController *)self trailingTimeLabel];
      [v20 setMediaTimeValue:v12];
    }
  }
}

- (void)attachmentWillBeDeletedNotification:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(ICAudioPlaybackBarViewController *)self audioAttachment];

  id v5 = v6;
  if (v6 == v4)
  {
    [(ICAudioPlaybackBarViewController *)self done:0];
    id v5 = v6;
  }
}

- (void)noteWillBeDeletedNotification:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(ICAudioBarViewController *)self note];

  id v5 = v6;
  if (v6 == v4)
  {
    [(ICAudioBarViewController *)self setNote:0];
    [(ICAudioPlaybackBarViewController *)self setAudioAttachment:0];
    [(ICAudioPlaybackBarViewController *)self done:0];
    id v5 = v6;
  }
}

- (void)registerForTraitChanges
{
  v5[1] = *MEMORY[0x263EF8340];
  v5[0] = objc_opt_class();
  id v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];
  id v4 = (id)[(ICAudioPlaybackBarViewController *)self registerForTraitChanges:v3 withAction:sel_updateLayout];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __87__ICAudioPlaybackBarViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_2640B8050;
  v9[4] = self;
  id v7 = a4;
  [v7 animateAlongsideTransition:v9 completion:0];
  v8.receiver = self;
  v8.super_class = (Class)ICAudioPlaybackBarViewController;
  -[ICAudioPlaybackBarViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
}

uint64_t __87__ICAudioPlaybackBarViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateLayout];
}

- (void)updateLayout
{
  BOOL v3 = [(ICAudioPlaybackBarViewController *)self isRegularHorizontalLayout];
  int v4 = objc_msgSend(MEMORY[0x263F81658], "ic_isRTL");
  id v5 = [(ICAudioPlaybackBarViewController *)self leadingTimeLabel];
  [v5 setHidden:v3 ^ 1];

  id v6 = [(ICAudioPlaybackBarViewController *)self skipForwardButton];
  [v6 setHidden:v3 ^ 1];

  id v7 = [(ICAudioPlaybackBarViewController *)self skipBackwardRightConstraint];
  [v7 setActive:v3];

  objc_super v8 = [(ICAudioPlaybackBarViewController *)self scrubberLeftConstraint];
  double v9 = v8;
  double v10 = 114.0;
  if (v3)
  {
    double v10 = 160.0;
    double v11 = 160.0;
  }
  else
  {
    double v11 = 102.0;
  }
  [v8 setConstant:v10];

  float v12 = [(ICAudioPlaybackBarViewController *)self scrubberRightConstraint];
  [v12 setConstant:v11];

  v13 = [(ICAudioPlaybackBarViewController *)self skipBackwardLeftConstraint];
  id v14 = v13;
  if (v4)
  {
    double v15 = 40.0;
    if (v3) {
      double v15 = 110.0;
    }
    double v16 = 84.0;
  }
  else
  {
    double v15 = 32.0;
    double v16 = 88.0;
    if (v3) {
      double v15 = 88.0;
    }
  }
  if (v3) {
    double v17 = v16;
  }
  else {
    double v17 = 0.0;
  }
  [v13 setConstant:v15];

  v18 = [(ICAudioPlaybackBarViewController *)self skipForwardRightConstraint];
  [v18 setConstant:v17];

  [(ICAudioPlaybackBarViewController *)self updateMediaTimeAccessibilityLabels];
}

- (void)updateMediaTimeAccessibilityLabels
{
  BOOL v3 = [MEMORY[0x263F086E0] mainBundle];
  id v9 = [v3 localizedStringForKey:@"elapsed" value:&stru_26C10E100 table:0];

  int v4 = [MEMORY[0x263F086E0] mainBundle];
  id v5 = [v4 localizedStringForKey:@"remaining" value:&stru_26C10E100 table:0];

  id v6 = [(ICAudioPlaybackBarViewController *)self leadingTimeLabel];
  [v6 setAccessibilityLabel:v9];

  if ([(ICAudioPlaybackBarViewController *)self isRegularHorizontalLayout]) {
    id v7 = v5;
  }
  else {
    id v7 = v9;
  }
  objc_super v8 = [(ICAudioPlaybackBarViewController *)self trailingTimeLabel];
  [v8 setAccessibilityLabel:v7];
}

- (BOOL)isRegularHorizontalLayout
{
  if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision"))
  {
    BOOL v3 = [(ICAudioPlaybackBarViewController *)self view];
    [v3 frame];
    char v4 = CGRectGetWidth(v6) >= 416.0;
  }
  else
  {
    BOOL v3 = [(ICAudioPlaybackBarViewController *)self traitCollection];
    if ([v3 horizontalSizeClass] == 2) {
      char v4 = 1;
    }
    else {
      char v4 = [MEMORY[0x263F5AE70] isLargerCompactHorizontalWidthDevice];
    }
  }

  return v4;
}

- (ICAttachment)audioAttachment
{
  return self->_audioAttachment;
}

- (ICAudioPlayPauseView)playPauseView
{
  return self->_playPauseView;
}

- (void)setPlayPauseView:(id)a3
{
}

- (UIButton)skipBackwardButton
{
  return self->_skipBackwardButton;
}

- (void)setSkipBackwardButton:(id)a3
{
}

- (NSLayoutConstraint)skipBackwardLeftConstraint
{
  return self->_skipBackwardLeftConstraint;
}

- (void)setSkipBackwardLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)skipBackwardRightConstraint
{
  return self->_skipBackwardRightConstraint;
}

- (void)setSkipBackwardRightConstraint:(id)a3
{
}

- (UIButton)skipForwardButton
{
  return self->_skipForwardButton;
}

- (void)setSkipForwardButton:(id)a3
{
}

- (NSLayoutConstraint)skipForwardRightConstraint
{
  return self->_skipForwardRightConstraint;
}

- (void)setSkipForwardRightConstraint:(id)a3
{
}

- (ICAudioPlaybackScrubberView)scrubberView
{
  return self->_scrubberView;
}

- (void)setScrubberView:(id)a3
{
}

- (NSLayoutConstraint)scrubberLeftConstraint
{
  return self->_scrubberLeftConstraint;
}

- (void)setScrubberLeftConstraint:(id)a3
{
}

- (NSLayoutConstraint)scrubberRightConstraint
{
  return self->_scrubberRightConstraint;
}

- (void)setScrubberRightConstraint:(id)a3
{
}

- (ICMediaTimeLabel)leadingTimeLabel
{
  return self->_leadingTimeLabel;
}

- (void)setLeadingTimeLabel:(id)a3
{
}

- (ICMediaTimeLabel)trailingTimeLabel
{
  return self->_trailingTimeLabel;
}

- (void)setTrailingTimeLabel:(id)a3
{
}

- (NSLayoutConstraint)trailingTimeWidthConstraint
{
  return self->_trailingTimeWidthConstraint;
}

- (void)setTrailingTimeWidthConstraint:(id)a3
{
}

- (UILabel)creationDateLabel
{
  return self->_creationDateLabel;
}

- (void)setCreationDateLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_creationDateLabel, 0);
  objc_storeStrong((id *)&self->_trailingTimeWidthConstraint, 0);
  objc_storeStrong((id *)&self->_trailingTimeLabel, 0);
  objc_storeStrong((id *)&self->_leadingTimeLabel, 0);
  objc_storeStrong((id *)&self->_scrubberRightConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberLeftConstraint, 0);
  objc_storeStrong((id *)&self->_scrubberView, 0);
  objc_storeStrong((id *)&self->_skipForwardRightConstraint, 0);
  objc_storeStrong((id *)&self->_skipForwardButton, 0);
  objc_storeStrong((id *)&self->_skipBackwardRightConstraint, 0);
  objc_storeStrong((id *)&self->_skipBackwardLeftConstraint, 0);
  objc_storeStrong((id *)&self->_skipBackwardButton, 0);
  objc_storeStrong((id *)&self->_playPauseView, 0);

  objc_storeStrong((id *)&self->_audioAttachment, 0);
}

@end