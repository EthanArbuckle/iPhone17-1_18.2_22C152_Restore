@interface _PKPendingEnhancedMerchantNearbyLocationSearch
- (BOOL)isInProgress;
- (BOOL)isInTerminalState;
- (NSError)error;
- (PKAccountEnhancedMerchant)merchant;
- (_PKPendingEnhancedMerchantNearbyLocationSearch)initWithMerchant:(id)a3;
- (unint64_t)state;
- (void)_callCompletionHandlers;
- (void)_updateState:(unint64_t)a3 error:(id)a4;
- (void)addCompletionHandler:(id)a3;
- (void)cancel;
- (void)didCompleteSuccessfully;
- (void)didFailWithError:(id)a3;
- (void)didStart;
- (void)setError:(id)a3;
@end

@implementation _PKPendingEnhancedMerchantNearbyLocationSearch

- (_PKPendingEnhancedMerchantNearbyLocationSearch)initWithMerchant:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_PKPendingEnhancedMerchantNearbyLocationSearch;
  v6 = [(_PKPendingEnhancedMerchantNearbyLocationSearch *)&v11 init];
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_merchant, a3);
    v7->_state = 0;
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionHandlers = v7->_completionHandlers;
    v7->_completionHandlers = v8;
  }
  return v7;
}

- (unint64_t)state
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t state = self->_state;
  os_unfair_lock_unlock(p_lock);
  return state;
}

- (BOOL)isInProgress
{
  return [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self state] == 1;
}

- (BOOL)isInTerminalState
{
  return [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self state] - 2 < 3;
}

- (void)didStart
{
}

- (void)didCompleteSuccessfully
{
}

- (void)didFailWithError:(id)a3
{
}

- (void)cancel
{
}

- (void)addCompletionHandler:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self isInTerminalState];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (v5)
  {
    v7 = self->_error;
    os_unfair_lock_unlock(p_lock);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71___PKPendingEnhancedMerchantNearbyLocationSearch_addCompletionHandler___block_invoke;
    v11[3] = &unk_1E59CAD68;
    v12 = v7;
    id v13 = v4;
    v8 = v7;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
  else
  {
    completionHandlers = self->_completionHandlers;
    v10 = _Block_copy(v4);
    [(NSMutableArray *)completionHandlers addObject:v10];

    os_unfair_lock_unlock(p_lock);
  }
}

- (void)_updateState:(unint64_t)a3 error:(id)a4
{
  v6 = (NSError *)a4;
  os_unfair_lock_lock(&self->_lock);
  self->_unint64_t state = a3;
  error = self->_error;
  self->_error = v6;

  os_unfair_lock_unlock(&self->_lock);
  if ([(_PKPendingEnhancedMerchantNearbyLocationSearch *)self isInTerminalState])
  {
    [(_PKPendingEnhancedMerchantNearbyLocationSearch *)self _callCompletionHandlers];
  }
}

- (void)_callCompletionHandlers
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_error;
  BOOL v5 = (void *)[(NSMutableArray *)self->_completionHandlers copy];
  [(NSMutableArray *)self->_completionHandlers removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    v10 = MEMORY[0x1E4F14428];
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v16 + 1) + 8 * v11);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __73___PKPendingEnhancedMerchantNearbyLocationSearch__callCompletionHandlers__block_invoke;
        v13[3] = &unk_1E59CAD68;
        uint64_t v15 = v12;
        v14 = v4;
        dispatch_async(v10, v13);

        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (PKAccountEnhancedMerchant)merchant
{
  return self->_merchant;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_merchant, 0);

  objc_storeStrong((id *)&self->_completionHandlers, 0);
}

@end