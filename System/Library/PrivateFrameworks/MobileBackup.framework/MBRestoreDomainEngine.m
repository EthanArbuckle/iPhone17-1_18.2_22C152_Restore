@interface MBRestoreDomainEngine
- (BOOL)_downloadAssets:(id *)a3;
- (BOOL)_downloadAssets:(id *)a3 withFetcher:(id)a4;
- (BOOL)_finalize:(id *)a3;
- (BOOL)_fixUpDirectoryAttributes:(id *)a3;
- (BOOL)_placeAssets:(id *)a3;
- (BOOL)_placeDirectories:(id *)a3;
- (BOOL)_placeSymlinks:(id *)a3;
- (BOOL)_placeZeroByteFiles:(id *)a3;
- (BOOL)_shouldRestore:(BOOL *)a3 restorable:(id)a4 error:(id *)a5;
- (BOOL)_verify:(id *)a3;
- (BOOL)resumeWithError:(id *)a3;
- (BOOL)runWithError:(id *)a3;
- (BOOL)setUpWithError:(id *)a3;
- (BOOL)shouldCancelVerification;
- (MBAssetFetchSummary)assetFetchSummary;
- (MBProgressModel)progressModel;
- (MBRestoreDomainEngine)initWithRootPath:(id)a3 policy:(id)a4 depot:(id)a5 fetcher:(id)a6 plan:(id)a7 progress:(id)a8 verifier:(id)a9 logger:(id)a10 error:(id *)a11;
- (NSString)restoreRootPath;
- (_TtC7backupd28MBRestorablePlacementSummary)restorablePlacementSummary;
- (id)domain;
- (id)domainName;
- (id)persona;
- (id)restoringBundleID;
- (int)engineMode;
- (int)restoreType;
- (unint64_t)_restoreRestorable:(id)a3 error:(id *)a4 actionBlock:(id)a5;
- (unint64_t)restoreState;
- (void)_handleStateTransition;
- (void)cleanUpAfterError:(id)a3;
- (void)fetcher:(id)a3 didReceiveAsset:(id)a4 decrypter:(id)a5 path:(id)a6;
- (void)fetcher:(id)a3 failedFetchingAsset:(id)a4 withFetchError:(id)a5;
- (void)makeStateTransition;
- (void)setProgressModel:(id)a3;
- (void)setRestoreState:(unint64_t)a3;
@end

@implementation MBRestoreDomainEngine

- (MBRestoreDomainEngine)initWithRootPath:(id)a3 policy:(id)a4 depot:(id)a5 fetcher:(id)a6 plan:(id)a7 progress:(id)a8 verifier:(id)a9 logger:(id)a10 error:(id *)a11
{
  id v17 = a3;
  id v39 = a4;
  id v18 = a4;
  id v40 = a5;
  id v19 = a5;
  id v41 = a6;
  id v20 = a6;
  id v21 = a7;
  id v42 = a8;
  id v47 = a8;
  id v22 = a9;
  id v46 = a10;
  if (!v17) {
    __assert_rtn("-[MBRestoreDomainEngine initWithRootPath:policy:depot:fetcher:plan:progress:verifier:logger:error:]", "MBRestoreDomainEngine.m", 86, "rootPath");
  }
  if (!v18) {
    __assert_rtn("-[MBRestoreDomainEngine initWithRootPath:policy:depot:fetcher:plan:progress:verifier:logger:error:]", "MBRestoreDomainEngine.m", 87, "policy");
  }
  if (!v19) {
    __assert_rtn("-[MBRestoreDomainEngine initWithRootPath:policy:depot:fetcher:plan:progress:verifier:logger:error:]", "MBRestoreDomainEngine.m", 88, "depot");
  }
  if (!v20) {
    __assert_rtn("-[MBRestoreDomainEngine initWithRootPath:policy:depot:fetcher:plan:progress:verifier:logger:error:]", "MBRestoreDomainEngine.m", 89, "fetcher");
  }
  if (!v21) {
    __assert_rtn("-[MBRestoreDomainEngine initWithRootPath:policy:depot:fetcher:plan:progress:verifier:logger:error:]", "MBRestoreDomainEngine.m", 90, "plan");
  }
  v23 = v21;
  v43 = v22;
  v24 = v20;
  v25 = [_TtC7backupd18MBRestorePerformer alloc];
  v26 = [v21 domain];
  uint64_t v27 = [v26 name];
  id v28 = v18;
  v29 = (void *)v27;
  id v49 = 0;
  v44 = v28;
  v45 = v17;
  v30 = -[MBRestorePerformer initWithIdentifier:destinationPath:policy:depot:progressModel:logger:error:](v25, "initWithIdentifier:destinationPath:policy:depot:progressModel:logger:error:", v27, v17, &v49);
  id v31 = v49;

  if (v30)
  {
    v48.receiver = self;
    v48.super_class = (Class)MBRestoreDomainEngine;
    v32 = [(MBStatefulEngine *)&v48 initWithSettingsContext:0 debugContext:0 domainManager:0];
    v33 = v32;
    if (v32)
    {
      objc_storeStrong((id *)&v32->_restoreRootPath, a3);
      objc_storeStrong((id *)&v33->_policy, v39);
      objc_storeStrong((id *)&v33->_plan, a7);
      objc_storeStrong((id *)&v33->_depot, v40);
      objc_storeStrong((id *)&v33->_fetcher, v41);
      objc_storeStrong((id *)&v33->_progressModel, v42);
      objc_storeStrong((id *)&v33->_verifier, a9);
      objc_storeStrong((id *)&v33->_logger, a10);
      objc_storeStrong((id *)&v33->_performer, v30);
      v33->_restoreState = 0;
      [(MBAssetFetcher *)v33->_fetcher setDelegate:v33];
    }
    self = v33;
    v34 = self;
    v35 = v44;
  }
  else
  {
    v36 = MBGetDefaultLog();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v31;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "=domain-engine= Failed to create performer: %@", buf, 0xCu);
      _MBLog();
    }

    v35 = v44;
    v34 = 0;
    if (a11) {
      *a11 = v31;
    }
  }

  return v34;
}

