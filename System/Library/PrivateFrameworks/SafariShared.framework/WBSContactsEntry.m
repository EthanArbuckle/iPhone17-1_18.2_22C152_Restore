@interface WBSContactsEntry
+ (BOOL)_isContactsLabel:(id)a3;
+ (BOOL)_isContactsProperty:(id)a3;
+ (BOOL)_isValueAStringForContactsProperty:(id)a3;
+ (BOOL)isWBSProxyProperty:(id)a3;
+ (id)_valueStringForValue:(id)a3 wbsProperty:(id)a4 wbsComponent:(id)a5;
+ (id)_valueStringForValue:(id)a3 wbsProperty:(id)a4 wbsComponent:(id)a5 atIndex:(unint64_t)a6;
+ (id)_valueStringForWBSComponent:(id)a3 inAddress:(id)a4;
+ (id)_valueStringForWBSComponent:(id)a3 inInstantMessageAddress:(id)a4;
+ (id)localizedWBSPropertyOrLabel:(id)a3;
- (CNContact)contact;
- (WBSContactsEntry)initWithContact:(id)a3;
- (id)fullName;
- (id)valueForWBSProxyProperty:(id)a3;
- (id)valueStringForWBSProperty:(id)a3 wbsComponent:(id)a4 atIndex:(unint64_t)a5;
- (unint64_t)_numberOfValuesForWBSProperty:(id)a3;
- (unint64_t)_numberOfValuesForWBSProperty:(id)a3 andContact:(id)a4;
@end

@implementation WBSContactsEntry

- (WBSContactsEntry)initWithContact:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)WBSContactsEntry;
  v6 = [(WBSContactsEntry *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_contact, a3);
    v8 = v7;
  }

  return v7;
}

+ (BOOL)isWBSProxyProperty:(id)a3
{
  return [a3 isEqualToString:*MEMORY[0x1E4F98068]];
}

+ (BOOL)_isContactsProperty:(id)a3
{
  uint64_t v3 = _isContactsProperty__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isContactsProperty__onceToken, &__block_literal_global_25);
  }
  char v5 = [(id)_isContactsProperty__contactsPropertySet containsObject:v4];

  return v5;
}

void __40__WBSContactsEntry__isContactsProperty___block_invoke()
{
  v9[11] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F1AD90];
  v9[0] = *MEMORY[0x1E4F1AF10];
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1ADF0];
  v9[2] = *MEMORY[0x1E4F1ADC8];
  v9[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1AE78];
  v9[4] = *MEMORY[0x1E4F1AE60];
  v9[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1AEA0];
  v9[6] = *MEMORY[0x1E4F1ADE0];
  v9[7] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1AEE0];
  v9[8] = *MEMORY[0x1E4F1AED8];
  v9[9] = v5;
  v9[10] = *MEMORY[0x1E4F1AFB0];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:11];
  uint64_t v7 = [v0 setWithArray:v6];
  v8 = (void *)_isContactsProperty__contactsPropertySet;
  _isContactsProperty__contactsPropertySet = v7;
}

+ (BOOL)_isContactsLabel:(id)a3
{
  uint64_t v3 = _isContactsLabel__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_isContactsLabel__onceToken, &__block_literal_global_3);
  }
  char v5 = [(id)_isContactsLabel__contactsLabelSet containsObject:v4];

  return v5;
}

void __37__WBSContactsEntry__isContactsLabel___block_invoke()
{
  v9[11] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = *MEMORY[0x1E4F1B768];
  v9[0] = *MEMORY[0x1E4F1B6F8];
  v9[1] = v1;
  uint64_t v2 = *MEMORY[0x1E4F1B700];
  v9[2] = *MEMORY[0x1E4F1B770];
  v9[3] = v2;
  uint64_t v3 = *MEMORY[0x1E4F1B758];
  v9[4] = *MEMORY[0x1E4F1B728];
  v9[5] = v3;
  uint64_t v4 = *MEMORY[0x1E4F1B710];
  v9[6] = *MEMORY[0x1E4F1B720];
  v9[7] = v4;
  uint64_t v5 = *MEMORY[0x1E4F1B730];
  v9[8] = *MEMORY[0x1E4F1B750];
  v9[9] = v5;
  v9[10] = *MEMORY[0x1E4F1B738];
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:11];
  uint64_t v7 = [v0 setWithArray:v6];
  v8 = (void *)_isContactsLabel__contactsLabelSet;
  _isContactsLabel__contactsLabelSet = v7;
}

