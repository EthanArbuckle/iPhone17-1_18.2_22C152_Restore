@interface ICAttachmentTableModel
+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3;
+ (id)tableFromAttributedString:(id)a3 managedObjectContext:(id)a4 replicaID:(id)a5;
- (BOOL)isReadyToPresent;
- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4;
- (BOOL)providesTextContentInNote;
- (BOOL)usesChildAttachment:(id)a3;
- (ICTable)table;
- (ICTableVersionedDocument)tableDocument;
- (id)dataForTypeIdentifier:(id)a3;
- (id)fileURLForTypeIdentifier:(id)a3;
- (id)localizedFallbackSubtitleIOS;
- (id)localizedFallbackSubtitleMac;
- (id)localizedFallbackTitle;
- (id)mergeableDataForCopying:(id *)a3;
- (id)searchableTextContent;
- (id)searchableTextContentInNote;
- (id)stringsAtRow:(unint64_t)a3;
- (id)textContentInNote;
- (void)addMergeableDataToCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5;
- (void)attachmentAwakeFromFetch;
- (void)attachmentDidRefresh:(BOOL)a3;
- (void)attachmentWillRefresh:(BOOL)a3;
- (void)attachmentWillTurnIntoFault;
- (void)mergeTablePrimitiveData;
- (void)persistPendingChanges;
- (void)regenerateTextContentInNote;
- (void)removeTimestampsForReplicaID:(id)a3;
- (void)replaceChildInlineAttachment:(id)a3 withText:(id)a4;
- (void)setTableDocument:(id)a3;
- (void)updateAfterLoadWithInlineAttachmentIdentifierMap:(id)a3;
- (void)updateAttachmentByMergingWithTableData:(id)a3;
- (void)willMarkAttachmentForDeletion;
- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:(id)a3;
- (void)writeMergeableData;
@end

@implementation ICAttachmentTableModel

- (void)attachmentAwakeFromFetch
{
  v8.receiver = self;
  v8.super_class = (Class)ICAttachmentTableModel;
  [(ICAttachmentModel *)&v8 attachmentAwakeFromFetch];
  if (self->_tableDocument)
  {
    v3 = [(ICAttachmentModel *)self attachment];
    char v4 = objc_opt_respondsToSelector();

    if (v4)
    {
      v5 = [(ICAttachmentModel *)self attachment];
      v6 = [v5 documentMergeController];
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __50__ICAttachmentTableModel_attachmentAwakeFromFetch__block_invoke;
      v7[3] = &unk_1E64A4240;
      v7[4] = self;
      [v6 requestMergeWithBlock:v7];
    }
    else
    {
      [(ICAttachmentTableModel *)self mergeTablePrimitiveData];
    }
  }
}

uint64_t __50__ICAttachmentTableModel_attachmentAwakeFromFetch__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) mergeTablePrimitiveData];
}

- (void)attachmentWillTurnIntoFault
{
  if (![(ICAttachmentModel *)self isMergeableDataDirty])
  {
    tableDocument = self->_tableDocument;
    self->_tableDocument = 0;
  }
}

- (void)attachmentWillRefresh:(BOOL)a3
{
  if (![(ICAttachmentModel *)self isMergeableDataDirty])
  {
    tableDocument = self->_tableDocument;
    self->_tableDocument = 0;
  }
}

- (void)attachmentDidRefresh:(BOOL)a3
{
  char v4 = [(ICAttachmentModel *)self attachment];
  +[ICTableAttachmentProvider notifyProviderForRefreshToAttachment:v4];

  if (self->_tableDocument && [(ICAttachmentModel *)self isMergeableDataDirty])
  {
    v5 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentTableModel attachmentDidRefresh:](self, v5);
    }

    v6 = [(ICAttachmentModel *)self attachment];
    v7 = [v6 identifier];

    objc_super v8 = os_log_create("com.apple.notes", "CoreData");
    BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
    if (v7)
    {
      if (v9) {
        -[ICAttachmentTableModel attachmentDidRefresh:]();
      }
    }
    else if (v9)
    {
      -[ICAttachmentTableModel attachmentDidRefresh:]();
    }
  }
}

