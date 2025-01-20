@interface _UIPopoverShapePathProviderTV
- (id)generatePopoverPathForParameters:(_UIPopoverShapePathParameters *)a3;
- (void)_addBottomRightPinnedEdgeArrowToPath:(id)a3 bounds:(CGRect)a4 pinnedEdgeArrowStartPoint:(CGPoint)a5 arrowHeight:(double)a6 pinnedArrowBase:(double)a7 arrowTipWidth:(double)a8 arrowTipHeight:(double)a9;
- (void)_addCenterArrowToPath:(id)a3 bounds:(CGRect)a4 arrowOffset:(double)a5 arrowHeight:(double)a6 arrowBase:(double)a7 arrowTipWidth:(double)a8 arrowTipHeight:(double)a9;
- (void)_addCorner:(unint64_t)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 cornerRadius:(double)a6 toPath:(id)a7;
- (void)_transformPath:(id)a3 rotation:(double)a4 flipX:(BOOL)a5 flipY:(BOOL)a6 roundToScale:(double)a7;
@end

@implementation _UIPopoverShapePathProviderTV

- (id)generatePopoverPathForParameters:(_UIPopoverShapePathParameters *)a3
{
  unint64_t var0 = a3->var0;
  int64_t var1 = a3->var1;
  double var4 = a3->var4;
  double var3 = a3->var3;
  double var6 = a3->var6;
  double var7 = a3->var7;
  double var8 = a3->var8;
  BOOL v7 = a3->var0 == 8;
  BOOL v8 = a3->var0 == 8 || a3->var0 == 4;
  CGRect var2 = a3->var2;
  if (v8) {
    double width = a3->var2.size.width;
  }
  else {
    double width = a3->var2.size.height;
  }
  if (v8) {
    double height = a3->var2.size.height;
  }
  else {
    double height = a3->var2.size.width;
  }
  double var5 = a3->var5;
  if (var0) {
    double v11 = width - a3->var5;
  }
  else {
    double v11 = a3->var2.size.height;
  }
  v12 = +[UIBezierPath bezierPath];
  v38.origin = var2.origin;
  v38.size.double width = height;
  v38.size.double height = v11;
  double MaxX = CGRectGetMaxX(v38);
  v39.origin = var2.origin;
  v39.size.double width = height;
  v39.size.double height = v11;
  double v14 = CGRectGetMaxY(v39) - var4;
  v40.origin = var2.origin;
  v40.size.double width = height;
  v40.size.double height = v11;
  double v15 = CGRectGetMaxX(v40);
  v41.origin = var2.origin;
  v41.size.double width = height;
  v41.size.double height = v11;
  double MaxY = CGRectGetMaxY(v41);
  objc_msgSend(v12, "moveToPoint:", MaxX, v14);
  if (var1 && var0)
  {
    -[_UIPopoverShapePathProviderTV _addBottomRightPinnedEdgeArrowToPath:bounds:pinnedEdgeArrowStartPoint:arrowHeight:pinnedArrowBase:arrowTipWidth:arrowTipHeight:](self, "_addBottomRightPinnedEdgeArrowToPath:bounds:pinnedEdgeArrowStartPoint:arrowHeight:pinnedArrowBase:arrowTipWidth:arrowTipHeight:", v12, *(_OWORD *)&var2.origin, height, v11, MaxX, v14, var5, var7, 0x4022000000000000, 0x4000CCCCCCCCCCCDLL);
  }
  else
  {
    -[_UIPopoverShapePathProviderTV _addCorner:startPoint:endPoint:cornerRadius:toPath:](self, "_addCorner:startPoint:endPoint:cornerRadius:toPath:", 8, v12, MaxX, v14, v15 - var4, MaxY, var4);
    if (var0) {
      -[_UIPopoverShapePathProviderTV _addCenterArrowToPath:bounds:arrowOffset:arrowHeight:arrowBase:arrowTipWidth:arrowTipHeight:](self, "_addCenterArrowToPath:bounds:arrowOffset:arrowHeight:arrowBase:arrowTipWidth:arrowTipHeight:", v12, *(_OWORD *)&var2.origin, height, v11, var3, var5, var6, 9.0, 0x4000CCCCCCCCCCCDLL);
    }
  }
  v42.origin = var2.origin;
  v42.size.double width = height;
  v42.size.double height = v11;
  double v16 = var4 + CGRectGetMinX(v42);
  v43.origin = var2.origin;
  v43.size.double width = height;
  v43.size.double height = v11;
  double v17 = CGRectGetMaxY(v43);
  v44.origin = var2.origin;
  v44.size.double width = height;
  v44.size.double height = v11;
  double MinX = CGRectGetMinX(v44);
  v45.origin = var2.origin;
  v45.size.double width = height;
  v45.size.double height = v11;
  CGFloat v18 = CGRectGetMaxY(v45) - var4;
  objc_msgSend(v12, "addLineToPoint:", v16, v17);
  -[_UIPopoverShapePathProviderTV _addCorner:startPoint:endPoint:cornerRadius:toPath:](self, "_addCorner:startPoint:endPoint:cornerRadius:toPath:", 4, v12, v16, v17, MinX, v18, var4);
  v46.origin = var2.origin;
  v46.size.double width = height;
  v46.size.double height = v11;
  double v19 = CGRectGetMinX(v46);
  v47.origin = var2.origin;
  v47.size.double width = height;
  v47.size.double height = v11;
  double v20 = var4 + CGRectGetMinY(v47);
  v48.origin = var2.origin;
  v48.size.double width = height;
  v48.size.double height = v11;
  double v35 = var4 + CGRectGetMinX(v48);
  v49.origin = var2.origin;
  v49.size.double width = height;
  v49.size.double height = v11;
  double MinY = CGRectGetMinY(v49);
  objc_msgSend(v12, "addLineToPoint:", v19, v20);
  -[_UIPopoverShapePathProviderTV _addCorner:startPoint:endPoint:cornerRadius:toPath:](self, "_addCorner:startPoint:endPoint:cornerRadius:toPath:", 1, v12, v19, v20, v35, MinY, var4);
  v50.origin = var2.origin;
  v50.size.double width = height;
  v50.size.double height = v11;
  CGFloat v22 = CGRectGetMaxX(v50) - var4;
  v51.origin = var2.origin;
  v51.size.double width = height;
  v51.size.double height = v11;
  double v23 = CGRectGetMinY(v51);
  v52.origin = var2.origin;
  v52.size.double width = height;
  v52.size.double height = v11;
  double v24 = CGRectGetMaxX(v52);
  v53.origin = var2.origin;
  v53.size.double width = height;
  v53.size.double height = v11;
  double v25 = var4 + CGRectGetMinY(v53);
  objc_msgSend(v12, "addLineToPoint:", v22, v23);
  -[_UIPopoverShapePathProviderTV _addCorner:startPoint:endPoint:cornerRadius:toPath:](self, "_addCorner:startPoint:endPoint:cornerRadius:toPath:", 2, v12, v22, v23, v24, v25, var4);
  [v12 closePath];
  if (var0)
  {
    double v26 = 90.0;
    if (!v8) {
      double v26 = 0.0;
    }
    if (var0 != 4 && var0 != 8) {
      BOOL v7 = var1 == 4;
    }
    if (var0 != 4 && var0 != 8) {
      int64_t var1 = var0;
    }
    [(_UIPopoverShapePathProviderTV *)self _transformPath:v12 rotation:v7 flipX:var1 == 1 flipY:v26 roundToScale:var8];
  }
  return v12;
}

