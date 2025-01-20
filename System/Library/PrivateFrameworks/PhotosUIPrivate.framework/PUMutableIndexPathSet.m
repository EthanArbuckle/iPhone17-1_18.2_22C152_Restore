@interface PUMutableIndexPathSet
- (BOOL)containsIndexPath:(id)a3;
- (BOOL)isEqual:(id)a3;
- (PUMutableIndexPathSet)init;
- (PUMutableIndexPathSet)initWithCapacity:(unint64_t)a3;
- (id)description;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (int64_t)count;
- (unint64_t)hash;
- (void)addIndexPath:(id)a3;
- (void)enumerateIndexPathsUsingBlock:(id)a3;
- (void)removeAllIndexPaths;
- (void)removeIndexPath:(id)a3;
- (void)setIndexPathSet:(id)a3;
@end

@implementation PUMutableIndexPathSet

- (void).cxx_destruct
{
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%p %@> indexPaths: %@", self, v5, self->_indexPaths];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    char v6 = [(NSMutableSet *)self->_indexPaths isEqualToSet:v5[1]];
    *((unsigned char *)v12 + 24) = v6;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_7;
    }
    v5 = v4;
    uint64_t v7 = [v5 count];
    if (v7 == [(PUMutableIndexPathSet *)self count])
    {
      *((unsigned char *)v12 + 24) = 1;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __33__PUMutableIndexPathSet_isEqual___block_invoke;
      v10[3] = &unk_1E5F2BB28;
      v10[4] = self;
      v10[5] = &v11;
      [v5 enumerateIndexPathsUsingBlock:v10];
    }
  }

LABEL_7:
  char v8 = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return v8;
}

uint64_t __33__PUMutableIndexPathSet_isEqual___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t result = [*(id *)(a1 + 32) containsIndexPath:a2];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

- (unint64_t)hash
{
  return [(NSMutableSet *)self->_indexPaths hash];
}

- (void)removeAllIndexPaths
{
}

- (void)setIndexPathSet:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(NSMutableSet *)self->_indexPaths setSet:v4[1]];
  }
  else
  {
    [(PUMutableIndexPathSet *)self removeAllIndexPaths];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __41__PUMutableIndexPathSet_setIndexPathSet___block_invoke;
    v5[3] = &unk_1E5F26550;
    v5[4] = self;
    [v4 enumerateIndexPathsUsingBlock:v5];
  }
}

uint64_t __41__PUMutableIndexPathSet_setIndexPathSet___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addIndexPath:a2];
}

- (BOOL)containsIndexPath:(id)a3
{
  return [(NSMutableSet *)self->_indexPaths containsObject:a3];
}

- (void)removeIndexPath:(id)a3
{
}

- (void)addIndexPath:(id)a3
{
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = [[PUMutableIndexPathSet alloc] initWithCapacity:[(NSMutableSet *)self->_indexPaths count]];
  v5 = v4;
  if (v4) {
    [(NSMutableSet *)v4->_indexPaths setSet:self->_indexPaths];
  }
  return v5;
}

- (void)enumerateIndexPathsUsingBlock:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, char *))a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_indexPaths;
  uint64_t v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      uint64_t v10 = *(void *)(*((void *)&v12 + 1) + 8 * v9);
      char v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (int64_t)count
{
  return [(NSMutableSet *)self->_indexPaths count];
}

- (PUMutableIndexPathSet)initWithCapacity:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUMutableIndexPathSet;
  id v4 = [(PUMutableIndexPathSet *)&v8 init];
  if (v4)
  {
    uint64_t v5 = [objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:a3];
    indexPaths = v4->_indexPaths;
    v4->_indexPaths = (NSMutableSet *)v5;
  }
  return v4;
}

- (PUMutableIndexPathSet)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2, self, @"PUIndexPathSet.m", 48, @"Do not use this initializer, use the designated one instead" object file lineNumber description];

  return 0;
}

@end