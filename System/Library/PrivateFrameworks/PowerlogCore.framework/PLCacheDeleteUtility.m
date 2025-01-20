@interface PLCacheDeleteUtility
+ (BOOL)registerCacheDelete;
+ (BOOL)registerCacheDeleteFull;
+ (id)periodicPurgeBlockWithInfo:(id)a3 withUrgency:(int)a4;
+ (id)purgeBlockWithInfo:(id)a3 withUrgency:(int)a4;
+ (id)purgeableBlockWithInfo:(id)a3 withUrgency:(int)a4;
+ (unint64_t)enforceRetentionForDirectory:(id)a3 withMaxDays:(unint64_t)a4;
+ (unint64_t)enforceRetentionForVersionDirectory:(id)a3;
+ (unint64_t)purgeBuildDirectory:(id)a3;
+ (unint64_t)purgeVersionDirectory:(id)a3;
+ (unint64_t)purgeableSizeForBuildDirectory:(id)a3;
+ (unint64_t)purgeableSizeForVersionDirectory:(id)a3;
+ (void)traverseBuildDirectory:(id)a3 withBlock:(id)a4;
+ (void)traverseVersionDirectory:(id)a3 withBlock:(id)a4;
@end

@implementation PLCacheDeleteUtility

+ (void)traverseBuildDirectory:(id)a3 withBlock:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  v18[0] = *MEMORY[0x1E4F1C530];
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v10 = [v7 contentsOfDirectoryAtURL:v8 includingPropertiesForKeys:v9 options:4 error:0];

  v11 = PLLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility traverseBuildDirectory:withBlock:]((uint64_t)v5, v10, v11);
  }

  v12 = [v10 sortedArrayUsingComparator:&__block_literal_global_12];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __57__PLCacheDeleteUtility_traverseBuildDirectory_withBlock___block_invoke_2;
  v15[3] = &unk_1E6253FB0;
  id v16 = v10;
  id v17 = v6;
  id v13 = v10;
  id v14 = v6;
  [v12 enumerateObjectsUsingBlock:v15];
}

int64_t __57__PLCacheDeleteUtility_traverseBuildDirectory_withBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[PLUtilities compareFilesByKey:*MEMORY[0x1E4F1C530] file1:a2 file2:a3 sortAscending:1];
}

void __57__PLCacheDeleteUtility_traverseBuildDirectory_withBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = [a2 path];
  if (((*(uint64_t (**)(void, id, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v7, [*(id *)(a1 + 32) count] - a3) & 1) == 0)*a4 = 1; {
}
  }

+ (void)traverseVersionDirectory:(id)a3 withBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v8 = [v7 contentsOfDirectoryAtPath:v5 error:0];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __59__PLCacheDeleteUtility_traverseVersionDirectory_withBlock___block_invoke;
  v11[3] = &unk_1E6253FD8;
  id v12 = v5;
  id v13 = v6;
  id v9 = v6;
  id v10 = v5;
  [v8 enumerateObjectsUsingBlock:v11];
}

void __59__PLCacheDeleteUtility_traverseVersionDirectory_withBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (unint64_t)purgeableSizeForBuildDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__PLCacheDeleteUtility_purgeableSizeForBuildDirectory___block_invoke;
  block[3] = &unk_1E6253E70;
  id v10 = @"MaxFilesPostPurge";
  uint64_t v11 = 2;
  if (purgeableSizeForBuildDirectory__defaultOnce != -1) {
    dispatch_once(&purgeableSizeForBuildDirectory__defaultOnce, block);
  }
  uint64_t v4 = purgeableSizeForBuildDirectory__objectForKey;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__PLCacheDeleteUtility_purgeableSizeForBuildDirectory___block_invoke_2;
  v8[3] = &unk_1E6254000;
  v8[4] = &v12;
  v8[5] = v4;
  +[PLCacheDeleteUtility traverseBuildDirectory:v3 withBlock:v8];
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility purgeableSizeForBuildDirectory:]();
  }

  unint64_t v6 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v6;
}

int64_t __55__PLCacheDeleteUtility_purgeableSizeForBuildDirectory___block_invoke(uint64_t a1)
{
  int64_t result = +[PLDefaults longForKey:*(void *)(a1 + 32) ifNotSet:*(void *)(a1 + 40)];
  purgeableSizeForBuildDirectory__objectForKey = result;
  return result;
}

