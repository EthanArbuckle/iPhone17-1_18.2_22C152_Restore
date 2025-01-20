@interface UIKBShapeOperator
+ (id)operatorWithScale:(double)a3;
- ($F24F406B2B787EFB06265DBA3D28CBD5)_scaleRange:(id)a3 factor:(double)a4;
- (CGPoint)offsetForCenteringShapes:(id)a3 insideRect:(CGRect)a4;
- (CGRect)_scaleRect:(CGRect)a3 factor:(CGSize)a4;
- (double)scale;
- (id)geometryByScalingShapeGeometry:(id)a3 factor:(CGSize)a4;
- (id)shapeByScalingShape:(id)a3 factor:(CGSize)a4;
- (id)shapesByCenteringShapes:(id)a3 insideRect:(CGRect)a4;
- (id)shapesByCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4;
- (id)shapesByCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4 horizontal:(BOOL)a5 vertical:(BOOL)a6;
- (id)shapesByElaboratingShapes:(id)a3 insideShape:(id)a4 count:(int64_t)a5;
- (id)shapesByHorizontallyCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4;
- (id)shapesByInsettingShapes:(id)a3 withInsets:(UIEdgeInsets)a4;
- (id)shapesByRepositioningShapes:(id)a3 withOffset:(CGPoint)a4;
- (id)shapesByResizingShapes:(id)a3 withOffset:(CGPoint)a4;
- (id)shapesByScalingShapes:(id)a3 factor:(CGSize)a4;
- (id)shapesByVerticallyCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4;
- (void)setScale:(double)a3;
@end

@implementation UIKBShapeOperator

+ (id)operatorWithScale:(double)a3
{
  v4 = objc_alloc_init(UIKBShapeOperator);
  [(UIKBShapeOperator *)v4 setScale:a3];
  return v4;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_scaleRange:(id)a3 factor:(double)a4
{
  double var1 = a3.var1;
  double var0 = a3.var0;
  [(UIKBShapeOperator *)self scale];
  double v9 = a4;
  if (var0 != 1.0)
  {
    double v10 = var0 * a4;
    if (v8 == 1.0) {
      double v9 = round(v10);
    }
    else {
      double v9 = round(v10 * v8) / v8;
    }
  }
  [(UIKBShapeOperator *)self scale];
  double v12 = a4;
  double v13 = a4;
  if (var1 != 1.0)
  {
    double v12 = var1 * a4;
    if (v11 == 1.0) {
      double v13 = round(v12);
    }
    else {
      double v13 = round(v12 * v11) / v11;
    }
  }
  double v14 = var0 * a4 - v9 + v12 - v13;
  [(UIKBShapeOperator *)self scale];
  double v16 = 1.0;
  if (v14 != 1.0)
  {
    if (v15 == 1.0) {
      double v16 = round(v14);
    }
    else {
      double v16 = round(v15 * v14) / v15;
    }
  }
  double v17 = v13 + v16;
  double v18 = v9;
  result.double var1 = v17;
  result.double var0 = v18;
  return result;
}

- (CGRect)_scaleRect:(CGRect)a3 factor:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  double v6 = a3.size.height;
  double v7 = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (!CGRectIsNull(a3))
  {
    v19.origin.double x = x;
    v19.origin.double y = y;
    v19.size.double width = v7;
    v19.size.double height = v6;
    if (!CGRectEqualToRect(v19, *MEMORY[0x1E4F1DB28]))
    {
      -[UIKBShapeOperator _scaleRange:factor:](self, "_scaleRange:factor:", x, v7, width);
      double x = v11;
      double v7 = v12;
      -[UIKBShapeOperator _scaleRange:factor:](self, "_scaleRange:factor:", y, v6, height);
      double y = v13;
      double v6 = v14;
    }
  }
  double v15 = x;
  double v16 = y;
  double v17 = v7;
  double v18 = v6;
  result.size.double height = v18;
  result.size.double width = v17;
  result.origin.double y = v16;
  result.origin.double x = v15;
  return result;
}

