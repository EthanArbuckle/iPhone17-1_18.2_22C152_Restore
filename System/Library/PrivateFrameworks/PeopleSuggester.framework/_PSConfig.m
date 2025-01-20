@interface _PSConfig
+ (id)_loadPlistNamed:(int)a3 abortOnFailure:;
+ (id)contactEmbeddingConfig;
+ (id)defaultConfig;
+ (id)messagesPinningConfig;
+ (id)vocab;
+ (uint64_t)_configs;
@end

@implementation _PSConfig

+ (id)_loadPlistNamed:(int)a3 abortOnFailure:
{
  id v4 = a2;
  self;
  v5 = (void *)MEMORY[0x1A6243860]();
  v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v7 = [v6 URLForResource:v4 withExtension:@"plist"];
  v8 = [v7 path];

  memset(&v15, 0, sizeof(v15));
  if (stat((const char *)[v8 fileSystemRepresentation], &v15))
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
      +[_PSConfig _loadPlistNamed:abortOnFailure:]((uint64_t)v4);
    }
    if (!_PASEvaluateLogFaultAndProbCrashCriteria() && !a3)
    {
LABEL_6:
      v9 = 0;
      goto LABEL_7;
    }
LABEL_24:
    abort();
  }
  if (v15.st_size < 4096
    || ([MEMORY[0x1E4F93B58] dictionaryWithPath:v8 error:0],
        (v9 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v8];
    if (!v11)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        +[_PSConfig _loadPlistNamed:abortOnFailure:]((uint64_t)v4);
      }
      if (!_PASEvaluateLogFaultAndProbCrashCriteria() && !a3) {
        goto LABEL_6;
      }
      goto LABEL_24;
    }
    v12 = (void *)v11;
    id v14 = 0;
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v11 error:&v14];
    id v13 = v14;
    if (!v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT)) {
        +[_PSConfig _loadPlistNamed:abortOnFailure:]((uint64_t)v4, (uint64_t)v13);
      }
      if (_PASEvaluateLogFaultAndProbCrashCriteria() || a3) {
        goto LABEL_24;
      }
      v9 = 0;
    }
  }
LABEL_7:

  return v9;
}

+ (id)messagesPinningConfig
{
  +[_PSConfig _configs]();
  v2 = (void *)qword_1EB4E5EB0;

  return v2;
}

+ (uint64_t)_configs
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __21___PSConfig__configs__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = v0;
  if (_configs_onceToken != -1) {
    dispatch_once(&_configs_onceToken, block);
  }
  return &_configs_configs;
}

+ (id)defaultConfig
{
  +[_PSConfig _configs]();
  v2 = (void *)_configs_configs;

  return v2;
}

+ (id)contactEmbeddingConfig
{
  +[_PSConfig _configs]();
  v2 = (void *)qword_1EB4E5EB8;

  return v2;
}

+ (id)vocab
{
  +[_PSConfig _configs]();
  v2 = (void *)qword_1EB4E5EC0;

  return v2;
}

+ (void)_loadPlistNamed:(uint64_t)a1 abortOnFailure:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1A314B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Unable to generate URL path for plist %{public}@", (uint8_t *)&v1, 0xCu);
}

+ (void)_loadPlistNamed:(uint64_t)a1 abortOnFailure:(uint64_t)a2 .cold.2(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 138543618;
  uint64_t v3 = a1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_fault_impl(&dword_1A314B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed to decode plist named %{public}@: %{public}@", (uint8_t *)&v2, 0x16u);
}

+ (void)_loadPlistNamed:(uint64_t)a1 abortOnFailure:.cold.3(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v1 = 138543362;
  uint64_t v2 = a1;
  _os_log_fault_impl(&dword_1A314B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Failed to stat plist named %{public}@", (uint8_t *)&v1, 0xCu);
}

@end