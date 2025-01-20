@interface NFFuryCALogger
- (NFFuryCALogger)init;
@end

@implementation NFFuryCALogger

- (NFFuryCALogger)init
{
  v24.receiver = self;
  v24.super_class = (Class)NFFuryCALogger;
  id v2 = [(NFFuryCALogger *)&v24 init];
  if (v2)
  {
    id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm.analytics"];
    v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm.awd"];
    v6 = v5;
    if (*((void *)v2 + 1)) {
      BOOL v7 = v5 == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (!v7)
    {
      v8 = [v5 dictionaryRepresentation];
      v9 = [v8 allKeys];
      long long v25 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v10 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v10)
      {
        id v11 = v10;
        uint64_t v12 = *(void *)v26;
        do
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(void *)v26 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            v15 = [*((id *)v2 + 1) objectForKey:v14];
            if (v15)
            {
            }
            else
            {
              v16 = [v6 objectForKey:v14];

              if (v16)
              {
                v17 = (void *)*((void *)v2 + 1);
                v18 = [v6 objectForKey:v14];
                [v17 setObject:v18 forKey:v14];

                [v6 removeObjectForKey:v14];
              }
            }
          }
          id v11 = [v9 countByEnumeratingWithState:&v25 objects:v29 count:16];
        }
        while (v11);
      }
    }
    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v20 = dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.nfcacd.caLogger", v20);
    v22 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v21;

    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 2), kNFLOG_DISPATCH_SPECIFIC_KEY, (void *)3, 0);
  }
  return (NFFuryCALogger *)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_userDefault, 0);
}

@end