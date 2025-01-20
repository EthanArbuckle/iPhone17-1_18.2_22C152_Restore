@interface PKPaymentSetupFieldsModel
+ (id)defaultPaymentSetupProvisioningFields;
+ (id)fakePaymentSetupProvisioningFields;
- (BOOL)hasFooterPaymentSetupField;
- (BOOL)hasIncompletePaymentSetupFields;
- (BOOL)requirementsMetForFieldWithIdentifier:(id)a3;
- (BOOL)requirementsMetForVisibleFields;
- (PKPaymentSetupFieldsModel)init;
- (PKPaymentSetupFieldsModel)initWithPaymentSetupFields:(id)a3;
- (PKPaymentSetupFieldsModel)initWithPaymentSetupFields:(id)a3 footerFields:(id)a4;
- (id)footerFieldForIdentifier:(id)a3;
- (id)footerPaymentSetupField;
- (id)incompletePaymentSetupFields;
- (id)odiAttributes;
- (id)paymentSetupFieldAtIndex:(unint64_t)a3;
- (id)paymentSetupFieldIdentifiers;
- (id)paymentSetupFieldWithIdentifier:(id)a3;
- (id)paymentSetupFields;
- (id)readonlySetupFieldIdentifiers;
- (id)secondaryEntryFieldsModelWithPaymentSetupFields:(id)a3;
- (id)secureSubmissionValuesForDestination:(id)a3;
- (id)setupFieldAnalytics;
- (id)submissionValuesForDestination:(id)a3;
- (id)visiblePaymentSetupFields;
- (id)visibleSetupFieldIdentifiers;
- (unint64_t)numberOfPaymentSetupFields;
- (void)_addField:(id)a3 result:(id)a4 destination:(id)a5 requiresSecureSubmission:(BOOL)a6;
- (void)lockFields;
- (void)prefillDefaultValues;
- (void)prefillDefaultValuesWithPostalAddress:(id)a3;
- (void)prefillValuesWithPaymentCredential:(id)a3;
- (void)replaceAllPaymentSetupFields:(id)a3;
- (void)replaceAllPaymentSetupFields:(id)a3 footerFields:(id)a4;
- (void)replaceAllPaymentSetupFieldsPreservingCurrentValues:(id)a3;
- (void)resetAllPaymentSetupFieldValues;
- (void)unhideFieldsWithEnteredValues;
- (void)updateWithPaymentSetupFields:(id)a3;
- (void)updateWithPaymentSetupFields:(id)a3 footerFields:(id)a4;
@end

@implementation PKPaymentSetupFieldsModel

- (PKPaymentSetupFieldsModel)init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPaymentSetupFieldsModel;
  v2 = [(PKPaymentSetupFieldsModel *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    paymentSetupFields = v2->_paymentSetupFields;
    v2->_paymentSetupFields = v3;

    v5 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    footerFields = v2->_footerFields;
    v2->_footerFields = v5;
  }
  return v2;
}

- (PKPaymentSetupFieldsModel)initWithPaymentSetupFields:(id)a3
{
  return [(PKPaymentSetupFieldsModel *)self initWithPaymentSetupFields:a3 footerFields:0];
}

- (PKPaymentSetupFieldsModel)initWithPaymentSetupFields:(id)a3 footerFields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = [(PKPaymentSetupFieldsModel *)self init];
  v9 = v8;
  if (v8) {
    [(PKPaymentSetupFieldsModel *)v8 replaceAllPaymentSetupFields:v6 footerFields:v7];
  }

  return v9;
}

+ (id)defaultPaymentSetupProvisioningFields
{
  if (PKShowFakePaymentSetupFields())
  {
    v3 = [a1 fakePaymentSetupProvisioningFields];
  }
  else
  {
    v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"cardholderName"];
    [v4 addObject:v5];

    id v6 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"primaryAccountNumber"];
    [v4 addObject:v6];

    v3 = [MEMORY[0x1E4F1C978] arrayWithArray:v4];
  }
  return v3;
}

+ (id)fakePaymentSetupProvisioningFields
{
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"cardholderName"];
  [v2 addObject:v3];

  v4 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"primaryAccountNumber"];
  [v2 addObject:v4];

  v5 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"cardExpiration"];
  [v2 addObject:v5];

  id v6 = +[PKPaymentSetupField paymentSetupFieldWithIdentifier:@"cardSecurityCode"];
  [v2 addObject:v6];

  id v7 = +[PKPaymentSetupField sampleCustomPaymentSetupFields];
  [v2 addObjectsFromArray:v7];

  objc_super v8 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];

  return v8;
}

- (void)replaceAllPaymentSetupFields:(id)a3
{
}

- (void)replaceAllPaymentSetupFields:(id)a3 footerFields:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_footerFields, a4);
  [(PKPaymentSetupFieldsModel *)self resetAllPaymentSetupFieldValues];
  [(NSMutableArray *)self->_paymentSetupFields removeAllObjects];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isFieldTypeFooter", (void)v16))
        {
          v14 = [v13 footerFieldObject];
          footerField = self->_footerField;
          self->_footerField = v14;
        }
        else
        {
          [(NSMutableArray *)self->_paymentSetupFields addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  [(PKPaymentSetupFieldsModel *)self prefillDefaultValues];
}

- (void)replaceAllPaymentSetupFieldsPreservingCurrentValues:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v10 = [v9 identifier];
        uint64_t v11 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:v10];

        if (v11)
        {
          uint64_t v12 = [v9 fieldType];
          if (v12 == [v11 fieldType])
          {
            v13 = [v11 currentValue];

            if (v13)
            {
              v14 = [v11 currentValue];
              [v9 setCurrentValue:v14];

              objc_msgSend(v9, "setSource:", objc_msgSend(v11, "source"));
              v15 = [v11 originalCameraCaptureValue];
              [v9 setOriginalCameraCaptureValue:v15];

              if ([v9 isFieldTypeText])
              {
                long long v16 = [v11 displayFormat];
                uint64_t v17 = [v16 length];

                if (v17)
                {
                  long long v18 = [v9 textFieldObject];
                  long long v19 = [v11 displayFormat];
                  [v18 updateDisplayFormat:v19];
                }
              }
            }
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v6);
  }
  [(PKPaymentSetupFieldsModel *)self replaceAllPaymentSetupFields:v4];
}

- (void)updateWithPaymentSetupFields:(id)a3
{
}

- (void)updateWithPaymentSetupFields:(id)a3 footerFields:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  objc_storeStrong((id *)&self->_footerFields, a4);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v14 = objc_msgSend(v13, "identifier", (void)v19);
        v15 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:v14];

        if (v15)
        {
          long long v16 = [v13 rawConfigurationDictionary];
          [v15 updateWithConfiguration:v16];
        }
        else if ([v13 isFieldTypeFooter])
        {
          uint64_t v17 = [v13 footerFieldObject];
          footerField = self->_footerField;
          self->_footerField = v17;
        }
        else
        {
          [(NSMutableArray *)self->_paymentSetupFields addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v10);
  }

  [(PKPaymentSetupFieldsModel *)self prefillDefaultValues];
}

- (id)secondaryEntryFieldsModelWithPaymentSetupFields:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  obuint64_t j = v4;
  uint64_t v7 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v12 = [v11 identifier];
        v13 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:v12];
        v14 = (void *)[v13 copy];

        if (v14)
        {
          v15 = [v11 rawConfigurationDictionary];
          [v14 updateWithConfiguration:v15];

          objc_msgSend(v14, "setHidden:", objc_msgSend(v14, "isHidden") ^ 1);
          long long v16 = v5;
          uint64_t v17 = v14;
        }
        else
        {
          long long v16 = v5;
          uint64_t v17 = v11;
        }
        [v16 addObject:v17];
        [v6 addObject:v12];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v8);
  }

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v18 = [(PKPaymentSetupFieldsModel *)self paymentSetupFields];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v31;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v31 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v30 + 1) + 8 * j);
        uint64_t v24 = [v23 identifier];
        char v25 = [v6 containsObject:v24];

        if ((v25 & 1) == 0)
        {
          v26 = (void *)[v23 copy];
          [v26 setHidden:1];
          [v5 addObject:v26];
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v20);
  }

  v27 = [[PKPaymentSetupFieldsModel alloc] initWithPaymentSetupFields:v5];
  [(PKPaymentSetupFieldsModel *)v27 prefillDefaultValues];

  return v27;
}

