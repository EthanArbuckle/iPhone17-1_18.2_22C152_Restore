@interface SUCoreConfig
- (BOOL)getBoolConfigForKey:(id)a3;
- (BOOL)getBoolConfigForKey:(id)a3 defaultValue:(BOOL)a4;
- (NSString)defaultsPath;
- (NSString)projectName;
- (OS_dispatch_queue)accessQueue;
- (SUCoreConfig)initWithProjectName:(id)a3;
- (SUCoreConfig)initWithProjectName:(id)a3 defaultsPath:(id)a4;
- (id)description;
- (id)getConfig;
- (id)getNumberConfigForKey:(id)a3;
- (id)getStringConfigForKey:(id)a3;
- (id)stateSafeGetConfig;
- (void)clearConfig;
- (void)setConfig:(id)a3 forKey:(id)a4;
- (void)stateSafeSetConfig:(id)a3 forKey:(id)a4;
@end

@implementation SUCoreConfig

- (SUCoreConfig)initWithProjectName:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && ([v4 isEqualToString:@"SoftwareUpdateCore"] & 1) == 0)
  {
    v6 = [@"/var/mobile/Library/Preferences/com.apple.SoftwareUpdateCore" stringByAppendingFormat:@".%@", v5];
  }
  else
  {
    v6 = @"/var/mobile/Library/Preferences/com.apple.SoftwareUpdateCore";
  }
  v7 = [(__CFString *)v6 stringByAppendingPathExtension:@"plist"];

  v8 = [(SUCoreConfig *)self initWithProjectName:v5 defaultsPath:v7];
  return v8;
}

- (SUCoreConfig)initWithProjectName:(id)a3 defaultsPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v15 = +[SUCoreLog sharedLogger];
    v16 = [v15 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfig initWithProjectName:defaultsPath:]();
    }
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = +[SUCoreLog sharedLogger];
    v16 = [v17 oslog];

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfig initWithProjectName:defaultsPath:]();
    }
LABEL_10:

    v14 = 0;
    goto LABEL_11;
  }
  v19.receiver = self;
  v19.super_class = (Class)SUCoreConfig;
  v9 = [(SUCoreConfig *)&v19 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_projectName, a3);
    objc_storeStrong((id *)&v10->_defaultsPath, a4);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.SoftwareUpdateCore.SUCoreConfigAccessQueue", v11);
    accessQueue = v10->_accessQueue;
    v10->_accessQueue = (OS_dispatch_queue *)v12;
  }
  self = v10;
  v14 = self;
LABEL_11:

  return v14;
}

- (void)stateSafeSetConfig:(id)a3 forKey:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreConfig *)self accessQueue];
  dispatch_assert_queue_V2(v8);

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (!v6
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      v9 = [(SUCoreConfig *)self stateSafeGetConfig];
      v10 = (void *)[v9 mutableCopy];
      v11 = v10;
      if (v10) {
        dispatch_queue_t v12 = v10;
      }
      else {
        dispatch_queue_t v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      }
      v14 = v12;

      if (v6) {
        [v14 setSafeObject:v6 forKey:v7];
      }
      else {
        [v14 removeObjectForKey:v7];
      }
      v15 = [(SUCoreConfig *)self defaultsPath];

      if (v15)
      {
        v16 = (void *)MEMORY[0x1E4F1CB10];
        v17 = [(SUCoreConfig *)self defaultsPath];
        v18 = [v16 fileURLWithPath:v17];
        id v26 = 0;
        char v19 = [v14 writeToURL:v18 error:&v26];
        v20 = v26;

        v21 = +[SUCoreLog sharedLogger];
        v22 = [v21 oslog];

        if (v19)
        {
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = [(SUCoreConfig *)self defaultsPath];
            *(_DWORD *)buf = 138543618;
            v28 = v23;
            __int16 v29 = 2114;
            v30 = v14;
            _os_log_impl(&dword_1B4EC2000, v22, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] Successfully updated config at path '%{public}@': %{public}@", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          -[SUCoreConfig stateSafeSetConfig:forKey:]();
        }
      }
      else
      {
        v24 = +[SUCoreLog sharedLogger];
        v20 = [v24 oslog];

        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[SUCoreConfig stateSafeSetConfig:forKey:](v20);
        }
      }
    }
    else
    {
      v25 = +[SUCoreLog sharedLogger];
      v14 = [v25 oslog];

      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[SUCoreConfig stateSafeSetConfig:forKey:]();
      }
    }
  }
  else
  {
    v13 = +[SUCoreLog sharedLogger];
    v14 = [v13 oslog];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SUCoreConfig stateSafeSetConfig:forKey:].cold.4();
    }
  }
}

