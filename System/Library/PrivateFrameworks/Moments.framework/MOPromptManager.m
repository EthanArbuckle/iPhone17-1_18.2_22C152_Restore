@interface MOPromptManager
+ (id)defaultManager;
- (BOOL)analyzeTrendsInEvents:(id)a3 handler:(id)a4;
- (BOOL)bundleEvents;
- (BOOL)bundleEventsWithHandler:(id)a3;
- (BOOL)clearEvents;
- (BOOL)clearEventsWithHandler:(id)a3;
- (BOOL)collectEvents;
- (BOOL)collectEventsWithHandler:(id)a3;
- (BOOL)fetchEventBundlesWithOptions:(id)a3 handler:(id)a4;
- (BOOL)fetchEventsWithOptions:(id)a3 handler:(id)a4;
- (BOOL)getDiagnosticReporterConfiguration:(id)a3;
- (BOOL)getMomentsNotificationsSchedule:(id)a3;
- (BOOL)getTimeToWriteNotificationsScheduleWithHandler:(id)a3;
- (BOOL)printSettingValue:(id)a3 withType:(id)a4 handler:(id)a5;
- (BOOL)purgeEvents;
- (BOOL)purgeEventsWithHandler:(id)a3;
- (BOOL)refreshEventsWithHandler:(id)a3;
- (BOOL)refreshEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (BOOL)runAnalytics;
- (BOOL)runAnalyticsWithHandler:(id)a3;
- (BOOL)scheduleDatabaseUpgradeWithHandler:(id)a3;
- (BOOL)setupMomentsNotificationsWithSchedule:(id)a3 options:(id)a4 handler:(id)a5;
- (BOOL)setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents:(id)a3 defaultURL:(id)a4 handler:(id)a5;
- (BOOL)softRefreshEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4;
- (BOOL)softRefreshEventsWithRefreshVariant:(unint64_t)a3 andIgnoreLastTrigger:(BOOL)a4 andHandler:(id)a5;
- (BOOL)storeEvents:(id)a3 handler:(id)a4;
- (BOOL)uploadFeedbackWithDBStateToServer:(id)a3 handler:(id)a4;
- (MOPromptManager)init;
- (id)context;
- (id)initForSoftLinkwithMOEventClass:(Class)a3 moEventBundleClass:(Class)a4;
- (id)localizedString:(id)a3 withTable:(id)a4;
- (id)localizedStringForKey:(id)a3;
- (void)_buildMetadataAndLabelsForBundles:(id)a3 withOptions:(id)a4;
- (void)_buildMetadataOnlyForEventBundles:(id)a3;
- (void)_initForSoftLinkwithMOEventClass:(Class)a3 moEventBundleClass:(Class)a4 moXpcContext:(Class)a5;
- (void)acquireBackgroundProcessingPermissionsForMomentsWithHander:(id)a3;
- (void)buildLabelsForEventBundles:(id)a3;
- (void)dealloc;
- (void)dumpDBStateWithHandler:(id)a3;
- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 respectOnboardingDates:(BOOL)a7 handler:(id)a8;
- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 respectOnboardingDates:(BOOL)a7 respectLearnFromThisApp:(BOOL)a8 handler:(id)a9;
- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 respectOnboardingDates:(BOOL)a4 handler:(id)a5;
- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 respectOnboardingDates:(BOOL)a4 respectLearnFromThisApp:(BOOL)a5 handler:(id)a6;
- (void)getSnapshotDictionaryForAnalyticsWithHandler:(id)a3;
- (void)localizeEventBundles:(id)a3;
- (void)printEvergreenBundlesWithSeed:(unint64_t)a3 handler:(id)a4;
- (void)printOnboardingStatusAnalytics:(id)a3;
- (void)testMomentsNotificationsWithOptions:(id)a3 handler:(id)a4;
- (void)triggerFeedbackAssistantFlow:(id)a3 handler:(id)a4;
@end

@implementation MOPromptManager

+ (id)defaultManager
{
  if (defaultManager_onceToken_0 != -1) {
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_8);
  }
  v2 = (void *)defaultManager_promptManager;
  return v2;
}

uint64_t __33__MOPromptManager_defaultManager__block_invoke()
{
  defaultManager_promptManager = objc_alloc_init(MOPromptManager);
  return MEMORY[0x1F41817F8]();
}

- (MOPromptManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOPromptManager;
  v2 = [(MOPromptManager *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_class();
    uint64_t v4 = objc_opt_class();
    [(MOPromptManager *)v2 _initForSoftLinkwithMOEventClass:v3 moEventBundleClass:v4 moXpcContext:objc_opt_class()];
  }
  return v2;
}

- (id)initForSoftLinkwithMOEventClass:(Class)a3 moEventBundleClass:(Class)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MOPromptManager;
  objc_super v6 = [(MOPromptManager *)&v8 init];
  if (v6) {
    [(MOPromptManager *)v6 _initForSoftLinkwithMOEventClass:a3 moEventBundleClass:a4 moXpcContext:objc_opt_class()];
  }
  return v6;
}

