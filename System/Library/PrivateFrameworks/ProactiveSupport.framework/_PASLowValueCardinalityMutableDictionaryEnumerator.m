@interface _PASLowValueCardinalityMutableDictionaryEnumerator
- (BOOL)_loadNextKeyEnumerator;
- (id)allObjects;
- (id)nextObject;
@end

@implementation _PASLowValueCardinalityMutableDictionaryEnumerator

- (BOOL)_loadNextKeyEnumerator
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    v3 = [*(id *)(a1 + 8) objectAtIndexedSubscript:v1 - 1];
    uint64_t v4 = [v3 objectEnumerator];
    v5 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = v4;

    *(void *)(a1 + 16) -= 2;
  }
  return v1 != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyEnumerator, 0);

  objc_storeStrong((id *)&self->_objectsAndKeys, 0);
}

- (id)nextObject
{
  if (self)
  {
    v3 = self;
    self = [(NSEnumerator *)self->_keyEnumerator nextObject];
    if (!self)
    {
      if (-[_PASLowValueCardinalityMutableDictionaryEnumerator _loadNextKeyEnumerator]((uint64_t)v3))
      {
        self = [(NSEnumerator *)v3->_keyEnumerator nextObject];
      }
      else
      {
        self = 0;
      }
    }
    uint64_t v2 = vars8;
  }
  return self;
}

- (id)allObjects
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v3 = objc_opt_new();
    uint64_t v4 = [(NSEnumerator *)self->_keyEnumerator nextObject];
    if (v4)
    {
      v5 = (void *)v4;
      do
      {
        [v3 addObject:v5];
        uint64_t v6 = [(NSEnumerator *)self->_keyEnumerator nextObject];

        v5 = (void *)v6;
      }
      while (v6);
    }
    for (unint64_t i = self->_i; i; unint64_t i = self->_i)
    {
      v8 = [(NSArray *)self->_objectsAndKeys objectAtIndexedSubscript:i - 1];
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9)
      {
        uint64_t v10 = v9;
        id v11 = 0;
        uint64_t v12 = *(void *)v17;
        do
        {
          uint64_t v13 = 0;
          v14 = v11;
          do
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v8);
            }
            id v11 = *(id *)(*((void *)&v16 + 1) + 8 * v13);

            [v3 addObject:v11];
            ++v13;
            v14 = v11;
          }
          while (v10 != v13);
          uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v10);
      }
      self->_i -= 2;
    }
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

@end