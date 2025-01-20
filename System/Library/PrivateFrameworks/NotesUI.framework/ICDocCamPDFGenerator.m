@interface ICDocCamPDFGenerator
+ (NSFileManager)fileManager;
+ (OS_dispatch_queue)fileQueue;
+ (OS_dispatch_queue)syncGeneratorQueue;
+ (id)blockingGeneratePDFDataForAttachment:(id)a3 withProgress:(id)a4 queue:(id)a5 error:(id *)a6;
+ (id)blockingGeneratePDFURLForAttachment:(id)a3 withProgress:(id)a4 error:(id *)a5;
+ (id)folderPathForAttachment:(id)a3;
+ (id)folderPathForAttachmentIdentifier:(id)a3 passwordProtected:(BOOL)a4;
+ (id)pdfURLForAttachment:(id)a3;
+ (id)rootPDFFolderPath;
+ (id)rootPDFFolderPathForPWAttachments;
+ (id)versionFolderPathForAttachment:(id)a3;
+ (id)versionPDFPathForAttachment:(id)a3;
+ (void)createEmptyPDFFileAtURLIFNecessaryForAttachment:(id)a3;
+ (void)deleteAllDocCamPDFs;
+ (void)deleteAllDocCamPasswordProtectedPDFs;
+ (void)deletePDFFolderIfExistsForAttachment:(id)a3;
+ (void)generatePDFsIfNecessaryForGalleryAttachments:(id)a3 displayWindow:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6;
+ (void)performPDFGenerationWithGenerator:(id)a3 galleryModel:(id)a4 progress:(id)a5;
@end

@implementation ICDocCamPDFGenerator

+ (OS_dispatch_queue)syncGeneratorQueue
{
  if (syncGeneratorQueue_onceToken != -1) {
    dispatch_once(&syncGeneratorQueue_onceToken, &__block_literal_global_13);
  }
  v2 = (void *)syncGeneratorQueue_sSyncGeneratorQueue;
  return (OS_dispatch_queue *)v2;
}

void __42__ICDocCamPDFGenerator_syncGeneratorQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("PDF Sync Generator Queue", v2);
  v1 = (void *)syncGeneratorQueue_sSyncGeneratorQueue;
  syncGeneratorQueue_sSyncGeneratorQueue = (uint64_t)v0;
}

+ (OS_dispatch_queue)fileQueue
{
  if (fileQueue_onceToken != -1) {
    dispatch_once(&fileQueue_onceToken, &__block_literal_global_16);
  }
  v2 = (void *)fileQueue_sFileQueue;
  return (OS_dispatch_queue *)v2;
}

void __33__ICDocCamPDFGenerator_fileQueue__block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("PDF File Queue", v2);
  v1 = (void *)fileQueue_sFileQueue;
  fileQueue_sFileQueue = (uint64_t)v0;
}

+ (NSFileManager)fileManager
{
  return (NSFileManager *)[MEMORY[0x1E4F28CB8] defaultManager];
}

+ (id)rootPDFFolderPath
{
  v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = 0;
  v3 = [v2 URLForDirectory:13 inDomain:1 appropriateForURL:0 create:1 error:&v8];
  id v4 = v8;

  v5 = [v3 path];
  if (!v5)
  {
    [MEMORY[0x1E4F836F8] handleFailedAssertWithCondition:"__objc_no", "+[ICDocCamPDFGenerator rootPDFFolderPath]", 1, 0, @"ICDocCamPDFGenerator: Failed get caches directory with error (falling back to NSTemporaryDirectory): %@", v4 functionName simulateCrash showAlert format];
    v5 = NSTemporaryDirectory();
  }
  v6 = [v5 stringByAppendingPathComponent:@"galleryTempPDFFolder"];

  return v6;
}

+ (id)rootPDFFolderPathForPWAttachments
{
  v2 = [a1 rootPDFFolderPath];
  v3 = [v2 stringByAppendingPathComponent:@"P"];

  return v3;
}

+ (id)folderPathForAttachmentIdentifier:(id)a3 passwordProtected:(BOOL)a4
{
  id v6 = a3;
  if (a4) {
    [a1 rootPDFFolderPathForPWAttachments];
  }
  else {
  v7 = [a1 rootPDFFolderPath];
  }
  id v8 = [v7 stringByAppendingPathComponent:v6];

  return v8;
}

