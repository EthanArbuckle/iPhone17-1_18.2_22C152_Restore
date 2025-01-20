@interface WFAppShortcutsDenyList
+ (BOOL)isAppShortcutDenyListed:(id)a3 inEnvironment:(unint64_t)a4;
+ (id)denyList;
+ (id)spotlightBonusSPI;
@end

@implementation WFAppShortcutsDenyList

+ (BOOL)isAppShortcutDenyListed:(id)a3 inEnvironment:(unint64_t)a4
{
  id v6 = a3;
  v7 = [v6 bundleIdentifier];
  if ([v7 isEqualToString:@"com.apple.ShortcutsActions"])
  {
    v8 = [v6 actionIdentifier];
    int v9 = [v8 isEqualToString:@"StartCallTopHitAction"];

    if (v9)
    {
      v10 = +[WFDevice currentDevice];
      int v11 = [v10 hasCapability:@"CellularTelephony"];

      if (!v11) {
        goto LABEL_9;
      }
    }
  }
  else
  {
  }
  v12 = [v6 bundleIdentifier];
  if (([v12 isEqualToString:@"com.apple.ShortcutsActions"] & 1) == 0)
  {

    goto LABEL_11;
  }
  v13 = [v6 actionIdentifier];
  int v14 = [v13 isEqualToString:@"StartFaceTimeAudioCallTopHitAction"];

  if (!v14
    || (+[WFDevice currentDevice],
        v15 = objc_claimAutoreleasedReturnValue(),
        char v16 = [v15 isChineseRegionDevice],
        v15,
        (v16 & 1) == 0))
  {
LABEL_11:
    if (a4 == 2)
    {
      v18 = [v6 bundleIdentifier];
      if ([v18 isEqualToString:@"com.apple.ShortcutsActions"])
      {
        v19 = [a1 spotlightBonusSPI];
        v20 = [v6 actionIdentifier];
        char v21 = [v19 containsObject:v20];

        if (v21)
        {
          BOOL v17 = 0;
          goto LABEL_17;
        }
      }
      else
      {
      }
    }
    v22 = [a1 denyList];
    v23 = [v6 bundleIdentifier];
    v24 = [v22 objectForKey:v23];
    v25 = [v6 actionIdentifier];
    v26 = [v24 objectForKey:v25];
    BOOL v17 = ([v26 unsignedIntegerValue] & a4) != 0;

    goto LABEL_17;
  }
LABEL_9:
  BOOL v17 = 1;
LABEL_17:

  return v17;
}

+ (id)denyList
{
  if (denyList_onceToken != -1) {
    dispatch_once(&denyList_onceToken, &__block_literal_global_10766);
  }
  v2 = (void *)denyList_denyList;
  return v2;
}

void __34__WFAppShortcutsDenyList_denyList__block_invoke()
{
  v3[6] = *MEMORY[0x1E4F143B8];
  v2[0] = @"com.apple.mobiletimer";
  v2[1] = @"com.apple.NanoStopwatch";
  v3[0] = &unk_1F0CB1E40;
  v3[1] = &unk_1F0CB1E68;
  v2[2] = @"com.apple.VoiceMemos";
  v2[3] = @"com.apple.ShortcutsActions";
  v3[2] = &unk_1F0CB1E90;
  v3[3] = &unk_1F0CB1EB8;
  v2[4] = @"com.apple.camera";
  v2[5] = @"com.apple.reminders";
  v3[4] = &unk_1F0CB1EE0;
  v3[5] = &unk_1F0CB1F08;
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:6];
  v1 = (void *)denyList_denyList;
  denyList_denyList = v0;
}

+ (id)spotlightBonusSPI
{
  if (spotlightBonusSPI_onceToken != -1) {
    dispatch_once(&spotlightBonusSPI_onceToken, &__block_literal_global_118);
  }
  v2 = (void *)spotlightBonusSPI_bonusSPI;
  return v2;
}

void __43__WFAppShortcutsDenyList_spotlightBonusSPI__block_invoke()
{
  uint64_t v0 = (void *)spotlightBonusSPI_bonusSPI;
  spotlightBonusSPI_bonusSPI = (uint64_t)&unk_1F0CB1DA8;
}

@end