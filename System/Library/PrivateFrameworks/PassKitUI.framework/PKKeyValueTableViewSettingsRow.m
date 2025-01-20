@interface PKKeyValueTableViewSettingsRow
+ (id)cellReuseIdentifier;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)sensitive;
- (BOOL)shouldHighlight;
- (NSCopying)identifier;
- (NSString)title;
- (PKKeyValueTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5;
- (PKKeyValueTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5 sectionID:(id)a6;
- (UIColor)primaryTextColor;
- (UIColor)secondaryTextColor;
- (id)changeHandler;
- (id)tableViewCellForTableView:(id)a3 atIndexPath:(id)a4;
- (id)value;
- (unint64_t)hash;
- (void)setChangeHandler:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPrimaryTextColor:(id)a3;
- (void)setSecondaryTextColor:(id)a3;
- (void)setSensitive:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation PKKeyValueTableViewSettingsRow

- (PKKeyValueTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5
{
  return [(PKKeyValueTableViewSettingsRow *)self initWithIdentifier:a3 title:a4 value:a5 sectionID:0];
}

- (PKKeyValueTableViewSettingsRow)initWithIdentifier:(id)a3 title:(id)a4 value:(id)a5 sectionID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v28.receiver = self;
  v28.super_class = (Class)PKKeyValueTableViewSettingsRow;
  v14 = [(PKKeyValueTableViewSettingsRow *)&v28 init];
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
    sectionID = v14->_sectionID;
    v14->_sectionID = (NSString *)v21;

    uint64_t v23 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    secondaryTextColor = v14->_secondaryTextColor;
    v14->_secondaryTextColor = (UIColor *)v23;

    uint64_t v25 = [MEMORY[0x1E4FB1618] labelColor];
    primaryTextColor = v14->_primaryTextColor;
    v14->_primaryTextColor = (UIColor *)v25;
  }
  return v14;
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_identifier];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_value];
  [v3 safelyAddObject:self->_sectionID];
  unint64_t v4 = PKCombinedHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKKeyValueTableViewSettingsRow *)a3;
  v5 = v4;
  if (self == v4)
  {
    LOBYTE(v11) = 1;
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
            LOBYTE(v11) = 0;
            if (!v8 || !v9)
            {
LABEL_20:

              goto LABEL_21;
            }
            BOOL v11 = [(NSString *)v8 isEqualToString:v9];

            if (!v11) {
              goto LABEL_21;
            }
          }
          if (PKEqualObjects())
          {
            sectionID = self->_sectionID;
            id v13 = v6->_sectionID;
            v8 = sectionID;
            v14 = v13;
            if (v8 == v14)
            {
              LOBYTE(v11) = 1;
              id v10 = v8;
            }
            else
            {
              id v10 = v14;
              LOBYTE(v11) = 0;
              if (v8 && v14) {
                LOBYTE(v11) = [(NSString *)v8 isEqualToString:v14];
              }
            }
            goto LABEL_20;
          }
        }
        LOBYTE(v11) = 0;
LABEL_21:

        goto LABEL_22;
      }
    }
    LOBYTE(v11) = 0;
  }
LABEL_22:

  return v11;
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

  [v9 setColor:self->_secondaryTextColor];
  BOOL v11 = [v8 textProperties];
  [v11 setColor:self->_primaryTextColor];
  [v7 setContentConfiguration:v8];
  id v12 = [v7 textLabel];
  [v12 setAccessibilityIdentifier:*MEMORY[0x1E4F85AB8]];

  id v13 = [v7 detailTextLabel];
  [v13 setAccessibilityIdentifier:*MEMORY[0x1E4F85478]];

  [v7 setAccessibilityIdentifier:self->_identifier];
  objc_msgSend(v7, "pkui_setExcludedFromScreenCapture:andBroadcasting:", self->_sensitive, self->_sensitive);

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

- (UIColor)secondaryTextColor
{
  return self->_secondaryTextColor;
}

- (void)setSecondaryTextColor:(id)a3
{
}

- (UIColor)primaryTextColor
{
  return self->_primaryTextColor;
}

- (void)setPrimaryTextColor:(id)a3
{
}

- (BOOL)sensitive
{
  return self->_sensitive;
}

- (void)setSensitive:(BOOL)a3
{
  self->_sensitive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryTextColor, 0);
  objc_storeStrong((id *)&self->_secondaryTextColor, 0);
  objc_storeStrong(&self->_changeHandler, 0);
  objc_storeStrong(&self->_value, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_storeStrong((id *)&self->_sectionID, 0);
}

@end