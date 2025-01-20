@interface MBCKRestoreFileEngine
+ (void)_removeBundleIconNameKeyFrom:(id)a3;
- (BOOL)_restoreLegacyZippedAppPlaceholderWithError:(id *)a3;
- (BOOL)downloadWithError:(id *)a3;
- (BOOL)restoreAssetWithError:(id *)a3;
- (BOOL)runWithError:(id *)a3;
- (BOOL)setAttributesWithError:(id *)a3;
- (BOOL)setExtendedAttributesWithError:(id *)a3;
- (BOOL)setProtectionClassWithError:(id *)a3;
- (BOOL)setUpWithError:(id *)a3;
- (BOOL)shouldSetProtectionClass;
- (BOOL)validateWithError:(id *)a3;
- (MBCKFile)file;
- (MBCKRestoreFileEngine)initWithRestoreEngine:(id)a3 file:(id)a4 destinationPath:(id)a5 shouldSetProtectionClass:(BOOL)a6;
- (MBRestoreOperationLogger)restoreLogger;
- (NSString)destinationPath;
- (int)engineMode;
- (int)restoreType;
- (unint64_t)restoreState;
- (void)_decrementSignatureRetainCount;
- (void)_handleStateTransition;
- (void)cleanUpAfterError:(id)a3;
- (void)makeStateTransition;
- (void)setDestinationPath:(id)a3;
- (void)setFile:(id)a3;
- (void)setRestoreLogger:(id)a3;
- (void)setRestoreState:(unint64_t)a3;
- (void)setShouldSetProtectionClass:(BOOL)a3;
@end

@implementation MBCKRestoreFileEngine

- (MBCKRestoreFileEngine)initWithRestoreEngine:(id)a3 file:(id)a4 destinationPath:(id)a5 shouldSetProtectionClass:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v10) {
    __assert_rtn("-[MBCKRestoreFileEngine initWithRestoreEngine:file:destinationPath:shouldSetProtectionClass:]", "MBCKRestoreFileEngine.m", 32, "engine");
  }
  id v13 = v12;
  v38 = [v10 ckOperationPolicy];
  if (!v38) {
    __assert_rtn("-[MBCKRestoreFileEngine initWithRestoreEngine:file:destinationPath:shouldSetProtectionClass:]", "MBCKRestoreFileEngine.m", 34, "policy");
  }
  v37 = [v10 ckOperationTracker];
  if (!v37) {
    __assert_rtn("-[MBCKRestoreFileEngine initWithRestoreEngine:file:destinationPath:shouldSetProtectionClass:]", "MBCKRestoreFileEngine.m", 36, "tracker");
  }
  v36 = [v10 cache];
  if (!v36) {
    __assert_rtn("-[MBCKRestoreFileEngine initWithRestoreEngine:file:destinationPath:shouldSetProtectionClass:]", "MBCKRestoreFileEngine.m", 38, "cache");
  }
  v35 = [v10 serviceManager];
  if (!v35) {
    __assert_rtn("-[MBCKRestoreFileEngine initWithRestoreEngine:file:destinationPath:shouldSetProtectionClass:]", "MBCKRestoreFileEngine.m", 40, "serviceManager");
  }
  uint64_t v14 = [v10 device];
  if (!v14) {
    __assert_rtn("-[MBCKRestoreFileEngine initWithRestoreEngine:file:destinationPath:shouldSetProtectionClass:]", "MBCKRestoreFileEngine.m", 42, "device");
  }
  v15 = (void *)v14;
  v33 = v13;
  v34 = v11;
  uint64_t v16 = [v10 restoreLogger];
  v17 = [v10 context];
  v18 = [v10 debugContext];
  v19 = [v10 domainManager];
  v40.receiver = self;
  v40.super_class = (Class)MBCKRestoreFileEngine;
  v20 = [(MBCKEngine *)&v40 initWithSettingsContext:v17 debugContext:v18 domainManager:v19];

  v21 = (void *)v16;
  if (v20)
  {
    [(MBCKEngine *)v20 setServiceManager:v35];
    [(MBCKEngine *)v20 setCkOperationPolicy:v38];
    [(MBCKEngine *)v20 setCkOperationTracker:v37];
    v20->_restoreType = [v10 restoreType];
    [(MBCKRestoreFileEngine *)v20 setShouldSetProtectionClass:v6];
    objc_storeStrong((id *)&v20->_file, a4);
    [(MBCKEngine *)v20 setCache:v36];
    [(MBCKEngine *)v20 setShouldAdvanceState:1];
    [(MBCKRestoreFileEngine *)v20 setRestoreState:1];
    [(MBCKRestoreFileEngine *)v20 setRestoreLogger:v16];
    [(MBCKEngine *)v20 setDevice:v15];
    objc_storeStrong((id *)&v20->_destinationPath, a5);
    v22 = [(MBCKEngine *)v20 cache];
    v23 = [(MBCKRestoreFileEngine *)v20 file];
    v24 = [v23 fileID];
    id v39 = 0;
    id v25 = [v22 fetchRestoreFileStateForFileID:v24 error:&v39];
    id v26 = v39;
    [(MBCKRestoreFileEngine *)v20 setRestoreState:v25];

    if (v26)
    {
      v27 = MBGetDefaultLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = [(MBCKRestoreFileEngine *)v20 file];
        v29 = [v28 fileID];
        *(_DWORD *)buf = 138412546;
        v42 = v29;
        __int16 v43 = 2112;
        id v44 = v26;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Error getting restore file state for file %@: %@", buf, 0x16u);

        v30 = [(MBCKRestoreFileEngine *)v20 file];
        v32 = [v30 fileID];
        _MBLog();
      }
    }

    v21 = (void *)v16;
  }

  return v20;
}

