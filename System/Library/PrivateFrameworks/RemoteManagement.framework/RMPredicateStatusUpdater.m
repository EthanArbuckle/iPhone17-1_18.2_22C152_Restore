@interface RMPredicateStatusUpdater
+ (RMPredicateStatusUpdater)sharedUpdater;
- (BOOL)_updatePredicateStatusWithFetchPredicate:(id)a3;
- (BOOL)notifyPredicateStatusDidChangeForManagementSourceIdentifier:(id)a3;
- (NSPersistentContainer)persistentContainer;
- (RMPredicateStatusUpdater)initWithPersistentContainer:(id)a3;
- (void)setPersistentContainer:(id)a3;
@end

@implementation RMPredicateStatusUpdater

+ (RMPredicateStatusUpdater)sharedUpdater
{
  if (qword_1000DB338 != -1) {
    dispatch_once(&qword_1000DB338, &stru_1000C66D0);
  }
  v2 = (void *)qword_1000DB330;

  return (RMPredicateStatusUpdater *)v2;
}

- (RMPredicateStatusUpdater)initWithPersistentContainer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RMPredicateStatusUpdater;
  v6 = [(RMPredicateStatusUpdater *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_persistentContainer, a3);
  }

  return v7;
}

- (BOOL)notifyPredicateStatusDidChangeForManagementSourceIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = +[RMLog predicateStatusUpdater];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Posting notification for management source: %{public}@", buf, 0xCu);
  }

  v6 = +[NSPredicate predicateWithFormat:@"%K == %@", @"identifier", v4];
  BOOL v7 = [(RMPredicateStatusUpdater *)self _updatePredicateStatusWithFetchPredicate:v6];

  return v7;
}

- (BOOL)_updatePredicateStatusWithFetchPredicate:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v6 = [(RMPredicateStatusUpdater *)self persistentContainer];
  id v7 = [v6 newBackgroundContext];

  [v7 setMergePolicy:NSMergeByPropertyObjectTrumpMergePolicy];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10005BB60;
  v15[3] = &unk_1000C5100;
  id v8 = v4;
  id v16 = v8;
  id v9 = v5;
  id v17 = v9;
  [v7 performBlockAndWait:v15];
  id v10 = [v9 count];
  if (v10)
  {
    v11 = +[RMLog predicateStatusUpdater];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10005BD60((uint64_t)v9, v11);
    }

    v12 = +[NSNotificationCenter defaultCenter];
    CFStringRef v18 = @"RMUserInfoKeyPredicateUpdatedManagementSourceObjectIDs";
    id v19 = v9;
    v13 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [v12 postNotificationName:@"RMPredicateStatusUpdaterDidChangeNotification" object:self userInfo:v13];
  }
  return v10 != 0;
}

- (NSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end