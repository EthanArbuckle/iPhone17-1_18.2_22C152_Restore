@interface NSSet(PKSetAdditions)
- (id)pk_anyObjectPassingTest:()PKSetAdditions;
- (id)pk_mutableArrayCopy;
- (id)pk_setByApplyingBlock:()PKSetAdditions;
- (id)pk_setByRemovingObject:()PKSetAdditions;
- (id)pk_setBySafelyApplyingBlock:()PKSetAdditions;
- (uint64_t)pk_arrayCopy;
- (uint64_t)pk_hasObjectPassingTest:()PKSetAdditions;
@end

@implementation NSSet(PKSetAdditions)

- (uint64_t)pk_arrayCopy
{
  if (![a1 count]) {
    return MEMORY[0x1E4F1CBF0];
  }
  v2 = objc_msgSend(a1, "pk_mutableArrayCopy");
  uint64_t v3 = [v2 copy];

  return v3;
}

- (id)pk_mutableArrayCopy
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 count];
  uint64_t v3 = (objc_class *)MEMORY[0x1E4F1CA48];
  if (v2)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v2];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = a1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          objc_msgSend(v4, "addObject:", *(void *)(*((void *)&v11 + 1) + 8 * v9++), (void)v11);
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }

    return v4;
  }
  else
  {
    return objc_alloc_init(v3);
  }
}

- (id)pk_anyObjectPassingTest:()PKSetAdditions
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (v4)
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v5 = a1;
    id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (v4[2](v4, v9))
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (uint64_t)pk_hasObjectPassingTest:()PKSetAdditions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  if (v4)
  {
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = a1;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
          if (v4[2](v4, *(void *)(*((void *)&v10 + 1) + 8 * i)))
          {
            uint64_t v6 = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)pk_setByRemovingObject:()PKSetAdditions
{
  v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != %@", a3];
  id v5 = [a1 filteredSetUsingPredicate:v4];

  return v5;
}

- (id)pk_setByApplyingBlock:()PKSetAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i));
          objc_msgSend(v6, "addObject:", v12, (void)v15);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    id v13 = (id)[v6 copy];
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v13;
}

- (id)pk_setBySafelyApplyingBlock:()PKSetAdditions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v4 = a3;
  uint64_t v5 = [a1 count];
  if (v5)
  {
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithCapacity:v5];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = a1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = v4[2](v4, *(void *)(*((void *)&v15 + 1) + 8 * i));
          if (v12) {
            objc_msgSend(v6, "addObject:", v12, (void)v15);
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }

    id v13 = (id)[v6 copy];
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CAD0]);
  }

  return v13;
}

@end