@interface VKDrivingPolylinePath
+ (void)updateDistances:(void *)a3 forPath:(id)a4 snap:(BOOL)a5;
- (VKDrivingPolylinePath)initWithOverlay:(id)a3 section:(id)a4 routeStartIndex:(unsigned int)a5 routeEndIndex:(unsigned int)a6 matchedPathSegments:(id)a7 elevationSource:(void *)a8 elevationSourceContext:(void *)a9;
- (const)gradientTrafficAtIndex:(unsigned int)a3;
- (float)laneHalfWidthAtIndex:(unsigned int)a3;
- (id).cxx_construct;
- (unint64_t)splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:;
- (void)assignPoints:(void *)a3 count:(unint64_t)a4;
- (void)assignPoints:(void *)a3 laneHalfWidths:(float *)a4 gradientTraffics:(GradientTraffic *)a5 polylineCoordinates:(PolylineCoordinate *)a6 count:(unint64_t)a7;
- (void)assignTo:(id)a3 withSegment:(const TrafficSegment *)a4;
- (void)setTrafficSpeed:(unsigned __int8)a3;
- (void)splitGradientTrafficSegmentationAndAddTo:(id)a3 with:(void *)a4 shouldSnap:(BOOL)a5;
- (void)splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:;
@end

@implementation VKDrivingPolylinePath

- (id).cxx_construct
{
  *((void *)self + 19) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 18) = 0;
  *((void *)self + 22) = 0;
  *((void *)self + 23) = 0;
  *((void *)self + 21) = 0;
  *((void *)self + 25) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 24) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_gradientTraffics = &self->_gradientTraffics;
  begin = self->_gradientTraffics.__begin_;
  if (begin)
  {
    p_gradientTraffics->__end_ = begin;
    operator delete(begin);
  }
  v5 = self->_distances.__begin_;
  if (v5)
  {
    self->_distances.__end_ = v5;
    operator delete(v5);
  }
  v6 = self->_laneHalfWidths.__begin_;
  if (v6)
  {
    self->_laneHalfWidths.__end_ = v6;
    operator delete(v6);
  }
}