- (id)shapeByScalingShape:(id)a3 factor:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  double v8 = v7;
  if (!v7 || (width == *MEMORY[0x1E4F1DB30] ? (BOOL v9 = height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v9 = 0), v9))
  {
LABEL_9:
    double v12 = v8;
    goto LABEL_10;
  }
  if ([v7 scaled])
  {
    double v10 = [v8 originalShape];

    if (v10)
    {
      double v11 = [v8 originalShape];
      -[UIKBShapeOperator shapeByScalingShape:factor:](self, "shapeByScalingShape:factor:", v11, width, height);
      double v12 = (UIKBShape *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    }
    goto LABEL_9;
  }
  [v8 frame];
  -[UIKBShapeOperator _scaleRect:factor:](self, "_scaleRect:factor:");
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  [v8 paddedFrame];
  -[UIKBShapeOperator _scaleRect:factor:](self, "_scaleRect:factor:");
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  v30 = [UIKBShape alloc];
  v31 = [v8 geometry];
  double v12 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v30, "initWithGeometry:frame:paddedFrame:", v31, v15, v17, v19, v21, v23, v25, v27, v29);

  [(UIKBShape *)v12 setScaled:1];
  [(UIKBShape *)v12 setOriginalShape:v8];
LABEL_10:

  return v12;
}

- (id)geometryByScalingShapeGeometry:(id)a3 factor:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  id v7 = a3;
  uint64_t v8 = [v7 geometry];
  BOOL v9 = (void *)v8;
  if (v7 && v8 && ![v7 scaled])
  {
    double v11 = (void *)[v9 copy];
    [v11 x];
    if (v12 == 3)
    {
      double v13 = COERCE_DOUBLE([v11 x]);
      [(UIKBShapeOperator *)self scale];
      double v15 = width;
      if (v13 != 1.0)
      {
        double v16 = width * v13;
        if (v14 == 1.0) {
          double v15 = round(v16);
        }
        else {
          double v15 = round(v14 * v16) / v14;
        }
      }
      objc_msgSend(v11, "setX:", *(void *)&v15, 3);
    }
    [v11 y];
    if (v17 == 3)
    {
      double v18 = COERCE_DOUBLE([v11 y]);
      [(UIKBShapeOperator *)self scale];
      double v20 = height;
      if (v18 != 1.0)
      {
        double v21 = height * v18;
        if (v19 == 1.0) {
          double v20 = round(v21);
        }
        else {
          double v20 = round(v19 * v21) / v19;
        }
      }
      objc_msgSend(v11, "setY:", *(void *)&v20, 3);
    }
    [v11 w];
    if (v22 == 3)
    {
      double v23 = COERCE_DOUBLE([v11 w]);
      [(UIKBShapeOperator *)self scale];
      if (v23 != 1.0)
      {
        double v25 = width * v23;
        if (v24 == 1.0) {
          double width = round(v25);
        }
        else {
          double width = round(v24 * v25) / v24;
        }
      }
      objc_msgSend(v11, "setW:", *(void *)&width, 3);
    }
    [v11 h];
    if (v26 == 3)
    {
      double v27 = COERCE_DOUBLE([v11 h]);
      [(UIKBShapeOperator *)self scale];
      if (v27 != 1.0)
      {
        double v29 = height * v27;
        if (v28 == 1.0) {
          double height = round(v29);
        }
        else {
          double height = round(v28 * v29) / v28;
        }
      }
      objc_msgSend(v11, "setH:", *(void *)&height, 3);
    }
    v30 = [UIKBShape alloc];
    double v10 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v30, "initWithGeometry:frame:paddedFrame:", v11, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIKBShape *)v10 setScaled:1];
    [(UIKBShape *)v10 setOriginalShape:v7];
  }
  else
  {
    double v10 = (UIKBShape *)v7;
  }

  return v10;
}

