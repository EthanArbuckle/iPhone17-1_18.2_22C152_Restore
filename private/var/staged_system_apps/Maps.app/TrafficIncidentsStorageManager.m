@interface TrafficIncidentsStorageManager
+ (id)sharedInstance;
+ (int64_t)creationPreference;
- (NSTimer)reportsExpirationTimer;
- (NSTimer)reportsResubmissionTimer;
- (TrafficIncidentsStorageManager)init;
- (id)_reports;
- (id)_sharedUserDefaults;
- (id)_trafficIncidentFeaturesUniqueIds;
- (id)observers;
- (id)removedTrafficIncidentFeaturesIds;
- (id)visibleReports;
- (void)_addReport:(id)a3;
- (void)_deleteExpiredReports;
- (void)_didModifyExistingReport:(id)a3;
- (void)_removeReport:(id)a3;
- (void)_startExpirationRefresh;
- (void)_updateTrafficIncidentFeatures;
- (void)addObserver:(id)a3;
- (void)addReport:(id)a3;
- (void)clearCache;
- (void)dealloc;
- (void)hideReport:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removeReport:(id)a3;
- (void)removeTrafficIncidentFeature:(id)a3;
- (void)resubmitLastReport;
- (void)setReportsExpirationTimer:(id)a3;
- (void)setReportsResubmissionTimer:(id)a3;
@end

@implementation TrafficIncidentsStorageManager

- (void)_startExpirationRefresh
{
  GEOConfigGetDouble();
  +[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_deleteExpiredReports", 0, 1);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [(TrafficIncidentsStorageManager *)self setReportsExpirationTimer:v3];
}

+ (id)sharedInstance
{
  if (qword_10160EA20 != -1) {
    dispatch_once(&qword_10160EA20, &stru_1012E70D8);
  }
  v2 = (void *)qword_10160EA18;

  return v2;
}

- (TrafficIncidentsStorageManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)TrafficIncidentsStorageManager;
  v2 = [(TrafficIncidentsStorageManager *)&v6 init];
  id v3 = v2;
  if (v2)
  {
    [(TrafficIncidentsStorageManager *)v2 _deleteExpiredReports];
    [(TrafficIncidentsStorageManager *)v3 _startExpirationRefresh];
    v4 = v3;
  }

  return v3;
}

- (void)_deleteExpiredReports
{
  double Current = CFAbsoluteTimeGetCurrent();
  v4 = [(TrafficIncidentsStorageManager *)self _reports];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    char v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v10 timestamp];
        double v12 = Current - v11;
        GEOConfigGetDouble();
        if (v12 > v13)
        {
          [(TrafficIncidentsStorageManager *)self _removeReport:v10];
          char v7 = 1;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v6);
    if ((([v4 count] != 0) & v7) == 1)
    {
      v14 = [(TrafficIncidentsStorageManager *)self observers];
      [v14 incidentsStorageManagerDidUpdate];

      v15 = sub_10039FFE8();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "TrafficIncidentsStorageManager deleted expired reports : %@", buf, 0xCu);
      }
    }
  }
  else
  {
    [v4 count];
  }
}

- (id)visibleReports
{
  v2 = [(TrafficIncidentsStorageManager *)self _reports];
  id v3 = +[NSPredicate predicateWithBlock:&stru_1012E7118];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  return v4;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(TrafficIncidentsStorageManager *)self observers];
  [v5 registerObserver:v4];
}

- (id)observers
{
  observers = self->_observers;
  if (!observers)
  {
    id v4 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___TrafficIncidentsStorageManagerObserver queue:&_dispatch_main_q];
    id v5 = self->_observers;
    self->_observers = v4;

    observers = self->_observers;
  }

  return observers;
}

- (id)_reports
{
  v2 = [(TrafficIncidentsStorageManager *)self _sharedUserDefaults];
  id v3 = [v2 dictionaryForKey:@"TrafficIncidentsStorageDictionaryKey"];
  id v4 = [v3 allValues];

  id v5 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"timestamp" ascending:1];
  id v6 = sub_100099700(v4, &stru_1012E7158);
  id v10 = v5;
  char v7 = +[NSArray arrayWithObjects:&v10 count:1];
  uint64_t v8 = [v6 sortedArrayUsingDescriptors:v7];

  return v8;
}

- (id)_sharedUserDefaults
{
  return +[NSUserDefaults __maps_groupUserDefaults];
}

+ (int64_t)creationPreference
{
  return 1;
}

- (void)setReportsExpirationTimer:(id)a3
{
}

- (void)dealloc
{
  id v3 = [(TrafficIncidentsStorageManager *)self reportsExpirationTimer];
  [v3 invalidate];

  [(TrafficIncidentsStorageManager *)self setReportsExpirationTimer:0];
  id v4 = [(TrafficIncidentsStorageManager *)self reportsResubmissionTimer];
  [v4 invalidate];

  [(TrafficIncidentsStorageManager *)self setReportsResubmissionTimer:0];
  v5.receiver = self;
  v5.super_class = (Class)TrafficIncidentsStorageManager;
  [(TrafficIncidentsStorageManager *)&v5 dealloc];
}

- (void)addReport:(id)a3
{
  id v6 = a3;
  id v4 = [(TrafficIncidentsStorageManager *)self _reports];
  if (([v4 containsObject:v6] & 1) == 0)
  {
    [(TrafficIncidentsStorageManager *)self _addReport:v6];
    objc_super v5 = [(TrafficIncidentsStorageManager *)self observers];
    [v5 incidentsStorageManagerDidAddReport:v6];
  }
}

- (void)removeReport:(id)a3
{
  [(TrafficIncidentsStorageManager *)self _removeReport:a3];
  id v4 = [(TrafficIncidentsStorageManager *)self observers];
  [v4 incidentsStorageManagerDidUpdate];
}

