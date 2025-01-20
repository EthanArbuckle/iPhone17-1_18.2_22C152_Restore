@interface TIKeyboardInputManagerLoader
+ (id)sharedLoader;
- (BOOL)hasActiveInputManagers;
- (BOOL)isActiveInputManager:(id)a3;
- (NSXPCConnection)interactingConnection;
- (TIKeyboardInputManagerLoader)init;
- (id)activeInputModeIdentifiers;
- (id)currentLoadedInputModes;
- (id)inputManagerForInputMode:(id)a3 withKeyboardState:(id)a4 class:(Class)a5;
- (void)cacheInputManager:(id)a3 switchingToInputMode:(id)a4;
- (void)dealloc;
- (void)prepareForKeyboardActivity;
- (void)prepareForKeyboardInactivity;
- (void)reduceInputManagerCacheToSize:(int)a3 switchingToInputMode:(id)a4;
- (void)registerMaintenanceActivity;
- (void)releaseAllInputManagers;
- (void)releaseAllLanguageModelBuffers;
- (void)removeInputModeFromAllContainers:(id)a3;
- (void)setInteractingConnection:(id)a3;
- (void)startSyncHelper;
@end

@implementation TIKeyboardInputManagerLoader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeInputManagers, 0);
  objc_storeStrong((id *)&self->_lastUsedDate, 0);
  objc_storeStrong((id *)&self->_availableInputManagers, 0);

  objc_storeStrong((id *)&self->_helper, 0);
}

- (void)setInteractingConnection:(id)a3
{
  self->_interactingConnection = (NSXPCConnection *)a3;
}

- (NSXPCConnection)interactingConnection
{
  return self->_interactingConnection;
}

- (void)registerMaintenanceActivity
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (TICanLogMessageAtLevel_onceToken != -1) {
    dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
  }
  v3 = TIOSLogFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(NSString, "stringWithFormat:", @"%s Preparing for %s activity", "-[TIKeyboardInputManagerLoader registerMaintenanceActivity]", "com.apple.textinput.keyboardmaintenance");
    *(_DWORD *)buf = 138412290;
    v8 = v5;
    _os_log_debug_impl(&dword_1E3F0E000, v3, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
  }
  v4 = (void *)*MEMORY[0x1E4F14158];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __59__TIKeyboardInputManagerLoader_registerMaintenanceActivity__block_invoke;
  handler[3] = &unk_1E6E2CF68;
  handler[4] = self;
  xpc_activity_register("com.apple.textinput.keyboardmaintenance", v4, handler);
}

void __59__TIKeyboardInputManagerLoader_registerMaintenanceActivity__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = a2;
  xpc_activity_state_t state = xpc_activity_get_state(v2);
  if (state == 2)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v6 = TIOSLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s Running %s activity", "-[TIKeyboardInputManagerLoader registerMaintenanceActivity]_block_invoke", "com.apple.textinput.keyboardmaintenance");
      *(_DWORD *)buf = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    TIDispatchSync();
  }
  else if (!state)
  {
    if (TICanLogMessageAtLevel_onceToken != -1) {
      dispatch_once(&TICanLogMessageAtLevel_onceToken, &__block_literal_global_23827);
    }
    v4 = TIOSLogFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s Checking in activity %s", "-[TIKeyboardInputManagerLoader registerMaintenanceActivity]_block_invoke", "com.apple.textinput.keyboardmaintenance");
      *(_DWORD *)buf = 138412290;
      v10 = v7;
      _os_log_debug_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }
    xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F142F8], 1);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141C8], *MEMORY[0x1E4F141E8]);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F14170], *MEMORY[0x1E4F141D8]);
    xpc_dictionary_set_int64(v5, (const char *)*MEMORY[0x1E4F141A8], *MEMORY[0x1E4F141F8]);
    xpc_dictionary_set_string(v5, (const char *)*MEMORY[0x1E4F142C8], (const char *)*MEMORY[0x1E4F142E0]);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14340], 1);
    xpc_dictionary_set_BOOL(v5, (const char *)*MEMORY[0x1E4F14320], 1);
    xpc_activity_set_criteria(v2, v5);
  }
}

uint64_t __59__TIKeyboardInputManagerLoader_registerMaintenanceActivity__block_invoke_28(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 32) enumerateKeysAndObjectsUsingBlock:&__block_literal_global_30];
}

uint64_t __59__TIKeyboardInputManagerLoader_registerMaintenanceActivity__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 runMaintenanceTask];
}

