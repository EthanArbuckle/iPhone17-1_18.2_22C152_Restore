@interface _PASLowValueCardinalityMutableDictionary
- (_PASLowValueCardinalityMutableDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)allKeysForObject:(id)a3;
- (id)allValues;
- (id)keyEnumerator;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation _PASLowValueCardinalityMutableDictionary

- (void).cxx_destruct
{
}

- (id)allKeysForObject:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = objc_opt_new();
  uint64_t v6 = [(NSMutableArray *)self->_objectsAndKeys count];
  if (v6)
  {
    unint64_t v7 = v6;
    unint64_t v8 = 0;
    uint64_t v18 = v6;
    do
    {
      v9 = [(NSMutableArray *)self->_objectsAndKeys objectAtIndexedSubscript:v8];
      if ([v9 isEqual:v4])
      {
        id v10 = v4;
        v11 = self;
        v12 = [(NSMutableArray *)self->_objectsAndKeys objectAtIndexedSubscript:v8 | 1];
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v20;
          do
          {
            for (uint64_t i = 0; i != v14; ++i)
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(v12);
              }
              [v5 addObject:*(void *)(*((void *)&v19 + 1) + 8 * i)];
            }
            uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v23 count:16];
          }
          while (v14);
        }

        id v4 = v10;
        unint64_t v7 = v18;
        self = v11;
      }
      v8 += 2;
    }
    while (v8 < v7);
  }

  return v5;
}

- (id)allValues
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:self->_count];
  uint64_t v4 = [(NSMutableArray *)self->_objectsAndKeys count];
  if (v4)
  {
    unint64_t v5 = v4;
    for (unint64_t i = 0; i < v5; i += 2)
    {
      unint64_t v7 = [(NSMutableArray *)self->_objectsAndKeys objectAtIndexedSubscript:i];
      unint64_t v8 = [(NSMutableArray *)self->_objectsAndKeys objectAtIndexedSubscript:i | 1];
      uint64_t v9 = [v8 count];

      while (v9)
      {
        --v9;
        [v3 addObject:v7];
      }
    }
  }

  return v3;
}

- (void)removeObjectForKey:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(NSMutableArray *)self->_objectsAndKeys count];
  if (v4)
  {
    unint64_t v5 = v4;
    unint64_t v6 = 0;
    while (1)
    {
      unint64_t v7 = [(NSMutableArray *)self->_objectsAndKeys objectAtIndexedSubscript:v6 + 1];
      if ([v7 containsObject:v8]) {
        break;
      }
      v6 += 2;

      if (v6 >= v5) {
        goto LABEL_9;
      }
    }
    [v7 removeObject:v8];
    if (![v7 count]) {
      -[NSMutableArray removeObjectsInRange:](self->_objectsAndKeys, "removeObjectsInRange:", v6, 2);
    }
    --self->_count;
  }
LABEL_9:
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v35 = a3;
  id v7 = a4;
  if (!v35)
  {
    v33 = [MEMORY[0x1E4F28B00] currentHandler];
    [v33 handleFailureInMethod:a2, self, @"_PASLowValueCardinalityMutableDictionary.m", 103, @"Invalid parameter not satisfying: %@", @"anObject" object file lineNumber description];

    if (self) {
      goto LABEL_3;
    }
LABEL_35:
    v11 = 0;
    goto LABEL_6;
  }
  if (!self) {
    goto LABEL_35;
  }
LABEL_3:
  objectsAndKeys = self->_objectsAndKeys;
  if (!objectsAndKeys)
  {
    uint64_t v9 = (NSMutableArray *)objc_opt_new();
    id v10 = self->_objectsAndKeys;
    self->_objectsAndKeys = v9;

    objectsAndKeys = self->_objectsAndKeys;
  }
  v11 = objectsAndKeys;
