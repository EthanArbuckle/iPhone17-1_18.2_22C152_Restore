@interface CDPeopleDaemon
+ (BOOL)isKnowledgeAgent;
+ (BOOL)writeRepopulationCheckpoint:(id)a3;
+ (id)machServiceName;
+ (id)readRepopulationCheckpoint;
- (BOOL)adjustPosixPermissionsForStorage:(id)a3;
- (BOOL)isClassCLocked;
- (BOOL)isKnowledgeAgent;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (BOOL)requestInteractionRepopulation;
- (BOOL)versionCheckAndUpgradeIfNecessaryAndPossible;
- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3;
- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4;
- (CDPeopleDaemon)initWithUserKnowledgeStore:(id)a3;
- (_CDInteractionStore)store;
- (_DKKnowledgeQuerying)knowledgeStore;
- (_PSContactSuggester)contactSuggester;
- (_PSEnsembleModel)ensembleModel;
- (_PSFamilyRecommender)familyRecommender;
- (_PSMessagesPinningSuggester)messagesPinningSuggester;
- (_PSSuggester)suggester;
- (id)workQueue;
- (int64_t)readVersionNumberFromDefaults;
- (void)_maintainPrivacy;
- (void)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4 reply:(id)a5;
- (void)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4 reply:(id)a5;
- (void)adviseInteractionsUsingSettings:(id)a3 reply:(id)a4;
- (void)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5 reply:(id)a6;
- (void)autocompleteSearchResultsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)candidatesForShareSheetRanking:(id)a3;
- (void)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3 reply:(id)a4;
- (void)contactSuggestionsWithMaxSuggestions:(id)a3 excludedContactIds:(id)a4 reply:(id)a5;
- (void)countContactsUsingPredicate:(id)a3 reply:(id)a4;
- (void)countInteractionsUsingPredicate:(id)a3 reply:(id)a4;
- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 reply:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 reply:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 reply:(id)a5;
- (void)deleteInteractionsWithBundleId:(id)a3 reply:(id)a4;
- (void)familyRecommendedSuggestionsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)handleError:(id)a3;
- (void)logSizeOfStorage:(id)a3;
- (void)maintainPrivacy;
- (void)mapsSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5;
- (void)photosContactInferencesSuggestionsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)photosRelationshipSuggestionsWithPredictionContext:(id)a3 reply:(id)a4;
- (void)populateAppSharesCache;
- (void)populateAppUsageCache;
- (void)populatePeopleSuggesterCaches;
- (void)provideFeedbackForContactsAutocompleteSuggestions:(id)a3;
- (void)provideMessagesPinningFeedback:(id)a3;
- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6;
- (void)rankCandidateContacts:(id)a3 usingSettings:(id)a4 reply:(id)a5;
- (void)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4 reply:(id)a5;
- (void)rankedFamilySuggestionsWithReply:(id)a3;
- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 excludeBackfillSuggestions:(BOOL)a6 reply:(id)a7;
- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 reply:(id)a6;
- (void)rankedHandlesFromCandidateHandles:(id)a3 reply:(id)a4;
- (void)rankedMessagesPinsWithMaxSuggestions:(id)a3 reply:(id)a4;
- (void)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4 reply:(id)a5;
- (void)rankedSiriMLCRHandlesFromContext:(id)a3 handles:(id)a4 reply:(id)a5;
- (void)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5 reply:(id)a6;
- (void)recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6;
- (void)refreshPeopleSuggesterCaches;
- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(id)a4 reply:(id)a5;
- (void)reportPeopleStatistics;
- (void)saveFeedbackInCoreDuetd:(id)a3 forSessionId:(id)a4 feedbackActionType:(int64_t)a5 isFallbackFetch:(BOOL)a6 reply:(id)a7;
- (void)setIsKnowledgeAgent:(BOOL)a3;
- (void)setupDataProtectionChangeHandler;
- (void)shareExtensionSuggestionsFromContext:(id)a3 reply:(id)a4;
- (void)suggestInteractionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5;
- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4 reply:(id)a5;
- (void)updateInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6;
- (void)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4 reply:(id)a5;
- (void)writeVersionNumberToDefaults:(unint64_t)a3;
- (void)zkwSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5;
@end

@implementation CDPeopleDaemon

- (void)rankedMessagesPinsWithMaxSuggestions:(id)a3 reply:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void *))a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = _CDCurrentOrXPCProcessName();
      int v14 = 138543362;
      v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Suggesting message pins for client %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v10 = [(CDPeopleDaemon *)self messagesPinningSuggester];
    id v11 = [v6 integerValue];
    v12 = +[NSDate date];
    v13 = [v10 chatGuidsForPinningHeuristicApproachWithMaxSuggestions:v11 forReferenceDate:v12];
    v7[2](v7, v13);
  }
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  id v6 = +[NSXPCInterface interfaceWithProtocol:&OBJC_PROTOCOL____CDInteractionXPCProtocol];
  setClassesForCDInteractionXPCInterface();
  [v5 setExportedInterface:v6];
  [v5 _setQueue:self->_workQueue];
  v7 = [v5 valueForEntitlement:@"com.apple.coreduetd.allow"];
  v8 = [v5 valueForEntitlement:@"com.apple.coreduetd.people"];
  v9 = [v5 valueForEntitlement:@"com.apple.private.contactsui"];
  v10 = [v5 valueForEntitlement:@"com.apple.private.contacts"];
  id v11 = v10;
  if (v7)
  {
    v12 = v7;
  }
  else if (v8)
  {
    v12 = v8;
  }
  else
  {
    if (!v9)
    {
      if (v10 && [v10 BOOLValue]) {
        goto LABEL_8;
      }
      goto LABEL_13;
    }
    v12 = v9;
  }
  if ([v12 BOOLValue])
  {
LABEL_8:
    v13 = objc_alloc_init(CDPeopleDaemonConnection);
    [(CDPeopleDaemonConnection *)v13 setDaemon:self];
    [(CDPeopleDaemonConnection *)v13 setQueryInteractionsOnlyAuthorization:0];
    [v5 setExportedObject:v13];
    int v14 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v17[0] = 67109120;
      v17[1] = [v5 processIdentifier];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Connection from PID %d accepted", (uint8_t *)v17, 8u);
    }

    [v5 resume];
    BOOL v15 = 1;
    goto LABEL_16;
  }
LABEL_13:
  v13 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(&v13->super, OS_LOG_TYPE_ERROR)) {
    sub_100021F00(v5, &v13->super);
  }
  BOOL v15 = 0;
LABEL_16:

  return v15;
}

- (_PSMessagesPinningSuggester)messagesPinningSuggester
{
  return self->_messagesPinningSuggester;
}

