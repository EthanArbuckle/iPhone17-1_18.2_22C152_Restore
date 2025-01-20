@interface PLPhotoAnalysisWallpaperService
- (PLPhotoAnalysisWallpaperService)initWithServiceProvider:(id)a3;
- (void)upgradePosterConfigurationWithAssetDirectory:(id)a3 options:(id)a4 reply:(id)a5;
@end

@implementation PLPhotoAnalysisWallpaperService

- (void).cxx_destruct
{
}

- (void)upgradePosterConfigurationWithAssetDirectory:(id)a3 options:(id)a4 reply:(id)a5
{
  id v8 = a5;
  serviceProvider = self->_serviceProvider;
  id v10 = a4;
  id v11 = a3;
  v12 = [(PLPhotoAnalysisServiceProvider *)serviceProvider wallpaperService];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __94__PLPhotoAnalysisWallpaperService_upgradePosterConfigurationWithAssetDirectory_options_reply___block_invoke;
  v18[3] = &unk_1E5874D70;
  id v13 = v8;
  id v19 = v13;
  v14 = [v12 remoteObjectProxyWithErrorHandler:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __94__PLPhotoAnalysisWallpaperService_upgradePosterConfigurationWithAssetDirectory_options_reply___block_invoke_2;
  v16[3] = &unk_1E5874DE8;
  id v17 = v13;
  id v15 = v13;
  [v14 upgradePosterConfigurationWithAssetDirectory:v11 options:v10 reply:v16];
}

uint64_t __94__PLPhotoAnalysisWallpaperService_upgradePosterConfigurationWithAssetDirectory_options_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __94__PLPhotoAnalysisWallpaperService_upgradePosterConfigurationWithAssetDirectory_options_reply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (PLPhotoAnalysisWallpaperService)initWithServiceProvider:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLPhotoAnalysisWallpaperService;
  v6 = [(PLPhotoAnalysisWallpaperService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_serviceProvider, a3);
  }

  return v7;
}

@end