- (id)stringsAtRow:(unint64_t)a3
{
  v5 = [MEMORY[0x1E4F1CA48] array];
  v6 = [(ICAttachmentTableModel *)self table];
  unint64_t v7 = [v6 rowCount];

  if (v7 > a3)
  {
    objc_super v8 = [(ICAttachmentTableModel *)self table];
    BOOL v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:a3];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __39__ICAttachmentTableModel_stringsAtRow___block_invoke;
    v12[3] = &unk_1E64A6EA8;
    id v13 = v5;
    [v8 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:v9 copyItems:0 usingBlock:v12];
  }
  v10 = (void *)[v5 copy];

  return v10;
}

uint64_t __39__ICAttachmentTableModel_stringsAtRow___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 attributedString];
  char v4 = [v3 string];

  objc_msgSend(*(id *)(a1 + 32), "ic_addNonNilObject:", v4);
  return 0;
}

- (id)searchableTextContent
{
  v2 = [(ICAttachmentTableModel *)self searchableTextContentInNote];
  v3 = [v2 string];

  return v3;
}

- (id)searchableTextContentInNote
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  char v4 = [(ICAttachmentModel *)self attachment];
  v5 = [v4 identifier];

  v6 = [(ICAttachmentModel *)self attachment];
  unint64_t v7 = [v6 managedObjectContext];

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  objc_super v8 = [(ICAttachmentTableModel *)self table];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __53__ICAttachmentTableModel_searchableTextContentInNote__block_invoke;
  v15[3] = &unk_1E64A6ED0;
  id v9 = v7;
  id v16 = v9;
  id v10 = v5;
  id v17 = v10;
  id v11 = v3;
  id v18 = v11;
  v19 = v20;
  [v8 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:v15];

  v12 = v18;
  id v13 = v11;

  _Block_object_dispose(v20, 8);
  return v13;
}

uint64_t __53__ICAttachmentTableModel_searchableTextContentInNote__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  v18[3] = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [a2 attributedString];
  objc_super v8 = objc_msgSend(v7, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", *(void *)(a1 + 32));

  uint64_t v9 = [v8 string];
  if (v9)
  {
    id v10 = (void *)v9;
    id v11 = [NSString stringWithFormat:@"%@\n", v9];

    v18[0] = *(void *)(a1 + 40);
    v17[0] = @"SearchTableIdentifier";
    v17[1] = @"SearchTableColumn";
    v12 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    v18[1] = v12;
    v17[2] = @"SearchTableRow";
    id v13 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a4];
    v18[2] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:3];

    v15 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v11 attributes:v14];
    [*(id *)(a1 + 48) appendAttributedString:v15];
    *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) += [v11 length];
  }
  return 0;
}

- (BOOL)providesTextContentInNote
{
  return 1;
}

- (id)textContentInNote
{
  v2 = [(ICAttachmentModel *)self attachment];
  id v3 = [v2 summary];

  return v3;
}

- (void)regenerateTextContentInNote
{
  id v3 = [(ICAttachmentModel *)self attachment];
  char v4 = [v3 managedObjectContext];

  id v5 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v6 = [(ICAttachmentTableModel *)self table];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __53__ICAttachmentTableModel_regenerateTextContentInNote__block_invoke;
  v14 = &unk_1E64A6EF8;
  id v15 = v4;
  id v16 = v5;
  id v7 = v5;
  id v8 = v4;
  [v6 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:&v11];

  uint64_t v9 = objc_msgSend(NSString, "stringWithString:", v7, v11, v12, v13, v14);
  id v10 = [(ICAttachmentModel *)self attachment];
  [v10 setSummary:v9];
}

uint64_t __53__ICAttachmentTableModel_regenerateTextContentInNote__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 attributedString];
  char v4 = objc_msgSend(v3, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:", *(void *)(a1 + 32));
  id v5 = [v4 string];

  if (v5)
  {
    v6 = [NSString stringWithFormat:@"%@\n", v5];

    [*(id *)(a1 + 40) appendString:v6];
  }
  return 0;
}

- (id)dataForTypeIdentifier:(id)a3
{
  return 0;
}

- (id)fileURLForTypeIdentifier:(id)a3
{
  return 0;
}

- (void)willMarkAttachmentForDeletion
{
  v2.receiver = self;
  v2.super_class = (Class)ICAttachmentTableModel;
  [(ICAttachmentModel *)&v2 willMarkAttachmentForDeletion];
}

- (void)persistPendingChanges
{
  id v3 = [(ICAttachmentModel *)self attachment];
  char v4 = [v3 managedObjectContext];
  uint64_t v5 = [v4 concurrencyType];

  if (v5 == 2)
  {
    id v6 = [(ICAttachmentModel *)self attachment];
    +[ICTableAttachmentProvider saveAttachmentOnMainThread:v6];
  }
}

