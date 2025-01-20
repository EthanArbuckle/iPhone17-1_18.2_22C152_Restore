@interface SBSUILiquidDetectionSceneRequestBuilder
- (id)_specification;
- (void)_customizeWorkspaceRequestOptions:(id)a3 usingRequest:(id)a4;
@end

@implementation SBSUILiquidDetectionSceneRequestBuilder

- (id)_specification
{
  v2 = objc_opt_new();
  return v2;
}

- (void)_customizeWorkspaceRequestOptions:(id)a3 usingRequest:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SBSUILiquidDetectionSceneRequestBuilder;
  id v5 = a3;
  [(_UIApplicationSceneRequestBuilder *)&v7 _customizeWorkspaceRequestOptions:v5 usingRequest:a4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F42BC8]);
  objc_msgSend(v6, "setBackgroundStyle:", 3, v7.receiver, v7.super_class);
  [v5 setInitialClientSettings:v6];
}

@end