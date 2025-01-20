@interface RUISetupBridgeTermsStyle
- (void)applyToObjectModel:(id)a3;
@end

@implementation RUISetupBridgeTermsStyle

- (void)applyToObjectModel:(id)a3
{
  id v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)RUISetupBridgeTermsStyle;
  [(RUISetupBridgeTermsStyle *)&v41 applyToObjectModel:v4];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = [v4 allPages];
  id v5 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v38;
    uint64_t v24 = *(void *)v38;
    do
    {
      v8 = 0;
      id v25 = v6;
      do
      {
        if (*(void *)v38 != v7) {
          objc_enumerationMutation(obj);
        }
        v9 = *(void **)(*((void *)&v37 + 1) + 8 * (void)v8);
        if ([v9 hasTableView])
        {
          v27 = v8;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          v10 = [v9 tableViewOM];
          v11 = [v10 sections];

          id v28 = v11;
          id v12 = [v11 countByEnumeratingWithState:&v33 objects:v43 count:16];
          if (v12)
          {
            id v13 = v12;
            uint64_t v14 = *(void *)v34;
            do
            {
              for (i = 0; i != v13; i = (char *)i + 1)
              {
                if (*(void *)v34 != v14) {
                  objc_enumerationMutation(v28);
                }
                v16 = *(void **)(*((void *)&v33 + 1) + 8 * i);
                long long v29 = 0u;
                long long v30 = 0u;
                long long v31 = 0u;
                long long v32 = 0u;
                v17 = [v16 rows];
                id v18 = [v17 countByEnumeratingWithState:&v29 objects:v42 count:16];
                if (v18)
                {
                  id v19 = v18;
                  uint64_t v20 = *(void *)v30;
                  do
                  {
                    for (j = 0; j != v19; j = (char *)j + 1)
                    {
                      if (*(void *)v30 != v20) {
                        objc_enumerationMutation(v17);
                      }
                      v22 = [*(id *)(*((void *)&v29 + 1) + 8 * (void)j) tableCell];
                      v23 = +[UIColor blackColor];
                      [v22 setBackgroundColor:v23];
                    }
                    id v19 = [v17 countByEnumeratingWithState:&v29 objects:v42 count:16];
                  }
                  while (v19);
                }
              }
              id v13 = [v28 countByEnumeratingWithState:&v33 objects:v43 count:16];
            }
            while (v13);
          }

          uint64_t v7 = v24;
          id v6 = v25;
          v8 = v27;
        }
        v8 = (char *)v8 + 1;
      }
      while (v8 != v6);
      id v6 = [obj countByEnumeratingWithState:&v37 objects:v44 count:16];
    }
    while (v6);
  }
}

@end