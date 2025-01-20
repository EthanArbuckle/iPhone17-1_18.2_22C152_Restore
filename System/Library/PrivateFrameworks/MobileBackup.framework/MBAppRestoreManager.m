@interface MBAppRestoreManager
+ (NSArray)testDemotedRestoreCoordinators;
+ (NSArray)testRegularRestoreCoordinators;
+ (id)demotedRestoreCoordinatorsAndReturnError:(id *)a3;
+ (id)regularRestoreCoordinatorsAndReturnError:(id *)a3;
+ (void)setTestDemotedRestoreCoordinators:(id)a3;
+ (void)setTestRegularRestoreCoordinators:(id)a3;
- (BOOL)_restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 context:(id)a5 error:(id *)a6;
- (BOOL)shouldObserveCoordinatorForBundleID:(id)a3;
- (MBAppRestoreManager)initWithStateQueue:(id)a3 account:(id)a4 bundleIDs:(id)a5;
- (MBAppRestoreManagerDelegate)delegate;
- (MBServiceAccount)account;
- (NSMutableDictionary)appInstallCoordinators;
- (NSSet)bundleIDs;
- (OS_dispatch_queue)coordinatorQueue;
- (OS_dispatch_queue)stateQueue;
- (OS_dispatch_semaphore)coordinationSemaphore;
- (id)setUpDataPromiseForBundleID:(id)a3 error:(id *)a4;
- (void)_finishAppDataRestore;
- (void)_requestMDMAppInstallation;
- (void)_setUpDataPromiseForCoordinator:(id)a3;
- (void)cancelAndUninstallAllCoordinators;
- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)coordinatorShouldBeginRestoringUserData:(id)a3;
- (void)openRestoreSlot;
- (void)restoreCoordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5;
- (void)restoreCoordinatorShouldBeginRestoringUserData:(id)a3;
- (void)retryAppDataDownloads;
- (void)setAccount:(id)a3;
- (void)setAppInstallCoordinators:(id)a3;
- (void)setBundleIDs:(id)a3;
- (void)setCoordinationSemaphore:(id)a3;
- (void)setCoordinatorQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStateQueue:(id)a3;
- (void)startObservingInstallCoordinators;
- (void)stopTrackingCoordinator:(id)a3 withSuccess:(BOOL)a4;
- (void)stopTrackingCoordinatorWithBundleID:(id)a3 success:(BOOL)a4;
- (void)updateProgressForCoordinatorWithBundleID:(id)a3 progress:(double)a4;
@end

@implementation MBAppRestoreManager

+ (NSArray)testRegularRestoreCoordinators
{
  return (NSArray *)sub_100043408((uint64_t)a1, (uint64_t)a2, &qword_10047F3F0);
}

+ (void)setTestRegularRestoreCoordinators:(id)a3
{
}

+ (NSArray)testDemotedRestoreCoordinators
{
  return (NSArray *)sub_100043408((uint64_t)a1, (uint64_t)a2, &qword_10047F3F8);
}

+ (void)setTestDemotedRestoreCoordinators:(id)a3
{
}

+ (id)regularRestoreCoordinatorsAndReturnError:(id *)a3
{
  return sub_100043628((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_1000441B0);
}

+ (id)demotedRestoreCoordinatorsAndReturnError:(id *)a3
{
  return sub_100043628((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(void))sub_10004437C);
}

- (MBAppRestoreManager)initWithStateQueue:(id)a3 account:(id)a4 bundleIDs:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v20.receiver = self;
  v20.super_class = (Class)MBAppRestoreManager;
  v12 = [(MBAppRestoreManager *)&v20 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_stateQueue, a3);
    objc_storeStrong((id *)&v13->_bundleIDs, a5);
    atomic_store(0, (unsigned __int8 *)&v13->_appDataDidFinishRestore);
    atomic_store(0, (unsigned __int8 *)&v13->_cancelled);
    objc_storeStrong((id *)&v13->_account, a4);
    v14 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.MobileBackup.InstallCoordination", v14);
    coordinatorQueue = v13->_coordinatorQueue;
    v13->_coordinatorQueue = (OS_dispatch_queue *)v15;

    dispatch_semaphore_t v17 = dispatch_semaphore_create(5);
    coordinationSemaphore = v13->_coordinationSemaphore;
    v13->_coordinationSemaphore = (OS_dispatch_semaphore *)v17;
  }
  return v13;
}

