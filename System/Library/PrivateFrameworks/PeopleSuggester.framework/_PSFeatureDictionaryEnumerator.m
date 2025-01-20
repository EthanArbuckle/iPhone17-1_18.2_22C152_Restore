@interface _PSFeatureDictionaryEnumerator
- (id)_allKeys;
- (id)_nextKey;
- (uint64_t)_loadNextKeyEnumerator;
- (uint64_t)initWithCollection:(uint64_t)a1;
@end

@implementation _PSFeatureDictionaryEnumerator

- (uint64_t)initWithCollection:(uint64_t)a1
{
  v3 = a2;
  if (a1)
  {
    v8.receiver = (id)a1;
    v8.super_class = (Class)_PSFeatureDictionaryEnumerator;
    v4 = (id *)objc_msgSendSuper2(&v8, sel_init);
    a1 = (uint64_t)v4;
    if (v4)
    {
      objc_storeStrong(v4 + 2, v3[1]);
      objc_storeStrong((id *)(a1 + 24), v3[2]);
      uint64_t v5 = [*(id *)(a1 + 16) allKeys];
      v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = v5;

      *(void *)(a1 + 32) = [*(id *)(a1 + 16) count];
      -[_PSFeatureDictionaryEnumerator _loadNextKeyEnumerator](a1);
    }
  }

  return a1;
}

- (uint64_t)_loadNextKeyEnumerator
{
  if (result)
  {
    uint64_t v1 = result;
    uint64_t v2 = *(void *)(result + 32);
    if (v2)
    {
      v3 = *(void **)(result + 16);
      v4 = [*(id *)(result + 8) objectAtIndexedSubscript:v2 - 1];
      uint64_t v5 = [v3 objectForKeyedSubscript:v4];
      uint64_t v6 = [v5 keyEnumerator];
      v7 = *(void **)(v1 + 40);
      *(void *)(v1 + 40) = v6;

      --*(void *)(v1 + 32);
      return 1;
    }
    else
    {
      result = *(void *)(result + 24);
      if (result)
      {
        if (*(unsigned char *)(v1 + 48))
        {
          return 0;
        }
        else
        {
          uint64_t v8 = [(id)result keyEnumerator];
          v9 = *(void **)(v1 + 40);
          *(void *)(v1 + 40) = v8;

          result = 1;
          *(unsigned char *)(v1 + 48) = 1;
        }
      }
    }
  }
  return result;
}

- (id)_nextKey
{
  if (a1)
  {
    do
    {
      uint64_t v2 = [*(id *)(a1 + 40) nextObject];
    }
    while (!v2 && (-[_PSFeatureDictionaryEnumerator _loadNextKeyEnumerator](a1) & 1) != 0);
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (id)_allKeys
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = objc_opt_new();
    uint64_t v3 = [*(id *)(a1 + 40) nextObject];
    if (v3)
    {
      v4 = (void *)v3;
      do
      {
        [v2 addObject:v4];
        uint64_t v5 = [*(id *)(a1 + 40) nextObject];

        v4 = (void *)v5;
      }
      while (v5);
    }
    for (uint64_t i = *(void *)(a1 + 32); i; uint64_t i = *(void *)(a1 + 32))
    {
      v7 = *(void **)(a1 + 16);
      uint64_t v8 = [*(id *)(a1 + 8) objectAtIndexedSubscript:i - 1];
      v9 = [v7 objectForKeyedSubscript:v8];

      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        id v13 = 0;
        uint64_t v14 = *(void *)v31;
        do
        {
          uint64_t v15 = 0;
          v16 = v13;
          do
          {
            if (*(void *)v31 != v14) {
              objc_enumerationMutation(v10);
            }
            id v13 = *(id *)(*((void *)&v30 + 1) + 8 * v15);

            [v2 addObject:v13];
            ++v15;
            v16 = v13;
          }
          while (v12 != v15);
          uint64_t v12 = [v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
        }
        while (v12);
      }
      --*(void *)(a1 + 32);
    }
    v17 = *(void **)(a1 + 24);
    if (v17 && !*(unsigned char *)(a1 + 48))
    {
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v18 = v17;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        id v21 = 0;
        uint64_t v22 = *(void *)v27;
        do
        {
          uint64_t v23 = 0;
          v24 = v21;
          do
          {
            if (*(void *)v27 != v22) {
              objc_enumerationMutation(v18);
            }
            id v21 = *(id *)(*((void *)&v26 + 1) + 8 * v23);

            objc_msgSend(v2, "addObject:", v21, (void)v26);
            ++v23;
            v24 = v21;
          }
          while (v20 != v23);
          uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
        }
        while (v20);
      }
      *(unsigned char *)(a1 + 48) = 1;
    }
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyEnumerator, 0);
  objc_storeStrong((id *)&self->_otherValues, 0);
  objc_storeStrong((id *)&self->_timeBuckets, 0);

  objc_storeStrong((id *)&self->_timeBucketsArray, 0);
}

@end