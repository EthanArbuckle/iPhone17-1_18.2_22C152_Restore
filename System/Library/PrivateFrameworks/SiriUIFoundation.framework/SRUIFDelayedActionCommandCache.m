@interface SRUIFDelayedActionCommandCache
- (SRUIFDelayedActionCommandCache)initWithDelegate:(id)a3;
- (SRUIFDelayedActionCommandCacheDelegate)delegate;
- (id)_commandHandler;
- (void)_invalidateDelayedActionTimer:(id)a3 withKey:(id)a4;
- (void)_performCommandsWithDelayedActionCommand:(id)a3;
- (void)_performDelayedActionCommandTimerAction:(id)a3;
- (void)cancelDelayedActionWithDelayedActionCancelCommand:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)enqueueDelayedActionCommand:(id)a3 completion:(id)a4;
- (void)invalidatePendingCommands;
- (void)performDismissalCommands;
- (void)setDelegate:(id)a3;
@end

@implementation SRUIFDelayedActionCommandCache

- (SRUIFDelayedActionCommandCache)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SRUIFDelayedActionCommandCache;
  v5 = [(SRUIFDelayedActionCommandCache *)&v11 init];
  if (v5)
  {
    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    delayedActionTimersByIdentifier = v5->_delayedActionTimersByIdentifier;
    v5->_delayedActionTimersByIdentifier = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    dismissalDelayedActionCommandsByIdentifier = v5->_dismissalDelayedActionCommandsByIdentifier;
    v5->_dismissalDelayedActionCommandsByIdentifier = v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)dealloc
{
  [(SRUIFDelayedActionCommandCache *)self invalidatePendingCommands];
  v3.receiver = self;
  v3.super_class = (Class)SRUIFDelayedActionCommandCache;
  [(SRUIFDelayedActionCommandCache *)&v3 dealloc];
}

- (void)enqueueDelayedActionCommand:(id)a3 completion:(id)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = (os_log_t *)MEMORY[0x263F28348];
  v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v34 = "-[SRUIFDelayedActionCommandCache enqueueDelayedActionCommand:completion:]";
    _os_log_impl(&dword_225FBA000, v9, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  v10 = [v6 aceId];
  objc_super v11 = [v6 timerValue];

  if (v11)
  {
    v12 = [v6 timerValue];
    [v12 doubleValue];
    double v14 = v13 / 1000.0;

    os_log_t v15 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v16 = v15;
      v17 = [v6 commands];
      *(_DWORD *)buf = 136315906;
      v34 = "-[SRUIFDelayedActionCommandCache enqueueDelayedActionCommand:completion:]";
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2048;
      double v38 = v14;
      __int16 v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_225FBA000, v16, OS_LOG_TYPE_DEFAULT, "%s Enqueue delayed action command: %@, delay: %f, commands: %@", buf, 0x2Au);
    }
    id v18 = objc_alloc(MEMORY[0x263F28180]);
    v19 = [MEMORY[0x263F08AB0] processInfo];
    uint64_t v20 = [v19 processIdentifier];
    v21 = NSString;
    v22 = [v6 aceId];
    v23 = [v21 stringWithFormat:@"SiriDelayedActionCommandAssertion-%@", v22];
    v24 = (void *)[v18 initWithPID:v20 flags:1 reason:4 name:v23 withHandler:0];

    v25 = (void *)MEMORY[0x263EFFA20];
    v26 = [[_SRUIFAssertingDelayedActionCommand alloc] initWithCommand:v6 assertion:v24];
    v27 = [v25 scheduledTimerWithTimeInterval:self target:sel__performDelayedActionCommandTimerAction_ selector:v26 userInfo:0 repeats:v14];

    [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier setObject:v27 forKey:v10];
  }
  else
  {
    os_log_t v28 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = [v6 commands];
      *(_DWORD *)buf = 136315650;
      v34 = "-[SRUIFDelayedActionCommandCache enqueueDelayedActionCommand:completion:]";
      __int16 v35 = 2112;
      id v36 = v6;
      __int16 v37 = 2112;
      double v38 = *(double *)&v30;
      _os_log_impl(&dword_225FBA000, v29, OS_LOG_TYPE_DEFAULT, "%s Enqueue dismissal action command: %@, commands: %@", buf, 0x20u);
    }
    [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier setObject:v6 forKey:v10];
  }
  id v31 = objc_alloc_init(MEMORY[0x263F64830]);
  v32 = [v6 aceId];
  [v31 setRefId:v32];

  if (v7) {
    v7[2](v7, v31);
  }
}

