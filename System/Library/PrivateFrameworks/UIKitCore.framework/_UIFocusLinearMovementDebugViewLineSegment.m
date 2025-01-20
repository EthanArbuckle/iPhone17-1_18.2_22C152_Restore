@interface _UIFocusLinearMovementDebugViewLineSegment
- (CGRect)endRect;
- (CGRect)startRect;
- (_UIFocusLinearMovementDebugViewLineSegment)initWithStartRect:(CGRect)a3 endRect:(CGRect)a4 previousSegment:(id)a5;
- (id)_calculateArrowHeadPath;
- (id)_calculateStemPathFrom:(CGRect)a3 to:(CGRect)a4 startPoint:(CGPoint *)a5 endPoint:(CGPoint *)a6;
- (id)_flattenedBezierPathFromBezierPath:(id)a3;
- (id)_pathElementsFromPath:(id)a3;
- (int64_t)type;
- (void)_calculatePaths;
- (void)_subdivideBezier:(id)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7;
- (void)drawInRect:(CGRect)a3;
@end

@implementation _UIFocusLinearMovementDebugViewLineSegment

- (_UIFocusLinearMovementDebugViewLineSegment)initWithStartRect:(CGRect)a3 endRect:(CGRect)a4 previousSegment:(id)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v10 = a3.size.height;
  CGFloat v11 = a3.size.width;
  CGFloat v12 = a3.origin.y;
  CGFloat v13 = a3.origin.x;
  id v15 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_UIFocusLinearMovementDebugViewLineSegment;
  v16 = [(_UIFocusLinearMovementDebugViewLineSegment *)&v19 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_previousSegment, a5);
    v17->_startRect.origin.CGFloat x = v13;
    v17->_startRect.origin.CGFloat y = v12;
    v17->_startRect.size.CGFloat width = v11;
    v17->_startRect.size.CGFloat height = v10;
    v17->_endRect.origin.CGFloat x = x;
    v17->_endRect.origin.CGFloat y = y;
    v17->_endRect.size.CGFloat width = width;
    v17->_endRect.size.CGFloat height = height;
  }

  return v17;
}

- (int64_t)type
{
  [(_UIFocusLinearMovementDebugViewLineSegment *)self startRect];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  [(_UIFocusLinearMovementDebugViewLineSegment *)self endRect];
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat rect = v4;
  v27.origin.CGFloat x = v4;
  v27.origin.CGFloat y = v6;
  v27.size.CGFloat width = v8;
  v27.size.CGFloat height = v10;
  double MidY = CGRectGetMidY(v27);
  v28.origin.CGFloat x = v12;
  v28.origin.CGFloat y = v14;
  v28.size.CGFloat width = v16;
  v28.size.CGFloat height = v18;
  if (MidY > CGRectGetMinY(v28))
  {
    v29.origin.CGFloat x = rect;
    v29.origin.CGFloat y = v6;
    v29.size.CGFloat width = v8;
    v29.size.CGFloat height = v10;
    double v20 = CGRectGetMidY(v29);
    v30.origin.CGFloat x = v12;
    v30.origin.CGFloat y = v14;
    v30.size.CGFloat width = v16;
    v30.size.CGFloat height = v18;
    if (v20 < CGRectGetMaxY(v30)) {
      return 0;
    }
  }
  v31.origin.CGFloat x = v12;
  v31.origin.CGFloat y = v14;
  v31.size.CGFloat width = v16;
  v31.size.CGFloat height = v18;
  double v21 = CGRectGetMidY(v31);
  v32.origin.CGFloat x = rect;
  v32.origin.CGFloat y = v6;
  v32.size.CGFloat width = v8;
  v32.size.CGFloat height = v10;
  if (v21 > CGRectGetMinY(v32))
  {
    v33.origin.CGFloat x = v12;
    v33.origin.CGFloat y = v14;
    v33.size.CGFloat width = v16;
    v33.size.CGFloat height = v18;
    double v22 = CGRectGetMidY(v33);
    v34.origin.CGFloat x = rect;
    v34.origin.CGFloat y = v6;
    v34.size.CGFloat width = v8;
    v34.size.CGFloat height = v10;
    if (v22 < CGRectGetMaxY(v34)) {
      return 0;
    }
  }
  v35.origin.CGFloat x = rect;
  v35.origin.CGFloat y = v6;
  v35.size.CGFloat width = v8;
  v35.size.CGFloat height = v10;
  double MinY = CGRectGetMinY(v35);
  v36.origin.CGFloat x = v12;
  v36.origin.CGFloat y = v14;
  v36.size.CGFloat width = v16;
  v36.size.CGFloat height = v18;
  if (MinY >= CGRectGetMinY(v36)) {
    return 1;
  }
  v37.origin.CGFloat x = rect;
  v37.origin.CGFloat y = v6;
  v37.size.CGFloat width = v8;
  v37.size.CGFloat height = v10;
  double MinX = CGRectGetMinX(v37);
  v38.origin.CGFloat x = v12;
  v38.origin.CGFloat y = v14;
  v38.size.CGFloat width = v16;
  v38.size.CGFloat height = v18;
  if (MinX <= CGRectGetMinX(v38)) {
    return 1;
  }
  else {
    return 2;
  }
}

