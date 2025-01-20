@interface ICTableColumnTextStorage
- (BOOL)preventEditingUpdates;
- (BOOL)shouldPreventUndoCommands;
- (BOOL)wantsTimestampUpdates;
- (BOOL)wantsUndoCommands;
- (ICTable)table;
- (ICTableColumnTextStorage)init;
- (ICTableColumnTextStorage)initWithTable:(id)a3 columnID:(id)a4 replicaID:(id)a5;
- (ICTableUndoHelping)undoHelper;
- (NSArray)populatedRows;
- (NSMutableArray)rows;
- (NSMutableDictionary)mergeableStringDelegates;
- (NSMutableIndexSet)rowStartIndexes;
- (NSUUID)columnID;
- (_NSRange)characterRangeForRowID:(id)a3;
- (_NSRange)logicalRangeForLocation:(unint64_t)a3;
- (id)editAtIndex:(unint64_t)a3;
- (id)mergeableStringForRowID:(id)a3;
- (id)rowAtIndex:(unint64_t)a3 rowRange:(_NSRange *)a4;
- (id)savedSelectionWithSelectionAffinity:(unint64_t)a3;
- (unint64_t)indexOfRow:(id)a3;
- (unint64_t)indexOfRowAtLocation:(unint64_t)a3;
- (unint64_t)insertionIndexForRow:(id)a3;
- (unint64_t)nextLocationAfterRowLocation:(unint64_t)a3;
- (unint64_t)preventEditingUpdatesCount;
- (unint64_t)rowLocationForRowID:(id)a3;
- (unint64_t)rowLocationForRowIndex:(unint64_t)a3;
- (void)beginPreventEditingUpdates;
- (void)breakUndoCoalescing;
- (void)closeUndoGroups;
- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5;
- (void)endPreventEditingUpdates;
- (void)enumerateEditsInRange:(_NSRange)a3 usingBlock:(id)a4;
- (void)removeRow:(id)a3;
- (void)removeTextForRow:(id)a3;
- (void)resetUndoManager;
- (void)restoreSelection:(id)a3;
- (void)setPreventEditingUpdatesCount:(unint64_t)a3;
- (void)setShouldPreventUndoCommands:(BOOL)a3;
- (void)setUndoHelper:(id)a3;
- (void)tableCellWasEditedAtColumnID:(id)a3 rowID:(id)a4 edited:(unint64_t)a5 range:(_NSRange)a6 changeInLength:(int64_t)a7;
- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6;
- (void)updateStorageForMovedRow:(id)a3;
@end

@implementation ICTableColumnTextStorage

- (ICTableColumnTextStorage)init
{
  return 0;
}

- (ICTableColumnTextStorage)initWithTable:(id)a3 columnID:(id)a4 replicaID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)ICTableColumnTextStorage;
  v10 = [(ICTTTextStorage *)&v19 initWithData:0 replicaID:a5];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_table, v8);
    objc_storeStrong((id *)&v11->_columnID, a4);
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    rows = v11->_rows;
    v11->_rows = (NSMutableArray *)v12;

    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    mergeableStringDelegates = v11->_mergeableStringDelegates;
    v11->_mergeableStringDelegates = (NSMutableDictionary *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28E60] indexSet];
    rowStartIndexes = v11->_rowStartIndexes;
    v11->_rowStartIndexes = (NSMutableIndexSet *)v16;

    [(ICTTTextStorage *)v11 setConvertAttributes:0];
    [(ICTTTextStorage *)v11 setWantsUndoCommands:0];
    [(ICTTTextStorage *)v11 setShouldConvertTablesToTabs:1];
    [(ICTableColumnTextStorage *)v11 setPreventEditingUpdatesCount:0];
  }

  return v11;
}

- (NSArray)populatedRows
{
  v2 = [(ICTableColumnTextStorage *)self rows];
  v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (_NSRange)characterRangeForRowID:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(ICTableColumnTextStorage *)self rowLocationForRowID:v4];
  v6 = [(ICTableColumnTextStorage *)self mergeableStringForRowID:v4];

  uint64_t v7 = [v6 length];
  NSUInteger v8 = v5;
  NSUInteger v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (unint64_t)indexOfRow:(id)a3
{
  unint64_t v4 = [(ICTableColumnTextStorage *)self rowLocationForRowID:a3];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return [(ICTableColumnTextStorage *)self indexOfRowAtLocation:v4];
}

- (void)removeTextForRow:(id)a3
{
  id v14 = a3;
  unint64_t v4 = [(ICTableColumnTextStorage *)self rows];
  int v5 = [v4 containsObject:v14];

  if (v5)
  {
    unint64_t v6 = [(ICTableColumnTextStorage *)self rowLocationForRowID:v14];
    uint64_t v7 = [(ICTableColumnTextStorage *)self rowStartIndexes];
    uint64_t v8 = [v7 indexGreaterThanIndex:v6];

    unint64_t v9 = v6;
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v8 = [(ICTTTextStorage *)self length];
      if (v6) {
        unint64_t v9 = v6 - 1;
      }
      else {
        unint64_t v9 = 0;
      }
    }
    v10 = [(ICTableColumnTextStorage *)self rows];
    [v10 removeObject:v14];

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = [(ICTableColumnTextStorage *)self rowStartIndexes];
      [v11 removeIndex:v6];

      [(ICTableColumnTextStorage *)self beginPreventEditingUpdates];
      -[ICTableColumnTextStorage deleteCharactersInRange:](self, "deleteCharactersInRange:", v9, v8 - v9);
      [(ICTableColumnTextStorage *)self endPreventEditingUpdates];
      uint64_t v12 = [(ICTableColumnTextStorage *)self rowStartIndexes];
      [v12 shiftIndexesStartingAtIndex:v8 by:v6 - v8];
    }
    v13 = [(ICTableColumnTextStorage *)self mergeableStringDelegates];
    [v13 removeObjectForKey:v14];
  }
}