- (BOOL)isClassCLocked
{
  return [(_DKDataProtectionStateMonitor *)self->_dataProtection isDataAvailableFor:NSFileProtectionCompleteUntilFirstUserAuthentication] ^ 1;
}

- (CDPeopleDaemon)initWithUserKnowledgeStore:(id)a3
{
  id v4 = a3;
  id v5 = +[CDDPaths peopleDatabaseDirectory];
  id v6 = +[_CDInteractionStore storeWithDirectory:v5 knowledgeStore:v4 readOnly:1];
  v7 = [(CDPeopleDaemon *)self initWithKnowledgeStore:v4 interactionStore:v6];

  return v7;
}

- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3
{
  id v4 = a3;
  id v5 = +[CDDPaths peopleDatabaseDirectory];
  id v6 = +[_CDInteractionStore storeWithDirectory:v5 knowledgeStore:v4 readOnly:0];
  v7 = [(CDPeopleDaemon *)self initWithKnowledgeStore:v4 interactionStore:v6];

  return v7;
}

+ (BOOL)isKnowledgeAgent
{
  return 0;
}

+ (id)machServiceName
{
  unsigned int v2 = [a1 isKnowledgeAgent];
  v3 = (void **)&_CDInteractionMachServiceName;
  if (v2) {
    v3 = (void **)&_CDInteractionUserMachServiceName;
  }
  id v4 = *v3;

  return v4;
}

- (CDPeopleDaemon)initWithKnowledgeStore:(id)a3 interactionStore:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduet.people.CDPeopleDaemon", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  LODWORD(v9) = +[CDPeopleDaemon isKnowledgeAgent];
  self->_isKnowledgeAgent = (char)v9;
  v10 = +[CDPeopleDaemon machServiceName];
  if (v9)
  {
    v64.receiver = self;
    v64.super_class = (Class)CDPeopleDaemon;
    id v11 = [(CDPeopleDaemon *)&v64 initWithMachServiceName:v10];

    if (!v11) {
      goto LABEL_9;
    }
    objc_storeStrong((id *)&v11->_store, a4);
    [(CDPeopleDaemon *)v11 setDelegate:v11];
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.coreduet.knowledge-agent.people.work", v12);
    workQueue = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v13;

    BOOL v15 = (_DKDataProtectionStateMonitor *)objc_alloc_init((Class)_DKDataProtectionStateMonitor);
    dataProtection = v11->_dataProtection;
    v11->_dataProtection = v15;

    v17 = [sub_1000064B4() defaultConfiguration];
    id v18 = objc_alloc_init((Class)sub_1000065BC());
    [(_CDInteractionStore *)v11->_store setReadConcurrently:1];
    [v18 setInteractionStore:v11->_store];
    [v18 setKnowledgeStore:v7];
    ensembleModel = v11->_ensembleModel;
    v11->_ensembleModel = (_PSEnsembleModel *)v18;
    id v20 = v18;

    [v17 setSuggestionModel:v11->_ensembleModel];
    v21 = (_PSSuggester *)[objc_alloc((Class)_PSSuggester) initWithConfiguration:v17];
    suggester = v11->_suggester;
    v11->_suggester = v21;

    [(CDPeopleDaemon *)v11 populatePeopleSuggesterCaches];
  }
  else
  {
    v63.receiver = self;
    v63.super_class = (Class)CDPeopleDaemon;
    id v11 = [(CDPeopleDaemon *)&v63 initWithMachServiceName:v10];

    if (!v11) {
      goto LABEL_9;
    }
    p_store = (id *)&v11->_store;
    objc_storeStrong((id *)&v11->_store, a4);
    objc_storeStrong((id *)&v11->_knowledgeStore, a3);
    v24 = (_DKDataProtectionStateMonitor *)objc_alloc_init((Class)_DKDataProtectionStateMonitor);
    v25 = v11->_dataProtection;
    v11->_dataProtection = v24;

    uint64_t v26 = +[_CDInteractionAdviceEngine interactionAdviceEngineWithStore:v11->_store];
    advisor = v11->_advisor;
    v11->_advisor = (_CDInteractionAdviceEngine *)v26;

    [(CDPeopleDaemon *)v11 setDelegate:v11];
    uint64_t v28 = +[_CDInteractionPolicies interactionPolicies];
    policies = v11->_policies;
    v11->_policies = (_CDInteractionPolicies *)v28;

    v30 = +[_CDSiriLearningSettings sharedInstance];
    [v30 startSanitizingInteractionStore:v11->_store];

    v31 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v32 = dispatch_queue_create("com.apple.coreduetd.people.work", v31);
    v33 = v11->_workQueue;
    v11->_workQueue = (OS_dispatch_queue *)v32;

    v17 = [sub_1000064B4() defaultConfiguration];
    id v34 = objc_alloc_init((Class)sub_1000065BC());
    [(_CDInteractionStore *)v11->_store setReadConcurrently:1];
    [v34 setInteractionStore:v11->_store];
    [v34 setKnowledgeStore:v11->_knowledgeStore];
    [v34 registerWithTrial];
    objc_storeStrong((id *)&v11->_ensembleModel, v34);
    [v17 setSuggestionModel:v11->_ensembleModel];
    v35 = (_PSSuggester *)[objc_alloc((Class)_PSSuggester) initWithConfiguration:v17 feedbackRecording:1];
    v36 = v11->_suggester;
    v11->_suggester = v35;

    id v37 = objc_alloc_init((Class)_PSMessagesPinningSuggester);
    [v37 setInteractionStore:v11->_store];
    objc_storeStrong((id *)&v11->_messagesPinningSuggester, v37);
    uint64_t v69 = 0;
    v70 = &v69;
    uint64_t v71 = 0x2050000000;
    v38 = (void *)qword_100040EF0;
    uint64_t v72 = qword_100040EF0;
    if (!qword_100040EF0)
    {
      state.opaque[0] = (uint64_t)_NSConcreteStackBlock;
      state.opaque[1] = 3221225472;
      v66 = sub_10000D224;
      v67 = &unk_100038C00;
      v68 = &v69;
      sub_10000D090();
      Class Class = objc_getClass("_PSFamilyRecommender");
      *(void *)(v68[1] + 24) = Class;
      qword_100040EF0 = *(void *)(v68[1] + 24);
      v38 = (void *)v70[3];
    }
    id v57 = v8;
    id v58 = v7;
    v40 = v38;
    _Block_object_dispose(&v69, 8);
    id v41 = objc_alloc_init(v40);
    objc_storeStrong((id *)&v11->_familyRecommender, v41);
    id v42 = objc_alloc_init((Class)_PSContactSuggester);
    [v42 setInteractionStore:*p_store];
    objc_storeStrong((id *)&v11->_contactSuggester, v42);
    [(CDPeopleDaemon *)v11 setupDataProtectionChangeHandler];
    [(CDPeopleDaemon *)v11 versionCheckAndUpgradeIfNecessaryAndPossible];
    [(CDPeopleDaemon *)v11 populatePeopleSuggesterCaches];
    [*p_store closeStorage];
    objc_initWeak((id *)&state, v11);
    uint64_t v43 = _CDInteractionMachServiceName;
    v61[0] = _NSConcreteStackBlock;
    v61[1] = 3221225472;
    v61[2] = sub_1000066C4;
    v61[3] = &unk_100038AE8;
    objc_copyWeak(&v62, (id *)&state);
    v44 = +[_CDPeriodicSchedulerJob jobWithPeriod:2 schedulerJobName:v43 handler:v61];
    v45 = +[_CDPeriodicScheduler sharedInstance];
    [v45 registerJob:v44];

    objc_destroyWeak(&v62);
    objc_destroyWeak((id *)&state);

    id v8 = v57;
    id v7 = v58;
  }

