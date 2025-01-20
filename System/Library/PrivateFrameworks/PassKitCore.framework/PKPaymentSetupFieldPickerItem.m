@interface PKPaymentSetupFieldPickerItem
+ (id)_itemWithDIAttributePickerItem:(id)a3;
- (BOOL)isEqual:(id)a3;
- (DIAttributePickerItem)attributePickerItem;
- (NSString)localizedDisplayName;
- (NSString)submissionConfirmationDescription;
- (NSString)submissionConfirmationTitle;
- (NSString)submissionValue;
- (PKPaymentSetupFieldPicker)nextLevelPicker;
- (PKPaymentSetupFieldPickerItem)initWithDictionary:(id)a3;
- (PKPaymentSetupFieldPickerItem)initWithName:(id)a3 value:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setAttributePickerItem:(id)a3;
@end

@implementation PKPaymentSetupFieldPickerItem

- (PKPaymentSetupFieldPickerItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 PKStringForKey:@"localizedDisplayName"];
  uint64_t v6 = [v4 PKStringForKey:@"submissionValue"];
  v7 = (void *)v6;
  v8 = 0;
  if (v5 && v6)
  {
    v24.receiver = self;
    v24.super_class = (Class)PKPaymentSetupFieldPickerItem;
    v9 = [(PKPaymentSetupFieldPickerItem *)&v24 init];
    if (v9)
    {
      uint64_t v10 = [v5 copy];
      localizedDisplayName = v9->_localizedDisplayName;
      v9->_localizedDisplayName = (NSString *)v10;

      uint64_t v12 = [v7 copy];
      submissionValue = v9->_submissionValue;
      v9->_submissionValue = (NSString *)v12;

      uint64_t v14 = [v4 PKStringForKey:@"submissionConfirmationTitle"];
      submissionConfirmationTitle = v9->_submissionConfirmationTitle;
      v9->_submissionConfirmationTitle = (NSString *)v14;

      uint64_t v16 = [v4 PKStringForKey:@"submissionConfirmationDescription"];
      submissionConfirmationDescription = v9->_submissionConfirmationDescription;
      v9->_submissionConfirmationDescription = (NSString *)v16;

      v18 = [v4 PKDictionaryForKey:@"nextPickerLevel"];
      if (v18)
      {
        v19 = [PKPaymentSetupFieldPicker alloc];
        v20 = [v18 PKStringForKey:@"submissionKey"];
        uint64_t v21 = [(PKPaymentSetupField *)v19 initWithIdentifier:v20 configuration:v18];
        nextLevelPicker = v9->_nextLevelPicker;
        v9->_nextLevelPicker = (PKPaymentSetupFieldPicker *)v21;
      }
    }
    self = v9;
    v8 = self;
  }

  return v8;
}

+ (id)_itemWithDIAttributePickerItem:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)a1);
  uint64_t v6 = [v4 localizedDisplayName];
  v7 = [v4 value];
  v8 = (void *)[v5 initWithName:v6 value:v7];

  [v8 setAttributePickerItem:v4];
  return v8;
}

- (DIAttributePickerItem)attributePickerItem
{
  attributePickerItem = self->_attributePickerItem;
  if (!attributePickerItem)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F5C188]);
    id v5 = [(PKPaymentSetupFieldPickerItem *)self localizedDisplayName];
    uint64_t v6 = [(PKPaymentSetupFieldPickerItem *)self submissionValue];
    v7 = (DIAttributePickerItem *)[v4 initWithName:v5 value:v6];
    v8 = self->_attributePickerItem;
    self->_attributePickerItem = v7;

    attributePickerItem = self->_attributePickerItem;
  }
  return attributePickerItem;
}

