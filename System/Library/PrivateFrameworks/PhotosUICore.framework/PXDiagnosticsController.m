@interface PXDiagnosticsController
+ (id)sharedController;
+ (void)_presentContextualDiagnostics;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4;
- (NSArray)_diagnosticsServicesClasses;
- (UITapGestureRecognizer)_gestureRecognizer;
- (UIWindow)_window;
- (id)_currentRootViewController;
- (id)_itemProvidersFromPoint:(CGPoint)a3 inCoordinateSpace:(id)a4 viewController:(id)a5;
- (id)_topMostPresentedViewController;
- (id)consoleDescriptionForServices:(id)a3;
- (id)currentItemProviders;
- (id)servicesWithItemProviders:(id)a3;
- (void)_executeService:(id)a3;
- (void)_handleGestureRecognizer:(id)a3;
- (void)_loadDiagnosticsServicesClasses;
- (void)_presentContextualViewControllerFromPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (void)_setGestureRecognizer:(id)a3;
- (void)_updateGestureRecognizer;
- (void)presentContextualDiagnostics;
- (void)presentContextualViewControllerForServices:(id)a3;
- (void)setupOnInternalDevicesWithWindow:(id)a3;
@end

@implementation PXDiagnosticsController

- (void)setupOnInternalDevicesWithWindow:(id)a3
{
  id v6 = a3;
  if (PFOSVariantHasInternalUI() && !self->__window)
  {
    objc_storeStrong((id *)&self->__window, a3);
    objc_setAssociatedObject(self->__window, (const void *)AssociatedObjectKeyDiagnosticsController, self, 0);
    [(PXDiagnosticsController *)self _loadDiagnosticsServicesClasses];
    v5 = +[PXDiagnosticsSettings sharedInstance];
    [v5 addKeyObserver:self];

    [(PXDiagnosticsController *)self _updateGestureRecognizer];
  }
}

- (void)_updateGestureRecognizer
{
  id v10 = [(PXDiagnosticsController *)self _gestureRecognizer];
  v3 = +[PXDiagnosticsSettings sharedInstance];
  int v4 = [v3 enableContextualGesture];

  if (v4)
  {
    v5 = [(PXDiagnosticsController *)self _window];
    id v6 = v10;
    if (!v10)
    {
      id v11 = (id)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleGestureRecognizer_];
      [v11 setNumberOfTouchesRequired:4];
      [v11 setNumberOfTapsRequired:2];
      [v11 setCancelsTouchesInView:0];
      [v11 setDelaysTouchesBegan:0];
      [v11 setDelaysTouchesEnded:0];
      [v11 setDelegate:self];
      id v6 = v11;
    }
    id v12 = v6;
    v7 = [v6 view];

    if (v7 != v5)
    {
      v8 = [v12 view];
      [v8 removeGestureRecognizer:v12];

      [v5 addGestureRecognizer:v12];
    }
  }
  else
  {
    v9 = [v10 view];
    [v9 removeGestureRecognizer:v10];

    v5 = v10;
    id v12 = 0;
  }

  [(PXDiagnosticsController *)self _setGestureRecognizer:v12];
}

- (UIWindow)_window
{
  return self->__window;
}

- (void)_setGestureRecognizer:(id)a3
{
}

- (void)_loadDiagnosticsServicesClasses
{
  if (!self->__diagnosticsServicesClasses)
  {
    PXDiagnosticsServiceRegisteredClasses();
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    diagnosticsServicesClasses = self->__diagnosticsServicesClasses;
    self->__diagnosticsServicesClasses = v3;
  }
}

- (UITapGestureRecognizer)_gestureRecognizer
{
  return self->__gestureRecognizer;
}

+ (id)sharedController
{
  if (sharedController_onceToken_216984 != -1) {
    dispatch_once(&sharedController_onceToken_216984, &__block_literal_global_216985);
  }
  v2 = (void *)sharedController_sharedController_216986;
  return v2;
}

uint64_t __43__PXDiagnosticsController_sharedController__block_invoke()
{
  v0 = objc_alloc_init(PXDiagnosticsController);
  v1 = (void *)sharedController_sharedController_216986;
  sharedController_sharedController_216986 = (uint64_t)v0;

  uint64_t result = PFOSVariantHasInternalUI();
  if (result)
  {
    int out_token = 0;
    return notify_register_dispatch("ShowContextualDiagnostics", &out_token, MEMORY[0x1E4F14428], &__block_literal_global_4_216989);
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__gestureRecognizer, 0);
  objc_storeStrong((id *)&self->__diagnosticsServicesClasses, 0);
  objc_storeStrong((id *)&self->__window, 0);
}

