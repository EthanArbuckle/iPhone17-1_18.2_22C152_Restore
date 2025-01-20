@interface _UIFeedbackSystemSoundEngine
+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3;
+ (id)_internalQueue;
+ (id)sharedEngine;
- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5;
- (BOOL)_internal_prepareSystemSoundID:(unsigned int)a3 forBeingActive:(BOOL)a4;
- (NSCountedSet)suspendedSSIDs;
- (NSCountedSet)warmSSIDs;
- (id)_stats_key;
- (id)invalidationBlock;
- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3;
- (void)_internal_performForEachSSIDsInFeedbacks:(id)a3 block:(id)a4;
- (void)_internal_playFeedbackDataNow:(id)a3 forFeedback:(id)a4 withOptions:(id)a5;
- (void)_internal_startWarmingFeedbacks:(id)a3;
- (void)_internal_stopFeedbackData:(id)a3 forFeedback:(id)a4;
- (void)_internal_stopWarmingFeedbacks:(id)a3;
- (void)_internal_updateSuspension;
- (void)_playFeedback:(id)a3 atTime:(double)a4;
- (void)_stopFeedback:(id)a3;
- (void)setInvalidationBlock:(id)a3;
@end

@implementation _UIFeedbackSystemSoundEngine

- (void)_internal_startWarmingFeedbacks:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() _internalQueue];

  if (!self->_warmSSIDs)
  {
    v5 = [MEMORY[0x1E4F28BD0] set];
    warmSSIDs = self->_warmSSIDs;
    self->_warmSSIDs = v5;
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __64___UIFeedbackSystemSoundEngine__internal_startWarmingFeedbacks___block_invoke;
  v7[3] = &unk_1E52EDB38;
  v7[4] = self;
  [(_UIFeedbackSystemSoundEngine *)self _internal_performForEachSSIDsInFeedbacks:v4 block:v7];
}

- (void)_internal_performForEachSSIDsInFeedbacks:(id)a3 block:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [(id)objc_opt_class() _internalQueue];

  v7 = [MEMORY[0x1E4F28E60] indexSet];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = [*(id *)(*((void *)&v17 + 1) + 8 * v12) _allSystemSoundIDs];
        [v7 addIndexes:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __79___UIFeedbackSystemSoundEngine__internal_performForEachSSIDsInFeedbacks_block___block_invoke;
  v15[3] = &unk_1E52EDB10;
  id v16 = v6;
  id v14 = v6;
  [v7 enumerateIndexesUsingBlock:v15];
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  v3 = [a3 _allSystemSoundIDs];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

+ (id)sharedEngine
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___UIFeedbackSystemSoundEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C950 != -1) {
    dispatch_once(&qword_1EB25C950, block);
  }
  v2 = (void *)qword_1EB25C958;
  return v2;
}

- (id)_stats_key
{
  return @"systemSound";
}

- (BOOL)_internal_prepareSystemSoundID:(unsigned int)a3 forBeingActive:(BOOL)a4
{
  BOOL v4 = a4;
  unsigned int v11 = a3;
  [(id)objc_opt_class() _internalQueue];

  BOOL v10 = v4;
  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x2020000000;
  id v5 = (unsigned int (*)(uint64_t, uint64_t, unsigned int *, uint64_t, BOOL *))getAudioServicesSetPropertySymbolLoc_ptr;
  long long v20 = getAudioServicesSetPropertySymbolLoc_ptr;
  if (!getAudioServicesSetPropertySymbolLoc_ptr)
  {
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = __getAudioServicesSetPropertySymbolLoc_block_invoke;
    v15 = &unk_1E52D9900;
    id v16 = &v17;
    id v6 = AudioToolboxLibrary();
    v18[3] = (uint64_t)dlsym(v6, "AudioServicesSetProperty");
    getAudioServicesSetPropertySymbolLoc_ptr = *(_UNKNOWN **)(v16[1] + 24);
    id v5 = (unsigned int (*)(uint64_t, uint64_t, unsigned int *, uint64_t, BOOL *))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v5) {
    return v5(1633907828, 4, &v11, 4, &v10) == 0;
  }
  id v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = objc_msgSend(NSString, "stringWithUTF8String:", "OSStatus __AudioServicesSetProperty(AudioServicesPropertyID, UInt32, const void * _Nullable, UInt32, const void *)");
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"_UIFeedbackSystemSoundEngine.m", 26, @"%s", dlerror());

  __break(1u);
  return result;
}

