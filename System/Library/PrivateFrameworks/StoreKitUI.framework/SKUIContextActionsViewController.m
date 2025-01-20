@interface SKUIContextActionsViewController
- (BOOL)hasAppliedSystemRecognizer;
- (BOOL)isOrbPresentation;
- (CGPoint)gestureRecognizerInitialLocation;
- (NSMutableArray)constraints;
- (SKUIContextActionsConfiguration)configuration;
- (SKUIContextActionsPresentationController)transitionPresentationController;
- (SKUIContextActionsViewController)initWithCoder:(id)a3;
- (SKUIContextActionsViewController)initWithConfiguration:(id)a3;
- (UIGestureRecognizer)systemProvidedGestureRecognzier;
- (UIInterfaceActionGroupView)contextActionView;
- (UIInterfaceActionGroupView)scrollableActionGroupView;
- (UIStackView)stackView;
- (UIVisualEffectView)backgroundView;
- (double)transitionDuration:(id)a3;
- (id)_transitionPresentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (void)_applySystemRecognizer;
- (void)_reloadViewsConfiguration;
- (void)animateTransition:(id)a3;
- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5;
- (void)setAppliedSystemRecognizer:(BOOL)a3;
- (void)setBackgroundView:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setContextActionView:(id)a3;
- (void)setGestureRecognizerInitialLocation:(CGPoint)a3;
- (void)setOrbPresentation:(BOOL)a3;
- (void)setScrollableActionGroupView:(id)a3;
- (void)setStackView:(id)a3;
- (void)setSystemProvidedGestureRecognzier:(id)a3;
- (void)setTransitionPresentationController:(id)a3;
- (void)systemProvidedGestureRecognzierTriggered:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewTapped:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SKUIContextActionsViewController

- (SKUIContextActionsViewController)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x1E4F1CA00];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 raise:@"SKUnsupportedPresentationException", @"%@ must be used with configuration", v6 format];

  return 0;
}