- (void)unhideFieldsWithEnteredValues
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_paymentSetupFields;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (objc_msgSend(v7, "isHidden", (void)v9))
        {
          uint64_t v8 = [v7 currentValue];

          if (v8) {
            [v7 setHidden:0];
          }
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
}

- (void)lockFields
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_paymentSetupFields;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setReadonly:", 1, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (id)paymentSetupFields
{
  return (id)[MEMORY[0x1E4F1C978] arrayWithArray:self->_paymentSetupFields];
}

- (id)visiblePaymentSetupFields
{
  return (id)[(NSMutableArray *)self->_paymentSetupFields pk_objectsPassingTest:&__block_literal_global_43];
}

uint64_t __54__PKPaymentSetupFieldsModel_visiblePaymentSetupFields__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 isHidden] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)paymentSetupFieldIdentifiers
{
  return (id)[(NSMutableArray *)self->_paymentSetupFields valueForKey:@"identifier"];
}

- (id)visibleSetupFieldIdentifiers
{
  return (id)[(NSMutableArray *)self->_paymentSetupFields pk_arrayBySafelyApplyingBlock:&__block_literal_global_21_0];
}

id __57__PKPaymentSetupFieldsModel_visibleSetupFieldIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    if ([v3 isHidden])
    {
      uint64_t v4 = 0;
    }
    else
    {
      uint64_t v4 = [v3 identifier];
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)readonlySetupFieldIdentifiers
{
  return (id)[(NSMutableArray *)self->_paymentSetupFields pk_arrayBySafelyApplyingBlock:&__block_literal_global_24];
}

id __58__PKPaymentSetupFieldsModel_readonlySetupFieldIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    if ([v3 isReadonly])
    {
      uint64_t v4 = [v3 identifier];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

- (id)paymentSetupFieldAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paymentSetupFields objectAtIndex:a3];
}

- (unint64_t)numberOfPaymentSetupFields
{
  return [(NSMutableArray *)self->_paymentSetupFields count];
}

- (id)paymentSetupFieldWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v5 = self->_paymentSetupFields;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v19 != v8) {
        objc_enumerationMutation(v5);
      }
      long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
      long long v11 = objc_msgSend(v10, "identifier", (void)v18);
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v13 = v10;

    if (v13) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_9:
  }
  footerField = self->_footerField;
  if (footerField
    && ([(PKPaymentSetupField *)footerField identifier],
        v15 = objc_claimAutoreleasedReturnValue(),
        int v16 = [v15 isEqualToString:v4],
        v15,
        v16))
  {
    v13 = self->_footerField;
  }
  else
  {
    v13 = 0;
  }
LABEL_15:

  return v13;
}

- (id)incompletePaymentSetupFields
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = self->_paymentSetupFields;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "submissionStringMeetsAllRequirements", (void)v12) & 1) == 0) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  long long v10 = [MEMORY[0x1E4F1C978] arrayWithArray:v3];

  return v10;
}

- (BOOL)hasIncompletePaymentSetupFields
{
  id v2 = [(PKPaymentSetupFieldsModel *)self incompletePaymentSetupFields];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)submissionValuesForDestination:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v6 = self->_paymentSetupFields;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v7) {
    goto LABEL_18;
  }
  uint64_t v8 = v7;
  int v18 = 0;
  int v9 = 0;
  int v10 = 0;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v6);
      }
      long long v13 = *(void **)(*((void *)&v19 + 1) + 8 * i);
      [(PKPaymentSetupFieldsModel *)self _addField:v13 result:v5 destination:v4 requiresSecureSubmission:0];
      if ([v13 supportsAddressAutofill])
      {
        uint64_t v14 = [v13 source];
        switch(v14)
        {
          case 4:
            int v9 = 1;
            break;
          case 3:
            int v18 = 1;
            break;
          case 2:
            int v10 = 1;
            break;
        }
      }
    }
    uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v8);

  if ((v18 | v10 & v9))
  {
    uint64_t v15 = 3;
LABEL_17:
    PKPaymentSetupFieldSourceToString(v15);
    uint64_t v6 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    [v5 setObject:v6 forKey:@"addressSource"];
LABEL_18:

    goto LABEL_19;
  }
  if (v10 & 1 | (((v10 ^ 1 | v9) & 1) == 0))
  {
    if (((v10 ^ 1 | v9) & 1) == 0)
    {
      uint64_t v15 = 2;
      goto LABEL_17;
    }
  }
  else if (v9)
  {
    uint64_t v15 = 4;
    goto LABEL_17;
  }
LABEL_19:
  int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];

  return v16;
}

- (id)footerFieldForIdentifier:(id)a3
{
  return [(NSDictionary *)self->_footerFields objectForKey:a3];
}

- (id)footerPaymentSetupField
{
  return self->_footerField;
}

- (BOOL)hasFooterPaymentSetupField
{
  id v2 = [(PKPaymentSetupFieldsModel *)self footerPaymentSetupField];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)secureSubmissionValuesForDestination:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_paymentSetupFields;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PKPaymentSetupFieldsModel _addField:result:destination:requiresSecureSubmission:](self, "_addField:result:destination:requiresSecureSubmission:", *(void *)(*((void *)&v13 + 1) + 8 * i), v5, v4, 1, (void)v13);
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v5];

  return v11;
}

- (void)_addField:(id)a3 result:(id)a4 destination:(id)a5 requiresSecureSubmission:(BOOL)a6
{
  BOOL v6 = a6;
  id v30 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [v30 requiresSecureSubmission];
  int v12 = [v30 submissionStringMeetsAllRequirements];
  long long v13 = v30;
  if (v12)
  {
    long long v14 = [v30 submissionDestination];
    int v15 = [v14 isEqualToString:v10];

    long long v13 = v30;
    if (v15)
    {
      if (((v11 ^ v6) & 1) == 0)
      {
        long long v16 = [v30 submissionKey];
        uint64_t v17 = [v30 submissionString];
        uint64_t v18 = (void *)v17;
        if (v16 && v17) {
          [v9 setObject:v17 forKey:v16];
        }

        long long v13 = v30;
      }
    }
  }
  long long v19 = [v13 pickerFieldObject];
  if ([v19 pickerType] == 2)
  {
    long long v20 = [v19 currentValue];
    long long v21 = [v20 nextLevelPicker];

    if (v21)
    {
      do
      {
        int v22 = [v21 requiresSecureSubmission];
        if ([v21 submissionStringMeetsAllRequirements])
        {
          uint64_t v23 = [v21 submissionDestination];
          int v24 = [v23 isEqualToString:v10];

          if (v24)
          {
            if (((v22 ^ v6) & 1) == 0)
            {
              char v25 = [v21 submissionKey];
              uint64_t v26 = [v21 submissionString];
              v27 = (void *)v26;
              if (v25 && v26) {
                [v9 setObject:v26 forKey:v25];
              }
            }
          }
        }
        v28 = [v21 currentValue];
        uint64_t v29 = [v28 nextLevelPicker];

        long long v21 = (void *)v29;
      }
      while (v29);
    }
  }
}

