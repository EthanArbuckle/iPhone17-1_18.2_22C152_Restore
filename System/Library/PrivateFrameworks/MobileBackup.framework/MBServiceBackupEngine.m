@interface MBServiceBackupEngine
- (BOOL)_repairRequiredForFile:(id)a3;
- (BOOL)_shouldBackupIgnoringProtectionClass:(id)a3 domain:(id)a4 protectionClass:(unsigned __int8)a5;
- (BOOL)_shouldRollKeyBag;
- (BOOL)_shouldVerify;
- (BOOL)cancel;
- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4;
- (BOOL)isCloudPhotosEnabled;
- (BOOL)shouldCommitIfPossible;
- (MBServiceBackupEngine)initWithMode:(int)a3 reason:(int)a4 settingsContext:(id)a5 debugContext:(id)a6;
- (NSSet)keyBagInfo;
- (id)_addBatch:(id)a3;
- (id)_addBatchToService:(id)a3 fileAuthTokens:(id *)a4;
- (id)_addFileChange:(id)a3 toBatch:(id)a4;
- (id)_addFileChangesToBatch:(id)a3;
- (id)_addFiles;
- (id)_backUp;
- (id)_commitBatchToService:(id)a3;
- (id)_commitSnapshot;
- (id)_createBackupAndSnapshot;
- (id)_encryptionKeyForFile:(id)a3 error:(id *)a4;
- (id)_encryptionKeyForFileWithID:(id)a3 inodeNumber:(unint64_t)a4 path:(id)a5 protectionClass:(unsigned __int8)a6 error:(id *)a7;
- (id)_extendedAttributesForPathFSR:(const char *)a3 quiet:(BOOL)a4 error:(id *)a5;
- (id)_findDeletedFiles;
- (id)_impl_encryptionKeyForFileWithID:(id)a3 inodeNumber:(unint64_t)a4 path:(id)a5 protectionClass:(unsigned __int8)a6 error:(id *)a7;
- (id)_prepare;
- (id)_putBatchInChunkStore:(id)a3 fileAuthTokens:(id)a4;
- (id)_refreshCache;
- (id)_removeAbortedFiles;
- (id)_run;
- (id)_scanFiles;
- (id)_setupAddOfFileChange:(id)a3 file:(id *)a4 item:(id *)a5;
- (id)_setupEncryption;
- (id)_setupVerifyEncryption;
- (id)_snapshotAttributes;
- (id)_tryBackingUp;
- (id)_tryScanning;
- (id)_trySettingUpBackup;
- (id)cleanupAfterError:(id)a3;
- (id)fileScanner:(id)a3 didFindFile:(id)a4;
- (id)run;
- (id)setup;
- (int)_fileChangeTypeForNewFile:(id)a3 oldFile:(id)a4;
- (int)engineMode;
- (void)_postconditions;
- (void)_retry;
- (void)dealloc;
- (void)disableCancel;
- (void)enableCancel;
- (void)setIsCloudPhotosEnabled:(BOOL)a3;
- (void)setKeyBagInfo:(id)a3;
@end

@implementation MBServiceBackupEngine

- (MBServiceBackupEngine)initWithMode:(int)a3 reason:(int)a4 settingsContext:(id)a5 debugContext:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)MBServiceBackupEngine;
  v9 = -[MBServiceEngine initWithSettingsContext:debugContext:domainManager:](&v12, "initWithSettingsContext:debugContext:domainManager:", a5, a6, objc_msgSend(objc_alloc((Class)MBDomainManager), "initWithPersona:", objc_msgSend(objc_msgSend(a5, "account"), "persona")));
  v10 = v9;
  if (v9)
  {
    v9->_mode = a3;
    v9->_reason = a4;
    v9->_fileScanner = [[MBFileScanner alloc] initWithDelegate:v9 mode:1 enginePolicy:[(MBEngine *)v9 enginePolicy] debugContext:v9->super.super._debugContext];
    v10->_modifiedDomains = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    v10->super.super._properties = objc_alloc_init(MBProperties);
    v10->_isCloudPhotosEnabled = objc_msgSend(objc_msgSend(a5, "account"), "isCloudPhotosEnabled");
    if (a3 == 2) {
      [[(MBServiceEngine *)v10 service] setDisableWWAN:1];
    }
  }
  return v10;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBServiceBackupEngine;
  [(MBServiceEngine *)&v3 dealloc];
}

- (int)engineMode
{
  return 1;
}

- (BOOL)shouldCommitIfPossible
{
  unint64_t v3 = [(MBServiceRetryStrategy *)self->super._retryStrategy consecutiveRetryCount];
  return v3 >= [(MBServiceRetryStrategy *)self->super._retryStrategy softConsecutiveRetryLimit];
}

- (id)run
{
  v4 = (MBError *)[(MBServiceBackupEngine *)self _run];
  v5 = v4;
  [(MBServiceBackupEngine *)self cleanupAfterError:v4];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10015C5BC;
  v9[3] = &unk_100414A30;
  v9[5] = v4;
  v9[6] = "endedBackupWithEngine:error:";
  v9[4] = self;
  v6 = MBNotifyPluginsBlock(self, [(NSArray *)[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] plugins] reverseObjectEnumerator], "endedBackupWithEngine:error:", (uint64_t)v9);
  if (v6) {
    BOOL v7 = v4 == 0;
  }
  else {
    BOOL v7 = 0;
  }
  if (v7) {
    v4 = v6;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->super._semaphore);
  return v4;
}

- (BOOL)cancel
{
  v5.receiver = self;
  v5.super_class = (Class)MBServiceBackupEngine;
  BOOL v3 = [(MBServiceEngine *)&v5 cancel];
  if (!v3)
  {
    objc_sync_enter(self);
    if (self->_cancelDisabled)
    {
      self->_cancelPending = 1;
      objc_sync_exit(self);
    }
    else
    {
      objc_sync_exit(self);
      [(MBFileScanner *)self->_fileScanner cancel];
    }
  }
  return v3;
}

- (void)disableCancel
{
  self->_cancelDisabled = 1;
}

- (void)enableCancel
{
  objc_sync_enter(self);
  BOOL cancelPending = self->_cancelPending;
  self->_cancelDisabled = 0;
  self->_BOOL cancelPending = 0;
  objc_sync_exit(self);
  if (cancelPending)
  {
    [(MBServiceBackupEngine *)self cancel];
  }
}

- (id)_run
{
  id result = [(MBServiceBackupEngine *)self setup];
  if (!result)
  {
    objc_super v5 = _NSConcreteStackBlock;
    uint64_t v6 = 3221225472;
    BOOL v7 = sub_10015C540;
    v8 = &unk_100414A08;
    v9 = self;
    v10 = "startingBackupWithEngine:";
    id result = MBNotifyPluginsBlock(self, [(NSArray *)[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] plugins] objectEnumerator], "startingBackupWithEngine:", (uint64_t)&v5);
    if (!result)
    {
      id result = [(MBServiceBackupEngine *)self _backUp];
      if (!result)
      {
        [(MBServiceBackupEngine *)self _postconditions];
        v4 = [(NSArray *)[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] plugins] reverseObjectEnumerator];
        objc_super v5 = _NSConcreteStackBlock;
        uint64_t v6 = 3221225472;
        BOOL v7 = sub_10015C540;
        v8 = &unk_100414A08;
        v9 = self;
        v10 = "endingBackupWithEngine:";
        return MBNotifyPluginsBlock(self, v4, "endingBackupWithEngine:", (uint64_t)&v5);
      }
    }
  }
  return result;
}

- (id)_backUp
{
  LOBYTE(v3) = 0;
  while (1)
  {
    objc_super v5 = [(MBServiceBackupEngine *)self _tryBackingUp];
    if (v5)
    {
      uint64_t v6 = v5;
      if (+[MBError isError:v5 withCode:300]
        && ![(MBServiceReachabilityMonitor *)[(MBServiceEngine *)self reachability] isInternetReachableViaWiFi])
      {
        uint64_t v6 = +[MBError errorWithCode:308 error:v6 format:@"Network is unreachable"];
      }
      LOBYTE(v3) = 1;
    }
    else if (self->_mode == 2 && [(NSMutableSet *)self->_modifiedDomains count])
    {
      uint64_t v6 = +[MBError errorWithCode:9 format:@"Files modified while backing up"];
      unsigned int v3 = ![(MBServiceCache *)[(MBServiceEngine *)self cache] areAllFilesCommittedForSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
    }
    else
    {
      uint64_t v6 = 0;
    }
    if (![(MBServiceRetryStrategy *)[(MBServiceEngine *)self retryStrategy] shouldRetryAfterError:v6 hard:v3 & 1])
    {
      if (((v6 != 0) & v3) == 1)
      {
        if (!+[MBError isError:v6 withCode:9]) {
          break;
        }
        if (self->_mode != 2) {
          [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceBackupEngine.m" lineNumber:250 description:@"Hard modification error when not backing up"];
        }
        uint64_t v6 = [(MBServiceBackupEngine *)self _removeAbortedFiles];
        if (!v6)
        {
          uint64_t v6 = [(MBServiceBackupEngine *)self _commitSnapshot];
          if (!v6)
          {
LABEL_27:
            if (self->_mode == 2) {
              [(MBChunkStoreProgressModel *)[(MBChunkStore *)self->super._chunkStore progressModel] ended];
            }
            return 0;
          }
        }
      }
      else
      {
        if (self->_mode != 2) {
          goto LABEL_27;
        }
        BOOL v7 = [(MBServiceBackupEngine *)self _commitSnapshot];
        if (!v7) {
          goto LABEL_27;
        }
        uint64_t v6 = v7;
      }
      if (![(MBServiceRetryStrategy *)[(MBServiceEngine *)self retryStrategy] shouldRetryAfterError:v6 hard:1])break; {
    }
      }
    [(MBServiceBackupEngine *)self _retry];
  }
  v8 = v6;
  return v6;
}

- (id)_tryScanning
{
  id result = [(MBServiceEngine *)self acquireLock];
  if (!result)
  {
    id result = [(MBServiceBackupEngine *)self _setupEncryption];
    if (!result)
    {
      id result = [(MBServiceBackupEngine *)self _refreshCache];
      if (!result)
      {
        id result = [(MBServiceEngine *)self releaseLockNow];
        if (!result)
        {
          return [(MBServiceBackupEngine *)self _scanFiles];
        }
      }
    }
  }
  return result;
}

- (id)_trySettingUpBackup
{
  id result = [(MBServiceEngine *)self acquireLock];
  if (!result)
  {
    id result = [(MBServiceBackupEngine *)self _setupEncryption];
    if (!result)
    {
      id result = [(MBServiceBackupEngine *)self _refreshCache];
      if (!result)
      {
        id result = [(MBServiceBackupEngine *)self _scanFiles];
        if (!result)
        {
          id result = [(MBServiceBackupEngine *)self _createBackupAndSnapshot];
          if (!result)
          {
            return [(MBServiceEngine *)self releaseLockNow];
          }
        }
      }
    }
  }
  return result;
}

- (id)_tryBackingUp
{
  int mode = self->_mode;
  if (mode == 1)
  {
    return [(MBServiceBackupEngine *)self _trySettingUpBackup];
  }
  else if (mode)
  {
    id result = [(MBServiceEngine *)self acquireLock];
    if (!result)
    {
      id result = [(MBServiceBackupEngine *)self _setupEncryption];
      if (!result)
      {
        id result = [(MBServiceBackupEngine *)self _refreshCache];
        if (!result)
        {
          id result = [(MBServiceBackupEngine *)self _prepare];
          if (!result)
          {
            id result = [(MBServiceBackupEngine *)self _scanFiles];
            if (!result)
            {
              id result = [(MBServiceBackupEngine *)self _createBackupAndSnapshot];
              if (!result)
              {
                return [(MBServiceBackupEngine *)self _addFiles];
              }
            }
          }
        }
      }
    }
  }
  else
  {
    return [(MBServiceBackupEngine *)self _tryScanning];
  }
  return result;
}

- (id)setup
{
  v43.receiver = self;
  v43.super_class = (Class)MBServiceBackupEngine;
  id result = [(MBServiceEngine *)&v43 setup];
  id v44 = result;
  if (result) {
    return result;
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] open];
  [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] open];
  [(MBServiceEngine *)self chunkStore];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = +[NSMutableDictionary dictionaryWithDictionary:MBNoCellularCFStreamPropertyOptions()];
    int reason = self->_reason;
    if (reason == 2)
    {
      v8 = MBGetDefaultLog();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL v7 = (const CFStringRef *)&kCFStreamNetworkServiceTypeBackgroundSystemInitiated;
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Marking connection type as kCFStreamNetworkServiceTypeBackgroundSystemInitiated", buf, 2u);
      BOOL v7 = (const CFStringRef *)&kCFStreamNetworkServiceTypeBackgroundSystemInitiated;
    }
    else
    {
      if (reason != 1)
      {
LABEL_13:
        [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] setConnectionProperties:v4];
        goto LABEL_14;
      }
      uint64_t v6 = MBGetDefaultLog();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        BOOL v7 = &kCFStreamNetworkServiceTypeBackground;
        goto LABEL_12;
      }
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Marking connection type as kCFStreamNetworkServiceTypeBackground", buf, 2u);
      BOOL v7 = &kCFStreamNetworkServiceTypeBackground;
    }
    _MBLog();
LABEL_12:
    [(NSMutableDictionary *)v4 setObject:*v7 forKeyedSubscript:kCFStreamNetworkServiceType];
    goto LABEL_13;
  }
LABEL_14:
  v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initializing app manager", buf, 2u);
    _MBLog();
  }
  v10 = [[MBAppManager alloc] initWithMobileInstallation:[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] mobileInstallation]];
  self->super.super._appManager = v10;
  if (![(MBAppManager *)v10 loadAppsWithPersona:[(MBEngine *)self persona] safeHarbors:0 error:&v44])return +[MBError errorWithCode:1 error:v44 format:@"Error initializing app manager"]; {
  id v11 = [(MBDebugContext *)self->super.super._debugContext valueForName:@"DisabledDomains"];
  }
  if (!v11) {
    id v11 = [(MBAppManager *)self->super.super._appManager allDisabledDomainNames];
  }
  id v12 = [(MBAppManager *)self->super.super._appManager allRestrictedDomainNames];
  v13 = MBGetDefaultLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = MBStringWithSet();
    *(_DWORD *)buf = 138412290;
    uint64_t v48 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Disabled domains: %@", buf, 0xCu);
    uint64_t v31 = MBStringWithSet();
    _MBLog();
  }
  v15 = MBGetDefaultLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = MBStringWithSet();
    *(_DWORD *)buf = 138412290;
    uint64_t v48 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Restricted domains: %@", buf, 0xCu);
    uint64_t v31 = MBStringWithSet();
    _MBLog();
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] setDisabledDomainNames:v11 restrictedDomainNames:v12];
  v17 = MBGetDefaultLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Removing old safe harbors", buf, 2u);
    _MBLog();
  }
  appManager = self->super.super._appManager;
  [(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] safeHarborExpiration];
  -[MBAppManager removeOldSafeHarborsWithExpiration:](appManager, "removeOldSafeHarborsWithExpiration:");
  v19 = MBGetDefaultLog();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Creating app domains", buf, 2u);
    _MBLog();
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = [(MBAppManager *)self->super.super._appManager allApps];
  id v34 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v34)
  {
    uint64_t v33 = *(void *)v40;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        if (*(void *)v40 != v33) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        id v22 = [v21 containers];
        id v23 = [v22 countByEnumeratingWithState:&v35 objects:v45 count:16];
        if (v23)
        {
          id v24 = v23;
          uint64_t v25 = *(void *)v36;
          do
          {
            for (j = 0; j != v24; j = (char *)j + 1)
            {
              if (*(void *)v36 != v25) {
                objc_enumerationMutation(v22);
              }
              v27 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
              id v29 = [v27 domain];
              if ((-[MBDomainManager containsDomainName:](self->super.super._domainManager, "containsDomainName:", [v29 name]) & 1) == 0)-[MBDomainManager addDomain:](self->super.super._domainManager, "addDomain:", v29); {
            }
              }
            id v24 = [v22 countByEnumeratingWithState:&v35 objects:v45 count:16];
          }
          while (v24);
        }
        if (([v21 isSystemApp] & 1) == 0) {
          -[MBDomainManager addDomain:](self->super.super._domainManager, "addDomain:", objc_msgSend(v21, "placeholderDomainWithCache:error:", -[MBServiceEngine cache](self, "cache"), 0));
        }
      }
      id v34 = [obj countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v34);
  }
  [(MBDebugContext *)[(MBEngine *)self debugContext] setInt:self->_reason forName:@"BackupReason"];
  signed int v30 = [(MBDebugContext *)self->super.super._debugContext intForName:@"InjectEngineErrorCode"];
  if (v30) {
    return +[MBError errorWithCode:v30 format:@"Simulated error for debug context"];
  }
  else {
    return 0;
  }
}

