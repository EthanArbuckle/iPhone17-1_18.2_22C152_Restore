@interface VKRouteLine
- (BOOL)buildRouteLine:(id)a3 matchToRoads:(BOOL)a4 shouldGenerateSnapPath:(BOOL)a5 viewUnitsPerPoint:(double)a6 force:(BOOL)a7 boundsInflation:(float)a8 isGradientTraffic:(BOOL)a9 currentLegIndex:(unsigned int)a10 elevationSource:(void *)a11 elevationSourceContext:(void *)a12;
- (BOOL)hasNewRoadMatches;
- (BOOL)isTrafficUpToDate;
- (BOOL)isTrafficUptoDate:(double)a3;
- (BOOL)needsUpdateForViewingScale:(double)a3;
- (Box<double,)bounds;
- (GEOComposedRoute)composedRoute;
- (GEOPathMatcher)pathMatcher;
- (Matrix<double,)inverseManeuverTransform;
- (Matrix<double,)maneuverTransform;
- (NSArray)matchedSegments;
- (VKPolylineOverlay)overlay;
- (VKPolylineOverlayRenderRegion)renderRegion;
- (VKRouteLine)initWithPolylineOverlay:(id)a3;
- (VKRouteLineObserverProtocol)observer;
- (double)_findSimplifiedOffsetFor:(const PolylineCoordinate *)a3 betweenA:(const PolylineCoordinate *)a4 andB:(const PolylineCoordinate *)a5;
- (double)boundsInWorldUnit;
- (double)boundsUnitsPerMeter;
- (double)simplificationEpsilonPoints;
- (id).cxx_construct;
- (optional<VKRouteLineSnapResult>)snapRouteMatch:(SEL)a3;
- (optional<std::pair<const)_getSnappedSegment:()fast_shared_ptr<md:(mdm:(const PolylineCoordinate *)a4 :MDAllocator>)a3 :RouteLineSection coord:;
- (unsigned)matchingEndIndex;
- (unsigned)matchingStartIndex;
- (unsigned)numPathsMatching;
- (vector<geo::fast_shared_ptr<md::RouteLineSection,)sections;
- (vector<gm::Matrix<float,)maneuverPoints;
- (void)_addMatchedSegments:(id)a3;
- (void)_clearMatchedSegments;
- (void)_updateBounds:(id)a3 boundsInflation:(float)a4;
- (void)_updateTilesCovered:(id)a3;
- (void)arrows;
- (void)createMeshIfNecessary:(int64_t)a3;
- (void)dealloc;
- (void)forEachSection:(id)a3;
- (void)generateArrowsForManeuverDisplayMode:(int)a3 routeLineWidth:(double)a4 collideTrafficFeatures:(const void *)a5;
- (void)setHasNewRoadMatches:(BOOL)a3;
- (void)setMatchingEndIndex:(unsigned int)a3;
- (void)setMatchingStartIndex:(unsigned int)a3;
- (void)setNumPathsMatching:(unsigned __int16)a3;
- (void)setObserver:(id)a3;
- (void)setSimplificationEpsilonPoints:(double)a3;
- (void)splitRouteLineAtAnnotation:(id)a3 puckOffset:(PolylineCoordinate)a4;
@end

@implementation VKRouteLine

- (id).cxx_construct
{
  *((void *)self + 39) = 0xBF80000000000000;
  *(_OWORD *)((char *)self + 280) = 0u;
  *(_OWORD *)((char *)self + 296) = 0u;
  *((void *)self + 41) = &unk_1EF559DB8;
  *((void *)self + 42) = 0;
  *((void *)self + 45) = 0;
  *((void *)self + 46) = 0;
  *((void *)self + 44) = 0;
  *((void *)self + 51) = 0;
  *((void *)self + 52) = 0;
  *((void *)self + 50) = 0;
  *((void *)self + 55) = 850045863;
  *((_OWORD *)self + 28) = 0u;
  *((_OWORD *)self + 29) = 0u;
  *((_OWORD *)self + 30) = 0u;
  *((void *)self + 62) = 0;
  return self;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 440));
  objc_storeStrong((id *)self + 54, 0);
  v3 = (void *)*((void *)self + 50);
  if (v3)
  {
    *((void *)self + 51) = v3;
    operator delete(v3);
  }
  objc_storeStrong((id *)self + 49, 0);
  objc_storeStrong((id *)self + 48, 0);
  v4 = (void *)*((void *)self + 44);
  if (v4)
  {
    *((void *)self + 45) = v4;
    operator delete(v4);
  }
  *((void *)self + 41) = &unk_1EF559DB8;

  v5 = (void *)*((void *)self + 38);
  if (v5)
  {
    BOOL v6 = (*v5)-- == 1;
    if (v6)
    {
      md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v5 + 1));
      {
        operator new();
      }
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, *((void *)self + 38), 400);
      *((void *)self + 38) = 0;
    }
  }
  uint64_t v7 = *((void *)self + 35);
  if (v7)
  {
    uint64_t v8 = *((void *)self + 36);
    v9 = (void *)*((void *)self + 35);
    if (v8 != v7)
    {
      uint64_t v10 = *((void *)self + 36);
      do
      {
        v12 = *(void **)(v10 - 8);
        v10 -= 8;
        v11 = v12;
        if (v12)
        {
          BOOL v6 = (*v11)-- == 1;
          if (v6)
          {
            md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v11 + 1));
            {
              operator new();
            }
            (*(void (**)(uint64_t, void, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, *(void *)(v8 - 8), 400);
            *(void *)(v8 - 8) = 0;
          }
        }
        uint64_t v8 = v10;
      }
      while (v10 != v7);
      v9 = (void *)*((void *)self + 35);
    }
    *((void *)self + 36) = v7;
    operator delete(v9);
  }
  objc_destroyWeak((id *)self + 34);
  objc_storeStrong((id *)self + 29, 0);
  objc_storeStrong((id *)self + 27, 0);
  objc_storeStrong((id *)self + 24, 0);
}

- (void)arrows
{
  return (char *)self + 352;
}

- (void)setMatchingEndIndex:(unsigned int)a3
{
  *((_DWORD *)self + 61) = a3;
}

- (unsigned)matchingEndIndex
{
  return *((_DWORD *)self + 61);
}

- (void)setMatchingStartIndex:(unsigned int)a3
{
  *((_DWORD *)self + 60) = a3;
}

- (unsigned)matchingStartIndex
{
  return *((_DWORD *)self + 60);
}

- (void)setNumPathsMatching:(unsigned __int16)a3
{
  *((_WORD *)self + 112) = a3;
}

- (unsigned)numPathsMatching
{
  return *((_WORD *)self + 112);
}

- (GEOPathMatcher)pathMatcher
{
  return (GEOPathMatcher *)*((void *)self + 27);
}

- (double)boundsInWorldUnit
{
  return *((double *)self + 31);
}

- (VKPolylineOverlayRenderRegion)renderRegion
{
  return (VKPolylineOverlayRenderRegion *)*((void *)self + 49);
}

- (void)setObserver:(id)a3
{
}

- (VKRouteLineObserverProtocol)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)self + 34);
  return (VKRouteLineObserverProtocol *)WeakRetained;
}

- (void)setSimplificationEpsilonPoints:(double)a3
{
  *((double *)self + 32) = a3;
}

- (double)simplificationEpsilonPoints
{
  return *((double *)self + 32);
}

- (void)setHasNewRoadMatches:(BOOL)a3
{
  *((unsigned char *)self + 9) = a3;
}

- (BOOL)hasNewRoadMatches
{
  return *((unsigned char *)self + 9) & 1;
}

- (VKPolylineOverlay)overlay
{
  return (VKPolylineOverlay *)*((void *)self + 24);
}

- (Box<double,)bounds
{
  long long v3 = *(_OWORD *)&self->_maximum._e[1];
  *(_OWORD *)retstr->_minimum._e = *(_OWORD *)&self->_minimum._e[2];
  *(_OWORD *)&retstr->_minimum._e[2] = v3;
  *(_OWORD *)&retstr->_maximum._e[1] = *(_OWORD *)self[1]._minimum._e;
  return self;
}

- (vector<geo::fast_shared_ptr<md::RouteLineSection,)sections
{
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  long long v3 = (void **)*((void *)self + 35);
  v4 = (void **)*((void *)self + 36);
  result = (vector<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>, std::allocator<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>>> *)((char *)v4 - (char *)v3);
  if (v4 != v3)
  {
    if (((unint64_t)result & 0x8000000000000000) != 0) {
      abort();
    }
    uint64_t v7 = (uint64_t)result >> 3;
    result = (vector<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>, std::allocator<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>>> *)operator new((size_t)result);
    retstr->__begin_ = result;
    retstr->__end_cap_.__value_ = &result->__begin_ + v7;
    do
    {
      uint64_t v8 = *v3;
      result->__begin_ = *v3;
      if (v8) {
        ++*v8;
      }
      ++v3;
      result = (vector<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>, std::allocator<geo::fast_shared_ptr<md::RouteLineSection, mdm::MDAllocator>>> *)((char *)result + 8);
    }
    while (v3 != v4);
    retstr->__end_ = result;
  }
  return result;
}

- (double)boundsUnitsPerMeter
{
  return *((double *)self + 25);
}

- (Matrix<double,)maneuverTransform
{
  double v3 = self->_e[2];
  double v4 = self->_e[3];
  double v5 = self->_e[4];
  double v6 = self->_e[5];
  double v7 = self->_e[6];
  double v8 = self->_e[7];
  *(_OWORD *)&retstr->_e[5] = 0u;
  *(_OWORD *)&retstr->_e[9] = 0u;
  *(_OWORD *)&retstr->_e[1] = 0u;
  *(_OWORD *)&retstr->_e[3] = 0u;
  *(_OWORD *)&retstr->_e[7] = 0u;
  retstr->_e[11] = 0.0;
  retstr->_e[15] = 1.0;
  retstr->_e[0] = v6 - v3;
  retstr->_e[5] = v7 - v4;
  retstr->_e[10] = v8 - v5;
  retstr->_e[12] = v3;
  retstr->_e[13] = v4;
  retstr->_e[14] = v5;
  return self;
}

- (Matrix<double,)inverseManeuverTransform
{
  long long v3 = *(_OWORD *)&self[1]._e[2];
  *(_OWORD *)&retstr->_e[8] = *(_OWORD *)self[1]._e;
  *(_OWORD *)&retstr->_e[10] = v3;
  long long v4 = *(_OWORD *)&self[1]._e[6];
  *(_OWORD *)&retstr->_e[12] = *(_OWORD *)&self[1]._e[4];
  *(_OWORD *)&retstr->_e[14] = v4;
  long long v5 = *(_OWORD *)&self->_e[10];
  *(_OWORD *)retstr->_e = *(_OWORD *)&self->_e[8];
  *(_OWORD *)&retstr->_e[2] = v5;
  long long v6 = *(_OWORD *)&self->_e[14];
  *(_OWORD *)&retstr->_e[4] = *(_OWORD *)&self->_e[12];
  *(_OWORD *)&retstr->_e[6] = v6;
  return self;
}

- (vector<gm::Matrix<float,)maneuverPoints
{
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2.var0 = 0;
  id v38 = [*((id *)self + 24) composedRoute];
  unint64_t v5 = [v38 stepsCount];
  unint64_t v6 = v5;
  if (v5)
  {
    if (v5 >> 61) {
      abort();
    }
    double v7 = (float *)operator new(8 * v5);
    retstr->var0 = v7;
    retstr->var1 = v7;
    retstr->var2.var0 = &v7[2 * v6];
  }
  else
  {
    double v7 = 0;
  }
  for (unint64_t i = 0; i < [v38 stepsCount]; ++i)
  {
    v9 = [v38 stepAtIndex:i];
    objc_msgSend(v38, "pointAtRouteCoordinate:", objc_msgSend(v9, "endRouteCoordinate"));
    double v11 = v10;
    long double v13 = tan(v12 * 0.00872664626 + 0.785398163);
    long double v14 = log(v13);
    double v15 = v11 * 0.00277777778 + 0.5;
    long double v16 = v14 * 0.159154943 + 0.5;
    float v17 = *((double *)self + 20) + *((double *)self + 8) * v15 + v16 * *((double *)self + 12);
    float v18 = *((double *)self + 21) + *((double *)self + 9) * v15 + *((double *)self + 13) * v16;
    var0 = (float *)retstr->var2.var0;
    if (v7 < var0)
    {
      *double v7 = v17;
      v7[1] = v18;
      v7 += 2;
      goto LABEL_7;
    }
    v20 = (float *)retstr->var0;
    uint64_t v21 = (char *)v7 - (char *)retstr->var0;
    uint64_t v22 = v21 >> 3;
    unint64_t v23 = (v21 >> 3) + 1;
    if (v23 >> 61) {
      abort();
    }
    uint64_t v24 = (char *)var0 - (char *)v20;
    if (v24 >> 2 > v23) {
      unint64_t v23 = v24 >> 2;
    }
    if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v25 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v25 = v23;
    }
    if (v25)
    {
      if (v25 >> 61) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      v26 = operator new(8 * v25);
    }
    else
    {
      v26 = 0;
    }
    v27 = (float *)&v26[8 * v22];
    float *v27 = v17;
    v27[1] = v18;
    if (v7 == v20)
    {
      v20 = v7;
      v30 = (float *)&v26[8 * v22];
    }
    else
    {
      unint64_t v28 = (char *)(v7 - 2) - (char *)v20;
      if (v28 < 0x168
        || &v26[v21 - 8 - (v28 & 0xFFFFFFFFFFFFFFF8)] > &v26[v21 - 8]
        || (float *)((char *)v7 - (v28 & 0xFFFFFFFFFFFFFFF8) - 8) > v7 - 2
        || (unint64_t)((char *)v7 - &v26[v21]) < 0x20)
      {
        v29 = v7;
        v30 = (float *)&v26[8 * v22];
        do
        {
LABEL_23:
          uint64_t v31 = *((void *)v29 - 1);
          v29 -= 2;
          *((void *)v30 - 1) = v31;
          v30 -= 2;
        }
        while (v29 != v20);
        v20 = (float *)retstr->var0;
        goto LABEL_26;
      }
      uint64_t v32 = (v28 >> 3) + 1;
      v29 = &v7[-2 * (v32 & 0x3FFFFFFFFFFFFFFCLL)];
      v33 = &v26[8 * v22 - 16];
      v34 = v7 - 4;
      uint64_t v35 = v32 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v36 = *(_OWORD *)v34;
        *(v33 - 1) = *((_OWORD *)v34 - 1);
        _OWORD *v33 = v36;
        v33 -= 2;
        v34 -= 8;
        v35 -= 4;
      }
      while (v35);
      v30 = &v27[-2 * (v32 & 0x3FFFFFFFFFFFFFFCLL)];
      if (v32 != (v32 & 0x3FFFFFFFFFFFFFFCLL)) {
        goto LABEL_23;
      }
    }