LABEL_9:
  if (v11->_isKnowledgeAgent)
  {
    objc_initWeak((id *)&state, v11);
    if (v11->_isKnowledgeAgent) {
      v46 = @"com.apple.coreduet.knowledge-agent.people.refresh-cache";
    }
    else {
      v46 = @"com.apple.coreduetd.people.refresh-cache";
    }
    v47 = v46;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100006758;
    v59[3] = &unk_100038AE8;
    objc_copyWeak(&v60, (id *)&state);
    v48 = +[_CDPeriodicSchedulerJob jobWithPeriod:1 schedulerJobName:v47 handler:v59];
    v49 = +[_CDPeriodicScheduler sharedInstance];
    [v49 registerJob:v48];

    objc_destroyWeak(&v60);
    objc_destroyWeak((id *)&state);
  }
  v50 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v51 = dispatch_queue_create("com.apple.peopleSuggestionQueue", v50);
  peopleSuggestionQueue = v11->_peopleSuggestionQueue;
  v11->_peopleSuggestionQueue = (OS_dispatch_queue *)v51;

  v53 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v54 = dispatch_queue_create("com.apple.appExtensionQueue", v53);
  appExtensionQueue = v11->_appExtensionQueue;
  v11->_appExtensionQueue = (OS_dispatch_queue *)v54;

  [(CDPeopleDaemon *)v11 resume];
  return v11;
}

- (id)workQueue
{
  return self->_workQueue;
}

- (void)setupDataProtectionChangeHandler
{
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000068C0;
  v3[3] = &unk_100038B10;
  objc_copyWeak(&v4, &location);
  [(_DKDataProtectionStateMonitor *)self->_dataProtection setChangeHandler:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (void)populatePeopleSuggesterCaches
{
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v3 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100021F8C();
    }
  }
  else
  {
    id v4 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.populatePeopleSuggesterCaches", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v4, &state);
    os_activity_scope_leave(&state);

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = dispatch_queue_create("com.apple.coreduet.PeopleSuggesterAppAndPeopleCache", v5);

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100006BCC;
    block[3] = &unk_100038A78;
    block[4] = self;
    dispatch_async(v3, block);
  }
}

- (void)refreshPeopleSuggesterCaches
{
  if (![(CDPeopleDaemon *)self isClassCLocked])
  {
    id v3 = [(CDPeopleDaemon *)self ensembleModel];
    [v3 refreshCaches];
  }
}

- (void)handleError:(id)a3
{
  id v4 = a3;
  if (v4
    && +[_CDErrorUtilities isCoreDataFatalError:v4])
  {
    workQueue = self->_workQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100006E64;
    v10[3] = &unk_100038B38;
    id v11 = v4;
    v12 = self;
    id v6 = v10;
    id v7 = workQueue;
    id v8 = (void *)os_transaction_create();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000D274;
    block[3] = &unk_100038AA0;
    id v14 = v8;
    id v15 = v6;
    id v9 = v8;
    dispatch_async(v7, block);
  }
}

- (int64_t)readVersionNumberFromDefaults
{
  unsigned int v2 = +[NSUserDefaults standardUserDefaults];
  id v3 = [v2 integerForKey:@"InteractionStoreVersion"];

  return (int64_t)v3;
}

- (void)writeVersionNumberToDefaults:(unint64_t)a3
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v4 setInteger:a3 forKey:@"InteractionStoreVersion"];
  [v4 synchronize];
}

- (BOOL)versionCheckAndUpgradeIfNecessaryAndPossible
{
  if ((id)[(CDPeopleDaemon *)self readVersionNumberFromDefaults] == (id)1) {
    return 1;
  }
  if (![(_DKDataProtectionStateMonitor *)self->_dataProtection isDataAvailableFor:NSFileProtectionCompleteUntilFirstUserAuthentication])return 0; {
  block[0] = _NSConcreteStackBlock;
  }
  block[1] = 3221225472;
  block[2] = sub_10000712C;
  block[3] = &unk_100038A78;
  void block[4] = self;
  if (qword_100040ED0 != -1) {
    dispatch_once(&qword_100040ED0, block);
  }
  id v4 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100021FC0();
  }

  BOOL v3 = 1;
  [(CDPeopleDaemon *)self writeVersionNumberToDefaults:1];
  return v3;
}

- (BOOL)adjustPosixPermissionsForStorage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 directory];
  v47[0] = v4;
  id v5 = [v3 databaseName];
  v47[1] = v5;
  id v6 = +[NSArray arrayWithObjects:v47 count:2];
  id v7 = +[NSString pathWithComponents:v6];

  id v8 = objc_opt_new();
  id v9 = +[NSString stringWithFormat:@"%@C.db", v7];
  [v8 addObject:v9];

  v10 = +[NSString stringWithFormat:@"%@C.db-wal", v7];
  [v8 addObject:v10];

  id v11 = +[NSString stringWithFormat:@"%@C.db-shm", v7];
  [v8 addObject:v11];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v8;
  id v12 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (!v12)
  {
    id v14 = 0;
    BOOL v32 = 1;
    goto LABEL_30;
  }
  id v13 = v12;
  id v34 = v7;
  id v35 = v3;
  id v14 = 0;
  uint64_t v15 = *(void *)v41;
  v16 = &ADClientAddValueForScalarKey_ptr;
  while (2)
  {
    v17 = 0;
    id v36 = v13;
    do
    {
      if (*(void *)v41 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * (void)v17);
      v19 = [v16[188] defaultManager];
      unsigned __int8 v20 = [v19 fileExistsAtPath:v18];

      if (v20)
      {
        v21 = [v16[188] defaultManager];
        id v39 = v14;
        v22 = [v21 attributesOfItemAtPath:v18 error:&v39];
        id v23 = v39;

        if (!v22)
        {
          v22 = +[_CDLogging interactionChannel];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
            sub_1000221E4();
          }
          id v14 = v23;
          goto LABEL_28;
        }
        if ([v22 filePosixPermissions] == (id)420)
        {
          v24 = +[_CDLogging interactionChannel];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v45 = v18;
            _os_log_debug_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "DB file %@ has correct POSIX permissions.", buf, 0xCu);
          }

          id v14 = v23;
          goto LABEL_18;
        }
        v25 = objc_opt_new();
        uint64_t v26 = +[NSNumber numberWithShort:420];
        [v25 setObject:v26 forKeyedSubscript:NSFilePosixPermissions];

        v27 = v16;
        uint64_t v28 = [v16[188] defaultManager];
        id v38 = v23;
        unsigned __int8 v29 = [v28 setAttributes:v25 ofItemAtPath:v18 error:&v38];
        id v14 = v38;

        v30 = +[_CDLogging interactionChannel];
        v31 = v30;
        if ((v29 & 1) == 0)
        {
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
            sub_10002224C();
          }

