@interface VUICollectionComparator
+ (id)_identifiersWithObjects:(id)a3 identifierBlock:(id)a4;
+ (id)_indexByIdentifierDictionaryWithIdentifiers:(id)a3;
+ (id)_movedIdentifiersWithSourceIdentifiers:(id)a3 destinationIdentifiers:(id)a4;
- (id)_changeSetWithSourceObjects:(id)a3 destinationObjects:(id)a4 identifierBlock:(id)a5 isEqualBlock:(id)a6 updateChangeSetBlock:(id)a7;
- (id)changeSetFromObjects:(id)a3 toObjects:(id)a4 identifierBlock:(id)a5 isEqualBlock:(id)a6;
- (id)changeSetFromObjects:(id)a3 toObjects:(id)a4 identifierBlock:(id)a5 updateChangeSetBlock:(id)a6;
@end

@implementation VUICollectionComparator

- (id)changeSetFromObjects:(id)a3 toObjects:(id)a4 identifierBlock:(id)a5 isEqualBlock:(id)a6
{
  return [(VUICollectionComparator *)self _changeSetWithSourceObjects:a3 destinationObjects:a4 identifierBlock:a5 isEqualBlock:a6 updateChangeSetBlock:0];
}

- (id)changeSetFromObjects:(id)a3 toObjects:(id)a4 identifierBlock:(id)a5 updateChangeSetBlock:(id)a6
{
  return [(VUICollectionComparator *)self _changeSetWithSourceObjects:a3 destinationObjects:a4 identifierBlock:a5 isEqualBlock:0 updateChangeSetBlock:a6];
}

- (id)_changeSetWithSourceObjects:(id)a3 destinationObjects:(id)a4 identifierBlock:(id)a5 isEqualBlock:(id)a6 updateChangeSetBlock:(id)a7
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v37 = a4;
  id v12 = a5;
  *(void *)&long long v36 = a6;
  *((void *)&v36 + 1) = a7;
  v38 = objc_alloc_init(VUICollectionChangeSet);
  v33 = v11;
  v35 = v12;
  v42 = [(id)objc_opt_class() _identifiersWithObjects:v11 identifierBlock:v12];
  v41 = [(id)objc_opt_class() _identifiersWithObjects:v37 identifierBlock:v12];
  [v41 count];
  v13 = [(id)objc_opt_class() _indexByIdentifierDictionaryWithIdentifiers:v42];
  v14 = [(id)objc_opt_class() _indexByIdentifierDictionaryWithIdentifiers:v41];
  v15 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v42, "count"));
  v16 = [MEMORY[0x1E4F28E60] indexSet];
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke;
  v65[3] = &unk_1E6DDD158;
  id v44 = v14;
  id v66 = v44;
  id v39 = v16;
  id v67 = v39;
  id v34 = v15;
  id v68 = v34;
  [v42 enumerateObjectsUsingBlock:v65];
  [v42 removeObjectsAtIndexes:v39];
  if ([v39 count])
  {
    v17 = [[VUICollectionChange alloc] initWithChangeKind:2 sourceIndexes:v39 destinationIndexes:0];
    [(VUICollectionChangeSet *)v38 setDeleteChange:v17];
  }
  v18 = [MEMORY[0x1E4F28E60] indexSet];
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke_2;
  v62[3] = &unk_1E6DDD180;
  id v45 = v13;
  id v63 = v45;
  id v40 = v18;
  id v64 = v40;
  [v41 enumerateObjectsUsingBlock:v62];
  v19 = [v41 objectsAtIndexes:v40];
  [v42 insertObjects:v19 atIndexes:v40];

  if ([v40 count])
  {
    v20 = [[VUICollectionChange alloc] initWithChangeKind:1 sourceIndexes:0 destinationIndexes:v40];
    [(VUICollectionChangeSet *)v38 setInsertChange:v20];
  }
  v21 = [(id)objc_opt_class() _movedIdentifiersWithSourceIdentifiers:v42 destinationIdentifiers:v41];
  id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v59 = 0u;
  long long v58 = 0u;
  id obj = v21;
  uint64_t v23 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
  if (v23)
  {
    uint64_t v24 = *(void *)v59;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v59 != v24) {
          objc_enumerationMutation(obj);
        }
        uint64_t v26 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        v27 = [v45 objectForKey:v26];
        v28 = [v44 objectForKey:v26];
        v29 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v27, "unsignedIntegerValue"));
        v30 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndex:", objc_msgSend(v28, "unsignedIntegerValue"));
        v31 = [[VUICollectionChange alloc] initWithChangeKind:3 sourceIndexes:v29 destinationIndexes:v30];
        [v22 addObject:v31];
      }
      uint64_t v23 = [obj countByEnumeratingWithState:&v58 objects:v69 count:16];
    }
    while (v23);
  }

  if ([v22 count]) {
    [(VUICollectionChangeSet *)v38 setMoveChanges:v22];
  }
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x3032000000;
  v55 = __Block_byref_object_copy_;
  v56 = __Block_byref_object_dispose_;
  id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v36 != 0)
  {
    v46[0] = MEMORY[0x1E4F143A8];
    v46[1] = 3221225472;
    v46[2] = __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke_37;
    v46[3] = &unk_1E6DDD1A8;
    id v47 = v33;
    id v48 = v37;
    id v49 = *((id *)&v36 + 1);
    id v50 = (id)v36;
    v51 = &v52;
    [v34 enumerateKeysAndObjectsUsingBlock:v46];
  }
  if ([(id)v53[5] count]) {
    [(VUICollectionChangeSet *)v38 setUpdateChanges:v53[5]];
  }
  _Block_object_dispose(&v52, 8);

  return v38;
}

