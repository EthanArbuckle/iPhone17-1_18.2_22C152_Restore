@interface PGMoodUtilities
+ (id)_momentNodesForAssetCollection:(id)a3 inGraph:(id)a4 moodOptions:(id)a5;
+ (id)moodGraphContextIdentifiersForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5;
+ (id)moodGraphContextIdentifiersForMomentNodes:(id)a3 inGraph:(id)a4 moodOptions:(id)a5;
+ (id)moodGraphNodeIdentifiersForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5;
+ (id)moodGraphNodeIdentifiersForMomentNodes:(id)a3;
+ (id)moodMeaningIdentifiersForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5;
+ (id)moodMeaningIdentifiersForMomentNodes:(id)a3;
+ (id)moodSceneIdentifiersByMomentForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5;
+ (id)moodSceneIdentifiersByMomentForMomentNodes:(id)a3;
@end

@implementation PGMoodUtilities

+ (id)_momentNodesForAssetCollection:(id)a3 inGraph:(id)a4 moodOptions:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v9 = [a5 momentIDs];
  if ([v9 count])
  {
    v10 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:v9 inGraph:v8];
    goto LABEL_16;
  }
  if ([v7 assetCollectionType] == 6)
  {
    v11 = [v7 uuid];
    v12 = +[PGGraphHighlightNodeCollection highlightNodeForUUID:v11 inGraph:v8];
    v10 = [v12 momentNodes];

LABEL_7:
    goto LABEL_16;
  }
  if ([v7 assetCollectionType] == 3)
  {
    v11 = [v7 uuid];
    v10 = +[PGGraphMomentNodeCollection momentNodeForUUID:v11 inGraph:v8];
    goto LABEL_7;
  }
  v13 = PGMomentsForAssetCollection((uint64_t)v7);
  v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v13, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v15 = v13;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v23 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "uuid", (void)v22);
        [v14 addObject:v20];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v17);
  }

  v10 = +[PGGraphMomentNodeCollection momentNodesForUUIDs:v14 inGraph:v8];

LABEL_16:
  return v10;
}

+ (id)moodGraphContextIdentifiersForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a1 _momentNodesForAssetCollection:a3 inGraph:v9 moodOptions:v8];
  v11 = [a1 moodGraphContextIdentifiersForMomentNodes:v10 inGraph:v9 moodOptions:v8];

  return v11;
}

