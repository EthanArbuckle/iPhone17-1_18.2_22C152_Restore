@interface PKGroup
- (NSNumber)groupID;
- (PKGroup)init;
- (id)associatedAccountForPassAtIndex:(unint64_t)a3;
- (id)associatedAccountForPassUniqueID:(id)a3;
- (id)description;
- (id)initWithCatalogGroup:(void *)a3 passes:(void *)a4 states:(void *)a5 accounts:;
- (id)observers;
- (id)passAtIndex:(unint64_t)a3;
- (id)passes;
- (id)stateAtIndex:(unint64_t)a3;
- (id)stateForPassUniqueID:(id)a3;
- (uint64_t)_indexOfUniqueID:(void *)a1;
- (uint64_t)containsPassesInAdditionToUniqueID:(uint64_t)a1;
- (unint64_t)frontmostPassIndex;
- (unint64_t)indexForPassUniqueID:(id)a3;
- (unint64_t)passCount;
- (void)_moveUniqueID:(uint64_t)a3 toIndex:(int)a4 notify:;
- (void)_removeUniqueID:(int)a3 notify:;
- (void)addGroupObserver:(id)a3;
- (void)removeGroupObserver:(id)a3;
- (void)setFrontmostPassIndex:(unint64_t)a3;
- (void)updateAssociatedAccount:(uint64_t)a1;
@end

@implementation PKGroup

- (NSNumber)groupID
{
  return [(PKCatalogGroup *)self->_catalogGroup groupID];
}

- (id)initWithCatalogGroup:(void *)a3 passes:(void *)a4 states:(void *)a5 accounts:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a2;
  id v11 = a3;
  id v32 = a4;
  id v12 = a5;
  if (a1)
  {
    v39.receiver = a1;
    v39.super_class = (Class)PKGroup;
    v13 = (id *)objc_msgSendSuper2(&v39, sel_init);
    a1 = v13;
    if (v13)
    {
      id v30 = v10;
      objc_storeStrong(v13 + 3, a2);
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v15 = a1[4];
      a1[4] = v14;

      id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      id v17 = a1[5];
      a1[5] = v16;

      *((_DWORD *)a1 + 4) = 0;
      [a1[3] uniqueIDs];
      long long v35 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      v31 = long long v38 = 0u;
      v18 = (void *)[v31 copy];
      uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            v24 = [v11 objectForKey:v23];
            if (v24)
            {
              [a1[4] setObject:v24 forKeyedSubscript:v23];
              v25 = [v32 objectForKeyedSubscript:v23];
              [a1[5] setObject:v25 forKeyedSubscript:v23];

              id v26 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
              id v27 = a1[6];
              a1[6] = v26;

              if (v12 && [v24 passType] == 1)
              {
                v33[0] = MEMORY[0x1E4F143A8];
                v33[1] = 3221225472;
                v33[2] = __55__PKGroup_initWithCatalogGroup_passes_states_accounts___block_invoke;
                v33[3] = &unk_1E56F4A18;
                id v34 = v24;
                v28 = objc_msgSend(v12, "pk_anyObjectPassingTest:", v33);
                [a1[6] setObject:v28 forKeyedSubscript:v23];
              }
            }
            else
            {
              [v31 removeObject:v23];
            }
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v20);
      }

      id v10 = v30;
    }
  }

  return a1;
}

- (unint64_t)passCount
{
  v2 = [(PKCatalogGroup *)self->_catalogGroup uniqueIDs];
  unint64_t v3 = [v2 count];

  return v3;
}

- (id)passAtIndex:(unint64_t)a3
{
  v5 = [(PKCatalogGroup *)self->_catalogGroup uniqueIDs];
  if ([v5 count] <= a3)
  {
    v7 = 0;
  }
  else
  {
    v6 = [v5 objectAtIndex:a3];
    v7 = [(NSMutableDictionary *)self->_passes objectForKey:v6];
  }
  return v7;
}

