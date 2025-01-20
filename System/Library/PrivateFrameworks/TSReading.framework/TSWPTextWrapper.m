@interface TSWPTextWrapper
+ (double)unobstructedSpanForPath:(id)a3 startingSpan:(CGRect)a4 columnBounds:(CGRect)a5;
+ (unsigned)p_wrappedSubrectsForRectGPC:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] polygon:(id)a5 type:(int)a6 skipHint:(double *)a7;
+ (unsigned)p_wrappedSubrectsForRectOptimized:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] polygon:(id)a5 type:(int)a6 skipHint:(double *)a7;
+ (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] polygon:(id)a5 type:(int)a6 skipHint:(double *)a7;
@end

@implementation TSWPTextWrapper

+ (unsigned)splitLine:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] polygon:(id)a5 type:(int)a6 skipHint:(double *)a7
{
  uint64_t v8 = *(void *)&a6;
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if ([a5 intersectsSelf])
  {
    return objc_msgSend(a1, "p_wrappedSubrectsForRectGPC:lineSegmentRects:polygon:type:skipHint:", a4, a5, v8, a7, x, y, width, height);
  }
  else
  {
    return objc_msgSend(a1, "p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:", a4, a5, v8, a7, x, y, width, height);
  }
}

+ (unsigned)p_wrappedSubrectsForRectGPC:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] polygon:(id)a5 type:(int)a6 skipHint:(double *)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v15 = (int *)[a5 polygon];
  v30.origin.CGFloat x = x;
  v30.origin.CGFloat y = y;
  v30.size.CGFloat width = width;
  v30.size.CGFloat height = height;
  v16 = polygonFromRect(v30);
  if (a7) {
    *a7 = 1.0;
  }
  TSDgpc_polygon_clip(a6 != 0, (unsigned int *)v16, v15, (unsigned int *)v29);
  TSDgpc_free_polygon((uint64_t)v16);
  free(v16);
  unsigned int v17 = wrappedSubrectsFromPolygon(v29, &a4->origin.x, x, y, width, height);
  unsigned int v18 = v17;
  if (a7)
  {
    if (!v17)
    {
      [a5 bounds];
      double MaxY = CGRectGetMaxY(v31);
      v32.origin.CGFloat x = x;
      v32.origin.CGFloat y = y;
      v32.size.CGFloat width = width;
      v32.size.CGFloat height = height;
      double v20 = MaxY - CGRectGetMinY(v32);
      v33.origin.CGFloat x = x;
      v33.origin.CGFloat y = y;
      v33.size.CGFloat width = width;
      v33.size.CGFloat height = v20;
      if (CGRectGetHeight(v33) > 0.0)
      {
        TSDgpc_free_polygon((uint64_t)v29);
        v34.origin.CGFloat x = x;
        v34.origin.CGFloat y = y;
        v34.size.CGFloat width = width;
        v34.size.CGFloat height = v20;
        v21 = polygonFromRect(v34);
        TSDgpc_polygon_clip(3u, (unsigned int *)v21, v15, (unsigned int *)v29);
        TSDgpc_polygon_clip(0, (unsigned int *)v29, v15, (unsigned int *)v29);
        v35.origin.CGFloat x = x;
        v35.origin.CGFloat y = y;
        v35.size.CGFloat width = width;
        v35.size.CGFloat height = height;
        v22 = polygonFromRect(v35);
        TSDgpc_polygon_clip(0, (unsigned int *)v29, v22, (unsigned int *)v29);
        TSDgpc_free_polygon((uint64_t)v22);
        free(v22);
        if (v29[0])
        {
          id v23 = bezierFromPolygon(v29);
          if ([v23 isEmpty])
          {
            v36.origin.CGFloat x = x;
            v36.origin.CGFloat y = y;
            v36.size.CGFloat width = width;
            v36.size.CGFloat height = v20;
            double MinY = CGRectGetMaxY(v36);
          }
          else
          {
            [v23 bounds];
            double MinY = CGRectGetMinY(v39);
          }
          double v27 = MinY;
          v40.origin.CGFloat x = x;
          v40.origin.CGFloat y = y;
          v40.size.CGFloat width = width;
          v40.size.CGFloat height = height;
          double v26 = v27 - CGRectGetMaxY(v40);
          if (floor(v26) <= 0.0) {
            double v26 = 1.0;
          }
        }
        else
        {
          v37.origin.CGFloat x = x;
          v37.origin.CGFloat y = y;
          v37.size.CGFloat width = width;
          v37.size.CGFloat height = v20;
          double v25 = CGRectGetMaxY(v37);
          v38.origin.CGFloat x = x;
          v38.origin.CGFloat y = y;
          v38.size.CGFloat width = width;
          v38.size.CGFloat height = height;
          double v26 = fmax(floor(v25 - CGRectGetMaxY(v38)), 1.0);
        }
        *a7 = v26;
        TSDgpc_free_polygon((uint64_t)v21);
        free(v21);
      }
    }
  }
  TSDgpc_free_polygon((uint64_t)v29);
  return v18;
}

