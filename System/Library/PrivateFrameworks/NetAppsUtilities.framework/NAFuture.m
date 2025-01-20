@interface NAFuture
+ (id)_chainFuturesWithFutureStack:(id)a3;
+ (id)_descriptorForChainOperation:(id)a3 onFuture:(id)a4 withBlock:(id)a5;
+ (id)chainFutures:(id)a3;
+ (id)combineAllFutures:(id)a3;
+ (id)combineAllFutures:(id)a3 ignoringErrors:(BOOL)a4 scheduler:(id)a5;
+ (id)combineAllFutures:(id)a3 scheduler:(id)a4;
+ (id)futureWithBlock:(id)a3;
+ (id)futureWithBlock:(id)a3 scheduler:(id)a4;
+ (id)futureWithCompletionHandlerAdapterBlock:(id)a3;
+ (id)futureWithError:(id)a3;
+ (id)futureWithErrorOnlyHandlerAdapterBlock:(id)a3;
+ (id)futureWithResult:(id)a3;
+ (id)lazyFutureWithBlock:(id)a3;
+ (id)lazyFutureWithBlock:(id)a3 scheduler:(id)a4;
+ (void)_setShouldEnforceThreadSafety:(BOOL)a3;
- (BOOL)_queue_isCancelled;
- (BOOL)cancel;
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithNoResult;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (BOOL)isCancelled;
- (BOOL)isFinished;
- (NAFuture)init;
- (NAFuture)initWithResult:(id)a3 error:(id)a4;
- (NSString)description;
- (NSString)descriptor;
- (id)addCompletionBlock:(id)a3;
- (id)addFailureBlock:(id)a3;
- (id)addSuccessBlock:(id)a3;
- (id)completionHandlerAdapter;
- (id)errorOnlyCompletionHandlerAdapter;
- (id)flatMap:(id)a3;
- (id)recover:(id)a3;
- (id)recoverIgnoringError;
- (id)reschedule:(id)a3;
- (void)setDescriptor:(id)a3;
@end

@implementation NAFuture

+ (id)combineAllFutures:(id)a3 ignoringErrors:(BOOL)a4 scheduler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 count])
  {
    v9 = objc_alloc_init(NAFuture);
    uint64_t v10 = [v7 count];
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x2020000000;
    v27[3] = v10;
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x2020000000;
    char v26 = 0;
    for (i = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [i addObject:v12];
    }
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke;
    v18[3] = &unk_1E6109DA8;
    BOOL v24 = a4;
    v13 = v9;
    v19 = v13;
    v22 = v27;
    id v14 = i;
    id v20 = v14;
    v23 = v25;
    id v21 = v8;
    [v7 enumerateObjectsUsingBlock:v18];
    v15 = v21;
    v16 = v13;

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);
  }
  else
  {
    v16 = +[NAFuture futureWithResult:MEMORY[0x1E4F1CBF0]];
  }

  return v16;
}

+ (id)futureWithResult:(id)a3
{
  id v3 = a3;
  v4 = [[NAFuture alloc] initWithResult:v3 error:0];

  return v4;
}

- (id)recover:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  v6 = (void *)MEMORY[0x1BA99CF00](v4);
  id v7 = [v5 _descriptorForChainOperation:@"recover" onFuture:self withBlock:v6];

  id v8 = objc_alloc_init(NAFuture);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __20__NAFuture_recover___block_invoke;
  v26[3] = &unk_1E6109C98;
  id v9 = v7;
  id v27 = v9;
  id v10 = v4;
  id v29 = v10;
  v11 = v8;
  v28 = v11;
  v12 = self;
  v13 = v26;
  if (v12)
  {
    [(NAFuture *)v12 willAddCompletionBlock];
    os_unfair_lock_lock(&v12->_lock);
    id v14 = v12->_resultValue;
    v15 = v12->_resultError;
    v16 = v12->_completionScheduler;
    if (v12->_finished)
    {
      os_unfair_lock_unlock(&v12->_lock);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v30[3] = &unk_1E6109DF8;
      v33 = v13;
      id v31 = v14;
      v32 = v15;
      [(NAScheduler *)v16 performBlock:v30];
    }
    else
    {
      id v25 = v14;
      completionBlocks = v12->_completionBlocks;
      if (!completionBlocks)
      {
        v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        v19 = v12->_completionBlocks;
        v12->_completionBlocks = v18;

        completionBlocks = v12->_completionBlocks;
      }
      id v20 = (void *)[v13 copy];
      [(NSMutableArray *)completionBlocks addObject:v20];

      os_unfair_lock_unlock(&v12->_lock);
      id v14 = v25;
    }
    id v21 = v12;
  }
  v22 = v28;
  v23 = v11;

  return v23;
}

