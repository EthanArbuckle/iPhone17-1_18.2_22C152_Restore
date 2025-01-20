@interface CRLWPTextWrapper
+ (double)p_skipHintForRect:(CGRect)a3 wrapSegments:(id)a4 type:(int64_t)a5;
+ (double)unobstructedSpanForWrapSegments:(id)a3 startingSpan:(CGRect)a4 columnBounds:(CGRect)a5;
+ (id)horizontalIntersectionsOfRectList:(id)a3 withRectList:(id)a4 minWidth:(double)a5;
+ (void)splitLine:(CGRect)a3 lineSegmentRects:(id)a4 wrapSegments:(id)a5 type:(int64_t)a6 skipHint:(double *)a7;
@end

@implementation CRLWPTextWrapper

+ (void)splitLine:(CGRect)a3 lineSegmentRects:(id)a4 wrapSegments:(id)a5 type:(int64_t)a6 skipHint:(double *)a7
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v15 = a4;
  id v16 = a5;
  v17 = v16;
  if (a7) {
    *a7 = 1.0;
  }
  [v16 bounds];
  v81.origin.double x = v18;
  v81.origin.double y = v19;
  v81.size.double width = v20;
  v81.size.double height = v21;
  v75.origin.double x = x;
  v75.origin.double y = y;
  v75.size.double width = width;
  v75.size.double height = height;
  if (CGRectIntersectsRect(v75, v81))
  {
    v76.origin.double x = x;
    v76.origin.double y = y;
    v76.size.double width = width;
    v76.size.double height = height;
    v69 = v15;
    double MinX = CGRectGetMinX(v76);
    v77.origin.double x = x;
    v77.origin.double y = y;
    v77.size.double width = width;
    v77.size.double height = height;
    double MaxX = CGRectGetMaxX(v77);
    v78.origin.double x = x;
    v78.origin.double y = y;
    v78.size.double width = width;
    v78.size.double height = height;
    double MinY = CGRectGetMinY(v78);
    v79.origin.double x = x;
    v79.origin.double y = y;
    v79.size.double width = width;
    v79.size.double height = height;
    double MaxY = CGRectGetMaxY(v79);
    v80.origin.double x = x;
    v80.origin.double y = y;
    double v64 = width;
    double v65 = height;
    v80.size.double width = width;
    v80.size.double height = height;
    double v70 = CGRectGetHeight(v80);
    __p = 0;
    v72 = 0;
    unint64_t v73 = 0;
    sub_1000D7970(&__p, 0x40uLL);
    id v66 = a1;
    v67 = a7;
    id v26 = [v17 segmentCount];
    int64_t v68 = a6;
    v27 = (char *)[v17 segments];
    if (v26)
    {
      v29 = v27;
      v30 = 0;
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        v32 = (double *)&v29[32 * (void)i];
        double v33 = v32[1];
        double v34 = v32[3];
        if (v34 > MinY && v33 < MaxY)
        {
          v28.n128_f64[0] = *v32;
          double v36 = v32[2];
          if (v33 <= MinY)
          {
            v28.n128_f64[0] = v28.n128_f64[0] + (MinY - v33) / (v34 - v33) * (v36 - v28.n128_f64[0]);
            int v37 = 1;
            double v33 = MinY;
          }
          else
          {
            int v37 = 0;
          }
          if (v34 >= MaxY && v33 < MaxY)
          {
            double v36 = v28.n128_f64[0] + (MaxY - v33) / (v34 - v33) * (v36 - v28.n128_f64[0]);
            int v39 = 1;
          }
          else
          {
            int v39 = 0;
          }
          if (v36 >= v28.n128_f64[0]) {
            double v40 = v28.n128_f64[0];
          }
          else {
            double v40 = v36;
          }
          if (v28.n128_f64[0] >= v36) {
            double v41 = v28.n128_f64[0];
          }
          else {
            double v41 = v36;
          }
          if (v30
            && ((double v42 = *(double *)v30, v28.n128_u64[0] = *((void *)v30 + 1), v41 >= v28.n128_f64[0])
              ? (double v43 = *((double *)v30 + 1))
              : (double v43 = v41),
                v42 >= v40 ? (double v44 = *(double *)v30) : (double v44 = v40),
                v44 <= v43))
          {
            if (v40 < v42) {
              double v42 = v40;
            }
            if (v28.n128_f64[0] < v41) {
              v28.n128_f64[0] = v41;
            }
            *(double *)v30 = v42;
            *((void *)v30 + 1) = v28.n128_u64[0];
            v30[16] = v30[16] != v37;
            v30[17] = v30[17] != v39;
          }
          else
          {
            v45 = v72;
            if ((unint64_t)v72 >= v73)
            {
              unint64_t v47 = 0xAAAAAAAAAAAAAAABLL * (((char *)v72 - (unsigned char *)__p) >> 3);
              unint64_t v48 = v47 + 1;
              if (v47 + 1 > 0xAAAAAAAAAAAAAAALL) {
                sub_100004E40();
              }
              if (0x5555555555555556 * ((uint64_t)(v73 - (void)__p) >> 3) > v48) {
                unint64_t v48 = 0x5555555555555556 * ((uint64_t)(v73 - (void)__p) >> 3);
              }
              if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v73 - (void)__p) >> 3) >= 0x555555555555555) {
                unint64_t v49 = 0xAAAAAAAAAAAAAAALL;
              }
              else {
                unint64_t v49 = v48;
              }
              if (v49) {
                v50 = (char *)sub_100046F5C((uint64_t)&v73, v49);
              }
              else {
                v50 = 0;
              }
              v51 = &v50[24 * v47];
              *(double *)v51 = v40;
              *((double *)v51 + 1) = v41;
              v51[16] = v37;
              v51[17] = v39;
              *(_DWORD *)(v51 + 18) = 0;
              *((_WORD *)v51 + 11) = 0;
              v53 = (__n128 *)__p;
              v52 = v72;
              v54 = v51;
              if (v72 != __p)
              {
                do
                {
                  __n128 v28 = *(__n128 *)((char *)v52 - 24);
                  *((void *)v54 - 1) = v52[-1].n128_u64[1];
                  *(__n128 *)(v54 - 24) = v28;
                  v54 -= 24;
                  v52 = (__n128 *)((char *)v52 - 24);
                }
                while (v52 != v53);
                v52 = (__n128 *)__p;
              }
              v46 = (__n128 *)(v51 + 24);
              __p = v54;
              v72 = (__n128 *)(v51 + 24);
              unint64_t v73 = (unint64_t)&v50[24 * v49];
              if (v52) {
                operator delete(v52);
              }
            }
            else
            {
              v72->n128_f64[0] = v40;
              v45->n128_f64[1] = v41;
              v45[1].n128_u8[0] = v37;
              v45[1].n128_u8[1] = v39;
              *(unsigned __int32 *)((char *)v45[1].n128_u32 + 2) = 0;
              v46 = (__n128 *)((char *)v45 + 24);
              v45[1].n128_u16[3] = 0;
            }
            v72 = v46;
            v30 = &v46[-2].n128_i8[8];
          }
        }
      }
    }
    unint64_t v55 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v72 - (unsigned char *)__p) >> 3));
    if (v72 == __p) {
      uint64_t v56 = 0;
    }
    else {
      uint64_t v56 = v55;
    }
    sub_1000D8344((uint64_t)__p, v72, (uint64_t)v74, v56, 1, v28);
    v57 = (__n128 *)__p;
    int64_t v58 = a6;
    id v15 = v69;
    if (__p != v72)
    {
      BOOL v59 = a6 != 1;
      BOOL v60 = a6 != 1;
      do
      {
        if (!v60 && !v59 && MinX < v57->n128_f64[0])
        {
          if (MaxX - MinX >= v57->n128_f64[0] - MinX) {
            double v61 = v57->n128_f64[0] - MinX;
          }
          else {
            double v61 = MaxX - MinX;
          }
          [v69 addRect:MinX, MinY, v61, v70];
        }
        if (MinX < v57->n128_f64[1]) {
          double MinX = v57->n128_f64[1];
        }
        if (MinX >= MaxX) {
          break;
        }
        BOOL v59 = v57[1].n128_u8[1] != v59;
        BOOL v60 = v57[1].n128_u8[0] != v60;
        v57 = (__n128 *)((char *)v57 + 24);
      }
      while (v57 != v72);
    }
    if (v68 == 1 && MinX < MaxX) {
      [v69 addRect:MinX, MinY, MaxX - MinX, v70];
    }
    if (v67)
    {
      id v62 = [v69 count];
      if (v58 == 1 && !v62)
      {
        [v66 p_skipHintForRect:v17 wrapSegments:1 type:x y:y v64:v65];
        *(void *)v67 = v63;
      }
    }
    if (__p)
    {
      v72 = (__n128 *)__p;
      operator delete(__p);
    }
  }
  else if (a6 == 1)
  {
    [v15 addRect:x, y, width, height];
  }
}