LABEL_26:
    double v7 = v27 + 2;
    retstr->var0 = v30;
    retstr->var1 = v27 + 2;
    retstr->var2.var0 = &v26[8 * v25];
    if (v20) {
      operator delete(v20);
    }
LABEL_7:
    retstr->var1 = v7;
  }

  return result;
}

- (void)_updateBounds:(id)a3 boundsInflation:(float)a4
{
  *((int64x2_t *)self + 1) = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
  *((_OWORD *)self + 2) = xmmword_1A28FC720;
  *((int64x2_t *)self + 3) = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__13;
  v60[4] = __Block_byref_object_dispose__14;
  id v61 = 0;
  v59[0] = 0;
  v59[1] = v59;
  v59[2] = 0x5012000000;
  v59[3] = __Block_byref_object_copy__32;
  v59[4] = __Block_byref_object_dispose__33;
  v59[5] = "";
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x4012000000;
  v58[3] = __Block_byref_object_copy__35;
  v58[4] = __Block_byref_object_dispose__36;
  v58[5] = "";
  uint64_t v54 = 0;
  v55 = (double *)&v54;
  uint64_t v56 = 0x2020000000;
  uint64_t v57 = 0;
  uint64_t v50 = 0;
  v51 = (double *)&v50;
  uint64_t v52 = 0x2020000000;
  uint64_t v53 = 0;
  uint64_t v46 = 0;
  v47 = (float *)&v46;
  uint64_t v48 = 0x2020000000;
  int v49 = 0;
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __45__VKRouteLine__updateBounds_boundsInflation___block_invoke;
  v45[3] = &unk_1E5A93040;
  v45[6] = v59;
  v45[7] = v58;
  v45[8] = &v54;
  v45[9] = &v50;
  v45[4] = self;
  v45[5] = v60;
  v45[10] = &v46;
  forEachNodeInSortedPaths(a3, v45);
  unint64_t v6 = v55;
  v55[3] = *((double *)self + 5) - *((double *)self + 2);
  double v7 = *((double *)self + 6) - *((double *)self + 3);
  v51[3] = v7;
  double v8 = v6[3];
  double v10 = *((double *)self + 2);
  double v9 = *((double *)self + 3);
  if (v8 <= v7)
  {
    double v12 = v10 + v7;
    *((double *)self + 5) = v10 + v7;
    double v11 = *((double *)self + 6);
  }
  else
  {
    double v11 = v9 + v8;
    *((double *)self + 6) = v9 + v8;
    double v12 = *((double *)self + 5);
  }
  double v13 = v12 - v10;
  long double v14 = exp((v9 + (v11 - v9) * 0.5) * 6.28318531 + -3.14159265);
  long double v15 = atan(v14) * 114.591559 + -90.0;
  long double v16 = cos(v15 * 0.034906585) * -559.82 + 111132.92;
  long double v17 = v16 + cos(v15 * 0.0698131701) * 1.175;
  long double v18 = v17 + cos(v15 * 0.104719755) * -0.0023;
  long double v19 = v15 * 0.00872664626;
  long double v20 = tan(v15 * 0.00872664626 + 0.78103484);
  double v21 = log(v20);
  long double v22 = tan(v19 + 0.789761487);
  long double v23 = log(v22);
  long double v24 = v47[6] * a4 * fabs((v23 - v21) * 0.159154943) / v18;
  v6[3] = v13;
  long double v25 = v24 + v13 * 0.005;
  double v26 = *((double *)self + 3);
  double v27 = *((double *)self + 2) - v25;
  double v28 = *((double *)self + 4);
  double v29 = v25 + *((double *)self + 5);
  *((double *)self + 2) = v27;
  *((long double *)self + 3) = v26 - v25;
  double v30 = *((double *)self + 6);
  double v31 = *((double *)self + 7);
  *((double *)self + 5) = v29;
  *((long double *)self + 6) = v30 + v25;
  double v32 = v31 - v28;
  if (v31 - v28 <= 0.000000999999997)
  {
    double v32 = 1.0;
    *((double *)self + 7) = v28 + 1.0;
  }
  double v33 = v29 - v27;
  *((double *)self + 31) = v29 - v27;
  long double v34 = exp((v30 + v26) * 3.14159265 + -3.14159265);
  long double v35 = atan(v34) * 114.591559 + -90.0;
  long double v36 = cos(v35 * 0.034906585) * -559.82 + 111132.92;
  long double v37 = v36 + cos(v35 * 0.0698131701) * 1.175;
  long double v38 = v37 + cos(v35 * 0.104719755) * -0.0023;
  long double v39 = v35 * 0.00872664626;
  long double v40 = tan(v35 * 0.00872664626 + 0.78103484);
  double v41 = log(v40);
  long double v42 = tan(v39 + 0.789761487);
  *((long double *)self + 25) = fabs((log(v42) - v41) * 0.159154943) / (v38 * v33);
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 88) = 0u;
  *((_OWORD *)self + 7) = 0u;
  *((_OWORD *)self + 8) = 0u;
  *((double *)self + 18) = 1.0 / v32;
  *((void *)self + 19) = 0;
  float64x2_t v43 = *((float64x2_t *)self + 1);
  float64x2_t v44 = vsubq_f64(*(float64x2_t *)((char *)self + 40), v43);
  *((double *)self + 8) = 1.0 / v44.f64[0];
  *((double *)self + 13) = 1.0 / v44.f64[1];
  *((float64x2_t *)self + 10) = vdivq_f64(vnegq_f64(v43), v44);
  *((double *)self + 22) = -v28 / v32;
  *((void *)self + 23) = 0x3FF0000000000000;
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(v58, 8);
  _Block_object_dispose(v59, 8);
  _Block_object_dispose(v60, 8);
}

void __45__VKRouteLine__updateBounds_boundsInflation___block_invoke(void *a1, float *a2, float a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v10 = a6;
  double v11 = v10;
  if (*(id *)(*(void *)(a1[5] + 8) + 40) != v10)
  {
    double v12 = [v10 section];
    [v12 vkBounds];
    double v13 = *(void **)(a1[6] + 8);
    v13[6] = v14;
    v13[7] = v15;
    v13[8] = v16;
    v13[9] = v17;

    long double v18 = [v11 section];
    long double v19 = v18;
    if (v18)
    {
      [v18 bounds];
      uint64_t v20 = v34;
    }
    else
    {
      uint64_t v20 = 0;
    }
    double v21 = [v11 section];
    long double v22 = v21;
    if (v21)
    {
      [v21 bounds];
      double v23 = v33;
    }
    else
    {
      double v23 = 0.0;
    }
    long double v24 = [v11 section];
    long double v25 = v24;
    if (v24)
    {
      [v24 bounds];
      double v26 = v32;
    }
    else
    {
      double v26 = 0.0;
    }
    uint64_t v27 = *(void *)(a1[7] + 8);
    *(void *)(v27 + 48) = v20;
    *(double *)(v27 + 56) = v26 + v23;

    *(double *)(*(void *)(a1[8] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 64)
                                                 - *(double *)(*(void *)(a1[6] + 8) + 48);
    *(double *)(*(void *)(a1[9] + 8) + 24) = *(double *)(*(void *)(a1[6] + 8) + 72)
                                                 - *(double *)(*(void *)(a1[6] + 8) + 56);
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a6);
  }
  uint64_t v28 = *(void *)(a1[6] + 8);
  double v29 = *(double *)(v28 + 48) + *(double *)(*(void *)(a1[8] + 8) + 24) * *a2;
  double v30 = *(double *)(v28 + 56) + *(double *)(*(void *)(a1[9] + 8) + 24) * a2[1];
  double v31 = *(double *)(*(void *)(a1[7] + 8) + 48) + a2[2];
  *(double *)(a1[4] + 16) = fmin(*(double *)(a1[4] + 16), v29);
  *(double *)(a1[4] + 40) = fmax(*(double *)(a1[4] + 40), v29);
  *(double *)(a1[4] + 24) = fmin(*(double *)(a1[4] + 24), v30);
  *(double *)(a1[4] + 48) = fmax(*(double *)(a1[4] + 48), v30);
  *(double *)(a1[4] + 32) = fmin(*(double *)(a1[4] + 32), v31);
  *(double *)(a1[4] + 56) = fmax(*(double *)(a1[4] + 56), v31);
  *(float *)(*(void *)(a1[10] + 8) + 24) = fmaxf(*(float *)(*(void *)(a1[10] + 8) + 24), a3);
}

- (void)forEachSection:(id)a3
{
  long long v4 = (void (**)(id, void *))a3;
  if (v4)
  {
    unint64_t v5 = (void **)*((void *)self + 35);
    unint64_t v6 = (void **)*((void *)self + 36);
    if (v5 != v6)
    {
      while (1)
      {
        double v7 = *v5;
        v10[1] = v7;
        if (v7) {
          *v7 += 2;
        }
        v10[0] = v7;
        v4[2](v4, v10);
        uint64_t v8 = v10[0];
        if (v10[0])
        {
          BOOL v9 = (*(void *)v10[0])-- == 1;
          if (v9) {
            break;
          }
        }
        if (v7) {
          goto LABEL_11;
        }
LABEL_5:
        if (++v5 == v6) {
          goto LABEL_21;
        }
      }
      md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v8 + 8));
      {
        operator new();
      }
      (*(void (**)(uint64_t, void, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v10[0], 400);
      v10[0] = 0;
      if (!v7) {
        goto LABEL_5;
      }
LABEL_11:
      BOOL v9 = (*v7)-- == 1;
      if (v9)
      {
        md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v7 + 1));
        {
          operator new();
        }
        (*(void (**)(uint64_t, void *, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v7, 400);
      }
      goto LABEL_5;
    }
  }
LABEL_21:
}

- (void)splitRouteLineAtAnnotation:(id)a3 puckOffset:(PolylineCoordinate)a4
{
  id v6 = a3;
  double v7 = [v6 routeMatch];
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_15;
  }
  BOOL v9 = [v7 route];
  id v10 = [v9 uniqueRouteID];
  double v11 = [(VKRouteLine *)self overlay];
  double v12 = [v11 composedRoute];
  double v13 = [v12 uniqueRouteID];
  char v14 = [v10 isEqual:v13];

  if (v14)
  {
    [v6 presentationCoordinate];
    double v16 = v15;
    [v6 presentationCoordinate];
    double v18 = v17;
    long double v19 = tan(v16 * 0.00872664626 + 0.785398163);
    double v20 = log(v19);
    double v21 = *((double *)self + 8);
    double v22 = *((double *)self + 9);
    double v24 = *((double *)self + 12);
    double v23 = *((double *)self + 13);
    double v26 = *((double *)self + 20);
    double v25 = *((double *)self + 21);
    if (*MEMORY[0x1E4F64198] == a4.index && vabds_f32(a4.offset, *(float *)(MEMORY[0x1E4F64198] + 4)) < 0.00000011921) {
      a4 = (PolylineCoordinate)[v8 routeCoordinate];
    }
    double v27 = v18 * 0.00277777778 + 0.5;
    double v28 = v20 * 0.159154943 + 0.5;
    double v29 = v26 + v21 * v27 + v28 * v24;
    float v30 = v29;
    float v31 = v25 + v22 * v27 + v23 * v28;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x3812000000;
    v44[3] = __Block_byref_object_copy__18_24205;
    v44[4] = __Block_byref_object_dispose__19_24206;
    v44[5] = "";
    v45 = 0;
    if (*((float *)self + 79) < 0.0
      || vabds_f32(v30, *((float *)self + 80)) >= 1.0e-10
      || vabds_f32(v31, *((float *)self + 81)) >= 1.0e-10)
    {
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __53__VKRouteLine_splitRouteLineAtAnnotation_puckOffset___block_invoke;
      v38[3] = &unk_1E5A93018;
      long double v40 = v44;
      PolylineCoordinate v41 = a4;
      float v42 = v29;
      float v43 = v25 + v22 * v27 + v23 * v28;
      v38[4] = self;
      id v39 = v8;
      [(VKRouteLine *)self forEachSection:v38];
    }
    *((float *)self + 80) = v30;
    *((float *)self + 81) = v31;
    _Block_object_dispose(v44, 8);
    double v32 = v45;
    if (v45)
    {
      if ((*v45)-- == 1)
      {
        md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v32 + 1));
        {
          operator new();
        }
        (*(void (**)(uint64_t, void *, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v45, 400);
      }
    }
  }
  else
  {
LABEL_15:
    *((void *)self + 39) = 0xBF80000000000000;
    uint64_t v34 = (uint64_t **)*((void *)self + 35);
    for (unint64_t i = (uint64_t **)*((void *)self + 36); v34 != i; ++v34)
    {
      long double v36 = *v34;
      if (*v34)
      {
        uint64_t v37 = *v36;
        *((_DWORD *)v36 + 18) = -1082130432;
        if (!v37)
        {
          md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v36 + 1));
          {
            operator new();
          }
          (*(void (**)(uint64_t, uint64_t *, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v36, 400);
        }
      }
      else
      {
        MEMORY[0x40] = -1082130432;
      }
    }
  }
}

