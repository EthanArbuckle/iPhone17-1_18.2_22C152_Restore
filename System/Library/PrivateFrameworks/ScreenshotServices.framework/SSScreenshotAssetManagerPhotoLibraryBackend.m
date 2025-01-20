@interface SSScreenshotAssetManagerPhotoLibraryBackend
+ (id)_gameHighlightsImageDataFromImage:(id)a3 withOptions:(id)a4;
+ (id)_gameHighlightsImageDataFromImageData:(id)a3 withOptions:(id)a4;
+ (id)imageDataFromImage:(id)a3 withProperties:(id)a4;
- (id)_ARKitImageDataFromImage:(id)a3;
- (id)photoLibrary;
- (void)_registerEntryWithImage:(id)a3 options:(id)a4 retry:(BOOL)a5 identifierHandler:(id)a6;
- (void)imageForPreviouslyRegisteredIdentifier:(id)a3 imageHandler:(id)a4;
- (void)registerEntryWithImage:(id)a3 options:(id)a4 identifierHandler:(id)a5;
- (void)removeEntryWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)saveImageToTemporaryLocation:(id)a3 withName:(id)a4 imageDescription:(id)a5 completionHandler:(id)a6;
- (void)updateImageData:(id)a3 withModificationData:(id)a4 forEntryWithIdentifier:(id)a5 registrationOptions:(id)a6 imageDescription:(id)a7 completionHandler:(id)a8;
@end

@implementation SSScreenshotAssetManagerPhotoLibraryBackend

- (id)photoLibrary
{
  v2 = self;
  objc_sync_enter(v2);
  photoLibrary = v2->_photoLibrary;
  if (!photoLibrary)
  {
    id v4 = objc_alloc(MEMORY[0x263F14E98]);
    v5 = [MEMORY[0x263F14E98] systemPhotoLibraryURL];
    uint64_t v6 = [v4 initWithPhotoLibraryURL:v5];
    v7 = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v6;

    photoLibrary = v2->_photoLibrary;
  }
  v8 = photoLibrary;
  objc_sync_exit(v2);

  return v8;
}

- (id)_ARKitImageDataFromImage:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F0F4A0];
  uint64_t v9 = *MEMORY[0x263EF94D8];
  uint64_t v10 = MEMORY[0x263EFFA88];
  v3 = NSDictionary;
  id v4 = a3;
  v5 = [v3 dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  v12[0] = v5;
  uint64_t v6 = [NSDictionary dictionaryWithObjects:v12 forKeys:&v11 count:1];

  v7 = [(id)objc_opt_class() imageDataFromImage:v4 withProperties:v6];

  return v7;
}

+ (id)imageDataFromImage:(id)a3 withProperties:(id)a4
{
  id v5 = a3;
  CFDictionaryRef v6 = (const __CFDictionary *)a4;
  id v7 = v5;
  uint64_t v8 = [v7 CGImage];
  if (v8)
  {
    uint64_t v9 = (CGImage *)v8;
    uint64_t v10 = [MEMORY[0x263EFF990] data];
    uint64_t v11 = CGImageDestinationCreateWithData(v10, @"public.jpeg", 1uLL, 0);
    if (v11)
    {
      v12 = v11;
      CGImageDestinationAddImage(v11, v9, v6);
      if (!CGImageDestinationFinalize(v12))
      {
        v13 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[SSScreenshotAssetManagerPhotoLibraryBackend imageDataFromImage:withProperties:](v7);
        }

        uint64_t v10 = 0;
      }
      CFRelease(v12);
    }
    else
    {
      v15 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        +[SSScreenshotAssetManagerPhotoLibraryBackend imageDataFromImage:withProperties:](v7);
      }
    }
  }
  else
  {
    v14 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      +[SSScreenshotAssetManagerPhotoLibraryBackend imageDataFromImage:withProperties:](v7);
    }

    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)_gameHighlightsImageDataFromImageData:(id)a3 withOptions:(id)a4
{
  id v5 = (void *)MEMORY[0x263F1C6B0];
  id v6 = a4;
  id v7 = [v5 imageWithData:a3];
  uint64_t v8 = [(id)objc_opt_class() _gameHighlightsImageDataFromImage:v7 withOptions:v6];

  return v8;
}

