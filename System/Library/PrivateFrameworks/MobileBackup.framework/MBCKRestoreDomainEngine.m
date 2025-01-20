@interface MBCKRestoreDomainEngine
- (BOOL)finalizeRestoredDomainWithError:(id *)a3;
- (BOOL)isRestoringToSameDevice;
- (BOOL)restoreFilesWithError:(id *)a3;
- (BOOL)runWithError:(id *)a3;
- (BOOL)setUpWithError:(id *)a3;
- (BOOL)shouldCancelVerification;
- (MBCKCache)enumeratorCache;
- (MBCKRestoreDomainEngine)initWithRestoreEngine:(id)a3 enumeratorCache:(id)a4 domain:(id)a5;
- (MBCKRestoreEngine)parentEngine;
- (MBCKSnapshot)targetSnapshot;
- (MBDomain)domain;
- (NSString)safeHarborDir;
- (id)domainName;
- (id)restorePolicy;
- (int)engineMode;
- (int)restoreType;
- (unint64_t)restoreState;
- (void)_handleStateTransition;
- (void)cleanUpAfterError:(id)a3;
- (void)makeStateTransition;
- (void)resume;
- (void)setEnumeratorCache:(id)a3;
- (void)setParentEngine:(id)a3;
- (void)setRestoreState:(unint64_t)a3;
- (void)setSafeHarborDir:(id)a3;
- (void)setTargetSnapshot:(id)a3;
@end

@implementation MBCKRestoreDomainEngine

- (MBCKRestoreDomainEngine)initWithRestoreEngine:(id)a3 enumeratorCache:(id)a4 domain:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8) {
    __assert_rtn("-[MBCKRestoreDomainEngine initWithRestoreEngine:enumeratorCache:domain:]", "MBCKRestoreDomainEngine.m", 38, "engine");
  }
  id v11 = v10;
  uint64_t v12 = [v8 ckOperationPolicy];
  if (!v12) {
    __assert_rtn("-[MBCKRestoreDomainEngine initWithRestoreEngine:enumeratorCache:domain:]", "MBCKRestoreDomainEngine.m", 40, "policy");
  }
  v13 = (void *)v12;
  uint64_t v14 = [v8 ckOperationTracker];
  if (!v14) {
    __assert_rtn("-[MBCKRestoreDomainEngine initWithRestoreEngine:enumeratorCache:domain:]", "MBCKRestoreDomainEngine.m", 42, "tracker");
  }
  v15 = (void *)v14;
  uint64_t v16 = [v8 cache];
  if (!v16) {
    __assert_rtn("-[MBCKRestoreDomainEngine initWithRestoreEngine:enumeratorCache:domain:]", "MBCKRestoreDomainEngine.m", 44, "cache");
  }
  v17 = (void *)v16;
  uint64_t v18 = [v8 serviceManager];
  if (!v18) {
    __assert_rtn("-[MBCKRestoreDomainEngine initWithRestoreEngine:enumeratorCache:domain:]", "MBCKRestoreDomainEngine.m", 46, "serviceManager");
  }
  v19 = (void *)v18;
  uint64_t v20 = [v8 device];
  if (!v20) {
    __assert_rtn("-[MBCKRestoreDomainEngine initWithRestoreEngine:enumeratorCache:domain:]", "MBCKRestoreDomainEngine.m", 48, "device");
  }
  v21 = (void *)v20;
  id obj = a5;
  v35 = v11;
  [v8 context];
  v34 = v21;
  v22 = v19;
  v23 = v17;
  v24 = v15;
  v25 = v13;
  v27 = v26 = v9;
  v28 = [v8 debugContext];
  v29 = [v8 domainManager];
  v36.receiver = self;
  v36.super_class = (Class)MBCKRestoreDomainEngine;
  v30 = [(MBCKEngine *)&v36 initWithSettingsContext:v27 debugContext:v28 domainManager:v29];

  if (v30)
  {
    [(MBCKEngine *)v30 setServiceManager:v22];
    [(MBCKEngine *)v30 setCkOperationPolicy:v25];
    [(MBCKEngine *)v30 setCkOperationTracker:v24];
    [(MBCKRestoreDomainEngine *)v30 setParentEngine:v8];
    [(MBCKRestoreDomainEngine *)v30 setRestoreState:1];
    objc_storeStrong((id *)&v30->_domain, obj);
    [(MBCKEngine *)v30 setDevice:v34];
    [(MBCKEngine *)v30 setShouldAdvanceState:1];
    [(MBCKEngine *)v30 setCache:v23];
    [(MBCKRestoreDomainEngine *)v30 setEnumeratorCache:v26];
    v31 = [v8 targetSnapshot];
    [(MBCKRestoreDomainEngine *)v30 setTargetSnapshot:v31];
  }
  return v30;
}

