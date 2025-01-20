@interface PUPickerManagedViewController
- (PUPickerConfiguration)configuration;
- (PUPickerContainerController)contentViewController;
- (PUPickerManagedViewController)initWithConfiguration:(id)a3 contentViewController:(id)a4;
- (PUPickerOnboardingView)onboardingOverlayView;
- (PUSidebarViewController)sidebarViewController;
- (UINavigationController)contentNavigationController;
- (UINavigationController)sidebarNavigationController;
- (UISplitViewController)splitViewController;
- (void)_forceContentToMatchContainerFrame;
- (void)_updateBackgroundColor;
- (void)_updateInteractiveBarTransitionFractionExpandedAndWindowHeight;
- (void)_updateOnboardingOverlayBadgeContainer;
- (void)_updateOnboardingOverlayView;
- (void)_updatePreferredContentSize;
- (void)_updatePreferredDisplayMode;
- (void)_updateSupportsInteractiveBarTransition;
- (void)assetPickerOnboardingViewDidDismissBadge:(id)a3;
- (void)assetPickerOnboardingViewDidTransitionToBadge:(id)a3;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentDataAccessEducationViewController:(id)a3;
- (void)setOnboardingOverlayView:(id)a3;
- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4;
- (void)splitViewControllerDidCollapse:(id)a3;
- (void)splitViewControllerDidExpand:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PUPickerManagedViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_storeStrong((id *)&self->_sidebarNavigationController, 0);
  objc_storeStrong((id *)&self->_contentNavigationController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_onboardingOverlayView, 0);
}

- (PUSidebarViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (UINavigationController)sidebarNavigationController
{
  return self->_sidebarNavigationController;
}

- (UINavigationController)contentNavigationController
{
  return self->_contentNavigationController;
}

- (UISplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (PUPickerContainerController)contentViewController
{
  return self->_contentViewController;
}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (void)setOnboardingOverlayView:(id)a3
{
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v10 = a3;
  if ((void *)PUPickerConfigurationObservationContext_94839 != a5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PUPickerManagedViewController.m" lineNumber:504 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x25) != 0) {
    [(PUPickerManagedViewController *)self _updateOnboardingOverlayView];
  }
  if (v6) {
    [(PUPickerManagedViewController *)self _updateSupportsInteractiveBarTransition];
  }
  if ((v6 & 0xE0) != 0) {
    [(PUPickerManagedViewController *)self _forceContentToMatchContainerFrame];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6 = a4;
  id v7 = [(PUPickerManagedViewController *)self contentViewController];

  if (v7 == v6)
  {
    [(PUPickerManagedViewController *)self _updateOnboardingOverlayBadgeContainer];
  }
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  id v9 = a4;
  id v6 = [(PUPickerManagedViewController *)self configuration];
  char v7 = [v6 isPeopleOrPetsPicker];

  if ((v7 & 1) == 0)
  {
    v8 = [(PUPickerManagedViewController *)self contentViewController];
    [v8 navigationWillPresentViewController:v9];
  }
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__PUPickerManagedViewController_splitViewController_willChangeToDisplayMode___block_invoke;
  block[3] = &unk_1E5F2D2C8;
  id v10 = self;
  int64_t v11 = a4;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __77__PUPickerManagedViewController_splitViewController_willChangeToDisplayMode___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 48) == 1 || ([*(id *)(a1 + 32) isCollapsed] & 1) != 0)
  {
    int v2 = 0;
    v3 = 0;
  }
  else
  {
    v3 = [*(id *)(a1 + 40) sidebarViewController];
    int v2 = 1;
  }
  v4 = [*(id *)(a1 + 40) contentViewController];
  [v4 setSidebarViewController:v3];

  if (v2) {
  v5 = *(void **)(a1 + 40);
  }
  return [v5 _updateSupportsInteractiveBarTransition];
}

- (void)splitViewControllerDidCollapse:(id)a3
{
  v4 = [(PUPickerManagedViewController *)self contentViewController];
  [v4 setSidebarViewController:0];

  [(PUPickerManagedViewController *)self _updateSupportsInteractiveBarTransition];
}

- (void)splitViewControllerDidExpand:(id)a3
{
  uint64_t v4 = [a3 displayMode];
  if (v4 == 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = [(PUPickerManagedViewController *)self sidebarViewController];
  }
  id v6 = [(PUPickerManagedViewController *)self contentViewController];
  [v6 setSidebarViewController:v5];

  if (v4 != 1) {
  [(PUPickerManagedViewController *)self _updateSupportsInteractiveBarTransition];
  }
}

- (void)assetPickerOnboardingViewDidDismissBadge:(id)a3
{
  id v3 = [(PUPickerManagedViewController *)self configuration];
  [v3 performChanges:&__block_literal_global_239];
}

void __74__PUPickerManagedViewController_assetPickerOnboardingViewDidDismissBadge___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDidDismissOnboardingOverlayView:1];
  [v2 setDidShowPhotosIndicator:1];
}

