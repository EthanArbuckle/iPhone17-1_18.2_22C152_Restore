@interface ICTable
@end

@implementation ICTable

void __98__ICTable_UI__enumerateTextStoragesForColumnIndexes_rowIndexes_undoTarget_undoManager_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__ICTable_UI__enumerateTextStoragesForColumnIndexes_rowIndexes_undoTarget_undoManager_usingBlock___block_invoke_2;
  v7[3] = &unk_1E5FD9100;
  v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  uint64_t v11 = *(void *)(a1 + 72);
  v7[4] = v4;
  uint64_t v13 = a2;
  id v8 = v6;
  id v9 = *(id *)(a1 + 56);
  id v10 = *(id *)(a1 + 64);
  v12 = v14;
  [v5 enumerateIndexesUsingBlock:v7];

  _Block_object_dispose(v14, 8);
}

void __98__ICTable_UI__enumerateTextStoragesForColumnIndexes_rowIndexes_undoTarget_undoManager_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
  {
    **(unsigned char **)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    *a3 = 1;
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) textStorageForCellAtColumnIndex:*(void *)(a1 + 80) rowIndex:a2 undoTarget:*(void *)(a1 + 40) undoManager:*(void *)(a1 + 48)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  uint64_t v7 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
  if (v7 == a4)
  {
    id v8 = @"\t";
  }
  else
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    id v8 = @"\n";
  }
  objc_msgSend(*(id *)(a1 + 32), "ic_appendString:", v8);
LABEL_6:
  id v9 = [v6 attributedString];
  id v10 = (void *)[v9 mutableCopy];

  if (v10)
  {
    if (*(unsigned char *)(a1 + 64))
    {
      if (*(void *)(a1 + 40))
      {
        uint64_t v11 = *MEMORY[0x1E4FB06B8];
        uint64_t v12 = [v10 length];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke_2;
        v15[3] = &unk_1E5FD9150;
        v16 = *(id *)(a1 + 40);
        id v17 = *(id *)(a1 + 48);
        id v18 = v10;
        objc_msgSend(v18, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v12, 0, v15);

        uint64_t v13 = v16;
      }
      else
      {
        uint64_t v13 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke_cold_1(v13);
        }
      }
    }
    [*(id *)(a1 + 32) appendAttributedString:v10];
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = a4;

  return 0;
}

void __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v18 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v18;
    objc_opt_class();
    id v8 = [v7 attachment];

    id v9 = ICCheckedDynamicCast();

    id v10 = (void *)MEMORY[0x1E4F833A0];
    uint64_t v11 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v12 = [v11 UUIDString];
    uint64_t v13 = [v9 typeUTI];
    v14 = [v9 altText];
    v15 = [v9 tokenContentIdentifier];
    v16 = (void *)[v10 newAttachmentWithIdentifier:v12 typeUTI:v13 altText:v14 tokenContentIdentifier:v15 note:*(void *)(a1 + 32) parentAttachment:*(void *)(a1 + 40)];

    [v16 updateChangeCountWithReason:@"Cloned inline attachment"];
    id v17 = +[ICInlineTextAttachment textAttachmentWithAttachment:v16];
    objc_msgSend(*(id *)(a1 + 48), "addAttribute:value:range:", *MEMORY[0x1E4FB06B8], v17, a3, a4);
  }
}

void __101__ICTable_NSTextTableAdditions__attributedStringWithNSTextTablesForColumns_rows_context_forPrinting___block_invoke(uint64_t a1, uint64_t a2)
{
  if ([*(id *)(a1 + 32) isRightToLeft]) {
    uint64_t v4 = 2;
  }
  else {
    uint64_t v4 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __101__ICTable_NSTextTableAdditions__attributedStringWithNSTextTablesForColumns_rows_context_forPrinting___block_invoke_2;
  v6[3] = &unk_1E5FDDE58;
  v5 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  uint64_t v10 = a2;
  id v7 = *(id *)(a1 + 48);
  id v8 = *(id *)(a1 + 56);
  id v9 = *(id *)(a1 + 64);
  char v11 = *(unsigned char *)(a1 + 72);
  [v5 enumerateIndexesWithOptions:v4 usingBlock:v6];
}

void __101__ICTable_NSTextTableAdditions__attributedStringWithNSTextTablesForColumns_rows_context_forPrinting___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a1 + 32);
  v5 = [v4 identifierForColumnAtIndex:a2];
  id v6 = [*(id *)(a1 + 32) identifierForRowAtIndex:*(void *)(a1 + 64)];
  id v11 = [v4 mergeableStringForColumnID:v5 rowID:v6];

  id v7 = [v11 attributedString];
  id v8 = objc_msgSend(v7, "ic_attributedStringByFlatteningInlineAttachmentsWithContext:formatter:", *(void *)(a1 + 40), 0);

  if (!v8) {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:&stru_1F0973378];
  }
  id v9 = *(void **)(a1 + 48);
  uint64_t v10 = objc_msgSend(*(id *)(a1 + 32), "p_attributedStringForCell:inTable:atColumn:row:shouldFilter:context:", v8, *(void *)(a1 + 56), a2, *(void *)(a1 + 64), *(unsigned char *)(a1 + 72) == 0, *(void *)(a1 + 40));
  [v9 appendAttributedString:v10];
}

void __101__ICTable_UI__joinedAttributedStringForColumns_rows_deepCopyInlineAttachments_note_parentAttachment___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Trying deep-copy an inline attachment from table without providing a parent note.", v1, 2u);
}

@end