void __53__VKRouteLine_splitRouteLineAtAnnotation_puckOffset___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v5 = (unsigned int *)(a1 + 56);
  unsigned int v4 = *(_DWORD *)(a1 + 56);
  id v6 = *(void **)a2;
  if (*(void *)a2) {
    uint64_t v7 = *(void *)a2 + 8;
  }
  else {
    uint64_t v7 = 0;
  }
  unsigned int v8 = *(_DWORD *)(v7 + 88);
  if (v4 < v8 || v4 == v8 && *(float *)(a1 + 60) < *(float *)(v7 + 92))
  {
    BOOL v9 = (const PolylineCoordinate *)md::RouteLineSection::kSplitLocationBeforeSection;
LABEL_45:
    md::RouteLineSection::split((md::RouteLineSection *)v7, v9);
    goto LABEL_46;
  }
  unsigned int v10 = *(_DWORD *)(v7 + 96);
  if (v10 < v4 || v10 == v4 && *(float *)(v7 + 100) < *(float *)(a1 + 60))
  {
    BOOL v9 = (const PolylineCoordinate *)md::RouteLineSection::kSplitLocationAfterSection;
    goto LABEL_45;
  }
  double v11 = *(void **)(a1 + 32);
  v58 = *(void **)a2;
  if (v6) {
    ++*v6;
  }
  unsigned int v12 = [v11 _getSnappedSegment:&v58 coord:v5];
  char v14 = v13;
  double v15 = v58;
  if (v58)
  {
    BOOL v16 = (*v58)-- == 1;
    if (v16)
    {
      md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v15 + 1));
      {
        operator new();
      }
      (*(void (**)(uint64_t, void *, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v58, 400);
      v58 = 0;
    }
  }
  if (v14)
  {
    uint64_t v17 = v12;
    if ((int)(v12 - 5) <= 1) {
      unint64_t v18 = 1;
    }
    else {
      unint64_t v18 = v12 - 5;
    }
    unint64_t v19 = v17 + 5;
    if (*(void *)a2) {
      uint64_t v20 = *(void *)a2 + 8;
    }
    else {
      uint64_t v20 = 0;
    }
    unint64_t v21 = (*(uint64_t (**)(uint64_t))(*(void *)v20 + 56))(v20);
    if (v21 >= v19) {
      unint64_t v22 = v19;
    }
    else {
      unint64_t v22 = v21;
    }
    *(void *)(*(void *)(a1 + 32) + 312) = 0;
    if (v22 > v18)
    {
      float v23 = 3.4028e38;
      do
      {
        double v24 = (float *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)(*(void *)a2 + 8) + 48))(*(void *)a2 + 8, v18 - 1);
        float v26 = *v24;
        float v25 = v24[1];
        double v27 = (float *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)(*(void *)a2 + 8) + 48))(*(void *)a2 + 8, v18);
        float v28 = *v27 - v26;
        float v29 = v27[1] - v25;
        float v30 = (float)(v28 * v28) + (float)(v29 * v29);
        float v32 = *(float *)(a1 + 64);
        float v31 = *(float *)(a1 + 68);
        float v33 = 0.0;
        if (v30 > 1.0e-15) {
          float v33 = fminf(fmaxf((float)((float)((float)(v32 - v26) * v28) + (float)((float)(v31 - v25) * v29)) / v30, 0.0), 1.0);
        }
        float v34 = (float)((float)(v32 - (float)(v26 + (float)(v33 * v28))) * (float)(v32 - (float)(v26 + (float)(v33 * v28))))
            + (float)((float)(v31 - (float)(v25 + (float)(v33 * v29))) * (float)(v31 - (float)(v25 + (float)(v33 * v29))));
        if (v34 < v23)
        {
          BOOL v35 = v33 < 1.0;
          int v36 = vcvtms_u32_f32(v33) + v18 - 1;
          float v37 = v33 - floorf(v33);
          if (v33 >= 1.0) {
            float v33 = v37;
          }
          uint64_t v38 = *(void *)(a1 + 32);
          if (v35) {
            int v36 = v18 - 1;
          }
          *(_DWORD *)(v38 + 312) = v36;
          *(float *)(v38 + 316) = v33;
          float v23 = v34;
        }
        ++v18;
      }
      while (v22 != v18);
    }
    if (*(void *)a2) {
      uint64_t v7 = *(void *)a2 + 8;
    }
    else {
      uint64_t v7 = 0;
    }
    BOOL v9 = (const PolylineCoordinate *)(*(void *)(a1 + 32) + 312);
    goto LABEL_45;
  }
LABEL_46:
  id v39 = *(void **)a2;
  uint64_t v40 = *(void *)a2 + 8;
  if (!*(void *)a2) {
    uint64_t v40 = 0;
  }
  unsigned int v41 = *(_DWORD *)(v40 + 88);
  unsigned int v42 = *v5;
  if ((v41 < *v5 || v41 == v42 && *(float *)(v40 + 92) <= *(float *)(a1 + 60))
    && ((unsigned int v43 = *(_DWORD *)(v40 + 96), v42 < v43) || v42 == v43 && *(float *)(a1 + 60) <= *(float *)(v40 + 100)))
  {
    *(unsigned char *)(v40 + 237) = 1;
    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48))
    {
      float64x2_t v44 = [*(id *)(a1 + 40) route];
      v45 = v44;
      uint64_t v46 = *(void *)a2 ? *(void *)a2 + 8 : 0;
      [v44 distanceBetweenRouteCoordinate:*(void *)(v46 + 88) andRouteCoordinate:*(void *)(v46 + 96)];
      double v48 = v47;

      int v49 = [*(id *)(a1 + 40) route];
      uint64_t v50 = v49;
      uint64_t v51 = *(void *)a2 ? *(void *)a2 + 8 : 0;
      [v49 distanceBetweenRouteCoordinate:*(void *)(v51 + 88) andRouteCoordinate:*(void *)(a1 + 56)];
      double v53 = v52;

      if (v53 < v48 * 0.5)
      {
        uint64_t v54 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 48);
        if (v54) {
          uint64_t v55 = v54 + 8;
        }
        else {
          uint64_t v55 = 0;
        }
        *(unsigned char *)(v55 + 237) = 1;
      }
    }
  }
  else
  {
    *(unsigned char *)(v40 + 237) = 0;
    uint64_t v56 = *(void *)(*(void *)(a1 + 48) + 8);
    if (v39) {
      ++*v39;
    }
    uint64_t v57 = *(void **)(v56 + 48);
    if (v57)
    {
      BOOL v16 = (*v57)-- == 1;
      if (v16)
      {
        md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v57 + 1));
        {
          operator new();
        }
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, *(void *)(v56 + 48), 400);
        *(void *)(v56 + 48) = 0;
        id v39 = *(void **)a2;
      }
    }
    *(void *)(v56 + 48) = v39;
  }
}

- (optional<VKRouteLineSnapResult>)snapRouteMatch:(SEL)a3
{
  uint64_t v116 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v6) {
    goto LABEL_41;
  }
  unsigned int v8 = [v6 route];
  if (!v8) {
    goto LABEL_41;
  }
  BOOL v9 = [v7 route];
  unsigned int v10 = [v9 uniqueRouteID];
  double v11 = [(VKRouteLine *)self overlay];
  unsigned int v12 = [v11 composedRoute];
  char v13 = [v12 uniqueRouteID];
  char v14 = [v10 isEqual:v13];

  if ((v14 & 1) == 0
    || ([v7 locationCoordinate3D],
        [v7 locationCoordinate3D],
        uint64_t v15 = [v7 routeCoordinate],
        v93 = self,
        uint64_t v94 = v15,
        uint64_t v17 = (void *)*((void *)self + 35),
        BOOL v16 = (void *)*((void *)self + 36),
        v17 == v16))
  {
LABEL_41:
    retstr->var0.var0 = 0;
    retstr->var1 = 0;
    goto LABEL_42;
  }
  while (1)
  {
    uint64_t v18 = *v17 ? *v17 + 8 : 0;
    if ((unint64_t)(*(uint64_t (**)(uint64_t))(*(void *)v18 + 56))(v18) > 1) {
      break;
    }
    if (GEOGetVectorKitVKRouteLineLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKRouteLineLog(void)::onceToken, &__block_literal_global_24209);
    }
    uint64_t v19 = GEOGetVectorKitVKRouteLineLog(void)::log;
    if (!os_log_type_enabled((os_log_t)GEOGetVectorKitVKRouteLineLog(void)::log, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = v19;
    unint64_t v21 = "[RouteSnapping] Not enough vertices";
LABEL_6:
    _os_log_impl(&dword_1A1780000, v20, OS_LOG_TYPE_INFO, v21, buf, 2u);
LABEL_7:
    if (++v17 == v16) {
      goto LABEL_41;
    }
  }
  uint64_t v22 = *v17 + 8;
  if (!*v17) {
    uint64_t v22 = 0;
  }
  unsigned int v23 = *(_DWORD *)(v22 + 88);
  if (v23 > v15
    || v23 == v15 && *(float *)(v22 + 92) > *((float *)&v15 + 1)
    || (unsigned int v24 = *(_DWORD *)(v22 + 96), v24 < v15)
    || v24 == v15 && *(float *)(v22 + 100) < *((float *)&v15 + 1))
  {
    if (GEOGetVectorKitVKRouteLineLog(void)::onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKRouteLineLog(void)::onceToken, &__block_literal_global_24209);
    }
    uint64_t v25 = GEOGetVectorKitVKRouteLineLog(void)::log;
    if (!os_log_type_enabled((os_log_t)GEOGetVectorKitVKRouteLineLog(void)::log, OS_LOG_TYPE_INFO)) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v20 = v25;
    unint64_t v21 = "[RouteSnapping] Section not contained";
    goto LABEL_6;
  }
  uint64_t v26 = *(void *)(v22 + 8);
  uint64_t v27 = *(void *)(v22 + 16);
  if (v27 == v26)
  {
    uint64_t v29 = v26;
  }
  else
  {
    unint64_t v28 = 0xAAAAAAAAAAAAAAABLL * ((v27 - v26) >> 4);
    uint64_t v29 = v26;
    do
    {
      unint64_t v30 = v28 >> 1;
      uint64_t v31 = v29 + 48 * (v28 >> 1);
      unsigned int v32 = *(_DWORD *)(v31 + 12);
      if (v32 < v15
        || (v32 == v15 ? (_NF = *(float *)(v31 + 16) < *((float *)&v15 + 1)) : (_NF = 0), _NF))
      {
        uint64_t v29 = v31 + 48;
        unint64_t v30 = v28 + ~v30;
      }
      unint64_t v28 = v30;
    }
    while (v30);
  }
  if (v29 == v27) {
    goto LABEL_7;
  }
  if (v29 == v26) {
    uint64_t v35 = 0;
  }
  else {
    uint64_t v35 = -1;
  }
  uint64_t v36 = v29 + 48 * v35;
  [(VKRouteLine *)v93 _findSimplifiedOffsetFor:&v94 betweenA:v36 + 12 andB:v29 + 12];
  double v38 = v37;
  float v39 = *(float *)v36;
  float v40 = *(float *)(v36 + 4);
  float v41 = *(float *)(v36 + 8);
  float v42 = *(float *)v29;
  float v43 = *(float *)(v29 + 4);
  float v44 = *(float *)(v29 + 8);
  [(VKRouteLine *)v93 maneuverTransform];
  float v45 = v38;
  double v46 = (float)(v39 + (float)((float)(v42 - v39) * v45));
  double v47 = (float)(v40 + (float)((float)(v43 - v40) * v45));
  double v91 = (float)(v41 + (float)((float)(v44 - v41) * v45));
  _Q3 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v102, *(float64x2_t *)buf, v46), *(float64x2_t *)&v97[2], v47), *(float64x2_t *)v100, v91);
  double v86 = v46;
  double v88 = v47;
  double v49 = v103 + *(double *)&buf[16] * v46 + v98 * v47;
  double v50 = *(double *)&v100[16];
  _D9 = 0x401921FB54442D18;
  long double v52 = 6.28318531 * _Q3.f64[0];
  float64x2_t v90 = _Q3;
  __asm { FMLA            D0, D9, V3.D[1]; __x }
  long double v57 = exp(_D0);
  double v58 = atan(v57);
  long double v59 = fmod(v52, 6.28318531);
  double v60 = fmod(v59 + 6.28318531, 6.28318531);
  if (GEOGetVectorKitVKRouteLineLog(void)::onceToken != -1) {
    dispatch_once(&GEOGetVectorKitVKRouteLineLog(void)::onceToken, &__block_literal_global_24209);
  }
  double v61 = v49 + v50 * v91;
  v62 = GEOGetVectorKitVKRouteLineLog(void)::log;
  if (os_log_type_enabled((os_log_t)GEOGetVectorKitVKRouteLineLog(void)::log, OS_LOG_TYPE_INFO))
  {
    int v63 = *(_DWORD *)(v36 + 12);
    double v64 = *(float *)(v29 + 48 * v35 + 16);
    double v65 = *(float *)v36;
    double v66 = *(float *)(v36 + 4);
    double v67 = *(float *)(v36 + 8);
    int v68 = *(_DWORD *)(v29 + 12);
    double v69 = *(float *)(v29 + 16);
    double v70 = *(float *)v29;
    double v71 = *(float *)(v29 + 4);
    double v72 = *(float *)(v29 + 8);
    *(_DWORD *)buf = 67113729;
    *(_DWORD *)&buf[4] = v63;
    *(_WORD *)&buf[8] = 2048;
    *(double *)&buf[10] = v64;
    *(_WORD *)&buf[18] = 2048;
    *(double *)&buf[20] = v65;
    __int16 v96 = 2048;
    *(double *)v97 = v66;
    *(_WORD *)&v97[8] = 2048;
    *(double *)&v97[10] = v67;
    LOWORD(v98) = 1024;
    *(_DWORD *)((char *)&v98 + 2) = v68;
    HIWORD(v98) = 2048;
    double v99 = v69;
    *(_WORD *)v100 = 2048;
    *(double *)&v100[2] = v70;
    *(_WORD *)&v100[10] = 2048;
    *(double *)&v100[12] = v71;
    *(_WORD *)&v100[20] = 2048;
    *(double *)&v100[22] = v72;
    __int16 v101 = 2048;
    v102.f64[0] = v45;
    LOWORD(v102.f64[1]) = 1024;
    *(_DWORD *)((char *)&v102.f64[1] + 2) = v94;
    HIWORD(v102.f64[1]) = 2048;
    double v103 = *((float *)&v94 + 1);
    __int16 v104 = 2048;
    double v105 = v86;
    __int16 v106 = 2048;
    double v107 = v88;
    __int16 v108 = 2048;
    double v109 = v91;
    __int16 v110 = 2049;
    double v111 = v58 * 114.591559 + -90.0;
    __int16 v112 = 2049;
    double v113 = v60 * 57.2957795 + -180.0;
    __int16 v114 = 2049;
    double v115 = v49 + v50 * v91;
    _os_log_impl(&dword_1A1780000, v62, OS_LOG_TYPE_INFO, "[RouteSnapping] Segment matched: point0 routeIndexAndOffset: (%d, %f), position: (%f, %f, %f) | point1 routeIndexAndOffset: (%d, %f) position: (%f %f %f) |  offset %f | routeCoordinate: (%d, %f) | localResult (%f, %f, %f) | worldResultCoordinate (%{private}f, %{private}f, %{private}f)\n", buf, 0xB4u);
  }
  [(VKRouteLine *)v93 maneuverTransform];
  float v73 = *(float *)v36;
  float v74 = *(float *)(v36 + 4);
  float v75 = *(float *)(v36 + 8);
  float64x2_t v85 = *(float64x2_t *)buf;
  float64x2_t v87 = *(float64x2_t *)&v97[2];
  float64x2_t v89 = *(float64x2_t *)v100;
  float64x2_t v92 = v102;
  double v76 = *(double *)&buf[16];
  double v77 = v98;
  double v78 = *(double *)&v100[16];
  double v79 = v103;
  [(VKRouteLine *)v93 maneuverTransform];
  double v80 = *(float *)v29;
  double v81 = *(float *)(v29 + 4);
  double v82 = *(float *)(v29 + 8);
  double v83 = v103 + *(double *)&buf[16] * v80 + v98 * v81 + *(double *)&v100[16] * v82;
  float64x2_t v84 = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v102, *(float64x2_t *)buf, v80), *(float64x2_t *)&v97[2], v81), *(float64x2_t *)v100, v82);
  *(float64x2_t *)&retstr->var0.var0 = v90;
  retstr->var0.var1.var0._e[2] = v61;
  *(float64x2_t *)retstr->var0.var1.var1.first._e = vmlaq_n_f64(vmlaq_n_f64(vmlaq_n_f64(v92, v85, v73), v87, v74), v89, v75);
  retstr->var0.var1.var1.first._e[2] = v79 + v76 * v73 + v77 * v74 + v78 * v75;
  *(float64x2_t *)retstr->var0.var1.var1.second._e = v84;
  retstr->var0.var1.var1.second._e[2] = v83;
  retstr->var1 = 1;
