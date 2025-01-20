@interface SKUIReviewInAppRatingViewController
- (BOOL)disableSubmit;
- (NSMutableArray)constraints;
- (SKUIReviewInAppRatingHeaderView)headerView;
- (SKUIReviewInAppRatingViewController)initWithTitle:(id)a3 message:(id)a4 icon:(id)a5;
- (SKUIStarRatingControl)ratingControl;
- (UIInterfaceAction)ratingControlAction;
- (UIStackView)stackView;
- (UIVisualEffectView)backgroundView;
- (id)_actions;
- (id)_actionsLayoutAxesForCurrentState;
- (id)_buttonActionWithTitle:(id)a3 style:(unint64_t)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)completion;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)ratingHandler;
- (unint64_t)state;
- (void)_ratingControlChanged:(id)a3;
- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5;
- (void)reloadViewsConfiguration;
- (void)setBackgroundView:(id)a3;
- (void)setCompletion:(id)a3;
- (void)setConstraints:(id)a3;
- (void)setDisableSubmit:(BOOL)a3;
- (void)setHeaderView:(id)a3;
- (void)setRatingControl:(id)a3;
- (void)setRatingControlAction:(id)a3;
- (void)setRatingHandler:(id)a3;
- (void)setStackView:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation SKUIReviewInAppRatingViewController

- (SKUIReviewInAppRatingViewController)initWithTitle:(id)a3 message:(id)a4 icon:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SKUIReviewInAppRatingViewController;
  v11 = [(SKUIReviewInAppRatingViewController *)&v15 initWithNibName:0 bundle:0];
  if (v11)
  {
    v12 = [[SKUIReviewInAppRatingHeaderView alloc] initWithTitle:v8 message:v9 icon:v10];
    headerView = v11->_headerView;
    v11->_headerView = v12;

    v11->_state = 0;
    [(SKUIReviewInAppRatingViewController *)v11 setTransitioningDelegate:v11];
    [(SKUIReviewInAppRatingViewController *)v11 setModalPresentationStyle:4];
  }

  return v11;
}

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)SKUIReviewInAppRatingViewController;
  [(SKUIReviewInAppRatingViewController *)&v23 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4FB1F00]);
  v4 = [MEMORY[0x1E4FB14C8] effectWithStyle:8];
  v5 = (void *)[v3 initWithEffect:v4];
  [(SKUIReviewInAppRatingViewController *)self setBackgroundView:v5];

  v6 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  v7 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  [v7 _setContinuousCornerRadius:16.0];

  id v8 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  [v8 setClipsToBounds:1];

  id v9 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  [v9 setHidden:1];

  id v10 = [(SKUIReviewInAppRatingViewController *)self view];
  v11 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  [v10 addSubview:v11];

  id v12 = objc_alloc(MEMORY[0x1E4FB1C60]);
  v13 = (void *)[v12 initWithArrangedSubviews:MEMORY[0x1E4F1CBF0]];
  [(SKUIReviewInAppRatingViewController *)self setStackView:v13];

  v14 = [(SKUIReviewInAppRatingViewController *)self stackView];
  [v14 setAxis:1];

  objc_super v15 = [(SKUIReviewInAppRatingViewController *)self stackView];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  v16 = [(SKUIReviewInAppRatingViewController *)self view];
  v17 = [(SKUIReviewInAppRatingViewController *)self stackView];
  [v16 addSubview:v17];

  v18 = objc_alloc_init(SKUIReviewInAppRatingControlViewController);
  v19 = [(SKUIReviewInAppRatingControlViewController *)v18 ratingControl];
  [(SKUIReviewInAppRatingViewController *)self setRatingControl:v19];

  v20 = [(SKUIReviewInAppRatingViewController *)self ratingControl];
  [v20 addTarget:self action:sel__ratingControlChanged_ forControlEvents:4096];

  v21 = [MEMORY[0x1E4FB1858] actionWithCustomContentViewController:v18];
  [(SKUIReviewInAppRatingViewController *)self setRatingControlAction:v21];

  v22 = [(SKUIReviewInAppRatingViewController *)self ratingControlAction];
  [v22 setEnabled:0];
}