- (void)hideReport:(id)a3
{
  id v4 = a3;
  [v4 setHidden:1];
  [(TrafficIncidentsStorageManager *)self _didModifyExistingReport:v4];

  id v5 = [(TrafficIncidentsStorageManager *)self observers];
  [v5 incidentsStorageManagerDidUpdate];
}

- (void)_didModifyExistingReport:(id)a3
{
  id v5 = a3;
  id v4 = [(TrafficIncidentsStorageManager *)self _reports];
  if ([v4 containsObject:v5]) {
    [(TrafficIncidentsStorageManager *)self _addReport:v5];
  }
}

- (void)resubmitLastReport
{
  id v3 = [(TrafficIncidentsStorageManager *)self _reports];
  id v4 = [v3 lastObject];

  [v4 setSubmissionCount:[v4 submissionCount] + 1];
  [v4 setSubmissionFailed:0];
  [(TrafficIncidentsStorageManager *)self _didModifyExistingReport:v4];
  id v5 = [v4 submissionCount];
  if ((unint64_t)v5 <= GEOConfigGetUInteger())
  {
    uint64_t UInteger = GEOConfigGetUInteger();
    dispatch_time_t v7 = dispatch_time(0, 1000000000 * UInteger);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10039FEC4;
    block[3] = &unk_1012E5D08;
    id v9 = v4;
    dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)removeTrafficIncidentFeature:(id)a3
{
  id v4 = a3;
  trafficIncidentFeatures = self->_trafficIncidentFeatures;
  id v9 = v4;
  if (!trafficIncidentFeatures)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    dispatch_time_t v7 = self->_trafficIncidentFeatures;
    self->_trafficIncidentFeatures = v6;

    id v4 = v9;
    trafficIncidentFeatures = self->_trafficIncidentFeatures;
  }
  [(NSMutableSet *)trafficIncidentFeatures addObject:v4];
  uint64_t v8 = [(TrafficIncidentsStorageManager *)self observers];
  [v8 incidentsStorageManagerDidUpdateVendorIncidentFeatures];

  [(TrafficIncidentsStorageManager *)self _updateTrafficIncidentFeatures];
}

- (id)removedTrafficIncidentFeaturesIds
{
  v2 = [(TrafficIncidentsStorageManager *)self _trafficIncidentFeaturesUniqueIds];
  id v3 = +[NSSet setWithArray:v2];

  return v3;
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(TrafficIncidentsStorageManager *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)_addReport:(id)a3
{
  id v4 = a3;
  id v11 = [(TrafficIncidentsStorageManager *)self _sharedUserDefaults];
  id v5 = [v11 dictionaryForKey:@"TrafficIncidentsStorageDictionaryKey"];
  id v6 = [v5 mutableCopy];

  if (!v6) {
    id v6 = objc_alloc_init((Class)NSMutableDictionary);
  }
  dispatch_time_t v7 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  uint64_t v8 = [v4 uniqueID];

  id v9 = [v8 UUIDString];
  [v6 setValue:v7 forKey:v9];

  id v10 = [v6 copy];
  [v11 setObject:v10 forKey:@"TrafficIncidentsStorageDictionaryKey"];

  [v11 synchronize];
}

- (void)_removeReport:(id)a3
{
  id v10 = a3;
  id v4 = [(TrafficIncidentsStorageManager *)self _sharedUserDefaults];
  id v5 = [v4 dictionaryForKey:@"TrafficIncidentsStorageDictionaryKey"];
  id v6 = [v5 mutableCopy];

  if ([v6 count])
  {
    dispatch_time_t v7 = [v10 uniqueID];
    uint64_t v8 = [v7 UUIDString];
    [v6 removeObjectForKey:v8];

    id v9 = [v6 copy];
    [v4 setObject:v9 forKey:@"TrafficIncidentsStorageDictionaryKey"];

    [v4 synchronize];
  }
}

- (id)_trafficIncidentFeaturesUniqueIds
{
  if ([(NSMutableSet *)self->_trafficIncidentFeatures count])
  {
    id v3 = sub_100099700(self->_trafficIncidentFeatures, &stru_1012E7198);
  }
  else
  {
    id v3 = &__NSArray0__struct;
  }

  return v3;
}

- (void)_updateTrafficIncidentFeatures
{
  if ([(NSMutableSet *)self->_trafficIncidentFeatures count])
  {
    id v3 = +[UIApplication sharedMapsDelegate];
    id v4 = [v3 appCoordinator];
    id v5 = [v4 chromeViewController];
    id v8 = [v5 mapView];

    id v6 = [v8 _mapLayer];
    dispatch_time_t v7 = [(NSMutableSet *)self->_trafficIncidentFeatures allObjects];
    [v6 setHiddenTrafficIncidentFeatures:v7];
  }
}

- (void)clearCache
{
  id v4 = [(TrafficIncidentsStorageManager *)self _sharedUserDefaults];
  [v4 setObject:0 forKey:@"TrafficIncidentsStorageDictionaryKey"];
  [v4 synchronize];
  id v3 = [(TrafficIncidentsStorageManager *)self observers];
  [v3 incidentsStorageManagerDidUpdate];
}

- (NSTimer)reportsExpirationTimer
{
  return self->_reportsExpirationTimer;
}

- (NSTimer)reportsResubmissionTimer
{
  return self->_reportsResubmissionTimer;
}

- (void)setReportsResubmissionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reportsResubmissionTimer, 0);
  objc_storeStrong((id *)&self->_reportsExpirationTimer, 0);
  objc_storeStrong((id *)&self->_trafficIncidentFeatures, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

@end