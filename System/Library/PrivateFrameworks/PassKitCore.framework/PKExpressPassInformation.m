@interface PKExpressPassInformation
+ (BOOL)extractApplicationIdentifier:(id *)a3 subcredentialIdentifier:(id *)a4 fromIdentifiers:(id)a5;
+ (BOOL)supportsSecureCoding;
- (BOOL)forceModernEncoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isUserChoice;
- (NSDictionary)subcredentialCredentialIdentifiers;
- (NSString)passUniqueIdentifier;
- (PKExpressPassInformation)init;
- (PKExpressPassInformation)initWithCoder:(id)a3;
- (PKExpressPassInformation)initWithExpressPassInformation:(id)a3;
- (id)_init;
- (id)_initForPaymentPass:(id)a3 configuration:(id)a4;
- (id)criteriaForApplication:(id)a3;
- (id)criteriaForPaymentApplicationIdentifier:(id)a3;
- (id)description;
- (id)expressMode;
- (id)initDummyExpressInfoForAutomaticSelectionCriteriaUpgradeRequest:(id)a3 paymentPass:(id)a4 withTechologyTest:(id)a5;
- (id)initForExpressMode:(id)a3 withPassUniqueIdentifier:(id)a4 paymentApplicationIdentifier:(id)a5;
- (id)initForPaymentPass:(id)a3 withTechologyTest:(id)a4;
- (id)paymentApplicationIdentifier;
- (id)paymentApplicationIdentifiers;
- (int64_t)cardType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateCredentialsWithHandler:(id)a3;
- (void)enumerateCriteriaWithHandler:(id)a3;
- (void)setForceModernEncoding:(BOOL)a3;
@end

@implementation PKExpressPassInformation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_passUniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_v0_expressMode, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

- (PKExpressPassInformation)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(PKExpressPassInformation *)self _init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v7 = objc_opt_class();
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v6, "initWithObjects:", v7, v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"configuration.1"];
    configuration = v5->_configuration;
    v5->_configuration = (NSDictionary *)v12;

    if (v5->_configuration)
    {
      uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
      passUniqueIdentifier = v5->_passUniqueIdentifier;
      v5->_passUniqueIdentifier = (NSString *)v14;

      v5->_userChoice = [v4 decodeBoolForKey:@"userChoice"];
      v5->_cardType = [v4 decodeIntegerForKey:@"cardType"];
    }
    else
    {
      v16 = v5;
      id v17 = v4;
      uint64_t v18 = objc_opt_class();
      uint64_t v19 = objc_opt_class();
      uint64_t v20 = objc_opt_class();
      v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v19, v20, v18, objc_opt_class(), 0);
      v22 = [v17 decodeObjectOfClasses:v21 forKey:@"configuration"];

      if (v22)
      {
        v23 = [v17 decodeObjectOfClass:v20 forKey:@"passUniqueIdentifier"];
        char v43 = [v17 decodeBoolForKey:@"userChoice"];
        uint64_t v24 = [v17 decodeIntegerForKey:@"cardType"];
        v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v19, v20, 0);
        v26 = [v17 decodeObjectOfClasses:v25 forKey:@"subcredentialCredentialIdentifiers"];

        id v27 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __DecodeV1Format_block_invoke;
        v44[3] = &unk_1E56F0488;
        id v45 = v26;
        id v46 = v27;
        id v28 = v26;
        id v29 = v27;
        [v22 enumerateKeysAndObjectsUsingBlock:v44];
        v30 = v16->_passUniqueIdentifier;
        v16->_passUniqueIdentifier = v23;
        v31 = v23;

        v16->_userChoice = v43;
        v16->_cardType = v24;
        uint64_t v32 = [v29 copy];
        v33 = v5->_configuration;
        v5->_configuration = (NSDictionary *)v32;
      }
      else
      {

        v16 = v16;
        id v17 = v17;
        v22 = [v17 decodeObjectOfClass:objc_opt_class() forKey:@"expressMode"];
        if (v22)
        {
          v34 = [v17 decodeObjectOfClass:objc_opt_class() forKey:@"passUniqueIdentifier"];
          v35 = [v17 decodeObjectOfClass:objc_opt_class() forKey:@"paymentApplicationIdentifier"];
          unint64_t v36 = PKExpressPassTypeForExpressMode(v22);
          if (v36 < 3) {
            unint64_t v37 = v36 + 1;
          }
          else {
            unint64_t v37 = 0;
          }
          v38 = v16->_passUniqueIdentifier;
          v16->_passUniqueIdentifier = v34;
          v39 = v34;

          v16->_cardType = v37;
          uint64_t v40 = ConfigurationFromV0((uint64_t)v22, (uint64_t)v39, v35);
          v41 = v5->_configuration;
          v5->_configuration = (NSDictionary *)v40;
        }
      }
    }
  }

  return v5;
}

