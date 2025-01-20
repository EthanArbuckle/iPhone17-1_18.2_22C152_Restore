@interface _UIDiffableDataSourceSectionSnapshotRebaser
- (NSMapTable)rebasedSectionSnapshots;
- (_UIDiffableDataSourceSectionSnapshotRebaser)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5;
- (_UIDiffableDataSourceSectionSnapshotRebaser)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5 dataSourceDiffer:(id)a6;
- (_UIDiffableDataSourceSectionSnapshotRebaser)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5 dataSourceDiffer:(id)a6 shouldPerformChildSnapshotMoves:(BOOL)a7;
- (id)_computeSectionTransactionsIncludingSectionDifferences:(BOOL)a3;
- (id)_transactionIncludingSectionDifferences:(BOOL)a3 source:(int64_t)a4;
- (id)computeApplyTransactionIncludingSectionDifferences:(BOOL)a3;
- (id)computeReorderingTransaction;
- (void)_rebaseForInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5 dataSourceDiffer:(id)a6 shouldPerformChildSnapshotMoves:(BOOL)a7;
@end

@implementation _UIDiffableDataSourceSectionSnapshotRebaser

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rebasedSectionSnapshots, 0);
  objc_storeStrong((id *)&self->_initialSectionSnapshots, 0);
  objc_storeStrong((id *)&self->_dataSourceDiffer, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

- (_UIDiffableDataSourceSectionSnapshotRebaser)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5 dataSourceDiffer:(id)a6 shouldPerformChildSnapshotMoves:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v20.receiver = self;
  v20.super_class = (Class)_UIDiffableDataSourceSectionSnapshotRebaser;
  v17 = [(_UIDiffableDataSourceSectionSnapshotRebaser *)&v20 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_initialSnapshot, a3);
    objc_storeStrong((id *)&v18->_finalSnapshot, a4);
    objc_storeStrong((id *)&v18->_initialSectionSnapshots, a5);
    objc_storeStrong((id *)&v18->_dataSourceDiffer, a6);
    [(_UIDiffableDataSourceSectionSnapshotRebaser *)v18 _rebaseForInitialSnapshot:v13 finalSnapshot:v14 initialSectionSnapshots:v15 dataSourceDiffer:v16 shouldPerformChildSnapshotMoves:v7];
  }

  return v18;
}

- (_UIDiffableDataSourceSectionSnapshotRebaser)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5 dataSourceDiffer:(id)a6
{
  return [(_UIDiffableDataSourceSectionSnapshotRebaser *)self initWithInitialSnapshot:a3 finalSnapshot:a4 initialSectionSnapshots:a5 dataSourceDiffer:a6 shouldPerformChildSnapshotMoves:0];
}

- (id)computeApplyTransactionIncludingSectionDifferences:(BOOL)a3
{
  return [(_UIDiffableDataSourceSectionSnapshotRebaser *)self _transactionIncludingSectionDifferences:a3 source:0];
}

