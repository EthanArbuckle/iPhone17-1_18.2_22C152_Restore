@interface CSDFaceTimeProviderDelegate
- (BOOL)providerDelegate:(id)a3 isExclusivelyManagingCallWithUUID:(id)a4;
- (BOOL)providerDelegate:(id)a3 isManagingCallWithUUID:(id)a4;
- (BOOL)shouldUseIDSDemuxer;
- (CPApplicationMonitor)applicationMonitor;
- (CPBiomeSessionDonator)cpBiomeStreamDonator;
- (CPConversationManagerHost)conversationManagerHost;
- (CSDBlockUtilitiesProtocol)blockUtilities;
- (CSDConversationManager)conversationManager;
- (CSDConversationManagerXPCServer)conversationManagerXPCServer;
- (CSDConversationServerBag)serverBag;
- (CSDFaceTimeConversationProviderDelegate)faceTimeConversationProviderDelegate;
- (CSDFaceTimeIDSProviderDelegate)faceTimeIDSProviderDelegate;
- (CSDFaceTimeIMAVProviderDelegate)faceTimeIMAVProviderDelegate;
- (CSDFaceTimeInstallationNotifier)facetimeInstallationNotifier;
- (CSDFaceTimeInviteDemuxer)faceTimeInviteDemuxer;
- (CSDFaceTimeProviderDelegate)init;
- (CSDFaceTimeProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4 chManager:(id)a5;
- (CSDFaceTimeProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4 featureFlags:(id)a5 blockUtilities:(id)a6 shouldUseIDSDemuxer:(BOOL)a7 chManager:(id)a8;
- (CSDGFTServiceConversationProviderDelegate)groupFaceTimeServiceProviderDelegate;
- (CSDIDSFirewallManager)firewallManager;
- (CSDNeighborhoodActivityConduit)conduit;
- (CSDProviderCallDataSource)callDataSource;
- (CSDRelayConversationManager)relayConversationManager;
- (CXProvider)provider;
- (NSMutableDictionary)delayedActionsByCallUUID;
- (OS_dispatch_queue)queue;
- (TUFeatureFlags)featureFlags;
- (TUNeighborhoodActivityConduit)neighborhoodActivityConduit;
- (id)ISOCountryCodeForCallWithUUID:(id)a3;
- (id)_createJoinCallAction:(id)a3 outgoingCallerID:(id)a4 gftOneToOneDestinations:(id)a5;
- (id)providerConfiguration;
- (void)_createDelayedActionListIfNecessary:(id)a3;
- (void)_processDelayedActionList:(id)a3 provider:(id)a4;
- (void)dealloc;
- (void)deferReportingAudioFinishedForCallWithUUID:(id)a3;
- (void)initiateModernFTInviteForAction:(id)a3 destinations:(id)a4 excludedIMAVDestinations:(id)a5 joinCallActionToFulfill:(id)a6;
- (void)provider:(id)a3 didActivateAudioSession:(id)a4;
- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4;
- (void)provider:(id)a3 performAnswerCallAction:(id)a4;
- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4;
- (void)provider:(id)a3 performEndCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4;
- (void)provider:(id)a3 performJoinCallAction:(id)a4 shouldUseIDSDemuxer:(BOOL)a5;
- (void)provider:(id)a3 performSetAllowUplinkAudioInjectionAction:(id)a4;
- (void)provider:(id)a3 performSetHeldCallAction:(id)a4;
- (void)provider:(id)a3 performSetMutedCallAction:(id)a4;
- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4;
- (void)provider:(id)a3 performSetScreenShareAttributesCallAction:(id)a4;
- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4;
- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4;
- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4;
- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4;
- (void)provider:(id)a3 performStartCallAction:(id)a4;
- (void)provider:(id)a3 performStartCallAction:(id)a4 shouldUseIDSDemuxer:(BOOL)a5;
- (void)provider:(id)a3 timedOutPerformingAction:(id)a4;
- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 connectedAtDate:(id)a5;
- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 endedAtDate:(id)a5 withReason:(int64_t)a6 failureContext:(id)a7;
- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 startedConnectingAtDate:(id)a5;
- (void)providerDelegate:(id)a3 endOtherProvidersCallWithUUID:(id)a4;
- (void)providerDelegate:(id)a3 requestedTransaction:(id)a4 completion:(id)a5;
- (void)providerDelegate:(id)a3 requestedUpgradeToExistingCallForConversation:(id)a4 withSessionToken:(id)a5 completion:(id)a6;
- (void)providerDidBegin:(id)a3;
- (void)providerDidReset:(id)a3;
- (void)setCallDataSource:(id)a3;
- (void)setFaceTimeConversationProviderDelegate:(id)a3;
- (void)setFaceTimeIDSProviderDelegate:(id)a3;
- (void)setFaceTimeIMAVProviderDelegate:(id)a3;
- (void)setFaceTimeInviteDemuxer:(id)a3;
- (void)setFirewallManager:(id)a3;
- (void)setGroupFaceTimeServiceProviderDelegate:(id)a3;
- (void)setServerBag:(id)a3;
- (void)updateProviderConfigurationWithSenderIdentities:(id)a3;
@end

@implementation CSDFaceTimeProviderDelegate

- (CSDFaceTimeProviderDelegate)init
{
  v4 = +[NSAssertionHandler currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"CSDFaceTimeProviderDelegate.m", 79, @"%s is not available. Use a designated initializer instead.", "-[CSDFaceTimeProviderDelegate init]");

  return 0;
}

- (CSDFaceTimeProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4 chManager:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = objc_alloc_init((Class)TUFeatureFlags);
  v12 = objc_alloc_init(CSDBlockUtilities);
  v13 = -[CSDFaceTimeProviderDelegate initWithCallSource:queue:featureFlags:blockUtilities:shouldUseIDSDemuxer:chManager:](self, "initWithCallSource:queue:featureFlags:blockUtilities:shouldUseIDSDemuxer:chManager:", v10, v9, v11, v12, [v11 conversationOneToOneModeEnabled], v8);

  return v13;
}

- (CSDFaceTimeProviderDelegate)initWithCallSource:(id)a3 queue:(id)a4 featureFlags:(id)a5 blockUtilities:(id)a6 shouldUseIDSDemuxer:(BOOL)a7 chManager:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v76 = a6;
  id v17 = a8;
  v80.receiver = self;
  v80.super_class = (Class)CSDFaceTimeProviderDelegate;
  v18 = [(CSDFaceTimeProviderDelegate *)&v80 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a4);
    v20 = [(CSDFaceTimeProviderDelegate *)v19 queue];
    dispatch_assert_queue_V2(v20);

    objc_storeStrong((id *)&v19->_featureFlags, a5);
    v21 = objc_alloc_init(CSDSharedConversationServerBag);
    serverBag = v19->_serverBag;
    v19->_serverBag = (CSDConversationServerBag *)v21;

    objc_storeStrong((id *)&v19->_blockUtilities, a6);
    v19->_shouldUseIDSDemuxer = a7;
    v23 = objc_alloc_init(CSDFaceTimeInviteDemuxer);
    faceTimeInviteDemuxer = v19->_faceTimeInviteDemuxer;
    v19->_faceTimeInviteDemuxer = v23;

    v25 = [[CSDFaceTimeIDSProviderDelegate alloc] initWithQueue:v15];
    faceTimeIDSProviderDelegate = v19->_faceTimeIDSProviderDelegate;
    v19->_faceTimeIDSProviderDelegate = v25;

    [(CSDFaceTimeIDSProviderDelegate *)v19->_faceTimeIDSProviderDelegate setFaceTimeDemuxerDelegate:v19];
    v27 = [[CSDFaceTimeIMAVProviderDelegate alloc] initWithQueue:v15];
    faceTimeIMAVProviderDelegate = v19->_faceTimeIMAVProviderDelegate;
    v19->_faceTimeIMAVProviderDelegate = v27;

    [(CSDFaceTimeIMAVProviderDelegate *)v19->_faceTimeIMAVProviderDelegate setFaceTimeDemuxerDelegate:v19];
    v29 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    delayedActionsByCallUUID = v19->_delayedActionsByCallUUID;
    v19->_delayedActionsByCallUUID = v29;

    id v31 = objc_alloc_init((Class)CPApplicationController);
    v32 = [CSDIDSFirewallManager alloc];
    v33 = +[CSDFaceTimeMultiwayIDSService sharedInstance];
    v34 = objc_alloc_init(CSDSharedConversationServerBag);
    v35 = [(CSDIDSFirewallManager *)v32 initWithService:v33 chManager:v17 featureFlags:v16 serverBag:v34 queue:v15];
    firewallManager = v19->_firewallManager;
    v19->_firewallManager = v35;

    [(CSDIDSFirewallManager *)v19->_firewallManager updateFirewallWithCallHistoryIfNecessary];
    v37 = objc_alloc_init(CSDConversationInvitationResolver);
    v38 = [CSDConversationManager alloc];
    v39 = +[CSDReportingController sharedInstanceWithQueue:v15];
    v40 = [(CSDConversationManager *)v38 initWithReportingController:v39 cpApplicationController:v31 invitationResolver:v37];
    conversationManager = v19->_conversationManager;
    v19->_conversationManager = v40;

    v42 = [[CSDConversationManagerXPCServer alloc] initWithConversationManager:v19->_conversationManager featureFlags:v19->_featureFlags];
    conversationManagerXPCServer = v19->_conversationManagerXPCServer;
    v19->_conversationManagerXPCServer = v42;

    v44 = +[FTDeviceSupport sharedInstance];
    id v45 = [v44 deviceType];

    if (v45 != (id)7 && (TUSharePlayForceDisabled() & 1) == 0)
    {
      v46 = +[TUCallCenter sharedInstance];
      uint64_t v47 = [v46 neighborhoodActivityConduit];
      neighborhoodActivityConduit = v19->_neighborhoodActivityConduit;
      v19->_neighborhoodActivityConduit = (TUNeighborhoodActivityConduit *)v47;

      v49 = [CSDConduitLifecycleController alloc];
      v50 = +[TUCallCenter sharedInstance];
      v51 = [v50 conversationManager];
      v52 = [(CSDConduitLifecycleController *)v49 initWithConversationManager:v51 delegate:v19->_neighborhoodActivityConduit];
      [(TUNeighborhoodActivityConduit *)v19->_neighborhoodActivityConduit setConduitLifecycleController:v52];
    }
    v53 = (CPBiomeSessionDonator *)[objc_alloc((Class)CPBiomeSessionDonator) initWithDataSource:v19->_conversationManager parentQueue:v15];
    cpBiomeStreamDonator = v19->_cpBiomeStreamDonator;
    v19->_cpBiomeStreamDonator = v53;

    v55 = (CPConversationManagerHost *)[objc_alloc((Class)CPConversationManagerHost) initWithDataSource:v19->_conversationManager];
    conversationManagerHost = v19->_conversationManagerHost;
    v19->_conversationManagerHost = v55;

    v57 = (CPApplicationMonitor *)[objc_alloc((Class)CPApplicationMonitor) initWithApplicationController:v31 queue:v15];
    applicationMonitor = v19->_applicationMonitor;
    v19->_applicationMonitor = v57;

    [(CSDConversationManager *)v19->_conversationManager addObserver:v19->_applicationMonitor queue:v15];
    v59 = [[CSDFaceTimeConversationProviderDelegate alloc] initWithConversationManager:v19->_conversationManager queue:v15 invitationResolver:v37];
    faceTimeConversationProviderDelegate = v19->_faceTimeConversationProviderDelegate;
    v19->_faceTimeConversationProviderDelegate = v59;

    [(CSDAbstractFaceTimeConversationProviderDelegate *)v19->_faceTimeConversationProviderDelegate setFaceTimeDemuxerDelegate:v19];
    if ([v16 groupFacetimeAsAServiceEnabled])
    {
      v61 = [[CSDGFTServiceConversationProviderDelegate alloc] initWithConversationManager:v19->_conversationManager queue:v15 invitationResolver:v37];
      groupFaceTimeServiceProviderDelegate = v19->_groupFaceTimeServiceProviderDelegate;
      v19->_groupFaceTimeServiceProviderDelegate = v61;

      [(CSDAbstractFaceTimeConversationProviderDelegate *)v19->_groupFaceTimeServiceProviderDelegate setFaceTimeDemuxerDelegate:v19];
      objc_initWeak(&location, v19);
      v77[0] = _NSConcreteStackBlock;
      v77[1] = 3221225472;
      v77[2] = sub_1000C78C4;
      v77[3] = &unk_100506F68;
      objc_copyWeak(&v78, &location);
      v63 = +[CSDConversationProviderManager sharedInstance];
      [v63 setBeginListeningBlock:v77];

      objc_destroyWeak(&v78);
      objc_destroyWeak(&location);
    }
    int v64 = TUSimulatedModeEnabled();
    v65 = &off_100502C58;
    v66 = v19->_conversationManager;
    if (!v64) {
      v65 = off_100502BD0;
    }
    v67 = [(__objc2_class *)*v65 sharedInstance];
    [(CSDConversationManager *)v66 beginListeningOnService:v67];

    [(CSDConversationManager *)v19->_conversationManager generateAllInactiveLinks];
    id v68 = objc_alloc((Class)CXInProcessProvider);
    v69 = [(CSDFaceTimeProviderDelegate *)v19 providerConfiguration];
    v70 = (CXProvider *)[v68 initWithConfiguration:v69 callSource:v14];
    provider = v19->_provider;
    v19->_provider = v70;

    [(CXProvider *)v19->_provider setDelegate:v19 queue:v19->_queue];
    v72 = [(CSDFaceTimeProviderDelegate *)v19 featureFlags];
    LODWORD(v69) = [v72 ftAppDeletionEnabled];

    if (v69)
    {
      v73 = [[CSDFaceTimeInstallationNotifier alloc] initWithQueue:v19->_queue];
      facetimeInstallationNotifier = v19->_facetimeInstallationNotifier;
      v19->_facetimeInstallationNotifier = v73;
    }
  }

  return v19;
}

