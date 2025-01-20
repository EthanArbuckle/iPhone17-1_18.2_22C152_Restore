@interface _NFRemoteAdminManager
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_NFRemoteAdminManager)init;
- (void)cancelCardIngestionWithCompletion:(id)a3;
- (void)connectToServer:(id)a3 initialClientRequestInfo:(id)a4 completion:(id)a5;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)deleteAllAppletsAndCleanupWithTSMWithCompletion:(id)a3;
- (void)deleteAllSPAppletsAndCleanupWithTSMithCompletion:(id)a3;
- (void)deleteAllWalletAppletsAndCleanupWithTSMWithCompletion:(id)a3;
- (void)getAPNPublicTokenWithCompletion:(id)a3;
- (void)getSELDInfoForBrokerWithCompletion:(id)a3;
- (void)handleAppletStateChange:(id)a3;
- (void)handleAppletsDeleted:(id)a3;
- (void)handleCardIngestionStatus:(unint64_t)a3;
- (void)handleCardSessionToken:(id)a3;
- (void)hardwareStateDidChange;
- (void)ingestCard:(id)a3 completion:(id)a4;
- (void)nextRequestForServer:(id)a3 completion:(id)a4;
- (void)powerObserverSystemHasPoweredOn:(id)a3;
- (void)powerObserverSystemWillSleep:(id)a3;
- (void)primaryRegionTopicWithCompletion:(id)a3;
- (void)queueServerConnection:(id)a3 completion:(id)a4;
- (void)queueServerConnectionForApplets:(id)a3 completion:(id)a4;
- (void)registerForCallbacks:(id)a3;
- (void)registrationInfoWithCompletion:(id)a3;
- (void)setRegistrationInfo:(id)a3 primaryRegionTopic:(id)a4 completion:(id)a5;
- (void)unregisterForCallbacks:(id)a3;
@end

@implementation _NFRemoteAdminManager