- (void)removeRow:(id)a3
{
  id v7 = a3;
  unint64_t v4 = [(ICTableColumnTextStorage *)self rows];
  int v5 = [v4 containsObject:v7];

  if (v5)
  {
    [(ICTableColumnTextStorage *)self removeTextForRow:v7];
    unint64_t v6 = [(ICTableColumnTextStorage *)self mergeableStringDelegates];
    [v6 removeObjectForKey:v7];
  }
}

- (void)updateStorageForMovedRow:(id)a3
{
  id v6 = a3;
  unint64_t v4 = [(ICTableColumnTextStorage *)self rows];
  int v5 = [v4 containsObject:v6];

  if (v5)
  {
    [(ICTableColumnTextStorage *)self removeTextForRow:v6];
    [(ICTableColumnTextStorage *)self rowLocationForRowID:v6];
  }
}

- (_NSRange)logicalRangeForLocation:(unint64_t)a3
{
  NSUInteger v6 = 0;
  NSUInteger v7 = 0;
  id v3 = [(ICTableColumnTextStorage *)self rowAtIndex:a3 rowRange:&v6];
  NSUInteger v4 = v6;
  NSUInteger v5 = v7;
  result.length = v5;
  result.location = v4;
  return result;
}

- (id)mergeableStringForRowID:(id)a3
{
  id v4 = a3;
  NSUInteger v5 = [(ICTableColumnTextStorage *)self table];
  NSUInteger v6 = [(ICTableColumnTextStorage *)self columnID];
  NSUInteger v7 = [v5 mergeableStringForColumnID:v6 rowID:v4];

  return v7;
}

- (unint64_t)indexOfRowAtLocation:(unint64_t)a3
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v4 = [(ICTableColumnTextStorage *)self rowStartIndexes];
  uint64_t v5 = [v4 containsIndex:a3];
  if ((v5 & 1) == 0) {
    uint64_t v5 = [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[rowStartIndexes containsIndex:rowLocation]" functionName:"-[ICTableColumnTextStorage indexOfRowAtLocation:]" simulateCrash:1 showAlert:0 format:@"rowLocation must be valid"];
  }
  if (a3)
  {
    MEMORY[0x1F4188790](v5);
    uint64_t v6 = 0;
    v12[0] = 0;
    v12[1] = a3 + 1;
    do
    {
      unint64_t v7 = [v4 getIndexes:v11 maxCount:64 inIndexRange:v12];
      v6 += v7;
    }
    while (v7 > 0x3F);
    unint64_t v8 = v7;
    if (!v6) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"indexOfRowID > 0" functionName:"-[ICTableColumnTextStorage indexOfRowAtLocation:]" simulateCrash:1 showAlert:0 format:@"no indexes found"];
    }
    if ((v6 & 0x3Fu) > v8) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"indexOfRowID % bufferSize <= numIndexes" functionName:"-[ICTableColumnTextStorage indexOfRowAtLocation:]" simulateCrash:1 showAlert:0 format:@"rowAtIndex: index out of bounds of filled buffer"];
    }
    unint64_t v9 = v6 - 1;
    if (v11[(v6 - 1) & 0x3F] != a3) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"indexBuffer[indexOfRowID % bufferSize] == rowLocation" functionName:"-[ICTableColumnTextStorage indexOfRowAtLocation:]" simulateCrash:1 showAlert:0 format:@"expected to find matching row location"];
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

- (id)rowAtIndex:(unint64_t)a3 rowRange:(_NSRange *)a4
{
  unint64_t v7 = [(ICTableColumnTextStorage *)self rowStartIndexes];
  if ([v7 count])
  {
    NSUInteger v8 = [v7 indexLessThanOrEqualToIndex:a3];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"rowLocation != NSNotFound" functionName:"-[ICTableColumnTextStorage rowAtIndex:rowRange:]" simulateCrash:1 showAlert:0 format:@"row location should be found"];
    }
    unint64_t v9 = [(ICTableColumnTextStorage *)self indexOfRowAtLocation:v8];
    v10 = [(ICTableColumnTextStorage *)self rows];
    v11 = [v10 objectAtIndexedSubscript:v9];

    if (a4)
    {
      uint64_t v12 = [(ICTableColumnTextStorage *)self mergeableStringForRowID:v11];
      NSUInteger v13 = [v12 length];

      a4->location = v8;
      a4->length = v13;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unint64_t)insertionIndexForRow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTableColumnTextStorage *)self rows];
  unint64_t v6 = [v5 indexOfObject:v4];
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v7 = [(ICTableColumnTextStorage *)self table];
    unint64_t v8 = [v7 rowIndexForIdentifier:v4];

    unint64_t v9 = [v5 count];
    if (v8 >= v9) {
      unint64_t v10 = v9;
    }
    else {
      unint64_t v10 = v8;
    }
    unint64_t v16 = v10;
    if (v10)
    {
      v11 = [v5 objectAtIndexedSubscript:v10 - 1];
      uint64_t v12 = [(ICTableColumnTextStorage *)self table];
      unint64_t v13 = [v12 rowIndexForIdentifier:v11];

      if (v13 > v10)
      {
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __49__ICTableColumnTextStorage_insertionIndexForRow___block_invoke;
        v15[3] = &unk_1E5FD8FC0;
        v15[4] = self;
        objc_msgSend(v5, "ic_indexOfSortedObject:insertionIndex:usingComparator:", v4, &v16, v15);
      }

      unint64_t v6 = v16;
    }
    else
    {
      unint64_t v6 = 0;
    }
  }

  return v6;
}

