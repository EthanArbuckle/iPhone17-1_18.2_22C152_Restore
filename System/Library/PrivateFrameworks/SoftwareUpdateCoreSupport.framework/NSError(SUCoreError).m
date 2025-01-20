@interface NSError(SUCoreError)
+ (id)_buildCheckedErrorForDomain:()SUCoreError withCode:safeUnderlying:description:;
+ (id)buildAndLogCheckedSUCoreError:()SUCoreError underlying:description:;
+ (id)buildCheckedError:()SUCoreError;
+ (id)buildCheckedSUCoreError:()SUCoreError underlying:description:;
+ (uint64_t)_checkedIsSafeUserInfo:()SUCoreError;
+ (unint64_t)_checkedDepthCount:()SUCoreError;
- (__CFString)checkedIndicationsSummary;
- (id)_checkedStackErrorAtDepth:()SUCoreError;
- (id)_deepestWithLayer;
- (id)_errorInStackOfLayer:()SUCoreError;
- (id)checkedDescription;
- (id)checkedDomain;
- (id)checkedForDepthIndex:()SUCoreError;
- (id)checkedIndicationsDescription;
- (id)checkedNameForCode;
- (id)checkedOfLayer:()SUCoreError;
- (id)checkedSummary;
- (id)checkedUserInfo;
- (int64_t)_checkedIndicationsMatching:()SUCoreError;
- (int64_t)_errorInStackLayer;
- (int64_t)checkedIndications;
- (int64_t)checkedIndicationsMatchingMask:()SUCoreError;
- (uint64_t)_checkedIsSafe:()SUCoreError;
- (uint64_t)checkedCode;
- (uint64_t)checkedDepthCount;
- (uint64_t)checkedLayer;
- (uint64_t)checkedSystemPartitionSize;
- (unint64_t)shouldFallbackToCustomerScan;
- (void)checkedSystemPartitionSize;
@end

@implementation NSError(SUCoreError)

- (uint64_t)checkedCode
{
  v1 = [a1 _deepestWithLayer];
  v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 code];
  }
  else {
    uint64_t v3 = -1;
  }

  return v3;
}

- (id)checkedDomain
{
  v1 = [a1 _deepestWithLayer];
  v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 domain];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)buildCheckedError:()SUCoreError
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 _checkedIsSafe:1])
    {
      id v5 = v4;
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F28C58] _checkedDepthCount:v4];
      if (v6 >= 1
        && (unint64_t v7 = v6, [v4 _checkedStackErrorAtDepth:v6], (v8 = objc_claimAutoreleasedReturnValue()) != 0))
      {
        v9 = (void *)v8;
        v10 = 0;
        do
        {
          v11 = v10;
          v12 = v9;
          v13 = (void *)MEMORY[0x1E4F28C58];
          v14 = [v9 domain];
          uint64_t v15 = [v12 code];
          v16 = [v12 localizedDescription];
          v10 = [v13 _buildCheckedErrorForDomain:v14 withCode:v15 safeUnderlying:v11 description:v16];

          v9 = [v4 _checkedStackErrorAtDepth:v7 - 1];

          if (v7 < 2) {
            break;
          }
          --v7;
        }
        while (v9);
      }
      else
      {
        v10 = 0;
      }
      v17 = (void *)MEMORY[0x1E4F28C58];
      v18 = [v4 domain];
      uint64_t v19 = [v4 code];
      v20 = [v4 localizedDescription];
      id v5 = [v17 _buildCheckedErrorForDomain:v18 withCode:v19 safeUnderlying:v10 description:v20];
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (uint64_t)_checkedIsSafe:()SUCoreError
{
  id v4 = a1;
  if (!v4) {
    return 1;
  }
  id v5 = v4;
  uint64_t v6 = *MEMORY[0x1E4F28A50];
  while (1)
  {
    uint64_t v7 = [MEMORY[0x1E4F28C58] _checkedIsSafeUserInfo:v5];
    if (!v7 || a3 == 0) {
      break;
    }
    v9 = [v5 userInfo];

    if (!v9)
    {
      uint64_t v7 = 1;
      break;
    }
    v10 = [v5 userInfo];
    uint64_t v11 = [v10 safeObjectForKey:v6 ofClass:objc_opt_class()];

    id v5 = (void *)v11;
    if (!v11)
    {
      id v5 = 0;
      break;
    }
  }

  return v7;
}

