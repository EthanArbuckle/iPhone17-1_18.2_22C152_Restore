@interface PLContainerChangeNotification
- (BOOL)_didCalculateDiffs;
- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4;
- (BOOL)countDidChange;
- (BOOL)hasMoves;
- (BOOL)shouldReload;
- (NSArray)_changedObjects;
- (NSArray)changedObjects;
- (NSArray)deletedObjects;
- (NSArray)insertedObjects;
- (NSIndexSet)changedIndexes;
- (NSIndexSet)changedIndexesRelativeToSnapshot;
- (NSIndexSet)deletedIndexes;
- (NSIndexSet)insertedIndexes;
- (NSIndexSet)movedIndexes;
- (NSString)_contentRelationshipName;
- (NSString)_diffDescription;
- (PLContainerChangeNotification)init;
- (PLManagedObject)_managedObject;
- (PLObjectSnapshot)snapshot;
- (__CFArray)movedFromIndexes;
- (id)_initWithObject:(id)a3 snapshot:(id)a4 changedObjects:(id)a5;
- (id)name;
- (id)object;
- (unint64_t)snapshotIndexForContainedObject:(id)a3;
- (void)_calculateDiffs;
- (void)_calculateDiffsIfNecessary;
- (void)_setDidCalculateDiffs:(BOOL)a3;
- (void)dealloc;
- (void)enumerateMovesWithBlock:(id)a3;
@end

@implementation PLContainerChangeNotification

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_changedIndexes, 0);
  objc_storeStrong((id *)&self->_movedIndexes, 0);
  objc_storeStrong((id *)&self->_insertedIndexes, 0);
  objc_storeStrong((id *)&self->_deletedIndexes, 0);
  objc_storeStrong((id *)&self->_changedObjects, 0);
  objc_storeStrong((id *)&self->_snapshot, 0);
  objc_storeStrong(&self->_object, 0);
}

- (__CFArray)movedFromIndexes
{
  return self->_movedFromIndexes;
}

- (NSIndexSet)movedIndexes
{
  return self->_movedIndexes;
}

- (unint64_t)snapshotIndexForContainedObject:(id)a3
{
  id v4 = a3;
  if (self->_snapshot)
  {
    v5 = [(PLContainerChangeNotification *)self _contentRelationshipName];
    if (v5 && [(PLObjectSnapshot *)self->_snapshot hasSnapshotValueForProperty:v5])
    {
      v6 = [(PLObjectSnapshot *)self->_snapshot snapshotValueForProperty:v5];
      v7 = v6;
      if (v6) {
        unint64_t v8 = [v6 indexOfObject:v4];
      }
      else {
        unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (NSArray)changedObjects
{
  [(PLContainerChangeNotification *)self _calculateDiffsIfNecessary];
  id v9 = 0;
  id v10 = 0;
  BOOL v3 = [(PLContainerChangeNotification *)self _getOldSet:&v10 newSet:&v9];
  id v4 = v10;
  id v5 = v9;
  if (v3)
  {
    v6 = [(PLContainerChangeNotification *)self changedIndexes];
    v7 = [v5 objectsAtIndexes:v6];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1C978] array];
  }

  return (NSArray *)v7;
}

- (NSArray)insertedObjects
{
  [(PLContainerChangeNotification *)self _calculateDiffsIfNecessary];
  id v9 = 0;
  id v10 = 0;
  BOOL v3 = [(PLContainerChangeNotification *)self _getOldSet:&v10 newSet:&v9];
  id v4 = v10;
  id v5 = v9;
  if (v3)
  {
    v6 = [(PLContainerChangeNotification *)self insertedIndexes];
    v7 = [v5 objectsAtIndexes:v6];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1C978] array];
  }

  return (NSArray *)v7;
}

