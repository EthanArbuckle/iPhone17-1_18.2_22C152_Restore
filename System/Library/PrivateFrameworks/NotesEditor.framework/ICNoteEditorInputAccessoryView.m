@interface ICNoteEditorInputAccessoryView
- (BOOL)buttonsVisible;
- (BOOL)setButtonsVisibleWhenShown;
- (CGSize)intrinsicContentSize;
- (ICNoteEditorInputAccessoryView)initWithFrame:(CGRect)a3;
- (ICNoteEditorInputAccessoryViewDelegate)delegate;
- (ICNoteEditorToolbarDisclosureView)disclosureView;
- (NSLayoutConstraint)bottomConstraint;
- (NSLayoutConstraint)bottomMarginViewTopConstraint;
- (NSLayoutConstraint)disclosureViewBottomConstraint;
- (NSLayoutConstraint)disclosureViewTrailingConstraint;
- (NSLayoutConstraint)heightConstraint;
- (NSLayoutConstraint)toolbarTopConstraint;
- (UIToolbar)toolbar;
- (UIView)bottomMarginView;
- (UIView)containerView;
- (float)disclosureViewCloseTrailingOffset;
- (id)accessibilityElements;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)disclosureTapRecognizer:(id)a3;
- (void)hide;
- (void)hideDisclosureViewForTransition:(BOOL)a3;
- (void)safeAreaInsetsDidChange;
- (void)setBottomConstraint:(id)a3;
- (void)setBottomMarginView:(id)a3;
- (void)setBottomMarginViewTopConstraint:(id)a3;
- (void)setButtonsVisible:(BOOL)a3;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureView:(id)a3;
- (void)setDisclosureViewBottomConstraint:(id)a3;
- (void)setDisclosureViewCloseTrailingOffset:(float)a3;
- (void)setDisclosureViewTrailingConstraint:(id)a3;
- (void)setHeightConstraint:(id)a3;
- (void)setSetButtonsVisibleWhenShown:(BOOL)a3;
- (void)setToolbar:(id)a3;
- (void)setToolbarTopConstraint:(id)a3;
- (void)showWithDelay:(double)a3;
- (void)toggleDisclosureViewCloseStateWithTap:(BOOL)a3;
- (void)updateDisclosureViewTrailingConstraint;
- (void)updateLayoutWithSize:(CGSize)a3;
- (void)updateToolbarColorsWithForceUpdate:(BOOL)a3;
@end

@implementation ICNoteEditorInputAccessoryView

- (void)setDelegate:(id)a3
{
}

- (UIToolbar)toolbar
{
  return self->_toolbar;
}

