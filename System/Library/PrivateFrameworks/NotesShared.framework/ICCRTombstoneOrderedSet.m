@interface ICCRTombstoneOrderedSet
- (BOOL)containsObjectEqualTo:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)wantsUndoCommands;
- (ICCRArray)ordering;
- (ICCRDocument)document;
- (ICCRSet)elements;
- (ICCRTombstoneOrderedSet)init;
- (ICCRTombstoneOrderedSet)initWithDocument:(id)a3;
- (ICCRTombstoneOrderedSet)initWithICCRCoder:(id)a3;
- (ICCRTombstoneOrderedSet)initWithICCRCoder:(id)a3 orderedSet:(const void *)a4;
- (ICCRTombstoneOrderedSet)initWithOrdering:(id)a3 elements:(id)a4 document:(id)a5;
- (ICCRUndoDelegate)delegate;
- (NSMapTable)cachedIndexMapping;
- (NSMutableOrderedSet)cachedIdentifierSet;
- (NSString)description;
- (id)deltaSince:(id)a3 in:(id)a4;
- (id)generateNSOrderedIdentifierSetWithIndexMapping:(id)a3;
- (id)identifierForObjectInCachedSet:(id)a3;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectForIdentifier:(id)a3;
- (id)tombstone;
- (unint64_t)count;
- (unint64_t)hash;
- (unint64_t)indexOfEqualObject:(id)a3;
- (void)_removeObjectsFromOrderingAtIndices:(id)a3;
- (void)addObject:(id)a3;
- (void)addUndoCommandsForObject:(id)a3 block:(id)a4;
- (void)encodeWithICCRCoder:(id)a3;
- (void)encodeWithICCRCoder:(id)a3 orderedSet:(void *)a4;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)mergeWith:(id)a3;
- (void)moveClock;
- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 mutableSafe:(BOOL)a5;
- (void)realizeLocalChangesIn:(id)a3;
- (void)regenerateNSOrderedIdentifierSetAndIndexMapping;
- (void)reinsertIdentifier:(id)a3 withMaskedIdentifiers:(id)a4 atIndex:(unint64_t)a5 forObjectToMove:(id)a6;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)safeMoveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setDocument:(id)a3;
- (void)setElements:(id)a3;
- (void)setOrdering:(id)a3;
- (void)shiftCachedIndicesStartingAtIndex:(unint64_t)a3 by:(int64_t)a4;
- (void)undoablyInsertObjectIdentifiersIntoElements:(id)a3;
- (void)undoablyRemoveObjectIdentifiersFromElements:(id)a3;
- (void)walkGraph:(id)a3;
- (void)wipeoutCaches;
@end

@implementation ICCRTombstoneOrderedSet

- (void)encodeWithICCRCoder:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [v6 currentDocumentObjectForEncoding];
  uint64_t v5 = v4;
  if (*(_DWORD *)(v4 + 48) != 16)
  {
    CRDT::Document_DocObject::clear_contents(v4);
    *(_DWORD *)(v5 + 48) = 16;
    operator new();
  }
  [(ICCRTombstoneOrderedSet *)self encodeWithICCRCoder:v6 orderedSet:*(void *)(v4 + 40)];
}

- (void)encodeWithICCRCoder:(id)a3 orderedSet:(void *)a4
{
  id v10 = a3;
  id v6 = [(ICCRTombstoneOrderedSet *)self ordering];
  *((_DWORD *)a4 + 8) |= 1u;
  uint64_t v7 = *((void *)a4 + 5);
  if (!v7) {
    operator new();
  }
  [v6 encodeWithICCRCoder:v10 array:v7];

  v8 = [(ICCRTombstoneOrderedSet *)self elements];
  *((_DWORD *)a4 + 8) |= 2u;
  uint64_t v9 = *((void *)a4 + 6);
  if (!v9) {
    operator new();
  }
  [v8 encodeWithICCRCoder:v10 set:v9];
}

- (ICCRTombstoneOrderedSet)initWithICCRCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 currentDocumentObjectForDecoding];
  if (*(_DWORD *)(v5 + 48) == 16)
  {
    id v6 = [(ICCRTombstoneOrderedSet *)self initWithICCRCoder:v4 orderedSet:*(void *)(v5 + 40)];
  }
  else
  {
    uint64_t v7 = [v4 document];
    id v6 = [(ICCRTombstoneOrderedSet *)self initWithDocument:v7];
  }
  return v6;
}

