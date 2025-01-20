@interface UsageReportGenerator
+ (void)initialize;
- (BMBookmarkNode)serviceDataSessionPublisherBookmark;
- (BMBookmarkNode)sessionPublisherBookmark;
- (NSDate)lastDeviceUsageQueryDate;
- (UsageReportGenerator)initWithLaunchEvents:(id)a3 knowledgeStore:(id)a4 usageReportWriter:(id)a5 messagesUsageReportWriter:(id)a6 phoneUsageReportWriter:(id)a7 chClient:(id)a8 queue:(id)a9;
- (UsageReportGenerator)initWithLaunchEvents:(id)a3 knowledgeStore:(id)a4 usageReportWriter:(id)a5 messagesUsageReportWriter:(id)a6 phoneUsageReportWriter:(id)a7 chClient:(id)a8 queue:(id)a9 defaults:(id)a10;
- (double)relativeAppStartTimeForReport:(id)a3 eventStartTime:(double)a4;
- (id)aggregatedPublisherWithInterval:(id)a3;
- (id)aggregatedSessionPublisherWithInterval:(id)a3;
- (id)bundleIdFromNotificationUsageEvent:(id)a3;
- (id)currentDeviceUsageQueryDate;
- (id)deviceUsageReportForDate:(id)a3;
- (id)getPoweredOffIntervalForEventStartDate:(id)a3 endDate:(id)a4;
- (id)getTextInputSessionsForBundleID:(id)a3 interval:(id)a4;
- (void)addAppUsage:(id)a3 forBundleId:(id)a4;
- (void)addTextInputSessionForInterval:(id)a3 event:(id)a4 category:(id)a5;
- (void)cleanUp;
- (void)dealloc;
- (void)extractInProgressEventsFromSessionBookmark:(id)a3;
- (void)fetchCategoriesWithCompletionHandler:(id)a3;
- (void)launchEventRunActivity:(id)a3;
- (void)processInProgressEventsForInterval:(id)a3;
- (void)processPendingEventsForInterval:(id)a3;
- (void)queryPairedEventsForInterval:(id)a3 completionHandler:(id)a4;
- (void)queryServiceDataForInterval:(id)a3 completionHandler:(id)a4;
- (void)querySingleEventStreamsForInterval:(id)a3 completionHandler:(id)a4;
- (void)queryStreamDataForInterval:(id)a3 completionHandler:(id)a4;
- (void)queryUsageDuringInterval:(id)a3 completionHandler:(id)a4;
- (void)recordActivityLevelEventsFor:(id)a3 within:(id)a4;
- (void)recordAppUsageEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5;
- (void)recordAppWebUsageEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5;
- (void)recordDeviceBacklightEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5;
- (void)recordDevicePluggedInEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5;
- (void)recordDeviceScreenIsLockedEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5;
- (void)recordMotionActivityEventsFor:(id)a3 within:(id)a4;
- (void)recordNotificationEventsFor:(id)a3 within:(id)a4;
- (void)runDeviceUsageCollectionActivity:(id)a3;
- (void)sensorWriterDidStopMonitoring:(id)a3;
- (void)sensorWriterWillStartMonitoring:(id)a3;
- (void)setLastDeviceUsageQueryDate:(id)a3;
- (void)setServiceDataSessionPublisherBookmark:(id)a3;
- (void)setSessionPublisherBookmark:(id)a3;
@end

@implementation UsageReportGenerator

- (id)getPoweredOffIntervalForEventStartDate:(id)a3 endDate:(id)a4
{
  if (!self) {
    return 0;
  }
  v5 = 0;
  if (!a4 || !a3 || !self->_devicePoweredOffIntervals) {
    return v5;
  }
  [a4 timeIntervalSinceReferenceDate];
  double v9 = v8;
  [a3 timeIntervalSinceReferenceDate];
  if (v9 < v10) {
    return 0;
  }
  id v11 = [objc_alloc((Class)NSDateInterval) initWithStartDate:a3 endDate:a4];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  devicePoweredOffIntervals = self->_devicePoweredOffIntervals;
  id v13 = [(NSMutableArray *)devicePoweredOffIntervals countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v13) {
    return 0;
  }
  id v14 = v13;
  uint64_t v15 = *(void *)v19;
LABEL_8:
  uint64_t v16 = 0;
  while (1)
  {
    if (*(void *)v19 != v15) {
      objc_enumerationMutation(devicePoweredOffIntervals);
    }
    v5 = *(void **)(*((void *)&v18 + 1) + 8 * v16);
    if ([v5 intersectsDateInterval:v11]) {
      return v5;
    }
    if (v14 == (id)++v16)
    {
      id v14 = [(NSMutableArray *)devicePoweredOffIntervals countByEnumeratingWithState:&v18 objects:v22 count:16];
      v5 = 0;
      if (v14) {
        goto LABEL_8;
      }
      return v5;
    }
  }
}

- (NSDate)lastDeviceUsageQueryDate
{
  v2 = self;
  if (self) {
    self = (UsageReportGenerator *)self->_defaults;
  }
  [(UsageReportGenerator *)self queryIntervalShift];
  double v4 = v3;
  v5 = +[NSDate dateWithSRAbsoluteTime:fmax(SRAbsoluteTimeGetCurrent() + -604800.0 - v3, 0.0)];
  if (v2) {
    defaults = v2->_defaults;
  }
  else {
    defaults = 0;
  }
  v7 = [(SRDeviceUsageDefaults *)defaults lastDeviceUsageQueryDate];
  if (!v7) {
    v7 = +[NSDate dateWithSRAbsoluteTime:fmax(SRAbsoluteTimeGetCurrent() + -86400.0 - v4, 0.0)];
  }

  return [(NSDate *)v7 laterDate:v5];
}

- (void)setLastDeviceUsageQueryDate:(id)a3
{
  if (self) {
    self = (UsageReportGenerator *)self->_defaults;
  }
  [(UsageReportGenerator *)self setLastDeviceUsageQueryDate:a3];
}

- (id)currentDeviceUsageQueryDate
{
  if (self) {
    self = (UsageReportGenerator *)self->_defaults;
  }
  [(UsageReportGenerator *)self queryIntervalShift];
  double v3 = +[NSDate dateWithSRAbsoluteTime:fmax(SRAbsoluteTimeGetCurrent() - v2, 0.0)];

  return sub_100013270(v3, 900.0);
}

- (BMBookmarkNode)sessionPublisherBookmark
{
  if (self) {
    self = (UsageReportGenerator *)self->_defaults;
  }
  return (BMBookmarkNode *)[(UsageReportGenerator *)self deviceUsageReportSessionPublisherBookmark];
}

- (void)setSessionPublisherBookmark:(id)a3
{
  if (self) {
    self = (UsageReportGenerator *)self->_defaults;
  }
  [(UsageReportGenerator *)self setDeviceUsageReportSessionPublisherBookmark:a3];
}

- (BMBookmarkNode)serviceDataSessionPublisherBookmark
{
  if (self) {
    self = (UsageReportGenerator *)self->_defaults;
  }
  return (BMBookmarkNode *)[(UsageReportGenerator *)self deviceUsageReportServiceDataSessionPublisherBookmark];
}

- (void)setServiceDataSessionPublisherBookmark:(id)a3
{
  if (self) {
    self = (UsageReportGenerator *)self->_defaults;
  }
  [(UsageReportGenerator *)self setDeviceUsageReportServiceDataSessionPublisherBookmark:a3];
}

- (id)bundleIdFromNotificationUsageEvent:(id)a3
{
  id v5 = [a3 bundleID];
  id v6 = [a3 notificationID];
  if (self)
  {
    notificationBundleIdsByNotificationId = self->_notificationBundleIdsByNotificationId;
    if (v5)
    {
LABEL_3:
      [(NSMutableDictionary *)notificationBundleIdsByNotificationId setObject:v5 forKeyedSubscript:v6];
      return v5;
    }
  }
  else
  {
    notificationBundleIdsByNotificationId = 0;
    if (v5) {
      goto LABEL_3;
    }
  }

  return [(NSMutableDictionary *)notificationBundleIdsByNotificationId objectForKeyedSubscript:v6];
}

- (id)getTextInputSessionsForBundleID:(id)a3 interval:(id)a4
{
  id v7 = +[NSMutableArray array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  if (self) {
    textInputSessions = self->_textInputSessions;
  }
  else {
    textInputSessions = 0;
  }
  id v23 = [(NSMutableArray *)textInputSessions countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v23)
  {
    uint64_t v9 = *(void *)v25;
    do
    {
      double v10 = 0;
      do
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(textInputSessions);
        }
        id v11 = *(void **)(*((void *)&v24 + 1) + 8 * (void)v10);
        id v13 = [v11 eventBody];
        id v14 = objc_alloc((Class)NSDateInterval);
        id v15 = [v13 timestamp];
        [v13 duration];
        id v16 = [v14 initWithStartDate:v15];
        if ([v16 intersectsDateInterval:a4]
          && objc_msgSend(objc_msgSend(v13, "bundleID"), "isEqual:", a3))
        {
          uint64_t v17 = [v13 sessionInput] - 1;
          if (v17 >= 4)
          {
            if (qword_10002AA58 != -1) {
              dispatch_once(&qword_10002AA58, &stru_100025058);
            }
            long long v19 = qword_10002AA60;
            if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
            {
              signed int v20 = [v13 sessionInput];
              *(_DWORD *)buf = 134217984;
              uint64_t v29 = v20;
              _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Unsupported BMTextInputSessionInput %lu", buf, 0xCu);
            }
          }
          else
          {
            uint64_t v22 = v17 + 1;
            [v13 duration];
            [v7 addObject:[+[SRTextInputSession textInputSessionWithDuration:sessionType:sessionIdentifier:](SRTextInputSession, "textInputSessionWithDuration:sessionType:sessionIdentifier:", v22, objc_msgSend(v13, "sessionID"), v18)];
          }
        }

        double v10 = (char *)v10 + 1;
      }
      while (v23 != v10);
      id v23 = [(NSMutableArray *)textInputSessions countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v23);
  }
  if (v7) {
    return +[NSArray arrayWithArray:v7];
  }
  else {
    return &__NSArray0__struct;
  }
}

- (void)cleanUp
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 240);
    objc_setProperty_nonatomic(self, v3, 0, 232);
    [(NSMutableDictionary *)self->_deviceUsageReports removeAllObjects];
    [(NSMutableDictionary *)self->_notificationBundleIdsByNotificationId removeAllObjects];
    [(NSMutableSet *)self->_pendingNotificationEvents removeAllObjects];
    [(NSMutableArray *)self->_pendingAppInFocusEventSessions removeAllObjects];
    [(NSMutableArray *)self->_pendingAppWebUsageEventSessions removeAllObjects];
    [(NSMutableArray *)self->_inProgressEvents removeAllObjects];
    [(NSMutableSet *)self->_appsBundleIDsToFetchSupplementalCategories removeAllObjects];
    [(NSMutableSet *)self->_appsBundleIDsToFetchCategories removeAllObjects];
    [(NSMutableSet *)self->_notificationsBundleIDs removeAllObjects];
    [(NSMutableSet *)self->_webDomains removeAllObjects];
    [(NSMutableArray *)self->_textInputSessions removeAllObjects];
    [(NSMutableDictionary *)self->_categoriesForBundleIDs removeAllObjects];
    [(NSMutableDictionary *)self->_categoriesForWebDomains removeAllObjects];
    [(NSMutableDictionary *)self->_supplementalCategories removeAllObjects];
    devicePoweredOffIntervals = self->_devicePoweredOffIntervals;
  }
  else
  {
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    [0 removeAllObjects];
    devicePoweredOffIntervals = 0;
  }

  [(NSMutableArray *)devicePoweredOffIntervals removeAllObjects];
}