void __20__NAFuture_recover___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    _NAPushScopedDescriptor(*(void *)(a1 + 32));
    id v8 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (!v8)
    {
      id v9 = (void *)MEMORY[0x1BA99CF00](*(void *)(a1 + 48));
      id v10 = _NABlockDescriptor();
      NSLog(&cfstr_NafutureRecove.isa, v10);
    }
    _NAPopScopedDescriptor();
    v11 = [*(id *)(a1 + 40) completionHandlerAdapter];
    v12 = v8;
    id v13 = v11;
    if (v8)
    {
      [v12 willAddCompletionBlock];
      os_unfair_lock_lock((os_unfair_lock_t)v12 + 2);
      id v14 = v12[4];
      id v15 = v12[5];
      id v16 = v12[2];
      if (*((unsigned char *)v12 + 12))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)v12 + 2);
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = ___NAFutureAddCompletionBlock_block_invoke;
        v46[3] = &unk_1E6109DF8;
        id v49 = v13;
        id v47 = v14;
        id v48 = v15;
        [v16 performBlock:v46];
      }
      else
      {
        id v31 = v12[3];
        if (!v31)
        {
          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          id v33 = v12[3];
          v12[3] = v32;

          id v31 = v12[3];
        }
        v34 = (void *)[v13 copy];
        [v31 addObject:v34];

        os_unfair_lock_unlock((os_unfair_lock_t)v12 + 2);
      }
      v35 = v12;
    }
  }
  else
  {
    v12 = (id *)*(id *)(a1 + 40);
    id v17 = v6;
    id v13 = v17;
    if (v12)
    {
      id v36 = v17;
      id v37 = v6;
      os_unfair_lock_lock((os_unfair_lock_t)v12 + 2);
      if (!*((unsigned char *)v12 + 12))
      {
        objc_storeStrong(v12 + 4, a2);
        id v18 = v12[5];
        v12[5] = 0;

        *((unsigned char *)v12 + 12) = 1;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v12 + 2);
      v19 = v12;
      os_unfair_lock_lock((os_unfair_lock_t)v12 + 2);
      id v20 = v19[4];
      id v21 = v19[5];
      id v22 = v19[2];
      v23 = (void *)[v19[3] copy];
      id v24 = v19[3];
      v19[3] = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)v12 + 2);
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      id v25 = v23;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v43;
        do
        {
          for (uint64_t i = 0; i != v27; ++i)
          {
            if (*(void *)v43 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            v38[0] = MEMORY[0x1E4F143A8];
            v38[1] = 3221225472;
            v38[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
            v38[3] = &unk_1E6109DF8;
            uint64_t v41 = v30;
            id v39 = v20;
            id v40 = v21;
            [v22 performBlock:v38];
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v42 objects:v46 count:16];
        }
        while (v27);
      }

      v12 = v19;
      id v6 = v37;
      id v13 = v36;
    }
  }
}

- (BOOL)finishWithResult:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self;
  id v7 = v5;
  id v8 = v7;
  if (v6)
  {
    id v26 = v7;
    p_lock = &v6->_lock;
    os_unfair_lock_lock(&v6->_lock);
    BOOL v25 = !v6->_finished;
    if (!v6->_finished)
    {
      objc_storeStrong(&v6->_resultValue, a3);
      resultError = v6->_resultError;
      v6->_resultError = 0;

      v6->_finished = 1;
    }
    os_unfair_lock_unlock(&v6->_lock);
    uint64_t v27 = v6;
    v11 = v6;
    os_unfair_lock_lock(p_lock);
    id v12 = v11[4];
    id v13 = v11[5];
    id v14 = v11[2];
    id v15 = (void *)[v11[3] copy];
    id v16 = v11[3];
    v11[3] = 0;

    os_unfair_lock_unlock(p_lock);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v28[3] = &unk_1E6109DF8;
          uint64_t v31 = v22;
          id v29 = v12;
          id v30 = v13;
          [v14 performBlock:v28];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }

    id v8 = v26;
    id v6 = v27;
    BOOL v23 = v25;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (id)addCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = v4;
  if (v5)
  {
    [(NAFuture *)v5 willAddCompletionBlock];
    os_unfair_lock_lock(&v5->_lock);
    id v7 = v5->_resultValue;
    id v8 = v5->_resultError;
    id v9 = v5->_completionScheduler;
    if (v5->_finished)
    {
      os_unfair_lock_unlock(&v5->_lock);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v16[3] = &unk_1E6109DF8;
      id v19 = v6;
      id v17 = v7;
      uint64_t v18 = v8;
      [(NAScheduler *)v9 performBlock:v16];
    }
    else
    {
      completionBlocks = v5->_completionBlocks;
      if (!completionBlocks)
      {
        v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v12 = v5->_completionBlocks;
        v5->_completionBlocks = v11;

        completionBlocks = v5->_completionBlocks;
      }
      id v13 = (void *)[v6 copy];
      [(NSMutableArray *)completionBlocks addObject:v13];

      os_unfair_lock_unlock(&v5->_lock);
    }
    id v14 = v5;
  }
  return v5;
}

- (NAFuture)initWithResult:(id)a3 error:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(NAFuture *)self init];
  id v10 = v9;
  if (v9)
  {
    v9->_finished = 1;
    objc_storeStrong(&v9->_resultValue, a3);
    objc_storeStrong((id *)&v10->_resultError, a4);
  }

  return v10;
}

