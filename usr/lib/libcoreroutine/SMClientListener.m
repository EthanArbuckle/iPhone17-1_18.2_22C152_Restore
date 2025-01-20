@interface SMClientListener
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (RTAuthorizationManager)authorizationManager;
- (RTDefaultsManager)defaultsManager;
- (RTDistanceCalculator)distanceCalculator;
- (RTPlatform)platform;
- (SMAppDeletionManager)appDeletionManager;
- (SMClientListener)init;
- (SMClientListener)initWithDefaultsManager:(id)a3 authorizationManager:(id)a4 distanceCalculator:(id)a5 platform:(id)a6 initiatorService:(id)a7 messagingService:(id)a8 receiverService:(id)a9 sessionStore:(id)a10 suggestionsManager:(id)a11 suggestionsHelper:(id)a12 suggestionsStore:(id)a13 eligibilityChecker:(id)a14 deviceConfigurationChecker:(id)a15 appDeletionManager:(id)a16;
- (SMDeviceConfigurationChecker)deviceConfigurationChecker;
- (SMEligibilityChecker)eligibilityChecker;
- (SMInitiatorService)initiatorService;
- (SMMessagingService)messagingService;
- (SMReceiverService)receiverService;
- (SMSessionStore)sessionStore;
- (SMSuggestionsHelper)suggestionsHelper;
- (SMSuggestionsManager)suggestionsManager;
- (SMSuggestionsStore)suggestionsStore;
- (id)handleClientConnection:(id)a3;
- (void)_setup;
- (void)_setupConnection:(id)a3 forClient:(id)a4;
- (void)handleDisconnectionForDaemonClient:(id)a3;
- (void)setAppDeletionManager:(id)a3;
- (void)setAuthorizationManager:(id)a3;
- (void)setDefaultsManager:(id)a3;
- (void)setDeviceConfigurationChecker:(id)a3;
- (void)setDistanceCalculator:(id)a3;
- (void)setEligibilityChecker:(id)a3;
- (void)setInitiatorService:(id)a3;
- (void)setMessagingService:(id)a3;
- (void)setPlatform:(id)a3;
- (void)setReceiverService:(id)a3;
- (void)setSessionStore:(id)a3;
- (void)setSuggestionsHelper:(id)a3;
- (void)setSuggestionsManager:(id)a3;
- (void)setSuggestionsStore:(id)a3;
@end

@implementation SMClientListener

- (SMClientListener)init
{
  uint64_t v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_authorizationManager_distanceCalculator_platform_initiatorService_messagingService_receiverService_sessionStore_suggestionsManager_suggestionsHelper_suggestionsStore_eligibilityChecker_deviceConfigurationChecker_appDeletionManager_);
}

- (SMClientListener)initWithDefaultsManager:(id)a3 authorizationManager:(id)a4 distanceCalculator:(id)a5 platform:(id)a6 initiatorService:(id)a7 messagingService:(id)a8 receiverService:(id)a9 sessionStore:(id)a10 suggestionsManager:(id)a11 suggestionsHelper:(id)a12 suggestionsStore:(id)a13 eligibilityChecker:(id)a14 deviceConfigurationChecker:(id)a15 appDeletionManager:(id)a16
{
  id v131 = a3;
  id v113 = a4;
  id v21 = a4;
  id v114 = a5;
  id v121 = a5;
  id v130 = a6;
  id v115 = a7;
  id v129 = a7;
  id v128 = a8;
  id v127 = a9;
  id v118 = a10;
  id v126 = a11;
  id v125 = a12;
  id v124 = a13;
  id v123 = a14;
  id v122 = a15;
  id v22 = a16;
  v119 = v22;
  if (!v131)
  {
    v23 = v21;
    v106 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v106, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v103 = 0;
    v104 = 0;
    v24 = v121;
    goto LABEL_44;
  }
  v23 = v21;
  if (!v21)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = v121;
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: authorizationManager";
LABEL_42:
    _os_log_error_impl(&dword_1D9BFA000, v107, OS_LOG_TYPE_ERROR, v108, buf, 2u);
    goto LABEL_43;
  }
  v24 = v121;
  if (!v121)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: distanceCalculator";
    goto LABEL_42;
  }
  if (!v130)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: platform";
    goto LABEL_42;
  }
  if (!v129)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: initiatorService";
    goto LABEL_42;
  }
  if (!v128)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: messagingService";
    goto LABEL_42;
  }
  if (!v127)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: receiverService";
    goto LABEL_42;
  }
  if (!v126)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: suggestionsManager";
    goto LABEL_42;
  }
  if (!v125)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: suggestionsHelper";
    goto LABEL_42;
  }
  if (!v124)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: suggestionsStore";
    goto LABEL_42;
  }
  if (!v123)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
      goto LABEL_43;
    }
    *(_WORD *)buf = 0;
    v108 = "Invalid parameter not satisfying: eligibilityChecker";
    goto LABEL_42;
  }
  if (!v122)
  {
    v107 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v108 = "Invalid parameter not satisfying: deviceConfigurationChecker";
      goto LABEL_42;
    }
