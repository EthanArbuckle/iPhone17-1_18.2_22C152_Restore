@interface PXScrollDiagnosticsService
- (BOOL)canProvideContextualViewController;
- (id)contextualViewController;
- (id)scrollViewWithScrollAxis:(int64_t)a3;
- (id)title;
@end

@implementation PXScrollDiagnosticsService

- (id)scrollViewWithScrollAxis:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v4 = [(PXDiagnosticsService *)self itemProviders];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (!v5) {
    goto LABEL_18;
  }
  uint64_t v6 = v5;
  uint64_t v7 = *(void *)v14;
  do
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v14 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
      if ([v9 hasItemForIdentifier:@"PXDiagnosticsItemIdentifierScrollView"])
      {
        v10 = [v9 itemForIdentifier:@"PXDiagnosticsItemIdentifierScrollView"];
        v11 = v10;
        if (a3 == 1)
        {
          if (objc_msgSend(v10, "px_isScrolledAtEdge:", 1)
            && objc_msgSend(v11, "px_isScrolledAtEdge:", 3))
          {
LABEL_14:

            continue;
          }
        }
        else if (a3 != 2 {
               || objc_msgSend(v10, "px_isScrolledAtEdge:", 0)
        }
               && (objc_msgSend(v11, "px_isScrolledAtEdge:", 2) & 1) != 0)
        {
          goto LABEL_14;
        }
        if (v11) {
          goto LABEL_19;
        }
      }
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  }
  while (v6);
LABEL_18:
  v11 = 0;
LABEL_19:

  return v11;
}

- (id)contextualViewController
{
  v3 = +[PXScrollViewStresser sharedInstance];
  if ([v3 isScrolling])
  {
    v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Scroll Stress" message:@"Stop scrolling?" preferredStyle:1];
    uint64_t v5 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Continue" style:1 handler:0];
    [v4 addAction:v5];

    uint64_t v6 = (void *)MEMORY[0x1E4FB1410];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __54__PXScrollDiagnosticsService_contextualViewController__block_invoke_3;
    v16[3] = &unk_1E5DD0030;
    id v17 = v3;
    uint64_t v7 = [v6 actionWithTitle:@"Stop" style:2 handler:v16];
    [v4 addAction:v7];

    v8 = v17;
  }
  else
  {
    v8 = [(PXScrollDiagnosticsService *)self scrollViewWithScrollAxis:2];
    v9 = [(PXScrollDiagnosticsService *)self scrollViewWithScrollAxis:1];
    v4 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Scroll Stress" message:@"Ready?" preferredStyle:1];
    v10 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
    [v4 addAction:v10];

    if (v8)
    {
      v11 = (void *)MEMORY[0x1E4FB1410];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __54__PXScrollDiagnosticsService_contextualViewController__block_invoke;
      v21[3] = &unk_1E5DD1068;
      id v22 = v3;
      id v23 = v8;
      v12 = [v11 actionWithTitle:@"Scroll Horizontally" style:0 handler:v21];
      [v4 addAction:v12];
    }
    if (v9)
    {
      long long v13 = (void *)MEMORY[0x1E4FB1410];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __54__PXScrollDiagnosticsService_contextualViewController__block_invoke_2;
      v18[3] = &unk_1E5DD1068;
      id v19 = v3;
      id v20 = v9;
      long long v14 = [v13 actionWithTitle:@"Scroll Vertically" style:0 handler:v18];
      [v4 addAction:v14];
    }
  }

  return v4;
}

uint64_t __54__PXScrollDiagnosticsService_contextualViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startScrollingScrollView:*(void *)(a1 + 40) axis:2];
}

uint64_t __54__PXScrollDiagnosticsService_contextualViewController__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) startScrollingScrollView:*(void *)(a1 + 40) axis:1];
}

uint64_t __54__PXScrollDiagnosticsService_contextualViewController__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) stopScrolling];
}

- (BOOL)canProvideContextualViewController
{
  v3 = +[PXScrollViewStresser sharedInstance];
  char v4 = [v3 isScrolling];

  if (v4) {
    return 1;
  }
  uint64_t v6 = +[PXDiagnosticsSettings sharedInstance];
  if ([v6 enableScrollService])
  {
    BOOL v5 = 1;
    uint64_t v7 = [(PXScrollDiagnosticsService *)self scrollViewWithScrollAxis:1];
    if (!v7)
    {
      v8 = [(PXScrollDiagnosticsService *)self scrollViewWithScrollAxis:2];
      BOOL v5 = v8 != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)title
{
  return @"Scroll Stress";
}

@end