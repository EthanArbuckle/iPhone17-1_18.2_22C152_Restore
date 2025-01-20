@interface SXLayoutAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXLayoutAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 publicContainer];
  id v5 = (id)[v4 registerProtocol:&unk_26D607698 factory:&__block_literal_global_22];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerProtocol:&unk_26D62C460 factory:&__block_literal_global_109_1];

  v8 = [v3 publicContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D620770 factory:&__block_literal_global_112];

  v10 = [v3 publicContainer];
  id v11 = (id)[v10 registerProtocol:&unk_26D5D9A38 factory:&__block_literal_global_122];

  v12 = [v3 privateContainer];
  id v13 = (id)[v12 registerProtocol:&unk_26D6207D0 factory:&__block_literal_global_126_0];

  v14 = [v3 publicContainer];
  id v15 = (id)[v14 registerProtocol:&unk_26D5B4C78 factory:&__block_literal_global_130_0];

  v16 = [v3 privateContainer];
  id v17 = (id)[v16 registerProtocol:&unk_26D62F4B8 factory:&__block_literal_global_141];

  v18 = [v3 privateContainer];
  id v19 = (id)[v18 registerProtocol:&unk_26D61F648 factory:&__block_literal_global_173_1];

  v20 = [v3 privateContainer];
  id v21 = (id)[v20 registerProtocol:&unk_26D6016E8 factory:&__block_literal_global_187];

  v22 = [v3 privateContainer];
  id v23 = (id)[v22 registerProtocol:&unk_26D6203C0 factory:&__block_literal_global_195];

  v24 = [v3 privateContainer];
  id v25 = (id)[v24 registerProtocol:&unk_26D61EA90 factory:&__block_literal_global_206];

  v26 = [v3 privateContainer];
  id v27 = (id)[v26 registerProtocol:&unk_26D5CDB50 factory:&__block_literal_global_210];

  v28 = [v3 privateContainer];
  id v29 = (id)[v28 registerClass:objc_opt_class() factory:&__block_literal_global_214];

  v30 = [v3 privateContainer];
  id v31 = (id)[v30 registerProtocol:&unk_26D61E308 factory:&__block_literal_global_217];

  v32 = [v3 privateContainer];
  id v33 = (id)[v32 registerClass:objc_opt_class() factory:&__block_literal_global_222];

  v34 = [v3 publicContainer];
  id v35 = (id)[v34 registerProtocol:&unk_26D5C5AD8 factory:&__block_literal_global_243];

  v36 = [v3 privateContainer];
  id v37 = (id)[v36 registerProtocol:&unk_26D5ED850 factory:&__block_literal_global_247];

  v38 = [v3 publicContainer];
  id v39 = (id)[v38 registerProtocol:&unk_26D5ED708 factory:&__block_literal_global_251_1];

  v40 = [v3 privateContainer];
  id v41 = (id)[v40 registerClass:objc_opt_class() factory:&__block_literal_global_255];

  id v43 = [v3 privateContainer];

  id v42 = (id)[v43 registerProtocol:&unk_26D5B8F70 factory:&__block_literal_global_258];
}

SXLayoutCoordinator *__35__SXLayoutAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v14 = [SXLayoutCoordinator alloc];
  id v3 = [v2 resolveProtocol:&unk_26D5B4C78];
  v4 = [v2 resolveProtocol:&unk_26D62F4B8];
  id v5 = [v2 resolveProtocol:&unk_26D61E308];
  v6 = [v2 resolveProtocol:&unk_26D6207D0];
  id v7 = [v2 resolveClass:objc_opt_class()];
  v8 = [v2 resolveClass:objc_opt_class()];
  id v9 = [v2 resolveClass:objc_opt_class()];
  v10 = [v2 resolveProtocol:&unk_26D5F1270];
  id v11 = [v2 resolveProtocol:&unk_26D5B8F70];

  v12 = [(SXLayoutCoordinator *)v14 initWithPipeline:v3 integrator:v4 instructionFactory:v5 invalidationManager:v6 blueprintProvider:v7 DOMObjectProvider:v8 layoutParametersManager:v9 documentProvider:v10 layoutPolicyManager:v11];
  return v12;
}

id __35__SXLayoutAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 resolveClass:objc_opt_class()];

  return v3;
}

uint64_t __35__SXLayoutAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 resolveProtocol:&unk_26D6207D0];
}

SXColumnCalculator *__35__SXLayoutAssembly_loadInRegistry___block_invoke_4()
{
  v0 = objc_alloc_init(SXColumnCalculator);
  return v0;
}

