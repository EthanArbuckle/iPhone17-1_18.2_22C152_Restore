@interface PLAutoBugCapture
+ (BOOL)_shouldThrottleReportForType:(id)a3 subType:(id)a4 subtypeContextBase:(id)a5;
+ (id)_actionDictionaryWithLogArchive:(BOOL)a3 networkInfo:(BOOL)a4 crashAndSpinLogs:(BOOL)a5 diagnosticExtensions:(BOOL)a6;
+ (id)_bucketCountDescriptionForCount:(int64_t)a3 policy:(unint64_t)a4;
+ (id)_countEventWithName:(id)a3 result:(id)a4;
+ (id)_eventWithName:(id)a3 result:(id)a4;
+ (id)_eventWithName:(id)a3 result:(id)a4 count:(id)a5;
+ (id)_sThrottleLock_untilDates;
+ (void)_captureSnapshotWithType:(id)a3 subType:(id)a4 subtypeContextBase:(id)a5 subtypeContextModifier:(id)a6 triggerThresholdValues:(id)a7 events:(id)a8 actions:(id)a9 completion:(id)a10;
+ (void)_captureSpotlightClientHandlerReindexItemsWithCountDescription:(id)a3 reason:(id)a4 completion:(id)a5;
+ (void)_registerCompletedReportForType:(id)a3 subType:(id)a4 subtypeContextBase:(id)a5 success:(BOOL)a6;
+ (void)captureSpotlightClientHandlerReindexAllItemsWithReason:(id)a3 completion:(id)a4;
+ (void)captureSpotlightClientHandlerReindexItemsWithIdentifiers:(id)a3 reason:(id)a4 completion:(id)a5;
+ (void)captureSpotlightClientStateMissingSnapshotWithSpotlightAssetCountResult:(id)a3 searchIndexingEvents:(id)a4 completion:(id)a5;
@end

@implementation PLAutoBugCapture

+ (void)captureSpotlightClientHandlerReindexItemsWithIdentifiers:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  objc_msgSend(a1, "_bucketCountDescriptionForCount:policy:", objc_msgSend(a3, "count"), 1);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [a1 _captureSpotlightClientHandlerReindexItemsWithCountDescription:v10 reason:v9 completion:v8];
}

+ (void)captureSpotlightClientHandlerReindexAllItemsWithReason:(id)a3 completion:(id)a4
{
}

+ (void)_captureSpotlightClientHandlerReindexItemsWithCountDescription:(id)a3 reason:(id)a4 completion:(id)a5
{
  id v11 = a3;
  id v8 = a5;
  if (a4)
  {
    id v9 = [@"SpotlightReindex" stringByAppendingFormat:@":%@", a4];
  }
  else
  {
    id v9 = @"SpotlightReindex";
  }
  id v10 = [a1 _actionDictionaryWithLogArchive:1 networkInfo:0 crashAndSpinLogs:1 diagnosticExtensions:1];
  [a1 _captureSnapshotWithType:@"Search" subType:v9 subtypeContextBase:@"ItemCount" subtypeContextModifier:v11 triggerThresholdValues:0 events:0 actions:v10 completion:v8];
}

+ (void)captureSpotlightClientStateMissingSnapshotWithSpotlightAssetCountResult:(id)a3 searchIndexingEvents:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 isSuccess])
  {
    id v11 = [v8 result];
    uint64_t v12 = [v11 unsignedIntegerValue];

    id v13 = (id)[a1 _bucketCountDescriptionForCount:v12 policy:0];
    v14 = 0;
  }
  else
  {
    v14 = @"Failed";
  }
  v15 = [v9 sortedArrayUsingComparator:&__block_literal_global_109506];

  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v17 = v15;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v26;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v25 + 1) + 8 * v21) autoBugCaptureEventDictionary];
        [v16 addObject:v22];

        ++v21;
      }
      while (v19 != v21);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v19);
  }

  v23 = [a1 _countEventWithName:@"SpotlightAssetCountQuery" result:v8];
  [v16 addObject:v23];

  v24 = [a1 _actionDictionaryWithLogArchive:1 networkInfo:0 crashAndSpinLogs:1 diagnosticExtensions:1];
  objc_msgSend(a1, "_captureSnapshotWithType:subType:subtypeContextBase:subtypeContextModifier:triggerThresholdValues:events:actions:completion:", @"Search", @"SpotlightClientStateMissing", @"SpotlightAssetCount", v14, 0, v16, v24, v10, (void)v25);
}

