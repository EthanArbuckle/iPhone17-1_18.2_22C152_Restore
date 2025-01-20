@interface NSAttributedString
@end

@implementation NSAttributedString

void __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1C877DB80]();
  if ([v3 conformsToProtocol:&unk_1F1F80810])
  {
    uint64_t v5 = [v3 attachmentInContext:*(void *)(a1 + 32)];
    if (v5)
    {
      os_log_t v6 = (os_log_t)v5;
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_7:
    }
  }
  else if (v3)
  {
    os_log_t v6 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);
    }
    goto LABEL_7;
  }
}

uint64_t __39__NSAttributedString_UI__editsInRange___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __162__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_attributedStringWithArchive_dataPersister_note_parentAttachment_shouldCreateNewAttachments_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  uint64_t v7 = [v16 todo];

  if (v7)
  {
    uint64_t v8 = (void *)[v16 mutableCopy];
    uint64_t v9 = [ICTTTodo alloc];
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    uint64_t v11 = [v8 todo];
    uint64_t v12 = -[ICTTTodo initWithIdentifier:done:](v9, "initWithIdentifier:done:", v10, [v11 done]);
    [v8 setTodo:v12];

    v13 = *(void **)(a1 + 32);
    v14 = ICTTAttributeNameParagraphStyle;
    v15 = (void *)[v8 copy];
    objc_msgSend(v13, "addAttribute:value:range:", v14, v15, a3, a4);
  }
}

void __126__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_saveToArchive_flags_dataPersister_managedObjectContext_error___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1F80810])
  {
    v4 = (void *)MEMORY[0x1C877DB80]();
    id v5 = v3;
    os_log_t v6 = [v5 attachmentIdentifier];
    BOOL v7 = +[ICTTAttachment isInlineAttachment:v5];
    uint64_t v8 = a1[4];
    if (v7)
    {
      uint64_t v9 = +[ICBaseAttachment attachmentWithIdentifier:v6 context:v8];
      uint64_t v10 = v9;
      if (!v9 || ([v9 markedForDeletion] & 1) != 0) {
        goto LABEL_18;
      }
      uint64_t v11 = a1[8];
      int v12 = *(_DWORD *)(v11 + 116);
      uint64_t v13 = *(int *)(v11 + 112);
      if ((int)v13 >= v12)
      {
        if (v12 == *(_DWORD *)(v11 + 120)) {
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v11 + 104, v12 + 1);
        }
        google::protobuf::internal::GenericTypeHandler<topotext::Attachment>::New();
      }
      uint64_t v14 = *(void *)(v11 + 104);
      *(_DWORD *)(v11 + 112) = v13 + 1;
      uint64_t v15 = *(void *)(v14 + 8 * v13);
      uint64_t v22 = a1[5];
      uint64_t v23 = *(void *)(a1[7] + 8);
      v25 = *(void **)(v23 + 40);
      v24 = (void **)(v23 + 40);
      v35 = v25;
      char v26 = [v10 saveToArchive:v15 dataPersister:v22 error:&v35];
      v27 = v35;
    }
    else
    {
      id v16 = +[ICBaseAttachment attachmentWithIdentifier:v6 context:v8];
      uint64_t v10 = v16;
      if (!v16 || ([v16 markedForDeletion] & 1) != 0) {
        goto LABEL_18;
      }
      uint64_t v17 = a1[8];
      int v18 = *(_DWORD *)(v17 + 116);
      uint64_t v19 = *(int *)(v17 + 112);
      if ((int)v19 >= v18)
      {
        if (v18 == *(_DWORD *)(v17 + 120)) {
          google::protobuf::internal::RepeatedPtrFieldBase::Reserve(v17 + 104, v18 + 1);
        }
        google::protobuf::internal::GenericTypeHandler<topotext::Attachment>::New();
      }
      uint64_t v20 = *(void *)(v17 + 104);
      *(_DWORD *)(v17 + 112) = v19 + 1;
      uint64_t v21 = *(void *)(v20 + 8 * v19);
      uint64_t v28 = a1[5];
      uint64_t v29 = (a1[9] >> 1) & 1;
      uint64_t v30 = *(void *)(a1[7] + 8);
      v31 = *(void **)(v30 + 40);
      v24 = (void **)(v30 + 40);
      v34 = v31;
      char v26 = [v10 saveToArchive:v21 dataPersister:v28 stripImageMarkupMetadata:v29 error:&v34];
      v27 = v34;
    }
    id v32 = v27;
    v33 = *v24;
    *v24 = v32;

    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v26;
