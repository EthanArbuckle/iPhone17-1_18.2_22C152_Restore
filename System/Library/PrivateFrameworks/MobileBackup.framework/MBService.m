@interface MBService
+ (id)backupUDIDForPath:(id)a3;
- (BOOL)backupStatusInfo:(id)a3 backupUDID:(id)a4 error:(id *)a5;
- (BOOL)commitSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6;
- (BOOL)createKeySet:(id)a3 forBackupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6;
- (BOOL)createSnapshot:(id)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6 snapshotID:(unsigned int *)a7;
- (BOOL)deleteAccountWithError:(id *)a3;
- (BOOL)deleteBackupForUDID:(id)a3 error:(id *)a4;
- (BOOL)deleteSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6;
- (BOOL)disableWWAN;
- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4;
- (BOOL)mergeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6;
- (BOOL)postBackup:(id)a3 lastModified:(int64_t *)a4 error:(id *)a5;
- (BOOL)removeDomainName:(id)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6;
- (BOOL)removeFileIDs:(id)a3 backupUDID:(id)a4 snapshotID:(unint64_t)a5 lastModified:(int64_t *)a6 error:(id *)a7;
- (BOOL)restoreCompleteWithInfo:(id)a3 backupUDID:(id)a4 error:(id *)a5;
- (BOOL)sleepWithError:(id *)a3;
- (BOOL)suppressUnauthorizedAlert;
- (BOOL)updateKeySet:(id)a3 forBackupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6;
- (BOOL)updateSnapshot:(id)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6;
- (BOOL)wasCancelled;
- (MBService)initWithAccount:(id)a3;
- (MBServiceAccount)account;
- (double)protocolVersion;
- (id)_sendRequestWithMethod:(id)a3 path:(id)a4 message:(id)a5 responseClass:(Class)a6 lastModified:(int64_t *)a7 error:(id *)a8;
- (id)_sendRequestWithMethod:(id)a3 path:(id)a4 messages:(id)a5 responseClass:(Class)a6 lastModified:(int64_t *)a7 error:(id *)a8;
- (id)_sendRequestWithMethod:(id)a3 path:(id)a4 requestBody:(id)a5 lastModified:(int64_t *)a6 error:(id *)a7;
- (id)accountWithError:(id *)a3;
- (id)addFiles:(id)a3 backupUDID:(id)a4 snapshotID:(unint64_t)a5 lastModified:(int64_t *)a6 error:(id *)a7;
- (id)backupForUDID:(id)a3 lastModified:(int64_t *)a4 error:(id *)a5;
- (id)commitFilePutReceipts:(id)a3 backupUDID:(id)a4 snapshotID:(unint64_t)a5 lastModified:(int64_t *)a6 error:(id *)a7;
- (id)delegate;
- (id)getFileIDs:(id)a3 backupUDID:(id)a4 snapshotID:(unint64_t)a5 lastModified:(int64_t *)a6 error:(id *)a7;
- (id)keysetForBackupUDID:(id)a3 lastModified:(int64_t *)a4 error:(id *)a5;
- (id)listFilesForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5;
- (id)listFilesForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 error:(id *)a7;
- (id)lockForBackupUDID:(id)a3;
- (void)cancel;
- (void)dealloc;
- (void)removeLockForBackupUDID:(id)a3;
- (void)setCancelled:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableWWAN:(BOOL)a3;
- (void)setLock:(id)a3 forBackupUDID:(id)a4;
- (void)setSuppressUnauthorizedAlert:(BOOL)a3;
@end

@implementation MBService

- (MBService)initWithAccount:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MBService;
  v4 = [(MBService *)&v6 init];
  if (v4)
  {
    v4->_account = (MBServiceAccount *)a3;
    v4->_locksByBackupUDID = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    v4->_disableWWAN = 0;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MBService;
  [(MBService *)&v3 dealloc];
}

- (id)lockForBackupUDID:(id)a3
{
  return [(NSMutableDictionary *)self->_locksByBackupUDID objectForKeyedSubscript:a3];
}

- (void)setLock:(id)a3 forBackupUDID:(id)a4
{
}