- (BOOL)shouldObserveCoordinatorForBundleID:(id)a3
{
  id v4 = a3;
  v5 = [(MBAppRestoreManager *)self bundleIDs];
  unsigned __int8 v6 = [v5 containsObject:v4];

  return v6;
}

- (void)_requestMDMAppInstallation
{
  v2 = MBGetDefaultLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Requesting MDM install of restored applications", buf, 2u);
    _MBLog();
  }

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  id v4 = +[MDMClient sharedClient];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100093E0C;
  v7[3] = &unk_100411060;
  v5 = v3;
  v8 = v5;
  [v4 requestInstallOfAppsInRestoreWithCompletion:v7];

  MBGroupWaitForever();
  unsigned __int8 v6 = MBGetDefaultLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Finished requesting MDM install of restored applications", buf, 2u);
    _MBLog();
  }
}

- (void)startObservingInstallCoordinators
{
  v3 = [[MBPowerAssertion alloc] initWithName:@"restore" timeout:600.0];
  [(MBPowerAssertion *)v3 hold];
  id v4 = MBGetDefaultLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "IX: Queuing up coordinator enumeration", buf, 2u);
    _MBLog();
  }

  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100093FF0;
  block[3] = &unk_100411128;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

- (void)_finishAppDataRestore
{
  char v2 = 0;
  atomic_compare_exchange_strong((atomic_uchar *volatile)&self->_appDataDidFinishRestore, (unsigned __int8 *)&v2, 1u);
  if (!v2)
  {
    unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_cancelled);
    char v5 = v4 & 1;
    unsigned __int8 v6 = dispatch_get_global_queue(17, 0);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100094D54;
    v7[3] = &unk_100411B10;
    void v7[4] = self;
    char v8 = v5;
    dispatch_async(v6, v7);
  }
}

- (void)openRestoreSlot
{
}

- (void)coordinatorShouldBeginRestoringUserData:(id)a3
{
}

- (void)restoreCoordinatorShouldBeginRestoringUserData:(id)a3
{
  id v4 = a3;
  char v5 = [v4 bundleID];
  if (!v5)
  {
    unsigned __int8 v6 = MBGetDefaultLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "IX: Coordinator had no bundleID associated with it. Nothing to do", buf, 2u);
      _MBLog();
    }
  }
  v7 = MBGetDefaultLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IX: We're being asked to restore user data for %@", buf, 0xCu);
    _MBLog();
  }

  coordinatorQueue = self->_coordinatorQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000950B0;
  block[3] = &unk_1004110B0;
  block[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(coordinatorQueue, block);
}

- (void)coordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
}

- (void)restoreCoordinator:(id)a3 canceledWithReason:(id)a4 client:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 bundleID];
  id v11 = v8;
  v12 = MBGetDefaultLog();
  v13 = v12;
  if (!v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "IX: Got unsuccessful completion for coordinator with nil bundleID", buf, 2u);
      _MBLog();
    }
    goto LABEL_17;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    CFStringRef v25 = v10;
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 1024;
    int v29 = a5;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "IX: App %@ could not be installed with error %@. Canceled by %u", buf, 0x1Cu);
    id v20 = v9;
    unint64_t v21 = a5;
    v19 = v10;
    _MBLog();
  }

  if (a5 != 2)
  {
    v13 = [v11 userDataPromiseWithError:0];
    v14 = MBGetDefaultLog();
    BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
    if (v13)
    {
      if (v15)
      {
        if ([v13 isComplete]) {
          CFStringRef v16 = @"YES";
        }
        else {
          CFStringRef v16 = @"NO";
        }
        [v13 percentComplete];
        *(_DWORD *)buf = 138412546;
        CFStringRef v25 = v16;
        __int16 v26 = 2048;
        id v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "IX: Coordinator was canceled but has already been promised data. Complete: %@, Progress: %.2f. Will continue restoring app data", buf, 0x16u);
        [v13 isComplete];
        [v13 percentComplete];
        _MBLog();
      }
    }
    else
    {
      if (v15)
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v25 = v10;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "IX: Coordinator %@ was canceled but hasn't been promised app data yet. Queueing up data restore", buf, 0xCu);
        _MBLog();
      }

      coordinatorQueue = self->_coordinatorQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100095570;
      block[3] = &unk_1004110B0;
      block[4] = self;
      v23 = v10;
      dispatch_async(coordinatorQueue, block);

      v13 = 0;
    }
LABEL_17:
  }
}

