@interface ICTable(UI)
- (ICTableCellTextStorage)textStorageForCellAtColumnIndex:()UI rowIndex:undoTarget:undoManager:;
- (ICTableColumnTextStorage)textStorageForColumn:()UI;
- (id)documentForCellAtColumnIndex:()UI rowIndex:;
- (id)joinedAttributedStringForColumns:()UI rows:deepCopyInlineAttachments:note:parentAttachment:;
- (id)mergeableStringForColumnID:()UI rowID:createIfNeeded:;
- (id)textStorageForCellAtColumnID:()UI rowID:undoTarget:undoManager:;
- (uint64_t)joinedAttributedStringForColumns:()UI rows:;
- (uint64_t)textStorageForCellAtColumnID:()UI rowID:;
- (uint64_t)textStorageForCellAtColumnIndex:()UI rowIndex:;
- (void)enumerateTextStoragesForColumnIndexes:()UI rowIndexes:undoTarget:undoManager:usingBlock:;
@end

@implementation ICTable(UI)

- (uint64_t)textStorageForCellAtColumnID:()UI rowID:
{
  return [a1 textStorageForCellAtColumnID:a3 rowID:a4 undoTarget:0 undoManager:0];
}

- (id)textStorageForCellAtColumnID:()UI rowID:undoTarget:undoManager:
{
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  uint64_t v13 = [a1 columnIndexForIdentifier:a3];
  uint64_t v14 = [a1 rowIndexForIdentifier:v12];

  if (v13 == 0x7FFFFFFFFFFFFFFFLL || v14 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[ICTable(UI) textStorageForCellAtColumnID:rowID:undoTarget:undoManager:](v16);
    }

    v15 = 0;
  }
  else
  {
    v15 = [a1 textStorageForCellAtColumnIndex:v13 rowIndex:v14 undoTarget:v10 undoManager:v11];
  }

  return v15;
}

- (uint64_t)textStorageForCellAtColumnIndex:()UI rowIndex:
{
  return [a1 textStorageForCellAtColumnIndex:a3 rowIndex:a4 undoTarget:0 undoManager:0];
}

- (ICTableCellTextStorage)textStorageForCellAtColumnIndex:()UI rowIndex:undoTarget:undoManager:
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [a1 documentForCellAtColumnIndex:a3 rowIndex:a4];
  uint64_t v13 = [[ICTableCellTextStorage alloc] initWithDocument:v12];
  uint64_t v14 = v13;
  if (v11) {
    [(ICTTTextStorage *)v13 setUndoManager:v11];
  }
  [(ICTTTextStorage *)v14 setOverrideUndoTarget:v10];

  return v14;
}

- (id)mergeableStringForColumnID:()UI rowID:createIfNeeded:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a1 mergeableStringForColumnID:v8 rowID:v9];
  if (!v10)
  {
    if (a5)
    {
      uint64_t v11 = [a1 columnIndexForIdentifier:v8];
      uint64_t v12 = [a1 rowIndexForIdentifier:v9];
      id v10 = 0;
      if (v11 != 0x7FFFFFFFFFFFFFFFLL && v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        id v13 = (id)[a1 documentForCellAtColumnIndex:v11 rowIndex:v12];
        id v10 = [a1 mergeableStringForColumnID:v8 rowID:v9];
      }
    }
  }

  return v10;
}

- (id)documentForCellAtColumnIndex:()UI rowIndex:
{
  id v6 = a1;
  v7 = [v6 objectForColumnIndex:a3 rowIndex:a4];
  id v8 = objc_alloc(MEMORY[0x1E4F834D8]);
  id v9 = v8;
  if (v7)
  {
    id v10 = (void *)[v8 initWithMergeableString:v7];
  }
  else
  {
    uint64_t v11 = [v6 document];
    uint64_t v12 = [v11 replica];
    if (v12)
    {
      id v10 = (void *)[v9 initWithData:0 replicaID:v12];
    }
    else
    {
      id v13 = [MEMORY[0x1E4F29128] UUID];
      id v10 = (void *)[v9 initWithData:0 replicaID:v13];
    }
    uint64_t v14 = [v10 mergeableString];
    [v6 setObject:v14 columnIndex:a3 rowIndex:a4];

    v15 = [v6 delegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      v17 = [v6 delegate];
      [v17 tableDidPopulateCellAtColumnIndex:a3 rowIndex:a4];
    }
  }
  v18 = [v6 ttDocument];
  v19 = [v18 sharedTopotextTimestamp];
  v20 = [v10 mergeableString];
  [v20 setTimestamp:v19];

  return v10;
}