+ (id)folderPathForAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  id v22 = 0;
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v5 = [v4 managedObjectContext];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __48__ICDocCamPDFGenerator_folderPathForAttachment___block_invoke;
  v9[3] = &unk_1E5FD9248;
  v11 = &v17;
  id v6 = v4;
  id v10 = v6;
  v12 = &v13;
  [v5 performBlockAndWait:v9];

  v7 = [a1 folderPathForAttachmentIdentifier:v18[5] passwordProtected:*((unsigned __int8 *)v14 + 24)];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v17, 8);

  return v7;
}

uint64_t __48__ICDocCamPDFGenerator_folderPathForAttachment___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) identifier];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t result = [*(id *)(a1 + 32) isPasswordProtected];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

+ (id)versionFolderPathForAttachment:(id)a3
{
  id v4 = a3;
  v5 = [a1 folderPathForAttachment:v4];
  id v6 = NSNumber;
  uint64_t v7 = [v4 docCamPDFVersion];

  id v8 = [v6 numberWithInteger:v7];
  v9 = [v8 stringValue];
  id v10 = [v5 stringByAppendingPathComponent:v9];

  return v10;
}

+ (id)versionPDFPathForAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  id v22 = __Block_byref_object_copy__7;
  v23 = __Block_byref_object_dispose__7;
  id v24 = 0;
  v5 = [v4 managedObjectContext];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __52__ICDocCamPDFGenerator_versionPDFPathForAttachment___block_invoke;
  char v16 = &unk_1E5FD91F8;
  v18 = &v19;
  id v6 = v4;
  id v17 = v6;
  [v5 performBlockAndWait:&v13];

  uint64_t v7 = objc_msgSend((id)v20[5], "ic_sanitizedFilenameString", v13, v14, v15, v16);
  if (![v7 length])
  {
    uint64_t v8 = [v6 defaultTitle];

    uint64_t v7 = (void *)v8;
  }
  v9 = [a1 versionFolderPathForAttachment:v6];
  id v10 = [v9 stringByAppendingPathComponent:v7];

  v11 = [v10 stringByAppendingPathExtension:@"pdf"];

  _Block_object_dispose(&v19, 8);
  return v11;
}

uint64_t __52__ICDocCamPDFGenerator_versionPDFPathForAttachment___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) title];
  return MEMORY[0x1F41817F8]();
}

+ (void)createEmptyPDFFileAtURLIFNecessaryForAttachment:(id)a3
{
  id v4 = [a1 versionPDFPathForAttachment:a3];
  v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4];
  id v6 = [a1 fileQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__ICDocCamPDFGenerator_createEmptyPDFFileAtURLIFNecessaryForAttachment___block_invoke;
  v8[3] = &unk_1E5FD9B40;
  id v9 = v5;
  id v10 = a1;
  id v7 = v5;
  dispatch_sync(v6, v8);
}

void __72__ICDocCamPDFGenerator_createEmptyPDFFileAtURLIFNecessaryForAttachment___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) checkResourceIsReachableAndReturnError:0] & 1) == 0)
  {
    uint64_t v2 = [*(id *)(a1 + 40) fileManager];
    uint64_t v3 = [*(id *)(a1 + 32) path];
    id v4 = [v3 stringByDeletingLastPathComponent];
    [v2 createDirectoryAtPath:v4 withIntermediateDirectories:1 attributes:0 error:0];

    id v5 = [MEMORY[0x1E4F1C9B8] data];
    [v5 writeToURL:*(void *)(a1 + 32) atomically:1];
  }
}

+ (void)deletePDFFolderIfExistsForAttachment:(id)a3
{
  id v4 = a3;
  id v6 = [a1 fileManager];
  id v5 = [a1 folderPathForAttachment:v4];

  if ([v6 fileExistsAtPath:v5]) {
    [v6 removeItemAtPath:v5 error:0];
  }
}

+ (void)deleteAllDocCamPDFs
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Deleting All Doc Cam PDFs", v1, 2u);
}