- (_NFRemoteAdminManager)init
{
  v102.receiver = self;
  v102.super_class = (Class)_NFRemoteAdminManager;
  v3 = [(_NFRemoteAdminManager *)&v102 init];
  if (v3)
  {
    uint64_t v4 = +[NSUserDefaults standardUserDefaults];
    v5 = [(id)v4 dataForKey:@"APNTokenUpdateInfo"];

    LOBYTE(v4) = v5 == 0;
    v6 = +[NSUserDefaults standardUserDefaults];
    v7 = v6;
    if (v4)
    {
      id v8 = [v6 dataForKey:@"APNToken"];

      if ([v8 length])
      {
        id v9 = v8;
        CC_SHA256([v9 bytes], (CC_LONG)[v9 length], md);
        id v8 = [objc_alloc((Class)NSData) initWithBytesNoCopy:md length:32 freeWhenDone:0];

        v10 = +[NSUserDefaults standardUserDefaults];
        [v10 setObject:v8 forKey:@"APNTokenHash"];

        v11 = +[NSUserDefaults standardUserDefaults];
        [v11 removeObjectForKey:@"APNToken"];
      }
    }
    else
    {
      [v6 removeObjectForKey:@"APNTokenUpdateInfo"];

      id v8 = +[NSUserDefaults standardUserDefaults];
      [v8 removeObjectForKey:@"APNToken"];
    }

    atomic_store(0, (unsigned __int8 *)v3 + 154);
    uint64_t v12 = sub_100037740();
    v13 = (void *)*((void *)v3 + 3);
    *((void *)v3 + 3) = v12;

    uint64_t v14 = *((void *)v3 + 3);
    v15 = +[NSUserDefaults standardUserDefaults];
    id v16 = [v15 integerForKey:@"SecureElementSequenceCounter"];
    if (v14) {
      *(void *)(v14 + 48) = v16;
    }

    uint64_t v17 = *((void *)v3 + 3);
    v18 = +[NSUserDefaults standardUserDefaults];
    v19 = [v18 stringForKey:@"SecureElementPlatformId"];
    sub_10003A32C(v17, v19);

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v21 = dispatch_queue_create("com.apple.seld.adminSession", v20);
    v22 = (void *)*((void *)v3 + 13);
    *((void *)v3 + 13) = v21;

    v23 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v24 = dispatch_queue_create("com.apple.seld.aps", v23);
    v25 = (void *)*((void *)v3 + 10);
    *((void *)v3 + 10) = v24;

    id v26 = [objc_alloc((Class)NFPowerObserver) initWithDelegate:v3];
    v27 = (void *)*((void *)v3 + 5);
    *((void *)v3 + 5) = v26;

    id v28 = objc_alloc_init((Class)NSMutableDictionary);
    v29 = (void *)*((void *)v3 + 2);
    *((void *)v3 + 2) = v28;

    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v31 = dispatch_queue_create("com.apple.seld.xpcConnection", v30);
    v32 = (void *)*((void *)v3 + 9);
    *((void *)v3 + 9) = v31;

    id v101 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.stockholm"];
    byte_100060438 = [v101 BOOLForKey:@"LogTSM"];
    id v33 = [objc_alloc((Class)NSDictionary) initWithContentsOfFile:@"/Library/Preferences/Logging/Subsystems/com.apple.nfc.plist"];
    v34 = v33;
    if (v33)
    {
      v35 = [v33 objectForKey:@"LogTSM"];

      if (v35)
      {
        v36 = [v34 objectForKey:@"LogTSM"];
        byte_100060438 = [v36 BOOLValue];

        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
        if (Logger)
        {
          Class = object_getClass(v3);
          if (class_isMetaClass(Class)) {
            uint64_t v39 = 43;
          }
          else {
            uint64_t v39 = 45;
          }
          ClassName = object_getClassName(v3);
          Name = sel_getName(a2);
          Logger(6, "%c[%{public}s %{public}s]:%i Overriding LogTSM value with managed profile: %d", v39, ClassName, Name, 293, byte_100060438);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        v42 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = object_getClass(v3);
          if (class_isMetaClass(v43)) {
            int v44 = 43;
          }
          else {
            int v44 = 45;
          }
          v45 = object_getClassName(v3);
          v46 = sel_getName(a2);
          *(_DWORD *)md = 67110146;
          *(_DWORD *)&md[4] = v44;
          *(_WORD *)v122 = 2082;
          *(void *)&v122[2] = v45;
          *(_WORD *)&v122[10] = 2082;
          *(void *)&v122[12] = v46;
          *(_WORD *)&v122[20] = 1024;
          *(_DWORD *)&v122[22] = 293;
          __int16 v123 = 1024;
          *(_DWORD *)v124 = byte_100060438;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Overriding LogTSM value with managed profile: %d", md, 0x28u);
        }
      }
    }
    id v47 = objc_alloc_init((Class)NSLock);
    v48 = (void *)*((void *)v3 + 16);
    *((void *)v3 + 16) = v47;

    v3[153] = 0;
    v3[155] = 0;
    *(void *)(v3 + 156) = -1;
    sub_10001A874((uint64_t)v3);
    uint64_t v49 = objc_opt_new();
    v50 = (void *)*((void *)v3 + 21);
    *((void *)v3 + 21) = v49;

    id v51 = [objc_alloc((Class)NFXPCEventPublisher) initWithStreamName:@"com.apple.seld.xpc.events" queue:*((void *)v3 + 9)];
    v52 = (void *)*((void *)v3 + 28);
    *((void *)v3 + 28) = v51;

    update_handler = _NSConcreteStackBlock;
    uint64_t v116 = 3221225472;
    v117 = sub_10001FE54;
    v118 = &unk_100058990;
    v119 = (unsigned __int8 *)v3;
    if ((sub_10001FED8((uint64_t)v3, @"com.apple.seld.alarm", &update_handler) & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v53 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v53)
      {
        v54 = object_getClass(v3);
        if (class_isMetaClass(v54)) {
          uint64_t v55 = 43;
        }
        else {
          uint64_t v55 = 45;
        }
        v56 = object_getClassName(v3);
        v57 = sel_getName("registerActivityHandlers");
        v53(3, "%c[%{public}s %{public}s]:%i Failed to register %@", v55, v56, v57, 720, @"com.apple.seld.alarm");
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v58 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        v59 = object_getClass(v3);
        if (class_isMetaClass(v59)) {
          int v60 = 43;
        }
        else {
          int v60 = 45;
        }
        v61 = object_getClassName(v3);
        v62 = sel_getName("registerActivityHandlers");
        *(_DWORD *)md = 67110146;
        *(_DWORD *)&md[4] = v60;
        *(_WORD *)v122 = 2082;
        *(void *)&v122[2] = v61;
        *(_WORD *)&v122[10] = 2082;
        *(void *)&v122[12] = v62;
        *(_WORD *)&v122[20] = 1024;
        *(_DWORD *)&v122[22] = 720;
        __int16 v123 = 2112;
        *(void *)v124 = @"com.apple.seld.alarm";
        _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register %@", md, 0x2Cu);
      }
    }
    v110 = _NSConcreteStackBlock;
    uint64_t v111 = 3221225472;
    v112 = sub_10001FFB8;
    v113 = &unk_100058990;
    id v114 = v3;
    if ((sub_10001FED8((uint64_t)v3, @"com.apple.seld.processing", &v110) & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v63 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v63)
      {
        v64 = object_getClass(v3);
        if (class_isMetaClass(v64)) {
          uint64_t v65 = 43;
        }
        else {
          uint64_t v65 = 45;
        }
        v66 = object_getClassName(v3);
        v67 = sel_getName("registerActivityHandlers");
        v63(3, "%c[%{public}s %{public}s]:%i Failed to register %@", v65, v66, v67, 731, @"com.apple.seld.processing");
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v68 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        v69 = object_getClass(v3);
        if (class_isMetaClass(v69)) {
          int v70 = 43;
        }
        else {
          int v70 = 45;
        }
        v71 = object_getClassName(v3);
        v72 = sel_getName("registerActivityHandlers");
        *(_DWORD *)md = 67110146;
        *(_DWORD *)&md[4] = v70;
        *(_WORD *)v122 = 2082;
        *(void *)&v122[2] = v71;
        *(_WORD *)&v122[10] = 2082;
        *(void *)&v122[12] = v72;
        *(_WORD *)&v122[20] = 1024;
        *(_DWORD *)&v122[22] = 731;
        __int16 v123 = 2112;
        *(void *)v124 = @"com.apple.seld.processing";
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register %@", md, 0x2Cu);
      }
    }
    v105 = _NSConcreteStackBlock;
    uint64_t v106 = 3221225472;
    v107 = sub_10002003C;
    v108 = &unk_100058990;
    v109 = v3;
    if ((sub_10001FED8((uint64_t)v3, @"com.apple.seld.osupdate", &v105) & 1) == 0)
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v73 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
      if (v73)
      {
        v74 = object_getClass(v3);
        if (class_isMetaClass(v74)) {
          uint64_t v75 = 43;
        }
        else {
          uint64_t v75 = 45;
        }
        v76 = object_getClassName(v3);
        v77 = sel_getName("registerActivityHandlers");
        v73(3, "%c[%{public}s %{public}s]:%i Failed to register %@", v75, v76, v77, 742, @"com.apple.seld.osupdate");
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      v78 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
      {
        v79 = object_getClass(v3);
        if (class_isMetaClass(v79)) {
          int v80 = 43;
        }
        else {
          int v80 = 45;
        }
        v81 = object_getClassName(v3);
        v82 = sel_getName("registerActivityHandlers");
        *(_DWORD *)md = 67110146;
        *(_DWORD *)&md[4] = v80;
        *(_WORD *)v122 = 2082;
        *(void *)&v122[2] = v81;
        *(_WORD *)&v122[10] = 2082;
        *(void *)&v122[12] = v82;
        *(_WORD *)&v122[20] = 1024;
        *(_DWORD *)&v122[22] = 742;
        __int16 v123 = 2112;
        *(void *)v124 = @"com.apple.seld.osupdate";
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Failed to register %@", md, 0x2Cu);
      }
    }
    *((void *)v3 + 27) = 15;
    nw_path_monitor_t v83 = nw_path_monitor_create_with_type(nw_interface_type_wifi);
    v84 = (void *)*((void *)v3 + 23);
    *((void *)v3 + 23) = v83;

    nw_path_monitor_t v85 = nw_path_monitor_create_with_type(nw_interface_type_cellular);
    v86 = (void *)*((void *)v3 + 24);
    *((void *)v3 + 24) = v85;

    nw_path_monitor_t v87 = nw_path_monitor_create_with_type(nw_interface_type_wired);
    v88 = (void *)*((void *)v3 + 25);
    *((void *)v3 + 25) = v87;

    nw_path_monitor_t v89 = nw_path_monitor_create_with_type(nw_interface_type_other);
    v90 = (void *)*((void *)v3 + 26);
    *((void *)v3 + 26) = v89;

    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v3 + 23), *((dispatch_queue_t *)v3 + 13));
    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v3 + 24), *((dispatch_queue_t *)v3 + 13));
    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v3 + 25), *((dispatch_queue_t *)v3 + 13));
    nw_path_monitor_set_queue(*((nw_path_monitor_t *)v3 + 26), *((dispatch_queue_t *)v3 + 13));
    objc_initWeak(&location, v3);
    *(void *)md = _NSConcreteStackBlock;
    *(void *)v122 = 3221225472;
    *(void *)&v122[8] = sub_10001BC04;
    *(void *)&v122[16] = &unk_1000588D8;
    objc_copyWeak((id *)&v122[24], &location);
    *(void *)&v124[4] = "_setupNetworkMonitor";
    v91 = objc_retainBlock(md);
    v92 = *((void *)v3 + 23);
    update_handler = _NSConcreteStackBlock;
    uint64_t v116 = 3221225472;
    v117 = sub_10001C1C0;
    v118 = &unk_100058900;
    v93 = v91;
    v119 = v93;
    nw_path_monitor_set_update_handler(v92, &update_handler);
    v94 = *((void *)v3 + 24);
    v110 = _NSConcreteStackBlock;
    uint64_t v111 = 3221225472;
    v112 = sub_10001C250;
    v113 = &unk_100058900;
    v95 = v93;
    id v114 = v95;
    nw_path_monitor_set_update_handler(v94, &v110);
    v96 = *((void *)v3 + 25);
    v105 = _NSConcreteStackBlock;
    uint64_t v106 = 3221225472;
    v107 = sub_10001C2E0;
    v108 = &unk_100058900;
    v97 = v95;
    v109 = (char *)v97;
    nw_path_monitor_set_update_handler(v96, &v105);
    v98 = *((void *)v3 + 26);
    v103[0] = _NSConcreteStackBlock;
    v103[1] = 3221225472;
    v103[2] = sub_10001C370;
    v103[3] = &unk_100058900;
    v99 = v97;
    v104 = v99;
    nw_path_monitor_set_update_handler(v98, v103);

    objc_destroyWeak((id *)&v122[24]);
    objc_destroyWeak(&location);
  }
  return (_NFRemoteAdminManager *)v3;
}

