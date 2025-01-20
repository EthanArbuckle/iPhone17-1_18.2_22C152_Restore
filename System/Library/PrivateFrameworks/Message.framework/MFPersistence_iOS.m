@interface MFPersistence_iOS
+ (OS_os_log)log;
- (EDAccountsProvider)accountsProvider;
- (EDMailboxPersistence)mailboxPersistence;
- (EMUserProfileProvider)userProfileProvider;
- (MCCCategoryRulesController)rulesController;
- (MFMailMessageLibrary)library;
- (MFPersistence_iOS)initWithPath:(id)a3 inMemoryIdentifier:(id)a4 library:(id)a5 propertyMapper:(id)a6;
- (MFServerMessagesIndexer)serverMessagesIndexer;
- (id)attachmentPersistenceManager;
- (id)bimiManager;
- (id)businessCloudStorage;
- (id)businessPersistence;
- (id)categoryPersistence;
- (id)conversationPersistence;
- (id)dataDetectionPersistence;
- (id)database;
- (id)diagnosticsController;
- (id)localActionPersistence;
- (id)mailboxActionPersistence;
- (id)messageChangeManager;
- (id)messagePersistence;
- (id)persistenceStatistics;
- (id)readLaterPersistence;
- (id)remindMeNotificationController;
- (id)remoteContentCacheConfiguration;
- (id)remoteContentManager;
- (id)remoteContentPersistence;
- (id)remoteContentURLCache;
- (id)remoteContentURLSession;
- (id)richLinkPersistence;
- (id)searchProvider;
- (id)searchableIndexManager;
- (id)searchableIndexStatistics;
- (id)senderPersistence;
- (id)serverMessagePersistenceFactory;
- (id)threadPersistence;
- (void)_configureAttachmentPersistenceManager;
- (void)_configureSearchableIndexManagerIfNecessary;
- (void)categoryRulesController:(id)a3 didReceiveOverrideRules:(id)a4;
- (void)scheduleRecurringActivity;
- (void)setAccountsProvider:(id)a3;
- (void)setLibrary:(id)a3;
- (void)setMailboxPersistence:(id)a3;
- (void)setRemoteContentURLCache:(id)a3;
- (void)setRemoteContentURLSession:(id)a3;
- (void)setUpWithMailboxProvider:(id)a3 remoteSearchProvider:(id)a4;
- (void)setUpWithMailboxProvider:(id)a3 remoteSearchProvider:(id)a4 serverMessagesIndexer:(id)a5;
- (void)setUserProfileProvider:(id)a3;
- (void)test_tearDown;
@end

@implementation MFPersistence_iOS

- (id)messagePersistence
{
  return objc_getProperty(self, a2, 256, 1);
}

- (id)messageChangeManager
{
  return objc_getProperty(self, a2, 248, 1);
}

- (EDMailboxPersistence)mailboxPersistence
{
  return self->_mailboxPersistence;
}

- (EDAccountsProvider)accountsProvider
{
  return self->_accountsProvider;
}

- (EMUserProfileProvider)userProfileProvider
{
  return self->_userProfileProvider;
}

- (id)threadPersistence
{
  return objc_getProperty(self, a2, 288, 1);
}

- (id)senderPersistence
{
  return objc_getProperty(self, a2, 296, 1);
}

- (id)searchProvider
{
  return self->_searchProvider;
}

- (id)richLinkPersistence
{
  return objc_getProperty(self, a2, 320, 1);
}

- (id)remoteContentPersistence
{
  return objc_getProperty(self, a2, 312, 1);
}

- (id)remoteContentManager
{
  return objc_getProperty(self, a2, 304, 1);
}

- (id)remoteContentCacheConfiguration
{
  return self->_remoteContentCacheConfiguration;
}

- (id)remindMeNotificationController
{
  return self->_remindMeNotificationController;
}

- (id)conversationPersistence
{
  return objc_getProperty(self, a2, 200, 1);
}

- (id)categoryPersistence
{
  return objc_getProperty(self, a2, 408, 1);
}

- (id)businessPersistence
{
  return objc_getProperty(self, a2, 384, 1);
}

- (id)businessCloudStorage
{
  return self->_businessCloudStorage;
}

- (id)attachmentPersistenceManager
{
  return objc_getProperty(self, a2, 328, 1);
}

