@interface PLSearchIndexingRebuildEngine
+ (BOOL)hasRebuildWorkToDoForLibrary:(id)a3 identifier:(int64_t)a4 sceneTaxonomyDigests:(id)a5;
+ (BOOL)requiresImmediateDropIndexForLibrary:(id)a3 reasons:(unint64_t *)a4;
- (BOOL)_inq_isValidForCoreAnalyticsCaptureWithRebuildReason:(unint64_t)a3;
- (BOOL)_inq_rebuildAnalyticsEventIsValid;
- (PLSearchIndexingRebuildEngine)initWithDelegate:(id)a3 provider:(id)a4;
- (PLSearchIndexingRebuildEngineDelegate)delegate;
- (id)_iteratorForSearchEntity:(unint64_t)a3 library:(id)a4 resumeObjectID:(id)a5;
- (id)_resumeObjectID;
- (id)analyticsEventManager;
- (unint64_t)_currentEntity;
- (unint64_t)_rebuildTypeForLibrary:(id)a3 entityInProgress:(unint64_t *)a4 resumeObjectID:(id *)a5 rebuildReasons:(unint64_t *)a6;
- (void)_handleDonationFailureForRebuildWithManagedObjects:(id)a3 entity:(unint64_t)a4 library:(id)a5;
- (void)_inq_rebuildAnalyticsCompletedWithResult:(id)a3;
- (void)_inq_rebuildAnalyticsPauseTimer;
- (void)_inq_rebuildAnalyticsSetupAndPublishWithLibrary:(id)a3 rebuildType:(unint64_t)a4 rebuildInitiatedBy:(id)a5 rebuildReasons:(unint64_t)a6 spotlightReasonForReindexingAllItems:(id)a7;
- (void)_inq_rebuildAnalyticsSetupDataWithRebuildType:(unint64_t)a3 rebuildInitiatedBy:(id)a4 rebuildReasons:(unint64_t)a5 mediaCount:(unint64_t)a6 uptimeSinceLastRebuild:(double)a7 spotlightReasonForReindexingAllItems:(id)a8;
- (void)_inq_rebuildAnalyticsStartTimer;
- (void)_lock_startPrepareAndRebuildForLibrary:(id)a3 type:(unint64_t)a4 calledBy:(id)a5 rebuildReasons:(unint64_t)a6 spotlightReasonForReindexingAllItems:(id)a7;
- (void)_prepareForRebuildForLibrary:(id)a3 type:(unint64_t)a4 sceneTaxonomyDigests:(id)a5 completion:(id)a6;
- (void)_rebuildAllRemainingEntitiesForLibrary:(id)a3 queue:(id)a4 completion:(id)a5;
- (void)_rebuildManagedObjectsFromIterator:(id)a3 ofEntity:(unint64_t)a4 queue:(id)a5 library:(id)a6 completion:(id)a7;
- (void)_startRebuildForLibrary:(id)a3;
- (void)fetchRemainingWorkWithLibrary:(id)a3 completion:(id)a4;
- (void)pauseSearchIndexRebuildWithSourceName:(id)a3;
- (void)resumeSearchIndexRebuildIfNeededForLibrary:(id)a3 calledBy:(id)a4 completion:(id)a5;
@end

@implementation PLSearchIndexingRebuildEngine

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loggingDateFormatter, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_lazyCoreAnalyticsEventManager, 0);
  objc_storeStrong((id *)&self->_lock_donationProgress, 0);
  objc_storeStrong((id *)&self->_lock_donationInFlightDispatchGroupSession, 0);
  objc_storeStrong((id *)&self->_lock_result, 0);
  objc_storeStrong((id *)&self->_lock_group, 0);
  objc_storeStrong((id *)&self->_lock_resumeObjectID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_iteratorsBySearchEntity, 0);
}

- (PLSearchIndexingRebuildEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLSearchIndexingRebuildEngineDelegate *)WeakRetained;
}

- (BOOL)_inq_rebuildAnalyticsEventIsValid
{
  if (self->_coreAnalyticsRebuildToken == 0.0) {
    return 0;
  }
  v3 = [(PLSearchIndexingRebuildEngine *)self analyticsEventManager];
  char v4 = [v3 hasEventWithName:*MEMORY[0x1E4F8C1C8]];

  return v4;
}

- (void)_inq_rebuildAnalyticsCompletedWithResult:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(PLSearchIndexingRebuildEngine *)self _inq_rebuildAnalyticsEventIsValid])
  {
    if ([v4 isFailure]
      && ([v4 error],
          v5 = objc_claimAutoreleasedReturnValue(),
          int HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode(),
          v5,
          HasDomainAndCode))
    {
      [(PLSearchIndexingRebuildEngine *)self _inq_rebuildAnalyticsPauseTimer];
      v7 = PLSearchBackendIndexRebuildGetLog();
      BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);

      if (v8)
      {
        if (self->_logger)
        {
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          *(_OWORD *)buf = 0u;
          long long v28 = 0u;
          v9 = PLSearchBackendIndexRebuildGetLog();
          os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
          LOWORD(v25) = 0;
          LODWORD(v24) = 2;
          v10 = (uint8_t *)_os_log_send_and_compose_impl();

          -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v10, "PLSearchIndexingRebuildEngine.m", 886, 0, &v25, v24);
          if (v10 != buf) {
            free(v10);
          }
        }
        else
        {
          v23 = PLSearchBackendIndexRebuildGetLog();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEFAULT, "Index rebuild paused", buf, 2u);
          }
        }
      }
    }
    else
    {
      v11 = [(PLSearchIndexingRebuildEngine *)self analyticsEventManager];
      uint64_t v12 = *MEMORY[0x1E4F8C1C8];
      [v11 addRecordingTimedEventSnippetWithToken:*MEMORY[0x1E4F8C1B8] forKey:*MEMORY[0x1E4F8C1C8] onEventWithName:self->_coreAnalyticsRebuildToken];
      v13 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v4, "isSuccess"));
      [v11 setPayloadValue:v13 forKey:*MEMORY[0x1E4F8C200] onEventWithName:v12];

      if ([v4 isFailure])
      {
        v14 = [v4 error];
        v15 = PLErrorCodeStringOfTopLevelErrorAndAllUnderlyingErrors();

        [v11 setPayloadValue:v15 forKey:*MEMORY[0x1E4F8C1C0] onEventWithName:v12];
      }
      v16 = PLSearchBackendIndexRebuildGetLog();
      BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

      if (v17)
      {
        if (self->_logger)
        {
          long long v57 = 0u;
          long long v58 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          long long v41 = 0u;
          long long v42 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v33 = 0u;
          long long v34 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v29 = 0u;
          long long v30 = 0u;
          *(_OWORD *)buf = 0u;
          long long v28 = 0u;
          v18 = PLSearchBackendIndexRebuildGetLog();
          os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
          v19 = [v11 descriptionForEventName:v12];
          int v25 = 138543362;
          v26 = v19;
          LODWORD(v24) = 12;
          v20 = (uint8_t *)_os_log_send_and_compose_impl();

          -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v20, "PLSearchIndexingRebuildEngine.m", 900, 0, &v25, v24);
          if (v20 != buf) {
            free(v20);
          }
        }
        else
        {
          v21 = PLSearchBackendIndexRebuildGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            v22 = [v11 descriptionForEventName:v12];
            *(_DWORD *)buf = 138543362;
            *(void *)&buf[4] = v22;
            _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "End index rebuild event: %{public}@", buf, 0xCu);
          }
        }
      }
      [v11 publishEventWithName:v12];
    }
  }
}

- (void)_inq_rebuildAnalyticsPauseTimer
{
  if ([(PLSearchIndexingRebuildEngine *)self _inq_rebuildAnalyticsEventIsValid])
  {
    id v8 = [(PLSearchIndexingRebuildEngine *)self analyticsEventManager];
    uint64_t v3 = *MEMORY[0x1E4F8C1E8];
    uint64_t v4 = *MEMORY[0x1E4F8C1C8];
    v5 = [v8 valueForKey:*MEMORY[0x1E4F8C1E8] onEventWithName:*MEMORY[0x1E4F8C1C8]];
    uint64_t v6 = [v5 integerValue];

    v7 = [NSNumber numberWithInteger:v6 + 1];
    [v8 setPayloadValue:v7 forKey:v3 onEventWithName:v4];
  }
}

