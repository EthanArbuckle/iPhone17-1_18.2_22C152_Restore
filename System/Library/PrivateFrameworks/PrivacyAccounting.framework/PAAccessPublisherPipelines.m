@interface PAAccessPublisherPipelines
+ (double)nextStartTimeForEndTime:(double)a3 iteration:(double)a4;
+ (id)accessPublisherWithoutHiddenOrMissingApps:(id)a3;
+ (id)accessPublisherWithoutHiddenOrMissingApps:(id)a3 withBundleLookup:(id)a4;
+ (id)accessPublisherWithoutOutOfProcessPickerAccesses:(id)a3;
+ (id)accessPublisherWithoutUnknownCategoryAccesses:(id)a3;
+ (id)accessRecordsFromPublisher:(id)a3;
+ (id)accessRecordsFromPublisher:(id)a3 reversed:(BOOL)a4;
+ (id)coalesceAccessRecordsFromPublisher:(id)a3 withCoalescingWindowDuration:(double)a4 reversed:(BOOL)a5;
+ (id)completeAccessRecordFromPartialAccessRecord:(id)a3 nextAccessPublisher:(id)a4;
+ (id)completeAccessRecordFromPartialAccessRecord:(id)a3 nextStartTime:(id)a4 accessPublisher:(id)a5;
+ (id)findBeginningForPartialAccessRecord:(id)a3 iteration:(double)a4 nextStartTime:(id)a5 endTime:(double)a6 accessPublisher:(id)a7;
+ (id)ongoingAccessRecordsFromPublisher:(id)a3;
@end

@implementation PAAccessPublisherPipelines

+ (id)accessPublisherWithoutHiddenOrMissingApps:(id)a3
{
  return (id)[a1 accessPublisherWithoutHiddenOrMissingApps:a3 withBundleLookup:&__block_literal_global_7];
}

id __72__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps___block_invoke(uint64_t a1, void *a2)
{
  v2 = (void *)MEMORY[0x1E4F223F8];
  v3 = [a2 bundleID];
  uint64_t v6 = 0;
  v4 = [v2 bundleRecordWithBundleIdentifier:v3 allowPlaceholder:0 error:&v6];

  return v4;
}

+ (id)accessPublisherWithoutHiddenOrMissingApps:(id)a3 withBundleLookup:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  v8 = [v6 dictionary];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps_withBundleLookup___block_invoke;
  aBlock[3] = &unk_1E5D71320;
  id v18 = v8;
  id v19 = v5;
  id v9 = v5;
  id v10 = v8;
  v11 = _Block_copy(aBlock);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __89__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps_withBundleLookup___block_invoke_2;
  v15[3] = &unk_1E5D71348;
  id v16 = v11;
  id v12 = v11;
  v13 = [v7 filterWithIsIncluded:v15];

  return v13;
}

uint64_t __89__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps_withBundleLookup___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(a1 + 32);
  id v5 = [v3 bundleID];
  uint64_t v6 = [v4 objectForKeyedSubscript:v5];

  if (v6)
  {
    uint64_t IsVisibleApplication = [v6 BOOLValue];
  }
  else
  {
    v8 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v9 = v8;
    if (v8) {
      uint64_t IsVisibleApplication = PABundleRecordIsVisibleApplication(v8);
    }
    else {
      uint64_t IsVisibleApplication = 0;
    }
    id v10 = [NSNumber numberWithBool:IsVisibleApplication];
    v11 = *(void **)(a1 + 32);
    id v12 = [v3 bundleID];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
  return IsVisibleApplication;
}

uint64_t __89__PAAccessPublisherPipelines_accessPublisherWithoutHiddenOrMissingApps_withBundleLookup___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1AD0EAC00]();
  id v5 = [v3 eventBody];
  uint64_t v6 = [v5 accessor];

  if (v6 && ![v6 identifierType]) {
    uint64_t v7 = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else {
    uint64_t v7 = 1;
  }

  return v7;
}

+ (id)accessPublisherWithoutOutOfProcessPickerAccesses:(id)a3
{
  return (id)[a3 filterWithIsIncluded:&__block_literal_global_22];
}