- (SKUIContextActionsViewController)initWithConfiguration:(id)a3
{
  id v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIContextActionsViewController initWithConfiguration:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUIContextActionsViewController;
  v6 = [(SKUIContextActionsViewController *)&v9 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_orbPresentation = 0;
    v7->_appliedSystemRecognizer = 0;
    [(SKUIContextActionsViewController *)v7 setTransitioningDelegate:v7];
    [(SKUIContextActionsViewController *)v7 setModalPresentationStyle:4];
  }

  return v7;
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)SKUIContextActionsViewController;
  [(SKUIContextActionsViewController *)&v16 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_viewTapped_];
  v4 = [(SKUIContextActionsViewController *)self view];
  [v4 addGestureRecognizer:v3];

  id v5 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v6 = [MEMORY[0x1E4FB14C8] effectWithStyle:0];
  v7 = (UIVisualEffectView *)[v5 initWithEffect:v6];

  [(UIVisualEffectView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIVisualEffectView *)v7 _setContinuousCornerRadius:16.0];
  [(UIVisualEffectView *)v7 setClipsToBounds:1];
  [(UIVisualEffectView *)v7 setHidden:1];
  backgroundView = self->_backgroundView;
  self->_backgroundView = v7;
  objc_super v9 = v7;

  v10 = [(SKUIContextActionsViewController *)self view];
  [v10 addSubview:v9];

  id v11 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v12 = (UIStackView *)[v11 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  [(UIStackView *)v12 setAxis:1];
  [(UIStackView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  stackView = self->_stackView;
  self->_stackView = v12;
  v14 = v12;

  v15 = [(SKUIContextActionsViewController *)self view];
  [v15 addSubview:v14];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIContextActionsViewController;
  [(SKUIContextActionsViewController *)&v4 viewWillAppear:a3];
  [(SKUIContextActionsViewController *)self _reloadViewsConfiguration];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SKUIContextActionsViewController;
  [(SKUIContextActionsViewController *)&v7 viewDidAppear:a3];
  objc_super v4 = [(SKUIContextActionsViewController *)self systemProvidedGestureRecognzier];
  if (v4)
  {
    id v5 = [(SKUIContextActionsViewController *)self view];
    v6 = [v5 window];
    [v4 locationInView:v6];
    -[SKUIContextActionsViewController setGestureRecognizerInitialLocation:](self, "setGestureRecognizerInitialLocation:");

    [v4 addTarget:self action:sel_systemProvidedGestureRecognzierTriggered_];
  }
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)SKUIContextActionsViewController;
  [(SKUIContextActionsViewController *)&v13 viewDidLayoutSubviews];
  v3 = [(SKUIContextActionsViewController *)self scrollableActionGroupView];
  objc_super v4 = [(SKUIContextActionsViewController *)self view];
  [v4 bounds];
  objc_msgSend(v3, "systemLayoutSizeFittingSize:", v5, v6);
  double v8 = v7;
  objc_super v9 = [(SKUIContextActionsViewController *)self scrollableActionGroupView];
  [v9 bounds];
  double Height = CGRectGetHeight(v14);

  if (v8 > Height) {
    [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.0399999991];
  }
  else {
  id v11 = [MEMORY[0x1E4FB1618] clearColor];
  }
  v12 = [(SKUIContextActionsViewController *)self scrollableActionGroupView];
  [v12 setBackgroundColor:v11];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKUIContextActionsViewController;
  [(SKUIContextActionsViewController *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    uint64_t v5 = [v4 horizontalSizeClass];
    double v6 = [(SKUIContextActionsViewController *)self traitCollection];
    uint64_t v7 = [v6 horizontalSizeClass];

    if (v5 != v7)
    {
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __61__SKUIContextActionsViewController_traitCollectionDidChange___block_invoke;
      v8[3] = &unk_1E6422020;
      v8[4] = self;
      [(SKUIContextActionsViewController *)self dismissViewControllerAnimated:0 completion:v8];
    }
  }
}

void __61__SKUIContextActionsViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  id v29 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v29 userInterfaceIdiom] == 1)
  {
    v2 = [*(id *)(a1 + 32) traitCollection];
    uint64_t v3 = [v2 horizontalSizeClass];

    if (v3 != 2) {
      return;
    }
    [*(id *)(a1 + 32) setModalPresentationStyle:7];
    id v4 = [*(id *)(a1 + 32) configuration];
    id v29 = [v4 presentationSource];

    uint64_t v5 = [v29 viewController];
    [v5 presentViewController:*(void *)(a1 + 32) animated:0 completion:0];

    double v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v6 presentationController];
    [v7 setDelegate:v6];

    double v8 = [*(id *)(a1 + 32) configuration];
    objc_super v9 = [v8 presentationSource];
    v10 = [v9 barButtonItem];

    id v11 = [*(id *)(a1 + 32) configuration];
    v12 = [v11 presentationSource];
    objc_super v13 = v12;
    if (v10)
    {
      CGRect v14 = [v12 barButtonItem];
      v15 = [*(id *)(a1 + 32) popoverPresentationController];
      [v15 setBarButtonItem:v14];

LABEL_8:
      goto LABEL_9;
    }
    objc_super v16 = [v12 sourceView];

    if (v16)
    {
      v17 = [*(id *)(a1 + 32) configuration];
      v18 = [v17 presentationSource];
      v19 = [v18 sourceView];
      v20 = [*(id *)(a1 + 32) popoverPresentationController];
      [v20 setSourceView:v19];

      id v11 = [*(id *)(a1 + 32) configuration];
      objc_super v13 = [v11 presentationSource];
      [v13 sourceRect];
      double v22 = v21;
      double v24 = v23;
      double v26 = v25;
      double v28 = v27;
      CGRect v14 = [*(id *)(a1 + 32) popoverPresentationController];
      objc_msgSend(v14, "setSourceRect:", v22, v24, v26, v28);
      goto LABEL_8;
    }
  }
LABEL_9:
}

- (void)viewTapped:(id)a3
{
}

- (void)systemProvidedGestureRecognzierTriggered:(id)a3
{
  id v17 = a3;
  [(SKUIContextActionsViewController *)self gestureRecognizerInitialLocation];
  double v6 = v5;
  double v7 = v4;
  BOOL v8 = v5 == *MEMORY[0x1E4F1DAD8] && v4 == *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  if (!v8 && [v17 state] == 2)
  {
    objc_super v9 = [(SKUIContextActionsViewController *)self view];
    v10 = [v9 window];
    [v17 locationInView:v10];
    double v12 = v11;
    double v14 = v13;

    double v15 = v12 - v6;
    if (v12 - v6 < 0.0) {
      double v15 = -(v12 - v6);
    }
    if (v15 > 40.0) {
      goto LABEL_12;
    }
    double v16 = v14 - v7;
    if (v14 - v7 < 0.0) {
      double v16 = -(v14 - v7);
    }
    if (v16 > 25.0) {
LABEL_12:
    }
      [(SKUIContextActionsViewController *)self _applySystemRecognizer];
  }
}

