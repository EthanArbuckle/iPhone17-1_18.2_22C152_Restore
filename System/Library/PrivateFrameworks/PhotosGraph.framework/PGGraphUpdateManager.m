@interface PGGraphUpdateManager
- (BOOL)_pauseListening;
- (BOOL)_performEnrichmentWithGraphUpdateInventory:(id)a3 enrichmentContext:(unint64_t)a4 progressBlock:(id)a5 error:(id *)a6;
- (BOOL)_startListening;
- (BOOL)isConsistencyUpdate;
- (BOOL)isListening;
- (BOOL)startListening;
- (BOOL)stopRequested;
- (NSDate)dateSinceMajorUpgrade;
- (NSMutableArray)pendingChanges;
- (NSMutableSet)listeners;
- (NSString)description;
- (OS_dispatch_queue)processingQueue;
- (OS_dispatch_queue)stateQueue;
- (PGGraphUpdateHealthRecording)updateHealthRecorder;
- (PGGraphUpdateJetsamIndicator)jetsamIndicator;
- (PGGraphUpdateManager)initWithGraphManager:(id)a3;
- (PGGraphUpdateManagerTargetTokenState)targetTokenState;
- (PGLibraryChangeListener)libraryChangeListener;
- (PGManager)manager;
- (PGPhotoChangeToGraphChangeConverter)changeConverter;
- (id)_graphUpdateForPhotoChanges:(id)a3;
- (id)_tokensForChanges:(id)a3;
- (int64_t)executionContext;
- (unsigned)processingState;
- (void)_notifyListeners:(id)a3 notificationType:(unsigned __int8)a4;
- (void)_notifyProgress:(double)a3;
- (void)_onEncounteredTargetToken;
- (void)_onFinishedProcessingChangesWithTokens:(id)a3;
- (void)_onStopRequestedWasListening:(BOOL)a3;
- (void)_performRebuildWithGraphIngestRecipe:(id)a3 progressBlock:(id)a4 completionBlock:(id)a5;
- (void)_processPendingChanges;
- (void)_processRebuild;
- (void)_recordInformationFromDatabaseChange:(id)a3;
- (void)_recordInformationFromGraphChanges:(id)a3;
- (void)_recordNumberOfDaysSinceMajorOSUpgradeIfNeeded;
- (void)_signalGraphIsConsistentWithTokens:(id)a3;
- (void)_triggerFullRebuildDuringLiveUpdate:(BOOL)a3 graphIngestRecipe:(id)a4 progressBlock:(id)a5 keepExistingGraph:(BOOL)a6 completionBlock:(id)a7;
- (void)_triggerUpdateForGraphUpdate:(id)a3;
- (void)addListener:(id)a3;
- (void)incrementalChangeNotAvailable;
- (void)libraryChangesAvailable:(id)a3;
- (void)performFullRebuildWithProgressBlock:(id)a3 completionBlock:(id)a4;
- (void)removeListener:(id)a3;
- (void)setChangeConverter:(id)a3;
- (void)setExecutionContext:(int64_t)a3;
- (void)setLibraryChangeListener:(id)a3;
- (void)setListening:(BOOL)a3;
- (void)setPendingChanges:(id)a3;
- (void)setProcessingQueue:(id)a3;
- (void)setProcessingState:(unsigned __int8)a3;
- (void)setStateQueue:(id)a3;
- (void)setStopRequested:(BOOL)a3;
- (void)setTargetTokenState:(id)a3;
- (void)stopListening;
@end

@implementation PGGraphUpdateManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateSinceMajorUpgrade, 0);
  objc_storeStrong((id *)&self->_updateHealthRecorder, 0);
  objc_storeStrong((id *)&self->_targetTokenState, 0);
  objc_storeStrong((id *)&self->_jetsamIndicator, 0);
  objc_storeStrong((id *)&self->_pendingChanges, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong((id *)&self->_changeConverter, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_processingQueue, 0);
  objc_storeStrong((id *)&self->_libraryChangeListener, 0);
  objc_storeStrong((id *)&self->_listeners, 0);
}

- (NSDate)dateSinceMajorUpgrade
{
  return self->_dateSinceMajorUpgrade;
}

- (PGGraphUpdateHealthRecording)updateHealthRecorder
{
  return self->_updateHealthRecorder;
}

- (void)setExecutionContext:(int64_t)a3
{
  self->_executionContext = a3;
}

- (int64_t)executionContext
{
  return self->_executionContext;
}

- (void)setTargetTokenState:(id)a3
{
}

- (PGGraphUpdateManagerTargetTokenState)targetTokenState
{
  return self->_targetTokenState;
}

- (PGGraphUpdateJetsamIndicator)jetsamIndicator
{
  return self->_jetsamIndicator;
}

- (void)setPendingChanges:(id)a3
{
}

- (NSMutableArray)pendingChanges
{
  return self->_pendingChanges;
}

- (unsigned)processingState
{
  return self->_processingState;
}

- (PGManager)manager
{
  return self->_manager;
}

- (void)setChangeConverter:(id)a3
{
}

- (PGPhotoChangeToGraphChangeConverter)changeConverter
{
  return self->_changeConverter;
}

- (void)setStateQueue:(id)a3
{
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (void)setProcessingQueue:(id)a3
{
}

- (OS_dispatch_queue)processingQueue
{
  return self->_processingQueue;
}

- (void)setLibraryChangeListener:(id)a3
{
}

- (PGLibraryChangeListener)libraryChangeListener
{
  return self->_libraryChangeListener;
}

- (NSMutableSet)listeners
{
  return self->_listeners;
}

- (void)_recordNumberOfDaysSinceMajorOSUpgradeIfNeeded
{
  if (self->_dateSinceMajorUpgrade)
  {
    v3 = [MEMORY[0x1E4F1C9C8] date];
    [v3 timeIntervalSinceDate:self->_dateSinceMajorUpgrade];
    double v5 = v4;

    unint64_t v6 = vcvtmd_u64_f64(v5 / 86400.0);
    updateHealthRecorder = self->_updateHealthRecorder;
    [(PGGraphUpdateHealthRecording *)updateHealthRecorder recordNumberOfDaysSinceMajorOSUpgrade:v6];
  }
}

- (void)_recordInformationFromGraphChanges:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += [*(id *)(*((void *)&v10 + 1) + 8 * i) changeCount];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  [(PGGraphUpdateHealthRecording *)self->_updateHealthRecorder recordNumberOfDatabaseChangesConvertedToGraphChanges:v7 inBackground:[(PGGraphUpdateManager *)self isConsistencyUpdate]];
}

- (void)_recordInformationFromDatabaseChange:(id)a3
{
  uint64_t v4 = [a3 totalChangeCount];
  updateHealthRecorder = self->_updateHealthRecorder;
  BOOL v6 = [(PGGraphUpdateManager *)self isConsistencyUpdate];
  [(PGGraphUpdateHealthRecording *)updateHealthRecorder recordNumberOfDatabaseChangesReceived:v4 inBackground:v6];
}