BOOL __55__PLCacheDeleteUtility_purgeableSizeForBuildDirectory___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  unint64_t v4 = *(void *)(a1 + 40);
  if (v4 < a3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F28CB8];
    id v7 = a2;
    v8 = [v6 defaultManager];
    id v12 = 0;
    id v9 = [v8 attributesOfItemAtPath:v7 error:&v12];

    id v10 = v12;
    if (v9) {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v9 fileSize];
    }
  }
  return v4 < a3;
}

+ (unint64_t)purgeableSizeForVersionDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__PLCacheDeleteUtility_purgeableSizeForVersionDirectory___block_invoke;
  v7[3] = &unk_1E6254028;
  v7[4] = &v8;
  +[PLCacheDeleteUtility traverseVersionDirectory:v3 withBlock:v7];
  unint64_t v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility purgeableSizeForVersionDirectory:]();
  }

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

unint64_t __57__PLCacheDeleteUtility_purgeableSizeForVersionDirectory___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t result = +[PLCacheDeleteUtility purgeableSizeForBuildDirectory:a2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)purgeableBlockWithInfo:(id)a3 withUrgency:(int)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility purgeableBlockWithInfo:withUrgency:]();
  }

  id v7 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v8 = [v7 isEqualToString:@"/private/var"];

  if (v8)
  {
    +[PLUtilities containerPath];
    if (a4 < 2) {
      id v12 = {;
    }
      id v13 = [v12 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MajorVersion"];
      unint64_t v14 = +[PLCacheDeleteUtility purgeableSizeForVersionDirectory:v13];

      id v9 = +[PLUtilities containerPath];
      uint64_t v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MinorVersion"];
      unint64_t v11 = +[PLCacheDeleteUtility purgeableSizeForVersionDirectory:v10]+ v14;
    }
    else {
      id v9 = {;
    }
      uint64_t v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs"];
      unint64_t v11 = +[PLUtilities directorySize:v10];
    }
  }
  else
  {
    unint64_t v11 = 0;
  }
  v25[0] = @"CACHE_DELETE_VOLUME";
  v25[1] = @"CACHE_DELETE_AMOUNT";
  v26[0] = @"/private/var";
  uint64_t v15 = [NSNumber numberWithUnsignedInteger:v11];
  v26[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  id v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility purgeableBlockWithInfo:withUrgency:]((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
  }

  return v16;
}

+ (unint64_t)purgeBuildDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke;
  block[3] = &unk_1E6253E70;
  uint64_t v10 = @"MaxFilesPostPurge";
  uint64_t v11 = 2;
  if (purgeBuildDirectory__defaultOnce != -1) {
    dispatch_once(&purgeBuildDirectory__defaultOnce, block);
  }
  uint64_t v4 = purgeBuildDirectory__objectForKey;

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2;
  v8[3] = &unk_1E6254000;
  v8[4] = &v12;
  v8[5] = v4;
  +[PLCacheDeleteUtility traverseBuildDirectory:v3 withBlock:v8];
  id v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility purgeBuildDirectory:]();
  }

  unint64_t v6 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v6;
}

int64_t __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke(uint64_t a1)
{
  int64_t result = +[PLDefaults longForKey:*(void *)(a1 + 32) ifNotSet:*(void *)(a1 + 40)];
  purgeBuildDirectory__objectForKey = result;
  return result;
}

BOOL __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2(uint64_t a1, void *a2, unint64_t a3)
{
  id v5 = a2;
  unint64_t v6 = *(void *)(a1 + 40);
  if (v6 < a3)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v17 = 0;
    int v8 = [v7 attributesOfItemAtPath:v5 error:&v17];
    id v9 = v17;

    if (v8) {
      uint64_t v10 = [v8 fileSize];
    }
    else {
      uint64_t v10 = 0;
    }
    uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v16 = v9;
    char v12 = [v11 removeItemAtPath:v5 error:&v16];
    id v13 = v16;

    if (v12)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += v10;
    }
    else
    {
      uint64_t v14 = PLLogCommon();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2_cold_1((uint64_t)v5);
      }
    }
  }

  return v6 < a3;
}

+ (unint64_t)purgeVersionDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PLCacheDeleteUtility_purgeVersionDirectory___block_invoke;
  v7[3] = &unk_1E6254028;
  v7[4] = &v8;
  +[PLCacheDeleteUtility traverseVersionDirectory:v3 withBlock:v7];
  uint64_t v4 = PLLogCommon();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility purgeVersionDirectory:]();
  }

  unint64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);

  return v5;
}

unint64_t __46__PLCacheDeleteUtility_purgeVersionDirectory___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t result = +[PLCacheDeleteUtility purgeBuildDirectory:a2];
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += result;
  return result;
}