void __36__NAFuture_completionHandlerAdapter__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  id v9 = v6;
  id v10 = v7;
  v11 = v10;
  if (v8)
  {
    id v24 = v10;
    id v25 = v9;
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
    if (!*((unsigned char *)v8 + 12))
    {
      objc_storeStrong((id *)v8 + 4, a2);
      objc_storeStrong((id *)v8 + 5, a3);
      *((unsigned char *)v8 + 12) = 1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
    id v12 = (id *)v8;
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
    id v13 = v12[4];
    id v14 = v12[5];
    id v15 = v12[2];
    id v16 = (void *)[v12[3] copy];
    id v17 = v12[3];
    v12[3] = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v26[3] = &unk_1E6109DF8;
          uint64_t v29 = v23;
          id v27 = v13;
          id v28 = v14;
          [v15 performBlock:v26];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v20);
    }

    id v9 = v25;
    v11 = v24;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_resultError, 0);
  objc_storeStrong(&self->_resultValue, 0);
  objc_storeStrong((id *)&self->_completionBlocks, 0);
  objc_storeStrong((id *)&self->_completionScheduler, 0);
}

void __20__NAFuture_flatMap___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = *(id *)(a1 + 32);
    id v8 = v6;
    id v9 = v8;
    if (v7)
    {
      id v36 = v8;
      id v38 = v5;
      os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
      if (!*((unsigned char *)v7 + 12))
      {
        id v10 = (void *)*((void *)v7 + 4);
        *((void *)v7 + 4) = 0;

        objc_storeStrong((id *)v7 + 5, a3);
        *((unsigned char *)v7 + 12) = 1;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
      id v37 = v7;
      v11 = (id *)v7;
      os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
      id v12 = v11[4];
      id v13 = v11[5];
      id v14 = v11[2];
      id v15 = (void *)[v11[3] copy];
      id v16 = v11[3];
      uint64_t v35 = v11;
      v11[3] = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v44;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v44 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            v39[0] = MEMORY[0x1E4F143A8];
            v39[1] = 3221225472;
            v39[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
            v39[3] = &unk_1E6109DF8;
            uint64_t v42 = v22;
            id v40 = v12;
            id v41 = v13;
            [v14 performBlock:v39];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v43 objects:v47 count:16];
        }
        while (v19);
      }

      id v5 = v38;
      id v9 = v36;
      id v7 = v37;
    }
  }
  else
  {
    _NAPushScopedDescriptor(*(void *)(a1 + 40));
    uint64_t v23 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    if (!v23)
    {
      id v24 = (void *)MEMORY[0x1BA99CF00](*(void *)(a1 + 48));
      id v25 = _NABlockDescriptor();
      NSLog(&cfstr_NafutureFlatma.isa, v25);
    }
    _NAPopScopedDescriptor();
    id v26 = [*(id *)(a1 + 32) completionHandlerAdapter];
    id v7 = v23;
    id v9 = v26;
    if (v23)
    {
      [v7 willAddCompletionBlock];
      os_unfair_lock_lock((os_unfair_lock_t)v7 + 2);
      id v27 = *((id *)v7 + 4);
      id v28 = *((id *)v7 + 5);
      id v29 = *((id *)v7 + 2);
      if (*((unsigned char *)v7 + 12))
      {
        os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
        v47[0] = MEMORY[0x1E4F143A8];
        v47[1] = 3221225472;
        v47[2] = ___NAFutureAddCompletionBlock_block_invoke;
        v47[3] = &unk_1E6109DF8;
        id v50 = v9;
        id v48 = v27;
        id v49 = v28;
        [v29 performBlock:v47];
      }
      else
      {
        long long v30 = (void *)*((void *)v7 + 3);
        if (!v30)
        {
          id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          long long v32 = (void *)*((void *)v7 + 3);
          *((void *)v7 + 3) = v31;

          long long v30 = (void *)*((void *)v7 + 3);
        }
        long long v33 = (void *)[v9 copy];
        [v30 addObject:v33];

        os_unfair_lock_unlock((os_unfair_lock_t)v7 + 2);
      }
      id v34 = v7;
    }
  }
}

- (id)completionHandlerAdapter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__NAFuture_completionHandlerAdapter__block_invoke;
  v4[3] = &unk_1E6109BF8;
  v4[4] = self;
  v2 = (void *)MEMORY[0x1BA99CF00](v4, a2);
  return v2;
}

- (id)flatMap:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_class();
  id v6 = (void *)MEMORY[0x1BA99CF00](v4);
  id v7 = [v5 _descriptorForChainOperation:@"flatMap" onFuture:self withBlock:v6];

  id v8 = objc_alloc_init(NAFuture);
  [(NAFuture *)v8 setDescriptor:v7];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __20__NAFuture_flatMap___block_invoke;
  v26[3] = &unk_1E6109C70;
  id v9 = v8;
  id v27 = v9;
  id v10 = v7;
  id v28 = v10;
  id v11 = v4;
  id v29 = v11;
  id v12 = self;
  id v13 = v26;
  if (v12)
  {
    [(NAFuture *)v12 willAddCompletionBlock];
    os_unfair_lock_lock(&v12->_lock);
    id v14 = v12->_resultValue;
    id v15 = v12->_resultError;
    id v16 = v12->_completionScheduler;
    if (v12->_finished)
    {
      os_unfair_lock_unlock(&v12->_lock);
      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v30[3] = &unk_1E6109DF8;
      long long v33 = v13;
      id v31 = v14;
      long long v32 = v15;
      [(NAScheduler *)v16 performBlock:v30];
    }
    else
    {
      id v25 = v14;
      completionBlocks = v12->_completionBlocks;
      if (!completionBlocks)
      {
        uint64_t v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v19 = v12->_completionBlocks;
        v12->_completionBlocks = v18;

        completionBlocks = v12->_completionBlocks;
      }
      uint64_t v20 = (void *)[v13 copy];
      [(NSMutableArray *)completionBlocks addObject:v20];

      os_unfair_lock_unlock(&v12->_lock);
      id v14 = v25;
    }
    uint64_t v21 = v12;
  }
  uint64_t v22 = v29;
  uint64_t v23 = v9;

  return v23;
}

