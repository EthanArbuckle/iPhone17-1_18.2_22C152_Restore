@interface PRXCardContainerView
- (BOOL)defersKeyboardUpdates;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)usePortraitTopInset;
- (CGSize)preferredContentSize;
- (PRXCardBackgroundView)backgroundView;
- (PRXCardContainerView)init;
- (PRXCardContainerView)initWithFrame:(CGRect)a3;
- (PRXCardContainerView)initWithFrame:(CGRect)a3 containerLayoutMargins:(NSDirectionalEdgeInsets)a4;
- (PRXCardContainerViewDelegate)delegate;
- (PRXPullDismissalScrollView)pullDismissalScrollView;
- (UIView)contentContainerView;
- (void)_updateKeyboardDeferred:(BOOL)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)setDefersKeyboardUpdates:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setUsePortraitTopInset:(BOOL)a3;
- (void)tappedView:(id)a3;
@end

@implementation PRXCardContainerView

- (PRXCardContainerView)init
{
  v3 = [MEMORY[0x263F1C920] mainScreen];
  [v3 bounds];
  v4 = -[PRXCardContainerView initWithFrame:](self, "initWithFrame:");

  return v4;
}

- (PRXCardContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v11 = PRXCardContainerDefaultLayoutMargins();
  return -[PRXCardContainerView initWithFrame:containerLayoutMargins:](self, "initWithFrame:containerLayoutMargins:", x, y, width, height, v11, v8, v9, v10);
}