- (id)_transactionIncludingSectionDifferences:(BOOL)a3 source:(int64_t)a4
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v6 = [(_UIDiffableDataSourceSectionSnapshotRebaser *)self _computeSectionTransactionsIncludingSectionDifferences:a3];
  dataSourceDiffer = self->_dataSourceDiffer;
  if (dataSourceDiffer) {
    dataSourceDiffer = (_UIDiffableDataSourceDiffer *)dataSourceDiffer->_itemIdentifierDiffer;
  }
  v8 = dataSourceDiffer;
  v9 = -[_UIIdentifierDiffer collectionDifference](v8);

  v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (a4 == 1 && v9 && [v9 hasChanges])
  {
    v11 = [v9 insertions];
    v12 = [v11 firstObject];

    if (v12)
    {
      uint64_t v13 = [v12 object];
      id v14 = (void *)v13;
      if (v13)
      {
        v23[0] = v13;
        v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      }
      else
      {
        v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  id v15 = [NSDiffableDataSourceTransaction alloc];
  id v16 = v15;
  initialSnapshot = self->_initialSnapshot;
  finalSnapshot = self->_finalSnapshot;
  if (v9)
  {
    v19 = [(NSDiffableDataSourceTransaction *)v15 initWithInitialSnapshot:initialSnapshot finalSnapshot:finalSnapshot source:a4 difference:v9 reorderedItemIdentifiers:v10 sectionTransactions:v6];
  }
  else
  {
    id v20 = objc_alloc(MEMORY[0x1E4F28F20]);
    v21 = (void *)[v20 initWithChanges:MEMORY[0x1E4F1CBF0]];
    v19 = [(NSDiffableDataSourceTransaction *)v16 initWithInitialSnapshot:initialSnapshot finalSnapshot:finalSnapshot source:a4 difference:v21 reorderedItemIdentifiers:v10 sectionTransactions:v6];
  }
  return v19;
}

- (void)_rebaseForInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5 dataSourceDiffer:(id)a6 shouldPerformChildSnapshotMoves:(BOOL)a7
{
  BOOL v116 = a7;
  uint64_t v153 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = (id *)a6;
  uint64_t v15 = [v13 count];
  id v16 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  if (v15)
  {
    v101 = self;
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke;
    aBlock[3] = &unk_1E52D9DE0;
    v113 = v16;
    v144 = v113;
    id v112 = v13;
    id v145 = v112;
    v17 = _Block_copy(aBlock);
    if (v14) {
      goto LABEL_4;
    }
    [v11 state];
    v19 = v18 = v17;
    id v20 = [v12 state];
    +[_UIDiffableDataSourceDiffer differWithBeforeDataSourceState:afterDataSourceState:]((uint64_t)_UIDiffableDataSourceDiffer, v19, v20);
    id v14 = (id *)objc_claimAutoreleasedReturnValue();

    v17 = v18;
    objc_storeStrong((id *)&v101->_dataSourceDiffer, v14);
    if (v14)
    {
LABEL_4:
      v98 = v14[4];
      char v21 = 0;
      id v22 = v14[2];
    }
    else
    {
      v98 = 0;
      id v22 = 0;
      char v21 = 1;
    }
    id v23 = v22;
    v24 = [v23 identifiers];
    uint64_t v105 = [v24 count];
    id v99 = v11;
    v96 = v12;
    v94 = v14;
    if (v21) {
      id v25 = 0;
    }
    else {
      id v25 = v14[3];
    }
    id v111 = v25;
    v26 = [v111 identifiers];
    uint64_t v103 = [v26 count];
    v27 = -[_UIIdentifierDiffer deletedIndexes](v98);
    v28 = -[_UIIdentifierDiffer insertedIndexes](v98);
    v29 = -[_UIIdentifierDiffer movePairs](v98);
    uint64_t v30 = [v29 count];

    id v95 = v13;
    v114 = v24;
    if (!v30 || v116)
    {
      v31 = v27;
    }
    else
    {
      v107 = v26;
      v109 = v17;
      v31 = (void *)[v27 mutableCopy];
      v32 = (void *)[v28 mutableCopy];
      long long v139 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      long long v142 = 0u;
      v33 = -[_UIIdentifierDiffer movePairs](v98);
      uint64_t v34 = [v33 countByEnumeratingWithState:&v139 objects:v152 count:16];
      if (v34)
      {
        uint64_t v35 = v34;
        uint64_t v36 = *(void *)v140;
        do
        {
          uint64_t v37 = 0;
          do
          {
            if (*(void *)v140 != v36) {
              objc_enumerationMutation(v33);
            }
            uint64_t v38 = *(void *)(*((void *)&v139 + 1) + 8 * v37);
            if (v38)
            {
              uint64_t v39 = *(void *)(v38 + 8);
              uint64_t v40 = *(void *)(v38 + 16);
            }
            else
            {
              uint64_t v39 = 0;
              uint64_t v40 = 0;
            }
            [v31 addIndex:v39];
            [v32 addIndex:v40];
            ++v37;
          }
          while (v35 != v37);
          uint64_t v41 = [v33 countByEnumeratingWithState:&v139 objects:v152 count:16];
          uint64_t v35 = v41;
        }
        while (v41);
      }

      v28 = v32;
      v26 = v107;
      v17 = v109;
    }
    v133[0] = MEMORY[0x1E4F143A8];
    v133[1] = 3221225472;
    v133[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_2;
    v133[3] = &unk_1E52D9E30;
    uint64_t v137 = v105;
    SEL v138 = a2;
    v43 = v101;
    v133[4] = v101;
    id v91 = v23;
    id v134 = v91;
    id v44 = v17;
    id v136 = v44;
    id v106 = v114;
    id v135 = v106;
    v93 = v31;
    [v31 enumerateRangesUsingBlock:v133];
    v126[0] = MEMORY[0x1E4F143A8];
    v126[1] = 3221225472;
    v126[2] = __160___UIDiffableDataSourceSectionSnapshotRebaser__rebaseForInitialSnapshot_finalSnapshot_initialSectionSnapshots_dataSourceDiffer_shouldPerformChildSnapshotMoves___block_invoke_4;
    v126[3] = &unk_1E52D9E80;
    uint64_t v131 = v103;
    SEL v132 = a2;
    v126[4] = v101;
    id v90 = v111;
    id v127 = v90;
    id v45 = v44;
    id v130 = v45;
    id v89 = v26;
    id v128 = v89;
    id v115 = v96;
    id v129 = v115;
    v92 = v28;
    [v28 enumerateRangesUsingBlock:v126];
    v104 = v45;
    if (v116)
    {
      long long v124 = 0u;
      long long v125 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      -[_UIIdentifierDiffer movePairs](v98);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      v46 = v99;
      uint64_t v108 = [obj countByEnumeratingWithState:&v122 objects:v151 count:16];
      if (!v108) {
        goto LABEL_77;
      }
      uint64_t v102 = *(void *)v123;
      while (1)
      {
        uint64_t v47 = 0;
        do
        {
          if (*(void *)v123 != v102) {
            objc_enumerationMutation(obj);
          }
          uint64_t v48 = *(void *)(*((void *)&v122 + 1) + 8 * v47);
          if (v48)
          {
            uint64_t v49 = *(void *)(v48 + 8);
            uint64_t v50 = *(void *)(v48 + 16);
          }
          else
          {
            uint64_t v49 = 0;
            uint64_t v50 = 0;
          }
          if (v49 >= v105)
          {
            v69 = [MEMORY[0x1E4F28B00] currentHandler];
            [v69 handleFailureInMethod:a2, v43, @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 243, @"Invalid parameter not satisfying: %@", @"moveFromIndex < beforeIdentifiersCount", v89, v90, v91 object file lineNumber description];
          }
          if (v50 >= v103)
          {
            v70 = [MEMORY[0x1E4F28B00] currentHandler];
            [v70 handleFailureInMethod:a2, v43, @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 244, @"Invalid parameter not satisfying: %@", @"moveToIndex < afterIdentifiersCount" object file lineNumber description];
          }
          v51 = [v106 objectAtIndexedSubscript:v49];
          uint64_t v52 = [v46 sectionIdentifierForSectionContainingItemIdentifier:v51];
          uint64_t v53 = [v115 sectionIdentifierForSectionContainingItemIdentifier:v51];
          v54 = (void *)v53;
          if (v52)
          {
            if (v53) {
              goto LABEL_37;
            }
          }
          else
          {
            v71 = [MEMORY[0x1E4F28B00] currentHandler];
            [v71 handleFailureInMethod:a2, v43, @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 249, @"Invalid parameter not satisfying: %@", @"fromSectionIdentifier" object file lineNumber description];

            if (v54) {
              goto LABEL_37;
            }
          }
          v72 = [MEMORY[0x1E4F28B00] currentHandler];
          [v72 handleFailureInMethod:a2, v43, @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 250, @"Invalid parameter not satisfying: %@", @"toSectionIdentifier" object file lineNumber description];

LABEL_37:
          v110 = (void *)v52;
          v55 = (*((void (**)(id, uint64_t))v45 + 2))(v45, v52);
          v56 = v55;
          if (v55)
          {
            if ([v55 containsItem:v51]) {
              uint64_t v57 = [v56 levelOfItem:v51];
            }
            else {
              uint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
            }
            v58 = [v56 childSnapshotOfParent:v51 includingParent:0];
            v117 = [v56 parentOfChild:v51];
            v150 = v51;
            v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v150 count:1];
            [v56 deleteItems:v59];
          }
          else
          {
            v58 = 0;
            v117 = 0;
            uint64_t v57 = 0x7FFFFFFFFFFFFFFFLL;
          }
          v60 = (*((void (**)(id, void *))v45 + 2))(v45, v54);
          if (!v60) {
            goto LABEL_69;
          }
          v61 = [v115 _identifierAfterIdentifier:v51];
          if (([v60 containsItem:v61] & 1) == 0)
          {

            v61 = 0;
          }
          v62 = [v115 _identifierBeforeIdentifier:v51];
          if (![v60 containsItem:v62]
            || v117 && objc_msgSend(v62, "isEqual:"))
          {

            v62 = 0;
          }
          if (v57 != 0x7FFFFFFFFFFFFFFFLL)
          {
            if (v61 && v62)
            {
              uint64_t v63 = [v60 levelOfItem:v62];
              uint64_t v64 = [v60 levelOfItem:v61];
              if (v63 == v64) {
                goto LABEL_57;
              }
              if (v64 != v57)
              {
                if (v63 == v57)
                {

                  v61 = 0;
                }
LABEL_57:
                uint64_t v65 = [v60 isExpanded:v62];
                v149 = v51;
                v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v149 count:1];
                [v60 insertItems:v66 afterItem:v62 insertionMode:v65];

                v46 = v99;
                goto LABEL_67;
              }

              v46 = v99;
              goto LABEL_66;
            }
            if (v62 && !v61)
            {
              uint64_t v67 = [v60 levelOfItem:v62];
              if (v57 || v67 < 1) {
                goto LABEL_57;
              }

              v46 = v99;
LABEL_63:
              v147 = v51;
              v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v147 count:1];
              [v60 appendItems:v61];
              goto LABEL_67;
            }
          }
          if (v62) {
            goto LABEL_57;
          }
          if (!v61) {
            goto LABEL_63;
          }
LABEL_66:
          v148 = v51;
          v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v148 count:1];
          [v60 insertItems:v68 beforeItem:v61];

LABEL_67:
          v43 = v101;

          if (v58) {
            [v60 replaceChildrenOfParentItem:v51 withSnapshot:v58];
          }
LABEL_69:

          ++v47;
          id v45 = v104;
        }
        while (v108 != v47);
        uint64_t v73 = [obj countByEnumeratingWithState:&v122 objects:v151 count:16];
        uint64_t v108 = v73;
        if (!v73)
        {
LABEL_77:

          break;
        }
      }
    }
    long long v120 = 0u;
    long long v121 = 0u;
    long long v118 = 0u;
    long long v119 = 0u;
    v74 = [(NSMapTable *)v113 keyEnumerator];
    uint64_t v75 = [v74 countByEnumeratingWithState:&v118 objects:v146 count:16];
    if (!v75) {
      goto LABEL_90;
    }
    uint64_t v76 = v75;
    uint64_t v77 = *(void *)v119;
LABEL_80:
    uint64_t v78 = 0;
    while (1)
    {
      if (*(void *)v119 != v77) {
        objc_enumerationMutation(v74);
      }
      uint64_t v79 = *(void *)(*((void *)&v118 + 1) + 8 * v78);
      v80 = [v112 objectForKey:v79];
      uint64_t v81 = [(NSMapTable *)v113 objectForKey:v79];
      v82 = (void *)v81;
      if (v80)
      {
        if (!v81) {
          goto LABEL_88;
        }
      }
      else
      {
        v84 = [MEMORY[0x1E4F28B00] currentHandler];
        [v84 handleFailureInMethod:a2, v101, @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 374, @"Invalid parameter not satisfying: %@", @"initialSectionSnapshot" object file lineNumber description];

        if (!v82)
        {
LABEL_88:
          v85 = [MEMORY[0x1E4F28B00] currentHandler];
          [v85 handleFailureInMethod:a2, v101, @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 375, @"Invalid parameter not satisfying: %@", @"rebasedSectionSnapshot" object file lineNumber description];
        }
      }
      v83 = [v80 expandedItems];
      [v82 expandItems:v83];

      if (v76 == ++v78)
      {
        uint64_t v86 = [v74 countByEnumeratingWithState:&v118 objects:v146 count:16];
        uint64_t v76 = v86;
        if (!v86)
        {
LABEL_90:

          rebasedSectionSnapshots = v101->_rebasedSectionSnapshots;
          v101->_rebasedSectionSnapshots = v113;
          v88 = v113;

          id v11 = v99;
          id v13 = v95;
          id v12 = v96;
          id v14 = v94;
          goto LABEL_91;
        }
        goto LABEL_80;
      }
    }
  }
  v42 = self->_rebasedSectionSnapshots;
  self->_rebasedSectionSnapshots = v16;

