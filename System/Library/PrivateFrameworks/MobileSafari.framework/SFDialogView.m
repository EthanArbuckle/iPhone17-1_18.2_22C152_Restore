@interface SFDialogView
- (BOOL)becomeFirstResponder;
- (SFDialogView)initWithCoder:(id)a3;
- (SFDialogView)initWithFrame:(CGRect)a3;
- (SFDialogViewDelegate)delegate;
- (UIView)contentView;
- (void)_keyboardDismissGesture:(id)a3;
- (void)didAppear;
- (void)setDelegate:(id)a3;
- (void)setDialogActions:(id)a3;
- (void)setInputText:(id)a3 placeholder:(id)a4;
- (void)setMessageText:(id)a3;
- (void)setObscuredInsets:(UIEdgeInsets)a3;
- (void)setPasswordText:(id)a3 placeholder:(id)a4;
- (void)setTableViewRows:(id)a3 didSelectRowAction:(id)a4;
- (void)setTitleText:(id)a3;
- (void)setUsesOpaqueAppearance:(BOOL)a3;
- (void)willDisappear;
@end

@implementation SFDialogView

- (SFDialogView)initWithFrame:(CGRect)a3
{
  v86[18] = *MEMORY[0x1E4F143B8];
  v85.receiver = self;
  v85.super_class = (Class)SFDialogView;
  v3 = -[SFDialogView initWithFrame:](&v85, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(SFKeyboardLayoutAlignmentView);
    keyboardAlignmentView = v3->_keyboardAlignmentView;
    v3->_keyboardAlignmentView = v4;

    [(SFDialogView *)v3 addSubview:v3->_keyboardAlignmentView];
    id v6 = objc_alloc_init(MEMORY[0x1E4FB1940]);
    [v6 setIdentifier:@"SFDialogView.availableSpace"];
    [(SFDialogView *)v3 addLayoutGuide:v6];
    id v84 = objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    v7 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.4];
    [v84 setBackgroundColor:v7];

    [v84 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFDialogView *)v3 addSubview:v84];
    v8 = objc_alloc_init(SFDialogContentView);
    contentViewConfiguredForMinimumHeight = v3->_contentViewConfiguredForMinimumHeight;
    v3->_contentViewConfiguredForMinimumHeight = v8;

    [(SFDialogContentView *)v3->_contentViewConfiguredForMinimumHeight setHidden:1];
    [(SFDialogContentView *)v3->_contentViewConfiguredForMinimumHeight setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFDialogView *)v3 addSubview:v3->_contentViewConfiguredForMinimumHeight];
    v10 = objc_alloc_init(SFDialogContentView);
    contentView = v3->_contentView;
    v3->_contentView = v10;

    [(SFDialogContentView *)v3->_contentView setAccessibilityIdentifier:@"SFDialogView"];
    [(SFDialogContentView *)v3->_contentView setDialogView:v3];
    [(SFDialogContentView *)v3->_contentView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFDialogView *)v3 addSubview:v3->_contentView];
    v12 = [v6 topAnchor];
    v13 = [(SFDialogView *)v3 topAnchor];
    uint64_t v14 = [v12 constraintEqualToAnchor:v13];
    obscuredInsetTopConstraint = v3->_obscuredInsetTopConstraint;
    v3->_obscuredInsetTopConstraint = (NSLayoutConstraint *)v14;

    v16 = [v6 leftAnchor];
    v17 = [(SFDialogView *)v3 leftAnchor];
    uint64_t v18 = [v16 constraintEqualToAnchor:v17];
    obscuredInsetLeftConstraint = v3->_obscuredInsetLeftConstraint;
    v3->_obscuredInsetLeftConstraint = (NSLayoutConstraint *)v18;

    v20 = [v6 bottomAnchor];
    v21 = [(SFDialogView *)v3 bottomAnchor];
    uint64_t v22 = [v20 constraintEqualToAnchor:v21];
    obscuredInsetBottomConstraint = v3->_obscuredInsetBottomConstraint;
    v3->_obscuredInsetBottomConstraint = (NSLayoutConstraint *)v22;

    LODWORD(v24) = 1144750080;
    [(NSLayoutConstraint *)v3->_obscuredInsetBottomConstraint setPriority:v24];
    v25 = [v6 rightAnchor];
    v26 = [(SFDialogView *)v3 rightAnchor];
    uint64_t v27 = [v25 constraintEqualToAnchor:v26];
    obscuredInsetRightConstraint = v3->_obscuredInsetRightConstraint;
    v3->_obscuredInsetRightConstraint = (NSLayoutConstraint *)v27;

    v69 = (void *)MEMORY[0x1E4F28DC8];
    v83 = [v84 topAnchor];
    v82 = [(SFDialogView *)v3 topAnchor];
    v81 = [v83 constraintEqualToAnchor:v82];
    v86[0] = v81;
    v80 = [v84 leftAnchor];
    v79 = [(SFDialogView *)v3 leftAnchor];
    v78 = [v80 constraintEqualToAnchor:v79];
    v86[1] = v78;
    v77 = [v84 bottomAnchor];
    v76 = [(SFDialogView *)v3 bottomAnchor];
    v75 = [v77 constraintEqualToAnchor:v76];
    v86[2] = v75;
    v74 = [v84 rightAnchor];
    v73 = [(SFDialogView *)v3 rightAnchor];
    v72 = [v74 constraintEqualToAnchor:v73];
    v86[3] = v72;
    v86[4] = v3->_obscuredInsetTopConstraint;
    v86[5] = v3->_obscuredInsetLeftConstraint;
    v86[6] = v3->_obscuredInsetBottomConstraint;
    v71 = [v6 bottomAnchor];
    v70 = [(SFKeyboardLayoutAlignmentView *)v3->_keyboardAlignmentView topAnchor];
    v68 = [v71 constraintLessThanOrEqualToAnchor:v70];
    v86[7] = v68;
    v86[8] = v3->_obscuredInsetRightConstraint;
    v66 = [(SFDialogContentView *)v3->_contentView widthAnchor];
    v65 = [v66 constraintLessThanOrEqualToConstant:440.0];
    v86[9] = v65;
    v29 = [(SFDialogContentView *)v3->_contentView widthAnchor];
    v64 = [v29 constraintGreaterThanOrEqualToConstant:440.0];

    LODWORD(v30) = 1144750080;
    [v64 setPriority:v30];
    v86[10] = v64;
    v63 = [(SFDialogContentView *)v3->_contentView widthAnchor];
    v62 = [v6 widthAnchor];
    v61 = [v63 constraintLessThanOrEqualToAnchor:v62 constant:-40.0];
    v86[11] = v61;
    v60 = [(SFDialogContentView *)v3->_contentView heightAnchor];
    v59 = [v60 constraintLessThanOrEqualToConstant:500.0];
    v86[12] = v59;
    v58 = [(SFDialogContentView *)v3->_contentView heightAnchor];
    v57 = [(SFDialogContentView *)v3->_contentViewConfiguredForMinimumHeight heightAnchor];
    v56 = [v58 constraintGreaterThanOrEqualToAnchor:v57];
    v86[13] = v56;
    v31 = [(SFDialogContentView *)v3->_contentView heightAnchor];
    v32 = [v6 heightAnchor];
    v33 = [v31 constraintLessThanOrEqualToAnchor:v32 constant:-40.0];

    LODWORD(v34) = 1144750080;
    [v33 setPriority:v34];
    v86[14] = v33;
    v55 = [(SFDialogContentView *)v3->_contentView centerXAnchor];
    v35 = [v6 centerXAnchor];
    v36 = [v55 constraintEqualToAnchor:v35];
    v86[15] = v36;
    v37 = [(SFDialogContentView *)v3->_contentView centerYAnchor];
    v67 = v6;
    v38 = [v6 centerYAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];

    LODWORD(v40) = 1144750080;
    [v39 setPriority:v40];
    v86[16] = v39;
    v41 = [(SFDialogContentView *)v3->_contentView bottomAnchor];
    v42 = [v6 bottomAnchor];
    v43 = [v41 constraintLessThanOrEqualToAnchor:v42 constant:-20.0];
    v86[17] = v43;
    v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v86 count:18];
    [v69 activateConstraints:v44];

    LODWORD(v45) = 1148846080;
    [(SFDialogContentView *)v3->_contentViewConfiguredForMinimumHeight setContentHuggingPriority:1 forAxis:v45];
    LODWORD(v46) = 1148846080;
    [(SFDialogContentView *)v3->_contentViewConfiguredForMinimumHeight setContentCompressionResistancePriority:1 forAxis:v46];
    LODWORD(v47) = 1148846080;
    [(SFDialogContentView *)v3->_contentView setContentHuggingPriority:1 forAxis:v47];
    LODWORD(v48) = 1144750080;
    [(SFDialogContentView *)v3->_contentView setContentCompressionResistancePriority:1 forAxis:v48];
    uint64_t v49 = [objc_alloc(MEMORY[0x1E4FB1CC8]) initWithTarget:v3 action:sel__keyboardDismissGesture_];
    keyboardDismissSwipeGesture = v3->_keyboardDismissSwipeGesture;
    v3->_keyboardDismissSwipeGesture = (UISwipeGestureRecognizer *)v49;

    [(UISwipeGestureRecognizer *)v3->_keyboardDismissSwipeGesture setDirection:8];
    [(SFDialogView *)v3 addGestureRecognizer:v3->_keyboardDismissSwipeGesture];
    uint64_t v51 = [objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:v3 action:sel__keyboardDismissGesture_];
    keyboardDismissTapGesture = v3->_keyboardDismissTapGesture;
    v3->_keyboardDismissTapGesture = (UITapGestureRecognizer *)v51;

    [v84 addGestureRecognizer:v3->_keyboardDismissTapGesture];
    [(SFDialogView *)v3 setUsesOpaqueAppearance:0];
    v53 = v3;
  }
  return v3;
}