- (id)_graphUpdateForPhotoChanges:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "GraphLiveUpdate - Starting conversion from PHChange to PGGraphUpdate", buf, 2u);
  }
  unint64_t v5 = [(PGGraphUpdateManager *)self executionContext];
  if (v5 > 2) {
    uint64_t v6 = 0;
  }
  else {
    uint64_t v6 = qword_1D1F4F588[v5];
  }
  uint64_t v7 = [PGGraphUpdate alloc];
  uint64_t v8 = [(PGManager *)self->_manager photoLibrary];
  v33 = [(PGGraphUpdate *)v7 initWithPhotoLibrary:v8 updateType:v6];

  context = (void *)MEMORY[0x1D25FED50]();
  v9 = [(PGManager *)self->_manager graphLoggingConnection];
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  long long v11 = v9;
  long long v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ConversionChanges", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v31 = mach_absolute_time();
  long long v13 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v36;
    while (2)
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v36 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        if (![v19 hasIncrementalChanges])
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate HasIncrementalChanges is equal to NO, need a full rebuild", buf, 2u);
          }

          v29 = 0;
          v20 = v33;
          goto LABEL_28;
        }
        [v13 addObject:v19];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v16) {
        continue;
      }
      break;
    }
  }

  v20 = v33;
  if ([v13 count])
  {
    v21 = [MEMORY[0x1E4F38FC8] mergePersistedChanges:v13];
    changeConverter = self->_changeConverter;
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __52__PGGraphUpdateManager__graphUpdateForPhotoChanges___block_invoke;
    v34[3] = &unk_1E68E8CD0;
    v34[4] = self;
    v23 = [(PGPhotoChangeToGraphChangeConverter *)changeConverter graphChangesWithPhotoChange:v21 progressBlock:v34];
    [(PGGraphUpdateManager *)self _recordInformationFromDatabaseChange:v21];
    [(PGGraphUpdateManager *)self _recordInformationFromGraphChanges:v23];
    [(PGGraphUpdate *)v33 addChanges:v23];
  }
  uint64_t v24 = mach_absolute_time();
  uint32_t numer = info.numer;
  uint32_t denom = info.denom;
  v27 = v12;
  v28 = v27;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v28, OS_SIGNPOST_INTERVAL_END, v10, "ConversionChanges", "", buf, 2u);
  }

  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "ConversionChanges";
    __int16 v42 = 2048;
    double v43 = (float)((float)((float)((float)(v24 - v31) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1D1805000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  v29 = v33;
LABEL_28:

  return v29;
}

uint64_t __52__PGGraphUpdateManager__graphUpdateForPhotoChanges___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = [*(id *)(a1 + 32) stopRequested];
  *a2 = result;
  if ((result & 1) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 _notifyProgress:a3];
  }
  return result;
}

- (BOOL)_performEnrichmentWithGraphUpdateInventory:(id)a3 enrichmentContext:(unint64_t)a4 progressBlock:(id)a5 error:(id *)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v10 = a5;
  long long v11 = _Block_copy(v10);
  uint64_t v40 = 0;
  v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  long long v12 = [(PGManager *)self->_manager enrichmentLoggingConnection];
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  id v14 = v12;
  uint64_t v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D1805000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "EnrichmentUpdate", "", buf, 2u);
  }

  mach_timebase_info info = 0;
  mach_timebase_info(&info);
  uint64_t v31 = mach_absolute_time();
  uint64_t v16 = +[PGGraphDataModelEnrichmentManager enrichmentProcessorsForDataModelEnrichmentContext:a4];
  uint64_t v17 = [PGGraphDataModelEnrichmentManager alloc];
  v18 = [(PGGraphUpdateManager *)self manager];
  v19 = [(PGGraphDataModelEnrichmentManager *)v17 initWithManager:v18 enrichmentProcessors:v16];

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __105__PGGraphUpdateManager__performEnrichmentWithGraphUpdateInventory_enrichmentContext_progressBlock_error___block_invoke;
  v33[3] = &unk_1E68F03F8;
  id v20 = v11;
  id v34 = v20;
  long long v35 = v39;
  long long v36 = &v40;
  uint64_t v37 = 0x3F847AE147AE147BLL;
  [(PGGraphDataModelEnrichmentManager *)v19 enrichDataModelWithGraphUpdateInventory:v32 error:0 progressBlock:v33];
  int v21 = *((unsigned __int8 *)v41 + 24);
  if (a6 && *((unsigned char *)v41 + 24))
  {
    *a6 = +[PGError errorForCode:-4];
    int v21 = *((unsigned __int8 *)v41 + 24);
  }
  if (v21)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)uint64_t v45 = 1048;
      *(_WORD *)&v45[4] = 2080;
      *(void *)&v45[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Core/PGGraphUpdateManager.m";
      v22 = MEMORY[0x1E4F14500];
      v23 = "Cancelled at line %d in file %s";
      uint32_t v24 = 18;
LABEL_15:
      _os_log_impl(&dword_1D1805000, v22, OS_LOG_TYPE_INFO, v23, buf, v24);
    }
  }
  else
  {
    uint64_t v25 = mach_absolute_time();
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    v28 = v15;
    v29 = v28;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v29, OS_SIGNPOST_INTERVAL_END, v13, "EnrichmentUpdate", "", buf, 2u);
    }

    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)uint64_t v45 = "EnrichmentUpdate";
      *(_WORD *)&v45[8] = 2048;
      *(double *)&v45[10] = (float)((float)((float)((float)(v25 - v31) * (float)numer) / (float)denom) / 1000000.0);
      v23 = "[Performance] %s: %f ms";
      v22 = v29;
      uint32_t v24 = 22;
      goto LABEL_15;
    }
  }

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(&v40, 8);

  return v21 == 0;
}

void __105__PGGraphUpdateManager__performEnrichmentWithGraphUpdateInventory_enrichmentContext_progressBlock_error___block_invoke(uint64_t a1, unsigned char *a2, double a3)
{
  if (*(void *)(a1 + 32))
  {
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(void *)(a1 + 32) + 16))(a3);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24)) {
        *a2 = 1;
      }
    }
  }
}

