@interface WCRURLList
+ (id)_formattedStringFromURLString:(id)a3 fromBrowser:(BOOL)a4 removePort:(BOOL)a5;
- (BOOL)containsURLString:(id)a3;
- (NSMutableArray)urlStringList;
- (WCRURLList)init;
- (void)addURLString:(id)a3;
- (void)setUrlStringList:(id)a3;
@end

@implementation WCRURLList

- (WCRURLList)init
{
  v6.receiver = self;
  v6.super_class = (Class)WCRURLList;
  v2 = [(WCRURLList *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    urlStringList = v2->_urlStringList;
    v2->_urlStringList = v3;
  }
  return v2;
}

+ (id)_formattedStringFromURLString:(id)a3 fromBrowser:(BOOL)a4 removePort:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = [v7 stringByRemovingPercentEncoding];
  if (!v8) {
    id v8 = v7;
  }
  v9 = [v8 stringByAddingPercentEscapesUsingEncoding:4];

  v10 = [v9 lowercaseString];
  v11 = [NSURL URLWithString:v10];
  v12 = [v11 port];

  v13 = [v11 pathComponents];
  unint64_t v14 = [v13 count];

  id v15 = v10;
  v16 = v15;
  v17 = v15;
  if (v5)
  {
    v17 = v15;
    if (v12)
    {
      v18 = NSString;
      v19 = [v11 port];
      v20 = [v18 stringWithFormat:@":%@", v19];

      v17 = [v16 stringByReplacingOccurrencesOfString:v20 withString:&stru_270D81768];
    }
  }
  v21 = [v11 scheme];

  if (v21)
  {
    v22 = NSString;
    v23 = [v11 scheme];
    v24 = [v22 stringWithFormat:@"%@://", v23];

    uint64_t v25 = [v17 stringByReplacingOccurrencesOfString:v24 withString:&stru_270D81768];

    v17 = (void *)v25;
  }
  if ([v17 hasPrefix:@"www."])
  {
    uint64_t v26 = [v17 stringByReplacingOccurrencesOfString:@"www." withString:&stru_270D81768];

    v17 = (void *)v26;
  }
  if (v17 && ([v17 hasPrefix:@"."] & 1) == 0)
  {
    uint64_t v27 = [@"." stringByAppendingString:v17];

    v17 = (void *)v27;
  }
  if ((v14 < 2 || v6) && ([v17 hasSuffix:@"/"] & 1) == 0)
  {
    uint64_t v28 = [v17 stringByAppendingString:@"/"];

    v17 = (void *)v28;
  }

  return v17;
}

- (void)addURLString:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v8 = v4;
    if (([v4 isEqualToString:&stru_270D81768] & 1) == 0)
    {
      BOOL v5 = [(id)objc_opt_class() _formattedStringFromURLString:v8 fromBrowser:0 removePort:0];
      if (v5)
      {
        BOOL v6 = [(WCRURLList *)self urlStringList];
        id v7 = (void *)[v5 copy];
        [v6 addObject:v7];
      }
    }
  }
  MEMORY[0x270F9A758]();
}

- (BOOL)containsURLString:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(WCRURLList *)self urlStringList];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    id v7 = [(id)objc_opt_class() _formattedStringFromURLString:v4 fromBrowser:1 removePort:0];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v25 = self;
    obuint64_t j = [(WCRURLList *)self urlStringList];
    uint64_t v8 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v32;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ([v7 containsString:v12])
          {
            if ([v12 hasPrefix:@"http"])
            {
              id v13 = v12;
            }
            else
            {
              id v13 = [NSString stringWithFormat:@"http://%@", v12];
            }
            unint64_t v14 = v13;
            if ([v7 hasPrefix:@"http"])
            {
              id v15 = v7;
            }
            else
            {
              id v15 = [NSString stringWithFormat:@"http://%@", v7];
            }
            v16 = v15;
            v17 = [NSURL URLWithString:v14];
            v18 = [v17 host];

            v19 = [NSURL URLWithString:v16];
            v20 = [v19 host];

            if (v18 && ([v20 hasSuffix:v18] & 1) != 0)
            {

              LOBYTE(v21) = 1;
              goto LABEL_23;
            }
          }
        }
        uint64_t v9 = [obj countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    obuint64_t j = [(id)objc_opt_class() _formattedStringFromURLString:v4 fromBrowser:1 removePort:1];
    if ([obj isEqualToString:v7])
    {
      LOBYTE(v21) = 0;
    }
    else
    {
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      unint64_t v14 = [(WCRURLList *)v25 urlStringList];
      uint64_t v21 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v21)
      {
        uint64_t v23 = *(void *)v28;
        while (2)
        {
          for (uint64_t j = 0; j != v21; ++j)
          {
            if (*(void *)v28 != v23) {
              objc_enumerationMutation(v14);
            }
            if ([obj containsString:*(void *)(*((void *)&v27 + 1) + 8 * j)])
            {
              LOBYTE(v21) = 1;
              goto LABEL_23;
            }
          }
          uint64_t v21 = [v14 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
LABEL_23:
    }
  }
  else
  {
    LOBYTE(v21) = 0;
  }

  return v21;
}

- (NSMutableArray)urlStringList
{
  return (NSMutableArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrlStringList:(id)a3
{
}

- (void).cxx_destruct
{
}

@end