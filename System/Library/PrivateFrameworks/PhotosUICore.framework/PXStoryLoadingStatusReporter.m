@interface PXStoryLoadingStatusReporter
- ($14D77461FF5D83CAEC4252578BA76F85)_lock_stateForClipIdentifier:(int64_t)a3;
- (OS_os_log)log;
- (PXStoryLoadingStatusReporter)init;
- (unint64_t)logContext;
- (void)_lock_updateStatusForLoadingState:(id *)a3 error:(id)a4 clipIdentifier:(int64_t)a5;
- (void)dealloc;
- (void)notifyLoadingStatus:(unsigned __int8)a3 error:(id)a4 forClipIdentifier:(int64_t)a5;
- (void)notifyPreloadingCompleteForClipIdentifier:(int64_t)a3;
- (void)notifyPreloadingProgress:(double)a3 error:(id)a4 forClipIdentifier:(int64_t)a5;
- (void)notifyStartedPreloadingClipIdentifier:(int64_t)a3;
- (void)notifyUserDidNavigate;
- (void)notifyVisibility:(unsigned __int8)a3 forClipIdentifier:(int64_t)a4;
- (void)setLog:(id)a3;
- (void)setLogContext:(unint64_t)a3;
@end

@implementation PXStoryLoadingStatusReporter

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lock_lastUserActivity, 0);
  objc_storeStrong((id *)&self->_lock_stateIndexByClipIdentifier, 0);
}

- (void)setLogContext:(unint64_t)a3
{
  self->_logContext = a3;
}

- (unint64_t)logContext
{
  return self->_logContext;
}

- (void)setLog:(id)a3
{
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)notifyLoadingStatus:(unsigned __int8)a3 error:(id)a4 forClipIdentifier:(int64_t)a5
{
  p_lock = &self->_lock;
  id v9 = a4;
  os_unfair_lock_lock(p_lock);
  v10 = [(PXStoryLoadingStatusReporter *)self _lock_stateForClipIdentifier:a5];
  v10->var1 = a3;
  [(PXStoryLoadingStatusReporter *)self _lock_updateStatusForLoadingState:v10 error:v9 clipIdentifier:a5];

  os_unfair_lock_unlock(p_lock);
}

- (void)notifyVisibility:(unsigned __int8)a3 forClipIdentifier:(int64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v8 = [(PXStoryLoadingStatusReporter *)self _lock_stateForClipIdentifier:a4];
  v8->var2 = a3;
  [(PXStoryLoadingStatusReporter *)self _lock_updateStatusForLoadingState:v8 error:0 clipIdentifier:a4];
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyPreloadingCompleteForClipIdentifier:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(PXStoryLoadingStatusReporter *)self _lock_stateForClipIdentifier:a3];
  v6->var0 = 2;
  [(PXStoryLoadingStatusReporter *)self _lock_updateStatusForLoadingState:v6 error:0 clipIdentifier:a3];
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyPreloadingProgress:(double)a3 error:(id)a4 forClipIdentifier:(int64_t)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  os_unfair_lock_lock(&self->_lock);
  if (v8)
  {
    [(PXStoryLoadingStatusReporter *)self _lock_updateStatusForLoadingState:[(PXStoryLoadingStatusReporter *)self _lock_stateForClipIdentifier:a5] error:v8 clipIdentifier:a5];
  }
  else
  {
    id v9 = [(PXStoryLoadingStatusReporter *)self log];
    v10 = v9;
    if ((unint64_t)(a5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      int v11 = 134218240;
      unint64_t v12 = [(PXStoryLoadingStatusReporter *)self logContext];
      __int16 v13 = 2048;
      double v14 = a3;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v10, OS_SIGNPOST_EVENT, a5, "PXStoryClipLoadingProgress", "Context=%{signpost.telemetry:string2}lu %.2f", (uint8_t *)&v11, 0x16u);
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (void)notifyStartedPreloadingClipIdentifier:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(PXStoryLoadingStatusReporter *)self _lock_stateForClipIdentifier:a3];
  v6->var0 = 1;
  [(PXStoryLoadingStatusReporter *)self _lock_updateStatusForLoadingState:v6 error:0 clipIdentifier:a3];
  os_unfair_lock_unlock(p_lock);
}