- (id)domainName
{
  return [(MBDomain *)self->_domain name];
}

- (int)restoreType
{
  v2 = [(MBCKRestoreDomainEngine *)self parentEngine];
  int v3 = [v2 restoreType];

  return v3;
}

- (int)engineMode
{
  return 2;
}

- (BOOL)isRestoringToSameDevice
{
  v2 = [(MBCKRestoreDomainEngine *)self parentEngine];
  int v3 = [v2 device];
  v4 = [v3 deviceUUID];
  v5 = MBDeviceUUID();
  unsigned __int8 v6 = [v4 isEqualToString:v5];

  return v6;
}

- (id)restorePolicy
{
  v2 = [(MBCKRestoreDomainEngine *)self parentEngine];
  int v3 = [v2 restorePolicy];

  return v3;
}

- (void)cleanUpAfterError:(id)a3
{
  id v4 = a3;
  v5 = [(MBCKRestoreDomainEngine *)self domain];
  unsigned __int8 v6 = [v5 name];
  if ((+[MBDomain isAppName:v6] & 1) != 0
    || (+[MBDomain isAppPluginName:v6] & 1) != 0)
  {
    unsigned int v7 = 1;
  }
  else
  {
    unsigned int v7 = +[MBDomain isAppGroupName:v6];
  }
  if (![(MBEngine *)self isBackgroundRestore]
    || !v7
    || !+[MBError isRetryableRestoreError:v4])
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v6;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_FAULT, "=ckdomain-engine= Removing staged items for %{public}@ with error %@", buf, 0x16u);
      _MBLog();
    }

    uint64_t v43 = 0;
    v44 = &v43;
    uint64_t v45 = 0x2020000000;
    uint64_t v46 = 0;
    uint64_t v39 = 0;
    v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100136368;
    v34[3] = &unk_100414120;
    v34[4] = self;
    id v35 = v5;
    v37 = &v39;
    id v10 = v6;
    id v36 = v10;
    v38 = &v43;
    id v11 = objc_retainBlock(v34);
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v53 = sub_100136758;
    v54 = sub_100136768;
    id v55 = 0;
    uint64_t v12 = [(MBCKEngine *)self cache];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100136770;
    v31[3] = &unk_100414148;
    v33 = buf;
    v13 = v11;
    id v32 = v13;
    uint64_t v14 = [v12 enumeratePendingRestoreFilesForDomain:v10 excludingType:1 foundRestorable:v31];

    v15 = MBGetDefaultLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)v44[3];
      *(_DWORD *)v48 = 134218242;
      v49 = v16;
      __int16 v50 = 2114;
      id v51 = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "=ckdomain-engine= Removed a total of %llu files for %{public}@", v48, 0x16u);
      _MBLog();
    }

    v17 = *(void **)(*(void *)&buf[8] + 40);
    if (v14)
    {
      if (!v17)
      {
LABEL_20:
        v19 = MBGetDefaultLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v48 = 138543362;
          v49 = v14;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to enumerate restore files to cleanup after error: %{public}@", v48, 0xCu);
          _MBLog();
        }
        goto LABEL_33;
      }