uint64_t __49__ICTableColumnTextStorage_insertionIndexForRow___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  unint64_t v8 = [v5 table];
  uint64_t v9 = [v8 rowIndexForIdentifier:v7];

  unint64_t v10 = [*(id *)(a1 + 32) table];
  uint64_t v11 = [v10 rowIndexForIdentifier:v6];

  uint64_t v12 = [NSNumber numberWithUnsignedInteger:v9];
  unint64_t v13 = [NSNumber numberWithUnsignedInteger:v11];
  uint64_t v14 = [v12 compare:v13];

  return v14;
}

- (unint64_t)rowLocationForRowID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(ICTableColumnTextStorage *)self rows];
  uint64_t v6 = [v5 indexOfObject:v4];
  id v7 = [(ICTableColumnTextStorage *)self mergeableStringForRowID:v4];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__ICTableColumnTextStorage_rowLocationForRowID___block_invoke;
  aBlock[3] = &unk_1E5FD8FE8;
  aBlock[4] = self;
  id v8 = v4;
  id v35 = v8;
  id v9 = v7;
  id v36 = v9;
  unint64_t v10 = (void (**)(void))_Block_copy(aBlock);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v20 = [(ICTableColumnTextStorage *)self rowLocationForRowIndex:v6];
    if (!v9) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  uint64_t v11 = [(ICTableColumnTextStorage *)self table];
  int v12 = [v11 containsRow:v8];

  if (!v12)
  {
    unint64_t v20 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v9) {
      goto LABEL_25;
    }
    goto LABEL_22;
  }
  unint64_t v13 = [(ICTableColumnTextStorage *)self insertionIndexForRow:v8];
  uint64_t v14 = [v9 attributedString];
  v15 = (void *)[v14 mutableCopy];

  uint64_t v16 = objc_msgSend(v15, "ic_range");
  uint64_t v18 = v17;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __48__ICTableColumnTextStorage_rowLocationForRowID___block_invoke_2;
  v32[3] = &unk_1E5FD9010;
  v32[4] = self;
  id v19 = v15;
  id v33 = v19;
  objc_msgSend(v19, "enumerateAttributesInRange:options:usingBlock:", v16, v18, 0, v32);
  if (!v19) {
    id v19 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  }
  if (v13 >= [v5 count])
  {
    if (v13 != [v5 count]) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"insertionIndex == rows.count" functionName:"-[ICTableColumnTextStorage rowLocationForRowID:]" simulateCrash:1 showAlert:0 format:@"insertion index should not be greater than count"];
    }
    if (v13)
    {
      unint64_t v20 = [(ICTTTextStorage *)self length] + 1;
      v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
      [v19 insertAttributedString:v21 atIndex:0];
    }
    else
    {
      unint64_t v20 = 0;
    }
  }
  else
  {
    unint64_t v20 = [(ICTableColumnTextStorage *)self rowLocationForRowIndex:v13];
    objc_msgSend(v19, "ic_appendString:", @"\n");
  }
  v22 = [(ICTableColumnTextStorage *)self rows];
  [v22 insertObject:v8 atIndex:v13];

  if (v9) {
    v10[2](v10);
  }
  uint64_t v23 = [v19 length];
  v24 = [(ICTableColumnTextStorage *)self rowStartIndexes];
  [v24 shiftIndexesStartingAtIndex:v20 by:v23];

  v25 = [(ICTableColumnTextStorage *)self rowStartIndexes];
  [v25 addIndex:v20];

  [(ICTableColumnTextStorage *)self beginPreventEditingUpdates];
  unint64_t v26 = [(ICTTTextStorage *)self length];
  if (v20 >= v26) {
    unint64_t v27 = v26;
  }
  else {
    unint64_t v27 = v20;
  }
  [(ICTableColumnTextStorage *)self insertAttributedString:v19 atIndex:v27];
  [(ICTableColumnTextStorage *)self endPreventEditingUpdates];

  if (v9)
  {
LABEL_22:
    v28 = [(ICTableColumnTextStorage *)self mergeableStringDelegates];
    v29 = [v28 objectForKeyedSubscript:v8];

    if (!v29)
    {
      v10[2](v10);
      if ([(ICTableColumnTextStorage *)self nextLocationAfterRowLocation:v20] == v20 + 1)
      {
        v30 = [(ICTableColumnTextStorage *)self columnID];
        -[ICTableColumnTextStorage tableCellWasEditedAtColumnID:rowID:edited:range:changeInLength:](self, "tableCellWasEditedAtColumnID:rowID:edited:range:changeInLength:", v30, v8, 3, 0, 0, [v9 length]);
      }
    }
  }