- (ICNoteEditorInputAccessoryView)initWithFrame:(CGRect)a3
{
  v76.receiver = self;
  v76.super_class = (Class)ICNoteEditorInputAccessoryView;
  v3 = -[ICNoteEditorInputAccessoryView initWithFrame:](&v76, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(ICNoteEditorInputAccessoryView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [MEMORY[0x263EFF980] array];
    v6 = [(ICNoteEditorInputAccessoryView *)v4 heightAnchor];
    v7 = [v6 constraintEqualToConstant:44.0];
    [(ICNoteEditorInputAccessoryView *)v4 setHeightConstraint:v7];

    v8 = [(ICNoteEditorInputAccessoryView *)v4 heightConstraint];
    [v5 addObject:v8];

    v9 = [ICNoteEditorInputAccessoryContainerView alloc];
    double v10 = *MEMORY[0x263F001A8];
    double v11 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v12 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v13 = *(double *)(MEMORY[0x263F001A8] + 24);
    v14 = -[ICNoteEditorInputAccessoryContainerView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x263F001A8], v11, v12, v13);
    [(ICNoteEditorInputAccessoryView *)v4 setContainerView:v14];

    v15 = [(ICNoteEditorInputAccessoryView *)v4 containerView];
    [(ICNoteEditorInputAccessoryView *)v4 addSubview:v15];

    v16 = [(ICNoteEditorInputAccessoryView *)v4 containerView];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(ICNoteEditorInputAccessoryView *)v4 containerView];
    v18 = [v17 topAnchor];
    v19 = [(ICNoteEditorInputAccessoryView *)v4 topAnchor];
    v20 = [v18 constraintEqualToAnchor:v19];
    [v5 addObject:v20];

    v21 = [(ICNoteEditorInputAccessoryView *)v4 containerView];
    v22 = [v21 leftAnchor];
    v23 = [(ICNoteEditorInputAccessoryView *)v4 leftAnchor];
    v24 = [v22 constraintEqualToAnchor:v23];
    [v5 addObject:v24];

    v25 = [(ICNoteEditorInputAccessoryView *)v4 containerView];
    v26 = [v25 rightAnchor];
    v27 = [(ICNoteEditorInputAccessoryView *)v4 rightAnchor];
    v28 = [v26 constraintEqualToAnchor:v27];
    [v5 addObject:v28];

    v29 = [(ICNoteEditorInputAccessoryView *)v4 containerView];
    v30 = [v29 bottomAnchor];
    v31 = [(ICNoteEditorInputAccessoryView *)v4 bottomAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    [(ICNoteEditorInputAccessoryView *)v4 setBottomConstraint:v32];

    v33 = [(ICNoteEditorInputAccessoryView *)v4 bottomConstraint];
    [v5 addObject:v33];

    v34 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v10, v11, v12, v13);
    [(ICNoteEditorInputAccessoryView *)v4 setBottomMarginView:v34];

    v35 = [MEMORY[0x263F825C8] ICNoteEditorToolbarColor];
    v36 = [(ICNoteEditorInputAccessoryView *)v4 bottomMarginView];
    [v36 setBackgroundColor:v35];

    v37 = [(ICNoteEditorInputAccessoryView *)v4 bottomMarginView];
    [(ICNoteEditorInputAccessoryView *)v4 addSubview:v37];

    v38 = [(ICNoteEditorInputAccessoryView *)v4 bottomMarginView];
    [v38 setTranslatesAutoresizingMaskIntoConstraints:0];

    v39 = [(ICNoteEditorInputAccessoryView *)v4 bottomMarginView];
    v40 = [v39 topAnchor];
    v41 = [(ICNoteEditorInputAccessoryView *)v4 topAnchor];
    v42 = [v40 constraintEqualToAnchor:v41 constant:44.0];
    [(ICNoteEditorInputAccessoryView *)v4 setBottomMarginViewTopConstraint:v42];

    v43 = [(ICNoteEditorInputAccessoryView *)v4 bottomMarginViewTopConstraint];
    [v5 addObject:v43];

    v44 = [(ICNoteEditorInputAccessoryView *)v4 bottomMarginView];
    v45 = [v44 leftAnchor];
    v46 = [(ICNoteEditorInputAccessoryView *)v4 leftAnchor];
    v47 = [v45 constraintEqualToAnchor:v46];
    [v5 addObject:v47];

    v48 = [(ICNoteEditorInputAccessoryView *)v4 bottomMarginView];
    v49 = [v48 rightAnchor];
    v50 = [(ICNoteEditorInputAccessoryView *)v4 rightAnchor];
    v51 = [v49 constraintEqualToAnchor:v50];
    [v5 addObject:v51];

    v52 = [(ICNoteEditorInputAccessoryView *)v4 bottomMarginView];
    v53 = [v52 bottomAnchor];
    v54 = [(ICNoteEditorInputAccessoryView *)v4 bottomAnchor];
    v55 = [v53 constraintEqualToAnchor:v54];
    [v5 addObject:v55];

    v56 = -[ICNoteEditorToolbarDisclosureView initWithFrame:]([ICNoteEditorToolbarDisclosureView alloc], "initWithFrame:", 0.0, 0.0, 44.0, 44.0);
    [(ICNoteEditorInputAccessoryView *)v4 setDisclosureView:v56];

    v57 = [(ICNoteEditorInputAccessoryView *)v4 disclosureView];
    [v57 setTranslatesAutoresizingMaskIntoConstraints:0];

    v58 = [(ICNoteEditorInputAccessoryView *)v4 containerView];
    v59 = [(ICNoteEditorInputAccessoryView *)v4 disclosureView];
    [v58 addSubview:v59];

    v60 = (void *)MEMORY[0x263F08938];
    v61 = [(ICNoteEditorInputAccessoryView *)v4 containerView];
    v62 = [(ICNoteEditorInputAccessoryView *)v4 disclosureView];
    v63 = [v60 constraintWithItem:v61 attribute:4 relatedBy:0 toItem:v62 attribute:4 multiplier:1.0 constant:16.0];
    [(ICNoteEditorInputAccessoryView *)v4 setDisclosureViewBottomConstraint:v63];

    v64 = [(ICNoteEditorInputAccessoryView *)v4 disclosureViewBottomConstraint];
    [v5 addObject:v64];

    v65 = (void *)MEMORY[0x263F08938];
    v66 = [(ICNoteEditorInputAccessoryView *)v4 containerView];
    v67 = [(ICNoteEditorInputAccessoryView *)v4 disclosureView];
    v68 = [v65 constraintWithItem:v66 attribute:6 relatedBy:0 toItem:v67 attribute:6 multiplier:1.0 constant:16.0];
    [(ICNoteEditorInputAccessoryView *)v4 setDisclosureViewTrailingConstraint:v68];

    v69 = [(ICNoteEditorInputAccessoryView *)v4 disclosureViewTrailingConstraint];
    [v5 addObject:v69];

    v70 = [(ICNoteEditorInputAccessoryView *)v4 disclosureView];
    v71 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:v4 action:sel_disclosureTapRecognizer_];
    [v70 addGestureRecognizer:v71];

    v72 = [(ICNoteEditorInputAccessoryView *)v4 disclosureView];
    uint64_t v73 = [v72 closeState];

    [(ICNoteEditorInputAccessoryView *)v4 setClipsToBounds:v73];
    [MEMORY[0x263F08938] activateConstraints:v5];
    v74 = [(ICNoteEditorInputAccessoryView *)v4 disclosureView];
    [v74 setHidden:1];
  }
  return v4;
}

