@interface MTDBUtil
+ (BOOL)isSupportedUrlString:(id)a3;
@end

@implementation MTDBUtil

+ (BOOL)isSupportedUrlString:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 length]) {
    goto LABEL_26;
  }
  v4 = [v3 lowercaseString];
  if ([v4 hasPrefix:@"https://"])
  {
    unint64_t v5 = [v3 length];

    if (v5 > 8) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v6 = [v3 lowercaseString];
  if ([v6 hasPrefix:@"http://"])
  {
    unint64_t v7 = [v3 length];

    if (v7 > 7) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v8 = [v3 lowercaseString];
  if ([v8 hasPrefix:@"file://"])
  {
    unint64_t v9 = [v3 length];

    if (v9 > 7)
    {
LABEL_12:
      BOOL v10 = 1;
      goto LABEL_29;
    }
  }
  else
  {
  }
  if ((unint64_t)[v3 length] < 4)
  {
LABEL_26:
    BOOL v10 = 0;
    goto LABEL_29;
  }
  if (!isSupportedUrlString____url_types)
  {
    v11 = [MEMORY[0x1E4F28B50] mainBundle];
    v12 = [v11 infoDictionary];

    v13 = objc_opt_new();
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = objc_msgSend(v12, "objectForKey:", @"CFBundleURLTypes", 0);
    uint64_t v15 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v28 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = [*(id *)(*((void *)&v27 + 1) + 8 * i) objectForKey:@"CFBundleURLSchemes"];
          [v13 addObjectsFromArray:v19];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v16);
    }

    uint64_t v20 = [v13 copy];
    v21 = (void *)isSupportedUrlString____url_types;
    isSupportedUrlString____url_types = v20;
  }
  v22 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
  v23 = [v22 scheme];
  v24 = [v23 lowercaseString];

  if ([(id)isSupportedUrlString____url_types containsObject:v24])
  {
    unint64_t v25 = [v3 length];
    BOOL v10 = v25 > [v24 length] + 3;
  }
  else
  {
    BOOL v10 = 0;
  }

LABEL_29:
  return v10;
}

@end