BOOL __79__PAAccessPublisherPipelines_accessPublisherWithoutOutOfProcessPickerAccesses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1AD0EAC00]();
  v4 = [v2 eventBody];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return (isKindOfClass & 1) == 0;
}

+ (id)accessPublisherWithoutUnknownCategoryAccesses:(id)a3
{
  return (id)[a3 filterWithIsIncluded:&__block_literal_global_25];
}

uint64_t __76__PAAccessPublisherPipelines_accessPublisherWithoutUnknownCategoryAccesses___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x1AD0EAC00]();
  v4 = [v2 eventBody];
  id v5 = [v4 category];
  uint64_t v6 = [v5 isEqual:@"unknown"] ^ 1;

  return v6;
}

+ (id)accessRecordsFromPublisher:(id)a3
{
  return (id)[a1 accessRecordsFromPublisher:a3 reversed:0];
}

+ (id)accessRecordsFromPublisher:(id)a3 reversed:(BOOL)a4
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke;
  v8[3] = &__block_descriptor_33_e79___PAAccessRecordAccumulator_24__0__PAAccessRecordAccumulator_8__BMStoreEvent_16l;
  BOOL v9 = a4;
  v4 = [a3 scanWithInitial:0 nextPartialResult:v8];
  id v5 = [v4 filterWithIsIncluded:&__block_literal_global_35];
  uint64_t v6 = [v5 mapWithTransform:&__block_literal_global_38];

  return v6;
}

id __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = (void *)MEMORY[0x1AD0EAC00]();
  if (!v5) {
    id v5 = (id)objc_opt_new();
  }
  v8 = [v6 eventBody];

  [v5 setRecord:0];
  if (v8)
  {
    [v6 timestamp];
    double v10 = v9;
    v11 = [v6 eventBody];
    [v11 timestampAdjustment];
    double v13 = v12;

    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x3032000000;
    v45 = __Block_byref_object_copy__3;
    v46 = __Block_byref_object_dispose__3;
    v14 = [v5 ongoingIntervals];
    v15 = [v6 eventBody];
    id v16 = [v15 identifier];
    id v47 = [v14 objectForKeyedSubscript:v16];

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke_27;
    aBlock[3] = &unk_1E5D71390;
    v41 = &v42;
    id v17 = v6;
    id v39 = v17;
    id v18 = v5;
    id v40 = v18;
    id v19 = (void (**)(void))_Block_copy(aBlock);
    v20 = [v17 eventBody];
    uint64_t v21 = [v20 kind];

    double v22 = v10 + v13;
    switch(v21)
    {
      case 1:
        v23 = [v18 seenEvents];
        v24 = [v17 eventBody];
        v25 = [v24 identifier];
        char v26 = [v23 containsObject:v25];

        if (v26) {
          goto LABEL_13;
        }
        v27 = [v18 seenEvents];
        v28 = [v17 eventBody];
        v29 = [v28 identifier];
        [v27 addObject:v29];

        v30 = [PACompleteAccessRecord alloc];
        v31 = [v17 eventBody];
        v32 = [(PACompleteAccessRecord *)v30 initWithAccess:v31 startTime:v22 endTime:v22];
        [v18 setRecord:v32];
        goto LABEL_12;
      case 2:
        v19[2](v19);
        [(id)v43[5] setStartTime:v22];
        if (*(unsigned char *)(a1 + 32)) {
          goto LABEL_11;
        }
        goto LABEL_13;
      case 3:
        v19[2](v19);
        [(id)v43[5] setEndTime:v22];
        if (!*(unsigned char *)(a1 + 32))
        {
LABEL_11:
          v34 = [(id)v43[5] asSealedRecord];
          [v18 setRecord:v34];

          v31 = [v18 ongoingIntervals];
          v32 = [v17 eventBody];
          v35 = [(PACompleteAccessRecord *)v32 identifier];
          [v31 setObject:0 forKeyedSubscript:v35];

LABEL_12:
        }
        goto LABEL_13;
      case 4:
LABEL_13:
        id v36 = v18;
        break;
      default:
        break;
    }

    _Block_object_dispose(&v42, 8);
  }
  else
  {
    id v33 = v5;
  }

  return v5;
}

