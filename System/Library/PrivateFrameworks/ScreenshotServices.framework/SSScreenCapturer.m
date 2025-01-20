@interface SSScreenCapturer
+ (BOOL)_filesAppExistsOnSystem;
+ (BOOL)shouldUseScreenCapturerForScreenshots;
+ (void)playScreenshotSound;
- (BOOL)_betaFeedbackEnabled:(id)a3;
- (BOOL)_screenshotWasTakenOverBetaApp;
- (SSScreenCapturer)init;
- (SSScreenCapturerDelegate)delegate;
- (UIWindow)screenshotsWindow;
- (id)_applicationProxyForCurrentApp;
- (id)_betaApplicationName;
- (id)_bundleIDForCurrentApplication;
- (id)_currentDisplayLayout;
- (id)_environmentDescriptionFromImage:(id)a3;
- (id)_testingCoordinator;
- (void)_captureAndSendDocumentForEnvironmentElement:(id)a3;
- (void)_captureAndSendMetadataAndDocumentForEnvironmentDescription:(id)a3 metadataCaptureCompletion:(id)a4;
- (void)_captureAndSendMetadataForEnvironmentElement:(id)a3 metadataCapture:(id)a4 sendCompletion:(id)a5;
- (void)_preheatAndTakeScreenshotIfPossibleWithOptionsCollection:(id)a3 presentationOptions:(id)a4 appleInternalOptions:(id)a5;
- (void)_saveImageToPhotoLibrary:(id)a3 environmentDescription:(id)a4;
- (void)_sendEnvironmentDescription:(id)a3 savingImageToPhotos:(id)a4 withCompletion:(id)a5;
- (void)_sendEnvironmentDescription:(id)a3 withCompletion:(id)a4;
- (void)_takeScreenshotWithOptionsCollection:(id)a3 serviceOptions:(id)a4 presentationOptions:(id)a5 appleInternalOptions:(id)a6;
- (void)dealloc;
- (void)preheatWithPresentationOptions:(id)a3;
- (void)screenshotWindowWasDismissed;
- (void)screenshotWindowWillBeDisplayed;
- (void)server:(id)a3 handleRequest:(id)a4 withCompletion:(id)a5;
- (void)setDelegate:(id)a3;
- (void)startRecap;
- (void)takeScreenshot;
- (void)takeScreenshotWithOptionsCollection:(id)a3 presentationOptions:(id)a4;
- (void)takeScreenshotWithPresentationOptions:(id)a3;
- (void)testingCoordinator:(id)a3 requestsTakingScreenshotForRunPPTRequest:(id)a4;
@end

@implementation SSScreenCapturer

- (SSScreenCapturer)init
{
  v14.receiver = self;
  v14.super_class = (Class)SSScreenCapturer;
  v2 = [(SSScreenCapturer *)&v14 init];
  v3 = objc_alloc_init(SSSnapshotter);
  snapshotter = v2->_snapshotter;
  v2->_snapshotter = v3;

  v5 = objc_alloc_init(SSDittoRemoteConnection);
  dittoRemoteConnection = v2->_dittoRemoteConnection;
  v2->_dittoRemoteConnection = v5;

  v7 = objc_alloc_init(SSApplicationScreenshotSupplementalDataCapturer);
  metadataCapturer = v2->_metadataCapturer;
  v2->_metadataCapturer = v7;

  v9 = [[SSUIServiceServer alloc] initWithDelegate:v2];
  uiServiceServer = v2->_uiServiceServer;
  v2->_uiServiceServer = v9;

  v11 = objc_alloc_init(SSScreenshotsWindow);
  serviceWindow = v2->_serviceWindow;
  v2->_serviceWindow = v11;

  [(SSScreenshotsWindow *)v2->_serviceWindow setDelegate:v2];
  [(SSScreenshotsWindow *)v2->_serviceWindow setUserInteractionEnabled:0];
  [(SSScreenCapturer *)v2 startRecap];
  return v2;
}

