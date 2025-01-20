@interface _UIPopoverShapePathProviderIOS
- (CGPoint)_addArrowCurveToPath:(id)a3 direction:(unint64_t)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8;
- (CGPoint)_addLineWithSlightTrailingAndLeadingCurveToPath:(id)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 leadingEdge:(BOOL)a6 isVertical:(BOOL)a7;
- (double)_leftAndRightStartYLocationForBounds:(CGRect)a3 pinnedArrowSide:(int64_t)a4 arrowBase:(double)a5 arrowOffset:(double)a6;
- (double)_upAndDownStartingXLocationForBounds:(CGRect)a3 pinnedArrowSide:(int64_t)a4 arrowBase:(double)a5 arrowOffset:(double)a6;
- (id)generatePopoverPathForParameters:(_UIPopoverShapePathParameters *)a3;
- (void)_generateBottomArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10;
- (void)_generateLeftArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10;
- (void)_generateRightArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10;
- (void)_generateTopArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10;
@end

@implementation _UIPopoverShapePathProviderIOS

- (id)generatePopoverPathForParameters:(_UIPopoverShapePathParameters *)a3
{
  v5 = +[UIBezierPath bezierPath];
  double x = a3->var2.origin.x;
  double y = a3->var2.origin.y;
  double width = a3->var2.size.width;
  double height = a3->var2.size.height;
  int64_t var1 = a3->var1;
  switch(a3->var0)
  {
    case 1uLL:
      double var5 = a3->var5;
      double v12 = y + var5;
      double v13 = height - var5;
      -[_UIPopoverShapePathProviderIOS _upAndDownStartingXLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:](self, "_upAndDownStartingXLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:", a3->var1, a3->var2.origin.x, v12, a3->var2.size.width, v13, a3->var6, a3->var3);
      -[_UIPopoverShapePathProviderIOS _generateTopArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:](self, "_generateTopArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:", v5, var1, x, v12, width, v13, v14, v12, v14 + a3->var6, v12, v14 + a3->var6 * 0.5, v12 - a3->var5, *(void *)&a3->var4, *(void *)&a3->var6);
      break;
    case 2uLL:
      double v15 = height - a3->var5;
      -[_UIPopoverShapePathProviderIOS _upAndDownStartingXLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:](self, "_upAndDownStartingXLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:", a3->var1, a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, v15, a3->var6, a3->var3);
      -[_UIPopoverShapePathProviderIOS _generateBottomArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:](self, "_generateBottomArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:", v5, var1, x, y, width, v15, v16, y + v15, v16 + a3->var6, y + v15, v16 + a3->var6 * 0.5, y + v15 + a3->var5, *(void *)&a3->var4, *(void *)&a3->var6);
      break;
    case 4uLL:
      double v18 = a3->var5;
      double v19 = x + v18;
      double v20 = width - v18;
      -[_UIPopoverShapePathProviderIOS _leftAndRightStartYLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:](self, "_leftAndRightStartYLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:", a3->var1, v19, a3->var2.origin.y, v20, a3->var2.size.height, a3->var6, a3->var3);
      -[_UIPopoverShapePathProviderIOS _generateLeftArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:](self, "_generateLeftArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:", v5, var1, v19, y, v20, height, v19, v21, v19, v21 + a3->var6, v19 - a3->var5, v21 + a3->var6 * 0.5, *(void *)&a3->var4, *(void *)&a3->var6);
      break;
    case 8uLL:
      double v22 = width - a3->var5;
      -[_UIPopoverShapePathProviderIOS _leftAndRightStartYLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:](self, "_leftAndRightStartYLocationForBounds:pinnedArrowSide:arrowBase:arrowOffset:", a3->var1, a3->var2.origin.x, a3->var2.origin.y, v22, a3->var2.size.height, a3->var6, a3->var3);
      -[_UIPopoverShapePathProviderIOS _generateRightArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:](self, "_generateRightArrowShapeInPath:bounds:startPoint:endPoint:peakPoint:pinnedArrowSide:cornerRadius:arrowBase:", v5, var1, x, y, v22, height, x + v22, v23, x + v22, v23 + a3->var6, x + v22 + a3->var5, v23 + a3->var6 * 0.5, *(void *)&a3->var4, *(void *)&a3->var6);
      break;
    default:
      uint64_t v17 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", a3->var2.origin.x, a3->var2.origin.y, a3->var2.size.width, height - a3->var5, a3->var4);

      v5 = (void *)v17;
      break;
  }
  return v5;
}