void __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke_27(uint64_t a1)
{
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v2 = objc_alloc_init(PAWorkInProgressAccessInterval);
    uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
    v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;

    id v5 = [*(id *)(a1 + 32) eventBody];
    id v6 = [MEMORY[0x1E4F1CAD0] set];
    uint64_t v7 = [v5 asIntervalEventWithAssetIdentifiers:v6 visibilityState:0 accessEventCount:0];
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setAccess:v7];

    uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
    id v11 = [*(id *)(a1 + 40) ongoingIntervals];
    double v9 = [*(id *)(a1 + 32) eventBody];
    double v10 = [v9 identifier];
    [v11 setObject:v8 forKeyedSubscript:v10];
  }
}

BOOL __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 record];
  BOOL v3 = v2 != 0;

  return v3;
}

uint64_t __66__PAAccessPublisherPipelines_accessRecordsFromPublisher_reversed___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 record];
}

+ (id)ongoingAccessRecordsFromPublisher:(id)a3
{
  BOOL v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = [v3 dictionary];
  id v6 = [v4 reduceWithInitial:v5 nextPartialResult:&__block_literal_global_41];

  uint64_t v7 = [v6 flatMapWithTransform:&__block_literal_global_44];

  return v7;
}

id __64__PAAccessPublisherPipelines_ongoingAccessRecordsFromPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1AD0EAC00]();
  uint64_t v7 = [v5 eventBody];
  uint64_t v8 = [v7 kind];

  if (v8 == 3)
  {
    double v9 = [v5 eventBody];
    double v10 = [v9 identifier];
    id v11 = v4;
    id v12 = 0;
  }
  else
  {
    if (v8 != 2) {
      goto LABEL_6;
    }
    double v9 = [v5 eventBody];
    double v10 = [v9 identifier];
    id v11 = v4;
    id v12 = v5;
  }
  [v11 setObject:v12 forKeyedSubscript:v10];

LABEL_6:
  id v13 = v4;

  return v13;
}

id __64__PAAccessPublisherPipelines_ongoingAccessRecordsFromPublisher___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = objc_msgSend(v2, "allValues", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        double v10 = [PAOngoingAccessRecord alloc];
        id v11 = [v9 eventBody];
        [v9 timestamp];
        double v13 = v12;
        v14 = [v9 eventBody];
        [v14 timestampAdjustment];
        id v16 = [(PAOngoingAccessRecord *)v10 initWithAccess:v11 startTime:v13 + v15];
        [v3 addObject:v16];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  id v17 = (void *)[objc_alloc(MEMORY[0x1E4F50230]) initWithSequence:v3];

  return v17;
}

+ (id)coalesceAccessRecordsFromPublisher:(id)a3 withCoalescingWindowDuration:(double)a4 reversed:(BOOL)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA98];
  id v8 = a3;
  double v9 = [v7 null];
  id v10 = objc_alloc(MEMORY[0x1E4F50230]);
  v22[0] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  double v12 = (void *)[v10 initWithSequence:v11];
  double v13 = [v8 mergeWithOther:v12];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __103__PAAccessPublisherPipelines_coalesceAccessRecordsFromPublisher_withCoalescingWindowDuration_reversed___block_invoke;
  v18[3] = &unk_1E5D71458;
  id v19 = v9;
  BOOL v21 = a5;
  double v20 = a4;
  id v14 = v9;
  double v15 = [v13 scanWithInitial:0 nextPartialResult:v18];
  id v16 = [v15 flatMapWithTransform:&__block_literal_global_110];

  return v16;
}

