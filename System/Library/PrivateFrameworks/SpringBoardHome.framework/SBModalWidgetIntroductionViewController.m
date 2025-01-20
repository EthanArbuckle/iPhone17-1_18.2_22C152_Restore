@interface SBModalWidgetIntroductionViewController
- (CATransform3D)appliedSublayerTransform;
- (CATransform3D)homeScreenPreviewSublayerTransform;
- (CATransform3D)onboardingFallingWidgetPreviewSublayerTransformBottom;
- (CATransform3D)onboardingFallingWidgetPreviewSublayerTransformMiddle;
- (CATransform3D)onboardingFallingWidgetPreviewSublayerTransformTop;
- (CGPoint)onboardingFallingWidgetCenterPoint;
- (CGPoint)onboardingStaticWidgetCenterPoint;
- (CGRect)onboardingFallingWidgetBounds;
- (CGRect)onboardingStaticWidgetBounds;
- (NSArray)onboardingFallingWidgetPreviews;
- (NSArray)onboardingStaticWidgetPreviews;
- (NSLayoutConstraint)continueButtonTopAnchorConstraint;
- (NSMutableArray)dismissCompletions;
- (SBModalWidgetIntroductionBackgroundDescriptionView)backgroundDescriptionView;
- (SBModalWidgetIntroductionHomeScreenPreview)homescreenPreview;
- (UIButton)continueButton;
- (UIImageView)homescreenPreviewSnapshot;
- (UIView)homescreenPreviewContainer;
- (UIView)onboardingFallingWidgetPreviewBottom;
- (UIView)onboardingFallingWidgetPreviewMiddle;
- (UIView)onboardingFallingWidgetPreviewTop;
- (UIView)onboardingStaticWidgetPreview;
- (UIView)onboardingWidgetPreviewsContainer;
- (void)addContinueButton;
- (void)appendDismissCompletion:(id)a3;
- (void)cleanUpForViewControllerDismissal;
- (void)dismissPreviewAndButton;
- (void)displayPreviewAndButton;
- (void)loadPreviewSnapshot;
- (void)loadView;
- (void)setAppliedSublayerTransform:(CATransform3D *)a3;
- (void)setBackgroundDescriptionView:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setContinueButtonTopAnchorConstraint:(id)a3;
- (void)setDismissCompletions:(id)a3;
- (void)setHomeScreenPreview:(id)a3;
- (void)setHomeScreenPreviewSublayerTransform:(CATransform3D *)a3;
- (void)setHomescreenPreview:(id)a3;
- (void)setHomescreenPreviewContainer:(id)a3;
- (void)setHomescreenPreviewSnapshot:(id)a3;
- (void)setOnboardingFallingWidgetBounds:(CGRect)a3;
- (void)setOnboardingFallingWidgetCenterPoint:(CGPoint)a3;
- (void)setOnboardingFallingWidgetPreviewBottom:(id)a3;
- (void)setOnboardingFallingWidgetPreviewMiddle:(id)a3;
- (void)setOnboardingFallingWidgetPreviewSublayerTransformBottom:(CATransform3D *)a3;
- (void)setOnboardingFallingWidgetPreviewSublayerTransformMiddle:(CATransform3D *)a3;
- (void)setOnboardingFallingWidgetPreviewSublayerTransformTop:(CATransform3D *)a3;
- (void)setOnboardingFallingWidgetPreviewTop:(id)a3;
- (void)setOnboardingFallingWidgetPreviews:(id)a3;
- (void)setOnboardingStaticWidgetBounds:(CGRect)a3;
- (void)setOnboardingStaticWidgetCenterPoint:(CGPoint)a3;
- (void)setOnboardingStaticWidgetPreview:(id)a3;
- (void)setOnboardingStaticWidgetPreviews:(id)a3;
- (void)setOnboardingWidgetPreviewsContainer:(id)a3;
- (void)setupSublayerDismissPreviewTransformForView:(id)a3 withTransform:(CATransform3D *)a4;
- (void)setupSublayerDisplayPreviewTransformForView:(id)a3 withTransform:(CATransform3D *)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation SBModalWidgetIntroductionViewController