- (double)_upAndDownStartingXLocationForBounds:(CGRect)a3 pinnedArrowSide:(int64_t)a4 arrowBase:(double)a5 arrowOffset:(double)a6
{
  double x = a3.origin.x;
  double v8 = a3.origin.x + a3.size.width - a5;
  double v9 = a3.origin.x + a3.size.width * 0.5 + a6 - a5 * 0.5;
  BOOL v10 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
  if (a4 == 2) {
    double v11 = v8;
  }
  else {
    double v11 = v9;
  }
  if (a4 == 4) {
    double v11 = x;
  }
  if (!v10) {
    double v11 = v9;
  }
  return fmax(x, fmin(v11, v8));
}

- (CGPoint)_addArrowCurveToPath:(id)a3 direction:(unint64_t)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8
{
  double y = a7.y;
  double x = a7.x;
  double v11 = a6.y;
  double v12 = a6.x;
  double v13 = a5.y;
  double v14 = a5.x;
  double v17 = a5.x;
  double v18 = a5.y;
  id v19 = a3;
  switch(a4)
  {
    case 1uLL:
      double v17 = x + 2.0;
      BOOL v20 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 == 2 && v20)
      {
        objc_msgSend(v19, "moveToPoint:", x + 2.0, y + 1.0);
        double v18 = y + 1.0;
      }
      else
      {
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v19, 1, 0, v12, v11, x + 2.0, y + 1.0);
        double v17 = v24;
        double v18 = v25;
      }
      objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", x + -2.0, y + 1.0, x, y, x, y);
      BOOL v26 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 != 4 || !v26)
      {
        v27 = self;
        id v28 = v19;
        double v29 = x + -2.0;
        double v30 = y + 1.0;
        double v31 = v14;
        double v32 = v13;
        goto LABEL_22;
      }
      break;
    case 2uLL:
      double v17 = x + -2.0;
      BOOL v21 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 == 4 && v21)
      {
        objc_msgSend(v19, "moveToPoint:", x + -2.0, y + -1.0);
        double v18 = y + -1.0;
      }
      else
      {
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v19, 1, 0, v14, v13, x + -2.0, y + -1.0);
        double v17 = v33;
        double v18 = v34;
      }
      objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", x + 2.0, y + -1.0, x, y, x, y);
      BOOL v35 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 != 2 || !v35)
      {
        v27 = self;
        id v28 = v19;
        double v29 = x + 2.0;
        double v30 = y + -1.0;
        double v31 = v12;
        double v32 = v11;
LABEL_22:
        uint64_t v36 = 0;
        goto LABEL_32;
      }
      break;
    case 4uLL:
      double v18 = y + -2.0;
      BOOL v22 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 == 1 && v22)
      {
        objc_msgSend(v19, "moveToPoint:", x + 1.0, y + -2.0);
        double v17 = x + 1.0;
      }
      else
      {
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v19, 1, 1, v14, v13, x + 1.0, y + -2.0);
        double v17 = v37;
        double v18 = v38;
      }
      objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", x + 1.0, y + 2.0, x, y, x, y);
      BOOL v39 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 != 3 || !v39)
      {
        v27 = self;
        id v28 = v19;
        double v29 = x + 1.0;
        double v30 = y + 2.0;
        double v31 = v12;
        double v32 = v11;
        goto LABEL_31;
      }
      break;
    case 8uLL:
      double v18 = y + 2.0;
      BOOL v23 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 == 3 && v23)
      {
        objc_msgSend(v19, "moveToPoint:", x + -1.0, y + 2.0);
        double v17 = x + -1.0;
      }
      else
      {
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](self, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v19, 1, 1, v12, v11, x + -1.0, y + 2.0);
        double v17 = v40;
        double v18 = v41;
      }
      objc_msgSend(v19, "addCurveToPoint:controlPoint1:controlPoint2:", x + -1.0, y + -2.0, x, y, x, y);
      BOOL v42 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
      if (a8 != 1 || !v42)
      {
        v27 = self;
        id v28 = v19;
        double v29 = x + -1.0;
        double v30 = y + -2.0;
        double v31 = v14;
        double v32 = v13;
LABEL_31:
        uint64_t v36 = 1;
LABEL_32:
        -[_UIPopoverShapePathProviderIOS _addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:](v27, "_addLineWithSlightTrailingAndLeadingCurveToPath:startPoint:endPoint:leadingEdge:isVertical:", v28, 0, v36, v29, v30, v31, v32);
      }
      break;
    default:
      break;
  }

  double v43 = v17;
  double v44 = v18;
  result.double y = v44;
  result.double x = v43;
  return result;
}