- (void)dealloc
{
  [(FBSDisplayLayoutMonitor *)self->_layoutMonitor invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SSScreenCapturer;
  [(SSScreenCapturer *)&v3 dealloc];
}

- (void)startRecap
{
  if (_SSEnableContinuousScreenCaptureForBugFiling() && RecapLibraryCore_0())
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    objc_super v3 = (void *)getRCPRecorderConfigClass_softClass;
    uint64_t v22 = getRCPRecorderConfigClass_softClass;
    if (!getRCPRecorderConfigClass_softClass)
    {
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __getRCPRecorderConfigClass_block_invoke;
      v17 = &unk_2644ED6B8;
      v18 = &v19;
      __getRCPRecorderConfigClass_block_invoke((uint64_t)&v14);
      objc_super v3 = (void *)v20[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v19, 8);
    v5 = objc_opt_new();
    [v5 setDeviceUsagePageArray:&unk_26D05B908];
    [v5 setMaxStreamDuration:30.0];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v6 = (void *)getRCPEventStreamRecorderClass_softClass;
    uint64_t v22 = getRCPEventStreamRecorderClass_softClass;
    if (!getRCPEventStreamRecorderClass_softClass)
    {
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __getRCPEventStreamRecorderClass_block_invoke;
      v17 = &unk_2644ED6B8;
      v18 = &v19;
      __getRCPEventStreamRecorderClass_block_invoke((uint64_t)&v14);
      v6 = (void *)v20[3];
    }
    id v7 = v6;
    _Block_object_dispose(&v19, 8);
    v8 = [v7 recorderWithConfiguration:v5];
    recap = self->_recap;
    self->_recap = v8;

    [(RCPEventStreamRecorder *)self->_recap startRecording];
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x2050000000;
    v10 = (void *)getRCPScreenRecorderClass_softClass;
    uint64_t v22 = getRCPScreenRecorderClass_softClass;
    if (!getRCPScreenRecorderClass_softClass)
    {
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      v16 = __getRCPScreenRecorderClass_block_invoke;
      v17 = &unk_2644ED6B8;
      v18 = &v19;
      __getRCPScreenRecorderClass_block_invoke((uint64_t)&v14);
      v10 = (void *)v20[3];
    }
    v11 = v10;
    _Block_object_dispose(&v19, 8);
    v12 = (RCPScreenRecorder *)objc_alloc_init(v11);
    recapSnapshotter = self->_recapSnapshotter;
    self->_recapSnapshotter = v12;

    [(RCPScreenRecorder *)self->_recapSnapshotter setMaxDuration:30.0];
    [(RCPScreenRecorder *)self->_recapSnapshotter startRecording];
  }
}

- (void)preheatWithPresentationOptions:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = os_log_create("com.apple.screenshotservices", "Capture");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21ECED000, v5, OS_LOG_TYPE_INFO, "Asked to preheat", (uint8_t *)&v9, 2u);
  }

  v6 = +[SSScreenCaptureAbilityCheck abilityCheck];
  if ([v6 isAbleToTakeScreenshots])
  {
    [(SSScreenshotsWindow *)self->_serviceWindow activateRemoteViewControllerIfAppropriate];
    -[SSDittoRemoteConnection sendDittoProcessPreheatRequestWithPresentationMode:completion:](self->_dittoRemoteConnection, "sendDittoProcessPreheatRequestWithPresentationMode:completion:", [v4 presentationMode], &__block_literal_global_7);
  }
  else
  {
    id v7 = os_log_create("com.apple.screenshotservices", "Capture");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = [v6 reasonForNotBeingAbleToTakeScreenshots];
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_21ECED000, v7, OS_LOG_TYPE_INFO, "Could not comply with request to preheat for reason: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)takeScreenshotWithPresentationOptions:(id)a3
{
}

- (void)takeScreenshotWithOptionsCollection:(id)a3 presentationOptions:(id)a4
{
}

- (void)takeScreenshot
{
  objc_super v3 = objc_alloc_init(SSScreenCapturerPresentationOptions);
  [(SSScreenCapturerPresentationOptions *)v3 setPresentationMode:0];
  [(SSScreenCapturer *)self takeScreenshotWithPresentationOptions:v3];
}

- (void)screenshotWindowWasDismissed
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _screenshotWindowWasDismissed];
  }
}

- (void)screenshotWindowWillBeDisplayed
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 _screenshotWindowWillBeDisplayed];
  }
}

- (id)_environmentDescriptionFromImage:(id)a3
{
  id v3 = a3;
  char v4 = objc_alloc_init(SSEnvironmentDescription);
  id v5 = objc_msgSend(v3, "ss_imageSurfaceFromImage");
  [(SSEnvironmentDescription *)v4 setImageSurface:v5];

  [v3 size];
  double v7 = v6;
  double v9 = v8;
  [v3 scale];
  double v11 = v10;

  -[SSEnvironmentDescription setImagePixelSize:](v4, "setImagePixelSize:", v7 * v11, v9 * v11);
  [(SSEnvironmentDescription *)v4 setImageScale:v11];
  return v4;
}

- (void)_sendEnvironmentDescription:(id)a3 savingImageToPhotos:(id)a4 withCompletion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __83__SSScreenCapturer__sendEnvironmentDescription_savingImageToPhotos_withCompletion___block_invoke;
  v14[3] = &unk_2644EDE10;
  id v15 = v9;
  v16 = self;
  id v17 = v8;
  id v18 = v10;
  id v11 = v8;
  id v12 = v9;
  id v13 = v10;
  [(SSScreenCapturer *)self _sendEnvironmentDescription:v11 withCompletion:v14];
}