- (id)searchableIndexManager
{
  return objc_getProperty(self, a2, 272, 1);
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__MFPersistence_iOS_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_27 != -1) {
    dispatch_once(&log_onceToken_27, block);
  }
  v2 = (void *)log_log_27;
  return (OS_os_log *)v2;
}

- (MFPersistence_iOS)initWithPath:(id)a3 inMemoryIdentifier:(id)a4 library:(id)a5 propertyMapper:(id)a6
{
  id v10 = a3;
  id v84 = a4;
  id v11 = a5;
  id v85 = a6;
  v86.receiver = self;
  v86.super_class = (Class)MFPersistence_iOS;
  v12 = [(EDPersistence *)&v86 init];
  v13 = v12;
  if (v12)
  {
    [MEMORY[0x1E4F60B90] registerAdditionalPropertiesForPropertyMapper:v85];
    if (v84)
    {
      v14 = [NSString stringWithFormat:@"%@/%@", v84, @"Envelope Index"];
      v15 = [MFProtectedDatabasePersistence_iOS alloc];
      v16 = [(EDPersistence *)v12 hookRegistry];
      v17 = [(EDProtectedDatabasePersistence *)v15 initWithBasePath:0 hookRegistry:v16];
      id v18 = v10;

      v19 = [MFPersistenceDatabase_iOS alloc];
      v20 = +[EDPersistenceDatabaseSchema schema];
      v21 = +[EDPersistenceDatabaseSchema protectedSchema];
      uint64_t v22 = [(MFPersistenceDatabase_iOS *)v19 initWithBasePath:0 databaseName:v14 maxConcurrentReaders:3 schema:v20 protectedSchema:v21 propertyMapper:v85 protectedDatabasePersistence:v17];
      database = v12->_database;
      v12->_database = (EDPersistenceDatabase *)v22;
    }
    else
    {
      v24 = [MFProtectedDatabasePersistence_iOS alloc];
      v25 = [(EDPersistence *)v12 hookRegistry];
      v14 = [(EDProtectedDatabasePersistence *)v24 initWithBasePath:v10 hookRegistry:v25];

      v26 = [MFPersistenceDatabase_iOS alloc];
      v17 = +[EDPersistenceDatabaseSchema schema];
      v20 = +[EDPersistenceDatabaseSchema protectedSchema];
      id v18 = v10;
      uint64_t v27 = [(MFPersistenceDatabase_iOS *)v26 initWithBasePath:v10 databaseName:@"Envelope Index" maxConcurrentReaders:3 schema:v17 protectedSchema:v20 propertyMapper:v85 protectedDatabasePersistence:v14];
      v21 = v12->_database;
      v12->_database = (EDPersistenceDatabase *)v27;
    }

    id v10 = v18;
    [(EDPersistenceDatabase *)v12->_database setSetupIsComplete:1];
    p_library = (id *)&v12->_library;
    objc_storeWeak((id *)&v12->_library, v11);
    id v29 = objc_alloc(MEMORY[0x1E4F60AC8]);
    v30 = v12->_database;
    v31 = [(EDPersistence *)v13 hookRegistry];
    uint64_t v32 = [v29 initWithDatabase:v30 hookRegistry:v31];
    conversationPersistence = v13->_conversationPersistence;
    v13->_conversationPersistence = (EDConversationPersistence *)v32;

    v34 = [[MFLocalActionPersistence_iOS alloc] initWithLibrary:v11 database:v13->_database];
    localActionPersistence = v13->_localActionPersistence;
    v13->_localActionPersistence = &v34->super;

    v36 = [[MFServerMessagePersistenceFactory_iOS alloc] initWithLibrary:v11 database:v13->_database];
    serverMessagePersistenceFactory = v13->_serverMessagePersistenceFactory;
    v13->_serverMessagePersistenceFactory = &v36->super;

    id v38 = objc_alloc(MEMORY[0x1E4F60BC8]);
    v39 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18 isDirectory:1];
    uint64_t v40 = [v38 initWithBaseURL:v39 diskCapacity:104857600];
    remoteContentCacheConfiguration = v13->_remoteContentCacheConfiguration;
    v13->_remoteContentCacheConfiguration = (EDRemoteContentCacheConfiguration *)v40;

    id v42 = objc_alloc(MEMORY[0x1E4F60430]);
    uint64_t v43 = [(EDRemoteContentCacheConfiguration *)v13->_remoteContentCacheConfiguration diskCapacity];
    v44 = [(EDRemoteContentCacheConfiguration *)v13->_remoteContentCacheConfiguration cacheURL];
    uint64_t v45 = [v42 initWithMemoryCapacity:0 diskCapacity:v43 directoryURL:v44];
    remoteContentURLCache = v13->_remoteContentURLCache;
    v13->_remoteContentURLCache = (EMRemoteContentURLCache *)v45;

    id v47 = objc_alloc(MEMORY[0x1E4F60440]);
    uint64_t v48 = [v47 initWithCache:v13->_remoteContentURLCache sourceBundleIdentifier:*MEMORY[0x1E4F77E48]];
    remoteContentURLSession = v13->_remoteContentURLSession;
    v13->_remoteContentURLSession = (EMRemoteContentURLSession *)v48;

    BOOL v50 = +[MFMailMessageLibrary canUsePersistence];
    uint64_t v51 = [objc_alloc(MEMORY[0x1E4F60BD8]) initWithDatabase:v13->_database useAdditionalTable:v50];
    remoteContentPersistence = v13->_remoteContentPersistence;
    v13->_remoteContentPersistence = (EDRemoteContentPersistence *)v51;

    uint64_t v53 = [objc_alloc(MEMORY[0x1E4F60BD0]) initWithRemoteContentPersistence:v13->_remoteContentPersistence contentRuleListManager:0 urlSession:v13->_remoteContentURLSession];
    remoteContentManager = v13->_remoteContentManager;
    v13->_remoteContentManager = (EDRemoteContentManager *)v53;

    v55 = [MEMORY[0x1E4F60D58] currentDevice];
    LODWORD(v43) = [v55 isInternal];

    if (v43)
    {
      uint64_t v56 = [objc_alloc(MEMORY[0x1E4F60C28]) initWithPersistence:v13];
      diagnosticsController = v13->_diagnosticsController;
      v13->_diagnosticsController = (EDSearchableIndexDiagnosticsController *)v56;
    }
    id v58 = objc_alloc(MEMORY[0x1E4F60C68]);
    v59 = v13->_database;
    v60 = [(EDPersistence *)v13 blockedSenderManager];
    v61 = [(EDPersistence *)v13 hookRegistry];
    uint64_t v62 = [v58 initWithDatabase:v59 blockedSenderManager:v60 hookRegistry:v61 contactStore:0];
    senderPersistence = v13->_senderPersistence;
    v13->_senderPersistence = (EDSenderPersistence *)v62;

    uint64_t v64 = [objc_alloc(MEMORY[0x1E4F60B08]) initWithDatabase:v13->_database];
    mailboxActionPersistence = v13->_mailboxActionPersistence;
    v13->_mailboxActionPersistence = (EDMailboxActionPersistence *)v64;

    uint64_t v66 = [objc_alloc(MEMORY[0x1E4F60BF8]) initWithDatabase:v13->_database];
    richLinkPersistence = v13->_richLinkPersistence;
    v13->_richLinkPersistence = (EDRichLinkPersistence *)v66;

    id v68 = objc_alloc(MEMORY[0x1E4F60AA0]);
    v69 = v13->_database;
    v70 = [(EDPersistence *)v13 hookRegistry];
    uint64_t v71 = [v68 initWithDatabase:v69 hookRegistry:v70];
    businessPersistence = v13->_businessPersistence;
    v13->_businessPersistence = (EDBusinessPersistence *)v71;

    v73 = [MFCategoryPersistence_iOS alloc];
    id WeakRetained = objc_loadWeakRetained(p_library);
    v75 = v13->_database;
    v76 = [(EDPersistence *)v13 hookRegistry];
    uint64_t v77 = [(MFCategoryPersistence_iOS *)v73 initWithLibrary:WeakRetained database:v75 hookResponder:v76];
    categoryPersistence = v13->_categoryPersistence;
    v13->_categoryPersistence = (EDCategoryPersistence *)v77;

    if (LoadicloudMCCKit_loadPredicate_0 != -1) {
      dispatch_once(&LoadicloudMCCKit_loadPredicate_0, &__block_literal_global_54);
    }
    if (LoadicloudMCCKit_frameworkLibrary_0)
    {
      v79 = (MCCCategoryRulesController *)objc_alloc_init(getMCCCategoryRulesControllerClass());
      rulesController = v13->_rulesController;
      v13->_rulesController = v79;

      v81 = v13->_rulesController;
      if (v81)
      {
        [(MCCCategoryRulesController *)v81 setDelegate:v13];
        goto LABEL_17;
      }
      v82 = [MEMORY[0x1E4F60B50] log];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        -[MFPersistence_iOS initWithPath:inMemoryIdentifier:library:propertyMapper:](v82);
      }
    }
    else
    {
      v82 = [MEMORY[0x1E4F60B50] log];
      if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)) {
        -[MFPersistence_iOS initWithPath:inMemoryIdentifier:library:propertyMapper:](v82);
      }
    }
  }
