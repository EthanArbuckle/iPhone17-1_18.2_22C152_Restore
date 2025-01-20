@interface SFDialogContentView
- (BOOL)_usesLoginFormAppearance;
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)textFieldShouldReturn:(id)a3;
- (NSArray)actions;
- (SFDialogContentView)initWithCoder:(id)a3;
- (SFDialogContentView)initWithFrame:(CGRect)a3;
- (SFDialogView)dialogView;
- (double)_desiredButtonsWidth;
- (id)_stackedActionButtons;
- (id)keyCommands;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_actionTriggered:(id)a3;
- (void)_addStackedActionButtonsIfNeeded;
- (void)_escapeAction:(id)a3;
- (void)_focusInputTextField:(id)a3;
- (void)_invokeDelegateWithSelectedIndex:(unint64_t)a3;
- (void)_optionReturnAction:(id)a3;
- (void)_populateOptionalConstraints;
- (void)_returnAction:(id)a3;
- (void)_setText:(id)a3 placeholder:(id)a4 forTextField:(id)a5;
- (void)_updateActionButtons;
- (void)didAppear;
- (void)endEditing;
- (void)layoutSubviews;
- (void)setActions:(id)a3;
- (void)setDialogView:(id)a3;
- (void)setInputText:(id)a3 placeholder:(id)a4;
- (void)setMessageText:(id)a3;
- (void)setPasswordText:(id)a3 placeholder:(id)a4;
- (void)setTableViewRows:(id)a3 didSelectRowAction:(id)a4;
- (void)setTitleText:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateConstraints;
@end

@implementation SFDialogContentView

