@interface PXVisualDiagnosticsFactory
+ (id)debugQuickLookObjectWithRootProvider:(id)a3;
+ (void)_dismissProgressIndicator:(id)a3 completionHandler:(id)a4;
+ (void)_presentProgressIndicatorFromViewController:(id)a3 completionHandler:(id)a4;
+ (void)requestVisualDiagnosticsPDFDocumentURLWithConfiguration:(id)a3 resultHandler:(id)a4;
+ (void)requestVisualDiagnosticsPDFDocumentWithConfiguration:(id)a3 resultHandler:(id)a4;
+ (void)showVisualDiagnosticsWithConfiguration:(id)a3 fromViewController:(id)a4 completionHandler:(id)a5;
@end

@implementation PXVisualDiagnosticsFactory

+ (id)debugQuickLookObjectWithRootProvider:(id)a3
{
  id v3 = a3;
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  consumer = CGDataConsumerCreateWithCFData(Mutable);
  v31 = (void *)[objc_alloc((Class)off_1E5DA9860) initWithRootProvider:v3];
  v5 = (void *)[objc_alloc((Class)off_1E5DA9868) initWithConfiguration:v31 dataConsumer:consumer];
  dispatch_semaphore_t v6 = dispatch_semaphore_create(0);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __67__PXVisualDiagnosticsFactory_debugQuickLookObjectWithRootProvider___block_invoke;
  v32[3] = &unk_1E5DD3158;
  v7 = v6;
  v33 = v7;
  [v3 addVisualDiagnosticsToContext:v5 completionHandler:v32];
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  CGPDFContextClose((CGContextRef)[v5 CGContext]);
  v8 = CGDataProviderCreateWithCFData(Mutable);
  v9 = CGPDFDocumentCreateWithProvider(v8);
  size_t NumberOfPages = CGPDFDocumentGetNumberOfPages(v9);
  if (NumberOfPages)
  {
    uint64_t v11 = 0;
    CGFloat v12 = 0.0;
    double v13 = 64.0;
    double v14 = 64.0;
    CGFloat v15 = 0.0;
    do
    {
      uint64_t v16 = v11 + 1;
      Page = CGPDFDocumentGetPage(v9, v11 + 1);
      CGRect BoxRect = CGPDFPageGetBoxRect(Page, kCGPDFMediaBox);
      CGFloat x = BoxRect.origin.x;
      CGFloat y = BoxRect.origin.y;
      CGFloat width = BoxRect.size.width;
      CGFloat height = BoxRect.size.height;
      if (v11)
      {
        CGRect v36 = CGRectOffset(BoxRect, 0.0, v13);
        CGFloat x = v36.origin.x;
        CGFloat y = v36.origin.y;
        CGFloat width = v36.size.width;
        CGFloat height = v36.size.height;
      }
      v37.origin.CGFloat x = v15;
      v37.origin.CGFloat y = v12;
      v37.size.CGFloat width = v14;
      v37.size.CGFloat height = v13;
      v41.origin.CGFloat x = x;
      v41.origin.CGFloat y = y;
      v41.size.CGFloat width = width;
      v41.size.CGFloat height = height;
      CGRect v38 = CGRectUnion(v37, v41);
      CGFloat v15 = v38.origin.x;
      CGFloat v12 = v38.origin.y;
      double v14 = v38.size.width;
      double v13 = v38.size.height;
      ++v11;
    }
    while (NumberOfPages != v16);
  }
  else
  {
    CGFloat v15 = 0.0;
    double v14 = 64.0;
    CGFloat v12 = 0.0;
    double v13 = 64.0;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v23 = CGBitmapContextCreate(0, (unint64_t)v14, (unint64_t)v13, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  CGContextSetRGBFillColor(v23, 1.0, 1.0, 1.0, 1.0);
  v39.origin.CGFloat x = v15;
  v39.origin.CGFloat y = v12;
  v39.size.CGFloat width = v14;
  v39.size.CGFloat height = v13;
  CGContextFillRect(v23, v39);
  if (NumberOfPages)
  {
    uint64_t v24 = 0;
    do
    {
      v25 = CGPDFDocumentGetPage(v9, ++v24);
      CGRect v40 = CGPDFPageGetBoxRect(v25, kCGPDFMediaBox);
      CGFloat v26 = v40.size.height;
      CGContextDrawPDFPage(v23, v25);
      CGContextTranslateCTM(v23, 0.0, v26);
    }
    while (NumberOfPages != v24);
  }
  CGContextFlush(v23);
  Image = CGBitmapContextCreateImage(v23);
  v28 = [MEMORY[0x1E4FB1818] imageWithCGImage:Image];
  CGImageRelease(Image);
  CGContextRelease(v23);
  CGPDFDocumentRelease(v9);
  CGDataProviderRelease(v8);
  CGDataConsumerRelease(consumer);
  CFRelease(Mutable);

  return v28;
}

void __67__PXVisualDiagnosticsFactory_debugQuickLookObjectWithRootProvider___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    dispatch_semaphore_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "visual diagnostics failed: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)requestVisualDiagnosticsPDFDocumentURLWithConfiguration:(id)a3 resultHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v5 rootProvider];
  if (v7)
  {
    id v8 = (void *)[objc_alloc((Class)off_1E5DA9868) initWithConfiguration:v5];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __100__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentURLWithConfiguration_resultHandler___block_invoke;
    v10[3] = &unk_1E5DD2B90;
    id v11 = v8;
    id v12 = v6;
    id v9 = v8;
    [v7 addVisualDiagnosticsToContext:v9 completionHandler:v10];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"root provider not specified");
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v9);
  }
}