- (NAFuture)init
{
  v9.receiver = self;
  v9.super_class = (Class)NAFuture;
  v2 = [(NAFuture *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NAScheduler immediateScheduler];
    completionScheduler = v2->_completionScheduler;
    v2->_completionScheduler = (NAScheduler *)v3;

    id v5 = _NAScopedDescriptor();
    uint64_t v6 = [v5 copy];
    descriptor = v2->_descriptor;
    v2->_descriptor = (NSString *)v6;

    if (__enforceThreadSafety) {
      v2->_lock._os_unfair_lock_opaque = 0;
    }
  }
  return v2;
}

+ (id)_descriptorForChainOperation:(id)a3 onFuture:(id)a4 withBlock:(id)a5
{
  return 0;
}

- (void)setDescriptor:(id)a3
{
}

void __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = (id)[*(id *)(a1 + 40) copy];
  [v1 finishWithResult:v2];
}

uint64_t __28__NAFuture_addFailureBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

void __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_2;
  v11[3] = &unk_1E6109D80;
  char v18 = *(unsigned char *)(a1 + 72);
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 56);
  id v12 = v6;
  uint64_t v15 = v7;
  id v8 = *(id *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 64);
  id v13 = v8;
  uint64_t v16 = v9;
  uint64_t v17 = a3;
  id v14 = *(id *)(a1 + 48);
  id v10 = (id)[a2 addCompletionBlock:v11];
}

void __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40))
  {
    id v2 = *(void **)(a1 + 32);
    objc_msgSend(v2, "finishWithError:");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "na_genericError");
    id v3 = (id)objc_claimAutoreleasedReturnValue();
    [v1 finishWithError:v3];
  }
}

- (id)addSuccessBlock:(id)a3
{
  id v4 = a3;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __28__NAFuture_addSuccessBlock___block_invoke;
  uint64_t v20 = &unk_1E6109C48;
  id v5 = v4;
  id v21 = v5;
  id v6 = self;
  uint64_t v7 = &v17;
  if (v6)
  {
    [(NAFuture *)v6 willAddCompletionBlock];
    os_unfair_lock_lock(&v6->_lock);
    id v8 = v6->_resultValue;
    uint64_t v9 = v6->_resultError;
    id v10 = v6->_completionScheduler;
    if (v6->_finished)
    {
      os_unfair_lock_unlock(&v6->_lock);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v22[3] = &unk_1E6109DF8;
      id v25 = v7;
      id v23 = v8;
      id v24 = v9;
      [(NAScheduler *)v10 performBlock:v22];
    }
    else
    {
      completionBlocks = v6->_completionBlocks;
      if (!completionBlocks)
      {
        id v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        id v13 = v6->_completionBlocks;
        v6->_completionBlocks = v12;

        completionBlocks = v6->_completionBlocks;
      }
      id v14 = (void *)[v7 copy];
      [(NSMutableArray *)completionBlocks addObject:v14];

      os_unfair_lock_unlock(&v6->_lock);
    }
    uint64_t v15 = v6;
  }
  return v6;
}

uint64_t __28__NAFuture_addSuccessBlock___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

id __46__NAFuture_NAConveniences__futureWithNoResult__block_invoke()
{
  if (_block_invoke_na_once_token_1 != -1) {
    dispatch_once(&_block_invoke_na_once_token_1, &__block_literal_global_166);
  }
  v0 = (void *)_block_invoke_na_once_object_1;
  return v0;
}

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = v7;
  id v11 = v8;
  id v12 = v11;
  if (v9)
  {
    id v29 = v11;
    id v30 = v10;
    os_unfair_lock_lock(&v9->_lock);
    BOOL v28 = !v9->_finished;
    if (!v9->_finished)
    {
      objc_storeStrong(&v9->_resultValue, a3);
      objc_storeStrong((id *)&v9->_resultError, a4);
      v9->_finished = 1;
    }
    os_unfair_lock_unlock(&v9->_lock);
    id v13 = v9;
    os_unfair_lock_lock(&v9->_lock);
    id v14 = v13[4];
    id v15 = v13[5];
    id v16 = v13[2];
    uint64_t v17 = (void *)[v13[3] copy];
    id v18 = v13[3];
    id v27 = v13;
    v13[3] = 0;

    os_unfair_lock_unlock(&v9->_lock);
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v36;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v36 != v22) {
            objc_enumerationMutation(v19);
          }
          uint64_t v24 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          v31[0] = MEMORY[0x1E4F143A8];
          v31[1] = 3221225472;
          v31[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v31[3] = &unk_1E6109DF8;
          uint64_t v34 = v24;
          id v32 = v14;
          id v33 = v15;
          objc_msgSend(v16, "performBlock:", v31, v27);
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v35 objects:v39 count:16];
      }
      while (v21);
    }

    id v10 = v30;
    id v12 = v29;
    BOOL v25 = v28;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