SXLayoutInvalidationManager *__35__SXLayoutAssembly_loadInRegistry___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLayoutInvalidationManager alloc];
  v4 = [v2 resolveProtocol:&unk_26D62C460];

  id v5 = [(SXLayoutInvalidationManager *)v3 initWithBlueprintProvider:v4];
  return v5;
}

SXLayoutPipeline *__35__SXLayoutAssembly_loadInRegistry___block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLayoutPipeline alloc];
  v4 = [v2 resolveProtocol:&unk_26D6203C0];
  id v5 = [v2 resolveProtocol:&unk_26D5EF198];
  v6 = [(SXLayoutPipeline *)v3 initWithLayoutOperationFactory:v4 DOMObjectProviderFactory:v5];

  id v7 = [v2 resolveClass:objc_opt_class()];

  [(SXLayoutPipeline *)v6 addProcessor:v7 type:1];
  return v6;
}

uint64_t __35__SXLayoutAssembly_loadInRegistry___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 resolveProtocol:&unk_26D62F5A8];
}

SXLayouterFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLayouterFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5D9A38];
  id v5 = [v2 resolveProtocol:&unk_26D5ED850];
  v6 = [v2 resolveProtocol:&unk_26D5ED708];

  id v7 = [(SXLayouterFactory *)v3 initWithColumnCalculator:v4 layoutContextFactory:v5 unitConverterFactory:v6];
  return v7;
}

SXLayoutBlueprintFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_9(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLayoutBlueprintFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5CDB50];
  id v5 = [v2 resolveProtocol:&unk_26D5ED708];

  v6 = [(SXLayoutBlueprintFactory *)v3 initWithComponentBlueprintFactory:v4 unitConverterFactory:v5];
  return v6;
}

SXLayoutOperationFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLayoutOperationFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D61EA90];
  id v5 = [v2 resolveProtocol:&unk_26D6016E8];
  v6 = [v2 resolveProtocol:&unk_26D61F648];
  id v7 = [v2 resolveProtocol:&unk_26D5ED850];
  v8 = [v2 resolveProtocol:&unk_26D5ED708];

  id v9 = [(SXLayoutOperationFactory *)v3 initWithComponentSizerEngine:v4 layoutBlueprintFactory:v5 layouterFactory:v6 layoutContextFactory:v7 unitConverterFactory:v8];
  return v9;
}

SXComponentSizerEngine *__35__SXLayoutAssembly_loadInRegistry___block_invoke_11()
{
  v0 = objc_alloc_init(SXComponentSizerEngine);
  return v0;
}

SXComponentBlueprintFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_12()
{
  v0 = objc_alloc_init(SXComponentBlueprintFactory);
  return v0;
}

SXLayoutBlueprintProvider *__35__SXLayoutAssembly_loadInRegistry___block_invoke_13()
{
  v0 = objc_alloc_init(SXLayoutBlueprintProvider);
  return v0;
}

SXLayoutInstructionFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_14(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLayoutInstructionFactory alloc];
  v4 = [v2 resolveProtocol:&unk_26D5EB460];

  id v5 = [(SXLayoutInstructionFactory *)v3 initWithPresentationAttributesProvider:v4];
  return v5;
}

SXLayoutFinalizationProcessor *__35__SXLayoutAssembly_loadInRegistry___block_invoke_15(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLayoutFinalizationProcessor alloc];
  v4 = [v2 resolveProtocol:&unk_26D5ED708];

  id v5 = [(SXLayoutFinalizationProcessor *)v3 initWithUnitConverterFactory:v4];
  return v5;
}

SXDebugLayoutOptionsProvider *__35__SXLayoutAssembly_loadInRegistry___block_invoke_16()
{
  v0 = objc_alloc_init(SXDebugLayoutOptionsProvider);
  return v0;
}

SXLayoutContextFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_17()
{
  v0 = objc_alloc_init(SXLayoutContextFactory);
  return v0;
}

SXUnitConverterFactory *__35__SXLayoutAssembly_loadInRegistry___block_invoke_18()
{
  v0 = objc_alloc_init(SXUnitConverterFactory);
  return v0;
}

SXLayoutParametersManager *__35__SXLayoutAssembly_loadInRegistry___block_invoke_19()
{
  v0 = objc_alloc_init(SXLayoutParametersManager);
  return v0;
}

SXLayoutPolicyManager *__35__SXLayoutAssembly_loadInRegistry___block_invoke_20(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXLayoutPolicyManager alloc];
  v4 = [v2 resolveProtocol:&unk_26D5F1270];
  id v5 = [v2 resolveProtocol:&unk_26D61F8A8];

  v6 = [(SXLayoutPolicyManager *)v3 initWithDocumentProvider:v4 hintsConfigurationOptionProvider:v5];
  return v6;
}

@end