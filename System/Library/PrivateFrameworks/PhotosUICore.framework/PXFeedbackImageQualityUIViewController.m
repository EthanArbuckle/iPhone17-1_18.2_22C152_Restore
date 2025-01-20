@interface PXFeedbackImageQualityUIViewController
- (BOOL)shouldContinuePresentingFormAfterFeedback;
- (BOOL)shouldDisplaySecondaryFeedbackButtons;
- (BOOL)wantsCustomFeedbackSection;
- (BOOL)wantsPositiveFeedbackSection;
- (NSArray)assets;
- (NSArray)imageQualityDiagnosticFileURLs;
- (NSDictionary)negativeFeedback;
- (PXFeedbackImageQualityUIViewController)initWithAssets:(id)a3 delegate:(id)a4;
- (PXFeedbackImageQualityUIViewControllerDelegate)delegate;
- (PXFeedbackLikeItOrNotComboUIViewController)feedbackController;
- (UINavigationController)navigationController;
- (id)_captureIDFromURL:(id)a3;
- (id)_captureIDsToCaptureFoldersInDirectory:(id)a3;
- (id)_componentIDForComponent:(int64_t)a3;
- (id)_componentNameForComponent:(int64_t)a3;
- (id)_generateTitleForFeedback:(id)a3 forAssets:(id)a4;
- (id)_generateURLsForAssetsDBGFiles:(id)a3;
- (id)_generateZippedCaptureFoldersForAssets:(id)a3;
- (id)_keywordIDForComponent:(int64_t)a3;
- (id)longTitleText;
- (id)negativeAlchemistFeedbackKeys;
- (id)negativeFeedbackKeys;
- (id)positiveFeedbackKeys;
- (id)viewTitleForRadar;
- (int)_addDirectoryToArchive:(id)a3 withDirName:(id)a4 archive:(archive *)a5;
- (int)_addFileToArchive:(id)a3 withFileName:(id)a4 archive:(archive *)a5;
- (int64_t)_radarComponentForFeedback:(id)a3;
- (void)_archiveFolder:(id)a3 destinationPath:(id)a4;
- (void)_dismissActiveAlertControllerWithCompletion:(id)a3;
- (void)_fileRadarWithAssets:(id)a3 positiveFeedback:(id)a4 negativeFeedback:(id)a5 customFeedback:(id)a6;
- (void)setAssets:(id)a3;
- (void)setFeedbackController:(id)a3;
- (void)setImageQualityDiagnosticFileURLs:(id)a3;
- (void)setNavigationController:(id)a3;
- (void)setNegativeFeedback:(id)a3;
- (void)userDidFinish:(BOOL)a3;
- (void)userSentPositiveFeedback:(id)a3 negativeFeedback:(id)a4 customFeedback:(id)a5;
- (void)viewDidLoad;
@end

@implementation PXFeedbackImageQualityUIViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageQualityDiagnosticFileURLs, 0);
  objc_storeStrong((id *)&self->_feedbackController, 0);
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_storeStrong((id *)&self->_negativeFeedback, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)setImageQualityDiagnosticFileURLs:(id)a3
{
}

- (NSArray)imageQualityDiagnosticFileURLs
{
  return self->_imageQualityDiagnosticFileURLs;
}

- (void)setFeedbackController:(id)a3
{
}

- (PXFeedbackLikeItOrNotComboUIViewController)feedbackController
{
  return self->_feedbackController;
}

- (void)setNavigationController:(id)a3
{
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNegativeFeedback:(id)a3
{
}

- (NSDictionary)negativeFeedback
{
  return self->_negativeFeedback;
}

- (PXFeedbackImageQualityUIViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXFeedbackImageQualityUIViewControllerDelegate *)WeakRetained;
}

- (void)setAssets:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (id)_captureIDsToCaptureFoldersInDirectory:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v20 = 0;
  v6 = [v5 contentsOfDirectoryAtPath:v4 error:&v20];
  id v7 = v20;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PXFeedbackImageQualityUIViewController__captureIDsToCaptureFoldersInDirectory___block_invoke;
  v15[3] = &unk_1E5DB7670;
  id v16 = v4;
  id v17 = v5;
  v18 = self;
  id v9 = v8;
  id v19 = v9;
  id v10 = v5;
  id v11 = v4;
  [v6 enumerateObjectsUsingBlock:v15];
  v12 = v19;
  id v13 = v9;

  return v13;
}