LABEL_42:

  return result;
}

- (BOOL)needsUpdateForViewingScale:(double)a3
{
  double v4 = *((double *)self + 53);
  if (v4 == 0.0)
  {
    BOOL v7 = 1;
  }
  else
  {
    float v5 = (v4 - a3) / v4;
    float v6 = fabsf(v5);
    if (v4 >= a3) {
      BOOL v7 = v6 > 0.45;
    }
    else {
      BOOL v7 = v6 > 1.0;
    }
  }
  if ([(VKRouteLine *)self isTrafficUpToDate]
    && ![(VKRouteLine *)self hasNewRoadMatches])
  {
    BOOL v9 = [(VKRouteLine *)self composedRoute];
    unsigned int v10 = [v9 revisionIdentifier];
    unsigned int v12 = v10;
    int v8 = geo::_retain_ptr<NSUUID * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)self + 42), &v12) ^ 1 | v7;
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  return v8;
}

- (BOOL)isTrafficUptoDate:(double)a3
{
  [*((id *)self + 24) trafficTimeStamp];
  return v4 <= a3;
}

- (BOOL)isTrafficUpToDate
{
  double v2 = *((double *)self + 47);
  [*((id *)self + 24) trafficTimeStamp];
  return v2 >= v3;
}

- (void)createMeshIfNecessary:(int64_t)a3
{
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __37__VKRouteLine_createMeshIfNecessary___block_invoke;
  v21[3] = &unk_1E5A92FF0;
  v21[4] = self;
  v21[5] = a3;
  [(VKRouteLine *)self forEachSection:v21];
  uint64_t v4 = *((void *)self + 44);
  for (uint64_t i = *((void *)self + 45); v4 != i; v4 += 44)
  {
    while (1)
    {
      uint64_t v6 = *((void *)self + 35);
      if (*((void *)self + 36) != v6) {
        break;
      }
LABEL_3:
      v4 += 44;
      if (v4 == i) {
        goto LABEL_29;
      }
    }
    uint64_t v7 = 0;
    unsigned int v8 = 0;
    while (1)
    {
      uint64_t v9 = *(void *)(v6 + 8 * v7);
      if (v9) {
        uint64_t v10 = v9 + 8;
      }
      else {
        uint64_t v10 = 0;
      }
      unsigned int v11 = *(_DWORD *)(v10 + 88);
      unsigned int v12 = *(_DWORD *)(v4 + 12);
      if (v11 < v12 || v11 == v12 && *(float *)(v10 + 92) <= *(float *)(v4 + 16))
      {
        unsigned int v13 = *(_DWORD *)(v10 + 96);
        if (v12 < v13 || v12 == v13 && *(float *)(v4 + 16) <= *(float *)(v10 + 100))
        {
          PolylineCoordinate v14 = *(PolylineCoordinate *)(v4 + 12);
          *(void *)(v4 + 28) = md::RouteLineSection::simplifiedCoordinate((md::RouteLineSection *)v10, *((VKPolylineOverlay **)self + 24), v14);
          *(_DWORD *)(v4 + 4) = v8;
          uint64_t v6 = *((void *)self + 35);
          uint64_t v9 = *(void *)(v6 + 8 * v7);
        }
      }
      uint64_t v15 = v9 ? v9 + 8 : 0;
      unsigned int v16 = *(_DWORD *)(v15 + 88);
      unsigned int v17 = *(_DWORD *)(v4 + 20);
      if (v16 < v17 || v16 == v17 && *(float *)(v15 + 92) <= *(float *)(v4 + 24))
      {
        unsigned int v18 = *(_DWORD *)(v15 + 96);
        if (v17 < v18 || v17 == v18 && *(float *)(v4 + 24) <= *(float *)(v15 + 100)) {
          break;
        }
      }
      uint64_t v7 = ++v8;
      if (v8 >= (unint64_t)((*((void *)self + 36) - v6) >> 3)) {
        goto LABEL_3;
      }
    }
    PolylineCoordinate v19 = *(PolylineCoordinate *)(v4 + 20);
    *(void *)(v4 + 36) = md::RouteLineSection::simplifiedCoordinate((md::RouteLineSection *)v15, *((VKPolylineOverlay **)self + 24), v19);
    *(_DWORD *)(v4 + 8) = v8;
  }
LABEL_29:
  id WeakRetained = objc_loadWeakRetained((id *)self + 34);
  [WeakRetained routeLineDidUpdateSections:self];
}

void __37__VKRouteLine_createMeshIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  if (*a2) {
    uint64_t v2 = *a2 + 8;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  id v21 = *(id *)(v3 + 192);
  size_t v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v2 + 16) - *(void *)(v2 + 8)) >> 4);
  if (v4 >= 2)
  {
    double v5 = *(double *)(v3 + 256);
    double v6 = *(double *)(v3 + 264);
    double v7 = *(double *)(v2 + 120);
    if (v7 < 0.0 || vabdd_f64(v7 / v6, v5) > 1.0)
    {
      if (*(void *)(v2 + 104))
      {
        free(*(void **)(v2 + 104));
        *(void *)(v2 + 104) = 0;
        size_t v4 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v2 + 16) - *(void *)(v2 + 8)) >> 4);
      }
      *(void *)(v2 + 112) = 0;
      *(void *)(v2 + 120) = 0xBFF0000000000000;
      unsigned int v8 = malloc_type_calloc(v4, 8uLL, 0x100004000313F17uLL);
      double v9 = v6 * v5;
      *(double *)(v2 + 120) = v9;
      *(void *)(v2 + 104) = v8;
      *(void *)(v2 + 112) = 1;
      *unsigned int v8 = 0;
      uint64_t v10 = (uint64_t (**)(void, void, void, void))MEMORY[0x1A6239EB0]();
      unsigned int v11 = *(float32x2_t **)(v2 + 8);
      unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*(void *)(v2 + 16) - (void)v11) >> 4);
      if (v12 >= 2)
      {
        unint64_t v13 = 1;
        uint64_t v14 = 48;
        do
        {
          unint64_t v15 = v12 - 1;
          char v16 = ((uint64_t (**)(void, uint64_t, unint64_t, BOOL))v10)[2](v10, v2 + 8, v13, v13 == v12 - 1);
          if (v13 == v15) {
            char v17 = 1;
          }
          else {
            char v17 = v16;
          }
          uint64_t v18 = *(void *)(v2 + 8);
          if ((v17 & 1) != 0
            || (float32x2_t v19 = vsub_f32(*v11, *(float32x2_t *)(v18 + v14)), v9 < sqrtf(vaddv_f32(vmul_f32(v19, v19)))))
          {
            *(void *)(*(void *)(v2 + 104) + 8 * *(void *)(v2 + 112)) = v13;
            unsigned int v11 = (float32x2_t *)(v18 + v14);
            ++*(void *)(v2 + 112);
          }
          ++v13;
          unint64_t v12 = 0xAAAAAAAAAAAAAAABLL * ((*(void *)(v2 + 16) - v18) >> 4);
          v14 += 48;
        }
        while (v12 > v13);
      }

      uint64_t v20 = *(void *)(v2 + 72);
      if (v20) {
        (*(void (**)(uint64_t))(*(void *)v20 + 8))(v20);
      }
      operator new();
    }
    if (!*(void *)(v2 + 72)) {
      operator new();
    }
  }
}

