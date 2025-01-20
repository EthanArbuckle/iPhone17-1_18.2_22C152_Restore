@interface PXViewLayoutHelper
+ (int64_t)userInterfaceLayoutDirection;
+ (void)initialize;
+ (void)performLayoutWithinView:(id)a3 usingBlock:(id)a4;
+ (void)setUserInterfaceLayoutDirection:(int64_t)a3;
- (CGRect)_orientedFrameOfView:(id)a3;
- (PXViewLayoutHelper)init;
- (double)bottomOfView:(id)a3;
- (double)firstBaselineOfView:(id)a3;
- (double)horizontalCenterOfView:(id)a3;
- (double)lastBaselineOfView:(id)a3;
- (double)leadingOfView:(id)a3;
- (double)topOfView:(id)a3;
- (double)trailingOfView:(id)a3;
- (double)verticalCenterOfView:(id)a3;
- (id)_init;
- (void)_getFirstBaseline:(double *)a3 lastBaseline:(double *)a4 forView:(id)a5 withSize:(CGSize)a6;
- (void)_setOrientedFrame:(CGRect)a3 forView:(id)a4;
- (void)_setUpWithView:(id)a3;
- (void)_tearDown;
- (void)layoutView:(id)a3 withAttributes:(id *)a4;
@end

@implementation PXViewLayoutHelper

- (void).cxx_destruct
{
}

- (void)_getFirstBaseline:(double *)a3 lastBaseline:(double *)a4 forView:(id)a5 withSize:(CGSize)a6
{
  double height = a6.height;
  double width = a6.width;
  id v10 = a5;
  double v12 = *MEMORY[0x1E4F1DAD8];
  double v11 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  objc_opt_class();
  CGFloat rect = width;
  if (objc_opt_isKindOfClass())
  {
    v13 = [v10 font];
    double v20 = height;
    CGFloat v19 = v11;
    CGFloat v18 = v12;
    if (a3)
    {
LABEL_10:
      v32.origin.x = v12;
      v32.origin.y = v11;
      v32.size.double width = width;
      v32.size.double height = height;
      double MinY = CGRectGetMinY(v32);
      [v13 ascender];
      double v27 = MinY + v26;
      v33.origin.x = v18;
      v33.origin.y = v19;
      v33.size.double width = rect;
      v33.size.double height = v20;
      *a3 = v27 - CGRectGetMinY(v33);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      PXAssertGetLog();
    }
    id v14 = v10;
    v15 = [v14 attributedTitleForState:0];
    v13 = [v15 attribute:*MEMORY[0x1E4FB06F8] atIndex:0 effectiveRange:0];

    v16 = [v14 titleLabel];
    v17 = v16;
    if (!v13)
    {
      v13 = [v16 font];
    }
    CGFloat v18 = v12;
    CGFloat v19 = v11;
    double v20 = height;
    objc_msgSend(v14, "contentRectForBounds:", v12, v11, width, height);
    objc_msgSend(v14, "titleRectForContentRect:");
    double v12 = v21;
    double v11 = v22;
    double width = v23;
    double height = v24;

    if (a3) {
      goto LABEL_10;
    }
  }
  if (a4)
  {
    v34.origin.x = v12;
    v34.origin.y = v11;
    v34.size.double width = width;
    v34.size.double height = height;
    double MaxY = CGRectGetMaxY(v34);
    [v13 descender];
    double v30 = v20 + MaxY + v29;
    v35.origin.x = v18;
    v35.origin.y = v19;
    v35.size.double width = rect;
    v35.size.double height = v20;
    *a4 = v30 - CGRectGetMaxY(v35);
  }
}

