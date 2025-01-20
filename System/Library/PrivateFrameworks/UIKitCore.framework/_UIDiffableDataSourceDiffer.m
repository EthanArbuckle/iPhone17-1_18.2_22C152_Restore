@interface _UIDiffableDataSourceDiffer
+ (id)differWithBeforeDataSourceState:(void *)a3 afterDataSourceState:;
+ (id)differWithBeforeDataSourceState:(void *)a3 afterDataSourceState:(void *)a4 itemIdentifierDiffer:;
- (BOOL)_verifyForUpdates:(id)a3;
- (id)description;
- (id)initWithBeforeDataSource:(void *)a3 afterDataSource:(void *)a4 itemIdentifierDiffer:;
@end

@implementation _UIDiffableDataSourceDiffer

- (id)initWithBeforeDataSource:(void *)a3 afterDataSource:(void *)a4 itemIdentifierDiffer:
{
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v113 = a2;
  id v114 = a3;
  id v115 = a4;
  if (a1
    && (v132.receiver = a1,
        v132.super_class = (Class)_UIDiffableDataSourceDiffer,
        v8 = (id *)objc_msgSendSuper2(&v132, sel_init),
        (v121 = v8) != 0))
  {
    v126 = v8 + 2;
    objc_storeStrong(v8 + 2, a2);
    obj = v121 + 3;
    objc_storeStrong(v121 + 3, a3);
    objc_storeStrong(v121 + 4, a4);
    v9 = (id *)v121[4];
    if (!v9)
    {
      v10 = [_UIIdentifierDiffer alloc];
      id v11 = *v126;
      v12 = [v11 identifiers];
      v13 = [*obj identifiers];
      v9 = -[_UIIdentifierDiffer initWithBeforeIdentifiers:afterIdentifiers:]((id *)&v10->super.isa, v12, v13);

      if (v9) {
        -[_UIIdentifierDiffer _performDiffWithOptions:]((uint64_t)v9, 4);
      }
    }
    v112 = v9;
    v124 = v9;
    v14 = [_UIDiffableSectionBoundaryMoveDetector alloc];
    id v15 = *obj;
    id v16 = *v126;
    v17 = [(_UIDiffableSectionBoundaryMoveDetector *)v14 initWithItemDiffer:v124 beforeDataSourceState:v16 afterDataSourceState:v15];

    v118 = [(_UIDiffableSectionBoundaryMoveDetector *)v17 movePairs];

    v18 = [_UIIdentifierDiffer alloc];
    id v19 = *v126;
    v20 = [v19 sections];
    v21 = [*obj sections];
    v117 = -[_UIIdentifierDiffer initWithBeforeIdentifiers:afterIdentifiers:]((id *)&v18->super.isa, v20, v21);

    if (v117) {
      -[_UIIdentifierDiffer _performDiffWithOptions:]((uint64_t)v117, 4);
    }
    id v22 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    id v23 = objc_alloc_init(MEMORY[0x1E4F28E60]);
    v24 = v117;
    id v25 = v22;
    id v26 = v23;
    v120 = v24;
    v27 = -[_UIIdentifierDiffer insertedIndexes](v24);
    uint64_t v28 = [v27 count];
    v29 = -[_UIIdentifierDiffer deletedIndexes](v24);
    uint64_t v30 = [v29 count];
    v31 = -[_UIIdentifierDiffer movePairs](v24);
    uint64_t v32 = [v31 count];

    v33 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v30 + v28 + v32];
    v34 = -[_UIIdentifierDiffer insertedIndexes](v24);
    uint64_t v137 = MEMORY[0x1E4F143A8];
    uint64_t v138 = 3221225472;
    v139 = __94___UIDiffableDataSourceDiffer__sectionUpdatesForDiffResults_deletedSections_insertedSections___block_invoke;
    v140 = &unk_1E52DADC0;
    id v35 = v33;
    id v141 = v35;
    v128 = (id *)v26;
    v142 = v128;
    [v34 enumerateIndexesUsingBlock:&v137];

    v36 = -[_UIIdentifierDiffer deletedIndexes](v24);
    *(void *)&long long v133 = MEMORY[0x1E4F143A8];
    *((void *)&v133 + 1) = 3221225472;
    *(void *)&long long v134 = __94___UIDiffableDataSourceDiffer__sectionUpdatesForDiffResults_deletedSections_insertedSections___block_invoke_2;
    *((void *)&v134 + 1) = &unk_1E52DADC0;
    id v37 = v35;
    *(void *)&long long v135 = v37;
    id v130 = v25;
    *((void *)&v135 + 1) = v130;
    [v36 enumerateIndexesUsingBlock:&v133];

    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    v38 = -[_UIIdentifierDiffer movePairs](v24);
    uint64_t v39 = [v38 countByEnumeratingWithState:&v146 objects:v151 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v147;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v147 != v40) {
            objc_enumerationMutation(v38);
          }
          uint64_t v42 = *(void *)(*((void *)&v146 + 1) + 8 * i);
          if (v42) {
            BOOL v43 = *(void *)(v42 + 8) == *(void *)(v42 + 16);
          }
          else {
            BOOL v43 = 1;
          }
          v44 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:v112];
          if (v42)
          {
            v45 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:*(void *)(v42 + 16)];
            if (v43)
            {
              [v130 addIndex:*(void *)(v42 + 8)];
              uint64_t v46 = *(void *)(v42 + 16);
LABEL_18:
              [v128 addIndex:v46];
              v47 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v44 finalIndexPath:0 updateAction:1];
              [v37 addObject:v47];
              v48 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:0 finalIndexPath:v45 updateAction:0];
              [v37 addObject:v48];

              goto LABEL_23;
            }
          }
          else
          {
            v45 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:0];
            if (v43)
            {
              [v130 addIndex:0];
              uint64_t v46 = 0;
              goto LABEL_18;
            }
          }
          v47 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v44 finalIndexPath:v45 updateAction:3];
          [v37 addObject:v47];
