@interface REArrayDiff
+ (id)_createSetFromElementArray:(id)a3 equalComparator:(id)a4 hashGenerator:(id)a5;
+ (id)_indexSetFromSet:(id)a3;
+ (id)diffFromElements:(id)a3 toElements:(id)a4;
+ (id)diffFromElements:(id)a3 toElements:(id)a4 equalComparator:(id)a5 hashGenerator:(id)a6 changeComparator:(id)a7;
- (NSArray)allOperations;
- (void)enumerateOperationsUsingBlock:(id)a3;
@end

@implementation REArrayDiff

+ (id)diffFromElements:(id)a3 toElements:(id)a4
{
  return (id)[a1 diffFromElements:a3 toElements:a4 equalComparator:&__block_literal_global_71 hashGenerator:&__block_literal_global_91 changeComparator:&__block_literal_global_93];
}

uint64_t __43__REArrayDiff_diffFromElements_toElements___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:");
}

uint64_t __43__REArrayDiff_diffFromElements_toElements___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 hash];
}

uint64_t __43__REArrayDiff_diffFromElements_toElements___block_invoke_3()
{
  return 0;
}

+ (id)diffFromElements:(id)a3 toElements:(id)a4 equalComparator:(id)a5 hashGenerator:(id)a6 changeComparator:(id)a7
{
  uint64_t v128 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v91 = (uint64_t (**)(id, void *, void *))a7;
  v82 = objc_opt_new();
  v74 = v12;
  v16 = [a1 _createSetFromElementArray:v12 equalComparator:v14 hashGenerator:v15];
  id v72 = a1;
  v78 = v14;
  v80 = v13;
  v76 = v15;
  v17 = [a1 _createSetFromElementArray:v13 equalComparator:v14 hashGenerator:v15];
  uint64_t v18 = [MEMORY[0x263EFF9C0] set];
  v19 = [MEMORY[0x263EFF9C0] set];
  long long v121 = 0u;
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  id v20 = v16;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v121 objects:v127 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v122;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v122 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v121 + 1) + 8 * i);
        if ([v17 containsObject:v25]) {
          v26 = v19;
        }
        else {
          v26 = (void *)v18;
        }
        [v26 addObject:v25];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v121 objects:v127 count:16];
    }
    while (v22);
  }
  v84 = (void *)v18;

  uint64_t v27 = [MEMORY[0x263EFF9C0] set];
  uint64_t v28 = [MEMORY[0x263EFF9C0] set];
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  long long v120 = 0u;
  obuint64_t j = v17;
  uint64_t v29 = [obj countByEnumeratingWithState:&v117 objects:v126 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v118;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v118 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void *)(*((void *)&v117 + 1) + 8 * j);
        if ([v20 containsObject:v33]) {
          v34 = (void *)v28;
        }
        else {
          v34 = (void *)v27;
        }
        [v34 addObject:v33];
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v117 objects:v126 count:16];
    }
    while (v30);
  }
  v69 = (void *)v28;
  v83 = (void *)v27;
  v81 = v20;

  v90 = [MEMORY[0x263F089C8] indexSet];
  v87 = [MEMORY[0x263EFF9A0] dictionary];
  v89 = [MEMORY[0x263F089C8] indexSet];
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  id v35 = v19;
  uint64_t v36 = [v35 countByEnumeratingWithState:&v113 objects:v125 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v114;
    uint64_t v85 = *MEMORY[0x263EFF498];
    do
    {
      for (uint64_t k = 0; k != v37; ++k)
      {
        if (*(void *)v114 != v38) {
          objc_enumerationMutation(v35);
        }
        v40 = *(void **)(*((void *)&v113 + 1) + 8 * k);
        v41 = [obj member:v40];
        if (!v41)
        {
          v42 = (void *)MEMORY[0x263EFF940];
          v43 = [v40 object];
          [v42 raise:v85, @"Missing object %@ in toSet", v43 format];
        }
        v44 = [v40 object];
        v45 = [v41 object];
        int v46 = v91[2](v91, v44, v45);

        uint64_t v47 = [v40 index];
        if (v46)
        {
          [v90 addIndex:v47];
          v48 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v40, "index"));
          [v87 setObject:v41 forKeyedSubscript:v48];
        }
        else
        {
          [v89 addIndex:v47];
        }
      }
      uint64_t v37 = [v35 countByEnumeratingWithState:&v113 objects:v125 count:16];
    }
    while (v37);
  }
  v71 = v35;

  v49 = [v72 _indexSetFromSet:v84];
  v68 = [v72 _indexSetFromSet:v83];
  v50 = [MEMORY[0x263EFF9C0] set];
  v51 = (void *)[v49 mutableCopy];
  v52 = (void *)[v68 mutableCopy];
  v105[0] = MEMORY[0x263EF8330];
  v105[1] = 3221225472;
  v105[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke;
  v105[3] = &unk_2644C0080;
  id v53 = v74;
  id v111 = v78;
  id v112 = v76;
  id v106 = v53;
  id v107 = v69;
  id v108 = v51;
  id v109 = v52;
  id v110 = v50;
  id v54 = v50;
  id v86 = v52;
  id v75 = v51;
  id v73 = v69;
  id v77 = v76;
  id v79 = v78;
  v55 = (void *)MEMORY[0x223C31700](v105);
  [v90 enumerateIndexesUsingBlock:v55];
  [v89 enumerateIndexesUsingBlock:v55];
  v56 = [MEMORY[0x263EFF980] array];
  v102[0] = MEMORY[0x263EF8330];
  v102[1] = 3221225472;
  v102[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_2;
  v102[3] = &unk_2644C00A8;
  id v103 = v87;
  id v57 = v56;
  id v104 = v57;
  id v88 = v87;
  [v90 enumerateIndexesUsingBlock:v102];
  v99[0] = MEMORY[0x263EF8330];
  v99[1] = 3221225472;
  v99[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_3;
  v99[3] = &unk_2644C00A8;
  id v100 = v53;
  id v58 = v57;
  id v101 = v58;
  id v70 = v53;
  [v49 enumerateIndexesWithOptions:2 usingBlock:v99];
  v59 = [v54 allObjects];
  v60 = [v59 sortedArrayUsingComparator:&__block_literal_global_108];
  v96[0] = MEMORY[0x263EF8330];
  v96[1] = 3221225472;
  v96[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_5;
  v96[3] = &unk_2644C00F0;
  id v61 = v80;
  id v97 = v61;
  id v62 = v58;
  id v98 = v62;
  [v60 enumerateObjectsUsingBlock:v96];

  v93[0] = MEMORY[0x263EF8330];
  v93[1] = 3221225472;
  v93[2] = __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_6;
  v93[3] = &unk_2644C00A8;
  id v94 = v61;
  id v63 = v62;
  id v95 = v63;
  id v64 = v61;
  [v68 enumerateIndexesUsingBlock:v93];
  v65 = (void *)v82[1];
  v82[1] = v63;
  id v66 = v63;

  return v82;
}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke(uint64_t a1, uint64_t a2)
{
  v14[2] = *MEMORY[0x263EF8340];
  v4 = [*(id *)(a1 + 32) objectAtIndex:a2];
  v5 = +[_REDiffItem itemWithObject:v4 index:a2 comparator:*(void *)(a1 + 72) hashGenerator:*(void *)(a1 + 80)];

  v6 = [*(id *)(a1 + 40) member:v5];
  uint64_t v7 = [v5 index];
  uint64_t v8 = v7 - objc_msgSend(*(id *)(a1 + 48), "countOfIndexesInRange:", 0, objc_msgSend(v5, "index"));
  uint64_t v9 = [v6 index];
  if (v8 != v9 - objc_msgSend(*(id *)(a1 + 56), "countOfIndexesInRange:", 0, objc_msgSend(v6, "index")))
  {
    uint64_t v10 = [v5 index];
    if (v10 != [v6 index])
    {
      v11 = *(void **)(a1 + 64);
      id v12 = (void *)MEMORY[0x263F088C8];
      v14[0] = [v5 index];
      v14[1] = [v6 index];
      id v13 = [v12 indexPathWithIndexes:v14 length:2];
      [v11 addObject:v13];

      objc_msgSend(*(id *)(a1 + 48), "addIndex:", objc_msgSend(v5, "index"));
      objc_msgSend(*(id *)(a1 + 56), "addIndex:", objc_msgSend(v6, "index"));
    }
  }
}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_2(uint64_t a1, uint64_t a2)
{
  v4 = *(void **)(a1 + 32);
  v5 = [NSNumber numberWithUnsignedInteger:a2];
  id v9 = [v4 objectForKeyedSubscript:v5];

  v6 = *(void **)(a1 + 40);
  uint64_t v7 = [v9 object];
  uint64_t v8 = +[REDiffOperation reloadWithItem:v7 atIndex:a2];
  [v6 addObject:v8];
}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a2];
  v4 = *(void **)(a1 + 40);
  v5 = +[REDiffOperation deleteWithItem:v6 atIndex:a2];
  [v4 addObject:v5];
}

uint64_t __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 indexAtPosition:0];
  uint64_t v5 = [v3 indexAtPosition:1];

  id v8 = [*(id *)(a1 + 32) objectAtIndex:v5];
  id v6 = *(void **)(a1 + 40);
  uint64_t v7 = +[REDiffOperation moveWithItem:v8 fromIndex:v4 toIndex:v5];
  [v6 addObject:v7];
}

