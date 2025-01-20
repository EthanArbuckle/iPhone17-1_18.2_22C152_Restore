@interface PSYPlistFilter
+ (BOOL)isPlistObject:(id)a3;
+ (id)filteredPlistArray:(id)a3;
+ (id)filteredPlistDictionary:(id)a3;
@end

@implementation PSYPlistFilter

+ (BOOL)isPlistObject:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (isPlistObject__onceToken != -1) {
    dispatch_once(&isPlistObject__onceToken, &__block_literal_global_1);
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)isPlistObject__plistClasses;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

uint64_t __32__PSYPlistFilter_isPlistObject___block_invoke()
{
  v0 = (void *)MEMORY[0x263EFFA08];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  isPlistObject__plistClasses = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);

  return MEMORY[0x270F9A758]();
}

+ (id)filteredPlistDictionary:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v19 = v3;
      char v8 = 0;
      uint64_t v9 = *(void *)v21;
      while (1)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            char v8 = 1;
            goto LABEL_17;
          }
          long long v12 = [v5 objectForKeyedSubscript:v11];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = +[PSYPlistFilter filteredPlistDictionary:v12];
LABEL_13:
            uint64_t v14 = (void *)v13;
            if ((void *)v13 != v12) {
              char v8 = 1;
            }
            [v4 setObject:v13 forKeyedSubscript:v11];

            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = +[PSYPlistFilter filteredPlistArray:v12];
            goto LABEL_13;
          }
          if (+[PSYPlistFilter isPlistObject:v12]) {
            [v4 setObject:v12 forKeyedSubscript:v11];
          }
          else {
            char v8 = 1;
          }
LABEL_16:

LABEL_17:
          ++v10;
        }
        while (v7 != v10);
        uint64_t v15 = [v5 countByEnumeratingWithState:&v20 objects:v24 count:16];
        uint64_t v7 = v15;
        if (!v15)
        {

          v16 = v4;
          id v3 = v19;
          if (v8) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_27:
  v16 = v4;
  uint64_t v4 = v3;
LABEL_28:
  id v17 = v4;

  return v17;
}

+ (id)filteredPlistArray:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v5 = v3;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      id v18 = v3;
      char v8 = 0;
      uint64_t v9 = *(void *)v20;
      while (1)
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = +[PSYPlistFilter filteredPlistDictionary:v11];
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (+[PSYPlistFilter isPlistObject:v11]) {
                [v4 addObject:v11];
              }
              else {
                char v8 = 1;
              }
              goto LABEL_14;
            }
            uint64_t v12 = +[PSYPlistFilter filteredPlistArray:v11];
          }
          uint64_t v13 = (void *)v12;
          if (v12 != v11) {
            char v8 = 1;
          }
          [v4 addObject:v12];

LABEL_14:
          ++v10;
        }
        while (v7 != v10);
        uint64_t v14 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v7 = v14;
        if (!v14)
        {

          uint64_t v15 = v4;
          id v3 = v18;
          if (v8) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
      }
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
LABEL_24:
  uint64_t v15 = v4;
  uint64_t v4 = v3;
LABEL_25:
  id v16 = v4;

  return v16;
}

@end