- (int)engineMode
{
  return 2;
}

- (int)restoreType
{
  return self->_restoreType;
}

- (void)cleanUpAfterError:(id)a3
{
  id v4 = a3;
  if (!+[MBError isRetryableRestoreError:v4])
  {
    v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      BOOL v6 = [(MBCKRestoreFileEngine *)self file];
      *(_DWORD *)buf = 138412546;
      uint64_t v16 = v6;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Non retryable restore error for %@: %@. Setting state to non-retryable failure.", buf, 0x16u);

      id v12 = [(MBCKRestoreFileEngine *)self file];
      id v13 = v4;
      _MBLog();
    }
    [(MBCKRestoreFileEngine *)self setRestoreState:12];
    v7 = [(MBCKEngine *)self cache];
    unint64_t v8 = [(MBCKRestoreFileEngine *)self restoreState];
    v9 = [(MBCKRestoreFileEngine *)self file];
    id v10 = [v7 setRestoreState:v8 forFile:v9];

    if (v10)
    {
      id v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to set state in cache transaction: %@", buf, 0xCu);
        id v12 = v10;
        _MBLog();
      }
    }
  }
  v14.receiver = self;
  v14.super_class = (Class)MBCKRestoreFileEngine;
  -[MBCKEngine cleanUpAfterError:](&v14, "cleanUpAfterError:", v4, v12, v13);
}

- (void)setDestinationPath:(id)a3
{
  id v4 = (NSString *)a3;
  v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    unint64_t v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "File will restore to overridden destination %@", buf, 0xCu);
    _MBLog();
  }

  destinationPath = self->_destinationPath;
  self->_destinationPath = v4;
}

- (BOOL)runWithError:(id *)a3
{
  [(MBCKRestoreFileEngine *)self makeStateTransition];
  unsigned int v5 = [(MBCKEngine *)self hasError];
  if (v5)
  {
    BOOL v6 = [(MBCKEngine *)self engineError];
    v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = [(MBCKRestoreFileEngine *)self file];
      *(_DWORD *)buf = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      objc_super v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Restore failed: %@ (%@)", buf, 0x16u);

      id v10 = [(MBCKRestoreFileEngine *)self file];
      _MBLog();
    }
    [(MBCKRestoreFileEngine *)self cleanUpAfterError:v6];
    if (a3) {
      *a3 = v6;
    }
  }
  return v5 ^ 1;
}

