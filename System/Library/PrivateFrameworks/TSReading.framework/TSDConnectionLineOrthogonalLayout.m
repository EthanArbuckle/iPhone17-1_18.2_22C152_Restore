@interface TSDConnectionLineOrthogonalLayout
- (BOOL)canEndpointsCoincide;
- (CGPoint)axisSnapPoint:(CGPoint)a3 toXs:()vector<double toYs:(std:()vector<double :(std:(double)a6 :allocator<double>> *)a5 allocator<double>> *)a4 withThreshold:;
- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6;
- (CGPoint)getControlKnobPosition:(unint64_t)a3;
- (CGRect)orthoRectOfLayout:(id)a3 outset:(double)a4;
- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3];
- (void)addEndpointSnapsToXs:(void *)a3 andYs:(void *)a4;
@end

@implementation TSDConnectionLineOrthogonalLayout

- (CGRect)orthoRectOfLayout:(id)a3 outset:(double)a4
{
  [a3 centerForConnecting];
  double v8 = v7;
  double v10 = v9;
  [a3 boundsForStandardKnobs];
  uint64_t v13 = 0;
  if (v11 <= v12) {
    double v14 = v12;
  }
  else {
    double v14 = v11;
  }
  double v15 = a4 + 10.0 + v14;
  char v34 = 1;
  CGFloat v16 = 0.0;
  double v17 = v8;
  CGFloat v18 = v10;
  CGFloat v19 = 0.0;
  do
  {
    id v20 = +[TSDBezierPath bezierPath];
    objc_msgSend(v20, "moveToPoint:", v8, v10);
    double v21 = TSDDirectionDelta(v13);
    objc_msgSend(v20, "relativeLineToPoint:", TSDMultiplyPointScalar(v21, v22, v15));
    id v23 = [(TSDConnectionLineAbstractLayout *)self clipPath:v20 onLayout:a3 outset:0 reversed:&v34 isValid:a4];
    if (v23) {
      BOOL v24 = v34 == 0;
    }
    else {
      BOOL v24 = 1;
    }
    if (!v24)
    {
      [v23 point];
      double v17 = TSDGrowRectToPoint(v17, v18, v16, v19, v25, v26);
      CGFloat v18 = v27;
      CGFloat v16 = v28;
      CGFloat v19 = v29;
    }
    ++v13;
  }
  while (v13 != 4);
  double v30 = v17;
  double v31 = v18;
  double v32 = v16;
  double v33 = v19;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (id)createConnectedPathFrom:(id)a3 to:(id)a4 withControlPoints:(CGPoint)a5[3]
{
  unint64_t v9 = 0;
  uint64_t v125 = *MEMORY[0x263EF8340];
  do
  {
    double v10 = TSDMultiplyPointScalar(a5[v9 / 2].x, a5[v9 / 2].y, 10.0);
    double v11 = &v122[v9];
    *double v11 = v10;
    *((void *)v11 + 1) = v12;
    v9 += 2;
  }
  while (v9 != 6);
  long long v120 = 0u;
  long long v121 = 0u;
  double v13 = v122[0];
  TSDIntRectMake((uint64_t)v122[0], (uint64_t)v122[1], 0, 0, &v120);
  long long v118 = 0u;
  long long v119 = 0u;
  double v14 = v123;
  TSDIntRectMake((uint64_t)v123, (uint64_t)v124, 0, 0, &v118);
  long long v109 = v120;
  long long v110 = v121;
  uint64_t v15 = TSDIntPointFromCGPoint(v13);
  uint64_t v17 = v16;
  uint64_t v111 = v15;
  uint64_t v112 = v16;
  long long v113 = 0u;
  long long v114 = 0u;
  long long v115 = 0u;
  long long v116 = 0u;
  uint64_t v117 = 0;
  long long v100 = v118;
  long long v101 = v119;
  uint64_t v18 = TSDIntPointFromCGPoint(v14);
  uint64_t v20 = v19;
  uint64_t v102 = v18;
  uint64_t v103 = v19;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  uint64_t v108 = 0;
  if (a3)
  {
    [(TSDConnectionLineAbstractLayout *)self outsetFrom];
    -[TSDConnectionLineOrthogonalLayout orthoRectOfLayout:outset:](self, "orthoRectOfLayout:outset:", a3);
    objc_msgSend(a3, "centerForConnecting", TSDIntRectFromCGRectWithScale((uint64_t *)&v109, v21, v22, v23, v24, 10.0));
    TSDIntPointFromCGPointWithScale(v25, v26, 10.0);
    uint64_t v15 = v27;
    uint64_t v17 = v28;
    uint64_t v111 = v27;
    uint64_t v112 = v28;
    v99[0] = v109;
    v99[1] = v110;
    TSDExpandShapeRectToIncludePoint((uint64_t)v99, v27, v28, &v109);
    if ((uint64_t)v110 >= 1 && *((uint64_t *)&v110 + 1) >= 1) {
      *(void *)&long long v113 = 200;
    }
  }
  if (a4)
  {
    [(TSDConnectionLineAbstractLayout *)self outsetTo];
    -[TSDConnectionLineOrthogonalLayout orthoRectOfLayout:outset:](self, "orthoRectOfLayout:outset:", a4);
    objc_msgSend(a4, "centerForConnecting", TSDIntRectFromCGRectWithScale((uint64_t *)&v100, v29, v30, v31, v32, 10.0));
    TSDIntPointFromCGPointWithScale(v33, v34, 10.0);
    uint64_t v18 = v35;
    uint64_t v20 = v36;
    uint64_t v102 = v35;
    uint64_t v103 = v36;
    v98[0] = v100;
    v98[1] = v101;
    TSDExpandShapeRectToIncludePoint((uint64_t)v98, v35, v36, &v100);
    if ((uint64_t)v101 >= 1 && *((uint64_t *)&v101 + 1) >= 1) {
      *(void *)&long long v104 = 200;
    }
  }
  self->super.mVisibleLine = 1;
  v97 = 0;
  __p = 0;
  v93 = 0;
  unint64_t v94 = 0;
  v37 = (double *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v97, 1uLL);
  double *v37 = (double)v15;
  v95 = v37;
  v97 = &v37[v38];
  double v39 = (double)v17;
  v96 = v37 + 1;
  v40 = v93;
  if ((unint64_t)v93 >= v94)
  {
    v42 = (double *)__p;
    uint64_t v43 = ((char *)v93 - (unsigned char *)__p) >> 3;
    unint64_t v44 = v43 + 1;
    if ((unint64_t)(v43 + 1) >> 61) {
      abort();
    }
    uint64_t v45 = v94 - (void)__p;
    if ((uint64_t)(v94 - (void)__p) >> 2 > v44) {
      unint64_t v44 = v45 >> 2;
    }
    if ((unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v46 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v46 = v44;
    }
    if (v46)
    {
      v47 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v94, v46);
      v42 = (double *)__p;
      v40 = v93;
    }
    else
    {
      v47 = 0;
    }
    v48 = (double *)&v47[8 * v43];
    v49 = &v47[8 * v46];
    double *v48 = v39;
    v41 = v48 + 1;
    while (v40 != v42)
    {
      uint64_t v50 = *((void *)v40-- - 1);
      *((void *)v48-- - 1) = v50;
    }
    __p = v48;
    v93 = v41;
    unint64_t v94 = (unint64_t)v49;
    if (v42) {
      operator delete(v42);
    }
  }
  else
  {
    double *v93 = v39;
    v41 = v40 + 1;
  }
  v93 = v41;
  double v51 = (double)v18;
  v52 = v96;
  if (v96 >= v97)
  {
    v54 = (double *)v95;
    uint64_t v55 = ((char *)v96 - (unsigned char *)v95) >> 3;
    unint64_t v56 = v55 + 1;
    if ((unint64_t)(v55 + 1) >> 61) {
      abort();
    }
    uint64_t v57 = (char *)v97 - (unsigned char *)v95;
    if (((char *)v97 - (unsigned char *)v95) >> 2 > v56) {
      unint64_t v56 = v57 >> 2;
    }
    if ((unint64_t)v57 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v58 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v58 = v56;
    }
    if (v58)
    {
      v59 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v97, v58);
      v54 = (double *)v95;
      v52 = v96;
    }
    else
    {
      v59 = 0;
    }
    v60 = (double *)&v59[8 * v55];
    v61 = (double *)&v59[8 * v58];
    double *v60 = v51;
    v53 = v60 + 1;
    while (v52 != v54)
    {
      uint64_t v62 = *((void *)v52-- - 1);
      *((void *)v60-- - 1) = v62;
    }
    v95 = v60;
    v96 = v53;
    v97 = v61;
    if (v54) {
      operator delete(v54);
    }
  }
  else
  {
    double *v96 = v51;
    v53 = v52 + 1;
  }
  v96 = v53;
  double v63 = (double)v20;
  v64 = v93;
  if ((unint64_t)v93 >= v94)
  {
    v66 = (double *)__p;
    uint64_t v67 = ((char *)v93 - (unsigned char *)__p) >> 3;
    unint64_t v68 = v67 + 1;
    if ((unint64_t)(v67 + 1) >> 61) {
      abort();
    }
    uint64_t v69 = v94 - (void)__p;
    if ((uint64_t)(v94 - (void)__p) >> 2 > v68) {
      unint64_t v68 = v69 >> 2;
    }
    if ((unint64_t)v69 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v70 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v70 = v68;
    }
    if (v70)
    {
      v71 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v94, v70);
      v66 = (double *)__p;
      v64 = v93;
    }
    else
    {
      v71 = 0;
    }
    v72 = (double *)&v71[8 * v67];
    v73 = &v71[8 * v70];
    double *v72 = v63;
    v65 = v72 + 1;
    while (v64 != v66)
    {
      uint64_t v74 = *((void *)v64-- - 1);
      *((void *)v72-- - 1) = v74;
    }
    __p = v72;
    v93 = v65;
    unint64_t v94 = (unint64_t)v73;
    if (v66) {
      operator delete(v66);
    }
  }
  else
  {
    double *v93 = v63;
    v65 = v64 + 1;
  }
  v93 = v65;
  double v75 = v122[2];
  double v76 = v122[3];
  __dst = 0;
  uint64_t v91 = 0;
  v89 = 0;
  v77 = v95;
  int64_t v78 = (char *)v96 - (unsigned char *)v95;
  if (v96 != v95)
  {
    std::vector<unsigned long>::__vallocate[abi:nn180100](&v89, v78 >> 3);
    v79 = (char *)__dst;
    memmove(__dst, v77, v78);
    __dst = &v79[8 * (v78 >> 3)];
    v65 = v93;
  }
  v86 = 0;
  v87 = 0;
  uint64_t v88 = 0;
  v80 = __p;
  int64_t v81 = (char *)v65 - (unsigned char *)__p;
  if (v65 != __p)
  {
    std::vector<unsigned long>::__vallocate[abi:nn180100](&v86, v81 >> 3);
    v82 = (char *)v87;
    memmove(v87, v80, v81);
    v87 = &v82[8 * (v81 >> 3)];
  }
  -[TSDConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v89, &v86, v75, v76, 20.0);
  double v84 = v83;
  if (v86)
  {
    v87 = v86;
    operator delete(v86);
  }
  if (v89)
  {
    __dst = v89;
    operator delete(v89);
  }
  TSDIntPointFromCGPoint(v84);
  routePath();
}