- (void)runDeviceUsageCollectionActivity:(id)a3
{
  id v5 = [(UsageReportGenerator *)self lastDeviceUsageQueryDate];
  id v6 = [(UsageReportGenerator *)self currentDeviceUsageQueryDate];
  [v6 timeIntervalSinceDate:v5];
  if (v7 >= 900.0)
  {
    id v9 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v5 endDate:v6];
    uint64_t v10 = os_transaction_create();
    objc_initWeak((id *)buf, self);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10000BDA4;
    v11[3] = &unk_100024C00;
    objc_copyWeak(&v12, (id *)buf);
    v11[4] = a3;
    v11[5] = v10;
    v11[6] = v9;
    v11[7] = v6;
    [(UsageReportGenerator *)self queryServiceDataForInterval:v9 completionHandler:v11];

    objc_destroyWeak(&v12);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    double v8 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      id v14 = +[NSDate now];
      __int16 v15 = 2114;
      id v16 = v5;
      __int16 v17 = 2114;
      id v18 = v6;
      __int16 v19 = 2050;
      uint64_t v20 = 0x408C200000000000;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Time before now (%{public}@). Time interval (%{public}@ - %{public}@) is less than our report interval (%{public}f). Waiting until next time", buf, 0x2Au);
    }
    [a3 markCompleted];
  }
}

- (id)aggregatedPublisherWithInterval:(id)a3
{
  id v3 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:[a3 startDate] endDate:[a3 endDate] maxEvents:0 lastN:0 reversed:0];
  v6[0] = [[[BiomeLibrary() Notification] Usage] publisherWithOptions:v3];
  v6[1] = [[[BiomeLibrary() Motion] Activity] publisherWithOptions:v3];
  v6[2] = [((id)BiomeLibrary()) Activity].Level.publisherWithOptions:v3;
  v6[3] = [[[[BiomeLibrary() Text] InputSession] publisherWithOptions:v3];
  id v4 = [objc_alloc((Class)BPSOrderedMerge) initWithPublishers:+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 4) comparator:&stru_100024C40];

  return v4;
}

- (id)aggregatedSessionPublisherWithInterval:(id)a3
{
  id v3 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:[a3 startDate] endDate:[a3 endDate] maxEvents:0 lastN:0 reversed:0];
  v6[0] = +[BMEventSession sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:](BMEventSession, "sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:", [objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "App"), "InFocus"), "publisherWithOptions:", v3), &stru_100024C80, &stru_100024CA0, &stru_100024CE0, 0);
  v6[1] = [BMEventSession sessionPublisherWithStreamPublisher:objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "App"), "WebUsage"), "publisherWithOptions:", v3) startingBlock:&stru_100024D00 endingBlock:&stru_100024D20 sessionKeyBlock:&stru_100024D40 options:0];
  v6[2] = +[BMEventSession sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:](BMEventSession, "sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:", objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "Device"), "Power"), "PluggedIn"), "publisherWithOptions:", v3), &stru_100024D60, &stru_100024D80, 0, 2);
  v6[3] = +[BMEventSession sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:](BMEventSession, "sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:", [objc_msgSend(objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "Device"), "Display"), "Backlight"), "publisherWithOptions:", v3), &stru_100024DA0, &stru_100024DC0, 0, 2);
  void v6[4] = +[BMEventSession sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:](BMEventSession, "sessionPublisherWithStreamPublisher:startingBlock:endingBlock:sessionKeyBlock:options:", objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "Device"), "ScreenLocked"), "publisherWithOptions:", v3), &stru_100024DE0, &stru_100024E00, 0, 2);
  id v4 = [objc_alloc((Class)BPSOrderedMerge) initWithPublishers:[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 5), &stru_100024E40];

  return v4;
}

- (void)queryServiceDataForInterval:(id)a3 completionHandler:(id)a4
{
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  double v7 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v16 = [a3 startDate];
    __int16 v17 = 2112;
    id v18 = [a3 endDate];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Querying Biome streams for service data; interval with start date:%@, end date:%@",
      buf,
      0x16u);
  }
  id v8 = [objc_alloc((Class)BMPublisherOptions) initWithStartDate:[a3 startDate] endDate:[a3 endDate] maxEvents:0 lastN:0 reversed:0];
  id v9 = [BMEventSession sessionPublisherWithStreamPublisher:objc_msgSend(objc_msgSend(objc_msgSend((id)BiomeLibrary(), "Device"), "BootSession"), "publisherWithOptions:", v8) startingBlock:&stru_100024E60 endingBlock:&stru_100024E80 sessionKeyBlock:0 options:0];
  objc_initWeak((id *)buf, self);
  uint64_t v10 = [(UsageReportGenerator *)self serviceDataSessionPublisherBookmark];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000CB54;
  v13[3] = &unk_100024EA8;
  objc_copyWeak(&v14, (id *)buf);
  v13[4] = a3;
  v13[5] = a4;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000CDB8;
  v11[3] = &unk_100024ED0;
  objc_copyWeak(&v12, (id *)buf);
  [v9 sinkWithBookmark:v10 completion:v13 receiveInput:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

- (void)queryStreamDataForInterval:(id)a3 completionHandler:(id)a4
{
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  double v7 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = [a3 startDate];
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = [a3 endDate];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Start Biome streams querying for interval with start date:%{public}@, end date:%{public}@", buf, 0x16u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3052000000;
  __int16 v17 = sub_10000D43C;
  id v18 = sub_10000D44C;
  uint64_t v19 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3052000000;
  v15[3] = sub_10000D43C;
  v15[4] = sub_10000D44C;
  v15[5] = 0;
  id v8 = dispatch_group_create();
  objc_initWeak(&location, self);
  dispatch_group_enter(v8);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000D458;
  v13[3] = &unk_100024EF8;
  v13[4] = v8;
  v13[5] = v15;
  [(UsageReportGenerator *)self querySingleEventStreamsForInterval:a3 completionHandler:v13];
  dispatch_group_enter(v8);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10000D548;
  v12[3] = &unk_100024EF8;
  v12[4] = v8;
  v12[5] = buf;
  [(UsageReportGenerator *)self queryPairedEventsForInterval:a3 completionHandler:v12];
  if (self) {
    self = (UsageReportGenerator *)objc_getProperty(self, v9, 88, 1);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000D638;
  block[3] = &unk_100024F48;
  block[7] = buf;
  block[8] = v15;
  block[4] = v8;
  block[6] = a4;
  objc_copyWeak(&v11, &location);
  block[5] = a3;
  dispatch_group_notify(v8, &self->super, block);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(buf, 8);
}

- (void)querySingleEventStreamsForInterval:(id)a3 completionHandler:(id)a4
{
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  double v7 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = [a3 startDate];
    __int16 v22 = 2112;
    id v23 = [a3 endDate];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Querying single event streams for interval with start date:%@, end date:%@", buf, 0x16u);
  }
  id v8 = [(UsageReportGenerator *)self aggregatedPublisherWithInterval:a3];
  if (v8)
  {
    if (self)
    {
      id v9 = [(SRDeviceUsageDefaults *)self->_defaults lastDeviceUsageActivityLevelEvent];
      objc_setProperty_nonatomic(self, v10, v9, 240);
      id v11 = [(SRDeviceUsageDefaults *)self->_defaults lastDeviceUsageMotionActivityEvent];
      objc_setProperty_nonatomic(self, v12, v11, 232);
    }
    else
    {
      [0 lastDeviceUsageActivityLevelEvent];
      [0 lastDeviceUsageMotionActivityEvent];
    }
    objc_initWeak((id *)buf, self);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000DB80;
    v18[3] = &unk_100024F70;
    objc_copyWeak(&v19, (id *)buf);
    v18[4] = a4;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10000DD40;
    v16[3] = &unk_100024F98;
    objc_copyWeak(&v17, (id *)buf);
    v16[4] = a3;
    [v8 sinkWithCompletion:v18 receiveInput:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    id v13 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_FAULT))
    {
      id v14 = [a3 startDate];
      id v15 = [a3 endDate];
      *(_DWORD *)buf = 138412546;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_fault_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "Failed to create aggrerated publisher for query interval: start:%@ end: %@", buf, 0x16u);
    }
    (*((void (**)(id, SRError *))a4 + 2))(a4, +[SRError errorWithCode:8194]);
  }
}

- (void)queryPairedEventsForInterval:(id)a3 completionHandler:(id)a4
{
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  double v7 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v18 = [a3 startDate];
    __int16 v19 = 2114;
    id v20 = [a3 endDate];
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Start querying streams with paired events for interval with start date:%{public}@, end date:%{public}@", buf, 0x16u);
  }
  id v8 = [(UsageReportGenerator *)self aggregatedSessionPublisherWithInterval:a3];
  if (v8)
  {
    objc_initWeak((id *)buf, self);
    id v9 = [(UsageReportGenerator *)self sessionPublisherBookmark];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10000E32C;
    v15[3] = &unk_100024FC0;
    objc_copyWeak(&v16, (id *)buf);
    v15[4] = a4;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10000E4D8;
    v13[3] = &unk_100024FE8;
    objc_copyWeak(&v14, (id *)buf);
    v13[4] = self;
    v13[5] = a3;
    [v8 sinkWithBookmark:v9 completion:v15 receiveInput:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    SEL v10 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_FAULT))
    {
      id v11 = [a3 startDate];
      id v12 = [a3 endDate];
      *(_DWORD *)buf = 138412546;
      id v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_fault_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "Failed to create aggrerated session publisher for query interval: start:%@ end: %@", buf, 0x16u);
    }
    (*((void (**)(id, SRError *))a4 + 2))(a4, +[SRError errorWithCode:8194]);
  }
}

