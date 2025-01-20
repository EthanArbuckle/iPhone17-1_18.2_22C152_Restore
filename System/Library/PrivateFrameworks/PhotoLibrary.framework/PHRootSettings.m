@interface PHRootSettings
+ (id)settingsControllerModule;
+ (id)sharedSettings;
+ (void)_rebuildMoments;
- (PHImageManagerSettings)imageManagerSettings;
- (PHResourceDownloadSettings)resourceDownloadSettings;
- (id)parentSettings;
@end

@implementation PHRootSettings

+ (void)_rebuildMoments
{
  v2 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  v3 = [v2 assetsdClient];
  v4 = [v3 debugClient];
  id v7 = 0;
  char v5 = [v4 rebuildMomentsDeletingExistingMoments:0 error:&v7];
  id v6 = v7;

  if ((v5 & 1) == 0) {
    NSLog(&cfstr_SynchronouslyR.isa, v6);
  }
}

+ (id)settingsControllerModule
{
  v27[3] = *MEMORY[0x1E4F143B8];
  v3 = (void *)MEMORY[0x1E4F94160];
  v22 = [MEMORY[0x1E4F94130] rowWithTitle:@"Image Manager" childSettingsKeyPath:@"imageManagerSettings"];
  v26[0] = v22;
  v21 = [MEMORY[0x1E4F94130] rowWithTitle:@"Resource Download Request" childSettingsKeyPath:@"resourceDownloadSettings"];
  v26[1] = v21;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v19 = [v3 sectionWithRows:v20 title:@"PhotoKit"];
  v27[0] = v19;
  v4 = (void *)MEMORY[0x1E4F94160];
  char v5 = (void *)MEMORY[0x1E4F940F8];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __42__PHRootSettings_settingsControllerModule__block_invoke;
  v23[3] = &__block_descriptor_40_e40_B24__0__PTRow_8__PTUIModuleController_16l;
  v23[4] = a1;
  id v6 = [MEMORY[0x1E4F94190] actionWithHandler:v23];
  id v7 = [v5 rowWithTitle:@"Rebuild Moments" action:v6];
  v25 = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
  v9 = [v4 sectionWithRows:v8 title:@"Actions"];
  v27[1] = v9;
  v10 = (void *)MEMORY[0x1E4F94160];
  v11 = (void *)MEMORY[0x1E4F940F8];
  v12 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  v13 = [v11 rowWithTitle:@"Restore All Defaults" action:v12];
  v24 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v15 = [v10 sectionWithRows:v14];
  v27[2] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  v17 = [v3 moduleWithTitle:@"PhotoKit Settings" contents:v16];

  return v17;
}

uint64_t __42__PHRootSettings_settingsControllerModule__block_invoke(uint64_t a1)
{
  return 1;
}

+ (id)sharedSettings
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__PHRootSettings_sharedSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedSettings_onceToken != -1) {
    dispatch_once(&sharedSettings_onceToken, block);
  }
  v2 = (void *)sharedSettings_sharedSettings;
  return v2;
}

uint64_t __32__PHRootSettings_sharedSettings__block_invoke(uint64_t a1)
{
  sharedSettings_sharedSettings = [*(id *)(a1 + 32) createSharedSettings];
  return MEMORY[0x1F41817F8]();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDownloadSettings, 0);
  objc_storeStrong((id *)&self->_imageManagerSettings, 0);
}

- (PHResourceDownloadSettings)resourceDownloadSettings
{
  return self->_resourceDownloadSettings;
}

- (PHImageManagerSettings)imageManagerSettings
{
  return self->_imageManagerSettings;
}

- (id)parentSettings
{
  return 0;
}

@end