- (void)_addCorner:(unint64_t)a3 startPoint:(CGPoint)a4 endPoint:(CGPoint)a5 cornerRadius:(double)a6 toPath:(id)a7
{
  double y = a5.y;
  double x = a5.x;
  if (a3 == 1)
  {
    char v10 = 0;
    __asm { FMOV            V0.2D, #-1.0 }
  }
  else
  {
    if (a3 == 2)
    {
      _Q0 = xmmword_186B93B00;
    }
    else
    {
      if (a3 != 4)
      {
        char v10 = 0;
        __asm { FMOV            V0.2D, #1.0 }
        goto LABEL_9;
      }
      _Q0 = xmmword_186B93AF0;
    }
    char v10 = 1;
  }
LABEL_9:
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __84___UIPopoverShapePathProviderTV__addCorner_startPoint_endPoint_cornerRadius_toPath___block_invoke;
  aBlock[3] = &__block_descriptor_49_e30__CGPoint_dd_24__0_CGPoint_dd_8l;
  char v44 = v10;
  long long v43 = _Q0;
  id v15 = a7;
  double v16 = (double (**)(double, double))_Block_copy(aBlock);
  double v17 = v16[2](-4.01, 22.65);
  double v19 = v18;
  double v20 = ((double (*)(double (**)(double, double), double))v16[2])(v16, 0.0);
  double v22 = v21;
  double v23 = ((double (*)(double (**)(double, double)))v16[2])(v16);
  objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", a4.x + v17, a4.y + v19, a4.x + v20, a4.y + v22, a4.x + v23, a4.y + v24);
  double v25 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 22.65, -4.01);
  double v27 = v26;
  double v28 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 31.38, -10.46);
  double v30 = v29;
  double v31 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 27.54, -6.62);
  objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", x + v25, y + v27, x + v28, y + v30, x + v31, y + v32);
  double v33 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 0.0, 0.0);
  double v35 = v34;
  double v36 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 17.76, -1.39);
  double v38 = v37;
  double v39 = ((double (*)(double (**)(double, double), double, double))v16[2])(v16, 12.91, 0.0);
  objc_msgSend(v15, "addCurveToPoint:controlPoint1:controlPoint2:", x + v33, y + v35, x + v36, y + v38, x + v39, y + v40);
}