- (CGPoint)_addLineWithSlightTrailingAndLeadingCurveToPath:(id)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 leadingEdge:(BOOL)a6 isVertical:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  double y = a5.y;
  double x = a5.x;
  double v11 = a4.y;
  double v12 = a4.x;
  double v13 = (a5.x - a4.x) * 0.5;
  double v14 = (a5.y - a4.y) * 0.5;
  id v15 = a3;
  double v16 = v15;
  if (v8)
  {
    double v17 = 0.0;
    if (v7) {
      double v18 = 0.0;
    }
    else {
      double v18 = v13;
    }
    double v19 = v12 - v18;
    if (v7) {
      double v17 = v14;
    }
    double v20 = v11 - v17;
    objc_msgSend(v15, "moveToPoint:", v12 - v18, v11 - v17, v11 + v14, v12 + v13);
    objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", v28, v27, v12, v11, v12, v11);
    objc_msgSend(v16, "lineToPoint:", x, y);
  }
  else
  {
    double v19 = x - v13;
    double v20 = y - v14;
    double v21 = -0.0;
    if (v7) {
      double v22 = -0.0;
    }
    else {
      double v22 = v13;
    }
    double v23 = x + v22;
    if (v7) {
      double v21 = v14;
    }
    double v24 = y + v21;
    objc_msgSend(v15, "lineToPoint:", x - v13, y - v14);
    objc_msgSend(v16, "addCurveToPoint:controlPoint1:controlPoint2:", v23, v24, x, y, x, y);
  }

  double v25 = v19;
  double v26 = v20;
  result.double y = v26;
  result.double x = v25;
  return result;
}

- (void)_generateTopArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10
{
  CGFloat x = a7.x;
  double y = a6.y;
  double v12 = a6.x;
  double v13 = a5.y;
  double v14 = a5.x;
  CGFloat height = a4.size.height;
  double v36 = a4.origin.x;
  CGFloat width = a4.size.width;
  double v15 = a4.origin.y;
  id v44 = a3;
  double v34 = v12;
  double v35 = y;
  [(_UIPopoverShapePathProviderIOS *)self _addArrowCurveToPath:v14 direction:v13 startPoint:v12 endPoint:y peakPoint:a9 pinnedArrowSide:a10];
  double v41 = v17;
  double v42 = v18;
  if (*(void *)&x == 4)
  {
    double v33 = v14;
    v47.origin.CGFloat x = v36;
    v47.origin.double y = v15;
    v47.size.CGFloat width = width;
    double v19 = height;
    v47.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v47);
    double v20 = v36;
    v48.origin.CGFloat x = v36;
    v48.origin.double y = v15;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double v21 = CGRectGetMinY(v48) + v46;
    if (!_UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows()) {
      objc_msgSend(v44, "lineToPoint:", v33, v13);
    }
    objc_msgSend(v44, "addCurveToPoint:controlPoint1:controlPoint2:", MinX, v21, v36, v15, v36, v15, *(void *)&v33);
    double v22 = v36 + v46;
    double v40 = v15 + v46;
    double v23 = v44;
    double v24 = v15;
    double v25 = width;
  }
  else
  {
    double v20 = v36;
    double v22 = v36 + v46;
    double v40 = v15 + v46;
    objc_msgSend(v44, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v36 + v46);
    double v23 = v44;
    double v24 = v15;
    double v25 = width;
    double v19 = height;
  }
  CGFloat v38 = v24;
  double v26 = v24 + v19;
  double v27 = v24 + v19 - v46;
  objc_msgSend(v23, "lineToPoint:", v20, v27);
  objc_msgSend(v44, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v22, v27, v46, 3.14159265, 1.57079633);
  objc_msgSend(v44, "lineToPoint:", v20 + v25 - v46, v26);
  objc_msgSend(v44, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v20 + v25 - v46, v27, v46, 1.57079633, 0.0);
  objc_msgSend(v44, "lineToPoint:", v20 + v25, v40);
  if (*(void *)&x == 2)
  {
    BOOL v28 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
    if (v28) {
      double v29 = v41;
    }
    else {
      double v29 = v34;
    }
    if (v28) {
      double v30 = v42;
    }
    else {
      double v30 = v35;
    }
    v49.origin.CGFloat x = v20;
    v49.origin.double y = v38;
    v49.size.CGFloat width = v25;
    v49.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v49);
    v50.origin.CGFloat x = v20;
    v50.origin.double y = v38;
    v50.size.CGFloat width = v25;
    v50.size.CGFloat height = height;
    CGFloat MinY = CGRectGetMinY(v50);
    objc_msgSend(v44, "addCurveToPoint:controlPoint1:controlPoint2:", v29, v30, MaxX, MinY, MaxX, MinY);
  }
  else
  {
    objc_msgSend(v44, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v20 + v25 - v46, v40, v46, 0.0, 4.71238898);
    objc_msgSend(v44, "lineToPoint:", v41, v42);
  }
  [v44 closePath];
}

