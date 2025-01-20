@interface NURenderTransaction
+ (id)assertCurrentTransaction;
+ (id)currentTransaction;
+ (id)ensureCurrentTransaction;
+ (void)_commit:(id)a3;
+ (void)begin;
+ (void)commit;
+ (void)commitAndNotifyOnQueue:(id)a3 withBlock:(id)a4;
+ (void)group:(id)a3;
+ (void)setCurrentTransaction:(id)a3;
+ (void)withCurrentTransaction:(id)a3;
- (BOOL)begin;
- (BOOL)commit;
- (NSArray)pendingRequests;
- (NURenderTransaction)init;
- (void)flush;
- (void)notifyCompletion:(id)a3 block:(id)a4;
- (void)resetPendingRequests;
- (void)submitPendingRequests;
- (void)submitRequest:(id)a3;
@end

@implementation NURenderTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);

  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)resetPendingRequests
{
}

- (void)submitPendingRequests
{
  id v4 = [(NURenderTransaction *)self pendingRequests];
  if ([v4 count])
  {
    v3 = +[NUScheduler sharedScheduler];
    [v3 submitRequests:v4 withGroup:self->_group];
  }
}

- (void)flush
{
  [(NURenderTransaction *)self submitPendingRequests];

  [(NURenderTransaction *)self resetPendingRequests];
}

- (NSArray)pendingRequests
{
  v2 = (void *)[(NSMutableArray *)self->_requests copy];

  return (NSArray *)v2;
}