+ (uint64_t)_checkedIsSafeUserInfo:()SUCoreError
{
  id v3 = a3;
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  id v4 = [v3 userInfo];

  if (v4)
  {
    id v5 = [v3 userInfo];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __47__NSError_SUCoreError___checkedIsSafeUserInfo___block_invoke;
    v8[3] = &unk_1E60B6AF8;
    v8[4] = &v9;
    [v5 enumerateKeysAndObjectsUsingBlock:v8];
  }
  uint64_t v6 = *((unsigned __int8 *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)_deepestWithLayer
{
  uint64_t v2 = [a1 checkedDepthCount];
  if (v2 < 1) {
    goto LABEL_9;
  }
  uint64_t v3 = v2;
  do
  {
    id v4 = [a1 checkedForDepthIndex:v3];
    if ([v4 _errorInStackLayer] > 10)
    {
      id v5 = v4;
    }
    else
    {
      id v5 = 0;
      --v3;
    }
  }
  while (!v5 && v3 > 0);
  if (!v5)
  {
LABEL_9:
    if ([a1 _errorInStackLayer] >= 11) {
      id v5 = a1;
    }
    else {
      id v5 = 0;
    }
  }
  return v5;
}

- (id)checkedDescription
{
  uint64_t v2 = [a1 checkedDepthCount];
  uint64_t v3 = [a1 _errorInStackLayer];
  id v4 = +[SUCoreErrorInformation codeNameForError:a1];
  id v5 = [a1 checkedIndicationsDescription];
  id v6 = [NSString alloc];
  uint64_t v7 = [a1 domain];
  uint64_t v8 = (void *)v7;
  if (v3 > 10)
  {
    uint64_t v9 = +[SUCoreErrorInformation nameForSUCoreLayer:v3];
    uint64_t v11 = (void *)[v6 initWithFormat:@"%@(%@):%@", v8, v9, v4];
    v10 = [&stru_1F0D92C90 stringByAppendingString:v11];
  }
  else
  {
    uint64_t v9 = (void *)[v6 initWithFormat:@"%@:%@", v7, v4];
    v10 = [&stru_1F0D92C90 stringByAppendingString:v9];
  }

  if (v2 <= 0)
  {
    id v20 = [NSString alloc];
    char v12 = [a1 localizedDescription];
    v16 = (void *)[v20 initWithFormat:@" | %@", v12];
    uint64_t v19 = [v10 stringByAppendingString:v16];
    v14 = v4;
  }
  else
  {
    char v12 = [a1 checkedForDepthIndex:v2];
    uint64_t v13 = +[SUCoreErrorInformation layerForError:v12];
    v14 = +[SUCoreErrorInformation codeNameForError:v12];

    id v15 = [NSString alloc];
    v16 = [v12 domain];
    if (v13 > 10)
    {
      uint64_t v17 = +[SUCoreErrorInformation nameForSUCoreLayer:v13];
      v18 = [v12 localizedDescription];
      uint64_t v21 = [v15 initWithFormat:@"_%d_%@(%@):%@ | %@", v2, v16, v17, v14, v18];
      uint64_t v19 = [v10 stringByAppendingString:v21];

      v10 = (void *)v21;
    }
    else
    {
      uint64_t v17 = [v12 localizedDescription];
      v18 = (void *)[v15 initWithFormat:@"_%d_%@:%@ | %@", v2, v16, v14, v17];
      uint64_t v19 = [v10 stringByAppendingString:v18];
    }

    v10 = (void *)v17;
  }

  if (v5)
  {
    v22 = (void *)[[NSString alloc] initWithFormat:@"\n%@", v5];
    uint64_t v23 = [v19 stringByAppendingString:v22];

    uint64_t v19 = (void *)v23;
  }

  return v19;
}

- (int64_t)_errorInStackLayer
{
  return +[SUCoreErrorInformation layerForError:a1];
}

- (int64_t)checkedIndications
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int64_t v2 = +[SUCoreErrorInformation allIndicationsForError:a1];
  uint64_t v3 = [a1 checkedDepthCount];
  if (v3 >= 1)
  {
    int v4 = v3;
    uint64_t v5 = v3;
    while (1)
    {
      id v6 = [a1 checkedForDepthIndex:v5];
      if (!v6) {
        break;
      }
      v2 |= +[SUCoreErrorInformation allIndicationsForError:v6];
      --v5;

      if (!v5) {
        return v2;
      }
    }
    uint64_t v7 = +[SUCoreLog sharedLogger];
    uint64_t v8 = [v7 oslog];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = [a1 checkedDescription];
      v11[0] = 67109634;
      v11[1] = v4;
      __int16 v12 = 1024;
      int v13 = v5;
      __int16 v14 = 2114;
      id v15 = v10;
      _os_log_error_impl(&dword_1B4EC2000, v8, OS_LOG_TYPE_ERROR, "[CORE_ERROR] {checkedIndications} error with depthCount=%d yet no stack-error at checked depth(%d) | cannot determine if generic failure for error: %{public}@", (uint8_t *)v11, 0x18u);
    }
  }
  return v2;
}

