@interface PREditingSceneClientSettingsDiffInspector
- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4;
@end

@implementation PREditingSceneClientSettingsDiffInspector

- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __76__PREditingSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_1E54DCE60;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

uint64_t __76__PREditingSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end