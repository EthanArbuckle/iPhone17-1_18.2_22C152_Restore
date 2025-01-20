@interface RAPCategoriesDownloader
+ (id)adjustedPreferredLanguages;
+ (id)preferredTranslationInTitles:(id)a3 givenPreferredLanguagesList:(id)a4;
+ (void)fetchCategories:(id)a3;
@end

@implementation RAPCategoriesDownloader

+ (void)fetchCategories:(id)a3
{
  id v4 = a3;
  v5 = GEOURLString();
  v6 = +[NSURL URLWithString:v5];

  v7 = +[NSURLRequest requestWithURL:v6];
  v8 = +[NSURLSession sharedSession];
  v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  v13 = sub_10065E590;
  v14 = &unk_1012F3640;
  id v15 = v4;
  id v16 = a1;
  id v9 = v4;
  v10 = [v8 dataTaskWithRequest:v7 completionHandler:&v11];
  [v10 resume:v11, v12, v13, v14];
}

+ (id)adjustedPreferredLanguages
{
  v2 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v3 = +[NSLocale preferredLanguages];
  id v4 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v9 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:v8];
        v10 = [v9 objectForKey:NSLocaleLanguageCode];
        if (([v10 isEqualToString:v8] & 1) == 0)
        {
          [v2 addObject:v8];
          unsigned __int8 v11 = [v8 hasPrefix:@"zh-Hant"];
          CFStringRef v12 = @"zh-TW";
          if ((v11 & 1) != 0
            || (v13 = [v8 hasPrefix:@"zh-Hans"], CFStringRef v12 = @"zh-CN", v13))
          {
            [v2 addObject:v12];
          }
        }
        if (([v2 containsObject:v10] & 1) == 0) {
          [v2 addObject:v10];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  id v14 = [v2 copy];

  return v14;
}

+ (id)preferredTranslationInTitles:(id)a3 givenPreferredLanguagesList:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v32 = v5;
  if ([v6 count])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v42;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v42 != v10) {
            objc_enumerationMutation(v7);
          }
          CFStringRef v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
          unsigned int v13 = [v12 objectForKeyedSubscript:@"language"];
          id v14 = [v6 objectAtIndexedSubscript:0];
          unsigned __int8 v15 = [v13 isEqualToString:v14];

          if (v15)
          {
            v30 = [v12 objectForKeyedSubscript:@"value"];
            goto LABEL_29;
          }
        }
        id v9 = [v7 countByEnumeratingWithState:&v41 objects:v47 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

    id v5 = v32;
  }
  +[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", [v5 count]);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v5;
  id v17 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      for (j = 0; j != v18; j = (char *)j + 1)
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        v21 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        v22 = [v21 objectForKeyedSubscript:@"value"];
        v23 = [v21 objectForKeyedSubscript:@"language"];
        [v7 setValue:v22 forKey:v23];
      }
      id v18 = [v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v18);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v24 = v6;
  id v25 = [v24 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v25)
  {
    id v26 = v25;
    uint64_t v27 = *(void *)v34;
LABEL_20:
    uint64_t v28 = 0;
    while (1)
    {
      if (*(void *)v34 != v27) {
        objc_enumerationMutation(v24);
      }
      uint64_t v29 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * v28)];
      if (v29) {
        break;
      }
      if (v26 == (id)++v28)
      {
        id v26 = [v24 countByEnumeratingWithState:&v33 objects:v45 count:16];
        if (v26) {
          goto LABEL_20;
        }
        goto LABEL_26;
      }
    }
  }
  else
  {
LABEL_26:

    id v24 = [v16 firstObject];
    uint64_t v29 = [v24 objectForKeyedSubscript:@"value"];
  }
  v30 = (void *)v29;

LABEL_29:

  return v30;
}

@end