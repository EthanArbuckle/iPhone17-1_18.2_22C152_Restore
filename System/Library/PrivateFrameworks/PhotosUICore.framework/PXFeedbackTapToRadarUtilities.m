@interface PXFeedbackTapToRadarUtilities
+ (NSString)defaultDescription;
+ (NSString)defaultTitlePrefix;
+ (NSString)internalReleaseAgreement;
+ (NSString)internalReleaseAgreementTitle;
+ (NSString)summaryDescription;
+ (id)_tempDirectoryURL;
+ (id)alertControllerWithInternalReleaseAgreementAndCompletion:(id)a3;
+ (id)alertControllerWithPrivacyTitle:(id)a3 message:(id)a4 completion:(id)a5;
+ (id)attachmentURLForDiagnosticDictionaries:(id)a3 descriptionName:(id)a4;
+ (id)captureScreenshot;
+ (id)cloneAsset:(id)a3 resourceType:(int64_t)a4 toDirectory:(id)a5;
+ (id)detailedDebugDescriptionFileForAsset:(id)a3;
+ (id)imageFileURLForAsset:(id)a3;
+ (id)thumbnailFileURLForAsset:(id)a3;
+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 classification:(id)a5 componentID:(id)a6 componentName:(id)a7 componentVersion:(id)a8 keyword:(id)a9 attachmentURLs:(id)a10 includeSysDiagnose:(BOOL)a11 completionHandler:(id)a12;
+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 classification:(id)a5 componentID:(id)a6 componentName:(id)a7 componentVersion:(id)a8 keyword:(id)a9 screenshotURLs:(id)a10 attachmentURLs:(id)a11 includeSysDiagnose:(BOOL)a12 includeInternalRelease:(BOOL)a13 additionalExtensionIdentifiers:(id)a14 completionHandler:(id)a15;
+ (void)presentTermsAndConditionsForUIViewController:(id)a3 completion:(id)a4;
@end

@implementation PXFeedbackTapToRadarUtilities

+ (id)cloneAsset:(id)a3 resourceType:(int64_t)a4 toDirectory:(id)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  v9 = [MEMORY[0x1E4F38F60] assetResourcesForAsset:v7];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v45;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v45 != v11) {
          objc_enumerationMutation(v9);
        }
        v13 = *(void **)(*((void *)&v44 + 1) + 8 * i);
        if ([v13 type] == a4)
        {
          id v14 = v13;
          goto LABEL_11;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v44 objects:v48 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  uint64_t v38 = 0;
  v39 = &v38;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__191879;
  v42 = __Block_byref_object_dispose__191880;
  id v43 = 0;
  if (v14)
  {
    v15 = (void *)MEMORY[0x1AD10CB00]();
    v16 = [MEMORY[0x1E4F29128] UUID];
    v17 = [v16 UUIDString];
    v18 = [v14 originalFilename];
    v19 = [v18 pathExtension];
    v20 = [v17 stringByAppendingPathExtension:v19];

    uint64_t v21 = [v8 URLByAppendingPathComponent:v20];
    v22 = (void *)v39[5];
    v39[5] = v21;

    id v23 = objc_alloc_init(MEMORY[0x1E4F38F98]);
    [v23 setNetworkAccessAllowed:1];
    v24 = [MEMORY[0x1E4F38F78] defaultManager];
    dispatch_semaphore_t v25 = dispatch_semaphore_create(0);
    v36[0] = 0;
    v36[1] = v36;
    v36[2] = 0x3032000000;
    v36[3] = __Block_byref_object_copy__191879;
    v36[4] = __Block_byref_object_dispose__191880;
    id v37 = 0;
    uint64_t v26 = v39[5];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __69__PXFeedbackTapToRadarUtilities_cloneAsset_resourceType_toDirectory___block_invoke;
    v31[3] = &unk_1E5DC3760;
    v34 = &v38;
    id v32 = v8;
    v35 = v36;
    v27 = v25;
    v33 = v27;
    [v24 writeDataForAssetResource:v14 toFile:v26 options:v23 completionHandler:v31];
    dispatch_semaphore_wait(v27, 0xFFFFFFFFFFFFFFFFLL);

    _Block_object_dispose(v36, 8);
    v28 = (void *)v39[5];
  }
  else
  {
    v28 = 0;
  }
  id v29 = v28;
  _Block_object_dispose(&v38, 8);

  return v29;
}