+ (id)_internalQueue
{
  if (qword_1EB25C948 != -1) {
    dispatch_once(&qword_1EB25C948, &__block_literal_global_198);
  }
  v2 = (void *)_MergedGlobals_5_8;
  return v2;
}

- (void)_internal_updateSuspension
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  v26.receiver = self;
  v26.super_class = (Class)_UIFeedbackSystemSoundEngine;
  [(_UIFeedbackEngine *)&v26 _internal_updateSuspension];
  if ([(_UIFeedbackEngine *)self _internal_isSuspended])
  {
    if ([(NSCountedSet *)self->_warmSSIDs count])
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      v3 = self->_warmSSIDs;
      uint64_t v4 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v4)
      {
        uint64_t v5 = v4;
        uint64_t v6 = *(void *)v23;
        do
        {
          uint64_t v7 = 0;
          do
          {
            if (*(void *)v23 != v6) {
              objc_enumerationMutation(v3);
            }
            -[_UIFeedbackSystemSoundEngine _internal_prepareSystemSoundID:forBeingActive:](self, "_internal_prepareSystemSoundID:forBeingActive:", [*(id *)(*((void *)&v22 + 1) + 8 * v7++) unsignedIntValue], 0);
          }
          while (v5 != v7);
          uint64_t v5 = [(NSCountedSet *)v3 countByEnumeratingWithState:&v22 objects:v28 count:16];
        }
        while (v5);
      }

      id v8 = (NSCountedSet *)[(NSCountedSet *)self->_warmSSIDs copy];
      suspendedSSIDs = self->_suspendedSSIDs;
      self->_suspendedSSIDs = v8;

      [(NSCountedSet *)self->_warmSSIDs removeAllObjects];
    }
  }
  else if ([(NSCountedSet *)self->_suspendedSSIDs count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    BOOL v10 = self->_suspendedSSIDs;
    uint64_t v11 = [(NSCountedSet *)v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          -[_UIFeedbackSystemSoundEngine _internal_prepareSystemSoundID:forBeingActive:](self, "_internal_prepareSystemSoundID:forBeingActive:", objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14++), "unsignedIntValue", (void)v18), 1);
        }
        while (v12 != v14);
        uint64_t v12 = [(NSCountedSet *)v10 countByEnumeratingWithState:&v18 objects:v27 count:16];
      }
      while (v12);
    }

    v15 = (NSCountedSet *)[(NSCountedSet *)self->_suspendedSSIDs copy];
    warmSSIDs = self->_warmSSIDs;
    self->_warmSSIDs = v15;

    uint64_t v17 = self->_suspendedSSIDs;
    self->_suspendedSSIDs = 0;
  }
}

- (void)_internal_stopWarmingFeedbacks:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() _internalQueue];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63___UIFeedbackSystemSoundEngine__internal_stopWarmingFeedbacks___block_invoke;
  v5[3] = &unk_1E52EDB38;
  v5[4] = self;
  [(_UIFeedbackSystemSoundEngine *)self _internal_performForEachSSIDsInFeedbacks:v4 block:v5];
}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  id v4 = (void (**)(id, _UIFeedbackSystemSoundEngine *))a3;
  [(id)objc_opt_class() _internalQueue];

  v4[2](v4, self);
}

