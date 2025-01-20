@interface PKMessageTableViewSettingsRow
+ (id)cellReuseIdentifier;
- (BOOL)isEnabled;
- (BOOL)shouldHighlight;
- (NSCopying)identifier;
- (NSString)title;
- (PKMessageTableViewSettingsRow)initWithIdentifier:(id)a3 contentConfiguration:(id)a4;
- (id)changeHandler;
- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)value;
- (void)setActionOnDismiss:(id)a3;
- (void)setChangeHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKMessageTableViewSettingsRow

+ (id)cellReuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (PKMessageTableViewSettingsRow)initWithIdentifier:(id)a3 contentConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKMessageTableViewSettingsRow;
  v8 = [(PKMessageTableViewSettingsRow *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    identifier = v8->_identifier;
    v8->_identifier = (NSCopying *)v9;

    objc_storeStrong((id *)&v8->_config, a4);
  }

  return v8;
}

- (void)setActionOnDismiss:(id)a3
{
  v4 = _Block_copy(a3);
  id actionOnDismiss = self->_actionOnDismiss;
  self->_id actionOnDismiss = v4;
}

- (BOOL)shouldHighlight
{
  return 0;
}

- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() cellReuseIdentifier];
  id v7 = [v5 dequeueReusableCellWithIdentifier:v6];

  if (!v7) {
    id v7 = [[PKMessageTableCell alloc] initWithStyle:0 reuseIdentifier:v6];
  }
  [(PKMessageTableCell *)v7 setContent:self->_config];
  [(PKMessageTableCell *)v7 setActionOnDismiss:self->_actionOnDismiss];
  [(PKMessageTableCell *)v7 setAccessibilityIdentifier:self->_identifier];

  return v7;
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
  objc_storeStrong(&self->_actionOnDismiss, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end