- (void)dealloc
{
  v3 = [(CSDFaceTimeProviderDelegate *)self conversationManagerXPCServer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)CSDFaceTimeProviderDelegate;
  [(CSDFaceTimeProviderDelegate *)&v4 dealloc];
}

- (id)providerConfiguration
{
  id v2 = objc_alloc_init((Class)CXProviderConfiguration);
  [v2 setMaximumCallGroups:2];
  [v2 setMaximumCallsPerCallGroup:1];
  [v2 setSupportsAudioOnly:1];
  [v2 setSupportsVideo:1];
  v3 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", &off_100523AD0, &off_100523AE8, 0);
  [v2 setSupportedHandleTypes:v3];

  return v2;
}

- (id)ISOCountryCodeForCallWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  v6 = [v5 ISOCountryCodeForCallWithUUID:v4];

  return v6;
}

- (void)updateProviderConfigurationWithSenderIdentities:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  [v5 updateProviderConfigurationWithSenderIdentities:v4];
}

- (void)deferReportingAudioFinishedForCallWithUUID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 1750000000);
  v6 = [(CSDFaceTimeProviderDelegate *)self queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000C7C74;
  v8[3] = &unk_100504F10;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, v6, v8);
}

- (void)_createDelayedActionListIfNecessary:(id)a3
{
  id v8 = a3;
  id v4 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
  dispatch_time_t v5 = [v4 objectForKeyedSubscript:v8];

  if (!v5)
  {
    id v6 = objc_alloc_init((Class)NSMutableArray);
    id v7 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

- (void)_processDelayedActionList:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
  id v9 = [v8 objectForKeyedSubscript:v6];

  if (v9)
  {
    id v10 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
    id v11 = [v10 objectForKeyedSubscript:v6];
    id v12 = [v11 copy];

    v13 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
    [v13 setObject:0 forKeyedSubscript:v6];

    id v14 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v15 = [v14 _callWithUUID:v6];

    id v16 = sub_100008DCC();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
    if (v15)
    {
      if (v17)
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Processing delayed actions:%@", buf, 0xCu);
      }

      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v16 = v12;
      id v18 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v18)
      {
        id v19 = v18;
        uint64_t v20 = *(void *)v23;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(void *)v23 != v20) {
              objc_enumerationMutation(v16);
            }
            -[CSDFaceTimeProviderDelegate provider:performSetRelayingCallAction:](self, "provider:performSetRelayingCallAction:", v7, *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
          }
          id v19 = [v16 countByEnumeratingWithState:&v22 objects:v26 count:16];
        }
        while (v19);
      }
    }
    else if (v17)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not processing delayed actions because we no longer have a call", buf, 2u);
    }
  }
}

- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 startedConnectingAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "providerDelegate: %@ callUUID: %@ dateStartedConnecting: %@", (uint8_t *)&v16, 0x20u);
  }

  id v12 = [(CSDFaceTimeProviderDelegate *)self provider];
  [v12 reportOutgoingCallWithUUID:v9 startedConnectingAtDate:v10];

  [(CSDFaceTimeProviderDelegate *)self providerDelegate:v8 endOtherProvidersCallWithUUID:v9];
  v13 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
  id v14 = [v13 _callWithUUID:v9];

  if (!v14)
  {
    id v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Ending call since dataSource is not tracking any call for callUUID: %@", (uint8_t *)&v16, 0xCu);
    }

    [v8 endCallWithUUIDAsLocalHangup:v9];
  }
}

- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 connectedAtDate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "providerDelegate: %@ callUUID: %@ dateConnected: %@", (uint8_t *)&v16, 0x20u);
  }

  id v12 = [(CSDFaceTimeProviderDelegate *)self provider];
  [v12 reportOutgoingCallWithUUID:v9 connectedAtDate:v10];

  [(CSDFaceTimeProviderDelegate *)self providerDelegate:v8 endOtherProvidersCallWithUUID:v9];
  v13 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
  id v14 = [v13 _callWithUUID:v9];

  if (!v14)
  {
    id v15 = sub_100008DCC();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 138412290;
      id v17 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Ending call since dataSource is not tracking any call for callUUID: %@", (uint8_t *)&v16, 0xCu);
    }

    [v8 endCallWithUUIDAsLocalHangup:v9];
  }
}

- (void)providerDelegate:(id)a3 callWithUUID:(id)a4 endedAtDate:(id)a5 withReason:(int64_t)a6 failureContext:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = sub_100008DCC();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    id v59 = v11;
    __int16 v60 = 2112;
    id v61 = v12;
    __int16 v62 = 2112;
    int64_t v63 = (int64_t)v13;
    __int16 v64 = 2048;
    int64_t v65 = a6;
    __int16 v66 = 2112;
    id v67 = v14;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "providerDelegate: %@ callUUID: %@ dateEnded: %@ endedReason: %ld failureContext: %@", buf, 0x34u);
  }

  id v16 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];

  id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v18 = v17;
  if (v16 == v11)
  {
    v57[0] = v17;
    id v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    v57[1] = v21;
    long long v22 = v57;
  }
  else
  {

    if (v18 == v11)
    {
      id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
      v56[0] = v18;
      id v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
      v56[1] = v21;
      long long v22 = v56;
    }
    else
    {
      id v19 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];

      if (v19 != v11)
      {
        __int16 v20 = 0;
        goto LABEL_11;
      }
      id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
      v55[0] = v18;
      id v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
      v55[1] = v21;
      long long v22 = v55;
    }
  }
  __int16 v20 = +[NSArray arrayWithObjects:v22 count:2];

LABEL_11:
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v23 = v20;
  id v24 = [v23 countByEnumeratingWithState:&v49 objects:v54 count:16];
  id v42 = v11;
  id obj = v23;
  id v40 = v14;
  id v41 = v13;
  if (v24)
  {
    id v25 = v24;
    int v26 = 0;
    int v27 = 0;
    uint64_t v28 = *(void *)v50;
LABEL_13:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v50 != v28) {
        objc_enumerationMutation(obj);
      }
      v30 = *(void **)(*((void *)&v49 + 1) + 8 * v29);
      v27 |= objc_msgSend(v30, "hasCallStartedConnectingWithUUID:", v12, v40, v41, v42);
      v26 |= [v30 isManagingCallWithUUID:v12];
      if (v27 & 1) != 0 && (v26) {
        goto LABEL_39;
      }
      if (v25 == (id)++v29)
      {
        id v23 = obj;
        id v25 = [obj countByEnumeratingWithState:&v49 objects:v54 count:16];
        if (v25) {
          goto LABEL_13;
        }

        id v13 = v41;
        id v11 = v42;
        id v14 = v40;
        if ((v27 & 1) == 0) {
          goto LABEL_23;
        }
        goto LABEL_40;
      }
    }
  }

  LOBYTE(v26) = 0;
