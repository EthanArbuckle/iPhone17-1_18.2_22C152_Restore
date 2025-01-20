@interface MSVLRUDictionary
- (BOOL)isEqual:(id)a3;
- (MSVLRUDictionary)initWithMaximumCapacity:(unint64_t)a3;
- (MSVLRUDictionaryDelegate)delegate;
- (MSVLRUDictionaryNode)head;
- (MSVLRUDictionaryNode)tail;
- (NSMutableDictionary)dictionary;
- (id)allKeys;
- (id)allValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)peekObjectForKey:(id)a3;
- (int64_t)count;
- (int64_t)maximumCapacity;
- (int64_t)transactionCount;
- (unint64_t)hash;
- (void)_addNodeToFront:(id)a3;
- (void)_moveNodeToFront:(id)a3;
- (void)_removeNode:(id)a3;
- (void)_removeNodeFromLinkedList:(id)a3;
- (void)_shrinkToCapacity;
- (void)beginTransaction;
- (void)endTransaction;
- (void)enumerateKeysAndObjectsUsingBlock:(id)a3;
- (void)performTransaction:(id)a3;
- (void)pokeKey:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setHead:(id)a3;
- (void)setMaximumCapacity:(int64_t)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setTail:(id)a3;
- (void)setTransactionCount:(int64_t)a3;
@end

@implementation MSVLRUDictionary

- (void)_shrinkToCapacity
{
  if (self->_transactionCount <= 0)
  {
    while ([(MSVLRUDictionary *)self count] > self->_maximumCapacity)
    {
      v3 = [(MSVLRUDictionary *)self tail];
      id v5 = [v3 prev];

      if (!v5
        || ([(MSVLRUDictionary *)self head],
            id v4 = (id)objc_claimAutoreleasedReturnValue(),
            v4,
            v5 == v4))
      {
        MEMORY[0x1F41817F8]();
        return;
      }
      [(MSVLRUDictionary *)self _removeNode:v5];
    }
  }
}

- (int64_t)count
{
  return [(NSMutableDictionary *)self->_dictionary count];
}