- (SFDialogContentView)initWithFrame:(CGRect)a3
{
  v59[2] = *MEMORY[0x1E4F143B8];
  v56.receiver = self;
  v56.super_class = (Class)SFDialogContentView;
  v3 = -[SFDialogContentView initWithFrame:](&v56, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    actionButtons = v3->_actionButtons;
    v3->_actionButtons = (NSArray *)MEMORY[0x1E4F1CBF0];

    v4->_actionIndexTriggeredByEscapeKey = 0x7FFFFFFFFFFFFFFFLL;
    v4->_actionIndexTriggeredByReturnKey = 0x7FFFFFFFFFFFFFFFLL;
    v4->_actionIndexTriggeredByOptionReturnKey = 0x7FFFFFFFFFFFFFFFLL;
    [(SFDialogContentView *)v4 _setContinuousCornerRadius:12.0];
    v6 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
    [(SFDialogContentView *)v4 setBackgroundColor:v6];

    v55 = [(SFDialogContentView *)v4 layer];
    borderColorForTraitCollection(0);
    id v7 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setBorderColor:", objc_msgSend(v7, "CGColor"));

    [v55 setBorderWidth:_SFOnePixel()];
    id v8 = [MEMORY[0x1E4FB1618] colorWithWhite:0.0 alpha:0.3];
    objc_msgSend(v55, "setShadowColor:", objc_msgSend(v8, "CGColor"));

    LODWORD(v9) = 1.0;
    [v55 setShadowOpacity:v9];
    objc_msgSend(v55, "setShadowOffset:", 0.0, 4.0);
    [v55 setShadowRadius:14.0];
    v10 = objc_alloc_init(SFDialogTextView);
    messageTextView = v4->_messageTextView;
    v4->_messageTextView = v10;

    [(SFDialogTextView *)v4->_messageTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(SFDialogContentView *)v4 addSubview:v4->_messageTextView];
    uint64_t v12 = newTextField();
    inputTextField = v4->_inputTextField;
    v4->_inputTextField = (SFDialogTextField *)v12;

    [(SFDialogTextField *)v4->_inputTextField setDelegate:v4];
    [(SFDialogContentView *)v4 addSubview:v4->_inputTextField];
    uint64_t v14 = newTextField();
    passwordTextField = v4->_passwordTextField;
    v4->_passwordTextField = (SFDialogTextField *)v14;

    [(SFDialogTextField *)v4->_passwordTextField setDelegate:v4];
    [(SFDialogTextField *)v4->_passwordTextField setReturnKeyType:1];
    [(SFDialogTextField *)v4->_passwordTextField setSecureTextEntry:1];
    [(SFDialogTextField *)v4->_passwordTextField setStackPosition:2];
    [(SFDialogContentView *)v4 addSubview:v4->_passwordTextField];
    id v16 = objc_alloc(MEMORY[0x1E4FB1D00]);
    [(SFDialogContentView *)v4 bounds];
    uint64_t v17 = objc_msgSend(v16, "initWithFrame:style:", 0);
    tableView = v4->_tableView;
    v4->_tableView = (UITableView *)v17;

    [(UITableView *)v4->_tableView setDataSource:v4];
    [(UITableView *)v4->_tableView setDelegate:v4];
    [(UITableView *)v4->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITableView *)v4->_tableView _setContinuousCornerRadius:12.0];
    v4->_selectedRow = 0;
    [(SFDialogContentView *)v4 addSubview:v4->_tableView];
    uint64_t v19 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    closeButton = v4->_closeButton;
    v4->_closeButton = (UIButton *)v19;

    v21 = [MEMORY[0x1E4FB1618] tertiaryLabelColor];
    [(UIButton *)v4->_closeButton setTintColor:v21];

    LODWORD(v22) = 1148846080;
    [(UIButton *)v4->_closeButton setContentCompressionResistancePriority:0 forAxis:v22];
    LODWORD(v23) = 1148846080;
    [(UIButton *)v4->_closeButton setContentCompressionResistancePriority:1 forAxis:v23];
    [(UIButton *)v4->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
    -[UIButton _setTouchInsets:](v4->_closeButton, "_setTouchInsets:", -20.0, -10.0, 0.0, -10.0);
    v54 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2908] scale:2];
    v53 = [MEMORY[0x1E4FB1818] systemImageNamed:@"xmark" withConfiguration:v54];
    [(UIButton *)v4->_closeButton setImage:v53 forState:0];
    [(UIButton *)v4->_closeButton addTarget:v4 action:sel__actionTriggered_ forEvents:0x2000];
    [(SFDialogContentView *)v4 addSubview:v4->_closeButton];
    v24 = (void *)MEMORY[0x1E4F28DC8];
    v25 = [(UIButton *)v4->_closeButton topAnchor];
    v26 = [(SFDialogContentView *)v4 topAnchor];
    v27 = [v25 constraintEqualToAnchor:v26 constant:17.0];
    v59[0] = v27;
    v28 = [(UIButton *)v4->_closeButton trailingAnchor];
    v29 = [(SFDialogContentView *)v4 trailingAnchor];
    v30 = [v28 constraintEqualToAnchor:v29 constant:-20.0];
    v59[1] = v30;
    v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    [v24 activateConstraints:v31];

    v51 = (void *)MEMORY[0x1E4F28DC8];
    v52 = [(SFDialogTextView *)v4->_messageTextView topAnchor];
    v32 = [(SFDialogContentView *)v4 topAnchor];
    v33 = [v52 constraintEqualToAnchor:v32];
    v58[0] = v33;
    v34 = [(SFDialogTextView *)v4->_messageTextView leadingAnchor];
    v35 = [(SFDialogContentView *)v4 leadingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    v58[1] = v36;
    v37 = [(SFDialogTextView *)v4->_messageTextView trailingAnchor];
    v38 = [(SFDialogContentView *)v4 trailingAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v58[2] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:3];
    [v51 activateConstraints:v40];

    v41 = [(SFDialogTextField *)v4->_inputTextField bottomAnchor];
    v42 = [(SFDialogTextField *)v4->_passwordTextField topAnchor];
    v43 = [v41 constraintEqualToAnchor:v42 constant:_SFOnePixel()];
    v57 = v43;
    uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v57 count:1];
    layoutConstraintsWhenInputAndPasswordAreVisible = v4->_layoutConstraintsWhenInputAndPasswordAreVisible;
    v4->_layoutConstraintsWhenInputAndPasswordAreVisible = (NSArray *)v44;

    v46 = [(UITableView *)v4->_tableView heightAnchor];
    +[SFPopoverSizingTableViewController caculateHeightForTableView:v4->_tableView targetGlobalRow:3 outGlobalRow:0];
    uint64_t v47 = objc_msgSend(v46, "constraintEqualToConstant:");
    tableViewHeightConstraint = v4->_tableViewHeightConstraint;
    v4->_tableViewHeightConstraint = (NSLayoutConstraint *)v47;

    [(SFDialogContentView *)v4 _populateOptionalConstraints];
    [(SFDialogContentView *)v4 setInputText:0 placeholder:0];
    [(SFDialogContentView *)v4 setPasswordText:0 placeholder:0];
    [(SFDialogContentView *)v4 setTableViewRows:0 didSelectRowAction:0];
    v49 = v4;
  }
  return v4;
}

- (SFDialogContentView)initWithCoder:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SFDialogContentView;
  return [(SFDialogContentView *)&v4 initWithCoder:a3];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  if (!self->_hasAttemptedHardwareKeyboardFocus && _SFDeviceIsPad())
  {
    v3 = [MEMORY[0x1E4FB1900] sharedInstance];
    if ([v3 isInHardwareKeyboardMode])
    {
      char v4 = [(SFDialogTextField *)self->_inputTextField isHidden];

      self->_hasAttemptedHardwareKeyboardFocus = 1;
      if ((v4 & 1) == 0
        && ([(SFDialogTextField *)self->_inputTextField becomeFirstResponder] & 1) != 0)
      {
        return 1;
      }
      goto LABEL_9;
    }
  }
  self->_hasAttemptedHardwareKeyboardFocus = 1;
