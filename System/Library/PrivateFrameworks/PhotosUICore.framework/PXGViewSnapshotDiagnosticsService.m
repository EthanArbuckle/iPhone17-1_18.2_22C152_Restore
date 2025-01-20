@interface PXGViewSnapshotDiagnosticsService
- (BOOL)canPerformAction;
- (PXGView)tungstenView;
- (PXGViewSnapshotDiagnosticsService)initWithItemProviders:(id)a3;
- (UIViewController)viewController;
- (id)title;
- (void)performAction;
@end

@implementation PXGViewSnapshotDiagnosticsService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewController, 0);
  objc_storeStrong((id *)&self->_tungstenView, 0);
}

- (UIViewController)viewController
{
  return self->_viewController;
}

- (PXGView)tungstenView
{
  return self->_tungstenView;
}

- (void)performAction
{
  id v5 = [(PXGViewSnapshotDiagnosticsService *)self tungstenView];
  v3 = [v5 visualDiagnosticsConfigurationForFullPageSnapshot];
  v4 = [(PXGViewSnapshotDiagnosticsService *)self viewController];
  +[PXVisualDiagnosticsFactory showVisualDiagnosticsWithConfiguration:v3 fromViewController:v4 completionHandler:0];
}

- (BOOL)canPerformAction
{
  v2 = [(PXGViewSnapshotDiagnosticsService *)self tungstenView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)title
{
  return @"Full-Page Snapshot";
}

- (PXGViewSnapshotDiagnosticsService)initWithItemProviders:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PXGViewSnapshotDiagnosticsService;
  id v5 = [(PXDiagnosticsService *)&v20 initWithItemProviders:v4];
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v14 = v4;
    id obj = v4;
    uint64_t v6 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(obj);
          }
          v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v11 = objc_msgSend(v10, "itemForIdentifier:", @"PXDiagnosticsItemIdentifierTungstenView", v14);
          if (v11) {
            objc_storeStrong((id *)&v5->_tungstenView, v11);
          }
          v12 = [v10 itemForIdentifier:@"PXDiagnosticsItemIdentifierViewController"];
          if (v12) {
            objc_storeStrong((id *)&v5->_viewController, v12);
          }
          if (v5->_tungstenView && v5->_viewController)
          {

            goto LABEL_17;
          }
        }
        uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_17:

    id v4 = v14;
  }

  return v5;
}

@end