void __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v7 = [*(id *)(a1 + 32) objectForKey:a2];
  if (v7)
  {
    v5 = *(void **)(a1 + 48);
    v6 = [NSNumber numberWithUnsignedInteger:a3];
    [v5 setObject:v6 forKey:v7];
  }
  else
  {
    [*(id *)(a1 + 40) addIndex:a3];
  }
}

void __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = [*(id *)(a1 + 32) objectForKey:a2];

  if (!v5)
  {
    v6 = *(void **)(a1 + 40);
    [v6 addIndex:a3];
  }
}

void __124__VUICollectionComparator__changeSetWithSourceObjects_destinationObjects_identifierBlock_isEqualBlock_updateChangeSetBlock___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = [a3 unsignedIntegerValue];
  uint64_t v7 = [v5 unsignedIntegerValue];

  id v14 = [*(id *)(a1 + 32) objectAtIndex:v6];
  v8 = [*(id *)(a1 + 40) objectAtIndex:v7];
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9)
  {
    v10 = (*(void (**)(uint64_t, id, void *))(v9 + 16))(v9, v14, v8);
    if (([v10 hasChanges] & 1) == 0) {
      goto LABEL_7;
    }
  }
  else
  {
    if ((*(uint64_t (**)(void))(*(void *)(a1 + 56) + 16))()) {
      goto LABEL_8;
    }
    v10 = 0;
  }
  id v11 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v6];
  id v12 = [MEMORY[0x1E4F28D60] indexSetWithIndex:v7];
  v13 = [[VUICollectionChange alloc] initWithChangeKind:4 sourceIndexes:v11 destinationIndexes:v12];
  [(VUICollectionChange *)v13 setUpdateChangeSet:v10];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) addObject:v13];

LABEL_7:
LABEL_8:
}

+ (id)_identifiersWithObjects:(id)a3 identifierBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  uint64_t v9 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__VUICollectionComparator__identifiersWithObjects_identifierBlock___block_invoke;
  v16[3] = &unk_1E6DDD1D0;
  id v19 = v5;
  id v17 = v8;
  id v10 = v9;
  id v18 = v10;
  id v11 = v8;
  id v12 = v5;
  [v7 enumerateObjectsUsingBlock:v16];

  v13 = v18;
  id v14 = v10;

  return v14;
}