LABEL_25:

  return v20;
}

void __48__ICTableColumnTextStorage_rowLocationForRowID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) mergeableStringDelegates];
  id v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  if (v3) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"!self.mergeableStringDelegates[rowID]" functionName:"-[ICTableColumnTextStorage rowLocationForRowID:]_block_invoke" simulateCrash:1 showAlert:0 format:@"Adding a mergeableStringDelegate for a row that already has one."];
  }
  id v4 = [ICTableCellMergeableStringDelegate alloc];
  uint64_t v5 = *(void **)(a1 + 32);
  uint64_t v6 = [v5 columnID];
  id v8 = [(ICTableCellMergeableStringDelegate *)v4 initWithTableCellChangeObserver:v5 columnID:v6 rowID:*(void *)(a1 + 40)];

  id v7 = [*(id *)(a1 + 32) mergeableStringDelegates];
  [v7 setObject:v8 forKeyedSubscript:*(void *)(a1 + 40)];

  [*(id *)(a1 + 48) setDelegate:v8];
}

void __48__ICTableColumnTextStorage_rowLocationForRowID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 styler];
  unint64_t v10 = [v9 styleForModelAttributes:v8];
  id v13 = (id)[v10 mutableCopy];

  uint64_t v11 = (void *)MEMORY[0x1E4F83238];
  int v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83238]];

  [v13 setObject:v12 forKeyedSubscript:*v11];
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v13, a3, a4);
}

- (unint64_t)rowLocationForRowIndex:(unint64_t)a3
{
  unint64_t v3 = a3;
  v14[2] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v5 = [(ICTableColumnTextStorage *)self rowStartIndexes];
    if ([v5 count] <= v3) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"index < rowStartIndexes.count" functionName:"-[ICTableColumnTextStorage rowLocationForRowIndex:]" simulateCrash:1 showAlert:0 format:@"row index out of bounds"];
    }
    unint64_t v6 = [v5 count];
    if (v6 <= v3)
    {

      return 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      MEMORY[0x1F4188790](v6);
      unint64_t v7 = [(ICTTTextStorage *)self length];
      unint64_t v8 = 0;
      v14[0] = 0;
      v14[1] = v7 + 1;
      do
      {
        unint64_t v9 = [v5 getIndexes:v13 maxCount:64 inIndexRange:v14];
        v8 += v9;
      }
      while (v9 >= 0x40 && v8 <= v3);
      unint64_t v11 = v3 & 0x3F;
      if (v11 >= v9) {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"index % bufferSize < numIndexes" functionName:"-[ICTableColumnTextStorage rowLocationForRowIndex:]" simulateCrash:1 showAlert:0 format:@"index out of bounds of filled buffer"];
      }
      unint64_t v3 = v13[v11];
    }
  }
  return v3;
}

- (unint64_t)nextLocationAfterRowLocation:(unint64_t)a3
{
  uint64_t v5 = [(ICTableColumnTextStorage *)self rowStartIndexes];
  unint64_t v6 = [v5 indexGreaterThanIndex:a3];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
    return [(ICTTTextStorage *)self length] + 1;
  }
  return v6;
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  char v8 = a3;
  v54.receiver = self;
  v54.super_class = (Class)ICTableColumnTextStorage;
  -[ICTTTextStorage edited:range:changeInLength:](&v54, sel_edited_range_changeInLength_);
  if ([(ICTableColumnTextStorage *)self preventEditingUpdates]) {
    return;
  }
  char v40 = v8;
  v53[0] = 0;
  v53[1] = 0;
  uint64_t v10 = [(ICTableColumnTextStorage *)self rowAtIndex:location rowRange:v53];
  NSUInteger v11 = v53[0];
  if (a5 < 1)
  {
    if ((a5 & 0x8000000000000000) == 0) {
      goto LABEL_6;
    }
    int v12 = [(ICTableColumnTextStorage *)self rowStartIndexes];
    NSUInteger v13 = v11 - a5;
  }
  else
  {
    int v12 = [(ICTableColumnTextStorage *)self rowStartIndexes];
    NSUInteger v13 = v11;
  }
  [v12 shiftIndexesStartingAtIndex:v13 + 1 by:a5];