- (CGPoint)controlPointForPointA:(CGPoint)a3 pointB:(CGPoint)a4 andOriginalA:(CGPoint)a5 originalB:(CGPoint)a6
{
  objc_opt_class();
  if (!self->super.super.mResizePathSource) {
    objc_msgSend(-[TSDShapeLayout shapeInfo](self, "shapeInfo"), "pathSource");
  }
  double v7 = (void *)TSUDynamicCast();
  mResizeInfoGeometry = self->super.super.mResizeInfoGeometry;
  if (mResizeInfoGeometry)
  {
    long long v15 = 0u;
    long long v17 = 0u;
    long long v13 = 0u;
LABEL_6:
    [(TSDInfoGeometry *)mResizeInfoGeometry transform];
    goto LABEL_7;
  }
  mResizeInfoGeometry = (TSDInfoGeometry *)[(TSDInfo *)[(TSDLayout *)self info] geometry];
  long long v15 = 0u;
  long long v17 = 0u;
  long long v13 = 0u;
  if (mResizeInfoGeometry) {
    goto LABEL_6;
  }
LABEL_7:
  objc_msgSend(v7, "getControlKnobPosition:", 12, v13, v15, v17);
  float64x2_t v11 = vaddq_f64(v18, vmlaq_n_f64(vmulq_n_f64(v16, v9), v14, v10));
  double v12 = v11.f64[1];
  result.x = v11.f64[0];
  result.y = v12;
  return result;
}

