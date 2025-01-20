@interface PRUISSwitcherSceneSettingsDiffInspector
+ (id)diffInspectorForObservingDiffContext;
- (void)_observeOtherSetting:(unint64_t)a3 withBlock:(id)a4;
- (void)observeLeadingTopButtonFrameWithBlock:(id)a3;
- (void)observeLockPosterComplicationRowHiddenWithBlock:(id)a3;
- (void)observeLockPosterFloatingLayerInlinedWithBlock:(id)a3;
- (void)observeLockPosterLiveContentLayerWithBlock:(id)a3;
- (void)observeLockPosterLiveFloatingLayerWithBlock:(id)a3;
- (void)observeLockPosterOverlayLayerWithBlock:(id)a3;
- (void)observePreferredSwitcherLayoutModeWithBlock:(id)a3;
- (void)observeTrailingTopButtonFrameWithBlock:(id)a3;
- (void)observeVibrancyConfigurationWithBlock:(id)a3;
@end

@implementation PRUISSwitcherSceneSettingsDiffInspector

+ (id)diffInspectorForObservingDiffContext
{
  id v2 = objc_alloc_init((Class)a1);
  [v2 observePreferredSwitcherLayoutModeWithBlock:&__block_literal_global_9];
  [v2 observeLockPosterOverlayLayerWithBlock:&__block_literal_global_2_0];
  [v2 observeLockPosterLiveContentLayerWithBlock:&__block_literal_global_4_0];
  [v2 observeLockPosterLiveFloatingLayerWithBlock:&__block_literal_global_6_0];
  [v2 observeLockPosterFloatingLayerInlinedWithBlock:&__block_literal_global_8];
  [v2 observeLockPosterComplicationRowHiddenWithBlock:&__block_literal_global_10];
  [v2 observeLeadingTopButtonFrameWithBlock:&__block_literal_global_12];
  [v2 observeTrailingTopButtonFrameWithBlock:&__block_literal_global_14];
  [v2 observeVibrancyConfigurationWithBlock:&__block_literal_global_16];

  return v2;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke(uint64_t a1, _WORD *a2)
{
  *a2 |= 1u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_2(uint64_t a1, _WORD *a2)
{
  *a2 |= 2u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_3(uint64_t a1, _WORD *a2)
{
  *a2 |= 4u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_4(uint64_t a1, _WORD *a2)
{
  *a2 |= 8u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_5(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x10u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_6(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x20u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_7(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x40u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_8(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x80u;
}

void __79__PRUISSwitcherSceneSettingsDiffInspector_diffInspectorForObservingDiffContext__block_invoke_9(uint64_t a1, _WORD *a2)
{
  *a2 |= 0x100u;
}

- (void)observePreferredSwitcherLayoutModeWithBlock:(id)a3
{
}

- (void)observeLockPosterOverlayLayerWithBlock:(id)a3
{
  id v4 = a3;
  [(PRUISSwitcherSceneSettingsDiffInspector *)self _observeOtherSetting:25563 withBlock:v4];
  [(PRUISSwitcherSceneSettingsDiffInspector *)self _observeOtherSetting:25564 withBlock:v4];
}

- (void)observeLockPosterLiveContentLayerWithBlock:(id)a3
{
  id v4 = a3;
  [(PRUISSwitcherSceneSettingsDiffInspector *)self _observeOtherSetting:25565 withBlock:v4];
  [(PRUISSwitcherSceneSettingsDiffInspector *)self _observeOtherSetting:25566 withBlock:v4];
}

- (void)observeLockPosterLiveFloatingLayerWithBlock:(id)a3
{
  id v4 = a3;
  [(PRUISSwitcherSceneSettingsDiffInspector *)self _observeOtherSetting:25567 withBlock:v4];
  [(PRUISSwitcherSceneSettingsDiffInspector *)self _observeOtherSetting:25568 withBlock:v4];
}

- (void)observeLockPosterFloatingLayerInlinedWithBlock:(id)a3
{
}

- (void)observeLockPosterComplicationRowHiddenWithBlock:(id)a3
{
}

- (void)observeLeadingTopButtonFrameWithBlock:(id)a3
{
}

- (void)observeTrailingTopButtonFrameWithBlock:(id)a3
{
}

- (void)observeVibrancyConfigurationWithBlock:(id)a3
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
    v8[2] = __74__PRUISSwitcherSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke;
    v8[3] = &unk_26546BA10;
    id v9 = v6;
    [(FBSSettingsDiffInspector *)self observeOtherSetting:a3 withBlock:v8];
  }
}

uint64_t __74__PRUISSwitcherSceneSettingsDiffInspector__observeOtherSetting_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end