void __83__SSScreenCapturer__sendEnvironmentDescription_savingImageToPhotos_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 56);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  SSCGImageBackedImageFromImage(*(void **)(a1 + 32));
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 40) _saveImageToPhotoLibrary:v3 environmentDescription:*(void *)(a1 + 48)];
}

- (void)_sendEnvironmentDescription:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _SSSignpostLog();
  if (os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v8, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SendScreenshot", (const char *)&unk_21ED0B0A6, buf, 2u);
  }

  id v9 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECED000, v9, OS_LOG_TYPE_INFO, "BEGIN \"SendScreenshot\"", buf, 2u);
  }

  dittoRemoteConnection = self->_dittoRemoteConnection;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __63__SSScreenCapturer__sendEnvironmentDescription_withCompletion___block_invoke;
  v12[3] = &unk_2644ED758;
  id v13 = v6;
  id v11 = v6;
  [(SSDittoRemoteConnection *)dittoRemoteConnection sendDittoProcessEnvironmentDescription:v7 completion:v12];
}

uint64_t __63__SSScreenCapturer__sendEnvironmentDescription_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_captureAndSendMetadataForEnvironmentElement:(id)a3 metadataCapture:(id)a4 sendCompletion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = _SSSignpostLog();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CaptureMetadata", (const char *)&unk_21ED0B0A6, buf, 2u);
  }

  id v12 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECED000, v12, OS_LOG_TYPE_INFO, "BEGIN \"CaptureMetadata\"", buf, 2u);
  }

  metadataCapturer = self->_metadataCapturer;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __96__SSScreenCapturer__captureAndSendMetadataForEnvironmentElement_metadataCapture_sendCompletion___block_invoke;
  v16[3] = &unk_2644EDE38;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v14 = v9;
  id v15 = v8;
  [(SSApplicationScreenshotSupplementalDataCapturer *)metadataCapturer captureMetadataForEnvironmentElement:v10 withCompletionBlock:v16];
}

void __96__SSScreenCapturer__captureAndSendMetadataForEnvironmentElement_metadataCapture_sendCompletion___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  char v4 = _SSSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CaptureMetadata", (const char *)&unk_21ED0B0A6, buf, 2u);
  }

  id v5 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_21ECED000, v5, OS_LOG_TYPE_INFO, "END \"CaptureMetadata\"", v9, 2u);
  }

  uint64_t v6 = a1[5];
  id v7 = [v3 metadata];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  if (v3)
  {
    [*(id *)(a1[4] + 16) sendDittoProcessMetadataUpdate:v3 completion:a1[6]];
  }
  else
  {
    uint64_t v8 = a1[6];
    if (v8) {
      (*(void (**)(uint64_t, void))(v8 + 16))(v8, 0);
    }
  }
}

- (void)_captureAndSendDocumentForEnvironmentElement:(id)a3
{
  id v4 = a3;
  id v5 = _SSSignpostLog();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CaptureDocument", (const char *)&unk_21ED0B0A6, buf, 2u);
  }

  uint64_t v6 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECED000, v6, OS_LOG_TYPE_INFO, "BEGIN \"CaptureDocument\"", buf, 2u);
  }

  metadataCapturer = self->_metadataCapturer;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __65__SSScreenCapturer__captureAndSendDocumentForEnvironmentElement___block_invoke;
  v8[3] = &unk_2644EDE60;
  v8[4] = self;
  [(SSApplicationScreenshotSupplementalDataCapturer *)metadataCapturer captureDocumentForEnvironmentElement:v4 withCompletionBlock:v8];
}

void __65__SSScreenCapturer__captureAndSendDocumentForEnvironmentElement___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = _SSSignpostLog();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CaptureDocument", (const char *)&unk_21ED0B0A6, buf, 2u);
  }

  id v5 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_21ECED000, v5, OS_LOG_TYPE_INFO, "END \"CaptureDocument\"", v6, 2u);
  }

  if (v3) {
    [*(id *)(*(void *)(a1 + 32) + 16) sendDittoProcessDocumentUpdate:v3];
  }
}

- (void)_captureAndSendMetadataAndDocumentForEnvironmentDescription:(id)a3 metadataCaptureCompletion:(id)a4
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v24 = v6;
  uint64_t v8 = [v6 elements];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
  uint64_t v22 = v7;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v38;
    while (2)
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v38 != v11) {
          objc_enumerationMutation(v8);
        }
        if (!objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * v12), "supportsMetadataCapture", v22))
        {
          char v13 = 1;
          goto LABEL_11;
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v37 objects:v42 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  char v13 = 0;
LABEL_11:

  id v14 = dispatch_group_create();
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [v24 elements];
  uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v34;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v34 != v17) {
          objc_enumerationMutation(obj);
        }
        uint64_t v19 = *(void *)(*((void *)&v33 + 1) + 8 * v18);
        dispatch_group_enter(v14);
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke;
        v29[3] = &unk_2644EDE88;
        char v32 = v13;
        id v30 = v24;
        v31 = v14;
        v27[0] = MEMORY[0x263EF8330];
        v27[1] = 3221225472;
        v27[2] = __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke_2;
        v27[3] = &unk_2644EDEB0;
        char v28 = v13;
        v27[4] = self;
        v27[5] = v19;
        [(SSScreenCapturer *)self _captureAndSendMetadataForEnvironmentElement:v19 metadataCapture:v29 sendCompletion:v27];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [obj countByEnumeratingWithState:&v33 objects:v41 count:16];
    }
    while (v16);
  }

  v20 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke_3;
  block[3] = &unk_2644ED758;
  id v26 = v22;
  id v21 = v22;
  dispatch_group_notify(v14, v20, block);
}