- (void)_addCenterArrowToPath:(id)a3 bounds:(CGRect)a4 arrowOffset:(double)a5 arrowHeight:(double)a6 arrowBase:(double)a7 arrowTipWidth:(double)a8 arrowTipHeight:(double)a9
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v24 = a3;
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMidX(v26) + a5;
  double v16 = a7 * 0.5;
  double v17 = a7 * 0.5 + v15;
  v27.origin.CGFloat x = x;
  v27.origin.CGFloat y = y;
  v27.size.CGFloat width = width;
  v27.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v27);
  CGFloat v23 = v15 - v16;
  v28.origin.CGFloat x = x;
  v28.origin.CGFloat y = y;
  v28.size.CGFloat width = width;
  v28.size.CGFloat height = height;
  double v22 = CGRectGetMaxY(v28);
  v29.origin.CGFloat x = x;
  v29.origin.CGFloat y = y;
  v29.size.CGFloat width = width;
  v29.size.CGFloat height = height;
  CGFloat v19 = CGRectGetMaxY(v29) + a6;
  objc_msgSend(v24, "addLineToPoint:", v17, MaxY);
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v17 + -12.7, MaxY + 4.64, v17, MaxY, v17 + -7.92, MaxY + -0.16);
  objc_msgSend(v24, "addLineToPoint:", a8 * 0.5 + v15, v19 - a9);
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v15, v19, v15 + 3.35, v19 + -1.02, v15 + 1.92, v19);
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v15 - a8 * 0.5, v19 - a9, v15 + -1.92, v19, v15 + -3.35, v19 + -1.02);
  objc_msgSend(v24, "addLineToPoint:", v23 + 12.7, v22 + 4.64);
  objc_msgSend(v24, "addCurveToPoint:controlPoint1:controlPoint2:", v23, v22, v23 + 7.92, v22 + -0.16, v23, v22);
}

