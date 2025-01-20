@interface SSScreenshotMetadataHarvester
+ (BOOL)canGenerateDocumentForIdentifier:(id)a3;
+ (id)_applicationScreenshotServiceWithPrivateDelegate:(BOOL)a3;
+ (id)_contentRectsForMetadata;
+ (id)_screenshotServiceForWindowScene:(id)a3 wantsPrivateDelegate:(BOOL)a4;
+ (id)_screenshotServicesDelegateWithIdentifier:(id)a3;
+ (id)screenshotServiceWithIdentifier:(id)a3;
+ (void)_crawlView:(id)a3 executingBlock:(id)a4;
+ (void)_crawlViewController:(id)a3 executingBlock:(id)a4;
+ (void)_grabPDFRepresentationForIdentifier:(id)a3 withCallback:(id)a4;
+ (void)_grabUserActivityTitleWithCallback:(id)a3;
+ (void)harvestScreenshotMetadataAndRespondToAction:(id)a3;
+ (void)sendResponseForAction:(id)a3 withObject:(id)a4 forKey:(unint64_t)a5;
@end

@implementation SSScreenshotMetadataHarvester

+ (void)_crawlViewController:(id)a3 executingBlock:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v7[2](v7, v6);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = objc_msgSend(v6, "childViewControllers", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        [a1 _crawlViewController:*(void *)(*((void *)&v15 + 1) + 8 * v12++) executingBlock:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  v13 = [v6 presentedViewController];

  if (v13)
  {
    v14 = [v6 presentedViewController];
    [a1 _crawlViewController:v14 executingBlock:v7];
  }
}

+ (void)_crawlView:(id)a3 executingBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  v7[2](v7, v6);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v8 = objc_msgSend(v6, "subviews", 0);
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        [a1 _crawlView:*(void *)(*((void *)&v13 + 1) + 8 * v12++) executingBlock:v7];
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

+ (id)_contentRectsForMetadata
{
  v3 = [MEMORY[0x263EFF980] array];
  v4 = [MEMORY[0x263F1CBC8] keyWindow];
  v5 = [MEMORY[0x263F1CBC8] keyWindow];
  id v6 = [v5 rootViewController];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  uint64_t v20 = __57__SSScreenshotMetadataHarvester__contentRectsForMetadata__block_invoke;
  v21 = &unk_2644ED730;
  id v7 = v4;
  id v22 = v7;
  id v8 = v3;
  id v23 = v8;
  [a1 _crawlViewController:v6 executingBlock:&v18];

  objc_msgSend(MEMORY[0x263F1C850], "visiblePeripheralFrame", v18, v19, v20, v21);
  double x = v24.origin.x;
  double y = v24.origin.y;
  double width = v24.size.width;
  double height = v24.size.height;
  if (!CGRectIsNull(v24))
  {
    id v13 = v7;
    objc_msgSend(v13, "convertRect:fromView:", 0, x, y, width, height);
    long long v14 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:");

    [v8 addObject:v14];
  }
  long long v15 = v23;
  id v16 = v8;

  return v16;
}

void __57__SSScreenshotMetadataHarvester__contentRectsForMetadata__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 viewIfLoaded];
  if (v3)
  {
    id v18 = v3;
    [v3 safeAreaInsets];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    [v18 bounds];
    objc_msgSend(*(id *)(a1 + 32), "convertRect:fromCoordinateSpace:", v18, v7 + v12, v5 + v13, v14 - (v7 + v11), v15 - (v5 + v9));
    id v16 = *(void **)(a1 + 40);
    long long v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGRect:");
    [v16 addObject:v17];

    v3 = v18;
  }
}

+ (void)_grabUserActivityTitleWithCallback:(id)a3
{
  id v3 = a3;
  double v4 = [MEMORY[0x263F018D0] _currentUserActivityUUID];
  double v5 = (void *)MEMORY[0x263F018D0];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke;
  v7[3] = &unk_2644ED7A8;
  id v8 = v3;
  id v6 = v3;
  [v5 _fetchUserActivityWithUUID:v4 completionHandler:v7];
}