void __43__ICDocCamPDFGenerator_deleteAllDocCamPDFs__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) fileManager];
  uint64_t v2 = [*(id *)(a1 + 32) rootPDFFolderPath];
  [v3 removeItemAtPath:v2 error:0];
}

+ (void)deleteAllDocCamPasswordProtectedPDFs
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1B08EB000, log, OS_LOG_TYPE_DEBUG, "Deleting All Doc Cam Password Protected PDFs", v1, 2u);
}

void __60__ICDocCamPDFGenerator_deleteAllDocCamPasswordProtectedPDFs__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) fileManager];
  uint64_t v2 = [*(id *)(a1 + 32) rootPDFFolderPathForPWAttachments];
  [v3 removeItemAtPath:v2 error:0];
}

+ (id)pdfURLForAttachment:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  char v16 = __Block_byref_object_copy__7;
  id v17 = __Block_byref_object_dispose__7;
  id v18 = 0;
  id v5 = [a1 fileQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__ICDocCamPDFGenerator_pdfURLForAttachment___block_invoke;
  block[3] = &unk_1E5FD9B68;
  v11 = &v13;
  id v12 = a1;
  id v10 = v4;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v7;
}

void __44__ICDocCamPDFGenerator_pdfURLForAttachment___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 48) versionPDFPathForAttachment:*(void *)(a1 + 32)];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB10], "fileURLWithPath:");
  if (objc_msgSend(v2, "ic_fileSize") >= 11
    && [v2 checkResourceIsReachableAndReturnError:0])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v2);
  }
}