LABEL_17:

  return v13;
}

- (void)setUpWithMailboxProvider:(id)a3 remoteSearchProvider:(id)a4
{
  id v87 = a3;
  id v88 = a4;
  v6 = [MFMailboxPersistence_iOS alloc];
  v7 = [(MFPersistence_iOS *)self database];
  v8 = [(MFPersistence_iOS *)self library];
  v9 = [(MFMailboxPersistence_iOS *)v6 initWithMailboxProvider:v87 database:v7 library:v8];
  mailboxPersistence = self->_mailboxPersistence;
  self->_mailboxPersistence = v9;

  id v11 = [MFMessagePersistence_iOS alloc];
  v12 = [(MFPersistence_iOS *)self mailboxPersistence];
  v13 = [(MFPersistence_iOS *)self database];
  v14 = [(MFPersistence_iOS *)self userProfileProvider];
  v15 = [(EDPersistence *)self blockedSenderManager];
  v16 = [(EDPersistence *)self vipManager];
  v17 = [(EDPersistence *)self hookRegistry];
  id v18 = [(MFPersistence_iOS *)self library];
  v19 = [(MFMessagePersistence_iOS *)v11 initWithMailboxPersistence:v12 database:v13 userProfileProvider:v14 blockedSenderManager:v15 vipReader:v16 hookRegistry:v17 library:v18];
  messagePersistence = self->_messagePersistence;
  self->_messagePersistence = v19;

  id v21 = objc_alloc(MEMORY[0x1E4F60A90]);
  businessPersistence = self->_businessPersistence;
  categoryPersistence = self->_categoryPersistence;
  v24 = self->_messagePersistence;
  v25 = [(EDPersistence *)self hookRegistry];
  v26 = (EDBusinessCloudStorage *)[v21 initWithBusinessPersistence:businessPersistence categoryPersistence:categoryPersistence messagePersistence:v24 hookRegistry:v25];
  businessCloudStorage = self->_businessCloudStorage;
  self->_businessCloudStorage = v26;

  id v28 = objc_alloc(MEMORY[0x1E4F60B48]);
  id v29 = [(MFPersistence_iOS *)self database];
  v30 = [v29 schema];
  v31 = [(MFPersistence_iOS *)self database];
  uint64_t v32 = [v31 protectedSchema];
  v33 = [(MFPersistence_iOS *)self accountsProvider];
  v34 = [(EDPersistence *)self vipManager];
  uint64_t v35 = [v28 initWithSchema:v30 protectedSchema:v32 accountsProvider:v33 vipManager:v34 messagePersistence:self->_messagePersistence mailboxPersistence:self->_mailboxPersistence];

  objc_super v86 = (void *)v35;
  [(EDMessagePersistence *)self->_messagePersistence setQueryParser:v35];
  id v36 = objc_alloc(MEMORY[0x1E4F60BB8]);
  database = self->_database;
  id v38 = [(EDPersistence *)self hookRegistry];
  v39 = (EDReadLaterPersistence *)[v36 initWithDatabase:database hookRegistry:v38];
  readLaterPersistence = self->_readLaterPersistence;
  self->_readLaterPersistence = v39;

  id v41 = objc_alloc(MEMORY[0x1E4F60A80]);
  id v42 = self->_messagePersistence;
  uint64_t v43 = [(MFPersistence_iOS *)self remoteContentURLSession];
  v44 = (EDBIMIManager *)[v41 initWithMessagePersistence:v42 urlSession:v43];
  bimiManager = self->_bimiManager;
  self->_bimiManager = v44;

  v46 = [MFMessageChangeManager_iOS alloc];
  id v85 = [(MFPersistence_iOS *)self library];
  id v84 = [(MFPersistence_iOS *)self database];
  id v47 = [(MFPersistence_iOS *)self localActionPersistence];
  uint64_t v48 = self->_messagePersistence;
  v49 = [(MFPersistence_iOS *)self serverMessagePersistenceFactory];
  BOOL v50 = [(MFPersistence_iOS *)self readLaterPersistence];
  uint64_t v51 = [(MFPersistence_iOS *)self categoryPersistence];
  v52 = self->_bimiManager;
  uint64_t v53 = [(EDPersistence *)self hookRegistry];
  v54 = [(EDPersistence *)self hookRegistry];
  v55 = [(MFMessageChangeManager_iOS *)v46 initWithLibrary:v85 database:v84 localActionPersistence:v47 messagePersistence:v48 serverMessagePersistenceFactory:v49 readLaterPersistence:v50 categoryPersistence:v51 bimiManager:v52 hookResponder:v53 hookRegistry:v54];
  messageChangeManager = self->_messageChangeManager;
  self->_messageChangeManager = v55;

  v57 = (EDAttachmentPersistenceManager *)[objc_alloc(MEMORY[0x1E4F60A78]) initWithDatabase:self->_database messagePersistence:self->_messagePersistence];
  attachmentPersistenceManager = self->_attachmentPersistenceManager;
  self->_attachmentPersistenceManager = v57;

  id v59 = objc_alloc(MEMORY[0x1E4F60C90]);
  v60 = self->_messagePersistence;
  v61 = [(MFPersistence_iOS *)self categoryPersistence];
  uint64_t v62 = [(MFPersistence_iOS *)self database];
  v63 = [(EDPersistence *)self hookRegistry];
  uint64_t v64 = [(EDPersistence *)self vipManager];
  v65 = [(EDPersistence *)self blockedSenderManager];
  uint64_t v66 = (EDThreadPersistence *)[v59 initWithMessagePersistence:v60 categoryPersistence:v61 database:v62 hookRegistry:v63 vipManager:v64 blockedSenderManager:v65];
  threadPersistence = self->_threadPersistence;
  self->_threadPersistence = v66;

  id v68 = objc_alloc(MEMORY[0x1E4F60BC0]);
  v69 = [(EDPersistence *)self hookRegistry];
  v70 = self->_messagePersistence;
  uint64_t v71 = [(EDPersistence *)self alarmScheduler];
  v72 = (EDRemindMeNotificationController *)[v68 initWithHookRegistry:v69 messagePersistence:v70 alarmScheduler:v71];
  remindMeNotificationController = self->_remindMeNotificationController;
  self->_remindMeNotificationController = v72;

  [(MFPersistence_iOS *)self _configureAttachmentPersistenceManager];
  id v74 = objc_alloc(MEMORY[0x1E4F60AD8]);
  v75 = self->_database;
  v76 = self->_messagePersistence;
  uint64_t v77 = [(EDPersistence *)self hookRegistry];
  v78 = (EDDataDetectionPersistence *)[v74 initWithDatabase:v75 messagePersistence:v76 hookResponder:v77];
  dataDetectionPersistence = self->_dataDetectionPersistence;
  self->_dataDetectionPersistence = v78;

  v80 = [(EDPersistence *)self hookRegistry];
  [v80 registerMessageChangeHookResponder:self->_dataDetectionPersistence];

  [(MFPersistence_iOS *)self _configureSearchableIndexManagerIfNecessary];
  if (v88 && self->_searchableIndexManager)
  {
    v81 = (void *)[objc_alloc(MEMORY[0x1E4F60C40]) initWithSearchableIndexManager:self->_searchableIndexManager];
    v82 = (EDSearchProvider *)[objc_alloc(MEMORY[0x1E4F60C00]) initWithLocalSearchProvider:v81 remoteSearchProvider:v88];
    searchProvider = self->_searchProvider;
    self->_searchProvider = v82;
  }
}