LABEL_19:
      id v18 = v17;

      uint64_t v14 = v18;
      goto LABEL_20;
    }
    if (v17) {
      goto LABEL_19;
    }
    uint64_t v20 = [(MBCKEngine *)self cache];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1001367CC;
    v28[3] = &unk_100414148;
    v30 = buf;
    v29 = v13;
    uint64_t v14 = [v20 enumeratePendingRestoreFilesForDomain:v10 forType:1 orderAscending:0 foundRestorable:v28];

    v21 = MBGetDefaultLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)v40[3];
      *(_DWORD *)v48 = 134218242;
      v49 = v22;
      __int16 v50 = 2114;
      id v51 = v10;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=ckdomain-engine= Removed a total of %llu dirs for %{public}@", v48, 0x16u);
      _MBLog();
    }

    v23 = *(void **)(*(void *)&buf[8] + 40);
    if (v14)
    {
      if (!v23)
      {
LABEL_29:
        v25 = MBGetDefaultLog();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v48 = 138543362;
          v49 = v14;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to enumerate pending restore directories to cleanup after error: %{public}@", v48, 0xCu);
          _MBLog();
        }
        goto LABEL_31;
      }
    }
    else if (!v23)
    {
      v26 = [(MBCKEngine *)self cache];
      uint64_t v14 = [v26 setRestoreState:1 forFilesInDomain:v10];

      if (!v14)
      {
        v27.receiver = self;
        v27.super_class = (Class)MBCKRestoreDomainEngine;
        [(MBCKEngine *)&v27 cleanUpAfterError:v4];
        uint64_t v14 = 0;
        goto LABEL_32;
      }
      v25 = MBGetDefaultLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v48 = 138543362;
        v49 = v14;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to unset restore state: %{public}@", v48, 0xCu);
        _MBLog();
      }
LABEL_31:

LABEL_32:
      v19 = v29;
LABEL_33:

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(&v39, 8);
      _Block_object_dispose(&v43, 8);
      goto LABEL_34;
    }
    id v24 = v23;

    uint64_t v14 = v24;
    goto LABEL_29;
  }
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "=ckdomain-engine= Not removing staged items for %{public}@ with error %@", buf, 0x16u);
    _MBLog();
  }

  v47.receiver = self;
  v47.super_class = (Class)MBCKRestoreDomainEngine;
  [(MBCKEngine *)&v47 cleanUpAfterError:v4];
LABEL_34:
}

- (BOOL)runWithError:(id *)a3
{
  [(MBCKRestoreDomainEngine *)self resume];
  [(MBCKRestoreDomainEngine *)self makeStateTransition];
  unsigned int v5 = [(MBCKEngine *)self hasError];
  if (v5)
  {
    unsigned __int8 v6 = [(MBCKEngine *)self engineError];
    unsigned int v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = +[MBError loggableDescriptionForError:v6];
      id v9 = [(MBCKRestoreDomainEngine *)self domain];
      id v10 = [v9 name];
      *(_DWORD *)buf = 138543874;
      uint64_t v16 = v8;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      uint64_t v20 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Restore failed: %{public}@ (%@), %@", buf, 0x20u);

      id v11 = +[MBError loggableDescriptionForError:v6];
      uint64_t v12 = [(MBCKRestoreDomainEngine *)self domain];
      uint64_t v14 = [v12 name];
      _MBLog();
    }
    [(MBCKRestoreDomainEngine *)self cleanUpAfterError:v6];
    if (a3) {
      *a3 = v6;
    }
  }
  return v5 ^ 1;
}

- (void)resume
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 1;
  int v3 = [(MBCKEngine *)self cache];
  id v4 = [(MBCKRestoreDomainEngine *)self domainName];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100136AFC;
  v6[3] = &unk_100414170;
  v6[4] = &v7;
  unsigned int v5 = [v3 fetchDomainRestoreStateForDomain:v4 callback:v6];

  if (!v5) {
    [(MBCKRestoreDomainEngine *)self setRestoreState:v8[3]];
  }

  _Block_object_dispose(&v7, 8);
}