- (void)reloadViewsConfiguration
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28DC8];
  v4 = [(SKUIReviewInAppRatingViewController *)self constraints];
  [v3 deactivateConstraints:v4];

  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  v5 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v6 = [v5 arrangedSubviews];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v138 objects:v147 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v139;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v139 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v138 + 1) + 8 * i);
        id v12 = [(SKUIReviewInAppRatingViewController *)self stackView];
        [v12 setSpacing:0.0];

        v13 = [(SKUIReviewInAppRatingViewController *)self stackView];
        [v13 removeArrangedSubview:v11];

        [v11 removeFromSuperview];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v138 objects:v147 count:16];
    }
    while (v8);
  }

  v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  constraints = self->_constraints;
  self->_constraints = v14;

  if ([(SKUIReviewInAppRatingViewController *)self state] == 2)
  {
    uint64_t v16 = MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v17 = [(SKUIReviewInAppRatingViewController *)self ratingControlAction];
    v146 = v17;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v146 count:1];
  }
  v130 = (void *)v16;
  v129 = [MEMORY[0x1E4FB1860] actionGroupWithActions:v16];
  v18 = (void *)[objc_alloc(MEMORY[0x1E4FB1868]) initWithActionGroup:v129 actionHandlerInvocationDelegate:self];
  v19 = [(SKUIReviewInAppRatingViewController *)self headerView];
  [v18 insertArrangedHeaderView:v19 atIndex:0 scrollable:0];

  v128 = [(SKUIReviewInAppRatingViewController *)self _actions];
  v127 = [MEMORY[0x1E4FB1860] actionGroupWithActions:v128];
  v20 = (void *)[objc_alloc(MEMORY[0x1E4FB1868]) initWithActionGroup:v127 actionHandlerInvocationDelegate:self];
  v21 = [(SKUIReviewInAppRatingViewController *)self _actionsLayoutAxesForCurrentState];
  [v20 setAllowedActionLayoutAxisByPriority:v21];

  id v22 = objc_alloc(MEMORY[0x1E4FB1EB0]);
  double v23 = *MEMORY[0x1E4F1DB28];
  double v24 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v25 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v26 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v27 = objc_msgSend(v22, "initWithFrame:", *MEMORY[0x1E4F1DB28], v24, v25, v26);
  v28 = [(SKUIReviewInAppRatingViewController *)self constraints];
  v126 = v27;
  v29 = [v27 heightAnchor];
  v30 = [v29 constraintEqualToConstant:10.0];
  [v28 addObject:v30];

  [v20 insertArrangedHeaderView:v27 atIndex:0 scrollable:0];
  v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1EB0]), "initWithFrame:", v23, v24, v25, v26);
  [v31 setTranslatesAutoresizingMaskIntoConstraints:0];
  v32 = [(SKUIReviewInAppRatingViewController *)self stackView];
  [v32 addArrangedSubview:v31];

  [v18 _setContinuousCornerRadius:16.0];
  [v18 setClipsToBounds:1];
  v33 = [v18 layer];
  [v33 setMaskedCorners:3];

  [v18 _setDrawsBackground:0];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  v145 = v20;
  v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v145 count:1];
  [v18 setSimultaneouslyPresentedGroupViews:v34];

  [v31 addSubview:v18];
  [v20 _setContinuousCornerRadius:16.0];
  [v20 setClipsToBounds:1];
  v35 = [v20 layer];
  [v35 setMaskedCorners:12];

  [v20 _setDrawsBackground:0];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  v144 = v18;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v144 count:1];
  [v20 setSimultaneouslyPresentedGroupViews:v36];

  [v31 addSubview:v20];
  v135 = [(SKUIReviewInAppRatingViewController *)self constraints];
  v133 = [v18 topAnchor];
  v131 = [v31 topAnchor];
  v122 = [v133 constraintEqualToAnchor:v131];
  v143[0] = v122;
  v120 = [v18 leftAnchor];
  v118 = [v31 leftAnchor];
  v116 = [v120 constraintEqualToAnchor:v118];
  v143[1] = v116;
  v125 = v18;
  v114 = [v18 rightAnchor];
  v112 = [v31 rightAnchor];
  v110 = [v114 constraintEqualToAnchor:v112];
  v143[2] = v110;
  v108 = [v20 topAnchor];
  v106 = [v18 bottomAnchor];
  v104 = [v108 constraintEqualToAnchor:v106 constant:-10.0];
  v143[3] = v104;
  v102 = [v20 rightAnchor];
  v37 = [v31 rightAnchor];
  v38 = [v102 constraintEqualToAnchor:v37];
  v143[4] = v38;
  v124 = v20;
  v39 = [v20 leftAnchor];
  v137 = v31;
  v40 = [v31 leftAnchor];
  v41 = [v39 constraintEqualToAnchor:v40];
  v143[5] = v41;
  v42 = [v20 bottomAnchor];
  v43 = [v31 bottomAnchor];
  v44 = [v42 constraintEqualToAnchor:v43];
  v143[6] = v44;
  v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v143 count:7];
  [v135 addObjectsFromArray:v45];

  v46 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v47 = [v46 centerYAnchor];
  v48 = [(SKUIReviewInAppRatingViewController *)self view];
  v49 = [v48 centerYAnchor];
  v136 = [v47 constraintEqualToAnchor:v49 constant:-10.0];

  LODWORD(v50) = 1140457472;
  [v136 setPriority:v50];
  v51 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v52 = [v51 centerYAnchor];
  v53 = [(SKUIReviewInAppRatingViewController *)self view];
  v54 = [v53 centerYAnchor];
  v134 = [v52 constraintGreaterThanOrEqualToAnchor:v54 constant:-10.0];

  v55 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v56 = [v55 centerYAnchor];
  v57 = [(SKUIReviewInAppRatingViewController *)self view];
  v58 = [v57 centerYAnchor];
  v121 = [v56 constraintLessThanOrEqualToAnchor:v58 constant:0.0];

  v59 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v60 = [v59 centerXAnchor];
  v61 = [(SKUIReviewInAppRatingViewController *)self view];
  v62 = [v61 centerXAnchor];
  v119 = [v60 constraintEqualToAnchor:v62];

  v63 = [(SKUIReviewInAppRatingViewController *)self view];
  v64 = [v63 layoutMarginsGuide];
  v117 = [v64 leadingAnchor];

  v65 = [(SKUIReviewInAppRatingViewController *)self view];
  v66 = [v65 layoutMarginsGuide];
  v111 = [v66 trailingAnchor];

  v67 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v68 = [v67 topAnchor];
  v69 = [(SKUIReviewInAppRatingViewController *)self view];
  v70 = [v69 topAnchor];
  v71 = [v68 constraintGreaterThanOrEqualToAnchor:v70 constant:10.0];

  LODWORD(v72) = 1148829696;
  v123 = v71;
  [v71 setPriority:v72];
  v73 = [(SKUIReviewInAppRatingViewController *)self constraints];
  [v73 addObject:v71];

  v74 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  [v74 setHidden:0];

  v132 = [(SKUIReviewInAppRatingViewController *)self constraints];
  v142[0] = v136;
  v142[1] = v134;
  v142[2] = v121;
  v142[3] = v119;
  v115 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v113 = [v115 widthAnchor];
  v109 = [v113 constraintEqualToConstant:270.0];
  v142[4] = v109;
  v107 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v105 = [v107 leadingAnchor];
  v103 = [v105 constraintGreaterThanOrEqualToAnchor:v117];
  v142[5] = v103;
  v101 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v100 = [v101 trailingAnchor];
  v99 = [v100 constraintLessThanOrEqualToAnchor:v111];
  v142[6] = v99;
  v98 = [(SKUIReviewInAppRatingViewController *)self stackView];
  v96 = [v98 bottomAnchor];
  v97 = [(SKUIReviewInAppRatingViewController *)self view];
  v95 = [v97 bottomAnchor];
  v94 = [v96 constraintLessThanOrEqualToAnchor:v95];
  v142[7] = v94;
  v93 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  v92 = [v93 centerYAnchor];
  v91 = [v137 centerYAnchor];
  v90 = [v92 constraintEqualToAnchor:v91];
  v142[8] = v90;
  v89 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  v88 = [v89 centerXAnchor];
  v87 = [v137 centerXAnchor];
  v86 = [v88 constraintEqualToAnchor:v87];
  v142[9] = v86;
  v75 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  v76 = [v75 widthAnchor];
  v77 = [v137 widthAnchor];
  v78 = [v76 constraintEqualToAnchor:v77];
  v142[10] = v78;
  v79 = [(SKUIReviewInAppRatingViewController *)self backgroundView];
  v80 = [v79 heightAnchor];
  v81 = [v137 heightAnchor];
  v82 = [v80 constraintEqualToAnchor:v81];
  v142[11] = v82;
  v83 = [MEMORY[0x1E4F1C978] arrayWithObjects:v142 count:12];
  [v132 addObjectsFromArray:v83];

  v84 = (void *)MEMORY[0x1E4F28DC8];
  v85 = [(SKUIReviewInAppRatingViewController *)self constraints];
  [v84 activateConstraints:v85];
}