- (void)_triggerUpdateForGraphUpdate:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  uint64_t v28 = 0;
  v29 = (id *)&v28;
  uint64_t v30 = 0x3032000000;
  uint64_t v31 = __Block_byref_object_copy__20120;
  id v32 = __Block_byref_object_dispose__20121;
  id v33 = 0;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__20120;
  v26 = __Block_byref_object_dispose__20121;
  id v5 = v4;
  id v27 = v5;
  dispatch_block_t v6 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_301);
  manager = self->_manager;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_2;
  v21[3] = &unk_1E68E8CD0;
  v21[4] = self;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_3;
  v16[3] = &unk_1E68E7170;
  v18 = &v34;
  v19 = &v28;
  id v20 = &v22;
  id v8 = v6;
  id v17 = v8;
  [(PGManager *)manager startGraphUpdate:v5 progressBlock:v21 completionBlock:v16];
  dispatch_block_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  if (*((unsigned char *)v35 + 24)
    && ![(PGGraphUpdateManager *)self stopRequested]
    && [(PGGraphUpdateManager *)self executionContext] != 2)
  {
    if ([(PGGraphUpdateManager *)self executionContext] == 1) {
      uint64_t v9 = 1;
    }
    else {
      uint64_t v9 = 2;
    }
    uint64_t v10 = v23[5];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_4;
    v15[3] = &unk_1E68E8CD0;
    v15[4] = self;
    long long v11 = v29;
    id obj = v29[5];
    BOOL v12 = [(PGGraphUpdateManager *)self _performEnrichmentWithGraphUpdateInventory:v10 enrichmentContext:v9 progressBlock:v15 error:&obj];
    objc_storeStrong(v11 + 5, obj);
    *((unsigned char *)v35 + 24) = v12;
  }
  if (!*((unsigned char *)v35 + 24) && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v13 = v29[5];
    *(_DWORD *)buf = 138412290;
    id v39 = v13;
    _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "GraphLiveUpdate - Update failed with error %@", buf, 0xCu);
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
}

uint64_t __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = [*(id *)(a1 + 32) stopRequested];
  *a2 = result;
  if ((result & 1) == 0)
  {
    uint64_t v7 = *(void **)(a1 + 32);
    return [v7 _notifyProgress:a3];
  }
  return result;
}

void __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_3(void *a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = a2;
  uint64_t v9 = *(void *)(a1[6] + 8);
  uint64_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v7;
  id v14 = v7;

  uint64_t v11 = *(void *)(a1[7] + 8);
  BOOL v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v8;
  id v13 = v8;

  (*(void (**)(void))(a1[4] + 16))();
}

uint64_t __53__PGGraphUpdateManager__triggerUpdateForGraphUpdate___block_invoke_4(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = [*(id *)(a1 + 32) stopRequested];
  *a2 = result;
  if ((result & 1) == 0)
  {
    id v7 = *(void **)(a1 + 32);
    return [v7 _notifyProgress:a3];
  }
  return result;
}

- (void)_triggerFullRebuildDuringLiveUpdate:(BOOL)a3 graphIngestRecipe:(id)a4 progressBlock:(id)a5 keepExistingGraph:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v8 = a6;
  BOOL v52 = a3;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a5;
  id v13 = (void (**)(id, BOOL, void))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  v54 = v12;
  id v14 = (void (**)(void *, unsigned char *, double))_Block_copy(v12);
  double v15 = 0.0;
  if (!v14 || (double Current = CFAbsoluteTimeGetCurrent(), Current < 0.01))
  {
LABEL_7:
    id v17 = [(PGManager *)self->_manager graphLoggingConnection];
    os_signpost_id_t v18 = os_signpost_id_generate(v17);
    v19 = v17;
    id v20 = v19;
    os_signpost_id_t spid = v18;
    log = v19;
    if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      BOOL v21 = os_signpost_enabled(v19);
      id v20 = log;
      if (v21)
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1D1805000, log, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PerformFullRebuild", "", (uint8_t *)&buf, 2u);
        id v20 = log;
      }
    }

    mach_timebase_info info = 0;
    mach_timebase_info(&info);
    uint64_t v48 = mach_absolute_time();
    uint64_t v22 = [(PGManager *)self->_manager photoLibrary];
    uint64_t v23 = [v22 currentToken];

    if ([(PGManager *)self->_manager currentGraphVersion] - 1 <= 0x12A)
    {
      manager = self->_manager;
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke;
      v77[3] = &unk_1E68F0848;
      v77[4] = self;
      [(PGManager *)manager performSynchronousConcurrentGraphReadUsingBlock:v77];
    }
    unint64_t v50 = v18 - 1;
    v51 = (void *)v23;
    uint64_t v73 = 0;
    v74 = &v73;
    uint64_t v75 = 0x2020000000;
    char v76 = 0;
    uint64_t buf = 0;
    *(void *)&long long v82 = &buf;
    *((void *)&v82 + 1) = 0x3032000000;
    v83 = __Block_byref_object_copy__20120;
    v84 = __Block_byref_object_dispose__20121;
    id v85 = 0;
    uint64_t v67 = 0;
    v68 = (id *)&v67;
    uint64_t v69 = 0x3032000000;
    v70 = __Block_byref_object_copy__20120;
    v71 = __Block_byref_object_dispose__20121;
    id v72 = 0;
    if (v52) {
      double v25 = 0.5;
    }
    else {
      double v25 = 1.0;
    }
    dispatch_block_t v26 = dispatch_block_create((dispatch_block_flags_t)0, &__block_literal_global_294_20127);
    id v27 = self->_manager;
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_3;
    v64[3] = &unk_1E68E7120;
    id v47 = v54;
    id v65 = v47;
    double v66 = v25;
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_4;
    v59[3] = &unk_1E68E7148;
    v62 = &v67;
    p_uint64_t buf = &buf;
    v61 = &v73;
    uint64_t v28 = self;
    v59[4] = self;
    id v29 = v26;
    id v60 = v29;
    [(PGManager *)v27 startLibraryAnalysisWithRecipe:v11 progressBlock:v64 keepExistingGraph:v8 completionBlock:v59];
    dispatch_block_wait(v29, 0xFFFFFFFFFFFFFFFFLL);
    uint64_t v30 = mach_absolute_time();
    p_isa = (id *)&v28->super.isa;
    uint32_t numer = info.numer;
    uint32_t denom = info.denom;
    uint64_t v34 = log;
    long long v35 = v34;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      LOWORD(v79) = 0;
      _os_signpost_emit_with_name_impl(&dword_1D1805000, v35, OS_SIGNPOST_INTERVAL_END, spid, "PerformFullRebuild", " enableTelemetry=YES ", (uint8_t *)&v79, 2u);
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      int v79 = 136315394;
      v80[0] = "PerformFullRebuild";
      LOWORD(v80[1]) = 2048;
      *(double *)((char *)&v80[1] + 2) = (float)((float)((float)((float)(v30 - v48) * (float)numer) / (float)denom)
                                               / 1000000.0);
      _os_log_impl(&dword_1D1805000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v79, 0x16u);
    }
    uint64_t v36 = v35;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v45 = objc_msgSend(MEMORY[0x1E4F71EE8], "humanReadableMemoryFootprint", v47);
      int v79 = 136315394;
      v80[0] = "PerformFullRebuild";
      LOWORD(v80[1]) = 2112;
      *(void *)((char *)&v80[1] + 2) = v45;
      _os_log_debug_impl(&dword_1D1805000, v36, OS_LOG_TYPE_DEBUG, "[Memory Footprint] %s : %@", (uint8_t *)&v79, 0x16u);
    }
    if (*((unsigned char *)v74 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        LOWORD(v79) = 0;
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - rebuild completed successfully", (uint8_t *)&v79, 2u);
      }
      if (v52)
      {
        uint64_t v37 = *(void *)(v82 + 40);
        if (!v37)
        {
          if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
          {
            LOWORD(v79) = 0;
            _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - Detected nil processedGraphUpdate following graph rebuild!", (uint8_t *)&v79, 2u);
          }
          long long v38 = [PGGraphUpdate alloc];
          id v39 = [p_isa[7] photoLibrary];
          uint64_t v40 = [(PGGraphUpdate *)v38 initWithPhotoLibrary:v39 updateType:3];
          v41 = *(void **)(v82 + 40);
          *(void *)(v82 + 40) = v40;

          [*(id *)(v82 + 40) setIsResumingFullAnalysis:1];
          uint64_t v37 = *(void *)(v82 + 40);
        }
        v57[0] = MEMORY[0x1E4F143A8];
        v57[1] = 3221225472;
        v57[2] = __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_299;
        v57[3] = &unk_1E68F04F0;
        id v58 = v47;
        uint64_t v42 = v68;
        id obj = v68[5];
        char v43 = [p_isa _performEnrichmentWithGraphUpdateInventory:v37 enrichmentContext:1 progressBlock:v57 error:&obj];
        objc_storeStrong(v42 + 5, obj);
        *((unsigned char *)v74 + 24) = v43;
      }
      if (*((unsigned char *)v74 + 24)) {
        [p_isa[3] persistToken:v51];
      }
      if (v14)
      {
        if (CFAbsoluteTimeGetCurrent() - v15 >= 0.01)
        {
          char v55 = 0;
          v14[2](v14, &v55, 1.0);
          if (v55)
          {
            if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
            {
              int v79 = 67109378;
              LODWORD(v80[0]) = 978;
              WORD2(v80[0]) = 2080;
              *(void *)((char *)v80 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Core/PGGraphUpdateManager.m";
              _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v79, 0x12u);
            }
            goto LABEL_44;
          }
        }
      }
      if (v13)
      {
        BOOL v44 = *((unsigned char *)v74 + 24) != 0;
LABEL_43:
        ((void (**)(id, BOOL, id))v13)[2](v13, v44, v68[5]);
      }
LABEL_44:

      _Block_object_dispose(&v67, 8);
      _Block_object_dispose(&buf, 8);

      _Block_object_dispose(&v73, 8);
      goto LABEL_45;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      id v46 = v68[5];
      int v79 = 138412290;
      v80[0] = v46;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "GraphLiveUpdate - rebuild failed with error %@", (uint8_t *)&v79, 0xCu);
      if (!v13) {
        goto LABEL_44;
      }
    }
    else if (!v13)
    {
      goto LABEL_44;
    }
    BOOL v44 = 0;
    goto LABEL_43;
  }
  LOBYTE(v67) = 0;
  ((void (**)(void *, uint64_t *, double))v14)[2](v14, &v67, 0.0);
  if (!(_BYTE)v67)
  {
    double v15 = Current;
    goto LABEL_7;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t buf = 0x38104000202;
    LOWORD(v82) = 2080;
    *(void *)((char *)&v82 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Core/PGGraphUpdateManager.m";
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_45:
}

void __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v7 = [a2 graph];
  v3 = [v7 infoNode];
  uint64_t v4 = [v3 creationDate];
  uint64_t v5 = *(void *)(a1 + 32);
  dispatch_block_t v6 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v4;
}

