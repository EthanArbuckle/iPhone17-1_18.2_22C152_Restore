@interface KTSMDataStoreActual
- (BOOL)clearDataStore:(id *)a3;
- (BOOL)clearDeviceSignatures:(id *)a3;
- (BOOL)haveDoneFixup:(id)a3;
- (BOOL)storeIDMSDeviceList:(id)a3 error:(id *)a4;
- (BOOL)storeQueryRequest:(id)a3 queryResponse:(id)a4 serverHint:(id)a5 uri:(id)a6 application:(id)a7 error:(id *)a8;
- (BOOL)storeSelfVerificationInfo:(id)a3 application:(id)a4 error:(id *)a5;
- (KTSMDataStoreActual)initWithPersistentContainer:(id)a3;
- (NSPersistentContainer)container;
- (id)errorFromData:(id)a3;
- (id)errorFromJson:(id)a3;
- (id)getSettingsData:(id)a3;
- (id)getSettingsDate:(id)a3;
- (id)getSettingsNumber:(id)a3;
- (id)jsonifyError:(id)a3;
- (id)managedObjectContextWithMergePolicy;
- (id)pushTokenForService:(id)a3;
- (void)_onQueueClearDeviceSignatureSignatures;
- (void)delete:(id)a3 onMOC:(id)a4;
- (void)deleteFixup:(id)a3;
- (void)deleteSelfVerificationInfoForApplication:(id)a3 error:(id *)a4;
- (void)fetchDeviceSignature:(id)a3 complete:(id)a4;
- (void)fetchIDMSDeviceList:(id)a3;
- (void)fetchKTInfoForApplication:(id)a3 uri:(id)a4 complete:(id)a5;
- (void)fetchSelfVerificationInfoForApplication:(id)a3 complete:(id)a4;
- (void)setContainer:(id)a3;
- (void)setSettingsData:(id)a3 data:(id)a4;
- (void)setSettingsDate:(id)a3 date:(id)a4;
- (void)setSettingsNumber:(id)a3 number:(id)a4;
- (void)storeDeviceSignature:(id)a3 complete:(id)a4;
- (void)storeFixup:(id)a3;
- (void)uploadedDeviceSignature:(id)a3 tbs:(id)a4 uploadedAt:(id)a5 complete:(id)a6;
@end

@implementation KTSMDataStoreActual

- (KTSMDataStoreActual)initWithPersistentContainer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)KTSMDataStoreActual;
  v5 = [(KTSMDataStoreActual *)&v9 init];
  v6 = v5;
  if (v5)
  {
    [(KTSMDataStoreActual *)v5 setContainer:v4];
    v7 = v6;
  }

  return v6;
}

- (id)managedObjectContextWithMergePolicy
{
  v2 = [(KTSMDataStoreActual *)self container];
  id v3 = [v2 newBackgroundContext];

  id v4 = +[NSMergePolicy mergeByPropertyStoreTrumpMergePolicy];
  [v3 setMergePolicy:v4];

  return v3;
}

- (void)fetchSelfVerificationInfoForApplication:(id)a3 complete:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *, uint64_t, uint64_t))a4;
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C4190);
  }
  v8 = qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "fetchSelfVerificationInfoForApplication:application:", buf, 2u);
  }
  objc_super v9 = +[CachedData fetchRequest];
  v10 = +[NSPredicate predicateWithFormat:@"key = %@ AND application = %@ AND unique = %@", @"SelfVerificationInfo", v6, &stru_1002CE4C0];
  [v9 setPredicate:v10];

  *(void *)buf = 0;
  v39 = buf;
  uint64_t v40 = 0x3032000000;
  v41 = sub_100188E24;
  v42 = sub_100188E34;
  id v43 = 0;
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  v35 = sub_100188E24;
  v36 = sub_100188E34;
  id v37 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x3032000000;
  v29 = sub_100188E24;
  v30 = sub_100188E34;
  id v31 = 0;
  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100188E3C;
  v20[3] = &unk_1002C41B8;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v21 = v11;
  id v12 = v9;
  id v22 = v12;
  v23 = &v26;
  v24 = buf;
  v25 = &v32;
  [v11 performBlockAndWait:v20];
  if (*((void *)v39 + 5))
  {
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = *((void *)v39 + 5);
    v15 = (id *)(v27 + 5);
    id obj = (id)v27[5];
    v16 = +[NSKeyedUnarchiver unarchivedObjectOfClass:v13 fromData:v14 error:&obj];
    objc_storeStrong(v15, obj);
    v7[2](v7, v16, v33[5], v27[5]);
  }
  else
  {
    if (qword_10032EE68 != -1) {
      dispatch_once(&qword_10032EE68, &stru_1002C41D8);
    }
    v17 = qword_10032EE70;
    if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "fetchSelfVerificationInfoForApplication: no data", v19, 2u);
    }
    v7[2](v7, 0, 0, v27[5]);
  }

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(buf, 8);
}

