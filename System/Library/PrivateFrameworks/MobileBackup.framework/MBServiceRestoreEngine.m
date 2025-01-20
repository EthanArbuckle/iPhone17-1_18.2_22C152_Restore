@interface MBServiceRestoreEngine
+ (void)initialize;
- (BOOL)_freeSpaceAvailableForSize:(unint64_t)a3 atURL:(id)a4 error:(id *)a5;
- (BOOL)isRestoringToSameDevice;
- (MBKeyBag)lastKeyBag;
- (MBServiceRestoreEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4;
- (MBServiceRestoreMode)mode;
- (NSData)secret;
- (NSDictionary)keybagsByID;
- (id)_annotate;
- (id)_baseRestorePathForDomain:(id)a3;
- (id)_buildRestoreFilesTable;
- (id)_decryptFile:(id)a3 restorePath:(id)a4;
- (id)_drainBatchPipeline;
- (id)_encryptedRestorePathForFile:(id)a3;
- (id)_finalRestorePathForFile:(id)a3;
- (id)_findBackupAndSnapshot;
- (id)_findDependentContainersWithAddedFiles:(BOOL *)a3 waitingForFiles:(BOOL *)a4;
- (id)_findFilesToRestore;
- (id)_pipelineRestoringBatch:(id)a3 snapshotID:(unint64_t)a4;
- (id)_processCompletedBatch:(id)a3;
- (id)_propertiesPath;
- (id)_refreshCache;
- (id)_restore;
- (id)_restoreFile:(id)a3 fromSnapshot:(id)a4 withBatch:(id)a5 restoringDirectories:(BOOL)a6;
- (id)_restoreFileForFile:(id)a3;
- (id)_restoreFilesFromSnapshot:(id)a3 restoringDirectories:(BOOL)a4;
- (id)_restoreFilesFromSnapshots;
- (id)_restoreParentDirectoriesOfFile:(id)a3 deleted:(BOOL *)a4;
- (id)_restorePathForFile:(id)a3;
- (id)_restorePlaceholderEntitlements;
- (id)_retry;
- (id)_setupEncryption;
- (id)_tryRestoring;
- (id)_validateAppInstallation;
- (id)_verifyFreeSpace;
- (id)chunkStore:(id)a3 pathForItemID:(unint64_t)a4;
- (id)cleanupAfterError:(id)a3;
- (id)domainForName:(id)a3 containerID:(id)a4 domainManager:(id)a5;
- (id)restoringBundleID;
- (id)run;
- (id)setup;
- (int)engineMode;
- (int)restoreType;
- (void)_abortBatchPipeline;
- (void)_checkForItemErrorsInCompletedBatch:(id)a3;
- (void)dealloc;
- (void)setKeybagsByID:(id)a3;
@end

@implementation MBServiceRestoreEngine

+ (void)initialize
{
  if (!qword_100482688)
  {
    qword_100482688 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
    qword_100482690 = (uint64_t)objc_alloc_init((Class)NSCondition);
  }
}

- (MBServiceRestoreEngine)initWithSettingsContext:(id)a3 debugContext:(id)a4
{
  id v7 = objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", objc_msgSend(objc_msgSend(a3, "account"), "persona"));
  v11.receiver = self;
  v11.super_class = (Class)MBServiceRestoreEngine;
  v8 = [(MBServiceEngine *)&v11 initWithSettingsContext:a3 debugContext:a4 domainManager:v7];
  v9 = v8;
  if (v8)
  {
    v8->_snapshotIndex = -1;
    v8->_batchSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
    [(MBChunkStoreProgressModel *)[(MBChunkStore *)[(MBServiceEngine *)v9 chunkStore] progressModel] setMaxProgress:0.95];
    [[(MBServiceEngine *)v9 service] setDisableWWAN:1];
    [(MBEngine *)v9 setEncrypted:1];
    [v7 setDelegate:v9];
  }
  else
  {
  }
  return v9;
}

- (void)dealloc
{
  dispatch_release((dispatch_object_t)self->_batchSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)MBServiceRestoreEngine;
  [(MBServiceEngine *)&v3 dealloc];
}

- (int)engineMode
{
  return 2;
}

- (int)restoreType
{
  unsigned int v2 = [(MBServiceRestoreMode *)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] restoreMode] type]- 1;
  if (v2 > 6) {
    return 1;
  }
  else {
    return dword_1003B36C8[v2];
  }
}

- (MBServiceRestoreMode)mode
{
  unsigned int v2 = [(MBServiceEngine *)self settingsContext];
  return [(MBServiceSettingsContext *)v2 restoreMode];
}

- (BOOL)isRestoringToSameDevice
{
  unsigned int v2 = [(MBServiceEngine *)self backupUDID];
  uint64_t v3 = MBDeviceUDID_Legacy();
  return [(NSString *)v2 isEqualToString:v3];
}

- (id)restoringBundleID
{
  unsigned int v2 = [(MBServiceRestoreEngine *)self mode];
  if (![(MBServiceRestoreMode *)v2 isBackgroundApp]) {
    return 0;
  }
  return [(MBServiceRestoreMode *)v2 bundleID];
}

- (MBKeyBag)lastKeyBag
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  keybagsByID = self->_keybagsByID;
  id v4 = [(NSDictionary *)keybagsByID countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(keybagsByID);
        }
        v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (!v6 || [v6 compare:*(void *)(*((void *)&v11 + 1) + 8 * i)] == (id)-1) {
          v6 = v9;
        }
      }
      id v5 = [(NSDictionary *)keybagsByID countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }
  return (MBKeyBag *)[(NSDictionary *)self->_keybagsByID objectForKeyedSubscript:v6];
}

- (id)run
{
  id v3 = [(MBServiceRestoreEngine *)self _restore];
  [(MBServiceRestoreEngine *)self cleanupAfterError:v3];
  if ([(MBEngine *)self isForegroundRestore])
  {
    id v4 = [(MBRestorePolicy *)self->_restorePolicy notifyPluginsEndedRestoreWithEngine:self error:v3];
    if (!v3) {
      id v3 = v4;
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->super._semaphore);
  return v3;
}

- (id)_restore
{
  id v3 = [(MBServiceRestoreEngine *)self setup];
  v8 = v3;
  if (v3)
  {
    id v4 = v3;
    if (+[MBError isError:v3 withCode:0]) {
      return 0;
    }
    else {
      return v4;
    }
  }
  if (![(MBEngine *)self isForegroundRestore]
    || (id result = [(MBRestorePolicy *)self->_restorePolicy notifyPluginsStartingRestoreWithEngine:self]) == 0&& (id result = [(MBRestorePolicy *)self->_restorePolicy notifyPluginsPreparingRestoreWithEngine:self], (v8 = (MBError *)result) == 0))
  {
    while (1)
    {
      while (1)
      {
        v6 = [(MBServiceRestoreEngine *)self _tryRestoring];
        v8 = v6;
        if (v6) {
          break;
        }
        if (![(MBServiceRetryStrategy *)[(MBServiceEngine *)self retryStrategy] shouldRetryAfterError:0 hard:0])
        {
          id result = [(MBServiceRestoreEngine *)self _restorePlaceholderEntitlements];
          v8 = (MBError *)result;
          if (!result)
          {
            id result = [(MBServiceRestoreEngine *)self _annotate];
            v8 = (MBError *)result;
            if (!result)
            {
              id result = [(MBServiceRestoreEngine *)self _validateAppInstallation];
              v8 = (MBError *)result;
              if (!result)
              {
                if (![(MBEngine *)self isForegroundRestore]
                  || (id result = [(MBRestorePolicy *)self->_restorePolicy notifyPluginsEndingRestoreWithEngine:self], (v8 = (MBError *)result) == 0))
                {
                  [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->super._chunkStore progressModel] ended];
                  return 0;
                }
              }
            }
          }
          return result;
        }
LABEL_19:
        id result = [(MBServiceRestoreEngine *)self _retry];
        v8 = (MBError *)result;
        if (result) {
          return result;
        }
      }
      if (!+[MBError isError:v6 withCode:306]
        || ![(MBServiceLockManager *)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] lockManager] reacquireLockWithError:&v8])
      {
        if (+[MBError isError:v8 withCode:300]
          && ![(MBServiceReachabilityMonitor *)[(MBServiceEngine *)self reachability] isInternetReachableViaWiFi])
        {
          v8 = +[MBError errorWithCode:308 error:v8 format:@"Network is unreachable"];
        }
        uint64_t v7 = [(MBServiceEngine *)self retryStrategy];
        if (![(MBServiceRetryStrategy *)v7 shouldRetryAfterError:v8 hard:1]) {
          return v8;
        }
        goto LABEL_19;
      }
      v8 = 0;
    }
  }
  return result;
}

- (id)_tryRestoring
{
  if ([(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isBackgroundApp]
    && [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] wasCancelled])
  {
LABEL_3:
    char v18 = 0;
    unsigned int v3 = [(MBPersona *)[(MBEngine *)self persona] getBooleanValueForKey:@"RandomlyFailBackgroundRestores" keyExists:&v18];
    id v4 = 0;
    if ([(MBServiceRestoreMode *)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] restoreMode] isForeground]|| !v18|| !v3)
    {
      return v4;
    }
    if ((arc4random() & 3) == 0) {
      return 0;
    }
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Simulating random restore error", buf, 2u);
      _MBLog();
    }
    return +[MBError errorWithCode:1 format:@"Simulated random error"];
  }
  else
  {
    for (char i = 1; ; char i = 0)
    {
      char v9 = i;
      id v6 = [(MBServiceEngine *)self acquireLock];
      if (v6) {
        break;
      }
      id v6 = [(MBServiceRestoreEngine *)self _refreshCache];
      if (v6) {
        break;
      }
      id v10 = [(MBServiceRestoreEngine *)self _setupEncryption];
      if (!v10)
      {
        id v4 = [(MBServiceRestoreEngine *)self _findBackupAndSnapshot];
        if (v4) {
          return v4;
        }
        id v4 = [(MBServiceRestoreEngine *)self _findFilesToRestore];
        if (v4) {
          return v4;
        }
        id v4 = [(MBServiceRestoreEngine *)self _verifyFreeSpace];
        if (v4) {
          return v4;
        }
        char v18 = 0;
        while (1)
        {
          id v11 = [(MBServiceRestoreEngine *)self _restoreFilesFromSnapshots];
          if (v11) {
            break;
          }
          char v17 = 0;
          id v6 = [(MBServiceRestoreEngine *)self _findDependentContainersWithAddedFiles:&v18 waitingForFiles:&v17];
          if (v6) {
            return v6;
          }
          char v12 = 0;
          while (v17)
          {
            if ((v12 & 1) == 0)
            {
              long long v13 = MBGetDefaultLog();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
              {
                unint64_t restoreID = self->_restoreID;
                *(_DWORD *)buf = 134217984;
                unint64_t v20 = restoreID;
                _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%lu] Waiting for dependent containers to finish being restored by other apps", buf, 0xCu);
                unint64_t v16 = self->_restoreID;
                _MBLog();
              }
            }
            sleep(0xAu);
            char v17 = 0;
            id v6 = [(MBServiceRestoreEngine *)self _findDependentContainersWithAddedFiles:&v18 waitingForFiles:&v17];
            char v12 = 1;
            if (v6) {
              return v6;
            }
          }
          if (!v18) {
            goto LABEL_3;
          }
        }
        v15 = v11;
        [(MBServiceRestoreEngine *)self _abortBatchPipeline];
        return v15;
      }
      id v4 = v10;
      if (!+[MBError isError:v10 withCode:17]) {
        return v4;
      }
      if ((v9 & 1) == 0)
      {
        return +[MBError errorWithCode:305 format:@"Unable to get keyset- unauthorized error"];
      }
    }
  }
  return v6;
}

- (id)setup
{
  v52.receiver = self;
  v52.super_class = (Class)MBServiceRestoreEngine;
  id result = [(MBServiceEngine *)&v52 setup];
  id v53 = result;
  if (result) {
    return result;
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] setDomainManager:[(MBEngine *)self domainManager]];
  [(MBServiceCache *)[(MBServiceEngine *)self cache] open];
  id v4 = [(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] restoreMode];
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    unint64_t restoreID = self->_restoreID;
    *(_DWORD *)buf = 134217984;
    unint64_t v55 = restoreID;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%lu] Initializing app manager", buf, 0xCu);
    unint64_t v42 = self->_restoreID;
    _MBLog();
  }
  uint64_t v7 = [[MBAppManager alloc] initWithMobileInstallation:[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] mobileInstallation]];
  self->super.super._appManager = v7;
  if (![(MBAppManager *)v7 loadAppsWithPersona:[(MBEngine *)self persona] safeHarbors:1 error:&v53])
  {
    id v24 = v53;
    CFStringRef v25 = @"Error initializing app manager";
    return +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v24, v25, v42);
  }
  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = self->_restoreID;
    *(_DWORD *)buf = 134217984;
    unint64_t v55 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%lu] Creating container domains", buf, 0xCu);
    unint64_t v42 = self->_restoreID;
    _MBLog();
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v10 = [(MBAppManager *)self->super.super._appManager allContainers];
  id v11 = [v10 countByEnumeratingWithState:&v48 objects:v60 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v49;
    do
    {
      for (char i = 0; i != v12; char i = (char *)i + 1)
      {
        if (*(void *)v49 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (([v15 isSystemContainer] & 1) == 0
          && ([v15 isSystemSharedContainer] & 1) == 0)
        {
          -[MBDomainManager addDomain:](self->super.super._domainManager, "addDomain:", [v15 domain]);
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v48 objects:v60 count:16];
    }
    while (v12);
  }
  self->_unint64_t restoreID = [(MBServiceCache *)[(MBServiceEngine *)self cache] restoreIDForMode:v4];
  if ([(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isBackgroundApp])
  {
    unint64_t v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v17 = self->_restoreID;
      char v18 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] errorString];
      v19 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
      *(_DWORD *)buf = 134218498;
      unint64_t v55 = v17;
      __int16 v56 = 2112;
      v57 = v18;
      __int16 v58 = 2112;
      v59 = v19;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%lu] Restoring %@ app: %@", buf, 0x20u);
      unint64_t v20 = self->_restoreID;
      v45 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] errorString];
      v47 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
      unint64_t v43 = v20;
      _MBLog();
    }
    id v21 = [(MBAppManager *)[(MBEngine *)self appManager] containerWithIdentifier:[(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID]];
    if (!v21)
    {
      v44 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
      CFStringRef v23 = @"App placeholder or safe harbor not installed: %@";
      goto LABEL_44;
    }
    v22 = v21;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([v22 isPlaceholder] & 1) == 0
      && ([v22 isSafeHarbor] & 1) == 0)
    {
      v44 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
      CFStringRef v23 = @"Installed app not a placeholder or safe harbor: %@";
LABEL_44:
      uint64_t v34 = 1;
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v34, v23, v44);
    }
  }
  else if ([(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isBackgroundFile])
  {
    v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v27 = self->_restoreID;
      v28 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] path];
      *(_DWORD *)buf = 134218242;
      unint64_t v55 = v27;
      __int16 v56 = 2112;
      v57 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%lu] Restoring file: %@", buf, 0x16u);
      unint64_t v43 = self->_restoreID;
      v45 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] path];
      _MBLog();
    }
  }
  [(MBServiceEngine *)self chunkStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(id)qword_100482690 lock];
    if (objc_msgSend((id)qword_100482688, "containsObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_restoreID)))
    {
      do
        [(id)qword_100482690 wait];
      while ((objc_msgSend((id)qword_100482688, "containsObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_restoreID)) & 1) != 0);
    }
    objc_msgSend((id)qword_100482688, "addObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_restoreID));
    [(id)qword_100482690 unlock];
    [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] setPath:+[NSString stringWithFormat:@"%@.%u", [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] path], self->_restoreID]];
    v29 = +[NSMutableDictionary dictionaryWithDictionary:MBNoCellularCFStreamPropertyOptions()];
    buf[0] = 0;
    unsigned int v30 = [(MBPersona *)[(MBEngine *)self persona] getBooleanValueForKey:@"EnableRestoreBackgroundPriority" keyExists:buf];
    if (buf[0] && v30) {
      [(NSMutableDictionary *)v29 setObject:kCFStreamNetworkServiceTypeBackground forKeyedSubscript:kCFStreamNetworkServiceType];
    }
    [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] setConnectionProperties:v29];
  }
  [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] setDelegate:self];
  [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] open];
  if (![(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isBackgroundApp]
    || ![(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] didFail])
  {
LABEL_46:
    v35 = [MBRestorePolicy alloc];
    v36 = [(MBEngine *)self persona];
    v37 = [(MBEngine *)self appManager];
    v38 = [(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] plugins];
    v39 = [(MBProperties *)[(MBEngine *)self properties] buildVersion];
    unsigned __int8 v40 = [(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] shouldRestoreSystemFiles];
    *(_WORD *)((char *)&v42 + 1) = [(MBEngine *)self restoresPrimaryAccount];
    LOBYTE(v42) = v40;
    self->_restorePolicy = -[MBRestorePolicy initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:](v35, "initWithPersona:enginePolicyProvider:appManager:plugins:serviceRestoreMode:osBuildVersionOfBackup:shouldRestoreSystemFiles:isRestoringPrimaryAccount:shouldCreateMissingIntermediateDirectories:", v36, self, v37, v38, 0, v39, v42);
    signed int v41 = [(MBDebugContext *)self->super.super._debugContext intForName:@"InjectEngineErrorCode"];
    if (!v41) {
      return 0;
    }
    uint64_t v34 = v41;
    CFStringRef v23 = @"Simulated error for debug context";
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", v34, v23, v44);
  }
  if (!objc_msgSend(-[MBAppManager containerWithIdentifier:](self->super.super._appManager, "containerWithIdentifier:", -[MBServiceRestoreMode bundleID](-[MBServiceRestoreEngine mode](self, "mode"), "bundleID")), "isSafeHarbor"))
  {
    if ([(MBAppManager *)self->super.super._appManager createSafeHarborForContainer:+[MBApp appWithBundleID:[(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID]] withPersona:[(MBEngine *)self persona] error:&v53])
    {
      goto LABEL_46;
    }
    id v24 = v53;
    CFStringRef v25 = @"Error creating safe harbor for failed app";
    return +[MBError errorWithCode:error:format:](MBError, "errorWithCode:error:format:", 1, v24, v25, v42);
  }
  v31 = MBGetDefaultLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v32 = self->_restoreID;
    v33 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
    *(_DWORD *)buf = 134218242;
    unint64_t v55 = v32;
    __int16 v56 = 2112;
    v57 = v33;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "[%lu] Failed app already restored to a safe harbor: %@", buf, 0x16u);
    unint64_t v42 = self->_restoreID;
    v46 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
    _MBLog();
  }
  return +[MBError errorWithCode:0, @"Failed app already restored: %@", [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID] format];
}