- (void)_initForSoftLinkwithMOEventClass:(Class)a3 moEventBundleClass:(Class)a4 moXpcContext:(Class)a5
{
  objc_super v8 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F2940F88];
  v9 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F293BF98];
  [v8 setInterface:v9 forSelector:sel_scheduleDatabaseUpgradeWithContext_andDelegate_ argumentIndex:1 ofReply:0];

  v10 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", a5, 0);
  [v8 setClasses:v10 forSelector:sel_scheduleDatabaseUpgradeWithContext_andDelegate_ argumentIndex:0 ofReply:0];

  v11 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v12 = objc_opt_class();
  uint64_t v13 = objc_opt_class();
  v14 = objc_msgSend(v11, "setWithObjects:", v12, a5, a3, v13, objc_opt_class(), 0);
  [v8 setClasses:v14 forSelector:sel_storeEvents_withContext_andHandler_ argumentIndex:0 ofReply:0];

  v15 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  v18 = objc_msgSend(v15, "setWithObjects:", v16, a5, a3, v17, objc_opt_class(), 0);
  [v8 setClasses:v18 forSelector:sel_fetchEventsWithOptions_withContext_andHandler_ argumentIndex:0 ofReply:1];

  v19 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v19, "setWithObjects:", v20, a5, a4, v21, objc_opt_class(), 0);
  [v8 setClasses:v22 forSelector:sel_fetchEventBundlesWithOptions_withContext_andHandler_ argumentIndex:0 ofReply:1];

  v23 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  v26 = objc_msgSend(v23, "setWithObjects:", v24, a5, a4, v25, objc_opt_class(), 0);
  [v8 setClasses:v26 forSelector:sel_printEvergreenBundlesWithSeed_handler_ argumentIndex:0 ofReply:1];

  v27 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  v30 = objc_msgSend(v27, "setWithObjects:", v28, a5, a3, v29, objc_opt_class(), 0);
  [v8 setClasses:v30 forSelector:sel_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler_ argumentIndex:0 ofReply:1];

  v31 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v32 = objc_opt_class();
  uint64_t v33 = objc_opt_class();
  v34 = objc_msgSend(v31, "setWithObjects:", v32, a5, a3, v33, objc_opt_class(), 0);
  [v8 setClasses:v34 forSelector:sel_analyzeTrendsInEvents_withContext_andRefreshVariant_andHandler_ argumentIndex:0 ofReply:0];

  v35 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v36 = objc_opt_class();
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  uint64_t v39 = objc_opt_class();
  v40 = objc_msgSend(v35, "setWithObjects:", v36, v37, v38, v39, objc_opt_class(), 0);
  [v8 setClasses:v40 forSelector:sel_checkElegibilityAndRequestDataExportForTrigger_withFeedback_requestUpload_reply_ argumentIndex:0 ofReply:0];

  v41 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v42 = objc_opt_class();
  v43 = objc_msgSend(v41, "setWithObjects:", v42, objc_opt_class(), 0);
  [v8 setClasses:v43 forSelector:sel_getDiagnosticReporterConfiguration_ argumentIndex:0 ofReply:0];

  v44 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v45 = objc_opt_class();
  uint64_t v46 = objc_opt_class();
  uint64_t v47 = objc_opt_class();
  uint64_t v48 = objc_opt_class();
  v49 = objc_msgSend(v44, "setWithObjects:", v45, v46, v47, v48, objc_opt_class(), 0);
  [v8 setClasses:v49 forSelector:sel_getMomentsNotificationsSchedule_ argumentIndex:0 ofReply:1];

  v50 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.momentsd" options:0];
  connection = self->connection;
  self->connection = v50;

  [(NSXPCConnection *)self->connection setInvalidationHandler:&__block_literal_global_193];
  [(NSXPCConnection *)self->connection setRemoteObjectInterface:v8];
  v52 = [(NSXPCConnection *)self->connection remoteObjectProxyWithErrorHandler:&__block_literal_global_197];
  proxy = self->proxy;
  self->proxy = v52;

  v54 = [[MOConnection alloc] initWithName:@"MOPromptManager"];
  connectionProxy = self->connectionProxy;
  self->connectionProxy = v54;

  v56 = [(MOConnection *)self->connectionProxy onConnectionInterrupted];
  [(NSXPCConnection *)self->connection setInterruptionHandler:v56];

  [(NSXPCConnection *)self->connection resume];
  v57 = +[MODiagnosticReporter defaultReporter];
  [v57 configureWithPromptManager:self];

  v58 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v58, OS_LOG_TYPE_DEFAULT, "initiate client", buf, 2u);
  }
}

void __84__MOPromptManager__initForSoftLinkwithMOEventClass_moEventBundleClass_moXpcContext___block_invoke()
{
  v0 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1D24AE000, v0, OS_LOG_TYPE_DEFAULT, "Invalidated", v1, 2u);
  }
}

void __84__MOPromptManager__initForSoftLinkwithMOEventClass_moEventBundleClass_moXpcContext___block_invoke_194(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [v2 localizedDescription];
    v5 = [v2 localizedFailureReason];
    int v6 = 138412802;
    v7 = @"Error on remote object proxy";
    __int16 v8 = 2112;
    v9 = v4;
    __int16 v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1D24AE000, v3, OS_LOG_TYPE_DEFAULT, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);
  }
}

- (void)dealloc
{
  [(NSXPCConnection *)self->connection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)MOPromptManager;
  [(MOPromptManager *)&v3 dealloc];
}

- (id)context
{
  id v2 = objc_alloc_init(MOXPCContext);
  return v2;
}

- (BOOL)scheduleDatabaseUpgradeWithHandler:(id)a3
{
  id v4 = a3;
  v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling scheduleDatabaseUpgradeWithHandler", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke;
  v11[3] = &unk_1E69206A0;
  v11[4] = self;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke_211;
  v9[3] = &unk_1E691EE20;
  id v10 = v12;
  id v7 = v12;
  [(MOConnection *)connectionProxy callBlock:v11 onInterruption:v9];

  return 1;
}

void __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [MODatabaseUpgradeCompletionDelegate alloc];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  id v12 = __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke_2;
  uint64_t v13 = &unk_1E6920678;
  id v14 = *(id *)(a1 + 40);
  id v15 = v3;
  id v5 = v3;
  int v6 = [(MODatabaseUpgradeCompletionDelegate *)v4 initWithHandler:&v10];
  id v7 = *(void **)(a1 + 32);
  __int16 v8 = (void *)v7[2];
  v9 = objc_msgSend(v7, "context", v10, v11, v12, v13);
  [v8 scheduleDatabaseUpgradeWithContext:v9 andDelegate:v6];
}

void __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke_2(uint64_t a1, unint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [NSNumber numberWithUnsignedInteger:a2];
    int v11 = 138412290;
    id v12 = v7;
    _os_log_impl(&dword_1D24AE000, v6, OS_LOG_TYPE_DEFAULT, "calling back from scheduleDatabaseUpgradeWithContext with status %@", (uint8_t *)&v11, 0xCu);
  }
  if (a2 <= 4)
  {
    if (a2 == 2)
    {
      uint64_t v10 = *(void *)(a1 + 32);
      if (v10) {
        (*(void (**)(uint64_t, uint64_t, id))(v10 + 16))(v10, 2, v5);
      }
    }
    else
    {
      if ((*(unsigned int (**)(void))(*(void *)(a1 + 40) + 16))())
      {
        uint64_t v8 = *(void *)(a1 + 32);
        if (v8) {
          (*(void (**)(uint64_t, unint64_t, id))(v8 + 16))(v8, a2, v5);
        }
      }
      v9 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D24AE000, v9, OS_LOG_TYPE_DEFAULT, "calling scheduleDatabaseUpgradeWithContext completed", (uint8_t *)&v11, 2u);
      }
    }
  }
}

uint64_t __54__MOPromptManager_scheduleDatabaseUpgradeWithHandler___block_invoke_211(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (BOOL)storeEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling storeEvents", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __39__MOPromptManager_storeEvents_handler___block_invoke;
  v15[3] = &unk_1E69206F0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __39__MOPromptManager_storeEvents_handler___block_invoke_212;
  v13[3] = &unk_1E691EE20;
  id v14 = v17;
  id v10 = v17;
  id v11 = v6;
  [(MOConnection *)connectionProxy callBlock:v15 onInterruption:v13];

  return 1;
}