- (BOOL)storeSelfVerificationInfo:(id)a3 application:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C41F8);
  }
  v10 = (void *)qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_INFO))
  {
    id v11 = v10;
    id v12 = [v8 syncedLoggableDatas];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "storeSelfVerificationInfo: syncedLoggableDatas %@", (uint8_t *)&buf, 0xCu);
  }
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C4218);
  }
  uint64_t v13 = (void *)qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = v13;
    v15 = [v8 uriToServerLoggableDatas];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "storeSelfVerificationInfo: uriToServerLoggableDatas: %@", (uint8_t *)&buf, 0xCu);
  }
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C4238);
  }
  v16 = (void *)qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_INFO))
  {
    v17 = v16;
    v18 = [v8 selfDeviceID];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "storeSelfVerificationInfo: selfDeviceID: %@", (uint8_t *)&buf, 0xCu);
  }
  v19 = +[NSKeyedArchiver archivedDataWithRootObject:v8 requiringSecureCoding:1 error:a5];
  if (v19)
  {
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x2020000000;
    char v38 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v42 = 0x3032000000;
    id v43 = sub_100188E24;
    v44 = sub_100188E34;
    id v45 = 0;
    v20 = [(KTSMDataStoreActual *)self container];
    id v21 = [v20 newBackgroundContext];

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1001895AC;
    v29[3] = &unk_1002B9800;
    id v30 = v9;
    id v22 = v21;
    id v31 = v22;
    p_long long buf = &buf;
    id v32 = v19;
    uint64_t v34 = &v35;
    [v22 performBlockAndWait:v29];
    int v23 = *((unsigned __int8 *)v36 + 24);
    if (a5 && !*((unsigned char *)v36 + 24))
    {
      if (qword_10032EE68 != -1) {
        dispatch_once(&qword_10032EE68, &stru_1002C42D8);
      }
      v24 = qword_10032EE70;
      if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
      {
        uint64_t v25 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)v39 = 138412290;
        uint64_t v40 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "storeSelfVerificationInfo: error %@", v39, 0xCu);
      }
      *a5 = *(id *)(*((void *)&buf + 1) + 40);
      int v23 = *((unsigned __int8 *)v36 + 24);
    }
    BOOL v26 = v23 != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v35, 8);
  }
  else
  {
    if (qword_10032EE68 != -1) {
      dispatch_once(&qword_10032EE68, &stru_1002C4258);
    }
    v27 = qword_10032EE70;
    if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "storeSelfVerificationInfo: archivedDataWithRootObject", (uint8_t *)&buf, 2u);
    }
    BOOL v26 = 0;
  }

  return v26;
}

- (void)deleteSelfVerificationInfoForApplication:(id)a3 error:(id *)a4
{
  id v6 = a3;
  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100189AB0;
  v9[3] = &unk_1002B9D28;
  id v10 = v6;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = a4;
  id v7 = v11;
  id v8 = v6;
  [v7 performBlockAndWait:v9];
}

