@interface UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction
@end

@implementation UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction

void __97___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction_sceneSettingsSafeAreaInsetsDiffInspector__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __97___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction_sceneSettingsSafeAreaInsetsDiffInspector__block_invoke_2(uint64_t a1, unsigned char *a2)
{
  *a2 |= 2u;
}

void __97___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction_sceneSettingsSafeAreaInsetsDiffInspector__block_invoke_3(uint64_t a1, unsigned char *a2)
{
  *a2 |= 4u;
}

void __97___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction_sceneSettingsSafeAreaInsetsDiffInspector__block_invoke_4(uint64_t a1, unsigned char *a2)
{
  *a2 |= 8u;
}

void __143___UIWindowHostingSceneSafeAreaInsetsSettingsDiffAction__updateSafeAreaInsetsWithSettingsObserverContext_windowHostingScene_transitionContext___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = *(id *)(a1 + 32);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * v5++), "_sceneSettingsSafeAreaInsetsDidChange", (void)v6);
      }
      while (v3 != v5);
      uint64_t v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

@end