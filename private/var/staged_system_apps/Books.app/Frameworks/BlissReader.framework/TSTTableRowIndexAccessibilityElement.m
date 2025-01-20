@interface TSTTableRowIndexAccessibilityElement
- (CGRect)_frameInCanvasWithTableRep:(id)a3 canvasHostingLayer:(id)a4 firstGoodCellFrame:(CGRect)a5;
- (int)direction;
- (unsigned)rowIndex;
- (void)setRowIndex:(unsigned __int16)a3;
@end

@implementation TSTTableRowIndexAccessibilityElement

- (unsigned)rowIndex
{
  return (unsigned __int16)[(TSTTableColumnOrRowIndexAccessibilityElement *)self cellID];
}

- (void)setRowIndex:(unsigned __int16)a3
{
}

- (int)direction
{
  return 0;
}

- (CGRect)_frameInCanvasWithTableRep:(id)a3 canvasHostingLayer:(id)a4 firstGoodCellFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  char v38 = 0;
  v12 = (objc_class *)objc_opt_class();
  v13 = (void *)__TSAccessibilityCastAsClass(v12, (uint64_t)objc_msgSend(objc_msgSend(a3, "tsaxTableChrome"), "tsaxValueForKey:", @"mChromeRowBodyLayer"), 1, &v38);
  if (v38) {
    abort();
  }
  v14 = v13;
  [v13 bounds];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  if ([(TSTTableRowIndexAccessibilityElement *)self tsaxRespondsToSelector:"tsaxAdjustedBoundsForChromeRowBodyLayer:" fromExtrasProtocol:&OBJC_PROTOCOL___TSTTableRowIndexAccessibilityElementExtras])
  {
    [(TSTTableRowIndexAccessibilityElement *)self tsaxAdjustedBoundsForChromeRowBodyLayer:v14];
    double v16 = v23;
    double v18 = v24;
    double v20 = v25;
    double v22 = v26;
  }
  [v14 convertRect:a4 toLayer:v16, v18, v20, v22];
  CGFloat v27 = v39.origin.x;
  CGFloat v28 = v39.origin.y;
  CGFloat v29 = v39.size.width;
  CGFloat v30 = v39.size.height;
  CGFloat MinX = CGRectGetMinX(v39);
  v40.origin.CGFloat x = x;
  v40.origin.CGFloat y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  CGFloat MinY = CGRectGetMinY(v40);
  v41.origin.CGFloat x = v27;
  v41.origin.CGFloat y = v28;
  v41.size.CGFloat width = v29;
  v41.size.CGFloat height = v30;
  CGFloat v31 = CGRectGetWidth(v41);
  v42.origin.CGFloat x = x;
  v42.origin.CGFloat y = y;
  v42.size.CGFloat width = width;
  v42.size.CGFloat height = height;
  double v32 = CGRectGetHeight(v42);
  double v34 = MinY;
  double v33 = MinX;
  double v35 = v31;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v35;
  result.origin.CGFloat y = v34;
  result.origin.CGFloat x = v33;
  return result;
}

@end