- (BOOL)usesChildAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  uint64_t v5 = [(ICAttachmentModel *)self attachment];
  id v6 = [v5 managedObjectContext];

  id v7 = [(ICAttachmentTableModel *)self table];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __46__ICAttachmentTableModel_usesChildAttachment___block_invoke;
  v11[3] = &unk_1E64A6F20;
  id v8 = v6;
  id v12 = v8;
  id v9 = v4;
  id v13 = v9;
  v14 = &v15;
  [v7 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:v11];

  LOBYTE(v7) = *((unsigned char *)v16 + 24);
  _Block_object_dispose(&v15, 8);

  return (char)v7;
}

uint64_t __46__ICAttachmentTableModel_usesChildAttachment___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 attributedString];
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [v3 attributedString];

  uint64_t v7 = objc_msgSend(v6, "ic_range");
  uint64_t v9 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __46__ICAttachmentTableModel_usesChildAttachment___block_invoke_2;
  v13[3] = &unk_1E64A4C58;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 48);
  id v14 = v10;
  uint64_t v15 = v11;
  objc_msgSend(v4, "ic_enumerateAbstractAttachmentsInContext:range:options:usingBlock:", v5, v7, v9, 0, v13);

  return 0;
}

uint64_t __46__ICAttachmentTableModel_usesChildAttachment___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (*(void *)(result + 32) == a2) {
    *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)replaceChildInlineAttachment:(id)a3 withText:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ICAttachmentTableModel *)self table];
  uint64_t v9 = [(ICAttachmentModel *)self attachment];
  id v10 = [v9 managedObjectContext];

  uint64_t v24 = 0;
  v25 = &v24;
  uint64_t v26 = 0x2020000000;
  char v27 = 0;
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  char v18 = __64__ICAttachmentTableModel_replaceChildInlineAttachment_withText___block_invoke;
  v19 = &unk_1E64A6ED0;
  id v11 = v10;
  id v20 = v11;
  id v12 = v6;
  id v21 = v12;
  id v13 = v7;
  id v22 = v13;
  v23 = &v24;
  [v8 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:&v16];
  if (*((unsigned char *)v25 + 24))
  {
    -[ICAttachmentModel setMergeableDataDirty:](self, "setMergeableDataDirty:", 1, v16, v17, v18, v19, v20, v21);
    id v14 = [(ICAttachmentModel *)self attachment];
    [v14 saveMergeableDataIfNeeded];

    uint64_t v15 = [(ICAttachmentModel *)self attachment];
    [v15 updateChangeCountWithReason:@"Replaced inline attachment"];
  }
  _Block_object_dispose(&v24, 8);
}

id __64__ICAttachmentTableModel_replaceChildInlineAttachment_withText___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7 = a2;
  uint64_t v8 = [v7 attributedString];
  uint64_t v9 = *(void *)(a1 + 32);
  uint64_t v10 = objc_msgSend(v8, "ic_range");
  uint64_t v12 = v11;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __64__ICAttachmentTableModel_replaceChildInlineAttachment_withText___block_invoke_2;
  v18[3] = &unk_1E64A6F48;
  id v19 = *(id *)(a1 + 40);
  id v20 = *(id *)(a1 + 48);
  id v13 = v7;
  uint64_t v14 = *(void *)(a1 + 56);
  id v21 = v13;
  uint64_t v22 = v14;
  uint64_t v23 = a5;
  objc_msgSend(v8, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v9, v10, v12, 0, v18);
  uint64_t v15 = v21;
  id v16 = v13;

  return v16;
}

void __64__ICAttachmentTableModel_replaceChildInlineAttachment_withText___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v14 = a2;
  if ([v14 attachmentType] == 1)
  {
    uint64_t v9 = [v14 objectID];
    uint64_t v10 = [*(id *)(a1 + 32) objectID];
    int v11 = [v9 isEqual:v10];

    if (v11)
    {
      uint64_t v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(a1 + 40)];
      objc_msgSend(*(id *)(a1 + 48), "replaceCharactersInRange:withAttributedString:", a3, a4, v12);
      id v13 = *(unsigned char **)(a1 + 64);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
      *a5 = 1;
      *id v13 = 1;
    }
  }
}