+ (id)_gameHighlightsImageDataFromImage:(id)a3 withOptions:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [a4 assetMetadata];
  id v7 = [v6 assetDescription];
  uint64_t v8 = [v7 componentsJoinedByString:@" | "];

  uint64_t v15 = *MEMORY[0x263F0F528];
  v16[0] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
  uint64_t v13 = *MEMORY[0x263F0F518];
  v14 = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:&v14 forKeys:&v13 count:1];
  uint64_t v11 = [(id)objc_opt_class() imageDataFromImage:v5 withProperties:v10];

  return v11;
}

- (void)registerEntryWithImage:(id)a3 options:(id)a4 identifierHandler:(id)a5
{
}

- (void)_registerEntryWithImage:(id)a3 options:(id)a4 retry:(BOOL)a5 identifierHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__0;
  v30[4] = __Block_byref_object_dispose__0;
  id v31 = 0;
  uint64_t v13 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = [v10 description];
    *(_DWORD *)buf = 138412546;
    v33 = v14;
    __int16 v34 = 1024;
    BOOL v35 = v7;
    _os_log_impl(&dword_21ECED000, v13, OS_LOG_TYPE_INFO, "Saving screenshot with image %@ to the photo library (retry:%d)", buf, 0x12u);
  }
  uint64_t v15 = [(SSScreenshotAssetManagerPhotoLibraryBackend *)self photoLibrary];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke;
  v25[3] = &unk_2644ED950;
  id v26 = v11;
  id v27 = v10;
  v28 = self;
  v29 = v30;
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_48;
  v19[3] = &unk_2644ED978;
  BOOL v24 = v7;
  v19[4] = self;
  id v16 = v27;
  id v20 = v16;
  id v17 = v26;
  id v21 = v17;
  id v18 = v12;
  id v22 = v18;
  v23 = v30;
  [v15 performChanges:v25 completionHandler:v19];

  _Block_object_dispose(v30, 8);
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x223C397D0]();
  uint64_t v3 = [*(id *)(a1 + 32) saveLocation];
  if (v3)
  {
    if ([*(id *)(a1 + 32) saveLocation] == 2)
    {
      id v4 = [(id)objc_opt_class() _gameHighlightsImageDataFromImage:*(void *)(a1 + 40) withOptions:*(void *)(a1 + 32)];
      if (v4) {
        goto LABEL_13;
      }
      id v5 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_2((id *)(a1 + 40));
      }
    }
    else
    {
      id v4 = [*(id *)(a1 + 48) _ARKitImageDataFromImage:*(void *)(a1 + 40)];
      if (v4) {
        goto LABEL_13;
      }
      id v5 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_3((id *)(a1 + 40));
      }
    }
  }
  else
  {
    id v4 = PHImageDataFromImageAsScreenshot();
    if (v4) {
      goto LABEL_13;
    }
    id v5 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_1((id *)(a1 + 40));
    }
  }

  id v4 = 0;