- (void)appendDismissCompletion:(id)a3
{
  id v4 = a3;
  id v10 = v4;
  if (self->_dismissCompletions)
  {
    if (!v4) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v8 = [MEMORY[0x1E4F1CA48] array];
  dismissCompletions = self->_dismissCompletions;
  self->_dismissCompletions = v8;

  id v4 = v10;
  if (v10)
  {
LABEL_3:
    v5 = [(SBModalWidgetIntroductionViewController *)self dismissCompletions];
    v6 = (void *)[v10 copy];
    v7 = _Block_copy(v6);
    [v5 addObject:v7];

    id v4 = v10;
  }
LABEL_4:
}

- (void)setHomeScreenPreview:(id)a3
{
  objc_storeStrong((id *)&self->_homescreenPreview, a3);
  [(SBModalWidgetIntroductionViewController *)self loadPreviewSnapshot];
}

- (void)addContinueButton
{
  v33[4] = *MEMORY[0x1E4F143B8];
  if (!self->_continueButton)
  {
    v3 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    continueButton = self->_continueButton;
    self->_continueButton = v3;

    [(UIButton *)self->_continueButton _setContinuousCornerRadius:14.0];
    [(UIButton *)self->_continueButton setClipsToBounds:1];
    v5 = self->_continueButton;
    v6 = SBHBundle();
    v7 = [v6 localizedStringForKey:@"MODAL_WIDGET_DISCOVERABILITY_CONTINUE" value:&stru_1F2FA0300 table:@"SpringBoardHome"];
    [(UIButton *)v5 setTitle:v7 forState:0];

    v8 = [(UIButton *)self->_continueButton titleLabel];
    v9 = [MEMORY[0x1E4FB08E0] systemFontOfSize:18.0 weight:*MEMORY[0x1E4FB09E0]];
    [v8 setFont:v9];

    id v10 = [(UIButton *)self->_continueButton titleLabel];
    [v10 setAdjustsFontSizeToFitWidth:1];

    v11 = self->_continueButton;
    v12 = [MEMORY[0x1E4FB1618] systemBlueColor];
    [(UIButton *)v11 setTitleColor:v12 forState:0];

    [(UIButton *)self->_continueButton setAccessibilityIdentifier:@"SBWidgetIntroductionButton-Continue"];
    v13 = [(SBModalWidgetIntroductionViewController *)self view];
    [v13 addSubview:self->_continueButton];

    [(UIButton *)self->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(UIButton *)self->_continueButton topAnchor];
    v15 = [(SBModalWidgetIntroductionViewController *)self view];
    v16 = [v15 bottomAnchor];
    v17 = [v14 constraintEqualToAnchor:v16 constant:0.0];
    continueButtonTopAnchorConstraint = self->_continueButtonTopAnchorConstraint;
    self->_continueButtonTopAnchorConstraint = v17;

    v31 = (void *)MEMORY[0x1E4F28DC8];
    v32 = [(UIButton *)self->_continueButton centerXAnchor];
    v19 = [(SBModalWidgetIntroductionViewController *)self view];
    v20 = [v19 centerXAnchor];
    v21 = [v32 constraintEqualToAnchor:v20];
    v22 = self->_continueButtonTopAnchorConstraint;
    v33[0] = v21;
    v33[1] = v22;
    v23 = [(UIButton *)self->_continueButton widthAnchor];
    v24 = [v23 constraintEqualToConstant:300.0];
    v33[2] = v24;
    v25 = [(UIButton *)self->_continueButton heightAnchor];
    v26 = [v25 constraintEqualToConstant:54.0];
    v33[3] = v26;
    v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:4];
    [v31 activateConstraints:v27];

    [(UIButton *)self->_continueButton addTarget:self action:sel_continueButtonTapped_ forControlEvents:64];
    v28 = [MEMORY[0x1E4FB14C8] effectWithStyle:7];
    v29 = (void *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v28];
    [v29 setUserInteractionEnabled:0];
    [(UIButton *)self->_continueButton insertSubview:v29 atIndex:0];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v30 = SBHPinViewWithinView(self->_continueButton, v29);
  }
}

- (void)loadPreviewSnapshot
{
  if (!self->_homescreenPreviewContainer)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    homescreenPreviewContainer = self->_homescreenPreviewContainer;
    self->_homescreenPreviewContainer = v3;

    v5 = self->_homescreenPreviewContainer;
    v6 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(UIView *)self->_homescreenPreviewContainer _setContinuousCornerRadius:40.0];
    [(UIView *)self->_homescreenPreviewContainer setClipsToBounds:1];
    v7 = [(SBModalWidgetIntroductionViewController *)self view];
    [v7 addSubview:self->_homescreenPreviewContainer];

    [(UIView *)self->_homescreenPreviewContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = self->_homescreenPreviewContainer;
    v9 = [(SBModalWidgetIntroductionViewController *)self view];
    id v10 = SBHPinViewWithinView(v8, v9);
  }
  v11 = [(SBModalWidgetIntroductionViewController *)self homescreenPreview];

  if (v11 && !self->_homescreenPreviewSnapshot)
  {
    id v12 = objc_alloc(MEMORY[0x1E4FB1838]);
    v13 = [(SBModalWidgetIntroductionViewController *)self homescreenPreview];
    v14 = [v13 snapshot];
    v15 = (UIImageView *)[v12 initWithImage:v14];
    homescreenPreviewSnapshot = self->_homescreenPreviewSnapshot;
    self->_homescreenPreviewSnapshot = v15;

    [(UIImageView *)self->_homescreenPreviewSnapshot _setContinuousCornerRadius:40.0];
    [(UIImageView *)self->_homescreenPreviewSnapshot setClipsToBounds:1];
    [(UIView *)self->_homescreenPreviewContainer addSubview:self->_homescreenPreviewSnapshot];
    [(UIImageView *)self->_homescreenPreviewSnapshot setTranslatesAutoresizingMaskIntoConstraints:0];
    id v17 = SBHPinViewWithinView(self->_homescreenPreviewSnapshot, self->_homescreenPreviewContainer);
  }
  if (!self->_onboardingWidgetPreviewsContainer)
  {
    v18 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    onboardingWidgetPreviewsContainer = self->_onboardingWidgetPreviewsContainer;
    self->_onboardingWidgetPreviewsContainer = v18;

    v20 = self->_onboardingWidgetPreviewsContainer;
    v21 = [MEMORY[0x1E4FB1618] clearColor];
    [(UIView *)v20 setBackgroundColor:v21];

    [(UIView *)self->_onboardingWidgetPreviewsContainer _setContinuousCornerRadius:40.0];
    [(UIView *)self->_homescreenPreviewContainer addSubview:self->_onboardingWidgetPreviewsContainer];
    [(UIView *)self->_onboardingWidgetPreviewsContainer setTranslatesAutoresizingMaskIntoConstraints:0];
    id v22 = SBHPinViewWithinView(self->_onboardingWidgetPreviewsContainer, self->_homescreenPreviewContainer);
    v23 = [(SBModalWidgetIntroductionViewController *)self onboardingStaticWidgetPreviews];
    v24 = [v23 firstObject];
    onboardingStaticWidgetPreview = self->_onboardingStaticWidgetPreview;
    self->_onboardingStaticWidgetPreview = v24;

    [(UIView *)self->_onboardingWidgetPreviewsContainer addSubview:self->_onboardingStaticWidgetPreview];
    v26 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviews];
    uint64_t v27 = [v26 count];

    if (v27)
    {
      if (v27 == 1)
      {
        v31 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviews];
        v32 = v31;
        uint64_t v33 = 0;
        goto LABEL_12;
      }
      if (v27 == 2)
      {
        v28 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviews];
        v29 = [v28 objectAtIndexedSubscript:0];
        onboardingFallingWidgetPreviewMiddle = self->_onboardingFallingWidgetPreviewMiddle;
        self->_onboardingFallingWidgetPreviewMiddle = v29;

        [(UIView *)self->_onboardingWidgetPreviewsContainer insertSubview:self->_onboardingFallingWidgetPreviewMiddle atIndex:0];
        v31 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviews];
        v32 = v31;
        uint64_t v33 = 1;
