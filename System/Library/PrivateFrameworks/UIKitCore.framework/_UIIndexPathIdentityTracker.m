@interface _UIIndexPathIdentityTracker
- (_UIIndexPathIdentityTracker)init;
- (id)_mappingIdentifierForSanitizedIndexPath:(uint64_t)a1;
- (id)currentIndexPathForIdentifier:(uint64_t)a1;
- (id)identifierForIndexPath:(uint64_t)a1;
- (id)initWithCollectionView:(id *)a1;
- (id)initWithTableView:(id *)a1;
- (void)_identifierBasedUpdateWithUpdateItems:(uint64_t)a1;
- (void)_manuallyUpdateWithUpdateItems:(uint64_t)a1;
- (void)enforceManualMapping;
- (void)reset;
- (void)updateWithUpdateItems:(uint64_t)a1;
@end

@implementation _UIIndexPathIdentityTracker

- (void)reset
{
  if (!a1) {
    return;
  }
  if (*(unsigned char *)(a1 + 40)) {
    goto LABEL_3;
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));

  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 8));
    id v9 = [v6 dataSource];
  }
  else
  {
    id v7 = objc_loadWeakRetained((id *)(a1 + 16));

    if (!v7)
    {
LABEL_3:
      id v9 = 0;
      goto LABEL_4;
    }
    id v8 = objc_loadWeakRetained((id *)(a1 + 16));
    id v9 = [v8 dataSource];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = v9;
    goto LABEL_5;
  }
LABEL_4:
  v2 = 0;
LABEL_5:
  objc_storeStrong((id *)(a1 + 24), v2);
  uint64_t v3 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v4 = *(void **)(a1 + 32);
  *(void *)(a1 + 32) = v3;
}

- (id)initWithTableView:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UIIndexPathIdentityTracker;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 1, v3);
      -[_UIIndexPathIdentityTracker reset]((uint64_t)a1);
    }
  }

  return a1;
}

- (id)initWithCollectionView:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    v6.receiver = a1;
    v6.super_class = (Class)_UIIndexPathIdentityTracker;
    v4 = (id *)objc_msgSendSuper2(&v6, sel_init);
    a1 = v4;
    if (v4)
    {
      objc_storeWeak(v4 + 2, v3);
      -[_UIIndexPathIdentityTracker reset]((uint64_t)a1);
    }
  }

  return a1;
}

- (id)_mappingIdentifierForSanitizedIndexPath:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (v3)
  {
    uint64_t v11 = 0;
    v12 = &v11;
    uint64_t v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__156;
    v15 = __Block_byref_object_dispose__156;
    id v16 = 0;
    objc_super v6 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __71___UIIndexPathIdentityTracker__mappingIdentifierForSanitizedIndexPath___block_invoke;
    v8[3] = &unk_1E5300620;
    id v9 = v3;
    v10 = &v11;
    _enumerateMapTableKeysAndObjectsUsingBlock(v6, v8);
    id v5 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)identifierForIndexPath:(uint64_t)a1
{
  id v3 = a2;
  v4 = v3;
  if (a1)
  {
    id v5 = _sanitizedIndexPath(v3);

    uint64_t v6 = -[_UIIndexPathIdentityTracker _mappingIdentifierForSanitizedIndexPath:](a1, v5);
    if (v6)
    {
      id v7 = (void *)v6;
      v4 = v5;
    }
    else
    {
      id v8 = *(id *)(a1 + 24);
      id v9 = v5;
      v4 = v9;
      if (v8)
      {
        if ([v9 length] == 1) {
          objc_msgSend(v8, "sectionIdentifierForIndex:", objc_msgSend(v4, "section"));
        }
        else {
        uint64_t v10 = [v8 itemIdentifierForIndexPath:v4];
        }
      }
      else
      {
        uint64_t v10 = objc_opt_new();
      }
      id v7 = (void *)v10;

      [*(id *)(a1 + 32) setObject:v4 forKey:v7];
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)currentIndexPathForIdentifier:(uint64_t)a1
{
  v4 = 0;
  if (a1 && a2)
  {
    v4 = [*(id *)(a1 + 32) objectForKey:a2];
    uint64_t v2 = vars8;
  }
  return v4;
}

- (void)_identifierBasedUpdateWithUpdateItems:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    if (!*(void *)(a1 + 24))
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:sel__identifierBasedUpdateWithUpdateItems_, a1, @"_UIIndexPathIdentityTracker.m", 216, @"Invalid parameter not satisfying: %@", @"_identityBasedDataSource != nil" object file lineNumber description];
    }
    v4 = (void *)[*(id *)(a1 + 32) copy];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __69___UIIndexPathIdentityTracker__identifierBasedUpdateWithUpdateItems___block_invoke;
    v6[3] = &unk_1E5300648;
    v6[4] = a1;
    _enumerateMapTableKeysAndObjectsUsingBlock(v4, v6);
  }
}