- (void)_inq_rebuildAnalyticsStartTimer
{
  uint64_t v3 = [(PLSearchIndexingRebuildEngine *)self analyticsEventManager];
  int v4 = [v3 hasEventWithName:*MEMORY[0x1E4F8C1C8]];

  if (v4 && self->_coreAnalyticsRebuildToken == 0.0)
  {
    id v6 = [(PLSearchIndexingRebuildEngine *)self analyticsEventManager];
    [v6 startRecordingTimedEventToken];
    self->_coreAnalyticsRebuildToken = v5;
  }
}

- (void)_inq_rebuildAnalyticsSetupDataWithRebuildType:(unint64_t)a3 rebuildInitiatedBy:(id)a4 rebuildReasons:(unint64_t)a5 mediaCount:(unint64_t)a6 uptimeSinceLastRebuild:(double)a7 spotlightReasonForReindexingAllItems:(id)a8
{
  id v14 = a8;
  id v15 = a4;
  v16 = [(PLSearchIndexingRebuildEngine *)self analyticsEventManager];
  if (a3 > 3) {
    BOOL v17 = @"invalid";
  }
  else {
    BOOL v17 = off_1E5864578[a3];
  }
  uint64_t v18 = *MEMORY[0x1E4F8C1C8];
  id v27 = v16;
  [v16 setPayloadValue:v17 forKey:*MEMORY[0x1E4F8C210] onEventWithName:*MEMORY[0x1E4F8C1C8]];
  v19 = [NSNumber numberWithUnsignedInteger:a6];
  [v27 setPayloadValue:v19 forKey:*MEMORY[0x1E4F8C208] onEventWithName:v18];

  [v27 setPayloadValue:v15 forKey:*MEMORY[0x1E4F8C1E0] onEventWithName:v18];
  v20 = PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(a5, v14);

  [v27 setPayloadValue:v20 forKey:*MEMORY[0x1E4F8C1F8] onEventWithName:v18];
  v21 = [NSNumber numberWithUnsignedInteger:a5];
  [v27 setPayloadValue:v21 forKey:*MEMORY[0x1E4F8C1F0] onEventWithName:v18];

  v22 = [NSNumber numberWithDouble:a7];
  [v27 setPayloadValue:v22 forKey:*MEMORY[0x1E4F8C218] onEventWithName:v18];

  v23 = NSNumber;
  unsigned int v24 = _os_feature_enabled_impl();
  if (_os_feature_enabled_impl()) {
    uint64_t v25 = v24 | 2;
  }
  else {
    uint64_t v25 = v24;
  }
  v26 = [v23 numberWithUnsignedChar:v25];
  [v27 setPayloadValue:v26 forKey:*MEMORY[0x1E4F8C1D8] onEventWithName:v18];
}

- (BOOL)_inq_isValidForCoreAnalyticsCaptureWithRebuildReason:(unint64_t)a3
{
  if ((a3 & 0x109) == 1) {
    return 0;
  }
  else {
    return MEMORY[0x19F38C0C0](self, a2) ^ 1;
  }
}

- (void)_inq_rebuildAnalyticsSetupAndPublishWithLibrary:(id)a3 rebuildType:(unint64_t)a4 rebuildInitiatedBy:(id)a5 rebuildReasons:(unint64_t)a6 spotlightReasonForReindexingAllItems:(id)a7
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v12 = a5;
  id v13 = a7;
  if (a4 - 1 <= 1)
  {
    id v14 = [(PLSearchIndexingRebuildEngine *)self analyticsEventManager];
    uint64_t v15 = *MEMORY[0x1E4F8C1C8];
    [v14 removeEventWithName:*MEMORY[0x1E4F8C1C8]];
    objc_msgSend(v14, "setAllowEventPublish:", -[PLSearchIndexingRebuildEngine _inq_isValidForCoreAnalyticsCaptureWithRebuildReason:](self, "_inq_isValidForCoreAnalyticsCaptureWithRebuildReason:", a6));
    self->_coreAnalyticsRebuildToken = 0.0;
    uint64_t v39 = 0;
    long long v40 = &v39;
    uint64_t v41 = 0x2020000000;
    uint64_t v42 = 0;
    uint64_t v35 = 0;
    long long v36 = &v35;
    uint64_t v37 = 0x2020000000;
    uint64_t v38 = 0;
    uint64_t v31 = 0;
    long long v32 = (double *)&v31;
    uint64_t v33 = 0x2020000000;
    uint64_t v34 = 0;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __164__PLSearchIndexingRebuildEngine__inq_rebuildAnalyticsSetupAndPublishWithLibrary_rebuildType_rebuildInitiatedBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke;
    v26[3] = &unk_1E5871E08;
    id v27 = v25;
    long long v28 = &v39;
    long long v29 = &v35;
    long long v30 = &v31;
    [v27 performBlockAndWait:v26];
    [(PLSearchIndexingRebuildEngine *)self _inq_rebuildAnalyticsSetupDataWithRebuildType:a4 rebuildInitiatedBy:v12 rebuildReasons:a6 mediaCount:v36[3] + v40[3] uptimeSinceLastRebuild:v13 spotlightReasonForReindexingAllItems:v32[3]];
    uint64_t v24 = *MEMORY[0x1E4F8C1D0];
    objc_msgSend(v14, "setPayloadValue:forKey:onEventWithName:", &unk_1EEBED458);
    v16 = PLSearchBackendIndexRebuildGetLog();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);

    if (v17)
    {
      if (self->_logger)
      {
        long long v75 = 0u;
        long long v76 = 0u;
        long long v73 = 0u;
        long long v74 = 0u;
        long long v71 = 0u;
        long long v72 = 0u;
        long long v69 = 0u;
        long long v70 = 0u;
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v57 = 0u;
        long long v58 = 0u;
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v51 = 0u;
        long long v52 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        long long v47 = 0u;
        long long v48 = 0u;
        *(_OWORD *)buf = 0u;
        long long v46 = 0u;
        uint64_t v18 = PLSearchBackendIndexRebuildGetLog();
        os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
        v19 = [v14 descriptionForEventName:v15];
        int v43 = 138543362;
        long long v44 = v19;
        LODWORD(v23) = 12;
        v20 = (uint8_t *)_os_log_send_and_compose_impl();

        -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v20, "PLSearchIndexingRebuildEngine.m", 810, 0, &v43, v23);
        if (v20 != buf) {
          free(v20);
        }
      }
      else
      {
        v21 = PLSearchBackendIndexRebuildGetLog();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = [v14 descriptionForEventName:v15];
          *(_DWORD *)buf = 138543362;
          *(void *)&buf[4] = v22;
          _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Start index rebuild event: %{public}@", buf, 0xCu);
        }
      }
    }
    [v14 publishEventWithName:v15];
    [(PLSearchIndexingRebuildEngine *)self _inq_rebuildAnalyticsSetupDataWithRebuildType:a4 rebuildInitiatedBy:v12 rebuildReasons:a6 mediaCount:v36[3] + v40[3] uptimeSinceLastRebuild:v13 spotlightReasonForReindexingAllItems:v32[3]];
    [v14 setPayloadValue:&unk_1EEBED470 forKey:v24 onEventWithName:v15];
    [(PLFileBackedLogger *)self->_logger flush];

    _Block_object_dispose(&v31, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v39, 8);
  }
}

void __164__PLSearchIndexingRebuildEngine__inq_rebuildAnalyticsSetupAndPublishWithLibrary_rebuildType_rebuildInitiatedBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) getPhotoCount:*(void *)(*(void *)(a1 + 40) + 8) + 24 videoCount:*(void *)(*(void *)(a1 + 48) + 8) + 24];
  id v3 = [*(id *)(a1 + 32) globalValues];
  [v3 searchIndexUptimeIsRebuildInProgress:0];
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2;
}