LABEL_12:
        v34 = [v31 objectAtIndexedSubscript:v33];
        onboardingFallingWidgetPreviewBottom = self->_onboardingFallingWidgetPreviewBottom;
        self->_onboardingFallingWidgetPreviewBottom = v34;

        [(UIView *)self->_onboardingWidgetPreviewsContainer insertSubview:self->_onboardingFallingWidgetPreviewBottom atIndex:0];
        goto LABEL_18;
      }
      unint64_t v36 = 0;
      while (1)
      {
        v37 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviews];
        v38 = [v37 objectAtIndexedSubscript:v36];

        if (v36 > 2) {
          break;
        }
        v39 = (id *)((char *)&self->super.super.super.isa + *off_1E6AB3198[v36]);
        objc_storeStrong(v39, v38);
        [(UIView *)self->_onboardingWidgetPreviewsContainer insertSubview:*v39 atIndex:0];

        if (v27 == ++v36) {
          goto LABEL_18;
        }
      }
    }
  }
LABEL_18:
  v40 = [(SBModalWidgetIntroductionViewController *)self backgroundDescriptionView];

  if (v40)
  {
    v41 = [(SBModalWidgetIntroductionViewController *)self view];
    v42 = [(SBModalWidgetIntroductionViewController *)self backgroundDescriptionView];
    [v41 sendSubviewToBack:v42];
  }
  v43 = [(SBModalWidgetIntroductionViewController *)self continueButton];

  if (v43)
  {
    v44 = [(SBModalWidgetIntroductionViewController *)self view];
    v45 = [(SBModalWidgetIntroductionViewController *)self continueButton];
    [v44 bringSubviewToFront:v45];
  }
  id v46 = [(SBModalWidgetIntroductionViewController *)self view];
  [v46 layoutIfNeeded];
}

- (void)loadView
{
  v8.receiver = self;
  v8.super_class = (Class)SBModalWidgetIntroductionViewController;
  [(SBModalWidgetIntroductionViewController *)&v8 loadView];
  v3 = [SBModalWidgetIntroductionBackgroundDescriptionView alloc];
  id v4 = [(SBModalWidgetIntroductionViewController *)self view];
  [v4 bounds];
  v5 = -[SBModalWidgetIntroductionBackgroundDescriptionView initWithFrame:withOwner:](v3, "initWithFrame:withOwner:", self);
  backgroundDescriptionView = self->_backgroundDescriptionView;
  self->_backgroundDescriptionView = v5;

  v7 = [(SBModalWidgetIntroductionViewController *)self view];
  [v7 addSubview:self->_backgroundDescriptionView];

  [(SBModalWidgetIntroductionViewController *)self loadPreviewSnapshot];
  [(SBModalWidgetIntroductionViewController *)self addContinueButton];
}

