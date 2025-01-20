@interface SXDataTableComponentAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXDataTableComponentAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5ED4C8 scope:v5 callbackBlock:&__block_literal_global];

  v6 = [v3 callback];
  v7 = TFCallbackScopeAny();
  [v6 whenResolvingProtocol:&unk_26D61EA90 scope:v7 callbackBlock:&__block_literal_global_55];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerClass:objc_opt_class() factory:&__block_literal_global_59];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerClass:objc_opt_class() factory:&__block_literal_global_163];

  v12 = [v3 privateContainer];
  id v13 = (id)[v12 registerProtocol:&unk_26D6018B0 factory:&__block_literal_global_173];

  id v15 = [v3 privateContainer];

  id v14 = (id)[v15 registerProtocol:&unk_26D5B7790 factory:&__block_literal_global_192];
}

void __47__SXDataTableComponentAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

void __47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addFactory:v6];
}

SXDataTableComponentViewFactory *__47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDataTableComponentViewFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveClass:objc_opt_class()];
  id v6 = [v2 resolveProtocol:&unk_26D620000];
  id v15 = [v2 resolveProtocol:&unk_26D5F3268];
  id v14 = [v2 resolveProtocol:&unk_26D5EC1E8];
  v7 = [v2 resolveProtocol:&unk_26D5C53F0];
  v8 = [v2 resolveProtocol:&unk_26D61A1E0];
  id v9 = [v2 resolveProtocol:&unk_26D62F5A8];
  v10 = [v2 resolveProtocol:&unk_26D5F5A48];
  id v11 = [v2 resolveProtocol:&unk_26D5B5B28];

  id v13 = [(SXDataTableComponentViewFactory *)v3 initWithDOMObjectProvider:v4 viewport:v5 presentationDelegateProvider:v6 componentStyleRendererFactory:v15 imageViewFactory:v14 componentActionHandler:v7 textComponentLayoutHosting:v8 componentController:v9 adIgnorableViewFactory:v10 config:v11];
  return v13;
}

SXDataTableComponentSizerFactory *__47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDataTableComponentSizerFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];
  id v5 = [v2 resolveProtocol:&unk_26D61A1E0];
  id v6 = [v2 resolveProtocol:&unk_26D6018B0];
  v7 = [v2 resolveProtocol:&unk_26D5B7790];

  v8 = [(SXDataTableComponentSizerFactory *)v3 initWithDOMObjectProvider:v4 textComponentLayoutHosting:v5 textSourceFactory:v6 recordValueTransformerFactory:v7];
  return v8;
}

SXDataTableTextSourceFactory *__47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDataTableTextSourceFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5B4A60];
  id v5 = [v2 resolveProtocol:&unk_26D5DEB98];
  id v6 = [v2 resolveProtocol:&unk_26D604490];

  v7 = [(SXDataTableTextSourceFactory *)v3 initWithSmartFieldFactory:v4 documentLanguageProvider:v5 fontAttributesConstructor:v6];
  return v7;
}

SXDataRecordValueTransformerFactory *__47__SXDataTableComponentAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXDataRecordValueTransformerFactory alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5C6E40];

  id v5 = [(SXDataRecordValueTransformerFactory *)v3 initWithDOMObjectProvider:v4];
  return v5;
}

@end