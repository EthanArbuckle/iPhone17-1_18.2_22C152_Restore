@interface MBBackgroundRestoreSizeEstimator
- (BOOL)isRestoringFromFileLists;
- (MBBackgroundRestoreSizeEstimator)initWithAccount:(id)a3 serviceManager:(id)a4 snapshotUUID:(id)a5;
- (MBCKManager)serviceManager;
- (MBServiceAccount)account;
- (NSDate)dateOfLastSizeEstimate;
- (NSNumber)estimatedBackgroundRestoreSize;
- (NSString)snapshotUUID;
- (unint64_t)_estimateCurrentBackgroundRestoreSizeWithError:(id *)a3;
- (unint64_t)estimatedBackgroundRestoreSizeWithError:(id *)a3;
- (void)setAccount:(id)a3;
- (void)setDateOfLastSizeEstimate:(id)a3;
- (void)setEstimatedBackgroundRestoreSize:(id)a3;
- (void)setIsRestoringFromFileLists:(BOOL)a3;
@end

@implementation MBBackgroundRestoreSizeEstimator

- (MBBackgroundRestoreSizeEstimator)initWithAccount:(id)a3 serviceManager:(id)a4 snapshotUUID:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MBBackgroundRestoreSizeEstimator;
  v12 = [(MBBackgroundRestoreSizeEstimator *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_serviceManager, v10);
    objc_storeStrong((id *)&v13->_account, a3);
    objc_storeStrong((id *)&v13->_snapshotUUID, a5);
    v14 = [v9 persona];
    id v19 = 0;
    unsigned __int8 v15 = +[MBRestoreCloudFormatPolicy isRestoringFromFileLists:&v13->_isRestoringFromFileLists persona:v14 error:&v19];
    id v16 = v19;

    if ((v15 & 1) == 0)
    {
      v17 = MBGetDefaultLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "=bg-estimate= Failed to determine whether restoring from file lists: %@", buf, 0xCu);
        _MBLog();
      }

      v13->_isRestoringFromFileLists = 0;
    }
  }
  return v13;
}

- (unint64_t)estimatedBackgroundRestoreSizeWithError:(id *)a3
{
  v5 = +[NSDate now];
  v6 = [(MBBackgroundRestoreSizeEstimator *)self dateOfLastSizeEstimate];
  v7 = [(MBBackgroundRestoreSizeEstimator *)self estimatedBackgroundRestoreSize];
  if (v7 && v6 && ([v5 timeIntervalSinceDate:v6], v8 < 30.0))
  {
    id v9 = [v7 unsignedLongLongValue];
  }
  else
  {
    id v14 = 0;
    id v9 = [(MBBackgroundRestoreSizeEstimator *)self _estimateCurrentBackgroundRestoreSizeWithError:&v14];
    id v10 = v14;
    id v11 = v10;
    if (v10)
    {
      if (a3) {
        *a3 = v10;
      }
    }
    else
    {
      [(MBBackgroundRestoreSizeEstimator *)self setDateOfLastSizeEstimate:v5];
      v12 = +[NSNumber numberWithUnsignedLongLong:v9];
      [(MBBackgroundRestoreSizeEstimator *)self setEstimatedBackgroundRestoreSize:v12];
    }
  }

  return (unint64_t)v9;
}