- (void)viewDidLayoutSubviews
{
  v39.receiver = self;
  v39.super_class = (Class)SBModalWidgetIntroductionViewController;
  [(SBModalWidgetIntroductionViewController *)&v39 viewDidLayoutSubviews];
  [(SBModalWidgetIntroductionViewController *)self onboardingStaticWidgetCenterPoint];
  double v35 = v4;
  double v36 = v3;
  [(SBModalWidgetIntroductionViewController *)self onboardingStaticWidgetBounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetCenterPoint];
  double v37 = v14;
  double v38 = v13;
  [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetBounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v23 = [(SBModalWidgetIntroductionViewController *)self onboardingStaticWidgetPreview];

  if (v23)
  {
    v24 = [(SBModalWidgetIntroductionViewController *)self onboardingStaticWidgetPreview];
    objc_msgSend(v24, "setBounds:", v6, v8, v10, v12);

    v25 = [(SBModalWidgetIntroductionViewController *)self onboardingStaticWidgetPreview];
    objc_msgSend(v25, "setCenter:", v36, v35);
  }
  v26 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewTop];

  if (v26)
  {
    uint64_t v27 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewTop];
    objc_msgSend(v27, "setBounds:", v16, v18, v20, v22);

    v28 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewTop];
    objc_msgSend(v28, "setCenter:", v38, v37);
  }
  v29 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewMiddle];

  if (v29)
  {
    id v30 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewMiddle];
    objc_msgSend(v30, "setBounds:", v16, v18, v20, v22);

    v31 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewMiddle];
    objc_msgSend(v31, "setCenter:", v38, v37);
  }
  v32 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewBottom];

  if (v32)
  {
    uint64_t v33 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewBottom];
    objc_msgSend(v33, "setBounds:", v16, v18, v20, v22);

    v34 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewBottom];
    objc_msgSend(v34, "setCenter:", v38, v37);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBModalWidgetIntroductionViewController;
  [(SBModalWidgetIntroductionViewController *)&v4 viewDidDisappear:a3];
  [(SBModalWidgetIntroductionViewController *)self cleanUpForViewControllerDismissal];
}

- (void)setupSublayerDisplayPreviewTransformForView:(id)a3 withTransform:(CATransform3D *)a4
{
  double v5 = (void *)MEMORY[0x1E4F39B48];
  id v6 = a3;
  double v7 = [v5 animationWithKeyPath:@"sublayerTransform"];
  double v8 = (void *)MEMORY[0x1E4F29238];
  CATransform3DMakeTranslation(&v29, 0.0, 0.0, 0.0);
  double v9 = [v8 valueWithCATransform3D:&v29];
  [v7 setFromValue:v9];

  long long v10 = *(_OWORD *)&a4->m33;
  long long v25 = *(_OWORD *)&a4->m31;
  long long v26 = v10;
  long long v11 = *(_OWORD *)&a4->m43;
  long long v27 = *(_OWORD *)&a4->m41;
  long long v28 = v11;
  long long v12 = *(_OWORD *)&a4->m13;
  long long v21 = *(_OWORD *)&a4->m11;
  long long v22 = v12;
  long long v13 = *(_OWORD *)&a4->m23;
  long long v23 = *(_OWORD *)&a4->m21;
  long long v24 = v13;
  double v14 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v21];
  [v7 setToValue:v14];

  double v15 = [v6 layer];
  long long v16 = *(_OWORD *)&a4->m33;
  long long v25 = *(_OWORD *)&a4->m31;
  long long v26 = v16;
  long long v17 = *(_OWORD *)&a4->m43;
  long long v27 = *(_OWORD *)&a4->m41;
  long long v28 = v17;
  long long v18 = *(_OWORD *)&a4->m13;
  long long v21 = *(_OWORD *)&a4->m11;
  long long v22 = v18;
  long long v19 = *(_OWORD *)&a4->m23;
  long long v23 = *(_OWORD *)&a4->m21;
  long long v24 = v19;
  [v15 setSublayerTransform:&v21];

  double v20 = [v6 layer];

  [v20 addAnimation:v7 forKey:@"sublayerTransform"];
}

- (void)setupSublayerDismissPreviewTransformForView:(id)a3 withTransform:(CATransform3D *)a4
{
  double v5 = (void *)MEMORY[0x1E4F39B48];
  id v6 = a3;
  double v7 = [v5 animationWithKeyPath:@"sublayerTransform"];
  long long v8 = *(_OWORD *)&a4->m33;
  long long v28 = *(_OWORD *)&a4->m31;
  long long v29 = v8;
  long long v9 = *(_OWORD *)&a4->m43;
  long long v30 = *(_OWORD *)&a4->m41;
  long long v31 = v9;
  long long v10 = *(_OWORD *)&a4->m13;
  long long v24 = *(_OWORD *)&a4->m11;
  long long v25 = v10;
  long long v11 = *(_OWORD *)&a4->m23;
  long long v26 = *(_OWORD *)&a4->m21;
  long long v27 = v11;
  long long v12 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v24];
  [v7 setFromValue:v12];

  long long v23 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
  long long v28 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  long long v22 = v28;
  long long v29 = v23;
  long long v21 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v30 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  long long v20 = v30;
  long long v31 = v21;
  long long v19 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v24 = *MEMORY[0x1E4F39B10];
  long long v18 = v24;
  long long v25 = v19;
  long long v17 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v26 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  long long v16 = v26;
  long long v27 = v17;
  long long v13 = [MEMORY[0x1E4F29238] valueWithCATransform3D:&v24];
  [v7 setToValue:v13];

  double v14 = [v6 layer];
  long long v28 = v22;
  long long v29 = v23;
  long long v30 = v20;
  long long v31 = v21;
  long long v24 = v18;
  long long v25 = v19;
  long long v26 = v16;
  long long v27 = v17;
  [v14 setSublayerTransform:&v24];

  double v15 = [v6 layer];

  [v15 addAnimation:v7 forKey:@"sublayerTransform"];
}

