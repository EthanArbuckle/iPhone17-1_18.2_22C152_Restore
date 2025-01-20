@interface PXStoryAutoEditConfigurationFactory
+ (id)autoEditConfiguration;
@end

@implementation PXStoryAutoEditConfigurationFactory

+ (id)autoEditConfiguration
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = &OBJC_IVAR____TtCE12PhotosUICoreCSo20PXStoryConfigurationP33_27B58BDBD52885D8CE4F3AB1064A7A5514AssociatedData_environmentValues;
  if ((autoEditConfiguration_shouldCheckDefaultConfigurationFile & 1) != 0 || !PFOSVariantHasInternalUI()) {
    goto LABEL_13;
  }
  v3 = [MEMORY[0x1E4F8B908] defaultSystemPhotoDataDirectory];
  v4 = [v3 stringByAppendingPathComponent:@"Configuration"];

  v5 = (void *)MEMORY[0x1E4F1CB10];
  v6 = [v4 stringByAppendingPathComponent:@"PFStoryAutoEditDefaultConfig.plist"];
  v7 = [v5 fileURLWithPath:v6];

  v8 = objc_opt_new();
  v9 = [v7 path];
  if ([v8 isReadableFileAtPath:v9])
  {
    v2 = (uint64_t *)[objc_alloc(MEMORY[0x1E4F8CDA8]) initWithConfigurationFileAtURL:v7];
    v10 = PLStoryGetLog();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v11)
      {
        int v14 = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_INFO, "PXStoryAutoEditConfigurationFactory loaded from on-device file at %@", (uint8_t *)&v14, 0xCu);
      }

      int v12 = 0;
    }
    else
    {
      if (v11)
      {
        int v14 = 138412290;
        v15 = v7;
        _os_log_impl(&dword_1A9AE7000, v10, OS_LOG_TYPE_INFO, "PXStoryAutoEditConfigurationFactory failed to load from on-device file at %@", (uint8_t *)&v14, 0xCu);
      }

      v2 = 0;
      int v12 = 1;
    }
  }
  else
  {
    int v12 = 1;
    autoEditConfiguration_shouldCheckDefaultConfigurationFile = 1;
  }

  if (v12)
  {
LABEL_13:
    if (autoEditConfiguration_onceToken != -1) {
      dispatch_once(&autoEditConfiguration_onceToken, &__block_literal_global_104046);
    }
    v2 = (uint64_t *)(id)autoEditConfiguration_sharedConfiguration;
  }
  return v2;
}

void __60__PXStoryAutoEditConfigurationFactory_autoEditConfiguration__block_invoke()
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v0 = objc_opt_new();
  v1 = [v0 fileURLForFactorName:@"com.apple.photos.autoedit.configuration"];
  if (!v1) {
    goto LABEL_6;
  }
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4F8CDA8]) initWithConfigurationFileAtURL:v1];
  v3 = (void *)autoEditConfiguration_sharedConfiguration;
  autoEditConfiguration_sharedConfiguration = v2;

  if (autoEditConfiguration_sharedConfiguration)
  {
    v4 = PLStoryGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      v9 = v1;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_INFO, "PXStoryAutoEditConfigurationFactory loaded from Turi at %@", (uint8_t *)&v8, 0xCu);
    }

LABEL_6:
    if (autoEditConfiguration_sharedConfiguration) {
      goto LABEL_10;
    }
  }
  v5 = PLStoryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_INFO, "PXStoryAutoEditConfigurationFactory standardConfiguration", (uint8_t *)&v8, 2u);
  }

  uint64_t v6 = [MEMORY[0x1E4F8CDA8] standardConfiguration];
  v7 = (void *)autoEditConfiguration_sharedConfiguration;
  autoEditConfiguration_sharedConfiguration = v6;

LABEL_10:
}

@end