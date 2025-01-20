@interface _PXConcatenatingAudioAssetFetchResult
- (BOOL)containsObject:(id)a3;
- (NSString)description;
- (PXAudioAsset)firstObject;
- (PXAudioAsset)lastObject;
- (_PXConcatenatingAudioAssetFetchResult)initWithFetchResults:(id)a3;
- (id)_subFetchResultForIndex:(int64_t)a3 localIndex:(int64_t *)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (int64_t)count;
- (void)dealloc;
- (void)enumerateObjectsUsingBlock:(id)a3;
@end

@implementation _PXConcatenatingAudioAssetFetchResult

- (void).cxx_destruct
{
}

- (int64_t)count
{
  return self->_count;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v10[3] = 0;
  fetchResults = self->_fetchResults;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __68___PXConcatenatingAudioAssetFetchResult_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E5DC61A8;
  id v6 = v4;
  id v8 = v6;
  v9 = v10;
  [(NSArray *)fetchResults enumerateObjectsUsingBlock:v7];

  _Block_object_dispose(v10, 8);
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_fetchResults;
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "containsObject:", v4, (void)v10))
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (PXAudioAsset)lastObject
{
  v2 = [(NSArray *)self->_fetchResults lastObject];
  v3 = [v2 lastObject];

  return (PXAudioAsset *)v3;
}

- (PXAudioAsset)firstObject
{
  v2 = [(NSArray *)self->_fetchResults firstObject];
  v3 = [v2 firstObject];

  return (PXAudioAsset *)v3;
}

- (id)objectsAtIndexes:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  uint64_t v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __58___PXConcatenatingAudioAssetFetchResult_objectsAtIndexes___block_invoke;
  long long v13 = &unk_1E5DD1558;
  id v14 = v6;
  uint64_t v15 = self;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v10];

  id v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  return v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  v3 = [(_PXConcatenatingAudioAssetFetchResult *)self _subFetchResultForIndex:a3 localIndex:&v6];
  id v4 = [v3 objectAtIndex:v6];

  return v4;
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p: fetchResults = %@>", v5, self, self->_fetchResults];

  return (NSString *)v6;
}

- (id)_subFetchResultForIndex:(int64_t)a3 localIndex:(int64_t *)a4
{
  startIndexes = self->_startIndexes;
  int64_t subFetchResultsCount = self->_subFetchResultsCount;
  if (subFetchResultsCount < 2)
  {
    int64_t v8 = 0;
  }
  else
  {
    int64_t v8 = 0;
    int64_t v9 = subFetchResultsCount - 1;
    do
    {
      uint64_t v10 = v9 - v8;
      if (v9 < v8) {
        ++v10;
      }
      int64_t v11 = v8 + (v10 >> 1);
      if (startIndexes[v11] < a3) {
        int64_t v8 = v11 + 1;
      }
      else {
        int64_t v9 = v11;
      }
    }
    while (v8 < v9);
  }
  int64_t v12 = startIndexes[v8 - (startIndexes[v8] > a3)];
  id result = -[NSArray objectAtIndexedSubscript:](self->_fetchResults, "objectAtIndexedSubscript:");
  if (a4) {
    *a4 = a3 - v12;
  }
  return result;
}

- (void)dealloc
{
  free(self->_startIndexes);
  v3.receiver = self;
  v3.super_class = (Class)_PXConcatenatingAudioAssetFetchResult;
  [(_PXConcatenatingAudioAssetFetchResult *)&v3 dealloc];
}

- (_PXConcatenatingAudioAssetFetchResult)initWithFetchResults:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)_PXConcatenatingAudioAssetFetchResult;
  if ([(_PXConcatenatingAudioAssetFetchResult *)&v6 init]) {
    PXFilter();
  }

  return 0;
}

@end