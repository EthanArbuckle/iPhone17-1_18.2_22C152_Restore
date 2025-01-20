@interface PKSwitchTableViewSettingsRow
+ (id)cellReuseIdentifier;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlight;
- (NSCopying)identifier;
- (NSString)title;
- (PKSwitchTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(BOOL)a5 changeHandler:(id)a6;
- (id)changeHandler;
- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)value;
- (unint64_t)hash;
- (void)_switchValueChanged:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKSwitchTableViewSettingsRow

- (PKSwitchTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(BOOL)a5 changeHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PKSwitchTableViewSettingsRow;
  v13 = [(PKSwitchTableViewSettingsRow *)&v23 init];
  if (v13)
  {
    uint64_t v14 = [v10 copy];
    identifier = v13->_identifier;
    v13->_identifier = (NSCopying *)v14;

    uint64_t v16 = [v11 copy];
    title = v13->_title;
    v13->_title = (NSString *)v16;

    uint64_t v18 = [NSNumber numberWithBool:v7];
    id value = v13->_value;
    v13->_id value = (id)v18;

    uint64_t v20 = [v12 copy];
    id changeHandler = v13->_changeHandler;
    v13->_id changeHandler = (id)v20;
  }
  return v13;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_value];
  PKCombinedHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKSwitchTableViewSettingsRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v6 = v5;
        if (PKEqualObjects())
        {
          title = v6->_title;
          v8 = self->_title;
          v9 = title;
          if (v8 == v9)
          {
          }
          else
          {
            id v10 = v9;
            if (!v8 || !v9)
            {

              goto LABEL_17;
            }
            BOOL v11 = [(NSString *)v8 isEqualToString:v9];

            if (!v11) {
              goto LABEL_17;
            }
          }
          if (PKEqualObjects() && self->_changeHandler == v6->_changeHandler)
          {
            BOOL v12 = self->_enabled == v6->_enabled;
LABEL_18:

            goto LABEL_19;
          }
        }
LABEL_17:
        BOOL v12 = 0;
        goto LABEL_18;
      }
    }
    BOOL v12 = 0;
  }
LABEL_19:

  return v12;
}

+ (id)cellReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  v6 = [(id)objc_opt_class() cellReuseIdentifier];
  BOOL v7 = [v5 dequeueReusableCellWithIdentifier:v6];

  if (!v7) {
    BOOL v7 = [[PKSettingTableCell alloc] initWithStyle:0 reuseIdentifier:v6];
  }
  -[PKSettingTableCell setOn:](v7, "setOn:", [self->_value BOOLValue]);
  [(PKSettingTableCell *)v7 setTarget:self action:sel__switchValueChanged_];
  v8 = [(PKSettingTableCell *)v7 settingSwitch];
  [v8 setEnabled:self->_enabled];

  v9 = [(PKSettingTableCell *)v7 textLabel];
  [v9 setText:self->_title];

  id v10 = [(PKSettingTableCell *)v7 textLabel];
  [v10 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  [(PKSettingTableCell *)v7 setAccessibilityIdentifier:self->_identifier];

  return v7;
}

- (BOOL)shouldHighlight
{
  return 0;
}

- (void)_switchValueChanged:(id)a3
{
  unint64_t v4 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a3, "isOn"));
  id changeHandler = (void (**)(void))self->_changeHandler;
  if (changeHandler)
  {
    v6 = v4;
    changeHandler[2]();
    unint64_t v4 = v6;
  }
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (id)changeHandler
{
  return self->_changeHandler;
}

- (void)setChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end