- (void)_handleStateTransition
{
  uint64_t v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  switch([(MBCKRestoreFileEngine *)self restoreState])
  {
    case 1uLL:
      v3 = MBGetDefaultLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        id v4 = v3;
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v5 = [(MBCKRestoreFileEngine *)self file];
          *(_DWORD *)buf = 138412290;
          v37 = v5;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Restoring %@", buf, 0xCu);
        }
        v24 = [(MBCKRestoreFileEngine *)self file];
        _MBLog();
      }
      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10011CB30;
      v31[3] = &unk_100411478;
      v31[4] = self;
      [(MBCKEngine *)self performRetryablePhase:v31];
      goto LABEL_29;
    case 2uLL:
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10011CB3C;
      v30[3] = &unk_100411478;
      v30[4] = self;
      [(MBCKEngine *)self performRetryablePhase:v30];
      goto LABEL_29;
    case 3uLL:
      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10011CB48;
      v29[3] = &unk_100413AE8;
      v29[4] = self;
      v29[5] = &v32;
      [(MBCKEngine *)self performRetryablePhase:v29];
      goto LABEL_29;
    case 5uLL:
      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_10011CCAC;
      v28[3] = &unk_100411478;
      v28[4] = self;
      [(MBCKEngine *)self performRetryablePhase:v28];
      goto LABEL_29;
    case 6uLL:
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_10011CCB8;
      v27[3] = &unk_100411478;
      v27[4] = self;
      [(MBCKEngine *)self performRetryablePhase:v27];
      goto LABEL_29;
    case 9uLL:
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10011CCC4;
      v26[3] = &unk_100411478;
      v26[4] = self;
      [(MBCKEngine *)self performRetryablePhase:v26];
      goto LABEL_29;
    case 0xAuLL:
      if (![(MBCKRestoreFileEngine *)self shouldSetProtectionClass]) {
        [(MBCKEngine *)self setIsFinished:1];
      }
      v25[0] = _NSConcreteStackBlock;
      v25[1] = 3221225472;
      v25[2] = sub_10011CCD0;
      v25[3] = &unk_100411478;
      v25[4] = self;
      [(MBCKEngine *)self performRetryablePhase:v25];
      goto LABEL_29;
    case 0xBuLL:
      BOOL v6 = MBGetDefaultLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      BOOL v6 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = [(MBCKRestoreFileEngine *)self destinationPath];
        *(_DWORD *)buf = 138412290;
        v37 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "File restored to %@", buf, 0xCu);
      }
      break;
    case 0xCuLL:
      [(MBCKEngine *)self setIsFinished:1];
      unint64_t v10 = [(MBCKRestoreFileEngine *)self restoreState];
      id v11 = [(MBCKRestoreFileEngine *)self file];
      id v12 = [v11 domainName];
      __int16 v13 = [(MBCKRestoreFileEngine *)self file];
      objc_super v14 = [v13 fileID];
      v15 = +[MBError errorWithCode:202, @"File is in non-retryable failed state:%lu, domain:%@, fileID:%@", v10, v12, v14 format];
      [(MBCKEngine *)self setEngineError:v15];

      goto LABEL_29;
    case 0xDuLL:
      BOOL v6 = MBGetDefaultLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      BOOL v6 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = [(MBCKRestoreFileEngine *)self destinationPath];
        *(_DWORD *)buf = 138412290;
        v37 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "File skipped %@", buf, 0xCu);
      }
      break;
    case 0xEuLL:
      BOOL v6 = MBGetDefaultLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_27;
      }
      BOOL v6 = v6;
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v9 = [(MBCKRestoreFileEngine *)self destinationPath];
        *(_DWORD *)buf = 138412290;
        v37 = v9;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "File handled by restore plan %@", buf, 0xCu);
      }
      break;
    default:
      goto LABEL_29;
  }

  v24 = [(MBCKRestoreFileEngine *)self destinationPath];
  _MBLog();

LABEL_27:
  [(MBCKEngine *)self setIsFinished:1];
  [(MBCKEngine *)self setEngineError:0];
LABEL_29:
  if ([(MBCKEngine *)self isFinished])
  {
    uint64_t v16 = [(MBCKEngine *)self progressModel];
    [v16 ended];
  }
  else
  {
    if (*((unsigned char *)v33 + 24)) {
      uint64_t v17 = 13;
    }
    else {
      uint64_t v17 = (uint64_t)[(MBCKRestoreFileEngine *)self restoreState] + 1;
    }
    [(MBCKRestoreFileEngine *)self setRestoreState:v17];
  }
  if ((id)[(MBCKRestoreFileEngine *)self restoreState] != (id)3)
  {
    id v18 = [(MBCKRestoreFileEngine *)self restoreLogger];
    [v18 flush];

    v19 = [(MBCKEngine *)self cache];
    unint64_t v20 = [(MBCKRestoreFileEngine *)self restoreState];
    v21 = [(MBCKRestoreFileEngine *)self file];
    v22 = [v19 setRestoreState:v20 forFile:v21];

    if (v22)
    {
      v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v22;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "Failed to set state in cache transaction: %@", buf, 0xCu);
        _MBLog();
      }
    }
    else if ([(MBCKEngine *)self isFinished] {
           && (id)[(MBCKRestoreFileEngine *)self restoreState] == (id)8)
    }
    {
      [(MBCKRestoreFileEngine *)self _decrementSignatureRetainCount];
    }
  }
  _Block_object_dispose(&v32, 8);
}

- (void)makeStateTransition
{
  [(MBCKRestoreFileEngine *)self _handleStateTransition];
  v4.receiver = self;
  v4.super_class = (Class)MBCKRestoreFileEngine;
  [(MBCKEngine *)&v4 makeStateTransition];
}

