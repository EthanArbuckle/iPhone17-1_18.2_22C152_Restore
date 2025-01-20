@interface C7RiKwi0qHUD3RW9
+ (id)sharedInstance;
- (id)SvXmeMlpC8nbshta:(id)a3 name:(id)a4;
- (id)mF9a0iyS9JaiQAjp:(id)a3 pXKoPMsQI9AYa6US:(id)a4;
- (id)wQx5zziHtNxqlbwU:(id)a3;
- (int64_t)L2S3goqpYnHiXTRg:(int64_t)a3;
- (int64_t)LygrmXh7W0Hs2O8n:(id)a3;
- (int64_t)N2XtGIRzgUKLkZMS:(id)a3;
- (void)A6B42kYrDuXnlUJs:(int *)a3 IaS2bByRUGdVAKHz:(int *)a4;
- (void)A6B42kYrDuXnlUJs:(int *)a3 IaS2bByRUGdVAKHz:(int *)a4 QqUmN4hrxAoSYB5g:(id)a5;
- (void)E5J0OeRApCYQUXDZ:(id)a3 completion:(id)a4;
- (void)Iv2P4WxadRhQ5ldX:(id)a3 GymwzUEOAaggmTfe:(int)a4 Y16kne8dG6NtD3ma:(id)a5 completion:(id)a6 yVhet0BX5E1CDncz:(id)a7;
- (void)KqWH25SjlYcX4wo6:(id)a3 completion:(id)a4;
- (void)MbPRHtYjEv98WrKf:(id)a3 completion:(id)a4;
- (void)SKiIwgejuzELNOY0:(id)a3 completion:(id)a4;
- (void)U4k02bIWNYQCLSGK:(id)a3 completion:(id)a4;
- (void)YMeSiVAJwqHb7P3U:(id)a3 completion:(id)a4;
- (void)b8mzIZQ1GCTnhVAP:(id)a3 completion:(id)a4;
- (void)enableCHShowProtectedAppsForManager:(id)a3;
- (void)f7RoJXIsBwkuxLd1:(id)a3 completionBlock:(id)a4 fNW5Ll4jBXJAcsCk:(unint64_t *)a5;
- (void)hSmO2OC6etXclsKP:(id)a3 edrv2qHmtbt1iEyf:(id)a4 QsX3tfdMvsGwvY0F:(unsigned int)a5 completion:(id)a6;
- (void)pRfmPXmMPeo7rsRf:(id)a3 N3UHg1ij3irF9uUu:(id)a4 QsX3tfdMvsGwvY0F:(unsigned int)a5 completionBlock:(id)a6;
- (void)tfrVhQidRAUlTy5Y:(id)a3 completion:(id)a4;
@end

@implementation C7RiKwi0qHUD3RW9

+ (id)sharedInstance
{
  if (qword_1006A5DF0 != -1) {
    dispatch_once(&qword_1006A5DF0, &stru_10065F560);
  }
  v2 = (void *)qword_1006A5DE8;

  return v2;
}

- (int64_t)L2S3goqpYnHiXTRg:(int64_t)a3
{
  if ((unint64_t)(a3 + 2003) >= 4) {
    return a3;
  }
  else {
    return 138000 - a3;
  }
}

- (int64_t)LygrmXh7W0Hs2O8n:(id)a3
{
  id v3 = a3;
  v4 = [v3 attributeSet];
  v5 = [v4 authorEmailAddresses];

  v6 = [v3 attributeSet];
  v7 = [v6 recipientEmailAddresses];

  if (v5) {
    +[NSSet setWithArray:v5];
  }
  else {
  v8 = +[NSSet set];
  }
  if (v7) {
    +[NSSet setWithArray:v7];
  }
  else {
  v9 = +[NSSet set];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [v3 attributeSet];
  v11 = [v10 accountHandles];

  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([v8 containsObject:v15])
        {
          int64_t v16 = 2;
          goto LABEL_20;
        }
        if ([v9 containsObject:v15])
        {
          int64_t v16 = 1;
          goto LABEL_20;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      int64_t v16 = 0;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v16 = 0;
  }
LABEL_20:

  return v16;
}

- (int64_t)N2XtGIRzgUKLkZMS:(id)a3
{
  id v3 = a3;
  v4 = [v3 attributeSet];
  v5 = [v4 authorAddresses];

  v6 = [v3 attributeSet];
  v7 = [v6 recipientAddresses];

  if (v5) {
    +[NSSet setWithArray:v5];
  }
  else {
  v8 = +[NSSet set];
  }
  if (v7) {
    +[NSSet setWithArray:v7];
  }
  else {
  v9 = +[NSSet set];
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v10 = [v3 attributeSet];
  v11 = [v10 accountHandles];

  id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v19 != v13) {
          objc_enumerationMutation(v11);
        }
        uint64_t v15 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if ([v8 containsObject:v15])
        {
          int64_t v16 = 2;
          goto LABEL_20;
        }
        if ([v9 containsObject:v15])
        {
          int64_t v16 = 1;
          goto LABEL_20;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      int64_t v16 = 0;
      if (v12) {
        continue;
      }
      break;
    }
  }
  else
  {
    int64_t v16 = 0;
  }
LABEL_20:

  return v16;
}