- (void)assetPickerOnboardingViewDidTransitionToBadge:(id)a3
{
}

- (void)_forceContentToMatchContainerFrame
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPickerManagedViewController *)self configuration];
  int v4 = [v3 supportsInteractiveBarTransition];

  if (!v4) {
    return;
  }
  v5 = [(PUPickerManagedViewController *)self view];
  id v6 = [v5 window];
  [v6 bounds];
  double v8 = v7;

  id v9 = [(PUPickerManagedViewController *)self view];
  id v10 = [v9 window];
  int64_t v11 = [v10 _rootSheetPresentationController];

  v12 = [v11 _detentValues];
  if ([v12 count] == 2)
  {
    v13 = [v12 firstObject];
    [v13 doubleValue];
    double v15 = v14;
    v16 = [v12 lastObject];
    [v16 doubleValue];
    double v18 = fmax(v15, v17);

    v19 = [v11 containerView];
    [v19 safeAreaInsets];
    double v21 = v20;

    double v22 = v18 + v21;
    v23 = PLPickerGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v46 = 134218240;
      *(double *)&v46[4] = v22;
      __int16 v47 = 2048;
      double v48 = v18;
      _os_log_impl(&dword_1AE9F8000, v23, OS_LOG_TYPE_DEBUG, "Interactive navigation bar transition calculated max card height to: %f, detent: %f", v46, 0x16u);
    }

    if (v22 <= v8) {
      goto LABEL_12;
    }
    v24 = PLPickerGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v46 = 0;
      v25 = "Interactive navigation bar transition failed to calculate max card height from root sheet detent values. Height too large.";
LABEL_10:
      _os_log_impl(&dword_1AE9F8000, v24, OS_LOG_TYPE_ERROR, v25, v46, 2u);
    }
  }
  else
  {
    v24 = PLPickerGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v46 = 0;
      v25 = "Interactive navigation bar transition failed to calculate max card height from root sheet detent values. Invalid detents.";
      goto LABEL_10;
    }
  }
  double v22 = v8 + -54.0;

