@interface MOContextAnalyticsManager
- (BOOL)isContextDBAvailable;
- (MOClientRequest)request;
- (MOContextAnalyticsManager)initWithAssertionErrorState:(unint64_t)a3 dbAvailability:(BOOL)a4;
- (MOContextAnalyticsManager)initWithContexts:(id)a3 options:(id)a4 error:(id)a5 request:(id)a6 executionTime:(id)a7 clientAlternateId:(id)a8 bundleContent:(id)a9;
- (MOContextFetchOptions)options;
- (NSArray)bundleContent;
- (NSArray)contexts;
- (NSError)error;
- (NSNumber)executionTime;
- (NSString)clientAlternateId;
- (id)generateAnalyticsPayloadForContext:(id)a3;
- (id)generateAnalyticsPayloadForContextString:(id)a3 withContextID:(id)a4;
- (id)generateFetchAnalyticsPayload;
- (id)getAnalyticsPlistFileURLWithFileName:(id)a3;
- (id)readAnalyticsPersistenceTable:(id)a3;
- (unint64_t)assertionError;
- (unint64_t)bootTimestamp;
- (unint64_t)fetchSignificantLocationEnablementStatus;
- (void)persistContextAnalyticsMetrics:(id)a3 withData:(id)a4;
- (void)sendAssertionAnalyticsEvent;
- (void)sendContextAnalyticsEvents;
- (void)sendContextStringAnalyticsEventsWithContext:(id)a3;
- (void)sendFetchAnalyticsEvent;
- (void)setAssertionError:(unint64_t)a3;
- (void)setBundleContent:(id)a3;
- (void)setClientAlternateId:(id)a3;
- (void)setContexts:(id)a3;
- (void)setError:(id)a3;
- (void)setExecutionTime:(id)a3;
- (void)setIsContextDBAvailable:(BOOL)a3;
- (void)setOptions:(id)a3;
- (void)setRequest:(id)a3;
- (void)storeBinTime:(id)a3 withKey:(id)a4 toDict:(id)a5;
@end

@implementation MOContextAnalyticsManager

- (MOContextAnalyticsManager)initWithContexts:(id)a3 options:(id)a4 error:(id)a5 request:(id)a6 executionTime:(id)a7 clientAlternateId:(id)a8 bundleContent:(id)a9
{
  id v25 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v26.receiver = self;
  v26.super_class = (Class)MOContextAnalyticsManager;
  v18 = [(MOContextAnalyticsManager *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_contexts, a3);
    objc_storeStrong((id *)&v19->_options, a4);
    objc_storeStrong((id *)&v19->_error, a5);
    objc_storeStrong((id *)&v19->_request, a6);
    objc_storeStrong((id *)&v19->_executionTime, a7);
    objc_storeStrong((id *)&v19->_clientAlternateId, a8);
    objc_storeStrong((id *)&v19->_bundleContent, a9);
  }

  return v19;
}

- (MOContextAnalyticsManager)initWithAssertionErrorState:(unint64_t)a3 dbAvailability:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)MOContextAnalyticsManager;
  result = [(MOContextAnalyticsManager *)&v7 init];
  if (result)
  {
    result->_assertionError = a3;
    result->_isContextDBAvailable = a4;
  }
  return result;
}

- (void)sendContextAnalyticsEvents
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(MOContextAnalyticsManager *)self contexts];
  id v3 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v16;
    *(void *)&long long v4 = 138412290;
    long long v12 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        -[MOContextAnalyticsManager sendContextStringAnalyticsEventsWithContext:](self, "sendContextStringAnalyticsEventsWithContext:", v8, v12);
        v9 = [(MOContextAnalyticsManager *)self generateAnalyticsPayloadForContext:v8];
        v10 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v12;
          v20 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Context analytics payload sent: %@", buf, 0xCu);
        }

        v14 = v9;
        id v11 = v9;
        AnalyticsSendEventLazy();
      }
      id v5 = [obj countByEnumeratingWithState:&v15 objects:v21 count:16];
    }
    while (v5);
  }
}

