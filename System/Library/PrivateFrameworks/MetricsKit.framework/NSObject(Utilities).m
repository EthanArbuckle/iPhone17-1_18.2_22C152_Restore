@interface NSObject(Utilities)
- (id)mt_nullableValueForKey:()Utilities;
- (id)mt_nullableValueForKeyPath:()Utilities;
- (id)mt_nullableValueForKeyPathArray:()Utilities index:;
- (id)mt_nullableValueForKeyPathExt:()Utilities;
@end

@implementation NSObject(Utilities)

- (id)mt_nullableValueForKeyPathArray:()Utilities index:
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a1;
  if (v7)
  {
    do
    {
      if (a4 >= [v6 count]) {
        break;
      }
      v8 = [v6 objectAtIndexedSubscript:a4];
      if ([v8 hasSuffix:@"]"])
      {
        uint64_t v9 = [v8 rangeOfString:@"["];
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v15 = MTMetricsKitOSLog();
          v23 = v15;
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v8;
            _os_log_impl(&dword_218211000, v15, OS_LOG_TYPE_ERROR, "MetricsKit: Invalid keypath %@", buf, 0xCu);
          }
          v14 = 0;
          goto LABEL_29;
        }
        v23 = [v8 substringToIndex:v9];
        v24 = objc_msgSend(v8, "substringWithRange:", v9 + 1, objc_msgSend(v8, "length") - v9 - 2);
        v25 = [v7 valueForKeyPath:v23];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v14 = 0;
          goto LABEL_28;
        }
        if (![v24 length])
        {
          v14 = [MEMORY[0x263EFF980] array];
          long long v28 = 0u;
          long long v29 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v16 = v25;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v32 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v27;
            unint64_t v19 = a4 + 1;
            do
            {
              for (uint64_t i = 0; i != v17; ++i)
              {
                if (*(void *)v27 != v18) {
                  objc_enumerationMutation(v16);
                }
                v21 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "mt_nullableValueForKeyPathArray:index:", v6, v19);
                if (v21) {
                  [v14 addObject:v21];
                }
              }
              uint64_t v17 = [v16 countByEnumeratingWithState:&v26 objects:v32 count:16];
            }
            while (v17);
          }

LABEL_28:
LABEL_29:

          id v13 = v7;
          goto LABEL_30;
        }
        unint64_t v10 = [v24 integerValue];
        if ((v10 & 0x8000000000000000) == 0 && v10 < [v25 count])
        {
          uint64_t v11 = [v25 objectAtIndexedSubscript:v10];

          id v7 = (id)v11;
        }

        uint64_t v12 = (uint64_t)v7;
        id v7 = v23;
      }
      else
      {
        uint64_t v12 = [v7 valueForKeyPath:v8];
      }

      ++a4;
      id v7 = (id)v12;
    }
    while (v12);
  }
  id v13 = v7;
  v14 = v13;
LABEL_30:

  return v14;
}

- (id)mt_nullableValueForKeyPathExt:()Utilities
{
  v4 = [a3 componentsSeparatedByString:@"."];
  v5 = objc_msgSend(a1, "mt_nullableValueForKeyPathArray:index:", v4, 0);

  return v5;
}

- (id)mt_nullableValueForKeyPath:()Utilities
{
  id v4 = a3;
  v5 = [a1 valueForKeyPath:v4];

  return v5;
}

- (id)mt_nullableValueForKey:()Utilities
{
  id v4 = a3;
  v5 = [a1 valueForKey:v4];

  return v5;
}

@end