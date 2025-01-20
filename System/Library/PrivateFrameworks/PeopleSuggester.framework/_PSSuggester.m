@interface _PSSuggester
+ (BOOL)hasInitializedCache;
+ (id)suggesterWithDaemon;
+ (void)initializePSSuggesterCacheWithMaxSuggestionCount:(id)a3;
+ (void)setHasInitializedCache:(BOOL)a3;
- (BOOL)interactionAvailableForHandle:(id)a3;
- (BOOL)interactionAvailableForHandle:(id)a3 interactionStoreDB:(id)a4;
- (BOOL)isTransportBundleIDSupported:(id)a3;
- (_PSSuggester)init;
- (_PSSuggester)initWithConfiguration:(id)a3;
- (_PSSuggester)initWithConfiguration:(id)a3 feedbackRecording:(BOOL)a4;
- (_PSSuggester)initWithDaemonUsingConfiguration:(id)a3;
- (_PSSuggesterConfiguration)configuration;
- (id)_dateFormatter;
- (id)_getUserDaemonXPCConnection;
- (id)appExtensionSuggestionsFromContext:(id)a3;
- (id)autocompleteSearchResultsWithPredictionContext:(id)a3;
- (id)buildFilteringPredicateMatchingSuggestLessFeedback:(id)a3;
- (id)candidatesForShareSheetRanking;
- (id)candidatesForShareSheetRankingCompute;
- (id)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3;
- (id)contactStore;
- (id)familyRecommendationSuggestionsWithPredictionContext:(id)a3;
- (id)getCacheSuggestions;
- (id)hourOfDayProbabilitiesToInteractWithContact:(id)a3;
- (id)hourOfDayProbabilitiesToInteractWithContacts:(id)a3;
- (id)interactionCountForHandle:(id)a3 fetchLimit:(unint64_t)a4;
- (id)interactionCountForHandle:(id)a3 fetchLimit:(unint64_t)a4 interactionStoreDB:(id)a5;
- (id)photosContactInferencesSuggestionsWithPredictionContext:(id)a3;
- (id)photosRelationshipSuggestionsWithPredictionContext:(id)a3;
- (id)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4;
- (id)rankedFamilySuggestions;
- (id)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4;
- (id)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4;
- (id)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5;
- (id)rankedZKWSuggestionsFromContext:(id)a3;
- (id)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(int64_t)a4;
- (id)shareExtensionSuggestionsFromContext:(id)a3;
- (id)shareInformationForPhotoId:(id)a3 dateInterval:(id)a4;
- (id)shareInformationForPhotoId:(id)a3 dateInterval:(id)a4 interactionStoreDB:(id)a5;
- (id)shareSheetInteractionsFromContext:(id)a3;
- (id)shareSheetInteractionsFromContext:(id)a3 maximumNumberOfSuggestions:(int64_t)a4;
- (id)suggestInteractionsFromContext:(id)a3;
- (id)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4;
- (void)_recordFeedbackToInteractionStoreWithFeedback:(id)a3 mechanism:(int64_t)a4;
- (void)asyncShareExtensionSuggestionsFromContext:(id)a3 completionHandler:(id)a4;
- (void)asyncShareExtensionSuggestionsFromContext:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)asyncSuggestInteractionsFromContext:(id)a3 completionHandler:(id)a4;
- (void)asyncSuggestInteractionsFromContext:(id)a3 timeout:(double)a4 completionHandler:(id)a5;
- (void)candidatesForShareSheetRanking;
- (void)dealloc;
- (void)deleteInteractionsMatchingSuggestLessFeedback:(id)a3;
- (void)generatePSRTelemetry:(id)a3;
- (void)getCacheSuggestions;
- (void)provideFeedbackForContactsAutocompleteSuggestions:(id)a3;
- (void)provideFeedbackForMessagesZkwSuggestions:(id)a3;
- (void)provideFeedbackForSuggestions:(id)a3;
- (void)provideSuggestLessFeedbackForShareSheetSuggestion:(id)a3;
- (void)rankedFamilySuggestions;
- (void)showNotificationToFileARadarForUserStudyParticipants;
- (void)writeFeedbackForContactsAutocompleteSuggestions:(id)a3;
@end

@implementation _PSSuggester

- (_PSSuggester)init
{
  v3 = +[_PSSuggesterConfiguration defaultConfiguration];
  v4 = [(_PSSuggester *)self initWithConfiguration:v3];

  return v4;
}

+ (id)suggesterWithDaemon
{
  id v2 = objc_alloc((Class)a1);
  v3 = +[_PSSuggesterConfiguration defaultConfiguration];
  v4 = (void *)[v2 initWithDaemonUsingConfiguration:v3];

  return v4;
}

+ (void)setHasInitializedCache:(BOOL)a3
{
}

+ (BOOL)hasInitializedCache
{
  unsigned __int8 v2 = atomic_load(_hasInitializedCache);
  return v2 & 1;
}

+ (void)initializePSSuggesterCacheWithMaxSuggestionCount:(id)a3
{
  id v3 = +[_PSSuggesterCache defaultServiceWithMaxSuggestionCount:a3];
  +[_PSSuggester setHasInitializedCache:1];
  v4 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A314B000, v4, OS_LOG_TYPE_DEFAULT, "Initialized _PSSuggesterCache", v5, 2u);
  }
}

- (_PSSuggester)initWithDaemonUsingConfiguration:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_PSSuggester;
  v6 = [(_PSSuggester *)&v22 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v7->_lock._os_unfair_lock_opaque = 0;
    id v8 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v9 = [v8 initWithMachServiceName:*MEMORY[0x1E4F5B610] options:4096];
    connection = v7->_connection;
    v7->_connection = (NSXPCConnection *)v9;

    v11 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)v7->_connection setRemoteObjectInterface:v11];

    uint64_t v12 = _PSShareSheetSuggestionBundleIDMapping(0);
    appBundleIdToShareExtensionMapping = v7->_appBundleIdToShareExtensionMapping;
    v7->_appBundleIdToShareExtensionMapping = (NSDictionary *)v12;

    v14 = MEMORY[0x1E4F14430];
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v16 = dispatch_queue_create("com.apple.peopleSuggestionQueue", v15);
    peopleSuggestionQueue = v7->_peopleSuggestionQueue;
    v7->_peopleSuggestionQueue = (OS_dispatch_queue *)v16;

    v18 = dispatch_queue_attr_make_with_autorelease_frequency(v14, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v19 = dispatch_queue_create("com.apple.appExtensionQueue", v18);
    appExtensionQueue = v7->_appExtensionQueue;
    v7->_appExtensionQueue = (OS_dispatch_queue *)v19;

    [(NSXPCConnection *)v7->_connection resume];
  }

  return v7;
}

- (_PSSuggester)initWithConfiguration:(id)a3
{
  return [(_PSSuggester *)self initWithConfiguration:a3 feedbackRecording:0];
}

- (_PSSuggester)initWithConfiguration:(id)a3 feedbackRecording:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  v17.receiver = self;
  v17.super_class = (Class)_PSSuggester;
  id v8 = [(_PSSuggester *)&v17 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_configuration, a3);
    v9->_lock._os_unfair_lock_opaque = 0;
    if (v4)
    {
      v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v11 = dispatch_queue_create("_ps_suggester_feedback", v10);
      feedbackQueue = v9->_feedbackQueue;
      v9->_feedbackQueue = (OS_dispatch_queue *)v11;

      v13 = v9->_feedbackQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __56___PSSuggester_initWithConfiguration_feedbackRecording___block_invoke;
      block[3] = &unk_1E5ADE940;
      dispatch_queue_t v16 = v9;
      dispatch_async(v13, block);
    }
  }

  return v9;
}

- (void)dealloc
{
  [(NSXPCConnection *)self->_connection invalidate];
  [(NSXPCConnection *)self->_userConnection invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_PSSuggester;
  [(_PSSuggester *)&v3 dealloc];
}

- (id)contactStore
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  contactStore = self->_contactStore;
  if (!contactStore)
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2050000000;
    id v5 = (void *)getCNContactStoreClass_softClass_2;
    uint64_t v15 = getCNContactStoreClass_softClass_2;
    if (!getCNContactStoreClass_softClass_2)
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __getCNContactStoreClass_block_invoke_2;
      v11[3] = &unk_1E5ADE858;
      v11[4] = &v12;
      __getCNContactStoreClass_block_invoke_2((uint64_t)v11);
      id v5 = (void *)v13[3];
    }
    v6 = v5;
    _Block_object_dispose(&v12, 8);
    id v7 = (CNContactStore *)objc_alloc_init(v6);
    id v8 = self->_contactStore;
    self->_contactStore = v7;

    contactStore = self->_contactStore;
  }
  uint64_t v9 = contactStore;
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (id)shareSheetInteractionsFromContext:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSSuggester *)self configuration];
  v6 = -[_PSSuggester shareSheetInteractionsFromContext:maximumNumberOfSuggestions:](self, "shareSheetInteractionsFromContext:maximumNumberOfSuggestions:", v4, [v5 maximumNumberOfSuggestions]);

  return v6;
}

- (id)shareSheetInteractionsFromContext:(id)a3 maximumNumberOfSuggestions:(int64_t)a4
{
  id v6 = a3;
  id v7 = _os_activity_create(&dword_1A314B000, "Duet: Share Sheet Suggestions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v14.opaque[0] = 0;
  v14.opaque[1] = 0;
  os_activity_scope_enter(v7, &v14);
  os_activity_scope_leave(&v14);

  id v8 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v8))
  {
    LOWORD(v14.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsTotalTime", " enableTelemetry=YES ", (uint8_t *)&v14, 2u);
  }

  uint64_t v9 = [(_PSSuggester *)self configuration];
  v10 = [v9 suggestionModel];
  dispatch_queue_t v11 = [v10 predictWithPredictionContext:v6 maxSuggestions:a4];

  uint64_t v12 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v12))
  {
    LOWORD(v14.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetPeopleSuggestionsTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v14, 2u);
  }

  return v11;
}

- (id)appExtensionSuggestionsFromContext:(id)a3
{
  id v4 = a3;
  id v5 = _os_activity_create(&dword_1A314B000, "Duet: App Suggestions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v5, &v12);
  os_activity_scope_leave(&v12);

  id v6 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v6))
  {
    LOWORD(v12.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetAppSuggestionsTotalTime", " enableTelemetry=YES ", (uint8_t *)&v12, 2u);
  }

  id v7 = [(_PSSuggester *)self configuration];
  id v8 = [v7 suggestionModel];
  uint64_t v9 = [v8 appExtensionSuggestionsFromContext:v4];

  v10 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v10))
  {
    LOWORD(v12.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSShareSheetAppSuggestionsTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v12, 2u);
  }

  return v9;
}

- (id)candidatesForShareSheetRankingCompute
{
  objc_super v3 = _os_activity_create(&dword_1A314B000, "Duet: Candidates for Share Sheet Ranking", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v3, &v11);
  os_activity_scope_leave(&v11);

  id v4 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v4))
  {
    LOWORD(v11.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v4, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSCandidatesForShareSheetRankingTotalTime", " enableTelemetry=YES ", (uint8_t *)&v11, 2u);
  }

  id v5 = [(_PSSuggester *)self configuration];
  id v6 = [v5 suggestionModel];
  id v7 = [v6 candidatesForShareSheetRanking];

  id v8 = objc_msgSend(v7, "_pas_mappedSetWithTransform:", &__block_literal_global_9);
  uint64_t v9 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v9))
  {
    LOWORD(v11.opaque[0]) = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v9, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSCandidatesForShareSheetRankingTotalTime", (const char *)&unk_1A3274816, (uint8_t *)&v11, 2u);
  }

  return v8;
}

- (id)candidatesForShareSheetRanking
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v3, OS_LOG_TYPE_DEFAULT, "Fetching candidates for Share Sheet ranking", buf, 2u);
  }

  unsigned __int8 v4 = atomic_load(_hasInitializedCache);
  if (v4)
  {
    id v5 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "Checking cache for initialized candidates", buf, 2u);
    }

    id v6 = [(_PSSuggester *)self getCacheSuggestions];
    id v7 = objc_msgSend(v6, "_pas_filteredArrayWithTest:", &__block_literal_global_174);
    objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_177);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if ([v8 count])
    {
      uint64_t v9 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, "Returning candidates array from cache", buf, 2u);
      }
      goto LABEL_19;
    }
  }
  v10 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v10, OS_LOG_TYPE_DEFAULT, "Requesting candidates over XPC", buf, 2u);
  }

  os_activity_scope_state_s v11 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v6 = v11;
  if (v11)
  {
    uint64_t v9 = [v11 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_181];
    *(void *)buf = 0;
    v18 = buf;
    uint64_t v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__4;
    v21 = __Block_byref_object_dispose__4;
    id v22 = 0;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __46___PSSuggester_candidatesForShareSheetRanking__block_invoke_182;
    v16[3] = &unk_1E5ADF970;
    v16[4] = buf;
    [v9 candidatesForShareSheetRanking:v16];
    os_activity_scope_state_s v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = *((void *)v18 + 5);
      *(_DWORD *)v23 = 138477827;
      uint64_t v24 = v13;
      _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_INFO, "Fetched candidates %{private}@", v23, 0xCu);
    }

    id v8 = *((id *)v18 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    os_activity_scope_state_s v14 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester candidatesForShareSheetRanking]();
    }

    uint64_t v9 = [(_PSSuggester *)self candidatesForShareSheetRankingCompute];
    id v8 = [v9 allObjects];
  }