- (ICCRTombstoneOrderedSet)initWithICCRCoder:(id)a3 orderedSet:(const void *)a4
{
  id v6 = a3;
  uint64_t v7 = [ICCRArray alloc];
  v8 = v7;
  uint64_t v9 = *((void *)a4 + 5);
  if (!v9) {
    uint64_t v9 = *(void *)(CRDT::OrderedSet::default_instance((CRDT::OrderedSet *)v7) + 40);
  }
  id v10 = [(ICCRArray *)v8 initWithICCRCoder:v6 array:v9];
  v11 = [ICCRSet alloc];
  v12 = v11;
  uint64_t v13 = *((void *)a4 + 6);
  if (!v13) {
    uint64_t v13 = *(void *)(CRDT::OrderedSet::default_instance((CRDT::OrderedSet *)v11) + 48);
  }
  v14 = [(ICCRSet *)v12 initWithICCRCoder:v6 set:v13];
  v15 = [v6 document];
  v16 = [(ICCRTombstoneOrderedSet *)self initWithOrdering:v10 elements:v14 document:v15];

  return v16;
}

- (unint64_t)count
{
  v2 = [(ICCRTombstoneOrderedSet *)self cachedIdentifierSet];
  unint64_t v3 = [v2 count];

  return v3;
}

- (ICCRTombstoneOrderedSet)init
{
  return 0;
}

- (ICCRTombstoneOrderedSet)initWithDocument:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[ICCRArray alloc] initWithDocument:v4];
  id v6 = [[ICCRSet alloc] initWithDocument:v4];
  uint64_t v7 = [(ICCRTombstoneOrderedSet *)self initWithOrdering:v5 elements:v6 document:v4];

  return v7;
}

- (ICCRTombstoneOrderedSet)initWithOrdering:(id)a3 elements:(id)a4 document:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v13.receiver = self;
  v13.super_class = (Class)ICCRTombstoneOrderedSet;
  v11 = [(ICCRTombstoneOrderedSet *)&v13 init];
  if (v11)
  {
    [v8 setDelegate:v11];
    [(ICCRTombstoneOrderedSet *)v11 setOrdering:v8];
    [(ICCRTombstoneOrderedSet *)v11 setElements:v9];
    [(ICCRTombstoneOrderedSet *)v11 setDocument:v10];
  }

  return v11;
}

- (NSMutableOrderedSet)cachedIdentifierSet
{
  cachedIdentifierSet = self->_cachedIdentifierSet;
  if (!cachedIdentifierSet)
  {
    [(ICCRTombstoneOrderedSet *)self regenerateNSOrderedIdentifierSetAndIndexMapping];
    cachedIdentifierSet = self->_cachedIdentifierSet;
  }
  return cachedIdentifierSet;
}

- (NSMapTable)cachedIndexMapping
{
  cachedIndexMapping = self->_cachedIndexMapping;
  if (!cachedIndexMapping)
  {
    [(ICCRTombstoneOrderedSet *)self regenerateNSOrderedIdentifierSetAndIndexMapping];
    cachedIndexMapping = self->_cachedIndexMapping;
  }
  return cachedIndexMapping;
}

- (void)regenerateNSOrderedIdentifierSetAndIndexMapping
{
  unint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  cachedIndexMapping = self->_cachedIndexMapping;
  self->_cachedIndexMapping = v3;

  uint64_t v5 = [(ICCRTombstoneOrderedSet *)self generateNSOrderedIdentifierSetWithIndexMapping:self->_cachedIndexMapping];
  cachedIdentifierSet = self->_cachedIdentifierSet;
  self->_cachedIdentifierSet = v5;
}

- (id)generateNSOrderedIdentifierSetWithIndexMapping:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v6 = [(ICCRTombstoneOrderedSet *)self elements];
  uint64_t v7 = [(ICCRTombstoneOrderedSet *)self ordering];
  id v8 = [v7 contents];

  id v9 = [(ICCRTombstoneOrderedSet *)self ordering];
  id v10 = [v9 array];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __74__ICCRTombstoneOrderedSet_generateNSOrderedIdentifierSetWithIndexMapping___block_invoke;
  v18[3] = &unk_1E64A98A0;
  id v19 = v6;
  id v20 = v8;
  id v21 = v4;
  id v11 = v5;
  id v22 = v11;
  id v12 = v4;
  id v13 = v8;
  id v14 = v6;
  [v10 enumerateObjectsUsingBlock:v18];

  v15 = v22;
  id v16 = v11;

  return v16;
}