+ (void)generatePDFsIfNecessaryForGalleryAttachments:(id)a3 displayWindow:(id)a4 presentingViewController:(id)a5 completionHandler:(id)a6
{
  uint64_t v99 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v51 = a5;
  v52 = v10;
  id v53 = a6;
  if (!v10) {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((displayWindow) != nil)", "+[ICDocCamPDFGenerator generatePDFsIfNecessaryForGalleryAttachments:displayWindow:presentingViewController:completionHandler:]", 1, 0, @"Expected non-nil value for '%s'", "displayWindow");
  }
  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x2020000000;
  char v95 = 0;
  id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  obuint64_t j = v9;
  uint64_t v11 = [obj countByEnumeratingWithState:&v90 objects:v98 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v91;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v91 != v12) {
          objc_enumerationMutation(obj);
        }
        objc_opt_class();
        uint64_t v14 = ICDynamicCast();
        objc_opt_class();
        uint64_t v15 = [v14 attachmentModel];
        char v16 = ICDynamicCast();

        if (v16)
        {
          id v17 = +[ICDocCamPDFGenerator pdfURLForAttachment:v14];
          BOOL v18 = v17 == 0;

          if (v18) {
            [v55 addObject:v16];
          }
        }
        objc_opt_class();
        uint64_t v19 = [v14 attachmentModel];
        v20 = ICDynamicCast();

        if (v20 && ([v20 tooLargeForPreviewGeneration] & 1) == 0)
        {
          int v21 = [v14 hasFallbackPDF];
          if ([v14 isPasswordProtected]
            && [v14 attachmentType] == 15)
          {
            id v22 = +[ICDocCamPDFGenerator pdfURLForAttachment:v14];
            BOOL v23 = v22 == 0;
          }
          else
          {
            BOOL v23 = 0;
          }
          id v24 = [v14 previewImages];
          if ([v24 count])
          {
            v25 = [v14 previewUpdateDate];
            BOOL v26 = v25 == 0;
          }
          else
          {
            BOOL v26 = 0;
          }

          if ((v21 ^ 1 | (v23 || v26)) == 1) {
            [v54 addObject:v20];
          }
        }
        objc_opt_class();
        v27 = [v14 attachmentModel];
        v28 = ICDynamicCast();

        if (v28 && [v28 needToGeneratePreviews]) {
          [v58 addObject:v28];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v90 objects:v98 count:16];
    }
    while (v11);
  }

  uint64_t v29 = [v55 count];
  uint64_t v30 = [v54 count];
  if (v30 + v29 + [v58 count])
  {
    uint64_t v87 = 0;
    v88[0] = 0;
    v88[1] = v88;
    v88[2] = 0x2020000000;
    char v89 = 0;
    uint64_t v84 = 0;
    v85 = &v84;
    uint64_t v86 = 0x2020000000;
    long long v80 = 0u;
    long long v81 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v57 = v55;
    uint64_t v31 = [v57 countByEnumeratingWithState:&v80 objects:v97 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v81;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v81 != v32) {
            objc_enumerationMutation(v57);
          }
          v34 = *(void **)(*((void *)&v80 + 1) + 8 * j);
          v35 = [v34 attachment];
          v36 = [v35 managedObjectContext];
          v79[0] = MEMORY[0x1E4F143A8];
          v79[1] = 3221225472;
          v79[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke;
          v79[3] = &unk_1E5FD91F8;
          v79[4] = v34;
          v79[5] = &v84;
          [v36 performBlockAndWait:v79];
        }
        uint64_t v31 = [v57 countByEnumeratingWithState:&v80 objects:v97 count:16];
      }
      while (v31);
    }

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v56 = v54;
    uint64_t v37 = [v56 countByEnumeratingWithState:&v75 objects:v96 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v76;
      do
      {
        for (uint64_t k = 0; k != v37; ++k)
        {
          if (*(void *)v76 != v38) {
            objc_enumerationMutation(v56);
          }
          v40 = *(void **)(*((void *)&v75 + 1) + 8 * k);
          v41 = [v40 attachment];
          v42 = [v41 managedObjectContext];
          v74[0] = MEMORY[0x1E4F143A8];
          v74[1] = 3221225472;
          v74[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_2;
          v74[3] = &unk_1E5FD91F8;
          v74[4] = v40;
          v74[5] = &v84;
          [v42 performBlockAndWait:v74];
        }
        uint64_t v37 = [v56 countByEnumeratingWithState:&v75 objects:v96 count:16];
      }
      while (v37);
    }

    uint64_t v43 = [v58 count];
    v85[3] += v43;
    v44 = [[ICLongRunningTaskController alloc] initWithWindow:v52 intervalBeforeOpeningProgressDialog:0.5];
    [(ICLongRunningTaskController *)v44 setAllowSingleUnitProgress:1];
    v45 = [MEMORY[0x1E4F83770] localizedFrameworkStringForKey:@"Preparing…" value:@"Preparing…" table:0 allowSiri:1];
    [(ICLongRunningTaskController *)v44 setProgressString:v45];
    [(ICLongRunningTaskController *)v44 setShouldShowCancelButton:1];
    [(ICLongRunningTaskController *)v44 setShouldShowCircularProgress:1];
    [(ICLongRunningTaskController *)v44 setViewControllerToPresentFrom:v51];
    v46 = [MEMORY[0x1E4F83428] sharedContext];
    v47 = [v46 workerManagedObjectContext];

    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_3;
    v64[3] = &unk_1E5FD9BB8;
    v70 = &v84;
    id v65 = v57;
    id v48 = v47;
    id v66 = v48;
    v49 = v44;
    v67 = v49;
    id v68 = v56;
    id v73 = a1;
    id v69 = v58;
    v71 = v88;
    v72 = v94;
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_2_51;
    v60[3] = &unk_1E5FD9BE0;
    char v63 = 0;
    v62 = v88;
    id v61 = v53;
    [(ICLongRunningTaskController *)v49 startTask:v64 completionBlock:v60];

    _Block_object_dispose(&v84, 8);
    _Block_object_dispose(v88, 8);
  }
  else if (v53)
  {
    (*((void (**)(id, uint64_t))v53 + 2))(v53, 1);
  }

  _Block_object_dispose(v94, 8);
}

uint64_t __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) subAttachmentCount];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += result;
  return result;
}

