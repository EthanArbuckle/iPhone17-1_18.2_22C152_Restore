@interface _UIFeedbackCoreHapticsEngine
+ (BOOL)_supportsAbortingDeactivation;
+ (BOOL)_supportsPlayingFeedbackPatternsDirectly;
+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3;
+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3 allowsIgnoreCapture:(BOOL)a4;
+ (id)_additionalEngineOptions;
+ (id)_internalQueue;
+ (id)sharedEngine;
+ (void)_setHapticEngineCreationBlock:(id)a3;
+ (void)_setHapticPatternClass:(Class)a3;
- (BOOL)_internal_initializeCoreHapticsEngine;
- (CHHapticEngine)coreHapticsEngine;
- (_UIFeedbackCoreHapticsEngine)init;
- (id)_internal_createCoreHapticsEngine;
- (id)_stats_key;
- (void)_coreHapticsEngineStoppedForReason:(int64_t)a3;
- (void)_internal_activateUnderlyingPlayerWithCompletion:(id)a3;
- (void)_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion:(id)a3;
- (void)_internal_coreHapticsEngineFinishedWithError:(id)a3 completion:(id)a4;
- (void)_internal_coreHapticsEngineStoppedForReason:(int64_t)a3;
- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3;
- (void)_internal_prewarmUnderlyingPlayerWithCompletion:(id)a3;
- (void)_internal_resetCoreHapticsEngine;
- (void)_internal_startRunningFeedbackPlayerWithCompletion:(id)a3;
- (void)_internal_teardownUnderlyingPlayerIfPossibleWithCompletion:(id)a3;
- (void)_resetCoreHapticsEngine;
@end

@implementation _UIFeedbackCoreHapticsEngine

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3 allowsIgnoreCapture:(BOOL)a4
{
  int v4 = a4;
  id v5 = a3;
  v6 = +[UIDevice currentDevice];
  uint64_t v7 = [v6 _feedbackSupportLevel];

  if (v7 < 2)
  {
LABEL_2:
    LOBYTE(v4) = 0;
    goto LABEL_7;
  }
  if ((~[v5 hapticOutputMode] & 5) != 0 || v4)
  {
    if (([v5 _effectiveFeedbackTypes] & 3) != 0)
    {
      char v8 = objc_opt_respondsToSelector();
      char v9 = objc_opt_respondsToSelector();
      char v10 = objc_opt_respondsToSelector();
      v11 = _coreHapticsEventTypeForEffectiveEventType([v5 _effectiveEventType], 0);
      LOBYTE(v4) = v9 | v10 | v8 | (v11 != 0);

      goto LABEL_7;
    }
    goto LABEL_2;
  }
LABEL_7:

  return v4 & 1;
}

+ (BOOL)_supportsPlayingIndividualFeedback:(id)a3
{
  return [a1 _supportsPlayingIndividualFeedback:a3 allowsIgnoreCapture:0];
}

- (id)_stats_key
{
  return @"haptic";
}

+ (id)_internalQueue
{
  if (qword_1EB25CC20 != -1) {
    dispatch_once(&qword_1EB25CC20, &__block_literal_global_195);
  }
  v2 = (void *)qword_1EB25CC18;
  return v2;
}

- (void)_internal_prewarmUnderlyingPlayerWithCompletion:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() _internalQueue];

  if ([(_UIFeedbackCoreHapticsEngine *)self _internal_initializeCoreHapticsEngine]&& [(_UIFeedbackEngine *)self _state])
  {
    id v5 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __80___UIFeedbackCoreHapticsEngine__internal_prewarmUnderlyingPlayerWithCompletion___block_invoke;
    v6[3] = &unk_1E52EAD40;
    v6[4] = self;
    id v7 = v4;
    [v5 prewarmWithCompletionHandler:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)_internal_activateUnderlyingPlayerWithCompletion:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void))a3;
  [(id)objc_opt_class() _internalQueue];

  if (!_UIFeedbackLoggingDisabled)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_activateUnderlyingPlayerWithCompletion____s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = NSString;
      id v7 = self;
      char v8 = v5;
      char v9 = objc_msgSend(v6, "stringWithFormat:", @"<%s: %p>", object_getClassName(v7), v7);

      *(_DWORD *)buf = 138412290;
      v11 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "starting core haptics engine for %@", buf, 0xCu);
    }
  }
  if ([(_UIFeedbackCoreHapticsEngine *)self _internal_initializeCoreHapticsEngine]&& [(_UIFeedbackEngine *)self _state]&& [(_UIFeedbackEngine *)self _state] != 2)
  {
    [(_UIFeedbackCoreHapticsEngine *)self _internal_startRunningFeedbackPlayerWithCompletion:v4];
  }
  else
  {
    v4[2](v4, 0);
  }
}