LABEL_6:
  unint64_t v14 = [(ICTableColumnTextStorage *)self nextLocationAfterRowLocation:v11];
  v15 = [(ICTableColumnTextStorage *)self table];
  uint64_t v16 = [(ICTableColumnTextStorage *)self columnID];
  v41 = (void *)v10;
  v39 = [v15 mergeableStringForColumnID:v16 rowID:v10 createIfNeeded:1];

  v57.NSUInteger length = v14 + ~v11;
  v55.NSUInteger length = length + a5;
  v55.NSUInteger location = location;
  v57.NSUInteger location = v11;
  NSRange v17 = NSIntersectionRange(v55, v57);
  uint64_t v18 = -[ICTTTextStorage attributedSubstringFromRange:](self, "attributedSubstringFromRange:", v17.location, v17.length);
  id v19 = (void *)[v18 mutableCopy];

  unint64_t v20 = [(ICTTTextStorage *)self mergeableString];
  v21 = [v20 attributedString];
  uint64_t v22 = *MEMORY[0x1E4F83238];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke;
  v50[3] = &unk_1E5FD9038;
  NSRange v52 = v17;
  id v23 = v19;
  id v51 = v23;
  v24 = v39;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", v22, v17.location, v17.length, 0, v50);

  NSUInteger v25 = location - v11;
  if (v25 >= [v39 length])
  {
    NSUInteger v27 = [v39 length];
    NSUInteger v28 = 0;
  }
  else
  {
    v58.NSUInteger length = [v39 length];
    v56.NSUInteger location = v25;
    v56.NSUInteger length = length;
    v58.NSUInteger location = 0;
    NSRange v26 = NSIntersectionRange(v56, v58);
    NSUInteger v27 = v26.location;
    NSUInteger v28 = v26.length;
  }
  id v29 = objc_alloc(MEMORY[0x1E4F28E48]);
  v30 = [v23 string];
  v31 = (void *)[v29 initWithString:v30];

  uint64_t v32 = objc_msgSend(v23, "ic_range");
  uint64_t v34 = v33;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke_2;
  v48[3] = &unk_1E5FD9010;
  v48[4] = self;
  id v35 = v31;
  id v49 = v35;
  objc_msgSend(v23, "enumerateAttributesInRange:options:usingBlock:", v32, v34, 0, v48);
  [(ICTableColumnTextStorage *)self beginPreventEditingUpdates];
  if ((v40 & 2) != 0)
  {
    objc_msgSend(v39, "replaceCharactersInRange:withAttributedString:", v27, v28, v35);
    id v36 = v41;
  }
  else
  {
    id v36 = v41;
    if (v40)
    {
      uint64_t v37 = [v39 length];
      uint64_t v38 = [v35 length];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke_3;
      v42[3] = &unk_1E5FD9060;
      uint64_t v44 = 0;
      uint64_t v45 = v37;
      NSUInteger v46 = v27;
      NSUInteger v47 = v28;
      id v43 = v39;
      id v36 = v41;
      objc_msgSend(v35, "enumerateAttributesInRange:options:usingBlock:", 0, v38, 0, v42);
    }
  }
  [(ICTableColumnTextStorage *)self endPreventEditingUpdates];
}

void __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, NSUInteger a4)
{
  if (a2)
  {
    unint64_t v6 = *(void **)(a1 + 32);
    NSUInteger v7 = a3 - *(void *)(a1 + 40);
    id v10 = a2;
    v13.NSUInteger location = objc_msgSend(v6, "ic_range");
    v13.NSUInteger length = v8;
    v12.NSUInteger location = v7;
    v12.NSUInteger length = a4;
    NSRange v9 = NSIntersectionRange(v12, v13);
    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", *MEMORY[0x1E4F83238], v10, v9.location, v9.length);
  }
}

void __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  NSUInteger v7 = *(void **)(a1 + 32);
  id v8 = a2;
  NSRange v9 = [v7 styler];
  id v10 = [v9 modelForStyleAttributes:v8 filterAttributes:0];
  id v13 = (id)[v10 mutableCopy];

  NSUInteger v11 = (void *)MEMORY[0x1E4F83238];
  NSRange v12 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F83238]];

  [v13 setObject:v12 forKeyedSubscript:*v11];
  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v13, a3, a4);
}

void __56__ICTableColumnTextStorage_edited_range_changeInLength___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, NSUInteger a4)
{
  NSUInteger v6 = *(void *)(a1 + 48);
  NSUInteger v7 = *(void *)(a1 + 56) + a3;
  NSUInteger v8 = *(void *)(a1 + 40);
  id v10 = a2;
  v12.NSUInteger location = v8;
  v12.NSUInteger length = v6;
  v13.NSUInteger location = v7;
  v13.NSUInteger length = a4;
  NSRange v9 = NSIntersectionRange(v12, v13);
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v10, v9.location, v9.length);
}

- (void)textStorage:(id)a3 didProcessEditing:(unint64_t)a4 range:(_NSRange)a5 changeInLength:(int64_t)a6
{
  if (self == a3)
  {
    NSUInteger length = a5.length;
    NSUInteger location = a5.location;
    -[ICTableColumnTextStorage setShouldPreventUndoCommands:](self, "setShouldPreventUndoCommands:", 1, a4);
    objc_opt_class();
    NSUInteger v11 = [(ICTTTextStorage *)self styler];
    ICDynamicCast();
    id v19 = (id)objc_claimAutoreleasedReturnValue();

    NSRange v12 = [(ICTTTextStorage *)self string];
    objc_msgSend(v12, "ic_safeCharacterRangeForRange:", location, length);
    uint64_t v14 = v13;

    if (v14 && ![(ICTTTextStorage *)self isEditingTemporaryAttributes]) {
      objc_msgSend(v19, "styleText:inExactRange:fixModelAttributes:", self, location, length, 1);
    }
    [(ICTableColumnTextStorage *)self setShouldPreventUndoCommands:0];
    v15 = [(ICTableColumnTextStorage *)self rowAtIndex:location rowRange:0];
    uint64_t v16 = [(ICTableColumnTextStorage *)self table];
    NSRange v17 = [v16 cellChangeNotifier];
    uint64_t v18 = [(ICTableColumnTextStorage *)self columnID];
    [v17 notifyOfChangeAtColumnID:v18 rowID:v15 delta:a6];
  }
}

