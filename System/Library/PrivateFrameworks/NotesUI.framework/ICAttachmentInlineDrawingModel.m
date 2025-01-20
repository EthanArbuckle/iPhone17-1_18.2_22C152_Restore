@interface ICAttachmentInlineDrawingModel
@end

@implementation ICAttachmentInlineDrawingModel

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 mergeableData];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  v6 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v11 = [*(id *)(a1 + 40) uuid];
    v12 = objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "ic_sha256");
    v13 = [*(id *)(a1 + 32) attachment];
    v14 = [v13 shortLoggingDescription];
    int v15 = 138412802;
    v16 = v11;
    __int16 v17 = 2112;
    v18 = v12;
    __int16 v19 = 2112;
    v20 = v14;
    _os_log_debug_impl(&dword_1B08EB000, v6, OS_LOG_TYPE_DEBUG, "Merging PencilKit drawing %@ into current data %@ for %@", (uint8_t *)&v15, 0x20u);
  }
  v7 = [*(id *)(a1 + 32) attachment];
  v8 = [v7 typeUTI];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F83060]];
  uint64_t v10 = 1;
  if (v9) {
    uint64_t v10 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v10;
}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_14(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) handwritingRecognitionDrawing];
  [v2 mergeWithDrawing:*(void *)(a1 + 40)];
}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_2(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_2_cold_1(a1);
  }

  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) attachment];
  [v4 setMergeableData:v3];

  v5 = [*(id *)(a1 + 32) attachment];
  [v5 setPreviewUpdateDate:0];

  v6 = [*(id *)(a1 + 32) attachment];
  id v7 = (id)objc_msgSend(v6, "ic_postNotificationOnMainThreadAfterSaveWithName:", *MEMORY[0x1E4F83030]);
}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_15(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v2 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = [*(id *)(a1 + 32) attachment];
    uint64_t v4 = [v3 shortLoggingDescription];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_1B08EB000, v2, OS_LOG_TYPE_DEFAULT, "Failed to merge PencilKit data into %@", (uint8_t *)&v5, 0xCu);
  }
}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_16(uint64_t a1)
{
  id v2 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_16_cold_1(a1);
  }
}

void __58__ICAttachmentInlineDrawingModel_UI__imageForActivityItem__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 fallbackImageData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 shortLoggingDescription];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_29(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) handwritingRecognitionDrawing];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_2;
  block[3] = &unk_1E5FD9220;
  uint64_t v7 = *(void *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_2(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F38E60]) initWithDrawing:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [*(id *)(a1 + 32) setTitleQuery:v2];

    uint64_t v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v3 titleQuery];
    [v4 setDelegate:v3];

    id v12 = [*(id *)(a1 + 32) titleQuery];
    [v12 start];
  }
  else
  {
    id v5 = os_log_create("com.apple.notes", "PencilKit");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_2_cold_1(a1, v5, v6, v7, v8, v9, v10, v11);
    }
  }
}

void __67__ICAttachmentInlineDrawingModel_UI__titleQuery_didUpdateWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F832A0], "ic_existingObjectWithID:context:", *(void *)(a1 + 32), v3);
  id v5 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __67__ICAttachmentInlineDrawingModel_UI__titleQuery_didUpdateWithItem___block_invoke_cold_1(v4);
  }

  [v4 setTitle:*(void *)(a1 + 40)];
  [v4 updateChangeCountWithReason:@"Updated title from query"];
  uint64_t v6 = [v4 note];
  int v7 = [v6 regenerateTitle:1 snippet:1];

  if (v7)
  {
    uint64_t v8 = [v4 note];
    [v8 markShareDirtyIfNeededWithReason:@"Updated title from query"];

    uint64_t v9 = [v4 note];
    [v9 updateChangeCountWithReason:@"Updated title from query"];
  }
  objc_msgSend(v3, "ic_save");
}

uint64_t __56__ICAttachmentInlineDrawingModel_UI__drawPreviewInRect___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) newDrawingFromMergeableData];
  return MEMORY[0x1F41817F8]();
}

