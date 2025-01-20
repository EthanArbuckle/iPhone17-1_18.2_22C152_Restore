@interface MorphunAssets(MorphunAssetsPrivate)
@end

@implementation MorphunAssets(MorphunAssetsPrivate)

+ (void)validateLocale:()MorphunAssetsPrivate .cold.1(os_log_t log)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 136315394;
  v2 = "+[MorphunAssets(MorphunAssetsPrivate) validateLocale:]";
  __int16 v3 = 2112;
  v4 = @"Locale passed in was nil!";
  _os_log_error_impl(&dword_2142D8000, log, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v1, 0x16u);
}

+ (void)validateLocale:()MorphunAssetsPrivate .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  __int16 v3 = "+[MorphunAssets(MorphunAssetsPrivate) validateLocale:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2142D8000, a2, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v2, 0x16u);
}

@end