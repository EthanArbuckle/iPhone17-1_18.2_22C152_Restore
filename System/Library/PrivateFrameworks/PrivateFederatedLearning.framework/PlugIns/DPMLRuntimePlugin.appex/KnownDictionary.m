@interface KnownDictionary
+ (id)processTokens:(id)a3 knownTokensFile:(id)a4 unknownTokens:(id)a5 error:(id *)a6;
+ (void)recordData:(id)a3 baseKey:(id)a4 metadata:(id)a5;
@end

@implementation KnownDictionary

+ (id)processTokens:(id)a3 knownTokensFile:(id)a4 unknownTokens:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v32 = a5;
  v11 = [[SqliteClient alloc] initWithFile:v10 error:a6];
  if (v11)
  {
    id v29 = v10;
    id v31 = +[NSMutableArray array];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v30 = v9;
    id v12 = v9;
    id v13 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v34;
      uint64_t v16 = 0xFFFFFFFFLL;
      do
      {
        v17 = 0;
        do
        {
          if (*(void *)v34 != v15) {
            objc_enumerationMutation(v12);
          }
          v18 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v17);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && [v18 length])
          {
            id v19 = (id)[(SqliteClient *)v11 findWord:v18 error:a6];
            if (v16 == v19)
            {
              if (v32) {
                [v32 addObject:v18];
              }
            }
            else
            {
              id v20 = v19;
              id v21 = v12;
              uint64_t v22 = v16;
              v23 = v11;
              v24 = a6;
              v25 = +[_PFLLog extension];
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                v38 = v18;
                __int16 v39 = 1024;
                int v40 = (int)v20;
                _os_log_debug_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "Index of %@ is %i", buf, 0x12u);
              }

              v26 = +[NSNumber numberWithInt:v20];
              [v31 addObject:v26];

              a6 = v24;
              v11 = v23;
              uint64_t v16 = v22;
              id v12 = v21;
            }
          }
          v17 = (char *)v17 + 1;
        }
        while (v14 != v17);
        id v14 = [v12 countByEnumeratingWithState:&v33 objects:v41 count:16];
      }
      while (v14);
    }

    id v10 = v29;
    id v9 = v30;
  }
  else
  {
    v27 = +[_PFLLog extension];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_10001FB20(v27);
    }

    if (a6)
    {
      +[_DPMLRuntimeError errorWithCode:300 description:@"Failed to load sqlite DB."];
      id v31 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v31 = 0;
    }
  }

  return v31;
}

+ (void)recordData:(id)a3 baseKey:(id)a4 metadata:(id)a5
{
  id v7 = a4;
  LODWORD(a3) = +[FedStatsDataEncoder record:a3 metadata:a5 baseKey:v7];
  v8 = +[_PFLLog extension];
  id v9 = v8;
  if (a3)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Record %@ data succeed.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    sub_10001FB64(v9);
  }
}

@end