- (id)shapesByScalingShapes:(id)a3 factor:(CGSize)a4
{
  double height = a4.height;
  double width = a4.width;
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (!v7 || (width == *MEMORY[0x1E4F1DB30] ? (BOOL v9 = height == *(double *)(MEMORY[0x1E4F1DB30] + 8)) : (BOOL v9 = 0), v9))
  {
    id v10 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    long long v78 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    long long v81 = 0u;
    v68 = v8;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v78 objects:v82 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      double v14 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      uint64_t v15 = *(void *)v79;
      double v16 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
      v69.size.double width = v14;
      v69.size.double height = v16;
      double v17 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      v69.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DB20];
      v69.origin.double y = v17;
      double v18 = *MEMORY[0x1E4F1DB20];
      double v70 = width;
      double v71 = height;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v79 != v15) {
            objc_enumerationMutation(v11);
          }
          double v20 = *(void **)(*((void *)&v78 + 1) + 8 * i);
          if (objc_msgSend(v20, "shouldUseGeometry", v68))
          {
            -[UIKBShapeOperator geometryByScalingShapeGeometry:factor:](self, "geometryByScalingShapeGeometry:factor:", v20, width, height);
            double v21 = (UIKBShape *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            [v20 frame];
            -[UIKBShapeOperator _scaleRect:factor:](self, "_scaleRect:factor:");
            double v23 = v22;
            CGFloat v73 = v24;
            double v77 = v25;
            CGFloat v27 = v26;
            v85.origin.double x = v18;
            v85.origin.double y = v17;
            v85.size.double width = v14;
            v85.size.double height = v16;
            if (CGRectIsNull(v85))
            {
              [v20 frame];
              v69.origin.double x = v28;
              v69.origin.double y = v29;
              v69.size.double width = v30;
              v69.size.double height = v31;
              double v32 = v27;
              double v75 = v77;
              double v33 = v73;
              double v17 = v73;
              double v72 = v23;
              double v34 = v27;
            }
            else
            {
              v86.origin.double x = v23;
              v86.origin.double y = v73;
              v86.size.double width = v77;
              v86.size.double height = v27;
              double MidX = CGRectGetMidX(v86);
              double v75 = v14;
              BOOL v36 = v14 + v18 < MidX || v18 > MidX;
              v87.origin.double x = v23;
              v87.origin.double y = v73;
              v87.size.double width = v77;
              v87.size.double height = v27;
              CGFloat MidY = CGRectGetMidY(v87);
              BOOL v38 = v17 <= MidY;
              if (v16 + v17 < MidY) {
                BOOL v38 = 0;
              }
              double v32 = v16;
              double v72 = v18;
              if (v36 || v38)
              {
                if (!v38 || !v36)
                {
                  double v34 = v27;
                  double v33 = v73;
                }
                else
                {
                  v93.origin.double x = v18;
                  v93.origin.double y = v17;
                  v93.size.double width = v14;
                  v93.size.double height = v16;
                  double MaxX = CGRectGetMaxX(v93);
                  [v20 frame];
                  double MinX = CGRectGetMinX(v94);
                  double v23 = MaxX + v70 * (MinX - CGRectGetMaxX(v69));
                  v95.origin.double x = v23;
                  double v33 = v73;
                  v95.origin.double y = v73;
                  v95.size.double width = v77;
                  v95.size.double height = v27;
                  double v48 = CGRectGetMaxX(v95);
                  v96.origin.double x = v18;
                  v96.origin.double y = v17;
                  v96.size.double width = v75;
                  v96.size.double height = v16;
                  double v75 = v48 - CGRectGetMinX(v96);
                  [v20 frame];
                  double v49 = CGRectGetMaxX(v97);
                  double v34 = v27;
                  v69.size.double width = v49 - CGRectGetMinX(v69);
                  double v32 = v16;
                }
              }
              else
              {
                v88.origin.double x = v18;
                v88.origin.double y = v17;
                v88.size.double width = v14;
                v88.size.double height = v16;
                double MaxY = CGRectGetMaxY(v88);
                [v20 frame];
                double MinY = CGRectGetMinY(v89);
                double v33 = MaxY + v71 * (MinY - CGRectGetMaxY(v69));
                v90.origin.double x = v23;
                v90.origin.double y = v33;
                v90.size.double width = v77;
                CGFloat v41 = v18;
                double v34 = v27;
                v90.size.double height = v27;
                double v42 = CGRectGetMaxY(v90);
                v91.origin.double x = v41;
                v91.origin.double y = v17;
                v91.size.double width = v75;
                v91.size.double height = v16;
                double v43 = v42 - CGRectGetMinY(v91);
                [v20 frame];
                double v44 = CGRectGetMaxY(v92);
                v69.size.double height = v44 - CGRectGetMinY(v69);
                double v32 = v43;
              }
            }
            double v74 = v17;
            double rect = v32;
            v50 = [v20 geometry];

            if (v50)
            {
              v51 = [v20 geometry];
              double v52 = v77;
              objc_msgSend(v51, "paddedFrameWithResolvedFrame:", v23, v33, v77, v34);
              double v54 = v53;
              double v56 = v55;
              double v58 = v57;
              double v60 = v59;
            }
            else
            {
              [v20 paddedFrame];
              -[UIKBShapeOperator _scaleRect:factor:](self, "_scaleRect:factor:");
              double v54 = v61;
              double v56 = v62;
              double v58 = v63;
              double v60 = v64;
              double v52 = v77;
            }
            v65 = [UIKBShape alloc];
            v66 = [v20 geometry];
            double v21 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v65, "initWithGeometry:frame:paddedFrame:", v66, v23, v33, v52, v34, v54, v56, v58, v60);

            [(UIKBShape *)v21 setOriginalShape:v20];
            double width = v70;
            double height = v71;
            double v18 = v72;
            double v17 = v74;
            double v14 = v75;
            double v16 = rect;
          }
          [v10 addObject:v21];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v78 objects:v82 count:16];
      }
      while (v13);
    }

    uint64_t v8 = v68;
  }

  return v10;
}

