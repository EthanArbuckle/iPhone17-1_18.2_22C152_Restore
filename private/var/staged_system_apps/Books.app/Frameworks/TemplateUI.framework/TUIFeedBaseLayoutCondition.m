@interface TUIFeedBaseLayoutCondition
- (TUIFeedBaseLayoutCondition)initWithCompletion:(id)a3;
- (void)completed;
- (void)dealloc;
- (void)invalidate;
- (void)onInvalidate:(id)a3;
@end

@implementation TUIFeedBaseLayoutCondition

- (TUIFeedBaseLayoutCondition)initWithCompletion:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TUIFeedBaseLayoutCondition;
  v5 = [(TUIFeedBaseLayoutCondition *)&v10 init];
  v6 = v5;
  if (v5)
  {
    v5->_lock._os_unfair_lock_opaque = 0;
    *(unsigned char *)&v5->_state &= ~1u;
    id v7 = [v4 copy];
    id completion = v6->_completion;
    v6->_id completion = v7;
  }
  return v6;
}

- (void)dealloc
{
  [(TUIFeedBaseLayoutCondition *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)TUIFeedBaseLayoutCondition;
  [(TUIFeedBaseLayoutCondition *)&v3 dealloc];
}

- (void)onInvalidate:(id)a3
{
  id v4 = (void (**)(void))a3;
  if (v4)
  {
    objc_super v10 = v4;
    p_lock = &self->_lock;
    os_unfair_lock_lock_with_options();
    if (*(unsigned char *)&self->_state)
    {
      os_unfair_lock_unlock(&self->_lock);
      v10[2]();
    }
    else
    {
      onInvalidateBlocks = self->_onInvalidateBlocks;
      if (!onInvalidateBlocks)
      {
        id v7 = (NSMutableArray *)objc_opt_new();
        v8 = self->_onInvalidateBlocks;
        self->_onInvalidateBlocks = v7;

        onInvalidateBlocks = self->_onInvalidateBlocks;
      }
      v9 = objc_retainBlock(v10);
      [(NSMutableArray *)onInvalidateBlocks addObject:v9];

      os_unfair_lock_unlock(p_lock);
    }
    id v4 = v10;
  }
}

- (void)invalidate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (*(unsigned char *)&self->_state)
  {
    os_unfair_lock_unlock(p_lock);
    goto LABEL_12;
  }
  id v4 = self->_onInvalidateBlocks;
  onInvalidateBlocks = self->_onInvalidateBlocks;
  self->_onInvalidateBlocks = 0;

  *(unsigned char *)&self->_state |= 1u;
  os_unfair_lock_unlock(p_lock);
  if (!v4)
  {
LABEL_12:
    v6 = 0;
    goto LABEL_13;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = v4;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      objc_super v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10) + 16))(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10));
        objc_super v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

LABEL_13:
  [(TUIFeedBaseLayoutCondition *)self completed];
}

- (void)completed
{
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  id v6 = objc_retainBlock(self->_completion);
  id completion = self->_completion;
  self->_id completion = 0;

  os_unfair_lock_unlock(p_lock);
  v5 = v6;
  if (v6)
  {
    (*((void (**)(id))v6 + 2))(v6);
    v5 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onInvalidateBlocks, 0);

  objc_storeStrong(&self->_completion, 0);
}

@end