+ (double)unobstructedSpanForWrapSegments:(id)a3 startingSpan:(CGRect)a4 columnBounds:(CGRect)a5
{
  CGFloat height = a5.size.height;
  CGFloat width = a5.size.width;
  CGFloat x = a5.origin.x;
  CGFloat y = a5.origin.y;
  CGFloat v6 = a4.size.height;
  CGFloat v7 = a4.size.width;
  CGFloat v8 = a4.origin.y;
  CGFloat v9 = a4.origin.x;
  id v10 = a3;
  v71.origin.CGFloat x = v9;
  v71.origin.CGFloat y = v8;
  v71.size.CGFloat width = v7;
  v71.size.CGFloat height = v6;
  double MinX = CGRectGetMinX(v71);
  v72.origin.CGFloat x = v9;
  v72.origin.CGFloat y = v8;
  v72.size.CGFloat width = v7;
  v72.size.CGFloat height = v6;
  double MaxX = CGRectGetMaxX(v72);
  v73.origin.CGFloat x = v9;
  v73.origin.CGFloat y = v8;
  v73.size.CGFloat width = v7;
  v73.size.CGFloat height = v6;
  double v64 = CGRectGetHeight(v73);
  v67 = 0;
  int64_t v68 = 0;
  unint64_t v69 = 0;
  sub_1000D7970((void **)&v67, 0x40uLL);
  id v13 = [v10 segmentCount];
  CGFloat v62 = width;
  v14 = (char *)[v10 segments];
  if (v13)
  {
    id v16 = v14;
    v17 = 0;
    CGFloat v18 = 0;
    double v19 = v6;
    double v20 = v7;
    do
    {
      CGFloat v21 = (double *)&v16[32 * (void)v18];
      v15.n128_f64[0] = *v21;
      double v22 = v21[2];
      if ((*v21 > MinX || v22 > MinX) && (v15.n128_f64[0] < MaxX || v22 < MaxX))
      {
        double v25 = v21[1];
        double v26 = v21[3];
        if (v15.n128_f64[0] >= v22) {
          double v27 = v21[2];
        }
        else {
          double v27 = *v21;
        }
        if (v15.n128_f64[0] >= v22) {
          double v28 = v21[3];
        }
        else {
          double v28 = v21[1];
        }
        if (v15.n128_f64[0] >= v22) {
          double v29 = *v21;
        }
        else {
          double v29 = v21[2];
        }
        if (v15.n128_f64[0] >= v22) {
          double v30 = v21[1];
        }
        else {
          double v30 = v21[3];
        }
        if (v27 > MinX || v29 <= MinX)
        {
          int v32 = 0;
        }
        else
        {
          double v28 = v25 + (MinX - v15.n128_f64[0]) / (v22 - v15.n128_f64[0]) * (v26 - v25);
          int v32 = 1;
          double v27 = MinX;
        }
        if (v29 >= MaxX && v27 < MaxX)
        {
          v15.n128_f64[0] = (MaxX - v15.n128_f64[0]) / (v22 - v15.n128_f64[0]);
          double v30 = v25 + v15.n128_f64[0] * (v26 - v25);
          int v34 = 1;
        }
        else
        {
          int v34 = 0;
        }
        if (v30 >= v28) {
          double v35 = v28;
        }
        else {
          double v35 = v30;
        }
        if (v28 >= v30) {
          double v36 = v28;
        }
        else {
          double v36 = v30;
        }
        if (v17
          && ((double v37 = *(double *)v17, v15.n128_u64[0] = *((void *)v17 + 1), v36 >= v15.n128_f64[0])
            ? (double v38 = *((double *)v17 + 1))
            : (double v38 = v36),
              v37 >= v35 ? (double v39 = *(double *)v17) : (double v39 = v35),
              v39 <= v38))
        {
          if (v35 < v37) {
            double v37 = v35;
          }
          if (v15.n128_f64[0] < v36) {
            v15.n128_f64[0] = v36;
          }
          *(double *)v17 = v37;
          *((void *)v17 + 1) = v15.n128_u64[0];
          v17[16] = v17[16] != v32;
          v17[17] = v17[17] != v34;
          CGFloat v6 = v19;
          CGFloat v7 = v20;
        }
        else
        {
          double v40 = v68;
          if ((unint64_t)v68 >= v69)
          {
            unint64_t v42 = 0xAAAAAAAAAAAAAAABLL * (((char *)v68 - (char *)v67) >> 3);
            unint64_t v43 = v42 + 1;
            if (v42 + 1 > 0xAAAAAAAAAAAAAAALL) {
              sub_100004E40();
            }
            if (0x5555555555555556 * ((uint64_t)(v69 - (void)v67) >> 3) > v43) {
              unint64_t v43 = 0x5555555555555556 * ((uint64_t)(v69 - (void)v67) >> 3);
            }
            if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v69 - (void)v67) >> 3) >= 0x555555555555555) {
              unint64_t v44 = 0xAAAAAAAAAAAAAAALL;
            }
            else {
              unint64_t v44 = v43;
            }
            if (v44) {
              v45 = (char *)sub_100046F5C((uint64_t)&v69, v44);
            }
            else {
              v45 = 0;
            }
            v46 = &v45[24 * v42];
            *(double *)v46 = v35;
            *((double *)v46 + 1) = v36;
            v46[16] = v32;
            v46[17] = v34;
            *(_DWORD *)(v46 + 18) = 0;
            *((_WORD *)v46 + 11) = 0;
            unint64_t v48 = v67;
            unint64_t v47 = v68;
            unint64_t v49 = (__n128 *)v46;
            CGFloat v6 = v19;
            CGFloat v7 = v20;
            if (v68 != v67)
            {
              do
              {
                __n128 v15 = *(__n128 *)((char *)v47 - 24);
                v49[-1].n128_u64[1] = v47[-1].n128_u64[1];
                *(__n128 *)((char *)v49 - 24) = v15;
                unint64_t v49 = (__n128 *)((char *)v49 - 24);
                unint64_t v47 = (__n128 *)((char *)v47 - 24);
              }
              while (v47 != v48);
              unint64_t v47 = v67;
            }
            double v41 = (__n128 *)(v46 + 24);
            v67 = v49;
            int64_t v68 = (__n128 *)(v46 + 24);
            unint64_t v69 = (unint64_t)&v45[24 * v44];
            if (v47) {
              operator delete(v47);
            }
          }
          else
          {
            v68->n128_f64[0] = v35;
            v40->n128_f64[1] = v36;
            v40[1].n128_u8[0] = v32;
            v40[1].n128_u8[1] = v34;
            *(unsigned __int32 *)((char *)v40[1].n128_u32 + 2) = 0;
            double v41 = (__n128 *)((char *)v40 + 24);
            v40[1].n128_u16[3] = 0;
            CGFloat v6 = v19;
            CGFloat v7 = v20;
          }
          int64_t v68 = v41;
          v17 = &v41[-2].n128_i8[8];
        }
      }
      CGFloat v18 = (char *)v18 + 1;
    }
    while (v18 != v13);
  }
  unint64_t v50 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v68 - (char *)v67) >> 3));
  if (v68 == v67) {
    uint64_t v51 = 0;
  }
  else {
    uint64_t v51 = v50;
  }
  sub_1000D8344((uint64_t)v67, v68, (uint64_t)v70, v51, 1, v15);
  v74.origin.CGFloat x = v9;
  v74.origin.CGFloat y = v8;
  v74.size.CGFloat width = v7;
  v74.size.CGFloat height = v6;
  double MinY = CGRectGetMinY(v74);
  v53 = v67;
  if (v67 != v68)
  {
    BOOL v54 = 0;
    BOOL v55 = 0;
    do
    {
      if (!v55 && !v54 && MinY < v53->n128_f64[0] && v53->n128_f64[0] - MinY >= v64) {
        break;
      }
      int v57 = v53[1].n128_u8[0];
      int v58 = v53[1].n128_u8[1];
      double v59 = v53->n128_f64[1];
      v75.origin.CGFloat x = x;
      v75.origin.CGFloat y = y;
      v75.size.CGFloat width = v62;
      v75.size.CGFloat height = height;
      double MaxY = CGRectGetMaxY(v75);
      if (MinY < v59 + 1.0) {
        double MinY = v59 + 1.0;
      }
      if (MinY >= MaxY) {
        break;
      }
      BOOL v54 = v58 != v54;
      BOOL v55 = v57 != v55;
      v53 = (__n128 *)((char *)v53 + 24);
    }
    while (v53 != v68);
    v53 = v67;
  }
  if (v53)
  {
    int64_t v68 = v53;
    operator delete(v53);
  }

  return MinY;
}