LABEL_9:
  if (![(SFDialogTextField *)self->_inputTextField isHidden]
    || ([(SFDialogTextField *)self->_passwordTextField isHidden] & 1) != 0)
  {
    v6.receiver = self;
    v6.super_class = (Class)SFDialogContentView;
    return [(SFDialogContentView *)&v6 becomeFirstResponder];
  }
  [(SFDialogTextField *)self->_passwordTextField becomeFirstResponder];
  return 1;
}

- (id)keyCommands
{
  v8[4] = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel__returnAction_];
  v8[0] = v2;
  v3 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0x80000 action:sel__optionReturnAction_];
  v8[1] = v3;
  char v4 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B08] modifierFlags:0 action:sel__escapeAction_];
  v8[2] = v4;
  v5 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\t" modifierFlags:0 action:sel__focusInputTextField_];
  [v5 setWantsPriorityOverSystemBehavior:1];
  v8[3] = v5;
  objc_super v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];

  return v6;
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  id v6 = a4;
  if (sel__returnAction_ == a3)
  {
    if ([(SFDialogContentView *)self isFirstResponder])
    {
      uint64_t v8 = 448;
      goto LABEL_11;
    }
LABEL_13:
    BOOL v9 = 0;
    goto LABEL_16;
  }
  if (sel__optionReturnAction_ == a3)
  {
    if ([(SFDialogContentView *)self isFirstResponder])
    {
      uint64_t v8 = 432;
      goto LABEL_11;
    }
    goto LABEL_13;
  }
  if (sel__escapeAction_ != a3)
  {
    if (sel__focusInputTextField_ != a3)
    {
      v11.receiver = self;
      v11.super_class = (Class)SFDialogContentView;
      unsigned __int8 v7 = [(SFDialogContentView *)&v11 canPerformAction:a3 withSender:v6];
LABEL_15:
      BOOL v9 = v7;
      goto LABEL_16;
    }
    if (([(SFDialogTextField *)self->_inputTextField isHidden] & 1) == 0)
    {
      unsigned __int8 v7 = [(SFDialogContentView *)self isFirstResponder];
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  uint64_t v8 = 440;
LABEL_11:
  BOOL v9 = *(Class *)((char *)&self->super.super.super.isa + v8) != (Class)0x7FFFFFFFFFFFFFFFLL;
LABEL_16:

  return v9;
}

- (void)updateConstraints
{
  v6.receiver = self;
  v6.super_class = (Class)SFDialogContentView;
  [(SFDialogContentView *)&v6 updateConstraints];
  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_layoutConstraintsWhenInputIsVisible, -[SFDialogTextField isHidden](self->_inputTextField, "isHidden") ^ 1);
  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_layoutConstraintsWhenPasswordIsVisible, -[SFDialogTextField isHidden](self->_passwordTextField, "isHidden") ^ 1);
  v3 = (void *)MEMORY[0x1E4F28DC8];
  layoutConstraintsWhenInputAndPasswordAreVisible = self->_layoutConstraintsWhenInputAndPasswordAreVisible;
  if ([(SFDialogTextField *)self->_inputTextField isHidden]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = [(SFDialogTextField *)self->_passwordTextField isHidden] ^ 1;
  }
  objc_msgSend(v3, "sf_setConstraints:active:", layoutConstraintsWhenInputAndPasswordAreVisible, v5);
  objc_msgSend(MEMORY[0x1E4F28DC8], "sf_setConstraints:active:", self->_layoutConstraintsWhenTableViewIsVisible, -[UITableView isHidden](self->_tableView, "isHidden") ^ 1);
}

- (id)_stackedActionButtons
{
  actionButtons = self->_actionButtons;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __44__SFDialogContentView__stackedActionButtons__block_invoke;
  v5[3] = &unk_1E54EC148;
  v5[4] = self;
  v3 = [(NSArray *)actionButtons safari_mapObjectsUsingBlock:v5];

  return v3;
}

id __44__SFDialogContentView__stackedActionButtons__block_invoke(uint64_t a1, void *a2)
{
  if (*(void **)(*(void *)(a1 + 32) + 424) == a2) {
    return 0;
  }
  else {
    return a2;
  }
}