uint64_t __124__PLAutoBugCapture_captureSpotlightClientStateMissingSnapshotWithSpotlightAssetCountResult_searchIndexingEvents_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v5 = [a2 timestamp];
  v6 = [v4 timestamp];

  uint64_t v7 = [v5 compare:v6];
  return v7;
}

+ (void)_captureSnapshotWithType:(id)a3 subType:(id)a4 subtypeContextBase:(id)a5 subtypeContextModifier:(id)a6 triggerThresholdValues:(id)a7 events:(id)a8 actions:(id)a9 completion:(id)a10
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v44 = a7;
  id v45 = a8;
  id v46 = a9;
  v47 = (void (**)(id, id))a10;
  if (v17)
  {
    if (v18) {
      goto LABEL_3;
    }
LABEL_21:
    v40 = [MEMORY[0x1E4F28B00] currentHandler];
    [v40 handleFailureInMethod:a2, a1, @"PLAutoBugCapture.m", 241, @"Invalid parameter not satisfying: %@", @"subType" object file lineNumber description];

    if (v19) {
      goto LABEL_4;
    }
    goto LABEL_22;
  }
  v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, a1, @"PLAutoBugCapture.m", 240, @"Invalid parameter not satisfying: %@", @"type" object file lineNumber description];

  if (!v18) {
    goto LABEL_21;
  }
LABEL_3:
  if (v19) {
    goto LABEL_4;
  }
LABEL_22:
  v41 = [MEMORY[0x1E4F28B00] currentHandler];
  [v41 handleFailureInMethod:a2, a1, @"PLAutoBugCapture.m", 242, @"Invalid parameter not satisfying: %@", @"subtypeContextBase" object file lineNumber description];

LABEL_4:
  if ([a1 _shouldThrottleReportForType:v17 subType:v18 subtypeContextBase:v19])
  {
    uint64_t v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      *(void *)&buf[4] = v17;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v18;
      *(_WORD *)&buf[22] = 2114;
      v61 = v19;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Auto bug capture for %{public}@/%{public}@/%{public}@ throttled because a similar report was made recently", buf, 0x20u);
    }

    v22 = (void *)MEMORY[0x1E4F8B9B8];
    v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2020000000;
    v24 = (int *)getkSymptomDiagnosticErrorRequestThrottledSymbolLoc_ptr;
    uint64_t v57 = getkSymptomDiagnosticErrorRequestThrottledSymbolLoc_ptr;
    if (!getkSymptomDiagnosticErrorRequestThrottledSymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getkSymptomDiagnosticErrorRequestThrottledSymbolLoc_block_invoke;
      v61 = &unk_1E5875840;
      v62 = &v54;
      long long v25 = SymptomDiagnosticReporterLibrary();
      long long v26 = dlsym(v25, "kSymptomDiagnosticErrorRequestThrottled");
      *(void *)(v62[1] + 24) = v26;
      getkSymptomDiagnosticErrorRequestThrottledSymbolLoc_ptr = *(void *)(v62[1] + 24);
      v24 = (int *)v55[3];
    }
    _Block_object_dispose(&v54, 8);
    if (!v24)
    {
      v42 = [MEMORY[0x1E4F28B00] currentHandler];
      v43 = [NSString stringWithUTF8String:"const int getkSymptomDiagnosticErrorRequestThrottled(void)"];
      objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v43, @"PLAutoBugCapture.m", 48, @"%s", dlerror());

      __break(1u);
    }
    uint64_t v27 = *v24;
    uint64_t v58 = *MEMORY[0x1E4F28228];
    v59 = @"Throttled by client";
    long long v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v59 forKeys:&v58 count:1];
    v29 = [v23 errorWithDomain:@"PLAutoBugCaptureErrorDomain" code:v27 userInfo:v28];
    id v30 = [v22 failureWithError:v29];
    v47[2](v47, v30);
  }
  else
  {
    if (v20)
    {
      id v31 = [v19 stringByAppendingFormat:@":%@", v20];
    }
    else
    {
      id v31 = v19;
    }
    long long v28 = v31;
    v32 = [MEMORY[0x1E4F28F80] processInfo];
    uint64_t v33 = [v32 processName];
    v34 = (void *)v33;
    v35 = @"unknown";
    if (v33) {
      v35 = (__CFString *)v33;
    }
    v29 = v35;

    uint64_t v54 = 0;
    v55 = &v54;
    uint64_t v56 = 0x2050000000;
    v36 = (void *)getSDRDiagnosticReporterClass_softClass;
    uint64_t v57 = getSDRDiagnosticReporterClass_softClass;
    if (!getSDRDiagnosticReporterClass_softClass)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSDRDiagnosticReporterClass_block_invoke;
      v61 = &unk_1E5875840;
      v62 = &v54;
      __getSDRDiagnosticReporterClass_block_invoke((uint64_t)buf);
      v36 = (void *)v55[3];
    }
    v37 = v36;
    _Block_object_dispose(&v54, 8);
    id v30 = objc_alloc_init(v37);
    v38 = [v30 signatureWithDomain:@"PhotosBackend" type:v17 subType:v18 subtypeContext:v28 detectedProcess:v29 triggerThresholdValues:v44];
    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __144__PLAutoBugCapture__captureSnapshotWithType_subType_subtypeContextBase_subtypeContextModifier_triggerThresholdValues_events_actions_completion___block_invoke;
    v48[3] = &unk_1E5874410;
    id v53 = a1;
    id v49 = v17;
    id v50 = v18;
    id v51 = v19;
    v52 = v47;
    [v30 snapshotWithSignature:v38 delay:v45 events:0 payload:v46 actions:v48 reply:0.0];
  }
}