- (void)cleanUpForViewControllerDismissal
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(SBModalWidgetIntroductionViewController *)self dismissCompletions];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    double v5 = [(SBModalWidgetIntroductionViewController *)self dismissCompletions];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      long long v15 = 0u;
      long long v16 = 0u;
      long long v13 = 0u;
      long long v14 = 0u;
      double v7 = [(SBModalWidgetIntroductionViewController *)self dismissCompletions];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v14;
        do
        {
          uint64_t v11 = 0;
          do
          {
            if (*(void *)v14 != v10) {
              objc_enumerationMutation(v7);
            }
            (*(void (**)(void))(*(void *)(*((void *)&v13 + 1) + 8 * v11++) + 16))();
          }
          while (v9 != v11);
          uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        }
        while (v9);
      }
    }
  }
  long long v12 = [(SBModalWidgetIntroductionViewController *)self dismissCompletions];
  [v12 removeAllObjects];

  [(SBModalWidgetIntroductionViewController *)self setDismissCompletions:0];
}

- (void)displayPreviewAndButton
{
  uint64_t v3 = [(SBModalWidgetIntroductionViewController *)self view];
  objc_super v4 = [(SBModalWidgetIntroductionViewController *)self backgroundDescriptionView];
  [v3 sendSubviewToBack:v4];

  double v5 = [(SBModalWidgetIntroductionViewController *)self view];
  uint64_t v6 = [(SBModalWidgetIntroductionViewController *)self continueButton];
  [v5 bringSubviewToFront:v6];

  long long v39 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 48);
  long long v41 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 32);
  *(_OWORD *)&v55.m21 = v41;
  *(_OWORD *)&v55.m23 = v39;
  long long v37 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
  *(_OWORD *)&v55.m31 = v37;
  CGFloat v7 = *(double *)(MEMORY[0x1E4F39B10] + 80);
  long long v33 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 16);
  long long v35 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v55.m11 = *MEMORY[0x1E4F39B10];
  *(_OWORD *)&v55.m13 = v33;
  v55.CGFloat m33 = v7;
  v55.CGFloat m34 = -0.00105263158;
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 112);
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 96);
  *(_OWORD *)&v55.m41 = v31;
  *(_OWORD *)&v55.m43 = v29;
  CATransform3DTranslate(&v56, &v55, 0.0, 300.0, 0.0);
  long long v61 = *(_OWORD *)&v56.m21;
  long long v62 = *(_OWORD *)&v56.m23;
  long long v63 = *(_OWORD *)&v56.m31;
  CGFloat m33 = v56.m33;
  long long v59 = *(_OWORD *)&v56.m11;
  long long v60 = *(_OWORD *)&v56.m13;
  long long v57 = *(_OWORD *)&v56.m41;
  long long v58 = *(_OWORD *)&v56.m43;
  CATransform3D v55 = v56;
  CATransform3DRotate(&v56, &v55, 0.698131701, 1.0, 0.0, 0.0);
  long long v61 = *(_OWORD *)&v56.m21;
  long long v62 = *(_OWORD *)&v56.m23;
  long long v63 = *(_OWORD *)&v56.m31;
  CGFloat m33 = v56.m33;
  long long v59 = *(_OWORD *)&v56.m11;
  long long v60 = *(_OWORD *)&v56.m13;
  CGFloat m34 = v56.m34;
  long long v57 = *(_OWORD *)&v56.m41;
  long long v58 = *(_OWORD *)&v56.m43;
  long long v9 = *(_OWORD *)&v56.m23;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m21 = *(_OWORD *)&v56.m21;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m23 = v9;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m31 = v63;
  self->_homeScreenPreviewSublayerTransform.CGFloat m33 = m33;
  long long v10 = v60;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m11 = v59;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m13 = v10;
  self->_homeScreenPreviewSublayerTransform.CGFloat m34 = m34;
  long long v11 = v58;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m41 = v57;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m43 = v11;
  long long v12 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewTop];

  if (v12)
  {
    *(_OWORD *)&v55.m21 = v41;
    *(_OWORD *)&v55.m23 = v39;
    *(_OWORD *)&v55.m31 = v37;
    *(_OWORD *)&v55.m11 = v35;
    *(_OWORD *)&v55.m13 = v33;
    v55.CGFloat m33 = v7;
    v55.CGFloat m34 = -0.00125;
    *(_OWORD *)&v55.m41 = v31;
    *(_OWORD *)&v55.m43 = v29;
    CATransform3DTranslate(&v56, &v55, 10.0, -200.0, 0.0);
    CATransform3D v55 = v56;
    CATransform3DRotate(&v56, &v55, 0.523598776, -0.800000012, -0.800000012, 0.800000012);
    CATransform3D v55 = v56;
    CATransform3DScale(&v56, &v55, 1.14999998, 1.14999998, 1.0);
    long long v51 = *(_OWORD *)&v56.m21;
    long long v52 = *(_OWORD *)&v56.m23;
    long long v53 = *(_OWORD *)&v56.m31;
    CGFloat v54 = v56.m33;
    long long v49 = *(_OWORD *)&v56.m11;
    long long v50 = *(_OWORD *)&v56.m13;
    CGFloat v13 = v56.m34;
    long long v47 = *(_OWORD *)&v56.m41;
    long long v48 = *(_OWORD *)&v56.m43;
    long long v14 = *(_OWORD *)&v56.m23;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m21 = *(_OWORD *)&v56.m21;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m23 = v14;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m31 = v53;
    self->_onboardingFallingWidgetPreviewSublayerTransformTop.CGFloat m33 = v54;
    long long v15 = v50;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m11 = v49;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m13 = v15;
    self->_onboardingFallingWidgetPreviewSublayerTransformTop.CGFloat m34 = v13;
    long long v16 = v48;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m41 = v47;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m43 = v16;
  }
  long long v17 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewMiddle];

  if (v17)
  {
    *(_OWORD *)&v55.m21 = v42;
    *(_OWORD *)&v55.m23 = v40;
    *(_OWORD *)&v55.m31 = v38;
    *(_OWORD *)&v55.m11 = v36;
    *(_OWORD *)&v55.m13 = v34;
    v55.CGFloat m33 = v7;
    v55.CGFloat m34 = -0.00125;
    *(_OWORD *)&v55.m41 = v32;
    *(_OWORD *)&v55.m43 = v30;
    CATransform3DTranslate(&v56, &v55, -10.0, -80.0, 0.0);
    CATransform3D v55 = v56;
    CATransform3DRotate(&v56, &v55, 0.523598776, -1.0, -0.800000012, 0.0);
    CATransform3D v55 = v56;
    CATransform3DScale(&v56, &v55, 1.10000002, 1.10000002, 1.0);
    long long v51 = *(_OWORD *)&v56.m21;
    long long v52 = *(_OWORD *)&v56.m23;
    long long v53 = *(_OWORD *)&v56.m31;
    CGFloat v54 = v56.m33;
    long long v49 = *(_OWORD *)&v56.m11;
    long long v50 = *(_OWORD *)&v56.m13;
    CGFloat v18 = v56.m34;
    long long v47 = *(_OWORD *)&v56.m41;
    long long v48 = *(_OWORD *)&v56.m43;
    long long v19 = *(_OWORD *)&v56.m23;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m21 = *(_OWORD *)&v56.m21;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m23 = v19;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m31 = v53;
    self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.CGFloat m33 = v54;
    long long v20 = v50;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m11 = v49;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m13 = v20;
    self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.CGFloat m34 = v18;
    long long v21 = v48;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m41 = v47;
    *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m43 = v21;
  }
  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:1.0];
  long long v22 = (void *)MEMORY[0x1E4F39CF8];
  long long v23 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v22 setAnimationTimingFunction:v23];

  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __66__SBModalWidgetIntroductionViewController_displayPreviewAndButton__block_invoke;
  v46[3] = &unk_1E6AAC810;
  v46[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:1 delay:v46 options:0 animations:1.0 completion:0.0];
  long long v24 = [(SBModalWidgetIntroductionViewController *)self homescreenPreviewContainer];
  [(SBModalWidgetIntroductionViewController *)self homeScreenPreviewSublayerTransform];
  [(SBModalWidgetIntroductionViewController *)self setupSublayerDisplayPreviewTransformForView:v24 withTransform:v45];

  long long v25 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewTop];

  if (v25)
  {
    long long v26 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewTop];
    [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewSublayerTransformTop];
    [(SBModalWidgetIntroductionViewController *)self setupSublayerDisplayPreviewTransformForView:v26 withTransform:v44];
  }
  long long v27 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewMiddle];

  if (v27)
  {
    long long v28 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewMiddle];
    [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewSublayerTransformMiddle];
    [(SBModalWidgetIntroductionViewController *)self setupSublayerDisplayPreviewTransformForView:v28 withTransform:v43];
  }
  [MEMORY[0x1E4F39CF8] commit];
}

