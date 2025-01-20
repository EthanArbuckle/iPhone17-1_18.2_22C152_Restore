@interface PXViewCountAnalyticsDestination
- (void)processEvent:(id)a3;
@end

@implementation PXViewCountAnalyticsDestination

- (void)processEvent:(id)a3
{
  id v5 = a3;
  v6 = [v5 name];
  if ([v6 isEqualToString:@"com.apple.photos.CPAnalytics.incrementAssetViewCount"])
  {
    v7 = [v5 propertyForKey:*MEMORY[0x1E4F56558]];
    v8 = [v7 photoLibrary];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __48__PXViewCountAnalyticsDestination_processEvent___block_invoke;
    v26[3] = &unk_1E5DD36F8;
    v9 = &v27;
    v27 = v7;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __48__PXViewCountAnalyticsDestination_processEvent___block_invoke_2;
    v25[3] = &unk_1E5DC7060;
    v25[4] = self;
    v25[5] = a2;
    id v10 = v7;
    v11 = v26;
    v12 = v25;
LABEL_5:
    objc_msgSend(v8, "performChanges:completionHandler:", v11, v12, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23);

    goto LABEL_6;
  }
  if ([v6 isEqualToString:@"com.apple.photos.CPAnalytics.incrementMemoryViewCount"])
  {
    v13 = [v5 propertyForKey:*MEMORY[0x1E4F56548]];
    v8 = [v13 photoLibrary];
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __48__PXViewCountAnalyticsDestination_processEvent___block_invoke_192;
    v23 = &unk_1E5DD36F8;
    v9 = &v24;
    v24 = v13;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    v16 = __48__PXViewCountAnalyticsDestination_processEvent___block_invoke_2_195;
    v17 = &unk_1E5DC7060;
    v18 = self;
    SEL v19 = a2;
    id v10 = v13;
    v11 = &v20;
    v12 = &v14;
    goto LABEL_5;
  }
LABEL_6:
}

void __48__PXViewCountAnalyticsDestination_processEvent___block_invoke(uint64_t a1)
{
  id v1 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  [v1 incrementViewCount];
}

void __48__PXViewCountAnalyticsDestination_processEvent___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0) {
    PXAssertGetLog();
  }
}

void __48__PXViewCountAnalyticsDestination_processEvent___block_invoke_192(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F39170] changeRequestForMemory:*(void *)(a1 + 32)];
  id v1 = [MEMORY[0x1E4F1C9C8] date];
  [v2 setLastMoviePlayedDate:v1];
  [v2 setLastViewedDate:v1];
  [v2 incrementPlayCount];
}

void __48__PXViewCountAnalyticsDestination_processEvent___block_invoke_2_195(uint64_t a1, char a2, void *a3)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0) {
    PXAssertGetLog();
  }
}

@end