- (void)_lock_startPrepareAndRebuildForLibrary:(id)a3 type:(unint64_t)a4 calledBy:(id)a5 rebuildReasons:(unint64_t)a6 spotlightReasonForReindexingAllItems:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a5;
  id v15 = a7;
  if (!a4)
  {
    long long v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PLSearchIndexingRebuildEngine.m", 746, @"Invalid parameter not satisfying: %@", @"rebuildType != PLSearchIndexRebuildTypeNone" object file lineNumber description];
  }
  v16 = PLSearchBackendIndexRebuildGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEFAULT, "Resuming search index rebuild, called by: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  BOOL v17 = dispatch_group_create();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000;
  uint64_t v42 = __Block_byref_object_copy__11183;
  int v43 = __Block_byref_object_dispose__11184;
  uint64_t v18 = (void *)MEMORY[0x1E4F8B9B8];
  v19 = [MEMORY[0x1E4F1CA98] null];
  v20 = [v18 successWithResult:v19];

  id v44 = v20;
  BOOL v21 = self->_lock_currentEntity == 1 && self->_lock_resumeObjectID == 0;
  if (a4 - 1 < 2 || v21)
  {
    dispatch_group_enter(v17);
    v22 = [(PLSearchIndexingRebuildEngine *)self delegate];
    uint64_t v23 = [v22 sceneTaxonomyDigestsForSearchIndexingRebuildEngine:self];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke;
    v37[3] = &unk_1E5868CD8;
    p_long long buf = &buf;
    uint64_t v38 = v17;
    [(PLSearchIndexingRebuildEngine *)self _prepareForRebuildForLibrary:v13 type:a4 sceneTaxonomyDigests:v23 completion:v37];
  }
  uint64_t v24 = +[PLConcurrencyLimiter sharedLimiter];
  queue = self->_queue;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_2;
  v30[3] = &unk_1E5872A48;
  uint64_t v35 = &buf;
  id v26 = v13;
  id v31 = v26;
  unint64_t v36 = a6;
  id v27 = v14;
  id v32 = v27;
  uint64_t v33 = self;
  id v28 = v15;
  id v34 = v28;
  [v24 groupNotify:v17 queue:queue block:v30];

  _Block_object_dispose(&buf, 8);
}

void __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_2(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isSuccess])
  {
    uint64_t v2 = [*(id *)(a1 + 32) globalValues];
    uint64_t v3 = *(void *)(a1 + 72) | [v2 unpackedSearchIndexRebuildCoalescedReasons];

    uint64_t v4 = (v3 << 59 >> 63) & 3;
    if ((v3 & 0x3CD) != 0) {
      uint64_t v4 = 1;
    }
    if ((v3 & 0x22) != 0) {
      uint64_t v5 = 2;
    }
    else {
      uint64_t v5 = v4;
    }
    id v6 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = off_1E5864578[v5];
      id v8 = PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v3, 0);
      uint64_t v9 = *(void *)(a1 + 40);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v18 = v7;
      __int16 v19 = 2114;
      v20 = v8;
      __int16 v21 = 2114;
      uint64_t v22 = v9;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Rebuild preparation complete, starting reindexing, rebuild type: %{public}@, reasons: %{public}@, called by: %{public}@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 48), "_inq_rebuildAnalyticsSetupAndPublishWithLibrary:rebuildType:rebuildInitiatedBy:rebuildReasons:spotlightReasonForReindexingAllItems:", *(void *)(a1 + 32), v5, *(void *)(a1 + 40), v3, *(void *)(a1 + 56));
    v10 = *(void **)(a1 + 32);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_78;
    v15[3] = &unk_1E5875CE0;
    id v16 = v10;
    [v16 performTransactionAndWait:v15];
    [*(id *)(a1 + 48) _startRebuildForLibrary:*(void *)(a1 + 32)];
    id v11 = v16;
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v11 setObject:@"Unable to prepare for search index rebuild, search will be in an inconsistent state", *MEMORY[0x1E4F28228] forKeyedSubscript];
    id v12 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) error];
    [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4F28A50]];

    id v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46502 userInfo:v11];
    id v13 = v14;
    PLSafeRunWithUnfairLock();
  }
}

void __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_78(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) globalValues];
  [v1 setSearchIndexRebuildCoalescedReasons:0];
}

void __138__PLSearchIndexingRebuildEngine__lock_startPrepareAndRebuildForLibrary_type_calledBy_rebuildReasons_spotlightReasonForReindexingAllItems___block_invoke_2_82(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  uint64_t v2 = [MEMORY[0x1E4F8B9B8] failureWithError:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 64);
  *(void *)(v3 + 64) = v2;

  uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  dispatch_group_leave(v5);
}

- (void)_startRebuildForLibrary:(id)a3
{
  id v4 = a3;
  [(PLSearchIndexingRebuildEngine *)self _inq_rebuildAnalyticsStartTimer];
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke;
  v7[3] = &unk_1E586B700;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(PLSearchIndexingRebuildEngine *)self _rebuildAllRemainingEntitiesForLibrary:v6 queue:queue completion:v7];
}

void __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = __Block_byref_object_copy__11183;
  id v25 = __Block_byref_object_dispose__11184;
  id v26 = 0;
  if ([v3 isFailure])
  {
    id v4 = [v3 error];
    char HasDomainAndCode = PLErrorOrUnderlyingErrorHasDomainAndCode();

    if (HasDomainAndCode) {
      goto LABEL_6;
    }
    uint64_t v6 = [v3 resultByWrappingUnderlyingErrorWithDomain:*MEMORY[0x1E4F8C500] code:46511 debugDescription:@"Search index rebuild failed"];
    v7 = (void *)v22[5];
    v22[5] = v6;
  }
  else
  {
    id v8 = v22;
    id v9 = v3;
    v7 = (void *)v8[5];
    v8[5] = (uint64_t)v9;
  }

LABEL_6:
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v10 = *(void **)(a1 + 32);
  location[1] = (id)MEMORY[0x1E4F143A8];
  location[2] = (id)3221225472;
  location[3] = __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke_2;
  location[4] = &unk_1E5875A90;
  location[5] = v10;
  location[6] = &v21;
  location[7] = &v17;
  PLSafeRunWithUnfairLock();
  if (*((unsigned char *)v18 + 24))
  {
    objc_initWeak(location, *(id *)(a1 + 32));
    id v11 = +[PLConcurrencyLimiter sharedLimiter];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 16);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke_67;
    v13[3] = &unk_1E5875DA0;
    objc_copyWeak(&v15, location);
    id v14 = *(id *)(a1 + 40);
    [v11 dispatchAsync:v12 block:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(location);
  }
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);
}

void __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke_2(void *a1)
{
  if (*(unsigned char *)(a1[4] + 49) && !*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    uint64_t v2 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Paused search index rebuild", v8, 2u);
    }

    id v3 = (void *)MEMORY[0x1E4F8B9B8];
    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    uint64_t v5 = [v3 failureWithError:v4];
    uint64_t v6 = *(void *)(a1[5] + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    *(unsigned char *)(a1[4] + 48) = 0;
    objc_storeStrong((id *)(a1[4] + 64), *(id *)(*(void *)(a1[5] + 8) + 40));
    dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 56));
  }
  else
  {
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
}

void __57__PLSearchIndexingRebuildEngine__startRebuildForLibrary___block_invoke_67(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _startRebuildForLibrary:*(void *)(a1 + 32)];
}

- (void)_rebuildAllRemainingEntitiesForLibrary:(id)a3 queue:(id)a4 completion:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(PLSearchIndexingRebuildEngine *)self _currentEntity];
  if (v11 < 9)
  {
    unint64_t v19 = v11;
    if ((0xBAu >> v11))
    {
      char v20 = [(PLSearchIndexingRebuildEngine *)self _resumeObjectID];
      uint64_t v21 = [(PLSearchIndexingRebuildEngine *)self _iteratorForSearchEntity:v19 library:v8 resumeObjectID:v20];

      uint64_t v22 = PLSearchBackendIndexRebuildGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = off_1E586EAE8[v19];
        uint64_t v24 = [v21 resumeObjectID];
        id v25 = [v8 libraryID];
        *(_DWORD *)long long buf = 138543874;
        id v34 = v23;
        __int16 v35 = 2114;
        unint64_t v36 = v24;
        __int16 v37 = 2112;
        uint64_t v38 = v25;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Resuming search index rebuild from entity: %{public}@ token: %{public}@ for library %@", buf, 0x20u);
      }
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke;
      v27[3] = &unk_1E5864540;
      unint64_t v32 = v19;
      id v28 = v8;
      long long v29 = self;
      id v30 = v9;
      id v31 = v10;
      [(PLSearchIndexingRebuildEngine *)self _rebuildManagedObjectsFromIterator:v21 ofEntity:v19 queue:v30 library:v28 completion:v27];
    }
    else
    {
      uint64_t v26 = MEMORY[0x1E4F143A8];
      PLRunWithUnfairLock();
      -[PLSearchIndexingRebuildEngine _rebuildAllRemainingEntitiesForLibrary:queue:completion:](self, "_rebuildAllRemainingEntitiesForLibrary:queue:completion:", v8, v9, v10, v26, 3221225472, __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_63, &unk_1E5875CE0, self);
    }
  }
  else
  {
    uint64_t v12 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v8 libraryID];
      *(_DWORD *)long long buf = 138412290;
      id v34 = v13;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "Search index rebuild completed for library %@", buf, 0xCu);
    }
    id v14 = [v8 libraryServicesManager];
    id v15 = [v14 availabilityComputer];
    [v15 didFinishSearchIndexRebuidForPhotoLibrary:v8 error:0];

    id v16 = (void *)MEMORY[0x1E4F8B9B8];
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v18 = [v16 successWithResult:v17];

    (*((void (**)(id, void *))v10 + 2))(v10, v18);
  }
}