+ (id)contentInfoTextWithAttachmentCount:(unint64_t)a3
{
  id v4 = NSString;
  uint64_t v5 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"NOTE_LIST_TABLES_%lu" value:@"NOTE_LIST_TABLES_%lu" table:0 allowSiri:1];
  id v6 = objc_msgSend(v4, "localizedStringWithFormat:", v5, a3);

  return v6;
}

- (ICTable)table
{
  objc_super v2 = [(ICAttachmentTableModel *)self tableDocument];
  id v3 = [v2 table];

  return (ICTable *)v3;
}

- (ICTableVersionedDocument)tableDocument
{
  tableDocument = self->_tableDocument;
  if (!tableDocument)
  {
    uint64_t v17 = 0;
    char v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy__31;
    id v21 = __Block_byref_object_dispose__31;
    id v22 = 0;
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__31;
    uint64_t v15 = __Block_byref_object_dispose__31;
    id v16 = 0;
    id v4 = [(ICAttachmentModel *)self attachment];
    uint64_t v5 = [v4 managedObjectContext];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __39__ICAttachmentTableModel_tableDocument__block_invoke;
    v10[3] = &unk_1E64A4818;
    v10[4] = self;
    v10[5] = &v17;
    v10[6] = &v11;
    [v5 performBlockAndWait:v10];

    id v6 = [ICTableVersionedDocument alloc];
    id v7 = [(ICTTVersionedDocument *)v6 initWithData:v18[5] replicaID:v12[5]];
    uint64_t v8 = self->_tableDocument;
    self->_tableDocument = v7;

    _Block_object_dispose(&v11, 8);
    _Block_object_dispose(&v17, 8);

    tableDocument = self->_tableDocument;
  }
  return tableDocument;
}

void __39__ICAttachmentTableModel_tableDocument__block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 mergeableData];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [*(id *)(a1 + 32) currentReplicaID];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (id)mergeableDataForCopying:(id *)a3
{
  v28.receiver = self;
  v28.super_class = (Class)ICAttachmentTableModel;
  uint64_t v5 = -[ICAttachmentModel mergeableDataForCopying:](&v28, sel_mergeableDataForCopying_);
  if (v5)
  {
    uint64_t v6 = [ICTableVersionedDocument alloc];
    uint64_t v7 = [(ICAttachmentTableModel *)self table];
    uint64_t v8 = [v7 columnCount];
    uint64_t v9 = [(ICAttachmentTableModel *)self table];
    uint64_t v10 = [v9 rowCount];
    uint64_t v11 = [(ICAttachmentModel *)self currentReplicaID];
    uint64_t v12 = [(ICTableVersionedDocument *)v6 initWithColumnCount:v8 rowCount:v10 replicaID:v11];

    uint64_t v13 = [(ICAttachmentTableModel *)self table];
    LODWORD(v8) = [v13 isRightToLeft];

    if (v8)
    {
      id v14 = [(ICTableVersionedDocument *)v12 table];
      [v14 reverseColumnDirection];
    }
    uint64_t v22 = 0;
    uint64_t v23 = &v22;
    uint64_t v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__31;
    uint64_t v26 = __Block_byref_object_dispose__31;
    id v27 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v15 = [(ICAttachmentTableModel *)self table];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__ICAttachmentTableModel_mergeableDataForCopying___block_invoke;
    v19[3] = &unk_1E64A6F20;
    v19[4] = self;
    id v16 = v12;
    id v20 = v16;
    id v21 = &v22;
    [v15 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:v19];

    if (a3) {
      *a3 = (id)[(id)v23[5] copy];
    }
    uint64_t v17 = [(ICTTVersionedDocument *)v16 serialize];

    _Block_object_dispose(&v22, 8);
  }
  else
  {
    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t __50__ICAttachmentTableModel_mergeableDataForCopying___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = [a2 attributedString];
  uint64_t v8 = [*(id *)(a1 + 32) attachment];
  uint64_t v9 = [v8 managedObjectContext];
  uint64_t v10 = objc_msgSend(v7, "ic_attributedStringByFlatteningUnsupportedInlineAttachmentsWithContext:", v9);

  uint64_t v11 = [*(id *)(a1 + 40) table];
  [v11 setAttributedString:v10 columnIndex:a3 rowIndex:a4];

  uint64_t v12 = [*(id *)(a1 + 32) attachment];
  uint64_t v13 = [v12 managedObjectContext];
  uint64_t v14 = objc_msgSend(v10, "ic_range");
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __50__ICAttachmentTableModel_mergeableDataForCopying___block_invoke_2;
  void v17[3] = &unk_1E64A4B40;
  v17[4] = *(void *)(a1 + 48);
  objc_msgSend(v10, "ic_enumerateInlineAttachmentsInContext:range:options:usingBlock:", v13, v14, v15, 0, v17);

  return 0;
}

void __50__ICAttachmentTableModel_mergeableDataForCopying___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 markedForDeletion] & 1) == 0) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "ic_addNonNilObject:", v3);
  }
}