void __39__MOPromptManager_storeEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)v4[2];
  id v7 = [v4 context];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__MOPromptManager_storeEvents_handler___block_invoke_2;
  v9[3] = &unk_1E69206C8;
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v8 = v3;
  [v6 storeEvents:v5 withContext:v7 andHandler:v9];
}

void __39__MOPromptManager_storeEvents_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling storeEvents completed", v6, 2u);
  }
}

uint64_t __39__MOPromptManager_storeEvents_handler___block_invoke_212(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)fetchEventsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling fetchEventsWithOption", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke;
  v15[3] = &unk_1E69206F0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke_214;
  v13[3] = &unk_1E691EE20;
  id v14 = v17;
  id v10 = v17;
  id v11 = v6;
  [(MOConnection *)connectionProxy callBlock:v15 onInterruption:v13];

  return 1;
}

void __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)v4[2];
  id v7 = [v4 context];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke_2;
  v9[3] = &unk_1E6920718;
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v8 = v3;
  [v6 fetchEventsWithOptions:v5 withContext:v7 andHandler:v9];
}

void __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
    }
  }
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling fetchEventsWithOption completed", v9, 2u);
  }
}

uint64_t __50__MOPromptManager_fetchEventsWithOptions_handler___block_invoke_214(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (BOOL)setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents:(id)a3 defaultURL:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEFAULT, "calling setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents", buf, 2u);
  }

  id v12 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v13 = [v12 infoDictionary];
  id v14 = [v13 objectForKey:@"CFBundleIdentifier"];

  connectionProxy = self->connectionProxy;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke;
  v24[3] = &unk_1E6920740;
  v24[4] = self;
  id v25 = v14;
  id v26 = v8;
  id v27 = v9;
  id v28 = v10;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke_219;
  v22[3] = &unk_1E691EE20;
  id v23 = v28;
  id v16 = v28;
  id v17 = v9;
  id v18 = v8;
  id v19 = v14;
  [(MOConnection *)connectionProxy callBlock:v24 onInterruption:v22];
  if (self->connectionProxy) {
    BOOL v20 = self->proxy != 0;
  }
  else {
    BOOL v20 = 0;
  }

  return v20;
}

void __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)v4[2];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v9 = [v4 context];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke_2;
  v11[3] = &unk_1E69206C8;
  id v12 = v3;
  id v13 = *(id *)(a1 + 64);
  id v10 = v3;
  [v6 setupPeriodicTimeToWriteMomentsNotificationsForApplication:v5 usingDateComponents:v7 withActionURL:v8 withContext:v9 andHandler:v11];
}

void __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents completed", v6, 2u);
  }
}

uint64_t __102__MOPromptManager_setupPeriodicTimeToWriteMomentsNotificationsUsingDateComponents_defaultURL_handler___block_invoke_219(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)getTimeToWriteNotificationsScheduleWithHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling getTimeToWriteNotificationsScheduleWithHandler:", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke;
  v11[3] = &unk_1E691EDF8;
  void v11[4] = self;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke_221;
  v9[3] = &unk_1E691EE20;
  id v10 = v12;
  id v7 = v12;
  [(MOConnection *)connectionProxy callBlock:v11 onInterruption:v9];

  return 1;
}

void __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = (void *)v4[2];
  id v6 = [v4 context];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke_2;
  v8[3] = &unk_1E6920768;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v5 getTimeToWriteNotificationsApplicationScheduleWithContext:v6 andHandler:v8];
}

void __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id, id, id))(v10 + 16))(v10, v7, v8, v9);
    }
  }
  id v11 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEFAULT, "calling getTimeToWriteNotificationsScheduleWithHandler: completed", v12, 2u);
  }
}

uint64_t __66__MOPromptManager_getTimeToWriteNotificationsScheduleWithHandler___block_invoke_221(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

- (BOOL)setupMomentsNotificationsWithSchedule:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEFAULT, "calling setupMomentsNotificationsWithSchedule:", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke;
  v19[3] = &unk_1E6920790;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_222;
  v17[3] = &unk_1E691EE20;
  id v18 = v22;
  id v13 = v22;
  id v14 = v9;
  id v15 = v8;
  [(MOConnection *)connectionProxy callBlock:v19 onInterruption:v17];

  return 1;
}

void __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_2;
  v8[3] = &unk_1E69206C8;
  id v9 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v7 = v3;
  [v5 setupMomentsNotificationsWithSchedule:v4 options:v6 handler:v8];
}

void __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling setupMomentsNotificationsWithSchedule: completed", v6, 2u);
  }
}

uint64_t __73__MOPromptManager_setupMomentsNotificationsWithSchedule_options_handler___block_invoke_222(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)getMomentsNotificationsSchedule:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling getMomentsNotificationsSchedule:", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke;
  v11[3] = &unk_1E691EDF8;
  void v11[4] = self;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke_224;
  v9[3] = &unk_1E691EE20;
  id v10 = v12;
  id v7 = v12;
  [(MOConnection *)connectionProxy callBlock:v11 onInterruption:v9];

  return 1;
}

void __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke_2;
  v6[3] = &unk_1E69207B8;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 getMomentsNotificationsSchedule:v6];
}

void __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, id, id, id))(v10 + 16))(v10, v7, v8, v9);
    }
  }
  id v11 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEFAULT, "calling getMomentsNotificationsSchedule: completed", v12, 2u);
  }
}

uint64_t __51__MOPromptManager_getMomentsNotificationsSchedule___block_invoke_224(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void, uint64_t))(result + 16))(result, 0, 0, a2);
  }
  return result;
}

- (void)_buildMetadataAndLabelsForBundles:(id)a3 withOptions:(id)a4
{
  id v6 = a3;
  if ([a4 skipLocalization]) {
    [(MOPromptManager *)self _buildMetadataOnlyForEventBundles:v6];
  }
  else {
    [(MOPromptManager *)self buildLabelsForEventBundles:v6];
  }
}

- (BOOL)fetchEventBundlesWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke;
  v15[3] = &unk_1E69206F0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke_225;
  v13[3] = &unk_1E691EE20;
  id v14 = v17;
  id v10 = v17;
  id v11 = v6;
  [(MOConnection *)connectionProxy callBlock:v15 onInterruption:v13];

  return 1;
}

void __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)v4[2];
  id v7 = [v4 context];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke_2;
  v12[3] = &unk_1E69207E0;
  id v14 = v3;
  id v8 = *(id *)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(a1 + 40);
  id v15 = v8;
  v12[4] = v9;
  id v13 = v10;
  id v11 = v3;
  [v6 fetchEventBundlesWithOptions:v5 withContext:v7 andHandler:v12];
}

void __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))() && *(void *)(a1 + 56))
  {
    [*(id *)(a1 + 32) _buildMetadataAndLabelsForBundles:v5 withOptions:*(void *)(a1 + 40)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  id v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v9 = 138412290;
    id v10 = v8;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption completed found %@ events", (uint8_t *)&v9, 0xCu);
  }
}