- (id)SvXmeMlpC8nbshta:(id)a3 name:(id)a4
{
  id v30 = a3;
  id v29 = a4;
  v5 = [v29 firstName];
  if (v5
    && ([v29 lastName],
        v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    v7 = [v29 firstName];
    v37[0] = v7;
    v8 = [v29 lastName];
    v37[1] = v8;
    v9 = +[NSArray arrayWithObjects:v37 count:2];
  }
  else
  {
    v10 = [v29 fullName];

    if (v10)
    {
      v11 = [v29 fullName];
      id v12 = +[NSCharacterSet whitespaceCharacterSet];
      v9 = [v11 componentsSeparatedByCharactersInSet:v12];
    }
    else
    {
      uint64_t v13 = [v29 lastName];

      if (v13)
      {
        v14 = [v29 lastName];
        v36 = v14;
        v9 = +[NSArray arrayWithObjects:&v36 count:1];
      }
      else
      {
        v9 = 0;
      }
    }
  }
  v28 = +[NSMutableArray array];
  v27 = v9;
  if ([v9 count]) {
    [v28 addObject:v9];
  }
  if ((unint64_t)[v9 count] >= 2)
  {
    id v15 = [v9 mutableCopy];
    int64_t v16 = [v9 objectAtIndexedSubscript:1];
    [v15 setObject:v16 atIndexedSubscript:0];

    v17 = [v9 objectAtIndexedSubscript:0];
    [v15 setObject:v17 atIndexedSubscript:1];

    [v28 addObject:v15];
  }
  long long v18 = +[NSMutableArray array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v19 = v28;
  id v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v32;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v32 != v21) {
          objc_enumerationMutation(v19);
        }
        v23 = [*(id *)(*((void *)&v31 + 1) + 8 * i) componentsJoinedByString:@"*"];
        v24 = +[NSString stringWithFormat:@"%@='*%@*'cd", v30, v23];

        [v18 addObject:v24];
      }
      id v20 = [v19 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v20);
  }

  v25 = [v18 componentsJoinedByString:@" || "];

  return v25;
}

- (id)mF9a0iyS9JaiQAjp:(id)a3 pXKoPMsQI9AYa6US:(id)a4
{
  id v5 = a3;
  id v21 = a4;
  if (([v5 containsObject:@"public.email-message"] & 1) != 0
    || [v5 containsObject:@"public.message"])
  {
    v6 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
    v7 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
    id v8 = objc_alloc_init((Class)NSDateFormatter);
    [v8 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
    v9 = [v8 stringFromDate:v6];
    v10 = [v8 stringFromDate:v7];
    v11 = +[NSString stringWithFormat:@"InRange(kMDItemContentCreationDate, $time.iso(%@), $time.iso(%@)) && ", v9, v10];
  }
  else
  {
    v11 = &stru_100686790;
  }
  id v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v5 count]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = v5;
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v13);
        }
        v17 = +[NSString stringWithFormat:@"kMDItemContentType='%@'", *(void *)(*((void *)&v22 + 1) + 8 * i)];
        [v12 addObject:v17];
      }
      id v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  long long v18 = [v12 componentsJoinedByString:@" || "];
  id v19 = +[NSString stringWithFormat:@"%@(%@) && (%@)", v11, v18, v21];

  return v19;
}

