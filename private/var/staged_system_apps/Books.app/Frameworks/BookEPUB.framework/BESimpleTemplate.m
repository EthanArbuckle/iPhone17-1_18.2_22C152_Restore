@interface BESimpleTemplate
+ (id)_appVersionNumber;
+ (id)javascriptStringFromJavascriptSource:(id)a3 replacements:(id)a4;
@end

@implementation BESimpleTemplate

+ (id)_appVersionNumber
{
  if (qword_409AC8 != -1) {
    dispatch_once(&qword_409AC8, &stru_3C0260);
  }
  v2 = (void *)qword_409AC0;

  return v2;
}

+ (id)javascriptStringFromJavascriptSource:(id)a3 replacements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  v9 = [v7 objectForKeyedSubscript:@"version"];

  if (!v9)
  {
    id v10 = [v7 mutableCopy];
    if (!v10) {
      id v10 = objc_alloc_init((Class)NSMutableDictionary);
    }
    v11 = [a1 _appVersionNumber];
    [v10 setObject:v11 forKeyedSubscript:@"version"];

    id v7 = v10;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [v7 allKeys];
  id v12 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  v23 = v8;
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v27;
    do
    {
      v15 = 0;
      v16 = v8;
      do
      {
        if (*(void *)v27 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v15);
        v18 = [v7 objectForKeyedSubscript:v17];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v19 = v18;
        }
        else
        {
          uint64_t v25 = 0;
          v20 = +[NSJSONSerialization dataWithJSONObject:v18 options:0 error:&v25];
          if ([v20 length]) {
            v19 = (__CFString *)[objc_alloc((Class)NSString) initWithData:v20 encoding:4];
          }
          else {
            v19 = &stru_3D7B70;
          }
        }
        v21 = +[NSString stringWithFormat:@"[[__%@__]]", v17];
        id v8 = [v16 stringByReplacingOccurrencesOfString:v21 withString:v19];

        v15 = (char *)v15 + 1;
        v16 = v8;
      }
      while (v13 != v15);
      id v13 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v13);
  }

  return v8;
}

@end