- (void)_configureSearchableIndexManagerIfNecessary
{
  v3 = MFUserAgent();
  int v4 = [v3 canUseSpotlightIndex];

  if (v4)
  {
    v5 = [MFSearchableIndexManager_iOS alloc];
    database = self->_database;
    v7 = [(MFPersistence_iOS *)self messagePersistence];
    v8 = [(MFPersistence_iOS *)self richLinkPersistence];
    v9 = [(EDPersistence *)self hookRegistry];
    id v10 = [(MFSearchableIndexManager_iOS *)v5 initWithDatabase:database messagePersistence:v7 richLinkPersistence:v8 hookResponder:v9];
    searchableIndexManager = self->_searchableIndexManager;
    self->_searchableIndexManager = v10;

    v12 = [(EDPersistence *)self hookRegistry];
    [v12 registerMessageChangeHookResponder:self->_searchableIndexManager];

    v13 = [(EDPersistence *)self hookRegistry];
    [v13 registerCategoryChangeHookResponder:self->_searchableIndexManager];

    v14 = +[MFPersistence_iOS log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "User agent says canUseSpotlightIndex - Enabling searchable index.", v15, 2u);
    }
  }
}

- (void)_configureAttachmentPersistenceManager
{
  id v3 = [(EDPersistence *)self hookRegistry];
  [v3 registerMessageChangeHookResponder:self->_attachmentPersistenceManager];
}

