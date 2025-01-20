@interface SXComponentInsertionAssembly
- (void)loadInRegistry:(id)a3;
@end

@implementation SXComponentInsertionAssembly

- (void)loadInRegistry:(id)a3
{
  id v3 = a3;
  v4 = [v3 callback];
  v5 = TFCallbackScopeAny();
  [v4 whenResolvingProtocol:&unk_26D5B4C78 scope:v5 callbackBlock:&__block_literal_global_79];

  v6 = [v3 publicContainer];
  id v7 = (id)[v6 registerClass:objc_opt_class() factory:&__block_literal_global_58];

  v8 = [v3 privateContainer];
  id v9 = (id)[v8 registerProtocol:&unk_26D6321E8 factory:&__block_literal_global_65];

  v10 = [v3 privateContainer];
  id v11 = (id)[v10 registerProtocol:&unk_26D5F03A8 factory:&__block_literal_global_96_0];

  v12 = [v3 publicContainer];
  id v13 = (id)[v12 registerProtocol:&unk_26D5F0428 factory:&__block_literal_global_99];

  v14 = [v3 publicContainer];
  v15 = [v14 registerProtocol:&unk_26D60EE88 name:@"general" factory:&__block_literal_global_103_0];
  id v16 = (id)[v15 withConfiguration:&__block_literal_global_107_0];

  id v18 = [v3 privateContainer];

  id v17 = (id)[v18 registerProtocol:&unk_26D5D94D8 factory:&__block_literal_global_111_1];
}

void __47__SXComponentInsertionAssembly_loadInRegistry___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  id v6 = [v4 resolveClass:objc_opt_class()];

  [v5 addProcessor:v6 type:1];
}

SXComponentInsertionLayoutProcessor *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentInsertionLayoutProcessor alloc];
  id v4 = [v2 resolveProtocol:&unk_26D6321E8];

  id v5 = [(SXComponentInsertionLayoutProcessor *)v3 initWithComponentInsertionManager:v4];
  return v5;
}

SXComponentInsertionManager *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [SXComponentInsertionManager alloc];
  id v4 = [v2 resolveProtocol:&unk_26D5F0428];
  id v5 = [v2 resolveProtocol:&unk_26D60EE88 name:@"general"];
  id v6 = [v2 resolveProtocol:&unk_26D5D94D8];
  id v7 = [v2 resolveProtocol:&unk_26D5ED708];

  v8 = [(SXComponentInsertionManager *)v3 initWithComponentInserterManager:v4 conditionEngine:v5 blueprintAnalyzer:v6 unitConverterFactory:v7];
  return v8;
}

uint64_t __47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 resolveProtocol:&unk_26D5F0428];
}

SXComponentInserterManager *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_5()
{
  v0 = objc_alloc_init(SXComponentInserterManager);
  return v0;
}

SXComponentInsertionConditionEngine *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_6()
{
  v0 = objc_alloc_init(SXComponentInsertionConditionEngine);
  return v0;
}

void __47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  id v4 = objc_alloc_init(SXNeighbouringComponentsPlacementCondition);
  [v3 addCondition:v4];
}

SXBlueprintAnalyzer *__47__SXComponentInsertionAssembly_loadInRegistry___block_invoke_8()
{
  v0 = objc_alloc_init(SXBlueprintAnalyzer);
  return v0;
}

@end