- (NSArray)deletedObjects
{
  [(PLContainerChangeNotification *)self _calculateDiffsIfNecessary];
  id v9 = 0;
  id v10 = 0;
  BOOL v3 = [(PLContainerChangeNotification *)self _getOldSet:&v10 newSet:&v9];
  id v4 = v10;
  id v5 = v9;
  if (v3)
  {
    v6 = [(PLContainerChangeNotification *)self deletedIndexes];
    v7 = [v4 objectsAtIndexes:v6];
  }
  else
  {
    v7 = [MEMORY[0x1E4F1C978] array];
  }

  return (NSArray *)v7;
}

- (BOOL)countDidChange
{
  return self->_countDidChange;
}

- (NSIndexSet)changedIndexesRelativeToSnapshot
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(PLContainerChangeNotification *)self _calculateDiffsIfNecessary];
  id v19 = 0;
  id v20 = 0;
  BOOL v3 = [(PLContainerChangeNotification *)self _getOldSet:&v20 newSet:&v19];
  id v4 = v20;
  id v5 = v19;
  v6 = v5;
  v7 = 0;
  if (v3)
  {
    unint64_t v8 = [v5 objectsAtIndexes:self->_changedIndexes];
    if (v8)
    {
      v7 = [MEMORY[0x1E4F28E60] indexSet];
      long long v15 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v16;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v16 != v12) {
              objc_enumerationMutation(v9);
            }
            objc_msgSend(v7, "addIndex:", objc_msgSend(v4, "indexOfObject:", *(void *)(*((void *)&v15 + 1) + 8 * i), (void)v15));
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v15 objects:v21 count:16];
        }
        while (v11);
      }
    }
    else
    {
      v7 = 0;
    }
  }
  return (NSIndexSet *)v7;
}

- (NSIndexSet)changedIndexes
{
  [(PLContainerChangeNotification *)self _calculateDiffsIfNecessary];
  changedIndexes = self->_changedIndexes;
  return changedIndexes;
}

- (BOOL)hasMoves
{
  movedIndexes = self->_movedIndexes;
  if (movedIndexes) {
    LOBYTE(movedIndexes) = [(NSIndexSet *)movedIndexes count] != 0;
  }
  return (char)movedIndexes;
}

- (void)enumerateMovesWithBlock:(id)a3
{
  id v4 = a3;
  [(PLContainerChangeNotification *)self _calculateDiffsIfNecessary];
  movedIndexes = self->_movedIndexes;
  if (movedIndexes)
  {
    if (self->_movedFromIndexes)
    {
      [(NSIndexSet *)self->_movedIndexes count];
      CFArrayGetCount(self->_movedFromIndexes);
      movedIndexes = self->_movedIndexes;
    }
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __57__PLContainerChangeNotification_enumerateMovesWithBlock___block_invoke;
    v6[3] = &unk_1E586ABF8;
    v6[4] = self;
    unint64_t v8 = v9;
    id v7 = v4;
    [(NSIndexSet *)movedIndexes enumerateIndexesUsingBlock:v6];

    _Block_object_dispose(v9, 8);
  }
}

uint64_t __57__PLContainerChangeNotification_enumerateMovesWithBlock___block_invoke(void *a1)
{
  CFArrayRef v2 = *(const __CFArray **)(a1[4] + 64);
  uint64_t v3 = *(void *)(a1[6] + 8);
  CFIndex v4 = *(void *)(v3 + 24);
  *(void *)(v3 + 24) = v4 + 1;
  CFArrayGetValueAtIndex(v2, v4);
  id v5 = *(uint64_t (**)(void))(a1[5] + 16);
  return v5();
}

- (NSIndexSet)insertedIndexes
{
  [(PLContainerChangeNotification *)self _calculateDiffsIfNecessary];
  insertedIndexes = self->_insertedIndexes;
  return insertedIndexes;
}

- (NSIndexSet)deletedIndexes
{
  [(PLContainerChangeNotification *)self _calculateDiffsIfNecessary];
  deletedIndexes = self->_deletedIndexes;
  return deletedIndexes;
}

- (BOOL)shouldReload
{
  return self->_shouldReload;
}

