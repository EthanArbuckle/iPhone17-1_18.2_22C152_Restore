@interface TSKPopoverUndoObserver
+ (id)sharedObserver;
- (NSUndoManager)observedUndoManager;
- (TSKPopoverUndoObserver)init;
- (void)addPopoverBasedViewController:(id)a3;
- (void)addPopoverController:(id)a3;
- (void)dealloc;
- (void)removePopoverBasedViewController:(id)a3;
- (void)removePopoverController:(id)a3;
- (void)setObservedUndoManager:(id)a3;
- (void)undoManagerWillRedo:(id)a3;
- (void)undoManagerWillUndo:(id)a3;
@end

@implementation TSKPopoverUndoObserver

- (TSKPopoverUndoObserver)init
{
  v4.receiver = self;
  v4.super_class = (Class)TSKPopoverUndoObserver;
  v2 = [(TSKPopoverUndoObserver *)&v4 init];
  if (v2)
  {
    v2->mPopoverBasedViewControllers = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    v2->mPopoverControllers = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
  }
  return v2;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)TSKPopoverUndoObserver;
  [(TSKPopoverUndoObserver *)&v3 dealloc];
}

+ (id)sharedObserver
{
  if (sharedObserver_once != -1) {
    dispatch_once(&sharedObserver_once, &__block_literal_global_16);
  }
  return (id)sharedObserver_s_undoObserver;
}

TSKPopoverUndoObserver *__40__TSKPopoverUndoObserver_sharedObserver__block_invoke()
{
  result = objc_alloc_init(TSKPopoverUndoObserver);
  sharedObserver_s_undoObserver = (uint64_t)result;
  return result;
}

- (void)setObservedUndoManager:(id)a3
{
  mUndoManager = self->mUndoManager;
  if (a3)
  {
    if (!mUndoManager) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  if (!mUndoManager)
  {
LABEL_3:
    v6 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
    uint64_t v7 = [NSString stringWithUTF8String:"-[TSKPopoverUndoObserver setObservedUndoManager:]"];
    [v6 handleFailureInFunction:v7, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKPopoverUndoObserver.m"), 50, @"In [TSKPopoverUndoObserver setObservedUndoManager:] mUndoManager must be nil when setting a non-nil undoManager, and non-nil when setting a nil undoManager." file lineNumber description];
  }
LABEL_4:
  v8 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  v9 = v8;
  v10 = (void *)MEMORY[0x263F08650];
  v11 = (uint64_t *)MEMORY[0x263F08648];
  if (self->mUndoManager)
  {
    objc_msgSend(v8, "removeObserver:name:object:", self, *MEMORY[0x263F08650]);
    [v9 removeObserver:self name:*v11 object:self->mUndoManager];
    v12 = self->mUndoManager;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;
  v14 = (NSUndoManager *)a3;
  self->mUndoManager = v14;
  if (v14)
  {
    [v9 addObserver:self selector:sel_undoManagerWillUndo_ name:*v10 object:v14];
    uint64_t v15 = *v11;
    v16 = self->mUndoManager;
    [v9 addObserver:self selector:sel_undoManagerWillRedo_ name:v15 object:v16];
  }
}

- (void)undoManagerWillUndo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mPopoverControllers = self->mPopoverControllers;
  uint64_t v5 = [(NSMutableSet *)mPopoverControllers countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(mPopoverControllers);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 dismissOnUndo]) {
          [v9 dismissPopoverAnimated:1];
        }
      }
      uint64_t v6 = [(NSMutableSet *)mPopoverControllers countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  mPopoverBasedViewControllers = self->mPopoverBasedViewControllers;
  uint64_t v11 = [(NSMutableSet *)mPopoverBasedViewControllers countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(mPopoverBasedViewControllers);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        if ([v15 dismissOnUndo]) {
          [v15 dismissAnimated:1];
        }
      }
      uint64_t v12 = [(NSMutableSet *)mPopoverBasedViewControllers countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)undoManagerWillRedo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  mPopoverControllers = self->mPopoverControllers;
  uint64_t v5 = [(NSMutableSet *)mPopoverControllers countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v21 != v7) {
          objc_enumerationMutation(mPopoverControllers);
        }
        v9 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v9 dismissOnUndo]) {
          [v9 dismissPopoverAnimated:1];
        }
      }
      uint64_t v6 = [(NSMutableSet *)mPopoverControllers countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v6);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  mPopoverBasedViewControllers = self->mPopoverBasedViewControllers;
  uint64_t v11 = [(NSMutableSet *)mPopoverBasedViewControllers countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(mPopoverBasedViewControllers);
        }
        uint64_t v15 = *(void **)(*((void *)&v16 + 1) + 8 * j);
        if ([v15 dismissOnUndo]) {
          [v15 dismissAnimated:1];
        }
      }
      uint64_t v12 = [(NSMutableSet *)mPopoverBasedViewControllers countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
}

- (void)addPopoverController:(id)a3
{
}

- (void)removePopoverController:(id)a3
{
}

- (void)addPopoverBasedViewController:(id)a3
{
}

- (void)removePopoverBasedViewController:(id)a3
{
}

- (NSUndoManager)observedUndoManager
{
  return self->mUndoManager;
}

@end