- (uint64_t)checkedDepthCount
{
  v1 = [a1 userInfo];
  uint64_t v2 = *MEMORY[0x1E4F28A50];
  uint64_t v3 = [v1 safeObjectForKey:*MEMORY[0x1E4F28A50] ofClass:objc_opt_class()];
  if (v3)
  {
    int v4 = (void *)v3;
    uint64_t v5 = 0;
    id v6 = v1;
    do
    {
      ++v5;
      v1 = [v4 userInfo];

      uint64_t v7 = [v1 safeObjectForKey:v2 ofClass:objc_opt_class()];

      int v4 = (void *)v7;
      id v6 = v1;
    }
    while (v7);
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (id)checkedIndicationsDescription
{
  int v1 = [a1 checkedIndications];
  uint64_t v2 = 0;
  for (uint64_t i = 0; i != 5; ++i)
  {
    if ((v1 & (1 << i)) != 0)
    {
      int v4 = NSString;
      uint64_t v5 = +[SUCoreErrorAttributes descriptionForIndication:](SUCoreErrorAttributes, "descriptionForIndication:");
      id v6 = (void *)v5;
      if (v2)
      {
        uint64_t v7 = [v4 stringWithFormat:@"\n-> %@", v5];
        uint64_t v8 = [v2 stringByAppendingString:v7];

        uint64_t v2 = (void *)v8;
      }
      else
      {
        uint64_t v2 = [v4 stringWithFormat:@"-> %@", v5];
      }
    }
  }
  return v2;
}

- (uint64_t)checkedLayer
{
  int v1 = [a1 _deepestWithLayer];
  uint64_t v2 = v1;
  if (v1) {
    uint64_t v3 = [v1 _errorInStackLayer];
  }
  else {
    uint64_t v3 = 10;
  }

  return v3;
}

- (id)checkedOfLayer:()SUCoreError
{
  uint64_t v5 = [a1 checkedDepthCount];
  if (v5 < 1) {
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  do
  {
    uint64_t v7 = [a1 checkedForDepthIndex:v6];
    if ([v7 _errorInStackLayer] == a3)
    {
      id v8 = v7;
    }
    else
    {
      id v8 = 0;
      --v6;
    }
  }
  while (!v8 && v6 > 0);
  if (!v8)
  {
LABEL_9:
    id v8 = [a1 _errorInStackOfLayer:a3];
  }
  return v8;
}

- (id)checkedUserInfo
{
  int v1 = [a1 _deepestWithLayer];
  uint64_t v2 = v1;
  if (v1)
  {
    uint64_t v3 = [v1 userInfo];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (uint64_t)checkedSystemPartitionSize
{
  uint64_t v2 = +[SUCoreLog sharedLogger];
  uint64_t v3 = [v2 oslog];

  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    [(NSError(SUCoreError) *)a1 checkedSystemPartitionSize];
  }

  return 0;
}

- (unint64_t)shouldFallbackToCustomerScan
{
  return ((unint64_t)[a1 checkedIndications] >> 5) & 1;
}

- (int64_t)checkedIndicationsMatchingMask:()SUCoreError
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v5 = +[SUCoreErrorInformation indicationsForError:a1 matchingMask:a3];
  uint64_t v6 = [a1 checkedDepthCount];
  if (v6 >= 1)
  {
    int v7 = v6;
    uint64_t v8 = v6;
    while (1)
    {
      uint64_t v9 = [a1 checkedForDepthIndex:v8];
      if (!v9) {
        break;
      }
      v5 |= +[SUCoreErrorInformation indicationsForError:v9 matchingMask:a3];
      --v8;

      if (!v8) {
        return v5;
      }
    }
    v10 = +[SUCoreLog sharedLogger];
    uint64_t v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = [a1 checkedDescription];
      v14[0] = 67109634;
      v14[1] = v7;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 2114;
      v18 = v13;
      _os_log_error_impl(&dword_1B4EC2000, v11, OS_LOG_TYPE_ERROR, "[CORE_ERROR] {checkedIndicationsMatchingMask} error with depthCount=%d yet no stack-error at checked depth(%d) | cannot determine if generic failure for error: %{public}@", (uint8_t *)v14, 0x18u);
    }
  }
  return v5;
}

- (__CFString)checkedIndicationsSummary
{
  int v1 = [a1 checkedIndications];
  uint64_t v2 = 0;
  uint64_t v3 = &stru_1F0D92C90;
  do
  {
    if ((v1 & (1 << v2)) != 0)
    {
      int v4 = NSString;
      int64_t v5 = +[SUCoreErrorAttributes nameForIndication:](SUCoreErrorAttributes, "nameForIndication:");
      uint64_t v6 = [v4 stringWithFormat:@"|%@", v5];
      uint64_t v7 = [(__CFString *)v3 stringByAppendingString:v6];

      uint64_t v3 = (__CFString *)v7;
    }
    ++v2;
  }
  while (v2 != 5);
  if ([(__CFString *)v3 isEqualToString:&stru_1F0D92C90])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v9 = [(__CFString *)v3 stringByAppendingString:@"|"];

    uint64_t v8 = v9;
    uint64_t v3 = v8;
  }

  return v8;
}

- (id)checkedForDepthIndex:()SUCoreError
{
  int v4 = [a1 userInfo];
  uint64_t v5 = *MEMORY[0x1E4F28A50];
  uint64_t v6 = [v4 safeObjectForKey:*MEMORY[0x1E4F28A50] ofClass:objc_opt_class()];
  BOOL v7 = a3 > 1;
  if (v6) {
    BOOL v8 = a3 < 2;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = 2;
    do
    {
      v10 = v4;
      uint64_t v11 = v6;
      int v4 = [v6 userInfo];

      uint64_t v6 = [v4 safeObjectForKey:v5 ofClass:objc_opt_class()];

      BOOL v7 = v9 < a3;
      if (v6) {
        BOOL v12 = v9 < a3;
      }
      else {
        BOOL v12 = 0;
      }
      ++v9;
    }
    while (v12);
  }
  if (v7) {
    id v13 = 0;
  }
  else {
    id v13 = v6;
  }

  return v13;
}

- (id)checkedNameForCode
{
  uint64_t v2 = [a1 _deepestWithLayer];
  if (v2) {
    +[SUCoreErrorInformation codeNameForError:v2];
  }
  else {
  uint64_t v3 = objc_msgSend(NSString, "stringWithFormat:", @"%d", objc_msgSend(a1, "code"));
  }

  return v3;
}

- (id)checkedSummary
{
  uint64_t v2 = [a1 checkedDepthCount];
  uint64_t v3 = [a1 _errorInStackLayer];
  int v4 = +[SUCoreErrorInformation codeNameForError:a1];
  uint64_t v5 = [a1 checkedIndicationsSummary];
  id v6 = [NSString alloc];
  v27 = a1;
  uint64_t v7 = [a1 domain];
  BOOL v8 = (void *)v7;
  v26 = (void *)v5;
  if (v3 > 10)
  {
    uint64_t v9 = +[SUCoreErrorInformation nameForSUCoreLayer:v3];
    uint64_t v11 = (void *)[v6 initWithFormat:@"[%@(%@):%@", v8, v9, v4];
    v10 = [&stru_1F0D92C90 stringByAppendingString:v11];
  }
  else
  {
    uint64_t v9 = (void *)[v6 initWithFormat:@"[%@:%@", v7, v4];
    v10 = [&stru_1F0D92C90 stringByAppendingString:v9];
  }

  if (v2 < 1)
  {
    uint64_t v21 = v10;
  }
  else
  {
    uint64_t v12 = -v2;
    uint64_t v13 = 1;
    do
    {
      __int16 v14 = v4;
      __int16 v15 = [v27 checkedForDepthIndex:v13];
      uint64_t v16 = +[SUCoreErrorInformation layerForError:v15];
      int v4 = +[SUCoreErrorInformation codeNameForError:v15];

      id v17 = [NSString alloc];
      uint64_t v18 = [v15 domain];
      uint64_t v19 = (void *)v18;
      if (v16 > 10)
      {
        id v20 = +[SUCoreErrorInformation nameForSUCoreLayer:v16];
        uint64_t v22 = [v17 initWithFormat:@"_%d_%@(%@):%@", v13, v19, v20, v4];
        uint64_t v21 = [v10 stringByAppendingString:v22];

        v10 = (void *)v22;
      }
      else
      {
        id v20 = (void *)[v17 initWithFormat:@"_%d_%@:%@", v13, v18, v4];
        uint64_t v21 = [v10 stringByAppendingString:v20];
      }

      ++v13;
      v10 = v21;
    }
    while (v12 + v13 != 1);
  }
  if (v26)
  {
    uint64_t v23 = [v21 stringByAppendingString:v26];

    uint64_t v21 = (void *)v23;
  }
  if (([v21 isEqualToString:&stru_1F0D92C90] & 1) == 0)
  {
    uint64_t v24 = [v21 stringByAppendingString:@"]"];

    uint64_t v21 = (void *)v24;
  }

  return v21;
}

- (id)_checkedStackErrorAtDepth:()SUCoreError
{
  int v4 = [a1 userInfo];
  uint64_t v5 = *MEMORY[0x1E4F28A50];
  id v6 = [v4 safeObjectForKey:*MEMORY[0x1E4F28A50] ofClass:objc_opt_class()];

  if (v6) {
    BOOL v7 = a3 < 2;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    uint64_t v8 = 2;
    while (1)
    {
      uint64_t v9 = v6;
      v10 = [v6 userInfo];
      id v6 = [v10 safeObjectForKey:v5 ofClass:objc_opt_class()];

      if ((unint64_t)(v8 - 1) >= 4) {
        break;
      }
      if (v6) {
        BOOL v11 = v8 < a3;
      }
      else {
        BOOL v11 = 0;
      }
      ++v8;
      if (!v11) {
        goto LABEL_13;
      }
    }

    id v6 = 0;
  }
LABEL_13:
  return v6;
}

- (int64_t)_checkedIndicationsMatching:()SUCoreError
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  int64_t v5 = +[SUCoreErrorInformation indicationsForError:a1 matchingMask:a3];
  uint64_t v6 = [a1 checkedDepthCount];
  if (v6 >= 1)
  {
    int v7 = v6;
    uint64_t v8 = v6;
    while (1)
    {
      uint64_t v9 = [a1 checkedForDepthIndex:v8];
      if (!v9) {
        break;
      }
      v5 |= +[SUCoreErrorInformation indicationsForError:v9 matchingMask:a3];
      --v8;

      if (!v8) {
        return v5;
      }
    }
    v10 = +[SUCoreLog sharedLogger];
    BOOL v11 = [v10 oslog];

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [a1 checkedDescription];
      v14[0] = 67109634;
      v14[1] = v7;
      __int16 v15 = 1024;
      int v16 = v8;
      __int16 v17 = 2114;
      uint64_t v18 = v13;
      _os_log_error_impl(&dword_1B4EC2000, v11, OS_LOG_TYPE_ERROR, "[CORE_ERROR] {_checkedIndicationsMatching} error with depthCount=%d yet no stack-error at checked depth(%d) | cannot determine all indications for error: %{public}@", (uint8_t *)v14, 0x18u);
    }
  }
  return v5;
}