- (id)cleanupAfterError:(id)a3
{
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t restoreID = self->_restoreID;
    *(_DWORD *)buf = 134218242;
    unint64_t v48 = restoreID;
    __int16 v49 = 2112;
    id v50 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%lu] Cleaning up after error: %@", buf, 0x16u);
    unint64_t v34 = self->_restoreID;
    id v37 = a3;
    _MBLog();
  }
  v46.receiver = self;
  v46.super_class = (Class)MBServiceRestoreEngine;
  -[MBServiceEngine cleanupAfterError:](&v46, "cleanupAfterError:", a3, v34, v37);
  id v40 = a3;
  if (a3)
  {
    if ([(MBEngine *)self isForegroundRestore])
    {
      objc_msgSend(-[MBService lockForBackupUDID:](-[MBServiceEngine service](self, "service"), "lockForBackupUDID:", -[MBServiceEngine backupUDID](self, "backupUDID")), "setState:", 2);
      v8 = objc_alloc_init(MBSRestoreCompletionInfo);
      -[MBSRestoreCompletionInfo setErrorCode:](v8, "setErrorCode:", [a3 code]);
      -[MBSRestoreCompletionInfo setErrorDescription:](v8, "setErrorDescription:", [a3 localizedDescription]);
      uint64_t v45 = 0;
      if (![[(MBServiceEngine *)self service] restoreCompleteWithInfo:v8 backupUDID:[(MBServiceEngine *)self backupUDID] error:&v45])
      {
        unint64_t v9 = MBGetDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = +[MBError descriptionForError:v45];
          *(_DWORD *)buf = 138412290;
          unint64_t v48 = (unint64_t)v10;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Error sending restore error to server: %@", buf, 0xCu);
          id v35 = +[MBError descriptionForError:v45];
          _MBLog();
        }
      }
    }
    [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] close];
    if (+[MBError isTransientError:a3]) {
      goto LABEL_12;
    }
  }
  else
  {
    [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] close];
  }
  [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] remove];
LABEL_12:
  [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] destroy];
  [(id)qword_100482690 lock];
  objc_msgSend((id)qword_100482688, "removeObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", self->_restoreID));
  [(id)qword_100482690 unlock];
  [(id)qword_100482690 broadcast];
  if (![(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isBackgroundApp]) {
    goto LABEL_37;
  }
  id v11 = a3;
  if ([(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] wasCancelled]) {
    goto LABEL_16;
  }
  if (!a3) {
    goto LABEL_41;
  }
  if ((+[MBError isTransientError:a3] & 1) == 0)
  {
LABEL_16:
    id v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = self->_restoreID;
      *(_DWORD *)buf = 134217984;
      unint64_t v48 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%lu] Removing any partially restored app data", buf, 0xCu);
      id v35 = self->_restoreID;
      _MBLog();
    }
    id v14 = +[MBDomain nameWithAppID:[(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID]];
    id v15 = [(MBDomainManager *)[(MBEngine *)self domainManager] domainForName:v14];
    if (!v15) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBServiceRestoreEngine.m", 469, @"Domain not found: %@", v14 object file lineNumber description];
    }
    if (([v15 isUninstalledAppDomain] & 1) == 0)
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v16 = [v15 relativePathsToBackup];
      id v17 = [v16 countByEnumeratingWithState:&v41 objects:v53 count:16];
      if (v17)
      {
        id v18 = v17;
        uint64_t v19 = *(void *)v42;
        do
        {
          for (char i = 0; i != v18; char i = (char *)i + 1)
          {
            if (*(void *)v42 != v19) {
              objc_enumerationMutation(v16);
            }
            id v21 = objc_msgSend(-[MBServiceRestoreEngine _baseRestorePathForDomain:](self, "_baseRestorePathForDomain:", v15, v35, v38, v39), "stringByAppendingPathComponent:", *(void *)(*((void *)&v41 + 1) + 8 * i));
            v22 = MBGetDefaultLog();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              unint64_t v23 = self->_restoreID;
              *(_DWORD *)buf = 134218242;
              unint64_t v48 = v23;
              __int16 v49 = 2112;
              id v50 = v21;
              _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%lu] Removing %@", buf, 0x16u);
              unint64_t v36 = self->_restoreID;
              id v38 = v21;
              _MBLog();
            }
            uint64_t v45 = 0;
            if (![+[NSFileManager defaultManager] removeItemAtPath:v21 error:&v45])
            {
              unsigned int v24 = +[MBError codeForNSError:v45];
              CFStringRef v25 = MBGetDefaultLog();
              v26 = v25;
              if (v24 == 4)
              {
                if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO)) {
                  continue;
                }
                unint64_t v27 = self->_restoreID;
                *(_DWORD *)buf = 134218242;
                unint64_t v48 = v27;
                __int16 v49 = 2112;
                id v50 = v21;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%lu] Not found: %@", buf, 0x16u);
                id v35 = self->_restoreID;
                id v38 = v21;
              }
              else
              {
                if (!os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT)) {
                  continue;
                }
                unint64_t v28 = self->_restoreID;
                id v29 = +[MBError descriptionForError:v45];
                *(_DWORD *)buf = 134218498;
                unint64_t v48 = v28;
                __int16 v49 = 2112;
                id v50 = v21;
                __int16 v51 = 2112;
                id v52 = v29;
                _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%lu] Error removing %@: %@", buf, 0x20u);
                unint64_t v30 = self->_restoreID;
                id v38 = v21;
                id v39 = +[MBError descriptionForError:v45];
                id v35 = (id)v30;
              }
              _MBLog();
            }
          }
          id v18 = [v16 countByEnumeratingWithState:&v41 objects:v53 count:16];
        }
        while (v18);
      }
    }
LABEL_37:
    id v11 = v40;
    if (v40) {
      goto LABEL_38;
    }
LABEL_41:
    [(MBServiceCache *)[(MBServiceEngine *)self cache] close];
    [+[NSFileManager defaultManager] removeItemAtPath:[(MBServiceRestoreEngine *)self _propertiesPath] error:0];
    return 0;
  }
LABEL_38:
  if ((+[MBError isTransientError:](MBError, "isTransientError:", v11, v35) & 1) == 0)
  {
    unsigned int v31 = [(MBServiceRestoreMode *)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] restoreMode] isForeground];
    unint64_t v32 = [(MBServiceEngine *)self cache];
    if (v31) {
      [(MBServiceCache *)v32 setRestoreBackupUDID:0];
    }
    else {
      [(MBServiceCache *)v32 setState:4 forRestoreID:self->_restoreID];
    }
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] close];
  return 0;
}

- (id)_refreshCache
{
  id v6 = 0;
  unsigned int v3 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isForeground];
  id result = 0;
  if (v3)
  {
    if (![(MBServiceCache *)[(MBServiceEngine *)self cache] isRefreshNeededForBackupUDID:[(MBServiceEngine *)self backupUDID]])return 0; {
    if ([(MBServiceCache *)[(MBServiceEngine *)self cache] refreshForBackupUDID:[(MBServiceEngine *)self backupUDID] service:[(MBServiceEngine *)self service] deleted:0 error:&v6])
    }
    {
      if ([(MBDebugContext *)self->super.super._debugContext isFlagSet:@"VerifyCache"])[(MBServiceCache *)[(MBServiceEngine *)self cache] verifyBackupUDID:[(MBServiceEngine *)self backupUDID] service:[(MBServiceEngine *)self service]]; {
      if ([(MBDebugContext *)self->super.super._debugContext isFlagSet:@"VerifyCache"])[(MBServiceCache *)[(MBServiceEngine *)self cache] verifyBackupUDID:[(MBServiceEngine *)self backupUDID] service:[(MBServiceEngine *)self service]];
      }
      return 0;
    }
    id v5 = [v6 code];
    return +[MBError errorWithCode:v5 error:v6 format:@"Error refreshing cache"];
  }
  return result;
}

- (id)_setupEncryption
{
  id result = 0;
  id v49 = 0;
  if (self->_keybagsByID) {
    return result;
  }
  if (![(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isForeground])
  {
    return +[MBError errorWithCode:208 format:@"Restore keybag not loaded yet"];
  }
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    unint64_t restoreID = self->_restoreID;
    *(_DWORD *)buf = 134217984;
    unint64_t v52 = restoreID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%lu] Getting keys from service", buf, 0xCu);
    unint64_t v35 = self->_restoreID;
    _MBLog();
  }
  id v6 = [(MBServiceEncryptionManager *)[(MBServiceEngine *)self encryptionManager] keysetForBackupUDID:[(MBServiceEngine *)self backupUDID] lastModified:0 userInitiated:1 error:&v49];
  if (!v6)
  {
    uint64_t v31 = (uint64_t)[v49 code];
    id v32 = v49;
    CFStringRef v33 = @"Error getting keys from service";
    return +[MBError errorWithCode:v31 error:v32 format:v33];
  }
  uint64_t v7 = v6;
  if (!objc_msgSend(objc_msgSend(v6, "keys"), "count"))
  {
    CFStringRef v34 = @"No keys found in backup";
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, v34, v36);
  }
  v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t v9 = self->_restoreID;
    *(_DWORD *)buf = 134217984;
    unint64_t v52 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%lu] Finding secret and keybag(s) in keys", buf, 0xCu);
    unint64_t v36 = self->_restoreID;
    _MBLog();
  }
  id obj = +[NSMutableDictionary dictionary];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v10 = [v7 keys];
  id v11 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (!v11) {
    goto LABEL_45;
  }
  id v12 = v11;
  id v39 = 0;
  uint64_t v13 = *(void *)v46;
  do
  {
    for (char i = 0; i != v12; char i = (char *)i + 1)
    {
      if (*(void *)v46 != v13) {
        objc_enumerationMutation(v10);
      }
      id v15 = *(void **)(*((void *)&v45 + 1) + 8 * i);
      if ([v15 keyID] == 1)
      {
        if (![v15 keyData])
        {
          CFStringRef v34 = @"Secret key has no data";
          return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, v34, v36);
        }
        id v39 = [v15 keyData];
      }
      else
      {
        if ([v15 keyID] < 2) {
          return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, @"Invalid key ID: %lu", [v15 keyID]);
        }
        if (![v15 keyData])
        {
          CFStringRef v34 = @"Bag key has no data";
          return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, v34, v36);
        }
        objc_msgSend(obj, "setObject:forKeyedSubscript:", objc_msgSend(v15, "keyData"), +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v15, "keyID")));
      }
    }
    id v12 = [v10 countByEnumeratingWithState:&v45 objects:v55 count:16];
  }
  while (v12);
  id v16 = ATClientController_ptr;
  if (!v39)
  {
LABEL_45:
    CFStringRef v34 = @"No secret key found";
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, v34, v36);
  }
  if (![obj count])
  {
    CFStringRef v34 = @"No bag key found";
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, v34, v36);
  }
  id v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    unint64_t v18 = self->_restoreID;
    id v19 = [obj count];
    *(_DWORD *)buf = 134218240;
    unint64_t v52 = v18;
    __int16 v53 = 2048;
    id v54 = v19;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "[%lu] Unlocking %lu keybags", buf, 0x16u);
    unint64_t v36 = self->_restoreID;
    id v38 = [obj count];
    id v16 = ATClientController_ptr;
    _MBLog();
  }
  id v20 = objc_msgSend(v16[124], "dictionary", v36, v38);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v21 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (!v21) {
    goto LABEL_35;
  }
  id v22 = v21;
  uint64_t v23 = *(void *)v42;
  while (2)
  {
    uint64_t v24 = 0;
    while (2)
    {
      if (*(void *)v42 != v23) {
        objc_enumerationMutation(obj);
      }
      uint64_t v25 = *(void *)(*((void *)&v41 + 1) + 8 * v24);
      id v26 = +[MBKeyBag OTAKeyBagWithData:error:](MBKeyBag, "OTAKeyBagWithData:error:", [obj objectForKeyedSubscript:v25], &v49);
      if (!v26)
      {
        id v32 = v49;
        CFStringRef v33 = @"Error deserializing keybag";
LABEL_53:
        uint64_t v31 = 205;
        return +[MBError errorWithCode:v31 error:v32 format:v33];
      }
      id v27 = v26;
      if (([v26 unlockWithSecret:v39 error:&v49] & 1) == 0)
      {
        id v32 = v49;
        CFStringRef v33 = @"Error unlocking keybag with secret";
        goto LABEL_53;
      }
      [v20 setObject:v27 forKeyedSubscript:v25];
      if (v22 != (id)++v24) {
        continue;
      }
      break;
    }
    id v22 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v22) {
      continue;
    }
    break;
  }
LABEL_35:
  unint64_t v28 = MBGetDefaultLog();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    unint64_t v29 = self->_restoreID;
    *(_DWORD *)buf = 134217984;
    unint64_t v52 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%lu] Saving keybag(s)", buf, 0xCu);
    unint64_t v37 = self->_restoreID;
    _MBLog();
  }
  if (-[MBServiceEncryptionManager saveRestoreKeyBagDatasByID:secret:error:](self->super._encryptionManager, "saveRestoreKeyBagDatasByID:secret:error:", obj, v39, &v49, v37))
  {
    self->_secret = (NSData *)v39;
    unint64_t v30 = (NSDictionary *)v20;
    id result = 0;
    self->_keybagsByID = v30;
    return result;
  }
  id v32 = v49;
  CFStringRef v33 = @"Error saving keybag with null secret";
  uint64_t v31 = 100;
  return +[MBError errorWithCode:v31 error:v32 format:v33];
}

- (id)_findBackupAndSnapshot
{
  id v4 = (MBSBackup *)[(MBServiceCache *)[(MBServiceEngine *)self cache] backupForUDID:[(MBServiceEngine *)self backupUDID] lastModified:0];
  self->_backup = v4;
  if (v4)
  {
    if ([(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] snapshotID])
    {
      if ([(MBSBackup *)self->_backup snapshotsCount])
      {
        for (unint64_t i = 0; i < [(MBSBackup *)self->_backup snapshotsCount]; ++i)
        {
          id v6 = [(MBSBackup *)self->_backup snapshotAtIndex:i];
          unsigned int v7 = [v6 snapshotID];
          if ((id)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] snapshotID] == (id)v7)
          {
            if (![v6 committed])
            {
              unint64_t v40 = [(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] snapshotID];
              CFStringRef v8 = @"Snapshot %lu is not committed";
              return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 204, v8, v40);
            }
            self->_snapshotIndex = i;
          }
        }
      }
      if (self->_snapshotIndex < 0)
      {
        unint64_t v40 = [(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] snapshotID];
        CFStringRef v8 = @"Snapshot %lu not found in backup";
        return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 204, v8, v40);
      }
