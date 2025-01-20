@interface TSTTableColumnOrRowIndexAccessibilityElement
- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)cellID;
- (BOOL)tsaxSelect;
- (CGRect)_frameInCanvasWithTableRep:(id)a3 canvasHostingLayer:(id)a4 firstGoodCellFrame:(CGRect)a5;
- (CGRect)frameInCanvas;
- (TSTTableRepAccessibility)tableRep;
- (id)accessibilityLabel;
- (id)parentCanvas;
- (int)direction;
- (unint64_t)accessibilityTraits;
- (void)_setCellID:(id)a3;
- (void)setTableRep:(id)a3;
@end

@implementation TSTTableColumnOrRowIndexAccessibilityElement

- (BOOL)tsaxSelect
{
  return 1;
}

- (id)accessibilityLabel
{
  v3 = [(TSTTableColumnOrRowIndexAccessibilityElement *)self tableRep];
  unsigned int v4 = [(TSTTableColumnOrRowIndexAccessibilityElement *)self cellID];
  uint64_t v5 = [(TSTTableColumnOrRowIndexAccessibilityElement *)self direction];

  return [(TSTTableRepAccessibility *)v3 tsaxColumnOrRowNameForCellID:v4 inDirection:v5 withComponents:1];
}

- (unint64_t)accessibilityTraits
{
  v7.receiver = self;
  v7.super_class = (Class)TSTTableColumnOrRowIndexAccessibilityElement;
  unint64_t v3 = [(TSTTableColumnOrRowIndexAccessibilityElement *)&v7 accessibilityTraits];
  unsigned int v4 = [(TSTTableRepAccessibility *)[(TSTTableColumnOrRowIndexAccessibilityElement *)self tableRep] tsaxColumnOrRowIsSelectedAtCellID:[(TSTTableColumnOrRowIndexAccessibilityElement *)self cellID] inDirection:[(TSTTableColumnOrRowIndexAccessibilityElement *)self direction]];
  UIAccessibilityTraits v5 = UIAccessibilityTraitSelected;
  if (!v4) {
    UIAccessibilityTraits v5 = 0;
  }
  return v5 | v3;
}

- (TSTTableRepAccessibility)tableRep
{
  char v5 = 0;
  unint64_t v3 = objc_opt_class();
  result = (TSTTableRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)self->_tableRep, 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)parentCanvas
{
  v2 = [(TSTTableColumnOrRowIndexAccessibilityElement *)self tableRep];

  return [(TSDRepAccessibility *)v2 tsaxCanvas];
}

- (CGRect)frameInCanvas
{
  unint64_t v3 = [(TSTTableColumnOrRowIndexAccessibilityElement *)self tableRep];
  unsigned int v4 = [(TSDCanvasAccessibility *)[(TSDRepAccessibility *)v3 tsaxCanvas] tsaxCanvasHostingLayer];
  [(TSTTableRepAccessibility *)v3 tsaxDeviceBoundsForCellRange:[(TSTTableRepAccessibility *)v3 tsaxCoordinatesOfFirstNonMergedCellInColumnOrRowForCellID:[(TSTTableColumnOrRowIndexAccessibilityElement *)self cellID] inDirection:[(TSTTableColumnOrRowIndexAccessibilityElement *)self direction]] | 0x1000100000000];

  -[TSTTableColumnOrRowIndexAccessibilityElement _frameInCanvasWithTableRep:canvasHostingLayer:firstGoodCellFrame:](self, "_frameInCanvasWithTableRep:canvasHostingLayer:firstGoodCellFrame:", v3, v4);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
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

- (CGRect)_frameInCanvasWithTableRep:(id)a3 canvasHostingLayer:(id)a4 firstGoodCellFrame:(CGRect)a5
{
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Abstract method", v6, v7, v8, v9, v10, vars0))abort(); {
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