uint64_t __54__NAFuture_NAConveniences__futureWithBlock_scheduler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __23__NAFuture_reschedule___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = *(id *)(a1 + 32);
  id v9 = v6;
  id v10 = v7;
  id v11 = v10;
  if (v8)
  {
    id v24 = v10;
    id v25 = v9;
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
    if (!*((unsigned char *)v8 + 12))
    {
      objc_storeStrong((id *)v8 + 4, a2);
      objc_storeStrong((id *)v8 + 5, a3);
      *((unsigned char *)v8 + 12) = 1;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
    id v12 = (id *)v8;
    os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
    id v13 = v12[4];
    id v14 = v12[5];
    id v15 = v12[2];
    id v16 = (void *)[v12[3] copy];
    id v17 = v12[3];
    v12[3] = 0;

    os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v18 = v16;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v31 != v21) {
            objc_enumerationMutation(v18);
          }
          uint64_t v23 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v26[3] = &unk_1E6109DF8;
          uint64_t v29 = v23;
          id v27 = v13;
          id v28 = v14;
          [v15 performBlock:v26];
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v20);
    }

    id v9 = v25;
    id v11 = v24;
  }
}

- (BOOL)isFinished
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_finished;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

void __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = v5;
  id v8 = v7;
  if (!v7)
  {
    if (*(unsigned char *)(a1 + 80)) {
      id v8 = v6;
    }
    else {
      id v8 = 0;
    }
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
  --*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v8)
  {
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    [*(id *)(a1 + 40) setObject:v8 atIndexedSubscript:*(void *)(a1 + 72)];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    if (*(unsigned char *)(v10 + 24)) {
      BOOL v11 = 0;
    }
    else {
      BOOL v11 = v9 == 0;
    }
    if (!v11) {
      goto LABEL_13;
    }
    *(unsigned char *)(v10 + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    id v12 = *(void **)(a1 + 48);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_3;
    v19[3] = &unk_1E61099B8;
    id v20 = *(id *)(a1 + 32);
    id v21 = *(id *)(a1 + 40);
    [v12 performBlock:v19];

    id v13 = v20;
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 64) + 8);
  if (!*(unsigned char *)(v14 + 24))
  {
    *(unsigned char *)(v14 + 24) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
    id v15 = *(void **)(a1 + 48);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__NAFuture_NAConveniences__combineAllFutures_ignoringErrors_scheduler___block_invoke_4;
    v16[3] = &unk_1E61099B8;
    id v17 = *(id *)(a1 + 32);
    id v18 = v6;
    [v15 performBlock:v16];

    id v13 = v17;
    goto LABEL_15;
  }
LABEL_13:
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 8));
LABEL_16:
}

+ (id)futureWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[NAScheduler mainThreadScheduler];
  id v6 = [a1 futureWithBlock:v4 scheduler:v5];

  return v6;
}

+ (id)combineAllFutures:(id)a3
{
  id v4 = a3;
  id v5 = +[NAScheduler mainThreadScheduler];
  id v6 = [a1 combineAllFutures:v4 scheduler:v5];

  return v6;
}

+ (id)combineAllFutures:(id)a3 scheduler:(id)a4
{
  return (id)[a1 combineAllFutures:a3 ignoringErrors:0 scheduler:a4];
}

+ (id)futureWithBlock:(id)a3 scheduler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(NAPromise);
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __54__NAFuture_NAConveniences__futureWithBlock_scheduler___block_invoke;
  id v15 = &unk_1E6109D58;
  id v16 = v7;
  id v17 = v5;
  id v8 = v7;
  id v9 = v5;
  [v6 performBlock:&v12];

  uint64_t v10 = [(NAPromise *)v8 future];

  return v10;
}

- (id)addFailureBlock:(id)a3
{
  id v4 = a3;
  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  uint64_t v19 = __28__NAFuture_addFailureBlock___block_invoke;
  id v20 = &unk_1E6109C48;
  id v5 = v4;
  id v21 = v5;
  id v6 = self;
  id v7 = &v17;
  if (v6)
  {
    [(NAFuture *)v6 willAddCompletionBlock];
    os_unfair_lock_lock(&v6->_lock);
    id v8 = v6->_resultValue;
    id v9 = v6->_resultError;
    uint64_t v10 = v6->_completionScheduler;
    if (v6->_finished)
    {
      os_unfair_lock_unlock(&v6->_lock);
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = ___NAFutureAddCompletionBlock_block_invoke;
      v22[3] = &unk_1E6109DF8;
      id v25 = v7;
      id v23 = v8;
      id v24 = v9;
      [(NAScheduler *)v10 performBlock:v22];
    }
    else
    {
      completionBlocks = v6->_completionBlocks;
      if (!completionBlocks)
      {
        uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v13 = v6->_completionBlocks;
        v6->_completionBlocks = v12;

        completionBlocks = v6->_completionBlocks;
      }
      uint64_t v14 = (void *)[v7 copy];
      [(NSMutableArray *)completionBlocks addObject:v14];

      os_unfair_lock_unlock(&v6->_lock);
    }
    id v15 = v6;
  }
  return v6;
}

