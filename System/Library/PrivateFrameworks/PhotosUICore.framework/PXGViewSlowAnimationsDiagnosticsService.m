@interface PXGViewSlowAnimationsDiagnosticsService
- (BOOL)canPerformAction;
- (PXGView)gridView;
- (PXGViewSlowAnimationsDiagnosticsService)initWithItemProviders:(id)a3;
- (id)title;
- (void)performAction;
@end

@implementation PXGViewSlowAnimationsDiagnosticsService

- (void).cxx_destruct
{
}

- (PXGView)gridView
{
  return self->_gridView;
}

- (void)performAction
{
  id v5 = [(PXGViewSlowAnimationsDiagnosticsService *)self gridView];
  uint64_t v3 = [v5 slowAnimationsEnabled] ^ 1;
  v4 = [(PXGViewSlowAnimationsDiagnosticsService *)self gridView];
  [v4 setSlowAnimationsEnabled:v3];
}

- (BOOL)canPerformAction
{
  v2 = [(PXGViewSlowAnimationsDiagnosticsService *)self gridView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)title
{
  v2 = [(PXGViewSlowAnimationsDiagnosticsService *)self gridView];
  if ([v2 slowAnimationsEnabled]) {
    BOOL v3 = @"Disable Slow Animations";
  }
  else {
    BOOL v3 = @"Enable Slow Animations";
  }
  v4 = v3;

  return v4;
}

- (PXGViewSlowAnimationsDiagnosticsService)initWithItemProviders:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGViewSlowAnimationsDiagnosticsService;
  id v5 = [(PXDiagnosticsService *)&v18 initWithItemProviders:v4];
  if (v5)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v10), "itemForIdentifier:", @"PXDiagnosticsItemIdentifierTungstenView", (void)v14);
        gridView = v5->_gridView;
        v5->_gridView = (PXGView *)v11;

        if (v5->_gridView) {
          break;
        }
        if (v8 == ++v10)
        {
          uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
          if (v8) {
            goto LABEL_4;
          }
          break;
        }
      }
    }
  }
  return v5;
}

@end