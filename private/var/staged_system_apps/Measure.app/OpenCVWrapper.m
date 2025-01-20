@interface OpenCVWrapper
+ (CGImage)createCgImageFromCVMat:(Mat *)a3;
+ (id)LSDInImage:(id)a3;
+ (id)blurredImage:(id)a3 blurSize:(int)a4;
+ (id)findCannyEdgesInImage:(id)a3 threshold1:(double)a4 threshold2:(double)a5;
+ (id)findContoursInImage:(id)a3;
+ (id)findCornersAndFilterContours:(id)a3 forMaxEdgeTurns:(int)a4 forTurningPointMargin:(int)a5;
+ (id)findHoughLines:(id)a3 rho:(double)a4 theta:(double)a5 threshold:(double)a6 minLineLength:(double)a7 maxLineGap:(double)a8;
+ (id)getMinAreaRectEnclosingPoints:(id)a3;
+ (id)makeCVImageFromContours:(id)a3 lineThickness:(int)a4 color:(id)a5;
+ (id)makeCVImageFromUniqueContours:(id)a3 lineThickness:(int)a4;
+ (id)makeUIImageFromCVImage:(id)a3;
+ (id)samplePointsInContour:()vector<cv:(std:(int)a4 :allocator<cv::Point_<int>>> *)a3 :Point_<int> numberOfPoints:;
+ (int)calcHistogramMedianForImage:(id)a3;
+ (void)filterContours:(id)a3 forMinEdgeLength:(int)a4;
@end

@implementation OpenCVWrapper

+ (id)blurredImage:(id)a3 blurSize:(int)a4
{
  id v5 = a3;
  v6 = v5;
  if (a4 > 1)
  {
    v17[0] = 1124007936;
    memset(&v17[1], 0, 60);
    v18 = &v17[2];
    v19 = v20;
    v20[0] = 0;
    v20[1] = 0;
    id v15 = [v5 image];
    uint64_t v16 = 0;
    int v14 = 16842752;
    HIDWORD(v10) = a4;
    int v11 = 33619968;
    v12 = v17;
    uint64_t v13 = 0;
    LODWORD(v10) = a4;
    uint64_t v9 = -1;
    sub_10038A3FC((uint64_t)&v14, (uint64_t)&v11, &v10, &v9, 4);
  }
  v7 = [v5 clone];

  return v7;
}

+ (id)findCannyEdgesInImage:(id)a3 threshold1:(double)a4 threshold2:(double)a5
{
  v14[0] = 1124007936;
  memset(&v14[1], 0, 60);
  id v15 = &v14[2];
  uint64_t v16 = v17;
  v17[0] = 0;
  v17[1] = 0;
  id v12 = [a3 image];
  uint64_t v13 = 0;
  int v11 = 16842752;
  int v8 = 33619968;
  uint64_t v9 = v14;
  uint64_t v10 = 0;
  sub_1002F249C((uint64_t)&v11, (uint64_t)&v8, 3, 0, a4, a5);
}

+ (id)LSDInImage:(id)a3
{
  id v3 = a3;
  int v5 = 1124007936;
  memset(v6, 0, sizeof(v6));
  v7 = &v6[4];
  int v8 = v9;
  v9[0] = 0;
  v9[1] = 0;
  sub_100359E98();
}

