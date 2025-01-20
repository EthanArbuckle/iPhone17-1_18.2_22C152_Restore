@interface PXDiagnosticsService
- (BOOL)canPerformAction;
- (BOOL)canProvideConsoleDescription;
- (BOOL)canProvideSettingsViewController;
- (NSArray)itemProviders;
- (NSString)consoleDescription;
- (NSString)title;
- (PXDiagnosticsService)init;
- (PXDiagnosticsService)initWithItemProviders:(id)a3;
- (UIViewController)contextualViewController;
- (UIViewController)settingsViewController;
- (void)performAction;
@end

@implementation PXDiagnosticsService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsViewController, 0);
  objc_storeStrong((id *)&self->_consoleDescription, 0);
  objc_storeStrong((id *)&self->_itemProviders, 0);
}

- (BOOL)canPerformAction
{
  return self->_canPerformAction;
}

- (UIViewController)settingsViewController
{
  return self->_settingsViewController;
}

- (BOOL)canProvideSettingsViewController
{
  return self->_canProvideSettingsViewController;
}

- (NSString)consoleDescription
{
  return self->_consoleDescription;
}

- (BOOL)canProvideConsoleDescription
{
  return self->_canProvideConsoleDescription;
}

- (NSArray)itemProviders
{
  return self->_itemProviders;
}

- (void)performAction
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  [v4 handleFailureInMethod:a2, self, @"PXDiagnosticsService.m", 51, @"Method %s is a responsibility of subclass %@", "-[PXDiagnosticsService performAction]", v6 object file lineNumber description];

  abort();
}

- (UIViewController)contextualViewController
{
  if ([(PXDiagnosticsService *)self canProvideConsoleDescription])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __48__PXDiagnosticsService_contextualViewController__block_invoke;
    v6[3] = &unk_1E5DD2988;
    v6[4] = self;
    v3 = objc_msgSend(MEMORY[0x1E4FB1EC0], "px_viewControllerWithOutput:", v6);
    v4 = [(PXDiagnosticsService *)self title];
    [v3 setTitle:v4];
  }
  else
  {
    v3 = 0;
  }
  return (UIViewController *)v3;
}

uint64_t __48__PXDiagnosticsService_contextualViewController__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) consoleDescription];
}

- (NSString)title
{
  v2 = NSString;
  v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v2 stringWithFormat:@"Untitled Service (%@)", v4];

  return (NSString *)v5;
}

- (PXDiagnosticsService)initWithItemProviders:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXDiagnosticsService;
  v5 = [(PXDiagnosticsService *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    itemProviders = v5->_itemProviders;
    v5->_itemProviders = (NSArray *)v6;
  }
  return v5;
}

- (PXDiagnosticsService)init
{
  return [(PXDiagnosticsService *)self initWithItemProviders:MEMORY[0x1E4F1CBF0]];
}

@end