- (void)_applySystemRecognizer
{
  uint64_t v3 = [(SKUIContextActionsViewController *)self contextActionView];
  double v4 = [(SKUIContextActionsViewController *)self systemProvidedGestureRecognzier];
  [v3 beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:v4];

  double v5 = [(SKUIContextActionsViewController *)self systemProvidedGestureRecognzier];

  if (v5)
  {
    double v6 = [(SKUIContextActionsViewController *)self systemProvidedGestureRecognzier];
    [v6 removeTarget:self action:sel_systemProvidedGestureRecognzierTriggered_];
  }

  [(SKUIContextActionsViewController *)self setAppliedSystemRecognizer:1];
}

- (void)_reloadViewsConfiguration
{
  uint64_t v164 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28DC8];
  double v4 = [(SKUIContextActionsViewController *)self constraints];
  [v3 deactivateConstraints:v4];

  long long v155 = 0u;
  long long v156 = 0u;
  long long v153 = 0u;
  long long v154 = 0u;
  double v5 = [(SKUIContextActionsViewController *)self stackView];
  double v6 = [v5 arrangedSubviews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v153 objects:v163 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v154;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v154 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v153 + 1) + 8 * i);
        double v12 = [(SKUIContextActionsViewController *)self stackView];
        [v12 setSpacing:0.0];

        double v13 = [(SKUIContextActionsViewController *)self stackView];
        [v13 removeArrangedSubview:v11];

        [v11 removeFromSuperview];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v153 objects:v163 count:16];
    }
    while (v8);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [(SKUIContextActionsViewController *)self setConstraints:v14];

  uint64_t v15 = *MEMORY[0x1E4FB2998];
  uint64_t v17 = __61__SKUIContextActionsViewController__reloadViewsConfiguration__block_invoke(v16, *MEMORY[0x1E4FB2998], 0, 0x8000);
  uint64_t v161 = *MEMORY[0x1E4FB0948];
  uint64_t v162 = *MEMORY[0x1E4F244E0];
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v162 forKeys:&v161 count:1];
  uint64_t v19 = __61__SKUIContextActionsViewController__reloadViewsConfiguration__block_invoke((uint64_t)v18, v15, v18, 0);

  v20 = [(SKUIContextActionsViewController *)self configuration];
  uint64_t v21 = [v20 contextActions];

  id v22 = objc_alloc(MEMORY[0x1E4FB1868]);
  v145 = (void *)v21;
  double v23 = [MEMORY[0x1E4FB1860] actionGroupWithActions:v21];
  double v24 = (void *)[v22 initWithActionGroup:v23 actionHandlerInvocationDelegate:self];

  v147 = (void *)v17;
  [v24 _setVisualStyleOverrideTitleLabelFont:v17];
  LODWORD(v25) = 1132068864;
  [v24 setContentCompressionResistancePriority:1 forAxis:v25];
  v144 = v24;
  [(SKUIContextActionsViewController *)self setContextActionView:v24];
  double v26 = 0;
  if (![(SKUIContextActionsViewController *)self isOrbPresentation])
  {
    if ([(SKUIContextActionsViewController *)self _isInPopoverPresentation])
    {
      double v26 = 0;
    }
    else
    {
      double v27 = (void *)MEMORY[0x1E4FB1858];
      double v28 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v29 = [v28 localizedStringForKey:@"CANCEL" value:&stru_1F1C879E8 table:0];
      v30 = [v27 actionWithTitle:v29 type:1 handler:&__block_literal_global_47];

      v31 = (void *)MEMORY[0x1E4FB1818];
      v32 = [MEMORY[0x1E4FB1618] clearColor];
      v33 = [v31 singlePointImageWithColor:v32];
      v34 = objc_msgSend(v33, "imageWithAlignmentRectInsets:", -55.0, 0.0, 0.0, 0.0);
      [v30 setTrailingImage:v34];

      id v35 = objc_alloc(MEMORY[0x1E4FB1868]);
      v36 = (void *)MEMORY[0x1E4FB1860];
      v160 = v30;
      v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v160 count:1];
      v38 = [v36 actionGroupWithActions:v37];
      double v26 = (void *)[v35 initWithActionGroup:v38 actionHandlerInvocationDelegate:self];

      v39 = (void *)MEMORY[0x1E4F28DC8];
      v40 = [v26 heightAnchor];
      v41 = [v40 constraintEqualToConstant:56.0];
      v159 = v41;
      v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v159 count:1];
      [v39 activateConstraints:v42];

      [v26 _setVisualStyleOverrideTitleLabelFont:v19];
    }
  }
  id v43 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v44 = objc_msgSend(v43, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v44 setAxis:1];
  [v44 setTranslatesAutoresizingMaskIntoConstraints:0];
  v45 = [(SKUIContextActionsViewController *)self stackView];
  [v45 addArrangedSubview:v44];

  int v46 = [(SKUIContextActionsViewController *)self _isInPopoverPresentation];
  if ((v46 & 1) == 0)
  {
    v47 = [(SKUIContextActionsViewController *)self contextActionView];
    [v47 _setContinuousCornerRadius:16.0];

    v48 = [(SKUIContextActionsViewController *)self contextActionView];
    [v48 setClipsToBounds:1];

    v49 = [(SKUIContextActionsViewController *)self contextActionView];
    v50 = [v49 layer];
    [v50 setMaskedCorners:15];
  }
  v51 = [(SKUIContextActionsViewController *)self contextActionView];
  [v51 _setDrawsBackground:0];

  v52 = [(SKUIContextActionsViewController *)self contextActionView];
  [v44 addArrangedSubview:v52];

  if ([(SKUIContextActionsViewController *)self hasAppliedSystemRecognizer])
  {
    v53 = [(SKUIContextActionsViewController *)self contextActionView];
    v54 = [(SKUIContextActionsViewController *)self systemProvidedGestureRecognzier];
    [v53 beginTrackingSessionByTakingOverForSystemProvidedGestureRecognizer:v54];
  }
  if (v26)
  {
    v55 = [(SKUIContextActionsViewController *)self stackView];
    [v55 setSpacing:8.0];

    v56 = [(SKUIContextActionsViewController *)self stackView];
    [v56 addArrangedSubview:v26];
  }
  if ((v46 | [(SKUIContextActionsViewController *)self isOrbPresentation]) == 1)
  {
    v57 = [(SKUIContextActionsViewController *)self stackView];
    v58 = [v57 centerYAnchor];
    v59 = [(SKUIContextActionsViewController *)self view];
    v60 = [v59 centerYAnchor];
    v152 = [v58 constraintEqualToAnchor:v60];
  }
  else
  {
    v61 = [(SKUIContextActionsViewController *)self view];
    v62 = [v61 layoutMarginsGuide];
    v57 = [v62 bottomAnchor];

    v58 = [(SKUIContextActionsViewController *)self stackView];
    v59 = [v58 bottomAnchor];
    v152 = [v59 constraintEqualToAnchor:v57 constant:-10.0];
  }

  v63 = [(SKUIContextActionsViewController *)self view];
  v64 = v63;
  if (v46)
  {
    uint64_t v65 = [v63 leadingAnchor];

    v66 = [(SKUIContextActionsViewController *)self view];
    uint64_t v67 = [v66 trailingAnchor];
  }
  else
  {
    v68 = [v63 layoutMarginsGuide];
    uint64_t v65 = [v68 leadingAnchor];

    v66 = [(SKUIContextActionsViewController *)self view];
    v69 = [v66 layoutMarginsGuide];
    uint64_t v67 = [v69 trailingAnchor];
  }
  v143 = v26;
  v146 = (void *)v19;

  v70 = [(SKUIContextActionsViewController *)self stackView];
  v71 = [v70 leadingAnchor];
  v141 = (void *)v65;
  uint64_t v72 = [v71 constraintEqualToAnchor:v65];

  v73 = [(SKUIContextActionsViewController *)self stackView];
  v74 = [v73 trailingAnchor];
  v140 = (void *)v67;
  uint64_t v75 = [v74 constraintEqualToAnchor:v67];

  int v142 = v46;
  v148 = (void *)v75;
  v149 = (void *)v72;
  v150 = v44;
  if ((v46 & 1) == 0)
  {
    v76 = [(SKUIContextActionsViewController *)self view];
    [v76 layoutMargins];
    double v78 = v77;
    v79 = [(SKUIContextActionsViewController *)self view];
    [v79 layoutMargins];
    double v81 = -(v78 + v80);

    v82 = [(SKUIContextActionsViewController *)self stackView];
    v83 = [v82 widthAnchor];
    v84 = [(SKUIContextActionsViewController *)self view];
    v85 = [v84 heightAnchor];
    v86 = [v83 constraintEqualToAnchor:v85 constant:v81];

    LODWORD(v87) = 1132068864;
    [v86 setPriority:v87];
    v88 = [(SKUIContextActionsViewController *)self stackView];
    v89 = [v88 topAnchor];
    v90 = [(SKUIContextActionsViewController *)self view];
    v91 = [v90 topAnchor];
    v92 = [v89 constraintGreaterThanOrEqualToAnchor:v91 constant:70.0];

    LODWORD(v93) = 1148829696;
    v138 = v92;
    [v92 setPriority:v93];
    v130 = [(SKUIContextActionsViewController *)self constraints];
    v158[0] = v92;
    v158[1] = v86;
    v136 = [(SKUIContextActionsViewController *)self stackView];
    v132 = [v136 widthAnchor];
    v134 = [(SKUIContextActionsViewController *)self view];
    v94 = [v134 heightAnchor];
    v95 = [v132 constraintLessThanOrEqualToAnchor:v94 constant:v81];
    v158[2] = v95;
    v96 = [(SKUIContextActionsViewController *)self stackView];
    v97 = [v96 centerXAnchor];
    v98 = [(SKUIContextActionsViewController *)self view];
    v99 = [v98 centerXAnchor];
    v100 = [v97 constraintEqualToAnchor:v99];
    v158[3] = v100;
    v101 = [MEMORY[0x1E4F1C978] arrayWithObjects:v158 count:4];
    [v130 addObjectsFromArray:v101];

    uint64_t v75 = (uint64_t)v148;
    uint64_t v72 = (uint64_t)v149;

    v44 = v150;
    LODWORD(v102) = 1144750080;
    [v149 setPriority:v102];
    LODWORD(v103) = 1144750080;
    [v148 setPriority:v103];
    v104 = [(SKUIContextActionsViewController *)self backgroundView];
    [v104 setHidden:0];
  }
  v151 = [(SKUIContextActionsViewController *)self constraints];
  v157[0] = v152;
  v157[1] = v72;
  v157[2] = v75;
  v139 = [(SKUIContextActionsViewController *)self stackView];
  v135 = [v139 bottomAnchor];
  v137 = [(SKUIContextActionsViewController *)self view];
  v133 = [v137 bottomAnchor];
  v131 = [v135 constraintLessThanOrEqualToAnchor:v133];
  v157[3] = v131;
  v129 = [(SKUIContextActionsViewController *)self backgroundView];
  v128 = [v129 centerYAnchor];
  v127 = [v44 centerYAnchor];
  v126 = [v128 constraintEqualToAnchor:v127];
  v157[4] = v126;
  v125 = [(SKUIContextActionsViewController *)self backgroundView];
  v124 = [v125 centerXAnchor];
  v123 = [v44 centerXAnchor];
  v122 = [v124 constraintEqualToAnchor:v123];
  v157[5] = v122;
  v105 = [(SKUIContextActionsViewController *)self backgroundView];
  v106 = [v105 widthAnchor];
  v107 = [v44 widthAnchor];
  v108 = [v106 constraintEqualToAnchor:v107];
  v157[6] = v108;
  v109 = [(SKUIContextActionsViewController *)self backgroundView];
  v110 = [v109 heightAnchor];
  v111 = [v44 heightAnchor];
  v112 = [v110 constraintEqualToAnchor:v111];
  v157[7] = v112;
  v113 = [MEMORY[0x1E4F1C978] arrayWithObjects:v157 count:8];
  [v151 addObjectsFromArray:v113];

  v114 = (void *)MEMORY[0x1E4F28DC8];
  v115 = [(SKUIContextActionsViewController *)self constraints];
  [v114 activateConstraints:v115];

  if (v142)
  {
    v116 = [(SKUIContextActionsViewController *)self stackView];
    v117 = [(SKUIContextActionsViewController *)self view];
    [v117 bounds];
    objc_msgSend(v116, "systemLayoutSizeFittingSize:", v118, v119);
    double v121 = v120;

    -[SKUIContextActionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 347.0, v121);
  }
}