+ (id)findHoughLines:(id)a3 rho:(double)a4 theta:(double)a5 threshold:(double)a6 minLineLength:(double)a7 maxLineGap:(double)a8
{
  id v10 = a3;
  v28 = 0;
  v29 = 0;
  uint64_t v30 = 0;
  *(void *)&__p[8] = [v10 image];
  *(void *)&__p[16] = 0;
  *(_DWORD *)__p = 16842752;
  LODWORD(v25) = -2113732579;
  v26 = (char *)&v28;
  unint64_t v27 = 0;
  sub_100358AD0((uint64_t)__p, (uint64_t)&v25, 30, a4, a5, 10.0, 15.0);
  uint64_t v25 = 0;
  v26 = 0;
  unint64_t v27 = 0;
  if ((int)((unint64_t)(v29 - v28) >> 4) >= 1)
  {
    uint64_t v11 = 0;
    uint64_t v12 = (v29 - v28) & 0xFFFFFFFF0;
    do
    {
      float32x4_t v20 = *(float32x4_t *)&v28[v11];
      uint64_t v13 = (int32x4_t *)operator new(0x10uLL);
      *(void *)__p = v13;
      *uint64_t v13 = vcvtq_s32_f32(v20);
      *(void *)&__p[8] = v13 + 1;
      *(void *)&__p[16] = v13 + 1;
      int v14 = v26;
      if ((unint64_t)v26 >= v27)
      {
        uint64_t v15 = sub_10000BAA0(&v25, (uint64_t **)__p);
      }
      else
      {
        *(void *)v26 = 0;
        *((void *)v14 + 1) = 0;
        *((void *)v14 + 2) = 0;
        sub_10000BBB8(v14, *(uint64_t **)__p, *(uint64_t **)&__p[8], (uint64_t)(*(void *)&__p[8] - *(void *)__p) >> 3);
        uint64_t v15 = (uint64_t)(v14 + 24);
      }
      v26 = (char *)v15;
      if (*(void *)__p)
      {
        *(void *)&__p[8] = *(void *)__p;
        operator delete(*(void **)__p);
      }
      v11 += 16;
    }
    while (v12 != v11);
  }
  *(_DWORD *)__p = 1124007936;
  memset(&__p[4], 0, 60);
  v22 = &__p[8];
  v23 = v24;
  v24[0] = 0;
  v24[1] = 0;
  __src[0] = 0xF000000140;
  sub_100292534(__p, 2, __src, 0);
  memset(__src, 0, sizeof(__src));
  uint64_t v16 = [[OpenCVWrapperContours alloc] initWithContours:&v25 originalImageSize:&v22];
  v31 = (void **)__src;
  sub_10000B89C(&v31);
  if (*(void *)&__p[56] && atomic_fetch_add((atomic_uint *volatile)(*(void *)&__p[56] + 20), 0xFFFFFFFF) == 1) {
    sub_1002932F4((uint64_t)__p);
  }
  *(void *)&__p[56] = 0;
  memset(&__p[16], 0, 32);
  if (*(int *)&__p[4] >= 1)
  {
    uint64_t v17 = 0;
    v18 = v22;
    do
      *(_DWORD *)&v18[4 * v17++] = 0;
    while (v17 < *(int *)&__p[4]);
  }
  if (v23 != v24) {
    j__free(v23);
  }
  *(void *)__p = &v25;
  sub_10000B89C((void ***)__p);
  if (v28)
  {
    v29 = v28;
    operator delete(v28);
  }

  return v16;
}