- (void)_handleStateTransition
{
  switch([(MBCKRestoreDomainEngine *)self restoreState])
  {
    case 1uLL:
      v25 = _NSConcreteStackBlock;
      uint64_t v26 = 3221225472;
      objc_super v27 = sub_100136E60;
      v28 = &unk_100411478;
      v29 = self;
      int v3 = &v25;
      goto LABEL_5;
    case 2uLL:
      uint64_t v20 = _NSConcreteStackBlock;
      uint64_t v21 = 3221225472;
      v22 = sub_100136E6C;
      v23 = &unk_100411478;
      id v24 = self;
      int v3 = &v20;
      goto LABEL_5;
    case 3uLL:
      v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      __int16 v17 = sub_100136E78;
      id v18 = &unk_100411478;
      __int16 v19 = self;
      int v3 = &v15;
LABEL_5:
      [(MBCKEngine *)self performRetryablePhase:v3];
      break;
    case 4uLL:
      id v4 = MBGetDefaultLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v5 = [(MBCKRestoreDomainEngine *)self domainName];
        *(_DWORD *)buf = 138543362;
        v31 = v5;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "=ckdomain-engine= Domain restore of %{public}@ finished successfully", buf, 0xCu);

        uint64_t v14 = [(MBCKRestoreDomainEngine *)self domainName];
        _MBLog();
      }
      [(MBCKEngine *)self setIsFinished:1];
      [(MBCKEngine *)self setEngineError:0];
      break;
    default:
      break;
  }
  if ([(MBCKEngine *)self isFinished])
  {
    unsigned __int8 v6 = [(MBCKEngine *)self progressModel];
    [v6 ended];
  }
  else
  {
    [(MBCKRestoreDomainEngine *)self setRestoreState:(char *)[(MBCKRestoreDomainEngine *)self restoreState] + 1];
  }
  uint64_t v7 = [(MBCKRestoreDomainEngine *)self parentEngine];
  unsigned __int8 v8 = [v7 isForegroundRestore];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [(MBCKEngine *)self cache];
    unint64_t v10 = [(MBCKRestoreDomainEngine *)self restoreState];
    id v11 = [(MBCKRestoreDomainEngine *)self domainName];
    uint64_t v12 = [v9 setDomainRestoreState:v10 forDomain:v11];

    if (v12)
    {
      v13 = MBGetDefaultLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to set state in cache transaction: %@", buf, 0xCu);
        _MBLog();
      }
    }
  }
}

- (void)makeStateTransition
{
  [(MBCKRestoreDomainEngine *)self _handleStateTransition];
  v4.receiver = self;
  v4.super_class = (Class)MBCKRestoreDomainEngine;
  [(MBCKEngine *)&v4 makeStateTransition];
}

