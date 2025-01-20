@interface ICDAccountManager
- (ACAccountStore)accountStore;
- (ICConnectionConfiguration)activeConfiguration;
- (ICDAccountManager)initWithLibraryManagementPolicy:(int64_t)a3;
- (ICDAccountManagerState)state;
- (ICDAccountManagerStateChange)stateChange;
- (NSArray)supportedConfigurations;
- (OS_dispatch_queue)serialQueue;
- (id)_buildStateChange;
- (int64_t)libraryManagementPolicy;
- (void)_updateStateWithChange:(id)a3;
- (void)changeLibraryManagementPolicy:(int64_t)a3;
- (void)setLibraryManagementPolicy:(int64_t)a3;
- (void)setState:(id)a3;
- (void)setStateChange:(id)a3;
- (void)updateState;
@end

@implementation ICDAccountManager

- (NSArray)supportedConfigurations
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = sub_100113588;
  v11 = sub_100113598;
  id v12 = 0;
  v3 = [(ICDAccountManager *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100010AA4;
  v6[3] = &unk_1001BE648;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChange, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

- (void)setLibraryManagementPolicy:(int64_t)a3
{
  self->_libraryManagementPolicy = a3;
}

- (void)setStateChange:(id)a3
{
}

- (void)setState:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)_updateStateWithChange:(id)a3
{
  id v4 = a3;
  v5 = [(ICDAccountManager *)self serialQueue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001132E0;
  v7[3] = &unk_1001BECC0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(v5, v7);
}

- (id)_buildStateChange
{
  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = sub_100113588;
  v19 = sub_100113598;
  id v20 = 0;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_100113588;
  v13 = sub_100113598;
  id v14 = 0;
  v3 = [(ICDAccountManager *)self serialQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001135A0;
  block[3] = &unk_1001BE670;
  block[4] = self;
  block[5] = &v9;
  block[6] = &v15;
  dispatch_sync(v3, block);

  if (v10[5])
  {
    id v4 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = v10[5];
      *(_DWORD *)buf = 134218242;
      v22 = self;
      __int16 v23 = 2114;
      uint64_t v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "ICDAccountManager %p - Unable to compute state change [Error retrieving store accounts] - error=%{public}@", buf, 0x16u);
    }

    id v6 = 0;
  }
  else
  {
    id v6 = (id)v16[5];
  }
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);

  return v6;
}

- (int64_t)libraryManagementPolicy
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(ICDAccountManager *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100113798;
  v6[3] = &unk_1001BE648;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (ICDAccountManagerStateChange)stateChange
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100113588;
  uint64_t v11 = sub_100113598;
  id v12 = 0;
  v3 = [(ICDAccountManager *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001138C8;
  v6[3] = &unk_1001BE648;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ICDAccountManagerStateChange *)v4;
}

- (ICDAccountManagerState)state
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100113588;
  uint64_t v11 = sub_100113598;
  id v12 = 0;
  v3 = [(ICDAccountManager *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100113A30;
  v6[3] = &unk_1001BE648;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ICDAccountManagerState *)v4;
}

- (ICConnectionConfiguration)activeConfiguration
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_100113588;
  uint64_t v11 = sub_100113598;
  id v12 = 0;
  v3 = [(ICDAccountManager *)self serialQueue];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100113B98;
  v6[3] = &unk_1001BE648;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (ICConnectionConfiguration *)v4;
}

- (void)changeLibraryManagementPolicy:(int64_t)a3
{
  int64_t libraryManagementPolicy = self->_libraryManagementPolicy;
  id v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (libraryManagementPolicy == a3)
  {
    if (v7)
    {
      int64_t v8 = self->_libraryManagementPolicy;
      int v10 = 134218240;
      uint64_t v11 = self;
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDAccountManager %p - policy type is unchanged currentValue=%d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    if (v7)
    {
      int64_t v9 = self->_libraryManagementPolicy;
      int v10 = 134218496;
      uint64_t v11 = self;
      __int16 v12 = 1024;
      int v13 = v9;
      __int16 v14 = 1024;
      int v15 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDAccountManager %p - Changing policy type currentValue=%d, newValue=%d", (uint8_t *)&v10, 0x18u);
    }

    self->_int64_t libraryManagementPolicy = a3;
    [(ICDAccountManager *)self updateState];
  }
}

- (void)updateState
{
  v3 = [(ICDAccountManager *)self stateChange];
  id v4 = [(ICDAccountManager *)self _buildStateChange];
  uint64_t v5 = v4;
  if (v4)
  {
    if (([v4 activeConfigurationChanged] & 1) == 0
      && ([v5 supportedConfigurationsChanged] & 1) == 0)
    {
      id v6 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 134218242;
        int v13 = self;
        __int16 v14 = 2112;
        int v15 = v5;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "ICDAccountManager %p - No account changes detected - %@", (uint8_t *)&v12, 0x16u);
      }
    }
    if (![v3 isEqual:v5])
    {
      [(ICDAccountManager *)self _updateStateWithChange:v5];
      goto LABEL_15;
    }
    BOOL v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 134218242;
      int v13 = self;
      __int16 v14 = 2112;
      int v15 = v5;
      int64_t v8 = "ICDAccountManager %p - No state changes detected - %@";
      int64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
      uint32_t v11 = 22;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v9, v10, v8, (uint8_t *)&v12, v11);
    }
  }
  else
  {
    BOOL v7 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 134217984;
      int v13 = self;
      int64_t v8 = "ICDAccountManager %p - Unable to update state [No state change built]";
      int64_t v9 = v7;
      os_log_type_t v10 = OS_LOG_TYPE_ERROR;
      uint32_t v11 = 12;
      goto LABEL_12;
    }
  }

LABEL_15:
}

- (ICDAccountManager)initWithLibraryManagementPolicy:(int64_t)a3
{
  v19.receiver = self;
  v19.super_class = (Class)ICDAccountManager;
  id v4 = [(ICDAccountManager *)&v19 init];
  if (v4)
  {
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.itunescloudd.ICDAccountManager.serial.queue", v5);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v6;

    int64_t v8 = +[ICMonitoredAccountStore sharedAccountStore];
    id v18 = 0;
    int64_t v9 = [v8 allStoreAccountsWithError:&v18];
    os_log_type_t v10 = (ICDAccountManagerState *)v18;

    if (v10)
    {
      uint32_t v11 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218242;
        v21 = v4;
        __int16 v22 = 2114;
        __int16 v23 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "ICDAccountManager %p - init - Unable to retrieve accounts [empty accounts for restoration fallback] - error=%{public}@", buf, 0x16u);
      }
    }
    if (v9) {
      int v12 = v9;
    }
    else {
      int v12 = &__NSArray0__struct;
    }
    uint64_t v13 = +[ICDAccountManagerState restoredStatedWithFallbackAccounts:v12];
    state = v4->_state;
    v4->_state = (ICDAccountManagerState *)v13;

    v4->_int64_t libraryManagementPolicy = a3;
    int v15 = os_log_create("com.apple.amp.itunescloudd", "Accounts");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v4->_state;
      *(_DWORD *)buf = 134218242;
      v21 = v4;
      __int16 v22 = 2112;
      __int16 v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "ICDAccountManager %p - init - _state=%@", buf, 0x16u);
    }

    [(ICDAccountManagerState *)v4->_state save];
  }
  return v4;
}

@end