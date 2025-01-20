@interface _RESwizzleInterface
+ (id)_configuredObjects;
- (void)_re_runAfterEngineIsLoaded:(id)a3;
- (void)_re_swizzled_availableRelevanceEngines:(id)a3;
- (void)_re_swizzled_fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4;
- (void)_re_swizzled_fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4;
- (void)_re_swizzled_gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4;
- (void)_re_swizzled_relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5;
- (void)_re_swizzled_relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5;
- (void)_re_swizzled_relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6;
- (void)_re_swizzled_relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5;
@end

@implementation _RESwizzleInterface

+ (id)_configuredObjects
{
  if (_configuredObjects_onceToken != -1) {
    dispatch_once(&_configuredObjects_onceToken, &__block_literal_global_56);
  }
  v2 = (void *)_configuredObjects_ConfiguredObjects;
  return v2;
}

- (void)_re_runAfterEngineIsLoaded:(id)a3
{
  v4 = (void (**)(void))a3;
  os_unfair_lock_lock(&_re_runAfterEngineIsLoaded__ConfigurationLock);
  v5 = [(id)objc_opt_class() _configuredObjects];
  int v6 = [v5 containsObject:self];

  os_unfair_lock_unlock(&_re_runAfterEngineIsLoaded__ConfigurationLock);
  if (v6)
  {
    v4[2](v4);
  }
  else
  {
    uint64_t v8 = MEMORY[0x263EF8330];
    uint64_t v9 = 3221225472;
    v10 = __50___RESwizzleInterface__re_runAfterEngineIsLoaded___block_invoke;
    v11 = &unk_2644BC5E8;
    v12 = self;
    v13 = v4;
    v7 = (void (**)(void))MEMORY[0x223C31700](&v8);
    if (objc_opt_respondsToSelector()) {
      -[_RESwizzleInterface prepareRelevanceEngineWithCompletion:](self, "prepareRelevanceEngineWithCompletion:", v7, v8, v9, v10, v11, v12);
    }
    else {
      v7[2](v7);
    }
  }
}

- (void)_re_swizzled_relevanceEngine:(id)a3 createElementFromDescription:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __92___RESwizzleInterface__re_swizzled_relevanceEngine_createElementFromDescription_completion___block_invoke;
  v14[3] = &unk_2644BC570;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_RESwizzleInterface *)self _re_runAfterEngineIsLoaded:v14];
}

- (void)_re_swizzled_relevanceEngine:(id)a3 performCommand:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __90___RESwizzleInterface__re_swizzled_relevanceEngine_performCommand_withOptions_completion___block_invoke;
  v18[3] = &unk_2644BDC40;
  id v19 = v10;
  id v20 = v11;
  id v21 = v12;
  id v22 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  id v17 = v10;
  [(_RESwizzleInterface *)self _re_runAfterEngineIsLoaded:v18];
}

- (void)_re_swizzled_availableRelevanceEngines:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __62___RESwizzleInterface__re_swizzled_availableRelevanceEngines___block_invoke;
  v6[3] = &unk_2644BCBC0;
  id v7 = v4;
  id v5 = v4;
  [(_RESwizzleInterface *)self _re_runAfterEngineIsLoaded:v6];
}

- (void)_re_swizzled_fetchAllElementIdentifiersInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __91___RESwizzleInterface__re_swizzled_fetchAllElementIdentifiersInRelevanceEngine_completion___block_invoke;
  v10[3] = &unk_2644BC5E8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_RESwizzleInterface *)self _re_runAfterEngineIsLoaded:v10];
}

- (void)_re_swizzled_fetchAllElementsInRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __81___RESwizzleInterface__re_swizzled_fetchAllElementsInRelevanceEngine_completion___block_invoke;
  v10[3] = &unk_2644BC5E8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_RESwizzleInterface *)self _re_runAfterEngineIsLoaded:v10];
}

- (void)_re_swizzled_gatherDiagnosticLogsForRelevanceEngine:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __86___RESwizzleInterface__re_swizzled_gatherDiagnosticLogsForRelevanceEngine_completion___block_invoke;
  v10[3] = &unk_2644BC5E8;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(_RESwizzleInterface *)self _re_runAfterEngineIsLoaded:v10];
}

- (void)_re_swizzled_relevanceEngine:(id)a3 runActionOfElementWithDescription1:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __98___RESwizzleInterface__re_swizzled_relevanceEngine_runActionOfElementWithDescription1_completion___block_invoke;
  v14[3] = &unk_2644BC570;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_RESwizzleInterface *)self _re_runAfterEngineIsLoaded:v14];
}

- (void)_re_swizzled_relevanceEngine:(id)a3 encodedObjectAtPath:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83___RESwizzleInterface__re_swizzled_relevanceEngine_encodedObjectAtPath_completion___block_invoke;
  v14[3] = &unk_2644BC570;
  id v15 = v8;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  id v13 = v8;
  [(_RESwizzleInterface *)self _re_runAfterEngineIsLoaded:v14];
}

@end