void __90__REArrayDiff_diffFromElements_toElements_equalComparator_hashGenerator_changeComparator___block_invoke_6(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) objectAtIndex:a2];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = +[REDiffOperation insertWithItem:v6 atIndex:a2];
  [v4 addObject:v5];
}

- (void)enumerateOperationsUsingBlock:(id)a3
{
  id v4 = a3;
  allOperations = self->_allOperations;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__REArrayDiff_enumerateOperationsUsingBlock___block_invoke;
  v7[3] = &unk_2644C0118;
  id v8 = v4;
  id v6 = v4;
  [(NSArray *)allOperations enumerateObjectsUsingBlock:v7];
}

void __45__REArrayDiff_enumerateOperationsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 type];
  id v7 = [v3 item];
  uint64_t v5 = [v3 toIndex];
  uint64_t v6 = [v3 fromIndex];

  (*(void (**)(uint64_t, uint64_t, id, uint64_t, uint64_t))(v2 + 16))(v2, v4, v7, v5, v6);
}

+ (id)_indexSetFromSet:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F089C8] indexSet];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(v4, "addIndex:", objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "index", (void)v11));
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)_createSetFromElementArray:(id)a3 equalComparator:(id)a4 hashGenerator:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x263EFF9C0] set];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __72__REArrayDiff__createSetFromElementArray_equalComparator_hashGenerator___block_invoke;
  v24[3] = &unk_2644C0140;
  id v26 = v8;
  id v27 = v9;
  id v11 = v10;
  id v25 = v11;
  id v12 = v9;
  id v13 = v8;
  [v7 enumerateObjectsUsingBlock:v24];
  uint64_t v14 = [v11 count];
  if (v14 != [v7 count]) {
    RERaiseInternalException((void *)*MEMORY[0x263EFF498], @"Items in array are not unique: %@", v15, v16, v17, v18, v19, v20, (uint64_t)v7);
  }
  uint64_t v21 = v25;
  id v22 = v11;

  return v22;
}

void __72__REArrayDiff__createSetFromElementArray_equalComparator_hashGenerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v4 = +[_REDiffItem itemWithObject:a2 index:a3 comparator:*(void *)(a1 + 40) hashGenerator:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) addObject:v4];
}

- (NSArray)allOperations
{
  return self->_allOperations;
}

- (void).cxx_destruct
{
}

@end