- (double)_leftAndRightStartYLocationForBounds:(CGRect)a3 pinnedArrowSide:(int64_t)a4 arrowBase:(double)a5 arrowOffset:(double)a6
{
  double y = a3.origin.y;
  double v8 = a3.origin.y + a3.size.height - a5;
  double v9 = a3.origin.y + a3.size.height * 0.5 + a6 - a5 * 0.5;
  BOOL v10 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
  if (a4 == 3) {
    double v11 = v8;
  }
  else {
    double v11 = v9;
  }
  if (a4 == 1) {
    double v11 = y;
  }
  if (!v10) {
    double v11 = v9;
  }
  return fmax(y, fmin(v11, v8));
}

- (void)_generateBottomArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10
{
  CGFloat x = a7.x;
  double y = a5.y;
  double v12 = a5.x;
  double height = a4.size.height;
  double width = a4.size.width;
  double v36 = a4.origin.y;
  double v15 = a4.origin.x;
  id v40 = a3;
  double v32 = v12;
  double v33 = y;
  [(_UIPopoverShapePathProviderIOS *)self _addArrowCurveToPath:v12 direction:y startPoint:a6.x endPoint:a6.y peakPoint:a9 pinnedArrowSide:a10];
  CGFloat v34 = width;
  CGFloat v35 = height;
  double v37 = v17;
  double v38 = v18;
  if (*(void *)&x == 2)
  {
    v44.origin.CGFloat x = v15;
    double v19 = v36;
    v44.origin.double y = v36;
    v44.size.double width = width;
    v44.size.double height = height;
    double MaxX = CGRectGetMaxX(v44);
    v45.origin.CGFloat x = v15;
    v45.origin.double y = v36;
    v45.size.double width = width;
    v45.size.double height = height;
    double v30 = CGRectGetMaxY(v45) - v42;
    v46.origin.CGFloat x = v15;
    v46.origin.double y = v36;
    v46.size.double width = width;
    v46.size.double height = height;
    double v20 = CGRectGetMaxX(v46);
    v47.origin.CGFloat x = v15;
    v47.origin.double y = v36;
    v47.size.double width = width;
    v47.size.double height = height;
    double MaxY = CGRectGetMaxY(v47);
    if (!_UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows()) {
      objc_msgSend(v40, "lineToPoint:", a6.x, a6.y);
    }
    objc_msgSend(v40, "addCurveToPoint:controlPoint1:controlPoint2:", MaxX, v30, v20, MaxY, v20, MaxY);
    double v22 = v15 + width;
    double v23 = v15 + width - v42;
    double v24 = v36 + height - v42;
  }
  else
  {
    double v22 = v15 + width;
    double v23 = v15 + width - v42;
    double v19 = v36;
    double v24 = v36 + height - v42;
    objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v23, v24, v42, 1.57079633, 0.0);
  }
  objc_msgSend(v40, "lineToPoint:", v22, v19 + v42);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v23, v19 + v42, v42, 0.0, 4.71238898);
  objc_msgSend(v40, "lineToPoint:", v15 + v42 + v43 + 6.0, v19);
  objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v15 + v42, v19 + v42, v42, 4.71238898, 3.14159265);
  objc_msgSend(v40, "lineToPoint:", v15, v24);
  if (*(void *)&x == 4)
  {
    BOOL v25 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
    if (v25) {
      double v26 = v37;
    }
    else {
      double v26 = v32;
    }
    if (v25) {
      double v27 = v38;
    }
    else {
      double v27 = v33;
    }
    v48.origin.CGFloat x = v15;
    v48.origin.double y = v19;
    v48.size.double width = v34;
    v48.size.double height = v35;
    double MinX = CGRectGetMinX(v48);
    v49.origin.CGFloat x = v15;
    v49.origin.double y = v19;
    v49.size.double width = v34;
    v49.size.double height = v35;
    CGFloat v29 = CGRectGetMaxY(v49);
    objc_msgSend(v40, "addCurveToPoint:controlPoint1:controlPoint2:", v26, v27, MinX, v29, MinX, v29);
  }
  else
  {
    objc_msgSend(v40, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v15 + v42, v24, v42, 3.14159265, 1.57079633);
    objc_msgSend(v40, "lineToPoint:", v37, v38);
  }
  [v40 closePath];
}

