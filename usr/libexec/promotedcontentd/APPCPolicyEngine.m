@interface APPCPolicyEngine
+ (BOOL)isSubscriber;
+ (id)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5;
+ (id)policiesToEnforce;
+ (id)savedPolicies;
@end

@implementation APPCPolicyEngine

+ (BOOL)isSubscriber
{
  v2 = [[PCBooleanCondition alloc] initWithType:@"sc" value:@"751A1F1B-43AB-40F2-BB35-C6731882A9F7" identifier:@"com.apple.news"];
  uint64_t v5 = 0;
  BOOL v3 = +[PCStatusConditionStorage isStatusConditionRegistered:v2 error:&v5];

  return v3;
}

+ (id)policiesForContainerType:(id)a3 adType:(id)a4 adFormatType:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[APPCPolicyEngine savedPolicies];
  v12 = APLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138478083;
    id v42 = (id)objc_opt_class();
    __int16 v43 = 2114;
    v44 = v11;
    id v13 = v42;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%{private}@] Policies: %{public}@", buf, 0x16u);
  }
  v14 = +[NSMutableArray array];
  if ([v11 count])
  {
    id v35 = v8;
    v32 = +[NSPredicate predicateWithFormat:@"containerType = %@ OR containerType = nil", v8];
    v15 = [v11 filteredArrayUsingPredicate:];
    id v34 = v9;
    v30 = +[NSPredicate predicateWithFormat:@"adType = %@ OR adType = nil", v9];
    v31 = v15;
    v16 = [v15 filteredArrayUsingPredicate:];
    id v33 = v10;
    v17 = +[NSPredicate predicateWithFormat:@"adFormatType = %@ OR adFormatType = nil", v10];
    v29 = v16;
    v18 = [v16 filteredArrayUsingPredicate:v17];
    unsigned int v19 = [a1 isSubscriber];
    CFStringRef v20 = @"non-subscriber";
    if (v19) {
      CFStringRef v20 = @"subscriber";
    }
    v21 = +[NSPredicate predicateWithFormat:@"userStatus = %@ OR userStatus = nil", v20];
    v22 = [v18 filteredArrayUsingPredicate:v21];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v23 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v23)
    {
      id v24 = v23;
      uint64_t v25 = *(void *)v37;
      do
      {
        for (i = 0; i != v24; i = (char *)i + 1)
        {
          if (*(void *)v37 != v25) {
            objc_enumerationMutation(v22);
          }
          v27 = [*(id *)(*((void *)&v36 + 1) + 8 * i) dictionaryRepresentation];
          [v14 addObject:v27];
        }
        id v24 = [v22 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v24);
    }

    id v9 = v34;
    id v8 = v35;
    id v10 = v33;
  }

  return v14;
}

+ (id)policiesToEnforce
{
  BOOL v3 = +[APPCPolicyEngine savedPolicies];
  unsigned int v4 = [a1 isSubscriber];
  CFStringRef v5 = @"non-subscriber";
  if (v4) {
    CFStringRef v5 = @"subscriber";
  }
  v6 = +[NSPredicate predicateWithFormat:@"userStatus = %@ OR userStatus = nil", v5];
  v7 = [v3 filteredArrayUsingPredicate:v6];
  id v8 = +[NSMutableArray array];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) dictionaryRepresentation];
        [v8 addObject:v14];
      }
      id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  return v8;
}

+ (id)savedPolicies
{
  if (qword_100288948 != -1) {
    dispatch_once(&qword_100288948, &stru_100233FF8);
  }
  v2 = (void *)qword_100288940;

  return v2;
}

@end