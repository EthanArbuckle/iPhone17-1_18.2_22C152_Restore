@interface SVXServiceCommandTransaction
- (SVXServiceCommandTransaction)initWithPerformer:(id)a3 command:(id)a4 handlers:(id)a5 taskTracker:(id)a6 dependencies:(id)a7 completion:(id)a8;
- (id)description;
- (void)_addBlockedTransaction:(id)a3;
- (void)_didHandleAll;
- (void)_didPrepareAll;
- (void)_dispatchCompletionWithResult:(id)a3;
- (void)_handle;
- (void)_handler:(id)a3 didHandleWithResult:(id)a4 completion:(id)a5;
- (void)_handler:(id)a3 didPrepareSuccessfully:(BOOL)a4 context:(id)a5 completion:(id)a6;
- (void)_invalidate;
- (void)_prepare;
- (void)_removeBlockingTransaction:(id)a3;
- (void)_unblockDependentTransactions;
- (void)addBlockedTransaction:(id)a3;
- (void)dealloc;
- (void)handler:(id)a3 didHandleWithResult:(id)a4 completion:(id)a5;
- (void)handler:(id)a3 didPrepareSuccessfully:(BOOL)a4 context:(id)a5 completion:(id)a6;
- (void)invalidate;
- (void)removeBlockingTransaction:(id)a3;
@end

@implementation SVXServiceCommandTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blockedTransactions, 0);
  objc_storeStrong((id *)&self->_blockingTransactions, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_handlers, 0);
  objc_storeStrong((id *)&self->_command, 0);
  objc_storeStrong((id *)&self->_handledResultsByHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_preparedContextsByHandlerIdentifier, 0);
  objc_storeStrong((id *)&self->_preparedResultsByHandlerIdentifier, 0);

  objc_storeStrong((id *)&self->_performer, 0);
}

- (void)_dispatchCompletionWithResult:(id)a3
{
  completion = (void (**)(id, id))self->_completion;
  if (completion)
  {
    completion[2](completion, a3);
    id v5 = self->_completion;
    self->_completion = 0;
  }
}

- (void)_unblockDependentTransactions
{
  if ([(NSHashTable *)self->_blockedTransactions count])
  {
    v3 = [(NSHashTable *)self->_blockedTransactions setRepresentation];
    performer = self->_performer;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __61__SVXServiceCommandTransaction__unblockDependentTransactions__block_invoke;
    v6[3] = &unk_2645548C8;
    id v7 = v3;
    v8 = self;
    id v5 = v3;
    [(SVXPerforming *)performer performBlock:v6 withOptions:0];
  }
}

void __61__SVXServiceCommandTransaction__unblockDependentTransactions__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "removeBlockingTransaction:", *(void *)(a1 + 40), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_invalidate
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v14 = "-[SVXServiceCommandTransaction _invalidate]";
    __int16 v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  self->_state = 5;
  id v4 = [NSString alloc];
  uint64_t v5 = [(SAAceCommand *)self->_command aceId];
  uint64_t v6 = (void *)[v4 initWithFormat:@"Service command handling context invalidated for command %@.", v5];
  long long v7 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:v6];
  [(SVXServiceCommandTransaction *)self _dispatchCompletionWithResult:v7];

  [(SVXServiceCommandTransaction *)self _unblockDependentTransactions];
  blockedTransactions = self->_blockedTransactions;
  self->_blockedTransactions = 0;

  blockingTransactions = self->_blockingTransactions;
  self->_blockingTransactions = 0;

  preparedContextsByHandlerIdentifier = self->_preparedContextsByHandlerIdentifier;
  self->_preparedContextsByHandlerIdentifier = 0;

  preparedResultsByHandlerIdentifier = self->_preparedResultsByHandlerIdentifier;
  self->_preparedResultsByHandlerIdentifier = 0;

  taskTracker = self->_taskTracker;
  self->_taskTracker = 0;
}