- (void)hardwareStateDidChange
{
  obj = self;
  objc_sync_enter(obj);
  v2 = obj;
  if (!obj->_isRunning)
  {
    v3 = +[NFHardwareManager sharedHardwareManager];
    unsigned int v4 = [v3 getHwSupport];
    if (v4 == 4)
    {
      v6 = +[NFHardwareManager sharedHardwareManager];
      [v6 unregisterEventListener:obj];

      waitForNFCDTransaction = obj->_waitForNFCDTransaction;
      obj->_waitForNFCDTransaction = 0;
    }
    else if (v4 == 2)
    {
      v5 = +[NFHardwareManager sharedHardwareManager];
      [v5 unregisterEventListener:obj];

      sub_10001D3A0((uint64_t)obj);
LABEL_7:

      v2 = obj;
      goto LABEL_8;
    }
    sub_10001D560(obj);
    goto LABEL_7;
  }
LABEL_8:
  objc_sync_exit(v2);
}

- (void)powerObserverSystemWillSleep:(id)a3
{
  id v5 = a3;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v11 = 45;
    if (isMetaClass) {
      uint64_t v11 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i System is sleeping", v11, ClassName, Name, 920);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v12 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = object_getClass(self);
    if (class_isMetaClass(v13)) {
      int v14 = 43;
    }
    else {
      int v14 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v28 = v14;
    __int16 v29 = 2082;
    v30 = object_getClassName(self);
    __int16 v31 = 2082;
    v32 = sel_getName(a2);
    __int16 v33 = 1024;
    int v34 = 920;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i System is sleeping", buf, 0x22u);
  }

  v15 = self;
  objc_sync_enter(v15);
  if (v15->_activeSession)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v16 = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (v16)
    {
      uint64_t v17 = object_getClass(v15);
      if (class_isMetaClass(v17)) {
        uint64_t v18 = 43;
      }
      else {
        uint64_t v18 = 45;
      }
      v19 = object_getClassName(v15);
      v20 = sel_getName(a2);
      v16(5, "%c[%{public}s %{public}s]:%i Aborting active session", v18, v19, v20, 923);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    dispatch_queue_t v21 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = object_getClass(v15);
      if (class_isMetaClass(v22)) {
        int v23 = 43;
      }
      else {
        int v23 = 45;
      }
      dispatch_queue_t v24 = object_getClassName(v15);
      v25 = sel_getName(a2);
      *(_DWORD *)buf = 67109890;
      int v28 = v23;
      __int16 v29 = 2082;
      v30 = v24;
      __int16 v31 = 2082;
      v32 = v25;
      __int16 v33 = 1024;
      int v34 = 923;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Aborting active session", buf, 0x22u);
    }

    [(NFAdminSession *)v15->_activeSession abort:4];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      v15->_sessionWasAbortedOnSleep = 1;
    }
  }
  [(NFPowerObserver *)v15->_powerObserver allowSleep];
  objc_sync_exit(v15);
}