- (id)cleanupAfterError:(id)a3
{
  v13.receiver = self;
  v13.super_class = (Class)MBServiceBackupEngine;
  -[MBServiceEngine cleanupAfterError:](&v13, "cleanupAfterError:");
  if (a3)
  {
    objc_msgSend(-[MBService lockForBackupUDID:](-[MBServiceEngine service](self, "service"), "lockForBackupUDID:", -[MBServiceEngine backupUDID](self, "backupUDID")), "setState:", 2);
    uint64_t v6 = objc_alloc_init(MBSBackupStatusInfo);
    -[MBSBackupStatusInfo setErrorCode:](v6, "setErrorCode:", [a3 code]);
    -[MBSBackupStatusInfo setErrorDescription:](v6, "setErrorDescription:", [a3 localizedDescription]);
    uint64_t v12 = 0;
    if (![[(MBServiceEngine *)self service] backupStatusInfo:v6 backupUDID:[(MBServiceEngine *)self backupUDID] error:&v12])
    {
      BOOL v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = +[MBError descriptionForError:v12];
        *(_DWORD *)buf = 138412290;
        id v15 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Error sending backup error to server: %@", buf, 0xCu);
        id v11 = +[MBError descriptionForError:v12];
        _MBLog();
      }
    }
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] vacuum];
  [(MBServiceCache *)[(MBServiceEngine *)self cache] analyze];
  [(MBServiceCache *)[(MBServiceEngine *)self cache] close];
  [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] close];
  [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] remove];
  [(MBChunkStore *)[(MBServiceEngine *)self chunkStore] destroy];
  id v9 = [(MBDomainManager *)self->super.super._domainManager domainForName:@"RootDomain"];
  if (!v9) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceBackupEngine.m" lineNumber:422 description:@"RootDomain not found"];
  }
  -[NSFileManager removeItemAtPath:error:](+[NSFileManager defaultManager](NSFileManager, "defaultManager"), "removeItemAtPath:error:", objc_msgSend(objc_msgSend(v9, "rootPath"), "stringByAppendingPathComponent:", @"Library/Caches/Backup/properties.plist"), 0);
  [+[NSFileManager defaultManager] removeItemAtPath:@"/var/mobile/Library/Caches/Backup/placeholder_entitlements.plist" error:0];
  return 0;
}

- (void)_postconditions
{
  if (self->_mode == 2
    && !objc_msgSend(-[MBServiceCache snapshotForSnapshotID:backupUDID:](-[MBServiceEngine cache](self, "cache"), "snapshotForSnapshotID:backupUDID:", self->_snapshotID, -[MBServiceEngine backupUDID](self, "backupUDID")), "committed"))
  {
    v4 = +[NSAssertionHandler currentHandler];
    [(NSAssertionHandler *)v4 handleFailureInMethod:a2 object:self file:@"MBServiceBackupEngine.m" lineNumber:432 description:@"Snapshot not committed"];
  }
}

- (id)_refreshCache
{
  id v39 = 0;
  char v38 = 0;
  if (![(MBServiceCache *)[(MBServiceEngine *)self cache] refreshForBackupUDID:[(MBServiceEngine *)self backupUDID] service:[(MBServiceEngine *)self service] deleted:&v38 error:&v39])
  {
    id v4 = [v39 code];
    id v5 = v39;
    CFStringRef v6 = @"Error refreshing cache";
    return +[MBError errorWithCode:v4 error:v5 format:v6];
  }
  if ([(MBDebugContext *)self->super.super._debugContext isFlagSet:@"VerifyCache"]) {
    [(MBServiceCache *)[(MBServiceEngine *)self cache] verifyBackupUDID:[(MBServiceEngine *)self backupUDID] service:[(MBServiceEngine *)self service]];
  }
  if (v38) {
    return +[MBError errorWithCode:204, @"Backup deleted", v36, v37 format];
  }
  unsigned int v7 = [(MBDebugContext *)[(MBEngine *)self debugContext] isFlagSet:@"IgnoreCompatibility"];

  id v8 = (MBSBackup *)[(MBServiceCache *)[(MBServiceEngine *)self cache] backupForUDID:[(MBServiceEngine *)self backupUDID] lastModified:0];
  self->_backup = v8;
  id v9 = MBGetDefaultLog();
  v10 = v9;
  if (!v8)
  {
    BOOL v14 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    int v13 = 0;
    if (!v14) {
      goto LABEL_24;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "No backup exists", buf, 2u);
    _MBLog();
LABEL_17:
    int v13 = 0;
    goto LABEL_24;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unint64_t v11 = [(MBSBackup *)self->_backup snapshotsCount];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Backup exists with %lu snapshots", buf, 0xCu);
    unint64_t v36 = [(MBSBackup *)self->_backup snapshotsCount];
    _MBLog();
  }
  if (![(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] count]) {
    goto LABEL_17;
  }
  id v12 = [(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] lastObject];
  if (![v12 committed])
  {
    objc_msgSend(objc_msgSend(objc_msgSend(v12, "attributes"), "productVersion"), "doubleValue");
    double v16 = v15;
    [(id)MBProductVersion() doubleValue];
    if (v16 > v17) {
      return +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, @"Existing backup is from a newer OS version (%@ > %@)", objc_msgSend(objc_msgSend(v12, "attributes"), "productVersion"), MBProductVersion());
    }
    char v21 = [v12 isIncompatible] ^ 1 | v7;
    id v22 = MBGetDefaultLog();
    BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
    if (v21)
    {
      if (v23)
      {
        unsigned int v24 = [v12 snapshotID];
        *(_DWORD *)buf = 134217984;
        *(void *)&uint8_t buf[4] = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Snapshot %lu is uncommitted", buf, 0xCu);
        unint64_t v36 = [v12 snapshotID];
        _MBLog();
      }
      self->_snapshotID = objc_msgSend(v12, "snapshotID", v36);
LABEL_33:
      if ((unint64_t)[(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] count] < 2)
      {
        int v13 = self->_snapshotID > 1uLL;
        goto LABEL_24;
      }
      id v32 = [(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] objectAtIndexedSubscript:(char *)[(MBSBackup *)self->_backup snapshotsCount] - 2];
      if (([v32 isIncompatible] ^ 1 | v7)) {
        goto LABEL_14;
      }
      uint64_t v33 = MBGetDefaultLog();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v34 = [v32 snapshotID];
        id v35 = objc_msgSend(objc_msgSend(v32, "attributes"), "buildVersion");
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&uint8_t buf[4] = v34;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v35;
        _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Forcing a full backup because second-to-last snapshot %u is incompatible (%@)", buf, 0x12u);
        unint64_t v36 = (unint64_t)[v32 snapshotID];
        id v37 = objc_msgSend(objc_msgSend(v32, "attributes"), "buildVersion");
        goto LABEL_22;
      }
LABEL_23:
      self->_fullBackup = 1;
      int v13 = 2;
      goto LABEL_24;
    }
    if (v23)
    {
      unsigned int v25 = [v12 snapshotID];
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v25;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Deleting incompatible uncommitted snapshot %u", buf, 8u);
      unint64_t v36 = (unint64_t)[v12 snapshotID];
      _MBLog();
    }
    *(void *)buf = 0;
    unsigned int v26 = -[MBService deleteSnapshotForID:backupUDID:lastModified:error:](-[MBServiceEngine service](self, "service", v36), "deleteSnapshotForID:backupUDID:lastModified:error:", [v12 snapshotID], -[MBServiceEngine backupUDID](self, "backupUDID"), buf, &v39);
    v27 = [(MBServiceEngine *)self cache];
    if (v26)
    {
      [(MBServiceCache *)v27 begin];
      v28 = [(MBServiceEngine *)self cache];
      uint64_t v29 = [v12 snapshotID];
      signed int v30 = [(MBServiceEngine *)self backupUDID];
      [(MBServiceCache *)v28 removeSnapshotForID:v29 backupUDID:v30 lastModified:*(void *)buf];
      uint64_t v31 = [(MBServiceEngine *)self cache];
      [(MBServiceCache *)v31 setLastModified:*(void *)buf forBackupUDID:[(MBServiceEngine *)self backupUDID]];
      [(MBServiceCache *)[(MBServiceEngine *)self cache] end];
      goto LABEL_33;
    }
    [(MBServiceCache *)v27 forceRefreshForBackupUDID:[(MBServiceEngine *)self backupUDID]];
    id v4 = [v39 code];
    id v5 = v39;
    CFStringRef v6 = @"Error deleting incompatible snapshot";
    return +[MBError errorWithCode:v4 error:v5 format:v6];
  }
  if ((([v12 isIncompatible] ^ 1 | v7) & 1) == 0)
  {
    v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v19 = [v12 snapshotID];
      id v20 = objc_msgSend(objc_msgSend(v12, "attributes"), "buildVersion");
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v20;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Forcing a full backup because last snapshot %u is incompatible and committed (%@)", buf, 0x12u);
      unint64_t v36 = (unint64_t)[v12 snapshotID];
      id v37 = objc_msgSend(objc_msgSend(v12, "attributes"), "buildVersion");
LABEL_22:
      _MBLog();
      goto LABEL_23;
    }
    goto LABEL_23;
  }
LABEL_14:
  int v13 = 1;
LABEL_24:
  self->_type = v13;
  [(MBDebugContext *)[(MBEngine *)self debugContext] setInt:self->_type forName:@"BackupType"];
  return 0;
}

- (BOOL)_shouldRollKeyBag
{
  char v11 = 0;
  unsigned int v3 = [(MBPersona *)[(MBEngine *)self persona] getBooleanValueForKey:@"ShouldRollKeyBag" keyExists:&v11];
  if (v11) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4)
  {
    if (self->_keybagID == 2)
    {
      id v5 = [(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] lastObject];
      if (!v5) {
        return (char)v5;
      }
      CFStringRef v6 = v5;
      objc_msgSend(objc_msgSend(objc_msgSend(v5, "attributes"), "productVersion"), "doubleValue");
      if (v7 < 7.1) {
        goto LABEL_9;
      }
      if (![v6 committed])
      {
        id v8 = (char *)[(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] count];
        if ((unint64_t)v8 >= 2)
        {
          objc_msgSend(objc_msgSend(objc_msgSend(-[NSMutableArray objectAtIndexedSubscript:](-[MBSBackup snapshots](self->_backup, "snapshots"), "objectAtIndexedSubscript:", v8 - 2), "attributes"), "productVersion"), "doubleValue");
          LOBYTE(v5) = v9 < 7.1;
          return (char)v5;
        }
      }
    }
    LOBYTE(v5) = 0;
    return (char)v5;
  }
LABEL_9:
  LOBYTE(v5) = 1;
  return (char)v5;
}

- (id)_setupEncryption
{
  id result = 0;
  id v21 = 0;
  if (self->_setupEncryption) {
    return result;
  }
  if (![(MBServiceCache *)self->super._cache refreshForBackupUDID:[(MBServiceEngine *)self backupUDID] service:self->super._service deleted:0 error:&v21])
  {
    id v10 = [v21 code];
    return +[MBError errorWithCode:v10 error:v21 format:@"Error refreshing cache"];
  }
  id v5 = [(MBServiceEncryptionManager *)[(MBServiceEngine *)self encryptionManager] keybagUUID];
  if (!v5)
  {
    char v11 = MBGetDefaultLog();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No local keybag found", buf, 2u);
LABEL_16:
    _MBLog();
    goto LABEL_17;
  }
  CFStringRef v6 = v5;
  uint64_t v20 = 0;
  unsigned int v19 = 0;
  [(MBServiceCache *)[(MBServiceEngine *)self cache] keybagUUID:&v20 keybagID:&v19 forBackupUDID:[(MBServiceEngine *)self backupUDID]];
  if (!v20)
  {
    id v12 = MBGetDefaultLog();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_17;
    }
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Local keybag but no remote keybag", buf, 2u);
    goto LABEL_16;
  }
  unsigned int v7 = -[NSData isEqualToData:](v6, "isEqualToData:");
  id v8 = MBGetDefaultLog();
  double v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)BOOL v23 = v6;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Local keybag matches remote keybag: %@", buf, 0xCu);
      double v17 = v6;
      _MBLog();
    }
    self->_unsigned int keybagID = v19;
    goto LABEL_25;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)BOOL v23 = v6;
    *(_WORD *)&v23[8] = 2112;
    *(void *)&v23[10] = v20;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Local keybag is out of sync with remote keybag (%@ != %@)", buf, 0x16u);
    double v17 = v6;
    uint64_t v18 = v20;
    goto LABEL_16;
  }
LABEL_17:
  if (BYSetupAssistantNeedsToRun()) {
    [(MBServiceEncryptionManager *)[(MBServiceEngine *)self encryptionManager] setSuppressAuthorization:1];
  }
  if (![(MBServiceEncryptionManager *)[(MBServiceEngine *)self encryptionManager] setupBackupWithPasscode:0 userInitiated:0 keybagID:&self->_keybagID error:&v21])
  {
    [(MBServiceEncryptionManager *)[(MBServiceEngine *)self encryptionManager] setSuppressAuthorization:0];
    return v21;
  }
  id v13 = objc_msgSend(objc_msgSend(-[MBServiceCache backupForUDID:lastModified:](-[MBServiceEngine cache](self, "cache"), "backupForUDID:lastModified:", -[MBServiceEngine backupUDID](self, "backupUDID"), 0), "snapshots"), "lastObject");
  if (!v13) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceBackupEngine.m" lineNumber:596 description:@"Snapshot not found after setting up backup"];
  }
  if (![v13 committed]) {
    self->_snapshotID = [v13 snapshotID];
  }
  [(MBServiceEncryptionManager *)[(MBServiceEngine *)self encryptionManager] setSuppressAuthorization:0];
LABEL_25:

  self->_backup = (MBSBackup *)[(MBServiceCache *)[(MBServiceEngine *)self cache] backupForUDID:[(MBServiceEngine *)self backupUDID] lastModified:0];
  if ([(MBServiceBackupEngine *)self _shouldRollKeyBag]
    && ![(MBServiceEncryptionManager *)[(MBServiceEngine *)self encryptionManager] rollKeyBagWithKeyBagID:&self->_keybagID forEngine:self error:&v21])
  {
    return v21;
  }
  id result = [(MBServiceBackupEngine *)self _setupVerifyEncryption];
  id v21 = result;
  if (!result)
  {
    BOOL v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int keybagID = self->_keybagID;
      double v16 = [(MBServiceEncryptionManager *)self->super._encryptionManager keybagUUID];
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)BOOL v23 = keybagID;
      *(_WORD *)&v23[4] = 2112;
      *(void *)&v23[6] = v16;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Keybag: %d %@", buf, 0x12u);
      [(MBServiceEncryptionManager *)self->super._encryptionManager keybagUUID];
      _MBLog();
    }
    id result = 0;
    self->_setupEncryption = 1;
  }
  return result;
}