LABEL_28:
          BOOL v32 = 0;
          goto LABEL_29;
        }
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = v18;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Changed POSIX permission of %@ to 0644.", buf, 0xCu);
        }

        id v13 = v36;
        v16 = v27;
      }
      else
      {
        v22 = +[_CDLogging interactionChannel];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v45 = v18;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "DB file %@ does not exist. Skipping POSIX permissions check.", buf, 0xCu);
        }
      }
LABEL_18:

      v17 = (char *)v17 + 1;
    }
    while (v13 != v17);
    id v13 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    if (v13) {
      continue;
    }
    break;
  }
  BOOL v32 = 1;
LABEL_29:
  id v7 = v34;
  id v3 = v35;
LABEL_30:

  return v32;
}

+ (BOOL)writeRepopulationCheckpoint:(id)a3
{
  id v3 = a3;
  id v4 = +[NSUserDefaults standardUserDefaults];
  [v3 timeIntervalSinceReferenceDate];
  double v6 = v5;

  [v4 setDouble:@"InteractionRepopluationCheckpoint" forKey:v6];
  [v4 synchronize];
  id v7 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_1000222B4();
  }

  return 1;
}

+ (id)readRepopulationCheckpoint
{
  unsigned int v2 = +[NSUserDefaults standardUserDefaults];
  [v2 synchronize];
  id v3 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000222E8();
  }

  [v2 doubleForKey:@"InteractionRepopluationCheckpoint"];
  if (v4 == 0.0)
  {
    double v5 = 0;
  }
  else
  {
    double v5 = +[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:");
  }

  return v5;
}

- (BOOL)requestInteractionRepopulation
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  [v3 synchronize];
  double v4 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100022350();
  }

  unsigned __int8 v5 = [v3 BOOLForKey:@"EnableInteractionRepopulation"];
  if (v5)
  {
    double v6 = +[NSDate date];
    +[CDPeopleDaemon writeRepopulationCheckpoint:v6];

    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100007A10;
    handler[3] = &unk_100038B60;
    handler[4] = self;
    xpc_activity_register("com.apple.coreduet.people.repopulate", XPC_ACTIVITY_CHECK_IN, handler);
  }
  else
  {
    id v7 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      sub_10002231C();
    }
  }
  return v5;
}

- (void)recordInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, void))a6;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v11[2](v11, 0);
  }
  else
  {
    id v12 = [(_CDInteractionPolicies *)self->_policies filterAndModifyInteractionsWithPolicies:v10 enforceDataLimits:v8 enforcePrivacy:v7];
    id v13 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v12 count];
      uint64_t v15 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 134218242;
      id v21 = v14;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Saving %lu interactions for client %{public}@", buf, 0x16u);
    }
    store = self->_store;
    id v19 = 0;
    id v17 = [(_CDInteractionStore *)store recordInteractions:v12 error:&v19];
    id v18 = v19;
    ((void (**)(id, id))v11)[2](v11, v17);
    [(CDPeopleDaemon *)self handleError:v18];
  }
}

- (void)updateInteractions:(id)a3 enforceDataLimits:(BOOL)a4 enforcePrivacy:(BOOL)a5 reply:(id)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = (void (**)(id, void))a6;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v11[2](v11, 0);
  }
  else
  {
    id v12 = [(_CDInteractionPolicies *)self->_policies filterAndModifyInteractionsWithPolicies:v10 enforceDataLimits:v8 enforcePrivacy:v7];
    id v13 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [v12 count];
      uint64_t v15 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 134218242;
      id v21 = v14;
      __int16 v22 = 2114;
      id v23 = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Updating %lu interactions for client %{public}@", buf, 0x16u);
    }
    store = self->_store;
    id v19 = 0;
    id v17 = [(_CDInteractionStore *)store updateInteractions:v12 error:&v19];
    id v18 = v19;
    ((void (**)(id, id))v11)[2](v11, v17);
    [(CDPeopleDaemon *)self handleError:v18];
  }
}

- (void)queryInteractionsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
  else
  {
    id v13 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      unsigned __int8 v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Querying interactions for client %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100008450;
    v16[3] = &unk_100038B88;
    id v17 = v12;
    objc_copyWeak(&v18, (id *)buf);
    [(_CDInteractionStore *)store queryInteractionsUsingPredicate:v10 sortDescriptors:v11 limit:a5 completionHandler:v16];
    objc_destroyWeak(&v18);

    objc_destroyWeak((id *)buf);
  }
}

- (void)queryContactsUsingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
  else
  {
    id v13 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      unsigned __int8 v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Querying contacts for client %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000086FC;
    v16[3] = &unk_100038B88;
    id v17 = v12;
    objc_copyWeak(&v18, (id *)buf);
    [(_CDInteractionStore *)store queryContactsUsingPredicate:v10 sortDescriptors:v11 limit:a5 completionHandler:v16];
    objc_destroyWeak(&v18);

    objc_destroyWeak((id *)buf);
  }
}

- (void)countInteractionsUsingPredicate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    BOOL v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Counting interactions for client %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008984;
    v11[3] = &unk_100038BB0;
    id v12 = v7;
    objc_copyWeak(&v13, (id *)buf);
    [(_CDInteractionStore *)store countInteractionsUsingPredicate:v6 completionHandler:v11];
    objc_destroyWeak(&v13);

    objc_destroyWeak((id *)buf);
  }
}

