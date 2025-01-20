@interface PXStoryColorGradingConfigurationFactory
+ (PXStoryColorGradingConfiguration)sharedConfiguration;
+ (id)newConfiguration;
@end

@implementation PXStoryColorGradingConfigurationFactory

void __59__PXStoryColorGradingConfigurationFactory_newConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:*(void *)(a1 + 32) withExtension:@"plist"];

  if (!v3) {
    PXAssertGetLog();
  }
  v4 = PLStoryGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_INFO, "PXStoryConcreteColorGradingRepository config file loaded from bundle at %@", buf, 0xCu);
  }

  id v8 = 0;
  uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v3 error:&v8];
  id v6 = v8;
  v7 = (void *)newConfiguration_bundledGradeInfo;
  newConfiguration_bundledGradeInfo = v5;

  if (!newConfiguration_bundledGradeInfo) {
    PXAssertGetLog();
  }
}

+ (id)newConfiguration
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1AD10CB00]();
  v4 = [MEMORY[0x1E4F8B908] defaultSystemPhotoDataDirectory];
  uint64_t v5 = [v4 stringByAppendingPathComponent:@"Configuration"];
  id v6 = [v5 stringByAppendingPathComponent:@"PXStoryColorGradeConfig"];
  v7 = [v6 stringByAppendingPathExtension:@"plist"];

  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7];
  id v22 = 0;
  v9 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v8 error:&v22];
  id v10 = v22;
  if (v9)
  {
    uint64_t v11 = PLStoryGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v8;
      _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_INFO, "PXStoryConcreteColorGradingRepository config file loaded from on-device file at %@", buf, 0xCu);
    }

    v12 = [v9 objectForKeyedSubscript:@"cubes"];
    if (!v12) {
      PXAssertGetLog();
    }
    v13 = [[PXStoryColorGradingConfiguration alloc] initWithCubeInfos:v12];
  }
  else
  {
    v13 = 0;
  }

  if (!v13)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__PXStoryColorGradingConfigurationFactory_newConfiguration__block_invoke;
    block[3] = &unk_1E5DD35E0;
    v19 = @"PXStoryColorGradeConfig";
    id v20 = a1;
    SEL v21 = a2;
    if (newConfiguration_onceToken != -1) {
      dispatch_once(&newConfiguration_onceToken, block);
    }
    v14 = [(id)newConfiguration_bundledGradeInfo objectForKeyedSubscript:@"cubes"];
    if (!v14) {
      PXAssertGetLog();
    }
    v13 = [[PXStoryColorGradingConfiguration alloc] initWithCubeInfos:v14];

    if (!v13)
    {
      v15 = PLStoryGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_INFO, "PXStoryConcreteColorGradingRepository config fallback", buf, 2u);
      }

      v13 = objc_alloc_init(PXStoryColorGradingConfiguration);
    }
  }
  return v13;
}

+ (PXStoryColorGradingConfiguration)sharedConfiguration
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __62__PXStoryColorGradingConfigurationFactory_sharedConfiguration__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = a1;
  if (sharedConfiguration_onceToken != -1) {
    dispatch_once(&sharedConfiguration_onceToken, block);
  }
  v2 = (void *)sharedConfiguration_sharedConfig;
  return (PXStoryColorGradingConfiguration *)v2;
}

void __62__PXStoryColorGradingConfigurationFactory_sharedConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) newConfiguration];
  v2 = (void *)sharedConfiguration_sharedConfig;
  sharedConfiguration_sharedConfig = v1;
}

@end