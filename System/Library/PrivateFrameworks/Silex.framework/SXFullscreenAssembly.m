@interface SXFullscreenAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXFullscreenAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D5B5FC0 factory:&__block_literal_global_16];

  id v7 = [v3 publicContainer];

  id v6 = (id)[v7 registerProtocol:&unk_26D5E13E0 factory:&__block_literal_global_62];
}

SXFullscreenCanvasControllerFactory *__39__SXFullscreenAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXFullscreenCanvasControllerFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5E13E0];
  id v5 = [v2 resolveProtocol:&unk_26D5EB460];
  id v6 = [v2 resolveProtocol:&unk_26D5EB3F8];

  id v7 = [(SXFullscreenCanvasControllerFactory *)v3 initWithCaptionViewFactory:v4 presentationAttributesProvider:v5 mediaSharingPolicyProvider:v6];
  return v7;
}

SXFullscreenCaptionViewFactory *__39__SXFullscreenAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXFullscreenCaptionViewFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5D8F58];
  id v5 = [v2 resolveProtocol:&unk_26D5C53F0];

  id v6 = [(SXFullscreenCaptionViewFactory *)v3 initWithTextSourceFactory:v4 actionHandler:v5];
  return v6;
}

@end