+ (id)moodGraphContextIdentifiersForMomentNodes:(id)a3 inGraph:(id)a4 moodOptions:(id)a5
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v49 = a3;
  id v7 = a4;
  id v50 = a5;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v155 = 0;
  v156 = &v155;
  uint64_t v157 = 0x2020000000;
  char v158 = 1;
  uint64_t v151 = 0;
  v152 = &v151;
  uint64_t v153 = 0x2020000000;
  char v154 = 1;
  uint64_t v147 = 0;
  v148 = &v147;
  uint64_t v149 = 0x2020000000;
  char v150 = 1;
  uint64_t v143 = 0;
  v144 = &v143;
  uint64_t v145 = 0x2020000000;
  char v146 = 1;
  uint64_t v139 = 0;
  v140 = &v139;
  uint64_t v141 = 0x2020000000;
  char v142 = 1;
  uint64_t v135 = 0;
  v136 = &v135;
  uint64_t v137 = 0x2020000000;
  char v138 = 1;
  uint64_t v131 = 0;
  v132 = &v131;
  uint64_t v133 = 0x2020000000;
  char v134 = 1;
  uint64_t v127 = 0;
  v128 = &v127;
  uint64_t v129 = 0x2020000000;
  char v130 = 1;
  uint64_t v123 = 0;
  v124 = &v123;
  uint64_t v125 = 0x2020000000;
  char v126 = 1;
  uint64_t v119 = 0;
  v120 = &v119;
  uint64_t v121 = 0x2020000000;
  char v122 = 1;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x2020000000;
  char v118 = 1;
  uint64_t v111 = 0;
  v112 = &v111;
  uint64_t v113 = 0x2020000000;
  char v114 = 1;
  id v9 = [v50 moodGenerationContext];
  v10 = v9;
  if (v9)
  {
    v11 = v9;
  }
  else
  {
    v12 = [PGMoodGenerationContext alloc];
    v13 = [v50 referenceDate];
    v11 = [(PGMoodGenerationContext *)v12 initWithReferenceDate:v13];
  }
  v14 = [v7 meNode];
  id v15 = v14;
  uint64_t v105 = 0;
  v106 = &v105;
  uint64_t v107 = 0x3032000000;
  v108 = __Block_byref_object_copy__66680;
  v109 = __Block_byref_object_dispose__66681;
  id v110 = 0;
  if (v14)
  {
    uint64_t v99 = 0;
    v100 = &v99;
    uint64_t v101 = 0x3032000000;
    v102 = __Block_byref_object_copy__66680;
    v103 = __Block_byref_object_dispose__66681;
    id v104 = 0;
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke;
    v98[3] = &unk_1E68EF0E8;
    v98[4] = &v99;
    [v14 enumeratePersonNodesWithRelationship:13 matchingQuery:3 usingBlock:v98];
    uint64_t v16 = (void *)v100[5];
    if (v16)
    {
      uint64_t v17 = [v16 collection];
      uint64_t v18 = [v17 socialGroupNodes];
      v97[0] = MEMORY[0x1E4F143A8];
      v97[1] = 3221225472;
      v97[2] = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_2;
      v97[3] = &unk_1E68EF118;
      v97[4] = &v105;
      [v18 enumerateNodesUsingBlock:v97];
    }
    _Block_object_dispose(&v99, 8);
  }
  else
  {
    *((unsigned char *)v156 + 24) = 0;
    *((unsigned char *)v152 + 24) = 0;
  }
  v19 = [v7 supersetCityNodes];
  if (![v19 count])
  {
    *((unsigned char *)v148 + 24) = 0;
    *((unsigned char *)v144 + 24) = 0;
    *((unsigned char *)v140 + 24) = 0;
  }
  v20 = (void *)MEMORY[0x1E4F1CAD0];
  v21 = [v7 bestSocialGroupNodes];
  long long v22 = [v20 setWithArray:v21];

  if (![v22 count])
  {
    if (!v106[5]) {
      *((unsigned char *)v128 + 24) = 0;
    }
    *((unsigned char *)v124 + 24) = 0;
    *((unsigned char *)v120 + 24) = 0;
  }
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x3032000000;
  v102 = __Block_byref_object_copy__66680;
  v103 = __Block_byref_object_dispose__66681;
  id v104 = 0;
  uint64_t v91 = 0;
  v92 = &v91;
  uint64_t v93 = 0x3032000000;
  v94 = __Block_byref_object_copy__66680;
  v95 = __Block_byref_object_dispose__66681;
  id v96 = 0;
  uint64_t v85 = 0;
  v86 = &v85;
  uint64_t v87 = 0x3032000000;
  v88 = __Block_byref_object_copy__66680;
  v89 = __Block_byref_object_dispose__66681;
  id v90 = 0;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_3;
  v63[3] = &unk_1E68EF198;
  v69 = &v115;
  long long v23 = v11;
  v64 = v23;
  v70 = &v111;
  v71 = &v155;
  v72 = &v151;
  v73 = &v147;
  v74 = &v143;
  v75 = &v139;
  id v47 = v15;
  id v65 = v47;
  id v24 = v19;
  id v66 = v24;
  v76 = &v85;
  v77 = &v135;
  v78 = &v131;
  id v48 = v22;
  id v67 = v48;
  v79 = &v105;
  v80 = &v127;
  v81 = &v123;
  v82 = &v119;
  id v25 = v7;
  id v68 = v25;
  v83 = &v91;
  v84 = &v99;
  [v49 enumerateNodesUsingBlock:v63];
  if (*((unsigned char *)v116 + 24))
  {
    long long v61 = 0u;
    long long v62 = 0u;
    long long v59 = 0u;
    long long v60 = 0u;
    id v26 = (id)v92[5];
    int v27 = 0;
    uint64_t v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v59, v161, 16, v47, v48);
    if (v28)
    {
      uint64_t v29 = *(void *)v60;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v60 != v29) {
            objc_enumerationMutation(v26);
          }
          if ((_BYTE)v27)
          {
            int v27 = 1;
            goto LABEL_26;
          }
          int v27 = [(PGMoodGenerationContext *)v23 socialGroupIsLongTimeNoSeeWithSocialGroupNode:*(void *)(*((void *)&v59 + 1) + 8 * i)];
        }
        uint64_t v28 = [v26 countByEnumeratingWithState:&v59 objects:v161 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }
LABEL_26:

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v31 = (id)v100[5];
    uint64_t v32 = [v31 countByEnumeratingWithState:&v55 objects:v160 count:16];
    if (v32)
    {
      uint64_t v33 = *(void *)v56;
      while (2)
      {
        for (uint64_t j = 0; j != v32; ++j)
        {
          if (*(void *)v56 != v33) {
            objc_enumerationMutation(v31);
          }
          if ((_BYTE)v27)
          {

            BOOL v35 = 1;
            goto LABEL_37;
          }
          int v27 = [(PGMoodGenerationContext *)v23 personIsLongTimeNoSeeWithPersonNode:*(void *)(*((void *)&v55 + 1) + 8 * j)];
        }
        uint64_t v32 = [v31 countByEnumeratingWithState:&v55 objects:v160 count:16];
        if (v32) {
          continue;
        }
        break;
      }
    }

    BOOL v35 = v27 != 0;
  }
  else
  {
    BOOL v35 = 0;
  }
LABEL_37:
  if (*((unsigned char *)v112 + 24))
  {
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v36 = (id)v86[5];
    uint64_t v37 = [v36 countByEnumeratingWithState:&v51 objects:v159 count:16];
    id v38 = v24;
    int v39 = 0;
    if (v37)
    {
      uint64_t v40 = *(void *)v52;
      while (2)
      {
        id v41 = v25;
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v52 != v40) {
            objc_enumerationMutation(v36);
          }
          if (v39)
          {
            int v39 = 1;
            id v25 = v41;
            goto LABEL_48;
          }
          int v39 = [(PGMoodGenerationContext *)v23 locationIsLongTimeNoSeeWithLocationNode:*(void *)(*((void *)&v51 + 1) + 8 * k)];
        }
        uint64_t v37 = [v36 countByEnumeratingWithState:&v51 objects:v159 count:16];
        id v25 = v41;
        if (v37) {
          continue;
        }
        break;
      }
    }
LABEL_48:

    id v24 = v38;
  }
  else
  {
    int v39 = 0;
  }
  if (*((unsigned char *)v156 + 24))
  {
    v43 = @"AtHome";
  }
  else if (*((unsigned char *)v152 + 24))
  {
    v43 = @"AtWork";
  }
  else if (*((unsigned char *)v148 + 24))
  {
    v43 = @"CurrentSuperset";
  }
  else if (*((unsigned char *)v144 + 24))
  {
    v43 = @"OtherSuperset";
  }
  else
  {
    if (!*((unsigned char *)v140 + 24)) {
      goto LABEL_61;
    }
    v43 = @"NoSuperset";
  }
  objc_msgSend(v8, "addObject:", v43, v47);
LABEL_61:
  if (*((unsigned char *)v136 + 24))
  {
    v44 = @"NoPeople";
  }
  else
  {
    if (!*((unsigned char *)v132 + 24)) {
      goto LABEL_66;
    }
    v44 = @"Crowd";
  }
  objc_msgSend(v8, "addObject:", v44, v47);
