@interface _UIDiffableDataSourceTransaction
+ (id)applyTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6;
+ (id)reorderingTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6;
- (BOOL)isApplyTransaction;
- (BOOL)isEqual:(id)a3;
- (BOOL)isReorderingTransaction;
- (NSArray)sectionTransactions;
- (NSDiffableDataSourceSnapshot)finalSnapshot;
- (NSDiffableDataSourceSnapshot)initialSnapshot;
- (NSOrderedCollectionDifference)difference;
- (_NSRange)finalSectionGlobalItemRangeForSection:(int64_t)a3;
- (_NSRange)initalSectionGlobalItemRangeForSection:(int64_t)a3;
- (_UIDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 reorderedItemIdentifiers:(id)a6 difference:(id)a7 sectionTransactions:(id)a8;
- (id)description;
- (id)finalDataSourceSnapshotter;
- (id)finalIndexPathForInitialIndexPath:(id)a3;
- (id)finalIndexPathForSupplementaryElementOfKind:(id)a3 forInitialIndexPath:(id)a4;
- (id)initialDataSourceSnapshotter;
- (id)initialIndexPathForFinalIndexPath:(id)a3;
- (id)initialIndexPathForSupplementaryElementOfKind:(id)a3 forFinalIndexPath:(id)a4;
- (id)performDiffGeneratingUpdates;
- (id)reorderedItemIdentifiers;
- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3;
- (int64_t)finalSectionCount;
- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3;
- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3;
- (int64_t)initialSectionCount;
- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3;
- (int64_t)source;
@end

@implementation _UIDiffableDataSourceTransaction

- (BOOL)isReorderingTransaction
{
  return self->_source == 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionTransactions, 0);
  objc_storeStrong((id *)&self->_difference, 0);
  objc_storeStrong((id *)&self->_finalSnapshot, 0);
  objc_storeStrong((id *)&self->_initialSnapshot, 0);
  objc_storeStrong((id *)&self->_reorderedItemIdentifiers, 0);
}

- (_UIDiffableDataSourceTransaction)initWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 source:(int64_t)a5 reorderedItemIdentifiers:(id)a6 difference:(id)a7 sectionTransactions:(id)a8
{
  id v22 = a3;
  id v21 = a4;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v23.receiver = self;
  v23.super_class = (Class)_UIDiffableDataSourceTransaction;
  v18 = [(_UIDiffableDataSourceTransaction *)&v23 init];
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

+ (id)applyTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInitialSnapshot:v12 finalSnapshot:v11 source:0 reorderedItemIdentifiers:MEMORY[0x1E4F1CBF0] difference:v10 sectionTransactions:v9];

  return v13;
}

+ (id)reorderingTransactionWithInitialSnapshot:(id)a3 finalSnapshot:(id)a4 difference:(id)a5 sectionTransactions:(id)a6
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a6;
  id v13 = a4;
  id v14 = a3;
  id v15 = [v11 insertions];
  uint64_t v16 = [v15 count];
  id v17 = [v11 removals];
  unint64_t v18 = [v17 count] + v16;

  if (v18 >= 3)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, a1, @"UIDiffableDataSourceTransaction.m", 57, @"Invalid parameter not satisfying: %@", @"difference.insertions.count + difference.removals.count <= 2" object file lineNumber description];
  }
  v19 = [v11 insertions];
  uint64_t v20 = [v19 count];
  id v21 = [v11 removals];
  uint64_t v22 = [v21 count];

  if (v20 == v22)
  {
    objc_super v23 = [v11 insertions];
    v24 = [v23 objectAtIndexedSubscript:0];

    v25 = [v24 object];
    v30[0] = v25;
    v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
  }
  else
  {
    v26 = (void *)MEMORY[0x1E4F1CBF0];
  }
  v27 = (void *)[objc_alloc((Class)objc_opt_class()) initWithInitialSnapshot:v14 finalSnapshot:v13 source:1 reorderedItemIdentifiers:v26 difference:v11 sectionTransactions:v12];

  return v27;
}

- (id)reorderedItemIdentifiers
{
  return self->_reorderedItemIdentifiers;
}

- (int64_t)source
{
  return self->_source;
}

- (BOOL)isApplyTransaction
{
  return self->_source == 0;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = [NSNumber numberWithInteger:self->_source];
  objc_msgSend(v3, "stringWithFormat:", @"<%@: %p - source=%@; initialSnapshot=%p; finalSnapshot=%p; difference=%@; sectionTransactions=%p>",
    v5,
    self,
    v6,
    self->_initialSnapshot,
    self->_finalSnapshot,
    self->_difference,
  v7 = self->_sectionTransactions);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_UIDiffableDataSourceTransaction *)a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == self)
    {
      char v16 = 1;
    }
    else
    {
      v6 = v4;
      int64_t source = self->_source;
      if (source != [(_UIDiffableDataSourceTransaction *)v6 source]) {
        goto LABEL_9;
      }
      difference = self->_difference;
      id v9 = [(_UIDiffableDataSourceTransaction *)v6 difference];
      LODWORD(difference) = [(NSOrderedCollectionDifference *)difference isEqual:v9];

      if (!difference) {
        goto LABEL_9;
      }
      initialSnapshot = self->_initialSnapshot;
      id v11 = [(_UIDiffableDataSourceTransaction *)v6 initialSnapshot];
      LODWORD(initialSnapshot) = [(NSDiffableDataSourceSnapshot *)initialSnapshot isEqual:v11];

      if (!initialSnapshot) {
        goto LABEL_9;
      }
      finalSnapshot = self->_finalSnapshot;
      id v13 = [(_UIDiffableDataSourceTransaction *)v6 finalSnapshot];
      LODWORD(finalSnapshot) = [(NSDiffableDataSourceSnapshot *)finalSnapshot isEqual:v13];

      if (finalSnapshot)
      {
        sectionTransactions = self->_sectionTransactions;
        id v15 = [(_UIDiffableDataSourceTransaction *)v6 sectionTransactions];
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

- (id)initialDataSourceSnapshotter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __64___UIDiffableDataSourceTransaction_initialDataSourceSnapshotter__block_invoke;
  v4[3] = &unk_1E52E0928;
  v4[4] = self;
  v2 = [off_1E52D5400 snapshotterForSectionCountsProvider:v4];
  return v2;
}

- (id)finalDataSourceSnapshotter
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62___UIDiffableDataSourceTransaction_finalDataSourceSnapshotter__block_invoke;
  v4[3] = &unk_1E52E0928;
  v4[4] = self;
  v2 = [off_1E52D5400 snapshotterForSectionCountsProvider:v4];
  return v2;
}