- (void)cancelDelayedActionWithDelayedActionCancelCommand:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    v16 = "-[SRUIFDelayedActionCommandCache cancelDelayedActionWithDelayedActionCancelCommand:completion:]";
    _os_log_impl(&dword_225FBA000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  v9 = [v6 delayedActionAceId];
  v10 = [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier objectForKey:v9];
  if (v10)
  {
    [(SRUIFDelayedActionCommandCache *)self _invalidateDelayedActionTimer:v10 withKey:v9];
    id v11 = objc_alloc_init(MEMORY[0x263F64830]);
  }
  else
  {
    v12 = [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier objectForKey:v9];
    if (v12)
    {
      [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier removeObjectForKey:v9];
      double v13 = (Class *)0x263F64830;
    }
    else
    {
      double v13 = (Class *)0x263F64820;
    }
    id v11 = objc_alloc_init(*v13);
  }
  double v14 = [v6 aceId];
  [v11 setRefId:v14];

  if (v7) {
    v7[2](v7, v11);
  }
}

- (void)_performDelayedActionCommandTimerAction:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (os_log_t *)MEMORY[0x263F28348];
  id v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315138;
    int v15 = "-[SRUIFDelayedActionCommandCache _performDelayedActionCommandTimerAction:]";
    _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v14, 0xCu);
  }
  v7 = [v4 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v7;
    v9 = [v8 command];
    [(SRUIFDelayedActionCommandCache *)self _performCommandsWithDelayedActionCommand:v9];
    delayedActionTimersByIdentifier = self->_delayedActionTimersByIdentifier;
    id v11 = [v9 aceId];
    [(NSMutableDictionary *)delayedActionTimersByIdentifier removeObjectForKey:v11];

    v12 = [v8 assertion];
    double v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315650;
      int v15 = "-[SRUIFDelayedActionCommandCache _performDelayedActionCommandTimerAction:]";
      __int16 v16 = 2112;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_225FBA000, v13, OS_LOG_TYPE_DEFAULT, "%s Invalidating assertion: %@ for delayed action command: %@", (uint8_t *)&v14, 0x20u);
    }
    [v12 invalidate];
  }
  [v4 invalidate];
}

- (void)invalidatePendingCommands
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[SRUIFDelayedActionCommandCache invalidatePendingCommands]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  id v4 = [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier allKeys];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier objectForKey:v9];
        if (v10) {
          [(SRUIFDelayedActionCommandCache *)self _invalidateDelayedActionTimer:v10 withKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (void)_invalidateDelayedActionTimer:(id)a3 withKey:(id)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = (NSObject **)MEMORY[0x263F28348];
  uint64_t v9 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    long long v11 = [v6 userInfo];
    int v18 = 136315394;
    v19 = "-[SRUIFDelayedActionCommandCache _invalidateDelayedActionTimer:withKey:]";
    __int16 v20 = 2112;
    v21 = v11;
    _os_log_impl(&dword_225FBA000, v10, OS_LOG_TYPE_DEFAULT, "%s Invalidating delayed action timer with userInfo: %@", (uint8_t *)&v18, 0x16u);
  }
  long long v12 = [v6 userInfo];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v13 = v12;
    long long v14 = [v13 assertion];
    int v15 = *v8;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v16 = v15;
      uint64_t v17 = [v13 command];
      int v18 = 136315650;
      v19 = "-[SRUIFDelayedActionCommandCache _invalidateDelayedActionTimer:withKey:]";
      __int16 v20 = 2112;
      v21 = v14;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_225FBA000, v16, OS_LOG_TYPE_DEFAULT, "%s Invalidating assertion: %@ for delayed action command: %@", (uint8_t *)&v18, 0x20u);
    }
    [v14 invalidate];
  }
  [v6 invalidate];

  [(NSMutableDictionary *)self->_delayedActionTimersByIdentifier removeObjectForKey:v7];
}