- (BOOL)_shouldVerify
{
  char v13 = 0;
  unsigned int v3 = [(MBPersona *)[(MBEngine *)self persona] getBooleanValueForKey:@"ForceVerification" keyExists:&v13];
  if (v13) {
    BOOL v4 = v3 == 0;
  }
  else {
    BOOL v4 = 1;
  }
  if (!v4) {
    goto LABEL_16;
  }
  id v5 = [(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] lastObject];
  if (v5)
  {
    CFStringRef v6 = v5;
    if ([v5 committed])
    {
      if (objc_msgSend(objc_msgSend(v6, "attributes"), "keybagID") == 2)
      {
LABEL_15:
        LOBYTE(v5) = 0;
        return (char)v5;
      }
    }
    else
    {
      unsigned int v7 = (char *)[(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] count];
      if ((unint64_t)v7 > 1)
      {
        id v9 = [(NSMutableArray *)[(MBSBackup *)self->_backup snapshots] objectAtIndexedSubscript:v7 - 2];
        objc_msgSend(objc_msgSend(objc_msgSend(v9, "attributes"), "productVersion"), "doubleValue");
        if (v10 < 8.3)
        {
          objc_msgSend(objc_msgSend(objc_msgSend(v6, "attributes"), "productVersion"), "doubleValue");
          if (v11 < 8.3 || objc_msgSend(objc_msgSend(v9, "attributes"), "keybagID") != 2)
          {
LABEL_16:
            LOBYTE(v5) = 1;
            return (char)v5;
          }
        }
        goto LABEL_15;
      }
    }
    objc_msgSend(objc_msgSend(objc_msgSend(v6, "attributes"), "productVersion"), "doubleValue");
    LOBYTE(v5) = v8 < 8.3;
  }
  return (char)v5;
}

- (id)_setupVerifyEncryption
{
  double v16 = 0;
  unsigned int v3 = 0;
  if ([(MBServiceBackupEngine *)self _shouldVerify])
  {
    BOOL v4 = MBGetDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Key bag verification required", buf, 2u);
      _MBLog();
    }
    id v5 = [(MBServiceCache *)[(MBServiceEngine *)self cache] keyBagInfoForBackupUDID:[(MBServiceEngine *)self backupUDID]];
    if (!v5)
    {
      unsigned int v3 = [(MBServiceAccount *)[(MBServiceSettingsContext *)[(MBServiceEngine *)self settingsContext] account] updateAppleAccountSync];
      double v16 = v3;
      if (v3) {
        goto LABEL_21;
      }
      unsigned int v7 = MBGetDefaultLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Getting keys from service", buf, 2u);
        _MBLog();
      }
      unint64_t v8 = 0;
      while (1)
      {
        if ([(MBServiceRetryStrategy *)self->super._retryStrategy softConsecutiveRetryLimit] < v8)
        {
LABEL_18:
          id v11 = [(MBError *)v16 code];
          unsigned int v3 = +[MBError errorWithCode:v11 error:v16 format:@"Error getting keys from service"];
          goto LABEL_21;
        }
        id v9 = [(MBServiceEngine *)self encryptionManager];
        double v10 = [(MBServiceEngine *)self backupUDID];
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        v13[2] = sub_100152A9C;
        v13[3] = &unk_1004148E0;
        v13[4] = self;
        int v14 = v8;
        if ([(MBServiceEncryptionManager *)v9 keysetForBackupUDID:v10 lastModified:0 userInitiated:1 willVerifyCredentialsCallback:v13 error:&v16])
        {
          break;
        }
        ++v8;
        if ((+[MBError isError:v16 withCode:17] & 1) == 0) {
          goto LABEL_18;
        }
      }
      id v5 = [(MBServiceCache *)[(MBServiceEngine *)self cache] keyBagInfoForBackupUDID:[(MBServiceEngine *)self backupUDID]];
    }
    if ((objc_msgSend(v5, "containsObject:", +[MBKeyBagInfo infoWithID:uuid:](MBKeyBagInfo, "infoWithID:uuid:", self->_keybagID, -[NSData bytes](-[MBServiceEncryptionManager keybagUUID](-[MBServiceEngine encryptionManager](self, "encryptionManager"), "keybagUUID"), "bytes"))) & 1) == 0)
    {
      CFStringRef v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Repairing key bag", buf, 2u);
        _MBLog();
      }
      if (![(MBServiceEncryptionManager *)[(MBServiceEngine *)self encryptionManager] rollKeyBagWithKeyBagID:&self->_keybagID forEngine:self error:&v16])
      {
        unsigned int v3 = v16;
        goto LABEL_21;
      }
      id v5 = [(MBServiceCache *)[(MBServiceEngine *)self cache] keyBagInfoForBackupUDID:[(MBServiceEngine *)self backupUDID]];
    }
    [(MBServiceBackupEngine *)self setKeyBagInfo:v5];
    [(MBPersona *)[(MBEngine *)self persona] setPreferencesValue:+[NSDate date] forKey:@"VerificationDate"];
    unsigned int v3 = 0;
LABEL_21:
    [(MBServiceBackupEngine *)self enableCancel];
  }
  return v3;
}

- (id)_prepare
{
  *(void *)&long long buf = _NSConcreteStackBlock;
  *((void *)&buf + 1) = 3221225472;
  uint64_t v20 = sub_10015C540;
  id v21 = &unk_100414A08;
  id v22 = self;
  BOOL v23 = "preparingBackupWithEngine:";
  id v18 = MBNotifyPluginsBlock(self, [(NSArray *)[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] plugins] objectEnumerator], "preparingBackupWithEngine:", (uint64_t)&buf);
  if (!v18)
  {
    id v5 = [(MBDomainManager *)self->super.super._domainManager domainForName:@"RootDomain"];
    if (!v5) {
      [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceBackupEngine.m" lineNumber:782 description:@"Root domain not found"];
    }
    if ((objc_msgSend(-[MBDebugContext valueForName:](self->super.super._debugContext, "valueForName:", @"DontWriteProperties"), "BOOLValue") & 1) == 0)
    {
      CFStringRef v6 = MBGetDefaultLog();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        id v7 = [(MBProperties *)[(MBEngine *)self properties] propertyList];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Saving properties: %@", (uint8_t *)&buf, 0xCu);
        id v17 = [(MBProperties *)[(MBEngine *)self properties] propertyList];
        _MBLog();
      }
      CFStringRef v8 = (const __CFString *)objc_msgSend(objc_msgSend(v5, "rootPath", v17), "stringByAppendingPathComponent:", @"Library/Caches/Backup/properties.plist");
      [(MBProperties *)[(MBEngine *)self properties] setProtected:0];
      if (![(MBProperties *)[(MBEngine *)self properties] writeToFile:v8 error:&v18])
      {
        id v12 = v18;
        CFStringRef v14 = @"Error writing properties";
        CFStringRef v13 = v8;
        goto LABEL_13;
      }
    }
    id v9 = objc_alloc_init(MBPlaceholderEntitlementsManifest);
    [(MBPlaceholderEntitlementsManifest *)v9 addEntriesForApps:[(MBAppManager *)self->super.super._appManager allApps]];
    double v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v11 = [(MBPlaceholderEntitlementsManifest *)v9 propertyList];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Saving placeholder entitlements manifest: %@", (uint8_t *)&buf, 0xCu);
      id v17 = [(MBPlaceholderEntitlementsManifest *)v9 propertyList];
      _MBLog();
    }
    if (![(MBPlaceholderEntitlementsManifest *)v9 writeToFile:@"/var/mobile/Library/Caches/Backup/placeholder_entitlements.plist", &v18, v17 error])
    {
      id v12 = v18;
      CFStringRef v13 = @"/var/mobile/Library/Caches/Backup/placeholder_entitlements.plist";
      CFStringRef v14 = @"Error writing placeholder entitlements manifest";
LABEL_13:
      id v18 = +[MBError errorWithCode:100 error:v12 path:v13 format:v14];
    }
  }
  id v15 = v18;
  return v18;
}

- (id)_scanFiles
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  +[MBKeyBag startOTABackup];
  [(MBServiceCache *)[(MBServiceEngine *)self cache] begin];
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  CFStringRef v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Starting scan", (uint8_t *)&buf, 2u);
    _MBLog();
  }
  [(MBDebugContext *)self->super.super._debugContext performSelectorForName:@"ScanningDomains" withObject:self->super.super._debugContext];
  [(MBServiceCache *)[(MBServiceEngine *)self cache] removeAllFileChanges];
  [(MBServiceCache *)[(MBServiceEngine *)self cache] removeAllFilesMissingEncryptionKey];
  id v7 = objc_msgSend(-[MBDomainManager allDomains](self->super.super._domainManager, "allDomains"), "sortedArrayUsingComparator:", &stru_100414900);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v22;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v22 != v9) {
        objc_enumerationMutation(v7);
      }
      id v11 = (MBError *)[(MBFileScanner *)self->_fileScanner scanDomain:*(void *)(*((void *)&v21 + 1) + 8 * v10) snapshotMountPoint:0];
      if (v11) {
        goto LABEL_14;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v8) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  [(NSMutableSet *)self->_modifiedDomains unionSet:[(MBFileScanner *)self->_fileScanner modifiedDomains]];
  -[MBDebugContext setSimulatedDate:](self->super.super._debugContext, "setSimulatedDate:", objc_msgSend(-[MBDebugContext simulatedDate](self->super.super._debugContext, "simulatedDate"), "dateByAddingTimeInterval:", 1.0));
  +[NSDate timeIntervalSinceReferenceDate];
  double v13 = v12;
  CFStringRef v14 = MBGetDefaultLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    double v15 = v13 - v5;
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Scanned in %0.3f s", (uint8_t *)&buf, 0xCu);
    double v20 = v15;
    _MBLog();
  }
  id v11 = (MBError *)[(MBServiceBackupEngine *)self _findDeletedFiles];
  if (v11)
  {
LABEL_14:
    [(MBServiceCache *)[(MBServiceEngine *)self cache] rollback];
    goto LABEL_15;
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] end];
  [(MBDebugContext *)self->super.super._debugContext performSelectorForName:@"FinishedScanningDomains" withObject:self->super.super._debugContext];
  if (self->_mode == 2
    && [(MBServiceCache *)[(MBServiceEngine *)self cache] areFilesMissingEncryptionKey])
  {
    id v18 = +[MBError errorWithCode:209 format:@"Files missing encryption key"];
  }
  else
  {
    +[MBKeyBag stopOTABackup];
    unsigned int v19 = [(NSArray *)[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] plugins] objectEnumerator];
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v27 = sub_10015C540;
    v28 = &unk_100414A08;
    uint64_t v29 = self;
    signed int v30 = "preparedBackupWithEngine:";
    id v18 = MBNotifyPluginsBlock(self, v19, "preparedBackupWithEngine:", (uint64_t)&buf);
  }
  id v11 = v18;
LABEL_15:
  [v3 drain];
  double v16 = v11;
  return v11;
}