- (double)_desiredButtonsWidth
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(SFDialogContentView *)self _stackedActionButtons];
  long long v13 = 0u;
  long long v14 = 0u;
  double v3 = (double)(unint64_t)([v2 count] + 1) * 20.0;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    double v8 = *MEMORY[0x1E4FB2C68];
    double v9 = *(double *)(MEMORY[0x1E4FB2C68] + 8);
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "systemLayoutSizeFittingSize:", v8, v9, (void)v13);
        double v3 = v3 + v11;
        ++v10;
      }
      while (v6 != v10);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_populateOptionalConstraints
{
  v51[4] = *MEMORY[0x1E4F143B8];
  double v3 = [(SFDialogContentView *)self _stackedActionButtons];
  id v4 = [v3 lastObject];
  uint64_t v5 = [v4 topAnchor];
  uint64_t v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(SFDialogContentView *)self bottomAnchor];
  }
  v48 = v7;

  v45 = [(SFDialogTextField *)self->_inputTextField leadingAnchor];
  v42 = [(SFDialogContentView *)self leadingAnchor];
  double v8 = [v45 constraintEqualToAnchor:v42 constant:20.0];
  v51[0] = v8;
  double v9 = [(SFDialogTextField *)self->_inputTextField trailingAnchor];
  uint64_t v10 = [(SFDialogContentView *)self trailingAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10 constant:-20.0];
  v51[1] = v11;
  uint64_t v12 = [(SFDialogTextField *)self->_inputTextField topAnchor];
  long long v13 = [(SFDialogTextView *)self->_messageTextView bottomAnchor];
  long long v14 = [v12 constraintEqualToAnchor:v13];
  v51[2] = v14;
  long long v15 = [(SFDialogTextField *)self->_inputTextField bottomAnchor];
  long long v16 = [v15 constraintLessThanOrEqualToAnchor:v48 constant:-16.0];
  v51[3] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
  layoutConstraintsWhenInputIsVisible = self->_layoutConstraintsWhenInputIsVisible;
  self->_layoutConstraintsWhenInputIsVisible = v17;

  v46 = [(SFDialogTextField *)self->_passwordTextField leadingAnchor];
  v43 = [(SFDialogContentView *)self leadingAnchor];
  uint64_t v19 = [v46 constraintEqualToAnchor:v43 constant:20.0];
  v50[0] = v19;
  v20 = [(SFDialogTextField *)self->_passwordTextField trailingAnchor];
  v21 = [(SFDialogContentView *)self trailingAnchor];
  double v22 = [v20 constraintEqualToAnchor:v21 constant:-20.0];
  v50[1] = v22;
  double v23 = [(SFDialogTextField *)self->_passwordTextField topAnchor];
  v24 = [(SFDialogTextView *)self->_messageTextView bottomAnchor];
  v25 = [v23 constraintGreaterThanOrEqualToAnchor:v24];
  v50[2] = v25;
  v26 = [(SFDialogTextField *)self->_passwordTextField bottomAnchor];
  v27 = [v26 constraintLessThanOrEqualToAnchor:v48 constant:-16.0];
  v50[3] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:4];
  layoutConstraintsWhenPasswordIsVisible = self->_layoutConstraintsWhenPasswordIsVisible;
  self->_layoutConstraintsWhenPasswordIsVisible = v28;

  uint64_t v47 = [(UITableView *)self->_tableView leadingAnchor];
  uint64_t v44 = [(SFDialogContentView *)self leadingAnchor];
  v41 = [v47 constraintEqualToAnchor:v44 constant:20.0];
  v49[0] = v41;
  v30 = [(UITableView *)self->_tableView trailingAnchor];
  v31 = [(SFDialogContentView *)self trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31 constant:-20.0];
  v49[1] = v32;
  v33 = [(UITableView *)self->_tableView topAnchor];
  v34 = [(SFDialogTextView *)self->_messageTextView bottomAnchor];
  v35 = [v33 constraintGreaterThanOrEqualToAnchor:v34];
  v49[2] = v35;
  v36 = [(UITableView *)self->_tableView bottomAnchor];
  v37 = [v36 constraintLessThanOrEqualToAnchor:v48 constant:-16.0];
  tableViewHeightConstraint = self->_tableViewHeightConstraint;
  v49[3] = v37;
  v49[4] = tableViewHeightConstraint;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:5];
  layoutConstraintsWhenTableViewIsVisible = self->_layoutConstraintsWhenTableViewIsVisible;
  self->_layoutConstraintsWhenTableViewIsVisible = v39;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)SFDialogContentView;
  [(SFDialogContentView *)&v34 layoutSubviews];
  double v3 = [(SFDialogContentView *)self traitCollection];
  borderColorForTraitCollection(v3);
  id v4 = objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 CGColor];
  uint64_t v6 = [(SFDialogContentView *)self layer];
  [v6 setBorderColor:v5];

  [(UIButton *)self->_closeButton frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat rect = v13;
  [(SFDialogTextView *)self->_messageTextView frame];
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v22 = 20.0;
  if ([(UIButton *)self->_closeButton isHidden])
  {
    double v23 = 20.0;
  }
  else
  {
    double v24 = v15 + 20.0;
    double v25 = v17 + 16.0;
    double v26 = v19 + -40.0;
    double v27 = v21 + -32.0;
    if ([(UIView *)self _sf_usesLeftToRightLayout])
    {
      v35.origin.x = v15 + 20.0;
      v35.origin.y = v25;
      v35.size.width = v26;
      v35.size.height = v27;
      double MaxX = CGRectGetMaxX(v35);
      v36.origin.x = v8;
      v36.origin.y = v10;
      v36.size.width = v12;
      v36.size.height = rect;
      CGFloat MinX = CGRectGetMinX(v36);
      double v23 = 20.0;
      double v22 = MaxX - MinX + 13.0 + 20.0;
    }
    else
    {
      v37.origin.x = v8;
      v37.origin.y = v10;
      v37.size.width = v12;
      v37.size.height = rect;
      double v30 = CGRectGetMaxX(v37);
      v38.origin.x = v24;
      v38.origin.y = v25;
      v38.size.width = v26;
      v38.size.height = v27;
      double v22 = 20.0;
      double v23 = v30 - CGRectGetMinX(v38) + 13.0 + 20.0;
    }
  }
  -[SFDialogTextView setContentInsets:](self->_messageTextView, "setContentInsets:", 16.0, v23, 16.0, v22);
  messageTextView = self->_messageTextView;
  [(SFDialogTextView *)messageTextView frame];
  [(SFDialogTextView *)messageTextView setPreferredMaxLayoutWidth:CGRectGetWidth(v39)];
  [(SFDialogContentView *)self _addStackedActionButtonsIfNeeded];
  v33.receiver = self;
  v33.super_class = (Class)SFDialogContentView;
  [(SFDialogContentView *)&v33 layoutSubviews];
}