- (BOOL)isReadyToPresent
{
  return 0;
}

- (BOOL)mergeWithMergeableData:(id)a3 mergeableFieldState:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v7 = a3;
    uint64_t v8 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[ICAttachmentTableModel mergeWithMergeableData:mergeableFieldState:](v8);
    }

    uint64_t v9 = [ICTableVersionedDocument alloc];
    uint64_t v10 = [(ICAttachmentModel *)self currentReplicaID];
    uint64_t v11 = [(ICTTVersionedDocument *)v9 initWithData:v7 replicaID:v10];

    uint64_t v12 = [(ICAttachmentTableModel *)self tableDocument];
    uint64_t v13 = [v12 mergeWithTableVersionedDocument:v11];

    BOOL v14 = v13 == 2;
    if (v13 == 2)
    {
      uint64_t v15 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[ICAttachmentTableModel mergeWithMergeableData:mergeableFieldState:](v15);
      }

      [(ICAttachmentModel *)self setMergeableDataDirty:1];
      [(ICAttachmentTableModel *)self writeCurrentTimestampToMergeableFieldStateIfNecessary:v6];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F1A2D8], "ic_encryptedKeyForKeyPrefix:", @"MergeableData");
    id v6 = [(ICAttachmentTableModel *)self table];
    id v7 = [v6 ttDocument];
    uint64_t v8 = [v7 sharedTopotextTimestamp];

    uint64_t v9 = [v8 serialize];
    if ([v9 length])
    {
      [v4 setObject:v9 forKey:v5];
    }
    else
    {
      uint64_t v10 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[ICAttachmentTableModel writeCurrentTimestampToMergeableFieldStateIfNecessary:](self, v10);
      }
    }
  }
}

- (void)writeMergeableData
{
  if ([(ICAttachmentModel *)self isMergeableDataDirty]) {
    [(ICAttachmentModel *)self setMergeableDataDirty:0];
  }
  id v5 = [(ICAttachmentTableModel *)self tableDocument];
  id v3 = [v5 serialize];
  id v4 = [(ICAttachmentModel *)self attachment];
  [v4 setMergeableData:v3];
}

- (void)updateAttachmentByMergingWithTableData:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentTableModel *)self table];
  id v6 = [v5 document];
  uint64_t v7 = [v6 mergeWithData:v4];

  if (v7 == 2)
  {
    [(ICAttachmentModel *)self setMergeableDataDirty:1];
    id v8 = [(ICAttachmentModel *)self attachment];
    [v8 attachmentDidChange];
  }
}

- (void)mergeTablePrimitiveData
{
  id v3 = [(ICAttachmentModel *)self attachment];
  id v5 = [v3 primitiveValueForEncryptableKey:@"mergeableData"];

  id v4 = v5;
  if (v5)
  {
    [(ICAttachmentModel *)self mergeWithMergeableData:v5];
    id v4 = v5;
  }
}

- (void)addMergeableDataToCloudKitRecord:(id)a3 approach:(int64_t)a4 mergeableFieldState:(id)a5
{
  id v21 = a3;
  id v8 = a5;
  uint64_t v9 = [(ICAttachmentModel *)self attachment];
  int v10 = [v9 isPasswordProtected];

  if (v10) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"!self.attachment.isPasswordProtected" functionName:"-[ICAttachmentTableModel addMergeableDataToCloudKitRecord:approach:mergeableFieldState:]" simulateCrash:1 showAlert:0 format:@"Locked notes should use encrypted values JSON instead"];
  }
  if (v8)
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1A2D8], "ic_encryptedKeyForKeyPrefix:", @"MergeableData");
    objc_opt_class();
    uint64_t v12 = [v8 objectForKey:v11];
    uint64_t v13 = ICDynamicCast();

    if ([v13 length])
    {
      BOOL v14 = +[ICCRTTCompatibleDocument makeSharedTopotextTimestampFromData:v13];
      uint64_t v15 = [(ICAttachmentTableModel *)self table];
      id v16 = [v15 ttDocument];
      uint64_t v17 = [v16 sharedTopotextTimestamp];

      if (v14)
      {
        uint64_t v18 = [v14 compareTo:v17];

        if (!v18) {
          goto LABEL_13;
        }
        goto LABEL_10;
      }
    }
  }