- (void)scheduleRecurringActivity
{
  v4.receiver = self;
  v4.super_class = (Class)MFPersistence_iOS;
  [(EDPersistence *)&v4 scheduleRecurringActivity];
  id v3 = [(MFPersistence_iOS *)self library];
  [v3 scheduleRecurringActivity];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"MFPersistence_iOS.m", 248, @"%s can only be called from unit tests", "-[MFPersistence_iOS test_tearDown]");
  }
  v6.receiver = self;
  v6.super_class = (Class)MFPersistence_iOS;
  [(EDPersistence *)&v6 test_tearDown];
  objc_super v4 = [(MFPersistence_iOS *)self threadPersistence];
  objc_msgSend(v4, "test_tearDown");
}

- (id)persistenceStatistics
{
  id v3 = [(MFPersistence_iOS *)self messagePersistence];
  objc_super v4 = [v3 collectStatistics];

  v13.receiver = self;
  v13.super_class = (Class)MFPersistence_iOS;
  v5 = [(EDPersistence *)&v13 persistenceStateWithStatistics:v4];
  objc_super v6 = (void *)[v5 mutableCopy];

  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", objc_msgSend(v4, "protectedDataAvailable"));
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F60050]];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "messagesMarkedAsJournaled"));
  [v6 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F60038]];

  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "mailboxesNeedingReconcilication"));
  [v6 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F5FFF8]];

  id v10 = [(MFPersistence_iOS *)self searchableIndexStatistics];
  [v6 addEntriesFromDictionary:v10];

  if ([v4 protectedDataAvailable])
  {
    id v11 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", objc_msgSend(v4, "protectedMessageData"));
    [v6 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F60058]];
  }
  return v6;
}