LABEL_23:
  if (a6 == 2)
  {
LABEL_26:
    id v31 = [(CSDFaceTimeProviderDelegate *)self provider];
    v32 = v31;
    if (v14) {
      [v31 reportCallWithUUID:v12 failedAtDate:v13 withContext:v14];
    }
    else {
      [v31 reportCallWithUUID:v12 endedAtDate:v13 privateReason:a6];
    }

    [(CSDFaceTimeProviderDelegate *)self deferReportingAudioFinishedForCallWithUUID:v12];
LABEL_30:
    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v33 = v23;
    id v34 = [v33 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v34)
    {
      id v35 = v34;
      uint64_t v36 = *(void *)v46;
      do
      {
        for (i = 0; i != v35; i = (char *)i + 1)
        {
          if (*(void *)v46 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v45 + 1) + 8 * i);
          v39 = sub_100008DCC();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            id v59 = v12;
            __int16 v60 = 2112;
            id v61 = v38;
            __int16 v62 = 2048;
            int64_t v63 = a6;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Ending call with UUID %@ on other provider delegate %@ because ended reason was %ld", buf, 0x20u);
          }

          [v38 endCallWithUUIDAsDeclinedElsewhere:v12];
        }
        id v35 = [v33 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v35);
    }
LABEL_39:
    id v23 = obj;

    id v13 = v41;
    id v11 = v42;
    id v14 = v40;
    goto LABEL_40;
  }
  if ((v26 & ([v14 failureReason] != (id)4)) == 0)
  {
    if (a6 == -1) {
      goto LABEL_30;
    }
    goto LABEL_26;
  }
LABEL_40:
}

- (void)providerDelegate:(id)a3 requestedTransaction:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = sub_100008DCC();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = v8;
    __int16 v15 = 2112;
    id v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "providerDelegate: %@ transaction: %@", (uint8_t *)&v13, 0x16u);
  }

  id v12 = [(CSDFaceTimeProviderDelegate *)self provider];
  [v12 requestTransaction:v9 completion:v10];
}

- (void)providerDelegate:(id)a3 requestedUpgradeToExistingCallForConversation:(id)a4 withSessionToken:(id)a5 completion:(id)a6
{
  id v9 = (void (**)(id, id, id, id, id, void *, void *, void *))a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v21 = [v12 upgradeCallForConversation:v11 withSessionToken:v10];

  int v13 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v14 = [v13 callForConversation:v11 withSessionToken:v10];

  id v15 = [v14 isMuted];
  id v16 = [v14 isSendingVideo];
  id v17 = [v14 isVideo];
  id v18 = [v14 upgradeSessionUUID];
  id v19 = [v14 handle];
  __int16 v20 = [v14 remoteFromID];
  v9[2](v9, v21, v15, v16, v17, v18, v19, v20);
}

- (BOOL)providerDelegate:(id)a3 isManagingCallWithUUID:(id)a4
{
  id v5 = a4;
  id v6 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
  id v7 = [v6 _callWithUUID:v5];

  return v7 != 0;
}

- (BOOL)providerDelegate:(id)a3 isExclusivelyManagingCallWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];

  id v9 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v10 = v9;
  if (v8 == v6)
  {
LABEL_7:
    if (([v9 isManagingCallWithUUID:v7] & 1) == 0)
    {
      int v13 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
LABEL_12:
      id v14 = v13;
      unsigned int v12 = [v13 isManagingCallWithUUID:v7] ^ 1;

      goto LABEL_13;
    }
LABEL_8:
    LOBYTE(v12) = 0;
LABEL_13:

    goto LABEL_14;
  }

  if (v10 == v6)
  {
    id v9 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    id v10 = v9;
    goto LABEL_7;
  }
  id v11 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];

  if (v11 == v6)
  {
    id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    if (([v10 isManagingCallWithUUID:v7] & 1) == 0)
    {
      int v13 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
      goto LABEL_12;
    }
    goto LABEL_8;
  }
  LOBYTE(v12) = 0;
LABEL_14:

  return v12;
}

- (void)providerDelegate:(id)a3 endOtherProvidersCallWithUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100008DCC();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412546;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "providerDelegate: %@ ending callUUID %@", (uint8_t *)&v16, 0x16u);
  }

  id v9 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];

  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = v10;
  if (v9 == v6) {
    goto LABEL_9;
  }

  if (v11 == v6)
  {
    id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    id v11 = v10;
LABEL_9:
    [v10 endCallWithUUIDAsAnsweredElsewhere:v7];

    id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    goto LABEL_10;
  }
  id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];

  if (v12 == v6)
  {
    int v13 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v13 endCallWithUUIDAsAnsweredElsewhere:v7];

    id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
LABEL_10:
    id v15 = v14;
    [v14 endCallWithUUIDAsAnsweredElsewhere:v7];
  }
}

- (void)providerDidBegin:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  [v6 providerDidBegin:v4];

  id v7 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  [v7 providerDidBegin:v4];

  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  [v8 providerDidBegin:v4];

  id v9 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  [v9 providerDidBegin:v4];
}

- (void)providerDidReset:(id)a3
{
  id v4 = a3;
  id v5 = [(CSDFaceTimeProviderDelegate *)self queue];
  dispatch_assert_queue_V2(v5);

  id v6 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  [v6 providerDidReset:v4];

  id v7 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  [v7 providerDidReset:v4];

  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  [v8 providerDidReset:v4];

  id v9 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  [v9 providerDidReset:v4];
}

- (void)provider:(id)a3 timedOutPerformingAction:(id)a4
{
  id v4 = a4;
  id v5 = sub_100008DCC();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[WARN] action: %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)provider:(id)a3 performStartCallAction:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(CSDFaceTimeProviderDelegate *)self provider:v7 performStartCallAction:v6 shouldUseIDSDemuxer:[(CSDFaceTimeProviderDelegate *)self shouldUseIDSDemuxer]];
}