LABEL_23:
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v146 objects:v151 count:16];
      }
      while (v39);
    }

    v49 = (void *)*((void *)&v135 + 1);
    id v116 = v37;

    v125 = v124;
    id v119 = v118;
    id v50 = v130;
    v51 = v128;
    id v52 = *v126;
    v53 = [v52 dataSourceSnapshot];

    id v54 = *obj;
    v55 = [v54 dataSourceSnapshot];

    LOBYTE(v54) = [v119 count] == 0;
    v56 = -[_UIIdentifierDiffer movePairs](v125);
    v57 = v56;
    if ((v54 & 1) == 0)
    {
      uint64_t v58 = [v56 setByAddingObjectsFromSet:v119];

      v57 = (void *)v58;
    }
    v59 = -[_UIIdentifierDiffer insertedIndexes](v125);
    uint64_t v60 = [v59 count];
    v61 = -[_UIIdentifierDiffer deletedIndexes](v125);
    uint64_t v62 = [v61 count];
    uint64_t v63 = [v57 count];

    v64 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v62 + v60 + v63];
    v65 = -[_UIIdentifierDiffer insertedIndexes](v125);
    *(void *)&long long v146 = MEMORY[0x1E4F143A8];
    *((void *)&v146 + 1) = 3221225472;
    *(void *)&long long v147 = __112___UIDiffableDataSourceDiffer__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections___block_invoke;
    *((void *)&v147 + 1) = &unk_1E52E3400;
    id v66 = v55;
    v150 = sel__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections_;
    id v129 = v66;
    *(void *)&long long v148 = v66;
    *((void *)&v148 + 1) = v121;
    v67 = v51;
    *(void *)&long long v149 = v67;
    id v68 = v64;
    *((void *)&v149 + 1) = v68;
    [v65 enumerateIndexesUsingBlock:&v146];

    v69 = -[_UIIdentifierDiffer deletedIndexes](v125);
    uint64_t v137 = MEMORY[0x1E4F143A8];
    uint64_t v138 = 3221225472;
    v139 = __112___UIDiffableDataSourceDiffer__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections___block_invoke_2;
    v140 = &unk_1E52E3400;
    id v70 = v53;
    v145 = sel__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections_;
    id v131 = v70;
    id v141 = v70;
    v142 = v121;
    id v71 = v50;
    id v143 = v71;
    id v127 = v68;
    id v144 = v127;
    [v69 enumerateIndexesUsingBlock:&v137];

    long long v135 = 0u;
    long long v136 = 0u;
    long long v133 = 0u;
    long long v134 = 0u;
    id obja = v57;
    uint64_t v72 = [obja countByEnumeratingWithState:&v133 objects:v151 count:16];
    if (v72)
    {
      uint64_t v73 = *(void *)v134;
      do
      {
        uint64_t v74 = 0;
        do
        {
          if (*(void *)v134 != v73) {
            objc_enumerationMutation(obja);
          }
          uint64_t v75 = *(void *)(*((void *)&v133 + 1) + 8 * v74);
          if (v75)
          {
            v76 = [v131 indexPathForGlobalIndex:*(void *)(v75 + 8)];
            uint64_t v77 = *(void *)(v75 + 16);
          }
          else
          {
            v76 = [v131 indexPathForGlobalIndex:0];
            uint64_t v77 = 0;
          }
          v78 = objc_msgSend(v129, "indexPathForGlobalIndex:", v77, v112);
          if (!v76)
          {
            v93 = [MEMORY[0x1E4F28B00] currentHandler];
            [v93 handleFailureInMethod:sel__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections_ object:v121 file:@"_UIDiffableDataSourceDiffer.m" lineNumber:202 description:@"Failed to convert global index to indexPath."];
          }
          if (!v78)
          {
            v94 = [MEMORY[0x1E4F28B00] currentHandler];
            [v94 handleFailureInMethod:sel__itemUpdatesForDiffResults_sectionBoundaryMoves_deletedSections_insertedSections_ object:v121 file:@"_UIDiffableDataSourceDiffer.m" lineNumber:203 description:@"Failed to convert global index to indexPath."];
          }
          int v79 = objc_msgSend(v71, "containsIndex:", objc_msgSend(v76, "section"));
          int v80 = objc_msgSend(v67, "containsIndex:", objc_msgSend(v78, "section"));
          if ((dyld_program_sdk_at_least() & 1) != 0 || ![v76 isEqual:v78])
          {
            if ((v79 | v80))
            {
              if ((v79 & 1) == 0)
              {
                v83 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v76 finalIndexPath:0 updateAction:1];
                [v127 addObject:v83];
              }
              if ((v80 & 1) == 0)
              {
LABEL_43:
                v82 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:0 finalIndexPath:v78 updateAction:0];
LABEL_57:
                v92 = v82;
                [v127 addObject:v82];
              }
            }
            else
            {
              v84 = -[_UIIdentifierDiffer insertedIndexes](v125);
              v85 = v84;
              if (v75) {
                uint64_t v86 = *(void *)(v75 + 16);
              }
              else {
                uint64_t v86 = 0;
              }
              int v87 = [v84 containsIndex:v86];

              if (!v87)
              {
                v82 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v76 finalIndexPath:v78 updateAction:3];
                goto LABEL_57;
              }
              v88 = -[_UIIdentifierDiffer deletedIndexes](v125);
              v89 = v88;
              if (v75) {
                uint64_t v90 = *(void *)(v75 + 8);
              }
              else {
                uint64_t v90 = 0;
              }
              char v91 = [v88 containsIndex:v90];

              if ((v91 & 1) == 0)
              {
                v82 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v76 finalIndexPath:0 updateAction:1];
                goto LABEL_57;
              }
            }
          }
          else
          {
            if ((v79 & 1) == 0)
            {
              v81 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v76 finalIndexPath:0 updateAction:1];
              [v127 addObject:v81];
            }
            if ((v80 & 1) == 0) {
              goto LABEL_43;
            }
          }

          ++v74;
        }
        while (v72 != v74);
        uint64_t v95 = [obja countByEnumeratingWithState:&v133 objects:v151 count:16];
        uint64_t v72 = v95;
      }
      while (v95);
    }

    v96 = v144;
    id v97 = v127;

    uint64_t v98 = [v97 arrayByAddingObjectsFromArray:v116];
    objc_storeStrong(v121 + 4, v112);
    objc_storeStrong(v121 + 5, v117);
    long long v148 = 0u;
    long long v149 = 0u;
    long long v146 = 0u;
    long long v147 = 0u;
    v99 = -[_UIIdentifierDiffer movePairs](v120);
    uint64_t v100 = [v99 countByEnumeratingWithState:&v146 objects:v151 count:16];
    if (v100)
    {
      uint64_t v101 = *(void *)v147;
      do
      {
        uint64_t v102 = 0;
        do
        {
          if (*(void *)v147 != v101) {
            objc_enumerationMutation(v99);
          }
          uint64_t v103 = *(void *)(*((void *)&v146 + 1) + 8 * v102);
          if (v103)
          {
            uint64_t v104 = *(void *)(v103 + 8);
            uint64_t v105 = *(void *)(v103 + 16);
          }
          else
          {
            uint64_t v104 = 0;
            uint64_t v105 = 0;
          }
          objc_msgSend(v71, "removeIndex:", v104, v112);
          [v67 removeIndex:v105];
          ++v102;
        }
        while (v100 != v102);
        uint64_t v106 = [v99 countByEnumeratingWithState:&v146 objects:v151 count:16];
        uint64_t v100 = v106;
      }
      while (v106);
    }

    id v107 = v121[8];
    v121[8] = v67;
    v108 = v67;

    id v109 = v121[7];
    v121[7] = v71;

    id v110 = v121[1];
    v121[1] = (id)v98;
  }
  else
  {
    v121 = 0;
  }

  return v121;
}