LABEL_19:

  return v8;
}

- (id)computeShareSheetEphemeralFeaturesWithPredictionContext:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "Fetching candidates for Share Sheet ranking", buf, 2u);
  }

  id v6 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_185];
    *(void *)buf = 0;
    uint64_t v15 = buf;
    uint64_t v16 = 0x3032000000;
    objc_super v17 = __Block_byref_object_copy__4;
    v18 = __Block_byref_object_dispose__4;
    id v19 = 0;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72___PSSuggester_computeShareSheetEphemeralFeaturesWithPredictionContext___block_invoke_186;
    v13[3] = &unk_1E5ADF998;
    v13[4] = buf;
    [v8 computeShareSheetEphemeralFeaturesWithPredictionContext:v4 reply:v13];
    uint64_t v9 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = *((void *)v15 + 5);
      *(_DWORD *)v20 = 138477827;
      uint64_t v21 = v10;
      _os_log_impl(&dword_1A314B000, v9, OS_LOG_TYPE_DEFAULT, "Fetched candidates %{private}@", v20, 0xCu);
    }

    id v11 = *((id *)v15 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v8 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester candidatesForShareSheetRanking]();
    }
    id v11 = (id)MEMORY[0x1E4F1CC08];
  }

  return v11;
}

- (id)suggestInteractionsFromContext:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [AeroMLTracerSession alloc];
  id v6 = [v4 sessionID];
  id v7 = +[_PSConstants peopleSuggesterShareSheetProjectName];
  id v8 = [(AeroMLTracerSession *)v5 initWithTraceId:v6 projectName:v7];

  uint64_t v9 = [(AeroMLTracerSession *)v8 createRootSpanWithName:@"syncsuggestInteractionsFromContext_End2End"];
  uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
  [v4 setQueryStartDate:v10];

  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Sharing"];
  if ([v11 integerForKey:@"SharingPeopleSuggestionsDisabled"] == 1)
  {
    os_activity_scope_state_s v12 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A314B000, v12, OS_LOG_TYPE_DEFAULT, "Share Sheet People Suggestions disabled in Settings Switch", (uint8_t *)&buf, 2u);
    }
    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    os_activity_scope_state_s v14 = [v4 locationUUIDs];

    if (!v14)
    {
      uint64_t v15 = [MEMORY[0x1E4F5B6A8] userContext];
      uint64_t v16 = [MEMORY[0x1E4F5B6B8] keyPathForNearbyLOIIdentifiers];
      objc_super v17 = [v15 objectForKeyedSubscript:v16];
      [v4 setLocationUUIDs:v17];
    }
    v18 = +[_PSLogging coreBehaviorChannel];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v4 locationUUIDs];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v19;
      _os_log_impl(&dword_1A314B000, v18, OS_LOG_TYPE_INFO, "Prediction Context - LocationUUIDs: %@", (uint8_t *)&buf, 0xCu);
    }
    v20 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
    os_activity_scope_state_s v12 = v20;
    if (v20)
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v36 = 0x3032000000;
      v37 = __Block_byref_object_copy__4;
      v38 = __Block_byref_object_dispose__4;
      id v39 = 0;
      uint64_t v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_198];
      uint64_t v22 = +[_PSLogging coreBehaviorChannel];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v34 = 0;
        _os_log_impl(&dword_1A314B000, v22, OS_LOG_TYPE_DEFAULT, "_PSSuggester: calling suggestInteractionsFromContext", v34, 2u);
      }

      v23 = NSNumber;
      uint64_t v24 = [(_PSSuggester *)self configuration];
      uint64_t v25 = objc_msgSend(v23, "numberWithInteger:", objc_msgSend(v24, "maximumNumberOfSuggestions"));
      uint64_t v28 = MEMORY[0x1E4F143A8];
      uint64_t v29 = 3221225472;
      v30 = __47___PSSuggester_suggestInteractionsFromContext___block_invoke_200;
      v31 = &unk_1E5ADF9C0;
      p_long long buf = &buf;
      id v32 = v4;
      [v21 suggestInteractionsFromContext:v32 maxSuggestions:v25 reply:&v28];

      objc_msgSend(v9, "end", v28, v29, v30, v31);
      id v13 = *(id *)(*((void *)&buf + 1) + 40);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      v26 = +[_PSLogging suggestionSignpost];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        -[_PSSuggester suggestInteractionsFromContext:]();
      }

      id v13 = [(_PSSuggester *)self shareSheetInteractionsFromContext:v4];
    }
  }

  return v13;
}

- (void)asyncSuggestInteractionsFromContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70___PSSuggester_asyncSuggestInteractionsFromContext_completionHandler___block_invoke;
  v10[3] = &unk_1E5ADF9E8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v6;
  id v9 = v7;
  [(_PSSuggester *)self asyncSuggestInteractionsFromContext:v8 timeout:v10 completionHandler:978307200.0];
}

- (id)getCacheSuggestions
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v2 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A314B000, v2, OS_LOG_TYPE_DEFAULT, "Cache is available, fetching cached suggestions", buf, 2u);
  }

  objc_super v3 = +[_PSSuggesterCache defaultService];
  [v3 performInitialFetchIfNeeded];
  id v26 = 0;
  id v4 = [v3 getCachedSuggestionsAndSessionID:&v26];
  id v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = [v4 count];
    *(_DWORD *)long long buf = 134218243;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2113;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_INFO, "Fetched %tu cached suggestions: %{private}@", buf, 0x16u);
  }

  if ([v4 count])
  {
    id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __35___PSSuggester_getCacheSuggestions__block_invoke;
    uint64_t v24 = &unk_1E5ADF1E8;
    id v8 = v7;
    id v25 = v8;
    [v4 enumerateObjectsUsingBlock:&v21];
    if (!v26)
    {
      id v9 = objc_msgSend(MEMORY[0x1E4F29128], "UUID", v21, v22, v23, v24);
      uint64_t v10 = [v9 UUIDString];
      id v11 = v26;
      id v26 = v10;

      id v12 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[_PSSuggester getCacheSuggestions]();
      }
    }
    uint64_t v27 = 0;
    uint64_t v28 = &v27;
    uint64_t v29 = 0x2050000000;
    id v13 = (void *)getPSPeopleSuggestionsMetricsInferenceEventClass_softClass_0;
    uint64_t v30 = getPSPeopleSuggestionsMetricsInferenceEventClass_softClass_0;
    if (!getPSPeopleSuggestionsMetricsInferenceEventClass_softClass_0)
    {
      *(void *)long long buf = MEMORY[0x1E4F143A8];
      *(void *)&uint8_t buf[8] = 3221225472;
      *(void *)&buf[16] = __getPSPeopleSuggestionsMetricsInferenceEventClass_block_invoke_0;
      id v32 = &unk_1E5ADE858;
      v33 = &v27;
      ReportingPluginLibraryCore_0();
      Class Class = objc_getClass("PSPeopleSuggestionsMetricsInferenceEvent");
      *(void *)(v33[1] + 24) = Class;
      getPSPeopleSuggestionsMetricsInferenceEventClass_softClass_0 = *(void *)(v33[1] + 24);
      id v13 = (void *)v28[3];
    }
    uint64_t v15 = v13;
    _Block_object_dispose(&v27, 8);
    id v16 = [v15 alloc];
    id v17 = v26;
    v18 = (void *)[v8 copy];
    id v19 = (void *)[v16 initWithIdentifier:v17 responseType:1 suggestions:v18];

    [getPSMetricsManagerClass_0() recordWithPeopleInference:v19];
  }

  return v4;
}

- (void)showNotificationToFileARadarForUserStudyParticipants
{
  if (_PASIsInternalDevice())
  {
    unsigned __int8 v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coreduet.logging"];
    int v3 = [v2 BOOLForKey:@"shareSheetUserStudyParticipant"];

    if (v3)
    {
      dispatch_time_t v4 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68___PSSuggester_showNotificationToFileARadarForUserStudyParticipants__block_invoke_273;
      block[3] = &unk_1E5ADFA10;
      id v6 = &__block_literal_global_217;
      dispatch_after(v4, MEMORY[0x1E4F14428], block);
    }
  }
}

- (void)asyncSuggestInteractionsFromContext:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  v99[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v56 = a5;
  id v9 = [MEMORY[0x1E4F1C9C8] date];
  [v8 setQueryStartDate:v9];

  uint64_t v10 = [AeroMLTracerSession alloc];
  id v11 = [v8 sessionID];
  id v12 = +[_PSConstants peopleSuggesterShareSheetProjectName];
  id v13 = [(AeroMLTracerSession *)v10 initWithTraceId:v11 projectName:v12];

  v54 = v13;
  v58 = [(AeroMLTracerSession *)v13 createRootSpanWithName:@"asyncSuggestInteractionsFromContext_End2End"];
  [v58 start];
  v55 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Sharing"];
  if ([v55 integerForKey:@"SharingPeopleSuggestionsDisabled"] == 1)
  {
    os_activity_scope_state_s v14 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A314B000, v14, OS_LOG_TYPE_DEFAULT, "Share Sheet People Suggestions disabled in Settings Switch", (uint8_t *)&buf, 2u);
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v98 = *MEMORY[0x1E4F28568];
    v99[0] = @"Share Sheet People Suggestions disabled in Settings Switch";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v99 forKeys:&v98 count:1];
    v57 = (void *)[v15 initWithDomain:@"com.apple.PeopleSuggester" code:1 userInfo:v16];

    v96 = @"SharingPeopleSuggestionsDisabled";
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%ld", 1);
    v97 = v17;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v97 forKeys:&v96 count:1];
    [v58 logErrorEventWithName:@"PSShareSheetPeopleSuggestionsDisabled", @"Share Sheet People Suggestions disabled in Settings Switch, return empty suggestion list", v18 details attributes];

    (*((void (**)(id, void, void, void *))v56 + 2))(v56, MEMORY[0x1E4F1CBF0], 0, v57);
  }
  else
  {
    id v19 = [v8 locationUUIDs];

    if (!v19)
    {
      v20 = [MEMORY[0x1E4F5B6A8] userContext];
      uint64_t v21 = [MEMORY[0x1E4F5B6B8] keyPathForNearbyLOIIdentifiers];
      uint64_t v22 = [v20 objectForKeyedSubscript:v21];
      [v8 setLocationUUIDs:v22];
    }
    v23 = +[_PSLogging coreBehaviorChannel];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v8 locationUUIDs];
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v24;
      _os_log_impl(&dword_1A314B000, v23, OS_LOG_TYPE_INFO, "Prediction Context - LocationUUIDs: %@", (uint8_t *)&buf, 0xCu);
    }
    v57 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
    id v25 = +[_PSLogging suggestionSignpost];
    id v26 = v25;
    if (v57)
    {
      if (os_signpost_enabled(v25))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSSuggestionAsyncTotalTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
      }

      uint64_t v27 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v27))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v27, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSSuggestionAsyncFallbackTotalTime", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
      }

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v90 = 0x3032000000;
      v91 = __Block_byref_object_copy__4;
      v92 = __Block_byref_object_dispose__4;
      id v93 = 0;
      v85[0] = MEMORY[0x1E4F143A8];
      v85[1] = 3221225472;
      v85[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke;
      v85[3] = &unk_1E5ADFA38;
      id v28 = v8;
      id v86 = v28;
      id v29 = v58;
      id v87 = v29;
      id v30 = v56;
      id v88 = v30;
      v53 = [v57 synchronousRemoteObjectProxyWithErrorHandler:v85];
      v83[0] = 0;
      v83[1] = v83;
      v83[2] = 0x3032000000;
      v83[3] = __Block_byref_object_copy__322;
      v83[4] = __Block_byref_object_dispose__323;
      id v84 = (id)MEMORY[0x1A6243AD0](v30);
      v81[0] = 0;
      v81[1] = v81;
      v81[2] = 0x2020000000;
      char v82 = 0;
      v80[0] = MEMORY[0x1E4F143A8];
      v80[1] = 3221225472;
      v80[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_324;
      v80[3] = &unk_1E5ADFA60;
      v80[4] = self;
      v80[5] = v83;
      v31 = (void *)MEMORY[0x1A6243AD0](v80);
      v74[0] = MEMORY[0x1E4F143A8];
      v74[1] = 3221225472;
      v74[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_2;
      v74[3] = &unk_1E5ADFA88;
      p_long long buf = &buf;
      v74[4] = self;
      v78 = v83;
      id v32 = v28;
      id v75 = v32;
      v79 = v81;
      id v33 = v29;
      id v76 = v33;
      uint64_t v34 = (void *)MEMORY[0x1A6243AD0](v74);
      v67[0] = MEMORY[0x1E4F143A8];
      v67[1] = 3221225472;
      v67[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_341;
      v67[3] = &unk_1E5ADFAB0;
      id v35 = v33;
      id v68 = v35;
      id v36 = v31;
      id v71 = v36;
      v69 = self;
      v73 = v81;
      id v37 = v32;
      id v70 = v37;
      id v38 = v34;
      id v72 = v38;
      id v39 = (void *)MEMORY[0x1A6243AD0](v67);
      uint64_t v40 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.coreduet.logging"];
      LODWORD(v32) = [v40 BOOLForKey:@"addCacheDelay"];

      peopleSuggestionQueue = self->_peopleSuggestionQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __78___PSSuggester_asyncSuggestInteractionsFromContext_timeout_completionHandler___block_invoke_351;
      block[3] = &unk_1E5ADFAD8;
      id v60 = v37;
      char v66 = (char)v32;
      id v61 = v35;
      id v62 = v53;
      v63 = self;
      id v64 = v36;
      id v65 = v38;
      id v42 = v38;
      id v43 = v53;
      id v44 = v36;
      dispatch_async(peopleSuggestionQueue, block);
      double v45 = a4 + 2.0;
      if (!v32) {
        double v45 = a4;
      }
      dispatch_time_t v46 = dispatch_time(0, (uint64_t)(v45 * 1000000000.0));
      dispatch_after(v46, (dispatch_queue_t)self->_peopleSuggestionQueue, v39);

      _Block_object_dispose(v81, 8);
      _Block_object_dispose(v83, 8);

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        -[_PSSuggester suggestInteractionsFromContext:]();
      }

      id v47 = objc_alloc(MEMORY[0x1E4F28C58]);
      uint64_t v94 = *MEMORY[0x1E4F28568];
      v95 = @"Unable to get xpc connection for share sheet suggestions";
      v48 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v95 forKeys:&v94 count:1];
      v49 = (void *)[v47 initWithDomain:@"com.apple.PeopleSuggester" code:1 userInfo:v48];

      v50 = +[_PSConstants suggestionPathXPCConnectionFailure];
      [v8 setSuggestionPath:v50];

      [v58 logErrorEventWithName:@"getUserDaemonXPCConnectionFailed" details:@"Unable to get xpc connection for share sheet suggestions" attributes:MEMORY[0x1E4F1CC08]];
      v51 = [v58 createSubSpanWithName:@"FallbackToInProcessSuggestion"];
      [v51 start];
      v52 = [(_PSSuggester *)self shareSheetInteractionsFromContext:v8];
      (*((void (**)(id, void *, void, void *))v56 + 2))(v56, v52, 0, v49);

      [v51 end];
    }
  }
}

