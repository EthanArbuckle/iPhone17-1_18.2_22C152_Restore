@interface ICAttachmentSystemPaperModel
@end

@implementation ICAttachmentSystemPaperModel

void __56__ICAttachmentSystemPaperModel_UI__imageForActivityItem__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) attachment];
  uint64_t v2 = [v5 fallbackImageData];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __54__ICAttachmentSystemPaperModel_UI__drawPreviewInRect___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 note];
  +[ICPaperStyle drawPaperStyleType:inRect:](ICPaperStyle, "drawPaperStyleType:inRect:", (int)[v3 paperStyleType], *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  v4 = os_log_create("com.apple.notes", "SystemPaper");
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  v6 = v4;
  v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "DrawPreviewInRect", "", buf, 2u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 40), "drawPaperInRect:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
  v8 = v7;
  v9 = v8;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v9, OS_SIGNPOST_INTERVAL_END, v5, "DrawPreviewInRect", "", v10, 2u);
  }
}

uint64_t __108__ICAttachmentSystemPaperModel_PreviewGeneration__generateImageForAttachment_fullResolution_appearanceInfo___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "imageWithFullResolution:inverted:", *(unsigned __int8 *)(a1 + 56), objc_msgSend(*(id *)(a1 + 40), "isDark"));
  return MEMORY[0x1F41817F8]();
}