- (void)splitGradientTrafficSegmentationAndAddTo:(id)a3 with:(void *)a4 shouldSnap:(BOOL)a5
{
  v98 = self;
  id v80 = a3;
  v6 = +[VKDebugSettings sharedSettings];
  [v6 routeTrafficTransitionDistance];
  float v8 = v7 * 0.5;

  unsigned int v11 = 0;
  LODWORD(v12) = 0;
  v95 = 0;
  v96 = 0;
  uint64_t v97 = 0;
  v92 = 0;
  v93 = 0;
  uint64_t v94 = 0;
  v89 = 0;
  v90 = 0;
  uint64_t v91 = 0;
  __p = 0;
  v87 = 0;
  v85[0] = &v95;
  v85[1] = &v98;
  double v13 = 0.0;
  v85[2] = &v92;
  v85[3] = &v89;
  v85[4] = &__p;
  uint64_t v88 = 0;
LABEL_2:
  uint64_t v14 = v11;
  uint64_t v15 = *(void *)a4;
  unint64_t v16 = (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3;
  unint64_t v17 = v16 - 1;
  v18 = v98;
  while (1)
  {
    uint64_t v19 = v12;
    if (v17 <= v12) {
      break;
    }
    if (v16 <= v12) {
      abort();
    }
    unint64_t v12 = (v12 + 1);
    if (v16 <= v12) {
      abort();
    }
    double v20 = v13;
    unsigned int v21 = *(_DWORD *)(v15 + 8 * v19);
    double v13 = (double)v21;
    float v22 = (float)v21;
    double v23 = fmin((float)(v8 + (float)v21), (double)v21 + (double)(*(_DWORD *)(v15 + 8 * v12) - v21) * 0.5);
    begin = v98->_distances.__begin_;
    double v25 = begin[v11];
    if (v25 <= v23)
    {
      double v26 = fmax((float)(v22 - v8), v20 + (v13 - v20) * 0.5);
      unint64_t v27 = v98->_distances.__end_ - begin;
      if (v27 > v11 && v25 < v26)
      {
        unsigned int v28 = v11 + 1;
        do
        {
          unsigned int v11 = v28;
          v29 = v18->_laneHalfWidths.__begin_;
          if (v29 == v18->_laneHalfWidths.__end_) {
            float v30 = 0.0;
          }
          else {
            float v30 = v29[v14];
          }
          v31 = (uint64_t *)((char *)v18->super._points.__begin_ + 12 * v14);
          char v32 = *(unsigned char *)(v15 + 8 * v19 + 4);
          LODWORD(v83) = 0;
          BYTE4(v83) = v32;
          BYTE5(v83) = v32;
          -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, v31, &v83, &v18->super._polylineCoordinates.__begin_[v14], v30);
          uint64_t v14 = v11;
          v18 = v98;
          begin = v98->_distances.__begin_;
          unint64_t v27 = v98->_distances.__end_ - begin;
          if (v27 <= v11) {
            break;
          }
          unsigned int v28 = v11 + 1;
        }
        while (begin[v11] < v26);
      }
      if (v27 == v14) {
        goto LABEL_34;
      }
      if (v11)
      {
        uint64_t v33 = v11 - 1;
        double v34 = (v26 - begin[v33]) / (begin[v14] - begin[v33]);
        v35 = v18->super._points.__begin_;
        uint64_t v36 = (uint64_t)v35 + 12 * v33;
        uint64_t v37 = (uint64_t)v35 + 12 * v14;
        v9.i64[0] = *(void *)v36;
        v9.i32[2] = *(_DWORD *)(v36 + 8);
        v10.i64[0] = *(void *)v37;
        v10.i32[2] = *(_DWORD *)(v37 + 8);
        float v38 = v34;
        float32x4_t v39 = vmlaq_n_f32(v9, vsubq_f32(v10, v9), v38);
        __int32 v84 = v39.i32[2];
        uint64_t v83 = v39.i64[0];
        v40 = v18->_laneHalfWidths.__begin_;
        if (v40 == v18->_laneHalfWidths.__end_) {
          float v41 = 0.0;
        }
        else {
          float v41 = v40[v33] + (float)((float)(v40[v14] - v40[v33]) * v38);
        }
        unint64_t v82 = -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_1::operator()((uint64_t)v18, (int *)&v18->super._polylineCoordinates.__begin_[v33], (int *)&v18->super._polylineCoordinates.__begin_[v14], v38);
        char v42 = *(unsigned char *)(v15 + 8 * v19 + 4);
        char v43 = *(unsigned char *)(v15 + 8 * v12 + 4);
        LODWORD(v81) = 0;
        BYTE4(v81) = v42;
        BYTE5(v81) = v43;
        -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, &v83, &v81, &v82, v41);
        v18 = v98;
      }
      v79 = a4;
      uint64_t v44 = v11;
      v45 = v18->_distances.__begin_;
      unint64_t v46 = v18->_distances.__end_ - v45;
      if (v46 > v11)
      {
        double v47 = v45[v11];
        if (v47 < v23)
        {
          float v48 = v23 - v26;
          double v49 = 1.0 / v48;
          unsigned int v50 = v11 + 1;
          do
          {
            unsigned int v11 = v50;
            v51 = v18->_laneHalfWidths.__begin_;
            if (v51 == v18->_laneHalfWidths.__end_) {
              float v52 = 0.0;
            }
            else {
              float v52 = v51[v44];
            }
            float v53 = (v47 - v26) * v49;
            v54 = (uint64_t *)((char *)v18->super._points.__begin_ + 12 * v44);
            char v55 = *(unsigned char *)(v15 + 8 * v19 + 4);
            char v56 = *(unsigned char *)(v15 + 8 * v12 + 4);
            *(float *)&uint64_t v83 = v53;
            BYTE4(v83) = v55;
            BYTE5(v83) = v56;
            -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, v54, &v83, &v18->super._polylineCoordinates.__begin_[v44], v52);
            uint64_t v44 = v11;
            v18 = v98;
            v45 = v98->_distances.__begin_;
            unint64_t v46 = v98->_distances.__end_ - v45;
            if (v46 <= v11) {
              break;
            }
            double v47 = v45[v11];
            unsigned int v50 = v11 + 1;
          }
          while (v47 < v23);
        }
      }
      if (v46 == v44)
      {
LABEL_34:
        uint64_t v15 = *(void *)a4;
        unint64_t v16 = (uint64_t)(*((void *)a4 + 1) - *(void *)a4) >> 3;
        unint64_t v17 = v16 - 1;
        break;
      }
      uint64_t v57 = v11 - 1;
      double v58 = (v23 - v45[v57]) / (v45[v44] - v45[v57]);
      v59 = v18->super._points.__begin_;
      uint64_t v60 = (uint64_t)v59 + 12 * v57;
      uint64_t v61 = (uint64_t)v59 + 12 * v44;
      v9.i64[0] = *(void *)v60;
      v9.i32[2] = *(_DWORD *)(v60 + 8);
      v10.i64[0] = *(void *)v61;
      v10.i32[2] = *(_DWORD *)(v61 + 8);
      float v62 = v58;
      float32x4_t v63 = vmlaq_n_f32(v9, vsubq_f32(v10, v9), v62);
      __int32 v84 = v63.i32[2];
      uint64_t v83 = v63.i64[0];
      v64 = v18->_laneHalfWidths.__begin_;
      if (v64 == v18->_laneHalfWidths.__end_) {
        float v65 = 0.0;
      }
      else {
        float v65 = *((float *)v92 + v57) + (float)((float)(v64[v44] - *((float *)v92 + v57)) * v62);
      }
      unint64_t v82 = -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_1::operator()((uint64_t)v18, (int *)&v18->super._polylineCoordinates.__begin_[v57], (int *)&v18->super._polylineCoordinates.__begin_[v44], v62);
      char v66 = *(unsigned char *)(v15 + 8 * v19 + 4);
      char v67 = *(unsigned char *)(v15 + 8 * v12 + 4);
      LODWORD(v81) = 1065353216;
      BYTE4(v81) = v66;
      BYTE5(v81) = v67;
      -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, &v83, &v81, &v82, v65);
      goto LABEL_2;
    }
  }
  if (v16 <= v17) {
    abort();
  }
  unint64_t v68 = v11;
  v69 = (char *)v18->super._points.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v18->super._points.__end_ - (char *)v69) >> 2) > v11)
  {
    v70 = (char *)(v15 + 8 * v17 + 4);
    unsigned int v71 = v11 + 1;
    do
    {
      v72 = v18->_laneHalfWidths.__begin_;
      if (v72 == v18->_laneHalfWidths.__end_) {
        float v73 = 0.0;
      }
      else {
        float v73 = v72[v68];
      }
      char v74 = *v70;
      LODWORD(v83) = 0;
      BYTE4(v83) = v74;
      BYTE5(v83) = v74;
      -[VKDrivingPolylinePath splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:]::$_0::operator()((uint64_t)v85, (uint64_t *)&v69[12 * v68], &v83, &v18->super._polylineCoordinates.__begin_[v68], v73);
      unint64_t v68 = v71;
      v18 = v98;
      v69 = (char *)v98->super._points.__begin_;
      ++v71;
    }
    while (0xAAAAAAAAAAAAAAABLL * (((char *)v98->super._points.__end_ - (char *)v69) >> 2) > v68);
  }
  v75 = [VKDrivingPolylinePath alloc];
  id WeakRetained = objc_loadWeakRetained((id *)&v98->super._overlay);
  id v77 = objc_loadWeakRetained((id *)&v98->super._section);
  v78 = [(VKPolylinePath *)v75 initWithOverlay:WeakRetained section:v77 matchedPathSegments:v98->super._matchedPathSegments];

  [(VKPolylinePath *)v78 setRouteStart:*(void *)&v98->super._routeStart];
  [(VKPolylinePath *)v78 setRouteEnd:*(void *)&v98->super._routeEnd];
  -[VKDrivingPolylinePath assignPoints:laneHalfWidths:gradientTraffics:polylineCoordinates:count:](v78, "assignPoints:laneHalfWidths:gradientTraffics:polylineCoordinates:count:", v79);
  [v80 addObject:v78];

  if (__p)
  {
    v87 = __p;
    operator delete(__p);
  }
  if (v89)
  {
    v90 = v89;
    operator delete(v89);
  }
  if (v92)
  {
    v93 = v92;
    operator delete(v92);
  }
  if (v95)
  {
    v96 = v95;
    operator delete(v95);
  }
}

