@interface NNCompanionSyncSessionManager
- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4;
- (NNCompanionSyncSessionManagerDelegate)delegate;
- (NSData)syncingData;
- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5;
- (void)setDelegate:(id)a3;
- (void)setSyncingData:(id)a3;
- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5;
- (void)syncSession:(id)a3 didEndWithError:(id)a4;
@end

@implementation NNCompanionSyncSessionManager

- (unsigned)syncSession:(id)a3 enqueueChanges:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = (uint64_t (**)(id, NNHeadlineResultChange *))a4;
  v9 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Asked to enqueue some changes!", buf, 2u);
  }

  v10 = [(NNCompanionSyncSessionManager *)self delegate];
  v11 = [v10 companionSyncSessionManagerWantsHeadlineData:self];

  id v27 = 0;
  v12 = +[NSPropertyListSerialization propertyListWithData:v11 options:0 format:0 error:&v27];
  id v13 = v27;
  if (!v12)
  {
    NNSetupCompanionSyncLog();
    v21 = (NNHeadlineResultChange *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v21->super, OS_LOG_TYPE_ERROR)) {
      sub_1000096A0((uint64_t)v11, (uint64_t)v13, &v21->super);
    }
    goto LABEL_21;
  }
  v14 = [(NNCompanionSyncSessionManager *)self syncingData];

  if (v14)
  {
    v15 = NNSetupCompanionSyncLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_100009728((uint64_t)v7, v15);
    }
  }
  objc_opt_class();
  int isKindOfClass = objc_opt_isKindOfClass();
  unsigned int v17 = [(__CFString *)v12 conformsToProtocol:&OBJC_PROTOCOL___NNSyncableResult];
  v18 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    CFStringRef v19 = @"BAD DICT";
    if (isKindOfClass) {
      CFStringRef v19 = @"Dict";
    }
    CFStringRef v20 = @"BAD SYNC";
    *(_DWORD *)buf = 138412802;
    v29 = (void *)v19;
    __int16 v30 = 2112;
    if (v17) {
      CFStringRef v20 = @"syncable";
    }
    CFStringRef v31 = v20;
    __int16 v32 = 2112;
    v33 = v12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Enqueueing results (%@, %@) %@ for syncing…", buf, 0x20u);
  }

  if ((isKindOfClass & v17) == 1)
  {
    v21 = [[NNHeadlineResultChange alloc] initWithHeadlineResult:v12];
    int v22 = v8[2](v8, v21);
    v23 = NNSetupCompanionSyncLog();
    BOOL v24 = os_log_type_enabled(v23, OS_LOG_TYPE_INFO);
    if (!v22)
    {
      if (v24)
      {
        *(_DWORD *)buf = 138412290;
        v29 = v12;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Couldn't enqueue results %@", buf, 0xCu);
      }

      unsigned int v25 = 1;
      goto LABEL_26;
    }
    if (v24)
    {
      *(_DWORD *)buf = 138412546;
      v29 = v21;
      __int16 v30 = 2112;
      CFStringRef v31 = v12;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Enqueued result change with results %@ %@…", buf, 0x16u);
    }

    [(NNCompanionSyncSessionManager *)self setSyncingData:v11];
LABEL_21:
    unsigned int v25 = 2;
LABEL_26:

    goto LABEL_27;
  }
  unsigned int v25 = 2;
LABEL_27:

  return v25;
}

- (void)syncSession:(id)a3 applyChanges:(id)a4 completion:(id)a5
{
  id v7 = a4;
  unsigned int v17 = (void (**)(id, uint64_t, void))a5;
  v8 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218242;
    id v24 = [v7 count];
    __int16 v25 = 2112;
    id v26 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Asked to apply %ld changes! %@", buf, 0x16u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v15 = NNSetupCompanionSyncLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Change to apply: %@", buf, 0xCu);
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            v16 = [(NNCompanionSyncSessionManager *)self delegate];
            [v16 companionSyncSessionManagerWantsHeadlineUpdate:self];
          }
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  v17[2](v17, 1, 0);
}

- (void)syncSession:(id)a3 didEndWithError:(id)a4
{
  id v5 = a4;
  v6 = NNSetupCompanionSyncLog();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      int v11 = 138412290;
      id v12 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Sync Session ended with error: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v11) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Sync Session has finished", (uint8_t *)&v11, 2u);
    }

    v8 = [(NNCompanionSyncSessionManager *)self syncingData];

    if (v8)
    {
      id v9 = [(NNCompanionSyncSessionManager *)self delegate];
      id v10 = [(NNCompanionSyncSessionManager *)self syncingData];
      [v9 companionSyncSessionManager:self didSyncHeadlineData:v10];
    }
    else
    {
      id v9 = NNSetupCompanionSyncLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Sync Session finished without tracking any data. Repeat sync?", (uint8_t *)&v11, 2u);
      }
    }

    [(NNCompanionSyncSessionManager *)self setSyncingData:0];
  }
}

- (BOOL)syncSession:(id)a3 resetDataStoreWithError:(id *)a4
{
  v4 = NNSetupCompanionSyncLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Sync session - Resetting data store.", v6, 2u);
  }

  return 1;
}

- (NNCompanionSyncSessionManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (NNCompanionSyncSessionManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSData)syncingData
{
  return (NSData *)objc_getProperty(self, a2, 16, 1);
}

- (void)setSyncingData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_syncingData, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end