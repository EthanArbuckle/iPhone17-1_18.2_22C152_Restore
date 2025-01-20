@interface MTUISwitchTableViewCell
- (MTUISwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (MTUISwitchTableViewCellDelegate)delegate;
- (UISwitch)enabledSwitch;
- (void)setDelegate:(id)a3;
- (void)setEnabledSwitch:(id)a3;
- (void)setSwitchStateEnabled:(BOOL)a3;
- (void)switchAction:(id)a3;
@end

@implementation MTUISwitchTableViewCell

- (MTUISwitchTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)MTUISwitchTableViewCell;
  v4 = [(MTUIBaseTableViewCell *)&v13 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = objc_opt_new();
    [(MTUISwitchTableViewCell *)v4 setEnabledSwitch:v5];

    v6 = [MEMORY[0x263F1C550] systemGreenColor];
    v7 = [(MTUISwitchTableViewCell *)v4 enabledSwitch];
    [v7 setOnTintColor:v6];

    v8 = objc_msgSend(MEMORY[0x263F1C550], "mtui_switchTintColor");
    v9 = [(MTUISwitchTableViewCell *)v4 enabledSwitch];
    [v9 setTintColor:v8];

    v10 = [(MTUISwitchTableViewCell *)v4 enabledSwitch];
    [v10 addTarget:v4 action:sel_switchAction_ forControlEvents:4096];

    v11 = [(MTUISwitchTableViewCell *)v4 enabledSwitch];
    [(MTUISwitchTableViewCell *)v4 setAccessoryView:v11];

    [(MTUISwitchTableViewCell *)v4 setSelectionStyle:0];
  }
  return v4;
}

- (void)switchAction:(id)a3
{
  id v6 = a3;
  v4 = [(MTUISwitchTableViewCell *)self delegate];

  if (v4)
  {
    v5 = [(MTUISwitchTableViewCell *)self delegate];
    objc_msgSend(v5, "switchDidChangeToState:senderCell:", objc_msgSend(v6, "isOn"), self);
  }
}

- (void)setSwitchStateEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(MTUISwitchTableViewCell *)self enabledSwitch];
  [v4 setOn:v3];
}

- (MTUISwitchTableViewCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MTUISwitchTableViewCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UISwitch)enabledSwitch
{
  return self->_enabledSwitch;
}

- (void)setEnabledSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enabledSwitch, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end