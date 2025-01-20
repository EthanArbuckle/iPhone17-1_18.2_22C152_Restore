@interface NSDiffableDataSourceTransaction
+ (id)_computeReorderingTransactionWithInitialSnapshot:(id)a3 reorderingUpdate:(id)a4 sectionSnapshotProvider:(id)a5;
+ (id)applyTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6;
+ (id)reorderingTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6;
- (BOOL)_containsItemIdentifier:(id)a3;
- (BOOL)isApplyTransaction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReorderingTransaction;
- (NSArray)reorderedItemIdentifiers;
- (NSArray)sectionTransactions;
- (NSDiffableDataSourceSnapshot)finalSnapshot;
- (NSDiffableDataSourceSnapshot)initialSnapshot;
- (NSDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 difference:(id)a6 finalSectionSnapshots:(id)a7;
- (NSDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 difference:(id)a6 reorderedItemIdentifiers:(id)a7 sectionTransactions:(id)a8;
- (NSDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 reorderedItemIdentifiers:(id)a6 difference:(id)a7 sectionTransactions:(id)a8;
- (NSDiffableDataSourceTransaction)transactionWithSectionTransactions:(id)a3;
- (NSOrderedCollectionDifference)difference;
- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3;
- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3;
- (id)_spiCopy;
- (id)description;
- (id)finalDataSourceSnapshotter;
- (id)finalIndexPathForInitialIndexPath:(id)a3;
- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4;
- (id)initialDataSourceSnapshotter;
- (id)initialIndexPathForFinalIndexPath:(id)a3;
- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4;
- (id)performDiffGeneratingUpdates;
- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3;
- (int64_t)finalSectionCount;
- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3;
- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3;
- (int64_t)initialSectionCount;
- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3;
- (int64_t)source;
@end

@implementation NSDiffableDataSourceTransaction

- (NSDiffableDataSourceSnapshot)finalSnapshot
{
  return self->_finalSnapshot;
}

- (NSDiffableDataSourceSnapshot)initialSnapshot
{
  return self->_initialSnapshot;
}

- (NSArray)sectionTransactions
{
  return self->_sectionTransactions;
}

- (BOOL)isReorderingTransaction
{
  return self->_source == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reorderedItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_sectionTransactions, 0);
  objc_storeStrong((id *)&self->_difference, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
}

- (NSDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 reorderedItemIdentifiers:(id)a6 difference:(id)a7 sectionTransactions:(id)a8
{
  id v22 = a3;
  id v21 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)NSDiffableDataSourceTransaction;
  v18 = [(NSDiffableDataSourceTransaction *)&v23 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_initialSnapshot, a3);
    objc_storeStrong((id *)&v19->_finalSnapshot, a4);
    v19->_source = a5;
    objc_storeStrong((id *)&v19->_reorderedItemIdentifiers, a6);
    objc_storeStrong((id *)&v19->_difference, a7);
    objc_storeStrong((id *)&v19->_sectionTransactions, a8);
  }

  return v19;
}

- (NSDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 difference:(id)a6 reorderedItemIdentifiers:(id)a7 sectionTransactions:(id)a8
{
  return [(NSDiffableDataSourceTransaction *)self initWithInitialSnapshot:a3 finalSnapshot:a4 source:a5 reorderedItemIdentifiers:a7 difference:a6 sectionTransactions:a8];
}

- (NSDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 difference:(id)a6 finalSectionSnapshots:(id)a7
{
  v24 = self;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v27 = a4;
  id v25 = a6;
  id v10 = a7;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = [v10 keyEnumerator];
  uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v31;
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v31 != v14) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        v18 = objc_msgSend(v10, "objectForKey:", v17, v24);
        v19 = [NSDiffableDataSourceSectionTransaction alloc];
        v20 = (void *)[objc_alloc(MEMORY[0x1E4F28F20]) initWithChanges:v15];
        id v21 = [(NSDiffableDataSourceSectionTransaction *)v19 initWithSectionIdentifier:v17 initialSnapshot:v18 finalSnapshot:v18 difference:v20];

        [v11 addObject:v21];
      }
      uint64_t v13 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v13);
  }

  id v22 = [(NSDiffableDataSourceTransaction *)v24 initWithInitialSnapshot:v28 finalSnapshot:v27 source:a5 reorderedItemIdentifiers:MEMORY[0x1E4F1CBF0] difference:v25 sectionTransactions:v11];
  return v22;
}