unint64_t __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_2(uint64_t a1)
{
  unint64_t result = [*(id *)(a1 + 32) paperPageCount];
  if (result <= 1) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = result;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) += v3;
  return result;
}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 setTotalUnitCount:*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24)];
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v49 objects:v55 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v50;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v50 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v49 + 1) + 8 * v8);
      id v10 = *(void **)(a1 + 40);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_4;
      v45[3] = &unk_1E5FD8FE8;
      id v11 = v10;
      id v46 = v11;
      uint64_t v47 = v9;
      id v48 = v3;
      [v11 performBlockAndWait:v45];
      LOBYTE(v11) = [*(id *)(a1 + 48) isCancelled];

      if (v11) {
        break;
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v49 objects:v55 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v12 = *(id *)(a1 + 56);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v42;
LABEL_11:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v42 != v15) {
        objc_enumerationMutation(v12);
      }
      uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * v16);
      BOOL v18 = *(void **)(a1 + 40);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_5;
      v36[3] = &unk_1E5FD9B90;
      id v19 = v18;
      id v37 = v19;
      uint64_t v38 = v17;
      uint64_t v40 = *(void *)(a1 + 96);
      id v39 = v3;
      [v19 performBlockAndWait:v36];
      LOBYTE(v19) = [*(id *)(a1 + 48) isCancelled];

      if (v19) {
        break;
      }
      if (v14 == ++v16)
      {
        uint64_t v14 = [v12 countByEnumeratingWithState:&v41 objects:v54 count:16];
        if (v14) {
          goto LABEL_11;
        }
        break;
      }
    }
  }

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v20 = *(id *)(a1 + 64);
  uint64_t v21 = [v20 countByEnumeratingWithState:&v32 objects:v53 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v33;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v33 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void *)(*((void *)&v32 + 1) + 8 * v24);
        BOOL v26 = *(void **)(a1 + 40);
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_49;
        v28[3] = &unk_1E5FD8FE8;
        id v27 = v26;
        id v29 = v27;
        uint64_t v30 = v25;
        id v31 = v3;
        [v27 performBlockAndWait:v28];

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v32 objects:v53 count:16];
    }
    while (v22);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = [*(id *)(a1 + 48) isCancelled] ^ 1;
}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) attachment];
  id v4 = [v3 objectID];
  id v6 = [v2 existingObjectWithID:v4 error:0];

  id v5 = +[ICDocCamPDFGenerator blockingGeneratePDFURLForAttachment:v6 withProgress:*(void *)(a1 + 48) error:0];
}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) attachment];
  id v4 = [v3 objectID];
  id v5 = [v2 existingObjectWithID:v4 error:0];

  objc_opt_class();
  id v6 = [v5 attachmentModel];
  uint64_t v7 = ICDynamicCast();

  [v7 generateFallbackPDFIfNecessary];
  if ([v5 isPasswordProtected] && objc_msgSend(v5, "attachmentType") == 15)
  {
    uint64_t v8 = [v5 fallbackPDFData];
    if (v8)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F1CB10];
      id v10 = [*(id *)(a1 + 56) versionPDFPathForAttachment:v5];
      id v11 = [v9 fileURLWithPath:v10 isDirectory:0];

      id v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      [v12 removeItemAtURL:v11 error:0];
      uint64_t v13 = [v11 URLByDeletingLastPathComponent];
      [v12 createDirectoryAtURL:v13 withIntermediateDirectories:1 attributes:0 error:0];

      id v20 = 0;
      char v14 = [v8 writeToURL:v11 options:1 error:&v20];
      id v15 = v20;
      if ((v14 & 1) == 0)
      {
        uint64_t v16 = os_log_create("com.apple.notes", "Export");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_5_cold_1((uint64_t)v15, v16);
        }
      }
    }
  }
  uint64_t v17 = *(void **)(a1 + 48);
  unint64_t v18 = [v7 paperPageCount];
  if (v18 <= 1) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = v18;
  }
  objc_msgSend(v17, "setCompletedUnitCount:", objc_msgSend(v17, "completedUnitCount") + v19);
}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_49(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) attachment];
  id v4 = [v3 objectID];
  id v5 = [v2 existingObjectWithID:v4 error:0];

  objc_opt_class();
  id v6 = [v5 attachmentModel];
  uint64_t v7 = ICDynamicCast();

  id v9 = 0;
  [v7 synchronouslyGenerateFallbackMediaDataIfNecessaryAndReturnError:&v9];
  id v8 = v9;
  objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_2_51(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_3_52;
    v4[3] = &unk_1E5FD8F20;
    id v6 = *(id *)(a1 + 32);
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], v4);
  }
}

uint64_t __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_3_52(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) isCancelled] ^ 1;
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