- (id)_errorInStackOfLayer:()SUCoreError
{
  if (+[SUCoreErrorInformation layerForError:a1] == a3) {
    id v4 = a1;
  }
  else {
    id v4 = 0;
  }
  return v4;
}

+ (id)buildCheckedSUCoreError:()SUCoreError underlying:description:
{
  int v7 = (void *)MEMORY[0x1E4F28C58];
  id v8 = a5;
  uint64_t v9 = [v7 buildCheckedError:a4];
  v10 = [v7 _buildCheckedErrorForDomain:@"SUCoreError" withCode:a3 safeUnderlying:v9 description:v8];

  return v10;
}

+ (id)buildAndLogCheckedSUCoreError:()SUCoreError underlying:description:
{
  int v7 = (void *)MEMORY[0x1E4F28C58];
  id v8 = a5;
  uint64_t v9 = [v7 buildCheckedError:a4];
  v10 = [v7 _buildCheckedErrorForDomain:@"SUCoreError" withCode:a3 safeUnderlying:v9 description:v8];

  BOOL v11 = +[SUCoreLog sharedLogger];
  uint64_t v12 = [v11 oslog];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    +[NSError(SUCoreError) buildAndLogCheckedSUCoreError:underlying:description:]((uint64_t)v10, v12);
  }

  return v10;
}