- (PKPaymentSetupFieldPickerItem)initWithName:(id)a3 value:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPaymentSetupFieldPickerItem;
    uint64_t v10 = [(PKPaymentSetupFieldPickerItem *)&v16 init];
    if (v10)
    {
      uint64_t v11 = [v6 copy];
      localizedDisplayName = v10->_localizedDisplayName;
      v10->_localizedDisplayName = (NSString *)v11;

      uint64_t v13 = [v8 copy];
      submissionValue = v10->_submissionValue;
      v10->_submissionValue = (NSString *)v13;
    }
    self = v10;
    v9 = self;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (id *)[(id)objc_opt_class() allocWithZone:a3];
  objc_storeStrong(v4 + 1, self->_localizedDisplayName);
  objc_storeStrong(v4 + 2, self->_submissionValue);
  objc_storeStrong(v4 + 3, self->_attributePickerItem);
  objc_storeStrong(v4 + 4, self->_submissionConfirmationTitle);
  objc_storeStrong(v4 + 5, self->_submissionConfirmationDescription);
  objc_storeStrong(v4 + 6, self->_nextLevelPicker);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = (void *)v5[1];
    id v7 = self->_localizedDisplayName;
    v8 = v6;
    if (v7 == v8)
    {
    }
    else
    {
      v9 = v8;
      if (!v7 || !v8) {
        goto LABEL_31;
      }
      BOOL v10 = [(NSString *)v7 isEqualToString:v8];

      if (!v10) {
        goto LABEL_32;
      }
    }
    uint64_t v12 = (void *)v5[2];
    id v7 = self->_submissionValue;
    uint64_t v13 = v12;
    if (v7 == v13)
    {
    }
    else
    {
      v9 = v13;
      if (!v7 || !v13) {
        goto LABEL_31;
      }
      BOOL v14 = [(NSString *)v7 isEqualToString:v13];

      if (!v14) {
        goto LABEL_32;
      }
    }
    attributePickerItem = self->_attributePickerItem;
    objc_super v16 = (DIAttributePickerItem *)v5[3];
    if (attributePickerItem && v16)
    {
      if ((-[DIAttributePickerItem isEqual:](attributePickerItem, "isEqual:") & 1) == 0) {
        goto LABEL_32;
      }
    }
    else if (attributePickerItem != v16)
    {
      goto LABEL_32;
    }
    v17 = (void *)v5[4];
    id v7 = self->_submissionConfirmationTitle;
    v18 = v17;
    if (v7 == v18)
    {
    }
    else
    {
      v9 = v18;
      if (!v7 || !v18) {
        goto LABEL_31;
      }
      BOOL v19 = [(NSString *)v7 isEqualToString:v18];

      if (!v19) {
        goto LABEL_32;
      }
    }
    v20 = (void *)v5[5];
    id v7 = self->_submissionConfirmationDescription;
    uint64_t v21 = v20;
    if (v7 == v21)
    {

LABEL_36:
      nextLevelPicker = self->_nextLevelPicker;
      v25 = (PKPaymentSetupFieldPicker *)v5[6];
      if (nextLevelPicker && v25) {
        char v11 = -[PKPaymentSetupFieldPicker isEqual:](nextLevelPicker, "isEqual:");
      }
      else {
        char v11 = nextLevelPicker == v25;
      }
      goto LABEL_33;
    }
    v9 = v21;
    if (v7 && v21)
    {
      BOOL v22 = [(NSString *)v7 isEqualToString:v21];

      if (v22) {
        goto LABEL_36;
      }
LABEL_32:
      char v11 = 0;
LABEL_33:

      goto LABEL_34;
    }
LABEL_31:

    goto LABEL_32;
  }
  char v11 = 0;
LABEL_34:

  return v11;
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)submissionValue
{
  return self->_submissionValue;
}

- (void)setAttributePickerItem:(id)a3
{
}

- (NSString)submissionConfirmationTitle
{
  return self->_submissionConfirmationTitle;
}

- (NSString)submissionConfirmationDescription
{
  return self->_submissionConfirmationDescription;
}

- (PKPaymentSetupFieldPicker)nextLevelPicker
{
  return self->_nextLevelPicker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nextLevelPicker, 0);
  objc_storeStrong((id *)&self->_submissionConfirmationDescription, 0);
  objc_storeStrong((id *)&self->_submissionConfirmationTitle, 0);
  objc_storeStrong((id *)&self->_attributePickerItem, 0);
  objc_storeStrong((id *)&self->_submissionValue, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end