- (void)resetAllPaymentSetupFieldValues
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = self->_paymentSetupFields;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        objc_msgSend(v7, "setCurrentValue:", 0, (void)v8);
        [v7 setSource:0];
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)prefillDefaultValues
{
  uint64_t v349 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSMutableArray *)self->_paymentSetupFields count];
  if (!v3) {
    return;
  }
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v3];
  long long v339 = 0u;
  long long v340 = 0u;
  long long v341 = 0u;
  long long v342 = 0u;
  uint64_t v5 = self->_paymentSetupFields;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v339 objects:v348 count:16];
  if (!v6) {
    goto LABEL_338;
  }
  uint64_t v7 = v6;
  BOOL v8 = 0;
  uint64_t v9 = *(void *)v340;
  do
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v340 != v9) {
        objc_enumerationMutation(v5);
      }
      long long v11 = *(void **)(*((void *)&v339 + 1) + 8 * i);
      if (([v11 isFieldTypeFooter] & 1) == 0)
      {
        int v12 = [v11 identifier];
        [v4 setObject:v11 forKey:v12];

        if (v8)
        {
          BOOL v8 = 1;
          continue;
        }
        if ([v11 isFieldTypeDate])
        {
          uint64_t v13 = [v11 dateFieldObject];
          long long v14 = [v13 defaultDate];
          goto LABEL_14;
        }
        if ([v11 isFieldTypePicker])
        {
          uint64_t v13 = [v11 pickerFieldObject];
          long long v14 = [v13 defaultPickerItem];
LABEL_14:
          int v15 = v14;
        }
        else
        {
          uint64_t v13 = [v11 defaultValue];
          int v15 = v13;
        }

        BOOL v8 = v15 == 0;
        continue;
      }
    }
    uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v339 objects:v348 count:16];
  }
  while (v7);

  if (!v8) {
    goto LABEL_339;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA20] currentLocale];
  long long v16 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  uint64_t v17 = *MEMORY[0x1E4F1ADF0];
  v347[0] = v16;
  v347[1] = v17;
  uint64_t v18 = *MEMORY[0x1E4F1AF10];
  v347[2] = *MEMORY[0x1E4F1ADE0];
  v347[3] = v18;
  uint64_t v19 = *MEMORY[0x1E4F1AD90];
  v347[4] = *MEMORY[0x1E4F1AEE0];
  v347[5] = v19;
  v347[6] = *MEMORY[0x1E4F1ADC8];
  long long v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v347 count:7];
  v285 = PKMeContactWithKeysToFetch(v20);

  long long v21 = [v4 objectForKey:@"firstName"];
  v282 = [v4 objectForKey:@"lastName"];
  v286 = [v4 objectForKey:@"email"];
  v276 = v21;
  int v22 = [v21 defaultValue];
  if (v22) {
    goto LABEL_21;
  }
  uint64_t v23 = [v282 defaultValue];

  if (!v23)
  {
    if (v21 && [v21 populateFromMeCard])
    {
      v78 = [v285 givenName];
      v79 = [v78 stringByApplyingTransform:*MEMORY[0x1E4F1C4D8] reverse:0];

      [v21 setDefaultValue:v79];
      v80 = [v21 currentValue];

      if (!v80) {
        [v21 setCurrentValue:v79];
      }
    }
    if (v282 && [v282 populateFromMeCard])
    {
      v81 = [v285 familyName];
      int v22 = [v81 stringByApplyingTransform:*MEMORY[0x1E4F1C4D8] reverse:0];

      [v282 setDefaultValue:v22];
      v82 = [v282 currentValue];

      if (!v82) {
        [v282 setCurrentValue:v22];
      }
LABEL_21:
    }
  }
  v308 = v4;
  if (v286)
  {
    int v24 = [v286 defaultValue];
    if (v24) {
      goto LABEL_156;
    }
    if ([v286 populateFromMeCard])
    {
      [v285 emailAddresses];
      long long v335 = 0u;
      long long v336 = 0u;
      long long v337 = 0u;
      long long v338 = 0u;
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      id v302 = v25;
      uint64_t v317 = [v25 countByEnumeratingWithState:&v335 objects:v346 count:16];
      if (!v317)
      {
        id v280 = 0;
        id v295 = 0;
        id v289 = 0;
        id v306 = 0;
        id v26 = 0;
        goto LABEL_135;
      }
      id v280 = 0;
      id v295 = 0;
      id v289 = 0;
      id v306 = 0;
      id v26 = 0;
      uint64_t v314 = *(void *)v336;
      v27 = (void *)*MEMORY[0x1E4F1B6F0];
      v28 = (void *)*MEMORY[0x1E4F1B6F8];
      v300 = (void *)*MEMORY[0x1E4F1B700];
      v283 = (void *)*MEMORY[0x1E4F1B760];
      v311 = v5;
      v312 = (void *)*MEMORY[0x1E4F1B6F0];
      v293 = (void *)*MEMORY[0x1E4F1B770];
      while (1)
      {
        uint64_t v29 = 0;
        do
        {
          id v30 = v28;
          if (*(void *)v336 != v314) {
            objc_enumerationMutation(v25);
          }
          long long v31 = *(void **)(*((void *)&v335 + 1) + 8 * v29);
          long long v32 = [v31 label];
          long long v33 = [v31 value];
          id v34 = v32;
          id v35 = v27;
          long long v36 = v35;
          if (v34 == v35)
          {

            v28 = v30;
LABEL_42:
            if ([v26 length])
            {
              uint64_t v5 = v311;
              v27 = v312;
              goto LABEL_98;
            }
            v46 = v26;
            id v26 = v33;
            v27 = v312;
LABEL_90:
            uint64_t v5 = v311;

            goto LABEL_98;
          }
          if (v27) {
            BOOL v37 = v34 == 0;
          }
          else {
            BOOL v37 = 1;
          }
          char v38 = !v37;
          v28 = v30;
          if (v37)
          {
          }
          else
          {
            int v39 = [v34 isEqualToString:v35];

            if (v39) {
              goto LABEL_42;
            }
          }
          obuint64_t j = v26;
          id v40 = v34;
          id v41 = v30;
          v42 = v41;
          if (v40 == v41)
          {

LABEL_57:
            v46 = v306;
            if (![v306 length])
            {
              id v306 = v33;
              goto LABEL_88;
            }
            goto LABEL_95;
          }
          if (v30) {
            BOOL v43 = v34 == 0;
          }
          else {
            BOOL v43 = 1;
          }
          char v44 = !v43;
          char v304 = v44;
          if (v43)
          {
          }
          else
          {
            int v45 = [v40 isEqualToString:v41];

            if (v45) {
              goto LABEL_57;
            }
          }
          id v47 = v40;
          id v48 = v300;
          v49 = v48;
          if (v47 == v48)
          {

LABEL_71:
            v46 = v295;
            if (![v295 length])
            {
              id v295 = v33;
              goto LABEL_87;
            }
            goto LABEL_94;
          }
          if (v300) {
            BOOL v50 = v34 == 0;
          }
          else {
            BOOL v50 = 1;
          }
          char v51 = !v50;
          char v297 = v51;
          if (v50)
          {
          }
          else
          {
            int v52 = [v47 isEqualToString:v48];

            if (v52) {
              goto LABEL_71;
            }
          }
          id v53 = v47;
          id v54 = v293;
          v55 = v54;
          if (v53 == v54)
          {

LABEL_85:
            v46 = v289;
            if (![v289 length])
            {
              id v289 = v33;
LABEL_87:
              id v25 = v302;
LABEL_88:
              id v26 = obj;
              v27 = v312;
LABEL_89:
              v28 = v30;
              goto LABEL_90;
            }
LABEL_94:
            id v25 = v302;
LABEL_95:
            id v26 = obj;
            v27 = v312;
LABEL_96:
            v28 = v30;
            goto LABEL_97;
          }
          if (v293) {
            BOOL v56 = v34 == 0;
          }
          else {
            BOOL v56 = 1;
          }
          char v57 = !v56;
          char v291 = v57;
          if (v56)
          {
          }
          else
          {
            int v287 = [v53 isEqualToString:v54];

            if (v287) {
              goto LABEL_85;
            }
          }
          id v58 = v53;
          id v59 = v36;
          v60 = v59;
          if (v38)
          {
            char v61 = [v58 isEqualToString:v59];

            if (v61) {
              goto LABEL_94;
            }
          }
          else
          {
          }
          id v62 = v58;
          id v63 = v42;
          v64 = v63;
          v27 = v312;
          if (v304)
          {
            char v65 = [v62 isEqualToString:v63];

            if (v65)
            {
              id v25 = v302;
              id v26 = obj;
              goto LABEL_96;
            }
          }
          else
          {
          }
          id v66 = v62;
          id v67 = v49;
          v68 = v67;
          if (v297)
          {
            char v69 = [v66 isEqualToString:v67];

            id v26 = obj;
            if (v69) {
              goto LABEL_117;
            }
          }
          else
          {

            id v26 = obj;
          }
          id v70 = v66;
          id v71 = v55;
          v72 = v71;
          if (v291)
          {
            char v73 = [v70 isEqualToString:v71];

            if (v73) {
              goto LABEL_117;
            }
          }
          else
          {
          }
          id v74 = v70;
          id v75 = v283;
          v46 = v75;
          if (v74 == v75)
          {

            id v25 = v302;
            goto LABEL_89;
          }
          if (v283 && v34)
          {
            char v76 = [v74 isEqualToString:v75];

            if (v76)
            {
LABEL_117:
              id v25 = v302;
              goto LABEL_96;
            }
          }
          else
          {
          }
          v46 = v280;
          v28 = v30;
          if (![v280 length])
          {
            id v280 = v33;
            id v25 = v302;
            goto LABEL_90;
          }
          id v25 = v302;
LABEL_97:
          uint64_t v5 = v311;
LABEL_98:

          ++v29;
        }
        while (v317 != v29);
        uint64_t v77 = [v25 countByEnumeratingWithState:&v335 objects:v346 count:16];
        uint64_t v317 = v77;
        if (!v77)
        {
LABEL_135:

          if (![v26 length])
          {
            uint64_t v4 = v308;
            v85 = v289;
            if ([v306 length])
            {
              id v83 = v306;
              v84 = PKLogFacilityTypeGetObject(6uLL);
              v86 = v295;
              if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_152;
              }
              *(_WORD *)buf = 0;
              v87 = "Using me card home email prefill";
            }
            else
            {
              v86 = v295;
              if ([v295 length])
              {
                id v83 = v295;
                v84 = PKLogFacilityTypeGetObject(6uLL);
                if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_152;
                }
                *(_WORD *)buf = 0;
                v87 = "Using me card other email prefill";
              }
              else if ([v280 length])
              {
                id v83 = v280;
                v84 = PKLogFacilityTypeGetObject(6uLL);
                if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_152;
                }
                *(_WORD *)buf = 0;
                v87 = "Using me card other custom prefill";
              }
              else
              {
                if (![v289 length])
                {
                  id v83 = 0;
                  goto LABEL_153;
                }
                id v83 = v289;
                v84 = PKLogFacilityTypeGetObject(6uLL);
                if (!os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_152;
                }
                *(_WORD *)buf = 0;
                v87 = "Using me card other work prefill";
              }
            }
            _os_log_impl(&dword_190E10000, v84, OS_LOG_TYPE_DEFAULT, v87, buf, 2u);
            goto LABEL_152;
          }
          id v83 = v26;
          v84 = PKLogFacilityTypeGetObject(6uLL);
          uint64_t v4 = v308;
          v85 = v289;
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v84, OS_LOG_TYPE_DEFAULT, "Using me card iCloud email prefill", buf, 2u);
          }
          v86 = v295;