void __144__PLAutoBugCapture__captureSnapshotWithType_subType_subtypeContextBase_subtypeContextModifier_triggerThresholdValues_events_actions_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v4 = (void *)getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  uint64_t v28 = getkSymptomDiagnosticReplySuccessSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplySuccessSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkSymptomDiagnosticReplySuccessSymbolLoc_block_invoke;
    id v30 = &unk_1E5875840;
    id v31 = &v25;
    v5 = SymptomDiagnosticReporterLibrary();
    v6 = dlsym(v5, "kSymptomDiagnosticReplySuccess");
    *(void *)(v31[1] + 24) = v6;
    getkSymptomDiagnosticReplySuccessSymbolLoc_ptr = *(void *)(v31[1] + 24);
    id v4 = (void *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v4)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    v22 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticReplySuccess(void)"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PLAutoBugCapture.m", 25, @"%s", dlerror());

    goto LABEL_17;
  }
  uint64_t v7 = [v3 objectForKeyedSubscript:*v4];
  uint64_t v8 = [v7 BOOLValue];

  [*(id *)(a1 + 64) _registerCompletedReportForType:*(void *)(a1 + 32) subType:*(void *)(a1 + 40) subtypeContextBase:*(void *)(a1 + 48) success:v8];
  if (v8)
  {
    id v9 = PLBackendGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v3;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Auto bug capture finished sending snapshot, received response: %@", buf, 0xCu);
    }

    id v10 = (void *)MEMORY[0x1E4F8B9B8];
    id v11 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v12 = [v10 successWithResult:v11];
    goto LABEL_14;
  }
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x2020000000;
  id v13 = (void *)getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  uint64_t v28 = getkSymptomDiagnosticReplyReasonSymbolLoc_ptr;
  if (!getkSymptomDiagnosticReplyReasonSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __getkSymptomDiagnosticReplyReasonSymbolLoc_block_invoke;
    id v30 = &unk_1E5875840;
    id v31 = &v25;
    v14 = SymptomDiagnosticReporterLibrary();
    v15 = dlsym(v14, "kSymptomDiagnosticReplyReason");
    *(void *)(v31[1] + 24) = v15;
    getkSymptomDiagnosticReplyReasonSymbolLoc_ptr = *(void *)(v31[1] + 24);
    id v13 = (void *)v26[3];
  }
  _Block_object_dispose(&v25, 8);
  if (!v13)
  {
    v23 = [MEMORY[0x1E4F28B00] currentHandler];
    v24 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticReplyReason(void)"];
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, @"PLAutoBugCapture.m", 27, @"%s", dlerror());

LABEL_17:
    __break(1u);
  }
  id v16 = [v3 valueForKey:*v13];
  uint64_t v17 = [v16 unsignedIntegerValue];

  id v18 = PLBackendGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218242;
    *(void *)&buf[4] = v17;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v3;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Auto bug capture failed with code: %lu, %{public}@", buf, 0x16u);
  }

  id v19 = (void *)MEMORY[0x1E4F8B9B8];
  id v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PLAutoBugCaptureErrorDomain" code:v17 userInfo:0];
  uint64_t v12 = [v19 failureWithError:v11];
LABEL_14:
  id v20 = (void *)v12;

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

