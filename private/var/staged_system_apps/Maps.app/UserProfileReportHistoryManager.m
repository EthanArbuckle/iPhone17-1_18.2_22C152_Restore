@interface UserProfileReportHistoryManager
+ (id)sharedInstance;
- (BOOL)_inKorea;
- (BOOL)_isChinaCountryCode:(id)a3;
- (BOOL)_isKoreaCountryCode:(id)a3;
- (BOOL)_shouldShowReportOrIncidentCreatedInCountry:(id)a3;
- (BOOL)hasInReviewRAPs;
- (BOOL)hasIncidentReports;
- (BOOL)hasReviewedRAPs;
- (BOOL)hasTellUsMoreRAPs;
- (BOOL)inChina;
- (BOOL)isChinaUserOutsideOfChina;
- (GEOObserverHashTable)observers;
- (NSArray)rapHistory;
- (UserProfileReportHistoryManager)init;
- (int64_t)_daysBetweenDates:(id)a3 currentDate:(id)a4;
- (int64_t)crashesCount;
- (int64_t)hazardsCount;
- (int64_t)roadWorkCount;
- (int64_t)speedChecksCount;
- (void)_cancelMapItemTicket;
- (void)_fetchMapItemsForRAPHistoryIfNeeded;
- (void)_loadReportsAndIncidents;
- (void)_updateReports:(id)a3 incidents:(id)a4;
- (void)countryConfigurationDidChange:(id)a3;
- (void)refineRAPHistory;
@end

@implementation UserProfileReportHistoryManager

+ (id)sharedInstance
{
  if (qword_10160FDE0 != -1) {
    dispatch_once(&qword_10160FDE0, &stru_1012FF208);
  }
  v2 = (void *)qword_10160FDD8;

  return v2;
}

- (UserProfileReportHistoryManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)UserProfileReportHistoryManager;
  v2 = [(UserProfileReportHistoryManager *)&v9 init];
  if (v2)
  {
    v3 = +[GEOCountryConfiguration sharedConfiguration];
    uint64_t v4 = [v3 countryCode];
    countryCode = v2->_countryCode;
    v2->_countryCode = (NSString *)v4;

    v6 = +[RAPRecordMapsSync sharedInstance];
    [v6 registerObserver:v2];

    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"countryConfigurationDidChange:" name:GEOCountryConfigurationCountryCodeDidChangeNotification object:0];

    [(UserProfileReportHistoryManager *)v2 _loadReportsAndIncidents];
  }
  return v2;
}

