@interface PKPassSemantic
+ (BOOL)isSupportedDictionaryKeyType:(id)a3;
+ (BOOL)isSupportedDictionaryValueType:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)_supportedDictionaryValueTypes;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (NSArray)dictionariesValue;
- (NSArray)stringsValue;
- (NSDate)dateValue;
- (NSNumber)numberValue;
- (NSPersonNameComponents)personNameComponentsValue;
- (NSString)fieldKey;
- (NSString)semanticKey;
- (NSString)stringValue;
- (PKCurrencyAmount)currencyAmountValue;
- (PKEventDateInfo)eventDateInfoValue;
- (PKLocation)locationValue;
- (PKPassSemantic)initWithCoder:(id)a3;
- (id)description;
- (int64_t)compare:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setCurrencyAmountValue:(id)a3;
- (void)setDateValue:(id)a3;
- (void)setDictionariesValue:(id)a3;
- (void)setEventDateInfoValue:(id)a3;
- (void)setFieldKey:(id)a3;
- (void)setLocationValue:(id)a3;
- (void)setNumberValue:(id)a3;
- (void)setPersonNameComponentsValue:(id)a3;
- (void)setSemanticKey:(id)a3;
- (void)setStringValue:(id)a3;
- (void)setStringsValue:(id)a3;
@end

@implementation PKPassSemantic

- (BOOL)hasValue
{
  return self->_stringValue
      || self->_dateValue
      || self->_eventDateInfoValue
      || self->_numberValue
      || self->_locationValue
      || self->_currencyAmountValue
      || self->_personNameComponentsValue
      || self->_stringsValue
      || self->_dictionariesValue != 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassSemantic)initWithCoder:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PKPassSemantic;
  v5 = [(PKPassSemantic *)&v25 init];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"semanticKey"];
    [(PKPassSemantic *)v5 setSemanticKey:v6];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fieldKey"];
    [(PKPassSemantic *)v5 setFieldKey:v7];

    v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stringValue"];
    [(PKPassSemantic *)v5 setStringValue:v8];

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"dateValue"];
    [(PKPassSemantic *)v5 setDateValue:v9];

    v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"eventDateInfoValue"];
    [(PKPassSemantic *)v5 setEventDateInfoValue:v10];

    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"numberValue"];
    [(PKPassSemantic *)v5 setNumberValue:v11];

    v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"locationValue"];
    [(PKPassSemantic *)v5 setLocationValue:v12];

    v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"currencyAmountValue"];
    [(PKPassSemantic *)v5 setCurrencyAmountValue:v13];

    v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"personNameComponentsValue"];
    [(PKPassSemantic *)v5 setPersonNameComponentsValue:v14];

    v15 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    v18 = [v4 decodeObjectOfClasses:v17 forKey:@"stringsValue"];
    [(PKPassSemantic *)v5 setStringsValue:v18];

    id v19 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v20 = objc_opt_class();
    v21 = objc_msgSend(v19, "initWithObjects:", v20, objc_opt_class(), 0);
    v22 = [(id)objc_opt_class() _supportedDictionaryValueTypes];
    [v21 addObjectsFromArray:v22];

    v23 = [v4 decodeObjectOfClasses:v21 forKey:@"dictionariesValue"];
    [(PKPassSemantic *)v5 setDictionariesValue:v23];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKPassSemantic *)self semanticKey];
  [v4 encodeObject:v5 forKey:@"semanticKey"];

  v6 = [(PKPassSemantic *)self fieldKey];
  [v4 encodeObject:v6 forKey:@"fieldKey"];

  v7 = [(PKPassSemantic *)self stringValue];
  [v4 encodeObject:v7 forKey:@"stringValue"];

  v8 = [(PKPassSemantic *)self dateValue];
  [v4 encodeObject:v8 forKey:@"dateValue"];

  v9 = [(PKPassSemantic *)self eventDateInfoValue];
  [v4 encodeObject:v9 forKey:@"eventDateInfoValue"];

  v10 = [(PKPassSemantic *)self numberValue];
  [v4 encodeObject:v10 forKey:@"numberValue"];

  v11 = [(PKPassSemantic *)self locationValue];
  [v4 encodeObject:v11 forKey:@"locationValue"];

  v12 = [(PKPassSemantic *)self currencyAmountValue];
  [v4 encodeObject:v12 forKey:@"currencyAmountValue"];

  v13 = [(PKPassSemantic *)self personNameComponentsValue];
  [v4 encodeObject:v13 forKey:@"personNameComponentsValue"];

  v14 = [(PKPassSemantic *)self stringsValue];
  [v4 encodeObject:v14 forKey:@"stringsValue"];

  id v15 = [(PKPassSemantic *)self dictionariesValue];
  [v4 encodeObject:v15 forKey:@"dictionariesValue"];
}