- (void)powerObserverSystemHasPoweredOn:(id)a3
{
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    v6 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v10 = 45;
    if (isMetaClass) {
      uint64_t v10 = 43;
    }
    v6(6, "%c[%{public}s %{public}s]:%i System is powered on", v10, ClassName, Name, 936);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v11 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      int v13 = 43;
    }
    else {
      int v13 = 45;
    }
    *(_DWORD *)buf = 67109890;
    int v16 = v13;
    __int16 v17 = 2082;
    uint64_t v18 = object_getClassName(self);
    __int16 v19 = 2082;
    v20 = sel_getName(a2);
    __int16 v21 = 1024;
    int v22 = 936;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i System is powered on", buf, 0x22u);
  }

  if (self->_sessionWasAbortedOnSleep)
  {
    self->_sessionWasAbortedOnSleep = 0;
    sub_10001A0A0((atomic_uchar *)self);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [objc_alloc((Class)NFServiceWhitelistChecker) initWithConnection:v7];
  v52 = v6;
  if (([v8 remoteAdminAccess] & 1) == 0)
  {
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = NFLogGetLogger();
    if (Logger)
    {
      __int16 v31 = (void (*)(uint64_t, const char *, ...))Logger;
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v33 = 43;
      }
      else {
        uint64_t v33 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      id v36 = [v7 processIdentifier];
      v37 = [v8 clientName];
      v31(3, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) missing entitlement: %s", v33, ClassName, Name, 981, v36, v37, "com.apple.seld.tsmmanager");
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v38 = object_getClass(self);
      if (class_isMetaClass(v38)) {
        int v39 = 43;
      }
      else {
        int v39 = 45;
      }
      v40 = object_getClassName(self);
      v41 = sel_getName(a2);
      unsigned int v42 = [v7 processIdentifier];
      v43 = [v8 clientName];
      *(_DWORD *)buf = 67110658;
      *(_DWORD *)&uint8_t buf[4] = v39;
      *(_WORD *)v57 = 2082;
      *(void *)&v57[2] = v40;
      *(_WORD *)&v57[10] = 2082;
      *(void *)&v57[12] = v41;
      *(_WORD *)&v57[20] = 1024;
      *(_DWORD *)&v57[22] = 981;
      *(_WORD *)&v57[26] = 1024;
      *(_DWORD *)&v57[28] = v42;
      *(_WORD *)&v57[32] = 2114;
      *(void *)&v57[34] = v43;
      *(_WORD *)&v57[42] = 2080;
      *(void *)&v57[44] = "com.apple.seld.tsmmanager";
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i PID %d (%{public}@) missing entitlement: %s", buf, 0x3Cu);
    }
    goto LABEL_33;
  }
  BOOL hardwareLoadComplete = self->_hardwareLoadComplete;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v10 = NFLogGetLogger();
  uint64_t v11 = (void (*)(uint64_t, const char *, ...))v10;
  if (!hardwareLoadComplete)
  {
    if (v10)
    {
      int v44 = object_getClass(self);
      BOOL isMetaClass = class_isMetaClass(v44);
      v46 = object_getClassName(self);
      id v51 = sel_getName(a2);
      uint64_t v47 = 45;
      if (isMetaClass) {
        uint64_t v47 = 43;
      }
      v11(3, "%c[%{public}s %{public}s]:%i Hardware isn't loaded. Rejecting XPC connections", v47, v46, v51, 986);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    id v26 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v48 = object_getClass(self);
      if (class_isMetaClass(v48)) {
        int v49 = 43;
      }
      else {
        int v49 = 45;
      }
      *(_DWORD *)buf = 67109890;
      *(_DWORD *)&uint8_t buf[4] = v49;
      *(_WORD *)v57 = 2082;
      *(void *)&v57[2] = object_getClassName(self);
      *(_WORD *)&v57[10] = 2082;
      *(void *)&v57[12] = sel_getName(a2);
      *(_WORD *)&v57[20] = 1024;
      *(_DWORD *)&v57[22] = 986;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Hardware isn't loaded. Rejecting XPC connections", buf, 0x22u);
    }
LABEL_33:
    BOOL v29 = 0;
    goto LABEL_34;
  }
  if (v10)
  {
    uint64_t v12 = object_getClass(self);
    if (class_isMetaClass(v12)) {
      uint64_t v13 = 43;
    }
    else {
      uint64_t v13 = 45;
    }
    int v14 = object_getClassName(self);
    v15 = sel_getName(a2);
    int v16 = [v8 clientName];
    v11(6, "%c[%{public}s %{public}s]:%i Added connection from %{public}@ : %{public}@", v13, v14, v15, 990, v16, v7);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  __int16 v17 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v18 = object_getClass(self);
    if (class_isMetaClass(v18)) {
      int v19 = 43;
    }
    else {
      int v19 = 45;
    }
    v20 = object_getClassName(self);
    __int16 v21 = sel_getName(a2);
    int v22 = [v8 clientName];
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)&uint8_t buf[4] = v19;
    *(_WORD *)v57 = 2082;
    *(void *)&v57[2] = v20;
    *(_WORD *)&v57[10] = 2082;
    *(void *)&v57[12] = v21;
    *(_WORD *)&v57[20] = 1024;
    *(_DWORD *)&v57[22] = 990;
    *(_WORD *)&v57[26] = 2114;
    *(void *)&v57[28] = v22;
    *(_WORD *)&v57[36] = 2114;
    *(void *)&v57[38] = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Added connection from %{public}@ : %{public}@", buf, 0x36u);
  }
  int v23 = +[NFRemoteAdminManagerCallbacks interface];
  [v7 setRemoteObjectInterface:v23];

  dispatch_queue_t v24 = +[NFRemoteAdminManagerInterface interface];
  [v7 setExportedInterface:v24];

  [v7 setExportedObject:self];
  v25 = objc_opt_new();
  id v26 = +[NSMutableDictionary dictionaryWithObject:v25 forKey:@"ProxyObjects"];

  v27 = [v8 clientName];
  [v26 setObject:v27 forKey:@"ClientName"];

  [v26 setObject:v8 forKey:@"ServiceWhitelist"];
  [v7 setUserInfo:v26];
  *(void *)buf = 0;
  *(void *)v57 = buf;
  *(void *)&v57[8] = 0x3032000000;
  *(void *)&v57[16] = sub_10002163C;
  *(void *)&v57[24] = sub_10002164C;
  id v28 = v7;
  *(void *)&v57[32] = v28;
  v55[0] = _NSConcreteStackBlock;
  v55[1] = 3221225472;
  v55[2] = sub_100021654;
  v55[3] = &unk_100058AC8;
  v55[4] = self;
  v55[5] = buf;
  [v28 setInvalidationHandler:v55];
  v54[0] = _NSConcreteStackBlock;
  v54[1] = 3221225472;
  v54[2] = sub_1000218C0;
  v54[3] = &unk_100058AC8;
  v54[4] = self;
  v54[5] = buf;
  [v28 setInterruptionHandler:v54];
  [v28 _setQueue:self->_xpcConnectionQueue];
  [v28 resume];
  _Block_object_dispose(buf, 8);

  BOOL v29 = 1;
LABEL_34:

  return v29;
}

- (void)registerForCallbacks:(id)a3
{
  id v23 = a3;
  id v5 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    if (class_isMetaClass(Class)) {
      uint64_t v9 = 43;
    }
    else {
      uint64_t v9 = 45;
    }
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = [v5 NF_userInfo];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"ClientName"];
    v7(6, "%c[%{public}s %{public}s]:%i Registering callback handler for %{public}@", v9, ClassName, Name, 1104, v13);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v14 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = object_getClass(self);
    if (class_isMetaClass(v15)) {
      int v16 = 43;
    }
    else {
      int v16 = 45;
    }
    __int16 v17 = object_getClassName(self);
    uint64_t v18 = sel_getName(a2);
    int v19 = [v5 NF_userInfo];
    v20 = [v19 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v25 = v16;
    __int16 v26 = 2082;
    v27 = v17;
    __int16 v28 = 2082;
    BOOL v29 = v18;
    __int16 v30 = 1024;
    int v31 = 1104;
    __int16 v32 = 2114;
    uint64_t v33 = v20;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Registering callback handler for %{public}@", buf, 0x2Cu);
  }
  __int16 v21 = self->_callbackHandlers;
  objc_sync_enter(v21);
  int v22 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (int)[v5 processIdentifier]);
  [(NSMutableDictionary *)self->_callbackHandlers setObject:v23 forKeyedSubscript:v22];

  objc_sync_exit(v21);
}

