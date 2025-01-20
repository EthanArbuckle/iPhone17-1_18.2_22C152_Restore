@interface TRINaiveFactorLevelCache
- (TRINaiveFactorLevelCache)initWithFactorLevels:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (void)enumerateFactorLevelsUsingBlock:(id)a3;
@end

@implementation TRINaiveFactorLevelCache

- (id)objectForKeyedSubscript:(id)a3
{
  return [(NSDictionary *)self->_factorLevels objectForKeyedSubscript:a3];
}

uint64_t __49__TRINaiveFactorLevelCache_initWithFactorLevels___block_invoke(uint64_t a1, void *a2)
{
  id v8 = a2;
  if ([v8 hasFactor])
  {
    v3 = [v8 factor];
    if ([v3 hasName])
    {
      int v4 = [v8 hasLevel];

      if (!v4) {
        goto LABEL_6;
      }
      v5 = *(void **)(a1 + 32);
      v3 = [v8 factor];
      v6 = [v3 name];
      [v5 setObject:v8 forKeyedSubscript:v6];
    }
  }
LABEL_6:
  return MEMORY[0x1F41817F8]();
}

- (TRINaiveFactorLevelCache)initWithFactorLevels:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)TRINaiveFactorLevelCache;
  v5 = [(TRINaiveFactorLevelCache *)&v13 init];
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __49__TRINaiveFactorLevelCache_initWithFactorLevels___block_invoke;
    v11[3] = &unk_1E596A4C0;
    v7 = v6;
    v12 = v7;
    [v4 enumerateObjectsUsingBlock:v11];
    factorLevels = v5->_factorLevels;
    v5->_factorLevels = v7;
    v9 = v7;
  }
  return v5;
}

void __60__TRINaiveFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  v6 = (void *)MEMORY[0x19F3AD060]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateFactorLevelsUsingBlock:(id)a3
{
  id v4 = a3;
  factorLevels = self->_factorLevels;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__TRINaiveFactorLevelCache_enumerateFactorLevelsUsingBlock___block_invoke;
  v7[3] = &unk_1E596ADB0;
  id v8 = v4;
  id v6 = v4;
  [(NSDictionary *)factorLevels enumerateKeysAndObjectsUsingBlock:v7];
}

- (void).cxx_destruct
{
}

@end