LABEL_13:
  BOOL v6 = v3 == 0;
  id v7 = objc_alloc_init(MEMORY[0x263F14D40]);
  [v7 setUseRecoverableStagingDirectory:1];
  [v7 setShouldCreateScreenshot:v6];
  uint64_t v8 = [MEMORY[0x263F14D48] creationRequestForAssetFromImageData:v4 options:v7];
  if (_SSLinksInPhotosEnabled())
  {
    uint64_t v9 = [*(id *)(a1 + 32) applicationBundleID];
    [v8 setImportedByBundleIdentifier:v9];
  }
  id v10 = [*(id *)(a1 + 32) assetDescription];
  [v8 setAssetDescription:v10];

  uint64_t v11 = [v8 placeholderForCreatedAsset];
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v11;
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_48(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x223C397D0]();
  if (*(unsigned char *)(a1 + 72))
  {
    BOOL v6 = [v4 domain];
    id v7 = v6;
    if (v6 == (void *)*MEMORY[0x263F07F70])
    {
      uint64_t v8 = [v4 code];

      if (v8 == 4099)
      {
        [*(id *)(a1 + 32) _registerEntryWithImage:*(void *)(a1 + 40) options:*(void *)(a1 + 48) retry:0 identifierHandler:*(void *)(a1 + 56)];
        goto LABEL_12;
      }
    }
    else
    {
    }
  }
  uint64_t v9 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
  id v10 = v9;
  if (v4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_48_cold_1(v4);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) localIdentifier];
    int v14 = 138412290;
    uint64_t v15 = v11;
    _os_log_impl(&dword_21ECED000, v10, OS_LOG_TYPE_INFO, "Created asset in photos with identifier %@", (uint8_t *)&v14, 0xCu);
  }
  uint64_t v12 = *(void *)(a1 + 56);
  uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) localIdentifier];
  (*(void (**)(uint64_t, void *, id))(v12 + 16))(v12, v13, v4);

LABEL_12:
}

- (void)imageForPreviouslyRegisteredIdentifier:(id)a3 imageHandler:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x263F14D18];
  v23[0] = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  id v10 = [(SSScreenshotAssetManagerPhotoLibraryBackend *)self photoLibrary];
  uint64_t v11 = [v10 librarySpecificFetchOptions];
  uint64_t v12 = [v8 fetchAssetsWithLocalIdentifiers:v9 options:v11];
  uint64_t v13 = [v12 firstObject];

  double v14 = *MEMORY[0x263F150B8];
  double v15 = *(double *)(MEMORY[0x263F150B8] + 8);
  id v16 = objc_alloc_init(MEMORY[0x263F14E40]);
  [v16 setSynchronous:1];
  [v16 setResizeMode:0];
  [v16 setDeliveryMode:1];
  id v17 = [MEMORY[0x263F14E38] defaultManager];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __99__SSScreenshotAssetManagerPhotoLibraryBackend_imageForPreviouslyRegisteredIdentifier_imageHandler___block_invoke;
  v20[3] = &unk_2644ED9A0;
  id v21 = v6;
  id v22 = v7;
  id v18 = v7;
  id v19 = v6;
  objc_msgSend(v17, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v13, 0, v16, v20, v14, v15);
}

void __99__SSScreenshotAssetManagerPhotoLibraryBackend_imageForPreviouslyRegisteredIdentifier_imageHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v5 = a2;
  uint64_t v6 = *MEMORY[0x263F150B0];
  id v7 = a3;
  uint64_t v8 = [v7 valueForKey:v6];
  uint64_t v9 = [v7 valueForKey:*MEMORY[0x263F150C0]];

  char v10 = [v9 BOOLValue];
  if (!v8 && (v10 & 1) == 0)
  {
    uint64_t v11 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v15 = 138412290;
      uint64_t v16 = v12;
      _os_log_impl(&dword_21ECED000, v11, OS_LOG_TYPE_INFO, "Retrieved image for identifier %@", (uint8_t *)&v15, 0xCu);
    }

    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
LABEL_10:
    v13();
    goto LABEL_11;
  }
  if (v8)
  {
    double v14 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __99__SSScreenshotAssetManagerPhotoLibraryBackend_imageForPreviouslyRegisteredIdentifier_imageHandler___block_invoke_cold_1(a1, (uint64_t)v8);
    }

    uint64_t v13 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    goto LABEL_10;
  }
LABEL_11:
}