- (void)provider:(id)a3 performStartCallAction:(id)a4 shouldUseIDSDemuxer:(BOOL)a5
{
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v58 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "action: %@", buf, 0xCu);
  }

  id v11 = [(CSDFaceTimeProviderDelegate *)self blockUtilities];
  id v12 = [(__CFString *)v9 handle];
  int v13 = +[NSSet setWithObject:v12];
  id v14 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
  uint64_t v15 = (uint64_t)[v11 blockCallReasonForHandles:v13 providerIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider" callDataSource:v14];

  if (v15 >= 1)
  {
    int v16 = [(CSDFaceTimeProviderDelegate *)self blockUtilities];
    id v17 = [(__CFString *)v9 callUUID];
    [(__CFString *)v16 reportFailureForReason:v15 provider:v8 callUUID:v17 actionToFail:v9];
    goto LABEL_27;
  }
  if (!a5)
  {
    int v16 = [(__CFString *)v9 handle];
    id v17 = [(__CFString *)v16 value];
    id v40 = [v17 IDSFormattedDestinationID];
    id v41 = +[NSArray arrayWithObject:v40];
    [(CSDFaceTimeProviderDelegate *)self initiateModernFTInviteForAction:v9 destinations:v41 excludedIMAVDestinations:&__NSArray0__struct joinCallActionToFulfill:0];

    goto LABEL_27;
  }
  int v16 = +[TUCallCapabilities outgoingRelayCallerID];
  __int16 v18 = sub_100008DCC();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v58 = v16;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "outgoingCallerID: %@", buf, 0xCu);
  }

  id v17 = +[NSDate now];
  id v19 = [(__CFString *)v9 callUUID];
  [(CSDFaceTimeProviderDelegate *)self _createDelayedActionListIfNecessary:v19];

  __int16 v20 = [(CSDFaceTimeProviderDelegate *)self featureFlags];
  if ([v20 uPlusOneSessionWithCapabilitiesEnabled])
  {
    id v21 = [(CSDFaceTimeProviderDelegate *)self serverBag];
    unsigned int v22 = [v21 isUPlusOneSessionCapabilitiesEnabled];

    if (v22)
    {
      id v23 = [(CSDFaceTimeProviderDelegate *)self _createJoinCallAction:v9 outgoingCallerID:v16 gftOneToOneDestinations:0];
      id v24 = +[NSDate now];
      [v24 timeIntervalSinceDate:v17];
      double v26 = v25 * 1000.0;

      if (v26 > 5000.0)
      {
        uint64_t v61 = TUCallTUStartCallActionDuration;
        int v27 = +[NSNumber numberWithDouble:v26];
        uint64_t v28 = [v27 stringValue];
        uint64_t v29 = [v28 stringByAppendingString:@"ms duration"];
        __int16 v62 = v29;
        v30 = +[NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];

        id v31 = sub_100008DCC();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [(__CFString *)v9 callUUID];
          *(_DWORD *)buf = 138412546;
          CFStringRef v58 = v32;
          __int16 v59 = 2112;
          CFStringRef v60 = v30;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "reportJoinDurationLongerThanThreasholdForCallUUID: %@, %@", buf, 0x16u);
        }
        id v33 = +[CSDReportingController sharedInstance];
        id v34 = [(__CFString *)v9 callUUID];
        [v33 reportJoinDurationLongerThanThreasholdForCallUUID:v34 report:v30];
      }
      id v35 = sub_100008DCC();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v58 = v23;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Created join call action without gftOneToOneDestinations: %@", buf, 0xCu);
      }

      [(CSDFaceTimeProviderDelegate *)self provider:v8 performJoinCallAction:v23 shouldUseIDSDemuxer:0];
      uint64_t v36 = [(__CFString *)v9 handle];
      v37 = [v36 value];
      v38 = [v37 IDSFormattedDestinationID];
      v39 = +[NSArray arrayWithObject:v38];
      [(CSDFaceTimeProviderDelegate *)self initiateModernFTInviteForAction:v9 destinations:v39 excludedIMAVDestinations:&__NSArray0__struct joinCallActionToFulfill:0];

      goto LABEL_27;
    }
  }
  else
  {
  }
  id v42 = sub_100008DCC();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
  {
    v43 = [(CSDFaceTimeProviderDelegate *)self featureFlags];
    if ([v43 uPlusOneSessionWithCapabilitiesEnabled]) {
      CFStringRef v44 = @"YES";
    }
    else {
      CFStringRef v44 = @"NO";
    }
    long long v45 = [(CSDFaceTimeProviderDelegate *)self serverBag];
    unsigned int v46 = [v45 isUPlusOneSessionCapabilitiesEnabled];
    CFStringRef v47 = @"NO";
    if (v46) {
      CFStringRef v47 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    CFStringRef v58 = v44;
    __int16 v59 = 2112;
    CFStringRef v60 = v47;
    _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "uPlusOneSessionWithCapabilitiesEnabled: %@, isUPlusOneSessionCapabilitiesEnabled: %@", buf, 0x16u);
  }
  long long v48 = [(CSDFaceTimeProviderDelegate *)self faceTimeInviteDemuxer];
  long long v49 = [(__CFString *)v9 handle];
  long long v50 = [v49 tuHandle];
  id v51 = [(__CFString *)v9 isVideo];
  v52[0] = _NSConcreteStackBlock;
  v52[1] = 3221225472;
  v52[2] = sub_1000C96F4;
  v52[3] = &unk_100506FB8;
  v52[4] = self;
  v53 = v9;
  int v16 = v16;
  v54 = v16;
  id v17 = v17;
  id v55 = v17;
  id v56 = v8;
  [v48 idsPeersForHandle:v50 video:v51 fromID:v16 completionHandler:v52];

LABEL_27:
}

- (void)initiateModernFTInviteForAction:(id)a3 destinations:(id)a4 excludedIMAVDestinations:(id)a5 joinCallActionToFulfill:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = +[NSSet setWithArray:v13];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1000C9F00;
  v19[3] = &unk_100506FE0;
  v19[4] = self;
  id v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  [v14 inviteIDSPeersWithAction:v18 destinations:v15 joinCallActionToFulfill:v16 completion:v19];
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if ([(CSDFaceTimeProviderDelegate *)self shouldUseIDSDemuxer])
  {
    id v7 = [v6 remoteMembers];
    if ([v7 count] == (id)1)
    {
      id v8 = [v6 associationIdentifier];
      [(CSDFaceTimeProviderDelegate *)self provider:v9 performJoinCallAction:v6 shouldUseIDSDemuxer:v8 == 0];
    }
    else
    {
      [(CSDFaceTimeProviderDelegate *)self provider:v9 performJoinCallAction:v6 shouldUseIDSDemuxer:0];
    }
  }
  else
  {
    [(CSDFaceTimeProviderDelegate *)self provider:v9 performJoinCallAction:v6 shouldUseIDSDemuxer:0];
  }
}