+ (id)applyTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInitialSnapshot:v12 finalSnapshot:v11 source:0 reorderedItemIdentifiers:MEMORY[0x1E4F1CBF0] difference:v10 sectionTransactions:v9];

  return v13;
}

- (id)finalIndexPathForInitialIndexPath:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 2)
  {
    v6 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
    v7 = [v6 identifierForIndexPath:v4];

    if (v7)
    {
      v8 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
      v5 = [v8 indexPathForIdentifier:v7];
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_spiCopy
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(NSDiffableDataSourceTransaction *)self sectionTransactions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) _spiCopy];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v10 = [_UIDiffableDataSourceTransaction alloc];
  id v11 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  id v12 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v13 = [(NSDiffableDataSourceTransaction *)self source];
  uint64_t v14 = [(NSDiffableDataSourceTransaction *)self reorderedItemIdentifiers];
  uint64_t v15 = [(NSDiffableDataSourceTransaction *)self difference];
  id v16 = [(_UIDiffableDataSourceTransaction *)v10 initWithInitialSnapshot:v11 finalSnapshot:v12 source:v13 reorderedItemIdentifiers:v14 difference:v15 sectionTransactions:v3];

  return v16;
}

- (int64_t)source
{
  return self->_source;
}

- (NSArray)reorderedItemIdentifiers
{
  return self->_reorderedItemIdentifiers;
}

- (NSOrderedCollectionDifference)difference
{
  return self->_difference;
}

+ (id)reorderingTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = [v11 insertions];
  uint64_t v16 = [v15 count];
  uint64_t v17 = [v11 removals];
  unint64_t v18 = [v17 count] + v16;

  if (v18 >= 3)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"NSDiffableDataSourceTransaction.m", 103, @"Invalid parameter not satisfying: %@", @"difference.insertions.count + difference.removals.count <= 2" object file lineNumber description];
  }
  if (![v11 hasChanges]) {
    goto LABEL_6;
  }
  long long v19 = [v11 insertions];
  uint64_t v20 = [v19 count];
  long long v21 = [v11 removals];
  uint64_t v22 = [v21 count];

  if (v20 == v22)
  {
    uint64_t v23 = [v11 insertions];
    v24 = [v23 objectAtIndexedSubscript:0];

    id v25 = [v24 object];
    v30[0] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  }
  else
  {
LABEL_6:
    v26 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v27 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInitialSnapshot:v14 finalSnapshot:v13 source:1 reorderedItemIdentifiers:v26 difference:v11 sectionTransactions:v12];

  return v27;
}

- (BOOL)isApplyTransaction
{
  return self->_source == 0;
}