- (void)updateImageData:(id)a3 withModificationData:(id)a4 forEntryWithIdentifier:(id)a5 registrationOptions:(id)a6 imageDescription:(id)a7 completionHandler:(id)a8
{
  v41[1] = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v33 = v17;
  if ([v17 saveLocation] == 2)
  {
    uint64_t v20 = [(id)objc_opt_class() _gameHighlightsImageDataFromImageData:v14 withOptions:v17];

    id v14 = (id)v20;
  }
  id v21 = (void *)MEMORY[0x263F14D18];
  v41[0] = v16;
  id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:1];
  v23 = [(SSScreenshotAssetManagerPhotoLibraryBackend *)self photoLibrary];
  BOOL v24 = [v23 librarySpecificFetchOptions];
  v25 = [v21 fetchAssetsWithLocalIdentifiers:v22 options:v24];
  id v26 = [v25 firstObject];

  v34[0] = MEMORY[0x263EF8330];
  v34[1] = 3221225472;
  v34[2] = __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke;
  v34[3] = &unk_2644EDA18;
  id v35 = v15;
  id v36 = v14;
  id v37 = v16;
  id v38 = v26;
  id v39 = v18;
  id v40 = v19;
  id v27 = v19;
  id v28 = v18;
  id v29 = v26;
  id v30 = v16;
  id v31 = v14;
  id v32 = v15;
  [v29 requestContentEditingInputWithOptions:0 completionHandler:v34];
}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x263F14DD8]) initWithContentEditingInput:v5];
    if (*(void *)(a1 + 32))
    {
      uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F14D10]) initWithFormatIdentifier:@"ScreenshotServices" formatVersion:@"2.0" data:*(void *)(a1 + 32)];
      [v7 setAdjustmentData:v8];
    }
    uint64_t v9 = *(void **)(a1 + 40);
    char v10 = [v7 renderedContentURL];
    [v9 writeToURL:v10 atomically:1];

    uint64_t v11 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412290;
      uint64_t v23 = v12;
      _os_log_impl(&dword_21ECED000, v11, OS_LOG_TYPE_INFO, "Found contentEditingInput for identifier %@. Preparing to ask Photos to update photo with update image.", buf, 0xCu);
    }

    uint64_t v13 = [*(id *)(a1 + 56) photoLibrary];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_63;
    v18[3] = &unk_2644ED9C8;
    id v19 = *(id *)(a1 + 56);
    id v20 = *(id *)(a1 + 64);
    id v21 = v7;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_2;
    v15[3] = &unk_2644ED9F0;
    id v16 = *(id *)(a1 + 48);
    id v17 = *(id *)(a1 + 72);
    id v14 = v7;
    [v13 performChanges:v18 completionHandler:v15];
  }
  else
  {
    id v14 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_cold_1(a1, v6);
    }
    uint64_t v13 = v14;
  }
}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_63(uint64_t a1)
{
  id v2 = [MEMORY[0x263F14D20] changeRequestForAsset:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 40) length]) {
    [v2 setAccessibilityDescription:*(void *)(a1 + 40)];
  }
  [v2 setContentEditingOutput:*(void *)(a1 + 48)];
}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_21ECED000, v7, OS_LOG_TYPE_INFO, "Updated photo for identifier %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_2_cold_1(a1, (uint64_t)v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)saveImageToTemporaryLocation:(id)a3 withName:(id)a4 imageDescription:(id)a5 completionHandler:(id)a6
{
  uint64_t v9 = (UIImage *)a3;
  id v10 = a4;
  id v34 = a5;
  id v31 = (void (**)(id, void *, id))a6;
  id v32 = v9;
  v33 = UIImagePNGRepresentation(v9);
  uint64_t v11 = 0;
  uint64_t v12 = 1;
  do
  {
    id v13 = v10;

    id v14 = v13;
    if (v12 != 1)
    {
      id v15 = (void *)MEMORY[0x263F08A30];
      id v16 = [NSNumber numberWithInteger:v12];
      id v17 = [v15 localizedStringFromNumber:v16 numberStyle:0];

      id v18 = [v13 stringByAppendingString:@" "];
      id v14 = [v18 stringByAppendingString:v17];
    }
    uint64_t v19 = NSTemporaryDirectory();
    id v20 = [v14 stringByAppendingPathExtension:@"png"];
    uint64_t v11 = [(id)v19 stringByAppendingPathComponent:v20];

    id v21 = [MEMORY[0x263F08850] defaultManager];
    LOBYTE(v19) = [v21 fileExistsAtPath:v11];

    ++v12;
  }
  while ((v19 & 1) != 0);
  id v22 = [NSURL fileURLWithPath:v11];
  id v36 = 0;
  [v33 writeToURL:v22 options:0 error:&v36];
  id v23 = v36;
  if ([v34 length])
  {
    CFErrorRef err = 0;
    uint64_t v38 = 0;
    id v39 = &v38;
    uint64_t v40 = 0x2020000000;
    uint64_t v24 = (uint64_t (*)(void *, id, CFErrorRef *))getMAImageCaptioningSetCaptionSymbolLoc_ptr;
    v41 = getMAImageCaptioningSetCaptionSymbolLoc_ptr;
    if (!getMAImageCaptioningSetCaptionSymbolLoc_ptr)
    {
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __getMAImageCaptioningSetCaptionSymbolLoc_block_invoke;
      v37[3] = &unk_2644ED6B8;
      v37[4] = &v38;
      __getMAImageCaptioningSetCaptionSymbolLoc_block_invoke((uint64_t)v37);
      uint64_t v24 = (uint64_t (*)(void *, id, CFErrorRef *))v39[3];
    }
    _Block_object_dispose(&v38, 8);
    if (!v24)
    {
      id v30 = (_Unwind_Exception *)-[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:]();
      _Block_object_dispose(&v38, 8);
      _Unwind_Resume(v30);
    }
    if ((v24(v22, v34, &err) & 1) == 0)
    {
      if (err)
      {
        v25 = (__CFString *)CFErrorCopyDescription(err);
        CFRelease(err);
      }
      else
      {
        v25 = 0;
      }
      uint64_t v26 = [(__CFString *)v25 length];
      id v27 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
      BOOL v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);
      if (v26)
      {
        if (v28) {
          -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:].cold.4();
        }
      }
      else if (v28)
      {
        -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:]();
      }
    }
  }
  if (v23)
  {
    id v29 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:]((uint64_t)v22, v23);
    }
  }
  v31[2](v31, v22, v23);
}