id __61__SKUIContextActionsViewController__reloadViewsConfiguration__block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:a2];
  uint64_t v8 = v7;
  if (v6)
  {
    uint64_t v9 = [v7 fontDescriptorByAddingAttributes:v6];

    uint64_t v8 = (void *)v9;
  }
  if (a4)
  {
    uint64_t v10 = [v8 fontDescriptorWithSymbolicTraits:a4];

    uint64_t v8 = (void *)v10;
  }
  double v11 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v8 size:0.0];

  return v11;
}

void __61__SKUIContextActionsViewController__reloadViewsConfiguration__block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  *a3 = 1;
}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  uint64_t v8 = (void (**)(void))a5;
  if (a4)
  {
    char v11 = 0;
    (*((void (**)(id, id, char *))a4 + 2))(a4, a3, &v11);
    if (v11)
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __83__SKUIContextActionsViewController_interfaceAction_invokeActionHandler_completion___block_invoke;
      v9[3] = &unk_1E64238C0;
      uint64_t v10 = v8;
      [(SKUIContextActionsViewController *)self dismissViewControllerAnimated:1 completion:v9];
    }
    else if (v8)
    {
      v8[2](v8);
    }
  }
  else
  {
    [(SKUIContextActionsViewController *)self dismissViewControllerAnimated:1 completion:v8];
  }
}