- (void)provider:(id)a3 performJoinCallAction:(id)a4 shouldUseIDSDemuxer:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = (__CFString *)a4;
  id v10 = sub_100008DCC();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(__CFString *)v9 UUID];
    *(_DWORD *)buf = 138412290;
    CFStringRef v79 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Perform join call with action UUID: %@", buf, 0xCu);
  }
  id v12 = [(CSDFaceTimeProviderDelegate *)self blockUtilities];
  id v13 = [(__CFString *)v9 remoteMembers];
  id v14 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
  uint64_t v15 = (uint64_t)[v12 blockCallReasonForHandles:v13 providerIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider" callDataSource:v14];

  if (v15 < 1)
  {
    id v18 = [(__CFString *)v9 pseudonym];
    if ([v18 length])
    {
      id v19 = [(__CFString *)v9 publicKey];
      id v20 = [v19 length];

      if (v20)
      {
        int v21 = 1;
        goto LABEL_11;
      }
    }
    else
    {
    }
    id v22 = [(__CFString *)v9 remoteMembers];
    id v23 = [v22 count];

    if (!v23)
    {
      int v27 = sub_100008DCC();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1003AA75C();
      }
      goto LABEL_24;
    }
    int v21 = 0;
LABEL_11:
    id v24 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    double v25 = [(__CFString *)v9 callUUID];
    unsigned int v26 = [v24 isUpgradingCallWithUUID:v25];

    if (v26)
    {
      int v27 = sub_100008DCC();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1003AA790();
      }
LABEL_24:

      [(__CFString *)v9 fail];
      goto LABEL_57;
    }
    if (([(__CFString *)v9 isVideo] & 1) == 0
      && [(__CFString *)v9 isVideoEnabled])
    {
      int v27 = sub_100008DCC();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1003AA7C4();
      }
      goto LABEL_24;
    }
    uint64_t v28 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    uint64_t v29 = [(__CFString *)v9 callUUID];
    unsigned int v30 = [v28 isManagingCallWithUUID:v29];

    if (v30)
    {
      [(__CFString *)v9 setUpgrade:1];
      id v31 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
      v32 = [(__CFString *)v9 callUUID];
      id v33 = [v31 upgradeSessionUUIDForCallWithUUID:v32];
      [(__CFString *)v9 setUpgradeSessionUUID:v33];

      id v34 = sub_100008DCC();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v79 = v9;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Updated to action: %@", buf, 0xCu);
      }

      id v35 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
      [v35 provider:v8 performJoinCallAction:v9];
    }
    else
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
      v37 = [(__CFString *)v9 callUUID];
      unsigned int v38 = [v36 isManagingCallWithUUID:v37];

      if (!v38)
      {
LABEL_30:
        id v41 = +[CSDConversationProviderManager sharedInstance];
        id v42 = [(__CFString *)v9 conversationProviderIdentifier];
        v43 = [v41 tuConversationProviderForIdentifier:v42];

        if (((v21 | !v5) & 1) == 0 && [v43 isDefaultProvider])
        {
          CFStringRef v44 = [(__CFString *)v9 callUUID];
          [(CSDFaceTimeProviderDelegate *)self _createDelayedActionListIfNecessary:v44];

          long long v45 = +[TUCallCapabilities outgoingRelayCallerID];
          unsigned int v46 = sub_100008DCC();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v79 = v45;
            _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "joinCall: callerID: %@", buf, 0xCu);
          }

          CFStringRef v47 = [(CSDFaceTimeProviderDelegate *)self featureFlags];
          if ([v47 uPlusOneSessionWithCapabilitiesEnabled])
          {
            long long v48 = [(CSDFaceTimeProviderDelegate *)self serverBag];
            unsigned int v49 = [v48 isUPlusOneSessionCapabilitiesEnabled];

            if (v49)
            {
              long long v50 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
              [v50 provider:v8 performJoinCallAction:v9];

              id v51 = objc_alloc((Class)CXStartCallAction);
              long long v52 = [(__CFString *)v9 callUUID];
              v53 = [(__CFString *)v9 remoteMembers];
              v54 = [v53 anyObject];
              id v55 = [v51 initWithCallUUID:v52 handle:v54];

              objc_msgSend(v55, "setVideo:", -[__CFString isVideo](v9, "isVideo"));
              id v56 = [v55 handle];
              v57 = [v56 value];
              CFStringRef v58 = [v57 IDSFormattedDestinationID];
              __int16 v59 = +[NSArray arrayWithObject:v58];
              [(CSDFaceTimeProviderDelegate *)self initiateModernFTInviteForAction:v55 destinations:v59 excludedIMAVDestinations:&__NSArray0__struct joinCallActionToFulfill:0];

              goto LABEL_55;
            }
          }
          else
          {
          }
          __int16 v64 = sub_100008DCC();
          if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v65 = [(CSDFaceTimeProviderDelegate *)self featureFlags];
            if ([v65 uPlusOneSessionWithCapabilitiesEnabled]) {
              CFStringRef v66 = @"YES";
            }
            else {
              CFStringRef v66 = @"NO";
            }
            id v67 = [(CSDFaceTimeProviderDelegate *)self serverBag];
            unsigned int v68 = [v67 isUPlusOneSessionCapabilitiesEnabled];
            CFStringRef v69 = @"NO";
            if (v68) {
              CFStringRef v69 = @"YES";
            }
            *(_DWORD *)buf = 138412546;
            CFStringRef v79 = v66;
            __int16 v80 = 2112;
            CFStringRef v81 = v69;
            _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "uPlusOneSessionWithCapabilitiesEnabled: %@, isUPlusOneSessionCapabilitiesEnabled: %@", buf, 0x16u);
          }
          v70 = [(CSDFaceTimeProviderDelegate *)self faceTimeInviteDemuxer];
          v71 = [(__CFString *)v9 remoteMembers];
          v72 = [v71 anyObject];
          v73 = [v72 tuHandle];
          id v74 = [(__CFString *)v9 isVideo];
          v75[0] = _NSConcreteStackBlock;
          v75[1] = 3221225472;
          v75[2] = sub_1000CAC9C;
          v75[3] = &unk_100507030;
          v75[4] = self;
          id v76 = v9;
          id v77 = v8;
          [v70 idsPeersForHandle:v73 video:v74 fromID:v45 completionHandler:v75];

          goto LABEL_55;
        }
        if (!v43)
        {
LABEL_56:

          goto LABEL_57;
        }
        unsigned int v60 = [v43 isDefaultProvider];
        uint64_t v61 = sub_100008DCC();
        BOOL v62 = os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT);
        if (v60)
        {
          if (v62)
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v79 = v9;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Sending JoinCallAction to FaceTimeConversationProviderDelegate- action: %@", buf, 0xCu);
          }

          int64_t v63 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
        }
        else
        {
          if (v62)
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v79 = v9;
            _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "Sending JoinCallAction to CSDGFTServiceConversationProviderDelegate- action: %@", buf, 0xCu);
          }

          int64_t v63 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
        }
        long long v45 = v63;
        [(__CFString *)v63 provider:v8 performJoinCallAction:v9];
LABEL_55:

        goto LABEL_56;
      }
      v39 = sub_100008DCC();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v79 = v9;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Found a IMAV chat that is being tracked for action: %@", buf, 0xCu);
      }

      id v35 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
      id v40 = [(__CFString *)v9 callUUID];
      [v35 endCallWithUUID:v40];
    }
    goto LABEL_30;
  }
  id v16 = [(CSDFaceTimeProviderDelegate *)self blockUtilities];
  id v17 = [(__CFString *)v9 callUUID];
  [v16 reportFailureForReason:v15 provider:v8 callUUID:v17 actionToFail:v9];

LABEL_57:
}

- (void)provider:(id)a3 performAnswerCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performAnswerCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performAnswerCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performAnswerCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performAnswerCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performEndCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    id v31 = v48 = v6;
    v32 = [v7 callUUID];
    unsigned __int8 v47 = [v31 isManagingCallWithUUID:v32];

    id v6 = v48;
    if (v47) {
      goto LABEL_7;
    }
    id v33 = sub_100008DCC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v7;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v34 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v35 = [v7 callUUID];
    uint64_t v36 = [v34 _callWithUUID:v35];

    if (v36)
    {
      v37 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      uint64_t v38 = [v7 callUUID];
      uint64_t v39 = [v37 objectForKeyedSubscript:v38];
      if (v39)
      {
        id v40 = (void *)v39;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v42 = sub_100008DCC();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v7;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          v43 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          CFStringRef v44 = [v7 callUUID];
          long long v45 = [v43 objectForKeyedSubscript:v44];
          [v45 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        unsigned __int8 v46 = sub_100008DCC();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v7;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performEndCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performEndCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performEndCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performEndCallAction:v7];
  }
LABEL_15:
  unsigned int v30 = [v7 callUUID];
  [(CSDFaceTimeProviderDelegate *)self deferReportingAudioFinishedForCallWithUUID:v30];
}