- (void)fetchIDMSDeviceList:(id)a3
{
  id v4 = (void (**)(id, void *, void, uint64_t))a3;
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C42F8);
  }
  v5 = qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "fetchIDMSDeviceList", buf, 2u);
  }
  id v6 = +[CachedData fetchRequest];
  id v7 = +[NSPredicate predicateWithFormat:@"key = %@ AND application = %@ AND unique = %@", @"IDMSDeviceList", @"global", &stru_1002CE4C0];
  [v6 setPredicate:v7];

  *(void *)long long buf = 0;
  char v38 = buf;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = sub_100188E24;
  v41 = sub_100188E34;
  id v42 = 0;
  uint64_t v31 = 0;
  id v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = sub_100188E24;
  uint64_t v35 = sub_100188E34;
  id v36 = 0;
  uint64_t v25 = 0;
  BOOL v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = sub_100188E24;
  v29 = sub_100188E34;
  id v30 = 0;
  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10018A0DC;
  v19[3] = &unk_1002C41B8;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v20 = v8;
  id v9 = v6;
  id v21 = v9;
  id v22 = &v25;
  int v23 = buf;
  v24 = &v31;
  [v8 performBlockAndWait:v19];
  if (*((void *)v38 + 5))
  {
    v45[0] = objc_opt_class();
    v45[1] = objc_opt_class();
    id v10 = +[NSArray arrayWithObjects:v45 count:2];
    id v11 = +[NSSet setWithArray:v10];
    uint64_t v12 = *((void *)v38 + 5);
    uint64_t v13 = (id *)(v26 + 5);
    id obj = (id)v26[5];
    uint64_t v14 = +[NSKeyedUnarchiver unarchivedObjectOfClasses:v11 fromData:v12 error:&obj];
    objc_storeStrong(v13, obj);

    if (v26[5])
    {
      if (qword_10032EE68 != -1) {
        dispatch_once(&qword_10032EE68, &stru_1002C4338);
      }
      v15 = qword_10032EE70;
      if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
      {
        uint64_t v16 = v26[5];
        *(_DWORD *)id v43 = 138412290;
        uint64_t v44 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "fetchIDMSDeviceList: unarchivedObjectOfClasses %@", v43, 0xCu);
      }
      uint64_t v17 = v26[5];
    }
    else
    {
      uint64_t v17 = 0;
    }
    v4[2](v4, v14, v32[5], v17);
  }
  else
  {
    v4[2](v4, 0, 0, v26[5]);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(buf, 8);
}

- (BOOL)storeIDMSDeviceList:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C4358);
  }
  id v7 = qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "storeIDMSDeviceList: %@", (uint8_t *)&buf, 0xCu);
  }
  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:a4];
  if (v8)
  {
    uint64_t v21 = 0;
    id v22 = &v21;
    uint64_t v23 = 0x2020000000;
    char v24 = 0;
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v28 = 0x3032000000;
    v29 = sub_100188E24;
    id v30 = sub_100188E34;
    id v31 = 0;
    [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10018A750;
    v16[3] = &unk_1002C4400;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = v9;
    p_long long buf = &buf;
    id v18 = v8;
    id v20 = &v21;
    [v9 performBlockAndWait:v16];
    int v10 = *((unsigned __int8 *)v22 + 24);
    if (a4 && !*((unsigned char *)v22 + 24))
    {
      if (qword_10032EE68 != -1) {
        dispatch_once(&qword_10032EE68, &stru_1002C4420);
      }
      id v11 = qword_10032EE70;
      if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
      {
        uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)uint64_t v25 = 138412290;
        uint64_t v26 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "storeIDMSDeviceList: error %@", v25, 0xCu);
      }
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
      int v10 = *((unsigned __int8 *)v22 + 24);
    }
    BOOL v13 = v10 != 0;

    _Block_object_dispose(&buf, 8);
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    if (qword_10032EE68 != -1) {
      dispatch_once(&qword_10032EE68, &stru_1002C4378);
    }
    uint64_t v14 = qword_10032EE70;
    if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "storeIDMSDeviceList: archivedDataWithRootObject", (uint8_t *)&buf, 2u);
    }
    BOOL v13 = 0;
  }

  return v13;
}

