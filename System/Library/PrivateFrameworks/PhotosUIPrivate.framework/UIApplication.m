@interface UIApplication
@end

@implementation UIApplication

uint64_t __48__UIApplication_PhotosUI__pu_prepareCPAnalytics__block_invoke()
{
  v0 = (void *)MEMORY[0x1E4F56658];
  v1 = objc_msgSend(MEMORY[0x1E4F28B50], "pu_PhotosUIFrameworkBundle");
  [v0 updateWithConfigurationFilename:@"CPAnalyticsConfig-PhotosUI" inBundle:v1];

  return MEMORY[0x1F4143B28]();
}

void __62__UIApplication_PhotosUI__pu_startedAnimationSubTest_forTest___block_invoke(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = [*(id *)(a1 + 40) stringByAppendingString:@"-Latency"];
  [v2 finishedSubTest:v3 forTest:*(void *)(a1 + 48)];

  [*(id *)(a1 + 32) startedSubTest:@"Animation" forTest:*(void *)(a1 + 48) withMetrics:&unk_1F078B900];
  v4 = *(void **)(a1 + 32);
  id v5 = [*(id *)(a1 + 40) stringByAppendingString:@"-Animation"];
  [v4 startedSubTest:v5 forTest:*(void *)(a1 + 48) withMetrics:&unk_1F078B918];
}

void __46__UIApplication_PhotosUI__ppt_testDefinitions__block_invoke()
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v0 userInterfaceIdiom] == 1) {
    v1 = @"~ipad";
  }
  else {
    v1 = @"~iphone";
  }
  v2 = v1;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v18 = v2;
  v23[0] = v2;
  v23[1] = @"~iphone";
  v23[2] = @"~ipad";
  v23[3] = &stru_1F06BE7B8;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:4];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v20;
LABEL_6:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v20 != v6) {
        objc_enumerationMutation(v3);
      }
      uint64_t v8 = *(void *)(*((void *)&v19 + 1) + 8 * v7);
      v9 = [MEMORY[0x1E4F28B50] mainBundle];
      v10 = [v9 bundlePath];
      v11 = [NSString stringWithFormat:@"testDefinitions%@.plist", v8];
      v12 = [v10 stringByAppendingPathComponent:v11];

      v13 = (void *)MEMORY[0x1E4F28F98];
      v14 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v12];
      uint64_t v15 = [v13 propertyListWithData:v14 options:0 format:0 error:0];
      v16 = (void *)ppt_testDefinitions_testDefinitions;
      ppt_testDefinitions_testDefinitions = v15;

      uint64_t v17 = ppt_testDefinitions_testDefinitions;
      if (v17) {
        break;
      }
      if (v5 == ++v7)
      {
        uint64_t v5 = [v3 countByEnumeratingWithState:&v19 objects:v24 count:16];
        if (v5) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
}

void __77__UIApplication_Debugging___pu_debugSearchViewControllerHierarchyUsingBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
    *a3 = 1;
  }
}

uint64_t __60__UIApplication_Debugging__pu_debugCurrentPrivacyController__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_debugCurrentPrivacyController");
}

uint64_t __52__UIApplication_Debugging__pu_debugCurrentViewModel__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_debugCurrentViewModel");
}

uint64_t __59__UIApplication_Debugging__pu_debugCurrentlySelectedAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_debugCurrentlySelectedAssets");
}

uint64_t __63__UIApplication_Debugging__pu_debugCurrentPhotosViewController__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __48__UIApplication_Debugging__pu_debugCurrentAsset__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pu_debugCurrentAsset");
}

@end