- (void)generateArrowsForManeuverDisplayMode:(int)a3 routeLineWidth:(double)a4 collideTrafficFeatures:(const void *)a5
{
  unsigned int v8 = self;
  *((void *)self + 45) = *((void *)self + 44);
  double v9 = [*((id *)self + 24) composedRoute];
  unsigned int v10 = [v9 currentDisplayStep];

  unsigned int v11 = [*((id *)v8 + 24) composedRoute];
  char v12 = [v11 maneuverDisplayEnabled];

  char v13 = v12 ^ 1;
  if (!a3) {
    char v13 = 1;
  }
  if (v13) {
    return;
  }
  uint64_t v14 = (void *)((char *)v8 + 400);
  unint64_t v15 = [*((id *)v8 + 24) composedRoute];
  float v16 = *((double *)v8 + 26);
  float v17 = a4;
  md::ManeuverArrowCoordinates::update((void *)v8 + 50, v15, a5, v10, v16, v17);
  double v82 = (void **)((char *)v8 + 352);

  double v81 = v8;
  if (a3 != 1)
  {
    if (a3 == 2)
    {
      uint64_t v18 = *((void *)v8 + 51) - *((void *)v8 + 50);
      if (v18)
      {
        uint64_t v19 = 0;
        unint64_t v20 = 0xCCCCCCCCCCCCCCCDLL * (v18 >> 2);
        while (1)
        {
          uint64_t v22 = *v14 + 20 * v19;
          if (*(unsigned char *)(v22 + 16))
          {
            uint64_t v24 = *(void *)v22;
            uint64_t v23 = *(void *)(v22 + 8);
            uint64_t v26 = (char *)*((void *)v8 + 45);
            unint64_t v25 = *((void *)v8 + 46);
            if ((unint64_t)v26 < v25)
            {
              *(_DWORD *)uint64_t v26 = v19;
              *(void *)(v26 + 4) = -1;
              *(void *)(v26 + 12) = v24;
              *(void *)(v26 + 20) = v23;
              *(void *)(v26 + 28) = 0xBF80000000000000;
              id v21 = v26 + 44;
              *(void *)(v26 + 36) = 0xBF80000000000000;
            }
            else
            {
              uint64_t v27 = (char *)*v82;
              uint64_t v28 = 0x2E8BA2E8BA2E8BA3 * ((v26 - (unsigned char *)*v82) >> 2);
              unint64_t v29 = v28 + 1;
              if ((unint64_t)(v28 + 1) > 0x5D1745D1745D174) {
                abort();
              }
              unint64_t v30 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v25 - (void)v27) >> 2);
              if (2 * v30 > v29) {
                unint64_t v29 = 2 * v30;
              }
              if (v30 >= 0x2E8BA2E8BA2E8BALL) {
                unint64_t v31 = 0x5D1745D1745D174;
              }
              else {
                unint64_t v31 = v29;
              }
              if (v31 > 0x5D1745D1745D174) {
                goto LABEL_93;
              }
              uint64_t v32 = 44 * v31;
              float v33 = (char *)operator new(44 * v31);
              float v34 = &v33[44 * v28];
              *(_DWORD *)float v34 = v19;
              *(void *)(v34 + 4) = -1;
              *(void *)(v34 + 12) = v24;
              *(void *)(v34 + 20) = v23;
              *(void *)(v34 + 28) = 0xBF80000000000000;
              *(void *)(v34 + 36) = 0xBF80000000000000;
              if (v26 == v27)
              {
                double v38 = &v33[44 * v28];
                unsigned int v8 = v81;
              }
              else
              {
                uint64_t v35 = &v33[44 * v28];
                unsigned int v8 = v81;
                do
                {
                  long long v36 = *(_OWORD *)(v26 - 44);
                  long long v37 = *(_OWORD *)(v26 - 28);
                  double v38 = v35 - 44;
                  *((_OWORD *)v35 - 1) = *((_OWORD *)v26 - 1);
                  *(_OWORD *)(v35 - 28) = v37;
                  *(_OWORD *)(v35 - 44) = v36;
                  v26 -= 44;
                  v35 -= 44;
                }
                while (v26 != v27);
              }
              id v21 = v34 + 44;
              *((void *)v8 + 44) = v38;
              *((void *)v8 + 45) = v34 + 44;
              *((void *)v8 + 46) = &v33[v32];
              if (v27) {
                operator delete(v27);
              }
            }
            *((void *)v8 + 45) = v21;
          }
          if (++v19 == v20) {
            return;
          }
        }
      }
    }
    return;
  }
  uint64_t v39 = *((void *)v8 + 50);
  uint64_t v40 = *((void *)v8 + 51);
  if (v40 == v39) {
    return;
  }
  float v41 = (int *)(v39 + 20 * v10);
  if (*((unsigned char *)v41 + 16))
  {
    unint64_t v42 = 0;
    unsigned int v43 = *v41;
    float v44 = *((float *)v41 + 1);
    uint64_t v80 = *((void *)v41 + 1);
    while (1)
    {
      uint64_t v45 = *((void *)v8 + 35);
      if (v42 >= (*((void *)v8 + 36) - v45) >> 3)
      {
LABEL_71:
        uint64_t v39 = *((void *)v8 + 50);
        uint64_t v40 = *((void *)v8 + 51);
        goto LABEL_73;
      }
      double v46 = *(void **)(v45 + 8 * v42);
      if (v46) {
        ++*v46;
      }
      double v47 = (md::RouteLineSection *)(v46 + 1);
      uint64_t v48 = v46 ? (uint64_t)(v46 + 1) : 0;
      unsigned int v49 = *(_DWORD *)(v48 + 88);
      if (v43 > v49 || v43 == v49 && v44 >= *(float *)(v48 + 92))
      {
        unsigned int v50 = *(_DWORD *)(v48 + 96);
        if (v43 < v50 || v43 == v50 && v44 <= *(float *)(v48 + 100)) {
          break;
        }
      }
      ++v42;
      char v54 = 1;
      if (v46) {
        goto LABEL_66;
      }
LABEL_32:
      if ((v54 & 1) == 0) {
        goto LABEL_71;
      }
    }
    long double v52 = (unsigned int *)*((void *)v8 + 45);
    unint64_t v51 = *((void *)v8 + 46);
    if ((unint64_t)v52 >= v51)
    {
      uint64_t v55 = (unsigned int *)*v82;
      uint64_t v56 = 0x2E8BA2E8BA2E8BA3 * (((char *)v52 - (unsigned char *)*v82) >> 2);
      unint64_t v57 = v56 + 1;
      if ((unint64_t)(v56 + 1) > 0x5D1745D1745D174) {
        abort();
      }
      unint64_t v58 = 0x2E8BA2E8BA2E8BA3 * ((uint64_t)(v51 - (void)v55) >> 2);
      if (2 * v58 > v57) {
        unint64_t v57 = 2 * v58;
      }
      if (v58 >= 0x2E8BA2E8BA2E8BALL) {
        unint64_t v59 = 0x5D1745D1745D174;
      }
      else {
        unint64_t v59 = v57;
      }
      if (v59 > 0x5D1745D1745D174) {
LABEL_93:
      }
        std::__throw_bad_array_new_length[abi:nn180100]();
      double v60 = (char *)operator new(44 * v59);
      double v61 = &v60[44 * v56];
      *(_DWORD *)double v61 = v10;
      *(void *)(v61 + 4) = -1;
      *((_DWORD *)v61 + 3) = v43;
      *((float *)v61 + 4) = v44;
      *(void *)(v61 + 20) = v80;
      *(void *)(v61 + 28) = 0xBF80000000000000;
      *(void *)(v61 + 36) = 0xBF80000000000000;
      if (v52 == v55)
      {
        double v65 = &v60[44 * v56];
        unsigned int v8 = v81;
      }
      else
      {
        v62 = &v60[44 * v56];
        unsigned int v8 = v81;
        do
        {
          long long v63 = *(_OWORD *)(v52 - 11);
          long long v64 = *(_OWORD *)(v52 - 7);
          double v65 = v62 - 44;
          *((_OWORD *)v62 - 1) = *((_OWORD *)v52 - 1);
          *(_OWORD *)(v62 - 28) = v64;
          *(_OWORD *)(v62 - 44) = v63;
          v52 -= 11;
          v62 -= 44;
        }
        while (v52 != v55);
      }
      double v66 = &v60[44 * v59];
      double v53 = v61 + 44;
      *((void *)v8 + 44) = v65;
      *((void *)v8 + 45) = v61 + 44;
      *((void *)v8 + 46) = v66;
      if (v55) {
        operator delete(v55);
      }
      double v47 = (md::RouteLineSection *)(v46 + 1);
    }
    else
    {
      *long double v52 = v10;
      *(void *)(v52 + 1) = -1;
      v52[3] = v43;
      *((float *)v52 + 4) = v44;
      *(void *)(v52 + 5) = v80;
      *(void *)(v52 + 7) = 0xBF80000000000000;
      double v53 = (char *)(v52 + 11);
      *(void *)(v52 + 9) = 0xBF80000000000000;
    }
    char v54 = 0;
    *((void *)v8 + 45) = v53;
    if (!v46) {
      goto LABEL_32;
    }
LABEL_66:
    BOOL v67 = (*v46)-- == 1;
    if (v67)
    {
      md::RouteLineSection::~RouteLineSection(v47);
      {
        operator new();
      }
      (*(void (**)(uint64_t, void *, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v46, 400);
    }
    goto LABEL_32;
  }
  unint64_t v42 = 0;
LABEL_73:
  unint64_t v68 = v10 + 1;
  if (0xCCCCCCCCCCCCCCCDLL * ((v40 - v39) >> 2) > v68)
  {
    uint64_t v69 = *((void *)v8 + 35);
    if (v42 < (*((void *)v8 + 36) - v69) >> 3)
    {
      double v70 = *(void **)(v69 + 8 * v42);
      if (v70) {
        ++*v70;
      }
      double v71 = (unsigned int *)(v39 + 20 * v68);
      if (*((unsigned char *)v71 + 16))
      {
        uint64_t v72 = *v71;
        uint64_t v73 = v71[1];
        uint64_t v74 = *((void *)v71 + 1);
        float v75 = v70 + 1;
        if (!v70) {
          float v75 = 0;
        }
        unsigned int v76 = *((_DWORD *)v75 + 22);
        if (v72 > v76 || v72 == v76 && *((float *)v75 + 23) <= *(float *)&v73)
        {
          unsigned int v77 = *((_DWORD *)v75 + 24);
          if (v72 < v77 || v72 == v77 && *((float *)v75 + 25) >= *(float *)&v73) {
            std::vector<Arrow>::emplace_back<geo::PolylineCoordinate &,geo::PolylineCoordinate &,unsigned int &>((uint64_t)v82, v72 | (v73 << 32), v74, v68);
          }
        }
      }
      if (v70)
      {
        BOOL v67 = (*v70)-- == 1;
        if (v67)
        {
          md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v70 + 1));
          uint64_t v79 = mdm::Allocator::instance(v78);
          (*(void (**)(uint64_t, void *, uint64_t))(*(void *)v79 + 40))(v79, v70, 400);
        }
      }
    }
  }
}

- (BOOL)buildRouteLine:(id)a3 matchToRoads:(BOOL)a4 shouldGenerateSnapPath:(BOOL)a5 viewUnitsPerPoint:(double)a6 force:(BOOL)a7 boundsInflation:(float)a8 isGradientTraffic:(BOOL)a9 currentLegIndex:(unsigned int)a10 elevationSource:(void *)a11 elevationSourceContext:(void *)a12
{
  BOOL v12 = a9;
  BOOL v16 = a5;
  int v17 = a4;
  id v20 = a3;
  if (!*((unsigned char *)self + 8))
  {
    id v21 = [*((id *)self + 24) composedRoute];
    [v21 clearSnappedPathsForObserver:self];
  }
  uint64_t v22 = [(VKRouteLine *)self composedRoute];
  uint64_t v23 = [v22 revisionIdentifier];
  double v111 = v23;
  char v24 = geo::_retain_ptr<NSUUID * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>::operator==(*((void **)self + 42), &v111);

  if ((v24 & 1) == 0)
  {
    unint64_t v25 = [(VKRouteLine *)self composedRoute];
    id v26 = [v25 revisionIdentifier];
    uint64_t v27 = v26;
    if (v26) {
      id v28 = v26;
    }
    unint64_t v29 = (void *)*((void *)self + 42);
    *((void *)self + 42) = v27;

    a7 = 1;
  }
  id v30 = *((id *)self + 49);
  objc_storeStrong((id *)self + 49, a3);
  id v80 = v30;
  if (a7
    || *((unsigned __int8 *)self + 8) != v17
    || ([v30 isEquivalentToNewRegion:*((void *)self + 49)] & 1) == 0)
  {
    *((unsigned char *)self + 8) = v17;
    uint64_t v32 = (void *)*((void *)self + 38);
    if (v32)
    {
      BOOL v33 = (*v32)-- == 1;
      if (v33)
      {
        md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v32 + 1));
        {
          operator new();
        }
        (*(void (**)(uint64_t, void, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, *((void *)self + 38), 400);
      }
    }
    *((void *)self + 38) = 0;
    *((void *)self + 39) = 0xBF80000000000000;
    uint64_t v34 = *((void *)self + 35);
    uint64_t v35 = *((void *)self + 36);
    BOOL v31 = v34 != v35;
    if (v34 != v35)
    {
      uint64_t v36 = *((void *)self + 36);
      do
      {
        double v38 = *(void **)(v36 - 8);
        v36 -= 8;
        long long v37 = v38;
        if (v38)
        {
          BOOL v33 = (*v37)-- == 1;
          if (v33)
          {
            md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v37 + 1));
            {
              operator new();
            }
            (*(void (**)(uint64_t, void, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, *(void *)(v35 - 8), 400);
            *(void *)(v35 - 8) = 0;
          }
        }
        uint64_t v35 = v36;
      }
      while (v36 != v34);
    }
    *((void *)self + 36) = v34;
    id v30 = v80;
    if ([*((id *)self + 24) containsTransit])
    {
      uint64_t v39 = +[VKDebugSettings sharedSettings];
      uint64_t v40 = [v39 dontVerifyRouteToTransitSnapping] ^ 1;
    }
    else
    {
      uint64_t v40 = 0;
    }
    float v41 = [*((id *)self + 24) getPathsForRenderRegion:*((void *)self + 49) shouldSnapToRoads:*((unsigned __int8 *)self + 8) shouldGenerateSnapPath:v16 verifySnapping:v40 isGradientTraffic:v12 observer:self elevationSource:a11 elevationSourceContext:a12];
    if (![v41 count]) {
      goto LABEL_67;
    }
    *(float *)&double v42 = a8;
    [(VKRouteLine *)self _updateBounds:v41 boundsInflation:v42];
    [(VKRouteLine *)self _updateTilesCovered:v41];
    long double v43 = exp((*((double *)self + 6) + *((double *)self + 3)) * 3.14159265 + -3.14159265);
    long double v44 = atan(v43) * 114.591559 + -90.0;
    long double v45 = cos(v44 * 0.034906585) * -559.82 + 111132.92;
    long double v46 = v45 + cos(v44 * 0.0698131701) * 1.175;
    long double v47 = v46 + cos(v44 * 0.104719755) * -0.0023;
    long double v48 = v44 * 0.00872664626;
    long double v49 = tan(v44 * 0.00872664626 + 0.78103484);
    double v50 = log(v49);
    long double v51 = tan(v48 + 0.789761487);
    *((long double *)self + 26) = v47 * a6 / fabs((log(v51) - v50) * 0.159154943);
    *((double *)self + 33) = a6 / (*((double *)self + 5) - *((double *)self + 2));
    uint64_t v102 = 0;
    double v103 = &v102;
    uint64_t v104 = 0x4812000000;
    double v105 = __Block_byref_object_copy__24217;
    __int16 v106 = __Block_byref_object_dispose__24218;
    double v107 = "";
    double v109 = 0;
    uint64_t v110 = 0;
    __int16 v108 = 0;
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __179__VKRouteLine_buildRouteLine_matchToRoads_shouldGenerateSnapPath_viewUnitsPerPoint_force_boundsInflation_isGradientTraffic_currentLegIndex_elevationSource_elevationSourceContext___block_invoke;
    v101[3] = &unk_1E5A92FA0;
    v101[4] = &v102;
    forEachNodeInSortedPaths(v41, v101);
    int64_t v52 = v103[7] - v103[6];
    uint64_t v53 = v52 >> 3;
    char v54 = (char *)*((void *)self + 35);
    if (v52 >> 3 <= (unint64_t)((uint64_t)(*((void *)self + 37) - (void)v54) >> 3))
    {
LABEL_54:
      [(VKRouteLine *)self setHasNewRoadMatches:0];
      uint64_t v95 = 0;
      __int16 v96 = &v95;
      uint64_t v97 = 0x3032000000;
      double v98 = __Block_byref_object_copy__13;
      double v99 = __Block_byref_object_dispose__14;
      id v100 = 0;
      v94[0] = 0;
      v94[1] = v94;
      v94[2] = 0x4812000000;
      v94[3] = __Block_byref_object_copy__15;
      v94[4] = __Block_byref_object_dispose__16;
      v94[5] = "";
      uint64_t v87 = 0;
      double v88 = &v87;
      uint64_t v89 = 0x3812000000;
      float64x2_t v90 = __Block_byref_object_copy__18_24205;
      double v91 = __Block_byref_object_dispose__19_24206;
      float64x2_t v92 = "";
      v93 = 0;
      v86[0] = 0;
      v86[1] = v86;
      v86[2] = 0x3812000000;
      v86[3] = __Block_byref_object_copy__21;
      v86[4] = __Block_byref_object_dispose__22;
      v86[5] = "";
      v86[6] = v103[6];
      v85[0] = 0;
      v85[1] = v85;
      v85[2] = 0x4012000000;
      v85[3] = __Block_byref_object_copy__24;
      v85[4] = __Block_byref_object_dispose__25;
      v85[5] = "";
      v84[0] = 0;
      v84[1] = v84;
      v84[2] = 0x2020000000;
      v84[3] = 0;
      v81[0] = MEMORY[0x1E4F143A8];
      v81[1] = 3221225472;
      v81[2] = __179__VKRouteLine_buildRouteLine_matchToRoads_shouldGenerateSnapPath_viewUnitsPerPoint_force_boundsInflation_isGradientTraffic_currentLegIndex_elevationSource_elevationSourceContext___block_invoke_27;
      v81[3] = &unk_1E5A92FC8;
      v81[4] = self;
      v81[5] = &v95;
      unsigned int v82 = a10;
      v81[6] = v85;
      v81[7] = &v87;
      BOOL v83 = v12;
      v81[8] = v84;
      v81[9] = v86;
      v81[10] = v94;
      forEachNodeInSortedPaths(v41, v81);
      id v30 = v80;
      if (v88[6])
      {
        uint64_t v73 = [(id)v96[5] routeEnd];
        uint64_t v74 = v88[6];
        if (v74) {
          uint64_t v75 = v74 + 8;
        }
        else {
          uint64_t v75 = 0;
        }
        *(void *)(v75 + 96) = v73;
      }
      [*((id *)self + 24) trafficTimeStamp];
      *((void *)self + 47) = v76;
      *((double *)self + 53) = a6;
      _Block_object_dispose(v84, 8);
      _Block_object_dispose(v85, 8);
      _Block_object_dispose(v86, 8);
      _Block_object_dispose(&v87, 8);
      unsigned int v77 = v93;
      if (v93)
      {
        BOOL v33 = (*v93)-- == 1;
        if (v33)
        {
          md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v77 + 1));
          {
            operator new();
          }
          (*(void (**)(uint64_t, void *, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 40))(mdm::Allocator::instance(void)::alloc, v93, 400);
        }
      }
      _Block_object_dispose(v94, 8);
      _Block_object_dispose(&v95, 8);

      _Block_object_dispose(&v102, 8);
      if (v108)
      {
        double v109 = v108;
        operator delete(v108);
      }
      BOOL v31 = 1;
LABEL_67:

      goto LABEL_68;
    }
    if (v52 < 0) {
      abort();
    }
    uint64_t v55 = (char *)*((void *)self + 36);
    uint64_t v56 = (char *)operator new(v52);
    uint64_t v57 = v55 - v54;
    unint64_t v58 = (unint64_t)&v56[(v55 - v54) & 0xFFFFFFFFFFFFFFF8];
    unint64_t v59 = &v56[8 * v53];
    if (v55 == v54)
    {
      *((void *)self + 35) = v58;
      *((void *)self + 36) = v58;
      *((void *)self + 37) = v59;
LABEL_52:
      if (v54) {
        operator delete(v54);
      }
      goto LABEL_54;
    }
    unint64_t v60 = v55 - v54 - 8;
    if (v60 > 0x77)
    {
      if (&v56[(v57 & 0xFFFFFFFFFFFFFFF8) - (v60 & 0xFFFFFFFFFFFFFFF8) - 8] >= v55
        || (double v61 = &v56[(v55 - v54) & 0xFFFFFFFFFFFFFFF8],
            (unint64_t)&v55[-(v60 & 0xFFFFFFFFFFFFFFF8) - 8] >= v58))
      {
        uint64_t v62 = v57 >> 3;
        uint64_t v63 = (v60 >> 3) + 1;
        long long v64 = &v56[8 * v62 - 16];
        double v65 = v55 - 32;
        uint64_t v66 = v63 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v67 = *((_OWORD *)v65 + 1);
          *((_OWORD *)v64 - 1) = *(_OWORD *)v65;
          *(_OWORD *)long long v64 = v67;
          *(_OWORD *)double v65 = 0uLL;
          *((_OWORD *)v65 + 1) = 0uLL;
          v65 -= 32;
          v64 -= 32;
          v66 -= 4;
        }
        while (v66);
        double v61 = (char *)(v58 - 8 * (v63 & 0x3FFFFFFFFFFFFFFCLL));
        v55 -= 8 * (v63 & 0x3FFFFFFFFFFFFFFCLL);
        if (v63 == (v63 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_42:
          char v54 = (char *)*((void *)self + 35);
          uint64_t v69 = (char *)*((void *)self + 36);
          *((void *)self + 35) = v61;
          *((void *)self + 36) = v58;
          *((void *)self + 37) = v59;
          if (v69 != v54)
          {
            double v70 = v69;
            do
            {
              uint64_t v72 = (void *)*((void *)v70 - 1);
              v70 -= 8;
              double v71 = v72;
              if (v72)
              {
                BOOL v33 = (*v71)-- == 1;
                if (v33)
                {
                  md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v71 + 1));
                  {
                    operator new();
                  }
                  (*(void (**)(uint64_t, void, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc
                                                                   + 40))(mdm::Allocator::instance(void)::alloc, *((void *)v69 - 1), 400);
                  *((void *)v69 - 1) = 0;
                }
              }
              uint64_t v69 = v70;
            }
            while (v70 != v54);
          }
          goto LABEL_52;
        }
      }
    }
    else
    {
      double v61 = &v56[(v55 - v54) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      uint64_t v68 = *((void *)v55 - 1);
      v55 -= 8;
      *((void *)v61 - 1) = v68;
      v61 -= 8;
      *(void *)uint64_t v55 = 0;
    }
    while (v55 != v54);
    goto LABEL_42;
  }
  BOOL v31 = 0;
