@interface SVXServiceCommandHandlerUIAddDialogs
+ (Class)supportedCommandClass;
- (BOOL)isCommandUUFR:(id)a3;
- (BOOL)shouldDependOnCommand:(id)a3;
- (NSString)identifier;
- (SVXServiceCommandHandlerUIAddDialogs)initWithHandlers:(id)a3 dialogTransformer:(id)a4;
- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6;
- (void)prepareToHandleCommand:(id)a3 completion:(id)a4;
@end

@implementation SVXServiceCommandHandlerUIAddDialogs

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dialogTransformer, 0);

  objc_storeStrong((id *)&self->_handlersByCommandType, 0);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)handleCommand:(id)a3 withContext:(id)a4 taskTracker:(id)a5 completion:(id)a6
{
  uint64_t v65 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v43 = a5;
  id v39 = a6;
  objc_opt_class();
  v40 = v10;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v38 = [MEMORY[0x263F08690] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIAddDialogs.m", 152, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIAddDialogs class]]" object file lineNumber description];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v11;
  }
  else
  {
    id v12 = [MEMORY[0x263EFF8C0] array];
  }
  v13 = v12;
  v14 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    v37 = v14;
    *(_DWORD *)buf = 136315394;
    v59 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]";
    __int16 v60 = 2048;
    uint64_t v61 = [v13 count];
    _os_log_debug_impl(&dword_220062000, v37, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler retrieved %tu command/context pairs from context", buf, 0x16u);
  }
  v41 = v11;
  v15 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v13, "count"));
  v16 = dispatch_group_create();
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v13;
  uint64_t v17 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v55 != v19) {
          objc_enumerationMutation(obj);
        }
        v21 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        v22 = [v21 command];
        handlersByCommandType = self->_handlersByCommandType;
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        v26 = [(NSDictionary *)handlersByCommandType objectForKey:v25];

        v27 = *MEMORY[0x263F28348];
        v28 = *MEMORY[0x263F28348];
        if (v26)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v59 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]";
            __int16 v60 = 2112;
            uint64_t v61 = (uint64_t)v22;
            _os_log_debug_impl(&dword_220062000, v27, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler delegating command handling for command %@", buf, 0x16u);
          }
          dispatch_group_enter(v16);
          v29 = [v21 context];
          v50[0] = MEMORY[0x263EF8330];
          v50[1] = 3221225472;
          v50[2] = __89__SVXServiceCommandHandlerUIAddDialogs_handleCommand_withContext_taskTracker_completion___block_invoke;
          v50[3] = &unk_264552D70;
          id v51 = v15;
          id v30 = v22;
          id v52 = v30;
          v53 = v16;
          [v26 handleCommand:v30 withContext:v29 taskTracker:v43 completion:v50];

          v31 = v51;
        }
        else
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            v32 = self->_handlersByCommandType;
            *(_DWORD *)buf = 136315650;
            v59 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]";
            __int16 v60 = 2112;
            uint64_t v61 = (uint64_t)v22;
            __int16 v62 = 2112;
            v63 = v32;
            _os_log_error_impl(&dword_220062000, v27, OS_LOG_TYPE_ERROR, "%s AddDialogs could not find an handler for command: %@ with handlers: %@", buf, 0x20u);
          }
          v31 = +[SVXServiceCommandResult resultFailureWithErrorCode:0 reason:@"No appropriate handler for command"];
          [v15 addObject:v31];
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v54 objects:v64 count:16];
    }
    while (v18);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__SVXServiceCommandHandlerUIAddDialogs_handleCommand_withContext_taskTracker_completion___block_invoke_47;
  block[3] = &unk_264554918;
  v46 = v16;
  id v47 = v40;
  id v48 = v15;
  id v49 = v39;
  id v33 = v15;
  id v34 = v39;
  id v35 = v40;
  v36 = v16;
  dispatch_group_notify(v36, MEMORY[0x263EF83A0], block);
}