- (void)_didHandleAll
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[SVXServiceCommandTransaction _didHandleAll]";
    __int16 v15 = 2112;
    v16 = self;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v13, 0x16u);
  }
  int64_t state = self->_state;
  if (state == 3)
  {
    self->_int64_t state = 4;
    uint64_t v6 = [(NSMutableDictionary *)self->_handledResultsByHandlerIdentifier count];
    if (v6 == 1)
    {
      long long v9 = [(NSMutableDictionary *)self->_handledResultsByHandlerIdentifier allValues];
      uint64_t v10 = [v9 firstObject];
    }
    else
    {
      if (!v6)
      {
        long long v7 = +[SVXServiceCommandResult resultIgnored];
LABEL_12:
        [(SVXServiceCommandTransaction *)self _dispatchCompletionWithResult:v7];
        [(SVXServiceCommandTransaction *)self _unblockDependentTransactions];
        blockedTransactions = self->_blockedTransactions;
        self->_blockedTransactions = 0;

        taskTracker = self->_taskTracker;
        self->_taskTracker = 0;

        return;
      }
      long long v9 = [(NSMutableDictionary *)self->_handledResultsByHandlerIdentifier allValues];
      uint64_t v10 = +[SVXServiceCommandResult resultWithResults:v9];
    }
    long long v7 = (void *)v10;

    goto LABEL_12;
  }
  long long v8 = *v3;
  if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
  {
    int v13 = 136315394;
    v14 = "-[SVXServiceCommandTransaction _didHandleAll]";
    __int16 v15 = 2048;
    v16 = (SVXServiceCommandTransaction *)state;
    _os_log_impl(&dword_220062000, v8, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", (uint8_t *)&v13, 0x16u);
  }
}

- (void)_handler:(id)a3 didHandleWithResult:(id)a4 completion:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  v11 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v19 = 136315394;
    v20 = "-[SVXServiceCommandTransaction _handler:didHandleWithResult:completion:]";
    __int16 v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v19, 0x16u);
  }
  int64_t state = self->_state;
  if (state == 3)
  {
    if (v9)
    {
      handledResultsByHandlerIdentifier = self->_handledResultsByHandlerIdentifier;
      if (!handledResultsByHandlerIdentifier)
      {
        __int16 v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        v16 = self->_handledResultsByHandlerIdentifier;
        self->_handledResultsByHandlerIdentifier = v15;

        handledResultsByHandlerIdentifier = self->_handledResultsByHandlerIdentifier;
      }
      uint64_t v17 = [v8 identifier];
      [(NSMutableDictionary *)handledResultsByHandlerIdentifier setObject:v9 forKey:v17];
    }
  }
  else
  {
    v18 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_INFO))
    {
      int v19 = 136315394;
      v20 = "-[SVXServiceCommandTransaction _handler:didHandleWithResult:completion:]";
      __int16 v21 = 2048;
      v22 = (SVXServiceCommandTransaction *)state;
      _os_log_impl(&dword_220062000, v18, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", (uint8_t *)&v19, 0x16u);
    }
  }
  if (v10) {
    v10[2](v10);
  }
}

