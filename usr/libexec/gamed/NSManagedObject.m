@interface NSManagedObject
+ (id)_gkFetchRequest;
+ (id)_gkObjectsFromFetchRequest:(id)a3 withContext:(id)a4;
+ (id)_gkObjectsMatchingPredicate:(id)a3 withContext:(id)a4;
+ (id)_gkRetrieveCleanEntry:(id)a3 request:(id)a4;
- (BOOL)_gkIsExpired:(id)a3;
@end

@implementation NSManagedObject

+ (id)_gkFetchRequest
{
  v2 = [a1 fetchRequest];
  [v2 setIncludesSubentities:1];
  [v2 setIncludesPropertyValues:1];
  [v2 setIncludesPendingChanges:1];
  [v2 setReturnsObjectsAsFaults:0];

  return v2;
}

- (BOOL)_gkIsExpired:(id)a3
{
  id v3 = a3;
  v4 = +[GKPreferences shared];
  unsigned __int8 v5 = [v4 networkManagerIgnoreCache];

  BOOL v6 = 1;
  if (v3 && (v5 & 1) == 0)
  {
    [v3 timeIntervalSinceNow];
    BOOL v6 = v7 <= 0.0;
  }

  return v6;
}

+ (id)_gkRetrieveCleanEntry:(id)a3 request:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v15 = 0;
  double v7 = [v5 executeFetchRequest:v6 error:&v15];
  id v8 = v15;
  if (v8)
  {
    if (!os_log_GKGeneral) {
      id v9 = (id)GKOSLoggers();
    }
    v10 = (void *)os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10004F3CC((uint64_t)v8, v10, v6);
    }
    unint64_t v11 = 0;
  }
  else
  {
    if ([v7 count] == (id)1) {
      goto LABEL_11;
    }
    unint64_t v11 = 1;
  }
  while ((unint64_t)[v7 count] > v11)
  {
    v12 = [v7 objectAtIndexedSubscript:v11];
    [v5 deleteObject:v12];

    ++v11;
  }
LABEL_11:
  v13 = [v7 lastObject];

  return v13;
}

+ (id)_gkObjectsMatchingPredicate:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _gkFetchRequest];
  [v8 setPredicate:v7];

  id v9 = [a1 _gkObjectsFromFetchRequest:v8 withContext:v6];

  return v9;
}

+ (id)_gkObjectsFromFetchRequest:(id)a3 withContext:(id)a4
{
  id v11 = 0;
  v4 = [a4 executeFetchRequest:a3 error:&v11];
  id v5 = v11;
  if (v5)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    id v7 = os_log_GKError;
    if (os_log_type_enabled(os_log_GKError, OS_LOG_TYPE_ERROR)) {
      sub_10004F48C(v7);
    }
    id v8 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      id v9 = (id)GKOSLoggers();
      id v8 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fetch request error: %@", buf, 0xCu);
    }
  }

  return v4;
}

@end