- (void)_ratingControlChanged:(id)a3
{
}

- (void)setState:(unint64_t)a3
{
  if (self->_state == a3) {
    return;
  }
  if (a3 < 2)
  {
    v5 = [(SKUIReviewInAppRatingViewController *)self headerView];
    [v5 setCompleted:0];
LABEL_6:

    goto LABEL_7;
  }
  if (a3 == 2)
  {
    v5 = [(SKUIReviewInAppRatingViewController *)self headerView];
    v6 = [(SKUIReviewInAppRatingViewController *)self ratingControl];
    objc_msgSend(v5, "setCompletedWithRating:", objc_msgSend(v6, "userRating"));

    goto LABEL_6;
  }
LABEL_7:
  self->_state = a3;

  [(SKUIReviewInAppRatingViewController *)self reloadViewsConfiguration];
}

- (id)_actions
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke;
  aBlock[3] = &unk_1E6428568;
  objc_copyWeak(&v40, &location);
  v4 = _Block_copy(aBlock);
  unint64_t state = self->_state;
  if (state == 2)
  {
    v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v19 = [v18 localizedStringForKey:@"IN_APP_REVIEW_ACTION_WRITE_REVIEW" value:&stru_1F1C879E8 table:0];
    uint64_t v8 = [(SKUIReviewInAppRatingViewController *)self _buttonActionWithTitle:v19 style:1];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_6;
    v32[3] = &unk_1E64238C0;
    id v20 = v4;
    v32[4] = v20;
    [v8 setAfterDismissHandler:v32];
    v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v22 = [v21 localizedStringForKey:@"IN_APP_REVIEW_ACTION_OK" value:&stru_1F1C879E8 table:0];
    objc_super v15 = [(SKUIReviewInAppRatingViewController *)self _buttonActionWithTitle:v22 style:0];

    uint64_t v27 = MEMORY[0x1E4F143A8];
    uint64_t v28 = 3221225472;
    v29 = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_7;
    v30 = &unk_1E64238C0;
    id v31 = v20;
    [v15 setAfterDismissHandler:&v27];
    v42[0] = v8;
    v42[1] = v15;
    double v23 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v42, 2, v27, v28, v29, v30);
    [v3 addObjectsFromArray:v23];

    double v24 = v32;