- (id)description
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v4 = [NSString stringWithFormat:@"<%@: %p>, ", objc_opt_class(), self];
  [v3 appendString:v4];

  if (self->_stringValue)
  {
    [NSString stringWithFormat:@"string: %@", self->_stringValue];
  }
  else if (self->_dateValue)
  {
    [NSString stringWithFormat:@"date: %@", self->_dateValue];
  }
  else if (self->_eventDateInfoValue)
  {
    [NSString stringWithFormat:@"eventDateInfo: %@", self->_eventDateInfoValue];
  }
  else if (self->_numberValue)
  {
    [NSString stringWithFormat:@"number: %@", self->_numberValue];
  }
  else if (self->_locationValue)
  {
    [NSString stringWithFormat:@"location: %@", self->_locationValue];
  }
  else if (self->_currencyAmountValue)
  {
    [NSString stringWithFormat:@"currencyAmount: %@", self->_currencyAmountValue];
  }
  else if (self->_personNameComponentsValue)
  {
    [NSString stringWithFormat:@"personNameComponents: %@", self->_personNameComponentsValue];
  }
  else if (self->_stringsValue)
  {
    [NSString stringWithFormat:@"strings: %@", self->_stringsValue];
  }
  else if (self->_dictionariesValue)
  {
    [NSString stringWithFormat:@"dictionaries: %@", self->_dictionariesValue];
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"no value", v8);
  v5 = };
  [v3 appendString:v5];

  v6 = (void *)[v3 copy];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  v7 = v6;
  if (v6)
  {
    fieldKey = self->_fieldKey;
    uint64_t v9 = [v6 fieldKey];
    v10 = (void *)v9;
    if (fieldKey && v9)
    {
      if ([(NSString *)fieldKey isEqual:v9])
      {
LABEL_8:
        dateValue = self->_dateValue;
        uint64_t v12 = [v7 dateValue];
        v13 = (void *)v12;
        if (dateValue && v12)
        {
          if ([(NSDate *)dateValue isEqual:v12])
          {
LABEL_11:
            eventDateInfoValue = self->_eventDateInfoValue;
            uint64_t v15 = [v7 eventDateInfoValue];
            uint64_t v16 = (void *)v15;
            if (eventDateInfoValue && v15)
            {
              if ([(PKEventDateInfo *)eventDateInfoValue isEqual:v15])
              {
LABEL_14:
                numberValue = self->_numberValue;
                uint64_t v18 = [v7 numberValue];
                id v19 = (void *)v18;
                if (numberValue && v18)
                {
                  if ([(NSNumber *)numberValue isEqual:v18])
                  {
LABEL_17:
                    semanticKey = self->_semanticKey;
                    uint64_t v21 = [v7 semanticKey];
                    v22 = (void *)v21;
                    if (semanticKey && v21)
                    {
                      if ([(NSString *)semanticKey isEqual:v21])
                      {
LABEL_20:
                        stringValue = self->_stringValue;
                        uint64_t v24 = [v7 stringValue];
                        objc_super v25 = (void *)v24;
                        if (stringValue && v24)
                        {
                          if ([(NSString *)stringValue isEqual:v24])
                          {
LABEL_23:
                            stringsValue = self->_stringsValue;
                            uint64_t v27 = [v7 stringsValue];
                            v28 = (void *)v27;
                            if (stringsValue && v27)
                            {
                              v29 = stringsValue;
                              v30 = v28;
                              char v31 = [(NSArray *)v29 isEqual:v28];
                              v28 = v30;
                              if (v31)
                              {
LABEL_26:
                                v50 = v28;
                                locationValue = self->_locationValue;
                                uint64_t v33 = [v7 locationValue];
                                v34 = (void *)v33;
                                if (locationValue && v33)
                                {
                                  v35 = locationValue;
                                  v36 = v34;
                                  BOOL v37 = [(PKLocation *)v35 isEqual:v34];
                                  v34 = v36;
                                  if (v37)
                                  {
LABEL_29:
                                    v49 = v34;
                                    dictionariesValue = self->_dictionariesValue;
                                    uint64_t v39 = [v7 dictionariesValue];
                                    v48 = (void *)v39;
                                    if (dictionariesValue && v39)
                                    {
                                      if ([(NSArray *)dictionariesValue isEqual:v39])
                                      {
LABEL_32:
                                        currencyAmountValue = self->_currencyAmountValue;
                                        uint64_t v41 = [v7 currencyAmountValue];
                                        v47 = (void *)v41;
                                        if (currencyAmountValue && v41)
                                        {
                                          if (-[PKCurrencyAmount isEqual:](currencyAmountValue, "isEqual:", v41, v41, v48))
                                          {
                                            goto LABEL_35;
                                          }
                                        }
                                        else if (currencyAmountValue == (PKCurrencyAmount *)v41)
                                        {
LABEL_35:
                                          personNameComponentsValue = self->_personNameComponentsValue;
                                          uint64_t v43 = objc_msgSend(v7, "personNameComponentsValue", v47);
                                          v44 = (void *)v43;
                                          if (personNameComponentsValue && v43) {
                                            char v45 = [(NSPersonNameComponents *)personNameComponentsValue isEqual:v43];
                                          }
                                          else {
                                            char v45 = personNameComponentsValue == (NSPersonNameComponents *)v43;
                                          }

                                          goto LABEL_61;
                                        }
                                        char v45 = 0;
LABEL_61:

                                        goto LABEL_62;
                                      }
                                    }
                                    else if (dictionariesValue == (NSArray *)v39)
                                    {
                                      goto LABEL_32;
                                    }
                                    char v45 = 0;
LABEL_62:

                                    v34 = v49;
                                    goto LABEL_63;
                                  }
                                }
                                else if (locationValue == (PKLocation *)v33)
                                {
                                  goto LABEL_29;
                                }
                                char v45 = 0;
LABEL_63:

                                v28 = v50;
                                goto LABEL_64;
                              }
                            }
                            else if (stringsValue == (NSArray *)v27)
                            {
                              goto LABEL_26;
                            }
                            char v45 = 0;
LABEL_64:

                            goto LABEL_65;
                          }
                        }
                        else if (stringValue == (NSString *)v24)
                        {
                          goto LABEL_23;
                        }
                        char v45 = 0;
LABEL_65:

                        goto LABEL_66;
                      }
                    }
                    else if (semanticKey == (NSString *)v21)
                    {
                      goto LABEL_20;
                    }
                    char v45 = 0;
LABEL_66:

                    goto LABEL_67;
                  }
                }
                else if (numberValue == (NSNumber *)v18)
                {
                  goto LABEL_17;
                }
                char v45 = 0;
LABEL_67:

                goto LABEL_68;
              }
            }
            else if (eventDateInfoValue == (PKEventDateInfo *)v15)
            {
              goto LABEL_14;
            }
            char v45 = 0;
LABEL_68:

            goto LABEL_69;
          }
        }
        else if (dateValue == (NSDate *)v12)
        {
          goto LABEL_11;
        }
        char v45 = 0;
LABEL_69:

        goto LABEL_70;
      }
    }
    else if (fieldKey == (NSString *)v9)
    {
      goto LABEL_8;
    }
    char v45 = 0;
LABEL_70:

    goto LABEL_71;
  }
  char v45 = 0;
