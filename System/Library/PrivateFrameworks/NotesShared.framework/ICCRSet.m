@interface ICCRSet
- (BOOL)containsObject:(id)a3;
- (BOOL)isEqual:(id)a3;
- (ICCRDictionary)dictionary;
- (ICCRDocument)document;
- (ICCRSet)init;
- (ICCRSet)initWithDocument:(id)a3;
- (ICCRSet)initWithICCRCoder:(id)a3;
- (ICCRSet)initWithICCRCoder:(id)a3 set:(const void *)a4;
- (ICCRSet)initWithICCRCoder:(id)a3 set:(const void *)a4 elementValueDecoder:(id)a5;
- (NSArray)allObjects;
- (NSHashTable)observers;
- (NSString)description;
- (id)anyObject;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)member:(id)a3;
- (unint64_t)count;
- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5;
- (unint64_t)hash;
- (void)addObject:(id)a3;
- (void)addObserver:(id)a3;
- (void)encodeWithICCRCoder:(id)a3;
- (void)encodeWithICCRCoder:(id)a3 set:(void *)a4;
- (void)encodeWithICCRCoder:(id)a3 set:(void *)a4 elementValueCoder:(id)a5;
- (void)mergeWith:(id)a3;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setObject:(id)a3;
- (void)setObservers:(id)a3;
- (void)walkGraph:(id)a3;
@end

@implementation ICCRSet

- (unint64_t)count
{
  v2 = [(ICCRSet *)self dictionary];
  unint64_t v3 = [v2 count];

  return v3;
}

- (ICCRDictionary)dictionary
{
  return self->_dictionary;
}

- (ICCRSet)init
{
  return [(ICCRSet *)self initWithDocument:0];
}

- (ICCRSet)initWithDocument:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ICCRSet;
  v5 = [(ICCRSet *)&v11 init];
  if (v5)
  {
    v6 = [[ICCRDictionary alloc] initWithDocument:v4];
    dictionary = v5->_dictionary;
    v5->_dictionary = v6;

    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v8;
  }
  return v5;
}

- (void)walkGraph:(id)a3
{
  v5 = (void (**)(id, void *))a3;
  id v4 = [(ICCRSet *)self dictionary];
  v5[2](v5, v4);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  uint64_t v8 = [(ICCRSet *)self dictionary];
  unint64_t v9 = [v8 countByEnumeratingWithState:a3 objects:a4 count:a5];

  return v9;
}

- (void)encodeWithICCRCoder:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [v8 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 4)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 4;
    operator new();
  }
  uint64_t v6 = *(void *)(v4 + 40);
  v7 = [(ICCRSet *)self dictionary];
  [v7 encodeWithICCRCoder:v8 dictionary:v6 elementValueCoder:&__block_literal_global_55];
}

void __31__ICCRSet_encodeWithICCRCoder___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, void *a5)
{
  id v11 = a2;
  id v8 = a3;
  id v9 = a5;
  if (v8 && [v8 conformsToProtocol:&unk_1F1F737E0])
  {
    *(_DWORD *)(a4 + 32) |= 2u;
    uint64_t v10 = *(void *)(a4 + 48);
    if (!v10) {
      operator new();
    }
    [v9 encodeObject:v8 forObjectID:v10];
  }
}

- (void)encodeWithICCRCoder:(id)a3 set:(void *)a4
{
  id v7 = a3;
  uint64_t v6 = [(ICCRSet *)self dictionary];
  [v6 encodeWithICCRCoder:v7 dictionary:a4];
}

- (void)encodeWithICCRCoder:(id)a3 set:(void *)a4 elementValueCoder:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [(ICCRSet *)self dictionary];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__ICCRSet_encodeWithICCRCoder_set_elementValueCoder___block_invoke;
  v12[3] = &unk_1E64A8BF8;
  id v11 = v9;
  id v13 = v11;
  [v10 encodeWithICCRCoder:v8 dictionary:a4 elementValueCoder:v12];
}

uint64_t __53__ICCRSet_encodeWithICCRCoder_set_elementValueCoder___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (ICCRSet)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 4)
  {
    uint64_t v6 = [(ICCRSet *)self initWithICCRCoder:v4 set:*(void *)(v5 + 40)];
  }
  else
  {
    id v7 = [v4 document];
    uint64_t v6 = [(ICCRSet *)self initWithDocument:v7];
  }
  return v6;
}

- (ICCRSet)initWithICCRCoder:(id)a3 set:(const void *)a4
{
  id v6 = a3;
  id v7 = [v6 document];
  id v8 = [(ICCRSet *)self initWithDocument:v7];

  if (v8)
  {
    id v9 = [[ICCRDictionary alloc] initWithICCRCoder:v6 dictionary:a4 elementValueDecoder:&__block_literal_global_64_0];
    [(ICCRSet *)v8 setDictionary:v9];
  }
  return v8;
}

