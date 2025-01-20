@interface NSError
+ (id)nr_filteredPlistArray:(uint64_t)a1;
+ (id)nr_filteredPlistDictionary:(uint64_t)a1;
+ (uint64_t)nr_isPlistObject:(uint64_t)a1;
@end

@implementation NSError

+ (id)nr_filteredPlistDictionary:(uint64_t)a1
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (v2)
  {
    v3 = objc_opt_new();
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v18 = v2;
      char v7 = 0;
      uint64_t v8 = *(void *)v20;
      while (1)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v20 != v8) {
            objc_enumerationMutation(v4);
          }
          uint64_t v10 = *(void *)(*((void *)&v19 + 1) + 8 * v9);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            char v7 = 1;
            goto LABEL_17;
          }
          v11 = [v4 objectForKeyedSubscript:v10];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = +[NSError nr_filteredPlistDictionary:](MEMORY[0x1E4F28C58], v11);
LABEL_13:
            v13 = (void *)v12;
            if ((void *)v12 != v11) {
              char v7 = 1;
            }
            [v3 setObject:v12 forKeyedSubscript:v10];

            goto LABEL_16;
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v12 = +[NSError nr_filteredPlistArray:](MEMORY[0x1E4F28C58], v11);
            goto LABEL_13;
          }
          if (+[NSError nr_isPlistObject:](MEMORY[0x1E4F28C58], v11)) {
            [v3 setObject:v11 forKeyedSubscript:v10];
          }
          else {
            char v7 = 1;
          }
LABEL_16:

LABEL_17:
          ++v9;
        }
        while (v6 != v9);
        uint64_t v14 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
        uint64_t v6 = v14;
        if (!v14)
        {

          v15 = v3;
          id v2 = v18;
          if (v7) {
            goto LABEL_28;
          }
          goto LABEL_27;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
LABEL_27:
  v15 = v3;
  v3 = v2;
LABEL_28:
  id v16 = v3;

  return v16;
}

+ (uint64_t)nr_isPlistObject:(uint64_t)a1
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (qword_1EB30BB88 != -1) {
    dispatch_once(&qword_1EB30BB88, &__block_literal_global_17);
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = (id)_MergedGlobals_16;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_opt_isKindOfClass())
        {
          uint64_t v4 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v4;
}

uint64_t __47__NSError_NRSafeDescription__nr_isPlistObject___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, v5, v6, objc_opt_class(), 0);
  uint64_t v8 = _MergedGlobals_16;
  _MergedGlobals_16 = v7;

  return MEMORY[0x1F41817F8](v7, v8);
}

+ (id)nr_filteredPlistArray:(uint64_t)a1
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  self;
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      id v17 = v2;
      char v7 = 0;
      uint64_t v8 = *(void *)v19;
      while (1)
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v4);
          }
          long long v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = +[NSError nr_filteredPlistDictionary:](MEMORY[0x1E4F28C58], v10);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              if (+[NSError nr_isPlistObject:](MEMORY[0x1E4F28C58], v10)) {
                [v3 addObject:v10];
              }
              else {
                char v7 = 1;
              }
              goto LABEL_14;
            }
            uint64_t v11 = +[NSError nr_filteredPlistArray:](MEMORY[0x1E4F28C58], v10);
          }
          uint64_t v12 = (void *)v11;
          if ((void *)v11 != v10) {
            char v7 = 1;
          }
          [v3 addObject:v11];

LABEL_14:
          ++v9;
        }
        while (v6 != v9);
        uint64_t v13 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v6 = v13;
        if (!v13)
        {

          uint64_t v14 = v3;
          id v2 = v17;
          if (v7) {
            goto LABEL_25;
          }
          goto LABEL_24;
        }
      }
    }
  }
  else
  {
    uint64_t v3 = 0;
  }
LABEL_24:
  uint64_t v14 = v3;
  uint64_t v3 = v2;
LABEL_25:
  id v15 = v3;

  return v15;
}

@end