- (id)domain
{
  return [(MBRestoreDomainPlan *)self->_plan domain];
}

- (id)domainName
{
  v2 = [(MBRestoreDomainPlan *)self->_plan domain];
  v3 = [v2 name];

  return v3;
}

- (id)persona
{
  return [(MBRestorePolicy *)self->_policy persona];
}

- (int)restoreType
{
  return [(MBRestorePolicy *)self->_policy restoreType];
}

- (int)engineMode
{
  return 2;
}

- (BOOL)resumeWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine resumeWithError:]", "MBRestoreDomainEngine.m", 150, "error");
  }
  plan = self->_plan;
  id v19 = 0;
  id v6 = [(MBRestoreDomainPlan *)plan domainState:&v19];
  id v7 = v19;
  if (v6)
  {
    self->_startTime = CFAbsoluteTimeGetCurrent();
    [(MBRestoreDomainEngine *)self setRestoreState:v6];
    v8 = MBGetDefaultLog();
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
    if (v6 == (id)1)
    {
      if (v9)
      {
        v10 = [(MBRestoreDomainEngine *)self domainName];
        *(_DWORD *)buf = 138543362;
        id v21 = v10;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=domain-engine= %{public}@: Starting restore", buf, 0xCu);

        v11 = [(MBRestoreDomainEngine *)self domainName];
        _MBLog();
LABEL_11:
      }
    }
    else if (v9)
    {
      v14 = [(MBRestoreDomainEngine *)self domainName];
      v15 = sub_1002953F4((unint64_t)v6);
      *(_DWORD *)buf = 138543618;
      id v21 = v14;
      __int16 v22 = 2112;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=domain-engine= %{public}@: Resuming restore at %@", buf, 0x16u);

      v11 = [(MBRestoreDomainEngine *)self domainName];
      id v18 = sub_1002953F4((unint64_t)v6);
      _MBLog();

      goto LABEL_11;
    }
  }
  else
  {
    [(MBRestoreDomainEngine *)self setRestoreState:1];
    v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = [(MBRestoreDomainEngine *)self domainName];
      *(_DWORD *)buf = 138543618;
      id v21 = v13;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Unable to retrieve state to resume engine: %@", buf, 0x16u);

      id v17 = [(MBRestoreDomainEngine *)self domainName];
      _MBLog();
    }
    v8 = [(MBRestoreDomainEngine *)self domainName];
    *a3 = +[MBError errorForNSError:v7, 0, @"Unable to retrieve state to resume engine for %@", v8 path format];
  }

  return v6 != 0;
}