- (void)_playFeedback:(id)a3 atTime:(double)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 _effectiveFeedbackData];
  id v8 = [(id)objc_opt_class() _internalQueue];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __53___UIFeedbackSystemSoundEngine__playFeedback_atTime___block_invoke;
  v14[3] = &unk_1E52ED900;
  v14[4] = self;
  id v15 = v7;
  id v16 = v6;
  double v17 = a4;
  uint64_t v9 = v8;
  if (!v8)
  {
    uint64_t v9 = MEMORY[0x1E4F14428];
    id v10 = MEMORY[0x1E4F14428];
  }
  uint64_t v11 = v8;
  id v12 = v6;
  id v13 = v7;
  dispatch_async(v9, v14);
}

- (BOOL)_internal_playFeedbackData:(id)a3 forFeedback:(id)a4 atTime:(double)a5
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(id)objc_opt_class() _internalQueue];

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v11 = [v8 count];
  if (has_internal_diagnostics)
  {
    if (v11 != 1)
    {
      v35 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
      {
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = [v8 count];
        _os_log_fault_impl(&dword_1853B0000, v35, OS_LOG_TYPE_FAULT, "_UIFeedbackSystemSoundEngine only supports playing single feedbacks. Instead got: %lu", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else if (v11 != 1)
  {
    v36 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C960) + 8);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      v38 = v36;
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v8 count];
      _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_ERROR, "_UIFeedbackSystemSoundEngine only supports playing single feedbacks. Instead got: %lu", (uint8_t *)&buf, 0xCu);
    }
  }
  id v12 = [v8 firstObject];
  char v13 = [v12 effectiveEnabledFeedbackTypes];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__82;
  v65 = __Block_byref_object_dispose__82;
  id v66 = 0;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v55 = __78___UIFeedbackSystemSoundEngine__internal_playFeedbackData_forFeedback_atTime___block_invoke;
  v56 = &unk_1E52EDB60;
  p_long long buf = &buf;
  uint64_t v14 = (v13 & 2 | ((v13 & 1) == 0)) ^ 2u;
  if (v14)
  {
    uint64_t v58 = 0;
    v59 = &v58;
    uint64_t v60 = 0x2020000000;
    id v15 = (id *)qword_1EB25C970;
    uint64_t v61 = qword_1EB25C970;
    if (!qword_1EB25C970)
    {
      uint64_t v48 = MEMORY[0x1E4F143A8];
      uint64_t v49 = 3221225472;
      uint64_t v50 = (uint64_t)__getkAudioServicesPlaySystemSoundOptionFlagsKeySymbolLoc_block_invoke;
      v51 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52D9900;
      v52 = (void (*)(uint64_t))&v58;
      id v16 = AudioToolboxLibrary();
      v59[3] = (uint64_t)dlsym(v16, "kAudioServicesPlaySystemSoundOptionFlagsKey");
      qword_1EB25C970 = *(void *)(*((void *)v52 + 1) + 24);
      id v15 = (id *)v59[3];
    }
    _Block_object_dispose(&v58, 8);
    if (!v15)
    {
      v39 = [MEMORY[0x1E4F28B00] currentHandler];
      v40 = [NSString stringWithUTF8String:"NSString *getkAudioServicesPlaySystemSoundOptionFlagsKey(void)"];
      objc_msgSend(v39, "handleFailureInFunction:file:lineNumber:description:", v40, @"_UIFeedbackSystemSoundEngine.m", 27, @"%s", dlerror());

      goto LABEL_26;
    }
    id v17 = *v15;
    long long v18 = [NSNumber numberWithUnsignedInt:v14];
    v55((uint64_t)v54, v17, v18);
  }
  long long v19 = [v12 audioParameters];
  [v19 _effectiveVolume];
  float v21 = v20;

  if (v21 >= 1.0) {
    goto LABEL_14;
  }
  uint64_t v58 = 0;
  v59 = &v58;
  uint64_t v60 = 0x2020000000;
  long long v22 = (id *)qword_1EB25C978;
  uint64_t v61 = qword_1EB25C978;
  if (!qword_1EB25C978)
  {
    uint64_t v48 = MEMORY[0x1E4F143A8];
    uint64_t v49 = 3221225472;
    uint64_t v50 = (uint64_t)__getkAudioServicesPlaySystemSoundOptionVolumeKeySymbolLoc_block_invoke;
    v51 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E52D9900;
    v52 = (void (*)(uint64_t))&v58;
    long long v23 = AudioToolboxLibrary();
    v59[3] = (uint64_t)dlsym(v23, "kAudioServicesPlaySystemSoundOptionVolumeKey");
    qword_1EB25C978 = *(void *)(*((void *)v52 + 1) + 24);
    long long v22 = (id *)v59[3];
  }
  _Block_object_dispose(&v58, 8);
  if (!v22)
  {
    v41 = [MEMORY[0x1E4F28B00] currentHandler];
    v42 = [NSString stringWithUTF8String:"NSString *getkAudioServicesPlaySystemSoundOptionVolumeKey(void)"];
    objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, @"_UIFeedbackSystemSoundEngine.m", 28, @"%s", dlerror());