LABEL_71:

  return v45;
}

- (int64_t)compare:(id)a3
{
  id v4 = a3;
  v5 = [v4 stringValue];
  stringValue = self->_stringValue;
  if (stringValue) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    uint64_t v8 = [v4 dateValue];
    dateValue = self->_dateValue;
    if (dateValue && v8)
    {
      int64_t v10 = [(NSDate *)dateValue compare:v8];
LABEL_64:

      goto LABEL_65;
    }
    v11 = [v4 eventDateInfoValue];
    eventDateInfoValue = self->_eventDateInfoValue;
    if (eventDateInfoValue && v11)
    {
      v13 = [(PKEventDateInfo *)eventDateInfoValue date];
      uint64_t v14 = [v11 date];
      uint64_t v15 = (void *)v14;
      if (v13)
      {
        if (v14)
        {
          int64_t v10 = [v13 compare:v14];
          if (!v10)
          {
            v58 = [(PKEventDateInfo *)self->_eventDateInfoValue timeZone];
            uint64_t v16 = [v58 name];
            v17 = [v11 timeZone];
            uint64_t v18 = [v17 name];
            int64_t v10 = __26__PKPassSemantic_compare___block_invoke((uint64_t)v18, v16, v18);
          }
        }
        else
        {
          int64_t v10 = 1;
        }
      }
      else
      {
        int64_t v10 = -1;
      }
      goto LABEL_62;
    }
    v13 = [v4 numberValue];
    numberValue = self->_numberValue;
    if (numberValue && v13)
    {
      int64_t v10 = [(NSNumber *)numberValue compare:v13];
LABEL_63:

      goto LABEL_64;
    }
    uint64_t v15 = [v4 locationValue];
    locationValue = self->_locationValue;
    if (locationValue && v15)
    {
      [(PKLocation *)locationValue coordinate];
      double v22 = v21;
      [v15 coordinate];
      double v24 = v23;
      [(PKLocation *)self->_locationValue coordinate];
      double v26 = v25;
      [v15 coordinate];
      if (v22 == v24 && v26 == v27)
      {
        int64_t v10 = 0;
LABEL_62:

        goto LABEL_63;
      }
      v38 = [(PKLocation *)self->_locationValue name];
      uint64_t v39 = [v15 name];
      int64_t v10 = __26__PKPassSemantic_compare___block_invoke((uint64_t)v39, v38, v39);

      if (v10) {
        goto LABEL_62;
      }
      v34 = [(PKLocation *)self->_locationValue relevantText];
      v35 = [v15 relevantText];
      int64_t v10 = __26__PKPassSemantic_compare___block_invoke((uint64_t)v35, v34, v35);
      goto LABEL_49;
    }
    v28 = [v4 currencyAmountValue];
    currencyAmountValue = self->_currencyAmountValue;
    if (currencyAmountValue && v28)
    {
      v30 = [(PKCurrencyAmount *)currencyAmountValue currency];
      [v28 currency];
      v59 = v13;
      char v31 = v15;
      uint64_t v33 = v32 = v28;
      int64_t v10 = __26__PKPassSemantic_compare___block_invoke((uint64_t)v33, v30, v33);

      v34 = v32;
      uint64_t v15 = v31;
      v13 = v59;

      if (v10)
      {
LABEL_61:

        goto LABEL_62;
      }
      v35 = [(PKCurrencyAmount *)self->_currencyAmountValue amount];
      uint64_t v36 = [v34 amount];
      BOOL v37 = (void *)v36;
      if (v35)
      {
        if (v36) {
          int64_t v10 = [v35 compare:v36];
        }
        else {
          int64_t v10 = 1;
        }
      }
      else
      {
        int64_t v10 = -1;
      }

LABEL_49:
      goto LABEL_61;
    }
    v57 = v28;
    uint64_t v40 = [v4 personNameComponentsValue];
    v60 = (void *)v40;
    if (self->_personNameComponentsValue)
    {
      uint64_t v41 = v40;
      if (v40)
      {
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __26__PKPassSemantic_compare___block_invoke_2;
        aBlock[3] = &unk_1E56E79F0;
        id v62 = &__block_literal_global_99;
        v42 = (uint64_t (**)(void *, NSPersonNameComponents *, void))_Block_copy(aBlock);
        int64_t v10 = v42[2](v42, self->_personNameComponentsValue, v41);
        if (!v10)
        {
          uint64_t v43 = [(NSPersonNameComponents *)self->_personNameComponentsValue phoneticRepresentation];
          uint64_t v44 = [v60 phoneticRepresentation];
          char v45 = (void *)v44;
          if (v43)
          {
            v46 = (void *)v43;
            if (v44) {
              int64_t v10 = v42[2](v42, (NSPersonNameComponents *)v43, v44);
            }
            else {
              int64_t v10 = 1;
            }
          }
          else
          {
            v46 = 0;
            int64_t v10 = -1;
          }
        }
        v34 = v57;
        goto LABEL_60;
      }
    }
    v47 = [v4 stringsValue];
    unint64_t v48 = [(NSArray *)self->_stringsValue count];
    if (v48 <= [v47 count])
    {
      unint64_t v49 = [(NSArray *)self->_stringsValue count];
      if (v49 >= [v47 count])
      {
        v50 = [v4 dictionariesValue];
        unint64_t v51 = [(NSArray *)self->_dictionariesValue count];
        if (v51 <= [v50 count])
        {
          NSUInteger v53 = [(NSArray *)self->_dictionariesValue count];
          unint64_t v54 = [v50 count];
          v55 = v50;
          if (v53 < v54) {
            int64_t v10 = -1;
          }
          else {
            int64_t v10 = 1;
          }
          v34 = v57;
          v52 = v55;
        }
        else
        {
          v52 = v50;
          int64_t v10 = 1;
          v34 = v57;
        }

        goto LABEL_56;
      }
      int64_t v10 = -1;
    }
    else
    {
      int64_t v10 = 1;
    }
    v34 = v57;
LABEL_56:

LABEL_60:
    goto LABEL_61;
  }
  int64_t v10 = [(NSString *)stringValue compare:v5];
