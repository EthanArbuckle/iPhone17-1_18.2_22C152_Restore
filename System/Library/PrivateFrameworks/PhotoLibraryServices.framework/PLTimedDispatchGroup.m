@interface PLTimedDispatchGroup
- (PLTimedDispatchGroup)initWithQueue:(id)a3 name:(id)a4;
- (PLTimedDispatchGroup)initWithQueue:(id)a3 name:(id)a4 defaultTimeout:(double)a5;
- (id)defaultPreferredResult;
- (id)description;
- (id)enterWithName:(id)a3;
- (id)enterWithTimeout:(double)a3 name:(id)a4;
- (void)notify:(id)a3;
@end

@implementation PLTimedDispatchGroup

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_lock_sessions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

- (void)notify:(id)a3
{
  id v4 = a3;
  id v5 = +[PLConcurrencyLimiter sharedLimiter];
  [v5 groupNotify:self->_group queue:self->_queue block:v4];
}

- (id)defaultPreferredResult
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __46__PLTimedDispatchGroup_defaultPreferredResult__block_invoke;
  v25 = &unk_1E5870538;
  v26 = self;
  v2 = PLSafeResultWithUnfairLock();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v27 count:16];
  if (!v3) {
    goto LABEL_20;
  }
  uint64_t v4 = v3;
  id v5 = 0;
  v6 = 0;
  uint64_t v7 = *(void *)v19;
  do
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      if (*(void *)v19 != v7) {
        objc_enumerationMutation(v2);
      }
      v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      if ([v9 didTimeout])
      {
        if (!v6)
        {
          v6 = [v9 result];
        }
      }
      else
      {
        v10 = [v9 result];
        int v11 = [v10 isFailure];

        if (v11) {
          BOOL v12 = v5 == 0;
        }
        else {
          BOOL v12 = 0;
        }
        if (v12)
        {
          id v5 = [v9 result];
        }
      }
    }
    uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v27 count:16];
  }
  while (v4);
  v13 = v5;
  if (v5 || (v13 = v6) != 0)
  {
    id v14 = v13;
  }
  else
  {
LABEL_20:
    v15 = (void *)MEMORY[0x1E4F8B9B8];
    v16 = [MEMORY[0x1E4F1CA98] null];
    id v14 = [v15 successWithResult:v16];

    id v5 = 0;
    v6 = 0;
  }

  return v14;
}

id __46__PLTimedDispatchGroup_defaultPreferredResult__block_invoke(uint64_t a1)
{
  return *(id *)(*(void *)(a1 + 32) + 32);
}

- (id)enterWithTimeout:(double)a3 name:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [[PLTimedDispatchGroupEnterSession alloc] initWithGroup:self->_group queue:self->_queue timeout:v6 name:a3];

  [(PLTimedDispatchGroupEnterSession *)v7 enter];
  v10 = v7;
  PLSafeRunWithUnfairLock();
  v8 = v10;

  return v8;
}

uint64_t __46__PLTimedDispatchGroup_enterWithTimeout_name___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) addObject:*(void *)(a1 + 40)];
}

- (id)enterWithName:(id)a3
{
  return [(PLTimedDispatchGroup *)self enterWithTimeout:a3 name:self->_defaultTimeout];
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@ %p> %@", v5, self, self->_name];

  return v6;
}

- (PLTimedDispatchGroup)initWithQueue:(id)a3 name:(id)a4 defaultTimeout:(double)a5
{
  id v9 = a3;
  id v10 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PLTimedDispatchGroup;
  int v11 = [(PLTimedDispatchGroup *)&v19 init];
  if (v11)
  {
    dispatch_group_t v12 = dispatch_group_create();
    group = v11->_group;
    v11->_group = (OS_dispatch_group *)v12;

    objc_storeStrong((id *)&v11->_queue, a3);
    v11->_lock._os_unfair_lock_opaque = 0;
    id v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    lock_sessions = v11->_lock_sessions;
    v11->_lock_sessions = v14;

    uint64_t v16 = [v10 copy];
    name = v11->_name;
    v11->_name = (NSString *)v16;

    v11->_defaultTimeout = a5;
  }

  return v11;
}

- (PLTimedDispatchGroup)initWithQueue:(id)a3 name:(id)a4
{
  return [(PLTimedDispatchGroup *)self initWithQueue:a3 name:a4 defaultTimeout:0.0];
}

@end