@interface ISURLBag
+ (id)copyAllowedAutomaticDownloadKindsInBagContext:(id)a3;
@end

@implementation ISURLBag

+ (id)copyAllowedAutomaticDownloadKindsInBagContext:(id)a3
{
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = objc_msgSend(+[ISURLBagCache sharedCache](ISURLBagCache, "sharedCache"), "URLBagForContext:", a3);
  id v6 = [v5 valueForKey:@"automatic-downloads2"];
  if (!v6) {
    id v6 = [v5 valueForKey:@"automatic-downloads"];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v6 objectForKey:@"configurations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          v11 = 0;
          do
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * (void)v11) objectForKey:@"media-types"];
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v4 addObjectsFromArray:v12];
            }
            v11 = (char *)v11 + 1;
          }
          while (v9 != v11);
          id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        }
        while (v9);
      }
    }
  }
  return v4;
}

@end