LABEL_31:
      id v17 = -[MBSBackup snapshotAtIndex:](self->_backup, "snapshotAtIndex:");
      unint64_t v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t restoreID = self->_restoreID;
        unsigned int v19 = [v17 snapshotID];
        id v20 = [(MBServiceEngine *)self backupUDID];
        +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v17 committed]);
        uint64_t v21 = MBStringWithDate();
        id v22 = objc_msgSend(objc_msgSend(v17, "attributes"), "deviceName");
        uint64_t v23 = [(MBSBackupAttributes *)[(MBSBackup *)self->_backup attributes] productType];
        id v24 = objc_msgSend(objc_msgSend(v17, "attributes"), "buildVersion");
        *(_DWORD *)buf = 134219522;
        unint64_t v49 = restoreID;
        __int16 v50 = 1024;
        *(_DWORD *)__int16 v51 = v19;
        *(_WORD *)&v51[4] = 2112;
        *(void *)&v51[6] = v20;
        *(_WORD *)&v51[14] = 2112;
        *(void *)&v51[16] = v21;
        __int16 v52 = 2112;
        id v53 = v22;
        __int16 v54 = 2112;
        unint64_t v55 = v23;
        __int16 v56 = 2112;
        id v57 = v24;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[%lu] Restoring from snapshot %u of backup %@ (%@, %@, %@, %@)", buf, 0x44u);
        unint64_t v25 = self->_restoreID;
        id v26 = [v17 snapshotID];
        id v27 = [(MBServiceEngine *)self backupUDID];
        +[NSDate dateWithTimeIntervalSince1970:](NSDate, "dateWithTimeIntervalSince1970:", (double)(unint64_t)[v17 committed]);
        uint64_t v28 = MBStringWithDate();
        id v29 = objc_msgSend(objc_msgSend(v17, "attributes"), "deviceName");
        long long v45 = [(MBSBackupAttributes *)[(MBSBackup *)self->_backup attributes] productType];
        id v46 = objc_msgSend(objc_msgSend(v17, "attributes"), "buildVersion");
        uint64_t v43 = v28;
        id v44 = v29;
        id v41 = v26;
        long long v42 = v27;
        unint64_t v39 = v25;
        _MBLog();
      }
      [(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] setShouldRestoreSystemFiles:[(MBSBackup *)self->_backup canRestoreSystemFiles]];
      unsigned int v30 = [(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] shouldRestoreSystemFiles];
      uint64_t v31 = MBGetDefaultLog();
      id v32 = v31;
      if (v30)
      {
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          unint64_t v33 = self->_restoreID;
          CFStringRef v34 = [(MBSBackupAttributes *)[(MBSBackup *)self->_backup attributes] deviceClass];
          uint64_t v35 = MBDeviceClass();
          *(_DWORD *)buf = 134218498;
          unint64_t v49 = v33;
          __int16 v50 = 2112;
          *(void *)__int16 v51 = v34;
          *(_WORD *)&v51[8] = 2112;
          *(void *)&v51[10] = v35;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%lu] Restoring all files from %@ backup to %@", buf, 0x20u);
          [(MBSBackupAttributes *)[(MBSBackup *)self->_backup attributes] deviceClass];
          MBDeviceClass();
LABEL_38:
          _MBLog();
        }
      }
      else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v36 = self->_restoreID;
        unint64_t v37 = [(MBSBackupAttributes *)[(MBSBackup *)self->_backup attributes] deviceClass];
        uint64_t v38 = MBDeviceClass();
        *(_DWORD *)buf = 134218498;
        unint64_t v49 = v36;
        __int16 v50 = 2112;
        *(void *)__int16 v51 = v37;
        *(_WORD *)&v51[8] = 2112;
        *(void *)&v51[10] = v38;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[%lu] Not restoring system files from %@ backup to %@", buf, 0x20u);
        [(MBSBackupAttributes *)[(MBSBackup *)self->_backup attributes] deviceClass];
        MBDeviceClass();
        goto LABEL_38;
      }
      return 0;
    }
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = self->_restoreID;
      *(_DWORD *)buf = 134217984;
      unint64_t v49 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%lu] Selecting last committed snapshot automatically", buf, 0xCu);
      unint64_t v39 = self->_restoreID;
      _MBLog();
    }
    if (![(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] count])
    {
      CFStringRef v8 = @"No snapshots in backup";
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 204, v8, v40);
    }
    if (objc_msgSend(-[MBSBackup snapshotAtIndex:](self->_backup, "snapshotAtIndex:", (char *)-[MBSBackup snapshotsCount](self->_backup, "snapshotsCount") - 1), "committed"))
    {
      id v12 = MBGetDefaultLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        unint64_t v13 = self->_restoreID;
        *(_DWORD *)buf = 134217984;
        unint64_t v49 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%lu] Last snapshot is committed", buf, 0xCu);
        unint64_t v40 = self->_restoreID;
        _MBLog();
      }
      uint64_t v14 = -1;
LABEL_30:
      self->_snapshotIndex = [(MBSBackup *)self->_backup snapshotsCount] + v14;
      goto LABEL_31;
    }
    if ((unint64_t)[(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] count] >= 2)
    {
      id v15 = MBGetDefaultLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        unint64_t v16 = self->_restoreID;
        *(_DWORD *)buf = 134217984;
        unint64_t v49 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%lu] Restoring from second to last snapshot", buf, 0xCu);
        unint64_t v40 = self->_restoreID;
        _MBLog();
      }
      if (!objc_msgSend(-[MBSBackup snapshotAtIndex:](self->_backup, "snapshotAtIndex:", (char *)-[MBSBackup snapshotsCount](self->_backup, "snapshotsCount", v40) - 2), "committed"))-[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBServiceRestoreEngine.m", 649, @"Second to last snapshot not committed"); {
      uint64_t v14 = -2;
      }
      goto LABEL_30;
    }
    CFStringRef v8 = @"Only one snapshot exists and it's not committed";
    return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 204, v8, v40);
  }
  else
  {
    return +[MBError errorWithCode:204 format:@"Backup does not exist"];
  }
}

- (id)_buildRestoreFilesTable
{
  uint64_t v118 = 0;
  v119 = &v118;
  uint64_t v120 = 0x3052000000;
  v121 = sub_1001D61DC;
  v122 = sub_1001D61EC;
  uint64_t v123 = 0;
  unsigned int v3 = +[NSFileManager defaultManager];
  v117 = 0;
  if (![(MBServiceCache *)[(MBServiceEngine *)self cache] backupForUDID:[(MBServiceEngine *)self backupUDID] lastModified:&v117]|| ![(NSString *)[(MBServiceEngine *)self backupUDID] isEqualToString:[(MBServiceCache *)[(MBServiceEngine *)self cache] restoreBackupUDID]]|| (id v4 = [(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] snapshotID], v4 != (void *)[(MBServiceCache *)[(MBServiceEngine *)self cache] restoreSnapshotID])|| (v5 = v117, v5 != (void *)[(MBServiceCache *)[(MBServiceEngine *)self cache] restoreBackupLastModified]))
  {
    [(MBServiceCache *)[(MBServiceEngine *)self cache] removeAllRestores];
    [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] close];
    [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] remove];
    [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] open];
    unint64_t v9 = [(MBServiceAccount *)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] account] persona];
    if ([(MBPersona *)v9 createRestoreDirectoriesWithError:v119 + 5])
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unint64_t restoreID = self->_restoreID;
        *(_DWORD *)buf = 134217984;
        unint64_t v125 = restoreID;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%lu] Creating placeholder directory", buf, 0xCu);
        unint64_t v73 = self->_restoreID;
        _MBLog();
      }
      id v12 = objc_msgSend(-[MBPersona userIncompleteRestoreDirectory](-[MBEngine persona](self, "persona", v73), "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", -[MBPersona placeholderRestoreDirectory](v9, "placeholderRestoreDirectory"));
      if ([(NSFileManager *)v3 createDirectoryAtPath:v12 withIntermediateDirectories:1 attributes:MBMobileFileAttributes() error:v119 + 5])
      {
        +[NSDate timeIntervalSinceReferenceDate];
        double v14 = v13;
        id v15 = MBGetDefaultLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          unint64_t v16 = self->_restoreID;
          *(_DWORD *)buf = 134217984;
          unint64_t v125 = v16;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "[%lu] Adding restore files to cache", buf, 0xCu);
          unint64_t v74 = self->_restoreID;
          _MBLog();
        }
        v116[0] = _NSConcreteStackBlock;
        v116[1] = 3221225472;
        v116[2] = sub_1001D61F8;
        v116[3] = &unk_100415E30;
        v116[4] = self;
        v116[5] = &v118;
        v116[6] = a2;
        v116[7] = v117;
        MBPerformOnMBSCachePoolSerialQueue(v116);
        id v17 = (void *)v119[5];
        if (!v17)
        {
          id v20 = MBGetDefaultLog();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            unint64_t v21 = self->_restoreID;
            +[NSDate timeIntervalSinceReferenceDate];
            *(_DWORD *)buf = 134218240;
            unint64_t v125 = v21;
            __int16 v126 = 2048;
            double v127 = v22 - v14;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "[%lu] Added files to restore to cache in %0.3f s", buf, 0x16u);
            unint64_t v23 = self->_restoreID;
            +[NSDate timeIntervalSinceReferenceDate];
            double v76 = v24 - v14;
            unint64_t v74 = v23;
            _MBLog();
          }
          unint64_t v25 = MBGetDefaultLog();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            unint64_t v26 = self->_restoreID;
            *(_DWORD *)buf = 134217984;
            unint64_t v125 = v26;
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "[%lu] Moving system app, plugins, and groups into the foreground restore", buf, 0xCu);
            unint64_t v74 = self->_restoreID;
            _MBLog();
          }
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          v97 = self;
          id v27 = [(MBAppManager *)self->super.super._appManager allApps];
          id v28 = [v27 countByEnumeratingWithState:&v112 objects:v135 count:16];
          if (v28)
          {
            uint64_t v88 = *(void *)v113;
            id obj = v27;
            do
            {
              uint64_t v29 = 0;
              id v90 = v28;
              do
              {
                if (*(void *)v113 != v88) {
                  objc_enumerationMutation(obj);
                }
                unsigned int v30 = *(void **)(*((void *)&v112 + 1) + 8 * v29);
                uint64_t v92 = v29;
                if ([v30 isSystemApp])
                {
                  long long v110 = 0u;
                  long long v111 = 0u;
                  long long v108 = 0u;
                  long long v109 = 0u;
                  id v31 = [v30 containers];
                  id v32 = [v31 countByEnumeratingWithState:&v108 objects:v134 count:16];
                  if (v32)
                  {
                    uint64_t v33 = *(void *)v109;
                    do
                    {
                      CFStringRef v34 = 0;
                      id v95 = v32;
                      do
                      {
                        if (*(void *)v109 != v33) {
                          objc_enumerationMutation(v31);
                        }
                        uint64_t v35 = *(void **)(*((void *)&v108 + 1) + 8 * (void)v34);
                        id v36 = +[MBServiceRestoreMode backgroundContainerRestoreModeWithContainer:v35];
                        if ([(MBServiceCache *)[(MBServiceEngine *)self cache] restoreIDForMode:v36])
                        {
                          unint64_t v37 = MBGetDefaultLog();
                          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                          {
                            unint64_t v38 = self->_restoreID;
                            double v39 = COERCE_DOUBLE([v35 identifier]);
                            unint64_t v40 = (const char *)[v35 containerTypeString];
                            *(_DWORD *)buf = 134218498;
                            unint64_t v125 = v38;
                            __int16 v126 = 2112;
                            double v127 = v39;
                            __int16 v128 = 2112;
                            v129 = v40;
                            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%lu] Moving system container %@ with type %@ into the foreground restore", buf, 0x20u);
                            unint64_t v41 = self->_restoreID;
                            id v32 = v95;
                            double v77 = COERCE_DOUBLE([v35 identifier]);
                            id v78 = [v35 containerTypeString];
                            unint64_t v75 = v41;
                            _MBLog();
                          }
                          -[MBServiceCache setRestoreID:forType:value:](-[MBServiceEngine cache](self, "cache", v75, *(void *)&v77, v78), "setRestoreID:forType:value:", 1, [v36 type], objc_msgSend(v36, "value"));
                        }
                        CFStringRef v34 = (char *)v34 + 1;
                      }
                      while (v32 != v34);
                      id v32 = [v31 countByEnumeratingWithState:&v108 objects:v134 count:16];
                    }
                    while (v32);
                  }
                }
                uint64_t v29 = v92 + 1;
              }
              while ((id)(v92 + 1) != v90);
              id v28 = [obj countByEnumeratingWithState:&v112 objects:v135 count:16];
            }
            while (v28);
          }
          +[NSDate timeIntervalSinceReferenceDate];
          long long v42 = self;
          double v44 = v43;
          long long v45 = MBGetDefaultLog();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            unint64_t v46 = self->_restoreID;
            *(_DWORD *)buf = 134217984;
            unint64_t v125 = v46;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "[%lu] Moving restores files from foreground to background restore", buf, 0xCu);
            unint64_t v75 = self->_restoreID;
            _MBLog();
          }
          for (uint64_t i = 0; ; i += 1000)
          {
            id v79 = objc_alloc_init((Class)NSAutoreleasePool);
            id v82 = [(MBServiceCache *)[(MBServiceEngine *)v42 cache] restoreFilesForBackupUDID:[(MBServiceEngine *)v42 backupUDID] offset:i limit:1000];
            if (![v82 count]) {
              break;
            }
            id v91 = +[NSMutableArray array];
            long long v106 = 0u;
            long long v107 = 0u;
            long long v105 = 0u;
            long long v104 = 0u;
            id v84 = [v82 countByEnumeratingWithState:&v104 objects:v133 count:16];
            if (v84)
            {
              uint64_t v83 = *(void *)v105;
              do
              {
                v86 = 0;
                do
                {
                  if (*(void *)v105 != v83) {
                    objc_enumerationMutation(v82);
                  }
                  v89 = *(void **)(*((void *)&v104 + 1) + 8 * (void)v86);
                  if ([v89 restoreID] == (id)1)
                  {
                    double v47 = COERCE_DOUBLE(-[MBServiceCache fileForID:snapshotID:backupUDID:](-[MBServiceEngine cache](v42, "cache"), "fileForID:snapshotID:backupUDID:", [v89 fileID], objc_msgSend(v89, "snapshotID"), -[MBServiceEngine backupUDID](v42, "backupUDID")));
                    if (v47 == 0.0) {
                      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v42, @"MBServiceRestoreEngine.m", 852, @"File not found: %@", [v89 fileID]);
                    }
                    if ((objc_msgSend(objc_msgSend(*(id *)&v47, "domain", v75), "isAppDomain") & 1) == 0)
                    {
                      long long v48 = MBGetDefaultLog();
                      if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                      {
                        unint64_t v49 = v42->_restoreID;
                        *(_DWORD *)buf = 134218242;
                        unint64_t v125 = v49;
                        __int16 v126 = 2112;
                        double v127 = v47;
                        _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "[%lu] Checking if file should be restored in background: %@", buf, 0x16u);
                        unint64_t v75 = v42->_restoreID;
                        double v77 = v47;
                        _MBLog();
                      }
                      v93 = +[MBFileInfo fileInfoWithRestorable:](MBFileInfo, "fileInfoWithRestorable:", *(void *)&v47, v75, *(void *)&v77);
                      long long v102 = 0u;
                      long long v103 = 0u;
                      long long v100 = 0u;
                      long long v101 = 0u;
                      __int16 v50 = [(MBSettingsContext *)[(MBServiceEngine *)v42 settingsContext] plugins];
                      id v51 = [(NSArray *)v50 countByEnumeratingWithState:&v100 objects:v132 count:16];
                      if (v51)
                      {
                        uint64_t v96 = *(void *)v101;
                        v94 = v50;
                        do
                        {
                          for (j = 0; j != v51; j = (char *)j + 1)
                          {
                            if (*(void *)v101 != v96) {
                              objc_enumerationMutation(v94);
                            }
                            id v53 = *(void **)(*((void *)&v100 + 1) + 8 * (void)j);
                            if ((objc_opt_respondsToSelector() & 1) != 0
                              && [v53 shouldBackgroundRestoreContentWithPolicy:v42->_restorePolicy fileInfo:v93])
                            {
                              unint64_t v55 = MBGetDefaultLog();
                              double v56 = v47;
                              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                              {
                                unint64_t v57 = v97->_restoreID;
                                double v58 = COERCE_DOUBLE([*(id *)&v47 typeString]);
                                v59 = (objc_class *)objc_opt_class();
                                Name = class_getName(v59);
                                *(_DWORD *)buf = 134218754;
                                unint64_t v125 = v57;
                                __int16 v126 = 2112;
                                double v127 = v58;
                                __int16 v128 = 2082;
                                v129 = Name;
                                __int16 v130 = 2112;
                                double v131 = v47;
                                _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "[%lu] Moving %@ from foreground to background restore as requested by plugin %{public}s: %@", buf, 0x2Au);
                                unint64_t v61 = v97->_restoreID;
                                id v62 = [*(id *)&v56 typeString];
                                v63 = (objc_class *)objc_opt_class();
                                class_getName(v63);
                                unint64_t v75 = v61;
                                double v77 = *(double *)&v62;
                                _MBLog();
                              }
                              objc_msgSend(v91, "addObject:", v89, v75);
                              long long v42 = v97;
                              double v47 = v56;
                              [v91 addObject:*(void *)&v56];
                            }
                          }
                          id v51 = [(NSArray *)v94 countByEnumeratingWithState:&v100 objects:v132 count:16];
                        }
                        while (v51);
                      }
                      char v99 = 0;
                      unsigned int v64 = [(MBPersona *)[(MBEngine *)v42 persona] getBooleanValueForKey:@"RestoreBooksInBackground" keyExists:&v99];
                      if (v99
                        && v64
                        && objc_msgSend(objc_msgSend(objc_msgSend(*(id *)&v47, "domain"), "name"), "isEqualToString:", @"BooksDomain")&& objc_msgSend(objc_msgSend(*(id *)&v47, "relativePath"), "containsString:", @".epub"))
                      {
                        v65 = MBGetDefaultLog();
                        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
                        {
                          unint64_t v66 = v42->_restoreID;
                          double v67 = COERCE_DOUBLE([*(id *)&v47 typeString]);
                          *(_DWORD *)buf = 134218498;
                          unint64_t v125 = v66;
                          __int16 v126 = 2112;
                          double v127 = v67;
                          __int16 v128 = 2112;
                          v129 = *(const char **)&v47;
                          _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_INFO, "[%lu] Moving %@ from foreground to background for testing: %@", buf, 0x20u);
                          unint64_t v68 = v42->_restoreID;
                          double v77 = COERCE_DOUBLE([*(id *)&v47 typeString]);
                          unint64_t v75 = v68;
                          _MBLog();
                        }
                        objc_msgSend(v91, "addObject:", v89, v75);
                        [v91 addObject:*(void *)&v47];
                      }
                    }
                  }
                  v86 = (char *)v86 + 1;
                }
                while (v86 != v84);
                id v69 = [v82 countByEnumeratingWithState:&v104 objects:v133 count:16];
                id v84 = v69;
              }
              while (v69);
            }
            v98[0] = _NSConcreteStackBlock;
            v98[1] = 3221225472;
            v98[2] = sub_1001D684C;
            v98[3] = &unk_100414998;
            v98[4] = v42;
            v98[5] = v91;
            MBPerformOnMBSCachePoolSerialQueue(v98);
            [v79 drain];
          }
          [v79 drain];
          v70 = MBGetDefaultLog();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            unint64_t v71 = v42->_restoreID;
            +[NSDate timeIntervalSinceReferenceDate];
            *(_DWORD *)buf = 134218240;
            unint64_t v125 = v71;
            __int16 v126 = 2048;
            double v127 = v72 - v44;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_INFO, "[%lu] Finished moving files from foreground to background restore in %0.3f s", buf, 0x16u);
            +[NSDate timeIntervalSinceReferenceDate];
            _MBLog();
          }
          goto LABEL_7;
        }
        unint64_t v18 = v17;
      }
      else
      {
        unint64_t v18 = +[MBError errorWithCode:100 error:v119[5] format:@"Error creating placeholder directory"];
      }
    }
    else
    {
      unint64_t v18 = +[MBError errorWithCode:100 error:v119[5] format:@"Error creating restore directory"];
    }
    CFStringRef v8 = v18;
    goto LABEL_19;
  }
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t v7 = self->_restoreID;
    *(_DWORD *)buf = 134217984;
    unint64_t v125 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%lu] Resuming from previously failed restore", buf, 0xCu);
    _MBLog();
  }