id __55__MOContextAnalyticsManager_sendContextAnalyticsEvents__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)generateAnalyticsPayloadForContext:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  uint64_t v6 = [v4 contextIdentifier];
  objc_super v7 = [v6 UUIDString];
  [v5 setObject:v7 forKey:@"contextID"];

  uint64_t v8 = [(MOContextAnalyticsManager *)self request];

  if (v8)
  {
    v9 = [(MOContextAnalyticsManager *)self request];
    v10 = [v9 requestIdentifier];
    id v11 = [v10 UUIDString];
    [v5 setObject:v11 forKey:@"requestID"];
  }
  long long v12 = [v4 associatedSuggestionID];
  [v5 setObject:v12 forKey:@"suggestionID"];

  v13 = [v4 contextStrings];
  v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v13 count]);
  [v5 setObject:v14 forKey:@"numPrompts"];

  long long v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v4 actionType]);
  [v5 setObject:v15 forKey:@"actionType"];

  uint64_t v16 = [v4 bundleContentIdentifier];
  uint64_t v17 = +[NSPredicate predicateWithFormat:@"bundleContentIdentifier == %@", v16];
  long long v18 = [(MOContextAnalyticsManager *)self bundleContent];
  v62 = (void *)v17;
  v19 = [v18 filteredArrayUsingPredicate:v17];

  v20 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    id v65 = [v19 count];
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Context bundle content array count: %lu", buf, 0xCu);
  }

  v63 = (void *)v16;
  v61 = v19;
  v58 = v4;
  if (v19 && [v19 count])
  {
    id v21 = [v19 objectAtIndexedSubscript:0];
    [v21 bundleGoodnessScore];
    v55 = +[NSNumber numberWithInt:(int)(v22 * 10000.0)];
    objc_msgSend(v5, "setObject:forKey:");
    [v21 contextGoodnessScore];
    v50 = +[NSNumber numberWithInt:(int)(v23 * 10000.0)];
    objc_msgSend(v5, "setObject:forKey:");
    BOOL v51 = [v21 photoTrait] != 0;
    LODWORD(v24) = [v21 hasPersonName];
    uint64_t v25 = [v21 peopleClassification] != 0;
    BOOL v26 = [v21 peopleClassification] == (id)1 || objc_msgSend(v21, "peopleClassification") == (id)3;
    BOOL v52 = v26;
    uint64_t v24 = v24;
    BOOL v53 = [v21 peopleClassification] == (id)5;
    uint64_t v28 = [v21 peopleClassification] == (id)2;
    uint64_t v29 = [v21 peopleClassification] == (id)4;
    uint64_t v54 = [v21 hasPlaceName];
    uint64_t v33 = [v21 hasCityName];
    v34 = [v21 musicSuggestionSongTitle];
    if (v34)
    {
      BOOL v35 = 1;
    }
    else
    {
      v36 = [v21 musicSuggestionArtistName];
      BOOL v35 = v36 != 0;
    }
    uint64_t v57 = v35;

    uint64_t v59 = [v21 patternType] == 0;
    uint64_t v60 = [v21 hasTimeReference];

    uint64_t v56 = v33;
    uint64_t v27 = v53;
    uint64_t v30 = v54;
    uint64_t v32 = v51;
    uint64_t v31 = v52;
  }
  else
  {
    uint64_t v27 = 2;
    uint64_t v28 = 2;
    uint64_t v29 = 2;
    uint64_t v30 = 2;
    uint64_t v56 = 2;
    uint64_t v57 = 2;
    uint64_t v59 = 2;
    uint64_t v60 = 2;
    uint64_t v31 = 2;
    uint64_t v25 = 2;
    uint64_t v24 = 2;
    uint64_t v32 = 2;
  }
  v37 = +[NSNumber numberWithUnsignedInteger:v32];
  [v5 setObject:v37 forKey:@"hasTrait"];

  v38 = +[NSNumber numberWithUnsignedInteger:v24];
  [v5 setObject:v38 forKey:@"hasPersonName"];

  v39 = +[NSNumber numberWithUnsignedInteger:v25];
  [v5 setObject:v39 forKey:@"hasPersonRelationship"];

  v40 = +[NSNumber numberWithUnsignedInteger:v31];
  [v5 setObject:v40 forKey:@"hasFamilyName"];

  v41 = +[NSNumber numberWithUnsignedInteger:v27];
  [v5 setObject:v41 forKey:@"hasPetName"];

  v42 = +[NSNumber numberWithUnsignedInteger:v28];
  [v5 setObject:v42 forKey:@"hasFriendName"];

  v43 = +[NSNumber numberWithUnsignedInteger:v29];
  [v5 setObject:v43 forKey:@"hasColleague"];

  v44 = +[NSNumber numberWithUnsignedInteger:v30];
  [v5 setObject:v44 forKey:@"hasPlaceName"];

  v45 = +[NSNumber numberWithUnsignedInteger:v56];
  [v5 setObject:v45 forKey:@"hasCityName"];

  v46 = +[NSNumber numberWithUnsignedInteger:v57];
  [v5 setObject:v46 forKey:@"hasMusicArtistSong"];

  v47 = +[NSNumber numberWithUnsignedInteger:v59];
  [v5 setObject:v47 forKey:@"hasPattern"];

  v48 = +[NSNumber numberWithUnsignedInteger:v60];
  [v5 setObject:v48 forKey:@"hasTimeReference"];

  return v5;
}

