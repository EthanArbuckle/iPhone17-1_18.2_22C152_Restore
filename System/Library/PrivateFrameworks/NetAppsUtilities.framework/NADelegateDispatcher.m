@interface NADelegateDispatcher
+ (id)_findMethodSignatureForSelector:(SEL)a3 inProtocol:(id)a4;
+ (id)dispatcherWithProtocol:(id)a3 logSettings:(id)a4;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)respondsToSelector:(SEL)a3;
- (NADelegateDispatcher)initWithProtocol:(id)a3 logSettings:(id)a4;
- (NADelegateMethodLogSettings)logSettings;
- (NSArray)observers;
- (NSArray)overrideObservers;
- (NSHashTable)observerTable;
- (NSMapTable)cachedMethodMetadataBySelector;
- (Protocol)protocol;
- (id)_descriptionForArgument:(id)a3 index:(unint64_t)a4 format:(BOOL)a5 metadata:(id)a6;
- (id)_effectiveObservers;
- (id)_lock_methodMetadataForSelector:(SEL)a3;
- (id)_methodMetadataForSelector:(SEL)a3;
- (id)_trampolineBlockForSelector:(SEL)a3 withMethodSignature:(id)a4;
- (id)methodSignatureForSelector:(SEL)a3;
- (os_unfair_lock_s)lock;
- (void)_logEventForInvocation:(id)a3 metadata:(id)a4;
- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4;
- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6;
- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7;
- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8;
- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8 arg3:(id)a9;
- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8 arg3:(id)a9 arg4:(id)a10;
- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8 arg3:(id)a9 arg4:(id)a10 arg5:(id)a11;
- (void)addObserver:(id)a3;
- (void)dispatchMessageExcludingSender:(id)a3 usingBlock:(id)a4;
- (void)forwardInvocation:(id)a3;
- (void)registerCustomHandlerForSelector:(SEL)a3 handler:(id)a4;
- (void)registerCustomLogSettings:(id)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5;
- (void)removeObserver:(id)a3;
- (void)setLogSettings:(id)a3;
- (void)setOverrideObservers:(id)a3;
@end

@implementation NADelegateDispatcher

- (void)addObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observerTable addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)dispatchMessageExcludingSender:(id)a3 usingBlock:(id)a4
{
  p_lock = &self->_lock;
  v7 = (void (**)(id, NADelegateDispatcher *))a4;
  id v8 = a3;
  os_unfair_lock_lock(p_lock);
  v9 = self->_overrideObservers;
  v10 = [(NSHashTable *)self->_observerTable allObjects];
  v11 = (NSArray *)[v10 mutableCopy];

  [(NSArray *)v11 removeObject:v8];
  overrideObservers = self->_overrideObservers;
  self->_overrideObservers = v11;

  os_unfair_lock_unlock(p_lock);
  v7[2](v7, self);

  os_unfair_lock_lock(p_lock);
  v13 = self->_overrideObservers;
  self->_overrideObservers = v9;
  v14 = v9;

  os_unfair_lock_unlock(p_lock);
}

