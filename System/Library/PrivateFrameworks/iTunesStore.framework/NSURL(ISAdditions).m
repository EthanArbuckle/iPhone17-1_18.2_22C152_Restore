@interface NSURL(ISAdditions)
+ (id)_URLQueryParameterValueAllowedCharacterSet;
+ (id)copyDictionaryForQueryString:()ISAdditions unescapedValues:;
+ (id)escapedStringForString:()ISAdditions;
+ (id)queryStringForDictionary:()ISAdditions escapedValues:;
+ (id)unescapedStringForString:()ISAdditions;
- (id)URLByAppendingQueryParameter:()ISAdditions value:;
- (id)schemeSwizzledURL;
- (id)urlByReplacingSchemeWithScheme:()ISAdditions;
- (id)urlBySettingQueryStringDictionary:()ISAdditions;
- (uint64_t)copyQueryStringDictionaryWithUnescapedValues:()ISAdditions;
- (uint64_t)isSafeExternalURL;
- (void)enumerateQueryWithBlock:()ISAdditions;
@end

@implementation NSURL(ISAdditions)

+ (id)copyDictionaryForQueryString:()ISAdditions unescapedValues:
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v17 = v5;
  v7 = [v5 componentsSeparatedByString:@"&"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = [*(id *)(*((void *)&v18 + 1) + 8 * v11) componentsSeparatedByString:@"="];
        if ([v12 count] == 2)
        {
          v13 = [v12 objectAtIndex:1];
          if (a4)
          {
            uint64_t v14 = [NSURL unescapedStringForString:v13];

            v13 = (void *)v14;
          }
          v15 = [v12 objectAtIndex:0];
          [v6 setObject:v13 forKey:v15];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)escapedStringForString:()ISAdditions
{
  id v4 = a3;
  id v5 = [a1 _URLQueryParameterValueAllowedCharacterSet];
  id v6 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v5];

  return v6;
}

+ (id)queryStringForDictionary:()ISAdditions escapedValues:
{
  id v5 = a3;
  id v6 = [MEMORY[0x263F089D8] string];
  v7 = [v5 keyEnumerator];
  uint64_t v8 = [v7 nextObject];
  if (v8)
  {
    uint64_t v9 = (void *)v8;
    int v10 = 0;
    do
    {
      uint64_t v11 = [v5 objectForKey:v9];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v12 = [v11 stringValue];

        uint64_t v11 = (void *)v12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (a4)
        {
          uint64_t v13 = [a1 escapedStringForString:v11];

          uint64_t v11 = (void *)v13;
        }
        if (v10) {
          uint64_t v14 = @"&%@=%@";
        }
        else {
          uint64_t v14 = @"%@=%@";
        }
        v15 = [NSString stringWithValidatedFormat:v14, @"%@%@", 0, v9, v11 validFormatSpecifiers error];
        [v6 appendString:v15];

        ++v10;
      }

      uint64_t v16 = [v7 nextObject];

      uint64_t v9 = (void *)v16;
    }
    while (v16);
  }
  if ([v6 length]) {
    v17 = v6;
  }
  else {
    v17 = 0;
  }
  id v18 = v17;

  return v18;
}

+ (id)unescapedStringForString:()ISAdditions
{
  id v3 = a3;
  id v4 = v3;
  if ([v3 length])
  {
    id v4 = [v3 stringByRemovingPercentEncoding];
  }

  return v4;
}

- (uint64_t)copyQueryStringDictionaryWithUnescapedValues:()ISAdditions
{
  id v4 = NSURL;
  id v5 = [a1 query];
  uint64_t v6 = [v4 copyDictionaryForQueryString:v5 unescapedValues:a3];

  return v6;
}

- (id)URLByAppendingQueryParameter:()ISAdditions value:
{
  uint64_t v6 = (objc_class *)MEMORY[0x263F089D8];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 alloc];
  int v10 = [a1 absoluteString];
  uint64_t v11 = (void *)[v9 initWithString:v10];

  uint64_t v12 = [a1 query];

  uint64_t v13 = [NSURL escapedStringForString:v7];

  if (v12) {
    uint64_t v14 = @"&%@=%@";
  }
  else {
    uint64_t v14 = @"?%@=%@";
  }
  objc_msgSend(v11, "appendFormat:", v14, v8, v13);

  v15 = [NSURL URLWithString:v11];

  return v15;
}

- (id)urlBySettingQueryStringDictionary:()ISAdditions
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_alloc(MEMORY[0x263F089D8]);
  uint64_t v6 = [a1 absoluteString];
  id v7 = (void *)[v5 initWithString:v6];

  uint64_t v8 = [a1 query];
  if (v8)
  {
    uint64_t v9 = [v7 rangeOfString:v8 options:4];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      objc_msgSend(v7, "deleteCharactersInRange:", v9, v10);
    }
  }
  if (([v7 hasSuffix:@"?"] & 1) == 0) {
    [v7 appendString:@"?"];
  }
  uint64_t v31 = v8;
  v33 = v7;
  id v11 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v12 = (id)[a1 copyQueryStringDictionaryWithUnescapedValues:0];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        id v18 = objc_msgSend(v12, "objectForKey:", v17, v31);
        [v11 setObject:v18 forKey:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v14);
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v19 = v4;
  uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v35 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void *)(*((void *)&v34 + 1) + 8 * j);
        v25 = NSURL;
        v26 = objc_msgSend(v19, "objectForKey:", v24, v31);
        v27 = [v25 escapedStringForString:v26];

        if (v27) {
          [v11 setObject:v27 forKey:v24];
        }
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v42 count:16];
    }
    while (v21);
  }

  v28 = [NSURL queryStringForDictionary:v11 escapedValues:0];
  if (v28) {
    [v33 appendString:v28];
  }
  v29 = objc_msgSend(NSURL, "URLWithString:", v33, v31);

  return v29;
}