- (void)pokeKey:(id)a3
{
  id v8 = a3;
  if (!v8)
  {
    v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2, self, @"MSVLRUDictionary.m", 132, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  id v5 = [(MSVLRUDictionary *)self dictionary];
  v6 = [v5 objectForKeyedSubscript:v8];

  if (v6) {
    [(MSVLRUDictionary *)self _moveNodeToFront:v6];
  }
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v18 = a3;
  id v7 = a4;
  if (!v7)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"MSVLRUDictionary.m", 141, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  id v8 = [(MSVLRUDictionary *)self dictionary];
  v9 = [v8 objectForKeyedSubscript:v7];

  if (v9)
  {
    [(MSVLRUDictionary *)self _moveNodeToFront:v9];
    [(MSVLRUDictionaryNode *)v9 setObject:v18];
  }
  else
  {
    if (!self->_transactionCount)
    {
      v10 = [(MSVLRUDictionary *)self dictionary];
      uint64_t v11 = [v10 count];
      int64_t v12 = [(MSVLRUDictionary *)self maximumCapacity];

      if (v11 == v12)
      {
        v13 = [(MSVLRUDictionary *)self tail];
        v14 = [v13 prev];
        [(MSVLRUDictionary *)self _removeNode:v14];
      }
    }
    v15 = (void *)[v7 copy];
    v9 = [[MSVLRUDictionaryNode alloc] initWithKey:v15 object:v18];
    v16 = [(MSVLRUDictionary *)self dictionary];
    [v16 setObject:v9 forKeyedSubscript:v15];

    [(MSVLRUDictionary *)self _addNodeToFront:v9];
  }
}

- (id)objectForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MSVLRUDictionary.m", 113, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  v6 = [(MSVLRUDictionary *)self dictionary];
  id v7 = [v6 objectForKeyedSubscript:v5];

  if (v7)
  {
    [(MSVLRUDictionary *)self _moveNodeToFront:v7];
    id v8 = [v7 object];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (int64_t)maximumCapacity
{
  return self->_maximumCapacity;
}

- (void)_removeNodeFromLinkedList:(id)a3
{
  id v3 = a3;
  id v5 = [v3 prev];
  id v4 = [v3 next];

  [v5 setNext:v4];
  [v4 setPrev:v5];
}

- (void)_addNodeToFront:(id)a3
{
  id v4 = a3;
  id v5 = [(MSVLRUDictionary *)self head];
  id v8 = [v5 next];

  v6 = [(MSVLRUDictionary *)self head];
  [v6 setNext:v4];

  id v7 = [(MSVLRUDictionary *)self head];
  [v4 setPrev:v7];

  [v4 setNext:v8];
  [v8 setPrev:v4];
}

- (MSVLRUDictionaryNode)head
{
  return self->_head;
}

- (void)_moveNodeToFront:(id)a3
{
  id v6 = a3;
  id v4 = [(MSVLRUDictionary *)self head];
  id v5 = [v4 next];

  if (v5 != v6)
  {
    [(MSVLRUDictionary *)self _removeNodeFromLinkedList:v6];
    [(MSVLRUDictionary *)self _addNodeToFront:v6];
  }
}

- (MSVLRUDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  if (!a3)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"MSVLRUDictionary.m", 58, @"Invalid parameter not satisfying: %@", @"maximumCapacity > 0" object file lineNumber description];
  }
  v15.receiver = self;
  v15.super_class = (Class)MSVLRUDictionary;
  id v5 = [(MSVLRUDictionary *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:a3];
    dictionary = v5->_dictionary;
    v5->_dictionary = (NSMutableDictionary *)v6;

    v5->_maximumCapacity = a3;
    id v8 = [[MSVLRUDictionaryNode alloc] initWithKey:0 object:0];
    head = v5->_head;
    v5->_head = v8;

    v10 = [[MSVLRUDictionaryNode alloc] initWithKey:0 object:0];
    tail = v5->_tail;
    v5->_tail = v10;

    [(MSVLRUDictionaryNode *)v5->_head setNext:v5->_tail];
    [(MSVLRUDictionaryNode *)v5->_tail setPrev:v5->_head];
    v5->_transactionCount = 0;
  }
  return v5;
}