void __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isSuccess])
  {
    unint64_t v4 = *(void *)(a1 + 64);
    if (v4 > 8) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = qword_19BA9EAF0[v4];
    }
    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_2;
    v9[3] = &unk_1E5873348;
    id v10 = v8;
    uint64_t v11 = v5;
    [v10 performTransactionAndWait:v9];
    PLRunWithUnfairLock();
    [*(id *)(a1 + 40) _rebuildAllRemainingEntitiesForLibrary:*(void *)(a1 + 32) queue:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
  }
  else
  {
    uint64_t v6 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [v3 error];
      *(_DWORD *)long long buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Failed to rebuild search index with error: %@", buf, 0xCu);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

void __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_63(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

void __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) globalValues];
  char v3 = [v2 markRebuildPhaseCompleted:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    unint64_t v4 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = PLSearchIndexingStatusDescription(*(void *)(a1 + 40));
      int v6 = 138543362;
      v7 = v5;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Marking rebuild phase (%{public}@) complete failed unexpectedly, status already shows rebuild phase completed", (uint8_t *)&v6, 0xCu);
    }
  }
}

void __89__PLSearchIndexingRebuildEngine__rebuildAllRemainingEntitiesForLibrary_queue_completion___block_invoke_62(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (void)_rebuildManagedObjectsFromIterator:(id)a3 ofEntity:(unint64_t)a4 queue:(id)a5 library:(id)a6 completion:(id)a7
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v54 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  long long v53 = [[PLTimedDispatchGroup alloc] initWithQueue:v12 name:@"Rebuild donation"];
  id v15 = [(PLTimedDispatchGroup *)v53 enterWithName:@"Rebuild donation"];
  id v16 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:0];
  uint64_t v75 = MEMORY[0x1E4F143A8];
  uint64_t v76 = 3221225472;
  uint64_t v77 = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke;
  v78 = &unk_1E58644C8;
  v79 = self;
  id v17 = v15;
  id v80 = v17;
  id v18 = v16;
  id v81 = v18;
  if (!PLBoolResultWithUnfairLock())
  {
    unint64_t v51 = a4;
    long long v52 = v12;
    uint64_t v24 = [MEMORY[0x1E4F1C9C8] now];
    id v25 = [v13 managedObjectContext];
    uint64_t v21 = [v54 nextBatchWithManagedObjectContext:v25];

    uint64_t v22 = v13;
    if (v21)
    {
      if (![v21 isFailure])
      {
        unint64_t v36 = [(PLSearchIndexingRebuildEngine *)self _rebuildTypeForLibrary:v13 entityInProgress:0 resumeObjectID:0 rebuildReasons:0];
        if (v36 != 3)
        {
          unint64_t v37 = v36;
          uint64_t v38 = PLSearchBackendIndexRebuildGetLog();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            if (v37 > 2) {
              uint64_t v39 = @"invalid";
            }
            else {
              uint64_t v39 = off_1E5864560[v37];
            }
            *(_DWORD *)long long buf = 138543362;
            v83 = v39;
            _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "Rebuild in progress, but required rebuild type is %{public}@", buf, 0xCu);
          }
        }
        long long v40 = [v13 managedObjectContext];
        id v41 = (id)[v54 countRemainingWithManagedObjectContext:v40 logger:self->_logger];

        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_57;
        v65[3] = &unk_1E58644F0;
        id v48 = v21;
        id v66 = v48;
        id v67 = v18;
        long long v49 = v24;
        id v50 = v13;
        id v42 = v54;
        id v68 = v42;
        id v43 = v24;
        id v69 = v43;
        long long v70 = self;
        unint64_t v74 = v51;
        id v44 = v13;
        id v71 = v44;
        id v45 = v52;
        id v72 = v45;
        id v46 = v17;
        id v73 = v46;
        [v44 performBlock:v65];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_2;
        v55[3] = &unk_1E5864518;
        id v56 = v46;
        id v63 = v14;
        id v57 = v48;
        id v47 = v42;
        uint64_t v22 = v50;
        id v58 = v47;
        id v59 = v43;
        id v60 = v44;
        long long v61 = self;
        char v20 = v49;
        unint64_t v64 = v51;
        id v62 = v45;
        uint64_t v23 = v53;
        [(PLTimedDispatchGroup *)v53 notify:v55];

        id v30 = v66;
        goto LABEL_20;
      }
      [v17 leave];
      uint64_t v26 = PLSearchBackendIndexRebuildGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = [v54 entityName];
        id v28 = [v21 error];
        *(_DWORD *)long long buf = 138543618;
        v83 = v27;
        __int16 v84 = 2112;
        id v85 = v28;
        _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "Rebuild failed to enumerate objects of entity: %{public}@, error: %@", buf, 0x16u);

        uint64_t v22 = v13;
      }

      long long v29 = (void *)MEMORY[0x1E4F8B9B8];
      id v30 = [v21 error];
      id v31 = [v29 failureWithError:v30];
      (*((void (**)(id, void *))v14 + 2))(v14, v31);
    }
    else
    {
      [v17 leave];
      unint64_t v32 = PLSearchBackendIndexRebuildGetLog();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        uint64_t v33 = [v54 entityName];
        *(_DWORD *)long long buf = 138543618;
        v83 = v33;
        __int16 v84 = 2112;
        id v85 = v13;
        _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_INFO, "Search rebuild complete for entity: %{public}@ in library: %@", buf, 0x16u);
      }
      id v34 = (void *)MEMORY[0x1E4F8B9B8];
      __int16 v35 = [MEMORY[0x1E4F1CA98] null];
      id v30 = [v34 successWithResult:v35];

      (*((void (**)(id, void *))v14 + 2))(v14, v30);
    }
    uint64_t v23 = v53;
    char v20 = v24;
LABEL_20:

    id v12 = v52;
    goto LABEL_21;
  }
  [v17 leave];
  unint64_t v19 = (void *)MEMORY[0x1E4F8B9B8];
  char v20 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
  uint64_t v21 = [v19 failureWithError:v20];
  (*((void (**)(id, void *))v14 + 2))(v14, v21);
  uint64_t v22 = v13;
  uint64_t v23 = v53;
LABEL_21:
}

uint64_t __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke(uint64_t a1)
{
  return *(unsigned __int8 *)(*(void *)(a1 + 32) + 49);
}

void __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_57(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) result];
  objc_msgSend(*(id *)(a1 + 40), "setTotalUnitCount:", objc_msgSend(v2, "count"));
  char v3 = PLSearchBackendIndexRebuildGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = [v2 count];
    uint64_t v5 = [*(id *)(a1 + 48) entityName];
    int v6 = [MEMORY[0x1E4F1C9C8] now];
    [v6 timeIntervalSinceDate:*(void *)(a1 + 56)];
    *(_DWORD *)long long buf = 134218498;
    uint64_t v18 = v4;
    __int16 v19 = 2114;
    char v20 = v5;
    __int16 v21 = 2048;
    uint64_t v22 = v7;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Search rebuild donating batch of %tu managed objects (%{public}@), elapsed: %f sec", buf, 0x20u);
  }
  uint64_t v8 = [*(id *)(a1 + 64) delegate];
  uint64_t v9 = *(void *)(a1 + 64);
  uint64_t v10 = *(void *)(a1 + 96);
  uint64_t v11 = [*(id *)(a1 + 48) entityName];
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 72);
  uint64_t v14 = *(void *)(a1 + 80);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_58;
  v15[3] = &unk_1E586B6B0;
  id v16 = *(id *)(a1 + 88);
  objc_msgSend(v8, "inLibraryPerform_donateForSearchIndexingRebuildEngine:managedObjects:entity:entityName:library:progress:queue:completion:", v9, v2, v10, v11, v13, v12, v14, v15);
}