+ (id)chainFutures:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = (void *)MEMORY[0x1E4F1CA48];
    id v6 = [v4 reverseObjectEnumerator];
    id v7 = [v6 allObjects];
    id v8 = [v5 arrayWithArray:v7];

    id v9 = [a1 _chainFuturesWithFutureStack:v8];
  }
  else
  {
    id v9 = +[NAFuture futureWithNoResult];
  }

  return v9;
}

+ (id)_chainFuturesWithFutureStack:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 count];
  id v6 = [v4 lastObject];
  id v7 = v6;
  if (v5 < 2)
  {
    id v8 = v6;
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__NAFuture_NAConveniences___chainFuturesWithFutureStack___block_invoke;
    v10[3] = &unk_1E6109DD0;
    id v11 = v4;
    id v12 = a1;
    id v8 = [v7 flatMap:v10];
  }
  return v8;
}

void __46__NAFuture_NAConveniences__futureWithNoResult__block_invoke_2()
{
  id v2 = [MEMORY[0x1E4F1CA98] null];
  uint64_t v0 = +[NAFuture futureWithResult:v2];
  v1 = (void *)_block_invoke_na_once_object_1;
  _block_invoke_na_once_object_1 = v0;
}

void __45__NAFuture_errorOnlyCompletionHandlerAdapter__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  unint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    id v6 = v5;
    id v7 = v4;
    id v8 = v7;
    if (v6)
    {
      id v38 = v7;
      id v9 = (os_unfair_lock_s *)(v6 + 8);
      os_unfair_lock_lock((os_unfair_lock_t)v6 + 2);
      if (!v6[12])
      {
        uint64_t v10 = (void *)*((void *)v6 + 4);
        *((void *)v6 + 4) = 0;

        objc_storeStrong((id *)v6 + 5, a2);
        v6[12] = 1;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v6 + 2);
      id v39 = v6;
      id v11 = v6;
      os_unfair_lock_lock(v9);
      id v12 = v11[4];
      id v13 = v11[5];
      id v14 = v11[2];
      id v15 = (void *)[v11[3] copy];
      id v16 = v11[3];
      v11[3] = 0;

      os_unfair_lock_unlock(v9);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v17 = v15;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v49 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            uint64_t v41 = MEMORY[0x1E4F143A8];
            uint64_t v42 = 3221225472;
            long long v43 = ___NAFutureFlushCompletionBlocks_block_invoke;
            long long v44 = &unk_1E6109DF8;
            uint64_t v47 = v22;
            id v45 = v12;
            id v46 = v13;
            [v14 performBlock:&v41];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v19);
      }

      id v6 = v39;
      id v8 = v38;
    }
  }
  else
  {
    id v23 = [MEMORY[0x1E4F1CA98] null];
    id v8 = v5;
    id v24 = v23;
    id v6 = v24;
    if (v8)
    {
      uint64_t v40 = v24;
      os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
      if (!*((unsigned char *)v8 + 12))
      {
        objc_storeStrong((id *)v8 + 4, v23);
        id v25 = (void *)*((void *)v8 + 5);
        *((void *)v8 + 5) = 0;

        *((unsigned char *)v8 + 12) = 1;
      }
      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
      id v26 = (id *)v8;
      os_unfair_lock_lock((os_unfair_lock_t)v8 + 2);
      id v27 = v26[4];
      id v28 = v26[5];
      id v29 = v26[2];
      long long v30 = (void *)[v26[3] copy];
      id v31 = v26[3];
      v26[3] = 0;

      os_unfair_lock_unlock((os_unfair_lock_t)v8 + 2);
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v32 = v30;
      uint64_t v33 = [v32 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v33)
      {
        uint64_t v34 = v33;
        uint64_t v35 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v34; ++j)
          {
            if (*(void *)v49 != v35) {
              objc_enumerationMutation(v32);
            }
            uint64_t v37 = *(void *)(*((void *)&v48 + 1) + 8 * j);
            uint64_t v41 = MEMORY[0x1E4F143A8];
            uint64_t v42 = 3221225472;
            long long v43 = ___NAFutureFlushCompletionBlocks_block_invoke;
            long long v44 = &unk_1E6109DF8;
            uint64_t v47 = v37;
            id v45 = v27;
            id v46 = v28;
            [v29 performBlock:&v41];
          }
          uint64_t v34 = [v32 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v34);
      }

      id v6 = v40;
    }
  }
}

