@interface PLFetchRecorder
+ (BOOL)_isRecordingFileFromURL:(id)a3;
+ (BOOL)isCurrentProcessEnabledForRecordingBundle:(id)a3;
+ (PLFetchRecorderSQLGeneralizationResult)_generalizedStringByFactoringOutInClausesFromSQL:(id)a3;
+ (PLFetchRecorderSQLGeneralizationResult)generalizedSQLFromSQL:(id)a3 bindVariables:(id)a4 fromFetchRequest:(id)a5;
+ (id)_findRecordingsWithinURL:(id)a3;
+ (id)_generalizedStringByFactoringOutLimitClauseFrom:(id)a3;
+ (id)_paramStringFromBindVariableComponent:(id)a3;
+ (id)fileURLsToExistingRecordings;
+ (id)sqlFromGeneralizedSQL:(id)a3 bindVars:(id)a4 multiInCounts:(id)a5 error:(id *)a6;
- (PLFetchRecorder)init;
- (void)_startRecording;
- (void)_startWatchingRecordingFile;
- (void)_stopRecording;
- (void)_stopWatchingRecordingFile;
- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7;
- (void)managedObjectContext:(id)a3 willExecuteFetchRequest:(id)a4;
@end

@implementation PLFetchRecorder

+ (BOOL)isCurrentProcessEnabledForRecordingBundle:(id)a3
{
  id v3 = a3;
  if (MEMORY[0x19F38BDA0]()
    && ((PLIsAssetsd() & 1) != 0
     || (PLIsPTPD() & 1) != 0
     || (PLIsPhotosAppAnyPlatform() & 1) != 0
     || (PLIsInternalTool() & 1) != 0
     || (PLIsPhotoPicker() & 1) != 0
     || (PLIsPhotosMessagesApp() & 1) != 0
     || (PLIsMediaanalysisd() & 1) != 0
     || PLIsPhotoanalysisd())
    && [v3 isSystemPhotoLibrary])
  {
    v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    v5 = [v4 objectForKey:@"com.apple.photos.lofr.enabled" inDomain:*MEMORY[0x1E4F283E0]];

    if (v5)
    {
      char v6 = [v5 BOOLValue];
    }
    else
    {
      if (isCurrentProcessEnabledForRecordingBundle__onceToken != -1) {
        dispatch_once(&isCurrentProcessEnabledForRecordingBundle__onceToken, &__block_literal_global_69_116575);
      }
      char v6 = isCurrentProcessEnabledForRecordingBundle__launchedForTesting == 0;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileWatcherSource, 0);
  objc_storeStrong((id *)&self->_fileWatcherQueue, 0);
  objc_storeStrong((id *)&self->_recording, 0);
}

- (PLFetchRecorder)init
{
  v9.receiver = self;
  v9.super_class = (Class)PLFetchRecorder;
  v2 = [(PLFetchRecorder *)&v9 init];
  id v3 = v2;
  if (v2)
  {
    v2->_stateLock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_BACKGROUND, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.photos.lofr.filewatcher", v5);
    fileWatcherQueue = v3->_fileWatcherQueue;
    v3->_fileWatcherQueue = (OS_dispatch_queue *)v6;
  }
  return v3;
}

- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7
{
  unsigned int v39 = a7;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [v11 userInfo];
  uint64_t v16 = [v15 objectForKeyedSubscript:@"lofr_preStats"];

  v17 = [v11 userInfo];
  v18 = [v17 objectForKeyedSubscript:@"lofr_statementStartTime"];

  v35 = v18;
  [v18 doubleValue];
  double v20 = v19;
  v21 = [v11 databaseStatistics];
  v36 = (void *)v16;
  v22 = [v21 databaseStatisticsBySubtracting:v16];

  v23 = [MEMORY[0x1E4F28E78] string];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __100__PLFetchRecorder_managedObjectContext_didExecuteFetchRequest_withSQLString_bindVariables_rowCount___block_invoke;
  v40[3] = &unk_1E5875F30;
  id v24 = v23;
  id v41 = v24;
  id v25 = v14;
  id v42 = v25;
  [v25 enumerateObjectsUsingBlock:v40];
  if ([v12 fetchLimit])
  {
    if ([v24 length]) {
      [v24 appendString:@", "];
    }
    objc_msgSend(v24, "appendFormat:", @"%lu", objc_msgSend(v12, "fetchLimit"));
  }
  v37 = v13;
  v38 = v12;
  v26 = (void *)[(id)objc_opt_class() generalizedSQLFromSQL:v13 bindVariables:v25 fromFetchRequest:v12];
  v28 = v27;
  [(PLFetchRecorder *)self _startRecording];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  v30 = self->_recording;
  os_unfair_lock_unlock(p_stateLock);
  v31 = [v11 description];
  uint64_t v32 = [v22 cacheHitPages];
  uint64_t v33 = [v22 cacheMissPages];
  double Current = CFAbsoluteTimeGetCurrent();
  -[PLFetchRecording recordStatementWithNormalizedSQL:bindVariablesAsString:multiInCounts:contextName:pagesHit:pagesMissed:rowCount:duration:QOS:](v30, "recordStatementWithNormalizedSQL:bindVariablesAsString:multiInCounts:contextName:pagesHit:pagesMissed:rowCount:duration:QOS:", v26, v24, v28, v31, v32, v33, Current - v20, __PAIR64__(qos_class_self(), v39));
}

void __100__PLFetchRecorder_managedObjectContext_didExecuteFetchRequest_withSQLString_bindVariables_rowCount___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v6 = [a2 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 timeIntervalSinceReferenceDate];
    objc_msgSend(*(id *)(a1 + 32), "appendFormat:", @"%f", v5);
  }
  else
  {
    [*(id *)(a1 + 32) appendFormat:@"%@", v6];
  }
  if ((unint64_t)[*(id *)(a1 + 40) count] >= 2
    && [*(id *)(a1 + 40) count] - 1 > a3)
  {
    [*(id *)(a1 + 32) appendString:@", "];
  }
}