void __69__PXFeedbackTapToRadarUtilities_cloneAsset_resourceType_toDirectory___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a2);
    v5 = PLUIGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
      int v9 = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_ERROR, "Failed to write asset data to URL: %@, error: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = [getDEUtilsClass() copyPath:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) toDestinationDir:*(void *)(a1 + 32) zipped:1];
    if (v7)
    {
      v5 = v7;
      [getDEUtilsClass() removeFile:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), v5);
    }
    else
    {
      id v8 = PLUIGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1A9AE7000, v8, OS_LOG_TYPE_ERROR, "Failed to zip the asset, attaching unzipped", (uint8_t *)&v9, 2u);
      }

      v5 = 0;
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

+ (id)detailedDebugDescriptionFileForAsset:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v21 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v21);
    v22 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v18 handleFailureInMethod:a2, a1, @"PXFeedbackTapToRadarUtilities.m", 402, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v20, v22 object file lineNumber description];
  }
  else
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    [v18 handleFailureInMethod:a2, a1, @"PXFeedbackTapToRadarUtilities.m", 402, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v20 object file lineNumber description];
  }

LABEL_3:
  uint64_t v6 = NSString;
  uint64_t v7 = [v5 uuid];
  id v8 = [v6 stringWithFormat:@"Asset-Details-Debug-%@.log", v7];

  int v9 = NSTemporaryDirectory();
  uint64_t v10 = [v9 stringByAppendingPathComponent:v8];

  __int16 v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
  id v12 = [v5 photoLibrary];
  uint64_t v13 = [v12 photoLibrary];
  id v14 = [v5 detailedDebugDescriptionInLibrary:v13];

  id v23 = 0;
  LOBYTE(v13) = [v14 writeToURL:v11 atomically:1 encoding:4 error:&v23];
  id v15 = v23;
  if ((v13 & 1) == 0)
  {
    v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      dispatch_semaphore_t v25 = v11;
      __int16 v26 = 2112;
      id v27 = v15;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Failed to save asset details debug file at path: %@, error: %@", buf, 0x16u);
    }

    __int16 v11 = 0;
  }

  return v11;
}

+ (id)_tempDirectoryURL
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F29128] UUID];
  v3 = [v2 UUIDString];

  id v4 = (void *)MEMORY[0x1E4F1CB10];
  id v5 = NSTemporaryDirectory();
  uint64_t v6 = [v5 stringByAppendingPathComponent:@"photosradarfeedback"];
  uint64_t v7 = [v6 stringByAppendingPathComponent:v3];
  id v8 = [v4 fileURLWithPath:v7 isDirectory:1];

  int v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  LOBYTE(v7) = [v9 createDirectoryAtURL:v8 withIntermediateDirectories:1 attributes:0 error:&v15];
  id v10 = v15;

  if (v7)
  {
    id v11 = v8;
  }
  else
  {
    id v12 = PLUIGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = [v8 path];
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_ERROR, "Failed to create directory at path: %@", buf, 0xCu);
    }
    id v11 = 0;
  }

  return v11;
}

+ (NSString)defaultDescription
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [v2 appendString:@"— Summary —\n"];
  [v2 appendString:@"Recap the problem title and/or include more descriptive summary information.\n\n"];
  [v2 appendString:@"— Logging instructions —\n"];
  [v2 appendString:@"* For UI issues, please include a screenshot and/or screen recording\n"];
  [v2 appendString:@"* For all other issues, verify that Photos Diagnostics are being captured for this Radar.\n\n"];
  [v2 appendString:@"— Steps to reproduce —\n"];
  [v2 appendString:@"0. What device and what build\n"];
  [v2 appendString:@"1. Setup or prep work\n"];
  [v2 appendString:@"2. Include explicit and accurate steps to reproduce. Do not include extraneous or irrelevant steps.\n\n"];
  [v2 appendString:@"— Observed results —\n"];
  [v2 appendString:@"Describe the results you observed and how they differed from what you expected. Please also indicate the timestamp from when you encountered the issue.\n\n"];
  [v2 appendString:@"— Regression information —\n"];
  [v2 appendString:@"Does it reproduce on a public OS release? If so, please provide the OS version.\n"];
  [v2 appendString:@"Does it reproduce on a previous internal build? If so, please provide the build number.\n\n\n"];
  return (NSString *)v2;
}