LABEL_65:

  return v10;
}

uint64_t __26__PKPassSemantic_compare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v5;
  if (v4)
  {
    if (v5) {
      uint64_t v7 = [v4 compare:v5];
    }
    else {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

uint64_t __26__PKPassSemantic_compare___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = [v5 familyName];
  uint64_t v9 = [v6 familyName];
  uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v7 + 16))(v7, v8, v9);

  if (!v10)
  {
    uint64_t v11 = *(void *)(a1 + 32);
    uint64_t v12 = [v5 givenName];
    v13 = [v6 givenName];
    uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

    if (!v10)
    {
      uint64_t v14 = *(void *)(a1 + 32);
      uint64_t v15 = [v5 middleName];
      uint64_t v16 = [v6 middleName];
      uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v14 + 16))(v14, v15, v16);

      if (!v10)
      {
        uint64_t v17 = *(void *)(a1 + 32);
        uint64_t v18 = [v5 namePrefix];
        id v19 = [v6 namePrefix];
        uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v17 + 16))(v17, v18, v19);

        if (!v10)
        {
          uint64_t v20 = *(void *)(a1 + 32);
          double v21 = [v5 nameSuffix];
          double v22 = [v6 nameSuffix];
          uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v20 + 16))(v20, v21, v22);

          if (!v10)
          {
            uint64_t v23 = *(void *)(a1 + 32);
            double v24 = [v5 nickname];
            double v25 = [v6 nickname];
            uint64_t v10 = (*(uint64_t (**)(uint64_t, void *, void *))(v23 + 16))(v23, v24, v25);
          }
        }
      }
    }
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_fieldKey];
  [v3 safelyAddObject:self->_dateValue];
  [v3 safelyAddObject:self->_eventDateInfoValue];
  [v3 safelyAddObject:self->_numberValue];
  [v3 safelyAddObject:self->_semanticKey];
  [v3 safelyAddObject:self->_stringValue];
  [v3 safelyAddObject:self->_stringsValue];
  [v3 safelyAddObject:self->_locationValue];
  [v3 safelyAddObject:self->_dictionariesValue];
  [v3 safelyAddObject:self->_currencyAmountValue];
  [v3 safelyAddObject:self->_personNameComponentsValue];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

