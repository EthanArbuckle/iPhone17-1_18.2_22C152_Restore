@interface ICCROrderedSet
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICCRDocument)document;
- (ICCROrderedSet)init;
- (ICCROrderedSet)initWithICCRCoder:(id)a3;
- (ICCRSet)contents;
- (NSArray)allObjects;
- (NSMutableArray)orderedArray;
- (NSString)description;
- (id)_indexForIndex:(unint64_t)a3;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)indexOfObject:(id)a3;
- (void)_sort;
- (void)addObject:(id)a3;
- (void)addObjectsFromArray:(id)a3;
- (void)encodeWithICCRCoder:(id)a3;
- (void)enumerateWithBlock:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)mergeWith:(id)a3;
- (void)mergeWithSet:(id)a3;
- (void)moveObject:(id)a3 toIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)setContents:(id)a3;
- (void)setDocument:(id)a3;
- (void)setObject:(id)a3 atIndex:(unint64_t)a4;
- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4;
- (void)setOrderedArray:(id)a3;
- (void)walkGraph:(id)a3;
@end

@implementation ICCROrderedSet

- (unint64_t)count
{
  v2 = [(ICCROrderedSet *)self contents];
  unint64_t v3 = [v2 count];

  return v3;
}

- (ICCRSet)contents
{
  return self->_contents;
}

- (ICCROrderedSet)init
{
  v8.receiver = self;
  v8.super_class = (Class)ICCROrderedSet;
  v2 = [(ICCROrderedSet *)&v8 init];
  if (v2)
  {
    unint64_t v3 = objc_alloc_init(ICCRSet);
    contents = v2->_contents;
    v2->_contents = v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    orderedArray = v2->_orderedArray;
    v2->_orderedArray = v5;
  }
  return v2;
}

- (void)walkGraph:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  v4 = [(ICCROrderedSet *)self contents];
  v5[2](v5, v4);
}

- (void)setDocument:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(ICCROrderedSet *)self contents];
  [v5 setDocument:v4];

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(ICCROrderedSet *)self contents];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = [*(id *)(*((void *)&v11 + 1) + 8 * v9) index];
        [v10 setDocument:v4];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 5)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 5;
    operator new();
  }
  uint64_t v6 = *(void *)(v4 + 40);
  uint64_t v7 = [(ICCROrderedSet *)self contents];
  [v7 encodeWithICCRCoder:v8 set:v6 elementValueCoder:&__block_literal_global_67];
}

uint64_t __38__ICCROrderedSet_encodeWithICCRCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeIntoProtobufSetElement:coder:");
}

- (ICCROrderedSet)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCROrderedSet *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 currentDocumentObjectForDecoding];
    if (*(_DWORD *)(v6 + 48) == 5)
    {
      uint64_t v7 = [ICCRSet alloc];
      id v8 = v7;
      if (*(_DWORD *)(v6 + 48) == 5) {
        uint64_t v9 = *(void *)(v6 + 40);
      }
      else {
        uint64_t v9 = CRDT::Dictionary::default_instance((CRDT::Dictionary *)v7);
      }
      uint64_t v10 = [(ICCRSet *)v8 initWithICCRCoder:v4 set:v9 elementValueDecoder:&__block_literal_global_4_0];
      contents = v5->_contents;
      v5->_contents = (ICCRSet *)v10;

      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __36__ICCROrderedSet_initWithICCRCoder___block_invoke_2;
      v13[3] = &unk_1E64A9858;
      long long v14 = v5;
      [v4 addDecoderCompletionHandler:v13 dependency:0 for:v14];
    }
  }

  return v5;
}

ICCROrderedSetElement *__36__ICCROrderedSet_initWithICCRCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [[ICCROrderedSetElement alloc] initWithProtobufSetElement:a2 decoder:v4];

  return v5;
}

uint64_t __36__ICCROrderedSet_initWithICCRCoder___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  uint64_t v3 = [v2 mutableCopy];
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v3;

  uint64_t v6 = *(void **)(a1 + 32);
  return [v6 _sort];
}

- (ICCRDocument)document
{
  v2 = [(ICCROrderedSet *)self contents];
  uint64_t v3 = [v2 document];

  return (ICCRDocument *)v3;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCROrderedSet *)self contents];
  uint64_t v6 = +[ICCROrderedSetElement temporaryElementWithValue:v4];
  char v7 = [v5 containsObject:v6];

  return v7;
}

- (id)objectAtIndex:(unint64_t)a3
{
  id v4 = [(ICCROrderedSet *)self orderedArray];
  uint64_t v5 = [v4 objectAtIndex:a3];

  uint64_t v6 = [v5 value];

  return v6;
}

