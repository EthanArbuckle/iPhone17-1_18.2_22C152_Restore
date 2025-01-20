@interface PKPassPersonalization
+ (BOOL)supportsSecureCoding;
+ (PKPassPersonalization)passPersonalizationWithPassBundle:(id)a3;
- (NSString)localizedDescription;
- (NSString)termsAndConditions;
- (PKPassPersonalization)initWithCoder:(id)a3;
- (PKPassPersonalization)initWithDictionary:(id)a3 bundle:(id)a4;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)requiredPersonalizationFields;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPassPersonalization

+ (PKPassPersonalization)passPersonalizationWithPassBundle:(id)a3
{
  id v4 = a3;
  v5 = [v4 URLForResource:@"personalization" withExtension:@"json"];
  if (v5)
  {
    v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v5 options:0 error:0];
    if (v6)
    {
      v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v6 options:0 error:0];
    }
    else
    {
      v7 = 0;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v8 = (void *)[objc_alloc((Class)a1) initWithDictionary:v7 bundle:v4];
    }
    else {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }

  return (PKPassPersonalization *)v8;
}

- (PKPassPersonalization)initWithDictionary:(id)a3 bundle:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v29.receiver = self;
  v29.super_class = (Class)PKPassPersonalization;
  v8 = [(PKPassPersonalization *)&v29 init];
  if (v8)
  {
    v9 = [v6 PKStringForKey:@"termsAndConditions"];
    uint64_t v10 = [v9 copy];
    termsAndConditions = v8->_termsAndConditions;
    v8->_termsAndConditions = (NSString *)v10;

    v12 = [v6 PKStringForKey:@"description"];
    v13 = [v6 PKArrayForKey:@"requiredPersonalizationFields"];
    if (v12)
    {
      v14 = PKLocalizedPersonalizationStringForPassBundle(v12, v7);
      uint64_t v15 = [v14 copy];
      localizedDescription = v8->_localizedDescription;
      v8->_localizedDescription = (NSString *)v15;
    }
    if (v13)
    {
      v26 = v12;
      id v27 = v7;
      id v28 = v6;
      v25 = v13;
      id v17 = v13;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        unint64_t v20 = 0;
        uint64_t v21 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v31 != v21) {
              objc_enumerationMutation(v17);
            }
            v23 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              if ([v23 caseInsensitiveCompare:@"PKPassPersonalizationFieldName"])
              {
                if ([v23 caseInsensitiveCompare:@"PKPassPersonalizationFieldPostalCode"])
                {
                  if ([v23 caseInsensitiveCompare:@"PKPassPersonalizationFieldEmailAddress"])
                  {
                    if (![v23 caseInsensitiveCompare:@"PKPassPersonalizationFieldPhoneNumber"]) {
                      v20 |= 8uLL;
                    }
                  }
                  else
                  {
                    v20 |= 4uLL;
                  }
                }
                else
                {
                  v20 |= 2uLL;
                }
              }
              else
              {
                v20 |= 1uLL;
              }
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v19);
      }
      else
      {
        unint64_t v20 = 0;
      }

      id v7 = v27;
      v8->_requiredPersonalizationFields = v20;
      id v6 = v28;
      v13 = v25;
      v12 = v26;
    }
  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassPersonalization)initWithCoder:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKPassPersonalization;
  v5 = [(PKPassPersonalization *)&v13 init];
  if (v5)
  {
    v5->_requiredPersonalizationFields = [v4 decodeIntegerForKey:@"requiredPersonalizationFields"];
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"description"];
    uint64_t v7 = [v6 copy];
    localizedDescription = v5->_localizedDescription;
    v5->_localizedDescription = (NSString *)v7;

    v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"termsAndConditions"];
    uint64_t v10 = [v9 copy];
    termsAndConditions = v5->_termsAndConditions;
    v5->_termsAndConditions = (NSString *)v10;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t requiredPersonalizationFields = self->_requiredPersonalizationFields;
  id v5 = a3;
  [v5 encodeInteger:requiredPersonalizationFields forKey:@"requiredPersonalizationFields"];
  [v5 encodeObject:self->_localizedDescription forKey:@"description"];
  [v5 encodeObject:self->_termsAndConditions forKey:@"termsAndConditions"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init(PKPassPersonalization);
  v4->_unint64_t requiredPersonalizationFields = self->_requiredPersonalizationFields;
  uint64_t v5 = [(NSString *)self->_localizedDescription copy];
  localizedDescription = v4->_localizedDescription;
  v4->_localizedDescription = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_termsAndConditions copy];
  termsAndConditions = v4->_termsAndConditions;
  v4->_termsAndConditions = (NSString *)v7;

  return v4;
}

- (id)description
{
  unint64_t requiredPersonalizationFields = self->_requiredPersonalizationFields;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v5 = v4;
  if (requiredPersonalizationFields)
  {
    [v4 addObject:@"PKPassPersonalizationFieldName"];
    if ((requiredPersonalizationFields & 2) == 0)
    {
LABEL_3:
      if ((requiredPersonalizationFields & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((requiredPersonalizationFields & 2) == 0)
  {
    goto LABEL_3;
  }
  [v5 addObject:@"PKPassPersonalizationFieldPostalCode"];
  if ((requiredPersonalizationFields & 4) == 0)
  {
LABEL_4:
    if ((requiredPersonalizationFields & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  [v5 addObject:@"PKPassPersonalizationFieldEmailAddress"];
  if ((requiredPersonalizationFields & 8) != 0) {
LABEL_5:
  }
    [v5 addObject:@"PKPassPersonalizationFieldPhoneNumber"];
LABEL_6:
  id v6 = NSString;
  uint64_t v7 = [v5 componentsJoinedByString:@","];
  v8 = [v6 stringWithFormat:@"Required Fields:[%@], Localized Description: %@", v7, self->_localizedDescription];

  return v8;
}

- (unint64_t)requiredPersonalizationFields
{
  return self->_requiredPersonalizationFields;
}

- (NSString)termsAndConditions
{
  return self->_termsAndConditions;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_termsAndConditions, 0);
}

@end