@interface MXMInstrument
+ (MXMInstrument)activeInstrument;
+ (MXMInstrument)instrumentWithInstrumentals:(id)a3;
+ (void)load;
- ($6284FEDF7B3A0B615FD11F40896223C5)currentIteration;
- (BOOL)active;
- (BOOL)didQuiesce;
- (BOOL)startWithError:(id *)a3;
- (MXMInstrument)initWithInstrumentals:(id)a3;
- (NSArray)instrumentals;
- (NSData)perfMetricsPerfdata;
- (NSString)performanceTraceFileSandboxExtensionToken;
- (NSURL)performanceTraceFileURL;
- (OS_dispatch_queue)instrumentalsQueue;
- (id)_defaultValueWithOption:(id)a3;
- (id)_makeInstrumentalsForIteration:(id)a3 shouldCopy:(BOOL)a4;
- (id)_transitionWithState:(unint64_t)a3 iteration:(id *)a4 instrumentals:(id)a5;
- (id)_validOptionKeys;
- (id)_valueWithOption:(id)a3 userOptions:(id)a4;
- (id)measureAutomatically:(unint64_t)a3 block:(id)a4;
- (id)measureAutomatically:(unint64_t)a3 options:(id)a4 block:(id)a5;
- (id)measureBlock:(id)a3;
- (id)measureWithOptions:(id)a3 block:(id)a4;
- (id)stop;
- (id)stopWithError:(id *)a3;
- (void)_makePerfDataFromMXMResults:(id)a3 testName:(id)a4;
- (void)_prepareIteration:(id *)a3 options:(id)a4 instrumentals:(id)a5 errors:(id)a6;
- (void)_setupAndRunWithIteration:(id *)a3 spawnThread:(BOOL)a4 attrs:(_opaque_pthread_attr_t *)a5 pthread:(_opaque_pthread_t *)a6 returnCode:(unint64_t *)a7;
- (void)dealloc;
- (void)setActive:(BOOL)a3;
- (void)setCurrentIteration:(id *)a3;
- (void)start;
@end

@implementation MXMInstrument

+ (void)load
{
}

+ (MXMInstrument)activeInstrument
{
  id WeakRetained = objc_loadWeakRetained(&_activeInstrument);
  return (MXMInstrument *)WeakRetained;
}

- (void)setActive:(BOOL)a3
{
  BOOL v3 = a3;
  id obj = objc_loadWeakRetained(&_activeInstrument);
  objc_sync_enter(obj);
  id WeakRetained = (MXMInstrument *)objc_loadWeakRetained(&_activeInstrument);

  if (v3)
  {
    if (!WeakRetained) {
      goto LABEL_6;
    }
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MXMInstrument.m" lineNumber:93 description:@"Cannot activate instrument while another is already active."];
  }
  else
  {
    if (WeakRetained == self)
    {
      self = 0;
      goto LABEL_6;
    }
    v7 = [MEMORY[0x263F08690] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"MXMInstrument.m" lineNumber:97 description:@"Cannot deactivate the instrument if the active instrument is not self."];
    self = 0;
  }

LABEL_6:
  objc_storeWeak(&_activeInstrument, self);
  objc_sync_exit(obj);
}

- (BOOL)active
{
  id WeakRetained = objc_loadWeakRetained(&_activeInstrument);
  objc_sync_enter(WeakRetained);
  v4 = (MXMInstrument *)objc_loadWeakRetained(&_activeInstrument);
  LOBYTE(self) = v4 == self;

  objc_sync_exit(WeakRetained);
  return (char)self;
}

+ (MXMInstrument)instrumentWithInstrumentals:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc((Class)a1) initWithInstrumentals:v4];

  return (MXMInstrument *)v5;
}

- (MXMInstrument)initWithInstrumentals:(id)a3
{
  id v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MXMInstrument;
  v7 = [(MXMInstrument *)&v15 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_instrumentals, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.metricmeasurement.instrument.instrumentals", MEMORY[0x263EF83A8]);
    instrumentalsQueue = v8->_instrumentalsQueue;
    v8->_instrumentalsQueue = (OS_dispatch_queue *)v9;
  }
  v11 = [(MXMInstrument *)v8 instrumentals];
  uint64_t v12 = [v11 count];

  if (!v12)
  {
    v14 = [MEMORY[0x263F08690] currentHandler];
    [v14 handleFailureInMethod:a2 object:v8 file:@"MXMInstrument.m" lineNumber:121 description:@"Cannot initialize instrument without any instrumentals."];
  }
  return v8;
}

- (void)_prepareIteration:(id *)a3 options:(id)a4 instrumentals:(id)a5 errors:(id)a6
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v20 = a4;
  id v8 = a5;
  id val = a6;
  group = dispatch_group_create();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = v8;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v13 = objc_initWeak(&location, v12);
        char v14 = objc_opt_respondsToSelector();

        if (v14)
        {
          objc_initWeak(&from, val);
          objc_super v15 = [(MXMInstrument *)self instrumentalsQueue];
          block[0] = MEMORY[0x263EF8330];
          block[1] = 3221225472;
          block[2] = __64__MXMInstrument__prepareIteration_options_instrumentals_errors___block_invoke;
          block[3] = &unk_264525488;
          objc_copyWeak(&v25, &location);
          id v24 = v20;
          objc_copyWeak(&v26, &from);
          dispatch_group_async(group, v15, block);

          objc_destroyWeak(&v26);
          objc_destroyWeak(&v25);
          objc_destroyWeak(&from);
        }
        objc_destroyWeak(&location);
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v9);
  }

  dispatch_time_t v16 = dispatch_time(0, 10000000000);
  dispatch_group_wait(group, v16);
  a3->var4 = 1;
}

void __64__MXMInstrument__prepareIteration_options_instrumentals_errors___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = *(void *)(a1 + 32);
  id v6 = 0;
  [WeakRetained prepareWithOptions:v3 error:&v6];
  id v4 = v6;

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)(a1 + 48));
    [v5 addObject:v4];
  }
}

