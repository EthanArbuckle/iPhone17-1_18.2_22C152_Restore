@interface SXStyleAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXStyleAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D5F0C60 factory:&__block_literal_global_96];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D60ED08 factory:&__block_literal_global_51_0];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D5CE560 factory:&__block_literal_global_59_20];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerProtocol:&unk_26D5F3F68 factory:&__block_literal_global_104_2];

  id v13 = [v3 publicContainer];

  id v12 = (id)[v13 registerProtocol:&unk_26D5EF250 factory:&__block_literal_global_111_2];
}

SXDocumentStyleRenderer *__34__SXStyleAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDocumentStyleRenderer alloc];
  v4 = [v2 resolveClass:objc_opt_class()];
  id v5 = [v2 resolveProtocol:&unk_26D60ED08];

  v6 = [(SXDocumentStyleRenderer *)v3 initWithViewport:v4 gradientFactory:v5];
  return v6;
}

SXGradientFactory *__34__SXStyleAssembly_loadInRegistry___block_invoke_2()
{
  v0 = objc_alloc_init(SXGradientFactory);
  return v0;
}

SXImageFillViewFactory *__34__SXStyleAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXImageFillViewFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveProtocol:&unk_26D5EC1E8];

  v6 = [(SXImageFillViewFactory *)v3 initWithDOMObjectProvider:v4 imageViewFactory:v5];
  return v6;
}

SXVideoFillViewFactory *__34__SXStyleAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXVideoFillViewFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveProtocol:&unk_26D5EC1E8];

  v6 = [(SXVideoFillViewFactory *)v3 initWithDOMObjectProvider:v4 imageViewFactory:v5];
  return v6;
}

SXRepeatableImageFillViewFactory *__34__SXStyleAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXRepeatableImageFillViewFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveProtocol:&unk_26D5EC1E8];

  v6 = [(SXRepeatableImageFillViewFactory *)v3 initWithDOMObjectProvider:v4 imageViewFactory:v5];
  return v6;
}

@end