LABEL_68:

  return v31;
}

void __179__VKRouteLine_buildRouteLine_matchToRoads_shouldGenerateSnapPath_viewUnitsPerPoint_force_boundsInflation_isGradientTraffic_currentLegIndex_elevationSource_elevationSourceContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, int a6)
{
  id v8 = a5;
  if (a6)
  {
    double v9 = *(void **)(*(void *)(a1 + 32) + 8);
    unsigned int v11 = (char *)v9[7];
    unint64_t v10 = v9[8];
    if ((unint64_t)v11 >= v10)
    {
      id v29 = v8;
      char v13 = (char *)v9[6];
      uint64_t v14 = (v11 - v13) >> 3;
      unint64_t v15 = v14 + 1;
      if ((unint64_t)(v14 + 1) >> 61) {
        abort();
      }
      uint64_t v16 = v10 - (void)v13;
      if (v16 >> 2 > v15) {
        unint64_t v15 = v16 >> 2;
      }
      if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v17 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v17 = v15;
      }
      if (v17)
      {
        if (v17 >> 61) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        uint64_t v18 = operator new(8 * v17);
      }
      else
      {
        uint64_t v18 = 0;
      }
      uint64_t v19 = &v18[8 * v14];
      id v20 = &v18[8 * v17];
      *uint64_t v19 = 0;
      BOOL v12 = v19 + 1;
      if (v11 != v13)
      {
        unint64_t v21 = v11 - v13 - 8;
        if (v21 < 0x58) {
          goto LABEL_32;
        }
        if ((unint64_t)(v13 - v18) < 0x20) {
          goto LABEL_32;
        }
        uint64_t v22 = (v21 >> 3) + 1;
        uint64_t v23 = &v18[8 * v14 - 16];
        char v24 = v11 - 16;
        uint64_t v25 = v22 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v26 = *(_OWORD *)v24;
          *(v23 - 1) = *((_OWORD *)v24 - 1);
          *uint64_t v23 = v26;
          v23 -= 2;
          v24 -= 32;
          v25 -= 4;
        }
        while (v25);
        v19 -= v22 & 0x3FFFFFFFFFFFFFFCLL;
        v11 -= 8 * (v22 & 0x3FFFFFFFFFFFFFFCLL);
        if (v22 != (v22 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_32:
          do
          {
            uint64_t v27 = *((void *)v11 - 1);
            v11 -= 8;
            *--uint64_t v19 = v27;
          }
          while (v11 != v13);
        }
      }
      v9[6] = v19;
      v9[7] = v12;
      v9[8] = v20;
      if (v13) {
        operator delete(v13);
      }
      id v8 = v29;
    }
    else
    {
      *(void *)unsigned int v11 = 0;
      BOOL v12 = v11 + 8;
    }
    v9[7] = v12;
  }
  uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 56);
  ++*(void *)(v28 - 8);
}