- (void)_addBottomRightPinnedEdgeArrowToPath:(id)a3 bounds:(CGRect)a4 pinnedEdgeArrowStartPoint:(CGPoint)a5 arrowHeight:(double)a6 pinnedArrowBase:(double)a7 arrowTipWidth:(double)a8 arrowTipHeight:(double)a9
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v20 = a3;
  v22.origin.CGFloat x = x;
  v22.origin.CGFloat y = y;
  v22.size.CGFloat width = width;
  v22.size.CGFloat height = height;
  CGFloat v15 = CGRectGetMaxX(v22) - a7;
  v23.origin.CGFloat x = x;
  v23.origin.CGFloat y = y;
  v23.size.CGFloat width = width;
  v23.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v23);
  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  CGFloat v17 = CGRectGetMaxX(v24) - a7 * 0.5 + 1.0;
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  CGFloat v18 = CGRectGetMaxY(v25) + a6;
  objc_msgSend(v20, "addCurveToPoint:controlPoint1:controlPoint2:", a5.x + -12.05, a5.y + 42.56, a5.x + -12.05 + 12.05, a5.y + 42.56 + -18.73, a5.x + -12.05 + 8.19, a5.y + 42.56 + -10.98);
  objc_msgSend(v20, "addLineToPoint:", a8 * 0.5 + v17, v18 - a9);
  objc_msgSend(v20, "addCurveToPoint:controlPoint1:controlPoint2:", v17, v18, v17 + 3.55, v18 + -0.86, v17 + 1.93, v18);
  objc_msgSend(v20, "addCurveToPoint:controlPoint1:controlPoint2:", v17 - a8 * 0.5, v18 - a9, v17 - a8 * 0.5 + 2.62, v18 - a9 + 2.12, v17 - a8 * 0.5 + 1.18, v18 - a9 + 1.09);
  objc_msgSend(v20, "addLineToPoint:", v15 + 12.72, MaxY + 4.56);
  objc_msgSend(v20, "addCurveToPoint:controlPoint1:controlPoint2:", v15, MaxY, v15 + 8.66, MaxY + 0.48, v15 + 2.37, MaxY + 0.04);
}

- (void)_transformPath:(id)a3 rotation:(double)a4 flipX:(BOOL)a5 flipY:(BOOL)a6 roundToScale:(double)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  id v11 = a3;
  [v11 bounds];
  UIRectRoundToScale(v12, v13, v14, v15, a7);
  double v16 = a4 * 3.14159265 / 180.0;
  unint64_t v17 = (unsigned __int128)((uint64_t)a4 * (__int128)0x2D82D82D82D82D83) >> 64;
  int v18 = (v17 >> 63) + (v17 >> 4);
  double v20 = v19 * -0.5;
  double v22 = v21 * -0.5;
  double v23 = -(v21 * -0.5);
  double v24 = -(v19 * -0.5);
  if (v18) {
    CGFloat v25 = v23;
  }
  else {
    CGFloat v25 = v24;
  }
  if (v18) {
    CGFloat v26 = v24;
  }
  else {
    CGFloat v26 = v23;
  }
  CGAffineTransformMakeTranslation(&v32, v20, v22);
  [v11 applyTransform:&v32];
  CGAffineTransformMakeRotation(&v31, v16);
  [v11 applyTransform:&v31];
  double v27 = 1.0;
  if (v9) {
    double v28 = -1.0;
  }
  else {
    double v28 = 1.0;
  }
  if (v8) {
    double v27 = -1.0;
  }
  CGAffineTransformMakeScale(&v30, v28, v27);
  [v11 applyTransform:&v30];
  CGAffineTransformMakeTranslation(&v29, v25, v26);
  [v11 applyTransform:&v29];
}

@end