LABEL_10:
    uint64_t v9 = (id *)(v24 + 4);

    goto LABEL_11;
  }
  if (state == 1)
  {
    id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"IN_APP_REVIEW_ACTION_CANCEL" value:&stru_1F1C879E8 table:0];
    uint64_t v8 = [(SKUIReviewInAppRatingViewController *)self _buttonActionWithTitle:v11 style:0];

    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_3;
    v36[3] = &unk_1E64238C0;
    id v12 = v4;
    v36[4] = v12;
    [v8 setAfterDismissHandler:v36];
    v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"IN_APP_REVIEW_ACTION_SUBMIT" value:&stru_1F1C879E8 table:0];
    objc_super v15 = [(SKUIReviewInAppRatingViewController *)self _buttonActionWithTitle:v14 style:1];

    objc_msgSend(v15, "setEnabled:", -[SKUIReviewInAppRatingViewController disableSubmit](self, "disableSubmit") ^ 1);
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_4;
    v33[3] = &unk_1E6428850;
    objc_copyWeak(&v35, &location);
    id v34 = v12;
    [v15 setBeforeDismissHandler:v33];
    uint64_t v16 = [(SKUIReviewInAppRatingViewController *)self view];
    LODWORD(v12) = [v16 effectiveUserInterfaceLayoutDirection] == 1;

    if (v12)
    {
      v44[0] = v15;
      v44[1] = v8;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:2];
    }
    else
    {
      v43[0] = v8;
      v43[1] = v15;
      [MEMORY[0x1E4F1C978] arrayWithObjects:v43 count:2];
    v17 = };
    [v3 addObjectsFromArray:v17];

    objc_destroyWeak(&v35);
    double v24 = v36;
    goto LABEL_10;
  }
  if (state) {
    goto LABEL_12;
  }
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = [v6 localizedStringForKey:@"IN_APP_REVIEW_ACTION_NOT_NOW" value:&stru_1F1C879E8 table:0];
  uint64_t v8 = [(SKUIReviewInAppRatingViewController *)self _buttonActionWithTitle:v7 style:0];

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_2;
  v37[3] = &unk_1E64238C0;
  id v38 = v4;
  [v8 setAfterDismissHandler:v37];
  [v3 addObject:v8];
  uint64_t v9 = &v38;
LABEL_11:

LABEL_12:
  double v25 = (void *)[v3 copy];

  objc_destroyWeak(&v40);
  objc_destroyWeak(&location);

  return v25;
}

