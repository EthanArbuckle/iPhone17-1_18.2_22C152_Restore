@interface NSURL(IMAdditions)
+ (id)percentEncodedStringToDictionary:()IMAdditions;
+ (id)pf_dictionaryToEscapedQueryString:()IMAdditions;
- (id)pf_URLByAppendingHashString:()IMAdditions;
- (id)pf_URLByAppendingQueryString:()IMAdditions;
- (id)pf_cleanUrlToEpisodeGuid;
- (id)pf_unescapedPath;
- (uint64_t)pf_cleanUrlToChannelStoreId;
- (uint64_t)pf_cleanUrlToSlashStoreId;
- (uint64_t)pf_cleanUrlToStoreId;
- (uint64_t)pf_cleanUrlToStoreTrackId;
@end

@implementation NSURL(IMAdditions)

- (uint64_t)pf_cleanUrlToStoreId
{
  uint64_t v2 = objc_msgSend(a1, "pf_cleanUrlToSlashStoreId");
  if (!v2)
  {
    v3 = [a1 absoluteString];
    v4 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"id=+(\\d*)" options:0 error:0];
    v5 = objc_msgSend(v4, "firstMatchInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
    v6 = v5;
    if (v5)
    {
      uint64_t v7 = [v5 rangeAtIndex:1];
      v9 = objc_msgSend(v3, "substringWithRange:", v7, v8);
      uint64_t v2 = [v9 longLongValue];
    }
    else
    {
      uint64_t v2 = 0;
    }
  }
  return v2;
}

- (uint64_t)pf_cleanUrlToSlashStoreId
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"/id+(\\d*)" options:0 error:0];
  v3 = objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 rangeAtIndex:1];
    uint64_t v7 = objc_msgSend(v1, "substringWithRange:", v5, v6);
    uint64_t v8 = [v7 longLongValue];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (uint64_t)pf_cleanUrlToChannelStoreId
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"podcast-channels/+(\\d*)" options:0 error:0];
  uint64_t v3 = objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  if (v3)
  {
    v4 = (void *)v3;
    uint64_t v5 = v2;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"channel/.+/(?:id)?(\\d+)" options:0 error:0];

    uint64_t v6 = objc_msgSend(v5, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
    if (!v6)
    {
      uint64_t v10 = 0;
      goto LABEL_6;
    }
    v4 = (void *)v6;
  }
  uint64_t v7 = [v4 rangeAtIndex:1];
  v9 = objc_msgSend(v1, "substringWithRange:", v7, v8);
  uint64_t v10 = [v9 longLongValue];

LABEL_6:
  return v10;
}

+ (id)percentEncodedStringToDictionary:()IMAdditions
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v5 = (void *)[v3 length];
  v23 = v3;
  if (v5)
  {
    uint64_t v5 = [v3 componentsSeparatedByString:@"&"];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    v9 = @"=";
    unint64_t v10 = 0x1E4F1C000uLL;
    do
    {
      uint64_t v11 = 0;
      uint64_t v24 = v7;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        v12 = [*(id *)(*((void *)&v26 + 1) + 8 * v11) componentsSeparatedByString:v9];
        v13 = [v12 objectAtIndexedSubscript:0];
        v14 = [v13 stringByRemovingPercentEncoding];

        v15 = [*(id *)(v10 + 2712) null];
        if ((unint64_t)[v12 count] >= 2)
        {
          [v12 objectAtIndexedSubscript:1];
          uint64_t v16 = v8;
          v17 = v4;
          v18 = v9;
          v20 = unint64_t v19 = v10;
          uint64_t v21 = [v20 stringByRemovingPercentEncoding];

          unint64_t v10 = v19;
          v9 = v18;
          v4 = v17;
          uint64_t v8 = v16;
          uint64_t v7 = v24;
          v15 = (void *)v21;
        }
        [v4 setObject:v15 forKey:v14];

        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)pf_dictionaryToEscapedQueryString:()IMAdditions
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F28E78] string];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = objc_msgSend(v3, "keyEnumerator", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        unint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v4 length]) {
          [v4 appendString:@"&"];
        }
        uint64_t v11 = objc_msgSend(v10, "pf_stringWithPercentEscape");
        [v4 appendString:v11];

        v12 = [v3 objectForKey:v10];
        v13 = [MEMORY[0x1E4F1CA98] null];

        if (v12 != v13)
        {
          [v4 appendString:@"="];
          v14 = objc_msgSend(v12, "pf_stringWithPercentEscape");
          [v4 appendString:v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)pf_URLByAppendingHashString:()IMAdditions
{
  v4 = (void *)MEMORY[0x1E4F29088];
  id v5 = a3;
  uint64_t v6 = [v4 componentsWithURL:a1 resolvingAgainstBaseURL:0];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = [v6 percentEncodedFragment];
  v9 = [v7 percentEncodedStringToDictionary:v8];

  [v9 addEntriesFromDictionary:v5];
  unint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_dictionaryToEscapedQueryString:", v9);
  [v6 setPercentEncodedFragment:v10];

  uint64_t v11 = [v6 URL];

  return v11;
}

- (id)pf_URLByAppendingQueryString:()IMAdditions
{
  v4 = (void *)MEMORY[0x1E4F29088];
  id v5 = a3;
  uint64_t v6 = [v4 componentsWithURL:a1 resolvingAgainstBaseURL:0];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v8 = [v6 percentEncodedQuery];
  v9 = [v7 percentEncodedStringToDictionary:v8];

  [v9 addEntriesFromDictionary:v5];
  unint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CB10], "pf_dictionaryToEscapedQueryString:", v9);
  [v6 setPercentEncodedQuery:v10];

  uint64_t v11 = [v6 URL];

  return v11;
}

- (id)pf_unescapedPath
{
  v1 = [a1 path];
  uint64_t v2 = [v1 stringByRemovingPercentEscapes];

  if ([v2 hasPrefix:@"/"])
  {
    uint64_t v3 = [v2 substringFromIndex:1];

    uint64_t v2 = (void *)v3;
  }
  return v2;
}

- (uint64_t)pf_cleanUrlToStoreTrackId
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"i=+(\\d*)" options:0 error:0];
  uint64_t v3 = objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 rangeAtIndex:1];
    uint64_t v7 = objc_msgSend(v1, "substringWithRange:", v5, v6);
    uint64_t v8 = [v7 longLongValue];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)pf_cleanUrlToEpisodeGuid
{
  v1 = [a1 absoluteString];
  uint64_t v2 = [MEMORY[0x1E4F28FD8] regularExpressionWithPattern:@"episodeGuid=+([^&]+)" options:0 error:0];
  uint64_t v3 = objc_msgSend(v2, "firstMatchInString:options:range:", v1, 0, 0, objc_msgSend(v1, "length"));
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 rangeAtIndex:1];
    uint64_t v7 = objc_msgSend(v1, "substringWithRange:", v5, v6);
    uint64_t v8 = [v7 stringByRemovingPercentEncoding];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

@end