- (BOOL)finishWithNoResult
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA98] null];
  id v4 = self;
  id v5 = v3;
  id v6 = v5;
  if (v4)
  {
    id v24 = v5;
    p_lock = &v4->_lock;
    os_unfair_lock_lock(&v4->_lock);
    BOOL v23 = !v4->_finished;
    if (!v4->_finished)
    {
      objc_storeStrong(&v4->_resultValue, v3);
      resultError = v4->_resultError;
      v4->_resultError = 0;

      v4->_finished = 1;
    }
    os_unfair_lock_unlock(&v4->_lock);
    id v25 = v4;
    id v9 = v4;
    os_unfair_lock_lock(p_lock);
    id v10 = v9[4];
    id v11 = v9[5];
    id v12 = v9[2];
    id v13 = (void *)[v9[3] copy];
    id v14 = v9[3];
    v9[3] = 0;

    os_unfair_lock_unlock(p_lock);
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v15 = v13;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v31 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v26[3] = &unk_1E6109DF8;
          uint64_t v29 = v20;
          id v27 = v10;
          id v28 = v11;
          [v12 performBlock:v26];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v17);
    }

    id v6 = v24;
    id v4 = v25;
    BOOL v21 = v23;
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (id)recoverIgnoringError
{
  return [(NAFuture *)self recover:&__block_literal_global_3];
}

+ (id)futureWithError:(id)a3
{
  id v3 = a3;
  id v4 = [[NAFuture alloc] initWithResult:0 error:v3];

  return v4;
}

- (BOOL)cancel
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  BOOL finished = self->_finished;
  if (self->_finished)
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    BOOL v21 = self->_finished;
    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    resultError = self->_resultError;
    self->_resultError = v5;

    self->_BOOL finished = 1;
    os_unfair_lock_unlock(p_lock);
    id v7 = self;
    os_unfair_lock_lock(p_lock);
    id v8 = v7->_resultValue;
    id v9 = self->_resultError;
    id v10 = v7->_completionScheduler;
    id v11 = (void *)[(NSMutableArray *)v7->_completionBlocks copy];
    completionBlocks = v7->_completionBlocks;
    uint64_t v20 = v7;
    v7->_completionBlocks = 0;

    os_unfair_lock_unlock(p_lock);
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v11;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          v22[0] = MEMORY[0x1E4F143A8];
          v22[1] = 3221225472;
          v22[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v22[3] = &unk_1E6109DF8;
          uint64_t v25 = v18;
          id v23 = v8;
          id v24 = v9;
          [(NAScheduler *)v10 performBlock:v22];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }

    [(NAFuture *)v20 didCancel];
    BOOL finished = v21;
  }
  return !finished;
}

- (id)reschedule:(id)a3
{
  id v5 = a3;
  id v6 = objc_alloc_init(NAFuture);
  objc_storeStrong((id *)&v6->_completionScheduler, a3);
  id v7 = +[NAFuture _descriptorForChainOperation:@"reschedule" onFuture:self withBlock:0];
  [(NAFuture *)v6 setDescriptor:v7];

  uint64_t v20 = MEMORY[0x1E4F143A8];
  uint64_t v21 = 3221225472;
  uint64_t v22 = __23__NAFuture_reschedule___block_invoke;
  id v23 = &unk_1E6109BF8;
  id v8 = v6;
  id v24 = v8;
  id v9 = self;
  id v10 = &v20;
  if (v9)
  {
    [(NAFuture *)v9 willAddCompletionBlock];
    os_unfair_lock_lock(&v9->_lock);
    id v11 = v9->_resultValue;
    id v12 = v9->_resultError;
    id v13 = v9->_completionScheduler;
    if (v9->_finished)
    {
      os_unfair_lock_unlock(&v9->_lock);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = ___NAFutureAddCompletionBlock_block_invoke;
      void v25[3] = &unk_1E6109DF8;
      long long v28 = v10;
      id v26 = v11;
      long long v27 = v12;
      [(NAScheduler *)v13 performBlock:v25];
    }
    else
    {
      completionBlocks = v9->_completionBlocks;
      if (!completionBlocks)
      {
        uint64_t v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
        uint64_t v16 = v9->_completionBlocks;
        v9->_completionBlocks = v15;

        completionBlocks = v9->_completionBlocks;
      }
      uint64_t v17 = (void *)[v10 copy];
      [(NSMutableArray *)completionBlocks addObject:v17];

      os_unfair_lock_unlock(&v9->_lock);
    }
    uint64_t v18 = v9;
  }
  return v8;
}

- (id)errorOnlyCompletionHandlerAdapter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __45__NAFuture_errorOnlyCompletionHandlerAdapter__block_invoke;
  v4[3] = &unk_1E6109C20;
  v4[4] = self;
  id v2 = (void *)MEMORY[0x1BA99CF00](v4, a2);
  return v2;
}

+ (void)_setShouldEnforceThreadSafety:(BOOL)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  __enforceThreadSafety = a3;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = __enforceThreadSafety;
    _os_log_impl(&dword_1B561D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Updating NAFuture thread safety enabled: %d", (uint8_t *)v3, 8u);
  }
}

- (BOOL)isCancelled
{
  id v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NAFuture *)v2 _queue_isCancelled];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (BOOL)_queue_isCancelled
{
  return self->_finished && [(NSError *)self->_resultError na_isCancelledError];
}

