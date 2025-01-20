@interface MTALabelEditCell
- (BOOL)showingClearButton;
- (BOOL)textFieldShouldReturn:(id)a3;
- (MTALabelEditCell)init;
- (MTALabelEditCell)initWithDelegate:(id)a3 currentTitle:(id)a4 isEmpty:(BOOL)a5;
- (MTALabelEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTALabelEditCellDelegate)delegate;
- (NSLayoutConstraint)textfieldTrailConstraint;
- (UILabel)label;
- (UITextField)textfield;
- (id)getCurrentLabel;
- (void)activate;
- (void)adjustClearButtonInset;
- (void)awakeFromNib;
- (void)dealloc;
- (void)localSetup;
- (void)setCurrentTitle:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFont:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setTextfield:(id)a3;
- (void)setTextfieldTrailConstraint:(id)a3;
- (void)setupLabel;
- (void)setupLayoutConstraints;
- (void)setupTextField;
- (void)textFieldDidEndEditing:(id)a3;
- (void)textValueChanged:(id)a3;
@end

@implementation MTALabelEditCell

- (void)awakeFromNib
{
  v2.receiver = self;
  v2.super_class = (Class)MTALabelEditCell;
  [(MTALabelEditCell *)&v2 awakeFromNib];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)MTALabelEditCell;
  [(MTALabelEditCell *)&v4 setSelected:a3 animated:a4];
}

- (MTALabelEditCell)initWithDelegate:(id)a3 currentTitle:(id)a4 isEmpty:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v10 = [(MTALabelEditCell *)self init];
  v11 = v10;
  if (v10)
  {
    [(MTALabelEditCell *)v10 setDelegate:v8];
    v12 = [(MTALabelEditCell *)v11 textfield];
    v13 = v12;
    if (v5) {
      [v12 setPlaceholder:v9];
    }
    else {
      [v12 setText:v9];
    }
  }
  return v11;
}

- (MTALabelEditCell)init
{
  return [(MTALabelEditCell *)self initWithStyle:0 reuseIdentifier:off_1000C6688];
}