void __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (v6)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      [v6 setUserActivityTitle:0];
      [v6 setUserActivityURL:0];
    }
    id v3 = (void *)MEMORY[0x263EFF980];
    id v4 = [*(id *)(a1 + 32) harvestedMetadata];
    id v5 = [v3 arrayWithArray:v4];

    [v5 addObject:v6];
    [*(id *)(a1 + 32) setHarvestedMetadata:v5];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v6 = v3;
    id v4 = [v3 info];
    [v4 flagForSetting:8];
    int IsYes = BSSettingFlagIsYes();

    id v3 = v6;
    if (IsYes)
    {
      if (!*(unsigned char *)(a1 + 48))
      {
        [*(id *)(a1 + 32) _captureAndSendDocumentForEnvironmentElement:*(void *)(a1 + 40)];
        id v3 = v6;
      }
    }
  }
}

uint64_t __106__SSScreenCapturer__captureAndSendMetadataAndDocumentForEnvironmentDescription_metadataCaptureCompletion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_saveImageToPhotoLibrary:(id)a3 environmentDescription:(id)a4
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_alloc_init(SSScreenshotAssetManagerRegistrationOptions);
  uint64_t v9 = [v7 serviceOptions];
  -[SSScreenshotAssetManagerRegistrationOptions setSaveLocation:](v8, "setSaveLocation:", [v9 saveLocation]);

  uint64_t v10 = [v7 serviceOptions];
  uint64_t v11 = [v10 assetMetadata];
  [(SSScreenshotAssetManagerRegistrationOptions *)v8 setAssetMetadata:v11];

  uint64_t v12 = [v7 currentApplicationBundleID];
  [(SSScreenshotAssetManagerRegistrationOptions *)v8 setApplicationBundleID:v12];

  char v13 = [v7 harvestedMetadata];
  [(SSScreenshotAssetManagerRegistrationOptions *)v8 setHarvestedMetadata:v13];

  id v14 = os_log_create("com.apple.screenshotservices", "Capture");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    uint64_t v15 = [v6 description];
    *(_DWORD *)buf = 138412290;
    v27 = v15;
    _os_log_impl(&dword_21ECED000, v14, OS_LOG_TYPE_INFO, "Registering image with asset manager %@", buf, 0xCu);
  }
  uint64_t v16 = [v7 identifier];
  uint64_t v17 = _SSSignpostLog();
  if (os_signpost_enabled(v17))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v17, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SaveToPhotos", (const char *)&unk_21ED0B0A6, buf, 2u);
  }

  uint64_t v18 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECED000, v18, OS_LOG_TYPE_INFO, "BEGIN \"SaveToPhotos\"", buf, 2u);
  }

  uint64_t v19 = +[SSScreenshotAssetManager sharedAssetManager];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __68__SSScreenCapturer__saveImageToPhotoLibrary_environmentDescription___block_invoke;
  v22[3] = &unk_2644EDED8;
  id v23 = v16;
  id v24 = v6;
  v25 = self;
  id v20 = v6;
  id v21 = v16;
  [v19 registerImageForPersistable:v20 options:v8 withRegistrationBlock:v22];
}

void __68__SSScreenCapturer__saveImageToPhotoLibrary_environmentDescription___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = _SSSignpostLog();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SaveToPhotos", (const char *)&unk_21ED0B0A6, buf, 2u);
  }

  id v7 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_21ECED000, v7, OS_LOG_TYPE_INFO, "END \"SaveToPhotos\"", v10, 2u);
  }

  uint64_t v8 = objc_alloc_init(SSImageIdentifierUpdate);
  [(SSImageIdentifierUpdate *)v8 setEnvironmentDescriptionIdentifier:*(void *)(a1 + 32)];
  if (a2)
  {
    [(SSImageIdentifierUpdate *)v8 setImageIdentifier:v5];
  }
  else
  {
    uint64_t v9 = os_log_create("com.apple.screenshotservices", "Capture");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __68__SSScreenCapturer__saveImageToPhotoLibrary_environmentDescription___block_invoke_cold_1(a1, v9);
    }
  }
  [(SSImageIdentifierUpdate *)v8 setSuccess:a2];
  [*(id *)(*(void *)(a1 + 48) + 16) sendDittoProcessImageIdentifierUpdate:v8];
}