- (void)countContactsUsingPredicate:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    BOOL v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Counting contacts for client %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100008C00;
    v11[3] = &unk_100038BB0;
    id v12 = v7;
    objc_copyWeak(&v13, (id *)buf);
    [(_CDInteractionStore *)store countContactsUsingPredicate:v6 completionHandler:v11];
    objc_destroyWeak(&v13);

    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsMatchingPredicate:(id)a3 sortDescriptors:(id)a4 limit:(unint64_t)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    (*((void (**)(id, void, void))v12 + 2))(v12, 0, 0);
  }
  else
  {
    id v13 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      id v23 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Deleting interactions matching predicate for client %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    id v16 = objc_alloc((Class)NSString);
    id v17 = _CDCurrentOrXPCProcessName();
    id v18 = [v16 initWithFormat:@"for client %@", v17];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100008EE8;
    v19[3] = &unk_100038BB0;
    id v20 = v12;
    objc_copyWeak(&v21, (id *)buf);
    [(_CDInteractionStore *)store deleteInteractionsMatchingPredicate:v10 sortDescriptors:v11 limit:a5 debuggingReason:v18 completionHandler:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    (*((void (**)(id, void, void))v7 + 2))(v7, 0, 0);
  }
  else
  {
    BOOL v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Deleting interactions with bundle id for client %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100009164;
    v11[3] = &unk_100038BB0;
    id v12 = v7;
    objc_copyWeak(&v13, (id *)buf);
    [(_CDInteractionStore *)store deleteInteractionsWithBundleId:v6 completionHandler:v11];
    objc_destroyWeak(&v13);

    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 account:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    id v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting interactions with bundle id and account for client %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000093F4;
    v14[3] = &unk_100038BB0;
    id v15 = v10;
    objc_copyWeak(&v16, (id *)buf);
    [(_CDInteractionStore *)store deleteInteractionsWithBundleId:v8 account:v9 completionHandler:v14];
    objc_destroyWeak(&v16);

    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifier:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    id v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting interactions with bundle id and domain for client %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100009684;
    v14[3] = &unk_100038BB0;
    id v15 = v10;
    objc_copyWeak(&v16, (id *)buf);
    [(_CDInteractionStore *)store deleteInteractionsWithBundleId:v8 domainIdentifier:v9 completionHandler:v14];
    objc_destroyWeak(&v16);

    objc_destroyWeak((id *)buf);
  }
}

- (void)deleteInteractionsWithBundleId:(id)a3 domainIdentifiers:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }
  else
  {
    id v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      id v18 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Deleting interactions with bundle id and domains for client %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    store = self->_store;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100009914;
    v14[3] = &unk_100038BB0;
    id v15 = v10;
    objc_copyWeak(&v16, (id *)buf);
    [(_CDInteractionStore *)store deleteInteractionsWithBundleId:v8 domainIdentifiers:v9 completionHandler:v14];
    objc_destroyWeak(&v16);

    objc_destroyWeak((id *)buf);
  }
}

- (void)suggestInteractionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *, id))a5;
  unsigned int v11 = [(CDPeopleDaemon *)self isClassCLocked];
  id v12 = +[_CDLogging instrumentationChannel];
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000224F0();
    }

    [v8 setSuggestionPath:@"suggestionPathClassCLocked"];
    v10[2](v10, &__NSArray0__struct, v8);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v14 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      id v21 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Suggesting interactions for client %{public}@", buf, 0xCu);
    }
    peopleSuggestionQueue = self->_peopleSuggestionQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100009BA4;
    v16[3] = &unk_100038BD8;
    void v16[4] = self;
    id v17 = v8;
    id v18 = v9;
    id v19 = v10;
    dispatch_async(peopleSuggestionQueue, v16);
  }
}

- (void)shareExtensionSuggestionsFromContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  unsigned int v8 = [(CDPeopleDaemon *)self isClassCLocked];
  id v9 = +[_CDLogging instrumentationChannel];
  id v10 = v9;
  if (v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000224F0();
    }

    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      unsigned int v11 = _CDCurrentOrXPCProcessName();
      int v14 = 138543362;
      id v15 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Suggesting extensions for client %{public}@", (uint8_t *)&v14, 0xCu);
    }
    id v12 = [(CDPeopleDaemon *)self suggester];
    id v13 = [v12 appExtensionSuggestionsFromContext:v6];
    v7[2](v7, v13);

    id v7 = (void (**)(id, void *))v12;
  }
}

- (void)candidatesForShareSheetRanking:(id)a3
{
  double v4 = (void (**)(void))a3;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    id v9 = (id)objc_opt_new();
    v4[2](v4);
  }
  else
  {
    unsigned __int8 v5 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = _CDCurrentOrXPCProcessName();
      *(_DWORD *)buf = 138543362;
      unsigned int v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Fetching candidates for Share Sheet ranking for client %{public}@", buf, 0xCu);
    }
    id v7 = [(CDPeopleDaemon *)self suggester];
    unsigned int v8 = [v7 candidatesForShareSheetRankingCompute];
    ((void (*)(void (**)(void), void *))v4[2])(v4, v8);
  }
}

- (void)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v7[2](v7, &__NSDictionary0__struct);
  }
  else
  {
    unsigned int v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = _CDCurrentOrXPCProcessName();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Fetching ephemeral features for Share Sheet for client: %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [(CDPeopleDaemon *)self ensembleModel];
    unsigned int v11 = [v10 computeEphemeralFeaturesWithPredictionContext:v6];
    v7[2](v7, v11);
  }
}

- (void)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, id))a5;
  id v10 = a4;
  unsigned int v11 = [(CDPeopleDaemon *)self isClassCLocked];
  int v12 = +[_CDLogging instrumentationChannel];
  id v13 = v12;
  if (v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Could not Validate CoreML model as device is class C locked", (uint8_t *)&v17, 2u);
    }

    v9[2](v9, v10);
  }
  else
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = _CDCurrentOrXPCProcessName();
      int v17 = 138543362;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Validating CoreML model for client %{public}@", (uint8_t *)&v17, 0xCu);
    }
    id v15 = [(CDPeopleDaemon *)self ensembleModel];
    uint64_t v16 = [v15 validateCoreMLModelWithRawInput:v8 predictionContext:v10];

    v9[2](v9, (id)v16);
    id v9 = (void (**)(id, id))v16;
    id v10 = v15;
  }
}

- (void)mapsSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    unsigned int v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = _CDCurrentOrXPCProcessName();
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Suggesting maps for client %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id v13 = [(CDPeopleDaemon *)self ensembleModel];
    int v14 = [v13 predictWithMapsPredictionContext:v8 maxSuggestions:[v9 integerValue]];
    v10[2](v10, v14);
  }
}

- (void)zkwSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    unsigned int v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = _CDCurrentOrXPCProcessName();
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Suggesting zero keyword for client %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id v13 = [(CDPeopleDaemon *)self ensembleModel];
    int v14 = [v13 suggestZKWSuggestionsWithPredictionContext:v8 maxSuggestions:[v9 integerValue]];
    v10[2](v10, v14);
  }
}