uint64_t __56__MOPromptManager_fetchEventBundlesWithOptions_handler___block_invoke_225(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)localizeEventBundles:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling localizeEventBundlesForReplayWithOptions", v6, 2u);
  }

  [(MOPromptManager *)self buildLabelsForEventBundles:v4];
}

- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 respectOnboardingDates:(BOOL)a7 handler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a8;
  id v18 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v18, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption with source type & onboarding filtering", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke;
  v26[3] = &unk_1E6920830;
  BOOL v32 = a5;
  id v27 = v15;
  id v28 = v16;
  uint64_t v29 = self;
  id v30 = v14;
  id v31 = v17;
  BOOL v33 = a7;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke_228;
  v24[3] = &unk_1E691EE20;
  id v25 = v31;
  id v20 = v31;
  id v21 = v14;
  id v22 = v16;
  id v23 = v15;
  [(MOConnection *)connectionProxy callBlock:v26 onInterruption:v24];
}

void __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[MOEventBundleFetchOptions alloc] initWithAllowedCategories:0 dateInterval:*(void *)(a1 + 32) ascending:*(unsigned __int8 *)(a1 + 72) limit:*(void *)(a1 + 40) includeDeletedBundles:0 skipRanking:0];
  id v5 = *(void **)(a1 + 48);
  id v6 = (void *)v5[2];
  id v7 = [v5 context];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke_2;
  v11[3] = &unk_1E6920808;
  id v14 = v3;
  id v15 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  char v16 = *(unsigned char *)(a1 + 73);
  uint64_t v9 = *(void *)(a1 + 48);
  id v12 = v8;
  uint64_t v13 = v9;
  id v10 = v3;
  [v6 fetchEventBundlesWithOptions:v4 withContext:v7 andHandler:v11];
}

void __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))() && *(void *)(a1 + 56))
  {
    id v7 = +[MOEventBundleProcessor trimmedFrom:v5 with:*(void *)(a1 + 32) respectOnboardingDate:*(unsigned __int8 *)(a1 + 64) shouldUseStandardSuite:1];
    [*(id *)(a1 + 40) buildLabelsForEventBundles:v7];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v10 = 138412290;
    uint64_t v11 = v9;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption completed found %@ eventBundles", (uint8_t *)&v10, 0xCu);
  }
}

uint64_t __119__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_handler___block_invoke_228(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 respectOnboardingDates:(BOOL)a4 handler:(id)a5
{
}

- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 dateInterval:(id)a4 ascending:(BOOL)a5 limit:(id)a6 respectOnboardingDates:(BOOL)a7 respectLearnFromThisApp:(BOOL)a8 handler:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a9;
  id v19 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v19, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption with source type & onboarding filtering", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke;
  v27[3] = &unk_1E6920880;
  BOOL v33 = a5;
  id v28 = v16;
  id v29 = v17;
  id v30 = self;
  id v31 = v15;
  id v32 = v18;
  BOOL v34 = a7;
  BOOL v35 = a8;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke_230;
  v25[3] = &unk_1E691EE20;
  id v26 = v32;
  id v21 = v32;
  id v22 = v15;
  id v23 = v17;
  id v24 = v16;
  [(MOConnection *)connectionProxy callBlock:v27 onInterruption:v25];
}

void __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [[MOEventBundleFetchOptions alloc] initWithAllowedCategories:0 dateInterval:*(void *)(a1 + 32) ascending:*(unsigned __int8 *)(a1 + 72) limit:*(void *)(a1 + 40) includeDeletedBundles:0 skipRanking:0];
  id v5 = *(void **)(a1 + 48);
  id v6 = (void *)v5[2];
  id v7 = [v5 context];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke_2;
  v11[3] = &unk_1E6920858;
  id v14 = v3;
  id v15 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 56);
  __int16 v16 = *(_WORD *)(a1 + 73);
  uint64_t v9 = *(void *)(a1 + 48);
  id v12 = v8;
  uint64_t v13 = v9;
  id v10 = v3;
  [v6 fetchEventBundlesWithOptions:v4 withContext:v7 andHandler:v11];
}

void __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 48) + 16))() && *(void *)(a1 + 56))
  {
    id v7 = +[MOEventBundleProcessor trimmedFrom:v5 with:*(void *)(a1 + 32) respectOnboardingDate:*(unsigned __int8 *)(a1 + 64) shouldUseStandardSuite:1];
    if (*(unsigned char *)(a1 + 65))
    {
      id v8 = +[MOEventBundleProcessor approvedForLearnFromThisApp:v7];
    }
    else
    {
      uint64_t v9 = [MOEventBundleProcessorResult alloc];
      id v10 = objc_opt_new();
      uint64_t v11 = objc_opt_new();
      id v8 = [(MOEventBundleProcessorResult *)v9 init:v7 sourceAppBundleIds:v10 removedAppBundleIds:v11];
    }
    id v12 = *(void **)(a1 + 40);
    uint64_t v13 = [v8 processedBundles];
    [v12 buildLabelsForEventBundles:v13];

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  id v14 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
    int v16 = 138412290;
    id v17 = v15;
    _os_log_impl(&dword_1D24AE000, v14, OS_LOG_TYPE_DEFAULT, "calling fetchEventBundlesWithOption completed found %@ eventBundles", (uint8_t *)&v16, 0xCu);
  }
}

uint64_t __143__MOPromptManager_fetchEventBundlesWithAllowedSourceTypes_dateInterval_ascending_limit_respectOnboardingDates_respectLearnFromThisApp_handler___block_invoke_230(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)fetchEventBundlesWithAllowedSourceTypes:(id)a3 respectOnboardingDates:(BOOL)a4 respectLearnFromThisApp:(BOOL)a5 handler:(id)a6
{
}

- (BOOL)clearEvents
{
  return [(MOPromptManager *)self clearEventsWithHandler:&__block_literal_global_232];
}

- (BOOL)collectEvents
{
  return [(MOPromptManager *)self collectEventsWithHandler:&__block_literal_global_234];
}

- (BOOL)bundleEvents
{
  return [(MOPromptManager *)self bundleEventsWithHandler:&__block_literal_global_236];
}

- (BOOL)purgeEvents
{
  return [(MOPromptManager *)self purgeEventsWithHandler:&__block_literal_global_238];
}

- (BOOL)runAnalytics
{
  return [(MOPromptManager *)self runAnalyticsWithHandler:&__block_literal_global_240];
}

- (BOOL)clearEventsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling clearEventsWithContext", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke;
  v11[3] = &unk_1E691EDF8;
  void v11[4] = self;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_244;
  v9[3] = &unk_1E691EE20;
  id v10 = v12;
  id v7 = v12;
  [(MOConnection *)connectionProxy callBlock:v11 onInterruption:v9];

  return 1;
}

