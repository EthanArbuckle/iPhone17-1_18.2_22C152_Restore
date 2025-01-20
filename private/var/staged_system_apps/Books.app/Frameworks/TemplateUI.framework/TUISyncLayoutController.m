@interface TUISyncLayoutController
- (BOOL)_processUntilDirtyOrEndtime:(double)a3;
- (BOOL)flush;
- (TUISyncLayoutController)init;
- (TUISyncLayoutController)initWithDelegate:(id)a3;
- (TUISyncLayoutControllerDelegate)delegate;
- (id)syncAssertionWithTimeout:(double)a3 transaction:(id)a4 feedId:(id)a5;
- (void)_removeAssertion:(id)a3;
- (void)removeAssertion:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation TUISyncLayoutController

- (TUISyncLayoutController)init
{
  v6.receiver = self;
  v6.super_class = (Class)TUISyncLayoutController;
  v2 = [(TUISyncLayoutController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSHashTable hashTableWithOptions:517];
    assertions = v2->_assertions;
    v2->_assertions = (NSHashTable *)v3;
  }
  return v2;
}

- (TUISyncLayoutController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUISyncLayoutController;
  v5 = [(TUISyncLayoutController *)&v10 init];
  objc_super v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = +[NSHashTable hashTableWithOptions:517];
    assertions = v6->_assertions;
    v6->_assertions = (NSHashTable *)v7;
  }
  return v6;
}

- (BOOL)flush
{
  char flags = (char)self->_flags;
  if ((flags & 1) == 0)
  {
    uint64_t v3 = self;
    *(unsigned char *)&self->_char flags = flags & 0xFA | 1;
    double Current = CFAbsoluteTimeGetCurrent();
    v5 = [(NSHashTable *)v3->_assertions allObjects];
    if ([v5 count])
    {
      char v52 = flags;
      os_signpost_id_t v6 = 0;
      char v7 = 0;
      p_isa = (id *)&v3->super.isa;
      do
      {
        if ((v7 & 1) == 0)
        {
          v8 = TUITransactionLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
            sub_1912BC(&v66, v67, v8);
          }

          v9 = TUITransactionLog();
          os_signpost_id_t v6 = os_signpost_id_generate(v9);

          objc_super v10 = TUITransactionLog();
          v11 = v10;
          if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&def_141F14, v11, OS_SIGNPOST_INTERVAL_BEGIN, v6, "WaitForSyncTransaction", (const char *)&unk_243F7A, buf, 2u);
          }
        }
        *(unsigned char *)&v3->_flags &= ~2u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        id v12 = v5;
        id v13 = [v12 countByEnumeratingWithState:&v62 objects:v74 count:16];
        if (v13)
        {
          id v14 = v13;
          uint64_t v15 = *(void *)v63;
          double v16 = 0.0;
          do
          {
            v17 = 0;
            do
            {
              if (*(void *)v63 != v15) {
                objc_enumerationMutation(v12);
              }
              uint64_t v18 = *(void *)(*((void *)&v62 + 1) + 8 * (void)v17);
              if (v18) {
                double v19 = *(double *)(v18 + 16);
              }
              else {
                double v19 = 0.0;
              }
              if (v16 < v19) {
                double v16 = v19;
              }
              v17 = (char *)v17 + 1;
            }
            while (v14 != v17);
            id v20 = [v12 countByEnumeratingWithState:&v62 objects:v74 count:16];
            id v14 = v20;
          }
          while (v20);
        }
        else
        {
          double v16 = 0.0;
        }

        uint64_t v3 = (TUISyncLayoutController *)p_isa;
        unsigned __int8 v21 = [p_isa _processUntilDirtyOrEndtime:Current + v16];
        v22 = [p_isa[2] allObjects];
        v5 = v22;
        if (v21) {
          break;
        }
        id v23 = [v22 count];
        char v7 = 1;
      }
      while (v23);
      id v24 = [v5 count];
      double v25 = CFAbsoluteTimeGetCurrent();
      if (v24)
      {
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        id v26 = v5;
        id v27 = [v26 countByEnumeratingWithState:&v58 objects:v73 count:16];
        if (v27)
        {
          id v28 = v27;
          uint64_t v29 = *(void *)v59;
          double v30 = 0.0;
          do
          {
            v31 = 0;
            do
            {
              if (*(void *)v59 != v29) {
                objc_enumerationMutation(v26);
              }
              uint64_t v32 = *(void *)(*((void *)&v58 + 1) + 8 * (void)v31);
              if (v32) {
                double v33 = *(double *)(v32 + 16);
              }
              else {
                double v33 = 0.0;
              }
              if (v30 < v33) {
                double v30 = v33;
              }
              v31 = (char *)v31 + 1;
            }
            while (v28 != v31);
            id v34 = [v26 countByEnumeratingWithState:&v58 objects:v73 count:16];
            id v28 = v34;
          }
          while (v34);
        }
        else
        {
          double v30 = 0.0;
        }
      }
      else
      {
        double v30 = 0.0;
      }
      v35 = TUITransactionLog();
      v36 = v35;
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
      {
        CFStringRef v37 = @"YES";
        if (!v24) {
          CFStringRef v37 = @"NO";
        }
        *(_DWORD *)buf = 134218242;
        double v70 = v30;
        __int16 v71 = 2114;
        CFStringRef v72 = v37;
        _os_signpost_emit_with_name_impl(&def_141F14, v36, OS_SIGNPOST_INTERVAL_END, v6, "WaitForSyncTransaction", "Time limit: %fs Timed out: %{public}@ enableTelemetry=YES ", buf, 0x16u);
      }

      double v38 = v25 - Current;
      if (v38 > 0.1)
      {
        v39 = TUITransactionLog();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          double v70 = v38;
          _os_log_impl(&def_141F14, v39, OS_LOG_TYPE_INFO, "time spent waiting for sync layout flush: %.2fs", buf, 0xCu);
        }
      }
      if (v24)
      {
        v40 = TUITransactionLog();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          sub_191218(v5, v40, v38);
        }

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v41 = v5;
        id v42 = [v41 countByEnumeratingWithState:&v54 objects:v68 count:16];
        if (v42)
        {
          id v43 = v42;
          uint64_t v44 = *(void *)v55;
          do
          {
            v45 = 0;
            do
            {
              if (*(void *)v55 != v44) {
                objc_enumerationMutation(v41);
              }
              CFStringRef v46 = *(const __CFString **)(*((void *)&v54 + 1) + 8 * (void)v45);
              v47 = TUITransactionLog();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                if (v46) {
                  double v48 = *(double *)&v46[1].isa;
                }
                else {
                  double v48 = 0.0;
                }
                *(_DWORD *)buf = 134218242;
                double v70 = v48;
                __int16 v71 = 2114;
                CFStringRef v72 = v46;
                _os_log_impl(&def_141F14, v47, OS_LOG_TYPE_INFO, "- [fid:%lu] %{public}@", buf, 0x16u);
              }

              v45 = (char *)v45 + 1;
            }
            while (v43 != v45);
            id v49 = [v41 countByEnumeratingWithState:&v54 objects:v68 count:16];
            id v43 = v49;
          }
          while (v49);
        }

        uint64_t v3 = (TUISyncLayoutController *)p_isa;
      }
      v50 = TUITransactionLog();
      if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
        sub_1911D4(v50);
      }

      char flags = v52;
    }
    *(unsigned char *)&v3->_flags &= ~1u;
  }
  return (flags & 1) == 0;
}