- (void)submitRequest:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v56 = a3;
  id v4 = [v56 responseQueue];

  if (!v4)
  {
    v7 = NUAssertLogger_21040();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = [NSString stringWithFormat:@"Cannot render without a response queue"];
      *(_DWORD *)buf = 138543362;
      v58 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v10 = NUAssertLogger_21040();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v28 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v29 = (void *)MEMORY[0x1E4F29060];
        id v30 = v28;
        v31 = [v29 callStackSymbols];
        v32 = [v31 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v58 = v28;
        __int16 v59 = 2114;
        v60 = v32;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v58 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction submitRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 173, @"Cannot render without a response queue", v33, v34, v35, v36, v55);
  }
  v5 = [v56 renderContext];

  if (!v5)
  {
    v14 = NUAssertLogger_21040();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = [NSString stringWithFormat:@"Cannot render without a context"];
      *(_DWORD *)buf = 138543362;
      v58 = v15;
      _os_log_error_impl(&dword_1A9892000, v14, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v16 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v17 = NUAssertLogger_21040();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);
    if (v16)
    {
      if (v18)
      {
        v37 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v38 = (void *)MEMORY[0x1E4F29060];
        id v39 = v37;
        v40 = [v38 callStackSymbols];
        v41 = [v40 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v58 = v37;
        __int16 v59 = 2114;
        v60 = v41;
        _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v18)
    {
      v19 = [MEMORY[0x1E4F29060] callStackSymbols];
      v20 = [v19 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v58 = v20;
      _os_log_error_impl(&dword_1A9892000, v17, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction submitRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 174, @"Cannot render without a context", v42, v43, v44, v45, v55);
  }
  v6 = [v56 completionBlock];

  if (!v6)
  {
    v21 = NUAssertLogger_21040();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = [NSString stringWithFormat:@"Cannot render without a completion block"];
      *(_DWORD *)buf = 138543362;
      v58 = v22;
      _os_log_error_impl(&dword_1A9892000, v21, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v23 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v24 = NUAssertLogger_21040();
    BOOL v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
    if (v23)
    {
      if (v25)
      {
        v46 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v47 = (void *)MEMORY[0x1E4F29060];
        id v48 = v46;
        v49 = [v47 callStackSymbols];
        v50 = [v49 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        v58 = v46;
        __int16 v59 = 2114;
        v60 = v50;
        _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v25)
    {
      v26 = [MEMORY[0x1E4F29060] callStackSymbols];
      v27 = [v26 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      v58 = v27;
      _os_log_error_impl(&dword_1A9892000, v24, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction submitRequest:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 175, @"Cannot render without a completion block", v51, v52, v53, v54, v55);
  }
  [(NSMutableArray *)self->_requests addObject:v56];
}

- (void)notifyCompletion:(id)a3 block:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  queue = a3;
  id v6 = a4;
  if (!queue)
  {
    v8 = NUAssertLogger_21040();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "queue != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v9;
      _os_log_error_impl(&dword_1A9892000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v11 = NUAssertLogger_21040();
    BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v22 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v23 = (void *)MEMORY[0x1E4F29060];
        id v24 = v22;
        BOOL v25 = [v23 callStackSymbols];
        v26 = [v25 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v22;
        __int16 v43 = 2114;
        uint64_t v44 = v26;
        _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v12)
    {
      v13 = [MEMORY[0x1E4F29060] callStackSymbols];
      v14 = [v13 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v14;
      _os_log_error_impl(&dword_1A9892000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction notifyCompletion:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 165, @"Invalid parameter not satisfying: %s", v27, v28, v29, v30, (uint64_t)"queue != nil");
  }
  v7 = v6;
  if (!v6)
  {
    v15 = NUAssertLogger_21040();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v16;
      _os_log_error_impl(&dword_1A9892000, v15, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    v17 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v18 = NUAssertLogger_21040();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        v31 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v32 = (void *)MEMORY[0x1E4F29060];
        id v33 = v31;
        uint64_t v34 = [v32 callStackSymbols];
        uint64_t v35 = [v34 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        uint64_t v42 = v31;
        __int16 v43 = 2114;
        uint64_t v44 = v35;
        _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v19)
    {
      v20 = [MEMORY[0x1E4F29060] callStackSymbols];
      v21 = [v20 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      uint64_t v42 = v21;
      _os_log_error_impl(&dword_1A9892000, v18, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction notifyCompletion:block:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 166, @"Invalid parameter not satisfying: %s", v36, v37, v38, v39, (uint64_t)"block != nil");
  }
  dispatch_group_notify((dispatch_group_t)self->_group, queue, v6);
}

- (BOOL)commit
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int64_t nestingLevel = self->_nestingLevel;
  if (nestingLevel <= 0)
  {
    id v6 = NUAssertLogger_21040();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = [NSString stringWithFormat:@"Unbalanced transaction begin/commit pairs"];
      *(_DWORD *)v22 = 138543362;
      *(void *)&v22[4] = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v22, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger_21040();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        v16 = [v14 callStackSymbols];
        v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)v22 = 138543618;
        *(void *)&v22[4] = v13;
        __int16 v23 = 2114;
        id v24 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v22, 0x16u);
      }
    }
    else if (v10)
    {
      BOOL v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)v22 = 138543362;
      *(void *)&v22[4] = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v22, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction commit]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 147, @"Unbalanced transaction begin/commit pairs", v18, v19, v20, v21, *(uint64_t *)v22);
  }
  int64_t v4 = nestingLevel - 1;
  self->_int64_t nestingLevel = nestingLevel - 1;
  if (nestingLevel == 1)
  {
    [(NURenderTransaction *)self flush];
    dispatch_group_leave((dispatch_group_t)self->_group);
  }
  return v4 == 0;
}

- (BOOL)begin
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  int64_t nestingLevel = self->_nestingLevel;
  if (nestingLevel < 0)
  {
    int64_t v4 = NUAssertLogger_21040();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [NSString stringWithFormat:@"Unbalanced transaction begin/commit pairs"];
      *(_DWORD *)uint64_t v20 = 138543362;
      *(void *)&v20[4] = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v20, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v7 = NUAssertLogger_21040();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        BOOL v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        v14 = [v12 callStackSymbols];
        id v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v20 = 138543618;
        *(void *)&v20[4] = v11;
        __int16 v21 = 2114;
        v22 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v20, 0x16u);
      }
    }
    else if (v8)
    {
      v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v20 = 138543362;
      *(void *)&v20[4] = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v20, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"-[NURenderTransaction begin]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 132, @"Unbalanced transaction begin/commit pairs", v16, v17, v18, v19, *(uint64_t *)v20);
  }
  self->_int64_t nestingLevel = nestingLevel + 1;
  if (!nestingLevel) {
    dispatch_group_enter((dispatch_group_t)self->_group);
  }
  return nestingLevel == 0;
}

- (NURenderTransaction)init
{
  v8.receiver = self;
  v8.super_class = (Class)NURenderTransaction;
  v2 = [(NURenderTransaction *)&v8 init];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  requests = v2->_requests;
  v2->_requests = v3;

  dispatch_group_t v5 = dispatch_group_create();
  group = v2->_group;
  v2->_group = (OS_dispatch_group *)v5;

  return v2;
}

+ (void)withCurrentTransaction:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    v7 = NUAssertLogger_21040();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_super v8 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      id v24 = v8;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    BOOL v10 = NUAssertLogger_21040();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v14 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        id v15 = (void *)MEMORY[0x1E4F29060];
        id v16 = v14;
        uint64_t v17 = [v15 callStackSymbols];
        uint64_t v18 = [v17 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        id v24 = v14;
        __int16 v25 = 2114;
        v26 = v18;
        _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v11)
    {
      BOOL v12 = [MEMORY[0x1E4F29060] callStackSymbols];
      id v13 = [v12 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      id v24 = v13;
      _os_log_error_impl(&dword_1A9892000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderTransaction withCurrentTransaction:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 108, @"Invalid parameter not satisfying: %s", v19, v20, v21, v22, (uint64_t)"block != nil");
  }
  dispatch_group_t v5 = (void (**)(void, void))v4;
  id v6 = [a1 ensureCurrentTransaction];
  [v6 begin];
  ((void (**)(void, void *))v5)[2](v5, v6);
  [a1 _commit:v6];
}

+ (void)group:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    id v6 = NUAssertLogger_21040();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid parameter not satisfying: %s", "block != nil");
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v7;
      _os_log_error_impl(&dword_1A9892000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    v9 = NUAssertLogger_21040();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        id v13 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        v14 = (void *)MEMORY[0x1E4F29060];
        id v15 = v13;
        id v16 = [v14 callStackSymbols];
        uint64_t v17 = [v16 componentsJoinedByString:@"\n"];
        *(_DWORD *)buf = 138543618;
        __int16 v25 = v13;
        __int16 v26 = 2114;
        uint64_t v27 = v17;
        _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);
      }
    }
    else if (v10)
    {
      BOOL v11 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v12 = [v11 componentsJoinedByString:@"\n"];
      *(_DWORD *)buf = 138543362;
      __int16 v25 = v12;
      _os_log_error_impl(&dword_1A9892000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderTransaction group:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 99, @"Invalid parameter not satisfying: %s", v18, v19, v20, v21, (uint64_t)"block != nil");
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __29__NURenderTransaction_group___block_invoke;
  v22[3] = &unk_1E5D95508;
  id v23 = v4;
  id v5 = v4;
  [a1 withCurrentTransaction:v22];
}

uint64_t __29__NURenderTransaction_group___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)commitAndNotifyOnQueue:(id)a3 withBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 assertCurrentTransaction];
  [v8 notifyCompletion:v7 block:v6];

  [a1 _commit:v8];
}