- (void)_generateLeftArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10
{
  CGFloat x = a7.x;
  double y = a6.y;
  CGFloat width = a4.size.width;
  double v11 = a6.x;
  double v12 = a5.y;
  double v13 = a5.x;
  double height = a4.size.height;
  double v15 = a4.origin.y;
  double v40 = a4.origin.x;
  id v45 = a3;
  double v37 = v13;
  double v38 = v12;
  [(_UIPopoverShapePathProviderIOS *)self _addArrowCurveToPath:v13 direction:v12 startPoint:v11 endPoint:y peakPoint:a9 pinnedArrowSide:a10];
  CGFloat v39 = height;
  double v41 = v17;
  double v42 = v18;
  if (*(void *)&x == 3)
  {
    double v34 = v11;
    double v19 = v40;
    v49.origin.CGFloat x = v40;
    v49.origin.double y = v15;
    double v20 = width;
    v49.size.CGFloat width = width;
    v49.size.double height = height;
    double v36 = CGRectGetMinX(v49) + v47;
    v50.origin.CGFloat x = v40;
    v50.origin.double y = v15;
    v50.size.CGFloat width = width;
    v50.size.double height = height;
    double MaxY = CGRectGetMaxY(v50);
    v51.origin.CGFloat x = v40;
    v51.origin.double y = v15;
    v51.size.CGFloat width = width;
    v51.size.double height = height;
    double MinX = CGRectGetMinX(v51);
    v52.origin.CGFloat x = v40;
    v52.origin.double y = v15;
    v52.size.CGFloat width = width;
    v52.size.double height = height;
    double v22 = CGRectGetMaxY(v52);
    if (!_UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows()) {
      objc_msgSend(v45, "lineToPoint:", v34, y);
    }
    objc_msgSend(v45, "addCurveToPoint:controlPoint1:controlPoint2:", v36, MaxY, MinX, v22, MinX, v22);
    double v23 = v15 + height;
    double v24 = v15 + height - v47;
    double v25 = v40 + v47;
    double v26 = v45;
  }
  else
  {
    double v19 = v40;
    double v25 = v40 + v47;
    double v23 = v15 + height;
    double v24 = v15 + height - v47;
    objc_msgSend(v45, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v40 + v47, v24, v47, 3.14159265, 1.57079633);
    double v26 = v45;
    double v20 = width;
  }
  double v27 = v19 + v20;
  double v28 = v19 + v20 - v47;
  objc_msgSend(v26, "lineToPoint:", v28, v23);
  objc_msgSend(v45, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v28, v24, v47, 1.57079633, 0.0);
  objc_msgSend(v45, "lineToPoint:", v27, v15 + v47);
  objc_msgSend(v45, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v28, v15 + v47, v47, 0.0, 4.71238898);
  objc_msgSend(v45, "lineToPoint:", v25 + v48 + 6.0, v15);
  if (*(void *)&x == 1)
  {
    BOOL v29 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
    if (v29) {
      double v30 = v41;
    }
    else {
      double v30 = v37;
    }
    if (v29) {
      double v31 = v42;
    }
    else {
      double v31 = v38;
    }
    v53.origin.CGFloat x = v19;
    v53.origin.double y = v15;
    v53.size.CGFloat width = width;
    v53.size.double height = v39;
    double v32 = CGRectGetMinX(v53);
    v54.origin.CGFloat x = v19;
    v54.origin.double y = v15;
    v54.size.CGFloat width = width;
    v54.size.double height = v39;
    CGFloat MinY = CGRectGetMinY(v54);
    objc_msgSend(v45, "addCurveToPoint:controlPoint1:controlPoint2:", v30, v31, v32, MinY, v32, MinY);
  }
  else
  {
    objc_msgSend(v45, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v25, v15 + v47, v47, 4.71238898, 3.14159265);
    objc_msgSend(v45, "lineToPoint:", v41, v42);
  }
  [v45 closePath];
}