- (uint64_t)isSafeExternalURL
{
  v1 = [a1 scheme];
  v2 = [v1 lowercaseString];

  if (v2)
  {
    id v3 = [MEMORY[0x263F7B358] contextWithBagType:0];
    id v4 = +[ISURLBagCache sharedCache];
    id v5 = [v4 URLBagForContext:v3];

    uint64_t v6 = [v5 valueForKey:@"mobile-url-handlers"];
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v6 containsObject:v2])
    {
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"http", @"https", @"itms", @"itms-apps", @"itms-books", @"its-music", @"its-videos", @"itmss", @"itms-appss", @"itms-bookss", @"mailto", @"prefs", @"fuse", @"music", @"musics", @"itms-gc", @"itms-gcs",
                     @"itms-itunesu",
                     @"itms-itunesus",
                     @"its-musics",
                     @"its-videoss",
                     @"itms-podcasts",
                     @"itms-podcastss",
                     @"shoebox",
                     @"itsradio",
                     @"livenation",
                     @"disneymoviesanywhere",
                     0);
      uint64_t v7 = [v8 containsObject:v2];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (id)schemeSwizzledURL
{
  id v1 = a1;
  v2 = [v1 scheme];
  if (([v2 isEqualToString:@"itms"] & 1) != 0
    || ([v2 isEqualToString:@"itms-apps"] & 1) != 0
    || ([v2 isEqualToString:@"itms-books"] & 1) != 0
    || ([v2 isEqualToString:@"itms-news"] & 1) != 0
    || ([v2 isEqualToString:@"itms-gc"] & 1) != 0
    || ([v2 isEqualToString:@"itms-itunesu"] & 1) != 0
    || ([v2 isEqualToString:@"its-music"] & 1) != 0
    || ([v2 isEqualToString:@"its-videos"] & 1) != 0
    || ([v2 isEqualToString:@"itms-podcasts"] & 1) != 0)
  {
    id v3 = @"http";
LABEL_11:
    id v4 = [v1 absoluteString];
    id v5 = objc_msgSend(v4, "substringFromIndex:", objc_msgSend(v2, "length"));
    uint64_t v6 = [(__CFString *)v3 stringByAppendingString:v5];

    uint64_t v7 = [NSURL URLWithString:v6];

    id v1 = (id)v7;
    goto LABEL_12;
  }
  if (([v2 isEqualToString:@"itmss"] & 1) != 0
    || ([v2 isEqualToString:@"itms-appss"] & 1) != 0
    || ([v2 isEqualToString:@"itms-bookss"] & 1) != 0
    || ([v2 isEqualToString:@"itms-newss"] & 1) != 0
    || ([v2 isEqualToString:@"itms-gcs"] & 1) != 0
    || ([v2 isEqualToString:@"itms-itunesus"] & 1) != 0
    || ([v2 isEqualToString:@"its-musics"] & 1) != 0
    || ([v2 isEqualToString:@"its-videoss"] & 1) != 0
    || ([v2 isEqualToString:@"itms-podcastss"] & 1) != 0
    || [v2 isEqualToString:@"itms-ui"])
  {
    id v3 = @"https";
    goto LABEL_11;
  }
LABEL_12:

  return v1;
}

- (id)urlByReplacingSchemeWithScheme:()ISAdditions
{
  id v4 = a3;
  id v5 = [a1 scheme];
  uint64_t v6 = [a1 absoluteString];
  uint64_t v7 = objc_msgSend(v6, "substringFromIndex:", objc_msgSend(v5, "length"));
  uint64_t v8 = [v4 stringByAppendingString:v7];

  uint64_t v9 = [NSURL URLWithString:v8];

  return v9;
}

- (void)enumerateQueryWithBlock:()ISAdditions
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [a1 query];
  uint64_t v6 = (void *)[v5 mutableCopy];

  objc_msgSend(v6, "replaceOccurrencesOfString:withString:options:range:", @";",
    @"&",
    0,
    0,
    [v6 length]);
  [v6 componentsSeparatedByString:@"&"];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(obj);
        }
        id v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) componentsSeparatedByString:@"="];
        if ([v11 count] == 2)
        {
          id v12 = [v11 objectAtIndex:0];
          uint64_t v13 = [v12 stringByRemovingPercentEncoding];

          uint64_t v14 = [v11 objectAtIndex:1];
          uint64_t v15 = [v14 stringByRemovingPercentEncoding];

          v4[2](v4, v13, v15);
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }
}

+ (id)_URLQueryParameterValueAllowedCharacterSet
{
  if (_URLQueryParameterValueAllowedCharacterSet_onceToken != -1) {
    dispatch_once(&_URLQueryParameterValueAllowedCharacterSet_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)_URLQueryParameterValueAllowedCharacterSet_characterSet;

  return v0;
}

@end