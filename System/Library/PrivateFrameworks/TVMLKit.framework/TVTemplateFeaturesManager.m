@interface TVTemplateFeaturesManager
+ (id)featuresManagerForAppDocument:(id)a3;
- (TVTemplateFeaturesManagerDelegate)delegate;
- (id)_contextsForFeature:(id)a3;
- (id)currentContextForFeature:(id)a3;
- (int64_t)_rankForContext:(id)a3;
- (void)popContext:(id)a3 forFeature:(id)a4;
- (void)pushContext:(id)a3 forFeature:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation TVTemplateFeaturesManager

+ (id)featuresManagerForAppDocument:(id)a3
{
  return (id)objc_msgSend(a3, "tv_featuresManager");
}

- (void)pushContext:(id)a3 forFeature:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_contextsByFeature)
  {
    v8 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:1];
    contextsByFeature = self->_contextsByFeature;
    self->_contextsByFeature = v8;
  }
  v10 = [(TVTemplateFeaturesManager *)self _contextsForFeature:v7];
  v11 = +[_TVTemplateFeatureContextHandle handleWithContext:v6];
  objc_msgSend(v11, "setRank:", -[TVTemplateFeaturesManager _rankForContext:](self, "_rankForContext:", v6));
  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  uint64_t v23 = [v10 count];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __52__TVTemplateFeaturesManager_pushContext_forFeature___block_invoke;
  v16[3] = &unk_264BA92D0;
  id v12 = v11;
  id v17 = v12;
  v18 = &v24;
  v19 = &v20;
  [v10 enumerateObjectsUsingBlock:v16];
  if (v25[3] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v13 = v21[3];
  }
  else
  {
    objc_msgSend(v10, "removeObjectAtIndex:");
    uint64_t v13 = v21[3];
    if (v25[3] < v13) {
      v21[3] = --v13;
    }
  }
  [v10 insertObject:v12 atIndex:v13];
  uint64_t v14 = v21[3];
  if (v14 == [v10 count] - 1)
  {
    v15 = [(TVTemplateFeaturesManager *)self delegate];
    [v15 featuresManager:self currentContextDidChangeForFeature:v7];
  }
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
}

void __52__TVTemplateFeaturesManager_pushContext_forFeature___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  if ([v7 isEqual:v8]) {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  uint64_t v9 = [*(id *)(a1 + 32) rank];
  uint64_t v10 = [v8 rank];

  if (v9 < v10)
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a3;
    *a4 = 1;
  }
}

- (void)popContext:(id)a3 forFeature:(id)a4
{
  id v11 = a4;
  id v6 = a3;
  id v7 = [(TVTemplateFeaturesManager *)self _contextsForFeature:v11];
  id v8 = +[_TVTemplateFeatureContextHandle handleWithContext:v6];

  uint64_t v9 = [v7 indexOfObject:v8];
  [v7 removeObject:v8];
  if (v9 == [v7 count])
  {
    uint64_t v10 = [(TVTemplateFeaturesManager *)self delegate];
    [v10 featuresManager:self currentContextDidChangeForFeature:v11];
  }
}

- (id)currentContextForFeature:(id)a3
{
  v3 = [(TVTemplateFeaturesManager *)self _contextsForFeature:a3];
  v4 = [v3 lastObject];
  v5 = [v4 context];

  return v5;
}

- (id)_contextsForFeature:(id)a3
{
  v4 = [NSString stringWithCString:protocol_getName((Protocol *)a3) encoding:30];
  v5 = [(NSMutableDictionary *)self->_contextsByFeature objectForKeyedSubscript:v4];
  if (!v5)
  {
    v5 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
    [(NSMutableDictionary *)self->_contextsByFeature setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (int64_t)_rankForContext:(id)a3
{
  uint64_t v3 = objc_msgSend(a3, "tv_associatedIKViewElement");
  if (!v3) {
    return -1;
  }
  v4 = (void *)v3;
  int64_t v5 = -1;
  do
  {
    ++v5;
    uint64_t v6 = [v4 parent];

    v4 = (void *)v6;
  }
  while (v6);
  return v5;
}

- (TVTemplateFeaturesManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TVTemplateFeaturesManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contextsByFeature, 0);
}

@end