LABEL_152:

LABEL_153:
          [v286 setDefaultValue:v83];
          v88 = [v286 currentValue];

          if (!v88) {
            [v286 setCurrentValue:v83];
          }

          int v24 = v302;
LABEL_156:

          break;
        }
      }
    }
  }
  v89 = [v4 objectForKey:@"cardholderName"];
  v90 = v89;
  if (v89)
  {
    v91 = [v89 defaultValue];
    if (v91) {
      goto LABEL_164;
    }
    if ([v90 populateFromMeCard])
    {
      v91 = [MEMORY[0x1E4F1B910] stringFromContact:v285 style:0];
      v92 = PKCurrentRegion();
      int v93 = [v92 isEqual:@"JP"];

      if (v93 && ([v91 canBeConvertedToEncoding:5] & 1) == 0)
      {

        v91 = 0;
      }
      [v90 setDefaultValue:v91];
LABEL_164:
    }
  }
  v281 = PKHomeAddressFromContact(v285);
  v94 = [v4 objectForKey:@"street1"];
  v95 = [v4 objectForKey:@"street2"];
  v96 = [v4 objectForKey:@"addressLine1"];
  v294 = [v4 objectForKey:@"addressLine2"];
  v296 = [v4 objectForKey:@"city"];
  v292 = [v4 objectForKey:@"postalCode"];
  v290 = [v4 objectForKey:@"subLocality"];
  v298 = [v4 objectForKey:@"administrativeArea"];
  v299 = [v4 objectForKey:@"state"];
  v279 = [v4 objectForKey:@"countryCode"];
  v97 = [v94 defaultValue];
  v278 = v94;
  if (v97) {
    int v98 = 0;
  }
  else {
    int v98 = [v94 populateFromMeCard];
  }

  v99 = [v95 defaultValue];
  if (v99) {
    int v100 = 0;
  }
  else {
    int v100 = [v95 populateFromMeCard];
  }

  uint64_t v101 = [v96 defaultValue];
  v102 = v96;
  v103 = (void *)v101;
  v288 = v102;
  if (v101) {
    int v104 = 0;
  }
  else {
    int v104 = [v102 populateFromMeCard];
  }
  v277 = v95;

  v105 = [v294 defaultValue];
  if (v105) {
    int v106 = 0;
  }
  else {
    int v106 = [v294 populateFromMeCard];
  }
  v274 = v90;

  if (v98 & v100) {
    int v107 = 1;
  }
  else {
    int v107 = v104 & v106;
  }
  v108 = [v296 defaultValue];
  if (v108) {
    int v109 = 0;
  }
  else {
    int v109 = [v296 populateFromMeCard];
  }

  v110 = [v292 defaultValue];
  if (v110) {
    int v111 = 0;
  }
  else {
    int v111 = [v292 populateFromMeCard];
  }

  v112 = [v290 defaultValue];
  if (v112) {
    int v113 = 0;
  }
  else {
    int v113 = [v290 populateFromMeCard];
  }

  v114 = [v298 defaultValue];
  if (v114) {
    int v115 = 0;
  }
  else {
    int v115 = [v298 populateFromMeCard];
  }

  v116 = [v299 defaultValue];
  if (v116)
  {
LABEL_193:

    v117 = v288;
  }
  else
  {
    int v137 = [v299 populateFromMeCard];
    int v138 = v107 & v109 & v111;
    v117 = v288;
    if (v138 == 1 && v137)
    {
      v139 = (uint64_t *)MEMORY[0x1E4F1C4D8];
      if (v278 || v277 || v288 || v294)
      {
        v140 = [v281 street];
        v141 = [v140 componentsSeparatedByString:@"\n"];

        v142 = [v141 firstObject];
        v143 = v139;
        v144 = v142;
        uint64_t v145 = *v143;
        v146 = [v142 stringByApplyingTransform:*v143 reverse:0];

        [v278 setDefaultValue:v146];
        v147 = [v278 currentValue];

        if (!v147) {
          [v278 setCurrentValue:v146];
        }
        [v288 setDefaultValue:v146];
        v148 = [v288 currentValue];

        if (!v148) {
          [v288 setCurrentValue:v146];
        }
        if ((unint64_t)[v141 count] >= 2)
        {
          v149 = [v141 objectAtIndex:1];
          v150 = [v149 stringByApplyingTransform:v145 reverse:0];

          [v277 setDefaultValue:v150];
          v151 = [v277 currentValue];

          if (!v151) {
            [v277 setCurrentValue:v150];
          }
          [v294 setDefaultValue:v150];
          v152 = [v294 currentValue];

          if (!v152) {
            [v294 setCurrentValue:v150];
          }
        }
        v117 = v288;
        v139 = (uint64_t *)MEMORY[0x1E4F1C4D8];
      }
      if (v292)
      {
        v153 = [v281 postalCode];
        [v292 setDefaultValue:v153];
        v154 = [v292 currentValue];

        if (!v154) {
          [v292 setCurrentValue:v153];
        }

        v117 = v288;
      }
      if (v290) {
        int v155 = v113;
      }
      else {
        int v155 = 0;
      }
      if (v155 == 1)
      {
        v156 = [v281 subLocality];
        v157 = [v156 stringByApplyingTransform:*v139 reverse:0];

        [v290 setDefaultValue:v157];
        v158 = [v290 currentValue];

        if (!v158) {
          [v290 setDefaultValue:v157];
        }
      }
      if (v298) {
        int v159 = v115;
      }
      else {
        int v159 = 0;
      }
      if (v159 == 1)
      {
        v160 = [v281 subAdministrativeArea];
        v161 = [v160 stringByApplyingTransform:*v139 reverse:0];

        [v298 setDefaultValue:v161];
        v162 = [v298 currentValue];

        if (!v162) {
          [v298 setCurrentValue:v161];
        }
      }
      if (v299)
      {
        v163 = [v281 state];
        v164 = [v163 stringByApplyingTransform:*v139 reverse:0];

        if (v164)
        {
          if ([v299 isFieldTypePicker])
          {
            id v165 = v299;
            v166 = [v165 pickerItems];
            v332[0] = MEMORY[0x1E4F143A8];
            v332[1] = 3221225472;
            v332[2] = __49__PKPaymentSetupFieldsModel_prefillDefaultValues__block_invoke;
            v332[3] = &unk_1E56DBF88;
            id v333 = v164;
            v167 = objc_msgSend(v166, "pk_firstObjectPassingTest:", v332);

            if (v167)
            {
              v168 = [v165 currentValue];

              if (!v168) {
                [v165 setCurrentValue:v167];
              }
            }

            v117 = v288;
          }
          else
          {
            [v299 setDefaultValue:v164];
            v177 = [v299 currentValue];

            if (!v177) {
              [v299 setCurrentValue:v164];
            }
          }
        }
      }
      if (v296)
      {
        v178 = [v281 city];
        v116 = [v178 stringByApplyingTransform:*v139 reverse:0];

        [v296 setDefaultValue:v116];
        v179 = [v296 currentValue];

        if (!v179) {
          [v296 setCurrentValue:v116];
        }
        goto LABEL_193;
      }
    }
  }
  v118 = v279;
  if (!v279 || [v279 fieldType] != 5) {
    goto LABEL_289;
  }
  v119 = [v279 pickerItems];
  uint64_t v120 = [v119 count];

  if (!v120)
  {
    v121 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
    if ([v121 count])
    {
      v122 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v121, "count"));
      long long v328 = 0u;
      long long v329 = 0u;
      long long v330 = 0u;
      long long v331 = 0u;
      id v123 = v121;
      uint64_t v124 = [v123 countByEnumeratingWithState:&v328 objects:v345 count:16];
      if (v124)
      {
        uint64_t v125 = v124;
        uint64_t v126 = *(void *)v329;
        do
        {
          for (uint64_t j = 0; j != v125; ++j)
          {
            if (*(void *)v329 != v126) {
              objc_enumerationMutation(v123);
            }
            v128 = *(void **)(*((void *)&v328 + 1) + 8 * j);
            v129 = PKLocalizedStringForCountryCode(v5, v128);
            if ([v129 length])
            {
              v130 = [[PKPaymentSetupFieldPickerItem alloc] initWithName:v129 value:v128];
              [v122 safelyAddObject:v130];
            }
          }
          uint64_t v125 = [v123 countByEnumeratingWithState:&v328 objects:v345 count:16];
        }
        while (v125);
      }

      [v122 sortUsingComparator:&__block_literal_global_38];
      v131 = (void *)[v122 copy];
      [v279 setPickerItems:v131];

      v118 = v279;
      uint64_t v4 = v308;
      v117 = v288;
    }
  }
  v132 = [v118 defaultValue];
  v133 = [v118 currentValue];

  if (v133) {
    goto LABEL_288;
  }
  if (v132)
  {
    v134 = [v118 pickerItems];
    v135 = +[PKPaymentSetupFieldPicker pickerItemMatchingValue:v132 pickerItems:v134];

    if (v135)
    {
      v136 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v136, OS_LOG_TYPE_DEFAULT, "Using server given default value for country code field", buf, 2u);
      }
    }
    v118 = v279;
  }
  else
  {
    v135 = 0;
  }
  if (![v118 populateFromMeCard]) {
    goto LABEL_283;
  }
  v169 = [v281 ISOCountryCode];
  v170 = [v169 uppercaseString];

  v171 = [(NSMutableArray *)v5 regionCode];
  if (v135
    || !v170
    || ([v279 pickerItems],
        v172 = objc_claimAutoreleasedReturnValue(),
        +[PKPaymentSetupFieldPicker pickerItemMatchingValue:v170 pickerItems:v172], uint64_t v173 = objc_claimAutoreleasedReturnValue(), v172, !v173))
  {
    if (v135 || !v171)
    {
      if (v135) {
        goto LABEL_282;
      }
    }
    else
    {
      v176 = [v279 pickerItems];
      uint64_t v173 = +[PKPaymentSetupFieldPicker pickerItemMatchingValue:v171 pickerItems:v176];

      if (v173)
      {
        v174 = PKLogFacilityTypeGetObject(6uLL);
        if (!os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_281;
        }
        *(_WORD *)buf = 0;
        v175 = "Using device region as default countryCode value";
        goto LABEL_280;
      }
    }
    v180 = [v279 pickerItems];
    uint64_t v173 = +[PKPaymentSetupFieldPicker pickerItemMatchingValue:@"US" pickerItems:v180];

    if (!v173)
    {
      v135 = 0;
      goto LABEL_282;
    }
    v174 = PKLogFacilityTypeGetObject(6uLL);
    if (!os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_281;
    }
    *(_WORD *)buf = 0;
    v175 = "No device region using US as default";
LABEL_280:
    _os_log_impl(&dword_190E10000, v174, OS_LOG_TYPE_DEFAULT, v175, buf, 2u);
    goto LABEL_281;
  }
  v174 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v174, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v175 = "Using users meCard region as default countryCode value";
    goto LABEL_280;
  }