LABEL_43:

    v103 = 0;
    v104 = v131;
LABEL_44:
    v102 = self;
    v105 = v118;
    goto LABEL_45;
  }
  if (v22)
  {
    uint64_t v25 = *MEMORY[0x1E4F99A98];
    v132.receiver = self;
    v132.super_class = (Class)SMClientListener;
    v26 = [(RTXPCListener *)&v132 initWithMachServiceName:v25];
    if (v26)
    {
      v117 = v26;
      objc_storeStrong((id *)&v26->_defaultsManager, a3);
      objc_storeStrong((id *)&v117->_authorizationManager, v113);
      objc_storeStrong((id *)&v117->_distanceCalculator, v114);
      objc_storeStrong((id *)&v117->_platform, a6);
      objc_storeStrong((id *)&v117->_initiatorService, v115);
      objc_storeStrong((id *)&v117->_sessionStore, a10);
      objc_storeStrong((id *)&v117->_suggestionsManager, a11);
      objc_storeStrong((id *)&v117->_suggestionsHelper, a12);
      objc_storeStrong((id *)&v117->_suggestionsStore, a13);
      objc_storeStrong((id *)&v117->_messagingService, a8);
      objc_storeStrong((id *)&v117->_receiverService, a9);
      objc_storeStrong((id *)&v117->_eligibilityChecker, a14);
      objc_storeStrong((id *)&v117->_deviceConfigurationChecker, a15);
      objc_storeStrong((id *)&v117->_appDeletionManager, a16);
      uint64_t v27 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F34F2D00];
      frameworkInterface = v117->_frameworkInterface;
      v117->_frameworkInterface = (NSXPCInterface *)v27;

      uint64_t v29 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F348CD78];
      daemonInterface = v117->_daemonInterface;
      v117->_daemonInterface = (NSXPCInterface *)v29;

      v31 = v117->_daemonInterface;
      v32 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v33 = objc_opt_class();
      uint64_t v34 = objc_opt_class();
      id v120 = v23;
      uint64_t v35 = objc_opt_class();
      uint64_t v36 = objc_opt_class();
      uint64_t v37 = objc_opt_class();
      v38 = [v32 setWithObjects:v33, v34, v35, v36, v37, objc_opt_class(), 0];
      [(NSXPCInterface *)v31 setClasses:v38 forSelector:sel_startSessionWithConfiguration_handler_ argumentIndex:0 ofReply:0];

      v39 = v117->_daemonInterface;
      v40 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v41 = objc_opt_class();
      uint64_t v42 = objc_opt_class();
      uint64_t v43 = objc_opt_class();
      uint64_t v44 = objc_opt_class();
      uint64_t v45 = objc_opt_class();
      v46 = [v40 setWithObjects:v41, v42, v43, v44, v45, objc_opt_class(), 0];
      [(NSXPCInterface *)v39 setClasses:v46 forSelector:sel_modifySessionWithConfiguration_handler_ argumentIndex:0 ofReply:0];

      v47 = v117->_daemonInterface;
      v48 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v49 = objc_opt_class();
      uint64_t v50 = objc_opt_class();
      uint64_t v51 = objc_opt_class();
      uint64_t v52 = objc_opt_class();
      uint64_t v53 = objc_opt_class();
      [v48 setWithObjects:v49, v50, v51, v52, v53, objc_opt_class(), 0];
      [(NSXPCInterface *)v47 setClasses:v54 forSelector:sel_checkInitiatorEligibilityWithHandler_ argumentIndex:0 ofReply:0];

      v55 = v117->_daemonInterface;
      v56 = [MEMORY[0x1E4F1CAD0] setWithObjects:objc_opt_class(), 0];
      [(NSXPCInterface *)v55 setClasses:v56 forSelector:sel_checkHasSimWithHandler_ argumentIndex:0 ofReply:0];

      v57 = v117->_daemonInterface;
      v58 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v59 = objc_opt_class();
      uint64_t v60 = objc_opt_class();
      uint64_t v111 = objc_opt_class();
      v23 = v120;
      v61 = [v58 setWithObjects:v59, v60, v111, objc_opt_class(), 0];
      [(NSXPCInterface *)v57 setClasses:v61 forSelector:sel_checkConversationEligibility_handler_ argumentIndex:0 ofReply:0];

      v62 = v117->_daemonInterface;
      v63 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
      [(NSXPCInterface *)v62 setClasses:v63 forSelector:sel_fetchDeviceConfigurationLowPowerModeWarningStateWithHandler_ argumentIndex:0 ofReply:0];

      v64 = v117->_daemonInterface;
      v65 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v66 = objc_opt_class();
      v67 = [v65 setWithObjects:v66, objc_opt_class(), nil];
      [(NSXPCInterface *)v64 setClasses:v67 forSelector:sel_storeSuggestions_handler_ argumentIndex:0 ofReply:0];

      v68 = v117->_daemonInterface;
      v69 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v70 = objc_opt_class();
      [v71 setWithObjects:v70, objc_opt_class(), 0];
      [(NSXPCInterface *)v68 setClasses:v71 forSelector:sel_storeSessionManagerStates_handler_ argumentIndex:0 ofReply:0];

      v72 = v117->_daemonInterface;
      v73 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
      [(NSXPCInterface *)v72 setClasses:v73 forSelector:sel_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler_ argumentIndex:0 ofReply:0];

      v74 = v117->_daemonInterface;
      v75 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
      [(NSXPCInterface *)v74 setClasses:v75 forSelector:sel_runProactiveSuggestionsEngineWithContext_shouldStoreSuggestions_handler_ argumentIndex:0 ofReply:0];

      v76 = v117->_daemonInterface;
      v77 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v78 = objc_opt_class();
      v79 = [v77 setWithObjects:v78, objc_opt_class(), 0];
      [(NSXPCInterface *)v76 setClasses:v79 forSelector:sel_fetchNumFavoriteRecipientsWithReceiverHandles_handler_ argumentIndex:0 ofReply:0];

      v80 = v117->_daemonInterface;
      v81 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v82 = objc_opt_class();
      v83 = [v81 setWithObjects:v82, objc_opt_class(), 0];
      [(NSXPCInterface *)v80 setClasses:v83 forSelector:sel_fetchNumEmergencyRecipientsWithReceiverHandles_handler_ argumentIndex:0 ofReply:0];

      v84 = v117->_daemonInterface;
      v85 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v86 = objc_opt_class();
      v87 = [v85 setWithObjects:v86, objc_opt_class(), 0];
      [(NSXPCInterface *)v84 setClasses:v87 forSelector:sel_fetchNumiCloudFamilyRecipientsWithReceiverHandles_handler_ argumentIndex:0 ofReply:0];

      v88 = v117->_daemonInterface;
      v89 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
      [(NSXPCInterface *)v88 setClasses:v89 forSelector:sel_respondToNotificationWithIdentifier_sessionIdentifier_actionIdentifier_handler_ argumentIndex:0 ofReply:0];

      v90 = v117->_daemonInterface;
      v91 = (void *)MEMORY[0x1E4F1CAD0];
      uint64_t v92 = objc_opt_class();
      v93 = [v91 setWithObjects:v92, objc_opt_class(), nil];
      [(NSXPCInterface *)v90 setClasses:v93 forSelector:sel_iMessageDeletedFor_ argumentIndex:0 ofReply:0];

      v94 = v117->_daemonInterface;
      v95 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
      [(NSXPCInterface *)v94 setClasses:v95 forSelector:sel_iMessageGroupMembershipChangedFor_ argumentIndex:0 ofReply:0];

      v96 = v117->_daemonInterface;
      v97 = [MEMORY[0x1E4F1CAD0] setWithObjects:objc_opt_class(), 0];
      [(NSXPCInterface *)v96 setClasses:v97 forSelector:sel_iMessageGroupDisplayNameChangedFor_ argumentIndex:0 ofReply:0];

      v98 = v117->_daemonInterface;
      v99 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
      [(NSXPCInterface *)v98 setClasses:v99 forSelector:sel_iMessageGroupPhotoChangedFor_ argumentIndex:0 ofReply:0];

      v100 = v117->_daemonInterface;
      v24 = v121;
      v101 = [MEMORY[0x1E4F1CAD0] setWithObjects:0];
      [(NSXPCInterface *)v100 setClasses:v101 forSelector:sel_kickedFromIMessageGroupWith_ argumentIndex:0 ofReply:0];

      [(RTXPCListener *)v117 setup];
      v26 = v117;
    }
    v102 = v26;
    v103 = v102;
    v104 = v131;
    v105 = v118;
  }
  else
  {
    v110 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v104 = v131;
    v105 = v118;
    if (os_log_type_enabled(v110, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D9BFA000, v110, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: appDeletionManager", buf, 2u);
    }

    v103 = 0;
    v102 = self;
  }
LABEL_45:

  return v103;
}

