@interface NSURLRequest(WLKAdditions)
+ (id)wlk_requestWithURL:()WLKAdditions httpMethod:httpBody:httpHeaders:cachePolicy:timeout:;
+ (uint64_t)wlk_requestWithURL:()WLKAdditions httpMethod:httpHeaders:cachePolicy:timeout:;
@end

@implementation NSURLRequest(WLKAdditions)

+ (id)wlk_requestWithURL:()WLKAdditions httpMethod:httpBody:httpHeaders:cachePolicy:timeout:
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v13)
  {
    id v35 = v15;
    HIDWORD(v34) = [v14 isEqualToString:@"POST"];
    LODWORD(v34) = [v14 isEqualToString:@"PATCH"];
    v17 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:v13 cachePolicy:a8 timeoutInterval:a1];
    [v17 setHTTPMethod:v14];
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v18 = [v16 allKeys];
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v37 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
          v24 = objc_msgSend(v16, "objectForKey:", v23, v34);
          [v17 setValue:v24 forHTTPHeaderField:v23];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v41 count:16];
      }
      while (v20);
    }

    if ((HIDWORD(v34) | v34) == 1)
    {
      id v15 = v35;
      if (v35)
      {
        v25 = [v17 valueForHTTPHeaderField:@"Content-Type"];
        uint64_t v26 = [v25 length];

        if (!v26)
        {
          v27 = WLKNetworkingLogObject();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BA2E8000, v27, OS_LOG_TYPE_DEFAULT, "NSURLRequest-WLKAdditions: HTTP body specified without specifying Content-Type", buf, 2u);
          }
        }
        objc_msgSend(v17, "setHTTPBody:", v35, v34);
      }
      else if (HIDWORD(v34))
      {
        v30 = [MEMORY[0x1E4F29088] componentsWithURL:v13 resolvingAgainstBaseURL:0];
        v31 = [v13 query];
        if ([v31 length])
        {
          v32 = [v31 dataUsingEncoding:4];
          [v17 setHTTPBody:v32];

          [v17 setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
        }
        objc_msgSend(v30, "setQueryItems:", 0, v34);
        v33 = [v30 URL];
        [v17 setURL:v33];
      }
    }
    else
    {
      id v15 = v35;
    }
  }
  else
  {
    v28 = WLKNetworkingLogObject();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BA2E8000, v28, OS_LOG_TYPE_DEFAULT, "NSURLRequest-WLKAdditions: URL parameter is nil", buf, 2u);
    }

    v17 = 0;
  }

  return v17;
}

+ (uint64_t)wlk_requestWithURL:()WLKAdditions httpMethod:httpHeaders:cachePolicy:timeout:
{
  return objc_msgSend(a1, "wlk_requestWithURL:httpMethod:httpBody:httpHeaders:cachePolicy:timeout:", a3, a4, 0, a5, a6);
}

@end