+ (id)localizedWBSPropertyOrLabel:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if ([v4 isEqualToString:*MEMORY[0x1E4F98068]])
    {
      uint64_t v5 = _WBSLocalizedString();
    }
    else
    {
      v6 = +[WBSContactsHelper CNContactKeyFromWBSABKey:v4];
      if ([v6 length])
      {
        if ([a1 _isContactsProperty:v6])
        {
          id v7 = [MEMORY[0x1E4F1B8F8] localizedStringForKey:v6];
        }
        else if ([a1 _isContactsLabel:v6])
        {
          id v7 = [MEMORY[0x1E4F1BA20] localizedStringForLabel:v6];
        }
        else
        {
          id v7 = v6;
        }
        uint64_t v5 = v7;
      }
      else
      {
        uint64_t v5 = 0;
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)fullName
{
  contact = self->_contact;
  if (contact)
  {
    uint64_t v3 = [MEMORY[0x1E4F1B910] stringFromContact:contact style:0];
  }
  else
  {
    uint64_t v3 = 0;
  }
  return v3;
}

- (id)valueForWBSProxyProperty:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F98068]])
  {
    id v4 = [(WBSContactsEntry *)self fullName];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)valueStringForWBSProperty:(id)a3 wbsComponent:(id)a4 atIndex:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 length]
    && [(WBSContactsEntry *)self _numberOfValuesForWBSProperty:v8] > a5)
  {
    if ([(id)objc_opt_class() isWBSProxyProperty:v8])
    {
      objc_super v10 = [(WBSContactsEntry *)self valueForWBSProxyProperty:v8];
    }
    else
    {
      v12 = [(CNContact *)self->_contact safari_valueForWBSABProperty:v8];
      objc_super v10 = [(id)objc_opt_class() _valueStringForValue:v12 wbsProperty:v8 wbsComponent:v9 atIndex:a5];
    }
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

+ (id)_valueStringForWBSComponent:(id)a3 inInstantMessageAddress:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[WBSContactsHelper CNContactKeyFromWBSABKey:v5];
  if ([v7 isEqualToString:*MEMORY[0x1E4F1AFF8]])
  {
    uint64_t v8 = [v6 service];
LABEL_5:
    id v9 = (void *)v8;
    goto LABEL_9;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F1B000]])
  {
    uint64_t v8 = [v6 username];
    goto LABEL_5;
  }
  objc_super v10 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    +[WBSContactsEntry _valueStringForWBSComponent:inInstantMessageAddress:]((uint64_t)v5, v10, v11, v12, v13, v14, v15, v16);
  }
  id v9 = 0;
LABEL_9:

  return v9;
}

+ (id)_valueStringForWBSComponent:(id)a3 inAddress:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[WBSContactsHelper CNContactKeyFromWBSABKey:v5];
  if ([v7 isEqualToString:*MEMORY[0x1E4F1B7C8]])
  {
    uint64_t v8 = [v6 street];
LABEL_13:
    id v9 = (void *)v8;
    goto LABEL_14;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F1B798]])
  {
    uint64_t v8 = [v6 city];
    goto LABEL_13;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F1B7C0]])
  {
    uint64_t v8 = [v6 state];
    goto LABEL_13;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F1B7A0]])
  {
    uint64_t v8 = [v6 country];
    goto LABEL_13;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F1B7B0]])
  {
    uint64_t v8 = [v6 postalCode];
    goto LABEL_13;
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F1B7A8]])
  {
    uint64_t v8 = [v6 ISOCountryCode];
    goto LABEL_13;
  }
  uint64_t v11 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    +[WBSContactsEntry _valueStringForWBSComponent:inAddress:]((uint64_t)v5, v11, v12, v13, v14, v15, v16, v17);
  }
  id v9 = 0;
LABEL_14:

  return v9;
}

