@interface _UICollectionLayoutAuxillaryOffsets
- (BOOL)containsIndex:(int64_t)a3 forElementKind:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)overlapsOffsets:(id)a3;
- (NSSet)elementKinds;
- (NSString)description;
- (_NSRange)rangeForElementKind:(id)a3;
- (_UICollectionLayoutAuxillaryOffsets)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)indexesForElementKind:(id)a3;
- (id)initWithOffsets:(id *)a1;
- (id)offsetsByApplyingOffsets:(id)a3;
- (id)offsetsByRebasingOnOffsets:(id)a3;
- (int64_t)offsetForElementKind:(id)a3;
- (void)_offsetWithOffsets:(int)a3 applyingBase:;
- (void)addIndexes:(void *)a3 forElementKind:;
- (void)incrementCountForElementKind:(uint64_t)a1;
- (void)incrementCountsFromOffsets:(id *)a1;
@end

@implementation _UICollectionLayoutAuxillaryOffsets

- (void).cxx_destruct
{
}

- (void)incrementCountsFromOffsets:(id *)a1
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a1 && a2)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v4 = objc_msgSend(a2, "elementKinds", 0);
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * i);
          v10 = [a2 indexesForElementKind:v9];
          uint64_t v11 = [a1[1] objectForKeyedSubscript:v9];
          if (v11)
          {
            id v12 = (id)v11;
            uint64_t v13 = [a1 rangeForElementKind:v9];
            objc_msgSend(v12, "addIndexesInRange:", v13 + v14, objc_msgSend(v10, "count"));
          }
          else
          {
            id v12 = objc_alloc_init(MEMORY[0x1E4F28E60]);
            [a1[1] setObject:v12 forKeyedSubscript:v9];
            [v12 addIndexes:v10];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);
    }
  }
}

- (void)_offsetWithOffsets:(int)a3 applyingBase:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    if (!a2)
    {
      uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:sel__offsetWithOffsets_applyingBase_, a1, @"_UICollectionLayoutHelpers.m", 1797, @"Invalid parameter not satisfying: %@", @"offsets" object file lineNumber description];
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = [a2 elementKinds];
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v10 = [a2 rangeForElementKind:v9];
          uint64_t v12 = v11;
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v19 = [MEMORY[0x1E4F28B00] currentHandler];
            [v19 handleFailureInMethod:sel__offsetWithOffsets_applyingBase_, a1, @"_UICollectionLayoutHelpers.m", 1800, @"Invalid parameter not satisfying: %@", @"range.location != NSNotFound" object file lineNumber description];
          }
          uint64_t v13 = [*(id *)(a1 + 8) objectForKeyedSubscript:v9];
          uint64_t v14 = v13;
          if (v13)
          {
            uint64_t v15 = [v13 firstIndex];
            uint64_t v16 = [v14 count];
            if (a3) {
              uint64_t v17 = 0;
            }
            else {
              uint64_t v17 = v12;
            }
            long long v18 = objc_msgSend(MEMORY[0x1E4F28E60], "indexSetWithIndexesInRange:", v17 + v10 + v15, v16);
            [*(id *)(a1 + 8) setObject:v18 forKeyedSubscript:v9];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v6);
    }
  }
}

- (NSSet)elementKinds
{
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  v3 = [(NSMutableDictionary *)self->_offsets allKeys];
  v4 = [v2 setWithArray:v3];

  return (NSSet *)v4;
}

- (_UICollectionLayoutAuxillaryOffsets)init
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = (_UICollectionLayoutAuxillaryOffsets *)-[_UICollectionLayoutAuxillaryOffsets initWithOffsets:]((id *)&self->super.isa, v3);

  return v4;
}

- (id)initWithOffsets:(id *)a1
{
  v2 = a1;
  if (a1)
  {
    if (!a2)
    {
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel_initWithOffsets_, v2, @"_UICollectionLayoutHelpers.m", 1612, @"Invalid parameter not satisfying: %@", @"offsets" object file lineNumber description];
    }
    v13.receiver = v2;
    v13.super_class = (Class)_UICollectionLayoutAuxillaryOffsets;
    v2 = (id *)objc_msgSendSuper2(&v13, sel_init);
    if (v2)
    {
      uint64_t v7 = 0;
      v8 = &v7;
      uint64_t v9 = 0x3032000000;
      uint64_t v10 = __Block_byref_object_copy__31;
      uint64_t v11 = __Block_byref_object_dispose__31;
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __55___UICollectionLayoutAuxillaryOffsets_initWithOffsets___block_invoke;
      v6[3] = &unk_1E52E11E0;
      v6[4] = &v7;
      [a2 enumerateKeysAndObjectsUsingBlock:v6];
      objc_storeStrong(v2 + 1, (id)v8[5]);
      _Block_object_dispose(&v7, 8);
    }
  }
  return v2;
}