- (id)shareExtensionSuggestionsFromContext:(id)a3
{
  id v4 = a3;
  if (self->_connection)
  {
    id v5 = _os_activity_create(&dword_1A314B000, "Duet: Share Sheet Suggestions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    os_activity_scope_enter(v5, &state);
    os_activity_scope_leave(&state);

    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v11 = 0x3032000000;
    id v12 = __Block_byref_object_copy__4;
    id v13 = __Block_byref_object_dispose__4;
    id v14 = 0;
    id v6 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_363];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __53___PSSuggester_shareExtensionSuggestionsFromContext___block_invoke_364;
    v9[3] = &unk_1E5ADEA08;
    v9[4] = &state;
    [v6 shareExtensionSuggestionsFromContext:v4 reply:v9];
    id v7 = *(id *)(state.opaque[1] + 40);

    _Block_object_dispose(&state, 8);
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (void)asyncShareExtensionSuggestionsFromContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76___PSSuggester_asyncShareExtensionSuggestionsFromContext_completionHandler___block_invoke;
  v8[3] = &unk_1E5ADFB00;
  id v9 = v6;
  id v7 = v6;
  [(_PSSuggester *)self asyncShareExtensionSuggestionsFromContext:a3 timeout:v8 completionHandler:978307200.0];
}

- (void)asyncShareExtensionSuggestionsFromContext:(id)a3 timeout:(double)a4 completionHandler:(id)a5
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void *, void, void *))a5;
  uint64_t v10 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  if (v10)
  {
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3032000000;
    v44[3] = __Block_byref_object_copy__4;
    v44[4] = __Block_byref_object_dispose__4;
    id v45 = 0;
    uint64_t v11 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_367];
    if (asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasOnceToken73 != -1) {
      dispatch_once(&asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasOnceToken73, &__block_literal_global_370);
    }
    id v12 = (id)asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___pasExprOnceResult;
    if (dispatch_semaphore_wait(v12, 0))
    {
      id v13 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A314B000, v13, OS_LOG_TYPE_DEFAULT, "Too many requests in progress, your request was cancelled", buf, 2u);
      }
    }
    else
    {
      v42[0] = 0;
      v42[1] = v42;
      v42[2] = 0x2020000000;
      char v43 = 0;
      *(void *)long long buf = 0;
      id v37 = buf;
      uint64_t v38 = 0x3032000000;
      id v39 = __Block_byref_object_copy__322;
      uint64_t v40 = __Block_byref_object_dispose__323;
      id v41 = (id)MEMORY[0x1A6243AD0](v9);
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_371;
      v35[3] = &unk_1E5ADFB28;
      v35[4] = self;
      v35[5] = v44;
      v35[6] = v42;
      v35[7] = buf;
      id v19 = (void *)MEMORY[0x1A6243AD0](v35);
      dispatch_time_t v20 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
      appExtensionQueue = self->_appExtensionQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_372;
      block[3] = &unk_1E5ADFB50;
      void block[4] = self;
      id v22 = v8;
      id v32 = v22;
      uint64_t v34 = v42;
      id v23 = v19;
      id v33 = v23;
      dispatch_after(v20, appExtensionQueue, block);
      uint64_t v24 = self->_appExtensionQueue;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __84___PSSuggester_asyncShareExtensionSuggestionsFromContext_timeout_completionHandler___block_invoke_373;
      v26[3] = &unk_1E5ADFB78;
      id v27 = v11;
      id v28 = v22;
      id v30 = v23;
      id v29 = v12;
      id v25 = v23;
      dispatch_async(v24, v26);

      _Block_object_dispose(buf, 8);
      _Block_object_dispose(v42, 8);
    }

    _Block_object_dispose(v44, 8);
  }
  else
  {
    id v14 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester suggestInteractionsFromContext:]();
    }

    id v15 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v46 = *MEMORY[0x1E4F28568];
    v47[0] = @"Unable to get xpc connection for share sheet suggestions";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    id v17 = (void *)[v15 initWithDomain:@"com.apple.PeopleSuggester" code:1 userInfo:v16];

    v18 = [(_PSSuggester *)self shareSheetInteractionsFromContext:v8];
    v9[2](v9, v18, 0, v17);
  }
}

- (id)rankedNameSuggestionsFromContext:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSRankedNameSuggestionsTotalTime", " enableTelemetry=YES ", buf, 2u);
  }

  os_unfair_lock_lock(&self->_lock);
  if (!self->_connection)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v10 = (NSXPCConnection *)[v9 initWithMachServiceName:*MEMORY[0x1E4F5B610] options:4096];
    connection = self->_connection;
    self->_connection = v10;

    id v12 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v12];

    [(NSXPCConnection *)self->_connection resume];
  }
  os_unfair_lock_unlock(&self->_lock);
  *(void *)long long buf = 0;
  dispatch_time_t v20 = buf;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__4;
  id v23 = __Block_byref_object_dispose__4;
  id v24 = 0;
  id v13 = [(NSXPCConnection *)self->_connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_375];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __54___PSSuggester_rankedNameSuggestionsFromContext_name___block_invoke_376;
  v18[3] = &unk_1E5ADEA08;
  v18[4] = buf;
  [v13 rankedNameSuggestionsFromContext:v6 name:v7 reply:v18];
  id v14 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)id v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSRankedNameSuggestionsTotalTime", (const char *)&unk_1A3274816, v17, 2u);
  }

  id v15 = *((id *)v20 + 5);
  _Block_object_dispose(buf, 8);

  return v15;
}

- (id)rankedGlobalSuggestionsFromContext:(id)a3 contactsOnly:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v7, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSRankedGlobalSuggestionsTotalTime", (const char *)&unk_1A3274816, buf, 2u);
  }

  id v8 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v9 = v8;
  if (v8)
  {
    *(void *)long long buf = 0;
    id v23 = buf;
    uint64_t v24 = 0x3032000000;
    id v25 = __Block_byref_object_copy__4;
    id v26 = __Block_byref_object_dispose__4;
    id v27 = 0;
    uint64_t v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_378];
    uint64_t v11 = NSNumber;
    id v12 = [(_PSSuggester *)self configuration];
    id v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "maximumNumberOfSuggestions"));
    id v14 = [(_PSSuggester *)self configuration];
    uint64_t v15 = [v14 excludeBackfillSuggestions];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __64___PSSuggester_rankedGlobalSuggestionsFromContext_contactsOnly___block_invoke_379;
    v21[3] = &unk_1E5ADEA08;
    v21[4] = buf;
    [v10 rankedGlobalSuggestionsFromContext:v6 contactsOnly:v4 maxSuggestions:v13 excludeBackfillSuggestions:v15 reply:v21];

    id v16 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)dispatch_time_t v20 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSRankedGlobalSuggestionsTotalTime", (const char *)&unk_1A3274816, v20, 2u);
    }

    id v17 = *((id *)v23 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v18 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester rankedGlobalSuggestionsFromContext:contactsOnly:]();
    }

    id v17 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v17;
}

- (id)rankedSiriNLContactSuggestionsFromContext:(id)a3 maxSuggestions:(id)a4 interactionId:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[_PSLogging suggestionSignpost];
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A314B000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSRankedSiriNLSuggestionsTotalTime", (const char *)&unk_1A3274816, buf, 2u);
  }

  id v12 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v13 = v12;
  if (v12)
  {
    *(void *)long long buf = 0;
    id v22 = buf;
    uint64_t v23 = 0x3032000000;
    uint64_t v24 = __Block_byref_object_copy__4;
    id v25 = __Block_byref_object_dispose__4;
    id v26 = 0;
    id v14 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_381];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __87___PSSuggester_rankedSiriNLContactSuggestionsFromContext_maxSuggestions_interactionId___block_invoke_382;
    v20[3] = &unk_1E5ADEA08;
    uint8_t v20[4] = buf;
    [v14 rankedSiriNLContactSuggestionsFromContext:v8 maxSuggestions:v9 interactionId:v10 reply:v20];
    uint64_t v15 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v15))
    {
      *(_WORD *)id v19 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v15, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSRankedSiriNLSuggestionsTotalTime", (const char *)&unk_1A3274816, v19, 2u);
    }

    id v16 = *((id *)v22 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v17 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester rankedSiriNLContactSuggestionsFromContext:maxSuggestions:interactionId:]();
    }

    id v16 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (id)_getUserDaemonXPCConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_connection)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F29268]);
    id v5 = (NSXPCConnection *)[v4 initWithMachServiceName:*MEMORY[0x1E4F5B610] options:4096];
    connection = self->_connection;
    self->_connection = v5;

    id v7 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v7];

    [(NSXPCConnection *)self->_connection resume];
  }
  os_unfair_lock_unlock(p_lock);
  id v8 = self->_connection;

  return v8;
}

- (id)rankedZKWSuggestionsFromContext:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 bundleID];
    id v7 = [v4 seedRecipients];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&buf[4] = v6;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v7;
    _os_log_impl(&dword_1A314B000, v5, OS_LOG_TYPE_DEFAULT, "[rankedZKWSuggestionsFromContext] Serving request from bundle %@, seed: %@", buf, 0x16u);
  }
  if ([v4 supportsZKWSuggestions])
  {
    id v8 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
    id v9 = +[_PSLogging suggestionSignpost];
    id v10 = v9;
    if (v8)
    {
      if (os_signpost_enabled(v9))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSZkwSuggestionsTotalTime", " enableTelemetry=YES ", buf, 2u);
      }

      id v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_384];
      uint64_t v11 = [(_PSSuggester *)self configuration];
      uint64_t v12 = [v11 maximumNumberOfSuggestions];

      *(void *)long long buf = 0;
      *(void *)&uint8_t buf[8] = buf;
      *(void *)&buf[16] = 0x3032000000;
      id v32 = __Block_byref_object_copy__4;
      id v33 = __Block_byref_object_dispose__4;
      id v34 = 0;
      id v13 = [NSNumber numberWithUnsignedInteger:v12];
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __48___PSSuggester_rankedZKWSuggestionsFromContext___block_invoke_385;
      v28[3] = &unk_1E5ADEA08;
      v28[4] = buf;
      [v10 zkwSuggestionsFromContext:v4 maxSuggestions:v13 reply:v28];

      id v14 = +[_PSLogging suggestionSignpost];
      if (os_signpost_enabled(v14))
      {
        *(_WORD *)id v29 = 0;
        _os_signpost_emit_with_name_impl(&dword_1A314B000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSZkwSuggestionsTotalTime", (const char *)&unk_1A3274816, v29, 2u);
      }

      uint64_t v15 = [v4 bundleID];
      id v16 = +[_PSConstants mobileFacetimeBundleId];
      if ([v15 isEqualToString:v16])
      {
        int v17 = 1;
      }
      else
      {
        id v19 = [v4 bundleID];
        dispatch_time_t v20 = +[_PSConstants macFacetimeBundleId];
        int v17 = [v19 isEqualToString:v20];
      }
      if (rankedZKWSuggestionsFromContext___pasOnceToken104 != -1) {
        dispatch_once(&rankedZKWSuggestionsFromContext___pasOnceToken104, &__block_literal_global_388);
      }
      id v21 = (id)rankedZKWSuggestionsFromContext___pasExprOnceResult;
      id v22 = v21;
      if (v17 && ([v21 isEqualToString:@"pstool"] & 1) == 0)
      {
        uint64_t v23 = [v4 bundleID];
        uint64_t v24 = +[_PSCNAutocompleteFeedback createVendedSuggestionsFeedbackWithBundleIdentifier:v23 suggestions:*(void *)(*(void *)&buf[8] + 40) isImplicit:1];
        [(_PSSuggester *)self provideFeedbackForContactsAutocompleteSuggestions:v24];
      }
      id v25 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = [*(id *)(*(void *)&buf[8] + 40) count];
        *(_DWORD *)id v29 = 134217984;
        uint64_t v30 = v26;
        _os_log_impl(&dword_1A314B000, v25, OS_LOG_TYPE_DEFAULT, "[rankedZKWSuggestionsFromContext] returning %tu suggestion(s).", v29, 0xCu);
      }

      id v18 = *(id *)(*(void *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[_PSSuggester rankedZKWSuggestionsFromContext:]();
      }
      id v18 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v8 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester rankedZKWSuggestionsFromContext:](v4, v8);
    }
    id v18 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

