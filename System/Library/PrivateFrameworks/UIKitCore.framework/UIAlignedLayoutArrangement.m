@interface UIAlignedLayoutArrangement
@end

@implementation UIAlignedLayoutArrangement

void __66___UIAlignedLayoutArrangement__addIndividualConstraintsIfPossible__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = [v6 objectEnumerator];
  v8 = [v7 nextObject];
  v9 = [v8 firstItem];

  if (v9)
  {
    id v26 = v5;
    uint64_t v28 = [*(id *)(a1 + 32) _attributeForConstraintGroupName:v5];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v35;
      uint64_t v27 = *(void *)v35;
      do
      {
        uint64_t v14 = 0;
        uint64_t v29 = v12;
        do
        {
          if (*(void *)v35 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v34 + 1) + 8 * v14);
          if (v15 == v9)
          {
            long long v32 = 0u;
            long long v33 = 0u;
            long long v30 = 0u;
            long long v31 = 0u;
            v17 = [v6 objectEnumerator];
            uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
            if (v18)
            {
              uint64_t v19 = v18;
              v20 = v9;
              id v21 = v6;
              uint64_t v22 = a1;
              uint64_t v23 = *(void *)v31;
              do
              {
                for (uint64_t i = 0; i != v19; ++i)
                {
                  if (*(void *)v31 != v23) {
                    objc_enumerationMutation(v17);
                  }
                  v25 = *(void **)(*((void *)&v30 + 1) + 8 * i);
                  if (([v25 isActive] & 1) == 0) {
                    [v25 setActive:1];
                  }
                }
                uint64_t v19 = [v17 countByEnumeratingWithState:&v30 objects:v38 count:16];
              }
              while (v19);
              a1 = v22;
              id v6 = v21;
              v9 = v20;
              uint64_t v13 = v27;
              uint64_t v12 = v29;
            }
          }
          else
          {
            v16 = [v6 objectForKey:*(void *)(*((void *)&v34 + 1) + 8 * v14)];
            v17 = v16;
            if (v16)
            {
              if (([v16 isActive] & 1) == 0) {
                [v17 setActive:1];
              }
            }
            else
            {
              [*(id *)(a1 + 32) _setUpConstraintForItem:v15 referenceItem:v9 attribute:v28 inConstraintsTable:v6];
            }
          }

          ++v14;
        }
        while (v14 != v12);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v12);
    }

    id v5 = v26;
  }
}

void __62___UIAlignedLayoutArrangement__addConstraintGroupsAsNecessary__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [*(id *)(a1 + 32) _attributeForConstraintGroupName:a2];
  if ([v5 count] || !objc_msgSend(*(id *)(a1 + 32), "_wantsConstraintsForAttribute:", v6)) {
    goto LABEL_34;
  }
  v7 = [*(id *)(a1 + 40) firstObject];
  v8 = v7;
  if ((v6 - 11) > 1 || v7 == 0) {
    goto LABEL_20;
  }
  if (([v7 _hasBaseline] & 1) == 0)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v28 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          if ([v15 _hasBaseline]
            && [*(id *)(a1 + 32) _itemWantsLayoutAsIfVisible:v15])
          {
            id v16 = v15;

            v8 = v16;
            goto LABEL_19;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
LABEL_19:

LABEL_20:
    if (!v8) {
      goto LABEL_34;
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v17 = *(id *)(a1 + 40);
  uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v24;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v24 != v20) {
          objc_enumerationMutation(v17);
        }
        if (v8 != *(void **)(*((void *)&v23 + 1) + 8 * j) || (unint64_t)(v6 - 7) <= 1) {
          objc_msgSend(*(id *)(a1 + 32), "_setUpConstraintForItem:referenceItem:attribute:inConstraintsTable:", (void)v23);
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v19);
  }

LABEL_34:
}

void __62___UIAlignedLayoutArrangement__addConstraintGroupsAsNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_wantsConstraintsForAttribute:", objc_msgSend(*(id *)(a1 + 32), "_attributeForConstraintGroupName:")))
  {
    v3 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKey:v5];

    if (!v3)
    {
      v4 = (void *)[objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:512 valueOptions:512 capacity:0];
      [*(id *)(*(void *)(a1 + 32) + 120) setObject:v4 forKey:v5];
    }
  }
}