- (id)_initForPaymentPass:(id)a3 configuration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 uniqueID];
  if (v8 && [v7 count])
  {
    uint64_t v9 = [(PKExpressPassInformation *)self _init];
    if (v9)
    {
      v9[4] = [v6 cardType];
      uint64_t v10 = [v8 copy];
      v11 = (void *)v9[5];
      v9[5] = v10;

      *((unsigned char *)v9 + 24) = [v6 contactlessActivationGroupingType] == 2;
      uint64_t v12 = [v7 copy];
      v13 = (void *)v9[1];
      v9[1] = v12;

      if (!v9[4])
      {
        if ([v6 isTransitPass])
        {
          uint64_t v14 = 2;
        }
        else
        {
          int v16 = [v6 isAccessPass];
          uint64_t v14 = 3;
          if (!v16) {
            uint64_t v14 = 1;
          }
        }
        v9[4] = v14;
      }
    }
    self = v9;
    v15 = self;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PKExpressPassInformation;
  return [(PKExpressPassInformation *)&v3 init];
}

- (id)paymentApplicationIdentifiers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  configuration = self->_configuration;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PKExpressPassInformation_paymentApplicationIdentifiers__block_invoke;
  v7[3] = &unk_1E56D8F28;
  id v5 = v3;
  id v8 = v5;
  [(NSDictionary *)configuration enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

- (NSString)passUniqueIdentifier
{
  return self->_passUniqueIdentifier;
}

- (id)initForPaymentPass:(id)a3 withTechologyTest:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (unsigned int (**)(id, uint64_t))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  unint64_t v36 = v5;
  id v8 = [v5 devicePaymentApplications];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v53;
    unint64_t v37 = v8;
    uint64_t v38 = *(void *)v53;
    do
    {
      uint64_t v12 = 0;
      uint64_t v39 = v10;
      do
      {
        if (*(void *)v53 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v52 + 1) + 8 * v12);
        if ([v13 supportsContactlessPayment]
          && [v13 supportsExpress])
        {
          uint64_t v14 = [v13 applicationIdentifier];
          v15 = [v13 automaticSelectionCriteria];
          if ([v14 length] && objc_msgSend(v15, "count"))
          {
            uint64_t v40 = v13;
            uint64_t v43 = v12;
            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            long long v48 = 0u;
            long long v49 = 0u;
            long long v50 = 0u;
            long long v51 = 0u;
            v42 = v15;
            id v17 = v15;
            uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v59 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              uint64_t v20 = *(void *)v49;
              do
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v49 != v20) {
                    objc_enumerationMutation(v17);
                  }
                  v22 = *(void **)(*((void *)&v48 + 1) + 8 * i);
                  if ([v22 supportsExpress])
                  {
                    uint64_t v23 = [v22 technologyType];
                    if (v23)
                    {
                      if (!v6 || v6[2](v6, v23)) {
                        [v16 addObject:v22];
                      }
                    }
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v59 count:16];
              }
              while (v19);
            }

            if ([v16 count])
            {
              uint64_t v24 = [v40 subcredentials];
              if ([v24 count])
              {
                long long v46 = 0u;
                long long v47 = 0u;
                long long v44 = 0u;
                long long v45 = 0u;
                v25 = [v40 subcredentials];
                uint64_t v26 = [v25 countByEnumeratingWithState:&v44 objects:v58 count:16];
                if (v26)
                {
                  uint64_t v27 = v26;
                  v41 = v24;
                  uint64_t v28 = *(void *)v45;
                  do
                  {
                    for (uint64_t j = 0; j != v27; ++j)
                    {
                      if (*(void *)v45 != v28) {
                        objc_enumerationMutation(v25);
                      }
                      uint64_t v30 = [*(id *)(*((void *)&v44 + 1) + 8 * j) identifier];
                      v31 = (void *)v30;
                      if (v30)
                      {
                        v57[0] = v14;
                        v57[1] = v30;
                        uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
                        [v7 setObject:v16 forKeyedSubscript:v32];
                      }
                    }
                    uint64_t v27 = [v25 countByEnumeratingWithState:&v44 objects:v58 count:16];
                  }
                  while (v27);
                  id v8 = v37;
                  uint64_t v24 = v41;
                }
              }
              else
              {
                v56 = v14;
                v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
                [v7 setObject:v16 forKeyedSubscript:v25];
              }
            }
            uint64_t v11 = v38;
            uint64_t v10 = v39;
            v15 = v42;
            uint64_t v12 = v43;
          }
        }
        ++v12;
      }
      while (v12 != v10);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v52 objects:v60 count:16];
    }
    while (v10);
  }

  id v33 = [(PKExpressPassInformation *)self _initForPaymentPass:v36 configuration:v7];
  return v33;
}