LABEL_26:
    __break(1u);
  }
  id v24 = *v22;
  *(float *)&double v25 = v21;
  objc_super v26 = [NSNumber numberWithFloat:v25];
  v55((uint64_t)v54, v24, v26);

LABEL_14:
  [(_UIFeedbackEngine *)self currentTime];
  double v28 = a5 - v27;
  if (v28 <= 0.0)
  {
    [(_UIFeedbackSystemSoundEngine *)self _internal_playFeedbackDataNow:v12 forFeedback:v9 withOptions:*(void *)(*((void *)&buf + 1) + 40)];
  }
  else
  {
    uint64_t v48 = 0;
    uint64_t v49 = (uint64_t)&v48;
    uint64_t v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__82;
    v52 = __Block_byref_object_dispose__82;
    id v53 = 0;
    uint64_t v29 = [(id)objc_opt_class() _internalQueue];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __78___UIFeedbackSystemSoundEngine__internal_playFeedbackData_forFeedback_atTime___block_invoke_2;
    v43[3] = &unk_1E52EDB88;
    v43[4] = self;
    id v44 = v12;
    id v30 = v9;
    id v45 = v30;
    v46 = &buf;
    v47 = &v48;
    uint64_t v31 = _UIFeedbackPreciseDispatchAfter(v29, v43, v28);
    v32 = *(void **)(v49 + 40);
    *(void *)(v49 + 40) = v31;

    v33 = [v30 systemSoundSources];
    [v33 addObject:*(void *)(v49 + 40)];

    _Block_object_dispose(&v48, 8);
  }
  _Block_object_dispose(&buf, 8);

  return 1;
}

- (void)_internal_playFeedbackDataNow:(id)a3 forFeedback:(id)a4 withOptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(id)objc_opt_class() _internalQueue];

  uint64_t v11 = [v8 effectiveSystemSoundID];
  [(_UIFeedbackEngine *)self currentTime];
  -[_UIFeedbackEngine _internal_willPlayFeedback:atTime:](self, "_internal_willPlayFeedback:atTime:", v9);
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x2020000000;
  id v12 = (void (*)(uint64_t, id, void))getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_ptr;
  long long v19 = getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_ptr;
  if (!getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_ptr)
  {
    char v13 = AudioToolboxLibrary();
    v17[3] = (uint64_t)dlsym(v13, "AudioServicesPlaySystemSoundWithOptions");
    getAudioServicesPlaySystemSoundWithOptionsSymbolLoc_ptr = (_UNKNOWN *)v17[3];
    id v12 = (void (*)(uint64_t, id, void))v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v12)
  {
    v12(v11, v10, 0);
    kdebug_trace();
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    id v15 = objc_msgSend(NSString, "stringWithUTF8String:", "void __AudioServicesPlaySystemSoundWithOptions(SystemSoundID, CFDictionaryRef, __strong dispatch_block_t)");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, @"_UIFeedbackSystemSoundEngine.m", 24, @"%s", dlerror());

    __break(1u);
  }
}