- (NSArray)allObjects
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[ICCROrderedSet count](self, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(ICCROrderedSet *)self orderedArray];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = [*(id *)(*((void *)&v10 + 1) + 8 * i) value];
        [v3 addObject:v8];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCROrderedSet *)self orderedArray];
  uint64_t v6 = +[ICCROrderedSetElement temporaryElementWithValue:v4];
  unint64_t v7 = [v5 indexOfObject:v6];

  return v7;
}

- (void)_sort
{
  id v2 = [(ICCROrderedSet *)self orderedArray];
  [v2 sortUsingComparator:&__block_literal_global_9];
}

uint64_t __23__ICCROrderedSet__sort__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = [a2 index];
  uint64_t v6 = [v5 contents];
  unint64_t v7 = [v4 index];
  id v8 = [v7 contents];
  uint64_t v9 = [v6 compare:v8];

  return v9;
}

- (id)_indexForIndex:(unint64_t)a3
{
  if (a3)
  {
    uint64_t v5 = [(ICCROrderedSet *)self orderedArray];
    unint64_t v6 = [v5 count];

    [(ICCROrderedSet *)self orderedArray];
    if (v6 <= a3) {
      uint64_t v9 = {;
    }
      id v8 = [v9 lastObject];
      long long v10 = 0;
    }
    else {
      unint64_t v7 = {;
    }
      id v8 = [v7 objectAtIndex:a3 - 1];

      uint64_t v9 = [(ICCROrderedSet *)self orderedArray];
      long long v10 = [v9 objectAtIndex:a3];
    }
  }
  else
  {
    uint64_t v9 = [(ICCROrderedSet *)self orderedArray];
    long long v10 = [v9 firstObject];
    id v8 = 0;
  }

  long long v11 = objc_msgSend(MEMORY[0x1E4F29128], "CR_unserialized");
  long long v12 = [v8 index];
  long long v13 = [v12 contents];
  long long v14 = [v10 index];
  uint64_t v15 = [v14 contents];
  uint64_t v16 = +[ICCRIndex indexForReplica:v11 betweenIndex:v13 andIndex:v15];

  return v16;
}

- (void)moveObject:(id)a3 toIndex:(unint64_t)a4
{
  id v13 = a3;
  unint64_t v6 = [(ICCROrderedSet *)self contents];
  unint64_t v7 = +[ICCROrderedSetElement temporaryElementWithValue:v13];
  id v8 = [v6 member:v7];

  if (v8)
  {
    uint64_t v9 = [(ICCROrderedSet *)self orderedArray];
    [v9 removeObject:v8];

    long long v10 = [(ICCROrderedSet *)self _indexForIndex:a4];
    long long v11 = [(ICCROrderedSet *)self orderedArray];
    [v11 insertObject:v8 atIndex:a4];

    long long v12 = [v8 index];
    [v12 setContents:v10];
  }
}

- (void)setObject:(id)a3 atIndex:(unint64_t)a4
{
  id v9 = a3;
  if (v9)
  {
    unint64_t v6 = [(ICCROrderedSet *)self contents];
    unint64_t v7 = +[ICCROrderedSetElement temporaryElementWithValue:v9];
    char v8 = [v6 containsObject:v7];

    if ((v8 & 1) == 0)
    {
      if ([(ICCROrderedSet *)self count] > a4) {
        [(ICCROrderedSet *)self removeObjectAtIndex:a4];
      }
      [(ICCROrderedSet *)self insertObject:v9 atIndex:a4];
    }
  }
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v16 = a3;
  if (v16)
  {
    unint64_t v6 = [(ICCROrderedSet *)self contents];
    unint64_t v7 = +[ICCROrderedSetElement temporaryElementWithValue:v16];
    char v8 = [v6 containsObject:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = objc_alloc_init(ICCROrderedSetElement);
      [(ICCROrderedSetElement *)v9 setValue:v16];
      long long v10 = [ICCRRegisterLatest alloc];
      long long v11 = [(ICCROrderedSet *)self _indexForIndex:a4];
      long long v12 = [(ICCROrderedSet *)self document];
      id v13 = [(ICCRRegisterLatest *)v10 initWithContents:v11 document:v12];
      [(ICCROrderedSetElement *)v9 setIndex:v13];

      long long v14 = [(ICCROrderedSet *)self contents];
      [v14 addObject:v9];

      uint64_t v15 = [(ICCROrderedSet *)self orderedArray];
      [v15 addObject:v9];

      [(ICCROrderedSet *)self _sort];
    }
  }
}