- (id)autocompleteSearchResultsWithPredictionContext:(id)a3
{
  id v4 = a3;
  if (autocompleteSearchResultsWithPredictionContext___pasOnceToken106 != -1) {
    dispatch_once(&autocompleteSearchResultsWithPredictionContext___pasOnceToken106, &__block_literal_global_395);
  }
  id v5 = (id)autocompleteSearchResultsWithPredictionContext___pasExprOnceResult;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = __Block_byref_object_copy__4;
  int v17 = __Block_byref_object_dispose__4;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63___PSSuggester_autocompleteSearchResultsWithPredictionContext___block_invoke_2;
  v9[3] = &unk_1E5ADEF08;
  id v6 = v4;
  uint64_t v11 = self;
  uint64_t v12 = &v13;
  id v10 = v6;
  [v5 runWithLockAcquired:v9];
  id v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v7;
}

- (id)rankedAutocompleteSuggestionsFromContext:(id)a3 candidates:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v9 = +[_PSLogging suggestionSignpost];
  id v10 = v9;
  if (v8)
  {
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "_PSAutocompleteSuggestionsTotalTime", " enableTelemetry=YES ", buf, 2u);
    }

    *(void *)long long buf = 0;
    id v18 = buf;
    uint64_t v19 = 0x3032000000;
    dispatch_time_t v20 = __Block_byref_object_copy__4;
    id v21 = __Block_byref_object_dispose__4;
    id v22 = 0;
    uint64_t v11 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_402];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __68___PSSuggester_rankedAutocompleteSuggestionsFromContext_candidates___block_invoke_403;
    v16[3] = &unk_1E5ADEA08;
    v16[4] = buf;
    [v11 rankedAutocompleteSuggestionsFromContext:v6 candidates:v7 reply:v16];
    uint64_t v12 = +[_PSLogging suggestionSignpost];
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A314B000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_PSAutocompleteSuggestionsTotalTime", (const char *)&unk_1A3274816, v15, 2u);
    }

    id v13 = *((id *)v18 + 5);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester rankedAutocompleteSuggestionsFromContext:candidates:]();
    }

    id v13 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v13;
}

- (id)rankedFamilySuggestions
{
  unsigned __int8 v2 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  int v3 = v2;
  if (v2)
  {
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = __Block_byref_object_copy__4;
    id v13 = __Block_byref_object_dispose__4;
    id v14 = 0;
    id v4 = [v2 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_405];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __39___PSSuggester_rankedFamilySuggestions__block_invoke_406;
    v8[3] = &unk_1E5ADEA08;
    void v8[4] = &v9;
    [v4 rankedFamilySuggestionsWithReply:v8];
    id v5 = (id)v10[5];

    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester rankedFamilySuggestions]();
    }

    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (id)familyRecommendationSuggestionsWithPredictionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v6 = v5;
  if (v5)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__4;
    id v16 = __Block_byref_object_dispose__4;
    id v17 = 0;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_408];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __69___PSSuggester_familyRecommendationSuggestionsWithPredictionContext___block_invoke_409;
    v11[3] = &unk_1E5ADEA08;
    v11[4] = &v12;
    [v7 familyRecommendedSuggestionsWithPredictionContext:v4 reply:v11];
    id v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v9 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester familyRecommendationSuggestionsWithPredictionContext:]();
    }

    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)photosRelationshipSuggestionsWithPredictionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v6 = v5;
  if (v5)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__4;
    id v16 = __Block_byref_object_dispose__4;
    id v17 = 0;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_411];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67___PSSuggester_photosRelationshipSuggestionsWithPredictionContext___block_invoke_412;
    v11[3] = &unk_1E5ADEA08;
    v11[4] = &v12;
    [v7 photosRelationshipSuggestionsWithPredictionContext:v4 reply:v11];
    id v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v9 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester photosRelationshipSuggestionsWithPredictionContext:]();
    }

    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)photosContactInferencesSuggestionsWithPredictionContext:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v6 = v5;
  if (v5)
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    uint64_t v15 = __Block_byref_object_copy__4;
    id v16 = __Block_byref_object_dispose__4;
    id v17 = 0;
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_414];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __72___PSSuggester_photosContactInferencesSuggestionsWithPredictionContext___block_invoke_415;
    v11[3] = &unk_1E5ADEA08;
    v11[4] = &v12;
    [v7 photosContactInferencesSuggestionsWithPredictionContext:v4 reply:v11];
    id v8 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    uint64_t v9 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester photosContactInferencesSuggestionsWithPredictionContext:]();
    }

    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)hourOfDayProbabilitiesToInteractWithContact:(id)a3
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [_PSHeuristics alloc];
  id v5 = (void *)MEMORY[0x1E4F5B400];
  id v6 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
  id v7 = [v5 storeWithDirectory:v6 readOnly:1];
  id v8 = [(_PSHeuristics *)v4 initWithKnowledgeStore:0 interactionStore:v7 contactResolver:0 messageInteractionCache:0];

  if (v3)
  {
    v14[0] = v3;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
    id v10 = [(_PSHeuristics *)v8 hourOfDayProbabilitiesToInteractWithContacts:v9];
    uint64_t v11 = [v10 allValues];
    uint64_t v12 = [v11 firstObject];
  }
  else
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v12;
}

- (id)hourOfDayProbabilitiesToInteractWithContacts:(id)a3
{
  id v3 = a3;
  id v4 = [_PSHeuristics alloc];
  id v5 = (void *)MEMORY[0x1E4F5B400];
  id v6 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
  id v7 = [v5 storeWithDirectory:v6 readOnly:1];
  id v8 = [(_PSHeuristics *)v4 initWithKnowledgeStore:0 interactionStore:v7 contactResolver:0 messageInteractionCache:0];

  uint64_t v9 = [(_PSHeuristics *)v8 hourOfDayProbabilitiesToInteractWithContacts:v3];

  return v9;
}

- (id)relativeAppUsageProbabilitiesForCandidateBundleIds:(id)a3 daysAgo:(int64_t)a4
{
  id v6 = a3;
  id v7 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v8 = v7;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  id v18 = __Block_byref_object_copy__4;
  uint64_t v19 = __Block_byref_object_dispose__4;
  id v20 = 0;
  if (v7)
  {
    uint64_t v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_420];
    id v10 = [NSNumber numberWithInteger:a4];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __75___PSSuggester_relativeAppUsageProbabilitiesForCandidateBundleIds_daysAgo___block_invoke_421;
    v14[3] = &unk_1E5ADF998;
    v14[4] = &v15;
    [v9 relativeAppUsageProbabilitiesForCandidateBundleIds:v6 daysAgo:v10 reply:v14];

    id v11 = (id)v16[5];
  }
  else
  {
    uint64_t v12 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:]();
    }

    id v11 = (id)v16[5];
  }
  _Block_object_dispose(&v15, 8);

  return v11;
}

- (BOOL)isTransportBundleIDSupported:(id)a3
{
  id v3 = a3;
  id v4 = [v3 action];
  id v5 = [v4 transportBundleID];

  if (v5)
  {
    id v6 = [v3 suggestions];
    id v7 = [v6 firstObject];

    if (v7)
    {
      id v5 = [v7 supportedBundleIDs];
      id v8 = [v5 componentsSeparatedByString:@","];

      uint64_t v9 = [v3 action];
      id v10 = [v9 transportBundleID];
      LOBYTE(v5) = [v8 containsObject:v10];
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return (char)v5;
}

- (void)generatePSRTelemetry:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  id v5 = [v3 action];
  uint64_t v6 = [v5 type];

  id v7 = &unk_1EF675000;
  if (v6)
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    id v10 = &unk_1EF675000;
  }
  else
  {
    if ([v3 indexOfEngagedSuggestion])
    {
      uint64_t v9 = 0;
    }
    else
    {
      id v11 = [v3 action];
      uint64_t v12 = [v11 transportBundleID];
      uint64_t v9 = [v12 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];
    }
    id v13 = +[_PSConstants shareplayBundleIds];
    uint64_t v14 = [v3 action];
    uint64_t v15 = [v14 transportBundleID];
    uint64_t v8 = [v13 containsObject:v15];

    id v16 = [v3 action];
    uint64_t v17 = [v16 suggestion];
    id v18 = [v17 reasonType];
    int v19 = [v18 isEqualToString:@"assistant"];

    if (v19) {
      id v10 = &unk_1EF675018;
    }
    else {
      id v10 = &unk_1EF675000;
    }
    id v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v3, "indexOfEngagedSuggestion"));
    [v4 setObject:v20 forKeyedSubscript:@"indexSelected"];

    id v21 = [v3 action];
    id v22 = [v21 suggestion];
    uint64_t v23 = [v22 reason];
    [v4 setObject:v23 forKeyedSubscript:@"engagedSuggestionProxyReason"];

    uint64_t v24 = [v3 action];
    id v25 = [v24 suggestion];
    uint64_t v26 = [v25 reasonType];
    char v27 = [v26 isEqualToString:@"_PSHeuristics"];

    if ((v27 & 1) == 0)
    {
      id v28 = [v3 action];
      id v29 = [v28 suggestion];
      uint64_t v30 = [v29 reasonType];
      int v31 = [v30 isEqualToString:@"suggestionsProxiesFromStats"];

      if (v31) {
        id v7 = &unk_1EF675018;
      }
      else {
        id v7 = &unk_1EF675030;
      }
    }
    [v4 setObject:v7 forKeyedSubscript:@"engagedSuggestionProxy"];
    id v32 = [v3 action];
    id v33 = [v32 suggestion];
    id v34 = [v33 reasonType];
    [v4 setObject:v34 forKeyedSubscript:@"engagedSuggestionProxy_debug"];
  }
  uint64_t v35 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "wasAirDropShown"));
  [v4 setObject:v35 forKeyedSubscript:@"airdropShown"];

  id v36 = [NSNumber numberWithBool:v9];
  [v4 setObject:v36 forKeyedSubscript:@"airdropEngaged"];

  id v37 = NSNumber;
  uint64_t v38 = [v3 context];
  id v39 = objc_msgSend(v37, "numberWithBool:", objc_msgSend(v38, "isSharePlayAvailable"));
  [v4 setObject:v39 forKeyedSubscript:@"sharePlayAvailable"];

  uint64_t v40 = [NSNumber numberWithBool:v8];
  [v4 setObject:v40 forKeyedSubscript:@"sharePlayEngaged"];

  id v41 = NSNumber;
  id v42 = [v3 context];
  char v43 = [v42 supportedBundleIds];
  id v44 = [v3 action];
  id v45 = [v44 transportBundleID];
  uint64_t v46 = objc_msgSend(v41, "numberWithBool:", objc_msgSend(v43, "containsObject:", v45));
  [v4 setObject:v46 forKeyedSubscript:@"appSharingIntent"];

  id v47 = NSNumber;
  v48 = [v3 action];
  v49 = objc_msgSend(v47, "numberWithInteger:", objc_msgSend(v48, "type"));
  [v4 setObject:v49 forKeyedSubscript:@"engagementType"];

  v50 = [v3 suggestions];
  if (v50)
  {
    v51 = [v3 suggestions];
    BOOL v52 = [v51 count] != 0;
  }
  else
  {
    BOOL v52 = 0;
  }

  v53 = [NSNumber numberWithBool:v52];
  [v4 setObject:v53 forKeyedSubscript:@"suggestionAvailable"];

  v54 = NSNumber;
  v55 = [v3 suggestions];
  id v56 = objc_msgSend(v54, "numberWithUnsignedInteger:", objc_msgSend(v55, "count"));
  [v4 setObject:v56 forKeyedSubscript:@"suggestionNumber"];

  v57 = NSNumber;
  [v3 numberOfVisibleSuggestions];
  v58 = objc_msgSend(v57, "numberWithFloat:");
  [v4 setObject:v58 forKeyedSubscript:@"numberOfVisibleSuggestions"];

  v59 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Sharing"];
  BOOL v60 = [v59 integerForKey:@"SharingPeopleSuggestionsDisabled"] == 1;
  id v61 = [NSNumber numberWithBool:v60];
  [v4 setObject:v61 forKeyedSubscript:@"peopleSuggestionsSetting"];

  id v62 = [v3 action];
  v63 = [v62 transportBundleID];
  [v4 setObject:v63 forKeyedSubscript:@"transportApp"];

  id v64 = [v3 context];
  id v65 = [v64 bundleID];
  [v4 setObject:v65 forKeyedSubscript:@"sourceApp"];

  char v66 = [v3 suggestions];
  v67 = [v66 firstObject];
  id v68 = [v67 utiList];
  [v4 setObject:v68 forKeyedSubscript:@"contentShared"];

  v69 = [v3 context];
  id v70 = [v69 sessionID];
  [v4 setObject:v70 forKeyedSubscript:@"sessionId"];

  [v4 setObject:v10 forKeyedSubscript:@"userExperienceFlow"];
  id v71 = NSNumber;
  id v72 = [v3 context];
  v73 = [v72 suggestionCompletionDate];
  uint64_t v74 = [v3 context];
  id v75 = [(id)v74 suggestionDate];
  [v73 timeIntervalSinceDate:v75];
  v77 = [v71 numberWithInt:(int)(v76 * 1000.0)];
  [v4 setObject:v77 forKeyedSubscript:@"sessionLatency"];

  v78 = NSNumber;
  v79 = [v3 context];
  v80 = objc_msgSend(v78, "numberWithBool:", objc_msgSend(v79, "timedOut"));
  [v4 setObject:v80 forKeyedSubscript:@"modelTimeout"];

  v81 = [v3 context];
  char v82 = [v81 suggestionPath];
  v83 = +[_PSConstants suggestionPathNormal];
  LOBYTE(v74) = [v82 isEqualToString:v83];

  if (v74)
  {
    id v84 = &unk_1EF675000;
  }
  else
  {
    v85 = [v3 context];
    id v86 = [v85 suggestionPath];
    id v87 = +[_PSConstants suggestionPathBestEffort];
    char v88 = [v86 isEqualToString:v87];

    if (v88)
    {
      id v84 = &unk_1EF675018;
    }
    else
    {
      v89 = [v3 context];
      uint64_t v90 = [v89 suggestionPath];
      v91 = +[_PSConstants suggestionPathCachedSuggestion];
      int v92 = [v90 isEqualToString:v91];

      if (v92) {
        id v84 = &unk_1EF675048;
      }
      else {
        id v84 = &unk_1EF675030;
      }
    }
  }
  [v4 setObject:v84 forKeyedSubscript:@"suggestionPath"];
  id v93 = [v3 context];
  uint64_t v94 = [v93 suggestionPath];
  [v4 setObject:v94 forKeyedSubscript:@"suggestionPath_debug"];

  v95 = [v3 context];
  v96 = [v95 trialDeploymentId];
  if (v96)
  {
    [v4 setObject:v96 forKeyedSubscript:@"trialDeploymentId"];
  }
  else
  {
    v97 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v97 forKeyedSubscript:@"trialDeploymentId"];
  }
  uint64_t v98 = [v3 context];
  v99 = [v98 trialExperimentId];
  if (v99)
  {
    [v4 setObject:v99 forKeyedSubscript:@"trialExperimentId"];
  }
  else
  {
    v100 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v100 forKeyedSubscript:@"trialExperimentId"];
  }
  v101 = [v3 context];
  v102 = [v101 trialTreatmentId];
  if (v102)
  {
    [v4 setObject:v102 forKeyedSubscript:@"trialTreatmentId"];
  }
  else
  {
    v103 = [MEMORY[0x1E4F1CA98] null];
    [v4 setObject:v103 forKeyedSubscript:@"trialTreatmentId"];
  }
  v104 = [v3 context];
  v105 = [v104 bundleID];
  uint64_t v106 = [&unk_1EF675FC0 containsObject:v105];

  v107 = [NSNumber numberWithBool:v106];
  [v4 setObject:v107 forKeyedSubscript:@"isPhotos"];

  v108 = NSNumber;
  v109 = [v3 context];
  v110 = objc_msgSend(v108, "numberWithBool:", objc_msgSend(v109, "isPSRActive"));
  [v4 setObject:v110 forKeyedSubscript:@"PSRActive"];

  v111 = NSNumber;
  [v3 delay];
  v113 = [v111 numberWithInt:(int)(v112 * 1000.0)];
  [v4 setObject:v113 forKeyedSubscript:@"sessionDelayInMilliseconds"];

  v115 = v4;
  id v114 = v4;
  AnalyticsSendEventLazy();
}