- (void)_setup
{
  v2.receiver = self;
  v2.super_class = (Class)SMClientListener;
  [(RTXPCListener *)&v2 _setup];
}

- (id)handleClientConnection:(id)a3
{
  id v4 = a3;
  v5 = [SMDaemonClient alloc];
  v6 = [(RTXPCListener *)self queue];
  v7 = [(SMDaemonClient *)v5 initWithQueue:v6 authorizationManager:self->_authorizationManager defaultsManager:self->_defaultsManager distanceCalculator:self->_distanceCalculator platform:self->_platform initiatorService:self->_initiatorService messagingService:self->_messagingService receiverService:self->_receiverService sessionStore:self->_sessionStore suggestionsManager:self->_suggestionsManager suggestionsHelper:self->_suggestionsHelper suggestionsStore:self->_suggestionsStore eligibilityChecker:self->_eligibilityChecker deviceConfigurationChecker:self->_deviceConfigurationChecker appDeletionManager:self->_appDeletionManager];

  [(SMClientListener *)self _setupConnection:v4 forClient:v7];

  return v7;
}

- (void)_setupConnection:(id)a3 forClient:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 suspend];
  v8 = [(RTXPCListener *)self queue];
  [v6 _setQueue:v8];

  [v6 setRemoteObjectInterface:self->_frameworkInterface];
  [v6 setExportedInterface:self->_daemonInterface];
  [v6 setExportedObject:v7];
  objc_initWeak(&location, v7);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__SMClientListener__setupConnection_forClient___block_invoke;
  v17[3] = &unk_1E6B91900;
  objc_copyWeak(&v18, &location);
  [v6 setInterruptionHandler:v17];
  objc_initWeak(&from, self);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __47__SMClientListener__setupConnection_forClient___block_invoke_279;
  v13[3] = &unk_1E6B9B7A0;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  [v6 setInvalidationHandler:v13];
  [v6 resume];
  v9 = +[RTXPC executablePathOfConnection:v6];
  [v7 setExecutablePath:v9];

  v10 = [v7 executablePath];
  v11 = [v10 lastPathComponent];
  [v7 setExecutableName:v11];

  [v7 setProcessIdentifier:[v6 processIdentifier]];
  [v7 setXpcConnection:v6];
  v12 = [v7 xpcConnection];
  [v12 setDelegate:v7];

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
}