void __81__PXFeedbackImageQualityUIViewController__captureIDsToCaptureFoldersInDirectory___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 stringByAppendingPathComponent:v4];
  v6 = [v4 pathExtension];

  LODWORD(v4) = [v6 isEqualToString:@"capture"];
  if (v4)
  {
    id v7 = [v5 stringByAppendingPathComponent:@"Framework"];
    v8 = [*(id *)(a1 + 40) contentsOfDirectoryAtPath:v7 error:0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __81__PXFeedbackImageQualityUIViewController__captureIDsToCaptureFoldersInDirectory___block_invoke_2;
    v12[3] = &unk_1E5DB7670;
    uint64_t v9 = *(void *)(a1 + 48);
    id v10 = *(void **)(a1 + 56);
    id v13 = v7;
    uint64_t v14 = v9;
    id v15 = v10;
    id v16 = v5;
    id v11 = v7;
    [v8 enumerateObjectsUsingBlock:v12];
  }
}

void __81__PXFeedbackImageQualityUIViewController__captureIDsToCaptureFoldersInDirectory___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id v6 = [*(id *)(a1 + 32) stringByAppendingPathComponent:a2];
  v3 = *(void **)(a1 + 40);
  id v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6];
  v5 = [v3 _captureIDFromURL:v4];

  [*(id *)(a1 + 48) setObject:*(void *)(a1 + 56) forKeyedSubscript:v5];
}

- (id)_captureIDFromURL:(id)a3
{
  CFURLRef v3 = (const __CFURL *)a3;
  id v4 = 0;
  if ([(__CFURL *)v3 checkResourceIsReachableAndReturnError:0])
  {
    v5 = CGImageSourceCreateWithURL(v3, 0);
    id v4 = v5;
    if (v5)
    {
      CFDictionaryRef v6 = CGImageSourceCopyPropertiesAtIndex(v5, 0, 0);
      CFRelease(v4);
      if (v6)
      {
        id v8 = 0;
        [MEMORY[0x1E4F8CC08] readMetadataType:13 fromCGImageProperties:v6 value:&v8 error:0];
        id v4 = (CGImageSource *)v8;
      }
      else
      {
        id v4 = 0;
      }
    }
    else
    {
      CFDictionaryRef v6 = 0;
    }
  }
  return v4;
}

- (int)_addDirectoryToArchive:(id)a3 withDirName:(id)a4 archive:(archive *)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v28 = a4;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v8 = [v7 contentsOfDirectoryAtPath:v6 error:0];

  if ([v8 count])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      v25 = v8;
      uint64_t v12 = *(void *)v31;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v31 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          id v15 = (void *)MEMORY[0x1AD10CB00]();
          char v29 = 0;
          id v16 = [v6 stringByAppendingPathComponent:v14];
          id v17 = [MEMORY[0x1E4F28CB8] defaultManager];
          int v18 = [v17 fileExistsAtPath:v16 isDirectory:&v29];

          if (v18)
          {
            id v19 = [v14 lastPathComponent];
            id v20 = [v28 stringByAppendingPathComponent:v19];

            unsigned int v21 = v29
                ? [(PXFeedbackImageQualityUIViewController *)self _addDirectoryToArchive:v16 withDirName:v20 archive:a5]: [(PXFeedbackImageQualityUIViewController *)self _addFileToArchive:v16 withFileName:v20 archive:a5];
            unsigned int v22 = v21;

            if (v22 == -30)
            {

              int v23 = -30;
              goto LABEL_17;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
        if (v11) {
          continue;
        }
        break;
      }
      int v23 = 0;
LABEL_17:
      id v8 = v25;
    }
    else
    {
      int v23 = 0;
    }
  }
  else
  {
    int v23 = 0;
  }

  return v23;
}