+ (id)getMinAreaRectEnclosingPoints:(id)a3
{
  __p = 0;
  v48 = 0;
  v49 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v43 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v44;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v44 != v5) {
          objc_enumerationMutation(v3);
        }
        v7 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        int v8 = [v7 objectAtIndexedSubscript:0];
        [v8 floatValue];
        int v10 = v9;

        uint64_t v11 = [v7 objectAtIndexedSubscript:1];
        [v11 floatValue];
        int v13 = v12;

        int v14 = v48;
        if (v48 >= v49)
        {
          uint64_t v16 = (v48 - (unsigned char *)__p) >> 3;
          unint64_t v17 = v16 + 1;
          if ((unint64_t)(v16 + 1) >> 61) {
            sub_10000B98C();
          }
          uint64_t v18 = v49 - (unsigned char *)__p;
          if ((v49 - (unsigned char *)__p) >> 2 > v17) {
            unint64_t v17 = v18 >> 2;
          }
          if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
            unint64_t v19 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v19 = v17;
          }
          v21 = (char *)sub_10000B9A4((uint64_t)&v49, v19);
          v22 = &v21[8 * v16];
          *(_DWORD *)v22 = v10;
          *((_DWORD *)v22 + 1) = v13;
          v23 = (char *)__p;
          v24 = v48;
          uint64_t v25 = v22;
          while (v24 != v23)
          {
            uint64_t v26 = *((void *)v24 - 1);
            v24 -= 8;
            *((void *)v25 - 1) = v26;
            v25 -= 8;
          }
          uint64_t v15 = v22 + 8;
          __p = v25;
          v48 = v22 + 8;
          v49 = &v21[8 * v20];
          if (v23) {
            operator delete(v23);
          }
        }
        else
        {
          *(_DWORD *)v48 = v10;
          *((_DWORD *)v14 + 1) = v13;
          uint64_t v15 = v14 + 8;
        }
        v48 = v15;
      }
      id v4 = [v3 countByEnumeratingWithState:&v43 objects:v50 count:16];
    }
    while (v4);
  }

  int v39 = -2130509811;
  p_p = &__p;
  uint64_t v41 = 0;
  sub_100386488((uint64_t)&v39, (uint64_t)v42);
  id v27 = [objc_alloc((Class)NSMutableArray) initWithCapacity:0];
  LODWORD(v28) = v42[0];
  v29 = +[NSNumber numberWithFloat:v28];
  [v27 addObject:v29];

  LODWORD(v30) = v42[1];
  v31 = +[NSNumber numberWithFloat:v30];
  [v27 addObject:v31];

  LODWORD(v32) = v42[2];
  v33 = +[NSNumber numberWithFloat:v32];
  [v27 addObject:v33];

  LODWORD(v34) = v42[3];
  v35 = +[NSNumber numberWithFloat:v34];
  [v27 addObject:v35];

  LODWORD(v36) = v42[4];
  v37 = +[NSNumber numberWithFloat:v36];
  [v27 addObject:v37];

  if (__p)
  {
    v48 = (char *)__p;
    operator delete(__p);
  }

  return v27;
}

