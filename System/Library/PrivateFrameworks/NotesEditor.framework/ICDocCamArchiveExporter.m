@interface ICDocCamArchiveExporter
+ (BOOL)archiveExportingEnabled;
+ (id)archivableImageForSubAttachent:(id)a3;
+ (id)archiveGalleryImagesFromGallery:(id)a3 toURL:(id)a4;
+ (id)createZipArchiveOfImagesFromGalleryAttachment:(id)a3;
+ (id)createZipArchiveOfImagesFromNote:(id)a3;
+ (id)exportAsArchiveActivityWithBarButtonItem:(id)a3 presentingVC:(id)a4 fromGalleryAttachment:(id)a5;
+ (id)exportAsArchiveActivityWithBarButtonItem:(id)a3 presentingVC:(id)a4 fromNote:(id)a5;
+ (void)showActivityVCWithBarButtonItem:(id)a3 presentingVC:(id)a4 url:(id)a5;
+ (void)showExportArchiveFromNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5;
@end

@implementation ICDocCamArchiveExporter

+ (BOOL)archiveExportingEnabled
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  char v3 = [v2 BOOLForKey:*MEMORY[0x263F5AEE8]];

  return v3;
}

+ (id)exportAsArchiveActivityWithBarButtonItem:(id)a3 presentingVC:(id)a4 fromNote:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 archiveExportingEnabled])
  {
    id v11 = objc_alloc(MEMORY[0x263F5B298]);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __90__ICDocCamArchiveExporter_exportAsArchiveActivityWithBarButtonItem_presentingVC_fromNote___block_invoke;
    v14[3] = &unk_2640BA108;
    id v18 = a1;
    id v15 = v10;
    id v16 = v8;
    id v17 = v9;
    v12 = (void *)[v11 initWithTitle:@"Archive All Doc Cam Scans In Note" image:0 block:v14];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __90__ICDocCamArchiveExporter_exportAsArchiveActivityWithBarButtonItem_presentingVC_fromNote___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 56) createZipArchiveOfImagesFromNote:*(void *)(a1 + 32)];
  [*(id *)(a1 + 56) showActivityVCWithBarButtonItem:*(void *)(a1 + 40) presentingVC:*(void *)(a1 + 48) url:v2];
}

+ (id)exportAsArchiveActivityWithBarButtonItem:(id)a3 presentingVC:(id)a4 fromGalleryAttachment:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([a1 archiveExportingEnabled])
  {
    id v11 = objc_alloc(MEMORY[0x263F5B298]);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __103__ICDocCamArchiveExporter_exportAsArchiveActivityWithBarButtonItem_presentingVC_fromGalleryAttachment___block_invoke;
    v14[3] = &unk_2640BA108;
    id v18 = a1;
    id v15 = v10;
    id v16 = v8;
    id v17 = v9;
    v12 = (void *)[v11 initWithTitle:@"Create Zip Archive" image:0 block:v14];
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __103__ICDocCamArchiveExporter_exportAsArchiveActivityWithBarButtonItem_presentingVC_fromGalleryAttachment___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 56) createZipArchiveOfImagesFromGalleryAttachment:*(void *)(a1 + 32)];
  [*(id *)(a1 + 56) showActivityVCWithBarButtonItem:*(void *)(a1 + 40) presentingVC:*(void *)(a1 + 48) url:v2];
}

+ (void)showActivityVCWithBarButtonItem:(id)a3 presentingVC:(id)a4 url:(id)a5
{
  v18[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (objc_msgSend(v9, "ic_isReachable"))
  {
    id v10 = objc_alloc(MEMORY[0x263F6BC98]);
    v18[0] = v9;
    id v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    os_log_t v12 = (os_log_t)[v10 initWithActivityItems:v11 applicationActivities:0];

    uint64_t v13 = *MEMORY[0x263F6BD58];
    v17[0] = *MEMORY[0x263F5AE08];
    v17[1] = v13;
    v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:2];
    [v12 setExcludedActivityTypes:v14];

    if (objc_msgSend(MEMORY[0x263F82670], "ic_isVision")) {
      uint64_t v15 = -2;
    }
    else {
      uint64_t v15 = 7;
    }
    [v8 setModalPresentationStyle:v15];
    [v8 presentViewController:v12 animated:1 completion:0];
    id v16 = [v12 popoverPresentationController];
    [v16 setBarButtonItem:v7];
    [v16 setPermittedArrowDirections:3];
  }
  else
  {
    os_log_t v12 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[ICDocCamArchiveExporter showActivityVCWithBarButtonItem:presentingVC:url:](v12);
    }
  }
}