+ (id)purgeBlockWithInfo:(id)a3 withUrgency:(int)a4
{
  v33[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  unint64_t v6 = PLLogCommon();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility purgeBlockWithInfo:withUrgency:]();
  }

  id v7 = [v5 objectForKeyedSubscript:@"CACHE_DELETE_VOLUME"];
  int v8 = [v7 isEqualToString:@"/private/var"];

  if (!v8)
  {
    unint64_t v11 = 0;
    goto LABEL_13;
  }
  if (a4 < 2)
  {
    uint64_t v18 = +[PLUtilities containerPath];
    uint64_t v19 = [v18 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MajorVersion"];
    unint64_t v20 = +[PLCacheDeleteUtility purgeVersionDirectory:v19];

    id v16 = +[PLUtilities containerPath];
    id v17 = [v16 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MinorVersion"];
    unint64_t v11 = +[PLCacheDeleteUtility purgeVersionDirectory:v17]+ v20;
LABEL_11:

    goto LABEL_12;
  }
  id v9 = +[PLUtilities containerPath];
  uint64_t v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs"];
  unint64_t v11 = +[PLUtilities directorySize:v10];

  char v12 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v13 = +[PLUtilities containerPath];
  uint64_t v14 = [v13 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs"];
  id v31 = 0;
  char v15 = [v12 removeItemAtPath:v14 error:&v31];
  id v16 = v31;

  if ((v15 & 1) == 0)
  {
    id v17 = PLLogCommon();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      +[PLCacheDeleteUtility purgeBlockWithInfo:withUrgency:]((uint64_t)v16, v17);
    }
    unint64_t v11 = 0;
    goto LABEL_11;
  }
LABEL_12:

LABEL_13:
  v32[0] = @"CACHE_DELETE_VOLUME";
  v32[1] = @"CACHE_DELETE_AMOUNT";
  v33[0] = @"/private/var";
  uint64_t v21 = [NSNumber numberWithUnsignedInteger:v11];
  v33[1] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:2];

  uint64_t v23 = PLLogCommon();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility purgeBlockWithInfo:withUrgency:]((uint64_t)v22, v23, v24, v25, v26, v27, v28, v29);
  }

  return v22;
}

+ (unint64_t)enforceRetentionForDirectory:(id)a3 withMaxDays:(unint64_t)a4
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v35 = 0;
  v36 = &v35;
  uint64_t v37 = 0x2020000000;
  uint64_t v38 = 0;
  unint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__4;
  v33 = __Block_byref_object_dispose__4;
  id v34 = 0;
  id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v5];
  uint64_t v8 = *MEMORY[0x1E4F1C5F8];
  v39[0] = *MEMORY[0x1E4F1C540];
  v39[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
  uint64_t v10 = (id *)(v30 + 5);
  id obj = (id)v30[5];
  unint64_t v11 = [v6 contentsOfDirectoryAtURL:v7 includingPropertiesForKeys:v9 options:4 error:&obj];
  objc_storeStrong(v10, obj);

  if (v30[5])
  {
    char v12 = PLLogCommon();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[PLCacheDeleteUtility enforceRetentionForDirectory:withMaxDays:]();
    }

    unint64_t v13 = v36[3];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] date];
    v26[0] = 0;
    v26[1] = v26;
    v26[2] = 0x3032000000;
    void v26[3] = __Block_byref_object_copy__4;
    v26[4] = __Block_byref_object_dispose__4;
    id v27 = 0;
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__4;
    v24[4] = __Block_byref_object_dispose__4;
    id v25 = 0;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke;
    v17[3] = &unk_1E6254050;
    uint64_t v19 = v26;
    unint64_t v20 = &v29;
    uint64_t v21 = v24;
    unint64_t v23 = a4;
    id v15 = v14;
    id v18 = v15;
    uint64_t v22 = &v35;
    [v11 enumerateObjectsUsingBlock:v17];
    unint64_t v13 = v36[3];

    _Block_object_dispose(v24, 8);
    _Block_object_dispose(v26, 8);
  }
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&v35, 8);
  return v13;
}