- (id)performDiffGeneratingUpdates
{
  v3 = [(NSDiffableDataSourceSnapshot *)self->_initialSnapshot state];
  v4 = [(NSDiffableDataSourceSnapshot *)self->_finalSnapshot state];
  v5 = +[_UIDiffableDataSourceDiffer differWithBeforeDataSourceState:afterDataSourceState:]((uint64_t)_UIDiffableDataSourceDiffer, v3, v4);

  if (v5) {
    v6 = (void *)v5[1];
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (int64_t)finalGlobalIndexForInitialGlobalIndex:(int64_t)a3
{
  v6 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
  int64_t v7 = [v6 numberOfItems];

  if (v7 <= a3)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UIDiffableDataSourceTransaction.m", 159, @"Invalid parameter not satisfying: %@", @"initialGlobalIndex < self.initialSnapshot.numberOfItems" object file lineNumber description];
  }
  v8 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
  id v9 = [v8 itemIdentifiers];
  id v10 = [v9 objectAtIndexedSubscript:a3];

  id v11 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v12 = [v11 indexOfItemIdentifier:v10];

  return v12;
}

- (int64_t)initialGlobalIndexForFinalGlobalIndex:(int64_t)a3
{
  v6 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v7 = [v6 numberOfItems];

  if (v7 <= a3)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"UIDiffableDataSourceTransaction.m", 166, @"Invalid parameter not satisfying: %@", @"finalGlobalIndex < self.finalSnapshot.numberOfItems" object file lineNumber description];
  }
  v8 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
  id v9 = [v8 itemIdentifiers];
  id v10 = [v9 objectAtIndexedSubscript:a3];

  id v11 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
  int64_t v12 = [v11 indexOfItemIdentifier:v10];

  return v12;
}

- (id)finalIndexPathForInitialIndexPath:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 2)
  {
    v6 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
    int64_t v7 = [v6 identifierForIndexPath:v4];

    if (v7)
    {
      v8 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
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

- (id)initialIndexPathForFinalIndexPath:(id)a3
{
  id v4 = a3;
  if ((unint64_t)[v4 length] >= 2)
  {
    v6 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
    int64_t v7 = [v6 identifierForIndexPath:v4];

    if (v7)
    {
      v8 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
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

- (int64_t)finalSectionIndexForInitialSectionIndex:(int64_t)a3
{
  v6 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
  int64_t v7 = [v6 sectionIdentifiers];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIDiffableDataSourceTransaction.m", 199, @"Invalid parameter not satisfying: %@", @"initialSectionIndex < self.initialSnapshot.sectionIdentifiers.count" object file lineNumber description];
  }
  id v9 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
  id v10 = [v9 sectionIdentifiers];
  id v11 = [v10 objectAtIndexedSubscript:a3];

  int64_t v12 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v13 = [v12 indexOfSectionIdentifier:v11];

  return v13;
}

- (int64_t)initialSectionIndexForFinalSectionIndex:(int64_t)a3
{
  v6 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v7 = [v6 sectionIdentifiers];
  unint64_t v8 = [v7 count];

  if (v8 <= a3)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"UIDiffableDataSourceTransaction.m", 206, @"Invalid parameter not satisfying: %@", @"finalSectionIndex < self.finalSnapshot.sectionIdentifiers.count" object file lineNumber description];
  }
  id v9 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
  id v10 = [v9 sectionIdentifiers];
  id v11 = [v10 objectAtIndexedSubscript:a3];

  int64_t v12 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
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
  id v4 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
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
  id v4 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
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
  v2 = [(_UIDiffableDataSourceTransaction *)self initialSnapshot];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

- (int64_t)finalSectionCount
{
  v2 = [(_UIDiffableDataSourceTransaction *)self finalSnapshot];
  int64_t v3 = [v2 numberOfSections];

  return v3;
}

- (NSDiffableDataSourceSnapshot)initialSnapshot
{
  return self->_initialSnapshot;
}

- (NSDiffableDataSourceSnapshot)finalSnapshot
{
  return self->_finalSnapshot;
}

- (NSOrderedCollectionDifference)difference
{
  return self->_difference;
}

- (NSArray)sectionTransactions
{
  return self->_sectionTransactions;
}

@end