- (void)_stopFeedback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 _effectiveFeedbackData];
  id v6 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___UIFeedbackSystemSoundEngine__stopFeedback___block_invoke;
  block[3] = &unk_1E52DCB30;
  block[4] = self;
  id v13 = v5;
  id v14 = v4;
  uint64_t v7 = v6;
  if (!v6)
  {
    uint64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
  }
  id v9 = v6;
  id v10 = v4;
  id v11 = v5;
  dispatch_async(v7, block);
}

- (void)_internal_stopFeedbackData:(id)a3 forFeedback:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [(id)objc_opt_class() _internalQueue];
  p_long long buf = &buf;

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v9 = [v5 count];
  if (has_internal_diagnostics)
  {
    if (v9 != 1)
    {
      float v20 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        uint64_t v24 = [v5 count];
        LODWORD(buf) = 134217984;
        *(void *)((char *)&buf + 4) = v24;
        _os_log_fault_impl(&dword_1853B0000, v20, OS_LOG_TYPE_FAULT, "_UIFeedbackSystemSoundEngine only supports playing single feedbacks. Instead got: %lu", (uint8_t *)&buf, 0xCu);
      }
    }
  }
  else if (v9 != 1)
  {
    goto LABEL_19;
  }
  while (1)
  {
    id v10 = [v5 firstObject];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v11 = [v6 systemSoundSources];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v11);
          }
          dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v25 + 1) + 8 * i));
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v12);
    }

    id v15 = [v6 systemSoundSources];
    [v15 removeAllObjects];

    p_long long buf = (long long *)[v10 effectiveSystemSoundID];
    uint64_t v16 = +[_UIFeedbackSystemSoundEngine sharedEngine];
    objc_msgSend(v16, "_internal_willCancelFeedback:", v6);

    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    id v17 = (void (*)(long long *, uint64_t))off_1EB25C980;
    v32 = off_1EB25C980;
    if (!off_1EB25C980)
    {
      *(void *)&long long buf = MEMORY[0x1E4F143A8];
      *((void *)&buf + 1) = 3221225472;
      v35 = __getAudioServicesStopSystemSoundSymbolLoc_block_invoke;
      v36 = &unk_1E52D9900;
      v37 = &v29;
      uint64_t v18 = AudioToolboxLibrary();
      long long v19 = dlsym(v18, "AudioServicesStopSystemSound");
      *(void *)(v37[1] + 24) = v19;
      off_1EB25C980 = *(_UNKNOWN **)(v37[1] + 24);
      id v17 = (void (*)(long long *, uint64_t))v30[3];
    }
    _Block_object_dispose(&v29, 8);
    if (v17) {
      break;
    }
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(NSString, "stringWithUTF8String:", "void __AudioServicesStopSystemSound(SystemSoundID, Boolean)");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, @"_UIFeedbackSystemSoundEngine.m", 25, @"%s", dlerror());

    __break(1u);
LABEL_19:
    float v21 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25C968) + 8);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      long long v22 = v21;
      uint64_t v23 = [v5 count];
      LODWORD(buf) = 134217984;
      *(void *)((char *)p_buf + 4) = v23;
      _os_log_impl(&dword_1853B0000, v22, OS_LOG_TYPE_ERROR, "_UIFeedbackSystemSoundEngine only supports playing single feedbacks. Instead got: %lu", (uint8_t *)&buf, 0xCu);
    }
  }
  v17(p_buf, 1);
}

- (id)invalidationBlock
{
  return self->_invalidationBlock;
}

- (void)setInvalidationBlock:(id)a3
{
}

- (NSCountedSet)warmSSIDs
{
  return self->_warmSSIDs;
}

- (NSCountedSet)suspendedSSIDs
{
  return self->_suspendedSSIDs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suspendedSSIDs, 0);
  objc_storeStrong((id *)&self->_warmSSIDs, 0);
  objc_storeStrong(&self->_invalidationBlock, 0);
}

@end