+ (id)blockingGeneratePDFURLForAttachment:(id)a3 withProgress:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__7;
  uint64_t v22 = __Block_byref_object_dispose__7;
  id v23 = [a1 pdfURLForAttachment:v7];
  id v9 = (void *)v19[5];
  if (!v9)
  {
    id v10 = [a1 syncGeneratorQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke;
    v13[3] = &unk_1E5FD9C30;
    id v17 = a1;
    id v14 = v7;
    id v15 = v8;
    uint64_t v16 = &v18;
    dispatch_sync(v10, v13);

    id v9 = (void *)v19[5];
  }
  id v11 = v9;
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 56) versionPDFPathForAttachment:*(void *)(a1 + 32)];
  id v3 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v2];
  uint64_t v33 = 0;
  long long v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__7;
  id v37 = __Block_byref_object_dispose__7;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__7;
  id v31 = __Block_byref_object_dispose__7;
  id v32 = 0;
  id v4 = [*(id *)(a1 + 32) managedObjectContext];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_2;
  v23[3] = &unk_1E5FD9248;
  uint64_t v25 = &v33;
  id v24 = *(id *)(a1 + 32);
  BOOL v26 = &v27;
  [v4 performBlockAndWait:v23];

  id v5 = [*(id *)(a1 + 56) fileQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_3;
  block[3] = &unk_1E5FD9C08;
  uint64_t v22 = *(void *)(a1 + 56);
  id v20 = *(id *)(a1 + 32);
  id v6 = v2;
  id v21 = v6;
  dispatch_sync(v5, block);

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v8 = objc_alloc(MEMORY[0x1E4F83450]);
  if (v28[5]) {
    id v9 = (__CFString *)v28[5];
  }
  else {
    id v9 = &stru_1F0973378;
  }
  id v10 = objc_msgSend(v8, "initWithMutableData:pageRect:title:", v7, v9, *MEMORY[0x1E4F835A8], *(double *)(MEMORY[0x1E4F835A8] + 8), *(double *)(MEMORY[0x1E4F835A8] + 16), *(double *)(MEMORY[0x1E4F835A8] + 24));
  [*(id *)(a1 + 56) performPDFGenerationWithGenerator:v10 galleryModel:v34[5] progress:*(void *)(a1 + 40)];
  if (v7)
  {
    id v11 = [*(id *)(a1 + 56) fileQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_4;
    v14[3] = &unk_1E5FD9C30;
    uint64_t v18 = *(void *)(a1 + 56);
    id v15 = v3;
    id v12 = v7;
    uint64_t v13 = *(void *)(a1 + 48);
    id v16 = v12;
    uint64_t v17 = v13;
    dispatch_sync(v11, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F836F8], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((data) != nil)", "+[ICDocCamPDFGenerator blockingGeneratePDFURLForAttachment:withProgress:error:]_block_invoke", 1, 0, @"Expected non-nil value for '%s'", "data");
  }

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);
}

uint64_t __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_2(uint64_t a1)
{
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) attachmentModel];
  uint64_t v3 = ICDynamicCast();
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [*(id *)(a1 + 32) title];
  return MEMORY[0x1F41817F8]();
}

void __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 48) deletePDFForAttachmentIfExists:*(void *)(a1 + 32)];
  id v3 = [*(id *)(a1 + 48) fileManager];
  uint64_t v2 = [*(id *)(a1 + 40) stringByDeletingLastPathComponent];
  [v3 createDirectoryAtPath:v2 withIntermediateDirectories:1 attributes:0 error:0];
}

void __79__ICDocCamPDFGenerator_blockingGeneratePDFURLForAttachment_withProgress_error___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 56) fileManager];
  [v2 removeItemAtURL:*(void *)(a1 + 32) error:0];

  [*(id *)(a1 + 40) writeToURL:*(void *)(a1 + 32) atomically:1];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = (id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  objc_storeStrong(v4, v3);
}