- (id)searchableIndexStatistics
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(MFPersistence_iOS *)self searchableIndexManager];
  objc_super v4 = [v3 persistence];
  v5 = [v4 statistics];
  objc_super v6 = (void *)[v5 mutableCopy];

  v7 = objc_opt_new();
  v8 = [(MFPersistence_iOS *)self serverMessagesIndexer];
  v9 = [v7 completionHandlerAdapter];
  [v8 getIndexingStatisticsWithCompletion:v9];

  id v10 = [v7 future];
  id v16 = 0;
  id v11 = [v10 resultWithTimeout:&v16 error:60.0];
  id v12 = v16;

  if (v11)
  {
    [v6 addEntriesFromDictionary:v11];
  }
  else
  {
    objc_super v13 = +[MFPersistence_iOS log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v12;
      _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "Error getting remote indexing statistics: %@", buf, 0xCu);
    }
  }
  v14 = (void *)[v6 copy];

  return v14;
}

- (void)categoryRulesController:(id)a3 didReceiveOverrideRules:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v42 = a4;
  objc_super v4 = +[MFPersistence_iOS log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v58) = [v42 count];
    _os_log_impl(&dword_1A7EFF000, v4, OS_LOG_TYPE_DEFAULT, "Syncing %d rules from web", buf, 8u);
  }

  if (_os_feature_enabled_impl())
  {
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v42;
    uint64_t v5 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
    if (v5)
    {
      uint64_t v44 = *MEMORY[0x1E4F5FCC8];
      uint64_t v45 = *(void *)v51;
      do
      {
        uint64_t v46 = v5;
        for (uint64_t i = 0; i != v46; ++i)
        {
          if (*(void *)v51 != v45) {
            objc_enumerationMutation(obj);
          }
          v7 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          v8 = [v7 category];
          int v9 = [v8 isEqualToString:&stru_1EFF11268];

          id v10 = [v7 category];
          uint64_t v11 = EMCategoryTypeFromString();

          id v12 = [v7 address];
          uint64_t v48 = [v12 emailAddress];

          objc_super v13 = [v7 address];
          v14 = [v13 displayName];

          id v15 = v48;
          id v16 = v14;
          v17 = (void *)[objc_alloc(MEMORY[0x1E4F60800]) initWithString:v15];
          [v17 setDisplayName:v16];
          id v18 = [v17 emailAddressValue];
          uint64_t v19 = v18;
          if (v18)
          {
            id v49 = v18;
          }
          else
          {
            uint64_t v20 = [v17 stringValue];
            id v21 = (void *)v20;
            if (v20) {
              uint64_t v22 = (void *)v20;
            }
            else {
              uint64_t v22 = v15;
            }
            id v49 = v22;
          }
          v23 = [(MFPersistence_iOS *)self messagePersistence];
          uint64_t v24 = [v23 findAddressIDForAddress:v49];

          if (v24 == v44)
          {
            v25 = +[MFPersistence_iOS log];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
            {
              v26 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForAddress:", v49);
              [(MFPersistence_iOS *)v26 categoryRulesController:&v55 didReceiveOverrideRules:v25];
            }
          }
          else
          {
            uint64_t v27 = [(MFPersistence_iOS *)self businessPersistence];
            v25 = [v27 lastModifiedDateForAddressID:v24];

            id v28 = (void *)MEMORY[0x1E4F1C9C8];
            id v29 = [v7 categoryUpdateTime];
            [v29 doubleValue];
            v30 = objc_msgSend(v28, "dateWithTimeIntervalSince1970:");

            if (v25 && (objc_msgSend(v30, "ef_isLaterThanDate:", v25) & 1) == 0)
            {
              v33 = +[MFPersistence_iOS log];
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1A7EFF000, v33, OS_LOG_TYPE_DEFAULT, "Skipping the override, lastModifiedDate is older than existing timestamp", buf, 2u);
              }
            }
            else
            {
              v31 = +[MFPersistence_iOS log];
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v58 = v24;
                _os_log_impl(&dword_1A7EFF000, v31, OS_LOG_TYPE_DEFAULT, "AddressID: %lld", buf, 0xCu);
              }

              if (v9)
              {
                uint64_t v32 = +[MFPersistence_iOS log];
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1A7EFF000, v32, OS_LOG_TYPE_DEFAULT, "Removing User override/Setting to Automatic", buf, 2u);
                }

                v33 = [(MFPersistence_iOS *)self businessPersistence];
                v34 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v24];
                v61 = v34;
                uint64_t v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
                [v33 removeUserOverrideForAddressIDs:v35 timestamp:v30];
              }
              else
              {
                id v36 = +[MFPersistence_iOS log];
                if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
                {
                  id v37 = [v7 category];
                  id v38 = objc_msgSend(MEMORY[0x1E4F60E00], "ec_partiallyRedactedStringForAddress:", v49);
                  *(_DWORD *)buf = 138412546;
                  uint64_t v58 = (uint64_t)v37;
                  __int16 v59 = 2112;
                  v60 = v38;
                  _os_log_impl(&dword_1A7EFF000, v36, OS_LOG_TYPE_DEFAULT, "Setting to %@ for address: %@", buf, 0x16u);
                }
                v33 = [(MFPersistence_iOS *)self businessPersistence];
                v39 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v24];
                uint64_t v56 = v39;
                uint64_t v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
                [v33 insertOrUpdateUserOverrideForAddressIDs:v40 category:v11 timestamp:v30];
              }
            }
          }
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v50 objects:v62 count:16];
      }
      while (v5);
    }
  }
  id v41 = +[MFPersistence_iOS log];
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A7EFF000, v41, OS_LOG_TYPE_DEFAULT, "Syncing completed.", buf, 2u);
  }
}