- (ICNoteEditorToolbarDisclosureView)disclosureView
{
  return self->_disclosureView;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (UIView)bottomMarginView
{
  return self->_bottomMarginView;
}

- (void)updateDisclosureViewTrailingConstraint
{
  id v8 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  double v3 = 16.0;
  if ([v8 closeState])
  {
    [(ICNoteEditorInputAccessoryView *)self disclosureViewCloseTrailingOffset];
    double v3 = v4;
  }
  [(ICNoteEditorInputAccessoryView *)self ic_directionalSafeAreaInsets];
  double v6 = v3 + v5;
  v7 = [(ICNoteEditorInputAccessoryView *)self disclosureViewTrailingConstraint];
  [v7 setConstant:v6];
}

- (NSLayoutConstraint)disclosureViewTrailingConstraint
{
  return self->_disclosureViewTrailingConstraint;
}

- (void)setToolbar:(id)a3
{
  double v5 = (UIToolbar *)a3;
  toolbar = self->_toolbar;
  if (toolbar != v5)
  {
    v32 = v5;
    [(UIToolbar *)toolbar removeFromSuperview];
    objc_storeStrong((id *)&self->_toolbar, a3);
    if (v32)
    {
      [(UIToolbar *)v32 setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIToolbar *)v32 setClipsToBounds:1];
      [(ICNoteEditorInputAccessoryView *)self updateToolbarColorsWithForceUpdate:1];
      v7 = [(ICNoteEditorInputAccessoryView *)self containerView];
      id v8 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
      [v7 insertSubview:v32 belowSubview:v8];

      v9 = [(ICNoteEditorInputAccessoryView *)self containerView];
      double v10 = [(ICNoteEditorInputAccessoryView *)self bottomMarginView];
      [v9 sendSubviewToBack:v10];

      double v11 = (void *)MEMORY[0x263F08938];
      double v12 = [(ICNoteEditorInputAccessoryView *)self containerView];
      double v13 = 0.0;
      v14 = [v11 constraintWithItem:v12 attribute:5 relatedBy:0 toItem:v32 attribute:5 multiplier:1.0 constant:0.0];
      [(ICNoteEditorInputAccessoryView *)self addConstraint:v14];

      v15 = (void *)MEMORY[0x263F08938];
      v16 = [(ICNoteEditorInputAccessoryView *)self containerView];
      v17 = [v15 constraintWithItem:v32 attribute:6 relatedBy:0 toItem:v16 attribute:6 multiplier:1.0 constant:0.0];
      [(ICNoteEditorInputAccessoryView *)self addConstraint:v17];

      v18 = [MEMORY[0x263F08938] constraintWithItem:v32 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:44.0];
      [(ICNoteEditorInputAccessoryView *)self addConstraint:v18];

      v19 = (void *)MEMORY[0x263F08938];
      v20 = [(ICNoteEditorInputAccessoryView *)self containerView];
      v21 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
      if (([v21 closeState] & 1) == 0)
      {
        [(ICNoteEditorInputAccessoryView *)self safeAreaInsets];
        double v13 = v22 + 44.0;
      }
      v23 = [v19 constraintWithItem:v32 attribute:3 relatedBy:0 toItem:v20 attribute:3 multiplier:1.0 constant:v13];
      [(ICNoteEditorInputAccessoryView *)self setToolbarTopConstraint:v23];

      v24 = [(ICNoteEditorInputAccessoryView *)self toolbarTopConstraint];
      [(ICNoteEditorInputAccessoryView *)self addConstraint:v24];

      v25 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
      uint64_t v26 = [v25 closeState] ^ 1;
      v27 = [(ICNoteEditorInputAccessoryView *)self toolbar];
      [v27 setHidden:v26];

      v28 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
      uint64_t v29 = [v28 closeState] ^ 1;
      v30 = [(ICNoteEditorInputAccessoryView *)self bottomMarginView];
      [v30 setHidden:v29];

      v31 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
      [v31 setHidden:1];
    }
  }

  MEMORY[0x270F9A758]();
}

- (void)updateToolbarColorsWithForceUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  double v5 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  double v6 = [v5 itemColor];

  v7 = [(ICNoteEditorInputAccessoryView *)self toolbar];
  id v8 = [v7 tintColor];
  int v9 = [v8 isEqual:v6];

  if (!v9 || v3)
  {
    [v7 setTintColor:v6];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    double v10 = objc_msgSend(v7, "items", 0);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v14++) setTintColor:v6];
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v12);
    }

    v15 = [MEMORY[0x263F825C8] ICNoteEditorToolbarColor];
    [v7 setBarTintColor:v15];
  }
}

- (NSLayoutConstraint)toolbarTopConstraint
{
  return self->_toolbarTopConstraint;
}

- (void)setToolbarTopConstraint:(id)a3
{
}

- (void)setHeightConstraint:(id)a3
{
}

- (void)setDisclosureViewTrailingConstraint:(id)a3
{
}

- (void)setDisclosureViewBottomConstraint:(id)a3
{
}

- (void)setDisclosureView:(id)a3
{
}

- (void)setContainerView:(id)a3
{
}

- (void)setBottomMarginViewTopConstraint:(id)a3
{
}

- (void)setBottomMarginView:(id)a3
{
}

- (void)setBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)heightConstraint
{
  return self->_heightConstraint;
}

- (NSLayoutConstraint)disclosureViewBottomConstraint
{
  return self->_disclosureViewBottomConstraint;
}

- (NSLayoutConstraint)bottomMarginViewTopConstraint
{
  return self->_bottomMarginViewTopConstraint;
}

- (NSLayoutConstraint)bottomConstraint
{
  return self->_bottomConstraint;
}

