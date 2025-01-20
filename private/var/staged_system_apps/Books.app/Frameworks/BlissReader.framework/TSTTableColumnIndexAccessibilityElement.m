@interface TSTTableColumnIndexAccessibilityElement
- (CGRect)_frameInCanvasWithTableRep:(id)a3 canvasHostingLayer:(id)a4 firstGoodCellFrame:(CGRect)a5;
- (int)direction;
- (unsigned)columnIndex;
- (void)setColumnIndex:(unsigned __int8)a3;
@end

@implementation TSTTableColumnIndexAccessibilityElement

- (unsigned)columnIndex
{
  return [(TSTTableColumnOrRowIndexAccessibilityElement *)self cellID] >> 16;
}

- (void)setColumnIndex:(unsigned __int8)a3
{
}

- (int)direction
{
  return 1;
}

- (CGRect)_frameInCanvasWithTableRep:(id)a3 canvasHostingLayer:(id)a4 firstGoodCellFrame:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat y = a5.origin.y;
  CGFloat x = a5.origin.x;
  char v30 = 0;
  v11 = (objc_class *)objc_opt_class();
  v12 = (void *)__TSAccessibilityCastAsClass(v11, (uint64_t)objc_msgSend(objc_msgSend(a3, "tsaxTableChrome"), "tsaxValueForKey:", @"mChromeColumnBodyLayer"), 1, &v30);
  if (v30) {
    abort();
  }
  v13 = v12;
  [v12 bounds];
  [v13 convertRect:a4 toLayer:];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  v31.origin.CGFloat x = x;
  v31.origin.CGFloat y = y;
  v31.size.CGFloat width = width;
  v31.size.CGFloat height = height;
  CGFloat MinX = CGRectGetMinX(v31);
  v32.origin.CGFloat x = v15;
  v32.origin.CGFloat y = v17;
  v32.size.CGFloat width = v19;
  v32.size.CGFloat height = v21;
  CGFloat MinY = CGRectGetMinY(v32);
  v33.size.CGFloat width = width;
  CGFloat v23 = MinY;
  v33.origin.CGFloat x = x;
  v33.origin.CGFloat y = y;
  v33.size.CGFloat height = height;
  CGFloat v24 = CGRectGetWidth(v33);
  v34.origin.CGFloat x = v15;
  v34.origin.CGFloat y = v17;
  v34.size.CGFloat width = v19;
  v34.size.CGFloat height = v21;
  double v25 = CGRectGetHeight(v34);
  double v26 = MinX;
  double v27 = v23;
  double v28 = v24;
  result.size.CGFloat height = v25;
  result.size.CGFloat width = v28;
  result.origin.CGFloat y = v27;
  result.origin.CGFloat x = v26;
  return result;
}

@end