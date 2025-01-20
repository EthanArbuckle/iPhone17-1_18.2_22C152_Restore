@interface STReactor
- (OS_dispatch_queue)reactorQueue;
- (OS_dispatch_queue)transportQueue;
- (STAskForTimeEventRelay)askForTimeEventRelay;
- (STAskForTimeResponseHandler)askForTimeResponseHandler;
- (STAskService)askService;
- (STBiomeEventWriter)biomeEventWriter;
- (STCommunicationService)communicationService;
- (STConfigurationStoreChangeObserver)configurationStore;
- (STCoreDataFamilyInformationReverseTransformer)familyInformationTransformer;
- (STDeviceInformationPrimitives)deviceInformationPrimitives;
- (STDeviceStateChangeObserver)deviceStateStore;
- (STDowntimeService)downtimeService;
- (STEyeReliefStateWriter)eyeReliefStateWriter;
- (STFamilyMemberGenesisStateReader)genesisStateStore;
- (STFamilyProviding)familyInformationProvider;
- (STIDSMessageTransport)_messageTransport;
- (STIDSTransportPrimitives)idsTransportPrimitives;
- (STPrimitiveBackgroundActivityScheduler)backgroundActivityScheduler;
- (STPrimitiveOSTransactionProvider)primitiveOSTransactionProvider;
- (STReactor)initWithFamilyCirclePrimitives:(id)a3 deviceInformationPrimitives:(id)a4 idsTransportPrimitives:(id)a5 filesystemPrimitives:(id)a6 contactStorePrimitives:(id)a7 xpcServiceProvider:(id)a8 primitiveOSTransactionProvider:(id)a9 primitiveBackgroundActivitySchedulerProvider:(id)a10 coreDataObserver:(id)a11 coreDataConfigurationTransformer:(id)a12 coreDataDeviceStateTransformer:(id)a13 coreDataFamilyInformationTransformer:(id)a14 askForTimeEventRelay:(id)a15 askForTimeResponseHandler:(id)a16 biomeEventWriter:(id)a17 eyeReliefStateWriter:(id)a18 userSafetyPolicyWriter:(id)a19 messageAddressMapDirectoryURL:(id)a20 messageIdentifierMapDirectoryURL:(id)a21 messageLedgerDirectoryURL:(id)a22 genesisStateStoreDirectoryURL:(id)a23 reactorQueue:(id)a24 transportQueue:(id)a25 shutdownWillBegin:(id)a26 shutdownDidComplete:(id)a27;
- (STReactorDirectiveProcessor)directiveProcessor;
- (STReactorToolService)reactorToolService;
- (STSetupService)setupService;
- (STTransportEnvoy)transportEnvoy;
- (STUserSafetyPolicyWriter)userSafetyPolicyWriter;
- (STXPCServiceProvider)xpcServiceProvider;
- (id)_persistTargetableFamilyMembers:(id)a3;
- (id)purgeKeyValueStores;
- (id)shutdownDidComplete;
- (id)shutdownWillBegin;
- (void)_networkDidBecomeReachable:(id)a3;
- (void)_scheduleDonateDowntimeBiomeEventBackgroundActivity;
- (void)_scheduleFailStuckMessagesBackgroundActivity;
- (void)_scheduleMessageRetryBackgroundActivity;
- (void)_scheduleStoreCleanupBackgroundActivity;
- (void)_synchronizeGenesisStateStoreWithTargetableFamilyMembers:(id)a3;
- (void)applyUpdatedConfiguration:(id)a3 completionHandler:(id)a4;
- (void)authenticatePasscodeForUserWithEndpoint:(id)a3 completionHandler:(id)a4;
- (void)beginBackgroundActivity:(id)a3;
- (void)changeObserver:(id)a3 didObserveConfigurationChange:(id)a4;
- (void)changeObserver:(id)a3 didObserveDeviceStateChange:(id)a4;
- (void)currentCommunicationConfigurationWithCompletionHandler:(id)a3;
- (void)currentConfigurationForUser:(id)a3 completionHandler:(id)a4;
- (void)currentMessageTransportReachabilityMap:(id)a3;
- (void)eventRelay:(id)a3 didRelayRequestEvent:(id)a4;
- (void)eventRelay:(id)a3 didRelayResponseEvent:(id)a4;
- (void)familyProvider:(id)a3 didUpdateTargetableFamilyMembers:(id)a4;
- (void)familyProviderDidLeaveFamily:(id)a3;
- (void)isCapabilityEnabledForUser:(id)a3 capability:(id)a4 completionHandler:(id)a5;
- (void)isDowntimeEnabledForUserID:(id)a3 completionHandler:(id)a4;
- (void)promptForPasscodeFromUserWithEndpoint:(id)a3 completionHandler:(id)a4;
- (void)reconcileGenesisStateStore;
- (void)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 completionHandler:(id)a5;
- (void)scheduleFailStuckMessagesActivity:(id)a3;
- (void)scheduleMessageRetryActivity:(id)a3;
- (void)scheduleStoreCleanupActivity:(id)a3;
- (void)sendInitialSetup;
- (void)shutdown;
- (void)shutdownReactorWithCompletion:(id)a3;
- (void)start;
- (void)toggleOnDemandDowntimeForUserID:(id)a3 completionHandler:(id)a4;
- (void)transportEnvoy:(id)a3 didReceiveMessage:(id)a4;
- (void)transportEnvoy:(id)a3 didSendMessageWithIdentifier:(id)a4 result:(id)a5;
@end

@implementation STReactor

- (void)currentCommunicationConfigurationWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v5 = +[STLog reactor];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Current communication configuration requested", buf, 2u);
  }

  v6 = [(STReactor *)self configurationStore];
  v7 = [v6 readCommunicationConfigurationForLocalUser];

  v8 = [v7 mapError:&stru_1002FDA50];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000044E8;
  v12[3] = &unk_1002FDA78;
  id v13 = v4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100065E48;
  v10[3] = &unk_1002FC288;
  id v11 = v13;
  id v9 = v13;
  [v8 evaluateWithSuccess:v12 failure:v10];
}

