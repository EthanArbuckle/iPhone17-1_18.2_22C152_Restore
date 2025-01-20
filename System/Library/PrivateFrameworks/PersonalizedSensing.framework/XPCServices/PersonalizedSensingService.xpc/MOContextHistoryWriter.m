@interface MOContextHistoryWriter
- (BMBookmarkablePublisher)stream_publisher;
- (BMSource)stream_source;
- (MOContextHistoryWriter)init;
- (void)_saveContextResults:(id)a3 withFetchDetails:(id)a4 options:(id)a5 usingRange:(_NSRange)a6;
- (void)saveContextResults:(id)a3 usingOptions:(id)a4 clientBundleId:(id)a5 clientAlternateId:(id)a6;
@end

@implementation MOContextHistoryWriter

- (MOContextHistoryWriter)init
{
  v14.receiver = self;
  v14.super_class = (Class)MOContextHistoryWriter;
  v2 = [(MOContextHistoryWriter *)&v14 init];
  if (v2)
  {
    v3 = BiomeLibrary();
    v4 = [v3 PersonalizedSensing];
    v5 = [v4 MomentsContext];
    uint64_t v6 = [v5 source];
    stream_source = v2->_stream_source;
    v2->_stream_source = (BMSource *)v6;

    v8 = BiomeLibrary();
    v9 = [v8 PersonalizedSensing];
    v10 = [v9 MomentsContext];
    uint64_t v11 = [v10 publisher];
    stream_publisher = v2->_stream_publisher;
    v2->_stream_publisher = (BMBookmarkablePublisher *)v11;
  }
  return v2;
}

- (void)_saveContextResults:(id)a3 withFetchDetails:(id)a4 options:(id)a5 usingRange:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v29 = a3;
  id v9 = a4;
  id v33 = a5;
  v10 = objc_opt_new();
  id v11 = objc_alloc((Class)BMPersonalizedSensingMomentsContextContextFetchDetails);
  v12 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 fetchId]);
  v13 = [v9 timestamp];
  objc_super v14 = [v9 clientBundleIdentifier];
  v15 = [v9 alternateClientIdentifier];
  v16 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v9 totalContextReplyCount]);
  v17 = +[NSNumber numberWithUnsignedInteger:location];
  id v18 = [v11 initWithFetchId:v12 timestamp:v13 clientBundleIdentifier:v14 alternateClientIdentifier:v15 totalContextReplyCount:v16 batchContextReplyStartIndex:v17];

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  v19 = objc_msgSend(v29, "subarrayWithRange:", location, length);
  id v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v36;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v19);
        }
        v24 = +[BMPersonalizedSensingMomentsContextMomentsContext toBiome:*(void *)(*((void *)&v35 + 1) + 8 * i)];
        if (v24) {
          [v10 addObject:v24];
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v21);
  }

  id v25 = [objc_alloc((Class)BMPersonalizedSensingMomentsContextPersonalizedContext) initWithFetchDetails:v18 fetchOptions:v33 contexts:v10];
  id v26 = [objc_alloc((Class)BMPersonalizedSensingMomentsContext) initWithPersonalizedContext:v25];
  v27 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Saved biome events!!!", buf, 2u);
  }

  v28 = [(MOContextHistoryWriter *)self stream_source];
  [v28 sendEvent:v26];
}

- (void)saveContextResults:(id)a3 usingOptions:(id)a4 clientBundleId:(id)a5 clientAlternateId:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (_os_feature_enabled_impl())
  {
    objc_super v14 = +[NSDate now];
    v15 = +[NSString stringWithFormat:@"%@, %@", v12, v14];
    id v16 = [v15 hash];

    id v17 = objc_alloc((Class)BMPersonalizedSensingMomentsContextContextFetchDetails);
    id v18 = +[NSNumber numberWithUnsignedInteger:v16];
    v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 count]);
    id v32 = v13;
    id v20 = [v17 initWithFetchId:v18 timestamp:v14 clientBundleIdentifier:v12 alternateClientIdentifier:v13 totalContextReplyCount:v19 batchContextReplyStartIndex:&off_1000B6B58];

    id v21 = objc_alloc((Class)BMPersonalizedSensingMomentsContextMomentsContextFetchOptions);
    uint64_t v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 contextFormat]);
    v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 contextRetrieval]);
    v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 contextCount]);
    id v25 = [v21 initWithContextFormat:v22 contextRetrieval:v23 contextCount:v24];

    unint64_t v26 = 0;
    if ([v10 count])
    {
      do
      {
        v27 = (char *)[v10 count];
        if ((unint64_t)&v27[-v26] >= 5) {
          uint64_t v28 = 5;
        }
        else {
          uint64_t v28 = (uint64_t)&v27[-v26];
        }
        -[MOContextHistoryWriter _saveContextResults:withFetchDetails:options:usingRange:](self, "_saveContextResults:withFetchDetails:options:usingRange:", v10, v20, v25, v26, v28);
        v26 += v28;
      }
      while (v26 < (unint64_t)[v10 count]);
    }
    id v29 = _mo_log_facility_get_os_log(&MOLogFacilityContextCrossPlatform);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v34 = v26;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Posted Sync count: %ld", buf, 0xCu);
    }

    id v13 = v32;
  }
  else
  {
    v30 = _mo_log_facility_get_os_log(&MOLogFacilityPersonalizedSensing);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Personalized Sensing Sync Disabled", buf, 2u);
    }
  }
}

- (BMSource)stream_source
{
  return self->_stream_source;
}

- (BMBookmarkablePublisher)stream_publisher
{
  return self->_stream_publisher;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stream_publisher, 0);
  objc_storeStrong((id *)&self->_stream_source, 0);
}

@end