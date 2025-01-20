@interface UIViewController(PXDiagnosticsEnvironment)
- (id)px_diagnosticsItemProvidersForPoint:()PXDiagnosticsEnvironment inCoordinateSpace:;
@end

@implementation UIViewController(PXDiagnosticsEnvironment)

- (id)px_diagnosticsItemProvidersForPoint:()PXDiagnosticsEnvironment inCoordinateSpace:
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([a1 isViewLoaded]) {
    PXPointIsNull();
  }

  return v5;
}

@end