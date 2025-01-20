@interface NSURL(WLKAdditions)
+ (id)wlk_URLWithServerConfig:()WLKAdditions endpoint:relativeToBaseURL:queryParameters:suppressParameterEncoding:;
+ (id)wlk_URLWithServerConfig:()WLKAdditions routeName:queryParameters:suppressParameterEncoding:;
+ (id)wlk_sortedQueryItemsFromDictionary:()WLKAdditions;
@end

@implementation NSURL(WLKAdditions)

+ (id)wlk_URLWithServerConfig:()WLKAdditions endpoint:relativeToBaseURL:queryParameters:suppressParameterEncoding:
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  if (a5)
  {
    v15 = WLKBaseURLReturningError();
    id v16 = 0;
    if (v15)
    {
      v29[0] = v13;
      v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];
      objc_msgSend(v15, "wlk_stringByAppendingPathComponents:", v17);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v16;
        _os_log_impl(&dword_1BA2E8000, v17, OS_LOG_TYPE_DEFAULT, "NSURL-WLKAdditions: Failed to fetch baseURL: %@", buf, 0xCu);
      }
      id v18 = 0;
    }

    if (!v18) {
      goto LABEL_16;
    }
  }
  else
  {
    id v18 = v13;
    if (!v18)
    {
LABEL_16:
      v20 = WLKNetworkingLogObject();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v13;
        _os_log_impl(&dword_1BA2E8000, v20, OS_LOG_TYPE_DEFAULT, "NSURL-WLKAdditions: Could not construct url with endpoint: %@", buf, 0xCu);
      }
      v25 = 0;
      goto LABEL_19;
    }
  }
  v19 = [v12 requiredRequestKeyValuePairsDictionary:v18];
  v20 = [v19 mutableCopy];

  if (!v20)
  {
    v20 = [MEMORY[0x1E4F1CA60] dictionary];
  }
  v21 = +[WLKLocationManager defaultLocationManager];
  v22 = [v21 _locationQueryParameters];
  [v20 addEntriesFromDictionary:v22];

  [v20 addEntriesFromDictionary:v14];
  v23 = objc_msgSend(a1, "wlk_sortedQueryItemsFromDictionary:", v20);
  v24 = (void *)[objc_alloc(MEMORY[0x1E4F29088]) initWithString:v18];
  if ([v23 count])
  {
    if (a7) {
      [v24 setPercentEncodedQueryItems:v23];
    }
    else {
      [v24 setQueryItems:v23];
    }
  }
  v25 = [v24 URL];

LABEL_19:

  return v25;
}

+ (id)wlk_sortedQueryItemsFromDictionary:()WLKAdditions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v4 = [v3 allKeys];
  v5 = [v4 sortedArrayUsingSelector:sel_caseInsensitiveCompare_];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v21;
    *(void *)&long long v7 = 138412290;
    long long v18 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        id v12 = objc_msgSend(v3, "objectForKey:", v11, v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v13 = v12;
          goto LABEL_10;
        }
        if (objc_opt_respondsToSelector())
        {
          id v13 = [v12 stringValue];
LABEL_10:
          id v14 = v13;
          if (v13) {
            goto LABEL_11;
          }
          goto LABEL_19;
        }
        if ([MEMORY[0x1E4F28D90] isValidJSONObject:v12])
        {
          id v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v12 options:0 error:0];
          id v14 = v16
              ? [[NSString alloc] initWithData:v16 encoding:4]
              : 0;

          if (v14)
          {
LABEL_11:
            v15 = (void *)[objc_alloc(MEMORY[0x1E4F290C8]) initWithName:v11 value:v14];
            if (v15) {
              [v19 addObject:v15];
            }

            goto LABEL_21;
          }
        }
LABEL_19:
        id v14 = WLKNetworkingLogObject();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = v18;
          v25 = v12;
          _os_log_impl(&dword_1BA2E8000, v14, OS_LOG_TYPE_DEFAULT, "NSURL-WLKAdditions: Invalid query param: %@", buf, 0xCu);
        }
LABEL_21:
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v8);
  }

  return v19;
}

+ (id)wlk_URLWithServerConfig:()WLKAdditions routeName:queryParameters:suppressParameterEncoding:
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v10 serverRouteNamed:v11];
  id v14 = v13;
  if (v13)
  {
    v15 = [v13 requiredKVPType];
    id v16 = [v10 requiredRequestKeyValuePairsForType:v15];
    v17 = (void *)[v16 mutableCopy];

    if (!v17)
    {
      v17 = [MEMORY[0x1E4F1CA60] dictionary];
    }
    if ([v14 requiresLocation])
    {
      long long v18 = +[WLKLocationManager defaultLocationManager];
      id v19 = [v18 _locationQueryParameters];
      [v17 addEntriesFromDictionary:v19];
    }
    [v17 addEntriesFromDictionary:v12];
    long long v20 = objc_msgSend(a1, "wlk_sortedQueryItemsFromDictionary:", v17);
    id v21 = objc_alloc(MEMORY[0x1E4F29088]);
    long long v22 = [v14 URL];
    long long v23 = (void *)[v21 initWithURL:v22 resolvingAgainstBaseURL:0];

    if ([v20 count])
    {
      if (a6) {
        [v23 setPercentEncodedQueryItems:v20];
      }
      else {
        [v23 setQueryItems:v20];
      }
    }
    v25 = [v23 URL];
  }
  else
  {
    v24 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v27 = 138412290;
      id v28 = v11;
      _os_log_impl(&dword_1BA2E8000, v24, OS_LOG_TYPE_DEFAULT, "NSURL-WLKAdditions: Could not construct url with route name: %@", (uint8_t *)&v27, 0xCu);
    }

    v25 = 0;
  }

  return v25;
}

@end