void __179__VKRouteLine_buildRouteLine_matchToRoads_shouldGenerateSnapPath_viewUnitsPerPoint_force_boundsInflation_isGradientTraffic_currentLegIndex_elevationSource_elevationSourceContext___block_invoke_27(uint64_t a1, float *a2, uint64_t *a3, uint64_t a4, void *a5, int a6, uint64_t a7, float a8)
{
  unint64_t v10 = a5;
  id v12 = a5;
  if (!a6) {
    goto LABEL_85;
  }
  char v13 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v227 = v12;
  if (v13)
  {
    uint64_t v14 = [v13 section];
    if ([v14 transportType])
    {
    }
    else
    {
      long double v46 = [v12 section];
      int v47 = [v46 transportType];

      if (v47)
      {
        long double v48 = [*(id *)(a1 + 32) composedRoute];
        long double v49 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) section];
        unint64_t v50 = objc_msgSend(v48, "legIndexForStepIndex:", objc_msgSend(v49, "finalStepIndex"));

        long double v51 = [*(id *)(a1 + 32) composedRoute];
        int64_t v52 = [v12 section];
        uint64_t v53 = objc_msgSend(v51, "legIndexForStepIndex:", objc_msgSend(v52, "finalStepIndex"));

        if (v50 != v53 && v50 < *(unsigned int *)(a1 + 88))
        {
          char v54 = [v12 section];
          uint64_t v55 = v54;
          if (v54)
          {
            [v54 bounds];
            double v56 = *((double *)&v245 + 1);
            double v57 = *(double *)&v245;
            double v59 = *((double *)&v246 + 1);
            double v58 = v247;
          }
          else
          {
            long long v246 = 0u;
            double v247 = 0.0;
            long long v245 = 0u;
            double v58 = 0.0;
            double v59 = 0.0;
            double v56 = 0.0;
            double v57 = 0.0;
          }
          double v192 = v57 + v59 * *a2;
          double v193 = v56 + v58 * (float)(1.0 - a2[1]);
          v194 = (double *)MEMORY[0x1E4F63F10];
          double v195 = *MEMORY[0x1E4F63F10];
          double v196 = *(double *)(MEMORY[0x1E4F63F10] + 8);

          long double v197 = exp(3.14159265 - v193 * 6.28318531 / v196);
          double v198 = atan(v197) * 2.0 + -1.57079633;
          long double v199 = fmod(v192 * 6.28318531 / v195, 6.28318531);
          double v200 = fmod(v199 + 6.28318531, 6.28318531) + -3.14159265;
          __double2 v201 = __sincos_stret(v198);
          __double2 v202 = __sincos_stret(v200);
          uint64_t v203 = *(void *)(*(void *)(a1 + 48) + 8);
          v204 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) section];
          v205 = v204;
          if (v204)
          {
            [v204 bounds];
            double v206 = *((double *)&v245 + 1);
            double v207 = *(double *)&v245;
            double v209 = *((double *)&v246 + 1);
            double v208 = v247;
          }
          else
          {
            *(void *)&long long v246 = 0;
            double v208 = 0.0;
            double v209 = 0.0;
            double v206 = 0.0;
            double v207 = 0.0;
          }
          unint64_t v222 = 0xBF7B6B90F1FE94F0;
          double v210 = 6378137.0 / sqrt(v201.__sinval * v201.__sinval * -0.00669437999 + 1.0);
          double v230 = v210 * v201.__cosval * v202.__cosval;
          double v226 = v210 * v201.__cosval * v202.__sinval;
          double v224 = v201.__sinval * 0.99330562 * v210;
          double v211 = v207 + v209 * *(float *)(v203 + 48);
          double v212 = v206 + v208 * (float)(1.0 - *(float *)(v203 + 52));
          double v213 = *v194;
          double v214 = v194[1];

          long double v215 = exp(3.14159265 - v212 * 6.28318531 / v214);
          double v216 = atan(v215) * 2.0 + -1.57079633;
          long double v217 = fmod(v211 * 6.28318531 / v213, 6.28318531);
          double v218 = fmod(v217 + 6.28318531, 6.28318531) + -3.14159265;
          __double2 v219 = __sincos_stret(v216);
          double v220 = 6378137.0 / sqrt(v219.__sinval * v219.__sinval * -0.00669437999 + 1.0);
          __double2 v221 = __sincos_stret(v218);
          if (sqrt(-(v230 - v220 * v219.__cosval * v221.__cosval) * -(v230 - v220 * v219.__cosval * v221.__cosval)+ -(v226 - v220 * v219.__cosval * v221.__sinval) * -(v226 - v220 * v219.__cosval * v221.__sinval)+ -(v224 - v219.__sinval * 0.99330562 * v220) * -(v224 - v219.__sinval * 0.99330562 * v220)) <= 10.0)goto LABEL_85; {
        }
          }
      }
    }
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48))
  {
    uint64_t v15 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) routeEnd];
    uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
    if (v16) {
      uint64_t v17 = v16 + 8;
    }
    else {
      uint64_t v17 = 0;
    }
    *(void *)(v17 + 96) = v15;
  }
  uint64_t v18 = objc_msgSend(v12, "section", v222);
  uint64_t v19 = [v18 composedRouteSegment];

  v225 = v19;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v20 = (void *)MEMORY[0x1E4F64AA8];
    unint64_t v21 = [v19 transitLine];
    v228 = [v20 attributesForTransitLine:v21];
  }
  else
  {
    v228 = 0;
  }
  uint64_t v22 = [*(id *)(a1 + 32) composedRoute];
  uint64_t v23 = [v12 section];
  uint64_t v24 = objc_msgSend(v22, "legIndexForStepIndex:", objc_msgSend(v23, "finalStepIndex"));

  uint64_t v25 = *(void *)(a1 + 32);
  val = [v12 section];
  uint64_t v26 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v27 = *(void *)(v26 + 24);
  *(void *)(v26 + 24) = v27 + 1;
  v223 = [v12 section];
  int v28 = [v223 transportType];
  {
    operator new();
  }
  uint64_t v29 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)mdm::Allocator::instance(void)::alloc + 16))(mdm::Allocator::instance(void)::alloc, 400, 8);
  v233 = v10;
  *(void *)uint64_t v29 = 1;
  float v30 = *(double *)(v25 + 200);
  float v31 = *(double *)(v25 + 248);
  char v32 = *(unsigned char *)(a1 + 92);
  id v33 = v228;
  *(void *)(v29 + 8) = &unk_1EF536928;
  *(void *)(v29 + 16) = 0;
  *(void *)(v29 + 24) = 0;
  *(void *)(v29 + 32) = 0;
  id v34 = v33;
  *(void *)(v29 + 112) = 0;
  *(void *)(v29 + 40) = &unk_1EF5597B8;
  *(void *)(v29 + 48) = v34;
  id v231 = v34;
  *(float *)(v29 + 64) = v30;
  *(float *)(v29 + 68) = v31;
  *(void *)(v29 + 80) = 0;
  *(void *)(v29 + 88) = 0;
  *(_DWORD *)(v29 + 96) = 0;
  *(void *)(v29 + 100) = 3212836864;
  *(_DWORD *)(v29 + 108) = -1082130432;
  *(void *)(v29 + 120) = 0;
  *(void *)(v29 + 128) = 0xBFF0000000000000;
  *(_DWORD *)(v29 + 144) = 1043452238;
  *(void *)(v29 + 136) = 0x4040000000000000;
  *(_DWORD *)(v29 + 200) = v28;
  objc_initWeak((id *)(v29 + 208), val);
  *(void *)(v29 + 224) = v27;
  *(void *)(v29 + 232) = v24;
  *(unsigned char *)(v29 + 240) = v32;
  *(_DWORD *)(v29 + 244) = 0;
  *(_DWORD *)(v29 + 247) = 0;
  *(_WORD *)(v29 + 251) = 257;
  *(unsigned char *)(v29 + 253) = 0;
  *(_OWORD *)(v29 + 256) = 0u;
  *(_OWORD *)(v29 + 272) = 0u;
  *(_OWORD *)(v29 + 288) = 0u;
  *(_OWORD *)(v29 + 304) = 0u;
  *(_OWORD *)(v29 + 320) = 0u;
  *(_OWORD *)(v29 + 336) = 0u;
  *(_OWORD *)(v29 + 352) = 0u;
  *(_OWORD *)(v29 + 368) = 0u;
  *(void *)(v29 + 384) = -1;
  *(unsigned char *)(v29 + 392) = 1;
  if (md::RouteLineSection::RouteLineSection(float,float,GEOComposedRouteSection *,unsigned long,GEOTransportType,GEOStyleAttributes *,unsigned long,BOOL)::once != -1) {
    dispatch_once(&md::RouteLineSection::RouteLineSection(float,float,GEOComposedRouteSection *,unsigned long,GEOTransportType,GEOStyleAttributes *,unsigned long,BOOL)::once, &__block_literal_global_32257);
  }
  *(_DWORD *)(v29 + 72) = -1082130432;
  uint64_t v35 = *(void **)(v29 + 112);
  id v12 = v227;
  uint64_t v36 = v231;
  if (v35)
  {
    free(v35);
    *(void *)(v29 + 112) = 0;
  }
  *(void *)(v29 + 120) = 0;
  *(void *)(v29 + 128) = 0xBFF0000000000000;

  double v38 = *(char **)(v25 + 288);
  unint64_t v37 = *(void *)(v25 + 296);
  if ((unint64_t)v38 >= v37)
  {
    uint64_t v40 = *(char **)(v25 + 280);
    uint64_t v41 = (v38 - v40) >> 3;
    unint64_t v42 = v41 + 1;
    if ((unint64_t)(v41 + 1) >> 61) {
      abort();
    }
    uint64_t v43 = v37 - (void)v40;
    if (v43 >> 2 > v42) {
      unint64_t v42 = v43 >> 2;
    }
    if ((unint64_t)v43 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v44 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v44 = v42;
    }
    if (v44)
    {
      if (v44 >> 61) {
        goto LABEL_171;
      }
      long double v45 = (char *)operator new(8 * v44);
    }
    else
    {
      long double v45 = 0;
    }
    unint64_t v60 = (uint64_t *)&v45[8 * v41];
    double v61 = &v45[8 * v44];
    *unint64_t v60 = v29;
    uint64_t v62 = v60 + 1;
    if (v38 == v40)
    {
      unint64_t v10 = v233;
      uint64_t v39 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    }
    else
    {
      unint64_t v63 = v38 - v40 - 8;
      unint64_t v10 = v233;
      if (v63 >= 0x78)
      {
        uint64_t v39 = &md::SignedDistanceFieldGenerator::_hypotCache[32854];
        if (&v45[v38 - v40 - (v63 & 0xFFFFFFFFFFFFFFF8) - 8] >= v38
          || &v38[-(v63 & 0xFFFFFFFFFFFFFFF8) - 8] >= (char *)v60)
        {
          uint64_t v64 = (v63 >> 3) + 1;
          double v65 = &v45[8 * v41 - 16];
          uint64_t v66 = v38 - 32;
          uint64_t v67 = v64 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v68 = *((_OWORD *)v66 + 1);
            *((_OWORD *)v65 - 1) = *(_OWORD *)v66;
            *(_OWORD *)double v65 = v68;
            *(_OWORD *)uint64_t v66 = 0uLL;
            *((_OWORD *)v66 + 1) = 0uLL;
            v66 -= 32;
            v65 -= 32;
            v67 -= 4;
          }
          while (v67);
          v60 -= v64 & 0x3FFFFFFFFFFFFFFCLL;
          v38 -= 8 * (v64 & 0x3FFFFFFFFFFFFFFCLL);
          if (v64 == (v64 & 0x3FFFFFFFFFFFFFFCLL)) {
            goto LABEL_45;
          }
        }
      }
      else
      {
        uint64_t v39 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
      }
      do
      {
        uint64_t v69 = *((void *)v38 - 1);
        v38 -= 8;
        *--unint64_t v60 = v69;
        *(void *)double v38 = 0;
      }
      while (v38 != v40);
    }
LABEL_45:
    double v71 = *(char **)(v25 + 280);
    double v70 = *(char **)(v25 + 288);
    *(void *)(v25 + 280) = v60;
    *(void *)(v25 + 288) = v62;
    *(void *)(v25 + 296) = v61;
    if (v70 != v71)
    {
      uint64_t v72 = v70;
      do
      {
        uint64_t v74 = (void *)*((void *)v72 - 1);
        v72 -= 8;
        uint64_t v73 = v74;
        if (v74)
        {
          _ZF = (*v73)-- == 1;
          if (_ZF)
          {
            md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v73 + 1));
            {
              operator new();
            }
            (*(void (**)(void, void, uint64_t))(**((void **)v39 + 91) + 40))(*((void *)v39 + 91), *((void *)v70 - 1), 400);
            *((void *)v70 - 1) = 0;
          }
        }
        double v70 = v72;
      }
      while (v72 != v71);
    }
    if (v71) {
      operator delete(v71);
    }
    *(void *)(v25 + 288) = v62;
    uint64_t v19 = v225;
    uint64_t v36 = v231;
    goto LABEL_58;
  }
  *(void *)double v38 = v29;
  *(void *)(v25 + 288) = v38 + 8;
  uint64_t v39 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
LABEL_58:

  uint64_t v75 = *(void *)(*(void *)(a1 + 32) + 288);
  uint64_t v76 = *(void *)(*(void *)(a1 + 56) + 8);
  unsigned int v77 = *(void **)(v75 - 8);
  if (v77) {
    ++*v77;
  }
  double v78 = *(void **)(v76 + 48);
  if (v78)
  {
    _ZF = (*v78)-- == 1;
    if (_ZF)
    {
      md::RouteLineSection::~RouteLineSection((md::RouteLineSection *)(v78 + 1));
      {
        operator new();
      }
      (*(void (**)(void, void, uint64_t))(**((void **)v39 + 91) + 40))(*((void *)v39 + 91), *(void *)(v76 + 48), 400);
      *(void *)(v76 + 48) = 0;
      unsigned int v77 = *(void **)(v75 - 8);
    }
  }
  *(void *)(v76 + 48) = v77;
  uint64_t v79 = *(void *)(*(void *)(a1 + 72) + 8);
  id v80 = *(unint64_t **)(v79 + 48);
  unint64_t v81 = *v80;
  *(void *)(v79 + 48) = v80 + 1;
  uint64_t v82 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
  if (v82) {
    BOOL v83 = (void *)(v82 + 8);
  }
  else {
    BOOL v83 = 0;
  }
  float64x2_t v84 = (unsigned char *)v83[1];
  if (0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v83[3] - (void)v84) >> 4) < v81)
  {
    if (v81 > 0x555555555555555) {
      abort();
    }
    float64x2_t v85 = (unsigned char *)v83[2];
    double v86 = (char *)operator new(48 * v81);
    uint64_t v87 = &v86[48 * ((v85 - v84) / 48)];
    double v88 = v87;
    if (v85 != v84)
    {
      uint64_t v89 = &v86[48 * ((v85 - v84) / 48)];
      do
      {
        double v88 = v89 - 48;
        long long v90 = *((_OWORD *)v85 - 3);
        long long v91 = *((_OWORD *)v85 - 1);
        *((_OWORD *)v89 - 2) = *((_OWORD *)v85 - 2);
        *((_OWORD *)v89 - 1) = v91;
        *((_OWORD *)v89 - 3) = v90;
        v85 -= 48;
        v89 -= 48;
      }
      while (v85 != v84);
    }
    v83[1] = v88;
    v83[2] = v87;
    v83[3] = &v86[48 * v81];
    if (v84) {
      operator delete(v84);
    }
  }
  uint64_t v92 = [v227 routeStart];
  uint64_t v93 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
  if (v93) {
    uint64_t v94 = v93 + 8;
  }
  else {
    uint64_t v94 = 0;
  }
  *(void *)(v94 + 88) = v92;
  uint64_t v95 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
  if (v95) {
    uint64_t v96 = v95 + 8;
  }
  else {
    uint64_t v96 = 0;
  }
  float v97 = 1.0 / *(double *)(*(void *)(a1 + 32) + 264);
  *(float *)(v96 + 128) = v97;
  double v98 = *(void **)(a1 + 32);
  uint64_t v99 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
  if (v99) {
    id v100 = (void *)(v99 + 8);
  }
  else {
    id v100 = 0;
  }
  v100[18] = v98[2];
  v100[19] = v98[3];
  v100[20] = v98[4];
  v100[21] = v98[5];
  v100[22] = v98[6];
  v100[23] = v98[7];

