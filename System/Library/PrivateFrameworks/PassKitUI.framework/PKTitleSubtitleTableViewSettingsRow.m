@interface PKTitleSubtitleTableViewSettingsRow
+ (id)cellReuseIdentifier;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldHighlight;
- (NSCopying)identifier;
- (NSString)title;
- (PKTitleSubtitleTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5;
- (id)changeHandler;
- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)value;
- (unint64_t)hash;
- (void)setChangeHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKTitleSubtitleTableViewSettingsRow

- (PKTitleSubtitleTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 subtitle:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PKTitleSubtitleTableViewSettingsRow;
  v11 = [(PKTitleSubtitleTableViewSettingsRow *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = (NSCopying *)v12;

    uint64_t v14 = [v9 copy];
    title = v11->_title;
    v11->_title = (NSString *)v14;

    uint64_t v16 = [v10 copy];
    id value = v11->_value;
    v11->_id value = (id)v16;
  }
  return v11;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_value];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKTitleSubtitleTableViewSettingsRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    char v12 = 1;
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

            goto LABEL_13;
          }
          id v10 = v9;
          if (v8 && v9)
          {
            BOOL v11 = [(NSString *)v8 isEqualToString:v9];

            if (!v11) {
              goto LABEL_15;
            }
LABEL_13:
            char v12 = PKEqualObjects();
LABEL_16:

            goto LABEL_17;
          }
        }
LABEL_15:
        char v12 = 0;
        goto LABEL_16;
      }
    }
    char v12 = 0;
  }
LABEL_17:

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
  id v8 = [v7 defaultContentConfiguration];
  [v8 setText:self->_title];
  [v8 setSecondaryText:self->_value];
  id v9 = [v8 textProperties];
  id v10 = (NSString *)*MEMORY[0x1E4FB28C8];
  BOOL v11 = PKFontForDefaultDesign((void *)*MEMORY[0x1E4FB28C8], 0, 2, 0);
  [v9 setFont:v11];

  char v12 = [MEMORY[0x1E4FB1618] labelColor];
  [v9 setColor:v12];

  v13 = [v8 secondaryTextProperties];
  uint64_t v14 = PKFontForDefaultDesign(v10, 0);
  [v13 setFont:v14];

  v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [v13 setColor:v15];

  [v7 setContentConfiguration:v8];
  uint64_t v16 = [v7 textLabel];
  [v16 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  v17 = [v7 detailTextLabel];
  [v17 setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];

  [v7 setAccessibilityIdentifier:self->_identifier];

  return v7;
}

- (BOOL)shouldHighlight
{
  return 0;
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