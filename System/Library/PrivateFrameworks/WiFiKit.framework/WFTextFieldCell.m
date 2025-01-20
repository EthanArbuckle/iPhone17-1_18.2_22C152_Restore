@interface WFTextFieldCell
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4;
- (BOOL)editable;
- (BOOL)hideLabel;
- (BOOL)textFieldShouldBeginEditing:(id)a3;
- (NSLayoutConstraint)labelWidthConstraint;
- (NSLayoutConstraint)stackViewBottomConstraint;
- (NSLayoutConstraint)stackViewLeadingConstraint;
- (NSLayoutConstraint)stackViewTopConstraint;
- (NSLayoutConstraint)trailingMarginConstraint;
- (UILabel)label;
- (UIStackView)stackView;
- (UITextField)textField;
- (double)_verticalPadding;
- (id)returnKeyHandler;
- (id)textChangeHandler;
- (void)_adjustStackViewPadding;
- (void)_updateStackViewForTraitCollection;
- (void)awakeFromNib;
- (void)copy:(id)a3;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setAccessoryType:(int64_t)a3;
- (void)setEditable:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setHideLabel:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)setLabelWidthConstraint:(id)a3;
- (void)setReturnKeyHandler:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setStackView:(id)a3;
- (void)setStackViewBottomConstraint:(id)a3;
- (void)setStackViewLeadingConstraint:(id)a3;
- (void)setStackViewTopConstraint:(id)a3;
- (void)setTextChangeHandler:(id)a3;
- (void)setTextField:(id)a3;
- (void)setTrailingMarginConstraint:(id)a3;
- (void)textFieldDidChange:(id)a3;
- (void)textFieldDidEndEditingExit:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation WFTextFieldCell

- (void)awakeFromNib
{
  self->_editable = 1;
  v14.receiver = self;
  v14.super_class = (Class)WFTextFieldCell;
  [(WFTextFieldCell *)&v14 awakeFromNib];
  v3 = [(WFTextFieldCell *)self textField];
  [v3 addTarget:self action:sel_textFieldDidChange_ forControlEvents:0x20000];

  v4 = [(WFTextFieldCell *)self textField];
  [v4 addTarget:self action:sel_textFieldDidEndEditingExit_ forControlEvents:0x80000];

  [(WFTextFieldCell *)self setSelectionStyle:0];
  [(WFTextFieldCell *)self _adjustStackViewPadding];
  v5 = [(WFTextFieldCell *)self textField];
  v6 = [v5 textInputTraits];
  [v6 setSmartQuotesType:1];

  v7 = [(WFTextFieldCell *)self textField];
  v8 = [v7 textInputTraits];
  [v8 setSmartDashesType:1];

  v9 = [MEMORY[0x263F1C550] defaultTextColor];
  v10 = [(WFTextFieldCell *)self label];
  [v10 setTextColor:v9];

  v11 = [MEMORY[0x263F1C550] defaultTextColor];
  v12 = [(WFTextFieldCell *)self textField];
  [v12 setTextColor:v11];

  if ([(WFTextFieldCell *)self _shouldReverseLayoutDirection])
  {
    v13 = [(WFTextFieldCell *)self textField];
    [v13 setTextAlignment:2];
  }
  [(WFTextFieldCell *)self _updateStackViewForTraitCollection];
}

- (void)_adjustStackViewPadding
{
  [(WFTextFieldCell *)self _verticalPadding];
  double v4 = v3;
  v5 = [(WFTextFieldCell *)self stackViewTopConstraint];
  [v5 setConstant:v4];

  [(WFTextFieldCell *)self _verticalPadding];
  double v7 = v6;
  id v8 = [(WFTextFieldCell *)self stackViewBottomConstraint];
  [v8 setConstant:v7];
}

- (double)_verticalPadding
{
  v2 = [(WFTextFieldCell *)self label];
  double v3 = [v2 font];
  [v3 _bodyLeading];
  double v5 = v4 * 0.5;

  return v5;
}

- (void)traitCollectionDidChange:(id)a3
{
  double v4 = [a3 preferredContentSizeCategory];
  double v5 = [(WFTextFieldCell *)self traitCollection];
  double v6 = [v5 preferredContentSizeCategory];
  char v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    [(WFTextFieldCell *)self _adjustStackViewPadding];
    [(WFTextFieldCell *)self _updateStackViewForTraitCollection];
  }
}

- (void)_updateStackViewForTraitCollection
{
  double v3 = [(WFTextFieldCell *)self traitCollection];
  int v4 = [v3 isLargeTextTraitCollection];

  double v5 = [(WFTextFieldCell *)self stackView];
  double v6 = v5;
  if (v4)
  {
    [v5 setAxis:1];

    char v7 = [(WFTextFieldCell *)self labelWidthConstraint];
    [v7 setActive:0];

    if ([(WFTextFieldCell *)self _shouldReverseLayoutDirection]) {
      return;
    }
    id v8 = [(WFTextFieldCell *)self textField];
    [v8 setTextAlignment:0];
  }
  else
  {
    [v5 setAxis:0];

    id v8 = [(WFTextFieldCell *)self labelWidthConstraint];
    [v8 setActive:1];
  }
}