- (void)_handle
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  uint64_t v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v41 = "-[SVXServiceCommandTransaction _handle]";
    __int16 v42 = 2112;
    v43 = self;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  int64_t state = self->_state;
  if (state != 2)
  {
    os_log_t v10 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_INFO)) {
      return;
    }
    *(_DWORD *)buf = 136315394;
    v41 = "-[SVXServiceCommandTransaction _handle]";
    __int16 v42 = 2048;
    v43 = (SVXServiceCommandTransaction *)state;
    id v8 = "%s Ignored because state is %ld.";
    id v9 = v10;
    goto LABEL_9;
  }
  if ([(NSMutableSet *)self->_blockingTransactions count])
  {
    os_log_t v6 = *v3;
    if (!os_log_type_enabled(*v3, OS_LOG_TYPE_INFO)) {
      return;
    }
    blockingTransactions = self->_blockingTransactions;
    *(_DWORD *)buf = 136315394;
    v41 = "-[SVXServiceCommandTransaction _handle]";
    __int16 v42 = 2112;
    v43 = (SVXServiceCommandTransaction *)blockingTransactions;
    id v8 = "%s Ignored because blocked by %@.";
    id v9 = v6;
LABEL_9:
    _os_log_impl(&dword_220062000, v9, OS_LOG_TYPE_INFO, v8, buf, 0x16u);
    return;
  }
  self->_int64_t state = 3;
  objc_initWeak((id *)buf, self);
  v11 = dispatch_group_create();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obj = self->_handlers;
  uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v12)
  {
    uint64_t v27 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v36 != v27) {
          objc_enumerationMutation(obj);
        }
        v14 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        dispatch_group_enter(v11);
        __int16 v15 = [v14 identifier];
        v16 = [(NSMutableDictionary *)self->_preparedResultsByHandlerIdentifier objectForKey:v15];
        int v17 = [v16 BOOLValue];

        if (v17)
        {
          command = self->_command;
          int v19 = [(NSMutableDictionary *)self->_preparedContextsByHandlerIdentifier objectForKey:v15];
          taskTracker = self->_taskTracker;
          v32[0] = MEMORY[0x263EF8330];
          v32[1] = 3221225472;
          v32[2] = __39__SVXServiceCommandTransaction__handle__block_invoke;
          v32[3] = &unk_2645549B8;
          objc_copyWeak(&v34, (id *)buf);
          v32[4] = v14;
          v33 = v11;
          [v14 handleCommand:command withContext:v19 taskTracker:taskTracker completion:v32];

          objc_destroyWeak(&v34);
        }
        else
        {
          id v21 = [NSString alloc];
          v22 = [(SAAceCommand *)self->_command aceId];
          uint64_t v23 = (void *)[v21 initWithFormat:@"Failed to prepare command %@.", v22];
          v24 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:v23];
          v30[0] = MEMORY[0x263EF8330];
          v30[1] = 3221225472;
          v30[2] = __39__SVXServiceCommandTransaction__handle__block_invoke_3;
          v30[3] = &unk_2645548A0;
          v31 = v11;
          [(SVXServiceCommandTransaction *)self _handler:v14 didHandleWithResult:v24 completion:v30];
        }
      }
      uint64_t v12 = [(NSArray *)obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v12);
  }

  v25 = dispatch_get_global_queue(21, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SVXServiceCommandTransaction__handle__block_invoke_4;
  block[3] = &unk_264554990;
  block[4] = self;
  objc_copyWeak(&v29, (id *)buf);
  dispatch_group_notify(v11, v25, block);

  objc_destroyWeak(&v29);
  objc_destroyWeak((id *)buf);
}

void __39__SVXServiceCommandTransaction__handle__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 48);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __39__SVXServiceCommandTransaction__handle__block_invoke_2;
  v7[3] = &unk_2645548A0;
  uint64_t v6 = *(void *)(a1 + 32);
  id v8 = *(id *)(a1 + 40);
  [WeakRetained handler:v6 didHandleWithResult:v4 completion:v7];
}

void __39__SVXServiceCommandTransaction__handle__block_invoke_3(uint64_t a1)
{
}

void __39__SVXServiceCommandTransaction__handle__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __39__SVXServiceCommandTransaction__handle__block_invoke_5;
  v2[3] = &unk_264554968;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  [v1 performBlock:v2];
  objc_destroyWeak(&v3);
}

void __39__SVXServiceCommandTransaction__handle__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didHandleAll];
}

void __39__SVXServiceCommandTransaction__handle__block_invoke_2(uint64_t a1)
{
}