- (void)recordNotificationEventsFor:(id)a3 within:(id)a4
{
  id v6 = [a3 eventBody];
  id v7 = [(UsageReportGenerator *)self bundleIdFromNotificationUsageEvent:v6];
  if (self) {
    categoriesForBundleIDs = self->_categoriesForBundleIDs;
  }
  else {
    categoriesForBundleIDs = 0;
  }
  id v9 = sub_10001240C([(NSMutableDictionary *)categoriesForBundleIDs objectForKeyedSubscript:v7]);
  if (v9 || (id v9 = sub_100012318((uint64_t)v7)) != 0)
  {
    if (v7 && !sub_1000169D4((BOOL)self, (uint64_t)v7)) {
      id v7 = 0;
    }
    unsigned int v10 = [v6 usageType] - 1;
    if (v10 > 0xF) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = qword_10001D060[v10];
    }
    id v12 = +[SRNotificationUsage notificationUsageWithBundleIdentifier:v7 eventType:v11];
    [a3 timestamp];
    id v13 = [(UsageReportGenerator *)self deviceUsageReportForDate:+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:")];
    id v14 = [objc_msgSend(v13, "mutableNotificationUsageByCategory") objectForKeyedSubscript:v9];
    if (!v14)
    {
      id v14 = +[NSMutableArray array];
      [objc_msgSend(v13, "mutableNotificationUsageByCategory") setObject:v14 forKeyedSubscript:v9];
    }
    [v14 addObject:v12];
  }
  else
  {
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    id v15 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138543362;
      id v17 = v7;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "No category found for %{public}@", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)recordMotionActivityEventsFor:(id)a3 within:(id)a4
{
  if (self)
  {
    lastMotionActivityEvent = self->_lastMotionActivityEvent;
    if (lastMotionActivityEvent)
    {
      id v8 = [(BMStoreEvent *)lastMotionActivityEvent eventBody];
      id v9 = [a3 eventBody];
      id v10 = [v8 startDate];
      id v11 = [v9 startDate];
      id v12 = [(UsageReportGenerator *)self getPoweredOffIntervalForEventStartDate:v10 endDate:v11];
      id newValue = a3;
      if (v12) {
        id v11 = [v12 startDate];
      }
      id v13 = sub_100012604(v10, v11, a4, 900.0);
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v14 = [(NSArray *)v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        id v16 = v14;
        uint64_t v17 = *(void *)v31;
        do
        {
          for (i = 0; i != v16; i = (char *)i + 1)
          {
            if (*(void *)v31 != v17) {
              objc_enumerationMutation(v13);
            }
            __int16 v19 = *(void **)(*((void *)&v30 + 1) + 8 * i);
            [v19 duration];
            if (v20 != 0.0)
            {
              id v21 = -[UsageReportGenerator deviceUsageReportForDate:](self, "deviceUsageReportForDate:", [v19 startDate]);
              uint64_t v22 = sub_10000EF54(v8);
              [v19 duration];
              double v24 = v23;
              unsigned int v25 = [(SRDeviceUsageDefaults *)self->_defaults isRoundingEnabled];
              double v26 = round(v24);
              if (!v25) {
                double v26 = v24;
              }
              long long v27 = +[_SRDeviceUsageMotionActivity motionActivityWithActivityType:v22 duration:v26];
              id v28 = [v21 _mutableMotionActivities];
              if (!v28)
              {
                id v28 = +[NSMutableArray array];
                [v21 set_mutableMotionActivities:v28];
              }
              [v28 addObject:v27];
            }
          }
          id v16 = [(NSArray *)v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v16);
      }
      objc_setProperty_nonatomic(self, v15, newValue, 232);
    }
    else
    {
      objc_setProperty_nonatomic(self, a2, a3, 232);
    }
  }
}

- (void)recordActivityLevelEventsFor:(id)a3 within:(id)a4
{
  id v4 = a3;
  if (!self || (lastActivityLevelEvent = self->_lastActivityLevelEvent) == 0)
  {
    id v31 = a3;
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    long long v30 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v38 = (_SRDeviceUsageActivityLevel *)[v31 eventBody];
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "No previous activity level event, saving %{private}@ until the next event", buf, 0xCu);
    }
LABEL_31:
    id v4 = v31;
    if (!self) {
      return;
    }
    goto LABEL_32;
  }
  long long v32 = (_SRDeviceUsageActivityLevel *)[(BMStoreEvent *)lastActivityLevelEvent eventBody];
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  id v8 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    [(BMStoreEvent *)self->_lastActivityLevelEvent timestamp];
    *(_DWORD *)buf = 138478083;
    v38 = v32;
    __int16 v39 = 2049;
    v40 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Using %{private}@ (timestamp: %{private}f) as last activity level", buf, 0x16u);
  }
  signed int v10 = [(_SRDeviceUsageActivityLevel *)v32 inUseStatus];
  [(BMStoreEvent *)self->_lastActivityLevelEvent timestamp];
  id v11 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  [v4 timestamp];
  id v12 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  id v13 = [(UsageReportGenerator *)self getPoweredOffIntervalForEventStartDate:v11 endDate:v12];
  if (v13) {
    id v12 = (NSDate *)[v13 startDate];
  }
  id v14 = sub_100012604(v11, v12, a4, 900.0);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v15 = [(NSArray *)v14 countByEnumeratingWithState:&v33 objects:v43 count:16];
  if (v15)
  {
    id v17 = v15;
    id v31 = v4;
    uint64_t v18 = *(void *)v34;
    do
    {
      __int16 v19 = 0;
      do
      {
        if (*(void *)v34 != v18) {
          objc_enumerationMutation(v14);
        }
        double v20 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v19);
        [v20 duration];
        if (v21 != 0.0)
        {
          id v22 = -[UsageReportGenerator deviceUsageReportForDate:](self, "deviceUsageReportForDate:", [v20 startDate]);
          [v20 duration];
          double v24 = v23;
          unsigned int v25 = [(SRDeviceUsageDefaults *)self->_defaults isRoundingEnabled];
          double v26 = round(v24);
          if (!v25) {
            double v26 = v24;
          }
          long long v27 = +[_SRDeviceUsageActivityLevel activityLevelWithLevel:v10 duration:v26];
          id v28 = [v22 _mutableActivityLevels];
          if (!v28)
          {
            id v28 = +[NSMutableArray array];
            [v22 set_mutableActivityLevels:v28];
          }
          if (qword_10002AA58 != -1) {
            dispatch_once(&qword_10002AA58, &stru_100025058);
          }
          uint64_t v29 = qword_10002AA60;
          if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138478339;
            v38 = v27;
            __int16 v39 = 2113;
            v40 = v32;
            __int16 v41 = 2113;
            v42 = v20;
            _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Recording SensorKit activity level %{private}@ from %{private}@ for date interval: %{private}@", buf, 0x20u);
          }
          [v28 addObject:v27];
        }
        __int16 v19 = (char *)v19 + 1;
      }
      while (v17 != v19);
      id v17 = [(NSArray *)v14 countByEnumeratingWithState:&v33 objects:v43 count:16];
    }
    while (v17);
    goto LABEL_31;
  }
LABEL_32:
  objc_setProperty_nonatomic(self, v16, v4, 240);
}

- (void)recordAppUsageEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5
{
  id v8 = [a3 eventBody];
  id v9 = [v8 absoluteTimestamp];
  id v10 = -[UsageReportGenerator getPoweredOffIntervalForEventStartDate:endDate:](self, "getPoweredOffIntervalForEventStartDate:endDate:", [v8 absoluteTimestamp], a4);
  if (v10) {
    a4 = [v10 startDate];
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  obj = sub_100012604(v9, a4, a5, 900.0);
  id v56 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v73 count:16];
  if (v56)
  {
    uint64_t v57 = *(void *)v65;
    *(void *)&long long v11 = 138412546;
    long long v53 = v11;
    v55 = v8;
LABEL_5:
    uint64_t v12 = 0;
    while (1)
    {
      if (*(void *)v65 != v57) {
        objc_enumerationMutation(obj);
      }
      id v13 = *(void **)(*((void *)&v64 + 1) + 8 * v12);
      [v13 duration:v53];
      if (v14 > 900.0) {
        break;
      }
      id v15 = [v8 bundleID];
      if (!v15)
      {
        if (qword_10002AA58 != -1) {
          dispatch_once(&qword_10002AA58, &stru_100025058);
        }
        uint64_t v51 = qword_10002AA60;
        if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138477827;
          uint64_t v70 = (uint64_t)v8;
          v48 = "Bundle id is nil for app usage event: %{private}@";
          v49 = v51;
          uint32_t v50 = 12;
          goto LABEL_67;
        }
        return;
      }
      uint64_t v16 = (uint64_t)v15;
      if ((sub_1000168AC((uint64_t)self, (uint64_t)v15) & 1) == 0)
      {
        if (qword_10002AA58 != -1) {
          dispatch_once(&qword_10002AA58, &stru_100025058);
        }
        v52 = qword_10002AA60;
        if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v70 = v16;
          _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Skipping bundle id %{public}@ because of its application type", buf, 0xCu);
        }
        return;
      }
      id v17 = sub_100015198(self, v16);
      if (v17) {
        goto LABEL_20;
      }
      if (qword_10002AA58 != -1) {
        dispatch_once(&qword_10002AA58, &stru_100025058);
      }
      uint64_t v18 = qword_10002AA60;
      if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v70 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Couldn't find a category for %{public}@, checking with the Categories framework", buf, 0xCu);
      }
      __int16 v19 = self ? self->_categoriesForBundleIDs : 0;
      id v17 = sub_10001240C([(NSMutableDictionary *)v19 objectForKeyedSubscript:v16]);
      if (v17 || (id v17 = sub_100012318(v16)) != 0)
      {
LABEL_20:
        id v58 = v17;
        uint64_t v59 = v12;
        if (self) {
          supplementalCategories = self->_supplementalCategories;
        }
        else {
          supplementalCategories = 0;
        }
        double v21 = +[NSMutableArray arrayWithArray:[(NSMutableDictionary *)supplementalCategories objectForKeyedSubscript:v16]];
        id v22 = +[NSMutableArray array];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v23 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v60 objects:v68 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v61;
          do
          {
            for (i = 0; i != v24; i = (char *)i + 1)
            {
              if (*(void *)v61 != v25) {
                objc_enumerationMutation(v21);
              }
              id v27 = [objc_alloc((Class)SRSupplementalCategory) initWithIdentifier:*(void *)(*((void *)&v60 + 1) + 8 * i)];
              [v22 addObject:v27];
            }
            id v24 = [(NSMutableArray *)v21 countByEnumeratingWithState:&v60 objects:v68 count:16];
          }
          while (v24);
        }
        id v28 = -[UsageReportGenerator deviceUsageReportForDate:](self, "deviceUsageReportForDate:", [v13 startDate]);
        uint64_t v29 = sub_100017B84((uint64_t)self, v16, v28);
        id v8 = v55;
        [objc_msgSend(v55, "absoluteTimestamp") srAbsoluteTime];
        -[UsageReportGenerator relativeAppStartTimeForReport:eventStartTime:](self, "relativeAppStartTimeForReport:eventStartTime:", v28);
        double v31 = v30;
        id v32 = [(UsageReportGenerator *)self getTextInputSessionsForBundleID:v16 interval:v13];
        if (!sub_1000169D4((BOOL)self, v16)) {
          uint64_t v16 = 0;
        }
        [v13 duration];
        double v34 = v33;
        if (self) {
          defaults = self->_defaults;
        }
        else {
          defaults = 0;
        }
        unsigned int v36 = [(SRDeviceUsageDefaults *)defaults isRoundingEnabled];
        double v37 = round(v34);
        if (v36) {
          double v34 = v37;
        }
        if (self) {
          v38 = self->_defaults;
        }
        else {
          v38 = 0;
        }
        unsigned int v39 = [(SRDeviceUsageDefaults *)v38 isRoundingEnabled];
        double v40 = round(v31);
        if (v39) {
          double v41 = v40;
        }
        else {
          double v41 = v31;
        }
        v42 = +[SRApplicationUsage applicationUsageWithBundleIdentifier:v16 reportApplicationIdentifier:v29 totalUsageTime:v32 relativeStartTime:v22 textInputSessions:v34 supplementalCategories:v41];
        if (qword_10002AA58 != -1) {
          dispatch_once(&qword_10002AA58, &stru_100025058);
        }
        uint64_t v12 = v59;
        v43 = qword_10002AA60;
        if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = v53;
          uint64_t v70 = (uint64_t)v42;
          __int16 v71 = 2112;
          id v72 = v58;
          _os_log_debug_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "Application usage:%@, category:%@", buf, 0x16u);
        }
        id v44 = [objc_msgSend(v28, "mutableApplicationUsageByCategory") objectForKeyedSubscript:v58];
        if (!v44)
        {
          id v44 = +[NSMutableArray array];
          [objc_msgSend(v28, "mutableApplicationUsageByCategory") setObject:v44 forKeyedSubscript:v58];
        }
        [v44 addObject:v42];
      }
      else
      {
        if (qword_10002AA58 != -1) {
          dispatch_once(&qword_10002AA58, &stru_100025058);
        }
        v45 = qword_10002AA60;
        if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v70 = v16;
          _os_log_error_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "No category found for %{public}@", buf, 0xCu);
        }
      }
      if ((id)++v12 == v56)
      {
        id v46 = [(NSArray *)obj countByEnumeratingWithState:&v64 objects:v73 count:16];
        id v56 = v46;
        if (!v46) {
          return;
        }
        goto LABEL_5;
      }
    }
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    uint64_t v47 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v70 = (uint64_t)a5;
      __int16 v71 = 2114;
      id v72 = v8;
      v48 = "Interval too long (%{public}@) for event: %{public}@";
      v49 = v47;
      uint32_t v50 = 22;