- (void)_setupAndRunWithIteration:(id *)a3 spawnThread:(BOOL)a4 attrs:(_opaque_pthread_attr_t *)a5 pthread:(_opaque_pthread_t *)a6 returnCode:(unint64_t *)a7
{
  BOOL v10 = a4;
  uint64_t v53 = *MEMORY[0x263EF8340];
  if (!a3)
  {
    v39 = [MEMORY[0x263F08690] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"MXMInstrument.m", 480, @"Invalid parameter not satisfying: %@", @"iteration" object file lineNumber description];
  }
  if (a3->var3)
  {
    if (a3->var4
      || ([MEMORY[0x263F08690] currentHandler],
          v40 = objc_claimAutoreleasedReturnValue(),
          [v40 handleFailureInMethod:a2 object:self file:@"MXMInstrument.m" lineNumber:486 description:@"Iteration is not in proper state."], v40, a3->var3))
    {
      char v14 = [MEMORY[0x263F08690] currentHandler];
      [v14 handleFailureInMethod:a2 object:self file:@"MXMInstrument.m" lineNumber:487 description:@"Iteration is not in proper state."];
    }
  }
  else if (!a3->var4)
  {
    id v43 = [MEMORY[0x263EFF940] exceptionWithName:@"MXMInstrumentErrorDomain" reason:@"Iteration is uninitialized." userInfo:0];
    objc_exception_throw(v43);
  }
  a3->var4 = 1;
  a3->var3 = 1;
  if (!v10)
  {
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    objc_super v15 = a3->var14;
    if (a3->var20 != 0.0 && a3->var21 != 0.0)
    {
      dispatch_time_t v16 = +[MXMProxyServiceManager shared];
      double var20 = a3->var20;
      double var21 = a3->var21;
      *(void *)&long long v48 = MEMORY[0x263EF8330];
      *((void *)&v48 + 1) = 3221225472;
      v49 = __MXMQuiesceBeforeIteration_block_invoke;
      v50 = &unk_2645254D8;
      v51 = v15;
      v52 = &v44;
      [v16 _quiesceBeforeIteration:&v48 timeout:var20 response:var21];
    }
    uint64_t v19 = v45[3];
    _Block_object_dispose(&v44, 8);
    if (v19 == 6)
    {
      *a7 = 6;
      return;
    }
    id v20 = a3->var22;
    v21 = _MXMGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v48) = 138412290;
      *(void *)((char *)&v48 + 4) = v20;
      _os_log_impl(&dword_21FA7B000, v21, OS_LOG_TYPE_DEBUG, "Attempting to uncache before iteration with config: %@", (uint8_t *)&v48, 0xCu);
    }

    if (a3->var22 && [v20 count])
    {
      v22 = +[MXMProxyServiceManager shared];
      [v22 _uncacheBeforeIteration:v20 response:&__block_literal_global_5];
    }
    v23 = a3->var23;
    id v24 = _MXMGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(v48) = 138412290;
      *(void *)((char *)&v48 + 4) = v23;
      _os_log_impl(&dword_21FA7B000, v24, OS_LOG_TYPE_DEBUG, "Attempting to terminate before iteration with config: %@", (uint8_t *)&v48, 0xCu);
    }

    if (a3->var23 && [v23 count])
    {
      id v25 = +[MXMProxyServiceManager shared];
      [v25 _terminateProcessesBeforeIteration:v23 response:&__block_literal_global_265];
    }
    id v26 = a3->var19;
    uint64_t v44 = 0;
    v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 1;
    if (a3->var18)
    {
      v27 = +[MXMProxyServiceManager shared];
      *(void *)&long long v48 = MEMORY[0x263EF8330];
      *((void *)&v48 + 1) = 3221225472;
      v49 = __MXMStartPerformanceTraceCollection_block_invoke;
      v50 = &unk_264525520;
      v51 = &v44;
      [v27 _startPerformanceTrace:v26 response:&v48];

      if (v45[3] == 1)
      {
        if (v26)
        {
          v27 = [v26 objectForKeyedSubscript:@"requiredForTestContinuation"];
          if (!v27) {
            goto LABEL_40;
          }
        }
        long long v28 = [v26 objectForKeyedSubscript:@"requiredForTestContinuation"];
        int v29 = [v28 BOOLValue];

        if (v26)
        {

          if ((v29 & 1) == 0) {
            goto LABEL_34;
          }
LABEL_40:
          [a3->var14 setActive:0];
          id v35 = [MEMORY[0x263EFF940] exceptionWithName:@"MXMInstrumentErrorDomain" reason:@"Unable to start performance trace collection. See error logs for more detail." userInfo:0];
          objc_exception_throw(v35);
        }
        if (v29) {
          goto LABEL_40;
        }
      }
    }
LABEL_34:
    uint64_t v30 = v45[3];
    _Block_object_dispose(&v44, 8);

    *a7 = MXMRunBlockIteration((uint64_t)a3);
    if (!v30)
    {
      id v31 = v26;
      uint64_t v44 = 0;
      v45 = &v44;
      uint64_t v46 = 0x2020000000;
      uint64_t v47 = 0;
      v32 = a3->var14;
      v33 = +[MXMProxyServiceManager shared];
      *(void *)&long long v48 = MEMORY[0x263EF8330];
      *((void *)&v48 + 1) = 3221225472;
      v49 = __MXMStopPerformanceTraceCollection_block_invoke;
      v50 = &unk_264525548;
      uint64_t v34 = v32;
      v51 = v34;
      v52 = &v44;
      [v33 _stopPerformanceTrace:&v48];

      if (v45[3] == 3)
      {
        if (v31)
        {
          v33 = [v31 objectForKeyedSubscript:@"requiredForTestContinuation"];
          if (!v33)
          {
LABEL_47:
            [v34 setActive:0];
            id v38 = [MEMORY[0x263EFF940] exceptionWithName:@"MXMInstrumentErrorDomain" reason:@"Unable to collect performance trace. See error logs for more detail." userInfo:0];
            objc_exception_throw(v38);
          }
        }
        v36 = [v31 objectForKeyedSubscript:@"requiredForTestContinuation"];
        int v37 = [v36 BOOLValue];

        if (v31)
        {

          if (v37) {
            goto LABEL_47;
          }
        }
        else if (v37)
        {
          goto LABEL_47;
        }
      }

      _Block_object_dispose(&v44, 8);
    }

    return;
  }
  *(void *)&long long v48 = 0;
  if (!a3->var16)
  {
    v41 = [MEMORY[0x263F08690] currentHandler];
    [v41 handleFailureInMethod:a2, self, @"MXMInstrument.m", 496, @"Invalid parameter not satisfying: %@", @"iteration->invocationBlock" object file lineNumber description];
  }
  if (pthread_create((pthread_t *)&v48, a5, (void *(__cdecl *)(void *))MXMRunBlockIteration, a3))
  {
    v42 = [MEMORY[0x263F08690] currentHandler];
    [v42 handleFailureInMethod:a2 object:self file:@"MXMInstrument.m" lineNumber:498 description:@"Failed to spawn posix thread!"];
  }
  else if (a6)
  {
    *a6 = (_opaque_pthread_t *)v48;
  }
}

