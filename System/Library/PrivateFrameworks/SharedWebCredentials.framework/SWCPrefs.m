@interface SWCPrefs
@end

@implementation SWCPrefs

void __24___SWCPrefs_sharedPrefs__block_invoke()
{
  id v0 = [[_SWCPrefs alloc] _init];
  v1 = (void *)qword_1EB67B0D0;
  qword_1EB67B0D0 = (uint64_t)v0;
}

void __40___SWCPrefs_containerURLReturningError___block_invoke()
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v16 = 1;
  id v0 = (void *)container_create_or_lookup_path_for_current_user();
  if (v0)
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithFileSystemRepresentation:v0 isDirectory:1 relativeToURL:0];
    v2 = (void *)qword_1EB67B0E0;
    qword_1EB67B0E0 = v1;

    uint64_t v3 = [(id)qword_1EB67B0E0 URLByAppendingPathComponent:@"com.apple.SharedWebCredentials" isDirectory:1];
    v4 = (void *)qword_1EB67B0E0;
    qword_1EB67B0E0 = v3;

    free(v0);
  }
  else
  {
    if (qword_1EB67B130 != -1) {
      dispatch_once(&qword_1EB67B130, &__block_literal_global_106);
    }
    v5 = qword_1EB67B128;
    if (os_log_type_enabled((os_log_t)qword_1EB67B128, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v20 = v16;
      _os_log_error_impl(&dword_1ABCD7000, v5, OS_LOG_TYPE_ERROR, "Error %llu getting container path", buf, 0xCu);
    }
    id v6 = objc_alloc(MEMORY[0x1E4F28C58]);
    v17[0] = @"Line";
    v17[1] = @"Function";
    v18[0] = &unk_1F0345938;
    v7 = [NSString stringWithUTF8String:"-[_SWCPrefs containerURLReturningError:]_block_invoke"];
    v18[1] = v7;
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
    uint64_t v9 = [v6 initWithDomain:@"ContainerManager" code:v16 userInfo:v8];
    v10 = (void *)qword_1EB67B0E8;
    qword_1EB67B0E8 = v9;
  }
  if (qword_1EB67B0E0)
  {
    v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v15 = 0;
    char v12 = [v11 createDirectoryAtURL:qword_1EB67B0E0 withIntermediateDirectories:1 attributes:0 error:&v15];
    id v13 = v15;

    if ((v12 & 1) == 0)
    {
      if (qword_1EB67B130 != -1) {
        dispatch_once(&qword_1EB67B130, &__block_literal_global_106);
      }
      v14 = qword_1EB67B128;
      if (os_log_type_enabled((os_log_t)qword_1EB67B128, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v20 = (uint64_t)v13;
        _os_log_error_impl(&dword_1ABCD7000, v14, OS_LOG_TYPE_ERROR, "NSFileManager failed to create user container URL directory (ignoring): %{public}@", buf, 0xCu);
      }
    }
  }
}

uint64_t __38___SWCPrefs_retryIntervalAfterFailure__block_invoke()
{
  uint64_t result = arc4random_uniform(0xE10u);
  qword_1EB67B0F8 = (result + 10800);
  return result;
}

uint64_t __38___SWCPrefs_retryIntervalAfterSuccess__block_invoke()
{
  uint64_t result = arc4random_uniform(0xE10u);
  qword_1EB67B108 = (result + 428400);
  return result;
}

const char *__28___SWCPrefs_isAppleInternal__block_invoke()
{
  uint64_t result = (const char *)os_variant_has_internal_diagnostics();
  _MergedGlobals_2 = (char)result;
  if (result)
  {
    uint64_t result = getenv("SWC_MOCK_THE_PUBLIC");
    if (result)
    {
      uint64_t result = (const char *)strtol(result, 0, 0);
      if (result) {
        _MergedGlobals_2 = 0;
      }
    }
  }
  return result;
}

uint64_t __45___SWCPrefs_Private___recheckFuzzForSuccess___block_invoke()
{
  qword_1EB67B138 = arc4random_uniform(0xE10u) + 10800;
  uint64_t result = arc4random_uniform(0xE10u);
  qword_1EB67B140 = (result + 428400);
  return result;
}

@end