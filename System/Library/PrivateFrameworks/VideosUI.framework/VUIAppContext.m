@interface VUIAppContext
+ (id)currentAppContext;
- (BOOL)_prepareStartWithURL:(id)a3;
- (BOOL)canAccessPendingQueue;
- (BOOL)isRunning;
- (BOOL)isValid;
- (BOOL)remoteInspectionEnabled;
- (JSContext)jsContext;
- (NSError)responseError;
- (NSMutableArray)onStartQueue;
- (NSMutableArray)pendingQueue;
- (NSMutableArray)postEvaluationBlocks;
- (NSString)nextJSChecksum;
- (NSString)responseScript;
- (VUIAppContext)initWithApplication:(id)a3 mode:(unint64_t)a4 delegate:(id)a5;
- (VUIAppContextDelegate)delegate;
- (VUIAppReloadContext)reloadContext;
- (VUIApplication)app;
- (VUIJSApplication)jsApp;
- (VUIJSFoundation)jsFoundation;
- (double)appScriptTimeoutInterval;
- (id)_appTraitCollection;
- (id)_errorWithMessage:(id)a3;
- (unint64_t)mode;
- (void)_addPrivateInterfaces;
- (void)_addStopRecordToPendingQueueWithReload:(BOOL)a3;
- (void)_dispatchError:(id)a3;
- (void)_doEvaluate:(id)a3;
- (void)_drainOnStartQueue;
- (void)_enqueueOnStartOrExecute:(id)a3;
- (void)_evaluate:(id)a3;
- (void)_invalidateJSThread;
- (void)_jsThreadMain;
- (void)_sourceCanceledOnRunLoop:(__CFRunLoop *)a3;
- (void)_sourcePerform;
- (void)_sourceScheduledOnRunLoop:(__CFRunLoop *)a3;
- (void)_startWithScript:(id)a3 scriptUrl:(id)a4;
- (void)_startWithURL:(id)a3;
- (void)_stopAndReload:(BOOL)a3;
- (void)addPostEvaluateBlock:(id)a3;
- (void)contextDidFailWithError:(id)a3;
- (void)contextDidStartWithJS:(id)a3 options:(id)a4;
- (void)contextDidStopWithOptions:(id)a3;
- (void)dealloc;
- (void)evaluate:(id)a3;
- (void)evaluate:(id)a3 completionBlock:(id)a4;
- (void)evaluate:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5;
- (void)evaluateDelegateBlockSync:(id)a3;
- (void)evaluateFoundationJS;
- (void)handleReloadWithUrgencyType:(unint64_t)a3 minInterval:(double)a4 data:(id)a5;
- (void)launchAppWithOptions:(id)a3;
- (void)reload;
- (void)resumeWithOptions:(id)a3;
- (void)setAppScriptTimeoutInterval:(double)a3;
- (void)setCanAccessPendingQueue:(BOOL)a3;
- (void)setException:(id)a3 withErrorMessage:(id)a4;
- (void)setIsValid:(BOOL)a3;
- (void)setJsApp:(id)a3;
- (void)setJsContext:(id)a3;
- (void)setJsFoundation:(id)a3;
- (void)setNextJSChecksum:(id)a3;
- (void)setPendingQueue:(id)a3;
- (void)setPostEvaluationBlocks:(id)a3;
- (void)setReloadContext:(id)a3;
- (void)setRemoteInspectionEnabled:(BOOL)a3;
- (void)setResponseError:(id)a3;
- (void)setResponseScript:(id)a3;
- (void)setRunning:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)suspendWithOptions:(id)a3;
@end

@implementation VUIAppContext

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v15 = [a2 toObject];
  if ([v11 isString])
  {
    uint64_t v16 = [v11 toString];
  }
  else
  {
    uint64_t v16 = 0;
  }
  if ([v12 isString])
  {
    v17 = [v12 toString];
  }
  else
  {
    v17 = 0;
  }
  if ([v13 isString])
  {
    v18 = [v13 toString];
  }
  else
  {
    v18 = 0;
  }
  v24 = v11;
  if ([v14 isString])
  {
    v19 = [v14 toString];
  }
  else
  {
    v19 = 0;
  }
  v20 = (void *)v16;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    WeakRetained = +[VUIFormatting sharedInstance];
    v22 = [WeakRetained formatLocalizedNumber:v15 style:v20 postiveFormat:v17 negativeFormat:v18 currencyCode:v19];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"formatLocalizedNumber expects a Number object"];
    v22 = 0;
  }

  return v22;
}

- (void)_doEvaluate:(id)a3
{
  v4 = (void (**)(id, void *))a3;
  if (![(VUIAppContext *)self isValid])
  {
    v5 = VUIDefaultLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[VUIAppContext _doEvaluate:](self);
    }
  }
  v6 = [(VUIAppContext *)self jsContext];
  v4[2](v4, v6);

  v7 = [(VUIAppContext *)self jsContext];
  v8 = [v7 exception];

  if (v8)
  {
    v9 = [(VUIAppContext *)self jsContext];
    v10 = [v9 exception];
    [(VUIAppContext *)self _dispatchError:v10];

    id v11 = [(VUIAppContext *)self jsContext];
    [v11 setException:0];
  }
}

- (JSContext)jsContext
{
  return self->_jsContext;
}

- (BOOL)isValid
{
  return self->_isValid;
}

void __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_108(uint64_t a1)
{
  v2 = VUISignpostLogObject();
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "JS.Evaluate", "", buf, 2u);
  }

  v5 = VUISignpostLogObject();
  v6 = v5;
  os_signpost_id_t v7 = *(void *)(a1 + 48);
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)id v12 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v7, "JS.contextDidStartWithJS", "", v12, 2u);
  }

  [*(id *)(a1 + 32) contextDidStartWithJS:*(void *)(a1 + 40) options:0];
  v8 = VUISignpostLogObject();
  v9 = v8;
  os_signpost_id_t v10 = *(void *)(a1 + 48);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v9, OS_SIGNPOST_INTERVAL_END, v10, "JS.contextDidStartWithJS", "", v11, 2u);
  }
}

- (void)contextDidStartWithJS:(id)a3 options:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  os_signpost_id_t v7 = [(VUIAppContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v7 appContext:self didStartWithOptions:v6 validatedJSString:v8];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v7 appContext:self didStartWithOptions:v6];
  }
  [(VUIAppContext *)self _drainOnStartQueue];
}

- (void)_drainOnStartQueue
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(VUIAppContext *)v2 onStartQueue];
  os_signpost_id_t v4 = (void *)[v3 copy];

  v5 = [(VUIAppContext *)v2 onStartQueue];
  [v5 removeAllObjects];

  objc_sync_exit(v2);
  if ([v4 count])
  {
    id v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_INFO, "[StartQueue] Draining start Queue", buf, 2u);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v10) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v10));
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v8);
  }

  if (objc_msgSend(v7, "count", (void)v12))
  {
    id v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "[StartQueue] Done Draining start Queue!", buf, 2u);
    }
  }
}

- (NSMutableArray)onStartQueue
{
  return self->_onStartQueue;
}

intptr_t __43__VUIAppContext_evaluateDelegateBlockSync___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = *(NSObject **)(a1 + 40);
  return dispatch_semaphore_signal(v2);
}