- (void)enumerateTextStoragesForColumnIndexes:()UI rowIndexes:undoTarget:undoManager:usingBlock:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (v12) {
    id v17 = v12;
  }
  else {
    id v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(a1, "columnCount"));
  }
  v18 = v17;
  if (v13) {
    id v19 = v13;
  }
  else {
    id v19 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F28D60]), "initWithIndexesInRange:", 0, objc_msgSend(a1, "rowCount"));
  }
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  char v32 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __98__ICTable_UI__enumerateTextStoragesForColumnIndexes_rowIndexes_undoTarget_undoManager_usingBlock___block_invoke;
  v24[3] = &unk_1E5FD9128;
  id v20 = v19;
  v30 = v31;
  id v25 = v20;
  v26 = a1;
  id v21 = v14;
  id v27 = v21;
  id v22 = v15;
  id v28 = v22;
  id v23 = v16;
  id v29 = v23;
  [v18 enumerateIndexesUsingBlock:v24];

  _Block_object_dispose(v31, 8);
}

- (ICTableColumnTextStorage)textStorageForColumn:()UI
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 columnTextStorages];
    id v6 = [v5 objectForKeyedSubscript:v4];

    if (!v6)
    {
      v7 = [ICTableColumnTextStorage alloc];
      id v8 = [a1 document];
      id v9 = [v8 replica];
      if (v9)
      {
        id v6 = [(ICTableColumnTextStorage *)v7 initWithTable:a1 columnID:v4 replicaID:v9];
      }
      else
      {
        id v10 = [MEMORY[0x1E4F29128] UUID];
        id v6 = [(ICTableColumnTextStorage *)v7 initWithTable:a1 columnID:v4 replicaID:v10];
      }
      uint64_t v11 = [a1 columnTextStorages];
      [v11 setObject:v6 forKey:v4];

      id v12 = [a1 delegate];
      char v13 = objc_opt_respondsToSelector();

      if (v13)
      {
        id v14 = [a1 delegate];
        [v14 tableDidCreateColumnTextStorage:v6];
      }
    }
  }
  else
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"columnID" functionName:"-[ICTable(UI) textStorageForColumn:]" simulateCrash:1 showAlert:0 format:@"ColumnID must not be nil."];
    id v6 = 0;
  }

  return v6;
}

- (uint64_t)joinedAttributedStringForColumns:()UI rows:
{
  return [a1 joinedAttributedStringForColumns:a3 rows:a4 deepCopyInlineAttachments:0 note:0 parentAttachment:0];
}

- (id)joinedAttributedStringForColumns:()UI rows:deepCopyInlineAttachments:note:parentAttachment:
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  id v16 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0x7FFFFFFFFFFFFFFFLL;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke;
  v22[3] = &unk_1E5FD9178;
  v26 = v28;
  id v17 = v16;
  id v23 = v17;
  char v27 = a5;
  id v18 = v14;
  id v24 = v18;
  id v19 = v15;
  id v25 = v19;
  [a1 enumerateCellObjectsInCellSelectionContainingColumnIndices:v12 rowIndices:v13 copyItems:0 usingBlock:v22];
  id v20 = (void *)[v17 copy];

  _Block_object_dispose(v28, 8);
  return v20;
}

- (void)textStorageForCellAtColumnID:()UI rowID:undoTarget:undoManager:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "textStorageForCellAtColumnID:rowID: invalid cell", v1, 2u);
}

@end