- (id)shapesByElaboratingShapes:(id)a3 insideShape:(id)a4 count:(int64_t)a5
{
  uint64_t v107 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v81 = a4;
  if (v7)
  {
    uint64_t v8 = [v7 count];
    id v79 = 0;
    if (a5 >= 1 && v81 && v8)
    {
      int64_t v78 = a5;
      uint64_t v9 = [v7 count];
      long long v96 = 0u;
      long long v97 = 0u;
      long long v98 = 0u;
      long long v99 = 0u;
      id v77 = v7;
      id v10 = v7;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v96 objects:v106 count:16];
      double v12 = *MEMORY[0x1E4F1DB30];
      int64_t v13 = a5 - v9;
      uint64_t v14 = 0;
      id v15 = 0;
      if (v11)
      {
        uint64_t v16 = *(void *)v97;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v97 != v16) {
              objc_enumerationMutation(v10);
            }
            double v18 = *(void **)(*((void *)&v96 + 1) + 8 * i);
            if (v15
              || ([*(id *)(*((void *)&v96 + 1) + 8 * i) geometry],
                  double v19 = objc_claimAutoreleasedReturnValue(),
                  int v20 = [v19 isTemplate],
                  v19,
                  !v20))
            {
              double v24 = [v18 geometry];
              [v24 w];
              BOOL v26 = v25 == 100;

              if (v26)
              {
                ++v14;
              }
              else
              {
                CGFloat v27 = [v18 geometry];
                [v81 frame];
                objc_msgSend(v27, "frameWithContainingFrame:");
                double v29 = v28;

                double v12 = v12 + v29;
              }
            }
            else
            {
              id v15 = v18;
              double v21 = [v15 geometry];
              [v81 frame];
              objc_msgSend(v21, "frameWithContainingFrame:");
              double v23 = v22;

              double v12 = v12 + v23 * (double)++v13;
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v96 objects:v106 count:16];
        }
        while (v11);
      }

      [v15 frame];
      if (v14) {
        uint64_t v30 = v14;
      }
      else {
        uint64_t v30 = 2;
      }
      if (v15) {
        BOOL v31 = v14 == 0;
      }
      else {
        BOOL v31 = 0;
      }
      [v81 frame];
      double v33 = v32;
      [(UIKBShapeOperator *)self scale];
      double v35 = (v33 - v12) / (double)v30;
      double v36 = 1.0;
      if (v35 != 1.0)
      {
        if (v34 == 1.0) {
          double v36 = round(v35);
        }
        else {
          double v36 = round(v34 * v35) / v34;
        }
      }
      id v79 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v78];
      [v81 frame];
      uint64_t v38 = 0;
      unint64_t v39 = 0;
      double v40 = -0.0;
      if (v31) {
        double v40 = v36;
      }
      double v41 = v40 + v37;
      double v42 = 0.0;
      int64_t v43 = v78;
      while (v39 < [v10 count])
      {
        id v44 = [v10 objectAtIndex:v39];
        *(void *)buf = 0;
        v101 = (double *)buf;
        uint64_t v102 = 0x4010000000;
        v103 = &unk_186D7DBA7;
        long long v104 = 0u;
        long long v105 = 0u;
        [v44 frame];
        *(void *)&long long v104 = v45;
        *((void *)&v104 + 1) = v46;
        *(void *)&long long v105 = v47;
        *((void *)&v105 + 1) = v48;
        double v49 = [v44 geometry];

        if (v49)
        {
          v92[0] = MEMORY[0x1E4F143A8];
          v92[1] = 3221225472;
          v92[2] = __65__UIKBShapeOperator_shapesByElaboratingShapes_insideShape_count___block_invoke;
          v92[3] = &unk_1E52E1B98;
          CGRect v95 = buf;
          id v93 = v44;
          id v94 = v81;
          [(UIKBShapeOperator *)self scale];
          +[UIKBGeometry performOperations:withScale:](UIKBGeometry, "performOperations:withScale:", v92);
        }
        v50 = [v44 geometry];
        [v50 w];
        BOOL v52 = v51 == 100;

        if (v52) {
          v101[6] = v36;
        }
        double v53 = [v44 geometry];
        [v53 x];
        BOOL v55 = v54 == 100;

        double v56 = v101;
        if (v55)
        {
          double v57 = v41 + v42;
          v101[4] = v41 + v42;
        }
        else
        {
          double v57 = v101[4];
        }
        uint64_t v58 = *((void *)v56 + 5);
        uint64_t v59 = *((void *)v56 + 6);
        uint64_t v60 = *((void *)v56 + 7);
        double MaxX = CGRectGetMaxX(*(CGRect *)&v57);
        uint64_t v86 = 0;
        CGRect v87 = (double *)&v86;
        uint64_t v88 = 0x4010000000;
        CGRect v89 = &unk_186D7DBA7;
        long long v90 = 0u;
        long long v91 = 0u;
        [v44 paddedFrame];
        *(void *)&long long v90 = v62;
        *((void *)&v90 + 1) = v63;
        *(void *)&long long v91 = v64;
        *((void *)&v91 + 1) = v65;
        v66 = [v44 geometry];

        if (v66)
        {
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __65__UIKBShapeOperator_shapesByElaboratingShapes_insideShape_count___block_invoke_2;
          v82[3] = &unk_1E52EB218;
          v84 = &v86;
          id v83 = v44;
          CGRect v85 = buf;
          [(UIKBShapeOperator *)self scale];
          +[UIKBGeometry performOperations:withScale:](UIKBGeometry, "performOperations:withScale:", v82);
        }
        v67 = [UIKBShape alloc];
        v68 = [v44 geometry];
        CGRect v69 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v67, "initWithGeometry:frame:paddedFrame:", v68, v101[4], v101[5], v101[6], v101[7], v87[4], v87[5], v87[6], v87[7]);
        [v79 addObject:v69];

        uint64_t v70 = v38 + 1;
        if (v44 == v15) {
          ++v38;
        }
        uint64_t v71 = v70 == v13 || v44 != v15;
        _Block_object_dispose(&v86, 8);
        _Block_object_dispose(buf, 8);

        double v42 = MaxX - v41;
        v39 += v71;
        if (!--v43) {
          goto LABEL_51;
        }
      }
      int has_internal_diagnostics = os_variant_has_internal_diagnostics();
      unint64_t v73 = [v10 count];
      if (has_internal_diagnostics)
      {
        if (v39 >= v73)
        {
          double v75 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v75, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 67109634;
            *(_DWORD *)&buf[4] = v78;
            LOWORD(v101) = 1024;
            *(_DWORD *)((char *)&v101 + 2) = v13;
            HIWORD(v101) = 2112;
            uint64_t v102 = (uint64_t)v10;
            _os_log_fault_impl(&dword_1853B0000, v75, OS_LOG_TYPE_FAULT, "keyboard requested %d shapes (%d templates) from %@", buf, 0x18u);
          }
        }
      }
      else if (v39 >= v73)
      {
        v76 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &shapesByElaboratingShapes_insideShape_count____s_category)+ 8);
        if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)&buf[4] = v78;
          LOWORD(v101) = 1024;
          *(_DWORD *)((char *)&v101 + 2) = v13;
          HIWORD(v101) = 2112;
          uint64_t v102 = (uint64_t)v10;
          _os_log_impl(&dword_1853B0000, v76, OS_LOG_TYPE_ERROR, "keyboard requested %d shapes (%d templates) from %@", buf, 0x18u);
        }
      }