LABEL_12:
  v26 = [(PUPickerManagedViewController *)self childViewControllers];
  uint64_t v27 = [v26 count];

  if (v27 != 1)
  {
    v28 = PXAssertGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v46 = 0;
      _os_log_error_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_ERROR, "This code assumes there's just 1 child view controller, reevaluate if this changes.", v46, 2u);
    }
  }
  v29 = [(PUPickerManagedViewController *)self childViewControllers];
  v30 = [v29 firstObject];
  v31 = [v30 view];

  [v31 frame];
  double v33 = v32;
  double v35 = v34;
  v36 = [(PUPickerManagedViewController *)self view];
  [v36 bounds];
  double v38 = v37;

  objc_msgSend(v31, "setFrame:", v33, v35, v38, v22);
  v39 = [(PUPickerManagedViewController *)self view];
  [v39 bounds];
  double MidX = CGRectGetMidX(v51);
  v41 = [(PUPickerManagedViewController *)self view];
  [v41 bounds];
  double v42 = v22 * 0.5 + CGRectGetMinY(v52);

  objc_msgSend(v31, "setCenter:", MidX, v42);
  v43 = PLPickerGetLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v53.origin.x = v33;
    v53.origin.y = v35;
    v53.size.width = v38;
    v53.size.height = v22;
    v44 = NSStringFromCGRect(v53);
    v50.x = MidX;
    v50.y = v42;
    v45 = NSStringFromCGPoint(v50);
    *(_DWORD *)v46 = 138412546;
    *(void *)&v46[4] = v44;
    __int16 v47 = 2112;
    double v48 = *(double *)&v45;
    _os_log_impl(&dword_1AE9F8000, v43, OS_LOG_TYPE_DEBUG, "Interactive navigation bar transition did update view frame to %@, center to: %@", v46, 0x16u);
  }
}

- (void)_updateInteractiveBarTransitionFractionExpandedAndWindowHeight
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(PUPickerManagedViewController *)self view];
  int v4 = [v3 window];
  [v4 bounds];
  uint64_t v6 = v5;

  double v7 = [(PUPickerManagedViewController *)self view];
  double v8 = [v7 window];
  id v9 = [v8 _rootSheetPresentationController];
  id v10 = [v9 _detentValues];

  double v11 = 1.0;
  if ([v10 count] == 2)
  {
    v12 = [(PUPickerManagedViewController *)self view];
    [v12 bounds];
    double v14 = v13;
    double v15 = [(PUPickerManagedViewController *)self view];
    [v15 safeAreaInsets];
    double v17 = v16;

    double v18 = [v10 firstObject];
    double v19 = 0.0;
    double v20 = 0.0;
    if ([v18 integerValue] != 0x7FFFFFFFFFFFFFFFLL)
    {
      double v21 = [v10 firstObject];
      [v21 doubleValue];
      double v20 = v22;
    }
    double v23 = v14 - v17;

    v24 = [v10 lastObject];
    if ([v24 integerValue] != 0x7FFFFFFFFFFFFFFFLL)
    {
      v25 = [v10 lastObject];
      [v25 doubleValue];
      double v19 = v26;
    }
    double v27 = fmin(v20, v19);
    double v11 = fmin(fmax((v23 - v27) / (fmax(v20, v19) - v27), 0.0), 1.0);
  }
  v28 = PLPickerGetLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    uint64_t v32 = v6;
    __int16 v33 = 2048;
    double v34 = v11;
    _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_DEBUG, "Interactive navigation bar transition will update with window height: %f, fraction expanded: %f", buf, 0x16u);
  }

  v29 = [(PUPickerManagedViewController *)self configuration];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __95__PUPickerManagedViewController__updateInteractiveBarTransitionFractionExpandedAndWindowHeight__block_invoke;
  v30[3] = &__block_descriptor_48_e40_v16__0___PUMutablePickerConfiguration__8l;
  *(double *)&v30[4] = v11;
  v30[5] = v6;
  [v29 performChanges:v30];
}

void __95__PUPickerManagedViewController__updateInteractiveBarTransitionFractionExpandedAndWindowHeight__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(double *)(a1 + 32);
  id v4 = a2;
  [v4 setInteractiveBarTransitionFractionExpanded:v3];
  [v4 setInteractiveBarTransitionWindowHeight:*(double *)(a1 + 40)];
}

