@interface PTUISwitchRowTableViewCell
- (PTUISwitchRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)_valueChanged:(id)a3;
- (void)updateDisplayedValue;
@end

@implementation PTUISwitchRowTableViewCell

- (PTUISwitchRowTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)PTUISwitchRowTableViewCell;
  v4 = [(PTUISwitchRowTableViewCell *)&v11 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UISwitch *)objc_alloc_init(MEMORY[0x263F1CA10]);
    v6 = v4->_switch;
    v4->_switch = v5;

    v7 = v4->_switch;
    v8 = [(PTUISwitchRowTableViewCell *)v4 _tableView];
    v9 = [v8 tintColor];
    [(UISwitch *)v7 setOnTintColor:v9];

    [(UISwitch *)v4->_switch addTarget:v4 action:sel__valueChanged_ forControlEvents:4096];
    [(PTUISwitchRowTableViewCell *)v4 setAccessoryView:v4->_switch];
  }
  return v4;
}

- (void)updateDisplayedValue
{
  v3 = [(PTUIRowTableViewCell *)self row];
  id v4 = [v3 value];

  -[UISwitch setOn:](self->_switch, "setOn:", [v4 BOOLValue]);
}

- (void)_valueChanged:(id)a3
{
  BOOL v4 = [(UISwitch *)self->_switch isOn];
  id v6 = [(PTUIRowTableViewCell *)self row];
  v5 = [NSNumber numberWithBool:v4];
  [v6 setValue:v5];
}

- (void).cxx_destruct
{
}

@end