- (void)managedObjectContext:(id)a3 willExecuteFetchRequest:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 databaseStatistics];
  id v6 = [v4 userInfo];
  [v6 setObject:v5 forKeyedSubscript:@"lofr_preStats"];

  id v8 = [NSNumber numberWithDouble:CFAbsoluteTimeGetCurrent()];
  v7 = [v4 userInfo];

  [v7 setObject:v8 forKeyedSubscript:@"lofr_statementStartTime"];
}

- (void)_startRecording
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_recording)
  {
LABEL_12:
    os_unfair_lock_unlock(p_stateLock);
    return;
  }
  id v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "LOFR Starting recording...", buf, 2u);
  }

  uint64_t v5 = NSTemporaryDirectory();
  id v6 = [v5 stringByAppendingPathComponent:@"lofr"];

  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  if ([v7 fileExistsAtPath:v6])
  {
LABEL_7:
    id v11 = +[PLFetchRecording suggestedFilenameForCurrentProcess];
    id v12 = [v6 stringByAppendingPathComponent:v11];

    id v13 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
    id v14 = [[PLFetchRecording alloc] initWithMode:1 atFileURL:v13 size:3145728];
    recording = self->_recording;
    self->_recording = v14;

    if (self->_recording)
    {
      uint64_t v16 = PLBackendGetLog();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        double v20 = v12;
        _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "LOFR Started recording to path: %@", buf, 0xCu);
      }

      [(PLFetchRecorder *)self _startWatchingRecordingFile];
    }

    goto LABEL_12;
  }
  id v18 = 0;
  char v8 = [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:&v18];
  id v9 = v18;
  v10 = v9;
  if (v8)
  {

    goto LABEL_7;
  }
  v17 = PLBackendGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    double v20 = v6;
    __int16 v21 = 2112;
    v22 = v10;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "LOFR Can't create dir: %@, error: %@", buf, 0x16u);
  }

  os_unfair_lock_unlock(p_stateLock);
}

- (void)_stopWatchingRecordingFile
{
  fileWatcherSource = self->_fileWatcherSource;
  if (fileWatcherSource)
  {
    dispatch_source_cancel(fileWatcherSource);
    fileWatcherSource = self->_fileWatcherSource;
  }
  self->_fileWatcherSource = 0;
}