LABEL_7:
  CFStringRef v8 = 0;
LABEL_19:
  _Block_object_dispose(&v118, 8);
  return v8;
}

- (id)_findFilesToRestore
{
  if ([(MBServiceRestoreMode *)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] restoreMode] isForeground])
  {
    id result = [(MBServiceRestoreEngine *)self _buildRestoreFilesTable];
    if (result) {
      return result;
    }
  }
  id result = [(MBServiceRestoreEngine *)self _findDependentContainersWithAddedFiles:0 waitingForFiles:0];
  if (result) {
    return result;
  }
  if (![(MBServiceCache *)[(MBServiceEngine *)self cache] containsRestoreFilesForRestoreID:self->_restoreID])
  {
    CFStringRef v4 = @"No files found to restore";
    uint64_t v5 = 4;
    goto LABEL_9;
  }
  if ([(MBServiceCache *)[(MBServiceEngine *)self cache] containsRestoreFilesWithState:4 forRestoreID:self->_restoreID])
  {
    CFStringRef v4 = @"Restore previously failed unrecoverably";
    uint64_t v5 = 1;
LABEL_9:
    return +[MBError errorWithCode:v5 format:v4];
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v7 = v6;
  CFStringRef v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    unint64_t restoreID = self->_restoreID;
    *(_DWORD *)buf = 134217984;
    unint64_t v15 = restoreID;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%lu] Calculating restore files size", buf, 0xCu);
    unint64_t v13 = self->_restoreID;
    _MBLog();
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] restoreFilesCount:&self->_totalFileCount size:&self->_totalFileSize forRestoreID:self->_restoreID backupUDID:[(MBServiceEngine *)self backupUDID]];
  [(MBChunkStoreProgressModel *)[(MBChunkStore *)[(MBServiceEngine *)self chunkStore] progressModel] willTransferItemsWithSize:self->_totalFileSize count:LODWORD(self->_totalFileCount)];
  id v10 = MBGetDefaultLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = self->_restoreID;
    +[NSDate timeIntervalSinceReferenceDate];
    *(_DWORD *)buf = 134218240;
    unint64_t v15 = v11;
    __int16 v16 = 2048;
    double v17 = v12 - v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%lu] Finished calculating restore files size in %0.3f s", buf, 0x16u);
    +[NSDate timeIntervalSinceReferenceDate];
    _MBLog();
  }
  return 0;
}

- (id)_findDependentContainersWithAddedFiles:(BOOL *)a3 waitingForFiles:(BOOL *)a4
{
  uint64_t v33 = 0;
  CFStringRef v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v29 = 0;
  unsigned int v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  if (![(MBServiceRestoreMode *)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] restoreMode] isBackgroundApp])goto LABEL_13; {
  double v7 = [(MBServiceRestoreMode *)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] restoreMode] bundleID];
  }
  id v8 = [(MBAppManager *)[(MBEngine *)self appManager] appWithIdentifier:v7];
  if (!v8)
  {
    unint64_t v15 = +[MBError errorWithCode:1, @"App not installed: %@", v7 format];
    goto LABEL_18;
  }
  id v9 = +[NSMutableArray array];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  unint64_t v23 = sub_1001D6F40;
  double v24 = &unk_100415E58;
  unint64_t v25 = self;
  id v26 = v9;
  id v27 = &v33;
  id v28 = &v29;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = [v8 containers];
  id v11 = [v10 countByEnumeratingWithState:&v18 objects:v37 count:16];
  if (!v11)
  {
LABEL_12:
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001D7320;
    v17[3] = &unk_100414998;
    v17[4] = self;
    v17[5] = v9;
    MBPerformOnMBSCachePoolSerialQueue(v17);
LABEL_13:
    if (a3) {
      *a3 = *((unsigned char *)v34 + 24);
    }
    unint64_t v15 = 0;
    if (a4) {
      *a4 = *((unsigned char *)v30 + 24);
    }
    goto LABEL_18;
  }
  uint64_t v12 = *(void *)v19;
LABEL_5:
  uint64_t v13 = 0;
  while (1)
  {
    if (*(void *)v19 != v12) {
      objc_enumerationMutation(v10);
    }
    double v14 = *(void **)(*((void *)&v18 + 1) + 8 * v13);
    if ([v14 containerType] != 1)
    {
      unint64_t v15 = v23((uint64_t)v22, v14);
      if (v15) {
        break;
      }
    }
    if (v11 == (id)++v13)
    {
      id v11 = [v10 countByEnumeratingWithState:&v18 objects:v37 count:16];
      if (v11) {
        goto LABEL_5;
      }
      goto LABEL_12;
    }
  }
LABEL_18:
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  return v15;
}

- (id)_restoreFileForFile:(id)a3
{
  id v5 = +[MBServiceRestoreFile restoreFile];
  objc_msgSend(v5, "setRestoreID:", -[MBServiceCache restoreIDForMode:](-[MBServiceEngine cache](self, "cache"), "restoreIDForMode:", +[MBServiceRestoreMode foregroundRestoreMode](MBServiceRestoreMode, "foregroundRestoreMode")));
  objc_msgSend(v5, "setFileID:", objc_msgSend(a3, "fileID"));
  objc_msgSend(v5, "setSnapshotID:", objc_msgSend(a3, "snapshotID"));
  [v5 setState:0];
  if ([a3 isDeleted])
  {
    double v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unint64_t restoreID = self->_restoreID;
      *(_DWORD *)buf = 134218242;
      unint64_t v85 = restoreID;
      __int16 v86 = 2112;
      id v87 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%lu] Not restoring deleted file: %@", buf, 0x16u);
      unint64_t v67 = self->_restoreID;
      id v69 = a3;
      _MBLog();
    }
    id v8 = v5;
    uint64_t v9 = 2;
    goto LABEL_73;
  }
  id v10 = objc_msgSend(objc_msgSend(a3, "relativePath"), "pathComponents");
  id v11 = [v10 count];
  int v12 = 0;
  uint64_t v13 = 0;
  while (1)
  {
    double v14 = +[NSString pathWithComponents:](NSString, "pathWithComponents:", objc_msgSend(v10, "subarrayWithRange:", 0, v13));
    if (objc_msgSend(objc_msgSend(objc_msgSend(a3, "domain"), "relativePathsNotToRestore"), "containsObject:", v14))
    {
      unint64_t v37 = MBGetDefaultLog();
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_INFO)) {
        goto LABEL_72;
      }
      unint64_t v38 = self->_restoreID;
      *(_DWORD *)buf = 134218242;
      unint64_t v85 = v38;
      __int16 v86 = 2112;
      id v87 = a3;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "[%lu] Not restoring: %@", buf, 0x16u);
      unint64_t v67 = self->_restoreID;
      id v69 = a3;
LABEL_57:
      _MBLog();
      goto LABEL_72;
    }
    if ([a3 isRegularFile]
      && objc_msgSend(objc_msgSend(objc_msgSend(a3, "domain"), "relativePathsToBackgroundRestore"), "containsObject:", v14)&& -[MBSettingsContext shouldRestoreSystemFiles](-[MBServiceEngine settingsContext](self, "settingsContext"), "shouldRestoreSystemFiles"))
    {
      break;
    }
    if (![(MBServiceRestoreEngine *)self isRestoringToSameDevice]
      && objc_msgSend(objc_msgSend(objc_msgSend(a3, "domain"), "relativePathsNotToMigrate"), "containsObject:", v14))
    {
      double v39 = MBGetDefaultLog();
      if (!os_log_type_enabled(v39, OS_LOG_TYPE_INFO)) {
        goto LABEL_72;
      }
      unint64_t v40 = self->_restoreID;
      *(_DWORD *)buf = 134218242;
      unint64_t v85 = v40;
      __int16 v86 = 2112;
      id v87 = a3;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "[%lu] Not restoring because this is a migration: %@", buf, 0x16u);
      unint64_t v67 = self->_restoreID;
      id v69 = a3;
      goto LABEL_57;
    }
    if ([(id)MBDeviceClass() isEqualToString:@"iPod"]
      && objc_msgSend(objc_msgSend(objc_msgSend(a3, "domain"), "relativePathsNotToRestoreToIPods"), "containsObject:", v14))
    {
      unint64_t v41 = MBGetDefaultLog();
      if (!os_log_type_enabled(v41, OS_LOG_TYPE_INFO)) {
        goto LABEL_72;
      }
      unint64_t v42 = self->_restoreID;
      *(_DWORD *)buf = 134218242;
      unint64_t v85 = v42;
      __int16 v86 = 2112;
      id v87 = a3;
      _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "[%lu] Not restoring because this is an iPod: %@", buf, 0x16u);
      unint64_t v67 = self->_restoreID;
      id v69 = a3;
      goto LABEL_57;
    }
    v12 |= objc_msgSend(objc_msgSend(objc_msgSend(a3, "domain"), "relativePathsOfSystemFilesToAlwaysRestore"), "containsObject:", v14);
    if (++v13 > (unint64_t)v11)
    {
      id v72 = v5;
      unint64_t v73 = self;
      long long v82 = 0u;
      long long v83 = 0u;
      long long v80 = 0u;
      long long v81 = 0u;
      id obj = objc_msgSend(objc_msgSend(a3, "domain"), "relativePathsOfSystemFilesToAlwaysRestore");
      id v15 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v81;
        do
        {
          for (uint64_t i = 0; i != v16; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v81 != v17) {
              objc_enumerationMutation(obj);
            }
            id v19 = [*(id *)(*((void *)&v80 + 1) + 8 * i) pathComponents];
            id v20 = [v19 count];
            unint64_t v21 = 0;
            do
              v12 |= objc_msgSend(objc_msgSend(a3, "relativePath"), "isEqualToString:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", objc_msgSend(v19, "subarrayWithRange:", 0, v21++)));
            while (v21 <= (unint64_t)v20);
          }
          id v16 = [obj countByEnumeratingWithState:&v80 objects:v91 count:16];
        }
        while (v16);
      }
      if (-[MBSettingsContext shouldRestoreSystemFiles](-[MBServiceEngine settingsContext](self, "settingsContext"), "shouldRestoreSystemFiles")|| ((objc_msgSend(objc_msgSend(a3, "domain"), "isAppDomain") | v12) & 1) != 0)
      {
        if ((objc_msgSend(objc_msgSend(a3, "domain"), "isAppDomain") & 1) == 0)
        {
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          double v22 = [(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] plugins];
          id v23 = [(NSArray *)v22 countByEnumeratingWithState:&v76 objects:v90 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v77;
            while (2)
            {
              for (j = 0; j != v24; j = (char *)j + 1)
              {
                if (*(void *)v77 != v25) {
                  objc_enumerationMutation(v22);
                }
                id v27 = *(void **)(*((void *)&v76 + 1) + 8 * (void)j);
                if (objc_opt_respondsToSelector())
                {
                  restorePolicy = v73->_restorePolicy;
                  id v29 = [a3 absolutePath];
                  unsigned int v30 = restorePolicy;
                  self = v73;
                  if (([v27 shouldRestoreContentWithPolicy:v30 atPath:v29] & 1) == 0)
                  {
                    id v51 = MBGetDefaultLog();
                    if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO)) {
                      goto LABEL_71;
                    }
LABEL_69:
                    unint64_t v52 = self->_restoreID;
                    id v53 = (objc_class *)objc_opt_class();
                    Name = class_getName(v53);
                    *(_DWORD *)buf = 134218498;
                    unint64_t v85 = v52;
                    __int16 v86 = 2082;
                    id v87 = (id)Name;
                    __int16 v88 = 2112;
                    id v89 = a3;
                    _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_INFO, "[%lu] Not restoring because it was refused by plugin %{public}s: %@", buf, 0x20u);
                    unint64_t v55 = self->_restoreID;
                    double v56 = (objc_class *)objc_opt_class();
                    id v69 = (void *)class_getName(v56);
                    id v71 = a3;
                    unint64_t v67 = v55;
                    goto LABEL_70;
                  }
                }
                if ((objc_opt_respondsToSelector() & 1) != 0
                  && (objc_msgSend(v27, "shouldRestoreContentWithPolicy:fileInfo:", self->_restorePolicy, +[MBFileInfo fileInfoWithRestorable:](MBFileInfo, "fileInfoWithRestorable:", a3)) & 1) == 0)
                {
                  id v51 = MBGetDefaultLog();
                  if (!os_log_type_enabled(v51, OS_LOG_TYPE_INFO)) {
                    goto LABEL_71;
                  }
                  goto LABEL_69;
                }
              }
              id v24 = [(NSArray *)v22 countByEnumeratingWithState:&v76 objects:v90 count:16];
              if (v24) {
                continue;
              }
              break;
            }
          }
        }
        id v5 = v72;
        if (!objc_msgSend(objc_msgSend(a3, "domain"), "isPlaceholderAppDomain"))
        {
LABEL_47:
          if (objc_msgSend(objc_msgSend(a3, "domain", v67, v69), "isAppDomain"))
          {
            if (!objc_msgSend(objc_msgSend(a3, "domain"), "isPlaceholderAppDomain"))
            {
              if (objc_msgSend(objc_msgSend(a3, "domain"), "isPluginAppDomain"))
              {
                double v58 = MBGetDefaultLog();
                if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                {
                  unint64_t v59 = self->_restoreID;
                  *(_DWORD *)buf = 134218242;
                  unint64_t v85 = v59;
                  __int16 v86 = 2112;
                  id v87 = a3;
                  _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_INFO, "[%lu] Restoring app plugin file in the background: %@", buf, 0x16u);
                  unint64_t v68 = self->_restoreID;
                  id v70 = a3;
                  _MBLog();
                }
                v60 = [(MBServiceEngine *)self cache];
                id v61 = +[MBServiceRestoreMode backgroundAppPluginRestoreModeWithBundleID:](MBServiceRestoreMode, "backgroundAppPluginRestoreModeWithBundleID:", objc_msgSend(objc_msgSend(a3, "domain"), "containerID"));
              }
              else
              {
                unsigned int v62 = objc_msgSend(objc_msgSend(a3, "domain"), "isGroupAppDomain");
                v63 = MBGetDefaultLog();
                BOOL v64 = os_log_type_enabled(v63, OS_LOG_TYPE_INFO);
                if (v62)
                {
                  if (v64)
                  {
                    unint64_t v65 = self->_restoreID;
                    *(_DWORD *)buf = 134218242;
                    unint64_t v85 = v65;
                    __int16 v86 = 2112;
                    id v87 = a3;
                    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "[%lu] Restoring app group file in the background: %@", buf, 0x16u);
                    unint64_t v68 = self->_restoreID;
                    id v70 = a3;
                    _MBLog();
                  }
                  v60 = [(MBServiceEngine *)self cache];
                  id v61 = +[MBServiceRestoreMode backgroundAppGroupRestoreModeWithBundleID:](MBServiceRestoreMode, "backgroundAppGroupRestoreModeWithBundleID:", objc_msgSend(objc_msgSend(a3, "domain"), "containerID"));
                }
                else
                {
                  if (v64)
                  {
                    unint64_t v66 = self->_restoreID;
                    *(_DWORD *)buf = 134218242;
                    unint64_t v85 = v66;
                    __int16 v86 = 2112;
                    id v87 = a3;
                    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_INFO, "[%lu] Restoring app file in the background: %@", buf, 0x16u);
                    unint64_t v68 = self->_restoreID;
                    id v70 = a3;
                    _MBLog();
                  }
                  v60 = [(MBServiceEngine *)self cache];
                  id v61 = +[MBServiceRestoreMode backgroundAppRestoreModeWithBundleID:](MBServiceRestoreMode, "backgroundAppRestoreModeWithBundleID:", objc_msgSend(objc_msgSend(a3, "domain"), "containerID"));
                }
              }
              id v45 = [(MBServiceCache *)v60 restoreIDForMode:v61];
              id v5 = v72;
              unint64_t v46 = v72;
              goto LABEL_87;
            }
            uint64_t v35 = MBGetDefaultLog();
            if (!os_log_type_enabled(v35, OS_LOG_TYPE_INFO)) {
              return v5;
            }
            unint64_t v36 = self->_restoreID;
            *(_DWORD *)buf = 134218242;
            unint64_t v85 = v36;
            __int16 v86 = 2112;
            id v87 = a3;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "[%lu] Restoring app placeholder file in the foreground: %@", buf, 0x16u);
          }
          else
          {
            unint64_t v49 = MBGetDefaultLog();
            if (!os_log_type_enabled(v49, OS_LOG_TYPE_INFO)) {
              return v5;
            }
            unint64_t v50 = self->_restoreID;
            *(_DWORD *)buf = 134218242;
            unint64_t v85 = v50;
            __int16 v86 = 2112;
            id v87 = a3;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_INFO, "[%lu] Restoring in the foreground: %@", buf, 0x16u);
          }
          _MBLog();
          return v5;
        }
        if (!objc_msgSend(objc_msgSend(objc_msgSend(a3, "domain"), "name"), "isEqualToString:", @"AppDomainPlaceholder-com.apple.iBooks"))
        {
          id v31 = +[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", objc_msgSend(objc_msgSend(a3, "domain"), "name"));
          id v32 = [(MBMobileInstallation *)[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] mobileInstallation] userAppWithBundleID:v31 placeholder:0 persona:[(MBEngine *)self persona] error:0];
          if (v32)
          {
            unint64_t v75 = 0;
            if (objc_msgSend(objc_msgSend(v32, "objectForKeyedSubscript:", @"IsInstalled"), "BOOLValue"))
            {
              uint64_t v33 = MBGetDefaultLog();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                unint64_t v85 = (unint64_t)v31;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Uninstalling 2nd party factory-installed app %@", buf, 0xCu);
                unint64_t v67 = (unint64_t)v31;
                _MBLog();
              }
              [(MBMobileInstallation *)[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] mobileInstallation] uninstallAppWithBundleID:v31 error:&v75];
              if (v75)
              {
                CFStringRef v34 = MBGetDefaultLog();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  unint64_t v85 = (unint64_t)v31;
                  __int16 v86 = 2112;
                  id v87 = v75;
                  _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Error uninstalling %@ to placeholder - %@", buf, 0x16u);
                  unint64_t v67 = (unint64_t)v31;
                  id v69 = v75;
                  _MBLog();
                }
              }
            }
          }
          goto LABEL_47;
        }
      }
      else
      {
        double v47 = MBGetDefaultLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          unint64_t v48 = self->_restoreID;
          *(_DWORD *)buf = 134218242;
          unint64_t v85 = v48;
          __int16 v86 = 2112;
          id v87 = a3;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "[%lu] Not restoring system file: %@", buf, 0x16u);
          unint64_t v67 = self->_restoreID;
          id v69 = a3;