- (void)splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:
{
  float32x4_t v10 = *(char ***)a1;
  unint64_t v12 = *(char **)(*(void *)a1 + 8);
  unint64_t v11 = *(void *)(*(void *)a1 + 16);
  if ((unint64_t)v12 >= v11)
  {
    uint64_t v15 = *v10;
    unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((v12 - *v10) >> 2);
    unint64_t v17 = v16 + 1;
    if (v16 + 1 > 0x1555555555555555) {
      goto LABEL_87;
    }
    unint64_t v18 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - (void)v15) >> 2);
    if (2 * v18 > v17) {
      unint64_t v17 = 2 * v18;
    }
    if (v18 >= 0xAAAAAAAAAAAAAAALL) {
      unint64_t v19 = 0x1555555555555555;
    }
    else {
      unint64_t v19 = v17;
    }
    if (v19)
    {
      if (v19 > 0x1555555555555555) {
        goto LABEL_88;
      }
      double v20 = (char *)operator new(12 * v19);
    }
    else
    {
      double v20 = 0;
    }
    unsigned int v21 = &v20[12 * v16];
    *(void *)unsigned int v21 = *a2;
    *((_DWORD *)v21 + 2) = *((_DWORD *)a2 + 2);
    uint64_t v14 = v21 + 12;
    if (v12 != v15)
    {
      do
      {
        uint64_t v22 = *(void *)(v12 - 12);
        v12 -= 12;
        int v23 = *((_DWORD *)v12 + 2);
        *(void *)(v21 - 12) = v22;
        v21 -= 12;
        *((_DWORD *)v21 + 2) = v23;
      }
      while (v12 != v15);
      unint64_t v12 = *v10;
    }
    *float32x4_t v10 = v21;
    v10[1] = v14;
    v10[2] = &v20[12 * v19];
    if (v12) {
      operator delete(v12);
    }
  }
  else
  {
    uint64_t v13 = *a2;
    *((_DWORD *)v12 + 2) = *((_DWORD *)a2 + 2);
    *(void *)unint64_t v12 = v13;
    uint64_t v14 = v12 + 12;
  }
  v10[1] = v14;
  if (*(void *)(**(void **)(a1 + 8) + 144) != *(void *)(**(void **)(a1 + 8) + 152))
  {
    uint64_t v24 = *(void *)(a1 + 16);
    double v26 = *(float **)(v24 + 8);
    unint64_t v25 = *(void *)(v24 + 16);
    if ((unint64_t)v26 >= v25)
    {
      unsigned int v28 = *(float **)v24;
      uint64_t v29 = (uint64_t)v26 - *(void *)v24;
      uint64_t v30 = v29 >> 2;
      unint64_t v31 = (v29 >> 2) + 1;
      if (v31 >> 62) {
        goto LABEL_87;
      }
      uint64_t v32 = v25 - (void)v28;
      if (v32 >> 1 > v31) {
        unint64_t v31 = v32 >> 1;
      }
      if ((unint64_t)v32 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v33 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v33 = v31;
      }
      if (v33)
      {
        if (v33 >> 62) {
          goto LABEL_88;
        }
        double v34 = operator new(4 * v33);
      }
      else
      {
        double v34 = 0;
      }
      v35 = (float *)&v34[4 * v30];
      uint64_t v36 = &v34[4 * v33];
      float *v35 = a5;
      unint64_t v27 = v35 + 1;
      if (v26 != v28)
      {
        unint64_t v37 = (char *)v26 - (char *)v28 - 4;
        if (v37 < 0x2C) {
          goto LABEL_91;
        }
        if ((unint64_t)((char *)v26 - v34 - v29) < 0x20) {
          goto LABEL_91;
        }
        uint64_t v38 = (v37 >> 2) + 1;
        float32x4_t v39 = &v34[4 * v30 - 16];
        v40 = v26 - 4;
        uint64_t v41 = v38 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v42 = *(_OWORD *)v40;
          *(v39 - 1) = *((_OWORD *)v40 - 1);
          *float32x4_t v39 = v42;
          v39 -= 2;
          v40 -= 8;
          v41 -= 8;
        }
        while (v41);
        v35 -= v38 & 0x7FFFFFFFFFFFFFF8;
        v26 -= v38 & 0x7FFFFFFFFFFFFFF8;
        if (v38 != (v38 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_91:
          do
          {
            int v43 = *((_DWORD *)v26-- - 1);
            *((_DWORD *)v35-- - 1) = v43;
          }
          while (v26 != v28);
        }
      }
      *(void *)uint64_t v24 = v35;
      *(void *)(v24 + 8) = v27;
      *(void *)(v24 + 16) = v36;
      if (v28) {
        operator delete(v28);
      }
    }
    else
    {
      *double v26 = a5;
      unint64_t v27 = v26 + 1;
    }
    *(void *)(v24 + 8) = v27;
  }
  uint64_t v44 = *(char ***)(a1 + 24);
  unint64_t v46 = v44[1];
  unint64_t v45 = (unint64_t)v44[2];
  if ((unint64_t)v46 >= v45)
  {
    float v48 = *v44;
    uint64_t v49 = v46 - *v44;
    uint64_t v50 = v49 >> 3;
    unint64_t v51 = (v49 >> 3) + 1;
    if (v51 >> 61) {
      goto LABEL_87;
    }
    uint64_t v52 = v45 - (void)v48;
    if (v52 >> 2 > v51) {
      unint64_t v51 = v52 >> 2;
    }
    if ((unint64_t)v52 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v53 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v53 = v51;
    }
    if (v53)
    {
      if (v53 >> 61) {
        goto LABEL_88;
      }
      v54 = operator new(8 * v53);
    }
    else
    {
      v54 = 0;
    }
    char v55 = &v54[8 * v50];
    *(void *)char v55 = *a3;
    double v47 = v55 + 8;
    if (v46 != v48)
    {
      unint64_t v56 = v46 - v48 - 8;
      if (v56 < 0x58) {
        goto LABEL_92;
      }
      if ((unint64_t)(v46 - &v54[v49]) < 0x20) {
        goto LABEL_92;
      }
      uint64_t v57 = (v56 >> 3) + 1;
      double v58 = &v54[8 * v50 - 16];
      v59 = v46 - 16;
      uint64_t v60 = v57 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v61 = *(_OWORD *)v59;
        *(v58 - 1) = *((_OWORD *)v59 - 1);
        *double v58 = v61;
        v58 -= 2;
        v59 -= 32;
        v60 -= 4;
      }
      while (v60);
      v55 -= 8 * (v57 & 0x3FFFFFFFFFFFFFFCLL);
      v46 -= 8 * (v57 & 0x3FFFFFFFFFFFFFFCLL);
      if (v57 != (v57 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_92:
        do
        {
          uint64_t v62 = *((void *)v46 - 1);
          v46 -= 8;
          *((void *)v55 - 1) = v62;
          v55 -= 8;
        }
        while (v46 != v48);
      }
      unint64_t v46 = *v44;
    }
    *uint64_t v44 = v55;
    v44[1] = v47;
    v44[2] = &v54[8 * v53];
    if (v46) {
      operator delete(v46);
    }
  }
  else
  {
    *(void *)unint64_t v46 = *a3;
    double v47 = v46 + 8;
  }
  v44[1] = v47;
  uint64_t v63 = *(void *)(a1 + 32);
  float v65 = *(void **)(v63 + 8);
  unint64_t v64 = *(void *)(v63 + 16);
  if ((unint64_t)v65 < v64)
  {
    *float v65 = *a4;
    char v66 = v65 + 1;
    goto LABEL_86;
  }
  char v67 = *(unsigned char **)v63;
  uint64_t v68 = (uint64_t)v65 - *(void *)v63;
  uint64_t v69 = v68 >> 3;
  unint64_t v70 = (v68 >> 3) + 1;
  if (v70 >> 61) {
LABEL_87:
  }
    abort();
  uint64_t v71 = v64 - (void)v67;
  if (v71 >> 2 > v70) {
    unint64_t v70 = v71 >> 2;
  }
  if ((unint64_t)v71 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v72 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v72 = v70;
  }
  if (!v72)
  {
    float v73 = 0;
    goto LABEL_75;
  }
  if (v72 >> 61) {
LABEL_88:
  }
    std::__throw_bad_array_new_length[abi:nn180100]();
  float v73 = operator new(8 * v72);