+ (BOOL)isSupportedDictionaryValueType:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  unint64_t v4 = [(id)objc_opt_class() _supportedDictionaryValueTypes];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__PKPassSemantic_isSupportedDictionaryValueType___block_invoke;
  v7[3] = &unk_1E56E7A18;
  id v5 = v3;
  id v8 = v5;
  uint64_t v9 = &v10;
  [v4 enumerateObjectsUsingBlock:v7];

  LOBYTE(v4) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)v4;
}

uint64_t __49__PKPassSemantic_isSupportedDictionaryValueType___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_opt_isKindOfClass();
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)isSupportedDictionaryKeyType:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

+ (id)_supportedDictionaryValueTypes
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

- (NSString)semanticKey
{
  return self->_semanticKey;
}

- (void)setSemanticKey:(id)a3
{
}

- (NSString)fieldKey
{
  return self->_fieldKey;
}

- (void)setFieldKey:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void)setDateValue:(id)a3
{
}

- (PKEventDateInfo)eventDateInfoValue
{
  return self->_eventDateInfoValue;
}

- (void)setEventDateInfoValue:(id)a3
{
}

- (NSNumber)numberValue
{
  return self->_numberValue;
}

- (void)setNumberValue:(id)a3
{
}

- (PKLocation)locationValue
{
  return self->_locationValue;
}