- (GEOObserverHashTable)observers
{
  observers = self->_observers;
  if (!observers)
  {
    uint64_t v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___UserProfileReportHistoryManagerObserver queue:0];
    v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (BOOL)inChina
{
  return [(UserProfileReportHistoryManager *)self _isChinaCountryCode:self->_countryCode];
}

- (BOOL)_inKorea
{
  return [(UserProfileReportHistoryManager *)self _isKoreaCountryCode:self->_countryCode];
}

- (BOOL)_isChinaCountryCode:(id)a3
{
  return [a3 isEqualToString:@"CN"];
}

- (BOOL)_isKoreaCountryCode:(id)a3
{
  return [a3 isEqualToString:@"KR"];
}

- (BOOL)isChinaUserOutsideOfChina
{
  if ([(UserProfileReportHistoryManager *)self inChina]) {
    return 0;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v4 = self->_allRAPReports;
  id v5 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        objc_super v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) countryCodeUponCreation:v12];
        unsigned __int8 v10 = [(UserProfileReportHistoryManager *)self _isChinaCountryCode:v9];

        if (v10)
        {
          BOOL v3 = 1;
          goto LABEL_13;
        }
      }
      id v6 = [(NSArray *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  BOOL v3 = 0;
LABEL_13:

  return v3;
}

- (BOOL)_shouldShowReportOrIncidentCreatedInCountry:(id)a3
{
  id v4 = a3;
  BOOL v5 = (![(UserProfileReportHistoryManager *)self inChina]
     || [(UserProfileReportHistoryManager *)self _isChinaCountryCode:v4])
    && (![(UserProfileReportHistoryManager *)self _inKorea]
     || [(UserProfileReportHistoryManager *)self _isKoreaCountryCode:v4])
    && ([(UserProfileReportHistoryManager *)self inChina]
     || ![(UserProfileReportHistoryManager *)self _isChinaCountryCode:v4])
    && ([(UserProfileReportHistoryManager *)self _inKorea]
     || ![(UserProfileReportHistoryManager *)self _isKoreaCountryCode:v4]);

  return v5;
}

- (BOOL)hasIncidentReports
{
  unsigned int v3 = [(UserProfileReportHistoryManager *)self inChina];
  uint64_t v5 = 96;
  if (v3) {
    uint64_t v5 = 104;
  }
  int64_t v4 = self->_hazardsCount + self->_crashesCount;
  return !((*(uint64_t *)((char *)&self->super.isa + v5) + v4 < 0) ^ __OFADD__(v4, *(Class *)((char *)&self->super.isa + v5)) | ((Class)(*(char **)((char *)&self->super.isa + v5) + v4) == 0));
}

- (void)_loadReportsAndIncidents
{
  unsigned int v3 = dispatch_group_create();
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  v17[3] = sub_100104094;
  v17[4] = sub_1001048C8;
  id v18 = 0;
  dispatch_group_enter(v3);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1008AA684;
  v14[3] = &unk_1012FF230;
  v16 = v17;
  int64_t v4 = v3;
  long long v15 = v4;
  +[RAPRecordManager fetchAllRAPRecordsWithCompletion:v14];
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_100104094;
  v12[4] = sub_1001048C8;
  id v13 = 0;
  dispatch_group_enter(v4);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1008AA6E0;
  v9[3] = &unk_1012FF230;
  v11 = v12;
  uint64_t v5 = v4;
  unsigned __int8 v10 = v5;
  +[RAPRecordManager fetchAllTrafficIncidentReportsWithCompletion:v9];
  objc_initWeak(&location, self);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1008AA73C;
  v6[3] = &unk_1012FB560;
  objc_copyWeak(&v7, &location);
  v6[4] = v17;
  v6[5] = v12;
  dispatch_group_notify(v5, (dispatch_queue_t)&_dispatch_main_q, v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(v17, 8);
}

- (void)_updateReports:(id)a3 incidents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_super v9 = +[NSDate date];
  uint64_t UInteger = GEOConfigGetUInteger();
  objc_storeStrong((id *)&self->_allRAPReports, a3);
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1008AAB38;
  v41[3] = &unk_1012FF258;
  v41[4] = self;
  id v11 = v9;
  id v42 = v11;
  uint64_t v43 = UInteger;
  v31 = v7;
  sub_1000AC254(v7, v41);
  long long v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  filteredRAPReports = self->_filteredRAPReports;
  self->_filteredRAPReports = v12;

  objc_storeStrong((id *)&self->_allTrafficIncidentReports, a4);
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_1008AABD8;
  v40[3] = &unk_1012FF280;
  v40[4] = self;
  v30 = v8;
  sub_1000AC254(v8, v40);
  long long v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  filteredTrafficIncidentReports = self->_filteredTrafficIncidentReports;
  self->_filteredTrafficIncidentReports = v14;

  *(_WORD *)&self->_hasTellUsMoreRAPs = 0;
  self->_hasReviewedRAPs = 0;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v16 = self->_filteredRAPReports;
  id v17 = [(NSArray *)v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v37;
    do
    {
      v20 = 0;
      do
      {
        if (*(void *)v37 != v19) {
          objc_enumerationMutation(v16);
        }
        unsigned int v21 = [*(id *)(*((void *)&v36 + 1) + 8 * (void)v20) reportStatus:v30, v31];
        p_hasInReviewRAPs = &self->_hasInReviewRAPs;
        if (!v21) {
          goto LABEL_11;
        }
        if (v21 == 2)
        {
          p_hasInReviewRAPs = &self->_hasTellUsMoreRAPs;
LABEL_11:
          BOOL *p_hasInReviewRAPs = 1;
          goto LABEL_12;
        }
        p_hasInReviewRAPs = &self->_hasReviewedRAPs;
        if (v21 == 1) {
          goto LABEL_11;
        }
LABEL_12:
        v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSArray *)v16 countByEnumeratingWithState:&v36 objects:v45 count:16];
    }
    while (v18);
  }

  *(_OWORD *)&self->_crashesCount = 0u;
  *(_OWORD *)&self->_speedChecksCount = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v23 = self->_filteredTrafficIncidentReports;
  id v24 = [(NSArray *)v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
  if (v24)
  {
    id v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      v27 = 0;
      do
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        int v28 = [*(id *)(*((void *)&v32 + 1) + 8 * (void)v27) incidentType:v30];
        if (v28 > 6)
        {
          if (v28 == 7)
          {
            p_roadWorkCount = &self->_roadWorkCount;
LABEL_27:
            ++*p_roadWorkCount;
            goto LABEL_28;
          }
          p_roadWorkCount = &self->_speedChecksCount;
          if (v28 == 16) {
            goto LABEL_27;
          }
        }
        else
        {
          p_roadWorkCount = &self->_crashesCount;
          if (v28 == 5) {
            goto LABEL_27;
          }
          p_roadWorkCount = &self->_hazardsCount;
          if (v28 == 6) {
            goto LABEL_27;
          }
        }
LABEL_28:
        v27 = (char *)v27 + 1;
      }
      while (v25 != v27);
      id v25 = [(NSArray *)v23 countByEnumeratingWithState:&v32 objects:v44 count:16];
    }
    while (v25);
  }

  [(GEOObserverHashTable *)self->_observers reportHistoryManagerDidUpdate:self];
  [(UserProfileReportHistoryManager *)self _fetchMapItemsForRAPHistoryIfNeeded];
}

