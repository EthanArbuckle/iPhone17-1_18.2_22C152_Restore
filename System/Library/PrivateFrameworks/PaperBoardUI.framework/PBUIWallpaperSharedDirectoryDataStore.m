@interface PBUIWallpaperSharedDirectoryDataStore
- (PBUIWallpaperSharedDirectoryDataStore)initWithDirectoryURL:(id)a3;
- (id)directoryCreationAttributes;
- (void)didWriteFileToURL:(id)a3;
@end

@implementation PBUIWallpaperSharedDirectoryDataStore

- (PBUIWallpaperSharedDirectoryDataStore)initWithDirectoryURL:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PBUIWallpaperSharedDirectoryDataStore;
  v3 = [(PBUIWallpaperDirectoryDataStore *)&v6 initWithDirectoryURL:a3];
  v4 = v3;
  if (v3) {
    [(PBUIWallpaperDirectoryDataStore *)v3 setSupportsWallpaperOptions:1];
  }
  return v4;
}

- (id)directoryCreationAttributes
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F28330];
  v2 = [NSNumber numberWithUnsignedShort:511];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (void)didWriteFileToURL:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PBUIWallpaperSharedDirectoryDataStore;
  [(PBUIWallpaperDirectoryDataStore *)&v14 didWriteFileToURL:v4];
  id v13 = 0;
  uint64_t v5 = *MEMORY[0x1E4F1C5E8];
  int v6 = [v4 getResourceValue:&v13 forKey:*MEMORY[0x1E4F1C5E8] error:0];
  v7 = (__CFFileSecurity *)v13;
  v8 = v7;
  if (v6)
  {
    CFFileSecuritySetMode(v7, 0x1B6u);
    id v12 = 0;
    char v9 = [v4 setResourceValue:v8 forKey:v5 error:&v12];
    id v10 = v12;
    if ((v9 & 1) == 0)
    {
      v11 = PBUILogCommon();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        -[PBUIWallpaperSharedDirectoryDataStore didWriteFileToURL:]();
      }
    }
  }
}

- (void)didWriteFileToURL:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_1(&dword_1BC4B3000, v0, v1, "Error setting permissions on wallpaper file '%{public}@': %{public}@");
}

@end