void __122__ICAttachmentInlineDrawingModel_PreviewGeneration__generateImageForAttachment_fromDrawing_fullResolution_appearanceInfo___block_invoke(uint64_t a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2)
  {
    double v3 = safeCanvasBoundsForDrawing(v2);
    BOOL v7 = v5 == *MEMORY[0x1E4F1DB30];
    BOOL v8 = v6 == *(double *)(MEMORY[0x1E4F1DB30] + 8);
    if (v7 && v8)
    {
      double v6 = 100.0;
      double v5 = 100.0;
      double v9 = 0.0;
    }
    else
    {
      double v9 = v4;
    }
    if (v7 && v8) {
      double v10 = 0.0;
    }
    else {
      double v10 = v3;
    }
    if (v5 >= 1.0) {
      double v11 = v5;
    }
    else {
      double v11 = 1.0;
    }
    sdouble x = 1.0;
    if (v6 >= 1.0) {
      double v12 = v6;
    }
    else {
      double v12 = 1.0;
    }
    v51.origin.double x = v10;
    v51.origin.y = v9;
    v51.size.double width = v11;
    v51.size.double height = v12;
    CGRectGetMaxX(v51);
    v52.origin.double x = v10;
    v52.origin.y = v9;
    v52.size.double width = v11;
    v52.size.double height = v12;
    double v13 = ceil(CGRectGetHeight(v52));
    double v14 = 16384.0;
    if (!*(unsigned char *)(a1 + 56)) {
      double v14 = 1536.0;
    }
    if (v13 > v14)
    {
      sdouble x = v14 / v13;
      double v13 = ceil(v13 * (v14 / v13));
    }
    if (v12 <= 256.0) {
      double v15 = v12;
    }
    else {
      double v15 = 256.0;
    }
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F38E08]), "initWithSize:scale:", v11, v15, 2.0);
    objc_msgSend(v39, "setInvertColors:", objc_msgSend(*(id *)(a1 + 40), "type") == 1);
    double v41 = v13;
    uint64_t v16 = TSUCreateRGBABitmapContext();
    if (v16)
    {
      __int16 v17 = (CGContext *)v16;
      v53.origin.double x = v10;
      v53.origin.y = v9;
      v53.size.double width = v11;
      v53.size.double height = v12;
      if (v9 < CGRectGetMaxY(v53))
      {
        CGFloat v37 = v12;
        double v18 = v9;
        do
        {
          __int16 v19 = (void *)MEMORY[0x1B3E9ED80]();
          v20 = os_log_create("com.apple.notes", "PencilKit");
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            v58.origin.double x = v10;
            v58.origin.y = v18;
            v58.size.double width = v11;
            v58.size.double height = v15;
            v31 = NSStringFromCGRect(v58);
            v59.origin.double x = v10;
            v59.origin.y = v9;
            v59.size.double width = v11;
            v59.size.double height = v12;
            v32 = NSStringFromCGRect(v59);
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v31;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v32;
            _os_log_debug_impl(&dword_1B08EB000, v20, OS_LOG_TYPE_DEBUG, "Rendering inline sketch tile: %@, %@", buf, 0x16u);
          }
          dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v47 = __Block_byref_object_copy__80;
          v48 = __Block_byref_object_dispose__80;
          id v49 = 0;
          uint64_t v22 = *(void *)(a1 + 32);
          v43[0] = MEMORY[0x1E4F143A8];
          v43[1] = 3221225472;
          v43[2] = __122__ICAttachmentInlineDrawingModel_PreviewGeneration__generateImageForAttachment_fromDrawing_fullResolution_appearanceInfo___block_invoke_18;
          v43[3] = &unk_1E5FD9610;
          v45 = buf;
          v23 = v21;
          v44 = v23;
          objc_msgSend(v39, "renderDrawing:clippedToStrokeSpaceRect:scale:completion:", v22, v43, v10, v18, v11, v15, 1.0);
          CGFloat v24 = v11;
          dispatch_semaphore_wait(v23, 0xFFFFFFFFFFFFFFFFLL);
          double v25 = v9;
          double v40 = v18;
          CGAffineTransformMakeScale(&v42, sx, sx);
          double v26 = v10;
          v54.origin.double x = v10;
          v54.origin.y = v18 - v9;
          v54.size.double width = v24;
          v54.size.double height = v15;
          CGRect v55 = CGRectApplyAffineTransform(v54, &v42);
          double x = v55.origin.x;
          double width = v55.size.width;
          double height = v55.size.height;
          v30 = (CGImage *)objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "ic_CGImage");
          v56.size.double height = ceil(height);
          v56.size.double width = ceil(width);
          v56.origin.double x = floor(x);
          double v41 = v41 - v56.size.height;
          v56.origin.y = v41 + 1.0;
          CGContextDrawImage(v17, v56, v30);

          double v9 = v25;
          double v12 = v37;
          double v10 = v26;
          double v11 = v24;
          _Block_object_dispose(buf, 8);

          v57.origin.double x = v10;
          v57.origin.y = v9;
          v57.size.double width = v24;
          v57.size.double height = v37;
          double v18 = v40 + 256.0;
        }
        while (v40 + 256.0 < CGRectGetMaxY(v57));
      }
      CGImageRef Image = CGBitmapContextCreateImage(v17);
      if (Image)
      {
        uint64_t v34 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithCGImage:", Image);
        uint64_t v35 = *(void *)(*(void *)(a1 + 48) + 8);
        v36 = *(void **)(v35 + 40);
        *(void *)(v35 + 40) = v34;

        CFRelease(Image);
      }
      CGContextRelease(v17);
    }
  }
}

