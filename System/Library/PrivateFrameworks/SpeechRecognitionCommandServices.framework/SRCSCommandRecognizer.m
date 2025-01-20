@interface SRCSCommandRecognizer
- (BOOL)active;
- (SRCSCommandRecognizer)initWithCommandRecognitionSystem:(id)a3 commandIdentifiers:(id)a4;
- (SRCSCommandRecognizer)initWithCommandRecognitionSystem:(id)a3 spokenCommands:(id)a4;
- (id)commandRecognitionSystem;
- (id)spokenCommands;
- (void)setActive:(BOOL)a3;
@end

@implementation SRCSCommandRecognizer

- (SRCSCommandRecognizer)initWithCommandRecognitionSystem:(id)a3 commandIdentifiers:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = objc_opt_new();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v22 + 1) + 8 * v13);
        v15 = [SRCSSpokenCommand alloc];
        uint64_t v16 = -[SRCSSpokenCommand initWithIdentifier:](v15, "initWithIdentifier:", v14, (void)v22);
        if (!v16)
        {
          v19 = SRCSLogGeneral();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v27 = v14;
            _os_log_impl(&dword_23AB39000, v19, OS_LOG_TYPE_DEFAULT, "Error, could not create command %@!", buf, 0xCu);
          }

          v18 = 0;
          goto LABEL_13;
        }
        v17 = (void *)v16;
        [v8 addObject:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  self = [(SRCSCommandRecognizer *)self initWithCommandRecognitionSystem:v6 spokenCommands:v8];
  v18 = self;
LABEL_13:
  v20 = v18;

  return v20;
}

- (SRCSCommandRecognizer)initWithCommandRecognitionSystem:(id)a3 spokenCommands:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SRCSCommandRecognizer;
  v8 = [(SRCSCommandRecognizer *)&v23 init];
  id v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_commandRecognitionSystem, v6);
    objc_storeStrong((id *)&v9->_spokenCommands, a4);
    if (initWithCommandRecognitionSystem_spokenCommands__staticInitialization != -1) {
      dispatch_once(&initWithCommandRecognitionSystem_spokenCommands__staticInitialization, &__block_literal_global_4);
    }
    [v6 addRecognizer:v9];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v10 = v9->_spokenCommands;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * i) setCommandRecognizer:v9];
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v19 objects:v24 count:16];
      }
      while (v12);
    }

    v15 = dispatch_get_global_queue(9, 0);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __73__SRCSCommandRecognizer_initWithCommandRecognitionSystem_spokenCommands___block_invoke_2;
    block[3] = &unk_264DC9888;
    v18 = v9;
    dispatch_async(v15, block);
  }
  return v9;
}

void __73__SRCSCommandRecognizer_initWithCommandRecognitionSystem_spokenCommands___block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  if (WeakRetained)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = objc_msgSend(*(id *)(a1 + 32), "spokenCommands", 0);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = (id)[*(id *)(*((void *)&v9 + 1) + 8 * i) fstGrammar];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
  else
  {
    v3 = SRCSLogGeneral();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __73__SRCSCommandRecognizer_initWithCommandRecognitionSystem_spokenCommands___block_invoke_2_cold_1(v3);
    }
  }
}

- (id)spokenCommands
{
  return self->_spokenCommands;
}

- (id)commandRecognitionSystem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_commandRecognitionSystem);
  return WeakRetained;
}

- (BOOL)active
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_commandRecognitionSystem);
  objc_storeStrong((id *)&self->_spokenCommands, 0);
}

void __73__SRCSCommandRecognizer_initWithCommandRecognitionSystem_spokenCommands___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_23AB39000, log, OS_LOG_TYPE_DEBUG, "SRCSCommandRecognitionSystem has been destroyed while attempting to  process on the background thread, skipping caching of fstGrammars", v1, 2u);
}

@end