+ (unint64_t)_checkedDepthCount:()SUCoreError
{
  uint64_t v3 = [a3 userInfo];
  uint64_t v4 = *MEMORY[0x1E4F28A50];
  int64_t v5 = [v3 safeObjectForKey:*MEMORY[0x1E4F28A50] ofClass:objc_opt_class()];

  if (v5)
  {
    unint64_t v6 = 0;
    while (1)
    {
      int v7 = v5;
      id v8 = [v5 userInfo];
      int64_t v5 = [v8 safeObjectForKey:v4 ofClass:objc_opt_class()];

      if (v5 && v6 >= 4) {
        break;
      }
      ++v6;
      if (!v5) {
        return v6;
      }
    }
  }
  return 0;
}

+ (id)_buildCheckedErrorForDomain:()SUCoreError withCode:safeUnderlying:description:
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  uint64_t v12 = objc_opt_new();
  uint64_t v13 = +[SUCoreErrorInformation codeNameForDomain:v9 withCode:a4];
  id v14 = [NSString alloc];
  if (v11) {
    uint64_t v15 = [v14 initWithFormat:@"[%@] %@", v13, v11];
  }
  else {
    uint64_t v15 = [v14 initWithFormat:@"[%@]", v13, v19];
  }
  int v16 = (void *)v15;
  [v12 setSafeObject:v15 forKey:*MEMORY[0x1E4F28568]];
  if (v10) {
    [v12 setSafeObject:v10 forKey:*MEMORY[0x1E4F28A50]];
  }
  __int16 v17 = [MEMORY[0x1E4F28C58] errorWithDomain:v9 code:a4 userInfo:v12];

  return v17;
}

- (void)checkedSystemPartitionSize
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 checkedDescription];
  int v4 = 138543362;
  int64_t v5 = v3;
  _os_log_error_impl(&dword_1B4EC2000, a2, OS_LOG_TYPE_ERROR, "[CORE_ERROR] {checkedSystemPartitionSize} system partition size error attribute not yet implemented | cannot provide system partition size for error: %{public}@", (uint8_t *)&v4, 0xCu);
}

+ (void)buildAndLogCheckedSUCoreError:()SUCoreError underlying:description:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B4EC2000, a2, OS_LOG_TYPE_ERROR, "Error: %@", (uint8_t *)&v2, 0xCu);
}

@end