- (void)_startWatchingRecordingFile
{
  if (self->_fileWatcherSource)
  {
    char v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"PLFetchRecorder.m" lineNumber:232 description:@"Cannot start watching when watcher already set."];
  }
  int v3 = [(PLFetchRecording *)self->_recording fd];
  id v4 = dispatch_source_create(MEMORY[0x1E4F144A8], v3, 1uLL, (dispatch_queue_t)self->_fileWatcherQueue);
  objc_initWeak(&location, self);
  if (v4)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __46__PLFetchRecorder__startWatchingRecordingFile__block_invoke;
    handler[3] = &unk_1E5875F08;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v4, handler);
    dispatch_activate(v4);
    objc_destroyWeak(&v11);
  }
  else
  {
    uint64_t v5 = PLBackendGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "LOFR Cannot create file watcher for fetch recorder.", v9, 2u);
    }
  }
  fileWatcherSource = self->_fileWatcherSource;
  self->_fileWatcherSource = (OS_dispatch_source *)v4;

  objc_destroyWeak(&location);
}

void __46__PLFetchRecorder__startWatchingRecordingFile__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _stopRecording];
    [v2 _startRecording];
    id WeakRetained = v2;
  }
}

- (void)_stopRecording
{
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if (self->_recording)
  {
    id v4 = PLBackendGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_INFO, "LOFR Stopping recording...", v6, 2u);
    }

    [(PLFetchRecorder *)self _stopWatchingRecordingFile];
    recording = self->_recording;
    self->_recording = 0;
  }
  os_unfair_lock_unlock(p_stateLock);
}

+ (id)sqlFromGeneralizedSQL:(id)a3 bindVars:(id)a4 multiInCounts:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [MEMORY[0x1E4F28E78] string];
  id v14 = [v11 componentsSeparatedByString:@", "];
  v15 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  uint64_t v16 = [v10 componentsSeparatedByCharactersInSet:v15];

  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v34[3] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __70__PLFetchRecorder_sqlFromGeneralizedSQL_bindVars_multiInCounts_error___block_invoke;
  v24[3] = &unk_1E5875F58;
  v29 = v34;
  id v17 = v14;
  id v25 = v17;
  id v18 = v13;
  id v26 = v18;
  id v31 = a1;
  id v19 = v12;
  id v27 = v19;
  v30 = v33;
  uint64_t v32 = a6;
  id v20 = v16;
  id v28 = v20;
  [v20 enumerateObjectsUsingBlock:v24];
  __int16 v21 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  v22 = [v18 stringByTrimmingCharactersInSet:v21];

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v34, 8);

  return v22;
}

void __70__PLFetchRecorder_sqlFromGeneralizedSQL_bindVars_multiInCounts_error___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v33 = a2;
  int v5 = [v33 hasPrefix:@"?"];
  id v6 = v33;
  if (v5)
  {
    unint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    unint64_t v8 = [*(id *)(a1 + 32) count];
    id v6 = v33;
    if (v7 < v8)
    {
      id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      id v10 = *(void **)(a1 + 40);
      id v11 = [*(id *)(a1 + 80) _paramStringFromBindVariableComponent:v9];
      [v10 appendString:v11];

      id v12 = [v33 stringByReplacingOccurrencesOfString:@"?" withString:&stru_1EEB2EB80];
      if ([v12 length]) {
        [*(id *)(a1 + 40) appendString:v12];
      }
      [*(id *)(a1 + 40) appendString:@" "];
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);

      goto LABEL_28;
    }
  }
  if ([v6 hasPrefix:@"(?)"])
  {
    unint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v13 < [*(id *)(a1 + 32) count])
    {
      id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      id v14 = *(void **)(a1 + 40);
      v15 = [*(id *)(a1 + 80) _paramStringFromBindVariableComponent:v9];
      [v14 appendFormat:@"(%@)", v15];

      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
LABEL_28:

      goto LABEL_32;
    }
  }
  if ([v33 hasPrefix:@"(*)"])
  {
    objc_msgSend(*(id *)(a1 + 40), "appendString:", @"(");
    uint64_t v16 = [*(id *)(a1 + 48) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
    uint64_t v17 = [v16 integerValue];

    ++*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
    if (v17 >= 1)
    {
      for (uint64_t i = 0; v17 != i; ++i)
      {
        unint64_t v19 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        if (v19 >= [*(id *)(a1 + 32) count]) {
          break;
        }
        unint64_t v20 = i + *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
        if (v20 >= [*(id *)(a1 + 32) count])
        {
          id v24 = *(void **)(a1 + 88);
          if (!v24 || *v24) {
            continue;
          }
          __int16 v21 = [NSString stringWithFormat:@"LOFR index out of bounds: %ld, item count: %ld", v20, objc_msgSend(*(id *)(a1 + 32), "count")];
          uint64_t v25 = PLErrorCreate();
          id v26 = *(void ***)(a1 + 88);
          id v27 = *v26;
          void *v26 = (void *)v25;
        }
        else
        {
          __int16 v21 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v20];
          v22 = *(void **)(a1 + 40);
          uint64_t v23 = [*(id *)(a1 + 80) _paramStringFromBindVariableComponent:v21];
          [v22 appendString:v23];

          if (v17 - 1 > i) {
            [*(id *)(a1 + 40) appendString:@", "];
          }
        }
      }
    }
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += v17;
    id v28 = *(void **)(a1 + 40);
    v29 = @" ");
    goto LABEL_31;
  }
  if ([v33 isEqualToString:@"N"])
  {
    unint64_t v30 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
    if (v30 < [*(id *)(a1 + 32) count])
    {
      id v9 = [*(id *)(a1 + 32) objectAtIndexedSubscript:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)];
      uint64_t v31 = [v9 integerValue];
      if (v31) {
        uint64_t v32 = v31;
      }
      else {
        uint64_t v32 = -1;
      }
      ++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      objc_msgSend(*(id *)(a1 + 40), "appendFormat:", @"%ld", v32);
      goto LABEL_28;
    }
  }
  [*(id *)(a1 + 40) appendString:v33];
  if ([*(id *)(a1 + 56) count] - 1 > a3)
  {
    id v28 = *(void **)(a1 + 40);
    v29 = @" ";
LABEL_31:
    [v28 appendString:v29];
  }