- (BOOL)runWithError:(id *)a3
{
  BOOL v5 = -[MBRestoreDomainEngine resumeWithError:](self, "resumeWithError:");
  if (v5)
  {
    [(MBRestoreDomainEngine *)self makeStateTransition];
    if ([(MBStatefulEngine *)self hasError])
    {
      id v6 = [(MBStatefulEngine *)self engineError];
      id v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = [(MBRestoreDomainEngine *)self domain];
        BOOL v9 = [v8 name];
        v10 = +[MBError loggableDescriptionForError:v6];
        *(_DWORD *)buf = 138543874;
        id v19 = v9;
        __int16 v20 = 2112;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v6;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Restore failed: (%@), %@", buf, 0x20u);

        v11 = [(MBRestoreDomainEngine *)self domain];
        v12 = [v11 name];
        id v17 = +[MBError loggableDescriptionForError:v6];
        _MBLog();
      }
      if (a3) {
        *a3 = v6;
      }

      LOBYTE(v5) = 0;
    }
    else
    {
      v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        v14 = [(MBRestoreDomainEngine *)self domainName];
        *(_DWORD *)buf = 138543362;
        id v19 = v14;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "=domain-engine= %{public}@ restore finished successfully", buf, 0xCu);

        v16 = [(MBRestoreDomainEngine *)self domainName];
        _MBLog();
      }
      [(MBRestoreDomainEngine *)self cleanUpAfterError:0];
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)cleanUpAfterError:(id)a3
{
  id v4 = a3;
  fetcher = self->_fetcher;
  id v27 = 0;
  unsigned __int8 v6 = [(MBAssetFetcher *)fetcher disposeWithError:&v27];
  id v7 = v27;
  if ((v6 & 1) == 0)
  {
    v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      BOOL v9 = [(MBRestoreDomainEngine *)self domainName];
      v10 = self->_fetcher;
      *(_DWORD *)buf = 138543874;
      v29 = v9;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Failed to dispose of fetcher %@: %@", buf, 0x20u);

      v11 = [(MBRestoreDomainEngine *)self domainName];
      id v21 = self->_fetcher;
      id v23 = v7;
      id v19 = v11;
      _MBLog();
    }
  }
  performer = self->_performer;
  id v26 = v7;
  unsigned __int8 v13 = -[MBRestorePerformer disposeAndReturnError:](performer, "disposeAndReturnError:", &v26, v19, v21, v23);
  id v14 = v26;

  if ((v13 & 1) == 0)
  {
    v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = [(MBRestoreDomainEngine *)self domainName];
      id v17 = self->_performer;
      *(_DWORD *)buf = 138543874;
      v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Failed to dispose of performer %@: %@", buf, 0x20u);

      id v18 = [(MBRestoreDomainEngine *)self domainName];
      __int16 v22 = self->_performer;
      id v24 = v14;
      __int16 v20 = v18;
      _MBLog();
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)MBRestoreDomainEngine;
  -[MBStatefulEngine cleanUpAfterError:](&v25, "cleanUpAfterError:", v4, v20, v22, v24);
}

- (void)_handleStateTransition
{
  double Current = CFAbsoluteTimeGetCurrent();
  unint64_t v4 = [(MBRestoreDomainEngine *)self restoreState];
  switch(v4)
  {
    case 1uLL:
      v42[0] = _NSConcreteStackBlock;
      v42[1] = 3221225472;
      v42[2] = sub_100295F68;
      v42[3] = &unk_100411478;
      v42[4] = self;
      BOOL v5 = v42;
      goto LABEL_14;
    case 2uLL:
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_100295F74;
      v41[3] = &unk_100411478;
      v41[4] = self;
      BOOL v5 = v41;
      goto LABEL_14;
    case 3uLL:
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_100295F80;
      v40[3] = &unk_100411478;
      v40[4] = self;
      BOOL v5 = v40;
      goto LABEL_14;
    case 4uLL:
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_100295F8C;
      v39[3] = &unk_100411478;
      v39[4] = self;
      BOOL v5 = v39;
      goto LABEL_14;
    case 5uLL:
      v38[0] = _NSConcreteStackBlock;
      v38[1] = 3221225472;
      v38[2] = sub_100295F98;
      v38[3] = &unk_100411478;
      v38[4] = self;
      BOOL v5 = v38;
      goto LABEL_14;
    case 6uLL:
      v37[0] = _NSConcreteStackBlock;
      v37[1] = 3221225472;
      v37[2] = sub_100295FA4;
      v37[3] = &unk_100411478;
      v37[4] = self;
      BOOL v5 = v37;
      goto LABEL_14;
    case 7uLL:
      v36[0] = _NSConcreteStackBlock;
      v36[1] = 3221225472;
      v36[2] = sub_100295FB0;
      v36[3] = &unk_100411478;
      v36[4] = self;
      BOOL v5 = v36;
      goto LABEL_14;
    case 8uLL:
      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_100295FBC;
      v35[3] = &unk_100411478;
      v35[4] = self;
      BOOL v5 = v35;
      goto LABEL_14;
    case 9uLL:
      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_100295FC8;
      v34[3] = &unk_100411478;
      v34[4] = self;
      BOOL v5 = v34;
LABEL_14:
      [(MBStatefulEngine *)self performRetryablePhase:v5];
      break;
    case 0xAuLL:
      [(MBStatefulEngine *)self setIsFinished:1];
      [(MBStatefulEngine *)self setEngineError:0];
      break;
    default:
      unsigned __int8 v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      {
        id v28 = [(MBRestoreDomainEngine *)self domainName];
        *(_DWORD *)buf = 138412546;
        v44 = v28;
        __int16 v45 = 2048;
        unint64_t v46 = v4;
        _os_log_fault_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%@: Invalid restore engine state (%lu)", buf, 0x16u);
      }
      id v7 = [(MBRestoreDomainEngine *)self domainName];
      id v31 = (void *)v4;
      v15 = sub_1001E6FFC(@"%@: Invalid restore engine state (%lu)", v8, v9, v10, v11, v12, v13, v14, (uint64_t)v7);

      [(MBStatefulEngine *)self setEngineError:v15];
      [(MBStatefulEngine *)self setIsFinished:1];
      break;
  }
  if (![(MBStatefulEngine *)self isFinished]) {
    [(MBRestoreDomainEngine *)self setRestoreState:(char *)[(MBRestoreDomainEngine *)self restoreState] + 1];
  }
  double v16 = CFAbsoluteTimeGetCurrent();
  if (v4 - 11 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    double v17 = v16;
    id v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = v17 - Current;
      __int16 v20 = [(MBRestoreDomainEngine *)self domainName];
      id v21 = sub_1002953F4(v4);
      *(_DWORD *)buf = 138543874;
      v44 = v20;
      __int16 v45 = 2114;
      unint64_t v46 = (unint64_t)v21;
      __int16 v47 = 2048;
      double v48 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "=domain-engine= %{public}@: \"%{public}@\" done in %.3fs", buf, 0x20u);

      __int16 v22 = [(MBRestoreDomainEngine *)self domainName];
      sub_1002953F4(v4);
      double v32 = v19;
      id v31 = v29 = v22;
      _MBLog();
    }
  }
  [(MBRestoreOperationLogger *)self->_logger flush];
  plan = self->_plan;
  id v33 = 0;
  unsigned __int8 v24 = [(MBRestoreDomainPlan *)plan setDomainState:[(MBRestoreDomainEngine *)self restoreState] error:&v33];
  id v25 = v33;
  if ((v24 & 1) == 0)
  {
    id v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      id v27 = [(MBRestoreDomainEngine *)self domainName];
      *(_DWORD *)buf = 138543618;
      v44 = v27;
      __int16 v45 = 2112;
      unint64_t v46 = (unint64_t)v25;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Unable to set resume engine state: %@", buf, 0x16u);

      __int16 v30 = [(MBRestoreDomainEngine *)self domainName];
      _MBLog();
    }
  }
}