- (void)_preheatAndTakeScreenshotIfPossibleWithOptionsCollection:(id)a3 presentationOptions:(id)a4 appleInternalOptions:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _SSSignpostLog();
  if (os_signpost_enabled(v11))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CalledBySpringBoard", (const char *)&unk_21ED0B0A6, (uint8_t *)&v22, 2u);
  }

  uint64_t v12 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_21ECED000, v12, OS_LOG_TYPE_INFO, "DISCRETE \"CalledBySpringBoard\"", (uint8_t *)&v22, 2u);
  }

  char v13 = _SSSignpostLog();
  if (os_signpost_enabled(v13))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v13, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ScreenshotGestureToAnimationStart", (const char *)&unk_21ED0B0A6, (uint8_t *)&v22, 2u);
  }

  id v14 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_21ECED000, v14, OS_LOG_TYPE_INFO, "BEGIN \"ScreenshotGestureToAnimationStart\"", (uint8_t *)&v22, 2u);
  }

  uint64_t v15 = _SSSignpostLog();
  if (os_signpost_enabled(v15))
  {
    LOWORD(v22) = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v15, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "ServiceLaunch", (const char *)&unk_21ED0B0A6, (uint8_t *)&v22, 2u);
  }

  uint64_t v16 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    LOWORD(v22) = 0;
    _os_log_impl(&dword_21ECED000, v16, OS_LOG_TYPE_INFO, "BEGIN \"ServiceLaunch\"", (uint8_t *)&v22, 2u);
  }

  [(SSDittoRemoteConnection *)self->_dittoRemoteConnection preheatDittoProcess];
  uint64_t v17 = os_log_create("com.apple.screenshotservices", "Capture");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v9 description];
    int v22 = 138412290;
    id v23 = v18;
    _os_log_impl(&dword_21ECED000, v17, OS_LOG_TYPE_INFO, "Asked to capture with presentation options %@", (uint8_t *)&v22, 0xCu);
  }
  uint64_t v19 = +[SSScreenCaptureAbilityCheck abilityCheck];
  if ([v19 isAbleToTakeScreenshots])
  {
    [(SSScreenshotsWindow *)self->_serviceWindow activateRemoteViewControllerIfAppropriate];
    [(SSScreenCapturer *)self _takeScreenshotWithOptionsCollection:v8 serviceOptions:0 presentationOptions:v9 appleInternalOptions:v10];
  }
  else
  {
    id v20 = os_log_create("com.apple.screenshotservices", "Capture");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = [v19 reasonForNotBeingAbleToTakeScreenshots];
      int v22 = 138412290;
      id v23 = v21;
      _os_log_impl(&dword_21ECED000, v20, OS_LOG_TYPE_INFO, "Could not comply with request to capture for reason: %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)_takeScreenshotWithOptionsCollection:(id)a3 serviceOptions:(id)a4 presentationOptions:(id)a5 appleInternalOptions:(id)a6
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  id v43 = a3;
  id v47 = a4;
  id v46 = a5;
  id v45 = a6;
  id v10 = [MEMORY[0x263F08C38] UUID];
  v49 = [v10 UUIDString];

  v48 = [MEMORY[0x263EFF910] date];
  v50 = [MEMORY[0x263EFF980] array];
  uint64_t v11 = _SSSignpostLog();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "CaptureScreen", (const char *)&unk_21ED0B0A6, buf, 2u);
  }

  uint64_t v12 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECED000, v12, OS_LOG_TYPE_INFO, "BEGIN \"CaptureScreen\"", buf, 2u);
  }

  unsigned __int8 v60 = 0;
  char v13 = [(SSSnapshotter *)self->_snapshotter captureAvailableSnapshotsWithOptionsCollection:v43 didFindOnenessScreens:&v60];
  id v14 = _SSSignpostLog();
  if (os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_21ECED000, v14, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "CaptureScreen", (const char *)&unk_21ED0B0A6, buf, 2u);
  }

  uint64_t v15 = os_log_create("com.apple.screenshotservices", "Performance");
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ECED000, v15, OS_LOG_TYPE_INFO, "END \"CaptureScreen\"", buf, 2u);
  }

  uint64_t v16 = [v13 count];
  uint64_t v17 = os_log_create("com.apple.screenshotservices", "Capture");
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    uint64_t v18 = [v49 shorterLoggableString];
    *(_DWORD *)buf = 134218242;
    *(void *)&uint8_t buf[4] = v16;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v18;
    _os_log_impl(&dword_21ECED000, v17, OS_LOG_TYPE_INFO, "Have %ld potential snapshots for session %@", buf, 0x16u);
  }
  [(id)objc_opt_class() playScreenshotSound];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v13;
  uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
  if (v51)
  {
    uint64_t v44 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v51; ++i)
      {
        if (*(void *)v57 != v44) {
          objc_enumerationMutation(obj);
        }
        id v20 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        id v21 = [v20 screen];
        [v50 addObject:v21];
        int v22 = [v20 image];
        id v23 = [(SSScreenCapturer *)self _environmentDescriptionFromImage:v22];

        [v23 setDate:v48];
        [v23 setSessionIdentifier:v49];
        [v21 scale];
        objc_msgSend(v23, "setImageScale:");
        [v23 setServiceOptions:v47];
        objc_msgSend(v23, "setPresentationMode:", objc_msgSend(v46, "presentationMode"));
        [v23 setAppleInternalOptions:v45];
        [v23 setHasOnenessScreen:v60];
        if (v21)
        {
          uint64_t v24 = [v43 screenshotOptionsForScreen:v21];
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v23, "setExternalFlashLayerContextID:", objc_msgSend(v24, "externalFlashLayerContextID"));
            objc_msgSend(v23, "setExternalFlashLayerRenderID:", objc_msgSend(v25, "externalFlashLayerRenderID"));
          }
        }
        else
        {
          v25 = 0;
        }
        if ([(SSScreenCapturer *)self _screenshotWasTakenOverBetaApp])
        {
          id v26 = [(SSScreenCapturer *)self _bundleIDForCurrentApplication];
          if ([(SSScreenCapturer *)self _betaFeedbackEnabled:v26])
          {
            [v23 setBetaApplicationBundleID:v26];
            v27 = [(SSScreenCapturer *)self _betaApplicationName];
            [v23 setBetaApplicationName:v27];
          }
        }
        objc_msgSend(v23, "setCanAutosaveToFiles:", objc_msgSend((id)objc_opt_class(), "_filesAppExistsOnSystem"));
        [v23 setSkipShutterSound:1];
        if (self->_recap)
        {
          uint64_t v61 = 0;
          v62 = &v61;
          uint64_t v63 = 0x2050000000;
          uint64_t v28 = (void *)getRCPMovieClass_softClass_0;
          uint64_t v64 = getRCPMovieClass_softClass_0;
          if (!getRCPMovieClass_softClass_0)
          {
            *(void *)buf = MEMORY[0x263EF8330];
            *(void *)&buf[8] = 3221225472;
            *(void *)&uint8_t buf[16] = __getRCPMovieClass_block_invoke_0;
            v67 = &unk_2644ED6B8;
            v68 = &v61;
            __getRCPMovieClass_block_invoke_0((uint64_t)buf);
            uint64_t v28 = (void *)v62[3];
          }
          v29 = v28;
          _Block_object_dispose(&v61, 8);
          id v30 = [v29 alloc];
          v31 = (void *)[(RCPEventStreamRecorder *)self->_recap copy];
          char v32 = [(RCPScreenRecorder *)self->_recapSnapshotter snapshots];
          long long v33 = (void *)[v30 initWithEventStream:v31 snapshots:v32];

          long long v34 = objc_alloc_init(SSEnvironmentDescriptionAppleInternalOptions);
          [v23 setAppleInternalOptions:v34];

          long long v35 = [v23 appleInternalOptions];
          [v35 setRecapMovie:v33];
        }
        long long v36 = [MEMORY[0x263F1C920] mainScreen];
        BOOL v37 = v21 == v36;

        if (v37)
        {
          long long v38 = [(SSScreenCapturer *)self _currentDisplayLayout];
          [v23 takeElementsFromDisplayLayout:v38];
        }
        objc_initWeak((id *)buf, self);
        v52[0] = MEMORY[0x263EF8330];
        v52[1] = 3221225472;
        v52[2] = __113__SSScreenCapturer__takeScreenshotWithOptionsCollection_serviceOptions_presentationOptions_appleInternalOptions___block_invoke;
        v52[3] = &unk_2644EDF28;
        id v39 = v23;
        id v53 = v39;
        objc_copyWeak(&v55, (id *)buf);
        v54 = v20;
        [(SSScreenCapturer *)self _sendEnvironmentDescription:v39 withCompletion:v52];
        objc_destroyWeak(&v55);

        objc_destroyWeak((id *)buf);
      }
      uint64_t v51 = [obj countByEnumeratingWithState:&v56 objects:v65 count:16];
    }
    while (v51);
  }

  long long v40 = [(SSScreenCapturer *)self delegate];

  if (v40)
  {
    v41 = [(SSScreenCapturer *)self delegate];
    [v41 screenCapturer:self didCaptureScreenshotsOfScreens:v50];
  }
}