void __42__MOPromptManager_clearEventsWithHandler___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = (void *)v2[2];
  id v4 = [v2 context];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_2;
  v6[3] = &unk_1E69208A8;
  id v5 = *(void **)(a1 + 40);
  void v6[4] = *(void *)(a1 + 32);
  id v7 = v5;
  [v3 clearEventsWithContext:v4 andRefreshVariant:0xFFFFLL andHandler:v6];
}

void __42__MOPromptManager_clearEventsWithHandler___block_invoke_2(uint64_t a1)
{
  id v2 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v2, OS_LOG_TYPE_DEFAULT, "calling purgeEventsWithContext", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_241;
  v8[3] = &unk_1E691EDF8;
  void v8[4] = v3;
  id v9 = *(id *)(a1 + 40);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_243;
  v6[3] = &unk_1E691EE20;
  id v7 = *(id *)(a1 + 40);
  [v4 callBlock:v8 onInterruption:v6];
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling clearEventsWithContext completed", buf, 2u);
  }
}

void __42__MOPromptManager_clearEventsWithHandler___block_invoke_241(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[2];
  id v6 = [v4 context];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__MOPromptManager_clearEventsWithHandler___block_invoke_2_242;
  v8[3] = &unk_1E69206C8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v5 purgeEventsWithContext:v6 andRefreshVariant:0xFFFFLL andHandler:v8];
}

void __42__MOPromptManager_clearEventsWithHandler___block_invoke_2_242(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling purgeEventsWithContext completed", v6, 2u);
  }
}

uint64_t __42__MOPromptManager_clearEventsWithHandler___block_invoke_243(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __42__MOPromptManager_clearEventsWithHandler___block_invoke_244(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)collectEventsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling collectEventsWithContext", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__MOPromptManager_collectEventsWithHandler___block_invoke;
  v11[3] = &unk_1E691EDF8;
  void v11[4] = self;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __44__MOPromptManager_collectEventsWithHandler___block_invoke_245;
  v9[3] = &unk_1E691EE20;
  id v10 = v12;
  id v7 = v12;
  [(MOConnection *)connectionProxy callBlock:v11 onInterruption:v9];

  return 1;
}

void __44__MOPromptManager_collectEventsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[2];
  id v6 = [v4 context];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__MOPromptManager_collectEventsWithHandler___block_invoke_2;
  v8[3] = &unk_1E69206C8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v5 collectEventsWithContext:v6 andRefreshVariant:768 andHandler:v8];
}

void __44__MOPromptManager_collectEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling collectEventsWithContext completed", v6, 2u);
  }
}

uint64_t __44__MOPromptManager_collectEventsWithHandler___block_invoke_245(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)bundleEventsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling bundleEventsWithContext", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__MOPromptManager_bundleEventsWithHandler___block_invoke;
  v11[3] = &unk_1E691EDF8;
  void v11[4] = self;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__MOPromptManager_bundleEventsWithHandler___block_invoke_246;
  v9[3] = &unk_1E691EE20;
  id v10 = v12;
  id v7 = v12;
  [(MOConnection *)connectionProxy callBlock:v11 onInterruption:v9];

  return 1;
}

void __43__MOPromptManager_bundleEventsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[2];
  id v6 = [v4 context];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__MOPromptManager_bundleEventsWithHandler___block_invoke_2;
  v8[3] = &unk_1E69206C8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v5 bundleEventsWithContext:v6 andRefreshVariant:768 andHandler:v8];
}

void __43__MOPromptManager_bundleEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling bundleEventsWithContext completed", v6, 2u);
  }
}

uint64_t __43__MOPromptManager_bundleEventsWithHandler___block_invoke_246(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)purgeEventsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling purgeEventsWithContext", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__MOPromptManager_purgeEventsWithHandler___block_invoke;
  v11[3] = &unk_1E691EDF8;
  void v11[4] = self;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__MOPromptManager_purgeEventsWithHandler___block_invoke_247;
  v9[3] = &unk_1E691EE20;
  id v10 = v12;
  id v7 = v12;
  [(MOConnection *)connectionProxy callBlock:v11 onInterruption:v9];

  return 1;
}

void __42__MOPromptManager_purgeEventsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[2];
  id v6 = [v4 context];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__MOPromptManager_purgeEventsWithHandler___block_invoke_2;
  v8[3] = &unk_1E69206C8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v5 purgeEventsWithContext:v6 andRefreshVariant:768 andHandler:v8];
}

void __42__MOPromptManager_purgeEventsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling purgeEventsWithContext completed", v6, 2u);
  }
}

uint64_t __42__MOPromptManager_purgeEventsWithHandler___block_invoke_247(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)runAnalyticsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling runAnalyticsWithContext", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __43__MOPromptManager_runAnalyticsWithHandler___block_invoke;
  v11[3] = &unk_1E691EDF8;
  void v11[4] = self;
  id v12 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __43__MOPromptManager_runAnalyticsWithHandler___block_invoke_248;
  v9[3] = &unk_1E691EE20;
  id v10 = v12;
  id v7 = v12;
  [(MOConnection *)connectionProxy callBlock:v11 onInterruption:v9];

  return 1;
}

void __43__MOPromptManager_runAnalyticsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[2];
  id v6 = [v4 context];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__MOPromptManager_runAnalyticsWithHandler___block_invoke_2;
  v8[3] = &unk_1E69206C8;
  id v9 = v3;
  id v10 = *(id *)(a1 + 40);
  id v7 = v3;
  [v5 runAnalyticsWithContext:v6 andRefreshVariant:768 andHandler:v8];
}

void __43__MOPromptManager_runAnalyticsWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling runAnalyticsWithContext completed", v6, 2u);
  }
}

uint64_t __43__MOPromptManager_runAnalyticsWithHandler___block_invoke_248(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)analyzeTrendsInEvents:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling analyzeTrendsInEvents", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke;
  v15[3] = &unk_1E69206F0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke_249;
  v13[3] = &unk_1E691EE20;
  id v14 = v17;
  id v10 = v17;
  id v11 = v6;
  [(MOConnection *)connectionProxy callBlock:v15 onInterruption:v13];

  return 1;
}

void __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = (void *)v4[2];
  id v7 = [v4 context];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke_2;
  v9[3] = &unk_1E6920718;
  id v10 = v3;
  id v11 = *(id *)(a1 + 48);
  id v8 = v3;
  [v6 analyzeTrendsInEvents:v5 withContext:v7 andRefreshVariant:768 andHandler:v9];
}