+ (id)thumbnailFileURLForAsset:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    id v32 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v32);
    v33 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v29 handleFailureInMethod:a2, a1, @"PXFeedbackTapToRadarUtilities.m", 323, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v31, v33 object file lineNumber description];
  }
  else
  {
    id v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = (objc_class *)objc_opt_class();
    v31 = NSStringFromClass(v30);
    [v29 handleFailureInMethod:a2, a1, @"PXFeedbackTapToRadarUtilities.m", 323, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v31 object file lineNumber description];
  }

LABEL_3:
  [MEMORY[0x1E4F38F60] assetResourcesForAsset:v5 includeDerivatives:1];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
LABEL_5:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v36 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v35 + 1) + 8 * v10);
      if ([v11 type] == 102) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v41 count:16];
        if (v8) {
          goto LABEL_5;
        }
        goto LABEL_11;
      }
    }
    id v12 = [v11 privateFileURL];

    if (!v12) {
      goto LABEL_15;
    }
    uint64_t v13 = NSString;
    id v14 = [v5 uuid];
    id v15 = [v12 pathExtension];
    v16 = [v13 stringWithFormat:@"thumbnailAsset-%@.%@", v14, v15];

    v17 = NSTemporaryDirectory();
    uint64_t v18 = [v17 stringByAppendingPathComponent:v16];

    v19 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v18];
    v20 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v21 = [v20 fileExistsAtPath:v18];

    if (v21)
    {
      id v22 = v19;
    }
    else
    {
      v24 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v34 = 0;
      int v25 = [v24 copyItemAtURL:v12 toURL:v19 error:&v34];
      id v26 = v34;

      if (v25)
      {
        id v22 = v19;
      }
      else
      {
        id v22 = v12;
        id v27 = PLUIGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v40 = v26;
          _os_log_impl(&dword_1A9AE7000, v27, OS_LOG_TYPE_ERROR, "Failed to copy asset thumbnail to new location with error: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
LABEL_11:

LABEL_15:
    v16 = PLUIGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      id v23 = [v5 uuid];
      *(_DWORD *)buf = 138412290;
      id v40 = v23;
      _os_log_impl(&dword_1A9AE7000, v16, OS_LOG_TYPE_ERROR, "Failed to find asset thumbnail for asset: %@", buf, 0xCu);
    }
    id v12 = 0;
    id v22 = 0;
  }

  return v22;
}

+ (id)imageFileURLForAsset:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    id v22 = (objc_class *)objc_opt_class();
    int v21 = NSStringFromClass(v22);
    id v23 = objc_msgSend(v5, "px_descriptionForAssertionMessage");
    [v19 handleFailureInMethod:a2, a1, @"PXFeedbackTapToRadarUtilities.m", 291, @"%@ should be an instance inheriting from %@, but it is %@", @"asset", v21, v23 object file lineNumber description];
  }
  else
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    v20 = (objc_class *)objc_opt_class();
    int v21 = NSStringFromClass(v20);
    [v19 handleFailureInMethod:a2, a1, @"PXFeedbackTapToRadarUtilities.m", 291, @"%@ should be an instance inheriting from %@, but it is nil", @"asset", v21 object file lineNumber description];
  }

LABEL_3:
  id v6 = NSTemporaryDirectory();
  uint64_t v7 = NSString;
  uint64_t v8 = [v5 uuid];
  uint64_t v9 = [v7 stringWithFormat:@"asset-%@.png", v8];
  uint64_t v10 = [v6 stringByAppendingPathComponent:v9];

  id v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v10];
  id v12 = objc_alloc_init(MEMORY[0x1E4F390D8]);
  [v12 setDeliveryMode:1];
  [v12 setNetworkAccessAllowed:1];
  [v12 setSynchronous:1];
  [v12 setVersion:0];
  [v12 setResizeMode:1];
  uint64_t v26 = 0;
  id v27 = &v26;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__191879;
  v30 = __Block_byref_object_dispose__191880;
  id v31 = 0;
  uint64_t v13 = [MEMORY[0x1E4F390D0] defaultManager];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __54__PXFeedbackTapToRadarUtilities_imageFileURLForAsset___block_invoke;
  v25[3] = &unk_1E5DD00D8;
  v25[4] = &v26;
  objc_msgSend(v13, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v5, 0, v12, v25, 1024.0, 1024.0);

  id v14 = (UIImage *)v27[5];
  if (v14)
  {
    id v15 = UIImagePNGRepresentation(v14);
    char v16 = [v15 writeToURL:v11 atomically:1];

    if (v16) {
      goto LABEL_11;
    }
    v17 = PLUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
LABEL_9:
      _os_log_impl(&dword_1A9AE7000, v17, OS_LOG_TYPE_ERROR, "Failed to save asset original image", buf, 2u);
    }
  }
  else
  {
    v17 = PLUIGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      goto LABEL_9;
    }
  }

  id v11 = 0;