void __113__SSScreenCapturer__takeScreenshotWithOptionsCollection_serviceOptions_presentationOptions_appleInternalOptions___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) serviceOptions];
  uint64_t v3 = [v2 saveLocation];

  if (v3 != 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    if (WeakRetained)
    {
      objc_initWeak(&location, WeakRetained);
      uint64_t v5 = *(void *)(a1 + 32);
      v8[0] = MEMORY[0x263EF8330];
      v8[1] = 3221225472;
      v8[2] = __113__SSScreenCapturer__takeScreenshotWithOptionsCollection_serviceOptions_presentationOptions_appleInternalOptions___block_invoke_2;
      v8[3] = &unk_2644EDF00;
      objc_copyWeak(&v10, &location);
      int8x16_t v7 = *(int8x16_t *)(a1 + 32);
      id v6 = (id)v7.i64[0];
      int8x16_t v9 = vextq_s8(v7, v7, 8uLL);
      [WeakRetained _captureAndSendMetadataAndDocumentForEnvironmentDescription:v5 metadataCaptureCompletion:v8];

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __113__SSScreenCapturer__takeScreenshotWithOptionsCollection_serviceOptions_presentationOptions_appleInternalOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v2 = [*(id *)(a1 + 32) image];
    uint64_t v3 = SSCGImageBackedImageFromImage(v2);

    [WeakRetained _saveImageToPhotoLibrary:v3 environmentDescription:*(void *)(a1 + 40)];
  }
}

