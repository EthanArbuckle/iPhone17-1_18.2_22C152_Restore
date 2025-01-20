@interface PXGAssetsRectDiagnosticsProvider
- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4;
@end

@implementation PXGAssetsRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [off_1E5DA9658 sharedInstance];
  int v8 = [v7 enableAssetsRectDiagnostics];

  if (v8)
  {
    [v5 visibleRect];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __81__PXGAssetsRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke;
    v17[3] = &unk_1E5DB6948;
    id v18 = v6;
    objc_msgSend(v5, "enumerateSpritesInRect:usingBlock:", v17, v10, v12, v14, v16);
  }
}

void __81__PXGAssetsRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  if (*(unsigned char *)(a6 + 1) == 2)
  {
    id v8 = a7;
    double v9 = [v8 displayAssetSource];
    double v10 = [v9 displayAssetFetchResultForSpritesInRange:a2 | 0x100000000 inLayout:v8];

    id v11 = [v10 objectAtIndex:0];

    if ([v11 conformsToProtocol:&unk_1F03935E0])
    {
      [v11 weightUsingCriterion:0];
      PXRectWithCenterAndSize();
    }
  }
}

@end