- (void)removeEntryWithIdentifier:(id)a3 completionHandler:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)MEMORY[0x263F14D18];
  v23[0] = v6;
  uint64_t v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:1];
  id v10 = [(SSScreenshotAssetManagerPhotoLibraryBackend *)self photoLibrary];
  uint64_t v11 = [v10 librarySpecificFetchOptions];
  uint64_t v12 = [v8 fetchAssetsWithLocalIdentifiers:v9 options:v11];
  id v13 = [v12 firstObject];

  id v14 = [v13 photoLibrary];
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke;
  v20[3] = &unk_2644ED8E8;
  id v21 = v6;
  id v22 = self;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke_2;
  v17[3] = &unk_2644ED9F0;
  id v18 = v21;
  id v19 = v7;
  id v15 = v7;
  id v16 = v21;
  [v14 performChanges:v20 completionHandler:v17];
}

void __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x263EF8340];
  id v2 = (void *)MEMORY[0x263F14D18];
  v7[0] = *(void *)(a1 + 32);
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:1];
  id v4 = [*(id *)(a1 + 40) photoLibrary];
  id v5 = [v4 librarySpecificFetchOptions];
  id v6 = [v2 fetchAssetsWithLocalIdentifiers:v3 options:v5];

  [MEMORY[0x263F14D20] deleteAssets:v6];
}