LABEL_66:
  if (*((unsigned char *)v128 + 24))
  {
    v45 = @"BestPairSocialGroup";
  }
  else if (*((unsigned char *)v124 + 24))
  {
    v45 = @"BestSocialGroups";
  }
  else
  {
    if (!*((unsigned char *)v120 + 24)) {
      goto LABEL_73;
    }
    v45 = @"OtherSocialGroups";
  }
  objc_msgSend(v8, "addObject:", v45, v47);
LABEL_73:
  if (v35) {
    [v8 addObject:@"LongTimeNoSeePeople"];
  }
  if (v39) {
    [v8 addObject:@"LongTimeNoSeeLocation"];
  }

  _Block_object_dispose(&v85, 8);
  _Block_object_dispose(&v91, 8);

  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v105, 8);

  _Block_object_dispose(&v111, 8);
  _Block_object_dispose(&v115, 8);
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(&v131, 8);
  _Block_object_dispose(&v135, 8);
  _Block_object_dispose(&v139, 8);
  _Block_object_dispose(&v143, 8);
  _Block_object_dispose(&v147, 8);
  _Block_object_dispose(&v151, 8);
  _Block_object_dispose(&v155, 8);

  return v8;
}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  *a4 = 1;
}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 countOfEdgesWithLabel:@"BELONGSTO" domain:302] == 1)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  if (*(unsigned char *)(v4 + 24))
  {
    char v5 = [*(id *)(a1 + 32) momentIsLongTimeNoSeeForPeopleWithMomentNode:v3];
    uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  }
  else
  {
    char v5 = 0;
  }
  *(unsigned char *)(v4 + 24) = v5;
  uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    char v7 = [*(id *)(a1 + 32) momentIsLongTimeNoSeeForLocationWithMomentNode:v3];
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
  }
  else
  {
    char v7 = 0;
  }
  *(unsigned char *)(v6 + 24) = v7;
  if (([v3 hasAddressNodes] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 112) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 120) + 8) + 24) = 0;
  }
  id v8 = [MEMORY[0x1E4F1CA80] set];
  id v9 = [v3 collection];
  v10 = [v9 addressNodes];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_4;
  v40[3] = &unk_1E68EF168;
  id v41 = *(id *)(a1 + 40);
  long long v45 = *(_OWORD *)(a1 + 88);
  id v42 = *(id *)(a1 + 48);
  id v11 = v8;
  uint64_t v12 = *(void *)(a1 + 120);
  id v43 = v11;
  uint64_t v46 = v12;
  id v13 = v3;
  id v44 = v13;
  int8x16_t v47 = vextq_s8(*(int8x16_t *)(a1 + 104), *(int8x16_t *)(a1 + 104), 8uLL);
  [v10 enumerateNodesUsingBlock:v40];

  uint64_t v14 = *(void *)(*(void *)(a1 + 128) + 8);
  uint64_t v17 = *(void **)(v14 + 40);
  id v15 = (id *)(v14 + 40);
  uint64_t v16 = v17;
  if (v17) {
    [v16 intersectSet:v11];
  }
  else {
    objc_storeStrong(v15, v8);
  }
  unint64_t v18 = [v13 totalNumberOfPersons];
  if (v18)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 136) + 8) + 24) = 0;
    if (v18 <= 9) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 144) + 8) + 24) = 0;
    }
  }
  if ([*(id *)(a1 + 56) count] || *(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40))
  {
    if (([v13 hasEdgeWithLabel:@"SOCIALGROUP" domain:302] & 1) == 0)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 160) + 8) + 24) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 168) + 8) + 24) = 0;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 176) + 8) + 24) = 0;
    }
    v19 = [v13 socialGroupNodes];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v37 != v22) {
            objc_enumerationMutation(v19);
          }
          id v24 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (([v24 isSameNodeAsNode:*(void *)(*(void *)(*(void *)(a1 + 152) + 8) + 40)] & 1) == 0)
          {
            if (([*(id *)(a1 + 56) containsObject:v24] & 1) == 0)
            {
              *(unsigned char *)(*(void *)(*(void *)(a1 + 160) + 8) + 24) = 0;
              uint64_t v26 = a1 + 168;
LABEL_29:
              *(unsigned char *)(*(void *)(*(void *)v26 + 8) + 24) = 0;
              continue;
            }
            char v25 = [*(id *)(a1 + 64) isBestPairSocialGroup:v24];
            uint64_t v26 = a1 + 160;
            if ((v25 & 1) == 0) {
              goto LABEL_29;
            }
          }
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v36 objects:v48 count:16];
      }
      while (v21);
    }
    int v27 = *(void **)(*(void *)(*(void *)(a1 + 184) + 8) + 40);
    if (v27)
    {
      [v27 intersectSet:v19];
    }
    else
    {
      uint64_t v28 = [v19 mutableCopy];
      uint64_t v29 = *(void *)(*(void *)(a1 + 184) + 8);
      v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;
    }
  }
  id v31 = [v13 personNodes];
  uint64_t v32 = *(void **)(*(void *)(*(void *)(a1 + 192) + 8) + 40);
  if (v32)
  {
    [v32 intersectSet:v31];
  }
  else
  {
    uint64_t v33 = [v31 mutableCopy];
    uint64_t v34 = *(void *)(*(void *)(a1 + 192) + 8);
    BOOL v35 = *(void **)(v34 + 40);
    *(void *)(v34 + 40) = v33;
  }
}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_5;
    v9[3] = &unk_1E68EF140;
    id v10 = *(id *)(a1 + 32);
    long long v11 = *(_OWORD *)(a1 + 64);
    [v3 enumerateNeighborNodesThroughEdgesWithLabel:@"IS_HOME_WORK" domain:202 usingBlock:v9];
  }
  if ([*(id *)(a1 + 40) count])
  {
    uint64_t v4 = [v3 collection];
    char v5 = [v4 cityNodes];
    uint64_t v6 = [v5 anyNode];

    if (v6)
    {
      if ([*(id *)(a1 + 40) containsNode:v6])
      {
        [*(id *)(a1 + 48) addObject:v6];
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 0;
        int v7 = [*(id *)(a1 + 56) happensAtFrequentLocation];
        uint64_t v8 = a1 + 96;
        if (v7) {
          uint64_t v8 = a1 + 88;
        }
      }
      else
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 96) + 8) + 24) = 0;
        uint64_t v8 = a1 + 88;
      }
      *(unsigned char *)(*(void *)(*(void *)v8 + 8) + 24) = 0;
    }
  }
}