LABEL_67:
      _os_log_fault_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_FAULT, v48, buf, v50);
    }
  }
}

- (void)recordAppWebUsageEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5
{
  id v8 = [a3 eventBody];
  id v9 = [v8 absoluteTimestamp];
  id v10 = -[UsageReportGenerator getPoweredOffIntervalForEventStartDate:endDate:](self, "getPoweredOffIntervalForEventStartDate:endDate:", [v8 absoluteTimestamp], a4);
  if (v10) {
    a4 = [v10 startDate];
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  obj = sub_100012604(v9, a4, a5, 900.0);
  id v11 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v11)
  {
    id v13 = v11;
    uint64_t v14 = *(void *)v37;
    *(void *)&long long v12 = 138543362;
    long long v34 = v12;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v37 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(SRWebUsage **)(*((void *)&v36 + 1) + 8 * (void)v15);
        [(SRWebUsage *)v16 duration];
        if (v17 <= 900.0)
        {
          double v19 = v17;
          if (self) {
            categoriesForWebDomains = self->_categoriesForWebDomains;
          }
          else {
            categoriesForWebDomains = 0;
          }
          id v21 = sub_10001240C(-[NSMutableDictionary objectForKeyedSubscript:](categoriesForWebDomains, "objectForKeyedSubscript:", [v8 webDomain]));
          if (v21)
          {
            id v22 = v21;
            if (self) {
              defaults = self->_defaults;
            }
            else {
              defaults = 0;
            }
            unsigned int v25 = [(SRDeviceUsageDefaults *)defaults isRoundingEnabled];
            double v26 = round(v19);
            if (!v25) {
              double v26 = v19;
            }
            id v27 = +[SRWebUsage webUsageWithTotalUsageTime:v26];
            id v28 = [(UsageReportGenerator *)self deviceUsageReportForDate:[(SRWebUsage *)v16 startDate]];
            id v29 = [objc_msgSend(objc_msgSend(v28, "mutableWebUsageByCategory"), "objectForKeyedSubscript:", v22)];
            if (!v29)
            {
              id v29 = +[NSMutableArray array];
              [objc_msgSend(v28, "mutableWebUsageByCategory") setObject:v29 forKeyedSubscript:v22];
            }
            if (qword_10002AA58 != -1) {
              dispatch_once(&qword_10002AA58, &stru_100025058);
            }
            double v30 = qword_10002AA60;
            if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138478083;
              double v41 = v27;
              __int16 v42 = 2113;
              id v43 = v8;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Adding web usage event %{private}@ from %{private}@", buf, 0x16u);
            }
            [v29 addObject:v27];
          }
          else
          {
            if (qword_10002AA58 != -1) {
              dispatch_once(&qword_10002AA58, &stru_100025058);
            }
            double v31 = qword_10002AA60;
            if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
            {
              id v32 = (SRWebUsage *)[v8 webDomain];
              *(_DWORD *)buf = v34;
              double v41 = v32;
              _os_log_error_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "No category found for %{public}@", buf, 0xCu);
            }
          }
        }
        else
        {
          if (qword_10002AA58 != -1) {
            dispatch_once(&qword_10002AA58, &stru_100025058);
          }
          uint64_t v18 = qword_10002AA60;
          if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543618;
            double v41 = v16;
            __int16 v42 = 2114;
            id v43 = v8;
            _os_log_fault_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "Duration too long for web usage. %{public}@, %{public}@", buf, 0x16u);
          }
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v33 = [(NSArray *)obj countByEnumeratingWithState:&v36 objects:v44 count:16];
      id v13 = v33;
    }
    while (v33);
  }
}

- (void)recordDeviceBacklightEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5
{
  [a3 sr_eventTimestamp];
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  id v9 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Start date:%@, end date:%@", buf, 0x16u);
  }
  id v10 = [(UsageReportGenerator *)self getPoweredOffIntervalForEventStartDate:v8 endDate:a4];
  if (v10) {
    a4 = [v10 startDate];
  }
  id v11 = sub_100012604(v8, a4, a5, 900.0);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v15);
        id v17 = -[UsageReportGenerator deviceUsageReportForDate:](self, "deviceUsageReportForDate:", [v16 startDate]);
        if ([v16 containsDate:v8]) {
          [v17 setTotalScreenWakes:((char *)[v17 totalScreenWakes]) + 1];
        }
        [v16 duration];
        double v19 = v18;
        if (self) {
          defaults = self->_defaults;
        }
        else {
          defaults = 0;
        }
        unsigned int v21 = [(SRDeviceUsageDefaults *)defaults isRoundingEnabled];
        double v22 = round(v19);
        if (v21) {
          double v19 = v22;
        }
        [v17 totalScreenWakeDuration];
        [v17 setTotalScreenWakeDuration:v23 + v19];
        [v17 totalScreenWakeDuration];
        if (v24 > 900.0)
        {
          if (qword_10002AA58 != -1) {
            dispatch_once(&qword_10002AA58, &stru_100025058);
          }
          unsigned int v25 = qword_10002AA60;
          if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "Wake duration too long", buf, 2u);
          }
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v26 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v13 = v26;
    }
    while (v26);
  }
}

- (void)recordDevicePluggedInEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5
{
  [a3 sr_eventTimestamp];
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  id v9 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Start date:%@, end date:%@", buf, 0x16u);
  }
  id v10 = [(UsageReportGenerator *)self getPoweredOffIntervalForEventStartDate:v8 endDate:a4];
  if (v10) {
    a4 = [v10 startDate];
  }
  id v11 = sub_100012604(v8, a4, a5, 900.0);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v15);
        id v17 = -[UsageReportGenerator deviceUsageReportForDate:](self, "deviceUsageReportForDate:", [v16 startDate]);
        [v16 duration];
        double v19 = v18;
        if (self) {
          defaults = self->_defaults;
        }
        else {
          defaults = 0;
        }
        unsigned int v21 = [(SRDeviceUsageDefaults *)defaults isRoundingEnabled];
        double v22 = round(v19);
        if (v21) {
          double v19 = v22;
        }
        [v17 _totalChargingDuration];
        [v17 set_totalChargingDuration:v23 + v19];
        [v17 _totalChargingDuration];
        if (v24 > 900.0)
        {
          if (qword_10002AA58 != -1) {
            dispatch_once(&qword_10002AA58, &stru_100025058);
          }
          unsigned int v25 = qword_10002AA60;
          if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "Charging duration too long", buf, 2u);
          }
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v26 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v13 = v26;
    }
    while (v26);
  }
}

- (void)recordDeviceScreenIsLockedEventsFor:(id)a3 eventEndDate:(id)a4 within:(id)a5
{
  [a3 sr_eventTimestamp];
  id v8 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  id v9 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v33 = v8;
    __int16 v34 = 2112;
    id v35 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Start date:%@, end date:%@", buf, 0x16u);
  }
  id v10 = [(UsageReportGenerator *)self getPoweredOffIntervalForEventStartDate:v8 endDate:a4];
  if (v10) {
    a4 = [v10 startDate];
  }
  id v11 = sub_100012604(v8, a4, a5, 900.0);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v12)
  {
    id v13 = v12;
    uint64_t v14 = *(void *)v28;
    do
    {
      id v15 = 0;
      do
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v15);
        id v17 = -[UsageReportGenerator deviceUsageReportForDate:](self, "deviceUsageReportForDate:", [v16 startDate]);
        if ([v16 containsDate:v8]) {
          [v17 setTotalUnlocks:((char *)[v17 totalUnlocks]) + 1];
        }
        [v16 duration];
        double v19 = v18;
        if (self) {
          defaults = self->_defaults;
        }
        else {
          defaults = 0;
        }
        unsigned int v21 = [(SRDeviceUsageDefaults *)defaults isRoundingEnabled];
        double v22 = round(v19);
        if (v21) {
          double v19 = v22;
        }
        [v17 totalUnlockDuration];
        [v17 setTotalUnlockDuration:v23 + v19];
        [v17 totalUnlockDuration];
        if (v24 > 900.0)
        {
          if (qword_10002AA58 != -1) {
            dispatch_once(&qword_10002AA58, &stru_100025058);
          }
          unsigned int v25 = qword_10002AA60;
          if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_FAULT, "Unlock duration too long", buf, 2u);
          }
        }
        id v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v26 = [(NSArray *)v11 countByEnumeratingWithState:&v27 objects:v31 count:16];
      id v13 = v26;
    }
    while (v26);
  }
}