- (void)_internal_startRunningFeedbackPlayerWithCompletion:(id)a3
{
  id v4 = a3;
  [(id)objc_opt_class() _internalQueue];

  id v5 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __83___UIFeedbackCoreHapticsEngine__internal_startRunningFeedbackPlayerWithCompletion___block_invoke;
  v7[3] = &unk_1E52EAD40;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 startWithCompletionHandler:v7];
}

- (void)_internal_teardownUnderlyingPlayerIfPossibleWithCompletion:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  [(id)objc_opt_class() _internalQueue];

  if (!_UIFeedbackLoggingDisabled)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_teardownUnderlyingPlayerIfPossibleWithCompletion____s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = NSString;
      id v7 = self;
      id v8 = v5;
      char v9 = objc_msgSend(v6, "stringWithFormat:", @"<%s: %p>", object_getClassName(v7), v7);

      *(_DWORD *)buf = 138412290;
      v19 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "_internal_teardownUnderlyingPlayerIfPossible %@", buf, 0xCu);
    }
  }
  if (![(_UIFeedbackEngine *)self _state]
    || ([(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine],
        char v10 = objc_claimAutoreleasedReturnValue(),
        BOOL v11 = v10 == 0,
        v10,
        v11))
  {
    v4[2](v4, 1);
  }
  else
  {
    [(_UIFeedbackEngine *)self _setState:5];
    playersToInvalidate = self->_playersToInvalidate;
    v13 = [(NSMutableSet *)self->_playersInUse allObjects];
    [(NSMutableSet *)playersToInvalidate addObjectsFromArray:v13];

    [(NSMutableSet *)self->_playersInUse removeAllObjects];
    objc_initWeak((id *)buf, self);
    v14 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __91___UIFeedbackCoreHapticsEngine__internal_teardownUnderlyingPlayerIfPossibleWithCompletion___block_invoke;
    v15[3] = &unk_1E52ED888;
    objc_copyWeak(&v17, (id *)buf);
    v15[4] = self;
    v16 = v4;
    [v14 notifyWhenPlayersFinished:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

- (BOOL)_internal_initializeCoreHapticsEngine
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  v3 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];

  if (v3
    || ([(_UIFeedbackCoreHapticsEngine *)self _internal_createCoreHapticsEngine],
        (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];

    if (v4) {
      return 1;
    }
  }
  if (!_UIFeedbackLoggingDisabled)
  {
    id v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_initializeCoreHapticsEngine___s_category) + 8);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = NSString;
      id v8 = self;
      char v9 = v6;
      char v10 = objc_msgSend(v7, "stringWithFormat:", @"<%s: %p>", object_getClassName(v8), v8);

      *(_DWORD *)buf = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      v14 = v4;
      _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "failed initializing core haptics engine for %@: %@", buf, 0x16u);
    }
  }
  [(_UIFeedbackCoreHapticsEngine *)self _internal_resetCoreHapticsEngine];

  return 0;
}

- (CHHapticEngine)coreHapticsEngine
{
  return self->_coreHapticsEngine;
}