- (void)updateLayoutWithSize:(CGSize)a3
{
  BOOL v4 = a3.width <= a3.height;
  double v5 = 16.0;
  if (!v4) {
    double v5 = 15.0;
  }
  *(float *)&double v5 = v5;
  [(ICNoteEditorInputAccessoryView *)self setDisclosureViewCloseTrailingOffset:v5];

  [(ICNoteEditorInputAccessoryView *)self updateDisclosureViewTrailingConstraint];
}

- (void)setDisclosureViewCloseTrailingOffset:(float)a3
{
  self->_disclosureViewCloseTrailingOffset = a3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)ICNoteEditorInputAccessoryView;
  -[ICNoteEditorInputAccessoryView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  double v5 = (ICNoteEditorInputAccessoryView *)objc_claimAutoreleasedReturnValue();
  double v6 = v5;
  if (v5 == self) {
    double v5 = 0;
  }
  v7 = v5;

  return v7;
}

- (CGSize)intrinsicContentSize
{
  [(ICNoteEditorInputAccessoryView *)self safeAreaInsets];
  double v3 = v2 + 44.0;
  double v4 = -1.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (void)safeAreaInsetsDidChange
{
  [(ICNoteEditorInputAccessoryView *)self safeAreaInsets];
  double v4 = v3;
  if ([MEMORY[0x263F828A0] shouldMinimizeForHardwareKeyboard]) {
    double v5 = v4;
  }
  else {
    double v5 = 0.0;
  }
  double v6 = v5 + 44.0;
  v7 = [(ICNoteEditorInputAccessoryView *)self heightConstraint];
  [v7 setConstant:v5 + 44.0];

  id v8 = [(ICNoteEditorInputAccessoryView *)self bottomConstraint];
  [v8 setConstant:-v5];

  [(ICNoteEditorInputAccessoryView *)self updateDisclosureViewTrailingConstraint];
  objc_super v9 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  if ([v9 closeState]) {
    double v10 = 0.0;
  }
  else {
    double v10 = v5 + 44.0;
  }
  uint64_t v11 = [(ICNoteEditorInputAccessoryView *)self toolbarTopConstraint];
  [v11 setConstant:v10];

  id v13 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  if ([v13 closeState]) {
    double v6 = 44.0;
  }
  uint64_t v12 = [(ICNoteEditorInputAccessoryView *)self bottomMarginViewTopConstraint];
  [v12 setConstant:v6];
}

- (void)showWithDelay:(double)a3
{
  if ([(ICNoteEditorInputAccessoryView *)self setButtonsVisibleWhenShown])
  {
    [(ICNoteEditorInputAccessoryView *)self setButtonsVisible:1];
    [(ICNoteEditorInputAccessoryView *)self setSetButtonsVisibleWhenShown:0];
  }
  double v5 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  char v6 = [v5 closeState];

  if (v6)
  {
    v7 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
    [v7 setHidden:0];

    id v8 = [(ICNoteEditorInputAccessoryView *)self toolbar];
    [v8 setHidden:0];

    id v11 = [(ICNoteEditorInputAccessoryView *)self bottomMarginView];
    [v11 setHidden:0];
  }
  else
  {
    CGAffineTransformMakeScale(&v14, 0.0, 0.0);
    objc_super v9 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
    CGAffineTransform v13 = v14;
    [v9 setTransform:&v13];

    double v10 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
    [v10 setHidden:0];

    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __48__ICNoteEditorInputAccessoryView_showWithDelay___block_invoke;
    v12[3] = &unk_2640B8140;
    v12[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:0 delay:v12 options:0 animations:0.13 completion:a3];
  }
}

void __48__ICNoteEditorInputAccessoryView_showWithDelay___block_invoke(uint64_t a1)
{
  CGAffineTransformMakeScale(&v4, 1.0, 1.0);
  double v2 = [*(id *)(a1 + 32) disclosureView];
  CGAffineTransform v3 = v4;
  [v2 setTransform:&v3];
}

- (void)hide
{
  CGAffineTransform v3 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  char v4 = [v3 closeState];

  double v5 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  [v5 setHidden:1];

  if (v4)
  {
    char v6 = [(ICNoteEditorInputAccessoryView *)self toolbar];
    [v6 setHidden:1];
  }
  else
  {
    v7 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
    [v7 setCloseState:0];

    [(ICNoteEditorInputAccessoryView *)self safeAreaInsets];
    double v9 = v8 + 44.0;
    double v10 = [(ICNoteEditorInputAccessoryView *)self toolbarTopConstraint];
    [v10 setConstant:v9];

    id v11 = [(ICNoteEditorInputAccessoryView *)self toolbar];
    [v11 setHidden:1];

    uint64_t v12 = [(ICNoteEditorInputAccessoryView *)self toolbar];
    [v12 layoutIfNeeded];

    [(ICNoteEditorInputAccessoryView *)self safeAreaInsets];
    double v14 = v13 + 44.0;
    char v6 = [(ICNoteEditorInputAccessoryView *)self bottomMarginViewTopConstraint];
    [v6 setConstant:v14];
  }

  id v15 = [(ICNoteEditorInputAccessoryView *)self bottomMarginView];
  [v15 setHidden:1];
}

- (void)setButtonsVisible:(BOOL)a3
{
  int v3 = a3;
  double v5 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  int v6 = [v5 closeState];

  if (v6 != v3)
  {
    [(ICNoteEditorInputAccessoryView *)self toggleDisclosureViewCloseStateWithTap:0];
  }
}

- (BOOL)buttonsVisible
{
  double v2 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  char v3 = [v2 closeState];

  return v3;
}

- (void)hideDisclosureViewForTransition:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(ICNoteEditorInputAccessoryView *)self buttonsVisible])
  {
    double v5 = 1.0;
    v6[1] = 3221225472;
    v6[0] = MEMORY[0x263EF8330];
    v6[2] = __66__ICNoteEditorInputAccessoryView_hideDisclosureViewForTransition___block_invoke;
    v6[3] = &unk_2640B94E8;
    if (v3) {
      double v5 = 0.0;
    }
    v6[4] = self;
    *(double *)&v6[5] = v5;
    [MEMORY[0x263F82E00] animateWithDuration:v6 animations:0.2];
  }
}