LABEL_75:
  char v74 = &v73[8 * v69];
  *char v74 = *a4;
  char v66 = v74 + 1;
  if (v65 == (void *)v67)
  {
    char v67 = v65;
  }
  else
  {
    unint64_t v75 = (char *)v65 - v67 - 8;
    if (v75 < 0x58) {
      goto LABEL_93;
    }
    if ((unint64_t)((char *)v65 - &v73[v68]) < 0x20) {
      goto LABEL_93;
    }
    uint64_t v76 = (v75 >> 3) + 1;
    id v77 = &v73[8 * v69 - 16];
    v78 = (long long *)(v65 - 2);
    uint64_t v79 = v76 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v80 = *v78;
      *(v77 - 1) = *(v78 - 1);
      *id v77 = v80;
      v77 -= 2;
      v78 -= 2;
      v79 -= 4;
    }
    while (v79);
    v74 -= v76 & 0x3FFFFFFFFFFFFFFCLL;
    v65 -= v76 & 0x3FFFFFFFFFFFFFFCLL;
    if (v76 != (v76 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_93:
      do
      {
        uint64_t v81 = *--v65;
        *--char v74 = v81;
      }
      while (v65 != (void *)v67);
      char v67 = *(unsigned char **)v63;
    }
  }
  *(void *)uint64_t v63 = v74;
  *(void *)(v63 + 8) = v66;
  *(void *)(v63 + 16) = &v73[8 * v72];
  if (v67) {
    operator delete(v67);
  }