- (BOOL)_screenshotWasTakenOverBetaApp
{
  uint64_t v2 = [(SSScreenCapturer *)self _applicationProxyForCurrentApp];
  uint64_t v3 = v2;
  if (!v2) {
    goto LABEL_8;
  }
  id v4 = [v2 applicationType];
  if (![v4 isEqualToString:@"User"]) {
    goto LABEL_7;
  }
  uint64_t v5 = [v3 itemID];
  if (![v5 unsignedIntegerValue])
  {

LABEL_7:
    goto LABEL_8;
  }
  char v6 = [v3 isBetaApp];

  if ((v6 & 1) == 0)
  {
LABEL_8:
    BOOL v7 = 0;
    goto LABEL_9;
  }
  BOOL v7 = 1;
LABEL_9:

  return v7;
}

- (id)_betaApplicationName
{
  uint64_t v2 = [(SSScreenCapturer *)self _applicationProxyForCurrentApp];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 itemName];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_bundleIDForCurrentApplication
{
  uint64_t v2 = [(SSScreenCapturer *)self _currentDisplayLayout];
  uint64_t v3 = [v2 elements];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    uint64_t v5 = [v2 elements];
    char v6 = [v5 objectAtIndexedSubscript:0];

    BOOL v7 = [v6 bundleIdentifier];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)_applicationProxyForCurrentApp
{
  uint64_t v2 = [(SSScreenCapturer *)self _bundleIDForCurrentApplication];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F01868] applicationProxyForIdentifier:v2];
  }
  else
  {
    uint64_t v3 = 0;
  }

  return v3;
}

- (BOOL)_betaFeedbackEnabled:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2050000000;
  uint64_t v4 = (void *)getTFBetaApplicationProxyClass_softClass;
  uint64_t v13 = getTFBetaApplicationProxyClass_softClass;
  if (!getTFBetaApplicationProxyClass_softClass)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __getTFBetaApplicationProxyClass_block_invoke;
    v9[3] = &unk_2644ED6B8;
    v9[4] = &v10;
    __getTFBetaApplicationProxyClass_block_invoke((uint64_t)v9);
    uint64_t v4 = (void *)v11[3];
  }
  uint64_t v5 = v4;
  _Block_object_dispose(&v10, 8);
  char v6 = (void *)[[v5 alloc] initForAppWithIdentifier:v3];
  char v7 = [v6 isProactiveFeedbackEnabledForInstalledVersion];

  return v7;
}

+ (BOOL)_filesAppExistsOnSystem
{
  uint64_t v2 = [MEMORY[0x263F01868] applicationProxyForIdentifier:@"com.apple.DocumentsApp"];
  id v3 = [v2 appState];
  char v4 = [v3 isInstalled];

  return v4;
}

- (id)_currentDisplayLayout
{
  layoutMonitor = self->_layoutMonitor;
  if (!layoutMonitor)
  {
    char v4 = (void *)MEMORY[0x263F3F728];
    uint64_t v5 = [MEMORY[0x263F3F738] configurationForDefaultMainDisplayMonitor];
    char v6 = [v4 monitorWithConfiguration:v5];
    char v7 = self->_layoutMonitor;
    self->_layoutMonitor = v6;

    layoutMonitor = self->_layoutMonitor;
  }
  return (id)[(FBSDisplayLayoutMonitor *)layoutMonitor currentLayout];
}

+ (BOOL)shouldUseScreenCapturerForScreenshots
{
  return 1;
}