- (BOOL)setUpWithError:(id *)a3
{
  unsigned int v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    BOOL v6 = [(MBCKRestoreFileEngine *)self file];
    *(_DWORD *)buf = 138412290;
    objc_super v40 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Setting up for restore of file %@", buf, 0xCu);

    uint64_t v34 = [(MBCKRestoreFileEngine *)self file];
    _MBLog();
  }
  v36.receiver = self;
  v36.super_class = (Class)MBCKRestoreFileEngine;
  if ([(MBCKEngine *)&v36 setUpWithError:a3])
  {
    v7 = [(MBCKEngine *)self cache];
    uint64_t v8 = [(MBCKRestoreFileEngine *)self restoreType];
    v9 = [(MBCKRestoreFileEngine *)self file];
    id v10 = [v7 setRestoreType:v8 forFile:v9];

    id v11 = [(MBCKRestoreFileEngine *)self file];
    id v12 = [v11 absolutePath];

    if (v12)
    {
      __int16 v13 = +[NSFileManager defaultManager];
      objc_super v14 = [(MBCKRestoreFileEngine *)self destinationPath];
      v15 = [v14 stringByDeletingLastPathComponent];

      if ([v13 fileExistsAtPath:v15])
      {
        BOOL v16 = 1;
LABEL_23:

        goto LABEL_24;
      }
      v19 = [(MBCKRestoreFileEngine *)self file];
      unsigned int v20 = [v19 userID];
      if (v20 == MBMobileUID())
      {
        v21 = [(MBCKRestoreFileEngine *)self file];
        unsigned int v22 = [v21 groupID];
        int v23 = MBMobileUID();

        if (v22 == v23)
        {
LABEL_19:
          v37[0] = NSFileOwnerAccountID;
          id v26 = [(MBCKRestoreFileEngine *)self file];
          v27 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v26 userID]);
          v38[0] = v27;
          v37[1] = NSFileGroupOwnerAccountID;
          v28 = [(MBCKRestoreFileEngine *)self file];
          v29 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v28 groupID]);
          v38[1] = v29;
          v30 = +[NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];

          unsigned __int8 v31 = [v13 createDirectoryAtPath:v15 withIntermediateDirectories:1 attributes:v30 error:a3];
          BOOL v16 = v31;
          if (a3 && (v31 & 1) == 0)
          {
            uint64_t v32 = [(MBCKRestoreFileEngine *)self destinationPath];
            *a3 = +[MBError errorWithCode:100, v15, @"Error creating parent path for file %@", v32 path format];
          }
          goto LABEL_23;
        }
      }
      else
      {
      }
      v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        id v25 = [(MBCKRestoreFileEngine *)self file];
        *(_DWORD *)buf = 138412290;
        objc_super v40 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Creating parent directory (possibly skipped tld) for %@", buf, 0xCu);

        uint64_t v34 = [(MBCKRestoreFileEngine *)self file];
        _MBLog();
      }
      goto LABEL_19;
    }
    uint64_t v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      id v18 = [(MBCKRestoreFileEngine *)self file];
      *(_DWORD *)buf = 138412290;
      objc_super v40 = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Can't restore a file without an absolute path: %@", buf, 0xCu);

      char v35 = [(MBCKRestoreFileEngine *)self file];
      _MBLog();
    }
    if (a3)
    {
      __int16 v13 = [(MBCKRestoreFileEngine *)self file];
      +[MBError errorWithCode:205, @"File does not have an absolute path: %@", v13 format];
      BOOL v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_24:

      return v16;
    }
  }
  return 0;
}

- (BOOL)downloadWithError:(id *)a3
{
  unsigned int v5 = [(MBCKRestoreFileEngine *)self file];
  unsigned __int8 v6 = [v5 downloaded];

  if (v6) {
    return 1;
  }
  uint64_t v8 = [(MBCKEngine *)self ckOperationTracker];
  if (!v8) {
    __assert_rtn("-[MBCKRestoreFileEngine downloadWithError:]", "MBCKRestoreFileEngine.m", 290, "tracker");
  }
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [(MBCKRestoreFileEngine *)self file];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Downloading file %@", (uint8_t *)&buf, 0xCu);

    BOOL v16 = [(MBCKRestoreFileEngine *)self file];
    _MBLog();
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v21 = 0x3032000000;
  unsigned int v22 = sub_10011D4A0;
  int v23 = sub_10011D4B0;
  id v24 = 0;
  dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
  id v12 = [(MBCKRestoreFileEngine *)self file];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10011D4B8;
  v17[3] = &unk_100410FC8;
  p_long long buf = &buf;
  __int16 v13 = v11;
  id v18 = v13;
  [v12 downloadContentsWithOperationTracker:v8 completion:v17];

  dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  objc_super v14 = *(void **)(*((void *)&buf + 1) + 40);
  BOOL v7 = v14 == 0;
  if (a3 && v14) {
    *a3 = v14;
  }

  _Block_object_dispose(&buf, 8);
  return v7;
}