- (void)drawInRect:(CGRect)a3
{
  if (!self->_arrowHeadPath || (stemPath = self->_stemPath) == 0)
  {
    [(_UIFocusLinearMovementDebugViewLineSegment *)self _calculatePaths];
    stemPath = self->_stemPath;
  }
  [(UIBezierPath *)stemPath stroke];
  arrowHeadPath = self->_arrowHeadPath;
  [(UIBezierPath *)arrowHeadPath fill];
}

- (id)_calculateStemPathFrom:(CGRect)a3 to:(CGRect)a4 startPoint:(CGPoint *)a5 endPoint:(CGPoint *)a6
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v11 = a3.size.height;
  CGFloat v12 = a3.size.width;
  CGFloat v13 = a3.origin.y;
  CGFloat v14 = a3.origin.x;
  int64_t v15 = [(_UIFocusLinearMovementDebugViewLineSegment *)self->_previousSegment type];
  v90.origin.CGFloat x = v14;
  v90.origin.CGFloat y = v13;
  v90.size.CGFloat width = v12;
  v90.size.CGFloat height = v11;
  double MidY = CGRectGetMidY(v90);
  v91.origin.CGFloat x = x;
  v91.origin.CGFloat y = y;
  v91.size.CGFloat width = width;
  v91.size.CGFloat height = height;
  if (MidY <= CGRectGetMinY(v91)) {
    goto LABEL_49;
  }
  v92.origin.CGFloat x = v14;
  v92.origin.CGFloat y = v13;
  v92.size.CGFloat width = v12;
  v92.size.CGFloat height = v11;
  double v17 = CGRectGetMidY(v92);
  v93.origin.CGFloat x = x;
  v93.origin.CGFloat y = y;
  v93.size.CGFloat width = width;
  v93.size.CGFloat height = height;
  if (v17 >= CGRectGetMaxY(v93))
  {
LABEL_49:
    v94.origin.CGFloat x = x;
    v94.origin.CGFloat y = y;
    v94.size.CGFloat width = width;
    v94.size.CGFloat height = height;
    double v18 = CGRectGetMidY(v94);
    v95.origin.CGFloat x = v14;
    v95.origin.CGFloat y = v13;
    v95.size.CGFloat width = v12;
    v95.size.CGFloat height = v11;
    if (v18 <= CGRectGetMinY(v95)) {
      goto LABEL_7;
    }
    v96.origin.CGFloat x = x;
    v96.origin.CGFloat y = y;
    v96.size.CGFloat width = width;
    v96.size.CGFloat height = height;
    double v19 = CGRectGetMidY(v96);
    v97.origin.CGFloat x = v14;
    v97.origin.CGFloat y = v13;
    v97.size.CGFloat width = v12;
    v97.size.CGFloat height = v11;
    if (v19 >= CGRectGetMaxY(v97))
    {
LABEL_7:
      v104.origin.CGFloat x = v14;
      v104.origin.CGFloat y = v13;
      v104.size.CGFloat width = v12;
      v104.size.CGFloat height = v11;
      double MinY = CGRectGetMinY(v104);
      v105.origin.CGFloat x = x;
      v105.origin.CGFloat y = y;
      v105.size.CGFloat width = width;
      v105.size.CGFloat height = height;
      double v84 = CGRectGetMinY(v105);
      CGFloat v82 = v14;
      CGFloat v83 = v13;
      v106.origin.CGFloat x = v14;
      v106.origin.CGFloat y = v13;
      CGFloat v87 = v12;
      v106.size.CGFloat width = v12;
      v106.size.CGFloat height = v11;
      double MidX = CGRectGetMidX(v106);
      v107.origin.CGFloat x = x;
      CGFloat v32 = y;
      v107.origin.CGFloat y = y;
      CGFloat v33 = width;
      v107.size.CGFloat width = width;
      v107.size.CGFloat height = height;
      double MinX = CGRectGetMinX(v107);
      if (MinY >= v84)
      {
        if (MidX <= MinX) {
          goto LABEL_50;
        }
        v117.origin.CGFloat x = v82;
        v117.origin.CGFloat y = v13;
        v117.size.CGFloat width = v87;
        v117.size.CGFloat height = v11;
        double v46 = CGRectGetMidX(v117);
        v118.origin.CGFloat x = x;
        v118.origin.CGFloat y = y;
        v118.size.CGFloat width = width;
        v118.size.CGFloat height = height;
        if (v46 >= CGRectGetMaxX(v118))
        {
LABEL_50:
          v119.origin.CGFloat x = x;
          v119.origin.CGFloat y = y;
          v119.size.CGFloat width = width;
          v119.size.CGFloat height = height;
          double v47 = CGRectGetMidX(v119);
          v120.origin.CGFloat x = v82;
          v120.origin.CGFloat y = v83;
          v120.size.CGFloat width = v87;
          v120.size.CGFloat height = v11;
          if (v47 <= CGRectGetMinX(v120)) {
            goto LABEL_25;
          }
          v121.origin.CGFloat x = x;
          v121.origin.CGFloat y = y;
          v121.size.CGFloat width = width;
          v121.size.CGFloat height = height;
          double v48 = CGRectGetMidX(v121);
          v122.origin.CGFloat x = v82;
          v122.origin.CGFloat y = v83;
          v122.size.CGFloat width = v87;
          v122.size.CGFloat height = v11;
          if (v48 >= CGRectGetMaxX(v122))
          {
LABEL_25:
            v131.origin.CGFloat x = v82;
            v131.origin.CGFloat y = v83;
            v131.size.CGFloat width = v87;
            v131.size.CGFloat height = v11;
            double v65 = CGRectGetMinX(v131);
            v132.origin.CGFloat x = x;
            v132.origin.CGFloat y = y;
            v132.size.CGFloat width = width;
            v132.size.CGFloat height = height;
            if (v65 < CGRectGetMinX(v132))
            {
              v133.origin.CGFloat x = v82;
              v133.origin.CGFloat y = v83;
              v133.size.CGFloat width = v87;
              v133.size.CGFloat height = v11;
              double MaxX = CGRectGetMaxX(v133);
              v134.origin.CGFloat x = v82;
              v134.origin.CGFloat y = v83;
              v134.size.CGFloat width = v87;
              v134.size.CGFloat height = v11;
              double MaxY = CGRectGetMidY(v134);
              v135.origin.CGFloat x = x;
              v135.origin.CGFloat y = y;
              v135.size.CGFloat width = width;
              v135.size.CGFloat height = height;
              double v29 = CGRectGetMinX(v135);
              v136.origin.CGFloat x = x;
              v136.origin.CGFloat y = y;
              v136.size.CGFloat width = width;
              v136.size.CGFloat height = height;
              double v57 = CGRectGetMidY(v136);
              double v27 = v57;
              double v25 = v29;
              double v23 = MaxY;
              double v26 = MaxX;
              goto LABEL_37;
            }
            v140.origin.CGFloat x = v82;
            v140.origin.CGFloat y = v83;
            v140.size.CGFloat width = v87;
            v140.size.CGFloat height = v11;
            CGFloat v72 = CGRectGetMinX(v140);
            v141.origin.CGFloat x = v82;
            v141.origin.CGFloat y = v83;
            v141.size.CGFloat width = v87;
            v141.size.CGFloat height = v11;
            double MaxY = CGRectGetMaxY(v141);
            v142.origin.CGFloat x = x;
            v142.origin.CGFloat y = y;
            v142.size.CGFloat width = width;
            v142.size.CGFloat height = height;
            CGFloat v73 = CGRectGetMinX(v142);
            v143.origin.CGFloat y = y;
            double v25 = v73;
            v143.origin.CGFloat x = x;
            v143.size.CGFloat width = width;
            double v26 = v72;
            v143.size.CGFloat height = height;
            double v57 = CGRectGetMidY(v143);
            double v74 = dbl_186B98F70[vabdd_f64(v57, MaxY) > 20.0];
            double v29 = v26 - v74;
            goto LABEL_35;
          }
        }
        v123.origin.CGFloat x = v82;
        v123.origin.CGFloat y = v83;
        v123.size.CGFloat width = v87;
        v123.size.CGFloat height = v11;
        double v39 = CGRectGetMinX(v123);
        CGFloat v49 = v82;
        CGFloat v50 = v83;
        CGFloat v51 = v87;
        CGFloat v52 = v11;
        if (v15 == 1) {
          double v53 = CGRectGetMaxY(*(CGRect *)&v49);
        }
        else {
          double v53 = CGRectGetMidY(*(CGRect *)&v49);
        }
        double MaxY = v53;
        v145.origin.CGFloat x = x;
        v145.origin.CGFloat y = y;
        v145.size.CGFloat width = width;
        v145.size.CGFloat height = height;
        CGFloat v79 = CGRectGetMinX(v145);
        CGFloat v76 = y;
        double v25 = v79;
        CGFloat v75 = x;
        CGFloat v77 = width;
        CGFloat v78 = height;
      }
      else
      {
        CGFloat v35 = y;
        if (MidX <= MinX) {
          goto LABEL_51;
        }
        v108.origin.CGFloat x = v82;
        v108.origin.CGFloat y = v13;
        v108.size.CGFloat width = v87;
        v108.size.CGFloat height = v11;
        double v36 = CGRectGetMidX(v108);
        v109.origin.CGFloat x = x;
        v109.origin.CGFloat y = y;
        v109.size.CGFloat width = v33;
        v109.size.CGFloat height = height;
        if (v36 >= CGRectGetMaxX(v109))
        {
LABEL_51:
          v110.origin.CGFloat x = x;
          v110.origin.CGFloat y = y;
          v110.size.CGFloat width = v33;
          v110.size.CGFloat height = height;
          double v37 = CGRectGetMidX(v110);
          v111.origin.CGFloat x = v82;
          v111.origin.CGFloat y = v83;
          v111.size.CGFloat width = v87;
          v111.size.CGFloat height = v11;
          if (v37 <= CGRectGetMinX(v111)) {
            goto LABEL_22;
          }
          v112.origin.CGFloat x = x;
          v112.origin.CGFloat y = y;
          v112.size.CGFloat width = v33;
          v112.size.CGFloat height = height;
          double v38 = CGRectGetMidX(v112);
          v113.origin.CGFloat x = v82;
          v113.origin.CGFloat y = v83;
          v113.size.CGFloat width = v87;
          v113.size.CGFloat height = v11;
          if (v38 >= CGRectGetMaxX(v113))
          {
LABEL_22:
            v128.origin.CGFloat x = v82;
            v128.origin.CGFloat y = v83;
            v128.size.CGFloat width = v87;
            v128.size.CGFloat height = v11;
            double v58 = CGRectGetMinX(v128);
            v129.origin.CGFloat x = x;
            v129.origin.CGFloat y = y;
            v129.size.CGFloat width = v33;
            v129.size.CGFloat height = height;
            double v59 = CGRectGetMinX(v129);
            v130.origin.CGFloat x = v82;
            v130.origin.CGFloat y = v83;
            v130.size.CGFloat width = v87;
            v130.size.CGFloat height = v11;
            double v86 = CGRectGetMinX(v130);
            if (v58 >= v59)
            {
              v137.origin.CGFloat x = v82;
              v137.origin.CGFloat y = v83;
              v137.size.CGFloat width = v87;
              v137.size.CGFloat height = v11;
              double v23 = CGRectGetMaxY(v137);
              v138.origin.CGFloat x = x;
              v138.origin.CGFloat y = v32;
              v138.size.CGFloat width = v33;
              v138.size.CGFloat height = height;
              CGFloat v66 = CGRectGetMinY(v138) + -10.0;
              v139.origin.CGFloat x = x;
              v139.origin.CGFloat y = v32;
              v139.size.CGFloat width = v33;
              v139.size.CGFloat height = height;
              CGFloat v67 = CGRectGetMinX(v139);
              CGFloat v68 = v32;
              double v25 = v67;
              CGFloat v69 = height;
              CGFloat v70 = v33;
              CGFloat v71 = x;
              if (v66 <= v23)
              {
                double v57 = CGRectGetMidY(*(CGRect *)&v71);
                double MaxX = v25 - dbl_186B98F70[vabdd_f64(v57, v23) > 20.0];
                double v29 = MaxX;
                double MaxY = v23;
                double v27 = v57;
                double v26 = v86;
              }
              else
              {
                double MaxY = CGRectGetMinY(*(CGRect *)&v71);
                double v26 = v86;
                double v29 = v86 + 20.0;
                double v57 = MaxY + -10.0;
                double MaxX = v25;
                double v27 = MaxY;
              }
              goto LABEL_37;
            }
            CGFloat v60 = v83;
            CGFloat v61 = v82;
            CGFloat v62 = v87;
            CGFloat v63 = v11;
            if (v15 == 1) {
              double v64 = CGRectGetMaxY(*(CGRect *)&v61);
            }
            else {
              double v64 = CGRectGetMidY(*(CGRect *)&v61);
            }
            double MaxY = v64;
            v146.origin.CGFloat x = x;
            v146.origin.CGFloat y = v35;
            v146.size.CGFloat width = v33;
            v146.size.CGFloat height = height;
            double v25 = CGRectGetMinX(v146);
            v147.origin.CGFloat x = x;
            v147.origin.CGFloat y = v35;
            v147.size.CGFloat width = v33;
            v147.size.CGFloat height = height;
            double v57 = CGRectGetMidY(v147);
            double v26 = v86;
            double MaxX = v86 - dbl_186B98F70[vabdd_f64(v57, MaxY) > 20.0];
            double v29 = MaxX;
LABEL_36:
            double v27 = v57;
            double v23 = MaxY;
            goto LABEL_37;
          }
        }
        v114.origin.CGFloat x = v82;
        v114.origin.CGFloat y = v83;
        v114.size.CGFloat width = v87;
        v114.size.CGFloat height = v11;
        double v39 = CGRectGetMinX(v114);
        CGFloat v40 = v82;
        CGFloat v41 = v83;
        CGFloat v42 = v87;
        CGFloat v43 = v11;
        if (v15 == 1)
        {
          double MaxY = CGRectGetMaxY(*(CGRect *)&v40);
          v115.origin.CGFloat x = x;
          v115.origin.CGFloat y = y;
          v115.size.CGFloat width = v33;
          v115.size.CGFloat height = height;
          double v25 = CGRectGetMinX(v115);
          v116.origin.CGFloat x = x;
          v116.origin.CGFloat y = v35;
          v116.size.CGFloat width = v33;
          v116.size.CGFloat height = height;
          double v45 = CGRectGetMinY(v116);
LABEL_34:
          double v57 = v45;
          double v74 = dbl_186B98F70[vabdd_f64(v45, MaxY) > 20.0];
          double v26 = v39;
          double v29 = v39 - v74;
LABEL_35:
          double MaxX = v25 - v74;
          goto LABEL_36;
        }
        double MaxY = CGRectGetMidY(*(CGRect *)&v40);
        v144.origin.CGFloat x = x;
        v144.origin.CGFloat y = y;
        v144.size.CGFloat width = v33;
        v144.size.CGFloat height = height;
        double v25 = CGRectGetMinX(v144);
        CGFloat v75 = x;
        CGFloat v76 = v35;
        CGFloat v77 = v33;
        CGFloat v78 = height;
      }
      double v45 = CGRectGetMidY(*(CGRect *)&v75);
      goto LABEL_34;
    }
  }
  v98.origin.CGFloat x = v14;
  v98.origin.CGFloat y = v13;
  v98.size.CGFloat width = v12;
  v98.size.CGFloat height = v11;
  double v20 = CGRectGetMinX(v98);
  v99.origin.CGFloat x = x;
  v99.origin.CGFloat y = y;
  v99.size.CGFloat width = width;
  v99.size.CGFloat height = height;
  if (v20 >= CGRectGetMinX(v99))
  {
    v124.origin.CGFloat x = v14;
    v124.origin.CGFloat y = v13;
    v124.size.CGFloat width = v12;
    v124.size.CGFloat height = v11;
    CGFloat v54 = CGRectGetMinX(v124);
    v125.origin.CGFloat y = v13;
    double v22 = v54;
    v125.origin.CGFloat x = v14;
    v125.size.CGFloat width = v12;
    v125.size.CGFloat height = v11;
    double v23 = CGRectGetMaxY(v125);
    v126.origin.CGFloat x = x;
    v126.origin.CGFloat y = y;
    v126.size.CGFloat width = width;
    v126.size.CGFloat height = height;
    CGFloat v55 = CGRectGetMaxX(v126);
    v127.origin.CGFloat y = y;
    double v25 = v55;
    v127.origin.CGFloat x = x;
    v127.size.CGFloat width = width;
    double v26 = v22;
    v127.size.CGFloat height = height;
    double v27 = CGRectGetMaxY(v127);
    double v28 = 3.0;
    double v29 = v22 + (v25 - v22) / 3.0;
    double v30 = 10.0;
  }
  else
  {
    v100.origin.CGFloat x = v14;
    v100.origin.CGFloat y = v13;
    v100.size.CGFloat width = v12;
    v100.size.CGFloat height = v11;
    CGFloat v21 = CGRectGetMaxX(v100);
    v101.origin.CGFloat y = v13;
    double v22 = v21;
    v101.origin.CGFloat x = v14;
    v101.size.CGFloat width = v12;
    v101.size.CGFloat height = v11;
    double v23 = CGRectGetMinY(v101);
    v102.origin.CGFloat x = x;
    v102.origin.CGFloat y = y;
    v102.size.CGFloat width = width;
    v102.size.CGFloat height = height;
    CGFloat v24 = CGRectGetMinX(v102);
    v103.origin.CGFloat y = y;
    double v25 = v24;
    v103.origin.CGFloat x = x;
    v103.size.CGFloat width = width;
    double v26 = v22;
    v103.size.CGFloat height = height;
    double v27 = CGRectGetMinY(v103);
    double v28 = 3.0;
    double v29 = v22 + (v25 - v22) / 3.0;
    double v30 = -10.0;
  }
  double MaxY = v23 + v30;
  double MaxX = v25 + (v22 - v25) / v28;
  double v57 = v27 + v30;
