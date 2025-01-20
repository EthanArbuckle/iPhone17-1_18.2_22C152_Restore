@interface MTAAlarmEditableTextCell
- (BOOL)textFieldShouldReturn:(id)a3;
- (MTAAlarmEditableTextCell)initWithText:(id)a3 autoCapsType:(int64_t)a4;
- (UITextField)textField;
- (void)layoutSubviews;
- (void)setUserInteractionEnabled:(BOOL)a3;
@end

@implementation MTAAlarmEditableTextCell

- (MTAAlarmEditableTextCell)initWithText:(id)a3 autoCapsType:(int64_t)a4
{
  id v6 = a3;
  v22.receiver = self;
  v22.super_class = (Class)MTAAlarmEditableTextCell;
  v7 = [(MTAAlarmEditableTextCell *)&v22 init];
  v8 = v7;
  if (v7)
  {
    [(MTAAlarmEditableTextCell *)v7 setSelectionStyle:0];
    v9 = [objc_alloc((Class)UITextField) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    textField = v8->_textField;
    v8->_textField = v9;

    [(UITextField *)v8->_textField _setForcesClearButtonHighContrastAppearance:1];
    [(UITextField *)v8->_textField setText:v6];
    v11 = +[UIColor mtui_primaryTextColor];
    [(UITextField *)v8->_textField setTextColor:v11];

    v12 = +[UIColor mtui_tintColor];
    [(UITextField *)v8->_textField setTintColor:v12];

    [(UITextField *)v8->_textField setAutocapitalizationType:a4];
    [(UITextField *)v8->_textField setBorderStyle:0];
    v13 = +[UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    [(UITextField *)v8->_textField setFont:v13];

    [(UITextField *)v8->_textField setAdjustsFontForContentSizeCategory:1];
    [(UITextField *)v8->_textField setAdjustsFontSizeToFitWidth:1];
    [(UITextField *)v8->_textField setReturnKeyType:9];
    [(UITextField *)v8->_textField setClearButtonMode:3];
    [(UITextField *)v8->_textField setDelegate:v8];
    [(UITextField *)v8->_textField setEnablesReturnKeyAutomatically:1];
    [(UITextField *)v8->_textField setKeyboardAppearance:1];
    v14 = [(UITextField *)v8->_textField _clearButton];
    v15 = [v14 imageForState:0];

    v16 = +[UIColor secondaryLabelColor];
    v17 = [v15 mtui_imageWithTintColor:v16];

    v18 = [(UITextField *)v8->_textField _clearButton];
    [v18 setImage:v17 forState:0];

    v19 = [(MTAAlarmEditableTextCell *)v8 contentView];
    [v19 addSubview:v8->_textField];

    [(MTAAlarmEditableTextCell *)v8 setNeedsLayout];
    v20 = v8;
  }
  return v8;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)MTAAlarmEditableTextCell;
  [(MTAAlarmEditableTextCell *)&v4 layoutSubviews];
  [(UITextField *)self->_textField isUserInteractionEnabled];
  v3 = [(MTAAlarmEditableTextCell *)self contentView];
  [v3 bounds];

  UIRectCenteredYInRect();
  -[UITextField setFrame:](self->_textField, "setFrame:");
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  v3 = [a3 text];
  id v4 = [v3 length];

  if (v4)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 postNotificationName:@"kMTAEditAlarmTitleFinishedNotification" object:0];
  }
  return v4 != 0;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(MTAAlarmEditableTextCell *)self isUserInteractionEnabled] != a3)
  {
    v5.receiver = self;
    v5.super_class = (Class)MTAAlarmEditableTextCell;
    [(MTAAlarmEditableTextCell *)&v5 setUserInteractionEnabled:v3];
    [(UITextField *)self->_textField setUserInteractionEnabled:v3];
    [(MTAAlarmEditableTextCell *)self setNeedsLayout];
  }
}

- (UITextField)textField
{
  return self->_textField;
}

- (void).cxx_destruct
{
}

@end