- (id)name
{
  CFIndex v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLContainerChangeNotification.m" lineNumber:67 description:@"Abstract class"];

  return 0;
}

- (id)object
{
  return self->_object;
}

- (void)dealloc
{
  movedFromIndexes = self->_movedFromIndexes;
  if (movedFromIndexes) {
    CFRelease(movedFromIndexes);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLContainerChangeNotification;
  [(PLContainerChangeNotification *)&v4 dealloc];
}

- (PLContainerChangeNotification)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLContainerChangeNotification;
  return [(PLContainerChangeNotification *)&v3 init];
}

- (void)_calculateDiffs
{
  self->_didCalculateDiffs = 1;
  id v38 = 0;
  id v37 = 0;
  BOOL v3 = [(PLContainerChangeNotification *)self _getOldSet:&v38 newSet:&v37];
  id v4 = v38;
  id v5 = v37;
  self->_shouldReload = !v3;
  if (v3)
  {
    p_deletedIndexes = &self->_deletedIndexes;
    deletedIndexes = self->_deletedIndexes;
    self->_deletedIndexes = 0;

    insertedIndexes = self->_insertedIndexes;
    location = (id *)&self->_insertedIndexes;
    self->_insertedIndexes = 0;

    movedIndexes = self->_movedIndexes;
    self->_movedIndexes = 0;

    p_movedFromIndexes = (CFTypeRef *)&self->_movedFromIndexes;
    movedFromIndexes = self->_movedFromIndexes;
    if (movedFromIndexes)
    {
      CFRelease(movedFromIndexes);
      CFTypeRef *p_movedFromIndexes = 0;
    }
    p_changedIndexes = &self->_changedIndexes;
    changedIndexes = self->_changedIndexes;
    self->_changedIndexes = 0;

    v14 = [(PLContainerChangeNotification *)self _changedObjects];
    id v35 = 0;
    id v36 = 0;
    v33 = 0;
    id v34 = 0;
    v31 = v5;
    v32 = v4;
    diffOrderedSets(v4, v5, v14, &v36, &v35, &v34, (CFTypeRef *)&self->_movedFromIndexes, &v33);
    id v15 = v36;
    id v29 = v36;
    id v16 = v35;
    id v28 = v35;
    id v17 = v34;
    id v27 = v34;
    long long v18 = v33;
    v26 = v33;

    objc_storeStrong((id *)&self->_deletedIndexes, v15);
    objc_storeStrong(location, v16);
    objc_storeStrong((id *)&self->_movedIndexes, v17);
    if (*p_movedFromIndexes) {
      CFRetain(*p_movedFromIndexes);
    }
    objc_storeStrong((id *)&self->_changedIndexes, v18);
    if (!*p_deletedIndexes)
    {
      uint64_t v19 = [MEMORY[0x1E4F28D60] indexSet];
      id v20 = *p_deletedIndexes;
      *p_deletedIndexes = (NSIndexSet *)v19;
    }
    id v5 = v31;
    id v4 = v32;
    if (!*location)
    {
      uint64_t v21 = [MEMORY[0x1E4F28D60] indexSet];
      id v22 = *location;
      id *location = (id)v21;
    }
    if (!*p_changedIndexes)
    {
      uint64_t v23 = [MEMORY[0x1E4F28D60] indexSet];
      v24 = *p_changedIndexes;
      *p_changedIndexes = (NSIndexSet *)v23;
    }
    uint64_t v25 = [v32 count];
    self->_countDidChange = v25 != [v31 count];
  }
}

- (void)_calculateDiffsIfNecessary
{
  if (![(PLContainerChangeNotification *)self _didCalculateDiffs])
  {
    [(PLContainerChangeNotification *)self _calculateDiffs];
  }
}

