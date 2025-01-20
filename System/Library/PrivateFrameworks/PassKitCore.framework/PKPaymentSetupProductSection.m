@interface PKPaymentSetupProductSection
- (NSArray)categories;
- (NSString)localizedTitle;
- (PKPaymentSetupProductSection)initWithDictionary:(id)a3;
- (id)description;
- (void)setCategories:(id)a3;
- (void)setLocalizedTitle:(id)a3;
@end

@implementation PKPaymentSetupProductSection

- (PKPaymentSetupProductSection)initWithDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)PKPaymentSetupProductSection;
  v5 = [(PKPaymentSetupProductSection *)&v22 init];
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = 0;
      goto LABEL_15;
    }
    uint64_t v6 = [v4 PKStringForKey:@"localizedTitle"];
    localizedTitle = v5->_localizedTitle;
    v5->_localizedTitle = (NSString *)v6;

    v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v9 = [v4 PKArrayContaining:objc_opt_class() forKey:@"items"];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v19;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = [[PKPaymentSetupProductCategory alloc] initWithDictionary:*(void *)(*((void *)&v18 + 1) + 8 * v13)];
          if (v14) {
            [(NSArray *)v8 addObject:v14];
          }

          ++v13;
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v11);
    }
    categories = v5->_categories;
    v5->_categories = v8;
  }
  v16 = v5;
LABEL_15:

  return v16;
}

- (id)description
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"localizedTitle: '%@'; ", self->_localizedTitle];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_categories;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
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
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) description];
        [v3 appendString:v9];
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  [v3 appendFormat:@">"];
  uint64_t v10 = (void *)[v3 copy];

  return v10;
}

- (NSString)localizedTitle
{
  return self->_localizedTitle;
}

- (void)setLocalizedTitle:(id)a3
{
}

- (NSArray)categories
{
  return self->_categories;
}

- (void)setCategories:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_categories, 0);
  objc_storeStrong((id *)&self->_localizedTitle, 0);
}

@end