- (BOOL)canEndpointsCoincide
{
  return 1;
}

- (CGPoint)axisSnapPoint:(CGPoint)a3 toXs:()vector<double toYs:(std:()vector<double :(std:(double)a6 :allocator<double>> *)a5 allocator<double>> *)a4 withThreshold:
{
  begin = a4->__begin_;
  end = a4->__end_;
  if (a4->__begin_ == end)
  {
    double v8 = 1.79769313e308;
  }
  else
  {
    double v8 = 1.79769313e308;
    do
    {
      double v9 = *begin++;
      double v10 = a3.x - v9;
      double v11 = -v8;
      if (v8 >= 0.0) {
        double v11 = v8;
      }
      double v12 = -v10;
      if (v10 >= 0.0) {
        double v12 = v10;
      }
      if (v11 >= v12) {
        double v8 = v10;
      }
    }
    while (begin != end);
  }
  long long v13 = a5->__begin_;
  float64x2_t v14 = a5->__end_;
  if (a5->__begin_ == v14)
  {
    double v15 = 1.79769313e308;
  }
  else
  {
    double v15 = 1.79769313e308;
    do
    {
      double v16 = *v13++;
      double v17 = a3.y - v16;
      double v18 = -v15;
      if (v15 >= 0.0) {
        double v18 = v15;
      }
      double v19 = -v17;
      if (v17 >= 0.0) {
        double v19 = v17;
      }
      if (v18 >= v19) {
        double v15 = v17;
      }
    }
    while (v13 != v14);
  }
  double v20 = -v8;
  if (v8 >= 0.0) {
    double v20 = v8;
  }
  if (v20 >= a6) {
    double v8 = 0.0;
  }
  double v21 = a3.x - v8;
  double v22 = -v15;
  if (v15 >= 0.0) {
    double v22 = v15;
  }
  if (v22 >= a6) {
    double v23 = 0.0;
  }
  else {
    double v23 = v15;
  }
  double v24 = a3.y - v23;
  result.y = v24;
  result.x = v21;
  return result;
}