- (void)provider:(id)a3 performSetHeldCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performSetHeldCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performSetHeldCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performSetHeldCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performSetHeldCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performSetSendingVideoCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performSetSendingVideoCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performSetSendingVideoCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performSetSendingVideoCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performSetSendingVideoCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performSetSharingScreenCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performSetSharingScreenCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performSetSharingScreenCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performSetSharingScreenCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performSetSharingScreenCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performSetScreenShareAttributesCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performSetScreenShareAttributesCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performSetScreenShareAttributesCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performSetScreenShareAttributesCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performSetScreenShareAttributesCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performEnableVideoCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performEnableVideoCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performEnableVideoCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performEnableVideoCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performEnableVideoCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performSetVideoPresentationSizeCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performSetVideoPresentationSizeCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performSetVideoPresentationSizeCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performSetVideoPresentationSizeCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performSetVideoPresentationSizeCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performSetVideoPresentationStateCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performSetVideoPresentationStateCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performSetVideoPresentationStateCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performSetVideoPresentationStateCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performSetVideoPresentationStateCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performSetRelayingCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performSetRelayingCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performSetRelayingCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performSetRelayingCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performSetRelayingCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performSetScreeningCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performSetScreeningCallAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performSetScreeningCallAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performSetScreeningCallAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performSetScreeningCallAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performSetAllowUplinkAudioInjectionAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v9 = [v7 callUUID];
  if ([v8 isManagingCallWithUUID:v9]) {
    goto LABEL_6;
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v11 = [v7 callUUID];
  if (([v10 isManagingCallWithUUID:v11] & 1) == 0)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v13 = [v7 callUUID];
    if ([v12 isManagingCallWithUUID:v13])
    {

      goto LABEL_5;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    v30 = id v47 = v6;
    id v31 = [v7 callUUID];
    unsigned __int8 v46 = [v30 isManagingCallWithUUID:v31];

    id v6 = v47;
    if (v46) {
      goto LABEL_7;
    }
    v32 = sub_100008DCC();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v49 = v7;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v33 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v34 = [v7 callUUID];
    id v35 = [v33 _callWithUUID:v34];

    if (v35)
    {
      uint64_t v36 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      v37 = [v7 callUUID];
      uint64_t v38 = [v36 objectForKeyedSubscript:v37];
      if (v38)
      {
        uint64_t v39 = (void *)v38;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v41 = sub_100008DCC();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v49 = v7;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          id v42 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          v43 = [v7 callUUID];
          CFStringRef v44 = [v42 objectForKeyedSubscript:v43];
          [v44 addObject:v7];

          goto LABEL_33;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v35 status] == 5 || objc_msgSend(v35, "status") == 6))
      {
        long long v45 = sub_100008DCC();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v49 = v7;
          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_33;
      }
    }
    [v7 fail];
LABEL_33:

    goto LABEL_15;
  }
LABEL_5:

LABEL_6:
LABEL_7:
  id v14 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  uint64_t v15 = [v7 callUUID];
  unsigned int v16 = [v14 isManagingCallWithUUID:v15];

  if (v16)
  {
    id v17 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v17 provider:v6 performSetAllowUplinkAudioInjectionAction:v7];
  }
  id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v19 = [v7 callUUID];
  unsigned int v20 = [v18 isManagingCallWithUUID:v19];

  if (v20)
  {
    int v21 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v21 provider:v6 performSetAllowUplinkAudioInjectionAction:v7];
  }
  id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  id v23 = [v7 callUUID];
  unsigned int v24 = [v22 isManagingCallWithUUID:v23];

  if (v24)
  {
    double v25 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v25 provider:v6 performSetAllowUplinkAudioInjectionAction:v7];
  }
  unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  int v27 = [v7 callUUID];
  unsigned int v28 = [v26 isManagingCallWithUUID:v27];

  if (v28)
  {
    uint64_t v29 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v29 provider:v6 performSetAllowUplinkAudioInjectionAction:v7];
  }
LABEL_15:
}

- (void)provider:(id)a3 performSetMutedCallAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v7 isBottomUpMute] & 1) == 0)
  {
    id v8 = +[TUAudioSystemController sharedAudioSystemController];
    objc_msgSend(v8, "setUplinkMuted:", objc_msgSend(v7, "isMuted"));
  }
  id v9 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  id v10 = [v7 callUUID];
  if ([v9 isManagingCallWithUUID:v10]) {
    goto LABEL_8;
  }
  id v11 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  id v12 = [v7 callUUID];
  if (([v11 isManagingCallWithUUID:v12] & 1) == 0)
  {
    id v13 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    id v14 = [v7 callUUID];
    if ([v13 isManagingCallWithUUID:v14])
    {

      goto LABEL_7;
    }
    [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    id v31 = v48 = v6;
    v32 = [v7 callUUID];
    unsigned __int8 v47 = [v31 isManagingCallWithUUID:v32];

    id v6 = v48;
    if (v47) {
      goto LABEL_9;
    }
    id v33 = sub_100008DCC();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v50 = v7;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "[WARN] No provider delegate is managing call for action %@", buf, 0xCu);
    }

    id v34 = [(CSDFaceTimeProviderDelegate *)self callDataSource];
    id v35 = [v7 callUUID];
    uint64_t v36 = [v34 _callWithUUID:v35];

    if (v36)
    {
      v37 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
      uint64_t v38 = [v7 callUUID];
      uint64_t v39 = [v37 objectForKeyedSubscript:v38];
      if (v39)
      {
        id v40 = (void *)v39;
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass)
        {
          id v42 = sub_100008DCC();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v50 = v7;
            _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Delaying action %@", buf, 0xCu);
          }

          v43 = [(CSDFaceTimeProviderDelegate *)self delayedActionsByCallUUID];
          CFStringRef v44 = [v7 callUUID];
          long long v45 = [v43 objectForKeyedSubscript:v44];
          [v45 addObject:v7];

          goto LABEL_35;
        }
      }
      else
      {
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && ([v36 status] == 5 || objc_msgSend(v36, "status") == 6))
      {
        unsigned __int8 v46 = sub_100008DCC();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v7;
          _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Fulfilling action %@ because call has ended", buf, 0xCu);
        }

        [v7 fulfill];
        goto LABEL_35;
      }
    }
    [v7 fail];
LABEL_35:

    goto LABEL_17;
  }
LABEL_7:

LABEL_8:
LABEL_9:
  uint64_t v15 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
  unsigned int v16 = [v7 callUUID];
  unsigned int v17 = [v15 isManagingCallWithUUID:v16];

  if (v17)
  {
    id v18 = [(CSDFaceTimeProviderDelegate *)self faceTimeIDSProviderDelegate];
    [v18 provider:v6 performSetMutedCallAction:v7];
  }
  id v19 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
  unsigned int v20 = [v7 callUUID];
  unsigned int v21 = [v19 isManagingCallWithUUID:v20];

  if (v21)
  {
    id v22 = [(CSDFaceTimeProviderDelegate *)self faceTimeIMAVProviderDelegate];
    [v22 provider:v6 performSetMutedCallAction:v7];
  }
  id v23 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  unsigned int v24 = [v7 callUUID];
  unsigned int v25 = [v23 isManagingCallWithUUID:v24];

  if (v25)
  {
    unsigned int v26 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v26 provider:v6 performSetMutedCallAction:v7];
  }
  int v27 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  unsigned int v28 = [v7 callUUID];
  unsigned int v29 = [v27 isManagingCallWithUUID:v28];

  if (v29)
  {
    unsigned int v30 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v30 provider:v6 performSetMutedCallAction:v7];
  }