- (id)_internal_createCoreHapticsEngine
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  if (!_UIFeedbackLoggingDisabled)
  {
    v3 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC40) + 8);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = NSString;
      id v5 = self;
      id v6 = v3;
      id v7 = objc_msgSend(v4, "stringWithFormat:", @"<%s: %p>", object_getClassName(v5), v5);

      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "creating core haptics engine for %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (_MergedGlobals_3_10)
  {
    (*(void (**)(void))(_MergedGlobals_3_10 + 16))();
    id v8 = (CHHapticEngine *)objc_claimAutoreleasedReturnValue();
    id v9 = 0;
    goto LABEL_18;
  }
  char v10 = getCHHapticEngineOptionKeyLocality();
  v49[0] = v10;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  BOOL v11 = (id *)qword_1EB25CD38;
  uint64_t v48 = qword_1EB25CD38;
  if (!qword_1EB25CD38)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v53 = __getCHHapticLocalityFullGamutSymbolLoc_block_invoke;
    v54 = &unk_1E52D9900;
    v55 = &v45;
    uint64_t v12 = CoreHapticsLibrary_1();
    __int16 v13 = dlsym(v12, "CHHapticLocalityFullGamut");
    *(void *)(v55[1] + 24) = v13;
    qword_1EB25CD38 = *(void *)(v55[1] + 24);
    BOOL v11 = (id *)v46[3];
  }
  _Block_object_dispose(&v45, 8);
  if (!v11)
  {
    v34 = [MEMORY[0x1E4F28B00] currentHandler];
    v35 = [NSString stringWithUTF8String:"CHHapticLocality getCHHapticLocalityFullGamut(void)"];
    objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, @"_UIFeedbackCoreHapticsEngineUtilities.h", 29, @"%s", dlerror());

    goto LABEL_27;
  }
  id v14 = *v11;
  id v50 = v14;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  uint64_t v15 = (id *)qword_1EB25CD40;
  uint64_t v48 = qword_1EB25CD40;
  if (!qword_1EB25CD40)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v53 = __getCHHapticEngineOptionKeyUsageCategorySymbolLoc_block_invoke;
    v54 = &unk_1E52D9900;
    v55 = &v45;
    v16 = CoreHapticsLibrary_1();
    id v17 = dlsym(v16, "CHHapticEngineOptionKeyUsageCategory");
    *(void *)(v55[1] + 24) = v17;
    qword_1EB25CD40 = *(void *)(v55[1] + 24);
    uint64_t v15 = (id *)v46[3];
  }
  _Block_object_dispose(&v45, 8);
  if (!v15)
  {
    v36 = [MEMORY[0x1E4F28B00] currentHandler];
    v37 = [NSString stringWithUTF8String:"CHHapticEngineOptionKey getCHHapticEngineOptionKeyUsageCategory(void)"];
    objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, @"_UIFeedbackCoreHapticsEngineUtilities.h", 31, @"%s", dlerror());

    goto LABEL_27;
  }
  id v18 = *v15;
  v49[1] = v18;
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x2020000000;
  v19 = (id *)qword_1EB25CD48;
  uint64_t v48 = qword_1EB25CD48;
  if (!qword_1EB25CD48)
  {
    *(void *)&long long buf = MEMORY[0x1E4F143A8];
    *((void *)&buf + 1) = 3221225472;
    v53 = __getCHHapticUsageCategoryUIFeedbackSymbolLoc_block_invoke;
    v54 = &unk_1E52D9900;
    v55 = &v45;
    uint64_t v20 = CoreHapticsLibrary_1();
    v21 = dlsym(v20, "CHHapticUsageCategoryUIFeedback");
    *(void *)(v55[1] + 24) = v21;
    qword_1EB25CD48 = *(void *)(v55[1] + 24);
    v19 = (id *)v46[3];
  }
  _Block_object_dispose(&v45, 8);
  if (!v19)
  {
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    v39 = [NSString stringWithUTF8String:"CHHapticUsageCategory getCHHapticUsageCategoryUIFeedback(void)"];
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, @"_UIFeedbackCoreHapticsEngineUtilities.h", 32, @"%s", dlerror());

LABEL_27:
    __break(1u);
  }
  id v51 = *v19;
  v22 = (void *)MEMORY[0x1E4F1C9E8];
  id v23 = v51;
  v24 = [v22 dictionaryWithObjects:&v50 forKeys:v49 count:2];

  v25 = [(id)objc_opt_class() _additionalEngineOptions];
  if (v25)
  {
    uint64_t v26 = objc_msgSend(v24, "bs_dictionaryByAddingEntriesFromDictionary:", v25);

    v24 = (void *)v26;
  }
  id v44 = 0;
  id v8 = (CHHapticEngine *)[objc_alloc((Class)getCHHapticEngineClass()) initWithAudioSession:0 sessionIsShared:0 options:v24 error:&v44];
  id v9 = v44;

