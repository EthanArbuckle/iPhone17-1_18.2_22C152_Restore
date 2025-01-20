@interface TILRUDictionary
+ (id)dictionaryWithMaximumCapacity:(unint64_t)a3;
- (TILRUDictionary)initWithMaximumCapacity:(unint64_t)a3;
- (id)allKeys;
- (id)allKeysInLRUOrder;
- (id)allValuesInLRUOrder;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)objectForKeyWithoutAffectingLRU:(id)a3;
- (unint64_t)count;
- (unint64_t)linkedListCount;
- (void)_addNodeToFront:(id)a3;
- (void)_moveNodeToFront:(id)a3;
- (void)_removeNode:(id)a3;
- (void)_removeNodeFromLinkedList:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation TILRUDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tail, 0);

  objc_storeStrong((id *)&self->_head, 0);
}

- (void)removeAllObjects
{
  self->_tail->prev = self->_head;
}

- (void)removeObjectForKey:(id)a3
{
  uint64_t v4 = CFDictionaryGetValue(self->_dictionary, a3);
  if (v4) {
    [(TILRUDictionary *)self _removeNode:v4];
  }

  MEMORY[0x1F41817F8]();
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id key = a4;
  dictionary = self->_dictionary;
  id v7 = a3;
  uint64_t v8 = CFDictionaryGetValue(dictionary, key);
  if (v8)
  {
    v9 = (TILRUDictionaryNode *)v8;
    [(TILRUDictionary *)self _moveNodeToFront:v8];
    [(TILRUDictionaryNode *)v9 setObject:v7];
  }
  else
  {
    if (CFDictionaryGetCount(self->_dictionary) == self->_maxCount) {
      [(TILRUDictionary *)self _removeNode:self->_tail->prev];
    }
    v10 = (const void *)[key copyWithZone:0];
    v9 = [[TILRUDictionaryNode alloc] initWithKey:v10 object:v7];

    CFDictionaryAddValue(self->_dictionary, v10, v9);
    [(TILRUDictionary *)self _addNodeToFront:v9];
    id v7 = (id)v10;
  }
}

- (id)objectForKey:(id)a3
{
  uint64_t v4 = CFDictionaryGetValue(self->_dictionary, a3);
  if (v4)
  {
    [(TILRUDictionary *)self _moveNodeToFront:v4];
    v5 = [v4 object];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)allKeys
{
  return (id)[(__CFDictionary *)self->_dictionary allKeys];
}

- (unint64_t)count
{
  return CFDictionaryGetCount(self->_dictionary);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@ %p>{\n", objc_opt_class(), self];
  uint64_t v4 = self->_head->next;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self->_tail)
  {
    uint64_t v8 = v4;
  }
  else
  {
    do
    {
      v6 = [p_isa key];
      id v7 = [p_isa object];
      [v3 appendFormat:@"\t%@ = %@;\n", v6, v7];

      uint64_t v8 = (TILRUDictionaryNode *)p_isa[3];
      p_isa = (id *)&v8->super.isa;
    }
    while (v8 != self->_tail);
  }
  [v3 appendString:@"}\n"];

  return v3;
}

- (void)dealloc
{
  CFRelease(self->_dictionary);
  v3.receiver = self;
  v3.super_class = (Class)TILRUDictionary;
  [(TILRUDictionary *)&v3 dealloc];
}

- (TILRUDictionary)initWithMaximumCapacity:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)TILRUDictionary;
  uint64_t v4 = [(TILRUDictionary *)&v10 init];
  if (v4)
  {
    v4->_dictionary = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], a3, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    v4->_maxCount = a3;
    v5 = [[TILRUDictionaryNode alloc] initWithKey:0 object:0];
    head = v4->_head;
    v4->_head = v5;

    id v7 = [[TILRUDictionaryNode alloc] initWithKey:0 object:0];
    tail = v4->_tail;
    v4->_tail = v7;

    objc_storeStrong((id *)&v4->_head->next, v4->_tail);
    v4->_tail->prev = v4->_head;
  }
  return v4;
}

+ (id)dictionaryWithMaximumCapacity:(unint64_t)a3
{
  objc_super v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithMaximumCapacity:a3];

  return v3;
}

- (void)_addNodeToFront:(id)a3
{
  uint64_t v4 = (TILRUDictionaryNode *)a3;
  v5 = self->_head->next;
  head = self->_head;
  next = head->next;
  head->next = v4;
  v11 = v4;

  uint64_t v8 = self->_head;
  v9 = v11->next;
  v11->next = v5;
  v11->prev = v8;
  objc_super v10 = v5;

  v10->prev = v11;
}

- (void)_moveNodeToFront:(id)a3
{
  if (self->_head->next != a3)
  {
    id v4 = a3;
    [(TILRUDictionary *)self _removeNodeFromLinkedList:v4];
    [(TILRUDictionary *)self _addNodeToFront:v4];
  }
}

- (void)_removeNode:(id)a3
{
  id v4 = a3;
  [(TILRUDictionary *)self _removeNodeFromLinkedList:v4];
  dictionary = self->_dictionary;
  v6 = (const void *)[v4 key];

  CFDictionaryRemoveValue(dictionary, v6);
}

- (void)_removeNodeFromLinkedList:(id)a3
{
  id v4 = (void *)*((void *)a3 + 4);
  id v5 = *((id *)a3 + 3);
  v6 = (void *)v4[3];
  v4[3] = v5;
  id v7 = v5;
  uint64_t v8 = v4;
  id v9 = a3;

  v7[4] = v8;
}

- (id)objectForKeyWithoutAffectingLRU:(id)a3
{
  Value = (void *)CFDictionaryGetValue(self->_dictionary, a3);

  return (id)[Value object];
}

- (id)allValuesInLRUOrder
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = self->_head->next;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self->_tail)
  {
    id v7 = v4;
  }
  else
  {
    do
    {
      v6 = [p_isa object];
      [v3 addObject:v6];

      id v7 = (TILRUDictionaryNode *)p_isa[3];
      p_isa = (id *)&v7->super.isa;
    }
    while (v7 != self->_tail);
  }

  return v3;
}

- (id)allKeysInLRUOrder
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  id v4 = self->_head->next;
  p_isa = (id *)&v4->super.isa;
  if (v4 == self->_tail)
  {
    id v7 = v4;
  }
  else
  {
    do
    {
      v6 = [p_isa key];
      [v3 addObject:v6];

      id v7 = (TILRUDictionaryNode *)p_isa[3];
      p_isa = (id *)&v7->super.isa;
    }
    while (v7 != self->_tail);
  }

  return v3;
}

- (unint64_t)linkedListCount
{
  objc_super v3 = self->_head->next;
  id v4 = v3;
  if (v3 == self->_tail)
  {
    unint64_t v5 = 0;
  }
  else
  {
    unint64_t v5 = 0;
    p_isa = (id *)&v3->super.isa;
    do
    {
      ++v5;
      id v4 = (TILRUDictionaryNode *)p_isa[3];

      p_isa = (id *)&v4->super.isa;
    }
    while (v4 != self->_tail);
  }

  return v5;
}

@end