void __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v7 = *(void *)(a1 + 40);
    if (v7) {
      (*(void (**)(uint64_t, id, id))(v7 + 16))(v7, v5, v6);
    }
  }
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling analyzeTrendsInEvents compeleted", v9, 2u);
  }
}

uint64_t __49__MOPromptManager_analyzeTrendsInEvents_handler___block_invoke_249(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (BOOL)refreshEventsWithHandler:(id)a3
{
  return [(MOPromptManager *)self refreshEventsWithRefreshVariant:768 andHandler:a3];
}

- (BOOL)refreshEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  id v6 = a4;
  uint64_t v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "calling refreshEventsWithRefreshVariant", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke;
  v13[3] = &unk_1E69208D0;
  void v13[4] = self;
  unint64_t v15 = a3;
  id v14 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke_250;
  v11[3] = &unk_1E691EE20;
  id v12 = v14;
  id v9 = v14;
  [(MOConnection *)connectionProxy callBlock:v13 onInterruption:v11];

  return 1;
}

void __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[2];
  id v6 = [v4 context];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke_2;
  v9[3] = &unk_1E69206C8;
  id v10 = v3;
  uint64_t v7 = *(void *)(a1 + 48);
  id v11 = *(id *)(a1 + 40);
  id v8 = v3;
  [v5 refreshEventsWithContext:v6 andRefreshVariant:v7 andHandler:v9];
}

void __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling refreshEventsWithRefreshVariant completed", v6, 2u);
  }
}

uint64_t __62__MOPromptManager_refreshEventsWithRefreshVariant_andHandler___block_invoke_250(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)softRefreshEventsWithRefreshVariant:(unint64_t)a3 andIgnoreLastTrigger:(BOOL)a4 andHandler:(id)a5
{
  id v8 = a5;
  id v9 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v9, OS_LOG_TYPE_DEFAULT, "calling softRefreshEventsWithRefreshVariant", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __87__MOPromptManager_softRefreshEventsWithRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke;
  v15[3] = &unk_1E69208F8;
  v15[4] = self;
  unint64_t v17 = a3;
  BOOL v18 = a4;
  id v16 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __87__MOPromptManager_softRefreshEventsWithRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke_2_254;
  v13[3] = &unk_1E691EE20;
  id v14 = v16;
  id v11 = v16;
  [(MOConnection *)connectionProxy callBlock:v15 onInterruption:v13];

  return 1;
}

void __87__MOPromptManager_softRefreshEventsWithRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = (void *)v4[2];
  id v6 = [v4 context];
  uint64_t v7 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  unint64_t v15 = __87__MOPromptManager_softRefreshEventsWithRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke_2;
  id v16 = &unk_1E69206C8;
  id v17 = v3;
  uint64_t v8 = *(void *)(a1 + 48);
  id v18 = *(id *)(a1 + 40);
  id v9 = v3;
  [v5 softRefreshEventsWithContext:v6 andRefreshVariant:v8 andIgnoreLastTrigger:v7 andHandler:&v13];

  id v10 = *(void **)(a1 + 32);
  id v11 = (void *)v10[2];
  id v12 = objc_msgSend(v10, "context", v13, v14, v15, v16);
  [v11 softRefreshEventsWithContext:v12 andRefreshVariant:*(void *)(a1 + 48) andHandler:&__block_literal_global_253];
}

void __87__MOPromptManager_softRefreshEventsWithRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling softRefreshEventsWithRefreshVariant completed", v6, 2u);
  }
}

uint64_t __87__MOPromptManager_softRefreshEventsWithRefreshVariant_andIgnoreLastTrigger_andHandler___block_invoke_2_254(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)softRefreshEventsWithRefreshVariant:(unint64_t)a3 andHandler:(id)a4
{
  return [(MOPromptManager *)self softRefreshEventsWithRefreshVariant:a3 andIgnoreLastTrigger:0 andHandler:a4];
}

- (BOOL)uploadFeedbackWithDBStateToServer:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling dataDumpAndUploadWithFeedback", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke;
  v15[3] = &unk_1E69206F0;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke_256;
  v13[3] = &unk_1E691EE20;
  id v14 = v17;
  id v10 = v17;
  id v11 = v6;
  [(MOConnection *)connectionProxy callBlock:v15 onInterruption:v13];

  return 1;
}

void __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke_2;
  v7[3] = &unk_1E691EDD0;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v6 = v3;
  [v5 checkElegibilityAndRequestDataExportForTrigger:5 withFeedback:v4 requestUpload:1 reply:v7];
}

void __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v5 = *(void *)(a1 + 40);
    if (v5) {
      (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
    }
  }
  id v6 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1D24AE000, v6, OS_LOG_TYPE_DEFAULT, "calling dataDumpAndUploadWithFeedback completed", v7, 2u);
  }
}

uint64_t __61__MOPromptManager_uploadFeedbackWithDBStateToServer_handler___block_invoke_256(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_buildMetadataOnlyForEventBundles:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1D26065F0]();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = +[MOEventBundleMetaDataUtility buildMetaDataForEventBundle:](MOEventBundleMetaDataUtility, "buildMetaDataForEventBundle:", v11, (void)v16);
        [v11 setMetaData:v12];

        uint64_t v13 = [v11 metaData];
        if ([v13 count]) {
          ++v8;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  id v14 = _mo_log_facility_get_os_log(MOLogFacilityFramework);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [v5 count];
    *(_DWORD *)buf = 134218240;
    uint64_t v21 = v8;
    __int16 v22 = 2048;
    uint64_t v23 = v15;
    _os_log_impl(&dword_1D24AE000, v14, OS_LOG_TYPE_DEFAULT, "build metadata only, count, %lu, of, %lu", buf, 0x16u);
  }
}

