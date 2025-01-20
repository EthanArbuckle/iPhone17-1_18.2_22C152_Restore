@interface ICAttachment(InlineAttachmentManagement_UI)
- (id)inlineAttachmentFromObject:()InlineAttachmentManagement_UI createIfNecessary:;
- (id)inlineAttachmentWithICTTAttachment:()InlineAttachmentManagement_UI;
- (void)filterInlineAttachmentsInTableColumnTextStorage:()InlineAttachmentManagement_UI range:;
@end

@implementation ICAttachment(InlineAttachmentManagement_UI)

- (void)filterInlineAttachmentsInTableColumnTextStorage:()InlineAttachmentManagement_UI range:
{
  id v8 = a3;
  [v8 beginSkippingTimestampUpdates];
  uint64_t v9 = *MEMORY[0x1E4FB06B8];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  v13 = __101__ICAttachment_InlineAttachmentManagement_UI__filterInlineAttachmentsInTableColumnTextStorage_range___block_invoke;
  v14 = &unk_1E5FDA998;
  uint64_t v15 = a1;
  id v16 = v8;
  id v10 = v8;
  objc_msgSend(v10, "enumerateAttribute:inRange:options:usingBlock:", v9, a4, a5, 0, &v11);
  objc_msgSend(v10, "endSkippingTimestampUpdates", v11, v12, v13, v14, v15);
}

- (id)inlineAttachmentFromObject:()InlineAttachmentManagement_UI createIfNecessary:
{
  id v6 = a3;
  if (![(id)objc_opt_class() isInlineAttachment:v6])
  {
    v7 = 0;
    goto LABEL_23;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([v6 attachment], (v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ([v6 conformsToProtocol:&unk_1F09A5DB0])
    {
      v7 = [a1 inlineAttachmentWithICTTAttachment:v6];
      if (v7) {
        goto LABEL_21;
      }
    }
    else
    {
      v7 = 0;
    }
    if (a4)
    {
      id v8 = v6;
      uint64_t v9 = os_log_create("com.apple.notes", "Cloud");
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[ICAttachment(InlineAttachmentManagement_UI) inlineAttachmentFromObject:createIfNecessary:]((uint64_t)v8, a1, v9);
      }

      id v10 = [v8 attachmentIdentifier];
      if ([v10 length])
      {
        v7 = [a1 addInlineAttachmentWithIdentifier:v10];
        [v7 setNeedsInitialFetchFromCloud:1];
        uint64_t v11 = [v8 attachmentUTI];
        [v7 setTypeUTI:v11];

        uint64_t v12 = [v7 typeUTI];

        if (!v12)
        {
          v13 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[ICAttachment(InlineAttachmentManagement_UI) inlineAttachmentFromObject:createIfNecessary:]((uint64_t)v8, a1);
          }

          [v7 setTypeUTI:*MEMORY[0x1E4F83180]];
        }
      }
      else
      {
        v14 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
          -[ICAttachment(InlineAttachmentManagement_UI) inlineAttachmentFromObject:createIfNecessary:]((uint64_t)v8, a1);
        }

        v7 = 0;
      }
    }
LABEL_21:
    if (!v7) {
      goto LABEL_23;
    }
  }
  [v7 setParentAttachment:a1];
  [a1 addInlineAttachmentsObject:v7];
  uint64_t v15 = [a1 note];
  [v7 setNote:v15];

  id v16 = [a1 note];
  [v16 addInlineAttachmentsObject:v7];

LABEL_23:
  return v7;
}

- (id)inlineAttachmentWithICTTAttachment:()InlineAttachmentManagement_UI
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v4 = [a3 attachmentIdentifier];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = objc_msgSend(a1, "inlineAttachments", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v18;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v18 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
      uint64_t v11 = [v10 identifier];
      char v12 = [v11 isEqualToString:v4];

      if (v12) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v13 = v10;

    if (v13) {
      goto LABEL_12;
    }
  }
  else
  {
LABEL_9:
  }
  v14 = (void *)MEMORY[0x1E4F833A0];
  uint64_t v15 = [a1 managedObjectContext];
  id v13 = [v14 attachmentWithIdentifier:v4 context:v15];

LABEL_12:
  return v13;
}

- (void)inlineAttachmentFromObject:()InlineAttachmentManagement_UI createIfNecessary:.cold.1(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v3, v4, "Found an inline attachment (%@) in text of note (%@) that doesn't have an identifier", v5, v6, v7, v8, v9);
}

- (void)inlineAttachmentFromObject:()InlineAttachmentManagement_UI createIfNecessary:.cold.2(uint64_t a1, void *a2)
{
  v2 = [a2 identifier];
  OUTLINED_FUNCTION_0_6();
  OUTLINED_FUNCTION_3(&dword_1B08EB000, v3, v4, "Found an inline attachment (%@) in text of attachment (%@) that doesn't have a typeUTI", v5, v6, v7, v8, v9);
}

- (void)inlineAttachmentFromObject:()InlineAttachmentManagement_UI createIfNecessary:.cold.3(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a2 identifier];
  OUTLINED_FUNCTION_0_6();
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "Trying to get an inline attachment (%@) that we haven't downloaded yet for an attachment (%@). Creating a temporary one.", v5, 0x16u);
}

@end