- (void)_didPrepareAll
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v7 = 136315394;
    id v8 = "-[SVXServiceCommandTransaction _didPrepareAll]";
    __int16 v9 = 2112;
    os_log_t v10 = self;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v7, 0x16u);
  }
  int64_t state = self->_state;
  if (state == 1)
  {
    self->_int64_t state = 2;
    [(SVXServiceCommandTransaction *)self _handle];
  }
  else
  {
    uint64_t v6 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      int v7 = 136315394;
      id v8 = "-[SVXServiceCommandTransaction _didPrepareAll]";
      __int16 v9 = 2048;
      os_log_t v10 = (SVXServiceCommandTransaction *)state;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_handler:(id)a3 didPrepareSuccessfully:(BOOL)a4 context:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  uint64_t v12 = (void (**)(void))a6;
  int v13 = (os_log_t *)MEMORY[0x263F28348];
  v14 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v26 = 136315394;
    uint64_t v27 = "-[SVXServiceCommandTransaction _handler:didPrepareSuccessfully:context:completion:]";
    __int16 v28 = 2112;
    id v29 = self;
    _os_log_impl(&dword_220062000, v14, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v26, 0x16u);
  }
  int64_t state = self->_state;
  if (state == 1)
  {
    v16 = [v10 identifier];
    preparedResultsByHandlerIdentifier = self->_preparedResultsByHandlerIdentifier;
    if (!preparedResultsByHandlerIdentifier)
    {
      v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
      int v19 = self->_preparedResultsByHandlerIdentifier;
      self->_preparedResultsByHandlerIdentifier = v18;

      preparedResultsByHandlerIdentifier = self->_preparedResultsByHandlerIdentifier;
    }
    v20 = [NSNumber numberWithBool:v8];
    [(NSMutableDictionary *)preparedResultsByHandlerIdentifier setObject:v20 forKey:v16];

    if (v11)
    {
      preparedContextsByHandlerIdentifier = self->_preparedContextsByHandlerIdentifier;
      if (!preparedContextsByHandlerIdentifier)
      {
        v22 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
        uint64_t v23 = self->_preparedContextsByHandlerIdentifier;
        self->_preparedContextsByHandlerIdentifier = v22;

        preparedContextsByHandlerIdentifier = self->_preparedContextsByHandlerIdentifier;
      }
      v24 = (void *)[v11 copy];
      [(NSMutableDictionary *)preparedContextsByHandlerIdentifier setObject:v24 forKey:v16];
    }
    if (v12) {
      v12[2](v12);
    }
  }
  else
  {
    v25 = *v13;
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_INFO))
    {
      int v26 = 136315394;
      uint64_t v27 = "-[SVXServiceCommandTransaction _handler:didPrepareSuccessfully:context:completion:]";
      __int16 v28 = 2048;
      id v29 = (SVXServiceCommandTransaction *)state;
      _os_log_impl(&dword_220062000, v25, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", (uint8_t *)&v26, 0x16u);
    }
    if (v12) {
      v12[2](v12);
    }
  }
}

- (void)_prepare
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v3 = (os_log_t *)MEMORY[0x263F28348];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v30 = "-[SVXServiceCommandTransaction _prepare]";
    __int16 v31 = 2112;
    v32 = self;
    _os_log_impl(&dword_220062000, v4, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  int64_t state = self->_state;
  if (state)
  {
    uint64_t v6 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v30 = "-[SVXServiceCommandTransaction _prepare]";
      __int16 v31 = 2048;
      v32 = (SVXServiceCommandTransaction *)state;
      _os_log_impl(&dword_220062000, v6, OS_LOG_TYPE_INFO, "%s Ignored because state is %ld.", buf, 0x16u);
    }
  }
  else
  {
    self->_int64_t state = 1;
    objc_initWeak((id *)buf, self);
    int v7 = dispatch_group_create();
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    obj = self->_handlers;
    uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v25;
      v14 = v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v24 + 1) + 8 * v10);
          dispatch_group_enter(v7);
          if (objc_opt_respondsToSelector())
          {
            command = self->_command;
            v21[0] = MEMORY[0x263EF8330];
            v21[1] = 3221225472;
            v21[2] = __40__SVXServiceCommandTransaction__prepare__block_invoke;
            v21[3] = &unk_264554940;
            objc_copyWeak(&v23, (id *)buf);
            v21[4] = v11;
            v22 = v7;
            [v11 prepareToHandleCommand:command completion:v21];

            objc_destroyWeak(&v23);
          }
          else
          {
            v18[0] = MEMORY[0x263EF8330];
            v18[1] = 3221225472;
            v19[0] = __40__SVXServiceCommandTransaction__prepare__block_invoke_3;
            v19[1] = &unk_2645548A0;
            v20 = v7;
            -[SVXServiceCommandTransaction _handler:didPrepareSuccessfully:context:completion:](self, "_handler:didPrepareSuccessfully:context:completion:", v11, 1, 0, v18, v14);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }

    int v13 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __40__SVXServiceCommandTransaction__prepare__block_invoke_4;
    block[3] = &unk_264554990;
    block[4] = self;
    objc_copyWeak(&v17, (id *)buf);
    dispatch_group_notify(v7, v13, block);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __40__SVXServiceCommandTransaction__prepare__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (id *)(a1 + 48);
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained(v5);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __40__SVXServiceCommandTransaction__prepare__block_invoke_2;
  v9[3] = &unk_2645548A0;
  uint64_t v8 = *(void *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  [WeakRetained handler:v8 didPrepareSuccessfully:a2 context:v6 completion:v9];
}