- (id)_transitionWithState:(unint64_t)a3 iteration:(id *)a4 instrumentals:(id)a5
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v8 = a5;
  if (!a3)
  {
    uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"MXMInstrument.m", 530, @"Invalid parameter not satisfying: %@", @"transState != MXMIterationStateUninitialized" object file lineNumber description];
  }
  if (!a4->var4)
  {
    id v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"MXMInstrument.m", 531, @"Invalid parameter not satisfying: %@", @"iteration->transitionCompleted == YES" object file lineNumber description];
  }
  if (!a4->var3 && !a4->var4)
  {
    v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2 object:self file:@"MXMInstrument.m" lineNumber:532 description:@"Internal Error: Cannot transition from an unintiailized state."];
  }
  if (a3 == 4)
  {
    p_var6 = &a4->var6;
    goto LABEL_12;
  }
  if (a3 == 2)
  {
    p_var6 = &a4->var5;
LABEL_12:
    id v26 = (void *)*p_var6;
    goto LABEL_14;
  }
  id v26 = 0;
LABEL_14:
  id v24 = a4;
  if (a3 == 4)
  {
    p_var8 = &a4->var8;
  }
  else
  {
    if (a3 != 2)
    {
      v11 = 0;
      goto LABEL_20;
    }
    p_var8 = &a4->var7;
  }
  v11 = (void *)*p_var8;
LABEL_20:
  uint64_t v12 = (void *)a3;
  if ((a3 & 0xFFFFFFFFFFFFFFFDLL) != 1 && !v26)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2 object:self file:@"MXMInstrument.m" lineNumber:538 description:@"Couldn't acquire timestamp for transition state that is not 'did start -> will stop' or 'uninit -> will start'."];
  }
  id v13 = dispatch_group_create();
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(obj);
        }
        objc_initWeak(&location, *(id *)(*((void *)&v29 + 1) + 8 * i));
        v17 = [(MXMInstrument *)self instrumentalsQueue];
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __62__MXMInstrument__transitionWithState_iteration_instrumentals___block_invoke;
        block[3] = &unk_2645254B0;
        v28[1] = v12;
        objc_copyWeak(v28, &location);
        v28[3] = (id)v24;
        v28[4] = (id)a2;
        v28[2] = v26;
        void block[4] = self;
        v28[5] = v11;
        dispatch_group_async(v13, v17, block);

        objc_destroyWeak(v28);
        objc_destroyWeak(&location);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v14);
  }

  return v13;
}

void __62__MXMInstrument__transitionWithState_iteration_instrumentals___block_invoke(uint64_t a1)
{
  switch(*(void *)(a1 + 48))
  {
    case 1:
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
      char v3 = objc_opt_respondsToSelector();

      if (v3)
      {
        id v20 = objc_loadWeakRetained((id *)(a1 + 40));
        [v20 willStartAtEstimatedTime:*(void *)(a1 + 56)];
        goto LABEL_23;
      }
      break;
    case 2:
      id v4 = objc_loadWeakRetained((id *)(a1 + 40));
      char v5 = objc_opt_respondsToSelector();

      if (v5)
      {
        id v20 = *(id *)(*(void *)(a1 + 64) + 72);
        if (!v20)
        {
          v17 = [MEMORY[0x263F08690] currentHandler];
          [v17 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"MXMInstrument.m" lineNumber:555 description:@"Failed to record start date."];
        }
        id v6 = objc_loadWeakRetained((id *)(a1 + 40));
        [v6 didStartAtContinuousTime:*(void *)(a1 + 80) absoluteTime:*(void *)(a1 + 56) startDate:v20];
        goto LABEL_22;
      }
      id v12 = objc_loadWeakRetained((id *)(a1 + 40));
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        id v20 = *(id *)(*(void *)(a1 + 64) + 72);
        if (!v20)
        {
          uint64_t v19 = [MEMORY[0x263F08690] currentHandler];
          [v19 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"MXMInstrument.m" lineNumber:559 description:@"Failed to record start date."];
        }
        id v6 = objc_loadWeakRetained((id *)(a1 + 40));
        [v6 didStartAtTime:*(void *)(a1 + 56) startDate:v20];
        goto LABEL_22;
      }
      break;
    case 3:
      v7 = (id *)(a1 + 40);
      id v8 = objc_loadWeakRetained((id *)(a1 + 40));
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v20 = objc_loadWeakRetained(v7);
        [v20 willStop];
        goto LABEL_23;
      }
      break;
    case 4:
      id v10 = objc_loadWeakRetained((id *)(a1 + 40));
      char v11 = objc_opt_respondsToSelector();

      if (v11)
      {
        id v20 = *(id *)(*(void *)(a1 + 64) + 80);
        if (!v20)
        {
          dispatch_time_t v16 = [MEMORY[0x263F08690] currentHandler];
          [v16 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"MXMInstrument.m" lineNumber:571 description:@"Failed to record stop date."];
        }
        id v6 = objc_loadWeakRetained((id *)(a1 + 40));
        [v6 didStopAtContinuousTime:*(void *)(a1 + 80) absoluteTime:*(void *)(a1 + 56) stopDate:v20];
      }
      else
      {
        id v14 = objc_loadWeakRetained((id *)(a1 + 40));
        char v15 = objc_opt_respondsToSelector();

        if ((v15 & 1) == 0) {
          return;
        }
        id v20 = *(id *)(*(void *)(a1 + 64) + 80);
        if (!v20)
        {
          v18 = [MEMORY[0x263F08690] currentHandler];
          [v18 handleFailureInMethod:*(void *)(a1 + 72) object:*(void *)(a1 + 32) file:@"MXMInstrument.m" lineNumber:575 description:@"Failed to record stop date."];
        }
        id v6 = objc_loadWeakRetained((id *)(a1 + 40));
        [v6 didStopAtTime:*(void *)(a1 + 56) stopDate:v20];
      }
