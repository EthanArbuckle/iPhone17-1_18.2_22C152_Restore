@interface RPDaemon
+ (id)sharedDaemon;
- (BOOL)diagnosticCommand:(id)a3 params:(id)a4;
- (BOOL)languageChangePending;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)sigTermPending;
- (OS_dispatch_queue)dispatchQueue;
- (RPDaemon)init;
- (id)descriptionWithLevel:(int)a3;
- (id)keychainStateString;
- (unint64_t)errorFlags;
- (void)_metricsSubmissionSetup;
- (void)_prefsChanged;
- (void)_updateErrorFlags;
- (void)_xpcPublisherAction:(unsigned int)a3 token:(unint64_t)a4 event:(id)a5;
- (void)_xpcPublisherAddToken:(unint64_t)a3 event:(id)a4;
- (void)_xpcPublisherRemoveToken:(unint64_t)a3;
- (void)_xpcPublisherStateChangedForToken:(unint64_t)a3 state:(BOOL)a4;
- (void)_xpcPublisherTriggeredReply:(id)a3 token:(unint64_t)a4 responseHandler:(id)a5;
- (void)_xpcPublisherTriggeredToken:(unint64_t)a3 payload:(id)a4 responseHandler:(id)a5;
- (void)activate;
- (void)invalidate;
- (void)postDaemonInfoChanges:(unint64_t)a3;
- (void)setDispatchQueue:(id)a3;
@end

@implementation RPDaemon

+ (id)sharedDaemon
{
  if (qword_100142C98 != -1) {
    dispatch_once(&qword_100142C98, &stru_1001229C0);
  }
  v2 = (void *)qword_100142C90;

  return v2;
}

- (RPDaemon)init
{
  v28.receiver = self;
  v28.super_class = (Class)RPDaemon;
  v2 = [(RPDaemon *)&v28 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v3->_languageChangedNotifier = -1;
    v4 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    subDaemons = v3->_subDaemons;
    v3->_subDaemons = v4;

    v6 = v3->_subDaemons;
    v7 = +[RPIdentityDaemon sharedIdentityDaemon];
    [(NSMutableArray *)v6 addObject:v7];

    v8 = v3->_subDaemons;
    v9 = +[RPCompanionLinkDaemon sharedCompanionLinkDaemon];
    [(NSMutableArray *)v8 addObject:v9];

    v10 = v3->_subDaemons;
    v11 = +[RPCloudDaemon sharedCloudDaemon];
    [(NSMutableArray *)v10 addObject:v11];

    v12 = v3->_subDaemons;
    v13 = +[RPNearFieldDaemon sharedNearFieldDaemon];
    [(NSMutableArray *)v12 addObject:v13];

    v14 = v3->_subDaemons;
    v15 = +[RPNearbyInvitationDaemon sharedInvitationDaemon];
    [(NSMutableArray *)v14 addObject:v15];

    v16 = v3->_subDaemons;
    v17 = +[RPPeopleDaemon sharedPeopleDaemon];
    [(NSMutableArray *)v16 addObject:v17];

    v18 = v3->_subDaemons;
    v19 = objc_alloc_init(RPRemoteDisplayDaemon);
    [(NSMutableArray *)v18 addObject:v19];

    v20 = v3->_subDaemons;
    v21 = +[RPPrivateDaemon sharedPrivateDaemon];
    [(NSMutableArray *)v20 addObject:v21];

    v22 = v3->_subDaemons;
    v23 = +[RPNWNetworkAgent sharedNetworkAgent];
    [(NSMutableArray *)v22 addObject:v23];

    v24 = v3->_subDaemons;
    v25 = +[RPStatusDaemon sharedStatusDaemon];
    [(NSMutableArray *)v24 addObject:v25];

    [(RPDaemon *)v3 _metricsSubmissionSetup];
    v26 = v3;
  }

  return v3;
}

- (void)_metricsSubmissionSetup
{
  v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);

  v4 = (OS_dispatch_queue *)dispatch_queue_create("RPMetricsSubmission", attr);
  metricsReportQueue = self->_metricsReportQueue;
  self->_metricsReportQueue = v4;

  v6 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_metricsReportQueue);
  metricsReportTimer = self->_metricsReportTimer;
  self->_metricsReportTimer = v6;

  dispatch_source_set_event_handler((dispatch_source_t)self->_metricsReportTimer, &stru_1001229E0);
  CUDispatchTimerSet();
  dispatch_resume((dispatch_object_t)self->_metricsReportTimer);
}