- (STConfigurationStoreChangeObserver)configurationStore
{
  return (STConfigurationStoreChangeObserver *)objc_getProperty(self, a2, 24, 1);
}

- (STReactor)initWithFamilyCirclePrimitives:(id)a3 deviceInformationPrimitives:(id)a4 idsTransportPrimitives:(id)a5 filesystemPrimitives:(id)a6 contactStorePrimitives:(id)a7 xpcServiceProvider:(id)a8 primitiveOSTransactionProvider:(id)a9 primitiveBackgroundActivitySchedulerProvider:(id)a10 coreDataObserver:(id)a11 coreDataConfigurationTransformer:(id)a12 coreDataDeviceStateTransformer:(id)a13 coreDataFamilyInformationTransformer:(id)a14 askForTimeEventRelay:(id)a15 askForTimeResponseHandler:(id)a16 biomeEventWriter:(id)a17 eyeReliefStateWriter:(id)a18 userSafetyPolicyWriter:(id)a19 messageAddressMapDirectoryURL:(id)a20 messageIdentifierMapDirectoryURL:(id)a21 messageLedgerDirectoryURL:(id)a22 genesisStateStoreDirectoryURL:(id)a23 reactorQueue:(id)a24 transportQueue:(id)a25 shutdownWillBegin:(id)a26 shutdownDidComplete:(id)a27
{
  id v117 = a4;
  id v116 = a5;
  id v114 = a8;
  id v113 = a9;
  id v112 = a14;
  id v111 = a15;
  id v110 = a16;
  id v109 = a17;
  id v108 = a18;
  id v107 = a19;
  id v106 = a24;
  id v115 = a25;
  v124.receiver = self;
  v124.super_class = (Class)STReactor;
  id v102 = a27;
  id v98 = a26;
  id v94 = a23;
  id v93 = a22;
  id v29 = a21;
  id v30 = a20;
  id v88 = a13;
  id v87 = a12;
  id v86 = a11;
  id v89 = a10;
  id v31 = a7;
  id v32 = a6;
  id v33 = a3;
  v34 = [(STReactor *)&v124 init];
  objc_storeStrong((id *)&v34->_reactorQueue, a24);
  objc_storeStrong((id *)&v34->_transportQueue, a25);
  objc_storeStrong((id *)&v34->_xpcServiceProvider, a8);
  objc_storeStrong((id *)&v34->_primitiveOSTransactionProvider, a9);
  objc_storeStrong((id *)&v34->_familyInformationTransformer, a14);
  v35 = [[STFamilyInformationProvider alloc] initWithFamilyCirclePrimitives:v33 deviceInformationPrimitives:v117 contactStorePrimitives:v31];

  v36 = [[STFileBackedKeyValueStore alloc] initWithDirectory:v30 fileExtension:@"plist" filesystemPrimitives:v32];
  v92 = v36;
  id v37 = [(STFileBackedKeyValueStore *)v36 purge];
  v38 = [[STPersistentIDSMessageTransportMessageAddressMap alloc] initWithPrimitives:v116 userAliasResolver:v35 keyValueStore:v36];
  v39 = [[STFileBackedKeyValueStore alloc] initWithDirectory:v29 fileExtension:@"plist" filesystemPrimitives:v32];

  obja = v39;
  id v40 = [(STFileBackedKeyValueStore *)v39 purge];
  v104 = v38;
  v100 = [[STPersistentIDSMessageTransportMessageIdentifierMap alloc] initWithKeyValueStore:v39];
  v41 = [[STIDSMessageTransport alloc] initWithPrimitives:v116 messageAddressMap:v38 messageIdentifierMap:v100 addressValidator:v35 userAliasResolver:v35 returnAddressProvider:v35 transportQueue:v115];
  v42 = [[STFileBackedKeyValueStore alloc] initWithDirectory:v93 fileExtension:@"plist" filesystemPrimitives:v32];

  id v43 = [(STFileBackedKeyValueStore *)v42 purge];
  v44 = [[STPersistentTransportServiceMessageLedger alloc] initWithKeyValueStore:v42];
  v45 = [[STMessageTrackingTransportService alloc] initWithTransport:v41 returnAddressProvider:v35 messageLedger:v44 queue:v115];
  v46 = [[STFileBackedKeyValueStore alloc] initWithDirectory:v94 fileExtension:@"plist" filesystemPrimitives:v32];

  objc_storeStrong((id *)&v34->_familyInformationProvider, v35);
  [(STFamilyProviding *)v34->_familyInformationProvider setObserver:v34];
  objc_storeStrong((id *)&v34->_idsTransportPrimitives, a5);
  v97 = v41;
  objc_storeStrong((id *)&v34->__messageTransport, v41);
  v95 = v44;
  v47 = [[STMessageTrackingTransportEnvoy alloc] initWithTransportService:v45 messageLedger:v44 queue:v34->_transportQueue];
  transportEnvoy = v34->_transportEnvoy;
  v34->_transportEnvoy = (STTransportEnvoy *)v47;

  [(STTransportEnvoy *)v34->_transportEnvoy setDelegate:v34];
  v49 = -[STCoreDataConfigurationStore initWithObserver:transformer:reverseTransformer:]([STCoreDataConfigurationStore alloc], "initWithObserver:transformer:reverseTransformer:", v86);

  configurationStore = v34->_configurationStore;
  v34->_configurationStore = (STConfigurationStoreChangeObserver *)v49;

  [(STConfigurationStoreChangeObserver *)v34->_configurationStore setDelegate:v34];
  v51 = -[STCoreDataDeviceStateStore initWithObserver:transformer:reverseTransformer:]([STCoreDataDeviceStateStore alloc], "initWithObserver:transformer:reverseTransformer:", v86);

  deviceStateStore = v34->_deviceStateStore;
  v34->_deviceStateStore = (STDeviceStateChangeObserver *)v51;

  [(STDeviceStateChangeObserver *)v34->_deviceStateStore setDelegate:v34];
  objc_storeStrong((id *)&v34->_askForTimeEventRelay, a15);
  objc_storeStrong((id *)&v34->_askForTimeResponseHandler, a16);
  objc_storeStrong((id *)&v34->_biomeEventWriter, a17);
  objc_storeStrong((id *)&v34->_eyeReliefStateWriter, a18);
  objc_storeStrong((id *)&v34->_userSafetyPolicyWriter, a19);
  v53 = v46;
  v54 = [[STPersistentFamilyMemberGenesisStateStore alloc] initWithKeyValueStore:v46];
  genesisStateStore = v34->_genesisStateStore;
  v34->_genesisStateStore = (STFamilyMemberGenesisStateReader *)v54;

  id v90 = +[NSSet setWithArray:&off_10030FFA8];
  uint64_t v56 = objc_msgSend(v89, "createSchedulerRegisteredForTypes:schedulerDelegate:");

  backgroundActivityScheduler = v34->_backgroundActivityScheduler;
  v34->_backgroundActivityScheduler = (STPrimitiveBackgroundActivityScheduler *)v56;

  v58 = [[STReactorDirectiveProcessor alloc] initWithQueue:v34->_reactorQueue transportEnvoy:v34->_transportEnvoy transportEnvoyQueue:v34->_transportQueue configurationStore:v34->_configurationStore deviceStateStore:v34->_deviceStateStore biomeEventWriter:v34->_biomeEventWriter backgroundActivityScheduler:v34->_backgroundActivityScheduler familyProvider:v34->_familyInformationProvider eyeReliefStateWriter:v34->_eyeReliefStateWriter userSafetyPolicyWriter:v34->_userSafetyPolicyWriter transportPrimitives:v34->_idsTransportPrimitives];
  directiveProcessor = v34->_directiveProcessor;
  v34->_directiveProcessor = v58;

  uint64_t v60 = [(STXPCServiceProvider *)v34->_xpcServiceProvider provideAskService];
  askService = v34->_askService;
  v34->_askService = (STAskService *)v60;

  [(STAskService *)v34->_askService setDelegate:v34];
  uint64_t v62 = [(STXPCServiceProvider *)v34->_xpcServiceProvider provideCommunicationService];
  communicationService = v34->_communicationService;
  v34->_communicationService = (STCommunicationService *)v62;

  [(STCommunicationService *)v34->_communicationService setDelegate:v34];
  uint64_t v64 = [(STXPCServiceProvider *)v34->_xpcServiceProvider provideSetupService];
  setupService = v34->_setupService;
  v34->_setupService = (STSetupService *)v64;

  [(STSetupService *)v34->_setupService setDelegate:v34];
  uint64_t v66 = [(STXPCServiceProvider *)v34->_xpcServiceProvider provideReactorToolService];
  reactorToolService = v34->_reactorToolService;
  v34->_reactorToolService = (STReactorToolService *)v66;

  [(STReactorToolService *)v34->_reactorToolService setDelegate:v34];
  uint64_t v68 = [(STXPCServiceProvider *)v34->_xpcServiceProvider provideDowntimeService];
  downtimeService = v34->_downtimeService;
  v34->_downtimeService = (STDowntimeService *)v68;

  [(STDowntimeService *)v34->_downtimeService setDelegate:v34];
  objc_storeStrong((id *)&v34->_deviceInformationPrimitives, a4);
  id v70 = objc_retainBlock(v98);

  id shutdownWillBegin = v34->_shutdownWillBegin;
  v34->_id shutdownWillBegin = v70;

  id v72 = objc_retainBlock(v102);
  id shutdownDidComplete = v34->_shutdownDidComplete;
  v34->_id shutdownDidComplete = v72;

  v119[0] = _NSConcreteStackBlock;
  v119[1] = 3221225472;
  v119[2] = sub_100060990;
  v119[3] = &unk_1002FC698;
  v74 = v92;
  v120 = v74;
  v75 = obja;
  v121 = v75;
  v76 = v42;
  v122 = v76;
  v77 = v53;
  v123 = v77;
  v78 = objc_retainBlock(v119);
  id purgeKeyValueStores = v34->_purgeKeyValueStores;
  v34->_id purgeKeyValueStores = v78;

  v80 = +[NSNotificationCenter defaultCenter];
  v81 = +[STNetworkDetector sharedInstance];
  [v80 addObserver:v34 selector:"_networkDidBecomeReachable:" name:@"STNetworkDetectorChangedNotificationName" object:v81];

  v82 = +[STLog reactor];
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Initialized Reactor", buf, 2u);
  }

  return v34;
}