LABEL_51:

      id v7 = v77;
    }
  }
  else
  {
    id v79 = 0;
  }

  return v79;
}

void __65__UIKBShapeOperator_shapesByElaboratingShapes_insideShape_count___block_invoke(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) geometry];
  [*(id *)(a1 + 40) frame];
  objc_msgSend(v7, "frameWithContainingFrame:");
  v2 = *(void **)(*(void *)(a1 + 48) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
}

void __65__UIKBShapeOperator_shapesByElaboratingShapes_insideShape_count___block_invoke_2(uint64_t a1)
{
  id v7 = [*(id *)(a1 + 32) geometry];
  objc_msgSend(v7, "paddedFrameWithResolvedFrame:", *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 48) + 8) + 56));
  v2 = *(void **)(*(void *)(a1 + 40) + 8);
  v2[4] = v3;
  v2[5] = v4;
  v2[6] = v5;
  v2[7] = v6;
}

- (id)shapesByCenteringShapes:(id)a3 insideRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v57.origin.double x = x;
  v57.origin.CGFloat y = y;
  v57.size.double width = width;
  v57.size.CGFloat height = height;
  if (CGRectIsNull(v57) || ![v8 count])
  {
    id v16 = v8;
  }
  else
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v50;
      double v13 = 0.0;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v50 != v12) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v49 + 1) + 8 * i) frame];
          double v13 = v13 + v15;
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v49 objects:v54 count:16];
      }
      while (v11);
    }
    else
    {
      double v13 = 0.0;
    }

    id v16 = [MEMORY[0x1E4F1CA48] array];
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    id v17 = v9;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v45 objects:v53 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      double v43 = x + floor((width - v13) * 0.5);
      uint64_t v20 = *(void *)v46;
      double v21 = 0.0;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v46 != v20) {
            objc_enumerationMutation(v17);
          }
          double v23 = *(void **)(*((void *)&v45 + 1) + 8 * j);
          objc_msgSend(v23, "paddedFrame", *(void *)&v43);
          double v25 = v24;
          [v23 frame];
          double v27 = v25 - v26;
          [v23 frame];
          double v29 = v28;
          double v31 = v30;
          double v44 = v32;
          [v23 paddedFrame];
          double v34 = v33;
          double v36 = v35;
          double v38 = v37;
          unint64_t v39 = [UIKBShape alloc];
          double v40 = [v23 geometry];
          double v41 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v39, "initWithGeometry:frame:paddedFrame:", v40, v43 + v21, v29, v31, v44, v43 + v21 + v27, v34, v36, v38);
          [v16 addObject:v41];

          double v21 = v21 + v31;
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v45 objects:v53 count:16];
      }
      while (v19);
    }
  }
  return v16;
}