void __74__ICCRTombstoneOrderedSet_generateNSOrderedIdentifierSetWithIndexMapping___block_invoke(id *a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  if (objc_msgSend(a1[4], "containsObject:"))
  {
    uint64_t v5 = [a1[5] objectForKeyedSubscript:v8];
    id v6 = [a1[6] objectForKey:v5];
    if (v6)
    {
      uint64_t v7 = v6;
      [v6 addIndex:a3];
    }
    else
    {
      [a1[7] addObject:v8];
      uint64_t v7 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a3];
      [a1[6] setObject:v7 forKey:v5];
    }
  }
}

- (void)wipeoutCaches
{
  cachedIndexMapping = self->_cachedIndexMapping;
  self->_cachedIndexMapping = 0;

  cachedIdentifierSet = self->_cachedIdentifierSet;
  self->_cachedIdentifierSet = 0;
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v5 = [(ICCRTombstoneOrderedSet *)self cachedIdentifierSet];
  id v6 = [v5 objectAtIndex:a3];

  uint64_t v7 = [(ICCRTombstoneOrderedSet *)self objectForIdentifier:v6];

  return v7;
}

- (id)objectForIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRTombstoneOrderedSet *)self ordering];
  id v6 = [v5 contents];
  uint64_t v7 = [v6 objectForKeyedSubscript:v4];

  return v7;
}

- (unint64_t)indexOfEqualObject:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRTombstoneOrderedSet *)self cachedIndexMapping];
  id v6 = [v5 objectForKey:v4];

  if (v6 && [v6 count])
  {
    uint64_t v7 = [v6 firstIndex];
    id v8 = [(ICCRTombstoneOrderedSet *)self ordering];
    id v9 = [v8 array];
    id v10 = [v9 objectAtIndexedSubscript:v7];

    id v11 = [(ICCRTombstoneOrderedSet *)self cachedIdentifierSet];
    unint64_t v12 = [v11 indexOfObject:v10];
  }
  else
  {
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v12;
}

- (id)identifierForObjectInCachedSet:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRTombstoneOrderedSet *)self cachedIndexMapping];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    uint64_t v7 = [(ICCRTombstoneOrderedSet *)self ordering];
    id v8 = [v7 array];
    id v9 = objc_msgSend(v8, "objectAtIndexedSubscript:", objc_msgSend(v6, "firstIndex"));
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)containsObjectEqualTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICCRTombstoneOrderedSet *)self cachedIndexMapping];
  id v6 = [v5 objectForKey:v4];

  LOBYTE(v4) = [v6 count] != 0;
  return (char)v4;
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(ICCRTombstoneOrderedSet *)self identifierForObjectInCachedSet:v6];
  if (!v7)
  {
    unint64_t v8 = [(ICCRTombstoneOrderedSet *)self count];
    if (v8 <= a4)
    {
      if (v8 != a4)
      {
        id v22 = os_log_create("com.apple.coreCRDT", "ICCRTombstoneOrderedSet");
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[ICCRTombstoneOrderedSet insertObject:atIndex:](a4, v22);
        }

        id v24 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"ICCRTombstoneOrderedSet: inserting element at invalid index" userInfo:0];
        objc_exception_throw(v24);
      }
      id v16 = [(ICCRTombstoneOrderedSet *)self ordering];
      id v7 = [v16 _addObject:v6];

      cachedIndexMapping = self->_cachedIndexMapping;
      v18 = (void *)MEMORY[0x1E4F28E60];
      id v9 = [(ICCRTombstoneOrderedSet *)self ordering];
      id v11 = objc_msgSend(v18, "indexSetWithIndex:", objc_msgSend(v9, "count") - 1);
      [(NSMapTable *)cachedIndexMapping setObject:v11 forKey:v6];
    }
    else
    {
      id v9 = [(ICCRTombstoneOrderedSet *)self objectAtIndexedSubscript:a4];
      id v10 = [(ICCRTombstoneOrderedSet *)self cachedIndexMapping];
      id v11 = [v10 objectForKey:v9];

      uint64_t v12 = [v11 firstIndex];
      id v13 = [(ICCRTombstoneOrderedSet *)self ordering];
      id v7 = [v13 _insertObject:v6 atIndex:v12];

      [(ICCRTombstoneOrderedSet *)self shiftCachedIndicesStartingAtIndex:v12 by:1];
      id v14 = self->_cachedIndexMapping;
      v15 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v12];
      [(NSMapTable *)v14 setObject:v15 forKey:v6];
    }
    id v19 = [(ICCRTombstoneOrderedSet *)self elements];
    [v19 addObject:v7];

    cachedIdentifierSet = self->_cachedIdentifierSet;
    if (cachedIdentifierSet) {
      [(NSMutableOrderedSet *)cachedIdentifierSet insertObject:v7 atIndex:a4];
    }
    if ([(ICCRTombstoneOrderedSet *)self wantsUndoCommands])
    {
      id v21 = [(ICCRTombstoneOrderedSet *)self delegate];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __48__ICCRTombstoneOrderedSet_insertObject_atIndex___block_invoke;
      v25[3] = &unk_1E64A98C8;
      id v7 = v7;
      id v26 = v7;
      [v21 addUndoCommandsForObject:self block:v25];
    }
  }
}