uint64_t __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_3(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(void, double))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(double *)(a1 + 40) * a2);
}

void __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_4(uint64_t a1, int a2, void *a3, void *a4)
{
  id v9 = a3;
  id v8 = a4;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a4);
  if (a2) {
    [*(id *)(a1 + 32) _recordNumberOfDaysSinceMajorOSUpgradeIfNeeded];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __126__PGGraphUpdateManager__triggerFullRebuildDuringLiveUpdate_graphIngestRecipe_progressBlock_keepExistingGraph_completionBlock___block_invoke_299(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(void *)(a1 + 32) + 16))(a2 * 0.5 + 0.5);
}

- (void)_onFinishedProcessingChangesWithTokens:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_processingQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__PGGraphUpdateManager__onFinishedProcessingChangesWithTokens___block_invoke;
  v7[3] = &unk_1E68EED30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __63__PGGraphUpdateManager__onFinishedProcessingChangesWithTokens___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = *(unsigned char **)(a1 + 32);
  if (v2[9])
  {
    [v2 _onStopRequestedWasListening:1];
  }
  else
  {
    v3 = [v2 libraryChangeListener];
    [v3 consumer:*(void *)(a1 + 32) didConsumeChangeTokens:*(void *)(a1 + 40)];

    [*(id *)(a1 + 32) _signalGraphIsConsistentWithTokens:*(void *)(a1 + 40)];
    switch([*(id *)(a1 + 32) processingState])
    {
      case 0u:
      case 1u:
      case 4u:
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          id v11 = *(void **)(a1 + 32);
          int v12 = 138412290;
          id v13 = v11;
          _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - unexpected state, please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)&v12, 0xCu);
        }
        break;
      case 2u:
        uint64_t v5 = [*(id *)(a1 + 32) pendingChanges];
        uint64_t v6 = [v5 count];

        BOOL v7 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
        if (v6)
        {
          if (v7)
          {
            id v8 = NSNumber;
            id v9 = [*(id *)(a1 + 32) pendingChanges];
            uint64_t v10 = objc_msgSend(v8, "numberWithUnsignedInteger:", objc_msgSend(v9, "count"));
            int v12 = 138412290;
            id v13 = v10;
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - Manager done processing changes but will remain in busy state to process the following additional changes: %@", (uint8_t *)&v12, 0xCu);
          }
          [*(id *)(a1 + 32) _processPendingChanges];
        }
        else
        {
          if (v7)
          {
            LOWORD(v12) = 0;
            _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - Manager done processing changes and there are no additional pending changes, to idle state", (uint8_t *)&v12, 2u);
          }
          [*(id *)(a1 + 32) setProcessingState:1];
        }
        break;
      case 3u:
        id v4 = *(void **)(a1 + 32);
        [v4 _processRebuild];
        break;
      default:
        return;
    }
  }
}

- (void)_processRebuild
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  BOOL v3 = [(PGGraphUpdateManager *)self _pauseListening];
  [(PGGraphUpdateManager *)self setProcessingState:4];
  objc_initWeak(&location, self);
  processingQueue = self->_processingQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__PGGraphUpdateManager__processRebuild__block_invoke;
  v5[3] = &unk_1E68E70F8;
  objc_copyWeak(&v6, &location);
  v5[4] = self;
  BOOL v7 = v3;
  dispatch_async(processingQueue, v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __39__PGGraphUpdateManager__processRebuild__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    BOOL v3 = [PGGraphIngestRecipe alloc];
    id v4 = [*(id *)(a1 + 32) manager];
    uint64_t v5 = [v4 photoLibrary];
    id v6 = [(PGGraphIngestRecipe *)v3 initWithPhotoLibrary:v5];

    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __39__PGGraphUpdateManager__processRebuild__block_invoke_2;
    v9[3] = &unk_1E68E7080;
    v9[4] = *(void *)(a1 + 32);
    v9[5] = WeakRetained;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __39__PGGraphUpdateManager__processRebuild__block_invoke_3;
    v7[3] = &unk_1E68E70D0;
    v7[4] = WeakRetained;
    char v8 = *(unsigned char *)(a1 + 48);
    [WeakRetained _triggerFullRebuildDuringLiveUpdate:1 graphIngestRecipe:v6 progressBlock:v9 keepExistingGraph:1 completionBlock:v7];
  }
}