- (void)removeLockForBackupUDID:(id)a3
{
}

- (void)cancel
{
  self->_cancelled = 1;
  [(MBURLConnection *)self->_connection cancel];
}

+ (id)backupUDIDForPath:(id)a3
{
  id v3 = [a3 componentsSeparatedByString:@"/"];
  if ((unint64_t)[v3 count] < 4) {
    return 0;
  }
  return [v3 objectAtIndexedSubscript:3];
}

- (id)_sendRequestWithMethod:(id)a3 path:(id)a4 requestBody:(id)a5 lastModified:(int64_t *)a6 error:(id *)a7
{
  id v46 = 0;
  id v47 = 0;
  id v11 = +[MBService backupUDIDForPath:a4];
  id v12 = [(MBService *)self lockForBackupUDID:v11];
  if (MBShouldInjectError())
  {
LABEL_2:
    if (!a7) {
      return 0;
    }
    v13 = MBError;
    CFStringRef v14 = @"Simulated error before service request";
  }
  else
  {
    id v42 = v11;
    uint64_t v16 = 3;
    v17 = ATClientController_ptr;
    id v44 = a3;
    while (1)
    {
      v18 = +[MBURLRequest requestWithMethod:URL:](MBURLRequest, "requestWithMethod:URL:", a3, +[NSURL URLWithString:[(NSString *)[(NSURL *)[(MBServiceAccount *)self->_account serviceURL] absoluteString] stringByAppendingString:a4]]);
      [(MBURLRequest *)v18 setValue:[(MBServiceAccount *)self->_account clientInfoHeader] forHeader:@"X-MMe-Client-Info"];
      [(MBURLRequest *)v18 setValue:MBRandomUUID() forHeader:@"X-Apple-Request-UUID"];
      [(MBURLRequest *)v18 setValue:@"2.2" forHeader:@"X-Apple-MBS-Protocol-Version"];
      [(MBURLRequest *)v18 setValue:@"application/vnd.com.apple.mbs+protobuf" forHeader:@"Accept"];
      if (a5) {
        [(MBURLRequest *)v18 setValue:@"application/vnd.com.apple.mbs+protobuf" forHeader:@"Content-Type"];
      }
      if (v12)
      {
        if ([v12 state])
        {
          if ([v12 state] == 1)
          {
            v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Hold %@", [v12 owner], v38, v39);
          }
          else
          {
            if ([v12 state] != 2) {
              -[NSAssertionHandler handleFailureInMethod:object:file:lineNumber:description:](+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MBService.m", 113, @"Invalid state: %d", [v12 state]);
            }
            v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Release %@", [v12 owner], v38, v39);
          }
        }
        else
        {
          if ([v12 type]) {
            CFStringRef v20 = @"Restore";
          }
          else {
            CFStringRef v20 = @"Backup";
          }
          v17 = ATClientController_ptr;
          id v11 = v42;
          v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"Acquire %@ %@; timeout=%d",
                  v20,
                  [v12 owner],
                  ((int)[v12 timeout] / 60));
        }
        [(MBURLRequest *)v18 setValue:v19 forHeader:@"X-Apple-MBS-Lock"];
        a3 = v44;
      }
      [(MBURLRequest *)v18 setData:a5];
      [(MBURLRequest *)v18 setMMePreAuth:1];
      uint64_t v21 = self->_disableWWAN ? MBNoCellularURLConnectionProperties() : 0;
      if (self->_cancelled)
      {
        id v22 = [v17[73] errorWithCode:202 format:@"Service request cancelled"];
        id v15 = 0;
        id v47 = v22;
      }
      else
      {
        id v15 = +[MBURLConnection sendSyncRequest:v18 properties:v21 connection:&self->_connection response:&v46 error:&v47];
        id v22 = v47;
      }
      id v23 = [v17[73] errorForHTTPURLResponse:v46 error:v22];
      id v47 = v23;
      if (!v23) {
        break;
      }
      if ([v17[73] isError:v23 withCode:305]
        && +[MBKeyBag wasDeviceUnlockedSinceBoot]
        && !self->_suppressUnauthorizedAlert)
      {
        [(MBServiceAccount *)self->_account renewCredentials];
      }
      if (!--v16) {
        goto LABEL_60;
      }
      if ([v17[73] isError:v47 withCode:307])
      {
        v24 = MBGetDefaultLog();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Updating account after an Account-Moved response from service", buf, 2u);
          _MBLog();
        }
        id v25 = [(MBServiceAccount *)self->_account updateAppleAccountSync];
        if (v25)
        {
          id v47 = [v17[73] errorWithCode:300 error:v25 format:@"Error updating account after Account-Moved response"];
          goto LABEL_60;
        }
      }
      else
      {
        if (![v17[73] isError:v47 withCode:13]) {
          goto LABEL_60;
        }
        v26 = MBGetDefaultLog();
        v27 = v26;
        if (!v11)
        {
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = a4;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Locked response for a path without a backup: %@", buf, 0xCu);
            goto LABEL_59;
          }
LABEL_60:
          if (!a7) {
            return 0;
          }
          id v15 = 0;
          *a7 = v47;
          return v15;
        }
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Attempting to re-acquire lock after a Locked response from service", buf, 2u);
          _MBLog();
        }
        id v28 = [(MBService *)self lockForBackupUDID:v11];
        [(MBService *)self setLock:+[MBSLock lockWithState:2 type:0 timeout:0] forBackupUDID:v11];
        uint64_t v45 = 0;
        if (![(MBService *)self backupForUDID:v11 lastModified:0 error:&v45])
        {
          v30 = MBGetDefaultLog();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            id v31 = [v17[73] descriptionForError:v45];
            *(_DWORD *)buf = 138412290;
            id v49 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Attempt to re-acquire lock failed: %@", buf, 0xCu);
            [v17[73] descriptionForError:v45];
LABEL_59:
            _MBLog();
          }
          goto LABEL_60;
        }
        if ([v28 state] == 1) {
          [v28 setState:0];
        }
        [(MBService *)self setLock:v28 forBackupUDID:v11];
      }
      if (MBShouldInjectError()) {
        goto LABEL_2;
      }
    }
    if (!MBShouldInjectError())
    {
      if (v12)
      {
        unsigned int v29 = [v12 state];
        switch(v29)
        {
          case 2u:
            [(MBService *)self removeLockForBackupUDID:v11];
            break;
          case 1u:
            [self->_delegate serviceDidHoldLock:self];
            break;
          case 0u:
            [v12 setState:1];
            break;
        }
      }
      if (a6)
      {
        id v33 = objc_msgSend(objc_msgSend(v46, "allHeaderFields"), "objectForKeyedSubscript:", @"Last-Modified");
        if (v33)
        {
          objc_msgSend(objc_msgSend((id)MBHTTPDateFormatter(), "dateFromString:", v33), "timeIntervalSince1970");
          int64_t v35 = (uint64_t)v34;
        }
        else
        {
          int64_t v35 = 0;
        }
        *a6 = v35;
      }
      id v36 = objc_msgSend(objc_msgSend(v46, "allHeaderFields"), "objectForKeyedSubscript:", @"X-Apple-MBS-Protocol-Version");
      if (v36)
      {
        [v36 doubleValue];
        if (v37 > 0.0) {
          self->_protocolVersion = v37;
        }
      }
      return v15;
    }
    if (!a7) {
      return 0;
    }
    v13 = v17[73];
    CFStringRef v14 = @"Simulated error after service request";
  }
  id v15 = 0;
  *a7 = [v13 errorWithCode:1 format:v14];
  return v15;
}