+ (void)showExportArchiveFromNote:(id)a3 presentingViewController:(id)a4 presentingBarButtonItem:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[ICDocCamArchiveExporter createZipArchiveOfImagesFromNote:a3];
  [a1 showActivityVCWithBarButtonItem:v8 presentingVC:v9 url:v10];
}

+ (id)createZipArchiveOfImagesFromNote:(id)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [v3 visibleAttachments];
  v5 = [v4 objectsPassingTest:&__block_literal_global_20];
  v6 = [v5 allObjects];

  id v7 = (id)[v6 sortedArrayUsingComparator:&__block_literal_global_27];
  id v8 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v9 = [MEMORY[0x263F08850] defaultManager];
  if ([v6 count])
  {
    id v10 = [v6 firstObject];
    id v11 = [v10 attachmentModel];

    id v47 = v3;
    os_log_t v12 = [v3 title];
    objc_msgSend(v12, "ic_sanitizedFilenameString");
    uint64_t v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

    uint64_t v14 = [(__CFString *)v13 length];
    uint64_t v15 = @"ScanArchive";
    if (v14) {
      uint64_t v15 = v13;
    }
    id v16 = v15;

    v45 = v11;
    id v17 = [v11 generateTemporaryURLWithExtension:@"awks"];
    id v18 = [v17 URLByDeletingLastPathComponent];

    v19 = [v18 URLByAppendingPathComponent:v16 isDirectory:0];

    v20 = v9;
    [v9 removeItemAtURL:v19 error:0];
    v42 = [v19 URLByDeletingLastPathComponent];
    v21 = [v19 URLByDeletingLastPathComponent];
    v44 = v16;
    v22 = [v21 URLByAppendingPathComponent:v16 isDirectory:0];

    uint64_t v43 = [v22 URLByAppendingPathExtension:@"zip"];

    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    v46 = v6;
    id obj = v6;
    uint64_t v23 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          v27 = v8;
          if (*(void *)v53 != v25) {
            objc_enumerationMutation(obj);
          }
          v28 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          v29 = [v28 title];
          v30 = objc_msgSend(v29, "ic_sanitizedFilenameString");
          v31 = v30;
          if (v30)
          {
            id v32 = v30;
          }
          else
          {
            id v32 = [v28 defaultTitle];
          }
          v33 = v32;

          v34 = [v19 URLByAppendingPathComponent:v33 isDirectory:1];
          v35 = objc_msgSend(v34, "ic_uniquedURL");

          [v20 createDirectoryAtURL:v35 withIntermediateDirectories:1 attributes:0 error:0];
          v36 = [a1 archiveGalleryImagesFromGallery:v28 toURL:v35];
          id v8 = v27;
          objc_msgSend(v27, "ic_addObjectsFromNonNilArray:", v36);
        }
        uint64_t v24 = [obj countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v24);
    }

    v37 = (void *)v43;
    v38 = (void *)[objc_alloc(MEMORY[0x263F5AE58]) initWithDestinationURL:v43 baseURL:v42];
    [v38 setUsesCompression:0];
    if (v8)
    {
      id v51 = 0;
      [v38 writeURLs:v8 error:&v51];
      id v39 = v51;
    }
    else
    {
      id v39 = 0;
    }
    id v50 = v39;
    [v38 finish:&v50];
    id v40 = v50;

    v6 = v46;
    id v3 = v47;
    id v9 = v20;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

BOOL __60__ICDocCamArchiveExporter_createZipArchiveOfImagesFromNote___block_invoke(uint64_t a1, void *a2)
{
  return [a2 attachmentType] == 11;
}

uint64_t __60__ICDocCamArchiveExporter_createZipArchiveOfImagesFromNote___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v4 = NSNumber;
  id v5 = a3;
  v6 = objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a2, "rangeInNote"));
  id v7 = NSNumber;
  uint64_t v8 = [v5 rangeInNote];

  id v9 = [v7 numberWithUnsignedInteger:v8];
  uint64_t v10 = [v6 compare:v9];

  return v10;
}