+ (id)horizontalIntersectionsOfRectList:(id)a3 withRectList:(id)a4 minWidth:(double)a5
{
  id v6 = a3;
  id v7 = a4;
  CGFloat v8 = objc_opt_new();
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  double v33 = 0.000000999999997;
  while (v10 < (unint64_t)objc_msgSend(v6, "count", *(void *)&v33)
       && v9 < (unint64_t)[v7 count])
  {
    [v6 rectAtIndex:v10];
    CGFloat rect = v11;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [v7 rectAtIndex:v9];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    v38.origin.double x = rect;
    v38.origin.double y = v13;
    v38.size.double width = v15;
    v38.size.double height = v17;
    double MaxX = CGRectGetMaxX(v38);
    v39.origin.double x = v19;
    v39.origin.double y = v21;
    v39.size.double width = v23;
    v39.size.double height = v25;
    double v26 = CGRectGetMaxX(v39);
    v40.origin.double x = v19;
    v40.origin.double y = v21;
    v40.size.double width = v23;
    v40.size.double height = v25;
    if (MaxX <= CGRectGetMinX(v40)) {
      goto LABEL_10;
    }
    v41.origin.double x = rect;
    v41.origin.double y = v13;
    v41.size.double width = v15;
    v41.size.double height = v17;
    if (v26 <= CGRectGetMinX(v41)) {
      goto LABEL_11;
    }
    v42.origin.double x = rect;
    v42.origin.double y = v13;
    v42.size.double width = v15;
    v42.size.double height = v17;
    v45.origin.double x = v19;
    v45.origin.double y = v21;
    v45.size.double width = v23;
    v45.size.double height = v25;
    CGRect v43 = CGRectIntersection(v42, v45);
    double x = v43.origin.x;
    double y = v43.origin.y;
    double width = v43.size.width;
    double height = v43.size.height;
    if (CGRectGetWidth(v43) >= a5) {
      [v8 addRect:x, y, width, height];
    }
    v44.origin.double x = x;
    v44.origin.double y = y;
    v44.size.double width = width;
    v44.size.double height = height;
    double v31 = CGRectGetMaxX(v44);
    if (v31 == MaxX || vabdd_f64(v31, MaxX) < fabs(MaxX * v33)) {
LABEL_10:
    }
      ++v10;
    else {
LABEL_11:
    }
      ++v9;
  }

  return v8;
}