- (void)removeObserver:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_observerTable removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)observers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = [(NSHashTable *)self->_observerTable allObjects];
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_7(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = [v9 _methodMetadataForSelector:*(void *)(a1 + 32)];
  [v9 _logEventForSelector:*(void *)(a1 + 32) metadata:v13 formatArgs:1 arg0:v10 arg1:v11 arg2:v12];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_8;
  v25 = &unk_1E610A008;
  uint64_t v14 = *(void *)(a1 + 32);
  id v26 = v9;
  uint64_t v30 = v14;
  id v15 = v10;
  id v27 = v15;
  id v16 = v11;
  id v28 = v16;
  id v17 = v12;
  id v29 = v17;
  v18 = (void (**)(void))MEMORY[0x1BA99CF00](&v22);
  v19 = [v13 customHandler];

  if (v19)
  {
    v20 = [v13 customHandler];
    v21 = objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithTerminator:nullableObjects:", v16, v17, @"__var_arg_terminator__", v22, v23, v24, v25, v26, v27, v28);
    ((void (**)(void, void *, void (**)(void)))v20)[2](v20, v21, v18);
  }
  else
  {
    v18[2](v18);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_8(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, *(SEL *)(a1 + 64), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  long long v10 = [v7 _methodMetadataForSelector:*(void *)(a1 + 32)];
  [v7 _logEventForSelector:*(void *)(a1 + 32) metadata:v10 formatArgs:1 arg0:v8 arg1:v9];
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  v20 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_6;
  v21 = &unk_1E6109FC0;
  uint64_t v11 = *(void *)(a1 + 32);
  id v22 = v7;
  uint64_t v25 = v11;
  id v12 = v8;
  id v23 = v12;
  id v13 = v9;
  id v24 = v13;
  uint64_t v14 = (void (**)(void))MEMORY[0x1BA99CF00](&v18);
  id v15 = [v10 customHandler];

  if (v15)
  {
    id v16 = [v10 customHandler];
    id v17 = objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithTerminator:nullableObjects:", v13, @"__var_arg_terminator__", v18, v19, v20, v21, v22, v23);
    ((void (**)(void, void *, void (**)(void)))v16)[2](v16, v17, v14);
  }
  else
  {
    v14[2](v14);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_6(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, *(SEL *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 48));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)registerCustomLogSettings:(id)a3 forSelector:(SEL)a4 argumentIndex:(unint64_t)a5
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_lock(p_lock);
  long long v10 = [(NADelegateDispatcher *)self _lock_methodMetadataForSelector:a4];
  long long v11 = [v10 customLogSettingsByArgumentIndex];
  id v12 = v11;
  if (!v11) {
    long long v11 = (void *)MEMORY[0x1E4F1CC08];
  }
  uint64_t v13 = (void *)[v11 mutableCopy];

  uint64_t v14 = [NSNumber numberWithUnsignedInteger:a5];
  [v13 setObject:v9 forKeyedSubscript:v14];

  [v10 setCustomLogSettingsByArgumentIndex:v13];
  os_unfair_lock_unlock(p_lock);
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8
{
  BOOL v11 = a5;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (self->_logSettings)
  {
    uint64_t v18 = NSStringFromSelector(a3);
    uint64_t v19 = [v18 componentsSeparatedByString:@":"];

    logSettings = self->_logSettings;
    if (logSettings)
    {
      v21 = [(NADelegateMethodLogSettings *)logSettings logger];

      id v22 = self->_logSettings;
      if (v21)
      {
        v41 = [(NADelegateMethodLogSettings *)v22 logger];
        v39 = [(NADelegateMethodLogSettings *)self->_logSettings log];
        unsigned int v37 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        v35 = [v19 objectAtIndexedSubscript:0];
        v33 = [(NADelegateDispatcher *)self _descriptionForArgument:v15 index:0 format:v11 metadata:v14];
        id v29 = [v19 objectAtIndexedSubscript:1];
        [(NADelegateDispatcher *)self _descriptionForArgument:v16 index:1 format:v11 metadata:v14];
        uint64_t v30 = v42 = v19;
        v31 = [v42 objectAtIndexedSubscript:2];
        v32 = [(NADelegateDispatcher *)self _descriptionForArgument:v17 index:2 format:v11 metadata:v14];
        ((void (**)(void, void *, void, const char *, ...))v41)[2](v41, v39, v37, "%{public}@: %@ %{public}@: %@ %{public}@: %@", v35, v33, v29, v30, v31, v32);

        uint64_t v19 = v42;
      }
      else
      {
        id v23 = [(NADelegateMethodLogSettings *)v22 log];
        os_log_type_t v24 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        if (os_log_type_enabled(v23, v24))
        {
          v36 = [v19 objectAtIndexedSubscript:0];
          v34 = [(NADelegateDispatcher *)self _descriptionForArgument:v15 index:0 format:v11 metadata:v14];
          uint64_t v25 = [v19 objectAtIndexedSubscript:1];
          [(NADelegateDispatcher *)self _descriptionForArgument:v16 index:1 format:v11 metadata:v14];
          id v26 = v38 = v16;
          [v19 objectAtIndexedSubscript:2];
          id v27 = v40 = v15;
          id v28 = [(NADelegateDispatcher *)self _descriptionForArgument:v17 index:2 format:v11 metadata:v14];
          *(_DWORD *)buf = 138544642;
          v44 = v36;
          __int16 v45 = 2112;
          v46 = v34;
          __int16 v47 = 2114;
          v48 = v25;
          __int16 v49 = 2112;
          v50 = v26;
          __int16 v51 = 2114;
          v52 = v27;
          __int16 v53 = 2112;
          v54 = v28;
          _os_log_impl(&dword_1B561D000, v23, v24, "%{public}@: %@ %{public}@: %@ %{public}@: %@", buf, 0x3Eu);

          id v15 = v40;
          id v16 = v38;
        }
      }
    }
  }
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7
{
  BOOL v9 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  id v14 = a7;
  if (self->_logSettings)
  {
    id v15 = NSStringFromSelector(a3);
    id v16 = [v15 componentsSeparatedByString:@":"];

    logSettings = self->_logSettings;
    if (logSettings)
    {
      uint64_t v18 = [(NADelegateMethodLogSettings *)logSettings logger];

      uint64_t v19 = self->_logSettings;
      if (v18)
      {
        uint64_t v20 = [(NADelegateMethodLogSettings *)v19 logger];
        v32 = [(NADelegateMethodLogSettings *)self->_logSettings log];
        unsigned int v30 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        id v26 = [v16 objectAtIndexedSubscript:0];
        id v27 = [(NADelegateDispatcher *)self _descriptionForArgument:v13 index:0 format:v9 metadata:v12];
        id v28 = [v16 objectAtIndexedSubscript:1];
        id v29 = [(NADelegateDispatcher *)self _descriptionForArgument:v14 index:1 format:v9 metadata:v12];
        (*(void (**)(uint64_t, void *, void, const char *, ...))(v20 + 16))(v20, v32, v30, "%{public}@: %@ %{public}@: %@", v26, v27, v28, v29);
      }
      else
      {
        uint64_t v20 = [(NADelegateMethodLogSettings *)v19 log];
        os_log_type_t v21 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        if (os_log_type_enabled((os_log_t)v20, v21))
        {
          id v22 = [v16 objectAtIndexedSubscript:0];
          id v23 = [(NADelegateDispatcher *)self _descriptionForArgument:v13 index:0 format:v9 metadata:v12];
          [v16 objectAtIndexedSubscript:1];
          os_log_type_t v24 = v31 = v16;
          uint64_t v25 = [(NADelegateDispatcher *)self _descriptionForArgument:v14 index:1 format:v9 metadata:v12];
          *(_DWORD *)buf = 138544130;
          v34 = v22;
          __int16 v35 = 2112;
          v36 = v23;
          __int16 v37 = 2114;
          id v38 = v24;
          __int16 v39 = 2112;
          id v40 = v25;
          _os_log_impl(&dword_1B561D000, (os_log_t)v20, v21, "%{public}@: %@ %{public}@: %@", buf, 0x2Au);

          id v16 = v31;
        }
      }
    }
  }
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a6;
  logSettings = self->_logSettings;
  if (logSettings)
  {
    id v12 = [(NADelegateMethodLogSettings *)logSettings logger];

    id v13 = self->_logSettings;
    if (v12)
    {
      uint64_t v14 = [(NADelegateMethodLogSettings *)v13 logger];
      id v17 = [(NADelegateMethodLogSettings *)self->_logSettings log];
      uint64_t v18 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
      uint64_t v19 = NSStringFromSelector(a3);
      (*(void (**)(uint64_t, void *, uint64_t, const char *, ...))(v14 + 16))(v14, v17, v18, "%{public}@ %@", v19, v10);
    }
    else
    {
      uint64_t v14 = [(NADelegateMethodLogSettings *)v13 log];
      os_log_type_t v15 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
      if (os_log_type_enabled((os_log_t)v14, v15))
      {
        id v16 = NSStringFromSelector(a3);
        *(_DWORD *)buf = 138543618;
        os_log_type_t v21 = v16;
        __int16 v22 = 2112;
        id v23 = v10;
        _os_log_impl(&dword_1B561D000, (os_log_t)v14, v15, "%{public}@ %@", buf, 0x16u);
      }
    }
  }
}

- (id)_descriptionForArgument:(id)a3 index:(unint64_t)a4 format:(BOOL)a5 metadata:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  BOOL v11 = v10;
  if (v7)
  {
    id v12 = [a6 customLogSettingsByArgumentIndex];
    id v13 = [NSNumber numberWithUnsignedInteger:a4];
    uint64_t v14 = [v12 objectForKeyedSubscript:v13];
    logSettings = v14;
    if (!v14) {
      logSettings = self->_logSettings;
    }
    id v16 = logSettings;

    id v17 = [(NADelegateMethodLogSettings *)v16 formattedDescriptionForArgument:v11];
  }
  else
  {
    id v17 = v10;
  }

  return v17;
}

uint64_t __56__NADelegateDispatcher__logEventForInvocation_metadata___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _descriptionForArgument:a2 index:a3 format:1 metadata:*(void *)(a1 + 40)];
}

- (void)forwardInvocation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = -[NADelegateDispatcher _methodMetadataForSelector:](self, "_methodMetadataForSelector:", [v4 selector]);
  [(NADelegateDispatcher *)self _logEventForInvocation:v4 metadata:v5];
  uint64_t v27 = MEMORY[0x1E4F143A8];
  uint64_t v28 = 3221225472;
  id v29 = __42__NADelegateDispatcher_forwardInvocation___block_invoke;
  unsigned int v30 = &unk_1E61099B8;
  v31 = self;
  id v6 = v4;
  id v32 = v6;
  BOOL v7 = (void (**)(void))MEMORY[0x1BA99CF00](&v27);
  long long v8 = objc_msgSend(v5, "customHandler", v27, v28, v29, v30, v31);

  if (v8)
  {
    id v9 = [v5 customHandler];
    id v10 = objc_msgSend(v6, "na_argumentsAsObjects");
    ((void (**)(void, void *, void (**)(void)))v9)[2](v9, v10, v7);
  }
  else
  {
    v7[2](v7);
  }
  uint64_t v11 = [v6 selector];
  id v12 = [v6 methodSignature];
  id v13 = [(NADelegateDispatcher *)self _trampolineBlockForSelector:v11 withMethodSignature:v12];

  if (v13)
  {
    uint64_t v14 = [MEMORY[0x1E4F28E78] string];
    os_log_type_t v15 = [v6 methodSignature];
    uint64_t v16 = [v15 numberOfArguments];

    if (v16)
    {
      unint64_t v17 = 0;
      do
      {
        uint64_t v18 = NSString;
        id v19 = [v6 methodSignature];
        uint64_t v20 = objc_msgSend(v18, "stringWithUTF8String:", objc_msgSend(v19, "getArgumentTypeAtIndex:", v17));
        [v14 appendString:v20];

        ++v17;
        os_log_type_t v21 = [v6 methodSignature];
        unint64_t v22 = [v21 numberOfArguments];
      }
      while (v17 < v22);
    }
    id v23 = imp_implementationWithBlock(v13);
    uint64_t v24 = (objc_class *)objc_opt_class();
    uint64_t v25 = (const char *)[v6 selector];
    id v26 = v14;
    class_addMethod(v24, v25, v23, (const char *)[v26 UTF8String]);
  }
}

