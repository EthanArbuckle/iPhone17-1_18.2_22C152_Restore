@interface SVXTaskTrackingCenter
- (SVXTaskTrackingCenter)initWithPerformer:(id)a3 delegate:(id)a4;
- (id)beginTrackingTaskWithContext:(id)a3 instrumentationContext:(id)a4;
- (void)_beginContext:(id)a3;
- (void)_endContext:(id)a3;
- (void)_endContextsPassingTest:(id)a3;
- (void)endTrackingAllTasks;
- (void)endTrackingTaskWithContext:(id)a3;
- (void)endTrackingTasksPassingTest:(id)a3;
- (void)getContextsOfAllTrackedTasksUsingBlock:(id)a3;
- (void)getContextsOfAllTrackedTasksUsingSyncBlock:(id)a3;
- (void)taskTracker:(id)a3 childWillBegin:(id)a4;
- (void)taskTrackerDidEnd:(id)a3;
@end

@implementation SVXTaskTrackingCenter

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contexts, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (void)_endContextsPassingTest:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [(NSMutableSet *)self->_contexts count];
  v6 = (NSObject **)MEMORY[0x263F28348];
  v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[SVXTaskTrackingCenter _endContextsPassingTest:]";
    __int16 v25 = 2048;
    uint64_t v26 = v5;
    _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s numberOfContexts = %tu", buf, 0x16u);
  }
  if (v5)
  {
    contexts = self->_contexts;
    if (v4)
    {
      v9 = [(NSMutableSet *)contexts objectsPassingTest:v4];
    }
    else
    {
      v9 = (void *)[(NSMutableSet *)contexts copy];
    }
    v10 = v9;
    uint64_t v11 = [v9 count];
    v12 = *v6;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v24 = "-[SVXTaskTrackingCenter _endContextsPassingTest:]";
      __int16 v25 = 2048;
      uint64_t v26 = v11;
      _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s numberOfContextsToEnd = %tu", buf, 0x16u);
    }
    if (v11)
    {
      long long v20 = 0u;
      long long v21 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v13 = v10;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v19;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v19 != v16) {
              objc_enumerationMutation(v13);
            }
            -[SVXTaskTrackingCenter _endContext:](self, "_endContext:", *(void *)(*((void *)&v18 + 1) + 8 * v17++), (void)v18);
          }
          while (v15 != v17);
          uint64_t v15 = [v13 countByEnumeratingWithState:&v18 objects:v22 count:16];
        }
        while (v15);
      }
    }
  }
}

- (void)_endContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = (SVXTaskTrackingCenter *)a3;
  if (v4 && [(NSMutableSet *)self->_contexts containsObject:v4])
  {
    uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
    v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[SVXTaskTrackingCenter _endContext:]";
      __int16 v16 = 2112;
      uint64_t v17 = v4;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Removing %@.", (uint8_t *)&v14, 0x16u);
    }
    [(NSMutableSet *)self->_contexts removeObject:v4];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained taskTrackingCenter:self didEndTrackingTaskWithContext:v4];

    v8 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
    {
      int v14 = 136315394;
      uint64_t v15 = "-[SVXTaskTrackingCenter _endContext:]";
      __int16 v16 = 2112;
      uint64_t v17 = v4;
      _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s Removed %@.", (uint8_t *)&v14, 0x16u);
      v8 = *v5;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      contexts = self->_contexts;
      v10 = v8;
      uint64_t v11 = [(NSMutableSet *)contexts count];
      int v14 = 136315394;
      uint64_t v15 = "-[SVXTaskTrackingCenter _endContext:]";
      __int16 v16 = 2048;
      uint64_t v17 = (SVXTaskTrackingCenter *)v11;
      _os_log_impl(&dword_220062000, v10, OS_LOG_TYPE_INFO, "%s numberOfContexts = %tu", (uint8_t *)&v14, 0x16u);
    }
    if (![(NSMutableSet *)self->_contexts count])
    {
      v12 = *v5;
      if (os_log_type_enabled(*v5, OS_LOG_TYPE_INFO))
      {
        int v14 = 136315394;
        uint64_t v15 = "-[SVXTaskTrackingCenter _endContext:]";
        __int16 v16 = 2112;
        uint64_t v17 = self;
        _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s %@ did become idle.", (uint8_t *)&v14, 0x16u);
      }
      id v13 = objc_loadWeakRetained((id *)&self->_delegate);
      [v13 taskTrackingCenterDidBecomeIdle:self];
    }
  }
}

- (void)_beginContext:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = (SVXTaskTrackingCenter *)a3;
  if (v4 && ([(NSMutableSet *)self->_contexts containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = [(NSMutableSet *)self->_contexts count];
    v6 = (os_log_t *)MEMORY[0x263F28348];
    if (!v5)
    {
      v7 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        int v15 = 136315394;
        __int16 v16 = "-[SVXTaskTrackingCenter _beginContext:]";
        __int16 v17 = 2112;
        uint64_t v18 = self;
        _os_log_impl(&dword_220062000, v7, OS_LOG_TYPE_INFO, "%s %@ will become busy.", (uint8_t *)&v15, 0x16u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained taskTrackingCenterWillBecomeBusy:self];
    }
    v9 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315394;
      __int16 v16 = "-[SVXTaskTrackingCenter _beginContext:]";
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, "%s Adding %@.", (uint8_t *)&v15, 0x16u);
    }
    [(NSMutableSet *)self->_contexts addObject:v4];
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    [v10 taskTrackingCenter:self didBeginTrackingTaskWithContext:v4];

    uint64_t v11 = *v6;
    if (os_log_type_enabled(*v6, OS_LOG_TYPE_INFO))
    {
      int v15 = 136315394;
      __int16 v16 = "-[SVXTaskTrackingCenter _beginContext:]";
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      _os_log_impl(&dword_220062000, v11, OS_LOG_TYPE_INFO, "%s Added %@.", (uint8_t *)&v15, 0x16u);
      uint64_t v11 = *v6;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      contexts = self->_contexts;
      id v13 = v11;
      uint64_t v14 = [(NSMutableSet *)contexts count];
      int v15 = 136315394;
      __int16 v16 = "-[SVXTaskTrackingCenter _beginContext:]";
      __int16 v17 = 2048;
      uint64_t v18 = (SVXTaskTrackingCenter *)v14;
      _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s numberOfContexts = %tu", (uint8_t *)&v15, 0x16u);
    }
  }
}