- (unint64_t)_estimateCurrentBackgroundRestoreSizeWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBBackgroundRestoreSizeEstimator _estimateCurrentBackgroundRestoreSizeWithError:]", "MBBackgroundRestoreSizeEstimator.m", 72, "error");
  }
  v5 = dispatch_group_create();
  id v6 = [objc_alloc((Class)NSMutableArray) initWithCapacity:3];
  v7 = [(MBBackgroundRestoreSizeEstimator *)self serviceManager];
  if (!v7) {
    __assert_rtn("-[MBBackgroundRestoreSizeEstimator _estimateCurrentBackgroundRestoreSizeWithError:]", "MBBackgroundRestoreSizeEstimator.m", 78, "serviceManager");
  }
  double v8 = [(MBBackgroundRestoreSizeEstimator *)self account];
  if (!v8) {
    __assert_rtn("-[MBBackgroundRestoreSizeEstimator _estimateCurrentBackgroundRestoreSizeWithError:]", "MBBackgroundRestoreSizeEstimator.m", 80, "account");
  }
  uint64_t v70 = 0;
  v71 = (unsigned __int8 *)&v70;
  uint64_t v72 = 0x2020000000;
  char v73 = 0;
  uint64_t v66 = 0;
  v67 = &v66;
  uint64_t v68 = 0x2020000000;
  uint64_t v69 = 0;
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  uint64_t v61 = 0;
  id v9 = dispatch_get_global_queue(17, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10022E8A0;
  block[3] = &unk_100416BF8;
  block[4] = self;
  id v10 = v7;
  id v52 = v10;
  id v11 = v8;
  id v53 = v11;
  id v12 = v6;
  id v54 = v12;
  v55 = &v66;
  v56 = &v62;
  v57 = &v58;
  dispatch_group_async(v5, v9, block);

  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  uint64_t v50 = 0;
  if ([v11 isPrimaryAccount])
  {
    dispatch_group_enter(v5);
    id v13 = objc_alloc_init((Class)ASDRestoreTotalDownloadSizeEstimateRequest);
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10022ED64;
    v43[3] = &unk_100416C20;
    id v44 = v12;
    v46 = &v47;
    v45 = v5;
    [v13 startWithCompletionHandler:v43];
  }
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x2020000000;
  uint64_t v42 = 0;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  char v38 = 0;
  if ([v11 isPrimaryAccount])
  {
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10022EE98;
    v30[3] = &unk_100416C48;
    v32 = &v35;
    id v31 = v10;
    v33 = &v70;
    v34 = &v39;
    dispatch_group_async(v5, v9, v30);
  }
  dispatch_group_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
  unsigned __int8 v14 = atomic_load(v71 + 24);
  if (v14)
  {
    id v15 = +[MBError errorWithCode:17, @"Cannot fetch background size estimate for account:%@", v11 format];
    goto LABEL_12;
  }
  if ([v12 count])
  {
    id v15 = +[MBError errorWithErrors:v12];
LABEL_12:
    unint64_t v16 = 0;
    *a3 = v15;
    goto LABEL_13;
  }
  unint64_t v18 = v48[3] + v67[3] + v40[3];
  if (v18 % 0x5F5E100) {
    unint64_t v16 = v18 + 100000000 - v18 % 0x5F5E100;
  }
  else {
    unint64_t v16 = v48[3] + v67[3] + v40[3];
  }
  if (self->_isRestoringFromFileLists)
  {
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = v67[3];
      uint64_t v21 = v63[3];
      uint64_t v22 = v59[3];
      uint64_t v23 = v48[3];
      uint64_t v24 = v40[3];
      int v25 = *((unsigned __int8 *)v36 + 24);
      *(_DWORD *)buf = 138414082;
      id v75 = v11;
      __int16 v76 = 2048;
      uint64_t v77 = v20;
      __int16 v78 = 2048;
      uint64_t v79 = v21;
      __int16 v80 = 2048;
      uint64_t v81 = v22;
      __int16 v82 = 2048;
      *(void *)v83 = v23;
      *(_WORD *)&v83[8] = 2048;
      *(void *)&v83[10] = v24;
      __int16 v84 = 1024;
      int v85 = v25;
      __int16 v86 = 2048;
      unint64_t v87 = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=bg-estimate= Fetched background restore sizes for account %@ plan:%llu(%llu/%llu) appStore:%llu atc:%llu(%d) total:%llu", buf, 0x4Eu);
      _MBLog();
    }
  }
  else
  {
    id v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v26 = v67[3];
      uint64_t v27 = v48[3];
      uint64_t v28 = v40[3];
      int v29 = *((unsigned __int8 *)v36 + 24);
      *(_DWORD *)buf = 138413570;
      id v75 = v11;
      __int16 v76 = 2048;
      uint64_t v77 = v26;
      __int16 v78 = 2048;
      uint64_t v79 = v27;
      __int16 v80 = 2048;
      uint64_t v81 = v28;
      __int16 v82 = 1024;
      *(_DWORD *)v83 = v29;
      *(_WORD *)&v83[4] = 2048;
      *(void *)&v83[6] = v16;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "=bg-estimate= Fetched background restore sizes for account %@ cache:%llu appStore:%llu atc:%llu(%d) total:%llu", buf, 0x3Au);
      _MBLog();
    }
  }

LABEL_13:
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v47, 8);

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);
  _Block_object_dispose(&v70, 8);

  return v16;
}

- (MBServiceAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (MBCKManager)serviceManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_serviceManager);
  return (MBCKManager *)WeakRetained;
}

- (NSDate)dateOfLastSizeEstimate
{
  return (NSDate *)objc_getProperty(self, a2, 32, 1);
}

- (void)setDateOfLastSizeEstimate:(id)a3
{
}

- (NSNumber)estimatedBackgroundRestoreSize
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

- (void)setEstimatedBackgroundRestoreSize:(id)a3
{
}

- (BOOL)isRestoringFromFileLists
{
  return self->_isRestoringFromFileLists;
}

- (void)setIsRestoringFromFileLists:(BOOL)a3
{
  self->_isRestoringFromFileLists = a3;
}

- (NSString)snapshotUUID
{
  return self->_snapshotUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_snapshotUUID, 0);
  objc_storeStrong((id *)&self->_estimatedBackgroundRestoreSize, 0);
  objc_storeStrong((id *)&self->_dateOfLastSizeEstimate, 0);
  objc_destroyWeak((id *)&self->_serviceManager);
  objc_storeStrong((id *)&self->_account, 0);
}

@end