+ (void)playScreenshotSound
{
  uint64_t v5 = 0;
  char v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v2 = (void (*)(uint64_t))getAudioServicesPlaySystemSoundSymbolLoc_ptr;
  id v8 = getAudioServicesPlaySystemSoundSymbolLoc_ptr;
  if (!getAudioServicesPlaySystemSoundSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __getAudioServicesPlaySystemSoundSymbolLoc_block_invoke;
    v4[3] = &unk_2644ED6B8;
    v4[4] = &v5;
    __getAudioServicesPlaySystemSoundSymbolLoc_block_invoke((uint64_t)v4);
    uint64_t v2 = (void (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
  {
    id v3 = (_Unwind_Exception *)-[SSScreenshotAssetManagerPhotoLibraryBackend saveImageToTemporaryLocation:withName:imageDescription:completionHandler:]();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v3);
  }
  v2(1108);
}

- (void)server:(id)a3 handleRequest:(id)a4 withCompletion:(id)a5
{
  id v12 = a4;
  id v7 = a5;
  [(SSScreenshotsWindow *)self->_serviceWindow activateRemoteViewControllerIfAppropriate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v12;
    int8x16_t v9 = [v8 image];
    uint64_t v10 = [(SSScreenCapturer *)self _environmentDescriptionFromImage:v9];
    uint64_t v11 = [v8 options];

    [(SSScreenCapturerPresentationOptions *)v10 setServiceOptions:v11];
    [(SSScreenCapturer *)self _sendEnvironmentDescription:v10 savingImageToPhotos:v9 withCompletion:v7];
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = (SSScreenCapturerPresentationOptions *)v12;
      int8x16_t v9 = [(SSScreenCapturer *)self _testingCoordinator];
      [v9 handleRunPPTRequest:v10];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_8;
      }
      int8x16_t v9 = [v12 options];
      uint64_t v10 = objc_alloc_init(SSScreenCapturerPresentationOptions);
      [(SSScreenCapturerPresentationOptions *)v10 setPresentationMode:0];
      [(SSScreenCapturer *)self _takeScreenshotWithOptionsCollection:0 serviceOptions:v9 presentationOptions:v10 appleInternalOptions:0];
    }
  }

LABEL_8:
}

- (UIWindow)screenshotsWindow
{
  return (UIWindow *)self->_serviceWindow;
}

- (id)_testingCoordinator
{
  testingCoordinator = self->_testingCoordinator;
  if (!testingCoordinator)
  {
    char v4 = objc_alloc_init(SSTestingCoordinator);
    uint64_t v5 = self->_testingCoordinator;
    self->_testingCoordinator = v4;

    [(SSTestingCoordinator *)self->_testingCoordinator setDelegate:self];
    testingCoordinator = self->_testingCoordinator;
  }
  return testingCoordinator;
}

- (void)testingCoordinator:(id)a3 requestsTakingScreenshotForRunPPTRequest:(id)a4
{
  id v5 = a4;
  char v6 = objc_alloc_init(SSEnvironmentDescriptionAppleInternalOptions);
  [(SSEnvironmentDescriptionAppleInternalOptions *)v6 setRunPPTServiceRequest:v5];
  if ([v5 numberOfRequiredScreenshots])
  {
    unint64_t v7 = 0;
    id v8 = MEMORY[0x263EF83A0];
    do
    {
      dispatch_time_t v9 = dispatch_time(0, (uint64_t)((double)++v7 * 1000000000.0));
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __80__SSScreenCapturer_testingCoordinator_requestsTakingScreenshotForRunPPTRequest___block_invoke;
      v10[3] = &unk_2644ED8E8;
      v10[4] = self;
      uint64_t v11 = v6;
      dispatch_after(v9, v8, v10);
    }
    while (v7 < [v5 numberOfRequiredScreenshots]);
  }
}

uint64_t __80__SSScreenCapturer_testingCoordinator_requestsTakingScreenshotForRunPPTRequest___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _preheatAndTakeScreenshotIfPossibleWithOptionsCollection:0 presentationOptions:0 appleInternalOptions:*(void *)(a1 + 40)];
}

- (SSScreenCapturerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SSScreenCapturerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_layoutMonitor, 0);
  objc_storeStrong((id *)&self->_recapSnapshotter, 0);
  objc_storeStrong((id *)&self->_recap, 0);
  objc_storeStrong((id *)&self->_serviceWindow, 0);
  objc_storeStrong((id *)&self->_testingCoordinator, 0);
  objc_storeStrong((id *)&self->_uiServiceServer, 0);
  objc_storeStrong((id *)&self->_metadataCapturer, 0);
  objc_storeStrong((id *)&self->_dittoRemoteConnection, 0);
  objc_storeStrong((id *)&self->_snapshotter, 0);
}

void __68__SSScreenCapturer__saveImageToPhotoLibrary_environmentDescription___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [*(id *)(a1 + 40) description];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_21ECED000, a2, OS_LOG_TYPE_ERROR, "Failed to register snapshot with image %@ with backend", (uint8_t *)&v4, 0xCu);
}

@end