- (PRXCardContainerView)initWithFrame:(CGRect)a3 containerLayoutMargins:(NSDirectionalEdgeInsets)a4
{
  CGFloat trailing = a4.trailing;
  CGFloat bottom = a4.bottom;
  CGFloat leading = a4.leading;
  CGFloat top = a4.top;
  v109[5] = *MEMORY[0x263EF8340];
  v106.receiver = self;
  v106.super_class = (Class)PRXCardContainerView;
  double v8 = -[PRXCardContainerView initWithFrame:](&v106, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  double v9 = v8;
  if (v8)
  {
    p_CGFloat top = &v8->_containerLayoutMargins.top;
    v8->_containerLayoutMargins.CGFloat top = top;
    v8->_containerLayoutMargins.CGFloat leading = leading;
    v8->_containerLayoutMargins.CGFloat bottom = bottom;
    v8->_containerLayoutMargins.CGFloat trailing = trailing;
    uint64_t v11 = [objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:v8 action:sel_tappedView_];
    tapRecognizer = v9->_tapRecognizer;
    v9->_tapRecognizer = (UITapGestureRecognizer *)v11;

    [(UITapGestureRecognizer *)v9->_tapRecognizer setDelegate:v9];
    [(PRXCardContainerView *)v9 addGestureRecognizer:v9->_tapRecognizer];
    v13 = objc_alloc_init(PRXPullDismissalScrollView);
    pullDismissalScrollView = v9->_pullDismissalScrollView;
    v9->_pullDismissalScrollView = v13;

    [(PRXPullDismissalScrollView *)v9->_pullDismissalScrollView setTranslatesAutoresizingMaskIntoConstraints:0];
    v15 = [(PRXPullDismissalScrollView *)v9->_pullDismissalScrollView dismissableContentContainerView];
    objc_msgSend(v15, "setDirectionalLayoutMargins:", *p_top, v9->_containerLayoutMargins.leading, v9->_containerLayoutMargins.bottom, v9->_containerLayoutMargins.trailing);
    [v15 setInsetsLayoutMarginsFromSafeArea:0];
    [(PRXCardContainerView *)v9 addSubview:v9->_pullDismissalScrollView];
    v16 = [PRXCardBackgroundView alloc];
    uint64_t v17 = -[PRXCardBackgroundView initWithFrame:containerLayoutMargins:](v16, "initWithFrame:containerLayoutMargins:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24), *p_top, v9->_containerLayoutMargins.leading, v9->_containerLayoutMargins.bottom, v9->_containerLayoutMargins.trailing);
    backgroundView = v9->_backgroundView;
    v9->_backgroundView = (PRXCardBackgroundView *)v17;

    [(PRXCardBackgroundView *)v9->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(PRXCardBackgroundView *)v9->_backgroundView setClipsToBounds:1];
    [v15 addSubview:v9->_backgroundView];
    PRXCardDefaultSize();
    v9->_preferredContentSize.double width = v19;
    v9->_preferredContentSize.double height = v20;
    v21 = -[PRXCardContentContainerView initWithFrame:]([PRXCardContentContainerView alloc], "initWithFrame:", 0.0, 0.0, v9->_preferredContentSize.width, v9->_preferredContentSize.height);
    contentContainerView = v9->_contentContainerView;
    v9->_contentContainerView = &v21->super;

    [(UIView *)v9->_contentContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v23 = v9->_contentContainerView;
    v24 = [(PRXPullDismissalScrollView *)v9->_pullDismissalScrollView panGestureRecognizer];
    [(UIView *)v23 addGestureRecognizer:v24];

    [(PRXCardBackgroundView *)v9->_backgroundView addSubview:v9->_contentContainerView];
    v25 = [(UIView *)v9->_contentContainerView widthAnchor];
    uint64_t v26 = [v25 constraintEqualToConstant:v9->_preferredContentSize.width];
    contentWidthConstraint = v9->_contentWidthConstraint;
    v9->_contentWidthConstraint = (NSLayoutConstraint *)v26;

    LODWORD(v28) = 1146388480;
    [(NSLayoutConstraint *)v9->_contentWidthConstraint setPriority:v28];
    v29 = [(UIView *)v9->_contentContainerView heightAnchor];
    uint64_t v30 = [v29 constraintEqualToConstant:v9->_preferredContentSize.height];
    contentHeightConstraint = v9->_contentHeightConstraint;
    v9->_contentHeightConstraint = (NSLayoutConstraint *)v30;

    LODWORD(v32) = 1146388480;
    [(NSLayoutConstraint *)v9->_contentHeightConstraint setPriority:v32];
    v33 = [v15 layoutMarginsGuide];
    unint64_t v34 = 0x263F08000uLL;
    v105 = v33;
    v104 = v15;
    if (PRXIsPad())
    {
      id v35 = objc_alloc_init(MEMORY[0x263F1C778]);
      [(PRXCardContainerView *)v9 addLayoutGuide:v35];
      v36 = [v35 heightAnchor];
      v37 = [(PRXCardContainerView *)v9 heightAnchor];
      uint64_t v38 = [v36 constraintEqualToAnchor:v37];
      visibleHeightConstraint = v9->_visibleHeightConstraint;
      v9->_visibleHeightConstraint = (NSLayoutConstraint *)v38;

      v98 = (void *)MEMORY[0x263F08938];
      v96 = [v35 widthAnchor];
      v40 = [v96 constraintEqualToConstant:0.0];
      v109[0] = v40;
      v41 = [v35 leadingAnchor];
      v101 = [v15 leadingAnchor];
      v100 = [v41 constraintEqualToAnchor:v101];
      v109[1] = v100;
      v109[2] = v9->_visibleHeightConstraint;
      v94 = [v35 bottomAnchor];
      v93 = [v15 bottomAnchor];
      v42 = [v94 constraintEqualToAnchor:v93];
      v109[3] = v42;
      v43 = [(UIView *)v9->_contentContainerView centerYAnchor];
      v44 = [v35 centerYAnchor];
      v45 = [v43 constraintEqualToAnchor:v44];
      v109[4] = v45;
      v46 = [MEMORY[0x263EFF8C0] arrayWithObjects:v109 count:5];
      [v98 activateConstraints:v46];

      v47 = v96;
      unint64_t v34 = 0x263F08000;
    }
    else
    {
      v48 = (void *)MEMORY[0x263F08938];
      id v35 = [(UIView *)v9->_contentContainerView bottomAnchor];
      v47 = [v33 bottomAnchor];
      v40 = [v35 constraintEqualToAnchor:v47];
      v108 = v40;
      v41 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v108 count:1];
      [v48 activateConstraints:v41];
    }

    v49 = [(PRXPullDismissalScrollView *)v9->_pullDismissalScrollView heightAnchor];
    v50 = [(PRXCardContainerView *)v9 heightAnchor];
    uint64_t v51 = [v49 constraintLessThanOrEqualToAnchor:v50];
    scrollViewHeightConstraint = v9->_scrollViewHeightConstraint;
    v9->_scrollViewHeightConstraint = (NSLayoutConstraint *)v51;

    v53 = [(PRXPullDismissalScrollView *)v9->_pullDismissalScrollView topAnchor];
    v54 = [(PRXCardContainerView *)v9 topAnchor];
    uint64_t v55 = [v53 constraintGreaterThanOrEqualToAnchor:v54];
    scrollViewTopConstraint = v9->_scrollViewTopConstraint;
    v9->_scrollViewTopConstraint = (NSLayoutConstraint *)v55;

    v57 = [(PRXPullDismissalScrollView *)v9->_pullDismissalScrollView bottomAnchor];
    v58 = [(PRXCardContainerView *)v9 bottomAnchor];
    uint64_t v59 = [v57 constraintEqualToAnchor:v58];
    scrollViewBottomConstraint = v9->_scrollViewBottomConstraint;
    v9->_scrollViewBottomConstraint = (NSLayoutConstraint *)v59;

    v61 = [(UIView *)v9->_contentContainerView topAnchor];
    v62 = [v105 topAnchor];
    uint64_t v63 = [v61 constraintEqualToAnchor:v62];
    contentTopConstraint = v9->_contentTopConstraint;
    v9->_contentTopConstraint = (NSLayoutConstraint *)v63;

    v86 = *(void **)(v34 + 2360);
    v103 = [(PRXCardBackgroundView *)v9->_backgroundView leadingAnchor];
    v102 = [(UIView *)v9->_contentContainerView leadingAnchor];
    v99 = [v103 constraintEqualToAnchor:v102];
    v107[0] = v99;
    v97 = [(PRXCardBackgroundView *)v9->_backgroundView trailingAnchor];
    v95 = [(UIView *)v9->_contentContainerView trailingAnchor];
    v92 = [v97 constraintEqualToAnchor:v95];
    v107[1] = v92;
    v91 = [(PRXCardBackgroundView *)v9->_backgroundView topAnchor];
    v90 = [(UIView *)v9->_contentContainerView topAnchor];
    v89 = [v91 constraintEqualToAnchor:v90];
    v107[2] = v89;
    v88 = [(PRXCardBackgroundView *)v9->_backgroundView bottomAnchor];
    v87 = [(UIView *)v9->_contentContainerView bottomAnchor];
    v85 = [v88 constraintEqualToAnchor:v87];
    v107[3] = v85;
    v84 = [(UIView *)v9->_contentContainerView leadingAnchor];
    v83 = [v105 leadingAnchor];
    v82 = [v84 constraintEqualToAnchor:v83];
    v107[4] = v82;
    v81 = [(UIView *)v9->_contentContainerView trailingAnchor];
    v80 = [v105 trailingAnchor];
    v79 = [v81 constraintEqualToAnchor:v80];
    v107[5] = v79;
    v78 = [(PRXPullDismissalScrollView *)v9->_pullDismissalScrollView leadingAnchor];
    v65 = [(PRXCardContainerView *)v9 leadingAnchor];
    v66 = [v78 constraintGreaterThanOrEqualToAnchor:v65];
    v107[6] = v66;
    v67 = [(PRXPullDismissalScrollView *)v9->_pullDismissalScrollView trailingAnchor];
    v68 = [(PRXCardContainerView *)v9 trailingAnchor];
    v69 = [v67 constraintLessThanOrEqualToAnchor:v68];
    v107[7] = v69;
    v70 = [(PRXPullDismissalScrollView *)v9->_pullDismissalScrollView centerXAnchor];
    v71 = [(PRXCardContainerView *)v9 centerXAnchor];
    v72 = [v70 constraintEqualToAnchor:v71];
    v107[8] = v72;
    v107[9] = v9->_scrollViewHeightConstraint;
    v107[10] = v9->_scrollViewTopConstraint;
    v107[11] = v9->_scrollViewBottomConstraint;
    v107[12] = v9->_contentWidthConstraint;
    v107[13] = v9->_contentHeightConstraint;
    v107[14] = v9->_contentTopConstraint;
    v73 = [MEMORY[0x263EFF8C0] arrayWithObjects:v107 count:15];
    [v86 activateConstraints:v73];

    v74 = [MEMORY[0x263F08A00] defaultCenter];
    [v74 addObserver:v9 selector:sel_keyboardWillShow_ name:*MEMORY[0x263F1D488] object:0];

    v75 = [MEMORY[0x263F08A00] defaultCenter];
    [v75 addObserver:v9 selector:sel_keyboardWillHide_ name:*MEMORY[0x263F1D480] object:0];

    v76 = v9;
  }

  return v9;
}

- (void)setUsePortraitTopInset:(BOOL)a3
{
  if (self->_usePortraitTopInset != a3)
  {
    self->_usePortraitTopInset = a3;
    if (a3) {
      double top = 88.0 - self->_containerLayoutMargins.top;
    }
    else {
      double top = self->_containerLayoutMargins.top;
    }
    [(NSLayoutConstraint *)self->_scrollViewTopConstraint setConstant:top];
  }
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  p_preferredContentSize = &self->_preferredContentSize;
  if (self->_preferredContentSize.width != a3.width || self->_preferredContentSize.height != a3.height)
  {
    double v8 = PRXDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(PRXCardContainerView *)v8 setPreferredContentSize:height];
    }

    p_preferredContentSize->double width = width;
    p_preferredContentSize->double height = height;
    [(NSLayoutConstraint *)self->_contentWidthConstraint setConstant:width];
    [(NSLayoutConstraint *)self->_contentHeightConstraint setConstant:height];
  }
}