- (void)setTitleText:(id)a3
{
}

- (void)setMessageText:(id)a3
{
  [(SFDialogTextView *)self->_messageTextView setMessage:a3];
  [(SFDialogTextView *)self->_messageTextView setAccessibilityTraits:*MEMORY[0x1E4FB25A0]];
  messageTextView = self->_messageTextView;

  [(SFDialogTextView *)messageTextView setAccessibilityIdentifier:@"SFDialogViewMessageText"];
}

- (void)setInputText:(id)a3 placeholder:(id)a4
{
}

- (void)setPasswordText:(id)a3 placeholder:(id)a4
{
  [(SFDialogContentView *)self _setText:a3 placeholder:a4 forTextField:self->_passwordTextField];
  BOOL v5 = [(SFDialogContentView *)self _usesLoginFormAppearance];
  BOOL v6 = v5;
  [(SFDialogTextField *)self->_inputTextField setAutocorrectionType:v5];
  BOOL v7 = !v5;
  if (v5) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = 2;
  }
  if (v5) {
    uint64_t v9 = 4;
  }
  else {
    uint64_t v9 = 0;
  }
  if (v7) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = 2;
  }
  [(SFDialogTextField *)self->_inputTextField setAutocapitalizationType:v8];
  [(SFDialogTextField *)self->_inputTextField setReturnKeyType:v9];
  [(SFDialogTextField *)self->_inputTextField setStackPosition:v6];
  passwordTextField = self->_passwordTextField;

  [(SFDialogTextField *)passwordTextField setStackPosition:v10];
}

- (void)_setText:(id)a3 placeholder:(id)a4 forTextField:(id)a5
{
  id v8 = a5;
  unint64_t v9 = (unint64_t)a4;
  [v8 setText:a3];
  [v8 setPlaceholder:v9];

  [v8 setHidden:((unint64_t)a3 | v9) == 0];

  [(SFDialogContentView *)self setNeedsUpdateConstraints];
}

- (void)endEditing
{
  [(SFDialogTextField *)self->_inputTextField endEditing:1];
  passwordTextField = self->_passwordTextField;

  [(SFDialogTextField *)passwordTextField endEditing:1];
}