- (void)start
{
  v3 = [(STReactor *)self familyInformationProvider];
  id v8 = 0;
  id v4 = [v3 fetchTargetableFamilyMembersWithError:&v8];
  id v5 = v8;

  if (!v5 || [v5 code] != (id)31) {
    id v6 = [(STReactor *)self _persistTargetableFamilyMembers:v4];
  }
  [(STReactor *)self _synchronizeGenesisStateStoreWithTargetableFamilyMembers:v4];
  [(STReactor *)self _scheduleStoreCleanupBackgroundActivity];
  [(STReactor *)self _scheduleFailStuckMessagesBackgroundActivity];
  [(STReactor *)self _scheduleMessageRetryBackgroundActivity];
  [(STReactor *)self _scheduleDonateDowntimeBiomeEventBackgroundActivity];
  v7 = [(STReactor *)self askForTimeEventRelay];
  [v7 addObserver:self];
}

- (void)shutdown
{
  v3 = +[STLog reactor];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reactor shutdown begin", buf, 2u);
  }

  id v4 = [(STReactor *)self shutdownWillBegin];
  v4[2]();

  id v5 = [(STReactor *)self purgeKeyValueStores];
  v5[2]();

  id v6 = +[STLog reactor];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Reactor shutdown complete", v8, 2u);
  }

  v7 = [(STReactor *)self shutdownDidComplete];
  v7[2]();
}

