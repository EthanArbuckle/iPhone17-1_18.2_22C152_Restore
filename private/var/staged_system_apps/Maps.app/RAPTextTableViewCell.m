@interface RAPTextTableViewCell
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (NSString)placeholder;
- (NSString)value;
- (RAPTextCellDelegate)delegate;
- (RAPTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (int)analyticTarget;
- (int64_t)correctableItemKind;
- (int64_t)preferredKeyboardType;
- (void)_contentSizeCategoryDidChange:(id)a3;
- (void)_instrumentTextFieldTap;
- (void)_setupConstraints;
- (void)_setupViews;
- (void)fieldChanged:(id)a3;
- (void)fieldSelected:(id)a3;
- (void)setAnalyticTarget:(int)a3;
- (void)setCorrectableItemKind:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setPlaceholder:(id)a3;
- (void)setPreferredKeyboardType:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation RAPTextTableViewCell

- (void)_setupViews
{
  v3 = (UITextField *)objc_alloc_init((Class)UITextField);
  valueField = self->_valueField;
  self->_valueField = v3;

  [(UITextField *)self->_valueField setClearButtonMode:1];
  v5 = +[RAPFontManager regularTitleFont];
  [(UITextField *)self->_valueField setFont:v5];

  [(UITextField *)self->_valueField setAutocorrectionType:1];
  [(UITextField *)self->_valueField setSpellCheckingType:1];
  [(UITextField *)self->_valueField setAutocapitalizationType:0];
  id v13 = [(UITextField *)self->_valueField _clearButton];
  v6 = +[UIColor systemGrayColor];
  [v13 setTintColor:v6];

  v7 = +[UIImage systemImageNamed:@"xmark.circle.fill"];
  [v13 setImage:v7 forState:0];

  v8 = +[UIImageSymbolConfiguration configurationWithPointSize:16.0];
  [v13 setPreferredSymbolConfiguration:v8 forImageInState:0];

  v9 = [(RAPTextTableViewCell *)self contentView];
  [v9 addSubview:self->_valueField];

  v10 = +[NSNotificationCenter defaultCenter];
  [v10 addObserver:self selector:"fieldChanged:" name:UITextFieldTextDidChangeNotification object:self->_valueField];

  v11 = +[NSNotificationCenter defaultCenter];
  [v11 addObserver:self selector:"fieldSelected:" name:UITextFieldTextDidBeginEditingNotification object:self->_valueField];

  v12 = +[NSNotificationCenter defaultCenter];
  [v12 addObserver:self selector:"_contentSizeCategoryDidChange:" name:UIContentSizeCategoryDidChangeNotification object:0];
}

- (void)_contentSizeCategoryDidChange:(id)a3
{
  v4 = +[RAPFontManager regularTitleFont];
  [(UITextField *)self->_valueField setFont:v4];

  v5 = [(UITextField *)self->_valueField font];
  [v5 _scaledValueForValue:33.0];
  -[NSLayoutConstraint setConstant:](self->_topToFirstBaselineConstraint, "setConstant:");

  id v6 = [(UITextField *)self->_valueField font];
  [v6 _scaledValueForValue:22.0];
  -[NSLayoutConstraint setConstant:](self->_lastBaselineToBottomConstraint, "setConstant:");
}

- (void)_setupConstraints
{
  +[NSLayoutConstraint deactivateConstraints:self->_constraints];
  [(UITextField *)self->_valueField setTranslatesAutoresizingMaskIntoConstraints:0];
  v3 = [(RAPTextTableViewCell *)self contentView];
  v4 = [(RAPTextTableViewCell *)self traitCollection];
  id v5 = [v4 userInterfaceIdiom];

  valueField = self->_valueField;
  if (v5 == (id)5)
  {
    v7 = [(UITextField *)valueField topAnchor];
    v8 = [v3 topAnchor];
    v9 = [v7 constraintEqualToAnchor:v8 constant:10.0];

    v10 = [(UITextField *)self->_valueField bottomAnchor];
    v11 = [v3 bottomAnchor];
    v12 = [v10 constraintEqualToAnchor:v11 constant:-10.0];
  }
  else
  {
    id v13 = [(UITextField *)valueField lastBaselineAnchor];
    v14 = [v3 topAnchor];
    v15 = [(UITextField *)self->_valueField font];
    [v15 _scaledValueForValue:33.0];
    [v13 constraintEqualToAnchor:v14];
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    topToFirstBaselineConstraint = self->_topToFirstBaselineConstraint;
    self->_topToFirstBaselineConstraint = v16;

    v18 = [v3 bottomAnchor];
    v19 = [(UITextField *)self->_valueField lastBaselineAnchor];
    v20 = [(UITextField *)self->_valueField font];
    [v20 _scaledValueForValue:22.0];
    [v18 constraintEqualToAnchor:v19];
    v21 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    lastBaselineToBottomConstraint = self->_lastBaselineToBottomConstraint;
    self->_lastBaselineToBottomConstraint = v21;

    v9 = self->_topToFirstBaselineConstraint;
    v12 = self->_lastBaselineToBottomConstraint;
  }
  v23 = [v3 leadingAnchor];
  v24 = [(UITextField *)self->_valueField leadingAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 constant:-15.0];
  v31[0] = v25;
  v26 = [v3 trailingAnchor];
  v27 = [(UITextField *)self->_valueField trailingAnchor];
  v28 = [v26 constraintEqualToAnchor:v27 constant:15.0];
  v31[1] = v28;
  v31[2] = v9;
  v31[3] = v12;
  v29 = +[NSArray arrayWithObjects:v31 count:4];
  constraints = self->_constraints;
  self->_constraints = v29;

  +[NSLayoutConstraint activateConstraints:self->_constraints];
}

- (RAPTextTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)RAPTextTableViewCell;
  v4 = [(RAPTextTableViewCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(RAPTextTableViewCell *)v4 _setupViews];
    [(RAPTextTableViewCell *)v5 _setupConstraints];
    [(RAPTextTableViewCell *)v5 setAccessoryType:0];
    [(RAPTextTableViewCell *)v5 setSelectionStyle:0];
    v5->_correctableItemKind = qword_1015E1AD8;
  }
  return v5;
}

