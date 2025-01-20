@interface RAPSubmissionStatusSyncHandler
- (RAPSubmissionStatusSyncHandler)init;
- (void)_fetchUnresolvedRAPRecordsWithLimit:(unint64_t)a3 offset:(int64_t)a4 oldestDate:(id)a5 completion:(id)a6;
- (void)_updateMapsSyncRAPRecordWithIdentifiers:(id)a3 toStatus:(signed __int16)a4 forceUpdate:(BOOL)a5 editBlock:(id)a6 completion:(id)a7;
- (void)_updateRAPStatusWithIdentifiers:(id)a3 toStatus:(signed __int16)a4 extraEditBlock:(id)a5 completion:(id)a6;
- (void)_updateRAPStatusWithIdentifiers:(id)a3 toStatus:(signed __int16)a4 forceUpdate:(BOOL)a5 extraEditBlock:(id)a6 completion:(id)a7;
- (void)fetchUnresolvedRAPIdentifiersWithBatchSize:(unint64_t)a3 offset:(int64_t)a4 oldestDate:(id)a5 completion:(id)a6;
- (void)saveIdentifier:(id)a3 completion:(id)a4;
- (void)setFixedProblemAsReviewed:(id)a3;
- (void)setIdentifiersAsReviewed:(id)a3 completion:(id)a4;
- (void)updateRAPsStatusWithRapInfos:(id)a3 completion:(id)a4;
@end

@implementation RAPSubmissionStatusSyncHandler

- (RAPSubmissionStatusSyncHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)RAPSubmissionStatusSyncHandler;
  v2 = [(RAPSubmissionStatusSyncHandler *)&v6 init];
  if (v2)
  {
    v3 = sub_100A38F7C();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Initializing submission status sync handler", v5, 2u);
    }
  }
  return v2;
}

- (void)fetchUnresolvedRAPIdentifiersWithBatchSize:(unint64_t)a3 offset:(int64_t)a4 oldestDate:(id)a5 completion:(id)a6
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A3908C;
  v11[3] = &unk_101313F88;
  id v12 = a6;
  int64_t v13 = a4;
  id v10 = v12;
  [(RAPSubmissionStatusSyncHandler *)self _fetchUnresolvedRAPRecordsWithLimit:a3 offset:a4 oldestDate:a5 completion:v11];
}

- (void)_fetchUnresolvedRAPRecordsWithLimit:(unint64_t)a3 offset:(int64_t)a4 oldestDate:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"((status == 0) || (status == 2)) && reportId != ''" argumentArray:0];
  id v27 = v10;
  int64_t v13 = +[NSArray arrayWithObjects:&v27 count:1];
  v14 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"createTime > %@" argumentArray:v13];

  id v15 = objc_alloc((Class)_TtC8MapsSync22MapsSyncQueryPredicate);
  v26[0] = v12;
  v26[1] = v14;
  v16 = +[NSArray arrayWithObjects:v26 count:2];
  id v17 = [v15 initWithAnd:v16];

  id v18 = [objc_alloc((Class)_TtC8MapsSync13MapsSyncRange) initWithOffset:a4 limit:a3];
  id v19 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v17 sortDescriptors:0 range:v18];
  objc_initWeak(&location, self);
  id v20 = objc_alloc_init((Class)MSRAPRecordRequest);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100A39684;
  v22[3] = &unk_1012EB628;
  objc_copyWeak(&v24, &location);
  id v21 = v11;
  id v23 = v21;
  [v20 fetchWithOptions:v19 completionHandler:v22];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);
}

- (void)setFixedProblemAsReviewed:(id)a3
{
  v4 = [a3 problemStatus];
  v5 = [v4 firstObject];

  objc_super v6 = [v5 problemId];

  v7 = sub_100A38F7C();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v9 = [v5 problemId];
      *(_DWORD *)buf = 138412290;
      v16 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Received notification for fixed RAP: %@", buf, 0xCu);
    }
    id v10 = [v5 problemId];
    v14 = v10;
    id v11 = +[NSArray arrayWithObjects:&v14 count:1];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100A3997C;
    v12[3] = &unk_1012EB010;
    int64_t v13 = v5;
    [(RAPSubmissionStatusSyncHandler *)self setIdentifiersAsReviewed:v11 completion:v12];

    v8 = v13;
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Received notification for fixed RAP with nil GEORPProblemStatus problemID. Problem status: %@", buf, 0xCu);
  }
}

- (void)setIdentifiersAsReviewed:(id)a3 completion:(id)a4
{
}