- (void)_manuallyUpdateWithUpdateItems:(uint64_t)a1
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    if (*(void *)(a1 + 24))
    {
      v32 = [MEMORY[0x1E4F28B00] currentHandler];
      [v32 handleFailureInMethod:sel__manuallyUpdateWithUpdateItems_, a1, @"_UIIndexPathIdentityTracker.m", 226, @"Invalid parameter not satisfying: %@", @"_identityBasedDataSource == nil" object file lineNumber description];
    }
    if ([*(id *)(a1 + 32) count])
    {
      v35 = objc_opt_new();
      v36 = objc_opt_new();
      v34 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v48 objects:v54 count:16];
      if (!v5) {
        goto LABEL_22;
      }
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v49;
      while (1)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v49 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v48 + 1) + 8 * i);
          uint64_t v10 = [v9 indexPathBeforeUpdate];
          uint64_t v11 = _sanitizedIndexPath(v10);

          v12 = [v9 indexPathAfterUpdate];
          uint64_t v13 = _sanitizedIndexPath(v12);

          if (!v9 || (uint64_t v14 = v9[10]) == 0)
          {
            v15 = v36;
            id v16 = v13;
LABEL_16:
            [v15 addObject:v16];
            goto LABEL_20;
          }
          if (v14 != 3)
          {
            if (v14 != 1) {
              goto LABEL_20;
            }
            v15 = v35;
            id v16 = v11;
            goto LABEL_16;
          }
          [v35 addObject:v11];
          [v36 addObject:v13];
          v17 = -[_UIIndexPathIdentityTracker _mappingIdentifierForSanitizedIndexPath:](a1, v11);
          if (v17) {
            [v34 setObject:v13 forKey:v17];
          }

LABEL_20:
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v48 objects:v54 count:16];
        if (!v6)
        {
LABEL_22:
          id v33 = v3;

          [v35 sortUsingSelector:sel_compare_];
          [v36 sortUsingSelector:sel_compare_];
          long long v46 = 0u;
          long long v47 = 0u;
          long long v44 = 0u;
          long long v45 = 0u;
          v18 = [v35 reverseObjectEnumerator];
          uint64_t v19 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            uint64_t v21 = *(void *)v45;
            do
            {
              for (uint64_t j = 0; j != v20; ++j)
              {
                if (*(void *)v45 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v44 + 1) + 8 * j);
                v24 = (void *)[*(id *)(a1 + 32) copy];
                v43[0] = MEMORY[0x1E4F143A8];
                v43[1] = 3221225472;
                v43[2] = __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke;
                v43[3] = &unk_1E5300670;
                v43[4] = v23;
                v43[5] = a1;
                _enumerateMapTableKeysAndObjectsUsingBlock(v24, v43);
              }
              uint64_t v20 = [v18 countByEnumeratingWithState:&v44 objects:v53 count:16];
            }
            while (v20);
          }

          long long v42 = 0u;
          long long v40 = 0u;
          long long v41 = 0u;
          long long v39 = 0u;
          id v25 = v36;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v39 objects:v52 count:16];
          if (v26)
          {
            uint64_t v27 = v26;
            uint64_t v28 = *(void *)v40;
            do
            {
              for (uint64_t k = 0; k != v27; ++k)
              {
                if (*(void *)v40 != v28) {
                  objc_enumerationMutation(v25);
                }
                uint64_t v30 = *(void *)(*((void *)&v39 + 1) + 8 * k);
                v31 = (void *)[*(id *)(a1 + 32) copy];
                v38[0] = MEMORY[0x1E4F143A8];
                v38[1] = 3221225472;
                v38[2] = __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke_2;
                v38[3] = &unk_1E5300670;
                v38[4] = v30;
                v38[5] = a1;
                _enumerateMapTableKeysAndObjectsUsingBlock(v31, v38);
              }
              uint64_t v27 = [v25 countByEnumeratingWithState:&v39 objects:v52 count:16];
            }
            while (v27);
          }

          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __62___UIIndexPathIdentityTracker__manuallyUpdateWithUpdateItems___block_invoke_3;
          v37[3] = &unk_1E5300648;
          v37[4] = a1;
          _enumerateMapTableKeysAndObjectsUsingBlock(v34, v37);

          id v3 = v33;
          break;
        }
      }
    }
  }
}

- (void)updateWithUpdateItems:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v5 = v3;
    if (*(void *)(a1 + 24)) {
      -[_UIIndexPathIdentityTracker _identifierBasedUpdateWithUpdateItems:](a1, v3);
    }
    else {
      -[_UIIndexPathIdentityTracker _manuallyUpdateWithUpdateItems:](a1, v3);
    }
    id v4 = v5;
  }
}

- (_UIIndexPathIdentityTracker)init
{
  v5.receiver = self;
  v5.super_class = (Class)_UIIndexPathIdentityTracker;
  uint64_t v2 = [(_UIIndexPathIdentityTracker *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    v2->_enforcesManualMapping = 1;
    -[_UIIndexPathIdentityTracker reset]((uint64_t)v2);
  }
  return v3;
}

- (void)enforceManualMapping
{
  self->_enforcesManualMapping = 1;
  -[_UIIndexPathIdentityTracker reset]((uint64_t)self);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapping, 0);
  objc_storeStrong(&self->_identityBasedDataSource, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_tableView);
}

@end