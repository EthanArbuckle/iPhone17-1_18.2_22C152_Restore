@interface _PASLPDictionary
- (BOOL)isEqualToDictionary:(id)a3;
- (_PASLPDictionary)initWithCoder:(id)a3;
- (_PASLPDictionary)initWithLazyPlistReader:(id)a3 context:(id)a4;
- (_PASLPDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5;
- (id)_pas_overrideUnlazyDictionary;
- (id)allKeys;
- (id)allKeysForObject:(id)a3;
- (id)allValues;
- (id)keyEnumerator;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5;
@end

@implementation _PASLPDictionary

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_objectsAndKeys);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_reader, 0);
}

- (id)objectForKey:(id)a3
{
  return (id)[(_PASLPReaderProtocol *)self->_reader objectForKey:a3 usingDictionaryContext:self->_context];
}

- (void)enumerateKeysAndObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  v6 = (void (**)(id, void *, void *, unsigned char *))a4;
  if (!v6)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"_PASLPDictionary.m", 94, @"Invalid parameter not satisfying: %@", @"block" object file lineNumber description];
  }
  unint64_t v7 = 0;
  unsigned __int8 v14 = 0;
  do
  {
    context = self->_context;
    if (context) {
      context = (_PASLPDictionaryContext *)context->_count;
    }
    if (v7 >= (unint64_t)context) {
      break;
    }
    v9 = (void *)MEMORY[0x1A62450A0]();
    v10 = [(_PASLPReaderProtocol *)self->_reader keyAtIndex:v7 usingDictionaryContext:self->_context];
    v11 = [(_PASLPReaderProtocol *)self->_reader objectAtIndex:v7 usingDictionaryContext:self->_context];
    v6[2](v6, v10, v11, &v14);
    int v12 = v14;

    ++v7;
  }
  while (!v12);
}

- (_PASLPDictionary)initWithLazyPlistReader:(id)a3 context:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    unsigned __int8 v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"_PASLPDictionary.m", 27, @"Invalid parameter not satisfying: %@", @"reader" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"_PASLPDictionary.m", 28, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)_PASLPDictionary;
  v11 = [(_PASLPDictionary *)&v16 init];
  int v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_reader, a3);
    objc_storeStrong((id *)&v12->_context, a4);
  }

  return v12;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
}

- (id)_pas_overrideUnlazyDictionary
{
  if (objc_opt_respondsToSelector())
  {
    DeepCopy = [(_PASLPReaderProtocol *)self->_reader unlazyCopyForDictionaryWithContext:self->_context];
  }
  else
  {
    DeepCopy = (void *)CFPropertyListCreateDeepCopy(0, self, 0);
  }

  return DeepCopy;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F1CA60]);
  context = self->_context;
  if (context) {
    unint64_t count = context->_count;
  }
  else {
    unint64_t count = 0;
  }
  unint64_t v7 = (void *)[v4 initWithCapacity:count];
  for (unint64_t i = 0; ; ++i)
  {
    id v9 = self->_context;
    if (v9) {
      id v9 = (_PASLPDictionaryContext *)v9->_count;
    }
    if (i >= (unint64_t)v9) {
      break;
    }
    v10 = (void *)MEMORY[0x1A62450A0]();
    v11 = [(_PASLPReaderProtocol *)self->_reader keyAtIndex:i usingDictionaryContext:self->_context];
    int v12 = [(_PASLPReaderProtocol *)self->_reader objectAtIndex:i usingDictionaryContext:self->_context];
    [v7 setObject:v12 forKeyedSubscript:v11];
  }
  return v7;
}