void __122__ICAttachmentInlineDrawingModel_PreviewGeneration__generateImageForAttachment_fromDrawing_fullResolution_appearanceInfo___block_invoke_18(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    uint64_t v41 = 0;
    CGAffineTransform v42 = &v41;
    uint64_t v43 = 0x3032000000;
    v44 = __Block_byref_object_copy__80;
    v45 = __Block_byref_object_dispose__80;
    id v46 = 0;
    uint64_t v35 = 0;
    v36 = &v35;
    uint64_t v37 = 0x3032000000;
    v38 = __Block_byref_object_copy__80;
    v39 = __Block_byref_object_dispose__80;
    uint64_t v2 = [*(id *)(a1 + 40) previewImages];
    id v40 = (id)[v2 mutableCopy];

    double v3 = (void *)MEMORY[0x1E4F83298];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke_2;
    v29[3] = &unk_1E5FDE5E0;
    id v4 = *(void **)(a1 + 40);
    uint64_t v34 = *(void *)(a1 + 48);
    id v30 = v4;
    id v31 = *(id *)(a1 + 32);
    v32 = &v41;
    v33 = &v35;
    [v3 enumerateAppearanceTypesUsingBlock:v29];
    double v5 = (void *)v42[5];
    if (v5)
    {
      double v6 = *(void **)(a1 + 40);
      BOOL v7 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
      BOOL v8 = objc_msgSend(v5, "ic_imageDataWithUTType:", v7);
      [v6 writeFallbackImageData:v8];
    }
    if ([(id)v36[5] count])
    {
      [*(id *)(a1 + 40) removePreviewImages:v36[5]];
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      id v9 = (id)v36[5];
      uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v47 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v26;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v26 != v11) {
              objc_enumerationMutation(v9);
            }
            uint64_t v13 = *(void *)(*((void *)&v25 + 1) + 8 * i);
            double v14 = objc_msgSend(*(id *)(a1 + 40), "managedObjectContext", (void)v25);
            [v14 deleteObject:v13];
          }
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v47 count:16];
        }
        while (v10);
      }
    }
    double v15 = objc_msgSend(MEMORY[0x1E4F1C9C8], "date", (void)v25);
    [*(id *)(a1 + 40) setPreviewUpdateDate:v15];

    [*(id *)(a1 + 40) updateChangeCountWithReason:@"Generated previews from drawing"];
    _Block_object_dispose(&v35, 8);

    _Block_object_dispose(&v41, 8);
  }
  else
  {
    uint64_t v16 = (CGContext *)TSUCreateRGBABitmapContext();
    if (v16)
    {
      __int16 v17 = v16;
      CGImageRef Image = CGBitmapContextCreateImage(v16);
      if (Image)
      {
        CGImageRef v19 = Image;
        v20 = objc_msgSend(MEMORY[0x1E4FB1818], "ic_imageWithCGImage:", Image);
        CFRelease(v19);
        if ([*(id *)(a1 + 40) attachmentType] == 10)
        {
          [v20 size];
          objc_msgSend(*(id *)(a1 + 40), "setSizeWidth:");
          [v20 size];
          [*(id *)(a1 + 40) setSizeHeight:v21];
        }
        uint64_t v22 = *(void **)(a1 + 40);
        v23 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
        CGFloat v24 = objc_msgSend(v20, "ic_imageDataWithUTType:", v23);
        [v22 writeFallbackImageData:v24];

        [*(id *)(a1 + 40) updateChangeCountWithReason:@"Generated previews from drawing"];
      }
      CGContextRelease(v17);
    }
  }
}