- (void)notifyUserDidNavigate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [MEMORY[0x1E4F1C9C8] date];
  lock_lastUserActivity = self->_lock_lastUserActivity;
  self->_lock_lastUserActivity = v4;

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_updateStatusForLoadingState:(id *)a3 error:(id)a4 clipIdentifier:(int64_t)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int var2 = a3->var2;
  if (var2 == 2)
  {
    BOOL v12 = a3->var1 >= 5u;
    char v13 = 8 * a3->var1;
    uint64_t v14 = 134678022;
  }
  else
  {
    if (var2 != 1)
    {
      if (a3->var2)
      {
        unsigned __int8 v11 = 0;
      }
      else
      {
        int var0 = a3->var0;
        if (var0 == 2) {
          unsigned __int8 v11 = 2;
        }
        else {
          unsigned __int8 v11 = var0 == 1;
        }
      }
      goto LABEL_13;
    }
    BOOL v12 = a3->var1 >= 5u;
    char v13 = 8 * a3->var1;
    uint64_t v14 = 84148995;
  }
  unint64_t v15 = (v14 & 0xFFFF0000FFFFFFFFLL | 0x900000000) >> v13;
  if (v12) {
    unsigned __int8 v11 = 0;
  }
  else {
    unsigned __int8 v11 = v15;
  }
LABEL_13:
  if (a3->var3 != v11)
  {
    v16 = PXStoryClipLoadingStatusDescription(v11);
    v17 = [(PXStoryLoadingStatusReporter *)self log];
    v18 = v17;
    unint64_t v19 = a5 - 1;
    if ((unint64_t)(a5 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      int v26 = 134217984;
      unint64_t v27 = [(PXStoryLoadingStatusReporter *)self logContext];
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v18, OS_SIGNPOST_INTERVAL_END, a5, "PXStoryClipLoadingStatus", "Context=%{signpost.telemetry:string2}lu ", (uint8_t *)&v26, 0xCu);
    }

    v20 = [(PXStoryLoadingStatusReporter *)self log];
    v21 = v20;
    if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      unint64_t v22 = [(PXStoryLoadingStatusReporter *)self logContext];
      int v26 = 134219010;
      unint64_t v27 = v22;
      __int16 v28 = 2048;
      int64_t v29 = a5;
      __int16 v30 = 1024;
      int v31 = v11;
      __int16 v32 = 2114;
      v33 = v16;
      __int16 v34 = 2114;
      id v35 = v8;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v21, OS_SIGNPOST_EVENT, a5, "PXStoryClipLoadingStatus", "Context=%{signpost.telemetry:string2}lu ClipIdentifier=%{signpost.description:attribute}ld Status=%{signpost.description:attribute}d Description=%{signpost.description:attribute,public}@ Error=%{signpost.description:attribute,public}@", (uint8_t *)&v26, 0x30u);
    }

    v23 = [(PXStoryLoadingStatusReporter *)self log];
    v24 = v23;
    if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      unint64_t v25 = [(PXStoryLoadingStatusReporter *)self logContext];
      int v26 = 134219010;
      unint64_t v27 = v25;
      __int16 v28 = 2048;
      int64_t v29 = a5;
      __int16 v30 = 1024;
      int v31 = v11;
      __int16 v32 = 2114;
      v33 = v16;
      __int16 v34 = 2114;
      id v35 = v8;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v24, OS_SIGNPOST_INTERVAL_BEGIN, a5, "PXStoryClipLoadingStatus", "Context=%{signpost.telemetry:string2}lu ClipIdentifier=%{signpost.description:attribute}ld Status=%{signpost.description:attribute}d Description=%{signpost.description:attribute,public}@ Error=%{signpost.description:attribute,public}@", (uint8_t *)&v26, 0x30u);
    }
  }
  a3->var3 = v11;
}

- ($14D77461FF5D83CAEC4252578BA76F85)_lock_stateForClipIdentifier:(int64_t)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  lock_stateIndexByClipIdentifier = self->_lock_stateIndexByClipIdentifier;
  v6 = [NSNumber numberWithInteger:a3];
  v7 = [(NSMutableDictionary *)lock_stateIndexByClipIdentifier objectForKeyedSubscript:v6];

  if (!v7)
  {
    [NSNumber numberWithUnsignedInteger:self->_lock_statesCount];
    objc_claimAutoreleasedReturnValue();
    ++self->_lock_statesCount;
    _PXGArrayCapacityResizeToCount();
  }
  lock_states = self->_lock_states;
  id v9 = &lock_states[[v7 integerValue]];

  return v9;
}

- (void)dealloc
{
  free(self->_lock_states);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryLoadingStatusReporter;
  [(PXStoryLoadingStatusReporter *)&v3 dealloc];
}

- (PXStoryLoadingStatusReporter)init
{
  if (PFOSVariantHasInternalDiagnostics())
  {
    v9.receiver = self;
    v9.super_class = (Class)PXStoryLoadingStatusReporter;
    objc_super v3 = [(PXStoryLoadingStatusReporter *)&v9 init];
    v4 = v3;
    if (v3)
    {
      v3->_lock._os_unfair_lock_opaque = 0;
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      lock_stateIndexByClipIdentifier = v4->_lock_stateIndexByClipIdentifier;
      v4->_lock_stateIndexByClipIdentifier = v5;
    }
    self = v4;
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end