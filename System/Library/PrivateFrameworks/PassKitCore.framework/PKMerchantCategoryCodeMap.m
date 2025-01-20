@interface PKMerchantCategoryCodeMap
- (PKMerchantCategoryCodeMap)init;
- (int64_t)categoryForIndustryCode:(int64_t)a3;
@end

@implementation PKMerchantCategoryCodeMap

- (PKMerchantCategoryCodeMap)init
{
  v22.receiver = self;
  v22.super_class = (Class)PKMerchantCategoryCodeMap;
  v2 = [(PKMerchantCategoryCodeMap *)&v22 init];
  if (!v2) {
    goto LABEL_17;
  }
  v3 = PKPassKitCoreBundle();
  v4 = [v3 URLForResource:@"MCCMapping" withExtension:@"json"];

  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:v4];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v5 options:0 error:0];
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __33__PKMerchantCategoryCodeMap_init__block_invoke;
      v19[3] = &unk_1E56DCAA0;
      id v9 = v8;
      id v20 = v9;
      [v7 enumerateKeysAndObjectsUsingBlock:v19];
      uint64_t v10 = [v9 count];
      v11 = PKLogFacilityTypeGetObject(6uLL);
      BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          *(_WORD *)buf = 0;
          v13 = "Successfully generated MCC code to category map";
LABEL_15:
          _os_log_impl(&dword_190E10000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
        }
      }
      else if (v12)
      {
        *(_WORD *)buf = 0;
        v13 = "Error generating MCC code to category map";
        goto LABEL_15;
      }

      uint64_t v16 = [v9 copy];
      mccCodeToMerchantCategory = v2->_mccCodeToMerchantCategory;
      v2->_mccCodeToMerchantCategory = (NSDictionary *)v16;

LABEL_17:
      v15 = v2;
      goto LABEL_18;
    }
    v14 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v14, OS_LOG_TYPE_DEFAULT, "Error creating PKMerchantCategoryCodeMap: resourceData is nil", buf, 2u);
    }
  }
  else
  {
    v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Error creating PKMerchantCategoryCodeMap: resourceURL is nil", buf, 2u);
    }
  }

  v15 = 0;
LABEL_18:

  return v15;
}

void __33__PKMerchantCategoryCodeMap_init__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [a2 integerValue];
  uint64_t v7 = PKMerchantCategoryFromString(v5);

  if (v6 >= 1 && v7)
  {
    id v8 = *(void **)(a1 + 32);
    id v10 = [NSNumber numberWithInteger:v7];
    id v9 = [NSNumber numberWithInteger:v6];
    [v8 setObject:v10 forKey:v9];
  }
}

- (int64_t)categoryForIndustryCode:(int64_t)a3
{
  if (a3 < 1) {
    return 0;
  }
  mccCodeToMerchantCategory = self->_mccCodeToMerchantCategory;
  if (!mccCodeToMerchantCategory) {
    return 0;
  }
  v4 = objc_msgSend(NSNumber, "numberWithInteger:");
  id v5 = [(NSDictionary *)mccCodeToMerchantCategory objectForKey:v4];
  int64_t v6 = [v5 integerValue];

  return v6;
}

- (void).cxx_destruct
{
}

@end