void __57__PKExpressPassInformation_paymentApplicationIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 firstObject];
  if (v3)
  {
    id v4 = v3;
    [*(id *)(a1 + 32) addObject:v3];
    id v3 = v4;
  }
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_passUniqueIdentifier forKey:@"passUniqueIdentifier"];
  [v4 encodeBool:self->_userChoice forKey:@"userChoice"];
  [v4 encodeInteger:self->_cardType forKey:@"cardType"];
  [v4 encodeObject:self->_configuration forKey:@"configuration.1"];
  if (!self->_forceModernEncoding)
  {
    id v5 = self;
    id v6 = v4;
    if (self->_configuration)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v17 = 0;
      uint64_t v18 = &v17;
      uint64_t v19 = 0x3032000000;
      uint64_t v20 = __Block_byref_object_copy__59;
      v21 = __Block_byref_object_dispose__59;
      id v22 = 0;
      configuration = self->_configuration;
      id v11 = (id)MEMORY[0x1E4F143A8];
      uint64_t v12 = 3221225472;
      v13 = __EncodeV1Format_block_invoke;
      uint64_t v14 = &unk_1E56F0438;
      id v9 = v7;
      id v15 = v9;
      id v16 = &v17;
      [(NSDictionary *)configuration enumerateKeysAndObjectsUsingBlock:&v11];
      objc_msgSend(v6, "encodeObject:forKey:", v9, @"configuration", v11, v12, v13, v14);
      [v6 encodeObject:v18[5] forKey:@"subcredentialCredentialIdentifiers"];

      _Block_object_dispose(&v17, 8);
    }

    id v17 = 0;
    id v11 = 0;
    id v10 = v6;
    ExtractV0Format(v5, &v17, &v11);
    [v10 encodeObject:v17 forKey:@"expressMode"];
    [v10 encodeObject:v11 forKey:@"paymentApplicationIdentifier"];
  }
}