- (CGPoint)offsetForCenteringShapes:(id)a3 insideRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  double width = a4.size.width;
  CGFloat y = a4.origin.y;
  double x = a4.origin.x;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v30.origin.double x = x;
  v30.origin.CGFloat y = y;
  v30.size.double width = width;
  v30.size.CGFloat height = height;
  if (CGRectIsNull(v30) || ![v8 count])
  {
    double v19 = *MEMORY[0x1E4F1DAD8];
    double v20 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  else
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      double v13 = 1.79769313e308;
      double MaxX = 2.22507386e-308;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          id v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          objc_msgSend(v16, "frame", (void)v23);
          if (v17 < v13)
          {
            [v16 frame];
            double v13 = v18;
          }
          [v16 frame];
          if (MaxX < CGRectGetMaxX(v31))
          {
            [v16 frame];
            double MaxX = CGRectGetMaxX(v32);
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v11);
    }
    else
    {
      double v13 = 1.79769313e308;
      double MaxX = 2.22507386e-308;
    }

    double v19 = x + floor(width - (MaxX - v13)) * 0.5 - v13;
    double v20 = 0.0;
  }

  double v21 = v19;
  double v22 = v20;
  result.CGFloat y = v22;
  result.double x = v21;
  return result;
}

- (id)shapesByCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4
{
  return -[UIKBShapeOperator shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:](self, "shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:", a3, 1, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)shapesByHorizontallyCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4
{
  return -[UIKBShapeOperator shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:](self, "shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:", a3, 1, 0, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)shapesByVerticallyCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4
{
  return -[UIKBShapeOperator shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:](self, "shapesByCenteringShapesPreservingLayout:insideRect:horizontal:vertical:", a3, 0, 1, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
}

- (id)shapesByCenteringShapesPreservingLayout:(id)a3 insideRect:(CGRect)a4 horizontal:(BOOL)a5 vertical:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  v51.origin.CGFloat x = x;
  v51.origin.CGFloat y = y;
  v51.size.CGFloat width = width;
  v51.size.CGFloat height = height;
  if (CGRectIsNull(v51) || ![v13 count])
  {
    id v38 = v13;
  }
  else
  {
    CGFloat v41 = y;
    CGFloat v42 = width;
    CGFloat v43 = height;
    uint64_t v14 = [v13 objectAtIndexedSubscript:0];
    [v14 frame];
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v52.origin.CGFloat x = v16;
    v52.origin.CGFloat y = v18;
    v52.size.CGFloat width = v20;
    v52.size.CGFloat height = v22;
    double MinX = CGRectGetMinX(v52);
    v53.origin.CGFloat x = v16;
    v53.origin.CGFloat y = v18;
    v53.size.CGFloat width = v20;
    v53.size.CGFloat height = v22;
    double MaxX = CGRectGetMaxX(v53);
    v54.origin.CGFloat x = v16;
    v54.origin.CGFloat y = v18;
    v54.size.CGFloat width = v20;
    v54.size.CGFloat height = v22;
    double MinY = CGRectGetMinY(v54);
    v55.origin.CGFloat x = v16;
    v55.origin.CGFloat y = v18;
    v55.size.CGFloat width = v20;
    v55.size.CGFloat height = v22;
    double MaxY = CGRectGetMaxY(v55);
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v27 = v13;
    uint64_t v28 = [v27 countByEnumeratingWithState:&v44 objects:v48 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v29; ++i)
        {
          if (*(void *)v45 != v30) {
            objc_enumerationMutation(v27);
          }
          CGRect v32 = *(void **)(*((void *)&v44 + 1) + 8 * i);
          [v32 frame];
          if (CGRectGetMinX(v56) < MinX)
          {
            [v32 frame];
            double MinX = CGRectGetMinX(v57);
          }
          [v32 frame];
          if (MaxX < CGRectGetMaxX(v58))
          {
            [v32 frame];
            double MaxX = CGRectGetMaxX(v59);
          }
          [v32 frame];
          if (CGRectGetMinY(v60) < MinY)
          {
            [v32 frame];
            double MinY = CGRectGetMinY(v61);
          }
          [v32 frame];
          if (MaxY < CGRectGetMaxY(v62))
          {
            [v32 frame];
            double MaxY = CGRectGetMaxY(v63);
          }
        }
        uint64_t v29 = [v27 countByEnumeratingWithState:&v44 objects:v48 count:16];
      }
      while (v29);
    }

    v64.origin.CGFloat x = x;
    v64.origin.CGFloat y = v41;
    v64.size.CGFloat width = v42;
    v64.size.CGFloat height = v43;
    double MidX = CGRectGetMidX(v64);
    v65.origin.CGFloat x = x;
    v65.origin.CGFloat y = v41;
    v65.size.CGFloat width = v42;
    v65.size.CGFloat height = v43;
    double MidY = CGRectGetMidY(v65);
    double v35 = MidX - (MinX + (MaxX - MinX) * 0.5);
    if (!v7) {
      double v35 = *MEMORY[0x1E4F1DAD8];
    }
    double v36 = MidY - (MinY + (MaxY - MinY) * 0.5);
    if (v6) {
      double v37 = v36;
    }
    else {
      double v37 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    }
    -[UIKBShapeOperator shapesByRepositioningShapes:withOffset:](self, "shapesByRepositioningShapes:withOffset:", v27, v35, v37);
    id v38 = (id)objc_claimAutoreleasedReturnValue();
  }
  unint64_t v39 = v38;

  return v39;
}

