@interface SPRecommendationDatastore
- (BOOL)coolDown;
- (id)performQuery:(id)a3;
- (unsigned)domain;
@end

@implementation SPRecommendationDatastore

- (BOOL)coolDown
{
  return 1;
}

- (id)performQuery:(id)a3
{
  id v4 = a3;
  if (([v4 isPeopleSearch] & 1) != 0
    || ([v4 isScopedAppSearch] & 1) != 0)
  {
    v5 = 0;
  }
  else
  {
    v6 = [v4 disabledBundles];
    unsigned int v7 = [v6 containsObject:@"com.apple.Music"];

    if (v7)
    {
      v8 = logForCSLogCategoryRecs();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Music recommendation disabled by settings.", buf, 2u);
      }
      v5 = 0;
    }
    else
    {
      if (qword_1000A8C98 != -1) {
        dispatch_once(&qword_1000A8C98, &stru_100091ED0);
      }
      v9 = SPLogForSPLogCategoryTelemetry();
      unsigned int v10 = [v4 externalID];
      if (v10)
      {
        unsigned int v11 = v10;
        if (os_signpost_enabled(v9))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "recommendationSpotlightLatency", " enableTelemetry=YES ", buf, 2u);
        }
      }

      v13 = [[SPRecommendationDatastoreToken alloc] initWithStore:self];
      id v14 = v4;
      md_tracing_dispatch_async_propagating();
      v8 = v13;

      v5 = v8;
    }
  }

  return v5;
}

- (unsigned)domain
{
  return 11;
}

@end