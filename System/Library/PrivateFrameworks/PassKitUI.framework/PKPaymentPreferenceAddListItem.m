@interface PKPaymentPreferenceAddListItem
- (PKPaymentPreferenceAddListItem)initWithAddPreferenceType:(int)a3 forSectionPreference:(id)a4 handler:(id)a5;
- (UIColor)buttonTextColor;
- (id)_text;
- (id)configuration;
- (id)copyWithZone:(_NSZone *)a3;
- (id)handler;
- (int)type;
- (void)setButtonTextColor:(id)a3;
@end

@implementation PKPaymentPreferenceAddListItem

- (PKPaymentPreferenceAddListItem)initWithAddPreferenceType:(int)a3 forSectionPreference:(id)a4 handler:(id)a5
{
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PKPaymentPreferenceAddListItem;
  v9 = [(PKPaymentPreferenceListItem *)&v14 initWithSectionPreference:a4];
  v10 = v9;
  if (v9)
  {
    v9->_type = a3;
    v11 = _Block_copy(v8);
    id handler = v10->_handler;
    v10->_id handler = v11;
  }
  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentPreferenceAddListItem;
  v4 = [(PKPaymentPreferenceListItem *)&v8 copyWithZone:a3];
  v4[4] = self->_type;
  v5 = _Block_copy(self->_handler);
  v6 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v5;

  return v4;
}

- (id)configuration
{
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentPreferenceAddListItem;
  v3 = [(PKPaymentPreferenceListItem *)&v9 configuration];
  buttonTextColor = self->_buttonTextColor;
  if (buttonTextColor)
  {
    v5 = buttonTextColor;
  }
  else
  {
    v5 = [MEMORY[0x1E4FB1618] systemBlueColor];
  }
  v6 = v5;
  v7 = [v3 textProperties];
  [v7 setColor:v6];

  return v3;
}

- (id)_text
{
  v3 = [(PKPaymentPreferenceListItem *)self sectionPreference];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    objc_super v9 = 0;
    goto LABEL_10;
  }
  v5 = [(PKPaymentPreferenceListItem *)self sectionPreference];
  v6 = v5;
  int type = self->_type;
  if (type == 1)
  {
    uint64_t v8 = [v5 addExistingTitle];
  }
  else
  {
    if (type)
    {
      objc_super v9 = 0;
      goto LABEL_9;
    }
    uint64_t v8 = [v5 addNewTitle];
  }
  objc_super v9 = (void *)v8;
LABEL_9:

LABEL_10:

  return v9;
}

- (int)type
{
  return self->_type;
}

- (id)handler
{
  return self->_handler;
}

- (UIColor)buttonTextColor
{
  return self->_buttonTextColor;
}

- (void)setButtonTextColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonTextColor, 0);

  objc_storeStrong(&self->_handler, 0);
}

@end