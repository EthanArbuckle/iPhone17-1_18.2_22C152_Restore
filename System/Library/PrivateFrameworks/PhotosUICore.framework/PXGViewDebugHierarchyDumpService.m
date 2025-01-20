@interface PXGViewDebugHierarchyDumpService
- (BOOL)canPerformAction;
- (PXGView)gridView;
- (PXGViewDebugHierarchyDumpService)initWithItemProviders:(id)a3;
- (id)title;
- (void)performAction;
@end

@implementation PXGViewDebugHierarchyDumpService

- (void).cxx_destruct
{
}

- (PXGView)gridView
{
  return self->_gridView;
}

- (void)performAction
{
  v2 = [(PXGViewDebugHierarchyDumpService *)self gridView];
  v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  v4 = [v3 temporaryDirectory];
  v5 = [v2 preferredFileNameForExportingDebugHierarchy];
  v6 = [v4 URLByAppendingPathComponent:v5];

  id v19 = 0;
  int v7 = [v2 exportDebugHierarchyToURL:v6 error:&v19];
  id v8 = v19;
  if (v7) {
    v9 = @"Success";
  }
  else {
    v9 = @"An error occurred";
  }
  if (v7)
  {
    v10 = NSString;
    v11 = v9;
    v12 = [v6 path];
    v13 = [v10 stringWithFormat:@"Debug hierarchy saved to %@", v12];
  }
  else
  {
    v14 = v9;
    v13 = [v8 localizedDescription];
  }
  v15 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:v9 message:v13 preferredStyle:1];

  v16 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:0];
  [v15 addAction:v16];

  v17 = [v2 window];
  v18 = [v17 rootViewController];
  [v18 presentViewController:v15 animated:1 completion:0];
}

- (BOOL)canPerformAction
{
  v2 = [(PXGViewDebugHierarchyDumpService *)self gridView];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)title
{
  return @"Dump Debug Hierarchy";
}

- (PXGViewDebugHierarchyDumpService)initWithItemProviders:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PXGViewDebugHierarchyDumpService;
  v5 = [(PXDiagnosticsService *)&v18 initWithItemProviders:v4];
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