+ (id)differWithBeforeDataSourceState:(void *)a3 afterDataSourceState:
{
  id v4 = a3;
  id v5 = a2;
  self;
  v6 = -[_UIDiffableDataSourceDiffer initWithBeforeDataSource:afterDataSource:itemIdentifierDiffer:]([_UIDiffableDataSourceDiffer alloc], v5, v4, 0);

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_insertedSections, 0);
  objc_storeStrong((id *)&self->_deletedSections, 0);
  objc_storeStrong((id *)&self->_affectedSectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionIdentifierDiffer, 0);
  objc_storeStrong((id *)&self->_itemIdentifierDiffer, 0);
  objc_storeStrong((id *)&self->_afterDataSourceState, 0);
  objc_storeStrong((id *)&self->_beforeDataSourceState, 0);
  objc_storeStrong((id *)&self->_updates, 0);
}

- (id)description
{
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  v6 = (void *)[v3 initWithFormat:@"<%@ %p: ", v5, self];

  if (self) {
    beforeDataSourceState = self->_beforeDataSourceState;
  }
  else {
    beforeDataSourceState = 0;
  }
  v8 = beforeDataSourceState;
  v9 = [(_UIDiffableDataSourceState *)v8 dataSourceSnapshot];
  if (self)
  {
    v10 = [(_UIDiffableDataSourceState *)self->_afterDataSourceState dataSourceSnapshot];
    [v6 appendFormat:@"before: %@; after:%@;", v9, v10];

    [v6 appendString:@"\n\nBefore:\n"];
    id v11 = self->_beforeDataSourceState;
  }
  else
  {
    uint64_t v30 = [0 dataSourceSnapshot];
    [v6 appendFormat:@"before: %@; after:%@;", v9, v30];

    [v6 appendString:@"\n\nBefore:\n"];
    id v11 = 0;
  }
  v12 = [(_UIDiffableDataSourceState *)v11 dataSourceSnapshot];
  if ([v12 numberOfSections] >= 1)
  {
    uint64_t v13 = 0;
    do
    {
      if (self) {
        v14 = self->_beforeDataSourceState;
      }
      else {
        v14 = 0;
      }
      id v15 = [(_UIDiffableDataSourceState *)v14 sections];
      id v16 = [v15 objectAtIndexedSubscript:v13];

      if (self) {
        v17 = self->_beforeDataSourceState;
      }
      else {
        v17 = 0;
      }
      v18 = [(_UIDiffableDataSourceState *)v17 identifiers];
      id v19 = __42___UIDiffableDataSourceDiffer_description__block_invoke(v12, v18, v13, v16);

      [v6 appendString:v19];
      ++v13;
    }
    while (v13 < [v12 numberOfSections]);
  }
  [v6 appendString:@"\n\nAfter:\n"];
  if (self) {
    afterDataSourceState = self->_afterDataSourceState;
  }
  else {
    afterDataSourceState = 0;
  }
  v21 = [(_UIDiffableDataSourceState *)afterDataSourceState dataSourceSnapshot];
  if ([v21 numberOfSections] >= 1)
  {
    uint64_t v22 = 0;
    do
    {
      if (self) {
        id v23 = self->_afterDataSourceState;
      }
      else {
        id v23 = 0;
      }
      v24 = [(_UIDiffableDataSourceState *)v23 sections];
      id v25 = [v24 objectAtIndexedSubscript:v22];

      if (self) {
        id v26 = self->_afterDataSourceState;
      }
      else {
        id v26 = 0;
      }
      v27 = [(_UIDiffableDataSourceState *)v26 identifiers];
      uint64_t v28 = __42___UIDiffableDataSourceDiffer_description__block_invoke(v21, v27, v22, v25);

      [v6 appendString:v28];
      ++v22;
    }
    while (v22 < [v21 numberOfSections]);
  }
  [v6 appendFormat:@"\nidentifierDiffer: %@", self->_itemIdentifierDiffer];
  [v6 appendFormat:@"\nUpdates: %@>", self->_updates];

  return v6;
}