- (id)_sendRequestWithMethod:(id)a3 path:(id)a4 message:(id)a5 responseClass:(Class)a6 lastModified:(int64_t *)a7 error:(id *)a8
{
  if (a8) {
    *a8 = 0;
  }
  id v15 = objc_alloc_init((Class)NSAutoreleasePool);
  if (a5)
  {
    uint64_t v16 = MBGetDefaultLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v30 = self;
      __int16 v31 = 2112;
      id v32 = a5;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
      id v25 = self;
      id v27 = a5;
      _MBLog();
    }
  }
  id v17 = -[MBService _sendRequestWithMethod:path:requestBody:lastModified:error:](self, "_sendRequestWithMethod:path:requestBody:lastModified:error:", a3, a4, objc_msgSend(a5, "data", v25, v27), a7, a8);
  if (!v17)
  {
    id v19 = 0;
LABEL_13:
    if (!a8) {
      goto LABEL_21;
    }
    goto LABEL_16;
  }
  if (a6)
  {
    id v18 = [[a6 alloc] initWithData:v17];
    if (v18)
    {
      id v19 = v18;
      CFStringRef v20 = MBGetDefaultLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v30 = self;
        __int16 v31 = 2112;
        id v32 = v19;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
        v26 = self;
        id v28 = v19;
        _MBLog();
        if (!a8) {
          goto LABEL_21;
        }
        goto LABEL_16;
      }
      goto LABEL_13;
    }
    if (a8)
    {
      uint64_t v21 = +[MBError errorWithCode:309 format:@"Invalid response message"];
      id v19 = 0;
      *a8 = v21;
      goto LABEL_17;
    }
    id v19 = 0;