void __48__ICCRTombstoneOrderedSet_insertObject_atIndex___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *(void *)(a1 + 32);
  v2 = (void *)MEMORY[0x1E4F1C978];
  id v3 = a2;
  id v4 = [v2 arrayWithObjects:&v5 count:1];
  objc_msgSend(v3, "undoablyRemoveObjectIdentifiersFromElements:", v4, v5, v6);
}

- (void)undoablyRemoveObjectIdentifiersFromElements:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICCRTombstoneOrderedSet *)self elements];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 removeObject:*(void *)(*((void *)&v14 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(ICCRTombstoneOrderedSet *)self wipeoutCaches];
  if ([(ICCRTombstoneOrderedSet *)self wantsUndoCommands])
  {
    id v11 = [(ICCRTombstoneOrderedSet *)self delegate];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__ICCRTombstoneOrderedSet_undoablyRemoveObjectIdentifiersFromElements___block_invoke;
    v12[3] = &unk_1E64A98C8;
    id v13 = v6;
    [v11 addUndoCommandsForObject:self block:v12];
  }
}

uint64_t __71__ICCRTombstoneOrderedSet_undoablyRemoveObjectIdentifiersFromElements___block_invoke(uint64_t a1, void *a2)
{
  return [a2 undoablyInsertObjectIdentifiersIntoElements:*(void *)(a1 + 32)];
}

- (void)undoablyInsertObjectIdentifiersIntoElements:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ICCRTombstoneOrderedSet *)self elements];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        [v5 addObject:*(void *)(*((void *)&v14 + 1) + 8 * v10++)];
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  [(ICCRTombstoneOrderedSet *)self wipeoutCaches];
  if ([(ICCRTombstoneOrderedSet *)self wantsUndoCommands])
  {
    id v11 = [(ICCRTombstoneOrderedSet *)self delegate];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __71__ICCRTombstoneOrderedSet_undoablyInsertObjectIdentifiersIntoElements___block_invoke;
    v12[3] = &unk_1E64A98C8;
    id v13 = v6;
    [v11 addUndoCommandsForObject:self block:v12];
  }
}

uint64_t __71__ICCRTombstoneOrderedSet_undoablyInsertObjectIdentifiersIntoElements___block_invoke(uint64_t a1, void *a2)
{
  return [a2 undoablyRemoveObjectIdentifiersFromElements:*(void *)(a1 + 32)];
}

