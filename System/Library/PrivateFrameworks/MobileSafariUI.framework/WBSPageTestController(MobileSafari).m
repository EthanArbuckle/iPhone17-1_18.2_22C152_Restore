@interface WBSPageTestController(MobileSafari)
- (void)pageTestController:()MobileSafari navigateAndCaptureFormsMetadataForURL:completionHandler:;
- (void)pageTestController:()MobileSafari resizeViewport:completionHandler:;
- (void)pageTestControllerInitializeApp:()MobileSafari completionHandler:;
- (void)pageTestControllerTerminateApp:()MobileSafari;
@end

@implementation WBSPageTestController(MobileSafari)

- (void)pageTestControllerInitializeApp:()MobileSafari completionHandler:
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__WBSPageTestController_MobileSafari__pageTestControllerInitializeApp_completionHandler___block_invoke;
  block[3] = &unk_1E6D78410;
  id v11 = v6;
  uint64_t v12 = a1;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)pageTestController:()MobileSafari navigateAndCaptureFormsMetadataForURL:completionHandler:
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __114__WBSPageTestController_MobileSafari__pageTestController_navigateAndCaptureFormsMetadataForURL_completionHandler___block_invoke;
  block[3] = &unk_1E6D7A938;
  id v15 = v8;
  id v16 = v9;
  id v14 = v7;
  id v10 = v8;
  id v11 = v9;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)pageTestController:()MobileSafari resizeViewport:completionHandler:
{
  id v9 = a5;
  id v10 = a6;
  if (a1 <= 0.0 || a2 <= 0.0)
  {
    id v11 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12 == 1) {
      a1 = 768.0;
    }
    else {
      a1 = 375.0;
    }
    if (v12 == 1) {
      a2 = 1024.0;
    }
    else {
      a2 = 667.0;
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __91__WBSPageTestController_MobileSafari__pageTestController_resizeViewport_completionHandler___block_invoke;
  v15[3] = &unk_1E6D7A960;
  double v18 = a1;
  double v19 = a2;
  id v16 = v9;
  id v17 = v10;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

- (void)pageTestControllerTerminateApp:()MobileSafari
{
}

@end