- (int64_t)_daysBetweenDates:(id)a3 currentDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSCalendar currentCalendar];
  id v8 = [v7 components:16 fromDate:v6 toDate:v5 options:0];

  id v9 = [v8 day];
  return (int64_t)v9;
}

- (NSArray)rapHistory
{
  if (self->_filteredRAPReports) {
    return self->_filteredRAPReports;
  }
  else {
    return (NSArray *)&__NSArray0__struct;
  }
}

- (void)refineRAPHistory
{
  if (!self->_wantsRefinedRAPHistory)
  {
    self->_wantsRefinedRAPHistory = 1;
    if (!self->_mapItemTicket) {
      [(UserProfileReportHistoryManager *)self _fetchMapItemsForRAPHistoryIfNeeded];
    }
  }
}

- (void)_fetchMapItemsForRAPHistoryIfNeeded
{
  [(UserProfileReportHistoryManager *)self _cancelMapItemTicket];
  val = self;
  if (self->_wantsRefinedRAPHistory)
  {
    uint64_t v26 = +[NSMutableDictionary dictionary];
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    unsigned int v3 = self->_filteredRAPReports;
    id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
    if (v4)
    {
      uint64_t v5 = *(void *)v32;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v32 != v5) {
            objc_enumerationMutation(v3);
          }
          id v7 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v8 = [v7 mapItem];

          if (!v8)
          {
            id v9 = [v7 contentData];
            unsigned __int8 v10 = [v9 mapItemStorage];
            id v11 = v10;
            if (v10)
            {
              long long v12 = [v10 _identifier];
              if (v12)
              {
                id v13 = [objc_alloc((Class)MKMapItemIdentifier) initWithGEOMapItemIdentifier:v12];
                long long v14 = [v26 objectForKeyedSubscript:v13];
                if (!v14)
                {
                  long long v14 = +[NSMutableArray array];
                  [v26 setObject:v14 forKeyedSubscript:v13];
                }
                [v14 addObject:v7];
              }
            }
          }
        }
        id v4 = [(NSArray *)v3 countByEnumeratingWithState:&v31 objects:v36 count:16];
      }
      while (v4);
    }

    long long v15 = [v26 allKeys];
    id v16 = [v15 count];
    id v17 = sub_100011FD4();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v18)
      {
        unsigned int v19 = [v26 count];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v19;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Refining map items for %d RAPs", buf, 8u);
      }

      v20 = +[MKMapService sharedService];
      uint64_t v21 = [v20 ticketForIdentifiers:v15 traits:0];
      mapItemTicket = val->_mapItemTicket;
      val->_mapItemTicket = (MKMapServiceTicket *)v21;

      objc_initWeak((id *)buf, val);
      v23 = val->_mapItemTicket;
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1008AB098;
      v27[3] = &unk_1012EA198;
      objc_copyWeak(&v30, (id *)buf);
      id v28 = v15;
      id v29 = v26;
      [(MKMapServiceTicket *)v23 submitWithHandler:v27 networkActivity:0];

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v18)
      {
        unsigned int v24 = [(NSArray *)val->_filteredRAPReports count];
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "No map item refinements needed for %d RAPs. Skipping.", buf, 8u);
      }
    }
  }
}

- (void)_cancelMapItemTicket
{
  [(MKMapServiceTicket *)self->_mapItemTicket cancel];
  mapItemTicket = self->_mapItemTicket;
  self->_mapItemTicket = 0;
}

- (void)countryConfigurationDidChange:(id)a3
{
  id v4 = +[GEOCountryConfiguration sharedConfiguration];
  uint64_t v5 = [v4 countryCode];
  countryCode = self->_countryCode;
  self->_countryCode = v5;

  [(UserProfileReportHistoryManager *)self _loadReportsAndIncidents];
}

- (BOOL)hasTellUsMoreRAPs
{
  return self->_hasTellUsMoreRAPs;
}

- (BOOL)hasInReviewRAPs
{
  return self->_hasInReviewRAPs;
}

- (BOOL)hasReviewedRAPs
{
  return self->_hasReviewedRAPs;
}

- (int64_t)crashesCount
{
  return self->_crashesCount;
}

- (int64_t)hazardsCount
{
  return self->_hazardsCount;
}

- (int64_t)speedChecksCount
{
  return self->_speedChecksCount;
}

- (int64_t)roadWorkCount
{
  return self->_roadWorkCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItemTicket, 0);
  objc_storeStrong((id *)&self->_filteredTrafficIncidentReports, 0);
  objc_storeStrong((id *)&self->_allTrafficIncidentReports, 0);
  objc_storeStrong((id *)&self->_filteredRAPReports, 0);
  objc_storeStrong((id *)&self->_allRAPReports, 0);
  objc_storeStrong((id *)&self->_countryCode, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end