+ (id)blockingGeneratePDFDataForAttachment:(id)a3 withProgress:(id)a4 queue:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x3032000000;
  long long v41 = __Block_byref_object_copy__7;
  long long v42 = __Block_byref_object_dispose__7;
  id v43 = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy__7;
  void v36[4] = __Block_byref_object_dispose__7;
  id v37 = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x3032000000;
  v34[3] = __Block_byref_object_copy__7;
  v34[4] = __Block_byref_object_dispose__7;
  id v35 = 0;
  id v12 = [v9 managedObjectContext];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke;
  v30[3] = &unk_1E5FD9248;
  id v32 = v36;
  id v13 = v9;
  id v31 = v13;
  uint64_t v33 = v34;
  [v12 performBlockAndWait:v30];

  id v14 = [MEMORY[0x1E4F83428] sharedContext];
  id v15 = [v14 workerManagedObjectContext];

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke_62;
  v22[3] = &unk_1E5FD9C58;
  id v16 = v15;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  uint64_t v27 = v34;
  id v18 = v11;
  id v25 = v18;
  id v29 = a1;
  id v19 = v10;
  id v26 = v19;
  v28 = &v38;
  [v16 performBlockAndWait:v22];
  id v20 = (id)v39[5];

  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(&v38, 8);
  return v20;
}

void __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  uint64_t v2 = [*(id *)(a1 + 32) attachmentModel];
  uint64_t v3 = ICDynamicCast();
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [*(id *)(a1 + 32) title];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;

  id v9 = os_log_create("com.apple.notes", "Export");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    id v10 = [*(id *)(a1 + 32) identifier];
    uint64_t v11 = [*(id *)(a1 + 32) docCamPDFVersion];
    int v12 = 138412546;
    id v13 = v10;
    __int16 v14 = 2048;
    uint64_t v15 = v11;
    _os_log_impl(&dword_1B08EB000, v9, OS_LOG_TYPE_INFO, "Generating PDF: %@:%ld", (uint8_t *)&v12, 0x16u);
  }
}

void __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke_62(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) objectID];
  uint64_t v4 = [v2 existingObjectWithID:v3 error:0];

  objc_opt_class();
  id v5 = [v4 attachmentModel];
  uint64_t v6 = ICDynamicCast();

  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  id v8 = objc_alloc(MEMORY[0x1E4F83450]);
  id v9 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v10 = v9;
  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F832A0] defaultTitleForAttachmentType:6];
  }
  uint64_t v11 = objc_msgSend(v8, "initWithMutableData:pageRect:title:", v7, v10, *MEMORY[0x1E4F835A8], *(double *)(MEMORY[0x1E4F835A8] + 8), *(double *)(MEMORY[0x1E4F835A8] + 16), *(double *)(MEMORY[0x1E4F835A8] + 24));
  if (!v9) {

  }
  int v12 = *(NSObject **)(a1 + 48);
  if (v12)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke_2;
    id v18 = &unk_1E5FD9B90;
    uint64_t v22 = *(void *)(a1 + 80);
    id v19 = v11;
    id v20 = v6;
    id v21 = *(id *)(a1 + 56);
    dispatch_sync(v12, &v15);
  }
  else
  {
    [*(id *)(a1 + 80) performPDFGenerationWithGenerator:v11 galleryModel:v6 progress:*(void *)(a1 + 56)];
  }
  uint64_t v13 = objc_msgSend(v7, "length", v15, v16, v17, v18);
  if (v13) {
    __int16 v14 = (void *)[v7 copy];
  }
  else {
    __int16 v14 = 0;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), v14);
  if (v13) {
}
  }

uint64_t __86__ICDocCamPDFGenerator_blockingGeneratePDFDataForAttachment_withProgress_queue_error___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 56) performPDFGenerationWithGenerator:*(void *)(a1 + 32) galleryModel:*(void *)(a1 + 40) progress:*(void *)(a1 + 48)];
}