- (MTALabelEditCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MTALabelEditCell;
  objc_super v4 = [(MTALabelEditCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  BOOL v5 = v4;
  if (v4) {
    [(MTALabelEditCell *)v4 localSetup];
  }
  return v5;
}

- (void)localSetup
{
  [(MTALabelEditCell *)self setupLabel];
  [(MTALabelEditCell *)self setupTextField];

  [(MTALabelEditCell *)self setupLayoutConstraints];
}

- (void)setupLabel
{
  v3 = objc_opt_new();
  [(MTALabelEditCell *)self setLabel:v3];

  objc_super v4 = [(MTALabelEditCell *)self label];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  v6 = [(MTALabelEditCell *)self label];
  [v6 setFont:v5];

  objc_super v7 = +[NSBundle mainBundle];
  id v8 = [v7 localizedStringForKey:@"EDIT_LABEL" value:&stru_1000A2560 table:0];
  id v9 = [(MTALabelEditCell *)self label];
  [v9 setText:v8];

  v10 = [(MTALabelEditCell *)self label];
  LODWORD(v11) = 1144750080;
  [v10 setContentHuggingPriority:0 forAxis:v11];

  v12 = [(MTALabelEditCell *)self label];
  LODWORD(v13) = 1148846080;
  [v12 setContentCompressionResistancePriority:0 forAxis:v13];

  id v15 = [(MTALabelEditCell *)self contentView];
  v14 = [(MTALabelEditCell *)self label];
  [v15 addSubview:v14];
}

- (void)setupTextField
{
  v3 = objc_opt_new();
  [(MTALabelEditCell *)self setTextfield:v3];

  objc_super v4 = [(MTALabelEditCell *)self textfield];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v5 = +[UIColor mtui_secondaryTextColor];
  v6 = [(MTALabelEditCell *)self textfield];
  [v6 setTextColor:v5];

  objc_super v7 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
  id v8 = [(MTALabelEditCell *)self textfield];
  [v8 setFont:v7];

  id v9 = [(MTALabelEditCell *)self textfield];
  [v9 setDelegate:self];

  v10 = [(MTALabelEditCell *)self textfield];
  [v10 setTextAlignment:2];

  double v11 = [(MTALabelEditCell *)self textfield];
  [v11 setReturnKeyType:9];

  v12 = [(MTALabelEditCell *)self textfield];
  [v12 setClearButtonMode:1];

  double v13 = [(MTALabelEditCell *)self textfield];
  LODWORD(v14) = 1144750080;
  [v13 setContentCompressionResistancePriority:0 forAxis:v14];

  id v15 = +[NSNotificationCenter defaultCenter];
  v16 = [(MTALabelEditCell *)self textfield];
  [v15 addObserver:self selector:"textValueChanged:" name:UITextFieldTextDidChangeNotification object:v16];

  id v18 = [(MTALabelEditCell *)self contentView];
  v17 = [(MTALabelEditCell *)self textfield];
  [v18 addSubview:v17];
}

- (void)setupLayoutConstraints
{
  id v31 = (id)objc_opt_new();
  v3 = [(MTALabelEditCell *)self label];
  objc_super v4 = [v3 leadingAnchor];
  BOOL v5 = [(MTALabelEditCell *)self contentView];
  v6 = [v5 layoutMarginsGuide];
  objc_super v7 = [v6 leadingAnchor];
  id v8 = [v4 constraintEqualToAnchor:v7];
  [v31 addObject:v8];

  id v9 = [(MTALabelEditCell *)self label];
  v10 = [v9 centerYAnchor];
  double v11 = [(MTALabelEditCell *)self contentView];
  v12 = [v11 centerYAnchor];
  double v13 = [v10 constraintEqualToAnchor:v12];
  [v31 addObject:v13];

  double v14 = [(MTALabelEditCell *)self textfield];
  id v15 = [v14 leadingAnchor];
  v16 = [(MTALabelEditCell *)self label];
  v17 = [v16 trailingAnchor];
  id v18 = [v15 constraintEqualToAnchor:v17 constant:8.0];
  [v31 addObject:v18];

  v19 = [(MTALabelEditCell *)self textfield];
  v20 = [v19 trailingAnchor];
  v21 = [(MTALabelEditCell *)self contentView];
  v22 = [v21 layoutMarginsGuide];
  v23 = [v22 trailingAnchor];
  v24 = [v20 constraintEqualToAnchor:v23];
  [(MTALabelEditCell *)self setTextfieldTrailConstraint:v24];

  v25 = [(MTALabelEditCell *)self textfieldTrailConstraint];
  [v31 addObject:v25];

  v26 = [(MTALabelEditCell *)self textfield];
  v27 = [v26 centerYAnchor];
  v28 = [(MTALabelEditCell *)self contentView];
  v29 = [v28 centerYAnchor];
  v30 = [v27 constraintEqualToAnchor:v29];
  [v31 addObject:v30];

  +[NSLayoutConstraint activateConstraints:v31];
}

- (void)activate
{
  id v2 = [(MTALabelEditCell *)self textfield];
  [v2 becomeFirstResponder];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)MTALabelEditCell;
  [(MTALabelEditCell *)&v4 dealloc];
}

- (BOOL)showingClearButton
{
  v3 = [(MTALabelEditCell *)self textfield];
  if ([v3 isFirstResponder])
  {
    objc_super v4 = [(MTALabelEditCell *)self textfield];
    BOOL v5 = [v4 text];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)adjustClearButtonInset
{
  unsigned int v3 = [(MTALabelEditCell *)self showingClearButton];
  objc_super v4 = [(MTALabelEditCell *)self textfieldTrailConstraint];
  BOOL v5 = v4;
  double v6 = 0.0;
  if (v3) {
    double v6 = 8.0;
  }
  [v4 setConstant:v6];

  [(MTALabelEditCell *)self setNeedsLayout];
}

- (void)setFont:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTALabelEditCell;
  id v4 = a3;
  [(MTALabelEditCell *)&v7 setFont:v4];
  BOOL v5 = [(MTALabelEditCell *)self label];
  [v5 setFont:v4];

  double v6 = [(MTALabelEditCell *)self textfield];
  [v6 setFont:v4];
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  id v4 = [a3 text];
  BOOL v5 = +[NSCharacterSet whitespaceAndNewlineCharacterSet];
  id v9 = [v4 stringByTrimmingCharactersInSet:v5];

  if (![v9 length])
  {
    double v6 = [(MTALabelEditCell *)self delegate];
    objc_super v7 = [v6 defaultEditLabel];
    id v8 = [(MTALabelEditCell *)self textfield];
    [v8 setPlaceholder:v7];
  }
  [(MTALabelEditCell *)self adjustClearButtonInset];
}

- (void)textValueChanged:(id)a3
{
  id v6 = [a3 object];
  id v4 = [(MTALabelEditCell *)self delegate];
  BOOL v5 = [v6 text];
  [v4 didUpdateWithLabel:v5 sender:self];

  [(MTALabelEditCell *)self adjustClearButtonInset];
}

- (void)setCurrentTitle:(id)a3
{
  id v4 = a3;
  id v5 = [(MTALabelEditCell *)self textfield];
  [v5 setText:v4];
}

- (id)getCurrentLabel
{
  id v2 = [(MTALabelEditCell *)self textfield];
  unsigned int v3 = [v2 text];

  return v3;
}

- (MTALabelEditCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTALabelEditCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (UITextField)textfield
{
  return self->_textfield;
}

- (void)setTextfield:(id)a3
{
}

- (NSLayoutConstraint)textfieldTrailConstraint
{
  return self->_textfieldTrailConstraint;
}

- (void)setTextfieldTrailConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textfieldTrailConstraint, 0);
  objc_storeStrong((id *)&self->_textfield, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end