- (void)sendContextStringAnalyticsEventsWithContext:(id)a3
{
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [v4 contextStrings];
  id v5 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = *(void *)v19;
    *(void *)&long long v6 = 138412290;
    long long v15 = v6;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        id v11 = objc_msgSend(v4, "contextIdentifier", v15);
        long long v12 = [(MOContextAnalyticsManager *)self generateAnalyticsPayloadForContextString:v10 withContextID:v11];

        v13 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v15;
          double v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Context string analytics payload sent: %@", buf, 0xCu);
        }

        uint64_t v17 = v12;
        id v14 = v12;
        AnalyticsSendEventLazy();
      }
      id v7 = [obj countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v7);
  }
}

id __73__MOContextAnalyticsManager_sendContextStringAnalyticsEventsWithContext___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)generateAnalyticsPayloadForContextString:(id)a3 withContextID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_opt_new();
  v9 = [v7 UUIDString];

  [v8 setObject:v9 forKey:@"contextID"];
  uint64_t v10 = [(MOContextAnalyticsManager *)self request];

  if (v10)
  {
    id v11 = [(MOContextAnalyticsManager *)self request];
    long long v12 = [v11 requestIdentifier];
    v13 = [v12 UUIDString];
    [v8 setObject:v13 forKey:@"requestID"];
  }
  id v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (unint64_t)[v6 contentType] & 1);
  [v8 setObject:v14 forKey:@"hasPersonName"];

  long long v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((unint64_t)[v6 contentType] >> 1) & 1);
  [v8 setObject:v15 forKey:@"hasPersonRelationship"];

  uint64_t v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((unint64_t)[v6 contentType] >> 2) & 1);
  [v8 setObject:v16 forKey:@"hasPlaceName"];

  uint64_t v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((unint64_t)[v6 contentType] >> 3) & 1);
  [v8 setObject:v17 forKey:@"hasCityName"];

  long long v18 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((unint64_t)[v6 contentType] >> 8) & 1);
  [v8 setObject:v18 forKey:@"hasTrait"];

  if (([v6 contentType] & 0x200) != 0) {
    unint64_t v19 = 1;
  }
  else {
    unint64_t v19 = ((unint64_t)[v6 contentType] >> 11) & 1;
  }
  long long v20 = +[NSNumber numberWithUnsignedInteger:v19];
  [v8 setObject:v20 forKey:@"hasFamilyName"];

  long long v21 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((unint64_t)[v6 contentType] >> 10) & 1);
  [v8 setObject:v21 forKey:@"hasFriendName"];

  double v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((unint64_t)[v6 contentType] >> 13) & 1);
  [v8 setObject:v22 forKey:@"hasPetName"];

  double v23 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", ((unint64_t)[v6 contentType] >> 12) & 1);
  [v8 setObject:v23 forKey:@"hasColleague"];

  return v8;
}

