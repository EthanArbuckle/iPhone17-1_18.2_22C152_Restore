@interface _PXDisplayAssetIndexSubfetchResult
- (BOOL)containsObject:(id)a3;
- (NSString)description;
- (PXDisplayAsset)firstObject;
- (PXDisplayAsset)lastObject;
- (_PXDisplayAssetIndexSubfetchResult)initWithFetchResult:(id)a3 indexSet:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)thumbnailAssetAtIndex:(unint64_t)a3;
- (int64_t)count;
- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3;
- (unint64_t)indexOfObject:(id)a3;
- (void)dealloc;
@end

@implementation _PXDisplayAssetIndexSubfetchResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexSet, 0);

  objc_storeStrong((id *)&self->_originalFetchResult, 0);
}

- (int64_t)count
{
  return self->_count;
}

- (id)thumbnailAssetAtIndex:(unint64_t)a3
{
  return (id)[(PXDisplayAssetFetchResult *)self->_originalFetchResult thumbnailAssetAtIndex:self->_indexMap[a3]];
}

- (unint64_t)cachedCountOfAssetsWithMediaType:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXDisplayAssetFetchResult.m" lineNumber:574 description:@"not implemented yet"];

  abort();
}

- (unint64_t)countOfAssetsWithMediaType:(int64_t)a3
{
  v5 = objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3);
  [v5 handleFailureInMethod:a2 object:self file:@"PXDisplayAssetFetchResult.m" lineNumber:570 description:@"not implemented yet"];

  abort();
}

- (BOOL)containsObject:(id)a3
{
  uint64_t v4 = [(PXDisplayAssetFetchResult *)self->_originalFetchResult indexOfObject:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v6 = v4;
  indexSet = self->_indexSet;

  return [(NSIndexSet *)indexSet containsIndex:v6];
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PXDisplayAssetFetchResult *)self->_originalFetchResult indexOfObject:v4];
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v10[3] = 0;
    indexSet = self->_indexSet;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __52___PXDisplayAssetIndexSubfetchResult_indexOfObject___block_invoke;
    v9[3] = &unk_26545A690;
    v9[5] = v10;
    v9[6] = v5;
    v9[4] = &v11;
    [(NSIndexSet *)indexSet enumerateIndexesUsingBlock:v9];
    _Block_object_dispose(v10, 8);
    unint64_t v6 = v12[3];
  }
  _Block_object_dispose(&v11, 8);

  return v6;
}

- (PXDisplayAsset)lastObject
{
  if ([(_PXDisplayAssetIndexSubfetchResult *)self count] < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(_PXDisplayAssetIndexSubfetchResult *)self objectAtIndex:[(_PXDisplayAssetIndexSubfetchResult *)self count] - 1];
  }

  return (PXDisplayAsset *)v3;
}

- (PXDisplayAsset)firstObject
{
  if ([(_PXDisplayAssetIndexSubfetchResult *)self count] < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(_PXDisplayAssetIndexSubfetchResult *)self objectAtIndex:0];
  }

  return (PXDisplayAsset *)v3;
}

- (id)objectsAtIndexes:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x263F089C8];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = __55___PXDisplayAssetIndexSubfetchResult_objectsAtIndexes___block_invoke;
  uint64_t v13 = &unk_26545BA70;
  id v14 = v6;
  v15 = self;
  id v7 = v6;
  [v5 enumerateIndexesUsingBlock:&v10];

  v8 = -[PXDisplayAssetFetchResult objectsAtIndexes:](self->_originalFetchResult, "objectsAtIndexes:", v7, v10, v11, v12, v13);

  return v8;
}

- (id)objectAtIndex:(unint64_t)a3
{
  return (id)[(PXDisplayAssetFetchResult *)self->_originalFetchResult objectAtIndex:self->_indexMap[a3]];
}

- (NSString)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  int64_t v6 = [(_PXDisplayAssetIndexSubfetchResult *)self count];
  id v7 = [(PXDisplayAssetFetchResult *)self->_originalFetchResult description];
  v8 = [v3 stringWithFormat:@"<%@: %p: count = %li originalFetchResult = %@>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (void)dealloc
{
  free(self->_indexMap);
  v3.receiver = self;
  v3.super_class = (Class)_PXDisplayAssetIndexSubfetchResult;
  [(_PXDisplayAssetIndexSubfetchResult *)&v3 dealloc];
}

- (_PXDisplayAssetIndexSubfetchResult)initWithFetchResult:(id)a3 indexSet:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (![v9 count])
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PXDisplayAssetFetchResult.m", 499, @"Invalid parameter not satisfying: %@", @"indexSet.count > 0" object file lineNumber description];
  }
  unint64_t v10 = [v9 lastIndex];
  if (v10 >= [v8 count])
  {
    v16 = [MEMORY[0x263F08690] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"PXDisplayAssetFetchResult.m", 500, @"Invalid parameter not satisfying: %@", @"indexSet.lastIndex < fetchResult.count" object file lineNumber description];
  }
  v19.receiver = self;
  v19.super_class = (Class)_PXDisplayAssetIndexSubfetchResult;
  uint64_t v11 = [(_PXDisplayAssetIndexSubfetchResult *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_originalFetchResult, a3);
    v12->_count = [v9 count];
    objc_storeStrong((id *)&v12->_indexSet, a4);
    uint64_t v13 = (int64_t *)malloc_type_malloc(8 * v12->_count, 0x100004000313F17uLL);
    v12->_indexMap = v13;
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x2020000000;
    v18[3] = v13;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __67___PXDisplayAssetIndexSubfetchResult_initWithFetchResult_indexSet___block_invoke;
    v17[3] = &unk_26545A668;
    v17[4] = v18;
    [v9 enumerateIndexesUsingBlock:v17];
    _Block_object_dispose(v18, 8);
  }

  return v12;
}

@end