- (void)setAccountsProvider:(id)a3
{
}

- (id)database
{
  return objc_getProperty(self, a2, 208, 1);
}

- (id)dataDetectionPersistence
{
  return objc_getProperty(self, a2, 216, 1);
}

- (id)localActionPersistence
{
  return objc_getProperty(self, a2, 224, 1);
}

- (id)mailboxActionPersistence
{
  return self->_mailboxActionPersistence;
}

- (void)setMailboxPersistence:(id)a3
{
}

- (id)serverMessagePersistenceFactory
{
  return objc_getProperty(self, a2, 280, 1);
}

- (id)remoteContentURLCache
{
  return self->_remoteContentURLCache;
}

- (void)setRemoteContentURLCache:(id)a3
{
}

- (id)remoteContentURLSession
{
  return self->_remoteContentURLSession;
}

- (void)setRemoteContentURLSession:(id)a3
{
}

- (id)readLaterPersistence
{
  return objc_getProperty(self, a2, 360, 1);
}

- (id)bimiManager
{
  return self->_bimiManager;
}

- (id)diagnosticsController
{
  return self->_diagnosticsController;
}

- (void)setUserProfileProvider:(id)a3
{
}

- (MCCCategoryRulesController)rulesController
{
  return self->_rulesController;
}

- (MFMailMessageLibrary)library
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_library);
  return (MFMailMessageLibrary *)WeakRetained;
}