void __47__SMClientListener__setupConnection_forClient___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_super v2 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = [WeakRetained executableName];
    int v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_1D9BFA000, v2, OS_LOG_TYPE_INFO, "client, %@, handle xpc interruption", (uint8_t *)&v4, 0xCu);
  }
}

void __47__SMClientListener__setupConnection_forClient___block_invoke_279(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = [WeakRetained executableName];
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "client, %@, handle xpc invalidation", (uint8_t *)&v6, 0xCu);
  }
  [WeakRetained setXpcConnection:0];
  [WeakRetained setProcessIdentifier:0];
  [WeakRetained setExecutablePath:0];
  id v5 = objc_loadWeakRetained((id *)(a1 + 40));
  [v5 handleDisconnectionForDaemonClient:WeakRetained];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (v5)
  {
    id v21 = 0;
    BOOL v6 = +[RTXPC clientCodeSignatureIsValid:v5 error:&v21];
    id v7 = v21;
    uint64_t v8 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
    v9 = v8;
    if (v6)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        int v17 = [v5 processIdentifier];
        id v18 = [(RTXPCListener *)self machServiceName];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v23 = v17;
        *(_WORD *)&v23[4] = 2112;
        *(void *)&v23[6] = v18;
        _os_log_debug_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_DEBUG, "listener received incoming connection from pid %d, for service, %@", buf, 0x12u);
      }
      uint64_t v10 = [(SMClientListener *)self handleClientConnection:v5];
      if (v10)
      {
        v9 = v10;
        v11 = [(RTXPCListener *)self connectedClients];
        [v11 addObject:v9];

        v12 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v13 = [(RTXPCListener *)self machServiceName];
          *(_DWORD *)buf = 138412546;
          *(void *)v23 = v9;
          *(_WORD *)&v23[8] = 2112;
          *(void *)&v23[10] = v13;
          _os_log_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_INFO, "client connected, %@, to service, %@", buf, 0x16u);
        }
        [(RTXPCListener *)self logClients];
        BOOL v14 = 1;
        goto LABEL_18;
      }
      id v15 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        int v19 = [v5 processIdentifier];
        v20 = [(RTXPCListener *)self machServiceName];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v23 = v19;
        *(_WORD *)&v23[4] = 2112;
        *(void *)&v23[6] = v20;
        _os_log_debug_impl(&dword_1D9BFA000, v15, OS_LOG_TYPE_DEBUG, "failed to create client for connection from pid, %d, for service, %@", buf, 0x12u);
      }
      v9 = 0;
    }
    else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)v23 = v7;
      _os_log_error_impl(&dword_1D9BFA000, v9, OS_LOG_TYPE_ERROR, "incoming xpc connection failed code-signing check, error, %@.", buf, 0xCu);
    }
    BOOL v14 = 0;