+ (BOOL)extractApplicationIdentifier:(id *)a3 subcredentialIdentifier:(id *)a4 fromIdentifiers:(id)a5
{
  id v7 = a5;
  id v8 = v7;
  if (v7 && (uint64_t v9 = [v7 count], (unint64_t)(v9 - 1) <= 1))
  {
    unint64_t v10 = v9;
    if (a3)
    {
      id v11 = [v8 objectAtIndexedSubscript:0];
      id v12 = *a3;
      *a3 = v11;
    }
    if (a4)
    {
      if (v10 < 2)
      {
        v13 = 0;
      }
      else
      {
        v13 = [v8 objectAtIndexedSubscript:1];
      }
      id v15 = *a4;
      *a4 = v13;
    }
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (PKExpressPassInformation)init
{
  return 0;
}

- (PKExpressPassInformation)initWithExpressPassInformation:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKExpressPassInformation;
  id v5 = [(PKExpressPassInformation *)&v14 init];
  id v6 = v5;
  if (!v5) {
    goto LABEL_3;
  }
  v5->_cardType = *((void *)v4 + 4);
  uint64_t v7 = [*((id *)v4 + 5) copy];
  passUniqueIdentifier = v6->_passUniqueIdentifier;
  v6->_passUniqueIdentifier = (NSString *)v7;

  v6->_userChoice = *((unsigned char *)v4 + 24);
  uint64_t v9 = [*((id *)v4 + 1) copy];
  configuration = v6->_configuration;
  v6->_configuration = (NSDictionary *)v9;

  uint64_t v11 = [*((id *)v4 + 2) copy];
  v0_expressMode = v6->_v0_expressMode;
  v6->_v0_expressMode = (NSString *)v11;

  if (*((unsigned char *)v4 + 25))
  {
    __break(1u);
  }
  else
  {
LABEL_3:

    return v6;
  }
  return result;
}

- (id)initDummyExpressInfoForAutomaticSelectionCriteriaUpgradeRequest:(id)a3 paymentPass:(id)a4 withTechologyTest:(id)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v36 = a4;
  id v8 = (unsigned int (**)(id, uint64_t))a5;
  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unint64_t v37 = v7;
  uint64_t v9 = [v7 technologyTypes];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v44;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_super v14 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        uint64_t v15 = PKPassAutomaticSelectionTechnologyTypeFromType(v14);
        if (!v8 || v8[2](v8, v15))
        {
          id v16 = objc_alloc(MEMORY[0x1E4F1CA60]);
          id v17 = objc_msgSend(v16, "initWithObjectsAndKeys:", v14, @"type", MEMORY[0x1E4F1CC38], @"supportsExpress", 0);
          uint64_t v18 = v17;
          if (v15 == 5)
          {
            [v17 setObject:@"2000000000" forKeyedSubscript:@"openLoopExpressMask"];
            uint64_t v19 = [[PKPassAutomaticSelectionCriterion alloc] initWithDictionary:v18];
            if (v19)
            {
              uint64_t v20 = v19;
              [v38 addObject:v19];
            }
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v11);
  }

  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if ([v38 count])
  {
    id v22 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v23 = [v7 paymentApplicationIdentifiers];
    uint64_t v24 = (void *)[v22 initWithArray:v23];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    v25 = [v36 devicePaymentApplications];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
    if (v26)
    {
      uint64_t v27 = v26;
      uint64_t v28 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v27; ++j)
        {
          if (*(void *)v40 != v28) {
            objc_enumerationMutation(v25);
          }
          uint64_t v30 = *(void **)(*((void *)&v39 + 1) + 8 * j);
          v31 = [v30 applicationIdentifier];
          if ([v30 supportsContactlessPayment]
            && [v24 containsObject:v31])
          {
            long long v47 = v31;
            uint64_t v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
            [v21 setObject:v38 forKeyedSubscript:v32];
          }
        }
        uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v48 count:16];
      }
      while (v27);
    }
  }
  id v33 = [(PKExpressPassInformation *)self _initForPaymentPass:v36 configuration:v21];

  return v33;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass) {
    id v6 = v4;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;
  if ((isKindOfClass & 1) == 0 || self->_cardType != *((void *)v4 + 4) || self->_userChoice != v4[24]) {
    goto LABEL_14;
  }
  passUniqueIdentifier = self->_passUniqueIdentifier;
  uint64_t v9 = (NSString *)*((void *)v4 + 5);
  if (!passUniqueIdentifier || !v9)
  {
    if (passUniqueIdentifier == v9) {
      goto LABEL_10;
    }
LABEL_14:
    char v12 = 0;
    goto LABEL_15;
  }
  if ((-[NSString isEqual:](passUniqueIdentifier, "isEqual:") & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  configuration = self->_configuration;
  uint64_t v11 = (NSDictionary *)*((void *)v4 + 1);
  if (configuration && v11) {
    char v12 = -[NSDictionary isEqual:](configuration, "isEqual:");
  }
  else {
    char v12 = configuration == v11;
  }
LABEL_15:

  return v12;
}

- (unint64_t)hash
{
  int64_t v3 = self->_userChoice - self->_cardType + 32 * self->_cardType;
  NSUInteger v4 = [(NSString *)self->_passUniqueIdentifier hash] - v3 + 32 * v3;
  return [(NSDictionary *)self->_configuration hash] - v4 + 32 * v4 + 15699857;
}

- (NSDictionary)subcredentialCredentialIdentifiers
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__59;
  uint64_t v10 = __Block_byref_object_dispose__59;
  id v11 = 0;
  configuration = self->_configuration;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__PKExpressPassInformation_subcredentialCredentialIdentifiers__block_invoke;
  v5[3] = &unk_1E56F0410;
  v5[4] = &v6;
  [(NSDictionary *)configuration enumerateKeysAndObjectsUsingBlock:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __62__PKExpressPassInformation_subcredentialCredentialIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  BOOL v3 = (unint64_t)[v11 count] >= 2;
  NSUInteger v4 = v11;
  if (v3)
  {
    id v5 = [v11 objectAtIndexedSubscript:0];
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) objectForKeyedSubscript:v5];

    if (!v6)
    {
      if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40))
      {
        id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
        uint64_t v9 = *(void **)(v8 + 40);
        *(void *)(v8 + 40) = v7;
      }
      uint64_t v10 = [v11 objectAtIndexedSubscript:1];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) setObject:v10 forKeyedSubscript:v5];
    }
    NSUInteger v4 = v11;
  }
}