+ (int)calcHistogramMedianForImage:(id)a3
{
  id v3 = a3;
  int v4 = *((_DWORD *)[v3 image] + 2);
  int v5 = *((_DWORD *)[v3 image] + 3) * v4;
  if (v5 >= 0) {
    int v6 = v5;
  }
  else {
    int v6 = v5 + 1;
  }
  v7 = [v3 image];
  long long v8 = v7[1];
  long long v42 = *v7;
  long long v43 = v8;
  long long v44 = v7[2];
  uint64_t v9 = *((void *)v7 + 7);
  uint64_t v45 = *((void *)v7 + 6);
  uint64_t v46 = v9;
  v47 = (char *)&v42 + 8;
  v48 = v49;
  v49[0] = 0;
  v49[1] = 0;
  if (v9) {
    atomic_fetch_add((atomic_uint *volatile)(v9 + 20), 1u);
  }
  if (*((int *)v7 + 1) > 2)
  {
    DWORD1(v42) = 0;
    sub_1002931A8((uint64_t)&v42, (uint64_t)v7);
  }
  else
  {
    int v10 = (void *)*((void *)v7 + 9);
    uint64_t v11 = v48;
    void *v48 = *v10;
    v11[1] = v10[1];
  }
  int v39 = 0;
  memset(&v35[2], 0, 60);
  double v36 = &v35[3];
  v37 = v38;
  v38[0] = 0;
  v38[1] = 0;
  *(void *)v35 = 0x42FF000000000100;
  v40 = (float *)&v41;
  uint64_t v41 = 0x4380000000000000;
  LODWORD(v31[0]) = 1124007936;
  memset((char *)v31 + 4, 0, 48);
  v31[3] = 0u;
  double v32 = (_DWORD *)v31 + 2;
  v33 = v34;
  v34[0] = 0;
  v34[1] = 0;
  v29 = &v35[1];
  uint64_t v30 = 0;
  int v28 = 16842752;
  int v25 = 33619968;
  uint64_t v26 = v31;
  uint64_t v27 = 0;
  sub_100353B4C((int32x2_t **)&v42, 1, (uint64_t)&v39, (uint64_t)&v28, (uint64_t)&v25, 1u, (uint64_t *)v35, &v40, 1u, 0);
  if (v35[0] < 1)
  {
    int v15 = -1;
  }
  else
  {
    uint64_t v12 = 0;
    int v13 = 0;
    int v14 = v6 >> 1;
    int v15 = -1;
    uint64_t v16 = *(float **)&v31[1];
    do
    {
      unint64_t v17 = v16;
      if ((v31[0] & 0x4000) == 0)
      {
        unint64_t v17 = v16;
        if (*v32 != 1)
        {
          if (v32[1] == 1) {
            unint64_t v17 = (float *)(*(void *)&v31[1] + *(void *)v33 * v12);
          }
          else {
            unint64_t v17 = (float *)(*(void *)&v31[1]
          }
                          + *(void *)v33 * ((int)v12 / SHIDWORD(v31[0]))
                          + 4 * ((int)v12 + -HIDWORD(v31[0]) * ((int)v12 / SHIDWORD(v31[0]))));
        }
      }
      v13 += (uint64_t)rintf(*v17);
      if (v13 > v14) {
        int v15 = v12;
      }
      if (++v12 >= (unint64_t)v35[0]) {
        break;
      }
      ++v16;
    }
    while (v15 < 0);
  }
  if (*((void *)&v31[3] + 1)
    && atomic_fetch_add((atomic_uint *volatile)(*((void *)&v31[3] + 1) + 20), 0xFFFFFFFF) == 1)
  {
    sub_1002932F4((uint64_t)v31);
  }
  *((void *)&v31[3] + 1) = 0;
  memset(&v31[1], 0, 32);
  if (SDWORD1(v31[0]) >= 1)
  {
    uint64_t v18 = 0;
    unint64_t v19 = v32;
    do
      v19[v18++] = 0;
    while (v18 < SDWORD1(v31[0]));
  }
  if (v33 != v34) {
    j__free(v33);
  }
  if (*(void *)&v35[15] && atomic_fetch_add((atomic_uint *volatile)(*(void *)&v35[15] + 20), 0xFFFFFFFF) == 1) {
    sub_1002932F4((uint64_t)&v35[1]);
  }
  *(void *)&v35[15] = 0;
  memset(&v35[5], 0, 32);
  if (v35[2] >= 1)
  {
    uint64_t v20 = 0;
    v21 = v36;
    do
      v21[v20++] = 0;
    while (v20 < v35[2]);
  }
  if (v37 != v38) {
    j__free(v37);
  }
  if (v46 && atomic_fetch_add((atomic_uint *volatile)(v46 + 20), 0xFFFFFFFF) == 1) {
    sub_1002932F4((uint64_t)&v42);
  }
  uint64_t v46 = 0;
  long long v43 = 0u;
  long long v44 = 0u;
  if (SDWORD1(v42) >= 1)
  {
    uint64_t v22 = 0;
    v23 = v47;
    do
      *(_DWORD *)&v23[4 * v22++] = 0;
    while (v22 < SDWORD1(v42));
  }
  if (v48 != v49) {
    j__free(v48);
  }

  return v15;
}

+ (id)makeUIImageFromCVImage:(id)a3
{
  id v3 = a3;
  int v4 = sub_1002EB1B4((uint64_t)[v3 image]);

  return v4;
}

