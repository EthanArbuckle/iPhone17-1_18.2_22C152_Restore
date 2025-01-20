@interface PKSecureElementPassFieldCollection
- (NSArray)balanceFields;
- (NSArray)commutePlans;
- (NSDictionary)fieldsDictionary;
- (PKSecureElementPassFieldCollection)initWithBalanceFieldsFromPass:(id)a3;
- (PKSecureElementPassFieldCollection)initWithFieldsDictionary:(id)a3;
- (PKSecureElementPassFieldCollection)initWithPassDictionary:(id)a3;
- (void)setFieldsDictionary:(id)a3;
@end

@implementation PKSecureElementPassFieldCollection

- (PKSecureElementPassFieldCollection)initWithPassDictionary:(id)a3
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v34[0] = @"balanceFields";
  v34[1] = @"commutePlans";
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:2];
  v18 = v3;
  v22 = [v3 PKDictionaryForKey:@"paymentCard"];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v4;
  uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v23)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v28 + 1) + 8 * v5);
        v7 = [v22 PKArrayContaining:objc_opt_class() forKey:v6];
        if ([v7 count])
        {
          v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v9 = v7;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v25;
            do
            {
              uint64_t v13 = 0;
              do
              {
                if (*(void *)v25 != v12) {
                  objc_enumerationMutation(v9);
                }
                v14 = [[PKSecureElementPassField alloc] initWithPaymentPassFieldDictionary:*(void *)(*((void *)&v24 + 1) + 8 * v13)];
                [v8 safelyAddObject:v14];

                ++v13;
              }
              while (v11 != v13);
              uint64_t v11 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v11);
          }

          [v20 setObject:v8 forKeyedSubscript:v6];
        }

        ++v5;
      }
      while (v5 != v23);
      uint64_t v23 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v23);
  }

  v15 = [(PKSecureElementPassFieldCollection *)self initWithFieldsDictionary:v20];
  return v15;
}

- (PKSecureElementPassFieldCollection)initWithFieldsDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKSecureElementPassFieldCollection;
  uint64_t v5 = [(PKSecureElementPassFieldCollection *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    fieldsDictionary = v5->_fieldsDictionary;
    v5->_fieldsDictionary = (NSDictionary *)v6;
  }
  return v5;
}

- (PKSecureElementPassFieldCollection)initWithBalanceFieldsFromPass:(id)a3
{
  id v4 = [a3 balanceFields];
  uint64_t v5 = objc_msgSend(v4, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_162);

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = v6;
  if (v5) {
    [v6 setObject:v5 forKeyedSubscript:@"balanceFields"];
  }
  v8 = [(PKSecureElementPassFieldCollection *)self initWithFieldsDictionary:v7];

  return v8;
}

PKSecureElementPassField *__68__PKSecureElementPassFieldCollection_initWithBalanceFieldsFromPass___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[PKSecureElementPassField alloc] initWithPassField:v2];

  return v3;
}

- (NSArray)balanceFields
{
  return (NSArray *)[(NSDictionary *)self->_fieldsDictionary objectForKeyedSubscript:@"balanceFields"];
}

- (NSArray)commutePlans
{
  return (NSArray *)[(NSDictionary *)self->_fieldsDictionary objectForKeyedSubscript:@"commutePlans"];
}

- (NSDictionary)fieldsDictionary
{
  return self->_fieldsDictionary;
}

- (void)setFieldsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end