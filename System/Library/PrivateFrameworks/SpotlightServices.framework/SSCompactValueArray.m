@interface SSCompactValueArray
+ (id)decodeFromDictionary:(id)a3 nesting:(unint64_t)a4;
- (SSCompactValueArray)init;
- (id)defaultValue;
- (id)initWithObjects:(void *)a3 indexSet:;
- (id)objectAtIndex:(id *)a1;
@end

@implementation SSCompactValueArray

- (id)objectAtIndex:(id *)a1
{
  if (a1)
  {
    v3 = a1;
    if (a2 <= 1) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = a2;
    }
    uint64_t v5 = [a1[2] indexLessThanOrEqualToIndex:v4];
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      a1 = 0;
    }
    else
    {
      uint64_t v6 = objc_msgSend(v3[2], "countOfIndexesInRange:", 0, v5);
      a1 = 0;
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
        objc_msgSend(v3[1], "objectAtIndex:");
        a1 = (id *)objc_claimAutoreleasedReturnValue();
      }
    }
    uint64_t v2 = vars8;
  }
  return a1;
}

- (id)defaultValue
{
  if (a1)
  {
    a1 = [a1[1] lastObject];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)initWithObjects:(void *)a3 indexSet:
{
  id v6 = a2;
  id v7 = a3;
  if (a1)
  {
    v10.receiver = a1;
    v10.super_class = (Class)SSCompactValueArray;
    v8 = (id *)objc_msgSendSuper2(&v10, sel_init);
    a1 = v8;
    if (v8)
    {
      objc_storeStrong(v8 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (SSCompactValueArray)init
{
  v3 = [MEMORY[0x1E4F1C978] array];
  uint64_t v4 = [MEMORY[0x1E4F28D60] indexSet];
  uint64_t v5 = (SSCompactValueArray *)-[SSCompactValueArray initWithObjects:indexSet:]((id *)&self->super.isa, v3, v4);

  return v5;
}

+ (id)decodeFromDictionary:(id)a3 nesting:(unint64_t)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_opt_new();
  v44 = objc_opt_new();
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v54 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        unint64_t v13 = translateKey(v12);
        if (v13 <= 0x7FFFFFFFFFFFFFFDLL)
        {
          unint64_t v14 = v13;
          if (!a4
            || ([v7 objectForKey:v12],
                v15 = objc_claimAutoreleasedReturnValue(),
                objc_opt_class(),
                char isKindOfClass = objc_opt_isKindOfClass(),
                v15,
                (isKindOfClass & 1) != 0))
          {
            [v44 addIndex:v14];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v59 count:16];
    }
    while (v9);
  }

  uint64_t v17 = [v44 count];
  if (v17 >= 1)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *MEMORY[0x1E4F1D260];
    do
    {
      [v6 addObject:v19];
      --v18;
    }
    while (v18);
  }
  v43 = v6;
  if (a4)
  {
    long long v47 = 0uLL;
    long long v48 = 0uLL;
    long long v45 = 0uLL;
    long long v46 = 0uLL;
    id v20 = v7;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v46;
      unint64_t v24 = a4 - 1;
      do
      {
        for (uint64_t j = 0; j != v22; ++j)
        {
          if (*(void *)v46 != v23) {
            objc_enumerationMutation(v20);
          }
          v26 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          uint64_t v27 = translateKey(v26);
          if (v27 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v28 = indexForItem(v27, v44);
            v29 = [v20 objectForKey:v26];
            v30 = [a1 decodeFromDictionary:v29 nesting:v24];
            [v43 setObject:v30 atIndexedSubscript:v28];
          }
        }
        uint64_t v22 = [v20 countByEnumeratingWithState:&v45 objects:v57 count:16];
      }
      while (v22);
    }
  }
  else
  {
    long long v51 = 0uLL;
    long long v52 = 0uLL;
    long long v49 = 0uLL;
    long long v50 = 0uLL;
    id v31 = v7;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v49 objects:v58 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v33; ++k)
        {
          if (*(void *)v50 != v34) {
            objc_enumerationMutation(v31);
          }
          v36 = *(void **)(*((void *)&v49 + 1) + 8 * k);
          uint64_t v37 = translateKey(v36);
          if (v37 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v38 = indexForItem(v37, v44);
            v39 = [v31 objectForKey:v36];
            [v43 setObject:v39 atIndexedSubscript:v38];
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v49 objects:v58 count:16];
      }
      while (v33);
    }
  }

  v40 = -[SSCompactValueArray initWithObjects:indexSet:]((id *)objc_alloc((Class)a1), v43, v44);
  return v40;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexes, 0);
  objc_storeStrong((id *)&self->_objects, 0);
}

@end