- (id)activeInputModeIdentifiers
{
  v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_activeInputManagers, "count"));
  activeInputManagers = self->_activeInputManagers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__TIKeyboardInputManagerLoader_activeInputModeIdentifiers__block_invoke;
  v7[3] = &unk_1E6E2CF40;
  id v5 = v3;
  id v8 = v5;
  [(NSMutableDictionary *)activeInputManagers enumerateKeysAndObjectsUsingBlock:v7];

  return v5;
}

uint64_t __58__TIKeyboardInputManagerLoader_activeInputModeIdentifiers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = [a3 currentInputModeIdentifier];
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v7 = v4;
    uint64_t v4 = [*(id *)(a1 + 32) addObject:v4];
    uint64_t v5 = v7;
  }

  return MEMORY[0x1F41817F8](v4, v5);
}

- (BOOL)isActiveInputManager:(id)a3
{
  activeInputManagers = self->_activeInputManagers;
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)activeInputManagers allValues];
  char v6 = [v5 containsObject:v4];

  return v6;
}

- (BOOL)hasActiveInputManagers
{
  return [(NSMutableDictionary *)self->_activeInputManagers count] != 0;
}

- (id)currentLoadedInputModes
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  availableInputManagers = self->_availableInputManagers;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __55__TIKeyboardInputManagerLoader_currentLoadedInputModes__block_invoke;
  v15[3] = &unk_1E6E2CF40;
  id v5 = v3;
  id v16 = v5;
  [(NSMutableDictionary *)availableInputManagers enumerateKeysAndObjectsUsingBlock:v15];
  activeInputManagers = self->_activeInputManagers;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __55__TIKeyboardInputManagerLoader_currentLoadedInputModes__block_invoke_2;
  v13 = &unk_1E6E2CF40;
  id v14 = v5;
  id v7 = v5;
  [(NSMutableDictionary *)activeInputManagers enumerateKeysAndObjectsUsingBlock:&v10];
  id v8 = objc_msgSend(v7, "allObjects", v10, v11, v12, v13);

  return v8;
}

void __55__TIKeyboardInputManagerLoader_currentLoadedInputModes__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a3 resourceInputModes];
  [v3 addObjectsFromArray:v4];
}

void __55__TIKeyboardInputManagerLoader_currentLoadedInputModes__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = *(void **)(a1 + 32);
  id v4 = [a3 resourceInputModes];
  [v3 addObjectsFromArray:v4];
}

- (void)prepareForKeyboardActivity
{
}

uint64_t __58__TIKeyboardInputManagerLoader_prepareForKeyboardActivity__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 prepareForKeyboardActivity];
}

- (void)prepareForKeyboardInactivity
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E10] mapTableWithKeyOptions:0 valueOptions:0];
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  availableInputManagers = self->_availableInputManagers;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__TIKeyboardInputManagerLoader_prepareForKeyboardInactivity__block_invoke;
  v8[3] = &unk_1E6E2CEF0;
  id v5 = v3;
  id v9 = v5;
  uint64_t v10 = v11;
  [(NSMutableDictionary *)availableInputManagers enumerateKeysAndObjectsUsingBlock:v8];
  char v6 = self->_availableInputManagers;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__TIKeyboardInputManagerLoader_prepareForKeyboardInactivity__block_invoke_2;
  v7[3] = &unk_1E6E2CF18;
  void v7[4] = v11;
  [(NSMutableDictionary *)v6 enumerateKeysAndObjectsUsingBlock:v7];
  if (getExcessMemoryInBytes())
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[TIKeyboardInputManagerLoader prepareForKeyboardInactivity]";
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  kbd is already over inactive limit, hard-resetting all language models (including advanced ones)", buf, 0xCu);
    }
    [(TIKeyboardInputManagerLoader *)self releaseAllLanguageModelBuffers];
  }

  _Block_object_dispose(v11, 8);
}

void __60__TIKeyboardInputManagerLoader_prepareForKeyboardInactivity__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [v4 isHighMemoryManager];
  unsigned int v6 = v5;
  id v7 = *(void **)(a1 + 32);
  id v8 = [NSNumber numberWithBool:v5];
  [v7 setObject:v8 forKey:v4];

  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v6;
}