- (id)_appTraitCollection
{
  if (self->_respondsToTraitCollection)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_app);
    v3 = [WeakRetained appTraitCollection];
  }
  else
  {
    v3 = (void *)MEMORY[0x1E4F1CC08];
  }
  return v3;
}

- (void)_sourcePerform
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(VUIAppContext *)v2 pendingQueue];
  objc_sync_exit(v2);

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __31__VUIAppContext__sourcePerform__block_invoke;
  aBlock[3] = &unk_1E6DFD760;
  aBlock[4] = v2;
  id v4 = v3;
  id v17 = v4;
  v5 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v6 = v5[2]();
  if (v6)
  {
    id v7 = (void *)v6;
    do
    {
      uint64_t v8 = [v7 evaluateBlock];
      v8[2]();

      uint64_t v9 = [v7 completionBlock];

      if (v9)
      {
        uint64_t v10 = [v7 completionQueue];

        if (v10)
        {
          id v11 = [v7 completionQueue];
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __31__VUIAppContext__sourcePerform__block_invoke_2;
          block[3] = &unk_1E6DF3D58;
          id v15 = v7;
          dispatch_async(v11, block);

          long long v12 = (void (**)(void, void))v15;
        }
        else
        {
          long long v12 = [v7 completionBlock];
          v12[2](v12, 1);
        }
      }
      uint64_t v13 = ((void (*)(void (**)(void)))v5[2])(v5);

      id v7 = (void *)v13;
    }
    while (v13);
  }
}

id __31__VUIAppContext__sourcePerform__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  v3 = [*(id *)(a1 + 40) firstObject];
  if (v3) {
    [*(id *)(a1 + 40) removeObjectAtIndex:0];
  }
  objc_sync_exit(v2);

  return v3;
}

void __58__VUIAppContext_evaluate_completionBlock_completionQueue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _evaluate:*(void *)(a1 + 32)];
}

- (void)_evaluate:(id)a3
{
  id v16 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  [(VUIAppContext *)self setPostEvaluationBlocks:v4];

  [(VUIAppContext *)self _doEvaluate:v16];
  v5 = [(VUIAppContext *)self postEvaluationBlocks];
  uint64_t v6 = [v5 firstObject];

  if (v6)
  {
    do
    {
      id v7 = [(VUIAppContext *)self postEvaluationBlocks];
      [v7 removeObjectAtIndex:0];

      uint64_t v8 = [(VUIAppContext *)self jsContext];
      ((void (**)(void, void *))v6)[2](v6, v8);

      uint64_t v9 = [(VUIAppContext *)self jsContext];
      uint64_t v10 = [v9 exception];

      if (v10)
      {
        id v11 = [(VUIAppContext *)self jsContext];
        long long v12 = [v11 exception];
        [(VUIAppContext *)self _dispatchError:v12];

        uint64_t v13 = [(VUIAppContext *)self jsContext];
        [v13 setException:0];
      }
      long long v14 = [(VUIAppContext *)self postEvaluationBlocks];
      uint64_t v15 = [v14 firstObject];

      uint64_t v6 = (void (**)(void, void))v15;
    }
    while (v15);
  }
  [(VUIAppContext *)self setPostEvaluationBlocks:0];
}

- (void)setPostEvaluationBlocks:(id)a3
{
}

- (NSMutableArray)postEvaluationBlocks
{
  return self->_postEvaluationBlocks;
}

- (void)evaluate:(id)a3 completionBlock:(id)a4 completionQueue:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = self;
  objc_sync_enter(v11);
  if ([(VUIAppContext *)v11 canAccessPendingQueue])
  {
    objc_initWeak(&location, v11);
    long long v12 = [VUIRunLoopSourceRecord alloc];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __58__VUIAppContext_evaluate_completionBlock_completionQueue___block_invoke;
    v16[3] = &unk_1E6DF4D78;
    objc_copyWeak(&v18, &location);
    id v17 = v8;
    uint64_t v13 = [(VUIRunLoopSourceRecord *)v12 initWithEvaluateBlock:v16 completionBlock:v9 completionQueue:v10];
    long long v14 = [(VUIAppContext *)v11 pendingQueue];
    [v14 addObject:v13];

    if (v11->_jsThreadRunLoop)
    {
      jsThreadRunLoopSource = v11->_jsThreadRunLoopSource;
      if (jsThreadRunLoopSource)
      {
        CFRunLoopSourceSignal(jsThreadRunLoopSource);
        CFRunLoopWakeUp(v11->_jsThreadRunLoop);
      }
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v11);
}

- (NSMutableArray)pendingQueue
{
  return self->_pendingQueue;
}

- (BOOL)canAccessPendingQueue
{
  return self->_canAccessPendingQueue;
}

void __38__VUIAppContext__prepareStartWithURL___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _startWithURL:*(void *)(a1 + 32)];
}

- (void)_jsThreadMain
{
  v3 = (void *)MEMORY[0x1E4E6FAE0](self, a2);
  v17.version = 0;
  v17.info = self;
  memset(&v17.retain, 0, 40);
  v17.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))VUIRunLoopSourceScheduleCallBack;
  v17.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))VUIRunLoopSourceCancelCallBack;
  v17.perform = (void (__cdecl *)(void *))VUIRunLoopSourcePerformCallBack;
  id v4 = self;
  objc_sync_enter(v4);
  CFRunLoopRef Current = CFRunLoopGetCurrent();
  v4->_jsThreadRunLoop = Current;
  CFRetain(Current);
  uint64_t v6 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v17);
  v4->_jsThreadRunLoopSource = v6;
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D418];
  CFRunLoopAddSource(Current, v6, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  id v8 = objc_msgSend(MEMORY[0x1E4F29060], "currentThread", v17.version, v17.info, *(_OWORD *)&v17.retain, *(_OWORD *)&v17.copyDescription, v17.hash, v17.schedule, v17.cancel, v17.perform);
  id v9 = [v8 threadDictionary];
  [v9 setObject:v4 forKeyedSubscript:@"vuiAppContext"];

  objc_sync_exit(v4);
  do
  {
    id v10 = (void *)MEMORY[0x1E4E6FAE0]();
    CFRunLoopRunResult v11 = CFRunLoopRunInMode(v7, 1.0e10, 1u);
    long long v12 = v4;
    objc_sync_enter(v12);
    jsThreadRunLoopSource = v4->_jsThreadRunLoopSource;
    objc_sync_exit(v12);
  }
  while ((v11 - 3) <= 0xFFFFFFFD && jsThreadRunLoopSource == v6);
  uint64_t v15 = v12;
  objc_sync_enter(v15);
  id v16 = [v8 threadDictionary];
  [v16 removeObjectForKey:@"vuiAppContext"];
  CFRelease(v6);
  CFRelease(Current);

  objc_sync_exit(v15);
}

+ (id)currentAppContext
{
  id v2 = [MEMORY[0x1E4F29060] currentThread];
  v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKeyedSubscript:@"vuiAppContext"];

  return v4;
}

- (void)evaluate:(id)a3
{
}

