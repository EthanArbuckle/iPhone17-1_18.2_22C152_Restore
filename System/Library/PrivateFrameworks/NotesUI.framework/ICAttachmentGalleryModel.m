@interface ICAttachmentGalleryModel
@end

@implementation ICAttachmentGalleryModel

void __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) needToGeneratePreviews])
  {
    id v15 = [*(id *)(a1 + 32) firstSubAttachment];
    v2 = objc_msgSend(v15, "attachmentPreviewImageWithMinSize:scale:", *(double *)(a1 + 64), *(double *)(a1 + 64), 1.0);
    uint64_t v3 = [v2 orientedImage];
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      v6 = [*(id *)(a1 + 32) attachment];
      v7 = [v6 previewImages];
      uint64_t v8 = [v7 mutableCopy];
      uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
      v10 = *(void **)(v9 + 40);
      *(void *)(v9 + 40) = v8;

      v11 = [*(id *)(a1 + 32) attachment];
      uint64_t v12 = [v11 identifier];
      uint64_t v13 = *(void *)(*(void *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
  }
}

void __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_14(id *a1)
{
  double v2 = (double)[a1[5] unsignedIntValue];
  uint64_t v3 = [a1[4] attachment];
  [v3 setSizeWidth:v2];

  double v4 = (double)[a1[6] unsignedIntValue];
  id v5 = [a1[4] attachment];
  [v5 setSizeHeight:v4];
}

void __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = *(void *)(a1 + 56);
  double v4 = *(double *)(a1 + 64);
  [*(id *)(a1 + 40) scale];
  id v7 = [v2 updateAttachmentPreviewImageWithImageSrc:v3 maxDimension:0 scale:1 appearanceType:0 scaleWhenDrawing:0 metadata:v4 sendNotification:v5];

  v6 = v7;
  if (v7)
  {
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) removeObject:v7];
    v6 = v7;
  }
}

void __75__ICAttachmentGalleryModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_3(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) count])
  {
    double v2 = [*(id *)(a1 + 32) attachment];
    [v2 removePreviewImages:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v15;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v15 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
          uint64_t v9 = objc_msgSend(*(id *)(a1 + 32), "attachment", (void)v14);
          v10 = [v9 managedObjectContext];
          [v10 deleteObject:v8];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v5);
    }
  }
  v11 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", (void)v14);
  uint64_t v12 = [*(id *)(a1 + 32) attachment];
  [v12 setPreviewUpdateDate:v11];

  uint64_t v13 = [*(id *)(a1 + 32) attachment];
  [v13 updateChangeCountWithReason:@"Generated gallery previews"];
}

void __53__ICAttachmentGalleryModel_UI__quicklookPreviewItems__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 supportsQuickLook]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v3];
  }
}

void __50__ICAttachmentGalleryModel_UI__drawPreviewInRect___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  uint64_t v7 = [a2 image];
  if (v7)
  {
    id v14 = v7;
    [v7 size];
    uint64_t v7 = v14;
    if (v8 > 0.0)
    {
      [v14 size];
      uint64_t v7 = v14;
      if (v9 > 0.0)
      {
        [v14 size];
        double v11 = v10;
        [v14 size];
        double v13 = *(double *)(a1 + 40) * (v11 / v12);
        objc_msgSend(v14, "drawInRect:", *(double *)(a1 + 48) + *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24), *(double *)(a1 + 56) + 24.0 + *(double *)(a1 + 104), v13);
        uint64_t v7 = v14;
        *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v13
                                                                    + 12.0
                                                                    + *(double *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                + 24);
      }
    }
  }
  if (*(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) > *(double *)(a1 + 64)) {
    *a5 = 1;
  }
}

@end