- (void)autocompleteSearchResultsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *))a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    id v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = _CDCurrentOrXPCProcessName();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Suggesting autocomplete for client %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [(CDPeopleDaemon *)self ensembleModel];
    unsigned int v11 = [v10 autocompleteSearchResultsWithPredictionContext:v6];
    v7[2](v7, v11);
  }
}

- (void)saveFeedbackInCoreDuetd:(id)a3 forSessionId:(id)a4 feedbackActionType:(int64_t)a5 isFallbackFetch:(BOOL)a6 reply:(id)a7
{
  BOOL v7 = a6;
  unsigned int v11 = (void (**)(id, uint64_t))a7;
  +[_PSEnsembleModel saveFeedback:a3 forSessionId:a4 feedbackActionType:a5 isFallbackFetch:v7];
  v11[2](v11, 1);
}

- (void)provideFeedbackForContactsAutocompleteSuggestions:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = _CDCurrentOrXPCProcessName();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Writing feedback for client %{public}@", (uint8_t *)&v8, 0xCu);
  }
  BOOL v7 = [(CDPeopleDaemon *)self suggester];
  [v7 writeFeedbackForContactsAutocompleteSuggestions:v4];
}

- (void)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    unsigned int v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = _CDCurrentOrXPCProcessName();
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Suggesting ranked names for client %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id v13 = [(CDPeopleDaemon *)self ensembleModel];
    int v14 = [v13 rankedNameSuggestionsWithPredictionContext:v8 name:v9];
    v10[2](v10, v14);
  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 reply:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  int v12 = (void (**)(id, void *))a6;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v12[2](v12, &__NSArray0__struct);
  }
  else
  {
    id v13 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = _CDCurrentOrXPCProcessName();
      int v17 = 138543362;
      id v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Suggesting ranked global suggestions for client %{public}@", (uint8_t *)&v17, 0xCu);
    }
    int v15 = [(CDPeopleDaemon *)self ensembleModel];
    uint64_t v16 = [v15 rankedGlobalSuggestionsWithPredictionContext:v10 contactsOnly:v8 maxSuggestions:[v11 integerValue]];
    v12[2](v12, v16);
  }
}

- (void)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4 maxSuggestions:(id)a5 excludeBackfillSuggestions:(BOOL)a6 reply:(id)a7
{
  BOOL v8 = a6;
  BOOL v10 = a4;
  id v12 = a3;
  id v13 = a5;
  int v14 = (void (**)(id, void *))a7;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v14[2](v14, &__NSArray0__struct);
  }
  else
  {
    int v15 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = _CDCurrentOrXPCProcessName();
      int v19 = 138543362;
      id v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Suggesting ranked global suggestions with backfill option for client %{public}@", (uint8_t *)&v19, 0xCu);
    }
    int v17 = [(CDPeopleDaemon *)self ensembleModel];
    id v18 = [v17 rankedGlobalSuggestionsWithPredictionContext:v12 contactsOnly:v10 maxSuggestions:[v13 integerValue] excludeBackfillSuggestions:v8];
    v14[2](v14, v18);
  }
}

- (void)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v13[2](v13, &__NSArray0__struct);
  }
  else
  {
    int v14 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = _CDCurrentOrXPCProcessName();
      int v18 = 138543362;
      int v19 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Suggesting ranked global suggestions for client %{public}@", (uint8_t *)&v18, 0xCu);
    }
    uint64_t v16 = [(CDPeopleDaemon *)self ensembleModel];
    int v17 = [v16 rankedGlobalSuggestionsForSiriNLWithPredictionContext:v10 integerValue:[v11 integerValue] interactionId:v12];
    v13[2](v13, v17);
  }
}

- (void)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    id v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = _CDCurrentOrXPCProcessName();
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Suggesting ranked autocomplete suggestions for client %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id v13 = [(CDPeopleDaemon *)self ensembleModel];
    int v14 = [v13 rankedAutocompleteSuggestionsFromContext:v8 candidates:v9];
    v10[2](v10, v14);
  }
}

- (void)provideMessagesPinningFeedback:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[_CDLogging instrumentationChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = _CDCurrentOrXPCProcessName();
    int v8 = 138543362;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Feedback for message pins for client %{public}@", (uint8_t *)&v8, 0xCu);
  }
  BOOL v7 = [(CDPeopleDaemon *)self messagesPinningSuggester];
  [v7 submitMessagesPinningFeedback:v4];
}

- (void)rankedFamilySuggestionsWithReply:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v4[2](v4, &__NSArray0__struct);
  }
  else
  {
    unsigned __int8 v5 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = _CDCurrentOrXPCProcessName();
      int v9 = 138543362;
      id v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Ranked family suggestions for client %{public}@", (uint8_t *)&v9, 0xCu);
    }
    BOOL v7 = [(CDPeopleDaemon *)self familyRecommender];
    int v8 = [v7 familyRecommendations];
    v4[2](v4, v8);
  }
}

- (void)familyRecommendedSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    int v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = _CDCurrentOrXPCProcessName();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Family recommended suggestions for client %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [(CDPeopleDaemon *)self familyRecommender];
    id v11 = [v10 familyRecommendationSuggestionsForShareSheetWithPredictionContext:v6];
    v7[2](v7, v11);
  }
}

- (void)photosRelationshipSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    int v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = _CDCurrentOrXPCProcessName();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Family recommended suggestions for client %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [(CDPeopleDaemon *)self familyRecommender];
    id v11 = [v10 suggestionsForPhotosRelationshipsWithPredictionContext:v6];
    v7[2](v7, v11);
  }
}

- (void)photosContactInferencesSuggestionsWithPredictionContext:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    int v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = _CDCurrentOrXPCProcessName();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Family recommended suggestions for client %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [(CDPeopleDaemon *)self familyRecommender];
    id v11 = [v10 suggestionsForPhotosContactInferencesWithPredictionContext:v6];
    v7[2](v7, v11);
  }
}

- (void)rankedSiriMLCRHandlesFromContext:(id)a3 handles:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSDictionary0__struct);
  }
  else
  {
    id v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = _CDCurrentOrXPCProcessName();
      int v15 = 138543362;
      uint64_t v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ranked Siri Handle Suggestions for client %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id v13 = [(CDPeopleDaemon *)self ensembleModel];
    int v14 = [v13 rankedSiriMLCRHandles:v9 context:v8];
    v10[2](v10, v14);
  }
}