uint64_t __39__PGGraphUpdateManager__processRebuild__block_invoke_2(uint64_t a1, unsigned char *a2, double a3)
{
  uint64_t result = [*(id *)(a1 + 32) stopRequested];
  *a2 = result;
  if ((result & 1) == 0)
  {
    BOOL v7 = *(void **)(a1 + 40);
    return [v7 _notifyProgress:a3];
  }
  return result;
}

void __39__PGGraphUpdateManager__processRebuild__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  BOOL v7 = *(NSObject **)(v6 + 40);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__PGGraphUpdateManager__processRebuild__block_invoke_4;
  block[3] = &unk_1E68E70A8;
  char v12 = a2;
  id v10 = v5;
  uint64_t v11 = v6;
  char v13 = *(unsigned char *)(a1 + 40);
  id v8 = v5;
  dispatch_sync(v7, block);
}

unsigned char *__39__PGGraphUpdateManager__processRebuild__block_invoke_4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (!*(unsigned char *)(a1 + 48))
  {
    if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)
      || (uint64_t v3 = *(void *)(a1 + 32),
          int v4 = 138412290,
          uint64_t v5 = v3,
          _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "GraphLiveUpdate - _processRebuild failed with error %@", (uint8_t *)&v4, 0xCu), !*(unsigned char *)(a1 + 48)))
    {
      uint64_t result = *(unsigned char **)(a1 + 40);
      return (unsigned char *)[result _onStopRequestedWasListening:0];
    }
  }
  uint64_t result = *(unsigned char **)(a1 + 40);
  if (result[9]) {
    return (unsigned char *)[result _onStopRequestedWasListening:0];
  }
  if (*(unsigned char *)(a1 + 49)) {
    return (unsigned char *)[result _startListening];
  }
  return result;
}

- (id)_tokensForChanges:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    id v10 = MEMORY[0x1E4F14500];
    *(void *)&long long v7 = 138412290;
    long long v15 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        char v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        char v13 = objc_msgSend(v12, "changeToken", v15, (void)v16);
        if (v13)
        {
          [v4 addObject:v13];
        }
        else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = v15;
          BOOL v21 = v12;
          _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "GraphLiveUpdate - No token for change: %@", buf, 0xCu);
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  return v4;
}

- (void)_processPendingChanges
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if ([(NSMutableArray *)self->_pendingChanges count])
  {
    id v3 = (void *)[(NSMutableArray *)self->_pendingChanges copy];
    [(NSMutableArray *)self->_pendingChanges removeAllObjects];
    [(PGGraphUpdateManager *)self setProcessingState:2];
    objc_initWeak(&location, self);
    processingQueue = self->_processingQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __46__PGGraphUpdateManager__processPendingChanges__block_invoke;
    v6[3] = &unk_1E68E7058;
    objc_copyWeak(&v9, &location);
    id v7 = v3;
    uint64_t v8 = self;
    id v5 = v3;
    dispatch_async(processingQueue, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __46__PGGraphUpdateManager__processPendingChanges__block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    if ([WeakRetained stopRequested])
    {
      int v4 = [v3 stateQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__PGGraphUpdateManager__processPendingChanges__block_invoke_2;
      block[3] = &unk_1E68F0B18;
      void block[4] = v3;
      dispatch_sync(v4, block);
    }
    else
    {
      int v4 = [v3 _graphUpdateForPhotoChanges:*(void *)(a1 + 32)];
      if ([v4 hasAnythingToDo])
      {
        id v5 = [*(id *)(a1 + 40) manager];
        uint64_t v6 = [v5 graphLoggingConnection];

        os_signpost_id_t v7 = os_signpost_id_generate(v6);
        uint64_t v8 = v6;
        id v9 = v8;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PerformUpdate", "", buf, 2u);
        }

        mach_timebase_info v17 = 0;
        mach_timebase_info(&v17);
        uint64_t v10 = mach_absolute_time();
        [v3 _triggerUpdateForGraphUpdate:v4];
        uint64_t v11 = mach_absolute_time();
        mach_timebase_info v12 = v17;
        char v13 = v9;
        uint64_t v14 = v13;
        if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
        {
          *(_WORD *)uint64_t buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1D1805000, v14, OS_SIGNPOST_INTERVAL_END, v7, "PerformUpdate", "", buf, 2u);
        }

        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)uint64_t buf = 136315394;
          id v20 = "PerformUpdate";
          __int16 v21 = 2048;
          double v22 = (float)((float)((float)((float)(v11 - v10) * (float)v12.numer) / (float)v12.denom) / 1000000.0);
          _os_log_impl(&dword_1D1805000, v14, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
      }
      long long v15 = [*(id *)(a1 + 40) _tokensForChanges:*(void *)(a1 + 32)];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        long long v16 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)uint64_t buf = 138412546;
        id v20 = v16;
        __int16 v21 = 2112;
        double v22 = *(double *)&v15;
        _os_log_debug_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG, "GraphLiveUpdate - UpdateManager consumed %@ tokens: %@", buf, 0x16u);
      }
      [v3 _onFinishedProcessingChangesWithTokens:v15];
    }
  }
}

uint64_t __46__PGGraphUpdateManager__processPendingChanges__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _onStopRequestedWasListening:1];
}

- (BOOL)isConsistencyUpdate
{
  return (unint64_t)(self->_executionContext - 1) < 2;
}

- (BOOL)_pauseListening
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v8 = 0;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - Stop Listening", v8, 2u);
  }
  BOOL listening = self->_listening;
  int v4 = [(PGGraphUpdateManager *)self libraryChangeListener];
  [v4 stopListening];

  id v5 = [(PGGraphUpdateManager *)self libraryChangeListener];
  [v5 unregisterChangeConsumer:self];

  uint64_t v6 = [(PGGraphUpdateManager *)self pendingChanges];
  [v6 removeAllObjects];

  [(PGGraphUpdateManager *)self setListening:0];
  return listening;
}