- (void)taskTrackerDidEnd:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SVXTaskTrackingCenter taskTrackerDidEnd:]";
    __int16 v13 = 2112;
    id v14 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s taskTracker = %@", buf, 0x16u);
  }
  v6 = [v4 context];
  performer = self->_performer;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __43__SVXTaskTrackingCenter_taskTrackerDidEnd___block_invoke;
  v9[3] = &unk_2645548C8;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  [(SVXPerforming *)performer performBlock:v9];
}

uint64_t __43__SVXTaskTrackingCenter_taskTrackerDidEnd___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endContext:*(void *)(a1 + 40)];
}

- (void)taskTracker:(id)a3 childWillBegin:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v15 = "-[SVXTaskTrackingCenter taskTracker:childWillBegin:]";
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s taskTracker = %@, childTaskTracker = %@", buf, 0x20u);
  }
  v9 = [v7 context];
  performer = self->_performer;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __52__SVXTaskTrackingCenter_taskTracker_childWillBegin___block_invoke;
  v12[3] = &unk_2645548C8;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [(SVXPerforming *)performer performBlock:v12];
}

uint64_t __52__SVXTaskTrackingCenter_taskTracker_childWillBegin___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginContext:*(void *)(a1 + 40)];
}

- (void)getContextsOfAllTrackedTasksUsingSyncBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __68__SVXTaskTrackingCenter_getContextsOfAllTrackedTasksUsingSyncBlock___block_invoke;
    v7[3] = &unk_2645547D8;
    v7[4] = self;
    id v8 = v4;
    [(SVXPerforming *)performer performBlockSync:v7];
  }
}

void __68__SVXTaskTrackingCenter_getContextsOfAllTrackedTasksUsingSyncBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)getContextsOfAllTrackedTasksUsingBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    performer = self->_performer;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __64__SVXTaskTrackingCenter_getContextsOfAllTrackedTasksUsingBlock___block_invoke;
    v7[3] = &unk_2645547D8;
    v7[4] = self;
    id v8 = v4;
    [(SVXPerforming *)performer performBlock:v7];
  }
}

void __64__SVXTaskTrackingCenter_getContextsOfAllTrackedTasksUsingBlock___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = (id)[*(id *)(*(void *)(a1 + 32) + 16) copy];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)endTrackingAllTasks
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[SVXTaskTrackingCenter endTrackingAllTasks]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SVXTaskTrackingCenter_endTrackingAllTasks__block_invoke;
  v5[3] = &unk_2645548A0;
  v5[4] = self;
  [(SVXPerforming *)performer performBlock:v5];
}

uint64_t __44__SVXTaskTrackingCenter_endTrackingAllTasks__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endContextsPassingTest:0];
}

- (void)endTrackingTasksPassingTest:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v11 = "-[SVXTaskTrackingCenter endTrackingTasksPassingTest:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", buf, 0xCu);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__SVXTaskTrackingCenter_endTrackingTasksPassingTest___block_invoke;
  v8[3] = &unk_2645547D8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

uint64_t __53__SVXTaskTrackingCenter_endTrackingTasksPassingTest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endContextsPassingTest:*(void *)(a1 + 40)];
}

- (void)endTrackingTaskWithContext:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[SVXTaskTrackingCenter endTrackingTaskWithContext:]";
    __int16 v12 = 2112;
    id v13 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  performer = self->_performer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __52__SVXTaskTrackingCenter_endTrackingTaskWithContext___block_invoke;
  v8[3] = &unk_2645548C8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [(SVXPerforming *)performer performBlock:v8];
}

uint64_t __52__SVXTaskTrackingCenter_endTrackingTaskWithContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endContext:*(void *)(a1 + 40)];
}

- (id)beginTrackingTaskWithContext:(id)a3 instrumentationContext:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v16 = "-[SVXTaskTrackingCenter beginTrackingTaskWithContext:instrumentationContext:]";
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s context = %@", buf, 0x16u);
  }
  id v9 = [[SVXTaskTracker alloc] initWithContext:v6 instrumentationContext:v7 delegate:self];
  performer = self->_performer;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __77__SVXTaskTrackingCenter_beginTrackingTaskWithContext_instrumentationContext___block_invoke;
  v13[3] = &unk_2645548C8;
  v13[4] = self;
  id v14 = v6;
  id v11 = v6;
  [(SVXPerforming *)performer performBlock:v13];

  return v9;
}

uint64_t __77__SVXTaskTrackingCenter_beginTrackingTaskWithContext_instrumentationContext___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginContext:*(void *)(a1 + 40)];
}

- (SVXTaskTrackingCenter)initWithPerformer:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SVXTaskTrackingCenter;
  id v9 = [(SVXTaskTrackingCenter *)&v14 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_performer, a3);
    id v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263F08760]);
    contexts = v10->_contexts;
    v10->_contexts = v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

@end