void __40__SVXServiceCommandTransaction__prepare__block_invoke_3(uint64_t a1)
{
}

void __40__SVXServiceCommandTransaction__prepare__block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __40__SVXServiceCommandTransaction__prepare__block_invoke_5;
  v2[3] = &unk_264554968;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  [v1 performBlock:v2];
  objc_destroyWeak(&v3);
}

void __40__SVXServiceCommandTransaction__prepare__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didPrepareAll];
}

void __40__SVXServiceCommandTransaction__prepare__block_invoke_2(uint64_t a1)
{
}

- (void)_removeBlockingTransaction:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315650;
    int v7 = "-[SVXServiceCommandTransaction _removeBlockingTransaction:]";
    __int16 v8 = 2112;
    uint64_t v9 = self;
    __int16 v10 = 2112;
    id v11 = v4;
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s %@ is no longer blocked by %@.", (uint8_t *)&v6, 0x20u);
  }
  [(NSMutableSet *)self->_blockingTransactions removeObject:v4];
  [(SVXServiceCommandTransaction *)self _handle];
}

- (void)_addBlockedTransaction:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  id v9 = v4;
  if ((self->_state & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    [v4 removeBlockingTransaction:self];
  }
  else
  {
    blockedTransactions = self->_blockedTransactions;
    if (!blockedTransactions)
    {
      int v7 = [MEMORY[0x263F088B0] weakObjectsHashTable];
      __int16 v8 = self->_blockedTransactions;
      self->_blockedTransactions = v7;

      id v5 = v9;
      blockedTransactions = self->_blockedTransactions;
    }
    [(NSHashTable *)blockedTransactions addObject:v5];
  }
}

- (void)handler:(id)a3 didHandleWithResult:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  performer = self->_performer;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __71__SVXServiceCommandTransaction_handler_didHandleWithResult_completion___block_invoke;
  v15[3] = &unk_264554918;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(SVXPerforming *)performer performBlock:v15];
}

uint64_t __71__SVXServiceCommandTransaction_handler_didHandleWithResult_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handler:*(void *)(a1 + 40) didHandleWithResult:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)handler:(id)a3 didPrepareSuccessfully:(BOOL)a4 context:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  performer = self->_performer;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __82__SVXServiceCommandTransaction_handler_didPrepareSuccessfully_context_completion___block_invoke;
  v17[3] = &unk_2645548F0;
  v17[4] = self;
  id v18 = v10;
  BOOL v21 = a4;
  id v19 = v11;
  id v20 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  [(SVXPerforming *)performer performBlock:v17];
}

uint64_t __82__SVXServiceCommandTransaction_handler_didPrepareSuccessfully_context_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handler:*(void *)(a1 + 40) didPrepareSuccessfully:*(unsigned __int8 *)(a1 + 64) context:*(void *)(a1 + 48) completion:*(void *)(a1 + 56)];
}

- (void)removeBlockingTransaction:(id)a3
{
  id v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SVXServiceCommandTransaction_removeBlockingTransaction___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __58__SVXServiceCommandTransaction_removeBlockingTransaction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeBlockingTransaction:*(void *)(a1 + 40)];
}

- (void)addBlockedTransaction:(id)a3
{
  id v4 = a3;
  performer = self->_performer;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __54__SVXServiceCommandTransaction_addBlockedTransaction___block_invoke;
  v7[3] = &unk_2645548C8;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(SVXPerforming *)performer performBlock:v7];
}

uint64_t __54__SVXServiceCommandTransaction_addBlockedTransaction___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addBlockedTransaction:*(void *)(a1 + 40)];
}

- (void)invalidate
{
  performer = self->_performer;
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __42__SVXServiceCommandTransaction_invalidate__block_invoke;
  v3[3] = &unk_2645548A0;
  v3[4] = self;
  [(SVXPerforming *)performer performBlock:v3];
}