- (BOOL)_repairRequiredForFile:(id)a3
{
  if (self->_keyBagInfo)
  {
    LODWORD(v5) = +[MBProtectionClassUtils isProtected:](MBProtectionClassUtils, "isProtected:", [a3 protectionClass]);
    if (v5)
    {
      id v5 = [a3 keybagUUID];
      if (v5)
      {
        CFStringRef v6 = -[MBKeyBagInfo initWithID:uuid:]([MBKeyBagInfo alloc], "initWithID:uuid:", [a3 keybagID], v5);
        unsigned __int8 v7 = [(NSSet *)self->_keyBagInfo containsObject:v6];

        LOBYTE(v5) = v7 ^ 1;
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (int)_fileChangeTypeForNewFile:(id)a3 oldFile:(id)a4
{
  if (!a4
    || self->_fullBackup && [a4 snapshotID] != self->_snapshotID
    || ![a4 isCommitted]
    || ([a4 isDeleted] & 1) != 0)
  {
    return 1;
  }
  id v8 = [a3 lastModified];
  if (v8 != [a4 lastModified]
    || ([a3 isStatusChangedComparedToFile:a4] & 1) != 0)
  {
    return 2;
  }
  int result = [(MBServiceBackupEngine *)self _repairRequiredForFile:a4];
  if (result)
  {
    uint64_t v9 = MBGetDefaultLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Repair required for %@", buf, 0xCu);
      _MBLog();
    }
    return 1;
  }
  return result;
}

- (BOOL)fileScanner:(id)a3 isFileAddedOrModified:(id)a4
{
  LOBYTE(a4) = -[MBServiceBackupEngine _fileChangeTypeForNewFile:oldFile:](self, "_fileChangeTypeForNewFile:oldFile:", a4, -[MBServiceCache fileForID:backupUDID:](-[MBServiceEngine cache](self, "cache"), "fileForID:backupUDID:", [a4 fileID], -[MBServiceEngine backupUDID](self, "backupUDID")))- 1 < 2;
  return (char)a4;
}

- (id)_encryptionKeyForFileWithID:(id)a3 inodeNumber:(unint64_t)a4 path:(id)a5 protectionClass:(unsigned __int8)a6 error:(id *)a7
{
  uint64_t v8 = a6;
  id v14 = [(MBServiceBackupEngine *)self _impl_encryptionKeyForFileWithID:a3 inodeNumber:a4 path:a5 protectionClass:v8 error:a7];
  double v15 = v14;
  if (v14)
  {
    id v16 = v14;
LABEL_3:
    goto LABEL_6;
  }
  if (!a7) {
    goto LABEL_3;
  }
  id v17 = *a7;
  id v18 = *a7;
LABEL_6:
  return v15;
}

- (id)_encryptionKeyForFile:(id)a3 error:(id *)a4
{
  id v7 = [a3 fileID];
  id v8 = [a3 inodeNumber];
  id v9 = [a3 absolutePath];
  id v10 = [a3 protectionClass];
  return [(MBServiceBackupEngine *)self _encryptionKeyForFileWithID:v7 inodeNumber:v8 path:v9 protectionClass:v10 error:a4];
}

- (id)_impl_encryptionKeyForFileWithID:(id)a3 inodeNumber:(unint64_t)a4 path:(id)a5 protectionClass:(unsigned __int8)a6 error:(id *)a7
{
  unsigned int v9 = a6;
  id v14 = +[MBKeyBagFile keybagFileWithPath:a5 error:a7];
  if (!v14) {
    return 0;
  }
  double v15 = v14;
  id v26 = a5;
  id v16 = [(NSData *)[(MBServiceEncryptionManager *)[(MBServiceEngine *)self encryptionManager] keybagUUID] bytes];
  for (unsigned int i = 2 * (a3 == 0); ; ++i)
  {
    if (i - 2 >= 3)
    {
      if (i == 1)
      {
        id v18 = [(MBServiceCache *)[(MBServiceEngine *)self cache] encryptionKeyForFileWithID:a3 backupUDID:[(MBServiceEngine *)self backupUDID]];
      }
      else
      {
        if (i) {
          goto LABEL_20;
        }
        id v18 = [(MBServiceCache *)[(MBServiceEngine *)self cache] encryptionKeyForFileWithInodeNumber:a4];
      }
    }
    else
    {
      id v18 = [(MBKeyBagFile *)v15 encryptionKeyWithError:a7];
    }
    id v7 = v18;
    if (v18) {
      break;
    }
LABEL_20:
    if (i >= 2)
    {
LABEL_24:
      int v21 = 1;
      goto LABEL_25;
    }
LABEL_23:
    ;
  }
  unsigned int v19 = +[MBKeyBagFile keyBagUUIDForEncryptionKey:v18];
  if (!v19)
  {
LABEL_18:
    if (i > 3) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  BOOL v20 = *(void *)v19 == *v16 && *((void *)v19 + 1) == v16[1];
  if (!v20 || ![(MBKeyBagFile *)v15 validateEncryptionKey:v7 error:a7])
  {
    if (!i)
    {
      [(MBServiceCache *)self->super._cache removeFileEncryptionKeyForInodeNumber:a4];
      goto LABEL_23;
    }
    goto LABEL_18;
  }
  int v21 = 0;
  if (a3 && i >= 2)
  {
    if (!+[MBProtectionClassUtils canOpenWhenLocked:v9]) {
      [(MBServiceCache *)self->super._cache setFileEncryptionKey:v7 forInodeNumber:a4];
    }
    int v21 = 0;
  }
LABEL_25:
  [(MBKeyBagFile *)v15 closeWithError:0];
  if (v21)
  {
    long long v22 = MBGetDefaultLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v28 = v26;
      __int16 v29 = 2112;
      id v30 = a3;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Encryption key not found for protected file: %@ (%@)", buf, 0x16u);
      id v24 = v26;
      id v25 = a3;
      _MBLog();
    }
    -[MBServiceCache addFileMissingEncryptionKeyWithPath:](self->super._cache, "addFileMissingEncryptionKeyWithPath:", v26, v24, v25);
    return 0;
  }
  return v7;
}

- (id)fileScanner:(id)a3 didFindFile:(id)a4
{
  id v38 = 0;
  id v6 = objc_msgSend(a4, "fileID", a3);
  id v7 = [a4 absolutePath];
  if (([a4 isDirectory] & 1) != 0 || objc_msgSend(a4, "isRegularFile"))
  {
    objc_msgSend(a4, "setExtendedAttributes:", -[MBServiceBackupEngine _extendedAttributesForPathFSR:quiet:error:](self, "_extendedAttributesForPathFSR:quiet:error:", objc_msgSend(a4, "absolutePathFSR"), 1, &v38));
    if (![a4 extendedAttributes]) {
      return v38;
    }
  }
  else if ([a4 isSymbolicLink])
  {
    id result = [a4 backupSymbolicLinkTarget];
    id v38 = result;
    if (result) {
      return result;
    }
  }
  id v9 = [(MBServiceCache *)[(MBServiceEngine *)self cache] fileForID:v6 backupUDID:[(MBServiceEngine *)self backupUDID]];
  uint64_t v10 = [(MBServiceBackupEngine *)self _fileChangeTypeForNewFile:a4 oldFile:v9];
  if ((v10 | 2) == 2
    && [a4 isRegularFile]
    && (id v11 = [a4 lastModified], v11 == objc_msgSend(v9, "lastModified"))
    && (id snapshotID = self->_snapshotID, snapshotID != [v9 snapshotID]))
  {
    id v30 = MBGetDefaultLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      id v31 = [a4 typeString];
      *(_DWORD *)long long buf = 138412802;
      id v40 = v31;
      __int16 v41 = 2112;
      id v42 = v7;
      __int16 v43 = 2112;
      id v44 = v6;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "Duplicate %@: %@ (%@)", buf, 0x20u);
      id v34 = v7;
      id v36 = v6;
      id v32 = [a4 typeString];
      _MBLog();
    }
    double v13 = objc_alloc_init(MBSFileReference);
    -[MBSFileReference setFileID:](v13, "setFileID:", objc_msgSend(objc_msgSend(v9, "fileID"), "data"));
    -[MBSFileReference setSnapshotID:](v13, "setSnapshotID:", [v9 snapshotID]);
  }
  else
  {
    double v13 = 0;
  }
  if (-[MBServiceCache isDomainNameEnabled:](-[MBServiceEngine cache](self, "cache", v32, v34, v36), "isDomainNameEnabled:", objc_msgSend(objc_msgSend(a4, "domain"), "name")))
  {
    unsigned int v14 = [a4 isRegularFile];
    if (v10 && v14 && !v13)
    {
      unsigned __int8 v15 = +[MBProtectionClassUtils canOpenWhenLocked:](MBProtectionClassUtils, "canOpenWhenLocked:", [a4 protectionClass]);
      id v16 = MBGetDefaultLog();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG);
      if (v15)
      {
        if (v17)
        {
          id v18 = [a4 typeString];
          *(_DWORD *)long long buf = 138412802;
          id v40 = v18;
          __int16 v41 = 2112;
          id v42 = v7;
          __int16 v43 = 2112;
          id v44 = v6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Unprotected %@: %@ (%@)", buf, 0x20u);
          id v35 = v7;
          id v37 = v6;
          id v33 = [a4 typeString];
          _MBLog();
        }
      }
      else
      {
        if (v17)
        {
          id v19 = [a4 typeString];
          *(_DWORD *)long long buf = 138412802;
          id v40 = v19;
          __int16 v41 = 2112;
          id v42 = v7;
          __int16 v43 = 2112;
          id v44 = v6;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Protected %@: %@ (%@)", buf, 0x20u);
          id v35 = v7;
          id v37 = v6;
          id v33 = [a4 typeString];
          _MBLog();
        }
        -[MBServiceBackupEngine _encryptionKeyForFile:error:](self, "_encryptionKeyForFile:error:", a4, 0, v33, v35, v37);
      }
    }
    if ((v10 - 1) <= 1 && !v13)
    {
      ++self->_totalFileChangeCount;
      self->_totalFileChangeSize += (unint64_t)[a4 size];
      self->_snapshotQuotaReserved += (unint64_t)[a4 size];
      if ((uint64_t)[a4 size] >= 1)
      {
        BOOL v20 = MBGetDefaultLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          id v21 = [a4 size];
          *(_DWORD *)long long buf = 138412546;
          id v40 = a4;
          __int16 v41 = 2048;
          id v42 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Adding %@ to progress model (%{bytes}llu)", buf, 0x16u);
          id v33 = a4;
          id v35 = [a4 size];
          _MBLog();
        }
        -[MBChunkStoreProgressModel willTransferItemWithSize:](-[MBChunkStore progressModel](self->super._chunkStore, "progressModel", v33, v35, v37), "willTransferItemWithSize:", [a4 size]);
      }
    }
    long long v22 = +[MBServiceFileChange fileChangeWithFile:type:](MBServiceFileChange, "fileChangeWithFile:type:", a4, v10, v33);
    [(MBServiceFileChange *)v22 setDuplicateFileReference:v13];
    [(MBServiceCache *)[(MBServiceEngine *)self cache] addFileChange:v22];
    long long v23 = MBGetDefaultLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      id v24 = [(MBServiceFileChange *)v22 typeString];
      id v25 = [a4 typeString];
      *(_DWORD *)long long buf = 138413058;
      id v40 = v24;
      __int16 v41 = 2112;
      id v42 = v25;
      __int16 v43 = 2112;
      id v44 = v7;
      __int16 v45 = 2112;
      id v46 = v6;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "%@ %@: %@ (%@)", buf, 0x2Au);
      [(MBServiceFileChange *)v22 typeString];
      [a4 typeString];
      _MBLog();
    }
    if (v10 == 2)
    {
      id v26 = MBGetDefaultLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = [v9 debugDescription];
        *(_DWORD *)long long buf = 138412290;
        id v40 = v27;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Old file: %@", buf, 0xCu);
        [v9 debugDescription];
        _MBLog();
      }
      id v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = [a4 debugDescription];
        *(_DWORD *)long long buf = 138412290;
        id v40 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "New file: %@", buf, 0xCu);
        [a4 debugDescription];
        _MBLog();
      }
    }
  }
  return 0;
}

- (id)_findDeletedFiles
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  id v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Finding deleted files", buf, 2u);
    _MBLog();
  }
  id v6 = [(MBServiceCache *)[(MBServiceEngine *)self cache] deletedFileIDEnumeratorForBackupUDID:[(MBServiceEngine *)self backupUDID]];
  id v8 = [v6 nextObject];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = 0;
    do
    {
      id v11 = [(MBServiceCache *)[(MBServiceEngine *)self cache] fileForID:v9 backupUDID:[(MBServiceEngine *)self backupUDID]];
      if (v11)
      {
        double v12 = v11;
        if (([v11 isDeleted] & 1) == 0)
        {
          double v13 = MBGetDefaultLog();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            id v14 = [v12 typeString];
            double v15 = COERCE_DOUBLE([v12 description]);
            id v16 = [v12 fileID];
            *(_DWORD *)long long buf = 138412802;
            id v25 = v14;
            __int16 v26 = 2112;
            double v27 = v15;
            __int16 v28 = 2112;
            id v29 = v16;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deleted %@: %@ (%@)", buf, 0x20u);
            id v17 = [v12 typeString];
            id v22 = [v12 description];
            id v23 = [v12 fileID];
            id v21 = v17;
            _MBLog();
          }
          [(MBServiceCache *)[(MBServiceEngine *)self cache] addFileChange:+[MBServiceFileChange fileChangeWithFile:type:](MBServiceFileChange, "fileChangeWithFile:type:", v12, 3, v21, v22, v23)];
          ++v10;
        }
      }
      id v9 = [v6 nextObject];
    }
    while (v9);
  }
  else
  {
    uint64_t v10 = 0;
  }
  id v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    *(_DWORD *)long long buf = 134218240;
    id v25 = v10;
    __int16 v26 = 2048;
    double v27 = v19 - v4;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Found %lu deleted files in %0.3f s", buf, 0x16u);
    +[NSDate timeIntervalSinceReferenceDate];
    _MBLog();
  }
  return 0;
}

- (id)_createBackupAndSnapshot
{
  uint64_t v54 = 0;
  id v55 = 0;
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Creating backup and snapshot", buf, 2u);
    _MBLog();
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] begin];
  id v7 = +[MBSBackupAttributes systemAttributes];
  backup = self->_backup;
  if (backup
    && (objc_msgSend(-[MBSBackupAttributes dictionaryRepresentation](-[MBSBackup attributes](backup, "attributes"), "dictionaryRepresentation"), "isEqualToDictionary:", objc_msgSend(v7, "dictionaryRepresentation")) & 1) != 0)
  {
    goto LABEL_25;
  }
  id v9 = MBGetDefaultLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (self->_backup) {
      CFStringRef v10 = @"Updating";
    }
    else {
      CFStringRef v10 = @"Creating";
    }
    *(_DWORD *)long long buf = 138412290;
    *(void *)&uint8_t buf[4] = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ backup", buf, 0xCu);
    if (self->_backup) {
      CFStringRef v11 = @"Updating";
    }
    else {
      CFStringRef v11 = @"Creating";
    }
    CFStringRef v47 = v11;
    _MBLog();
  }
  id v12 = +[MBSBackup backup];
  [(MBServiceEngine *)self backupUDID];
  [v12 setBackupUDID:MBDataWithString()];
  if (![v12 backupUDID]) {
    [+[NSAssertionHandler currentHandler] handleFailureInMethod:a2, self, @"MBServiceBackupEngine.m", 1189, @"Failed to convert backup UDID: \"%@\"", [(MBServiceEngine *)self backupUDID] object file lineNumber description];
  }
  [v12 setAttributes:v7];
  if ([[(MBServiceEngine *)self service] postBackup:v12 lastModified:&v54 error:&v55])
  {
    if (v54 <= 0)
    {
      double v27 = +[MBError errorWithCode:309 format:@"No Last-Modified value in response to posting backup"];
      goto LABEL_55;
    }
    double v13 = [(MBServiceEngine *)self cache];
    [(MBServiceCache *)v13 addBackup:v12 lastModified:v54];
    id v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      if (self->_backup) {
        CFStringRef v15 = @"Updated";
      }
      else {
        CFStringRef v15 = @"Created";
      }
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ backup", buf, 0xCu);
      if (self->_backup) {
        CFStringRef v16 = @"Updated";
      }
      else {
        CFStringRef v16 = @"Created";
      }
      CFStringRef v47 = v16;
      _MBLog();
    }
LABEL_25:
    id v17 = +[MBSSnapshot snapshot];
    [v17 setQuotaReserved:self->_snapshotQuotaReserved];
    objc_msgSend(v17, "setAttributes:", -[MBServiceBackupEngine _snapshotAttributes](self, "_snapshotAttributes"));
    if (self->_snapshotID)
    {
      id v18 = MBGetDefaultLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        int64_t snapshotID = self->_snapshotID;
        unint64_t totalFileChangeCount = self->_totalFileChangeCount;
        unint64_t totalFileChangeSize = self->_totalFileChangeSize;
        *(_DWORD *)long long buf = 134218496;
        *(void *)&uint8_t buf[4] = snapshotID;
        __int16 v57 = 2048;
        unint64_t v58 = totalFileChangeCount;
        __int16 v59 = 2048;
        unint64_t v60 = totalFileChangeSize;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Updating snapshot %lu (adding %lu files of size %{bytes}llu)", buf, 0x20u);
        unint64_t v50 = self->_totalFileChangeCount;
        unint64_t v52 = self->_totalFileChangeSize;
        unint64_t v48 = self->_snapshotID;
        _MBLog();
      }
      objc_msgSend(v17, "setSnapshotID:", LODWORD(self->_snapshotID), v48, v50, v52);
      if (![[(MBServiceEngine *)self service] updateSnapshot:v17 backupUDID:[(MBServiceEngine *)self backupUDID] lastModified:&v54 error:&v55])
      {
        [(MBServiceCache *)[(MBServiceEngine *)self cache] forceRefreshForBackupUDID:[(MBServiceEngine *)self backupUDID]];
        id v39 = [v55 code];
        double v27 = +[MBError errorWithCode:v39 error:v55 format:@"Error updating snapshot"];
        goto LABEL_55;
      }
      if (v54 <= 0)
      {
        double v27 = +[MBError errorWithCode:309 format:@"No Last-Modified value in response to updating snapshot"];
        goto LABEL_55;
      }
      id v22 = MBGetDefaultLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v23 = self->_snapshotID;
        unint64_t v24 = self->_totalFileChangeCount;
        unint64_t v25 = self->_totalFileChangeSize;
        *(_DWORD *)long long buf = 134218496;
        *(void *)&uint8_t buf[4] = v23;
        __int16 v57 = 2048;
        unint64_t v58 = v24;
        __int16 v59 = 2048;
        unint64_t v60 = v25;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Updated snapshot %lu (added %lu files of size %{bytes}llu)", buf, 0x20u);
        unint64_t v51 = self->_totalFileChangeCount;
        unint64_t v52 = self->_totalFileChangeSize;
        int64_t v49 = self->_snapshotID;
        _MBLog();
      }
    }
    else
    {
      __int16 v28 = MBGetDefaultLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        unint64_t v29 = self->_totalFileChangeCount;
        unint64_t v30 = self->_totalFileChangeSize;
        *(_DWORD *)long long buf = 134218240;
        *(void *)&uint8_t buf[4] = v29;
        __int16 v57 = 2048;
        unint64_t v58 = v30;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "Creating snapshot (%lu files of size %{bytes}llu)", buf, 0x16u);
        unint64_t v48 = self->_totalFileChangeCount;
        unint64_t v50 = self->_totalFileChangeSize;
        _MBLog();
      }
      unsigned int v53 = 0;
      if (![[(MBServiceEngine *)self service] createSnapshot:v17 backupUDID:[(MBServiceEngine *)self backupUDID] lastModified:&v54 error:&v55 snapshotID:&v53])
      {
        [(MBServiceCache *)[(MBServiceEngine *)self cache] forceRefreshForBackupUDID:[(MBServiceEngine *)self backupUDID]];
        id v40 = [v55 code];
        double v27 = +[MBError errorWithCode:v40 error:v55 format:@"Error creating snapshot"];
        goto LABEL_55;
      }
      if (v54 <= 0)
      {
        double v27 = +[MBError errorWithCode:309 format:@"No Last-Modified value in response to creating snapshot"];
        goto LABEL_55;
      }
      self->_int64_t snapshotID = v53;
      objc_msgSend(v17, "setSnapshotID:");
      id v31 = MBGetDefaultLog();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v32 = self->_snapshotID;
        unint64_t v33 = self->_totalFileChangeCount;
        unint64_t v34 = self->_totalFileChangeSize;
        *(_DWORD *)long long buf = 134218496;
        *(void *)&uint8_t buf[4] = v32;
        __int16 v57 = 2048;
        unint64_t v58 = v33;
        __int16 v59 = 2048;
        unint64_t v60 = v34;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Created snapshot %lu (%lu files of size %{bytes}llu)", buf, 0x20u);
        unint64_t v51 = self->_totalFileChangeCount;
        unint64_t v52 = self->_totalFileChangeSize;
        int64_t v49 = self->_snapshotID;
        _MBLog();
      }
    }
    if (self->_snapshotID == 1)
    {
      id v35 = MBGetDefaultLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        unsigned int v36 = [(MBServiceBackupEngine *)self isCloudPhotosEnabled];
        *(_DWORD *)long long buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = v36;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Cloud photos enabled for account: %d", buf, 8u);
        int64_t v49 = [(MBServiceBackupEngine *)self isCloudPhotosEnabled];
        _MBLog();
      }
      if ([(MBServiceBackupEngine *)self isCloudPhotosEnabled])
      {
        id v37 = MBGetDefaultLog();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Cloud photos is enabled and this is the first backup. Extending quota grace for Camera Roll", buf, 2u);
          _MBLog();
        }
        *(void *)long long buf = 0;
        if (![[(MBServiceEngine *)self service] discountCameraRollQuotaForBackupUDID:[(MBServiceEngine *)self backupUDID] error:buf])
        {
          id v38 = [*(id *)buf code];
          double v27 = +[MBError errorWithCode:v38 error:*(void *)buf format:@"Error discounting camera roll quota"];
          goto LABEL_55;
        }
      }
      else
      {
        __int16 v41 = MBGetDefaultLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Cloud photos are not enabled.", buf, 2u);
          _MBLog();
        }
      }
    }
    objc_msgSend(v17, "setLastModified:", v54, v49);
    [(MBServiceCache *)[(MBServiceEngine *)self cache] addSnapshot:v17 backupUDID:[(MBServiceEngine *)self backupUDID]];
    id v42 = [(MBServiceEngine *)self cache];
    [(MBServiceCache *)v42 setLastModified:v54 forBackupUDID:[(MBServiceEngine *)self backupUDID]];
    int v43 = 1;
    goto LABEL_56;
  }
  [(MBServiceCache *)[(MBServiceEngine *)self cache] forceRefreshForBackupUDID:[(MBServiceEngine *)self backupUDID]];
  id v26 = [v55 code];
  double v27 = +[MBError errorWithCode:v26 error:v55 format:@"Error posting backup"];