- (id)description
{
  id v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [NSNumber numberWithInteger:self->_source];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p - source=%@; initialSnapshot=%p; finalSnapshot=%p; difference=%@; sectionTransactions=%p>",
    v5,
    self,
    v6,
    self->_initialSnapshot,
    self->_finalSnapshot,
    self->_difference,
  uint64_t v7 = self->_sectionTransactions);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NSDiffableDataSourceTransaction *)a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      char v16 = 1;
    }
    else
    {
      uint64_t v6 = v4;
      int64_t source = self->_source;
      if (source != [(NSDiffableDataSourceTransaction *)v6 source]) {
        goto LABEL_9;
      }
      difference = self->_difference;
      id v9 = [(NSDiffableDataSourceTransaction *)v6 difference];
      LODWORD(difference) = [(NSOrderedCollectionDifference *)difference isEqual:v9];

      if (!difference) {
        goto LABEL_9;
      }
      initialSnapshot = self->_initialSnapshot;
      id v11 = [(NSDiffableDataSourceTransaction *)v6 initialSnapshot];
      LODWORD(initialSnapshot) = [(NSDiffableDataSourceSnapshot *)initialSnapshot isEqual:v11];

      if (!initialSnapshot) {
        goto LABEL_9;
      }
      finalSnapshot = self->_finalSnapshot;
      id v13 = [(NSDiffableDataSourceTransaction *)v6 finalSnapshot];
      LODWORD(finalSnapshot) = [(NSDiffableDataSourceSnapshot *)finalSnapshot isEqual:v13];

      if (finalSnapshot)
      {
        sectionTransactions = self->_sectionTransactions;
        uint64_t v15 = [(NSDiffableDataSourceTransaction *)v6 sectionTransactions];
        char v16 = [(NSArray *)sectionTransactions isEqualToArray:v15];
      }
      else
      {
LABEL_9:
        char v16 = 0;
      }
    }
  }
  else
  {
    char v16 = 0;
  }

  return v16;
}

- (BOOL)_containsItemIdentifier:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(NSDiffableDataSourceSnapshot *)self->_finalSnapshot indexOfItemIdentifier:v4] == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v5 = self->_sectionTransactions;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "finalSnapshot", (void)v12);
          char v10 = [v9 containsItem:v4];

          if (v10)
          {
            LOBYTE(v6) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v6) = 1;
  }

  return v6;
}

- (NSDiffableDataSourceTransaction)transactionWithSectionTransactions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)objc_opt_class());
  uint64_t v6 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  uint64_t v7 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v8 = [(NSDiffableDataSourceTransaction *)self source];
  id v9 = [(NSDiffableDataSourceTransaction *)self reorderedItemIdentifiers];
  char v10 = [(NSDiffableDataSourceTransaction *)self difference];
  id v11 = (void *)[v5 initWithInitialSnapshot:v6 finalSnapshot:v7 source:v8 reorderedItemIdentifiers:v9 difference:v10 sectionTransactions:v4];

  return (NSDiffableDataSourceTransaction *)v11;
}