LABEL_10:
  uint64_t v19 = [(ICAttachmentModel *)self attachment];
  id v20 = [v19 mergeableData];

  if (v20) {
    objc_msgSend(v21, "ic_setEncryptedInlineableDataAsset:forKeyPrefix:approach:", v20, @"MergeableData", a4);
  }

LABEL_13:
  [(ICAttachmentTableModel *)self writeCurrentTimestampToMergeableFieldStateIfNecessary:v8];
}

+ (id)tableFromAttributedString:(id)a3 managedObjectContext:(id)a4 replicaID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 length])
  {
    int v10 = (void *)MEMORY[0x1E4F28ED0];
    uint64_t v11 = [MEMORY[0x1E4F1C9C8] now];
    uint64_t v12 = objc_msgSend(v11, "ic_truncated");
    [v12 timeIntervalSince1970];
    uint64_t v13 = objc_msgSend(v10, "numberWithDouble:");

    BOOL v14 = [(ICTTVersionedDocument *)[ICTableVersionedDocument alloc] initWithData:0 replicaID:v9];
    uint64_t v15 = [(ICTableVersionedDocument *)v14 table];
    id v16 = (id)[v15 insertColumnAtIndex:0];
    uint64_t v17 = [v7 length];
    uint64_t v22 = MEMORY[0x1E4F143A8];
    uint64_t v23 = 3221225472;
    uint64_t v24 = __83__ICAttachmentTableModel_tableFromAttributedString_managedObjectContext_replicaID___block_invoke;
    v25 = &unk_1E64A6F98;
    id v26 = v7;
    id v18 = v15;
    id v27 = v18;
    id v19 = v13;
    id v28 = v19;
    id v29 = v8;
    objc_msgSend(v26, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", 0, v17, 0, &v22);
    if (!objc_msgSend(v18, "rowCount", v22, v23, v24, v25)) {
      id v20 = (id)[v18 insertRowAtIndex:0];
    }
    if (![v18 rowCount] || !objc_msgSend(v18, "columnCount")) {
      [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"icTable.rowCount > 0 && icTable.columnCount > 0" functionName:"+[ICAttachmentTableModel tableFromAttributedString:managedObjectContext:replicaID:]" simulateCrash:1 showAlert:0 format:@"Table from attributed string must have at least one row and one column"];
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

void __83__ICAttachmentTableModel_tableFromAttributedString_managedObjectContext_replicaID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (!v7)
  {
    id v8 = 0;
LABEL_17:
    v25 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    id v26 = [v25 string];
    uint64_t v27 = [v25 length];
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __83__ICAttachmentTableModel_tableFromAttributedString_managedObjectContext_replicaID___block_invoke_2;
    v30[3] = &unk_1E64A6F70;
    uint64_t v34 = a3;
    uint64_t v35 = a4;
    id v31 = v25;
    id v32 = *(id *)(a1 + 40);
    id v33 = *(id *)(a1 + 48);
    id v28 = v25;
    objc_msgSend(v26, "enumerateSubstringsInRange:options:usingBlock:", 0, v27, 1, v30);

    goto LABEL_18;
  }
  objc_opt_class();
  id v8 = ICDynamicCast();
  if (!v8 || +[ICTTAttachment isInlineAttachment:v8]) {
    goto LABEL_17;
  }
  if (*(void *)(a1 + 56))
  {
    id v9 = objc_msgSend(v8, "attachmentInContext:");
    if ([v9 isTable])
    {
      int v10 = [v9 tableModel];
      uint64_t v11 = [v10 table];

      uint64_t v29 = [*(id *)(a1 + 40) rowCount];
      id v12 = (id)objc_msgSend(*(id *)(a1 + 40), "insertRows:atIndex:", objc_msgSend(v11, "rowCount"), v29);
      unint64_t v13 = [v11 columnCount];
      if (v13 > [*(id *)(a1 + 40) columnCount]) {
        id v14 = (id)objc_msgSend(*(id *)(a1 + 40), "insertColumns:atIndex:", objc_msgSend(v11, "columnCount")- objc_msgSend(*(id *)(a1 + 40), "columnCount"), objc_msgSend(*(id *)(a1 + 40), "columnCount"));
      }
      if ([v11 rowCount])
      {
        unint64_t v15 = 0;
        do
        {
          if ([v11 columnCount])
          {
            unint64_t v16 = 0;
            do
            {
              uint64_t v17 = [v11 stringForColumnIndex:v16 rowIndex:v15];
              id v18 = (void *)[v17 mutableCopy];

              id v19 = ICTTAttributeNameTimestamp;
              uint64_t v20 = *(void *)(a1 + 48);
              uint64_t v21 = objc_msgSend(v18, "ic_range");
              objc_msgSend(v18, "addAttribute:value:range:", v19, v20, v21, v22);
              uint64_t v23 = *(void **)(a1 + 40);
              uint64_t v24 = (void *)[v18 copy];
              [v23 setAttributedString:v24 columnIndex:v16 rowIndex:v15 + v29];

              ++v16;
            }
            while (v16 < [v11 columnCount]);
          }
          ++v15;
        }
        while (v15 < [v11 rowCount]);
      }
    }
  }
LABEL_18:
}

void __83__ICAttachmentTableModel_tableFromAttributedString_managedObjectContext_replicaID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  if (*(void *)(a1 + 56)) {
    BOOL v8 = a4 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (!v8)
  {
    uint64_t v35 = objc_msgSend(*(id *)(a1 + 32), "attributedSubstringFromRange:", a3, a4);
    id v32 = v7;
    id v9 = [v7 componentsSeparatedByString:@"\t"];
    unint64_t v10 = [*(id *)(a1 + 40) columnCount];
    unint64_t v11 = [v9 count];
    unint64_t v12 = v11 - v10;
    if (v11 > v10) {
      id v13 = (id)[*(id *)(a1 + 40) insertColumns:v12 atIndex:v10];
    }
    uint64_t v34 = objc_msgSend(*(id *)(a1 + 40), "rowCount", v12);
    id v14 = (id)objc_msgSend(*(id *)(a1 + 40), "insertRowAtIndex:");
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id obj = v9;
    uint64_t v15 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = *(void *)v37;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v37 != v19) {
            objc_enumerationMutation(obj);
          }
          uint64_t v21 = objc_msgSend(v35, "attributedSubstringFromRange:", v18, objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * v20), "length"));
          uint64_t v22 = (void *)[v21 mutableCopy];

          uint64_t v23 = objc_msgSend(v22, "ic_range");
          objc_msgSend(v22, "ic_convertParagraphStyleToBodyInRange:", v23, v24);
          v25 = ICTTAttributeNameTimestamp;
          uint64_t v26 = *(void *)(a1 + 48);
          uint64_t v27 = objc_msgSend(v22, "ic_range");
          objc_msgSend(v22, "addAttribute:value:range:", v25, v26, v27, v28);
          uint64_t v29 = *(void **)(a1 + 40);
          v30 = (void *)[v22 copy];
          [v29 setAttributedString:v30 columnIndex:v17 + v20 rowIndex:v34];

          uint64_t v31 = [v22 length];
          v18 += v31 + [@"\t" length];

          ++v20;
        }
        while (v16 != v20);
        uint64_t v16 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
        v17 += v20;
      }
      while (v16);
    }

    id v7 = v32;
  }
}