- (BOOL)restoreAssetWithError:(id *)a3
{
  unsigned int v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int8 v6 = [(MBCKRestoreFileEngine *)self file];
    *(_DWORD *)long long buf = 138412290;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Restoring asset for file %@", buf, 0xCu);

    BOOL v16 = [(MBCKRestoreFileEngine *)self file];
    _MBLog();
  }
  uint64_t v7 = [(MBCKEngine *)self ckOperationTracker];
  if (!v7) {
    __assert_rtn("-[MBCKRestoreFileEngine restoreAssetWithError:]", "MBCKRestoreFileEngine.m", 316, "tracker");
  }
  uint64_t v8 = (void *)v7;
  v9 = [(MBCKRestoreFileEngine *)self file];
  id v10 = [(MBCKRestoreFileEngine *)self destinationPath];
  dispatch_semaphore_t v11 = [(MBCKRestoreFileEngine *)self restoreLogger];
  id v12 = [(MBCKEngine *)self cache];
  __int16 v13 = [(MBCKEngine *)self device];
  unsigned __int8 v14 = [v9 restoreAssetWithOperationTracker:v8 destination:v10 logger:v11 cache:v12 device:v13 error:a3];

  return v14;
}

- (BOOL)validateWithError:(id *)a3
{
  if (!MBIsInternalInstall()) {
    return 1;
  }
  unsigned int v5 = [(MBCKRestoreFileEngine *)self file];
  unsigned __int8 v6 = [(MBCKRestoreFileEngine *)self destinationPath];
  unsigned __int8 v7 = [v5 validateSignatureAtDestination:v6 withError:a3];

  return v7;
}

- (BOOL)setExtendedAttributesWithError:(id *)a3
{
  unsigned int v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    unsigned __int8 v6 = [(MBCKRestoreFileEngine *)self file];
    *(_DWORD *)long long buf = 138412290;
    __int16 v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Setting extended attributes for file %@", buf, 0xCu);

    dispatch_semaphore_t v11 = [(MBCKRestoreFileEngine *)self file];
    _MBLog();
  }
  unsigned __int8 v7 = [(MBCKRestoreFileEngine *)self file];
  uint64_t v8 = [(MBCKRestoreFileEngine *)self destinationPath];
  unsigned __int8 v9 = [v7 restoreExtendedAttributesToDestination:v8 withError:a3];

  return v9;
}

- (BOOL)setAttributesWithError:(id *)a3
{
  unsigned int v5 = [(MBCKRestoreFileEngine *)self file];
  unsigned __int8 v6 = [(MBCKRestoreFileEngine *)self destinationPath];
  LOBYTE(a3) = [v5 restoreAttributesToDestination:v6 error:a3];

  return (char)a3;
}