- (id)generateFetchAnalyticsPayload
{
  id v3 = objc_opt_new();
  id v4 = [(MOContextAnalyticsManager *)self request];

  if (v4)
  {
    id v5 = [(MOContextAnalyticsManager *)self request];
    id v6 = [v5 requestIdentifier];
    id v7 = [v6 UUIDString];
    [v3 setObject:v7 forKey:@"requestID"];
  }
  uint64_t v8 = [(MOContextAnalyticsManager *)self error];
  BOOL v9 = v8 == 0;

  uint64_t v10 = +[NSNumber numberWithUnsignedInteger:v9];
  [v3 setObject:v10 forKey:@"requestSuccess"];

  id v11 = [(MOContextAnalyticsManager *)self error];
  unint64_t v12 = (unint64_t)[v11 code];

  unint64_t v13 = v12 & 0xFFFFFFFFFFFFFF00;
  uint64_t v14 = v12;
  long long v15 = +[NSNumber numberWithInteger:v12 & 0xFFFFFFFFFFFFFF00];
  [v3 setObject:v15 forKey:@"requestFailureErrorCategory"];

  uint64_t v16 = +[NSNumber numberWithInteger:v12];
  [v3 setObject:v16 forKey:@"requestFailureErrorType"];

  uint64_t v17 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    long long v18 = +[NSNumber numberWithInteger:v12];
    unint64_t v19 = +[NSNumber numberWithInteger:v13];
    long long v20 = +[NSNumber numberWithInteger:v14];
    *(_DWORD *)buf = 138412802;
    v69 = v18;
    __int16 v70 = 2112;
    v71 = v19;
    __int16 v72 = 2112;
    v73 = v20;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Context error code: %@, category: %@, errorType: %@", buf, 0x20u);
  }
  long long v21 = +[NSCalendar currentCalendar];
  v66 = +[NSDate now];
  v67 = v21;
  id v65 = objc_msgSend(v21, "components:fromDate:", 32);
  double v22 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v65 hour]);
  [v3 setObject:v22 forKey:@"requestDailyPeriod"];

  double v23 = [(MOContextAnalyticsManager *)self options];
  uint64_t v24 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v23 contextRetrieval]);
  [v3 setObject:v24 forKey:@"requestRetrievalType"];

  uint64_t v25 = [(MOContextAnalyticsManager *)self options];
  BOOL v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v25 contextFormat]);
  [v3 setObject:v26 forKey:@"fetchFormatType"];

  uint64_t v27 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = [(MOContextAnalyticsManager *)self executionTime];
    [v28 doubleValue];
    *(_DWORD *)buf = 134217984;
    v69 = v29;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "fetchContext execution time: %f", buf, 0xCu);
  }
  uint64_t v30 = [(MOContextAnalyticsManager *)self executionTime];
  uint64_t v31 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v30 intValue]);
  [v3 setObject:v31 forKey:@"requestLatency"];

  uint64_t v32 = [(MOContextAnalyticsManager *)self contexts];

  if (v32)
  {
    uint64_t v33 = [(MOContextAnalyticsManager *)self contexts];
    v34 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v33 count]);
    [v3 setObject:v34 forKey:@"totalContextCount"];
  }
  BOOL v35 = [(MOContextAnalyticsManager *)self clientAlternateId];

  if (v35)
  {
    v36 = [(MOContextAnalyticsManager *)self clientAlternateId];
    [v3 setObject:v36 forKey:@"clientName"];
  }
  v64 = [(MOContextAnalyticsManager *)self getAnalyticsPlistFileURLWithFileName:@"personalizedSensingFetchAnalytics.plist"];
  v37 = -[MOContextAnalyticsManager readAnalyticsPersistenceTable:](self, "readAnalyticsPersistenceTable:");
  v63 = v37;
  if (v37) {
    id v38 = [v37 mutableCopy];
  }
  else {
    id v38 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v39 = v38;
  double Current = CFAbsoluteTimeGetCurrent();
  v41 = [v39 objectForKey:@"lastFetch"];
  uint64_t v42 = [v39 objectForKey:@"lastSuccessfulFetch"];
  if (v41) {
    [(MOContextAnalyticsManager *)self storeBinTime:v41 withKey:@"timeSinceLastInvocation" toDict:v3];
  }
  v43 = [(MOContextAnalyticsManager *)self error];

  if (!v43)
  {
    if (v42) {
      [(MOContextAnalyticsManager *)self storeBinTime:v42 withKey:@"timeSinceLastInvocationSuccess" toDict:v3];
    }
    v44 = +[NSNumber numberWithDouble:Current];
    [v39 setObject:v44 forKey:@"lastSuccessfulFetch"];
  }
  v62 = (void *)v42;
  v45 = +[NSNumber numberWithDouble:Current];
  [v39 setObject:v45 forKey:@"lastFetch"];

  v46 = +[NSNumber numberWithUnsignedInteger:[(MOContextAnalyticsManager *)self fetchSignificantLocationEnablementStatus]];
  [v3 setObject:v46 forKey:@"isSignificantLocationOn"];

  v47 = [(MOContextAnalyticsManager *)self getAnalyticsPlistFileURLWithFileName:@"personalizedSensingAssertionAnalytics.plist"];
  v48 = [(MOContextAnalyticsManager *)self readAnalyticsPersistenceTable:v47];
  uint64_t v49 = [v48 objectForKey:@"lastDBAssertionSuccessTime"];
  v50 = [v48 objectForKey:@"lastDBAssertionFailureTime"];
  BOOL v51 = [v48 objectForKey:@"lastTaskRun"];
  if (v49) {
    [(MOContextAnalyticsManager *)self storeBinTime:v49 withKey:@"timeSinceLastAssertionSuccess" toDict:v3];
  }
  if (v50) {
    [(MOContextAnalyticsManager *)self storeBinTime:v50 withKey:@"timeSinceLastAssertionFailure" toDict:v3];
  }
  v61 = (void *)v49;
  if (v51) {
    [(MOContextAnalyticsManager *)self storeBinTime:v51 withKey:@"timeSinceAssertionTaskRun" toDict:v3];
  }
  BOOL v52 = +[NSNumber numberWithInteger:[(MOContextAnalyticsManager *)self bootTimestamp]];
  [(MOContextAnalyticsManager *)self storeBinTime:v52 withKey:@"timeSinceDeviceBoot" toDict:v3];

  BOOL v53 = [v48 objectForKey:@"lastAssertionStatus"];

  if (v53)
  {
    uint64_t v54 = [v48 objectForKey:@"lastAssertionStatus"];
    id v55 = [v54 BOOLValue];

    uint64_t v56 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      +[NSNumber numberWithBool:v55];
      uint64_t v57 = v60 = v47;
      *(_DWORD *)buf = 138412290;
      v69 = v57;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "last db assertion status: %@", buf, 0xCu);

      v47 = v60;
    }

    v58 = +[NSNumber numberWithBool:v55];
    [v3 setObject:v58 forKey:@"lastAssertionStatus"];
  }
  [(MOContextAnalyticsManager *)self persistContextAnalyticsMetrics:v64 withData:v39];

  return v3;
}