+ (id)_actionDictionaryWithLogArchive:(BOOL)a3 networkInfo:(BOOL)a4 crashAndSpinLogs:(BOOL)a5 diagnosticExtensions:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  BOOL v9 = a3;
  v43[4] = *MEMORY[0x1E4F143B8];
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  id v10 = (id *)getkSymptomDiagnosticActionLogArchiveSymbolLoc_ptr;
  uint64_t v40 = getkSymptomDiagnosticActionLogArchiveSymbolLoc_ptr;
  if (!getkSymptomDiagnosticActionLogArchiveSymbolLoc_ptr)
  {
    id v11 = SymptomDiagnosticReporterLibrary();
    v38[3] = (uint64_t)dlsym(v11, "kSymptomDiagnosticActionLogArchive");
    getkSymptomDiagnosticActionLogArchiveSymbolLoc_ptr = v38[3];
    id v10 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v10)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    id v30 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticActionLogArchive(void)"];
    objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, @"PLAutoBugCapture.m", 39, @"%s", dlerror());

    goto LABEL_20;
  }
  id v12 = *v10;
  v41[0] = v12;
  id v13 = [NSNumber numberWithBool:v9];
  v43[0] = v13;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v14 = (id *)getkSymptomDiagnosticActionGetNetworkInfoSymbolLoc_ptr;
  uint64_t v40 = getkSymptomDiagnosticActionGetNetworkInfoSymbolLoc_ptr;
  if (!getkSymptomDiagnosticActionGetNetworkInfoSymbolLoc_ptr)
  {
    v15 = SymptomDiagnosticReporterLibrary();
    v38[3] = (uint64_t)dlsym(v15, "kSymptomDiagnosticActionGetNetworkInfo");
    getkSymptomDiagnosticActionGetNetworkInfoSymbolLoc_ptr = v38[3];
    v14 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v14)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v32 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticActionGetNetworkInfo(void)"];
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, @"PLAutoBugCapture.m", 41, @"%s", dlerror());

    goto LABEL_20;
  }
  id v16 = *v14;
  v41[1] = v16;
  uint64_t v17 = [NSNumber numberWithBool:v8];
  v43[1] = v17;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  id v18 = (id *)getkSymptomDiagnosticActionCrashAndSpinLogsSymbolLoc_ptr;
  uint64_t v40 = getkSymptomDiagnosticActionCrashAndSpinLogsSymbolLoc_ptr;
  if (!getkSymptomDiagnosticActionCrashAndSpinLogsSymbolLoc_ptr)
  {
    id v19 = SymptomDiagnosticReporterLibrary();
    v38[3] = (uint64_t)dlsym(v19, "kSymptomDiagnosticActionCrashAndSpinLogs");
    getkSymptomDiagnosticActionCrashAndSpinLogsSymbolLoc_ptr = v38[3];
    id v18 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v18)
  {
    uint64_t v33 = [MEMORY[0x1E4F28B00] currentHandler];
    v34 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticActionCrashAndSpinLogs(void)"];
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, @"PLAutoBugCapture.m", 43, @"%s", dlerror());

    goto LABEL_20;
  }
  id v20 = *v18;
  v41[2] = v20;
  uint64_t v21 = [NSNumber numberWithBool:v7];
  v43[2] = v21;
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  v22 = (id *)getkSymptomDiagnosticActionDiagnosticExtensionsSymbolLoc_ptr;
  uint64_t v40 = getkSymptomDiagnosticActionDiagnosticExtensionsSymbolLoc_ptr;
  if (!getkSymptomDiagnosticActionDiagnosticExtensionsSymbolLoc_ptr)
  {
    v23 = SymptomDiagnosticReporterLibrary();
    v38[3] = (uint64_t)dlsym(v23, "kSymptomDiagnosticActionDiagnosticExtensions");
    getkSymptomDiagnosticActionDiagnosticExtensionsSymbolLoc_ptr = v38[3];
    v22 = (id *)v38[3];
  }
  _Block_object_dispose(&v37, 8);
  if (!v22)
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    v36 = [NSString stringWithUTF8String:"NSString *getkSymptomDiagnosticActionDiagnosticExtensions(void)"];
    objc_msgSend(v35, "handleFailureInFunction:file:lineNumber:description:", v36, @"PLAutoBugCapture.m", 45, @"%s", dlerror());

LABEL_20:
    __break(1u);
  }
  id v42 = *v22;
  v24 = NSNumber;
  id v25 = v42;
  long long v26 = [v24 numberWithBool:v6];
  v43[3] = v26;
  uint64_t v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:v41 count:4];

  return v27;
}

+ (void)_registerCompletedReportForType:(id)a3 subType:(id)a4 subtypeContextBase:(id)a5 success:(BOOL)a6
{
  id v8 = a3;
  id v12 = a4;
  id v13 = a5;
  id v9 = v13;
  id v10 = v12;
  id v11 = v8;
  PLRunWithUnfairLock();
}