- (BOOL)_startListening
{
  v19[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v18 = 0;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - Start Listening", v18, 2u);
  }
  [(PGGraphUpdateManager *)self setProcessingState:1];
  [(PGGraphUpdateManager *)self setListening:1];
  id v3 = [PGGraphUpdateManagerTargetTokenState alloc];
  int v4 = [(PGGraphUpdateManager *)self manager];
  id v5 = [v4 photoLibrary];
  uint64_t v6 = [v5 currentToken];
  os_signpost_id_t v7 = [(PGGraphUpdateManagerTargetTokenState *)v3 initWithPersistentChangeToken:v6];
  [(PGGraphUpdateManager *)self setTargetTokenState:v7];

  uint64_t v8 = [(PGGraphUpdateManager *)self manager];
  char v9 = [v8 isReady];

  if (v9)
  {
    uint64_t v10 = [(PGGraphUpdateManager *)self jetsamIndicator];
    char v11 = [v10 updateDidCauseJetsam];

    if (v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v18 = 0;
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - did detect update jetsam, will rebuild graph", v18, 2u);
      }
      [(PGGraphUpdateManager *)self _processRebuild];
    }
    else
    {
      [(PGGraphUpdateHealthRecording *)self->_updateHealthRecorder beginRecording];
      mach_timebase_info v12 = [(PGGraphUpdateManager *)self libraryChangeListener];
      char v13 = [v12 currentToken];

      if (v13)
      {
        v19[0] = v13;
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
      }
      else
      {
        uint64_t v14 = (void *)MEMORY[0x1E4F1CBF0];
      }
      [(PGGraphUpdateManager *)self _signalGraphIsConsistentWithTokens:v14];
      long long v15 = [(PGGraphUpdateManager *)self libraryChangeListener];
      [v15 registerChangeConsumer:self];

      long long v16 = [(PGGraphUpdateManager *)self libraryChangeListener];
      [v16 startListening];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v18 = 0;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - starting but graph is not ready", v18, 2u);
  }
  return v9;
}

- (void)_notifyProgress:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v15 = 0;
  long long v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy__20120;
  long long v19 = __Block_byref_object_dispose__20121;
  id v20 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__PGGraphUpdateManager__notifyProgress___block_invoke;
  block[3] = &unk_1E68F0BB8;
  void block[4] = self;
  void block[5] = &v15;
  dispatch_sync(stateQueue, block);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = (id)v16[5];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "graphUpdateMadeProgress:", a3, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v21 count:16];
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

void __40__PGGraphUpdateManager__notifyProgress___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) listeners];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_notifyListeners:(id)a3 notificationType:(unsigned __int8)a4
{
  stateQueue = self->_stateQueue;
  id v6 = a3;
  dispatch_assert_queue_V2(stateQueue);
  uint64_t v7 = (void *)[v6 copy];

  uint64_t v8 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PGGraphUpdateManager__notifyListeners_notificationType___block_invoke;
  v10[3] = &unk_1E68E7030;
  id v11 = v7;
  unsigned __int8 v12 = a4;
  id v9 = v7;
  dispatch_async(v8, v10);
}

void __58__PGGraphUpdateManager__notifyListeners_notificationType___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (*(unsigned char *)(a1 + 40) == 1)
        {
          objc_msgSend(v7, "graphUpdateIsConsistent", (void)v8);
        }
        else if (!*(unsigned char *)(a1 + 40))
        {
          [v7 graphUpdateDidStop];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_onEncounteredTargetToken
{
  uint64_t v3 = [(PGGraphUpdateManager *)self targetTokenState];
  [v3 setEncounteredTargetToken:1];

  id v4 = [(PGGraphUpdateManager *)self listeners];
  [(PGGraphUpdateManager *)self _notifyListeners:v4 notificationType:1];
}

- (void)_signalGraphIsConsistentWithTokens:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if ([v4 count])
  {
    uint64_t v5 = [(PGGraphUpdateManager *)self targetTokenState];
    id v6 = [v5 changeToken];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      while (2)
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11), "isEqual:", v6, (void)v12))
          {

            [(PGGraphUpdateManager *)self _onEncounteredTargetToken];
            goto LABEL_12;
          }
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }

LABEL_12:
  }
}

- (void)_onStopRequestedWasListening:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (v3) {
    [(PGGraphUpdateManager *)self _pauseListening];
  }
  [(PGGraphUpdateManager *)self setProcessingState:0];
  [(PGGraphUpdateManager *)self setStopRequested:0];
  [(PGGraphUpdateManager *)self setTargetTokenState:0];
  uint64_t v5 = [(PGGraphUpdateManager *)self listeners];
  [(PGGraphUpdateManager *)self _notifyListeners:v5 notificationType:0];

  updateHealthRecorder = self->_updateHealthRecorder;
  BOOL v7 = [(PGGraphUpdateManager *)self isConsistencyUpdate];
  [(PGGraphUpdateHealthRecording *)updateHealthRecorder endRecordingInBackground:v7];
}

- (void)setProcessingState:(unsigned __int8)a3
{
  uint64_t v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (self->_processingState != v3)
  {
    switch(self->_processingState)
    {
      case 0u:
        if ((v3 & 0xFE) == 2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          uint64_t v5 = [NSNumber numberWithUnsignedChar:0];
          id v6 = [NSNumber numberWithUnsignedChar:v3];
          int v8 = 138412802;
          uint64_t v9 = v5;
          __int16 v10 = 2112;
          uint64_t v11 = v6;
          __int16 v12 = 2112;
          long long v13 = self;
          BOOL v7 = MEMORY[0x1E4F14500];
          goto LABEL_28;
        }
        goto LABEL_22;
      case 1u:
        if (v3 != 3)
        {
          if (v3 != 2) {
            goto LABEL_19;
          }
          uint64_t v5 = [(PGGraphUpdateManager *)self jetsamIndicator];
          [v5 markUpdate];
          goto LABEL_21;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          uint64_t v5 = [NSNumber numberWithUnsignedChar:1];
          id v6 = [NSNumber numberWithUnsignedChar:3];
          int v8 = 138412802;
          uint64_t v9 = v5;
          __int16 v10 = 2112;
          uint64_t v11 = v6;
          __int16 v12 = 2112;
          long long v13 = self;
          BOOL v7 = MEMORY[0x1E4F14500];
          goto LABEL_28;
        }
        goto LABEL_22;
      case 2u:
        if (v3 < 2) {
          goto LABEL_20;
        }
        if (v3 == 4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          uint64_t v5 = [NSNumber numberWithUnsignedChar:2];
          id v6 = [NSNumber numberWithUnsignedChar:4];
          int v8 = 138412802;
          uint64_t v9 = v5;
          __int16 v10 = 2112;
          uint64_t v11 = v6;
          __int16 v12 = 2112;
          long long v13 = self;
          BOOL v7 = MEMORY[0x1E4F14500];
          goto LABEL_28;
        }
        goto LABEL_22;
      case 3u:
        if ((v3 - 1) >= 2)
        {
LABEL_19:
          if (!v3) {
            goto LABEL_20;
          }
        }
        else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          uint64_t v5 = [NSNumber numberWithUnsignedChar:3];
          id v6 = [NSNumber numberWithUnsignedChar:v3];
          int v8 = 138412802;
          uint64_t v9 = v5;
          __int16 v10 = 2112;
          uint64_t v11 = v6;
          __int16 v12 = 2112;
          long long v13 = self;
          BOOL v7 = MEMORY[0x1E4F14500];
          goto LABEL_28;
        }
        goto LABEL_22;
      case 4u:
        if ((v3 - 2) < 2)
        {
          if (!os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
            goto LABEL_22;
          }
          uint64_t v5 = [NSNumber numberWithUnsignedChar:4];
          id v6 = [NSNumber numberWithUnsignedChar:v3];
          int v8 = 138412802;
          uint64_t v9 = v5;
          __int16 v10 = 2112;
          uint64_t v11 = v6;
          __int16 v12 = 2112;
          long long v13 = self;
          BOOL v7 = MEMORY[0x1E4F14500];
LABEL_28:
          _os_log_fault_impl(&dword_1D1805000, v7, OS_LOG_TYPE_FAULT, "GraphLiveUpdate - unexpected state transition (%@ - %@), please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)&v8, 0x20u);
        }
        else
        {
          if (v3 > 1) {
            goto LABEL_22;
          }
LABEL_20:
          uint64_t v5 = [(PGGraphUpdateManager *)self jetsamIndicator];
          [v5 clear];
        }
LABEL_21:

LABEL_22:
        self->_processingState = v3;
        return;
      default:
        goto LABEL_22;
    }
  }
}

