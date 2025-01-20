@interface NAPromise
- (BOOL)finishWithError:(id)a3;
- (BOOL)finishWithNoResult;
- (BOOL)finishWithResult:(id)a3;
- (BOOL)finishWithResult:(id)a3 error:(id)a4;
- (NAFuture)future;
- (NAPromise)init;
- (NAPromise)initWithFuture:(id)a3;
- (NSString)descriptor;
- (id)completionHandlerAdapter;
- (id)errorOnlyCompletionHandlerAdapter;
- (void)setDescriptor:(id)a3;
@end

@implementation NAPromise

- (BOOL)finishWithResult:(id)a3 error:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = self->_future;
  id v10 = v7;
  id v11 = v8;
  v12 = v11;
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
    v13 = v9;
    os_unfair_lock_lock(&v9->_lock);
    id v14 = v13[4];
    id v15 = v13[5];
    id v16 = v13[2];
    v17 = (void *)[v13[3] copy];
    id v18 = v13[3];
    v27 = v13;
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
    v12 = v29;
    BOOL v25 = v28;
  }
  else
  {
    BOOL v25 = 0;
  }

  return v25;
}

- (NAPromise)init
{
  v3 = objc_alloc_init(NAFuture);
  v4 = [(NAPromise *)self initWithFuture:v3];

  return v4;
}

- (NAPromise)initWithFuture:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NAPromise;
  v6 = [(NAPromise *)&v9 init];
  id v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_future, a3);
  }

  return v7;
}

- (NAFuture)future
{
  return (NAFuture *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

- (BOOL)finishWithResult:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self->_future;
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
    v27 = v6;
    id v11 = v6;
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
    v6 = v27;
    BOOL v23 = v25;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (id)completionHandlerAdapter
{
  return [(NAFuture *)self->_future completionHandlerAdapter];
}

- (NSString)descriptor
{
  return [(NAFuture *)self->_future descriptor];
}

- (void)setDescriptor:(id)a3
{
}

- (BOOL)finishWithError:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = self->_future;
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
      v6->_finished = 1;
    }
    os_unfair_lock_unlock(&v6->_lock);
    v27 = v6;
    id v11 = v6;
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
    v6 = v27;
    BOOL v23 = v25;
  }
  else
  {
    BOOL v23 = 0;
  }

  return v23;
}

- (BOOL)finishWithNoResult
{
  return [(NAFuture *)self->_future finishWithNoResult];
}

- (id)errorOnlyCompletionHandlerAdapter
{
  return [(NAFuture *)self->_future errorOnlyCompletionHandlerAdapter];
}

@end