- (void)provideFeedbackForSuggestions:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v112 = self;
  connection = self->_connection;
  if (!connection)
  {
    os_unfair_lock_lock(&self->_lock);
    id v6 = objc_alloc(MEMORY[0x1E4F29268]);
    id v7 = (NSXPCConnection *)[v6 initWithMachServiceName:*MEMORY[0x1E4F5B610] options:4096];
    uint64_t v8 = self->_connection;
    self->_connection = v7;

    uint64_t v9 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v9];

    [(NSXPCConnection *)self->_connection resume];
    os_unfair_lock_unlock(&self->_lock);
    connection = self->_connection;
  }
  v115 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_546];
  id v10 = [v4 action];
  id v11 = [v10 suggestion];
  uint64_t v12 = [v11 conversationIdentifier];
  id v13 = [v4 context];
  uint64_t v14 = [v13 sessionID];
  uint64_t v15 = [v4 action];
  uint64_t v16 = [v15 type];
  uint64_t v17 = [v4 context];
  objc_msgSend(v115, "saveFeedbackInCoreDuetd:forSessionId:feedbackActionType:isFallbackFetch:reply:", v12, v14, v16, objc_msgSend(v17, "isFallbackFetch"), &__block_literal_global_550);

  id v18 = [v4 context];
  char v19 = [v18 timedOut];

  id v20 = [v4 action];
  uint64_t v21 = [v20 type];

  id v22 = 0;
  uint64_t v23 = 2;
  switch(v21)
  {
    case 0:
      if (![v4 indexOfEngagedSuggestion])
      {
        uint64_t v24 = [v4 action];
        id v25 = [v24 transportBundleID];
        char v26 = [v25 isEqualToString:@"com.apple.UIKit.activity.AirDrop"];

        if (v26)
        {
          id v22 = 0;
          uint64_t v23 = 3;
          goto LABEL_18;
        }
      }
      if ([v4 indexOfEngagedSuggestion] == 0x7FFFFFFFFFFFFFFFLL)
      {
        id v22 = 0;
      }
      else
      {
        id v28 = [v4 action];
        id v29 = [v28 suggestion];
        id v22 = [v29 conversationIdentifier];

        if (!v22
          || ([MEMORY[0x1E4F1CA98] null],
              uint64_t v30 = objc_claimAutoreleasedReturnValue(),
              int v31 = [v30 isEqual:v22],
              v30,
              v31))
        {
          id v32 = [v4 action];
          id v33 = [v32 suggestion];
          uint64_t v34 = [v33 derivedIntentIdentifier];

          uint64_t v23 = 0;
          id v22 = (void *)v34;
          goto LABEL_18;
        }
      }
      uint64_t v23 = 0;
      goto LABEL_18;
    case 1:
      goto LABEL_18;
    case 2:
      id v22 = 0;
      uint64_t v23 = 4;
      goto LABEL_18;
    case 4:
      if ([(_PSSuggester *)v112 isTransportBundleIDSupported:v4]) {
        uint64_t v23 = 5;
      }
      else {
        uint64_t v23 = 6;
      }
      char v27 = [v4 action];
      id v22 = [v27 transportBundleID];

LABEL_18:
      uint64_t v35 = [v4 context];
      uint64_t v36 = [v35 sessionID];

      if (v36) {
        id v37 = (__CFString *)v36;
      }
      else {
        id v37 = @"INVALID";
      }
      uint64_t v38 = [v4 wasAirDropShown];
      id v39 = [v4 context];
      uint64_t v40 = [v39 trialExperimentId];

      id v41 = [v4 context];
      id v42 = [v41 trialTreatmentId];

      char v43 = [v4 context];
      id v44 = [v43 trialDeploymentId];

      id v45 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412802;
        *(void *)&buf[4] = v40;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v42;
        *(_WORD *)&buf[22] = 2112;
        v124 = v44;
        _os_log_debug_impl(&dword_1A314B000, v45, OS_LOG_TYPE_DEBUG, "TrialInfo for feedback: %@, %@, %@", buf, 0x20u);
      }

      uint64_t v119 = 0;
      v120 = &v119;
      uint64_t v121 = 0x2050000000;
      uint64_t v46 = (void *)getPSFeedbackMetricsEventClass_softClass;
      uint64_t v122 = getPSFeedbackMetricsEventClass_softClass;
      if (!getPSFeedbackMetricsEventClass_softClass)
      {
        *(void *)long long buf = MEMORY[0x1E4F143A8];
        *(void *)&uint8_t buf[8] = 3221225472;
        *(void *)&buf[16] = __getPSFeedbackMetricsEventClass_block_invoke;
        v124 = &unk_1E5ADE858;
        v125 = &v119;
        ReportingPluginLibraryCore_0();
        Class Class = objc_getClass("PSFeedbackMetricsEvent");
        *(void *)(v125[1] + 24) = Class;
        getPSFeedbackMetricsEventClass_softClass Class = *(void *)(v125[1] + 24);
        uint64_t v46 = (void *)v120[3];
      }
      v48 = v46;
      _Block_object_dispose(&v119, 8);
      LOBYTE(v111) = v19;
      v49 = (void *)[[v48 alloc] initWithId:v37 type:v23 engagedSuggestionId:v22 airdropOptionPresent:v38 visiblePeopleSuggestionCount:0 visibleAppSuggestionCount:0 trialExperimentId:v40 trialTreatmentId:v42 trialDeploymentId:v44 peopleSuggestionTimeoutOccurred:v111];
      if (v49)
      {
        [getPSMetricsManagerClass_0() recordWithFeedback:v49];
      }
      else
      {
        v50 = +[_PSLogging generalChannel];
        if (os_log_type_enabled(v50, OS_LOG_TYPE_FAULT)) {
          -[_PSSuggester provideFeedbackForSuggestions:]();
        }
      }
      break;
    default:
      break;
  }
  v51 = [v4 action];
  uint64_t v52 = [v51 type];

  switch(v52)
  {
    case 0:
      uint64_t v53 = [v4 indexOfEngagedSuggestion];
      v54 = +[_PSLogging feedbackChannel];
      v55 = v54;
      if (v53 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR)) {
          -[_PSSuggester provideFeedbackForSuggestions:]();
        }
        goto LABEL_47;
      }
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        v58 = [NSNumber numberWithUnsignedInteger:v53];
        v59 = [v4 action];
        BOOL v60 = [v59 transportBundleID];
        *(_DWORD *)long long buf = 138412546;
        *(void *)&buf[4] = v58;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v60;
        _os_log_impl(&dword_1A314B000, v55, OS_LOG_TYPE_INFO, "Feedback for people suggestions: Engagement with suggestion at index %@, transport: %@", buf, 0x16u);
      }
      [(_PSSuggester *)v112 _recordFeedbackToInteractionStoreWithFeedback:v4 mechanism:20];
      goto LABEL_51;
    case 1:
      v55 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A314B000, v55, OS_LOG_TYPE_INFO, "Feedback for people suggestions: Engagement with non-suggestion", buf, 2u);
      }
      goto LABEL_47;
    case 2:
      v55 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A314B000, v55, OS_LOG_TYPE_INFO, "Feedback for people suggestions: Abandonment", buf, 2u);
      }
      goto LABEL_47;
    case 4:
      v55 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        id v56 = [v4 action];
        v57 = [v56 transportBundleID];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v57;
        _os_log_impl(&dword_1A314B000, v55, OS_LOG_TYPE_INFO, "Feedback for app suggestions: Engagement with transport: %@", buf, 0xCu);
      }
      goto LABEL_47;
    default:
      v55 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR)) {
        -[_PSSuggester provideFeedbackForSuggestions:]();
      }
LABEL_47:

LABEL_51:
      id v61 = [v4 suggestions];
      id v62 = [v61 firstObject];
      unsigned int v114 = [v62 familySuggestion];

      v63 = [v4 action];
      v116 = [v63 suggestion];

      v117 = [v116 bundleID];
      v113 = [v116 derivedIntentIdentifier];
      if (v117)
      {
        id v64 = [MEMORY[0x1E4F5B6A8] userContext];
        id v65 = [MEMORY[0x1E4F5B6E0] keyPathWithKey:@"/sharesheet/selectedSuggestion"];
        char v66 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
        [v66 setObject:v117 forKeyedSubscript:@"bundleID"];
        if (v113)
        {
          v67 = +[_PSConstants mobileMessagesBundleId];
          char v68 = [v117 isEqualToString:v67];

          if ((v68 & 1) == 0) {
            [v66 setObject:v113 forKeyedSubscript:@"derivedIntentIdentifier"];
          }
        }
        v69 = (void *)[v66 copy];
        [v64 setObject:v69 forKeyedSubscript:v65];

        id v70 = +[_PSLogging feedbackChannel];
        if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          *(void *)&buf[4] = v117;
          _os_log_impl(&dword_1A314B000, v70, OS_LOG_TYPE_INFO, "Set selected suggestion in context store for bundleID %@", buf, 0xCu);
        }
      }
      id v71 = [v4 suggestions];
      id v72 = [v71 firstObject];
      uint64_t v73 = [v72 isAdaptedModelCreated];

      uint64_t v74 = [v4 suggestions];
      id v75 = [v74 firstObject];
      uint64_t v76 = [v75 isAdaptedModelUsed];

      v77 = [v4 suggestions];
      v78 = [v77 firstObject];
      v79 = [v78 adaptedModelRecipeID];

      v80 = [v4 suggestions];
      v81 = [v80 firstObject];
      char v82 = [v81 supportedBundleIDs];

      v83 = [v4 suggestions];
      id v84 = [v83 firstObject];
      v85 = [v84 utiList];

      id v86 = [NSNumber numberWithBool:v114];
      id v87 = [v4 feedbackPayloadShowFamily:v86];
      char v88 = (void *)[v87 mutableCopy];

      v89 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Sharing"];
      uint64_t v90 = [v89 integerForKey:@"SharingPeopleSuggestionsDisabled"];
      v91 = [NSNumber numberWithInteger:v90];
      [v88 setObject:v91 forKeyedSubscript:@"peopleSuggestionsDisabled"];

      int v92 = [NSNumber numberWithBool:v73];
      [v88 setObject:v92 forKeyedSubscript:@"isAdaptedModelCreated"];

      id v93 = [NSNumber numberWithBool:v76];
      [v88 setObject:v93 forKeyedSubscript:@"isAdaptedModelUsed"];

      [v88 setObject:v79 forKeyedSubscript:@"adaptedModelRecipeID"];
      uint64_t v94 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
      {
        v95 = [NSNumber numberWithBool:v73];
        v96 = [NSNumber numberWithBool:v76];
        *(_DWORD *)long long buf = 138412802;
        *(void *)&buf[4] = v95;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v96;
        *(_WORD *)&buf[22] = 2112;
        v124 = v79;
        _os_log_impl(&dword_1A314B000, v94, OS_LOG_TYPE_INFO, "Adapted model use and availability indicators are set as isAdaptedModelCreated:%@, isAdaptedModelUsed:%@, adaptedModelRecipeID:%@", buf, 0x20u);
      }
      [v88 setObject:v82 forKeyedSubscript:@"supportedBundleIds"];
      v97 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v82;
        _os_log_impl(&dword_1A314B000, v97, OS_LOG_TYPE_INFO, "Comma seperated supported bundleID list:%@", buf, 0xCu);
      }

      [v88 setObject:v85 forKeyedSubscript:@"uti"];
      uint64_t v98 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&buf[4] = v85;
        _os_log_impl(&dword_1A314B000, v98, OS_LOG_TYPE_INFO, "Comma seperated UTI list:%@", buf, 0xCu);
      }

      v99 = NSNumber;
      v100 = [v4 context];
      v101 = objc_msgSend(v99, "numberWithInteger:", objc_msgSend(v100, "suggestionPurpose"));
      [v88 setObject:v101 forKeyedSubscript:@"suggestionPurpose"];

      v102 = [v4 action];
      v103 = [v102 suggestion];
      v104 = [v103 recipients];

      if (v104)
      {
        v105 = NSNumber;
        uint64_t v106 = [v4 action];
        v107 = [v106 suggestion];
        v108 = [v107 recipients];
        v109 = objc_msgSend(v105, "numberWithUnsignedInteger:", objc_msgSend(v108, "count"));
        [v88 setObject:v109 forKeyedSubscript:@"recipientCount"];
      }
      if ((v114 & 1) == 0) {
        [(_PSSuggester *)v112 generatePSRTelemetry:v4];
      }
      v118 = v88;
      id v110 = v88;
      AnalyticsSendEventLazy();
      [v4 donateToBiome];

      return;
  }
}

- (void)_recordFeedbackToInteractionStoreWithFeedback:(id)a3 mechanism:(int64_t)a4
{
  uint64_t v102 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  connection = self->_connection;
  if (!connection)
  {
    os_unfair_lock_lock(&self->_lock);
    id v8 = objc_alloc(MEMORY[0x1E4F29268]);
    uint64_t v9 = (NSXPCConnection *)[v8 initWithMachServiceName:*MEMORY[0x1E4F5B610] options:4096];
    id v10 = self->_connection;
    self->_connection = v9;

    id v11 = _CDInteractionNSXPCInterface();
    [(NSXPCConnection *)self->_connection setRemoteObjectInterface:v11];

    [(NSXPCConnection *)self->_connection resume];
    os_unfair_lock_unlock(&self->_lock);
    connection = self->_connection;
  }
  v80 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_590];
  uint64_t v12 = objc_opt_new();
  appBundleIdToShareExtensionMapping = self->_appBundleIdToShareExtensionMapping;
  uint64_t v14 = [v6 action];
  uint64_t v15 = [v14 transportBundleID];
  uint64_t v16 = [(NSDictionary *)appBundleIdToShareExtensionMapping objectForKey:v15];
  uint64_t v17 = [v16 firstObject];

  if (!v17)
  {
    id v18 = [v6 action];
    uint64_t v17 = [v18 transportBundleID];
  }
  char v19 = [v6 action];
  id v20 = [v19 suggestion];
  uint64_t v21 = [v20 groupName];
  [v12 setGroupName:v21];

  v78 = (void *)v17;
  [v12 setTargetBundleId:v17];
  id v22 = [v6 context];
  uint64_t v23 = [v22 bundleID];
  [v12 setBundleId:v23];

  [v12 setMechanism:a4];
  uint64_t v24 = [v6 action];
  id v25 = [v24 suggestion];
  char v26 = [v25 derivedIntentIdentifier];
  [v12 setDerivedIntentIdentifier:v26];

  char v27 = [v6 action];
  id v28 = [v27 suggestion];
  id v29 = [v28 image];
  uint64_t v30 = [v29 _uri];
  v79 = v12;
  if (v30)
  {
    [v12 setContentURL:v30];
  }
  else
  {
    int v31 = (void *)MEMORY[0x1E4F1CB10];
    id obja = [v6 action];
    id v32 = [obja suggestion];
    id v33 = [v32 image];
    uint64_t v34 = [v33 _identifier];
    uint64_t v35 = [v31 URLWithString:v34];
    [v12 setContentURL:v35];
  }
  uint64_t v36 = objc_opt_new();
  v96[0] = MEMORY[0x1E4F143A8];
  v96[1] = 3221225472;
  v96[2] = __72___PSSuggester__recordFeedbackToInteractionStoreWithFeedback_mechanism___block_invoke_592;
  v96[3] = &unk_1E5ADFBE8;
  id v77 = v36;
  id v97 = v77;
  id v37 = (void (**)(void, void, void, void))MEMORY[0x1A6243AD0](v96);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v94 = 0u;
  long long v95 = 0u;
  uint64_t v38 = [v6 context];
  id v39 = [v38 attachments];

  obuint64_t j = v39;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v92 objects:v101 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v93;
    char v43 = "PeopleSuggester";
    do
    {
      uint64_t v44 = 0;
      uint64_t v81 = v41;
      do
      {
        if (*(void *)v93 != v42) {
          objc_enumerationMutation(obj);
        }
        id v45 = *(void **)(*((void *)&v92 + 1) + 8 * v44);
        ((void (**)(void, void *, void, void))v37)[2](v37, v45, 0, 0);
        if (_os_feature_enabled_impl())
        {
          uint64_t v46 = v43;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          id v47 = [v45 photoSceneDescriptors];
          uint64_t v48 = [v47 countByEnumeratingWithState:&v88 objects:v100 count:16];
          if (v48)
          {
            uint64_t v49 = v48;
            uint64_t v50 = *(void *)v89;
            do
            {
              for (uint64_t i = 0; i != v49; ++i)
              {
                if (*(void *)v89 != v50) {
                  objc_enumerationMutation(v47);
                }
                ((void (**)(void, void *, void, void))v37)[2](v37, v45, *(void *)(*((void *)&v88 + 1) + 8 * i), 0);
              }
              uint64_t v49 = [v47 countByEnumeratingWithState:&v88 objects:v100 count:16];
            }
            while (v49);
          }

          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          uint64_t v52 = [v45 peopleInPhoto];
          uint64_t v53 = [v52 countByEnumeratingWithState:&v84 objects:v99 count:16];
          if (v53)
          {
            uint64_t v54 = v53;
            uint64_t v55 = *(void *)v85;
            do
            {
              for (uint64_t j = 0; j != v54; ++j)
              {
                if (*(void *)v85 != v55) {
                  objc_enumerationMutation(v52);
                }
                ((void (**)(void, void *, void, void))v37)[2](v37, v45, 0, *(void *)(*((void *)&v84 + 1) + 8 * j));
              }
              uint64_t v54 = [v52 countByEnumeratingWithState:&v84 objects:v99 count:16];
            }
            while (v54);
          }

          char v43 = v46;
          uint64_t v41 = v81;
        }
        ++v44;
      }
      while (v44 != v41);
      uint64_t v41 = [obj countByEnumeratingWithState:&v92 objects:v101 count:16];
    }
    while (v41);
  }

  [v79 setAttachments:v77];
  v57 = [v6 action];
  v58 = [v57 suggestion];
  v59 = [v58 conversationIdentifier];

  if (v59)
  {
    BOOL v60 = [v6 action];
    id v61 = [v60 suggestion];
    uint64_t v62 = [v61 conversationIdentifier];
  }
  else
  {
    v63 = [v79 derivedIntentIdentifier];
    id v64 = [v63 stringByReplacingOccurrencesOfString:@"conversationIdentifier" withString:&stru_1EF653EA8];

    BOOL v60 = objc_msgSend(v64, "substringWithRange:", 1, objc_msgSend(v64, "length") - 2);

    id v65 = [NSString stringWithFormat:@"%@(%@)", @"conversationIdentifier", v60];
    char v66 = [v79 derivedIntentIdentifier];
    LODWORD(v64) = [v65 isEqualToString:v66];

    if (v64)
    {
      id v61 = [v60 stringByRemovingPercentEncoding];
      [v79 setDomainIdentifier:v61];
      goto LABEL_37;
    }
    id v61 = [v79 derivedIntentIdentifier];
    uint64_t v62 = [v61 stringByRemovingPercentEncoding];
  }
  v67 = (void *)v62;
  [v79 setDomainIdentifier:v62];

LABEL_37:
  char v68 = [v6 action];
  v69 = [v68 suggestion];
  id v70 = [v69 recipients];
  id v71 = objc_msgSend(v70, "_pas_mappedArrayWithTransform:", &__block_literal_global_602);
  [v79 setRecipients:v71];

  id v72 = [v79 targetBundleId];
  uint64_t v73 = +[_PSConstants sharePlayBundleId];
  LODWORD(v70) = [v72 isEqualToString:v73];

  if (v70) {
    uint64_t v74 = 2;
  }
  else {
    uint64_t v74 = 1;
  }
  [v79 setDirection:v74];
  id v75 = NSUserName();
  [v79 setNsUserName:v75];

  uint64_t v98 = v79;
  uint64_t v76 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v98 count:1];
  [v80 recordInteractions:v76 enforceDataLimits:1 enforcePrivacy:1 reply:&__block_literal_global_605];
}

- (void)provideSuggestLessFeedbackForShareSheetSuggestion:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2050000000;
  id v5 = (void *)getBMPeopleSuggesterSuggestLessFeedbackClass_softClass;
  uint64_t v22 = getBMPeopleSuggesterSuggestLessFeedbackClass_softClass;
  if (!getBMPeopleSuggesterSuggestLessFeedbackClass_softClass)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __getBMPeopleSuggesterSuggestLessFeedbackClass_block_invoke;
    v18[3] = &unk_1E5ADE858;
    v18[4] = &v19;
    __getBMPeopleSuggesterSuggestLessFeedbackClass_block_invoke((uint64_t)v18);
    id v5 = (void *)v20[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v19, 8);
  id v7 = [v6 alloc];
  id v8 = [v4 bundleId];
  uint64_t v9 = [v4 derivedIntentId];
  id v10 = [v4 conversationId];
  id v11 = [v4 handle];
  uint64_t v12 = [v4 contactId];
  id v13 = (void *)[v7 initWithIdentifier:@"shareSheetSuggestLessFeedback" bundleId:v8 derivedIdentifier:v9 conversationIdentifier:v10 handle:v11 contactIdentifier:v12 itemIdentifier:0 groupIdentifier:0 deviceIdentifier:0 userIdentifier:0];

  uint64_t v14 = BiomeLibrary();
  uint64_t v15 = [v14 PeopleSuggester];
  uint64_t v16 = [v15 SuggestLessFeedback];

  uint64_t v17 = [v16 source];
  [v17 sendEvent:v13];

  [(_PSSuggester *)self deleteInteractionsMatchingSuggestLessFeedback:v4];
}

