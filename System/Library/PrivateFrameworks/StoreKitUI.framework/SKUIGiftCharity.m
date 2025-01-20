@interface SKUIGiftCharity
- (NSArray)donationAmounts;
- (NSString)amountDisclaimer;
- (NSString)charityDescription;
- (NSString)identifier;
- (NSString)legalText;
- (NSString)legalText2;
- (NSString)name;
- (SKUIArtwork)logoArtwork;
- (SKUIGiftCharity)initWithCharityDictionary:(id)a3;
@end

@implementation SKUIGiftCharity

- (SKUIGiftCharity)initWithCharityDictionary:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIGiftCharity initWithCharityDictionary:]();
  }
  v54.receiver = self;
  v54.super_class = (Class)SKUIGiftCharity;
  v5 = [(SKUIGiftCharity *)&v54 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"amountDisclaimer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v7 = [v6 copy];
      amountDisclaimer = v5->_amountDisclaimer;
      v5->_amountDisclaimer = (NSString *)v7;
    }
    v9 = [v4 objectForKey:@"description"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 copy];
      description = v5->_description;
      v5->_description = (NSString *)v10;
    }
    v12 = [v4 objectForKey:@"id"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [v12 copy];
      identifier = v5->_identifier;
      v5->_identifier = (NSString *)v13;
    }
    v15 = [v4 objectForKey:@"legalText"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v16 = [v15 copy];
      legalText = v5->_legalText;
      v5->_legalText = (NSString *)v16;
    }
    v18 = [v4 objectForKey:@"legalText2"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [v18 copy];
      legalText2 = v5->_legalText2;
      v5->_legalText2 = (NSString *)v19;
    }
    v21 = [v4 objectForKey:@"name"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v22 = [v21 copy];
      name = v5->_name;
      v5->_name = (NSString *)v22;
    }
    v24 = [v4 objectForKey:@"logo"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v26 = [v25 userInterfaceIdiom];

      if (v26 == 1) {
        v27 = @"iPad";
      }
      else {
        v27 = @"iPhone";
      }
      v28 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v28 scale];
      double v30 = v29;

      if (v30 == 2.0)
      {
        v27 = [(__CFString *)v27 stringByAppendingString:@"_2x"];
      }
      v31 = [MEMORY[0x1E4FB1BA8] mainScreen];
      [v31 scale];
      double v33 = v32;

      if (v33 == 3.0)
      {
        uint64_t v34 = [(__CFString *)v27 stringByAppendingString:@"_3x"];

        v27 = (__CFString *)v34;
      }
      v35 = [v24 objectForKey:v27];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v36 = [[SKUIArtwork alloc] initWithArtworkDictionary:v35];
        logoArtwork = v5->_logoArtwork;
        v5->_logoArtwork = v36;
      }
    }
    v38 = [v4 objectForKey:@"amounts"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v49 = v4;
      v39 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v40 = v38;
      uint64_t v41 = [v40 countByEnumeratingWithState:&v50 objects:v55 count:16];
      if (v41)
      {
        uint64_t v42 = v41;
        uint64_t v43 = *(void *)v51;
        do
        {
          uint64_t v44 = 0;
          do
          {
            if (*(void *)v51 != v43) {
              objc_enumerationMutation(v40);
            }
            uint64_t v45 = *(void *)(*((void *)&v50 + 1) + 8 * v44);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v46 = [[SKUIGiftAmount alloc] initWithAmountDictionary:v45];
              [(NSArray *)v39 addObject:v46];
            }
            ++v44;
          }
          while (v42 != v44);
          uint64_t v42 = [v40 countByEnumeratingWithState:&v50 objects:v55 count:16];
        }
        while (v42);
      }

      amounts = v5->_amounts;
      v5->_amounts = v39;

      id v4 = v49;
    }
  }
  return v5;
}

- (NSString)amountDisclaimer
{
  return self->_amountDisclaimer;
}

- (NSString)charityDescription
{
  return self->_description;
}

- (NSArray)donationAmounts
{
  return self->_amounts;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)legalText
{
  return self->_legalText;
}

- (NSString)legalText2
{
  return self->_legalText2;
}

- (SKUIArtwork)logoArtwork
{
  return self->_logoArtwork;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_logoArtwork, 0);
  objc_storeStrong((id *)&self->_legalText2, 0);
  objc_storeStrong((id *)&self->_legalText, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_description, 0);
  objc_storeStrong((id *)&self->_amounts, 0);

  objc_storeStrong((id *)&self->_amountDisclaimer, 0);
}

- (void)initWithCharityDictionary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIGiftCharity initWithCharityDictionary:]";
}

@end