+ (double)unobstructedSpanForPath:(id)a3 startingSpan:(CGRect)a4 columnBounds:(CGRect)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  double y = a4.origin.y;
  CGFloat x = a4.origin.x;
  double MaxY = CGRectGetMaxY(a5);
  v33.origin.CGFloat x = x;
  v33.origin.double y = y;
  v33.size.CGFloat width = width;
  v33.size.CGFloat height = height;
  v34.size.CGFloat height = MaxY - CGRectGetMinY(v33);
  v34.origin.CGFloat x = x;
  v34.origin.double y = y;
  v34.size.CGFloat width = width;
  v11 = polygonFromRect(v34);
  v12 = polygonFromBezier(a3);
  TSDgpc_polygon_clip(1u, (unsigned int *)v11, v12, (unsigned int *)v12);
  TSDgpc_free_polygon((uint64_t)v11);
  free(v11);
  CGFloat v30 = height;
  while (1)
  {
    v35.origin.CGFloat x = x;
    v35.origin.double y = y;
    v35.size.CGFloat width = width;
    v35.size.CGFloat height = height;
    v13 = polygonFromRect(v35);
    TSDgpc_polygon_clip(1u, (unsigned int *)v13, v12, v31);
    TSDgpc_free_polygon((uint64_t)v13);
    free(v13);
    if (!v31[0]) {
      break;
    }
    double v14 = boundsForVertexList(v32);
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    double v20 = v19;
    if ((int)v31[0] >= 2)
    {
      uint64_t v21 = 16;
      uint64_t v22 = 1;
      do
      {
        v41.origin.CGFloat x = boundsForVertexList(v32 + v21);
        v41.origin.double y = v23;
        v41.size.CGFloat width = v24;
        v41.size.CGFloat height = v25;
        v36.origin.CGFloat x = v14;
        v36.origin.double y = v16;
        v36.size.CGFloat width = v18;
        v36.size.CGFloat height = v20;
        CGRect v37 = CGRectUnion(v36, v41);
        double v14 = v37.origin.x;
        CGFloat v16 = v37.origin.y;
        CGFloat v18 = v37.size.width;
        double v20 = v37.size.height;
        ++v22;
        v21 += 16;
      }
      while (v22 < (int)v31[0]);
    }
    TSDgpc_free_polygon((uint64_t)v31);
    if (v20 < 1.0) {
      goto LABEL_10;
    }
    v38.origin.CGFloat x = v14;
    v38.origin.double y = v16;
    v38.size.CGFloat width = v18;
    v38.size.CGFloat height = v20;
    double y = CGRectGetMaxY(v38) + 1.0;
    v39.origin.CGFloat x = x;
    v39.origin.double y = y;
    v39.size.CGFloat width = width;
    CGFloat height = v30;
    v39.size.CGFloat height = v30;
    double MinY = CGRectGetMinY(v39);
    if (MinY > CGRectGetMaxY(a5)) {
      goto LABEL_11;
    }
  }
  TSDgpc_free_polygon((uint64_t)v31);
LABEL_10:
  CGFloat height = v30;