- (void)setLocationValue:(id)a3
{
}

- (PKCurrencyAmount)currencyAmountValue
{
  return self->_currencyAmountValue;
}

- (void)setCurrencyAmountValue:(id)a3
{
}

- (NSPersonNameComponents)personNameComponentsValue
{
  return self->_personNameComponentsValue;
}

- (void)setPersonNameComponentsValue:(id)a3
{
}

- (NSArray)stringsValue
{
  return self->_stringsValue;
}

- (void)setStringsValue:(id)a3
{
}

- (NSArray)dictionariesValue
{
  return self->_dictionariesValue;
}

- (void)setDictionariesValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionariesValue, 0);
  objc_storeStrong((id *)&self->_stringsValue, 0);
  objc_storeStrong((id *)&self->_personNameComponentsValue, 0);
  objc_storeStrong((id *)&self->_currencyAmountValue, 0);
  objc_storeStrong((id *)&self->_locationValue, 0);
  objc_storeStrong((id *)&self->_numberValue, 0);
  objc_storeStrong((id *)&self->_eventDateInfoValue, 0);
  objc_storeStrong((id *)&self->_dateValue, 0);
  objc_storeStrong((id *)&self->_stringValue, 0);
  objc_storeStrong((id *)&self->_fieldKey, 0);
  objc_storeStrong((id *)&self->_semanticKey, 0);
}

@end