void __60__TIKeyboardInputManagerLoader_prepareForKeyboardInactivity__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  unsigned int v6 = a3;
  id v7 = v6;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) == 1
    && [v6 isHighMemoryManager])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[TIKeyboardInputManagerLoader prepareForKeyboardInactivity]_block_invoke_2";
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Input manager %@ is loading advanced model, and there is only one Input Manager loading advanced models", (uint8_t *)&v10, 0x16u);
    }
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 2;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = off_1E6E2D378[v8];
    int v10 = 136315650;
    uint64_t v11 = "-[TIKeyboardInputManagerLoader prepareForKeyboardInactivity]_block_invoke";
    __int16 v12 = 2080;
    v13 = v9;
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_1E3F0E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "%s  Issuing %s to %@ to prepare for Keyboard Inactivity", (uint8_t *)&v10, 0x20u);
  }
  [v7 prepareForKeyboardInactivity:v8];
}

- (void)reduceInputManagerCacheToSize:(int)a3 switchingToInputMode:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  unsigned int v6 = [(NSMutableDictionary *)self->_availableInputManagers allKeys];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __83__TIKeyboardInputManagerLoader_reduceInputManagerCacheToSize_switchingToInputMode___block_invoke;
  v49[3] = &unk_1E6E2CEC8;
  v49[4] = self;
  id v7 = [v6 sortedArrayUsingComparator:v49];

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v45 objects:v57 count:16];
  id v40 = v5;
  if (v9)
  {
    uint64_t v10 = v9;
    id v11 = 0;
    uint64_t v12 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v46 != v12) {
          objc_enumerationMutation(v8);
        }
        id v14 = *(id *)(*((void *)&v45 + 1) + 8 * i);
        v15 = [(NSMutableDictionary *)self->_availableInputManagers objectForKeyedSubscript:v14];
        if ([v15 isHighMemoryManager])
        {
          if (v11)
          {
            if (v14 != v5)
            {
              uint64_t v16 = TIInputManagerOSLogFacility();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                v17 = [v14 normalizedIdentifier];
                int v18 = [v14 isSiriMode];
                *(_DWORD *)buf = 136315650;
                v52 = "-[TIKeyboardInputManagerLoader reduceInputManagerCacheToSize:switchingToInputMode:]";
                __int16 v53 = 2114;
                v54 = v17;
                __int16 v55 = 1024;
                int v56 = v18;
                _os_log_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEFAULT, "%s  Removing inputManager from cache for inputMode %{public}@ isSiriMode: %d", buf, 0x1Cu);

                id v5 = v40;
              }

              [(TIKeyboardInputManagerLoader *)self removeInputModeFromAllContainers:v14];
            }
          }
          else
          {
            id v11 = v15;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v45 objects:v57 count:16];
    }
    while (v10);
  }
  else
  {
    id v11 = 0;
  }

  if ([(NSMutableDictionary *)self->_availableInputManagers count] > (unint64_t)a3)
  {
    int v19 = [v8 count];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id obj = [v8 reverseObjectEnumerator];
    uint64_t v20 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      int v22 = 0;
      int v23 = v19 - a3;
      uint64_t v24 = *(void *)v42;
      BOOL v26 = a3 == 1 && v40 != 0;
      BOOL v39 = v26;
      int v36 = v19 - a3;
      while (2)
      {
        uint64_t v27 = 0;
        uint64_t v37 = v21;
        do
        {
          if (*(void *)v42 != v24) {
            objc_enumerationMutation(obj);
          }
          id v28 = *(id *)(*((void *)&v41 + 1) + 8 * v27);
          v29 = [(NSMutableDictionary *)self->_availableInputManagers objectForKeyedSubscript:v28];
          v30 = v29;
          if (v28 != v40 && (v39 || ([v29 isHighMemoryManager] & 1) == 0))
          {
            uint64_t v31 = v24;
            v32 = TIInputManagerOSLogFacility();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              v33 = [v28 normalizedIdentifier];
              *(_DWORD *)buf = 136315394;
              v52 = "-[TIKeyboardInputManagerLoader reduceInputManagerCacheToSize:switchingToInputMode:]";
              __int16 v53 = 2114;
              v54 = v33;
              _os_log_impl(&dword_1E3F0E000, v32, OS_LOG_TYPE_DEFAULT, "%s  Removing inputManager from cache for inputMode %{public}@", buf, 0x16u);

              int v23 = v36;
            }

            [(TIKeyboardInputManagerLoader *)self removeInputModeFromAllContainers:v28];
            ++v22;
            uint64_t v24 = v31;
            uint64_t v21 = v37;
            if (v22 >= v23)
            {

              goto LABEL_39;
            }
          }

          ++v27;
        }
        while (v21 != v27);
        uint64_t v21 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
        if (v21) {
          continue;
        }
        break;
      }
    }
