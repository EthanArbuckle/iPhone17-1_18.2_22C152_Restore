@interface ICHostedNotesAppearanceCoordinator
- (BOOL)shouldHideModeButtonWithPresentedViewController:(id)a3;
- (ICHostedNotesAppearanceCoordinating)delegate;
- (ICHostedNotesAppearanceCoordinator)initWithDelegate:(id)a3;
- (NSSet)modeButtonHidingModalTypes;
- (NSSet)modeButtonHidingPopoverTypes;
- (UIView)view;
- (UIViewController)modeButtonHidingPresentedViewController;
- (UIViewController)viewController;
- (_UIHostedWindowScene)hostedWindowScene;
- (void)didDismissViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setModeButtonHidingPresentedViewController:(id)a3;
- (void)updateAppearance;
- (void)willDismissViewController:(id)a3;
- (void)willPresentViewController:(id)a3;
@end

@implementation ICHostedNotesAppearanceCoordinator

- (ICHostedNotesAppearanceCoordinator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICHostedNotesAppearanceCoordinator;
  v5 = [(ICHostedNotesAppearanceCoordinator *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel_willPresentViewController_ name:*MEMORY[0x1E4FB2E78] object:0];
    [v7 addObserver:v6 selector:sel_willDismissViewController_ name:*MEMORY[0x1E4FB2E68] object:0];
    [v7 addObserver:v6 selector:sel_didDismissViewController_ name:*MEMORY[0x1E4FB2E60] object:0];
  }
  return v6;
}

