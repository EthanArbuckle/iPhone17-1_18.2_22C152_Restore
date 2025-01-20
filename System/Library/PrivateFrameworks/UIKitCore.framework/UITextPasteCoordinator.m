@interface UITextPasteCoordinator
- (BOOL)performBlockingWait:(double)a3;
- (UITextPasteCoordinator)initWithDelegate:(id)a3;
- (UITextPasteCoordinatorDelegate)delegate;
- (void)_determineFinished;
- (void)_finish;
- (void)addItem:(id)a3;
- (void)setResult:(id)a3 forItem:(id)a4;
@end

@implementation UITextPasteCoordinator

- (UITextPasteCoordinator)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UITextPasteCoordinator;
  v5 = [(UITextPasteCoordinator *)&v11 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v7 = objc_opt_new();
    items = v6->_items;
    v6->_items = (NSMutableArray *)v7;

    wait = v6->_wait;
    v6->_wait = 0;
  }
  return v6;
}

- (void)addItem:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    v5 = self->_items;
    objc_sync_enter(v5);
    [(NSMutableArray *)self->_items addObject:v6];
    objc_sync_exit(v5);

    id v4 = v6;
  }
}

- (void)setResult:(id)a3 forItem:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (v6)
  {
    uint64_t v7 = self->_items;
    objc_sync_enter(v7);
    uint64_t v8 = [(NSMutableArray *)self->_items indexOfObject:v6];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_sync_exit(v7);
    }
    else
    {
      v9 = v10;
      if (!v10)
      {
        v9 = [MEMORY[0x1E4F1CA98] null];
      }
      [(NSMutableArray *)self->_items setObject:v9 atIndexedSubscript:v8];
      if (!v10) {

      }
      objc_sync_exit(v7);
      [(UITextPasteCoordinator *)self _determineFinished];
    }
  }
}

- (BOOL)performBlockingWait:(double)a3
{
  wait = self->_wait;
  if (!wait)
  {
    id v6 = (OS_dispatch_group *)dispatch_group_create();
    uint64_t v7 = self->_wait;
    self->_wait = v6;

    dispatch_group_enter((dispatch_group_t)self->_wait);
    wait = self->_wait;
  }
  dispatch_time_t v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  intptr_t v9 = dispatch_group_wait(wait, v8);
  if (v9)
  {
    id v10 = self->_wait;
    self->_wait = 0;
  }
  else
  {
    [(UITextPasteCoordinator *)self _finish];
  }
  return v9 == 0;
}

- (void)_determineFinished
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = self->_items;
  objc_sync_enter(v3);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = self->_items;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            objc_sync_exit(v3);
            goto LABEL_14;
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }

  objc_sync_exit(v3);
  dispatch_time_t v8 = self->_wait;
  if (v8)
  {
    v3 = (NSMutableArray *)v8;
    wait = self->_wait;
    self->_wait = 0;

    dispatch_group_leave(&v3->super.super);
  }
  else
  {
    [(UITextPasteCoordinator *)self _finish];
    v3 = 0;
  }
LABEL_14:
}

- (void)_finish
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = self->_items;
  objc_sync_enter(v3);
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_items, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = self->_items;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v4, "addObject:", v9, (void)v11);
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  objc_sync_exit(v3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained coordinator:self endPastingItems:v4];
}

- (UITextPasteCoordinatorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (UITextPasteCoordinatorDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_wait, 0);
  objc_storeStrong((id *)&self->_items, 0);
}

@end