- (BOOL)respondsToSelector:(SEL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)NADelegateDispatcher;
  if (-[NADelegateDispatcher respondsToSelector:](&v8, sel_respondsToSelector_)) {
    return 1;
  }
  id v6 = [(NADelegateDispatcher *)self methodSignatureForSelector:a3];
  BOOL v5 = v6 != 0;

  return v5;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  uint64_t v3 = [(NADelegateDispatcher *)self _methodMetadataForSelector:a3];
  id v4 = [v3 methodSignature];

  return v4;
}

+ (id)dispatcherWithProtocol:(id)a3 logSettings:(id)a4
{
  BOOL v5 = (Protocol *)a3;
  id v6 = NSString;
  id v7 = a4;
  objc_msgSend(v6, "stringWithFormat:", @"NADelegateDisptacher_%s", protocol_getName(v5));
  id v8 = objc_claimAutoreleasedReturnValue();
  id v9 = (const char *)[v8 UTF8String];

  Class = objc_getClass(v9);
  if (!Class)
  {
    uint64_t v11 = (objc_class *)objc_opt_class();
    Class = objc_allocateClassPair(v11, v9, 0);
    class_addProtocol(Class, v5);
    objc_registerClassPair(Class);
  }
  id v12 = (void *)[[Class alloc] initWithProtocol:v5 logSettings:v7];

  return v12;
}

- (NADelegateDispatcher)initWithProtocol:(id)a3 logSettings:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)NADelegateDispatcher;
  id v9 = [(NADelegateDispatcher *)&v16 init];
  id v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_protocol, a3);
    objc_storeStrong((id *)&v10->_logSettings, a4);
    uint64_t v11 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observerTable = v10->_observerTable;
    v10->_observerTable = (NSHashTable *)v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:258 valueOptions:0];
    cachedMethodMetadataBySelector = v10->_cachedMethodMetadataBySelector;
    v10->_cachedMethodMetadataBySelector = (NSMapTable *)v13;
  }
  return v10;
}

- (void)registerCustomHandlerForSelector:(SEL)a3 handler:(id)a4
{
  p_lock = &self->_lock;
  id v7 = a4;
  os_unfair_lock_lock(p_lock);
  id v8 = [(NADelegateDispatcher *)self _lock_methodMetadataForSelector:a3];
  [v8 setCustomHandler:v7];

  os_unfair_lock_unlock(p_lock);
}

- (id)_methodMetadataForSelector:(SEL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NADelegateDispatcher *)self _lock_methodMetadataForSelector:a3];
  os_unfair_lock_unlock(p_lock);
  return v6;
}

- (id)_lock_methodMetadataForSelector:(SEL)a3
{
  BOOL v5 = NSMapGet(self->_cachedMethodMetadataBySelector, a3);
  if (v5)
  {
    id v6 = v5;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NADelegateDispatcher;
    id v7 = [(NADelegateDispatcher *)&v10 methodSignatureForSelector:a3];
    if (!v7)
    {
      id v7 = [(id)objc_opt_class() _findMethodSignatureForSelector:a3 inProtocol:self->_protocol];
    }
    id v8 = objc_alloc_init(_NADelegateMethodMetadata);
    [(_NADelegateMethodMetadata *)v8 setMethodSignature:v7];
    NSMapInsert(self->_cachedMethodMetadataBySelector, a3, v8);
    id v6 = v8;
  }
  return v6;
}