LABEL_70:
          _MBLog();
        }
LABEL_71:
        id v5 = v72;
      }
LABEL_72:
      id v8 = v5;
      uint64_t v9 = 3;
LABEL_73:
      objc_msgSend(v8, "setState:", v9, v67, v69, v71);
      return v5;
    }
  }
  double v43 = MBGetDefaultLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    unint64_t v44 = self->_restoreID;
    *(_DWORD *)buf = 134218242;
    unint64_t v85 = v44;
    __int16 v86 = 2112;
    id v87 = a3;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "[%lu] Restoring in the background: %@", buf, 0x16u);
    unint64_t v67 = self->_restoreID;
    id v69 = a3;
    _MBLog();
  }
  id v45 = -[MBServiceCache restoreIDForMode:](-[MBServiceEngine cache](self, "cache", v67, v69), "restoreIDForMode:", +[MBServiceRestoreMode backgroundFileRestoreModeWithPath:](MBServiceRestoreMode, "backgroundFileRestoreModeWithPath:", [a3 absolutePath]));
  unint64_t v46 = v5;
LABEL_87:
  [v46 setRestoreID:v45];
  return v5;
}

- (BOOL)_freeSpaceAvailableForSize:(unint64_t)a3 atURL:(id)a4 error:(id *)a5
{
  double v6 = dispatch_semaphore_create(0);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3052000000;
  uint64_t v13 = sub_1001D61DC;
  double v14 = sub_1001D61EC;
  uint64_t v15 = 0;
  uint64_t v20 = kCPFreeSpaceEffortLevelKey;
  unint64_t v21 = +[NSNumber numberWithInt:1];
  +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
  CPFreeSpaceRequestBytesAtPathWithCompletionBlock();
  MBSemaphoreWaitForever();
  dispatch_release(v6);
  id v7 = (id)v11[5];
  if (a5) {
    *a5 = (id)v11[5];
  }
  char v8 = *((unsigned char *)v17 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v8;
}

- (id)_verifyFreeSpace
{
  if ([(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isBackgroundFile])
  {
    unsigned int v3 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] path];
  }
  else
  {
    if (![(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isBackgroundApp]) {
      return 0;
    }
    if ([(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] wasCancelled]) {
      return 0;
    }
    id v9 = [(MBAppManager *)self->super.super._appManager appWithIdentifier:[(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID]];
    if (!v9) {
      return 0;
    }
    unsigned int v3 = (NSString *)[v9 containerDir];
  }
  CFStringRef v4 = +[NSURL fileURLWithPath:v3];
  uint64_t v10 = 0;
  if (!v4
    || [(MBServiceRestoreEngine *)self _freeSpaceAvailableForSize:self->_totalFileSize atURL:v4 error:&v10])
  {
    return 0;
  }
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t restoreID = self->_restoreID;
    unint64_t totalFileSize = self->_totalFileSize;
    *(_DWORD *)buf = 134218498;
    unint64_t v12 = restoreID;
    __int16 v13 = 2048;
    unint64_t v14 = totalFileSize;
    __int16 v15 = 2112;
    uint64_t v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%lu] Insufficient free space to restore %{bytes}llu at %@", buf, 0x20u);
    _MBLog();
  }
  id result = v10;
  if (!v10) {
    return +[MBError errorWithCode:105, @"Insufficient free space to restore %llu bytes at %@", self->_totalFileSize, v4 format];
  }
  return result;
}

- (id)_restoreFile:(id)a3 fromSnapshot:(id)a4 withBatch:(id)a5 restoringDirectories:(BOOL)a6
{
  BOOL v6 = a6;
  if (![a3 isPending]) {
    goto LABEL_45;
  }
  id v13 = [a3 fileID];
  id v14 = -[MBServiceCache fileForID:snapshotID:backupUDID:](-[MBServiceEngine cache](self, "cache"), "fileForID:snapshotID:backupUDID:", v13, [a4 snapshotID], -[MBServiceEngine backupUDID](self, "backupUDID"));
  if (!v14) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBServiceRestoreEngine.m", 1213, @"File not found: %@", v13 object file lineNumber description];
  }
  if ([v14 isDeleted]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBServiceRestoreEngine.m", 1214, @"File is deleted: %@", v13 object file lineNumber description];
  }
  id v15 = [(MBServiceRestoreEngine *)self _restorePathForFile:v14];
  uint64_t v16 = -[MBRestorePolicy validateRestoreDomain:relativePath:](self->_restorePolicy, "validateRestoreDomain:relativePath:", [v14 domain], objc_msgSend(v14, "relativePath"));
  if (v16) {
    goto LABEL_7;
  }
  char v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v76 = v13;
    long long v77 = v12;
    id v20 = v15;
    unint64_t restoreID = self->_restoreID;
    *(_DWORD *)buf = 134218754;
    *(void *)long long v80 = restoreID;
    id v15 = v20;
    *(_WORD *)&v80[8] = 2112;
    *(void *)&v80[10] = [v14 typeString];
    __int16 v81 = 2112;
    id v82 = v14;
    __int16 v83 = 2112;
    id v84 = [v14 fileID];
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%lu] Restoring %@: %@ (%@)", buf, 0x2Au);
    unint64_t v22 = self->_restoreID;
    id v23 = [v14 typeString];
    id v72 = v14;
    id v74 = [v14 fileID];
    unint64_t v64 = v22;
    id v68 = v23;
    id v13 = v76;
    unint64_t v12 = v77;
    _MBLog();
  }
  char v78 = 0;
  id v24 = -[MBServiceRestoreEngine _restoreParentDirectoriesOfFile:deleted:](self, "_restoreParentDirectoriesOfFile:deleted:", v14, &v78, v64, v68, v72, v74);
  if (v24)
  {
    uint64_t v25 = v24;
    if (!+[MBError isError:v24 withCode:205] || !v78)
    {
      uint64_t v17 = v25;
      goto LABEL_8;
    }
    id v26 = MBGetDefaultLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      id v27 = v13;
      unint64_t v28 = self->_restoreID;
      id v29 = [v14 typeString];
      id v30 = [v14 fileID];
      *(_DWORD *)buf = 134218754;
      *(void *)long long v80 = v28;
      *(_WORD *)&v80[8] = 2112;
      *(void *)&v80[10] = v29;
      __int16 v81 = 2112;
      id v82 = v14;
      __int16 v83 = 2112;
      id v84 = v30;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "[%lu] Not restoring %@ with deleted parent directory: %@ (%@)", buf, 0x2Au);
      unint64_t v31 = self->_restoreID;
      id v32 = [v14 typeString];
      id v73 = v14;
      id v75 = [v14 fileID];
      id v65 = (id)v31;
      id v69 = v32;
      id v13 = v27;
      _MBLog();
    }
    [(MBServiceCache *)[(MBServiceEngine *)self cache] setState:2 forFileID:v13 restoreID:self->_restoreID];
    -[MBChunkStoreProgressModel abortedTransferringItemWithSize:](-[MBChunkStore progressModel](-[MBServiceEngine chunkStore](self, "chunkStore"), "progressModel"), "abortedTransferringItemWithSize:", [v14 size]);
LABEL_45:
    uint64_t v18 = 0;
    goto LABEL_46;
  }
  if ([v14 isRegularFile])
  {
    if (objc_msgSend(objc_msgSend(v14, "digest"), "length"))
    {
      objc_msgSend(a5, "addFile:itemID:restorePath:", v14, objc_msgSend(a3, "itemID"), v15);
      goto LABEL_45;
    }
    double v56 = MBGetDefaultLog();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      id v57 = [v14 description];
      id v58 = [v14 fileID];
      *(_DWORD *)buf = 138412546;
      *(void *)long long v80 = v57;
      *(_WORD *)&v80[8] = 2112;
      *(void *)&v80[10] = v58;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_INFO, "Restoring empty regular file: %@ (%@)", buf, 0x16u);
      id v65 = [v14 description];
      id v69 = [v14 fileID];
      _MBLog();
    }
    id v59 = objc_msgSend(v14, "restoreEmptyRegularFileAtPath:settingAttributes:", -[MBServiceRestoreEngine _finalRestorePathForFile:](self, "_finalRestorePathForFile:", v14, v65, v69), 1);
    if (v59)
    {
      id v46 = v59;
      if (+[MBError isError:v59 withCode:208])
      {
        v60 = MBGetDefaultLog();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          unsigned int v61 = [v14 protectionClass];
          id v62 = [v14 absolutePath];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v80 = v61;
          *(_WORD *)&v80[4] = 2112;
          *(void *)&v80[6] = v62;
          _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Can't set protection class %d until next unlock for empty regular file at %@", buf, 0x12u);
          uint64_t v67 = [v14 protectionClass];
          id v71 = [v14 absolutePath];
          _MBLog();
        }
        -[MBServiceCache setProtectionClass:toRestoreForDomainName:relativePath:](-[MBServiceEngine cache](self, "cache", v67, v71), "setProtectionClass:toRestoreForDomainName:relativePath:", [v14 protectionClass], objc_msgSend(objc_msgSend(v14, "domain"), "name"), objc_msgSend(v14, "relativePath"));
        [(MBPersona *)[(MBEngine *)self persona] setPreferencesValue:&__kCFBooleanTrue forKey:@"NotifyDaemonNextTimeKeyBagIsUnlocked"];
        goto LABEL_44;
      }
      CFStringRef v55 = @"Error restoring empty regular file";
      goto LABEL_50;
    }
    goto LABEL_44;
  }
  if ([v14 isDirectory])
  {
    if (!v6) {
      goto LABEL_45;
    }
    uint64_t v33 = MBGetDefaultLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      CFStringRef v34 = v12;
      id v35 = v13;
      id v36 = v15;
      unint64_t v37 = self->_restoreID;
      id v38 = [v14 typeString];
      id v39 = [v14 fileID];
      *(_DWORD *)buf = 134218754;
      *(void *)long long v80 = v37;
      id v15 = v36;
      *(_WORD *)&v80[8] = 2112;
      *(void *)&v80[10] = v38;
      __int16 v81 = 2112;
      id v82 = v14;
      __int16 v83 = 2112;
      id v84 = v39;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_INFO, "[%lu] Restoring %@: %@ (%@)", buf, 0x2Au);
      unint64_t v40 = self->_restoreID;
      id v41 = [v14 typeString];
      id v73 = v14;
      id v75 = [v14 fileID];
      id v65 = (id)v40;
      id v69 = v41;
      id v13 = v35;
      unint64_t v12 = v34;
      _MBLog();
    }
    unint64_t v42 = MBGetDefaultLog();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      id v43 = [v14 description];
      id v44 = [v14 fileID];
      *(_DWORD *)buf = 138412546;
      *(void *)long long v80 = v43;
      *(_WORD *)&v80[8] = 2112;
      *(void *)&v80[10] = v44;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_INFO, "Restoring directory: %@ (%@)", buf, 0x16u);
      id v65 = [v14 description];
      id v69 = [v14 fileID];
      _MBLog();
    }
    id v45 = objc_msgSend(v14, "restoreDirectoryAtPath:settingDataProtection:settingOwnershipAndFlags:", v15, 1, 1, v65, v69, v73, v75);
    if (v45)
    {
      id v46 = v45;
      if (+[MBError isError:v45 withCode:208])
      {
        double v47 = MBGetDefaultLog();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          unsigned int v48 = [v14 protectionClass];
          id v49 = [v14 absolutePath];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)long long v80 = v48;
          *(_WORD *)&v80[4] = 2112;
          *(void *)&v80[6] = v49;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Can't set protection class %d until next unlock for directory at %@", buf, 0x12u);
          uint64_t v66 = [v14 protectionClass];
          id v70 = [v14 absolutePath];
          _MBLog();
        }
        -[MBServiceCache setProtectionClass:toRestoreForDomainName:relativePath:](-[MBServiceEngine cache](self, "cache", v66, v70), "setProtectionClass:toRestoreForDomainName:relativePath:", [v14 protectionClass], objc_msgSend(objc_msgSend(v14, "domain"), "name"), objc_msgSend(v14, "relativePath"));
        goto LABEL_44;
      }
      CFStringRef v55 = @"Error restoring directory";