LABEL_32:
}

+ (PLFetchRecorderSQLGeneralizationResult)generalizedSQLFromSQL:(id)a3 bindVariables:(id)a4 fromFetchRequest:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v7;
  id v11 = v10;
  if ([v9 fetchLimit])
  {
    id v11 = [(id)objc_opt_class() _generalizedStringByFactoringOutLimitClauseFrom:v10];
  }
  if ((unint64_t)[v8 count] < 2) {
    goto LABEL_8;
  }
  id v12 = objc_alloc_init(PLFetchRecorderPredicateVisitor);
  unint64_t v13 = [v9 predicate];
  [(PLFetchRecorderPredicateVisitor *)v12 examinePredicate:v13];

  if (![(PLFetchRecorderPredicateVisitor *)v12 foundOperatorIN])
  {

LABEL_8:
    uint64_t v16 = 0;
LABEL_9:
    id v14 = v11;
    goto LABEL_10;
  }
  id v14 = (id)[(id)objc_opt_class() _generalizedStringByFactoringOutInClausesFromSQL:v11];
  uint64_t v16 = v15;

  if (!v14) {
    goto LABEL_9;
  }
LABEL_10:
  if ([v14 isEqualToString:v10] && (unint64_t)objc_msgSend(v8, "count") >= 0x33)
  {

    id v14 = 0;
    uint64_t v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  uint64_t v17 = v14;
  id v18 = v16;
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

+ (id)fileURLsToExistingRecordings
{
  int v3 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v4 = (void *)MEMORY[0x1E4F1CB10];
  int v5 = NSTemporaryDirectory();
  id v6 = [v4 fileURLWithPath:v5];

  id v7 = [a1 _findRecordingsWithinURL:v6];
  [v3 unionOrderedSet:v7];

  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/mobile/Containers/Data/PluginKitPlugin"];
  id v9 = [a1 _findRecordingsWithinURL:v8];
  [v3 unionOrderedSet:v9];

  id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var/mobile/tmp"];
  id v11 = [a1 _findRecordingsWithinURL:v10];
  [v3 unionOrderedSet:v11];

  id v12 = [v3 array];

  return v12;
}

void __61__PLFetchRecorder_isCurrentProcessEnabledForRecordingBundle___block_invoke()
{
  id v0 = [NSClassFromString(&cfstr_Uiapplication.isa) sharedApplication];
  isCurrentProcessEnabledForRecordingBundle__launchedForTesting = [v0 launchedToTest];
}

+ (id)_findRecordingsWithinURL:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v6 = (void *)MEMORY[0x19F38D3B0]();
  id v7 = objc_alloc(MEMORY[0x1E4F8B910]);
  id v8 = [v4 path];
  id v9 = (void *)[v7 initWithFilePath:v8];

  [v9 setContinueAfterError:1];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __44__PLFetchRecorder__findRecordingsWithinURL___block_invoke;
  v12[3] = &unk_1E5875EE0;
  id v14 = a1;
  id v10 = v5;
  id v13 = v10;
  [v9 visitURLsLoadingPropertiesForKeys:MEMORY[0x1E4F1CBF0] withBlock:v12];

  return v10;
}