- (void)_sourceScheduledOnRunLoop:(__CFRunLoop *)a3
{
  CFRunLoopSourceSignal(self->_jsThreadRunLoopSource);
  jsThreadRunLoop = self->_jsThreadRunLoop;
  CFRunLoopWakeUp(jsThreadRunLoop);
}

- (void)_startWithURL:(id)a3
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[VUIPreference ignoreHTTPCache])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(VUIAppContext *)self reloadContext];
    BOOL v5 = v6 != 0;
  }
  CFStringRef v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    *(_DWORD *)buf = 138412802;
    *(void *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = [(VUIAppContext *)self mode];
    *(_WORD *)&buf[22] = 2048;
    v44 = self;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_DEFAULT, "<%@ (%lu): %p> Attempting to start context with script", buf, 0x20u);
  }
  id v10 = [(VUIAppContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    CFRunLoopRunResult v11 = VUIDefaultLogObject();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v11, OS_LOG_TYPE_INFO, "Fetch application script using App Script Loader", buf, 2u);
    }

    dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    v44 = (VUIAppContext *)__Block_byref_object_copy__38;
    v45 = __Block_byref_object_dispose__38;
    id v46 = 0;
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__38;
    v33 = __Block_byref_object_dispose__38;
    id v34 = 0;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    v28[3] = 0;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __31__VUIAppContext__startWithURL___block_invoke;
    v23[3] = &unk_1E6DFD6E8;
    v25 = buf;
    v26 = &v29;
    v27 = v28;
    uint64_t v13 = v12;
    v24 = v13;
    [v10 appContext:self scriptForURL:v4 cachePolicy:v5 completion:v23];
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    if (v30[5] || ![*(id *)(*(void *)&buf[8] + 40) length])
    {
      [(VUIAppContext *)self _invalidateJSThread];
      long long v14 = VUIDefaultLogObject();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        CFRunLoopSourceContext v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v19 = [(VUIAppContext *)self mode];
        uint64_t v20 = v30[5];
        *(_DWORD *)v35 = 138413058;
        id v36 = v18;
        __int16 v37 = 2048;
        unint64_t v38 = v19;
        __int16 v39 = 2048;
        v40 = self;
        __int16 v41 = 2112;
        uint64_t v42 = v20;
        _os_log_error_impl(&dword_1E2BD7000, v14, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Failed to load launch URL with error: %@", v35, 0x2Au);
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__VUIAppContext__startWithURL___block_invoke_92;
      block[3] = &unk_1E6DF4B00;
      void block[4] = self;
      block[5] = v28;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    else
    {
      id v16 = VUIDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v35 = 0;
        _os_log_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_INFO, "Downloaded application script sussessfully. Starting script...", v35, 2u);
      }

      [(VUIAppContext *)self _startWithScript:*(void *)(*(void *)&buf[8] + 40) scriptUrl:v4];
    }

    _Block_object_dispose(v28, 8);
    _Block_object_dispose(&v29, 8);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    [(VUIAppContext *)self _invalidateJSThread];
    uint64_t v15 = VUIDefaultLogObject();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[VUIAppContext _startWithURL:](self);
    }

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __31__VUIAppContext__startWithURL___block_invoke_93;
    v21[3] = &unk_1E6DF3D58;
    v21[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v21);
  }
}

void __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_101(uint64_t a1)
{
  id v2 = VUISignpostLogObject();
  v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 64);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "JS.Evaluate.AppContextEvaluateScript.Evaluate", "", buf, 2u);
  }

  if ([*(id *)(a1 + 32) mode] != 1000)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0
      || ([*(id *)(a1 + 40) appLaunchParams],
          BOOL v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = (void *)[v5 mutableCopy],
          v5,
          !v6))
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:0];
    }
    CFStringRef v7 = [v6 objectForKey:@"location"];

    id v8 = [*(id *)(a1 + 48) absoluteString];
    id v9 = v8;
    if (*(void *)(a1 + 48) && !v7 && [v8 length]) {
      [v6 setObject:v9 forKey:@"location"];
    }
    id v10 = [*(id *)(a1 + 32) reloadContext];
    CFRunLoopRunResult v11 = [v10 reloadData];

    if (v11)
    {
      dispatch_semaphore_t v12 = [*(id *)(a1 + 32) reloadContext];
      uint64_t v13 = [v12 reloadData];
      [v6 setObject:v13 forKey:@"reloadData"];
    }
    long long v14 = *(void **)(a1 + 32);
    uint64_t v15 = (void *)[v6 copy];
    [v14 launchAppWithOptions:v15];
  }
  id v16 = VUISignpostLogObject();
  CFRunLoopSourceContext v17 = v16;
  os_signpost_id_t v18 = *(void *)(a1 + 64);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "JS.Evaluate.AppContextEvaluateScript", "", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_108;
  block[3] = &unk_1E6DFD710;
  uint64_t v19 = *(void *)(a1 + 32);
  uint64_t v20 = *(void **)(a1 + 56);
  uint64_t v23 = *(void *)(a1 + 64);
  void block[4] = v19;
  id v22 = v20;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (VUIAppReloadContext)reloadContext
{
  return self->_reloadContext;
}

void __31__VUIAppContext__startWithURL___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v9 = a2;
  id v8 = a3;
  if (v8)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)start
{
  if ([(VUIAppContext *)self isRunning])
  {
    v3 = VUIDefaultLogObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E2BD7000, v3, OS_LOG_TYPE_INFO, "VUIAppContext - We are already preparing to start...", buf, 2u);
    }
  }
  else
  {
    [(VUIAppContext *)self setRunning:1];
    kdebug_trace();
    id v5 = [(VUIAppContext *)self app];
    os_signpost_id_t v4 = [v5 appJSURL];
    [(VUIAppContext *)self _prepareStartWithURL:v4];
  }
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)isRunning
{
  return self->_running;
}

- (VUIAppContext)initWithApplication:(id)a3 mode:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  +[VUIPreference setupJSCoreConsoleLogging];
  v21.receiver = self;
  v21.super_class = (Class)VUIAppContext;
  id v10 = [(VUIAppContext *)&v21 init];
  CFRunLoopRunResult v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_app, v8);
    v11->_respondsToTraitCollection = objc_opt_respondsToSelector() & 1;
    v11->_remoteInspectionEnabled = 1;
    v11->_running = 0;
    v11->_mode = a4;
    objc_storeWeak((id *)&v11->_delegate, v9);
    uint64_t v12 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:0];
    onStartQueue = v11->_onStartQueue;
    v11->_onStartQueue = (NSMutableArray *)v12;

    v11->_appScriptTimeoutInterval = 30.0;
    dispatch_source_t v14 = dispatch_source_create(MEMORY[0x1E4F14468], 0, 7uLL, MEMORY[0x1E4F14428]);
    lowMemoryWarningSource = v11->_lowMemoryWarningSource;
    v11->_lowMemoryWarningSource = (OS_dispatch_source *)v14;

    if (v11->_lowMemoryWarningSource)
    {
      objc_initWeak(&location, v11);
      id v16 = v11->_lowMemoryWarningSource;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __51__VUIAppContext_initWithApplication_mode_delegate___block_invoke;
      v18[3] = &unk_1E6DF4A30;
      objc_copyWeak(&v19, &location);
      dispatch_source_set_event_handler(v16, v18);
      dispatch_resume((dispatch_object_t)v11->_lowMemoryWarningSource);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }

  return v11;
}

