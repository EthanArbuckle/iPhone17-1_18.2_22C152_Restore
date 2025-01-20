@interface NSURL(QueryParameters)
- (id)URLByDeletingQueryParameterWithKey:()QueryParameters;
- (id)URLBySettingQueryParameterValue:()QueryParameters forKey:;
- (id)tuQueryParameters;
@end

@implementation NSURL(QueryParameters)

- (id)tuQueryParameters
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v2 = [a1 query];
  v3 = v2;
  if (!v2 || [v2 isEqual:&stru_1EECEA668])
  {
    v4 = (void *)MEMORY[0x1E4F29088];
    v5 = [a1 absoluteString];
    v6 = [v4 componentsWithString:v5];
    uint64_t v7 = [v6 query];

    v3 = (void *)v7;
    if (!v7) {
      goto LABEL_5;
    }
  }
  if (([v3 isEqual:&stru_1EECEA668] & 1) == 0)
  {
    v9 = [MEMORY[0x1E4F1CA60] dictionary];
    v24 = v3;
    v10 = [v3 componentsSeparatedByString:@"&"];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          v16 = [v15 componentsSeparatedByString:@"="];
          if ([v16 count] == 2)
          {
            v17 = [v16 objectAtIndexedSubscript:0];
            v18 = [v17 stringByRemovingPercentEncoding];

            v19 = [v16 objectAtIndexedSubscript:1];
            v20 = [v19 stringByRemovingPercentEncoding];

            if (v18) {
              BOOL v21 = v20 == 0;
            }
            else {
              BOOL v21 = 1;
            }
            if (!v21) {
              [v9 setObject:v20 forKeyedSubscript:v18];
            }
          }
          else if ([v16 count] == 1)
          {
            [v9 setObject:@"1" forKeyedSubscript:v15];
          }
          else
          {
            v22 = TUDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v15;
              _os_log_impl(&dword_19C496000, v22, OS_LOG_TYPE_DEFAULT, "[WARN] Couldn't parse query parameter: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v31 count:16];
      }
      while (v12);
    }
    v8 = (void *)[v9 copy];

    v3 = v24;
  }
  else
  {
LABEL_5:
    v8 = 0;
  }

  return v8;
}

- (id)URLBySettingQueryParameterValue:()QueryParameters forKey:
{
  v6 = (objc_class *)MEMORY[0x1E4F29088];
  id v7 = a4;
  id v8 = a3;
  v9 = (void *)[[v6 alloc] initWithURL:a1 resolvingAgainstBaseURL:0];
  uint64_t v10 = [v9 queryItems];
  uint64_t v11 = (void *)v10;
  uint64_t v12 = (void *)MEMORY[0x1E4F1CBF0];
  if (v10) {
    uint64_t v12 = (void *)v10;
  }
  id v13 = v12;

  v14 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:v7 value:v8];
  v15 = [v13 arrayByAddingObject:v14];

  [v9 setQueryItems:v15];
  v16 = [v9 URL];

  return v16;
}

- (id)URLByDeletingQueryParameterWithKey:()QueryParameters
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithURL:a1 resolvingAgainstBaseURL:0];
  v6 = [v5 queryItems];
  id v7 = (void *)MEMORY[0x1E4F28F60];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__NSURL_QueryParameters__URLByDeletingQueryParameterWithKey___block_invoke;
  v13[3] = &unk_1E58E5EA8;
  id v14 = v4;
  id v8 = v4;
  v9 = [v7 predicateWithBlock:v13];
  uint64_t v10 = [v6 filteredArrayUsingPredicate:v9];
  [v5 setQueryItems:v10];

  uint64_t v11 = [v5 URL];

  return v11;
}

@end