@interface PRUISSwitcherSceneClientSettingsDiffInspector
+ (id)diffInspectorForObservingDiffContext;
- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4;
- (void)observePrimaryPosterOffsetWithBlock:(id)a3;
- (void)observePrimaryPosterScaleWithBlock:(id)a3;
- (void)observeSwitcherContextIDWithBlock:(id)a3;
- (void)observeSwitcherLayoutModeWithBlock:(id)a3;
@end

@implementation PRUISSwitcherSceneClientSettingsDiffInspector

+ (id)diffInspectorForObservingDiffContext
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 observeSwitcherLayoutModeWithBlock:&__block_literal_global_8];
  [v2 observeSwitcherContextIDWithBlock:&__block_literal_global_2];
  [v2 observePrimaryPosterScaleWithBlock:&__block_literal_global_4];
  [v2 observePrimaryPosterOffsetWithBlock:&__block_literal_global_6];

  return v2;
}

void __85__PRUISSwitcherSceneClientSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke(uint64_t a1, unsigned char *a2)
{
  *a2 |= 1u;
}

void __85__PRUISSwitcherSceneClientSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_2(uint64_t a1, unsigned char *a2)
{
  *a2 |= 2u;
}

void __85__PRUISSwitcherSceneClientSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_3(uint64_t a1, unsigned char *a2)
{
  *a2 |= 4u;
}

void __85__PRUISSwitcherSceneClientSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_4(uint64_t a1, unsigned char *a2)
{
  *a2 |= 8u;
}

- (void)observeSwitcherLayoutModeWithBlock:(id)a3
{
}

- (void)observeSwitcherContextIDWithBlock:(id)a3
{
}

- (void)observePrimaryPosterScaleWithBlock:(id)a3
{
}

- (void)observePrimaryPosterOffsetWithBlock:(id)a3
{
}

- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __80__PRUISSwitcherSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_26546BA10;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

uint64_t __80__PRUISSwitcherSceneClientSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end