- (id)buildFilteringPredicateMatchingSuggestLessFeedback:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v3 derivedIntentId];
  if (v5)
  {
LABEL_2:

    goto LABEL_3;
  }
  uint64_t v16 = [v3 conversationId];

  if (v16)
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F28F60];
    id v18 = [v3 conversationId];
    id v5 = [v17 predicateWithFormat:@"domainIdentifier == %@", v18];

    if (v5) {
      [v4 addObject:v5];
    }
    goto LABEL_2;
  }
LABEL_3:
  id v6 = [v3 derivedIntentId];

  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E4F28F60];
    id v8 = [v3 derivedIntentId];
    uint64_t v9 = [v7 predicateWithFormat:@"derivedIntentIdentifier == %@", v8];

    if (v9) {
      [v4 addObject:v9];
    }
  }
  if (![v4 count])
  {
    id v10 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester buildFilteringPredicateMatchingSuggestLessFeedback:]();
    }

    id v11 = [v3 handle];

    uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
    if (v11)
    {
      id v13 = [v3 handle];
      v26[0] = v13;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      uint64_t v15 = [v12 predicateWithFormat:@"ANY recipients.identifier IN %@", v14];

      if (v15) {
        [v4 addObject:v15];
      }
    }
    else
    {
      uint64_t v19 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
      [v4 addObject:v19];

      uint64_t v15 = +[_PSLogging feedbackChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A314B000, v15, OS_LOG_TYPE_DEFAULT, "SuggestLess: Feedback handle is nil. Falling back to NO predicate", buf, 2u);
      }
    }
  }
  id v20 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v21 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EF675060, &unk_1EF675078, 0);
  uint64_t v22 = [v20 predicateWithFormat:@"direction IN %@", v21];

  if (v22) {
    [v4 addObject:v22];
  }
  uint64_t v23 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v4];

  return v23;
}

- (void)deleteInteractionsMatchingSuggestLessFeedback:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSSuggester *)self buildFilteringPredicateMatchingSuggestLessFeedback:v4];
  connection = self->_connection;
  if (connection)
  {
    id v7 = [(NSXPCConnection *)connection synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_630];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62___PSSuggester_deleteInteractionsMatchingSuggestLessFeedback___block_invoke_631;
    v16[3] = &unk_1E5ADFC30;
    id v17 = v4;
    [v7 deleteInteractionsMatchingPredicate:v5 sortDescriptors:0 limit:0 reply:v16];
  }
  id v8 = [(_PSSuggester *)self configuration];
  uint64_t v9 = [v8 suggestionModel];

  if (v9)
  {
    id v10 = [(_PSSuggester *)self configuration];
    id v11 = [v10 suggestionModel];
    [v11 setMessageInteractionCache:0];

    uint64_t v12 = [(_PSSuggester *)self configuration];
    id v13 = [v12 suggestionModel];
    [v13 setShareInteractionCache:0];

    uint64_t v14 = [(_PSSuggester *)self configuration];
    uint64_t v15 = [v14 suggestionModel];
    [v15 populateCaches];
  }
}

- (void)provideFeedbackForMessagesZkwSuggestions:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  AnalyticsSendEventLazy();
}

- (void)provideFeedbackForContactsAutocompleteSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_635];
    [v7 provideFeedbackForContactsAutocompleteSuggestions:v4];
  }
  else
  {
    id v7 = +[_PSLogging suggestionSignpost];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester provideFeedbackForContactsAutocompleteSuggestions:]();
    }
  }
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_feedbackQueue)
  {
    switch([v4 feedbackType])
    {
      case 0:
        id v6 = +[_PSLogging feedbackChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:]();
        }
        break;
      case 1:
        id v6 = +[_PSLogging feedbackChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.4();
        }
        break;
      case 2:
        id v6 = +[_PSLogging feedbackChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.5();
        }
        break;
      case 3:
        id v6 = +[_PSLogging feedbackChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.6();
        }
        break;
      case 4:
        id v6 = +[_PSLogging feedbackChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.7();
        }
        break;
      case 5:
        id v6 = +[_PSLogging feedbackChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:].cold.8();
        }
        break;
      default:
        id v6 = +[_PSLogging feedbackChannel];
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
          -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:]();
        }
        break;
    }

    feedbackQueue = self->_feedbackQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __64___PSSuggester_writeFeedbackForContactsAutocompleteSuggestions___block_invoke;
    v9[3] = &unk_1E5ADFC58;
    void v9[4] = self;
    id v10 = v5;
    dispatch_async(feedbackQueue, v9);
  }
  else
  {
    id v7 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester writeFeedbackForContactsAutocompleteSuggestions:]();
    }
  }
}

- (id)validateCoreMLScoringModelWithRawInput:(id)a3 predictionContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(_PSSuggester *)self _getUserDaemonXPCConnection];
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_637];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73___PSSuggester_validateCoreMLScoringModelWithRawInput_predictionContext___block_invoke_638;
  v12[3] = &unk_1E5ADFC80;
  id v10 = v6;
  id v13 = v10;
  [v9 validateCoreMLScoringModelWithRawInput:v7 predictionContext:v10 reply:v12];

  return v10;
}

- (_PSSuggesterConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_appExtensionQueue, 0);
  objc_storeStrong((id *)&self->_peopleSuggestionQueue, 0);
  objc_storeStrong((id *)&self->_appBundleIdToShareExtensionMapping, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_feedbackSource, 0);
  objc_storeStrong((id *)&self->_feedbackQueue, 0);
  objc_storeStrong((id *)&self->_userConnection, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (id)shareInformationForPhotoId:(id)a3 dateInterval:(id)a4
{
  return [(_PSSuggester *)self shareInformationForPhotoId:a3 dateInterval:a4 interactionStoreDB:0];
}

- (id)shareInformationForPhotoId:(id)a3 dateInterval:(id)a4 interactionStoreDB:(id)a5
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  uint64_t v55 = v7;
  if (v7)
  {
    if (!v9)
    {
      id v10 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    }
    uint64_t v49 = v10;
    uint64_t v11 = [MEMORY[0x1E4F5B400] storeWithDirectory:v10 readOnly:1];
    uint64_t v12 = [v8 startDate];
    id v50 = v8;
    id v13 = [v8 endDate];
    uint64_t v14 = (void *)MEMORY[0x1A6243860]();
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EF6750C0, &unk_1EF6750D8, 0);
    uint64_t v16 = (void *)MEMORY[0x1A6243860]();
    id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", &unk_1EF6750F0, 0);
    uint64_t v48 = v11;
    LOBYTE(v47) = 0;
    id v18 = +[_PSInteractionStoreUtils interactionsFromStore:v11 startDate:v12 tillDate:v13 withMechanisms:v15 withAccount:0 withBundleIds:0 withTargetBundleIds:0 withDirections:v17 singleRecipient:v47 fetchLimit:10000];

    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    obuint64_t j = v18;
    uint64_t v53 = [obj countByEnumeratingWithState:&v68 objects:v81 count:16];
    if (v53)
    {
      int v54 = 0;
      uint64_t v52 = *(void *)v69;
      do
      {
        for (uint64_t i = 0; i != v53; ++i)
        {
          if (*(void *)v69 != v52) {
            objc_enumerationMutation(obj);
          }
          id v20 = [*(id *)(*((void *)&v68 + 1) + 8 * i) attachments];
          long long v64 = 0u;
          long long v65 = 0u;
          long long v66 = 0u;
          long long v67 = 0u;
          id v21 = v20;
          uint64_t v22 = [v21 countByEnumeratingWithState:&v64 objects:v80 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v65;
            while (2)
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v65 != v24) {
                  objc_enumerationMutation(v21);
                }
                char v26 = [*(id *)(*((void *)&v64 + 1) + 8 * j) photoLocalIdentifier];
                char v27 = v26;
                if (v26)
                {
                  uint64_t v28 = [v26 rangeOfString:@"/"];
                  if (v28 == 0x7FFFFFFFFFFFFFFFLL)
                  {
                    if ([v27 isEqualToString:v55]) {
                      goto LABEL_22;
                    }
                  }
                  else
                  {
                    id v29 = [v27 substringToIndex:v28];
                    char v30 = [v29 isEqualToString:v55];

                    if (v30)
                    {
LABEL_22:
                      ++v54;

                      goto LABEL_23;
                    }
                  }
                }
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v64 objects:v80 count:16];
              if (v23) {
                continue;
              }
              break;
            }
          }
LABEL_23:
        }
        uint64_t v53 = [obj countByEnumeratingWithState:&v68 objects:v81 count:16];
      }
      while (v53);
    }
    else
    {
      int v54 = 0;
    }

    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v33 = obj;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v60 objects:v79 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      int v36 = 0;
      uint64_t v37 = *(void *)v61;
      do
      {
        for (uint64_t k = 0; k != v35; ++k)
        {
          if (*(void *)v61 != v37) {
            objc_enumerationMutation(v33);
          }
          id v39 = [*(id *)(*((void *)&v60 + 1) + 8 * k) attachments];
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          uint64_t v40 = [v39 countByEnumeratingWithState:&v56 objects:v78 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v57;
            do
            {
              for (uint64_t m = 0; m != v41; ++m)
              {
                if (*(void *)v57 != v42) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v44 = [*(id *)(*((void *)&v56 + 1) + 8 * m) photoLocalIdentifier];
                if (v44) {
                  ++v36;
                }
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v56 objects:v78 count:16];
            }
            while (v41);
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v60 objects:v79 count:16];
      }
      while (v35);
    }
    else
    {
      int v36 = 0;
    }

    id v45 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      uint64_t v73 = v55;
      __int16 v74 = 1024;
      int v75 = v54;
      __int16 v76 = 2048;
      double v77 = (double)v54 / (double)v36;
      _os_log_debug_impl(&dword_1A314B000, v45, OS_LOG_TYPE_DEBUG, "Number of interactions for photoId: %@: %d (Normalized: %lf)", buf, 0x1Cu);
    }

    id v32 = [[_PSPhotosShareInformation alloc] initWithInteractionCount:v54 totalInteractionCount:v36];
    id v10 = v49;
    id v8 = v50;
    int v31 = v48;
  }
  else
  {
    int v31 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester(PhotosShareCount) shareInformationForPhotoId:dateInterval:interactionStoreDB:](v31);
    }
    id v32 = 0;
  }

  return v32;
}

- (id)interactionCountForHandle:(id)a3 fetchLimit:(unint64_t)a4
{
  return [(_PSSuggester *)self interactionCountForHandle:a3 fetchLimit:a4 interactionStoreDB:0];
}