LABEL_6:
  uint64_t v12 = [(NSMutableArray *)v11 count];
  if (v12)
  {
    unint64_t v13 = v12;
    v34 = self;
    LOBYTE(v14) = 0;
    char v15 = 0;
    unint64_t v16 = 0;
    unint64_t v17 = 0;
    uint64_t v18 = 0;
    while (1)
    {
      id v19 = [(NSMutableArray *)v11 objectAtIndexedSubscript:v17];
      long long v20 = [(NSMutableArray *)v11 objectAtIndexedSubscript:v17 + 1];
      long long v21 = v20;
      if (v14) {
        break;
      }
      int v14 = [v20 containsObject:v7];
      if (v19 == v35) {
        goto LABEL_17;
      }
      if (v14)
      {
        [v21 removeObject:v7];
        if (![v21 count])
        {
          uint64_t v18 = 2;
          unint64_t v16 = v17;
        }
        LOBYTE(v14) = 1;
LABEL_18:
        if (v15)
        {

          if (v18) {
            -[NSMutableArray removeObjectsInRange:](v11, "removeObjectsInRange:", v16, v18);
          }
          goto LABEL_31;
        }
      }
LABEL_19:
      v17 += 2;

      if (v17 >= v13)
      {
        if (v18)
        {
          if (v15)
          {
            -[NSMutableArray removeObjectsInRange:](v11, "removeObjectsInRange:", v16, v18);
          }
          else
          {
            uint64_t v29 = v16 + 1;
            [(NSMutableArray *)v11 setObject:v35 atIndexedSubscript:v16];
            id v30 = objc_alloc(MEMORY[0x1E4F1CA80]);
            v31 = (void *)[v7 copyWithZone:0];
            v32 = objc_msgSend(v30, "initWithObjects:", v31, 0);
            [(NSMutableArray *)v11 setObject:v32 atIndexedSubscript:v29];
          }
        }
        else if ((v15 & 1) == 0)
        {
          [(NSMutableArray *)v11 addObject:v35];
          id v26 = objc_alloc(MEMORY[0x1E4F1CA80]);
          v27 = (void *)[v7 copyWithZone:0];
          v28 = objc_msgSend(v26, "initWithObjects:", v27, 0);
          [(NSMutableArray *)v11 addObject:v28];
        }
        self = v34;
        if (v14) {
          goto LABEL_31;
        }
        goto LABEL_30;
      }
    }
    int v14 = 1;
    if (v19 != v35) {
      goto LABEL_18;
    }
LABEL_17:
    long long v22 = (void *)[v7 copyWithZone:0];
    [v21 addObject:v22];

    char v15 = 1;
    if (v14) {
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  [(NSMutableArray *)v11 addObject:v35];
  id v23 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v24 = (void *)[v7 copyWithZone:0];
  v25 = objc_msgSend(v23, "initWithObjects:", v24, 0);
  [(NSMutableArray *)v11 addObject:v25];

LABEL_30:
  ++self->_count;
LABEL_31:
}

- (id)keyEnumerator
{
  uint64_t v3 = [(NSMutableArray *)self->_objectsAndKeys count];
  if (v3 == 2)
  {
    unint64_t v5 = [(NSMutableArray *)self->_objectsAndKeys objectAtIndexedSubscript:1];
    uint64_t v4 = [(_PASLowValueCardinalityMutableDictionary *)v5 objectEnumerator];
  }
  else
  {
    if (!v3)
    {
      uint64_t v4 = [MEMORY[0x1E4F1CBF0] objectEnumerator];
      goto LABEL_9;
    }
    uint64_t v4 = [_PASLowValueCardinalityMutableDictionaryEnumerator alloc];
    unint64_t v5 = self;
    if (v4)
    {
      v8.receiver = v4;
      v8.super_class = (Class)_PASLowValueCardinalityMutableDictionaryEnumerator;
      unint64_t v6 = [(_PASLowValueCardinalityMutableDictionary *)&v8 init];
      uint64_t v4 = (_PASLowValueCardinalityMutableDictionaryEnumerator *)v6;
      if (v6)
      {
        objc_storeStrong((id *)&v6->_objectsAndKeys, self->_objectsAndKeys);
        v4->_unint64_t i = [(NSArray *)v4->_objectsAndKeys count];
        -[_PASLowValueCardinalityMutableDictionaryEnumerator _loadNextKeyEnumerator]((uint64_t)v4);
      }
    }
  }

LABEL_9:

  return v4;
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(NSMutableArray *)self->_objectsAndKeys count];
  uint64_t v6 = -2;
  while (1)
  {
    uint64_t v7 = v6 + 2;
    if (v6 + 2 >= v5) {
      break;
    }
    objc_super v8 = [(NSMutableArray *)self->_objectsAndKeys objectAtIndexedSubscript:v6 + 3];
    int v9 = [v8 containsObject:v4];

    uint64_t v6 = v7;
    if (v9)
    {
      id v10 = [(NSMutableArray *)self->_objectsAndKeys objectAtIndexedSubscript:v7];
      goto LABEL_6;
    }
  }
  id v10 = 0;
LABEL_6:

  return v10;
}

- (unint64_t)count
{
  return self->_count;
}

- (_PASLowValueCardinalityMutableDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)_PASLowValueCardinalityMutableDictionary;
  objc_super v8 = [(_PASLowValueCardinalityMutableDictionary *)&v14 init];
  if (v8) {
    BOOL v9 = a5 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    do
    {
      uint64_t v11 = (uint64_t)*a3++;
      uint64_t v10 = v11;
      uint64_t v12 = (uint64_t)*a4++;
      [(_PASLowValueCardinalityMutableDictionary *)v8 setObject:v10 forKeyedSubscript:v12];
      --a5;
    }
    while (a5);
  }
  return v8;
}

@end