- (int)_addFileToArchive:(id)a3 withFileName:(id)a4 archive:(archive *)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(&v23, 0, sizeof(v23));
  id v8 = v6;
  id v9 = (const char *)[v8 UTF8String];
  if (!v9)
  {
    NSLog(&cfstr_NoFilename.isa);
LABEL_7:
    LODWORD(v12) = -1;
    goto LABEL_8;
  }
  uint64_t v10 = v9;
  stat(v9, &v23);
  if (!archive_entry_new())
  {
    NSLog(&cfstr_ArchiveEntryNe.isa);
    goto LABEL_7;
  }
  archive_entry_copy_stat();
  id v11 = v7;
  [v11 UTF8String];
  archive_entry_set_pathname();
  if (archive_write_header())
  {
    uint64_t v12 = archive_errno();
    uint64_t v13 = [v11 UTF8String];
    uint64_t v14 = archive_error_string();
    NSLog(&cfstr_FailedToWriteH.isa, v13, v12, v14);
    archive_entry_free();
    goto LABEL_8;
  }
  int v16 = open(v10, 0);
  if (v16 == -1)
  {
    id v20 = __error();
    unsigned int v21 = strerror(*v20);
    unsigned int v22 = __error();
    NSLog(&cfstr_ErrorOpeningFi.isa, v8, v21, *v22);
    archive_entry_free();
    goto LABEL_7;
  }
  int v17 = v16;
  ssize_t v18 = read(v16, v24, 0x2000uLL);
  if (v18 < 1)
  {
LABEL_14:
    LODWORD(v12) = 0;
  }
  else
  {
    uint64_t v12 = v18;
    while (1)
    {
      uint64_t v19 = archive_write_data();
      if (v19 != v12) {
        break;
      }
      uint64_t v12 = read(v17, v24, 0x2000uLL);
      if (v12 <= 0) {
        goto LABEL_14;
      }
    }
    NSLog(&cfstr_ErrorWritingFi.isa, v8, v12, v19);
    LODWORD(v12) = archive_errno();
  }
  archive_entry_free();
  close(v17);
LABEL_8:

  return v12;
}

- (void)_archiveFolder:(id)a3 destinationPath:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = archive_write_new();
  archive_write_add_filter_gzip();
  archive_write_set_format_pax();
  id v12 = v6;
  int v9 = open_dprotected_np((const char *)[v12 UTF8String], 514, 3, 0, 416);
  if (v9 < 0) {
    int v9 = open_dprotected_np((const char *)[v12 UTF8String], 514, 2, 0, 416);
  }
  uint64_t v10 = archive_write_open_fd();
  if (v10)
  {
    NSLog(&cfstr_ErrorCreatingA.isa, v12, v10);
    int v9 = -1;
  }
  id v11 = [v7 lastPathComponent];
  [(PXFeedbackImageQualityUIViewController *)self _addDirectoryToArchive:v7 withDirName:v11 archive:v8];

  archive_write_free();
  if ((v9 & 0x80000000) == 0) {
    close(v9);
  }
}

- (id)_generateZippedCaptureFoldersForAssets:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [v4 firstObject];
  id v6 = [v5 photoLibrary];
  id v7 = [v6 photoLibrary];

  id v30 = [MEMORY[0x1E4F1CA48] array];
  if (v7)
  {
    v26 = v7;
    uint64_t v8 = [v7 pathManager];
    uint64_t v9 = [v8 photoDirectoryWithType:4];

    char v29 = (void *)v9;
    uint64_t v10 = [(PXFeedbackImageQualityUIViewController *)self _captureIDsToCaptureFoldersInDirectory:v9];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v27 = v4;
    id obj = v4;
    uint64_t v11 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v32 != v13) {
            objc_enumerationMutation(obj);
          }
          id v15 = [*(id *)(*((void *)&v31 + 1) + 8 * i) mainFileURL];
          int v16 = [(PXFeedbackImageQualityUIViewController *)self _captureIDFromURL:v15];

          int v17 = [v10 objectForKeyedSubscript:v16];

          if (v17)
          {
            ssize_t v18 = [v10 objectForKeyedSubscript:v16];
            uint64_t v19 = [v18 lastPathComponent];

            id v20 = NSTemporaryDirectory();
            unsigned int v21 = [NSString stringWithFormat:@"%@.tar.gz", v19];
            unsigned int v22 = [v20 stringByAppendingString:v21];

            stat v23 = [v29 stringByAppendingPathComponent:v19];
            [(PXFeedbackImageQualityUIViewController *)self _archiveFolder:v23 destinationPath:v22];
            v24 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22];
            [v30 addObject:v24];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v12);
    }

    id v7 = v26;
    id v4 = v27;
  }
  else
  {
    NSLog(&cfstr_NoPhotoLibrary.isa);
  }

  return v30;
}