- (void)unregisterForCallbacks:(id)a3
{
  id v5 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v7 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v12 = [v5 NF_userInfo];
    uint64_t v13 = [v12 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v7(6, "%c[%{public}s %{public}s]:%i Unregistering callback handler for %{public}@", v14, ClassName, Name, 1120, v13);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    uint64_t v18 = object_getClassName(self);
    int v19 = sel_getName(a2);
    v20 = [v5 NF_userInfo];
    __int16 v21 = [v20 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v23 = v17;
    __int16 v24 = 2082;
    int v25 = v18;
    __int16 v26 = 2082;
    v27 = v19;
    __int16 v28 = 1024;
    int v29 = 1120;
    __int16 v30 = 2114;
    int v31 = v21;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Unregistering callback handler for %{public}@", buf, 0x2Cu);
  }
  sub_1000218D4((uint64_t)self, v5);
}

- (void)setRegistrationInfo:(id)a3 primaryRegionTopic:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, void))a5;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v13 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v13(6, "%c[%{public}s %{public}s]:%i theInfo=%{public}@, thePrimaryRegionTopic=%{public}@", v17, ClassName, Name, 1190, v9, v10);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    *(_DWORD *)buf = 67110402;
    int v33 = v20;
    __int16 v34 = 2082;
    v35 = object_getClassName(self);
    __int16 v36 = 2082;
    v37 = sel_getName(a2);
    __int16 v38 = 1024;
    int v39 = 1190;
    __int16 v40 = 2114;
    id v41 = v9;
    __int16 v42 = 2114;
    id v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i theInfo=%{public}@, thePrimaryRegionTopic=%{public}@", buf, 0x36u);
  }

  if (sub_10003A384(self->_storage, v9, v10))
  {
    v11[2](v11, 0);
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100022F78;
    v27[3] = &unk_100058B40;
    v27[4] = self;
    id v28 = v9;
    id v29 = v10;
    sub_10002258C(self, v27);
  }
  else
  {
    id v21 = objc_alloc((Class)NSError);
    int v22 = +[NSString stringWithUTF8String:"nfcd"];
    NSErrorUserInfoKey v30 = NSLocalizedDescriptionKey;
    int v23 = +[NSString stringWithUTF8String:"Invalid Parameter"];
    int v31 = v23;
    __int16 v24 = +[NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v25 = [v21 initWithDomain:v22 code:10 userInfo:v24];
    ((void (**)(id, id))v11)[2](v11, v25);
  }
}

- (void)registrationInfoWithCompletion:(id)a3
{
  storage = self->_storage;
  id v5 = a3;
  sub_100039B5C(storage);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)primaryRegionTopicWithCompletion:(id)a3
{
  storage = self->_storage;
  id v5 = a3;
  sub_10003B038(storage);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, id, void))a3 + 2))(v5, v6, 0);
}

- (void)nextRequestForServer:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100023744;
  v7[3] = &unk_100058B90;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  sub_10002258C(v8, v7);
}

- (void)connectToServer:(id)a3 initialClientRequestInfo:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v36 = a4;
  id v35 = a5;
  id v10 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v12 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v17 = a2;
    id v18 = v9;
    int v19 = Name;
    int v20 = [v10 NF_userInfo];
    id v21 = [v20 objectForKeyedSubscript:@"ClientName"];
    __int16 v34 = v19;
    id v9 = v18;
    a2 = v17;
    uint64_t v22 = 45;
    if (isMetaClass) {
      uint64_t v22 = 43;
    }
    v12(6, "%c[%{public}s %{public}s]:%i Server connection request from %{public}@", v22, ClassName, v34, 1340, v21);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  int v23 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v24 = object_getClass(self);
    if (class_isMetaClass(v24)) {
      int v25 = 43;
    }
    else {
      int v25 = 45;
    }
    __int16 v26 = object_getClassName(self);
    v27 = sel_getName(a2);
    id v28 = [v10 NF_userInfo];
    id v29 = [v28 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v44 = v25;
    __int16 v45 = 2082;
    v46 = v26;
    __int16 v47 = 2082;
    v48 = v27;
    __int16 v49 = 1024;
    int v50 = 1340;
    __int16 v51 = 2114;
    v52 = v29;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i Server connection request from %{public}@", buf, 0x2Cu);
  }
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100025AD8;
  v37[3] = &unk_100058BE0;
  v37[4] = self;
  id v38 = v10;
  id v39 = v9;
  id v40 = v36;
  id v41 = v35;
  SEL v42 = a2;
  id v30 = v35;
  id v31 = v36;
  id v32 = v9;
  id v33 = v10;
  sub_10002258C(self, v37);
}

- (void)queueServerConnection:(id)a3 completion:(id)a4
{
  id v32 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    uint64_t v14 = a2;
    Name = sel_getName(a2);
    [v8 NF_userInfo];
    int v16 = v8;
    v18 = id v17 = v7;
    int v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    id v31 = Name;
    a2 = v14;
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v20, ClassName, v31, 1382, v19, v32);

    id v7 = v17;
    id v8 = v16;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    __int16 v24 = object_getClassName(self);
    int v25 = sel_getName(a2);
    __int16 v26 = [v8 NF_userInfo];
    [v26 objectForKeyedSubscript:@"ClientName"];
    id v28 = v27 = a2;
    *(_DWORD *)buf = 67110146;
    int v38 = v23;
    __int16 v39 = 2082;
    id v40 = v24;
    __int16 v41 = 2082;
    SEL v42 = v25;
    __int16 v43 = 1024;
    int v44 = 1382;
    __int16 v45 = 2114;
    v46 = v28;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

    a2 = v27;
  }

  id v29 = self;
  objc_sync_enter(v29);
  BOOL apsInited = v29->_apsInited;
  objc_sync_exit(v29);

  if (apsInited)
  {
    sub_1000262D0((void **)&v29->super.isa, v32, v7);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100026BFC;
    v33[3] = &unk_100058C08;
    v33[4] = v29;
    SEL v36 = a2;
    id v34 = v8;
    id v35 = v32;
    sub_10002258C(v29, v33);
  }
}

- (void)queueServerConnectionForApplets:(id)a3 completion:(id)a4
{
  id v32 = a3;
  id v7 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    uint64_t v14 = a2;
    Name = sel_getName(a2);
    [v8 NF_userInfo];
    int v16 = v8;
    v18 = id v17 = v7;
    int v19 = [v18 objectForKeyedSubscript:@"ClientName"];
    id v31 = Name;
    a2 = v14;
    uint64_t v20 = 45;
    if (isMetaClass) {
      uint64_t v20 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v20, ClassName, v31, 1449, v19, v32);

    id v7 = v17;
    id v8 = v16;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v21 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = object_getClass(self);
    if (class_isMetaClass(v22)) {
      int v23 = 43;
    }
    else {
      int v23 = 45;
    }
    __int16 v24 = object_getClassName(self);
    int v25 = sel_getName(a2);
    __int16 v26 = [v8 NF_userInfo];
    [v26 objectForKeyedSubscript:@"ClientName"];
    id v28 = v27 = a2;
    *(_DWORD *)buf = 67110146;
    int v38 = v23;
    __int16 v39 = 2082;
    id v40 = v24;
    __int16 v41 = 2082;
    SEL v42 = v25;
    __int16 v43 = 1024;
    int v44 = 1449;
    __int16 v45 = 2114;
    v46 = v28;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);

    a2 = v27;
  }

  id v29 = self;
  objc_sync_enter(v29);
  BOOL apsInited = v29->_apsInited;
  objc_sync_exit(v29);

  if (apsInited)
  {
    sub_100026E10(v29, v32, v7);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_100027950;
    v33[3] = &unk_100058C08;
    v33[4] = v29;
    SEL v36 = a2;
    id v34 = v8;
    id v35 = v32;
    sub_10002258C(v29, v33);
  }
}