- (void)addEndpointSnapsToXs:(void *)a3 andYs:(void *)a4
{
  mConnectedFrom = self->super.mConnectedFrom;
  if (mConnectedFrom
    && (double v8 = [(TSDAbstractLayout *)mConnectedFrom parent], v8 == [(TSDAbstractLayout *)self parent]))
  {
    double v9 = self->super.mConnectedFrom;
  }
  else
  {
    double v9 = 0;
  }
  mConnectedTo = self->super.mConnectedTo;
  if (mConnectedTo
    && (double v11 = [(TSDAbstractLayout *)mConnectedTo parent], v11 == [(TSDAbstractLayout *)self parent]))
  {
    double v12 = self->super.mConnectedTo;
  }
  else
  {
    double v12 = 0;
  }
  long long v13 = [(TSDConnectionLineAbstractLayout *)self connectedPathSource];
  float64x2_t v14 = v13;
  if (v9)
  {
    [(TSDLayout *)v9 centerForConnecting];
    double v16 = v15;
    double v18 = v17;
    if (v12)
    {
LABEL_11:
      [(TSDLayout *)v12 centerForConnecting];
      double v20 = v19;
      double v22 = v21;
      goto LABEL_20;
    }
  }
  else
  {
    [(TSDConnectionLinePathSource *)v13 getControlKnobPosition:10];
    double v24 = v23;
    double v26 = v25;
    id v27 = [(TSDLayout *)self pureGeometry];
    if (v27)
    {
      [v27 transform];
      double v28 = v100;
      double v29 = v99;
      double v30 = v102;
      double v31 = v101;
      double v32 = v104;
      double v33 = v103;
    }
    else
    {
      double v32 = 0.0;
      double v30 = 0.0;
      double v28 = 0.0;
      double v33 = 0.0;
      double v31 = 0.0;
      double v29 = 0.0;
    }
    double v16 = v33 + v26 * v31 + v29 * v24;
    double v18 = v32 + v26 * v30 + v28 * v24;
    if (v12) {
      goto LABEL_11;
    }
  }
  [(TSDConnectionLinePathSource *)v14 getControlKnobPosition:11];
  double v35 = v34;
  double v37 = v36;
  id v38 = [(TSDLayout *)self pureGeometry];
  if (v38)
  {
    [v38 transform];
    double v39 = v94;
    double v40 = v93;
    double v41 = v96;
    double v42 = v95;
    double v43 = v98;
    double v44 = v97;
  }
  else
  {
    double v43 = 0.0;
    double v41 = 0.0;
    double v39 = 0.0;
    double v44 = 0.0;
    double v42 = 0.0;
    double v40 = 0.0;
  }
  double v20 = v44 + v37 * v42 + v40 * v35;
  double v22 = v43 + v37 * v41 + v39 * v35;
LABEL_20:
  unint64_t v45 = *((void *)a3 + 2);
  unint64_t v46 = (double *)*((void *)a3 + 1);
  if ((unint64_t)v46 >= v45)
  {
    v48 = *(double **)a3;
    uint64_t v49 = ((uint64_t)v46 - *(void *)a3) >> 3;
    unint64_t v50 = v49 + 1;
    if ((unint64_t)(v49 + 1) >> 61) {
      goto LABEL_85;
    }
    uint64_t v51 = v45 - (void)v48;
    if (v51 >> 2 > v50) {
      unint64_t v50 = v51 >> 2;
    }
    if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v52 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v52 = v50;
    }
    if (v52)
    {
      v53 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)a3 + 16, v52);
      v48 = *(double **)a3;
      unint64_t v46 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v53 = 0;
    }
    v54 = (double *)&v53[8 * v49];
    uint64_t v55 = &v53[8 * v52];
    double *v54 = v16;
    v47 = v54 + 1;
    while (v46 != v48)
    {
      uint64_t v56 = *((void *)v46-- - 1);
      *((void *)v54-- - 1) = v56;
    }
    *(void *)a3 = v54;
    *((void *)a3 + 1) = v47;
    *((void *)a3 + 2) = v55;
    if (v48) {
      operator delete(v48);
    }
  }
  else
  {
    *unint64_t v46 = v16;
    v47 = v46 + 1;
  }
  *((void *)a3 + 1) = v47;
  unint64_t v57 = *((void *)a4 + 2);
  unint64_t v58 = (double *)*((void *)a4 + 1);
  if ((unint64_t)v58 >= v57)
  {
    v60 = *(double **)a4;
    uint64_t v61 = ((uint64_t)v58 - *(void *)a4) >> 3;
    unint64_t v62 = v61 + 1;
    if ((unint64_t)(v61 + 1) >> 61) {
      goto LABEL_85;
    }
    uint64_t v63 = v57 - (void)v60;
    if (v63 >> 2 > v62) {
      unint64_t v62 = v63 >> 2;
    }
    if ((unint64_t)v63 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v64 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v64 = v62;
    }
    if (v64)
    {
      v65 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)a4 + 16, v64);
      v60 = *(double **)a4;
      unint64_t v58 = (double *)*((void *)a4 + 1);
    }
    else
    {
      v65 = 0;
    }
    v66 = (double *)&v65[8 * v61];
    uint64_t v67 = &v65[8 * v64];
    double *v66 = v18;
    v59 = v66 + 1;
    while (v58 != v60)
    {
      uint64_t v68 = *((void *)v58-- - 1);
      *((void *)v66-- - 1) = v68;
    }
    *(void *)a4 = v66;
    *((void *)a4 + 1) = v59;
    *((void *)a4 + 2) = v67;
    if (v60) {
      operator delete(v60);
    }
  }
  else
  {
    *unint64_t v58 = v18;
    v59 = v58 + 1;
  }
  *((void *)a4 + 1) = v59;
  unint64_t v70 = (double *)*((void *)a3 + 1);
  unint64_t v69 = *((void *)a3 + 2);
  if ((unint64_t)v70 >= v69)
  {
    v72 = *(double **)a3;
    uint64_t v73 = ((uint64_t)v70 - *(void *)a3) >> 3;
    unint64_t v74 = v73 + 1;
    if ((unint64_t)(v73 + 1) >> 61) {
      goto LABEL_85;
    }
    uint64_t v75 = v69 - (void)v72;
    if (v75 >> 2 > v74) {
      unint64_t v74 = v75 >> 2;
    }
    if ((unint64_t)v75 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v76 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v76 = v74;
    }
    if (v76)
    {
      v77 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)a3 + 16, v76);
      v72 = *(double **)a3;
      unint64_t v70 = (double *)*((void *)a3 + 1);
    }
    else
    {
      v77 = 0;
    }
    int64_t v78 = (double *)&v77[8 * v73];
    v79 = &v77[8 * v76];
    *int64_t v78 = v20;
    v71 = v78 + 1;
    while (v70 != v72)
    {
      uint64_t v80 = *((void *)v70-- - 1);
      *((void *)v78-- - 1) = v80;
    }
    *(void *)a3 = v78;
    *((void *)a3 + 1) = v71;
    *((void *)a3 + 2) = v79;
    if (v72) {
      operator delete(v72);
    }
  }
  else
  {
    *unint64_t v70 = v20;
    v71 = v70 + 1;
  }
  *((void *)a3 + 1) = v71;
  v82 = (double *)*((void *)a4 + 1);
  unint64_t v81 = *((void *)a4 + 2);
  if ((unint64_t)v82 < v81)
  {
    double *v82 = v22;
    double v83 = v82 + 1;
    goto LABEL_84;
  }
  double v84 = *(double **)a4;
  uint64_t v85 = ((uint64_t)v82 - *(void *)a4) >> 3;
  unint64_t v86 = v85 + 1;
  if ((unint64_t)(v85 + 1) >> 61) {
LABEL_85:
  }
    abort();
  uint64_t v87 = v81 - (void)v84;
  if (v87 >> 2 > v86) {
    unint64_t v86 = v87 >> 2;
  }
  if ((unint64_t)v87 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v88 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v88 = v86;
  }
  if (v88)
  {
    v89 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)a4 + 16, v88);
    double v84 = *(double **)a4;
    v82 = (double *)*((void *)a4 + 1);
  }
  else
  {
    v89 = 0;
  }
  v90 = (double *)&v89[8 * v85];
  uint64_t v91 = &v89[8 * v88];
  double *v90 = v22;
  double v83 = v90 + 1;
  while (v82 != v84)
  {
    uint64_t v92 = *((void *)v82-- - 1);
    *((void *)v90-- - 1) = v92;
  }
  *(void *)a4 = v90;
  *((void *)a4 + 1) = v83;
  *((void *)a4 + 2) = v91;
  if (v84) {
    operator delete(v84);
  }
