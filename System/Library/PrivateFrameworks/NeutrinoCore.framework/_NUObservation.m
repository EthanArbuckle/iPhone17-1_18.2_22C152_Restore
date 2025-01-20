@interface _NUObservation
- (OS_dispatch_queue)queue;
- (_NUObservation)init;
- (_NUObservation)initWithObserver:(id)a3 key:(int64_t)a4 queue:(id)a5 block:(id)a6;
- (id)block;
- (id)observer;
- (int64_t)key;
- (void)notifyWithBlock:(id)a3;
@end

@implementation _NUObservation

- (void).cxx_destruct
{
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak(&self->_observer);
}

- (id)block
{
  return self->_block;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)key
{
  return self->_key;
}

- (id)observer
{
  id WeakRetained = objc_loadWeakRetained(&self->_observer);

  return WeakRetained;
}

- (void)notifyWithBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  queue = self->_queue;
  if (queue)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __34___NUObservation_notifyWithBlock___block_invoke;
    v7[3] = &unk_1E5D95F30;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(queue, v7);
  }
  else
  {
    (*((void (**)(id, id))v4 + 2))(v4, self->_block);
  }
}

- (_NUObservation)initWithObserver:(id)a3 key:(int64_t)a4 queue:(id)a5 block:(id)a6
{
  v10 = (OS_dispatch_queue *)a5;
  v19.receiver = self;
  v19.super_class = (Class)_NUObservation;
  id v11 = a6;
  id v12 = a3;
  v13 = [(_NUObservation *)&v19 init];
  objc_storeWeak(&v13->_observer, v12);

  queue = v13->_queue;
  v13->_key = a4;
  v13->_queue = v10;
  v15 = v10;

  uint64_t v16 = objc_msgSend(v11, "copy", v19.receiver, v19.super_class);
  id block = v13->_block;
  v13->_id block = (id)v16;

  return v13;
}

- (_NUObservation)init
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (_NULogOnceToken != -1) {
    dispatch_once(&_NULogOnceToken, &__block_literal_global_25076);
  }
  v3 = (void *)_NUAssertLogger;
  if (os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR))
  {
    id v4 = NSString;
    v5 = v3;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    id v8 = NSStringFromSelector(a2);
    v9 = [v4 stringWithFormat:@"Initializer not available: -[%@ %@], use designated initializer instead.", v7, v8];
    *(_DWORD *)buf = 138543362;
    v29 = v9;
    _os_log_error_impl(&dword_1A9892000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    uint64_t v10 = _NULogOnceToken;
    if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
    {
      if (v10 != -1) {
        dispatch_once(&_NULogOnceToken, &__block_literal_global_25076);
      }
      goto LABEL_8;
    }
    if (v10 != -1) {
      dispatch_once(&_NULogOnceToken, &__block_literal_global_25076);
    }
  }
  else if (!dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey))
  {
LABEL_8:
    id v11 = (void *)_NUAssertLogger;
    if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    id v12 = (void *)MEMORY[0x1E4F29060];
    v13 = v11;
    v14 = [v12 callStackSymbols];
    v15 = [v14 componentsJoinedByString:@"\n"];
    *(_DWORD *)buf = 138543362;
    v29 = v15;
    _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    goto LABEL_14;
  }
  uint64_t v16 = (void *)_NUAssertLogger;
  if (!os_log_type_enabled((os_log_t)_NUAssertLogger, OS_LOG_TYPE_ERROR)) {
    goto LABEL_15;
  }
  specific = dispatch_get_specific((const void *)NUCurrentlyExecutingJobNameKey);
  v18 = (void *)MEMORY[0x1E4F29060];
  id v19 = specific;
  v13 = v16;
  v20 = [v18 callStackSymbols];
  v21 = [v20 componentsJoinedByString:@"\n"];
  *(_DWORD *)buf = 138543618;
  v29 = specific;
  __int16 v30 = 2114;
  v31 = v21;
  _os_log_error_impl(&dword_1A9892000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

LABEL_14:
LABEL_15:
  v22 = (objc_class *)objc_opt_class();
  uint64_t v23 = NSStringFromClass(v22);
  NSStringFromSelector(a2);
  objc_claimAutoreleasedReturnValue();
  _NUAssertFailHandler((uint64_t)"-[_NUObservation init]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/neutrino/Core/Util/NUObservatory.m", 27, @"Initializer not available: -[%@ %@], use designated initializer instead.", v24, v25, v26, v27, v23);
}

@end