void __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v5 = a1 + 48;
  uint64_t v4 = *(void *)(a1 + 48);
  unint64_t v6 = (id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id obj = 0;
  uint64_t v7 = *MEMORY[0x1E4F1C540];
  uint64_t v8 = (id *)(*(void *)(v4 + 8) + 40);
  id v24 = 0;
  [v3 getResourceValue:&obj forKey:v7 error:&v24];
  objc_storeStrong(v6, obj);
  objc_storeStrong(v8, v24);
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v9 = PLLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke_cold_2();
    }
  }
  else
  {
    uint64_t v10 = (id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    id v23 = 0;
    [v3 getResourceValue:&v23 forKey:*MEMORY[0x1E4F1C5F8] error:0];
    objc_storeStrong(v10, v23);
    double v11 = (double)*(unint64_t *)(a1 + 72) * 86400.0;
    [*(id *)(a1 + 32) timeIntervalSinceDate:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    if (v12 > (double)(unint64_t)v11)
    {
      unint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v14 = *(void *)(*(void *)v5 + 8);
      id v22 = *(id *)(v14 + 40);
      int v15 = [v13 removeItemAtURL:v3 error:&v22];
      objc_storeStrong((id *)(v14 + 40), v22);

      if (v15)
      {
        *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) += (int)[*(id *)(*(void *)(*(void *)(a1 + 56)+ 8)+ 40) intValue];
      }
      else
      {
        id v16 = PLLogCommon();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke_cold_1();
        }
      }
    }
    uint64_t v17 = *(void *)(*(void *)(a1 + 40) + 8);
    id v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = 0;

    uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(NSObject **)(v19 + 40);
    *(void *)(v19 + 40) = 0;
  }

  uint64_t v20 = *(void *)(*(void *)v5 + 8);
  uint64_t v21 = *(void **)(v20 + 40);
  *(void *)(v20 + 40) = 0;
}

+ (unint64_t)enforceRetentionForVersionDirectory:(id)a3
{
  id v3 = a3;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke;
  block[3] = &unk_1E6253E70;
  int v15 = @"MaxFileRetentionInDays";
  uint64_t v16 = 365;
  if (enforceRetentionForVersionDirectory__defaultOnce != -1) {
    dispatch_once(&enforceRetentionForVersionDirectory__defaultOnce, block);
  }
  uint64_t v5 = enforceRetentionForVersionDirectory__objectForKey;

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_2;
  v10[3] = &unk_1E62540A0;
  id v6 = v4;
  id v11 = v6;
  double v12 = &v17;
  uint64_t v13 = v5;
  +[PLCacheDeleteUtility traverseVersionDirectory:v3 withBlock:v10];
  uint64_t v7 = PLLogCommon();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility purgeVersionDirectory:]();
  }

  unint64_t v8 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v8;
}

int64_t __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke(uint64_t a1)
{
  int64_t result = +[PLDefaults longForKey:*(void *)(a1 + 32) ifNotSet:*(void *)(a1 + 40)];
  enforceRetentionForVersionDirectory__objectForKey = result;
  return result;
}

void __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_3;
  v6[3] = &unk_1E6254078;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 40);
  uint64_t v9 = v5;
  id v7 = v4;
  +[PLCacheDeleteUtility traverseBuildDirectory:a2 withBlock:v6];
}

BOOL __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_3(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v19 = 0;
  uint64_t v5 = [v4 attributesOfItemAtPath:v3 error:&v19];
  id v6 = v19;

  if (!v5)
  {
    id v7 = PLLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_3_cold_2((uint64_t)v3);
    }
  }
  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = [v5 fileCreationDate];
  [v8 timeIntervalSinceDate:v9];
  double v11 = v10;
  double v12 = (double)(unint64_t)a1[6] * 86400.0;

  if (v11 <= v12)
  {
    id v15 = v6;
  }
  else
  {
    uint64_t v13 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v18 = v6;
    int v14 = [v13 removeItemAtPath:v3 error:&v18];
    id v15 = v18;

    if (v14)
    {
      *(void *)(*(void *)(a1[5] + 8) + 24) += [v5 fileSize];
    }
    else
    {
      uint64_t v16 = PLLogCommon();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2_cold_1((uint64_t)v3);
      }
    }
  }

  return v11 > v12;
}