LABEL_21:
    objc_msgSend(v15, "drain", v26, v28);
    return v19;
  }
  id v19 = objc_alloc_init((Class)NSObject);
  if (!a8) {
    goto LABEL_21;
  }
LABEL_16:
  uint64_t v21 = (MBError *)*a8;
LABEL_17:
  id v22 = v21;
  [v15 drain];
  id v23 = *a8;
  return v19;
}

- (id)_sendRequestWithMethod:(id)a3 path:(id)a4 messages:(id)a5 responseClass:(Class)a6 lastModified:(int64_t *)a7 error:(id *)a8
{
  id v42 = objc_alloc_init((Class)NSAutoreleasePool);
  if (a5)
  {
    id v38 = a3;
    id v39 = a4;
    v40 = a7;
    v41 = a6;
    id v15 = +[NSOutputStream outputStreamToMemory];
    [(NSOutputStream *)v15 open];
    double v37 = v15;
    id v16 = [objc_alloc((Class)PBMessageStreamWriter) initWithOutputStream:v15];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v17 = [a5 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v17)
    {
      id v18 = v17;
      uint64_t v19 = *(void *)v44;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v44 != v19) {
            objc_enumerationMutation(a5);
          }
          uint64_t v21 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          id v22 = MBGetDefaultLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v48 = self;
            __int16 v49 = 2112;
            id v50 = v21;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
            int64_t v35 = self;
            id v36 = v21;
            _MBLog();
          }
          objc_msgSend(v16, "writeMessage:", v21, v35, v36);
        }
        id v18 = [a5 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v18);
    }
    id v23 = [(NSOutputStream *)v37 propertyForKey:NSStreamDataWrittenToMemoryStreamKey];
    a7 = v40;
    a6 = v41;
    a3 = v38;
    a4 = v39;
  }
  else
  {
    id v23 = 0;
  }
  id v24 = [(MBService *)self _sendRequestWithMethod:a3 path:a4 requestBody:v23 lastModified:a7 error:a8];
  if (v24)
  {
    id v25 = v24;
    id v26 = objc_alloc_init((Class)NSMutableArray);
    id v27 = +[NSInputStream inputStreamWithData:v25];
    [(NSInputStream *)v27 open];
    id v28 = [objc_alloc((Class)PBMessageStreamReader) initWithStream:v27];
    [v28 setClassOfNextMessage:a6];
    id v29 = [v28 nextMessage];
    if (v29)
    {
      id v30 = v29;
      do
      {
        __int16 v31 = MBGetDefaultLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v48 = self;
          __int16 v49 = 2112;
          id v50 = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "%@: %@", buf, 0x16u);
          int64_t v35 = self;
          id v36 = v30;
          _MBLog();
        }
        objc_msgSend(v26, "addObject:", v30, v35, v36);

        id v30 = [v28 nextMessage];
      }
      while (v30);
    }
    if (a8) {
      goto LABEL_20;
    }
LABEL_22:
    [v42 drain];
    return v26;
  }
  id v26 = 0;
  if (!a8) {
    goto LABEL_22;
  }