+ (id)createZipArchiveOfImagesFromGalleryAttachment:(id)a3
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 attachmentModel];
  v6 = ICDynamicCast();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((galleryModel) != nil)", "+[ICDocCamArchiveExporter createZipArchiveOfImagesFromGalleryAttachment:]", 1, 0, @"Expected non-nil value for '%s'", "galleryModel");
    id v29 = 0;
    goto LABEL_16;
  }
  id v7 = [v6 generateTemporaryURLWithExtension:@"awks"];
  uint64_t v8 = [v7 URLByDeletingLastPathComponent];

  id v9 = [v4 title];
  objc_msgSend(v9, "ic_sanitizedFilenameString");
  uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v11 = [(__CFString *)v10 length];
  os_log_t v12 = @"ScanArchive";
  if (v11) {
    os_log_t v12 = v10;
  }
  uint64_t v13 = v12;

  uint64_t v14 = [(__CFString *)v13 stringByAppendingPathExtension:@"zip"];

  v33 = (void *)v14;
  uint64_t v15 = [v8 URLByAppendingPathComponent:v14 isDirectory:0];
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v17 = [MEMORY[0x263F08850] defaultManager];
  v36[0] = MEMORY[0x263EF8330];
  v36[1] = 3221225472;
  v36[2] = __73__ICDocCamArchiveExporter_createZipArchiveOfImagesFromGalleryAttachment___block_invoke;
  v36[3] = &unk_2640BB040;
  id v41 = a1;
  id v37 = v6;
  id v18 = v8;
  id v38 = v18;
  id v19 = v17;
  id v39 = v19;
  id v20 = v16;
  id v40 = v20;
  [v37 enumerateSubAttachmentsWithBlock:v36];
  id v21 = objc_alloc(MEMORY[0x263F5AE58]);
  v22 = [NSURL URLWithString:@"not used but not nil"];
  uint64_t v23 = (void *)[v21 initWithDestinationURL:v15 baseURL:v22];

  [v23 setUsesCompression:0];
  [v23 setFlatten:1];
  uint64_t v24 = [v4 title];
  [v23 setFlattenFolderName:v24];

  id v35 = 0;
  [v23 writeURLs:v20 error:&v35];
  id v25 = v35;
  if (v25)
  {
    v26 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      +[ICDocCamArchiveExporter createZipArchiveOfImagesFromGalleryAttachment:]((uint64_t)v25, v26);
    }
  }
  id v34 = 0;
  [v23 finish:&v34];
  id v27 = v34;
  if (v27)
  {
    v28 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      +[ICDocCamArchiveExporter createZipArchiveOfImagesFromGalleryAttachment:]((uint64_t)v27, v28);
    }
  }
  else if (!v25)
  {
    v31 = os_log_create("com.apple.notes", "Export");
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      id v32 = [0 lastPathComponent];
      *(_DWORD *)buf = 138412290;
      uint64_t v43 = v32;
      _os_log_impl(&dword_20BE60000, v31, OS_LOG_TYPE_INFO, "Succesfully wrote doc cam archive to path: %@", buf, 0xCu);
    }
    id v29 = v15;
    goto LABEL_15;
  }
  id v29 = 0;
LABEL_15:

LABEL_16:

  return v29;
}

void __73__ICDocCamArchiveExporter_createZipArchiveOfImagesFromGalleryAttachment___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v17 = a2;
  v6 = objc_msgSend(*(id *)(a1 + 64), "archivableImageForSubAttachent:");
  if (v6)
  {
    id v7 = [*(id *)(a1 + 32) titleForSubAttachment:v17];
    uint64_t v8 = objc_msgSend(v7, "ic_sanitizedFilenameString");

    if (![v8 length])
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Image-%lu", a4 + 1);

      uint64_t v8 = (void *)v9;
    }
    uint64_t v10 = [*(id *)(a1 + 40) URLByAppendingPathComponent:v8 isDirectory:0];
    uint64_t v11 = [v10 URLByAppendingPathExtension:@"png"];

    os_log_t v12 = [v11 URLByDeletingLastPathComponent];
    char v13 = objc_msgSend(v12, "ic_isReachable");

    if ((v13 & 1) == 0)
    {
      uint64_t v14 = *(void **)(a1 + 48);
      uint64_t v15 = [v11 URLByDeletingLastPathComponent];
      [v14 createDirectoryAtURL:v15 withIntermediateDirectories:1 attributes:0 error:0];
    }
    id v16 = objc_msgSend(v6, "ic_PNGDataWithOrientation:", objc_msgSend(v6, "ic_imageOrientation"));
    [v16 writeToURL:v11 atomically:1];

    objc_msgSend(*(id *)(a1 + 56), "ic_addNonNilObject:", v11);
  }
}