- (void)_startWithScript:(id)a3 scriptUrl:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = VUISignpostLogObject();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);

  id v10 = VUISignpostLogObject();
  CFRunLoopRunResult v11 = v10;
  unint64_t v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "JS.Evaluate", "", buf, 2u);
  }

  if ([v6 length])
  {
    uint64_t v13 = [(VUIAppContext *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && ([v13 appContext:self shouldStartWithScript:v6 scriptURL:v7] & 1) == 0)
    {
      v30 = VUIDefaultLogObject();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        unint64_t v33 = [(VUIAppContext *)self mode];
        *(_DWORD *)buf = 138413058;
        v49 = v32;
        __int16 v50 = 2048;
        unint64_t v51 = v33;
        __int16 v52 = 2048;
        v53 = self;
        __int16 v54 = 2112;
        id v55 = v7;
        _os_log_impl(&dword_1E2BD7000, v30, OS_LOG_TYPE_INFO, "VUIAppContext - <%@ (%lu): %p> Delegate opted to stop script loading from %@", buf, 0x2Au);
      }
      [(VUIAppContext *)self stop];
    }
    else
    {
      dispatch_source_t v14 = [(VUIAppContext *)self app];
      uint64_t v15 = [v14 appIdentifier];
      char v16 = [(VUIAppContext *)self remoteInspectionEnabled];
      if (objc_opt_respondsToSelector()) {
        char v16 = [v14 shouldAllowRemoteInspection];
      }
      id v17 = objc_alloc_init(MEMORY[0x1E4F30920]);
      if ([v15 length]) {
        [v17 setName:v15];
      }
      [v17 _setITMLDebuggableType];
      [v17 _setDebuggerRunLoop:self->_jsThreadRunLoop];
      JSGlobalContextSetInspectable((JSGlobalContextRef)[v17 JSGlobalContextRef], v16);
      [(VUIAppContext *)self setJsContext:v17];
      [(VUIAppContext *)self evaluateFoundationJS];
      os_signpost_id_t v18 = VUISignpostLogObject();
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.Evaluate.JSContextEvaluateScript", "", buf, 2u);
      }

      id v19 = (id)[v17 evaluateScript:v6 withSourceURL:v7];
      uint64_t v20 = VUISignpostLogObject();
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v20, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.Evaluate.JSContextEvaluateScript", "", buf, 2u);
      }

      objc_super v21 = [v17 exception];

      if (v21)
      {
        id v22 = [v17 exception];
        uint64_t v23 = VUIDefaultLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          id v34 = (objc_class *)objc_opt_class();
          unint64_t v38 = NSStringFromClass(v34);
          unint64_t v37 = [(VUIAppContext *)self mode];
          uint64_t v35 = [v22 toDictionary];
          *(_DWORD *)buf = 138413570;
          v49 = v38;
          __int16 v50 = 2048;
          unint64_t v51 = v37;
          __int16 v52 = 2048;
          v53 = self;
          __int16 v54 = 2112;
          id v55 = v7;
          __int16 v56 = 2112;
          v57 = v22;
          __int16 v58 = 2112;
          uint64_t v59 = v35;
          id v36 = (void *)v35;
          _os_log_error_impl(&dword_1E2BD7000, v23, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Unable to start script (%@) because of %@: %@", buf, 0x3Eu);
        }
        [v17 setException:0];
        [(VUIAppContext *)self _invalidateJSThread];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_100;
        block[3] = &unk_1E6DF3F68;
        id v45 = v22;
        id v46 = self;
        id v24 = v22;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      else
      {
        [(VUIAppContext *)self setIsValid:1];
        v26 = VUISignpostLogObject();
        v27 = v26;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v27, OS_SIGNPOST_INTERVAL_BEGIN, v9, "JS.Evaluate.AppContextEvaluateScript", "", buf, 2u);
        }

        v28 = VUISignpostLogObject();
        uint64_t v29 = v28;
        if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v29, OS_SIGNPOST_INTERVAL_BEGIN, v9, "JS.Evaluate.AppContextEvaluateScript.Evaluate", "", buf, 2u);
        }

        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_101;
        v39[3] = &unk_1E6DFD738;
        os_signpost_id_t v43 = v9;
        v39[4] = self;
        id v40 = v14;
        id v41 = v7;
        id v42 = v6;
        [(VUIAppContext *)self _evaluate:v39];
      }
    }
  }
  else
  {
    v25 = VUIDefaultLogObject();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[VUIAppContext _startWithScript:scriptUrl:](self);
    }

    [(VUIAppContext *)self _invalidateJSThread];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __44__VUIAppContext__startWithScript_scriptUrl___block_invoke;
    v47[3] = &unk_1E6DF3D58;
    v47[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], v47);
  }
}

- (void)evaluateFoundationJS
{
  v3 = VUISignpostLogObject();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v3, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.Evaluate.Foundation", "", buf, 2u);
  }

  kdebug_trace();
  os_signpost_id_t v4 = [(VUIAppContext *)self jsContext];
  id v5 = [[VUIJSDevice alloc] initWithAppContext:self];
  [v4 setObject:v5 forKeyedSubscript:@"Device"];
  id v6 = [(VUIAppContext *)self app];
  if (objc_opt_respondsToSelector())
  {
    id v7 = [v6 userDefaultsStorage];
    if (v7)
    {
      id v8 = [[VUIJSUserDefaults alloc] initWithAppContext:self userDefaultsStorage:v7];
      [v4 setObject:v8 forKeyedSubscript:@"userDefaults"];
    }
  }
  os_signpost_id_t v9 = [(VUIJSObject *)[VUIJSApplication alloc] initWithAppContext:self];
  [(VUIAppContext *)self setJsApp:v9];

  id v10 = [(VUIAppContext *)self jsApp];
  [v4 setObject:v10 forKeyedSubscript:@"App"];

  [(VUIAppContext *)self _addPrivateInterfaces];
  CFRunLoopRunResult v11 = [(VUIAppContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v11 appContext:self evaluateAppJavaScriptInContext:v4];
  }
  unint64_t v12 = VUISignpostLogObject();
  if (os_signpost_enabled(v12))
  {
    *(_WORD *)uint64_t v13 = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v12, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.Evaluate.Foundation", "", v13, 2u);
  }

  kdebug_trace();
}

- (VUIAppContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIAppContextDelegate *)WeakRetained;
}

- (VUIApplication)app
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_app);
  return (VUIApplication *)WeakRetained;
}