+ (id)periodicPurgeBlockWithInfo:(id)a3 withUrgency:(int)a4
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = PLLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility periodicPurgeBlockWithInfo:withUrgency:]();
  }

  id v6 = +[PLUtilities containerPath];
  id v7 = [v6 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MajorVersion"];
  unint64_t v8 = +[PLCacheDeleteUtility enforceRetentionForVersionDirectory:v7];

  uint64_t v9 = +[PLUtilities containerPath];
  double v10 = [v9 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs/MinorVersion"];
  unint64_t v11 = +[PLCacheDeleteUtility enforceRetentionForVersionDirectory:v10]+ v8;

  double v12 = +[PLUtilities containerPath];
  uint64_t v13 = [v12 stringByAppendingString:@"/Library/BatteryLife/Debug/"];
  unint64_t v14 = v11
      + +[PLCacheDeleteUtility enforceRetentionForDirectory:v13 withMaxDays:14];

  v25[0] = @"CACHE_DELETE_VOLUME";
  v25[1] = @"CACHE_DELETE_AMOUNT";
  v26[0] = @"/private/var";
  id v15 = [NSNumber numberWithUnsignedInteger:v14];
  v26[1] = v15;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:v25 count:2];

  uint64_t v17 = PLLogCommon();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[PLCacheDeleteUtility periodicPurgeBlockWithInfo:withUrgency:]((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);
  }

  return v16;
}

+ (BOOL)registerCacheDelete
{
  return CacheDeleteRegisterInfoCallbacks() == 0;
}

uint64_t __43__PLCacheDeleteUtility_registerCacheDelete__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __43__PLCacheDeleteUtility_registerCacheDelete__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

uint64_t __43__PLCacheDeleteUtility_registerCacheDelete__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_claimAutoreleasedReturnValue();
}

+ (BOOL)registerCacheDeleteFull
{
  return CacheDeleteRegisterInfoCallbacks() == 0;
}

uint64_t __47__PLCacheDeleteUtility_registerCacheDeleteFull__block_invoke()
{
  return 0;
}

uint64_t __47__PLCacheDeleteUtility_registerCacheDeleteFull__block_invoke_2()
{
  return 0;
}

uint64_t __47__PLCacheDeleteUtility_registerCacheDeleteFull__block_invoke_4()
{
  return 0;
}

+ (void)traverseBuildDirectory:(NSObject *)a3 withBlock:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = [a2 count];
  _os_log_debug_impl(&dword_1BBD2F000, a3, OS_LOG_TYPE_DEBUG, "Build directory: %@ numContents: %lu", (uint8_t *)&v4, 0x16u);
}

+ (void)purgeableSizeForBuildDirectory:.cold.1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "Purgeable %lu bytes for build directory: %@");
}

+ (void)purgeableSizeForVersionDirectory:.cold.1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "Purgeable %lu bytes for version directory: %@");
}

+ (void)purgeableBlockWithInfo:(uint64_t)a3 withUrgency:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)purgeableBlockWithInfo:withUrgency:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1BBD2F000, v0, v1, "Purgeable request with info: %@ urgency: %d");
}

+ (void)purgeBuildDirectory:.cold.1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "Purged %lu bytes for build directory: %@");
}

void __44__PLCacheDeleteUtility_purgeBuildDirectory___block_invoke_2_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v1, v2, "Failed to remove file at path: %@ with error: %@", (void)v3, DWORD2(v3));
}

+ (void)purgeVersionDirectory:.cold.1()
{
  OUTLINED_FUNCTION_6(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_1BBD2F000, v0, v1, "Purged %lu bytes for version directory: %@");
}

+ (void)purgeBlockWithInfo:(uint64_t)a3 withUrgency:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)purgeBlockWithInfo:(uint64_t)a1 withUrgency:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v4 = +[PLUtilities containerPath];
  uint64_t v5 = [v4 stringByAppendingString:@"/Library/BatteryLife/UpgradeLogs"];
  int v6 = 138412546;
  uint64_t v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_error_impl(&dword_1BBD2F000, a2, OS_LOG_TYPE_ERROR, "Failed to remove file at path: %@ with error: %@", (uint8_t *)&v6, 0x16u);
}

+ (void)purgeBlockWithInfo:withUrgency:.cold.3()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1BBD2F000, v0, v1, "Purge request with info: %@ urgency: %d");
}

+ (void)enforceRetentionForDirectory:withMaxDays:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to get contents of directory at %@ with error: %@");
}

void __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to remove file at path: %@ with error: %@");
}

void __65__PLCacheDeleteUtility_enforceRetentionForDirectory_withMaxDays___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v0, v1, "Failed to get creation date of file %@ with error: %@");
}

void __60__PLCacheDeleteUtility_enforceRetentionForVersionDirectory___block_invoke_3_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_0(&dword_1BBD2F000, v1, v2, "Failed to retreive attributes for file: %@ with error: %@", (void)v3, DWORD2(v3));
}

+ (void)periodicPurgeBlockWithInfo:(uint64_t)a3 withUrgency:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)periodicPurgeBlockWithInfo:withUrgency:.cold.2()
{
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_1BBD2F000, v0, v1, "Periodic purge request with info: %@ urgency: %d");
}

@end