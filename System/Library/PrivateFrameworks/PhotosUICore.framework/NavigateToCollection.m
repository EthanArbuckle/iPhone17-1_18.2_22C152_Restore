@interface NavigateToCollection
@end

@implementation NavigateToCollection

void ___NavigateToCollection_block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = *(void **)(a1 + 40);
  id v7 = *(id *)(a1 + 32);
  id v8 = v6;
  if (a2)
  {
    v9 = [NSString stringWithFormat:@"com.apple.photos.CPAnalytics.navigateTo%@Succeeded", v7];
    v10 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(void *)&buf[4] = v7;
      _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_DEFAULT, "Did navigate to: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v11 = PLUserStatusUIGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = v7;
      __int16 v16 = 2112;
      id v17 = v5;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_ERROR, "Failed to navigate to: %{public}@, error: %@", buf, 0x16u);
    }

    v9 = [NSString stringWithFormat:@"com.apple.photos.CPAnalytics.navigateTo%@Failed", v7];
  }
  v12 = (void *)MEMORY[0x1E4F56658];
  uint64_t v14 = *MEMORY[0x1E4F56560];
  *(void *)buf = v8;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:buf forKeys:&v14 count:1];
  [v12 sendEvent:v9 withPayload:v13];
}

@end