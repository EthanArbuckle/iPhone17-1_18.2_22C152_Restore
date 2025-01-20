@interface SSLocalCEP
+ (BOOL)isAllowlistedBundle:(id)a3;
+ (BOOL)isLowEngagementBundle:(id)a3;
+ (id)getCEPValuesForCurrentLocale;
@end

@implementation SSLocalCEP

+ (id)getCEPValuesForCurrentLocale
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA20] currentLocale];
  v3 = [v2 objectForKey:*MEMORY[0x1E4F1C438]];
  v4 = [v2 objectForKey:*MEMORY[0x1E4F1C400]];
  uint64_t v5 = [v2 objectForKey:*MEMORY[0x1E4F1C470]];
  v6 = (void *)v5;
  if (v4) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (v4) {
      id v8 = (id)[[NSString alloc] initWithFormat:@"%@_%@", v3, v4, v20];
    }
    else {
      id v8 = v3;
    }
  }
  else
  {
    id v8 = (id)[[NSString alloc] initWithFormat:@"%@_%@_%@", v3, v5, v4];
  }
  v9 = v8;
  if ([(id)getCEPValuesForCurrentLocale_sCannedLocale isEqual:v8])
  {
    v10 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
  }
  else
  {
    objc_storeStrong((id *)&getCEPValuesForCurrentLocale_sCannedLocale, v9);
    if (!getCEPValuesForCurrentLocale_sCannedCepValues && getCEPValuesForCurrentLocale_onceToken != -1) {
      dispatch_once(&getCEPValuesForCurrentLocale_onceToken, &__block_literal_global_19);
    }
    v25 = "iOS";
    v26 = (const char *)[v9 UTF8String];
    uint64_t v27 = 0;
    v11 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
    getCEPValuesForCurrentLocale_sCannedCepForLocale = 0;

    long long v23 = 0uLL;
    uint64_t v24 = 0;
    if (_MDPlistContainerGetPlistObjectAtKeyArray())
    {
      v12 = [SSPlistDataReader alloc];
      long long v21 = v23;
      uint64_t v22 = v24;
      uint64_t v13 = [(SSPlistDataReader *)v12 initWithPlistContainer:getCEPValuesForCurrentLocale_sCannedCepValues obj:&v21];
      v14 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
      getCEPValuesForCurrentLocale_sCannedCepForLocale = v13;
    }
    if (!getCEPValuesForCurrentLocale_sCannedCepForLocale)
    {
      v26 = "global";
      if (_MDPlistContainerGetPlistObjectAtKeyArray())
      {
        v15 = [SSPlistDataReader alloc];
        long long v21 = v23;
        uint64_t v22 = v24;
        uint64_t v16 = [(SSPlistDataReader *)v15 initWithPlistContainer:getCEPValuesForCurrentLocale_sCannedCepValues obj:&v21];
      }
      else
      {
        uint64_t v16 = objc_opt_new();
      }
      v17 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
      getCEPValuesForCurrentLocale_sCannedCepForLocale = v16;
    }
    v10 = (void *)getCEPValuesForCurrentLocale_sCannedCepForLocale;
  }
  id v18 = v10;

  return v18;
}

void __42__SSLocalCEP_getCEPValuesForCurrentLocale__block_invoke()
{
  if (!getCEPValuesForCurrentLocale_sCannedCepValues)
  {
    id v0 = objc_alloc(MEMORY[0x1E4F1C9B8]);
    v1 = SSDefaultsGetAssetPath(@"cep_query_independent_ratios.ios.json.mdplist");
    v2 = (void *)[v0 initWithContentsOfFile:v1 options:8 error:0];

    id v3 = v2;
    [v3 bytes];
    [v3 length];
    getCEPValuesForCurrentLocale_sCannedCepValues = _MDPlistContainerCreateWithBytesAndDeallocator();
  }
}

void __42__SSLocalCEP_getCEPValuesForCurrentLocale__block_invoke_2(uint64_t a1)
{
}

+ (BOOL)isLowEngagementBundle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [a1 getCEPValuesForCurrentLocale];
  [v5 doubleValueForBundle:v4];
  double v7 = v6;

  return v7 < 0.01;
}

+ (BOOL)isAllowlistedBundle:(id)a3
{
  uint64_t v3 = isAllowlistedBundle__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&isAllowlistedBundle__onceToken, &__block_literal_global_14);
  }
  char v5 = [(id)isAllowlistedBundle__allowlistedBundles containsObject:v4];

  return v5;
}

uint64_t __34__SSLocalCEP_isAllowlistedBundle___block_invoke()
{
  isAllowlistedBundle__allowlistedBundles = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.mr-brightside.myParcel", 0);
  return MEMORY[0x1F41817F8]();
}

@end