- (id)descriptionWithLevel:(int)a3
{
  unsigned int v4 = a3;
  BOOL v59 = sub_10000EACC();
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  v58 = self;
  v5 = self->_subDaemons;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v92 objects:v100 count:16];
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    uint64_t v9 = *(void *)v93;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v93 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v91 = v8;
          v50 = CUDescriptionWithLevel();
          NSAppendPrintF();
          id v11 = v8;

          v8 = v11;
        }
      }
      v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v92 objects:v100 count:16];
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  uint64_t v12 = +[RPMetrics sharedMetricsNoCreate];
  v57 = (void *)v12;
  if (v4 <= 0x13 && v12)
  {
    v90 = v8;
    v50 = CUDescriptionWithLevel();
    NSAppendPrintF();
    id v13 = v8;

    v8 = v13;
  }
  v89 = v8;
  id v51 = [(NSMutableSet *)self->_xpcConnections count];
  NSAppendPrintF();
  id v14 = v8;

  long long v87 = 0u;
  long long v88 = 0u;
  long long v85 = 0u;
  long long v86 = 0u;
  obj = self->_xpcConnections;
  id v62 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v85, v99, 16, v51);
  if (v62)
  {
    uint64_t v61 = *(void *)v86;
    do
    {
      for (j = 0; j != v62; j = (char *)j + 1)
      {
        if (*(void *)v86 != v61) {
          objc_enumerationMutation(obj);
        }
        v16 = *(void **)(*((void *)&v85 + 1) + 8 * (void)j);
        id v84 = v14;
        v17 = [v16 xpcCnx];
        id v53 = [v17 processIdentifier];
        NSAppendPrintF();
        id v18 = v84;

        v19 = [v16 assertions:v53];
        if ([v19 count])
        {
          id v83 = v18;
          NSAppendPrintF();
          id v20 = v83;

          long long v81 = 0u;
          long long v82 = 0u;
          long long v79 = 0u;
          long long v80 = 0u;
          id v63 = v19;
          id v21 = v19;
          id v22 = [v21 countByEnumeratingWithState:&v79 objects:v98 count:16];
          if (v22)
          {
            id v23 = v22;
            uint64_t v24 = *(void *)v80;
            v25 = "";
            do
            {
              v26 = 0;
              v27 = v20;
              do
              {
                if (*(void *)v80 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v28 = *(void *)(*((void *)&v79 + 1) + 8 * (void)v26);
                v78 = v27;
                v54 = v25;
                uint64_t v56 = v28;
                NSAppendPrintF();
                id v20 = v27;

                v26 = (char *)v26 + 1;
                v25 = " ";
                v27 = v20;
              }
              while (v23 != v26);
              id v23 = [v21 countByEnumeratingWithState:&v79 objects:v98 count:16];
              v25 = " ";
            }
            while (v23);
          }

          id v77 = v20;
          NSAppendPrintF();
          id v18 = v20;

          v19 = v63;
        }
        id v76 = v18;
        NSAppendPrintF();
        id v14 = v18;
      }
      id v62 = [(NSMutableSet *)obj countByEnumeratingWithState:&v85 objects:v99 count:16];
    }
    while (v62);
  }

  unint64_t errorFlags = v58->_errorFlags;
  if (errorFlags)
  {
    id v75 = v14;
    unint64_t v52 = errorFlags;
    v55 = &unk_10011A270;
    NSAppendPrintF();
    id v30 = v14;

    id v14 = v30;
  }
  id v31 = objc_alloc((Class)NSSet);
  v32 = (void *)CFPrefs_CopyKeys();
  id v33 = [v31 initWithArray:v32];

  id v34 = [objc_alloc((Class)NSMutableSet) initWithSet:v33];
  v97[0] = @"btPipeEnabled";
  v97[1] = @"cloudDiscovery";
  v97[2] = @"clBLEClient";
  v97[3] = @"clMeDeviceIsMeOverride";
  v97[4] = @"clClientEnabled";
  v97[5] = @"clHomeKit";
  v97[6] = @"clMaxConnectionCount";
  v97[7] = @"clServerBonjourAlways";
  v97[8] = @"clServerEnabled";
  v97[9] = @"familySyncedName";
  v97[10] = @"ftCompress";
  v97[11] = @"ftLargeFileBufferBytes";
  v97[12] = @"ftLargeFileMaxOutstanding";
  v97[13] = @"ftLargeFileMaxTasks";
  v97[14] = @"ftSmallFilesMaxBytes";
  v97[15] = @"ftSmallFilesMaxTasks";
  v97[16] = @"frPruneAccountSecs";
  v97[17] = @"frPruneLastSecs";
  v97[18] = @"frRefreshMax";
  v97[19] = @"frRefreshMin";
  v97[20] = @"frMaxReachedLastSecs";
  v97[21] = @"frSuggestMax";
  v97[22] = @"frSuggestPollSecs";
  v97[23] = @"frSyncDelaySecs";
  v97[24] = @"hasAppleTVForce";
  v97[25] = @"hasHomePodForce";
  v97[26] = @"hasMacForce";
  v97[27] = @"hidEnabled";
  v97[28] = @"idFamilyResolve";
  v97[29] = @"idFriendResolve";
  v97[30] = @"idOwnerResolve";
  v97[31] = @"idPairedResolve";
  v97[32] = @"idSharedHomeResolve";
  v97[33] = @"idsEnabled";
  v97[34] = @"ignoreCompanionLinkChecks";
  v97[35] = @"ignoreRemoteDisplayChecks";
  v97[36] = @"ipEnabled";
  v97[37] = @"isSignedInForce";
  v97[38] = @"liveAudioEnabled";
  v97[39] = @"mcEnabled";
  v97[40] = @"metricsEnabled";
  v97[41] = @"applyNoiWiFiToUSB";
  v97[42] = @"pdFamily";
  v97[43] = @"pdFriends";
  v97[44] = @"pdFriendSyncStart";
  v97[45] = @"pdPrivacyCoalesceMin";
  v97[46] = @"pdPrivacyCoalesceMax";
  v97[47] = @"pdPTSBurstActionScanSecs";
  v97[48] = @"pdPTSBurstInfoScanSecs";
  v97[49] = @"pdRanging";
  v97[50] = @"pdStrangers";
  v97[51] = @"pdTrackWhileAsleep";
  v97[52] = @"rdBLEClient";
  v97[53] = @"rdBLEServer";
  v97[54] = @"rdClientEnabled";
  v97[55] = @"rdHomeKit";
  v97[56] = @"rdNoInfra";
  v97[57] = @"rdServerBonjourInfra";
  v97[58] = @"rdServerEnabled";
  v97[59] = @"siriEnabled";
  v97[60] = @"textInputEnabled";
  v97[61] = @"touchEnabled";
  v97[62] = @"uiNotes";
  v97[63] = @"useTargetAuthTag";
  v97[64] = @"xpcMatchingTestMode";
  v97[65] = @"nearFieldSeverDiscoveryEnabled";
  v97[66] = @"sendActivityLevelOverInfra";
  v97[67] = @"oneTimeDateRequestedResetCompleted";
  v35 = +[NSArray arrayWithObjects:v97 count:68];
  [v34 addObjectsFromArray:v35];

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v64 = v34;
  id v36 = [v64 countByEnumeratingWithState:&v71 objects:v96 count:16];
  if (v36)
  {
    id v37 = v36;
    int v38 = 0;
    uint64_t v39 = *(void *)v72;
    do
    {
      for (k = 0; k != v37; k = (char *)k + 1)
      {
        if (*(void *)v72 != v39) {
          objc_enumerationMutation(v64);
        }
        unint64_t v41 = *(void *)(*((void *)&v71 + 1) + 8 * (void)k);
        unsigned __int8 v42 = [v33 containsObject:v41, v52, v55];
        if (!v38)
        {
          id v70 = v14;
          NSAppendPrintF();
          id v43 = v70;

          id v14 = v43;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          int v69 = 0;
          uint64_t v44 = CFPrefs_CopyTypedValue();
          v45 = (void *)v44;
          if (v42)
          {
            if (v59)
            {
              id v66 = v14;
              unint64_t v52 = v41;
              v55 = (void *)v44;
              v46 = &v66;
            }
            else
            {
              id v65 = v14;
              unint64_t v52 = v41;
              v55 = (void *)v44;
              v46 = &v65;
            }
            goto LABEL_49;
          }
          if (v69 != -6727)
          {
            if (v59)
            {
              id v68 = v14;
              unint64_t v52 = v41;
              v55 = (void *)v44;
              v46 = &v68;
            }
            else
            {
              id v67 = v14;
              unint64_t v52 = v41;
              v55 = (void *)v44;
              v46 = &v67;
            }
LABEL_49:
            NSAppendPrintF();
            id v47 = *v46;

            id v14 = v47;
          }
          ++v38;

          continue;
        }
      }
      id v37 = [v64 countByEnumeratingWithState:&v71 objects:v96 count:16];
    }
    while (v37);
  }

  id v48 = v14;
  return v48;
}