- (void)_setOrientedFrame:(CGRect)a3 forView:(id)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  long long v10 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&v24.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&v24.c = v10;
  *(_OWORD *)&v24.tCGFloat x = *(_OWORD *)&self->_transform.tx;
  CGFloat v11 = x;
  *(CGFloat *)&long long v10 = y;
  CGFloat v12 = width;
  CGFloat v13 = height;
  CGRect v26 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v10 - 8), &v24);
  double v14 = v26.origin.x;
  double v15 = v26.origin.y;
  double v16 = v26.size.width;
  double v17 = v26.size.height;
  CGFloat v18 = [v9 superview];
  coordinateSpace = self->_coordinateSpace;
  if (v18 != coordinateSpace)
  {
    if (!v18) {
      PXAssertGetLog();
    }
    -[UICoordinateSpace convertRect:toCoordinateSpace:](coordinateSpace, "convertRect:toCoordinateSpace:", v18, v14, v15, v16, v17);
    double v14 = v20;
    double v15 = v21;
    double v16 = v22;
    double v17 = v23;
  }
  objc_msgSend(v9, "setFrame:", v14, v15, v16, v17);
}

- (CGRect)_orientedFrameOfView:(id)a3
{
  id v4 = a3;
  v5 = [v4 superview];
  coordinateSpace = self->_coordinateSpace;

  if (v5 == coordinateSpace)
  {
    [v4 frame];
  }
  else
  {
    double v20 = self->_coordinateSpace;
    [v4 bounds];
    -[UICoordinateSpace convertRect:fromCoordinateSpace:](v20, "convertRect:fromCoordinateSpace:", v4);
  }
  long long v11 = *(_OWORD *)&self->_reverseTransform.c;
  *(_OWORD *)&v21.a = *(_OWORD *)&self->_reverseTransform.a;
  *(_OWORD *)&v21.c = v11;
  *(_OWORD *)&v21.tCGFloat x = *(_OWORD *)&self->_reverseTransform.tx;
  CGRect v22 = CGRectApplyAffineTransform(*(CGRect *)&v7, &v21);
  CGFloat x = v22.origin.x;
  CGFloat y = v22.origin.y;
  CGFloat width = v22.size.width;
  CGFloat height = v22.size.height;

  double v16 = x;
  double v17 = y;
  double v18 = width;
  double v19 = height;
  result.size.CGFloat height = v19;
  result.size.CGFloat width = v18;
  result.origin.CGFloat y = v17;
  result.origin.CGFloat x = v16;
  return result;
}

- (void)_tearDown
{
  coordinateSpace = self->_coordinateSpace;
  self->_coordinateSpace = 0;
}

- (void)_setUpWithView:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  self->_containerBounds.origin.CGFloat x = v5;
  self->_containerBounds.origin.CGFloat y = v6;
  self->_containerBounds.size.CGFloat width = v7;
  self->_containerBounds.size.CGFloat height = v8;
  coordinateSpace = self->_coordinateSpace;
  self->_coordinateSpace = (UICoordinateSpace *)v4;
  id v10 = v4;

  int64_t v11 = +[PXViewLayoutHelper userInterfaceLayoutDirection];
  if (v11 == 1)
  {
    double MidX = CGRectGetMidX(self->_containerBounds);
    CGAffineTransformMakeTranslation(&v26, -MidX, 0.0);
    long long v13 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->_transform.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->_transform.c = v13;
    *(_OWORD *)&self->_transform.tCGFloat x = *(_OWORD *)&v26.tx;
    CGAffineTransformMakeScale(&t2, -1.0, 1.0);
    long long v14 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t1.c = v14;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v26, &t1, &t2);
    long long v15 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->_transform.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->_transform.c = v15;
    *(_OWORD *)&self->_transform.tCGFloat x = *(_OWORD *)&v26.tx;
    CGAffineTransformMakeTranslation(&v23, MidX, 0.0);
    long long v16 = *(_OWORD *)&self->_transform.c;
    *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
    *(_OWORD *)&t1.c = v16;
    *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_transform.tx;
    CGAffineTransformConcat(&v26, &t1, &v23);
    long long v17 = *(_OWORD *)&v26.c;
    *(_OWORD *)&self->_transform.a = *(_OWORD *)&v26.a;
    *(_OWORD *)&self->_transform.c = v17;
    long long v18 = *(_OWORD *)&v26.tx;
  }
  else
  {
    uint64_t v19 = MEMORY[0x1E4F1DAB8];
    long long v20 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&self->_transform.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&self->_transform.c = v20;
    long long v18 = *(_OWORD *)(v19 + 32);
  }
  *(_OWORD *)&self->_transform.tCGFloat x = v18;
  long long v21 = *(_OWORD *)&self->_transform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_transform.a;
  *(_OWORD *)&t1.c = v21;
  *(_OWORD *)&t1.tCGFloat x = *(_OWORD *)&self->_transform.tx;
  CGAffineTransformInvert(&v26, &t1);
  long long v22 = *(_OWORD *)&v26.c;
  *(_OWORD *)&self->_reverseTransform.a = *(_OWORD *)&v26.a;
  *(_OWORD *)&self->_reverseTransform.c = v22;
  *(_OWORD *)&self->_reverseTransform.tCGFloat x = *(_OWORD *)&v26.tx;
}

