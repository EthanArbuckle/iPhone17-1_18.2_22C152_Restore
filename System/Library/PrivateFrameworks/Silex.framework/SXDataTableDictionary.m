@interface SXDataTableDictionary
+ (SXDataTableDictionary)dataTableDictionaryWithRows:(unint64_t)a3 andColumns:(unint64_t)a4;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPathForIndex:(unint64_t)a3;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPathOfObject:(id)a3;
- (NSMutableArray)storage;
- (NSMutableIndexSet)indexes;
- (SXDataTableDictionary)initWithRows:(unint64_t)a3 andColumns:(unint64_t)a4;
- (id)arrayWithObject:(id)a3 forCount:(unint64_t)a4;
- (id)description;
- (id)objectForIndexPath:(id)a3;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)indexForIndexPath:(id)a3;
- (unint64_t)numberOfColumns;
- (unint64_t)numberOfRows;
- (void)removeAllObjects;
- (void)removeObjectForIndexPath:(id)a3;
- (void)setIndexes:(id)a3;
- (void)setObject:(id)a3 forIndexPath:(id)a4;
- (void)setStorage:(id)a3;
@end

@implementation SXDataTableDictionary

+ (SXDataTableDictionary)dataTableDictionaryWithRows:(unint64_t)a3 andColumns:(unint64_t)a4
{
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithRows:a3 andColumns:a4];
  return (SXDataTableDictionary *)v4;
}

- (SXDataTableDictionary)initWithRows:(unint64_t)a3 andColumns:(unint64_t)a4
{
  if (a3 == -1 || a4 == -1)
  {

    return 0;
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)SXDataTableDictionary;
    v6 = [(SXDataTableDictionary *)&v14 init];
    v7 = v6;
    if (v6)
    {
      v6->_numberOfRows = a3;
      v6->_numberOfColumns = a4;
      v8 = [MEMORY[0x263EFF9D0] null];
      uint64_t v9 = [(SXDataTableDictionary *)v7 arrayWithObject:v8 forCount:a4 * a3];
      storage = v7->_storage;
      v7->_storage = (NSMutableArray *)v9;

      uint64_t v11 = [MEMORY[0x263F089C8] indexSet];
      indexes = v7->_indexes;
      v7->_indexes = (NSMutableIndexSet *)v11;
    }
  }
  return v7;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPathOfObject:(id)a3
{
  id v4 = a3;
  v5 = [(SXDataTableDictionary *)self storage];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = -1;
    unint64_t v8 = -1;
  }
  else
  {
    unint64_t v7 = [(SXDataTableDictionary *)self indexPathForIndex:v6];
  }
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (id)objectForIndexPath:(id)a3
{
  unint64_t v4 = -[SXDataTableDictionary indexForIndexPath:](self, "indexForIndexPath:", a3.var0, a3.var1);
  if (v4 == -1)
  {
    unint64_t v7 = 0;
  }
  else
  {
    unint64_t v5 = v4;
    uint64_t v6 = [(SXDataTableDictionary *)self storage];
    unint64_t v7 = [v6 objectAtIndex:v5];
  }
  unint64_t v8 = [MEMORY[0x263EFF9D0] null];
  if (v7 == v8) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = v7;
  }
  id v10 = v9;

  return v10;
}

- (void)setObject:(id)a3 forIndexPath:(id)a4
{
  unint64_t var1 = a4.var1;
  unint64_t var0 = a4.var0;
  id v11 = a3;
  unint64_t v7 = -[SXDataTableDictionary indexForIndexPath:](self, "indexForIndexPath:", var0, var1);
  if (v7 != -1)
  {
    unint64_t v8 = v7;
    if (v11)
    {
      uint64_t v9 = [(SXDataTableDictionary *)self indexes];
      [v9 addIndex:v8];

      id v10 = [(SXDataTableDictionary *)self storage];
      [v10 replaceObjectAtIndex:v8 withObject:v11];
    }
    else
    {
      -[SXDataTableDictionary removeObjectForIndexPath:](self, "removeObjectForIndexPath:", var0, var1);
    }
  }
}

- (void)removeObjectForIndexPath:(id)a3
{
  unint64_t v4 = -[SXDataTableDictionary indexForIndexPath:](self, "indexForIndexPath:", a3.var0, a3.var1);
  if (v4 != -1)
  {
    unint64_t v5 = v4;
    uint64_t v6 = [(SXDataTableDictionary *)self indexes];
    [v6 removeIndex:v5];

    id v8 = [(SXDataTableDictionary *)self storage];
    unint64_t v7 = [MEMORY[0x263EFF9D0] null];
    [v8 replaceObjectAtIndex:v5 withObject:v7];
  }
}