- (void)activate
{
  if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t Int64 = CFPrefs_GetInt64();
  BOOL v4 = Int64 != 0;
  if (self->_prefXPCMatchingTestMode != v4)
  {
    if (dword_100141340 <= 40)
    {
      uint64_t v5 = Int64;
      if (dword_100141340 != -1 || _LogCategory_Initialize())
      {
        v6 = "yes";
        if (v5) {
          v7 = "no";
        }
        else {
          v7 = "yes";
        }
        if (!v5) {
          v6 = "no";
        }
        v27 = v7;
        uint64_t v28 = v6;
        LogPrintF();
      }
    }
    self->_prefXPCMatchingTestMode = v4;
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v8 = self->_subDaemons;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v38;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v37 + 1) + 8 * i);
        [v13 setDispatchQueue:self->_dispatchQueue v27, v28];
        [v13 activate];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v37 objects:v41 count:16];
    }
    while (v10);
  }

  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004C3E0;
  block[3] = &unk_100121158;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
  if (self->_languageChangedNotifier == -1)
  {
    v15 = self->_dispatchQueue;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10004C3E8;
    handler[3] = &unk_100121630;
    handler[4] = self;
    notify_register_dispatch("com.apple.language.changed", &self->_languageChangedNotifier, v15, handler);
  }
  if (!self->_sigTermSource)
  {
    v16 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)self->_dispatchQueue);
    sigTermSource = self->_sigTermSource;
    self->_sigTermSource = v16;

    id v18 = self->_sigTermSource;
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_10004C490;
    v34[3] = &unk_100121158;
    v34[4] = self;
    dispatch_source_set_event_handler(v18, v34);
    dispatch_resume((dispatch_object_t)self->_sigTermSource);
  }
  if (!self->_systemMonitor)
  {
    v19 = (CUSystemMonitor *)objc_alloc_init((Class)CUSystemMonitor);
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = v19;

    [(CUSystemMonitor *)self->_systemMonitor setDispatchQueue:self->_dispatchQueue];
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10004C50C;
    v33[3] = &unk_100121158;
    v33[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setManateeChangedHandler:v33];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10004C590;
    v32[3] = &unk_100121158;
    v32[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setPrimaryAppleIDChangedHandler:v32];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10004C614;
    v31[3] = &unk_100121158;
    v31[4] = self;
    [(CUSystemMonitor *)self->_systemMonitor setWifiStateChangedHandler:v31];
    id v21 = self->_systemMonitor;
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10004C698;
    v30[3] = &unk_100121158;
    v30[4] = self;
    [(CUSystemMonitor *)v21 activateWithCompletion:v30];
  }
  if (!self->_xpcEventsRegistered)
  {
    id v22 = self->_dispatchQueue;
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_10004C6A0;
    v29[3] = &unk_100122A08;
    v29[4] = self;
    xpc_set_event_stream_handler("com.apple.notifyd.matching", v22, v29);
    self->_xpcEventsRegistered = 1;
  }
  if (!self->_xpcListener)
  {
    id v23 = (NSXPCListener *)[objc_alloc((Class)NSXPCListener) initWithMachServiceName:@"com.apple.rapport"];
    xpcListener = self->_xpcListener;
    self->_xpcListener = v23;

    [(NSXPCListener *)self->_xpcListener setDelegate:self];
    [(NSXPCListener *)self->_xpcListener _setQueue:self->_dispatchQueue];
    [(NSXPCListener *)self->_xpcListener resume];
  }
  if (!self->_xpcPublisher)
  {
    xpc_event_publisher_create();
    v25 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue();
    xpcPublisher = self->_xpcPublisher;
    self->_xpcPublisher = v25;

    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();
  }
  if (!self->_stateHandleGeneral) {
    self->_stateHandleGeneral = os_state_add_handler();
  }
  if (!self->_stateHandleIdentities) {
    self->_stateHandleIdentities = os_state_add_handler();
  }
  if (!self->_stateHandleKeychain) {
    self->_stateHandleKeychain = os_state_add_handler();
  }
  if (!self->_stateHandlePrivateDiscovery) {
    self->_stateHandlePrivateDiscovery = os_state_add_handler();
  }
}