void __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) wasCancelled])
  {
    uint64_t v2 = *(void *)(a1 + 88);
    id v25 = [*(id *)(a1 + 32) result];
    (*(void (**)(uint64_t))(v2 + 16))(v2);
  }
  else
  {
    char v3 = [*(id *)(a1 + 40) result];
    uint64_t v4 = [*(id *)(a1 + 32) result];
    uint64_t v5 = [*(id *)(a1 + 48) resumeObjectID];
    int v6 = [v4 isFailure];
    uint64_t v7 = PLSearchBackendIndexRebuildGetLog();
    uint64_t v8 = v7;
    if (v6)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = [v3 count];
        uint64_t v10 = [*(id *)(a1 + 48) entityName];
        uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
        [v11 timeIntervalSinceDate:*(void *)(a1 + 56)];
        uint64_t v13 = v12;
        uint64_t v14 = [v4 error];
        *(_DWORD *)long long buf = 134219010;
        uint64_t v35 = v9;
        __int16 v36 = 2114;
        unint64_t v37 = v10;
        __int16 v38 = 2114;
        uint64_t v39 = v5;
        __int16 v40 = 2048;
        uint64_t v41 = v13;
        __int16 v42 = 2112;
        id v43 = v14;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Search rebuild donation failure, %tu objects (%{public}@), current resume token: %{public}@ elapsed: %f sec, error: %@", buf, 0x34u);
      }
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_59;
      v30[3] = &unk_1E58735D8;
      id v15 = *(void **)(a1 + 64);
      void v30[4] = *(void *)(a1 + 72);
      id v16 = v3;
      uint64_t v17 = *(void *)(a1 + 96);
      id v31 = v16;
      uint64_t v33 = v17;
      id v32 = *(id *)(a1 + 64);
      [v15 performTransactionAndWait:v30];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = [v3 count];
        __int16 v19 = [*(id *)(a1 + 48) entityName];
        char v20 = [MEMORY[0x1E4F1C9C8] now];
        [v20 timeIntervalSinceDate:*(void *)(a1 + 56)];
        *(_DWORD *)long long buf = 134218754;
        uint64_t v35 = v18;
        __int16 v36 = 2114;
        unint64_t v37 = v19;
        __int16 v38 = 2114;
        uint64_t v39 = v5;
        __int16 v40 = 2048;
        uint64_t v41 = v21;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_INFO, "Search rebuild donation complete, %tu objects (%{public}@), current resume token: %{public}@ elapsed: %f sec", buf, 0x2Au);
      }
    }
    uint64_t v22 = *(void **)(a1 + 64);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_60;
    v27[3] = &unk_1E5875E18;
    id v28 = v22;
    id v23 = v5;
    id v29 = v23;
    [v28 performTransactionAndWait:v27];
    uint64_t v26 = v23;
    id v24 = v23;
    PLRunWithUnfairLock();
    [*(id *)(a1 + 72) _rebuildManagedObjectsFromIterator:*(void *)(a1 + 48) ofEntity:*(void *)(a1 + 96) queue:*(void *)(a1 + 80) library:*(void *)(a1 + 64) completion:*(void *)(a1 + 88)];
  }
}

uint64_t __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_59(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleDonationFailureForRebuildWithManagedObjects:*(void *)(a1 + 40) entity:*(void *)(a1 + 56) library:*(void *)(a1 + 48)];
}

void __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_60(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) globalValues];
  [v2 setSearchIndexRebuildResumeObjectID:v1];
}

void __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_2_61(uint64_t a1)
{
}

uint64_t __102__PLSearchIndexingRebuildEngine__rebuildManagedObjectsFromIterator_ofEntity_queue_library_completion___block_invoke_58(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) leaveWithResult:a2];
}

- (void)_handleDonationFailureForRebuildWithManagedObjects:(id)a3 entity:(unint64_t)a4 library:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  unint64_t v9 = a4 - 1;
  if (v9 > 6) {
    uint64_t v10 = 2;
  }
  else {
    uint64_t v10 = qword_19BA9F098[v9];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v11 = v7;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        switch(v9)
        {
          case 0uLL:
          case 2uLL:
          case 3uLL:
          case 4uLL:
            id v16 = [*(id *)(*((void *)&v22 + 1) + 8 * v15) uuid];
            if (v16) {
              goto LABEL_11;
            }
            break;
          case 6uLL:
            id v20 = +[PLGraphNodeContainer newNodeContainerWithNode:](PLSearchEntity, "newNodeContainerWithNode:", *(void *)(*((void *)&v22 + 1) + 8 * v15), (void)v22);
            id v16 = [v20 encodedIdentifierString];

            if (v16)
            {
LABEL_11:
              uint64_t v17 = objc_msgSend(v8, "managedObjectContext", (void)v22);
              uint64_t v18 = +[PLBackgroundJobWorkItem insertBackgroundJobWorkItemWithIdentifier:v16 jobType:3 jobFlags:v10 inManagedObjectContext:v17];

              __int16 v19 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
              [v18 setDelayUntilDate:v19];
            }
            break;
          default:
            break;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v21 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      uint64_t v13 = v21;
    }
    while (v21);
  }
}

- (unint64_t)_rebuildTypeForLibrary:(id)a3 entityInProgress:(unint64_t *)a4 resumeObjectID:(id *)a5 rebuildReasons:(unint64_t *)a6
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = [(PLSearchIndexingRebuildEngine *)self delegate];
  BOOL v12 = +[PLSpotlightReindexing shouldReindexAllItemsForLibraryIdentifier:](PLSpotlightReindexing, "shouldReindexAllItemsForLibraryIdentifier:", [v11 wellKnownLibraryIdentifierForSearchIndexingRebuildEngine:self]);

  uint64_t v13 = [v10 globalValues];
  uint64_t v14 = [(PLSearchIndexingRebuildEngine *)self delegate];
  uint64_t v15 = [v14 sceneTaxonomyDigestsForSearchIndexingRebuildEngine:self];
  id v16 = [v10 pathManager];
  uint64_t v17 = [v13 searchIndexRebuildReasonsWithSceneTaxonomyDigests:v15 spotlightRequestedRebuild:v12 pathManager:v16];

  if ((v17 & 0x22) != 0)
  {
    unint64_t v18 = 2;
LABEL_5:
    __int16 v19 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      id v20 = @"drop";
      if ((v17 & 0x22) == 0) {
        id v20 = @"overwrite";
      }
      uint64_t v21 = v20;
      long long v22 = PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v17, 0);
      *(_DWORD *)long long buf = 138543618;
      *(void *)&uint8_t buf[4] = v21;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v22;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_DEFAULT, "Detected search index rebuild required, type: %{public}@, reason: %{public}@", buf, 0x16u);
    }
    long long v23 = 0;
    unint64_t v24 = 1;
    goto LABEL_10;
  }
  if ((v17 & 0x3CD) != 0)
  {
    unint64_t v18 = 1;
    goto LABEL_5;
  }
  if ((v17 & 0x10) != 0)
  {
    uint64_t v26 = [v10 globalValues];
    unint64_t v24 = [v26 searchIndexingEntityToRebuild];

    if (v24)
    {
      uint64_t v27 = [v10 globalValues];
      long long v23 = [v27 searchIndexRebuildResumeObjectID];

      id v28 = [v10 globalValues];
      __int16 v19 = [v28 searchIndexRebuildStartDate];

      id v29 = [v10 globalValues];
      id v56 = [v29 searchIndexRebuildEndDate];

      id v30 = [v10 globalValues];
      int v50 = [v30 isSearchIndexRebuildFinished];

      id v31 = PLSearchBackendIndexRebuildGetLog();
      BOOL v53 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

      if (v53)
      {
        if (self->_logger)
        {
          long long v96 = 0u;
          long long v97 = 0u;
          long long v94 = 0u;
          long long v95 = 0u;
          long long v92 = 0u;
          long long v93 = 0u;
          long long v90 = 0u;
          long long v91 = 0u;
          long long v88 = 0u;
          long long v89 = 0u;
          long long v86 = 0u;
          long long v87 = 0u;
          long long v84 = 0u;
          long long v85 = 0u;
          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          long long v78 = 0u;
          long long v79 = 0u;
          long long v76 = 0u;
          long long v77 = 0u;
          long long v74 = 0u;
          long long v75 = 0u;
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          memset(buf, 0, sizeof(buf));
          id v46 = PLSearchBackendIndexRebuildGetLog();
          os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT);
          id v32 = @"YES";
          if (v50) {
            id v32 = @"NO";
          }
          id v54 = v32;
          unint64_t v51 = [(NSISO8601DateFormatter *)self->_loggingDateFormatter stringFromDate:v19];
          id v48 = [(NSISO8601DateFormatter *)self->_loggingDateFormatter stringFromDate:v56];
          if (v24 > 8) {
            uint64_t v33 = @"invalid";
          }
          else {
            uint64_t v33 = off_1E586EAE8[v24];
          }
          os_log_t log = v33;
          __int16 v42 = [v23 URIRepresentation];
          __int16 v40 = [v42 absoluteString];
          uint64_t v41 = PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v17, 0);
          int v57 = 138544642;
          id v58 = v54;
          __int16 v59 = 2114;
          id v60 = v51;
          __int16 v61 = 2114;
          id v62 = v48;
          __int16 v63 = 2114;
          os_log_t v64 = log;
          __int16 v65 = 2114;
          id v66 = v40;
          __int16 v67 = 2114;
          id v68 = v41;
          LODWORD(v39) = 62;
          unint64_t v37 = (uint8_t *)_os_log_send_and_compose_impl();

          -[PLFileBackedLogger logWithMessage:fromCodeLocation:type:](self->_logger, "logWithMessage:fromCodeLocation:type:", v37, "PLSearchIndexingRebuildEngine.m", 490, 0, &v57, v39);
          if (v37 != buf) {
            free(v37);
          }
        }
        else
        {
          id v34 = PLSearchBackendIndexRebuildGetLog();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v35 = @"YES";
            if (v50) {
              uint64_t v35 = @"NO";
            }
            long long v55 = v35;
            long long v52 = [(NSISO8601DateFormatter *)self->_loggingDateFormatter stringFromDate:v19];
            long long v49 = [(NSISO8601DateFormatter *)self->_loggingDateFormatter stringFromDate:v56];
            if (v24 > 8) {
              __int16 v36 = @"invalid";
            }
            else {
              __int16 v36 = off_1E586EAE8[v24];
            }
            uint64_t v44 = v36;
            id v47 = [v23 URIRepresentation];
            __int16 v38 = [v47 absoluteString];
            id v43 = PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v17, 0);
            *(_DWORD *)long long buf = 138544642;
            *(void *)&uint8_t buf[4] = v55;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v52;
            *(_WORD *)&buf[22] = 2114;
            *(void *)&buf[24] = v49;
            *(_WORD *)&buf[32] = 2114;
            *(void *)&buf[34] = v44;
            *(_WORD *)&buf[42] = 2114;
            *(void *)&buf[44] = v38;
            *(_WORD *)&buf[52] = 2114;
            *(void *)&buf[54] = v43;
            _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Detected search index rebuild in progress [%{public}@], start %{public}@ prev end %{public}@, entity: %{public}@, resume objectID: %{public}@ [%{public}@]", buf, 0x3Eu);
          }
        }
      }

      unint64_t v18 = 3;
    }
    else
    {
      __int16 v19 = PLSearchBackendIndexRebuildGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Detected rebuild in progress but no entity to rebuild, will not resume rebuild", buf, 2u);
      }
      long long v23 = 0;
      unint64_t v24 = 0;
      unint64_t v18 = 0;
    }