- (id)criteriaForApplication:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v21 = [v4 applicationIdentifier];
    if (v21)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      id v7 = [v5 subcredentials];
      if ([v7 count])
      {
        long long v24 = 0u;
        long long v25 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        uint64_t v8 = [v5 subcredentials];
        uint64_t v9 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v20 = v7;
          uint64_t v11 = *(void *)v23;
          do
          {
            for (uint64_t i = 0; i != v10; ++i)
            {
              if (*(void *)v23 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v22 + 1) + 8 * i) identifier];
              objc_super v14 = (void *)v13;
              if (v13)
              {
                v27[0] = v21;
                v27[1] = v13;
                uint64_t v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
                id v16 = [(NSDictionary *)self->_configuration objectForKeyedSubscript:v15];
                [v6 unionSet:v16];
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v22 objects:v28 count:16];
          }
          while (v10);
          id v7 = v20;
        }
      }
      else
      {
        uint64_t v26 = v21;
        uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
        uint64_t v18 = [(NSDictionary *)self->_configuration objectForKeyedSubscript:v8];
        [v6 unionSet:v18];
      }
      if ([v6 count]) {
        id v17 = (void *)[v6 copy];
      }
      else {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = 0;
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)criteriaForPaymentApplicationIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__59;
    id v16 = __Block_byref_object_dispose__59;
    id v17 = 0;
    configuration = self->_configuration;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__PKExpressPassInformation_criteriaForPaymentApplicationIdentifier___block_invoke;
    v9[3] = &unk_1E56F0438;
    id v10 = v4;
    uint64_t v11 = &v12;
    [(NSDictionary *)configuration enumerateKeysAndObjectsUsingBlock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __68__PKExpressPassInformation_criteriaForPaymentApplicationIdentifier___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a3;
  uint64_t v8 = [a2 firstObject];
  uint64_t v9 = *(void **)(a1 + 32);
  id v10 = v8;
  id v11 = v9;
  if (v10 == v11)
  {

    goto LABEL_7;
  }
  uint64_t v12 = v11;
  if (!v10 || !v11)
  {

    goto LABEL_9;
  }
  int v13 = [v10 isEqualToString:v11];

  if (v13)
  {
LABEL_7:
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    *a4 = 1;
  }
LABEL_9:
}

