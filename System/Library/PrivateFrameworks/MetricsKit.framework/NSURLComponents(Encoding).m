@interface NSURLComponents(Encoding)
+ (id)mt_queryParameterStringForDictionary:()Encoding;
@end

@implementation NSURLComponents(Encoding)

+ (id)mt_queryParameterStringForDictionary:()Encoding
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v19 = (void *)[[a1 alloc] initWithString:&stru_26C95D008];
  v5 = objc_opt_new();
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v12 = objc_alloc(MEMORY[0x263F08BD0]);
        v13 = NSString;
        v14 = [v6 objectForKeyedSubscript:v11];
        v15 = [v13 stringWithFormat:@"%@", v14];
        v16 = (void *)[v12 initWithName:v11 value:v15];

        [v5 addObject:v16];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v8);
  }

  [v19 setQueryItems:v5];
  v17 = [v19 percentEncodedQuery];

  return v17;
}

@end