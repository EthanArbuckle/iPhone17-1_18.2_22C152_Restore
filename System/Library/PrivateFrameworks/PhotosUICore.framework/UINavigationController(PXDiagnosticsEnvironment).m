@interface UINavigationController(PXDiagnosticsEnvironment)
- (id)px_diagnosticsItemProvidersForPoint:()PXDiagnosticsEnvironment inCoordinateSpace:;
@end

@implementation UINavigationController(PXDiagnosticsEnvironment)

- (id)px_diagnosticsItemProvidersForPoint:()PXDiagnosticsEnvironment inCoordinateSpace:
{
  id v8 = a5;
  v9 = [a1 topViewController];
  v10 = objc_msgSend(v9, "px_diagnosticsItemProvidersForPoint:inCoordinateSpace:", v8, a2, a3);

  if (v10) {
    v11 = v10;
  }
  else {
    v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v12 = v11;

  return v12;
}

@end