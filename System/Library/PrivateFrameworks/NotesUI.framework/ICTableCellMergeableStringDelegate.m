@interface ICTableCellMergeableStringDelegate
- (BOOL)wantsUndoCommands;
- (ICTableCellMergeableStringDelegate)init;
- (ICTableCellMergeableStringDelegate)initWithTableCellChangeObserver:(id)a3 columnID:(id)a4 rowID:(id)a5;
- (ICTableCellMergeableStringObserving)changeObserver;
- (NSMutableArray)undoCommands;
- (NSUUID)columnID;
- (NSUUID)rowID;
- (unint64_t)editingCount;
- (void)addUndoCommand:(id)a3;
- (void)beginEditing;
- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5;
- (void)endEditing;
- (void)setEditingCount:(unint64_t)a3;
- (void)setUndoCommands:(id)a3;
@end

@implementation ICTableCellMergeableStringDelegate

- (ICTableCellMergeableStringDelegate)init
{
  return 0;
}

- (ICTableCellMergeableStringDelegate)initWithTableCellChangeObserver:(id)a3 columnID:(id)a4 rowID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ICTableCellMergeableStringDelegate;
  v11 = [(ICTableCellMergeableStringDelegate *)&v16 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_changeObserver, v8);
    objc_storeStrong((id *)&v12->_columnID, a4);
    objc_storeStrong((id *)&v12->_rowID, a5);
    uint64_t v13 = [MEMORY[0x1E4F1CA48] array];
    undoCommands = v12->_undoCommands;
    v12->_undoCommands = (NSMutableArray *)v13;
  }
  return v12;
}

- (void)beginEditing
{
  unint64_t v3 = [(ICTableCellMergeableStringDelegate *)self editingCount] + 1;
  [(ICTableCellMergeableStringDelegate *)self setEditingCount:v3];
}

- (void)endEditing
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  if ([(ICTableCellMergeableStringDelegate *)self editingCount]) {
    [(ICTableCellMergeableStringDelegate *)self setEditingCount:[(ICTableCellMergeableStringDelegate *)self editingCount] - 1];
  }
  if (![(ICTableCellMergeableStringDelegate *)self editingCount])
  {
    unint64_t v3 = [(ICTableCellMergeableStringDelegate *)self undoCommands];
    uint64_t v4 = [v3 count];

    if (v4)
    {
      v5 = [(ICTableCellMergeableStringDelegate *)self changeObserver];
      v6 = [v5 undoHelper];

      v7 = [v6 coalescingUndoGroupForStringDelegate];
      id v8 = [v7 objectForKey:self];

      if (!v8)
      {
        id v9 = [v6 tableSelection];
        if ([v9 type] == 1)
        {
          id v10 = objc_alloc_init(ICTableAttachmentSelection);

          v11 = [(ICTableCellMergeableStringDelegate *)self columnID];
          v12 = [(ICTableCellMergeableStringDelegate *)self rowID];
          [(ICTableAttachmentSelection *)v10 selectCellAtColumn:v11 row:v12];

          id v9 = v10;
        }
        uint64_t v13 = [ICTableCellEditingUndoGroup alloc];
        v14 = [(ICTableCellMergeableStringDelegate *)self columnID];
        v15 = [(ICTableCellMergeableStringDelegate *)self rowID];
        objc_super v16 = [v6 undoTarget];
        id v8 = [(ICTableCellEditingUndoGroup *)v13 initWithColumn:v14 row:v15 selection:v9 undoTarget:v16];

        v17 = [v6 coalescingUndoGroupForStringDelegate];
        [v17 setObject:v8 forKey:self];

        v18 = [v6 undoManager];
        v19 = [v6 undoTarget];
        [v18 registerUndoWithTarget:v19 selector:sel_applyUndoGroup_ object:v8];

        v20 = [v6 undoManager];
        v21 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Typing" value:@"Typing" table:0 allowSiri:1];
        [v20 setActionName:v21];
      }
      long long v30 = 0u;
      long long v31 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      v22 = [(ICTableCellMergeableStringDelegate *)self undoCommands];
      uint64_t v23 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
      if (v23)
      {
        uint64_t v24 = v23;
        uint64_t v25 = *(void *)v29;
        do
        {
          uint64_t v26 = 0;
          do
          {
            if (*(void *)v29 != v25) {
              objc_enumerationMutation(v22);
            }
            [(ICTTMergeableStringUndoGroup *)v8 addCommand:*(void *)(*((void *)&v28 + 1) + 8 * v26++)];
          }
          while (v24 != v26);
          uint64_t v24 = [v22 countByEnumeratingWithState:&v28 objects:v32 count:16];
        }
        while (v24);
      }

      v27 = [(ICTableCellMergeableStringDelegate *)self undoCommands];
      [v27 removeAllObjects];
    }
  }
}

- (void)edited:(unint64_t)a3 range:(_NSRange)a4 changeInLength:(int64_t)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v12 = [(ICTableCellMergeableStringDelegate *)self changeObserver];
  id v10 = [(ICTableCellMergeableStringDelegate *)self columnID];
  v11 = [(ICTableCellMergeableStringDelegate *)self rowID];
  objc_msgSend(v12, "tableCellWasEditedAtColumnID:rowID:edited:range:changeInLength:", v10, v11, a3, location, length, a5);
}

- (void)addUndoCommand:(id)a3
{
  id v4 = a3;
  [(ICTableCellMergeableStringDelegate *)self beginEditing];
  v5 = [(ICTableCellMergeableStringDelegate *)self undoCommands];
  [v5 addObject:v4];

  [(ICTableCellMergeableStringDelegate *)self endEditing];
}

- (BOOL)wantsUndoCommands
{
  unint64_t v3 = [(ICTableCellMergeableStringDelegate *)self changeObserver];
  id v4 = [v3 undoHelper];

  if ([v4 shouldPreventUndoCommands])
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    v6 = [(ICTableCellMergeableStringDelegate *)self changeObserver];
    int v5 = [v6 shouldPreventUndoCommands] ^ 1;
  }
  return v5;
}

- (ICTableCellMergeableStringObserving)changeObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_changeObserver);
  return (ICTableCellMergeableStringObserving *)WeakRetained;
}

- (NSUUID)columnID
{
  return self->_columnID;
}

- (NSUUID)rowID
{
  return self->_rowID;
}

- (unint64_t)editingCount
{
  return self->_editingCount;
}

- (void)setEditingCount:(unint64_t)a3
{
  self->_editingCount = a3;
}

- (NSMutableArray)undoCommands
{
  return self->_undoCommands;
}

- (void)setUndoCommands:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_undoCommands, 0);
  objc_storeStrong((id *)&self->_rowID, 0);
  objc_storeStrong((id *)&self->_columnID, 0);
  objc_destroyWeak((id *)&self->_changeObserver);
}

@end