- (id)_generateURLsForAssetsDBGFiles:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v56;
    uint64_t v8 = @"IMG";
    uint64_t v36 = *(void *)v56;
    do
    {
      uint64_t v9 = 0;
      uint64_t v37 = v6;
      do
      {
        if (*(void *)v56 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v55 + 1) + 8 * v9);
        uint64_t v11 = [v10 fileURLsForDiagnosticFiles];
        if (v11)
        {
          uint64_t v12 = [MEMORY[0x1E4F38F60] assetResourcesForAsset:v10];
          if ([v12 count])
          {
            uint64_t v42 = v9;
            long long v53 = 0u;
            long long v54 = 0u;
            long long v51 = 0u;
            long long v52 = 0u;
            v40 = v12;
            id v13 = v12;
            uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v60 count:16];
            if (v14)
            {
              uint64_t v15 = v14;
              uint64_t v16 = *(void *)v52;
              while (2)
              {
                for (uint64_t i = 0; i != v15; ++i)
                {
                  if (*(void *)v52 != v16) {
                    objc_enumerationMutation(v13);
                  }
                  ssize_t v18 = [*(id *)(*((void *)&v51 + 1) + 8 * i) originalFilename];
                  if ([v18 hasPrefix:v8])
                  {
                    v45 = [v18 stringByDeletingPathExtension];

                    goto LABEL_18;
                  }
                }
                uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v60 count:16];
                if (v15) {
                  continue;
                }
                break;
              }
            }
            v45 = &stru_1F00B0030;
LABEL_18:

            uint64_t v19 = [v10 uuid];
            id v20 = objc_opt_new();
            unsigned int v21 = NSTemporaryDirectory();
            v39 = (void *)v19;
            uint64_t v22 = [v21 stringByAppendingPathComponent:v19];

            v43 = (void *)v22;
            v44 = v20;
            if (([v20 createDirectoryAtPath:v22 withIntermediateDirectories:1 attributes:0 error:0] & 1) == 0)NSLog(&cfstr_FailedToCreate_6.isa); {
            long long v49 = 0u;
            }
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            v41 = v11;
            id v46 = v11;
            uint64_t v23 = [v46 countByEnumeratingWithState:&v47 objects:v59 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v48;
              do
              {
                for (uint64_t j = 0; j != v24; ++j)
                {
                  if (*(void *)v48 != v25) {
                    objc_enumerationMutation(v46);
                  }
                  id v27 = *(void **)(*((void *)&v47 + 1) + 8 * j);
                  id v28 = [v27 lastPathComponent];
                  if ([v28 hasPrefix:v8])
                  {
                    [v4 addObject:v27];
                  }
                  else
                  {
                    char v29 = v8;
                    id v30 = (void *)MEMORY[0x1E4F1CB10];
                    long long v31 = [NSString stringWithFormat:@"%@_%@", v45, v28];
                    [v43 stringByAppendingPathComponent:v31];
                    v33 = long long v32 = v4;
                    long long v34 = [v30 fileURLWithPath:v33];

                    id v4 = v32;
                    [v44 copyItemAtURL:v27 toURL:v34 error:0];
                    [v32 addObject:v34];

                    uint64_t v8 = v29;
                  }
                }
                uint64_t v24 = [v46 countByEnumeratingWithState:&v47 objects:v59 count:16];
              }
              while (v24);
            }

            uint64_t v7 = v36;
            uint64_t v6 = v37;
            uint64_t v11 = v41;
            uint64_t v9 = v42;
            uint64_t v12 = v40;
          }
          else
          {
            [v4 addObjectsFromArray:v11];
          }
        }
        ++v9;
      }
      while (v9 != v6);
      uint64_t v6 = [obj countByEnumeratingWithState:&v55 objects:v61 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_keywordIDForComponent:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) > 4) {
    return 0;
  }
  else {
    return off_1E5DB76D0[a3 - 4];
  }
}

- (id)_componentNameForComponent:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 7) {
    return @"Camera Image Feedback";
  }
  else {
    return off_1E5DB7690[a3 - 1];
  }
}

- (id)_componentIDForComponent:(int64_t)a3
{
  switch(a3)
  {
    case 1:
      id v3 = @"863870";
      break;
    case 2:
      id v3 = @"1576982";
      break;
    case 3:
      id v3 = @"819310";
      break;
    case 4:
      id v3 = @"1080636";
      break;
    case 5:
      id v3 = @"1106155";
      break;
    case 6:
      id v3 = @"1571907";
      goto LABEL_11;
    case 7:
      id v3 = @"1104679";
      goto LABEL_11;
    case 8:
      id v3 = @"1579308";
LABEL_11:
      id v4 = v3;
      break;
    default:
      id v3 = @"852230";
      break;
  }
  return v3;
}