LABEL_55:
  id v42 = (MBServiceCache *)v27;
  int v43 = 0;
LABEL_56:
  [(MBServiceCache *)[(MBServiceEngine *)self cache] end];
  if (v43)
  {
    id v44 = MBGetDefaultLog();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate];
      *(_DWORD *)long long buf = 134217984;
      *(double *)&uint8_t buf[4] = v45 - (double)(uint64_t)v5;
      _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Created backup and snapshot in %0.3f s", buf, 0xCu);
      +[NSDate timeIntervalSinceReferenceDate];
      _MBLog();
    }
    return 0;
  }
  return v42;
}

- (id)_addFiles
{
  id v3 = objc_alloc_init((Class)NSAutoreleasePool);
  [(MBDebugContext *)self->super.super._debugContext performSelectorForName:@"AddingFiles" withObject:self->super.super._debugContext];
  unint64_t v19 = 0;
  double v20 = 0.0;
  [(MBServiceCache *)self->super._cache fileChangeCount:&v20 size:&v19];
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  id v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218240;
    double v22 = v20;
    __int16 v23 = 2048;
    unint64_t v24 = v19;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Adding %lu files of size %{bytes}llu", buf, 0x16u);
    double v15 = v20;
    unint64_t v17 = v19;
    _MBLog();
  }
  [(MBDebugContext *)self->super.super._debugContext setInt:LODWORD(v20), @"FileChangeCount", *(void *)&v15, v17 forName];
  id v7 = [(MBServiceBackupEngine *)self _addFileChangesToBatch:+[MBSBackupBatch batch]];
  if (v7)
  {
    id v8 = v7;
    id v9 = v7;
    [v3 drain];
    return v8;
  }
  else
  {
    +[NSDate timeIntervalSinceReferenceDate];
    double v12 = v11;
    double v13 = MBGetDefaultLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = v12 - v5;
      *(_DWORD *)long long buf = 134218240;
      double v22 = v14;
      __int16 v23 = 2048;
      unint64_t v24 = (unint64_t)((double)v19 / v14);
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Finished adding files in %0.3f s at %{bytes}llu/s", buf, 0x16u);
      double v16 = v14;
      unint64_t v18 = (unint64_t)((double)v19 / v14);
      _MBLog();
    }
    objc_msgSend(v3, "drain", *(void *)&v16, v18);
    return 0;
  }
}

- (id)_addFileChangesToBatch:(id)a3
{
  double v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Adding file changes to batch", buf, 2u);
    _MBLog();
  }
  id v6 = [(MBServiceCache *)self->super._cache fileChangeEnumerator];
  id v7 = objc_alloc_init((Class)NSAutoreleasePool);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v8 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
LABEL_5:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v6);
      }
      double v12 = *(void **)(*((void *)&v22 + 1) + 8 * v11);
      if ([(MBDebugContext *)[(MBEngine *)self debugContext] isFlagSet:@"SimulateErrorAddingFileToBatch"])
      {
        CFStringRef v17 = @"SimulatedErrorAddingFileToBatch";
        uint64_t v18 = 1;
        goto LABEL_20;
      }
      if ([(MBEngine *)self isCanceled]) {
        break;
      }
      if ([a3 count])
      {
        id v13 = [a3 count];
        if (v13 == objc_msgSend(-[MBServiceCache configuration](-[MBServiceEngine cache](self, "cache"), "configuration"), "addFilesCount")|| (double v14 = (char *)objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize"), v15 = &v14[(void)objc_msgSend(v12, "size")], v15 >= objc_msgSend(-[MBServiceCache configuration](-[MBServiceEngine cache](self, "cache"), "configuration"), "addFilesSize")))
        {
          double v16 = [(MBServiceBackupEngine *)self _addBatch:a3];
          if (v16) {
            goto LABEL_23;
          }
        }
      }
      double v16 = [(MBServiceBackupEngine *)self _addFileChange:v12 toBatch:a3];
      if (v16) {
        goto LABEL_23;
      }
      [v7 drain];
      id v7 = objc_alloc_init((Class)NSAutoreleasePool);
      if (v9 == (id)++v11)
      {
        id v9 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
        if (v9) {
          goto LABEL_5;
        }
        goto LABEL_21;
      }
    }
    CFStringRef v17 = @"Backup cancelled";
    uint64_t v18 = 202;
LABEL_20:
    unint64_t v19 = +[MBError errorWithCode:v18 format:v17];
    if (v19) {
      goto LABEL_25;
    }
  }
LABEL_21:
  if ([a3 count])
  {
    double v16 = [(MBServiceBackupEngine *)self _addBatch:a3];
LABEL_23:
    unint64_t v19 = v16;
  }
  else
  {
    unint64_t v19 = 0;
  }
LABEL_25:
  double v20 = v19;
  [v7 drain];
  return v19;
}

- (id)_addFileChange:(id)a3 toBatch:(id)a4
{
  if (!-[MBServiceCache isDomainNameEnabled:](-[MBServiceEngine cache](self, "cache"), "isDomainNameEnabled:", [a3 domainName]))
  {
    double v14 = MBGetDefaultLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138413058;
      id v32 = [a3 typeString];
      __int16 v33 = 2112;
      id v34 = [a3 domainName];
      __int16 v35 = 2112;
      id v36 = [a3 relativePath];
      __int16 v37 = 2112;
      id v38 = [a3 fileID];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Disabled %@: %@-%@ (%@)", buf, 0x2Au);
      id v15 = [a3 typeString];
      id v16 = [a3 domainName];
      id v27 = [a3 relativePath];
      id v28 = [a3 fileID];
      id v25 = v15;
      id v26 = v16;
      _MBLog();
    }
    if ((objc_msgSend(a3, "isUnmodified", v25, v26, v27, v28) & 1) == 0
      && ![a3 isModified])
    {
      return 0;
    }
    goto LABEL_18;
  }
  if (([a3 isAdded] & 1) == 0 && !objc_msgSend(a3, "isModified"))
  {
    if ([a3 isUnmodified]) {
      return 0;
    }
    if (([a3 isDeleted] & 1) == 0) {
      -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBServiceBackupEngine.m", 1384, @"Unexpected file change type: %d", [a3 type]);
    }
LABEL_18:
    CFStringRef v17 = objc_alloc_init(MBSFile);
    -[MBSFile setFileID:](v17, "setFileID:", objc_msgSend(objc_msgSend(a3, "fileID"), "data"));
    -[MBSFile setDomain:](v17, "setDomain:", [a3 domainName]);
    -[MBSFile setRelativePath:](v17, "setRelativePath:", [a3 relativePath]);
    [a4 addServiceFile:v17];
    return 0;
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  id v8 = [(MBServiceBackupEngine *)self _setupAddOfFileChange:a3 file:&v30 item:&v29];
  if (!v8)
  {
    [a4 addServiceFile:v30];
    if (v29) {
      objc_msgSend(a4, "addChunkStoreItem:");
    }
    return 0;
  }
  id v9 = v8;
  id v10 = -[MBDomainManager domainForName:](self->super.super._domainManager, "domainForName:", [a3 domainName]);
  id v11 = objc_msgSend(objc_msgSend(v10, "rootPath"), "stringByAppendingPathComponent:", objc_msgSend(a3, "relativePath"));
  if (+[MBError isError:v9 withCode:4])
  {
    double v12 = MBGetDefaultLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [a3 fileID];
      *(_DWORD *)long long buf = 138412546;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "File deleted before adding: %@ (%@)", buf, 0x16u);
      id v25 = v11;
      id v26 = [a3 fileID];
LABEL_25:
      _MBLog();
      goto LABEL_26;
    }
    goto LABEL_26;
  }
  if (+[MBError isError:v9 withCode:13])
  {
    uint64_t v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [a3 fileID];
      *(_DWORD *)long long buf = 138412546;
      id v32 = v11;
      __int16 v33 = 2112;
      id v34 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "SQLite file is locked: %@ (%@)", buf, 0x16u);
      id v25 = v11;
      id v26 = [a3 fileID];
      goto LABEL_25;
    }
LABEL_26:
    -[NSMutableSet addObject:](self->_modifiedDomains, "addObject:", v10, v25, v26, v27);
    return 0;
  }
  if (+[MBError isError:v9 withCode:16])
  {
    double v20 = MBGetDefaultLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = +[MBError descriptionForError:v9 paths:0];
      id v22 = [a3 fileID];
      *(_DWORD *)long long buf = 138412802;
      id v32 = v21;
      __int16 v33 = 2112;
      id v34 = v11;
      __int16 v35 = 2112;
      id v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@: %@ (%@)", buf, 0x20u);
      id v23 = +[MBError descriptionForError:v9 paths:0];
      id v26 = v11;
      id v27 = [a3 fileID];
      id v25 = v23;
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  if ((+[MBError isError:withCodes:](MBError, "isError:withCodes:", v9, 209, 9, 401, 0) & 1) == 0)return +[MBError errorWithCode:100 error:v9 path:v11 format:@"Error reading file metadata"]; {
  return v9;
  }
}

- (id)_setupAddOfFileChange:(id)a3 file:(id *)a4 item:(id *)a5
{
  id v53 = 0;
  id v10 = -[MBDomainManager domainForName:](self->super.super._domainManager, "domainForName:", [a3 domainName]);
  if (!v10) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBServiceBackupEngine.m", 1415, @"Unknown cache file change domain name: %@", [a3 domainName]);
  }
  id v11 = objc_msgSend(objc_msgSend(v10, "rootPath"), "stringByAppendingPathComponent:", objc_msgSend(a3, "relativePath"));
  double v12 = (const char *)[v11 fileSystemRepresentation];
  memset(&v52, 0, sizeof(v52));
  if (lstat(v12, &v52))
  {
    id v13 = v11;
    return +[MBError posixErrorWithPath:v13, @"lstat error", st_size, v41, v42 format];
  }
  int v15 = v52.st_mode & 0xF000;
  if (v15 == 0x8000 || v15 == 0x4000)
  {
    uint64_t v16 = +[MBProtectionClassUtils getWithPathFSR:v12 error:&v53];
    if (v16 == 255) {
      return v53;
    }
  }
  else
  {
    uint64_t v16 = 0;
  }
  id v17 = [(MBServiceBackupEngine *)self _extendedAttributesForPathFSR:v12 quiet:0 error:&v53];
  if (!v17) {
    return v53;
  }
  id v49 = v17;
  unsigned int v50 = v16;
  if ((v52.st_mode & 0xF000) != 0x8000 || [a3 duplicateFileReference])
  {
    id v44 = 0;
LABEL_15:
    id v18 = 0;
    goto LABEL_16;
  }
  unint64_t v48 = a5;
  if (!+[MBProtectionClassUtils canOpenWhenLocked:v16])
  {
    id v44 = 0;
    int v28 = 1;
    goto LABEL_69;
  }
  if ([(MBServiceBackupEngine *)self shouldCommitIfPossible])
  {
    long long v24 = a2;
    id v25 = 0;
  }
  else
  {
    char v51 = 0;
    if (!+[MBSQLiteFileHandle isSQLiteFileAtPath:v11 result:&v51 error:&v53])return v53; {
    if (v51)
    }
    {
      uint64_t v37 = MBTemporaryPath();
      *(void *)&buf.st_dev = 0;
      if (!+[MBSQLiteFileHandle lastModifiedForSQLiteFileAtPath:v11 time:&buf error:&v53])return v53; {
      v52.st_mtimespec.__darwin_time_t tv_sec = *(void *)&buf.st_dev;
      }
      v52.st_mtimespec.tv_nsec = 0;
      if (!+[MBSQLiteFileHandle copySQLiteFileAtPath:v11 toPath:v37 error:&v53])return v53; {
      id v25 = (void *)v37;
      }
      id result = MBNotifyPlugins2(self, [(NSArray *)[(MBSettingsContext *)[(MBServiceEngine *)self settingsContext] plugins] objectEnumerator], "backingUpSQLiteFileCopyAtPath:temporaryPath:", (uint64_t)v11, v37);
      id v53 = result;
      if (result) {
        return result;
      }
    }
    else
    {
      id v25 = 0;
    }
    long long v24 = a2;
  }
  __darwin_time_t tv_sec = v52.st_mtimespec.tv_sec;
  time_t v27 = time(0);
  if (!v25 && v52.st_size < 0x20000)
  {
    id v44 = 0;
    int v28 = 1;
    __darwin_ino64_t v29 = v27 - tv_sec;
    if (v27 < tv_sec)
    {
LABEL_65:
      a2 = v24;
      goto LABEL_69;
    }
    BOOL v30 = v27 - 900 <= tv_sec;
    a2 = v24;
    if (!v30) {
      goto LABEL_69;
    }
    __darwin_ino64_t v45 = v29;
    id v31 = MBGetDefaultLog();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      buf.st_dev = 134218498;
      *(void *)&buf.st_int mode = v52.st_size;
      WORD2(buf.st_ino) = 2048;
      *(__darwin_ino64_t *)((char *)&buf.st_ino + 6) = v45;
      HIWORD(buf.st_gid) = 2112;
      *(void *)&buf.st_rdev = v11;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Copying %{bytes}llu file modified %lu s ago: %@", (uint8_t *)&buf, 0x20u);
      __darwin_ino64_t v41 = v45;
      id v42 = v11;
      off_t st_size = v52.st_size;
      _MBLog();
    }
    uint64_t v46 = MBTemporaryPath();
    id v32 = +[MBBasicFileHandle basicFileHandleWithPath:flags:mode:error:](MBBasicFileHandle, "basicFileHandleWithPath:flags:mode:error:");
    if (!v32) {
      return v53;
    }
    __int16 v33 = v32;
    if (!+[MBProtectionClassUtils setWithFD:[(MBBasicFileHandle *)v32 fd] value:v50 error:&v53])
    {
      [(MBBasicFileHandle *)v33 closeWithError:0];
      return v53;
    }
    unsigned __int8 v34 = [(MBFileHandle *)v33 readFromPath:v11 error:&v53];
    [(MBBasicFileHandle *)v33 closeWithError:0];
    id v25 = (void *)v46;
    if ((v34 & 1) == 0) {
      return v53;
    }
  }
  if (!v25)
  {
    id v44 = 0;
    int v28 = 1;
    goto LABEL_65;
  }
  memset(&buf, 0, sizeof(buf));
  if (lstat((const char *)[v25 fileSystemRepresentation], &buf))
  {
    id v13 = v25;
    return +[MBError posixErrorWithPath:v13, @"lstat error", st_size, v41, v42 format];
  }
  a2 = v24;
  id v44 = v25;
  int v28 = 0;
  v52.st_ino = buf.st_ino;
  v52.off_t st_size = buf.st_size;