- (id)_trampolineBlockForSelector:(SEL)a3 withMethodSignature:(id)a4
{
  id v5 = a4;
  if ((unint64_t)[v5 numberOfArguments] < 3)
  {
LABEL_5:
    switch([v5 numberOfArguments])
    {
      case 2:
        id v8 = v19;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        id v9 = &__block_descriptor_40_e30_v16__0__NADelegateDispatcher_8l;
        objc_super v10 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke;
        break;
      case 3:
        id v8 = v18;
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        id v9 = &__block_descriptor_40_e33_v24__0__NADelegateDispatcher_8_16l;
        objc_super v10 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_3;
        break;
      case 4:
        id v8 = v17;
        v17[0] = MEMORY[0x1E4F143A8];
        v17[1] = 3221225472;
        id v9 = &__block_descriptor_40_e36_v32__0__NADelegateDispatcher_8_16_24l;
        objc_super v10 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_5;
        break;
      case 5:
        id v8 = v16;
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        id v9 = &__block_descriptor_40_e39_v40__0__NADelegateDispatcher_8_16_24_32l;
        objc_super v10 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_7;
        break;
      case 6:
        id v8 = v15;
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        id v9 = &__block_descriptor_40_e42_v48__0__NADelegateDispatcher_8_16_24_32_40l;
        objc_super v10 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_9;
        break;
      case 7:
        id v8 = v14;
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        id v9 = &__block_descriptor_40_e45_v56__0__NADelegateDispatcher_8_16_24_32_40_48l;
        objc_super v10 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_11;
        break;
      case 8:
        id v8 = v13;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        id v9 = &__block_descriptor_40_e48_v64__0__NADelegateDispatcher_8_16_24_32_40_48_56l;
        objc_super v10 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_13;
        break;
      default:
        goto LABEL_7;
    }
    v8[2] = v10;
    v8[3] = v9;
    v8[4] = a3;
    uint64_t v11 = (void *)MEMORY[0x1BA99CF00]();
  }
  else
  {
    uint64_t v6 = 2;
    while (1)
    {
      id v7 = v5;
      if (*(unsigned char *)[v7 getArgumentTypeAtIndex:v6] != 64) {
        break;
      }
      if (++v6 >= (unint64_t)[v7 numberOfArguments]) {
        goto LABEL_5;
      }
    }
LABEL_7:
    uint64_t v11 = 0;
  }

  return v11;
}

- (void)_logEventForInvocation:(id)a3 metadata:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (self->_logSettings)
  {
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __56__NADelegateDispatcher__logEventForInvocation_metadata___block_invoke;
    v38[3] = &unk_1E610A128;
    v38[4] = self;
    id v8 = v6;
    id v39 = v8;
    id v9 = a3;
    objc_super v10 = objc_msgSend(v9, "na_argumentDescriptionsWithObjectFormatter:", v38);
    uint64_t v11 = (const char *)[v9 selector];
    id v12 = [v9 methodSignature];

    uint64_t v13 = [v12 numberOfArguments];
    switch(v13)
    {
      case 2:
        [(NADelegateDispatcher *)self _logEventForSelector:v11 metadata:v8];
        break;
      case 3:
        id v23 = [v10 objectAtIndexedSubscript:0];
        [(NADelegateDispatcher *)self _logEventForSelector:v11 metadata:v8 formatArgs:0 arg0:v23];
        goto LABEL_18;
      case 4:
        id v23 = [v10 objectAtIndexedSubscript:0];
        uint64_t v24 = [v10 objectAtIndexedSubscript:1];
        [(NADelegateDispatcher *)self _logEventForSelector:v11 metadata:v8 formatArgs:0 arg0:v23 arg1:v24];
        goto LABEL_17;
      case 5:
        id v23 = [v10 objectAtIndexedSubscript:0];
        uint64_t v24 = [v10 objectAtIndexedSubscript:1];
        uint64_t v25 = [v10 objectAtIndexedSubscript:2];
        [(NADelegateDispatcher *)self _logEventForSelector:v11 metadata:v8 formatArgs:0 arg0:v23 arg1:v24 arg2:v25];
        goto LABEL_16;
      case 6:
        id v23 = [v10 objectAtIndexedSubscript:0];
        uint64_t v24 = [v10 objectAtIndexedSubscript:1];
        uint64_t v25 = [v10 objectAtIndexedSubscript:2];
        id v26 = [v10 objectAtIndexedSubscript:3];
        [(NADelegateDispatcher *)self _logEventForSelector:v11 metadata:v8 formatArgs:0 arg0:v23 arg1:v24 arg2:v25 arg3:v26];
        goto LABEL_15;
      case 7:
        id v23 = [v10 objectAtIndexedSubscript:0];
        uint64_t v24 = [v10 objectAtIndexedSubscript:1];
        uint64_t v25 = [v10 objectAtIndexedSubscript:2];
        id v26 = [v10 objectAtIndexedSubscript:3];
        uint64_t v27 = [v10 objectAtIndexedSubscript:4];
        [(NADelegateDispatcher *)self _logEventForSelector:v11 metadata:v8 formatArgs:0 arg0:v23 arg1:v24 arg2:v25 arg3:v26 arg4:v27];

LABEL_15:
LABEL_16:

LABEL_17:
LABEL_18:

        break;
      case 8:
        v34 = [v10 objectAtIndexedSubscript:0];
        uint64_t v28 = [v10 objectAtIndexedSubscript:1];
        id v29 = [v10 objectAtIndexedSubscript:2];
        unsigned int v30 = [v10 objectAtIndexedSubscript:3];
        v31 = [v10 objectAtIndexedSubscript:4];
        id v32 = [v10 objectAtIndexedSubscript:5];
        [(NADelegateDispatcher *)self _logEventForSelector:v11 metadata:v8 formatArgs:0 arg0:v34 arg1:v28 arg2:v29 arg3:v30 arg4:v31 arg5:v32];

        break;
      default:
        uint64_t v14 = NSStringFromSelector(v11);
        os_log_type_t v15 = [v14 componentsSeparatedByString:@":"];

        objc_super v16 = objc_opt_new();
        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __56__NADelegateDispatcher__logEventForInvocation_metadata___block_invoke_2;
        v35[3] = &unk_1E610A150;
        id v17 = v16;
        id v36 = v17;
        id v37 = v10;
        [v15 enumerateObjectsUsingBlock:v35];
        logSettings = self->_logSettings;
        if (logSettings)
        {
          id v19 = [(NADelegateMethodLogSettings *)logSettings logger];

          uint64_t v20 = self->_logSettings;
          if (v19)
          {
            uint64_t v21 = [(NADelegateMethodLogSettings *)v20 logger];
            v33 = [(NADelegateMethodLogSettings *)self->_logSettings log];
            (*(void (**)(uint64_t, void *, void, const char *, ...))(v21 + 16))(v21, v33, [(NADelegateMethodLogSettings *)self->_logSettings logType], "%@", v17);
          }
          else
          {
            uint64_t v21 = [(NADelegateMethodLogSettings *)v20 log];
            os_log_type_t v22 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
            if (os_log_type_enabled((os_log_t)v21, v22))
            {
              *(_DWORD *)buf = 138412290;
              id v41 = v17;
              _os_log_impl(&dword_1B561D000, (os_log_t)v21, v22, "%@", buf, 0xCu);
            }
          }
        }
        break;
    }
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 _methodMetadataForSelector:*(void *)(a1 + 32)];
  [v5 _logEventForSelector:*(void *)(a1 + 32) metadata:v7 formatArgs:1 arg0:v6];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  objc_super v16 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_4;
  id v17 = &unk_1E6109F78;
  uint64_t v8 = *(void *)(a1 + 32);
  id v18 = v5;
  uint64_t v20 = v8;
  id v9 = v6;
  id v19 = v9;
  objc_super v10 = (void (**)(void))MEMORY[0x1BA99CF00](&v14);
  uint64_t v11 = [v7 customHandler];

  if (v11)
  {
    id v12 = [v7 customHandler];
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithTerminator:nullableObjects:", @"__var_arg_terminator__", v14, v15, v16, v17, v18);
    ((void (**)(void, void *, void (**)(void)))v12)[2](v12, v13, v10);
  }
  else
  {
    v10[2](v10);
  }
}

