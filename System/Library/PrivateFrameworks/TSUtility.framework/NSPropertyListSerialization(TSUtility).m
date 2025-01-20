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
    objc_msgSend(MEMORY[0x263F087E8], "tsu_IOErrorWithCode:", 0);
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
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 objectForKey:@"_LOCALIZABLE_"];
    if (v6) {
      [v5 removeObjectForKey:@"_LOCALIZABLE_"];
    }
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __75__NSPropertyListSerialization_TSUtility__tsu_processLocalizedPropertyList___block_invoke;
    v19[3] = &__block_descriptor_40_e15_v32__0_8_16_B24l;
    v19[4] = a1;
    [v5 enumerateKeysAndObjectsUsingBlock:v19];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v7 = +[TSUAssertionHandler currentHandler];
        v8 = [NSString stringWithUTF8String:"+[NSPropertyListSerialization(TSUtility) tsu_processLocalizedPropertyList:]"];
        v9 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSPropertyListSerialization_TSUtility.m"];
        [v7 handleFailureInFunction:v8, v9, 52, @"Expected a dictionary as a child of %@", @"_LOCALIZABLE_" file lineNumber description];
      }
      [v5 addEntriesFromDictionary:v6];
    }

LABEL_17:
    goto LABEL_18;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v4;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v16;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(a1, "tsu_processLocalizedPropertyList:", *(void *)(*((void *)&v15 + 1) + 8 * v14++));
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v20 count:16];
      }
      while (v12);
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
    v9 = +[TSUAssertionHandler currentHandler];
    id v10 = [NSString stringWithUTF8String:"+[NSPropertyListSerialization(TSUtility) tsu_localizedPropertyListWithContentsOfURL:options:error:]"];
    uint64_t v11 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/NSPropertyListSerialization_TSUtility.m"];
    [v9 handleFailureInFunction:v10 file:v11 lineNumber:73 description:@"Need mutable containers to process a localizable property list"];
  }
  uint64_t v12 = objc_msgSend(a1, "tsu_propertyListWithContentsOfURL:options:error:", v8, a4, a5);
  objc_msgSend(a1, "tsu_processLocalizedPropertyList:", v12);

  return v12;
}

@end