- (void)_addPrivateInterfaces
{
  v3 = [[VUIJSFoundation alloc] initWithAppContext:self];
  [(VUIAppContext *)self setJsFoundation:v3];

  os_signpost_id_t v4 = [(VUIAppContext *)self jsContext];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke;
  aBlock[3] = &unk_1E6DF3FB8;
  objc_copyWeak(&v28, &location);
  id v5 = _Block_copy(aBlock);
  [v4 setObject:v5 forKeyedSubscript:@"formatLocalizedNumber"];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_2;
  v25[3] = &unk_1E6DF3FE0;
  objc_copyWeak(&v26, &location);
  id v6 = _Block_copy(v25);
  [v4 setObject:v6 forKeyedSubscript:@"joinComponentsWithLocalizedCommaAndSpace"];

  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_3;
  v23[3] = &unk_1E6DF3FE0;
  objc_copyWeak(&v24, &location);
  id v7 = _Block_copy(v23);
  [v4 setObject:v7 forKeyedSubscript:@"joinComponentsWithLocalizedSemicolonAndSpace"];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_4;
  v21[3] = &unk_1E6DF4008;
  objc_copyWeak(&v22, &location);
  id v8 = _Block_copy(v21);
  [v4 setObject:v8 forKeyedSubscript:@"setTimeout"];

  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_5;
  v19[3] = &unk_1E6DF4030;
  objc_copyWeak(&v20, &location);
  os_signpost_id_t v9 = _Block_copy(v19);
  [v4 setObject:v9 forKeyedSubscript:@"formatDuration"];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_6;
  v17[3] = &unk_1E6DF4058;
  objc_copyWeak(&v18, &location);
  id v10 = _Block_copy(v17);
  [v4 setObject:v10 forKeyedSubscript:@"formatNumber"];

  [v4 setObject:&__block_literal_global_3 forKeyedSubscript:@"formatInitials"];
  [v4 setObject:&__block_literal_global_57 forKeyedSubscript:@"fetchAppAccessStatus"];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  dispatch_source_t v14 = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_9;
  uint64_t v15 = &unk_1E6DF40E8;
  objc_copyWeak(&v16, &location);
  CFRunLoopRunResult v11 = _Block_copy(&v12);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v11, @"openURL", v12, v13, v14, v15);

  [v4 setObject:&__block_literal_global_75 forKeyedSubscript:@"btoa"];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)setJsFoundation:(id)a3
{
}

- (void)setJsContext:(id)a3
{
}

- (void)setJsApp:(id)a3
{
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)remoteInspectionEnabled
{
  return self->_remoteInspectionEnabled;
}

- (VUIJSApplication)jsApp
{
  return self->_jsApp;
}

- (void)_dispatchError:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"errorDispatched"];
  char v6 = [v5 toBool];

  if ((v6 & 1) == 0)
  {
    id v7 = [v4 objectForKeyedSubscript:@"message"];
    id v8 = [v7 toString];

    os_signpost_id_t v9 = [v4 objectForKeyedSubscript:@"sourceURL"];
    id v10 = [v9 toString];

    CFRunLoopRunResult v11 = [v4 objectForKeyedSubscript:@"line"];
    uint64_t v12 = [v11 toString];

    uint64_t v13 = [v4 objectForKeyedSubscript:@"column"];
    dispatch_source_t v14 = [v13 toString];

    if ([v8 length])
    {
      uint64_t v15 = [NSString stringWithFormat:@"%@:%@", v12, v14];
      id v16 = VUIDefaultLogObject();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        id v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        *(_DWORD *)buf = 138413570;
        id v20 = v18;
        __int16 v21 = 2048;
        unint64_t v22 = [(VUIAppContext *)self mode];
        __int16 v23 = 2048;
        id v24 = self;
        __int16 v25 = 2112;
        id v26 = v8;
        __int16 v27 = 2112;
        id v28 = v10;
        __int16 v29 = 2112;
        v30 = v15;
        _os_log_error_impl(&dword_1E2BD7000, v16, OS_LOG_TYPE_ERROR, "<%@ (%lu): %p> Error: %@ - %@ - line:%@", buf, 0x3Eu);
      }
    }
  }
}

- (BOOL)_prepareStartWithURL:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_initWeak(&location, self);
  unint64_t v5 = [(VUIAppContext *)self mode];
  id v6 = v4;
  if (!v6) {
    goto LABEL_15;
  }
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    unint64_t v10 = [(VUIAppContext *)self mode];
    *(_DWORD *)buf = 138413058;
    id v31 = v9;
    __int16 v32 = 2048;
    unint64_t v33 = v10;
    __int16 v34 = 2048;
    uint64_t v35 = self;
    __int16 v36 = 2112;
    id v37 = v6;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "VUIAppContext - <%@ (%lu): %p> Launching JavaScript app from URL: %@", buf, 0x2Au);
  }
  CFRunLoopRunResult v11 = [v6 scheme];
  uint64_t v12 = [v11 lowercaseString];
  if (![v12 isEqualToString:@"https"])
  {
    uint64_t v13 = [(VUIAppContext *)self app];
    char v14 = [v13 shouldIgnoreJSValidation];

    if (v14) {
      goto LABEL_8;
    }
LABEL_15:
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB3E18] code:101 userInfo:0];
    [(VUIAppContext *)self contextDidFailWithError:v15];
    LOBYTE(self) = 0;
    goto LABEL_16;
  }

LABEL_8:
  uint64_t v15 = self;
  objc_sync_enter(v15);
  id v16 = [(VUIAppContext *)v15 pendingQueue];
  LODWORD(self) = v16 == 0;

  if (self)
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(VUIAppContext *)v15 setPendingQueue:v18];

    [(VUIAppContext *)v15 setCanAccessPendingQueue:1];
    id v19 = [VUIRunLoopSourceRecord alloc];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __38__VUIAppContext__prepareStartWithURL___block_invoke;
    v26[3] = &unk_1E6DF5490;
    objc_copyWeak(&v28, &location);
    id v27 = v6;
    id v20 = [(VUIRunLoopSourceRecord *)v19 initWithEvaluateBlock:v26 completionBlock:0 completionQueue:0];
    __int16 v21 = [(VUIAppContext *)v15 pendingQueue];
    [v21 addObject:v20];

    unint64_t v22 = (void *)[objc_alloc(MEMORY[0x1E4F29060]) initWithTarget:v15 selector:sel__jsThreadMain object:0];
    __int16 v23 = v22;
    if (v5 == 1000) {
      uint64_t v24 = 9;
    }
    else {
      uint64_t v24 = 25;
    }
    [v22 setQualityOfService:v24];
    [v23 setName:@"VUICoreThread"];
    [v23 start];

    objc_destroyWeak(&v28);
  }
  else
  {
    id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB3E18] code:100 userInfo:0];
    [(VUIAppContext *)v15 contextDidFailWithError:v17];
  }
  objc_sync_exit(v15);
LABEL_16:

  objc_destroyWeak(&location);
  return (char)self;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setPendingQueue:(id)a3
{
}

- (void)setCanAccessPendingQueue:(BOOL)a3
{
  self->_canAccessPendingQueue = a3;
}

- (void)launchAppWithOptions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = VUISignpostLogObject();
  if (os_signpost_enabled(v5))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "JS.LaunchApp", "", (uint8_t *)&v11, 2u);
  }

  id v6 = [(VUIAppContext *)self jsContext];
  id v7 = VUIDefaultLogObject();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    int v11 = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1E2BD7000, v7, OS_LOG_TYPE_INFO, "VUIAppContext - Starting context with options: %@", (uint8_t *)&v11, 0xCu);
  }

  id v8 = [v6 objectForKeyedSubscript:@"App"];
  id v9 = [v8 toObjectOfClass:objc_opt_class()];

  [v9 launchAppWithOptions:v4];
  unint64_t v10 = VUISignpostLogObject();
  if (os_signpost_enabled(v10))
  {
    LOWORD(v11) = 0;
    _os_signpost_emit_with_name_impl(&dword_1E2BD7000, v10, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "JS.LaunchApp", "", (uint8_t *)&v11, 2u);
  }
}