LABEL_10:

    if (!a4) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  long long v23 = 0;
  unint64_t v24 = 0;
  unint64_t v18 = 0;
  if (a4) {
LABEL_11:
  }
    *a4 = v24;
LABEL_12:
  if (a5) {
    *a5 = v23;
  }
  if (a6) {
    *a6 = v17;
  }

  return v18;
}

- (void)_prepareForRebuildForLibrary:(id)a3 type:(unint64_t)a4 sceneTaxonomyDigests:(id)a5 completion:(id)a6
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = PLSearchBackendIndexRebuildGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = [v10 libraryID];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v14;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Preparing to rebuild search index for library: %@", (uint8_t *)&buf, 0xCu);
  }
  uint64_t v15 = dispatch_group_create();
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v41 = 0x3032000000;
  __int16 v42 = __Block_byref_object_copy__11183;
  id v43 = __Block_byref_object_dispose__11184;
  id v16 = (void *)MEMORY[0x1E4F8B9B8];
  uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
  unint64_t v18 = [v16 successWithResult:v17];

  id v44 = v18;
  BOOL v19 = a4 == 2;
  if (a4 == 2)
  {
    id v20 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)__int16 v38 = 138412290;
      id v39 = v10;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Dropping search index for library %@", v38, 0xCu);
    }

    dispatch_group_enter(v15);
    uint64_t v21 = [(PLSearchIndexingRebuildEngine *)self delegate];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke;
    v34[3] = &unk_1E586B548;
    id v35 = v10;
    p_long long buf = &buf;
    __int16 v36 = v15;
    [v21 dropSearchIndexForSearchIndexingRebuildEngine:self completion:v34];
  }
  long long v22 = +[PLConcurrencyLimiter sharedLimiter];
  queue = self->_queue;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke_44;
  v27[3] = &unk_1E58644A0;
  id v31 = &buf;
  id v24 = v10;
  id v28 = v24;
  unint64_t v32 = a4;
  id v25 = v11;
  id v29 = v25;
  BOOL v33 = v19;
  id v26 = v12;
  id v30 = v26;
  [v22 groupNotify:v15 queue:queue block:v27];

  _Block_object_dispose(&buf, 8);
}

void __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 isFailure])
  {
    uint64_t v4 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = [v3 error];
      int v10 = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v6;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Aborting attempt to begin search index rebuild for library: %@ due to failure to drop search index, error: %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v3;
  id v9 = v3;

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke_44(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isSuccess])
  {
    id v2 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke_2;
    v13[3] = &unk_1E5875E40;
    uint64_t v16 = *(void *)(a1 + 64);
    id v14 = v2;
    id v15 = *(id *)(a1 + 40);
    [v14 performTransactionAndWait:v13];
    if (*(unsigned char *)(a1 + 72))
    {
      id v3 = [*(id *)(a1 + 32) libraryServicesManager];
      uint64_t v4 = [v3 availabilityComputer];
      [v4 didDropSearchIndexForPhotoLibrary:*(void *)(a1 + 32) error:0];
    }
  }
  uint64_t v5 = [*(id *)(a1 + 32) libraryServicesManager];
  uint64_t v6 = [v5 wellKnownPhotoLibraryIdentifier];

  if (v6 == 3
    || +[PLSpotlightDonationUtilities shouldUseSpotlightPrivateIndexForLibraryIdentifier:v6])
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    uint64_t v7 = +[PLSpotlightReindexing deleteFile];
    if ([v7 isFailure])
    {
      id v8 = PLSearchBackendIndexRebuildGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        id v9 = [v7 error];
        *(_DWORD *)long long buf = 138412290;
        unint64_t v18 = v9;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "Failed to remove spotlight reindexing file with error: %@", buf, 0xCu);
      }
    }
    uint64_t v10 = *(void *)(a1 + 48);
    int v11 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isFailure];
    __int16 v12 = v7;
    if (v11) {
      __int16 v12 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    }
    (*(void (**)(uint64_t, void *))(v10 + 16))(v10, v12);
  }
}

void __99__PLSearchIndexingRebuildEngine__prepareForRebuildForLibrary_type_sceneTaxonomyDigests_completion___block_invoke_2(uint64_t a1)
{
  if ((unint64_t)(*(void *)(a1 + 48) - 1) <= 1)
  {
    id v2 = [MEMORY[0x1E4F1C9C8] now];
    id v3 = [*(id *)(a1 + 32) globalValues];
    [v3 setSearchIndexRebuildStartDate:v2];
  }
  uint64_t v4 = [*(id *)(a1 + 32) globalValues];
  [v4 resetSearchIndexRebuildMetadataWithSceneTaxonomyDigests:*(void *)(a1 + 40)];

  id v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v5 = +[PLBackgroundJobWorkItem deleteAllSearchIndexJobsInManagedObjectContext:v6];
}