- (id)interactionCountForHandle:(id)a3 fetchLimit:(unint64_t)a4 interactionStoreDB:(id)a5
{
  v127[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = v8;
  if (v7)
  {
    if (!v8)
    {
      id v9 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    }
    v127[0] = v7;
    id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v127 count:1];
    uint64_t v11 = +[_PSContactResolver normalizedHandlesDictionaryFromHandles:v10];

    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v111 = v11;
    id v13 = [v11 allValues];
    uint64_t v14 = [v12 setWithArray:v13];
    uint64_t v15 = (void *)[v14 mutableCopy];

    uint64_t v16 = objc_opt_new();
    double v112 = v9;
    uint64_t v17 = [MEMORY[0x1E4F5B400] storeWithDirectory:v9 readOnly:1];
    id v18 = [v15 allObjects];
    uint64_t v19 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:v18 account:0 directions:&unk_1EF676230 mechanisms:0 bundleIds:0 store:v17 fetchLimit:a4 messageInteractionCache:0];

    [v16 addObjectsFromArray:v19];
    id v20 = [v15 allObjects];
    +[_PSInteractionStoreUtils interactionsMatchingAnySender:v20 store:v17 fetchLimit:a4 messageInteractionCache:0];
    uint64_t v22 = v21 = v7;

    uint64_t v23 = v16;
    [v16 addObjectsFromArray:v22];
    id v110 = v15;
    uint64_t v24 = [v15 allObjects];
    v109 = (void *)v17;
    id v25 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:v24 account:0 directions:&unk_1EF676248 mechanisms:0 bundleIds:0 store:v17 fetchLimit:a4 messageInteractionCache:0];

    char v26 = objc_opt_new();
    char v27 = objc_opt_new();
    v113 = v22;
    unsigned int v114 = v16;
    if ([v22 count])
    {
      uint64_t v106 = v25;
      v116[0] = MEMORY[0x1E4F143A8];
      v116[1] = 3221225472;
      v116[2] = __96___PSSuggester_InteractionInformation__interactionCountForHandle_fetchLimit_interactionStoreDB___block_invoke;
      v116[3] = &unk_1E5AE0018;
      id v117 = v21;
      id v28 = v27;
      id v118 = v28;
      id v29 = v16;
      v108 = objc_msgSend(v16, "_pas_filteredArrayWithTest:", v116);
      char v30 = [v108 firstObject];
      int v31 = [v30 startDate];

      id v7 = v21;
      if (v31)
      {
        id v32 = [(_PSSuggester *)self _dateFormatter];
        id v33 = [v30 startDate];
        uint64_t v34 = [v32 stringFromDate:v33];
        [v26 setObject:v34 forKeyedSubscript:@"recentIncomingStartDate"];

        id v29 = v16;
      }
      uint64_t v35 = [v30 endDate];

      if (v35)
      {
        int v36 = [(_PSSuggester *)self _dateFormatter];
        uint64_t v37 = [v30 endDate];
        uint64_t v38 = [v36 stringFromDate:v37];
        [v26 setObject:v38 forKeyedSubscript:@"recentIncomingEndDate"];

        id v29 = v16;
      }
      id v39 = [v30 bundleId];
      [v26 setObject:v39 forKeyedSubscript:@"recentIncomingBundleId"];

      uint64_t v40 = [v30 domainIdentifier];
      [v26 setObject:v40 forKeyedSubscript:@"recentIncomingDomainId"];

      uint64_t v41 = [v30 account];
      [v26 setObject:v41 forKeyedSubscript:@"recentIncomingAccount"];

      uint64_t v42 = [v30 recipients];
      uint64_t v43 = [v42 count];

      if (v43)
      {
        uint64_t v44 = [v30 recipients];
        id v45 = [v44 firstObject];

        uint64_t v46 = [v45 identifier];
        [v26 setObject:v46 forKeyedSubscript:@"recentIncomingRecipientContactId"];

        uint64_t v47 = [v45 displayName];

        if (v47)
        {
          uint64_t v48 = [v45 displayName];
          [v26 setObject:v48 forKeyedSubscript:@"recentIncomingRecipientDisplayName"];
        }
      }
      if ([v28 count])
      {
        uint64_t v49 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v28, "count"));
        id v50 = [v49 stringValue];
        [v26 setObject:v50 forKeyedSubscript:@"incomingCalls"];

        v51 = [v28 firstObject];
        uint64_t v52 = [v51 startDate];
        [v26 setObject:v52 forKeyedSubscript:@"recentIncomingCallStartDate"];

        uint64_t v53 = [v51 endDate];
        [v26 setObject:v53 forKeyedSubscript:@"recentIncomingCallEndDate"];

        int v54 = [v51 bundleId];
        [v26 setObject:v54 forKeyedSubscript:@"recentIncomingCallBundleId"];

        uint64_t v55 = [v51 domainIdentifier];
        [v26 setObject:v55 forKeyedSubscript:@"recentIncomingCallDomainId"];

        long long v56 = [v51 account];
        [v26 setObject:v56 forKeyedSubscript:@"recentIncomingCallAccount"];

        long long v57 = [v30 recipients];
        uint64_t v58 = [v57 count];

        if (v58)
        {
          long long v59 = [v51 recipients];
          long long v60 = [v59 firstObject];

          long long v61 = [v60 identifier];
          [v26 setObject:v61 forKeyedSubscript:@"recentIncomingCallRecipientContactId"];

          long long v62 = [v60 displayName];
          [v26 setObject:v62 forKeyedSubscript:@"recentIncomingCallRecipientDisplayName"];
        }
      }

      uint64_t v23 = v29;
      id v25 = v106;
    }
    else
    {
      v108 = (void *)MEMORY[0x1E4F1CBF0];
      id v7 = v21;
    }
    if ([v25 count])
    {
      v107 = v27;
      long long v65 = objc_msgSend(v25, "_pas_filteredArrayWithTest:", &__block_literal_global_18);
      long long v66 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v65, "count"));
      long long v67 = [v66 stringValue];
      [v26 setObject:v67 forKeyedSubscript:@"outgoingCalls"];

      long long v68 = [v25 firstObject];
      long long v69 = [v68 startDate];
      if (v69)
      {
        long long v70 = [(_PSSuggester *)self _dateFormatter];
        long long v71 = [v70 stringFromDate:v69];
        [v26 setObject:v71 forKeyedSubscript:@"recentOutgoingStartDate"];
      }
      id v72 = [v68 endDate];
      if (v72)
      {
        uint64_t v73 = [(_PSSuggester *)self _dateFormatter];
        __int16 v74 = [v73 stringFromDate:v72];
        [v26 setObject:v74 forKeyedSubscript:@"recentOutgoingEndDate"];
      }
      int v75 = [v68 bundleId];
      [v26 setObject:v75 forKeyedSubscript:@"recentOutgoingBundleId"];

      __int16 v76 = [v68 domainIdentifier];
      [v26 setObject:v76 forKeyedSubscript:@"recentOutgoingDomainId"];

      double v77 = [v68 account];
      [v26 setObject:v77 forKeyedSubscript:@"recentOutgoingAccount"];

      v78 = [v68 recipients];
      uint64_t v79 = [v78 count];

      if (v79)
      {
        v80 = [v68 recipients];
        uint64_t v81 = [v80 firstObject];

        uint64_t v82 = [v81 identifier];
        [v26 setObject:v82 forKeyedSubscript:@"recentOutgoingRecipientContactId"];

        v83 = [v81 displayName];

        if (v83)
        {
          long long v84 = [v81 displayName];
          [v26 setObject:v84 forKeyedSubscript:@"recentOutgoingRecipientDisplayName"];
        }
      }
      if ([v65 count])
      {
        long long v85 = [v65 firstObject];
        long long v86 = [v85 startDate];
        [v26 setObject:v86 forKeyedSubscript:@"recentOutgoingCallStartDate"];

        long long v87 = [v85 endDate];
        [v26 setObject:v87 forKeyedSubscript:@"recentOutgoingCallEndDate"];

        long long v88 = [v85 bundleId];
        [v26 setObject:v88 forKeyedSubscript:@"recentOutgoingCallBundleId"];

        long long v89 = [v85 domainIdentifier];
        [v26 setObject:v89 forKeyedSubscript:@"recentOutgoingCallDomainId"];

        long long v90 = [v85 account];
        [v26 setObject:v90 forKeyedSubscript:@"recentOutgoingCallAccount"];

        long long v91 = [v85 recipients];
        uint64_t v92 = [v91 count];

        if (v92)
        {
          long long v93 = [v85 recipients];
          long long v94 = [v93 firstObject];

          long long v95 = [v94 identifier];
          [v26 setObject:v95 forKeyedSubscript:@"recentOutgoingCallRecipientContactId"];

          v96 = [v94 displayName];
          [v26 setObject:v96 forKeyedSubscript:@"recentOutgoingCallRecipientDisplayName"];
        }
      }

      uint64_t v23 = v114;
      char v27 = v107;
    }
    id v97 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v108, "count"));
    uint64_t v98 = [v97 stringValue];
    [v26 setObject:v98 forKeyedSubscript:@"incoming"];

    v99 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
    v100 = [v99 stringValue];
    [v26 setObject:v100 forKeyedSubscript:@"outgoing"];

    v101 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v103 = [v108 count];
      uint64_t v104 = [v113 count];
      uint64_t v105 = [v25 count];
      *(_DWORD *)long long buf = 138413058;
      id v120 = v7;
      __int16 v121 = 2048;
      uint64_t v122 = v103;
      __int16 v123 = 2048;
      uint64_t v124 = v104;
      __int16 v125 = 2048;
      uint64_t v126 = v105;
      _os_log_debug_impl(&dword_1A314B000, v101, OS_LOG_TYPE_DEBUG, "_PSSuggester: For handle %@, interaction count: incoming %tu (%tu), outgoing %tu", buf, 0x2Au);
    }

    long long v64 = [[_PSInteractionInformation alloc] initWithHandle:v7 interactionInformation:v26];
    long long v63 = v111;
    id v9 = v112;
  }
  else
  {
    long long v63 = +[_PSLogging generalChannel];
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR)) {
      -[_PSSuggester(InteractionInformation) interactionCountForHandle:fetchLimit:interactionStoreDB:](v63);
    }
    long long v64 = 0;
  }

  return v64;
}

- (id)_dateFormatter
{
  if (_dateFormatter_onceToken != -1) {
    dispatch_once(&_dateFormatter_onceToken, &__block_literal_global_256);
  }
  unsigned __int8 v2 = (void *)_dateFormatter_dateFormatter;

  return v2;
}

- (BOOL)interactionAvailableForHandle:(id)a3
{
  return [(_PSSuggester *)self interactionAvailableForHandle:a3 interactionStoreDB:0];
}

- (BOOL)interactionAvailableForHandle:(id)a3 interactionStoreDB:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (!v6)
    {
      id v7 = [MEMORY[0x1E4F5B400] defaultDatabaseDirectory];
    }
    id v8 = [MEMORY[0x1E4F5B400] storeWithDirectory:v7 readOnly:1];
    v18[0] = v5;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
    id v10 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:v9 directions:&unk_1EF676488 mechanisms:&unk_1EF676470 interactionDuration:v8 store:10 fetchLimit:0.0];

    if ([v10 count])
    {
      uint64_t v11 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[_PSSuggester(InteractionAvailable) interactionAvailableForHandle:interactionStoreDB:]((uint64_t)v5, v10);
      }
    }
    else
    {
      id v17 = v5;
      id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v17 count:1];
      uint64_t v11 = +[_PSInteractionStoreUtils interactionsMatchingAnyHandles:v13 directions:&unk_1EF6764A0 mechanisms:&unk_1EF676470 interactionDuration:v8 store:10 fetchLimit:30.0];

      uint64_t v14 = [v11 count];
      BOOL v12 = v14 != 0;
      if (!v14)
      {
LABEL_15:

        goto LABEL_16;
      }
      uint64_t v15 = +[_PSLogging generalChannel];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[_PSSuggester(InteractionAvailable) interactionAvailableForHandle:interactionStoreDB:]((uint64_t)v5, v11);
      }
    }
    BOOL v12 = 1;
    goto LABEL_15;
  }
  id v8 = +[_PSLogging generalChannel];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    -[_PSSuggester(InteractionInformation) interactionCountForHandle:fetchLimit:interactionStoreDB:](v8);
  }
  BOOL v12 = 0;
LABEL_16:

  return v12;
}

- (void)candidatesForShareSheetRanking
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for candidate generation", v2, v3, v4, v5, v6);
}

- (void)suggestInteractionsFromContext:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for share sheet suggestions", v2, v3, v4, v5, v6);
}

- (void)getCacheSuggestions
{
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1A314B000, v0, OS_LOG_TYPE_FAULT, "no sessionID", v1, 2u);
}

- (void)rankedGlobalSuggestionsFromContext:contactsOnly:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for ranked global suggestions", v2, v3, v4, v5, v6);
}

- (void)rankedSiriNLContactSuggestionsFromContext:maxSuggestions:interactionId:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for ranked Siri NL Contact Suggestions", v2, v3, v4, v5, v6);
}

- (void)rankedZKWSuggestionsFromContext:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for ranked ZKW suggestions", v2, v3, v4, v5, v6);
}

- (void)rankedZKWSuggestionsFromContext:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 bundleID];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Unsupported bundleId %@ for ranked ZKW suggestions", v4, 0xCu);
}

- (void)rankedAutocompleteSuggestionsFromContext:candidates:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for rankedAutocompleteSuggestionsFromContext", v2, v3, v4, v5, v6);
}

- (void)rankedFamilySuggestions
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for rankedFamilySuggestions", v2, v3, v4, v5, v6);
}

- (void)familyRecommendationSuggestionsWithPredictionContext:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for familyRecommendationSuggestions", v2, v3, v4, v5, v6);
}

- (void)photosRelationshipSuggestionsWithPredictionContext:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for photosRelationshipSuggestions", v2, v3, v4, v5, v6);
}

- (void)photosContactInferencesSuggestionsWithPredictionContext:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for photosContactInferencesSuggestions", v2, v3, v4, v5, v6);
}

- (void)relativeAppUsageProbabilitiesForCandidateBundleIds:daysAgo:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for relativeAppUsageProbabilitiesForCandidateBundleIds", v2, v3, v4, v5, v6);
}

- (void)provideFeedbackForSuggestions:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Feedback with unknown action type", v2, v3, v4, v5, v6);
}

- (void)provideFeedbackForSuggestions:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Feedback with unknown suggestion", v2, v3, v4, v5, v6);
}

- (void)provideFeedbackForSuggestions:.cold.3()
{
  OUTLINED_FUNCTION_8();
  _os_log_fault_impl(&dword_1A314B000, v0, OS_LOG_TYPE_FAULT, "Share Sheet feedback is nil", v1, 2u);
}

- (void)buildFilteringPredicateMatchingSuggestLessFeedback:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "SuggestLess: could not find domainIdentifier or derivedIntentIdentifier", v2, v3, v4, v5, v6);
}

- (void)provideFeedbackForContactsAutocompleteSuggestions:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Unable to get xpc connection for provideFeedbackForContactsAutocompleteSuggestions", v2, v3, v4, v5, v6);
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A314B000, v0, v1, "Cannot log CNAutocomplete feedback outside of coreduetd / knowledge-agent process.", v2, v3, v4, v5, v6);
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSSuggester: Received unrecognized event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSSuggester: Received 'Entered' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.4()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSSuggester: Received 'Exited' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.5()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSSuggester: Received 'VendedSuggestions' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.6()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSSuggester: Received 'TappedSuggestion' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.7()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSSuggester: Received 'TypedHandle' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
}

- (void)writeFeedbackForContactsAutocompleteSuggestions:.cold.8()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_0(&dword_1A314B000, v0, v1, "_PSSuggester: Received 'ErasedHandle' event for Contacts Autocomplete feedback", v2, v3, v4, v5, v6);
}

@end