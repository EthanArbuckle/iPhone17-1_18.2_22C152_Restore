@interface NSString(NSString_StringWithPositionalSpecifiersFormat)
+ (id)stringWithPositionalSpecifiersFormat:()NSString_StringWithPositionalSpecifiersFormat arguments:;
@end

@implementation NSString(NSString_StringWithPositionalSpecifiersFormat)

+ (id)stringWithPositionalSpecifiersFormat:()NSString_StringWithPositionalSpecifiersFormat arguments:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v27 = 0;
  v7 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"%\\d\\$@" options:1 error:&v27];
  id v8 = v27;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v5];
  v21 = v7;
  objc_msgSend(v7, "matchesInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"));
  id obj = (id)objc_claimAutoreleasedReturnValue();
  v20 = v8;
  if (!v8)
  {
    if (obj)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      uint64_t v10 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v24 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = [*(id *)(*((void *)&v23 + 1) + 8 * i) range];
            v16 = objc_msgSend(v5, "substringWithRange:", v14, v15);
            v17 = (void *)[v16 mutableCopy];
            objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", @"%", &stru_1F0C40F10, 1, 0, objc_msgSend(v17, "length"));
            objc_msgSend(v17, "replaceOccurrencesOfString:withString:options:range:", @"$@", &stru_1F0C40F10, 1, 0, objc_msgSend(v17, "length"));
            v18 = objc_msgSend(v6, "objectAtIndexedSubscript:", (int)(objc_msgSend(v17, "intValue") - 1));
            objc_msgSend(v9, "replaceOccurrencesOfString:withString:options:range:", v16, v18, 1, 0, objc_msgSend(v9, "length"));
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
        }
        while (v11);
      }
    }
  }

  return v9;
}

@end