- (BOOL)setUpWithError:(id *)a3
{
  v59.receiver = self;
  v59.super_class = (Class)MBCKRestoreDomainEngine;
  if (-[MBCKEngine setUpWithError:](&v59, "setUpWithError:"))
  {
    unsigned int v5 = [(MBCKRestoreDomainEngine *)self domain];

    if (v5)
    {
      unsigned __int8 v6 = [(MBCKEngine *)self cache];
      uint64_t v7 = [(MBCKRestoreDomainEngine *)self domainName];
      id v58 = 0;
      unsigned int v8 = [v6 domainShouldRestoreToSafeHarbor:v7 error:&v58];
      id v9 = v58;

      if (v9)
      {
        unint64_t v10 = MBGetDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = [(MBCKRestoreDomainEngine *)self domainName];
          *(_DWORD *)buf = 138412546;
          v61 = v11;
          __int16 v62 = 2112;
          id v63 = v9;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to determine if %@ should restore to safe harbor: %@", buf, 0x16u);

          v53 = [(MBCKRestoreDomainEngine *)self domainName];
          _MBLog();
        }
        if (!a3)
        {
          BOOL v15 = 0;
          goto LABEL_40;
        }
        id v12 = v9;
        id v9 = v12;
LABEL_12:
        BOOL v15 = 0;
        *a3 = v12;
LABEL_40:

        return v15;
      }
      uint64_t v16 = [(MBCKRestoreDomainEngine *)self parentEngine];
      if (!v16) {
        __assert_rtn("-[MBCKRestoreDomainEngine setUpWithError:]", "MBCKRestoreDomainEngine.m", 278, "parentEngine");
      }
      __int16 v17 = (void *)v16;
      id v18 = [(MBCKRestoreDomainEngine *)self domain];
      __int16 v19 = [v18 rootPath];

      if ([v17 isForegroundRestore])
      {
        uint64_t v20 = [(MBCKRestoreDomainEngine *)self domain];
        unsigned __int8 v21 = [v20 shouldRestoreToSharedVolume];
        v22 = [(MBCKEngine *)self persona];
        v23 = v22;
        if (v21) {
          [v22 sharedIncompleteRestoreDirectory];
        }
        else {
        id v24 = [v22 userIncompleteRestoreDirectory];
        }

        uint64_t v25 = [v24 stringByAppendingPathComponent:v19];

        __int16 v19 = (void *)v25;
      }
      if (v8)
      {
        uint64_t v26 = [v17 appManager];
        objc_super v27 = [(MBCKEngine *)self context];
        v28 = [v27 restoreMode];
        v29 = [v28 bundleID];
        v30 = [v26 appWithIdentifier:v29];

        v31 = [v17 appManager];
        id v32 = [(MBCKEngine *)self persona];
        id v57 = 0;
        v33 = objc_msgSend(v31, "createSafeHarborForContainer:withPersona:usingIntermediateRestoreDir:error:", v30, v32, objc_msgSend(v17, "isForegroundRestore"), &v57);
        id v34 = v57;

        if (v33)
        {
          id v35 = [v17 appManager];
          id v36 = [(MBCKEngine *)self context];
          v37 = [v36 restoreMode];
          v38 = [v37 bundleID];
          uint64_t v39 = [v35 appWithIdentifier:v38];

          if ([v39 isSafeHarbor])
          {
            v40 = [v39 safeHarborDir];
            [(MBCKRestoreDomainEngine *)self setSafeHarborDir:v40];
          }
          BOOL v15 = 1;
          v30 = v39;
          goto LABEL_38;
        }
        uint64_t v46 = MBGetDefaultLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          objc_super v47 = [(MBCKEngine *)self context];
          v48 = [v47 restoreMode];
          v49 = [v48 bundleID];
          *(_DWORD *)buf = 138412546;
          v61 = v49;
          __int16 v62 = 2112;
          id v63 = v34;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "=ckdomain-engine= Failed to create safe harbor for %@: %@", buf, 0x16u);

          __int16 v50 = [(MBCKEngine *)self context];
          id v51 = [v50 restoreMode];
          id v55 = [v51 bundleID];
          _MBLog();
        }
        if (a3)
        {
          id v34 = v34;
          BOOL v15 = 0;
          *a3 = v34;
LABEL_38:

          goto LABEL_39;
        }
LABEL_37:
        BOOL v15 = 0;
        goto LABEL_38;
      }
      uint64_t v41 = MBGetDefaultLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v42 = [(MBCKRestoreDomainEngine *)self domain];
        *(_DWORD *)buf = 138543618;
        v61 = v42;
        __int16 v62 = 2114;
        id v63 = v19;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "=ckdomain-engine= Creating root path for domain %{public}@ at %{public}@", buf, 0x16u);

        v54 = [(MBCKRestoreDomainEngine *)self domain];
        _MBLog();
      }
      id v34 = +[NSFileManager defaultManager];
      if ([v34 fileExistsAtPath:v19])
      {
        BOOL v15 = 1;
      }
      else
      {
        uint64_t v43 = MBMobileFileAttributes();
        BOOL v15 = 1;
        unsigned __int8 v44 = [v34 createDirectoryAtPath:v19 withIntermediateDirectories:1 attributes:v43 error:a3];

        if ((v44 & 1) == 0)
        {
          if (!a3)
          {
            BOOL v15 = 0;
            goto LABEL_39;
          }
          v30 = [(MBCKRestoreDomainEngine *)self domain];
          uint64_t v45 = [v30 name];
          *a3 = +[MBError errorWithCode:100, v19, @"Error creating root path for domain %@", v45 path format];

          goto LABEL_37;
        }
      }
LABEL_39:

      id v9 = 0;
      goto LABEL_40;
    }
    v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = [(MBCKRestoreDomainEngine *)self domainName];
      *(_DWORD *)buf = 138412546;
      v61 = self;
      __int16 v62 = 2112;
      id v63 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Unable to get domain for restore %@ (%@)", buf, 0x16u);

      v56 = [(MBCKRestoreDomainEngine *)self domainName];
      _MBLog();
    }
    if (a3)
    {
      id v9 = [(MBCKRestoreDomainEngine *)self domainName];
      id v12 = +[MBError errorWithCode:205, @"Failed to get domain for %@", v9 format];
      goto LABEL_12;
    }
  }
  return 0;
}