LABEL_18:
  }
}

void __109__NSAttributedString_NSAttributedStringPersistenceAdditions__ic_approximateAttachmentsSizeIncludingPreviews___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 conformsToProtocol:&unk_1F1F80810])
  {
    id v3 = [v7 attachmentIdentifier];
    v4 = +[ICNoteContext sharedContext];
    id v5 = [v4 managedObjectContext];
    os_log_t v6 = +[ICBaseAttachment attachmentWithIdentifier:v3 context:v5];

    if (v6)
    {
      *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) += [v6 approximateArchiveSizeIncludingPreviews:*(unsigned __int8 *)(a1 + 40)];
    }
  }
}

void __94__NSAttributedString_Shared__ic_enumerateInlineAttachmentsInContext_range_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1C877DB80]();
  if ([v3 conformsToProtocol:&unk_1F1F80810])
  {
    id v5 = v3;
    if (+[ICTTAttachment isInlineAttachment:v5])
    {
      os_log_t v6 = [v5 inlineAttachmentInContext:*(void *)(a1 + 32)];

      if (v6)
      {
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      }
    }
    else
    {
    }
  }
  else if (v3)
  {
    id v7 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke_cold_1((uint64_t)v3, v7, v8, v9, v10, v11, v12, v13);
    }
  }
}

uint64_t __73__NSAttributedString_Shared__abstractAttachmentsInContext_range_options___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

void __96__NSAttributedString_Shared__ic_enumerateAbstractAttachmentsInContext_range_options_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)MEMORY[0x1C877DB80]();
  if ([v3 conformsToProtocol:&unk_1F1F80810])
  {
    id v5 = v3;
    BOOL v6 = +[ICTTAttachment isInlineAttachment:v5];
    uint64_t v7 = *(void *)(a1 + 32);
    if (v6) {
      [v5 inlineAttachmentInContext:v7];
    }
    else {
    uint64_t v8 = [v5 attachmentInContext:v7];
    }

    if (v8)
    {
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_10:
    }
  }
  else if (v3)
  {
    uint64_t v8 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke_cold_1((uint64_t)v3, v8, v9, v10, v11, v12, v13, v14);
    }
    goto LABEL_10;
  }
}

void __80__NSAttributedString_Shared__ic_attributedStringByRefreshingParagraphStyleUUIDs__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  if (a2)
  {
    id v8 = (id)[a2 mutableCopy];
    uint64_t v7 = [MEMORY[0x1E4F29128] UUID];
    [v8 setUuid:v7];

    objc_msgSend(*(id *)(a1 + 32), "addAttribute:value:range:", ICTTAttributeNameParagraphStyle, v8, a3, a4);
  }
}

uint64_t __130__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineattachmentsOnly___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return [a4 setObject:a3 forKeyedSubscript:a2];
}

id __130__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineattachmentsOnly___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  objc_opt_class();
  BOOL v6 = ICCheckedDynamicCast();

  if ([v6 isLinkAttachment])
  {
    uint64_t v7 = [v6 tokenContentIdentifier];
    id v8 = NotesAppURLForNoteIdentifierOrTokenContentIdentifier(v7);

    [v4 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB0720]];
  }
  uint64_t v9 = [v6 displayText];
  uint64_t v10 = objc_msgSend(v9, "ic_stringByRemovingLanguageDirectionCharacters");

  if ([v10 length]) {
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v10 attributes:v4];
  }
  else {
    uint64_t v11 = 0;
  }

  return v11;
}

