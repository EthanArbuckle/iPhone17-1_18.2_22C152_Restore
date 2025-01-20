@interface ICLegacyNoteUtilities
+ (id)temporaryTextStorageWithAttributedString:(id)a3 replicaID:(id)a4 styler:(id)a5;
+ (void)copyValuesFromLegacyNote:(id)a3 toNote:(id)a4 styler:(id)a5 attachmentPreviewGenerator:(id)a6;
+ (void)importLegacyNote:(id)a3 temporaryTextStorage:(id)a4 toNote:(id)a5 attachmentPreviewGenerator:(id)a6;
@end

@implementation ICLegacyNoteUtilities

+ (id)temporaryTextStorageWithAttributedString:(id)a3 replicaID:(id)a4 styler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = [[ICTTTextStorage alloc] initWithData:0 replicaID:v8];

  [(ICTTTextStorage *)v10 setStyler:v7];
  [(ICTTTextStorage *)v10 setConvertAttributes:1];
  [(ICTTTextStorage *)v10 setWantsUndoCommands:0];
  -[ICTTTextStorage replaceCharactersInRange:withAttributedString:](v10, "replaceCharactersInRange:withAttributedString:", 0, [(ICTTTextStorage *)v10 length], v9);

  [(ICTTTextStorage *)v10 fixupAfterEditing];
  [(ICTTTextStorage *)v10 setConvertAttributes:0];
  [(ICTTTextStorage *)v10 setStyler:0];
  return v10;
}