LABEL_22:

LABEL_23:

      break;
    default:
      return;
  }
}

- (void)start
{
}

- (BOOL)startWithError:(id *)a3
{
  v24[1] = *MEMORY[0x263EF8340];
  if ([(MXMInstrument *)self active]
    && [(MXMInstrument *)self currentIteration]
    && (void)[(MXMInstrument *)self currentIteration][152])
  {
    id v6 = [(MXMInstrument *)self currentIteration];
LABEL_17:
    BOOL v9 = 1;
    v6->var3 = 1;
    v6->var4 = 1;
    id v8 = [(MXMInstrument *)self _transitionWithState:1 iteration:v6 instrumentals:v6->var15];
    dispatch_group_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
    thread_selfcounts();
    v6->var7 = mach_continuous_time();
    v6->var5 = mach_absolute_time();
    v6->var9 = [MEMORY[0x263EFF910] date];
    v6->var11 = 0uLL;
    goto LABEL_18;
  }
  if (![(MXMInstrument *)self active] && ![(MXMInstrument *)self currentIteration])
  {
    id v10 = (char *)malloc_type_malloc(0xD0uLL, 0x10800409D133E64uLL);
    self->_currentIteration = ($6284FEDF7B3A0B615FD11F40896223C5 *)v10;
    *((void *)v10 + 3) = 0;
    v10[32] = 0;
    *((_DWORD *)v10 + 4) = 0;
    *(void *)id v10 = 0;
    *((void *)v10 + 1) = 0;
    *((void *)v10 + 5) = 0;
    *((void *)v10 + 6) = 0;
    *((void *)v10 + 9) = 0;
    *((void *)v10 + 1objc_storeWeak(&_activeInstrument, 0) = 0;
    *((void *)v10 + 15) = 3;
    *((_OWORD *)v10 + 8) = 0u;
    *((_OWORD *)v10 + 9) = 0u;
    v10[160] = 0;
    *(_OWORD *)(v10 + 168) = 0u;
    *(_OWORD *)(v10 + 184) = 0u;
    *((void *)v10 + 25) = 0;
    currentIteration = self->_currentIteration;
    if (currentIteration->var3 || currentIteration->var4)
    {
      id v20 = [MEMORY[0x263F08690] currentHandler];
      [v20 handleFailureInMethod:a2 object:self file:@"MXMInstrument.m" lineNumber:603 description:@"Failed to initialize internal state for instrument."];
    }
    [(MXMInstrument *)self setActive:1];
    id v6 = [(MXMInstrument *)self currentIteration];
    id v8 = [MEMORY[0x263EFF980] array];
    id v12 = [(MXMInstrument *)self instrumentals];
    char v13 = [(MXMInstrument *)self _makeInstrumentalsForIteration:v12 shouldCopy:0];
    instrumentals = self->_instrumentals;
    self->_instrumentals = v13;

    char v15 = [(MXMInstrument *)self instrumentals];
    [(MXMInstrument *)self _prepareIteration:v6 options:0 instrumentals:v15 errors:v8];

    v6->var2 = MEMORY[0x223C57660]();
    *(_OWORD *)&v6->var0 = xmmword_21FA98550;
    v6->var14 = self;
    dispatch_time_t v16 = [(MXMInstrument *)self instrumentals];
    v6->var15 = [(MXMInstrument *)self _makeInstrumentalsForIteration:v16 shouldCopy:0];

    if ([v8 count])
    {
      if (a3)
      {
        v17 = (void *)MEMORY[0x263F087E8];
        uint64_t v23 = *MEMORY[0x263F07F80];
        v24[0] = @"Failed to prepare all instrumentals.";
        v18 = [NSDictionary dictionaryWithObjects:v24 forKeys:&v23 count:1];
        *a3 = [v17 errorWithDomain:@"MXMInstrumentErrorDomain" code:1 userInfo:v18];
      }
      BOOL v9 = 0;
      goto LABEL_18;
    }

    goto LABEL_17;
  }
  if (a3)
  {
    v7 = (void *)MEMORY[0x263F087E8];
    uint64_t v21 = *MEMORY[0x263F07F80];
    v22 = @"Cannot start. Instrument already active.";
    id v8 = [NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v7 errorWithDomain:@"MXMInstrumentErrorDomain" code:1 userInfo:v8];
    BOOL v9 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:

    return v9;
  }
  return 0;
}

- (id)stop
{
  return [(MXMInstrument *)self stopWithError:0];
}

- (id)stopWithError:(id *)a3
{
  v45[1] = *MEMORY[0x263EF8340];
  $7DEDF3842AEFB7F1E6DF5AF62E424A02 v42 = ($7DEDF3842AEFB7F1E6DF5AF62E424A02)0;
  thread_selfcounts();
  uint64_t v6 = mach_absolute_time();
  uint64_t v7 = mach_continuous_time();
  uint64_t v35 = [MEMORY[0x263EFF910] date];
  if ([(MXMInstrument *)self active])
  {
    int v8 = (int)[(MXMInstrument *)self currentIteration][16];
    if (v8 != MEMORY[0x223C57660]())
    {
      long long v29 = [MEMORY[0x263F08690] currentHandler];
      [v29 handleFailureInMethod:a2 object:self file:@"MXMInstrument.m" lineNumber:684 description:@"Must start and stop from same thread."];
    }
    SEL v31 = a2;
    BOOL v9 = [(MXMInstrument *)self currentIteration];
    v9->var12 = v42;
    v9->var8 = v7;
    v9->var6 = v6;
    v9->var10 = v35;
    v9->var3 = 2;
    v9->var4 = 1;
    id v10 = [(MXMInstrument *)self _transitionWithState:2 iteration:v9 instrumentals:v9->var15];
    dispatch_time_t v11 = dispatch_time(0, 1000000000);
    uint64_t v34 = v10;
    dispatch_group_wait(v10, v11);
    id v12 = [(MXMInstrument *)self _transitionWithState:3 iteration:v9 instrumentals:v9->var15];
    long long v32 = [(MXMInstrument *)self _transitionWithState:4 iteration:v9 instrumentals:v9->var15];
    dispatch_group_wait(v32, 0xFFFFFFFFFFFFFFFFLL);
    v33 = v12;
    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
    char v13 = objc_alloc_init(MXMMutableSampleData);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v14 = v9->var15;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v39 != v17) {
            objc_enumerationMutation(v14);
          }
          uint64_t v19 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          id v36 = 0;
          id v37 = 0;
          [v19 harvestData:&v37 error:&v36];
          id v20 = v37;
          id v21 = v36;
          v22 = v21;
          if (v20) {
            BOOL v23 = v21 == 0;
          }
          else {
            BOOL v23 = 0;
          }
          if (!v23)
          {
            long long v30 = [MEMORY[0x263F08690] currentHandler];
            id v24 = [v22 description];
            objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v31, self, @"MXMInstrument.m", 711);
          }
          [(MXMMutableSampleData *)v13 appendData:v20];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v38 objects:v43 count:16];
      }
      while (v16);
    }

    var17 = v9->var17;
    if (var17)
    {
      [*var17 setObject:v13 atIndexedSubscript:v9->var0];
    }
    else
    {
      CFRelease(v9->var15);
      CFRelease(v9->var9);
      [(MXMInstrument *)self setActive:0];
      free([(MXMInstrument *)self currentIteration]);
      [(MXMInstrument *)self setCurrentIteration:0];
    }

    v27 = v34;
    goto LABEL_22;
  }
  if (a3)
  {
    id v26 = (void *)MEMORY[0x263F087E8];
    uint64_t v44 = *MEMORY[0x263F07F80];
    v45[0] = @"Cannot stop. Instrument is inactive.";
    v27 = [NSDictionary dictionaryWithObjects:v45 forKeys:&v44 count:1];
    [v26 errorWithDomain:@"MXMInstrumentErrorDomain" code:1 userInfo:v27];
    char v13 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  char v13 = 0;
LABEL_23:

  return v13;
}