+ (id)_computeReorderingTransactionWithInitialSnapshot:(id)a3 reorderingUpdate:(id)a4 sectionSnapshotProvider:(id)a5
{
  v81[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = (void (**)(void, void *))a5;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
LABEL_42:
    v65 = [MEMORY[0x1E4F28B00] currentHandler];
    [v65 handleFailureInMethod:a2, a1, @"NSDiffableDataSourceTransaction.m", 217, @"Invalid parameter not satisfying: %@", @"reorderingUpdate" object file lineNumber description];

    if (v11) {
      goto LABEL_4;
    }
    goto LABEL_43;
  }
  v64 = [MEMORY[0x1E4F28B00] currentHandler];
  [v64 handleFailureInMethod:a2, a1, @"NSDiffableDataSourceTransaction.m", 216, @"Invalid parameter not satisfying: %@", @"initialSnapshot" object file lineNumber description];

  if (!v10) {
    goto LABEL_42;
  }
LABEL_3:
  if (v11) {
    goto LABEL_4;
  }
LABEL_43:
  v66 = [MEMORY[0x1E4F28B00] currentHandler];
  [v66 handleFailureInMethod:a2, a1, @"NSDiffableDataSourceTransaction.m", 218, @"Invalid parameter not satisfying: %@", @"sectionSnapshotProvider" object file lineNumber description];

LABEL_4:
  long long v12 = [v10 indexPathBeforeUpdate];
  long long v13 = [v10 indexPathAfterUpdate];
  if ([v12 isEqual:v13])
  {
    id v14 = objc_alloc(MEMORY[0x1E4F28F20]);
    uint64_t v15 = MEMORY[0x1E4F1CBF0];
    char v16 = (void *)[v14 initWithChanges:MEMORY[0x1E4F1CBF0]];
    uint64_t v17 = +[NSDiffableDataSourceTransaction applyTransactionWithInitialSnapshot:v9 finalSnapshot:v9 difference:v16 sectionTransactions:v15];

    goto LABEL_38;
  }
  v75 = (void *)[v9 copy];
  id v72 = v10;
  if (v13)
  {
    uint64_t v18 = [v9 identifierForIndexPath:v13];
  }
  else
  {
    uint64_t v18 = 0;
  }
  v71 = v12;
  uint64_t v19 = [v9 identifierForIndexPath:v12];
  uint64_t v20 = [v9 sectionIdentifierForSectionContainingItemIdentifier:v19];
  v73 = v11;
  v74 = (void *)v20;
  v70 = (void *)v18;
  if (v18)
  {
    long long v21 = (void *)v20;
    uint64_t v22 = [v75 indexOfItemIdentifier:v19];
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v23 = v22;
      uint64_t v24 = [v75 indexOfItemIdentifier:v18];
      uint64_t v25 = [v75 sectionIdentifierForSectionContainingItemIdentifier:v18];
      if (v24 <= v23)
      {
        v81[0] = v19;
        v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
        [v75 deleteItemsWithIdentifiers:v36];
      }
      else
      {
        int v26 = [v21 isEqual:v25];
        v81[0] = v19;
        id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:1];
        [v75 deleteItemsWithIdentifiers:v27];

        if (v26)
        {
          uint64_t v80 = v19;
          id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
          [v75 insertItemsWithIdentifiers:v28 afterItemWithIdentifier:v18];
LABEL_22:
          uint64_t v35 = v25;

          goto LABEL_23;
        }
      }
      uint64_t v79 = v19;
      id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
      [v75 insertItemsWithIdentifiers:v28 beforeItemWithIdentifier:v18];
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v29 = [v13 section];
    if ((unint64_t)[v13 length] >= 2)
    {
      long long v30 = [v9 sectionIdentifiers];
      unint64_t v31 = [v30 count];

      if (v29 < v31)
      {
        uint64_t v32 = [v13 item];
        long long v33 = [v75 sectionIdentifiers];
        uint64_t v25 = objc_msgSend(v33, "objectAtIndexedSubscript:", objc_msgSend(v13, "section"));

        if (v32 > [v9 numberOfItemsInSection:v25])
        {
          v67 = [MEMORY[0x1E4F28B00] currentHandler];
          [v67 handleFailureInMethod:a2, a1, @"NSDiffableDataSourceTransaction.m", 259, @"Invalid parameter not satisfying: %@", @"destinationIndex <= [initialSnapshot numberOfItemsInSection:destinationSectionIdentifier]" object file lineNumber description];
        }
        uint64_t v78 = v19;
        v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v78 count:1];
        [v75 deleteItemsWithIdentifiers:v34];

        uint64_t v77 = v19;
        id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v77 count:1];
        [v75 appendItemsWithIdentifiers:v28 intoSectionWithIdentifier:v25];
        goto LABEL_22;
      }
    }
  }
  uint64_t v35 = 0;