- (void)fetchCategoriesWithCompletionHandler:(id)a3
{
  if (self)
  {
    if ([(NSMutableSet *)self->_appsBundleIDsToFetchCategories count]
      || [(NSMutableSet *)self->_appsBundleIDsToFetchSupplementalCategories count]
      || [(NSMutableSet *)self->_notificationsBundleIDs count])
    {
      goto LABEL_7;
    }
    webDomains = self->_webDomains;
  }
  else
  {
    if ([0 count]) {
      goto LABEL_7;
    }
    if ([0 count]) {
      goto LABEL_7;
    }
    webDomains = (NSMutableSet *)[0 count];
    if (webDomains) {
      goto LABEL_7;
    }
  }
  if ([(NSMutableSet *)webDomains count])
  {
LABEL_7:
    *(void *)long long v37 = 0;
    long long v38 = v37;
    uint64_t v39 = 0x3052000000;
    double v40 = sub_10000D43C;
    double v41 = sub_10000D44C;
    uint64_t v42 = 0;
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3052000000;
    v36[3] = sub_10000D43C;
    v36[4] = sub_10000D44C;
    v36[5] = 0;
    v35[0] = 0;
    v35[1] = v35;
    v35[2] = 0x3052000000;
    v35[3] = sub_10000D43C;
    v35[4] = sub_10000D44C;
    v35[5] = 0;
    objc_initWeak(&location, self);
    if (qword_10002AA58 != -1) {
      dispatch_once(&qword_10002AA58, &stru_100025058);
    }
    id v6 = qword_10002AA60;
    if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Fetch data to categorize postponed events", buf, 2u);
    }
    id v7 = dispatch_group_create();
    if (self) {
      appsBundleIDsToFetchCategories = self->_appsBundleIDsToFetchCategories;
    }
    else {
      appsBundleIDsToFetchCategories = 0;
    }
    if ([(NSMutableSet *)appsBundleIDsToFetchCategories count]
      || (!self ? (id v9 = 0) : (id v9 = self->_notificationsBundleIDs), [(NSMutableSet *)v9 count]))
    {
      dispatch_group_enter(v7);
      if (self) {
        id v10 = self->_appsBundleIDsToFetchCategories;
      }
      else {
        id v10 = 0;
      }
      id v11 = +[NSMutableSet setWithSet:v10];
      id v12 = v11;
      if (self) {
        notificationsBundleIDs = self->_notificationsBundleIDs;
      }
      else {
        notificationsBundleIDs = 0;
      }
      [(NSMutableSet *)v11 unionSet:notificationsBundleIDs];
      id v14 = +[CTCategories sharedCategories];
      id v15 = [(NSMutableSet *)v12 allObjects];
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_100010C6C;
      v31[3] = &unk_100025010;
      v31[4] = v7;
      v31[5] = v37;
      objc_copyWeak(&v32, &location);
      [v14 categoriesForBundleIDs:v15 completionHandler:v31];
      objc_destroyWeak(&v32);
    }
    if (self) {
      uint64_t v16 = self->_webDomains;
    }
    else {
      uint64_t v16 = 0;
    }
    if ([(NSMutableSet *)v16 count])
    {
      dispatch_group_enter(v7);
      id v17 = +[CTCategories sharedCategories];
      if (self) {
        double v18 = self->_webDomains;
      }
      else {
        double v18 = 0;
      }
      id v19 = [(NSMutableSet *)v18 allObjects];
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_100010DB8;
      v29[3] = &unk_100025010;
      v29[4] = v7;
      v29[5] = v36;
      objc_copyWeak(&v30, &location);
      [v17 categoriesForDomainNames:v19 completionHandler:v29];
      objc_destroyWeak(&v30);
    }
    if (self) {
      appsBundleIDsToFetchSupplementalCategories = self->_appsBundleIDsToFetchSupplementalCategories;
    }
    else {
      appsBundleIDsToFetchSupplementalCategories = 0;
    }
    if ([(NSMutableSet *)appsBundleIDsToFetchSupplementalCategories count])
    {
      dispatch_group_enter(v7);
      if (self)
      {
        chClient = self->_chClient;
        double v23 = self->_appsBundleIDsToFetchSupplementalCategories;
      }
      else
      {
        chClient = 0;
        double v23 = 0;
      }
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_100010F04;
      v27[3] = &unk_100025010;
      v27[4] = v7;
      v27[5] = v35;
      objc_copyWeak(&v28, &location);
      [(SRCHClient *)chClient fetchCustomCategoriesForBundleIdentifiers:v23 completion:v27];
      objc_destroyWeak(&v28);
    }
    if (self) {
      Property = objc_getProperty(self, v21, 88, 1);
    }
    else {
      Property = 0;
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100011050;
    block[3] = &unk_100025038;
    block[4] = v7;
    block[5] = self;
    block[8] = v36;
    void block[9] = v35;
    block[6] = a3;
    block[7] = v37;
    dispatch_group_notify(v7, Property, block);
    objc_destroyWeak(&location);
    _Block_object_dispose(v35, 8);
    _Block_object_dispose(v36, 8);
    _Block_object_dispose(v37, 8);
    return;
  }
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  unsigned int v25 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "Nothing to categorize", v37, 2u);
  }
  (*((void (**)(id, void))a3 + 2))(a3, 0);
}

- (void)processPendingEventsForInterval:(id)a3
{
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  id v5 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Start processing of pending events", buf, 2u);
  }
  if (self) {
    pendingNotificationEvents = self->_pendingNotificationEvents;
  }
  else {
    pendingNotificationEvents = 0;
  }
  if ([(NSMutableSet *)pendingNotificationEvents count])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v7 = self ? self->_pendingNotificationEvents : 0;
    id v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v44;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v44 != v10) {
            objc_enumerationMutation(v7);
          }
          [(UsageReportGenerator *)self recordNotificationEventsFor:*(void *)(*((void *)&v43 + 1) + 8 * i) within:a3];
        }
        id v9 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v9);
    }
  }
  if (self) {
    pendingAppInFocusEventSessions = self->_pendingAppInFocusEventSessions;
  }
  else {
    pendingAppInFocusEventSessions = 0;
  }
  if ([(NSMutableArray *)pendingAppInFocusEventSessions count])
  {
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v13 = self ? self->_pendingAppInFocusEventSessions : 0;
    id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v14)
    {
      id v16 = v14;
      uint64_t v17 = *(void *)v40;
      *(void *)&long long v15 = 138412290;
      long long v34 = v15;
      do
      {
        double v18 = 0;
        do
        {
          if (*(void *)v40 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = *(void **)(*((void *)&v39 + 1) + 8 * (void)v18);
          id v21 = [v19 events];
          if ((unint64_t)objc_msgSend(objc_msgSend(v19, "events"), "count") > 1)
          {
            -[UsageReportGenerator recordAppUsageEventsFor:[v21 firstObject] eventEndDate:[objc_msgSend(objc_msgSend(objc_msgSend(v21, "lastObject"), "eventBody"), "absoluteTimestamp")] within:a3];
          }
          else
          {
            if (qword_10002AA58 != -1) {
              dispatch_once(&qword_10002AA58, &stru_100025058);
            }
            double v22 = qword_10002AA60;
            if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v34;
              v49 = v19;
              _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Invalid number of events in event sessions (App.InFocus): %@", buf, 0xCu);
            }
          }
          double v18 = (char *)v18 + 1;
        }
        while (v16 != v18);
        id v16 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v16);
    }
  }
  if (self) {
    pendingAppWebUsageEventSessions = self->_pendingAppWebUsageEventSessions;
  }
  else {
    pendingAppWebUsageEventSessions = 0;
  }
  if ([(NSMutableArray *)pendingAppWebUsageEventSessions count])
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    double v24 = self ? self->_pendingAppWebUsageEventSessions : 0;
    id v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v36;
      do
      {
        id v28 = 0;
        do
        {
          if (*(void *)v36 != v27) {
            objc_enumerationMutation(v24);
          }
          long long v29 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v28);
          id v31 = [v29 events];
          if ((unint64_t)objc_msgSend(objc_msgSend(v29, "events"), "count") > 1)
          {
            -[UsageReportGenerator recordAppWebUsageEventsFor:[v31 firstObject] eventEndDate:[objc_msgSend(objc_msgSend(objc_msgSend(v31, "lastObject"), "eventBody"), "absoluteTimestamp")] within:a3];
          }
          else
          {
            if (qword_10002AA58 != -1) {
              dispatch_once(&qword_10002AA58, &stru_100025058);
            }
            id v32 = qword_10002AA60;
            if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v49 = v29;
              _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Invalid number of events in event sessions (App.WebUsage): %@", buf, 0xCu);
            }
          }
          id v28 = (char *)v28 + 1;
        }
        while (v26 != v28);
        id v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v26);
    }
  }
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  id v33 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "Processing of pending events is completed", buf, 2u);
  }
}

- (void)extractInProgressEventsFromSessionBookmark:(id)a3
{
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [a3 upstreams];
  id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v24)
  {
    uint64_t v23 = *(void *)v31;
    do
    {
      uint64_t v4 = 0;
      do
      {
        if (*(void *)v31 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v25 = v4;
        id v5 = +[BMEventSession openSessionsFromBookmark:*(void *)(*((void *)&v30 + 1) + 8 * v4)];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v27;
          do
          {
            id v9 = 0;
            do
            {
              if (*(void *)v27 != v8) {
                objc_enumerationMutation(v5);
              }
              id v10 = [[objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)v9), "events") firstObject];
              if (self) {
                inProgressEvents = self->_inProgressEvents;
              }
              else {
                inProgressEvents = 0;
              }
              [(NSMutableArray *)inProgressEvents addObject:v10];
              [v10 eventBody];
              objc_opt_class();
              char isKindOfClass = objc_opt_isKindOfClass();
              id v13 = [v10 eventBody];
              id v14 = v13;
              if (isKindOfClass)
              {
                if (!sub_100015198(self, (uint64_t)[v13 bundleID]))
                {
                  if (self) {
                    appsBundleIDsToFetchCategories = self->_appsBundleIDsToFetchCategories;
                  }
                  else {
                    appsBundleIDsToFetchCategories = 0;
                  }
                  -[NSMutableSet addObject:](appsBundleIDsToFetchCategories, "addObject:", [v14 bundleID]);
                }
                if (self) {
                  appsBundleIDsToFetchSupplementalCategories = self->_appsBundleIDsToFetchSupplementalCategories;
                }
                else {
                  appsBundleIDsToFetchSupplementalCategories = 0;
                }
                id v17 = [v14 bundleID];
                double v18 = appsBundleIDsToFetchSupplementalCategories;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  goto LABEL_26;
                }
                id v19 = [v10 eventBody];
                if (self) {
                  webDomains = self->_webDomains;
                }
                else {
                  webDomains = 0;
                }
                id v17 = [v19 webDomain];
                double v18 = webDomains;
              }
              [(NSMutableSet *)v18 addObject:v17];
LABEL_26:
              id v9 = (char *)v9 + 1;
            }
            while (v7 != v9);
            id v21 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
            id v7 = v21;
          }
          while (v21);
        }
        uint64_t v4 = v25 + 1;
      }
      while ((id)(v25 + 1) != v24);
      id v24 = [obj countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }
}