- (void)getObjects:(id *)a3 andKeys:(id *)a4 count:(unint64_t)a5
{
  if (a5)
  {
    unint64_t context = (unint64_t)self->_context;
    if (context) {
      unint64_t context = *(void *)(context + 16);
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    unint64_t v7 = __45___PASLPDictionary_getObjects_andKeys_count___block_invoke;
    id v8 = &unk_1E5AEB610;
    if (context >= a5) {
      unint64_t context = a5;
    }
    id v9 = self;
    v10 = a3;
    unint64_t v11 = context;
    int v12 = a4;
    pthread_mutex_lock(&runWithGlobalPLPLock_lock_3379);
    v7(v6);
    pthread_mutex_unlock(&runWithGlobalPLPLock_lock_3379);
  }
}

- (BOOL)isEqualToDictionary:(id)a3
{
  id v4 = (_PASLPDictionary *)a3;
  v5 = v4;
  if (v4 == self) {
    goto LABEL_6;
  }
  if (!v4)
  {
LABEL_11:
    BOOL v6 = 0;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || self->_reader != v5->_reader
    || ![(_PASLPDictionaryContext *)self->_context isEqual:v5->_context])
  {
    uint64_t v7 = [(_PASLPDictionary *)v5 count];
    unint64_t context = self->_context;
    if (context) {
      unint64_t context = (_PASLPDictionaryContext *)context->_count;
    }
    if ((_PASLPDictionaryContext *)v7 == context)
    {
      uint64_t v13 = 0;
      unsigned __int8 v14 = &v13;
      uint64_t v15 = 0x2020000000;
      char v16 = 1;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __40___PASLPDictionary_isEqualToDictionary___block_invoke;
      v10[3] = &unk_1E5AEB5E8;
      unint64_t v11 = v5;
      int v12 = &v13;
      [(_PASLPDictionary *)self enumerateKeysAndObjectsUsingBlock:v10];
      BOOL v6 = *((unsigned char *)v14 + 24) != 0;

      _Block_object_dispose(&v13, 8);
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_6:
  BOOL v6 = 1;
LABEL_12:

  return v6;
}

- (id)allKeysForObject:(id)a3
{
  id v4 = a3;
  if (v4 && (unint64_t context = self->_context) != 0 && context->_count)
  {
    BOOL v6 = objc_opt_new();
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    int v12 = __37___PASLPDictionary_allKeysForObject___block_invoke;
    uint64_t v13 = &unk_1E5AEB5C0;
    id v14 = v4;
    id v15 = v6;
    id v7 = v6;
    [(_PASLPDictionary *)self enumerateKeysAndObjectsUsingBlock:&v10];
    id v8 = objc_msgSend(v7, "copy", v10, v11, v12, v13);
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

- (id)allValues
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t context = self->_context;
  if (context) {
    unint64_t count = context->_count;
  }
  else {
    unint64_t count = 0;
  }
  BOOL v6 = (void *)[v3 initWithCapacity:count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __29___PASLPDictionary_allValues__block_invoke;
  v10[3] = &unk_1E5AEB598;
  id v11 = v6;
  id v7 = v6;
  [(_PASLPDictionary *)self enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = (void *)[v7 copy];

  return v8;
}

- (id)allKeys
{
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  unint64_t context = self->_context;
  if (context) {
    unint64_t count = context->_count;
  }
  else {
    unint64_t count = 0;
  }
  BOOL v6 = (void *)[v3 initWithCapacity:count];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __27___PASLPDictionary_allKeys__block_invoke;
  v10[3] = &unk_1E5AEB598;
  id v11 = v6;
  id v7 = v6;
  [(_PASLPDictionary *)self enumerateKeysAndObjectsUsingBlock:v10];
  id v8 = (void *)[v7 copy];

  return v8;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  unint64_t var0 = a3->var0;
  id v11 = [(_PASLPDictionaryContext *)self->_context enumerationCache];
  id v12 = v11;
  if (var0)
  {
    if (v11) {
      [v11 removeAllObjects];
    }
  }
  else if (!v11)
  {
    unint64_t context = self->_context;
    if (context && context->_count)
    {
      id v14 = objc_opt_new();
      id v15 = v14;
      char v16 = self->_context;
      if (v16) {
        char v16 = (_PASLPDictionaryContext *)v16->_count;
      }
      if ((unint64_t)v16 >= a5) {
        unint64_t v17 = a5;
      }
      else {
        unint64_t v17 = (unint64_t)v16;
      }
      [v14 setCountLimit:v17];
      [(_PASLPDictionaryContext *)self->_context setEnumerationCache:v15];
      id v12 = v15;
      CFAutorelease(v12);
    }
    else
    {
      id v12 = 0;
    }
  }

  unint64_t v18 = 0;
  if (a5)
  {
    while (1)
    {
      v19 = self->_context;
      if (!v19 || a3->var0 >= v19->_count) {
        break;
      }
      v20 = -[_PASLPReaderProtocol keyAtIndex:usingDictionaryContext:](self->_reader, "keyAtIndex:usingDictionaryContext:");
      if (!v20)
      {
        v22 = [MEMORY[0x1E4F28B00] currentHandler];
        [v22 handleFailureInMethod:a2, self, @"_PASLPDictionary.m", 185, @"Invalid parameter not satisfying: %@", @"key" object file lineNumber description];
      }
      CFRetain(v20);
      CFAutorelease(v20);
      a4[v18] = v20;
      ++a3->var0;

      if (a5 == ++v18)
      {
        unint64_t v18 = a5;
        break;
      }
    }
  }
  a3->var1 = a4;
  a3->var2 = (unint64_t *)self;
  return v18;
}

- (id)keyEnumerator
{
  v2 = [[_PASLPDictionaryEnumerator alloc] initWithLazyPlistReader:self->_reader context:self->_context];

  return v2;
}

- (unint64_t)count
{
  unint64_t context = self->_context;
  if (context) {
    return context->_count;
  }
  else {
    return 0;
  }
}

- (_PASLPDictionary)initWithCoder:(id)a3
{
  result = (_PASLPDictionary *)a3;
  __break(1u);
  return result;
}

- (_PASLPDictionary)initWithObjects:(const void *)a3 forKeys:(const void *)a4 count:(unint64_t)a5
{
  BOOL v6 = (_PASLPDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithObjects:a3 forKeys:a4 count:a5];

  return v6;
}

@end