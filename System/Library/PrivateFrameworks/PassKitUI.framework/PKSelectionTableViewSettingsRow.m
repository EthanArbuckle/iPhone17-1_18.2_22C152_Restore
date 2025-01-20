@interface PKSelectionTableViewSettingsRow
+ (id)cellReuseIdentifier;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlight;
- (NSCopying)identifier;
- (NSString)title;
- (PKSelectionTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5 tapHandler:(id)a6;
- (id)changeHandler;
- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)value;
- (unint64_t)hash;
- (void)handleCellSelection;
- (void)setChangeHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKSelectionTableViewSettingsRow

- (PKSelectionTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5 tapHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)PKSelectionTableViewSettingsRow;
  v14 = [(PKSelectionTableViewSettingsRow *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    identifier = v14->_identifier;
    v14->_identifier = (NSCopying *)v15;

    uint64_t v17 = [v11 copy];
    title = v14->_title;
    v14->_title = (NSString *)v17;

    uint64_t v19 = [v12 copy];
    id value = v14->_value;
    v14->_id value = (id)v19;

    uint64_t v21 = [v13 copy];
    id changeHandler = v14->_changeHandler;
    v14->_id changeHandler = (id)v21;
  }
  return v14;
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
  unint64_t v4 = (PKSelectionTableViewSettingsRow *)a3;
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
  v7 = [v5 dequeueReusableCellWithIdentifier:v6];

  if (!v7) {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D08]) initWithStyle:0 reuseIdentifier:v6];
  }
  v8 = [v7 defaultContentConfiguration];
  [v8 setText:self->_title];
  [v8 setSecondaryText:self->_value];
  [v8 setPrefersSideBySideTextAndSecondaryText:1];
  v9 = [v8 secondaryTextProperties];
  id v10 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
  [v9 setFont:v10];

  BOOL v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v9 setColor:v11];

  [v7 setContentConfiguration:v8];
  [v7 setAccessoryType:1];
  [v7 setAccessibilityIdentifier:self->_identifier];

  return v7;
}

- (BOOL)shouldHighlight
{
  return 1;
}

- (void)handleCellSelection
{
  id changeHandler = (void (**)(id, void))self->_changeHandler;
  if (changeHandler) {
    changeHandler[2](changeHandler, 0);
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