- (void)ingestCard:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v30 = a4;
  id v8 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v10 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    [v8 NF_userInfo];
    v15 = a2;
    v17 = id v16 = v7;
    id v18 = [v17 objectForKeyedSubscript:@"ClientName"];
    uint64_t v19 = 45;
    if (isMetaClass) {
      uint64_t v19 = 43;
    }
    v10(6, "%c[%{public}s %{public}s]:%i %{public}@", v19, ClassName, Name, 1627, v18);

    id v7 = v16;
    a2 = v15;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v20 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = object_getClass(self);
    if (class_isMetaClass(v21)) {
      int v22 = 43;
    }
    else {
      int v22 = 45;
    }
    int v23 = object_getClassName(self);
    __int16 v24 = sel_getName(a2);
    int v25 = [v8 NF_userInfo];
    __int16 v26 = [v25 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v37 = v22;
    __int16 v38 = 2082;
    __int16 v39 = v23;
    __int16 v40 = 2082;
    __int16 v41 = v24;
    __int16 v42 = 1024;
    int v43 = 1627;
    __int16 v44 = 2114;
    __int16 v45 = v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_100028E14;
  v31[3] = &unk_100058C80;
  v31[4] = self;
  id v32 = v8;
  id v33 = v7;
  id v34 = v30;
  SEL v35 = a2;
  id v27 = v30;
  id v28 = v7;
  id v29 = v8;
  sub_10002258C(self, v31);
}

- (void)cancelCardIngestionWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = [v6 NF_userInfo];
    [v13 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = a2;
    id v16 = v15 = v5;
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1672, v16);

    id v5 = v15;
    a2 = v14;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    id v21 = object_getClassName(self);
    int v22 = sel_getName(a2);
    int v23 = [v6 NF_userInfo];
    __int16 v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v32 = v20;
    __int16 v33 = 2082;
    id v34 = v21;
    __int16 v35 = 2082;
    SEL v36 = v22;
    __int16 v37 = 1024;
    int v38 = 1672;
    __int16 v39 = 2114;
    __int16 v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002A3FC;
  v27[3] = &unk_100058CA8;
  v27[4] = self;
  id v28 = v6;
  id v29 = v5;
  SEL v30 = a2;
  id v25 = v5;
  id v26 = v6;
  sub_10002258C(self, v27);
}

- (void)getSELDInfoForBrokerWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = [v6 NF_userInfo];
    [v13 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = a2;
    id v16 = v15 = v5;
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1719, v16);

    id v5 = v15;
    a2 = v14;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    id v21 = object_getClassName(self);
    int v22 = sel_getName(a2);
    int v23 = [v6 NF_userInfo];
    __int16 v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v32 = v20;
    __int16 v33 = 2082;
    id v34 = v21;
    __int16 v35 = 2082;
    SEL v36 = v22;
    __int16 v37 = 1024;
    int v38 = 1719;
    __int16 v39 = 2114;
    __int16 v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002AFD8;
  v27[3] = &unk_100058CA8;
  v27[4] = self;
  id v28 = v6;
  id v29 = v5;
  SEL v30 = a2;
  id v25 = v5;
  id v26 = v6;
  sub_10002258C(self, v27);
}

- (void)deleteAllAppletsAndCleanupWithTSMWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = [v6 NF_userInfo];
    [v13 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = a2;
    id v16 = v15 = v5;
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1833, v16);

    id v5 = v15;
    a2 = v14;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    id v21 = object_getClassName(self);
    int v22 = sel_getName(a2);
    int v23 = [v6 NF_userInfo];
    __int16 v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v32 = v20;
    __int16 v33 = 2082;
    id v34 = v21;
    __int16 v35 = 2082;
    SEL v36 = v22;
    __int16 v37 = 1024;
    int v38 = 1833;
    __int16 v39 = 2114;
    __int16 v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002C1B8;
  v27[3] = &unk_100058CA8;
  v27[4] = self;
  id v28 = v6;
  id v29 = v5;
  SEL v30 = a2;
  id v25 = v5;
  id v26 = v6;
  sub_10002258C(self, v27);
}

- (void)deleteAllWalletAppletsAndCleanupWithTSMWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = [v6 NF_userInfo];
    [v13 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = a2;
    id v16 = v15 = v5;
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1851, v16);

    id v5 = v15;
    a2 = v14;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    id v21 = object_getClassName(self);
    int v22 = sel_getName(a2);
    int v23 = [v6 NF_userInfo];
    __int16 v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v32 = v20;
    __int16 v33 = 2082;
    id v34 = v21;
    __int16 v35 = 2082;
    SEL v36 = v22;
    __int16 v37 = 1024;
    int v38 = 1851;
    __int16 v39 = 2114;
    __int16 v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002C70C;
  v27[3] = &unk_100058CA8;
  v27[4] = self;
  id v28 = v6;
  id v29 = v5;
  SEL v30 = a2;
  id v25 = v5;
  id v26 = v6;
  sub_10002258C(self, v27);
}

- (void)deleteAllSPAppletsAndCleanupWithTSMithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = [v6 NF_userInfo];
    [v13 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = a2;
    id v16 = v15 = v5;
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1870, v16);

    id v5 = v15;
    a2 = v14;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    id v21 = object_getClassName(self);
    int v22 = sel_getName(a2);
    int v23 = [v6 NF_userInfo];
    __int16 v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v32 = v20;
    __int16 v33 = 2082;
    id v34 = v21;
    __int16 v35 = 2082;
    SEL v36 = v22;
    __int16 v37 = 1024;
    int v38 = 1870;
    __int16 v39 = 2114;
    __int16 v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002CC60;
  v27[3] = &unk_100058CA8;
  v27[4] = self;
  id v28 = v6;
  id v29 = v5;
  SEL v30 = a2;
  id v25 = v5;
  id v26 = v6;
  sub_10002258C(self, v27);
}

