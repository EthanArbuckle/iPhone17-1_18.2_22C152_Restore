@interface RAPRecordMapsSync
+ (RAPRecordMapsSync)sharedInstance;
- (GEOObserverHashTable)observers;
- (NSArray)storeSubscriptionTypes;
- (RAPRecordMapsSync)init;
- (void)_buildMapsSyncRAPRecord:(id)a3 communityID:(id)a4 completion:(id)a5;
- (void)addRAPRecord:(id)a3 completion:(id)a4;
- (void)addTrafficIncidentReport:(id)a3 completion:(id)a4;
- (void)editStatusOfRAPRecordWithReportID:(id)a3 toStatus:(signed __int16)a4 completion:(id)a5;
- (void)fetchAllRAPHistoryObjectsWithCompletion:(id)a3;
- (void)fetchAllTrafficIncidentReportsWithCompletion:(id)a3;
- (void)fetchRAPHistoryWithReportId:(id)a3 completion:(id)a4;
- (void)registerObserver:(id)a3;
- (void)setObservers:(id)a3;
- (void)setStoreSubscriptionTypes:(id)a3;
- (void)storeDidChangeWithTypes:(id)a3;
- (void)unregisterObserver:(id)a3;
@end

@implementation RAPRecordMapsSync

+ (RAPRecordMapsSync)sharedInstance
{
  if (qword_10160FC78 != -1) {
    dispatch_once(&qword_10160FC78, &stru_1012FE8D8);
  }
  v2 = (void *)qword_10160FC70;

  return (RAPRecordMapsSync *)v2;
}

- (RAPRecordMapsSync)init
{
  v11.receiver = self;
  v11.super_class = (Class)RAPRecordMapsSync;
  v2 = [(RAPRecordMapsSync *)&v11 init];
  if (v2)
  {
    v3 = (GEOObserverHashTable *)[objc_alloc((Class)GEOObserverHashTable) initWithProtocol:&OBJC_PROTOCOL___RAPRecordObserver queue:0];
    observers = v2->_observers;
    v2->_observers = v3;

    uint64_t v5 = +[CommunityIDMapsSync shared];
    communityIDMapsSync = v2->_communityIDMapsSync;
    v2->_communityIDMapsSync = (_TtC4Maps19CommunityIDMapsSync *)v5;

    v7 = +[MapsSyncStore sharedStore];
    [v7 subscribe:v2];

    v12[0] = objc_opt_class();
    v12[1] = objc_opt_class();
    uint64_t v8 = +[NSArray arrayWithObjects:v12 count:2];
    storeSubscriptionTypes = v2->storeSubscriptionTypes;
    v2->storeSubscriptionTypes = (NSArray *)v8;
  }
  return v2;
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPRecordMapsSync *)self observers];
  [v5 registerObserver:v4];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(RAPRecordMapsSync *)self observers];
  [v5 unregisterObserver:v4];
}

- (void)fetchAllRAPHistoryObjectsWithCompletion:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_100104074;
  v9[4] = sub_1001048B8;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)MSRAPRecordRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10088B72C;
  v6[3] = &unk_1012F2908;
  uint64_t v8 = v9;
  id v5 = v3;
  id v7 = v5;
  [v4 fetchWithCompletionHandler:v6];

  _Block_object_dispose(v9, 8);
}

- (void)addRAPRecord:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 communityIdentifier];
  id v9 = [v8 length];

  if (v9)
  {
    objc_initWeak(&location, self);
    communityIDMapsSync = self->_communityIDMapsSync;
    objc_super v11 = [v6 communityIdentifier];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    void v12[2] = sub_10088B9A4;
    v12[3] = &unk_1012FA0D0;
    objc_copyWeak(&v15, &location);
    id v14 = v7;
    id v13 = v6;
    [(CommunityIDMapsSync *)communityIDMapsSync fetchCommunityIDWithIdentifier:v11 completion:v12];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    [(RAPRecordMapsSync *)self _buildMapsSyncRAPRecord:v6 communityID:0 completion:v7];
  }
}