- (int64_t)_radarComponentForFeedback:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __69__PXFeedbackImageQualityUIViewController__radarComponentForFeedback___block_invoke;
  v11[3] = &unk_1E5DD2A90;
  id v6 = v5;
  id v12 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v11];

  uint64_t v7 = [v6 count];
  int64_t v8 = v7;
  if (v7)
  {
    if (v7 == 1)
    {
      uint64_t v9 = [v6 anyObject];
      int64_t v8 = [v9 integerValue];
    }
    else if ([v6 containsObject:&unk_1F02D7330])
    {
      int64_t v8 = 7;
    }
    else
    {
      int64_t v8 = 0;
    }
  }

  return v8;
}

void __69__PXFeedbackImageQualityUIViewController__radarComponentForFeedback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  int v5 = [a3 isEqual:MEMORY[0x1E4F1CC38]];
  id v6 = v9;
  if (v5)
  {
    if (([v9 isEqual:kPXFeedbackImageQualityBadColorKey] & 1) != 0
      || ([v9 isEqual:kPXFeedbackImageQualityBadFocusKey] & 1) != 0
      || ([v9 isEqual:kPXFeedbackImageQualityBadContrastKey] & 1) != 0
      || ([v9 isEqual:kPXFeedbackImageQualityTooNoisyKey] & 1) != 0
      || ([v9 isEqual:kPXFeedbackImageQualityBlurryKey] & 1) != 0
      || ([v9 isEqual:kPXFeedbackImageQualityBadPortraitBlurKey] & 1) != 0)
    {
      uint64_t v7 = &unk_1F02D72B8;
LABEL_9:
      [*(id *)(a1 + 32) addObject:v7];
      id v6 = v9;
      goto LABEL_10;
    }
    if (([v9 isEqual:kPXFeedbackImageQualityBadHDRKey] & 1) != 0
      || ([v9 isEqual:kPXFeedbackImageQualityBadFlashKey] & 1) != 0
      || ([v9 isEqual:kPXFeedbackImageQualityShortLivePhotoKey] & 1) != 0
      || ([v9 isEqual:kPXFeedbackImageQualityMuteLivePhotoKey] & 1) != 0)
    {
      uint64_t v7 = &unk_1F02D72D0;
      goto LABEL_9;
    }
    if (([v9 isEqualToString:kPXFeedbackImageQualitySemanticDevelopmentBadEffectKey] & 1) != 0
      || ([v9 isEqualToString:kPXFeedbackImageQualitySemanticDevelopmentNoEffectKey] & 1) != 0)
    {
      uint64_t v7 = &unk_1F02D72E8;
      goto LABEL_9;
    }
    if (([v9 isEqualToString:kPXFeedbackImageQualityBadTrackingCPVKey] & 1) != 0
      || ([v9 isEqualToString:kPXFeedbackImageQualityBadCinematographyCPVKey] & 1) != 0
      || ([v9 isEqualToString:kPXFeedbackImageQualityBadRenderingCPVKey] & 1) != 0
      || ([v9 isEqualToString:kPXFeedbackImageQualityHardToChangeCPVKey] & 1) != 0
      || ([v9 isEqualToString:kPXFeedbackImageQualityGenericBadCPVKey] & 1) != 0)
    {
      uint64_t v7 = &unk_1F02D7300;
      goto LABEL_9;
    }
    if (([v9 isEqualToString:kPXFeedbackProvideOriginalAndEdit] & 1) != 0
      || ([v9 isEqualToString:kPXFeedbackProvideOriginalAndEditSysdiagnose] & 1) != 0)
    {
      uint64_t v7 = &unk_1F02D7318;
      goto LABEL_9;
    }
    if (([v9 isEqual:kPXFeedbackImageQualityUncomfortableStereoViewingKey] & 1) != 0
      || (v8 = [v9 isEqual:kPXFeedbackImageQualityMotionUncomfortableKey], id v6 = v9, v8))
    {
      uint64_t v7 = &unk_1F02D7330;
      goto LABEL_9;
    }
  }
LABEL_10:
}