- (void)invalidate
{
  if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v3 = self->_subDaemons;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) invalidate];
      }
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_subDaemons removeAllObjects];
  xpcPublisher = self->_xpcPublisher;
  self->_xpcPublisher = 0;

  if (self->_stateHandleGeneral)
  {
    os_state_remove_handler();
    self->_stateHandleGeneral = 0;
  }
  if (self->_stateHandleIdentities)
  {
    os_state_remove_handler();
    self->_stateHandleIdentities = 0;
  }
  if (self->_stateHandleKeychain)
  {
    os_state_remove_handler();
    self->_stateHandleKeychain = 0;
  }
  if (self->_stateHandlePrivateDiscovery)
  {
    os_state_remove_handler();
    self->_stateHandlePrivateDiscovery = 0;
  }
  int languageChangedNotifier = self->_languageChangedNotifier;
  if (languageChangedNotifier != -1)
  {
    notify_cancel(languageChangedNotifier);
    self->_int languageChangedNotifier = -1;
  }
  sigTermSource = self->_sigTermSource;
  if (sigTermSource)
  {
    uint64_t v11 = sigTermSource;
    dispatch_source_cancel(v11);
    uint64_t v12 = self->_sigTermSource;
    self->_sigTermSource = 0;
  }
  [(CUSystemMonitor *)self->_systemMonitor invalidate];
  systemMonitor = self->_systemMonitor;
  self->_systemMonitor = 0;

  [(NSXPCListener *)self->_xpcListener invalidate];
  xpcListener = self->_xpcListener;
  self->_xpcListener = 0;

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v15 = self->_xpcConnections;
  id v16 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    id v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (j = 0; j != v17; j = (char *)j + 1)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        id v20 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) xpcCnx:v22];
        [v20 invalidate];
      }
      id v17 = [(NSMutableSet *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v17);
  }

  [(NSMutableSet *)self->_xpcConnections removeAllObjects];
  xpcConnections = self->_xpcConnections;
  self->_xpcConnections = 0;

  if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (BOOL)diagnosticCommand:(id)a3 params:(id)a4
{
  id v6 = a4;
  dispatchQueue = self->_dispatchQueue;
  id v8 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  unsigned int v9 = [v8 isEqual:@"errorFlags"];

  if (v9)
  {
    self->_unint64_t errorFlagsForceSet = CFDictionaryGetInt64();
    unint64_t Int64 = CFDictionaryGetInt64();
    self->_errorFlagsForceClear = Int64;
    if (dword_100141340 <= 30)
    {
      if (dword_100141340 != -1)
      {
LABEL_4:
        unint64_t v16 = Int64;
        unint64_t errorFlagsForceSet = self->_errorFlagsForceSet;
        LogPrintF();
        [(RPDaemon *)self _updateErrorFlags];
        goto LABEL_7;
      }
      if (_LogCategory_Initialize())
      {
        unint64_t Int64 = self->_errorFlagsForceClear;
        goto LABEL_4;
      }
    }
    [(RPDaemon *)self _updateErrorFlags];
  }
LABEL_7:

  return v9;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v6 = [[RPDaemonXPCConnection alloc] initWithDaemon:self xpcConnection:v5];
  [(RPDaemonXPCConnection *)v6 setDispatchQueue:self->_dispatchQueue];
  xpcConnections = self->_xpcConnections;
  if (!xpcConnections)
  {
    id v8 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    unsigned int v9 = self->_xpcConnections;
    self->_xpcConnections = v8;

    xpcConnections = self->_xpcConnections;
  }
  [(NSMutableSet *)xpcConnections addObject:v6];
  [v5 _setQueue:self->_dispatchQueue];
  id v10 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPDaemonXPCServerInterface];
  [v5 setExportedInterface:v10];

  [v5 setExportedObject:v6];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10004CF64;
  v13[3] = &unk_1001219D0;
  v13[4] = self;
  v13[5] = v6;
  [v5 setInvalidationHandler:v13];
  uint64_t v11 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL___RPDaemonXPCClientInterface];
  [v5 setRemoteObjectInterface:v11];

  [v5 resume];
  if (dword_100141340 <= 20 && (dword_100141340 != -1 || _LogCategory_Initialize()))
  {
    [v5 processIdentifier];
    LogPrintF();
  }

  return 1;
}