- (void)_generateRightArrowShapeInPath:(id)a3 bounds:(CGRect)a4 startPoint:(CGPoint)a5 endPoint:(CGPoint)a6 peakPoint:(CGPoint)a7 pinnedArrowSide:(int64_t)a8 cornerRadius:(double)a9 arrowBase:(double)a10
{
  CGFloat x = a7.x;
  double y = a6.y;
  double v12 = a6.x;
  double v13 = a5.y;
  double v14 = a5.x;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double v42 = a4.origin.y;
  double v16 = a4.origin.x;
  id v43 = a3;
  double v37 = v13;
  double v35 = y;
  [(_UIPopoverShapePathProviderIOS *)self _addArrowCurveToPath:v14 direction:v13 startPoint:v12 endPoint:y peakPoint:a9 pinnedArrowSide:a10];
  double v40 = v18;
  double v41 = width;
  double v39 = v19;
  if (*(void *)&x == 1)
  {
    v47.origin.CGFloat x = v16;
    v47.origin.double y = v42;
    v47.size.CGFloat width = width;
    v47.size.CGFloat height = height;
    double v20 = v45;
    double v34 = CGRectGetMaxX(v47) - v45;
    v48.origin.CGFloat x = v16;
    v48.origin.double y = v42;
    v48.size.CGFloat width = width;
    v48.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v48);
    v49.origin.CGFloat x = v16;
    v49.origin.double y = v42;
    v49.size.CGFloat width = width;
    v49.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v49);
    v50.origin.CGFloat x = v16;
    v50.origin.double y = v42;
    v50.size.CGFloat width = width;
    double v22 = height;
    v50.size.CGFloat height = height;
    double v23 = CGRectGetMinY(v50);
    if (!_UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows()) {
      objc_msgSend(v43, "lineToPoint:", v14, v37);
    }
    objc_msgSend(v43, "addCurveToPoint:controlPoint1:controlPoint2:", v34, MinY, MaxX, v23, MaxX, v23);
    double v24 = v42;
    double v25 = v42 + v45;
    double v38 = v16 + v41 - v45;
  }
  else
  {
    double v26 = width;
    double v22 = height;
    double v20 = v45;
    double v24 = v42;
    double v25 = v42 + v45;
    double v38 = v16 + v26 - v45;
    objc_msgSend(v43, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0);
  }
  objc_msgSend(v43, "lineToPoint:", v16 + v20 + v46 + 6.0, v24);
  objc_msgSend(v43, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16 + v20, v25, v20, 4.71238898, 3.14159265);
  double v27 = v24 + v22;
  objc_msgSend(v43, "lineToPoint:", v16, v27 - v20);
  objc_msgSend(v43, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16 + v20, v27 - v20, v20, 3.14159265, 1.57079633);
  objc_msgSend(v43, "lineToPoint:", v38, v27);
  if (*(void *)&x == 3)
  {
    BOOL v28 = _UIPopoverShapeLayerChromeViewWantsCurvedPinnedArrows();
    if (v28) {
      double v29 = v39;
    }
    else {
      double v29 = v12;
    }
    if (v28) {
      double v30 = v40;
    }
    else {
      double v30 = v35;
    }
    v51.origin.CGFloat x = v16;
    v51.origin.double y = v42;
    v51.size.CGFloat width = v41;
    v51.size.CGFloat height = v22;
    double v31 = CGRectGetMaxX(v51);
    v52.origin.CGFloat x = v16;
    v52.origin.double y = v42;
    v52.size.CGFloat width = v41;
    v52.size.CGFloat height = v22;
    CGFloat MaxY = CGRectGetMaxY(v52);
    objc_msgSend(v43, "addCurveToPoint:controlPoint1:controlPoint2:", v29, v30, v31, MaxY, v31, MaxY);
  }
  else
  {
    objc_msgSend(v43, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v38, v27 - v20, v20, 1.57079633, 0.0);
    objc_msgSend(v43, "lineToPoint:", v39, v40);
  }
  [v43 closePath];
}

@end