- (void)getAPNPublicTokenWithCompletion:(id)a3
{
  id v5 = a3;
  id v6 = +[NSXPCConnection currentConnection];
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v13 = [v6 NF_userInfo];
    [v13 objectForKeyedSubscript:@"ClientName"];
    uint64_t v14 = a2;
    id v16 = v15 = v5;
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v8(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1901, v16);

    id v5 = v15;
    a2 = v14;
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    id v21 = object_getClassName(self);
    int v22 = sel_getName(a2);
    int v23 = [v6 NF_userInfo];
    __int16 v24 = [v23 objectForKeyedSubscript:@"ClientName"];
    *(_DWORD *)buf = 67110146;
    int v32 = v20;
    __int16 v33 = 2082;
    id v34 = v21;
    __int16 v35 = 2082;
    SEL v36 = v22;
    __int16 v37 = 1024;
    int v38 = 1901;
    __int16 v39 = 2114;
    __int16 v40 = v24;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", buf, 0x2Cu);
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002D1B4;
  v27[3] = &unk_100058CA8;
  v27[4] = self;
  id v28 = v6;
  id v29 = v5;
  SEL v30 = a2;
  id v25 = v5;
  id v26 = v6;
  sub_10002258C(self, v27);
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v5 = a4;
  id v6 = _os_activity_create((void *)&_mh_execute_header, "connection:didReceivePublicToken:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v6, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  id v7 = v5;
  id v8 = v7;
  if (self)
  {
    if ([v7 length])
    {
      id v9 = +[NSUserDefaults standardUserDefaults];
      id v10 = v8;
      CC_SHA256([v10 bytes], (CC_LONG)[v10 length], md);
      id v11 = [objc_alloc((Class)NSData) initWithBytesNoCopy:md length:32 freeWhenDone:0];
      uint64_t v12 = [v9 dataForKey:@"APNTokenHash"];
      if (([v12 isEqualToData:v11] & 1) == 0)
      {
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t Logger = NFLogGetLogger();
        if (Logger)
        {
          uint64_t v14 = (void (*)(uint64_t, const char *, ...))Logger;
          Class = object_getClass(self);
          BOOL isMetaClass = class_isMetaClass(Class);
          ClassName = object_getClassName(self);
          Name = sel_getName("_checkForAPNTokenUpdate:");
          uint64_t v18 = 45;
          if (isMetaClass) {
            uint64_t v18 = 43;
          }
          v14(5, "%c[%{public}s %{public}s]:%i New APN token received", v18, ClassName, Name, 872);
        }
        dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
        uint64_t v19 = NFSharedLogGetLogger();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          int v20 = object_getClass(self);
          if (class_isMetaClass(v20)) {
            int v21 = 43;
          }
          else {
            int v21 = 45;
          }
          int v22 = object_getClassName(self);
          int v23 = sel_getName("_checkForAPNTokenUpdate:");
          *(_DWORD *)state = 67109890;
          *(_DWORD *)&state[4] = v21;
          *(_WORD *)&state[8] = 2082;
          *(void *)&state[10] = v22;
          __int16 v39 = 2082;
          __int16 v40 = v23;
          __int16 v41 = 1024;
          int v42 = 872;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i New APN token received", state, 0x22u);
        }

        [v9 setObject:v11 forKey:@"APNTokenHash"];
        __int16 v24 = sub_100037740();
        sub_10003B810(v24, v10);

        sub_10001A0A0((atomic_uchar *)self);
      }
    }
    else
    {
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      uint64_t v25 = NFLogGetLogger();
      if (v25)
      {
        id v26 = (void (*)(uint64_t, const char *, ...))v25;
        id v27 = object_getClass(self);
        BOOL v28 = class_isMetaClass(v27);
        id v29 = object_getClassName(self);
        SEL v36 = sel_getName("_checkForAPNTokenUpdate:");
        uint64_t v30 = 45;
        if (v28) {
          uint64_t v30 = 43;
        }
        v26(3, "%c[%{public}s %{public}s]:%i Inalid token", v30, v29, v36, 859);
      }
      dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
      id v9 = NFSharedLogGetLogger();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v31 = object_getClass(self);
        if (class_isMetaClass(v31)) {
          int v32 = 43;
        }
        else {
          int v32 = 45;
        }
        __int16 v33 = object_getClassName(self);
        id v34 = sel_getName("_checkForAPNTokenUpdate:");
        *(_DWORD *)state = 67109890;
        *(_DWORD *)&state[4] = v32;
        *(_WORD *)&state[8] = 2082;
        *(void *)&state[10] = v33;
        __int16 v39 = 2082;
        __int16 v40 = v34;
        __int16 v41 = 1024;
        int v42 = 859;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i Inalid token", state, 0x22u);
      }
    }
  }
  sub_10001C5D0(self);
}

- (void)connection:(id)a3 didReceiveMessageForTopic:(id)a4 userInfo:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = _os_activity_create((void *)&_mh_execute_header, "connection:didReceiveMessageForTopic:userInfo:", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  *(void *)state = 0;
  *(void *)&state[8] = 0;
  os_activity_scope_enter(v12, (os_activity_scope_state_t)state);
  os_activity_scope_leave((os_activity_scope_state_t)state);

  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    uint64_t v14 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    uint64_t v17 = 45;
    if (isMetaClass) {
      uint64_t v17 = 43;
    }
    v14(6, "%c[%{public}s %{public}s]:%i %{public}@", v17, ClassName, Name, 1988, v9);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t v18 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = object_getClass(self);
    if (class_isMetaClass(v19)) {
      int v20 = 43;
    }
    else {
      int v20 = 45;
    }
    int v21 = object_getClassName(self);
    int v22 = sel_getName(a2);
    *(_DWORD *)state = 67110146;
    *(_DWORD *)&state[4] = v20;
    *(_WORD *)&state[8] = 2082;
    *(void *)&state[10] = v21;
    __int16 v43 = 2082;
    __int16 v44 = v22;
    __int16 v45 = 1024;
    int v46 = 1988;
    __int16 v47 = 2114;
    id v48 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i %{public}@", state, 0x2Cu);
  }

  id v23 = objc_alloc_init((Class)NSDateFormatter);
  id v24 = [objc_alloc((Class)NSLocale) initWithLocaleIdentifier:@"en_US"];
  [v23 setLocale:v24];

  [v23 setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
  storage = self->_storage;
  v40[0] = @"APNClientConnected";
  unsigned int v26 = [v11 isConnected];
  id v27 = &off_10005B308;
  if (v26) {
    id v27 = &off_10005B2F0;
  }
  v41[0] = v27;
  v40[1] = @"APNTopicsRegistered";
  BOOL v28 = [v11 enabledTopics];

  v41[1] = v28;
  v40[2] = @"CheckIn";
  v39[0] = v9;
  v38[0] = @"Reason";
  v38[1] = @"PushRxData";
  id v29 = [objc_alloc((Class)NSDictionary) initWithDictionary:v10];

  v39[1] = v29;
  v38[2] = @"PushRxTime";
  uint64_t v30 = +[NSDate date];
  id v31 = [v23 stringFromDate:v30];
  v39[2] = v31;
  int v32 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:3];
  v41[2] = v32;
  __int16 v33 = +[NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:3];
  sub_10003B9D4(storage, v33, v9);

  id v37 = v9;
  id v34 = +[NSArray arrayWithObjects:&v37 count:1];
  sub_100021988((uint64_t)self, v34);

  +[NFGeneralStatisticsCALogger updateAnalyticsGeneralTransactionStatistics:&off_10005B3D8];
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  uint64_t Logger = NFLogGetLogger();
  if (Logger)
  {
    id v8 = (void (*)(uint64_t, const char *, ...))Logger;
    Class = object_getClass(self);
    BOOL isMetaClass = class_isMetaClass(Class);
    ClassName = object_getClassName(self);
    Name = sel_getName(a2);
    if (v4) {
      uint64_t v13 = "connected";
    }
    else {
      uint64_t v13 = "disconnected";
    }
    uint64_t v14 = 45;
    if (isMetaClass) {
      uint64_t v14 = 43;
    }
    v8(5, "%c[%{public}s %{public}s]:%i APS connection status - %s", v14, ClassName, Name, 2010, v13);
  }
  dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
  id v15 = NFSharedLogGetLogger();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = object_getClass(self);
    if (class_isMetaClass(v16)) {
      int v17 = 43;
    }
    else {
      int v17 = 45;
    }
    uint64_t v18 = object_getClassName(self);
    uint64_t v19 = sel_getName(a2);
    *(_DWORD *)buf = 67110146;
    if (v4) {
      int v20 = "connected";
    }
    else {
      int v20 = "disconnected";
    }
    int v22 = v17;
    __int16 v23 = 2082;
    id v24 = v18;
    __int16 v25 = 2082;
    unsigned int v26 = v19;
    __int16 v27 = 1024;
    int v28 = 2010;
    __int16 v29 = 2080;
    uint64_t v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i APS connection status - %s", buf, 0x2Cu);
  }
}

