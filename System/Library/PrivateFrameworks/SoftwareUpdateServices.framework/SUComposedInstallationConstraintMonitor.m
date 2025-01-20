@interface SUComposedInstallationConstraintMonitor
- (BOOL)isSatisfied;
- (NSSet)constraintMonitors;
- (SUComposedInstallationConstraintMonitor)initWithInternalQueue:(id)a3 withInstallationConstraintMonitors:(id)a4;
- (SUInstallationConstraintMonitorDelegate)delegate;
- (id)_queue_delegate;
- (unint64_t)_queue_representedConstraints;
- (unint64_t)_queue_unsatisfiedConstraints;
- (unint64_t)_queue_unsatisfiedConstraintsWithIgnorableConstraints:(unint64_t)a3;
- (unint64_t)representedConstraints;
- (unint64_t)unsatisfiedConstraints;
- (unint64_t)unsatisfiedConstraintsWithIgnorableConstraints:(unint64_t)a3;
- (void)_queue_clearDelegate;
- (void)_queue_invalidateChildConstraintMonitors;
- (void)_queue_noteInstallationConstraintMonitor:(id)a3 constraintsDidChange:(unint64_t)a4;
- (void)_queue_setDelegate:(id)a3;
- (void)dealloc;
- (void)installationConstraintMonitor:(id)a3 constraintsDidChange:(unint64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SUComposedInstallationConstraintMonitor

- (SUComposedInstallationConstraintMonitor)initWithInternalQueue:(id)a3 withInstallationConstraintMonitors:(id)a4
{
  v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SUComposedInstallationConstraintMonitor;
  v9 = [(SUComposedInstallationConstraintMonitor *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a3);
    uint64_t v11 = [v8 copy];
    queue_installationConstraintMonitors = v10->_queue_installationConstraintMonitors;
    v10->_queue_installationConstraintMonitors = (NSSet *)v11;

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __100__SUComposedInstallationConstraintMonitor_initWithInternalQueue_withInstallationConstraintMonitors___block_invoke;
    block[3] = &unk_26447C878;
    v15 = v10;
    dispatch_sync(v7, block);
  }
  return v10;
}

void __100__SUComposedInstallationConstraintMonitor_initWithInternalQueue_withInstallationConstraintMonitors___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        v7 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        *(void *)(*(void *)(a1 + 32) + 32) |= objc_msgSend(v7, "representedConstraints", (void)v8);
        [v7 setDelegate:*(void *)(a1 + 32)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)dealloc
{
  objc_storeWeak((id *)&self->_queue_delegate, 0);
  uint64_t v3 = self->_queue_installationConstraintMonitors;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SUComposedInstallationConstraintMonitor_dealloc__block_invoke;
  block[3] = &unk_26447C878;
  long long v11 = v3;
  uint64_t v5 = v3;
  v6 = queue;
  dispatch_async(v6, block);
  queue_installationConstraintMonitors = self->_queue_installationConstraintMonitors;
  self->_queue_installationConstraintMonitors = 0;

  long long v8 = self->_queue;
  self->_queue = 0;

  v9.receiver = self;
  v9.super_class = (Class)SUComposedInstallationConstraintMonitor;
  [(SUComposedInstallationConstraintMonitor *)&v9 dealloc];
}

void __50__SUComposedInstallationConstraintMonitor_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "setDelegate:", 0, (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (SUInstallationConstraintMonitorDelegate)delegate
{
  uint64_t v7 = 0;
  long long v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy_;
  uint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __51__SUComposedInstallationConstraintMonitor_delegate__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SUInstallationConstraintMonitorDelegate *)v4;
}

uint64_t __51__SUComposedInstallationConstraintMonitor_delegate__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));

  return MEMORY[0x270F9A758]();
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SUComposedInstallationConstraintMonitor_setDelegate___block_invoke;
  v7[3] = &unk_26447C8C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __55__SUComposedInstallationConstraintMonitor_setDelegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_setDelegate:", *(void *)(a1 + 40));
}

- (unint64_t)representedConstraints
{
  return self->_queue_representedConstraints;
}