LABEL_91:
}

- (id)_computeSectionTransactionsIncludingSectionDifferences:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(NSMapTable *)self->_rebasedSectionSnapshots keyEnumerator];
  uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v26)
  {
    uint64_t v6 = *(void *)v28;
    v24 = self;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        v9 = [(NSMapTable *)self->_initialSectionSnapshots objectForKey:v8];
        uint64_t v10 = [(NSMapTable *)self->_rebasedSectionSnapshots objectForKey:v8];
        id v11 = (void *)v10;
        if (v9)
        {
          if (v10) {
            goto LABEL_8;
          }
        }
        else
        {
          v18 = [MEMORY[0x1E4F28B00] currentHandler];
          [v18 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 440, @"Invalid parameter not satisfying: %@", @"sectionSnapshot" object file lineNumber description];

          if (v11)
          {
LABEL_8:
            if (v3) {
              goto LABEL_9;
            }
            goto LABEL_12;
          }
        }
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        [v19 handleFailureInMethod:a2, self, @"_UIDiffableDataSourceSectionSnapshotRebaser.m", 441, @"Invalid parameter not satisfying: %@", @"modifiedSectionSnapshot" object file lineNumber description];

        if (v3)
        {
LABEL_9:
          [v11 items];
          uint64_t v12 = v6;
          BOOL v13 = v3;
          v15 = id v14 = v5;
          id v16 = [v9 items];
          v17 = [v15 differenceFromArray:v16 withOptions:4];

          id v5 = v14;
          BOOL v3 = v13;
          uint64_t v6 = v12;
          self = v24;
          goto LABEL_13;
        }
LABEL_12:
        id v20 = objc_alloc(MEMORY[0x1E4F28F20]);
        v17 = (void *)[v20 initWithChanges:MEMORY[0x1E4F1CBF0]];
LABEL_13:
        char v21 = [[NSDiffableDataSourceSectionTransaction alloc] initWithSectionIdentifier:v8 initialSnapshot:v9 finalSnapshot:v11 difference:v17];
        [v5 addObject:v21];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v26);
  }

  return v5;
}

- (_UIDiffableDataSourceSectionSnapshotRebaser)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 initialSectionSnapshots:(id)a5
{
  return [(_UIDiffableDataSourceSectionSnapshotRebaser *)self initWithInitialSnapshot:a3 finalSnapshot:a4 initialSectionSnapshots:a5 dataSourceDiffer:0 shouldPerformChildSnapshotMoves:0];
}

- (id)computeReorderingTransaction
{
  return [(_UIDiffableDataSourceSectionSnapshotRebaser *)self _transactionIncludingSectionDifferences:1 source:1];
}

- (NSMapTable)rebasedSectionSnapshots
{
  return self->_rebasedSectionSnapshots;
}

@end