LABEL_18:
  if (!v9 && v8)
  {
    objc_initWeak((id *)&buf, self);
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __65___UIFeedbackCoreHapticsEngine__internal_createCoreHapticsEngine__block_invoke;
    v42[3] = &unk_1E52DC6C0;
    objc_copyWeak(&v43, (id *)&buf);
    [(CHHapticEngine *)v8 setStoppedHandler:v42];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __65___UIFeedbackCoreHapticsEngine__internal_createCoreHapticsEngine__block_invoke_12;
    v40[3] = &unk_1E52DC308;
    objc_copyWeak(&v41, (id *)&buf);
    [(CHHapticEngine *)v8 setResetHandler:v40];
    objc_destroyWeak(&v41);
    objc_destroyWeak(&v43);
    objc_destroyWeak((id *)&buf);
  }
  v27 = [MEMORY[0x1E4F1CA80] set];
  playersInUse = self->_playersInUse;
  self->_playersInUse = v27;

  v29 = [MEMORY[0x1E4F1CA80] set];
  playersToInvalidate = self->_playersToInvalidate;
  self->_playersToInvalidate = v29;

  coreHapticsEngine = self->_coreHapticsEngine;
  self->_coreHapticsEngine = v8;
  v32 = v8;

  return v9;
}

+ (id)_additionalEngineOptions
{
  return 0;
}

- (_UIFeedbackCoreHapticsEngine)init
{
  v3.receiver = self;
  v3.super_class = (Class)_UIFeedbackCoreHapticsEngine;
  return [(_UIFeedbackEngine *)&v3 init];
}

- (void)_internal_dequeueReusableFeedbackPlayerWithCompletionBlock:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __91___UIFeedbackCoreHapticsEngine__internal_dequeueReusableFeedbackPlayerWithCompletionBlock___block_invoke;
  char v10 = &unk_1E52E45A0;
  BOOL v11 = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = (void (**)(void *, void))_Block_copy(&v7);
  switch([(_UIFeedbackEngine *)self _state])
  {
    case 0:
    case 1:
    case 2:
    case 5:
      v6[2](v6, 0);
      break;
    case 3:
      [(_UIFeedbackEngine *)self _internal_performAtState:4 block:v6];
      break;
    case 4:
      v6[2](v6, 1);
      break;
    default:
      break;
  }
}

- (void)_internal_coreHapticsEngineFinishedWithError:(id)a3 completion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t))a4;
  [(id)objc_opt_class() _internalQueue];

  if (!_UIFeedbackLoggingDisabled)
  {
    uint64_t v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC48) + 8);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = NSString;
      char v10 = self;
      BOOL v11 = v8;
      id v12 = objc_msgSend(v9, "stringWithFormat:", @"<%s: %p>", object_getClassName(v10), v10);

      *(_DWORD *)long long buf = 138412290;
      v27 = v12;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "core haptics engine finished for %@", buf, 0xCu);
    }
  }
  if (v6)
  {
    if (!_UIFeedbackLoggingDisabled)
    {
      __int16 v13 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC50) + 8);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        id v14 = NSString;
        uint64_t v15 = self;
        v16 = v13;
        id v17 = objc_msgSend(v14, "stringWithFormat:", @"<%s: %p>", object_getClassName(v15), v15);

        *(_DWORD *)long long buf = 138412546;
        v27 = v17;
        __int16 v28 = 2112;
        id v29 = v6;
        _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "core haptics engine finished for %@ with error: %@", buf, 0x16u);
      }
    }
    [(_UIFeedbackCoreHapticsEngine *)self _internal_resetCoreHapticsEngine];
  }
  else if ([(_UIFeedbackEngine *)self _state] != 5)
  {
    uint64_t v24 = 0;
    goto LABEL_14;
  }
  if (!_UIFeedbackLoggingDisabled)
  {
    id v18 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &qword_1EB25CC58) + 8);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = NSString;
      uint64_t v20 = self;
      v21 = v18;
      v22 = objc_msgSend(v19, "stringWithFormat:", @"<%s: %p>", object_getClassName(v20), v20);

      *(_DWORD *)long long buf = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1853B0000, v21, OS_LOG_TYPE_DEFAULT, "stopping core haptics engine for %@", buf, 0xCu);
    }
  }
  id v23 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __88___UIFeedbackCoreHapticsEngine__internal_coreHapticsEngineFinishedWithError_completion___block_invoke;
  v25[3] = &unk_1E52E3C18;
  v25[4] = self;
  [v23 stopWithCompletionHandler:v25];

  uint64_t v24 = 1;