- (void)rankedHandlesFromCandidateHandles:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v7[2](v7, &__NSDictionary0__struct);
  }
  else
  {
    id v8 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = _CDCurrentOrXPCProcessName();
      int v12 = 138543362;
      id v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Ranked Handle Suggestions for client %{public}@", (uint8_t *)&v12, 0xCu);
    }
    id v10 = [(CDPeopleDaemon *)self ensembleModel];
    id v11 = [v10 rankedHandlesFromCandidateHandles:v6];
    v7[2](v7, v11);
  }
}

- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSDictionary0__struct);
  }
  else
  {
    id v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = _CDCurrentOrXPCProcessName();
      int v16 = 138543362;
      int v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "App Usage Distribution for client %{public}@", (uint8_t *)&v16, 0xCu);
    }
    id v13 = [v9 integerValue];
    int v14 = [(CDPeopleDaemon *)self knowledgeStore];
    int v15 = +[_PSAppUsageUtilities relativeAppUsageProbabilitiesForCandidateBundleIds:v8 daysAgo:v13 knowledgeStore:v14];
    v10[2](v10, v15);
  }
}

- (void)contactSuggestionsWithMaxSuggestions:(id)a3 excludedContactIds:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    id v11 = +[_CDLogging instrumentationChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = _CDCurrentOrXPCProcessName();
      int v15 = 138543362;
      int v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Contact suggestions for client %{public}@", (uint8_t *)&v15, 0xCu);
    }
    id v13 = [(CDPeopleDaemon *)self contactSuggester];
    int v14 = [v13 contactSuggestionsWithMaxSuggestions:[v8 integerValue] excludeContactsByIdentifiers:v9];
    v10[2](v10, v14);
  }
}

- (void)rankCandidateContacts:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    id v11 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = _CDCurrentOrXPCProcessName();
      int v14 = 138543362;
      int v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Ranking candidates for client %{public}@", (uint8_t *)&v14, 0xCu);
    }
    id v13 = [(_CDInteractionAdviceEngine *)self->_advisor rankCandidateContacts:v8 usingSettings:v9];
    v10[2](v10, v13);
  }
}

- (void)adviseInteractionsUsingSettings:(id)a3 reply:(id)a4
{
  id v6 = a3;
  BOOL v7 = (void (**)(id, void *))a4;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v7[2](v7, &__NSArray0__struct);
  }
  else
  {
    id v8 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = _CDCurrentOrXPCProcessName();
      int v11 = 138543362;
      int v12 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Advising interactions with people for client %{public}@", (uint8_t *)&v11, 0xCu);
    }
    id v10 = [(_CDInteractionAdviceEngine *)self->_advisor adviseInteractionsUsingSettings:v6];
    v7[2](v7, v10);
  }
}

- (void)adviseInteractionsForDate:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    int v11 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = _CDCurrentOrXPCProcessName();
      int v14 = 138543362;
      int v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Advising interactions with people using time of day for client %{public}@", (uint8_t *)&v14, 0xCu);
    }
    id v13 = [(_CDInteractionAdviceEngine *)self->_advisor adviseInteractionsForDate:v8 usingSettings:v9];
    v10[2](v10, v13);
  }
}

- (void)adviseInteractionsForKeywordsInString:(id)a3 usingSettings:(id)a4 reply:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, void *))a5;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v10[2](v10, &__NSArray0__struct);
  }
  else
  {
    int v11 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = _CDCurrentOrXPCProcessName();
      int v14 = 138543362;
      int v15 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Advising interactions with people using a query for client %{public}@", (uint8_t *)&v14, 0xCu);
    }
    id v13 = [(_CDInteractionAdviceEngine *)self->_advisor adviseInteractionsForKeywordsInString:v8 usingSettings:v9];
    v10[2](v10, v13);
  }
}

- (void)adviseSocialInteractionsForDate:(id)a3 andSeedContacts:(id)a4 usingSettings:(id)a5 reply:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, void *))a6;
  if ([(CDPeopleDaemon *)self isClassCLocked])
  {
    v13[2](v13, &__NSArray0__struct);
  }
  else
  {
    int v14 = +[_CDLogging interactionChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = _CDCurrentOrXPCProcessName();
      int v17 = 138543362;
      int v18 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Advising interactions with people using social cues for client %{public}@", (uint8_t *)&v17, 0xCu);
    }
    int v16 = [(_CDInteractionAdviceEngine *)self->_advisor adviseSocialInteractionsForDate:v10 andSeedContacts:v11 usingSettings:v12];
    v13[2](v13, v16);
  }
}

- (void)tuneSocialAdvisorUsingSettings:(id)a3 heartBeatHandler:(id)a4 reply:(id)a5
{
  id v8 = (void (**)(void))a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    id v12 = _CDCurrentOrXPCProcessName();
    int v13 = 138543362;
    int v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Tuning social advisor for client %{public}@", (uint8_t *)&v13, 0xCu);
  }
  [(_CDInteractionAdviceEngine *)self->_advisor tuneSocialAdvisorUsingSettings:v10 heartBeatHandler:v9];

  v8[2](v8);
}

- (void)maintainPrivacy
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.maintainPrivacy", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  workQueue = self->_workQueue;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10000C3C8;
  v9[3] = &unk_100038A78;
  v9[4] = self;
  unsigned __int8 v5 = v9;
  id v6 = workQueue;
  BOOL v7 = (void *)os_transaction_create();
  state.opaque[0] = (uint64_t)_NSConcreteStackBlock;
  state.opaque[1] = 3221225472;
  id v11 = sub_10000D274;
  id v12 = &unk_100038AA0;
  id v13 = v7;
  id v14 = v5;
  id v8 = v7;
  dispatch_async(v6, &state);
}