- (BOOL)preventEditingUpdates
{
  return [(ICTableColumnTextStorage *)self preventEditingUpdatesCount] != 0;
}

- (void)beginPreventEditingUpdates
{
  unint64_t v3 = [(ICTableColumnTextStorage *)self preventEditingUpdatesCount] + 1;
  [(ICTableColumnTextStorage *)self setPreventEditingUpdatesCount:v3];
}

- (void)endPreventEditingUpdates
{
  if ([(ICTableColumnTextStorage *)self preventEditingUpdatesCount])
  {
    unint64_t v3 = [(ICTableColumnTextStorage *)self preventEditingUpdatesCount] - 1;
    [(ICTableColumnTextStorage *)self setPreventEditingUpdatesCount:v3];
  }
}

- (void)closeUndoGroups
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(ICTableColumnTextStorage *)self undoHelper];
  unint64_t v3 = [v2 coalescingUndoGroupForStringDelegate];

  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = objc_msgSend(v3, "objectEnumerator", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) closeGroup];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }

  [v3 removeAllObjects];
}

- (void)breakUndoCoalescing
{
  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextStorage;
  [(ICTTTextStorage *)&v3 breakUndoCoalescing];
  [(ICTableColumnTextStorage *)self closeUndoGroups];
}

- (void)resetUndoManager
{
  v3.receiver = self;
  v3.super_class = (Class)ICTableColumnTextStorage;
  [(ICTTTextStorage *)&v3 resetUndoManager];
  [(ICTableColumnTextStorage *)self closeUndoGroups];
}

- (id)editAtIndex:(unint64_t)a3
{
  NSRange v17 = (NSRange)xmmword_1B0B987A0;
  uint64_t v5 = [(ICTableColumnTextStorage *)self rowAtIndex:a3 rowRange:&v17];
  NSRange v6 = v17;
  if (v17.location == 0x7FFFFFFFFFFFFFFFLL
    || (a3 >= v17.location ? (BOOL v7 = a3 - v17.location >= v17.length) : (BOOL v7 = 1), v7))
  {
    uint64_t v13 = NSString;
    uint64_t v14 = NSStringFromRange(v6);
    uint64_t v15 = [v13 stringWithFormat:@"editAtIndex expected to find valid row range %@ %lu %@", v14, a3, self];

    id v16 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v15 userInfo:0];
    objc_exception_throw(v16);
  }
  uint64_t v8 = [(ICTableColumnTextStorage *)self table];
  long long v9 = [(ICTableColumnTextStorage *)self columnID];
  long long v10 = [v8 mergeableStringForColumnID:v9 rowID:v5];

  long long v11 = [v10 editAtIndex:a3 - v17.location];

  return v11;
}

- (void)enumerateEditsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v19 = a4;
  uint64_t v32 = 0;
  uint64_t v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [(ICTableColumnTextStorage *)self rows];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v28 objects:v36 count:16];
  id obj = v5;
  if (v6)
  {
    uint64_t v20 = *(void *)v29;
    uint64_t v18 = v23;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v29 != v20) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * v7);
      NSUInteger v9 = -[ICTableColumnTextStorage characterRangeForRowID:](self, "characterRangeForRowID:", v8, obj, v18);
      NSUInteger v11 = v10;
      v38.NSUInteger location = v9;
      v38.NSUInteger length = v10;
      NSRange v12 = NSIntersectionRange(a3, v38);
      if (v12.length)
      {
        uint64_t v13 = [(ICTableColumnTextStorage *)self table];
        uint64_t v14 = [(ICTableColumnTextStorage *)self columnID];
        uint64_t v15 = [v13 mergeableStringForColumnID:v14 rowID:v8];

        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v23[0] = __61__ICTableColumnTextStorage_enumerateEditsInRange_usingBlock___block_invoke;
        v23[1] = &unk_1E5FD9088;
        NSUInteger v26 = v9;
        NSUInteger v27 = v11;
        id v24 = v19;
        NSUInteger v25 = &v32;
        objc_msgSend(v15, "enumerateEditsInRange:usingBlock:", v12.location - v9, v12.length, v22);
        BOOL v16 = *((unsigned char *)v33 + 24) == 0;

        if (!v16) {
          break;
        }
      }
      if (v6 == ++v7)
      {
        uint64_t v6 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  _Block_object_dispose(&v32, 8);
}

void __61__ICTableColumnTextStorage_enumerateEditsInRange_usingBlock___block_invoke(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 range] + a1[6];
  [v5 range];
  uint64_t v8 = v7;
  id v9 = objc_alloc(MEMORY[0x1E4F834F0]);
  NSUInteger v10 = [v5 timestamp];
  NSUInteger v11 = [v5 replicaID];

  id v13 = (id)objc_msgSend(v9, "initWithTimestamp:replicaID:range:", v10, v11, v6, v8);
  uint64_t v12 = a1[4];
  if (v12) {
    (*(void (**)(uint64_t, id, unsigned char *))(v12 + 16))(v12, v13, a3);
  }
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = *a3;
}