+ (void)performPDFGenerationWithGenerator:(id)a3 galleryModel:(id)a4 progress:(id)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [MEMORY[0x1E4F1C9C8] date];
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x2020000000;
  v25[3] = 0;
  [v7 startGenerating];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__ICDocCamPDFGenerator_performPDFGenerationWithGenerator_galleryModel_progress___block_invoke;
  v21[3] = &unk_1E5FD9CA8;
  id v11 = v9;
  id v22 = v11;
  id v24 = v25;
  id v12 = v7;
  id v23 = v12;
  [v8 enumerateSubAttachmentsWithBlock:v21];
  uint64_t v13 = [v8 attachment];
  __int16 v14 = [v13 identifier];

  uint64_t v15 = os_log_create("com.apple.notes", "Export");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
    [v16 timeIntervalSinceDate:v10];
    uint64_t v18 = v17;
    id v19 = [v8 attachment];
    uint64_t v20 = [v19 docCamPDFVersion];
    *(_DWORD *)buf = 134218498;
    uint64_t v27 = v18;
    __int16 v28 = 2112;
    id v29 = v14;
    __int16 v30 = 2048;
    uint64_t v31 = v20;
    _os_log_impl(&dword_1B08EB000, v15, OS_LOG_TYPE_INFO, "PDF Generation time: %f. ID: %@:%ld", buf, 0x20u);
  }
  [v12 finishGenerating];

  _Block_object_dispose(v25, 8);
}

void __80__ICDocCamPDFGenerator_performPDFGenerationWithGenerator_galleryModel_progress___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  id v9 = a3;
  id v10 = *(void **)(a1 + 32);
  if (v10 && [v10 isCancelled])
  {
    *a5 = 1;
  }
  else
  {
    id v11 = [v8 image];
    id v12 = v11;
    if (v11)
    {
      ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      uint64_t v13 = *(void **)(a1 + 40);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __80__ICDocCamPDFGenerator_performPDFGenerationWithGenerator_galleryModel_progress___block_invoke_2;
      v14[3] = &unk_1E5FD9C80;
      id v15 = v11;
      [v13 addPageWithRenderBlock:v14];
    }
    objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 32), "completedUnitCount") + 1);
  }
}

void __80__ICDocCamPDFGenerator_performPDFGenerationWithGenerator_galleryModel_progress___block_invoke_2(uint64_t a1, CGContext *a2, double a3, double a4, double a5, double a6)
{
  CGRect v33 = CGRectInset(*(CGRect *)&a3, 32.0, 32.0);
  double x = v33.origin.x;
  double y = v33.origin.y;
  double width = v33.size.width;
  double height = v33.size.height;
  [*(id *)(a1 + 32) size];
  memset(&v32, 0, sizeof(v32));
  objc_msgSend(*(id *)(a1 + 32), "ic_imageOrientation");
  ICTransformFromImageOrientation();
  id v12 = (void *)MEMORY[0x1E4FB1818];
  [*(id *)(a1 + 32) size];
  objc_msgSend(v12, "ic_aspectFitImageFrameForViewWithFrame:imageSize:", x, y, width, height, v13, v14);
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  memset(&v30, 0, sizeof(v30));
  CGAffineTransformInvert(&v31, &v30);
  v34.origin.double x = v16;
  v34.origin.double y = v18;
  v34.size.double width = v20;
  v34.size.double height = v22;
  CGRect v35 = CGRectApplyAffineTransform(v34, &v31);
  CGFloat v23 = v35.origin.x;
  CGFloat v24 = v35.origin.y;
  CGFloat v25 = v35.size.width;
  CGFloat v26 = v35.size.height;
  CGContextSaveGState(a2);
  CGAffineTransform v30 = v32;
  CGContextConcatCTM(a2, &v30);
  UIImageJPEGRepresentation(*(UIImage **)(a1 + 32), 0.6);
  CFDataRef v27 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  __int16 v28 = CGDataProviderCreateWithCFData(v27);
  id v29 = CGImageCreateWithJPEGDataProvider(v28, 0, 1, kCGRenderingIntentDefault);
  v36.origin.double x = v23;
  v36.origin.double y = v24;
  v36.size.double width = v25;
  v36.size.double height = v26;
  CGContextDrawImage(a2, v36, v29);
  CGContextRestoreGState(a2);
  CGDataProviderRelease(v28);
  CGImageRelease(v29);
}

void __126__ICDocCamPDFGenerator_generatePDFsIfNecessaryForGalleryAttachments_displayWindow_presentingViewController_completionHandler___block_invoke_5_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B08EB000, a2, OS_LOG_TYPE_ERROR, "Failed to copy fallback PDF data: %@", (uint8_t *)&v2, 0xCu);
}

@end