LABEL_86:
  *(void *)(v63 + 8) = v66;
}

- (unint64_t)splitGradientTrafficSegmentationAndAddTo:with:shouldSnap:
{
  unsigned int v7 = *a3;
  if (*a3 != *a2 || (float v8 = *((float *)a2 + 1), vabds_f32(*((float *)a3 + 1), v8) >= 0.00000011921))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    float32x4_t v10 = [WeakRetained composedRouteSegment];
    unint64_t v11 = [v10 composedRoute];

    unsigned int v12 = *a2;
    float v13 = *((float *)a2 + 1);
    if (v13 >= 1.0)
    {
      v12 += vcvtms_u32_f32(v13);
      float v13 = v13 - floorf(v13);
    }
    unsigned int v14 = *a3;
    float v15 = *((float *)a3 + 1);
    if (v15 >= 1.0)
    {
      v14 += vcvtms_u32_f32(v15);
      float v15 = v15 - floorf(v15);
    }
    [v11 distanceBetweenRouteCoordinate:v12 | ((unint64_t)LODWORD(v13) << 32) andRouteCoordinate:v14 | ((unint64_t)LODWORD(v15) << 32)];
    uint64_t v17 = [v11 routeCoordinateForDistance:*(void *)a2 afterRouteCoordinate:v16 * a4];
    float v8 = *((float *)&v17 + 1);
    unsigned int v7 = v17;
    if (*((float *)&v17 + 1) >= 1.0)
    {
      unsigned int v7 = vcvtms_u32_f32(*((float *)&v17 + 1)) + v17;
      float v8 = *((float *)&v17 + 1) - floorf(*((float *)&v17 + 1));
    }
  }
  return v7 | ((unint64_t)LODWORD(v8) << 32);
}