void __100__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentURLWithConfiguration_resultHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(id *)(a1 + 32);
  *(id *)(a1 + 40);
  id v5 = v4;
  px_dispatch_on_main_queue();
}

void __100__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentURLWithConfiguration_resultHandler___block_invoke_2(uint64_t a1)
{
  CGPDFContextClose((CGContextRef)[*(id *)(a1 + 32) CGContext]);
  if (!*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = *(void *)(a1 + 48);
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithUnderlyingError:debugDescription:", *(void *)(a1 + 40), @"visual diagnostics failed to be added");
    (*(void (**)(uint64_t, void, uint64_t))(v4 + 16))(v4, 0, v7);
    goto LABEL_5;
  }
  uint64_t v2 = [*(id *)(a1 + 32) fileURL];
  uint64_t v3 = *(void *)(a1 + 48);
  if (v2)
  {
    uint64_t v7 = v2;
    (*(void (**)(uint64_t))(v3 + 16))(v3);
LABEL_5:
    id v5 = (void *)v7;
    goto LABEL_7;
  }
  id v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"missing fileURL");
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v6);

  id v5 = 0;
LABEL_7:
}

+ (void)requestVisualDiagnosticsPDFDocumentWithConfiguration:(id)a3 resultHandler:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __97__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentWithConfiguration_resultHandler___block_invoke;
  v8[3] = &unk_1E5DCDAC0;
  id v9 = v6;
  id v7 = v6;
  [a1 requestVisualDiagnosticsPDFDocumentURLWithConfiguration:a3 resultHandler:v8];
}

void __97__PXVisualDiagnosticsFactory_requestVisualDiagnosticsPDFDocumentWithConfiguration_resultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v6 = a3;
  if (v5)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x2050000000;
    id v7 = (void *)getPDFDocumentClass_softClass;
    uint64_t v14 = getPDFDocumentClass_softClass;
    if (!getPDFDocumentClass_softClass)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __getPDFDocumentClass_block_invoke;
      v10[3] = &unk_1E5DD2B08;
      void v10[4] = &v11;
      __getPDFDocumentClass_block_invoke((uint64_t)v10);
      id v7 = (void *)v12[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v11, 8);
    uint64_t v9 = [[v8 alloc] initWithURL:v5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (!(v6 | v9))
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "px_genericErrorWithDebugDescription:", @"failed to create a document");
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)_dismissProgressIndicator:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  [v6 stopShowing:v5];
}

+ (void)_presentProgressIndicatorFromViewController:(id)a3 completionHandler:(id)a4
{
  uint64_t v4 = (void (**)(id, id))a4;
  id v5 = +[PXProgressIndicatorAlertController beginShowingModalProgressWithConfiguration:&__block_literal_global_110735];
  v4[2](v4, v5);
}

void __92__PXVisualDiagnosticsFactory__presentProgressIndicatorFromViewController_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setDelay:0.0];
  [v2 setIsInternalUIAllowed:1];
  [v2 setLabel:@"Generating visual diagnostics…"];
}

+ (void)showVisualDiagnosticsWithConfiguration:(id)a3 fromViewController:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = a5;
  if (!a5)
  {
    uint64_t v11 = v25;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke;
    v25[3] = &unk_1E5DD3158;
    id v5 = &v26;
    id v26 = v9;
  }
  id v12 = _Block_copy(v11);
  id v13 = v10;
  uint64_t v14 = v13;
  if (!v13)
  {
    CGFloat v15 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v16 = objc_msgSend(v15, "px_firstKeyWindow");
    uint64_t v14 = [v16 rootViewController];
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_1;
  v20[3] = &unk_1E5DBABB8;
  id v24 = a1;
  id v17 = v9;
  id v21 = v17;
  id v18 = v12;
  id v22 = v14;
  id v23 = v18;
  id v19 = v14;
  [a1 _presentProgressIndicatorFromViewController:v19 completionHandler:v20];

  if (!a5) {
}
  }

void __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    id v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      uint64_t v9 = v7;
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_ERROR, "failed to show visual diagnostics for %@: %@", (uint8_t *)&v8, 0x16u);
    }
  }
}

void __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5DBAB90;
  id v11 = v4;
  id v8 = v3;
  id v10 = *(id *)(a1 + 48);
  id v9 = *(id *)(a1 + 40);
  id v6 = v3;
  [v4 requestVisualDiagnosticsPDFDocumentWithConfiguration:v5 resultHandler:v7];
}

void __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_3;
  v11[3] = &unk_1E5DD2BB8;
  id v12 = v5;
  id v13 = v6;
  id v8 = *(void **)(a1 + 56);
  id v15 = *(id *)(a1 + 48);
  id v14 = *(id *)(a1 + 40);
  id v9 = v6;
  id v10 = v5;
  [v8 _dismissProgressIndicator:v7 completionHandler:v11];
}

void __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = objc_alloc_init(PXVisualDiagnosticsViewController);
    [(PXVisualDiagnosticsViewController *)v2 setDocument:*(void *)(a1 + 32)];
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v2];
    [v3 setModalInPresentation:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_4;
    v7[3] = &unk_1E5DD3128;
    uint64_t v4 = *(void **)(a1 + 48);
    id v8 = *(id *)(a1 + 56);
    objc_msgSend(v4, "px_presentOverTopmostPresentedViewController:animated:completion:", v3, 1, v7);
  }
  else
  {
    id v5 = +[PXAlert showForError:*(void *)(a1 + 40)];
    id v6 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    v6();
  }
}

uint64_t __106__PXVisualDiagnosticsFactory_showVisualDiagnosticsWithConfiguration_fromViewController_completionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end