- (void)updateRAPsStatusWithRapInfos:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v29 = a4;
  objc_super v6 = sub_100A38F7C();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Updating RAP submissions with RapInfos:%@", (uint8_t *)&buf, 0xCu);
  }

  v7 = objc_opt_new();
  v8 = objc_opt_new();
  v9 = objc_opt_new();
  id v10 = +[NSMutableDictionary dictionary];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v11 = v5;
  id v12 = [v11 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v50;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v50 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        unsigned int v16 = [v15 rapDisplayMenu];
        switch(v16)
        {
          case 1u:
            id v17 = [v15 rapId];
            [v9 addObject:v17];
            break;
          case 3u:
            id v17 = [v15 rapId];
            [v8 addObject:v17];
            break;
          case 2u:
            id v17 = [v15 rapId];
            [v7 addObject:v17];
            break;
          default:
            goto LABEL_15;
        }

LABEL_15:
        id v18 = [v15 rapResponse];
        BOOL v19 = v18 == 0;

        if (!v19)
        {
          id v20 = [v15 rapResponse];
          id v21 = [v15 rapId];
          [v10 setObject:v20 forKeyedSubscript:v21];
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v12);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v56 = 0x3032000000;
  v57 = sub_100104254;
  v58 = sub_1001049A8;
  id v59 = 0;
  v22 = dispatch_group_create();
  id v23 = sub_100A38F7C();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v53 = 138412290;
    v54 = v7;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Array of RAP submissions that have been Reviewed: %@", v53, 0xCu);
  }

  dispatch_group_enter(v22);
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_100A3A130;
  v47[3] = &unk_101314F18;
  id v24 = v10;
  id v48 = v24;
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_100A3A1D4;
  v44[3] = &unk_1012F17B8;
  p_long long buf = &buf;
  v25 = v22;
  v45 = v25;
  [(RAPSubmissionStatusSyncHandler *)self _updateRAPStatusWithIdentifiers:v7 toStatus:1 forceUpdate:1 extraEditBlock:v47 completion:v44];
  v26 = sub_100A38F7C();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v53 = 138412290;
    v54 = v8;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Array of RAP submissions that in \"Tell Us More\" statuses: %@", v53, 0xCu);
  }

  if ([v8 count])
  {
    dispatch_group_enter(v25);
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_100A3A23C;
    v42[3] = &unk_101314F18;
    id v43 = v24;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100A3A2E0;
    v39[3] = &unk_1012F17B8;
    v41 = &buf;
    v40 = v25;
    [(RAPSubmissionStatusSyncHandler *)self _updateRAPStatusWithIdentifiers:v8 toStatus:2 forceUpdate:1 extraEditBlock:v42 completion:v39];
  }
  id v27 = sub_100A38F7C();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v53 = 138412290;
    v54 = v9;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Array of RAP submissions that in \"In Review\" statuses: %@", v53, 0xCu);
  }

  if ([v9 count])
  {
    dispatch_group_enter(v25);
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100A3A348;
    v37[3] = &unk_101314F18;
    id v38 = v24;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100A3A3EC;
    v34[3] = &unk_1012F17B8;
    v36 = &buf;
    v35 = v25;
    [(RAPSubmissionStatusSyncHandler *)self _updateRAPStatusWithIdentifiers:v9 toStatus:0 extraEditBlock:v37 completion:v34];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100A3A454;
  block[3] = &unk_1012E79E8;
  id v32 = v29;
  v33 = &buf;
  id v28 = v29;
  dispatch_group_notify(v25, (dispatch_queue_t)&_dispatch_main_q, block);

  _Block_object_dispose(&buf, 8);
}

- (void)_updateRAPStatusWithIdentifiers:(id)a3 toStatus:(signed __int16)a4 extraEditBlock:(id)a5 completion:(id)a6
{
}

- (void)_updateRAPStatusWithIdentifiers:(id)a3 toStatus:(signed __int16)a4 forceUpdate:(BOOL)a5 extraEditBlock:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v10 = a4;
  id v12 = a3;
  id v13 = a7;
  id v14 = a6;
  id v15 = sub_100A38F7C();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    int v16 = 134218240;
    id v17 = [v12 count];
    __int16 v18 = 1024;
    int v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Updating %lu RAPs status to: %d", (uint8_t *)&v16, 0x12u);
  }

  [(RAPSubmissionStatusSyncHandler *)self _updateMapsSyncRAPRecordWithIdentifiers:v12 toStatus:v10 forceUpdate:v9 editBlock:v14 completion:v13];
}

- (void)_updateMapsSyncRAPRecordWithIdentifiers:(id)a3 toStatus:(signed __int16)a4 forceUpdate:(BOOL)a5 editBlock:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  int v10 = a4;
  id v12 = a3;
  id v13 = a6;
  id v14 = a7;
  if ([v12 count])
  {
    if (v9)
    {
      id v28 = v12;
      id v15 = +[NSArray arrayWithObjects:&v28 count:1];
      int v16 = +[MapsSyncQueryPredicate queryPredicateWithFormat:@"reportId IN %@" argumentArray:v15];
    }
    else
    {
      id v17 = +[NSString stringWithFormat:@"status != %d", v10];
      id v15 = [v17 stringByAppendingString:@" AND reportId IN %@"];

      id v27 = v12;
      __int16 v18 = +[NSArray arrayWithObjects:&v27 count:1];
      int v16 = +[MapsSyncQueryPredicate queryPredicateWithFormat:v15 argumentArray:v18];
    }
    id v19 = [objc_alloc((Class)_TtC8MapsSync20MapsSyncQueryOptions) initWithPredicate:v16 sortDescriptors:0 range:0];
    objc_initWeak(&location, self);
    id v20 = objc_alloc_init((Class)MSRAPRecordRequest);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100A3A840;
    v21[3] = &unk_101314F40;
    id v22 = v14;
    id v23 = v13;
    __int16 v25 = v10;
    objc_copyWeak(&v24, &location);
    [v20 fetchWithOptions:v19 completionHandler:v21];

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
  else
  {
    (*((void (**)(id, void))v14 + 2))(v14, 0);
  }
}

- (void)saveIdentifier:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init((Class)MSRAPRecord);
  [v7 setReportId:v6];

  v8 = +[MapsSyncStore sharedStore];
  id v13 = v7;
  BOOL v9 = +[NSArray arrayWithObjects:&v13 count:1];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100A3ACC0;
  v11[3] = &unk_1012E76C0;
  id v12 = v5;
  id v10 = v5;
  [v8 saveWithObjects:v9 completionHandler:v11];
}

@end