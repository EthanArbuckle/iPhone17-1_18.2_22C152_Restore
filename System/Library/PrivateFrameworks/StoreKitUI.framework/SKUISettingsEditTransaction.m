@interface SKUISettingsEditTransaction
- (BOOL)isCommiting;
- (BOOL)isValid;
- (SKUISettingsEditTransaction)initWithSettingDescriptions:(id)a3;
- (SKUISettingsEditTransactionDelegate)delegate;
- (void)_delegateDidCompleteTransaction;
- (void)_delegateDidFailTransaction;
- (void)_delegateWillBeginTransaction;
- (void)_delegateWillCommitTransaction;
- (void)_finalizeCommit;
- (void)_settingDescription:(id)a3 completedWithSuccess:(BOOL)a4;
- (void)beginTransaction;
- (void)cancelTransaction;
- (void)commitTransaction;
- (void)rollbackTransaction;
- (void)setDelegate:(id)a3;
@end

@implementation SKUISettingsEditTransaction

- (SKUISettingsEditTransaction)initWithSettingDescriptions:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingsEditTransaction initWithSettingDescriptions:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUISettingsEditTransaction;
  v5 = [(SKUISettingsEditTransaction *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    all = v5->_all;
    v5->_all = (NSSet *)v6;

    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v5->_lock;
    v5->_lock = v8;

    [(NSLock *)v5->_lock setName:@"com.apple.StoreKit.settingsEditTransaction"];
  }

  return v5;
}

- (void)beginTransaction
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_all;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "beginEditing", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(SKUISettingsEditTransaction *)self _delegateWillBeginTransaction];
}

- (void)cancelTransaction
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_all;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "cancelEdits", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSLock *)self->_lock lock];
  pending = self->_pending;
  self->_pending = 0;

  [(NSLock *)self->_lock unlock];
  [(SKUISettingsEditTransaction *)self _delegateDidFailTransaction];
}

- (void)commitTransaction
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  [(SKUISettingsEditTransaction *)self _delegateWillCommitTransaction];
  v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
  pending = self->_pending;
  self->_pending = v3;

  self->_success = 1;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = self->_all;
  uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        long long v9 = *(void **)(*((void *)&v12 + 1) + 8 * v8);
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __48__SKUISettingsEditTransaction_commitTransaction__block_invoke;
        v10[3] = &unk_1E64295F0;
        objc_copyWeak(&v11, &location);
        v10[4] = v9;
        if ([v9 commitEdits:v10])
        {
          [(NSLock *)self->_lock lock];
          [(NSMutableSet *)self->_pending addObject:v9];
          [(NSLock *)self->_lock unlock];
        }
        objc_destroyWeak(&v11);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSSet *)v5 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  objc_destroyWeak(&location);
}

void __48__SKUISettingsEditTransaction_commitTransaction__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _settingDescription:*(void *)(a1 + 32) completedWithSuccess:a2];
}

- (BOOL)isCommiting
{
  [(NSLock *)self->_lock lock];
  pending = self->_pending;
  if (pending) {
    BOOL v4 = [(NSMutableSet *)pending count] != 0;
  }
  else {
    BOOL v4 = 0;
  }
  [(NSLock *)self->_lock unlock];
  return v4;
}

- (BOOL)isValid
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_all;
  uint64_t v3 = [(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "editsValid", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSSet *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)rollbackTransaction
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = self->_all;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v7++), "discardEdits", (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSLock *)self->_lock lock];
  pending = self->_pending;
  self->_pending = 0;

  [(NSLock *)self->_lock unlock];
  [(SKUISettingsEditTransaction *)self _delegateDidCompleteTransaction];
}

- (void)_delegateDidCompleteTransaction
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 settingsEditTransactionDidCompleteTransaction:self];
    }
  }
}

- (void)_delegateDidFailTransaction
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 settingsEditTransactionDidFailTransaction:self];
    }
  }
}

- (void)_delegateWillBeginTransaction
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 settingsEditTransactionWillBeginTransaction:self];
    }
  }
}

- (void)_delegateWillCommitTransaction
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      [v8 settingsEditTransactionWillCommitTransaction:self];
    }
  }
}

- (void)_finalizeCommit
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__SKUISettingsEditTransaction__finalizeCommit__block_invoke;
  block[3] = &unk_1E6422020;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __46__SKUISettingsEditTransaction__finalizeCommit__block_invoke(uint64_t a1)
{
  v1 = *(unsigned char **)(a1 + 32);
  if (v1[40]) {
    return [v1 _delegateDidCompleteTransaction];
  }
  else {
    return [v1 _delegateDidFailTransaction];
  }
}

- (void)_settingDescription:(id)a3 completedWithSuccess:(BOOL)a4
{
  lock = self->_lock;
  id v7 = a3;
  [(NSLock *)lock lock];
  BOOL v8 = self->_success && a4;
  self->_success = v8;
  [(NSMutableSet *)self->_pending removeObject:v7];

  uint64_t v9 = [(NSMutableSet *)self->_pending count];
  [(NSLock *)self->_lock unlock];
  if (!v9)
  {
    [(SKUISettingsEditTransaction *)self _finalizeCommit];
  }
}

- (SKUISettingsEditTransactionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SKUISettingsEditTransactionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pending, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong(&self->_commitBlock, 0);

  objc_storeStrong((id *)&self->_all, 0);
}

- (void)initWithSettingDescriptions:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISettingsEditTransaction initWithSettingDescriptions:]";
}

@end