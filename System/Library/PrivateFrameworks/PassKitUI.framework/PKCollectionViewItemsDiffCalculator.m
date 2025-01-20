@interface PKCollectionViewItemsDiffCalculator
+ (id)calculateDiffBetweenOldItems:(id)a3 andNewItems:(id)a4 inSection:(int64_t)a5;
+ (id)calculateDiffBetweenOldSections:(id)a3 andNewSections:(id)a4 sectionIdentifier:(id)a5 sectionItemsAccessor:(id)a6 firstSectionIndex:(int64_t)a7;
@end

@implementation PKCollectionViewItemsDiffCalculator

+ (id)calculateDiffBetweenOldSections:(id)a3 andNewSections:(id)a4 sectionIdentifier:(id)a5 sectionItemsAccessor:(id)a6 firstSectionIndex:(int64_t)a7
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v55 = a6;
  v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (v11) {
    v15 = v11;
  }
  else {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v16 = v15;
  v59 = v12;
  if (v12) {
    v17 = v12;
  }
  else {
    v17 = v14;
  }
  id v18 = v17;
  v80[0] = MEMORY[0x1E4F143A8];
  v80[1] = 3221225472;
  v80[2] = __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke;
  v80[3] = &unk_1E59CED00;
  id v19 = v13;
  id v81 = v19;
  v57 = v18;
  v58 = v16;
  v20 = [v18 differenceFromArray:v16 withOptions:0 usingEquivalenceTest:v80];
  id v21 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v22 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v48 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v50 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  v60 = v20;
  v24 = [v20 removals];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v76 objects:v83 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v77 != v27) {
          objc_enumerationMutation(v24);
        }
        objc_msgSend(v22, "addIndex:", objc_msgSend(*(id *)(*((void *)&v76 + 1) + 8 * i), "index", v48) + a7);
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v76 objects:v83 count:16];
    }
    while (v26);
  }

  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  v29 = [v60 insertions];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v73;
    do
    {
      for (uint64_t j = 0; j != v31; ++j)
      {
        if (*(void *)v73 != v32) {
          objc_enumerationMutation(v29);
        }
        objc_msgSend(v21, "addIndex:", objc_msgSend(*(id *)(*((void *)&v72 + 1) + 8 * j), "index", v48) + a7);
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v72 objects:v82 count:16];
    }
    while (v31);
  }

  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke_2;
  v61[3] = &unk_1E59CED50;
  id v68 = v19;
  id v69 = v55;
  id v70 = a1;
  int64_t v71 = a7;
  id v62 = v11;
  id v63 = v51;
  id v64 = v50;
  id v65 = v23;
  id v66 = v48;
  id v67 = v49;
  id v34 = v49;
  id v35 = v48;
  id v36 = v23;
  id v37 = v50;
  id v38 = v51;
  id v54 = v55;
  id v56 = v11;
  id v52 = v19;
  [v57 enumerateObjectsUsingBlock:v61];
  v39 = objc_alloc_init(PKCollectionViewItemsDiff);
  v40 = (void *)[v21 copy];
  [(PKCollectionViewItemsDiff *)v39 setInsertedSections:v40];

  v41 = (void *)[v22 copy];
  [(PKCollectionViewItemsDiff *)v39 setDeletedSections:v41];

  v42 = (void *)[v38 copy];
  [(PKCollectionViewItemsDiff *)v39 setChangedIndexPaths:v42];

  v43 = (void *)[v37 copy];
  [(PKCollectionViewItemsDiff *)v39 setMovedFromIndexPaths:v43];

  v44 = (void *)[v36 copy];
  [(PKCollectionViewItemsDiff *)v39 setMovedToIndexPaths:v44];

  v45 = (void *)[v35 copy];
  [(PKCollectionViewItemsDiff *)v39 setDeletedIndexPaths:v45];

  v46 = (void *)[v34 copy];
  [(PKCollectionViewItemsDiff *)v39 setInsertedIndexPaths:v46];

  return v39;
}

uint64_t __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void *)(a1 + 32);
  v6 = *(void (**)(uint64_t, uint64_t))(v5 + 16);
  id v7 = a3;
  v8 = v6(v5, a2);
  v9 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  uint64_t v10 = [v8 isEqual:v9];
  return v10;
}