uint64_t __83__SKUIContextActionsViewController_interfaceAction_invokeActionHandler_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)_transitionPresentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(SKUIContextActionsViewController *)self transitionPresentationController];

  if (!v8)
  {
    uint64_t v9 = [[SKUIContextActionsPresentationController alloc] initWithPresentedViewController:v6 presentingViewController:v7];
    [(SKUIContextActionsViewController *)self setTransitionPresentationController:v9];
  }
  uint64_t v10 = [(SKUIContextActionsViewController *)self transitionPresentationController];

  return v10;
}

- (id)animationControllerForDismissedController:(id)a3
{
  if ([(SKUIContextActionsViewController *)self isOrbPresentation]) {
    double v4 = self;
  }
  else {
    double v4 = 0;
  }

  return v4;
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  double v5 = (void *)MEMORY[0x1E4FB1EB0];
  [(SKUIContextActionsViewController *)self transitionDuration:v4];
  double v7 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__SKUIContextActionsViewController_animateTransition___block_invoke;
  v11[3] = &unk_1E6422020;
  v11[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__SKUIContextActionsViewController_animateTransition___block_invoke_2;
  v9[3] = &unk_1E64223D0;
  id v10 = v4;
  id v8 = v4;
  [v5 animateWithDuration:0 delay:v11 usingSpringWithDamping:v9 initialSpringVelocity:v7 options:0.0 animations:1.0 completion:0.0];
}

void __54__SKUIContextActionsViewController_animateTransition___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) transitionPresentationController];
  id v1 = (id)[v2 dismissalAnimations];
}