- (id)_generateTitleForFeedback:(id)a3 forAssets:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  uint64_t v7 = [NSString stringWithFormat:@"%@ I took a photo and ", @"IQF :"];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v27 != v10) {
          objc_enumerationMutation(v8);
        }
        if ([*(id *)(*((void *)&v26 + 1) + 8 * i) mediaType] == 2)
        {
          uint64_t v12 = [NSString stringWithFormat:@"%@ I took a video and ", @"IQF :"];

          uint64_t v7 = (void *)v12;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v9);
  }

  [v6 appendString:v7];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__PXFeedbackImageQualityUIViewController__generateTitleForFeedback_forAssets___block_invoke;
  v19[3] = &unk_1E5DB7648;
  id v13 = v6;
  id v20 = v13;
  unsigned int v21 = &v22;
  [v18 enumerateKeysAndObjectsUsingBlock:v19];
  if (*((unsigned char *)v23 + 24))
  {
    uint64_t v14 = NSString;
    uint64_t v15 = objc_msgSend(v13, "substringToIndex:", objc_msgSend(v13, "length") - 2);
    uint64_t v16 = [v14 stringWithString:v15];
  }
  else
  {
    [v13 appendString:@"it wasn't what I expected"];
    uint64_t v16 = [NSString stringWithString:v13];
    uint64_t v15 = v7;
  }

  _Block_object_dispose(&v22, 8);
  return v16;
}

void __78__PXFeedbackImageQualityUIViewController__generateTitleForFeedback_forAssets___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  if ([a3 isEqual:MEMORY[0x1E4F1CC38]])
  {
    id v5 = PXLocalizedStringFromTable(v6, @"PXFeedbackCollection");
    [*(id *)(a1 + 32) appendFormat:@"%@, ", v5];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)_dismissActiveAlertControllerWithCompletion:(id)a3
{
  id v5 = a3;
  id v4 = [(PXFeedbackImageQualityUIViewController *)self presentedViewController];
  if (v4) {
    [(PXFeedbackImageQualityUIViewController *)self dismissViewControllerAnimated:0 completion:v5];
  }
}