- (void)_updateSupportsInteractiveBarTransition
{
  double v3 = [(PUPickerManagedViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4)
  {
    uint64_t v5 = PLPickerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "Interactive navigation bar transition is skipped due to non-phone idiom.";
LABEL_21:
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, v6, buf, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  double v7 = [(PUPickerManagedViewController *)self splitViewController];
  if ([v7 displayMode] == 1)
  {
  }
  else
  {
    double v8 = [(PUPickerManagedViewController *)self splitViewController];
    char v9 = [v8 isCollapsed];

    if ((v9 & 1) == 0)
    {
      uint64_t v5 = PLPickerGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        uint64_t v6 = "Interactive navigation bar transition is skipped due to visible sidebar.";
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  id v10 = [(PUPickerManagedViewController *)self configuration];
  uint64_t v11 = [v10 edgesWithoutContentMargins] & 5;

  if (v11)
  {
    uint64_t v5 = PLPickerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "Interactive navigation bar transition is skipped due to hidden navigation bar or toolbar.";
      goto LABEL_21;
    }
LABEL_22:
    char v22 = 0;
    goto LABEL_23;
  }
  v12 = [(PUPickerManagedViewController *)self view];
  double v13 = [v12 window];
  double v14 = [v13 windowScene];
  unint64_t v15 = [v14 interfaceOrientation] - 3;

  if (v15 <= 1)
  {
    uint64_t v5 = PLPickerGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "Interactive navigation bar transition is skipped due to landscape orientation.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  double v16 = [(PUPickerManagedViewController *)self view];
  double v17 = [v16 window];
  double v18 = [v17 _rootSheetPresentationController];
  double v19 = [v18 _detentValues];
  uint64_t v20 = [v19 count];

  uint64_t v5 = PLPickerGetLog();
  BOOL v21 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v20 != 2)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      uint64_t v6 = "Interactive navigation bar transition is skipped due to invalid detent counts.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (v21)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEBUG, "Interactive navigation bar transition is enabled.", buf, 2u);
  }
  char v22 = 1;
LABEL_23:

  double v23 = [(PUPickerManagedViewController *)self configuration];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__PUPickerManagedViewController__updateSupportsInteractiveBarTransition__block_invoke;
  v24[3] = &__block_descriptor_33_e40_v16__0___PUMutablePickerConfiguration__8l;
  char v25 = v22;
  [v23 performChanges:v24];
}

uint64_t __72__PUPickerManagedViewController__updateSupportsInteractiveBarTransition__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSupportsInteractiveBarTransition:*(unsigned __int8 *)(a1 + 32)];
}

- (void)_updateBackgroundColor
{
  double v3 = [(PUPickerManagedViewController *)self contentViewController];
  uint64_t v4 = [v3 sidebarViewController];

  if (!v4)
  {
    id v5 = [(PUPickerManagedViewController *)self view];
    objc_msgSend(v5, "px_enumerateDescendantSubviewsPassingTest:usingBlock:", &__block_literal_global_228, &__block_literal_global_234);
  }
}

void __55__PUPickerManagedViewController__updateBackgroundColor__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4FB1618];
  id v3 = a2;
  id v4 = [v2 clearColor];
  [v3 setBackgroundColor:v4];
}

uint64_t __55__PUPickerManagedViewController__updateBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  NSClassFromString(&cfstr_Uisplitviewcon.isa);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_updatePreferredDisplayMode
{
  id v3 = [(PUPickerManagedViewController *)self sheetPresentationController];
  id v4 = [v3 detents];
  if ([v4 count])
  {
    id v5 = [(PUPickerManagedViewController *)self sheetPresentationController];
    uint64_t v6 = [v5 detents];
    int v7 = PXExists() ^ 1;
  }
  else
  {
    int v7 = 1;
  }

  double v8 = [(PUPickerManagedViewController *)self view];
  [v8 bounds];
  double v10 = v9;

  uint64_t v11 = [(PUPickerManagedViewController *)self configuration];
  if ([v11 allowsSidebar])
  {
    v12 = [(PUPickerManagedViewController *)self contentViewController];
    int v13 = [v12 hasContent];
    uint64_t v14 = 2;
    if (v10 < 400.0) {
      uint64_t v14 = 1;
    }
    if ((v13 & v7) != 0) {
      uint64_t v15 = v14;
    }
    else {
      uint64_t v15 = 1;
    }
  }
  else
  {
    uint64_t v15 = 1;
  }

  double v16 = [(PUPickerManagedViewController *)self splitViewController];
  uint64_t v17 = [v16 preferredDisplayMode];

  if (v17 != v15)
  {
    id v18 = [(PUPickerManagedViewController *)self splitViewController];
    [v18 setPreferredDisplayMode:v15];
  }
}