- (void)removeObject:(id)a3
{
  id v6 = +[ICCROrderedSetElement temporaryElementWithValue:a3];
  id v4 = [(ICCROrderedSet *)self contents];
  [v4 removeObject:v6];

  uint64_t v5 = [(ICCROrderedSet *)self orderedArray];
  [v5 removeObject:v6];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v8 = [(ICCROrderedSet *)self orderedArray];
  unint64_t v5 = [v8 count];

  if (v5 > a3)
  {
    id v9 = [(ICCROrderedSet *)self contents];
    id v6 = [(ICCROrderedSet *)self orderedArray];
    unint64_t v7 = [v6 objectAtIndex:a3];
    [v9 removeObject:v7];

    id v10 = [(ICCROrderedSet *)self orderedArray];
    [v10 removeObjectAtIndex:a3];
  }
}

- (void)removeAllObjects
{
  id v3 = [(ICCROrderedSet *)self contents];
  [v3 removeAllObjects];

  id v4 = [(ICCROrderedSet *)self orderedArray];
  [v4 removeAllObjects];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(ICCROrderedSet *)self contents];
    id v6 = [v4 contents];
    char v7 = [v5 isEqual:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  id v2 = [(ICCROrderedSet *)self contents];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)mergeWith:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid merge, classes must be equal for merge.", 0 reason userInfo];
    objc_exception_throw(v4);
  }
  [(ICCROrderedSet *)self mergeWithSet:v5];
}

- (void)mergeWithSet:(id)a3
{
  id v9 = a3;
  id v4 = [(ICCROrderedSet *)self contents];
  id v5 = [v9 contents];
  [v4 mergeWith:v5];

  id v6 = [(ICCROrderedSet *)self contents];
  char v7 = [v6 allObjects];
  id v8 = (void *)[v7 mutableCopy];
  [(ICCROrderedSet *)self setOrderedArray:v8];

  [(ICCROrderedSet *)self _sort];
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(ICCROrderedSet);
  [(ICCROrderedSet *)v8 setDocument:v7];
  objc_opt_class();
  id v9 = [(ICCROrderedSet *)self contents];
  id v10 = [v9 deltaSince:v6 in:v7];
  long long v11 = ICCheckedDynamicCast();
  [(ICCROrderedSet *)v8 setContents:v11];

  long long v12 = [(ICCROrderedSet *)v8 contents];
  id v13 = [v12 allObjects];
  long long v14 = (void *)[v13 mutableCopy];
  [(ICCROrderedSet *)v8 setOrderedArray:v14];

  [(ICCROrderedSet *)v8 _sort];
  return v8;
}

- (void)enumerateWithBlock:(id)a3
{
  id v4 = (void (**)(id, void *, unint64_t, unsigned char *))a3;
  unint64_t v5 = 0;
  char v7 = 0;
  while (v5 < [(ICCROrderedSet *)self count] && !v7)
  {
    id v6 = [(ICCROrderedSet *)self objectAtIndex:v5];
    v4[2](v4, v6, v5, &v7);

    ++v5;
  }
}

- (void)addObjectsFromArray:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = a3;
  uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v18;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v18 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v17 + 1) + 8 * v6);
        id v8 = objc_alloc_init(ICCROrderedSetElement);
        id v9 = [(ICCROrderedSet *)self _indexForIndex:[(NSMutableArray *)self->_orderedArray count]];
        [(ICCROrderedSetElement *)v8 setValue:v7];
        id v10 = [ICCRRegisterLatest alloc];
        long long v11 = [(ICCROrderedSet *)self document];
        long long v12 = [(ICCRRegisterLatest *)v10 initWithContents:v9 document:v11];
        [(ICCROrderedSetElement *)v8 setIndex:v12];

        [(ICCRSet *)self->_contents addObject:v8];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v4);
  }

  id v13 = [(ICCRSet *)self->_contents allObjects];
  long long v14 = (NSMutableArray *)[v13 mutableCopy];
  orderedArray = self->_orderedArray;
  self->_orderedArray = v14;

  [(ICCROrderedSet *)self _sort];
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  [(ICCROrderedSet *)self insertObject:v4 atIndex:[(ICCROrderedSet *)self count]];
}

- (void)setObject:(id)a3 atIndexedSubscript:(unint64_t)a4
{
  id v6 = a3;
  if (v6) {
    [(ICCROrderedSet *)self setObject:v6 atIndex:a4];
  }
}

- (NSString)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = objc_msgSend(v3, "stringWithFormat:", @"<%@ %p (\n"), v5, self;

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(ICCROrderedSet *)self orderedArray];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = [v11 index];
        id v13 = [v11 value];
        [v6 appendFormat:@"  %@ %@,\n", v12, v13];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  [v6 replaceCharactersInRange:objc_msgSend(v6, "length") - 2, 2, @">" withString]);
  return (NSString *)v6;
}

- (void)setContents:(id)a3
{
}

- (NSMutableArray)orderedArray
{
  return self->_orderedArray;
}

- (void)setOrderedArray:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_orderedArray, 0);
  objc_storeStrong((id *)&self->_contents, 0);
}

@end