- (void)performDismissalCommands
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v17 = "-[SRUIFDelayedActionCommandCache performDismissalCommands]";
    _os_log_impl(&dword_225FBA000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  id v4 = [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier allKeys];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier objectForKey:v9];
        if (v10)
        {
          [(SRUIFDelayedActionCommandCache *)self _performCommandsWithDelayedActionCommand:v10];
          [(NSMutableDictionary *)self->_dismissalDelayedActionCommandsByIdentifier removeObjectForKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (id)_commandHandler
{
  id v2 = objc_alloc_init(MEMORY[0x263F28460]);
  return v2;
}

- (void)_performCommandsWithDelayedActionCommand:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v5;
    uint64_t v7 = [v4 commands];
    *(_DWORD *)buf = 136315650;
    __int16 v20 = "-[SRUIFDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]";
    __int16 v21 = 2112;
    id v22 = v4;
    __int16 v23 = 2112;
    uint64_t v24 = v7;
    _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_DEFAULT, "%s Performing delayed action command: %@ with commands: %@", buf, 0x20u);
  }
  id v8 = [(SRUIFDelayedActionCommandCache *)self _commandHandler];
  id v9 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  objc_initWeak((id *)buf, self);
  v10 = [v4 commands];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke;
  v14[3] = &unk_264785DF8;
  id v11 = v8;
  id v15 = v11;
  id v12 = v9;
  id v16 = v12;
  id v13 = v4;
  id v17 = v13;
  objc_copyWeak(&v18, (id *)buf);
  [v10 enumerateObjectsUsingBlock:v14];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    uint64_t v5 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_2;
    v12[3] = &unk_264785D80;
    id v13 = v4;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_32;
    v7[3] = &unk_264785DD0;
    id v6 = v13;
    id v8 = v6;
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    objc_copyWeak(&v11, (id *)(a1 + 56));
    [v5 handleCommand:v6 commandHandler:v12 completion:v7];
    objc_destroyWeak(&v11);
  }
}

void __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 136315650;
    uint64_t v7 = "-[SRUIFDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke_2";
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_225FBA000, v4, OS_LOG_TYPE_INFO, "%s Received response for delayed command: %@, response: %@", (uint8_t *)&v6, 0x20u);
  }
}

void __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_32(id *a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = *MEMORY[0x263F28348];
  uint64_t v7 = *MEMORY[0x263F28348];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = a1[4];
      *(_DWORD *)buf = 136315394;
      id v15 = "-[SRUIFDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke";
      __int16 v16 = 2112;
      id v17 = v8;
      _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_INFO, "%s Delayed command succeeded: %@", buf, 0x16u);
    }
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_33;
    v9[3] = &unk_264785DA8;
    id v10 = a1[5];
    id v11 = a1[4];
    id v12 = a1[6];
    objc_copyWeak(&v13, a1 + 7);
    dispatch_async(MEMORY[0x263EF83A0], v9);
    objc_destroyWeak(&v13);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_32_cold_1((uint64_t)a1, (uint64_t)v5, v6);
  }
}

void __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_33(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = [*(id *)(a1 + 32) count];
  id v3 = [*(id *)(a1 + 48) commands];
  uint64_t v4 = [v3 count];

  if (v2 == v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      int v6 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = *(void *)(a1 + 48);
        int v9 = 136315394;
        id v10 = "-[SRUIFDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke";
        __int16 v11 = 2112;
        uint64_t v12 = v7;
        _os_log_impl(&dword_225FBA000, v6, OS_LOG_TYPE_INFO, "%s Successfully handled all commands for %@", (uint8_t *)&v9, 0x16u);
      }
      id v8 = [WeakRetained delegate];
      [v8 commandCache:WeakRetained didSuccessfullyHandleCommandsInDelayedActionCommand:*(void *)(a1 + 48)];
    }
  }
}

- (SRUIFDelayedActionCommandCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SRUIFDelayedActionCommandCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dismissalDelayedActionCommandsByIdentifier, 0);
  objc_storeStrong((id *)&self->_delayedActionTimersByIdentifier, 0);
}

void __75__SRUIFDelayedActionCommandCache__performCommandsWithDelayedActionCommand___block_invoke_32_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  id v5 = "-[SRUIFDelayedActionCommandCache _performCommandsWithDelayedActionCommand:]_block_invoke";
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_225FBA000, log, OS_LOG_TYPE_ERROR, "%s Delayed command failed: %@ with error: %@", (uint8_t *)&v4, 0x20u);
}

@end