- (void)fetchKTInfoForApplication:(id)a3 uri:(id)a4 complete:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C4440);
  }
  id v11 = qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "fetchKTInfoForApplication:uri:", buf, 2u);
  }
  uint64_t v12 = +[CachedData fetchRequest];
  BOOL v13 = +[NSPredicate predicateWithFormat:@"key = %@ AND application = %@ AND unique = %@", @"QueryResponse", v8, v9];
  [v12 setPredicate:v13];

  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10018AD90;
  v17[3] = &unk_1002BA0F8;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  id v19 = v12;
  id v20 = v10;
  id v14 = v10;
  id v15 = v12;
  id v16 = v18;
  [v16 performBlockAndWait:v17];
}

- (BOOL)storeQueryRequest:(id)a3 queryResponse:(id)a4 serverHint:(id)a5 uri:(id)a6 application:(id)a7 error:(id *)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C44A0);
  }
  id v18 = qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "storeQueryResponse %@", (uint8_t *)&buf, 0xCu);
  }
  id v19 = objc_alloc_init(KTQueryInfo);
  [(KTQueryInfo *)v19 setQueryRequest:v13];
  [(KTQueryInfo *)v19 setQueryResponse:v14];
  [(KTQueryInfo *)v19 setServerHint:v15];
  id v20 = [(TransparencyGPBMessage *)v19 data];
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  v48 = sub_100188E24;
  v49 = sub_100188E34;
  id v50 = 0;
  uint64_t v21 = [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10018B4DC;
  v33[3] = &unk_1002C4528;
  id v22 = v17;
  id v34 = v22;
  id v31 = v16;
  id v35 = v31;
  id v23 = v21;
  id v36 = v23;
  p_long long buf = &buf;
  id v24 = v20;
  id v37 = v24;
  uint64_t v39 = &v40;
  [v23 performBlockAndWait:v33];
  int v25 = *((unsigned __int8 *)v41 + 24);
  if (a8)
  {
    uint64_t v26 = v14;
    if (!*((unsigned char *)v41 + 24))
    {
      if (qword_10032EE68 != -1) {
        dispatch_once(&qword_10032EE68, &stru_1002C4548);
      }
      uint64_t v27 = qword_10032EE70;
      if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
      {
        uint64_t v28 = *(void *)(*((void *)&buf + 1) + 40);
        *(_DWORD *)uint64_t v44 = 138412290;
        uint64_t v45 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "storeQueryResponse: error %@", v44, 0xCu);
      }
      *a8 = *(id *)(*((void *)&buf + 1) + 40);
      int v25 = *((unsigned __int8 *)v41 + 24);
    }
  }
  else
  {
    uint64_t v26 = v14;
  }
  BOOL v29 = v25 != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v40, 8);

  return v29;
}

- (id)jsonifyError:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    v19[0] = @"code";
    id v6 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v4 code]);
    v19[1] = @"domain";
    v20[0] = v6;
    id v7 = [v5 domain];
    v20[1] = v7;
    id v8 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];
    id v9 = [v8 mutableCopy];

    id v10 = [v5 userInfo];
    id v11 = [v10 count];

    if (v11)
    {
      uint64_t v12 = +[NSMutableDictionary dictionary];
      id v13 = [v5 userInfo];
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10018BAE4;
      v16[3] = &unk_1002C4570;
      id v17 = v12;
      id v18 = self;
      id v14 = v12;
      [v13 enumerateKeysAndObjectsUsingBlock:v16];

      [v9 setObject:v14 forKeyedSubscript:@"userinfo"];
    }
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)errorFromData:(id)a3
{
  if (a3)
  {
    id v4 = +[NSJSONSerialization JSONObjectWithData:a3 options:0 error:0];
    objc_opt_class();
    v5 = 0;
    if (objc_opt_isKindOfClass())
    {
      v5 = [(KTSMDataStoreActual *)self errorFromJson:v4];
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)errorFromJson:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"code"];
  id v6 = [v4 objectForKeyedSubscript:@"domain"];
  id v7 = [v4 objectForKeyedSubscript:@"userinfo"];

  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v7 count])
    {
      +[NSMutableDictionary dictionary];
      id v11 = _NSConcreteStackBlock;
      uint64_t v12 = 3221225472;
      id v13 = sub_10018BE1C;
      id v14 = &unk_1002C4598;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      id v15 = v8;
      id v16 = self;
      [v7 enumerateKeysAndObjectsUsingBlock:&v11];
    }
    else
    {
      id v8 = 0;
    }
    id v9 = [NSError errorWithDomain:v6 code:[v5 longValue] userInfo:v8];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)pushTokenForService:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100188E24;
  id v20 = sub_100188E34;
  id v21 = 0;
  id v22 = v4;
  v5 = +[NSArray arrayWithObjects:&v22 count:1];
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_10018C08C;
  id v13 = &unk_1002C45C0;
  id v15 = &v16;
  id v6 = v4;
  id v14 = v6;
  [(KTSMDataStoreActual *)self fetchDeviceSignature:v5 complete:&v10];

  id v7 = [[(id)v17[5] objectForKeyedSubscript:v6, v10, v11, v12, v13];
  id v8 = [v7 pushToken];

  _Block_object_dispose(&v16, 8);

  return v8;
}