LABEL_11:
  _Block_object_dispose(&v26, 8);

  return v11;
}

void __54__PXFeedbackTapToRadarUtilities_imageFileURLForAsset___block_invoke(uint64_t a1, void *a2)
{
}

+ (NSString)defaultTitlePrefix
{
  id v2 = (void *)MGCopyAnswer();
  v3 = [v2 stringByReplacingOccurrencesOfString:@"AP" withString:&stru_1F00B0030];

  id v4 = (void *)MGCopyAnswer();
  id v5 = [NSString stringWithFormat:@"%@/%@: ", v3, v4];

  return (NSString *)v5;
}

+ (id)captureScreenshot
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:a1 file:@"PXFeedbackTapToRadarUtilities.m" lineNumber:259 description:@"expected main thread"];
  }
  id v4 = [MEMORY[0x1E4FB1BA8] mainScreen];
  id v5 = [v4 snapshotViewAfterScreenUpdates:0];

  [v5 frame];
  v26.width = v6;
  v26.height = v7;
  UIGraphicsBeginImageContextWithOptions(v26, 1, 0.0);
  [v5 bounds];
  objc_msgSend(v5, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
  UIGraphicsGetImageFromCurrentImageContext();
  uint64_t v8 = (UIImage *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  uint64_t v9 = UIImagePNGRepresentation(v8);
  uint64_t v10 = NSTemporaryDirectory();
  id v11 = [v10 stringByAppendingPathComponent:@"Photos-Tap-To-Radar-Screenshot.png"];

  id v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
  id v19 = 0;
  char v13 = [v9 writeToURL:v12 options:1 error:&v19];
  id v14 = v19;
  if ((v13 & 1) == 0)
  {
    id v15 = PLUIGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      char v16 = [v12 path];
      *(_DWORD *)buf = 138412546;
      int v21 = v16;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_impl(&dword_1A9AE7000, v15, OS_LOG_TYPE_ERROR, "Failed to write screenshot to file %@ with error %@", buf, 0x16u);
    }
    id v12 = 0;
  }

  return v12;
}

+ (void)presentTermsAndConditionsForUIViewController:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = +[PXFeedbackTapToRadarUtilities alertControllerWithInternalReleaseAgreementAndCompletion:a4];
  [v5 presentViewController:v6 animated:1 completion:0];
}

+ (id)alertControllerWithInternalReleaseAgreementAndCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [a1 internalReleaseAgreementTitle];
  id v6 = [a1 internalReleaseAgreement];
  CGFloat v7 = [a1 alertControllerWithPrivacyTitle:v5 message:v6 completion:v4];

  return v7;
}

+ (id)alertControllerWithPrivacyTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v11)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PXFeedbackTapToRadarUtilities.m", 229, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  id v12 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v10 preferredStyle:1];
  char v13 = (void *)MEMORY[0x1E4FB1410];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __84__PXFeedbackTapToRadarUtilities_alertControllerWithPrivacyTitle_message_completion___block_invoke;
  v23[3] = &unk_1E5DCE788;
  id v14 = v11;
  id v24 = v14;
  id v15 = [v13 actionWithTitle:@"Agree" style:0 handler:v23];
  [v12 addAction:v15];

  char v16 = (void *)MEMORY[0x1E4FB1410];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__PXFeedbackTapToRadarUtilities_alertControllerWithPrivacyTitle_message_completion___block_invoke_2;
  v21[3] = &unk_1E5DCE788;
  id v22 = v14;
  id v17 = v14;
  uint64_t v18 = [v16 actionWithTitle:@"Cancel" style:1 handler:v21];
  [v12 addAction:v18];

  return v12;
}