- (BOOL)restoreFilesWithError:(id *)a3
{
  objc_super v4 = [(MBCKEngine *)self ckOperationTracker];
  unsigned int v5 = v4;
  if (!v4) {
    __assert_rtn("-[MBCKRestoreDomainEngine restoreFilesWithError:]", "MBCKRestoreDomainEngine.m", 314, "tracker");
  }
  unsigned __int8 v6 = [v4 account];
  if (!v6) {
    __assert_rtn("-[MBCKRestoreDomainEngine restoreFilesWithError:]", "MBCKRestoreDomainEngine.m", 316, "serviceAccount");
  }
  id v51 = [(MBCKRestoreDomainEngine *)self domainName];
  v52 = [(MBCKRestoreDomainEngine *)self domain];
  if (v52)
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v98 = sub_100136758;
    v99 = sub_100136768;
    id v100 = 0;
    uint64_t v7 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.backupd.restore_queue", v7);

    v89[0] = 0;
    v89[1] = v89;
    v89[2] = 0x3032000000;
    v89[3] = sub_100136758;
    v89[4] = sub_100136768;
    id v90 = (id)objc_opt_new();
    uint64_t v83 = 0;
    v84 = &v83;
    uint64_t v85 = 0x3032000000;
    v86 = sub_100136758;
    v87 = sub_100136768;
    id v88 = (id)objc_opt_new();
    uint64_t v77 = 0;
    v78 = &v77;
    uint64_t v79 = 0x3032000000;
    v80 = sub_100136758;
    v81 = sub_100136768;
    id v82 = (id)objc_opt_new();
    id v9 = +[MBBehaviorOptions sharedOptions];
    id v10 = [v9 maxBatchCount];

    id v11 = +[MBBehaviorOptions sharedOptions];
    id v12 = [v11 maxBatchFetchAssetSize];

    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_100138204;
    v70[3] = &unk_1004141E8;
    v70[4] = self;
    id v71 = v5;
    v75 = &v77;
    id v72 = v6;
    v48 = v8;
    v73 = v48;
    id v13 = v51;
    id v74 = v13;
    v76 = &v83;
    v49 = objc_retainBlock(v70);
    uint64_t v14 = [(MBCKRestoreDomainEngine *)self enumeratorCache];
    if (v14)
    {
      id v15 = 0;
    }
    else
    {
      id v18 = [(MBCKEngine *)self cache];
      __int16 v19 = [v18 tracker];

      if (!v19) {
        __assert_rtn("-[MBCKRestoreDomainEngine restoreFilesWithError:]", "MBCKRestoreDomainEngine.m", 471, "cacheTracker");
      }
      id v69 = 0;
      uint64_t v14 = [v19 openCacheWithAccessType:2 cached:0 error:&v69];
      id v15 = v69;
      if (!v14)
      {
        v37 = MBGetDefaultLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v95 = 138412546;
          *(void *)&v95[4] = v13;
          *(_WORD *)&v95[12] = 2112;
          *(void *)&v95[14] = v15;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to re-open cache during restore for %@: %@", v95, 0x16u);
          _MBLog();
        }

        if (a3)
        {
          id v15 = v15;
          BOOL v17 = 0;
          *a3 = v15;
        }
        else
        {
          BOOL v17 = 0;
        }
        goto LABEL_45;
      }
    }
    *(void *)v95 = 0;
    *(void *)&v95[8] = v95;
    *(void *)&v95[16] = 0x2020000000;
    uint64_t v96 = 0;
    uint64_t v20 = [(MBCKRestoreDomainEngine *)self parentEngine];
    if (!v20) {
      __assert_rtn("-[MBCKRestoreDomainEngine restoreFilesWithError:]", "MBCKRestoreDomainEngine.m", 482, "parentEngine");
    }
    v58[0] = _NSConcreteStackBlock;
    v58[1] = 3221225472;
    v58[2] = sub_100139348;
    v58[3] = &unk_100414210;
    v58[4] = self;
    __int16 v62 = buf;
    id v21 = v52;
    id v59 = v21;
    id v22 = v20;
    id v60 = v22;
    id v63 = v89;
    v64 = &v77;
    v65 = &v83;
    v66 = v95;
    id v67 = v10;
    id v68 = v12;
    v23 = v49;
    id v61 = v23;
    id v24 = [v14 enumeratePendingRestoreFilesForDomain:v13 orderAscending:1 foundRestorable:v58];

    if (v24)
    {
      uint64_t v25 = [(MBCKRestoreDomainEngine *)self enumeratorCache];
      BOOL v26 = v14 == v25;

      if (!v26) {
        [v14 close];
      }
      objc_super v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v91 = 138412546;
        id v92 = v13;
        __int16 v93 = 2112;
        v94 = v24;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to enumerate pending restore directories (first pass) for %@: %@", v91, 0x16u);
        _MBLog();
      }

      if (a3)
      {
        id v28 = v24;
        id v24 = v28;
LABEL_21:
        BOOL v17 = 0;
        *a3 = v28;
LABEL_44:

        _Block_object_dispose(v95, 8);
        __int16 v19 = v14;
        id v15 = v24;
LABEL_45:

        _Block_object_dispose(&v77, 8);
        _Block_object_dispose(&v83, 8);

        _Block_object_dispose(v89, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_46;
      }
LABEL_43:
      BOOL v17 = 0;
      goto LABEL_44;
    }
    if ([(MBCKEngine *)self handleCancelation:a3])
    {
      v29 = [(MBCKRestoreDomainEngine *)self enumeratorCache];
      BOOL v30 = v14 == v29;

      if (v30)
      {
LABEL_42:
        id v24 = 0;
        goto LABEL_43;
      }
LABEL_24:
      [v14 close];
      goto LABEL_42;
    }
    if (!*(void *)(*(void *)&buf[8] + 40) && [(id)v84[5] count])
    {
      uint64_t v31 = ((void (*)(void *, uint64_t))v23[2])(v23, v84[5]);
      id v32 = *(void **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v31;
    }
    if (*(void *)(*(void *)&buf[8] + 40))
    {
      v33 = [(MBCKRestoreDomainEngine *)self enumeratorCache];
      BOOL v34 = v14 == v33;

      if (!v34) {
        [v14 close];
      }
      id v35 = MBGetDefaultLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        id v36 = *(void **)(*(void *)&buf[8] + 40);
        *(_DWORD *)v91 = 138412290;
        id v92 = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to restore domain: %@", v91, 0xCu);
        _MBLog();
      }

      if (a3)
      {
        id v28 = *(id *)(*(void *)&buf[8] + 40);
        id v24 = 0;
        goto LABEL_21;
      }
      goto LABEL_42;
    }
    if ([(MBCKEngine *)self handleCancelation:a3])
    {
      v38 = [(MBCKRestoreDomainEngine *)self enumeratorCache];
      BOOL v39 = v14 == v38;

      if (v39) {
        goto LABEL_42;
      }
      goto LABEL_24;
    }
    uint64_t v41 = (void *)v78[5];
    v78[5] = 0;

    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100139ADC;
    v53[3] = &unk_100414238;
    v53[4] = self;
    v56 = buf;
    id v57 = v89;
    id v54 = v21;
    id v55 = v22;
    id v24 = [v14 enumeratePendingRestoreFilesForDomain:v13 forType:1 orderAscending:1 foundRestorable:v53];
    uint64_t v42 = [(MBCKRestoreDomainEngine *)self enumeratorCache];
    BOOL v43 = v14 == v42;

    if (!v43) {
      [v14 close];
    }
    if (v24)
    {
      unsigned __int8 v44 = MBGetDefaultLog();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v91 = 138412546;
        id v92 = v13;
        __int16 v93 = 2112;
        v94 = v24;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to enumerate pending restore directories (second pass) for %@: %@", v91, 0x16u);
        _MBLog();
      }

      uint64_t v45 = v24;
      if (!a3)
      {
LABEL_61:
        BOOL v17 = 0;
        goto LABEL_63;
      }
    }
    else
    {
      if (!*(void *)(*(void *)&buf[8] + 40))
      {
        BOOL v17 = 1;
        goto LABEL_63;
      }
      uint64_t v46 = MBGetDefaultLog();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        objc_super v47 = *(void **)(*(void *)&buf[8] + 40);
        *(_DWORD *)v91 = 138412546;
        id v92 = v13;
        __int16 v93 = 2112;
        v94 = v47;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to restore domain %@: %@", v91, 0x16u);
        _MBLog();
      }

      if (!a3) {
        goto LABEL_61;
      }
      uint64_t v45 = *(void **)(*(void *)&buf[8] + 40);
    }
    BOOL v17 = 0;
    *a3 = v45;