- (void)makeStateTransition
{
  [(MBRestoreDomainEngine *)self _handleStateTransition];
  v4.receiver = self;
  v4.super_class = (Class)MBRestoreDomainEngine;
  [(MBStatefulEngine *)&v4 makeStateTransition];
}

- (BOOL)setUpWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine setUpWithError:]", "MBRestoreDomainEngine.m", 318, "error");
  }
  v26.receiver = self;
  v26.super_class = (Class)MBRestoreDomainEngine;
  if (!-[MBStatefulEngine setUpWithError:](&v26, "setUpWithError:")) {
    return 0;
  }
  BOOL v5 = [(MBRestoreDomainEngine *)self domain];

  unsigned __int8 v6 = MBGetDefaultLog();
  id v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(MBRestoreDomainEngine *)self domain];
      restoreRootPath = self->_restoreRootPath;
      *(_DWORD *)buf = 138543618;
      id v28 = v8;
      __int16 v29 = 2114;
      __int16 v30 = (MBRestoreDomainEngine *)restoreRootPath;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "=domain-engine= %{public}@: Creating root path at %{public}@", buf, 0x16u);

      __int16 v22 = [(MBRestoreDomainEngine *)self domain];
      unsigned __int8 v24 = self->_restoreRootPath;
      _MBLog();
    }
    uint64_t v10 = +[NSFileManager defaultManager];
    if (([v10 fileExistsAtPath:self->_restoreRootPath] & 1) != 0
      || (uint64_t v11 = self->_restoreRootPath,
          MBMobileFileAttributes(),
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          LOBYTE(v11) = [v10 createDirectoryAtPath:v11 withIntermediateDirectories:1 attributes:v12 error:a3], v12, (v11 & 1) != 0))
    {
      uint64_t v13 = -[MBRestoreDomainPlan countsOfRestorablesByState:](self->_plan, "countsOfRestorablesByState:", a3, v22, v24);
      if (v13)
      {
        uint64_t v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          v15 = [(MBRestoreDomainEngine *)self domainName];
          MBDescriptionForStateSummaryDictionary(v13);
          double v16 = (MBRestoreDomainEngine *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          id v28 = v15;
          __int16 v29 = 2114;
          __int16 v30 = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "=domain-engine= %{public}@: Starting domain restore: %{public}@", buf, 0x16u);

          double v17 = [(MBRestoreDomainEngine *)self domainName];
          id v25 = MBDescriptionForStateSummaryDictionary(v13);
          _MBLog();
        }
        BOOL v18 = 1;
      }
      else
      {
        BOOL v18 = 0;
      }
    }
    else
    {
      __int16 v20 = self->_restoreRootPath;
      uint64_t v13 = [(MBRestoreDomainEngine *)self domainName];
      +[MBError errorWithCode:100, v20, @"Failed creating root path for domain %@", v13 path format];
      BOOL v18 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      double v19 = [(MBRestoreDomainEngine *)self domainName];
      *(_DWORD *)buf = 138543618;
      id v28 = v19;
      __int16 v29 = 2112;
      __int16 v30 = self;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Unable to get domain for restore %@)", buf, 0x16u);

      id v23 = [(MBRestoreDomainEngine *)self domainName];
      _MBLog();
    }
    uint64_t v10 = [(MBRestoreDomainEngine *)self domainName];
    +[MBError errorWithCode:205, @"Failed to get domain for %@", v10 format];
    BOOL v18 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (BOOL)_downloadAssets:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _downloadAssets:]", "MBRestoreDomainEngine.m", 347, "error");
  }
  [(MBAssetFetcher *)self->_fetcher begin];
  unsigned int v5 = [(MBRestoreDomainEngine *)self _downloadAssets:a3 withFetcher:self->_fetcher];
  unsigned int v6 = [(MBAssetFetcher *)self->_fetcher finishWithError:a3] & v5;
  id v7 = MBGetDefaultLog();
  uint64_t v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(MBRestoreDomainEngine *)self domainName];
      uint64_t v10 = [(MBRestoreDomainEngine *)self assetFetchSummary];
      *(_DWORD *)buf = 138543618;
      BOOL v18 = v9;
      __int16 v19 = 2112;
      __int16 v20 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=domain-engine= %{public}@: Finished downloading assets: %@ assets", buf, 0x16u);

      uint64_t v11 = [(MBRestoreDomainEngine *)self domainName];
      double v16 = [(MBRestoreDomainEngine *)self assetFetchSummary];
      _MBLog();

