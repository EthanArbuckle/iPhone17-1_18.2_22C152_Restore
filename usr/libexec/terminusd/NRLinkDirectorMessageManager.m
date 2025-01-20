@interface NRLinkDirectorMessageManager
- (id)description;
@end

@implementation NRLinkDirectorMessageManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestMessageDictionary, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)description
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  id v22 = objc_alloc_init((Class)NSMutableDictionary);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v18 = v3;
  if (self) {
    latestMessageDictionary = self->_latestMessageDictionary;
  }
  else {
    latestMessageDictionary = 0;
  }
  id obj = [(NSMutableDictionary *)latestMessageDictionary allKeys];
  id v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v23)
  {
    uint64_t v20 = *(void *)v31;
    v21 = self;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v31 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v5;
        if (self) {
          v6 = self->_latestMessageDictionary;
        }
        else {
          v6 = 0;
        }
        uint64_t v24 = *(void *)(*((void *)&v30 + 1) + 8 * v5);
        v7 = -[NSMutableDictionary objectForKeyedSubscript:](v6, "objectForKeyedSubscript:");
        id v8 = objc_alloc_init((Class)NSMutableDictionary);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        v9 = [v7 allKeys];
        id v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v10)
        {
          id v11 = v10;
          uint64_t v12 = *(void *)v27;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v27 != v12) {
                objc_enumerationMutation(v9);
              }
              v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                v15 = [v7 objectForKeyedSubscript:v14];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  id v16 = sub_100024018([v14 unsignedCharValue]);
                  [v8 setObject:v15 forKeyedSubscript:v16];
                }
              }
            }
            id v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v11);
        }

        [v22 setObject:v8 forKeyedSubscript:v24];
        uint64_t v5 = v25 + 1;
        self = v21;
      }
      while ((id)(v25 + 1) != v23);
      id v23 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v23);
  }

  [v18 appendFormat:@"%@", v22];

  return v18;
}

@end