- (void)buildLabelsForEventBundles:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  context = (void *)MEMORY[0x1D26065F0]();
  uint64_t v46 = objc_alloc_init(MOEventBundleLabelFormatter);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v48;
    unint64_t v7 = 0x1E691E000uLL;
    uint64_t v8 = MOLogFacilityFramework;
    do
    {
      uint64_t v9 = 0;
      uint64_t v39 = v5;
      do
      {
        if (*(void *)v48 != v6) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v47 + 1) + 8 * v9);
        id v11 = [*(id *)(v7 + 1600) buildMetaDataForEventBundle:v10];
        [v10 setMetaData:v11];

        id v12 = [v10 metaData];

        uint64_t v13 = _mo_log_facility_get_os_log(v8);
        id v14 = v13;
        if (v12)
        {
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            uint64_t v15 = [v10 getBundleType];
            *(_DWORD *)buf = 138412546;
            uint64_t v52 = (uint64_t)v15;
            __int16 v53 = 2112;
            v54 = v10;
            _os_log_impl(&dword_1D24AE000, v14, OS_LOG_TYPE_INFO, "build labels, bundleType, %@, event bundle, %@", buf, 0x16u);
          }
          long long v16 = _mo_log_facility_get_os_log(v8);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            long long v17 = [v10 metaData];
            long long v18 = [v17 allKeys];
            *(_DWORD *)buf = 138412290;
            uint64_t v52 = (uint64_t)v18;
            _os_log_impl(&dword_1D24AE000, v16, OS_LOG_TYPE_INFO, "build labels, meta data, %@", buf, 0xCu);
          }
          long long v19 = [v10 metaData];
          id v20 = [v10 getBundleType];
          uint64_t v21 = [(MOEventBundleLabelFormatter *)v46 formattedBundleLabelsForMetaData:v19 bundleType:v20];
          [v10 setLabels:v21];

          __int16 v22 = [v10 metaData];
          uint64_t v23 = [v10 getBundleType];
          id v24 = [(MOEventBundleLabelFormatter *)v46 formattedBundlePromptsForMetaData:v22 bundleType:v23];
          [v10 setPromptLanguages:v24];

          uint64_t v25 = [v10 labels];
          uint64_t v26 = [v25 count];

          if (v26)
          {
            id v27 = [v10 labels];
            id v28 = [v27 firstObject];
            [v10 setPromptLanguage:v28];
          }
          id v14 = _mo_log_facility_get_os_log(v8);
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            uint64_t v45 = [v10 labels];
            uint64_t v41 = [v45 count];
            v44 = [v10 labels];
            v43 = [v44 firstObject];
            id v29 = [v43 mask];
            uint64_t v42 = [v10 promptLanguages];
            unint64_t v30 = v7;
            uint64_t v31 = v6;
            uint64_t v32 = [v42 count];
            BOOL v33 = [v10 promptLanguages];
            BOOL v34 = [v33 firstObject];
            [v34 mask];
            uint64_t v36 = v35 = v8;
            *(_DWORD *)buf = 134218754;
            uint64_t v52 = v41;
            __int16 v53 = 2112;
            v54 = v29;
            __int16 v55 = 2048;
            uint64_t v56 = v32;
            uint64_t v6 = v31;
            unint64_t v7 = v30;
            uint64_t v5 = v39;
            __int16 v57 = 2112;
            v58 = v36;
            _os_log_impl(&dword_1D24AE000, v14, OS_LOG_TYPE_INFO, "build labels, labels, %lu, label, %@, prompts, %lu, prompt, %@", buf, 0x2Au);

            uint64_t v8 = v35;
          }
        }
        else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          uint64_t v37 = [v10 getBundleType];
          *(_DWORD *)buf = 138412546;
          uint64_t v52 = (uint64_t)v10;
          __int16 v53 = 2112;
          v54 = v37;
          _os_log_error_impl(&dword_1D24AE000, v14, OS_LOG_TYPE_ERROR, "build labels, nil meta data, event bundle, %@, bundleType, %@", buf, 0x16u);
        }
        ++v9;
      }
      while (v5 != v9);
      uint64_t v5 = [obj countByEnumeratingWithState:&v47 objects:v59 count:16];
    }
    while (v5);
  }
}

- (void)printEvergreenBundlesWithSeed:(unint64_t)a3 handler:(id)a4
{
  id v6 = a4;
  unint64_t v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "calling printEvergreenBundlesWithSeed:handler", buf, 2u);
  }

  proxy = self->proxy;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __57__MOPromptManager_printEvergreenBundlesWithSeed_handler___block_invoke;
  v10[3] = &unk_1E6920920;
  v10[4] = self;
  id v11 = v6;
  id v9 = v6;
  [(MOPromptManagerXPCProtocol *)proxy printEvergreenBundlesWithSeed:a3 handler:v10];
}

void __57__MOPromptManager_printEvergreenBundlesWithSeed_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "calling printEvergreenBundlesWithSeed:handler completed", v8, 2u);
  }

  if (*(void *)(a1 + 40))
  {
    [*(id *)(a1 + 32) buildLabelsForEventBundles:v5];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)getDiagnosticReporterConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling getDiagnosticReporterConfiguration:handler", buf, 2u);
  }

  proxy = self->proxy;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __54__MOPromptManager_getDiagnosticReporterConfiguration___block_invoke;
  v9[3] = &unk_1E6920948;
  id v10 = v4;
  id v7 = v4;
  [(MOPromptManagerXPCProtocol *)proxy getDiagnosticReporterConfiguration:v9];

  return 1;
}

void __54__MOPromptManager_getDiagnosticReporterConfiguration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "calling getDiagnosticReporterConfiguration:handler completed", v9, 2u);
  }

  uint64_t v8 = *(void *)(a1 + 32);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
}

- (void)dumpDBStateWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling dataDumpWithFeedback", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __42__MOPromptManager_dumpDBStateWithHandler___block_invoke;
  v10[3] = &unk_1E691EDF8;
  v10[4] = self;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__MOPromptManager_dumpDBStateWithHandler___block_invoke_260;
  v8[3] = &unk_1E691EE20;
  id v9 = v11;
  id v7 = v11;
  [(MOConnection *)connectionProxy callBlock:v10 onInterruption:v8];
}

void __42__MOPromptManager_dumpDBStateWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__MOPromptManager_dumpDBStateWithHandler___block_invoke_2;
  v6[3] = &unk_1E691EDD0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 checkElegibilityAndRequestDataExportForTrigger:1 withFeedback:0 requestUpload:0 reply:v6];
}

void __42__MOPromptManager_dumpDBStateWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "calling dataDumpWithFeedback completed", v14, 2u);
  }

  if (v5
    && ([v5 objectForKeyedSubscript:@"kMODataDumpFilePath"],
        id v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    id v9 = [MODataExportResults alloc];
    id v10 = [v5 objectForKeyedSubscript:@"kMODataDumpFilePath"];
    id v11 = [v5 objectForKeyedSubscript:@"kMODataDumpKVPairs"];
    id v12 = [(MODataExportResults *)v9 initWithFilePath:v10 kvPairs:v11];
  }
  else
  {
    id v12 = 0;
  }
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v13 = *(void *)(a1 + 40);
    if (v13) {
      (*(void (**)(uint64_t, MODataExportResults *, id))(v13 + 16))(v13, v12, v6);
    }
  }
}

uint64_t __42__MOPromptManager_dumpDBStateWithHandler___block_invoke_260(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (void)getSnapshotDictionaryForAnalyticsWithHandler:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling getSnapshotDictionaryForAnalyticsWithHandler", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke;
  v10[3] = &unk_1E691EDF8;
  v10[4] = self;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_261;
  v8[3] = &unk_1E691EE20;
  id v9 = v11;
  id v7 = v11;
  [(MOConnection *)connectionProxy callBlock:v10 onInterruption:v8];
}