LABEL_7:
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v12 = [(MBRestoreDomainEngine *)self domainName];
    fetcher = self->_fetcher;
    id v14 = *a3;
    *(_DWORD *)buf = 138543874;
    BOOL v18 = v12;
    __int16 v19 = 2112;
    __int16 v20 = fetcher;
    __int16 v21 = 2112;
    id v22 = v14;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Failed batch fetching assets with %@: %@", buf, 0x20u);

    uint64_t v11 = [(MBRestoreDomainEngine *)self domainName];
    _MBLog();
    goto LABEL_7;
  }

  return v6;
}

- (BOOL)_downloadAssets:(id *)a3 withFetcher:(id)a4
{
  id v6 = a4;
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _downloadAssets:withFetcher:]", "MBRestoreDomainEngine.m", 363, "error");
  }
  if (!v6) {
    __assert_rtn("-[MBRestoreDomainEngine _downloadAssets:withFetcher:]", "MBRestoreDomainEngine.m", 364, "fetcher");
  }
  plan = self->_plan;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100296830;
  v15[3] = &unk_100417BA8;
  v15[4] = self;
  id v8 = v6;
  id v16 = v8;
  unsigned __int8 v9 = [(MBRestoreDomainPlan *)plan enumerateAssetsToDownload:a3 enumerator:v15];
  if ((v9 & 1) == 0)
  {
    uint64_t v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = [(MBRestoreDomainEngine *)self domainName];
      id v12 = *a3;
      *(_DWORD *)buf = 138543618;
      BOOL v18 = v11;
      __int16 v19 = 2112;
      id v20 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Failed enumerating unfinished assets: %@", buf, 0x16u);

      id v14 = [(MBRestoreDomainEngine *)self domainName];
      _MBLog();
    }
  }

  return v9;
}

- (MBAssetFetchSummary)assetFetchSummary
{
  return (MBAssetFetchSummary *)[(MBAssetFetcher *)self->_fetcher fetchSummary];
}

- (_TtC7backupd28MBRestorablePlacementSummary)restorablePlacementSummary
{
  return [(MBRestorePerformer *)self->_performer restorablePlacementSummary];
}