void __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) attachmentModel];
  v40 = ICCheckedDynamicCast();

  if (*(void *)(a1 + 40))
  {
    uint64_t v3 = +[ICSystemPaperImageGenerator imageGeneratorWithPaperAttachment:*(void *)(a1 + 32)];
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__37;
    v74 = __Block_byref_object_dispose__37;
    id v75 = 0;
    v4 = [*(id *)(a1 + 32) previewImages];
    os_signpost_id_t v5 = (void *)[v4 mutableCopy];

    uint64_t v64 = 0;
    v65 = &v64;
    uint64_t v66 = 0x3032000000;
    v67 = __Block_byref_object_copy__37;
    v68 = __Block_byref_object_dispose__37;
    id v69 = objc_alloc_init(MEMORY[0x1E4F83788]);
    v6 = (void *)MEMORY[0x1E4F83298];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2;
    v57[3] = &unk_1E5FDB9B8;
    id v58 = *(id *)(a1 + 32);
    id v7 = v3;
    uint64_t v8 = *(void *)(a1 + 56);
    id v39 = v7;
    id v59 = v7;
    uint64_t v63 = v8;
    id v60 = v40;
    v61 = &v70;
    v62 = &v64;
    [v6 enumerateAppearanceTypesUsingBlock:v57];
    v9 = +[ICPreviewDeviceContext sharedContext];
    v43 = [v9 deviceInfoScalable:1];

    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    v10 = [(id)v65[5] allKeys];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v53 objects:v78 count:16];
    char v12 = 0;
    if (v11)
    {
      obuint64_t j = v10;
      uint64_t v42 = *(void *)v54;
      do
      {
        uint64_t v44 = v11;
        for (uint64_t i = 0; i != v44; ++i)
        {
          if (*(void *)v54 != v42) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v53 + 1) + 8 * i);
          uint64_t v15 = [v14 type];
          v16 = [(id)v65[5] objectForKey:v14];
          if (!v16) {
            objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((generatedPreviewImage) != nil)", "+[ICAttachmentSystemPaperModel(PreviewGeneration) generatePreviewsForAttachment:paperIdentifier:]_block_invoke", 1, 0, @"Expected non-nil value for '%s'", "generatedPreviewImage");
          }
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v17 = v43;
          uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v77 count:16];
          if (v18)
          {
            uint64_t v19 = *(void *)v50;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v50 != v19) {
                  objc_enumerationMutation(v17);
                }
                v21 = *(void **)(a1 + 32);
                [*(id *)(*((void *)&v49 + 1) + 8 * j) scale];
                v22 = objc_msgSend(v21, "updateAttachmentPreviewImageWithImage:scale:appearanceType:scaleWhenDrawing:metadata:sendNotification:", v16, v15, 1, 0, 0);
                objc_msgSend(v5, "ic_removeNonNilObject:", v22);
              }
              uint64_t v18 = [v17 countByEnumeratingWithState:&v49 objects:v77 count:16];
            }
            while (v18);
            char v12 = 1;
          }
        }
        v10 = obj;
        uint64_t v11 = [obj countByEnumeratingWithState:&v53 objects:v78 count:16];
      }
      while (v11);
    }

    v23 = (void *)v71[5];
    if (v23)
    {
      v24 = *(void **)(a1 + 32);
      v25 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
      v26 = objc_msgSend(v23, "ic_imageDataWithUTType:", v25);
      [v24 writeFallbackImageData:v26];
    }
    if ([v5 count])
    {
      [*(id *)(a1 + 32) removePreviewImages:v5];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v27 = v5;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v76 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v46;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v46 != v29) {
              objc_enumerationMutation(v27);
            }
            uint64_t v31 = *(void *)(*((void *)&v45 + 1) + 8 * k);
            v32 = [*(id *)(a1 + 32) managedObjectContext];
            [v32 deleteObject:v31];
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v45 objects:v76 count:16];
        }
        while (v28);
      }
    }
    if (v12)
    {
      v33 = [MEMORY[0x1E4F1C9C8] date];
      [*(id *)(a1 + 32) setPreviewUpdateDate:v33];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }

    _Block_object_dispose(&v64, 8);
    _Block_object_dispose(&v70, 8);
  }
  else
  {
    v34 = [*(id *)(a1 + 56) generateEmptyImage];
    [v34 size];
    objc_msgSend(*(id *)(a1 + 32), "setSizeWidth:");
    [v34 size];
    [*(id *)(a1 + 32) setSizeHeight:v35];
    v36 = *(void **)(a1 + 32);
    v37 = [MEMORY[0x1E4F832A0] fallbackImageUTI];
    v38 = objc_msgSend(v34, "ic_imageDataWithUTType:", v37);
    [v36 writeFallbackImageData:v38];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

void __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  v4 = [MEMORY[0x1E4F83298] appearanceInfoWithType:a2];
  uint64_t v41 = 0;
  uint64_t v42 = &v41;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__37;
  long long v45 = __Block_byref_object_dispose__37;
  id v46 = 0;
  os_signpost_id_t v5 = os_log_create("com.apple.notes", "SystemPaper");
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PreviewGeneration", "", buf, 2u);
  }

  v9 = os_log_create("com.apple.notes", "SystemPaper");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = [*(id *)(a1 + 32) identifier];
    __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2_cold_2(v10, v53, v9);
  }

  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_18;
  v37[3] = &unk_1E5FD9870;
  v40 = &v41;
  id v38 = *(id *)(a1 + 40);
  id v11 = v4;
  id v39 = v11;
  [v11 performAsDefaultAppearance:v37];
  [*(id *)(a1 + 40) paperContentBounds];
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  uint64_t v20 = [*(id *)(a1 + 40) hasDeepLink];
  v21 = v8;
  v22 = v21;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1B08EB000, v22, OS_SIGNPOST_INTERVAL_END, v6, "PreviewGeneration", "", buf, 2u);
  }

  uint64_t v23 = v42[5];
  os_log_t v24 = os_log_create("com.apple.notes", "SystemPaper");
  v25 = v24;
  if (v23)
  {
    v26 = v24;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      v33 = [*(id *)(a1 + 32) shortLoggingDescription];
      [(id)v42[5] size];
      uint64_t v35 = v34;
      [(id)v42[5] size];
      *(_DWORD *)buf = 138412802;
      long long v48 = v33;
      __int16 v49 = 2048;
      uint64_t v50 = v35;
      __int16 v51 = 2048;
      uint64_t v52 = v36;
      _os_log_debug_impl(&dword_1B08EB000, v26, OS_LOG_TYPE_DEBUG, "Generated paper sketch image: %@ => %g %g", buf, 0x20u);
    }
    v25 = objc_msgSend(*(id *)(a1 + 72), "previewImageForAttachment:fullImage:scale:appearanceInfo:", *(void *)(a1 + 32), objc_msgSend((id)v42[5], "ic_CGImage"), v11, 2.0);
    [(id)v42[5] size];
    objc_msgSend(*(id *)(a1 + 32), "setSizeWidth:");
    [(id)v42[5] size];
    [*(id *)(a1 + 32) setSizeHeight:v27];
    objc_msgSend(*(id *)(a1 + 48), "setPaperContentBoundsHint:", v13, v15, v17, v19);
    [*(id *)(a1 + 48) setHasDeepLink:v20];
    if (!a2)
    {
      uint64_t v28 = +[ICAttachmentPreviewImageLoader orientedImage:v42[5] withBackground:1];
      uint64_t v29 = *(void *)(*(void *)(a1 + 56) + 8);
      v30 = *(void **)(v29 + 40);
      *(void *)(v29 + 40) = v28;
    }
    if (v25)
    {
      uint64_t v31 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) objectForKey:v11];
      BOOL v32 = v31 == 0;

      if (!v32) {
        [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"[appearancesToPreviewImages objectForKey:appearanceInfo] == ((void *)0)" functionName:"+[ICAttachmentSystemPaperModel(PreviewGeneration) generatePreviewsForAttachment:paperIdentifier:]_block_invoke" simulateCrash:1 showAlert:0 format:@"Didn't expect to generate multiple images for the same ICAppearance."];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) setObject:v25 forUncopiedKey:v11];
    }
  }
  else if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2_cold_1(v25);
  }

  _Block_object_dispose(&v41, 8);
}

uint64_t __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_18(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "imageWithFullResolution:inverted:", 0, objc_msgSend(*(id *)(a1 + 40), "isDark"));
  return MEMORY[0x1F41817F8]();
}

uint64_t __79__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsInOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) attachment];
  uint64_t v3 = [v2 identifier];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  os_signpost_id_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) paperBundleURL];
  return MEMORY[0x1F41817F8]();
}

void __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B08EB000, log, OS_LOG_TYPE_ERROR, "Failed to generate paper attachment preview", v1, 2u);
}

void __97__ICAttachmentSystemPaperModel_PreviewGeneration__generatePreviewsForAttachment_paperIdentifier___block_invoke_2_cold_2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Starting to generate System Paper image for attachment %@", buf, 0xCu);
}

@end