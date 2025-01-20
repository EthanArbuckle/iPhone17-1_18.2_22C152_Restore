@interface ErrorActionHandler
+ (void)performAction:(id)a3 inContext:(id)a4;
@end

@implementation ErrorActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    v7 = [v5 title];

    if (v7)
    {
      v8 = [v5 title];
      [v6 setObject:v8 forKeyedSubscript:@"kMapsInterruptionTitle"];
    }
    v9 = [v5 message];

    if (v9)
    {
      v10 = [v5 message];
      [v6 setObject:v10 forKeyedSubscript:@"kMapsInterruptionMessage"];
    }
    v11 = [v5 options];
    id v12 = [v11 count];

    if (v12)
    {
      v27 = v6;
      id v13 = objc_alloc_init((Class)NSMutableArray);
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v28 = v5;
      v14 = [v5 options];
      id v15 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v30;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v30 != v17) {
              objc_enumerationMutation(v14);
            }
            v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            v20 = [v19 title];
            id v21 = [v19 cancels];
            v22 = [v19 handler];
            v23 = +[MapsInterruptionAction actionWithTitle:v20 cancels:v21 handler:v22];

            [v13 addObject:v23];
          }
          id v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
        }
        while (v16);
      }

      id v24 = [v13 copy];
      id v6 = v27;
      [v27 setObject:v24 forKeyedSubscript:@"kMapsInterruptionActions"];

      id v5 = v28;
    }
    v25 = +[UIApplication sharedMapsDelegate];
    id v26 = [v6 copy];
    [v25 interruptApplicationWithKind:3 userInfo:v26 completionHandler:0];
  }
}

@end