void __196__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineAttachmentsOnly_updateRangeValueToObjectMapBlock_replacementAttributedStringBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v16 = a2;
  int v7 = [v16 conformsToProtocol:&unk_1F1F80810];
  id v8 = v16;
  if (v7)
  {
    id v9 = v16;
    if (!+[ICTTAttachment isInlineAttachment:v9])
    {
LABEL_14:

      id v8 = v16;
      goto LABEL_15;
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", a3, a4);
    if (*(void *)(a1 + 32))
    {
      uint64_t v11 = objc_msgSend(v9, "inlineAttachmentInContext:");
      uint64_t v12 = v11;
      if (!v11)
      {
LABEL_13:

        goto LABEL_14;
      }
      if (!*(unsigned char *)(a1 + 64)
        || (![v11 isUnsupported] ? (uint64_t v13 = 0) : (uint64_t v13 = v12),
            id v14 = v13,
            v12,
            v14))
      {
        [*(id *)(a1 + 40) insertObject:v10 atIndex:0];
        uint64_t v15 = *(void *)(a1 + 56);
        if (v15) {
          (*(void (**)(uint64_t, void *, void *, void))(v15 + 16))(v15, v10, v12, *(void *)(a1 + 48));
        }
        goto LABEL_13;
      }
    }
    uint64_t v12 = 0;
    goto LABEL_13;
  }
LABEL_15:
}

uint64_t __196__NSAttributedString_Shared__ic_attributedStringByFlatteningInlineAttachmentsWithContext_flattenUnsupportedInlineAttachmentsOnly_updateRangeValueToObjectMapBlock_replacementAttributedStringBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  unint64_t v5 = [a3 rangeValue];
  unint64_t v6 = [v4 rangeValue];

  if (v5 < v6) {
    return -1;
  }
  else {
    return v5 > v6;
  }
}

void __59__NSAttributedString_Shared__ic_searchableStringInContext___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = v7;
  if (v7)
  {
    uint64_t v17 = v7;
    int v9 = [v7 conformsToProtocol:&unk_1F1F80810];
    id v8 = v17;
    if (v9)
    {
      id v10 = v17;
      BOOL v11 = +[ICTTAttachment isInlineAttachment:v10];
      uint64_t v12 = *(void *)(a1 + 32);
      if (v11)
      {
        uint64_t v13 = [v10 inlineAttachmentInContext:v12];
        id v14 = [v13 searchableTextContentInNote];
        if (!v14) {
          goto LABEL_11;
        }
      }
      else
      {
        uint64_t v13 = [v10 attachmentInContext:v12];
        uint64_t v15 = [v13 attachmentModel];
        id v14 = [v15 searchableTextContentInNote];

        if (!v14)
        {
LABEL_11:

          id v8 = v17;
          goto LABEL_12;
        }
      }
      if (![v14 length])
      {
        uint64_t v16 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];

        id v14 = (void *)v16;
      }
      objc_msgSend(*(id *)(a1 + 40), "replaceCharactersInRange:withAttributedString:", a3, a4, v14);
      if (v13) {
        objc_msgSend(*(id *)(a1 + 40), "addAttribute:value:range:", @"ICAttachmentSearchable", v13, a3, objc_msgSend(v14, "length"));
      }
      goto LABEL_11;
    }
  }
LABEL_12:
}

void __59__NSAttributedString_UI__enumerateEditsInRange_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = -[ICTTTextEdit initWithAttributes:range:]([ICTTTextEdit alloc], "initWithAttributes:range:", v7, a3, a4);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__NSAttributedString_Shared__ic_enumerateAttachmentsInContext_range_options_usingBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end