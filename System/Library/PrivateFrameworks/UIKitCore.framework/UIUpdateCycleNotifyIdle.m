@interface UIUpdateCycleNotifyIdle
@end

@implementation UIUpdateCycleNotifyIdle

void ___UIUpdateCycleNotifyIdle_block_invoke(void *a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = mach_absolute_time();
  unint64_t v3 = a1[4];
  unint64_t v4 = v2 - v3;
  if (v2 - v3 > a1[5])
  {
    v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("UpdateCycleIdleScheduler", &qword_1EB25D398) + 8);
    if (os_signpost_enabled(v5))
    {
      double v6 = (double)(unint64_t)a1[6];
      *(_DWORD *)buf = 134217984;
      double v31 = (double)v4 / v6;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SkipNotify", "After scheduling, elapsed=%.2f", buf, 0xCu);
    }
    _MergedGlobals_11_8 = 0;
    return;
  }
  unint64_t v7 = a1[6];
  uint64_t v8 = a1[7];
  _isNotifyingIdleObservers = 1;
  uint64_t v9 = mach_absolute_time();
  v10 = *(NSObject **)(__UILogGetCategoryCachedImpl("UpdateCycleIdleScheduler", &qword_1EB25D370) + 8);
  double v11 = (double)v7;
  if (os_signpost_enabled(v10))
  {
    *(_DWORD *)buf = 134217984;
    double v31 = (double)(v9 - v3) / (double)v7;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v10, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "NotifyIdleObservers", "elapsedAtStart=%.2f", buf, 0xCu);
  }
  if (_UIInternalPreferenceUsesDefault((int *)&unk_1EB257640, @"IdleSchedulerMaximumFractionToContinue", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))
  {
    if (_UIUpdateCycleEnabled()) {
      double v12 = 0.8;
    }
    else {
      double v12 = 0.6;
    }
  }
  else
  {
    double v12 = *(double *)&qword_1EB257648;
  }
  id v13 = (id)qword_1EB25D368;
  uint64_t v14 = qword_1EB25D378;
  if (![v13 count])
  {
    uint64_t v23 = 0;
    uint64_t v16 = 0;
    goto LABEL_26;
  }
  unint64_t v29 = v3;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v17 = v14 + 1;
  while (1)
  {
    unint64_t v18 = (v17 + v15) % (unint64_t)objc_msgSend(v13, "count", v29);
    uint64_t v19 = [v13 pointerAtIndex:v18];
    if (!v19) {
      goto LABEL_19;
    }
    v20 = (void *)v19;
    if (!v16) {
      _UIQOSProcessingBegin("IdleObservers", 0, v9, v8);
    }
    [v20 _updateCycleIdleUntil:v8];
    ++v16;
    qword_1EB25D378 = v18;
    uint64_t v21 = mach_absolute_time();
    if (v21 > v8) {
      break;
    }
    unint64_t v22 = v21 - v9;

    if (v22 > (unint64_t)(v11 * v12)) {
      goto LABEL_23;
    }
LABEL_19:
    if (++v15 >= (unint64_t)[v13 count])
    {
      uint64_t v23 = 0;
      unint64_t v3 = v29;
      goto LABEL_26;
    }
  }

LABEL_23:
  unint64_t v3 = v29;
  int v24 = _UIInternalPreferenceUsesDefault((int *)&unk_1EB257650, @"IdleSchedulerMinimumFramesBetweenNotify", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
  double v25 = *(double *)&qword_1EB257658;
  if (v24) {
    double v25 = 2.0;
  }
  qword_1EB25D380 = (unint64_t)(v11 * v25 + (double)v29);
  uint64_t v23 = 1;
LABEL_26:
  _isNotifyingIdleObservers = 0;
  v26 = *(NSObject **)(__UILogGetCategoryCachedImpl("UpdateCycleIdleScheduler", &qword_1EB25D388) + 8);
  if (os_signpost_enabled(v26))
  {
    v27 = v26;
    uint64_t v28 = mach_absolute_time();
    *(_DWORD *)buf = 134218496;
    double v31 = (double)(v28 - v3) / v11;
    __int16 v32 = 2048;
    uint64_t v33 = v16;
    __int16 v34 = 2048;
    uint64_t v35 = v23;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v27, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "NotifyIdleObservers", "elapsedAtEnd=%.2f, notifiedObservers=%ld, didPerformSignificantWork=%ld", buf, 0x20u);
  }
  if ([MEMORY[0x1E4F39CF8] currentState])
  {
    [(id)UIApp _performBlockAfterCATransactionCommits:&__block_literal_global_302];
    if (!v16) {
      goto LABEL_34;
    }
  }
  else
  {
    dispatch_async(MEMORY[0x1E4F14428], &__block_literal_global_302);
    if (!v16) {
      goto LABEL_34;
    }
  }
  _UIQOSProcessingEnd();
  if (_UIUpdateCycleEnabled()) {
    [MEMORY[0x1E4F39CF8] flush];
  }
LABEL_34:
}

@end