- (void)_synchronizeGenesisStateStoreWithTargetableFamilyMembers:(id)a3
{
  id v4 = a3;
  id v5 = [(STReactor *)self genesisStateStore];
  id v9 = [v5 readFamilyMemberGenesisStateItems];

  id v6 = +[STGenesisStateReactorCoreComponent updateFamilyMemberGenesisStateItems:v9 targetableFamilyMembers:v4];

  v7 = +[STGenesisStateReactorCoreComponent updateExpiredAwaitingResponseFamilyMemberGenesisStateItemsToPending:v6];

  id v8 = [(STReactor *)self genesisStateStore];
  [v8 writeFamilyMemberGenesisStateItems:v7];
}

- (id)_persistTargetableFamilyMembers:(id)a3
{
  id v4 = a3;
  id v5 = [(STReactor *)self familyInformationTransformer];
  id v6 = [v5 updateDatabaseWithFamilyMembers:v4];

  [v6 evaluateWithSuccess:&stru_1002FD6A8 failure:&stru_1002FD6C8];
  return v6;
}

- (void)reconcileGenesisStateStore
{
  v3 = +[STLog reactor];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Reconciling genesis state", buf, 2u);
  }

  id v4 = [(STReactor *)self primitiveOSTransactionProvider];
  id v5 = [v4 transactionWithDescription:"com.apple.ScreenTimeAgent.reconcile-genesis"];

  id v6 = +[STPromise doOn];
  v7 = [(STReactor *)self reactorQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000613F0;
  v18[3] = &unk_1002FD6F0;
  v18[4] = self;
  id v8 = ((void (**)(void, void *, void *))v6)[2](v6, v7, v18);
  id v9 = [v8 then];
  v10 = ((void (**)(void, Block_layout *))v9)[2](v9, &stru_1002FD730);
  id v11 = [v10 catch];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100061634;
  v15[3] = &unk_1002FD758;
  id v16 = v5;
  v17 = self;
  v12 = (uint64_t (*)(void *, void *))v11[2];
  id v13 = v5;
  id v14 = (id)v12(v11, v15);
}

- (void)sendInitialSetup
{
  v3 = [(STReactor *)self primitiveOSTransactionProvider];
  id v4 = [v3 transactionWithDescription:"com.apple.ScreenTimeAgent.setup"];

  id v5 = [(STReactor *)self familyInformationProvider];
  id v6 = [v5 fetchTargetableFamilyMembersWithError:0];

  v7 = +[STPromise doOn];
  id v8 = [(STReactor *)self reactorQueue];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100061860;
  v18[3] = &unk_1002FD780;
  id v19 = v6;
  v20 = self;
  id v9 = (void (*)(void *, void *, void *))v7[2];
  id v10 = v6;
  id v11 = v9(v7, v8, v18);
  v12 = [v11 catch];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000618DC;
  v16[3] = &unk_1002FC888;
  id v17 = v4;
  id v13 = (uint64_t (*)(void *, void *))v12[2];
  id v14 = v4;
  id v15 = (id)v13(v12, v16);
}

- (void)_networkDidBecomeReachable:(id)a3
{
  id v4 = a3;
  id v5 = [(STReactor *)self primitiveOSTransactionProvider];
  id v29 = [v5 transactionWithDescription:"com.apple.ScreenTimeAgent.network-reachability-checkin"];

  id v6 = [v4 object];
  if ([v6 isOnline])
  {
    v25 = v6;
    id v26 = v4;
    v7 = [(STReactor *)self familyInformationProvider];
    id v8 = [v7 fetchTargetableFamilyMembersWithError:0];

    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id obj = v8;
    id v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v28 = *(void *)v37;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v37 != v28) {
            objc_enumerationMutation(obj);
          }
          v12 = *(void **)(*((void *)&v36 + 1) + 8 * (void)v11);
          id v13 = objc_alloc((Class)STUserID);
          id v14 = [v12 dsid];
          id v15 = [v13 initWithDSID:v14];

          id v16 = +[STPromise doOn];
          id v17 = [(STReactor *)self reactorQueue];
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_100061CB0;
          v33[3] = &unk_1002FD780;
          id v34 = v15;
          v35 = self;
          v18 = (void (*)(void *, void *, void *))v16[2];
          id v19 = v15;
          v20 = v18(v16, v17, v33);
          v21 = [v20 then];
          v32[0] = _NSConcreteStackBlock;
          v32[1] = 3221225472;
          v32[2] = sub_100061DC0;
          v32[3] = &unk_1002FD7A8;
          v32[4] = self;
          v22 = ((void (**)(void, void *))v21)[2](v21, v32);
          v23 = [v22 catch];
          v30[0] = _NSConcreteStackBlock;
          v30[1] = 3221225472;
          v30[2] = sub_100061ED8;
          v30[3] = &unk_1002FC888;
          id v31 = v29;
          id v24 = (id)((uint64_t (**)(void, void *))v23)[2](v23, v30);

          id v11 = (char *)v11 + 1;
        }
        while (v10 != v11);
        id v10 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v10);
    }

    id v6 = v25;
    id v4 = v26;
  }
}