LABEL_281:

  v135 = v173;
LABEL_282:

  v118 = v279;
LABEL_283:
  if (v135)
  {
    [v118 setCurrentValue:v135];
  }
  else
  {
    v135 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v135, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v135, OS_LOG_TYPE_DEFAULT, "Could not find a currentValue for the countryCode picker", buf, 2u);
    }
  }

  v117 = v288;
LABEL_288:

LABEL_289:
  v181 = [v4 objectForKey:@"dateOfBirth"];
  v182 = v181;
  v183 = v277;
  if (v181)
  {
    v184 = [v181 defaultDate];
    if (v184) {
      goto LABEL_300;
    }
    if ([v182 populateFromMeCard])
    {
      v185 = v182;
      v184 = [v285 birthday];
      id v186 = objc_alloc(MEMORY[0x1E4F1C9A8]);
      v187 = (void *)[v186 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
      if (v184
        && [v184 year] != 0x7FFFFFFFFFFFFFFFLL
        && ([v187 dateFromComponents:v184], (v188 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        id v189 = v188;

        [v185 setCurrentValue:v189];
      }
      else
      {
        id v190 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
        v191 = [MEMORY[0x1E4F1C9C8] date];
        objc_msgSend(v190, "setYear:", objc_msgSend(v187, "component:fromDate:", 4, v191));

        [v190 setMonth:1];
        [v190 setDay:1];
        id v189 = [v187 dateFromComponents:v190];
      }
      v192 = [v185 currentValue];

      if (!v192) {
        [v185 setDefaultDate:v189];
      }

      v117 = v288;
      v118 = v279;
      v182 = v185;
LABEL_300:
    }
  }
  v193 = [v4 objectForKey:@"citizenship"];
  v275 = v193;
  if (v193)
  {
    v194 = v193;
    v195 = [v193 defaultValue];
    if (v195) {
      goto LABEL_333;
    }
    if ([v194 populateFromMeCard])
    {
      v195 = [v194 defaultValue];
      v196 = [(NSMutableArray *)v5 regionCode];
      v197 = [v194 pickerItems];
      uint64_t v198 = [v197 count];

      if (!v198)
      {
        v199 = [MEMORY[0x1E4F1CA20] ISOCountryCodes];
        if ([v199 count])
        {
          v318 = v196;
          v267 = v182;
          v200 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v199, "count"));
          long long v324 = 0u;
          long long v325 = 0u;
          long long v326 = 0u;
          long long v327 = 0u;
          v315 = v199;
          id v201 = v199;
          uint64_t v202 = [v201 countByEnumeratingWithState:&v324 objects:v344 count:16];
          if (v202)
          {
            uint64_t v203 = v202;
            uint64_t v204 = *(void *)v325;
            do
            {
              for (uint64_t k = 0; k != v203; ++k)
              {
                if (*(void *)v325 != v204) {
                  objc_enumerationMutation(v201);
                }
                v206 = *(void **)(*((void *)&v324 + 1) + 8 * k);
                v207 = PKLocalizedStringForCountryCode(v5, v206);
                if ([v207 length])
                {
                  v208 = [[PKPaymentSetupFieldPickerItem alloc] initWithName:v207 value:v206];
                  [v200 safelyAddObject:v208];
                }
              }
              uint64_t v203 = [v201 countByEnumeratingWithState:&v324 objects:v344 count:16];
            }
            while (v203);
          }

          [v200 sortUsingComparator:&__block_literal_global_48_0];
          v209 = (void *)[v200 copy];
          v194 = v275;
          [v275 setPickerItems:v209];

          uint64_t v4 = v308;
          v183 = v277;
          v199 = v315;
          v196 = v318;
        }
      }
      v210 = objc_msgSend(v194, "currentValue", v267);

      if (!v210)
      {
        if (!v195
          || ([v194 pickerItems],
              v211 = objc_claimAutoreleasedReturnValue(),
              +[PKPaymentSetupFieldPicker pickerItemMatchingValue:v195 pickerItems:v211], uint64_t v212 = objc_claimAutoreleasedReturnValue(), v211, !v212))
        {
          if (v196
            && ([v194 pickerItems],
                v215 = objc_claimAutoreleasedReturnValue(),
                +[PKPaymentSetupFieldPicker pickerItemMatchingValue:v196 pickerItems:v215], uint64_t v212 = objc_claimAutoreleasedReturnValue(), v215, v212))
          {
            v213 = PKLogFacilityTypeGetObject(6uLL);
            if (!os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_330;
            }
            *(_WORD *)buf = 0;
            v214 = "Using user region code as default citizenship value";
          }
          else
          {
            v216 = [v194 pickerItems];
            uint64_t v212 = +[PKPaymentSetupFieldPicker pickerItemMatchingValue:@"US" pickerItems:v216];

            v213 = PKLogFacilityTypeGetObject(6uLL);
            BOOL v217 = os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT);
            if (!v212)
            {
              if (v217)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_190E10000, v213, OS_LOG_TYPE_DEFAULT, "Could not find a currentValue for the citizenship picker", buf, 2u);
              }
              goto LABEL_331;
            }
            if (!v217) {
              goto LABEL_330;
            }
            *(_WORD *)buf = 0;
            v214 = "No user region code, using US as default for citizenship";
          }
LABEL_329:
          _os_log_impl(&dword_190E10000, v213, OS_LOG_TYPE_DEFAULT, v214, buf, 2u);
          goto LABEL_330;
        }
        v213 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v213, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v214 = "Using server given default value for citizenship field";
          goto LABEL_329;
        }