- (double)lastBaselineOfView:(id)a3
{
  id v4 = a3;
  [(PXViewLayoutHelper *)self _orientedFrameOfView:v4];
  double v6 = v5;
  double v10 = 0.0;
  -[PXViewLayoutHelper _getFirstBaseline:lastBaseline:forView:withSize:](self, "_getFirstBaseline:lastBaseline:forView:withSize:", 0, &v10, v4, v7, v8);

  return v6 + v10;
}

- (double)firstBaselineOfView:(id)a3
{
  id v4 = a3;
  [(PXViewLayoutHelper *)self _orientedFrameOfView:v4];
  double v6 = v5;
  double v10 = 0.0;
  -[PXViewLayoutHelper _getFirstBaseline:lastBaseline:forView:withSize:](self, "_getFirstBaseline:lastBaseline:forView:withSize:", &v10, 0, v4, v7, v8);

  return v6 + v10;
}

- (double)bottomOfView:(id)a3
{
  [(PXViewLayoutHelper *)self _orientedFrameOfView:a3];
  return CGRectGetMaxY(*(CGRect *)&v3);
}

- (double)verticalCenterOfView:(id)a3
{
  [(PXViewLayoutHelper *)self _orientedFrameOfView:a3];
  return CGRectGetMidY(*(CGRect *)&v3);
}

- (double)topOfView:(id)a3
{
  [(PXViewLayoutHelper *)self _orientedFrameOfView:a3];
  return CGRectGetMinY(*(CGRect *)&v3);
}

- (double)trailingOfView:(id)a3
{
  [(PXViewLayoutHelper *)self _orientedFrameOfView:a3];
  return CGRectGetMaxX(*(CGRect *)&v3);
}

- (double)horizontalCenterOfView:(id)a3
{
  [(PXViewLayoutHelper *)self _orientedFrameOfView:a3];
  return CGRectGetMidX(*(CGRect *)&v3);
}

- (double)leadingOfView:(id)a3
{
  [(PXViewLayoutHelper *)self _orientedFrameOfView:a3];
  return CGRectGetMinX(*(CGRect *)&v3);
}