- (void)shiftCachedIndicesStartingAtIndex:(unint64_t)a3 by:(int64_t)a4
{
  cachedIndexMapping = self->_cachedIndexMapping;
  if (cachedIndexMapping)
  {
    id v10 = [(NSMapTable *)cachedIndexMapping objectEnumerator];
    uint64_t v7 = [v10 nextObject];
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      do
      {
        [v8 shiftIndexesStartingAtIndex:a3 by:a4];
        uint64_t v9 = [v10 nextObject];

        uint64_t v8 = (void *)v9;
      }
      while (v9);
    }
  }
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  [(ICCRTombstoneOrderedSet *)self insertObject:v4 atIndex:[(ICCRTombstoneOrderedSet *)self count]];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  uint64_t v5 = -[ICCRTombstoneOrderedSet objectAtIndexedSubscript:](self, "objectAtIndexedSubscript:");
  id v6 = [(ICCRTombstoneOrderedSet *)self cachedIndexMapping];
  uint64_t v7 = [v6 objectForKey:v5];

  uint64_t v8 = [(ICCRTombstoneOrderedSet *)self cachedIdentifierSet];
  uint64_t v9 = [v8 objectAtIndexedSubscript:a3];

  id v10 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count") + 1);
  [v10 addObject:v9];
  id v11 = [(ICCRTombstoneOrderedSet *)self elements];
  [v11 removeObject:v9];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__ICCRTombstoneOrderedSet_removeObjectAtIndex___block_invoke;
  v17[3] = &unk_1E64A70D8;
  v17[4] = self;
  id v12 = v10;
  id v18 = v12;
  [v7 enumerateIndexesUsingBlock:v17];
  [(NSMapTable *)self->_cachedIndexMapping removeObjectForKey:v5];
  [(ICCRTombstoneOrderedSet *)self _removeObjectsFromOrderingAtIndices:v7];
  cachedIdentifierSet = self->_cachedIdentifierSet;
  if (cachedIdentifierSet) {
    [(NSMutableOrderedSet *)cachedIdentifierSet removeObjectAtIndex:a3];
  }
  if ([(ICCRTombstoneOrderedSet *)self wantsUndoCommands])
  {
    long long v14 = [(ICCRTombstoneOrderedSet *)self delegate];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __47__ICCRTombstoneOrderedSet_removeObjectAtIndex___block_invoke_2;
    v15[3] = &unk_1E64A98C8;
    id v16 = v12;
    [v14 addUndoCommandsForObject:self block:v15];
  }
}

void __47__ICCRTombstoneOrderedSet_removeObjectAtIndex___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) ordering];
  uint64_t v5 = [v4 array];
  id v7 = [v5 objectAtIndexedSubscript:a2];

  id v6 = [*(id *)(a1 + 32) elements];
  [v6 removeObject:v7];

  [*(id *)(a1 + 40) addObject:v7];
}

uint64_t __47__ICCRTombstoneOrderedSet_removeObjectAtIndex___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 undoablyInsertObjectIdentifiersIntoElements:*(void *)(a1 + 32)];
}

- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
}

- (void)safeMoveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
}