- (unint64_t)frontmostPassIndex
{
  return self->_frontmostPassIndex;
}

- (id)stateAtIndex:(unint64_t)a3
{
  v4 = [(PKGroup *)self passAtIndex:a3];
  v5 = v4;
  if (v4)
  {
    v6 = [v4 uniqueID];
    v7 = [(PKGroup *)self stateForPassUniqueID:v6];
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)stateForPassUniqueID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_states objectForKeyedSubscript:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_states, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_catalogGroup, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)addGroupObserver:(id)a3
{
  id v7 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_observers;
    self->_observers = v5;

    observers = self->_observers;
  }
  [(NSHashTable *)observers addObject:v7];
  os_unfair_lock_unlock(&self->_observersLock);
}

- (id)passes
{
  return (id)[(NSMutableDictionary *)self->_passes allValues];
}

- (PKGroup)init
{
  return 0;
}

uint64_t __55__PKGroup_initWithCatalogGroup_passes_states_accounts___block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = [a2 accountIdentifier];
  v4 = [*(id *)(a1 + 32) associatedAccountServiceAccountIdentifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (id)description
{
  unint64_t v3 = NSString;
  v4 = [(PKCatalogGroup *)self->_catalogGroup groupID];
  id v5 = [(PKCatalogGroup *)self->_catalogGroup uniqueIDs];
  id v6 = [v3 stringWithFormat:@"(%@) %@", v4, v5];

  return v6;
}

- (id)associatedAccountForPassAtIndex:(unint64_t)a3
{
  v4 = [(PKGroup *)self passAtIndex:a3];
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 uniqueID];
    id v7 = [(PKGroup *)self associatedAccountForPassUniqueID:v6];
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)associatedAccountForPassUniqueID:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_accounts objectForKeyedSubscript:a3];
}

- (void)updateAssociatedAccount:(uint64_t)a1
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v28 = a2;
  if (a1)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v3 = *(id *)(a1 + 32);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v34 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(a1 + 32) objectForKeyedSubscript:*(void *)(*((void *)&v33 + 1) + 8 * i)];
          if ([v8 passType] == 1)
          {
            v9 = [v8 associatedAccountServiceAccountIdentifier];
            id v10 = [v28 accountIdentifier];
            id v11 = v9;
            id v12 = v10;
            if (v11 == v12)
            {

LABEL_20:
              id v16 = *(void **)(a1 + 48);
              id v17 = objc_msgSend(v8, "uniqueID", v3);
              v18 = [v16 objectForKey:v17];

              uint64_t v19 = *(void **)(a1 + 48);
              uint64_t v20 = [v8 uniqueID];
              [v19 setObject:v28 forKey:v20];

              uint64_t v21 = -[PKGroup observers](a1);
              long long v29 = 0u;
              long long v30 = 0u;
              long long v31 = 0u;
              long long v32 = 0u;
              uint64_t v22 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v30;
                do
                {
                  for (uint64_t j = 0; j != v23; ++j)
                  {
                    if (*(void *)v30 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    id v26 = *(void **)(*((void *)&v29 + 1) + 8 * j);
                    if (v18)
                    {
                      if (objc_opt_respondsToSelector()) {
                        [v26 group:a1 didUpdateAssociatedAccount:v28 forPass:v8];
                      }
                    }
                    else if (objc_opt_respondsToSelector())
                    {
                      [v26 group:a1 didInsertAssociatedAccount:v28 forPass:v8];
                    }
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v29 objects:v37 count:16];
                }
                while (v23);
              }

              id v3 = v27;
              goto LABEL_33;
            }
            v13 = v12;
            if (v11) {
              BOOL v14 = v12 == 0;
            }
            else {
              BOOL v14 = 1;
            }
            if (v14)
            {
            }
            else
            {
              char v15 = [v11 isEqualToString:v12];

              if (v15) {
                goto LABEL_20;
              }
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_33:
  }
}