- (id)_iteratorForSearchEntity:(unint64_t)a3 library:(id)a4 resumeObjectID:(id)a5
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  iteratorsBySearchEntity = self->_iteratorsBySearchEntity;
  id v9 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v10 = [(NSMutableDictionary *)iteratorsBySearchEntity objectForKeyedSubscript:v9];

  if (!v10)
  {
    int v11 = [(PLSearchIndexingRebuildEngine *)self delegate];
    uint64_t v12 = [v11 wellKnownLibraryIdentifierForSearchIndexingRebuildEngine:self];
    id v28 = v7;
    uint64_t v13 = 0;
    id v14 = 0;
    id v15 = 0;
    uint64_t v16 = 0;
    uint64_t v10 = 0;
    switch(a3)
    {
      case 1uLL:
        uint64_t v16 = +[PLManagedAsset entityName];
        uint64_t v17 = +[PLManagedAsset isEligibleForSearchIndexingPredicateForLibraryIdentifier:v12];
        v29[0] = v17;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

        id v14 = +[PLManagedAsset propertiesToFetch];
        unint64_t v18 = PLManagedAsset;
        goto LABEL_7;
      case 3uLL:
        uint64_t v16 = +[PLGenericAlbum entityName];
        id v20 = +[PLGenericAlbum isEligibleForSearchIndexingPredicateForLibraryIdentifier:v12];
        v29[0] = v20;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

        id v14 = +[PLGenericAlbum propertiesToFetch];
        unint64_t v18 = PLGenericAlbum;
        goto LABEL_7;
      case 4uLL:
        uint64_t v16 = +[PLPhotosHighlight entityName];
        uint64_t v19 = +[PLPhotosHighlight isEligibleForSearchIndexingPredicateForLibraryIdentifier:v12];
        v29[0] = v19;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

        id v14 = +[PLPhotosHighlight propertiesToFetch];
        unint64_t v18 = PLPhotosHighlight;
        goto LABEL_7;
      case 5uLL:
        uint64_t v16 = +[PLMemory entityName];
        uint64_t v21 = +[PLMemory isEligibleForSearchIndexingPredicateForLibraryIdentifier:v12];
        v29[0] = v21;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

        id v14 = +[PLMemory propertiesToFetch];
        unint64_t v18 = PLMemory;
LABEL_7:
        uint64_t v13 = [(__objc2_class *)v18 relationshipKeyPathsToPrefetch];
        if (v16) {
          goto LABEL_8;
        }
        goto LABEL_12;
      case 7uLL:
        uint64_t v16 = +[PLGraphNode entityName];
        id v24 = +[PLSearchEntity predicateForSearchEntitySourceNodes];
        v29[0] = v24;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:1];

        id v14 = 0;
        uint64_t v13 = 0;
        if (v16)
        {
LABEL_8:
          long long v22 = [MEMORY[0x1E4F28BA0] andPredicateWithSubpredicates:v15];
          long long v23 = [PLManagedObjectPagingIterator alloc];
          if (_PLRebuildPagingFetchLimit_onceToken != -1) {
            dispatch_once(&_PLRebuildPagingFetchLimit_onceToken, &__block_literal_global_11248);
          }
          uint64_t v10 = [(PLManagedObjectPagingIterator *)v23 initWithEntityName:v16 resultType:0 resumeObjectID:v28 additionalPredicate:v22 batchSize:_PLRebuildPagingFetchLimit__pagingFetchLimit propertiesToFetch:v14 relationshipKeyPathsToPrefetch:v13];
        }
        else
        {
LABEL_12:
          uint64_t v10 = 0;
        }
        break;
      default:
        break;
    }

    id v25 = self->_iteratorsBySearchEntity;
    id v26 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v25 setObject:v10 forKeyedSubscript:v26];
  }
  return v10;
}

- (id)_resumeObjectID
{
  id v2 = PLSafeResultWithUnfairLock();
  return v2;
}

id __48__PLSearchIndexingRebuildEngine__resumeObjectID__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 40);
}

- (unint64_t)_currentEntity
{
  id v2 = PLSafeResultWithUnfairLock();
  unint64_t v3 = [v2 unsignedIntegerValue];

  return v3;
}

uint64_t __47__PLSearchIndexingRebuildEngine__currentEntity__block_invoke(uint64_t a1)
{
  return [NSNumber numberWithUnsignedInteger:*(void *)(*(void *)(a1 + 32) + 32)];
}

- (void)fetchRemainingWorkWithLibrary:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x2020000000;
  uint64_t v25 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = (id *)&v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__11183;
  id v20 = __Block_byref_object_dispose__11184;
  id v21 = 0;
  obj[1] = (id)MEMORY[0x1E4F143A8];
  obj[2] = (id)3221225472;
  obj[3] = __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke;
  obj[4] = &unk_1E5864478;
  obj[5] = self;
  obj[6] = &v22;
  obj[7] = &v16;
  if ((PLBoolResultWithUnfairLock() & 1) != 0
    || (id v8 = v17 + 5,
        obj[0] = v17[5],
        unint64_t v9 = [(PLSearchIndexingRebuildEngine *)self _rebuildTypeForLibrary:v6 entityInProgress:v23 + 3 resumeObjectID:obj rebuildReasons:0], objc_storeStrong(v8, obj[0]), v9))
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2;
    v10[3] = &unk_1E586EEA0;
    id v14 = &v16;
    uint64_t v13 = &v22;
    v10[4] = self;
    id v11 = v6;
    id v12 = v7;
    [v11 performBlock:v10];
  }
  else
  {
    (*((void (**)(id, void, void, double))v7 + 2))(v7, 0, 0, 0.0);
  }
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
}

uint64_t __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[5] + 8) + 24) = *(void *)(a1[4] + 32);
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), *(id *)(a1[4] + 40));
  return *(unsigned __int8 *)(a1[4] + 48);
}

void __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2(uint64_t a1, __n128 a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v3 > 8)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 0;
    a2.n128_u64[0] = 138543618;
    __n128 v16 = a2;
    do
    {
      if (v3 == *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
        id v5 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      }
      else {
        id v5 = 0;
      }
      id v6 = v5;
      if (v3 <= 8 && ((0xBAu >> v3) & 1) != 0)
      {
        id v7 = [*(id *)(a1 + 32) _iteratorForSearchEntity:v3 library:*(void *)(a1 + 40) resumeObjectID:v6];
        id v8 = [*(id *)(a1 + 40) managedObjectContext];
        unint64_t v9 = [v7 countRemainingWithManagedObjectContext:v8 logger:*(void *)(*(void *)(a1 + 32) + 112)];

        if ([v9 isSuccess])
        {
          uint64_t v10 = [v9 result];
          v4 += [v10 unsignedIntegerValue];
        }
        else
        {
          uint64_t v10 = PLSearchBackendIndexRebuildGetLog();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            id v11 = [v7 entityName];
            id v12 = [v9 error];
            *(_DWORD *)long long buf = v16.n128_u32[0];
            id v21 = v11;
            __int16 v22 = 2112;
            long long v23 = v12;
            _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to fetch count of remaining work for entity: %{public}@, error: %@", buf, 0x16u);
          }
        }
      }
      ++v3;
    }
    while (v3 != 9);
  }
  uint64_t v13 = +[PLConcurrencyLimiter sharedLimiter];
  uint64_t v14 = *(void *)(a1 + 32);
  uint64_t v15 = *(void *)(v14 + 16);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_40;
  v17[3] = &unk_1E5873370;
  v17[4] = v14;
  id v18 = *(id *)(a1 + 48);
  uint64_t v19 = v4;
  [v13 dispatchAsync:v15 block:v17];
}

uint64_t __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_40(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 40) + 16))(0.0);
}

BOOL __74__PLSearchIndexingRebuildEngine_fetchRemainingWorkWithLibrary_completion___block_invoke_2_41(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  return !*(unsigned char *)(v1 + 48) || *(unsigned char *)(v1 + 49) != 0;
}

- (void)pauseSearchIndexRebuildWithSourceName:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  PLSafeRunWithUnfairLock();
}

void __71__PLSearchIndexingRebuildEngine_pauseSearchIndexRebuildWithSourceName___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isEqualToString:@"Background Job"] & 1) == 0)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(v2 + 88);
    if (v3) {
      *(void *)(v2 + 88) = v3 - 1;
    }
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (*(unsigned char *)(v4 + 48))
  {
    uint64_t v5 = *(void *)(v4 + 88);
    id v6 = PLSearchBackendIndexRebuildGetLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        uint64_t v8 = *(void *)(a1 + 32);
        int v13 = 138543362;
        uint64_t v14 = v8;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Deferring pause search index rebuild for source: %{public}@ because other clients have requested rebuild", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      if (v7)
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v13 = 138543362;
        uint64_t v14 = v9;
        _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Pausing search index rebuild for source: %{public}@", (uint8_t *)&v13, 0xCu);
      }

      *(unsigned char *)(*(void *)(a1 + 40) + 49) = 1;
      [*(id *)(*(void *)(a1 + 40) + 72) cancel];
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = *(void **)(v10 + 72);
      *(void *)(v10 + 72) = 0;

      [*(id *)(*(void *)(a1 + 40) + 80) cancel];
      uint64_t v12 = *(void *)(a1 + 40);
      id v6 = *(NSObject **)(v12 + 80);
      *(void *)(v12 + 80) = 0;
    }
  }
}

