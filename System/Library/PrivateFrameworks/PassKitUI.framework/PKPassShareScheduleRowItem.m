@interface PKPassShareScheduleRowItem
- (BOOL)hasDayPicker;
- (BOOL)hasTimePicker;
- (BOOL)hasToggle;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPassShareScheduleRowItem:(id)a3;
- (BOOL)isOn;
- (BOOL)isSelectable;
- (BOOL)userInteractionEnabled;
- (NSDate)date;
- (NSDate)maximumDate;
- (NSDate)minimumDate;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (NSString)value;
- (PKPassShareScheduleRowItem)initWithTitle:(id)a3 icon:(id)a4;
- (UIImage)icon;
- (UIListContentConfiguration)configuration;
- (unint64_t)hash;
- (void)setConfiguration:(id)a3;
- (void)setDate:(id)a3;
- (void)setHasDayPicker:(BOOL)a3;
- (void)setHasTimePicker:(BOOL)a3;
- (void)setHasToggle:(BOOL)a3;
- (void)setIcon:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsOn:(BOOL)a3;
- (void)setMaximumDate:(id)a3;
- (void)setMinimumDate:(id)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserInteractionEnabled:(BOOL)a3;
- (void)setValue:(id)a3;
@end

@implementation PKPassShareScheduleRowItem

- (PKPassShareScheduleRowItem)initWithTitle:(id)a3 icon:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PKPassShareScheduleRowItem;
  v9 = [(PKPassShareScheduleRowItem *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_icon, a4);
    if (v7)
    {
      v11 = (NSString *)v7;
      identifier = v10->_identifier;
      v10->_identifier = v11;
    }
    else
    {
      identifier = (NSString *)objc_alloc_init(MEMORY[0x1E4F29128]);
      uint64_t v13 = [(NSString *)identifier UUIDString];
      v14 = v10->_identifier;
      v10->_identifier = (NSString *)v13;
    }
  }

  return v10;
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v4 = v3;
  if (self->_identifier) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_title) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_subtitle) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_value) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_icon) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_date) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_minimumDate) {
    objc_msgSend(v4, "addObject:");
  }
  if (self->_maximumDate) {
    objc_msgSend(v4, "addObject:");
  }
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v5 = PKIntegerHash();

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PKPassShareScheduleRowItem *)a3;
  unint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPassShareScheduleRowItem *)self isEqualToPassShareScheduleRowItem:v5];

  return v6;
}

- (BOOL)isEqualToPassShareScheduleRowItem:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  BOOL v5 = v4
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && PKEqualObjects()
    && self->_hasToggle == v4[8]
    && self->_hasTimePicker == v4[9]
    && self->_hasDayPicker == v4[10]
    && self->_selectable == v4[11]
    && self->_isOn == v4[12]
    && self->_userInteractionEnabled == v4[13];

  return v5;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (NSDate)maximumDate
{
  return self->_maximumDate;
}

- (void)setMaximumDate:(id)a3
{
}

- (NSDate)minimumDate
{
  return self->_minimumDate;
}

- (void)setMinimumDate:(id)a3
{
}

- (UIListContentConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (BOOL)hasToggle
{
  return self->_hasToggle;
}

- (void)setHasToggle:(BOOL)a3
{
  self->_hasToggle = a3;
}

- (BOOL)hasTimePicker
{
  return self->_hasTimePicker;
}

- (void)setHasTimePicker:(BOOL)a3
{
  self->_hasTimePicker = a3;
}

- (BOOL)hasDayPicker
{
  return self->_hasDayPicker;
}

- (void)setHasDayPicker:(BOOL)a3
{
  self->_hasDayPicker = a3;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
}

- (BOOL)isOn
{
  return self->_isOn;
}

- (void)setIsOn:(BOOL)a3
{
  self->_isOn = a3;
}

- (BOOL)userInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_minimumDate, 0);
  objc_storeStrong((id *)&self->_maximumDate, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end