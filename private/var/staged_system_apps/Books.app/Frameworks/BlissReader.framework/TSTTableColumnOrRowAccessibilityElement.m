@interface TSTTableColumnOrRowAccessibilityElement
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID;
- (CGRect)_frameInCanvasWithTableRep:(id)a3;
- (CGRect)frameInCanvas;
- (TSTTableRepAccessibility)tableRep;
- (id)parentCanvas;
- (int)direction;
- (void)_setCellID:(id)a3;
- (void)setTableRep:(id)a3;
@end

@implementation TSTTableColumnOrRowAccessibilityElement

- (TSTTableRepAccessibility)tableRep
{
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSTTableRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)self->_tableRep, 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)parentCanvas
{
  v2 = [(TSTTableColumnOrRowAccessibilityElement *)self tableRep];

  return [(TSDRepAccessibility *)v2 tsaxCanvas];
}

- (CGRect)frameInCanvas
{
  v3 = [(TSTTableColumnOrRowAccessibilityElement *)self tableRep];

  [(TSTTableColumnOrRowAccessibilityElement *)self _frameInCanvasWithTableRep:v3];
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (int)direction
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Abstract method", v3, v4, v5, v6, v7, vars0))abort(); {
  }
    }
  return 0;
}

- (CGRect)_frameInCanvasWithTableRep:(id)a3
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Abstract method", v4, v5, v6, v7, v8, vars0))abort(); {
  }
    }
  double x = CGRectZero.origin.x;
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setTableRep:(id)a3
{
  self->_tableRep = (TSTTableRepAccessibility *)a3;
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID
{
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)self->_cellID;
}

- (void)_setCellID:(id)a3
{
  self->_cellID = ($5CFCD363C99B2F51819B67AD7AD2E060)a3;
}

@end