- (void)processInProgressEventsForInterval:(id)a3
{
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  id v5 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Start processing of in-progress events", buf, 2u);
  }
  if (self)
  {
    lastMotionActivityEvent = self->_lastMotionActivityEvent;
    if (lastMotionActivityEvent)
    {
      id v57 = [(BMStoreEvent *)lastMotionActivityEvent eventBody];
      id v7 = [v57 startDate];
      id v8 = [a3 endDate];
      id v9 = [(UsageReportGenerator *)self getPoweredOffIntervalForEventStartDate:v7 endDate:v8];
      if (v9) {
        id v8 = [v9 startDate];
      }
      id v10 = sub_100012604(v7, v8, a3, 900.0);
      long long v68 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      long long v71 = 0u;
      id v11 = [(NSArray *)v10 countByEnumeratingWithState:&v68 objects:v76 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v69;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v69 != v13) {
              objc_enumerationMutation(v10);
            }
            long long v15 = *(void **)(*((void *)&v68 + 1) + 8 * i);
            [v15 duration];
            if (v16 != 0.0)
            {
              id v17 = -[UsageReportGenerator deviceUsageReportForDate:](self, "deviceUsageReportForDate:", [v15 startDate]);
              uint64_t v18 = sub_10000EF54(v57);
              [v15 duration];
              double v20 = v19;
              unsigned int v21 = [(SRDeviceUsageDefaults *)self->_defaults isRoundingEnabled];
              double v22 = round(v20);
              if (!v21) {
                double v22 = v20;
              }
              uint64_t v23 = +[_SRDeviceUsageMotionActivity motionActivityWithActivityType:v18 duration:v22];
              id v24 = [v17 _mutableMotionActivities];
              if (!v24)
              {
                id v24 = +[NSMutableArray array];
                [v17 set_mutableMotionActivities:v24];
              }
              [v24 addObject:v23];
            }
          }
          id v12 = [(NSArray *)v10 countByEnumeratingWithState:&v68 objects:v76 count:16];
        }
        while (v12);
      }
    }
    lastActivityLevelEvent = self->_lastActivityLevelEvent;
    if (lastActivityLevelEvent)
    {
      id v58 = [(BMStoreEvent *)lastActivityLevelEvent eventBody];
      [(BMStoreEvent *)self->_lastActivityLevelEvent timestamp];
      long long v26 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
      id v27 = [a3 endDate];
      id v28 = [(UsageReportGenerator *)self getPoweredOffIntervalForEventStartDate:v26 endDate:v27];
      if (v28) {
        id v27 = [v28 startDate];
      }
      long long v29 = sub_100012604(v26, v27, a3, 900.0);
      long long v64 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v30 = [(NSArray *)v29 countByEnumeratingWithState:&v64 objects:v75 count:16];
      if (v30)
      {
        id v31 = v30;
        uint64_t v32 = *(void *)v65;
        do
        {
          for (j = 0; j != v31; j = (char *)j + 1)
          {
            if (*(void *)v65 != v32) {
              objc_enumerationMutation(v29);
            }
            long long v34 = *(void **)(*((void *)&v64 + 1) + 8 * (void)j);
            [v34 duration];
            if (v35 != 0.0)
            {
              id v36 = -[UsageReportGenerator deviceUsageReportForDate:](self, "deviceUsageReportForDate:", [v34 startDate]);
              uint64_t v37 = (int)[v58 inUseStatus];
              [v34 duration];
              double v39 = v38;
              unsigned int v40 = [(SRDeviceUsageDefaults *)self->_defaults isRoundingEnabled];
              double v41 = round(v39);
              if (!v40) {
                double v41 = v39;
              }
              long long v42 = +[_SRDeviceUsageActivityLevel activityLevelWithLevel:v37 duration:v41];
              id v43 = [v36 _mutableActivityLevels];
              if (!v43)
              {
                id v43 = +[NSMutableArray array];
                [v36 set_mutableActivityLevels:v43];
              }
              [v43 addObject:v42];
            }
          }
          id v31 = [(NSArray *)v29 countByEnumeratingWithState:&v64 objects:v75 count:16];
        }
        while (v31);
      }
    }
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    inProgressEvents = self->_inProgressEvents;
  }
  else
  {
    inProgressEvents = 0;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
  }
  id v45 = [(NSMutableArray *)inProgressEvents countByEnumeratingWithState:&v60 objects:v74 count:16];
  if (v45)
  {
    id v46 = v45;
    uint64_t v47 = *(void *)v61;
    uint64_t v59 = 138412290;
    do
    {
      v48 = 0;
      do
      {
        if (*(void *)v61 != v47) {
          objc_enumerationMutation(inProgressEvents);
        }
        v49 = *(void **)(*((void *)&v60 + 1) + 8 * (void)v48);
        if (qword_10002AA58 != -1) {
          dispatch_once(&qword_10002AA58, &stru_100025058);
        }
        uint64_t v51 = qword_10002AA60;
        if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
        {
          v52 = (NSString *)[v49 eventBody];
          *(_DWORD *)buf = v59;
          v73 = v52;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "First event: %@", buf, 0xCu);
        }
        [v49 eventBody:v59];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          -[UsageReportGenerator recordAppUsageEventsFor:eventEndDate:within:](self, "recordAppUsageEventsFor:eventEndDate:within:", v49, [a3 endDate], a3);
        }
        else
        {
          [v49 eventBody];
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            -[UsageReportGenerator recordAppWebUsageEventsFor:eventEndDate:within:](self, "recordAppWebUsageEventsFor:eventEndDate:within:", v49, [a3 endDate], a3);
          }
          else
          {
            [v49 eventBody];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              -[UsageReportGenerator recordDevicePluggedInEventsFor:eventEndDate:within:](self, "recordDevicePluggedInEventsFor:eventEndDate:within:", v49, [a3 endDate], a3);
            }
            else
            {
              [v49 eventBody];
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                -[UsageReportGenerator recordDeviceBacklightEventsFor:eventEndDate:within:](self, "recordDeviceBacklightEventsFor:eventEndDate:within:", v49, [a3 endDate], a3);
              }
              else
              {
                [v49 eventBody];
                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  -[UsageReportGenerator recordDeviceScreenIsLockedEventsFor:eventEndDate:within:](self, "recordDeviceScreenIsLockedEventsFor:eventEndDate:within:", v49, [a3 endDate], a3);
                }
                else
                {
                  if (qword_10002AA58 != -1) {
                    dispatch_once(&qword_10002AA58, &stru_100025058);
                  }
                  long long v53 = qword_10002AA60;
                  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_ERROR))
                  {
                    [v49 eventBody];
                    v54 = (objc_class *)objc_opt_class();
                    v55 = NSStringFromClass(v54);
                    *(_DWORD *)buf = v59;
                    v73 = v55;
                    _os_log_error_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_ERROR, "Got unexpected data type in event session:%@", buf, 0xCu);
                  }
                }
              }
            }
          }
        }
        v48 = (char *)v48 + 1;
      }
      while (v46 != v48);
      id v46 = [(NSMutableArray *)inProgressEvents countByEnumeratingWithState:&v60 objects:v74 count:16];
    }
    while (v46);
  }
  if (qword_10002AA58 != -1) {
    dispatch_once(&qword_10002AA58, &stru_100025058);
  }
  id v56 = qword_10002AA60;
  if (os_log_type_enabled((os_log_t)qword_10002AA60, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Processing of in-progress events is completed", buf, 2u);
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    qword_10002AA78 = (uint64_t)os_log_create("com.apple.SensorKit", "SensorKitDuetDataCollector");
    double v2 = +[NSUserDefaults standardUserDefaults];
    v3[0] = @"phoneUsageReportInterval";
    v4[0] = +[NSNumber numberWithDouble:86400.0];
    v3[1] = @"queryDateShiftSinceNow";
    v4[1] = +[NSNumber numberWithDouble:86400.0];
    v4[2] = &__kCFBooleanFalse;
    v3[2] = @"bypassQueryFromMidnightToMidnight";
    v3[3] = @"messagesUsageReportInterval";
    v4[3] = +[NSNumber numberWithDouble:1800.0];
    [(NSUserDefaults *)v2 registerDefaults:+[NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:4]];
  }
}

- (UsageReportGenerator)initWithLaunchEvents:(id)a3 knowledgeStore:(id)a4 usageReportWriter:(id)a5 messagesUsageReportWriter:(id)a6 phoneUsageReportWriter:(id)a7 chClient:(id)a8 queue:(id)a9
{
  double v16 = objc_alloc_init(SRDeviceUsageDefaults);
  id v17 = [(UsageReportGenerator *)self initWithLaunchEvents:a3 knowledgeStore:a4 usageReportWriter:a5 messagesUsageReportWriter:a6 phoneUsageReportWriter:a7 chClient:a8 queue:a9 defaults:v16];

  return v17;
}

- (UsageReportGenerator)initWithLaunchEvents:(id)a3 knowledgeStore:(id)a4 usageReportWriter:(id)a5 messagesUsageReportWriter:(id)a6 phoneUsageReportWriter:(id)a7 chClient:(id)a8 queue:(id)a9 defaults:(id)a10
{
  v22.receiver = self;
  v22.super_class = (Class)UsageReportGenerator;
  double v16 = [(UsageReportGenerator *)&v22 init];
  if (v16)
  {
    v16->_queue = (OS_dispatch_queue *)a9;
    v16->_chClient = (SRCHClient *)a8;
    v16->_deviceUsageReportWriter = (SRSensorWriter *)a5;
    v16->_messagesUsageReportWriter = (SRSensorWriter *)a6;
    v16->_phoneUsageReportWriter = (SRSensorWriter *)a7;
    v16->_deviceUsageReports = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16->_eventsPendingCategories = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v16->_eventsPendingSupplementalCategories = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v16->_notificationBundleIdsByNotificationId = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16->_appUsesByBundleId = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16->_messagesUsageReports = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16->_phoneUsageReports = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    objc_setProperty_atomic(v16, v17, a4, 16);
    uint64_t v18 = (RDLaunchEvents *)a3;
    v16->_launchEvents = v18;
    if (v18) {
      objc_storeWeak((id *)&v18->_delegate, v16);
    }
    [(SRSensorWriter *)v16->_deviceUsageReportWriter setDelegate:v16];
    [(SRSensorWriter *)v16->_messagesUsageReportWriter setDelegate:v16];
    [(SRSensorWriter *)v16->_phoneUsageReportWriter setDelegate:v16];
    v16->_pendingNotificationEvents = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v16->_pendingAppInFocusEventSessions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v16->_pendingAppWebUsageEventSessions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v16->_inProgressEvents = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v16->_appsBundleIDsToFetchSupplementalCategories = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v16->_appsBundleIDsToFetchCategories = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v16->_notificationsBundleIDs = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v16->_webDomains = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v16->_textInputSessions = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v16->_categoriesForBundleIDs = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16->_categoriesForWebDomains = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16->_supplementalCategories = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v16->_devicePoweredOffIntervals = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_setProperty_nonatomic(v16, v19, 0, 232);
    objc_setProperty_nonatomic(v16, v20, 0, 240);
    v16->_defaults = (SRDeviceUsageDefaults *)a10;
  }
  return v16;
}

