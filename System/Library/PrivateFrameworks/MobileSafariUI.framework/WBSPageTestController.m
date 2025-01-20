@interface WBSPageTestController
@end

@implementation WBSPageTestController

void __89__WBSPageTestController_MobileSafari__pageTestControllerInitializeApp_completionHandler___block_invoke(id *a1)
{
  v2 = +[Application sharedApplication];
  v3 = [v2 primaryBrowserController];

  v4 = [v3 tabController];
  [v4 closeAllOpenTabsAnimated:0];

  v5 = [v3 tabController];
  v6 = [[TabDocumentForPageTest alloc] initWithBrowserController:v3];
  -[TabDocumentForPageTest setAllowsNetworkAccess:](v6, "setAllowsNetworkAccess:", [a1[4] allowsNetworkAccess]);
  uint64_t v7 = [a1[4] allowsContentJavaScript];
  v8 = [(TabDocument *)v6 webView];
  v9 = [v8 configuration];
  v10 = [v9 defaultWebpagePreferences];
  [v10 setAllowsContentJavaScript:v7];

  v11 = [v5 activeTabDocument];
  [v5 insertNewTabDocument:v6 forcingOrderAfterTabDocument:v11 inBackground:0 animated:0];

  objc_setAssociatedObject(a1[5], sel_tabDocument, v6, (void *)1);
  dispatch_time_t v12 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__WBSPageTestController_MobileSafari__pageTestControllerInitializeApp_completionHandler___block_invoke_2;
  block[3] = &unk_1E6D77E70;
  id v14 = a1[6];
  dispatch_after(v12, MEMORY[0x1E4F14428], block);
}

uint64_t __89__WBSPageTestController_MobileSafari__pageTestControllerInitializeApp_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __114__WBSPageTestController_MobileSafari__pageTestController_navigateAndCaptureFormsMetadataForURL_completionHandler___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __114__WBSPageTestController_MobileSafari__pageTestController_navigateAndCaptureFormsMetadataForURL_completionHandler___block_invoke_2;
  v5[3] = &unk_1E6D7A910;
  id v6 = *(id *)(a1 + 48);
  v2 = [*(id *)(a1 + 32) tabDocument];
  [v2 setMetadataHandler:v5];

  v3 = [*(id *)(a1 + 32) tabDocument];
  id v4 = (id)[v3 loadURL:*(void *)(a1 + 40) userDriven:1];
}

uint64_t __114__WBSPageTestController_MobileSafari__pageTestController_navigateAndCaptureFormsMetadataForURL_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __91__WBSPageTestController_MobileSafari__pageTestController_resizeViewport_completionHandler___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) tabDocument];
  objc_msgSend(v2, "setFixedWebViewSize:completionHandler:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
}

uint64_t __70__WBSPageTestController_MobileSafari__pageTestControllerTerminateApp___block_invoke()
{
  return [(id)*MEMORY[0x1E4FB2608] terminateWithSuccess];
}

@end