- (void)moveObjectFromIndex:(unint64_t)a3 toIndex:(unint64_t)a4 mutableSafe:(BOOL)a5
{
  BOOL v5 = a5;
  if ([(ICCRTombstoneOrderedSet *)self count] < a4)
  {
    v31 = os_log_create("com.apple.coreCRDT", "ICCRTombstoneOrderedSet");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      -[ICCRTombstoneOrderedSet moveObjectFromIndex:toIndex:mutableSafe:](a4, v31);
    }

    id v32 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:@"ICCRTombstoneOrderedSet: moving element to an invalid index" userInfo:0];
    objc_exception_throw(v32);
  }
  if (a3 != a4 || !v5)
  {
    v34 = [(ICCRTombstoneOrderedSet *)self objectAtIndexedSubscript:a4];
    uint64_t v9 = [(ICCRTombstoneOrderedSet *)self objectAtIndexedSubscript:a3];
    id v10 = [(ICCRTombstoneOrderedSet *)self cachedIndexMapping];
    id v11 = [v10 objectForKey:v9];

    id v12 = [(ICCRTombstoneOrderedSet *)self cachedIdentifierSet];
    id v13 = [v12 objectAtIndexedSubscript:a3];

    long long v14 = [MEMORY[0x1E4F1CA80] set];
    long long v15 = [(ICCRTombstoneOrderedSet *)self ordering];
    id v16 = [v15 array];

    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __67__ICCRTombstoneOrderedSet_moveObjectFromIndex_toIndex_mutableSafe___block_invoke;
    v37[3] = &unk_1E64A70D8;
    id v17 = v14;
    id v38 = v17;
    id v33 = v16;
    id v39 = v33;
    [v11 enumerateIndexesUsingBlock:v37];
    [v17 removeObject:v13];
    [(NSMapTable *)self->_cachedIndexMapping removeObjectForKey:v9];
    if (a3 == a4)
    {
      uint64_t v18 = [v11 firstIndex];
      [v11 removeIndex:v18];
      cachedIndexMapping = self->_cachedIndexMapping;
      id v20 = [MEMORY[0x1E4F28E60] indexSetWithIndex:v18];
      [(NSMapTable *)cachedIndexMapping setObject:v20 forKey:v9];
    }
    [(ICCRTombstoneOrderedSet *)self _removeObjectsFromOrderingAtIndices:v11];
    if (!v5)
    {
      id v21 = [(ICCRTombstoneOrderedSet *)self ordering];
      id v22 = [v21 contents];

      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __67__ICCRTombstoneOrderedSet_moveObjectFromIndex_toIndex_mutableSafe___block_invoke_2;
      v35[3] = &unk_1E64A98F0;
      id v36 = v22;
      id v23 = v22;
      [v17 enumerateObjectsUsingBlock:v35];
      [v23 removeObjectForKey:v13];
      [v23 setObject:v9 forKey:v13];
    }
    if (a3 != a4)
    {
      id v24 = [(ICCRTombstoneOrderedSet *)self cachedIndexMapping];
      v25 = [v24 objectForKey:v34];

      uint64_t v26 = [v25 firstIndex];
      if (a3 > a4) {
        uint64_t v27 = v26;
      }
      else {
        uint64_t v27 = v26 + 1;
      }
      if (v5) {
        id v28 = v17;
      }
      else {
        id v28 = 0;
      }
      [(ICCRTombstoneOrderedSet *)self reinsertIdentifier:v13 withMaskedIdentifiers:v28 atIndex:v27 forObjectToMove:v9];
    }
    cachedIdentifierSet = self->_cachedIdentifierSet;
    if (cachedIdentifierSet)
    {
      v30 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
      [(NSMutableOrderedSet *)cachedIdentifierSet moveObjectsAtIndexes:v30 toIndex:a4];
    }
  }
}

void __67__ICCRTombstoneOrderedSet_moveObjectFromIndex_toIndex_mutableSafe___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) objectAtIndexedSubscript:a2];
  [v2 addObject:v3];
}

uint64_t __67__ICCRTombstoneOrderedSet_moveObjectFromIndex_toIndex_mutableSafe___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectForKey:a2];
}

- (void)_removeObjectsFromOrderingAtIndices:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v5 = [(ICCRTombstoneOrderedSet *)self ordering];
    id v6 = [v5 array];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __63__ICCRTombstoneOrderedSet__removeObjectsFromOrderingAtIndices___block_invoke;
    v15[3] = &unk_1E64A9918;
    id v7 = v6;
    id v16 = v7;
    [v4 enumerateIndexesWithOptions:2 usingBlock:v15];
    uint64_t v8 = [(NSMapTable *)self->_cachedIndexMapping objectEnumerator];
    uint64_t v9 = [v8 nextObject];
    if (v9)
    {
      id v10 = (void *)v9;
      uint64_t v11 = MEMORY[0x1E4F143A8];
      do
      {
        v13[0] = v11;
        v13[1] = 3221225472;
        v13[2] = __63__ICCRTombstoneOrderedSet__removeObjectsFromOrderingAtIndices___block_invoke_2;
        v13[3] = &unk_1E64A9918;
        id v14 = v10;
        id v12 = v10;
        [v4 enumerateIndexesWithOptions:2 usingBlock:v13];

        id v10 = [v8 nextObject];
      }
      while (v10);
    }
  }
}

uint64_t __63__ICCRTombstoneOrderedSet__removeObjectsFromOrderingAtIndices___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) removeObjectAtIndex:a2];
}

unint64_t __63__ICCRTombstoneOrderedSet__removeObjectsFromOrderingAtIndices___block_invoke_2(uint64_t a1, unint64_t a2)
{
  unint64_t result = [*(id *)(a1 + 32) lastIndex];
  if (result >= a2)
  {
    BOOL v5 = *(void **)(a1 + 32);
    return [v5 shiftIndexesStartingAtIndex:a2 + 1 by:-1];
  }
  return result;
}