- (id)keychainStateString
{
  id v2 = objc_alloc_init((Class)NSMutableString);
  id v3 = objc_alloc_init((Class)CUKeychainItem);
  [v3 setAccessGroup:@"com.apple.rapport"];
  [v3 setSyncType:3];
  id v4 = objc_alloc_init((Class)CUKeychainManager);
  id v22 = 0;
  id v5 = [v4 copyItemsMatchingItem:v3 flags:0 error:&v22];
  id v6 = v22;
  id v21 = v2;
  id v16 = [v5 count];
  NSAppendPrintF();
  id v7 = v2;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v5;
  unsigned int v9 = (char *)[v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = CUDescriptionWithLevel();
        [v7 appendString:v13];

        [v7 appendString:@"\n"];
        ++v12;
      }
      while (v10 != v12);
      id v10 = (char *)[v8 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v10);
  }

  id v14 = v7;
  return v14;
}

- (void)postDaemonInfoChanges:(unint64_t)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10004D210;
  v4[3] = &unk_100122AE0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(dispatchQueue, v4);
}

- (void)_prefsChanged
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = self->_subDaemons;
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) prefsChanged:v8];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_updateErrorFlags
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if ([(CUSystemMonitor *)self->_systemMonitor manateeAvailable]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = 256;
  }
  if (![(CUSystemMonitor *)self->_systemMonitor primaryAppleIDIsHSA2]) {
    v3 |= 0x20uLL;
  }
  uint64_t v4 = v3 | (4 * [(CUSystemMonitor *)self->_systemMonitor wifiFlags]) & 0x80;
  unsigned int v5 = [(CUSystemMonitor *)self->_systemMonitor wifiState];
  uint64_t v6 = v4 | 4;
  if (v5 != 10) {
    uint64_t v6 = v4;
  }
  unint64_t v7 = (v6 | self->_errorFlagsForceSet) & ~self->_errorFlagsForceClear;
  unint64_t errorFlags = self->_errorFlags;
  if (v7 != errorFlags)
  {
    self->_unint64_t errorFlags = v7;
    if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v11 = v7;
      uint64_t v12 = &unk_10011A270;
      unint64_t v9 = errorFlags;
      long long v10 = &unk_10011A270;
      LogPrintF();
    }
    id v13 = +[RPDaemon sharedDaemon];
    [v13 postDaemonInfoChanges:32];
  }
}