- (void)assignPoints:(void *)a3 laneHalfWidths:(float *)a4 gradientTraffics:(GradientTraffic *)a5 polylineCoordinates:(PolylineCoordinate *)a6 count:(unint64_t)a7
{
  unsigned int v12 = self;
  begin = (char *)self->super._points.__begin_;
  end = self->super._points.__end_;
  p_points = (char **)&self->super._points;
  unint64_t v17 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 2);
  if (a7 <= v17)
  {
    if (a7 < v17) {
      v12->super._points.__end_ = &begin[12 * a7];
    }
  }
  else
  {
    std::vector<gm::Matrix<float,3,1>>::__append(p_points, a7 - v17);
    begin = *p_points;
  }
  __src = a5;
  memcpy(begin, a3, 12 * a7);
  if (a4)
  {
    p_begin = (void **)&v12->_laneHalfWidths.__begin_;
    unint64_t v19 = v12->_laneHalfWidths.__begin_;
    double v20 = v12->_laneHalfWidths.__end_;
    unint64_t v21 = v20 - v19;
    unint64_t v22 = a7 - v21;
    if (a7 <= v21)
    {
      if (a7 < v21) {
        v12->_laneHalfWidths.__end_ = &v19[a7];
      }
      goto LABEL_34;
    }
    value = v12->_laneHalfWidths.__end_cap_.__value_;
    if (v22 <= value - v20)
    {
      bzero(v12->_laneHalfWidths.__end_, 4 * v22);
      v12->_laneHalfWidths.__end_ = &v20[v22];
LABEL_33:
      unint64_t v19 = (float *)*p_begin;
LABEL_34:
      memcpy(v19, a4, 4 * a7);
      goto LABEL_35;
    }
    char v66 = a4;
    if (a7 >> 62) {
      goto LABEL_67;
    }
    uint64_t v24 = (char *)value - (char *)v19;
    unint64_t v25 = v24 >> 1;
    if (v24 >> 1 <= a7) {
      unint64_t v25 = a7;
    }
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v26 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v26 = v25;
    }
    uint64_t v68 = a6;
    if (v26)
    {
      if (v26 >> 62) {
        goto LABEL_68;
      }
      unint64_t v27 = (char *)operator new(4 * v26);
    }
    else
    {
      unint64_t v27 = 0;
    }
    unsigned int v28 = &v27[4 * v21];
    size_t v29 = 4 * v22;
    uint64_t v63 = v27;
    unint64_t v64 = (float *)&v27[4 * v26];
    bzero(v28, v29);
    uint64_t v30 = (float *)&v28[v29];
    if (v20 == v19)
    {
      uint64_t v32 = v64;
      a4 = v66;
      goto LABEL_31;
    }
    unint64_t v31 = (char *)v20 - (char *)v19 - 4;
    a4 = v66;
    if (v31 >= 0x2C)
    {
      uint64_t v32 = v64;
      if ((unint64_t)((char *)v19 - v63) >= 0x20)
      {
        uint64_t v33 = (v31 >> 2) + 1;
        double v34 = &v63[4 * v21 - 16];
        v35 = v20 - 4;
        uint64_t v36 = v33 & 0x7FFFFFFFFFFFFFF8;
        do
        {
          long long v37 = *(_OWORD *)v35;
          *((_OWORD *)v34 - 1) = *((_OWORD *)v35 - 1);
          *(_OWORD *)double v34 = v37;
          v34 -= 32;
          v35 -= 8;
          v36 -= 8;
        }
        while (v36);
        v28 -= 4 * (v33 & 0x7FFFFFFFFFFFFFF8);
        v20 -= v33 & 0x7FFFFFFFFFFFFFF8;
        if (v33 == (v33 & 0x7FFFFFFFFFFFFFF8))
        {
LABEL_31:
          *p_begin = v28;
          v12->_laneHalfWidths.__end_ = v30;
          v12->_laneHalfWidths.__end_cap_.__value_ = v32;
          a6 = v68;
          if (v19) {
            operator delete(v19);
          }
          goto LABEL_33;
        }
      }
    }
    else
    {
      uint64_t v32 = v64;
    }
    do
    {
      int v38 = *((_DWORD *)v20-- - 1);
      *((_DWORD *)v28 - 1) = v38;
      v28 -= 4;
    }
    while (v20 != v19);
    goto LABEL_31;
  }
LABEL_35:
  p_gradientTraffics = &v12->_gradientTraffics;
  v40 = v12->_gradientTraffics.__begin_;
  uint64_t v41 = v12->_gradientTraffics.__end_;
  unint64_t v42 = v41 - v40;
  unint64_t v43 = a7 - v42;
  if (a7 > v42)
  {
    uint64_t v44 = v12->_gradientTraffics.__end_cap_.__value_;
    if (v43 <= v44 - v41)
    {
      bzero(v12->_gradientTraffics.__end_, 8 * v43);
      v12->_gradientTraffics.__end_ = &v41[v43];
      v54 = __src;
LABEL_59:
      v40 = p_gradientTraffics->__begin_;
      goto LABEL_60;
    }
    if (!(a7 >> 61))
    {
      char v67 = v12;
      uint64_t v69 = a6;
      uint64_t v45 = (char *)v44 - (char *)v40;
      unint64_t v46 = v45 >> 2;
      if (v45 >> 2 <= a7) {
        unint64_t v46 = a7;
      }
      BOOL v47 = (unint64_t)v45 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v48 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v47) {
        unint64_t v48 = v46;
      }
      if (!(v48 >> 61))
      {
        uint64_t v49 = 8 * v48;
        uint64_t v50 = operator new(8 * v48);
        unint64_t v51 = (GradientTraffic *)&v50[8 * v42];
        float v65 = (GradientTraffic *)&v50[v49];
        bzero(v51, 8 * v43);
        uint64_t v52 = &v51[v43];
        if (v41 == v40)
        {
          v40 = v41;
          unsigned int v12 = v67;
          v54 = __src;
          goto LABEL_57;
        }
        unint64_t v53 = (char *)v41 - (char *)v40 - 8;
        unsigned int v12 = v67;
        if (v53 >= 0x58)
        {
          v54 = __src;
          if ((unint64_t)((char *)v40 - v50) >= 0x20)
          {
            uint64_t v55 = (v53 >> 3) + 1;
            unint64_t v56 = &v50[8 * v42 - 16];
            uint64_t v57 = v41 - 2;
            uint64_t v58 = v55 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v59 = *(_OWORD *)&v57->blend;
              *(v56 - 1) = *(_OWORD *)&v57[-2].blend;
              *unint64_t v56 = v59;
              v56 -= 2;
              v57 -= 4;
              v58 -= 4;
            }
            while (v58);
            v51 -= v55 & 0x3FFFFFFFFFFFFFFCLL;
            v41 -= v55 & 0x3FFFFFFFFFFFFFFCLL;
            if (v55 == (v55 & 0x3FFFFFFFFFFFFFFCLL)) {
              goto LABEL_57;
            }
          }
        }
        else
        {
          v54 = __src;
        }
        do
        {
          GradientTraffic v60 = v41[-1];
          --v41;
          v51[-1] = v60;
          --v51;
        }
        while (v41 != v40);
        v40 = p_gradientTraffics->__begin_;
LABEL_57:
        p_gradientTraffics->__begin_ = v51;
        p_gradientTraffics->__end_ = v52;
        p_gradientTraffics->__end_cap_.__value_ = v65;
        a6 = v69;
        if (v40) {
          operator delete(v40);
        }
        goto LABEL_59;
      }