void __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = v5;
  if (!v5 || a3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke_2;
    block[3] = &unk_2644ED758;
    id v25 = *(id *)(a1 + 32);
    dispatch_async(MEMORY[0x263EF83A0], block);
    id v9 = v25;
  }
  else
  {
    double v7 = [v5 title];
    id v8 = [v6 webpageURL];
    id v9 = v7;
    id v10 = (id)[v9 UTF8String];
    id v11 = [v8 absoluteString];
    id v12 = (id)[v11 UTF8String];

    if (v10)
    {
      double v13 = [v6 expirationDate];
      if (v13) {
        double v14 = 0;
      }
      else {
        double v14 = v9;
      }
      id v10 = v14;
    }
    if (v12)
    {
      double v15 = [v6 expirationDate];
      if (v15) {
        id v16 = 0;
      }
      else {
        id v16 = v8;
      }
      id v12 = v16;
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke_3;
    v20[3] = &unk_2644ED780;
    id v17 = *(id *)(a1 + 32);
    id v22 = v12;
    id v23 = v17;
    id v21 = v10;
    id v18 = v12;
    id v19 = v10;
    dispatch_async(MEMORY[0x263EF83A0], v20);
  }
}

uint64_t __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __68__SSScreenshotMetadataHarvester__grabUserActivityTitleWithCallback___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

+ (id)screenshotServiceWithIdentifier:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  double v4 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", 0);
  id v5 = [v4 connectedScenes];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v6)
  {
LABEL_9:

    id v14 = 0;
LABEL_13:
    uint64_t v15 = [(id)objc_opt_class() _applicationScreenshotServiceWithPrivateDelegate:1];
    if (!v15)
    {
      uint64_t v15 = [(id)objc_opt_class() _applicationScreenshotServiceWithPrivateDelegate:0];
    }
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  uint64_t v8 = *(void *)v19;
LABEL_3:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v19 != v8) {
      objc_enumerationMutation(v5);
    }
    id v10 = *(void **)(*((void *)&v18 + 1) + 8 * v9);
    id v11 = [v10 _FBSScene];
    id v12 = [v11 identifier];
    char v13 = [v12 isEqual:v3];

    if (v13) {
      break;
    }
    if (v7 == ++v9)
    {
      uint64_t v7 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v7) {
        goto LABEL_3;
      }
      goto LABEL_9;
    }
  }
  id v14 = v10;

  if (!v14) {
    goto LABEL_13;
  }
  uint64_t v15 = [(id)objc_opt_class() _screenshotServiceForWindowScene:v14 wantsPrivateDelegate:1];
  if (!v15)
  {
    id v16 = [(id)objc_opt_class() _screenshotServiceForWindowScene:v14 wantsPrivateDelegate:0];
    if (v16) {
      goto LABEL_16;
    }
    goto LABEL_13;
  }
LABEL_15:
  id v16 = (void *)v15;
LABEL_16:

  return v16;
}

+ (id)_applicationScreenshotServiceWithPrivateDelegate:(BOOL)a3
{
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  id v16 = 0;
  id v5 = [MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = [v5 connectedScenes];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __82__SSScreenshotMetadataHarvester__applicationScreenshotServiceWithPrivateDelegate___block_invoke;
  v9[3] = &unk_2644ED7D0;
  BOOL v10 = a3;
  v9[4] = &v11;
  v9[5] = a1;
  [v6 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v7;
}

void __82__SSScreenshotMetadataHarvester__applicationScreenshotServiceWithPrivateDelegate___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(id)objc_opt_class() _screenshotServiceForWindowScene:v6 wantsPrivateDelegate:*(unsigned __int8 *)(a1 + 48)];
    if (v5)
    {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), v5);
      *a3 = 1;
    }
  }
}

+ (id)_screenshotServiceForWindowScene:(id)a3 wantsPrivateDelegate:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = [v5 _screenshotServiceIfPresent];
  id v7 = v6;
  if (v4) {
    [v6 privateDelegate];
  }
  else {
  uint64_t v8 = [v6 delegate];
  }

  if (![v5 activationState])
  {
    if (!v8)
    {
      uint64_t v9 = 0;
      goto LABEL_11;
    }
LABEL_9:
    uint64_t v9 = [v5 _screenshotServiceIfPresent];
    goto LABEL_11;
  }
  uint64_t v9 = 0;
  if ([v5 activationState] == 1 && v8) {
    goto LABEL_9;
  }
LABEL_11:

  return v9;
}

+ (id)_screenshotServicesDelegateWithIdentifier:(id)a3
{
  id v3 = [a1 screenshotServiceWithIdentifier:a3];
  BOOL v4 = [v3 privateDelegate];

  if (v4) {
    [v3 privateDelegate];
  }
  else {
  id v5 = [v3 delegate];
  }

  return v5;
}