- (void)handleCardSessionToken:(id)a3
{
  id v4 = a3;
  id v5 = self->_callbackHandlers;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSMutableDictionary *)self->_callbackHandlers allValues];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) readerModeCardSessionToken:v4];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)handleCardIngestionStatus:(unint64_t)a3
{
  id v5 = self->_callbackHandlers;
  objc_sync_enter(v5);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = [(NSMutableDictionary *)self->_callbackHandlers allValues];
  id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) readerModeCardIngestionStatus:a3];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)handleAppletStateChange:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (v5)
  {
    CFStringRef v36 = @"appletChanged";
    id v37 = v5;
    id v7 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v10 = 43;
      }
      else {
        uint64_t v10 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i sending event to Wallet: %@", v10, ClassName, Name, 2049, v7);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    long long v13 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = object_getClass(self);
      if (class_isMetaClass(v14)) {
        int v15 = 43;
      }
      else {
        int v15 = 45;
      }
      *(_DWORD *)buf = 67110146;
      int v27 = v15;
      __int16 v28 = 2082;
      __int16 v29 = object_getClassName(self);
      __int16 v30 = 2082;
      id v31 = sel_getName(a2);
      __int16 v32 = 1024;
      int v33 = 2049;
      __int16 v34 = 2112;
      __int16 v35 = v7;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sending event to Wallet: %@", buf, 0x2Cu);
    }

    [(NFXPCEventPublisher *)self->_xpcEventPublisher sendXpcNotificationEventWithDictionary:v7];
    id v16 = self->_callbackHandlers;
    objc_sync_enter(v16);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    int v17 = [(NSMutableDictionary *)self->_callbackHandlers allValues];
    id v18 = [v17 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v22;
      do
      {
        int v20 = 0;
        do
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v17);
          }
          [*(id *)(*((void *)&v21 + 1) + 8 * (void)v20) appletStateChange:v6];
          int v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        id v18 = [v17 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v18);
    }

    objc_sync_exit(v16);
  }
}

- (void)handleAppletsDeleted:(id)a3
{
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = objc_opt_new();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v31 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v32;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v32 != v9) {
            objc_enumerationMutation(v7);
          }
          [v6 setObject:&off_10005B400 forKey:*(void *)(*((void *)&v31 + 1) + 8 * (void)v10)];
          uint64_t v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v7 countByEnumeratingWithState:&v31 objects:v48 count:16];
      }
      while (v8);
    }

    CFStringRef v46 = @"appletsDeleted";
    __int16 v47 = v6;
    long long v11 = +[NSDictionary dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    uint64_t Logger = (void (*)(uint64_t, const char *, ...))NFLogGetLogger();
    if (Logger)
    {
      Class = object_getClass(self);
      if (class_isMetaClass(Class)) {
        uint64_t v14 = 43;
      }
      else {
        uint64_t v14 = 45;
      }
      ClassName = object_getClassName(self);
      Name = sel_getName(a2);
      Logger(6, "%c[%{public}s %{public}s]:%i sending event to Wallet: %@", v14, ClassName, Name, 2068, v11);
    }
    dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    int v17 = NFSharedLogGetLogger();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = object_getClass(self);
      if (class_isMetaClass(v18)) {
        int v19 = 43;
      }
      else {
        int v19 = 45;
      }
      int v20 = object_getClassName(self);
      long long v21 = sel_getName(a2);
      *(_DWORD *)buf = 67110146;
      int v37 = v19;
      __int16 v38 = 2082;
      __int16 v39 = v20;
      __int16 v40 = 2082;
      __int16 v41 = v21;
      __int16 v42 = 1024;
      int v43 = 2068;
      __int16 v44 = 2112;
      __int16 v45 = v11;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%c[%{public}s %{public}s]:%i sending event to Wallet: %@", buf, 0x2Cu);
    }

    [(NFXPCEventPublisher *)self->_xpcEventPublisher sendXpcNotificationEventWithDictionary:v11];
    long long v22 = self->_callbackHandlers;
    objc_sync_enter(v22);
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v23 = [(NSMutableDictionary *)self->_callbackHandlers allValues];
    id v24 = [v23 countByEnumeratingWithState:&v27 objects:v35 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v28;
      do
      {
        unsigned int v26 = 0;
        do
        {
          if (*(void *)v28 != v25) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v27 + 1) + 8 * (void)v26) appletsDeleted:v7];
          unsigned int v26 = (char *)v26 + 1;
        }
        while (v24 != v26);
        id v24 = [v23 countByEnumeratingWithState:&v27 objects:v35 count:16];
      }
      while (v24);
    }

    objc_sync_exit(v22);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcEventPublisher, 0);
  objc_storeStrong((id *)&self->_otherMonitor, 0);
  objc_storeStrong((id *)&self->_wiredMonitor, 0);
  objc_storeStrong((id *)&self->_cellularMonitor, 0);
  objc_storeStrong((id *)&self->_wifiMonitor, 0);
  objc_storeStrong((id *)&self->_waitForNFCDTransaction, 0);
  objc_storeStrong((id *)&self->_delayedXPCRequests, 0);
  objc_storeStrong((id *)&self->_keepAliveTransactionLock, 0);
  objc_storeStrong((id *)&self->_keepAliveTransaction, 0);
  objc_storeStrong((id *)&self->_sessionQueue, 0);
  objc_storeStrong((id *)&self->_activeSession, 0);
  objc_storeStrong((id *)&self->_activeServerState, 0);
  objc_storeStrong((id *)&self->_apsInitQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnectionQueue, 0);
  objc_storeStrong((id *)&self->_apsInitTimer, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
  objc_storeStrong((id *)&self->_powerObserver, 0);
  objc_storeStrong((id *)&self->_NFRemoteAdminManagerService, 0);
  objc_storeStrong((id *)&self->_storage, 0);

  objc_storeStrong((id *)&self->_callbackHandlers, 0);
}

@end