- (void)_scheduleStoreCleanupBackgroundActivity
{
  v3 = [(STReactor *)self primitiveOSTransactionProvider];
  id v4 = [v3 transactionWithDescription:"com.apple.ScreenTimeAgent.schedule-store-cleanup-activity"];

  id v5 = +[STPromise doOn];
  id v6 = [(STReactor *)self reactorQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000620F0;
  v16[3] = &unk_1002FD6F0;
  void v16[4] = self;
  v7 = ((void (**)(void, void *, void *))v5)[2](v5, v6, v16);
  id v8 = [v7 then];
  id v9 = ((void (**)(void, Block_layout *))v8)[2](v8, &stru_1002FD7E8);
  id v10 = [v9 catch];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100062258;
  v14[3] = &unk_1002FC888;
  id v15 = v4;
  id v11 = (uint64_t (*)(void *, void *))v10[2];
  id v12 = v4;
  id v13 = (id)v11(v10, v14);
}

- (void)_scheduleFailStuckMessagesBackgroundActivity
{
  v3 = [(STReactor *)self primitiveOSTransactionProvider];
  id v4 = [v3 transactionWithDescription:"com.apple.ScreenTimeAgent.schedule-fail-stuck-messages-activity"];

  id v5 = +[STPromise doOn];
  id v6 = [(STReactor *)self reactorQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100062470;
  v16[3] = &unk_1002FD6F0;
  void v16[4] = self;
  v7 = ((void (**)(void, void *, void *))v5)[2](v5, v6, v16);
  id v8 = [v7 then];
  id v9 = ((void (**)(void, Block_layout *))v8)[2](v8, &stru_1002FD808);
  id v10 = [v9 catch];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000625D8;
  v14[3] = &unk_1002FC888;
  id v15 = v4;
  id v11 = (uint64_t (*)(void *, void *))v10[2];
  id v12 = v4;
  id v13 = (id)v11(v10, v14);
}

- (void)_scheduleMessageRetryBackgroundActivity
{
  v3 = [(STReactor *)self primitiveOSTransactionProvider];
  id v4 = [v3 transactionWithDescription:"com.apple.ScreenTimeAgent.schedule-message-retry-activity"];

  id v5 = +[STPromise doOn];
  id v6 = [(STReactor *)self reactorQueue];
  v7 = ((void (**)(void, void *, Block_layout *))v5)[2](v5, v6, &stru_1002FD848);
  id v8 = [v7 then];
  id v9 = ((void (**)(void, Block_layout *))v8)[2](v8, &stru_1002FD868);
  id v10 = [v9 catch];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000628B8;
  v14[3] = &unk_1002FC888;
  id v15 = v4;
  id v11 = (uint64_t (*)(void *, void *))v10[2];
  id v12 = v4;
  id v13 = (id)v11(v10, v14);
}

- (void)_scheduleDonateDowntimeBiomeEventBackgroundActivity
{
  v3 = [(STReactor *)self primitiveOSTransactionProvider];
  id v4 = [v3 transactionWithDescription:"com.apple.ScreenTimeAgent.schedule-downtime-biome-event-donation-activity"];

  id v5 = +[STPromise doOn];
  id v6 = [(STReactor *)self reactorQueue];
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100062AD0;
  v16[3] = &unk_1002FD6F0;
  void v16[4] = self;
  v7 = ((void (**)(void, void *, void *))v5)[2](v5, v6, v16);
  id v8 = [v7 then];
  id v9 = ((void (**)(void, Block_layout *))v8)[2](v8, &stru_1002FD888);
  id v10 = [v9 catch];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100062CB8;
  v14[3] = &unk_1002FC888;
  id v15 = v4;
  id v11 = (uint64_t (*)(void *, void *))v10[2];
  id v12 = v4;
  id v13 = (id)v11(v10, v14);
}

- (void)transportEnvoy:(id)a3 didReceiveMessage:(id)a4
{
  id v5 = a4;
  id v6 = [v5 message];
  v7 = +[STLog reactor];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v34 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Received message: %{public}@", buf, 0xCu);
  }

  id v8 = [(STReactor *)self primitiveOSTransactionProvider];
  id v9 = [v8 transactionWithDescription:"com.apple.ScreenTimeAgent.receive-transport-message"];

  id v10 = +[STPromise doOn];
  v22 = [(STReactor *)self reactorQueue];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100063004;
  v30[3] = &unk_1002FD8B0;
  void v30[4] = self;
  id v31 = v5;
  id v11 = v6;
  id v32 = v11;
  id v12 = (void (*)(void *, void *, void *))v10[2];
  id v23 = v5;
  id v13 = v12(v10, v22, v30);
  id v14 = [v13 then];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100063170;
  v27[3] = &unk_1002FD8D8;
  id v15 = v11;
  id v28 = v15;
  id v29 = self;
  id v16 = ((void (**)(void, void *))v14)[2](v14, v27);
  id v17 = [v16 catch];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000632F4;
  v24[3] = &unk_1002FD758;
  id v25 = v9;
  id v26 = v15;
  v18 = (uint64_t (*)(void *, void *))v17[2];
  id v19 = v15;
  id v20 = v9;
  id v21 = (id)v18(v17, v24);
}

- (void)transportEnvoy:(id)a3 didSendMessageWithIdentifier:(id)a4 result:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(STReactor *)self primitiveOSTransactionProvider];
  id v10 = [v9 transactionWithDescription:"com.apple.ScreenTimeAgent.did-send-message"];

  id v11 = +[STLog reactor];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v30 = v7;
    __int16 v31 = 2114;
    id v32 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Sent message %{public}@ with result: %{public}@", buf, 0x16u);
  }

  id v12 = +[STPromise doOn];
  id v13 = [(STReactor *)self reactorQueue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000635D0;
  v26[3] = &unk_1002FD780;
  id v14 = v8;
  id v27 = v14;
  id v28 = self;
  id v15 = ((void (**)(void, void *, void *))v12)[2](v12, v13, v26);
  id v16 = [v15 catch];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10006364C;
  v22[3] = &unk_1002FD900;
  id v23 = v7;
  id v24 = v14;
  id v25 = v10;
  id v17 = (uint64_t (*)(void *, void *))v16[2];
  id v18 = v10;
  id v19 = v14;
  id v20 = v7;
  id v21 = (id)v17(v16, v22);
}