void __47__SKUIReviewInAppRatingViewController__actions__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained completion];

  if (v3)
  {
    v4 = [WeakRetained completion];
    v4[2](v4, a2);
  }
}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __47__SKUIReviewInAppRatingViewController__actions__block_invoke_4(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = [WeakRetained ratingControl];
  uint64_t v8 = [v7 userRating];

  uint64_t v9 = [WeakRetained ratingHandler];

  if (v9 && v8 >= 1)
  {
    [v5 setEnabled:0];
    id v10 = [WeakRetained ratingControl];
    [v10 setEnabled:0];

    v11 = [WeakRetained ratingHandler];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __47__SKUIReviewInAppRatingViewController__actions__block_invoke_5;
    v12[3] = &unk_1E6428760;
    id v13 = v5;
    id v14 = WeakRetained;
    id v15 = *(id *)(a1 + 32);
    ((void (**)(void, uint64_t, void *))v11)[2](v11, v8, v12);
  }
  *a3 = 0;
}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_5(uint64_t a1, int a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setEnabled:", objc_msgSend(*(id *)(a1 + 40), "disableSubmit") ^ 1);
  v4 = [*(id *)(a1 + 40) ratingControl];
  [v4 setEnabled:1];

  if (a2)
  {
    id v5 = *(void **)(a1 + 40);
    return [v5 setState:2];
  }
  else
  {
    uint64_t v7 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return v7();
  }
}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __47__SKUIReviewInAppRatingViewController__actions__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_buttonActionWithTitle:(id)a3 style:(unint64_t)a4
{
  id v5 = a3;
  v6 = [[SKUIReviewInAppRatingButtonViewController alloc] initWithTitle:v5 style:a4];

  uint64_t v7 = +[SKUIReviewInAppRatingAction actionWithCustomContentViewController:v6];

  return v7;
}

- (id)_actionsLayoutAxesForCurrentState
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = v3;
  unint64_t state = self->_state;
  if (state <= 2) {
    [v3 addObject:qword_1E6428870[state]];
  }
  v6 = (void *)[v4 copy];

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [[SKUIReviewInAppRatingPresentationController alloc] initWithPresentedViewController:v7 presentingViewController:v6];

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6 = objc_alloc_init(SKUIReviewInAppRatingAnimatedTransitioning);
  [(SKUIReviewInAppRatingAnimatedTransitioning *)v6 setViewController:self];
  [(SKUIReviewInAppRatingAnimatedTransitioning *)v6 setPresentation:1];

  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  v4 = objc_alloc_init(SKUIReviewInAppRatingAnimatedTransitioning);
  [(SKUIReviewInAppRatingAnimatedTransitioning *)v4 setViewController:self];
  [(SKUIReviewInAppRatingAnimatedTransitioning *)v4 setPresentation:0];

  return v4;
}

- (void)interfaceAction:(id)a3 invokeActionHandler:(id)a4 completion:(id)a5
{
  id v7 = a3;
  uint64_t v8 = (void (**)(void))a5;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    char v14 = 1;
    id v10 = [v9 beforeDismissHandler];

    if (!v10
      || ([v9 beforeDismissHandler],
          v11 = (void (**)(void, void, void))objc_claimAutoreleasedReturnValue(),
          ((void (**)(void, id, char *))v11)[2](v11, v9, &v14),
          v11,
          v14))
    {
      id v12 = [v9 afterDismissHandler];
      if (v12)
      {
        id v13 = [v9 afterDismissHandler];
        [(SKUIReviewInAppRatingViewController *)self dismissViewControllerAnimated:1 completion:v13];
      }
      else
      {
        [(SKUIReviewInAppRatingViewController *)self dismissViewControllerAnimated:1 completion:0];
      }
    }
  }
  else
  {
    v8[2](v8);
  }
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)ratingHandler
{
  return self->_ratingHandler;
}

- (void)setRatingHandler:(id)a3
{
}

- (BOOL)disableSubmit
{
  return self->_disableSubmit;
}

- (void)setDisableSubmit:(BOOL)a3
{
  self->_disableSubmit = a3;
}

- (UIVisualEffectView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (NSMutableArray)constraints
{
  return self->_constraints;
}

- (void)setConstraints:(id)a3
{
}

- (SKUIReviewInAppRatingHeaderView)headerView
{
  return self->_headerView;
}

- (void)setHeaderView:(id)a3
{
}

- (unint64_t)state
{
  return self->_state;
}

- (UIInterfaceAction)ratingControlAction
{
  return self->_ratingControlAction;
}

- (void)setRatingControlAction:(id)a3
{
}

- (SKUIStarRatingControl)ratingControl
{
  return self->_ratingControl;
}

- (void)setRatingControl:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ratingControl, 0);
  objc_storeStrong((id *)&self->_ratingControlAction, 0);
  objc_storeStrong((id *)&self->_headerView, 0);
  objc_storeStrong((id *)&self->_constraints, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong(&self->_ratingHandler, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end