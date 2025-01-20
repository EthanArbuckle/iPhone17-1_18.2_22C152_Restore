@interface SBXXGetHomeScreenIconMetrics
@end

@implementation SBXXGetHomeScreenIconMetrics

void ___SBXXGetHomeScreenIconMetrics_block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F42D90] mainScreen];
  [v2 _referenceBounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  **(CGFloat **)(a1 + 32) = CGRectGetWidth(v24);
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  **(CGFloat **)(a1 + 40) = CGRectGetHeight(v25);
  id v22 = +[SBIconController sharedInstance];
  v11 = [v22 iconManager];
  v12 = [v11 listLayoutProvider];
  v13 = [v12 layoutForIconLocation:*MEMORY[0x1E4FA66D0]];
  [v13 iconImageInfo];
  v14 = *(void **)(a1 + 56);
  **(void **)(a1 + 48) = v15;
  void *v14 = v16;
  v17 = [v22 model];
  **(_DWORD **)(a1 + 64) = [v17 maxRowCountForListInRootFolderWithInterfaceOrientation:1];
  **(_DWORD **)(a1 + 72) = [v17 maxColumnCountForListInRootFolderWithInterfaceOrientation:1];
  **(_DWORD **)(a1 + 80) = [v17 maxIconCountForDock];
  int v18 = [v17 maxListCountForFolders];
  **(_DWORD **)(a1 + 88) = v18;
  v19 = [v12 layoutForIconLocation:*MEMORY[0x1E4FA6698]];
  **(_DWORD **)(a1 + 96) = [v19 numberOfRowsForOrientation:1];
  int v20 = [v19 numberOfColumnsForOrientation:1];
  v21 = *(_DWORD **)(a1 + 112);
  **(_DWORD **)(a1 + 104) = v20;
  _DWORD *v21 = v18;
}

@end