- (void)_performRebuildWithGraphIngestRecipe:(id)a3 progressBlock:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  stateQueue = self->_stateQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke;
  v15[3] = &unk_1E68E7008;
  v15[4] = self;
  id v16 = v8;
  id v17 = v10;
  id v18 = v9;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_sync(stateQueue, v15);
}

void __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke(id *a1)
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  if ([a1[4] processingState])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      id v5 = a1[4];
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v5;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - received performFullRebuildWithProgressBlock when not stopped, this is not expected, please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)location, 0xCu);
    }
    id v2 = (void (**)(id, void, void *))a1[6];
    if (v2)
    {
      uint64_t v3 = +[PGError errorForCode:-1];
      v2[2](v2, 0, v3);
    }
  }
  else
  {
    [a1[4] setProcessingState:4];
    objc_initWeak(location, a1[4]);
    id v4 = *((void *)a1[4] + 4);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_285;
    v6[3] = &unk_1E68E6FE0;
    objc_copyWeak(&v10, location);
    id v8 = a1[6];
    id v7 = a1[5];
    id v9 = a1[7];
    dispatch_async(v4, v6);

    objc_destroyWeak(&v10);
    objc_destroyWeak(location);
  }
}

void __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_285(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  uint64_t v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_2;
    v8[3] = &unk_1E68E6FB8;
    v8[4] = WeakRetained;
    uint64_t v5 = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    [v3 _triggerFullRebuildDuringLiveUpdate:0 graphIngestRecipe:v5 progressBlock:v4 keepExistingGraph:1 completionBlock:v8];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      id v7 = +[PGError errorForCode:-1];
      (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
    }
  }
}

void __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) stateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_3;
  block[3] = &unk_1E68F0B18;
  void block[4] = *(void *)(a1 + 32);
  dispatch_sync(v6, block);

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

uint64_t __91__PGGraphUpdateManager__performRebuildWithGraphIngestRecipe_progressBlock_completionBlock___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProcessingState:0];
}

- (void)performFullRebuildWithProgressBlock:(id)a3 completionBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [PGGraphIngestRecipe alloc];
  id v9 = [(PGGraphUpdateManager *)self manager];
  id v10 = [v9 photoLibrary];
  uint64_t v11 = [(PGGraphIngestRecipe *)v8 initWithPhotoLibrary:v10];

  [(PGGraphUpdateManager *)self _performRebuildWithGraphIngestRecipe:v11 progressBlock:v7 completionBlock:v6];
}

- (void)incrementalChangeNotAvailable
{
  objc_initWeak(&location, self);
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__PGGraphUpdateManager_incrementalChangeNotAvailable__block_invoke;
  v4[3] = &unk_1E68E6F90;
  objc_copyWeak(&v5, &location);
  dispatch_async(stateQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__PGGraphUpdateManager_incrementalChangeNotAvailable__block_invoke(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    int v3 = 138412290;
    uint64_t v4 = WeakRetained;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - incrementalChangeNotAvailable, rebuild will be initiated by UpdateManager (%@)", (uint8_t *)&v3, 0xCu);
  }
  if (WeakRetained && WeakRetained[10])
  {
    int v2 = [WeakRetained processingState];
    if (v2)
    {
      if (v2 == 2)
      {
        [WeakRetained setProcessingState:3];
      }
      else if (v2 == 1)
      {
        [WeakRetained _processRebuild];
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
    {
      int v3 = 138412290;
      uint64_t v4 = WeakRetained;
      _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - received incrementalChangeNotAvailable when stopped, this is not expected, please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)libraryChangesAvailable:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__PGGraphUpdateManager_libraryChangesAvailable___block_invoke;
  block[3] = &unk_1E68E6F68;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__PGGraphUpdateManager_libraryChangesAvailable___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    int v4 = WeakRetained[10];
    uint64_t v5 = [WeakRetained manager];
    uint64_t v6 = [v5 isReady];

    if (v4 && (v6 & 1) != 0)
    {
      id v7 = [v3 pendingChanges];
      [v7 addObjectsFromArray:*(void *)(a1 + 32)];

      int v8 = [v3 processingState];
      if (!v8 || v8 == 4)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
        {
          int v15 = 138412290;
          id v16 = v3;
          _os_log_fault_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "GraphLiveUpdate - unexpected libraryChangesAvailable call, please file a radar against 'Photos Knowledge Graph | all' - GraphUpdateManager: %@", (uint8_t *)&v15, 0xCu);
        }
      }
      else if (v8 == 1)
      {
        [v3 _processPendingChanges];
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        BOOL v9 = v4 != 0;
        objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
        id v10 = (unsigned __int8 *)objc_claimAutoreleasedReturnValue();
        uint64_t v11 = [NSNumber numberWithBool:v9];
        id v12 = [NSNumber numberWithBool:v6];
        int v15 = 138412802;
        id v16 = v10;
        __int16 v17 = 2112;
        id v18 = v11;
        __int16 v19 = 2112;
        id v20 = v12;
        _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - ignoring %@ changes because of state - listening: %@, graphIsReady: %@", (uint8_t *)&v15, 0x20u);
      }
      if ([*(id *)(a1 + 32) count])
      {
        id v13 = [v3 _tokensForChanges:*(void *)(a1 + 32)];
        id v14 = [v3 libraryChangeListener];
        [v14 consumer:v3 didIgnoreChangeTokens:v13];
      }
    }
  }
}

- (void)removeListener:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__PGGraphUpdateManager_removeListener___block_invoke;
  v7[3] = &unk_1E68EED30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __39__PGGraphUpdateManager_removeListener___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) listeners];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)addListener:(id)a3
{
  id v4 = a3;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PGGraphUpdateManager_addListener___block_invoke;
  v7[3] = &unk_1E68EED30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __36__PGGraphUpdateManager_addListener___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) listeners];
  [v2 addObject:*(void *)(a1 + 40)];

  int v3 = [*(id *)(a1 + 32) targetTokenState];
  int v4 = [v3 encounteredTargetToken];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    id v6 = [MEMORY[0x1E4F1CAD0] setWithObject:*(void *)(a1 + 40)];
    [v5 _notifyListeners:v6 notificationType:1];
  }
}