+ (id)findContoursInImage:(id)a3
{
  id v3 = a3;
  memset(v11, 0, sizeof(v11));
  LODWORD(v10[0]) = 50397184;
  v10[1] = (void **)[v3 image];
  v10[2] = 0;
  int v7 = -2113667060;
  long long v8 = v11;
  uint64_t v9 = 0;
  uint64_t v6 = 0;
  sub_100319D34((uint64_t)v10, &v7, 0, 1, &v6);
  int v4 = -[OpenCVWrapperContours initWithContours:originalImageSize:]([OpenCVWrapperContours alloc], "initWithContours:originalImageSize:", v11, (char *)[v3 image] + 64);
  v10[0] = (void **)v11;
  sub_10000B89C(v10);

  return v4;
}

+ (void)filterContours:(id)a3 forMinEdgeLength:(int)a4
{
  id v5 = a3;
  sub_10000A588((uint64_t)[v5 contours], a4);
}

+ (id)makeCVImageFromContours:(id)a3 lineThickness:(int)a4 color:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  uint64_t v19 = *(void *)[v7 originalImageSize];
  sub_100290470(&v19, 0x10u, (uint64_t)v20);
  LODWORD(v21[0]) = 1124007936;
  memset((char *)v21 + 4, 0, 32);
  memset((char *)&v21[4] + 4, 0, 28);
  uint64_t v22 = &v21[1];
  v23 = v24;
  v24[0] = 0;
  v24[1] = 0;
  (*(void (**)(void, double *, void *, uint64_t))(**(void **)&v20[0] + 24))(*(void *)&v20[0], v20, v21, 0xFFFFFFFFLL);
  sub_10000B6BC((uint64_t)v20);
  int v16 = 50397184;
  unint64_t v17 = v21;
  uint64_t v18 = 0;
  id v14 = [v7 contours];
  uint64_t v15 = 0;
  int v13 = -2130444276;
  double v27 = 0.0;
  double v28 = 0.0;
  uint64_t v25 = 0;
  double v26 = 0.0;
  [v8 getRed:&v28 green:&v27 blue:&v26 alpha:&v25];
  v20[0] = v28 * 255.0;
  v20[1] = v27 * 255.0;
  void v20[2] = v26 * 255.0;
  v20[3] = 0.0;
  sub_100329D1C((uint64_t)&v16, (uint64_t)&v13, 0, v20, a4, 8, 0);
  uint64_t v9 = [[OpenCVWrapperImage alloc] initWithImage:v21];
  if (v21[7] && atomic_fetch_add((atomic_uint *volatile)(v21[7] + 20), 0xFFFFFFFF) == 1) {
    sub_1002932F4((uint64_t)v21);
  }
  v21[7] = 0;
  memset(&v21[2], 0, 32);
  if (SHIDWORD(v21[0]) >= 1)
  {
    uint64_t v10 = 0;
    uint64_t v11 = v22;
    do
      *((_DWORD *)v11 + v10++) = 0;
    while (v10 < SHIDWORD(v21[0]));
  }
  if (v23 != v24) {
    j__free(v23);
  }

  return v9;
}

