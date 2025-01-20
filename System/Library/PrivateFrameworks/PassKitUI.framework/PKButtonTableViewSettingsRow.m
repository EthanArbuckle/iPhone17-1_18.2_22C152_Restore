@interface PKButtonTableViewSettingsRow
+ (id)cellReuseIdentifier;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlight;
- (NSCopying)identifier;
- (NSString)title;
- (PKButtonTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 tapHandler:(id)a5;
- (id)changeHandler;
- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)value;
- (int64_t)style;
- (unint64_t)hash;
- (void)handleCellSelection;
- (void)setChangeHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKButtonTableViewSettingsRow

- (PKButtonTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 tapHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKButtonTableViewSettingsRow;
  v11 = [(PKButtonTableViewSettingsRow *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSCopying *)v12;

    uint64_t v14 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    id changeHandler = v11->_changeHandler;
    v11->_id changeHandler = (id)v16;
  }
  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_value];
  PKCombinedHash();
  PKIntegerHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKButtonTableViewSettingsRow *)a3;
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
          id v8 = self->_title;
          id v9 = title;
          if (v8 == v9)
          {
          }
          else
          {
            id v10 = v9;
            if (!v8 || !v9)
            {

              goto LABEL_18;
            }
            BOOL v11 = [(NSString *)v8 isEqualToString:v9];

            if (!v11) {
              goto LABEL_18;
            }
          }
          if (PKEqualObjects()
            && self->_style == v6->_style
            && self->_changeHandler == v6->_changeHandler)
          {
            BOOL v12 = self->_enabled == v6->_enabled;
LABEL_19:

            goto LABEL_20;
          }
        }
LABEL_18:
        BOOL v12 = 0;
        goto LABEL_19;
      }
    }
    BOOL v12 = 0;
  }
LABEL_20:

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
  id v8 = [v7 textLabel];
  [v8 setText:self->_title];

  id v9 = [v7 textLabel];
  [v9 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  int64_t style = self->_style;
  switch(style)
  {
    case 2:
      BOOL v12 = [MEMORY[0x1E4FB1618] labelColor];
      uint64_t v13 = 1;
LABEL_10:
      [v7 setAccessoryType:v13];
      goto LABEL_12;
    case 1:
      uint64_t v11 = [MEMORY[0x1E4FB1618] systemRedColor];
      goto LABEL_9;
    case 0:
      uint64_t v11 = [MEMORY[0x1E4FB1618] linkColor];
LABEL_9:
      BOOL v12 = (void *)v11;
      uint64_t v13 = 0;
      goto LABEL_10;
  }
  BOOL v12 = 0;
LABEL_12:
  if (!self->_enabled)
  {
    uint64_t v14 = [MEMORY[0x1E4FB1618] systemGrayColor];

    BOOL v12 = (void *)v14;
  }
  v15 = [v7 textLabel];
  [v15 setTextColor:v12];

  [v7 setAccessibilityIdentifier:self->_identifier];

  return v7;
}

- (BOOL)shouldHighlight
{
  return self->_enabled;
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

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_int64_t style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end