- (void)fetchDeviceSignature:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, uint64_t))a4;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = sub_100188E24;
  int v25 = sub_100188E34;
  id v26 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_100188E24;
  id v19 = sub_100188E34;
  id v20 = 0;
  id v8 = [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10018C29C;
  v10[3] = &unk_1002BB908;
  id v9 = v6;
  id v13 = &v15;
  id v14 = &v21;
  id v11 = v9;
  uint64_t v12 = self;
  [v8 performBlockAndWait:v10];
  v7[2](v7, v22[5], v16[5]);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(&v21, 8);
}

- (void)storeDeviceSignature:(id)a3 complete:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v8 = v6;
  id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      id v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [*(id *)(*((void *)&v28 + 1) + 8 * (void)v11) tbsKTIDSRegistrationData];
        BOOL v13 = v12 == 0;

        if (v13)
        {
          uint64_t v16 = +[TransparencyError errorWithDomain:kTransparencyErrorDecode code:-324 underlyingError:0 description:@"missing tbs data"];
          v7[2](v7, v16);

          id v15 = v8;
          goto LABEL_11;
        }
        id v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      id v9 = [v8 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  id v14 = [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x3032000000;
  int v25 = sub_100188E24;
  id v26 = sub_100188E34;
  id v27 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10018C8E4;
  v17[3] = &unk_1002C45E8;
  id v18 = v8;
  id v15 = v14;
  id v19 = v15;
  id v20 = self;
  uint64_t v21 = &v22;
  [v15 performBlockAndWait:v17];
  v7[2](v7, (void *)v23[5]);

  _Block_object_dispose(&v22, 8);
LABEL_11:
}

- (void)uploadedDeviceSignature:(id)a3 tbs:(id)a4 uploadedAt:(id)a5 complete:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = (void (**)(id, void))a6;
  id v14 = [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  uint64_t v25 = 0;
  id v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = sub_100188E24;
  long long v29 = sub_100188E34;
  id v30 = 0;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  void v19[2] = sub_10018CE78;
  v19[3] = &unk_1002C4630;
  id v15 = v10;
  id v20 = v15;
  id v16 = v11;
  id v21 = v16;
  uint64_t v24 = &v25;
  id v17 = v12;
  id v22 = v17;
  id v18 = v14;
  id v23 = v18;
  [v18 performBlockAndWait:v19];
  v13[2](v13, v26[5]);

  _Block_object_dispose(&v25, 8);
}

- (void)delete:(id)a3 onMOC:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)NSBatchDeleteRequest) initWithFetchRequest:v6];

  [v7 setResultType:1];
  id v11 = 0;
  id v8 = [v5 executeRequest:v7 error:&v11];

  id v9 = v11;
  if (!v8)
  {
    if (qword_10032EE68 != -1) {
      dispatch_once(&qword_10032EE68, &stru_1002C4650);
    }
    id v10 = qword_10032EE70;
    if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "bulk delete failed: %@", buf, 0xCu);
    }
  }
}