- (void)evaluateDelegateBlockSync:(id)a3
{
  id v4 = a3;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__VUIAppContext_evaluateDelegateBlockSync___block_invoke;
  block[3] = &unk_1E6DF68B8;
  dispatch_semaphore_t v9 = v5;
  id v10 = v4;
  void block[4] = self;
  id v6 = v5;
  id v7 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isArray])
  {
    id v4 = [v3 toArray];
  }
  else
  {
    id v4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[VUIFormatting sharedInstance];
    id v6 = [WeakRetained joinComponentsWithLocalizedCommaAndSpace:v4];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"joinComponentsWithLocalizedCommaAndSpace expects a String object"];
    id v6 = 0;
  }

  return v6;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isArray])
  {
    id v4 = [v3 toArray];
  }
  else
  {
    id v4 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[VUIFormatting sharedInstance];
    id v6 = [WeakRetained joinComponentsWithLocalizedSemicolonAndSpace:v4];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"joinComponentsWithLocalizedSemicolonAndSpace expects a String object"];
    id v6 = 0;
  }

  return v6;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = (id *)(a1 + 32);
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained(v4);
  id v7 = [WeakRetained jsFoundation];
  id v8 = [v7 setTimeout:v5 time:a3];

  return v8;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = [a2 toObject];
  if ([v5 isString])
  {
    id v7 = [v5 toString];
  }
  else
  {
    id v7 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[VUIFormatting sharedInstance];
    dispatch_semaphore_t v9 = [WeakRetained formatDuration:v6 format:v7];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"formatDuration expects a Number object"];
    dispatch_semaphore_t v9 = 0;
  }

  return v9;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_6(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [a2 toObject];
  if ([v9 isString])
  {
    uint64_t v13 = [v9 toString];
  }
  else
  {
    uint64_t v13 = 0;
  }
  if ([v10 isString])
  {
    char v14 = [v10 toString];
  }
  else
  {
    char v14 = 0;
  }
  if ([v11 isString])
  {
    uint64_t v15 = [v11 toString];
  }
  else
  {
    uint64_t v15 = 0;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id WeakRetained = +[VUIFormatting sharedInstance];
    id v17 = [WeakRetained formatNumber:v12 style:v13 postiveFormat:v14 negativeFormat:v15];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained setException:0 withErrorMessage:@"formatNumber expects a Number object"];
    id v17 = 0;
  }

  return v17;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isString])
  {
    id v6 = [v4 toString];
  }
  else
  {
    id v6 = 0;
  }
  if ([v5 isString])
  {
    id v7 = [v5 toString];
  }
  else
  {
    id v7 = 0;
  }
  id v8 = +[VUIFormatting sharedInstance];
  id v9 = [v8 formatInitialsForFirstName:v6 lastName:v7];

  return v9;
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isString]
    && ([v2 toString], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v4 = (void *)v3;
    id v5 = [MEMORY[0x1E4FB5158] sharedSettings];
    id v6 = [v5 settingsForChannelID:v4 externalID:0];

    if (v6 && [v6 accessStatus])
    {
      id v7 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", objc_msgSend(v6, "accessStatus"));
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_9(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = (objc_class *)MEMORY[0x1E4F1CB10];
    id v7 = a2;
    id v8 = (void *)[[v6 alloc] initWithString:v7];

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_10;
    v11[3] = &unk_1E6DF40C0;
    id v12 = v8;
    id v13 = v5;
    id v10 = v8;
    [WeakRetained evaluateDelegateBlockSync:v11];
  }
}

void __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_10(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  char v3 = [v2 openSensitiveURL:*(void *)(a1 + 32) withOptions:*(void *)(a1 + 40)];

  if ((v3 & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
    [v4 openURL:*(void *)(a1 + 32) configuration:0 completionHandler:0];
  }
}

id __42__VUIAppContext_JS___addPrivateInterfaces__block_invoke_11(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isString])
  {
    char v3 = [v2 toString];
    id v4 = [v3 dataUsingEncoding:4];

    id v5 = [v4 base64EncodedStringWithOptions:0];
LABEL_5:

    goto LABEL_7;
  }
  if ([v2 isInstanceOf:objc_opt_class()])
  {
    id v4 = [v2 toObject];
    id v6 = [v4 data];
    id v5 = [v6 base64EncodedStringWithOptions:0];

    goto LABEL_5;
  }
  id v5 = 0;
LABEL_7:

  return v5;
}

void __51__VUIAppContext_initWithApplication_mode_delegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    int v3 = [WeakRetained isValid];
    id v2 = v4;
    if (v3)
    {
      [v4 evaluate:&__block_literal_global_161];
      id v2 = v4;
    }
  }
}

void __51__VUIAppContext_initWithApplication_mode_delegate___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (const OpaqueJSContext *)[a2 JSGlobalContextRef];
  JSGarbageCollect(v2);
}

- (void)dealloc
{
  int v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VUIAppContext;
  [(VUIAppContext *)&v4 dealloc];
}

- (void)suspendWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __36__VUIAppContext_suspendWithOptions___block_invoke;
  v6[3] = &unk_1E6DF5490;
  objc_copyWeak(&v8, &location);
  id v5 = v4;
  id v7 = v5;
  [(VUIAppContext *)self _enqueueOnStartOrExecute:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __36__VUIAppContext_suspendWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __36__VUIAppContext_suspendWithOptions___block_invoke_2;
  v3[3] = &unk_1E6DF5920;
  id v4 = *(id *)(a1 + 32);
  [WeakRetained evaluate:v3];
}

void __36__VUIAppContext_suspendWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 objectForKeyedSubscript:@"App"];
  id v7 = [v4 toObjectOfClass:objc_opt_class()];

  if (*(void *)(a1 + 32)) {
    uint64_t v5 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CC08];
  }
  [v7 suspendAppWithOptions:v5];
  id v6 = (const OpaqueJSContext *)[v3 JSGlobalContextRef];

  JSGarbageCollect(v6);
}

- (void)resumeWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __35__VUIAppContext_resumeWithOptions___block_invoke;
  v6[3] = &unk_1E6DF3F90;
  objc_copyWeak(&v8, &location);
  void v6[4] = self;
  id v5 = v4;
  id v7 = v5;
  [(VUIAppContext *)self _enqueueOnStartOrExecute:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __35__VUIAppContext_resumeWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __35__VUIAppContext_resumeWithOptions___block_invoke_2;
  v4[3] = &unk_1E6DFD698;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [WeakRetained evaluate:v4];
}

void __35__VUIAppContext_resumeWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VUIDefaultLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E2BD7000, v4, OS_LOG_TYPE_INFO, "[StartQueue] resumeWithOptions evaluated", buf, 2u);
  }

  if ([*(id *)(a1 + 32) isValid]) {
    id v5 = "yes";
  }
  else {
    id v5 = "no";
  }
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = objc_opt_class();
  NSLog(&cfstr_ValidContextSR.isa, v5, v6, v7);
  id v8 = [v3 objectForKeyedSubscript:@"App"];

  id v9 = [v8 toObjectOfClass:objc_opt_class()];

  if (*(void *)(a1 + 40)) {
    uint64_t v10 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v10 = MEMORY[0x1E4F1CC08];
  }
  [v9 resumeAppWithOptions:v10];
}