- (id)measureBlock:(id)a3
{
  return [(MXMInstrument *)self measureAutomatically:3 options:0 block:a3];
}

- (id)measureWithOptions:(id)a3 block:(id)a4
{
  return [(MXMInstrument *)self measureAutomatically:3 options:a3 block:a4];
}

- (id)measureAutomatically:(unint64_t)a3 block:(id)a4
{
  return [(MXMInstrument *)self measureAutomatically:a3 options:0 block:a4];
}

- (id)measureAutomatically:(unint64_t)a3 options:(id)a4 block:(id)a5
{
  unint64_t v99 = a3;
  SEL v84 = a2;
  uint64_t v110 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v90 = a5;
  if (!v90)
  {
    v70 = [MEMORY[0x263F08690] currentHandler];
    [v70 handleFailureInMethod:v84 object:self file:@"MXMInstrument.m" lineNumber:747 description:@"Cannot pass a nil measure block. Cannot measure nothing."];
  }
  if ([(MXMInstrument *)self active])
  {
    v71 = [MEMORY[0x263F08690] currentHandler];
    [v71 handleFailureInMethod:v84 object:self file:@"MXMInstrument.m" lineNumber:749 description:@"Cannot start instrument if it's already measuring."];
  }
  int v8 = (void *)MEMORY[0x263EFFA08];
  BOOL v9 = [v7 allKeys];
  id v10 = [v8 setWithArray:v9];
  v95 = self;
  dispatch_time_t v11 = [(MXMInstrument *)self _validOptionKeys];
  char v12 = [v10 isSubsetOfSet:v11];

  if ((v12 & 1) == 0)
  {
    id v79 = [MEMORY[0x263EFF940] exceptionWithName:@"MXMInstrument" reason:@"Invalid options" userInfo:0];
    objc_exception_throw(v79);
  }
  char v13 = [v7 objectForKeyedSubscript:@"com.apple.metricmeasurement.instrument.options.ThreadId"];

  if (v13)
  {
    v72 = [MEMORY[0x263F08690] currentHandler];
    [v72 handleFailureInMethod:v84, v95, @"MXMInstrument.m", 755, @"Invalid parameter not satisfying: %@", @"!options[MXMInstrumentOptionKickOffThreadIdentifier]" object file lineNumber description];
  }
  id v14 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.IterationCount" userOptions:v7];
  unint64_t v15 = [v14 unsignedIntegerValue];

  if (!v15)
  {
    v73 = [MEMORY[0x263F08690] currentHandler];
    [v73 handleFailureInMethod:v84, v95, @"MXMInstrument.m", 757, @"Invalid parameter not satisfying: %@", @"iterationCount > 0" object file lineNumber description];
  }
  uint64_t v16 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.PerformanceTraceEnabled" userOptions:v7];
  LODWORD(v92) = [v16 BOOLValue];

  id v86 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.PerformanceTraceConfigurations" userOptions:v7];
  uint64_t v17 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.PerfdataEnabled" userOptions:v7];
  int v82 = [v17 BOOLValue];

  uint64_t v83 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.PerfdataTestName" userOptions:v7];
  v18 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.QuiesceCpuIdlePercent" userOptions:v7];
  [v18 doubleValue];
  uint64_t v20 = v19;

  id v21 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.QuiesceCpuIdleTimeLimit" userOptions:v7];
  [v21 doubleValue];
  uint64_t v23 = v22;

  id v24 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.SkipMetricMeasurement" userOptions:v7];
  int v25 = [v24 BOOLValue];

  id v89 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.UncacheBetweenIterations" userOptions:v7];
  id v88 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.TerminateProcessBetweenIterations" userOptions:v7];
  if (v25)
  {
    id v26 = _MXMGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(buf.__sig) = 0;
      _os_log_impl(&dword_21FA7B000, v26, OS_LOG_TYPE_DEBUG, "Skipping metric measurement as SkipMetricMeasurement was set to true.", (uint8_t *)&buf, 2u);
    }
  }
  if (v92 && [v86 count]) {
    uint64_t v27 = [v86 count];
  }
  else {
    uint64_t v27 = v92;
  }
  long long v28 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.ScheduleKickOffOnNewThread" userOptions:v7];
  unsigned int v29 = [v28 BOOLValue];

  long long v30 = [(MXMInstrument *)v95 _valueWithOption:@"com.apple.metricmeasurement.instrument.options.EnableThreadParallelization" userOptions:v7];
  int v31 = [v30 BOOLValue];

  if ((v31 & v29 & 1) == 0 && v29)
  {
    v74 = [MEMORY[0x263F08690] currentHandler];
    [v74 handleFailureInMethod:v84, v95, @"MXMInstrument.m", 789, @"Invalid parameter not satisfying: %@", @"(enableParallelizedSampling && shouldKickOffOnNewThread) || !shouldKickOffOnNewThread" object file lineNumber description];
  }
  if (v31) {
    unint64_t v32 = v15;
  }
  else {
    unint64_t v32 = v29;
  }
  if ((v99 & 3) != 0) {
    unsigned int v33 = v29;
  }
  else {
    unsigned int v33 = 0;
  }
  if (v33 == 1)
  {
    v75 = [MEMORY[0x263F08690] currentHandler];
    [v75 handleFailureInMethod:v84 object:v95 file:@"MXMInstrument.m" lineNumber:793 description:@"Can't manually start or stop and kick off on a new thread."];
  }
  id v94 = [MEMORY[0x263EFF980] array];
  uint64_t v80 = (uint64_t)&v80;
  v81 = (void *)MEMORY[0x223C57710]();
  MEMORY[0x270FA5388](v81);
  unint64_t v34 = (8 * v15 + 15) & 0xFFFFFFFFFFFFFFF0;
  if (8 * v15 >= 0x200) {
    size_t v35 = 512;
  }
  else {
    size_t v35 = 8 * v15;
  }
  v98 = (char *)&v80 - v34;
  bzero((char *)&v80 - v34, v35);
  id v91 = v7;
  if (v29)
  {
    v87 = malloc_type_malloc(8 * v32, 0x2004093837F09uLL);
    bzero(v87, 8 * v32);
  }
  else
  {
    v87 = 0;
  }
  MEMORY[0x270FA5388](v36);
  v97 = (char *)&v80 - v34;
  memset((char *)&v80 - v34, 255, 8 * v15);
  id v37 = v95;
  [(MXMInstrument *)v95 setActive:1];
  if (v15)
  {
    int v93 = v29;
    unint64_t v38 = 0;
    unint64_t v39 = 0;
    unint64_t v40 = v15 - v27;
    unint64_t v96 = v15;
    do
    {
      long long v41 = (char *)malloc_type_malloc(0xD0uLL, 0x10800409D133E64uLL);
      $7DEDF3842AEFB7F1E6DF5AF62E424A02 v42 = [(MXMInstrument *)v37 instrumentals];
      id v43 = [(MXMInstrument *)v37 _makeInstrumentalsForIteration:v42 shouldCopy:v15 != 1];

      *((void *)v41 + 3) = 0;
      v41[32] = 0;
      *((_DWORD *)v41 + 4) = 0;
      *((void *)v41 + 5) = 0;
      *((void *)v41 + 6) = 0;
      *((void *)v41 + 9) = 0;
      *((void *)v41 + 1objc_storeWeak(&_activeInstrument, 0) = 0;
      *(_OWORD *)(v41 + 168) = 0u;
      *((void *)v41 + 18) = 0;
      *((void *)v41 + 19) = 0;
      *((void *)v41 + 16) = v37;
      *((void *)v41 + 17) = 0;
      v41[160] = 0;
      *(_OWORD *)(v41 + 184) = 0u;
      *((void *)v41 + 25) = 0;
      *(void *)long long v41 = v38;
      *((void *)v41 + 1) = v15;
      *((void *)v41 + 15) = 3;
      id v44 = v43;
      *((void *)v41 + 17) = v44;
      v45 = _Block_copy(v90);
      *((void *)v41 + 15) = v99;
      id v107 = v94;
      *((void *)v41 + 18) = v45;
      *((void *)v41 + 19) = &v107;
      if (v38 >= v40) {
        int v46 = (int)v92;
      }
      else {
        int v46 = 0;
      }
      if (v46 == 1)
      {
        v41[160] = 1;
        unint64_t v47 = [v86 count];
        int v48 = v93;
        if (v47 > v39) {
          *((void *)v41 + 21) = [v86 objectAtIndex:v39];
        }
        ++v39;
      }
      else
      {
        int v48 = v93;
      }
      *((void *)v41 + 22) = v20;
      *((void *)v41 + 23) = v23;
      id v49 = v88;
      *((void *)v41 + 24) = v89;
      *((void *)v41 + 25) = v49;
      id v37 = v95;
      [(MXMInstrument *)v95 _prepareIteration:v41 options:v91 instrumentals:v44 errors:0];
      if (v48)
      {
        memset(&buf, 0, sizeof(buf));
        pthread_attr_init(&buf);
        pthread_attr_setschedpolicy(&buf, 4);
        pthread_attr_set_qos_class_np(&buf, QOS_CLASS_USER_INTERACTIVE, 0);
        uint64_t v106 = 0;
        [(MXMInstrument *)v37 _setupAndRunWithIteration:v41 spawnThread:1 attrs:&buf pthread:&v106 returnCode:0];
        *((void *)v87 + v38) = v106;
        pthread_attr_destroy(&buf);
      }
      else
      {
        [(MXMInstrument *)v37 setCurrentIteration:v41];
        [(MXMInstrument *)v37 _setupAndRunWithIteration:v41 spawnThread:0 attrs:0 pthread:0 returnCode:&v97[8 * v38]];
        [(MXMInstrument *)v37 setCurrentIteration:0];
      }
      *(void *)&v98[8 * v38] = v41;
      if (*((double *)v41 + 22) == 0.0 || *((double *)v41 + 23) == 0.0)
      {

        ++v38;
        unint64_t v15 = v96;
      }
      else
      {
        v50 = +[MXMInstrument activeInstrument];
        int v51 = v50[8];

        unint64_t v15 = v96;
        if (!v51) {
          break;
        }
        ++v38;
      }
    }
    while (v38 < v15);
    uint64_t v52 = 0;
    unint64_t v53 = 0x264524000uLL;
    unsigned int v29 = v93;
    do
    {
      id v54 = objc_alloc_init(*(Class *)(v53 + 3728));
      v55 = *(void **)&v98[8 * v52];
      [(MXMInstrument *)v37 setCurrentIteration:v55];
      if (v29) {
        pthread_join(*((pthread_t *)v87 + v52), (void **)&v97[8 * v52]);
      }
      if (*(void *)&v97[8 * v52])
      {
        [(MXMInstrument *)v37 setActive:0];
        v76 = (void *)MEMORY[0x263EFF940];
        v77 = objc_msgSend(NSString, "stringWithFormat:", @"Non-zero exit code from iteration [%i] code=%i", *(void *)v55, *(void *)&v97[8 * v52]);
        id v78 = [v76 exceptionWithName:@"Failed to run Block" reason:v77 userInfo:0];

        objc_exception_throw(v78);
      }
      if ((v99 & 2) != 0)
      {
        long long v104 = 0u;
        long long v105 = 0u;
        long long v102 = 0u;
        long long v103 = 0u;
        id v56 = *((id *)v55 + 17);
        uint64_t v57 = [v56 countByEnumeratingWithState:&v102 objects:v108 count:16];
        if (v57)
        {
          uint64_t v58 = v57;
          uint64_t v59 = *(void *)v103;
          do
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v103 != v59) {
                objc_enumerationMutation(v56);
              }
              v61 = *(void **)(*((void *)&v102 + 1) + 8 * i);
              id v100 = 0;
              id v101 = 0;
              [v61 harvestData:&v101 error:&v100];
              id v62 = v101;
              id v63 = v100;
              v64 = v63;
              if (v62) {
                BOOL v65 = v63 == 0;
              }
              else {
                BOOL v65 = 0;
              }
              if (!v65)
              {
                id v92 = [MEMORY[0x263F08690] currentHandler];
                id v85 = [v64 description];
                [v92 handleFailureInMethod:v84 object:v95 file:@"MXMInstrument.m" lineNumber:902 description:v85];
              }
              [v54 appendData:v62];
            }
            uint64_t v58 = [v56 countByEnumeratingWithState:&v102 objects:v108 count:16];
          }
          while (v58);
        }

        [v94 setObject:v54 atIndexedSubscript:v52];
        id v37 = v95;
        unsigned int v29 = v93;
        unint64_t v53 = 0x264524000;
      }
      _Block_release(*((const void **)v55 + 18));

      free(v55);
      [(MXMInstrument *)v37 setCurrentIteration:0];

      ++v52;
    }
    while (v52 != v96);
  }
  [(MXMInstrument *)v37 setCurrentIteration:0];
  if (v29) {
    free(v87);
  }
  v66 = v91;
  v67 = (void *)v83;
  if (v82) {
    [(MXMInstrument *)v37 _makePerfDataFromMXMResults:v94 testName:v83];
  }
  if ([(MXMInstrument *)v37 active]) {
    [(MXMInstrument *)v37 setActive:0];
  }

  id v68 = v94;
  return v68;
}