LABEL_50:
      id v54 = v46;
LABEL_51:
      uint64_t v16 = +[MBError errorWithCode:100 error:v54 format:v55];
      goto LABEL_7;
    }
LABEL_44:
    [(MBServiceCache *)[(MBServiceEngine *)self cache] setState:1 forFileID:v13 restoreID:self->_restoreID];
    goto LABEL_45;
  }
  if ([v14 isSymbolicLink])
  {
    unint64_t v50 = MBGetDefaultLog();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      id v51 = [v14 description];
      id v52 = [v14 fileID];
      *(_DWORD *)buf = 138412546;
      *(void *)long long v80 = v51;
      *(_WORD *)&v80[8] = 2112;
      *(void *)&v80[10] = v52;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Restoring symbolic link: %@ (%@)", buf, 0x16u);
      id v65 = [v14 description];
      id v69 = [v14 fileID];
      _MBLog();
    }
    id v53 = objc_msgSend(v14, "restoreSymbolicLinkAtPath:withTarget:settingOwnershipAndFlags:", v15, objc_msgSend(v14, "target", v65, v69), 1);
    if (!v53) {
      goto LABEL_44;
    }
    id v54 = v53;
    CFStringRef v55 = @"Error restoring symbolic link";
    goto LABEL_51;
  }
  uint64_t v16 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 205, [v14 description], @"Invalid file type");
LABEL_7:
  uint64_t v17 = v16;
LABEL_8:
  uint64_t v18 = v17;
LABEL_46:
  return v18;
}

- (id)_restoreFilesFromSnapshot:(id)a3 restoringDirectories:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = [a3 snapshotID];
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t restoreID = self->_restoreID;
    *(_DWORD *)buf = 134218240;
    unint64_t v30 = restoreID;
    __int16 v31 = 2048;
    uint64_t v32 = v21;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%lu] Restoring files from snapshot %lu", buf, 0x16u);
    unint64_t v18 = self->_restoreID;
    uint64_t v19 = v21;
    _MBLog();
  }
  id v9 = 0;
  for (uint64_t i = 0; ; uint64_t i = v23)
  {
    if (!v9) {
      id v9 = +[MBSRestoreBatch batchWithCache:[(MBServiceEngine *)self cache]];
    }
    id v11 = [(MBServiceCache *)[(MBServiceEngine *)self cache] restoreFilesForSnapshotID:v21 backupUDID:[(MBServiceEngine *)self backupUDID] restoreID:self->_restoreID pendingOnly:v4 offset:i limit:100];
    if (![v11 count]) {
      break;
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    unint64_t v12 = (char *)[v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v25;
LABEL_9:
      uint64_t v14 = 0;
      id v23 = &i[(void)v12];
      while (1)
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = [(MBServiceRestoreEngine *)self _restoreFile:*(void *)(*((void *)&v24 + 1) + 8 * v14) fromSnapshot:a3 withBatch:v9 restoringDirectories:v4];
        if (v15) {
          break;
        }
        if ([(MBSRestoreBatch *)v9 full])
        {
          id v23 = &i[v14];
          goto LABEL_19;
        }
        if (v12 == (char *)++v14)
        {
          unint64_t v12 = (char *)[v11 countByEnumeratingWithState:&v24 objects:v28 count:16];
          uint64_t i = v23;
          if (v12) {
            goto LABEL_9;
          }
          goto LABEL_19;
        }
      }
LABEL_23:

      goto LABEL_24;
    }
    id v23 = i;
LABEL_19:
    if ([(MBSRestoreBatch *)v9 full])
    {
      id v15 = -[MBServiceRestoreEngine _pipelineRestoringBatch:snapshotID:](self, "_pipelineRestoringBatch:snapshotID:", v9, [a3 snapshotID]);
      if (v15) {
        goto LABEL_23;
      }

      id v9 = +[MBSRestoreBatch batchWithCache:[(MBServiceEngine *)self cache]];
    }
  }
  if ([(MBSRestoreBatch *)v9 count]
    && (id v15 = -[MBServiceRestoreEngine _pipelineRestoringBatch:snapshotID:](self, "_pipelineRestoringBatch:snapshotID:", v9, [a3 snapshotID])) != 0)
  {
  }
  else
  {
    [(MBServiceCache *)[(MBServiceEngine *)self cache] end];
    id v17 = [(MBServiceRestoreEngine *)self _drainBatchPipeline];
    if (v17) {
      id v15 = v17;
    }
    else {
      id v15 = 0;
    }

    [(MBServiceCache *)[(MBServiceEngine *)self cache] begin];
  }
LABEL_24:
  return v15;
}

- (id)_restoreFilesFromSnapshots
{
  BOOL v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t restoreID = self->_restoreID;
    unint64_t totalFileCount = self->_totalFileCount;
    unint64_t totalFileSize = self->_totalFileSize;
    *(_DWORD *)buf = 134218496;
    *(void *)&uint8_t buf[4] = restoreID;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = totalFileCount;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v32 = (void (*)(uint64_t, uint64_t))totalFileSize;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%lu] Starting to restore %lu files of size %{bytes}llu", buf, 0x20u);
    unint64_t v22 = self->_totalFileCount;
    unint64_t v23 = self->_totalFileSize;
    unint64_t v21 = self->_restoreID;
    _MBLog();
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v9 = v8;
  if (![(MBDebugContext *)[(MBEngine *)self debugContext] isFlagSet:@"SimulateTransientErrorAtBeginningOfRestore"])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3052000000;
    uint64_t v32 = sub_1001D61DC;
    uint64_t v33 = sub_1001D61EC;
    uint64_t v34 = 0;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1001D9774;
    v24[3] = &unk_100414970;
    v24[4] = self;
    v24[5] = buf;
    MBPerformOnMBSCachePoolSerialQueue(v24);
    uint64_t v10 = *(MBError **)(*(void *)&buf[8] + 40);
    if (!v10)
    {
      id v11 = [(MBServiceRestoreEngine *)self _propertiesPath];
      if (v11
        && -[NSFileManager fileExistsAtPath:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "fileExistsAtPath:", v11)&& (objc_msgSend(-[MBDebugContext valueForName:](self->super.super._debugContext, "valueForName:", @"DontWriteProperties"), "BOOLValue") & 1) == 0&& (self->super.super._properties, unint64_t v12 = +[MBProperties propertiesWithFile:error:](MBProperties, "propertiesWithFile:error:", v11, *(void *)&buf[8] + 40), (self->super.super._properties = v12) == 0))
      {
        uint64_t v13 = +[MBError errorWithCode:205 error:*(void *)(*(void *)&buf[8] + 40) format:@"Error loading backup properties"];
      }
      else
      {
        if (![(MBDebugContext *)[(MBEngine *)self debugContext] isFlagSet:@"SimulateErrorAtEndOfRestore"])
        {
          +[NSDate timeIntervalSinceReferenceDate];
          double v15 = v14;
          uint64_t v16 = MBGetDefaultLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            double v17 = v15 - v9;
            unint64_t v18 = self->_restoreID;
            unint64_t v19 = (unint64_t)((double)self->_totalFileSize / v17);
            *(_DWORD *)long long v25 = 134218496;
            unint64_t v26 = v18;
            __int16 v27 = 2048;
            double v28 = v17;
            __int16 v29 = 2048;
            unint64_t v30 = v19;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "[%lu] Finished restoring files in %0.3f at %{bytes}llu/s", v25, 0x20u);
            _MBLog();
          }
          uint64_t v10 = 0;
          goto LABEL_16;
        }
        uint64_t v13 = +[MBError errorWithCode:1 format:@"Simulated error at end of restore"];
      }
      uint64_t v10 = v13;
    }
LABEL_16:
    _Block_object_dispose(buf, 8);
    goto LABEL_17;
  }
  uint64_t v10 = +[MBError errorWithCode:305 format:@"Simulated error at beginning of restore"];
LABEL_17:
  return v10;
}

- (id)_baseRestorePathForDomain:(id)a3
{
  unsigned int v5 = [a3 shouldRestoreToSharedVolume];
  BOOL v6 = [(MBEngine *)self persona];
  if (v5) {
    id v7 = [(MBPersona *)v6 sharedIncompleteRestoreDirectory];
  }
  else {
    id v7 = [(MBPersona *)v6 userIncompleteRestoreDirectory];
  }
  double v8 = v7;
  id v9 = [a3 rootPath];
  return [v8 stringByAppendingPathComponent:v9];
}

- (id)_finalRestorePathForFile:(id)a3
{
  id v4 = -[MBServiceRestoreEngine _baseRestorePathForDomain:](self, "_baseRestorePathForDomain:", [a3 domain]);
  id v5 = [a3 relativePath];
  return [v4 stringByAppendingPathComponent:v5];
}

- (id)_encryptedRestorePathForFile:(id)a3
{
  id v3 = [(MBServiceRestoreEngine *)self _finalRestorePathForFile:a3];
  return [v3 stringByAppendingPathExtension:@"encrypted"];
}

- (id)_restorePathForFile:(id)a3
{
  if ([a3 encryptionKey])
  {
    return [(MBServiceRestoreEngine *)self _encryptedRestorePathForFile:a3];
  }
  else
  {
    return [(MBServiceRestoreEngine *)self _finalRestorePathForFile:a3];
  }
}

- (id)_restoreParentDirectoriesOfFile:(id)a3 deleted:(BOOL *)a4
{
  id v30 = 0;
  if (objc_msgSend(objc_msgSend(a3, "relativePath"), "length"))
  {
    id v7 = objc_msgSend(objc_msgSend(a3, "relativePath"), "stringByDeletingLastPathComponent");
    id v8 = objc_msgSend(-[MBServiceRestoreEngine _baseRestorePathForDomain:](self, "_baseRestorePathForDomain:", objc_msgSend(a3, "domain")), "stringByAppendingPathComponent:", v7);
    id v9 = +[MBFileID fileIDWithDomain:relativePath:](MBFileID, "fileIDWithDomain:relativePath:", [a3 domain], v7);
    id result = -[MBRestorePolicy validateRestoreDomain:relativePath:](self->_restorePolicy, "validateRestoreDomain:relativePath:", [a3 domain], v7);
    id v30 = result;
    if (result) {
      return result;
    }
    if ([+[NSFileManager defaultManager] fileExistsAtPath:v8])
    {
      id v11 = MBGetDefaultLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        unint64_t restoreID = self->_restoreID;
        *(_DWORD *)buf = 134218498;
        id v32 = (id)restoreID;
        __int16 v33 = 2112;
        id v34 = a3;
        __int16 v35 = 2112;
        id v36 = v9;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%lu] Parent directory already restored: %@ (%@)", buf, 0x20u);
        _MBLog();
      }
      return 0;
    }
    id v19 = [(MBServiceCache *)[(MBServiceEngine *)self cache] restoreFileForFileID:v9];
    if (v19)
    {
      id v20 = -[MBServiceCache fileForID:snapshotID:backupUDID:](-[MBServiceEngine cache](self, "cache"), "fileForID:snapshotID:backupUDID:", v9, [v19 snapshotID], -[MBServiceEngine backupUDID](self, "backupUDID"));
      if (v20)
      {
        unint64_t v21 = v20;
        if ([v20 isDeleted])
        {
          if (a4) {
            *a4 = 1;
          }
          id v22 = [a3 description];
          CFStringRef v23 = @"Parent directory deleted";
          goto LABEL_31;
        }
        if ([v21 isDirectory])
        {
          id result = [(MBServiceRestoreEngine *)self _restoreParentDirectoriesOfFile:v21 deleted:a4];
          id v30 = result;
          if (!result)
          {
            __int16 v27 = MBGetDefaultLog();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v32 = [v21 description];
              __int16 v33 = 2112;
              id v34 = [v21 fileID];
              _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Restoring directory: %@ (%@)", buf, 0x16u);
              id v28 = [v21 description];
              id v29 = [v21 fileID];
              _MBLog();
            }
            id result = objc_msgSend(v21, "restoreDirectoryAtPath:settingDataProtection:settingOwnershipAndFlags:", -[MBServiceRestoreEngine _restorePathForFile:](self, "_restorePathForFile:", v21, v28, v29), 0, 1);
            id v30 = result;
            if (result) {
              return +[MBError errorWithCode:100 error:result format:@"Error restoring directory"];
            }
          }
          return result;
        }
        id v22 = [a3 description];
        CFStringRef v23 = @"Parent file isn't a directory";
      }
      else
      {
        id v22 = [a3 description];
        CFStringRef v23 = @"Parent directory not found";
      }
LABEL_31:
      return +[MBError errorWithCode:205 path:v22 format:v23];
    }
    long long v24 = MBGetDefaultLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v25 = self->_restoreID;
      *(_DWORD *)buf = 134218242;
      id v32 = (id)v25;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "[%lu] Creating directory not in restore files: %@", buf, 0x16u);
      id v28 = self->_restoreID;
      id v29 = v8;
      _MBLog();
    }
    unsigned __int8 v26 = [+[NSFileManager defaultManager] createDirectoryAtPath:v8 withIntermediateDirectories:1 attributes:0 error:&v30];
    id result = 0;
    if ((v26 & 1) == 0)
    {
      id v17 = v30;
      id v18 = v8;
      return +[MBError errorWithCode:100 error:v17 path:v18 format:@"Error creating directory"];
    }
  }
  else
  {
    id v13 = objc_msgSend(-[MBServiceRestoreEngine _baseRestorePathForDomain:](self, "_baseRestorePathForDomain:", objc_msgSend(a3, "domain")), "stringByDeletingLastPathComponent");
    double v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      unint64_t v15 = self->_restoreID;
      *(_DWORD *)buf = 134218242;
      id v32 = (id)v15;
      __int16 v33 = 2112;
      id v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%lu] Creating directory: %@", buf, 0x16u);
      id v28 = self->_restoreID;
      id v29 = v13;
      _MBLog();
    }
    unsigned __int8 v16 = [+[NSFileManager defaultManager] createDirectoryAtPath:v13 withIntermediateDirectories:1 attributes:0 error:&v30];
    id result = 0;
    if ((v16 & 1) == 0)
    {
      id v17 = v30;
      id v18 = v13;
      return +[MBError errorWithCode:100 error:v17 path:v18 format:@"Error creating directory"];
    }
  }
  return result;
}