- (void)fetcher:(id)a3 didReceiveAsset:(id)a4 decrypter:(id)a5 path:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10) {
    __assert_rtn("-[MBRestoreDomainEngine fetcher:didReceiveAsset:decrypter:path:]", "MBRestoreDomainEngine.m", 415, "fetcher");
  }
  if (!v11) {
    __assert_rtn("-[MBRestoreDomainEngine fetcher:didReceiveAsset:decrypter:path:]", "MBRestoreDomainEngine.m", 416, "asset");
  }
  id v14 = v13;
  if (!v13) {
    __assert_rtn("-[MBRestoreDomainEngine fetcher:didReceiveAsset:decrypter:path:]", "MBRestoreDomainEngine.m", 417, "path");
  }
  depot = self->_depot;
  id v35 = 0;
  unsigned int v16 = [(MBRestoreDepot *)depot depositWithAsset:v11 decrypter:v12 assetPath:v14 error:&v35];
  id v17 = v35;
  if (v16)
  {
    uint64_t v18 = 2;
  }
  else
  {
    __int16 v19 = MBGetDefaultLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      id v20 = [(MBRestoreDomainEngine *)self domainName];
      *(_DWORD *)buf = 138544386;
      v37 = v20;
      __int16 v38 = 2112;
      id v39 = v11;
      __int16 v40 = 2112;
      id v41 = v14;
      __int16 v42 = 2112;
      v43 = self;
      __int16 v44 = 2112;
      id v45 = v17;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Failed depositing asset %@ at %@ into depot %@: %@", buf, 0x34u);

      [(MBRestoreDomainEngine *)self domainName];
      double v32 = self;
      id v33 = v17;
      id v30 = v11;
      id v28 = v31 = v14;
      _MBLog();
    }
    uint64_t v18 = 4;
  }
  plan = self->_plan;
  id v34 = 0;
  unsigned __int8 v22 = -[MBRestoreDomainPlan setAssetState:asset:withFailure:error:](plan, "setAssetState:asset:withFailure:error:", v18, v11, v17, &v34, v28, v30, v31, v32, v33);
  id v23 = v34;
  if ((v22 & 1) == 0)
  {
    unsigned __int8 v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      id v25 = [(MBRestoreDomainEngine *)self domainName];
      *(_DWORD *)buf = 138543874;
      v37 = v25;
      __int16 v38 = 2112;
      id v39 = v11;
      __int16 v40 = 2112;
      id v41 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Failed marking asset %@ as ready: %@", buf, 0x20u);

      __int16 v29 = [(MBRestoreDomainEngine *)self domainName];
      _MBLog();
    }
  }
  if (v16)
  {
    objc_super v26 = [(MBRestoreDomainEngine *)self progressModel];
    id v27 = [v11 metadata];
    objc_msgSend(v26, "updatingProgress:previousProgress:size:", objc_msgSend(v27, "assetSize"), 1.0, 0.0);
  }
}

- (void)fetcher:(id)a3 failedFetchingAsset:(id)a4 withFetchError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[MBRestoreDomainEngine fetcher:failedFetchingAsset:withFetchError:]", "MBRestoreDomainEngine.m", 437, "fetcher");
  }
  if (!v9) {
    __assert_rtn("-[MBRestoreDomainEngine fetcher:failedFetchingAsset:withFetchError:]", "MBRestoreDomainEngine.m", 438, "asset");
  }
  id v11 = v10;
  if (!v10) {
    __assert_rtn("-[MBRestoreDomainEngine fetcher:failedFetchingAsset:withFetchError:]", "MBRestoreDomainEngine.m", 439, "fetchError");
  }
  id v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v13 = [(MBRestoreDomainEngine *)self domainName];
    *(_DWORD *)buf = 138544130;
    id v23 = v13;
    __int16 v24 = 2112;
    id v25 = v8;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2112;
    __int16 v29 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Fetcher %@ failed to fetch %@: %@", buf, 0x2Au);

    __int16 v19 = [(MBRestoreDomainEngine *)self domainName];
    _MBLog();
  }
  plan = self->_plan;
  id v21 = 0;
  unsigned __int8 v15 = [(MBRestoreDomainPlan *)plan setAssetState:3 asset:v9 withFailure:v11 error:&v21];
  id v16 = v21;
  if ((v15 & 1) == 0)
  {
    id v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [(MBRestoreDomainEngine *)self domainName];
      *(_DWORD *)buf = 138543874;
      id v23 = v18;
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Failed marking asset %@ as failed: %@", buf, 0x20u);

      id v20 = [(MBRestoreDomainEngine *)self domainName];
      _MBLog();
    }
  }
}

- (BOOL)_placeDirectories:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _placeDirectories:]", "MBRestoreDomainEngine.m", 450, "error");
  }
  v3 = a3;
  unsigned int v5 = +[NSDate now];
  plan = self->_plan;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002974C4;
  v10[3] = &unk_100417BD0;
  v10[4] = self;
  LOBYTE(v3) = [(MBRestoreDomainPlan *)plan enumerateAndMarkNotStartedDirectoriesTopDown:v3 enumerator:v10];
  performer = self->_performer;
  id v8 = +[NSDate now];
  [(MBRestorePerformer *)performer recordPlacingDurationWithStart:v5 end:v8];

  return (char)v3;
}

- (BOOL)_placeAssets:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _placeAssets:]", "MBRestoreDomainEngine.m", 471, "error");
  }
  v3 = a3;
  unsigned int v5 = +[NSDate now];
  plan = self->_plan;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10029772C;
  v10[3] = &unk_100417C20;
  v10[4] = self;
  LOBYTE(v3) = [(MBRestoreDomainPlan *)plan enumerateAndMarkUnfinishedAssets:v3 enumerator:v10];
  performer = self->_performer;
  id v8 = +[NSDate now];
  [(MBRestorePerformer *)performer recordPlacingDurationWithStart:v5 end:v8];

  return (char)v3;
}