- (void)_xpcPublisherAction:(unsigned int)a3 token:(unint64_t)a4 event:(id)a5
{
  id v8 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (a3 != 2)
  {
    if (a3 == 1)
    {
      [(RPDaemon *)self _xpcPublisherRemoveToken:a4];
    }
    else if (a3)
    {
      if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    else
    {
      [(RPDaemon *)self _xpcPublisherAddToken:a4 event:v8];
    }
  }
}

- (void)_xpcPublisherAddToken:(unint64_t)a3 event:(id)a4
{
  uint64_t v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize()))
      {
        unint64_t v13 = a3;
        id v14 = v6;
        LogPrintF();
      }
      if (!self->_prefXPCMatchingTestMode && CFDictionaryGetInt64())
      {
        if (dword_100141340 > 30 || dword_100141340 == -1 && !_LogCategory_Initialize()) {
          goto LABEL_37;
        }
LABEL_11:
        LogPrintF();
        goto LABEL_37;
      }
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      unint64_t v7 = self->_subDaemons;
      id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v17;
        while (2)
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v17 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
            v15[0] = _NSConcreteStackBlock;
            v15[1] = 3221225472;
            v15[2] = sub_10004D9E0;
            v15[3] = &unk_100122B08;
            v15[4] = self;
            v15[5] = a3;
            if (objc_msgSend(v12, "addXPCMatchingToken:event:handler:", a3, v6, v15, v13, v14))
            {

              goto LABEL_37;
            }
          }
          id v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }

      if (dword_100141340 <= 60 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
        goto LABEL_11;
      }
    }
    else if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_11;
    }
  }
  else if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_11;
  }
