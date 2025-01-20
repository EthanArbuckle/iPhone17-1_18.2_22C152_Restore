@interface NSPropertyListSerialization(TSUtility)
+ (id)tsu_localizedPropertyListWithContentsOfURL:()TSUtility options:error:;
+ (id)tsu_propertyListWithContentsOfURL:()TSUtility options:error:;
+ (void)tsu_processLocalizedPropertyList:()TSUtility;
@end

@implementation NSPropertyListSerialization(TSUtility)

+ (id)tsu_propertyListWithContentsOfURL:()TSUtility options:error:
{
  v7 = objc_msgSend(MEMORY[0x263EFF950], "inputStreamWithURL:");
  v8 = v7;
  if (v7)
  {
    [v7 open];
    v9 = [MEMORY[0x263F08AC0] propertyListWithStream:v8 options:a4 format:0 error:a5];
    [v8 close];
  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x263F087E8], "tsu_fileReadUnknownErrorWithUserInfo:", 0);
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)tsu_processLocalizedPropertyList:()TSUtility
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 objectForKey:@"_LOCALIZABLE_"];
    if (v6) {
      [v5 removeObjectForKey:@"_LOCALIZABLE_"];
    }
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __75__NSPropertyListSerialization_TSUtility__tsu_processLocalizedPropertyList___block_invoke;
    v18[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v18[4] = a1;
    [v5 enumerateKeysAndObjectsUsingBlock:v18];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = [NSString stringWithUTF8String:"+[NSPropertyListSerialization(TSUtility) tsu_processLocalizedPropertyList:]"];
        v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSPropertyListSerialization_TSUtility.m"];
        +[OITSUAssertionHandler handleFailureInFunction:v7, v8, 47, 0, "Expected a dictionary as a child of %{public}@", @"_LOCALIZABLE_" file lineNumber isFatal description];

        +[OITSUAssertionHandler logBacktraceThrottled];
      }
      [v5 addEntriesFromDictionary:v6];
    }

LABEL_17:
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(a1, "tsu_processLocalizedPropertyList:", *(void *)(*((void *)&v14 + 1) + 8 * v13++));
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v11);
    }
    goto LABEL_17;
  }
LABEL_18:
}

+ (id)tsu_localizedPropertyListWithContentsOfURL:()TSUtility options:error:
{
  id v8 = a3;
  if ((unint64_t)(a4 - 1) >= 2)
  {
    id v9 = [NSString stringWithUTF8String:"+[NSPropertyListSerialization(TSUtility) tsu_localizedPropertyListWithContentsOfURL:options:error:]"];
    uint64_t v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/NSPropertyListSerialization_TSUtility.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:65 isFatal:0 description:"Need mutable containers to process a localizable property list"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  uint64_t v11 = objc_msgSend(a1, "tsu_propertyListWithContentsOfURL:options:error:", v8, a4, a5);
  objc_msgSend(a1, "tsu_processLocalizedPropertyList:", v11);

  return v11;
}

@end