- (BOOL)_placeZeroByteFiles:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _placeZeroByteFiles:]", "MBRestoreDomainEngine.m", 493, "error");
  }
  v3 = a3;
  unsigned int v5 = +[NSDate now];
  plan = self->_plan;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100297A10;
  v10[3] = &unk_100417C70;
  v10[4] = self;
  LOBYTE(v3) = [(MBRestoreDomainPlan *)plan enumerateAndMarkUnfinishedZeroByteFiles:v3 enumerator:v10];
  performer = self->_performer;
  id v8 = +[NSDate now];
  [(MBRestorePerformer *)performer recordPlacingDurationWithStart:v5 end:v8];

  return (char)v3;
}

- (BOOL)_placeSymlinks:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _placeSymlinks:]", "MBRestoreDomainEngine.m", 514, "error");
  }
  v3 = a3;
  unsigned int v5 = +[NSDate now];
  plan = self->_plan;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100297C88;
  v10[3] = &unk_100417CC0;
  v10[4] = self;
  LOBYTE(v3) = [(MBRestoreDomainPlan *)plan enumerateAndMarkUnfinishedSymlinks:v3 enumerator:v10];
  performer = self->_performer;
  id v8 = +[NSDate now];
  [(MBRestorePerformer *)performer recordPlacingDurationWithStart:v5 end:v8];

  return (char)v3;
}

- (BOOL)_fixUpDirectoryAttributes:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _fixUpDirectoryAttributes:]", "MBRestoreDomainEngine.m", 536, "error");
  }
  v3 = a3;
  unsigned int v5 = +[NSDate now];
  plan = self->_plan;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100297F54;
  v10[3] = &unk_100417BD0;
  v10[4] = self;
  LOBYTE(v3) = [(MBRestoreDomainPlan *)plan enumerateAndMarkPlacedDirectoriesBottomUp:v3 enumerator:v10];
  performer = self->_performer;
  id v8 = +[NSDate now];
  [(MBRestorePerformer *)performer recordPlacingDurationWithStart:v5 end:v8];

  return (char)v3;
}

- (unint64_t)_restoreRestorable:(id)a3 error:(id *)a4 actionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (!v8) {
    __assert_rtn("-[MBRestoreDomainEngine _restoreRestorable:error:actionBlock:]", "MBRestoreDomainEngine.m", 558, "restorable");
  }
  if (!a4) {
    __assert_rtn("-[MBRestoreDomainEngine _restoreRestorable:error:actionBlock:]", "MBRestoreDomainEngine.m", 559, "error");
  }
  id v10 = (unsigned int (**)(void, void))v9;
  if (!v9) {
    __assert_rtn("-[MBRestoreDomainEngine _restoreRestorable:error:actionBlock:]", "MBRestoreDomainEngine.m", 560, "actionBlock");
  }
  if ([(MBStatefulEngine *)self handleCancelation:a4])
  {
    unint64_t v11 = 1;
  }
  else
  {
    char v16 = 0;
    if ([(MBRestoreDomainEngine *)self _shouldRestore:&v16 restorable:v8 error:a4])
    {
      if (v16)
      {
        if (!((unsigned int (**)(void, id *))v10)[2](v10, a4))
        {
          unint64_t v11 = 6;
          goto LABEL_17;
        }
        id v12 = [(MBRestoreDomainEngine *)self progressModel];
        [v12 updatingProgress:1 previousProgress:1.0 size:0.0];
        unint64_t v11 = 5;
      }
      else
      {
        id v14 = MBGetDefaultLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v18 = v8;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "=domain-engine= Skipping restore of %@", buf, 0xCu);
          _MBLog();
        }

        id v12 = [(MBRestoreDomainEngine *)self progressModel];
        [v12 updatingProgress:1 previousProgress:1.0 size:0.0];
        unint64_t v11 = 2;
      }
    }
    else
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        id v13 = *a4;
        *(_DWORD *)buf = 138412546;
        id v18 = v8;
        __int16 v19 = 2112;
        id v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "=domain-engine= Failed determining if %@ should be restored: %@", buf, 0x16u);
        _MBLog();
      }
      unint64_t v11 = 6;
    }
  }
LABEL_17:

  return v11;
}

- (BOOL)_shouldRestore:(BOOL *)a3 restorable:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _shouldRestore:restorable:error:]", "MBRestoreDomainEngine.m", 588, "shouldRestoreOut");
  }
  id v9 = v8;
  if (!v8) {
    __assert_rtn("-[MBRestoreDomainEngine _shouldRestore:restorable:error:]", "MBRestoreDomainEngine.m", 589, "restorable");
  }
  if (!a5) {
    __assert_rtn("-[MBRestoreDomainEngine _shouldRestore:restorable:error:]", "MBRestoreDomainEngine.m", 590, "error");
  }
  char v17 = 0;
  policy = self->_policy;
  id v16 = 0;
  unsigned int v11 = [(MBRestorePolicy *)policy shouldRestoreFile:v9 markFileAsSkipped:&v17 error:&v16];
  id v12 = v16;
  id v13 = v12;
  if (v11)
  {
    BOOL v14 = 1;
    *a3 = 1;
  }
  else if (v17 {
         || !v12
  }
         || (+[MBError isError:v12 withCode:213] & 1) != 0)
  {
    *a3 = 0;
    BOOL v14 = 1;
  }
  else
  {
    BOOL v14 = 0;
    *a5 = v13;
  }

  return v14;
}