LABEL_11:
  v40.origin.CGFloat x = x;
  v40.origin.double y = y;
  v40.size.CGFloat width = width;
  v40.size.CGFloat height = height;
  double v27 = CGRectGetMinY(v40);
  TSDgpc_free_polygon((uint64_t)v12);
  free(v12);
  return v27;
}

+ (unsigned)p_wrappedSubrectsForRectOptimized:(CGRect)a3 lineSegmentRects:(CGRect)a4[128] polygon:(id)a5 type:(int)a6 skipHint:(double *)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  if (a7) {
    *a7 = 1.0;
  }
  double MaxY = CGRectGetMaxY(a3);
  v100.origin.CGFloat x = x;
  v100.origin.CGFloat y = y;
  CGFloat v94 = width;
  v100.size.CGFloat width = width;
  v100.size.CGFloat height = height;
  double MinY = CGRectGetMinY(v100);
  [a5 bounds];
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v98 = v21;
  uint64_t v22 = [a5 polygon];
  if (!v22)
  {
    a4->origin.CGFloat x = x;
LABEL_15:
    LODWORD(v28) = 1;
    double v27 = v94;
    goto LABEL_16;
  }
  CGFloat v23 = (int *)v22;
  CGFloat v92 = v20;
  CGFloat v93 = x;
  if (!+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers) {
    +[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers = (uint64_t)malloc_type_calloc(0x10uLL, 0x800uLL, 0xC6A803DuLL);
  }
  v101.origin.CGFloat x = x;
  v101.origin.CGFloat y = y;
  v101.size.CGFloat width = v94;
  v101.size.CGFloat height = height;
  v122.origin.CGFloat x = v16;
  v122.origin.CGFloat y = v18;
  v122.size.CGFloat width = v20;
  v122.size.CGFloat height = v98;
  if (!CGRectIntersectsRect(v101, v122))
  {
    if (a6 != 1) {
      goto LABEL_105;
    }
    a4->origin.CGFloat x = x;
    goto LABEL_15;
  }
  v102.origin.CGFloat x = x;
  v102.origin.CGFloat y = y;
  v102.size.CGFloat width = v94;
  v102.size.CGFloat height = height;
  CGFloat rect = height;
  double v24 = CGRectGetMinY(v102);
  v103.origin.CGFloat y = v18;
  v103.origin.CGFloat x = v16;
  v103.size.CGFloat width = v20;
  v103.size.CGFloat height = v98;
  if (v24 >= CGRectGetMinY(v103)) {
    goto LABEL_17;
  }
  v104.origin.CGFloat x = x;
  v104.origin.CGFloat y = y;
  v104.size.CGFloat width = v94;
  v104.size.CGFloat height = rect;
  double v25 = CGRectGetMaxY(v104);
  v105.origin.CGFloat y = v18;
  v105.origin.CGFloat x = v16;
  v105.size.CGFloat width = v20;
  v105.size.CGFloat height = v98;
  if (v25 <= CGRectGetMaxY(v105))
  {
LABEL_17:
    CGFloat v29 = y;
    CGRect *__attribute__((__org_arrdim(0,128))) v90 = a4;
    if (*v23 >= 1)
    {
      uint64_t v30 = 0;
      int v31 = 0;
      int v99 = 0;
      unsigned int v32 = 0;
      if (a6 == 1) {
        int v33 = 1;
      }
      else {
        int v33 = -1;
      }
      double v34 = 0.0;
      size_t v35 = 2048;
      double v36 = 0.0;
      double v37 = 0.0;
      double v38 = 0.0;
      CGRect v39 = &nonInteractiveInsertionContext_nonInteractiveInsertionContext;
      while (1)
      {
        uint64_t v40 = *((void *)v23 + 2);
        unint64_t v41 = *(unsigned int *)(v40 + 16 * v30);
        if (v41)
        {
          v42 = (double *)(*(void *)(v40 + 16 * v30 + 8) + 8);
          uint64_t v43 = 1;
          do
          {
            unint64_t v44 = v43;
            double v45 = *v42;
            v42 += 2;
            double v46 = v45;
            if (v45 < MaxY) {
              int v47 = 1;
            }
            else {
              int v47 = 2;
            }
            if (v46 <= MinY) {
              int v31 = 0;
            }
            else {
              int v31 = v47;
            }
            uint64_t v43 = v44 + 1;
          }
          while (v44 < v41 && v31 == 1);
          int v48 = v44 - 1;
        }
        else
        {
          v49 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
          uint64_t v50 = [NSString stringWithUTF8String:"+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]"];
          objc_msgSend(v49, "handleFailureInFunction:file:lineNumber:description:", v50, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPTextWrapper.mm"), 484, @"Invalid number of vertices in polygon.");
          CGRect v39 = &nonInteractiveInsertionContext_nonInteractiveInsertionContext;
          int v48 = 0;
        }
        unsigned int v51 = 0;
        if (a6 == 1) {
          int v52 = 0;
        }
        else {
          int v52 = v41;
        }
        unsigned int v53 = v48 + v52;
        do
        {
          double v54 = v36;
          double v55 = v34;
          v56 = (double *)(*(void *)(*((void *)v23 + 2) + 16 * v30 + 8) + 16 * (v53 % v41));
          double v36 = *v56;
          double v34 = v56[1];
          if (v34 < MaxY) {
            int v57 = 1;
          }
          else {
            int v57 = 2;
          }
          if (v34 <= MinY) {
            int v58 = 0;
          }
          else {
            int v58 = v57;
          }
          if (!v51) {
            goto LABEL_102;
          }
          if (v58 == v31)
          {
            if (v37 >= v36) {
              double v59 = v36;
            }
            else {
              double v59 = v37;
            }
            if (v38 <= v36) {
              double v60 = v36;
            }
            else {
              double v60 = v38;
            }
            if (v31 == 1)
            {
              double v38 = v60;
              double v37 = v59;
              int v58 = 1;
            }
            else
            {
              int v58 = v31;
            }
          }
          else
          {
            double v61 = v34 - v55;
            double v62 = v36 - v54;
            if (v31)
            {
              if (v31 != 1)
              {
                if (v58 == 1)
                {
                  double v73 = v54 + (MaxY - v55) / v61 * v62;
                  if (v73 <= v36) {
                    double v38 = v36;
                  }
                  else {
                    double v38 = v73;
                  }
                  if (v73 >= v36) {
                    double v37 = v36;
                  }
                  else {
                    double v37 = v73;
                  }
LABEL_88:
                  int v99 = 2;
                  goto LABEL_100;
                }
                double v76 = v54 + (MinY - v55) / v61 * v62;
                double v71 = v54 + (MaxY - v55) / v61 * v62;
                if (v76 > v71) {
                  double v71 = v76;
                }
                uint64_t v72 = v39[56] + 16 * v32++;
                *(void *)uint64_t v72 = 1;
                goto LABEL_99;
              }
              uint64_t v63 = v39[56];
              unsigned int v64 = v32 + 1;
              uint64_t v65 = v63 + 16 * v32;
              if (v34 <= MinY || v34 < MaxY)
              {
                double v67 = v54 + (MinY - v55) / v61 * v62;
                if (v38 <= v67) {
                  double v38 = v67;
                }
                *(void *)uint64_t v65 = 1;
                *(double *)(v65 + 8) = v38;
                if (!v99)
                {
                  int v99 = 0;
                  if (v37 >= v67) {
                    double v37 = v67;
                  }
                  v32 += 2;
                  uint64_t v68 = v63 + 16 * v64;
                  *(void *)uint64_t v68 = 0;
                  *(double *)(v68 + 8) = v37;
                  goto LABEL_100;
                }
              }
              else
              {
                double v74 = v54 + (MaxY - v55) / v61 * v62;
                if (v37 >= v74) {
                  double v37 = v74;
                }
                *(void *)uint64_t v65 = 0;
                *(double *)(v65 + 8) = v37;
                if (v99 == 2)
                {
                  if (v38 <= v74) {
                    double v38 = v74;
                  }
                  v32 += 2;
                  uint64_t v75 = v63 + 16 * v64;
                  *(void *)uint64_t v75 = 1;
                  *(double *)(v75 + 8) = v38;
                  goto LABEL_88;
                }
              }
              ++v32;
            }
            else
            {
              double v69 = v54 + (MinY - v55) / v61 * v62;
              if (v34 <= MinY || v34 >= MaxY)
              {
                double v71 = v54 + (MaxY - v55) / v61 * v62;
                if (v69 < v71) {
                  double v71 = v69;
                }
                uint64_t v72 = v39[56] + 16 * v32++;
                *(void *)uint64_t v72 = 0;
LABEL_99:
                *(double *)(v72 + 8) = v71;
                goto LABEL_100;
              }
              int v99 = 0;
              if (v69 <= v36) {
                double v38 = v36;
              }
              else {
                double v38 = v54 + (MinY - v55) / v61 * v62;
              }
              if (v69 >= v36) {
                double v37 = v36;
              }
              else {
                double v37 = v54 + (MinY - v55) / v61 * v62;
              }
            }
          }
LABEL_100:
          if (v35 - 2 <= v32)
          {
            v35 *= 2;
            +[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers = (uint64_t)malloc_type_realloc((void *)v39[56], v35, 0x515CE8FBuLL);
            bzero((void *)(+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers+ 16 * v32), 16 * (v35 - v32));
            CGRect v39 = &nonInteractiveInsertionContext_nonInteractiveInsertionContext;
          }
LABEL_102:
          int v31 = v58;
          ++v51;
          v53 += v33;
        }
        while (v51 <= v41);
        if (++v30 >= *v23) {
          goto LABEL_107;
        }
      }
    }
    unsigned int v32 = 0;
    CGRect v39 = &nonInteractiveInsertionContext_nonInteractiveInsertionContext;
LABEL_107:
    qsort((void *)v39[56], v32, 0x10uLL, (int (__cdecl *)(const void *, const void *))TSWPTextWrapMarkerCompare);
    v112.origin.CGFloat x = v93;
    v112.origin.CGFloat y = y;
    v112.size.CGFloat width = v94;
    v112.size.CGFloat height = rect;
    double MinX = CGRectGetMinX(v112);
    int v78 = !a6
       || *(_DWORD *)+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers == 1;
    if (v32)
    {
      uint64_t v79 = 0;
      unint64_t v28 = 0;
      uint64_t v80 = +[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers;
      unint64_t v81 = 1;
      do
      {
        if (*(_DWORD *)(v80 + v79))
        {
          if (!--v78)
          {
            int v78 = 0;
            if (*(double *)(v80 + v79 + 8) > MinX) {
              double MinX = *(double *)(v80 + v79 + 8);
            }
          }
        }
        else
        {
          if (!v78)
          {
            v113.origin.CGFloat x = v93;
            v113.origin.CGFloat y = y;
            v113.size.CGFloat width = v94;
            v113.size.CGFloat height = rect;
            CGFloat MaxX = CGRectGetMaxX(v113);
            double v83 = *(double *)(+[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers
                            + v79
                            + 8);
            if (MaxX < v83)
            {
              v114.origin.CGFloat x = v93;
              v114.origin.CGFloat y = y;
              v114.size.CGFloat width = v94;
              v114.size.CGFloat height = rect;
              double v83 = CGRectGetMaxX(v114);
            }
            v115.origin.CGFloat x = v93;
            v115.origin.CGFloat y = y;
            v115.size.CGFloat width = v94;
            v115.size.CGFloat height = rect;
            CGFloat v84 = CGRectGetMinY(v115);
            v116.origin.CGFloat x = v93;
            v116.origin.CGFloat y = y;
            v116.size.CGFloat width = v94;
            v116.size.CGFloat height = rect;
            CGFloat v85 = CGRectGetHeight(v116);
            v86 = &v90[v28++];
            v86->origin.CGFloat x = MinX;
            v86->origin.CGFloat y = v84;
            v86->size.CGFloat width = v83 - MinX;
            v86->size.CGFloat height = v85;
            uint64_t v80 = +[TSWPTextWrapper p_wrappedSubrectsForRectOptimized:lineSegmentRects:polygon:type:skipHint:]::markers;
          }
          ++v78;
        }
        BOOL v87 = v28 < 0x80;
        if (v81 >= v32) {
          break;
        }
        ++v81;
        v79 += 16;
      }
      while (v28 < 0x80);
    }
    else
    {
      unint64_t v28 = 0;
      BOOL v87 = 1;
    }
    if (v78) {
      return v28;
    }
    if (!v87) {
      return v28;
    }
    v117.origin.CGFloat x = v93;
    v117.origin.CGFloat y = y;
    v117.size.CGFloat width = v94;
    v117.size.CGFloat height = rect;
    if (MinX >= CGRectGetMaxX(v117)) {
      return v28;
    }
    v118.origin.CGFloat x = v93;
    v118.origin.CGFloat y = y;
    v118.size.CGFloat width = v94;
    v118.size.CGFloat height = rect;
    CGFloat y = CGRectGetMinY(v118);
    v119.origin.CGFloat x = v93;
    v119.origin.CGFloat y = v29;
    v119.size.CGFloat width = v94;
    v119.size.CGFloat height = rect;
    double v27 = CGRectGetMaxX(v119) - MinX;
    v120.origin.CGFloat x = v93;
    v120.origin.CGFloat y = v29;
    v120.size.CGFloat width = v94;
    v120.size.CGFloat height = rect;
    CGFloat height = CGRectGetHeight(v120);
    a4 = &v90[v28];
    LODWORD(v28) = v28 + 1;
    a4->origin.CGFloat x = MinX;
LABEL_16:
    a4->origin.CGFloat y = y;
    a4->size.CGFloat width = v27;
    a4->size.CGFloat height = height;
    return v28;
  }
  if (a6 != 1)
  {
LABEL_105:
    LODWORD(v28) = 0;
    return v28;
  }
  v106.origin.CGFloat x = v16;
  v106.origin.CGFloat y = v18;
  v106.size.CGFloat width = v20;
  v106.size.CGFloat height = v98;
  double v96 = CGRectGetMinX(v106);
  v107.origin.CGFloat x = x;
  v107.origin.CGFloat y = y;
  v107.size.CGFloat width = v94;
  v107.size.CGFloat height = rect;
  double v89 = v96 - CGRectGetMinX(v107);
  v108.origin.CGFloat x = v16;
  v108.origin.CGFloat y = v18;
  v108.size.CGFloat width = v20;
  v108.size.CGFloat height = v98;
  CGFloat v97 = CGRectGetMaxX(v108);
  v109.origin.CGFloat x = x;
  v109.origin.CGFloat y = y;
  v109.size.CGFloat width = v94;
  v109.size.CGFloat height = rect;
  double v26 = CGRectGetMaxX(v109);
  v110.origin.CGFloat x = v16;
  v110.origin.CGFloat y = v18;
  v110.size.CGFloat width = v92;
  v110.size.CGFloat height = v98;
  double v27 = v26 - CGRectGetMaxX(v110);
  CGFloat height = rect;
  v111.origin.CGFloat x = v93;
  v111.origin.CGFloat y = y;
  v111.size.CGFloat width = v89;
  v111.size.CGFloat height = rect;
  if (CGRectGetWidth(v111) <= 0.0)
  {
    unint64_t v28 = 0;
  }
  else
  {
    a4->origin.CGFloat x = v93;
    a4->origin.CGFloat y = y;
    unint64_t v28 = 1;
    a4->size.CGFloat width = v89;
    a4->size.CGFloat height = rect;
  }
  v121.origin.CGFloat x = v97;
  v121.origin.CGFloat y = y;
  v121.size.CGFloat width = v27;
  v121.size.CGFloat height = rect;
  if (CGRectGetWidth(v121) > 0.0)
  {
    a4 += v28;
    LODWORD(v28) = v28 + 1;
    a4->origin.CGFloat x = v97;
    goto LABEL_16;
  }
  return v28;
}

@end