- (id)stateSafeGetConfig
{
  v3 = [(SUCoreConfig *)self accessQueue];
  dispatch_assert_queue_V2(v3);

  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  v5 = [(SUCoreConfig *)self defaultsPath];
  id v6 = [v4 dictionaryWithContentsOfFile:v5];

  return v6;
}

- (void)setConfig:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(SUCoreConfig *)self accessQueue];
  dispatch_assert_queue_not_V2(v8);

  v9 = [(SUCoreConfig *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__SUCoreConfig_setConfig_forKey___block_invoke;
  block[3] = &unk_1E60B65E8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_sync(v9, block);
}

uint64_t __33__SUCoreConfig_setConfig_forKey___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stateSafeSetConfig:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (id)getConfig
{
  v3 = [(SUCoreConfig *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__2;
  dispatch_queue_t v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  id v4 = [(SUCoreConfig *)self accessQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__SUCoreConfig_getConfig__block_invoke;
  v7[3] = &unk_1E60B6328;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v4, v7);

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

uint64_t __25__SUCoreConfig_getConfig__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) stateSafeGetConfig];
  return MEMORY[0x1F41817F8]();
}

- (void)clearConfig
{
  v3 = [(SUCoreConfig *)self accessQueue];
  dispatch_assert_queue_not_V2(v3);

  id v4 = [(SUCoreConfig *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__SUCoreConfig_clearConfig__block_invoke;
  block[3] = &unk_1E60B6300;
  block[4] = self;
  dispatch_sync(v4, block);
}

void __27__SUCoreConfig_clearConfig__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v4 = *(void **)(a1 + 32);
  v3 = (id *)(a1 + 32);
  id v5 = [v4 defaultsPath];
  int v6 = [v2 fileExistsAtPath:v5];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = [*v3 defaultsPath];
    id v15 = 0;
    [v7 removeItemAtPath:v8 error:&v15];
    v9 = v15;

    uint64_t v10 = +[SUCoreLog sharedLogger];
    id v11 = [v10 oslog];

    if (v9)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        __27__SUCoreConfig_clearConfig__block_invoke_cold_1(v3, (uint64_t)v9, v11);
      }
    }
    else
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = [*v3 defaultsPath];
        *(_DWORD *)buf = 138543362;
        v17 = v14;
        _os_log_impl(&dword_1B4EC2000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] ClearConfig: Successfully removed configuration at path: %{public}@", buf, 0xCu);
      }
      v9 = v11;
    }
  }
  else
  {
    dispatch_queue_t v12 = +[SUCoreLog sharedLogger];
    v9 = [v12 oslog];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [*v3 defaultsPath];
      *(_DWORD *)buf = 138543362;
      v17 = v13;
      _os_log_impl(&dword_1B4EC2000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreConfig] ClearConfig: Configuration file does not exist at path: %{public}@", buf, 0xCu);
    }
  }
}

- (BOOL)getBoolConfigForKey:(id)a3
{
  return [(SUCoreConfig *)self getBoolConfigForKey:a3 defaultValue:0];
}

- (BOOL)getBoolConfigForKey:(id)a3 defaultValue:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(SUCoreConfig *)self accessQueue];
  dispatch_assert_queue_not_V2(v7);

  uint64_t v15 = 0;
  v16 = &v15;
  uint64_t v17 = 0x2020000000;
  BOOL v18 = a4;
  uint64_t v8 = [(SUCoreConfig *)self accessQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__SUCoreConfig_getBoolConfigForKey_defaultValue___block_invoke;
  v11[3] = &unk_1E60B67B8;
  id v12 = v6;
  id v13 = &v15;
  v11[4] = self;
  BOOL v14 = a4;
  id v9 = v6;
  dispatch_sync(v8, v11);

  LOBYTE(self) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return (char)self;
}