void __89__SVXServiceCommandHandlerUIAddDialogs_handleCommand_withContext_taskTracker_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) addObject:a2];
  v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 136315394;
    v6 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]_block_invoke";
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_debug_impl(&dword_220062000, v3, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler received a result command handling for command %@", (uint8_t *)&v5, 0x16u);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __89__SVXServiceCommandHandlerUIAddDialogs_handleCommand_withContext_taskTracker_completion___block_invoke_47(void *a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = a1[4];
    uint64_t v4 = a1[5];
    int v7 = 136315650;
    uint64_t v8 = "-[SVXServiceCommandHandlerUIAddDialogs handleCommand:withContext:taskTracker:completion:]_block_invoke";
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    __int16 v11 = 2112;
    uint64_t v12 = v4;
    _os_log_impl(&dword_220062000, v2, OS_LOG_TYPE_INFO, "%s End TTS request group %@ for %@.", (uint8_t *)&v7, 0x20u);
  }
  uint64_t v5 = a1[7];
  if (v5)
  {
    v6 = +[SVXServiceCommandResult resultWithResults:a1[6]];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (void)prepareToHandleCommand:(id)a3 completion:(id)a4
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v28 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v27 = [MEMORY[0x263F08690] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIAddDialogs.m", 97, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIAddDialogs class]]" object file lineNumber description];
  }
  v29 = v7;
  uint64_t v8 = [(SVXDialogTransformer *)self->_dialogTransformer transformAddDialogs:v7];
  __int16 v9 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315394;
    v46 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]";
    __int16 v47 = 2112;
    id v48 = v8;
    _os_log_debug_impl(&dword_220062000, v9, OS_LOG_TYPE_DEBUG, "%s AddDialogs transformed into commands: %@", buf, 0x16u);
  }
  v32 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v8, "count"));
  uint64_t v10 = [MEMORY[0x263EFF980] array];
  group = dispatch_group_create();
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v42;
LABEL_7:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v42 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
      if ([v10 count]) {
        break;
      }
      handlersByCommandType = self->_handlersByCommandType;
      uint64_t v17 = (objc_class *)objc_opt_class();
      uint64_t v18 = NSStringFromClass(v17);
      uint64_t v19 = [(NSDictionary *)handlersByCommandType objectForKey:v18];

      if (v19)
      {
        if (objc_opt_respondsToSelector())
        {
          v20 = *MEMORY[0x263F28348];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v46 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]";
            __int16 v47 = 2112;
            id v48 = v15;
            _os_log_debug_impl(&dword_220062000, v20, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler delegating command handling for command %@", buf, 0x16u);
          }
          dispatch_group_enter(group);
          v37[0] = MEMORY[0x263EF8330];
          v37[1] = 3221225472;
          v37[2] = __74__SVXServiceCommandHandlerUIAddDialogs_prepareToHandleCommand_completion___block_invoke;
          v37[3] = &unk_264552D48;
          v37[4] = v15;
          id v38 = v32;
          id v39 = v10;
          v40 = group;
          [v19 prepareToHandleCommand:v15 completion:v37];
        }
        else
        {
          v22 = [[_AddDialogsContextPair alloc] initWithCommand:v15 context:0];
          [v32 addObject:v22];
        }
      }
      else
      {
        v21 = *MEMORY[0x263F28348];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR))
        {
          v23 = self->_handlersByCommandType;
          *(_DWORD *)buf = 136315650;
          v46 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]";
          __int16 v47 = 2112;
          id v48 = v15;
          __int16 v49 = 2112;
          v50 = v23;
          _os_log_error_impl(&dword_220062000, v21, OS_LOG_TYPE_ERROR, "%s AddDialogs could not find an handler for command: %@ with handlers: %@", buf, 0x20u);
        }
        [v10 addObject:v15];
      }

      if (v12 == ++v14)
      {
        uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v51 count:16];
        if (v12) {
          goto LABEL_7;
        }
        break;
      }
    }
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__SVXServiceCommandHandlerUIAddDialogs_prepareToHandleCommand_completion___block_invoke_39;
  block[3] = &unk_264554788;
  id v34 = v32;
  id v35 = v10;
  id v36 = v28;
  id v24 = v28;
  id v25 = v10;
  id v26 = v32;
  dispatch_group_notify(group, MEMORY[0x263EF83A0], block);
}