- (void)setActions:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = (NSArray *)[a3 copy];
  actions = self->_actions;
  self->_actions = v4;

  self->_actionIndexTriggeredByEscapeKey = 0x7FFFFFFFFFFFFFFFLL;
  self->_actionIndexTriggeredByReturnKey = 0x7FFFFFFFFFFFFFFFLL;
  BOOL v6 = self->_actions;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __34__SFDialogContentView_setActions___block_invoke;
  v20[3] = &unk_1E54EC170;
  v20[4] = self;
  [(NSArray *)v6 enumerateObjectsUsingBlock:v20];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v7 = [(SFDialogContentView *)self _stackedActionButtons];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v11++) removeFromSuperview];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v9);
  }

  [(UIButton *)self->_closeButton setHidden:1];
  CGFloat v12 = self->_actions;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __34__SFDialogContentView_setActions___block_invoke_2;
  v15[3] = &unk_1E54EC198;
  v15[4] = self;
  double v13 = [(NSArray *)v12 safari_mapObjectsUsingBlock:v15];
  actionButtons = self->_actionButtons;
  self->_actionButtons = v13;

  [(SFDialogContentView *)self _updateActionButtons];
  [(SFDialogContentView *)self _addStackedActionButtonsIfNeeded];
  [(SFDialogContentView *)self setNeedsUpdateConstraints];
}

void __34__SFDialogContentView_setActions___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([v5 activatingKeyboardShortcut] == 2) {
    *(void *)(*(void *)(a1 + 32) + 448) = a3;
  }
  if ([v5 activatingKeyboardShortcut] == 1) {
    *(void *)(*(void *)(a1 + 32) + 440) = a3;
  }
  uint64_t v6 = [v5 activatingKeyboardShortcut];

  if (v6 == 3) {
    *(void *)(*(void *)(a1 + 32) + 432) = a3;
  }
}

id __34__SFDialogContentView_setActions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 title];
  int v5 = [v4 isEqualToString:@"\n!cancel"];

  if (v5)
  {
    [*(id *)(*(void *)(a1 + 32) + 424) setHidden:0];
    id v6 = *(id *)(*(void *)(a1 + 32) + 424);
  }
  else
  {
    id v6 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    BOOL v7 = objc_msgSend(MEMORY[0x1E4FB1618], "sf_safariAccentColor");
    [v6 setTintColor:v7];

    LODWORD(v8) = 1148846080;
    [v6 setContentCompressionResistancePriority:1 forAxis:v8];
    [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v9 = [v6 titleLabel];
    [v9 setAdjustsFontForContentSizeCategory:1];

    uint64_t v10 = [v3 title];
    [v6 setTitle:v10 forState:0];

    if ([v3 hasCustomAction])
    {
      uint64_t v11 = &selRef_triggerCustomAction;
      id v12 = v3;
    }
    else
    {
      id v12 = *(id *)(a1 + 32);
      uint64_t v11 = &selRef__actionTriggered_;
    }
    [v6 addTarget:v12 action:*v11 forEvents:0x2000];
  }

  return v6;
}

- (void)_updateActionButtons
{
  actions = self->_actions;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__SFDialogContentView__updateActionButtons__block_invoke;
  v3[3] = &unk_1E54EC170;
  v3[4] = self;
  [(NSArray *)actions enumerateObjectsUsingBlock:v3];
}

void __43__SFDialogContentView__updateActionButtons__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = [a2 actionType];
  id v6 = (void *)MEMORY[0x1E4FB2908];
  if (v5) {
    id v6 = (void *)MEMORY[0x1E4FB28C8];
  }
  id v10 = [MEMORY[0x1E4FB08E8] preferredFontDescriptorWithTextStyle:*v6 addingSymbolicTraits:0x8000 options:3];
  BOOL v7 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v10 size:0.0];
  double v8 = [*(id *)(*(void *)(a1 + 32) + 408) objectAtIndexedSubscript:a3];
  uint64_t v9 = [v8 titleLabel];
  [v9 setFont:v7];
}

