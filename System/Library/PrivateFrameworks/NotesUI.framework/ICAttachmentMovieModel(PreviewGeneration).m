@interface ICAttachmentMovieModel(PreviewGeneration)
- (BOOL)generatePreviewsInOperation:()PreviewGeneration;
@end

@implementation ICAttachmentMovieModel(PreviewGeneration)

- (BOOL)generatePreviewsInOperation:()PreviewGeneration
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__59;
  v46 = __Block_byref_object_dispose__59;
  id v47 = 0;
  uint64_t v36 = 0;
  v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__59;
  v40 = __Block_byref_object_dispose__59;
  id v41 = 0;
  v5 = [a1 attachment];
  v6 = [v5 managedObjectContext];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke;
  v35[3] = &unk_1E5FD9248;
  v35[4] = a1;
  v35[5] = &v42;
  v35[6] = &v36;
  [v6 performBlockAndWait:v35];

  v7 = (void *)v37[5];
  v26 = v7;
  if (v7)
  {
    v8 = (const void *)[v7 newPreviewImageSource];
    if (v8)
    {
      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v9 = +[ICPreviewDeviceContext sharedContext];
      id obj = [v9 deviceInfoScalable:1];

      uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v48 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v32;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v32 != v11) {
              objc_enumerationMutation(obj);
            }
            v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
            objc_msgSend(v13, "imageSize", v26);
            uint64_t v15 = v14;
            v16 = [a1 attachment];
            v17 = [v16 managedObjectContext];
            v30[0] = MEMORY[0x1E4F143A8];
            v30[1] = 3221225472;
            v30[2] = __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_10;
            v30[3] = &unk_1E5FDA120;
            v30[5] = v13;
            v30[6] = v8;
            v30[7] = v15;
            v30[4] = a1;
            [v17 performBlockAndWait:v30];
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v31 objects:v48 count:16];
        }
        while (v10);
      }

      v18 = [a1 attachment];
      v19 = [v18 managedObjectContext];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __73__ICAttachmentMovieModel_PreviewGeneration__generatePreviewsInOperation___block_invoke_2;
      v29[3] = &unk_1E5FD8DF0;
      v29[4] = a1;
      [v19 performBlockAndWait:v29];

      CFRelease(v8);
    }
  }
  else
  {
    v20 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v22 = (objc_class *)objc_opt_class();
      NSStringFromClass(v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
      v24 = NSStringFromSelector(a2);
      uint64_t v25 = v43[5];
      *(_DWORD *)buf = 138412802;
      id v50 = v23;
      __int16 v51 = 2112;
      v52 = v24;
      __int16 v53 = 2112;
      uint64_t v54 = v25;
      _os_log_debug_impl(&dword_1B08EB000, v20, OS_LOG_TYPE_DEBUG, "%@ %@ %@ early return", buf, 0x20u);
    }
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v26 != 0;
}

@end