uint64_t __60__PUPickerManagedViewController__updatePreferredDisplayMode__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x1E4FB2EF8]] ^ 1;

  return v3;
}

- (void)_updatePreferredContentSize
{
  uint64_t v3 = [(PUPickerManagedViewController *)self splitViewController];
  [v3 preferredContentSize];
  double v5 = v4;
  double v7 = v6;

  [(PUPickerManagedViewController *)self preferredContentSize];
  if (v9 != v5 || v8 != v7)
  {
    -[PUPickerManagedViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
  }
}

- (void)_updateOnboardingOverlayBadgeContainer
{
  uint64_t v3 = [(PUPickerManagedViewController *)self configuration];
  if ([v3 supportsInteractiveBarTransition])
  {
    id v8 = [(PUPickerManagedViewController *)self viewIfLoaded];
  }
  else
  {
    double v4 = [(PUPickerManagedViewController *)self contentViewController];
    id v8 = [v4 viewIfLoaded];
  }
  double v5 = [v8 window];
  if (v5) {
    id v6 = v8;
  }
  else {
    id v6 = 0;
  }
  double v7 = [(PUPickerManagedViewController *)self onboardingOverlayView];
  [v7 setBadgeContainerView:v6];
}

- (void)_updateOnboardingOverlayView
{
  v30[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PUPickerManagedViewController *)self configuration];
  int v4 = [v3 shouldShowOnboardingOverlayView];

  double v5 = [(PUPickerManagedViewController *)self onboardingOverlayView];
  [v5 removeFromSuperview];

  if (v4)
  {
    id v6 = [(PUPickerManagedViewController *)self view];
    double v7 = [(PUPickerManagedViewController *)self onboardingOverlayView];
    [v6 addSubview:v7];

    uint64_t v20 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(PUPickerManagedViewController *)self onboardingOverlayView];
    double v27 = [v29 topAnchor];
    v28 = [(PUPickerManagedViewController *)self view];
    double v26 = [v28 topAnchor];
    char v25 = [v27 constraintEqualToAnchor:v26];
    v30[0] = v25;
    v24 = [(PUPickerManagedViewController *)self onboardingOverlayView];
    char v22 = [v24 bottomAnchor];
    double v23 = [(PUPickerManagedViewController *)self view];
    BOOL v21 = [v23 bottomAnchor];
    double v19 = [v22 constraintEqualToAnchor:v21];
    v30[1] = v19;
    id v18 = [(PUPickerManagedViewController *)self onboardingOverlayView];
    id v8 = [v18 leadingAnchor];
    double v9 = [(PUPickerManagedViewController *)self view];
    double v10 = [v9 leadingAnchor];
    uint64_t v11 = [v8 constraintEqualToAnchor:v10];
    v30[2] = v11;
    v12 = [(PUPickerManagedViewController *)self onboardingOverlayView];
    int v13 = [v12 trailingAnchor];
    uint64_t v14 = [(PUPickerManagedViewController *)self view];
    uint64_t v15 = [v14 trailingAnchor];
    double v16 = [v13 constraintEqualToAnchor:v15];
    v30[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
    [v20 activateConstraints:v17];
  }
  else
  {
    [(PUPickerManagedViewController *)self setOnboardingOverlayView:0];
  }
}

- (void)presentDataAccessEducationViewController:(id)a3
{
}