- (void)reload
{
}

- (void)stop
{
}

- (void)evaluate:(id)a3 completionBlock:(id)a4
{
}

- (void)addPostEvaluateBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(VUIAppContext *)self postEvaluationBlocks];

  if (v5)
  {
    uint64_t v6 = [(VUIAppContext *)self postEvaluationBlocks];
    uint64_t v7 = (void *)[v4 copy];
    [(VUIAppContext *)v6 addObject:v7];
  }
  else
  {
    uint64_t v6 = self;
    objc_sync_enter(v6);
    if ([(VUIAppContext *)v6 canAccessPendingQueue])
    {
      objc_initWeak(&location, v6);
      id v8 = [VUIRunLoopSourceRecord alloc];
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __38__VUIAppContext_addPostEvaluateBlock___block_invoke;
      v12[3] = &unk_1E6DF4D78;
      objc_copyWeak(&v14, &location);
      id v13 = v4;
      id v9 = [(VUIRunLoopSourceRecord *)v8 initWithEvaluateBlock:v12 completionBlock:0];
      uint64_t v10 = [(VUIAppContext *)v6 pendingQueue];
      [v10 insertObject:v9 atIndex:0];

      if (v6->_jsThreadRunLoop)
      {
        jsThreadRunLoopSource = v6->_jsThreadRunLoopSource;
        if (jsThreadRunLoopSource)
        {
          CFRunLoopSourceSignal(jsThreadRunLoopSource);
          CFRunLoopWakeUp(v6->_jsThreadRunLoop);
        }
      }

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    objc_sync_exit(v6);
  }
}

void __38__VUIAppContext_addPostEvaluateBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _doEvaluate:*(void *)(a1 + 32)];
}

- (void)setException:(id)a3 withErrorMessage:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [(VUIAppContext *)self jsContext];
  if (v11) {
    [MEMORY[0x1E4F30938] valueWithObject:v11 inContext:v7];
  }
  else {
  id v8 = [MEMORY[0x1E4F30938] valueWithNewErrorFromMessage:v6 inContext:v7];
  }
  id v9 = [MEMORY[0x1E4F30938] valueWithBool:1 inContext:v7];
  [v8 setObject:v9 forKeyedSubscript:@"errorDispatched"];

  [v7 setException:v8];
  uint64_t v10 = [(VUIAppContext *)self _errorWithMessage:v6];
  [(VUIAppContext *)self _dispatchError:v10];
}

- (void)handleReloadWithUrgencyType:(unint64_t)a3 minInterval:(double)a4 data:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__VUIAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke;
  block[3] = &unk_1E6DFD6C0;
  objc_copyWeak(v12, &location);
  id v11 = v8;
  v12[1] = (id)a3;
  v12[2] = *(id *)&a4;
  id v9 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

void __62__VUIAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke(uint64_t a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = objc_opt_new();
  [v3 setReloadData:*(void *)(a1 + 32)];
  id v4 = [WeakRetained delegate];
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained setReloadContext:v3];
    uint64_t v5 = *(void *)(a1 + 48);
    id v8 = @"VUIAppReloadUrgencyMinSuspensionTime";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithDouble:*(double *)(a1 + 56)];
    v9[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v4 appContext:WeakRetained needsReloadWithUrgency:v5 options:v7];
  }
  else
  {
    id v6 = [WeakRetained app];
    uint64_t v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __62__VUIAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke_cold_1(WeakRetained, v6);
    }
  }
}

void __31__VUIAppContext__startWithURL___block_invoke_92(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4FB3E18];
  uint64_t v7 = *MEMORY[0x1E4FB3E20];
  id v4 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24)];
  v8[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  id v6 = [v2 errorWithDomain:v3 code:101 userInfo:v5];

  [*(id *)(a1 + 32) contextDidFailWithError:v6];
}

void __31__VUIAppContext__startWithURL___block_invoke_93(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4FB3E18];
  uint64_t v6 = *MEMORY[0x1E4FB3E20];
  v7[0] = &unk_1F3F3E0C0;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  uint64_t v5 = [v2 errorWithDomain:v3 code:101 userInfo:v4];

  [*(id *)(a1 + 32) contextDidFailWithError:v5];
}

void __44__VUIAppContext__startWithScript_scriptUrl___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB3E18] code:101 userInfo:0];
  [*(id *)(a1 + 32) contextDidFailWithError:v2];
}

void __44__VUIAppContext__startWithScript_scriptUrl___block_invoke_100(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v3 = *MEMORY[0x1E4FB3E18];
  id v4 = [*(id *)(a1 + 32) toDictionary];
  id v5 = [v2 errorWithDomain:v3 code:101 userInfo:v4];

  [*(id *)(a1 + 40) contextDidFailWithError:v5];
}

- (void)_addStopRecordToPendingQueueWithReload:(BOOL)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if ([(VUIAppContext *)v4 canAccessPendingQueue])
  {
    [(VUIAppContext *)v4 setCanAccessPendingQueue:0];
    objc_initWeak(&location, v4);
    id v5 = [VUIRunLoopSourceRecord alloc];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __56__VUIAppContext__addStopRecordToPendingQueueWithReload___block_invoke;
    v9[3] = &unk_1E6DF5330;
    objc_copyWeak(&v10, &location);
    BOOL v11 = a3;
    uint64_t v6 = [(VUIRunLoopSourceRecord *)v5 initWithEvaluateBlock:v9 completionBlock:0];
    uint64_t v7 = [(VUIAppContext *)v4 pendingQueue];
    [v7 addObject:v6];

    if (v4->_jsThreadRunLoop)
    {
      jsThreadRunLoopSource = v4->_jsThreadRunLoopSource;
      if (jsThreadRunLoopSource)
      {
        CFRunLoopSourceSignal(jsThreadRunLoopSource);
        CFRunLoopWakeUp(v4->_jsThreadRunLoop);
      }
    }

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  objc_sync_exit(v4);
}

void __56__VUIAppContext__addStopRecordToPendingQueueWithReload___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _stopAndReload:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_stopAndReload:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:@"VUINetworkPropertiesChangedNotification" object:0];

  uint64_t v6 = VUIDefaultLogObject();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    *(_DWORD *)buf = 138413058;
    id v14 = v8;
    __int16 v15 = 2048;
    unint64_t v16 = [(VUIAppContext *)self mode];
    __int16 v17 = 2048;
    id v18 = self;
    __int16 v19 = 1024;
    BOOL v20 = v3;
    _os_log_impl(&dword_1E2BD7000, v6, OS_LOG_TYPE_DEFAULT, "<%@ (%lu): %p> Stop and reload %d", buf, 0x26u);
  }
  [(VUIAppContext *)self setIsValid:0];
  [(VUIAppContext *)self setJsContext:0];
  if (v3)
  {
    [(VUIAppContext *)self _invalidateJSThread];
  }
  else
  {
    [(VUIAppContext *)self setNextJSChecksum:0];
    id v9 = self;
    objc_sync_enter(v9);
    id v10 = [(VUIAppContext *)v9 onStartQueue];
    [v10 removeAllObjects];

    objc_sync_exit(v9);
    [(VUIAppContext *)v9 _invalidateJSThread];
    [(VUIAppContext *)v9 setReloadContext:0];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__VUIAppContext__stopAndReload___block_invoke;
  v11[3] = &unk_1E6DF51F0;
  void v11[4] = self;
  BOOL v12 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __32__VUIAppContext__stopAndReload___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) contextDidStopWithOptions:0];
  if (*(unsigned char *)(a1 + 40))
  {
    BOOL v3 = *(void **)(a1 + 32);
    return [v3 start];
  }
  return result;
}