LABEL_23:
  uint64_t v37 = [v9 indexOfItemIdentifier:v19];
  uint64_t v38 = [v75 indexOfItemIdentifier:v19];
  v39 = [MEMORY[0x1E4F28F18] changeWithObject:v19 type:1 index:v37 associatedIndex:v38];
  v40 = [MEMORY[0x1E4F28F18] changeWithObject:v19 type:0 index:v38 associatedIndex:v37];
  id v41 = objc_alloc(MEMORY[0x1E4F28F20]);
  v76[0] = v39;
  v76[1] = v40;
  v42 = [MEMORY[0x1E4F1C978] arrayWithObjects:v76 count:2];
  v69 = (void *)[v41 initWithChanges:v42];

  v43 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
  v44 = (void *)v35;
  if (v74 && v35)
  {
    int v45 = [v74 isEqual:v35];
    v46 = v73;
    if (v45)
    {
      v47 = v73[2](v73, v74);
      if (v47)
      {
        v48 = v43;
        v49 = v47;
        v50 = v74;
LABEL_35:
        [v48 setObject:v49 forKey:v50];
        goto LABEL_36;
      }
      goto LABEL_36;
    }
  }
  else
  {
    v46 = v73;
    if (!v74) {
      goto LABEL_32;
    }
  }
  v51 = v46[2](v46, v74);
  if (v51) {
    [v43 setObject:v51 forKey:v74];
  }

LABEL_32:
  if (v44)
  {
    v47 = v46[2](v46, v44);
    if (v47)
    {
      v48 = v43;
      v49 = v47;
      v50 = v44;
      goto LABEL_35;
    }
LABEL_36:
  }
  v52 = [_UIIdentifierDiffer alloc];
  [v9 state];
  v68 = (void *)v19;
  v54 = v53 = v44;
  v55 = [v54 identifiers];
  v56 = [v75 state];
  v57 = [v56 identifiers];
  v58 = -[_UIIdentifierDiffer initWithBeforeIdentifiers:afterIdentifiers:collectionDifference:]((id *)&v52->super.isa, v55, v57, v69);

  v59 = [v9 state];
  v60 = [v75 state];
  v61 = +[_UIDiffableDataSourceDiffer differWithBeforeDataSourceState:afterDataSourceState:itemIdentifierDiffer:]((uint64_t)_UIDiffableDataSourceDiffer, v59, v60, v58);

  v62 = [[_UIDiffableDataSourceSectionSnapshotRebaser alloc] initWithInitialSnapshot:v9 finalSnapshot:v75 initialSectionSnapshots:v43 dataSourceDiffer:v61 shouldPerformChildSnapshotMoves:1];
  uint64_t v17 = [(_UIDiffableDataSourceSectionSnapshotRebaser *)v62 computeReorderingTransaction];

  id v11 = v73;
  long long v12 = v71;
  id v10 = v72;
LABEL_38:

  return v17;
}

- (id)initialDataSourceSnapshotter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__NSDiffableDataSourceTransaction_initialDataSourceSnapshotter__block_invoke;
  v4[3] = &unk_1E52E0928;
  v4[4] = self;
  v2 = [off_1E52D5400 snapshotterForSectionCountsProvider:v4];
  return v2;
}

uint64_t __63__NSDiffableDataSourceTransaction_initialDataSourceSnapshotter__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) initialSnapshot];
  id v5 = v4;
  if (a2 < 0)
  {
    uint64_t v9 = [v4 numberOfSections];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) initialSnapshot];
    uint64_t v7 = [v6 sectionIdentifiers];
    int64_t v8 = [v7 objectAtIndexedSubscript:a2];
    uint64_t v9 = [v5 numberOfItemsInSection:v8];
  }
  return v9;
}

- (id)finalDataSourceSnapshotter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __61__NSDiffableDataSourceTransaction_finalDataSourceSnapshotter__block_invoke;
  v4[3] = &unk_1E52E0928;
  v4[4] = self;
  v2 = [off_1E52D5400 snapshotterForSectionCountsProvider:v4];
  return v2;
}

uint64_t __61__NSDiffableDataSourceTransaction_finalDataSourceSnapshotter__block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) finalSnapshot];
  id v5 = v4;
  if (a2 < 0)
  {
    uint64_t v9 = [v4 numberOfSections];
  }
  else
  {
    uint64_t v6 = [*(id *)(a1 + 32) finalSnapshot];
    uint64_t v7 = [v6 sectionIdentifiers];
    int64_t v8 = [v7 objectAtIndexedSubscript:a2];
    uint64_t v9 = [v5 numberOfItemsInSection:v8];
  }
  return v9;
}