- (void)Iv2P4WxadRhQ5ldX:(id)a3 GymwzUEOAaggmTfe:(int)a4 Y16kne8dG6NtD3ma:(id)a5 completion:(id)a6 yVhet0BX5E1CDncz:(id)a7
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  uint64_t v15 = malloc_type_calloc(a4, 4uLL, 0x100004052888210uLL);
  int64_t v16 = objc_opt_new();
  [v16 setFetchAttributes:v14];
  [v16 setMaxCount:100];
  v29[0] = NSFileProtectionComplete;
  v29[1] = NSFileProtectionCompleteUnlessOpen;
  v29[2] = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v17 = +[NSArray arrayWithObjects:v29 count:3];
  [v16 setProtectionClasses:v17];

  [v16 setIncludeUserActivities:1];
  id v18 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v11 context:v16];
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100028E00;
  v25[3] = &unk_10065F588;
  id v19 = v12;
  id v26 = v19;
  v27 = v15;
  int v28 = a4;
  [v18 setFoundItemsHandler:v25];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100028F28;
  v21[3] = &unk_10065F5B0;
  id v20 = v13;
  id v22 = v20;
  long long v23 = v15;
  int v24 = a4;
  [v18 setCompletionHandler:v21];
  [v18 start];
}

- (void)f7RoJXIsBwkuxLd1:(id)a3 completionBlock:(id)a4 fNW5Ll4jBXJAcsCk:(unint64_t *)a5
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_opt_new();
  [v9 setFetchAttributes:&__NSArray0__struct];
  [v9 setMaxCount:100];
  v18[0] = NSFileProtectionComplete;
  v18[1] = NSFileProtectionCompleteUnlessOpen;
  v18[2] = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v10 = +[NSArray arrayWithObjects:v18 count:3];
  [v9 setProtectionClasses:v10];

  [v9 setIncludeUserActivities:1];
  id v11 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v7 context:v9];
  [v11 setFoundItemsHandler:0];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000291A4;
  v14[3] = &unk_10065F5D8;
  v17 = a5;
  id v12 = v11;
  id v15 = v12;
  id v13 = v8;
  id v16 = v13;
  [v12 setCompletionHandler:v14];
  [v12 start];
}

- (void)pRfmPXmMPeo7rsRf:(id)a3 N3UHg1ij3irF9uUu:(id)a4 QsX3tfdMvsGwvY0F:(unsigned int)a5 completionBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = objc_opt_new();
  [v12 setFetchAttributes:&__NSArray0__struct];
  [v12 setMaxCount:a5];
  v33[0] = NSFileProtectionComplete;
  v33[1] = NSFileProtectionCompleteUnlessOpen;
  v33[2] = NSFileProtectionCompleteUntilFirstUserAuthentication;
  id v13 = +[NSArray arrayWithObjects:v33 count:3];
  [v12 setProtectionClasses:v13];

  [v12 setIncludeUserActivities:1];
  id v14 = [objc_alloc((Class)CSSearchQuery) initWithQueryString:v9 attributes:v10];
  id v15 = objc_alloc_init((Class)NSMutableArray);
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_100029568;
  v31[4] = sub_100029578;
  id v32 = 0;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100029580;
  v26[3] = &unk_10065F600;
  id v29 = v31;
  id v16 = v10;
  id v27 = v16;
  id v17 = v15;
  id v28 = v17;
  unsigned int v30 = a5;
  [v14 setFoundItemsHandler:v26];
  id v20 = _NSConcreteStackBlock;
  uint64_t v21 = 3221225472;
  id v22 = sub_1000298C8;
  long long v23 = &unk_10065F628;
  id v18 = v11;
  id v25 = v18;
  id v19 = v17;
  id v24 = v19;
  [v14 setCompletionHandler:&v20];
  [v14 start:v20, v21, v22, v23];

  _Block_object_dispose(v31, 8);
}