+ (id)differWithBeforeDataSourceState:(void *)a3 afterDataSourceState:(void *)a4 itemIdentifierDiffer:
{
  id v6 = a4;
  id v7 = a3;
  id v8 = a2;
  self;
  v9 = -[_UIDiffableDataSourceDiffer initWithBeforeDataSource:afterDataSource:itemIdentifierDiffer:]([_UIDiffableDataSourceDiffer alloc], v8, v7, v6);

  return v9;
}

- (BOOL)_verifyForUpdates:(id)a3
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v50 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v51 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v73 objects:v79 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v74 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v73 + 1) + 8 * i);
        if (v8 && *(void *)(v8 + 48) == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v9 = *(void *)(v8 + 80);
          if (v9 == 1)
          {
            uint64_t v10 = 8;
            id v11 = v50;
          }
          else
          {
            if (v9) {
              continue;
            }
            uint64_t v10 = 24;
            id v11 = v51;
          }
          [v11 addIndex:*(void *)(v8 + v10)];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v73 objects:v79 count:16];
    }
    while (v5);
  }

  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v13 = v4;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v69 objects:v78 count:16];
  if (!v14) {
    goto LABEL_42;
  }
  uint64_t v15 = *(void *)v70;
  do
  {
    uint64_t v16 = 0;
    do
    {
      if (*(void *)v70 != v15) {
        objc_enumerationMutation(v13);
      }
      v17 = *(void **)(*((void *)&v69 + 1) + 8 * v16);
      if (!v17)
      {
        id v19 = [0 indexPathAfterUpdate];
        goto LABEL_30;
      }
      uint64_t v18 = v17[10];
      if (!v18)
      {
        id v19 = [*(id *)(*((void *)&v69 + 1) + 8 * v16) indexPathAfterUpdate];
        if (v17[6] != 0x7FFFFFFFFFFFFFFFLL)
        {
LABEL_30:
          if (objc_msgSend(v51, "containsIndex:", objc_msgSend(v19, "section"))) {
            goto LABEL_37;
          }
        }
LABEL_28:
        [v12 addObject:v17];
        goto LABEL_37;
      }
      if (v18 == 1)
      {
        v21 = [*(id *)(*((void *)&v69 + 1) + 8 * v16) indexPathBeforeUpdate];
        id v19 = v21;
        if (v17[6] != 0x7FFFFFFFFFFFFFFFLL
          && (objc_msgSend(v50, "containsIndex:", objc_msgSend(v21, "section")) & 1) != 0)
        {
          goto LABEL_37;
        }
        goto LABEL_28;
      }
      if (v18 != 3) {
        goto LABEL_38;
      }
      id v19 = [*(id *)(*((void *)&v69 + 1) + 8 * v16) indexPathBeforeUpdate];
      v20 = [v17 indexPathAfterUpdate];
      if (v17[6] == 0x7FFFFFFFFFFFFFFFLL)
      {
        [v12 addObject:v17];
      }
      else
      {
        if ((objc_msgSend(v50, "containsIndex:", objc_msgSend(v19, "section")) & 1) == 0)
        {
          uint64_t v22 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:v19 finalIndexPath:0 updateAction:1];
          [v12 addObject:v22];
        }
        if ((objc_msgSend(v51, "containsIndex:", objc_msgSend(v20, "section")) & 1) == 0)
        {
          id v23 = [[UICollectionViewUpdateItem alloc] initWithInitialIndexPath:0 finalIndexPath:v20 updateAction:0];
          [v12 addObject:v23];
        }
      }

LABEL_37:
LABEL_38:
      ++v16;
    }
    while (v14 != v16);
    uint64_t v24 = [v13 countByEnumeratingWithState:&v69 objects:v78 count:16];
    uint64_t v14 = v24;
  }
  while (v24);