void __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_2;
  v6[3] = &unk_1E691EDD0;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 getSnapshotDictionaryForAnalyticsWithHandler:v6];
}

void __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v8 = 0;
    _os_log_impl(&dword_1D24AE000, v7, OS_LOG_TYPE_DEFAULT, "calling getSnapshotDictionaryForAnalyticsWithHandler completed", v8, 2u);
  }

  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

uint64_t __64__MOPromptManager_getSnapshotDictionaryForAnalyticsWithHandler___block_invoke_261(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, uint64_t))(result + 16))(result, 0, a2);
  }
  return result;
}

- (BOOL)printSettingValue:(id)a3 withType:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v11, OS_LOG_TYPE_DEFAULT, "calling printSettingValue", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__MOPromptManager_printSettingValue_withType_handler___block_invoke;
  v19[3] = &unk_1E6920790;
  v19[4] = self;
  id v20 = v8;
  id v21 = v9;
  id v22 = v10;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__MOPromptManager_printSettingValue_withType_handler___block_invoke_262;
  v17[3] = &unk_1E691EE20;
  id v18 = v22;
  id v13 = v22;
  id v14 = v9;
  id v15 = v8;
  [(MOConnection *)connectionProxy callBlock:v19 onInterruption:v17];

  return 1;
}

void __54__MOPromptManager_printSettingValue_withType_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 16);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __54__MOPromptManager_printSettingValue_withType_handler___block_invoke_2;
  v8[3] = &unk_1E69206C8;
  id v9 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  id v10 = *(id *)(a1 + 56);
  id v7 = v3;
  [v5 printSettingValue:v4 withType:v6 handler:v8];
}

void __54__MOPromptManager_printSettingValue_withType_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling printSettingValue completed", v6, 2u);
  }
}

uint64_t __54__MOPromptManager_printSettingValue_withType_handler___block_invoke_262(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)printOnboardingStatusAnalytics:(id)a3
{
  id v4 = a3;
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling printOnboardingStatusAnalytics", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke;
  v10[3] = &unk_1E691EDF8;
  v10[4] = self;
  id v11 = v4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke_263;
  v8[3] = &unk_1E691EE20;
  id v9 = v11;
  id v7 = v11;
  [(MOConnection *)connectionProxy callBlock:v10 onInterruption:v8];
}

void __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke_2;
  v6[3] = &unk_1E69206C8;
  id v7 = *(id *)(a1 + 40);
  id v8 = v3;
  id v5 = v3;
  [v4 printOnboardingStatusAnalytics:v6];
}

void __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1D24AE000, v4, OS_LOG_TYPE_DEFAULT, "calling printOnboardingStatusAnalytics completed", v6, 2u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __50__MOPromptManager_printOnboardingStatusAnalytics___block_invoke_263(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)localizedStringForKey:(id)a3
{
  if (a3)
  {
    id v4 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:](MOEventBundleLabelLocalizer, "_Moments_LocalizedStringForKey:");
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (id)localizedString:(id)a3 withTable:(id)a4
{
  if (a3)
  {
    uint64_t v5 = +[MOEventBundleLabelLocalizer _Moments_LocalizedStringForKey:a3 withTable:a4];
  }
  else
  {
    uint64_t v5 = 0;
  }
  return v5;
}

- (void)testMomentsNotificationsWithOptions:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling testMomentsNotifications", buf, 2u);
  }

  connectionProxy = self->connectionProxy;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke;
  v14[3] = &unk_1E69206F0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke_265;
  v12[3] = &unk_1E691EE20;
  id v13 = v16;
  id v10 = v16;
  id v11 = v6;
  [(MOConnection *)connectionProxy callBlock:v14 onInterruption:v12];
}

void __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke_2;
  v7[3] = &unk_1E69206C8;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v6 = v3;
  [v5 testMomentsNotificationsWithOptions:v4 handler:v7];
}

void __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling testMomentsNotifications completed", v6, 2u);
  }
}

uint64_t __63__MOPromptManager_testMomentsNotificationsWithOptions_handler___block_invoke_265(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)triggerFeedbackAssistantFlow:(id)a3 handler:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1D24AE000, v8, OS_LOG_TYPE_DEFAULT, "calling triggerFeedbackAssistantFlow:%@", buf, 0xCu);
  }

  connectionProxy = self->connectionProxy;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke;
  v14[3] = &unk_1E69206F0;
  v14[4] = self;
  id v15 = v6;
  id v16 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke_266;
  v12[3] = &unk_1E691EE20;
  id v13 = v16;
  id v10 = v16;
  id v11 = v6;
  [(MOConnection *)connectionProxy callBlock:v14 onInterruption:v12];
}

void __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke_2;
  v7[3] = &unk_1E69206C8;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v6 = v3;
  [v5 triggerFeedbackAssistantFlow:v4 handler:v7];
}

void __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);
    }
  }
  uint64_t v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling triggerFeedbackAssistantFlow completed", v6, 2u);
  }
}

uint64_t __56__MOPromptManager_triggerFeedbackAssistantFlow_handler___block_invoke_266(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)acquireBackgroundProcessingPermissionsForMomentsWithHander:(id)a3
{
  id v4 = a3;
  connectionProxy = self->connectionProxy;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__MOPromptManager_acquireBackgroundProcessingPermissionsForMomentsWithHander___block_invoke;
  v9[3] = &unk_1E691EDF8;
  void v9[4] = self;
  id v10 = v4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__MOPromptManager_acquireBackgroundProcessingPermissionsForMomentsWithHander___block_invoke_268;
  v7[3] = &unk_1E691EE20;
  id v8 = v10;
  id v6 = v10;
  [(MOConnection *)connectionProxy callBlock:v9 onInterruption:v7];
}

void __78__MOPromptManager_acquireBackgroundProcessingPermissionsForMomentsWithHander___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(*(void *)(a1 + 32) + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__MOPromptManager_acquireBackgroundProcessingPermissionsForMomentsWithHander___block_invoke_2;
  v6[3] = &unk_1E6920970;
  id v7 = v3;
  id v8 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 acquireBackgroundProcessingPermissionsForMomentsWithHander:v6];
}

void __78__MOPromptManager_acquireBackgroundProcessingPermissionsForMomentsWithHander___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
  {
    uint64_t v4 = *(void *)(a1 + 40);
    if (v4) {
      (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
    }
  }
  id v5 = _mo_log_facility_get_os_log(MOLogFacilityGeneral);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1D24AE000, v5, OS_LOG_TYPE_DEFAULT, "calling acquireBackgroundProcessingPermissionsForMoments completed", v6, 2u);
  }
}

uint64_t __78__MOPromptManager_acquireBackgroundProcessingPermissionsForMomentsWithHander___block_invoke_268(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->connectionProxy, 0);
  objc_storeStrong((id *)&self->proxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

@end