- (void)_onQueueClearDeviceSignatureSignatures
{
  v2 = +[DeviceSignature fetchRequest];
  id v16 = 0;
  id v3 = [v2 execute:&v16];
  id v4 = v16;
  if (v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v3;
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          [v10 setSignedAt:0, v12];
          [v10 setUploadedAt:0];
          [v10 setSignature:0];
          [v10 setPublicKey:0];
          [v10 setState:@"tbs"];
          [v10 setCurrentItemPointerModificationTime:0];
          [v10 setAltDSID:0];
          [v10 setError:0];
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
      }
      while (v7);
    }
  }
  else
  {
    if (qword_10032EE68 != -1) {
      dispatch_once(&qword_10032EE68, &stru_1002C4670);
    }
    id v11 = qword_10032EE70;
    if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "deleting DeviceSignatures failes: %@", buf, 0xCu);
    }
  }
}

- (BOOL)clearDeviceSignatures:(id *)a3
{
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_100188E24;
  id v20 = sub_100188E34;
  id v21 = 0;
  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10018D754;
  v12[3] = &unk_1002C4400;
  v12[4] = self;
  long long v14 = &v22;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v13 = v5;
  long long v15 = &v16;
  [v5 performBlockAndWait:v12];
  if (a3)
  {
    id v6 = (void *)v17[5];
    if (v6) {
      *a3 = v6;
    }
  }
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C4690);
  }
  id v7 = qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = *((unsigned __int8 *)v23 + 24);
    uint64_t v9 = v17[5];
    *(_DWORD *)long long buf = 67109378;
    int v27 = v8;
    __int16 v28 = 2112;
    uint64_t v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "done clearing signatures %d: %@", buf, 0x12u);
  }
  BOOL v10 = *((unsigned char *)v23 + 24) != 0;

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v10;
}

- (BOOL)clearDataStore:(id *)a3
{
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C46B0);
  }
  id v5 = qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "deleting KTSMDataStore", buf, 2u);
  }
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  *(void *)long long buf = 0;
  uint64_t v18 = buf;
  uint64_t v19 = 0x3032000000;
  id v20 = sub_100188E24;
  id v21 = sub_100188E34;
  id v22 = 0;
  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10018DAF0;
  v13[3] = &unk_1002C46D8;
  v13[4] = self;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v6;
  long long v15 = &v23;
  uint64_t v16 = buf;
  [v6 performBlockAndWait:v13];
  if (a3)
  {
    id v7 = (void *)*((void *)v18 + 5);
    if (v7) {
      *a3 = v7;
    }
  }
  if (qword_10032EE68 != -1) {
    dispatch_once(&qword_10032EE68, &stru_1002C46F8);
  }
  int v8 = qword_10032EE70;
  if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = *((unsigned __int8 *)v24 + 24);
    uint64_t v10 = *((void *)v18 + 5);
    *(_DWORD *)int v27 = 67109378;
    int v28 = v9;
    __int16 v29 = 2112;
    uint64_t v30 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "done deleting KTSMDataStore %d: %@", v27, 0x12u);
  }
  BOOL v11 = *((unsigned char *)v24 + 24) != 0;

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v23, 8);
  return v11;
}

- (void)storeFixup:(id)a3
{
  id v4 = a3;
  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10018DC88;
  v7[3] = &unk_1002B7D58;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v9 = v4;
  id v5 = v4;
  id v6 = v8;
  [v6 performBlockAndWait:v7];
}