void __74__SVXServiceCommandHandlerUIAddDialogs_prepareToHandleCommand_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a3;
  v6 = *MEMORY[0x263F28348];
  id v7 = *MEMORY[0x263F28348];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v12 = 136315394;
      uint64_t v13 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      _os_log_debug_impl(&dword_220062000, v6, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler successfully prepared context for command %@", (uint8_t *)&v12, 0x16u);
    }
    uint64_t v8 = *(void **)(a1 + 40);
    __int16 v9 = [[_AddDialogsContextPair alloc] initWithCommand:*(void *)(a1 + 32) context:v5];
    [v8 addObject:v9];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      int v12 = 136315394;
      uint64_t v13 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]_block_invoke";
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_error_impl(&dword_220062000, v6, OS_LOG_TYPE_ERROR, "%s AddDialogs handler preparing context failed for command %@", (uint8_t *)&v12, 0x16u);
    }
    [*(id *)(a1 + 48) addObject:*(void *)(a1 + 32)];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
}

void __74__SVXServiceCommandHandlerUIAddDialogs_prepareToHandleCommand_completion___block_invoke_39(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 count];
    uint64_t v6 = [*(id *)(a1 + 40) count];
    int v7 = 136315650;
    uint64_t v8 = "-[SVXServiceCommandHandlerUIAddDialogs prepareToHandleCommand:completion:]_block_invoke";
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    __int16 v11 = 2048;
    uint64_t v12 = v6;
    _os_log_debug_impl(&dword_220062000, v4, OS_LOG_TYPE_DEBUG, "%s AddDialogs handler finished preparing commands with %tu command/context pairs and %tu failed commands", (uint8_t *)&v7, 0x20u);
  }
  if (*(void *)(a1 + 48))
  {
    [*(id *)(a1 + 40) count];
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (BOOL)isCommandUUFR:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"SVXServiceCommandHandlerUIAddDialogs.m", 79, @"Invalid parameter not satisfying: %@", @"[command isKindOfClass:[SAUIAddDialogs class]]" object file lineNumber description];
  }
  [(SVXDialogTransformer *)self->_dialogTransformer transformAddDialogs:v5];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        handlersByCommandType = self->_handlersByCommandType;
        uint64_t v13 = (objc_class *)objc_opt_class();
        __int16 v14 = NSStringFromClass(v13);
        uint64_t v15 = [(NSDictionary *)handlersByCommandType objectForKeyedSubscript:v14];

        if (v15 && (objc_opt_respondsToSelector() & 1) != 0 && ([v15 isCommandUUFR:v11] & 1) != 0)
        {

          BOOL v16 = 1;
          goto LABEL_15;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_15:

  return v16;
}

- (BOOL)shouldDependOnCommand:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

- (SVXServiceCommandHandlerUIAddDialogs)initWithHandlers:(id)a3 dialogTransformer:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v31.receiver = self;
  v31.super_class = (Class)SVXServiceCommandHandlerUIAddDialogs;
  uint64_t v8 = [(SVXServiceCommandHandlerUIAddDialogs *)&v31 init];
  if (v8)
  {
    id v26 = v7;
    id v9 = [NSString alloc];
    uint64_t v10 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
    uint64_t v11 = NSStringFromClass(v10);
    uint64_t v12 = [v9 initWithFormat:@"com.apple.SiriVOXService.service-command.%@", v11];
    identifier = v8->_identifier;
    v8->_identifier = (NSString *)v12;

    __int16 v14 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v6, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v15 = v6;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * v19);
          long long v21 = (objc_class *)[(id)objc_opt_class() supportedCommandClass];
          long long v22 = NSStringFromClass(v21);
          [v14 setObject:v20 forKey:v22];

          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v17);
    }

    uint64_t v23 = [v14 copy];
    handlersByCommandType = v8->_handlersByCommandType;
    v8->_handlersByCommandType = (NSDictionary *)v23;

    objc_storeStrong((id *)&v8->_dialogTransformer, a4);
    id v7 = v26;
  }

  return v8;
}

+ (Class)supportedCommandClass
{
  return (Class)objc_opt_class();
}

@end