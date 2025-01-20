@interface UIDocumentActivityDownloadOperation
@end

@implementation UIDocumentActivityDownloadOperation

void __44___UIDocumentActivityDownloadOperation_main__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  if (!WeakRetained)
  {
    v3 = +[_UIApplicationModalProgressController sharedInstance];
    goto LABEL_5;
  }
  v3 = +[_UIApplicationModalProgressController instanceForScene:WeakRetained];
  v4 = [WeakRetained traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 != 6)
  {
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = [WeakRetained keyWindow];
  v7 = [v6 rootViewController];

LABEL_6:
  uint64_t v8 = *(void *)(a1 + 32);
  uint64_t v9 = *(void *)(v8 + 248);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44___UIDocumentActivityDownloadOperation_main__block_invoke_2;
  v10[3] = &unk_1E52DA660;
  v10[4] = v8;
  id v11 = *(id *)(a1 + 40);
  [v3 displayForDownloadingURL:v9 sourceViewController:v7 completionHandler:v10];
}

uint64_t __44___UIDocumentActivityDownloadOperation_main__block_invoke_2(uint64_t result, int a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    [*(id *)(result + 32) cancel];
    v3 = *(void **)(v2 + 40);
    return [v3 cancel];
  }
  return result;
}

@end