- (void)stopTrackingCoordinator:(id)a3 withSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = v6;
  if (v6)
  {
    id v8 = [v6 bundleID];
    id v9 = [v7 userDataPromiseWithError:0];
    id v10 = MBGetDefaultLog();
    id v11 = v10;
    if (v9)
    {
      BOOL v12 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
      if (v4)
      {
        if (v12)
        {
          *(_DWORD *)buf = 138412290;
          v44 = v8;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "IX: Setting data promise complete for bundleID %@", buf, 0xCu);
          v34 = v8;
          _MBLog();
        }

        [v9 setPercentComplete:1.0];
        [v9 setComplete:1];
        goto LABEL_22;
      }
      if (v12)
      {
        *(_DWORD *)buf = 138412290;
        v44 = v8;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "IX: Cancelling data promise for bundleID %@", buf, 0xCu);
        _MBLog();
      }

      id v11 = +[MBError errorWithCode:1, @"Couldn't restore app data for %@", v8 format];
      v14 = IXCreateUserPresentableError();
      id v42 = 0;
      unsigned __int8 v15 = [v9 cancelForReason:v14 client:2 error:&v42];
      CFStringRef v16 = (__CFString *)v42;
      if ((v15 & 1) == 0)
      {
        dispatch_semaphore_t v17 = MBGetDefaultLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v44 = v8;
          __int16 v45 = 2112;
          id v46 = v16;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "IX: Couldn't cancel data promise for %@ - %@", buf, 0x16u);
          v34 = v8;
          CFStringRef v37 = v16;
          _MBLog();
        }
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      if (v4) {
        CFStringRef v13 = @"completion";
      }
      else {
        CFStringRef v13 = @"cancellation";
      }
      *(_DWORD *)buf = 138412546;
      v44 = v8;
      __int16 v45 = 2112;
      id v46 = (id)v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "IX: InstallCoordinator for %@ didn't have a user data promise at the time of %@", buf, 0x16u);
      v34 = v8;
      CFStringRef v37 = v13;
      _MBLog();
    }

LABEL_22:
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appInstallCoordinators, "setObject:forKeyedSubscript:", 0, v8, v34, v37);
    [v7 setObserver:0];
    v18 = MBGetDefaultLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      if (v4) {
        CFStringRef v19 = @"Successfully";
      }
      else {
        CFStringRef v19 = @"Unsuccessfully";
      }
      id v20 = [(MBAppRestoreManager *)self account];
      unint64_t v21 = [v20 accountIdentifier];
      *(_DWORD *)buf = 138412802;
      v44 = (void *)v19;
      __int16 v45 = 2112;
      id v46 = v8;
      __int16 v47 = 2112;
      v48 = v21;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "IX: %@ serviced data promise for %@ account %@", buf, 0x20u);

      v22 = [(MBAppRestoreManager *)self account];
      [v22 accountIdentifier];
      v40 = v38 = v8;
      CFStringRef v35 = v19;
      _MBLog();
    }
    id v23 = [(NSMutableDictionary *)self->_appInstallCoordinators count];
    v24 = [(NSMutableDictionary *)self->_appInstallCoordinators allKeys];
    CFStringRef v25 = v24;
    if ((unint64_t)v23 >= 0xA) {
      uint64_t v26 = 10;
    }
    else {
      uint64_t v26 = (uint64_t)v23;
    }
    id v27 = objc_msgSend(v24, "subarrayWithRange:", 0, v26, v35, v38, v40);

    __int16 v28 = MBGetDefaultLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = [(MBAppRestoreManager *)self account];
      v30 = [v29 accountIdentifier];
      *(_DWORD *)buf = 138412802;
      v44 = v30;
      __int16 v45 = 2048;
      id v46 = v23;
      __int16 v47 = 2112;
      v48 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "IX: Remaining coordinators for account %@ (%lu): %@", buf, 0x20u);

      v31 = [(MBAppRestoreManager *)self account];
      [v31 accountIdentifier];
      id v39 = v23;
      v36 = v41 = v27;
      _MBLog();
    }
    CFStringRef v32 = @"failed";
    if (v4) {
      CFStringRef v32 = @"finished";
    }
    v33 = +[NSString stringWithFormat:@"Data restore %@", v32, v39, v41];
    +[AITransactionLog logStep:2 byParty:6 phase:2 success:v4 forBundleID:v8 description:v33];

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_coordinationSemaphore);
    if (!v23) {
      [(MBAppRestoreManager *)self _finishAppDataRestore];
    }

    goto LABEL_37;
  }
  id v8 = MBGetDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "IX: Can't stop tracking a null coordinator", buf, 2u);
    _MBLog();
  }
LABEL_37:
}