- (void)reinsertIdentifier:(id)a3 withMaskedIdentifiers:(id)a4 atIndex:(unint64_t)a5 forObjectToMove:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = [(ICCRTombstoneOrderedSet *)self ordering];
  id v14 = [v13 array];

  id v21 = v10;
  [v14 insertObject:v10 atIndex:a5];
  long long v15 = [MEMORY[0x1E4F28E60] indexSetWithIndex:a5];
  if (v11)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __92__ICCRTombstoneOrderedSet_reinsertIdentifier_withMaskedIdentifiers_atIndex_forObjectToMove___block_invoke;
    v22[3] = &unk_1E64A9940;
    id v23 = v14;
    unint64_t v25 = a5;
    id v24 = v15;
    [v11 enumerateObjectsUsingBlock:v22];

    [(ICCRTombstoneOrderedSet *)self moveClock];
    uint64_t v16 = [v11 count] + 1;
  }
  else
  {
    [(ICCRTombstoneOrderedSet *)self moveClock];
    uint64_t v16 = 1;
  }
  id v17 = [(NSMapTable *)self->_cachedIndexMapping objectEnumerator];
  uint64_t v18 = [v17 nextObject];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    do
    {
      if ([v19 lastIndex] >= a5) {
        [v19 shiftIndexesStartingAtIndex:a5 by:v16];
      }
      uint64_t v20 = [v17 nextObject];

      uint64_t v19 = (void *)v20;
    }
    while (v20);
  }
  [(NSMapTable *)self->_cachedIndexMapping setObject:v15 forKey:v12];
}

uint64_t __92__ICCRTombstoneOrderedSet_reinsertIdentifier_withMaskedIdentifiers_atIndex_forObjectToMove___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) insertObject:a2 atIndex:*(void *)(a1 + 48) + 1];
  id v3 = *(void **)(a1 + 40);
  uint64_t v4 = [v3 lastIndex] + 1;
  return [v3 addIndex:v4];
}

- (void)moveClock
{
  id v3 = [(ICCRTombstoneOrderedSet *)self ordering];
  [v3 setMoveClock:1];

  if ([(ICCRTombstoneOrderedSet *)self wantsUndoCommands])
  {
    id v4 = [(ICCRTombstoneOrderedSet *)self delegate];
    [v4 addUndoCommandsForObject:self block:&__block_literal_global_68];
  }
}

uint64_t __36__ICCRTombstoneOrderedSet_moveClock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 moveClock];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ICCRTombstoneOrderedSet *)self cachedIdentifierSet];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__ICCRTombstoneOrderedSet_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_1E64A76A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateObjectsUsingBlock:v7];
}

void __54__ICCRTombstoneOrderedSet_enumerateObjectsUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) objectForIdentifier:a2];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (NSString)description
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__60;
  id v10 = __Block_byref_object_dispose__60;
  id v11 = (id)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:@"{{\n"];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__ICCRTombstoneOrderedSet_description__block_invoke;
  v5[3] = &unk_1E64A9988;
  v5[4] = &v6;
  [(ICCRTombstoneOrderedSet *)self enumerateObjectsUsingBlock:v5];
  [(id)v7[5] appendString:@"}}"];
  id v3 = (void *)[(id)v7[5] copy];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

void __38__ICCRTombstoneOrderedSet_description__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v3 = NSString;
  id v5 = [a2 description];
  id v4 = [v3 stringWithFormat:@"\t%@\n", v5];
  [v2 appendString:v4];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [(ICCRTombstoneOrderedSet *)self ordering];
    id v7 = [v5 ordering];
    if ([v6 isEqual:v7])
    {
      uint64_t v8 = [(ICCRTombstoneOrderedSet *)self elements];
      uint64_t v9 = [v5 elements];
      char v10 = [v8 isEqual:v9];
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  id v3 = [(ICCRTombstoneOrderedSet *)self ordering];
  uint64_t v4 = [v3 hash];
  id v5 = [(ICCRTombstoneOrderedSet *)self elements];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
}

- (void)mergeWith:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v9 = os_log_create("com.apple.coreCRDT", "ICCRTombstoneOrderedSet");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ICCRTombstoneOrderedSet mergeWith:]((uint64_t)v4, v9);
    }

    char v10 = NSString;
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v13 = [v10 stringWithFormat:@"ICCRTombstoneOrderedSet cannot merge with object of type %@.", v12];

    objc_exception_throw(v13);
  }
  id v14 = v4;
  id v5 = [(ICCRTombstoneOrderedSet *)self ordering];
  unint64_t v6 = [v14 ordering];
  [v5 mergeWith:v6];

  id v7 = [(ICCRTombstoneOrderedSet *)self elements];
  uint64_t v8 = [v14 elements];

  [v7 mergeWith:v8];
  [(ICCRTombstoneOrderedSet *)self wipeoutCaches];
}