- (void)stopListening
{
  if (!+[PGUserDefaults suppressGraphLiveUpdate])
  {
    objc_initWeak(&location, self);
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__PGGraphUpdateManager_stopListening__block_invoke;
    block[3] = &unk_1E68E6F68;
    objc_copyWeak(&v5, &location);
    void block[4] = self;
    dispatch_sync(stateQueue, block);
    dispatch_sync((dispatch_queue_t)self->_processingQueue, &__block_literal_global_20172);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);
  }
}

void __37__PGGraphUpdateManager_stopListening__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    int v3 = [WeakRetained processingState];
    if ((v3 - 2) < 3)
    {
      [v5 setStopRequested:1];
LABEL_7:
      id WeakRetained = v5;
      goto LABEL_8;
    }
    BOOL v4 = v3 == 1;
    id WeakRetained = v5;
    if (v4)
    {
      [*(id *)(a1 + 32) _onStopRequestedWasListening:1];
      goto LABEL_7;
    }
  }
LABEL_8:
}

- (BOOL)startListening
{
  if (+[PGUserDefaults suppressGraphLiveUpdate]) {
    return 0;
  }
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__PGGraphUpdateManager_startListening__block_invoke;
  v6[3] = &unk_1E68F0BB8;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  BOOL v3 = *((unsigned char *)v8 + 24) != 0;
  _Block_object_dispose(&v7, 8);
  return v3;
}

void __38__PGGraphUpdateManager_startListening__block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) processingState];
  if ((v2 - 1) >= 4)
  {
    if (!v2) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [*(id *)(a1 + 32) _startListening];
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "GraphLiveUpdate - attempt to start an already running GraphUpdateManager: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (BOOL)stopRequested
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__PGGraphUpdateManager_stopRequested__block_invoke;
  v5[3] = &unk_1E68F0BB8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__PGGraphUpdateManager_stopRequested__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 9);
  return result;
}

- (void)setStopRequested:(BOOL)a3
{
  self->_stopRequested = a3;
}

- (BOOL)isListening
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __35__PGGraphUpdateManager_isListening__block_invoke;
  v5[3] = &unk_1E68F0BB8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__PGGraphUpdateManager_isListening__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 10);
  return result;
}

- (void)setListening:(BOOL)a3
{
  self->_BOOL listening = a3;
}

- (NSString)description
{
  char v3 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)PGGraphUpdateManager;
  int v4 = [(PGGraphUpdateManager *)&v17 description];
  unsigned int v5 = [(PGGraphUpdateManager *)self processingState];
  if (v5 > 4) {
    uint64_t v6 = @"Unknown Processing State";
  }
  else {
    uint64_t v6 = off_1E68E7190[v5];
  }
  uint64_t v7 = [NSNumber numberWithBool:self->_stopRequested];
  uint64_t v8 = [NSNumber numberWithBool:self->_listening];
  char v9 = NSNumber;
  char v10 = [(PGGraphUpdateManager *)self pendingChanges];
  uint64_t v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  id v12 = [(PGGraphUpdateManager *)self targetTokenState];
  unint64_t v13 = [(PGGraphUpdateManager *)self executionContext];
  if (v13 > 2) {
    id v14 = @"Unknown Execution Context";
  }
  else {
    id v14 = off_1E68E71B8[v13];
  }
  int v15 = [v3 stringWithFormat:@"%@ - processing state: %@, stopRequested: %@, listening: %@, number of pending changes: %@, target token state: %@, execution context: %@", v4, v6, v7, v8, v11, v12, v14];

  return (NSString *)v15;
}

- (PGGraphUpdateManager)initWithGraphManager:(id)a3
{
  id v5 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PGGraphUpdateManager;
  uint64_t v6 = [(PGGraphUpdateManager *)&v36 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_manager, a3);
    uint64_t v8 = [PGLibraryChangeListener alloc];
    char v9 = [v5 photoLibrary];
    char v10 = [v5 analytics];
    uint64_t v11 = [(PGLibraryChangeListener *)v8 initWithPhotoLibrary:v9 clientIdentifier:@"PGGraphUpdateManager" analytics:v10];
    libraryChangeListener = v7->_libraryChangeListener;
    v7->_libraryChangeListener = (PGLibraryChangeListener *)v11;

    unint64_t v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v14 = dispatch_queue_attr_make_initially_inactive(v13);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.photoanalysis.graph.updatemanager.livechange", v14);
    processingQueue = v7->_processingQueue;
    v7->_processingQueue = (OS_dispatch_queue *)v15;

    dispatch_set_qos_class_floor((dispatch_object_t)v7->_processingQueue, QOS_CLASS_UTILITY, 0);
    dispatch_activate((dispatch_object_t)v7->_processingQueue);
    dispatch_queue_t v17 = dispatch_queue_create("com.apple.photoanalysis.graph.updatemanager.state", v14);
    stateQueue = v7->_stateQueue;
    v7->_stateQueue = (OS_dispatch_queue *)v17;

    dispatch_set_qos_class_floor((dispatch_object_t)v7->_stateQueue, QOS_CLASS_UTILITY, 0);
    dispatch_activate((dispatch_object_t)v7->_stateQueue);
    __int16 v19 = [PGPhotoChangeToGraphChangeConverter alloc];
    id v20 = [(PGManager *)v7->_manager photoLibrary];
    uint64_t v21 = [v5 graphLoggingConnection];
    uint64_t v22 = [(PGPhotoChangeToGraphChangeConverter *)v19 initWithPhotoLibrary:v20 loggingConnection:v21];
    changeConverter = v7->_changeConverter;
    v7->_changeConverter = (PGPhotoChangeToGraphChangeConverter *)v22;

    v7->_stopRequested = 0;
    uint64_t v24 = [MEMORY[0x1E4F1CA48] array];
    pendingChanges = v7->_pendingChanges;
    v7->_pendingChanges = (NSMutableArray *)v24;

    v7->_processingState = 0;
    dispatch_block_t v26 = [PGGraphUpdateJetsamIndicator alloc];
    id v27 = [v5 photoLibrary];
    uint64_t v28 = [(PGGraphUpdateJetsamIndicator *)v26 initWithPhotoLibrary:v27];
    jetsamIndicator = v7->_jetsamIndicator;
    v7->_jetsamIndicator = (PGGraphUpdateJetsamIndicator *)v28;

    uint64_t v30 = [MEMORY[0x1E4F1CA80] set];
    listeners = v7->_listeners;
    v7->_listeners = (NSMutableSet *)v30;

    id v32 = [v5 analytics];
    uint64_t v33 = +[PGGraphHealthRecordingFactory graphUpdateHealthRecorderForChangeConsumer:1 analytics:v32];
    updateHealthRecorder = v7->_updateHealthRecorder;
    v7->_updateHealthRecorder = (PGGraphUpdateHealthRecording *)v33;
  }
  return v7;
}

@end