- (void)_buildMapsSyncRAPRecord:(id)a3 communityID:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_alloc_init((Class)MSRAPRecord);
  objc_super v11 = [v9 reportID];
  [v10 setReportId:v11];

  [v10 setType:(__int16)[v9 reportType]];
  v12 = [v9 reportSummary];
  [v10 setSummary:v12];

  id v13 = [v9 countryCodeUponCreation];
  [v10 setCountryCode:v13];

  [v10 setStatus:[v9 reportStatus]];
  id v14 = [v9 contentData];
  id v15 = +[NSKeyedArchiver archivedDataWithRootObject:v14 requiringSecureCoding:0 error:0];

  [v10 setContentData:v15];
  v16 = [v9 rapResponse];
  v17 = +[NSKeyedArchiver archivedDataWithRootObject:v16 requiringSecureCoding:0 error:0];

  [v10 setRapResponse:v17];
  [v10 setCommunityID:v7];
  LOWORD(v16) = (unsigned __int16)[v9 clientRevision];

  [v10 setClientRevision:(__int16)v16];
  id v18 = objc_alloc_init((Class)NSMutableArray);
  [v18 addObject:v10];
  if (v7) {
    [v18 addObject:v7];
  }
  v19 = +[MapsSyncStore sharedStore];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10088BD38;
  v21[3] = &unk_1012E76C0;
  id v22 = v8;
  id v20 = v8;
  [v19 saveWithObjects:v18 completionHandler:v21];
}

- (void)fetchRAPHistoryWithReportId:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = sub_100104074;
  v18[4] = sub_1001048B8;
  id v19 = objc_alloc_init((Class)NSMutableArray);
  objc_initWeak(&location, self);
  id v20 = v6;
  id v8 = +[NSArray arrayWithObjects:&v20 count:1];
  id v9 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"reportId == %@" argumentArray:v8];

  id v10 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v9 sortDescriptors:0 range:0];
  id v11 = objc_alloc_init((Class)MSRAPRecordRequest);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10088C09C;
  v13[3] = &unk_1012FE900;
  objc_copyWeak(&v16, &location);
  id v15 = v18;
  id v12 = v7;
  id v14 = v12;
  [v11 fetchWithOptions:v10 completionHandler:v13];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
  _Block_object_dispose(v18, 8);
}

- (void)editStatusOfRAPRecordWithReportID:(id)a3 toStatus:(signed __int16)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = sub_100104074;
  v25[4] = sub_1001048B8;
  id v26 = 0;
  id v27 = v8;
  id v10 = +[NSArray arrayWithObjects:&v27 count:1];
  id v11 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"reportId == %@" argumentArray:v10];

  id v12 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v11 sortDescriptors:0 range:0];
  objc_initWeak(&location, self);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10088C468;
  v21[3] = &unk_1012E9690;
  objc_copyWeak(&v23, &location);
  id v13 = v9;
  id v22 = v13;
  id v14 = objc_retainBlock(v21);
  id v15 = objc_alloc_init((Class)MSRAPRecordRequest);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10088C4D8;
  v17[3] = &unk_1012FE928;
  id v16 = v14;
  id v18 = v16;
  id v19 = v25;
  signed __int16 v20 = a4;
  [v15 fetchWithOptions:v12 completionHandler:v17];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  _Block_object_dispose(v25, 8);
}

- (void)fetchAllTrafficIncidentReportsWithCompletion:(id)a3
{
  id v3 = a3;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = sub_100104074;
  v9[4] = sub_1001048B8;
  id v10 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)MSIncidentReportRequest);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10088C928;
  v6[3] = &unk_1012F2908;
  id v8 = v9;
  id v5 = v3;
  id v7 = v5;
  [v4 fetchWithCompletionHandler:v6];

  _Block_object_dispose(v9, 8);
}

- (void)addTrafficIncidentReport:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)MSIncidentReport);
  signed __int16 v8 = (unsigned __int16)[v6 incidentType];

  [v7 setType:v8];
  id v9 = +[GEOCountryConfiguration sharedConfiguration];
  id v10 = [v9 countryCode];
  [v7 setCountryCode:v10];

  id v11 = +[MapsSyncStore sharedStore];
  id v16 = v7;
  id v12 = +[NSArray arrayWithObjects:&v16 count:1];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10088CBB4;
  v14[3] = &unk_1012E76C0;
  id v15 = v5;
  id v13 = v5;
  [v11 saveWithObjects:v12 completionHandler:v14];
}

- (void)storeDidChangeWithTypes:(id)a3
{
}

- (NSArray)storeSubscriptionTypes
{
  return self->storeSubscriptionTypes;
}

- (void)setStoreSubscriptionTypes:(id)a3
{
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->storeSubscriptionTypes, 0);

  objc_storeStrong((id *)&self->_communityIDMapsSync, 0);
}

@end