- (void)textFieldDidChange:(id)a3
{
  int v4 = [(WFTextFieldCell *)self textChangeHandler];

  if (v4)
  {
    double v5 = [(WFTextFieldCell *)self textField];
    double v6 = [v5 text];
    if ([v6 length])
    {
      char v7 = [(WFTextFieldCell *)self textField];
      v9 = [v7 text];
    }
    else
    {
      v9 = &stru_26D9BFD58;
    }

    id v8 = [(WFTextFieldCell *)self textChangeHandler];
    ((void (**)(void, __CFString *))v8)[2](v8, v9);
  }
}

- (void)textFieldDidEndEditingExit:(id)a3
{
  int v4 = [(WFTextFieldCell *)self returnKeyHandler];

  if (v4)
  {
    double v5 = [(WFTextFieldCell *)self returnKeyHandler];
    v5[2](v5, self);
  }
}

- (void)setAccessoryType:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WFTextFieldCell;
  -[WFTextFieldCell setAccessoryType:](&v8, sel_setAccessoryType_);
  double v5 = [(WFTextFieldCell *)self trailingMarginConstraint];
  double v6 = v5;
  double v7 = 0.0;
  if (!a3) {
    double v7 = 8.0;
  }
  [v5 setConstant:v7];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)WFTextFieldCell;
  [(WFTextFieldCell *)&v4 setSelected:a3 animated:a4];
}

- (void)setEditable:(BOOL)a3
{
  if (self->_editable != a3) {
    self->_editable = a3;
  }
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)WFTextFieldCell;
  [(WFTextFieldCell *)&v10 prepareForReuse];
  double v3 = [(WFTextFieldCell *)self textField];
  [v3 setText:&stru_26D9BFD58];

  objc_super v4 = [(WFTextFieldCell *)self textField];
  [v4 setKeyboardType:0];

  double v5 = [(WFTextFieldCell *)self textField];
  [v5 setSecureTextEntry:0];

  [(WFTextFieldCell *)self setAccessoryType:0];
  self->_editable = 1;
  double v6 = [MEMORY[0x263F1C550] defaultTextColor];
  double v7 = [(WFTextFieldCell *)self label];
  [v7 setTextColor:v6];

  objc_super v8 = [MEMORY[0x263F1C550] defaultTextColor];
  v9 = [(WFTextFieldCell *)self textField];
  [v9 setTextColor:v8];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)becomeFirstResponder
{
  v2 = [(WFTextFieldCell *)self textField];
  char v3 = [v2 becomeFirstResponder];

  return v3;
}

- (void)setHideLabel:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hideLabel = a3;
  double v5 = [(WFTextFieldCell *)self labelWidthConstraint];
  [v5 setActive:v3 ^ 1];

  id v6 = [(WFTextFieldCell *)self label];
  [v6 setHidden:v3];
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  if (sel_copy_ == a3)
  {
    double v5 = [(WFTextFieldCell *)self textField];
    int v4 = [v5 isSecureTextEntry] ^ 1;
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (void)copy:(id)a3
{
  int v4 = [(WFTextFieldCell *)self textField];
  double v5 = [v4 text];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    id v9 = [(WFTextFieldCell *)self textField];
    double v7 = [v9 text];
    objc_super v8 = [MEMORY[0x263F1C840] generalPasteboard];
    [v8 setString:v7];
  }
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFTextFieldCell;
  [(WFTextFieldCell *)&v9 setEditing:a3 animated:a4];
  uint64_t v6 = [(WFTextFieldCell *)self stackViewLeadingConstraint];
  double v7 = v6;
  double v8 = 0.0;
  if (v4) {
    double v8 = 8.0;
  }
  [v6 setConstant:v8];
}

- (void)dealloc
{
  BOOL v3 = [(WFTextFieldCell *)self textField];
  [v3 removeTarget:self forEvents:655360];

  v4.receiver = self;
  v4.super_class = (Class)WFTextFieldCell;
  [(WFTextFieldCell *)&v4 dealloc];
}

- (BOOL)textFieldShouldBeginEditing:(id)a3
{
  return self->_editable;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UITextField)textField
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_textField);
  return (UITextField *)WeakRetained;
}

- (void)setTextField:(id)a3
{
}

- (id)textChangeHandler
{
  return self->_textChangeHandler;
}

- (void)setTextChangeHandler:(id)a3
{
}

- (id)returnKeyHandler
{
  return self->_returnKeyHandler;
}

- (void)setReturnKeyHandler:(id)a3
{
}

- (BOOL)editable
{
  return self->_editable;
}

- (BOOL)hideLabel
{
  return self->_hideLabel;
}

- (NSLayoutConstraint)trailingMarginConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_trailingMarginConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setTrailingMarginConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelWidthConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_labelWidthConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setLabelWidthConstraint:(id)a3
{
}

- (UIStackView)stackView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackView);
  return (UIStackView *)WeakRetained;
}

- (void)setStackView:(id)a3
{
}

- (NSLayoutConstraint)stackViewTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewTopConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setStackViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewBottomConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewBottomConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setStackViewBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)stackViewLeadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_stackViewLeadingConstraint);
  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setStackViewLeadingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_stackViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_stackViewBottomConstraint);
  objc_destroyWeak((id *)&self->_stackViewTopConstraint);
  objc_destroyWeak((id *)&self->_stackView);
  objc_destroyWeak((id *)&self->_labelWidthConstraint);
  objc_destroyWeak((id *)&self->_trailingMarginConstraint);
  objc_storeStrong(&self->_returnKeyHandler, 0);
  objc_storeStrong(&self->_textChangeHandler, 0);
  objc_destroyWeak((id *)&self->_textField);
  objc_storeStrong((id *)&self->_label, 0);
}

@end