void __42__NADelegateDispatcher_forwardInvocation___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        [*(id *)(a1 + 40) selector];
        if (objc_opt_respondsToSelector()) {
          [*(id *)(a1 + 40) invokeWithTarget:v7];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, *(SEL *)(a1 + 48), *(void *)(a1 + 40));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (id)_effectiveObservers
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  overrideObservers = self->_overrideObservers;
  if (overrideObservers)
  {
    uint64_t v5 = overrideObservers;
  }
  else
  {
    uint64_t v5 = [(NSHashTable *)self->_observerTable allObjects];
  }
  uint64_t v6 = v5;
  os_unfair_lock_unlock(p_lock);
  return v6;
}

+ (id)_findMethodSignatureForSelector:(SEL)a3 inProtocol:(id)a4
{
  uint64_t v6 = (Protocol *)a4;
  types = protocol_getMethodDescription(v6, a3, 1, 1).types;
  if (types || (types = protocol_getMethodDescription(v6, a3, 0, 1).types) != 0)
  {
    long long v8 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:types];
  }
  else
  {
    unsigned int outCount = 0;
    long long v10 = protocol_copyProtocolList(v6, &outCount);
    if (outCount)
    {
      uint64_t v11 = 0;
      while (1)
      {
        uint64_t v12 = [a1 _findMethodSignatureForSelector:a3 inProtocol:v10[v11]];
        if (v12) {
          break;
        }
        if (++v11 >= (unint64_t)outCount) {
          goto LABEL_11;
        }
      }
      long long v8 = (void *)v12;
    }
    else
    {
LABEL_11:
      long long v8 = 0;
    }
    free(v10);
  }

  return v8;
}