void __31__VUIAppContext__sourcePerform__block_invoke_2(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4E6FAE0]();
  BOOL v3 = [*(id *)(a1 + 32) completionBlock];
  v3[2](v3, 1);
}

- (void)_sourceCanceledOnRunLoop:(__CFRunLoop *)a3
{
  obj = self;
  objc_sync_enter(obj);
  CFRunLoopRemoveSource(obj->_jsThreadRunLoop, obj->_jsThreadRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
  CFRunLoopStop(obj->_jsThreadRunLoop);
  objc_sync_exit(obj);
}

- (void)_invalidateJSThread
{
  obj = self;
  objc_sync_enter(obj);
  CFRunLoopSourceInvalidate(obj->_jsThreadRunLoopSource);
  CFRunLoopWakeUp(obj->_jsThreadRunLoop);
  obj->_jsThreadRunLoop = 0;
  obj->_jsThreadRunLoopSource = 0;
  id v2 = [(VUIAppContext *)obj pendingQueue];
  [v2 removeAllObjects];

  [(VUIAppContext *)obj setPendingQueue:0];
  [(VUIAppContext *)obj setCanAccessPendingQueue:0];
  [(VUIAppContext *)obj setRunning:0];
  objc_sync_exit(obj);
}

- (id)_errorWithMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(VUIAppContext *)self jsContext];
  uint64_t v6 = [v5 objectForKeyedSubscript:@"Error"];
  uint64_t v7 = [v6 constructWithArguments:MEMORY[0x1E4F1CBF0]];

  [v7 setObject:v4 forKeyedSubscript:@"message"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = objc_msgSend(v7, "objectForKeyedSubscript:", @"stack", 0);
  id v9 = [v8 toString];
  id v10 = [v9 componentsSeparatedByString:@"\n"];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v23 != v13) {
          objc_enumerationMutation(v10);
        }
        __int16 v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (([v15 isEqualToString:@"[native code]"] & 1) == 0)
        {
          [v7 setObject:v15 forKeyedSubscript:@"sourceURL"];
          unint64_t v16 = [v15 componentsSeparatedByString:@":"];
          unint64_t v17 = [v16 count];
          if (v17 >= 3)
          {
            unint64_t v18 = v17;
            __int16 v19 = [v16 objectAtIndex:v17 - 2];
            BOOL v20 = [v16 objectAtIndex:v18 - 1];
            if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
            {
              [v7 setObject:v19 forKeyedSubscript:@"line"];
              [v7 setObject:v20 forKeyedSubscript:@"column"];
            }
          }
          goto LABEL_16;
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v7;
}

- (void)_enqueueOnStartOrExecute:(id)a3
{
  aBlock = (void (**)(void))a3;
  if ([(VUIAppContext *)self isValid])
  {
    aBlock[2]();
  }
  else
  {
    id v4 = self;
    objc_sync_enter(v4);
    id v5 = [(VUIAppContext *)v4 onStartQueue];
    uint64_t v6 = _Block_copy(aBlock);
    [v5 addObject:v6];

    objc_sync_exit(v4);
  }
}

- (void)contextDidStopWithOptions:(id)a3
{
  id v4 = [(VUIAppContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 appContext:self didStopWithOptions:0];
  }
}

- (void)contextDidFailWithError:(id)a3
{
  id v5 = a3;
  [(VUIAppContext *)self setRunning:0];
  id v4 = [(VUIAppContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 appContext:self didFailWithError:v5];
  }
}

- (VUIJSFoundation)jsFoundation
{
  return self->_jsFoundation;
}

- (double)appScriptTimeoutInterval
{
  return self->_appScriptTimeoutInterval;
}

- (void)setAppScriptTimeoutInterval:(double)a3
{
  self->_appScriptTimeoutInterval = a3;
}

- (void)setRemoteInspectionEnabled:(BOOL)a3
{
  self->_remoteInspectionEnabled = a3;
}

- (NSString)nextJSChecksum
{
  return self->_nextJSChecksum;
}

- (void)setNextJSChecksum:(id)a3
{
}

- (NSString)responseScript
{
  return self->_responseScript;
}

- (void)setResponseScript:(id)a3
{
}

- (NSError)responseError
{
  return self->_responseError;
}

- (void)setResponseError:(id)a3
{
}

- (void)setReloadContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postEvaluationBlocks, 0);
  objc_storeStrong((id *)&self->_pendingQueue, 0);
  objc_storeStrong((id *)&self->_reloadContext, 0);
  objc_storeStrong((id *)&self->_responseError, 0);
  objc_storeStrong((id *)&self->_responseScript, 0);
  objc_storeStrong((id *)&self->_onStartQueue, 0);
  objc_storeStrong((id *)&self->_nextJSChecksum, 0);
  objc_storeStrong((id *)&self->_jsContext, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_jsFoundation, 0);
  objc_storeStrong((id *)&self->_jsApp, 0);
  objc_destroyWeak((id *)&self->_app);
  objc_storeStrong((id *)&self->_lowMemoryWarningSource, 0);
}

void __62__VUIAppContext_handleReloadWithUrgencyType_minInterval_data___block_invoke_cold_1(void *a1, void *a2)
{
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [a1 mode];
  uint64_t v6 = [a2 appIdentifier];
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_3_31(&dword_1E2BD7000, v7, v8, "VUIAppContext - <%@ (%lu): %p> %@ hasn't implemented reload API", v9, v10, v11, v12, v13);
}

- (void)_startWithURL:(void *)a1 .cold.1(void *a1)
{
  id v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  [a1 mode];
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_4_17(&dword_1E2BD7000, v4, v5, "<%@ (%lu): %p> Failed to load launch URL due to no app loader provided", v6, v7, v8, v9, v10);
}

- (void)_startWithScript:(void *)a1 scriptUrl:.cold.1(void *a1)
{
  id v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  [a1 mode];
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_2_7();
  OUTLINED_FUNCTION_3_31(&dword_1E2BD7000, v4, v5, "<%@ (%lu): %p> Trying to load a script with zero length from %@", v6, v7, v8, v9, v10);
}

- (void)_doEvaluate:(void *)a1 .cold.1(void *a1)
{
  id v2 = (objc_class *)objc_opt_class();
  BOOL v3 = NSStringFromClass(v2);
  [a1 mode];
  OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_4_17(&dword_1E2BD7000, v4, v5, "<%@ (%lu): %p> Evaluating block without JSContext", v6, v7, v8, v9, v10);
}

@end