- (void)sendFetchAnalyticsEvent
{
  v2 = [(MOContextAnalyticsManager *)self generateFetchAnalyticsPayload];
  id v3 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v7 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Context fetch analytics payload sent: %@", buf, 0xCu);
  }

  id v5 = v2;
  id v4 = v2;
  AnalyticsSendEventLazy();
}

id __52__MOContextAnalyticsManager_sendFetchAnalyticsEvent__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)sendAssertionAnalyticsEvent
{
  id v3 = objc_opt_new();
  uint64_t v24 = [(MOContextAnalyticsManager *)self getAnalyticsPlistFileURLWithFileName:@"personalizedSensingAssertionAnalytics.plist"];
  id v4 = -[MOContextAnalyticsManager readAnalyticsPersistenceTable:](self, "readAnalyticsPersistenceTable:");
  double v23 = v4;
  if (v4) {
    id v5 = [v4 mutableCopy];
  }
  else {
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
  }
  id v6 = v5;
  double Current = CFAbsoluteTimeGetCurrent();
  uint64_t v8 = [v6 objectForKey:@"lastDBAssertionSuccessTime"];
  BOOL v9 = [v6 objectForKey:@"lastDBAssertionFailureTime"];
  if (v8) {
    [(MOContextAnalyticsManager *)self storeBinTime:v8 withKey:@"timeSinceLastAssertionSuccess" toDict:v3];
  }
  if (v9) {
    [(MOContextAnalyticsManager *)self storeBinTime:v9 withKey:@"timeSinceLastAssertionFailure" toDict:v3];
  }
  unint64_t v10 = [(MOContextAnalyticsManager *)self assertionError];
  id v11 = +[NSNumber numberWithDouble:Current];
  BOOL v12 = v10 == 1;
  BOOL v13 = v10 == 1;
  if (v12) {
    CFStringRef v14 = @"lastDBAssertionSuccessTime";
  }
  else {
    CFStringRef v14 = @"lastDBAssertionFailureTime";
  }
  [v6 setObject:v11 forKey:v14];

  long long v15 = +[NSNumber numberWithInteger:[(MOContextAnalyticsManager *)self bootTimestamp]];
  [(MOContextAnalyticsManager *)self storeBinTime:v15 withKey:@"timeSinceDeviceBoot" toDict:v3];

  uint64_t v16 = +[NSNumber numberWithBool:v13];
  [v3 setObject:v16 forKey:@"assertionStatus"];

  uint64_t v17 = +[NSNumber numberWithBool:v13];
  [v6 setObject:v17 forKey:@"lastAssertionStatus"];

  long long v18 = +[NSNumber numberWithUnsignedInteger:[(MOContextAnalyticsManager *)self assertionError]];
  [v3 setObject:v18 forKey:@"assertionErrorType"];

  unint64_t v19 = +[NSNumber numberWithDouble:Current];
  [v6 setObject:v19 forKey:@"lastTaskRun"];

  long long v20 = +[NSNumber numberWithBool:self->_isContextDBAvailable];
  [v3 setObject:v20 forKey:@"isContextDBAvailable"];

  [(MOContextAnalyticsManager *)self persistContextAnalyticsMetrics:v24 withData:v6];
  long long v21 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    BOOL v26 = v3;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Context DB assertion analytics payload sent: %@", buf, 0xCu);
  }

  id v22 = v3;
  AnalyticsSendEventLazy();
}