+ (void)_grabPDFRepresentationForIdentifier:(id)a3 withCallback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  long long v18 = __Block_byref_object_copy_;
  long long v19 = __Block_byref_object_dispose_;
  id v20 = [a1 _screenshotServicesDelegateWithIdentifier:v6];
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x3032000000;
  v13[3] = __Block_byref_object_copy_;
  v13[4] = __Block_byref_object_dispose_;
  id v14 = [a1 screenshotServiceWithIdentifier:v6];
  if (!v16[5]) {
    goto LABEL_7;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (v16[5] && (objc_opt_respondsToSelector() & 1) != 0)
    {
      uint64_t v8 = (id *)v11;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_3;
      v11[3] = &unk_2644ED848;
      v11[5] = &v15;
      v11[6] = v13;
      goto LABEL_8;
    }
LABEL_7:
    uint64_t v8 = (id *)v10;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_5;
    v10[3] = &unk_2644ED758;
    goto LABEL_8;
  }
  uint64_t v8 = (id *)v12;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke;
  v12[3] = &unk_2644ED820;
  v12[5] = &v15;
LABEL_8:
  id v9 = v7;
  v8[4] = v9;
  dispatch_async(MEMORY[0x263EF83A0], v8);

  _Block_object_dispose(v13, 8);
  _Block_object_dispose(&v15, 8);
}

void __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_2;
  v2[3] = &unk_2644ED7F8;
  id v3 = *(id *)(a1 + 32);
  [v1 fetchPDFRepresentationWithCompletion:v2];
}

uint64_t __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_3(uint64_t a1)
{
  v1 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  uint64_t v2 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_4;
  v3[3] = &unk_2644ED7F8;
  id v4 = *(id *)(a1 + 32);
  [v1 screenshotService:v2 generatePDFRepresentationWithCompletion:v3];
}

uint64_t __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__SSScreenshotMetadataHarvester__grabPDFRepresentationForIdentifier_withCallback___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(double, double, double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
}

+ (BOOL)canGenerateDocumentForIdentifier:(id)a3
{
  id v3 = [a1 _screenshotServicesDelegateWithIdentifier:a3];

  return v3 != 0;
}

+ (void)sendResponseForAction:(id)a3 withObject:(id)a4 forKey:(unint64_t)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  char v9 = [v7 canSendResponse];
  BOOL v10 = os_log_create("com.apple.screenshotservices", "MetadataHarvester");
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      int v13 = 134217984;
      unint64_t v14 = a5;
      _os_log_impl(&dword_21ECED000, v10, OS_LOG_TYPE_DEFAULT, "Send response for action with key: %lu", (uint8_t *)&v13, 0xCu);
    }

    BOOL v10 = objc_alloc_init(MEMORY[0x263F29C78]);
    [v10 setObject:v8 forSetting:a5];
    id v12 = [MEMORY[0x263F29BC0] responseWithInfo:v10];
    [v7 sendResponse:v12];
  }
  else if (v11)
  {
    int v13 = 134217984;
    unint64_t v14 = a5;
    _os_log_impl(&dword_21ECED000, v10, OS_LOG_TYPE_DEFAULT, "Unable to send response for action with key: %lu", (uint8_t *)&v13, 0xCu);
  }
}

+ (void)harvestScreenshotMetadataAndRespondToAction:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 info];
  [v5 flagForSetting:7];
  char IsYes = BSSettingFlagIsYes();

  id v7 = [v4 info];
  id v8 = [v7 objectForSetting:10];

  if (IsYes)
  {
    char v9 = objc_alloc_init(SSHarvestedApplicationDocument);
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x2020000000;
    char v34 = 0;
    CFTimeInterval v10 = CACurrentMediaTime();
    BOOL v11 = os_log_create("com.apple.screenshotservices", "MetadataHarvester");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v40 = v8;
      _os_log_impl(&dword_21ECED000, v11, OS_LOG_TYPE_DEFAULT, "Grab PDF representation for identifier: %{private}@", buf, 0xCu);
    }

    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke_27;
    v26[3] = &unk_2644ED898;
    CFTimeInterval v31 = v10;
    id v27 = v8;
    v30 = v33;
    id v12 = v9;
    v28 = v12;
    id v32 = a1;
    id v13 = v4;
    id v29 = v13;
    [a1 _grabPDFRepresentationForIdentifier:v27 withCallback:v26];
    dispatch_time_t v14 = dispatch_time(0, 10000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke_28;
    block[3] = &unk_2644ED8C0;
    CGRect v24 = v33;
    id v25 = a1;
    id v22 = v12;
    id v23 = v13;
    id v15 = v13;
    id v16 = v12;
    dispatch_after(v14, MEMORY[0x263EF83A0], block);

    _Block_object_dispose(v33, 8);
  }
  else
  {
    uint64_t v17 = objc_alloc_init(SSHarvestedApplicationMetadata);
    long long v18 = [a1 _contentRectsForMetadata];
    [(SSHarvestedApplicationMetadata *)v17 setContentRects:v18];

    -[SSHarvestedApplicationMetadata setCanGenerateDocument:](v17, "setCanGenerateDocument:", [a1 canGenerateDocumentForIdentifier:v8]);
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke;
    v35[3] = &unk_2644ED870;
    id v37 = v4;
    id v38 = a1;
    v36 = v17;
    id v19 = v4;
    id v20 = v17;
    [a1 _grabUserActivityTitleWithCallback:v35];
  }
}