- (void)stopTrackingCoordinatorWithBundleID:(id)a3 success:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_appInstallCoordinators objectForKeyedSubscript:v6];
    if (v7)
    {
      [(MBAppRestoreManager *)self stopTrackingCoordinator:v7 withSuccess:v4];
    }
    else
    {
      id v8 = MBGetDefaultLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v6;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Coordinator couldn't be found for %@. Couldn't stop tracking it", buf, 0xCu);
        _MBLog();
      }
    }
  }
}

- (void)updateProgressForCoordinatorWithBundleID:(id)a3 progress:(double)a4
{
  id v6 = a3;
  if (v6)
  {
    v7 = [(NSMutableDictionary *)self->_appInstallCoordinators objectForKeyedSubscript:v6];
    id v8 = v7;
    if (v7)
    {
      [v7 updateProgress:a4];
    }
    else
    {
      id v9 = MBGetDefaultLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v11 = v6;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Coordinator couldn't be found for %@. Couldn't update progress", buf, 0xCu);
        _MBLog();
      }
    }
  }
}

- (void)retryAppDataDownloads
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = objc_alloc_init((Class)NSMutableArray);
  stateQueue = self->_stateQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100096324;
  block[3] = &unk_100411358;
  block[4] = self;
  id v6 = v4;
  id v32 = v6;
  id v7 = v3;
  id v33 = v7;
  dispatch_sync(stateQueue, block);
  if ([v6 count])
  {
    id v8 = MBGetDefaultLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v6 count];
      *(_DWORD *)buf = 134217984;
      id v35 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IX: Found %lu apps whose coordinators are no longer tracked by IX. Going to stop tracking them", buf, 0xCu);
      id v22 = [v6 count];
      _MBLog();
    }

    id v10 = self->_stateQueue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_1000965C8;
    v28[3] = &unk_1004110B0;
    id v29 = v6;
    v30 = self;
    dispatch_sync(v10, v28);
  }
  id v11 = objc_msgSend(v7, "count", v22);
  BOOL v12 = MBGetDefaultLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      id v14 = [v7 count];
      unsigned __int8 v15 = [(MBAppRestoreManager *)self account];
      CFStringRef v16 = [v15 accountIdentifier];
      *(_DWORD *)buf = 134218242;
      id v35 = v14;
      __int16 v36 = 2112;
      CFStringRef v37 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "IX: Found %lu apps whose data restores need to be restarted for account %@", buf, 0x16u);

      [v7 count];
      dispatch_semaphore_t v17 = [(MBAppRestoreManager *)self account];
      v24 = [v17 accountIdentifier];
      _MBLog();
    }
    v18 = dispatch_get_global_queue(17, 0);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000966C0;
    v25[3] = &unk_1004110B0;
    uint64_t v26 = v7;
    id v27 = self;
    dispatch_async(v18, v25);

    BOOL v12 = v26;
  }
  else if (v13)
  {
    CFStringRef v19 = [(MBAppRestoreManager *)self account];
    id v20 = [v19 accountIdentifier];
    *(_DWORD *)buf = 138412290;
    id v35 = v20;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "IX: Found no apps whose user data promises needed to be restarted. Nothing more to do for account %@", buf, 0xCu);

    unint64_t v21 = [(MBAppRestoreManager *)self account];
    id v23 = [v21 accountIdentifier];
    _MBLog();
  }
}

- (id)setUpDataPromiseForBundleID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = sub_100096C20;
  id v23 = sub_100096C30;
  id v24 = 0;
  stateQueue = self->_stateQueue;
  block = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  id v14 = sub_100096C38;
  unsigned __int8 v15 = &unk_100411B38;
  v18 = &v19;
  CFStringRef v16 = self;
  id v8 = v6;
  id v17 = v8;
  dispatch_sync(stateQueue, &block);
  id v9 = (void *)v20[5];
  if (a4 && !v9)
  {
    *a4 = +[MBError errorWithCode:1, @"Couldn't set up data promise for %@, probably because the coordinator no longer exists", v8, block, v13, v14, v15, v16 format];
    id v9 = (void *)v20[5];
  }
  id v10 = v9;

  _Block_object_dispose(&v19, 8);
  return v10;
}

