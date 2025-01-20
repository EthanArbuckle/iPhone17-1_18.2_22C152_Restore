@interface FCFetchedValueObservable
- (FCFetchedValueManager)manager;
- (FCFetchedValueObservable)init;
- (FCFetchedValueObservable)initWithManager:(id)a3 initialValue:(id)a4 equalityTest:(id)a5;
- (NFCopying)value;
- (NFUnfairLock)lock;
- (NSError)error;
- (NSHashTable)observers;
- (id)equalityTest;
- (id)valueWithError:(id *)a3;
- (void)addObserver:(id)a3;
- (void)handleError:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setError:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation FCFetchedValueObservable

void __43__FCFetchedValueObservable_valueWithError___block_invoke(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(a1[4] + 8));
  v2 = *(void **)(a1[4] + 48);
  v3 = (id *)(*(void *)(a1[6] + 8) + 40);
  objc_storeStrong(v3, v2);
}

void __43__FCFetchedValueObservable_removeObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 removeObject:*(void *)(a1 + 40)];
}

void __40__FCFetchedValueObservable_addObserver___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSHashTable)observers
{
  return self->_observers;
}

void __37__FCFetchedValueObservable_setValue___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[1])
  {
    v3 = [v2 equalityTest];
    int v4 = v3[2](v3, *(void *)(*(void *)(a1 + 32) + 8), *(void *)(a1 + 40)) ^ 1;
  }
  else
  {
    int v4 = 1;
  }
  uint64_t v5 = [*(id *)(a1 + 40) copy];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v5;

  uint64_t v8 = *(void *)(a1 + 32);
  v9 = *(void **)(v8 + 48);
  *(void *)(v8 + 48) = 0;

  if (v4)
  {
    id v13 = [*(id *)(a1 + 32) observers];
    uint64_t v10 = [v13 allObjects];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
}

- (id)equalityTest
{
  return self->_equalityTest;
}

- (void)setValue:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v9 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "value");
    *(_DWORD *)buf = 136315906;
    *(void *)&buf[4] = "-[FCFetchedValueObservable setValue:]";
    *(_WORD *)&buf[12] = 2080;
    *(void *)&buf[14] = "FCFetchedValueObservable.m";
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v18) = 58;
    WORD2(v18) = 2114;
    *(void *)((char *)&v18 + 6) = v9;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  *(void *)&long long v18 = __Block_byref_object_copy__13;
  *((void *)&v18 + 1) = __Block_byref_object_dispose__13;
  id v19 = 0;
  uint64_t v5 = [(FCFetchedValueObservable *)self lock];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __37__FCFetchedValueObservable_setValue___block_invoke;
  v14[3] = &unk_1E5B4C4D0;
  v14[4] = self;
  id v6 = v4;
  id v15 = v6;
  v16 = buf;
  [v5 performWithLockSync:v14];

  v7 = [(FCFetchedValueObservable *)self manager];
  if (v7)
  {
    uint64_t v8 = dispatch_get_global_queue(17, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __37__FCFetchedValueObservable_setValue___block_invoke_2;
    block[3] = &unk_1E5B4C230;
    id v13 = buf;
    id v11 = v7;
    id v12 = v6;
    dispatch_async(v8, block);
  }
  _Block_object_dispose(buf, 8);
}

- (FCFetchedValueManager)manager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_manager);
  return (FCFetchedValueManager *)WeakRetained;
}

- (void)addObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer");
    *(_DWORD *)buf = 136315906;
    id v11 = "-[FCFetchedValueObservable addObserver:]";
    __int16 v12 = 2080;
    id v13 = "FCFetchedValueObservable.m";
    __int16 v14 = 1024;
    int v15 = 134;
    __int16 v16 = 2114;
    v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = [(FCFetchedValueObservable *)self lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__FCFetchedValueObservable_addObserver___block_invoke;
  v8[3] = &unk_1E5B4BE70;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 performWithLockSync:v8];
}

