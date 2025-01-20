@interface PKDigitalIssuanceServiceProviderProduct
- (NSArray)items;
- (NSString)identifier;
- (NSString)localizedDescription;
- (NSString)localizedDisplayName;
- (PKDigitalIssuanceServiceProviderProduct)initWithDictionary:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation PKDigitalIssuanceServiceProviderProduct

- (PKDigitalIssuanceServiceProviderProduct)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v31.receiver = self;
    v31.super_class = (Class)PKDigitalIssuanceServiceProviderProduct;
    v5 = [(PKDigitalIssuanceServiceProviderProduct *)&v31 init];
    if (v5)
    {
      v6 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v7 = [v6 UUIDString];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v7;

      uint64_t v9 = [v4 PKStringForKey:@"localizedDisplayName"];
      localizedDisplayName = v5->_localizedDisplayName;
      v5->_localizedDisplayName = (NSString *)v9;

      uint64_t v11 = [v4 PKStringForKey:@"localizedDescription"];
      localizedDescription = v5->_localizedDescription;
      v5->_localizedDescription = (NSString *)v11;

      v13 = [v4 PKArrayContaining:objc_opt_class() forKey:@"items"];
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v15 = v13;
      uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v16)
      {
        uint64_t v17 = v16;
        uint64_t v18 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v28 != v18) {
              objc_enumerationMutation(v15);
            }
            uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            v21 = [PKDigitalIssuanceServiceProviderItem alloc];
            v22 = -[PKDigitalIssuanceServiceProviderItem initWithDictionary:](v21, "initWithDictionary:", v20, (void)v27);
            [v14 safelyAddObject:v22];
          }
          uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v17);
      }

      uint64_t v23 = [v14 copy];
      items = v5->_items;
      v5->_items = (NSArray *)v23;
    }
    self = v5;
    v25 = self;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)localizedDisplayName
{
  return self->_localizedDisplayName;
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (NSArray)items
{
  return self->_items;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end