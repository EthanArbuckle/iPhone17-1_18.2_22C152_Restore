@interface INPersonDeduplicator
+ (id)dedupeINPersons:(id)a3;
@end

@implementation INPersonDeduplicator

+ (id)dedupeINPersons:(id)a3
{
  id v3 = a3;
  if ((unint64_t)[v3 count] > 1)
  {
    id v5 = objc_alloc_init((Class)NSMutableOrderedSet);
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v6 = v3;
    id v7 = [v6 countByEnumeratingWithState:&v42 objects:v53 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v43;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v43 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = [[INPersonWrapper alloc] initWithINPerson:*(void *)(*((void *)&v42 + 1) + 8 * i)];
          [v5 addObject:v11];
        }
        id v8 = [v6 countByEnumeratingWithState:&v42 objects:v53 count:16];
      }
      while (v8);
    }

    v12 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v6 count];
      id v14 = [v5 count];
      *(_DWORD *)buf = 134218240;
      id v50 = v13;
      __int16 v51 = 2048;
      id v52 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Before deduping: %ld, After deduping: %ld", buf, 0x16u);
    }

    v15 = [v5 firstObject];
    v16 = [v15 tuHandle];

    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v17 = v5;
    id v18 = [v17 countByEnumeratingWithState:&v38 objects:v48 count:16];
    if (v18)
    {
      id v19 = v18;
      uint64_t v20 = *(void *)v39;
      while (2)
      {
        for (j = 0; j != v19; j = (char *)j + 1)
        {
          if (*(void *)v39 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = [*(id *)(*((void *)&v38 + 1) + 8 * (void)j) tuHandle];
          int v23 = TUHandlesAreCanonicallyEqual();

          if (!v23)
          {

            id v25 = objc_alloc_init((Class)NSMutableArray);
            long long v34 = 0u;
            long long v35 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id v27 = v17;
            id v28 = [v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
            if (v28)
            {
              id v29 = v28;
              uint64_t v30 = *(void *)v35;
              do
              {
                for (k = 0; k != v29; k = (char *)k + 1)
                {
                  if (*(void *)v35 != v30) {
                    objc_enumerationMutation(v27);
                  }
                  v32 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * (void)k), "inPerson", (void)v34);
                  [v25 addObject:v32];
                }
                id v29 = [v27 countByEnumeratingWithState:&v34 objects:v46 count:16];
              }
              while (v29);
            }

            id v4 = [v25 copy];
            goto LABEL_31;
          }
        }
        id v19 = [v17 countByEnumeratingWithState:&v38 objects:v48 count:16];
        if (v19) {
          continue;
        }
        break;
      }
    }

    v24 = IntentHandlerDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "All persons have equivalent handle values", buf, 2u);
    }

    id v25 = [v17 firstObject];
    v26 = [v25 inPerson];
    v47 = v26;
    id v4 = +[NSArray arrayWithObjects:&v47 count:1];

LABEL_31:
  }
  else
  {
    id v4 = v3;
  }

  return v4;
}

@end