PAAccessRecordCoalescingInWindowState *__103__PAAccessPublisherPipelines_coalesceAccessRecordsFromPublisher_withCoalescingWindowDuration_reversed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (!v5) {
    id v5 = (id)objc_opt_new();
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = [v5 previousState];

    id v5 = (id)v7;
  }
  if (*(id *)(a1 + 32) == v6)
  {
    id v11 = [[PAAccessRecordCoalescingDoneState alloc] initByEndingLastWindow:v5 reversed:*(unsigned __int8 *)(a1 + 48)];
LABEL_11:
    double v12 = (PAAccessRecordCoalescingInWindowState *)v11;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v11 = [[PAAccessRecordCoalescingIncompleteRecordState alloc] initWithPreviousState:v5 recordToRepublish:v6];
    goto LABEL_11;
  }
  id v8 = v6;
  double v9 = v8;
  if (*(unsigned char *)(a1 + 48)) {
    [v8 startTime];
  }
  else {
    [v8 endTime];
  }
  unint64_t v13 = llround(v10 / *(double *)(a1 + 40));
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v12 = [[PAAccessRecordCoalescingInWindowState alloc] initWithFirstAccessRecord:v9 forEpoch:v13];
  }
  else
  {
    int v14 = [v5 conformsToProtocol:&unk_1EFF85260];
    double v15 = (PAAccessRecordCoalescingInWindowState *)v5;
    double v12 = v15;
    if (v14)
    {
      uint64_t v16 = [(PAAccessRecordCoalescingInWindowState *)v15 epoch];
      unint64_t v17 = v13 - v16;
      if ((uint64_t)(v13 - v16) < 0) {
        unint64_t v17 = v16 - v13;
      }
      if (v17 < 2) {
        id v18 = [[PAAccessRecordCoalescingInWindowState alloc] initByContinuingWindow:v12 withAccessRecord:v9];
      }
      else {
        id v18 = [[PAAccessRecordCoalescingWindowRolledOverState alloc] initByEndingPreviousWindow:v12 reversed:*(unsigned __int8 *)(a1 + 48) withInitialAccessRecord:v9 forNewEpoch:v13];
      }
      id v19 = v18;

      double v12 = v19;
    }
  }

LABEL_23:

  return v12;
}

id __103__PAAccessPublisherPipelines_coalesceAccessRecordsFromPublisher_withCoalescingWindowDuration_reversed___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (objc_class *)MEMORY[0x1E4F50230];
  id v3 = a2;
  id v4 = [v2 alloc];
  id v5 = [v3 recordsToRepublish];

  id v6 = (void *)[v4 initWithSequence:v5];

  return v6;
}

+ (id)completeAccessRecordFromPartialAccessRecord:(id)a3 nextAccessPublisher:(id)a4
{
  id v6 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __94__PAAccessPublisherPipelines_completeAccessRecordFromPartialAccessRecord_nextAccessPublisher___block_invoke;
  v10[3] = &unk_1E5D714A0;
  id v11 = v6;
  id v12 = a1;
  id v7 = v6;
  id v8 = [a1 completeAccessRecordFromPartialAccessRecord:v7 nextStartTime:v10 accessPublisher:a4];

  return v8;
}

uint64_t __94__PAAccessPublisherPipelines_completeAccessRecordFromPartialAccessRecord_nextAccessPublisher___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  [*(id *)(a1 + 32) endTime];

  return objc_msgSend(v1, "nextStartTimeForEndTime:iteration:");
}

+ (id)completeAccessRecordFromPartialAccessRecord:(id)a3 nextStartTime:(id)a4 accessPublisher:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  [v8 endTime];
  id v12 = [a1 findBeginningForPartialAccessRecord:v8 iteration:v10 nextStartTime:v9 endTime:0.0 accessPublisher:v11];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __104__PAAccessPublisherPipelines_completeAccessRecordFromPartialAccessRecord_nextStartTime_accessPublisher___block_invoke;
  v16[3] = &unk_1E5D714C8;
  id v17 = v8;
  id v13 = v8;
  int v14 = [v12 mapWithTransform:v16];

  return v14;
}

