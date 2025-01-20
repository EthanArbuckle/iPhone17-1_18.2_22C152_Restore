@interface PXFeedbackTapToRadarRequestHandler
+ (void)fileRadarFromSourceView:(id)a3 viewTitleForRadar:(id)a4 completionHandler:(id)a5;
@end

@implementation PXFeedbackTapToRadarRequestHandler

+ (void)fileRadarFromSourceView:(id)a3 viewTitleForRadar:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v9)
  {
    v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"PXFeedbackTapToRadarRequestHandler.m", 27, @"Invalid parameter not satisfying: %@", @"sourceView" object file lineNumber description];
  }
  v12 = [v9 window];
  [v12 rootViewController];
  objc_claimAutoreleasedReturnValue();

  [v9 bounds];
  PXRectGetCenter();
}

void __98__PXFeedbackTapToRadarRequestHandler_fileRadarFromSourceView_viewTitleForRadar_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  *(id *)(a1 + 32);
  id v5 = v4;
  px_dispatch_on_main_queue();
}

uint64_t __98__PXFeedbackTapToRadarRequestHandler_fileRadarFromSourceView_viewTitleForRadar_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end