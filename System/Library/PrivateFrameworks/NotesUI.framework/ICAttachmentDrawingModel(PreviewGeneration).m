@interface ICAttachmentDrawingModel(PreviewGeneration)
- (BOOL)needToGeneratePreviews;
- (uint64_t)generatePreviewsDuringCloudActivity;
- (uint64_t)generatePreviewsInOperation:()PreviewGeneration;
- (void)needToGeneratePreviews;
@end

@implementation ICAttachmentDrawingModel(PreviewGeneration)

- (uint64_t)generatePreviewsDuringCloudActivity
{
  return 0;
}

- (BOOL)needToGeneratePreviews
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v4 = [a1 attachment];
  v5 = [v4 mergeableData];

  if (v5)
  {
    v6 = [a1 attachment];
    v7 = [v6 previewUpdateDate];

    if (v7)
    {
      v8 = [a1 attachment];
      [MEMORY[0x1E4F83368] defaultPixelSize];
      v9 = objc_msgSend(v8, "attachmentPreviewImageWithMinSize:scale:");

      if (v9
        && [v9 version]
        && (![v9 versionOutOfDate]
         || (unsigned int v10 = [v9 version],
             [MEMORY[0x1E4F83370] serializationVersion] <= v10)))
      {
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        v20 = [a1 attachment];
        v21 = [v20 previewImages];

        uint64_t v22 = [v21 countByEnumeratingWithState:&v53 objects:v57 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          int v24 = 0;
          int v25 = 0;
          uint64_t v26 = *(void *)v54;
          do
          {
            for (uint64_t i = 0; i != v23; ++i)
            {
              if (*(void *)v54 != v26) {
                objc_enumerationMutation(v21);
              }
              v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
              v25 |= [v28 appearanceType] == 0;
              v24 |= [v28 appearanceType] == 1;
            }
            uint64_t v23 = [v21 countByEnumeratingWithState:&v53 objects:v57 count:16];
          }
          while (v23);

          if (v25 & v24)
          {
            v29 = [a1 attachment];
            v30 = [v29 previewUpdateDate];
            v31 = [a1 attachment];
            v32 = [v31 modificationDate];
            uint64_t v33 = [v30 compare:v32];
            BOOL v19 = v33 == -1;

            v11 = os_log_create("com.apple.notes", "PreviewGeneration");
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              BOOL v51 = v33 == -1;
              v34 = (objc_class *)objc_opt_class();
              v35 = NSStringFromClass(v34);
              v36 = NSStringFromSelector(a2);
              v52 = [a1 attachment];
              v37 = [v52 identifier];
              v38 = [a1 attachment];
              v39 = [v38 previewUpdateDate];
              v40 = [a1 attachment];
              v41 = [v40 modificationDate];
              *(_DWORD *)buf = 138413570;
              v59 = v35;
              __int16 v60 = 2112;
              v61 = v36;
              __int16 v62 = 2112;
              v63 = v37;
              __int16 v64 = 1024;
              *(_DWORD *)v65 = v51;
              *(_WORD *)&v65[4] = 2112;
              *(void *)&v65[6] = v39;
              __int16 v66 = 2112;
              *(void *)v67 = v41;
              _os_log_debug_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return %d self.attachment.previewUpdateDate %@ self.attachment.modificationDate %@", buf, 0x3Au);
            }
            goto LABEL_31;
          }
        }
        else
        {

          LOBYTE(v25) = 0;
          LOBYTE(v24) = 0;
        }
        v11 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v43 = (objc_class *)objc_opt_class();
          v44 = NSStringFromClass(v43);
          v45 = NSStringFromSelector(a2);
          v46 = [a1 attachment];
          v47 = [v46 identifier];
          v48 = [a1 attachment];
          v49 = [v48 previewImages];
          uint64_t v50 = [v49 count];
          *(_DWORD *)buf = 138413570;
          v59 = v44;
          __int16 v60 = 2112;
          v61 = v45;
          __int16 v62 = 2112;
          v63 = v47;
          __int16 v64 = 2048;
          *(void *)v65 = v50;
          *(_WORD *)&v65[8] = 1024;
          *(_DWORD *)&v65[10] = v25 & 1;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = v24 & 1;
          _os_log_debug_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return 1 previewImages.count %lu hasDefault %d hasDark %d", buf, 0x36u);
        }
      }
      else
      {
        v11 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          v12 = (objc_class *)objc_opt_class();
          v13 = NSStringFromClass(v12);
          v14 = NSStringFromSelector(a2);
          v15 = [a1 attachment];
          v16 = [v15 identifier];
          if (v9)
          {
            int v17 = [v9 version];
            int v18 = [v9 versionOutOfDate];
          }
          else
          {
            int v17 = 0;
            int v18 = 0;
          }
          *(_DWORD *)buf = 138413826;
          v59 = v13;
          __int16 v60 = 2112;
          v61 = v14;
          __int16 v62 = 2112;
          v63 = v16;
          __int16 v64 = 2048;
          *(void *)v65 = v9;
          *(_WORD *)&v65[8] = 1024;
          *(_DWORD *)&v65[10] = v17;
          __int16 v66 = 1024;
          *(_DWORD *)v67 = v18;
          *(_WORD *)&v67[4] = 1024;
          *(_DWORD *)&v67[6] = [MEMORY[0x1E4F83370] serializationVersion];
          _os_log_debug_impl(&dword_1B08EB000, v11, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return 1 img %p img.version %d img.versionOutOfDate %d [ICDrawingVersionedDocument serializationVersion] %d", buf, 0x3Cu);
        }
      }
      BOOL v19 = 1;
LABEL_31:

      goto LABEL_32;
    }
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(ICAttachmentDrawingModel(PreviewGeneration) *)a1 needToGeneratePreviews];
    }
    BOOL v19 = 1;
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(ICAttachmentDrawingModel(PreviewGeneration) *)a1 needToGeneratePreviews];
    }
    BOOL v19 = 0;
  }
  v9 = v11;
LABEL_32:

  return v19;
}

- (uint64_t)generatePreviewsInOperation:()PreviewGeneration
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__52;
  v15 = __Block_byref_object_dispose__52;
  id v16 = 0;
  v5 = [a1 attachment];
  v6 = [v5 managedObjectContext];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __75__ICAttachmentDrawingModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v10[3] = &unk_1E5FDB2D0;
  v10[4] = a1;
  v10[5] = &v11;
  [v6 performBlockAndWait:v10];

  v7 = (void *)MEMORY[0x1E4F832C0];
  v8 = [a1 attachment];
  [v7 generatePreviewsForAttachment:v8 fromDrawing:v12[5]];

  _Block_object_dispose(&v11, 8);
  return 1;
}

- (void)needToGeneratePreviews
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = NSStringFromSelector(a2);
  v9 = [a1 attachment];
  unsigned int v10 = [v9 identifier];
  uint64_t v11 = [a1 attachment];
  v12 = [v11 previewUpdateDate];
  OUTLINED_FUNCTION_0_5();
  id v16 = v8;
  __int16 v17 = v13;
  int v18 = v10;
  __int16 v19 = v13;
  uint64_t v20 = v14;
  _os_log_debug_impl(&dword_1B08EB000, a3, OS_LOG_TYPE_DEBUG, "%@ %@ %@ return 1 self.attachment.previewUpdateDate %@", v15, 0x2Au);
}

@end