- (PUPickerOnboardingView)onboardingOverlayView
{
  if (!self->_onboardingOverlayView)
  {
    uint64_t v3 = [(PUPickerManagedViewController *)self configuration];
    int v4 = [v3 shouldShowOnboardingOverlayView];

    if (v4)
    {
      double v5 = [PUPickerOnboardingView alloc];
      id v6 = [(PUPickerManagedViewController *)self configuration];
      double v7 = [v6 pickerClientDisplayName];
      id v8 = [(PUPickerOnboardingView *)v5 initWithClientDisplayName:v7];

      [(PUPickerOnboardingView *)v8 setDelegate:self];
      [(PUPickerOnboardingView *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];
      onboardingOverlayView = self->_onboardingOverlayView;
      self->_onboardingOverlayView = v8;
    }
  }
  double v10 = self->_onboardingOverlayView;
  return v10;
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PUPickerManagedViewController;
  [(PUPickerManagedViewController *)&v6 viewDidLayoutSubviews];
  [(PUPickerManagedViewController *)self _updateInteractiveBarTransitionFractionExpandedAndWindowHeight];
  [(PUPickerManagedViewController *)self _updatePreferredDisplayMode];
  [(PUPickerManagedViewController *)self _updateBackgroundColor];
  [(PUPickerManagedViewController *)self _updateOnboardingOverlayBadgeContainer];
  uint64_t v3 = [(PUPickerManagedViewController *)self onboardingOverlayView];
  int v4 = [v3 superview];
  double v5 = [(PUPickerManagedViewController *)self onboardingOverlayView];
  [v4 bringSubviewToFront:v5];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PUPickerManagedViewController;
  [(PUPickerManagedViewController *)&v3 viewWillLayoutSubviews];
  [(PUPickerManagedViewController *)self _updateSupportsInteractiveBarTransition];
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPickerManagedViewController;
  [(PUPickerManagedViewController *)&v4 preferredContentSizeDidChangeForChildContentContainer:a3];
  [(PUPickerManagedViewController *)self _updatePreferredContentSize];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPickerManagedViewController;
  [(PUPickerManagedViewController *)&v4 didRotateFromInterfaceOrientation:a3];
  [(PUPickerManagedViewController *)self _updateSupportsInteractiveBarTransition];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUPickerManagedViewController;
  [(PUPickerManagedViewController *)&v4 traitCollectionDidChange:a3];
  [(PUPickerManagedViewController *)self _updateSupportsInteractiveBarTransition];
}

- (void)viewDidLoad
{
  v18.receiver = self;
  v18.super_class = (Class)PUPickerManagedViewController;
  [(PUPickerManagedViewController *)&v18 viewDidLoad];
  objc_super v3 = [(PUPickerManagedViewController *)self configuration];
  [v3 registerChangeObserver:self context:PUPickerConfigurationObservationContext_94839];

  objc_super v4 = [(PUPickerManagedViewController *)self contentNavigationController];
  [v4 setDelegate:self];

  double v5 = [(PUPickerManagedViewController *)self splitViewController];
  [v5 setDelegate:self];

  objc_super v6 = [(PUPickerManagedViewController *)self configuration];
  char v7 = [v6 hasClearBackgroundColor];

  if ((v7 & 1) == 0)
  {
    id v8 = [(PUPickerManagedViewController *)self configuration];
    if ([v8 hasClearBackgroundColor]) {
      [MEMORY[0x1E4FB1618] clearColor];
    }
    else {
    double v9 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
    }
    double v10 = [(PUPickerManagedViewController *)self view];
    [v10 setBackgroundColor:v9];
  }
  [(PUPickerManagedViewController *)self _updatePreferredDisplayMode];
  uint64_t v11 = [(PUPickerManagedViewController *)self splitViewController];
  [(PUPickerManagedViewController *)self px_addOrReplaceChildViewController:v11 activateConstraints:1];

  [(PUPickerManagedViewController *)self _updatePreferredContentSize];
  v12 = [(PUPickerManagedViewController *)self splitViewController];
  if ([v12 displayMode] == 1)
  {

LABEL_9:
    int v15 = 0;
    double v16 = 0;
    goto LABEL_11;
  }
  int v13 = [(PUPickerManagedViewController *)self splitViewController];
  char v14 = [v13 isCollapsed];

  if (v14) {
    goto LABEL_9;
  }
  double v16 = [(PUPickerManagedViewController *)self sidebarViewController];
  int v15 = 1;
LABEL_11:
  uint64_t v17 = [(PUPickerManagedViewController *)self contentViewController];
  [v17 setSidebarViewController:v16];

  if (v15) {
  [(PUPickerManagedViewController *)self _updateOnboardingOverlayView];
  }
}

- (PUPickerManagedViewController)initWithConfiguration:(id)a3 contentViewController:(id)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PUPickerManagedViewController;
  double v9 = [(PUPickerManagedViewController *)&v39 initWithNibName:0 bundle:0];
  if (v9)
  {
    double v10 = [[PUNavigationController alloc] initWithNavigationBarClass:objc_opt_class() toolbarClass:0];
    v41[0] = v8;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
    [(PUNavigationController *)v10 setViewControllers:v11];

    v12 = [(PUNavigationController *)v10 interactivePopGestureRecognizer];
    objc_msgSend(v12, "setEnabled:", objc_msgSend(v7, "allowsInteractivePopGesture"));

    -[PUNavigationController pu_setDisablePushPopAnimation:](v10, "pu_setDisablePushPopAnimation:", [v7 allowsNavigationPushPopAnimation] ^ 1);
    [v7 photoLibrary];
    v13 = double v38 = v7;
    v36 = objc_msgSend(MEMORY[0x1E4F90690], "sharedLibraryStatusProviderWithPhotoLibrary:");
    char v14 = (void *)[objc_alloc(MEMORY[0x1E4F90310]) initWithSharedLibraryStatusProvider:v36];
    if ([v38 excludesHiddenAlbum]) {
      uint64_t v15 = 7;
    }
    else {
      uint64_t v15 = 3;
    }
    double v16 = [PUSidebarViewController alloc];
    [v38 generatedFilter];
    uint64_t v17 = obj = a3;
    objc_super v18 = [v17 assetPredicate];
    [v38 allPhotosVirtualCollection];
    v19 = id v34 = a4;
    id v37 = v8;
    uint64_t v20 = [(PUSidebarViewController *)v16 initWithNavigationRoot:v8 photoLibrary:v13 libraryFilterState:v14 options:v15 additionalAssetsFilterPredicate:v18 pickerAllPhotosVirtualCollection:v19];

    BOOL v21 = (UINavigationController *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v20];
    char v22 = (UISplitViewController *)[objc_alloc(MEMORY[0x1E4FB1C48]) initWithStyle:1];
    [(UISplitViewController *)v22 setViewController:v21 forColumn:0];
    [(UISplitViewController *)v22 setViewController:v10 forColumn:2];
    [(UISplitViewController *)v22 setViewController:v10 forColumn:3];
    [(UISplitViewController *)v22 setPrimaryBackgroundStyle:1];
    [(UISplitViewController *)v22 setPreferredSplitBehavior:1];
    [(UISplitViewController *)v22 setPresentsWithGesture:0];
    uint64_t v40 = objc_opt_class();
    double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
    id v24 = (id)[(UISplitViewController *)v22 registerForTraitChanges:v23 withTarget:v9 action:sel__splitViewControllerDidChangeTraitPresentationSemanticContext_];

    objc_storeStrong((id *)&v9->_configuration, obj);
    objc_storeStrong((id *)&v9->_contentViewController, v34);
    contentNavigationController = v9->_contentNavigationController;
    v9->_contentNavigationController = &v10->super;
    double v26 = v10;

    sidebarViewController = v9->_sidebarViewController;
    v9->_sidebarViewController = v20;
    v28 = v20;
    id v8 = v37;
    v29 = v28;

    sidebarNavigationController = v9->_sidebarNavigationController;
    v9->_sidebarNavigationController = v21;
    v31 = v21;

    splitViewController = v9->_splitViewController;
    v9->_splitViewController = v22;

    id v7 = v38;
  }

  return v9;
}

@end