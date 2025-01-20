@interface TSWPTextFieldTableViewCell
- (TSWPTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UITextField)textField;
- (void)dealloc;
@end

@implementation TSWPTextFieldTableViewCell

- (TSWPTextFieldTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)TSWPTextFieldTableViewCell;
  v4 = [(TSWPTextFieldTableViewCell *)&v13 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = (void *)[(TSWPTextFieldTableViewCell *)v4 contentView];
    [v6 bounds];
    v11 = (UITextField *)objc_msgSend(objc_alloc(MEMORY[0x263F1CA98]), "initWithFrame:", v7 + 100.0, v9, v8 + -124.0, v10);
    v5->_textField = v11;
    [(UITextField *)v11 setAutoresizingMask:2];
    [(UITextField *)v5->_textField setReturnKeyType:9];
    [(UITextField *)v5->_textField setDelegate:v5];
    [(UITextField *)v5->_textField addTarget:v5 action:sel_p_endEditingOnExit forControlEvents:0x80000];
    objc_msgSend(v6, "insertSubview:aboveSubview:", v5->_textField, -[TSWPTextFieldTableViewCell textLabel](v5, "textLabel"));
  }
  return v5;
}

- (void)dealloc
{
  [(UITextField *)self->_textField removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  v3.receiver = self;
  v3.super_class = (Class)TSWPTextFieldTableViewCell;
  [(TSWPTextFieldTableViewCell *)&v3 dealloc];
}

- (UITextField)textField
{
  return self->_textField;
}

@end