- (void)layoutView:(id)a3 withAttributes:(id *)a4
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4)
  {
    double v7 = self;
    [(PXViewLayoutHelper *)self _orientedFrameOfView:v6];
    CGFloat x = v102.origin.x;
    CGFloat y = v102.origin.y;
    CGFloat width = v102.size.width;
    CGFloat height = v102.size.height;
    double var0 = a4->var0;
    double MinX = CGRectGetMinX(v102);
    double v14 = fabs(var0);
    BOOL v15 = v14 < INFINITY;
    if (v14 > INFINITY) {
      BOOL v15 = 1;
    }
    if (v14 < INFINITY) {
      double MinX = var0;
    }
    if (v14 > INFINITY) {
      double MinX = var0;
    }
    double v98 = MinX;
    int v16 = var0 == -INFINITY || v15;
    double var2 = a4->var2;
    v103.origin.CGFloat x = x;
    v103.origin.CGFloat y = y;
    v103.size.CGFloat width = width;
    v103.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v103);
    double v19 = fabs(var2);
    BOOL v20 = v19 < INFINITY;
    if (v19 > INFINITY) {
      BOOL v20 = 1;
    }
    if (v19 < INFINITY) {
      double MaxX = var2;
    }
    if (v19 > INFINITY) {
      double MaxX = var2;
    }
    double v93 = MaxX;
    int v21 = var2 == -INFINITY || v20;
    double var3 = a4->var3;
    v104.origin.CGFloat x = x;
    v104.origin.CGFloat y = y;
    v104.size.CGFloat width = width;
    v104.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v104);
    double v24 = fabs(var3);
    BOOL v25 = v24 < INFINITY;
    if (v24 > INFINITY) {
      BOOL v25 = 1;
    }
    if (v24 < INFINITY) {
      double MinY = var3;
    }
    if (v24 > INFINITY) {
      double MinY = var3;
    }
    double v97 = MinY;
    int v26 = var3 == -INFINITY || v25;
    double var5 = a4->var5;
    v105.origin.CGFloat x = x;
    v105.origin.CGFloat y = y;
    v105.size.CGFloat width = width;
    v105.size.CGFloat height = height;
    double MaxY = CGRectGetMaxY(v105);
    double v29 = fabs(var5);
    BOOL v30 = v29 < INFINITY;
    if (v29 > INFINITY) {
      BOOL v30 = 1;
    }
    if (v29 < INFINITY) {
      double MaxY = var5;
    }
    if (v29 > INFINITY) {
      double MaxY = var5;
    }
    double v94 = MaxY;
    int v31 = var5 == -INFINITY || v30;
    double var8 = a4->var8;
    v106.origin.CGFloat x = x;
    v106.origin.CGFloat y = y;
    v106.size.CGFloat width = width;
    v106.size.CGFloat height = height;
    double v33 = CGRectGetWidth(v106);
    double v34 = fabs(var8);
    BOOL v35 = v34 < INFINITY;
    if (v34 > INFINITY) {
      BOOL v35 = 1;
    }
    if (v34 < INFINITY) {
      double v33 = var8;
    }
    if (v34 > INFINITY) {
      double v33 = var8;
    }
    double v99 = v33;
    uint64_t v36 = var8 == -INFINITY || v35;
    double var9 = a4->var9;
    v107.origin.CGFloat x = x;
    v107.origin.CGFloat y = y;
    v107.size.CGFloat width = width;
    v107.size.CGFloat height = height;
    double v38 = CGRectGetHeight(v107);
    double v39 = fabs(var9);
    BOOL v40 = v39 < INFINITY;
    if (v39 > INFINITY) {
      BOOL v40 = 1;
    }
    if (v39 < INFINITY) {
      double v38 = var9;
    }
    if (v39 > INFINITY) {
      double v38 = var9;
    }
    double v95 = v38;
    if (var9 == -INFINITY) {
      BOOL v40 = 1;
    }
    BOOL v96 = v40;
    double var10 = a4->var10;
    v108.origin.CGFloat x = x;
    v108.origin.CGFloat y = y;
    v108.size.CGFloat width = width;
    v108.size.CGFloat height = height;
    double v42 = CGRectGetMinX(v108);
    double v43 = fabs(var10);
    BOOL v44 = v43 < INFINITY;
    if (v43 > INFINITY) {
      BOOL v44 = 1;
    }
    if (v43 < INFINITY) {
      double v42 = var10;
    }
    if (v43 > INFINITY) {
      double v42 = var10;
    }
    double v89 = v42;
    int v45 = var10 == -INFINITY || v44;
    double var11 = a4->var11;
    v109.origin.CGFloat x = x;
    v109.origin.CGFloat y = y;
    v109.size.CGFloat width = width;
    v109.size.CGFloat height = height;
    double v47 = CGRectGetMaxY(v109);
    double v48 = fabs(var11);
    BOOL v49 = v48 == INFINITY;
    if (v48 == INFINITY) {
      double v50 = v47;
    }
    else {
      double v50 = var11;
    }
    double v92 = v50;
    BOOL v51 = var11 != -INFINITY && v49;
    double var12 = a4->var12;
    v110.origin.CGFloat x = x;
    v110.origin.CGFloat y = y;
    v110.size.CGFloat width = width;
    v110.size.CGFloat height = height;
    double v53 = CGRectGetMinY(v110);
    double v54 = fabs(var12);
    BOOL v55 = v54 < INFINITY;
    if (v54 > INFINITY) {
      BOOL v55 = 1;
    }
    if (v54 < INFINITY) {
      double v53 = var12;
    }
    if (v54 > INFINITY) {
      double v53 = var12;
    }
    double v90 = v53;
    if (var12 == -INFINITY) {
      BOOL v55 = 1;
    }
    BOOL v91 = v55;
    double var13 = a4->var13;
    v111.origin.CGFloat x = x;
    v111.origin.CGFloat y = y;
    v111.size.CGFloat width = width;
    v111.size.CGFloat height = height;
    double v57 = CGRectGetMaxY(v111);
    double v58 = fabs(var13);
    BOOL v59 = v58 == INFINITY;
    if (v58 == INFINITY) {
      double v60 = v57;
    }
    else {
      double v60 = var13;
    }
    double v88 = v60;
    if (var13 == -INFINITY) {
      BOOL v59 = 0;
    }
    double v61 = a4->var8;
    double v62 = a4->var9;
    if (v61 != INFINITY && v62 != INFINITY) {
      goto LABEL_111;
    }
    double v63 = v99;
    if ((v36 & 1) == 0)
    {
      double v64 = -1.79769313e307;
      if (v45) {
        double v64 = v89;
      }
      if (v16) {
        double v64 = v98;
      }
      double v65 = 1.79769313e307;
      if (!v51) {
        double v65 = v92;
      }
      if (v21) {
        double v65 = v93;
      }
      double v63 = v65 - v64;
    }
    double v66 = v95;
    if (!v96)
    {
      double v67 = -1.79769313e307;
      if (v91) {
        double v67 = v90;
      }
      if (v26) {
        double v67 = v97;
      }
      double v68 = 1.79769313e307;
      if (!v59) {
        double v68 = v92;
      }
      if (v31) {
        double v68 = v94;
      }
      double v66 = v68 - v67;
    }
    objc_msgSend(v6, "sizeThatFits:", v63, v66, *(void *)&v88);
    double v71 = fmin(v70, v63);
    if (v61 == INFINITY) {
      uint64_t v36 = 1;
    }
    double v72 = v99;
    if (v61 == INFINITY) {
      double v72 = v71;
    }
    double v99 = v72;
    if (v62 == INFINITY) {
      double v73 = fmin(v69, v66);
    }
    else {
LABEL_111:
    }
      double v73 = v95;
    if (v16 & v21)
    {
      double v75 = v97;
      double v74 = v98;
      double v76 = v93;
    }
    else
    {
      int v77 = v21 ^ 1;
      double var1 = a4->var1;
      v112.origin.CGFloat x = x;
      v112.origin.CGFloat y = y;
      v112.size.CGFloat width = width;
      v112.size.CGFloat height = height;
      double MidY = CGRectGetMidY(v112);
      double v80 = fabs(var1);
      BOOL v81 = v80 == INFINITY;
      if (v80 == INFINITY) {
        double v82 = MidY;
      }
      else {
        double v82 = var1;
      }
      if (var1 == -INFINITY) {
        BOOL v81 = 0;
      }
      if ((v16 & v77) == 1)
      {
        double v74 = v98;
        if (v36) {
          int v83 = 1;
        }
        else {
          int v83 = v51;
        }
        if (v98 + v99 < v92) {
          int v83 = 1;
        }
        if (v83) {
          double v76 = v98 + v99;
        }
        else {
          double v76 = v92;
        }
        double v75 = v97;
        if (!v81) {
          PXAssertGetLog();
        }
      }
      else
      {
        double v74 = v98;
        if ((v16 | v77))
        {
          double v75 = v97;
          double v76 = v93;
          if (v81)
          {
            double v84 = v89;
            if (v98 >= v89) {
              double v84 = v98;
            }
            if (v45)
            {
              double v76 = v84 + v99;
              double v74 = v84;
            }
            if (!v51)
            {
              if (v76 >= v92) {
                double v76 = v92;
              }
              double v74 = v76 - v99;
              if (v45 && v74 < v89) {
                double v74 = v89;
              }
            }
          }
          else
          {
            double v74 = v82 + v99 * -0.5;
            if (v45) {
              PXAssertGetLog();
            }
            double v76 = v99 + v74;
            if (!v51) {
              PXAssertGetLog();
            }
          }
        }
        else
        {
          double v76 = v93;
          if (v36) {
            unsigned __int8 v85 = 0;
          }
          else {
            unsigned __int8 v85 = v45;
          }
          if ((v85 & (v93 - v99 < v89)) != 0) {
            double v74 = v89;
          }
          else {
            double v74 = v93 - v99;
          }
          double v75 = v97;
          if (!v81) {
            PXAssertGetLog();
          }
        }
      }
    }
    double v86 = v76 - v74;
    if ((v26 & 1) == 0 && a4->var6 != -INFINITY)
    {
      *(void *)buf = 0;
      -[PXViewLayoutHelper _getFirstBaseline:lastBaseline:forView:withSize:](v7, "_getFirstBaseline:lastBaseline:forView:withSize:", buf, 0, v6, v76 - v74, v73);
      double v75 = a4->var6 - *(double *)buf;
    }
    if ((v31 & 1) == 0 && a4->var7 != -INFINITY)
    {
      *(void *)buf = 0;
      -[PXViewLayoutHelper _getFirstBaseline:lastBaseline:forView:withSize:](v7, "_getFirstBaseline:lastBaseline:forView:withSize:", 0, buf, v6, v76 - v74, v73);
      double v87 = a4->var7 - *(double *)buf;
      v113.origin.CGFloat x = v74;
      v113.origin.CGFloat y = y;
      v113.size.CGFloat width = v86;
      v113.size.CGFloat height = v73;
      double v94 = v87 + CGRectGetHeight(v113);
    }
    -[PXViewLayoutHelper _setOrientedFrame:forView:](v7, "_setOrientedFrame:forView:", v6, v74, v75, v86, v94 - v75, *(void *)&v88);
  }
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)PXViewLayoutHelper;
  return [(PXViewLayoutHelper *)&v3 init];
}