- (void)_maintainPrivacy
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  id v3 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1000226DC();
  }

  kdebug_trace();
  id v4 = +[_CDLogging interactionSignpost];
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "MaintainPrivacy", " enableTelemetry=YES ", buf, 2u);
  }

  p_policies = &self->_policies;
  id v6 = [(_CDInteractionPolicies *)self->_policies whitelistedFirstPartyBundleIds];
  BOOL v7 = [(_CDInteractionPolicies *)self->_policies dateOfOldestAllowedInteractionForWhitelistedFirstPartyBundleIds];
  id v8 = +[NSPredicate predicateWithFormat:@"bundleId IN %@ AND startDate < %@", v6, v7];

  id v9 = (char *)[(_CDInteractionStore *)self->_store deleteInteractionsMatchingPredicate:v8 sortDescriptors:&__NSArray0__struct limit:[(_CDInteractionPolicies *)self->_policies maxNumberOfInteractionsDeleted] debuggingReason:@"_maintainPrivacy allowlisted first party deletion predicate" error:0];
  id v10 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100022648((id *)&self->_policies);
  }

  id v11 = [(_CDInteractionPolicies *)*p_policies whitelistedFirstPartyBundleIds];
  id v12 = [(_CDInteractionPolicies *)*p_policies dateOfOldestAllowedInteraction];
  id v13 = +[NSPredicate predicateWithFormat:@"NOT(bundleId IN %@) AND startDate < %@", v11, v12];

  id v14 = [(_CDInteractionStore *)self->_store deleteInteractionsMatchingPredicate:v13 sortDescriptors:&__NSArray0__struct limit:[(_CDInteractionPolicies *)*p_policies maxNumberOfInteractionsDeleted] debuggingReason:@"_maintainPrivacy denylisted apps deletion predicate" error:0];
  int v15 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    sub_1000225B4((id *)&self->_policies);
  }
  int v16 = &v9[(void)v14];

  id v17 = [(_CDInteractionStore *)self->_store deleteOldInteractionsIfNeededToLimitTotalNumber:[(_CDInteractionPolicies *)*p_policies maxNumberOfInteractionsStored] limit:[(_CDInteractionPolicies *)*p_policies maxNumberOfInteractionsDeleted]];
  int v18 = +[_CDLogging interactionChannel];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    sub_100022524((id *)&self->_policies);
  }

  [(CDPeopleDaemon *)self reportPeopleStatistics];
  [(_CDInteractionStore *)self->_store closeStorage];
  kdebug_trace();
  int v19 = +[_CDLogging interactionSignpost];
  if (os_signpost_enabled(v19))
  {
    *(_DWORD *)buf = 134349568;
    id v21 = v16;
    __int16 v22 = 2050;
    id v23 = v17;
    __int16 v24 = 2050;
    uint64_t v25 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v19, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "MaintainPrivacy", "LifespanLimitDeleted=%{signpost.telemetry:number1,public}lu TotalLimitDeleted=%{signpost.telemetry:number2,public}lu UserDoesNotExistDeleted=%{signpost.telemetry:number3,public}lu", buf, 0x20u);
  }
}

- (void)populateAppUsageCache
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.populateAppUsageCache", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v6.opaque[0] = 0;
  v6.opaque[1] = 0;
  os_activity_scope_enter(v3, &v6);
  os_activity_scope_leave(&v6);

  id v4 = sub_10000C87C();
  unsigned __int8 v5 = [(CDPeopleDaemon *)self knowledgeStore];
  [v4 cacheAppUsageDurations:v5];
}

- (void)populateAppSharesCache
{
  unsigned int v2 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.populateAppSharesCache", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v3.opaque[0] = 0;
  v3.opaque[1] = 0;
  os_activity_scope_enter(v2, &v3);
  os_activity_scope_leave(&v3);

  [sub_10000C87C() cacheSharesForEachApp];
}

- (void)logSizeOfStorage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 directory];
  v22[0] = v4;
  unsigned __int8 v5 = [v3 databaseName];

  v22[1] = v5;
  os_activity_scope_state_s v6 = +[NSArray arrayWithObjects:v22 count:2];
  BOOL v7 = +[NSString pathWithComponents:v6];

  id v8 = +[NSString stringWithFormat:@"%@C.db", v7];
  id v9 = +[NSFileManager defaultManager];
  id v10 = [v9 attributesOfItemAtPath:v8 error:0];

  if (v10)
  {
    id v11 = (char *)[v10 fileSize];
    id v12 = +[NSString stringWithFormat:@"%@C.db-wal", v7];
    id v13 = +[NSFileManager defaultManager];
    id v14 = [v13 attributesOfItemAtPath:v12 error:0];

    if (v14)
    {
      int v15 = &v11[(void)[v14 fileSize]];
      int v16 = +[_CDLogging interactionChannel];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        int v19 = v8;
        __int16 v20 = 2048;
        id v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "DatabaseSize for %@: %lluB", buf, 0x16u);
      }

      if (v15)
      {
        id v17 = +[_CDLogging interactionSignpost];
        if (os_signpost_enabled(v17))
        {
          *(_DWORD *)buf = 134349056;
          int v19 = v15;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DatabaseSize", "Size=%{signpost.telemetry:number1,public}lluB  enableTelemetry=YES ", buf, 0xCu);
        }

        +[_CDDiagnosticDataReporter setValue:v15 forScalarKey:@"com.apple.coreduet.interactionStore.databaseSize"];
      }
    }
  }
}

- (void)reportPeopleStatistics
{
  id v3 = _os_activity_create((void *)&_mh_execute_header, "Duet: com.apple.coreduetd.reportPeopleStatistics", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  id v4 = [(_CDInteractionStore *)self->_store interactionCountPerMechanism];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [v4 objectForKeyedSubscript:v10];
        id v12 = [v11 unsignedIntegerValue];

        v7 += (uint64_t)v12;
        id v13 = +[NSString stringWithFormat:@"%@.%@", @"com.apple.coreduet.interactionStore", v10];
        +[_CDDiagnosticDataReporter setValue:v12 forScalarKey:v13 limitingSigDigs:2];
      }
      id v6 = [v4 countByEnumeratingWithState:&v16 objects:v21 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  id v14 = +[NSString stringWithFormat:@"%@.total", @"com.apple.coreduet.interactionStore"];
  +[_CDDiagnosticDataReporter setValue:v7 forScalarKey:v14 limitingSigDigs:2];
  int v15 = [(_CDInteractionStore *)self->_store storage];
  [(CDPeopleDaemon *)self logSizeOfStorage:v15];
}

- (_CDInteractionStore)store
{
  return self->_store;
}

- (_DKKnowledgeQuerying)knowledgeStore
{
  return self->_knowledgeStore;
}

- (_PSSuggester)suggester
{
  return self->_suggester;
}

- (_PSEnsembleModel)ensembleModel
{
  return self->_ensembleModel;
}

- (_PSFamilyRecommender)familyRecommender
{
  return self->_familyRecommender;
}

- (_PSContactSuggester)contactSuggester
{
  return self->_contactSuggester;
}

- (BOOL)isKnowledgeAgent
{
  return self->_isKnowledgeAgent;
}

- (void)setIsKnowledgeAgent:(BOOL)a3
{
  self->_isKnowledgeAgent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactSuggester, 0);
  objc_storeStrong((id *)&self->_messagesPinningSuggester, 0);
  objc_storeStrong((id *)&self->_familyRecommender, 0);
  objc_storeStrong((id *)&self->_ensembleModel, 0);
  objc_storeStrong((id *)&self->_suggester, 0);
  objc_storeStrong((id *)&self->_knowledgeStore, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_appExtensionQueue, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_policies, 0);
  objc_storeStrong((id *)&self->_dataProtection, 0);

  objc_storeStrong((id *)&self->_advisor, 0);
}

@end