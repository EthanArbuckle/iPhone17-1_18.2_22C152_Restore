@interface NSOrderedSet(WFThreeWayMerging)
+ (id)wf_orderedSetByMergingOrderedSet:()WFThreeWayMerging withOrderedSet:baseOrderedSet:elementComparator:;
+ (uint64_t)wf_orderedSetByMergingOrderedSet:()WFThreeWayMerging withOrderedSet:baseOrderedSet:;
@end

@implementation NSOrderedSet(WFThreeWayMerging)

+ (uint64_t)wf_orderedSetByMergingOrderedSet:()WFThreeWayMerging withOrderedSet:baseOrderedSet:
{
  return objc_msgSend(a1, "wf_orderedSetByMergingOrderedSet:withOrderedSet:baseOrderedSet:elementComparator:", a3, a4, a5, &__block_literal_global_47605);
}

+ (id)wf_orderedSetByMergingOrderedSet:()WFThreeWayMerging withOrderedSet:baseOrderedSet:elementComparator:
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = v13;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_60:
    id v69 = v14;
    v70 = [MEMORY[0x1E4F28B00] currentHandler];
    [v70 handleFailureInMethod:a2, a1, @"NSOrderedSet+WFThreeWayMerging.m", 40, @"Invalid parameter not satisfying: %@", @"secondOrderedSet" object file lineNumber description];

    id v14 = v69;
    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_61;
  }
  id v67 = v13;
  v68 = [MEMORY[0x1E4F28B00] currentHandler];
  [v68 handleFailureInMethod:a2, a1, @"NSOrderedSet+WFThreeWayMerging.m", 39, @"Invalid parameter not satisfying: %@", @"firstOrderedSet" object file lineNumber description];

  id v14 = v67;
  if (!v11) {
    goto LABEL_60;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_61:
  id v71 = v14;
  v72 = [MEMORY[0x1E4F28B00] currentHandler];
  [v72 handleFailureInMethod:a2, a1, @"NSOrderedSet+WFThreeWayMerging.m", 41, @"Invalid parameter not satisfying: %@", @"baseOrderedSet" object file lineNumber description];

  id v14 = v71;
LABEL_4:
  v89 = v14;
  if (v14)
  {
    v15 = [WFThreeWayMergingObjectGraph alloc];
    v16 = v14;
  }
  else
  {
    v73 = [MEMORY[0x1E4F28B00] currentHandler];
    [v73 handleFailureInMethod:a2, a1, @"NSOrderedSet+WFThreeWayMerging.m", 42, @"Invalid parameter not satisfying: %@", @"comparator" object file lineNumber description];

    v15 = [WFThreeWayMergingObjectGraph alloc];
    v16 = 0;
  }
  v17 = -[WFThreeWayMergingObjectGraph initWithVertexComparator:](v15, v16);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke;
  aBlock[3] = &unk_1E6554648;
  id v18 = v12;
  id v111 = v18;
  id v19 = v10;
  id v112 = v19;
  id v20 = v11;
  id v113 = v20;
  v21 = _Block_copy(aBlock);
  v108[0] = MEMORY[0x1E4F143A8];
  v108[1] = 3221225472;
  v108[2] = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_2;
  v108[3] = &unk_1E6554670;
  id v22 = v21;
  id v109 = v22;
  v23 = _Block_copy(v108);
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_3;
  v103[3] = &unk_1E6554698;
  id v86 = v22;
  id v106 = v86;
  v24 = v17;
  id v104 = v24;
  id v25 = v18;
  id v105 = v25;
  id v87 = v23;
  id v107 = v87;
  v92 = (void (**)(void *, id, id))_Block_copy(v103);
  v92[2](v92, v19, v20);
  v92[2](v92, v20, v19);
  v26 = v24;
  id v95 = v25;
  id v96 = v19;
  id v27 = v20;
  if (!v26)
  {
    v74 = [MEMORY[0x1E4F28B00] currentHandler];
    v75 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFAddEdgesForTransitiveRelationships(WFThreeWayMergingObjectGraph * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong)");
    [v74 handleFailureInFunction:v75, @"NSOrderedSet+WFThreeWayMerging.m", 193, @"Invalid parameter not satisfying: %@", @"graph" file lineNumber description];
  }
  if (!v12)
  {
    v76 = [MEMORY[0x1E4F28B00] currentHandler];
    v77 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFAddEdgesForTransitiveRelationships(WFThreeWayMergingObjectGraph * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong)");
    [v76 handleFailureInFunction:v77, @"NSOrderedSet+WFThreeWayMerging.m", 194, @"Invalid parameter not satisfying: %@", @"baseOrderedSet" file lineNumber description];
  }
  if (!v10)
  {
    v78 = [MEMORY[0x1E4F28B00] currentHandler];
    v79 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFAddEdgesForTransitiveRelationships(WFThreeWayMergingObjectGraph * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong)");
    [v78 handleFailureInFunction:v79, @"NSOrderedSet+WFThreeWayMerging.m", 195, @"Invalid parameter not satisfying: %@", @"firstOrderedSet" file lineNumber description];
  }
  if (!v11)
  {
    v80 = [MEMORY[0x1E4F28B00] currentHandler];
    v81 = objc_msgSend(NSString, "stringWithUTF8String:", "void WFAddEdgesForTransitiveRelationships(WFThreeWayMergingObjectGraph * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong, NSOrderedSet * _Nonnull __strong)");
    [v80 handleFailureInFunction:v81, @"NSOrderedSet+WFThreeWayMerging.m", 196, @"Invalid parameter not satisfying: %@", @"secondOrderedSet" file lineNumber description];
  }
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  if (v26) {
    id v28 = v26[2];
  }
  else {
    id v28 = 0;
  }
  id v29 = v28;
  uint64_t v30 = [v29 countByEnumeratingWithState:&v118 objects:v126 count:16];
  if (v30)
  {
    uint64_t v31 = *(void *)v119;
    do
    {
      uint64_t v32 = 0;
      do
      {
        if (*(void *)v119 != v31) {
          objc_enumerationMutation(v29);
        }
        v33 = *(void **)(*((void *)&v118 + 1) + 8 * v32);
        v34 = (void *)MEMORY[0x1C87CA430]();
        id v35 = v33;
        v36 = v35;
        if (v26)
        {
          if (!v35)
          {
            v45 = [MEMORY[0x1E4F28B00] currentHandler];
            [v45 handleFailureInMethod:sel_directPredecessorsOfVertex_, v26, @"WFThreeWayMergingObjectGraph.m", 95, @"Invalid parameter not satisfying: %@", @"vertex" object file lineNumber description];
          }
          v37 = [v26[4] objectForKey:v36];
        }
        else
        {
          v37 = 0;
        }

        BOOL v38 = [v37 count] == 0;
        if (v38)
        {
          v39 = WFGetClosestCommonElementForObject(v36, v95, v96, v27, 1);
          if (v39) {
            -[WFThreeWayMergingObjectGraph addEdgeFromVertex:toVertex:]((uint64_t)v26, v39, v36);
          }
        }
        id v40 = v36;
        v41 = v40;
        if (v26)
        {
          if (!v40)
          {
            v46 = [MEMORY[0x1E4F28B00] currentHandler];
            [v46 handleFailureInMethod:sel_directSuccessorsOfVertex_, v26, @"WFThreeWayMergingObjectGraph.m", 101, @"Invalid parameter not satisfying: %@", @"vertex" object file lineNumber description];
          }
          v42 = [v26[3] objectForKey:v41];
        }
        else
        {
          v42 = 0;
        }

        BOOL v43 = [v42 count] == 0;
        if (v43)
        {
          v44 = WFGetClosestCommonElementForObject(v41, v95, v96, v27, 0);
          if (v44) {
            -[WFThreeWayMergingObjectGraph addEdgeFromVertex:toVertex:]((uint64_t)v26, v41, v44);
          }
        }
        ++v32;
      }
      while (v30 != v32);
      uint64_t v47 = [v29 countByEnumeratingWithState:&v118 objects:v126 count:16];
      uint64_t v30 = v47;
    }
    while (v47);
  }

  v48 = objc_opt_new();
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __116__NSOrderedSet_WFThreeWayMerging__wf_orderedSetByMergingOrderedSet_withOrderedSet_baseOrderedSet_elementComparator___block_invoke_4;
  v98[3] = &unk_1E65546E8;
  id v99 = v96;
  id v100 = v27;
  id v101 = v48;
  id v102 = v89;
  id v91 = v48;
  id v84 = v89;
  id v83 = v27;
  id v82 = v96;
  v93 = v98;
  if (v26)
  {
    v49 = objc_opt_new();
    v125[0] = 0;
    v125[1] = v125;
    v125[2] = 0x2020000000;
    v125[3] = 0;
    v50 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v51 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    v52 = objc_opt_new();
    *(void *)&long long v118 = MEMORY[0x1E4F143A8];
    *((void *)&v118 + 1) = 3221225472;
    *(void *)&long long v119 = __78__WFThreeWayMergingObjectGraph_enumerateStronglyConnectedComponentsWithBlock___block_invoke;
    *((void *)&v119 + 1) = &unk_1E6556DC8;
    id v53 = v52;
    *(void *)&long long v120 = v53;
    *((void *)&v120 + 1) = v26;
    id v97 = v50;
    *(void *)&long long v121 = v97;
    v124 = v125;
    id v90 = v51;
    *((void *)&v121 + 1) = v90;
    id v85 = v49;
    id v122 = v85;
    v123 = v93;
    v54 = (void (**)(void))_Block_copy(&v118);
    long long v116 = 0u;
    long long v117 = 0u;
    long long v114 = 0u;
    long long v115 = 0u;
    id obj = v26[2];
    uint64_t v55 = [obj countByEnumeratingWithState:&v114 objects:v126 count:16];
    if (v55)
    {
      uint64_t v56 = *(void *)v115;
      do
      {
        uint64_t v57 = 0;
        do
        {
          if (*(void *)v115 != v56) {
            objc_enumerationMutation(obj);
          }
          v58 = *(void **)(*((void *)&v114 + 1) + 8 * v57);
          v59 = (void *)MEMORY[0x1C87CA430]();
          v60 = [v97 objectForKey:v58];
          BOOL v61 = v60 == 0;

          if (v61)
          {
            v62 = +[WFThreeWayMergingObjectGraphComponentEnumerationStackItem initialItemWithVertex:]((uint64_t)WFThreeWayMergingObjectGraphComponentEnumerationStackItem, v58);
            [v53 addObject:v62];

            while ([v53 count])
            {
              v63 = (void *)MEMORY[0x1C87CA430]();
              v54[2](v54);
            }
          }
          ++v57;
        }
        while (v57 != v55);
        uint64_t v64 = [obj countByEnumeratingWithState:&v114 objects:v126 count:16];
        uint64_t v55 = v64;
      }
      while (v64);
    }

    _Block_object_dispose(v125, 8);
  }

  v65 = [a1 orderedSetWithOrderedSet:v91];

  return v65;
}

@end