+ (id)makeCVImageFromUniqueContours:(id)a3 lineThickness:(int)a4
{
  id v5 = a3;
  uint64_t v18 = *(void *)[v5 originalImageSize];
  sub_100290470(&v18, 0x10u, (uint64_t)v19);
  LODWORD(v20[0]) = 1124007936;
  memset((char *)v20 + 4, 0, 32);
  memset((char *)&v20[4] + 4, 0, 28);
  v21 = &v20[1];
  uint64_t v22 = v23;
  v23[0] = 0;
  v23[1] = 0;
  (*(void (**)(void, double *, void *, uint64_t))(**(void **)&v19[0] + 24))(*(void *)&v19[0], v19, v20, 0xFFFFFFFFLL);
  sub_10000B6BC((uint64_t)v19);
  uint64_t v6 = (uint64_t **)[v5 contours];
  id v7 = *v6;
  id v8 = v6[1];
  if (*v6 != v8)
  {
    unint64_t v9 = 0xFFFFFFFFLL;
    do
    {
      double v10 = (double)((HIDWORD(v9) - 130063606 * (int)v9) % 0xFFu);
      unint64_t v11 = ((unint64_t)(HIDWORD(v9) + 4164903690 * v9) >> 32)
          + 4164903690 * (HIDWORD(v9) - 130063606 * v9);
      unint64_t v9 = HIDWORD(v11) + 4164903690 * v11;
      v19[0] = v10;
      v19[1] = (double)(v11 % 0xFF);
      v19[2] = (double)((HIDWORD(v11) - 130063606 * (int)v11) % 0xFFu);
      v19[3] = 0.0;
      uint64_t v17 = *v7;
      int v16 = 0;
      if ((unint64_t)(v7[1] - v17) >= 0x3FFFFFFF1) {
        __assert_rtn("safeSignedCast", "OpenCVWrapperInternal.h", 67, "value < INT_MAX && \"size_t outside of valid range to cast to int\"");
      }
      sub_1003299E4((unsigned int *)v20, (uint64_t)&v17, (uint64_t)&v16, 1, 0, v19, a4, 8, 0);
      v7 += 3;
    }
    while (v7 != v8);
  }
  uint64_t v12 = [[OpenCVWrapperImage alloc] initWithImage:v20];
  if (v20[7] && atomic_fetch_add((atomic_uint *volatile)(v20[7] + 20), 0xFFFFFFFF) == 1) {
    sub_1002932F4((uint64_t)v20);
  }
  v20[7] = 0;
  memset(&v20[2], 0, 32);
  if (SHIDWORD(v20[0]) >= 1)
  {
    uint64_t v13 = 0;
    id v14 = v21;
    do
      *((_DWORD *)v14 + v13++) = 0;
    while (v13 < SHIDWORD(v20[0]));
  }
  if (v22 != v23) {
    j__free(v22);
  }

  return v12;
}

+ (id)findCornersAndFilterContours:(id)a3 forMaxEdgeTurns:(int)a4 forTurningPointMargin:(int)a5
{
  id v7 = a3;
  id v8 = (__n128 **)[v7 contours];
  unint64_t v9 = objc_alloc_init(OpenCVWrapperCorners);
  uint64_t v17 = 0;
  uint64_t v18 = 0;
  __p = 0;
  if (a4 < 0) {
    __assert_rtn("safeUnsignedCast", "OpenCVWrapperInternal.h", 73, "value >= 0 && \"int outside of valid range to cast to size_t\"");
  }
  double v10 = *v8;
  unint64_t v11 = v8[1];
  if (*v8 == v11)
  {
LABEL_6:
    uint64_t v13 = (uint64_t)v11;
  }
  else
  {
    unint64_t v12 = a4;
    while (1)
    {
      uint64_t v17 = (char *)__p;
      sub_10000B1AC((uint64_t)&__p, v10, [v7 originalImageSize], a5);
      if (0xAAAAAAAAAAAAAAABLL * ((v17 - (unsigned char *)__p) >> 3) > a4) {
        break;
      }
      sub_10000BEA4((long long *)__p, (long long *)v17, (void **)[(OpenCVWrapperCorners *)v9 corners]);
      double v10 = (__n128 *)((char *)v10 + 24);
      if (v10 == v11) {
        goto LABEL_6;
      }
    }
    uint64_t v13 = (uint64_t)v11;
    if (v10 != v11)
    {
      uint64_t v15 = (__n128 *)((char *)v10 + 24);
      uint64_t v13 = (uint64_t)v10;
      while (v15 != v11)
      {
        uint64_t v17 = (char *)__p;
        sub_10000B1AC((uint64_t)&__p, v15, [v7 originalImageSize], a5);
        if (0xAAAAAAAAAAAAAAABLL * ((v17 - (unsigned char *)__p) >> 3) <= v12)
        {
          sub_10000BEA4((long long *)__p, (long long *)v17, (void **)[(OpenCVWrapperCorners *)v9 corners]);
          sub_10000C03C(v13, v15);
          v13 += 24;
        }
        uint64_t v15 = (__n128 *)((char *)v15 + 24);
      }
    }
  }
  sub_10000AE00((uint64_t)v8, v13, v8[1]);
  if (__p)
  {
    uint64_t v17 = (char *)__p;
    operator delete(__p);
  }

  return v9;
}