- (PXViewLayoutHelper)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXViewLayoutHelper.m", 132, @"%s is not available as initializer", "-[PXViewLayoutHelper init]");

  abort();
}

+ (void)performLayoutWithinView:(id)a3 usingBlock:(id)a4
{
  id v8 = a3;
  double v5 = (void (**)(id, void *))a4;
  if (performLayoutWithinView_usingBlock__reentryCount)
  {
    id v6 = [[PXViewLayoutHelper alloc] _init];
  }
  else
  {
    if (performLayoutWithinView_usingBlock__onceToken != -1) {
      dispatch_once(&performLayoutWithinView_usingBlock__onceToken, &__block_literal_global_39_131511);
    }
    id v6 = (id)performLayoutWithinView_usingBlock__defaultHelper;
  }
  double v7 = v6;
  ++performLayoutWithinView_usingBlock__reentryCount;
  [v6 _setUpWithView:v8];
  v5[2](v5, v7);
  [v7 _tearDown];
  --performLayoutWithinView_usingBlock__reentryCount;
}

void __57__PXViewLayoutHelper_performLayoutWithinView_usingBlock___block_invoke()
{
  id v0 = [[PXViewLayoutHelper alloc] _init];
  v1 = (void *)performLayoutWithinView_usingBlock__defaultHelper;
  performLayoutWithinView_usingBlock__defaultHelper = (uint64_t)v0;
}

+ (void)setUserInterfaceLayoutDirection:(int64_t)a3
{
  _userInterfaceLayoutDirection = a3;
}

+ (int64_t)userInterfaceLayoutDirection
{
  return _userInterfaceLayoutDirection;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
    _userInterfaceLayoutDirection = [v2 userInterfaceLayoutDirection];
  }
}

@end