- (id)deltaSince:(id)a3 in:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ICCRTombstoneOrderedSet *)self ordering];
  uint64_t v9 = [v8 deltaSince:v7 in:v6];

  char v10 = [(ICCRTombstoneOrderedSet *)self elements];
  id v11 = [v10 deltaSince:v7 in:v6];

  id v12 = [[ICCRTombstoneOrderedSet alloc] initWithOrdering:v9 elements:v11 document:v6];
  return v12;
}

- (void)realizeLocalChangesIn:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCRTombstoneOrderedSet *)self ordering];
  [v5 realizeLocalChangesIn:v4];

  id v6 = [(ICCRTombstoneOrderedSet *)self elements];
  [v6 realizeLocalChangesIn:v4];
}

- (id)tombstone
{
  id v3 = [(ICCRTombstoneOrderedSet *)self ordering];
  id v4 = [v3 tombstone];

  id v5 = [(ICCRTombstoneOrderedSet *)self elements];
  id v6 = [v5 tombstone];

  id v7 = [ICCRTombstoneOrderedSet alloc];
  uint64_t v8 = [(ICCRTombstoneOrderedSet *)self document];
  uint64_t v9 = [(ICCRTombstoneOrderedSet *)v7 initWithOrdering:v4 elements:v6 document:v8];

  return v9;
}

- (void)walkGraph:(id)a3
{
  id v4 = a3;
  id v5 = [(ICCRTombstoneOrderedSet *)self ordering];
  [v5 walkGraph:v4];

  id v6 = [(ICCRTombstoneOrderedSet *)self elements];
  [v6 walkGraph:v4];
}

- (void)setDocument:(id)a3
{
  p_document = &self->_document;
  id v5 = a3;
  objc_storeWeak((id *)p_document, v5);
  id v6 = [(ICCRTombstoneOrderedSet *)self ordering];
  [v6 setDocument:v5];

  id v7 = [(ICCRTombstoneOrderedSet *)self elements];
  [v7 setDocument:v5];
}

- (void)addUndoCommandsForObject:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = [(ICCRTombstoneOrderedSet *)self delegate];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__ICCRTombstoneOrderedSet_addUndoCommandsForObject_block___block_invoke;
  v8[3] = &unk_1E64A99B0;
  id v9 = v5;
  id v7 = v5;
  [v6 addUndoCommandsForObject:self block:v8];
}

void __58__ICCRTombstoneOrderedSet_addUndoCommandsForObject_block___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v4 = a2;
  id v3 = [v4 ordering];
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  [v4 wipeoutCaches];
}

- (BOOL)wantsUndoCommands
{
  uint64_t v2 = [(ICCRTombstoneOrderedSet *)self delegate];
  char v3 = [v2 wantsUndoCommands];

  return v3;
}

- (ICCRDocument)document
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_document);
  return (ICCRDocument *)WeakRetained;
}

- (ICCRUndoDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ICCRUndoDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ICCRArray)ordering
{
  return self->_ordering;
}

- (void)setOrdering:(id)a3
{
}

- (ICCRSet)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_ordering, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_document);
  objc_storeStrong((id *)&self->_cachedIndexMapping, 0);
  objc_storeStrong((id *)&self->_cachedIdentifierSet, 0);
}

- (void)insertObject:(uint64_t)a1 atIndex:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Inserting element at invalid index %lu", (uint8_t *)&v2, 0xCu);
}

- (void)moveObjectFromIndex:(uint64_t)a1 toIndex:(NSObject *)a2 mutableSafe:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Moving element at invalid index %lu", (uint8_t *)&v2, 0xCu);
}

- (void)mergeWith:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (objc_class *)objc_opt_class();
  uint64_t v4 = NSStringFromClass(v3);
  int v5 = 138412290;
  id v6 = v4;
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "ICCRTombstoneOrderedSet cannot merge with object of type %@.", (uint8_t *)&v5, 0xCu);
}

@end