void __49__SUCoreConfig_getBoolConfigForKey_defaultValue___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) stateSafeGetConfig];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 safeBooleanForKey:*(void *)(a1 + 40) defaultValue:*(unsigned __int8 *)(a1 + 56)];
}

- (id)getStringConfigForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreConfig *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  uint64_t v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  id v6 = [(SUCoreConfig *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SUCoreConfig_getStringConfigForKey___block_invoke;
  block[3] = &unk_1E60B67E0;
  id v11 = v4;
  id v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __38__SUCoreConfig_getStringConfigForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stateSafeGetConfig];
  uint64_t v2 = [v5 safeStringForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)getNumberConfigForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(SUCoreConfig *)self accessQueue];
  dispatch_assert_queue_not_V2(v5);

  uint64_t v13 = 0;
  BOOL v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__2;
  uint64_t v17 = __Block_byref_object_dispose__2;
  id v18 = 0;
  id v6 = [(SUCoreConfig *)self accessQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__SUCoreConfig_getNumberConfigForKey___block_invoke;
  block[3] = &unk_1E60B67E0;
  id v11 = v4;
  id v12 = &v13;
  block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  id v8 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v8;
}

void __38__SUCoreConfig_getNumberConfigForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) stateSafeGetConfig];
  uint64_t v2 = [v5 safeObjectForKey:*(void *)(a1 + 40) ofClass:objc_opt_class()];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)description
{
  uint64_t v3 = NSString;
  id v4 = [(SUCoreConfig *)self projectName];
  id v5 = [(SUCoreConfig *)self defaultsPath];
  id v6 = [v3 stringWithFormat:@"SUCoreConfig(%@;%@)", v4, v5];

  return v6;
}

- (NSString)projectName
{
  return self->_projectName;
}

- (NSString)defaultsPath
{
  return self->_defaultsPath;
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessQueue, 0);
  objc_storeStrong((id *)&self->_defaultsPath, 0);
  objc_storeStrong((id *)&self->_projectName, 0);
}

- (void)initWithProjectName:defaultsPath:.cold.1()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreConfig] Attempting to initialize with defaultsPath of an unsupported class: %{public}@", v4, v5, v6, v7, v8);
}

- (void)initWithProjectName:defaultsPath:.cold.2()
{
  v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreConfig] Attempting to initialize with project name of an unsupported class: %{public}@", v4, v5, v6, v7, v8);
}

- (void)stateSafeSetConfig:(os_log_t)log forKey:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B4EC2000, log, OS_LOG_TYPE_ERROR, "[SUCoreConfig] Attempting to set config with no defaults path present", v1, 2u);
}

- (void)stateSafeSetConfig:forKey:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_1B4EC2000, v0, OS_LOG_TYPE_ERROR, "[SUCoreConfig] Failed to write config to defaults path with error: %{public}@", v1, 0xCu);
}

- (void)stateSafeSetConfig:forKey:.cold.3()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreConfig] Attempting to set unsupported class to configuration file: %{public}@", v4, v5, v6, v7, v8);
}

- (void)stateSafeSetConfig:forKey:.cold.4()
{
  os_log_t v0 = (objc_class *)objc_opt_class();
  v1 = NSStringFromClass(v0);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B4EC2000, v2, v3, "[SUCoreConfig] Attempting to set config with key of unsupported class: %{public}@", v4, v5, v6, v7, v8);
}

void __27__SUCoreConfig_clearConfig__block_invoke_cold_1(id *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 defaultsPath];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_1B4EC2000, a3, OS_LOG_TYPE_ERROR, "[SUCoreConfig] ClearConfig: Failed to remove configuration at path '%{public}@': %{public}@", v6, 0x16u);
}

@end