- (BOOL)_verify:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _verify:]", "MBRestoreDomainEngine.m", 614, "error");
  }
  if (self->_verifier)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    unsigned int v6 = [(MBRestoreSnapshotIntegrityVerifier *)self->_verifier verifyContainerizedDataAfterBackgroundRestore:self->_restoreRootPath domainPlan:self->_plan error:a3];
    double v7 = CFAbsoluteTimeGetCurrent() - Current;
    id v8 = MBGetDefaultLog();
    id v9 = v8;
    if (!v6)
    {
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        BOOL v10 = 0;
        goto LABEL_13;
      }
      BOOL v14 = [(MBRestoreDomainEngine *)self domainName];
      id v15 = *a3;
      *(_DWORD *)buf = 138543874;
      id v18 = v14;
      __int16 v19 = 2048;
      double v20 = v7;
      __int16 v21 = 2112;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "=domain-engine= %{public}@: Restore verification failed in %0.3fs: %@", buf, 0x20u);

      id v12 = [(MBRestoreDomainEngine *)self domainName];
      _MBLog();
      BOOL v10 = 0;
      goto LABEL_11;
    }
    BOOL v10 = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = [(MBRestoreDomainEngine *)self domainName];
      *(_DWORD *)buf = 138543618;
      id v18 = v11;
      __int16 v19 = 2048;
      double v20 = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "=domain-engine= %{public}@: Restore verification passed in %0.3fs", buf, 0x16u);

      id v12 = [(MBRestoreDomainEngine *)self domainName];
LABEL_8:
      _MBLog();
LABEL_11:
    }
  }
  else
  {
    id v9 = MBGetDefaultLog();
    BOOL v10 = 1;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v13 = [(MBRestoreDomainEngine *)self domainName];
      *(_DWORD *)buf = 138543362;
      id v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "=domain-engine= %{public}@: Skipped restore verification", buf, 0xCu);

      id v12 = [(MBRestoreDomainEngine *)self domainName];
      goto LABEL_8;
    }
  }
LABEL_13:

  return v10;
}

- (BOOL)_finalize:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBRestoreDomainEngine _finalize:]", "MBRestoreDomainEngine.m", 635, "error");
  }
  if (![(MBRestoreDomainPlan *)self->_plan setDomainState:10 error:a3]) {
    return 0;
  }
  unsigned int v5 = [(MBRestoreDomainPlan *)self->_plan countsOfRestorablesByState:a3];
  BOOL v6 = v5 != 0;
  if (v5)
  {
    double Current = CFAbsoluteTimeGetCurrent();
    double startTime = self->_startTime;
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v10 = [(MBRestoreDomainEngine *)self domainName];
      unsigned int v11 = MBDescriptionForStateSummaryDictionary(v5);
      *(_DWORD *)buf = 138543874;
      id v16 = v10;
      __int16 v17 = 2048;
      double v18 = Current - startTime;
      __int16 v19 = 2112;
      double v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "=domain-engine= %{public}@: Completed restore in %0.3fs: %@", buf, 0x20u);

      id v12 = [(MBRestoreDomainEngine *)self domainName];
      BOOL v14 = MBDescriptionForStateSummaryDictionary(v5);
      _MBLog();
    }
  }

  return v6;
}

- (BOOL)shouldCancelVerification
{
  return [(MBStatefulEngine *)self handleCancelation:0];
}

- (id)restoringBundleID
{
  v2 = [(MBRestorePolicy *)self->_policy serviceRestoreMode];
  if ([v2 isBackgroundApp])
  {
    v3 = [v2 bundleID];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (NSString)restoreRootPath
{
  return self->_restoreRootPath;
}

- (MBProgressModel)progressModel
{
  return self->_progressModel;
}

- (void)setProgressModel:(id)a3
{
}

- (unint64_t)restoreState
{
  return self->_restoreState;
}

- (void)setRestoreState:(unint64_t)a3
{
  self->_restoreState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressModel, 0);
  objc_storeStrong((id *)&self->_restoreRootPath, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_verifier, 0);
  objc_storeStrong((id *)&self->_performer, 0);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_storeStrong((id *)&self->_fetcher, 0);
  objc_storeStrong((id *)&self->_depot, 0);
  objc_storeStrong((id *)&self->_policy, 0);
}

@end