PACompleteAccessRecord *__104__PAAccessPublisherPipelines_completeAccessRecordFromPartialAccessRecord_nextStartTime_accessPublisher___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PACompleteAccessRecord alloc];
  id v5 = [*(id *)(a1 + 32) access];
  [v3 timestamp];
  double v7 = v6;
  id v8 = [v3 eventBody];

  [v8 timestampAdjustment];
  double v10 = v7 + v9;
  [*(id *)(a1 + 32) endTime];
  id v12 = [(PACompleteAccessRecord *)v4 initWithAccess:v5 startTime:v10 endTime:v11];

  return v12;
}

+ (id)findBeginningForPartialAccessRecord:(id)a3 iteration:(double)a4 nextStartTime:(id)a5 endTime:(double)a6 accessPublisher:(id)a7
{
  id v12 = a3;
  id v13 = (double (**)(void, double))a5;
  int v14 = (void (**)(void))a7;
  double v15 = v13[2](v13, a4);
  if (v15 == a6 || (double v16 = v15, v14[2](v14), (v17 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v24 = objc_alloc(MEMORY[0x1E4F50230]);
    v23 = (void *)[v24 initWithSequence:MEMORY[0x1E4F1CBF0]];
  }
  else
  {
    id v18 = v17;
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke;
    v35[3] = &__block_descriptor_40_e22_B16__0__BMStoreEvent_8l;
    *(double *)&v35[4] = a6;
    id v19 = [v17 filterWithIsIncluded:v35];
    double v20 = [MEMORY[0x1E4F1CA98] null];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke_2;
    v33[3] = &unk_1E5D71510;
    id v21 = v12;
    id v34 = v21;
    long long v22 = [v19 reduceWithInitial:v20 nextPartialResult:v33];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke_3;
    v26[3] = &unk_1E5D71538;
    id v30 = a1;
    id v27 = v21;
    double v31 = a4;
    v28 = v13;
    double v32 = v16;
    v29 = v14;
    v23 = [v22 flatMapWithTransform:v26];
  }

  return v23;
}

BOOL __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke(uint64_t a1, void *a2)
{
  [a2 timestamp];
  return v3 < *(double *)(a1 + 32);
}

id __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  double v7 = (void *)MEMORY[0x1AD0EAC00]();
  id v8 = [MEMORY[0x1E4F1CA98] null];

  if (v8 != v5
    || ([v6 eventBody], id v12 = objc_claimAutoreleasedReturnValue(), v12, !v12))
  {
    id v9 = v5;
    goto LABEL_3;
  }
  id v13 = [v6 eventBody];
  if ([v13 kind] == 2)
  {
    int v14 = [v6 eventBody];
    double v15 = [v14 identifier];
    double v16 = [*(id *)(a1 + 32) access];
    id v17 = [v16 identifier];
    int v18 = [v15 isEqual:v17];

    if (v18)
    {
      id v9 = v6;
      goto LABEL_3;
    }
  }
  else
  {
  }
  id v9 = [MEMORY[0x1E4F1CA98] null];
LABEL_3:
  double v10 = v9;

  return v10;
}

id __114__PAAccessPublisherPipelines_findBeginningForPartialAccessRecord_iteration_nextStartTime_endTime_accessPublisher___block_invoke_3(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F1CA98] null];

  if (v4 == v3)
  {
    id v9 = [*(id *)(a1 + 56) findBeginningForPartialAccessRecord:*(void *)(a1 + 32) iteration:*(void *)(a1 + 40) nextStartTime:*(void *)(a1 + 48) endTime:*(double *)(a1 + 64) + 1.0 accessPublisher:*(double *)(a1 + 72)];
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F50230];
    id v6 = v3;
    id v7 = [v5 alloc];
    v11[0] = v6;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

    id v9 = (void *)[v7 initWithSequence:v8];
  }

  return v9;
}

+ (double)nextStartTimeForEndTime:(double)a3 iteration:(double)a4
{
  if (a4 <= 4.0)
  {
    double v6 = exp2(a4);
    double v7 = -5.0;
  }
  else
  {
    if (a4 > 10.0) {
      return 0.0;
    }
    double v6 = exp2(a4 + -5.0) * 3.0;
    double v7 = -60.0;
  }
  return a3 + v6 * v7 * 60.0;
}

@end