- (void)dealloc
{
  if (self)
  {
    objc_setProperty_nonatomic(self, a2, 0, 104);
    objc_setProperty_nonatomic(self, v3, 0, 96);
    objc_setProperty_atomic(self, v4, 0, 32);
    objc_setProperty_atomic(self, v5, 0, 40);
    objc_setProperty_nonatomic(self, v6, 0, 112);
    objc_setProperty_atomic(self, v7, 0, 80);
    objc_setProperty_atomic(self, v8, 0, 56);
    objc_setProperty_atomic(self, v9, 0, 72);
    objc_setProperty_atomic(self, v10, 0, 48);
    objc_setProperty_atomic(self, v11, 0, 64);
    objc_setProperty_atomic(self, v12, 0, 8);
    objc_setProperty_atomic(self, v13, 0, 16);
    chClient = self->_chClient;
    if (chClient) {
      [(NSXPCConnection *)chClient->_connection invalidate];
    }
    objc_setProperty_nonatomic(self, v14, 0, 120);
  }

  objc_setProperty_atomic(self, v16, 0, 88);
  self->_pendingNotificationEvents = 0;

  self->_pendingAppInFocusEventSessions = 0;
  self->_pendingAppWebUsageEventSessions = 0;

  self->_inProgressEvents = 0;
  self->_appsBundleIDsToFetchSupplementalCategories = 0;

  self->_appsBundleIDsToFetchCategories = 0;
  self->_notificationsBundleIDs = 0;

  self->_webDomains = 0;
  self->_categoriesForBundleIDs = 0;

  self->_categoriesForWebDomains = 0;
  self->_supplementalCategories = 0;

  self->_textInputSessions = 0;
  self->_devicePoweredOffIntervals = 0;

  objc_setProperty_nonatomic(self, v17, 0, 232);
  objc_setProperty_nonatomic(self, v18, 0, 240);
  v19.receiver = self;
  v19.super_class = (Class)UsageReportGenerator;
  [(UsageReportGenerator *)&v19 dealloc];
}

- (id)deviceUsageReportForDate:(id)a3
{
  id v4 = sub_100012298(900.0, 900.0, (uint64_t)NSDateInterval, a3);
  SEL v5 = (SRDeviceUsageReport *)[(NSMutableDictionary *)self->_deviceUsageReports objectForKeyedSubscript:v4];
  if (!v5)
  {
    SEL v5 = +[SRDeviceUsageReport deviceUsageReportWithInterval:v4];
    [(NSMutableDictionary *)self->_deviceUsageReports setObject:v5 forKeyedSubscript:v4];
    if (_os_feature_enabled_impl()) {
      CFStringRef v6 = @"1.0";
    }
    else {
      CFStringRef v6 = @"0.0";
    }
    chVersion = self->_chVersion;
    if (!chVersion)
    {
      chVersion = (NSString *)[sub_100004298((uint64_t)self->_chClient) copy];
      self->_chVersion = chVersion;
    }
    [(SRDeviceUsageReport *)v5 setVersion:+[NSString stringWithFormat:@"SupplementalCategories=%@, DataSourceVersion=%@", chVersion, v6]];
  }
  return v5;
}

- (void)queryUsageDuringInterval:(id)a3 completionHandler:(id)a4
{
  v26[0] = +[_DKQuery predicateForEventsWithStartOrEndInDateRangeWithFrom:to:](_DKQuery, "predicateForEventsWithStartOrEndInDateRangeWithFrom:[a3 startDate] to:[a3 endDate]");
  v26[1] = +[_DKQuery predicateForEventsWithNullSourceDeviceID];
  SEL v7 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:v26 count:2]);
  id v25 = +[_DKQuery startDateSortDescriptorAscending:1];
  SEL v8 = +[NSArray arrayWithObjects:&v25 count:1];
  id v9 = +[_DKSystemEventStreams deviceIsLockedStream];
  v24[0] = +[_DKSystemEventStreams appInFocusStream];
  v24[1] = +[_DKSystemEventStreams displayIsBacklit];
  v24[2] = v9;
  v24[3] = +[_DKSystemEventStreams notificationUsageStream];
  v24[4] = +[_DKSystemEventStreams appWebUsageStream];
  v24[5] = +[_DKSystemEventStreams motionStream];
  v24[6] = +[_DKSystemEventStreams deviceActivityLevelStream];
  v24[7] = +[_DKSystemEventStreams deviceIsPluggedInStream];
  SEL v10 = +[NSArray arrayWithObjects:v24 count:8];
  SEL v11 = +[_DKEventQuery eventQueryWithPredicate:v7 eventStreams:v10 offset:0 limit:0 sortDescriptors:v8];
  SEL v12 = qword_10002AA78;
  if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v19 = a3;
    __int16 v20 = 2114;
    unsigned int v21 = v7;
    __int16 v22 = 2114;
    uint64_t v23 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Querying interval %{public}@ with predicate %{public}@ for streams %{public}@", buf, 0x20u);
  }
  if (self)
  {
    id Property = objc_getProperty(self, v13, 16, 1);
    id v16 = objc_getProperty(self, v15, 88, 1);
  }
  else
  {
    id Property = 0;
    id v16 = 0;
  }
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_100015BB4;
  v17[3] = &unk_1000251D8;
  v17[4] = a3;
  v17[5] = self;
  v17[6] = v9;
  v17[7] = a4;
  [Property executeQuery:v11 responseQueue:v16 withCompletion:v17];
}

- (void)addTextInputSessionForInterval:(id)a3 event:(id)a4 category:(id)a5
{
  if (!a5)
  {
    uint64_t v14 = qword_10002AA78;
    if (!os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)buf = 138543362;
    id v55 = a4;
    SEL v11 = "No category provided for %{public}@";
    SEL v12 = v14;
    uint32_t v13 = 12;
    goto LABEL_7;
  }
  [a3 duration];
  if (v9 > 900.0)
  {
    uint64_t v10 = qword_10002AA78;
    if (!os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_FAULT)) {
      return;
    }
    *(_DWORD *)buf = 138543618;
    id v55 = a3;
    __int16 v56 = 2114;
    id v57 = a4;
    SEL v11 = "Interval too long (%{public}@) for event: %{public}@";
    SEL v12 = v10;
    uint32_t v13 = 22;
LABEL_7:
    _os_log_fault_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, v11, buf, v13);
    return;
  }
  id v47 = a3;
  id v15 = -[UsageReportGenerator deviceUsageReportForDate:](self, "deviceUsageReportForDate:", [a3 startDate]);
  [v15 _firstAppLaunchTimeRelativeToInterval];
  double v17 = v16;
  id v18 = -[NSMutableDictionary objectForKeyedSubscript:](self->_appUsesByBundleId, "objectForKeyedSubscript:", [a4 bundleID]);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id obj = [objc_msgSend(v15, "applicationUsageByCategory") objectForKeyedSubscript:a5];
  id v19 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
  if (v19)
  {
    id v21 = v19;
    uint64_t v22 = *(void *)v51;
    *(void *)&long long v20 = 134217984;
    long long v46 = v20;
    id v48 = a4;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v51 != v22) {
          objc_enumerationMutation(obj);
        }
        if (v18)
        {
          id v24 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if ([v18 containsObject:v24])
          {
            [v24 relativeStartTime];
            long long v26 = +[NSDate dateWithSRAbsoluteTime:v17 + v25];
            id v27 = objc_alloc((Class)NSDateInterval);
            [v24 usageTime];
            id v28 = [v27 initWithStartDate:v26];
            id v29 = objc_alloc((Class)NSDateInterval);
            id v30 = [a4 timestamp];
            [a4 duration];
            id v31 = [v29 initWithStartDate:v30];
            uint64_t v32 = qword_10002AA78;
            if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
            {
              id v41 = [a4 bundleID];
              [v48 duration];
              uint64_t v43 = v42;
              id v44 = [v31 intersectionWithDateInterval:v28];
              *(_DWORD *)buf = 138413314;
              id v55 = v28;
              __int16 v56 = 2112;
              id v57 = v31;
              __int16 v58 = 2112;
              id v59 = v41;
              a4 = v48;
              __int16 v60 = 2048;
              uint64_t v61 = v43;
              __int16 v62 = 2112;
              id v63 = v44;
              _os_log_error_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "appUsageDateInterval:%@, eventDateInterval:%@, bundle:%@, duration:%f, intersection:%@", buf, 0x34u);
            }
            if (objc_msgSend(v31, "intersectsDateInterval:", v28, v46))
            {
              uint64_t v34 = [a4 sessionInput] - 1;
              if (v34 >= 4)
              {
                unsigned int v40 = qword_10002AA78;
                if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_ERROR))
                {
                  signed int v45 = [a4 sessionInput];
                  *(_DWORD *)buf = v46;
                  id v55 = (id)v45;
                  _os_log_error_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "Unsupported BMTextInputSessionInput %lu", buf, 0xCu);
                }
              }
              else
              {
                uint64_t v35 = v34 + 1;
                [v47 duration];
                double v37 = v36;
                id v38 = [v48 sessionID];
                uint64_t v39 = v35;
                a4 = v48;
                [objc_msgSend(v24, "mutableTextInputSessions") addObject:[+[SRTextInputSession textInputSessionWithDuration:sessionType:sessionIdentifier:](SRTextInputSession, "textInputSessionWithDuration:sessionType:sessionIdentifier:", v39, v38, v37)];
              }
            }
          }
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v50 objects:v64 count:16];
    }
    while (v21);
  }
}

- (double)relativeAppStartTimeForReport:(id)a3 eventStartTime:(double)a4
{
  [a3 startTime];
  double v7 = fmax(v6, a4);
  [a3 _firstAppLaunchTimeRelativeToInterval];
  double v9 = fmin(v8, v7);
  [a3 _firstAppLaunchTimeRelativeToInterval];
  if (v9 < v10)
  {
    [a3 _firstAppLaunchTimeRelativeToInterval];
    double v12 = v11;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v13 = [a3 mutableApplicationUsageByCategory];
    id v14 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v14)
    {
      id v15 = v14;
      double v16 = v12 - v9;
      uint64_t v17 = *(void *)v32;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v32 != v17) {
            objc_enumerationMutation(v13);
          }
          id v19 = [objc_msgSend(a3, "mutableApplicationUsageByCategory") objectForKeyedSubscript:v31];
          long long v27 = 0u;
          long long v28 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          id v20 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (v20)
          {
            id v21 = v20;
            uint64_t v22 = *(void *)v28;
            do
            {
              for (j = 0; j != v21; j = (char *)j + 1)
              {
                if (*(void *)v28 != v22) {
                  objc_enumerationMutation(v19);
                }
                id v24 = *(void **)(*((void *)&v27 + 1) + 8 * (void)j);
                [v24 relativeStartTime];
                [v24 setRelativeStartTime:v16 + v25];
              }
              id v21 = [v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
            }
            while (v21);
          }
        }
        id v15 = [v13 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v15);
    }
    [a3 set_firstAppLaunchTimeRelativeToInterval:v9];
  }
  return v7 - v9;
}