LABEL_20:
  id v32 = *a8;
  [v42 drain];
  id v33 = *a8;
  return v26;
}

- (id)accountWithError:(id *)a3
{
  id v5 = [(MBService *)self _sendRequestWithMethod:@"GET" path:+[NSString stringWithFormat:@"/mbs/%@", [(MBServiceAccount *)self->_account dsid]] message:0 responseClass:objc_opt_class() lastModified:0 error:a3];
  objc_super v6 = v5;
  if (v5)
  {
    if (([v5 hasAccountID] & 1) == 0)
    {
      if (a3)
      {
        CFStringRef v7 = @"Account ID missing from response";
        goto LABEL_8;
      }
      return 0;
    }
    if ((objc_msgSend(objc_msgSend(v6, "accountID"), "isEqualToString:", -[MBServiceAccount dsid](self->_account, "dsid")) & 1) == 0)
    {
      if (a3)
      {
        CFStringRef v7 = @"Account ID doesn't match in response";
LABEL_8:
        objc_super v6 = 0;
        *a3 = +[MBError errorWithCode:309 format:v7];
        return v6;
      }
      return 0;
    }
  }
  return v6;
}

- (BOOL)deleteAccountWithError:(id *)a3
{
  return [(MBService *)self _sendRequestWithMethod:@"DELETE" path:+[NSString stringWithFormat:@"/mbs/%@", [(MBServiceAccount *)self->_account dsid]] requestBody:0 lastModified:0 error:a3] != 0;
}

- (id)backupForUDID:(id)a3 lastModified:(int64_t *)a4 error:(id *)a5
{
  if (a4) {
    *a4 = 0;
  }
  id v8 = [(MBService *)self _sendRequestWithMethod:@"GET" path:+[NSString stringWithFormat:@"/mbs/%@/%@", [(MBServiceAccount *)self->_account dsid], a3] message:0 responseClass:objc_opt_class() lastModified:a4 error:a5];
  v9 = v8;
  if (v8)
  {
    if (a4 && !*a4)
    {
      if (!a5) {
        return 0;
      }
      id v12 = +[MBError errorWithCode:304, @"Missing Last-Modified header for backup %@", a3, v16 format];
      goto LABEL_20;
    }
    objc_msgSend(objc_msgSend(v8, "snapshots"), "sortUsingComparator:", &stru_100416260);
    if ([v9 snapshotsCount])
    {
      v10 = 0;
      while (1)
      {
        id v11 = objc_msgSend(objc_msgSend(v9, "snapshots"), "objectAtIndexedSubscript:", v10);
        if (![v11 snapshotID])
        {
          if (!a5) {
            return 0;
          }
          CFStringRef v13 = @"Snapshot ID is zero";
          goto LABEL_19;
        }
        if (![v11 committed] && v10 != (char *)objc_msgSend(v9, "snapshotsCount") - 1) {
          break;
        }
        if (++v10 >= [v9 snapshotsCount]) {
          return v9;
        }
      }
      if (!a5) {
        return 0;
      }
      uint64_t v15 = [v11 snapshotID];
      id v16 = a3;
      CFStringRef v13 = @"Snapshot %lu is uncommitted but isn't the last snapshot (%@)";
LABEL_19:
      id v12 = +[MBError errorWithCode:format:](MBError, "errorWithCode:format:", 205, v13, v15, v16);
LABEL_20:
      v9 = 0;
      *a5 = v12;
    }
  }
  return v9;
}

- (BOOL)postBackup:(id)a3 lastModified:(int64_t *)a4 error:(id *)a5
{
  v9 = [(MBServiceAccount *)self->_account dsid];
  [a3 backupUDID];
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@", v9, MBStringWithData()] message:a3 responseClass:0 lastModified:a4 error:a5] != 0;
}

- (BOOL)deleteBackupForUDID:(id)a3 error:(id *)a4
{
  return [(MBService *)self _sendRequestWithMethod:@"DELETE" path:+[NSString stringWithFormat:@"/mbs/%@/%@", [(MBServiceAccount *)self->_account dsid], a3] message:0 responseClass:0 lastModified:0 error:a4] != 0;
}