- (void)_addStackedActionButtonsIfNeeded
{
  v2 = self;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v3 = [(SFDialogContentView *)self _stackedActionButtons];
  [(SFDialogContentView *)v2 _desiredButtonsWidth];
  double v5 = v4;
  BOOL v6 = v4 <= 440.0;
  if (v2->cachedButtonAlignDirectionHorizontal != v6)
  {
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v55 objects:v62 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v56 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v55 + 1) + 8 * i) removeFromSuperview];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v55 objects:v62 count:16];
      }
      while (v9);
    }

    v2->cachedButtonAlignDirectionHorizontal = v6;
  }
  uint64_t v53 = [v3 count];
  if (v53)
  {
    uint64_t v12 = 0;
    v42 = v2;
    v52 = v3;
    do
    {
      double v13 = [v3 objectAtIndexedSubscript:v12];
      [(SFDialogContentView *)v2 addSubview:v13];
      if (v5 > 440.0)
      {
        if (v12)
        {
          double v26 = [(NSArray *)v2->_actionButtons objectAtIndexedSubscript:v12 - 1];
          uint64_t v27 = [v26 topAnchor];

          double v28 = -16.0;
        }
        else
        {
          uint64_t v27 = [(SFDialogContentView *)v2 bottomAnchor];
          double v28 = -10.0;
        }
        v48 = (void *)MEMORY[0x1E4F28DC8];
        v51 = [v13 centerXAnchor];
        objc_super v34 = [(SFDialogContentView *)v2 centerXAnchor];
        CGRect v35 = [v51 constraintEqualToAnchor:v34];
        v59[0] = v35;
        CGRect v36 = [v13 widthAnchor];
        CGRect v37 = [(SFDialogContentView *)v2 widthAnchor];
        CGRect v38 = [v36 constraintLessThanOrEqualToAnchor:v37 constant:-40.0];
        v59[1] = v38;
        CGRect v39 = [v13 bottomAnchor];
        v54 = (void *)v27;
        v40 = [v39 constraintEqualToAnchor:v27 constant:v28];
        v59[2] = v40;
        v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:3];
        [v48 activateConstraints:v41];

        if (v53 - 1 != v12)
        {
          v2 = v42;
          id v3 = v52;
          goto LABEL_24;
        }
        double v23 = [v13 topAnchor];
        v2 = v42;
        double v24 = [(SFDialogTextView *)v42->_messageTextView bottomAnchor];
        double v15 = [v23 constraintGreaterThanOrEqualToAnchor:v24];
        [v15 setActive:1];
        id v3 = v52;
      }
      else
      {
        if (v12)
        {
          double v14 = [(NSArray *)v2->_actionButtons objectAtIndexedSubscript:v12 - 1];
          v46 = (void *)MEMORY[0x1E4F28DC8];
          uint64_t v44 = [v13 topAnchor];
          uint64_t v49 = [v14 topAnchor];
          double v15 = [v44 constraintEqualToAnchor:v49];
          v60[0] = v15;
          v43 = [v13 trailingAnchor];
          long long v16 = [v14 leadingAnchor];
          long long v17 = [v43 constraintEqualToAnchor:v16 constant:-20.0];
          v60[1] = v17;
          long long v18 = [v13 bottomAnchor];
          v54 = v14;
          [v14 bottomAnchor];
          v20 = long long v19 = v2;
          double v21 = [v18 constraintEqualToAnchor:v20];
          v60[2] = v21;
          uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:3];
          [v46 activateConstraints:v22];

          double v23 = v44;
          v2 = v19;
          id v3 = v52;

          double v24 = (void *)v49;
          double v25 = v43;
        }
        else
        {
          v50 = (void *)MEMORY[0x1E4F28DC8];
          v29 = [v13 trailingAnchor];
          double v23 = [(SFDialogContentView *)v2 trailingAnchor];
          v54 = v29;
          double v24 = [v29 constraintEqualToAnchor:v23 constant:-20.0];
          v61[0] = v24;
          double v15 = [v13 topAnchor];
          uint64_t v47 = [(SFDialogTextView *)v2->_messageTextView bottomAnchor];
          v45 = [v15 constraintGreaterThanOrEqualToAnchor:v47];
          v61[1] = v45;
          double v30 = [v13 bottomAnchor];
          v31 = [(SFDialogContentView *)v2 bottomAnchor];
          v32 = [v30 constraintEqualToAnchor:v31 constant:-10.0];
          v61[2] = v32;
          objc_super v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:3];
          [v50 activateConstraints:v33];

          id v3 = v52;
          double v25 = (void *)v47;
        }
      }
LABEL_24:

      ++v12;
    }
    while (v53 != v12);
  }
  [(SFDialogContentView *)v2 _populateOptionalConstraints];
}

- (void)setTableViewRows:(id)a3 didSelectRowAction:(id)a4
{
  BOOL v6 = (NSArray *)a3;
  id v7 = a4;
  [(UITableView *)self->_tableView setHidden:[(NSArray *)v6 count] == 0];
  tableData = self->_tableData;
  self->_tableData = v6;
  uint64_t v9 = v6;

  uint64_t v10 = _Block_copy(v7);
  id tableDidSelectRowAction = self->_tableDidSelectRowAction;
  self->_id tableDidSelectRowAction = v10;

  [(UITableView *)self->_tableView reloadData];
  +[SFPopoverSizingTableViewController caculateHeightForTableView:self->_tableView targetGlobalRow:3 outGlobalRow:0];
  -[NSLayoutConstraint setConstant:](self->_tableViewHeightConstraint, "setConstant:");

  [(SFDialogContentView *)self setNeedsUpdateConstraints];
}