uint64_t __54__SKUIContextActionsViewController_animateTransition___block_invoke_2(uint64_t a1, int a2)
{
  id v2 = *(void **)(a1 + 32);
  if (a2) {
    uint64_t v3 = [*(id *)(a1 + 32) transitionWasCancelled] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return [v2 completeTransition:v3];
}

- (BOOL)isOrbPresentation
{
  return self->_orbPresentation;
}

- (void)setOrbPresentation:(BOOL)a3
{
  self->_orbPresentation = a3;
}

- (UIGestureRecognizer)systemProvidedGestureRecognzier
{
  return self->_systemProvidedGestureRecognzier;
}

- (void)setSystemProvidedGestureRecognzier:(id)a3
{
}

- (SKUIContextActionsPresentationController)transitionPresentationController
{
  return self->_transitionPresentationController;
}

- (void)setTransitionPresentationController:(id)a3
{
}

- (SKUIContextActionsConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (UIInterfaceActionGroupView)contextActionView
{
  return self->_contextActionView;
}

- (void)setContextActionView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIInterfaceActionGroupView)scrollableActionGroupView
{
  return self->_scrollableActionGroupView;
}

- (void)setScrollableActionGroupView:(id)a3
{
}

- (CGPoint)gestureRecognizerInitialLocation
{
  double x = self->_gestureRecognizerInitialLocation.x;
  double y = self->_gestureRecognizerInitialLocation.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setGestureRecognizerInitialLocation:(CGPoint)a3
{
  self->_gestureRecognizerInitialLocation = a3;
}

- (BOOL)hasAppliedSystemRecognizer
{
  return self->_appliedSystemRecognizer;
}

- (void)setAppliedSystemRecognizer:(BOOL)a3
{
  self->_appliedSystemRecognizer = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollableActionGroupView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_contextActionView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_transitionPresentationController, 0);

  objc_storeStrong((id *)&self->_systemProvidedGestureRecognzier, 0);
}

- (void)initWithConfiguration:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  id v1 = "-[SKUIContextActionsViewController initWithConfiguration:]";
}

@end