+ (void)_removeBundleIconNameKeyFrom:(id)a3
{
  id v3 = a3;
  +[NSFileManager defaultManager];
  v36 = id v43 = 0;
  v37 = v3;
  objc_super v4 = [v36 contentsOfDirectoryAtPath:v3 error:&v43];
  id v5 = v43;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v4;
  id v6 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (!v6) {
    goto LABEL_9;
  }
  id v7 = v6;
  uint64_t v8 = *(void *)v40;
  while (2)
  {
    unsigned __int8 v9 = 0;
    id v10 = v5;
    do
    {
      if (*(void *)v40 != v8) {
        objc_enumerationMutation(obj);
      }
      dispatch_semaphore_t v11 = +[NSString stringWithFormat:@"%@/%@", v3, *(void *)(*((void *)&v39 + 1) + 8 * (void)v9)];
      id v38 = v10;
      id v12 = [v36 contentsOfDirectoryAtPath:v11 error:&v38];
      id v5 = v38;

      unsigned __int8 v13 = [v12 containsObject:@"Info.plist"];
      if (v13)
      {
        unsigned __int8 v14 = [v11 stringByAppendingPathComponent:@"Info.plist"];

        if (!v14) {
          goto LABEL_41;
        }
        v15 = +[NSMutableDictionary dictionaryWithContentsOfFile:v14];
        BOOL v16 = v15;
        if (!v15)
        {
          uint64_t v17 = MBGetDefaultLog();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v45 = v14;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Unable to read %@ and determine if Info.plist modification is necessary", buf, 0xCu);
            _MBLog();
          }
          goto LABEL_49;
        }
        uint64_t v17 = [v15 objectForKeyedSubscript:@"CFBundleIcons"];
        if (v17)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            uint64_t v17 = 0;
          }
        }
        id v18 = [v17 objectForKeyedSubscript:@"CFBundlePrimaryIcon"];
        if (v18)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            id v18 = 0;
          }
        }
        v19 = [v18 objectForKeyedSubscript:@"CFBundleIconFiles"];
        if (v19)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            v19 = 0;
          }
        }
        unsigned int v20 = [v16 objectForKeyedSubscript:@"CFBundleIcons~ipad"];
        if (v20)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            unsigned int v20 = 0;
          }
        }
        v33 = v20;
        uint64_t v21 = [v20 objectForKeyedSubscript:@"CFBundlePrimaryIcon"];
        if (v21)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            uint64_t v21 = 0;
          }
        }
        unsigned int v22 = [v21 objectForKeyedSubscript:@"CFBundleIconFiles"];
        uint64_t v34 = v19;
        if (v22)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            unsigned int v22 = 0;
          }
        }
        int v23 = [v18 allKeys];
        unsigned int v24 = [v23 containsObject:@"CFBundleIconName"];
        if (v24)
        {
          id v25 = [v34 count];

          if (!v25)
          {
            unsigned int v24 = 0;
LABEL_36:
            v28 = [v21 allKeys];
            if ([v28 containsObject:@"CFBundleIconName"])
            {
              id v29 = [v22 count];

              if (v29)
              {
                v30 = MBGetDefaultLog();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Info.plist modification is necessary because 'CFBundleIconName' key exists while 'CFBundleIconFiles' items also exist under 'CFBundleIcons~ipad'", buf, 2u);
                  _MBLog();
                }

                unsigned __int8 v31 = [v16 objectForKeyedSubscript:@"CFBundleIcons~ipad"];
                uint64_t v32 = [v31 objectForKeyedSubscript:@"CFBundlePrimaryIcon"];
                [v32 removeObjectForKey:@"CFBundleIconName"];

                goto LABEL_47;
              }
            }
            else
            {
            }
            if (!v24)
            {
LABEL_48:

LABEL_49:
              goto LABEL_50;
            }
LABEL_47:
            [v16 writeToFile:v14 atomically:1];
            goto LABEL_48;
          }
          id v26 = MBGetDefaultLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Info.plist modification is necessary because 'CFBundleIconName' key exists while 'CFBundleIconFiles' items also exist under 'CFBundleIcons'", buf, 2u);
            _MBLog();
          }

          int v23 = [v16 objectForKeyedSubscript:@"CFBundleIcons"];
          v27 = [v23 objectForKeyedSubscript:@"CFBundlePrimaryIcon"];
          [v27 removeObjectForKey:@"CFBundleIconName"];
        }
        goto LABEL_36;
      }

      unsigned __int8 v9 = (char *)v9 + 1;
      id v10 = v5;
    }
    while (v7 != v9);
    id v7 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_9:

LABEL_41:
  unsigned __int8 v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Unable to locate App Placeholder Info.plist", buf, 2u);
    _MBLog();
  }
LABEL_50:
}

- (BOOL)_restoreLegacyZippedAppPlaceholderWithError:(id *)a3
{
  id v5 = [(MBCKRestoreFileEngine *)self destinationPath];
  id v6 = [v5 stringByDeletingLastPathComponent];
  id v30 = 0;
  unsigned __int8 v7 = +[MBApp unzipPlaceholderDomainZipFile:v5 intoDirectory:v6 error:&v30];
  id v8 = v30;

  unsigned __int8 v9 = MBGetDefaultLog();
  id v10 = v9;
  if (v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      dispatch_semaphore_t v11 = [(MBCKRestoreFileEngine *)self file];
      id v12 = [v11 relativePath];
      *(_DWORD *)long long buf = 138412290;
      uint64_t v32 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Placeholder: unzipped %@", buf, 0xCu);

      unsigned __int8 v13 = [(MBCKRestoreFileEngine *)self file];
      v27 = [v13 relativePath];
      _MBLog();
    }
    unsigned __int8 v14 = objc_opt_class();
    v15 = [v5 stringByDeletingLastPathComponent];
    [v14 _removeBundleIconNameKeyFrom:v15];

    BOOL v16 = [(MBCKRestoreFileEngine *)self file];
    uint64_t v17 = [v5 stringByDeletingLastPathComponent];
    uint64_t v18 = MBMobileUID();
    id v29 = v8;
    unsigned __int8 v19 = [v16 restoreOwnershipToDestination:v17 withUserID:v18 withGroupID:MBMobileUID() withError:&v29];
    id v20 = v29;

    if (v19)
    {
      BOOL v21 = 1;
LABEL_16:
      id v8 = v20;
      goto LABEL_17;
    }
    id v25 = MBGetDefaultLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v32 = v5;
      __int16 v33 = 2112;
      id v34 = v20;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "Placeholder: Unable to restore as mobile:mobile: %@ %@", buf, 0x16u);
      _MBLog();
    }

    if (!a3)
    {
      BOOL v21 = 0;
      goto LABEL_16;
    }
    id v8 = v20;
    goto LABEL_14;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    unsigned int v22 = [(MBCKRestoreFileEngine *)self file];
    int v23 = [v22 relativePath];
    *(_DWORD *)long long buf = 138412546;
    uint64_t v32 = v23;
    __int16 v33 = 2112;
    id v34 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Placeholder: Unable to unzip %@ %@", buf, 0x16u);

    unsigned int v24 = [(MBCKRestoreFileEngine *)self file];
    v28 = [v24 relativePath];
    _MBLog();
  }
  if (a3)
  {
LABEL_14:
    id v8 = v8;
    BOOL v21 = 0;
    *a3 = v8;
    goto LABEL_17;
  }
  BOOL v21 = 0;
