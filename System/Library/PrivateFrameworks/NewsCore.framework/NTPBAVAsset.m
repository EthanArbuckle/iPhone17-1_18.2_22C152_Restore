@interface NTPBAVAsset
- (id)resolvedCacheURL;
@end

@implementation NTPBAVAsset

- (id)resolvedCacheURL
{
  id v1 = a1;
  if (a1)
  {
    v2 = [a1 bookmark];
    if (!v2)
    {
      id v1 = 0;
LABEL_11:

      goto LABEL_12;
    }
    id v12 = 0;
    v3 = [MEMORY[0x1E4F1CB10] URLByResolvingBookmarkData:v2 options:0 relativeToURL:0 bookmarkDataIsStale:0 error:&v12];
    id v4 = v12;
    v5 = v4;
    if (v3)
    {
      if ([v3 checkResourceIsReachableAndReturnError:0])
      {
        id v1 = v3;
LABEL_10:

        goto LABEL_11;
      }
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_134;
      v8[3] = &unk_1E5B4E868;
      v8[4] = v1;
      id v9 = v5;
      __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_134((uint64_t)v8);
      id v1 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v9;
    }
    else
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_2;
      v10[3] = &unk_1E5B4E868;
      v10[4] = v1;
      id v11 = v4;
      __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_2((uint64_t)v10);
      id v1 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v11;
    }

    goto LABEL_10;
  }
LABEL_12:
  return v1;
}

uint64_t __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 identifier];
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "AV asset cache failed to turn bookmark data into bookmark for %{public}@ with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

uint64_t __41__NTPBAVAsset_Bookmark__resolvedCacheURL__block_invoke_134(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v2 = (void *)FCAVAssetLog;
  if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
  {
    id v4 = *(void **)(a1 + 32);
    v5 = v2;
    v6 = [v4 identifier];
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 138543618;
    id v9 = v6;
    __int16 v10 = 2114;
    uint64_t v11 = v7;
    _os_log_error_impl(&dword_1A460D000, v5, OS_LOG_TYPE_ERROR, "AV asset cache found bookmark whose file isn't reachable for %{public}@ with error: %{public}@", (uint8_t *)&v8, 0x16u);
  }
  return 0;
}

@end