LABEL_37:
  v80 = objc_alloc_init(UIBezierPath);
  -[UIBezierPath moveToPoint:](v80, "moveToPoint:", v26, v23);
  -[UIBezierPath addCurveToPoint:controlPoint1:controlPoint2:](v80, "addCurveToPoint:controlPoint1:controlPoint2:", v25, v27, v29, MaxY, MaxX, v57);
  if (a5)
  {
    a5->CGFloat x = v26;
    a5->CGFloat y = v23;
  }
  if (a6)
  {
    a6->CGFloat x = v25;
    a6->CGFloat y = v27;
  }
  return v80;
}

- (id)_calculateArrowHeadPath
{
  v2 = objc_alloc_init(UIBezierPath);
  [(UIBezierPath *)v2 setLineCapStyle:0];
  -[UIBezierPath moveToPoint:](v2, "moveToPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
  -[UIBezierPath addLineToPoint:](v2, "addLineToPoint:", -10.0, 4.5);
  -[UIBezierPath addLineToPoint:](v2, "addLineToPoint:", -10.0, -4.5);
  [(UIBezierPath *)v2 closePath];
  return v2;
}

- (void)_calculatePaths
{
  double x = self->_startRect.origin.x;
  double y = self->_startRect.origin.y;
  double width = self->_startRect.size.width;
  double height = self->_startRect.size.height;
  double v7 = self->_endRect.origin.x;
  double v8 = self->_endRect.origin.y;
  double v9 = self->_endRect.size.width;
  double v10 = self->_endRect.size.height;
  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  if (!CGRectIsEmpty(v43))
  {
    v44.origin.double x = v7;
    v44.origin.double y = v8;
    v44.size.double width = v9;
    v44.size.double height = v10;
    if (!CGRectIsEmpty(v44))
    {
      v42[0] = 0;
      v42[1] = 0;
      long long v41 = 0uLL;
      CGFloat v11 = -[_UIFocusLinearMovementDebugViewLineSegment _calculateStemPathFrom:to:startPoint:endPoint:](self, "_calculateStemPathFrom:to:startPoint:endPoint:", v42, &v41, x, y, width, height, v7, v8, v9, v10);
      CGFloat v12 = [(_UIFocusLinearMovementDebugViewLineSegment *)self _flattenedBezierPathFromBezierPath:v11];
      [v11 removeAllPoints];
      [v11 setLineCapStyle:1];
      CGFloat v13 = [(_UIFocusLinearMovementDebugViewLineSegment *)self _pathElementsFromPath:v12];
      uint64_t v14 = [v13 count];
      uint64_t v35 = 0;
      double v36 = (double *)&v35;
      uint64_t v37 = 0x3010000000;
      uint64_t v39 = 0;
      uint64_t v40 = 0;
      double v38 = &unk_186D7DBA7;
      int64_t v15 = [v13 objectAtIndexedSubscript:v14 - 2];
      [v15 point];
      uint64_t v39 = v16;
      uint64_t v40 = v17;

      v30[0] = MEMORY[0x1E4F143A8];
      v30[1] = 3221225472;
      v30[2] = __61___UIFocusLinearMovementDebugViewLineSegment__calculatePaths__block_invoke;
      v30[3] = &unk_1E52F30C8;
      double v18 = v11;
      CGFloat v32 = &v35;
      uint64_t v33 = v14;
      long long v34 = v41;
      CGRect v31 = v18;
      [v13 enumerateObjectsUsingBlock:v30];
      double v19 = [(_UIFocusLinearMovementDebugViewLineSegment *)self _calculateArrowHeadPath];
      memset(&v29, 0, sizeof(v29));
      long long v20 = v41;
      CGAffineTransformMakeTranslation(&v29, *(CGFloat *)&v41, *((CGFloat *)&v41 + 1));
      double v21 = v36[4];
      double v22 = *(double *)&v20 - v21;
      if (*(double *)&v20 >= v21) {
        double v23 = atan((*((double *)&v20 + 1) - v36[5]) / v22);
      }
      else {
        double v23 = atan((*((double *)&v20 + 1) - v36[5]) / v22) + 3.14159265;
      }
      CGAffineTransform v27 = v29;
      CGAffineTransformRotate(&v28, &v27, v23);
      CGAffineTransform v29 = v28;
      [(UIBezierPath *)v19 applyTransform:&v28];
      [(UIBezierPath *)v18 setLineWidth:2.0];
      stemPath = self->_stemPath;
      self->_stemPath = v18;
      double v25 = v18;

      arrowHeadPath = self->_arrowHeadPath;
      self->_arrowHeadPath = v19;

      _Block_object_dispose(&v35, 8);
    }
  }
}

- (id)_pathElementsFromPath:(id)a3
{
  id v3 = a3;
  CGFloat v4 = objc_opt_new();
  id v5 = v3;
  CGFloat v6 = (const CGPath *)[v5 CGPath];

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68___UIFocusLinearMovementDebugViewLineSegment__pathElementsFromPath___block_invoke;
  block[3] = &unk_1E52F30F0;
  id v7 = v4;
  id v10 = v7;
  CGPathApplyWithBlock(v6, block);

  return v7;
}

- (id)_flattenedBezierPathFromBezierPath:(id)a3
{
  id v4 = a3;
  id v5 = objc_opt_new();
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3010000000;
  v14[3] = &unk_186D7DBA7;
  long long v15 = *MEMORY[0x1E4F1DAD8];
  CGFloat v6 = [(_UIFocusLinearMovementDebugViewLineSegment *)self _pathElementsFromPath:v4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __81___UIFocusLinearMovementDebugViewLineSegment__flattenedBezierPathFromBezierPath___block_invoke;
  v10[3] = &unk_1E52F3118;
  id v7 = v5;
  id v11 = v7;
  CGFloat v12 = self;
  CGFloat v13 = v14;
  [v6 enumerateObjectsUsingBlock:v10];

  id v8 = v7;
  _Block_object_dispose(v14, 8);

  return v8;
}

- (void)_subdivideBezier:(id)a3 startPoint:(CGPoint)a4 controlPoint1:(CGPoint)a5 controlPoint2:(CGPoint)a6 endPoint:(CGPoint)a7
{
  double y = a7.y;
  double x = a7.x;
  double v9 = a6.y;
  double v10 = a6.x;
  double v11 = a5.y;
  double v12 = a5.x;
  double v13 = a4.y;
  double v14 = a4.x;
  id v15 = a3;
  double v36 = x;
  double v37 = y;
  double v16 = v10 - v12 - (v12 - v14);
  double v17 = x - v10 - (v10 - v12);
  double v18 = v9 - v11 - (v11 - v13);
  double v19 = y - v9 - (v9 - v11);
  double v20 = v16 * v16 + v18 * v18;
  if (v20 <= v17 * v17 + v19 * v19) {
    double v20 = v17 * v17 + v19 * v19;
  }
  double v21 = v20 * 9.0 * 0.0625;
  id v38 = v15;
  if (v21 > 0.36)
  {
    double v22 = v19 - v18;
    double v23 = (v11 - v13 + v18) * 3.0 + v22;
    double v24 = (v18 + v22) * 6.0;
    double v25 = v22 * 6.0;
    double v26 = v17 - v16;
    double v27 = (v12 - v14 + v16) * 3.0 + v26;
    double v28 = (v16 + v26) * 6.0;
    double v29 = v26 * 6.0;
    uint64_t v30 = 1;
    double v31 = 0.125;
    double v32 = 0.25;
    double v33 = 0.5;
    do
    {
      uint64_t v34 = v30;
      double v29 = v29 * 0.125;
      double v28 = v28 * 0.25 - v29;
      double v27 = v27 * 0.5 - v28 * 0.5;
      double v25 = v25 * 0.125;
      double v24 = v24 * 0.25 - v25;
      double v23 = v23 * 0.5 - v24 * 0.5;
      v30 *= 2;
      double v21 = v21 * 0.0625;
    }
    while (v21 > 0.36 && v30 <= 0x10000);
    if (v30 >= 2)
    {
      unint64_t v35 = (2 * v34) | 1;
      do
      {
        double v14 = v14 + v27;
        double v27 = v28 + v27;
        double v28 = v29 + v28;
        double v13 = v23 + v13;
        double v23 = v24 + v23;
        double v24 = v25 + v24;
        objc_msgSend(v38, "addLineToPoint:", v14, v13, v31, v32, v33);
        id v15 = v38;
        --v35;
      }
      while (v35 > 2);
    }
  }
  objc_msgSend(v15, "addLineToPoint:", v36, v37);
}

- (CGRect)startRect
{
  double x = self->_startRect.origin.x;
  double y = self->_startRect.origin.y;
  double width = self->_startRect.size.width;
  double height = self->_startRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (CGRect)endRect
{
  double x = self->_endRect.origin.x;
  double y = self->_endRect.origin.y;
  double width = self->_endRect.size.width;
  double height = self->_endRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_arrowHeadPath, 0);
  objc_storeStrong((id *)&self->_stemPath, 0);
  objc_storeStrong((id *)&self->_previousSegment, 0);
}

@end