- (id)_pipelineRestoringBatch:(id)a3 snapshotID:(unint64_t)a4
{
  id v50 = 0;
  BOOL v6 = MBGetDefaultLog();
  unint64_t v40 = self;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    unint64_t restoreID = self->_restoreID;
    *(_DWORD *)buf = 134218496;
    unint64_t v54 = restoreID;
    __int16 v55 = 2048;
    id v56 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "itemCount");
    __int16 v57 = 2048;
    id v58 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%lu] Pipelining restoring batch of %lu files of size %{bytes}llu", buf, 0x20u);
    unint64_t v8 = self->_restoreID;
    id v36 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "itemCount");
    id v37 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
    unint64_t v34 = v8;
    _MBLog();
    self = v40;
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] end];
  if ([(MBDebugContext *)v40->super.super._debugContext isFlagSet:@"SimulateLockTimeoutOnGetFiles"])
  {
    id v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Releasing locks to simulate lock timeout while getting files", buf, 2u);
      _MBLog();
    }
    [(MBService *)v40->super._service removeLockForBackupUDID:[(MBServiceEngine *)v40 backupUDID]];
  }
  uint64_t v10 = [(MBServiceEngine *)v40 service];
  uint64_t v11 = (uint64_t)[a3 serviceFileIDs];
  id v12 = [(MBService *)v10 getFileIDs:v11 backupUDID:[(MBServiceEngine *)v40 backupUDID] snapshotID:a4 lastModified:0 error:&v50];
  if (!v12)
  {
    id v29 = [v50 code];
    uint64_t v11 = +[MBError errorWithCode:v29 error:v50 format:@"Error getting file auth-tokens from service"];
    lastBatch = 0;
    goto LABEL_35;
  }
  id v13 = +[NSMutableDictionary dictionary];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  long long v46 = 0u;
  id v14 = [v12 countByEnumeratingWithState:&v46 objects:v52 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v47;
LABEL_10:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v47 != v15) {
        objc_enumerationMutation(v12);
      }
      id v17 = *(void **)(*((void *)&v46 + 1) + 8 * v16);
      if ([v17 fileID] && objc_msgSend(v17, "authToken"))
      {
        id v19 = -[MBFileID initWithData:]([MBFileID alloc], "initWithData:", [v17 fileID]);
        objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(v17, "authToken"), v19);

        uint64_t v11 = 1;
      }
      else
      {
        uint64_t v11 = 0;
        id v50 = +[MBError errorWithCode:309 format:@"Response does not contain file ID and auth-token"];
      }
      if (!v11) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = [v12 countByEnumeratingWithState:&v46 objects:v52 count:16];
        if (v14) {
          goto LABEL_10;
        }
        break;
      }
    }
  }
  id v20 = v50;
  if (v50) {
    goto LABEL_33;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v21 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "items");
  id v22 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v43;
LABEL_23:
    uint64_t v24 = 0;
    while (1)
    {
      if (*(void *)v43 != v23) {
        objc_enumerationMutation(v21);
      }
      unint64_t v25 = *(void **)(*((void *)&v42 + 1) + 8 * v24);
      id v27 = objc_msgSend(v13, "objectForKeyedSubscript:", objc_msgSend(v25, "fileID"));
      if (v27)
      {
        [v25 setAuthToken:v27];
      }
      else
      {
        uint64_t v11 = (uint64_t)MBError;
        id v50 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, @"Response missing auth-token for file: %@ (%@)", [v25 path], objc_msgSend(v25, "fileID"));
      }
      if (!v27) {
        break;
      }
      if (v22 == (id)++v24)
      {
        id v22 = [v21 countByEnumeratingWithState:&v42 objects:v51 count:16];
        if (v22) {
          goto LABEL_23;
        }
        break;
      }
    }
  }
  id v20 = v50;
  if (v50)
  {
LABEL_33:
    lastBatch = 0;
    uint64_t v11 = (uint64_t)v20;
LABEL_35:
    int v30 = 0;
    goto LABEL_36;
  }
  lastBatch = v40->_lastBatch;
  if (lastBatch)
  {
    id v32 = MBGetDefaultLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = 160;
      unint64_t v33 = v40->_restoreID;
      *(_DWORD *)buf = 134217984;
      unint64_t v54 = v33;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%lu] Waiting for last batch", buf, 0xCu);
      unint64_t v35 = v40->_restoreID;
      _MBLog();
    }
    MBSemaphoreWaitForever();
  }
  if ([(MBSRestoreBatch *)lastBatch error]
    || [(MBSRestoreBatch *)lastBatch firstItemError])
  {
    v40->_lastBatch = 0;
  }
  else
  {
    v40->_lastBatch = (MBSRestoreBatch *)a3;
    +[NSDate timeIntervalSinceReferenceDate];
    objc_msgSend(a3, "setStartTime:");
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1001DA758;
    v41[3] = &unk_100415EA8;
    v41[4] = v40;
    v41[5] = a3;
    v41[6] = a2;
    -[MBChunkStore getBatch:block:](-[MBServiceEngine chunkStore](v40, "chunkStore"), "getBatch:block:", [a3 chunkStoreBatch], v41);
  }
  int v30 = 1;
LABEL_36:
  [(MBServiceCache *)[(MBServiceEngine *)v40 cache] begin];
  if (v30)
  {
    if (!lastBatch) {
      return 0;
    }
    id v50 = [(MBServiceRestoreEngine *)v40 _processCompletedBatch:lastBatch];

    uint64_t v11 = (uint64_t)v50;
    if (!v50) {
      return 0;
    }
  }
  return (id)v11;
}

- (void)_checkForItemErrorsInCompletedBatch:(id)a3
{
  id v3 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "items");
  id v5 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v34;
    uint64_t v29 = *(void *)v34;
    id v30 = v3;
    do
    {
      unint64_t v8 = 0;
      id v31 = v6;
      do
      {
        if (*(void *)v34 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v33 + 1) + 8 * (void)v8);
        if ([v9 error])
        {
          unsigned int v10 = -[MBServiceRetryStrategy canRetryAfterError:](-[MBServiceEngine retryStrategy](self, "retryStrategy"), "canRetryAfterError:", [v9 error]);
          uint64_t v11 = MBGetDefaultLog();
          id v12 = v11;
          if (v10)
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t restoreID = self->_restoreID;
              id v14 = [v9 path];
              id v15 = [v9 fileID];
              id v16 = +[MBError descriptionForError:](MBError, "descriptionForError:", [v9 error]);
              *(_DWORD *)buf = 134218754;
              unint64_t v38 = restoreID;
              __int16 v39 = 2112;
              id v40 = v14;
              __int16 v41 = 2112;
              id v42 = v15;
              __int16 v43 = 2112;
              id v44 = v16;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[%lu] Error getting item from chunk store: %@ (%@): %@", buf, 0x2Au);
              unint64_t v17 = self->_restoreID;
              uint64_t v7 = v29;
              id v18 = [v9 path];
              id v6 = v31;
              id v27 = [v9 fileID];
              id v28 = +[MBError descriptionForError:](MBError, "descriptionForError:", [v9 error]);
              unint64_t v25 = v17;
              id v26 = v18;
              id v3 = v30;
              _MBLog();
            }
            if (!objc_msgSend(v3, "firstItemError", v25, v26, v27, v28)) {
              goto LABEL_16;
            }
          }
          else
          {
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              unint64_t v19 = self->_restoreID;
              id v20 = [v9 path];
              id v21 = [v9 fileID];
              id v22 = +[MBError descriptionForError:](MBError, "descriptionForError:", [v9 error]);
              *(_DWORD *)buf = 134218754;
              unint64_t v38 = v19;
              uint64_t v7 = v29;
              __int16 v39 = 2112;
              id v40 = v20;
              __int16 v41 = 2112;
              id v42 = v21;
              __int16 v43 = 2112;
              id v44 = v22;
              _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "[%lu] Error getting item from chunk store: %@ (%@): %@", buf, 0x2Au);
              unint64_t v23 = self->_restoreID;
              id v24 = [v9 path];
              id v6 = v31;
              id v27 = [v9 fileID];
              id v28 = +[MBError descriptionForError:](MBError, "descriptionForError:", [v9 error]);
              unint64_t v25 = v23;
              id v26 = v24;
              id v3 = v30;
              _MBLog();
            }
            if (!objc_msgSend(v3, "firstItemError", v25, v26, v27, v28)
              || -[MBServiceRetryStrategy canRetryAfterError:](-[MBServiceEngine retryStrategy](self, "retryStrategy"), "canRetryAfterError:", [v3 firstItemError]))
            {
LABEL_16:
              objc_msgSend(v3, "setFirstItemError:", objc_msgSend(v9, "error"));
            }
          }
        }
        unint64_t v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [obj countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v6);
  }
}

- (id)_decryptFile:(id)a3 restorePath:(id)a4
{
  long long v36 = 0;
  if ([(MBDebugContext *)self->super.super._debugContext isFlagSet:@"SimulateDecryptFileError"])
  {
    uint64_t v7 = MBGetDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.st_dev) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Simulated file decryption error", (uint8_t *)&buf, 2u);
      _MBLog();
    }
    return +[MBError errorWithCode:205 path:a4 format:@"Simulated file decryption error"];
  }
  id result = [a3 encryptionKey];
  if (!result) {
    return result;
  }
  id v9 = [(MBServiceRestoreEngine *)self _encryptedRestorePathForFile:a3];
  memset(&buf, 0, sizeof(buf));
  if (!stat((const char *)[a4 fileSystemRepresentation], &buf))
  {
    id v10 = [a3 lastModified];
    if (v10 == (id)buf.st_mtimespec.tv_sec)
    {
      id v11 = [a3 decryptedSize];
      if (v11 == (id)buf.st_size)
      {
        id v12 = MBGetDefaultLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          id v13 = [a3 relativePath];
          *(_DWORD *)id v37 = 138412290;
          id v38 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Duplicate file has already been decrypted: %@", v37, 0xCu);
          id v32 = [a3 relativePath];
          _MBLog();
        }
        if (![+[NSFileManager defaultManager] fileExistsAtPath:v9])return 0; {
        id v14 = MBGetDefaultLog();
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          id v15 = [a3 relativePath];
          *(_DWORD *)id v37 = 138412290;
          id v38 = v15;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Removing encrypted source for duplicate file: %@", v37, 0xCu);
          id v33 = [a3 relativePath];
          _MBLog();
        }
        if ([+[NSFileManager defaultManager] removeItemAtPath:v9 error:&v36])
        {
          return 0;
        }
        else
        {
          return v36;
        }
      }
    }
  }
  id v16 = [(NSArray *)[(NSDictionary *)self->_keybagsByID allKeys] mutableCopy];
  id v17 = -[NSDictionary objectForKeyedSubscript:](self->_keybagsByID, "objectForKeyedSubscript:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [a3 keybagID]));
  objc_msgSend(v16, "removeObjectIdenticalTo:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(a3, "keybagID")));
  id v34 = v9;
  while (1)
  {
    long long v36 = 0;
    if (!v17)
    {
      id v22 = +[MBError errorWithCode:path:format:](MBError, "errorWithCode:path:format:", 205, a4, @"No keybag found with ID %d", [a3 keybagID]);
LABEL_32:
      long long v36 = v22;
      goto LABEL_33;
    }
    if ([a3 encryptionKeyVersion] && objc_msgSend(a3, "encryptionKeyVersion") != (id)1) {
      break;
    }
    id v18 = +[MBEncryptedFileHandle encryptedFileHandleForRestoreWithPath:keybag:key:error:](MBEncryptedFileHandle, "encryptedFileHandleForRestoreWithPath:keybag:key:error:", a4, v17, [a3 encryptionKey], &v36);
    unint64_t v19 = v18;
    if (!v18)
    {
      id v24 = MBGetDefaultLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Unable to open file to decrypt", v37, 2u);
        _MBLog();
      }
      id v22 = +[MBError errorWithCode:205 error:v36 format:@"Error opening file to decrypt"];
      goto LABEL_32;
    }
    if ([v18 readFromPath:v9 error:&v36])
    {
      int v20 = 0;
      int v21 = 1;
    }
    else
    {
      uint64_t v29 = MBGetDefaultLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Unable to decrypt file, trying next key bag", v37, 2u);
        _MBLog();
      }
      int v21 = 0;
      long long v36 = +[MBError errorWithCode:205 error:v36 format:@"Error decrypting file"];
      int v20 = 16;
    }
    [v19 closeWithError:0];
    if (v21)
    {
      if (![+[NSFileManager defaultManager] removeItemAtPath:v34 error:&v36])
      {
        id v30 = MBGetDefaultLog();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v37 = 0;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Unable to remove encrypted file (fatal)", v37, 2u);
          _MBLog();
        }
        return +[MBError errorWithCode:100 error:v36 format:@"Error removing encrypted file"];
      }
      return v36;
    }
    id v9 = v34;
    if (v20 != 16) {
      return v36;
    }
LABEL_33:
    BOOL v25 = [v16 count] == 0;
    id v26 = MBGetDefaultLog();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
    if (v25)
    {
      if (v27)
      {
        *(_WORD *)id v37 = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "No keybags left to try.", v37, 2u);
        _MBLog();
      }
      return v36;
    }
    if (v27)
    {
      id v28 = [v16 count];
      *(_DWORD *)id v37 = 134217984;
      id v38 = v28;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Unable to decrypt with assigned keybag, trying next available keybag (%lu left).", v37, 0xCu);
      id v32 = [v16 count];
      _MBLog();
    }
    id v17 = -[NSDictionary objectForKeyedSubscript:](self->_keybagsByID, "objectForKeyedSubscript:", objc_msgSend(v16, "objectAtIndexedSubscript:", 0, v32));
    [v16 removeObjectAtIndex:0];
  }
  if (!+[MBKeyBagFile decryptFileWithPath:keybag:encryptionKey:size:error:](MBKeyBagFile, "decryptFileWithPath:keybag:encryptionKey:size:error:", v9, v17, [a3 encryptionKey], objc_msgSend(a3, "decryptedSize"), &v36))
  {
    unint64_t v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Unable to decrypt file, trying next key bag", v37, 2u);
      _MBLog();
    }
    id v22 = +[MBError errorWithCode:205 error:v36 path:a4 format:@"Error decrypting file"];
    goto LABEL_32;
  }
  [+[NSFileManager defaultManager] removeItemAtPath:a4 error:0];
  if ([+[NSFileManager defaultManager] moveItemAtPath:v9 toPath:a4 error:&v36])
  {
    return v36;
  }
  id v31 = MBGetDefaultLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v37 = 0;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Unable to move decrypted file into place (fatal)", v37, 2u);
    _MBLog();
  }
  return +[MBError errorWithCode:100 error:v36 format:@"Error moving decrypted file into place"];
}

- (id)_processCompletedBatch:(id)a3
{
  if ([a3 error])
  {
    id v5 = objc_msgSend(objc_msgSend(a3, "error"), "copy");
    return v5;
  }
  uint64_t v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    unint64_t restoreID = self->_restoreID;
    *(_DWORD *)stat buf = 134217984;
    *(void *)unint64_t v64 = restoreID;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%lu] Processing completed batch", buf, 0xCu);
    unint64_t v56 = self->_restoreID;
    _MBLog();
  }
  if (!objc_msgSend(a3, "count", v56)) {
    goto LABEL_25;
  }
  uint64_t v9 = 0;
  while (1)
  {
    id v11 = objc_msgSend(objc_msgSend(a3, "files"), "objectAtIndexedSubscript:", v9);
    if (!objc_msgSend(objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "itemAtIndex:", v9), "error")) {
      break;
    }
LABEL_24:
    if (++v9 >= (unint64_t)[a3 count]) {
      goto LABEL_25;
    }
  }
  id v12 = [(MBServiceRestoreEngine *)self _finalRestorePathForFile:v11];
  id v13 = (MBError *)-[MBRestorePolicy validateRestoreDomain:relativePath:](self->_restorePolicy, "validateRestoreDomain:relativePath:", [v11 domain], objc_msgSend(v11, "relativePath"));
  if (v13)
  {
    id v15 = v13;
LABEL_32:
    goto LABEL_33;
  }
  id v14 = (MBError *)[(MBServiceRestoreEngine *)self _decryptFile:v11 restorePath:v12];
  if (v14)
  {
    id v15 = v14;
    if (![(MBDebugContext *)self->super.super._debugContext isFlagSet:@"IgnoreDecryptionErrors"])goto LABEL_32; {
    id v16 = MBGetDefaultLog();
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = objc_msgSend(objc_msgSend(v11, "domain"), "name");
      id v18 = [v11 relativePath];
      *(_DWORD *)stat buf = 138412546;
      *(void *)unint64_t v64 = v17;
      *(_WORD *)&v64[8] = 2112;
      *(void *)&v64[10] = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Ignoring decryption error for %@:%@", buf, 0x16u);
      unint64_t v57 = (unint64_t)objc_msgSend(objc_msgSend(v11, "domain"), "name");
      id v58 = [v11 relativePath];
      _MBLog();
    }
LABEL_23:
    -[MBServiceCache setState:forFileID:restoreID:](-[MBServiceEngine cache](self, "cache", v57, v58), "setState:forFileID:restoreID:", 1, [v11 fileID], self->_restoreID);
    goto LABEL_24;
  }
  unint64_t v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    id v20 = [v11 description];
    id v21 = [v11 fileID];
    *(_DWORD *)stat buf = 138412546;
    *(void *)unint64_t v64 = v20;
    *(_WORD *)&v64[8] = 2112;
    *(void *)&v64[10] = v21;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Restoring regular file: %@ (%@)", buf, 0x16u);
    unint64_t v57 = (unint64_t)[v11 description];
    id v58 = [v11 fileID];
    _MBLog();
  }
  id v22 = (MBError *)objc_msgSend(v11, "restoreRegularFileAtPath:settingAttributes:", v12, 1, v57);
  if (v22)
  {
    id v15 = v22;
    if (!+[MBError isError:v22 withCode:208]) {
      goto LABEL_32;
    }
    unint64_t v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      unsigned int v24 = [v11 protectionClass];
      id v25 = [v11 absolutePath];
      *(_DWORD *)stat buf = 67109378;
      *(_DWORD *)unint64_t v64 = v24;
      *(_WORD *)&v64[4] = 2112;
      *(void *)&v64[6] = v25;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Can't set protection class %d until next unlock for regular file at %@", buf, 0x12u);
      unint64_t v57 = [v11 protectionClass];
      id v58 = [v11 absolutePath];
      _MBLog();
    }
    -[MBServiceCache setProtectionClass:toRestoreForDomainName:relativePath:](-[MBServiceEngine cache](self, "cache", v57), "setProtectionClass:toRestoreForDomainName:relativePath:", [v11 protectionClass], objc_msgSend(objc_msgSend(v11, "domain"), "name"), objc_msgSend(v11, "relativePath"));

    [(MBPersona *)[(MBEngine *)self persona] setPreferencesValue:&__kCFBooleanTrue forKey:@"NotifyDaemonNextTimeKeyBagIsUnlocked"];
  }
  signed int v26 = [(MBDebugContext *)self->super.super._debugContext intForName:@"ProcessCompletedBatchErrorCode"];
  if (!v26) {
    goto LABEL_23;
  }
  id v15 = +[MBError errorWithCode:v26 format:@"Simulated error for debug context"];
  if (v15)
  {
LABEL_33:
    BOOL v27 = v15;
    return v27;
  }