- (void)_fileRadarWithAssets:(id)a3 positiveFeedback:(id)a4 negativeFeedback:(id)a5 customFeedback:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v32 = a4;
  id v11 = a5;
  id v35 = a6;
  [(PXFeedbackImageQualityUIViewController *)self setAssets:v10];
  long long v33 = v11;
  [(PXFeedbackImageQualityUIViewController *)self setNegativeFeedback:v11];
  [(PXFeedbackImageQualityUIViewController *)self setImageQualityDiagnosticFileURLs:0];
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v63 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v60;
    while (2)
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v60 != v14) {
          objc_enumerationMutation(v12);
        }
        if ([*(id *)(*((void *)&v59 + 1) + 8 * v15) isSpatialMedia])
        {
          int v16 = 1;
          goto LABEL_11;
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  int v16 = 0;
LABEL_11:

  v38 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Collecting data for radar..." message:0 preferredStyle:1];
  long long v34 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:0 handler:0];
  [v38 addAction:v34];
  [(PXFeedbackImageQualityUIViewController *)self presentViewController:v38 animated:1 completion:0];
  uint64_t v36 = [(PXFeedbackImageQualityUIViewController *)self _generateTitleForFeedback:self->_negativeFeedback forAssets:v12];
  if (v16)
  {
    uint64_t v17 = [@"[Spatial] " stringByAppendingString:v36];

    uint64_t v36 = (void *)v17;
  }
  uint64_t v53 = 0;
  long long v54 = &v53;
  uint64_t v55 = 0x3032000000;
  long long v56 = __Block_byref_object_copy__81556;
  long long v57 = __Block_byref_object_dispose__81557;
  id v58 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [(id)v54[5] appendString:@"This radar was filed using Photos' internal Tap-to-Radar for Image Quality. If you believe this radar is not in the correct component, please route to Camera Image Feedback | iOS. \n \n"];
  if (v16) {
    [(id)v54[5] appendString:@"Observed in immersive mode (Y/N)? \n \n"];
  }
  [(id)v54[5] appendString:@"— Please add any additional comments here —\n"];
  [(id)v54[5] appendFormat:@"%@\n \n", v35];
  [(id)v54[5] appendString:@"— Image Quality Feedback —\n"];
  v51[0] = 0;
  v51[1] = v51;
  v51[2] = 0x2020000000;
  char v52 = 0;
  id v18 = [(PXFeedbackImageQualityUIViewController *)self negativeFeedback];
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke;
  v50[3] = &unk_1E5DCB318;
  v50[4] = v51;
  v50[5] = &v53;
  [v18 enumerateKeysAndObjectsUsingBlock:v50];

  uint64_t v19 = [(PXFeedbackImageQualityUIViewController *)self _generateURLsForAssetsDBGFiles:self->_assets];
  id v20 = [(PXFeedbackImageQualityUIViewController *)self _generateZippedCaptureFoldersForAssets:self->_assets];
  objc_initWeak(&location, self);
  int64_t v21 = [(PXFeedbackImageQualityUIViewController *)self _radarComponentForFeedback:self->_negativeFeedback];
  uint64_t v22 = [(PXFeedbackImageQualityUIViewController *)self _componentNameForComponent:v21];
  uint64_t v23 = [(PXFeedbackImageQualityUIViewController *)self _componentIDForComponent:v21];
  uint64_t v24 = [(PXFeedbackImageQualityUIViewController *)self _keywordIDForComponent:v21];
  char v25 = (void *)MEMORY[0x1E4F38EB8];
  assets = self->_assets;
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_2;
  v39[3] = &unk_1E5DB7620;
  objc_copyWeak(&v48, &location);
  id v27 = v19;
  id v40 = v27;
  id v28 = v20;
  id v41 = v28;
  id v37 = v36;
  id v42 = v37;
  id v46 = &v53;
  id v29 = v23;
  id v43 = v29;
  id v30 = v22;
  id v44 = v30;
  id v31 = v24;
  id v45 = v31;
  long long v47 = v51;
  objc_msgSend(v25, "px_generateResourceFilesForAssets:completionHandler:", assets, v39);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&location);

  _Block_object_dispose(v51, 8);
  _Block_object_dispose(&v53, 8);
}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  int v5 = [a3 isEqual:MEMORY[0x1E4F1CC38]];
  id v6 = v8;
  if (v5)
  {
    uint64_t v7 = PXLocalizedStringFromTable(v8, @"PXFeedbackCollection");
    if ([v8 isEqualToString:kPXFeedbackProvideOriginalAndEditSysdiagnose]) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    }
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) appendFormat:@"%@\n", v7];

    id v6 = v8;
  }
}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_3;
  v9[3] = &unk_1E5DB75F8;
  objc_copyWeak(&v19, (id *)(a1 + 96));
  id v10 = v3;
  id v11 = *(id *)(a1 + 32);
  id v12 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 80);
  id v13 = v4;
  uint64_t v17 = v5;
  id v14 = *(id *)(a1 + 56);
  id v15 = *(id *)(a1 + 64);
  id v6 = *(id *)(a1 + 72);
  uint64_t v7 = *(void *)(a1 + 88);
  id v16 = v6;
  uint64_t v18 = v7;
  id v8 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v9);

  objc_destroyWeak(&v19);
}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 104);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 104));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_4;
  v8[3] = &unk_1E5DB75F8;
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 88);
  id v12 = v4;
  uint64_t v16 = v5;
  id v13 = *(id *)(a1 + 64);
  id v14 = *(id *)(a1 + 72);
  id v6 = *(id *)(a1 + 80);
  uint64_t v7 = *(void *)(a1 + 96);
  id v15 = v6;
  uint64_t v17 = v7;
  objc_copyWeak(&v18, v2);
  [WeakRetained _dismissActiveAlertControllerWithCompletion:v8];

  objc_destroyWeak(&v18);
}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_4(uint64_t a1)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) arrayByAddingObjectsFromArray:*(void *)(a1 + 40)];
  id v3 = [v2 arrayByAddingObjectsFromArray:*(void *)(a1 + 48)];

  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40);
  uint64_t v5 = *(void *)(a1 + 56);
  uint64_t v11 = *(void *)(a1 + 64);
  uint64_t v6 = *(void *)(a1 + 80);
  uint64_t v12 = *(void *)(a1 + 72);
  uint64_t v7 = *(void *)(*(void *)(a1 + 96) + 8);
  int v8 = *(unsigned __int8 *)(v7 + 24);
  if (*(unsigned char *)(v7 + 24))
  {
    v15[0] = @"com.apple.PhotoLibraryServices.PhotosDiagnostics";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  }
  else
  {
    id v9 = 0;
  }
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_5;
  v13[3] = &unk_1E5DCE660;
  objc_copyWeak(&v14, (id *)(a1 + 104));
  BYTE1(v10) = 1;
  LOBYTE(v10) = v8 != 0;
  +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", v5, v4, @"Other Bug", v11, v12, @"iOS", v6, 0, v3, v10, v9, v13);
  if (v8) {

  }
  objc_destroyWeak(&v14);
}

