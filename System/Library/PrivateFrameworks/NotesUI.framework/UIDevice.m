@interface UIDevice
@end

@implementation UIDevice

void __38__UIDevice_IC__ic_isLiveTextAvailable__block_invoke()
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 objectForKey:@"AppleLiveTextEnabled" inDomain:*MEMORY[0x1E4F283E0]];

  if (v1)
  {
    char v2 = [v1 BOOLValue];
  }
  else
  {
    if (_os_feature_enabled_impl())
    {
      v3 = [&unk_1F09A3F08 arrayByAddingObjectsFromArray:&unk_1F09A3F20];
    }
    else
    {
      v3 = &unk_1F09A3F08;
    }
    v4 = (void *)MEMORY[0x1E4F1CA20];
    v5 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
    v8[0] = v5;
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    v7 = [v4 matchedLanguagesFromAvailableLanguages:v3 forPreferredLanguages:v6];

    char v2 = [v7 count] != 0;
  }

  ic_isLiveTextAvailable_isIPLiveTextEnabled = v2;
}

@end