- (BOOL)wantsUndoCommands
{
  return 0;
}

- (id)savedSelectionWithSelectionAffinity:(unint64_t)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[NSThread isMainThread]" functionName:"-[ICTableColumnTextStorage savedSelectionWithSelectionAffinity:]" simulateCrash:1 showAlert:0 format:@"Unexpected call from background thread"];
  }
  id v4 = [(ICTTTextStorage *)self textViews];
  id v5 = [v4 allObjects];

  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v5;
  uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
  if (v36)
  {
    uint64_t v32 = *(void *)v45;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v45 != v32) {
          objc_enumerationMutation(obj);
        }
        uint64_t v37 = v6;
        uint64_t v7 = *(void **)(*((void *)&v44 + 1) + 8 * v6);
        uint64_t v8 = [MEMORY[0x1E4F29128] TTZero];
        id v9 = [MEMORY[0x1E4F1CA48] array];
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        NSUInteger v10 = objc_msgSend(v7, "ic_selectedRanges");
        uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v41;
          do
          {
            uint64_t v14 = 0;
            uint64_t v15 = v8;
            do
            {
              if (*(void *)v41 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v16 = [*(id *)(*((void *)&v40 + 1) + 8 * v14) rangeValue];
              unint64_t v18 = v17;
              uint64_t v38 = 0;
              unint64_t v39 = 0;
              uint64_t v8 = [(ICTableColumnTextStorage *)self rowAtIndex:v16 rowRange:&v38];

              unint64_t v19 = v39;
              if (v18 > v39)
              {
                [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"selectedRange.length <= cellRange.length" functionName:"-[ICTableColumnTextStorage savedSelectionWithSelectionAffinity:]" simulateCrash:1 showAlert:0 format:@"Selected range is greater than range of the cell"];
                unint64_t v19 = v39;
              }
              if (v18 >= v19) {
                uint64_t v20 = v19;
              }
              else {
                uint64_t v20 = v18;
              }
              v21 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v16 - v38, v20);
              [v9 addObject:v21];

              ++v14;
              uint64_t v15 = v8;
            }
            while (v12 != v14);
            uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v49 count:16];
          }
          while (v12);
        }

        uint64_t v22 = [(ICTableColumnTextStorage *)self mergeableStringForRowID:v8];
        id v23 = (void *)[v9 copy];
        id v24 = [v22 selectionForCharacterRanges:v23 selectionAffinity:a3];
        NSUInteger v25 = v24;
        if (v24) {
          id v26 = v24;
        }
        else {
          id v26 = objc_alloc_init(MEMORY[0x1E4F834C8]);
        }
        NSUInteger v27 = v26;

        [v35 addObject:v27];
        [v34 addObject:v8];
        long long v28 = [v22 objectsNeedingUpdatedRanges];
        [v28 addObject:v27];

        uint64_t v6 = v37 + 1;
      }
      while (v37 + 1 != v36);
      uint64_t v36 = [obj countByEnumeratingWithState:&v44 objects:v50 count:16];
    }
    while (v36);
  }

  v48[0] = obj;
  v48[1] = v35;
  v48[2] = v34;
  long long v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v48 count:3];

  return v29;
}

- (void)restoreSelection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectAtIndexedSubscript:0];
  uint64_t v6 = [v4 objectAtIndexedSubscript:1];
  uint64_t v7 = [v4 objectAtIndexedSubscript:2];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __45__ICTableColumnTextStorage_restoreSelection___block_invoke;
  v10[3] = &unk_1E5FD90B0;
  id v11 = v7;
  uint64_t v12 = self;
  id v13 = v6;
  id v8 = v6;
  id v9 = v7;
  [v5 enumerateObjectsUsingBlock:v10];
}

void __45__ICTableColumnTextStorage_restoreSelection___block_invoke(id *a1, void *a2, uint64_t a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [a1[4] objectAtIndexedSubscript:a3];
  uint64_t v7 = [a1[5] mergeableStringForRowID:v6];
  if (v7)
  {
    uint64_t v20 = [a1[6] objectAtIndexedSubscript:a3];
    id v8 = objc_msgSend(v7, "characterRangesForSelection:");
    id v9 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v8, "count"));
    uint64_t v10 = [a1[5] rowLocationForRowID:v6];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = [*(id *)(*((void *)&v21 + 1) + 8 * i) rangeValue];
          unint64_t v18 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v16 + v10, v17);
          [v9 addObject:v18];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }

    if ([v9 count]) {
      objc_msgSend(v5, "setIc_selectedRanges:", v9);
    }
    unint64_t v19 = [v7 objectsNeedingUpdatedRanges];
    [v19 removeObject:v20];
  }
}