- (id)observers
{
  v2 = (os_unfair_lock_s *)(a1 + 16);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
  id v3 = [*(id *)(a1 + 8) allObjects];
  uint64_t v4 = (void *)[v3 copy];

  os_unfair_lock_unlock(v2);
  return v4;
}

- (void)_moveUniqueID:(uint64_t)a3 toIndex:(int)a4 notify:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  uint64_t v8 = -[PKGroup _indexOfUniqueID:](*(void **)(a1 + 24), v7);
  if (v8 != a3)
  {
    uint64_t v9 = v8;
    id v10 = [*(id *)(a1 + 24) uniqueIDs];
    [v10 removeObjectAtIndex:v9];
    [v10 insertObject:v7 atIndex:a3];
    if (a4)
    {
      id v11 = -[PKGroup observers](a1);
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v17;
        do
        {
          uint64_t v15 = 0;
          do
          {
            if (*(void *)v17 != v14) {
              objc_enumerationMutation(v11);
            }
            [*(id *)(*((void *)&v16 + 1) + 8 * v15++) group:a1 didMovePassFromIndex:v9 toIndex:a3];
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v20 count:16];
        }
        while (v13);
      }
    }
  }
}

- (unint64_t)indexForPassUniqueID:(id)a3
{
  catalogGroup = self->_catalogGroup;
  id v4 = a3;
  uint64_t v5 = [(PKCatalogGroup *)catalogGroup uniqueIDs];
  unint64_t v6 = [v5 indexOfObject:v4];

  return v6;
}

- (uint64_t)_indexOfUniqueID:(void *)a1
{
  id v3 = a2;
  id v4 = [a1 uniqueIDs];
  uint64_t v5 = [v4 indexOfObject:v3];

  return v5;
}

uint64_t __85__PKGroup_updateWithCatalogGroup_passes_states_accounts_expiredSectionPasses_notify___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 accountIdentifier];
  id v4 = [*(id *)(a1 + 32) associatedAccountServiceAccountIdentifier];
  id v5 = v3;
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
    uint64_t v8 = 1;
  }
  else
  {
    uint64_t v8 = 0;
    if (v5 && v6) {
      uint64_t v8 = [v5 isEqualToString:v6];
    }
  }

  return v8;
}

- (void)_removeUniqueID:(int)a3 notify:
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = [a1[4] objectForKey:v5];
  uint64_t v7 = -[PKGroup _indexOfUniqueID:](a1[3], v5);
  [a1[4] removeObjectForKey:v5];
  [a1[5] removeObjectForKey:v5];
  uint64_t v8 = [a1[3] uniqueIDs];
  [v8 removeObjectAtIndex:v7];

  if (a3)
  {
    uint64_t v9 = -[PKGroup observers]((uint64_t)a1);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v15;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v15 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v14 + 1) + 8 * v13++) group:a1 didRemovePass:v6 atIndex:v7];
        }
        while (v11 != v13);
        uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v11);
    }
  }
}

- (uint64_t)containsPassesInAdditionToUniqueID:(uint64_t)a1
{
  id v3 = a2;
  if (a1
    && ([*(id *)(a1 + 24) uniqueIDs],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        v5))
  {
    uint64_t v6 = 1;
    if (v3 && v5 == 1)
    {
      uint64_t v7 = [*(id *)(a1 + 24) uniqueIDs];
      id v8 = [v7 objectAtIndexedSubscript:0];
      id v9 = v3;
      if (v8 == v9)
      {
        uint64_t v6 = 0;
      }
      else if (v8)
      {
        uint64_t v6 = [v8 isEqualToString:v9] ^ 1;
      }
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)removeGroupObserver:(id)a3
{
  p_observersLock = &self->_observersLock;
  id v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  [(NSHashTable *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_observersLock);
}

- (void)setFrontmostPassIndex:(unint64_t)a3
{
  self->_frontmostPassIndex = a3;
}

@end