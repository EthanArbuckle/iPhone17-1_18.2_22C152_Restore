@interface SBStatusBarTapHandler
@end

@implementation SBStatusBarTapHandler

void __35___SBStatusBarTapHandler_handleTap__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 setSource:22];
  v4 = [*(id *)(*(void *)(a1 + 32) + 24) windowScene];
  v5 = [v4 _sbDisplayConfiguration];
  [v3 setDisplayConfiguration:v5];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __35___SBStatusBarTapHandler_handleTap__block_invoke_2;
  v8[3] = &unk_1E6AF5638;
  id v6 = *(id *)(a1 + 40);
  uint64_t v7 = *(void *)(a1 + 32);
  id v9 = v6;
  uint64_t v10 = v7;
  [v3 modifyApplicationContext:v8];
}

void __35___SBStatusBarTapHandler_handleTap__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [SBDeviceApplicationSceneEntity alloc];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(*(void *)(a1 + 40) + 24) sceneIdentifier];
  uint64_t v7 = [(SBDeviceApplicationSceneEntity *)v4 initWithApplicationForMainDisplay:v5 uniqueIdentifier:v6];

  [v3 setEntity:v7 forLayoutRole:1];
}

@end