+ (BOOL)_isValueAStringForContactsProperty:(id)a3
{
  id v3 = a3;
  if (([v3 isEqualToString:*MEMORY[0x1E4F1ADE0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F1ADF0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F1AEA0]] & 1) != 0
    || ([v3 isEqualToString:*MEMORY[0x1E4F1AED8]] & 1) != 0)
  {
    char v4 = 1;
  }
  else
  {
    char v4 = [v3 isEqualToString:*MEMORY[0x1E4F1AE78]];
  }

  return v4;
}

+ (id)_valueStringForValue:(id)a3 wbsProperty:(id)a4 wbsComponent:(id)a5 atIndex:(unint64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v13 = [v12 objectAtIndex:a6];

    id v12 = (id)v13;
  }
  uint64_t v14 = [a1 _valueStringForValue:v12 wbsProperty:v10 wbsComponent:v11];

  return v14;
}

+ (id)_valueStringForValue:(id)a3 wbsProperty:(id)a4 wbsComponent:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[WBSContactsHelper CNContactKeyFromWBSABKey:v9];
  if ([v11 isEqualToString:*MEMORY[0x1E4F1AF10]])
  {
    id v12 = v8;
    if ([v10 length])
    {
      uint64_t v13 = [v12 value];
      [a1 _valueStringForWBSComponent:v10 inAddress:v13];
    }
    else
    {
      uint64_t v17 = (void *)MEMORY[0x1E4F1BA88];
      uint64_t v13 = [v12 value];
      [v17 stringFromPostalAddress:v13 style:0];
    }
    uint64_t v14 = LABEL_4:;
    v18 = (void *)v14;
LABEL_11:

LABEL_12:
    goto LABEL_13;
  }
  if ([a1 _isValueAStringForContactsProperty:v11])
  {
    id v15 = v8;
LABEL_7:
    v18 = v15;
    goto LABEL_13;
  }
  if ([v11 isEqualToString:*MEMORY[0x1E4F1AD90]])
  {
    id v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
    uint64_t v13 = [v12 dateFromComponents:v8];
    id v16 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v16 setLocalizedDateFormatFromTemplate:@"dMy"];
    v18 = [v16 stringFromDate:v13];

    goto LABEL_11;
  }
  if ([v11 isEqualToString:*MEMORY[0x1E4F1AEE0]])
  {
    id v12 = [v8 value];
    v18 = [v12 stringValue];
    goto LABEL_12;
  }
  if ([v11 isEqualToString:*MEMORY[0x1E4F1ADC8]]
    || [v11 isEqualToString:*MEMORY[0x1E4F1AFB0]])
  {
    id v15 = [v8 value];
    goto LABEL_7;
  }
  if ([v11 isEqualToString:*MEMORY[0x1E4F1AE60]])
  {
    id v12 = v8;
    uint64_t v20 = [v10 length];
    v21 = [v12 value];
    uint64_t v13 = v21;
    if (v20) {
      [a1 _valueStringForWBSComponent:v10 inInstantMessageAddress:v21];
    }
    else {
      [v21 username];
    }
    goto LABEL_4;
  }
  v22 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    +[WBSContactsEntry _valueStringForValue:wbsProperty:wbsComponent:]((uint64_t)v9, v22, v23, v24, v25, v26, v27, v28);
  }
  v18 = 0;
LABEL_13:

  return v18;
}

- (unint64_t)_numberOfValuesForWBSProperty:(id)a3
{
  return [(WBSContactsEntry *)self _numberOfValuesForWBSProperty:a3 andContact:self->_contact];
}

- (unint64_t)_numberOfValuesForWBSProperty:(id)a3 andContact:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    if ([(id)objc_opt_class() isWBSProxyProperty:v5])
    {
      unint64_t v7 = 1;
    }
    else
    {
      id v8 = objc_msgSend(v6, "safari_valueForWBSABProperty:", v5);
      if (v8)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          unint64_t v7 = [v8 count];
        }
        else {
          unint64_t v7 = 1;
        }
      }
      else
      {
        unint64_t v7 = 0;
      }
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (CNContact)contact
{
  return self->_contact;
}

- (void).cxx_destruct
{
}

+ (void)_valueStringForWBSComponent:(uint64_t)a3 inInstantMessageAddress:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_valueStringForWBSComponent:(uint64_t)a3 inAddress:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)_valueStringForValue:(uint64_t)a3 wbsProperty:(uint64_t)a4 wbsComponent:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end