void __66__ICNoteEditorInputAccessoryView_hideDisclosureViewForTransition___block_invoke(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) disclosureView];
  [v2 setAlpha:v1];
}

- (void)toggleDisclosureViewCloseStateWithTap:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 inputAccessoryDisclosureStateWillChange:self];
  }
  [(ICNoteEditorInputAccessoryView *)self safeAreaInsets];
  double v10 = v9 + 44.0;
  id v11 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  uint64_t v12 = [v11 closeState] ^ 1;
  double v13 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  [v13 setCloseState:v12];

  double v14 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  LODWORD(v12) = [v14 closeState];

  if (v12)
  {
    v29[0] = MEMORY[0x263EF8330];
    v29[1] = 3221225472;
    v29[2] = __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke;
    v29[3] = &unk_2640B94E8;
    v29[4] = self;
    *(double *)&v29[5] = v10;
    [MEMORY[0x263F82E00] performWithoutAnimation:v29];
    id v15 = [(ICNoteEditorInputAccessoryView *)self toolbarTopConstraint];
    [v15 setConstant:0.0];

    long long v16 = [(ICNoteEditorInputAccessoryView *)self bottomMarginViewTopConstraint];
    long long v17 = v16;
    double v18 = 44.0;
  }
  else
  {
    long long v19 = [(ICNoteEditorInputAccessoryView *)self toolbarTopConstraint];
    [v19 setConstant:v10];

    long long v16 = [(ICNoteEditorInputAccessoryView *)self bottomMarginViewTopConstraint];
    long long v17 = v16;
    double v18 = v10;
  }
  [v16 setConstant:v18];

  v20 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  if ([v20 closeState]) {
    double v21 = 0.5;
  }
  else {
    double v21 = 16.0;
  }
  uint64_t v22 = [(ICNoteEditorInputAccessoryView *)self disclosureViewBottomConstraint];
  [(id)v22 setConstant:v21];

  [(ICNoteEditorInputAccessoryView *)self updateDisclosureViewTrailingConstraint];
  v23 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  LOBYTE(v22) = [v23 closeState];

  if ((v22 & 1) == 0) {
    [(ICNoteEditorInputAccessoryView *)self setClipsToBounds:0];
  }
  v27[4] = self;
  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke_2;
  v28[3] = &unk_2640B8140;
  v28[4] = self;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke_3;
  v27[3] = &unk_2640B93C0;
  [MEMORY[0x263F82E00] animateWithDuration:v28 animations:v27 completion:0.25];
  id v24 = objc_loadWeakRetained((id *)p_delegate);
  char v25 = objc_opt_respondsToSelector();

  if (v25)
  {
    id v26 = objc_loadWeakRetained((id *)p_delegate);
    [v26 inputAccessoryDisclosureStateDidChange:self tapped:v3];
  }
}