- (BOOL)conformsToProtocol:(id)a3
{
  uint64_t v4 = (Protocol *)a3;
  v9.receiver = self;
  v9.super_class = (Class)NADelegateDispatcher;
  if ([(NADelegateDispatcher *)&v9 conformsToProtocol:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    uint64_t v6 = [(NADelegateDispatcher *)self protocol];
    if (v6 == v4)
    {
      BOOL v5 = 1;
    }
    else
    {
      uint64_t v7 = [(NADelegateDispatcher *)self protocol];
      BOOL v5 = protocol_conformsToProtocol(v7, v4);
    }
  }

  return v5;
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 _methodMetadataForSelector:*(void *)(a1 + 32)];
  [v3 _logEventForSelector:*(void *)(a1 + 32) metadata:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_2;
  v10[3] = &unk_1E6109F30;
  uint64_t v5 = *(void *)(a1 + 32);
  v10[4] = v3;
  v10[5] = v5;
  uint64_t v6 = (void (**)(void))MEMORY[0x1BA99CF00](v10);
  uint64_t v7 = [v4 customHandler];

  if (v7)
  {
    long long v8 = [v4 customHandler];
    objc_super v9 = objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithTerminator:nullableObjects:", @"__var_arg_terminator__", @"__var_arg_terminator__");
    ((void (**)(void, void *, void (**)(void)))v8)[2](v8, v9, v6);
  }
  else
  {
    v6[2](v6);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          [v7 *(SEL *)(a1 + 40)];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_9(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a2;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  objc_super v16 = [v11 _methodMetadataForSelector:*(void *)(a1 + 32)];
  [v11 _logEventForSelector:*(void *)(a1 + 32) metadata:v16 formatArgs:1 arg0:v12 arg1:v13 arg2:v14 arg3:v15];
  uint64_t v26 = MEMORY[0x1E4F143A8];
  uint64_t v27 = 3221225472;
  uint64_t v28 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_10;
  id v29 = &unk_1E610A050;
  uint64_t v17 = *(void *)(a1 + 32);
  id v30 = v11;
  uint64_t v35 = v17;
  id v18 = v12;
  id v31 = v18;
  id v19 = v13;
  id v32 = v19;
  id v20 = v14;
  id v33 = v20;
  id v21 = v15;
  id v34 = v21;
  os_log_type_t v22 = (void (**)(void))MEMORY[0x1BA99CF00](&v26);
  id v23 = [v16 customHandler];

  if (v23)
  {
    uint64_t v24 = [v16 customHandler];
    uint64_t v25 = objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithTerminator:nullableObjects:", v19, v20, v21, @"__var_arg_terminator__", v26, v27, v28, v29, v30, v31, v32, v33);
    ((void (**)(void, void *, void (**)(void)))v24)[2](v24, v25, v22);
  }
  else
  {
    v22[2](v22);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_10(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, *(SEL *)(a1 + 72), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_11(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7)
{
  id v13 = a2;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [v13 _methodMetadataForSelector:*(void *)(a1 + 32)];
  [v13 _logEventForSelector:*(void *)(a1 + 32) metadata:v19 formatArgs:1 arg0:v14 arg1:v15 arg2:v16 arg3:v17 arg4:v18];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  id v32 = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_12;
  id v33 = &unk_1E610A098;
  uint64_t v20 = *(void *)(a1 + 32);
  id v34 = v13;
  uint64_t v40 = v20;
  id v21 = v14;
  id v35 = v21;
  id v22 = v15;
  id v36 = v22;
  id v23 = v16;
  id v37 = v23;
  id v24 = v17;
  id v38 = v24;
  id v25 = v18;
  id v39 = v25;
  uint64_t v26 = (void (**)(void))MEMORY[0x1BA99CF00](&v30);
  uint64_t v27 = [v19 customHandler];

  if (v27)
  {
    uint64_t v28 = [v19 customHandler];
    id v29 = objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithTerminator:nullableObjects:", v22, v23, v24, v25, @"__var_arg_terminator__", v30, v31, v32, v33, v34, v35, v36, v37, v38);
    ((void (**)(void, void *, void (**)(void)))v28)[2](v28, v29, v26);
  }
  else
  {
    v26[2](v26);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_12(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, *(SEL *)(a1 + 80), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_13(uint64_t a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = [v15 _methodMetadataForSelector:*(void *)(a1 + 32)];
  [v15 _logEventForSelector:*(void *)(a1 + 32) metadata:v22 formatArgs:1 arg0:v16 arg1:v17 arg2:v18 arg3:v19 arg4:v20 arg5:v21];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_14;
  v42[3] = &unk_1E610A0E0;
  uint64_t v23 = *(void *)(a1 + 32);
  v42[4] = v15;
  uint64_t v49 = v23;
  id v24 = v16;
  id v43 = v24;
  id v25 = v17;
  id v44 = v25;
  id v26 = v18;
  id v45 = v26;
  id v27 = v19;
  id v46 = v27;
  id v28 = v20;
  id v47 = v28;
  id v29 = v21;
  id v48 = v29;
  uint64_t v30 = (void (**)(void))MEMORY[0x1BA99CF00](v42);
  uint64_t v31 = [v22 customHandler];

  if (v31)
  {
    id v32 = [v22 customHandler];
    objc_msgSend(MEMORY[0x1E4F1C978], "na_arrayWithTerminator:nullableObjects:", v25, v26, v27, v28, v29, @"__var_arg_terminator__");
    id v41 = v29;
    id v33 = v28;
    id v34 = v27;
    id v35 = v22;
    id v36 = v26;
    id v37 = v25;
    id v38 = v24;
    uint64_t v40 = v39 = v15;
    ((void (**)(void, void *, void (**)(void)))v32)[2](v32, v40, v30);

    id v15 = v39;
    id v24 = v38;
    id v25 = v37;
    id v26 = v36;
    id v22 = v35;
    id v27 = v34;
    id v28 = v33;
    id v29 = v41;
  }
  else
  {
    v30[2](v30);
  }
}

void __72__NADelegateDispatcher__trampolineBlockForSelector_withMethodSignature___block_invoke_14(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = objc_msgSend(*(id *)(a1 + 32), "_effectiveObservers", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, *(SEL *)(a1 + 88), *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64), *(void *)(a1 + 72), *(void *)(a1 + 80));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  logSettings = self->_logSettings;
  if (logSettings)
  {
    long long v8 = [(NADelegateMethodLogSettings *)logSettings logger];

    long long v9 = self->_logSettings;
    if (v8)
    {
      uint64_t v10 = [(NADelegateMethodLogSettings *)v9 logger];
      uint64_t v13 = [(NADelegateMethodLogSettings *)self->_logSettings log];
      uint64_t v14 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
      id v15 = NSStringFromSelector(a3);
      (*(void (**)(uint64_t, void *, uint64_t, const char *, ...))(v10 + 16))(v10, v13, v14, "%{public}@", v15);
    }
    else
    {
      uint64_t v10 = [(NADelegateMethodLogSettings *)v9 log];
      os_log_type_t v11 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
      if (os_log_type_enabled((os_log_t)v10, v11))
      {
        id v12 = NSStringFromSelector(a3);
        *(_DWORD *)buf = 138543362;
        id v17 = v12;
        _os_log_impl(&dword_1B561D000, (os_log_t)v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8 arg3:(id)a9
{
  BOOL v12 = a5;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (self->_logSettings)
  {
    id v20 = NSStringFromSelector(a3);
    id v21 = [v20 componentsSeparatedByString:@":"];

    logSettings = self->_logSettings;
    if (logSettings)
    {
      uint64_t v23 = [(NADelegateMethodLogSettings *)logSettings logger];

      id v24 = self->_logSettings;
      if (v23)
      {
        uint64_t v55 = [(NADelegateMethodLogSettings *)v24 logger];
        v57 = [(NADelegateMethodLogSettings *)self->_logSettings log];
        unsigned int v45 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        __int16 v51 = [v21 objectAtIndexedSubscript:0];
        uint64_t v49 = [(NADelegateDispatcher *)self _descriptionForArgument:v16 index:0 format:v12 metadata:v15];
        id v43 = [v21 objectAtIndexedSubscript:1];
        id v34 = [(NADelegateDispatcher *)self _descriptionForArgument:v17 index:1 format:v12 metadata:v15];
        [v21 objectAtIndexedSubscript:2];
        id v53 = v19;
        id v35 = v21;
        id v37 = v36 = v18;
        [(NADelegateDispatcher *)self _descriptionForArgument:v36 index:2 format:v12 metadata:v15];
        id v47 = v17;
        v39 = id v38 = v16;
        uint64_t v40 = [v35 objectAtIndexedSubscript:3];
        id v41 = [(NADelegateDispatcher *)self _descriptionForArgument:v53 index:3 format:v12 metadata:v15];
        ((void (**)(void, void *, void, const char *, ...))v55)[2](v55, v57, v45, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", v51, v49, v43, v34, v37, v39, v40, v41);

        id v16 = v38;
        id v17 = v47;

        id v18 = v36;
        id v21 = v35;
        id v19 = v53;
      }
      else
      {
        id v56 = v16;
        id v25 = [(NADelegateMethodLogSettings *)v24 log];
        os_log_type_t v26 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        if (os_log_type_enabled(v25, v26))
        {
          id v27 = [v21 objectAtIndexedSubscript:0];
          v50 = [(NADelegateDispatcher *)self _descriptionForArgument:v56 index:0 format:v12 metadata:v15];
          id v44 = [v21 objectAtIndexedSubscript:1];
          [(NADelegateDispatcher *)self _descriptionForArgument:v17 index:1 format:v12 metadata:v15];
          uint64_t v42 = v54 = v15;
          [v21 objectAtIndexedSubscript:2];
          id v52 = v19;
          id v48 = v21;
          v29 = id v28 = v18;
          uint64_t v30 = [(NADelegateDispatcher *)self _descriptionForArgument:v28 index:2 format:v12 metadata:v15];
          [v48 objectAtIndexedSubscript:3];
          uint64_t v31 = v46 = v17;
          id v32 = [(NADelegateDispatcher *)self _descriptionForArgument:v52 index:3 format:v12 metadata:v15];
          *(_DWORD *)buf = 138545154;
          v59 = v27;
          __int16 v60 = 2112;
          v61 = v50;
          __int16 v62 = 2114;
          v63 = v44;
          __int16 v64 = 2112;
          v65 = v42;
          __int16 v66 = 2114;
          v67 = v29;
          __int16 v68 = 2112;
          uint64_t v69 = v30;
          id v33 = (void *)v30;
          __int16 v70 = 2114;
          v71 = v31;
          __int16 v72 = 2112;
          v73 = v32;
          _os_log_impl(&dword_1B561D000, v25, v26, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", buf, 0x52u);

          id v17 = v46;
          id v18 = v28;
          id v21 = v48;
          id v19 = v52;

          id v15 = v54;
        }

        id v16 = v56;
      }
    }
  }
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8 arg3:(id)a9 arg4:(id)a10
{
  BOOL v13 = a5;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  if (self->_logSettings)
  {
    id v22 = NSStringFromSelector(a3);
    uint64_t v23 = [v22 componentsSeparatedByString:@":"];

    logSettings = self->_logSettings;
    if (logSettings)
    {
      id v25 = [(NADelegateMethodLogSettings *)logSettings logger];

      os_log_type_t v26 = self->_logSettings;
      id v56 = v20;
      if (v25)
      {
        id v48 = [(NADelegateMethodLogSettings *)v26 logger];
        uint64_t v55 = [(NADelegateMethodLogSettings *)self->_logSettings log];
        unsigned int v45 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        id v43 = [v23 objectAtIndexedSubscript:0];
        uint64_t v49 = [(NADelegateDispatcher *)self _descriptionForArgument:v17 index:0 format:v13 metadata:v16];
        id v41 = [v23 objectAtIndexedSubscript:1];
        id v47 = [(NADelegateDispatcher *)self _descriptionForArgument:v18 index:1 format:v13 metadata:v16];
        [v23 objectAtIndexedSubscript:2];
        uint64_t v30 = v53 = v19;
        [(NADelegateDispatcher *)self _descriptionForArgument:v53 index:2 format:v13 metadata:v16];
        id v39 = v50 = v18;
        [v23 objectAtIndexedSubscript:3];
        v31 = id v51 = v17;
        id v32 = [(NADelegateDispatcher *)self _descriptionForArgument:v20 index:3 format:v13 metadata:v16];
        id v33 = [v23 objectAtIndexedSubscript:4];
        id v34 = [(NADelegateDispatcher *)self _descriptionForArgument:v21 index:4 format:v13 metadata:v16];
        ((void (**)(void, void *, void, const char *, ...))v48)[2](v48, v55, v45, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", v43, v49, v41, v47, v30, v39, v31, v32, v33, v34);

        id v20 = v56;
        id v17 = v51;

        id v18 = v50;
        id v19 = v53;
      }
      else
      {
        id v27 = [(NADelegateMethodLogSettings *)v26 log];
        uint64_t v28 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        if (os_log_type_enabled(v27, (os_log_type_t)v28))
        {
          id v46 = [v23 objectAtIndexedSubscript:0];
          id v54 = [(NADelegateDispatcher *)self _descriptionForArgument:v17 index:0 format:v13 metadata:v16];
          id v44 = [v23 objectAtIndexedSubscript:1];
          uint64_t v42 = [(NADelegateDispatcher *)self _descriptionForArgument:v18 index:1 format:v13 metadata:v16];
          uint64_t v40 = [v23 objectAtIndexedSubscript:2];
          id v38 = [(NADelegateDispatcher *)self _descriptionForArgument:v19 index:2 format:v13 metadata:v16];
          id v37 = [v23 objectAtIndexedSubscript:3];
          id v36 = [(NADelegateDispatcher *)self _descriptionForArgument:v56 index:3 format:v13 metadata:v16];
          [v23 objectAtIndexedSubscript:4];
          id v29 = v52 = v19;
          id v35 = [(NADelegateDispatcher *)self _descriptionForArgument:v21 index:4 format:v13 metadata:v16];
          *(_DWORD *)buf = 138545666;
          v58 = v46;
          __int16 v59 = 2112;
          __int16 v60 = v54;
          __int16 v61 = 2114;
          __int16 v62 = v44;
          __int16 v63 = 2112;
          __int16 v64 = v42;
          __int16 v65 = 2114;
          __int16 v66 = v40;
          __int16 v67 = 2112;
          __int16 v68 = v38;
          __int16 v69 = 2114;
          __int16 v70 = v37;
          __int16 v71 = 2112;
          __int16 v72 = v36;
          __int16 v73 = 2114;
          uint64_t v74 = v29;
          __int16 v75 = 2112;
          v76 = v35;
          _os_log_impl(&dword_1B561D000, v27, (os_log_type_t)v28, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", buf, 0x66u);

          id v19 = v52;
        }

        id v20 = v56;
      }
    }
  }
}

- (void)_logEventForSelector:(SEL)a3 metadata:(id)a4 formatArgs:(BOOL)a5 arg0:(id)a6 arg1:(id)a7 arg2:(id)a8 arg3:(id)a9 arg4:(id)a10 arg5:(id)a11
{
  BOOL v14 = a5;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  if (self->_logSettings)
  {
    id v67 = v21;
    id v24 = NSStringFromSelector(a3);
    id v25 = [v24 componentsSeparatedByString:@":"];

    logSettings = self->_logSettings;
    if (logSettings)
    {
      id v27 = [(NADelegateMethodLogSettings *)logSettings logger];

      uint64_t v28 = self->_logSettings;
      id v66 = v20;
      if (v27)
      {
        id v53 = [(NADelegateMethodLogSettings *)v28 logger];
        os_log_t loga = [(NADelegateMethodLogSettings *)self->_logSettings log];
        *(_DWORD *)type = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        __int16 v65 = [v25 objectAtIndexedSubscript:0];
        __int16 v61 = [(NADelegateDispatcher *)self _descriptionForArgument:v18 index:0 format:v14 metadata:v17];
        uint64_t v55 = [v25 objectAtIndexedSubscript:1];
        id v50 = [(NADelegateDispatcher *)self _descriptionForArgument:v19 index:1 format:v14 metadata:v17];
        id v54 = [v25 objectAtIndexedSubscript:2];
        id v48 = [(NADelegateDispatcher *)self _descriptionForArgument:v20 index:2 format:v14 metadata:v17];
        [v25 objectAtIndexedSubscript:3];
        id v46 = v59 = v18;
        id v36 = [(NADelegateDispatcher *)self _descriptionForArgument:v67 index:3 format:v14 metadata:v17];
        [v25 objectAtIndexedSubscript:4];
        v38 = id v37 = v23;
        [(NADelegateDispatcher *)self _descriptionForArgument:v22 index:4 format:v14 metadata:v17];
        id v39 = v57 = v22;
        uint64_t v40 = [v25 objectAtIndexedSubscript:5];
        id v41 = [(NADelegateDispatcher *)self _descriptionForArgument:v37 index:5 format:v14 metadata:v17];
        ((void (**)(void, os_log_t, void, const char *, ...))v53)[2](v53, loga, *(unsigned int *)type, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", v65, v61, v55, v50, v54, v48, v46, v36, v38, v39, v40, v41);

        id v22 = v57;
        id v23 = v37;

        id v20 = v66;
        id v18 = v59;
      }
      else
      {
        id v29 = [(NADelegateMethodLogSettings *)v28 log];
        os_log_type_t v30 = [(NADelegateMethodLogSettings *)self->_logSettings logType];
        if (os_log_type_enabled(v29, v30))
        {
          id v52 = [v25 objectAtIndexedSubscript:0];
          __int16 v64 = [(NADelegateDispatcher *)self _descriptionForArgument:v18 index:0 format:v14 metadata:v17];
          uint64_t v49 = [v25 objectAtIndexedSubscript:1];
          id v47 = [(NADelegateDispatcher *)self _descriptionForArgument:v19 index:1 format:v14 metadata:v17];
          unsigned int v45 = [v25 objectAtIndexedSubscript:2];
          id v44 = [(NADelegateDispatcher *)self _descriptionForArgument:v66 index:2 format:v14 metadata:v17];
          [v25 objectAtIndexedSubscript:3];
          uint64_t v31 = v58 = v18;
          [(NADelegateDispatcher *)self _descriptionForArgument:v67 index:3 format:v14 metadata:v17];
          id v43 = log = v29;
          [v25 objectAtIndexedSubscript:4];
          uint64_t v42 = v60 = v23;
          uint64_t v32 = [(NADelegateDispatcher *)self _descriptionForArgument:v22 index:4 format:v14 metadata:v17];
          [v25 objectAtIndexedSubscript:5];
          id v33 = v56 = v22;
          id v34 = [(NADelegateDispatcher *)self _descriptionForArgument:v60 index:5 format:v14 metadata:v17];
          *(_DWORD *)buf = 138546178;
          __int16 v69 = v52;
          __int16 v70 = 2112;
          __int16 v71 = v64;
          __int16 v72 = 2114;
          __int16 v73 = v49;
          __int16 v74 = 2112;
          __int16 v75 = v47;
          __int16 v76 = 2114;
          uint64_t v77 = v45;
          __int16 v78 = 2112;
          v79 = v44;
          __int16 v80 = 2114;
          v81 = v31;
          __int16 v82 = 2112;
          v83 = v43;
          __int16 v84 = 2114;
          v85 = v42;
          __int16 v86 = 2112;
          uint64_t v87 = v32;
          id v35 = (void *)v32;
          __int16 v88 = 2114;
          v89 = v33;
          __int16 v90 = 2112;
          v91 = v34;
          _os_log_impl(&dword_1B561D000, log, v30, "%{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@ %{public}@: %@", buf, 0x7Au);

          id v22 = v56;
          id v23 = v60;

          id v18 = v58;
          id v29 = log;
        }
        id v20 = v66;
      }
    }

    id v21 = v67;
  }
}

void __56__NADelegateDispatcher__logEventForInvocation_metadata___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v7 = a2;
  if (a3) {
    [*(id *)(a1 + 32) appendString:@" "];
  }
  [*(id *)(a1 + 32) appendString:v7];
  [*(id *)(a1 + 32) appendString:@": "];
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a3];
  [v5 appendString:v6];
}

- (NADelegateMethodLogSettings)logSettings
{
  return self->_logSettings;
}

- (void)setLogSettings:(id)a3
{
}

- (os_unfair_lock_s)lock
{
  return self->_lock;
}

- (Protocol)protocol
{
  return self->_protocol;
}

- (NSHashTable)observerTable
{
  return self->_observerTable;
}

- (NSMapTable)cachedMethodMetadataBySelector
{
  return self->_cachedMethodMetadataBySelector;
}

- (NSArray)overrideObservers
{
  return self->_overrideObservers;
}

- (void)setOverrideObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideObservers, 0);
  objc_storeStrong((id *)&self->_cachedMethodMetadataBySelector, 0);
  objc_storeStrong((id *)&self->_observerTable, 0);
  objc_storeStrong((id *)&self->_protocol, 0);
  objc_storeStrong((id *)&self->_logSettings, 0);
}

@end