- (SFDialogView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFDialogView;
  return [(SFDialogView *)&v4 initWithCoder:a3];
}

- (BOOL)becomeFirstResponder
{
  return [(SFDialogContentView *)self->_contentView becomeFirstResponder];
}

- (void)setTitleText:(id)a3
{
  -[SFDialogContentView setTitleText:](self->_contentView, "setTitleText:");
  contentViewConfiguredForMinimumHeight = self->_contentViewConfiguredForMinimumHeight;
  if (a3) {
    id v6 = @"a";
  }
  else {
    id v6 = 0;
  }

  [(SFDialogContentView *)contentViewConfiguredForMinimumHeight setTitleText:v6];
}

- (void)setMessageText:(id)a3
{
  -[SFDialogContentView setMessageText:](self->_contentView, "setMessageText:");
  contentViewConfiguredForMinimumHeight = self->_contentViewConfiguredForMinimumHeight;
  if (a3) {
    id v6 = @"a";
  }
  else {
    id v6 = 0;
  }

  [(SFDialogContentView *)contentViewConfiguredForMinimumHeight setMessageText:v6];
}

- (void)setObscuredInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  [(NSLayoutConstraint *)self->_obscuredInsetTopConstraint setConstant:a3.top];
  [(NSLayoutConstraint *)self->_obscuredInsetBottomConstraint setConstant:-bottom];
  [(NSLayoutConstraint *)self->_obscuredInsetLeftConstraint setConstant:left];
  obscuredInsetRightConstraint = self->_obscuredInsetRightConstraint;

  [(NSLayoutConstraint *)obscuredInsetRightConstraint setConstant:-right];
}