LABEL_14:
  v7[2](v7, v24);
}

+ (id)sharedEngine
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44___UIFeedbackCoreHapticsEngine_sharedEngine__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25CC28 != -1) {
    dispatch_once(&qword_1EB25CC28, block);
  }
  v2 = (void *)qword_1EB25CC30;
  return v2;
}

+ (BOOL)_supportsPlayingFeedbackPatternsDirectly
{
  return 1;
}

+ (BOOL)_supportsAbortingDeactivation
{
  return 1;
}

+ (void)_setHapticEngineCreationBlock:(id)a3
{
  objc_super v3 = _Block_copy(a3);
  id v4 = (void *)_MergedGlobals_3_10;
  _MergedGlobals_3_10 = (uint64_t)v3;
}

+ (void)_setHapticPatternClass:(Class)a3
{
  qword_1EB25CC38 = (uint64_t)a3;
}

- (void)_resetCoreHapticsEngine
{
  objc_super v3 = [(id)objc_opt_class() _internalQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___UIFeedbackCoreHapticsEngine__resetCoreHapticsEngine__block_invoke;
  block[3] = &unk_1E52D9F70;
  block[4] = self;
  id v4 = v3;
  if (!v3)
  {
    id v4 = MEMORY[0x1E4F14428];
    id v5 = MEMORY[0x1E4F14428];
  }
  id v6 = v3;
  dispatch_async(v4, block);
}

- (void)_internal_resetCoreHapticsEngine
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(id)objc_opt_class() _internalQueue];

  playersToInvalidate = self->_playersToInvalidate;
  id v4 = [(NSMutableSet *)self->_playersInUse allObjects];
  [(NSMutableSet *)playersToInvalidate addObjectsFromArray:v4];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = self->_playersToInvalidate;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(id *)(*((void *)&v16 + 1) + 8 * v9);
        BOOL v11 = objc_msgSend(v10, "invalidationBlock", (void)v16);

        if (v11)
        {
          id v12 = [v10 invalidationBlock];
          v12[2]();

          [v10 setInvalidationBlock:0];
        }

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  coreHapticsEngine = self->_coreHapticsEngine;
  self->_coreHapticsEngine = 0;

  id v14 = self->_playersToInvalidate;
  self->_playersToInvalidate = 0;

  playersInUse = self->_playersInUse;
  self->_playersInUse = 0;

  [(_UIFeedbackEngine *)self _setState:0];
  [(_UIFeedbackEngine *)self _internal_teardownBackgroundTask];
}

- (void)_coreHapticsEngineStoppedForReason:(int64_t)a3
{
  id v5 = [(id)objc_opt_class() _internalQueue];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __67___UIFeedbackCoreHapticsEngine__coreHapticsEngineStoppedForReason___block_invoke;
  v9[3] = &unk_1E52D9CD0;
  v9[4] = self;
  v9[5] = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = MEMORY[0x1E4F14428];
    id v7 = MEMORY[0x1E4F14428];
  }
  uint64_t v8 = v5;
  dispatch_async(v6, v9);
}

- (void)_internal_coreHapticsEngineStoppedForReason:(int64_t)a3
{
  [(id)objc_opt_class() _internalQueue];

  if ((unint64_t)(a3 + 1) <= 5 && ((1 << (a3 + 1)) & 0x2D) != 0)
  {
    [(_UIFeedbackEngine *)self _setState:0];
  }
}

- (void)_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t))a3;
  [(id)objc_opt_class() _internalQueue];

  if (!_UIFeedbackLoggingDisabled)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("Feedback", &_internal_cooldownUnderlyingPlayerIfPossibleWithCompletion____s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = NSString;
      id v7 = self;
      uint64_t v8 = v5;
      uint64_t v9 = objc_msgSend(v6, "stringWithFormat:", @"<%s: %p>", object_getClassName(v7), v7);

      *(_DWORD *)long long buf = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "_internal_cooldownUnderlyingPlayerIfPossible %@", buf, 0xCu);
    }
  }
  id v10 = [(_UIFeedbackCoreHapticsEngine *)self coreHapticsEngine];
  [v10 stopPrewarm];

  v4[2](v4, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreHapticsEngine, 0);
  objc_storeStrong((id *)&self->_playersToInvalidate, 0);
  objc_storeStrong((id *)&self->_playersInUse, 0);
}

@end