- (void)updateAppearance
{
  v3 = [(ICHostedNotesAppearanceCoordinator *)self hostedWindowScene];

  if (!v3) {
    return;
  }
  id v4 = [(ICHostedNotesAppearanceCoordinator *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  v13 = [(ICHostedNotesAppearanceCoordinator *)self view];
  [v13 safeAreaInsets];
  CGFloat rect = v8;
  CGFloat v109 = v6;
  double v15 = v6 + v14;
  double v17 = v8 + v16;
  CGFloat v104 = v12;
  CGFloat v105 = v10;
  double v19 = v10 - (v14 + v18);
  double v21 = v12 - (v16 + v20);

  v22 = (void *)MEMORY[0x1E4F38E68];
  v23 = [(ICHostedNotesAppearanceCoordinator *)self view];
  v24 = [v23 window];
  id v106 = [v22 _existingToolPickerForWindow:v24];

  v25 = [v106 _paletteView];
  [v25 frame];
  CGFloat x = v114.origin.x;
  CGFloat y = v114.origin.y;
  CGFloat width = v114.size.width;
  CGFloat height = v114.size.height;
  v138.origin.CGFloat x = v15;
  v138.origin.CGFloat y = v17;
  v138.size.CGFloat width = v19;
  v138.size.CGFloat height = v21;
  CGRect v97 = CGRectIntersection(v114, v138);
  if (!CGRectIsNull(v97))
  {
    v30 = [(ICHostedNotesAppearanceCoordinator *)self view];
    double v94 = v17;
    double v96 = v15;
    double v91 = v21;
    double v92 = v19;
    objc_msgSend(v30, "convertRect:toView:", 0, v15, v17, v19, v21);
    CGFloat v32 = v31;
    CGFloat v34 = v33;
    CGFloat v36 = v35;
    CGFloat v38 = v37;

    uint64_t v39 = [v25 palettePosition];
    if (v39 == 8 || v39 == 4)
    {
      v117.origin.CGFloat y = rect;
      v117.origin.CGFloat x = v109;
      v117.size.CGFloat height = v104;
      v117.size.CGFloat width = v105;
      double v110 = CGRectGetHeight(v117);
      v118.origin.CGFloat x = x;
      v118.origin.CGFloat y = y;
      v118.size.CGFloat width = width;
      v118.size.CGFloat height = height;
      CGFloat v111 = v110 - CGRectGetMaxY(v118);
      CGFloat v90 = v32;
      v119.origin.CGFloat x = v32;
      v119.origin.CGFloat y = v34;
      v119.size.CGFloat width = v36;
      v119.size.CGFloat height = v38;
      if (v111 < CGRectGetMinY(v119) + 158.0)
      {
        v120.origin.CGFloat x = v32;
        v120.origin.CGFloat y = v34;
        v120.size.CGFloat width = v36;
        v120.size.CGFloat height = v38;
        double MinX = CGRectGetMinX(v120);
        v121.origin.CGFloat x = x;
        v121.origin.CGFloat y = y;
        v121.size.CGFloat width = width;
        v121.size.CGFloat height = height;
        if (MinX < CGRectGetWidth(v121))
        {
          CGFloat v42 = CGRectGetWidth(v97);
          double v15 = v96 + v42;
          double v17 = v94 + 0.0;
          double v19 = v92 - (v42 + 0.0);
LABEL_13:
          double v21 = v91;
          goto LABEL_14;
        }
      }
    }
    else if (v39 == 3)
    {
      v115.origin.CGFloat x = x;
      v115.origin.CGFloat y = y;
      v115.size.CGFloat width = width;
      v115.size.CGFloat height = height;
      double v40 = CGRectGetMinX(v115);
      v116.origin.CGFloat x = v32;
      v116.origin.CGFloat y = v34;
      v116.size.CGFloat width = v36;
      v116.size.CGFloat height = v38;
      double v17 = v94;
      double v15 = v96;
      double v21 = v91;
      double v19 = v92;
      if (v40 < CGRectGetMinX(v116) + 165.0)
      {
        double v15 = v96 + 0.0;
        double v17 = v94 + 0.0;
        double v21 = v91 - (CGRectGetHeight(v97) + 0.0);
      }
      goto LABEL_14;
    }
    double v17 = v94;
    double v15 = v96;
    double v19 = v92;
    goto LABEL_13;
  }
LABEL_14:
  v43 = [(ICHostedNotesAppearanceCoordinator *)self view];
  objc_msgSend(v43, "convertRect:toView:", 0, v15, v17, v19, v21);
  CGFloat v45 = v44;
  CGFloat v102 = v47;
  CGFloat v103 = v46;
  CGFloat v49 = v48;

  v50 = [(ICHostedNotesAppearanceCoordinator *)self view];
  v51 = [v50 window];
  [v51 bounds];
  double v53 = v52;
  double v55 = v54;
  double v57 = v56;
  double v59 = v58;
  v60 = [(ICHostedNotesAppearanceCoordinator *)self view];
  v61 = [v60 window];
  [v61 safeAreaInsets];
  CGFloat v63 = v53 + v62;
  double v65 = v55 + v64;
  double v112 = v57 - (v62 + v66);
  double v68 = v59 - (v64 + v67);

  v69 = (double *)MEMORY[0x1E4FB2848];
  v122.origin.CGFloat x = v45;
  v122.origin.CGFloat y = v103;
  v122.size.CGFloat width = v49;
  v122.size.CGFloat height = v102;
  CGFloat recta = CGRectGetMinX(v122);
  v123.origin.CGFloat x = v63;
  v123.origin.CGFloat y = v65;
  v123.size.CGFloat width = v112;
  v123.size.CGFloat height = v68;
  CGFloat rect2a = CGRectGetMidY(v123);
  v124.origin.CGFloat x = v45;
  CGFloat v70 = v63;
  v124.origin.CGFloat y = v103;
  v124.size.CGFloat width = v49;
  v124.size.CGFloat height = v102;
  v139.size.CGFloat width = CGRectGetWidth(v124);
  v139.size.CGFloat height = 1.0;
  v125.origin.CGFloat x = v63;
  v125.origin.CGFloat y = v65;
  v139.origin.CGFloat x = recta;
  CGFloat v71 = v112;
  v125.size.CGFloat width = v112;
  v125.size.CGFloat height = v68;
  v139.origin.CGFloat y = rect2a;
  if (CGRectIntersectsRect(v125, v139))
  {
    v126.origin.CGFloat x = v45;
    v126.origin.CGFloat y = v103;
    v126.size.CGFloat width = v49;
    v126.size.CGFloat height = v102;
    CGFloat v72 = v68;
    double v73 = CGRectGetMinX(v126);
    v127.origin.CGFloat x = v70;
    v127.size.CGFloat width = v112;
    v127.origin.CGFloat y = v65;
    v127.size.CGFloat height = v72;
    double v98 = fmax(v73 - CGRectGetMinX(v127), 0.0);
    v128.origin.CGFloat x = v70;
    v128.size.CGFloat width = v112;
    v128.origin.CGFloat y = v65;
    v128.size.CGFloat height = v72;
    double MaxX = CGRectGetMaxX(v128);
    v129.origin.CGFloat x = v45;
    v129.origin.CGFloat y = v103;
    v129.size.CGFloat width = v49;
    CGFloat v75 = v102;
    v129.size.CGFloat height = v102;
    double v76 = fmax(MaxX - CGRectGetMaxX(v129), 0.0);
    v77 = [(ICHostedNotesAppearanceCoordinator *)self viewController];
    if (objc_msgSend(v77, "ic_isRTL")) {
      double v78 = v76;
    }
    else {
      double v78 = v98;
    }
    double rect2 = v78;

    v79 = [(ICHostedNotesAppearanceCoordinator *)self viewController];
    if (objc_msgSend(v79, "ic_isRTL")) {
      double v80 = v98;
    }
    else {
      double v80 = v76;
    }
    double v99 = v80;
    double v68 = v72;
    CGFloat v71 = v112;
  }
  else
  {
    double v99 = v69[3];
    double rect2 = v69[1];
    CGFloat v75 = v102;
  }
  v130.origin.CGFloat x = v70;
  v130.origin.CGFloat y = v65;
  v130.size.CGFloat width = v71;
  v130.size.CGFloat height = v68;
  CGFloat MidX = CGRectGetMidX(v130);
  v131.origin.CGFloat x = v45;
  v131.origin.CGFloat y = v103;
  v131.size.CGFloat width = v49;
  CGFloat v81 = v75;
  v131.size.CGFloat height = v75;
  CGFloat MinY = CGRectGetMinY(v131);
  v132.origin.CGFloat x = v45;
  v132.origin.CGFloat y = v103;
  v132.size.CGFloat width = v49;
  v132.size.CGFloat height = v81;
  v140.size.CGFloat height = CGRectGetHeight(v132);
  v140.size.CGFloat width = 1.0;
  v133.origin.CGFloat x = v70;
  v133.origin.CGFloat y = v65;
  v133.size.CGFloat width = v71;
  CGFloat v93 = v68;
  v133.size.CGFloat height = v68;
  v140.origin.CGFloat x = MidX;
  v140.origin.CGFloat y = MinY;
  if (CGRectIntersectsRect(v133, v140))
  {
    v134.origin.CGFloat x = v45;
    v134.origin.CGFloat y = v103;
    v134.size.CGFloat width = v49;
    v134.size.CGFloat height = v81;
    double v83 = CGRectGetMinY(v134);
    v135.origin.CGFloat x = v70;
    v135.origin.CGFloat y = v65;
    v135.size.CGFloat width = v112;
    v135.size.CGFloat height = v93;
    double v84 = fmax(v83 - CGRectGetMinY(v135), 0.0);
    v136.origin.CGFloat x = v70;
    v136.origin.CGFloat y = v65;
    v136.size.CGFloat width = v112;
    v136.size.CGFloat height = v93;
    double MaxY = CGRectGetMaxY(v136);
    v137.origin.CGFloat x = v45;
    v137.origin.CGFloat y = v103;
    v137.size.CGFloat width = v49;
    v137.size.CGFloat height = v102;
    double v86 = fmax(MaxY - CGRectGetMaxY(v137), 0.0);
  }
  else
  {
    double v84 = *v69;
    double v86 = v69[2];
  }
  v87 = [(ICHostedNotesAppearanceCoordinator *)self modeButtonHidingPresentedViewController];
  BOOL v88 = v87 != 0;

  v89 = [(ICHostedNotesAppearanceCoordinator *)self viewController];
  objc_msgSend(v89, "ic_hostedNotesUpdateAdditionalSafeAreaInsets:isModeButtonHidden:", v88, v84, rect2, v86, v99);
}

- (void)willPresentViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = [v4 object];

  uint64_t v6 = ICDynamicCast();

  if (v6
    && [(ICHostedNotesAppearanceCoordinator *)self shouldHideModeButtonWithPresentedViewController:v6])
  {
    [(ICHostedNotesAppearanceCoordinator *)self setModeButtonHidingPresentedViewController:v6];
    [(ICHostedNotesAppearanceCoordinator *)self updateAppearance];
  }
  MEMORY[0x1F41817F8]();
}

- (void)willDismissViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  double v5 = [v4 object];

  ICDynamicCast();
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v6 = [v9 transitionCoordinator];
  char v7 = [v6 isInteractive];

  id v8 = [(ICHostedNotesAppearanceCoordinator *)self modeButtonHidingPresentedViewController];

  if (v9 == v8 && (v7 & 1) == 0)
  {
    [(ICHostedNotesAppearanceCoordinator *)self setModeButtonHidingPresentedViewController:0];
    [(ICHostedNotesAppearanceCoordinator *)self updateAppearance];
  }
}