- (void)enumerateCriteriaWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    configuration = self->_configuration;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57__PKExpressPassInformation_enumerateCriteriaWithHandler___block_invoke;
    v7[3] = &unk_1E56F0460;
    id v8 = v4;
    [(NSDictionary *)configuration enumerateKeysAndObjectsUsingBlock:v7];
  }
}

void __57__PKExpressPassInformation_enumerateCriteriaWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a3;
  id v5 = [a2 firstObject];
  if (v5) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)enumerateCredentialsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    configuration = self->_configuration;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __60__PKExpressPassInformation_enumerateCredentialsWithHandler___block_invoke;
    v7[3] = &unk_1E56F0460;
    id v8 = v4;
    [(NSDictionary *)configuration enumerateKeysAndObjectsUsingBlock:v7];
  }
}

uint64_t __60__PKExpressPassInformation_enumerateCredentialsWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  if (self->_userChoice) {
    id v4 = @"YES";
  }
  else {
    id v4 = @"NO";
  }
  id v5 = objc_msgSend(v3, "initWithFormat:", @"<PKExpressPassInformation: %p; Pass %@; Card Type %ld; User Choice: %@; Configuration: ",
                 self,
                 self->_passUniqueIdentifier,
                 self->_cardType,
                 v4);
  configuration = self->_configuration;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__PKExpressPassInformation_description__block_invoke;
  v9[3] = &unk_1E56D8F28;
  id v7 = v5;
  id v10 = v7;
  [(NSDictionary *)configuration enumerateKeysAndObjectsUsingBlock:v9];
  [v7 appendString:@" >"];

  return v7;
}

uint64_t __39__PKExpressPassInformation_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) appendFormat:@"(%@) -> %@", a2, a3];
}

- (id)initForExpressMode:(id)a3 withPassUniqueIdentifier:(id)a4 paymentApplicationIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (PKExpressPassTypeForExpressMode(v8))
  {
    v20.receiver = self;
    v20.super_class = (Class)PKExpressPassInformation;
    id v11 = [(PKExpressPassInformation *)&v20 init];
    if (v11)
    {
      uint64_t v12 = [v8 copy];
      int v13 = (void *)*((void *)v11 + 2);
      *((void *)v11 + 2) = v12;

      uint64_t v14 = [v9 copy];
      uint64_t v15 = (void *)*((void *)v11 + 5);
      *((void *)v11 + 5) = v14;

      *((void *)v11 + 4) = 0;
      uint64_t v16 = ConfigurationFromV0((uint64_t)v8, *((void *)v11 + 5), v10);
      id v17 = (void *)*((void *)v11 + 1);
      *((void *)v11 + 1) = v16;
    }
    self = (PKExpressPassInformation *)v11;
    uint64_t v18 = self;
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)paymentApplicationIdentifier
{
  id v4 = 0;
  ExtractV0Format(self, 0, &v4);
  id v2 = v4;

  return v2;
}

- (id)expressMode
{
  id v4 = 0;
  ExtractV0Format(self, &v4, 0);
  id v2 = v4;

  return v2;
}

- (int64_t)cardType
{
  return self->_cardType;
}

- (BOOL)isUserChoice
{
  return self->_userChoice;
}

- (BOOL)forceModernEncoding
{
  return self->_forceModernEncoding;
}

- (void)setForceModernEncoding:(BOOL)a3
{
  self->_forceModernEncoding = a3;
}

@end