void __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = [MEMORY[0x1E4F83298] appearanceInfoWithType:a2];
  double v5 = (id *)(a1 + 32);
  double v6 = [*(id *)(a1 + 64) generateImageForAttachment:*(void *)(a1 + 32) fromDrawing:*(void *)(a1 + 40) fullResolution:0 appearanceInfo:v4];
  if ([*(id *)(a1 + 32) attachmentType] == 10)
  {
    objc_msgSend(*(id *)(a1 + 64), "previewImageFromDrawing:fullImage:scale:", *(void *)(a1 + 40), objc_msgSend(v6, "ic_CGImage"), 2.0);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v7 = v6;
  }
  BOOL v8 = v7;
  id v9 = os_log_create("com.apple.notes", "PencilKit");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke_2_cold_1((id *)(a1 + 32), v6, v9);
  }

  if (v6)
  {
    if ([*v5 attachmentType] == 10)
    {
      [v6 size];
      objc_msgSend(*v5, "setSizeWidth:");
      [v6 size];
      [*v5 setSizeHeight:v10];
      if (v2)
      {
LABEL_9:
        if (!v8) {
          goto LABEL_27;
        }
LABEL_13:
        double v14 = +[ICPreviewDeviceContext sharedContext];
        double v15 = [v14 deviceInfoScalable:1];

        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id obj = v15;
        uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v36;
          uint64_t v33 = *(void *)v36;
          do
          {
            uint64_t v19 = 0;
            do
            {
              if (*(void *)v36 != v18) {
                objc_enumerationMutation(obj);
              }
              id v20 = *v5;
              [*(id *)(*((void *)&v35 + 1) + 8 * v19) scale];
              double v21 = objc_msgSend(v20, "updateAttachmentPreviewImageWithImage:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v8, v2, 1, 0, 0);
              if (v21)
              {
                [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) removeObject:v21];
                if ([*(id *)(a1 + 32) attachmentType] == 9)
                {
                  objc_msgSend(v21, "setVersion:", (__int16)objc_msgSend((id)objc_opt_class(), "drawingPreviewVersion"));
                  uint64_t v22 = [*(id *)(a1 + 32) drawingModel];
                  v23 = [v22 drawingDocument];
                  uint64_t v24 = a1;
                  long long v25 = v8;
                  long long v26 = v5;
                  uint64_t v27 = v2;
                  unsigned int v28 = [v23 maxDocumentVersion];
                  BOOL v29 = v28 > [MEMORY[0x1E4F83370] serializationVersion];
                  uint64_t v2 = v27;
                  double v5 = v26;
                  BOOL v8 = v25;
                  a1 = v24;
                  uint64_t v30 = v29;
                  [v21 setVersionOutOfDate:v30];

                  uint64_t v18 = v33;
                }
              }

              ++v19;
            }
            while (v17 != v19);
            uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
          }
          while (v17);
        }

        double v6 = v31;
        id v4 = v32;
        goto LABEL_27;
      }
    }
    else if (v2)
    {
      goto LABEL_9;
    }
    uint64_t v11 = +[ICAttachmentPreviewImageLoader orientedImage:v6 withBackground:1];
    uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    if (!v8) {
      goto LABEL_27;
    }
    goto LABEL_13;
  }
LABEL_27:
}

uint64_t __81__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) newDrawingFromMergeableData];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;
  return MEMORY[0x1F41817F8](v2);
}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_2_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v3, v4, "Merged PencilKit data changes into %@", v5, v6, v7, v8, v9);
}

void __63__ICAttachmentInlineDrawingModel_UI__actuallyMergeWithDrawing___block_invoke_16_cold_1(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v3, v4, "No changes to PencilKit data for %@", v5, v6, v7, v8, v9);
}

void __59__ICAttachmentInlineDrawingModel_UI__setTitleQueryEnabled___block_invoke_2_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __67__ICAttachmentInlineDrawingModel_UI__titleQuery_didUpdateWithItem___block_invoke_cold_1(void *a1)
{
  v1 = [a1 shortLoggingDescription];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_3(&dword_1B08EB000, v2, v3, "Title query updated title for %@", v4, v5, v6, v7, v8);
}

void __95__ICAttachmentInlineDrawingModel_PreviewGeneration__generatePreviewsForAttachment_fromDrawing___block_invoke_2_cold_1(id *a1, void *a2, NSObject *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*a1 shortLoggingDescription];
  [a2 size];
  uint64_t v7 = v6;
  [a2 size];
  int v9 = 138412802;
  double v10 = v5;
  __int16 v11 = 2048;
  uint64_t v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "Generated inline sketch image: %@ => %g %g", (uint8_t *)&v9, 0x20u);
}

@end