id __56__MOContextAnalyticsManager_sendAssertionAnalyticsEvent__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (id)getAnalyticsPlistFileURLWithFileName:(id)a3
{
  id v3 = a3;
  id v4 = +[MOContextPersistenceManager storeDirectoryPathWithSuffix:@"analytics"];
  if (v4)
  {
    id v5 = +[NSURL fileURLWithPath:v4 isDirectory:1];
    id v6 = [v5 URLByAppendingPathComponent:v3];
  }
  else
  {
    id v7 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[MOContextAnalyticsManager getAnalyticsPlistFileURLWithFileName:](v7, v8, v9, v10, v11, v12, v13, v14);
    }

    id v6 = 0;
  }

  return v6;
}

- (id)readAnalyticsPersistenceTable:(id)a3
{
  id v3 = a3;
  id v4 = +[NSFileManager defaultManager];
  id v5 = [v3 path];
  unsigned int v6 = [v4 fileExistsAtPath:v5];

  id v7 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v8)
    {
      uint64_t v9 = [v3 absoluteString];
      *(_DWORD *)buf = 138412290;
      uint64_t v33 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "File %@ found.", buf, 0xCu);
    }
    id v31 = 0;
    id v10 = [objc_alloc((Class)NSDictionary) initWithContentsOfURL:v3 error:&v31];
    id v11 = v31;
    if (v11)
    {
      uint64_t v12 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[MOContextAnalyticsManager readAnalyticsPersistenceTable:]((uint64_t)v11, v12, v13, v14, v15, v16, v17, v18);
      }

      uint64_t v30 = 0;
      [v4 removeItemAtURL:v3 error:&v30];
      if (v30)
      {
        unint64_t v19 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[MOContextAnalyticsManager readAnalyticsPersistenceTable:](v19, v20, v21, v22, v23, v24, v25, v26);
        }
      }
      id v27 = objc_alloc_init((Class)NSDictionary);
    }
    else
    {
      id v27 = v10;
    }
    id v28 = v27;
  }
  else
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "No plist found at path.", buf, 2u);
    }

    id v28 = objc_alloc_init((Class)NSDictionary);
  }

  return v28;
}

- (void)persistContextAnalyticsMetrics:(id)a3 withData:(id)a4
{
  if (a3)
  {
    id v22 = 0;
    unsigned __int8 v4 = [a4 writeToURL:a3 error:&v22];
    id v5 = v22;
    unsigned int v6 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
    id v7 = v6;
    if (v5 || (v4 & 1) == 0)
    {
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        -[MOContextAnalyticsManager persistContextAnalyticsMetrics:withData:]((uint64_t)v5, v7, v15, v16, v17, v18, v19, v20);
      }
    }
    else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "context analytics metrics were successfully written to plist.", v21, 2u);
    }
  }
  else
  {
    id v5 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[MOContextAnalyticsManager persistContextAnalyticsMetrics:withData:](v5, v8, v9, v10, v11, v12, v13, v14);
    }
  }
}