id __33__ICCRSet_initWithICCRCoder_set___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a4;
  id v7 = v6;
  if ((*(unsigned char *)(a2 + 32) & 2) != 0)
  {
    uint64_t v9 = *(void *)(a2 + 48);
    if (!v9) {
      uint64_t v9 = *(void *)(CRDT::Dictionary_Element::default_instance(v6) + 48);
    }
    id v8 = [(CRDT::Dictionary_Element *)v7 decodeObjectForProtobufObjectID:v9];
  }
  else
  {
    id v8 = 0;
  }
  id v10 = v8;
  *a3 = v10;

  return v10;
}

- (ICCRSet)initWithICCRCoder:(id)a3 set:(const void *)a4 elementValueDecoder:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 document];
  id v11 = [(ICCRSet *)self initWithDocument:v10];

  if (v11)
  {
    v12 = [ICCRDictionary alloc];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __53__ICCRSet_initWithICCRCoder_set_elementValueDecoder___block_invoke;
    v15[3] = &unk_1E64A8C20;
    id v16 = v9;
    id v13 = [(ICCRDictionary *)v12 initWithICCRCoder:v8 dictionary:a4 elementValueDecoder:v15];
    [(ICCRSet *)v11 setDictionary:v13];
  }
  return v11;
}

id __53__ICCRSet_initWithICCRCoder_set_elementValueDecoder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v4 = objc_claimAutoreleasedReturnValue();
  *a3 = v4;
  return v4;
}

- (id)member:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRSet *)self dictionary];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRSet *)self dictionary];
  id v6 = [v5 objectForKey:v4];
  BOOL v7 = v6 != 0;

  return v7;
}

- (NSArray)allObjects
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", -[ICCRSet count](self, "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = [(ICCRSet *)self dictionary];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        [v3 addObject:*(void *)(*((void *)&v9 + 1) + 8 * i)];
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  return (NSArray *)v3;
}

- (id)anyObject
{
  v2 = [(ICCRSet *)self dictionary];
  unint64_t v3 = [v2 keyEnumerator];
  id v4 = [v3 nextObject];

  return v4;
}

- (void)addObserver:(id)a3
{
  id v5 = a3;
  id v4 = [(ICCRSet *)self observers];
  [v4 addObject:v5];
}

- (void)removeObserver:(id)a3
{
  id v5 = a3;
  id v4 = [(ICCRSet *)self observers];
  [v4 removeObject:v5];
}

- (void)addObject:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ICCRSet *)self dictionary];
  [v5 setObject:v4 forKey:v4];

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v6 = [(ICCRSet *)self observers];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setUpdated:self];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)removeObject:(id)a3
{
  id v5 = a3;
  id v4 = [(ICCRSet *)self dictionary];
  [v4 removeObjectForKey:v5];
}

- (void)removeAllObjects
{
  id v2 = [(ICCRSet *)self dictionary];
  [v2 removeAllObjects];
}

- (void)setObject:(id)a3
{
  id v4 = a3;
  [(ICCRSet *)self removeAllObjects];
  if (v4) {
    [(ICCRSet *)self addObject:v4];
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(ICCRSet *)self dictionary];
    uint64_t v6 = [v4 dictionary];
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
  id v2 = [(ICCRSet *)self dictionary];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (void)mergeWith:(id)a3
{
  id v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8], @"Invalid merge, classes must be equal for merge.", 0 reason userInfo];
    objc_exception_throw(v6);
  }
  id v4 = [(ICCRSet *)self dictionary];
  id v5 = [v7 dictionary];
  [v4 mergeWith:v5];
}

- (ICCRDocument)document
{
  id v2 = [(ICCRSet *)self dictionary];
  unint64_t v3 = [v2 document];

  return (ICCRDocument *)v3;
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICCRSet *)self dictionary];
  uint64_t v9 = [v8 deltaSince:v6 in:v7];

  if (v9)
  {
    long long v10 = [[ICCRSet alloc] initWithDocument:v7];
    [(ICCRSet *)v10 setDictionary:v9];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (NSString)description
{
  if ([(ICCRSet *)self count])
  {
    unint64_t v3 = (void *)MEMORY[0x1E4F28E78];
    id v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    id v6 = objc_msgSend(v3, "stringWithFormat:", @"<%@ %p (\n"), v5, self;

    id v7 = [(ICCRSet *)self dictionary];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __22__ICCRSet_description__block_invoke;
    v13[3] = &unk_1E64A8C48;
    id v8 = v6;
    id v14 = v8;
    [v7 enumerateKeysObjectsAndTimestampsUsingBlock:v13];

    [v8 replaceCharactersInRange:objc_msgSend(v8, "length") - 2, 2, @">" withString]);
  }
  else
  {
    uint64_t v9 = NSString;
    long long v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    id v8 = [v9 stringWithFormat:@"<%@ %p>", v11, self];
  }
  return (NSString *)v8;
}

void __22__ICCRSet_description__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v8 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [a4 shortDescription];
  [v6 appendFormat:@"  %@ %@,\n", v7, v8];
}

- (void)setDictionary:(id)a3
{
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dictionary, 0);
}

@end