LABEL_42:

  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v27 = v12;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v77 count:16];
  if (!v28) {
    goto LABEL_54;
  }
  uint64_t v29 = *(void *)v66;
  while (2)
  {
    uint64_t v30 = 0;
    while (2)
    {
      if (*(void *)v66 != v29) {
        objc_enumerationMutation(v27);
      }
      uint64_t v31 = *(void *)(*((void *)&v65 + 1) + 8 * v30);
      uint64_t v32 = v26;
      if (v31 && (v33 = *(void *)(v31 + 80), uint64_t v32 = v26, v33))
      {
        if (v33 == 1)
        {
          uint64_t v32 = v25;
          goto LABEL_51;
        }
      }
      else
      {
LABEL_51:
        objc_msgSend(v32, "addObject:");
      }
      if (v28 != ++v30) {
        continue;
      }
      break;
    }
    uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v77 count:16];
    if (v28) {
      continue;
    }
    break;
  }
LABEL_54:

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke;
  aBlock[3] = &unk_1E52E3428;
  aBlock[4] = self;
  aBlock[5] = a2;
  v34 = _Block_copy(aBlock);
  v62[0] = MEMORY[0x1E4F143A8];
  v62[1] = 3221225472;
  v62[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_2;
  v62[3] = &unk_1E52E3450;
  id v35 = v34;
  id v63 = v35;
  v36 = _Block_copy(v62);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_3;
  v60[3] = &unk_1E52E3450;
  id v48 = v35;
  id v61 = v48;
  id v37 = _Block_copy(v60);
  [v25 sortUsingComparator:v36];
  [v26 sortUsingComparator:v37];
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = __Block_byref_object_copy__37;
  uint64_t v58 = __Block_byref_object_dispose__37;
  beforeDataSourceState = self;
  if (self) {
    beforeDataSourceState = self->_beforeDataSourceState;
  }
  id v39 = beforeDataSourceState;
  uint64_t v40 = [v39 dataSourceSnapshot];
  v41 = [off_1E52D5400 snapshotterForSnapshot:v40];

  id v59 = v41;
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_52;
  v53[3] = &unk_1E52E1190;
  v53[4] = &v54;
  [v25 enumerateObjectsUsingBlock:v53];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __49___UIDiffableDataSourceDiffer__verifyForUpdates___block_invoke_2_54;
  v52[3] = &unk_1E52E3478;
  v52[4] = self;
  v52[5] = &v54;
  [v26 enumerateObjectsUsingBlock:v52];
  if (self) {
    afterDataSourceState = self->_afterDataSourceState;
  }
  else {
    afterDataSourceState = 0;
  }
  BOOL v43 = afterDataSourceState;
  v44 = [(_UIDiffableDataSourceState *)v43 dataSourceSnapshot];
  v45 = [off_1E52D5400 snapshotterForSnapshot:v44];

  LOBYTE(v43) = [(id)v55[5] isEqual:v45];
  _Block_object_dispose(&v54, 8);

  return (char)v43;
}

@end