@interface MSDBasePrepareOperation
- (BOOL)_prepareStagingArea;
- (id)methodSelectors;
- (int64_t)type;
@end

@implementation MSDBasePrepareOperation

- (id)methodSelectors
{
  if (+[MSDOperationContext downloadOnly])
  {
    v2 = objc_opt_new();
  }
  else
  {
    v3 = +[NSValue valueWithPointer:"_prepareStagingArea"];
    v2 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v3, 0);
  }

  return v2;
}

- (int64_t)type
{
  return 1;
}

- (BOOL)_prepareStagingArea
{
  v3 = [(MSDOperation *)self context];
  v4 = [v3 stagingRootPath];
  v5 = +[NSMutableArray arrayWithObject:v4];

  v6 = +[NSFileManager defaultManager];
  v7 = [(MSDOperation *)self context];
  v8 = [v7 secondaryStagingRootPath];

  if (v8)
  {
    v9 = [(MSDOperation *)self context];
    v10 = [v9 secondaryStagingRootPath];
    [v5 addObject:v10];
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v12)
  {
    id v13 = v12;
    v14 = 0;
    uint64_t v15 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v25 != v15) {
          objc_enumerationMutation(v11);
        }
        uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        if (([v6 fileExistsAtPath:v17] & 1) == 0)
        {
          id v23 = v14;
          unsigned __int8 v18 = [v6 createDirectoryAtPath:v17 withIntermediateDirectories:1 attributes:0 error:&v23];
          id v19 = v23;

          if ((v18 & 1) == 0)
          {
            v21 = sub_100068600();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_1000DE4DC(v17, v19, v21);
            }

            BOOL v20 = 0;
            goto LABEL_18;
          }
          v14 = v19;
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (v13) {
        continue;
      }
      break;
    }
    BOOL v20 = 1;
    id v19 = v14;
  }
  else
  {
    id v19 = 0;
    BOOL v20 = 1;
  }
LABEL_18:

  return v20;
}

@end