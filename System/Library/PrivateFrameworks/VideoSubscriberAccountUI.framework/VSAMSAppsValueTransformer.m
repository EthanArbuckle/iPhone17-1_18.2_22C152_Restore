@interface VSAMSAppsValueTransformer
+ (BOOL)allowsReverseTransformation;
+ (Class)transformedValueClass;
- (BOOL)responseDeviceFamilies:(id)a3 compatibleWithDevice:(id)a4;
- (id)platformAttributes:(id)a3 forDevice:(id)a4;
- (id)transformedValue:(id)a3;
@end

@implementation VSAMSAppsValueTransformer

+ (Class)transformedValueClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)allowsReverseTransformation
{
  return 0;
}

- (BOOL)responseDeviceFamilies:(id)a3 compatibleWithDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 stringForAMSDeviceFamilies];
  char v8 = [v5 containsObject:v7];

  v9 = [v6 bincompatPlatform];

  if (v9) {
    char v10 = [v5 containsObject:v9];
  }
  else {
    char v10 = 0;
  }
  char v11 = v8 | v10;

  return v11;
}

- (id)platformAttributes:(id)a3 forDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [v6 stringForAMSPlatformAttributes];
  char v8 = objc_msgSend(v5, "vs_dictionaryForKey:", v7);

  if (!v8)
  {
    v9 = [v6 bincompatOS];
    if (v9)
    {
      char v8 = objc_msgSend(v5, "vs_dictionaryForKey:", v9);
    }
    else
    {
      char v8 = 0;
    }
  }
  return v8;
}

- (id)transformedValue:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = (void *)MEMORY[0x263EFF940];
      uint64_t v6 = *MEMORY[0x263EFF4A0];
      v7 = (objc_class *)objc_opt_class();
      char v8 = NSStringFromClass(v7);
      [v5 raise:v6, @"Unexpectedly, value was %@, instead of NSDictionary.", v8 format];
    }
    id v9 = v4;
    char v10 = objc_msgSend(v9, "vs_stringForKey:", @"id");
    char v11 = objc_msgSend(v9, "vs_dictionaryForKey:", @"attributes");
    if (v11)
    {
      v12 = v11;
      v13 = objc_msgSend(v11, "vs_stringForKey:", @"name");
      v14 = objc_msgSend(v12, "vs_stringForKey:", @"artistName");
      v15 = objc_msgSend(v12, "vs_arrayOfStringsForKey:", @"deviceFamilies");
      v16 = [MEMORY[0x263F1E1F0] currentDevice];
      if ([(VSAMSAppsValueTransformer *)self responseDeviceFamilies:v15 compatibleWithDevice:v16])
      {
        v48 = v15;
        v46 = objc_msgSend(v12, "vs_dictionaryForKey:", @"platformAttributes");
        v47 = v16;
        v17 = -[VSAMSAppsValueTransformer platformAttributes:forDevice:](self, "platformAttributes:forDevice:");
        v51 = objc_msgSend(v17, "vs_stringForKey:", @"bundleId");
        v18 = objc_msgSend(v17, "vs_numberForKey:", @"hasInAppPurchases");
        unsigned int v35 = [v18 BOOLValue];

        v45 = objc_msgSend(v17, "vs_numberForKey:", @"isXROSCompatible");
        v44 = objc_msgSend(v17, "vs_dictionaryForKey:", @"artwork");
        v50 = objc_msgSend(v44, "vs_stringForKey:", @"url");
        v43 = objc_msgSend(v17, "vs_arrayForKey:", @"offers");
        v19 = [v43 firstObject];
        v41 = objc_msgSend(v19, "vs_arrayForKey:", @"assets");
        v40 = [v41 firstObject];
        v39 = objc_msgSend(v40, "vs_numberForKey:", @"size");
        v37 = v17;
        v38 = objc_msgSend(v17, "vs_numberForKey:", @"externalVersionId");
        v42 = v19;
        v36 = objc_msgSend(v19, "vs_stringForKey:", @"buyParams");
        v20 = objc_msgSend(v12, "vs_stringForKey:", @"url");
        v34 = objc_msgSend(v12, "vs_dictionaryForKey:", @"contentRatingsBySystem");
        v21 = objc_msgSend(v34, "vs_dictionaryForKey:", @"appsApple");
        objc_msgSend(v21, "vs_stringForKey:", @"name");
        v33 = v32 = v21;
        v31 = objc_msgSend(v21, "vs_numberForKey:", @"value");
        objc_msgSend(v9, "vs_dictionaryForKey:", @"meta");
        v30 = v22 = v13;
        v23 = objc_msgSend(v30, "vs_numberForKey:", @"defaultApp");
        uint64_t v24 = [v23 BOOLValue];

        v25 = objc_alloc_init(VSAppDescription);
        v49 = v22;
        [(VSAppDescription *)v25 setDisplayName:v22];
        [(VSAppDescription *)v25 setBundleID:v51];
        v26 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v10, "intValue"));
        [(VSAppDescription *)v25 setAdamID:v26];

        [(VSAppDescription *)v25 setSellerName:v14];
        if (v20)
        {
          v27 = [NSURL URLWithString:v20];
          [(VSAppDescription *)v25 setAppStoreURL:v27];
        }
        [(VSAppDescription *)v25 setRating:v33];
        [(VSAppDescription *)v25 setContentRank:v31];
        [(VSAppDescription *)v25 setOffersInAppPurchases:v35];
        [(VSAppDescription *)v25 setArtworkURLTemplate:v50];
        v28 = [v38 stringValue];
        [(VSAppDescription *)v25 setExternalVersionID:v28];

        [(VSAppDescription *)v25 setBuyParams:v36];
        [(VSAppDescription *)v25 setDefaultAppForProvider:v24];
        [(VSAppDescription *)v25 setDeviceFamilies:v48];
        [(VSAppDescription *)v25 setAppSizeBytes:v39];
        [(VSAppDescription *)v25 setVisionOSCompatible:v45];

        v15 = v48;
        v13 = v49;
        v16 = v47;
      }
      else
      {
        v25 = 0;
      }
    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end