- (void)updateAfterLoadWithInlineAttachmentIdentifierMap:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentTableModel *)self table];
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke;
  v9[3] = &unk_1E64A6FE8;
  id v6 = v4;
  id v10 = v6;
  unint64_t v12 = &v13;
  id v7 = v5;
  id v11 = v7;
  [v7 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:v9];
  if (*((unsigned char *)v14 + 24))
  {
    [(ICAttachmentModel *)self setMergeableDataDirty:1];
    BOOL v8 = [(ICAttachmentModel *)self attachment];
    [v8 saveMergeableDataIfNeeded];
  }
  _Block_object_dispose(&v13, 8);
}

uint64_t __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  BOOL v8 = [v7 attributedString];
  id v9 = (void *)[v8 mutableCopy];

  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  uint64_t v10 = [v9 length];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2;
  v15[3] = &unk_1E64A6FC0;
  uint64_t v18 = &v19;
  id v16 = *(id *)(a1 + 32);
  id v11 = v9;
  id v17 = v11;
  objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", @"NSAttachment", 0, v10, 0, v15);
  if (*((unsigned char *)v20 + 24))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    unint64_t v12 = *(void **)(a1 + 40);
    uint64_t v13 = (void *)[v11 copy];
    [v12 setAttributedString:v13 columnIndex:a3 rowIndex:a4];
  }
  _Block_object_dispose(&v19, 8);

  return 0;
}

