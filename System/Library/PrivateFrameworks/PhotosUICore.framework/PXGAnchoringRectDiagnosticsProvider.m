@interface PXGAnchoringRectDiagnosticsProvider
- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4;
@end

@implementation PXGAnchoringRectDiagnosticsProvider

- (void)enumerateRectDiagnosticsForLayout:(id)a3 usingBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [off_1E5DA9658 sharedInstance];
  int v8 = [v7 enableAnchoringRectDiagnostics];

  if (v8)
  {
    v13[0] = 0;
    v13[1] = v13;
    v13[2] = 0x2020000000;
    v13[3] = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __84__PXGAnchoringRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke;
    v9[3] = &unk_1E5DB68F8;
    id v10 = v5;
    id v11 = v6;
    v12 = v13;
    [v10 enumerateVisibleAnchoringSpriteIndexesUsingBlock:v9];

    _Block_object_dispose(v13, 8);
  }
}

void __84__PXGAnchoringRectDiagnosticsProvider_enumerateRectDiagnosticsForLayout_usingBlock___block_invoke(uint64_t a1, unsigned int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v12 = *(_DWORD *)off_1E5DAAF60;
  long long v2 = *((_OWORD *)off_1E5DAAF70 + 1);
  v11[0] = *(_OWORD *)off_1E5DAAF70;
  v11[1] = v2;
  long long v3 = *((_OWORD *)off_1E5DAAF90 + 7);
  v13[6] = *((_OWORD *)off_1E5DAAF90 + 6);
  v13[7] = v3;
  long long v4 = *((_OWORD *)off_1E5DAAF90 + 9);
  v13[8] = *((_OWORD *)off_1E5DAAF90 + 8);
  v13[9] = v4;
  long long v5 = *((_OWORD *)off_1E5DAAF90 + 3);
  v13[2] = *((_OWORD *)off_1E5DAAF90 + 2);
  v13[3] = v5;
  long long v6 = *((_OWORD *)off_1E5DAAF90 + 5);
  void v13[4] = *((_OWORD *)off_1E5DAAF90 + 4);
  v13[5] = v6;
  long long v7 = *((_OWORD *)off_1E5DAAF90 + 1);
  v13[0] = *(_OWORD *)off_1E5DAAF90;
  v13[1] = v7;
  long long v8 = *((_OWORD *)off_1E5DAAF88 + 1);
  v9[0] = *(_OWORD *)off_1E5DAAF88;
  v9[1] = v8;
  uint64_t v10 = *((void *)off_1E5DAAF88 + 4);
  [*(id *)(a1 + 32) copyLayoutForSpritesInRange:a2 | 0x100000000 entities:&v12 geometries:v11 styles:v13 infos:v9];
  PXRectWithCenterAndSize();
}

@end