uint64_t __84__PXFeedbackTapToRadarUtilities_alertControllerWithPrivacyTitle_message_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __84__PXFeedbackTapToRadarUtilities_alertControllerWithPrivacyTitle_message_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 classification:(id)a5 componentID:(id)a6 componentName:(id)a7 componentVersion:(id)a8 keyword:(id)a9 screenshotURLs:(id)a10 attachmentURLs:(id)a11 includeSysDiagnose:(BOOL)a12 includeInternalRelease:(BOOL)a13 additionalExtensionIdentifiers:(id)a14 completionHandler:(id)a15
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v20 = a4;
  id v58 = a5;
  id v21 = a6;
  id v59 = a7;
  id v57 = a8;
  id v56 = a9;
  id v55 = a10;
  id v22 = a11;
  id v54 = a14;
  id v53 = a15;
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    id v73 = v59;
    __int16 v74 = 2112;
    id v75 = v60;
    _os_log_impl(&dword_1A9AE7000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Tap-to-Radar initiated for component: %@, title: %@", buf, 0x16u);
  }
  uint64_t v23 = [(id)objc_opt_class() _tempDirectoryURL];
  id v61 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  id v24 = v22;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v66 objects:v71 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v67 != v27) {
          objc_enumerationMutation(v24);
        }
        id v29 = (void *)[getDEUtilsClass() copyPath:*(void *)(*((void *)&v66 + 1) + 8 * i) toDestinationDir:v23 zipped:0];
        v30 = [v29 path];
        if (v30) {
          [v61 addObject:v30];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v66 objects:v71 count:16];
    }
    while (v26);
  }

  id v31 = [v61 componentsJoinedByString:@","];
  id v32 = v20;
  v33 = v32;
  if (a13)
  {
    v33 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithString:v32];
    id v34 = [(id)objc_opt_class() internalReleaseAgreement];
    [v33 appendFormat:@"\n\n— Photos Release Agreement —\n%@", v34];
  }
  id v35 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v35 setObject:v60 forKeyedSubscript:@"Title"];
  [v35 setObject:v58 forKeyedSubscript:@"Classification"];
  [v35 setObject:@"Not Applicable" forKeyedSubscript:@"Reproducibility"];
  if (!a12) {
    [v35 setObject:@"0" forKeyedSubscript:@"AutoDiagnostics"];
  }
  [v35 setObject:v21 forKeyedSubscript:@"ComponentID"];
  [v35 setObject:v59 forKeyedSubscript:@"ComponentName"];
  [v35 setObject:v57 forKeyedSubscript:@"ComponentVersion"];
  [v35 setObject:v33 forKeyedSubscript:@"Description"];
  if ([v31 length]) {
    [v35 setObject:v31 forKeyedSubscript:@"Attachments"];
  }
  if (v56) {
    [v35 setObject:v56 forKeyedSubscript:@"Keywords"];
  }
  if ([v54 count])
  {
    long long v36 = [v54 componentsJoinedByString:@","];
    [v35 setObject:v36 forKeyedSubscript:@"ExtensionIdentifiers"];
  }
  if ([v55 count])
  {
    long long v37 = [v55 valueForKey:@"path"];
    long long v38 = [v37 componentsJoinedByString:@","];
    [v35 setObject:v38 forKeyedSubscript:@"Screenshot"];
  }
  v52 = [MEMORY[0x1E4F29088] componentsWithString:@"tap-to-radar://new"];
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v40 = v35;
  uint64_t v41 = [v40 countByEnumeratingWithState:&v62 objects:v70 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v42; ++j)
      {
        if (*(void *)v63 != v43) {
          objc_enumerationMutation(v40);
        }
        uint64_t v45 = *(void *)(*((void *)&v62 + 1) + 8 * j);
        long long v46 = (void *)MEMORY[0x1E4F290C8];
        long long v47 = [v40 objectForKeyedSubscript:v45];
        v48 = [v46 queryItemWithName:v45 value:v47];
        [v39 addObject:v48];
      }
      uint64_t v42 = [v40 countByEnumeratingWithState:&v62 objects:v70 count:16];
    }
    while (v42);
  }

  [v52 setQueryItems:v39];
  uint64_t v49 = [v52 URL];
  id v50 = v53;
  id v51 = v49;
  px_dispatch_on_main_queue();
}