uint64_t __42__SVXServiceCommandTransaction_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (SVXServiceCommandTransaction)initWithPerformer:(id)a3 command:(id)a4 handlers:(id)a5 taskTracker:(id)a6 dependencies:(id)a7 completion:(id)a8
{
  uint64_t v63 = *MEMORY[0x263EF8340];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v48 = a7;
  id v19 = a8;
  v60.receiver = self;
  v60.super_class = (Class)SVXServiceCommandTransaction;
  id v20 = [(SVXServiceCommandTransaction *)&v60 init];
  BOOL v21 = v20;
  if (v20)
  {
    id v44 = v18;
    id v47 = v15;
    objc_storeStrong((id *)&v20->_performer, a3);
    v21->_int64_t state = 0;
    id v46 = v16;
    uint64_t v22 = [v16 copy];
    command = v21->_command;
    v21->_command = (SAAceCommand *)v22;

    uint64_t v24 = [v17 copy];
    handlers = v21->_handlers;
    v21->_handlers = (NSArray *)v24;

    objc_storeStrong((id *)&v21->_taskTracker, a6);
    id v43 = v19;
    uint64_t v26 = MEMORY[0x223C65C40](v19);
    id completion = v21->_completion;
    v21->_id completion = (id)v26;

    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v45 = v17;
    obuint64_t j = v17;
    uint64_t v28 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v57 != v30) {
            objc_enumerationMutation(obj);
          }
          v32 = *(void **)(*((void *)&v56 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x263EFF9C0]), "initWithCapacity:", objc_msgSend(v48, "count"));
            blockingTransactions = v21->_blockingTransactions;
            v21->_blockingTransactions = (NSMutableSet *)v33;

            long long v54 = 0u;
            long long v55 = 0u;
            long long v52 = 0u;
            long long v53 = 0u;
            id v35 = v48;
            uint64_t v36 = [v35 countByEnumeratingWithState:&v52 objects:v61 count:16];
            if (v36)
            {
              uint64_t v37 = v36;
              uint64_t v38 = *(void *)v53;
              do
              {
                for (uint64_t j = 0; j != v37; ++j)
                {
                  if (*(void *)v53 != v38) {
                    objc_enumerationMutation(v35);
                  }
                  v40 = *(void **)(*((void *)&v52 + 1) + 8 * j);
                  if ([v32 shouldDependOnCommand:v40[6]])
                  {
                    [(NSMutableSet *)v21->_blockingTransactions addObject:v40];
                    [v40 addBlockedTransaction:v21];
                  }
                }
                uint64_t v37 = [v35 countByEnumeratingWithState:&v52 objects:v61 count:16];
              }
              while (v37);
            }
          }
        }
        uint64_t v29 = [obj countByEnumeratingWithState:&v56 objects:v62 count:16];
      }
      while (v29);
    }

    performer = v21->_performer;
    v50[0] = MEMORY[0x263EF8330];
    v50[1] = 3221225472;
    v50[2] = __103__SVXServiceCommandTransaction_initWithPerformer_command_handlers_taskTracker_dependencies_completion___block_invoke;
    v50[3] = &unk_2645548A0;
    v51 = v21;
    [(SVXPerforming *)performer performBlock:v50 withOptions:0];

    id v16 = v46;
    id v15 = v47;
    id v18 = v44;
    id v17 = v45;
    id v19 = v43;
  }

  return v21;
}

uint64_t __103__SVXServiceCommandTransaction_initWithPerformer_command_handlers_taskTracker_dependencies_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepare];
}

- (void)dealloc
{
  id v3 = [NSString alloc];
  id v4 = [(SAAceCommand *)self->_command aceId];
  id v5 = (void *)[v3 initWithFormat:@"Service command handling context deallocated for command %@.", v4];
  id v6 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:v5];
  [(SVXServiceCommandTransaction *)self _dispatchCompletionWithResult:v6];

  v7.receiver = self;
  v7.super_class = (Class)SVXServiceCommandTransaction;
  [(SVXServiceCommandTransaction *)&v7 dealloc];
}

- (id)description
{
  id v3 = [NSString alloc];
  v7.receiver = self;
  v7.super_class = (Class)SVXServiceCommandTransaction;
  id v4 = [(SVXServiceCommandTransaction *)&v7 description];
  id v5 = (void *)[v3 initWithFormat:@"%@ {command = %@, handlers = %@, taskTracker = %@}", v4, self->_command, self->_handlers, self->_taskTracker];

  return v5;
}

@end