- (void)setLibrary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_library);
  objc_storeStrong((id *)&self->_rulesController, 0);
  objc_storeStrong((id *)&self->_userProfileProvider, 0);
  objc_storeStrong((id *)&self->_categoryPersistence, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_storeStrong((id *)&self->_businessCloudStorage, 0);
  objc_storeStrong((id *)&self->_businessPersistence, 0);
  objc_storeStrong((id *)&self->_remindMeNotificationController, 0);
  objc_storeStrong((id *)&self->_bimiManager, 0);
  objc_storeStrong((id *)&self->_readLaterPersistence, 0);
  objc_storeStrong((id *)&self->_remoteContentURLSession, 0);
  objc_storeStrong((id *)&self->_remoteContentURLCache, 0);
  objc_storeStrong((id *)&self->_remoteContentCacheConfiguration, 0);
  objc_storeStrong((id *)&self->_attachmentPersistenceManager, 0);
  objc_storeStrong((id *)&self->_richLinkPersistence, 0);
  objc_storeStrong((id *)&self->_remoteContentPersistence, 0);
  objc_storeStrong((id *)&self->_remoteContentManager, 0);
  objc_storeStrong((id *)&self->_senderPersistence, 0);
  objc_storeStrong((id *)&self->_threadPersistence, 0);
  objc_storeStrong((id *)&self->_serverMessagePersistenceFactory, 0);
  objc_storeStrong((id *)&self->_searchableIndexManager, 0);
  objc_storeStrong((id *)&self->_searchProvider, 0);
  objc_storeStrong((id *)&self->_messagePersistence, 0);
  objc_storeStrong((id *)&self->_messageChangeManager, 0);
  objc_storeStrong((id *)&self->_mailboxPersistence, 0);
  objc_storeStrong((id *)&self->_mailboxActionPersistence, 0);
  objc_storeStrong((id *)&self->_localActionPersistence, 0);
  objc_storeStrong((id *)&self->_dataDetectionPersistence, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_conversationPersistence, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_serverMessagesIndexer, 0);
}

- (void)setUpWithMailboxProvider:(id)a3 remoteSearchProvider:(id)a4 serverMessagesIndexer:(id)a5
{
  objc_storeStrong((id *)&self->_serverMessagesIndexer, a5);
  id v8 = a4;
  id v9 = a3;
  -[MFPersistence_iOS setUpWithMailboxProvider:remoteSearchProvider:](self, "setUpWithMailboxProvider:remoteSearchProvider:");
}

- (MFServerMessagesIndexer)serverMessagesIndexer
{
  return self->_serverMessagesIndexer;
}

- (void)initWithPath:(os_log_t)log inMemoryIdentifier:library:propertyMapper:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Cannot load MCCKit framework", v1, 2u);
}

- (void)initWithPath:(os_log_t)log inMemoryIdentifier:library:propertyMapper:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Cannot create Rules listener", v1, 2u);
}

- (void)categoryRulesController:(void *)a3 didReceiveOverrideRules:(os_log_t)log .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *a3 = a1;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "Unable to find addressID with %@", buf, 0xCu);
}

@end