- (void)setDefersKeyboardUpdates:(BOOL)a3
{
  if (self->_defersKeyboardUpdates != a3)
  {
    self->_defersKeyboardUpdates = a3;
    if (!a3) {
      [(PRXCardContainerView *)self _updateKeyboardDeferred:1];
    }
  }
}

- (void)keyboardWillShow:(id)a3
{
  v4 = [a3 userInfo];
  v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F1D428]];
  [v5 CGRectValue];
  self->_keyboardHeight = CGRectGetHeight(v7);

  [(PRXCardContainerView *)self _updateKeyboardDeferred:0];
}

- (void)keyboardWillHide:(id)a3
{
  self->_keyboardHeight = 0.0;
  [(PRXCardContainerView *)self _updateKeyboardDeferred:0];
}

- (void)_updateKeyboardDeferred:(BOOL)a3
{
  if (!self->_defersKeyboardUpdates)
  {
    [(NSLayoutConstraint *)self->_scrollViewBottomConstraint constant];
    double keyboardHeight = self->_keyboardHeight;
    if (v6 != -keyboardHeight)
    {
      if (!a3)
      {
        v10[0] = MEMORY[0x263EF8330];
        v10[1] = 3221225472;
        v10[2] = __48__PRXCardContainerView__updateKeyboardDeferred___block_invoke;
        v10[3] = &unk_264418170;
        v10[4] = self;
        [MEMORY[0x263F1CB60] performWithoutAnimation:v10];
        double keyboardHeight = self->_keyboardHeight;
      }
      if (keyboardHeight <= 0.0)
      {
        double v9 = 0.0;
        double v8 = 0.0;
        if (self->_usePortraitTopInset) {
          double v8 = 88.0 - self->_containerLayoutMargins.top;
        }
        PRXIsPad();
      }
      else
      {
        [(PRXCardContainerView *)self safeAreaInsets];
        double v8 = v7;
        double v9 = 0.0;
        if (PRXIsPad()) {
          double v9 = 6.0 - self->_containerLayoutMargins.top;
        }
      }
      [(NSLayoutConstraint *)self->_contentTopConstraint setConstant:v9];
      [(NSLayoutConstraint *)self->_scrollViewTopConstraint setConstant:v8];
      [(NSLayoutConstraint *)self->_scrollViewBottomConstraint setConstant:-self->_keyboardHeight];
      [(NSLayoutConstraint *)self->_visibleHeightConstraint setConstant:-self->_keyboardHeight];
      [(PRXPullDismissalScrollView *)self->_pullDismissalScrollView setScrollEnabled:self->_keyboardHeight == 0.0];
      self->_shouldDismissKeyboardOnTap = self->_keyboardHeight != 0.0;
      if (!a3) {
        [(PRXCardContainerView *)self layoutIfNeeded];
      }
    }
  }
}