void __81__PGMoodUtilities_moodGraphContextIdentifiersForMomentNodes_inGraph_moodOptions___block_invoke_5(uint64_t a1, void *a2)
{
  id v7 = a2;
  int v3 = [v7 hasEdgeTowardNode:*(void *)(a1 + 32)];
  uint64_t v4 = v7;
  if (v3)
  {
    char v5 = [v7 label];
    if ([v5 isEqualToString:@"Home"])
    {
      uint64_t v6 = a1 + 40;
    }
    else
    {
      if (![v5 isEqualToString:@"Work"])
      {
LABEL_7:

        uint64_t v4 = v7;
        goto LABEL_8;
      }
      uint64_t v6 = a1 + 48;
    }
    *(unsigned char *)(*(void *)(*(void *)v6 + 8) + 24) = 1;
    goto LABEL_7;
  }
LABEL_8:
}

+ (id)moodSceneIdentifiersByMomentForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5
{
  uint64_t v6 = [a1 _momentNodesForAssetCollection:a3 inGraph:a4 moodOptions:a5];
  id v7 = [a1 moodSceneIdentifiersByMomentForMomentNodes:v6];

  return v7;
}

+ (id)moodSceneIdentifiersByMomentForMomentNodes:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  char v5 = [v3 dictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __62__PGMoodUtilities_moodSceneIdentifiersByMomentForMomentNodes___block_invoke;
  v8[3] = &unk_1E68EF578;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateNodesUsingBlock:v8];

  return v6;
}