- (void)removeAllObjects
{
  v3 = [(SXDataTableDictionary *)self indexes];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __41__SXDataTableDictionary_removeAllObjects__block_invoke;
  v4[3] = &unk_2646532A0;
  v4[4] = self;
  [v3 enumerateIndexesUsingBlock:v4];
}

uint64_t __41__SXDataTableDictionary_removeAllObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  uint64_t v4 = [v2 indexPathForIndex:a2];
  return objc_msgSend(v2, "removeObjectForIndexPath:", v4, v3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  uint64_t v21 = 0;
  unint64_t var0 = a3->var0;
  if (!a3->var0) {
    a3->var2 = a3->var3;
  }
  id v10 = [(SXDataTableDictionary *)self indexes];
  unint64_t v11 = [v10 count];

  if (var0 < v11)
  {
    a3->unint64_t var1 = a4;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x2020000000;
    v17[3] = 0;
    v12 = [(SXDataTableDictionary *)self indexes];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __67__SXDataTableDictionary_countByEnumeratingWithState_objects_count___block_invoke;
    v16[3] = &unk_2646532C8;
    v16[6] = &v18;
    v16[7] = var0;
    v16[8] = a5;
    v16[9] = a4;
    v16[4] = self;
    v16[5] = v17;
    [v12 enumerateIndexesUsingBlock:v16];

    _Block_object_dispose(v17, 8);
  }
  v13 = v19;
  a3->unint64_t var0 = v19[3] + var0;
  unint64_t v14 = v13[3];
  _Block_object_dispose(&v18, 8);
  return v14;
}

void *__67__SXDataTableDictionary_countByEnumeratingWithState_objects_count___block_invoke(void *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result[5] + 8);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v3 >= result[7])
  {
    uint64_t v4 = result;
    if (*(void *)(*(void *)(result[6] + 8) + 24) < result[8])
    {
      unint64_t v5 = (void *)result[4];
      uint64_t v6 = [v5 indexPathForIndex:a2];
      $7DEDF3842AEFB7F1E6DF5AF62E424A02 result = (id)objc_msgSend(v5, "objectForIndexPath:", v6, v7);
      *(void *)(v4[9] + 8 * (*(void *)(*(void *)(v4[6] + 8) + 24))++) = result;
      uint64_t v2 = *(void *)(v4[5] + 8);
      unint64_t v3 = *(void *)(v2 + 24);
    }
  }
  *(void *)(v2 + 24) = v3 + 1;
  return result;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)indexPathForIndex:(unint64_t)a3
{
  unint64_t v5 = [(SXDataTableDictionary *)self numberOfColumns];
  unint64_t v6 = a3 / v5 * v5;
  unint64_t v7 = a3 % v5;
  unint64_t v8 = v6 / [(SXDataTableDictionary *)self numberOfColumns];
  unint64_t v9 = v7;
  result.unint64_t var1 = v9;
  result.unint64_t var0 = v8;
  return result;
}

- (unint64_t)indexForIndexPath:(id)a3
{
  unint64_t var1 = a3.var1;
  unint64_t var0 = a3.var0;
  if (a3.var0 >= [(SXDataTableDictionary *)self numberOfRows]
    || var1 >= [(SXDataTableDictionary *)self numberOfColumns])
  {
    return -1;
  }
  else
  {
    return var1 + [(SXDataTableDictionary *)self numberOfColumns] * var0;
  }
}

- (id)arrayWithObject:(id)a3 forCount:(unint64_t)a4
{
  id v5 = a3;
  for (i = [MEMORY[0x263EFF980] array];
    [i addObject:v5];

  return i;
}

- (id)description
{
  unint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"{\n"];
  if ([(SXDataTableDictionary *)self numberOfRows])
  {
    unint64_t v4 = 0;
    do
    {
      if ([(SXDataTableDictionary *)self numberOfColumns])
      {
        unint64_t v5 = 0;
        do
        {
          unint64_t v6 = -[SXDataTableDictionary objectForIndexPath:](self, "objectForIndexPath:", v4, v5);
          unint64_t v7 = [NSString stringWithFormat:@"{row: %lu, column: %lu}", v4, v5];
          unint64_t v8 = [v6 description];
          [v3 appendFormat:@"\t%@ = %@ \n", v7, v8];

          ++v5;
        }
        while (v5 < [(SXDataTableDictionary *)self numberOfColumns]);
      }
      ++v4;
    }
    while (v4 < [(SXDataTableDictionary *)self numberOfRows]);
  }
  [v3 appendString:@"}"];
  return v3;
}

- (unint64_t)numberOfRows
{
  return self->_numberOfRows;
}

- (unint64_t)numberOfColumns
{
  return self->_numberOfColumns;
}

- (NSMutableIndexSet)indexes
{
  return self->_indexes;
}

- (void)setIndexes:(id)a3
{
}

- (NSMutableArray)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_indexes, 0);
}

@end