- (void)didDismissViewController:(id)a3
{
  id v6 = [a3 userInfo];
  id v4 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4FB2E58]];
  int v5 = [v4 BOOLValue];

  if (v5)
  {
    [(ICHostedNotesAppearanceCoordinator *)self setModeButtonHidingPresentedViewController:0];
    [(ICHostedNotesAppearanceCoordinator *)self updateAppearance];
  }
}

- (NSSet)modeButtonHidingModalTypes
{
  v3 = [(ICHostedNotesAppearanceCoordinator *)self delegate];
  id v4 = [v3 hostedNotesAppearanceCoordinatorModeButtonHidingModalTypes:self];

  return (NSSet *)v4;
}

- (NSSet)modeButtonHidingPopoverTypes
{
  v3 = [(ICHostedNotesAppearanceCoordinator *)self delegate];
  id v4 = [v3 hostedNotesAppearanceCoordinatorModeButtonHidingPopoverTypes:self];

  return (NSSet *)v4;
}

- (BOOL)shouldHideModeButtonWithPresentedViewController:(id)a3
{
  id v4 = a3;
  int v5 = [v4 presentationController];
  id v6 = [v5 presentingViewController];
  char v7 = [v6 _hostedWindowScene];
  if (v7
    && ([(ICHostedNotesAppearanceCoordinator *)self hostedWindowScene],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7 == v8))
  {
    double v10 = [v4 popoverPresentationController];

    double v11 = [(ICHostedNotesAppearanceCoordinator *)self viewController];
    double v12 = [v11 traitCollection];
    uint64_t v13 = [v12 horizontalSizeClass];

    if ([v4 modalPresentationStyle] == -1)
    {
      char v15 = 1;
    }
    else
    {
      if (v10) {
        BOOL v14 = v13 == 1;
      }
      else {
        BOOL v14 = 1;
      }
      char v15 = !v14;
    }
    double v16 = [(ICHostedNotesAppearanceCoordinator *)self modeButtonHidingModalTypes];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __86__ICHostedNotesAppearanceCoordinator_shouldHideModeButtonWithPresentedViewController___block_invoke;
    v27[3] = &unk_1E5FDB738;
    id v17 = v4;
    id v28 = v17;
    char v18 = objc_msgSend(v16, "ic_containsObjectPassingTest:", v27);

    char v19 = v15 ^ 1;
    if ((v15 & 1) == 0 && (v18 & 1) == 0)
    {
      double v20 = [(ICHostedNotesAppearanceCoordinator *)self delegate];
      char v19 = [v20 hostedNotesAppearanceCoordinator:self shouldHideWithModal:v17];
    }
    double v21 = [(ICHostedNotesAppearanceCoordinator *)self modeButtonHidingPopoverTypes];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __86__ICHostedNotesAppearanceCoordinator_shouldHideModeButtonWithPresentedViewController___block_invoke_2;
    v25[3] = &unk_1E5FDB738;
    id v26 = v17;
    char v22 = objc_msgSend(v21, "ic_containsObjectPassingTest:", v25);

    if (v10) {
      char v23 = v22;
    }
    else {
      char v23 = 0;
    }
    char v9 = v19 | v23;
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

uint64_t __86__ICHostedNotesAppearanceCoordinator_shouldHideModeButtonWithPresentedViewController___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

uint64_t __86__ICHostedNotesAppearanceCoordinator_shouldHideModeButtonWithPresentedViewController___block_invoke_2()
{
  return objc_opt_isKindOfClass() & 1;
}

- (_UIHostedWindowScene)hostedWindowScene
{
  v2 = [(ICHostedNotesAppearanceCoordinator *)self viewController];
  v3 = [v2 _hostedWindowScene];

  return (_UIHostedWindowScene *)v3;
}

- (UIViewController)viewController
{
  v3 = [(ICHostedNotesAppearanceCoordinator *)self delegate];
  id v4 = [v3 hostedNotesAppearanceCoordinatorSafeAreaViewController:self];

  return (UIViewController *)v4;
}

- (UIView)view
{
  v2 = [(ICHostedNotesAppearanceCoordinator *)self viewController];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (ICHostedNotesAppearanceCoordinating)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICHostedNotesAppearanceCoordinating *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)modeButtonHidingPresentedViewController
{
  return self->_modeButtonHidingPresentedViewController;
}

- (void)setModeButtonHidingPresentedViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeButtonHidingPresentedViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end