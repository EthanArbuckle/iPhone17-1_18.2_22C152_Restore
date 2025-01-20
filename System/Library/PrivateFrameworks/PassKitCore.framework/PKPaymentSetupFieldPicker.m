@interface PKPaymentSetupFieldPicker
+ (id)pickerItemMatchingValue:(id)a3 pickerItems:(id)a4;
- (BOOL)submissionStringMeetsAllRequirements;
- (NSArray)pickerItems;
- (NSString)localizedDescription;
- (PKPaymentSetupFieldPickerItem)currentValue;
- (id)_submissionStringForValue:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)defaultPickerItem;
- (id)displayString;
- (unint64_t)fieldType;
- (unint64_t)pickerType;
- (void)_commonUpdate;
- (void)_updateCurrentValuePickerItem;
- (void)setCurrentValue:(id)a3;
- (void)setDefaultValue:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setPickerItems:(id)a3;
- (void)setPickerType:(unint64_t)a3;
- (void)updateWithAttribute:(id)a3;
- (void)updateWithConfiguration:(id)a3;
@end

@implementation PKPaymentSetupFieldPicker

- (unint64_t)fieldType
{
  return 5;
}

- (void)updateWithAttribute:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)PKPaymentSetupFieldPicker;
  [(PKPaymentSetupField *)&v21 updateWithAttribute:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    v7 = objc_msgSend(v5, "pickerItems", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = +[PKPaymentSetupFieldPickerItem _itemWithDIAttributePickerItem:*(void *)(*((void *)&v17 + 1) + 8 * v11)];
          if (v12) {
            [v6 addObject:v12];
          }

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v22 count:16];
      }
      while (v9);
    }

    if ([v6 count])
    {
      v13 = (NSArray *)[v6 copy];
      pickerItems = self->_pickerItems;
      self->_pickerItems = v13;
    }
    v15 = [v5 defaultValue];
    v16 = [v15 value];

    if ([v16 length]) {
      [(PKPaymentSetupFieldPicker *)self setDefaultValue:v16];
    }
  }
  [(PKPaymentSetupFieldPicker *)self _commonUpdate];
}

- (void)updateWithConfiguration:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)PKPaymentSetupFieldPicker;
  [(PKPaymentSetupField *)&v35 updateWithConfiguration:v4];
  id v5 = [v4 PKArrayContaining:objc_opt_class() forKey:@"pickerItems"];
  uint64_t v6 = [v5 count];
  if (v6)
  {
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v6];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * i);
          v14 = [PKPaymentSetupFieldPickerItem alloc];
          v15 = -[PKPaymentSetupFieldPickerItem initWithDictionary:](v14, "initWithDictionary:", v13, (void)v31);
          if (v15) {
            [v7 addObject:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v10);
    }

    v16 = (NSArray *)[v7 copy];
    pickerItems = self->_pickerItems;
    self->_pickerItems = v16;
  }
  objc_msgSend(v4, "PKStringForKey:", @"pickerType", (void)v31);
  long long v18 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
  long long v19 = v18;
  if (v18 == @"radio") {
    goto LABEL_15;
  }
  if (!v18) {
    goto LABEL_22;
  }
  char v20 = [(__CFString *)v18 isEqualToString:@"radio"];

  if (v20)
  {
LABEL_15:
    unint64_t v21 = 1;
    goto LABEL_23;
  }
  v22 = v19;
  if (v22 == @"multilevelList"
    || (uint64_t v23 = v22,
        char v24 = [(__CFString *)v22 isEqualToString:@"multilevelList"],
        v23,
        (v24 & 1) != 0))
  {
    unint64_t v21 = 2;
    goto LABEL_23;
  }
  v25 = v23;
  if (v25 == @"menu"
    || (v26 = v25, int v27 = [(__CFString *)v25 isEqualToString:@"menu"], v26, v27))
  {
    unint64_t v21 = 3;
  }
  else
  {
LABEL_22:
    unint64_t v21 = 0;
  }
LABEL_23:

  self->_pickerType = v21;
  v28 = [v4 PKStringForKey:@"localizedDescription"];
  uint64_t v29 = [v28 length];
  if (v29) {
    v30 = (void *)[v28 copy];
  }
  else {
    v30 = 0;
  }
  objc_storeStrong((id *)&self->_localizedDescription, v30);
  if (v29) {

  }
  [(PKPaymentSetupFieldPicker *)self _commonUpdate];
}

- (void)_commonUpdate
{
  [(PKPaymentSetupField *)self setLocalizedPlaceholder:0];
  [(PKPaymentSetupField *)self setDisplayFormat:0];
  [(PKPaymentSetupFieldPicker *)self _updateCurrentValuePickerItem];
}