- (void)changeObserver:(id)a3 didObserveConfigurationChange:(id)a4
{
  id v5 = a4;
  id v6 = [(STReactor *)self primitiveOSTransactionProvider];
  id v7 = [v6 transactionWithDescription:"com.apple.ScreenTimeAgent.observe-configuration-change"];

  id v8 = +[STLog reactor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v51 = v5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Observed change: %{public}@", buf, 0xCu);
  }

  __int16 v31 = [(STReactor *)self reactorQueue];
  uint64_t v9 = +[STPromise doOn];
  v48[0] = _NSConcreteStackBlock;
  v48[1] = 3221225472;
  v48[2] = sub_100063AF8;
  v48[3] = &unk_1002FD780;
  v48[4] = self;
  id v10 = v5;
  id v49 = v10;
  id v30 = (void *)v9;
  id v29 = (*(void (**)(uint64_t, void *, void *))(v9 + 16))(v9, v31, v48);
  uint64_t v11 = [v29 then];
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100063BC8;
  v45[3] = &unk_1002FD928;
  id v12 = v10;
  id v46 = v12;
  v47 = self;
  id v28 = (void *)v11;
  id v27 = (*(void (**)(uint64_t, void *))(v11 + 16))(v11, v45);
  id v13 = [v27 then];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100063D8C;
  v42[3] = &unk_1002FD928;
  id v14 = v12;
  id v43 = v14;
  v44 = self;
  id v26 = ((void (**)(void, void *))v13)[2](v13, v42);
  id v15 = [v26 then];
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_100063E40;
  v39[3] = &unk_1002FD928;
  id v16 = v14;
  id v40 = v16;
  v41 = self;
  id v17 = ((void (**)(void, void *))v15)[2](v15, v39);
  id v18 = [v17 then];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100063EF4;
  v36[3] = &unk_1002FD928;
  id v19 = v16;
  id v37 = v19;
  long long v38 = self;
  id v20 = ((void (**)(void, void *))v18)[2](v18, v36);
  id v21 = [v20 catch];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100063FF0;
  v32[3] = &unk_1002FD900;
  id v33 = v7;
  id v34 = v19;
  v35 = self;
  v22 = (uint64_t (*)(void *, void *))v21[2];
  id v25 = v19;
  id v23 = v7;
  id v24 = (id)v22(v21, v32);
}

- (void)changeObserver:(id)a3 didObserveDeviceStateChange:(id)a4
{
  id v5 = a4;
  id v6 = [(STReactor *)self primitiveOSTransactionProvider];
  id v7 = [v6 transactionWithDescription:"com.apple.ScreenTimeAgent.observe-device-state-change"];

  id v8 = [(STReactor *)self reactorQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100064158;
  block[3] = &unk_1002FCB20;
  id v12 = v5;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v5;
  dispatch_async(v8, block);
}

- (void)familyProvider:(id)a3 didUpdateTargetableFamilyMembers:(id)a4
{
  id v5 = a4;
  id v6 = +[STLog reactor];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446723;
    id v12 = "-[STReactor familyProvider:didUpdateTargetableFamilyMembers:]";
    __int16 v13 = 2048;
    id v14 = [v5 count];
    __int16 v15 = 2113;
    id v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}s: \nObserved family change - %lu members: %{private}@", buf, 0x20u);
  }

  id v7 = [(STReactor *)self reactorQueue];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10006467C;
  v9[3] = &unk_1002FB828;
  v9[4] = self;
  id v10 = v5;
  id v8 = v5;
  dispatch_async(v7, v9);
}

- (void)familyProviderDidLeaveFamily:(id)a3
{
  id v4 = +[STLog reactor];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v8 = "-[STReactor familyProviderDidLeaveFamily:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}s: \nObserved family change: Left family", buf, 0xCu);
  }

  id v5 = [(STReactor *)self reactorQueue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000647E4;
  block[3] = &unk_1002FB6A8;
  void block[4] = self;
  dispatch_async(v5, block);
}

- (void)beginBackgroundActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 type];
  id v6 = +[STLog reactor];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)v5 > 3) {
      CFStringRef v7 = &stru_10030A6D8;
    }
    else {
      CFStringRef v7 = *(&off_1002FDAE0 + (void)v5);
    }
    *(_DWORD *)buf = 138543362;
    CFStringRef v28 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Beginning background activity: %{public}@", buf, 0xCu);
  }

  id v8 = +[STPromise doOn];
  id v9 = [(STReactor *)self reactorQueue];
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_100064AF0;
  v26[3] = &unk_1002FD950;
  void v26[4] = self;
  v26[5] = v5;
  id v10 = ((void (**)(void, void *, void *))v8)[2](v8, v9, v26);
  uint64_t v11 = [v10 then];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100064B6C;
  v22[3] = &unk_1002FD978;
  id v25 = v5;
  id v12 = v4;
  id v23 = v12;
  id v24 = self;
  __int16 v13 = ((void (**)(void, void *))v11)[2](v11, v22);
  id v14 = [v13 catch];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100064D90;
  v18[3] = &unk_1002FD9A0;
  id v20 = self;
  id v21 = v5;
  id v19 = v12;
  __int16 v15 = (uint64_t (*)(void *, void *))v14[2];
  id v16 = v12;
  id v17 = (id)v15(v14, v18);
}

- (void)eventRelay:(id)a3 didRelayRequestEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(STReactor *)self primitiveOSTransactionProvider];
  CFStringRef v7 = [v6 transactionWithDescription:"com.apple.ScreenTimeAgent.handle-relayed-ask-event"];

  id v8 = +[STLog reactor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 identifier];
    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Event relay did relay ask for time request event: %{public}@", buf, 0xCu);
  }
  id v10 = +[STPromise doOn];
  uint64_t v11 = [(STReactor *)self reactorQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10006511C;
  v21[3] = &unk_1002FD780;
  id v22 = v5;
  id v23 = self;
  id v12 = (void (*)(void *, void *, void *))v10[2];
  id v13 = v5;
  id v14 = v12(v10, v11, v21);
  __int16 v15 = [v14 catch];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100065198;
  v19[3] = &unk_1002FC888;
  id v20 = v7;
  id v16 = (uint64_t (*)(void *, void *))v15[2];
  id v17 = v7;
  id v18 = (id)v16(v15, v19);
}

