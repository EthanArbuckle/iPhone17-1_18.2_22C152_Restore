@interface ICGalleryTextAttachment(UI)
- (double)attachmentSizeForTextContainer:()UI;
- (id)attachmentViewClassForTextContainer:()UI;
- (id)supportedPresentationSizes;
@end

@implementation ICGalleryTextAttachment(UI)

- (double)attachmentSizeForTextContainer:()UI
{
  id v4 = a3;
  if ([a1 effectiveAttachmentViewSizeForTextContainer:v4] != 1)
  {
    [a1 availableWidthForTextContainer:v4];
    double v14 = v13;
    if (ICInternalSettingsIsTextKit2Enabled())
    {
      v15 = [v4 textLayoutManager];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v7 = [v4 textLayoutManager];
        objc_opt_class();
        v17 = [a1 viewIdentifier];
        v18 = [v7 existingAttachmentViewForIdentifier:v17];
        v10 = ICDynamicCast();

LABEL_12:
        v28 = [a1 attachment];
        +[ICGalleryAttachmentView sizeOfViewForAttachment:v28 textViewContentWidth:v10 existingView:v14];
        double v12 = v29;

        goto LABEL_13;
      }
    }
    else
    {
      v24 = [v4 layoutManager];
      objc_opt_class();
      char v25 = objc_opt_isKindOfClass();

      if (v25)
      {
        objc_opt_class();
        v26 = [v4 layoutManager];
        v7 = ICCheckedDynamicCast();

        objc_opt_class();
        v27 = [v7 viewForTextAttachmentNoCreate:a1];
        v10 = ICDynamicCast();

        goto LABEL_12;
      }
    }
    v31 = (void *)MEMORY[0x263F5B318];
    v7 = [a1 attachment];
    [v31 sizeOfViewForAttachment:v7 textViewContentWidth:v14];
    goto LABEL_16;
  }
  if (!ICInternalSettingsIsTextKit2Enabled())
  {
    v19 = [v4 layoutManager];
    objc_opt_class();
    char v20 = objc_opt_isKindOfClass();

    if (v20)
    {
      objc_opt_class();
      v21 = [v4 layoutManager];
      v22 = [a1 viewForLayoutManager:v21];
      v7 = ICCheckedDynamicCast();

      [v7 attachmentSizeForTextContainer:v4];
LABEL_16:
      double v12 = v23;
      goto LABEL_17;
    }
LABEL_14:
    v30 = (void *)MEMORY[0x263F5B220];
    v7 = [a1 attachment];
    [v30 sizeForAttachment:v7 usesSmallSize:1];
    goto LABEL_16;
  }
  v5 = [v4 textLayoutManager];
  objc_opt_class();
  char v6 = objc_opt_isKindOfClass();

  if ((v6 & 1) == 0) {
    goto LABEL_14;
  }
  v7 = [v4 textLayoutManager];
  objc_opt_class();
  v8 = [a1 viewIdentifier];
  v9 = [v7 existingAttachmentViewForIdentifier:v8];
  v10 = ICCheckedDynamicCast();

  [v10 attachmentSizeForTextContainer:v4];
  double v12 = v11;
LABEL_13:

LABEL_17:
  return v12;
}

- (id)attachmentViewClassForTextContainer:()UI
{
  objc_msgSend(a1, "effectiveAttachmentViewSizeForTextContainer:");
  id v1 = (id)objc_opt_class();

  return v1;
}

- (id)supportedPresentationSizes
{
  if (supportedPresentationSizes_onceToken[0] != -1) {
    dispatch_once(supportedPresentationSizes_onceToken, &__block_literal_global_32);
  }
  v0 = (void *)supportedPresentationSizes_supportedSizes;

  return v0;
}

@end