- (NSArray)_diagnosticsServicesClasses
{
  return self->__diagnosticsServicesClasses;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRequireFailureOfGestureRecognizer:(id)a4
{
  id v4 = a4;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v5 = a3;
  id v6 = [(PXDiagnosticsController *)self _gestureRecognizer];

  return v6 == v5;
}

- (void)_executeService:(id)a3
{
  id v6 = a3;
  id v4 = [v6 contextualViewController];
  if (v4)
  {
    id v5 = [(PXDiagnosticsController *)self _topMostPresentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [v5 presentViewController:v4 animated:1 completion:0];
    }
    else {
      objc_msgSend(v5, "px_presentViewControllerInNavigationController:animated:dimissButtonLocation:completion:", v4, 1, 0, 0);
    }
  }
  if ([v6 canPerformAction]) {
    [v6 performAction];
  }
}

- (id)_topMostPresentedViewController
{
  v2 = [(PXDiagnosticsController *)self _currentRootViewController];
  v3 = [v2 presentedViewController];

  if (v3)
  {
    do
    {
      id v4 = [v2 presentedViewController];

      id v5 = [v4 presentedViewController];

      v2 = v4;
    }
    while (v5);
  }
  else
  {
    id v4 = v2;
  }
  return v4;
}

- (id)_currentRootViewController
{
  v2 = [(PXDiagnosticsController *)self _window];
  v3 = [v2 rootViewController];

  id v4 = [v3 presentedViewController];
  id v5 = v4;
  if (!v4) {
    id v4 = v3;
  }
  id v6 = v4;

  return v6;
}

- (id)_itemProvidersFromPoint:(CGPoint)a3 inCoordinateSpace:(id)a4 viewController:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  v14[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  v9 = objc_msgSend(v8, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", a4, x, y);
  id v10 = +[PXDiagnosticsItemProvider providerWithItem:v8 identifier:@"PXDiagnosticsItemIdentifierViewController"];

  v14[0] = v10;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  id v12 = [v9 arrayByAddingObjectsFromArray:v11];

  return v12;
}

- (void)_presentContextualViewControllerFromPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  id v10 = [(PXDiagnosticsController *)self _topMostPresentedViewController];
  id v8 = -[PXDiagnosticsController _itemProvidersFromPoint:inCoordinateSpace:viewController:](self, "_itemProvidersFromPoint:inCoordinateSpace:viewController:", v7, v10, x, y);

  v9 = [(PXDiagnosticsController *)self servicesWithItemProviders:v8];
  [(PXDiagnosticsController *)self presentContextualViewControllerForServices:v9];
}

- (void)presentContextualDiagnostics
{
}

- (void)_handleGestureRecognizer:(id)a3
{
  id v6 = a3;
  if ([v6 state] == 3)
  {
    id v4 = [(PXDiagnosticsController *)self _topMostPresentedViewController];
    id v5 = [v4 view];
    [v6 locationInView:v5];
    -[PXDiagnosticsController _presentContextualViewControllerFromPoint:inCoordinateSpace:](self, "_presentContextualViewControllerFromPoint:inCoordinateSpace:", v5);
  }
}

- (void)presentContextualViewControllerForServices:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_14_216957];
  id v5 = [v3 objectsAtIndexes:v4];

  if ([v5 count] == 1
    && ([v5 firstObject],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 canProvideContextualViewController],
        v6,
        v7))
  {
    id v8 = [v5 firstObject];
    [(PXDiagnosticsController *)self _executeService:v8];
  }
  else if ([v5 count])
  {
    id v23 = v3;
    v9 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Diagnostics" message:0 preferredStyle:1];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v22 = v5;
    id obj = v5;
    uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(obj);
          }
          v14 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v15 = objc_msgSend(v14, "title", v22);
          v16 = (void *)v15;
          if (v15) {
            v17 = (__CFString *)v15;
          }
          else {
            v17 = &stru_1F00B0030;
          }
          v18 = v17;

          v26[0] = MEMORY[0x1E4F143A8];
          v26[1] = 3221225472;
          v26[2] = __70__PXDiagnosticsController_presentContextualViewControllerForServices___block_invoke_2;
          v26[3] = &unk_1E5DD1068;
          v26[4] = self;
          v26[5] = v14;
          v19 = [MEMORY[0x1E4FB1410] actionWithTitle:v18 style:0 handler:v26];

          [v9 addAction:v19];
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    v20 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
    [v9 addAction:v20];

    v21 = [(PXDiagnosticsController *)self _topMostPresentedViewController];
    [v21 presentViewController:v9 animated:1 completion:0];

    id v5 = v22;
    id v3 = v23;
  }
}

uint64_t __70__PXDiagnosticsController_presentContextualViewControllerForServices___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _executeService:*(void *)(a1 + 40)];
}

uint64_t __70__PXDiagnosticsController_presentContextualViewControllerForServices___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 canProvideContextualViewController]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [v2 canPerformAction];
  }

  return v3;
}

- (id)consoleDescriptionForServices:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F28E78] string];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 canProvideConsoleDescription])
        {
          if ([v4 length]) {
            [v4 appendFormat:@"\n"];
          }
          uint64_t v11 = [v10 title];
          uint64_t v12 = [v10 consoleDescription];
          [v4 appendFormat:@"%@:\n%@\n", v11, v12, (void)v14];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)servicesWithItemProviders:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = [(PXDiagnosticsController *)self _diagnosticsServicesClasses];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[objc_alloc(*(Class *)(*((void *)&v13 + 1) + 8 * i)) initWithItemProviders:v4];
        if (v11) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)currentItemProviders
{
}

+ (void)_presentContextualDiagnostics
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v3 = objc_msgSend(v2, "px_firstKeyWindow");
  id v4 = objc_getAssociatedObject(v3, (const void *)AssociatedObjectKeyDiagnosticsController);

  if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    id v6 = v4;

    id v5 = v6;
    if (v6) {
      goto LABEL_7;
    }
  }
  else
  {
  }
  id v5 = +[PXDiagnosticsController sharedController];
LABEL_7:
  id v7 = v5;
  [v5 presentContextualDiagnostics];
}

uint64_t __43__PXDiagnosticsController_sharedController__block_invoke_2()
{
  return +[PXDiagnosticsController _presentContextualDiagnostics];
}

@end