void __62__PGMoodUtilities_moodSceneIdentifiersByMomentForMomentNodes___block_invoke(uint64_t a1, void *a2)
{
  int v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a2;
  char v5 = [v3 array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PGMoodUtilities_moodSceneIdentifiersByMomentForMomentNodes___block_invoke_2;
  v11[3] = &unk_1E68EF0C0;
  id v12 = v5;
  id v6 = v5;
  [v4 enumerateSceneEdgesAndNodesUsingBlock:v11];
  id v7 = *(void **)(a1 + 32);
  uint64_t v8 = NSNumber;
  uint64_t v9 = [v4 identifier];

  id v10 = [v8 numberWithUnsignedInteger:v9];
  [v7 setObject:v6 forKeyedSubscript:v10];
}

void __62__PGMoodUtilities_moodSceneIdentifiersByMomentForMomentNodes___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v10 = a3;
  id v5 = a2;
  uint64_t v6 = [v5 isReliable];
  uint64_t v7 = [v5 numberOfSearchConfidenceAssets];

  if ((v6 & 1) != 0 || v7)
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = [v10 label];
    [v8 setMoodIdentifier:v9];

    [v8 setIsDistributed:v6];
    [v8 setIsHighConfidence:v7 != 0];
    [*(id *)(a1 + 32) addObject:v8];
  }
}

+ (id)moodMeaningIdentifiersForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5
{
  uint64_t v6 = [a1 _momentNodesForAssetCollection:a3 inGraph:a4 moodOptions:a5];
  uint64_t v7 = [a1 moodMeaningIdentifiersForMomentNodes:v6];

  return v7;
}

+ (id)moodMeaningIdentifiersForMomentNodes:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  id v5 = [v3 meaningNodes];
  uint64_t v6 = [v5 meaningLabels];

  if ([v6 count])
  {
    uint64_t v7 = [v6 allObjects];
    [v4 addObjectsFromArray:v7];
  }
  uint64_t v8 = [v3 celebratedHolidayNodes];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__PGMoodUtilities_moodMeaningIdentifiersForMomentNodes___block_invoke;
  v11[3] = &unk_1E68EF038;
  id v9 = v4;
  id v12 = v9;
  [v8 enumerateNodesUsingBlock:v11];

  return v9;
}