LABEL_68:
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
LABEL_67:
    abort();
  }
  if (a7 < v42) {
    v12->_gradientTraffics.__end_ = &v40[a7];
  }
  v54 = __src;
LABEL_60:
  memcpy(v40, v54, 8 * a7);
  long long v61 = (char *)v12->super._polylineCoordinates.__begin_;
  unint64_t v62 = ((char *)v12->super._polylineCoordinates.__end_ - v61) >> 3;
  if (a7 <= v62)
  {
    if (a7 < v62) {
      v12->super._polylineCoordinates.__end_ = (PolylineCoordinate *)&v61[8 * a7];
    }
  }
  else
  {
    std::vector<geo::PolylineCoordinate>::__append((char **)&v12->super._polylineCoordinates, a7 - v62);
    long long v61 = (char *)v12->super._polylineCoordinates.__begin_;
  }
  memcpy(v61, a6, 8 * a7);
}

- (void)assignPoints:(void *)a3 count:(unint64_t)a4
{
  begin = (char *)self->super._points.__begin_;
  end = self->super._points.__end_;
  p_points = (char **)&self->super._points;
  unint64_t v11 = 0xAAAAAAAAAAAAAAABLL * ((end - begin) >> 2);
  if (a4 <= v11)
  {
    if (a4 < v11) {
      self->super._points.__end_ = &begin[12 * a4];
    }
  }
  else
  {
    std::vector<gm::Matrix<float,3,1>>::__append(p_points, a4 - v11);
    begin = *p_points;
  }
  memcpy(begin, a3, 12 * a4);
}

- (void)assignTo:(id)a3 withSegment:(const TrafficSegment *)a4
{
  id v6 = a3;
  if (a4) {
    uint64_t var1 = a4->var1;
  }
  else {
    uint64_t var1 = 4;
  }
  id v8 = v6;
  [(VKDrivingPolylinePath *)self setTrafficSpeed:var1];
  [v8 addObject:self];
}

- (const)gradientTrafficAtIndex:(unsigned int)a3
{
  begin = self->_gradientTraffics.__begin_;
  if (a3 >= (unint64_t)(self->_gradientTraffics.__end_ - begin)) {
    return &self->_standardModeTraffic;
  }
  else {
    return &begin[a3];
  }
}

- (void)setTrafficSpeed:(unsigned __int8)a3
{
  self->super._trafficSpeed = a3;
  self->_standardModeTraffic.blend = 0.0;
  self->_standardModeTraffic.start = a3;
  self->_standardModeTraffic.end = self->super._trafficSpeed;
}

- (float)laneHalfWidthAtIndex:(unsigned int)a3
{
  begin = self->_laneHalfWidths.__begin_;
  if (begin == self->_laneHalfWidths.__end_) {
    return 1.85;
  }
  else {
    return begin[a3];
  }
}

- (VKDrivingPolylinePath)initWithOverlay:(id)a3 section:(id)a4 routeStartIndex:(unsigned int)a5 routeEndIndex:(unsigned int)a6 matchedPathSegments:(id)a7 elevationSource:(void *)a8 elevationSourceContext:(void *)a9
{
  uint64_t v11 = *(void *)&a6;
  uint64_t v12 = *(void *)&a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  v22.receiver = self;
  v22.super_class = (Class)VKDrivingPolylinePath;
  unint64_t v18 = [(VKPolylinePath *)&v22 initWithOverlay:v15 section:v16 routeStartIndex:v12 routeEndIndex:v11 matchedPathSegments:v17 elevationSource:a8 elevationSourceContext:a9];
  unint64_t v19 = v18;
  if (v18)
  {
    v18->super._trafficSpeed = 4;
    +[VKDrivingPolylinePath updateDistances:&v18->_distances forPath:v18 snap:v17 != 0];
    double v20 = v19;
  }

  return v19;
}