- (void)incrementCountForElementKind:(uint64_t)a1
{
  if (a1)
  {
    if (![a2 length])
    {
      uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:sel_incrementCountForElementKind_, a1, @"_UICollectionLayoutHelpers.m", 1708, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    v4 = [*(id *)(a1 + 8) objectForKeyedSubscript:a2];
    if (!v4)
    {
      id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      [*(id *)(a1 + 8) setObject:v7 forKeyedSubscript:a2];
      v4 = v7;
    }
    id v8 = v4;
    if ([v4 count]) {
      uint64_t v5 = [v8 lastIndex] + 1;
    }
    else {
      uint64_t v5 = 0;
    }
    [v8 addIndex:v5];
  }
}

- (id)offsetsByApplyingOffsets:(id)a3
{
  v4 = (void *)[(_UICollectionLayoutAuxillaryOffsets *)self copy];
  -[_UICollectionLayoutAuxillaryOffsets _offsetWithOffsets:applyingBase:]((uint64_t)v4, a3, 0);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[_UICollectionLayoutAuxillaryOffsets allocWithZone:a3];
  offsets = self->_offsets;
  return -[_UICollectionLayoutAuxillaryOffsets initWithOffsets:]((id *)&v4->super.isa, offsets);
}

- (_NSRange)rangeForElementKind:(id)a3
{
  if (![a3 length])
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"_UICollectionLayoutHelpers.m", 1723, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
  }
  uint64_t v6 = [(NSMutableDictionary *)self->_offsets objectForKeyedSubscript:a3];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 firstIndex];
    uint64_t v9 = [v7 count];
  }
  else
  {
    uint64_t v9 = 0;
    uint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v10 = v8;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)addIndexes:(void *)a3 forElementKind:
{
  if (a1)
  {
    if (![a3 length])
    {
      id v7 = [MEMORY[0x1E4F28B00] currentHandler];
      [v7 handleFailureInMethod:sel_addIndexes_forElementKind_, a1, @"_UICollectionLayoutHelpers.m", 1679, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
    }
    uint64_t v6 = [*(id *)(a1 + 8) objectForKeyedSubscript:a3];
    if (!v6)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      [*(id *)(a1 + 8) setObject:v8 forKeyedSubscript:a3];
      uint64_t v6 = v8;
    }
    id v9 = v6;
    [v6 addIndexes:a2];
  }
}

- (BOOL)overlapsOffsets:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v5 = [(_UICollectionLayoutAuxillaryOffsets *)self elementKinds];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        NSUInteger v11 = [(_UICollectionLayoutAuxillaryOffsets *)self indexesForElementKind:v10];
        id v12 = [a3 indexesForElementKind:v10];
        if ([v12 count] && objc_msgSend(v11, "containsIndexes:", v12))
        {

          BOOL v13 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 0;
LABEL_12:

  return v13;
}

- (id)offsetsByRebasingOnOffsets:(id)a3
{
  v4 = (void *)[(_UICollectionLayoutAuxillaryOffsets *)self copy];
  -[_UICollectionLayoutAuxillaryOffsets _offsetWithOffsets:applyingBase:]((uint64_t)v4, a3, 1);
  return v4;
}

- (id)indexesForElementKind:(id)a3
{
  if (![a3 length])
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    NSUInteger v11 = [NSString stringWithUTF8String:"-[_UICollectionLayoutAuxillaryOffsets indexesForElementKind:]"];
    [v10 handleFailureInFunction:v11, @"_UICollectionLayoutHelpers.m", 1733, @"Invalid parameter not satisfying: %@", @"elementKind.length" file lineNumber description];
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_offsets objectForKeyedSubscript:a3];
  uint64_t v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  }
  uint64_t v8 = v7;

  return v8;
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@:%p ", v5, self];

  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v15[3] = 0;
  offsets = self->_offsets;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50___UICollectionLayoutAuxillaryOffsets_description__block_invoke;
  v11[3] = &unk_1E52E1208;
  uint64_t v14 = v15;
  id v8 = v6;
  id v12 = v8;
  BOOL v13 = self;
  [(NSMutableDictionary *)offsets enumerateKeysAndObjectsUsingBlock:v11];
  [v8 appendString:@">"];
  id v9 = v8;

  _Block_object_dispose(v15, 8);
  return (NSString *)v9;
}

- (int64_t)offsetForElementKind:(id)a3
{
  if (![a3 length])
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"_UICollectionLayoutHelpers.m", 1738, @"Invalid parameter not satisfying: %@", @"elementKind.length" object file lineNumber description];
  }
  return [(_UICollectionLayoutAuxillaryOffsets *)self rangeForElementKind:a3];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = [(_UICollectionLayoutAuxillaryOffsets *)self elementKinds];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v11 = [(_UICollectionLayoutAuxillaryOffsets *)self rangeForElementKind:v10];
        uint64_t v13 = v12;
        if (v11 != [a3 rangeForElementKind:v10] || v13 != v14)
        {
          BOOL v16 = 0;
          goto LABEL_18;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v7);
  }
  BOOL v16 = 1;
LABEL_18:

  return v16;
}

- (BOOL)containsIndex:(int64_t)a3 forElementKind:(id)a4
{
  uint64_t v5 = [(_UICollectionLayoutAuxillaryOffsets *)self indexesForElementKind:a4];
  uint64_t v6 = v5;
  if (v5) {
    char v7 = [v5 containsIndex:a3];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

@end