LABEL_84:
  *((void *)a4 + 1) = v83;
}

- (CGPoint)getControlKnobPosition:(unint64_t)a3
{
  [(TSDConnectionLinePathSource *)[(TSDConnectionLineAbstractLayout *)self connectedPathSource] getControlKnobPosition:a3];
  double v7 = v6;
  if (a3 == 12)
  {
    double v28 = v5.f64[0];
    double v44 = 0;
    unint64_t v45 = 0;
    uint64_t v46 = 0;
    double v41 = 0;
    double v42 = 0;
    uint64_t v43 = 0;
    [(TSDConnectionLineOrthogonalLayout *)self addEndpointSnapsToXs:&v44 andYs:&v41];
    memset(&v40, 0, sizeof(v40));
    id v8 = [(TSDLayout *)self pureGeometry];
    if (v8)
    {
      [v8 transform];
      double b = v40.b;
      double a = v40.a;
      double d = v40.d;
      double c = v40.c;
      double ty = v40.ty;
      double tx = v40.tx;
    }
    else
    {
      memset(&v40, 0, sizeof(v40));
      double ty = 0.0;
      double tx = 0.0;
      double d = 0.0;
      double c = 0.0;
      double b = 0.0;
      double a = 0.0;
    }
    double v37 = 0;
    __dst = 0;
    uint64_t v39 = 0;
    double v15 = v44;
    int64_t v16 = v45 - v44;
    if (v45 != v44)
    {
      std::vector<unsigned long>::__vallocate[abi:nn180100](&v37, v16 >> 3);
      double v17 = (char *)__dst;
      memmove(__dst, v15, v16);
      __dst = &v17[8 * (v16 >> 3)];
    }
    __p = 0;
    double v35 = 0;
    uint64_t v36 = 0;
    double v18 = v41;
    int64_t v19 = v42 - v41;
    if (v42 != v41)
    {
      std::vector<unsigned long>::__vallocate[abi:nn180100](&__p, v19 >> 3);
      double v20 = (char *)v35;
      memmove(v35, v18, v19);
      double v35 = &v20[8 * (v19 >> 3)];
    }
    -[TSDConnectionLineOrthogonalLayout axisSnapPoint:toXs:toYs:withThreshold:](self, "axisSnapPoint:toXs:toYs:withThreshold:", &v37, &__p, tx + v7 * c + a * v28, ty + v7 * d + b * v28, 2.0);
    double v26 = v22;
    double v29 = v21;
    if (__p)
    {
      double v35 = __p;
      operator delete(__p);
    }
    if (v37)
    {
      __dst = v37;
      operator delete(v37);
    }
    CGAffineTransform v32 = v40;
    CGAffineTransformInvert(&v33, &v32);
    float64x2_t v23 = vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v33.c, v26), *(float64x2_t *)&v33.a, v29);
    float64x2_t v24 = *(float64x2_t *)&v33.tx;
    if (v41)
    {
      double v42 = v41;
      float64x2_t v27 = *(float64x2_t *)&v33.tx;
      float64x2_t v30 = v23;
      operator delete(v41);
      float64x2_t v24 = v27;
      float64x2_t v23 = v30;
    }
    float64x2_t v5 = vaddq_f64(v24, v23);
    if (v44)
    {
      unint64_t v45 = v44;
      float64x2_t v31 = v5;
      operator delete(v44);
      float64x2_t v5 = v31;
    }
    double v7 = v5.f64[1];
  }
  double v25 = v7;
  result.x = v5.f64[0];
  result.y = v25;
  return result;
}

@end