- (void)deleteFixup:(id)a3
{
  id v4 = a3;
  id v7 = [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  id v5 = +[CachedData fetchRequest];
  id v6 = +[NSPredicate predicateWithFormat:@"key = %@ AND application = %@", @"FixUps", v4];

  [v5 setPredicate:v6];
  [(KTSMDataStoreActual *)self delete:v5 onMOC:v7];
}

- (BOOL)haveDoneFixup:(id)a3
{
  id v4 = a3;
  id v5 = [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  id v6 = +[CachedData fetchRequest];
  id v7 = +[NSPredicate predicateWithFormat:@"key = %@ AND application = %@", @"FixUps", v4];
  [v6 setPredicate:v7];

  uint64_t v15 = 0;
  uint64_t v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018E074;
  v11[3] = &unk_1002B9768;
  id v14 = &v15;
  id v8 = v5;
  id v12 = v8;
  id v9 = v6;
  id v13 = v9;
  [v8 performBlockAndWait:v11];
  LOBYTE(v7) = v16[3] != 0;

  _Block_object_dispose(&v15, 8);
  return (char)v7;
}

- (void)setSettingsDate:(id)a3 date:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v18];
  id v9 = v18;
  if (v8)
  {
    uint64_t v10 = [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10018E3EC;
    v13[3] = &unk_1002B9718;
    id v14 = v6;
    id v15 = v7;
    id v16 = v10;
    id v17 = v8;
    id v11 = v10;
    [v11 performBlockAndWait:v13];
  }
  else
  {
    if (qword_10032EE68 != -1) {
      dispatch_once(&qword_10032EE68, &stru_1002C4758);
    }
    id v12 = qword_10032EE70;
    if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "setSettingsDate: archivedDataWithRootObject: %@", buf, 0xCu);
    }
  }
}

- (id)getSettingsDate:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100188E24;
  uint64_t v19 = sub_100188E34;
  id v20 = 0;
  id v5 = +[CachedData fetchRequest];
  id v6 = +[NSPredicate predicateWithFormat:@"key = %@ AND application = %@", @"SettingsDate", v4];
  [v5 setPredicate:v6];

  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018E8B4;
  v11[3] = &unk_1002C47C0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  id v14 = &v15;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)setSettingsData:(id)a3 data:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018EB40;
  v11[3] = &unk_1002B9DD0;
  id v12 = v6;
  id v13 = v7;
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = v14;
  id v9 = v7;
  id v10 = v6;
  [v8 performBlockAndWait:v11];
}

- (id)getSettingsData:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100188E24;
  uint64_t v19 = sub_100188E34;
  id v20 = 0;
  id v5 = +[CachedData fetchRequest];
  id v6 = +[NSPredicate predicateWithFormat:@"key = %@ AND application = %@", @"SettingsData", v4];
  [v5 setPredicate:v6];

  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018F008;
  v11[3] = &unk_1002C47C0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  id v14 = &v15;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (void)setSettingsNumber:(id)a3 number:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v18 = 0;
  id v8 = +[NSKeyedArchiver archivedDataWithRootObject:v7 requiringSecureCoding:1 error:&v18];
  id v9 = v18;
  if (v8)
  {
    id v10 = [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_10018F388;
    v13[3] = &unk_1002B9718;
    id v14 = v6;
    id v15 = v7;
    id v16 = v10;
    id v17 = v8;
    id v11 = v10;
    [v11 performBlockAndWait:v13];
  }
  else
  {
    if (qword_10032EE68 != -1) {
      dispatch_once(&qword_10032EE68, &stru_1002C4820);
    }
    id v12 = qword_10032EE70;
    if (os_log_type_enabled((os_log_t)qword_10032EE70, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "setSettingsNumber: archivedDataWithRootObject: %@", buf, 0xCu);
    }
  }
}

- (id)getSettingsNumber:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = sub_100188E24;
  uint64_t v19 = sub_100188E34;
  id v20 = 0;
  id v5 = +[CachedData fetchRequest];
  id v6 = +[NSPredicate predicateWithFormat:@"key = %@ AND application = %@", @"SettingsNumber", v4];
  [v5 setPredicate:v6];

  [(KTSMDataStoreActual *)self managedObjectContextWithMergePolicy];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10018F850;
  v11[3] = &unk_1002C47C0;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v12 = v7;
  id v8 = v5;
  id v13 = v8;
  id v14 = &v15;
  [v7 performBlockAndWait:v11];
  id v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);

  return v9;
}

- (NSPersistentContainer)container
{
  return (NSPersistentContainer *)objc_getProperty(self, a2, 8, 1);
}

- (void)setContainer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end