LABEL_69:
  if (+[MBProtectionClassUtils isProtected:](MBProtectionClassUtils, "isProtected:", v50, st_size, v41, v42))
  {
    a5 = v48;
    if (![(MBServiceBackupEngine *)self _shouldBackupIgnoringProtectionClass:a3 domain:v10 protectionClass:v50])goto LABEL_15; {
    if (v28)
    }
    {
      id v38 = [a3 fileID];
      id v39 = v11;
    }
    else
    {
      id v38 = 0;
      id v39 = v44;
    }
    id v18 = [(MBServiceBackupEngine *)self _encryptionKeyForFileWithID:v38 inodeNumber:v52.st_ino path:v39 protectionClass:v50 error:&v53];
    if (!v18) {
      return v53;
    }
  }
  else
  {
    id v18 = 0;
    a5 = v48;
  }
LABEL_16:
  SEL v43 = a2;
  if ((v52.st_mode & 0xF000) == 0xA000)
  {
    id v19 = +[MBFileOperation symbolicLinkTargetWithPathFSR:v12 error:&v53];
    if (!v19) {
      return v53;
    }
  }
  else
  {
    id v19 = 0;
  }
  CFStringRef v47 = a4;
  double v20 = a5;
  id v21 = objc_alloc_init(MBSFile);
  id v22 = objc_alloc_init(MBSFileAttributes);
  -[MBSFile setFileID:](v21, "setFileID:", objc_msgSend(objc_msgSend(a3, "fileID"), "data"));
  if (![(MBSFile *)v21 fileID]) {
    -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", v43, self, @"MBServiceBackupEngine.m", 1525, @"Failed to convert file change ID: \"%@\"", [a3 fileID]);
  }
  -[MBSFile setDomain:](v21, "setDomain:", [a3 domainName]);
  -[MBSFile setRelativePath:](v21, "setRelativePath:", [a3 relativePath]);
  if (v18)
  {
    [(MBSFileAttributes *)v22 setKeybagID:self->_keybagID];
    [(MBSFileAttributes *)v22 setEncryptionKey:v18];
    [(MBSFileAttributes *)v22 setEncryptionKeyVersion:2];
    [(MBSFileAttributes *)v22 setDecryptedSize:v52.st_size];
  }
  [(MBSFileAttributes *)v22 setTarget:v19];
  [(MBSFileAttributes *)v22 setStat:&v52];
  [(MBSFileAttributes *)v22 setProtectionClass:v50];
  [(MBSFileAttributes *)v22 addExtendedAttributesDictionary:v49];
  [(MBSFile *)v21 setAttributes:v22];
  if ((v52.st_mode & 0xF000) != 0x8000) {
    goto LABEL_46;
  }
  if (v52.st_size)
  {
    if ([a3 duplicateFileReference])
    {
      id v23 = -[MBServiceCache fileForID:snapshotID:backupUDID:](-[MBServiceEngine cache](self, "cache"), "fileForID:snapshotID:backupUDID:", +[MBFileID fileIDWithData:](MBFileID, "fileIDWithData:", objc_msgSend(objc_msgSend(a3, "duplicateFileReference"), "fileID")), objc_msgSend(objc_msgSend(a3, "duplicateFileReference"), "snapshotID"), -[MBServiceEngine backupUDID](self, "backupUDID"));
      -[MBSFile setSignature:](v21, "setSignature:", [v23 digest]);
      -[MBSFile setSize:](v21, "setSize:", [v23 size]);
      -[MBSFile setDuplicateFile:](v21, "setDuplicateFile:", [a3 duplicateFileReference]);
      if ([v23 encryptionKey])
      {
        -[MBSFileAttributes setKeybagID:](-[MBSFile attributes](v21, "attributes"), "setKeybagID:", [v23 keybagID]);
        -[MBSFileAttributes setEncryptionKey:](-[MBSFile attributes](v21, "attributes"), "setEncryptionKey:", [v23 encryptionKey]);
        -[MBSFileAttributes setEncryptionKeyVersion:](-[MBSFile attributes](v21, "attributes"), "setEncryptionKeyVersion:", [v23 encryptionKeyVersion]);
        -[MBSFileAttributes setDecryptedSize:](-[MBSFile attributes](v21, "attributes"), "setDecryptedSize:", [v23 decryptedSize]);
      }
      goto LABEL_46;
    }
    __int16 v35 = +[MBChunkStoreItem chunkStoreItemWithFileID:domain:path:](MBChunkStoreItem, "chunkStoreItemWithFileID:domain:path:", [a3 fileID], v10, v11);
    [(MBChunkStoreItem *)v35 setEncryptedKey:v18];
    [(MBChunkStoreItem *)v35 setTemporaryPath:v44];
    if ([(MBChunkStore *)[(MBServiceEngine *)self chunkStore] registerItem:v35 error:&v53])
    {
      if (![(MBChunkStoreItem *)v35 signature]) {
        [+[NSAssertionHandler currentHandler] handleFailureInMethod:v43 object:self file:@"MBServiceBackupEngine.m" lineNumber:1567 description:@"No signature assigned to chunk store item after registration"];
      }
      id v36 = [(MBChunkStoreItem *)v35 size];
      if (v36 != [a3 size]) {
        -[MBChunkStoreProgressModel willTransferItemsWithSize:count:](-[MBChunkStore progressModel](-[MBServiceEngine chunkStore](self, "chunkStore"), "progressModel"), "willTransferItemsWithSize:count:", (unsigned char *)-[MBChunkStoreItem size](v35, "size") - (unsigned char *)[a3 size], 0);
      }
      [(MBSFile *)v21 setSize:[(MBChunkStoreItem *)v35 size]];
      [(MBSFile *)v21 setSignature:[(MBChunkStoreItem *)v35 signature]];
      goto LABEL_47;
    }
    return v53;
  }
  [(MBSFile *)v21 setSize:0];
LABEL_46:
  __int16 v35 = 0;
LABEL_47:
  if (v47) {
    *CFStringRef v47 = v21;
  }
  id result = 0;
  if (v20) {
    *double v20 = v35;
  }
  return result;
}

- (BOOL)_shouldBackupIgnoringProtectionClass:(id)a3 domain:(id)a4 protectionClass:(unsigned __int8)a5
{
  if ((a5 & 0xFFFFFFFB) != 3
    || !objc_msgSend(objc_msgSend(a4, "relativePathsToBackupIgnoringProtectionClass"), "count"))
  {
    return 1;
  }
  id v7 = objc_msgSend(objc_msgSend(a3, "relativePath"), "pathComponents");
  id v8 = [v7 count];
  uint64_t v9 = 0;
  while (1)
  {
    if (objc_msgSend(objc_msgSend(a4, "relativePathsToBackupIgnoringProtectionClass"), "containsObject:", +[NSString pathWithComponents:](NSString, "pathWithComponents:", objc_msgSend(v7, "subarrayWithRange:", 0, v9))))break; {
    if (++v9 > (unint64_t)v8)
    }
      return 1;
  }
  double v12 = MBGetDefaultLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)stat buf = 138412290;
    id v14 = [a3 relativePath];
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Treating file with protection class C as having protection class D: %@", buf, 0xCu);
    [a3 relativePath];
    _MBLog();
  }
  return 0;
}

- (id)_addBatch:(id)a3
{
  +[NSDate timeIntervalSinceReferenceDate];
  double v6 = v5;
  id v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)stat buf = 134218240;
    id v35 = [a3 count];
    __int16 v36 = 2048;
    id v37 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Adding batch of %lu files of size %{bytes}llu", buf, 0x16u);
    id v26 = [a3 count];
    id v28 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
    _MBLog();
  }
  [(MBDebugContext *)self->super.super._debugContext performSelectorForName:@"AddingBatchOfFilesToSnapshot", self->super.super._debugContext, v26, v28 withObject];
  uint64_t v33 = 0;
  id result = [(MBServiceBackupEngine *)self _addBatchToService:a3 fileAuthTokens:&v33];
  if (!result)
  {
    [(MBDebugContext *)self->super.super._debugContext performSelectorForName:@"AddedBatchOfFilesToSnapshot" withObject:self->super.super._debugContext];
    id result = [(MBServiceBackupEngine *)self _putBatchInChunkStore:a3 fileAuthTokens:v33];
    if (!result)
    {
      [(MBDebugContext *)self->super.super._debugContext performSelectorForName:@"PutBatchOfFilesToSnapshot" withObject:self->super.super._debugContext];
      id result = [(MBServiceBackupEngine *)self _commitBatchToService:a3];
      if (!result)
      {
        [(MBDebugContext *)self->super.super._debugContext performSelectorForName:@"CommittedBatchOfFilesToSnapshot" withObject:self->super.super._debugContext];
        uint64_t v9 = MBGetDefaultLog();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = [a3 count];
          id v11 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
          +[NSDate timeIntervalSinceReferenceDate];
          double v13 = v12 - v6;
          double v14 = (double)(unint64_t)objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
          +[NSDate timeIntervalSinceReferenceDate];
          unint64_t v16 = (unint64_t)(v14 / (v15 - v6));
          [(MBChunkStoreProgressModel *)[(MBChunkStore *)[(MBServiceEngine *)self chunkStore] progressModel] progress];
          *(_DWORD *)stat buf = 134219008;
          id v35 = v10;
          __int16 v36 = 2048;
          id v37 = v11;
          __int16 v38 = 2048;
          double v39 = v13;
          __int16 v40 = 2048;
          unint64_t v41 = v16;
          __int16 v42 = 2048;
          double v43 = v17 * 100.0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Added batch of %lu files of size %{bytes}llu in %0.3f s at %{bytes}llu/s (%0.1f%%)", buf, 0x34u);
          id v18 = [a3 count];
          id v19 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
          +[NSDate timeIntervalSinceReferenceDate];
          double v21 = v20 - v6;
          double v22 = (double)(unint64_t)objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "totalSize");
          +[NSDate timeIntervalSinceReferenceDate];
          unint64_t v24 = (unint64_t)(v22 / (v23 - v6));
          [(MBChunkStoreProgressModel *)[(MBChunkStore *)[(MBServiceEngine *)self chunkStore] progressModel] progress];
          double v32 = v25 * 100.0;
          unint64_t v31 = v24;
          double v30 = v21;
          id v27 = v18;
          id v29 = v19;
          _MBLog();
        }
        objc_msgSend(a3, "clear", v27, v29, *(void *)&v30, v31, *(void *)&v32);
        [(MBDebugContext *)self->super.super._debugContext performSelectorForName:@"ClearedBatchOfFiles" withObject:self->super.super._debugContext];
        return 0;
      }
    }
  }
  return result;
}