- (void)setUsesOpaqueAppearance:(BOOL)a3
{
  if (a3)
  {
    id v4 = [MEMORY[0x1E4FB1618] whiteColor];
    [(SFDialogView *)self setBackgroundColor:v4];
  }
  else
  {
    [(SFDialogView *)self setBackgroundColor:0];
  }
}

- (void)setInputText:(id)a3 placeholder:(id)a4
{
  -[SFDialogContentView setInputText:placeholder:](self->_contentView, "setInputText:placeholder:");
  contentViewConfiguredForMinimumHeight = self->_contentViewConfiguredForMinimumHeight;
  if (a3) {
    v8 = @"a";
  }
  else {
    v8 = 0;
  }
  if (a4) {
    v9 = @"a";
  }
  else {
    v9 = 0;
  }
  v10 = v8;
  [(SFDialogContentView *)contentViewConfiguredForMinimumHeight setInputText:v10 placeholder:v9];
}

- (void)setPasswordText:(id)a3 placeholder:(id)a4
{
  -[SFDialogContentView setPasswordText:placeholder:](self->_contentView, "setPasswordText:placeholder:");
  contentViewConfiguredForMinimumHeight = self->_contentViewConfiguredForMinimumHeight;
  if (a3) {
    v8 = @"a";
  }
  else {
    v8 = 0;
  }
  if (a4) {
    v9 = @"a";
  }
  else {
    v9 = 0;
  }
  v10 = v8;
  [(SFDialogContentView *)contentViewConfiguredForMinimumHeight setPasswordText:v10 placeholder:v9];
}

- (void)setDialogActions:(id)a3
{
  contentView = self->_contentView;
  id v5 = a3;
  [(SFDialogContentView *)contentView setActions:v5];
  [(SFDialogContentView *)self->_contentViewConfiguredForMinimumHeight setActions:v5];
}

- (void)setTableViewRows:(id)a3 didSelectRowAction:(id)a4
{
  contentView = self->_contentView;
  id v7 = a4;
  id v8 = a3;
  [(SFDialogContentView *)contentView setTableViewRows:v8 didSelectRowAction:v7];
  [(SFDialogContentView *)self->_contentViewConfiguredForMinimumHeight setTableViewRows:v8 didSelectRowAction:v7];
}

- (void)didAppear
{
}

- (void)willDisappear
{
  [(SFKeyboardLayoutAlignmentView *)self->_keyboardAlignmentView setAutomaticKeyboardFrameTrackingDisabled:1];

  [(SFDialogView *)self endEditing:0];
}

- (void)_keyboardDismissGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    contentView = self->_contentView;
    [(SFDialogContentView *)contentView endEditing];
  }
}

- (SFDialogViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFDialogViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIView)contentView
{
  return &self->_contentView->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_obscuredInsetRightConstraint, 0);
  objc_storeStrong((id *)&self->_obscuredInsetBottomConstraint, 0);
  objc_storeStrong((id *)&self->_obscuredInsetLeftConstraint, 0);
  objc_storeStrong((id *)&self->_obscuredInsetTopConstraint, 0);
  objc_storeStrong((id *)&self->_keyboardDismissTapGesture, 0);
  objc_storeStrong((id *)&self->_keyboardDismissSwipeGesture, 0);
  objc_storeStrong((id *)&self->_keyboardAlignmentView, 0);
  objc_storeStrong((id *)&self->_contentViewConfiguredForMinimumHeight, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end