LABEL_39:

    id v5 = v40;
    if (!a3)
    {
      v34 = TIInputManagerOSLogFacility();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v52 = "-[TIKeyboardInputManagerLoader reduceInputManagerCacheToSize:switchingToInputMode:]";
        _os_log_impl(&dword_1E3F0E000, v34, OS_LOG_TYPE_DEFAULT, "%s  Received cache size is 0, unwiring all language models", buf, 0xCu);
      }

      +[TILanguageModelLoaderManager unwireAllLanguageModelMemory];
    }
  }
}

uint64_t __83__TIKeyboardInputManagerLoader_reduceInputManagerCacheToSize_switchingToInputMode___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 24);
  id v6 = a2;
  id v7 = [v5 objectForKey:a3];
  id v8 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

- (void)releaseAllInputManagers
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [(NSMutableDictionary *)self->_availableInputManagers allKeys];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        uint64_t v9 = TIInputManagerOSLogFacility();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v10 = [v8 normalizedIdentifier];
          *(_DWORD *)buf = 136315394;
          uint64_t v16 = "-[TIKeyboardInputManagerLoader releaseAllInputManagers]";
          __int16 v17 = 2114;
          int v18 = v10;
          _os_log_impl(&dword_1E3F0E000, v9, OS_LOG_TYPE_DEFAULT, "%s  removing inputManager from cache for inputMode %{public}@", buf, 0x16u);
        }
        [(TIKeyboardInputManagerLoader *)self removeInputModeFromAllContainers:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v19 count:16];
    }
    while (v5);
  }
}

- (void)releaseAllLanguageModelBuffers
{
}

uint64_t __62__TIKeyboardInputManagerLoader_releaseAllLanguageModelBuffers__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 prepareForKeyboardInactivity:2];
}

- (void)cacheInputManager:(id)a3 switchingToInputMode:(id)a4
{
  id v21 = a3;
  id v6 = a4;
  if (v21)
  {
    [v21 suspend];
    id v7 = [v21 inputMode];

    if (v7)
    {
      BOOL v8 = [(TIKeyboardInputManagerLoaderSyncHelper *)self->_helper shouldCacheObject:v21];
      activeInputManagers = self->_activeInputManagers;
      uint64_t v10 = [v21 inputMode];
      id v11 = [(NSMutableDictionary *)activeInputManagers objectForKey:v10];

      if (v11 == v21)
      {
        long long v12 = self->_activeInputManagers;
        long long v13 = [v21 inputMode];
        [(NSMutableDictionary *)v12 removeObjectForKey:v13];
      }
      else
      {
        BOOL v8 = 0;
      }
      if (self->_helper && !v8) {
        goto LABEL_14;
      }
      availableInputManagers = self->_availableInputManagers;
      v15 = [v21 inputMode];
      [(NSMutableDictionary *)availableInputManagers setObject:v21 forKey:v15];

      if ([v21 hasHandledInput])
      {
        uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
        if (!v16) {
          goto LABEL_12;
        }
      }
      else
      {
        lastUsedDate = self->_lastUsedDate;
        int v18 = [v21 inputMode];
        uint64_t v16 = [(NSMutableDictionary *)lastUsedDate objectForKey:v18];

        if (!v16)
        {
LABEL_12:
          uint64_t v16 = [MEMORY[0x1E4F1C9C8] distantPast];
        }
      }
      int v19 = self->_lastUsedDate;
      uint64_t v20 = [v21 inputMode];
      [(NSMutableDictionary *)v19 setObject:v16 forKey:v20];

      [(TIKeyboardInputManagerLoader *)self reduceInputManagerCacheToSize:4 switchingToInputMode:v6];
LABEL_14:
    }
  }
}