- (void)eventRelay:(id)a3 didRelayResponseEvent:(id)a4
{
  id v5 = a4;
  id v6 = [(STReactor *)self primitiveOSTransactionProvider];
  CFStringRef v7 = [v6 transactionWithDescription:"com.apple.ScreenTimeAgent.handle-relayed-ask-event"];

  id v8 = +[STLog reactor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v5 identifier];
    *(_DWORD *)buf = 138543362;
    id v25 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Event relay did relay ask for time response event: %{public}@", buf, 0xCu);
  }
  id v10 = +[STPromise doOn];
  uint64_t v11 = [(STReactor *)self reactorQueue];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100065430;
  v21[3] = &unk_1002FD780;
  id v22 = v5;
  id v23 = self;
  id v12 = (void (*)(void *, void *, void *))v10[2];
  id v13 = v5;
  id v14 = v12(v10, v11, v21);
  __int16 v15 = [v14 catch];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000654AC;
  v19[3] = &unk_1002FC888;
  id v20 = v7;
  id v16 = (uint64_t (*)(void *, void *))v15[2];
  id v17 = v7;
  id v18 = (id)v16(v15, v19);
}

- (void)respondToAskForTimeRequestWithIdentifier:(id)a3 answer:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  id v10 = +[STLog reactor];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138543362;
    id v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Responding to ask for time request: %{public}@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v11 = [(STReactor *)self askForTimeResponseHandler];
  [v11 handleAnswer:a4 forRequestWithIdentifier:v8];

  v9[2](v9, 0);
}

- (void)isCapabilityEnabledForUser:(id)a3 capability:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(STReactor *)self _messageTransport];
  [v11 _isCapabilityEnabledForUser:v10 capability:v9 completionHandler:v8];
}

- (void)isDowntimeEnabledForUserID:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog reactor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current downtime state requested for user: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  id v9 = [(STReactor *)self configurationStore];
  id v10 = [v9 readDowntimeConfigurationForUserID:v6];

  id v11 = [v10 mapError:&stru_1002FD9C0];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100065960;
  v15[3] = &unk_1002FD9E8;
  p_long long buf = &buf;
  id v16 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100065A38;
  v13[3] = &unk_1002FC288;
  id v12 = v16;
  id v14 = v12;
  [v11 evaluateWithSuccess:v15 failure:v13];

  _Block_object_dispose(&buf, 8);
}

- (void)toggleOnDemandDowntimeForUserID:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[STLog reactor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Attempt to toggle on demand downtime for user ID", buf, 2u);
  }

  id v9 = [(STReactor *)self configurationStore];
  id v10 = [v9 toggleOnDemandDowntimeConfigurationForUserID:v7];

  id v11 = [v10 mapError:&stru_1002FDA08];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100065C84;
  v15[3] = &unk_1002FDA30;
  id v16 = v6;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100065D0C;
  v13[3] = &unk_1002FC288;
  id v14 = v16;
  id v12 = v16;
  [v11 evaluateWithSuccess:v15 failure:v13];
}

- (void)authenticatePasscodeForUserWithEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  id v8 = +[STLog reactor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Passcode authentication requested", v11, 2u);
  }

  id v9 = [(STReactor *)self xpcServiceProvider];
  id v10 = [v9 providePasscodeAuthenticationServiceWithClientListenerEndpoint:v7];

  [v10 activate];
  v6[2](v6);
}

- (void)currentConfigurationForUser:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog reactor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Current setup configuration requested for user: %{public}@", buf, 0xCu);
  }

  id v9 = [(STReactor *)self configurationStore];
  id v10 = [(STReactor *)self familyInformationProvider];
  id v11 = [v9 readSetupConfigurationForUserID:v6 familyProvider:v10];

  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100066190;
  v21[3] = &unk_1002FC148;
  id v12 = v6;
  id v22 = v12;
  id v13 = [v11 mapError:v21];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000662C4;
  v18[3] = &unk_1002FDAA0;
  id v19 = v12;
  id v20 = v7;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_1000663A4;
  v16[3] = &unk_1002FC288;
  id v17 = v20;
  id v14 = v20;
  id v15 = v12;
  [v13 evaluateWithSuccess:v18 failure:v16];
}

- (void)applyUpdatedConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[STLog reactor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v18 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Apply configuration requested: %{public}@", buf, 0xCu);
  }

  id v9 = [(STReactor *)self configurationStore];
  id v10 = [v9 writeSetupConfiguration:v6];

  id v11 = [v10 mapError:&stru_1002FDAC0];

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10006669C;
  v15[3] = &unk_1002FDA30;
  id v16 = v7;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100066724;
  v13[3] = &unk_1002FC288;
  id v14 = v16;
  id v12 = v16;
  [v11 evaluateWithSuccess:v15 failure:v13];
}

- (void)promptForPasscodeFromUserWithEndpoint:(id)a3 completionHandler:(id)a4
{
  id v6 = (void (**)(void))a4;
  id v7 = a3;
  id v8 = +[STLog reactor];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Prompting user for passcode", v11, 2u);
  }

  id v9 = [(STReactor *)self xpcServiceProvider];
  id v10 = [v9 providePasscodePromptServiceWithClientListenerEndpoint:v7];

  [v10 activate];
  v6[2](v6);
}

- (void)shutdownReactorWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = +[STLog reactor];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[TOOL] Reactor shutdown requested", v6, 2u);
  }

  v4[2](v4);
  [(STReactor *)self shutdown];
}

- (void)scheduleMessageRetryActivity:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = +[STLog reactor];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[TOOL] Schedule message retry requested", v6, 2u);
  }

  [(STReactor *)self _scheduleMessageRetryBackgroundActivity];
  v4[2](v4);
}

- (void)scheduleStoreCleanupActivity:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = +[STLog reactor];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[TOOL] Schedule store cleanup requested", v6, 2u);
  }

  [(STReactor *)self _scheduleStoreCleanupBackgroundActivity];
  v4[2](v4);
}

- (void)scheduleFailStuckMessagesActivity:(id)a3
{
  id v4 = (void (**)(void))a3;
  id v5 = +[STLog reactor];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[TOOL] Schedule fail stuck messages requested", v6, 2u);
  }

  [(STReactor *)self _scheduleFailStuckMessagesBackgroundActivity];
  v4[2](v4);
}

- (void)currentMessageTransportReachabilityMap:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  id v5 = +[STLog reactor];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[TOOL] Getting current message transport reachability map", v8, 2u);
  }

  id v6 = [(STReactor *)self _messageTransport];
  id v7 = [v6 destinationReachabilityMap];
  v4[2](v4, v7);
}

