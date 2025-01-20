@interface GKContactsCacheUpdateBatchStartCommand
- (id)executeWithContext:(id)a3;
@end

@implementation GKContactsCacheUpdateBatchStartCommand

- (id)executeWithContext:(id)a3
{
  v3 = +[GKCDContactInfoList _gkObjectsMatchingPredicate:0 withContext:a3];
  v4 = [v3 firstObject];

  v5 = 0;
  if (!v4)
  {
    if (!os_log_GKGeneral) {
      id v6 = (id)GKOSLoggers();
    }
    v7 = os_log_GKContacts;
    if (os_log_type_enabled(os_log_GKContacts, OS_LOG_TYPE_DEBUG)) {
      sub_1000D4D00(v7);
    }
    v5 = +[NSError errorWithDomain:GKContactsIntegrationErrorDomain code:5 userInfo:0];
  }

  return v5;
}

@end