@interface PXGFocusRectDiagnosticsProvider
- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4;
@end

@implementation PXGFocusRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [off_1E5DA9658 sharedInstance];
  int v8 = [v7 enableFocusRectDiagnostics];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4FB1790];
    v10 = [v5 axGroup];
    v11 = [v9 focusSystemForEnvironment:v10];

    v12 = [v11 focusedItem];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __80__PXGFocusRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke;
    v14[3] = &unk_1E5DB6998;
    id v15 = v12;
    id v16 = v6;
    id v13 = v12;
    [v5 enumerateDescendantsLayoutsUsingBlock:v14];
  }
}

void __80__PXGFocusRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 axGroup];
  v4 = [v3 loadedLeafIndexes];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__PXGFocusRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke_2;
  v6[3] = &unk_1E5DB6970;
  id v7 = v3;
  id v8 = *(id *)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v5 = v3;
  [v4 enumerateIndexesUsingBlock:v6];
}

void __80__PXGFocusRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  char v15 = 0;
  v3 = [*(id *)(a1 + 32) loadedLeafAtSpriteIndex:a2];
  v4 = v3;
  if (*(void **)(a1 + 40) != v3)
  {
    uint64_t v5 = *(void *)(a1 + 48);
    [v3 frame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    v14 = [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:1.0 blue:0.0 alpha:0.5];
    (*(void (**)(uint64_t, void *, __CFString *, char *, double, double, double, double))(v5 + 16))(v5, v14, @"Focus Item", &v15, v7, v9, v11, v13);
  }
}

@end