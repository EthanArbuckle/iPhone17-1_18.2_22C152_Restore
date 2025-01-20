@interface MorphunAssets(MorphunAssetsSubscription)
- (void)readSubscriptionView;
@end

@implementation MorphunAssets(MorphunAssetsSubscription)

+ (void)initForSiriX:()MorphunAssetsSubscription .cold.1(uint8_t *buf, void *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "+[MorphunAssets(MorphunAssetsSubscription) initForSiriX:]";
  _os_log_error_impl(&dword_2142D8000, log, OS_LOG_TYPE_ERROR, "%s A user Siri locale was nil!", buf, 0xCu);
}

- (void)readSubscriptionView
{
  OUTLINED_FUNCTION_0_0(&dword_2142D8000, a1, a3, "%s A nil dictionary was returned from the NSUserDefaults database (key = %@).", a5, a6, a7, a8, 2u);
}

- (void)downloadLocaleIfNeeded:()MorphunAssetsSubscription withCompletion:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[MorphunAssets(MorphunAssetsSubscription) downloadLocaleIfNeeded:withCompletion:]";
  _os_log_error_impl(&dword_2142D8000, log, OS_LOG_TYPE_ERROR, "%s Could not get remote version from metadata. Defaulting to download needed.", (uint8_t *)&v1, 0xCu);
}

- (void)removeLanguageIfNeeded:()MorphunAssetsSubscription .cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_2142D8000, v0, v1, "%s %@", v2, v3, v4, v5, 2u);
}

- (void)isSubscribedToLocale:()MorphunAssetsSubscription .cold.1(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 subscriptionProcessKey];
  v5[0] = 136315394;
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2142D8000, v3, OS_LOG_TYPE_ERROR, "%s No subscription array found for process key %@.", (uint8_t *)v5, 0x16u);
}

@end