- (void)didAppear
{
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  double v4 = (SFDialogTextField *)a3;
  if ([(SFDialogContentView *)self _usesLoginFormAppearance] && self->_inputTextField == v4) {
    [(SFDialogTextField *)self->_passwordTextField becomeFirstResponder];
  }
  else {
    [(SFDialogContentView *)self _invokeDelegateWithSelectedIndex:self->_actionIndexTriggeredByReturnKey];
  }

  return 0;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return [(NSArray *)self->_tableData count];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  tableView = self->_tableView;
  id v6 = a4;
  id v7 = [(UITableView *)tableView dequeueReusableCellWithIdentifier:@"tableCell"];
  if (!v7) {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:3 reuseIdentifier:@"tableCell"];
  }
  uint64_t v8 = [MEMORY[0x1E4FB1818] systemImageNamed:@"checkmark"];
  uint64_t v9 = [v7 imageView];
  [v9 setImage:v8];

  BOOL v10 = [v6 row] != self->_selectedRow;
  uint64_t v11 = [v7 imageView];
  [v11 setHidden:v10];

  uint64_t v12 = -[NSArray safari_dictionaryAtIndex:](self->_tableData, "safari_dictionaryAtIndex:", [v6 row]);
  double v13 = objc_msgSend(v12, "safari_stringForKey:", @"textLabel");
  double v14 = [v7 textLabel];
  [v14 setText:v13];

  double v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  long long v16 = [v7 detailTextLabel];
  [v16 setTextColor:v15];

  tableData = self->_tableData;
  uint64_t v18 = [v6 row];

  long long v19 = [(NSArray *)tableData safari_dictionaryAtIndex:v18];
  double v20 = objc_msgSend(v19, "safari_stringForKey:", @"detailTextLabel");
  double v21 = [v7 detailTextLabel];
  [v21 setText:v20];

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  [(UITableView *)self->_tableView deselectRowAtIndexPath:v6 animated:1];
  int64_t selectedRow = self->_selectedRow;
  self->_int64_t selectedRow = [v6 row];
  if (selectedRow != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = [MEMORY[0x1E4F28D58] indexPathForRow:selectedRow inSection:0];
    uint64_t v9 = [v16 cellForRowAtIndexPath:v8];
    BOOL v10 = [v9 imageView];
    [v10 setHidden:1];
  }
  uint64_t v11 = [v16 cellForRowAtIndexPath:v6];
  uint64_t v12 = [v11 imageView];
  [v12 setHidden:0];

  id tableDidSelectRowAction = (void (**)(id, void *))self->_tableDidSelectRowAction;
  double v14 = -[NSArray safari_dictionaryAtIndex:](self->_tableData, "safari_dictionaryAtIndex:", [v6 row]);
  double v15 = [v14 objectForKeyedSubscript:@"context"];
  tableDidSelectRowAction[2](tableDidSelectRowAction, v15);
}

- (BOOL)_usesLoginFormAppearance
{
  if ([(SFDialogTextField *)self->_passwordTextField isHidden]) {
    return 0;
  }
  else {
    return [(SFDialogTextField *)self->_inputTextField isHidden] ^ 1;
  }
}

- (void)_actionTriggered:(id)a3
{
  NSUInteger v4 = [(NSArray *)self->_actionButtons indexOfObject:a3];

  [(SFDialogContentView *)self _invokeDelegateWithSelectedIndex:v4];
}

- (void)_focusInputTextField:(id)a3
{
}

- (void)_returnAction:(id)a3
{
}

- (void)_optionReturnAction:(id)a3
{
}

- (void)_escapeAction:(id)a3
{
}

- (void)_invokeDelegateWithSelectedIndex:(unint64_t)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogView);
  double v5 = [WeakRetained delegate];
  id v6 = [(SFDialogTextField *)self->_inputTextField text];
  id v7 = [(SFDialogTextField *)self->_passwordTextField text];
  [v5 dialogView:WeakRetained didSelectActionAtIndex:a3 withInputText:v6 passwordText:v7];
}

- (SFDialogView)dialogView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dialogView);

  return (SFDialogView *)WeakRetained;
}

- (void)setDialogView:(id)a3
{
}

- (NSArray)actions
{
  return self->_actions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_dialogView);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_layoutConstraintsWhenTableViewIsVisible, 0);
  objc_storeStrong(&self->_tableDidSelectRowAction, 0);
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_passwordTextField, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_layoutConstraintsWhenInputAndPasswordAreVisible, 0);
  objc_storeStrong((id *)&self->_layoutConstraintsWhenPasswordIsVisible, 0);
  objc_storeStrong((id *)&self->_layoutConstraintsWhenInputIsVisible, 0);
  objc_storeStrong((id *)&self->_inputTextField, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);

  objc_storeStrong((id *)&self->_actionButtons, 0);
}

@end