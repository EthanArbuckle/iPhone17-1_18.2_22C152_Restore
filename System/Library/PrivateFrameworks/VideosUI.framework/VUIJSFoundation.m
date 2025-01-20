@interface VUIJSFoundation
- (NSMutableDictionary)dateFormatterCache;
- (NSMutableDictionary)jsTimers;
- (VUIAppContext)appContext;
- (VUIJSFoundation)initWithAppContext:(id)a3;
- (id)_startTimer:(id)a3 time:(int64_t)a4 repeating:(BOOL)a5;
- (id)setInterval:(id)a3 time:(int64_t)a4;
- (id)setTimeout:(id)a3 time:(int64_t)a4;
- (void)_clearTimer:(id)a3;
- (void)_jsTimerFired:(id)a3;
- (void)setAppContext:(id)a3;
- (void)setDateFormatterCache:(id)a3;
- (void)setJsTimers:(id)a3;
- (void)stopTimers;
@end

@implementation VUIJSFoundation

- (VUIJSFoundation)initWithAppContext:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VUIJSFoundation;
  v5 = [(VUIJSFoundation *)&v12 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_appContext, v4);
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    jsTimers = v6->_jsTimers;
    v6->_jsTimers = v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dateFormatterCache = v6->_dateFormatterCache;
    v6->_dateFormatterCache = v9;
  }
  return v6;
}

- (id)setInterval:(id)a3 time:(int64_t)a4
{
  return [(VUIJSFoundation *)self _startTimer:a3 time:a4 repeating:1];
}

- (id)setTimeout:(id)a3 time:(int64_t)a4
{
  return [(VUIJSFoundation *)self _startTimer:a3 time:a4 repeating:0];
}

- (void)stopTimers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(VUIJSFoundation *)self jsTimers];
  id v4 = [v3 allValues];

  if ([v4 count])
  {
    v5 = [v4 valueForKey:@"timer"];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v16;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v16 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v15 + 1) + 8 * v10++) removeManagedReferences];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v8);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __29__VUIJSFoundation_stopTimers__block_invoke;
    block[3] = &unk_1E6DF3D58;
    id v14 = v5;
    id v11 = v5;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  objc_super v12 = [(VUIJSFoundation *)self jsTimers];
  [v12 removeAllObjects];
}

void __29__VUIJSFoundation_stopTimers__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "invalidate", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (id)_startTimer:(id)a3 time:(int64_t)a4 repeating:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  long long v9 = [(VUIJSFoundation *)self appContext];
  if ([v8 isObject])
  {
    if (a4 >= 1) {
      int64_t v10 = a4;
    }
    else {
      int64_t v10 = 0;
    }
    if (a4 > 0 || !v5)
    {
      v13 = [MEMORY[0x1E4F30920] currentArguments];
      if ((unint64_t)[v13 count] < 3)
      {
        id v14 = 0;
      }
      else
      {
        id v14 = objc_msgSend(v13, "subarrayWithRange:", 2, objc_msgSend(v13, "count") - 2);
      }
      long long v15 = [MEMORY[0x1E4F1CB00] timerWithTimeInterval:self target:sel__jsTimerFired_ selector:0 userInfo:v5 repeats:(float)((float)v10 / 1000.0)];
      long long v16 = [VUIJSTimerContext alloc];
      long long v17 = [v9 jsContext];
      long long v18 = [v17 objectForKeyedSubscript:@"App"];
      v19 = [(VUIJSTimerContext *)v16 initWithCallback:v8 callbackArgs:v14 repeating:v5 ownerObject:v18 timer:v15];

      objc_super v12 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v15);
      uint64_t v20 = [(VUIJSFoundation *)self jsTimers];
      [v20 setObject:v19 forKey:v12];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __46__VUIJSFoundation__startTimer_time_repeating___block_invoke;
      block[3] = &unk_1E6DF3D58;
      id v24 = v15;
      id v21 = v15;
      dispatch_async(MEMORY[0x1E4F14428], block);

      goto LABEL_14;
    }
    uint64_t v11 = @"starting timer with invalid timeout";
  }
  else
  {
    uint64_t v11 = @"starting timer with empty handler";
  }
  [v9 setException:0 withErrorMessage:v11];
  objc_super v12 = 0;
LABEL_14:

  return v12;
}

void __46__VUIJSFoundation__startTimer_time_repeating___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CAC0] currentRunLoop];
  [v2 addTimer:*(void *)(a1 + 32) forMode:*MEMORY[0x1E4F1C4B0]];
}

- (void)_clearTimer:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 length])
  {
    BOOL v5 = [(VUIJSFoundation *)self jsTimers];
    long long v6 = [v5 objectForKey:v4];

    if (v6)
    {
      long long v7 = [v6 timer];
      [v6 removeManagedReferences];
      id v8 = [(VUIJSFoundation *)self jsTimers];
      [v8 removeObjectForKey:v4];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __31__VUIJSFoundation__clearTimer___block_invoke;
      block[3] = &unk_1E6DF3D58;
      id v11 = v7;
      id v9 = v7;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    long long v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VUIJSFoundation _clearTimer:]((uint64_t)v4, v6);
    }
  }
}

uint64_t __31__VUIJSFoundation__clearTimer___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

- (void)_jsTimerFired:(id)a3
{
  id v4 = a3;
  BOOL v5 = objc_msgSend(NSString, "stringWithFormat:", @"%p", v4);
  objc_initWeak(&location, self);
  long long v6 = [(VUIJSFoundation *)self appContext];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __33__VUIJSFoundation__jsTimerFired___block_invoke;
  v8[3] = &unk_1E6DF6D10;
  objc_copyWeak(&v10, &location);
  id v7 = v5;
  id v9 = v7;
  [v6 evaluate:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __33__VUIJSFoundation__jsTimerFired___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v5 = [WeakRetained jsTimers];
    long long v6 = [v5 objectForKey:*(void *)(a1 + 32)];

    if (v6)
    {
      id v7 = [v6 managedCallback];
      id v8 = [v7 value];

      id v9 = [v6 managedArgs];
      id v10 = [v9 jsValuesWithContext:v13];
      id v11 = (id)[v8 callWithArguments:v10];

      if (([v6 isRepeating] & 1) == 0)
      {
        [v6 removeManagedReferences];
        objc_super v12 = [v4 jsTimers];
        [v12 removeObjectForKey:*(void *)(a1 + 32)];
      }
    }
  }
}

- (VUIAppContext)appContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appContext);
  return (VUIAppContext *)WeakRetained;
}

- (void)setAppContext:(id)a3
{
}

- (NSMutableDictionary)jsTimers
{
  return self->_jsTimers;
}

- (void)setJsTimers:(id)a3
{
}

- (NSMutableDictionary)dateFormatterCache
{
  return self->_dateFormatterCache;
}

- (void)setDateFormatterCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateFormatterCache, 0);
  objc_storeStrong((id *)&self->_jsTimers, 0);
  objc_destroyWeak((id *)&self->_appContext);
}

- (void)_clearTimer:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E2BD7000, a2, OS_LOG_TYPE_ERROR, "Unknown timer: %@", (uint8_t *)&v2, 0xCu);
}

@end