- (void)tableCellWasEditedAtColumnID:(id)a3 rowID:(id)a4 edited:(unint64_t)a5 range:(_NSRange)a6 changeInLength:(int64_t)a7
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  char v10 = a5;
  id v12 = a4;
  if (![(ICTableColumnTextStorage *)self preventEditingUpdates])
  {
    unint64_t v13 = [(ICTableColumnTextStorage *)self rowLocationForRowID:v12];
    unint64_t v24 = v13 + location;
    uint64_t v14 = [(ICTableColumnTextStorage *)self mergeableStringForRowID:v12];
    uint64_t v15 = [v14 attributedString];
    uint64_t v16 = objc_msgSend(v15, "attributedSubstringFromRange:", location, length + a7);
    uint64_t v17 = (void *)[v16 mutableCopy];

    uint64_t v18 = [v17 length];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __91__ICTableColumnTextStorage_tableCellWasEditedAtColumnID_rowID_edited_range_changeInLength___block_invoke;
    v26[3] = &unk_1E5FD9010;
    v26[4] = self;
    id v19 = v17;
    id v27 = v19;
    objc_msgSend(v19, "enumerateAttributesInRange:options:usingBlock:", 0, v18, 0, v26);
    uint64_t v20 = [(ICTableColumnTextStorage *)self rowStartIndexes];
    [v20 shiftIndexesStartingAtIndex:v13 - (a7 & (a7 >> 63)) + 1 by:a7];

    [(ICTableColumnTextStorage *)self beginPreventEditingUpdates];
    if ((v10 & 2) != 0)
    {
      unint64_t v21 = v24;
      -[ICTableTextStorage replaceCharactersInRange:withAttributedString:](self, "replaceCharactersInRange:withAttributedString:", v24, length, v19);
    }
    else
    {
      unint64_t v21 = v24;
      if (v10)
      {
        uint64_t v22 = [v19 length];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __91__ICTableColumnTextStorage_tableCellWasEditedAtColumnID_rowID_edited_range_changeInLength___block_invoke_2;
        v25[3] = &unk_1E5FD90D8;
        v25[5] = v24;
        v25[6] = length;
        v25[4] = self;
        objc_msgSend(v19, "enumerateAttributesInRange:options:usingBlock:", 0, v22, 0, v25);
      }
    }
    long long v23 = [(ICTTTextStorage *)self styler];
    objc_msgSend(v23, "styleText:inRange:fixModelAttributes:", self, v21, objc_msgSend(v19, "length"), 0);

    [(ICTableColumnTextStorage *)self endPreventEditingUpdates];
  }
}

void __91__ICTableColumnTextStorage_tableCellWasEditedAtColumnID_rowID_edited_range_changeInLength___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 styler];
  id v10 = [v9 styleForModelAttributes:v8];

  objc_msgSend(*(id *)(a1 + 40), "setAttributes:range:", v10, a3, a4);
}

void __91__ICTableColumnTextStorage_tableCellWasEditedAtColumnID_rowID_edited_range_changeInLength___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, NSUInteger a4)
{
  uint64_t v6 = *(void **)(a1 + 32);
  NSUInteger v7 = *(void *)(a1 + 40) + a3;
  id v10 = a2;
  v13.NSUInteger location = objc_msgSend(v6, "ic_range");
  v13.NSUInteger length = v8;
  v12.NSUInteger location = v7;
  v12.NSUInteger length = a4;
  NSRange v9 = NSIntersectionRange(v12, v13);
  objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", v10, v9.location, v9.length);
}

- (BOOL)wantsTimestampUpdates
{
  if ([(ICTableColumnTextStorage *)self shouldPreventUndoCommands]
    || [(ICTableColumnTextStorage *)self preventEditingUpdates]
    || [(ICTTTextStorage *)self isEditingTemporaryAttributes]
    || [(ICTTTextStorage *)self disableUndoCoalesceBreaking])
  {
    return 0;
  }
  else
  {
    return ![(ICTTTextStorage *)self isFixing];
  }
}

- (NSUUID)columnID
{
  return (NSUUID *)objc_getProperty(self, a2, 360, 1);
}

- (ICTableUndoHelping)undoHelper
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_undoHelper);
  return (ICTableUndoHelping *)WeakRetained;
}

- (void)setUndoHelper:(id)a3
{
}

- (BOOL)shouldPreventUndoCommands
{
  return self->_shouldPreventUndoCommands;
}

- (void)setShouldPreventUndoCommands:(BOOL)a3
{
  self->_shouldPreventUndoCommands = a3;
}

- (ICTable)table
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_table);
  return (ICTable *)WeakRetained;
}

- (NSMutableArray)rows
{
  return self->_rows;
}

- (NSMutableDictionary)mergeableStringDelegates
{
  return self->_mergeableStringDelegates;
}

- (NSMutableIndexSet)rowStartIndexes
{
  return self->_rowStartIndexes;
}

- (unint64_t)preventEditingUpdatesCount
{
  return self->_preventEditingUpdatesCount;
}

- (void)setPreventEditingUpdatesCount:(unint64_t)a3
{
  self->_preventEditingUpdatesCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowStartIndexes, 0);
  objc_storeStrong((id *)&self->_mergeableStringDelegates, 0);
  objc_storeStrong((id *)&self->_rows, 0);
  objc_destroyWeak((id *)&self->_table);
  objc_destroyWeak((id *)&self->_undoHelper);
  objc_storeStrong((id *)&self->_columnID, 0);
}

@end