- (BOOL)removeDomainName:(id)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/removeDomain?domain=%@", [(MBServiceAccount *)self->_account dsid], a4, a3] message:0 responseClass:0 lastModified:a5 error:a6] != 0;
}

- (BOOL)backupStatusInfo:(id)a3 backupUDID:(id)a4 error:(id *)a5
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/statusInfo", [(MBServiceAccount *)self->_account dsid], a4] message:a3 responseClass:0 lastModified:0 error:a5] != 0;
}

- (BOOL)restoreCompleteWithInfo:(id)a3 backupUDID:(id)a4 error:(id *)a5
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/restoreComplete", [(MBServiceAccount *)self->_account dsid], a4] message:a3 responseClass:0 lastModified:0 error:a5] != 0;
}

- (BOOL)createSnapshot:(id)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6 snapshotID:(unsigned int *)a7
{
  if (a7) {
    *a7 = 0;
  }
  id v9 = [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/createSnapshot", [(MBServiceAccount *)self->_account dsid], a4] message:a3 responseClass:objc_opt_class() lastModified:a5 error:a6];
  if (v9)
  {
    v10 = v9;
    if ([v9 hasSnapshotID])
    {
      if ([v10 snapshotID])
      {
        if (a7) {
          *a7 = [v10 snapshotID];
        }
        LOBYTE(v9) = 1;
        return (char)v9;
      }
      if (a6)
      {
        CFStringRef v11 = @"Snapshot ID returned is zero";
        goto LABEL_13;
      }
    }
    else if (a6)
    {
      CFStringRef v11 = @"Snapshot ID not returned";
LABEL_13:
      id v12 = +[MBError errorWithCode:309 format:v11];
      LOBYTE(v9) = 0;
      *a6 = v12;
      return (char)v9;
    }
    LOBYTE(v9) = 0;
  }
  return (char)v9;
}

- (BOOL)updateSnapshot:(id)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6
{
  return -[MBService _sendRequestWithMethod:path:message:responseClass:lastModified:error:](self, "_sendRequestWithMethod:path:message:responseClass:lastModified:error:", @"POST", +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/mbs/%@/%@/%lu", -[MBServiceAccount dsid](self->_account, "dsid"), a4, [a3 snapshotID]), a3, 0, a5, a6) != 0;
}

- (BOOL)deleteSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6
{
  return [(MBService *)self _sendRequestWithMethod:@"DELETE" path:+[NSString stringWithFormat:@"/mbs/%@/%@/%lu", [(MBServiceAccount *)self->_account dsid], a4, a3] message:0 responseClass:0 lastModified:a5 error:a6] != 0;
}

- (BOOL)commitSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/%lu/commitSnapshot", [(MBServiceAccount *)self->_account dsid], a4, a3] message:0 responseClass:0 lastModified:a5 error:a6] != 0;
}

- (BOOL)mergeSnapshotForID:(unint64_t)a3 backupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/%lu/mergeSnapshot", [(MBServiceAccount *)self->_account dsid], a4, a3] message:0 responseClass:0 lastModified:a5 error:a6] != 0;
}

- (id)listFilesForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 error:(id *)a5
{
  CFStringRef v7 = +[NSString stringWithFormat:@"/mbs/%@/%@/%u/listFiles", [(MBServiceAccount *)self->_account dsid], a3, a4];
  uint64_t v8 = objc_opt_class();
  return [(MBService *)self _sendRequestWithMethod:@"GET" path:v7 messages:0 responseClass:v8 lastModified:0 error:a5];
}

- (id)listFilesForBackupUDID:(id)a3 snapshotID:(unint64_t)a4 offset:(unint64_t)a5 limit:(unint64_t)a6 error:(id *)a7
{
  id v9 = +[NSString stringWithFormat:@"/mbs/%@/%@/%u/listFiles?offset=%lu&limit=%lu", [(MBServiceAccount *)self->_account dsid], a3, a4, a5, a6];
  uint64_t v10 = objc_opt_class();
  return [(MBService *)self _sendRequestWithMethod:@"GET" path:v9 messages:0 responseClass:v10 lastModified:0 error:a7];
}

