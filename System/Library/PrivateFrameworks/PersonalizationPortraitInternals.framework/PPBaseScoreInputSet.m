@interface PPBaseScoreInputSet
- (PPBaseScoreInputSet)init;
- (unint64_t)indexForArrayScoreName:(id)a3;
- (unint64_t)indexForObjectScoreName:(id)a3;
- (unint64_t)indexForScalarScoreName:(id)a3;
@end

@implementation PPBaseScoreInputSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectMap, 0);
  objc_storeStrong((id *)&self->_arrayMap, 0);
  objc_storeStrong((id *)&self->_scalarMap, 0);
}

- (unint64_t)indexForObjectScoreName:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9673;
  v18 = __Block_byref_object_dispose__9674;
  id v19 = 0;
  objectMap = self->_objectMap;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__PPBaseScoreInputSet_indexForObjectScoreName___block_invoke;
  v11[3] = &unk_1E65D7C28;
  v11[4] = self;
  v13 = &v14;
  id v6 = v4;
  id v12 = v6;
  [(_PASLock *)objectMap runWithLockAcquired:v11];
  v7 = (void *)v15[5];
  if (v7) {
    uint64_t v8 = [v7 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = [(PPBaseScoreInputSet *)self undefinedObjectScoreIndex];
  }
  unint64_t v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __47__PPBaseScoreInputSet_indexForObjectScoreName___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (![v13 count])
  {
    unint64_t v3 = [*(id *)(a1 + 32) objectScoreIndexUpperBound];
    unint64_t v4 = [*(id *)(a1 + 32) minObjectScoreIndex];
    uint64_t v5 = [*(id *)(a1 + 32) undefinedObjectScoreIndex];
    if (v4 < v3)
    {
      do
      {
        id v6 = [NSNumber numberWithUnsignedInteger:v4];
        v7 = [*(id *)(a1 + 32) nameForObjectScoreIndex:v4];
        [v13 setObject:v6 forKeyedSubscript:v7];

        ++v4;
      }
      while (v3 != v4);
    }
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
    unint64_t v9 = [*(id *)(a1 + 32) nameForObjectScoreIndex:v5];
    [v13 setObject:v8 forKeyedSubscript:v9];
  }
  uint64_t v10 = [v13 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (unint64_t)indexForArrayScoreName:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9673;
  v18 = __Block_byref_object_dispose__9674;
  id v19 = 0;
  arrayMap = self->_arrayMap;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__PPBaseScoreInputSet_indexForArrayScoreName___block_invoke;
  v11[3] = &unk_1E65D7C28;
  v11[4] = self;
  id v13 = &v14;
  id v6 = v4;
  id v12 = v6;
  [(_PASLock *)arrayMap runWithLockAcquired:v11];
  v7 = (void *)v15[5];
  if (v7) {
    uint64_t v8 = [v7 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = [(PPBaseScoreInputSet *)self undefinedArrayScoreIndex];
  }
  unint64_t v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __46__PPBaseScoreInputSet_indexForArrayScoreName___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (![v13 count])
  {
    unint64_t v3 = [*(id *)(a1 + 32) arrayScoreIndexUpperBound];
    unint64_t v4 = [*(id *)(a1 + 32) minArrayScoreIndex];
    uint64_t v5 = [*(id *)(a1 + 32) undefinedArrayScoreIndex];
    if (v4 < v3)
    {
      do
      {
        id v6 = [NSNumber numberWithUnsignedInteger:v4];
        v7 = [*(id *)(a1 + 32) nameForArrayScoreIndex:v4];
        [v13 setObject:v6 forKeyedSubscript:v7];

        ++v4;
      }
      while (v3 != v4);
    }
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
    unint64_t v9 = [*(id *)(a1 + 32) nameForArrayScoreIndex:v5];
    [v13 setObject:v8 forKeyedSubscript:v9];
  }
  uint64_t v10 = [v13 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (unint64_t)indexForScalarScoreName:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__9673;
  v18 = __Block_byref_object_dispose__9674;
  id v19 = 0;
  scalarMap = self->_scalarMap;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __47__PPBaseScoreInputSet_indexForScalarScoreName___block_invoke;
  v11[3] = &unk_1E65D7C28;
  v11[4] = self;
  id v13 = &v14;
  id v6 = v4;
  id v12 = v6;
  [(_PASLock *)scalarMap runWithLockAcquired:v11];
  v7 = (void *)v15[5];
  if (v7) {
    uint64_t v8 = [v7 unsignedIntegerValue];
  }
  else {
    uint64_t v8 = [(PPBaseScoreInputSet *)self undefinedScalarScoreIndex];
  }
  unint64_t v9 = v8;

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __47__PPBaseScoreInputSet_indexForScalarScoreName___block_invoke(uint64_t a1, void *a2)
{
  id v13 = a2;
  if (![v13 count])
  {
    unint64_t v3 = [*(id *)(a1 + 32) scalarScoreIndexUpperBound];
    unint64_t v4 = [*(id *)(a1 + 32) minScalarScoreIndex];
    uint64_t v5 = [*(id *)(a1 + 32) undefinedScalarScoreIndex];
    if (v4 < v3)
    {
      do
      {
        id v6 = [NSNumber numberWithUnsignedInteger:v4];
        v7 = [*(id *)(a1 + 32) nameForScalarScoreIndex:v4];
        [v13 setObject:v6 forKeyedSubscript:v7];

        ++v4;
      }
      while (v3 != v4);
    }
    uint64_t v8 = [NSNumber numberWithUnsignedInteger:v5];
    unint64_t v9 = [*(id *)(a1 + 32) nameForScalarScoreIndex:v5];
    [v13 setObject:v8 forKeyedSubscript:v9];
  }
  uint64_t v10 = [v13 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;
}

- (PPBaseScoreInputSet)init
{
  v16.receiver = self;
  v16.super_class = (Class)PPBaseScoreInputSet;
  v2 = [(PPBaseScoreInputSet *)&v16 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    unint64_t v4 = objc_opt_new();
    uint64_t v5 = [v3 initWithGuardedData:v4];
    scalarMap = v2->_scalarMap;
    v2->_scalarMap = (_PASLock *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F93B70]);
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = [v7 initWithGuardedData:v8];
    arrayMap = v2->_arrayMap;
    v2->_arrayMap = (_PASLock *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v12 = objc_opt_new();
    uint64_t v13 = [v11 initWithGuardedData:v12];
    objectMap = v2->_objectMap;
    v2->_objectMap = (_PASLock *)v13;
  }
  return v2;
}

@end