LABEL_25:
  if ([a3 firstItemError])
  {
    BOOL v27 = (MBError *)objc_msgSend(objc_msgSend(a3, "firstItemError"), "copy");
    return v27;
  }
  else
  {
    id v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v29 = self->_restoreID;
      id v30 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "itemCount");
      id v31 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
      +[NSDate timeIntervalSinceReferenceDate];
      double v33 = v32;
      [a3 startTime];
      double v35 = v33 - v34;
      double v36 = (double)(unint64_t)objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
      +[NSDate timeIntervalSinceReferenceDate];
      double v38 = v37;
      [a3 startTime];
      unint64_t v40 = (unint64_t)(v36 / (v38 - v39));
      [(MBChunkStoreProgressModel *)[(MBChunkStore *)[(MBServiceEngine *)self chunkStore] progressModel] progress];
      *(_DWORD *)stat buf = 134219264;
      *(void *)unint64_t v64 = v29;
      *(_WORD *)&v64[8] = 2048;
      *(void *)&v64[10] = v30;
      __int16 v65 = 2048;
      id v66 = v31;
      __int16 v67 = 2048;
      double v68 = v35;
      __int16 v69 = 2048;
      unint64_t v70 = v40;
      __int16 v71 = 2048;
      double v72 = v41 * 100.0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "[%lu] Restored batch of %lu files of size %{bytes}llu in %0.1f s at %{bytes}llu/s (%0.1f%%)", buf, 0x3Eu);
      unint64_t v42 = self->_restoreID;
      id v43 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "itemCount");
      id v44 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
      +[NSDate timeIntervalSinceReferenceDate];
      double v46 = v45;
      [a3 startTime];
      double v48 = v46 - v47;
      double v49 = (double)(unint64_t)objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
      +[NSDate timeIntervalSinceReferenceDate];
      double v51 = v50;
      [a3 startTime];
      unint64_t v53 = (unint64_t)(v49 / (v51 - v52));
      [(MBChunkStoreProgressModel *)[(MBChunkStore *)[(MBServiceEngine *)self chunkStore] progressModel] progress];
      double v62 = v54 * 100.0;
      unint64_t v61 = v53;
      double v60 = v48;
      id v58 = v43;
      id v59 = v44;
      unint64_t v57 = v42;
      _MBLog();
    }
    id result = [(MBServiceRetryStrategy *)[(MBServiceEngine *)self retryStrategy] consecutiveRetryCount];
    if (result)
    {
      __int16 v55 = [(MBServiceEngine *)self retryStrategy];
      [(MBServiceRetryStrategy *)v55 setConsecutiveRetryCount:(char *)[(MBServiceRetryStrategy *)v55 consecutiveRetryCount] - 1];
      return 0;
    }
  }
  return result;
}

- (void)_abortBatchPipeline
{
  if (self->_lastBatch)
  {
    id v3 = MBGetDefaultLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      unint64_t restoreID = self->_restoreID;
      *(_DWORD *)stat buf = 134217984;
      unint64_t v7 = restoreID;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%lu] Cancelling last batch", buf, 0xCu);
      unint64_t v5 = self->_restoreID;
      _MBLog();
    }
    [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] cancel];
    [(MBServiceRestoreEngine *)self _drainBatchPipeline];
    [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] uncancel];
  }
}

- (id)_drainBatchPipeline
{
  if (!self->_lastBatch) {
    return 0;
  }
  id v3 = MBGetDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t restoreID = self->_restoreID;
    *(_DWORD *)stat buf = 134217984;
    unint64_t v8 = restoreID;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "[%lu] Waiting for last batch", buf, 0xCu);
    _MBLog();
  }
  MBSemaphoreWaitForever();
  id v5 = [(MBServiceRestoreEngine *)self _processCompletedBatch:self->_lastBatch];

  self->_lastBatch = 0;
  return v5;
}

- (id)_retry
{
  self->_unint64_t totalFileCount = 0;
  self->_unint64_t totalFileSize = 0;
  return 0;
}

- (id)_restorePlaceholderEntitlements
{
  id v28 = 0;
  id v3 = 0;
  if ([(MBEngine *)self isForegroundRestore])
  {
    id v4 = objc_msgSend(-[MBPersona userIncompleteRestoreDirectory](-[MBEngine persona](self, "persona"), "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", @"/var/mobile/Library/Caches/Backup/placeholder_entitlements.plist");
    id v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t restoreID = self->_restoreID;
      *(_DWORD *)stat buf = 134217984;
      *(void *)&uint8_t buf[4] = restoreID;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%lu] Restoring placeholder entitlements plists", buf, 0xCu);
      unint64_t v22 = self->_restoreID;
      _MBLog();
    }
    if (![+[NSFileManager defaultManager] fileExistsAtPath:v4])
    {
      unint64_t v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)stat buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "No placeholder entitlements manifest in backup", buf, 2u);
        _MBLog();
      }
      return 0;
    }
    unint64_t v7 = [[MBPlaceholderEntitlementsManifest alloc] initWithFile:v4 error:&v28];
    if (v7)
    {
      v33[0] = NSFileOwnerAccountName;
      v33[1] = NSFileGroupOwnerAccountName;
      v34[0] = @"mobile";
      v34[1] = @"mobile";
      v33[2] = NSFilePosixPermissions;
      v34[2] = +[NSNumber numberWithInt:493];
      signed int v26 = +[NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:3];
      if ([(MBPlaceholderEntitlementsManifest *)v7 entryCount] >= 1)
      {
        uint64_t v8 = 0;
        char v9 = 0;
        while (1)
        {
          id v10 = [(MBPlaceholderEntitlementsManifest *)v7 entryAtIndex:v8];
          id v11 = objc_msgSend(objc_msgSend(objc_msgSend(-[MBPersona userIncompleteRestoreDirectory](-[MBEngine persona](self, "persona"), "userIncompleteRestoreDirectory"), "stringByAppendingPathComponent:", -[MBPersona placeholderRestoreDirectory](-[MBServiceAccount persona](-[MBServiceSettingsContext account](-[MBServiceEngine settingsContext](self, "settingsContext"), "account"), "persona"), "placeholderRestoreDirectory")), "stringByAppendingPathComponent:", objc_msgSend(v10, "bundleID")), "stringByAppendingPathComponent:", objc_msgSend(v10, "relativePath"));
          id v12 = MBGetDefaultLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            unint64_t v13 = self->_restoreID;
            *(_DWORD *)stat buf = 134218242;
            *(void *)&uint8_t buf[4] = v13;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%lu] Restoring %@", buf, 0x16u);
            unint64_t v23 = self->_restoreID;
            id v25 = v11;
            _MBLog();
          }
          if (objc_msgSend(v10, "writeToFile:error:", v11, &v28, v23, v25))
          {
            if (![+[NSFileManager defaultManager](NSFileManager, "defaultManager") setAttributes:MBMobileFileAttributes() ofItemAtPath:v11 error:&v28])return +[MBError errorWithCode:100 error:v28 path:v11 format:@"Error setting placeholder entitlements plist file attributes"]; {
            char v9 = 0;
            }
          }
          else
          {
            id v14 = objc_msgSend(objc_msgSend(v28, "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey);
            if (!objc_msgSend(objc_msgSend(v14, "domain"), "isEqualToString:", NSPOSIXErrorDomain)
              || [v14 code] != (id)2)
            {
              return +[MBError errorWithCode:100 error:v28 path:v11 format:@"Error writing placeholder entitlements plist"];
            }
            *(void *)stat buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x2020000000;
            char v32 = 0;
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_1001DC4E8;
            v27[3] = &unk_100415ED0;
            v27[5] = self;
            v27[6] = buf;
            v27[4] = v10;
            MBPerformWithCache((uint64_t)v27);
            if (*(unsigned char *)(*(void *)&buf[8] + 24))
            {
              id v15 = MBGetDefaultLog();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                id v16 = [v10 bundleID];
                *(_DWORD *)unint64_t v29 = 138412290;
                id v30 = v16;
                _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Skipping writing placeholder entitlements plist for deleted app '%@'", v29, 0xCu);
                id v24 = [v10 bundleID];
                _MBLog();
              }
            }
            else
            {
              if (v9)
              {
                _Block_object_dispose(buf, 8);
                return +[MBError errorWithCode:100 error:v28 path:v11 format:@"Error writing placeholder entitlements plist"];
              }
              id v17 = MBGetDefaultLog();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)unint64_t v29 = 0;
                _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Parent directory of placeholder entitlements plist not found, creating now", v29, 2u);
                _MBLog();
              }
              id v18 = [v11 stringByDeletingLastPathComponent];
              if (![+[NSFileManager defaultManager] createDirectoryAtPath:v18 withIntermediateDirectories:1 attributes:v26 error:&v28])
              {
                id v3 = +[MBError errorWithCode:100 error:v28 path:v18 format:@"Error creating parent dir of placeholder entitlements plist"];
                _Block_object_dispose(buf, 8);
                return v3;
              }
              --v8;
              char v9 = 1;
            }
            _Block_object_dispose(buf, 8);
          }
          if (++v8 >= [(MBPlaceholderEntitlementsManifest *)v7 entryCount]) {
            return 0;
          }
        }
      }
      return 0;
    }
    return +[MBError errorWithCode:205 error:v28 format:@"Error reading placeholder entitlements manifest restored from backup"];
  }
  return v3;
}

- (id)_annotate
{
  unsigned int v3 = [(MBEngine *)self isForegroundRestore];
  id v4 = MBGetDefaultLog();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (!v3)
  {
    if (v5)
    {
      unint64_t restoreID = self->_restoreID;
      *(_DWORD *)stat buf = 134217984;
      unint64_t v16 = restoreID;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%lu] Not annotating", buf, 0xCu);
      goto LABEL_9;
    }
    return 0;
  }
  if (v5)
  {
    unint64_t v6 = self->_restoreID;
    *(_DWORD *)stat buf = 134217984;
    unint64_t v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%lu] Annotating", buf, 0xCu);
    unint64_t v14 = self->_restoreID;
    _MBLog();
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v8 = v7;
  id result = [+[MBRestoreDirectoryAnnotator restoreDirectoryAnnotatorWithPersona:[(MBEngine *)self persona] engineType:2 backupPolicy:[(MBEngine *)self backupPolicy] shouldRestoreSystemFiles:[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] shouldRestoreSystemFiles] encrypted:[(MBEngine *)self encrypted]] annotateDomains:[(MBDomainManager *)self->super.super._domainManager allDomains]];
  if (!result)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v11 = self->_restoreID;
      +[NSDate timeIntervalSinceReferenceDate];
      *(_DWORD *)stat buf = 134218240;
      unint64_t v16 = v11;
      __int16 v17 = 2048;
      double v18 = v12 - v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%lu] Annotated in %0.3f s", buf, 0x16u);
      +[NSDate timeIntervalSinceReferenceDate];
LABEL_9:
      _MBLog();
      return 0;
    }
    return 0;
  }
  return result;
}

- (id)_validateAppInstallation
{
  uint64_t v17 = 0;
  unsigned int v3 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] isBackgroundApp];
  id result = 0;
  if (v3)
  {
    BOOL v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      unint64_t restoreID = self->_restoreID;
      *(_DWORD *)stat buf = 134218242;
      unint64_t v19 = restoreID;
      __int16 v20 = 2112;
      id v21 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] errorString];
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%lu] Checking if app was installed (%@)", buf, 0x16u);
      unint64_t v13 = self->_restoreID;
      id v15 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] errorString];
      _MBLog();
    }
    if ([(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] wasCancelled])
    {
      double v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v8 = self->_restoreID;
        char v9 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
        *(_DWORD *)stat buf = 134218242;
        unint64_t v19 = v8;
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "[%lu] Uninstalling placeholder: %@", buf, 0x16u);
        unint64_t v14 = self->_restoreID;
        unint64_t v16 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
        _MBLog();
      }
      if (![(MBMobileInstallation *)[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] mobileInstallation] uninstallAppWithBundleID:[(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID] error:&v17])
      {
        id v10 = MBGetDefaultLog();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v11 = self->_restoreID;
          double v12 = [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
          *(_DWORD *)stat buf = 134218242;
          unint64_t v19 = v11;
          __int16 v20 = 2112;
          id v21 = v12;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%lu] Error uninstalling placeholder: %@", buf, 0x16u);
          [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID];
          _MBLog();
        }
      }
    }
    else if (![(MBAppManager *)[(MBEngine *)self appManager] appWithIdentifier:[(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID]])
    {
      return +[MBError errorWithCode:1, @"App not installed: %@", [(MBServiceRestoreMode *)[(MBServiceRestoreEngine *)self mode] bundleID] format];
    }
    return 0;
  }
  return result;
}

- (id)_propertiesPath
{
  id result = [(MBDomainManager *)self->super.super._domainManager domainForName:@"RootDomain"];
  if (result)
  {
    id v4 = [(MBServiceRestoreEngine *)self _baseRestorePathForDomain:result];
    return [v4 stringByAppendingPathComponent:@"Library/Caches/Backup/properties.plist"];
  }
  return result;
}

- (id)chunkStore:(id)a3 pathForItemID:(unint64_t)a4
{
  uint64_t v18 = 0;
  unint64_t v19 = &v18;
  uint64_t v20 = 0x3052000000;
  id v21 = sub_1001D61DC;
  unint64_t v22 = sub_1001D61EC;
  uint64_t v23 = 0;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001DCE30;
  v17[3] = &unk_100415EF8;
  v17[4] = self;
  v17[5] = &v18;
  void v17[6] = a4;
  v17[7] = a2;
  MBPerformWithCache((uint64_t)v17);
  id v6 = (id)v19[5];
  double v7 = (void *)v19[5];
  if (!v7)
  {
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t restoreID = self->_restoreID;
      *(_DWORD *)stat buf = 134218240;
      unint64_t v25 = restoreID;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%lu] Unable to provide a path for MMCS item %llu because it was not found in the restore files table", buf, 0x16u);
      _MBLog();
    }
    goto LABEL_7;
  }
  if (objc_msgSend(objc_msgSend(v7, "domain"), "isUninstalledAppDomain"))
  {
    unint64_t v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v9 = self->_restoreID;
      *(_DWORD *)stat buf = 134218240;
      unint64_t v25 = v9;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%lu] Unable to provide a path for MMCS item %llu because the app is not installed", buf, 0x16u);
      _MBLog();
    }
LABEL_7:
    id v12 = 0;
    goto LABEL_8;
  }
  id v12 = [(MBServiceRestoreEngine *)self _restorePathForFile:v19[5]];
  unint64_t v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    unint64_t v15 = self->_restoreID;
    id v16 = [(id)v19[5] fileID];
    *(_DWORD *)stat buf = 134218754;
    unint64_t v25 = v15;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2112;
    id v29 = v12;
    __int16 v30 = 2112;
    id v31 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%lu] Locally satisfying get from item %llu: %@ (%@)", buf, 0x2Au);
    [(id)v19[5] fileID];
    _MBLog();
  }
LABEL_8:
  _Block_object_dispose(&v18, 8);
  return v12;
}

- (NSDictionary)keybagsByID
{
  return self->_keybagsByID;
}

- (void)setKeybagsByID:(id)a3
{
}

- (NSData)secret
{
  return self->_secret;
}

- (id)domainForName:(id)a3 containerID:(id)a4 domainManager:(id)a5
{
  return +[MBServiceRestoreDomainManagerDelegate domainForName:a3 containerID:a4 engine:self];
}

@end