+ (void)updateDistances:(void *)a3 forPath:(id)a4 snap:(BOOL)a5
{
  BOOL v5 = a5;
  unsigned int v7 = a4;
  v7[80] = v5;
  id v53 = v7;
  uint64_t v8 = *((void *)v7 + 5) - *((void *)v7 + 4);
  if (v8)
  {
    unint64_t v9 = 0xAAAAAAAAAAAAAAABLL * (v8 >> 2);
    float32x4_t v10 = *(char **)a3;
    *((void *)a3 + 1) = *(void *)a3;
    if (v9 > (uint64_t)(*((void *)a3 + 2) - (void)v10) >> 3)
    {
      if (v9 >> 61) {
        abort();
      }
      uint64_t v11 = (char *)operator new(0x5555555555555558 * (v8 >> 2));
      *(void *)a3 = v11;
      *((void *)a3 + 1) = v11;
      *((void *)a3 + 2) = &v11[8 * v9];
      if (v10) {
        operator delete(v10);
      }
    }
    id v12 = v53;
    float v13 = [v12 section];
    unsigned int v14 = [v13 composedRouteSegment];

    uint64_t v55 = [v14 composedRoute];
    unint64_t v15 = 0;
    v54 = v14;
    if (v5) {
      goto LABEL_11;
    }
    while ([v12 pointCount] > HIDWORD(v15))
    {
      int v16 = [v12 routeStart];
      unint64_t v17 = [v12 routeStart];
      unsigned int v18 = v16 + HIDWORD(v15);
      unint64_t v19 = HIDWORD(v17);
      if (*((float *)&v17 + 1) >= 1.0)
      {
        v18 += vcvtms_u32_f32(*((float *)&v17 + 1));
        unint64_t v19 = COERCE_UNSIGNED_INT(*((float *)&v17 + 1) - floorf(*((float *)&v17 + 1)));
      }
      while (1)
      {
        [v55 stepDistanceFromPoint:0 toPoint:v18 | (v19 << 32)];
        uint64_t v32 = v31;
        double v34 = (char *)*((void *)a3 + 1);
        unint64_t v33 = *((void *)a3 + 2);
        if ((unint64_t)v34 >= v33)
        {
          uint64_t v36 = *(char **)a3;
          uint64_t v37 = (uint64_t)&v34[-*(void *)a3];
          uint64_t v38 = v37 >> 3;
          unint64_t v39 = (v37 >> 3) + 1;
          if (v39 >> 61) {
            abort();
          }
          uint64_t v40 = v33 - (void)v36;
          if (v40 >> 2 > v39) {
            unint64_t v39 = v40 >> 2;
          }
          unint64_t v41 = (unint64_t)v40 >= 0x7FFFFFFFFFFFFFF8 ? 0x1FFFFFFFFFFFFFFFLL : v39;
          if (v41)
          {
            if (v41 >> 61) {
              std::__throw_bad_array_new_length[abi:nn180100]();
            }
            unint64_t v42 = operator new(8 * v41);
          }
          else
          {
            unint64_t v42 = 0;
          }
          unint64_t v43 = &v42[8 * v38];
          *unint64_t v43 = v32;
          v35 = v43 + 1;
          if (v34 != v36)
          {
            unint64_t v44 = v34 - 8 - v36;
            if (v44 < 0x58) {
              goto LABEL_53;
            }
            if ((unint64_t)(v34 - &v42[v37]) < 0x20) {
              goto LABEL_53;
            }
            uint64_t v45 = (v44 >> 3) + 1;
            unint64_t v46 = &v42[8 * v38 - 16];
            BOOL v47 = v34 - 16;
            uint64_t v48 = v45 & 0x3FFFFFFFFFFFFFFCLL;
            do
            {
              long long v49 = *(_OWORD *)v47;
              *(v46 - 1) = *((_OWORD *)v47 - 1);
              *unint64_t v46 = v49;
              v46 -= 2;
              v47 -= 32;
              v48 -= 4;
            }
            while (v48);
            v43 -= v45 & 0x3FFFFFFFFFFFFFFCLL;
            v34 -= 8 * (v45 & 0x3FFFFFFFFFFFFFFCLL);
            if (v45 != (v45 & 0x3FFFFFFFFFFFFFFCLL))
            {
LABEL_53:
              do
              {
                uint64_t v50 = *((void *)v34 - 1);
                v34 -= 8;
                *--unint64_t v43 = v50;
              }
              while (v34 != v36);
            }
          }
          *(void *)a3 = v43;
          *((void *)a3 + 1) = v35;
          *((void *)a3 + 2) = &v42[8 * v41];
          if (v36) {
            operator delete(v36);
          }
        }
        else
        {
          *(void *)double v34 = v31;
          v35 = v34 + 8;
        }
        *((void *)a3 + 1) = v35;
        if (!v5) {
          break;
        }
        unint64_t v51 = [v12 matchedPathSegments];
        uint64_t v52 = [v51 objectAtIndexedSubscript:v15];

        if ((unint64_t)[v52 pointCount] > 1)
        {
          if ((unint64_t)([v52 pointCount] - 1) > HIDWORD(v15)) {
            v15 += 0x100000000;
          }
          else {
            unint64_t v15 = (v15 + 1);
          }
        }
        else
        {
          unint64_t v15 = (v15 + 1);
        }

        unsigned int v14 = v54;
LABEL_11:
        double v20 = [v12 matchedPathSegments];
        unint64_t v21 = [v20 count];

        if (v21 <= v15) {
          goto LABEL_44;
        }
        objc_super v22 = [v12 matchedPathSegments];
        uint64_t v23 = [v22 count] - 1;

        if (v23 == v15)
        {
          uint64_t v24 = [v12 matchedPathSegments];
          unint64_t v25 = [v24 objectAtIndexedSubscript:v15];

          unint64_t v26 = [v25 pointCount];
          if (v26 <= HIDWORD(v15)) {
            goto LABEL_44;
          }
        }
        unint64_t v27 = [v12 matchedPathSegments];
        unsigned int v28 = [v27 objectAtIndexedSubscript:v15];

        unint64_t v29 = [v28 routeCoordinateAt:HIDWORD(v15)];
        unsigned int v18 = v29;
        unint64_t v30 = HIDWORD(v29);

        unint64_t v19 = v30;
      }
      v15 += 0x100000000;
      unsigned int v14 = v54;
    }
LABEL_44:
  }
}

@end