void __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if ([v7 conformsToProtocol:&unk_1F1F80810])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    id v8 = v7;
    id v9 = objc_alloc_init(ICTTAttachment);
    uint64_t v10 = [v8 attachmentIdentifier];
    id v11 = [*(id *)(a1 + 32) objectForKeyedSubscript:v10];
    unint64_t v12 = os_log_create("com.apple.notes", "Topotext");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2_cold_2();
    }

    if (v11)
    {
      [(ICTTAttachment *)v9 setAttachmentIdentifier:v11];
    }
    else
    {
      uint64_t v13 = os_log_create("com.apple.notes", "Topotext");
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2_cold_1();
      }
    }
    id v14 = [v8 attachmentUTI];
    [(ICTTAttachment *)v9 setAttachmentUTI:v14];

    objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", @"NSAttachment", v9, a3, a4);
  }
}

- (id)localizedFallbackTitle
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Table" value:@"Table" table:0 allowSiri:1];
}

- (id)localizedFallbackSubtitleIOS
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Upgrade iOS to view this table." value:@"Upgrade iOS to view this table." table:0 allowSiri:1];
}

- (id)localizedFallbackSubtitleMac
{
  return (id)[MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Upgrade macOS to view this table." value:@"Upgrade macOS to view this table." table:0 allowSiri:1];
}

- (void)removeTimestampsForReplicaID:(id)a3
{
  id v4 = a3;
  id v5 = [(ICAttachmentTableModel *)self table];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__ICAttachmentTableModel_removeTimestampsForReplicaID___block_invoke;
  v7[3] = &unk_1E64A6EA8;
  id v8 = v4;
  id v6 = v4;
  [v5 enumerateCellObjectsInCellSelectionContainingColumnIndices:0 rowIndices:0 copyItems:0 usingBlock:v7];

  [(ICAttachmentModel *)self setMergeableDataDirty:1];
  [(ICAttachmentTableModel *)self writeMergeableData];
}

id __55__ICAttachmentTableModel_removeTimestampsForReplicaID___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 edits];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__ICAttachmentTableModel_removeTimestampsForReplicaID___block_invoke_2;
  v8[3] = &unk_1E64A7010;
  id v9 = *(id *)(a1 + 32);
  int v5 = objc_msgSend(v4, "ic_containsObjectPassingTest:", v8);

  if (v5)
  {
    [v3 removeTimestampsForReplicaID:*(void *)(a1 + 32)];
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

BOOL __55__ICAttachmentTableModel_removeTimestampsForReplicaID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 replicaID];
  if ([v4 isEqual:*(void *)(a1 + 32)])
  {
    int v5 = [v3 timestamp];
    BOOL v6 = v5 != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)setTableDocument:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)attachmentDidRefresh:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Unable to fault %@ after being refreshed", v1, 0xCu);
}

- (void)attachmentDidRefresh:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_DEBUG, "Faulted %@ after being refreshed", v1, 0xCu);
}

- (void)attachmentDidRefresh:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 attachment];
  id v4 = [v3 identifier];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_DEBUG, "Had a dirty table document after refresh: %@", v5, 0xCu);
}

- (void)mergeWithMergeableData:(os_log_t)log mergeableFieldState:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "ICAttachmentTableModel: Attachment Updated from Merge", v1, 2u);
}

- (void)mergeWithMergeableData:(os_log_t)log mergeableFieldState:.cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C3A61000, log, OS_LOG_TYPE_DEBUG, "ICAttachmentTableModel: mergeWithMergeableData", v1, 2u);
}

- (void)writeCurrentTimestampToMergeableFieldStateIfNecessary:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 attachment];
  id v4 = objc_msgSend(v3, "ic_loggingIdentifier");
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, a2, OS_LOG_TYPE_ERROR, "Failed to snapshot CRDT timestamp for table: %@", v5, 0xCu);
}

void __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_1C3A61000, v0, OS_LOG_TYPE_ERROR, "Unable to map from %@ to new identifier", v1, 0xCu);
}

void __75__ICAttachmentTableModel_updateAfterLoadWithInlineAttachmentIdentifierMap___block_invoke_2_cold_2()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1C3A61000, v1, OS_LOG_TYPE_DEBUG, "Update inline attachment after load: %@ => %@", v2, 0x16u);
}

@end