void __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v24 = MEMORY[0x1E4F143A8];
  uint64_t v25 = 3221225472;
  uint64_t v26 = __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke_3;
  uint64_t v27 = &unk_1E59CED28;
  id v6 = v4;
  id v28 = v6;
  id v29 = *(id *)(a1 + 80);
  uint64_t v7 = [v5 indexOfObjectPassingTest:&v24];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v8 = v7;
    v9 = objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v7, v24, v25, v26, v27, v28);
    uint64_t v10 = *(void **)(a1 + 96);
    id v11 = (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    id v12 = (*(void (**)(void))(*(void *)(a1 + 88) + 16))();
    id v13 = [v10 calculateDiffBetweenOldItems:v11 andNewItems:v12 inSection:*(void *)(a1 + 104) + v8];

    v14 = *(void **)(a1 + 40);
    v15 = [v13 changedIndexPaths];
    [v14 addObjectsFromArray:v15];

    id v16 = *(void **)(a1 + 48);
    v17 = [v13 movedFromIndexPaths];
    [v16 addObjectsFromArray:v17];

    id v18 = *(void **)(a1 + 56);
    id v19 = [v13 movedToIndexPaths];
    [v18 addObjectsFromArray:v19];

    v20 = *(void **)(a1 + 64);
    id v21 = [v13 deletedIndexPaths];
    [v20 addObjectsFromArray:v21];

    id v22 = *(void **)(a1 + 72);
    id v23 = [v13 insertedIndexPaths];
    [v22 addObjectsFromArray:v23];
  }
}

uint64_t __143__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldSections_andNewSections_sectionIdentifier_sectionItemsAccessor_firstSectionIndex___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v3 = [v1 isEqual:v2];

  return v3;
}

+ (id)calculateDiffBetweenOldItems:(id)a3 andNewItems:(id)a4 inSection:(int64_t)a5
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x1E4F1CBF0];
  v47 = v7;
  if (v7) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v11 = v10;
  v45 = v11;
  v46 = v8;
  if (v8) {
    id v12 = v8;
  }
  else {
    id v12 = v9;
  }
  id v13 = [v12 differenceFromArray:v11 withOptions:4];
  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v49 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldItems_andNewItems_inSection___block_invoke;
  aBlock[3] = &unk_1E59CED78;
  int64_t v50 = a5;
  int64_t v66 = a5;
  id v43 = v15;
  id v64 = v43;
  id v42 = v16;
  id v65 = v42;
  v17 = (void (**)(void *, void *))_Block_copy(aBlock);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id v48 = v13;
  id v18 = [v13 removals];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v59 objects:v69 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v60 != v21) {
          objc_enumerationMutation(v18);
        }
        id v23 = *(void **)(*((void *)&v59 + 1) + 8 * i);
        if ([v23 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v24 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v23, "index"), v50);
          [v14 addObject:v24];
        }
        else
        {
          v17[2](v17, v23);
        }
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v59 objects:v69 count:16];
    }
    while (v20);
  }

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  uint64_t v25 = [v13 insertions];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v55 objects:v68 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v56;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v56 != v28) {
          objc_enumerationMutation(v25);
        }
        uint64_t v30 = *(void **)(*((void *)&v55 + 1) + 8 * j);
        if ([v30 associatedIndex] == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v31 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", objc_msgSend(v30, "index"), v50);
          [v49 addObject:v31];
        }
        else
        {
          v17[2](v17, v30);
        }
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v55 objects:v68 count:16];
    }
    while (v27);
  }

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id v32 = v49;
  uint64_t v33 = [v32 countByEnumeratingWithState:&v51 objects:v67 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v52;
    do
    {
      for (uint64_t k = 0; k != v34; ++k)
      {
        if (*(void *)v52 != v35) {
          objc_enumerationMutation(v32);
        }
        uint64_t v37 = *(void *)(*((void *)&v51 + 1) + 8 * k);
        if ([v14 containsObject:v37])
        {
          [v14 removeObject:v37];
          [v44 addObject:v37];
        }
      }
      uint64_t v34 = [v32 countByEnumeratingWithState:&v51 objects:v67 count:16];
    }
    while (v34);
  }

  [v32 removeObjectsInArray:v44];
  id v38 = objc_alloc_init(PKCollectionViewItemsDiff);
  id v39 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  [(PKCollectionViewItemsDiff *)v38 setInsertedSections:v39];

  id v40 = objc_alloc_init(MEMORY[0x1E4F28D60]);
  [(PKCollectionViewItemsDiff *)v38 setDeletedSections:v40];

  [(PKCollectionViewItemsDiff *)v38 setChangedIndexPaths:v44];
  [(PKCollectionViewItemsDiff *)v38 setMovedFromIndexPaths:v43];
  [(PKCollectionViewItemsDiff *)v38 setMovedToIndexPaths:v42];
  [(PKCollectionViewItemsDiff *)v38 setDeletedIndexPaths:v14];
  [(PKCollectionViewItemsDiff *)v38 setInsertedIndexPaths:v32];

  return v38;
}

void __90__PKCollectionViewItemsDiffCalculator_calculateDiffBetweenOldItems_andNewItems_inSection___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28D58];
  id v4 = a2;
  objc_msgSend(v3, "indexPathForItem:inSection:", objc_msgSend(v4, "associatedIndex"), *(void *)(a1 + 48));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = (void *)MEMORY[0x1E4F28D58];
  uint64_t v6 = [v4 index];

  id v7 = [v5 indexPathForItem:v6 inSection:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addObject:v8];
  [*(id *)(a1 + 40) addObject:v7];
}

@end