- (void)endTransaction
{
  int64_t transactionCount = self->_transactionCount;
  BOOL v3 = transactionCount < 1;
  int64_t v4 = transactionCount - 1;
  if (!v3)
  {
    self->_int64_t transactionCount = v4;
    [(MSVLRUDictionary *)self _shrinkToCapacity];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void)performTransaction:(id)a3
{
  int64_t v4 = (void (**)(void))a3;
  [(MSVLRUDictionary *)self beginTransaction];
  v4[2](v4);

  [(MSVLRUDictionary *)self endTransaction];
}

- (void)beginTransaction
{
}

- (void)setMaximumCapacity:(int64_t)a3
{
  if (a3 < 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2, self, @"MSVLRUDictionary.m", 107, @"Invalid parameter not satisfying: %@", @"maximumCapacity >= 0" object file lineNumber description];
  }
  self->_maximumCapacity = a3;
  [(MSVLRUDictionary *)self _shrinkToCapacity];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tail, 0);
  objc_storeStrong((id *)&self->_head, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setTransactionCount:(int64_t)a3
{
  self->_int64_t transactionCount = a3;
}

- (int64_t)transactionCount
{
  return self->_transactionCount;
}

- (void)setTail:(id)a3
{
}

- (MSVLRUDictionaryNode)tail
{
  return self->_tail;
}

- (void)setHead:(id)a3
{
}

- (void)setDictionary:(id)a3
{
}

- (MSVLRUDictionaryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (MSVLRUDictionaryDelegate *)WeakRetained;
}

- (void)_removeNode:(id)a3
{
  id v9 = a3;
  -[MSVLRUDictionary _removeNodeFromLinkedList:](self, "_removeNodeFromLinkedList:");
  int64_t v4 = [(MSVLRUDictionary *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [v9 object];
    uint64_t v6 = [v9 key];
    [v4 dictionary:self willRemoveObject:v5 forKey:v6];
  }
  id v7 = [(MSVLRUDictionary *)self dictionary];
  id v8 = [v9 key];
  [v7 removeObjectForKey:v8];
}

- (id)description
{
  BOOL v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p>{\n", objc_opt_class(), self];
  int64_t v4 = [(MSVLRUDictionary *)self head];
  id v5 = [v4 next];

  if (v5 == self->_tail)
  {
    id v8 = v5;
  }
  else
  {
    do
    {
      uint64_t v6 = [(MSVLRUDictionaryNode *)v5 key];
      id v7 = [(MSVLRUDictionaryNode *)v5 object];
      [v3 appendFormat:@"\t%@ = %@;\n", v6, v7];

      id v8 = [(MSVLRUDictionaryNode *)v5 next];

      id v5 = v8;
    }
    while (v8 != self->_tail);
  }
  [v3 appendString:@"}\n"];

  return v3;
}

- (unint64_t)hash
{
  return [(NSMutableDictionary *)self->_dictionary hash];
}

- (BOOL)isEqual:(id)a3
{
  int64_t v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    char v5 = [(NSMutableDictionary *)self->_dictionary isEqual:v4[3]];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  int64_t v4 = [[MSVLRUDictionary alloc] initWithMaximumCapacity:[(MSVLRUDictionary *)self maximumCapacity]];
  uint64_t v5 = [(NSMutableDictionary *)self->_dictionary mutableCopy];
  dictionary = v4->_dictionary;
  v4->_dictionary = (NSMutableDictionary *)v5;

  uint64_t v7 = [(MSVLRUDictionaryNode *)self->_head copy];
  head = v4->_head;
  v4->_head = (MSVLRUDictionaryNode *)v7;

  uint64_t v9 = [(MSVLRUDictionaryNode *)self->_tail copy];
  tail = v4->_tail;
  v4->_tail = (MSVLRUDictionaryNode *)v9;

  return v4;
}

- (void)enumerateKeysAndObjectsUsingBlock:(id)a3
{
  int64_t v4 = (void (**)(id, void *, void *, unsigned char *))a3;
  char v11 = 0;
  uint64_t v5 = [(MSVLRUDictionary *)self head];
  uint64_t v6 = [v5 next];

  while (1)
  {
    uint64_t v7 = [(MSVLRUDictionary *)self tail];

    if (v6 == v7) {
      break;
    }
    id v8 = [v6 key];
    uint64_t v9 = [v6 object];
    v4[2](v4, v8, v9, &v11);

    v10 = [v6 next];

    uint64_t v6 = v10;
    if (v11) {
      goto LABEL_6;
    }
  }
  v10 = v6;
LABEL_6:
}

- (void)removeAllObjects
{
  BOOL v3 = [(MSVLRUDictionary *)self dictionary];
  [v3 removeAllObjects];

  int64_t v4 = [(MSVLRUDictionary *)self tail];
  uint64_t v5 = [(MSVLRUDictionary *)self head];
  [v5 setNext:v4];

  id v7 = [(MSVLRUDictionary *)self head];
  uint64_t v6 = [(MSVLRUDictionary *)self tail];
  [v6 setPrev:v7];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MSVLRUDictionary *)self dictionary];
  id v7 = [v5 objectForKeyedSubscript:v4];

  uint64_t v6 = v7;
  if (v7)
  {
    [(MSVLRUDictionary *)self _removeNode:v7];
    uint64_t v6 = v7;
  }
}

- (id)peekObjectForKey:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"MSVLRUDictionary.m", 127, @"Invalid parameter not satisfying: %@", @"key != nil" object file lineNumber description];
  }
  uint64_t v6 = [(MSVLRUDictionary *)self dictionary];
  id v7 = [v6 objectForKeyedSubscript:v5];
  id v8 = [v7 object];

  return v8;
}

- (id)allValues
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[NSMutableDictionary count](self->_dictionary, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(NSMutableDictionary *)self->_dictionary allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) object];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)allKeys
{
  return (id)[(NSMutableDictionary *)self->_dictionary allKeys];
}

@end