+ (id)samplePointsInContour:()vector<cv:(std:(int)a4 :allocator<cv::Point_<int>>> *)a3 :Point_<int> numberOfPoints:
{
  uint64_t v6 = objc_opt_new();
  uint64_t v20 = a3;
  uint64_t v21 = 0;
  int v19 = -2130509812;
  sub_100386D98((uint64_t)&v19, (unint64_t)v22);
  double v7 = sqrt((double)(v24 * v23 / a4));
  double v8 = (double)v23 / v7;
  if (v8 > 0.0)
  {
    int v9 = 0;
    double v10 = (double)v24 / v7;
    double v11 = 0.0;
    do
    {
      if (v10 > 0.0)
      {
        double v12 = 0.0;
        int v13 = 1;
        do
        {
          int v14 = (int)((double)v22[0] + v11 * v7);
          int v15 = (int)((double)v22[1] + v12 * v7);
          uint64_t v20 = a3;
          uint64_t v21 = 0;
          int v19 = -2130509812;
          v18[0] = (float)v14;
          v18[1] = (float)v15;
          if (sub_1003534F4((uint64_t)&v19, v18, 0) >= 0.0)
          {
            int v16 = +[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", (double)v14, (double)v15);
            [v6 addObject:v16];
          }
          double v12 = (double)v13++;
        }
        while (v10 > v12);
      }
      double v11 = (double)++v9;
    }
    while (v8 > (double)v9);
  }

  return v6;
}

+ (CGImage)createCgImageFromCVMat:(Mat *)a3
{
  data = a3->data;
  uint64_t dims = a3->dims;
  if ((int)dims < 1)
  {
    unint64_t v6 = 0;
    goto LABEL_7;
  }
  unint64_t v6 = a3->step.p[(dims - 1)];
  if (dims < 3)
  {
LABEL_7:
    uint64_t v8 = a3->cols * (uint64_t)a3->rows;
    goto LABEL_8;
  }
  p = a3->size.p;
  uint64_t v8 = 1;
  do
  {
    uint64_t v9 = *p++;
    v8 *= v9;
    --dims;
  }
  while (dims);
LABEL_8:
  CFDataRef v10 = +[NSData dataWithBytes:data length:v8 * v6];
  int v11 = a3->dims;
  BOOL v12 = __OFSUB__(v11, 1);
  int v13 = v11 - 1;
  if (v13 < 0 != v12 || a3->step.p[v13] != 1) {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceRGB();
  }
  else {
    CGColorSpaceRef DeviceRGB = CGColorSpaceCreateDeviceGray();
  }
  int v15 = DeviceRGB;
  int v16 = CGDataProviderCreateWithCFData(v10);
  size_t cols = a3->cols;
  if ((cols & 0x80000000) != 0 || (size_t rows = a3->rows, (rows & 0x80000000) != 0)) {
    __assert_rtn("safeUnsignedCast", "OpenCVWrapperInternal.h", 73, "value >= 0 && \"int outside of valid range to cast to size_t\"");
  }
  int v19 = a3->dims;
  uint64_t v20 = a3->step.p;
  BOOL v12 = __OFSUB__(v19, 1);
  int v21 = v19 - 1;
  if (v21 < 0 != v12) {
    size_t v22 = 0;
  }
  else {
    size_t v22 = 8 * v20[v21];
  }
  int v23 = CGImageCreate(cols, rows, 8uLL, v22, *v20, v15, 0, v16, 0, 0, kCGRenderingIntentDefault);
  CGDataProviderRelease(v16);
  CGColorSpaceRelease(v15);

  return v23;
}

@end