LABEL_18:

    goto LABEL_19;
  }
  id v7 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_DEBUG, "incoming xpc connection is nil", buf, 2u);
  }
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (void)handleDisconnectionForDaemonClient:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _rt_log_facility_get_os_log(RTLogFacilityConnection);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_1D9BFA000, v5, OS_LOG_TYPE_INFO, "client disconnected, %@", (uint8_t *)&v7, 0xCu);
  }

  BOOL v6 = [(RTXPCListener *)self connectedClients];
  [v6 removeObject:v4];

  [v4 shutdown];
  [(RTXPCListener *)self logClients];
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
}

- (SMInitiatorService)initiatorService
{
  return self->_initiatorService;
}

- (void)setInitiatorService:(id)a3
{
}

- (SMSessionStore)sessionStore
{
  return self->_sessionStore;
}

- (void)setSessionStore:(id)a3
{
}

- (SMSuggestionsManager)suggestionsManager
{
  return self->_suggestionsManager;
}

- (void)setSuggestionsManager:(id)a3
{
}

- (SMSuggestionsHelper)suggestionsHelper
{
  return self->_suggestionsHelper;
}

- (void)setSuggestionsHelper:(id)a3
{
}

- (SMSuggestionsStore)suggestionsStore
{
  return self->_suggestionsStore;
}

- (void)setSuggestionsStore:(id)a3
{
}

- (SMMessagingService)messagingService
{
  return self->_messagingService;
}

- (void)setMessagingService:(id)a3
{
}

- (SMReceiverService)receiverService
{
  return self->_receiverService;
}

- (void)setReceiverService:(id)a3
{
}

- (SMEligibilityChecker)eligibilityChecker
{
  return self->_eligibilityChecker;
}

- (void)setEligibilityChecker:(id)a3
{
}

- (SMDeviceConfigurationChecker)deviceConfigurationChecker
{
  return self->_deviceConfigurationChecker;
}

- (void)setDeviceConfigurationChecker:(id)a3
{
}

- (SMAppDeletionManager)appDeletionManager
{
  return self->_appDeletionManager;
}

- (void)setAppDeletionManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDeletionManager, 0);
  objc_storeStrong((id *)&self->_deviceConfigurationChecker, 0);
  objc_storeStrong((id *)&self->_eligibilityChecker, 0);
  objc_storeStrong((id *)&self->_receiverService, 0);
  objc_storeStrong((id *)&self->_messagingService, 0);
  objc_storeStrong((id *)&self->_suggestionsStore, 0);
  objc_storeStrong((id *)&self->_suggestionsHelper, 0);
  objc_storeStrong((id *)&self->_suggestionsManager, 0);
  objc_storeStrong((id *)&self->_sessionStore, 0);
  objc_storeStrong((id *)&self->_initiatorService, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_daemonInterface, 0);

  objc_storeStrong((id *)&self->_frameworkInterface, 0);
}

@end