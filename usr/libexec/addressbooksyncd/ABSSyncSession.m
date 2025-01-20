@interface ABSSyncSession
- (ABSPBAccountsSyncObject)accountsMessage;
- (ABSPBCountValidationObject)validationMessage;
- (ABSProgressReporter)progressReporter;
- (ABSSyncController)syncController;
- (ABSSyncSession)init;
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (NDTActivity)activity;
- (NSError)capturedError;
- (NSMutableDictionary)options;
- (NSMutableSet)accountIdentifiers;
- (NSString)sessionEncoding;
- (double)start;
- (int64_t)abortAfter;
- (unint64_t)count;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)lateSetupForSession:(id)a3;
- (void)resetDataStoreForSyncSession:(id)a3 completion:(id)a4;
- (void)setAbortAfter:(int64_t)a3;
- (void)setAccountIdentifiers:(id)a3;
- (void)setAccountsMessage:(id)a3;
- (void)setActivity:(id)a3;
- (void)setCapturedError:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setOptions:(id)a3;
- (void)setProgressReporter:(id)a3;
- (void)setSessionEncoding:(id)a3;
- (void)setStart:(double)a3;
- (void)setSyncController:(id)a3;
- (void)setValidationMessage:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation ABSSyncSession

- (ABSSyncSession)init
{
  v9.receiver = self;
  v9.super_class = (Class)ABSSyncSession;
  v2 = [(ABSSyncSession *)&v9 init];
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isFirstEnqueue = 257;
    uint64_t v4 = os_transaction_create();
    keepAliveTransaction = v3->_keepAliveTransaction;
    v3->_keepAliveTransaction = (OS_os_transaction *)v4;

    v3->_abortAfter = 0;
    v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    accountIdentifiers = v3->_accountIdentifiers;
    v3->_accountIdentifiers = v6;
  }
  return v3;
}

- (void)lateSetupForSession:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = +[SYDevice targetableDevice];
  v7 = [v6 systemBuildVersion];
  [v5 setObject:v7 forKeyedSubscript:off_100069A00];

  v8 = [v4 sessionMetadata];
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_super v9 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100038854(v9);
      }

      v8 = 0;
    }
  }
  id v10 = (id)CFPreferencesCopyAppValue(@"internal_forceEncoding", @"com.apple.addressbooksync");
  if (!v10)
  {
    v11 = off_100069A10;
    v12 = [v8 objectForKeyedSubscript:off_100069A08];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v12;

      v13 = *(NSObject **)(qword_100069D78 + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v23 = 138543362;
        id v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Received encoding handshake: %{public}@", (uint8_t *)&v23, 0xCu);
      }
    }
    else
    {
      id v10 = v11;
    }
  }
  if ([v10 isEqualToString:off_100069A10])
  {
    v14 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Using vCard encoder.", (uint8_t *)&v23, 2u);
    }
LABEL_25:
    v16 = &off_100069A10;
    goto LABEL_26;
  }
  if ([v10 isEqualToString:off_100069A18])
  {
    v15 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Using fast encoder.", (uint8_t *)&v23, 2u);
    }
    v16 = &off_100069A18;
  }
  else
  {
    unsigned int v17 = [v10 isEqualToString:off_100069A28];
    v18 = *(NSObject **)(qword_100069D78 + 8);
    if (!v17)
    {
      if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_ERROR)) {
        sub_100038810(v18);
      }
      goto LABEL_25;
    }
    if (os_log_type_enabled(*(os_log_t *)(qword_100069D78 + 8), OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using protobuf encoding.", (uint8_t *)&v23, 2u);
    }
    v16 = &off_100069A28;
  }
LABEL_26:
  [v5 setObject:*v16 forKeyedSubscript:off_100069A08];
  v19 = [v8 objectForKeyedSubscript:off_100069A30];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v20 = [v19 BOOLValue];
  }
  else {
    id v20 = 0;
  }
  v21 = +[NSNumber numberWithBool:v20];
  [v5 setObject:v21 forKeyedSubscript:off_100069A30];

  v22 = [[ABSSerializer alloc] initWithOptions:v5];
  [v4 setSerializer:v22];

  [(ABSSyncSession *)self setOptions:v5];
}

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  if (self->_isFirstEnqueue)
  {
    self->_isFirstEnqueue = 0;
    -[ABSSyncSession lateSetupForSession:](self, "lateSetupForSession:", a3, a4, a5);
  }
  return 2;
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  return 0;
}