LABEL_330:

        [v194 setCurrentValue:v212];
        v213 = v212;
LABEL_331:
      }
      v117 = v288;
      v118 = v279;
LABEL_333:
    }
  }
  v218 = [v4 objectForKey:@"phoneNumber"];
  v219 = v218;
  v220 = v282;
  v221 = v278;
  if (v218)
  {
    v272 = v218;
    v222 = [v218 defaultValue];
    if (v222) {
      goto LABEL_336;
    }
    v219 = v272;
    if ([v272 populateFromMeCard])
    {
      if (PKIsPhone())
      {
        v223 = PKDevicePhoneNumber();
      }
      else
      {
        v223 = 0;
      }
      v269 = v223;
      v268 = v182;
      if ([v223 length])
      {
        v224 = PKLogFacilityTypeGetObject(6uLL);
        if (os_log_type_enabled(v224, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_190E10000, v224, OS_LOG_TYPE_DEFAULT, "Using device number prefill", buf, 2u);
        }
        goto LABEL_429;
      }
      long long v322 = 0u;
      long long v323 = 0u;
      long long v320 = 0u;
      long long v321 = 0u;
      id obja = [v285 phoneNumbers];
      uint64_t v225 = [obja countByEnumeratingWithState:&v320 objects:v343 count:16];
      if (!v225)
      {
        v319 = 0;
        v305 = 0;
        v307 = 0;
        v301 = 0;
        goto LABEL_410;
      }
      uint64_t v226 = v225;
      v305 = 0;
      v307 = 0;
      v301 = 0;
      uint64_t v316 = *(void *)v321;
      v319 = 0;
      v227 = (void *)*MEMORY[0x1E4F1B758];
      v313 = (void *)*MEMORY[0x1E4F1B728];
      id v303 = (id)*MEMORY[0x1E4F1B720];
      v284 = (void *)*MEMORY[0x1E4F1B710];
      v273 = (void *)*MEMORY[0x1E4F1B750];
      v271 = (void *)*MEMORY[0x1E4F1B730];
      v270 = (void *)*MEMORY[0x1E4F1B738];
      while (1)
      {
        uint64_t v228 = 0;
        do
        {
          if (*(void *)v321 != v316) {
            objc_enumerationMutation(obja);
          }
          v229 = *(void **)(*((void *)&v320 + 1) + 8 * v228);
          v230 = objc_msgSend(v229, "label", v268);
          v231 = [v229 value];
          v232 = [v231 stringValue];

          id v233 = v230;
          id v234 = v227;
          v235 = v234;
          if (v233 == v234)
          {

LABEL_359:
            v237 = v319;
            v319 = v232;
            goto LABEL_403;
          }
          if (v227 && v233)
          {
            int v236 = [v233 isEqualToString:v234];

            if (v236) {
              goto LABEL_359;
            }
          }
          else
          {
          }
          id v238 = v233;
          id v239 = v313;
          v240 = v239;
          if (v238 == v239)
          {

LABEL_367:
            v237 = v307;
            v307 = v232;
            goto LABEL_403;
          }
          if (v313 && v233)
          {
            int v241 = [v238 isEqualToString:v239];

            if (v241) {
              goto LABEL_367;
            }
          }
          else
          {
          }
          id v242 = v238;
          id v243 = v303;
          v244 = v243;
          if (v242 == v243)
          {

LABEL_375:
            v237 = v305;
            v305 = v232;
            goto LABEL_403;
          }
          if (v303 && v233)
          {
            int v245 = [v242 isEqualToString:v243];

            if (v245) {
              goto LABEL_375;
            }
          }
          else
          {
          }
          v246 = v242;
          v247 = v284;
          v237 = v247;
          if (v246 == v247)
          {
          }
          else
          {
            if (!v284 || !v233)
            {
LABEL_400:

LABEL_401:
              v237 = v301;
              if ([v301 length]) {
                goto LABEL_404;
              }
              v301 = v232;
LABEL_403:

              goto LABEL_404;
            }
            int v248 = [v246 isEqualToString:v247];

            if (!v248) {
              goto LABEL_401;
            }
          }
          v249 = v246;
          v250 = v273;
          v237 = v250;
          if (v249 == v250)
          {
          }
          else
          {
            if (!v273 || !v233) {
              goto LABEL_400;
            }
            int v251 = [v249 isEqualToString:v250];

            if (!v251) {
              goto LABEL_401;
            }
          }
          v252 = v249;
          v253 = v271;
          v237 = v253;
          if (v252 == v253)
          {
          }
          else
          {
            if (!v271 || !v233) {
              goto LABEL_400;
            }
            int v254 = [v252 isEqualToString:v253];

            if (!v254) {
              goto LABEL_401;
            }
          }
          v255 = v252;
          v256 = v270;
          v237 = v256;
          if (v255 == v256)
          {

            goto LABEL_403;
          }
          if (!v270 || !v233) {
            goto LABEL_400;
          }
          char v257 = [v255 isEqualToString:v256];

          if ((v257 & 1) == 0) {
            goto LABEL_401;
          }
LABEL_404:

          ++v228;
          uint64_t v4 = v308;
        }
        while (v226 != v228);
        uint64_t v258 = [obja countByEnumeratingWithState:&v320 objects:v343 count:16];
        uint64_t v226 = v258;
        if (!v258)
        {
LABEL_410:

          if (![v319 length])
          {
            v261 = v307;
            v183 = v277;
            v221 = v278;
            v117 = v288;
            if ([v307 length])
            {
              v259 = v307;

              v260 = PKLogFacilityTypeGetObject(6uLL);
              v224 = v319;
              if (!os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_427;
              }
              *(_WORD *)buf = 0;
              v262 = "Using me card mobile number prefill";
            }
            else
            {
              v263 = v305;
              v224 = v319;
              if ([v305 length])
              {
                v259 = v305;

                v260 = PKLogFacilityTypeGetObject(6uLL);
                if (!os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_427;
                }
                *(_WORD *)buf = 0;
                v262 = "Using me card main number prefill";
              }
              else
              {
                if (![v301 length]) {
                  goto LABEL_428;
                }
                v259 = v301;

                v260 = PKLogFacilityTypeGetObject(6uLL);
                if (!os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_427;
                }
                *(_WORD *)buf = 0;
                v262 = "Using me card other number prefill";
              }
            }
            _os_log_impl(&dword_190E10000, v260, OS_LOG_TYPE_DEFAULT, v262, buf, 2u);
            goto LABEL_427;
          }
          v259 = v319;

          v260 = PKLogFacilityTypeGetObject(6uLL);
          v183 = v277;
          v221 = v278;
          v117 = v288;
          if (os_log_type_enabled(v260, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_190E10000, v260, OS_LOG_TYPE_DEFAULT, "Using me card iPhone number prefill", buf, 2u);
          }
          v224 = v319;
LABEL_427:

          v269 = v259;
          v263 = v305;
          v261 = v307;
LABEL_428:

          v118 = v279;
LABEL_429:
          v264 = v221;

          if ([v269 length])
          {
            [v272 setDefaultValue:v269];
            v265 = [v272 currentValue];

            if (!v265) {
              [v272 setCurrentValue:v269];
            }
            v220 = v282;
            v221 = v264;
            v182 = v268;
            v222 = v269;
          }
          else
          {
            v266 = PKLogFacilityTypeGetObject(6uLL);
            if (os_log_type_enabled(v266, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_190E10000, v266, OS_LOG_TYPE_DEFAULT, "No prefilled phone number could be found", buf, 2u);
            }

            v220 = v282;
            v221 = v264;
            v182 = v268;
            v222 = v269;
          }
LABEL_336:

          v219 = v272;
          break;
        }
      }
    }
  }