- (void)fieldChanged:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int64_t v4 = [(RAPTextTableViewCell *)self correctableItemKind];
  id v5 = [(UITextField *)self->_valueField text];
  [WeakRetained valueForCorrectableItemKind:v4 changedTo:v5];
}

- (void)fieldSelected:(id)a3
{
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ((id)[(RAPTextTableViewCell *)self correctableItemKind] == (id)2
    && [v8 length])
  {
    if ([v8 hasPrefix:@"tel:"])
    {
      v9 = [v8 substringFromIndex:[@"tel:" length]];

      id v8 = [v9 stringByRemovingPercentEncoding];
    }
    v10 = [v7 text];
    v11 = [v10 stringByAppendingString:v8];

    if ([v11 length])
    {
      v12 = +[CNPhoneNumber phoneNumberWithStringValue:v11];
      id v13 = [v12 formattedStringValue];
      id v14 = [v13 length];
      BOOL v15 = v14 == 0;
      if (v14) {
        [(UITextField *)self->_valueField setText:v13];
      }
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    BOOL v15 = 1;
  }

  return v15;
}

- (void)_instrumentTextFieldTap
{
  int64_t correctableItemKind = self->_correctableItemKind;
  if (correctableItemKind)
  {
    if (correctableItemKind == 2)
    {
      uint64_t v3 = 10180;
    }
    else
    {
      if (correctableItemKind != 4) {
        return;
      }
      uint64_t v3 = 10179;
    }
  }
  else
  {
    uint64_t v3 = 10166;
  }
  uint64_t v4 = [(RAPTextTableViewCell *)self analyticTarget];

  +[GEOAPPortal captureUserAction:v3 target:v4 value:0];
}

- (void)setCorrectableItemKind:(int64_t)a3
{
  if (self->_correctableItemKind == a3) {
    return;
  }
  self->_int64_t correctableItemKind = a3;
  if (!a3)
  {
    [(UITextField *)self->_valueField setAutocapitalizationType:1];
    goto LABEL_8;
  }
  if (a3 != 2)
  {
    if (a3 == 4)
    {
      valueField = self->_valueField;
      uint64_t v5 = 3;
LABEL_9:
      [(UITextField *)valueField setKeyboardType:v5];
      id v6 = [(UITextField *)self->_valueField textInputTraits];
      id v8 = v6;
      uint64_t v7 = 0;
      goto LABEL_10;
    }
LABEL_8:
    valueField = self->_valueField;
    uint64_t v5 = 13;
    goto LABEL_9;
  }
  [(UITextField *)self->_valueField setKeyboardType:5];
  id v6 = [(UITextField *)self->_valueField textInputTraits];
  id v8 = v6;
  uint64_t v7 = 1;
LABEL_10:
  [v6 setContentsIsSingleValue:v7];
}

- (void)setPlaceholder:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_placeholder, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_placeholder, a3);
    [(UITextField *)self->_valueField setPlaceholder:v5];
  }
}

- (void)setValue:(id)a3
{
  id v5 = a3;
  if (!-[NSString isEqualToString:](self->_value, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_value, a3);
    [(UITextField *)self->_valueField setText:v5];
    [(RAPTextTableViewCell *)self setNeedsLayout];
    [(RAPTextTableViewCell *)self layoutIfNeeded];
  }
}

- (int64_t)preferredKeyboardType
{
  return (int64_t)[(UITextField *)self->_valueField keyboardType];
}

- (void)setPreferredKeyboardType:(int64_t)a3
{
  if ([(UITextField *)self->_valueField keyboardType] != (id)a3)
  {
    valueField = self->_valueField;
    [(UITextField *)valueField setKeyboardType:a3];
  }
}

- (RAPTextCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (RAPTextCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)correctableItemKind
{
  return self->_correctableItemKind;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (NSString)value
{
  return self->_value;
}

- (int)analyticTarget
{
  return self->_analyticTarget;
}

- (void)setAnalyticTarget:(int)a3
{
  self->_analyticTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_topToFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_constraints, 0);

  objc_storeStrong((id *)&self->_valueField, 0);
}

@end