- (void)_makePerfDataFromMXMResults:(id)a3 testName:(id)a4
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  size_t __sizep = 0;
  __bufp = 0;
  int v8 = open_memstream(&__bufp, &__sizep);
  if (v8)
  {
    BOOL v9 = v8;
    [v7 UTF8String];
    if (pdwriter_open_stream())
    {
      unint64_t v32 = self;
      id v33 = v7;
      if ([v6 count])
      {
        uint64_t v10 = 0;
        unint64_t v34 = v6;
        do
        {
          uint64_t v35 = v10;
          dispatch_time_t v11 = [v6 objectAtIndexedSubscript:v10];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          id obj = v11;
          uint64_t v12 = [v11 countByEnumeratingWithState:&v38 objects:v45 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v37 = *(void *)v39;
            do
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v39 != v37) {
                  objc_enumerationMutation(obj);
                }
                unint64_t v15 = *(void **)(*((void *)&v38 + 1) + 8 * i);
                uint64_t v16 = [v15 attributeWithName:@"XCT Reporting Display Name"];
                uint64_t v17 = [v16 stringValue];

                v18 = [v15 samples];
                uint64_t v19 = [v18 firstObject];
                uint64_t v20 = [v19 asMeasurementValue];

                id v21 = [v20 unit];
                uint64_t v22 = [v20 measurementByConvertingToUnit:v21];
                id v23 = v17;
                [v23 UTF8String];
                id v24 = [v20 unit];
                id v25 = [v24 symbol];
                [v25 UTF8String];
                [v22 doubleValue];
                pdwriter_new_value();
              }
              uint64_t v13 = [obj countByEnumeratingWithState:&v38 objects:v45 count:16];
            }
            while (v13);
          }

          id v6 = v34;
          uint64_t v10 = v35 + 1;
        }
        while (v35 + 1 < (unint64_t)[v34 count]);
      }
      pdwriter_close();
      uint64_t v26 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:__bufp length:__sizep freeWhenDone:1];
      perfMetricsPerfdata = v32->_perfMetricsPerfdata;
      v32->_perfMetricsPerfdata = (NSData *)v26;

      id v7 = v33;
    }
    else
    {
      long long v30 = _MXMGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)pthread_attr_t buf = 0;
        _os_log_impl(&dword_21FA7B000, v30, OS_LOG_TYPE_ERROR, "unable to open stream to write perfdata", buf, 2u);
      }

      int v31 = self->_perfMetricsPerfdata;
      self->_perfMetricsPerfdata = 0;

      fclose(v9);
      free(__bufp);
    }
  }
  else
  {
    long long v28 = _MXMGetLog();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)pthread_attr_t buf = 0;
      _os_log_impl(&dword_21FA7B000, v28, OS_LOG_TYPE_ERROR, "unable to open stream to write perfdata", buf, 2u);
    }

    unsigned int v29 = self->_perfMetricsPerfdata;
    self->_perfMetricsPerfdata = 0;
  }
}