LABEL_17:

  return v21;
}

- (BOOL)setProtectionClassWithError:(id *)a3
{
  uint64_t v5 = [(MBCKEngine *)self serviceAccount];
  if (!v5) {
    __assert_rtn("-[MBCKRestoreFileEngine setProtectionClassWithError:]", "MBCKRestoreFileEngine.m", 437, "serviceAccount");
  }
  id v6 = (void *)v5;
  unsigned __int8 v7 = [(MBEngine *)self debugContext];
  unsigned int v8 = [v7 isFlagSet:@"RestoreShouldSkipDecryption"];

  if (!v8)
  {
    dispatch_semaphore_t v11 = [(MBCKRestoreFileEngine *)self file];
    id v12 = [v11 domain];

    if ([v12 isPlaceholderAppDomain])
    {
      unsigned __int8 v13 = [(MBCKRestoreFileEngine *)self file];
      unsigned __int8 v14 = [v13 relativePath];

      v15 = [v12 containerID];
      BOOL v16 = [v15 stringByAppendingPathExtension:@"ipa"];
      unsigned int v17 = [v14 isEqualToString:v16];

      if (v17)
      {
        uint64_t v18 = MBGetDefaultLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          unsigned __int8 v19 = [(MBCKRestoreFileEngine *)self file];
          id v20 = [v19 absolutePath];
          *(_DWORD *)long long buf = 138412290;
          v36[0] = v20;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Placeholder: left in place at %@", buf, 0xCu);

          BOOL v21 = [(MBCKRestoreFileEngine *)self file];
          __int16 v33 = [v21 absolutePath];
          _MBLog();
        }
LABEL_18:
        unsigned __int8 v10 = 1;
        goto LABEL_19;
      }
      unsigned int v22 = [v15 stringByAppendingPathExtension:@"zip"];
      unsigned int v23 = [v14 isEqualToString:v22];

      if (v23)
      {
        unsigned __int8 v10 = [(MBCKRestoreFileEngine *)self _restoreLegacyZippedAppPlaceholderWithError:a3];
LABEL_19:

LABEL_20:
        goto LABEL_21;
      }
    }
    if ([(MBCKRestoreFileEngine *)self shouldSetProtectionClass])
    {
      unsigned int v24 = [(MBCKRestoreFileEngine *)self file];
      unsigned int v25 = [v24 protectionClass];

      id v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        v27 = [(MBCKRestoreFileEngine *)self file];
        *(_DWORD *)long long buf = 67109378;
        LODWORD(v36[0]) = v25;
        WORD2(v36[0]) = 2112;
        *(void *)((char *)v36 + 6) = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Setting protection class %d for file at %@", buf, 0x12u);

        [(MBCKRestoreFileEngine *)self file];
        v34 = uint64_t v32 = v25;
        _MBLog();
      }
      BOOL v28 = self->_restoreType == 1;
      unsigned __int8 v14 = [(MBCKRestoreFileEngine *)self file];
      v15 = [(MBCKRestoreFileEngine *)self destinationPath];
      id v29 = [(MBCKRestoreFileEngine *)self restoreLogger];
      unsigned __int8 v10 = [v14 restoreProtectionClassToDestination:v15 unspecifiedDirectoryProtectionClass:(4 * v28) logger:v29 error:a3];

      goto LABEL_19;
    }
    unsigned __int8 v14 = MBGetDefaultLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unsigned __int8 v10 = 1;
      goto LABEL_20;
    }
    id v30 = [(MBCKRestoreFileEngine *)self file];
    *(_DWORD *)long long buf = 138412290;
    v36[0] = v30;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Skipped setting protection class for file %@", buf, 0xCu);

    v15 = [(MBCKRestoreFileEngine *)self file];
    _MBLog();
    goto LABEL_18;
  }
  unsigned __int8 v9 = [(MBEngine *)self debugContext];
  [v9 setFlag:@"RestoreWillSkipDecryption"];

  unsigned __int8 v10 = 1;
LABEL_21:

  return v10;
}