uint64_t __44__PLFetchRecorder__findRecordingsWithinURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 40) _isRecordingFileFromURL:v3]) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

+ (BOOL)_isRecordingFileFromURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 pathExtension];
  int v5 = [v4 isEqualToString:@"lofr"];

  if (v5)
  {
    id v6 = [v3 pathComponents];
    if ((unint64_t)[v6 count] < 2)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v6, "count") - 2);
      LOBYTE(v5) = [v7 isEqualToString:@"lofr"];
    }
  }

  return v5;
}

+ (id)_paramStringFromBindVariableComponent:(id)a3
{
  id v3 = a3;
  if (_paramStringFromBindVariableComponent__onceToken != -1) {
    dispatch_once(&_paramStringFromBindVariableComponent__onceToken, &__block_literal_global_116582);
  }
  id v4 = [(id)_paramStringFromBindVariableComponent__formatter numberFromString:v3];
  if (v4)
  {
    int v5 = [(id)_paramStringFromBindVariableComponent__formatter stringFromNumber:v4];
  }
  else
  {
    int v5 = 0;
  }
  uint64_t v6 = [v5 length];
  if (v6 == [v3 length]) {
    [NSString stringWithFormat:@"%@", v5];
  }
  else {
  id v7 = [NSString stringWithFormat:@"'%@'", v3];
  }

  return v7;
}

uint64_t __57__PLFetchRecorder__paramStringFromBindVariableComponent___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
  v1 = (void *)_paramStringFromBindVariableComponent__formatter;
  _paramStringFromBindVariableComponent__formatter = (uint64_t)v0;

  id v2 = (void *)_paramStringFromBindVariableComponent__formatter;
  return [v2 setNumberStyle:1];
}

+ (PLFetchRecorderSQLGeneralizationResult)_generalizedStringByFactoringOutInClausesFromSQL:(id)a3
{
  id v3 = a3;
  uint64_t v4 = objc_msgSend(@"IN  (?,?"), "length";
  uint64_t v5 = [v3 length];
  uint64_t v6 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:10];
  while (1)
  {
    uint64_t v7 = [v3 length];
    uint64_t v8 = (~v4 - v5 + v7) & ~((~v4 - v5 + v7) >> 63);
    uint64_t v9 = objc_msgSend(v3, "rangeOfString:options:range:", @"IN  (?,?"), 4, v8, objc_msgSend(v3, "length") - v8;
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v10 = v9;
    uint64_t v11 = objc_msgSend(v3, "rangeOfString:options:range:", @""), 0, v10, objc_msgSend(v3, "length") - v10);
    if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    uint64_t v12 = v11 - v10 + 1;
    id v13 = objc_msgSend(v3, "substringWithRange:", v10, v12);
    id v14 = [v13 componentsSeparatedByString:@"?"];
    uint64_t v15 = [v14 count] - 1;

    if (v15 >= 1)
    {
      uint64_t v16 = [NSNumber numberWithInteger:v15];
      [v6 insertObject:v16 atIndex:0];

      uint64_t v17 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", v13, @"IN (*)", 0, v10, v12);

      id v3 = (id)v17;
    }
  }
  id v18 = v3;
  unint64_t v19 = v6;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

+ (id)_generalizedStringByFactoringOutLimitClauseFrom:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [@"LIMIT " length];
  uint64_t v5 = [v3 length] + ~v4;
  if (v5 <= 100) {
    uint64_t v5 = 100;
  }
  uint64_t v6 = objc_msgSend(v3, "rangeOfString:options:range:", @"LIMIT ", 4, v5 - 100, objc_msgSend(v3, "length") - (v5 - 100));
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v3 length];
    if (v8 != 0x8000000000000000)
    {
      uint64_t v9 = v8 - v7;
      uint64_t v10 = objc_msgSend(v3, "substringWithRange:", v7, v8 - v7);
      uint64_t v11 = objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:options:range:", v10, @"LIMIT N", 0, v7, v9);

      id v3 = (id)v11;
    }
  }
  return v3;
}

@end