- (void)resumeSearchIndexRebuildIfNeededForLibrary:(id)a3 calledBy:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v24 = 0;
  uint64_t v25 = 0;
  id v23 = 0;
  unint64_t v11 = [(PLSearchIndexingRebuildEngine *)self _rebuildTypeForLibrary:v8 entityInProgress:&v25 resumeObjectID:&v23 rebuildReasons:&v24];
  id v12 = v23;
  int v13 = 0;
  if ((v24 & 8) != 0)
  {
    uint64_t v14 = [(PLSearchIndexingRebuildEngine *)self delegate];
    int v13 = +[PLSpotlightReindexing spotlightReasonForReindexingAllItemsForLibraryIdentifier:](PLSpotlightReindexing, "spotlightReasonForReindexingAllItemsForLibraryIdentifier:", [v14 wellKnownLibraryIdentifierForSearchIndexingRebuildEngine:self]);
  }
  id v15 = v12;
  PLRunWithUnfairLock();
  if (v11)
  {
    id v19 = v8;
    id v20 = v9;
    id v21 = v13;
    id v22 = v10;
    PLSafeRunWithUnfairLock();
  }
  else
  {
    __n128 v16 = (void *)MEMORY[0x1E4F8B9B8];
    uint64_t v17 = [MEMORY[0x1E4F1CA98] null];
    id v18 = [v16 successWithResult:v17];

    (*((void (**)(id, void *, void))v10 + 2))(v10, v18, 0);
  }
}

void __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 32) = *(void *)(a1 + 48);
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), *(id *)(a1 + 40));
}

void __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 49) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v2 + 48))
  {
    *(unsigned char *)(v2 + 48) = 1;
    [*(id *)(*(void *)(a1 + 32) + 8) removeAllObjects];
    dispatch_group_enter(*(dispatch_group_t *)(*(void *)(a1 + 32) + 56));
    objc_msgSend(*(id *)(a1 + 32), "_lock_startPrepareAndRebuildForLibrary:type:calledBy:rebuildReasons:spotlightReasonForReindexingAllItems:", *(void *)(a1 + 40), *(void *)(a1 + 72), *(void *)(a1 + 48), *(void *)(a1 + 80), *(void *)(a1 + 56));
    uint64_t v3 = +[PLConcurrencyLimiter sharedLimiter];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 56);
    uint64_t v6 = *(void *)(v4 + 16);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_3;
    v13[3] = &unk_1E5875CE0;
    void v13[4] = v4;
    [v3 groupNotify:v5 queue:v6 block:v13];
  }
  if (([*(id *)(a1 + 48) isEqualToString:@"Background Job"] & 1) == 0) {
    ++*(void *)(*(void *)(a1 + 32) + 88);
  }
  BOOL v7 = +[PLConcurrencyLimiter sharedLimiter];
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 56);
  uint64_t v10 = *(void *)(v8 + 16);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_5;
  v11[3] = &unk_1E58742F0;
  v11[4] = v8;
  id v12 = *(id *)(a1 + 64);
  [v7 groupNotify:v9 queue:v10 block:v11];
}

void __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = PLSafeResultWithUnfairLock();
  objc_msgSend(*(id *)(a1 + 32), "_inq_rebuildAnalyticsCompletedWithResult:", v2);
}

void __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = PLSafeResultWithUnfairLock();
  (*(void (**)(void, void *, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2, [v2 isSuccess]);
}

id __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_6(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 64);
}

id __96__PLSearchIndexingRebuildEngine_resumeSearchIndexRebuildIfNeededForLibrary_calledBy_completion___block_invoke_4(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 88) = 0;
  return *(id *)(*(void *)(a1 + 32) + 64);
}

- (id)analyticsEventManager
{
  return (id)[(PLLazyObject *)self->_lazyCoreAnalyticsEventManager objectValue];
}

- (PLSearchIndexingRebuildEngine)initWithDelegate:(id)a3 provider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)PLSearchIndexingRebuildEngine;
  uint64_t v8 = [(PLSearchIndexingRebuildEngine *)&v38 init];
  uint64_t v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    uint64_t v10 = (objc_class *)objc_opt_class();
    unint64_t v11 = NSStringFromClass(v10);
    id v12 = [v11 stringByAppendingString:@".searchIndexRebuildCompletion"];
    int v13 = (const char *)[v12 UTF8String];
    qos_class_t v14 = qos_class_self();
    id v15 = dispatch_queue_attr_make_with_qos_class(0, v14, 0);
    dispatch_queue_t v16 = dispatch_queue_create(v13, v15);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v16;

    v9->_lock._os_unfair_lock_opaque = 0;
    dispatch_group_t v18 = dispatch_group_create();
    lock_group = v9->_lock_group;
    v9->_lock_group = (OS_dispatch_group *)v18;

    id v20 = objc_initWeak(&location, v9);
    id v21 = objc_alloc(MEMORY[0x1E4F8B948]);
    uint64_t v32 = MEMORY[0x1E4F143A8];
    uint64_t v33 = 3221225472;
    id v34 = __59__PLSearchIndexingRebuildEngine_initWithDelegate_provider___block_invoke;
    id v35 = &unk_1E5874070;
    objc_copyWeak(&v36, &location);
    uint64_t v22 = [v21 initWithBlock:&v32];
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
    lazyCoreAnalyticsEventManager = v9->_lazyCoreAnalyticsEventManager;
    v9->_lazyCoreAnalyticsEventManager = (PLLazyObject *)v22;

    v9->_coreAnalyticsRebuildToken = 0.0;
    uint64_t v24 = objc_msgSend(v7, "createLogger", v32, v33, v34, v35);
    logger = v9->_logger;
    v9->_logger = (PLFileBackedLogger *)v24;

    id v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    iteratorsBySearchEntity = v9->_iteratorsBySearchEntity;
    v9->_iteratorsBySearchEntity = v26;

    id v28 = (NSISO8601DateFormatter *)objc_alloc_init(MEMORY[0x1E4F28D48]);
    loggingDateFormatter = v9->_loggingDateFormatter;
    v9->_loggingDateFormatter = v28;

    [(NSISO8601DateFormatter *)v9->_loggingDateFormatter setFormatOptions:1907];
    id v30 = [MEMORY[0x1E4F1CAF0] localTimeZone];
    [(NSISO8601DateFormatter *)v9->_loggingDateFormatter setTimeZone:v30];
  }
  return v9;
}

id __59__PLSearchIndexingRebuildEngine_initWithDelegate_provider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    id v2 = objc_alloc_init(MEMORY[0x1E4F8B8C0]);
  }
  else {
    id v2 = 0;
  }

  return v2;
}

+ (BOOL)requiresImmediateDropIndexForLibrary:(id)a3 reasons:(unint64_t *)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [v5 globalValues];
  id v7 = [v5 pathManager];
  uint64_t v8 = [v6 searchIndexRebuildReasonsWithSceneTaxonomyDigests:0 spotlightRequestedRebuild:0 pathManager:v7];

  uint64_t v9 = v8 & 0x22;
  if ((v8 & 0x22) != 0)
  {
    unint64_t v10 = v8 & 0xFFFFFFFFFFFFFFFBLL;
    unint64_t v11 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v10, 0);
      int v14 = 138543618;
      id v15 = v12;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Immediate search index drop required for reasons: %{public}@ for library: %@", (uint8_t *)&v14, 0x16u);
    }
    if (a4) {
      *a4 = v10;
    }
  }

  return v9 != 0;
}

+ (BOOL)hasRebuildWorkToDoForLibrary:(id)a3 identifier:(int64_t)a4 sceneTaxonomyDigests:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  BOOL v9 = +[PLSpotlightReindexing shouldReindexAllItemsForLibraryIdentifier:a4];
  unint64_t v10 = [v7 globalValues];
  unint64_t v11 = [v7 pathManager];
  uint64_t v12 = [v10 searchIndexRebuildReasonsWithSceneTaxonomyDigests:v8 spotlightRequestedRebuild:v9 pathManager:v11];

  if (v12)
  {
    int v13 = PLSearchBackendIndexRebuildGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = PLSearchIndexRebuildReasonsDescriptionWithSpotlightReason(v12, 0);
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Detected rebuild reasons: %{public}@ for library: %@", (uint8_t *)&v16, 0x16u);
    }
  }

  return v12 != 0;
}

@end