void __251__PXFeedbackTapToRadarUtilities_fileRadarWithTitle_description_classification_componentID_componentName_componentVersion_keyword_screenshotURLs_attachmentURLs_includeSysDiagnose_includeInternalRelease_additionalExtensionIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  [v2 openURL:*(void *)(a1 + 32) options:MEMORY[0x1E4F1CC08] completionHandler:*(void *)(a1 + 40)];
}

+ (void)fileRadarWithTitle:(id)a3 description:(id)a4 classification:(id)a5 componentID:(id)a6 componentName:(id)a7 componentVersion:(id)a8 keyword:(id)a9 attachmentURLs:(id)a10 includeSysDiagnose:(BOOL)a11 completionHandler:(id)a12
{
  BYTE1(v12) = 1;
  LOBYTE(v12) = a11;
  objc_msgSend(a1, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", a3, a4, a5, a6, a7, a8, a9, 0, a10, v12, 0, a12);
}

+ (NSString)internalReleaseAgreement
{
  return (NSString *)@"I agree that Apple and its strategic partners may use, adapt, modify, reproduce, and distribute internally in perpetuity, the images that I am providing with this bug report (“Images”), for the purpose of improving the machine vision capabilities of Apple products. Apple may not use the Images in any other fashion than as provided herein.  Please do not provide any images that contain third parties or for which you do not have sufficient rights.\n\nI represent that the Images are original to and/or owned by me and that I have the rights necessary to grant to Apple the rights provided herein.  I release Apple, its agents, employees, licensees and assigns from any and all claims I may have now or in the future for invasion of privacy, right of publicity, trademark infringement, copyright infringement, defamation or any other cause of action arising out of the use or reproduction of the Images.\n\nI have read and fully understand the foregoing and hereby acknowledge my agreement to its terms.";
}

+ (NSString)internalReleaseAgreementTitle
{
  return (NSString *)@"Photo Release Agreement";
}

+ (NSString)summaryDescription
{
  return (NSString *)@"— Summary —\nRecap the problem title and/or include more descriptive summary information.\n\n— Steps to reproduce —\n0. What device and what build\n1. Setup or prep work\n2. Include explicit and accurate steps to reproduce. Do not include extraneous or irrelevant steps.\n\n— Observed results —\nDescribe the results you observed and how they differed from what you expected. Please also indicate the timestamp from when you encountered the issue.\n\n— Regression information —\nDoes it reproduce on a public iOS release? If so, please provide the iOS version.\nDoes it reproduce on a previous internal build? If so, please provide the build number.\n\n\n---CMM - Compose Recipient List Tap-To-Radar---\n";
}

+ (id)attachmentURLForDiagnosticDictionaries:(id)a3 descriptionName:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (![v7 count])
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, a1, @"PXFeedbackTapToRadarUtilities.m", 52, @"Invalid parameter not satisfying: %@", @"diagnosticDictionaries.count > 0" object file lineNumber description];
  }
  id v9 = [NSString stringWithFormat:@"%@-Summary.txt", v8];
  id v10 = NSTemporaryDirectory();
  id v11 = [v10 stringByAppendingPathComponent:v9];

  uint64_t v12 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v11];
  char v13 = [MEMORY[0x1E4F28E78] string];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v14 = v7;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v29;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v29 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = PLPrettyPrintPList();
        if (v19) {
          [v13 appendString:v19];
        }

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v36 count:16];
    }
    while (v16);
  }

  id v27 = 0;
  char v20 = [v13 writeToURL:v12 atomically:1 encoding:4 error:&v27];
  id v21 = v27;
  id v22 = v12;
  if ((v20 & 1) == 0)
  {
    uint64_t v23 = PLUIGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v33 = v8;
      __int16 v34 = 2112;
      id v35 = v21;
      _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_ERROR, "%@ failed to save tap-to-radar info, error: %@", buf, 0x16u);
    }

    id v22 = 0;
  }
  id v24 = v22;

  return v24;
}

@end