- (void)_decrementSignatureRetainCount
{
  id v3 = [(MBCKRestoreFileEngine *)self file];
  if (!v3) {
    __assert_rtn("-[MBCKRestoreFileEngine _decrementSignatureRetainCount]", "MBCKRestoreFileEngine.m", 480, "file");
  }
  objc_super v4 = v3;
  uint64_t v5 = [v3 signature];
  id v6 = [v4 volumeType];
  if (v5)
  {
    id v7 = v6;
    unsigned int v8 = [(MBCKEngine *)self cache];
    id v30 = 0;
    unsigned __int8 v9 = [v8 decrementRetainCountForSignature:v5 volumeType:v7 error:&v30];
    unsigned __int8 v10 = v30;

    if (!v9 && v10)
    {
      dispatch_semaphore_t v11 = [v5 base64EncodedStringWithOptions:0];
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412802;
        uint64_t v32 = v11;
        __int16 v33 = 2112;
        id v34 = v4;
        __int16 v35 = 2112;
        objc_super v36 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to decrement retain count for signature %@ %@ %@", buf, 0x20u);
        _MBLog();
      }
      goto LABEL_38;
    }
    if ([v9 unsignedLongLongValue])
    {
LABEL_39:

LABEL_40:
      goto LABEL_41;
    }
    unsigned __int8 v13 = [(MBCKEngine *)self cache];
    dispatch_semaphore_t v11 = [v13 fileAssetMetadataForSignature:v5 volumeType:v7];

    if (!v11)
    {
      unsigned __int8 v14 = MBGetDefaultLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to fetch file asset metadata for signature", buf, 2u);
        _MBLog();
      }
    }
    id v12 = +[NSFileManager defaultManager];
    v15 = [v11 decodedAssetPath];
    BOOL v16 = [v11 stashedAssetPath];
    unsigned int v17 = MBGetDefaultLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      id v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Removing asset with retain count of 0 %@ %@", buf, 0x16u);
      _MBLog();
    }

    if (!v15)
    {
      unsigned __int8 v19 = v10;
      goto LABEL_27;
    }
    id v29 = v10;
    unsigned __int8 v18 = [v12 removeItemAtPath:v15 error:&v29];
    unsigned __int8 v19 = v29;

    if (v18) {
      goto LABEL_27;
    }
    id v20 = [v19 domain];
    if ([v20 isEqualToString:NSCocoaErrorDomain])
    {
      id v21 = [v19 code];

      if (v21 == (id)4) {
        goto LABEL_27;
      }
    }
    else
    {
    }
    unsigned int v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v32 = v15;
      __int16 v33 = 2112;
      id v34 = v19;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Failed to remove decoded asset at path: %@: %@", buf, 0x16u);
      _MBLog();
    }

LABEL_27:
    if (v16)
    {
      id v28 = 0;
      unsigned __int8 v23 = [v12 removeItemAtPath:v16 error:&v28];
      unsigned int v24 = v28;
      unsigned __int8 v10 = v24;
      if ((v23 & 1) == 0)
      {
        unsigned int v25 = [v24 domain];
        if ([v25 isEqualToString:NSCocoaErrorDomain])
        {
          id v26 = [v10 code];

          if (v26 == (id)4) {
            goto LABEL_37;
          }
        }
        else
        {
        }
        v27 = MBGetDefaultLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412546;
          uint64_t v32 = v16;
          __int16 v33 = 2112;
          id v34 = v10;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Failed to remove stashed asset at path: %@: %@", buf, 0x16u);
          _MBLog();
        }
      }
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
LABEL_37:

LABEL_38:
    goto LABEL_39;
  }
  if ([v4 size])
  {
    unsigned __int8 v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v32 = v4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "RestoreFileEngine: Found a file with non-zero size and no signature: %@", buf, 0xCu);
      _MBLog();
    }
    goto LABEL_40;
  }
LABEL_41:
}

- (unint64_t)restoreState
{
  return self->_restoreState;
}

- (void)setRestoreState:(unint64_t)a3
{
  self->_restoreState = a3;
}

- (MBCKFile)file
{
  return self->_file;
}

- (void)setFile:(id)a3
{
}

- (NSString)destinationPath
{
  return self->_destinationPath;
}

- (MBRestoreOperationLogger)restoreLogger
{
  return self->_restoreLogger;
}

- (void)setRestoreLogger:(id)a3
{
}

- (BOOL)shouldSetProtectionClass
{
  return self->_shouldSetProtectionClass;
}

- (void)setShouldSetProtectionClass:(BOOL)a3
{
  self->_shouldSetProtectionClass = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restoreLogger, 0);
  objc_storeStrong((id *)&self->_destinationPath, 0);
  objc_storeStrong((id *)&self->_file, 0);
}

@end