void __56__PGMoodUtilities_moodMeaningIdentifiersForMomentNodes___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"Holiday.Celebrated.%d", objc_msgSend(a2, "category"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

+ (id)moodGraphNodeIdentifiersForAssetCollection:(id)a3 withGraph:(id)a4 moodOptions:(id)a5
{
  uint64_t v6 = [a1 _momentNodesForAssetCollection:a3 inGraph:a4 moodOptions:a5];
  uint64_t v7 = [a1 moodGraphNodeIdentifiersForMomentNodes:v6];

  return v7;
}

+ (id)moodGraphNodeIdentifiersForMomentNodes:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  id v5 = [v3 array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke;
  v8[3] = &unk_1E68EF578;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateNodesUsingBlock:v8];

  return v6;
}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke(uint64_t a1, void *a2)
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_2;
  v7[3] = &unk_1E68EFF78;
  id v8 = *(id *)(a1 + 32);
  id v4 = a2;
  [v4 enumerateNeighborNodesUsingBlock:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_7;
  v5[3] = &unk_1E68EF098;
  id v6 = *(id *)(a1 + 32);
  [v4 enumerateSignificantPartsOfDayUsingBlock:v5];
}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [v3 domain];
  if (v4 > 500)
  {
    switch(v4)
    {
      case 501:
        unint64_t v18 = *(void **)(a1 + 32);
        v19 = NSString;
        uint64_t v20 = [v3 label];
        [v19 stringWithFormat:@"POI.%@", v20];
        break;
      case 502:
        unint64_t v18 = *(void **)(a1 + 32);
        uint64_t v21 = NSString;
        uint64_t v20 = [v3 label];
        [v21 stringWithFormat:@"ROI.%@", v20];
        break;
      case 600:
        goto LABEL_21;
      default:
LABEL_9:
        id v5 = *(void **)(a1 + 32);
        id v6 = v3;
        uint64_t v7 = [v6 name];
        id v8 = NSString;
        uint64_t v9 = [v6 label];
        id v10 = (void *)v9;
        if (v7)
        {
          long long v11 = [v6 name];
          id v12 = [v8 stringWithFormat:@"%@.%@", v10, v11];
        }
        else
        {
          id v12 = [v8 stringWithFormat:@"%@", v9];
        }

        [v5 addObject:v12];
        goto LABEL_21;
    uint64_t v22 = };
    [v18 addObject:v22];

    goto LABEL_21;
  }
  if (v4 == 200)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_3;
    v29[3] = &unk_1E68EEFE0;
    id v30 = *(id *)(a1 + 32);
    id v13 = v3;
    [v13 enumerateNeighborNodesThroughEdgesWithLabel:@"IS_HOME_WORK" domain:202 usingBlock:v29];
    uint64_t v14 = [v13 collection];

    id v15 = [v14 areaNodes];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_4;
    v27[3] = &unk_1E68EF008;
    id v28 = *(id *)(a1 + 32);
    [v15 enumerateNodesUsingBlock:v27];

    goto LABEL_21;
  }
  if (v4 != 400)
  {
    if (v4 == 401) {
      goto LABEL_21;
    }
    goto LABEL_9;
  }
  uint64_t v16 = [v3 label];
  if ([v16 isEqualToString:@"Date"])
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_5;
    v25[3] = &unk_1E68EF038;
    id v26 = *(id *)(a1 + 32);
    id v17 = v3;
    [v17 enumerateHolidayNodesUsingBlock:v25];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_6;
    v23[3] = &unk_1E68EF068;
    id v24 = *(id *)(a1 + 32);
    [v17 enumerateNeighborNodesThroughEdgesWithLabel:@"SEASON" domain:400 usingBlock:v23];
  }
  else
  {
    [v16 isEqualToString:@"PartOfDay"];
  }

LABEL_21:
}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_7(uint64_t a1, uint64_t a2)
{
  id v5 = +[PGGraphPartOfDayNode stringValueForPartOfDay:a2];
  id v3 = *(void **)(a1 + 32);
  int v4 = [NSString stringWithFormat:@"PartOfDay.%@", v5];
  [v3 addObject:v4];
}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_3(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 label];
  [v2 addObject:v3];
}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_4(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 label];
  [v2 addObject:v3];
}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_5(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  objc_msgSend(NSString, "stringWithFormat:", @"Holiday.%d", objc_msgSend(a2, "category"));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addObject:v3];
}

void __58__PGMoodUtilities_moodGraphNodeIdentifiersForMomentNodes___block_invoke_6(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = *(void **)(a1 + 32);
  int v4 = [v10 name];
  id v5 = NSString;
  uint64_t v6 = [v10 label];
  uint64_t v7 = (void *)v6;
  if (v4)
  {
    id v8 = [v10 name];
    uint64_t v9 = [v5 stringWithFormat:@"%@.%@", v7, v8];
  }
  else
  {
    uint64_t v9 = [v5 stringWithFormat:@"%@", v6];
  }

  [v3 addObject:v9];
}

@end