- (id)valueWithError:(id *)a3
{
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = __Block_byref_object_copy__13;
  id v19 = __Block_byref_object_dispose__13;
  id v20 = 0;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  __int16 v12 = __Block_byref_object_copy__13;
  id v13 = __Block_byref_object_dispose__13;
  id v14 = 0;
  uint64_t v5 = [(FCFetchedValueObservable *)self lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__FCFetchedValueObservable_valueWithError___block_invoke;
  v8[3] = &unk_1E5B4EDD0;
  v8[4] = self;
  void v8[5] = &v15;
  v8[6] = &v9;
  [v5 performWithLockSync:v8];

  if (a3) {
    *a3 = (id) v10[5];
  }
  id v6 = (id)v16[5];
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

- (NFUnfairLock)lock
{
  return self->_lock;
}

- (NFCopying)value
{
  return (NFCopying *)[(FCFetchedValueObservable *)self valueWithError:0];
}

- (FCFetchedValueObservable)initWithManager:(id)a3 initialValue:(id)a4 equalityTest:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v22 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "manager != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCFetchedValueObservable initWithManager:initialValue:equalityTest:]";
    __int16 v27 = 2080;
    v28 = "FCFetchedValueObservable.m";
    __int16 v29 = 1024;
    int v30 = 40;
    __int16 v31 = 2114;
    v32 = v22;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10) {
      goto LABEL_6;
    }
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v23 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "equalityTest != nil");
    *(_DWORD *)buf = 136315906;
    v26 = "-[FCFetchedValueObservable initWithManager:initialValue:equalityTest:]";
    __int16 v27 = 2080;
    v28 = "FCFetchedValueObservable.m";
    __int16 v29 = 1024;
    int v30 = 41;
    __int16 v31 = 2114;
    v32 = v23;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
LABEL_6:
  v24.receiver = self;
  v24.super_class = (Class)FCFetchedValueObservable;
  uint64_t v11 = [(FCFetchedValueObservable *)&v24 init];
  __int16 v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_manager, v8);
    uint64_t v13 = [v9 copy];
    value = v12->_value;
    v12->_value = (NFCopying *)v13;

    uint64_t v15 = _Block_copy(v10);
    id equalityTest = v12->_equalityTest;
    v12->_id equalityTest = v15;

    uint64_t v17 = [MEMORY[0x1E4F28D30] hashTableWithOptions:517];
    observers = v12->_observers;
    v12->_observers = (NSHashTable *)v17;

    uint64_t v19 = [objc_alloc(MEMORY[0x1E4F81C18]) initWithOptions:1];
    lock = v12->_lock;
    v12->_lock = (NFUnfairLock *)v19;
  }
  return v12;
}

- (void)removeObserver:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "observer");
    *(_DWORD *)buf = 136315906;
    uint64_t v11 = "-[FCFetchedValueObservable removeObserver:]";
    __int16 v12 = 2080;
    uint64_t v13 = "FCFetchedValueObservable.m";
    __int16 v14 = 1024;
    int v15 = 144;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = [(FCFetchedValueObservable *)self lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __43__FCFetchedValueObservable_removeObserver___block_invoke;
  v8[3] = &unk_1E5B4BE70;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 performWithLockSync:v8];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong(&self->_equalityTest, 0);
  objc_destroyWeak((id *)&self->_manager);
  objc_storeStrong((id *)&self->_value, 0);
}

void __37__FCFetchedValueObservable_setValue___block_invoke_2(void *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1[6] + 8) + 40);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "fetchedObjectManager:valueDidChange:", a1[4], a1[5], (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (FCFetchedValueObservable)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    id v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    long long v8 = "-[FCFetchedValueObservable init]";
    __int16 v9 = 2080;
    long long v10 = "FCFetchedValueObservable.m";
    __int16 v11 = 1024;
    int v12 = 33;
    __int16 v13 = 2114;
    __int16 v14 = v2;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3B8];
  uint64_t v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[FCFetchedValueObservable init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (void)handleError:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    long long v7 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "error");
    *(_DWORD *)buf = 136315906;
    __int16 v11 = "-[FCFetchedValueObservable handleError:]";
    __int16 v12 = 2080;
    __int16 v13 = "FCFetchedValueObservable.m";
    __int16 v14 = 1024;
    int v15 = 90;
    __int16 v16 = 2114;
    uint64_t v17 = v7;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  uint64_t v5 = [(FCFetchedValueObservable *)self lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__FCFetchedValueObservable_handleError___block_invoke;
  v8[3] = &unk_1E5B4BE70;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  [v5 performWithLockSync:v8];
}

uint64_t __40__FCFetchedValueObservable_handleError___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(void *)(v1 + 8))
  {
    uint64_t v2 = *(void *)(v1 + 48);
    *(void *)(v1 + 48) = 0;
  }
  else
  {
    uint64_t v3 = a1;
    a1 = [*(id *)(a1 + 40) copy];
    uint64_t v4 = *(void *)(v3 + 32);
    uint64_t v2 = *(void *)(v4 + 48);
    *(void *)(v4 + 48) = a1;
  }
  return MEMORY[0x1F41817F8](a1, v2);
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

@end