uint64_t __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  [v5 setUserActivityTitle:a2];
  [*(id *)(a1 + 32) setUserActivityURL:v6];

  uint64_t v8 = *(void *)(a1 + 40);
  id v7 = *(void **)(a1 + 48);
  uint64_t v9 = *(void *)(a1 + 32);
  return [v7 sendResponseForAction:v8 withObject:v9 forKey:3];
}

void __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke_27(uint64_t a1, void *a2, uint64_t a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v13 = a2;
  double v14 = CACurrentMediaTime();
  double v15 = *(double *)(a1 + 64);
  id v16 = os_log_create("com.apple.screenshotservices", "MetadataHarvester");
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v17 = *(void *)(a1 + 32);
    uint64_t v18 = [v13 length];
    v35.origin.double x = a4;
    v35.origin.double y = a5;
    v35.size.double width = a6;
    v35.size.double height = a7;
    id v19 = NSStringFromCGRect(v35);
    int v20 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
    int v22 = 138479107;
    uint64_t v23 = v17;
    __int16 v24 = 2048;
    uint64_t v25 = v18;
    __int16 v26 = 2048;
    uint64_t v27 = a3;
    __int16 v28 = 2113;
    id v29 = v19;
    __int16 v30 = 2048;
    double v31 = v14 - v15;
    __int16 v32 = 1024;
    int v33 = v20;
    _os_log_impl(&dword_21ECED000, v16, OS_LOG_TYPE_DEFAULT, "did grab PDF representation for identifier: %{private}@, data length: %lu, page: %ld, rect: %{private}@, elapsed time: %f, didSendResponse: %{BOOL}d", (uint8_t *)&v22, 0x3Au);
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    if ((unint64_t)[v13 length] >> 20 >= 0x4B) {
      id v21 = 0;
    }
    else {
      id v21 = v13;
    }
    [*(id *)(a1 + 40) setPDFData:v21];
    [*(id *)(a1 + 40) setPDFPage:a3];
    objc_msgSend(*(id *)(a1 + 40), "setPDFVisibleRect:", a4, a5, a6, a7);
    [*(id *)(a1 + 72) sendResponseForAction:*(void *)(a1 + 48) withObject:*(void *)(a1 + 40) forKey:4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

void __77__SSScreenshotMetadataHarvester_harvestScreenshotMetadataAndRespondToAction___block_invoke_28(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = os_log_create("com.apple.screenshotservices", "MetadataHarvester");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    v4[0] = 67109120;
    v4[1] = v3;
    _os_log_impl(&dword_21ECED000, v2, OS_LOG_TYPE_DEFAULT, "pdf harvesting timed out! didSendResponse: %{BOOL}d", (uint8_t *)v4, 8u);
  }

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    [*(id *)(a1 + 32) setPDFData:0];
    [*(id *)(a1 + 32) setPDFPage:0];
    objc_msgSend(*(id *)(a1 + 32), "setPDFVisibleRect:", *MEMORY[0x263F001A0], *(double *)(MEMORY[0x263F001A0] + 8), *(double *)(MEMORY[0x263F001A0] + 16), *(double *)(MEMORY[0x263F001A0] + 24));
    [*(id *)(a1 + 56) sendResponseForAction:*(void *)(a1 + 40) withObject:*(void *)(a1 + 32) forKey:4];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
  }
}

@end