void __87__PLAutoBugCapture__registerCompletedReportForType_subType_subtypeContextBase_success___block_invoke(uint64_t a1)
{
  [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:dbl_19BA9A0B0[*(unsigned char *)(a1 + 64) == 0]];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(*(id *)(a1 + 56), "_sThrottleLock_untilDates");
  id v3 = objc_msgSend(v2, "_pl_mutableDictionaryCreateAndInsertIfNeededForKey:", *(void *)(a1 + 32));
  id v4 = objc_msgSend(v3, "_pl_mutableDictionaryCreateAndInsertIfNeededForKey:", *(void *)(a1 + 40));
  [v4 setObject:v5 forKeyedSubscript:*(void *)(a1 + 48)];
}

+ (BOOL)_shouldThrottleReportForType:(id)a3 subType:(id)a4 subtypeContextBase:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__109573;
  id v20 = __Block_byref_object_dispose__109574;
  id v21 = 0;
  id v10 = v7;
  id v11 = v8;
  id v12 = v9;
  PLRunWithUnfairLock();
  if (v17[5])
  {
    id v13 = [MEMORY[0x1E4F1C9C8] now];
    BOOL v14 = [v13 compare:v17[5]] == -1;
  }
  else
  {
    BOOL v14 = 0;
  }

  _Block_object_dispose(&v16, 8);
  return v14;
}

void __76__PLAutoBugCapture__shouldThrottleReportForType_subType_subtypeContextBase___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 64), "_sThrottleLock_untilDates");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v7 objectForKeyedSubscript:*(void *)(a1 + 32)];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = [v3 objectForKeyedSubscript:*(void *)(a1 + 48)];
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (id)_sThrottleLock_untilDates
{
  os_unfair_lock_assert_owner((const os_unfair_lock *)&_sThrottleLock);
  v2 = (void *)_sThrottleLock_untilDates;
  if (!_sThrottleLock_untilDates)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v4 = (void *)_sThrottleLock_untilDates;
    _sThrottleLock_untilDates = (uint64_t)v3;

    v2 = (void *)_sThrottleLock_untilDates;
  }
  return v2;
}

+ (id)_countEventWithName:(id)a3 result:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 isSuccess])
  {
    id v8 = [v7 result];
    id v9 = [a1 _eventWithName:v6 result:@"Success" count:v8];
  }
  else
  {
    id v9 = [a1 _eventWithName:v6 result:@"Failure"];
  }

  return v9;
}

+ (id)_eventWithName:(id)a3 result:(id)a4 count:(id)a5
{
  v21[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLAutoBugCapture.m", 172, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
  [v17 handleFailureInMethod:a2, a1, @"PLAutoBugCapture.m", 171, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

  if (!v10) {
    goto LABEL_8;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_9:
  id v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, a1, @"PLAutoBugCapture.m", 173, @"Invalid parameter not satisfying: %@", @"count" object file lineNumber description];

LABEL_4:
  id v12 = getkSymptomDiagnosticKeyEventName();
  v20[0] = v12;
  v21[0] = v9;
  id v13 = getkSymptomDiagnosticKeyEventResult();
  v20[1] = v13;
  v21[1] = v10;
  BOOL v14 = getkSymptomDiagnosticKeyEventCount();
  v20[2] = v14;
  v21[2] = v11;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:3];

  return v15;
}

+ (id)_eventWithName:(id)a3 result:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    BOOL v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"PLAutoBugCapture.m", 155, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, a1, @"PLAutoBugCapture.m", 156, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];

LABEL_3:
  id v10 = getkSymptomDiagnosticKeyEventName();
  v16[0] = v10;
  v17[0] = v7;
  id v11 = getkSymptomDiagnosticKeyEventResult();
  v16[1] = v11;
  v17[1] = v9;
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];

  return v12;
}

+ (id)_bucketCountDescriptionForCount:(int64_t)a3 policy:(unint64_t)a4
{
  if (a4)
  {
    if (a4 == 1)
    {
      unint64_t v5 = 10;
      while (v5 <= a3)
      {
        BOOL v6 = v5 >= 0x186A1;
        v5 *= 10;
        if (v6) {
          goto LABEL_18;
        }
      }
      objc_msgSend(NSString, "stringWithFormat:", @"<%tu", v5);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v7) {
        goto LABEL_19;
      }
LABEL_18:
      objc_msgSend(NSString, "stringWithFormat:", @">=%tu", 1000000);
      id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_19:
    }
    else
    {
      id v7 = @"invalid";
    }
  }
  else
  {
    if (a3) {
      id v7 = @"NonZero";
    }
    else {
      id v7 = @"Zero";
    }
  }
  return v7;
}

@end