- (id)_addBatchToService:(id)a3 fileAuthTokens:(id *)a4
{
  uint64_t v25 = 0;
  id v26 = 0;
  [(MBServiceCache *)[(MBServiceEngine *)self cache] setStale:1 forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
  id v7 = -[MBService addFiles:backupUDID:snapshotID:lastModified:error:](-[MBServiceEngine service](self, "service"), "addFiles:backupUDID:snapshotID:lastModified:error:", [a3 serviceFiles], -[MBServiceEngine backupUDID](self, "backupUDID"), self->_snapshotID, &v25, &v26);
  if (v7)
  {
    if (v25 <= 0)
    {
      return +[MBError errorWithCode:309 format:@"No Last-Modified value in response to adding files"];
    }
    else
    {
      id v19 = v7;
      double v20 = a4;
      [(MBServiceCache *)[(MBServiceEngine *)self cache] begin];
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v8 = [a3 serviceFiles];
      id v9 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v9)
      {
        id v10 = v9;
        uint64_t v11 = *(void *)v22;
        do
        {
          for (unsigned int i = 0; i != v10; unsigned int i = (char *)i + 1)
          {
            if (*(void *)v22 != v11) {
              objc_enumerationMutation(v8);
            }
            double v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            BOOL v14 = [v13 attributes]
               && (objc_msgSend(objc_msgSend(v13, "attributes"), "mode") & 0xF000) == 0x8000
               && [v13 size]
               && [v13 duplicateFile] == 0;
            [(MBServiceCache *)[(MBServiceEngine *)self cache] addFile:v13 snapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID] committed:!v14];
          }
          id v10 = [v8 countByEnumeratingWithState:&v21 objects:v27 count:16];
        }
        while (v10);
      }
      double v15 = [(MBServiceEngine *)self cache];
      [(MBServiceCache *)v15 setLastModified:v25 forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
      [(MBServiceCache *)[(MBServiceEngine *)self cache] setStale:0 forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
      unint64_t v16 = [(MBServiceEngine *)self cache];
      [(MBServiceCache *)v16 setLastModified:v25 forBackupUDID:[(MBServiceEngine *)self backupUDID]];
      [(MBServiceCache *)[(MBServiceEngine *)self cache] end];
      id result = 0;
      if (v20) {
        *double v20 = v19;
      }
    }
  }
  else
  {
    [(MBServiceCache *)[(MBServiceEngine *)self cache] forceRefreshForBackupUDID:[(MBServiceEngine *)self backupUDID]];
    id v18 = [v26 code];
    return +[MBError errorWithCode:v18 error:v26 format:@"Error adding files to service"];
  }
  return result;
}

- (id)_putBatchInChunkStore:(id)a3 fileAuthTokens:(id)a4
{
  uint64_t v54 = 0;
  id v45 = +[NSMutableDictionary dictionary];
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v7 = [a4 countByEnumeratingWithState:&v50 objects:v68 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v51;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v51 != v9) {
        objc_enumerationMutation(a4);
      }
      uint64_t v11 = *(void **)(*((void *)&v50 + 1) + 8 * v10);
      if (![v11 fileID] || !objc_msgSend(v11, "authToken")) {
        break;
      }
      double v13 = -[MBFileID initWithData:]([MBFileID alloc], "initWithData:", [v11 fileID]);
      objc_msgSend(v45, "setObject:forKeyedSubscript:", objc_msgSend(v11, "authToken"), v13);

      if (v8 == (id)++v10)
      {
        id v8 = [a4 countByEnumeratingWithState:&v50 objects:v68 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_12;
      }
    }
    BOOL v14 = +[MBError errorWithCode:309 format:@"Response file auth-token from post does not contain file ID and auth-token"];
    uint64_t v54 = v14;
    if (v14) {
      return v14;
    }
  }
LABEL_12:
  unint64_t v41 = self;
  id v42 = a3;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "items");
  id v15 = [obj countByEnumeratingWithState:&v46 objects:v67 count:16];
  if (v15)
  {
    id v16 = v15;
    uint64_t v17 = *(void *)v47;
LABEL_14:
    uint64_t v18 = 0;
    id v43 = v16;
    while (1)
    {
      if (*(void *)v47 != v17) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(void **)(*((void *)&v46 + 1) + 8 * v18);
      id v21 = objc_msgSend(v45, "objectForKeyedSubscript:", objc_msgSend(v19, "fileID"));
      if (!v21) {
        break;
      }
      id v22 = v21;
      long long v23 = MBGetDefaultLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        id v24 = [v19 itemID];
        id v25 = [v19 path];
        id v26 = [v19 fileID];
        uint64_t v27 = v17;
        id v28 = [v19 signature];
        id v29 = [v19 size];
        *(_DWORD *)stat buf = 138413570;
        id v56 = v22;
        __int16 v57 = 2048;
        id v58 = v24;
        __int16 v59 = 2112;
        id v60 = v25;
        __int16 v61 = 2112;
        id v62 = v26;
        __int16 v63 = 2112;
        id v64 = v28;
        __int16 v65 = 2048;
        id v66 = v29;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "Auth token %@ assigned to item %llu at %@ (%@) with signature %@ and size %{bytes}llu", buf, 0x3Eu);
        id v30 = [v19 itemID];
        id v31 = [v19 path];
        id v32 = [v19 fileID];
        id v39 = [v19 signature];
        id v40 = [v19 size];
        id v37 = v31;
        id v38 = v32;
        id v35 = v22;
        id v36 = v30;
        uint64_t v17 = v27;
        id v16 = v43;
        _MBLog();
      }
      objc_msgSend(v19, "setAuthToken:", v22, v35, v36, v37, v38, v39, v40);
      if (v16 == (id)++v18)
      {
        id v16 = [obj countByEnumeratingWithState:&v46 objects:v67 count:16];
        if (v16) {
          goto LABEL_14;
        }
        goto LABEL_25;
      }
    }
    BOOL v14 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 309, @"Response from post missing auth-token for item: %@ (%@)", [v19 path], objc_msgSend(v19, "fileID"));
    uint64_t v54 = v14;
    if (!v14) {
      goto LABEL_25;
    }
    return v14;
  }
  else
  {
LABEL_25:
    if (-[MBChunkStore putBatch:error:](-[MBServiceEngine chunkStore](v41, "chunkStore"), "putBatch:error:", [v42 chunkStoreBatch], &v54))
    {
      return 0;
    }
    else
    {
      id v34 = [(MBError *)v54 code];
      return +[MBError errorWithCode:v34 error:v54 format:@"Error putting items into chunk store"];
    }
  }
}

- (id)_commitBatchToService:(id)a3
{
  uint64_t v112 = 0;
  id v113 = 0;
  if (MBShouldInjectError())
  {
    CFStringRef v6 = @"Simulated error before committing files";
LABEL_5:
    uint64_t v7 = 1;
LABEL_6:
    return +[MBError errorWithCode:v7 format:v6];
  }
  [(MBDebugContext *)self->super.super._debugContext performSelectorForName:@"CommittingBatchOfFilesToSnapshot" withObject:self->super.super._debugContext];
  if ([(MBDebugContext *)[(MBEngine *)self debugContext] isFlagSet:@"SimulateErrorBeforeCommittingFiles"])
  {
    CFStringRef v6 = @"SimulatedErrorBeforeCommittingFiles";
    goto LABEL_5;
  }
  if ([(MBDebugContext *)[(MBEngine *)self debugContext] isFlagSet:@"SimulateFilesModifiedBeforeCommittingFiles"])
  {
    CFStringRef v6 = @"SimulateFilesModifiedBeforeCommittingFiles";
    uint64_t v7 = 9;
    goto LABEL_6;
  }
  id v86 = +[NSMutableArray array];
  long long v108 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  id v92 = a3;
  id v9 = objc_msgSend(objc_msgSend(a3, "chunkStoreBatch"), "items");
  id v10 = [v9 countByEnumeratingWithState:&v108 objects:v125 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v109;
    while (2)
    {
      for (unsigned int i = 0; i != v11; unsigned int i = (char *)i + 1)
      {
        if (*(void *)v109 != v12) {
          objc_enumerationMutation(v9);
        }
        BOOL v14 = *(void **)(*((void *)&v108 + 1) + 8 * i);
        if (![v14 error])
        {
          if (![v14 receipt])
          {
            id v113 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 309, @"Response from put missing receipt for item: %@ (%@)", [v14 path], objc_msgSend(v14, "fileID"));
            goto LABEL_23;
          }
          id v16 = objc_alloc_init(MBSFilePutReceipt);
          -[MBSFilePutReceipt setFileID:](v16, "setFileID:", objc_msgSend(objc_msgSend(v14, "fileID"), "data"));
          -[MBSFilePutReceipt setPutReceipt:](v16, "setPutReceipt:", [v14 receipt]);
          [v86 addObject:v16];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v108 objects:v125 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_23:
  id v17 = v113;
  if (v113) {
    return v17;
  }
  if ([v86 count])
  {
    [(MBServiceCache *)[(MBServiceEngine *)self cache] setStale:1 forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
    id obj = [[(MBServiceEngine *)self service] commitFilePutReceipts:v86 backupUDID:[(MBServiceEngine *)self backupUDID] snapshotID:self->_snapshotID lastModified:&v112 error:&v113];
    if (!obj)
    {
      [(MBServiceCache *)[(MBServiceEngine *)self cache] forceRefreshForBackupUDID:[(MBServiceEngine *)self backupUDID]];
      id v39 = [v113 code];
      return +[MBError errorWithCode:v39 error:v113 format:@"Error committing files to service"];
    }
    if (v112 <= 0) {
      return +[MBError errorWithCode:309 format:@"No Last-Modified value in response to committing files"];
    }
  }
  else
  {
    id obj = 0;
  }
  SEL v90 = a2;
  uint64_t v18 = MBGetDefaultLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Checking commit results", buf, 2u);
    _MBLog();
  }
  v85 = self;
  id v19 = +[NSMutableDictionary dictionary];
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v20 = [obj countByEnumeratingWithState:&v104 objects:v124 count:16];
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v105;
    do
    {
      for (j = 0; j != v21; j = (char *)j + 1)
      {
        if (*(void *)v105 != v22) {
          objc_enumerationMutation(obj);
        }
        id v24 = *(void **)(*((void *)&v104 + 1) + 8 * (void)j);
        id v26 = +[MBFileID fileIDWithData:](MBFileID, "fileIDWithData:", [v24 fileID]);
        if (!v26) {
          [+[NSAssertionHandler currentHandler] handleFailureInMethod:v90 object:self file:@"MBServiceBackupEngine.m" lineNumber:1777 description:@"Failed to convert file ID"];
        }
        objc_msgSend(v19, "setObject:forKeyedSubscript:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (int)objc_msgSend(v24, "result")), v26);
      }
      id v21 = [obj countByEnumeratingWithState:&v104 objects:v124 count:16];
    }
    while (v21);
  }
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v27 = objc_msgSend(objc_msgSend(v92, "chunkStoreBatch"), "items");
  id v28 = [v27 countByEnumeratingWithState:&v100 objects:v123 count:16];
  if (!v28) {
    goto LABEL_58;
  }
  id v29 = v28;
  uint64_t v30 = *(void *)v101;
  while (2)
  {
    for (k = 0; k != v29; k = (char *)k + 1)
    {
      if (*(void *)v101 != v30) {
        objc_enumerationMutation(v27);
      }
      id v32 = *(void **)(*((void *)&v100 + 1) + 8 * (void)k);
      if (![v32 error])
      {
        id v34 = objc_msgSend(v19, "objectForKeyedSubscript:", objc_msgSend(v32, "fileID"));
        if (v34)
        {
          id v35 = [v34 integerValue];
          if (!v35)
          {
            id v36 = MBGetDefaultLog();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              id v37 = [v32 path];
              CFStringRef v38 = (const __CFString *)[v32 fileID];
              *(_DWORD *)stat buf = 138412546;
              unint64_t v115 = (unint64_t)v37;
              __int16 v116 = 2112;
              CFStringRef v117 = v38;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, "Committed item: %@ (%@)", buf, 0x16u);
              id v81 = [v32 path];
              CFStringRef v82 = (const __CFString *)[v32 fileID];
              _MBLog();
            }
            goto LABEL_51;
          }
          id v40 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 1, @"Committing item failed (%ld): %@ (%@)", v35, [v32 path], objc_msgSend(v32, "fileID"));
        }
        else
        {
          id v40 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 309, @"No commit result for item: %@ (%@)", [v32 path], objc_msgSend(v32, "fileID"), v83);
        }
        id v113 = v40;
        goto LABEL_58;
      }
LABEL_51:
    }
    id v29 = [v27 countByEnumeratingWithState:&v100 objects:v123 count:16];
    if (v29) {
      continue;
    }
    break;
  }
LABEL_58:
  id v17 = v113;
  if (v113) {
    return v17;
  }
  id v113 = 0;
  unint64_t v41 = v85;
  [(MBServiceCache *)[(MBServiceEngine *)v85 cache] begin];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v87 = objc_msgSend(objc_msgSend(v92, "chunkStoreBatch"), "items");
  id v93 = [v87 countByEnumeratingWithState:&v96 objects:v122 count:16];
  uint64_t v42 = 0;
  if (!v93)
  {
    unint64_t v88 = 0;
    v89 = 0;
    goto LABEL_115;
  }
  unint64_t v88 = 0;
  v89 = 0;
  uint64_t v91 = *(void *)v97;
  id v43 = ATClientController_ptr;
  while (2)
  {
    uint64_t v44 = 0;
    while (2)
    {
      uint64_t v45 = v42;
      if (*(void *)v97 != v91) {
        objc_enumerationMutation(v87);
      }
      long long v46 = *(void **)(*((void *)&v96 + 1) + 8 * v44);
      if (![v46 error])
      {
        long long v50 = MBGetDefaultLog();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          id v51 = [v46 path];
          CFStringRef v52 = (const __CFString *)[v46 fileID];
          *(_DWORD *)stat buf = 138412546;
          unint64_t v115 = (unint64_t)v51;
          __int16 v116 = 2112;
          CFStringRef v117 = v52;
          _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "Put item into chunk store: %@ (%@)", buf, 0x16u);
          id v81 = [v46 path];
          CFStringRef v82 = (const __CFString *)[v46 fileID];
          _MBLog();
        }
        -[MBServiceCache setCommitted:forFileID:snapshotID:backupUDID:](-[MBServiceEngine cache](v41, "cache", v81, v82, v83, v84), "setCommitted:forFileID:snapshotID:backupUDID:", 1, [v46 fileID], v41->_snapshotID, -[MBServiceEngine backupUDID](v41, "backupUDID"));
        -[MBServiceCache setResult:forFileChangeID:](-[MBServiceEngine cache](v41, "cache"), "setResult:forFileChangeID:", 1, [v46 fileID]);
        id v43 = ATClientController_ptr;
        goto LABEL_108;
      }
      obja = v47;
      if (objc_msgSend(v43[73], "isError:withCode:", objc_msgSend(v46, "error"), 4)) {
        goto LABEL_68;
      }
      if (objc_msgSend(v43[73], "isError:withCode:", objc_msgSend(v46, "error"), 9)) {
        goto LABEL_75;
      }
      if (objc_msgSend(v43[73], "isError:withCode:", objc_msgSend(v46, "error"), 4))
      {
LABEL_68:
        -[NSMutableSet addObject:](v41->_modifiedDomains, "addObject:", objc_msgSend(v46, "domain", v81, v82));
        -[MBServiceCache setResult:forFileChangeID:](-[MBServiceEngine cache](v41, "cache"), "setResult:forFileChangeID:", 2, [v46 fileID]);
        if (![(MBServiceRetryStrategy *)[(MBServiceEngine *)v41 retryStrategy] wouldRetry]) {
          [(MBChunkStoreProgressModel *)[(MBChunkStore *)[(MBServiceEngine *)v41 chunkStore] progressModel] abortedTransferringItem:v46];
        }
        int v48 = 0;
        uint64_t v42 = 1;
        long long v49 = @"File deleted before being put into chunk store";
        goto LABEL_78;
      }
      if (objc_msgSend(v43[73], "isError:withCode:", objc_msgSend(v46, "error"), 9))
      {
LABEL_75:
        -[NSMutableSet addObject:](v41->_modifiedDomains, "addObject:", objc_msgSend(v46, "domain", v81, v82));
        -[MBServiceCache setResult:forFileChangeID:](-[MBServiceEngine cache](v41, "cache"), "setResult:forFileChangeID:", 2, [v46 fileID]);
        if (![(MBServiceRetryStrategy *)[(MBServiceEngine *)v41 retryStrategy] wouldRetry]) {
          [(MBChunkStoreProgressModel *)[(MBChunkStore *)[(MBServiceEngine *)v41 chunkStore] progressModel] abortedTransferringItem:v46];
        }
        int v48 = 0;
        uint64_t v42 = 1;
        long long v49 = @"File modified before being put into chunk store";
LABEL_78:
        CFStringRef v53 = v49;
      }
      else
      {
        if (-[MBServiceRetryStrategy canRetryAfterError:](-[MBServiceEngine retryStrategy](v41, "retryStrategy"), "canRetryAfterError:", [v46 error]))
        {
          uint64_t v42 = 0;
          if (!v113) {
            id v113 = [v46 error];
          }
        }
        else
        {
          if (!v113
            || (id v62 = [(MBServiceEngine *)v41 retryStrategy],
                [(MBServiceRetryStrategy *)v62 canRetryAfterError:v113]))
          {
            id v113 = objc_msgSend(v46, "error", v81, v82);
          }
          uint64_t v42 = 16;
        }
        -[MBServiceCache setResult:forFileChangeID:](-[MBServiceEngine cache](v41, "cache", v81, v82), "setResult:forFileChangeID:", 3, [v46 fileID]);
        long long v49 = (__CFString *)objc_msgSend(v43[73], "descriptionForError:", objc_msgSend(objc_msgSend(objc_msgSend(v46, "error"), "userInfo"), "objectForKeyedSubscript:", NSUnderlyingErrorKey));
        int v48 = 1;
        CFStringRef v53 = @"Error putting item into chunk store";
      }
      uint64_t v54 = MBGetDefaultLog();
      if (!os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        if ([(__CFString *)v89 isEqualToString:v49])
        {
          ++v88;
LABEL_106:

          v89 = v49;
          goto LABEL_107;
        }
        if (v88)
        {
          __int16 v59 = MBGetDefaultLog();
          if (os_log_type_enabled(v59, (os_log_type_t)v45))
          {
            *(_DWORD *)stat buf = 134218242;
            CFStringRef v60 = &stru_100418BA8;
            if (v88 > 1) {
              CFStringRef v60 = @"s";
            }
            unint64_t v115 = v88;
            __int16 v116 = 2112;
            CFStringRef v117 = v60;
            _os_log_impl((void *)&_mh_execute_header, v59, (os_log_type_t)v45, "Repeated %lu time%@...", buf, 0x16u);
            CFStringRef v63 = &stru_100418BA8;
            if (v88 > 1) {
              CFStringRef v63 = @"s";
            }
            id v81 = (id)v88;
            CFStringRef v82 = v63;
            _MBLog();
          }
        }
        id v64 = MBGetDefaultLog();
        BOOL v65 = os_log_type_enabled(v64, (os_log_type_t)v42);
        if (v48)
        {
          if (v65)
          {
            CFStringRef v66 = (const __CFString *)[v46 path];
            id v67 = [v46 fileID];
            id v68 = +[MBError descriptionForError:paths:](MBError, "descriptionForError:paths:", [v46 error], 0);
            *(_DWORD *)stat buf = 138413058;
            unint64_t v115 = (unint64_t)v53;
            __int16 v116 = 2112;
            CFStringRef v117 = v66;
            __int16 v118 = 2112;
            id v119 = v67;
            __int16 v120 = 2112;
            id v121 = v68;
            _os_log_impl((void *)&_mh_execute_header, v64, (os_log_type_t)v42, "%@: %@ (%@): %@", buf, 0x2Au);
            CFStringRef v71 = (const __CFString *)objc_msgSend(v46, "path", v81, v82);
            id v43 = ATClientController_ptr;
            id v83 = [v46 fileID];
            id v84 = +[MBError descriptionForError:paths:](MBError, "descriptionForError:paths:", [v46 error], 0);
            id v81 = (id)v53;
            CFStringRef v82 = v71;
            _MBLog();
            unint64_t v88 = 0;
            unint64_t v41 = v85;
            goto LABEL_106;
          }
        }
        else if (v65)
        {
          CFStringRef v69 = (const __CFString *)[v46 path];
          id v70 = [v46 fileID];
          *(_DWORD *)stat buf = 138412802;
          unint64_t v115 = (unint64_t)v53;
          __int16 v116 = 2112;
          CFStringRef v117 = v69;
          __int16 v118 = 2112;
          id v119 = v70;
          _os_log_impl((void *)&_mh_execute_header, v64, (os_log_type_t)v42, "%@: %@ (%@)", buf, 0x20u);
          id v43 = ATClientController_ptr;
          CFStringRef v82 = (const __CFString *)objc_msgSend(v46, "path", v81, v82);
          id v83 = [v46 fileID];
          id v81 = (id)v53;
          _MBLog();
          unint64_t v88 = 0;
          goto LABEL_106;
        }
        unint64_t v88 = 0;
        id v43 = ATClientController_ptr;
        goto LABEL_106;
      }
      id v55 = MBGetDefaultLog();
      if (os_log_type_enabled(v55, (os_log_type_t)v42))
      {
        CFStringRef v56 = (const __CFString *)[v46 path];
        id v57 = [v46 fileID];
        id v58 = objc_msgSend(v43[73], "descriptionForError:paths:", objc_msgSend(v46, "error"), 0);
        *(_DWORD *)stat buf = 138413058;
        unint64_t v115 = (unint64_t)v53;
        __int16 v116 = 2112;
        CFStringRef v117 = v56;
        __int16 v118 = 2112;
        id v119 = v57;
        __int16 v120 = 2112;
        id v121 = v58;
        _os_log_impl((void *)&_mh_execute_header, v55, (os_log_type_t)v42, "%@: %@ (%@): %@", buf, 0x2Au);
        CFStringRef v61 = (const __CFString *)[v46 path];
        id v43 = ATClientController_ptr;
        id v83 = [v46 fileID];
        id v84 = +[MBError descriptionForError:paths:](MBError, "descriptionForError:paths:", [v46 error], 0);
        id v81 = (id)v53;
        CFStringRef v82 = v61;
        _MBLog();
        uint64_t v42 = v45;
        unint64_t v41 = v85;
      }
      else
      {
        uint64_t v42 = v45;
      }