- (id)inputManagerForInputMode:(id)a3 withKeyboardState:(id)a4 class:(Class)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [(NSMutableDictionary *)self->_availableInputManagers objectForKey:v8];
  [(NSMutableDictionary *)self->_availableInputManagers removeObjectForKey:v8];
  if (v10
    && [v10 isMemberOfClass:a5]
    && ([v10 inputMode],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = [v11 isEqual:v8],
        v11,
        (v12 & 1) != 0))
  {
    long long v13 = TIInputManagerOSLogFacility();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315394;
      int v22 = "-[TIKeyboardInputManagerLoader inputManagerForInputMode:withKeyboardState:class:]";
      __int16 v23 = 2114;
      id v24 = v8;
      _os_log_impl(&dword_1E3F0E000, v13, OS_LOG_TYPE_DEFAULT, "%s  Reusing existing input manager for input mode %{public}@", (uint8_t *)&v21, 0x16u);
    }
  }
  else
  {

    helper = self->_helper;
    v15 = [v8 languageWithRegion];
    [(TIKeyboardInputManagerLoaderSyncHelper *)helper willLoadLanguage:v15];

    uint64_t v16 = TIInputManagerOSLogFacility();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v17 = NSStringFromClass(a5);
      int v21 = 136315650;
      int v22 = "-[TIKeyboardInputManagerLoader inputManagerForInputMode:withKeyboardState:class:]";
      __int16 v23 = 2114;
      id v24 = v17;
      __int16 v25 = 2114;
      id v26 = v8;
      _os_log_impl(&dword_1E3F0E000, v16, OS_LOG_TYPE_DEFAULT, "%s  Initializing new input manager with class %{public}@ for input mode %{public}@", (uint8_t *)&v21, 0x20u);
    }
    uint64_t v10 = (void *)[[a5 alloc] initWithInputMode:v8 keyboardState:v9];
    int v18 = self->_helper;
    long long v13 = [v10 inputMode];
    int v19 = [v13 languageWithRegion];
    [(TIKeyboardInputManagerLoaderSyncHelper *)v18 noteObject:v10 forLanguage:v19];
  }
  [(NSMutableDictionary *)self->_activeInputManagers setObject:v10 forKey:v8];
  [v10 resume];

  return v10;
}

- (void)startSyncHelper
{
  if (!self->_helper)
  {
    if (TIGetEnableUserWordSyncingValue_onceToken != -1) {
      dispatch_once(&TIGetEnableUserWordSyncingValue_onceToken, &__block_literal_global_69);
    }
    v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    uint64_t v4 = [v3 valueForPreferenceKey:@"EnableUserWordSyncing"];

    LODWORD(v3) = [v4 BOOLValue];
    if (v3)
    {
      objc_initWeak(&location, self);
      uint64_t v5 = (TIKeyboardInputManagerLoaderSyncHelper *)objc_opt_new();
      helper = self->_helper;
      self->_helper = v5;

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __47__TIKeyboardInputManagerLoader_startSyncHelper__block_invoke;
      v7[3] = &unk_1E6E2CE80;
      objc_copyWeak(&v8, &location);
      [(TIKeyboardInputManagerLoaderSyncHelper *)self->_helper setLanguageUpdated:v7];
      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }
}

void __47__TIKeyboardInputManagerLoader_startSyncHelper__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = WeakRetained[2];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          char v12 = objc_msgSend(v11, "languageWithRegion", (void)v14);
          int v13 = [v12 isEqualToString:v3];

          if (v13) {
            [v5 addObject:v11];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [WeakRetained[2] removeObjectsForKeys:v5];
    [WeakRetained[3] removeObjectsForKeys:v5];
  }
}

- (void)removeInputModeFromAllContainers:(id)a3
{
  availableInputManagers = self->_availableInputManagers;
  id v5 = a3;
  [(NSMutableDictionary *)availableInputManagers removeObjectForKey:v5];
  [(NSMutableDictionary *)self->_activeInputManagers removeObjectForKey:v5];
  [(NSMutableDictionary *)self->_lastUsedDate removeObjectForKey:v5];
}

- (void)dealloc
{
  self->_interactingConnection = 0;
  v2.receiver = self;
  v2.super_class = (Class)TIKeyboardInputManagerLoader;
  [(TIKeyboardInputManagerLoader *)&v2 dealloc];
}

- (TIKeyboardInputManagerLoader)init
{
  v10.receiver = self;
  v10.super_class = (Class)TIKeyboardInputManagerLoader;
  objc_super v2 = [(TIKeyboardInputManagerLoader *)&v10 init];
  if (v2)
  {
    id v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    availableInputManagers = v2->_availableInputManagers;
    v2->_availableInputManagers = v3;

    id v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    lastUsedDate = v2->_lastUsedDate;
    v2->_lastUsedDate = v5;

    uint64_t v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    activeInputManagers = v2->_activeInputManagers;
    v2->_activeInputManagers = v7;

    v2->_interactingConnection = 0;
  }
  return v2;
}

+ (id)sharedLoader
{
  if (sharedLoader_onceToken != -1) {
    dispatch_once(&sharedLoader_onceToken, &__block_literal_global_16382);
  }
  objc_super v2 = (void *)sharedLoader_loader;

  return v2;
}

uint64_t __44__TIKeyboardInputManagerLoader_sharedLoader__block_invoke()
{
  v0 = objc_alloc_init(TIKeyboardInputManagerLoader);
  uint64_t v1 = sharedLoader_loader;
  sharedLoader_loader = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end