- (void)b8mzIZQ1GCTnhVAP:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [v6 firstName];
  if (v9 || ([v6 lastName], (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    id v16 = [v6 fullName];

    if (!v16) {
      goto LABEL_5;
    }
  }
  id v10 = [(C7RiKwi0qHUD3RW9 *)self SvXmeMlpC8nbshta:@"kMDItemAuthors" name:v6];
  id v11 = +[NSString stringWithFormat:@"(%@)", v10];
  [v8 addObject:v11];

LABEL_5:
  v20[0] = @"public.email-message";
  v20[1] = @"public.message";
  id v12 = +[NSArray arrayWithObjects:v20 count:2];
  id v13 = [v8 componentsJoinedByString:@" || "];
  id v14 = [(C7RiKwi0qHUD3RW9 *)self mF9a0iyS9JaiQAjp:v12 pXKoPMsQI9AYa6US:v13];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100029BA8;
  v19[3] = &unk_10065F650;
  v19[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100029BF4;
  v17[3] = &unk_10065F678;
  id v15 = v7;
  id v18 = v15;
  [(C7RiKwi0qHUD3RW9 *)self Iv2P4WxadRhQ5ldX:v14 GymwzUEOAaggmTfe:2 Y16kne8dG6NtD3ma:v19 completion:v17 yVhet0BX5E1CDncz:&off_100688628];
}

- (void)SKiIwgejuzELNOY0:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_opt_new();
  id v9 = [v6 firstName];
  if (v9 || ([v6 lastName], (id v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    id v16 = [v6 fullName];

    if (!v16) {
      goto LABEL_5;
    }
  }
  id v10 = [(C7RiKwi0qHUD3RW9 *)self SvXmeMlpC8nbshta:@"kMDItemRecipients" name:v6];
  id v11 = +[NSString stringWithFormat:@"(%@)", v10];
  [v8 addObject:v11];

LABEL_5:
  v20[0] = @"public.email-message";
  v20[1] = @"public.message";
  id v12 = +[NSArray arrayWithObjects:v20 count:2];
  id v13 = [v8 componentsJoinedByString:@" || "];
  id v14 = [(C7RiKwi0qHUD3RW9 *)self mF9a0iyS9JaiQAjp:v12 pXKoPMsQI9AYa6US:v13];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100029ED8;
  v19[3] = &unk_10065F650;
  v19[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100029F24;
  v17[3] = &unk_10065F678;
  id v15 = v7;
  id v18 = v15;
  [(C7RiKwi0qHUD3RW9 *)self Iv2P4WxadRhQ5ldX:v14 GymwzUEOAaggmTfe:2 Y16kne8dG6NtD3ma:v19 completion:v17 yVhet0BX5E1CDncz:&off_100688640];
}

- (void)U4k02bIWNYQCLSGK:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v15 = @"public.email-message";
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = +[NSString stringWithFormat:@"kMDItemAuthorEmailAddresses='%@'", v6];
  id v10 = [(C7RiKwi0qHUD3RW9 *)self mF9a0iyS9JaiQAjp:v8 pXKoPMsQI9AYa6US:v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002A128;
  v14[3] = &unk_10065F650;
  void v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002A174;
  v12[3] = &unk_10065F678;
  id v11 = v7;
  id v13 = v11;
  [(C7RiKwi0qHUD3RW9 *)self Iv2P4WxadRhQ5ldX:v10 GymwzUEOAaggmTfe:2 Y16kne8dG6NtD3ma:v14 completion:v12 yVhet0BX5E1CDncz:&off_100688658];
}

- (void)E5J0OeRApCYQUXDZ:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v15 = @"public.email-message";
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = +[NSString stringWithFormat:@"kMDItemRecipientEmailAddresses='%@'", v6];
  id v10 = [(C7RiKwi0qHUD3RW9 *)self mF9a0iyS9JaiQAjp:v8 pXKoPMsQI9AYa6US:v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002A378;
  v14[3] = &unk_10065F650;
  void v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002A3C4;
  v12[3] = &unk_10065F678;
  id v11 = v7;
  id v13 = v11;
  [(C7RiKwi0qHUD3RW9 *)self Iv2P4WxadRhQ5ldX:v10 GymwzUEOAaggmTfe:2 Y16kne8dG6NtD3ma:v14 completion:v12 yVhet0BX5E1CDncz:&off_100688670];
}

- (void)YMeSiVAJwqHb7P3U:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v15 = @"public.message";
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = +[NSString stringWithFormat:@"kMDItemAuthorAddresses='%@'", v6];
  id v10 = [(C7RiKwi0qHUD3RW9 *)self mF9a0iyS9JaiQAjp:v8 pXKoPMsQI9AYa6US:v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002A5C8;
  v14[3] = &unk_10065F650;
  void v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002A614;
  v12[3] = &unk_10065F678;
  id v11 = v7;
  id v13 = v11;
  [(C7RiKwi0qHUD3RW9 *)self Iv2P4WxadRhQ5ldX:v10 GymwzUEOAaggmTfe:2 Y16kne8dG6NtD3ma:v14 completion:v12 yVhet0BX5E1CDncz:&off_100688688];
}

- (void)KqWH25SjlYcX4wo6:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v15 = @"public.message";
  id v8 = +[NSArray arrayWithObjects:&v15 count:1];
  id v9 = +[NSString stringWithFormat:@"kMDItemRecipientAddresses='%@'", v6];
  id v10 = [(C7RiKwi0qHUD3RW9 *)self mF9a0iyS9JaiQAjp:v8 pXKoPMsQI9AYa6US:v9];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10002A818;
  v14[3] = &unk_10065F650;
  void v14[4] = self;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002A864;
  v12[3] = &unk_10065F678;
  id v11 = v7;
  id v13 = v11;
  [(C7RiKwi0qHUD3RW9 *)self Iv2P4WxadRhQ5ldX:v10 GymwzUEOAaggmTfe:2 Y16kne8dG6NtD3ma:v14 completion:v12 yVhet0BX5E1CDncz:&off_1006886A0];
}

- (id)wQx5zziHtNxqlbwU:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    id v7 = 0;
    goto LABEL_29;
  }
  id v36 = 0;
  v4 = +[NSRegularExpression regularExpressionWithPattern:@"@" options:1 error:&v36];
  id v5 = v36;
  id v6 = [v4 matchesInString:v3 options:0 range:[v3 length]];
  if (![v6 count])
  {
    id v35 = v5;
    id v32 = +[NSRegularExpression regularExpressionWithPattern:@"[0-9\\-\\+\\*\\(\\)\\#\\s]" options:1 error:&v35];
    id v8 = v35;

    long long v31 = [v32 matchesInString:v3 options:0 range:NSMakeRange(0, [v3 length])];

    if (![v31 count])
    {
      id v7 = 0;
LABEL_27:

      id v6 = v31;
      id v5 = v8;
      goto LABEL_28;
    }
    id v9 = +[NSLocale currentLocale];
    id v29 = [v9 countryCode];

    id v10 = (const void *)CFPhoneNumberCreate();
    String = (void *)CFPhoneNumberCreateString();
    id v26 = (void *)CFPhoneNumberCreateString();
    id v12 = String;
    id v30 = v12;
    if (!v12) {
      id v30 = v3;
    }
    id v13 = (const void *)CFPhoneNumberCopyISOCountryCode();
    uint64_t ITUCountryCodeForISOCountryCode = CFPhoneNumberGetITUCountryCodeForISOCountryCode();
    if (v13) {
      CFRelease(v13);
    }
    if (v10) {
      CFRelease(v10);
    }
    id v27 = +[NSString stringWithFormat:@"+%ld ", ITUCountryCodeForISOCountryCode];
    if (objc_msgSend(v12, "hasPrefix:"))
    {
      uint64_t v15 = [v12 substringFromIndex:[v27 length]];

      id v12 = (id)v15;
    }
    if (ITUCountryCodeForISOCountryCode == 1)
    {
      if (v12)
      {
        id v34 = v8;
        id v16 = +[NSRegularExpression regularExpressionWithPattern:@"^\\([0-9]{3}\\)\\s" options:1 error:&v34];
        id v17 = v34;

        if (!v17)
        {
          uint64_t v18 = [v16 stringByReplacingMatchesInString:v12 options:0 range:NSMakeRange(0, [v12 length]) withTemplate:&stru_100686790];

          id v12 = (id)v18;
        }

        id v8 = v17;
LABEL_22:
        id v33 = v8;
        id v28 = +[NSRegularExpression regularExpressionWithPattern:@"[^0-9]" options:1 error:&v33];
        id v19 = v33;

        if (!v19)
        {
          uint64_t v22 = [v28 stringByReplacingMatchesInString:v12 options:0 range:[v12 length] withTemplate:&stru_100686790];
          long long v23 = [v28 stringByReplacingMatchesInString:v30 options:0 range:[v30 length] withTemplate:&stru_100686790];
          uint64_t v24 = [@"+" stringByAppendingString:v23];

          if (v22)
          {
            v37[0] = v12;
            v37[1] = v22;
            void v37[2] = v24;
            uint64_t v21 = +[NSArray arrayWithObjects:v37 count:3];
            id v20 = (void *)v22;
            id v30 = (id)v24;
            goto LABEL_26;
          }
          id v30 = (id)v24;
        }
        id v20 = 0;
        v38[0] = v12;
        v38[1] = v30;
        uint64_t v21 = +[NSArray arrayWithObjects:v38 count:2];
LABEL_26:
        id v7 = +[NSSet setWithArray:v21];

        id v8 = v19;
        goto LABEL_27;
      }
    }
    else if (v12)
    {
      goto LABEL_22;
    }
    id v12 = v26;
    goto LABEL_22;
  }
  id v7 = 0;
LABEL_28:

LABEL_29:

  return v7;
}

- (void)tfrVhQidRAUlTy5Y:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v18 = a4;
  id v7 = [(C7RiKwi0qHUD3RW9 *)self wQx5zziHtNxqlbwU:v6];
  id v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"_kMDItemBundleID='com.apple.MobileAddressBook' && (kMDItemEmailAddress='%@' "), v6;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v22;
    do
    {
      id v12 = 0;
      id v13 = v8;
      do
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v9);
        }
        id v8 = [v13 stringByAppendingFormat:@"|| kMDItemAccountHandles='*%@' ", *(void *)(*((void *)&v21 + 1) + 8 * (void)v12)];

        id v12 = (char *)v12 + 1;
        id v13 = v8;
      }
      while (v10 != v12);
      id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v10);
  }

  id v14 = [v8 stringByAppendingString:@""]);

  CFStringRef v25 = @"public.contact";
  uint64_t v15 = +[NSArray arrayWithObjects:&v25 count:1];
  id v16 = [(C7RiKwi0qHUD3RW9 *)self mF9a0iyS9JaiQAjp:v15 pXKoPMsQI9AYa6US:v14];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10002B160;
  v19[3] = &unk_10065F678;
  id v17 = v18;
  id v20 = v17;
  [(C7RiKwi0qHUD3RW9 *)self Iv2P4WxadRhQ5ldX:v16 GymwzUEOAaggmTfe:1 Y16kne8dG6NtD3ma:&stru_10065F6B8 completion:v19 yVhet0BX5E1CDncz:0];
}