LABEL_338:
LABEL_339:
}

BOOL __49__PKPaymentSetupFieldsModel_prefillDefaultValues__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 localizedDisplayName];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
    BOOL v10 = 1;
    id v11 = v6;
LABEL_14:

    goto LABEL_15;
  }
  BOOL v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_8;
  }
  uint64_t v9 = [v6 caseInsensitiveCompare:v7];

  if (v9)
  {
LABEL_8:
    int v12 = [v3 submissionValue];
    uint64_t v13 = *(void **)(a1 + 32);
    id v11 = v12;
    id v14 = v13;
    int v15 = v14;
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

uint64_t __49__PKPaymentSetupFieldsModel_prefillDefaultValues__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 localizedDisplayName];
  id v6 = [v4 localizedDisplayName];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

uint64_t __49__PKPaymentSetupFieldsModel_prefillDefaultValues__block_invoke_46(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 localizedDisplayName];
  id v6 = [v4 localizedDisplayName];

  uint64_t v7 = [v5 localizedCaseInsensitiveCompare:v6];
  return v7;
}

- (void)prefillDefaultValuesWithPostalAddress:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"street1"];
  id v6 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"street2"];
  uint64_t v7 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"addressLine1"];
  uint64_t v8 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"addressLine2"];
  uint64_t v9 = (void *)v8;
  if (v5) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = v6 == 0;
  }
  BOOL v12 = v10 && v7 == 0 && v8 == 0;
  long long v32 = v7;
  long long v33 = v6;
  if (v12)
  {
    uint64_t v16 = *MEMORY[0x1E4F1C4D8];
  }
  else
  {
    uint64_t v13 = [v4 street];
    id v14 = [v13 componentsSeparatedByString:@"\n"];

    int v15 = [v14 firstObject];
    uint64_t v16 = *MEMORY[0x1E4F1C4D8];
    uint64_t v17 = [v15 stringByApplyingTransform:*MEMORY[0x1E4F1C4D8] reverse:0];

    __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v5, v17);
    __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v7, v17);
    if ((unint64_t)[v14 count] < 2)
    {
      uint64_t v19 = 0;
    }
    else
    {
      uint64_t v18 = [v14 objectAtIndex:1];
      uint64_t v19 = [v18 stringByApplyingTransform:v16 reverse:0];
    }
    __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v6, v19);
    __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v9, v19);
  }
  long long v20 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"postalCode"];
  long long v21 = [v4 postalCode];
  __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v20, v21);
  int v22 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"city"];
  uint64_t v23 = [v4 city];
  int v24 = [v23 stringByApplyingTransform:v16 reverse:0];

  __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v22, v24);
  id v25 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"state"];
  if (v25)
  {
    id v26 = [v4 state];
    v27 = [v26 stringByApplyingTransform:v16 reverse:0];

    if (v27)
    {
      if ([v25 isFieldTypePicker])
      {
        long long v31 = v5;
        id v30 = v25;
        v28 = [v30 pickerItems];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke_2;
        v34[3] = &unk_1E56DBF88;
        id v35 = v27;
        uint64_t v29 = objc_msgSend(v28, "pk_firstObjectPassingTest:", v34);

        if (v29)
        {
          [v30 setCurrentValue:v29];
          [v30 setSource:2];
        }

        uint64_t v5 = v31;
      }
      else
      {
        __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(v25, v27);
      }
    }
  }
}

void __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke(void *a1, void *a2)
{
  if (a1)
  {
    id v3 = a2;
    id v4 = a1;
    [v4 setDefaultValue:v3];
    [v4 setCurrentValue:v3];

    [v4 setSource:2];
  }
}

BOOL __67__PKPaymentSetupFieldsModel_prefillDefaultValuesWithPostalAddress___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 localizedDisplayName];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = v4;
  id v7 = v5;
  if (v6 == v7)
  {
    BOOL v10 = 1;
    id v11 = v6;
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v8 = v7;
  if (!v6 || !v7)
  {

    goto LABEL_8;
  }
  uint64_t v9 = [v6 caseInsensitiveCompare:v7];

  if (v9)
  {
LABEL_8:
    BOOL v12 = [v3 submissionValue];
    uint64_t v13 = *(void **)(a1 + 32);
    id v11 = v12;
    id v14 = v13;
    int v15 = v14;
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

- (void)prefillValuesWithPaymentCredential:(id)a3
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isSafariCredential])
  {
    uint64_t v5 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"primaryAccountNumber"];
    if (v5)
    {
      [(NSMutableArray *)self->_paymentSetupFields removeObject:v5];
      id v6 = [[PKPaymentSetupFieldBuiltInCardOnFilePrimaryAccountNumber alloc] initWithIdentifier:@"cardOnFilePrimaryAccountNumber"];
      [(NSMutableArray *)self->_paymentSetupFields insertObject:v6 atIndex:0];
    }
    id v7 = [v4 safariCredential];
    uint64_t v8 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"cardholderName"];
    uint64_t v9 = [v8 currentValue];

    if (!v9)
    {
      BOOL v10 = [v7 cardholderName];
      [v8 setCurrentValue:v10];
    }
    id v11 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"cardSecurityCode"];
    BOOL v12 = [v11 currentValue];

    if (!v12)
    {
      uint64_t v13 = [v7 securityCode];
      [v11 setCurrentValue:v13];
    }
  }
  id v14 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"cardOnFilePrimaryAccountNumber"];
  int v15 = v14;
  if (v14)
  {
    [v14 setReadonly:1];
    uint64_t v16 = PKSanitizedPrimaryAccountRepresentationForPaymentCredential(v4);
    [v15 setCurrentValue:v16];

    uint64_t v17 = [v4 credentialType];
    if ([v4 isLocalPassCredential])
    {
      if (v17 == 123)
      {
        uint64_t v18 = @"ACCOUNT_ON_IPHONE";
LABEL_18:
        uint64_t v20 = PKLocalizedAquamanString(&v18->isa, 0);
LABEL_21:
        long long v21 = (void *)v20;
        [v15 setLocalizedDisplayName:v20];

        goto LABEL_22;
      }
      uint64_t v19 = @"CARD_ON_IPHONE";
    }
    else if ([v4 isSafariCredential])
    {
      uint64_t v19 = @"CARD_NUMBER";
    }
    else
    {
      if (v17 == 123)
      {
        uint64_t v18 = @"ACCOUNT_ON_FILE";
        goto LABEL_18;
      }
      uint64_t v19 = @"CARD_ON_FILE";
    }
    uint64_t v20 = PKLocalizedPaymentString(&v19->isa, 0);
    goto LABEL_21;
  }