uint64_t __48__PRXCardContainerView__updateKeyboardDeferred___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

- (void)tappedView:(id)a3
{
  if (self->_shouldDismissKeyboardOnTap)
  {
    id WeakRetained = [(PRXCardContainerView *)self firstResponder];
    [WeakRetained resignFirstResponder];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained backgroundTapped:self];
  }
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  if (self->_shouldDismissKeyboardOnTap)
  {
    BOOL v5 = 1;
  }
  else if (![(PRXPullDismissalScrollView *)self->_pullDismissalScrollView allowsPullToDismiss] {
         || ([(PRXPullDismissalScrollView *)self->_pullDismissalScrollView isDragging] & 1) != 0
  }
         || ([(PRXPullDismissalScrollView *)self->_pullDismissalScrollView isDecelerating] & 1) != 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      [v4 locationInView:self];
      -[PRXCardContainerView hitTest:withEvent:](self, "hitTest:withEvent:", 0);
      double v8 = (PRXCardContainerView *)objc_claimAutoreleasedReturnValue();
      BOOL v5 = v8 == self;
    }
    else
    {
      BOOL v5 = 0;
    }
  }
  return v5;
}

- (UIView)contentContainerView
{
  return self->_contentContainerView;
}

- (PRXCardBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (PRXPullDismissalScrollView)pullDismissalScrollView
{
  return self->_pullDismissalScrollView;
}

- (PRXCardContainerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PRXCardContainerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)usePortraitTopInset
{
  return self->_usePortraitTopInset;
}

- (BOOL)defersKeyboardUpdates
{
  return self->_defersKeyboardUpdates;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pullDismissalScrollView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_scrollViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentHeightConstraint, 0);
  objc_storeStrong((id *)&self->_contentWidthConstraint, 0);
  objc_storeStrong((id *)&self->_visibleHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewBottomConstraint, 0);
}

- (void)setPreferredContentSize:(double)a3 .cold.1(NSObject *a1, double a2, double a3)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v4 = NSStringFromCGSize(*(CGSize *)&a2);
  int v5 = 138412290;
  double v6 = v4;
  _os_log_debug_impl(&dword_21C6D2000, a1, OS_LOG_TYPE_DEBUG, "Card container view size changed to %@", (uint8_t *)&v5, 0xCu);
}

@end