LABEL_37:
}

- (void)_xpcPublisherRemoveToken:(unint64_t)a3
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = self->_subDaemons;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if ([*(id *)(*((void *)&v9 + 1) + 8 * i) removeXPCMatchingToken:a3])
        {

          return;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
}

- (void)_xpcPublisherTriggeredToken:(unint64_t)a3 payload:(id)a4 responseHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  long long v9 = (void (**)(id, void, void *))objc_retainBlock(v8);
  long long v10 = self->_xpcPublisher;
  if (v10)
  {
    if (v7)
    {
      long long v11 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v11)
      {
        if (v9)
        {
LABEL_5:
          id v14 = v8;
          int v12 = xpc_event_publisher_fire_with_reply();

          goto LABEL_18;
        }
LABEL_17:
        int v12 = xpc_event_publisher_fire();
LABEL_18:
        if (v12)
        {
          if (dword_100141340 > 90 || dword_100141340 == -1 && !_LogCategory_Initialize()) {
            goto LABEL_28;
          }
        }
        else if (dword_100141340 > 30 || dword_100141340 == -1 && !_LogCategory_Initialize())
        {
          goto LABEL_28;
        }
        LogPrintF();
LABEL_28:

        goto LABEL_29;
      }
      if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
    }
    long long v11 = 0;
    if (v9) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
  if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v9)
  {
    unint64_t v13 = RPErrorF();
    v9[2](v9, 0, v13);
  }
LABEL_29:
}

- (void)_xpcPublisherTriggeredReply:(id)a3 token:(unint64_t)a4 responseHandler:(id)a5
{
  id v7 = a3;
  uint64_t v18 = 0;
  long long v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10004E1D4;
  id v22 = sub_10004E1E4;
  id v23 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004E1EC;
  v14[3] = &unk_100122B58;
  long long v16 = &v18;
  unint64_t v17 = a4;
  id v8 = a5;
  id v15 = v8;
  long long v9 = objc_retainBlock(v14);
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_dictionary_get_string(v7, _xpc_error_key_description);
    uint64_t v11 = RPErrorF();
    long long v10 = (void *)v19[5];
    v19[5] = v11;
  }
  else
  {
    long long v10 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      (*((void (**)(id, void *, void))v8 + 2))(v8, v10, 0);
    }
    else
    {
      uint64_t v12 = RPErrorF();
      unint64_t v13 = (void *)v19[5];
      v19[5] = v12;
    }
  }

  ((void (*)(void *))v9[2])(v9);
  _Block_object_dispose(&v18, 8);
}

- (void)_xpcPublisherStateChangedForToken:(unint64_t)a3 state:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = self->_xpcPublisher;
  if (!v5)
  {
    if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
      goto LABEL_21;
    }
    goto LABEL_28;
  }
  if (xpc_event_publisher_set_subscriber_keepalive())
  {
    if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
LABEL_11:
    }
      LogPrintF();
  }
  else if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_11;
  }
  if (!v4) {
    goto LABEL_28;
  }
  if (xpc_event_publisher_fire())
  {
    if (dword_100141340 <= 90 && (dword_100141340 != -1 || _LogCategory_Initialize())) {
LABEL_21:
    }
      LogPrintF();
  }
  else if (dword_100141340 <= 30 && (dword_100141340 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_21;
  }
LABEL_28:
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (unint64_t)errorFlags
{
  return self->_errorFlags;
}

- (BOOL)languageChangePending
{
  return self->_languageChangePending;
}

- (BOOL)sigTermPending
{
  return self->_sigTermPending;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_metricsReportQueue, 0);
  objc_storeStrong((id *)&self->_metricsReportTimer, 0);
  objc_storeStrong((id *)&self->_xpcPublisher, 0);
  objc_storeStrong((id *)&self->_xpcListener, 0);
  objc_storeStrong((id *)&self->_xpcConnections, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_subDaemons, 0);
  objc_storeStrong((id *)&self->_sigTermSource, 0);

  objc_storeStrong((id *)&self->_assertions, 0);
}

@end