- (void)resetDataStoreForSyncSession:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)os_transaction_create();
  objc_super v9 = [v7 targetQueue];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10003120C;
  block[3] = &unk_100054F60;
  id v13 = v8;
  id v14 = v6;
  block[4] = self;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v30 = a3;
  id v8 = a4;
  v29 = (void (**)(id, uint64_t, void))a5;
  objc_super v9 = &qword_100069D78;
  id v10 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v39 = "ABSSyncSession.m";
    __int16 v40 = 1024;
    int v41 = 135;
    __int16 v42 = 2080;
    v43 = "-[ABSSyncSession syncSession:applyChanges:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}s:%d %s --mark--", buf, 0x1Cu);
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.watch.eventkitsync.stall", 0, 0, 1u);
  if (self->_isFirstApplyChange) {
    self->_isFirstApplyChange = 0;
  }
  v12 = *(NSObject **)(qword_100069D78 + 8);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Applying changes", buf, 2u);
  }
  id v13 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v8 count]];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v14 = v8;
  id v32 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v32)
  {
    uint64_t v15 = *(void *)v34;
    uint64_t v31 = *(void *)v34;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(void *)v34 != v15) {
          objc_enumerationMutation(v14);
        }
        unsigned int v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        if ([(ABSSyncSession *)self abortAfter] >= 1)
        {
          if (+[NDTLog isInternalDevice])
          {
            [(ABSSyncSession *)self setAbortAfter:(char *)[(ABSSyncSession *)self abortAfter] - 1];
            if (![(ABSSyncSession *)self abortAfter]) {
              sub_1000388FC();
            }
          }
        }
        if (+[SYDegenerateChange isDegenerate:v17])
        {
          v19 = *(NSObject **)(*v9 + 8);
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Deserialization failed.", buf, 2u);
          }
        }
        else
        {
          id v20 = [v17 changeType];
          if (v20 == (id)1)
          {
            [v13 addObject:v17];
            goto LABEL_29;
          }
          id v21 = v20;
          if ([v13 count])
          {
            id v22 = v14;
            int v23 = v9;
            id v24 = *(NSObject **)(*v9 + 8);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Flushing outstanding batch adds.", buf, 2u);
            }
            v25 = [(ABSSyncSession *)self syncController];
            [v25 addSyChanges:v13 forSession:self];

            [v13 removeAllObjects];
            objc_super v9 = v23;
            id v14 = v22;
            uint64_t v15 = v31;
          }
          if (v21 == (id)3)
          {
            v26 = [(ABSSyncSession *)self syncController];
            [v26 deleteSyChange:v17];
          }
          else
          {
            if (v21 != (id)2) {
              goto LABEL_29;
            }
            v26 = [(ABSSyncSession *)self syncController];
            [v26 updateSyChange:v17 forSession:self];
          }
        }
LABEL_29:
      }
      id v32 = [v14 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v32);
  }

  if ([v13 count])
  {
    v27 = [(ABSSyncSession *)self syncController];
    [v27 addSyChanges:v13 forSession:self];
  }
  v29[2](v29, 1, 0);
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v5 = a4;
  id v6 = [(ABSSyncSession *)self capturedError];

  if (!v5 && v6)
  {
    id v5 = [(ABSSyncSession *)self capturedError];
  }
  id v7 = *(NSObject **)(qword_100069D78 + 8);
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100038968((uint64_t)v5, v7);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Sync complete with no error.", v12, 2u);
  }
  id v8 = [v5 domain];
  unsigned int v9 = [v8 isEqualToString:SYErrorDomain];

  if (v9) {
    BOOL v10 = [v5 code] != (id)2023;
  }
  else {
    BOOL v10 = 1;
  }
  id v11 = [(ABSSyncSession *)self progressReporter];
  [v11 doneForRealNotifyingPairedSync:v10];

  [(ABSSyncSession *)self setProgressReporter:0];
}

- (ABSSyncController)syncController
{
  return self->_syncController;
}

- (void)setSyncController:(id)a3
{
}

- (NSString)sessionEncoding
{
  return self->_sessionEncoding;
}

- (void)setSessionEncoding:(id)a3
{
}

- (NSMutableDictionary)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (int64_t)abortAfter
{
  return self->_abortAfter;
}

- (void)setAbortAfter:(int64_t)a3
{
  self->_abortAfter = a3;
}

- (ABSPBCountValidationObject)validationMessage
{
  return self->_validationMessage;
}

- (void)setValidationMessage:(id)a3
{
}

- (ABSPBAccountsSyncObject)accountsMessage
{
  return self->_accountsMessage;
}

- (void)setAccountsMessage:(id)a3
{
}

- (NSMutableSet)accountIdentifiers
{
  return self->_accountIdentifiers;
}

- (void)setAccountIdentifiers:(id)a3
{
}

- (NDTActivity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (ABSProgressReporter)progressReporter
{
  return self->_progressReporter;
}

- (void)setProgressReporter:(id)a3
{
}

- (double)start
{
  return self->_start;
}

- (void)setStart:(double)a3
{
  self->_start = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (NSError)capturedError
{
  return self->_capturedError;
}

- (void)setCapturedError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capturedError, 0);
  objc_storeStrong((id *)&self->_progressReporter, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_accountIdentifiers, 0);
  objc_storeStrong((id *)&self->_accountsMessage, 0);
  objc_storeStrong((id *)&self->_validationMessage, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_sessionEncoding, 0);
  objc_storeStrong((id *)&self->_syncController, 0);

  objc_storeStrong((id *)&self->_keepAliveTransaction, 0);
}

@end