void __66__SBModalWidgetIntroductionViewController_displayPreviewAndButton__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) continueButtonTopAnchorConstraint];
  [v2 setConstant:-150.0];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

- (void)dismissPreviewAndButton
{
  id v3 = [(SBModalWidgetIntroductionViewController *)self view];
  objc_super v4 = [(SBModalWidgetIntroductionViewController *)self backgroundDescriptionView];
  [v3 sendSubviewToBack:v4];

  double v5 = [(SBModalWidgetIntroductionViewController *)self view];
  uint64_t v6 = [(SBModalWidgetIntroductionViewController *)self continueButton];
  [v5 bringSubviewToFront:v6];

  [MEMORY[0x1E4F39CF8] begin];
  [MEMORY[0x1E4F39CF8] setAnimationDuration:1.0];
  CGFloat v7 = (void *)MEMORY[0x1E4F39CF8];
  uint64_t v8 = [MEMORY[0x1E4F39C10] functionWithName:*MEMORY[0x1E4F3A498]];
  [v7 setAnimationTimingFunction:v8];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __66__SBModalWidgetIntroductionViewController_dismissPreviewAndButton__block_invoke;
  v18[3] = &unk_1E6AAC810;
  v18[4] = self;
  [MEMORY[0x1E4F39CF8] setCompletionBlock:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__SBModalWidgetIntroductionViewController_dismissPreviewAndButton__block_invoke_2;
  v17[3] = &unk_1E6AAC810;
  v17[4] = self;
  [MEMORY[0x1E4FB1EB0] animateWithDuration:1 delay:v17 options:0 animations:1.0 completion:0.0];
  long long v9 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewMiddle];

  if (v9)
  {
    long long v10 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewMiddle];
    [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewSublayerTransformMiddle];
    [(SBModalWidgetIntroductionViewController *)self setupSublayerDismissPreviewTransformForView:v10 withTransform:v16];
  }
  long long v11 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewTop];

  if (v11)
  {
    long long v12 = [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewTop];
    [(SBModalWidgetIntroductionViewController *)self onboardingFallingWidgetPreviewSublayerTransformTop];
    [(SBModalWidgetIntroductionViewController *)self setupSublayerDismissPreviewTransformForView:v12 withTransform:v15];
  }
  CGFloat v13 = [(SBModalWidgetIntroductionViewController *)self homescreenPreviewContainer];
  [(SBModalWidgetIntroductionViewController *)self homeScreenPreviewSublayerTransform];
  [(SBModalWidgetIntroductionViewController *)self setupSublayerDismissPreviewTransformForView:v13 withTransform:&v14];

  [MEMORY[0x1E4F39CF8] commit];
}