- (STIDSTransportPrimitives)idsTransportPrimitives
{
  return (STIDSTransportPrimitives *)objc_getProperty(self, a2, 8, 1);
}

- (STTransportEnvoy)transportEnvoy
{
  return (STTransportEnvoy *)objc_getProperty(self, a2, 16, 1);
}

- (STDeviceStateChangeObserver)deviceStateStore
{
  return (STDeviceStateChangeObserver *)objc_getProperty(self, a2, 32, 1);
}

- (STAskForTimeEventRelay)askForTimeEventRelay
{
  return (STAskForTimeEventRelay *)objc_getProperty(self, a2, 40, 1);
}

- (STAskForTimeResponseHandler)askForTimeResponseHandler
{
  return (STAskForTimeResponseHandler *)objc_getProperty(self, a2, 48, 1);
}

- (STBiomeEventWriter)biomeEventWriter
{
  return (STBiomeEventWriter *)objc_getProperty(self, a2, 56, 1);
}

- (STFamilyMemberGenesisStateReader)genesisStateStore
{
  return (STFamilyMemberGenesisStateReader *)objc_getProperty(self, a2, 64, 1);
}

- (STCoreDataFamilyInformationReverseTransformer)familyInformationTransformer
{
  return (STCoreDataFamilyInformationReverseTransformer *)objc_getProperty(self, a2, 72, 1);
}

- (STFamilyProviding)familyInformationProvider
{
  return (STFamilyProviding *)objc_getProperty(self, a2, 80, 1);
}

- (STEyeReliefStateWriter)eyeReliefStateWriter
{
  return (STEyeReliefStateWriter *)objc_getProperty(self, a2, 88, 1);
}

- (STUserSafetyPolicyWriter)userSafetyPolicyWriter
{
  return (STUserSafetyPolicyWriter *)objc_getProperty(self, a2, 96, 1);
}

- (STReactorDirectiveProcessor)directiveProcessor
{
  return (STReactorDirectiveProcessor *)objc_getProperty(self, a2, 104, 1);
}

- (OS_dispatch_queue)reactorQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 112, 1);
}

- (OS_dispatch_queue)transportQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 120, 1);
}

- (STPrimitiveOSTransactionProvider)primitiveOSTransactionProvider
{
  return (STPrimitiveOSTransactionProvider *)objc_getProperty(self, a2, 128, 1);
}

- (STXPCServiceProvider)xpcServiceProvider
{
  return (STXPCServiceProvider *)objc_getProperty(self, a2, 136, 1);
}

- (STAskService)askService
{
  return (STAskService *)objc_getProperty(self, a2, 144, 1);
}

- (STCommunicationService)communicationService
{
  return (STCommunicationService *)objc_getProperty(self, a2, 152, 1);
}

- (STSetupService)setupService
{
  return (STSetupService *)objc_getProperty(self, a2, 160, 1);
}

- (STReactorToolService)reactorToolService
{
  return (STReactorToolService *)objc_getProperty(self, a2, 168, 1);
}

- (STDowntimeService)downtimeService
{
  return (STDowntimeService *)objc_getProperty(self, a2, 176, 1);
}

- (STPrimitiveBackgroundActivityScheduler)backgroundActivityScheduler
{
  return (STPrimitiveBackgroundActivityScheduler *)objc_getProperty(self, a2, 184, 1);
}

- (STDeviceInformationPrimitives)deviceInformationPrimitives
{
  return (STDeviceInformationPrimitives *)objc_getProperty(self, a2, 192, 1);
}

- (id)shutdownWillBegin
{
  return objc_getProperty(self, a2, 200, 1);
}

- (id)shutdownDidComplete
{
  return objc_getProperty(self, a2, 208, 1);
}

- (id)purgeKeyValueStores
{
  return objc_getProperty(self, a2, 216, 1);
}

- (STIDSMessageTransport)_messageTransport
{
  return (STIDSMessageTransport *)objc_getProperty(self, a2, 224, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__messageTransport, 0);
  objc_storeStrong(&self->_purgeKeyValueStores, 0);
  objc_storeStrong(&self->_shutdownDidComplete, 0);
  objc_storeStrong(&self->_shutdownWillBegin, 0);
  objc_storeStrong((id *)&self->_deviceInformationPrimitives, 0);
  objc_storeStrong((id *)&self->_backgroundActivityScheduler, 0);
  objc_storeStrong((id *)&self->_downtimeService, 0);
  objc_storeStrong((id *)&self->_reactorToolService, 0);
  objc_storeStrong((id *)&self->_setupService, 0);
  objc_storeStrong((id *)&self->_communicationService, 0);
  objc_storeStrong((id *)&self->_askService, 0);
  objc_storeStrong((id *)&self->_xpcServiceProvider, 0);
  objc_storeStrong((id *)&self->_primitiveOSTransactionProvider, 0);
  objc_storeStrong((id *)&self->_transportQueue, 0);
  objc_storeStrong((id *)&self->_reactorQueue, 0);
  objc_storeStrong((id *)&self->_directiveProcessor, 0);
  objc_storeStrong((id *)&self->_userSafetyPolicyWriter, 0);
  objc_storeStrong((id *)&self->_eyeReliefStateWriter, 0);
  objc_storeStrong((id *)&self->_familyInformationProvider, 0);
  objc_storeStrong((id *)&self->_familyInformationTransformer, 0);
  objc_storeStrong((id *)&self->_genesisStateStore, 0);
  objc_storeStrong((id *)&self->_biomeEventWriter, 0);
  objc_storeStrong((id *)&self->_askForTimeResponseHandler, 0);
  objc_storeStrong((id *)&self->_askForTimeEventRelay, 0);
  objc_storeStrong((id *)&self->_deviceStateStore, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
  objc_storeStrong((id *)&self->_transportEnvoy, 0);
  objc_storeStrong((id *)&self->_idsTransportPrimitives, 0);
}

@end