@interface _PASLazyArrayBase
- (BOOL)isEqualToArray:(id)a3;
- (id)arrayByAddingObject:(id)a3;
- (id)arrayByAddingObjectsFromArray:(id)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5;
- (id)subarrayWithRange:(_NSRange)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
@end

@implementation _PASLazyArrayBase

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(_PASLazyArrayBase *)self count];
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v4];
  if (v4)
  {
    for (uint64_t i = 0; i != v4; ++i)
    {
      v7 = (void *)MEMORY[0x1A62450A0]();
      v8 = [(_PASLazyArrayBase *)self objectAtIndex:i];
      [v5 addObject:v8];
    }
  }
  return v5;
}

- (id)arrayByAddingObjectsFromArray:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    v5 = (void *)MEMORY[0x1A62450A0]();
    v6 = (void *)[(_PASLazyArrayBase *)self mutableCopy];
    [v6 addObjectsFromArray:v4];
    v7 = (_PASLazyArrayBase *)[v6 copy];
  }
  else
  {
    v7 = self;
  }

  return v7;
}

- (id)arrayByAddingObject:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = [(_PASLazyArrayBase *)self count];
    v6 = (void *)MEMORY[0x1A62450A0]();
    if (v5)
    {
      v7 = (void *)[(_PASLazyArrayBase *)self mutableCopy];
      [v7 addObject:v4];
      v8 = (void *)[v7 copy];
    }
    else
    {
      v11[0] = v4;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)_PASLazyArrayBase;
    v8 = [(_PASLazyArrayBase *)&v10 arrayByAddingObject:0];
  }

  return v8;
}

- (BOOL)isEqualToArray:(id)a3
{
  id v4 = (_PASLazyArrayBase *)a3;
  uint64_t v5 = v4;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else if (v4 && (uint64_t v6 = [(_PASLazyArrayBase *)v4 count], v6 == [(_PASLazyArrayBase *)self count]))
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36___PASLazyArrayBase_isEqualToArray___block_invoke;
    v9[3] = &unk_1E5AEAB70;
    objc_super v10 = v5;
    v11 = &v12;
    [(_PASLazyArrayBase *)self enumerateObjectsUsingBlock:v9];
    BOOL v7 = *((unsigned char *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)subarrayWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v15[1] = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [(_PASLazyArrayBase *)self count];
  if (location + length > v6)
  {
    v14.receiver = self;
    v14.super_class = (Class)_PASLazyArrayBase;
    -[_PASLazyArrayBase subarrayWithRange:](&v14, sel_subarrayWithRange_, location, length);
    BOOL v7 = (_PASLazyArrayBase *)objc_claimAutoreleasedReturnValue();
LABEL_3:
    v8 = v7;
    goto LABEL_13;
  }
  if (length == 1)
  {
    v9 = (void *)MEMORY[0x1A62450A0]();
    objc_super v10 = [(_PASLazyArrayBase *)self objectAtIndex:location];
    v15[0] = v10;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else if (length)
  {
    if (length == v6)
    {
      BOOL v7 = self;
      goto LABEL_3;
    }
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:length];
    if (location < location + length)
    {
      do
      {
        uint64_t v12 = [(_PASLazyArrayBase *)self objectAtIndex:location];
        [v11 addObject:v12];

        ++location;
        --length;
      }
      while (length);
    }
    v8 = (void *)[v11 copy];
  }
  else
  {
    v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
LABEL_13:

  return v8;
}

- (id)sortedArrayFromRange:(_NSRange)a3 options:(unint64_t)a4 usingComparator:(id)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a5;
  objc_super v10 = (void *)MEMORY[0x1A62450A0]();
  v11 = -[_PASLazyArrayBase subarrayWithRange:](self, "subarrayWithRange:", location, length);
  uint64_t v12 = (void *)[v11 mutableCopy];

  [v12 sortWithOptions:a4 usingComparator:v9];
  v13 = (void *)[v12 copy];

  return v13;
}

- (id)objectsAtIndexes:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 count];
  unint64_t v6 = [(_PASLazyArrayBase *)self count];
  if (!v4) {
    goto LABEL_6;
  }
  if (!v5)
  {
    objc_super v10 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_9;
  }
  unint64_t v7 = v6;
  if ([v4 lastIndex] >= v6)
  {
LABEL_6:
    v21.receiver = self;
    v21.super_class = (Class)_PASLazyArrayBase;
    v11 = [(_PASLazyArrayBase *)&v21 objectsAtIndexes:v4];
LABEL_7:
    objc_super v10 = v11;
    goto LABEL_9;
  }
  if (v5 == 1)
  {
    v8 = (void *)MEMORY[0x1A62450A0]();
    id v9 = -[_PASLazyArrayBase objectAtIndex:](self, "objectAtIndex:", [v4 firstIndex]);
    v22[0] = v9;
    objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];

    goto LABEL_9;
  }
  if (v5 == v7)
  {
    v11 = self;
    goto LABEL_7;
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v5];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __38___PASLazyArrayBase_objectsAtIndexes___block_invoke;
  v18 = &unk_1E5AEAB48;
  id v19 = v13;
  v20 = self;
  id v14 = v13;
  [v4 enumerateIndexesUsingBlock:&v15];
  objc_super v10 = objc_msgSend(v14, "copy", v15, v16, v17, v18);

LABEL_9:

  return v10;
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  uint64_t v5 = (void (**)(id, void *, uint64_t, unsigned __int8 *))a3;
  if (!v5)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_PASLazyArrayBase.m", 15, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  unsigned __int8 v15 = 0;
  uint64_t v6 = [(_PASLazyArrayBase *)self count];
  if (v6)
  {
    uint64_t v7 = 0;
    uint64_t v8 = v6 - 1;
    do
    {
      id v9 = (void *)MEMORY[0x1A62450A0]();
      objc_super v10 = [(_PASLazyArrayBase *)self objectAtIndex:v7];
      if (!v10)
      {
        v13 = [MEMORY[0x1E4F28B00] currentHandler];
        [v13 handleFailureInMethod:a2, self, @"_PASLazyArrayBase.m", 19, @"Invalid parameter not satisfying: %@", @"obj" object file lineNumber description];
      }
      v5[2](v5, v10, v7, &v15);
      int v11 = v15;

      if (v11) {
        break;
      }
    }
    while (v8 != v7++);
  }
}

@end