LABEL_63:

    goto LABEL_44;
  }
  uint64_t v16 = MBGetDefaultLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v51;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Unable to get domain for restore %@ (%@)", buf, 0x16u);
    _MBLog();
  }

  if (a3)
  {
    +[MBError errorWithCode:205, @"Failed to get domain for %@", v51 format];
    BOOL v17 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_46:

  return v17;
}

- (BOOL)finalizeRestoredDomainWithError:(id *)a3
{
  if (!a3) {
    __assert_rtn("-[MBCKRestoreDomainEngine finalizeRestoredDomainWithError:]", "MBCKRestoreDomainEngine.m", 620, "error");
  }
  unsigned int v5 = [(MBCKRestoreDomainEngine *)self parentEngine];
  if (!v5) {
    __assert_rtn("-[MBCKRestoreDomainEngine finalizeRestoredDomainWithError:]", "MBCKRestoreDomainEngine.m", 622, "parentEngine");
  }
  unsigned __int8 v6 = v5;
  if (([v5 isForegroundRestore] & 1) == 0)
  {
    uint64_t v7 = [(MBCKEngine *)self context];
    dispatch_queue_t v8 = [v7 restoreMode];
    unsigned int v9 = [v8 isBackgroundApp];

    if (v9)
    {
      id v10 = [(MBCKEngine *)self context];
      id v11 = [v10 restoreMode];
      id v12 = [v11 bundleID];

      id v13 = [(MBCKRestoreDomainEngine *)self domain];
      uint64_t v14 = [v13 name];

      id v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v45 = v14;
        __int16 v46 = 2112;
        id v47 = v12;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "=ckdomain-engine= Finalizing the restore for %@ (%@)", buf, 0x16u);
        v40 = v14;
        id v41 = v12;
        _MBLog();
      }

      +[NSDate timeIntervalSinceReferenceDate];
      double v17 = v16;
      id v18 = [(MBCKEngine *)self context];
      __int16 v19 = [v18 restoreMode];
      unsigned int v20 = [v19 wasCancelled];

      if (v20)
      {
        id v21 = MBGetDefaultLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = v12;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "=ckdomain-engine= Uninstalling the placeholder for %@", buf, 0xCu);
          v40 = v12;
          _MBLog();
        }

        id v22 = [(MBCKEngine *)self context];
        v23 = [v22 mobileInstallation];
        id v43 = 0;
        unsigned __int8 v24 = [v23 uninstallAppWithBundleID:v12 error:&v43];
        id v25 = v43;

        if ((v24 & 1) == 0)
        {
          BOOL v26 = MBGetDefaultLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v45 = v12;
            __int16 v46 = 2112;
            id v47 = v25;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "=ckdomain-engine= Failed to uninstall the placeholder for %@: %@", buf, 0x16u);
            v40 = v12;
            id v41 = v25;
            _MBLog();
          }

          *a3 = v25;
        }
      }
      else
      {
        id v28 = [v6 appManager];
        v29 = [(MBCKEngine *)self persona];
        BOOL v30 = [v28 fetchAppWithIdentifier:v12 persona:v29 error:a3];

        if (!v30)
        {
          BOOL v27 = 0;
LABEL_20:

          goto LABEL_21;
        }
      }
      +[NSDate timeIntervalSinceReferenceDate];
      double v32 = v31;
      v33 = MBGetDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        BOOL v34 = [(MBCKEngine *)self context];
        id v35 = [v34 restoreMode];
        id v36 = [v35 errorString];
        *(_DWORD *)buf = 138413058;
        uint64_t v45 = v14;
        __int16 v46 = 2112;
        id v47 = v12;
        __int16 v48 = 2048;
        double v49 = v32 - v17;
        __int16 v50 = 2112;
        id v51 = v36;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "=ckdomain-engine= Finalized the restore for %@ (%@) in %0.3fs (%@)", buf, 0x2Au);

        v37 = [(MBCKEngine *)self context];
        v38 = [v37 restoreMode];
        uint64_t v42 = [v38 errorString];
        _MBLog();
      }
      BOOL v27 = 1;
      goto LABEL_20;
    }
  }
  BOOL v27 = 1;
LABEL_21:

  return v27;
}

- (BOOL)shouldCancelVerification
{
  return [(MBCKEngine *)self handleCancelation:0];
}

- (MBCKCache)enumeratorCache
{
  return self->_enumeratorCache;
}

- (void)setEnumeratorCache:(id)a3
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

- (MBCKRestoreEngine)parentEngine
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentEngine);
  return (MBCKRestoreEngine *)WeakRetained;
}

- (void)setParentEngine:(id)a3
{
}

- (MBDomain)domain
{
  return self->_domain;
}

- (NSString)safeHarborDir
{
  return self->_safeHarborDir;
}

- (void)setSafeHarborDir:(id)a3
{
}

- (MBCKSnapshot)targetSnapshot
{
  return self->_targetSnapshot;
}

- (void)setTargetSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSnapshot, 0);
  objc_storeStrong((id *)&self->_safeHarborDir, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_destroyWeak((id *)&self->_parentEngine);
  objc_storeStrong((id *)&self->_enumeratorCache, 0);
}

@end