uint64_t __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) toolbarTopConstraint];
  [v3 setConstant:v2];

  char v4 = [*(id *)(a1 + 32) toolbar];
  [v4 setHidden:0];

  double v5 = *(double *)(a1 + 40);
  int v6 = [*(id *)(a1 + 32) bottomMarginViewTopConstraint];
  [v6 setConstant:v5];

  char v7 = [*(id *)(a1 + 32) bottomMarginView];
  [v7 setHidden:0];

  [*(id *)(a1 + 32) setNeedsLayout];
  id v8 = *(void **)(a1 + 32);

  return [v8 layoutIfNeeded];
}

uint64_t __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

void __72__ICNoteEditorInputAccessoryView_toggleDisclosureViewCloseStateWithTap___block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) disclosureView];
  uint64_t v3 = [v2 closeState] ^ 1;
  char v4 = [*(id *)(a1 + 32) toolbar];
  [v4 setHidden:v3];

  double v5 = [*(id *)(a1 + 32) disclosureView];
  uint64_t v6 = [v5 closeState] ^ 1;
  char v7 = [*(id *)(a1 + 32) bottomMarginView];
  [v7 setHidden:v6];

  id v8 = [*(id *)(a1 + 32) disclosureView];
  LODWORD(v6) = [v8 closeState];

  if (v6)
  {
    double v9 = *(void **)(a1 + 32);
    [v9 setClipsToBounds:1];
  }
}

- (void)disclosureTapRecognizer:(id)a3
{
  [(ICNoteEditorInputAccessoryView *)self toggleDisclosureViewCloseStateWithTap:1];
  UIAccessibilityNotifications v4 = *MEMORY[0x263F831C0];
  id v5 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  UIAccessibilityPostNotification(v4, v5);
}

- (id)accessibilityElements
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  UIAccessibilityNotifications v4 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  int v5 = [v4 closeState];

  if (v5)
  {
    uint64_t v6 = [(ICNoteEditorInputAccessoryView *)self toolbar];
    char v7 = [v6 _accessibleSubviews];
    [v3 addObjectsFromArray:v7];
  }
  id v8 = [(ICNoteEditorInputAccessoryView *)self disclosureView];
  [v3 addObject:v8];

  double v9 = (void *)[v3 copy];

  return v9;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ICNoteEditorInputAccessoryView;
  [(ICNoteEditorInputAccessoryView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(ICNoteEditorInputAccessoryView *)self updateToolbarColorsWithForceUpdate:1];
}

- (ICNoteEditorInputAccessoryViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ICNoteEditorInputAccessoryViewDelegate *)WeakRetained;
}

- (BOOL)setButtonsVisibleWhenShown
{
  return self->_setButtonsVisibleWhenShown;
}

- (void)setSetButtonsVisibleWhenShown:(BOOL)a3
{
  self->_setButtonsVisibleWhenShown = a3;
}

- (float)disclosureViewCloseTrailingOffset
{
  return self->_disclosureViewCloseTrailingOffset;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bottomMarginViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_bottomMarginView, 0);
  objc_storeStrong((id *)&self->_toolbarTopConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_disclosureView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_bottomConstraint, 0);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end