LABEL_22:
  int v22 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:@"cardExpiration"];
  if (v22)
  {
    uint64_t v23 = [v4 expiration];
    if (v23)
    {
      int v24 = (void *)v23;
      id v25 = [v22 currentValue];

      if (!v25)
      {
        if (qword_1EB402C48 != -1) {
          dispatch_once(&qword_1EB402C48, &__block_literal_global_70);
        }
        id v26 = (void *)_MergedGlobals_207;
        v27 = [v4 expiration];
        v28 = [v26 dateFromString:v27];

        if (v28) {
          [v22 setCurrentValue:v28];
        }
      }
    }
  }
  uint64_t v29 = [v4 accountCredential];
  id v30 = [v29 account];

  long long v31 = [v30 creditDetails];
  if ([v4 isAccountCredential] && v31)
  {
    long long v32 = [v31 currencyCode];
    uint64_t v33 = [v30 feature];
    id v34 = [v31 accountSummary];
    unint64_t v35 = [v30 accessLevel];
    if (v35 >= 2)
    {
      if (v35 != 2)
      {
LABEL_55:

        goto LABEL_56;
      }
      v94 = v22;
      v95 = v15;
      v91 = v32;
      long long v36 = v34;
      BOOL v37 = [[PKPaymentSetupFieldText alloc] initWithIdentifier:@"spendActivity" type:1];
      char v38 = [(PKPaymentSetupField *)v37 textFieldObject];

      int v39 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
      id v40 = [MEMORY[0x1E4F1C9C8] date];
      id v41 = [v39 components:8 fromDate:v40];
      uint64_t v42 = [v41 month];

      PKGregorianMonthSpecificLocalizedStringKeyForKey(@"SPENDING_LABEL", v42);
      BOOL v43 = (NSString *)objc_claimAutoreleasedReturnValue();
      char v44 = PKLocalizedMadisonString(v43, 0);
      [v38 setLocalizedDisplayName:v44];

      int v45 = PKCurrentUserAltDSID();
      v96 = v36;
      v46 = [v36 accountUserActivityForAccountUserAltDSID:v45];

      v89 = v46;
      id v47 = [(NSDecimalNumber *)v46 totalSpending];
      id v48 = [v31 currencyCode];
      v49 = v48;
      if (v47 && v48)
      {
        BOOL v50 = PKCurrencyAmountCreate(v47, v48, 0);
        char v51 = [MEMORY[0x1E4F28C28] zero];
        uint64_t v52 = [(NSDecimalNumber *)v47 compare:v51];

        if (v52 == -1)
        {
          v85 = [v50 negativeValue];

          BOOL v50 = v85;
          id v53 = [v85 formattedStringValue];
          v86 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EE0F6808.isa, v53);
          [v38 setCurrentValue:v86];
        }
        else
        {
          id v53 = [v50 formattedStringValue];
          [v38 setCurrentValue:v53];
        }
      }
      [v38 setReadonly:1];
      v97 = v38;
      v87 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v97 count:1];
      [(PKPaymentSetupFieldsModel *)self updateWithPaymentSetupFields:v87];

      long long v32 = v91;
      int v22 = v94;
      id v74 = v89;
    }
    else
    {
      v95 = v15;
      v96 = v34;
      if ([v34 requiresDebtCollectionNotices])
      {
        int v93 = 0;
      }
      else
      {
        v92 = v32;
        id v54 = v22;
        v55 = [[PKPaymentSetupFieldBuiltInBalance alloc] initWithIdentifier:@"balance" type:1];
        BOOL v56 = [(PKPaymentSetupField *)v55 textFieldObject];

        uint64_t v90 = v33;
        id v62 = PKLocalizedFeatureString(@"ACCOUNT_DASHBOARD_SUMMARY_CARD_BALANCE", v33, 0, v57, v58, v59, v60, v61, v88);
        int v93 = v56;
        [v56 setLocalizedDisplayName:v62];

        id v63 = [v30 creditDetails];
        v64 = [v63 cardBalance];

        char v65 = [v64 amount];
        id v66 = [MEMORY[0x1E4F28C28] zero];
        uint64_t v67 = [v65 compare:v66];

        if (v67 == -1)
        {
          id v71 = [v64 negativeValue];

          char v69 = [v71 formattedStringValue];
          uint64_t v88 = (uint64_t)v69;
          v72 = PKLocalizedPaymentString(&cfstr_AmountFormatRe.isa, &stru_1EE0F6808.isa);
          [v93 setCurrentValue:v72];

          v64 = v71;
        }
        else
        {
          uint64_t v68 = [v64 formattedStringValue];
          char v69 = (void *)v68;
          if (v68) {
            id v70 = (__CFString *)v68;
          }
          else {
            id v70 = &stru_1EE0F5368;
          }
          [v93 setCurrentValue:v70];
        }

        v99[0] = v93;
        char v73 = [MEMORY[0x1E4F1C978] arrayWithObjects:v99 count:1];
        [(PKPaymentSetupFieldsModel *)self updateWithPaymentSetupFields:v73];

        int v22 = v54;
        uint64_t v33 = v90;
        long long v32 = v92;
        id v34 = v96;
      }
      id v74 = [v34 creditLimit];
      id v75 = [[PKPaymentSetupFieldText alloc] initWithIdentifier:@"limit" type:1];
      char v38 = [(PKPaymentSetupField *)v75 textFieldObject];

      v81 = PKLocalizedFeatureString(@"ACCOUNT_SERVICE_CREDIT_DETAILS_CREDIT_LIMIT", v33, 0, v76, v77, v78, v79, v80, v88);
      [v38 setLocalizedDisplayName:v81];

      PKCurrencyAmountCreate(v74, (NSString *)v32, 0);
      id v47 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
      uint64_t v82 = [(NSDecimalNumber *)v47 formattedStringValue];
      id v83 = (void *)v82;
      if (v82) {
        v84 = (__CFString *)v82;
      }
      else {
        v84 = &stru_1EE0F5368;
      }
      [v38 setCurrentValue:v84];

      [v38 setReadonly:1];
      int v98 = v38;
      v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
      [(PKPaymentSetupFieldsModel *)self updateWithPaymentSetupFields:v49];
    }

    int v15 = v95;
    id v34 = v96;
    goto LABEL_55;
  }
LABEL_56:
}

uint64_t __64__PKPaymentSetupFieldsModel_prefillValuesWithPaymentCredential___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)_MergedGlobals_207;
  _MergedGlobals_207 = (uint64_t)v0;

  id v2 = (void *)_MergedGlobals_207;
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [v2 setLocale:v3];

  id v4 = (void *)_MergedGlobals_207;
  return [v4 setDateFormat:@"MM/yy"];
}

- (id)setupFieldAnalytics
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = self->_paymentSetupFields;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        BOOL v10 = objc_msgSend(v9, "identifier", (void)v14);

        if (v10)
        {
          id v11 = [v9 identifier];
          [v3 setObject:@"true" forKey:v11];
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  BOOL v12 = (void *)[v3 copy];
  return v12;
}

- (id)odiAttributes
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = self->_paymentSetupFields;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "odiAttribute", (void)v18);
        if (v10)
        {
          id v11 = (void *)v10;
          BOOL v12 = [v9 submissionString];

          if (v12)
          {
            uint64_t v13 = [v9 submissionString];
            long long v14 = [v9 odiAttribute];
            [v3 setObject:v13 forKey:v14];
          }
        }
      }
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  if ([v3 count])
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F5C978]);
    long long v16 = (void *)[v3 copy];
    [v15 setAttributes:v16];
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)requirementsMetForFieldWithIdentifier:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:v4];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v6 = [v5 requirements];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    id v25 = v5;
    id v26 = v4;
    uint64_t v9 = *(void *)v30;
    v27 = self;
    v28 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (objc_msgSend(v11, "type", v25) == 1)
        {
          BOOL v12 = [v11 fieldIdentifier];
          uint64_t v13 = [(PKPaymentSetupFieldsModel *)self paymentSetupFieldWithIdentifier:v12];
          long long v14 = v13;
          if (v13 && [v13 isFieldTypePicker])
          {
            id v15 = [v14 pickerFieldObject];
            long long v16 = [v15 currentValue];
            long long v17 = [v16 submissionValue];
            uint64_t v18 = [v11 value];
            long long v19 = (void *)v18;
            BOOL v20 = !v17 || v18 == 0;
            char v21 = v20 ? v17 == (void *)v18 : [v17 isEqual:v18];

            self = v27;
            uint64_t v6 = v28;
            if ((v21 & 1) == 0)
            {
              uint64_t v23 = PKLogFacilityTypeGetObject(6uLL);
              id v4 = v26;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v34 = v26;
                __int16 v35 = 2112;
                long long v36 = v12;
                _os_log_impl(&dword_190E10000, v23, OS_LOG_TYPE_DEFAULT, "Requirement not met for %@, based on %@", buf, 0x16u);
              }

              BOOL v22 = 0;
              goto LABEL_23;
            }
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v8) {
        continue;
      }
      break;
    }
    BOOL v22 = 1;
    id v4 = v26;
LABEL_23:
    uint64_t v5 = v25;
  }
  else
  {
    BOOL v22 = 1;
  }

  return v22;
}

- (BOOL)requirementsMetForVisibleFields
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = [(PKPaymentSetupFieldsModel *)self visiblePaymentSetupFields];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (([v7 submissionStringMeetsAllRequirements] & 1) == 0
          && ([v7 isOptional] & 1) == 0
          && ![v7 isReadonly])
        {
          BOOL v8 = 0;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v8 = 1;
LABEL_13:

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerFields, 0);
  objc_storeStrong((id *)&self->_footerField, 0);
  objc_storeStrong((id *)&self->_paymentSetupFields, 0);
}

@end