- (void)MbPRHtYjEv98WrKf:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  CFStringRef v14 = @"public.contact";
  id v8 = +[NSArray arrayWithObjects:&v14 count:1];
  id v9 = +[NSString stringWithFormat:@"_kMDItemBundleID='com.apple.MobileAddressBook' && kMDItemEmailAddresses='%@'", v6];
  id v10 = [(C7RiKwi0qHUD3RW9 *)self mF9a0iyS9JaiQAjp:v8 pXKoPMsQI9AYa6US:v9];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10002B338;
  v12[3] = &unk_10065F678;
  id v11 = v7;
  id v13 = v11;
  [(C7RiKwi0qHUD3RW9 *)self Iv2P4WxadRhQ5ldX:v10 GymwzUEOAaggmTfe:1 Y16kne8dG6NtD3ma:&stru_10065F6D8 completion:v12 yVhet0BX5E1CDncz:0];
}

- (void)A6B42kYrDuXnlUJs:(int *)a3 IaS2bByRUGdVAKHz:(int *)a4
{
}

- (void)enableCHShowProtectedAppsForManager:(id)a3
{
  id v3 = a3;
  if (objc_opt_respondsToSelector()) {
    ((void (*)(id, const char *, uint64_t))[v3 methodForSelector:"setShowsProtectedApps:"])(v3, "setShowsProtectedApps:", 1);
  }
}

