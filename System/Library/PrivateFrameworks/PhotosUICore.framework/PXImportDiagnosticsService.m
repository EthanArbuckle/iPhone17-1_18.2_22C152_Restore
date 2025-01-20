@interface PXImportDiagnosticsService
+ (void)simulateFakeImportSource;
- (BOOL)canPerformAction;
- (id)title;
- (void)performAction;
@end

@implementation PXImportDiagnosticsService

+ (void)simulateFakeImportSource
{
  id v9 = [MEMORY[0x1E4FB1438] sharedApplication];
  if (objc_opt_respondsToSelector())
  {
    [v9 _runImportTestCommonInit:&unk_1F02DB888 navigateToImportTab:0 completionHandler:0];
  }
  else
  {
    v2 = NSString;
    v3 = NSStringFromSelector(sel__runImportTestCommonInit_navigateToImportTab_completionHandler_);
    v4 = [v2 stringWithFormat:@"The Photos UIApplication doesn't seem to respond to %@", v3];

    v5 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Could Not Add Fake Import Source" message:v4 preferredStyle:1];
    v6 = [MEMORY[0x1E4FB1410] actionWithTitle:@"OK" style:0 handler:&__block_literal_global_246437];
    [v5 addAction:v6];

    v7 = objc_msgSend(v9, "px_firstKeyWindow");
    v8 = [v7 rootViewController];
    objc_msgSend(v8, "px_presentOverTopmostPresentedViewController:animated:completion:", v5, 1, 0);
  }
}

- (void)performAction
{
  v2 = objc_opt_class();
  [v2 simulateFakeImportSource];
}

- (BOOL)canPerformAction
{
  v2 = +[PXImportSettings sharedInstance];
  char v3 = [v2 importSourceSimulationViaDiagnosticsEnabled];

  return v3;
}

- (id)title
{
  return @"Start Import Simulation";
}

@end