void __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = os_log_create("com.apple.screenshotservices", "PhotoLibrary");
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138412290;
      uint64_t v11 = v8;
      _os_log_impl(&dword_21ECED000, v7, OS_LOG_TYPE_INFO, "Removed photo for identifier %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    uint64_t v9 = v6;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke_2_cold_1(a1, (uint64_t)v5);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void).cxx_destruct
{
}

+ (void)imageDataFromImage:(void *)a1 withProperties:.cold.1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ECED000, v2, v3, "Unable to get CGImage data for image %@", v4, v5, v6, v7, v8);
}

+ (void)imageDataFromImage:(void *)a1 withProperties:.cold.2(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ECED000, v2, v3, "Unable to get image destination for image %@", v4, v5, v6, v7, v8);
}

+ (void)imageDataFromImage:(void *)a1 withProperties:.cold.3(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ECED000, v2, v3, "Unable to finalize image destination for image %@", v4, v5, v6, v7, v8);
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_1(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ECED000, v2, v3, "Unable to get screenshot image data from image %@", v4, v5, v6, v7, v8);
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_2(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ECED000, v2, v3, "Unable to get game highlights image data from image %@", v4, v5, v6, v7, v8);
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_cold_3(id *a1)
{
  v1 = [*a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ECED000, v2, v3, "Unable to get ARKit image data from image %@", v4, v5, v6, v7, v8);
}

void __103__SSScreenshotAssetManagerPhotoLibraryBackend__registerEntryWithImage_options_retry_identifierHandler___block_invoke_48_cold_1(void *a1)
{
  v1 = [a1 description];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_21ECED000, v2, v3, "Could not create asset in Photos with error %@", v4, v5, v6, v7, v8);
}

void __99__SSScreenshotAssetManagerPhotoLibraryBackend_imageForPreviouslyRegisteredIdentifier_imageHandler___block_invoke_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4(a1, a2), "description");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21ECED000, v3, v4, "Could not get image for identifier %@ with error %@", v5, v6, v7, v8, v9);
}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21ECED000, v3, v4, "Could not obtain content editing input for saving updates for identifier %@, info: %@", v5, v6, v7, v8, v9);
}

void __162__SSScreenshotAssetManagerPhotoLibraryBackend_updateImageData_withModificationData_forEntryWithIdentifier_registrationOptions_imageDescription_completionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4(a1, a2), "description");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21ECED000, v3, v4, "Could not update photo for identifier %@ with error %@", v5, v6, v7, v8, v9);
}

- (void)saveImageToTemporaryLocation:(uint64_t)a1 withName:(void *)a2 imageDescription:completionHandler:.cold.1(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21ECED000, v3, v4, "Could not save image to temporary location %@ with error %@", v5, v6, v7, v8, v9);
}

- (uint64_t)saveImageToTemporaryLocation:withName:imageDescription:completionHandler:.cold.2()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:](v0);
}

- (void)saveImageToTemporaryLocation:withName:imageDescription:completionHandler:.cold.3()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_21ECED000, v0, OS_LOG_TYPE_ERROR, "Could not set image description for a file %@", v1, 0xCu);
}

- (void)saveImageToTemporaryLocation:withName:imageDescription:completionHandler:.cold.4()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_21ECED000, v1, OS_LOG_TYPE_ERROR, "Could not set image description for a file %@ with error %@", v2, 0x16u);
}

void __91__SSScreenshotAssetManagerPhotoLibraryBackend_removeEntryWithIdentifier_completionHandler___block_invoke_2_cold_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = objc_msgSend((id)OUTLINED_FUNCTION_4(a1, a2), "description");
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_21ECED000, v3, v4, "Could not remove photo for identifier %@ with error %@", v5, v6, v7, v8, v9);
}

@end