- (void)A6B42kYrDuXnlUJs:(int *)a3 IaS2bByRUGdVAKHz:(int *)a4 QqUmN4hrxAoSYB5g:(id)a5
{
  id v6 = a5;
  long long v22 = objc_opt_new();
  -[C7RiKwi0qHUD3RW9 enableCHShowProtectedAppsForManager:](self, "enableCHShowProtectedAppsForManager:");
  long long v23 = +[NSDate dateWithTimeIntervalSinceNow:-2592000.0];
  id v20 = +[NSDate date];
  long long v21 = +[NSPredicate predicateWithFormat:@"date > %@ AND date <= %@", v23, v20];
  id v7 = [v22 recentCallsWithPredicate:];
  *a3 = 0;
  *a4 = 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v8)
  {
    uint64_t v29 = *(void *)v35;
    int v28 = kCHCallStatusIncoming;
    int v25 = kCHCallStatusOutgoing;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (v6)
        {
          id v11 = [*(id *)(*((void *)&v34 + 1) + 8 * i) remoteParticipantHandles];
          long long v32 = 0u;
          long long v33 = 0u;
          long long v30 = 0u;
          long long v31 = 0u;
          id v12 = v11;
          id v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v31;
            while (2)
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v31 != v14) {
                  objc_enumerationMutation(v12);
                }
                id v16 = *(void **)(*((void *)&v30 + 1) + 8 * (void)j);
                if ([v16 type] == (id)2)
                {
                  id v17 = [v16 value];
                  unsigned __int8 v18 = [v6 isEqualToString:v17];

                  if (v18)
                  {

                    goto LABEL_18;
                  }
                }
              }
              id v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
        }
        else
        {
LABEL_18:
          if ((v28 & [v10 callStatus]) != 0)
          {
            id v19 = a3;
          }
          else
          {
            if ((v25 & [v10 callStatus]) == 0) {
              continue;
            }
            id v19 = a4;
          }
          ++*v19;
        }
      }
      id v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v8);
  }
}