- (id)performDiffGeneratingUpdates
{
  id v3 = [(NSDiffableDataSourceSnapshot *)self->_initialSnapshot state];
  id v4 = [(NSDiffableDataSourceSnapshot *)self->_finalSnapshot state];
  id v5 = +[_UIDiffableDataSourceDiffer differWithBeforeDataSourceState:afterDataSourceState:]((uint64_t)_UIDiffableDataSourceDiffer, v3, v4);

  if (v5) {
    uint64_t v6 = (void *)v5[1];
  }
  else {
    uint64_t v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3
{
  uint64_t v6 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  int64_t v7 = [v6 numberOfItems];

  if (v7 <= a3)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"NSDiffableDataSourceTransaction.m", 356, @"Invalid parameter not satisfying: %@", @"initialGlobalIndex < self.initialSnapshot.numberOfItems" object file lineNumber description];
  }
  int64_t v8 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  uint64_t v9 = [v8 itemIdentifiers];
  id v10 = [v9 objectAtIndexedSubscript:a3];

  id v11 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v12 = [v11 indexOfItemIdentifier:v10];

  return v12;
}

- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3
{
  uint64_t v6 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v7 = [v6 numberOfItems];

  if (v7 <= a3)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"NSDiffableDataSourceTransaction.m", 363, @"Invalid parameter not satisfying: %@", @"finalGlobalIndex < self.finalSnapshot.numberOfItems" object file lineNumber description];
  }
  int64_t v8 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  uint64_t v9 = [v8 itemIdentifiers];
  id v10 = [v9 objectAtIndexedSubscript:a3];

  id v11 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  int64_t v12 = [v11 indexOfItemIdentifier:v10];

  return v12;
}

- (id)initialIndexPathForFinalIndexPath:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 2)
  {
    uint64_t v6 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
    int64_t v7 = [v6 identifierForIndexPath:v4];

    if (v7)
    {
      int64_t v8 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
      id v5 = [v8 indexPathForIdentifier:v7];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3
{
  uint64_t v6 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  int64_t v7 = [v6 sectionIdentifiers];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"NSDiffableDataSourceTransaction.m", 396, @"Invalid parameter not satisfying: %@", @"initialSectionIndex < self.initialSnapshot.sectionIdentifiers.count" object file lineNumber description];
  }
  uint64_t v9 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  id v10 = [v9 sectionIdentifiers];
  id v11 = [v10 objectAtIndexedSubscript:a3];

  int64_t v12 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v13 = [v12 indexOfSectionIdentifier:v11];

  return v13;
}

- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3
{
  uint64_t v6 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v7 = [v6 sectionIdentifiers];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"NSDiffableDataSourceTransaction.m", 403, @"Invalid parameter not satisfying: %@", @"finalSectionIndex < self.finalSnapshot.sectionIdentifiers.count" object file lineNumber description];
  }
  uint64_t v9 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  id v10 = [v9 sectionIdentifiers];
  id v11 = [v10 objectAtIndexedSubscript:a3];

  int64_t v12 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  int64_t v13 = [v12 indexOfSectionIdentifier:v11];

  return v13;
}

- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4
{
  return 0;
}

- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4
{
  return 0;
}

- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3
{
  id v4 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  uint64_t v5 = [v4 sectionGlobalItemRangeForSection:a3];
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3
{
  id v4 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  uint64_t v5 = [v4 sectionGlobalItemRangeForSection:a3];
  NSUInteger v7 = v6;

  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (int64_t)initialSectionCount
{
  v2 = [(NSDiffableDataSourceTransaction *)self initialSnapshot];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

- (int64_t)finalSectionCount
{
  v2 = [(NSDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

@end