- (void)setCurrentValue:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->super._currentValue != v4)
  {
    uint64_t v11 = v4;
    if (!v4 || (v6 = [(NSArray *)self->_pickerItems containsObject:v4], id v5 = v11, v6))
    {
      v7 = [(PKPaymentSetupField *)self attribute];
      id v8 = [v11 attributePickerItem];
      [v7 setCurrentValue:v8];

      uint64_t v9 = [v11 copyWithZone:0];
      currentValue = self->super._currentValue;
      self->super._currentValue = v9;

      [(PKPaymentSetupField *)self noteCurrentValueChanged];
      id v5 = v11;
    }
  }
}

- (void)setDefaultValue:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PKPaymentSetupFieldPicker;
  [(PKPaymentSetupField *)&v4 setDefaultValue:a3];
  [(PKPaymentSetupFieldPicker *)self _updateCurrentValuePickerItem];
}

- (id)defaultPickerItem
{
  v3 = [(PKPaymentSetupField *)self defaultValue];

  if (v3)
  {
    objc_super v4 = objc_opt_class();
    id v5 = [(PKPaymentSetupField *)self defaultValue];
    BOOL v6 = [v4 pickerItemMatchingValue:v5 pickerItems:self->_pickerItems];
  }
  else
  {
    BOOL v6 = 0;
  }
  return v6;
}

- (void)setPickerItems:(id)a3
{
  id v5 = (NSArray *)a3;
  pickerItems = self->_pickerItems;
  v7 = v5;
  if (!v5 || !pickerItems)
  {
    if (pickerItems == v5) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if ((-[NSArray isEqual:](v5, "isEqual:") & 1) == 0)
  {
LABEL_6:
    objc_storeStrong((id *)&self->_pickerItems, a3);
    [(PKPaymentSetupFieldPicker *)self _updateCurrentValuePickerItem];
  }
LABEL_7:
}

- (PKPaymentSetupFieldPickerItem)currentValue
{
  return (PKPaymentSetupFieldPickerItem *)self->super._currentValue;
}

+ (id)pickerItemMatchingValue:(id)a3 pickerItems:(id)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __65__PKPaymentSetupFieldPicker_pickerItemMatchingValue_pickerItems___block_invoke;
  v9[3] = &unk_1E56DBF88;
  id v10 = v5;
  id v6 = v5;
  v7 = objc_msgSend(a4, "pk_firstObjectPassingTest:", v9);

  return v7;
}

BOOL __65__PKPaymentSetupFieldPicker_pickerItemMatchingValue_pickerItems___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = [v3 submissionValue];
  id v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
    BOOL v10 = 1;
    id v11 = v6;
LABEL_14:

    goto LABEL_15;
  }
  id v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_8;
  }
  uint64_t v9 = [v6 caseInsensitiveCompare:v7];

  if (v9)
  {
LABEL_8:
    v12 = [v3 localizedDisplayName];
    uint64_t v13 = *(void **)(a1 + 32);
    id v11 = v12;
    id v14 = v13;
    v15 = v14;
    if (v11 == v14)
    {
      BOOL v10 = 1;
    }
    else
    {
      BOOL v10 = 0;
      if (v11 && v14) {
        BOOL v10 = [v11 caseInsensitiveCompare:v14] == 0;
      }
    }

    goto LABEL_14;
  }
  BOOL v10 = 1;
LABEL_15:

  return v10;
}

- (void)_updateCurrentValuePickerItem
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [(PKPaymentSetupField *)self defaultValue];
  if (v3)
  {
    objc_super v4 = [(id)objc_opt_class() pickerItemMatchingValue:v3 pickerItems:self->_pickerItems];
    if (v4)
    {
      id v5 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = [v4 submissionValue];
        int v7 = 138412290;
        id v8 = v6;
        _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Setting picker currentValue to %@", (uint8_t *)&v7, 0xCu);
      }
      [(PKPaymentSetupFieldPicker *)self setCurrentValue:v4];
    }
  }
}

- (id)displayString
{
  return (id)[self->super._currentValue localizedDisplayName];
}

- (id)_submissionStringForValue:(id)a3
{
  return (id)[a3 submissionValue];
}

- (BOOL)submissionStringMeetsAllRequirements
{
  v2 = [(PKPaymentSetupField *)self submissionString];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKPaymentSetupFieldPicker;
  id v4 = [(PKPaymentSetupField *)&v6 copyWithZone:a3];
  *((void *)v4 + 18) = self->_pickerType;
  objc_storeStrong((id *)v4 + 17, self->_pickerItems);
  return v4;
}

- (NSArray)pickerItems
{
  return self->_pickerItems;
}

- (unint64_t)pickerType
{
  return self->_pickerType;
}

- (void)setPickerType:(unint64_t)a3
{
  self->_pickerType = a3;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_pickerItems, 0);
}

@end