- (unint64_t)unsatisfiedConstraints
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __65__SUComposedInstallationConstraintMonitor_unsatisfiedConstraints__block_invoke;
  v6[3] = &unk_26447C8A0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __65__SUComposedInstallationConstraintMonitor_unsatisfiedConstraints__block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_unsatisfiedConstraints");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)unsatisfiedConstraintsWithIgnorableConstraints:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  uint64_t v12 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __90__SUComposedInstallationConstraintMonitor_unsatisfiedConstraintsWithIgnorableConstraints___block_invoke;
  block[3] = &unk_26447C8F0;
  void block[4] = self;
  block[5] = &v9;
  block[6] = a3;
  dispatch_sync(queue, block);
  unint64_t v6 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __90__SUComposedInstallationConstraintMonitor_unsatisfiedConstraintsWithIgnorableConstraints___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_queue_unsatisfiedConstraintsWithIgnorableConstraints:", *(void *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)isSatisfied
{
  return [(SUComposedInstallationConstraintMonitor *)self unsatisfiedConstraints] == 0;
}

- (void)_queue_noteInstallationConstraintMonitor:(id)a3 constraintsDidChange:(unint64_t)a4
{
  BSDispatchQueueAssert();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue_delegate);
  [WeakRetained installationConstraintMonitor:self constraintsDidChange:a4];
}

- (id)_queue_delegate
{
  BSDispatchQueueAssert();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_queue_delegate);

  return WeakRetained;
}

- (void)_queue_clearDelegate
{
  BSDispatchQueueAssert();

  [(SUComposedInstallationConstraintMonitor *)self _queue_setDelegate:0];
}

- (unint64_t)_queue_representedConstraints
{
  return self->_queue_representedConstraints;
}

- (unint64_t)_queue_unsatisfiedConstraints
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_queue_installationConstraintMonitors;
  uint64_t v4 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v3);
        }
        v6 |= objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "unsatisfiedConstraints", (void)v10);
      }
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (unint64_t)_queue_unsatisfiedConstraintsWithIgnorableConstraints:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  if (+[SUUtility currentReleaseTypeIsInternal]
    && (+[SUPreferences sharedInstance],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v5 unmetConstraints],
        unint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    uint64_t v7 = +[SUPreferences sharedInstance];
    id v8 = [(NSSet *)v7 unmetConstraints];
    uint64_t v9 = [v8 unsignedIntegerValue];
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = self->_queue_installationConstraintMonitors;
    uint64_t v10 = [(NSSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v9 = 0;
      uint64_t v12 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v23 != v12) {
            objc_enumerationMutation(v7);
          }
          v9 |= [*(id *)(*((void *)&v22 + 1) + 8 * i) unsatisfiedConstraints];
        }
        uint64_t v11 = [(NSSet *)v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v11);
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  SULogInfo(@"unsatisfiedConstraints = %lu, ignorableConstraints = %lu, realUnsatisfiedConstraints = %lu", v14, v15, v16, v17, v18, v19, v20, v9);
  return v9 & ~a3;
}

- (void)_queue_invalidateChildConstraintMonitors
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  BSDispatchQueueAssert();
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  uint64_t v3 = self->_queue_installationConstraintMonitors;
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "setDelegate:", 0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSSet *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)installationConstraintMonitor:(id)a3 constraintsDidChange:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __94__SUComposedInstallationConstraintMonitor_installationConstraintMonitor_constraintsDidChange___block_invoke;
  block[3] = &unk_26447C918;
  void block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __94__SUComposedInstallationConstraintMonitor_installationConstraintMonitor_constraintsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_noteInstallationConstraintMonitor:constraintsDidChange:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_queue_setDelegate:(id)a3
{
  id obj = a3;
  BSDispatchQueueAssert();
  p_queue_delegate = &self->_queue_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_queue_delegate);

  id v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_queue_delegate, obj);
    id v6 = obj;
  }
}

- (NSSet)constraintMonitors
{
  return self->_queue_installationConstraintMonitors;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue_delegate);
  objc_storeStrong((id *)&self->_queue_installationConstraintMonitors, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end