- (id)_makeInstrumentalsForIteration:(id)a3 shouldCopy:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v16 + 1) + 8 * i);
        uint64_t v13 = v12;
        if (v4)
        {
          uint64_t v14 = objc_msgSend(v12, "copy", (void)v16);

          uint64_t v13 = (void *)v14;
        }
        objc_msgSend(v6, "addObject:", v13, (void)v16);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_valueWithOption:(id)a3 userOptions:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  if (v8) {
    [v6 objectForKeyedSubscript:v7];
  }
  else {
  uint64_t v9 = [(MXMInstrument *)self _defaultValueWithOption:v7];
  }

  return v9;
}

- (id)_defaultValueWithOption:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.metricmeasurement.instrument.options.QuiesceCpuIdlePercent"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"com.apple.metricmeasurement.instrument.options.QuiesceCpuIdleTimeLimit"))
  {
    BOOL v4 = (__CFString *)&unk_26D14D588;
  }
  else if ([v3 isEqualToString:@"com.apple.metricmeasurement.instrument.options.PerformanceTraceConfigurations"])
  {
    BOOL v4 = (__CFString *)MEMORY[0x263EFFA68];
  }
  else
  {
    if ([v3 isEqualToString:@"com.apple.metricmeasurement.instrument.options.PerformanceTraceEnabled"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"com.apple.metricmeasurement.instrument.options.PerfdataEnabled"))
    {
      goto LABEL_9;
    }
    if ([v3 isEqualToString:@"com.apple.metricmeasurement.instrument.options.PerfdataTestName"])
    {
      BOOL v4 = @"unknownTest";
      goto LABEL_4;
    }
    if ([v3 isEqualToString:@"com.apple.metricmeasurement.instrument.options.IterationCount"])
    {
      BOOL v4 = (__CFString *)&unk_26D14D5A0;
      goto LABEL_4;
    }
    if ([v3 isEqualToString:@"com.apple.metricmeasurement.instrument.options.ScheduleKickOffOnNewThread"] & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"com.apple.metricmeasurement.instrument.options.EnableThreadParallelization") & 1) != 0|| (objc_msgSend(v3, "isEqualToString:", @"com.apple.metricmeasurement.instrument.options.SkipMetricMeasurement"))
    {
LABEL_9:
      BOOL v4 = (__CFString *)MEMORY[0x263EFFA80];
    }
    else
    {
      char v6 = [v3 isEqualToString:@"com.apple.metricmeasurement.instrument.options.UncacheBetweenIterations"];
      BOOL v4 = (__CFString *)MEMORY[0x263EFFA68];
      if ((v6 & 1) == 0
        && ![v3 isEqualToString:@"com.apple.metricmeasurement.instrument.options.TerminateProcessBetweenIterations"])
      {
        BOOL v4 = 0;
      }
    }
  }
