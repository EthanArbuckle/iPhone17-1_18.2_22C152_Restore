@interface PXAssetAnalyzerRequest
@end

@implementation PXAssetAnalyzerRequest

void __48___PXAssetAnalyzerRequest_runWithResultHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_ERROR, "Effects request failed: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleFinishWithSuccess:v3 == 0];
}

@end