- (BOOL)finishWithError:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = self;
  id v7 = v5;
  id v8 = v7;
  if (v6)
  {
    id v26 = v7;
    p_lock = &v6->_lock;
    os_unfair_lock_lock(&v6->_lock);
    BOOL v25 = !v6->_finished;
    if (!v6->_finished)
    {
      id resultValue = v6->_resultValue;
      v6->_id resultValue = 0;

      objc_storeStrong((id *)&v6->_resultError, a3);
      v6->_BOOL finished = 1;
    }
    os_unfair_lock_unlock(&v6->_lock);
    long long v27 = v6;
    id v11 = v6;
    os_unfair_lock_lock(p_lock);
    id v12 = v11[4];
    id v13 = v11[5];
    id v14 = v11[2];
    uint64_t v15 = (void *)[v11[3] copy];
    id v16 = v11[3];
    v11[3] = 0;

    os_unfair_lock_unlock(p_lock);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v17 = v15;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v33 != v20) {
            objc_enumerationMutation(v17);
          }
          uint64_t v22 = *(void *)(*((void *)&v32 + 1) + 8 * i);
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          v28[2] = ___NAFutureFlushCompletionBlocks_block_invoke;
          v28[3] = &unk_1E6109DF8;
          uint64_t v31 = v22;
          id v29 = v12;
          id v30 = v13;
          [v14 performBlock:v28];
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v19);
    }

    id v8 = v26;
    id v6 = v27;
    BOOL v23 = v25;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (NSString)description
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_resultValue;
  id v5 = self->_resultError;
  BOOL finished = self->_finished;
  BOOL v7 = [(NAFuture *)self _queue_isCancelled];
  os_unfair_lock_unlock(p_lock);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __23__NAFuture_description__block_invoke;
  v23[3] = &unk_1E6109CC0;
  BOOL v25 = v7;
  BOOL v26 = finished;
  id v8 = v4;
  id v24 = v8;
  id v9 = __23__NAFuture_description__block_invoke((uint64_t)v23);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __23__NAFuture_description__block_invoke_2;
  v22[3] = &unk_1E6109CE8;
  void v22[4] = self;
  id v10 = __23__NAFuture_description__block_invoke_2((uint64_t)v22);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __23__NAFuture_description__block_invoke_3;
  uint64_t v19 = &unk_1E6109D10;
  id v20 = v8;
  uint64_t v21 = v5;
  id v11 = v5;
  id v12 = v8;
  id v13 = __23__NAFuture_description__block_invoke_3((uint64_t)&v16);
  id v14 = [NSString stringWithFormat:@"<%@ %p (%@)%@%@>", objc_opt_class(), self, v9, v10, v13, v16, v17, v18, v19];

  return (NSString *)v14;
}

__CFString *__23__NAFuture_description__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    v1 = @"canceled";
  }
  else if (*(unsigned char *)(a1 + 41))
  {
    if (*(void *)(a1 + 32)) {
      id v2 = @"succeeded";
    }
    else {
      id v2 = @"failed";
    }
    v1 = v2;
  }
  else
  {
    v1 = @"active";
  }
  return v1;
}

__CFString *__23__NAFuture_description__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) descriptor];

  if (v2)
  {
    id v3 = NSString;
    id v4 = [*(id *)(a1 + 32) descriptor];
    id v5 = [v3 stringWithFormat:@": \"%@\"", v4];
  }
  else
  {
    id v5 = &stru_1F0E49DB0;
  }
  return v5;
}

__CFString *__23__NAFuture_description__block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {
    [NSString stringWithFormat:@", result = %@", v1];
LABEL_5:
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2)
  {
    [NSString stringWithFormat:@", error = %@", v2];
    goto LABEL_5;
  }
  id v3 = &stru_1F0E49DB0;
LABEL_6:
  return v3;
}

- (NSString)descriptor
{
  return self->_descriptor;
}

NAFuture *__48__NAFuture_NAConveniences__recoverIgnoringError__block_invoke()
{
  return +[NAFuture futureWithNoResult];
}

+ (id)lazyFutureWithBlock:(id)a3
{
  id v4 = a3;
  id v5 = +[NAScheduler mainThreadScheduler];
  id v6 = [a1 lazyFutureWithBlock:v4 scheduler:v5];

  return v6;
}

+ (id)lazyFutureWithBlock:(id)a3 scheduler:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [[_NALazyFuture alloc] initWithBlock:v6 scheduler:v5];

  return v7;
}

uint64_t __57__NAFuture_NAConveniences___chainFuturesWithFutureStack___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) removeLastObject];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _chainFuturesWithFutureStack:v3];
}

+ (id)futureWithCompletionHandlerAdapterBlock:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  id v4 = objc_alloc_init(NAFuture);
  id v5 = [(NAFuture *)v4 completionHandlerAdapter];
  v3[2](v3, v5);

  return v4;
}

+ (id)futureWithErrorOnlyHandlerAdapterBlock:(id)a3
{
  uint64_t v3 = (void (**)(id, void *))a3;
  id v4 = objc_alloc_init(NAFuture);
  id v5 = [(NAFuture *)v4 errorOnlyCompletionHandlerAdapter];
  v3[2](v3, v5);

  return v4;
}

@end