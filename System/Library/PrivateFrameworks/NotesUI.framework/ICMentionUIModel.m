@interface ICMentionUIModel
- (BOOL)fadesColorDuringHighlight;
- (id)labelColor;
@end

@implementation ICMentionUIModel

- (id)labelColor
{
  v3 = [(ICInlineAttachmentUIModel *)self attachment];
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v4 = [v3 managedObjectContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __30__ICMentionUIModel_labelColor__block_invoke;
  v19[3] = &unk_1E5FD91F8;
  v21 = &v22;
  id v5 = v3;
  id v20 = v5;
  [v4 performBlockAndWait:v19];

  if (v5 && !*((unsigned char *)v23 + 24))
  {
    uint64_t v12 = 0;
    v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__56;
    v16 = __Block_byref_object_dispose__56;
    id v17 = [MEMORY[0x1E4FB1618] ICUnknownInlineAttachmentTextColor];
    v7 = [v5 managedObjectContext];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __30__ICMentionUIModel_labelColor__block_invoke_8;
    v9[3] = &unk_1E5FDB2D0;
    id v10 = v5;
    v11 = &v12;
    [v7 performBlockAndWait:v9];

    id v6 = (id)v13[5];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)ICMentionUIModel;
    id v6 = [(ICInlineAttachmentUIModel *)&v18 labelColor];
  }

  _Block_object_dispose(&v22, 8);
  return v6;
}

uint64_t __30__ICMentionUIModel_labelColor__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isUnsupported];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __30__ICMentionUIModel_labelColor__block_invoke_8(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) tokenContentIdentifier];
  v3 = objc_msgSend(v2, "ic_tokenSafeText");
  v4 = [MEMORY[0x1E4F83410] allUserRecordName];
  int v5 = [v3 isEqualToString:v4];

  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4FB1618] tintColor];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    v9 = [*(id *)(a1 + 32) note];
    id v10 = [v9 serverShareCheckingParent];
    [v10 participants];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "ic_userRecordNameInNote:", v9, (void)v21);
          if ([v16 isEqualToString:v2])
          {
            id v17 = [v9 collaborationColorManager];
            uint64_t v18 = [v17 highlightColorForUserID:v2 note:v9];
            uint64_t v19 = *(void *)(*(void *)(a1 + 40) + 8);
            id v20 = *(void **)(v19 + 40);
            *(void *)(v19 + 40) = v18;

            goto LABEL_13;
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
}

- (BOOL)fadesColorDuringHighlight
{
  return 0;
}

@end