uint64_t __66__SBModalWidgetIntroductionViewController_dismissPreviewAndButton__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 dismissViewControllerAnimated:0 completion:0];

  id v3 = *(void **)(a1 + 32);
  return [v3 cleanUpForViewControllerDismissal];
}

void __66__SBModalWidgetIntroductionViewController_dismissPreviewAndButton__block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) continueButtonTopAnchorConstraint];
  [v2 setConstant:150.0];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

- (NSArray)onboardingFallingWidgetPreviews
{
  return self->_onboardingFallingWidgetPreviews;
}

- (void)setOnboardingFallingWidgetPreviews:(id)a3
{
}

- (CGPoint)onboardingFallingWidgetCenterPoint
{
  double x = self->_onboardingFallingWidgetCenterPoint.x;
  double y = self->_onboardingFallingWidgetCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOnboardingFallingWidgetCenterPoint:(CGPoint)a3
{
  self->_onboardingFallingWidgetCenterPoint = a3;
}

- (CGRect)onboardingFallingWidgetBounds
{
  double x = self->_onboardingFallingWidgetBounds.origin.x;
  double y = self->_onboardingFallingWidgetBounds.origin.y;
  double width = self->_onboardingFallingWidgetBounds.size.width;
  double height = self->_onboardingFallingWidgetBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOnboardingFallingWidgetBounds:(CGRect)a3
{
  self->_onboardingFallingWidgetBounds = a3;
}

- (NSArray)onboardingStaticWidgetPreviews
{
  return self->_onboardingStaticWidgetPreviews;
}

- (void)setOnboardingStaticWidgetPreviews:(id)a3
{
}

- (CGPoint)onboardingStaticWidgetCenterPoint
{
  double x = self->_onboardingStaticWidgetCenterPoint.x;
  double y = self->_onboardingStaticWidgetCenterPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setOnboardingStaticWidgetCenterPoint:(CGPoint)a3
{
  self->_onboardingStaticWidgetCenterPoint = a3;
}

- (CGRect)onboardingStaticWidgetBounds
{
  double x = self->_onboardingStaticWidgetBounds.origin.x;
  double y = self->_onboardingStaticWidgetBounds.origin.y;
  double width = self->_onboardingStaticWidgetBounds.size.width;
  double height = self->_onboardingStaticWidgetBounds.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setOnboardingStaticWidgetBounds:(CGRect)a3
{
  self->_onboardingStaticWidgetBounds = a3;
}

- (NSMutableArray)dismissCompletions
{
  return self->_dismissCompletions;
}

- (void)setDismissCompletions:(id)a3
{
}

- (SBModalWidgetIntroductionBackgroundDescriptionView)backgroundDescriptionView
{
  return self->_backgroundDescriptionView;
}

- (void)setBackgroundDescriptionView:(id)a3
{
}

- (UIButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (NSLayoutConstraint)continueButtonTopAnchorConstraint
{
  return self->_continueButtonTopAnchorConstraint;
}

- (void)setContinueButtonTopAnchorConstraint:(id)a3
{
}

- (UIView)homescreenPreviewContainer
{
  return self->_homescreenPreviewContainer;
}

- (void)setHomescreenPreviewContainer:(id)a3
{
}

- (UIImageView)homescreenPreviewSnapshot
{
  return self->_homescreenPreviewSnapshot;
}

- (void)setHomescreenPreviewSnapshot:(id)a3
{
}

- (UIView)onboardingWidgetPreviewsContainer
{
  return self->_onboardingWidgetPreviewsContainer;
}

- (void)setOnboardingWidgetPreviewsContainer:(id)a3
{
}

- (UIView)onboardingStaticWidgetPreview
{
  return self->_onboardingStaticWidgetPreview;
}

- (void)setOnboardingStaticWidgetPreview:(id)a3
{
}

- (UIView)onboardingFallingWidgetPreviewTop
{
  return self->_onboardingFallingWidgetPreviewTop;
}

- (void)setOnboardingFallingWidgetPreviewTop:(id)a3
{
}

- (UIView)onboardingFallingWidgetPreviewMiddle
{
  return self->_onboardingFallingWidgetPreviewMiddle;
}

- (void)setOnboardingFallingWidgetPreviewMiddle:(id)a3
{
}

- (UIView)onboardingFallingWidgetPreviewBottom
{
  return self->_onboardingFallingWidgetPreviewBottom;
}

- (void)setOnboardingFallingWidgetPreviewBottom:(id)a3
{
}

- (SBModalWidgetIntroductionHomeScreenPreview)homescreenPreview
{
  return self->_homescreenPreview;
}

- (void)setHomescreenPreview:(id)a3
{
}

- (CATransform3D)homeScreenPreviewSublayerTransform
{
  long long v3 = *(_OWORD *)&self[9].m43;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[9].m41;
  *(_OWORD *)&retstr->CGFloat m33 = v3;
  long long v4 = *(_OWORD *)&self[10].m13;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[10].m11;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[9].m23;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[9].m21;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[9].m33;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[9].m31;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setHomeScreenPreviewSublayerTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m23;
  long long v5 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m23 = v3;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m11 = v5;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m43;
  long long v8 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m43 = v6;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.m31 = v8;
  *(_OWORD *)&self->_homeScreenPreviewSublayerTransform.CGFloat m33 = v7;
}

- (CATransform3D)onboardingFallingWidgetPreviewSublayerTransformTop
{
  long long v3 = *(_OWORD *)&self[10].m43;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[10].m41;
  *(_OWORD *)&retstr->CGFloat m33 = v3;
  long long v4 = *(_OWORD *)&self[11].m13;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[11].m11;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[10].m23;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[10].m21;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[10].m33;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[10].m31;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setOnboardingFallingWidgetPreviewSublayerTransformTop:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m23;
  long long v5 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m23 = v3;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m11 = v5;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m43;
  long long v8 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m43 = v6;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.m31 = v8;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformTop.CGFloat m33 = v7;
}

- (CATransform3D)onboardingFallingWidgetPreviewSublayerTransformMiddle
{
  long long v3 = *(_OWORD *)&self[11].m43;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[11].m41;
  *(_OWORD *)&retstr->CGFloat m33 = v3;
  long long v4 = *(_OWORD *)&self[12].m13;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[12].m11;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[11].m23;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[11].m21;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[11].m33;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[11].m31;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setOnboardingFallingWidgetPreviewSublayerTransformMiddle:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m23;
  long long v5 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m23 = v3;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m11 = v5;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m43;
  long long v8 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m43 = v6;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.m31 = v8;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformMiddle.CGFloat m33 = v7;
}

- (CATransform3D)onboardingFallingWidgetPreviewSublayerTransformBottom
{
  long long v3 = *(_OWORD *)&self[12].m43;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[12].m41;
  *(_OWORD *)&retstr->CGFloat m33 = v3;
  long long v4 = *(_OWORD *)&self[13].m13;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[13].m11;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[12].m23;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[12].m21;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[12].m33;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[12].m31;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setOnboardingFallingWidgetPreviewSublayerTransformBottom:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m23;
  long long v5 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m23 = v3;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m11 = v5;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m43;
  long long v8 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m43 = v6;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.m31 = v8;
  *(_OWORD *)&self->_onboardingFallingWidgetPreviewSublayerTransformBottom.CGFloat m33 = v7;
}

- (CATransform3D)appliedSublayerTransform
{
  long long v3 = *(_OWORD *)&self[13].m43;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[13].m41;
  *(_OWORD *)&retstr->CGFloat m33 = v3;
  long long v4 = *(_OWORD *)&self[14].m13;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[14].m11;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[13].m23;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self[13].m21;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[13].m33;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[13].m31;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (void)setAppliedSublayerTransform:(CATransform3D *)a3
{
  long long v3 = *(_OWORD *)&a3->m23;
  long long v5 = *(_OWORD *)&a3->m11;
  long long v4 = *(_OWORD *)&a3->m13;
  *(_OWORD *)&self->_appliedSublayerTransform.m21 = *(_OWORD *)&a3->m21;
  *(_OWORD *)&self->_appliedSublayerTransform.m23 = v3;
  *(_OWORD *)&self->_appliedSublayerTransform.m11 = v5;
  *(_OWORD *)&self->_appliedSublayerTransform.m13 = v4;
  long long v6 = *(_OWORD *)&a3->m43;
  long long v8 = *(_OWORD *)&a3->m31;
  long long v7 = *(_OWORD *)&a3->m33;
  *(_OWORD *)&self->_appliedSublayerTransform.m41 = *(_OWORD *)&a3->m41;
  *(_OWORD *)&self->_appliedSublayerTransform.m43 = v6;
  *(_OWORD *)&self->_appliedSublayerTransform.m31 = v8;
  *(_OWORD *)&self->_appliedSublayerTransform.CGFloat m33 = v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homescreenPreview, 0);
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviewBottom, 0);
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviewMiddle, 0);
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviewTop, 0);
  objc_storeStrong((id *)&self->_onboardingStaticWidgetPreview, 0);
  objc_storeStrong((id *)&self->_onboardingWidgetPreviewsContainer, 0);
  objc_storeStrong((id *)&self->_homescreenPreviewSnapshot, 0);
  objc_storeStrong((id *)&self->_homescreenPreviewContainer, 0);
  objc_storeStrong((id *)&self->_continueButtonTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_backgroundDescriptionView, 0);
  objc_storeStrong((id *)&self->_dismissCompletions, 0);
  objc_storeStrong((id *)&self->_onboardingStaticWidgetPreviews, 0);
  objc_storeStrong((id *)&self->_onboardingFallingWidgetPreviews, 0);
}

@end