+ (void)_commit:(id)a3
{
  if ([a3 commit])
  {
    [a1 setCurrentTransaction:0];
  }
}

+ (void)commit
{
  id v3 = [a1 assertCurrentTransaction];
  [a1 _commit:v3];
}

+ (void)begin
{
  id v2 = [a1 ensureCurrentTransaction];
  [v2 begin];
}

+ (id)assertCurrentTransaction
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v2 = [a1 currentTransaction];
  if (!v2)
  {
    id v4 = NUAssertLogger_21040();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [NSString stringWithFormat:@"No current transaction"];
      *(_DWORD *)uint64_t v20 = 138543362;
      *(void *)&v20[4] = v5;
      _os_log_error_impl(&dword_1A9892000, v4, OS_LOG_TYPE_ERROR, "Fail: %{public}@", v20, 0xCu);
    }
    specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
    id v7 = NUAssertLogger_21040();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v8)
      {
        BOOL v11 = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
        BOOL v12 = (void *)MEMORY[0x1E4F29060];
        id v13 = v11;
        v14 = [v12 callStackSymbols];
        id v15 = [v14 componentsJoinedByString:@"\n"];
        *(_DWORD *)uint64_t v20 = 138543618;
        *(void *)&v20[4] = v11;
        __int16 v21 = 2114;
        uint64_t v22 = v15;
        _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", v20, 0x16u);
      }
    }
    else if (v8)
    {
      v9 = [MEMORY[0x1E4F29060] callStackSymbols];
      BOOL v10 = [v9 componentsJoinedByString:@"\n"];
      *(_DWORD *)uint64_t v20 = 138543362;
      *(void *)&v20[4] = v10;
      _os_log_error_impl(&dword_1A9892000, v7, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", v20, 0xCu);
    }
    _NUAssertFailHandler((uint64_t)"+[NURenderTransaction assertCurrentTransaction]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Render/NURenderTransaction.m", 61, @"No current transaction", v16, v17, v18, v19, *(uint64_t *)v20);
  }

  return v2;
}

+ (id)ensureCurrentTransaction
{
  id v3 = [a1 currentTransaction];
  if (!v3)
  {
    id v3 = objc_alloc_init(NURenderTransaction);
    [a1 setCurrentTransaction:v3];
  }

  return v3;
}

+ (void)setCurrentTransaction:(id)a3
{
  id v5 = a3;
  id v3 = [MEMORY[0x1E4F29060] currentThread];
  id v4 = [v3 threadDictionary];

  if (v5) {
    [v4 setObject:v5 forKey:@"NURenderTransaction.current"];
  }
  else {
    [v4 removeObjectForKey:@"NURenderTransaction.current"];
  }
}

+ (id)currentTransaction
{
  id v2 = [MEMORY[0x1E4F29060] currentThread];
  id v3 = [v2 threadDictionary];

  id v4 = [v3 objectForKey:@"NURenderTransaction.current"];

  return v4;
}

@end