LABEL_85:
  uint64_t v101 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(id *)(v101 + 40) != v12)
  {
    uint64_t v102 = [v12 section];
    [v102 vkBounds];
    float64_t vala = v103;
    uint64_t v104 = [v12 section];
    [v104 vkBounds];
    float64_t v234 = v105;
    __int16 v106 = [v12 section];
    double v107 = v106;
    if (v106)
    {
      [v106 bounds];
      double v108 = *(double *)&v246;
    }
    else
    {
      double v108 = 0.0;
    }
    double v109 = objc_msgSend(v12, "section", v222);
    [v109 vkBounds];
    float64_t v232 = v110;
    double v111 = [v12 section];
    [v111 vkBounds];
    float64_t v229 = v112;
    double v113 = [v12 section];
    __int16 v114 = v113;
    if (v113)
    {
      [v113 bounds];
      double v115 = v244;
    }
    else
    {
      double v115 = 0.0;
    }
    uint64_t v116 = [v12 section];
    v117 = v116;
    if (v116)
    {
      [v116 bounds];
      double v118 = v243;
    }
    else
    {
      double v118 = 0.0;
    }

    v119.f64[0] = v232;
    v119.f64[1] = v229;
    uint64_t v120 = *(void *)(a1 + 32);
    v121.f64[0] = vala;
    v121.f64[1] = v234;
    float64x2_t v122 = vsubq_f64(v119, v121);
    v119.f64[0] = *(float64_t *)(v120 + 32);
    double v123 = v115 - v108 + v118;
    double v124 = (v108 - v119.f64[0]) / v123;
    *(float *)v119.f64 = (*(double *)(v120 + 56) - v119.f64[0]) / v123;
    *(float *)v119.f64 = 1.0 / *(float *)v119.f64;
    *(float *)&double v124 = v124;
    *(float *)&double v124 = *(float *)v119.f64 * *(float *)&v124;
    uint64_t v125 = *(void *)(*(void *)(a1 + 80) + 8);
    *(_DWORD *)(v125 + 56) = LODWORD(v119.f64[0]);
    _Q1 = *(float64x2_t *)(v120 + 16);
    float64x2_t v127 = vdivq_f64(vsubq_f64(v121, _Q1), v122);
    float64x2_t v128 = vdivq_f64(vsubq_f64(*(float64x2_t *)(v120 + 40), _Q1), v122);
    __asm { FMOV            V1.2S, #1.0 }
    *(float32x2_t *)&v128.f64[0] = vdiv_f32(*(float32x2_t *)&_Q1.f64[0], vcvt_f32_f64(v128));
    *(float64_t *)(v125 + 48) = v128.f64[0];
    *(float32x2_t *)(v125 + 60) = vmul_f32(*(float32x2_t *)&v128.f64[0], vcvt_f32_f64(v127));
    *(_DWORD *)(v125 + 68) = LODWORD(v124);
    uint64_t v101 = *(void *)(*(void *)(a1 + 40) + 8);
  }
  v132 = a3;
  uint64_t v133 = *(void *)(*(void *)(a1 + 80) + 8);
  float v134 = *(float *)(v133 + 56);
  float v135 = a2[2];
  float32x2_t v136 = *(float32x2_t *)(v133 + 48);
  float32x2_t v137 = *(float32x2_t *)a2;
  float32x2_t v240 = *(float32x2_t *)(v133 + 60);
  float v138 = *(float *)(v133 + 68);
  objc_storeStrong((id *)(v101 + 40), v10);
  uint64_t v139 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 48);
  uint64_t v140 = *v132;
  int v141 = [v12 pointCount];
  if (v139) {
    uint64_t v142 = v139 + 8;
  }
  else {
    uint64_t v142 = 0;
  }
  float v143 = v138 + (float)(v135 * v134);
  float32x2_t v144 = vmla_f32(v240, v136, v137);
  int v145 = *(unsigned __int8 *)(a7 + 4);
  float v146 = *(float *)a7;
  v147 = *(char **)(v142 + 8);
  v148 = *(char **)(v142 + 16);
  _ZF = v147 == v148 || v141 - 1 == a4;
  if (!_ZF)
  {
    if (*(unsigned char *)(v142 + 232))
    {
      if (v145 != *(unsigned __int8 *)(a7 + 5) && (v146 == 0.0 || v146 == 1.0) || *((float *)v148 - 3) != a8) {
        goto LABEL_143;
      }
    }
    else if (*(v148 - 4) != v145)
    {
      goto LABEL_143;
    }
    float v150 = *((float *)v148 - 12);
    float v151 = vabds_f32(v150, v144.f32[0]);
    if (v151 <= (float)(fabsf(v144.f32[0] + v150) * 0.000011921) || v151 <= 1.1755e-38)
    {
      float v153 = *((float *)v148 - 11);
      float v154 = vabds_f32(v153, v144.f32[1]);
      if (v154 <= (float)(fabsf(v144.f32[1] + v153) * 0.000011921) || v154 <= 1.1755e-38)
      {
        float v156 = *((float *)v148 - 10);
        float v157 = vabds_f32(v156, v143);
        if (v157 <= (float)(fabsf(v143 + v156) * 0.000011921) || v157 <= 1.1755e-38) {
          goto LABEL_161;
        }
      }
    }
    if (0xAAAAAAAAAAAAAAABLL * ((v148 - v147) >> 4) >= 2)
    {
      v159 = (float *)&v147[16 * ((v148 - v147) >> 4)];
      float v161 = *(v159 - 24);
      v160 = (char *)(v159 - 24);
      float v162 = v161;
      float v163 = vabds_f32(v161, v150);
      if (v163 <= (float)(fabsf(v161 + v150) * 0.000011921) || v163 <= 1.1755e-38)
      {
        float v172 = *((float *)v160 + 1);
        float v171 = *((float *)v148 - 11);
        float v165 = vabds_f32(v172, v171);
        if (v165 <= (float)(fabsf(v171 + v172) * 0.000011921) || v165 <= 1.1755e-38)
        {
          float v167 = *((float *)v160 + 2);
          float v168 = *((float *)v148 - 10);
          float v169 = vabds_f32(v167, v168);
          if (v169 <= (float)(fabsf(v168 + v167) * 0.000011921) || v169 <= 1.1755e-38) {
            goto LABEL_143;
          }
        }
      }
      else
      {
        float v171 = *((float *)v148 - 11);
        float v172 = *((float *)v160 + 1);
      }
      float v173 = v150 - v162;
      float v174 = v171 - v172;
      float v175 = *((float *)v148 - 10);
      float v176 = v175 - *((float *)v160 + 2);
      float v177 = v144.f32[0] - v150;
      float v178 = v144.f32[1] - v171;
      float v179 = v143 - v175;
      float v180 = sqrtf((float)((float)(v177 * v177) + (float)(v178 * v178)) + (float)(v179 * v179));
      if ((float)((float)((float)((float)(v173 * v177) + (float)(v178 * v174)) + (float)(v179 * v176))
                 / (float)(v180 * sqrtf((float)((float)(v173 * v173) + (float)(v174 * v174)) + (float)(v176 * v176)))) < *(float *)(v142 + 136)
        && (float)(*(float *)(v142 + 128) * v180) < *(float *)(v142 + 132))
      {
        goto LABEL_161;
      }
    }
  }
LABEL_143:
  char v181 = *(unsigned char *)(a7 + 5);
  unint64_t v182 = *(void *)(v142 + 24);
  if ((unint64_t)v148 < v182)
  {
    *(float32x2_t *)v148 = v144;
    *((float *)v148 + 2) = v143;
    *(void *)(v148 + 12) = v140;
    *((void *)v148 + 3) = 0;
    *((_DWORD *)v148 + 8) = 0;
    *((float *)v148 + 9) = a8;
    *((float *)v148 + 10) = v146;
    v148[44] = v145;
    v148[45] = v181;
    v183 = v148 + 48;
    *((_WORD *)v148 + 23) = 253;
LABEL_160:
    *(void *)(v142 + 16) = v183;
    goto LABEL_161;
  }
  unint64_t v184 = 0xAAAAAAAAAAAAAAABLL * ((v148 - v147) >> 4) + 1;
  if (v184 > 0x555555555555555) {
    abort();
  }
  unint64_t v185 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v182 - (void)v147) >> 4);
  if (2 * v185 > v184) {
    unint64_t v184 = 2 * v185;
  }
  if (v185 >= 0x2AAAAAAAAAAAAAALL) {
    unint64_t v186 = 0x555555555555555;
  }
  else {
    unint64_t v186 = v184;
  }
  if (!v186)
  {
    v187 = 0;
    goto LABEL_155;
  }
  float32x2_t v241 = v144;
  if (v186 > 0x555555555555555) {
LABEL_171:
  }
    std::__throw_bad_array_new_length[abi:nn180100]();
  v187 = (char *)operator new(48 * v186);
  float32x2_t v144 = v241;
LABEL_155:
  v188 = &v187[16 * ((v148 - v147) >> 4)];
  *(float32x2_t *)v188 = v144;
  *((float *)v188 + 2) = v143;
  *(void *)(v188 + 12) = v140;
  *((void *)v188 + 3) = 0;
  *((_DWORD *)v188 + 8) = 0;
  *((float *)v188 + 9) = a8;
  *((float *)v188 + 10) = v146;
  v188[44] = v145;
  v188[45] = v181;
  *((_WORD *)v188 + 23) = 253;
  v183 = v188 + 48;
  if (v148 != v147)
  {
    do
    {
      long long v189 = *((_OWORD *)v148 - 3);
      long long v190 = *((_OWORD *)v148 - 1);
      *((_OWORD *)v188 - 2) = *((_OWORD *)v148 - 2);
      *((_OWORD *)v188 - 1) = v190;
      *((_OWORD *)v188 - 3) = v189;
      v188 -= 48;
      v148 -= 48;
    }
    while (v148 != v147);
    v148 = *(char **)(v142 + 8);
  }
  *(void *)(v142 + 8) = v188;
  *(void *)(v142 + 16) = v183;
  *(void *)(v142 + 24) = &v187[48 * v186];
  if (!v148) {
    goto LABEL_160;
  }
  operator delete(v148);
  *(void *)(v142 + 16) = v183;
LABEL_161:
  v191 = *(_DWORD **)(*(void *)(a1 + 48) + 8);
  v191[12] = *(_DWORD *)a2;
  v191[13] = *((_DWORD *)a2 + 1);
  v191[14] = *((_DWORD *)a2 + 2);
}

- (optional<std::pair<const)_getSnappedSegment:()fast_shared_ptr<md:(mdm:(const PolylineCoordinate *)a4 :MDAllocator>)a3 :RouteLineSection coord:
{
  if (*(void *)a3._control) {
    uint64_t v6 = *(void *)a3._control + 8;
  }
  else {
    uint64_t v6 = 0;
  }
  unsigned int v7 = (*(uint64_t (**)(uint64_t, SEL))(*(void *)v6 + 56))(v6, a2);
  if ((int)v7 < 1)
  {
    unsigned int v8 = 0;
  }
  else
  {
    unsigned int v8 = 0;
    do
    {
      int v9 = v7 >> 1;
      uint64_t v10 = (*(uint64_t (**)(uint64_t, void))(*(void *)(*(void *)a3._control + 8) + 48))(*(void *)a3._control + 8, v8 + (v7 >> 1));
      unsigned int v11 = *(_DWORD *)(v10 + 12);
      if (v11 < a4->index || v11 == a4->index && *(float *)(v10 + 16) < a4->offset)
      {
        int v9 = v7 + ~v9;
        v8 += (v7 >> 1) + 1;
      }
      unsigned int v7 = v9;
    }
    while (v9 > 0);
  }
  if (*(void *)a3._control) {
    uint64_t v12 = *(void *)a3._control + 8;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = (*(uint64_t (**)(uint64_t))(*(void *)v12 + 56))(v12);
  LODWORD(v14) = v8 - 1;
  if (v8) {
    uint64_t v14 = v14;
  }
  else {
    uint64_t v14 = 0;
  }
  BOOL v15 = v13 != v8;
  if (v13 == v8) {
    uint64_t v14 = 0;
  }
  unint64_t v16 = v14 | ((unint64_t)v8 << 32);
  result.var0 = ($0B52383DBF7F2D66CC6C034D36116370)v16;
  result.var1 = v15;
  return result;
}

- (double)_findSimplifiedOffsetFor:(const PolylineCoordinate *)a3 betweenA:(const PolylineCoordinate *)a4 andB:(const PolylineCoordinate *)a5
{
  int v9 = [*((id *)self + 24) composedRoute];
  uint64_t v10 = v9;
  unsigned int index = a4->index;
  float offset = a4->offset;
  if (offset >= 1.0)
  {
    index += vcvtms_u32_f32(offset);
    float offset = offset - floorf(offset);
  }
  unsigned int v13 = a5->index;
  float v14 = a5->offset;
  if (v14 >= 1.0)
  {
    v13 += vcvtms_u32_f32(v14);
    float v14 = v14 - floorf(v14);
  }
  [v9 distanceBetweenRouteCoordinate:index | ((unint64_t)LODWORD(offset) << 32) andRouteCoordinate:v13 | ((unint64_t)LODWORD(v14) << 32)];
  double v16 = v15;

  double result = 0.0;
  if (v16 >= 1.0e-10)
  {
    uint64_t v18 = objc_msgSend(*((id *)self + 24), "composedRoute", 0.0);
    uint64_t v19 = v18;
    unsigned int v20 = a4->index;
    float v21 = a4->offset;
    if (v21 >= 1.0)
    {
      v20 += vcvtms_u32_f32(v21);
      float v21 = v21 - floorf(v21);
    }
    unsigned int v22 = a3->index;
    float v23 = a3->offset;
    if (v23 >= 1.0)
    {
      v22 += vcvtms_u32_f32(v23);
      float v23 = v23 - floorf(v23);
    }
    [v18 distanceBetweenRouteCoordinate:v20 | ((unint64_t)LODWORD(v21) << 32) andRouteCoordinate:v22 | ((unint64_t)LODWORD(v23) << 32)];
    double v25 = v24;

    return v25 / v16;
  }
  return result;
}

- (void)_updateTilesCovered:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((unsigned char *)self + 8))
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v9), "matchedPathSegments", (void)v12);
          if (v10) {
            [v5 addObject:v10];
          }

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
  else
  {
    id v5 = 0;
  }
  unsigned int v11 = (void *)*((void *)self + 48);
  *((void *)self + 48) = v5;
}

- (NSArray)matchedSegments
{
  uint64_t v3 = (std::mutex *)((char *)self + 440);
  std::mutex::lock((std::mutex *)((char *)self + 440));
  if ([*((id *)self + 54) count])
  {
    [*((id *)self + 29) addObjectsFromArray:*((void *)self + 54)];
    [*((id *)self + 54) removeAllObjects];
  }
  std::mutex::unlock(v3);
  id v4 = (void *)*((void *)self + 29);
  return (NSArray *)v4;
}

- (void)_clearMatchedSegments
{
  uint64_t v3 = (std::mutex *)((char *)self + 440);
  std::mutex::lock((std::mutex *)((char *)self + 440));
  [*((id *)self + 54) removeAllObjects];
  std::mutex::unlock(v3);
  id v4 = (void *)*((void *)self + 29);
  [v4 removeAllObjects];
}

- (void)_addMatchedSegments:(id)a3
{
  id v4 = a3;
  std::mutex::lock((std::mutex *)((char *)self + 440));
  [*((id *)self + 54) addObjectsFromArray:v4];
  std::mutex::unlock((std::mutex *)((char *)self + 440));
}

- (GEOComposedRoute)composedRoute
{
  return (GEOComposedRoute *)[*((id *)self + 24) composedRoute];
}

- (void)dealloc
{
  uint64_t v3 = [*((id *)self + 24) composedRoute];
  [v3 clearSnappedPathsForObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)VKRouteLine;
  [(VKRouteLine *)&v4 dealloc];
}

- (VKRouteLine)initWithPolylineOverlay:(id)a3
{
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VKRouteLine;
  id v6 = [(VKRouteLine *)&v17 init];
  uint64_t v7 = (id *)v6;
  if (v6)
  {
    objc_storeStrong((id *)v6 + 24, a3);
    id v8 = objc_alloc(MEMORY[0x1E4F64818]);
    uint64_t v9 = [v7[24] composedRoute];
    uint64_t v10 = [v8 initWithRoute:v9 auditToken:0];
    id v11 = v7[27];
    v7[27] = (id)v10;

    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v13 = v7[29];
    v7[29] = v12;

    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v15 = v7[54];
    v7[54] = v14;
  }
  return (VKRouteLine *)v7;
}

@end