LABEL_17:
}

- (void)provider:(id)a3 didActivateAudioSession:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v9 provider:v13 didActivateAudioSession:v6];
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v12 provider:v13 didActivateAudioSession:v6];
  }
}

- (void)provider:(id)a3 didDeactivateAudioSession:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  id v7 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(CSDFaceTimeProviderDelegate *)self faceTimeConversationProviderDelegate];
    [v9 provider:v13 didDeactivateAudioSession:v6];
  }
  id v10 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(CSDFaceTimeProviderDelegate *)self groupFaceTimeServiceProviderDelegate];
    [v12 provider:v13 didDeactivateAudioSession:v6];
  }
}

- (id)_createJoinCallAction:(id)a3 outgoingCallerID:(id)a4 gftOneToOneDestinations:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc((Class)CXJoinCallAction);
  id v12 = [v8 callUUID];
  id v13 = +[NSUUID UUID];
  id v14 = [v11 initWithCallUUID:v12 groupUUID:v13];

  uint64_t v15 = [v8 handle];
  unsigned int v16 = +[NSSet setWithObject:v15];
  [v14 setRemoteMembers:v16];

  objc_msgSend(v14, "setVideoEnabled:", objc_msgSend(v8, "isVideo"));
  objc_msgSend(v14, "setVideo:", objc_msgSend(v8, "isVideo"));
  objc_msgSend(v14, "setRelay:", objc_msgSend(v8, "isRelay"));
  if ([v8 isVideo]) {
    uint64_t v17 = 2;
  }
  else {
    uint64_t v17 = 1;
  }
  [v14 setAvMode:v17];
  [v14 setPresentationMode:0];
  [v14 setConversationProviderIdentifier:@"com.apple.telephonyutilities.callservicesd.FaceTimeProvider"];
  if (v10)
  {
    id v18 = +[NSSet setWithArray:v10];
    [v14 setRemotePushTokens:v18];
  }
  id v19 = [v8 localSenderIdentityUUID];

  if (v19)
  {
    unsigned int v20 = [(CSDFaceTimeProviderDelegate *)self conversationManager];
    unsigned int v21 = [v8 localSenderIdentityUUID];
    id v22 = [v20 callerIDHandleForSenderIdentityUUID:v21 callerID:v9];

    if (v22)
    {
      id v23 = +[CXHandle handleWithTUHandle:v22];
      [v14 setCallerID:v23];
    }
  }

  return v14;
}

- (CSDConversationManagerXPCServer)conversationManagerXPCServer
{
  return self->_conversationManagerXPCServer;
}

- (CPConversationManagerHost)conversationManagerHost
{
  return self->_conversationManagerHost;
}

- (CPBiomeSessionDonator)cpBiomeStreamDonator
{
  return self->_cpBiomeStreamDonator;
}

- (CPApplicationMonitor)applicationMonitor
{
  return self->_applicationMonitor;
}

- (TUNeighborhoodActivityConduit)neighborhoodActivityConduit
{
  return self->_neighborhoodActivityConduit;
}

- (TUFeatureFlags)featureFlags
{
  return self->_featureFlags;
}

- (CSDConversationServerBag)serverBag
{
  return self->_serverBag;
}

- (void)setServerBag:(id)a3
{
}

- (CSDBlockUtilitiesProtocol)blockUtilities
{
  return self->_blockUtilities;
}

- (BOOL)shouldUseIDSDemuxer
{
  return self->_shouldUseIDSDemuxer;
}

- (CXProvider)provider
{
  return self->_provider;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (CSDFaceTimeInstallationNotifier)facetimeInstallationNotifier
{
  return self->_facetimeInstallationNotifier;
}

- (NSMutableDictionary)delayedActionsByCallUUID
{
  return self->_delayedActionsByCallUUID;
}

- (CSDIDSFirewallManager)firewallManager
{
  return self->_firewallManager;
}

- (void)setFirewallManager:(id)a3
{
}

- (CSDFaceTimeInviteDemuxer)faceTimeInviteDemuxer
{
  return self->_faceTimeInviteDemuxer;
}

- (void)setFaceTimeInviteDemuxer:(id)a3
{
}

- (CSDFaceTimeIDSProviderDelegate)faceTimeIDSProviderDelegate
{
  return self->_faceTimeIDSProviderDelegate;
}

- (void)setFaceTimeIDSProviderDelegate:(id)a3
{
}

- (CSDFaceTimeIMAVProviderDelegate)faceTimeIMAVProviderDelegate
{
  return self->_faceTimeIMAVProviderDelegate;
}

- (void)setFaceTimeIMAVProviderDelegate:(id)a3
{
}

- (CSDFaceTimeConversationProviderDelegate)faceTimeConversationProviderDelegate
{
  return self->_faceTimeConversationProviderDelegate;
}

- (void)setFaceTimeConversationProviderDelegate:(id)a3
{
}

- (CSDGFTServiceConversationProviderDelegate)groupFaceTimeServiceProviderDelegate
{
  return self->_groupFaceTimeServiceProviderDelegate;
}

- (void)setGroupFaceTimeServiceProviderDelegate:(id)a3
{
}

- (CSDConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (CSDRelayConversationManager)relayConversationManager
{
  return self->_relayConversationManager;
}

- (CSDProviderCallDataSource)callDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_callDataSource);

  return (CSDProviderCallDataSource *)WeakRetained;
}

- (void)setCallDataSource:(id)a3
{
}

- (CSDNeighborhoodActivityConduit)conduit
{
  return self->_conduit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conduit, 0);
  objc_destroyWeak((id *)&self->_callDataSource);
  objc_storeStrong((id *)&self->_relayConversationManager, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_groupFaceTimeServiceProviderDelegate, 0);
  objc_storeStrong((id *)&self->_faceTimeConversationProviderDelegate, 0);
  objc_storeStrong((id *)&self->_faceTimeIMAVProviderDelegate, 0);
  objc_storeStrong((id *)&self->_faceTimeIDSProviderDelegate, 0);
  objc_storeStrong((id *)&self->_faceTimeInviteDemuxer, 0);
  objc_storeStrong((id *)&self->_firewallManager, 0);
  objc_storeStrong((id *)&self->_delayedActionsByCallUUID, 0);
  objc_storeStrong((id *)&self->_facetimeInstallationNotifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_blockUtilities, 0);
  objc_storeStrong((id *)&self->_serverBag, 0);
  objc_storeStrong((id *)&self->_featureFlags, 0);
  objc_storeStrong((id *)&self->_neighborhoodActivityConduit, 0);
  objc_storeStrong((id *)&self->_applicationMonitor, 0);
  objc_storeStrong((id *)&self->_cpBiomeStreamDonator, 0);
  objc_storeStrong((id *)&self->_conversationManagerHost, 0);

  objc_storeStrong((id *)&self->_conversationManagerXPCServer, 0);
}

@end