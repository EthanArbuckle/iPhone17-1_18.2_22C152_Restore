@interface FBSSceneSettingsDiff(PosterUIFoundation)
- (uint64_t)pui_inspect:()PosterUIFoundation;
- (uint64_t)pui_posterContentDidChange;
@end

@implementation FBSSceneSettingsDiff(PosterUIFoundation)

- (uint64_t)pui_posterContentDidChange
{
  return objc_msgSend(a1, "pui_inspect:", 20467);
}

- (uint64_t)pui_inspect:()PosterUIFoundation
{
  if (pui_inspect__onceToken != -1) {
    dispatch_once(&pui_inspect__onceToken, &__block_literal_global);
  }
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __56__FBSSceneSettingsDiff_PosterUIFoundation__pui_inspect___block_invoke_2;
  v7[3] = &unk_265470DC8;
  v7[4] = &v8;
  [(id)pui_inspect__inspector observeOtherSetting:a3 withBlock:v7];
  [(id)pui_inspect__inspector inspectDiff:a1 withContext:0];
  [(id)pui_inspect__inspector removeAllObservers];
  uint64_t v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

@end