LABEL_107:
      long long v47 = obja;
LABEL_108:
      if (v93 != (id)++v44) {
        continue;
      }
      break;
    }
    id v72 = [v87 countByEnumeratingWithState:&v96 objects:v122 count:16];
    id v93 = v72;
    if (v72) {
      continue;
    }
    break;
  }
LABEL_115:

  if ([v86 count])
  {
    v73 = [(MBServiceEngine *)v41 cache];
    uint64_t v74 = v112;
    int64_t snapshotID = v85->_snapshotID;
    v76 = [(MBServiceEngine *)v85 backupUDID];
    int64_t v77 = snapshotID;
    unint64_t v41 = v85;
    [(MBServiceCache *)v73 setLastModified:v74 forSnapshotID:v77 backupUDID:v76];
    [(MBServiceCache *)[(MBServiceEngine *)v85 cache] setStale:0 forSnapshotID:v85->_snapshotID backupUDID:[(MBServiceEngine *)v85 backupUDID]];
    v78 = [(MBServiceEngine *)v85 cache];
    [(MBServiceCache *)v78 setLastModified:v112 forBackupUDID:[(MBServiceEngine *)v85 backupUDID]];
  }
  [(MBServiceCache *)[(MBServiceEngine *)v41 cache] end];
  if (v88)
  {
    v79 = MBGetDefaultLog();
    if (os_log_type_enabled(v79, (os_log_type_t)v42))
    {
      if (v88 <= 1) {
        CFStringRef v80 = &stru_100418BA8;
      }
      else {
        CFStringRef v80 = @"s";
      }
      *(_DWORD *)stat buf = 134218242;
      unint64_t v115 = v88;
      __int16 v116 = 2112;
      CFStringRef v117 = v80;
      _os_log_impl((void *)&_mh_execute_header, v79, (os_log_type_t)v42, "Repeated %lu time%@...", buf, 0x16u);
      _MBLog();
    }
  }
  return v113;
}

- (void)_retry
{
  [(MBChunkStoreProgressModel *)[(MBChunkStore *)[(MBServiceEngine *)self chunkStore] progressModel] retrying];
  [(MBFileScanner *)self->_fileScanner reset];
  [(NSMutableSet *)self->_modifiedDomains removeAllObjects];
  self->_int64_t snapshotID = 0;
  self->_unint64_t totalFileChangeCount = 0;
  self->_unint64_t totalFileChangeSize = 0;
  self->_snapshotQuotaReserved = 0;
  [(MBServiceCache *)[(MBServiceEngine *)self cache] vacuum];
  id v3 = [(MBServiceEngine *)self cache];
  [(MBServiceCache *)v3 analyze];
}

- (id)_removeAbortedFiles
{
  id v41 = 0;
  +[NSDate timeIntervalSinceReferenceDate];
  double v4 = v3;
  double v5 = MBGetDefaultLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Removing aborted files", buf, 2u);
    _MBLog();
  }
  CFStringRef v6 = 0;
  uint64_t v7 = 0;
  while (1)
  {
    id v9 = -[MBServiceCache fileChangeIDsWithResult:offset:limit:](-[MBServiceEngine cache](self, "cache"), "fileChangeIDsWithResult:offset:limit:", 2, v6, objc_msgSend(-[MBServiceCache configuration](-[MBServiceEngine cache](self, "cache"), "configuration"), "removeFilesCount"));
    if (![v9 count]) {
      break;
    }
    context = v8;
    id v10 = MBGetDefaultLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [v9 count];
      *(_DWORD *)stat buf = 134217984;
      *(void *)&uint8_t buf[4] = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Removing %lu aborted files", buf, 0xCu);
      id v29 = [v9 count];
      _MBLog();
    }
    uint64_t v30 = v6;
    id v32 = v7;
    [(MBServiceCache *)[(MBServiceEngine *)self cache] setStale:1 forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
    id v12 = +[NSMutableArray array];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v13 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v38;
      do
      {
        for (unsigned int i = 0; i != v14; unsigned int i = (char *)i + 1)
        {
          if (*(void *)v38 != v15) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void *)(*((void *)&v37 + 1) + 8 * i);
          objc_msgSend(v12, "addObject:", +[MBSFileID fileIDWithMBFileID:](MBSFileID, "fileIDWithMBFileID:", v17));
        }
        id v14 = [v9 countByEnumeratingWithState:&v37 objects:v46 count:16];
      }
      while (v14);
    }
    *(void *)stat buf = 0;
    if (![[(MBServiceEngine *)self service] removeFileIDs:v12 backupUDID:[(MBServiceEngine *)self backupUDID] snapshotID:self->_snapshotID lastModified:buf error:&v41])
    {
      id v25 = [v41 code];
      id v41 = +[MBError errorWithCode:v25 error:v41 format:@"Error removing files from snapshot"];
      id v8 = context;
      uint64_t v7 = v32;
      break;
    }
    [(MBServiceCache *)[(MBServiceEngine *)self cache] begin];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v19 = [v9 countByEnumeratingWithState:&v33 objects:v45 count:16];
    if (v19)
    {
      id v20 = v19;
      uint64_t v21 = *(void *)v34;
      do
      {
        for (j = 0; j != v20; j = (char *)j + 1)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v9);
          }
          [(MBServiceCache *)[(MBServiceEngine *)self cache] removeFileID:*(void *)(*((void *)&v33 + 1) + 8 * (void)j) forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
        }
        id v20 = [v9 countByEnumeratingWithState:&v33 objects:v45 count:16];
      }
      while (v20);
    }
    long long v23 = [(MBServiceEngine *)self cache];
    [(MBServiceCache *)v23 setLastModified:*(void *)buf forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
    [(MBServiceCache *)[(MBServiceEngine *)self cache] setStale:0 forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
    id v24 = [(MBServiceEngine *)self cache];
    [(MBServiceCache *)v24 setLastModified:*(void *)buf forBackupUDID:[(MBServiceEngine *)self backupUDID]];
    [(MBServiceCache *)[(MBServiceEngine *)self cache] end];
    uint64_t v7 = &v32[(void)[v9 count]];
    CFStringRef v6 = &v30[(void)[v9 count]];
  }
  if (v41) {
    return v41;
  }
  id v27 = MBGetDefaultLog();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    +[NSDate timeIntervalSinceReferenceDate];
    *(_DWORD *)stat buf = 134218240;
    *(void *)&uint8_t buf[4] = v7;
    __int16 v43 = 2048;
    double v44 = v28 - v4;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Removed %lu aborted files in %0.3fs", buf, 0x16u);
    +[NSDate timeIntervalSinceReferenceDate];
    _MBLog();
  }
  return 0;
}

- (id)_commitSnapshot
{
  if (![(MBServiceCache *)[(MBServiceEngine *)self cache] areAllFilesCommittedForSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]])[+[NSAssertionHandler currentHandler] handleFailureInMethod:a2 object:self file:@"MBServiceBackupEngine.m" lineNumber:2007 description:@"Not all files have been committed"]; {
  uint64_t v18 = 0;
  }
  id v19 = 0;
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  CFStringRef v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)stat buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Committing snapshot", buf, 2u);
    _MBLog();
  }
  [(MBDebugContext *)[(MBEngine *)self debugContext] performSelectorForName:@"CommittingSnapshot"];
  if ([(MBDebugContext *)[(MBEngine *)self debugContext] isFlagSet:@"SimulateErrorBeforeCommittingSnapshot"])
  {
    CFStringRef v7 = @"SimulatedErrorBeforeCommittingSnapshot";
    uint64_t v8 = 1;
    return +[MBError errorWithCode:v8 format:v7];
  }
  [(MBServiceEngine *)self releaseLock];
  if ([[(MBServiceEngine *)self service] commitSnapshotForID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID] lastModified:&v18 error:&v19])
  {
    if (v18 <= 0)
    {
      CFStringRef v7 = @"No Last-Modified value in response to committing snapshot";
      uint64_t v8 = 309;
      return +[MBError errorWithCode:v8 format:v7];
    }
    [(MBServiceCache *)[(MBServiceEngine *)self cache] begin];
    id v10 = [(MBServiceEngine *)self cache];
    [(MBServiceCache *)v10 setCommitted:v18 forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
    id v11 = [(MBServiceEngine *)self cache];
    [+[NSDate date] timeIntervalSince1970];
    [(MBServiceCache *)v11 setLocalCommitted:(uint64_t)v12 snapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
    id v13 = [(MBServiceEngine *)self cache];
    [(MBServiceCache *)v13 setLastModified:v18 forSnapshotID:self->_snapshotID backupUDID:[(MBServiceEngine *)self backupUDID]];
    id v14 = [(MBServiceEngine *)self cache];
    [(MBServiceCache *)v14 setLastModified:v18 forBackupUDID:[(MBServiceEngine *)self backupUDID]];
    [(MBServiceCache *)[(MBServiceEngine *)self cache] updateFileChangesAfterCommittingSnapshot];
    [(MBServiceCache *)[(MBServiceEngine *)self cache] removeAllFilesMissingEncryptionKey];
    [(MBServiceCache *)[(MBServiceEngine *)self cache] removeAllFileEncryptionKeys];
    [(MBServiceCache *)[(MBServiceEngine *)self cache] end];
    if ([(MBDebugContext *)self->super.super._debugContext isFlagSet:@"VerifyCache"])[(MBServiceCache *)[(MBServiceEngine *)self cache] verifyBackupUDID:[(MBServiceEngine *)self backupUDID] service:[(MBServiceEngine *)self service]]; {
    uint64_t v15 = MBGetDefaultLog();
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      +[NSDate timeIntervalSinceReferenceDate];
      *(_DWORD *)stat buf = 134217984;
      double v21 = v16 - v5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Committed snapshot in %0.3f s", buf, 0xCu);
      +[NSDate timeIntervalSinceReferenceDate];
      _MBLog();
    }
    return 0;
  }
  else
  {
    [(MBServiceCache *)[(MBServiceEngine *)self cache] forceRefreshForBackupUDID:[(MBServiceEngine *)self backupUDID]];
    id v17 = [v19 code];
    return +[MBError errorWithCode:v17 error:v19 format:@"Error committing snapshot"];
  }
}

- (id)_snapshotAttributes
{
  id v3 = +[MBSSnapshotAttributes systemAttributes];
  [v3 setKeybagID:self->_keybagID];
  objc_msgSend(v3, "setKeybagUUID:", -[MBServiceEncryptionManager keybagUUID](-[MBServiceEngine encryptionManager](self, "encryptionManager"), "keybagUUID"));
  [v3 setBackupReason:self->_reason];
  [v3 setBackupType:self->_type];
  return v3;
}

- (id)_extendedAttributesForPathFSR:(const char *)a3 quiet:(BOOL)a4 error:(id *)a5
{
  id result = +[MBExtendedAttributes attributesForPathFSR:a3 error:a5];
  if (result)
  {
    id v8 = result;
    unint64_t v9 = +[MBExtendedAttributes sizeOfAttributes:result];
    id result = v9 >= 0x801 ? &__NSDictionary0__struct : v8;
    if (v9 >= 0x801 && !a4)
    {
      id v10 = MBGetDefaultLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)stat buf = 134218498;
        unint64_t v12 = v9;
        __int16 v13 = 1024;
        int v14 = 2048;
        __int16 v15 = 2080;
        double v16 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Extended attributes size greater than supported (%{bytes}lu > %{bytes}d): %s", buf, 0x1Cu);
        _MBLog();
      }
      return &__NSDictionary0__struct;
    }
  }
  return result;
}

- (NSSet)keyBagInfo
{
  return (NSSet *)objc_getProperty(self, a2, 256, 1);
}

- (void)setKeyBagInfo:(id)a3
{
}

- (BOOL)isCloudPhotosEnabled
{
  return self->_isCloudPhotosEnabled;
}

- (void)setIsCloudPhotosEnabled:(BOOL)a3
{
  self->_isCloudPhotosEnabled = a3;
}

@end