- (unint64_t)fetchSignificantLocationEnablementStatus
{
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  id v3 = +[RTRoutineManager defaultManager];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = __69__MOContextAnalyticsManager_fetchSignificantLocationEnablementStatus__block_invoke;
  v8[3] = &unk_1000A5440;
  uint64_t v10 = &v11;
  unsigned __int8 v4 = v2;
  uint64_t v9 = v4;
  [v3 fetchRoutineStateWithHandler:v8];

  dispatch_time_t v5 = dispatch_time(0, 3000000000);
  dispatch_group_wait(v4, v5);
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __69__MOContextAnalyticsManager_fetchSignificantLocationEnablementStatus__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3 && (unint64_t)(a2 - 1) <= 1) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (unint64_t)bootTimestamp
{
  *(void *)id v7 = 0x1500000001;
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  size_t v4 = 16;
  int v2 = sysctl(v7, 2u, &v5, &v4, 0, 0);
  unint64_t result = 0;
  if (!v2) {
    return (unint64_t)((double)(int)v6 / 1000000.0 + (double)v5 - kCFAbsoluteTimeIntervalSince1970);
  }
  return result;
}

- (void)storeBinTime:(id)a3 withKey:(id)a4 toDict:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  double Current = CFAbsoluteTimeGetCurrent();
  [v9 doubleValue];
  double v12 = v11;

  double v13 = Current - v12;
  uint64_t v14 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[MOContextAnalyticsManager storeBinTime:withKey:toDict:]((uint64_t)v7, v14, v13);
  }

  if (v13 >= 0.0)
  {
    int v22 = (int)(v13 / 3600.0);
    if (v22 >= 168) {
      uint64_t v23 = 168;
    }
    else {
      uint64_t v23 = v22;
    }
    uint64_t v15 = +[NSNumber numberWithInt:v23];
    [v8 setObject:v15 forKey:v7];
  }
  else
  {
    uint64_t v15 = _mo_log_facility_get_os_log(&MOLogFacilityContextAnalytics);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[MOContextAnalyticsManager storeBinTime:withKey:toDict:]((uint64_t)v7, v15, v16, v17, v18, v19, v20, v21);
    }
  }
}

- (NSArray)contexts
{
  return self->_contexts;
}

- (void)setContexts:(id)a3
{
}

- (MOContextFetchOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (MOClientRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSNumber)executionTime
{
  return self->_executionTime;
}

- (void)setExecutionTime:(id)a3
{
}

- (NSString)clientAlternateId
{
  return self->_clientAlternateId;
}

- (void)setClientAlternateId:(id)a3
{
}

- (NSArray)bundleContent
{
  return self->_bundleContent;
}

- (void)setBundleContent:(id)a3
{
}

- (unint64_t)assertionError
{
  return self->_assertionError;
}

- (void)setAssertionError:(unint64_t)a3
{
  self->_assertionError = a3;
}

- (BOOL)isContextDBAvailable
{
  return self->_isContextDBAvailable;
}

- (void)setIsContextDBAvailable:(BOOL)a3
{
  self->_isContextDBAvailable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleContent, 0);
  objc_storeStrong((id *)&self->_clientAlternateId, 0);
  objc_storeStrong((id *)&self->_executionTime, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_contexts, 0);
}

- (void)getAnalyticsPlistFileURLWithFileName:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readAnalyticsPersistenceTable:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)readAnalyticsPersistenceTable:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)persistContextAnalyticsMetrics:(uint64_t)a3 withData:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)persistContextAnalyticsMetrics:(uint64_t)a3 withData:(uint64_t)a4 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)storeBinTime:(uint64_t)a3 withKey:(uint64_t)a4 toDict:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)storeBinTime:(uint64_t)a1 withKey:(NSObject *)a2 toDict:(double)a3 .cold.2(uint64_t a1, NSObject *a2, double a3)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Time difference for key %@ (sec): %f", (uint8_t *)&v3, 0x16u);
}

@end