void __112__PXFeedbackImageQualityUIViewController__fileRadarWithAssets_positiveFeedback_negativeFeedback_customFeedback___block_invoke_5(uint64_t a1, uint64_t a2)
{
  id v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = [WeakRetained delegate];
  id v5 = objc_loadWeakRetained(v3);
  [v4 feedbackImageQualityUIViewController:v5 didFinish:a2];
}

- (void)userDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXFeedbackImageQualityUIViewController *)self delegate];
  [v5 feedbackImageQualityUIViewController:self didFinish:v3];
}

- (BOOL)wantsCustomFeedbackSection
{
  return 1;
}

- (BOOL)wantsPositiveFeedbackSection
{
  return 0;
}

- (BOOL)shouldContinuePresentingFormAfterFeedback
{
  return 1;
}

- (void)userSentPositiveFeedback:(id)a3 negativeFeedback:(id)a4 customFeedback:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PXFeedbackImageQualityUIViewController *)self assets];
  [(PXFeedbackImageQualityUIViewController *)self _fileRadarWithAssets:v11 positiveFeedback:v10 negativeFeedback:v9 customFeedback:v8];
}

- (id)negativeAlchemistFeedbackKeys
{
  return +[PXFeedbackEntry negativeAlchemistFeedbackForImageQualityKeys];
}

- (id)negativeFeedbackKeys
{
  return +[PXFeedbackEntry negativeFeedbackForImageQualityKeys];
}

- (id)positiveFeedbackKeys
{
  return +[PXFeedbackEntry positiveFeedbackForImageQualityKeys];
}

- (BOOL)shouldDisplaySecondaryFeedbackButtons
{
  return 0;
}

- (id)viewTitleForRadar
{
  return @"Image Quality Feedback";
}

- (id)longTitleText
{
  return PXLocalizedStringFromTable(@"FeedbackLikeItOrNotViewController.longTitle.ImageQuality", @"PXFeedbackCollection");
}

- (void)viewDidLoad
{
  v28.receiver = self;
  v28.super_class = (Class)PXFeedbackImageQualityUIViewController;
  [(PXFeedbackImageQualityUIViewController *)&v28 viewDidLoad];
  id v3 = objc_alloc_init(MEMORY[0x1E4FB19E8]);
  [(PXFeedbackImageQualityUIViewController *)self setNavigationController:v3];

  uint64_t v4 = [(PXFeedbackImageQualityUIViewController *)self navigationController];
  [(PXFeedbackImageQualityUIViewController *)self addChildViewController:v4];

  id v5 = [(PXFeedbackImageQualityUIViewController *)self view];
  uint64_t v6 = [(PXFeedbackImageQualityUIViewController *)self navigationController];
  uint64_t v7 = [v6 view];
  [v5 addSubview:v7];

  id v8 = [(PXFeedbackImageQualityUIViewController *)self view];
  [v8 bounds];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  uint64_t v17 = [(PXFeedbackImageQualityUIViewController *)self navigationController];
  id v18 = [v17 view];
  objc_msgSend(v18, "setFrame:", v10, v12, v14, v16);

  id v19 = [(PXFeedbackImageQualityUIViewController *)self navigationController];
  id v20 = [v19 view];
  [v20 setAutoresizingMask:18];

  int64_t v21 = [(PXFeedbackImageQualityUIViewController *)self navigationController];
  [v21 didMoveToParentViewController:self];

  uint64_t v22 = [(PXFeedbackImageQualityUIViewController *)self navigationController];
  [v22 setToolbarHidden:0];

  uint64_t v23 = [PXFeedbackFormUIViewController alloc];
  uint64_t v24 = [(PXFeedbackImageQualityUIViewController *)self positiveFeedbackKeys];
  char v25 = [(PXFeedbackImageQualityUIViewController *)self negativeFeedbackKeys];
  long long v26 = [(PXFeedbackFormUIViewController *)v23 initWithDelegate:self positiveKeys:v24 negativeKeys:v25 wantsCustomFeedbackSection:1];

  id v27 = [(PXFeedbackImageQualityUIViewController *)self navigationController];
  [v27 pushViewController:v26 animated:1];
}

- (PXFeedbackImageQualityUIViewController)initWithAssets:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFeedbackImageQualityUIViewController;
  double v9 = [(PXFeedbackImageQualityUIViewController *)&v12 init];
  double v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assets, a3);
    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

@end