+ (id)archiveGalleryImagesFromGallery:(id)a3 toURL:(id)a4
{
  id v6 = a4;
  id v7 = (objc_class *)MEMORY[0x263EFF980];
  id v8 = a3;
  id v9 = objc_alloc_init(v7);
  objc_opt_class();
  uint64_t v10 = [v8 attachmentModel];

  uint64_t v11 = ICDynamicCast();

  if (!v11) {
    objc_msgSend(MEMORY[0x263F5AE60], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((galleryModel) != nil)", "+[ICDocCamArchiveExporter archiveGalleryImagesFromGallery:toURL:]", 1, 0, @"Expected non-nil value for '%s'", "galleryModel");
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  void v18[2] = __65__ICDocCamArchiveExporter_archiveGalleryImagesFromGallery_toURL___block_invoke;
  v18[3] = &unk_2640BB068;
  id v22 = a1;
  id v19 = v11;
  id v20 = v6;
  id v12 = v9;
  id v21 = v12;
  id v13 = v6;
  id v14 = v11;
  [v14 enumerateSubAttachmentsWithBlock:v18];
  uint64_t v15 = v21;
  id v16 = v12;

  return v16;
}

void __65__ICDocCamArchiveExporter_archiveGalleryImagesFromGallery_toURL___block_invoke(id *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v14 = a2;
  id v6 = objc_msgSend(a1[7], "archivableImageForSubAttachent:");
  if (v6)
  {
    id v7 = [a1[4] titleForSubAttachment:v14];
    id v8 = objc_msgSend(v7, "ic_sanitizedFilenameString");

    if (![v8 length])
    {
      uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"Image-%lu", a4 + 1);

      id v8 = (void *)v9;
    }
    uint64_t v10 = [a1[5] URLByAppendingPathComponent:v8 isDirectory:0];
    uint64_t v11 = [v10 URLByAppendingPathExtension:@"png"];

    id v12 = objc_msgSend(v11, "ic_uniquedURL");

    id v13 = objc_msgSend(v6, "ic_PNGDataWithOrientation:", objc_msgSend(v6, "ic_imageOrientation"));
    [v13 writeToURL:v12 atomically:1];

    [a1[6] addObject:v12];
  }
}

+ (id)archivableImageForSubAttachent:(id)a3
{
  id v3 = a3;
  [v3 sizeWidth];
  double v5 = v4;
  [v3 sizeHeight];
  double v7 = v6;
  id v8 = objc_msgSend(v3, "attachmentPreviewImageWithMinSize:scale:", v5, v6, 1.0);
  uint64_t v9 = [v8 orientedImage];
  uint64_t v10 = v9;
  if (!v9 || (([v9 size], v5 == v12) ? (BOOL v13 = v7 == v11) : (BOOL v13 = 0), !v13))
  {
    id v14 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      +[ICDocCamArchiveExporter archivableImageForSubAttachent:](v3, v14);
    }

    uint64_t v15 = [MEMORY[0x263F5B318] imageForSubAttachment:v3 rotateForMacImageGallery:0 allowCached:0];

    uint64_t v10 = (void *)v15;
  }

  return v10;
}

+ (void)showActivityVCWithBarButtonItem:(os_log_t)log presentingVC:url:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20BE60000, log, OS_LOG_TYPE_ERROR, "Tried to create zip archive for gallery but the archive URL is nil", v1, 2u);
}

+ (void)createZipArchiveOfImagesFromGalleryAttachment:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Error finalizing doc cam archive.  %@", (uint8_t *)&v2, 0xCu);
}

+ (void)createZipArchiveOfImagesFromGalleryAttachment:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20BE60000, a2, OS_LOG_TYPE_ERROR, "Error writing doc cam archive.  %@", (uint8_t *)&v2, 0xCu);
}

+ (void)archivableImageForSubAttachent:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 identifier];
  int v4 = 138412290;
  double v5 = v3;
  _os_log_debug_impl(&dword_20BE60000, a2, OS_LOG_TYPE_DEBUG, "Either No image, or incorrect size image for OCR, falling back to creating a fresh image for attachment: %@", (uint8_t *)&v4, 0xCu);
}

@end