+ (double)p_skipHintForRect:(CGRect)a3 wrapSegments:(id)a4 type:(int64_t)a5
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v9 = a4;
  if ((uint64_t)[v9 segmentCount] < 1)
  {
    double v15 = 1.0;
  }
  else
  {
    v38.origin.CGFloat x = x;
    v38.origin.CGFloat y = y;
    v38.size.CGFloat width = width;
    v38.size.CGFloat height = height;
    double MinX = CGRectGetMinX(v38);
    v39.origin.CGFloat x = x;
    v39.origin.CGFloat y = y;
    v39.size.CGFloat width = width;
    v39.size.CGFloat height = height;
    double MaxX = CGRectGetMaxX(v39);
    v40.origin.CGFloat x = x;
    v40.origin.CGFloat y = y;
    v40.size.CGFloat width = width;
    v40.size.CGFloat height = height;
    double MinY = CGRectGetMinY(v40);
    CGFloat v13 = (char *)[v9 segmentCount];
    double v14 = (char *)[v9 segments];
    double v15 = 1.0;
    if (v13)
    {
      float v16 = MinY + 1.0;
      double v17 = ceilf(v16);
      double v18 = v13 - 1;
      CGFloat v19 = (double *)(v14 + 16);
      double v20 = 1.79769313e308;
      do
      {
        double v21 = *(v19 - 1);
        double v22 = v19[1];
        if (v22 > v17 && v21 < v20)
        {
          double v24 = *(v19 - 2);
          double v25 = *v19;
          if ((v24 > MinX || v25 > MinX) && (v24 < MaxX || v25 < MaxX))
          {
            if (v24 >= v25) {
              double v28 = *v19;
            }
            else {
              double v28 = *(v19 - 2);
            }
            if (v24 >= v25) {
              double v29 = v19[1];
            }
            else {
              double v29 = *(v19 - 1);
            }
            if (v24 >= v25) {
              double v30 = *(v19 - 2);
            }
            else {
              double v30 = *v19;
            }
            if (v24 >= v25) {
              double v31 = *(v19 - 1);
            }
            else {
              double v31 = v19[1];
            }
            double v32 = v25 - v24;
            double v33 = v22 - v21;
            if (v28 < MinX) {
              double v29 = v21 + (MinX - v24) / v32 * v33;
            }
            if (v30 > MaxX) {
              double v31 = v21 + (MaxX - v24) / v32 * v33;
            }
            if (v31 >= v29) {
              double v34 = v29;
            }
            else {
              double v34 = v31;
            }
            if (v34 < v20) {
              double v20 = v34;
            }
          }
        }
        BOOL v35 = v20 <= v17 || v18-- == 0;
        v19 += 4;
      }
      while (!v35);
      if (v20 < 1.79769313e308 && v20 > v17)
      {
        v41.origin.CGFloat x = x;
        v41.origin.CGFloat y = y;
        v41.size.CGFloat width = width;
        v41.size.CGFloat height = height;
        double v15 = v20 - CGRectGetMinY(v41);
      }
    }
  }

  return v15;
}

@end