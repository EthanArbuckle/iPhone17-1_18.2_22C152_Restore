@interface UIScene(PreviewsOSSupportAdditions)
- (uint64_t)uv_previewAgentDisplaysUI;
- (void)uv_registerActionHandlerForKey:()PreviewsOSSupportAdditions handler:;
- (void)uv_sendSceneAction:()PreviewsOSSupportAdditions;
@end

@implementation UIScene(PreviewsOSSupportAdditions)

- (void)uv_registerActionHandlerForKey:()PreviewsOSSupportAdditions handler:
{
  v10[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  v8 = [[_UVBSActionHandler alloc] initWithHandler:v6];

  v10[0] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
  [a1 _registerBSActionResponderArray:v9 forKey:v7];
}

- (void)uv_sendSceneAction:()PreviewsOSSupportAdditions
{
  id v4 = a3;
  id v6 = [a1 _FBSScene];
  v5 = [MEMORY[0x263EFFA08] setWithObject:v4];

  [v6 sendActions:v5];
}

- (uint64_t)uv_previewAgentDisplaysUI
{
  v1 = [a1 _FBSScene];
  v2 = [v1 specification];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = [v2 previewAgentDisplaysUI];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

@end