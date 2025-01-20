@interface _PXConcatenatingDisplayAssetFetchResult
- (BOOL)containsObject:(id)a3;
- (NSString)description;
- (PXDisplayAsset)firstObject;
- (PXDisplayAsset)lastObject;
- (_PXConcatenatingDisplayAssetFetchResult)initWithFetchResults:(id)a3;
- (id)_subFetchResultForIndex:(int64_t)a3 localIndex:(int64_t *)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)thumbnailAssetAtIndex:(unint64_t)a3;
- (int64_t)count;
- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)indexOfObject:(id)a3;
- (void)dealloc;
@end

@implementation _PXConcatenatingDisplayAssetFetchResult

- (void).cxx_destruct
{
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  v3 = [(_PXConcatenatingDisplayAssetFetchResult *)self _subFetchResultForIndex:a3 localIndex:&v6];
  v4 = [v3 objectAtIndex:v6];

  return v4;
}

- (int64_t)count
{
  return self->_count;
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_fetchResults;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "cachedCountOfAssetsWithMediaType:", a3, (void)v11);
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = self->_fetchResults;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unint64_t v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 += objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "countOfAssetsWithMediaType:", a3, (void)v11);
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = self->_fetchResults;
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

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = a3;
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NSArray *)self->_fetchResults count])
  {
    uint64_t v6 = 0;
    while (1)
    {
      uint64_t v7 = [(NSArray *)self->_fetchResults objectAtIndexedSubscript:v6];
      uint64_t v8 = [v7 indexOfObject:v4];
      if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }

      if (++v6 >= [(NSArray *)self->_fetchResults count])
      {
        unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
        goto LABEL_7;
      }
    }
    unint64_t v5 = self->_startIndexes[v6] + v8;
  }
LABEL_7:

  return v5;
}

- (PXDisplayAsset)lastObject
{
  v2 = [(NSArray *)self->_fetchResults lastObject];
  v3 = [v2 lastObject];

  return (PXDisplayAsset *)v3;
}

- (PXDisplayAsset)firstObject
{
  v2 = [(NSArray *)self->_fetchResults firstObject];
  v3 = [v2 firstObject];

  return (PXDisplayAsset *)v3;
}

- (id)objectsAtIndexes:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263EFF980];
  id v5 = a3;
  uint64_t v6 = objc_msgSend([v4 alloc], "initWithCapacity:", objc_msgSend(v5, "count"));
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  long long v12 = __60___PXConcatenatingDisplayAssetFetchResult_objectsAtIndexes___block_invoke;
  long long v13 = &unk_26545BA70;
  id v14 = v6;
  uint64_t v15 = self;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v10];

  uint64_t v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);

  return v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  v3 = [(_PXConcatenatingDisplayAssetFetchResult *)self _subFetchResultForIndex:a3 localIndex:&v6];
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
  v3.super_class = (Class)_PXConcatenatingDisplayAssetFetchResult;
  [(_PXConcatenatingDisplayAssetFetchResult *)&v3 dealloc];
}

- (_PXConcatenatingDisplayAssetFetchResult)initWithFetchResults:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_PXConcatenatingDisplayAssetFetchResult;
  id v5 = [(_PXConcatenatingDisplayAssetFetchResult *)&v14 init];
  if (v5)
  {
    uint64_t v6 = PXFilter(v4, &__block_literal_global_2976);
    p_fetchResults = (id *)&v5->_fetchResults;
    objc_storeStrong((id *)&v5->_fetchResults, v6);
    int64_t v8 = (int64_t *)malloc_type_malloc(8 * [(NSArray *)v5->_fetchResults count], 0x100004000313F17uLL);
    v5->_startIndexes = v8;
    if ([(NSArray *)v5->_fetchResults count])
    {
      unint64_t v9 = 0;
      int64_t v10 = 0;
      do
      {
        int64_t v11 = [*p_fetchResults objectAtIndexedSubscript:v9];
        uint64_t v12 = [v11 count];
        v8[v9] = v10;
        v10 += v12;

        ++v9;
      }
      while (v9 < [*p_fetchResults count]);
    }
    else
    {
      int64_t v10 = 0;
    }
    v5->_count = v10;
    v5->_int64_t subFetchResultsCount = [(NSArray *)v5->_fetchResults count];
  }
  return v5;
}

@end