+ (void)importLegacyNote:(id)a3 temporaryTextStorage:(id)a4 toNote:(id)a5 attachmentPreviewGenerator:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v14 = [v9 managedObjectContext];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke;
  v42[3] = &unk_1E5FD91D0;
  id v15 = v9;
  id v43 = v15;
  id v16 = v13;
  id v44 = v16;
  [v14 performBlockAndWait:v42];

  uint64_t v17 = *MEMORY[0x1E4F83248];
  uint64_t v18 = [v10 length];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2;
  v38[3] = &unk_1E5FDD9A8;
  id v19 = v15;
  id v39 = v19;
  id v20 = v16;
  id v40 = v20;
  id v21 = v10;
  id v41 = v21;
  objc_msgSend(v21, "enumerateAttribute:inRange:options:usingBlock:", v17, 0, v18, 0, v38);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v22 = objc_msgSend(v20, "allValues", 0);
  uint64_t v23 = [v22 countByEnumeratingWithState:&v34 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v35;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v35 != v25) {
          objc_enumerationMutation(v22);
        }
        [MEMORY[0x1E4F833D8] importLegacyAttachment:*(void *)(*((void *)&v34 + 1) + 8 * v26++) toNote:v11 attachmentPreviewGenerator:v12];
      }
      while (v24 != v26);
      uint64_t v24 = [v22 countByEnumeratingWithState:&v34 objects:v45 count:16];
    }
    while (v24);
  }

  v27 = [v11 textStorage];
  [v27 setWantsUndoCommands:0];

  v28 = [v11 textStorage];
  v29 = [v11 textStorage];
  objc_msgSend(v28, "deleteCharactersInRange:", 0, objc_msgSend(v29, "length"));

  v30 = [v11 textStorage];
  v31 = [v30 mergeableString];
  v32 = [v21 mergeableString];
  [v31 mergeWithString:v32];

  v33 = [v11 textStorage];
  [v33 setWantsUndoCommands:1];
}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [*(id *)(a1 + 32) attachments];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = ICCheckedProtocolCast();
        id v8 = [v7 contentID];
        if (v8)
        {
          id v9 = [*(id *)(a1 + 40) objectForKeyedSubscript:v8];

          if (v9) {
            [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"!legacyAttachmentIDMap[contentID]", "+[ICLegacyNoteUtilities importLegacyNote:temporaryTextStorage:toNote:attachmentPreviewGenerator:]_block_invoke", 1, 0, @"Duplicate contentID found %@, existing attachment will be overwritten", v8 functionName simulateCrash showAlert format];
          }
          [*(id *)(a1 + 40) setObject:v7 forKeyedSubscript:v8];
        }
        else
        {
          [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"contentID" functionName:"+[ICLegacyNoteUtilities importLegacyNote:temporaryTextStorage:toNote:attachmentPreviewGenerator:]_block_invoke" simulateCrash:1 showAlert:0 format:@"legacyAttachment.contentID is nil"];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = [v7 fileWrapper];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    long long v10 = [v7 fileWrapper];
    long long v11 = (void *)MEMORY[0x1E4F833D8];
    long long v12 = [v10 cidURL];
    long long v13 = [v11 contentIDStringFromCIDURL:v12];

    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__60;
    v31 = __Block_byref_object_dispose__60;
    id v32 = 0;
    if (v13)
    {
      v14 = [*(id *)(a1 + 32) managedObjectContext];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_100;
      v23[3] = &unk_1E5FD9870;
      uint64_t v26 = &v27;
      uint64_t v15 = v13;
      uint64_t v24 = v15;
      id v25 = *(id *)(a1 + 32);
      [v14 performBlockAndWait:v23];

      uint64_t v16 = v28[5];
      uint64_t v17 = *(void **)(a1 + 40);
      if (v16)
      {
        [v17 setObject:v16 forKeyedSubscript:v15];
      }
      else
      {
        uint64_t v20 = [v17 objectForKeyedSubscript:v15];
        id v21 = (void *)v28[5];
        v28[5] = v20;
      }
      uint64_t v18 = v24;
    }
    else
    {
      uint64_t v18 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v19 = [v10 cidURL];
        __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2_cold_2(v19, buf, v18);
      }
    }
    if (!v28[5])
    {
      v22 = os_log_create("com.apple.notes", "HTML");
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2_cold_1((uint64_t)v13, v22);
      }

      objc_msgSend(*(id *)(a1 + 48), "deleteCharactersInRange:", a3, a4);
    }
    _Block_object_dispose(&v27, 8);
  }
}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_100(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F833D8];
  uint64_t v3 = *(void *)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v4 = [v2 attachmentWithContentID:v3 context:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

+ (void)copyValuesFromLegacyNote:(id)a3 toNote:(id)a4 styler:(id)a5 attachmentPreviewGenerator:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a6;
  id v12 = a5;
  long long v13 = [v25 managedObjectContext];

  if (!v13) {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"legacyNote.managedObjectContext", "+[ICLegacyNoteUtilities copyValuesFromLegacyNote:toNote:styler:attachmentPreviewGenerator:]", 1, 0, @"Legacy note does not have valid object context %@", v25 functionName simulateCrash showAlert format];
  }
  v14 = [v25 htmlString];
  uint64_t v15 = (void *)MEMORY[0x1E4F83418];
  uint64_t v16 = [MEMORY[0x1E4F83490] sharedInstance];
  uint64_t v17 = [v15 attributedStringFromHTMLString:v14 readerDelegate:v16];

  uint64_t v18 = [v10 currentReplicaID];
  id v19 = [a1 temporaryTextStorageWithAttributedString:v17 replicaID:v18 styler:v12];

  uint64_t v20 = [v25 creationDate];
  if (v20)
  {
    [v10 setCreationDate:v20];
  }
  else
  {
    id v21 = [MEMORY[0x1E4F1C9C8] date];
    [v10 setCreationDate:v21];
  }
  v22 = [v25 modificationDate];
  if (v22)
  {
    [v10 setModificationDate:v22];
  }
  else
  {
    uint64_t v23 = [MEMORY[0x1E4F1C9C8] date];
    [v10 setModificationDate:v23];
  }
  uint64_t v24 = [v25 title];
  [v10 setTitle:v24];

  [a1 importLegacyNote:v25 temporaryTextStorage:v19 toNote:v10 attachmentPreviewGenerator:v11];
}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_DEBUG, "No legacy attachment for content ID %@", (uint8_t *)&v2, 0xCu);
}

void __97__ICLegacyNoteUtilities_importLegacyNote_temporaryTextStorage_toNote_attachmentPreviewGenerator___block_invoke_2_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Could not find a content ID string for CID URL %@", buf, 0xCu);
}

@end