- (BOOL)_processUntilDirtyOrEndtime:(double)a3
{
  if ((*(unsigned char *)&self->_flags & 2) != 0) {
    return 0;
  }
  while (a3 - CFAbsoluteTimeGetCurrent() > 0.0)
  {
    unsigned int v5 = TUIDispatchDrainWithTimeout();
    BOOL result = v5 == 3;
    if ((*(unsigned char *)&self->_flags & 2) != 0 || v5 == 3) {
      return result;
    }
  }
  return 1;
}

- (id)syncAssertionWithTimeout:(double)a3 transaction:(id)a4 feedId:(id)a5
{
  id v8 = a4;
  v9 = [[_TUISyncLayoutAssertion alloc] initWithController:self timeout:v8 transaction:a5.var0 feedId:a3];
  [(NSHashTable *)self->_assertions addObject:v9];
  *(unsigned char *)&self->_flags |= 2u;
  objc_super v10 = TUITransactionLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    int v13 = 138543362;
    id v14 = v8;
    _os_log_impl(&def_141F14, v10, OS_LOG_TYPE_INFO, "scheduled sync-assertion for tx=%{public}@", (uint8_t *)&v13, 0xCu);
  }

  if ((*(unsigned char *)&self->_flags & 5) == 0)
  {
    *(unsigned char *)&self->_flags |= 4u;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained syncLayoutControllerNeedsFlushing:self];
  }

  return v9;
}

- (void)removeAssertion:(id)a3
{
  id v4 = a3;
  if (+[NSThread isMainThread])
  {
    [(TUISyncLayoutController *)self _removeAssertion:v4];
  }
  else
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_80BA8;
    v5[3] = &unk_251828;
    v5[4] = self;
    id v6 = v4;
    TUIDispatchAsyncViaRunLoop((uint64_t)v5);
  }
}

- (void)_removeAssertion:(id)a3
{
  id v4 = a3;
  unsigned int v5 = TUITransactionLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    if (v4) {
      uint64_t v6 = v4[3];
    }
    else {
      uint64_t v6 = 0;
    }
    int v7 = 138543362;
    uint64_t v8 = v6;
    _os_log_impl(&def_141F14, v5, OS_LOG_TYPE_INFO, "removed sync-assertion for tx=%{public}@", (uint8_t *)&v7, 0xCu);
  }

  if (v4) {
    [(NSHashTable *)self->_assertions removeObject:v4];
  }
  *(unsigned char *)&self->_flags |= 2u;
}

- (TUISyncLayoutControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (TUISyncLayoutControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_assertions, 0);
}

@end