- (id)shapesByRepositioningShapes:(id)a3 withOffset:(CGPoint)a4
{
  CGPoint v34 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_msgSend(v11, "frame", *(void *)&v34.x, *(void *)&v34.y, (void)v35);
        double v13 = v12;
        double v15 = v14;
        CGFloat v17 = v34.x + v16;
        CGFloat v19 = v34.y + v18;
        [v11 paddedFrame];
        double v21 = v20;
        double v23 = v22;
        CGFloat v25 = v34.x + v24;
        CGFloat v27 = v34.y + v26;
        uint64_t v28 = [UIKBShape alloc];
        uint64_t v29 = [v11 geometry];
        uint64_t v30 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v28, "initWithGeometry:frame:paddedFrame:", v29, v17, v19, v13, v15, v25, v27, v21, v23);

        CGRect v31 = [v11 originalShape];
        if (v31)
        {
          CGRect v32 = [v11 originalShape];
          [(UIKBShape *)v30 setOriginalShape:v32];
        }
        else
        {
          [(UIKBShape *)v30 setOriginalShape:v11];
        }

        [v5 addObject:v30];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)shapesByResizingShapes:(id)a3 withOffset:(CGPoint)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        [v11 frame];
        double v34 = v12;
        double v14 = v13;
        CGFloat v16 = a4.x + v15;
        double v18 = fmax(a4.y + v17, 0.0);
        [v11 paddedFrame];
        double v20 = v19;
        double v22 = v21;
        CGFloat v24 = a4.x + v23;
        double v26 = fmax(a4.y + v25, 0.0);
        CGFloat v27 = [UIKBShape alloc];
        uint64_t v28 = [v11 geometry];
        uint64_t v29 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v27, "initWithGeometry:frame:paddedFrame:", v28, v34, v14, v16, v18, v20, v22, v24, v26);

        uint64_t v30 = [v11 originalShape];
        if (v30)
        {
          CGRect v31 = [v11 originalShape];
          [(UIKBShape *)v29 setOriginalShape:v31];
        }
        else
        {
          [(UIKBShape *)v29 setOriginalShape:v11];
        }

        [v5 addObject:v29];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)shapesByInsettingShapes:(id)a3 withInsets:(UIEdgeInsets)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        objc_msgSend(v11, "paddedFrame", (void)v18);
        double v12 = [UIKBShape alloc];
        double v13 = [v11 geometry];
        [v11 frame];
        double v14 = -[UIKBShape initWithGeometry:frame:paddedFrame:](v12, "initWithGeometry:frame:paddedFrame:", v13);

        double v15 = [v11 originalShape];
        if (v15)
        {
          CGFloat v16 = [v11 originalShape];
          [(UIKBShape *)v14 setOriginalShape:v16];
        }
        else
        {
          [(UIKBShape *)v14 setOriginalShape:v11];
        }

        [v5 addObject:v14];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  return v5;
}

- (double)scale
{
  return self->_scale;
}

- (void)setScale:(double)a3
{
  self->_scale = a3;
}

@end