void __67__VUICollectionComparator__identifiersWithObjects_identifierBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [*(id *)(a1 + 32) objectForKey:v8];
  uint64_t v3 = [v2 unsignedIntegerValue];

  uint64_t v4 = v3 + 1;
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:v4];
  [v5 setObject:v6 forKey:v8];

  id v7 = [[VUICollisionSafeIdentifier alloc] initWithRootIdentifier:v8 collisionCount:v4];
  [*(id *)(a1 + 40) addObject:v7];
}

+ (id)_indexByIdentifierDictionaryWithIdentifiers:(id)a3
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  id v5 = objc_msgSend(v3, "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __71__VUICollectionComparator__indexByIdentifierDictionaryWithIdentifiers___block_invoke;
  v9[3] = &unk_1E6DDD1F8;
  id v10 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  id v7 = (void *)[v6 copy];
  return v7;
}

void __71__VUICollectionComparator__indexByIdentifierDictionaryWithIdentifiers___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = NSNumber;
  id v6 = a2;
  id v7 = [v5 numberWithUnsignedInteger:a3];
  [v4 setObject:v7 forKey:v6];
}

+ (id)_movedIdentifiersWithSourceIdentifiers:(id)a3 destinationIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 count];
  id v34 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v7];
  id v8 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v7];
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      id v10 = [v5 objectAtIndex:i];
      id v11 = [v6 objectAtIndex:i];
      if (([v10 isEqual:v11] & 1) == 0)
      {
        id v12 = [v8 objectForKey:v10];
        v13 = v12;
        if (v12)
        {
          uint64_t v14 = [v12 integerValue];
          v15 = [NSNumber numberWithUnsignedInteger:i - v14];
          v16 = v34;
        }
        else
        {
          v15 = [NSNumber numberWithUnsignedInteger:i];
          v16 = v8;
        }
        [v16 setObject:v15 forKey:v10];

        id v17 = [v8 objectForKey:v11];

        if (v17)
        {
          uint64_t v18 = [v17 integerValue];
          id v19 = [NSNumber numberWithUnsignedInteger:i - v18];
          v20 = v34;
        }
        else
        {
          id v19 = [NSNumber numberWithUnsignedInteger:i];
          v20 = v8;
        }
        [v20 setObject:v19 forKey:v11];
      }
    }
  }
  v21 = [MEMORY[0x1E4F1CA80] setWithCapacity:v7];
  if (v7)
  {
    unint64_t v22 = 0;
    unint64_t v23 = 0;
    while (1)
    {
      if (v23 >= [v5 count])
      {
        uint64_t v24 = 0;
      }
      else
      {
        uint64_t v24 = [v5 objectAtIndex:v23];
      }
      if (v22 >= [v6 count]) {
        break;
      }
      uint64_t v25 = [v6 objectAtIndex:v22];
      uint64_t v26 = (void *)v25;
      if (!v24 || !v25 || ([v24 isEqual:v25] & 1) != 0) {
        goto LABEL_27;
      }
      if ([v21 containsObject:v24]) {
        goto LABEL_25;
      }
      if (![v21 containsObject:v26])
      {
        [v34 objectForKey:v24];
        v27 = v33 = v21;
        unint64_t v32 = [v27 integerValue];

        v28 = [v34 objectForKey:v26];
        unint64_t v29 = [v28 integerValue];

        v21 = v33;
        if (v32 > v29)
        {
          [v33 addObject:v24];
LABEL_25:
          ++v23;
          goto LABEL_29;
        }
        [v33 addObject:v26];
      }
LABEL_28:
      ++v22;
LABEL_29:

      if (v23 >= v7 && v22 >= v7) {
        goto LABEL_33;
      }
    }
    uint64_t v26 = 0;
LABEL_27:
    ++v23;
    goto LABEL_28;
  }
LABEL_33:
  v30 = (void *)[v21 copy];

  return v30;
}

@end