- (void)addAppUsage:(id)a3 forBundleId:(id)a4
{
  id v7 = [(NSMutableDictionary *)self->_appUsesByBundleId objectForKeyedSubscript:a4];
  if (!v7)
  {
    id v7 = +[NSMutableArray array];
    [(NSMutableDictionary *)self->_appUsesByBundleId setObject:v7 forKeyedSubscript:a4];
  }

  [v7 addObject:a3];
}

- (void)launchEventRunActivity:(id)a3
{
  if (a3)
  {
    if ([*((id *)a3 + 1) isEqualToString:@"com.apple.sensorkit.launchUsageCollector"])
    {
LABEL_3:
      if (_os_feature_enabled_impl())
      {
        [(UsageReportGenerator *)self runDeviceUsageCollectionActivity:a3];
        return;
      }
      if (!self) {
        return;
      }
      SRAbsoluteTime v15 = SRAbsoluteTimeGetCurrent() + -604800.0;
      double v16 = +[NSDate dateWithSRAbsoluteTime:fmax(v15 - sub_1000132B8(), 0.0)];
      uint64_t v17 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"lastUsageQueryDate"];
      if (!v17)
      {
        SRAbsoluteTime v18 = SRAbsoluteTimeGetCurrent() + -86400.0;
        uint64_t v17 = +[NSDate dateWithSRAbsoluteTime:fmax(v18 - sub_1000132B8(), 0.0)];
      }
      id v19 = [(NSDate *)v17 laterDate:v16];
      double Current = SRAbsoluteTimeGetCurrent();
      [+[NSDate dateWithSRAbsoluteTime:fmax(Current - sub_1000132B8(), 0.0)] timeIntervalSinceReferenceDate];
      uint64_t v22 = +[NSDate dateWithTimeIntervalSinceReferenceDate:floor(v21 / 900.0) * 900.0];
      [(NSDate *)v22 timeIntervalSinceDate:v19];
      if (v23 >= 900.0)
      {
        id v31 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v19 endDate:v22];
        [(NSMutableDictionary *)self->_deviceUsageReports removeAllObjects];
        [(NSMutableSet *)self->_eventsPendingCategories removeAllObjects];
        [(NSMutableSet *)self->_eventsPendingSupplementalCategories removeAllObjects];
        [(NSMutableDictionary *)self->_notificationBundleIdsByNotificationId removeAllObjects];
        [(NSMutableDictionary *)self->_appUsesByBundleId removeAllObjects];
        objc_initWeak((id *)location, self);
        uint64_t v32 = os_transaction_create();
        *(void *)buf = _NSConcreteStackBlock;
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&buf[16] = sub_100017E70;
        long long v46 = &unk_100025248;
        objc_copyWeak(&v49, (id *)location);
        *(void *)&long long v47 = a3;
        *((void *)&v47 + 1) = v32;
        id v48 = v22;
        [(UsageReportGenerator *)self queryUsageDuringInterval:v31 completionHandler:buf];

        objc_destroyWeak(&v49);
        objc_destroyWeak((id *)location);
        return;
      }
      id v24 = qword_10002AA78;
      if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = +[NSDate now];
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2114;
        long long v46 = v22;
        LOWORD(v47) = 2050;
        *(void *)((char *)&v47 + 2) = 0x408C200000000000;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Time before now (%{public}@). Time interval (%{public}@ - %{public}@) is less than our report interval (%{public}f). Waiting until next time", buf, 0x2Au);
      }
LABEL_25:
      [a3 markCompleted];
      return;
    }
    SEL v5 = (void *)*((void *)a3 + 1);
  }
  else
  {
    unsigned __int8 v43 = [0 isEqualToString:@"com.apple.sensorkit.launchUsageCollector"];
    SEL v5 = 0;
    if (v43) {
      goto LABEL_3;
    }
  }
  if (![v5 isEqualToString:@"com.apple.sensorkit.launchInteractionHistoryCollector"]|| !self)
  {
    return;
  }
  double v6 = +[NSDate dateWithSRAbsoluteTime:fmax(SRAbsoluteTimeGetCurrent() + -604800.0, 0.0)];
  id v7 = [+[NSUserDefaults standardUserDefaults] objectForKey:@"lastInteractionHistoryQueryDate"];
  if (!v7) {
    id v7 = +[NSDate dateWithSRAbsoluteTime:fmax(SRAbsoluteTimeGetCurrent() + -86400.0, 0.0)];
  }
  double v8 = [(NSDate *)v7 laterDate:v6];
  if (![+[NSUserDefaults standardUserDefaults] BOOLForKey:@"bypassQueryFromMidnightToMidnight"])
  {
    double v9 = +[NSDate dateWithSRAbsoluteTime:0.0];
    double v10 = +[NSDate sr_localMidnightPriorToDate:v8];
    double v8 = +[NSDate sr_localMidnightFollowingDate:v8];
    if ([(NSDate *)v9 compare:v10] == NSOrderedAscending) {
      double v8 = v10;
    }
  }
  double v11 = +[NSDate date];
  double v12 = sub_100012FE8((uint64_t)self);
  if (![+[NSUserDefaults standardUserDefaults] BOOLForKey:@"bypassQueryFromMidnightToMidnight"])
  {
    id v14 = +[NSDate sr_localMidnightPriorToDate:v11];
    goto LABEL_27;
  }
  if (v12 != 86400.0
    || [+[NSUserDefaults standardUserDefaults] objectForKey:@"lastInteractionHistoryQueryDate"])
  {
    [(NSDate *)v11 timeIntervalSinceReferenceDate];
    id v14 = +[NSDate dateWithTimeIntervalSinceReferenceDate:v12 * floor(v13 / v12)];
LABEL_27:
    double v11 = v14;
  }
  double v25 = sub_100012FE8((uint64_t)self);
  [(NSDate *)v11 timeIntervalSinceDate:v8];
  if (v26 < v25)
  {
    long long v27 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
    {
      long long v28 = +[NSDate now];
      unsigned int v29 = [+[NSUserDefaults standardUserDefaults] BOOLForKey:@"bypassQueryFromMidnightToMidnight"];
      uint64_t v30 = *(void *)&v25;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v28;
      if (!v29) {
        uint64_t v30 = 0x40F5180000000000;
      }
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v8;
      *(_WORD *)&buf[22] = 2050;
      long long v46 = (void *)v30;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Time before now (%{public}@) and the last run (%{public}@) is less than our report interval (%{public}f). Waiting until next time", buf, 0x20u);
    }
    goto LABEL_25;
  }
  id v33 = [objc_alloc((Class)NSDateInterval) initWithStartDate:v8 endDate:v11];
  [(NSMutableDictionary *)self->_messagesUsageReports removeAllObjects];
  [(NSMutableDictionary *)self->_phoneUsageReports removeAllObjects];
  objc_initWeak(&from, self);
  uint64_t v34 = os_transaction_create();
  *(void *)buf = _NSConcreteStackBlock;
  *(void *)&uint8_t buf[8] = 3221225472;
  *(void *)&buf[16] = sub_100018088;
  long long v46 = &unk_100025248;
  objc_copyWeak(&v49, &from);
  *(void *)&long long v47 = a3;
  *((void *)&v47 + 1) = v34;
  id v48 = v11;
  id v56 = +[_DKQuery startDateSortDescriptorAscending:1];
  uint64_t v35 = +[NSArray arrayWithObjects:&v56 count:1];
  id v36 = +[NSMutableArray array];
  if ([(SRSensorWriter *)self->_messagesUsageReportWriter isMonitoring]) {
    [v36 addObjectsFromArray:&off_100026FD8];
  }
  if ([(SRSensorWriter *)self->_phoneUsageReportWriter isMonitoring]) {
    [v36 addObjectsFromArray:&off_100026FF0];
  }
  if ([v36 count])
  {
    double v37 = +[NSPredicate predicateWithFormat:@"mechanism IN %@", v36];
    id v38 = [_DKQuery predicateForEventsWithStartOrEndInDateRangeWithFrom:[v33 startDate] to:[v33 endDate]];
    v55[0] = v37;
    v55[1] = v38;
    uint64_t v39 = +[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", +[NSArray arrayWithObjects:v55 count:2]);
    id v40 = +[_CDInteractionRecorder interactionRecorder];
    id v41 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v33;
      *(_WORD *)&location[12] = 2114;
      *(void *)&location[14] = v39;
      *(_WORD *)&location[22] = 2114;
      long long v51 = v36;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Querying interval %{public}@ with predicate %{public}@ for mechanisms %{public}@", location, 0x20u);
    }
    *(void *)id location = _NSConcreteStackBlock;
    *(void *)&location[8] = 3221225472;
    *(void *)&location[16] = sub_100016D10;
    long long v51 = &unk_100025200;
    id v53 = v33;
    v54 = buf;
    long long v52 = self;
    [v40 queryInteractionsUsingPredicate:v39 sortDescriptors:v35 limit:0 completionHandler:location];
  }
  else
  {
    uint64_t v42 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id location = 0;
      _os_log_debug_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEBUG, "Neither phone nor message usage reports are being monitored.", location, 2u);
    }
  }

  objc_destroyWeak(&v49);
  objc_destroyWeak(&from);
}

- (void)sensorWriterWillStartMonitoring:(id)a3
{
  if (self->_deviceUsageReportWriter == a3)
  {
    SEL v5 = qword_10002AA78;
    if (os_log_type_enabled((os_log_t)qword_10002AA78, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Downloading supplemental categories database if necessary", buf, 2u);
    }
    chClient = self->_chClient;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100018DE0;
    v7[3] = &unk_1000252B0;
    v7[4] = self;
    [(SRCHClient *)chClient downloadDatabaseAssetIfNeeded:v7];
  }
  else
  {
    launchEvents = self->_launchEvents;
    CFStringRef v9 = @"com.apple.sensorkit.launchInteractionHistoryCollector";
    [(RDLaunchEvents *)launchEvents registerForXPCActivities:+[NSArray arrayWithObjects:&v9 count:1]];
  }
}

- (void)sensorWriterDidStopMonitoring:(id)a3
{
  if (self->_deviceUsageReportWriter == a3)
  {
    launchEvents = self->_launchEvents;
    CFStringRef v7 = @"com.apple.sensorkit.launchUsageCollector";
    SEL v5 = &v7;
    goto LABEL_6;
  }
  if (([(SRSensorWriter *)self->_messagesUsageReportWriter isMonitoring] & 1) == 0
    && ([(SRSensorWriter *)self->_phoneUsageReportWriter isMonitoring] & 1) == 0)
  {
    launchEvents = self->_launchEvents;
    CFStringRef v6 = @"com.apple.sensorkit.launchInteractionHistoryCollector";
    SEL v5 = &v6;
LABEL_6:
    [(RDLaunchEvents *)launchEvents unregisterForXPCActivities:+[NSArray arrayWithObjects:v5 count:1]];
  }
}

@end