uint64_t __44___UIAlignedLayoutArrangement_setAlignment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAlignment:*(void *)(a1 + 32)];
}

void __65___UIAlignedLayoutArrangement__removeConstraintGroupsAsNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  id v8 = v3;
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v6 = *(void *)(*(void *)(a1 + 32) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v3 = v8;
    v4 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  [v4 addObject:v3];
}

void __65___UIAlignedLayoutArrangement__removeConstraintGroupsAsNecessary__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:v3];
  id v5 = [v4 objectEnumerator];
  uint64_t v6 = [v5 nextObject];

  v7 = [v6 firstItem];
  if (v7)
  {
    if ([*(id *)(a1 + 40) containsObject:v7])
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      goto LABEL_30;
    }
    if (*(unsigned char *)(a1 + 72) || *(unsigned char *)(a1 + 73))
    {
      id v8 = [*(id *)(a1 + 32) items];
      unint64_t v9 = [v8 indexOfObject:v7];

      if (v9)
      {
        long long v25 = v6;
        long long v26 = v4;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        id v10 = *(id *)(a1 + 48);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v32;
LABEL_9:
          uint64_t v14 = 0;
          while (1)
          {
            if (*(void *)v32 != v13) {
              objc_enumerationMutation(v10);
            }
            v15 = *(void **)(*((void *)&v31 + 1) + 8 * v14);
            if (objc_msgSend(v15, "_hasBaseline", v25, v26))
            {
              id v16 = [*(id *)(a1 + 32) items];
              unint64_t v17 = [v16 indexOfObject:v15];

              if (v17 < v9) {
                break;
              }
            }
            if (v12 == ++v14)
            {
              uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v36 count:16];
              if (v12) {
                goto LABEL_9;
              }
              goto LABEL_16;
            }
          }
        }
        else
        {
LABEL_16:

          uint64_t v6 = v25;
          v4 = v26;
          if (!*(unsigned char *)(a1 + 73)) {
            goto LABEL_30;
          }
          long long v29 = 0u;
          long long v30 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v10 = *(id *)(a1 + 56);
          uint64_t v18 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
          if (!v18)
          {
LABEL_29:

            uint64_t v6 = v25;
            v4 = v26;
            goto LABEL_30;
          }
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v28;
LABEL_19:
          uint64_t v21 = 0;
          while (1)
          {
            if (*(void *)v28 != v20) {
              objc_enumerationMutation(v10);
            }
            uint64_t v22 = *(void **)(*((void *)&v27 + 1) + 8 * v21);
            if (objc_msgSend(v22, "_hasBaseline", v25, v26, (void)v27))
            {
              if ([*(id *)(a1 + 32) _itemWantsLayoutAsIfVisible:v22])
              {
                long long v23 = [*(id *)(a1 + 32) items];
                unint64_t v24 = [v23 indexOfObject:v22];

                if (v24 < v9) {
                  break;
                }
              }
            }
            if (v19 == ++v21)
            {
              uint64_t v19 = [v10 countByEnumeratingWithState:&v27 objects:v35 count:16];
              if (v19) {
                goto LABEL_19;
              }
              goto LABEL_29;
            }
          }
        }
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
        goto LABEL_29;
      }
    }
  }
LABEL_30:
}

void __70___UIAlignedLayoutArrangement__removeIndividualConstraintsAsNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v3 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 120), "objectForKeyedSubscript:");
  v4 = (void *)[v3 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [v4 keyEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = *(void **)(a1 + 40);
        uint64_t v12 = [v4 objectForKey:v10];
        LODWORD(v11) = [v11 containsObject:v12];

        if (v11)
        {
          uint64_t v13 = [*(id *)(*(void *)(a1 + 32) + 120) objectForKeyedSubscript:v14];
          _UILACleanUpConstraintForItemInCollection(v10, v13);
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
}

@end