- (BOOL)_getOldSet:(id *)a3 newSet:(id *)a4
{
  id v7 = [(PLContainerChangeNotification *)self _contentRelationshipName];
  BOOL v8 = [(PLObjectSnapshot *)self->_snapshot hasSnapshotValueForProperty:v7];
  if (v8)
  {
    *a3 = [(PLObjectSnapshot *)self->_snapshot snapshotValueForProperty:v7];
    id v9 = [(PLContainerChangeNotification *)self _managedObject];
    *a4 = [v9 valueForKey:v7];
  }
  return v8;
}

- (NSString)_diffDescription
{
  BOOL v3 = (void *)MEMORY[0x19F38D3B0]([(PLContainerChangeNotification *)self _calculateDiffsIfNecessary]);
  id v4 = [MEMORY[0x1E4F28E78] string];
  if ([(PLContainerChangeNotification *)self shouldReload])
  {
    id v5 = [(PLContainerChangeNotification *)self _contentRelationshipName];
    [v4 appendFormat:@", %@ need reload", v5];
  }
  else
  {
    v6 = [(PLContainerChangeNotification *)self deletedIndexes];

    if (v6)
    {
      id v7 = [(PLContainerChangeNotification *)self deletedIndexes];
      BOOL v8 = objc_msgSend(v7, "pl_shortDescription");
      [v4 appendFormat:@", deleted: {%@}", v8];
    }
    id v9 = [(PLContainerChangeNotification *)self insertedIndexes];

    if (v9)
    {
      uint64_t v10 = [(PLContainerChangeNotification *)self insertedIndexes];
      uint64_t v11 = objc_msgSend(v10, "pl_shortDescription");
      [v4 appendFormat:@", inserted: {%@}", v11];
    }
    if (self->_movedIndexes)
    {
      [v4 appendString:@", moved: {"];
      v21[0] = 0;
      v21[1] = v21;
      v21[2] = 0x2020000000;
      v21[3] = 0;
      movedIndexes = self->_movedIndexes;
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __59__PLContainerChangeNotification_Internal___diffDescription__block_invoke;
      v18[3] = &unk_1E586F698;
      v18[4] = self;
      id v20 = v21;
      id v13 = v4;
      id v19 = v13;
      [(NSIndexSet *)movedIndexes enumerateIndexesUsingBlock:v18];
      [v13 appendString:@"}"];

      _Block_object_dispose(v21, 8);
    }
    v14 = [(PLContainerChangeNotification *)self changedIndexes];

    if (v14)
    {
      id v15 = [(PLContainerChangeNotification *)self changedIndexes];
      id v16 = objc_msgSend(v15, "pl_shortDescription");
      [v4 appendFormat:@", changed: {%@}", v16];
    }
    if (self->_countDidChange) {
      [v4 appendString:@", count changed"];
    }
  }
  return (NSString *)v4;
}

uint64_t __59__PLContainerChangeNotification_Internal___diffDescription__block_invoke(uint64_t a1, uint64_t a2)
{
  CFArrayRef v4 = *(const __CFArray **)(*(void *)(a1 + 32) + 64);
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  CFIndex v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v6 + 1;
  return [*(id *)(a1 + 40) appendFormat:@"%lu->%lu, ", CFArrayGetValueAtIndex(v4, v6), a2];
}

- (PLObjectSnapshot)snapshot
{
  return self->_snapshot;
}

- (NSString)_contentRelationshipName
{
  CFArrayRef v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLContainerChangeNotification.m" lineNumber:260 description:@"Abstract class"];

  return 0;
}

- (NSArray)_changedObjects
{
  return self->_changedObjects;
}

- (PLManagedObject)_managedObject
{
  return (PLManagedObject *)self->_object;
}

- (void)_setDidCalculateDiffs:(BOOL)a3
{
  self->_didCalculateDiffs = a3;
}

- (BOOL)_didCalculateDiffs
{
  return self->_didCalculateDiffs;
}

- (id)_initWithObject:(id)a3 snapshot:(id)a4 changedObjects:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = [(PLContainerChangeNotification *)self _init];
  id v13 = v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong(v13 + 2, a4);
    objc_storeStrong(v13 + 3, a5);
  }

  return v13;
}

@end