- (void)hSmO2OC6etXclsKP:(id)a3 edrv2qHmtbt1iEyf:(id)a4 QsX3tfdMvsGwvY0F:(unsigned int)a5 completion:(id)a6
{
  id v33 = a3;
  id v34 = a4;
  long long v32 = (void (**)(id, void, void *))a6;
  v41 = objc_opt_new();
  id v9 = objc_opt_new();
  [(C7RiKwi0qHUD3RW9 *)self enableCHShowProtectedAppsForManager:v9];
  id v10 = +[NSPredicate predicateWithFormat:v33];
  long long v31 = [v9 recentCallsWithPredicate:v10];

  id v11 = [v34 length];
  if (v11)
  {
    id v12 = -[C7RiKwi0qHUD3RW9 wQx5zziHtNxqlbwU:](self, "wQx5zziHtNxqlbwU:", v34, v31);
  }
  else
  {
    id v12 = 0;
  }
  id v39 = v11;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v31;
  id v13 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v13)
  {
    uint64_t v37 = *(void *)v47;
    int v36 = kCHCallStatusIncoming;
    while (2)
    {
      id v38 = v13;
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(void *)v47 != v37) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        id v16 = [v15 remoteParticipantHandles:v31];
        unsigned int v17 = [v15 callStatus];
        if (v39)
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          id v18 = v16;
          uint64_t v19 = (uint64_t)[v18 countByEnumeratingWithState:&v42 objects:v52 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v43;
            while (2)
            {
              for (uint64_t j = 0; j != v19; ++j)
              {
                if (*(void *)v43 != v20) {
                  objc_enumerationMutation(v18);
                }
                long long v22 = [*(id *)(*((void *)&v42 + 1) + 8 * j) normalizedValue];
                if (v22 && ([v12 containsObject:v22] & 1) != 0)
                {

                  uint64_t v19 = 1;
                  goto LABEL_22;
                }
              }
              uint64_t v19 = (uint64_t)[v18 countByEnumeratingWithState:&v42 objects:v52 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
LABEL_22:
        }
        else
        {
          uint64_t v19 = 1;
        }
        long long v23 = +[NSNull null];
        long long v24 = [v15 date];

        if (v24)
        {
          uint64_t v25 = [v15 date];

          long long v23 = (void *)v25;
        }
        v50[0] = @"d";
        [v15 duration];
        id v26 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        v51[0] = v26;
        v51[1] = v23;
        v50[1] = @"cd";
        v50[2] = @"di";
        id v27 = +[NSNumber numberWithInt:(v36 & v17) == 0];
        v51[2] = v27;
        v50[3] = @"mp";
        int v28 = +[NSNumber numberWithInt:v19];
        v51[3] = v28;
        uint64_t v29 = +[NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:4];

        [v41 addObject:v29];
        if (a5 && (unint64_t)[v41 count] >= a5)
        {

          goto LABEL_31;
        }
      }
      id v13 = [obj countByEnumeratingWithState:&v46 objects:v53 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_31:

  long long v30 = +[NSArray arrayWithArray:v41];
  v32[2](v32, 0, v30);
}

@end