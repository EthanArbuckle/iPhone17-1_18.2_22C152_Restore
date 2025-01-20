@interface SBXXShowNetworkPromptsIfNecessary
@end

@implementation SBXXShowNetworkPromptsIfNecessary

void ___SBXXShowNetworkPromptsIfNecessary_block_invoke(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40)) {
    goto LABEL_7;
  }
  int v2 = [*(id *)(a1 + 32) dataUsage];
  int v3 = v2;
  if (*(unsigned char *)(a1 + 40))
  {
    char v4 = [*(id *)(a1 + 32) dataUsage];
    BOOL v5 = (v4 & 2) == 0;
    if (v3)
    {
      if ((v4 & 2) != 0) {
        return;
      }
      goto LABEL_14;
    }
LABEL_8:
    v6 = +[SBAirplaneModeController sharedInstance];
    if ([v6 isInAirplaneMode])
    {
      v7 = +[SBWiFiManager sharedInstance];
      char v8 = [v7 isPowered];

      if (v8)
      {
        if (!v5) {
          return;
        }
        goto LABEL_14;
      }
      v6 = [(id)SBApp applicationLaunchAlertService];
      [v6 showLaunchAlertOfType:2 forApplication:*(void *)(a1 + 32)];
    }

    if (!v5) {
      return;
    }
    goto LABEL_14;
  }
  if (!v2)
  {
LABEL_7:
    BOOL v5 = 1;
    goto LABEL_8;
  }
LABEL_14:
  id v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = *MEMORY[0x1E4FA79F8];
  v10 = *(void **)(a1 + 32);
  v11 = (void *)MEMORY[0x1E4F1C9E8];
  v12 = [v10 bundleIdentifier];
  v13 = [v11 dictionaryWithObject:v12 forKey:*MEMORY[0x1E4FA7B10]];
  [v14 postNotificationName:v9 object:v10 userInfo:v13];
}

@end