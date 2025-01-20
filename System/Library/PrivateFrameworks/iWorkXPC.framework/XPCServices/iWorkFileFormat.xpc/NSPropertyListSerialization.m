@interface NSPropertyListSerialization
+ (id)tsu_localizedPropertyListWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (id)tsu_propertyListWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5;
+ (void)tsu_processLocalizedPropertyList:(id)a3;
@end

@implementation NSPropertyListSerialization

+ (id)tsu_propertyListWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  v7 = +[NSInputStream inputStreamWithURL:a3];
  v8 = v7;
  if (v7)
  {
    [v7 open];
    v9 = +[NSPropertyListSerialization propertyListWithStream:v8 options:a4 format:0 error:a5];
    [v8 close];
  }
  else if (a5)
  {
    +[NSError tsu_fileReadUnknownErrorWithUserInfo:0];
    v9 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)tsu_processLocalizedPropertyList:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    v6 = [v5 objectForKey:@"_LOCALIZABLE_"];
    if (v6) {
      [v5 removeObjectForKey:@"_LOCALIZABLE_"];
    }
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000B7BEC;
    v18[3] = &unk_1001CED38;
    v18[4] = a1;
    [v5 enumerateKeysAndObjectsUsingBlock:v18];
    if (v6)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        +[TSUAssertionHandler _atomicIncrementAssertCount];
        if (TSUAssertCat_init_token != -1) {
          dispatch_once(&TSUAssertCat_init_token, &stru_1001CED58);
        }
        if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
          sub_10016AB9C();
        }
        v7 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSPropertyListSerialization(TSUtility) tsu_processLocalizedPropertyList:]");
        v8 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSPropertyListSerialization_TSUtility.m"];
        +[TSUAssertionHandler handleFailureInFunction:v7, v8, 47, 0, "Expected a dictionary as a child of %{public}@", @"_LOCALIZABLE_" file lineNumber isFatal description];

        +[TSUAssertionHandler logBacktraceThrottled];
      }
      [v5 addEntriesFromDictionary:v6];
    }

LABEL_21:
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v4;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v10 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          objc_msgSend(a1, "tsu_processLocalizedPropertyList:", *(void *)(*((void *)&v14 + 1) + 8 * i));
        }
        id v11 = [v9 countByEnumeratingWithState:&v14 objects:v19 count:16];
      }
      while (v11);
    }
    goto LABEL_21;
  }
LABEL_22:
}

+ (id)tsu_localizedPropertyListWithContentsOfURL:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8 = a3;
  if (a4 - 1 >= 2)
  {
    +[TSUAssertionHandler _atomicIncrementAssertCount];
    if (TSUAssertCat_init_token != -1) {
      dispatch_once(&TSUAssertCat_init_token, &stru_1001CED78);
    }
    if (os_log_type_enabled((os_log_t)TSUAssertCat_log_t, OS_LOG_TYPE_ERROR)) {
      sub_10016AC50();
    }
    id v9 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[NSPropertyListSerialization(TSUtility) tsu_localizedPropertyListWithContentsOfURL:options:error:]");
    id v10 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/iWorkXPC/shared/utility/NSPropertyListSerialization_TSUtility.m"];
    +[TSUAssertionHandler handleFailureInFunction:v9 file:v10 lineNumber:65 isFatal:0 description:"Need mutable containers to process a localizable property list"];

    +[TSUAssertionHandler logBacktraceThrottled];
  }
  id v11 = objc_msgSend(a1, "tsu_propertyListWithContentsOfURL:options:error:", v8, a4, a5);
  objc_msgSend(a1, "tsu_processLocalizedPropertyList:", v11);

  return v11;
}

@end