@interface MSDStoreContactsModel
+ (MSDStoreContactsModel)sharedInstance;
- (MSDStoreContactsModel)init;
- (NSDictionary)regionToCountryCode;
- (NSMutableDictionary)countryCodeToNumbers;
- (id)contactNumberForCountryCode:(id)a3;
- (void)setCountryCodeToNumbers:(id)a3;
@end

@implementation MSDStoreContactsModel

+ (MSDStoreContactsModel)sharedInstance
{
  if (sharedInstance_onceToken_4 != -1) {
    dispatch_once(&sharedInstance_onceToken_4, &__block_literal_global_6);
  }
  v2 = (void *)sharedInstance_sharedInstance_1;
  return (MSDStoreContactsModel *)v2;
}

uint64_t __39__MSDStoreContactsModel_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_1 = objc_alloc_init(MSDStoreContactsModel);
  return MEMORY[0x270F9A758]();
}

- (MSDStoreContactsModel)init
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  v44.receiver = self;
  v44.super_class = (Class)MSDStoreContactsModel;
  v35 = [(MSDStoreContactsModel *)&v44 init];
  if (v35)
  {
    v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v3 = [v2 URLForResource:@"contact" withExtension:@"json"];

    v28 = (void *)v3;
    v27 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v3];
    v26 = objc_msgSend(MEMORY[0x263F08900], "JSONObjectWithData:options:error:");
    v4 = [v26 objectForKey:@"area_ar"];
    v5 = objc_opt_new();
    [(MSDStoreContactsModel *)v35 setCountryCodeToNumbers:v5];

    uint64_t v6 = objc_opt_new();
    regionToCountryCode = v35->_regionToCountryCode;
    v35->_regionToCountryCode = (NSDictionary *)v6;

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id obj = v4;
    uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (!v31) {
      goto LABEL_23;
    }
    uint64_t v30 = *(void *)v41;
    while (1)
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v41 != v30) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = v8;
        v9 = *(void **)(*((void *)&v40 + 1) + 8 * v8);
        v10 = objc_opt_new();
        v32 = [v9 objectForKey:@"label"];
        v11 = [v9 objectForKey:@"phone_ar"];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v34 = v11;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v36 objects:v45 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v37 != v14) {
                objc_enumerationMutation(v34);
              }
              v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              v17 = [v16 objectForKey:@"country_code"];
              v18 = [v16 objectForKey:@"phone"];
              v19 = [v16 objectForKey:@"toll_free"];
              if (([v10 containsObject:v17] & 1) == 0) {
                [v10 addObject:v17];
              }
              v20 = [(MSDStoreContactsModel *)v35 countryCodeToNumbers];
              uint64_t v21 = [v20 objectForKey:v17];
              if (!v21)
              {

LABEL_18:
                v24 = [(MSDStoreContactsModel *)v35 countryCodeToNumbers];
                [v24 setObject:v18 forKey:v17];

                goto LABEL_19;
              }
              v22 = (void *)v21;
              char v23 = [v19 BOOLValue];

              if (v23) {
                goto LABEL_18;
              }
LABEL_19:
            }
            uint64_t v13 = [v34 countByEnumeratingWithState:&v36 objects:v45 count:16];
          }
          while (v13);
        }
        [(NSDictionary *)v35->_regionToCountryCode setValue:v10 forKey:v32];

        uint64_t v8 = v33 + 1;
      }
      while (v33 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
      if (!v31)
      {
LABEL_23:

        return v35;
      }
    }
  }
  return v35;
}

- (id)contactNumberForCountryCode:(id)a3
{
  id v4 = a3;
  v5 = [(MSDStoreContactsModel *)self countryCodeToNumbers];
  uint64_t v6 = [v5 objectForKey:v4];

  return v6;
}

- (NSDictionary)regionToCountryCode
{
  return self->_regionToCountryCode;
}

- (NSMutableDictionary)countryCodeToNumbers
{
  return self->_countryCodeToNumbers;
}

- (void)setCountryCodeToNumbers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countryCodeToNumbers, 0);
  objc_storeStrong((id *)&self->_regionToCountryCode, 0);
}

@end