LABEL_4:

  return v4;
}

- (id)_validOptionKeys
{
  v2 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithObjects:", @"com.apple.metricmeasurement.instrument.options.IterationCount", @"com.apple.metricmeasurement.instrument.options.ThreadId", @"com.apple.metricmeasurement.instrument.options.EnableThreadParallelization", @"com.apple.metricmeasurement.instrument.options.ScheduleKickOffOnNewThread", @"com.apple.metricmeasurement.instrument.options.PerformanceTraceEnabled", @"com.apple.metricmeasurement.instrument.options.PerformanceTraceConfigurations", @"com.apple.metricmeasurement.instrument.options.PerfdataEnabled", @"com.apple.metricmeasurement.instrument.options.PerfdataTestName", @"com.apple.metricmeasurement.instrument.options.QuiesceCpuIdlePercent", @"com.apple.metricmeasurement.instrument.options.QuiesceCpuIdleTimeLimit", @"com.apple.metricmeasurement.instrument.options.SkipMetricMeasurement", @"com.apple.metricmeasurement.instrument.options.UncacheBetweenIterations", @"com.apple.metricmeasurement.instrument.options.TerminateProcessBetweenIterations", 0);
  id v3 = (void *)[v2 copy];

  return v3;
}

- (void)dealloc
{
  if ([(MXMInstrument *)self currentIteration]) {
    free([(MXMInstrument *)self currentIteration]);
  }
  v3.receiver = self;
  v3.super_class = (Class)MXMInstrument;
  [(MXMInstrument *)&v3 dealloc];
}

- (NSArray)instrumentals
{
  return self->_instrumentals;
}

- (NSURL)performanceTraceFileURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (NSData)perfMetricsPerfdata
{
  return (NSData *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)performanceTraceFileSandboxExtensionToken
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- ($6284FEDF7B3A0B615FD11F40896223C5)currentIteration
{
  return self->_currentIteration;
}

- (void)setCurrentIteration:(id *)a3
{
  self->_currentIteration = a3;
}

- (OS_dispatch_queue)instrumentalsQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (BOOL)didQuiesce
{
  return self->_didQuiesce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instrumentalsQueue, 0);
  objc_storeStrong((id *)&self->_performanceTraceFileSandboxExtensionToken, 0);
  objc_storeStrong((id *)&self->_perfMetricsPerfdata, 0);
  objc_storeStrong((id *)&self->_performanceTraceFileURL, 0);
  objc_storeStrong((id *)&self->_instrumentals, 0);
}

@end