- (void)_setUpDataPromiseForCoordinator:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 bundleID];
    id v6 = [v4 userDataPromiseWithError:0];
    id v7 = MBGetDefaultLog();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "IX: Data promise already exists for %@. Will let it complete", buf, 0xCu);
        _MBLog();
      }
    }
    else
    {
      if (v8)
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "IX: Setting up user data promise for %@", buf, 0xCu);
        _MBLog();
      }

      id v7 = [objc_alloc((Class)IXPromisedOutOfBandTransfer) initWithName:v5 client:2 diskSpaceNeeded:0];
      [v7 setComplete:0];
      [v4 setUserDataPromise:v7 error:0];
      +[AITransactionLog logStep:2 byParty:6 phase:1 success:1 forBundleID:v5 description:@"Starting app data restore"];
    }
  }
  else
  {
    char v5 = MBGetDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "IX: Can't set up promises for a null coordinator", buf, 2u);
      _MBLog();
    }
  }
}

- (void)cancelAndUninstallAllCoordinators
{
  if ((atomic_exchange((atomic_uchar *volatile)&self->_cancelled, 1u) & 1) == 0)
  {
    stateQueue = self->_stateQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100097000;
    block[3] = &unk_100411128;
    block[4] = self;
    dispatch_sync(stateQueue, block);
  }
}

- (BOOL)_restoreApplicationWithBundleID:(id)a3 failed:(BOOL)a4 context:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  unsigned __int8 v12 = atomic_load((unsigned __int8 *)&self->_cancelled);
  if (v12)
  {
    if (a6)
    {
      +[MBError errorWithCode:202 format:@"Restore was cancelled by user"];
      BOOL v21 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v21 = 0;
    }
  }
  else
  {
    uint64_t v40 = 0;
    v41 = &v40;
    uint64_t v42 = 0x2020000000;
    char v43 = 0;
    uint64_t v34 = 0;
    id v35 = &v34;
    uint64_t v36 = 0x3032000000;
    CFStringRef v37 = sub_100096C20;
    v38 = sub_100096C30;
    id v39 = 0;
    uint64_t v13 = [(MBAppRestoreManager *)self account];
    id v14 = [v13 persona];
    unsigned int v15 = [v14 isDataSeparatedPersona];

    if (v15)
    {
      CFStringRef v16 = [(MBAppRestoreManager *)self account];
      id v17 = [v16 persona];
      v18 = [v17 personaIdentifier];

      uint64_t v19 = MBGetDefaultLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        __int16 v45 = v18;
        __int16 v46 = 2114;
        id v47 = v10;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Adopting persona %{public}@ to restore %{public}@", buf, 0x16u);
        _MBLog();
      }

      v28[0] = _NSConcreteStackBlock;
      v28[1] = 3221225472;
      v28[2] = sub_100097688;
      v28[3] = &unk_100411B60;
      v31 = &v40;
      void v28[4] = self;
      id v29 = v10;
      BOOL v33 = v8;
      id v30 = v11;
      id v32 = &v34;
      id v20 = +[DMCPersonaHelper performBlockUnderPersona:v18 block:v28];
    }
    else
    {
      v18 = [(MBAppRestoreManager *)self delegate];
      id v22 = [(MBAppRestoreManager *)self account];
      id v23 = (id *)(v35 + 5);
      id obj = (id)v35[5];
      unsigned __int8 v24 = [v18 restoreApplicationWithBundleID:v10 failed:v8 qos:&off_100439ED0 context:v11 account:v22 error:&obj];
      objc_storeStrong(v23, obj);
      *((unsigned char *)v41 + 24) = v24;
    }
    int v25 = *((unsigned __int8 *)v41 + 24);
    if (a6 && !*((unsigned char *)v41 + 24))
    {
      *a6 = (id) v35[5];
      int v25 = *((unsigned __int8 *)v41 + 24);
    }
    BOOL v21 = v25 != 0;
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
  }

  return v21;
}

- (MBAppRestoreManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MBAppRestoreManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)appInstallCoordinators
{
  return self->_appInstallCoordinators;
}

- (void)setAppInstallCoordinators:(id)a3
{
}

- (OS_dispatch_queue)coordinatorQueue
{
  return self->_coordinatorQueue;
}

- (void)setCoordinatorQueue:(id)a3
{
}

- (OS_dispatch_semaphore)coordinationSemaphore
{
  return self->_coordinationSemaphore;
}

- (void)setCoordinationSemaphore:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setStateQueue:(id)a3
{
}

- (MBServiceAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSSet)bundleIDs
{
  return self->_bundleIDs;
}

- (void)setBundleIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIDs, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_coordinationSemaphore, 0);
  objc_storeStrong((id *)&self->_coordinatorQueue, 0);
  objc_storeStrong((id *)&self->_appInstallCoordinators, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end