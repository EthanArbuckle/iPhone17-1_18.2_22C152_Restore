@interface ICAttachmentModel(UI)
+ (id)fileIconForURL:()UI withPreferredSize:uti:;
+ (uint64_t)fileIconForURL:()UI withPreferredSize:;
- (id)activityItems;
- (id)fileIconWithPreferredSize:()UI;
- (id)genericBrickThumbnailCreator;
- (id)genericListThumbnailCreator;
- (id)quicklookPreviewItems;
@end

@implementation ICAttachmentModel(UI)

- (id)genericListThumbnailCreator
{
  if ([a1 hasThumbnailImage]) {
    v1 = &__block_literal_global_30;
  }
  else {
    v1 = 0;
  }
  v2 = _Block_copy(v1);
  return v2;
}

- (id)genericBrickThumbnailCreator
{
  if ([a1 hasThumbnailImage]) {
    v1 = &__block_literal_global_12_0;
  }
  else {
    v1 = 0;
  }
  v2 = _Block_copy(v1);
  return v2;
}

+ (uint64_t)fileIconForURL:()UI withPreferredSize:
{
  return objc_msgSend(a1, "fileIconForURL:withPreferredSize:uti:", a3, 0);
}

+ (id)fileIconForURL:()UI withPreferredSize:uti:
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  if (a5)
  {
    v10 = [MEMORY[0x1E4F42980] interactionControllerWithURL:a5];
    v11 = v10;
    if (v9) {
      [v10 setUTI:v9];
    }
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    v12 = objc_msgSend(v11, "icons", 0);
    uint64_t v13 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v26;
LABEL_6:
      uint64_t v16 = 0;
      while (1)
      {
        if (*(void *)v26 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
        [v17 size];
        if (v18 == a1)
        {
          [v17 size];
          if (v19 <= a2) {
            break;
          }
        }
        [v17 size];
        if (v20 <= a1)
        {
          [v17 size];
          if (v21 == a2) {
            break;
          }
        }
        if (v14 == ++v16)
        {
          uint64_t v14 = [v12 countByEnumeratingWithState:&v25 objects:v29 count:16];
          if (v14) {
            goto LABEL_6;
          }
          goto LABEL_15;
        }
      }
      id v22 = v17;

      if (v22) {
        goto LABEL_18;
      }
    }
    else
    {
LABEL_15:
    }
    v23 = [v11 icons];
    id v22 = [v23 lastObject];

LABEL_18:
  }
  else
  {
    id v22 = 0;
  }

  return v22;
}

- (id)quicklookPreviewItems
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v1 = [a1 attachment];
  v4[0] = v1;
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

- (id)activityItems
{
  v21[1] = *MEMORY[0x1E4F143B8];
  v2 = [a1 attachment];
  v3 = [v2 media];
  v4 = [v3 mediaURL];

  v5 = [a1 attachment];
  v6 = v5;
  if (v4)
  {
    v7 = [v5 attachmentModel];
    v8 = [a1 attachment];
    id v9 = [v8 media];
    v10 = [v9 mediaURL];
    v11 = [v7 generateHardLinkURLIfNecessaryForURL:v10];

    if (v11)
    {
      v21[0] = v11;
      v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((url) != nil)", "-[ICAttachmentModel(UI) activityItems]", 1, 0, @"Expected non-nil value for '%s'", "url");
      v12 = (void *)MEMORY[0x1E4F1CBF0];
    }
    goto LABEL_7;
  }
  uint64_t v13 = [v5 URL];

  if (v13)
  {
    v11 = [a1 attachment];
    uint64_t v14 = [v11 URL];
    double v20 = v14;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];

LABEL_7:
    goto LABEL_8;
  }
  v12 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_8:
  uint64_t v15 = [ICAttachmentActivityItemSource alloc];
  uint64_t v16 = [a1 attachment];
  v17 = [(ICAttachmentActivityItemSource *)v15 initWithAttachment:v16];
  double v18 = [v12 arrayByAddingObject:v17];

  return v18;
}

- (id)fileIconWithPreferredSize:()UI
{
  v6 = objc_opt_class();
  v7 = [a1 attachment];
  v8 = [v7 media];
  id v9 = [v8 mediaURL];
  v10 = objc_msgSend(v6, "fileIconForURL:withPreferredSize:", v9, a2, a3);

  return v10;
}

@end