- (id)getFileIDs:(id)a3 backupUDID:(id)a4 snapshotID:(unint64_t)a5 lastModified:(int64_t *)a6 error:(id *)a7
{
  CFStringRef v11 = +[NSString stringWithFormat:@"/mbs/%@/%@/%u/getFiles", [(MBServiceAccount *)self->_account dsid], a4, a5];
  uint64_t v12 = objc_opt_class();
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:v11 messages:a3 responseClass:v12 lastModified:a6 error:a7];
}

- (id)addFiles:(id)a3 backupUDID:(id)a4 snapshotID:(unint64_t)a5 lastModified:(int64_t *)a6 error:(id *)a7
{
  CFStringRef v11 = +[NSString stringWithFormat:@"/mbs/%@/%@/%u/addFiles", [(MBServiceAccount *)self->_account dsid], a4, a5];
  uint64_t v12 = objc_opt_class();
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:v11 messages:a3 responseClass:v12 lastModified:a6 error:a7];
}

- (id)commitFilePutReceipts:(id)a3 backupUDID:(id)a4 snapshotID:(unint64_t)a5 lastModified:(int64_t *)a6 error:(id *)a7
{
  CFStringRef v11 = +[NSString stringWithFormat:@"/mbs/%@/%@/%u/commitFiles", [(MBServiceAccount *)self->_account dsid], a4, a5];
  uint64_t v12 = objc_opt_class();
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:v11 messages:a3 responseClass:v12 lastModified:a6 error:a7];
}

- (BOOL)removeFileIDs:(id)a3 backupUDID:(id)a4 snapshotID:(unint64_t)a5 lastModified:(int64_t *)a6 error:(id *)a7
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/%u/removeFiles", [(MBServiceAccount *)self->_account dsid], a4, a5] messages:a3 responseClass:0 lastModified:a6 error:a7] != 0;
}

- (id)keysetForBackupUDID:(id)a3 lastModified:(int64_t *)a4 error:(id *)a5
{
  uint64_t v8 = +[NSString stringWithFormat:@"/mbs/%@/%@/getKeys", [(MBServiceAccount *)self->_account dsid], a3];
  uint64_t v9 = objc_opt_class();
  return [(MBService *)self _sendRequestWithMethod:@"GET" path:v8 message:0 responseClass:v9 lastModified:a4 error:a5];
}

- (BOOL)createKeySet:(id)a3 forBackupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/createKeys", [(MBServiceAccount *)self->_account dsid], a4] message:a3 responseClass:0 lastModified:a5 error:a6] != 0;
}

- (BOOL)updateKeySet:(id)a3 forBackupUDID:(id)a4 lastModified:(int64_t *)a5 error:(id *)a6
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/updateKeys", [(MBServiceAccount *)self->_account dsid], a4] message:a3 responseClass:0 lastModified:a5 error:a6] != 0;
}

- (BOOL)discountCameraRollQuotaForBackupUDID:(id)a3 error:(id *)a4
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/%@/extendQuotaGrace", [(MBServiceAccount *)self->_account dsid], a3] message:0 responseClass:0 lastModified:0 error:a4] != 0;
}

- (BOOL)sleepWithError:(id *)a3
{
  return [(MBService *)self _sendRequestWithMethod:@"POST" path:+[NSString stringWithFormat:@"/mbs/%@/sleep", [(MBServiceAccount *)self->_account dsid]] requestBody:0 lastModified:0 error:a3] != 0;
}

- (MBServiceAccount)account
{
  return self->_account;
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (double)protocolVersion
{
  return self->_protocolVersion;
}

- (BOOL)wasCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)disableWWAN
{
  return self->_disableWWAN;
}

- (void)setDisableWWAN:(BOOL)a3
{
  self->_disableWWAN = a3;
}

- (BOOL)suppressUnauthorizedAlert
{
  return self->_suppressUnauthorizedAlert;
}

- (void)setSuppressUnauthorizedAlert:(BOOL)a3
{
  self->_suppressUnauthorizedAlert = a3;
}

@end