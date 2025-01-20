@interface NSSet(_PASAdditions)
- (id)_pas_filteredSetWithTest:()_PASAdditions;
- (id)_pas_mappedSetWithTransform:()_PASAdditions;
- (id)_pas_setByRemovingObject:()_PASAdditions;
- (id)_pas_setByRemovingObjectsFromSet:()_PASAdditions;
@end

@implementation NSSet(_PASAdditions)

- (id)_pas_setByRemovingObjectsFromSet:()_PASAdditions
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
LABEL_20:
    uint64_t v13 = [a1 copy];
    goto LABEL_21;
  }
  if (a1 == v4)
  {
    uint64_t v13 = objc_opt_new();
LABEL_21:
    v14 = (void *)v13;
    goto LABEL_22;
  }
  size_t v5 = (8 * [a1 count]) | 7;
  memptr = 0;
  uint64_t v23 = 0;
  if (v5 > 0x400)
  {
    int v16 = malloc_type_posix_memalign(&memptr, 8uLL, 8 * [a1 count], 0x80040B8603338uLL);
    LOBYTE(v23) = 0;
    if (v16)
    {
      id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
      objc_exception_throw(v17);
    }
    v6 = (char *)memptr;
  }
  else
  {
    v6 = (char *)&v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    bzero(v6, v5);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  a1 = a1;
  uint64_t v7 = [a1 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(a1);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        if (([v4 containsObject:v12] & 1) == 0) {
          *(void *)&v6[8 * v9++] = v12;
        }
      }
      uint64_t v8 = [a1 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }
  else
  {
    uint64_t v9 = 0;
  }

  if (v9 == [a1 count])
  {
    if (v5 >= 0x401) {
      free(v6);
    }
    goto LABEL_20;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithObjects:v6 count:v9];
  if (v5 >= 0x401) {
    free(v6);
  }
LABEL_22:

  return v14;
}

- (id)_pas_setByRemovingObject:()_PASAdditions
{
  id v4 = a3;
  if (v4 && ([a1 containsObject:v4] & 1) != 0)
  {
    size_t v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithSet:a1];
    [v5 removeObject:v4];
    v6 = (void *)[v5 copy];
  }
  else
  {
    v6 = (void *)[a1 copy];
  }

  return v6;
}

- (id)_pas_filteredSetWithTest:()_PASAdditions
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  size_t v5 = a3;
  if (!v5)
  {
    int v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, a1, @"NSSet+_PASAdditions.m", 30, @"Invalid parameter not satisfying: %@", @"test" object file lineNumber description];
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x1A62450A0]();
        if (v5[2](v5, v12)) {
          [v6 addObject:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  v14 = (void *)[v6 copy];

  return v14;
}

- (id)_pas_mappedSetWithTransform:()_PASAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  size_t v5 = a3;
  if (!v5)
  {
    long long v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, a1, @"NSSet+_PASAdditions.m", 19, @"Invalid parameter not satisfying: %@", @"transform" object file lineNumber description];
  }
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(a1, "count"));
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = a1;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v13 = (void *)MEMORY[0x1A62450A0]();
        v14 = v5[2](v5, v12);
        if (v14) {
          [v6 addObject:v14];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  v15 = (void *)[v6 copy];

  return v15;
}

@end