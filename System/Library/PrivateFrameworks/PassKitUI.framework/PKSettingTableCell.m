@interface PKSettingTableCell
- (BOOL)isOn;
- (PKSettingTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (PKSettingTableCell)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5;
- (SEL)action;
- (UISwitch)settingSwitch;
- (id)target;
- (void)dealloc;
- (void)prepareForReuse;
- (void)setOn:(BOOL)a3;
- (void)setOn:(BOOL)a3 notify:(BOOL)a4;
- (void)setSettingSwitch:(id)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
- (void)showSpinner:(BOOL)a3;
@end

@implementation PKSettingTableCell

- (PKSettingTableCell)initWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [(PKSettingTableCell *)self initWithStyle:0 reuseIdentifier:0];
  [(PKSettingTableCell *)v10 setTarget:v8 action:a5];

  v11 = [(PKSettingTableCell *)v10 textLabel];
  [v11 setText:v9];

  v12 = [(PKSettingTableCell *)v10 textLabel];
  [v12 setNumberOfLines:0];

  v13 = [(PKSettingTableCell *)v10 textLabel];
  [v13 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  return v10;
}

- (PKSettingTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)PKSettingTableCell;
  v4 = [(PKSettingTableCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = (UISwitch *)objc_alloc_init(MEMORY[0x1E4FB1CD0]);
    settingSwitch = v4->_settingSwitch;
    v4->_settingSwitch = v5;

    [(PKSettingTableCell *)v4 setAccessoryView:v4->_settingSwitch];
    [(PKSettingTableCell *)v4 setSelectionStyle:0];
  }
  v7 = [(PKSettingTableCell *)v4 textLabel];
  [v7 setNumberOfLines:0];

  id v8 = [(PKSettingTableCell *)v4 textLabel];
  [v8 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  return v4;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKSettingTableCell;
  [(PKSettingTableCell *)&v2 dealloc];
}

- (BOOL)isOn
{
  return [(UISwitch *)self->_settingSwitch isOn];
}

- (void)setOn:(BOOL)a3
{
}

- (void)setOn:(BOOL)a3 notify:(BOOL)a4
{
  BOOL v4 = a3;
  if (!a4
    && (p_action = &self->_action, self->_action)
    && (id WeakRetained = objc_loadWeakRetained(&self->_target)) != 0)
  {
    if (*p_action) {
      SEL v8 = *p_action;
    }
    else {
      SEL v8 = 0;
    }
    id v11 = WeakRetained;
    [(UISwitch *)self->_settingSwitch removeTarget:WeakRetained action:v8 forControlEvents:4096];
    [(UISwitch *)self->_settingSwitch setOn:v4];
    if (*p_action) {
      SEL v10 = *p_action;
    }
    else {
      SEL v10 = 0;
    }
    [(UISwitch *)self->_settingSwitch addTarget:v11 action:v10 forControlEvents:4096];
  }
  else
  {
    settingSwitch = self->_settingSwitch;
    [(UISwitch *)settingSwitch setOn:v4];
  }
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  p_action = &self->_action;
  id obj = v6;
  if (self->_action)
  {
    id WeakRetained = objc_loadWeakRetained(&self->_target);
    if (WeakRetained)
    {
      id v9 = WeakRetained;
      if (*p_action) {
        SEL v10 = *p_action;
      }
      else {
        SEL v10 = 0;
      }
      [(UISwitch *)self->_settingSwitch removeTarget:WeakRetained action:v10 forControlEvents:4096];
    }
    id v6 = obj;
  }
  p_target = &self->_target;
  if (v6 && a4)
  {
    objc_storeWeak(p_target, obj);
    SEL *p_action = a4;
    [(UISwitch *)self->_settingSwitch addTarget:obj action:a4 forControlEvents:4096];
    v12 = obj;
  }
  else
  {
    objc_storeWeak(p_target, 0);
    v12 = obj;
    SEL *p_action = 0;
  }
}

- (void)showSpinner:(BOOL)a3
{
  if (self->_showingSpinner != a3)
  {
    self->_showingSpinner = a3;
    if (a3)
    {
      p_spinner = (void **)&self->_spinner;
      spinner = self->_spinner;
      if (!spinner)
      {
        uint64_t v6 = [objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
        v7 = *p_spinner;
        *p_spinner = (void *)v6;

        spinner = (UIActivityIndicatorView *)*p_spinner;
      }
      [(UIActivityIndicatorView *)spinner startAnimating];
    }
    else
    {
      p_spinner = (void **)&self->_settingSwitch;
    }
    SEL v8 = *p_spinner;
    [(PKSettingTableCell *)self setAccessoryView:v8];
  }
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)PKSettingTableCell;
  [(PKTableViewCell *)&v3 prepareForReuse];
  [(PKSettingTableCell *)self showSpinner:0];
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);

  return WeakRetained;
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (UISwitch)settingSwitch
{
  return self->_settingSwitch;
}

- (void)setSettingSwitch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingSwitch, 0);
  objc_destroyWeak(&self->_target);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end