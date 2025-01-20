@interface VKPolylineOverlay
- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate;
- (BOOL)_meetsMinimumPathLengthBetweenStart:(unsigned int)a3 end:(unsigned int)a4;
- (BOOL)containsTransit;
- (BOOL)hasFocus;
- (BOOL)isSnappingForSceneTiles;
- (BOOL)selected;
- (BOOL)showTraffic;
- (BOOL)skipped;
- (DebugTreeNode)createDebugNode;
- (GEOComposedRoute)composedRoute;
- (GEOComposedRouteTraffic)traffic;
- (GEOMapRegion)boundingMapRegion;
- (VKPolylineOverlay)initWithComposedRoute:(id)a3 traffic:(id)a4;
- (VKPolylineOverlayRouteRibbonObserver)routeRibbonObserver;
- (VKRouteLine)routeRibbon;
- (_NSRange)sectionRangeForBounds:()Box<double;
- (double)trafficTimeStamp;
- (id).cxx_construct;
- (id)getPathsForRenderRegion:(id)a3 shouldSnapToRoads:(BOOL)a4 shouldGenerateSnapPath:(BOOL)a5 verifySnapping:(BOOL)a6 isGradientTraffic:(BOOL)a7 observer:(id)a8 elevationSource:(void *)a9 elevationSourceContext:(void *)a10;
- (void)_setNeedsLayout;
- (void)addObserver:(id)a3;
- (void)clearSnappedPathsForObserver:(id)a3;
- (void)composedRoute:(id)a3 selectedSections:(id)a4 deselectedSections:(id)a5;
- (void)createMatchedSegmentAndAddToPaths:(id)a3 section:(id)a4 pathStartIndex:(unsigned int)a5 pathEndIndex:(unsigned int)a6 shouldGenerateSnapPath:(BOOL)a7 elevationSource:(void *)a8 elevationSourceContext:(void *)a9;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setHasFocus:(BOOL)a3;
- (void)setRouteRibbon:(id)a3;
- (void)setRouteRibbonObserver:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowTraffic:(BOOL)a3;
- (void)setSkipped:(BOOL)a3;
- (void)updateTraffic:(id)a3;
@end

@implementation VKPolylineOverlay

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traffic, 0);
  value = self->_trafficSegments.__ptr_.__value_;
  self->_trafficSegments.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = *(void **)value;
    if (*(void *)value)
    {
      *((void *)value + 1) = v4;
      operator delete(v4);
    }
    MEMORY[0x1A6239270](value, 0x20C40960023A9);
  }
  objc_destroyWeak((id *)&self->_routeRibbonObserver);
  objc_destroyWeak((id *)&self->_routeRibbon);
  objc_storeStrong((id *)&self->_composedRoute, 0);
}

- (void)setShowTraffic:(BOOL)a3
{
  self->_showTraffic = a3;
}

- (BOOL)showTraffic
{
  return self->_showTraffic;
}

- (void)setSkipped:(BOOL)a3
{
  self->_skipped = a3;
}

- (BOOL)skipped
{
  return self->_skipped;
}

- (void)setHasFocus:(BOOL)a3
{
  self->_hasFocus = a3;
}

- (BOOL)hasFocus
{
  return self->_hasFocus;
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
}

- (BOOL)selected
{
  return self->_selected;
}

- (void)setRouteRibbonObserver:(id)a3
{
}

- (VKPolylineOverlayRouteRibbonObserver)routeRibbonObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbonObserver);
  return (VKPolylineOverlayRouteRibbonObserver *)WeakRetained;
}

- (VKRouteLine)routeRibbon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbon);
  return (VKRouteLine *)WeakRetained;
}

- (double)trafficTimeStamp
{
  return self->_trafficTimeStamp;
}

- (GEOComposedRouteTraffic)traffic
{
  return self->_traffic;
}

- (GEOComposedRoute)composedRoute
{
  return self->_composedRoute;
}

- (void)composedRoute:(id)a3 selectedSections:(id)a4 deselectedSections:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v9 = self->_observers;
  uint64_t v10 = [(__CFSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v12++), "polyline:selectedSections:deselectedSections:", self, v7, v8, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [(__CFSet *)v9 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (DebugTreeNode)createDebugNode
{
  v2 = v1;
  v3 = retstr;
  *(_OWORD *)&retstr[1]._name.__r_.var0 = 0u;
  *(_OWORD *)retstr[2]._name.__r_.__value_.var0.__s.__data_ = 0u;
  *(_OWORD *)&retstr->_name.var0 = 0u;
  *(_OWORD *)&retstr[1]._name.__r_.__value_.var0.__l.__size_ = 0u;
  *(_OWORD *)retstr->_name.__r_.__value_.var0.__s.__data_ = 0u;
  *((_OWORD *)&retstr->_name.__r_.__value_.var0.__l + 1) = 0u;
  *((unsigned char *)&v42.__r_.__value_.__s + 23) = 17;
  strcpy((char *)&v42, "traffic timestamp");
  [v1 trafficTimeStamp];
  uint64_t v51 = 0;
  uint64_t v52 = 0;
  uint64_t v53 = 0;
  int v54 = 2;
  uint64_t v50 = v4;
  gdc::DebugTreeNode::addProperty((uint64_t)v3, (uint64_t)&v42, (uint64_t)v49);
  *((unsigned char *)&v42.__r_.__value_.__s + 23) = 8;
  strcpy((char *)&v42, "selected");
  unsigned int v5 = [v2 selected];
  int v48 = 0;
  memset(&v47[4], 0, 24);
  v47[0] = v5;
  gdc::DebugTreeNode::addProperty((uint64_t)v3, (uint64_t)&v42, (uint64_t)v47);
  id v7 = (void *)v2[7];
  if (v7)
  {
    unint64_t v8 = 0;
    v9 = (void ***)((char *)&v44 + 1);
    while (1)
    {
      if (v8 >= (uint64_t)(v7[1] - *v7) >> 3) {
        return result;
      }
      std::to_string(&v40, v8);
      uint64_t v10 = std::string::insert(&v40, 0, "segment ", 8uLL);
      uint64_t v12 = (std::string::value_type *)v10->__r_.__value_.__r.__words[0];
      std::string::size_type size = v10->__r_.__value_.__l.__size_;
      v41[0] = v10->__r_.__value_.__r.__words[2];
      *(_DWORD *)((char *)v41 + 3) = *(_DWORD *)((char *)&v10->__r_.__value_.__r.__words[2] + 3);
      int v13 = SHIBYTE(v10->__r_.__value_.__r.__words[2]);
      v10->__r_.__value_.__l.__size_ = 0;
      v10->__r_.__value_.__r.__words[2] = 0;
      v10->__r_.__value_.__r.__words[0] = 0;
      if ((v13 & 0x80000000) == 0) {
        break;
      }
      std::string::__init_copy_ctor_external(&v42, v12, size);
      LOBYTE(v43) = 0;
      long long v44 = 0u;
      memset(v45, 0, sizeof(v45));
      char v46 = 0;
      operator delete(v12);
      if (SHIBYTE(v40.__r_.__value_.__r.__words[2]) < 0) {
        goto LABEL_7;
      }
LABEL_8:
      *((unsigned char *)&v40.__r_.__value_.__s + 23) = 8;
      strcpy((char *)&v40, "distance");
      uint64_t v14 = *(void *)v2[7];
      if (v8 >= (*(void *)(v2[7] + 8) - v14) >> 3) {
        abort();
      }
      uint64_t v15 = *(unsigned int *)(v14 + 8 * v8);
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      uint64_t v36 = 0;
      int v39 = 1;
      uint64_t v35 = v15;
      gdc::DebugTreeNode::addProperty((uint64_t)&v42, (uint64_t)&v40, (uint64_t)v34);
      long long v16 = (void *)v2[7];
      *((unsigned char *)&v40.__r_.__value_.__s + 23) = 5;
      strcpy((char *)&v40, "speed");
      uint64_t v18 = v16;
      uint64_t v17 = *v16;
      if (v8 >= (v18[1] - v17) >> 3) {
        abort();
      }
      uint64_t v19 = *(unsigned __int8 *)(v17 + 8 * v8 + 4);
      memset(&v32[4], 0, 24);
      int v33 = 0;
      v32[0] = v19;
      gdc::DebugTreeNode::addProperty((uint64_t)&v42, (uint64_t)&v40, (uint64_t)v32);
      gdc::DebugTreeNode::addChildNode(v3, (long long *)&v42);
      v20 = *(void ***)&v45[9];
      if (*(void *)&v45[9])
      {
        uint64_t v21 = *(void *)&v45[17];
        v22 = *(void **)&v45[9];
        if (*(void *)&v45[17] != *(void *)&v45[9])
        {
          v23 = v9;
          do
          {
            uint64_t v24 = *(void *)(v21 - 24);
            if (v24)
            {
              uint64_t v25 = *(void *)(v21 - 16);
              v26 = *(void **)(v21 - 24);
              if (v25 != v24)
              {
                do
                {
                  if (*(char *)(v25 - 1) < 0) {
                    operator delete(*(void **)(v25 - 24));
                  }
                  v25 -= 24;
                }
                while (v25 != v24);
                v26 = *(void **)(v21 - 24);
              }
              *(void *)(v21 - 16) = v24;
              operator delete(v26);
            }
            uint64_t v27 = *(void *)(v21 - 48);
            if (v27)
            {
              uint64_t v28 = *(void *)(v21 - 40);
              v29 = *(void **)(v21 - 48);
              if (v28 != v27)
              {
                do
                {
                  if (*(char *)(v28 - 9) < 0) {
                    operator delete(*(void **)(v28 - 32));
                  }
                  v28 -= 64;
                }
                while (v28 != v27);
                v29 = *(void **)(v21 - 48);
              }
              *(void *)(v21 - 40) = v27;
              operator delete(v29);
            }
            v30 = (void **)(v21 - 80);
            if (*(char *)(v21 - 57) < 0) {
              operator delete(*v30);
            }
            v21 -= 80;
          }
          while (v30 != v20);
          v22 = *(void **)&v45[9];
          v9 = v23;
        }
        *(void *)&v45[17] = v20;
        operator delete(v22);
        v3 = retstr;
      }
      result = (DebugTreeNode *)std::vector<gdc::DebugTreeNode>::~vector[abi:nn180100](v9);
      if ((char)v44 < 0)
      {
        operator delete(v43);
        if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_3;
        }
      }
      else if ((SHIBYTE(v42.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
      {
        goto LABEL_3;
      }
      operator delete(v42.__r_.__value_.__l.__data_);
LABEL_3:
      ++v8;
      id v7 = (void *)v2[7];
    }
    v42.__r_.__value_.__r.__words[0] = (std::string::size_type)v12;
    v42.__r_.__value_.__l.__size_ = size;
    LODWORD(v42.__r_.__value_.__r.__words[2]) = v41[0];
    *(_DWORD *)((char *)&v42.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v41 + 3);
    *((unsigned char *)&v42.__r_.__value_.__s + 23) = v13;
    LOBYTE(v43) = 0;
    long long v44 = 0u;
    memset(v45, 0, sizeof(v45));
    char v46 = 0;
    if ((SHIBYTE(v40.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_8;
    }
LABEL_7:
    operator delete(v40.__r_.__value_.__l.__data_);
    goto LABEL_8;
  }
  return result;
}

- (BOOL)isSnappingForSceneTiles
{
  if (!self->_isReadyForSnapping) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbon);
  BOOL v3 = [WeakRetained numPathsMatching] != 0;

  return v3;
}

- (id)getPathsForRenderRegion:(id)a3 shouldSnapToRoads:(BOOL)a4 shouldGenerateSnapPath:(BOOL)a5 verifySnapping:(BOOL)a6 isGradientTraffic:(BOOL)a7 observer:(id)a8 elevationSource:(void *)a9 elevationSourceContext:(void *)a10
{
  BOOL v182 = a7;
  BOOL v11 = a6;
  BOOL v186 = a5;
  BOOL v12 = a4;
  uint64_t v222 = *MEMORY[0x1E4F143B8];
  id v190 = a3;
  id v175 = a8;
  id v189 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v183 = v12;
  self->_isReadyForSnapping = v12;
  if ([(VKPolylineOverlay *)self containsTransit])
  {
    [(GEOComposedRoute *)self->_composedRoute clearSnappedPathsForObserver:v175];
    long long v215 = 0u;
    long long v216 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    id v14 = [(GEOComposedRoute *)self->_composedRoute sections];
    uint64_t v15 = [v14 countByEnumeratingWithState:&v213 objects:v221 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v214;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v214 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v213 + 1) + 8 * i);
          uint64_t v19 = [v18 pathsForRenderRegion:v190 inOverlay:self shouldSnapToTransit:1 verifySnapping:v11 elevationSource:a9 elevationSourceContext:a10];
          if (v19
            || ([v18 pathsForRenderRegion:v190 inOverlay:self elevationSource:a9 elevationSourceContext:a10], (uint64_t v19 = objc_claimAutoreleasedReturnValue()) != 0))
          {
            [v189 addObjectsFromArray:v19];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v213 objects:v221 count:16];
      }
      while (v15);
    }
    id v20 = v189;
LABEL_13:

    goto LABEL_196;
  }
  if (!v12)
  {
    [(GEOComposedRoute *)self->_composedRoute clearSnappedPathsForObserver:v175];
    long long v197 = 0u;
    long long v198 = 0u;
    long long v195 = 0u;
    long long v196 = 0u;
    v47 = [(GEOComposedRoute *)self->_composedRoute sections];
    uint64_t v48 = [v47 countByEnumeratingWithState:&v195 objects:v218 count:16];
    if (v48)
    {
      uint64_t v49 = *(void *)v196;
      do
      {
        for (uint64_t j = 0; j != v48; ++j)
        {
          if (*(void *)v196 != v49) {
            objc_enumerationMutation(v47);
          }
          uint64_t v51 = [*(id *)(*((void *)&v195 + 1) + 8 * j) pathsForRenderRegion:v190 inOverlay:self elevationSource:a9 elevationSourceContext:a10];
          [v189 addObjectsFromArray:v51];
        }
        uint64_t v48 = [v47 countByEnumeratingWithState:&v195 objects:v218 count:16];
      }
      while (v48);
    }

    goto LABEL_193;
  }
  uint64_t v21 = (void *)[v190 snappingRegion];
  v22 = (double *)(v21 + 1);
  v23 = (double *)*v21;
  if ((void *)*v21 != v21 + 1)
  {
    __p = 0;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    uint64_t v26 = MEMORY[0x1E4F63F08];
    while (1)
    {
      double v27 = *(double *)(v26 + 16);
      double v28 = *(double *)(v26 + 24);
      double v29 = v23[4];
      double v30 = v27 * v29;
      double v31 = v23[7];
      double v32 = v28 - v31 * v28;
      double v33 = (v23[6] - v29) * v27;
      double v34 = (v31 - v23[5]) * v28;
      if (v24 >= v25)
      {
        uint64_t v36 = ((char *)v24 - (char *)__p) >> 5;
        unint64_t v37 = v36 + 1;
        if ((unint64_t)(v36 + 1) >> 59) {
          abort();
        }
        if (((char *)v25 - (char *)__p) >> 4 > v37) {
          unint64_t v37 = ((char *)v25 - (char *)__p) >> 4;
        }
        if ((unint64_t)((char *)v25 - (char *)__p) >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v38 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v38 = v37;
        }
        if (v38)
        {
          if (v38 >> 59) {
            goto LABEL_211;
          }
          int v39 = (char *)operator new(32 * v38);
        }
        else
        {
          int v39 = 0;
        }
        std::string v40 = (double *)&v39[32 * v36];
        *std::string v40 = v30;
        v40[1] = v32;
        v40[2] = v33;
        v40[3] = v34;
        if (v24 == __p)
        {
          long long v44 = &v39[32 * v36];
          std::string v42 = __p;
        }
        else
        {
          v41 = &v39[32 * v36];
          std::string v42 = __p;
          do
          {
            long long v43 = *((_OWORD *)v24 - 1);
            long long v44 = v41 - 32;
            *((_OWORD *)v41 - 2) = *((_OWORD *)v24 - 2);
            *((_OWORD *)v41 - 1) = v43;
            v24 -= 4;
            v41 -= 32;
          }
          while (v24 != __p);
        }
        uint64_t v25 = (double *)&v39[32 * v38];
        uint64_t v24 = v40 + 4;
        if (v42) {
          operator delete(v42);
        }
        __p = (double *)v44;
        uint64_t v35 = (double *)*((void *)v23 + 1);
        if (v35)
        {
          do
          {
LABEL_39:
            v45 = v35;
            uint64_t v35 = *(double **)v35;
          }
          while (v35);
          goto LABEL_17;
        }
      }
      else
      {
        *uint64_t v24 = v30;
        v24[1] = v32;
        v24[2] = v33;
        v24[3] = v34;
        v24 += 4;
        uint64_t v35 = (double *)*((void *)v23 + 1);
        if (v35) {
          goto LABEL_39;
        }
      }
      do
      {
        v45 = (double *)*((void *)v23 + 2);
        BOOL v46 = *(void *)v45 == (void)v23;
        v23 = v45;
      }
      while (!v46);
LABEL_17:
      v23 = v45;
      if (v45 == v22) {
        goto LABEL_53;
      }
    }
  }
  uint64_t v24 = 0;
  __p = 0;
LABEL_53:
  [v190 visibleRect];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbon);
  [WeakRetained _clearMatchedSegments];

  id v53 = objc_loadWeakRetained((id *)&self->_routeRibbon);
  if (v53)
  {
    int v54 = v53;
    locatiouint64_t n = (id *)&self->_routeRibbon;
    id v55 = objc_loadWeakRetained((id *)&self->_routeRibbon);
    v56 = [v55 pathMatcher];

    if (v56)
    {
      id v57 = objc_loadWeakRetained(location);
      [v57 setMatchingEndIndex:0];

      uint64_t v58 = [(GEOComposedRoute *)self->_composedRoute pointCount] - 1;
      id v59 = objc_loadWeakRetained((id *)&self->_routeRibbon);
      [v59 setMatchingStartIndex:v58];

      long long v211 = 0u;
      long long v212 = 0u;
      long long v209 = 0u;
      long long v210 = 0u;
      v60 = [(GEOComposedRoute *)self->_composedRoute sections];
      uint64_t v181 = [v60 countByEnumeratingWithState:&v209 objects:v220 count:16];
      if (v181)
      {
        uint64_t v61 = *(void *)v210;
        if (__p == v24)
        {
          do
          {
            for (uint64_t k = 0; k != v181; ++k)
            {
              if (*(void *)v210 != v61) {
                objc_enumerationMutation(v60);
              }
              v121 = *(void **)(*((void *)&v209 + 1) + 8 * k);
              if (v121)
              {
                [v121 bounds];
              }
              else
              {
                long long v207 = 0u;
                long long v208 = 0u;
                long long v206 = 0u;
              }
              GEOMapRectIntersectsRect();
            }
            uint64_t v181 = [v60 countByEnumeratingWithState:&v209 objects:v220 count:16];
          }
          while (v181);
        }
        else
        {
          uint64_t v179 = *(void *)v210;
          v180 = v60;
          do
          {
            uint64_t v62 = 0;
            do
            {
              if (*(void *)v210 != v61) {
                objc_enumerationMutation(v60);
              }
              v63 = *(void **)(*((void *)&v209 + 1) + 8 * v62);
              uint64_t v185 = v62;
              if (v63)
              {
                [v63 bounds];
                double v64 = *((double *)&v206 + 1);
                double v65 = *(double *)&v206;
                double v67 = *((double *)&v207 + 1);
                double v66 = *(double *)&v208;
              }
              else
              {
                long long v207 = 0u;
                long long v208 = 0u;
                double v66 = 0.0;
                double v67 = 0.0;
                double v64 = 0.0;
                double v65 = 0.0;
                long long v206 = 0u;
              }
              if (GEOMapRectIntersectsRect())
              {
                v68 = 0;
                v69 = 0;
                v70 = 0;
                double v188 = v66 + v64;
                double v187 = 1.0 / v67;
                v71 = __p;
                double v72 = 1.0 / v66;
                do
                {
                  double v74 = *v71;
                  double v73 = v71[1];
                  double v76 = v71[2];
                  double v75 = v71[3];
                  if (GEOMapRectIntersectsRect())
                  {
                    float v77 = (v74 - v65) * v187;
                    float v78 = (v188 - v73) * v72;
                    float v79 = (v76 + v74 - v65) * v187;
                    float v80 = (v188 - (v75 + v73)) * v72;
                    float v81 = fminf(fminf(v77, 3.4028e38), v79);
                    float v82 = fmaxf(fmaxf(v77, -3.4028e38), v79);
                    float v83 = fminf(fminf(v78, 3.4028e38), v80);
                    float v84 = fmaxf(fmaxf(v78, -3.4028e38), v80);
                    if (v69 < v70)
                    {
                      float *v69 = v81;
                      v69[1] = v83;
                      v69[2] = v82;
                      v69[3] = v84;
                      v69 += 4;
                    }
                    else
                    {
                      uint64_t v85 = ((char *)v69 - (char *)v68) >> 4;
                      unint64_t v86 = v85 + 1;
                      if ((unint64_t)(v85 + 1) >> 60) {
                        abort();
                      }
                      if (((char *)v70 - (char *)v68) >> 3 > v86) {
                        unint64_t v86 = ((char *)v70 - (char *)v68) >> 3;
                      }
                      if ((unint64_t)((char *)v70 - (char *)v68) >= 0x7FFFFFFFFFFFFFF0) {
                        unint64_t v87 = 0xFFFFFFFFFFFFFFFLL;
                      }
                      else {
                        unint64_t v87 = v86;
                      }
                      if (v87)
                      {
                        if (v87 >> 60) {
                          goto LABEL_211;
                        }
                        v88 = (char *)operator new(16 * v87);
                      }
                      else
                      {
                        v88 = 0;
                      }
                      v89 = (float *)&v88[16 * v85];
                      float *v89 = v81;
                      v89[1] = v83;
                      v89[2] = v82;
                      v89[3] = v84;
                      if (v69 == v68)
                      {
                        v91 = &v88[16 * v85];
                      }
                      else
                      {
                        v90 = &v88[16 * v85];
                        do
                        {
                          v91 = v90 - 16;
                          *((_OWORD *)v90 - 1) = *((_OWORD *)v69 - 1);
                          v69 -= 4;
                          v90 -= 16;
                        }
                        while (v69 != v68);
                      }
                      v70 = (float *)&v88[16 * v87];
                      v69 = v89 + 4;
                      if (v68) {
                        operator delete(v68);
                      }
                      v68 = (float *)v91;
                    }
                  }
                  v71 += 4;
                }
                while (v71 != v24);
                if (v68 != v69)
                {
                  unsigned int v92 = [v63 startPointIndex];
                  id v93 = objc_loadWeakRetained(location);
                  unsigned int v94 = [v93 matchingStartIndex];
                  if (v92 >= v94)
                  {
                    id v177 = objc_loadWeakRetained(location);
                    uint64_t v95 = [v177 matchingStartIndex];
                  }
                  else
                  {
                    uint64_t v95 = [v63 startPointIndex];
                  }
                  uint64_t v96 = v95;
                  id v97 = objc_loadWeakRetained(location);
                  [v97 setMatchingStartIndex:v96];

                  if (v92 >= v94) {
                  unsigned int v98 = [v63 endPointIndex];
                  }
                  id v99 = objc_loadWeakRetained(location);
                  unsigned int v100 = [v99 matchingEndIndex];
                  if (v98 <= v100)
                  {
                    id v176 = objc_loadWeakRetained(location);
                    uint64_t v101 = [v176 matchingEndIndex];
                  }
                  else
                  {
                    uint64_t v101 = [v63 endPointIndex];
                  }
                  uint64_t v102 = v101;
                  id v103 = objc_loadWeakRetained(location);
                  [v103 setMatchingEndIndex:v102];

                  if (v98 <= v100) {
                  uint64_t v104 = [v63 points];
                  }
                  uint64_t v105 = [v63 startPointIndex];
                  unint64_t v106 = 0;
                  uint64_t v107 = 0xFFFFFFFFLL;
                  while (1)
                  {
LABEL_102:
                    if (v106 >= [v63 pointCount] - 1)
                    {
                      uint64_t v108 = v105;
                      goto LABEL_117;
                    }
                    uint64_t v108 = [v63 startPointIndex] + v106;
                    v109 = (float *)(v104 + 12 * v106);
                    float v110 = v109[1];
                    float v111 = fminf(v110, 3.4028e38);
                    float v112 = fmaxf(v110, -3.4028e38);
                    ++v106;
                    float v113 = v109[3];
                    float v114 = v109[4];
                    *(float *)&double v115 = fminf(v113, fminf(*v109, 3.4028e38));
                    float v116 = fmaxf(fmaxf(*v109, -3.4028e38), v113);
                    float v117 = fminf(v114, v111);
                    float v118 = fmaxf(v112, v114);
                    v119 = v68;
                    while (v116 <= *v119 || *(float *)&v115 >= v119[2] || v118 <= v119[1] || v117 >= v119[3])
                    {
                      v119 += 4;
                      if (v119 == v69)
                      {
                        if (v107 != v108) {
                          goto LABEL_102;
                        }
                        if (-[VKPolylineOverlay _meetsMinimumPathLengthBetweenStart:end:](self, "_meetsMinimumPathLengthBetweenStart:end:", v105, v107, v115))
                        {
                          [(VKPolylineOverlay *)self createMatchedSegmentAndAddToPaths:v189 section:v63 pathStartIndex:v105 pathEndIndex:v107 shouldGenerateSnapPath:v186 elevationSource:a9 elevationSourceContext:a10];
                          goto LABEL_102;
                        }
LABEL_110:
                        uint64_t v107 = (v107 + 1);
                        goto LABEL_102;
                      }
                    }
                    if (v107 == v108) {
                      goto LABEL_110;
                    }
                    if (!-[VKPolylineOverlay _meetsMinimumPathLengthBetweenStart:end:](self, "_meetsMinimumPathLengthBetweenStart:end:", v108, [v63 endPointIndex]))break; {
                    uint64_t v107 = (v108 + 1);
                    }
                    uint64_t v105 = v108;
                  }
                  uint64_t v107 = [v63 endPointIndex];
LABEL_117:
                  if (v107 == [v63 endPointIndex]) {
                    [(VKPolylineOverlay *)self createMatchedSegmentAndAddToPaths:v189 section:v63 pathStartIndex:v108 pathEndIndex:v107 shouldGenerateSnapPath:v186 elevationSource:a9 elevationSourceContext:a10];
                  }
                }
                if (v68) {
                  operator delete(v68);
                }
              }
              uint64_t v62 = v185 + 1;
              v60 = v180;
              uint64_t v61 = v179;
            }
            while (v185 + 1 != v181);
            uint64_t v181 = [v180 countByEnumeratingWithState:&v209 objects:v220 count:16];
          }
          while (v181);
        }
      }
    }
  }
  v203 = 0;
  v204 = 0;
  v205 = 0;
  if (!v189 || ![v189 count]) {
    goto LABEL_182;
  }
  unsigned int v122 = 0;
  unsigned int v123 = 0;
  unsigned int v124 = -1;
  while (1)
  {
    unsigned int v125 = v123;
    if ([v189 count] <= (unint64_t)v123) {
      break;
    }
    v126 = [v189 objectAtIndex:v123];
    v127 = v126;
    if (v124 > v122)
    {
      unsigned int v124 = [v126 routeStart];
      unsigned int v122 = [v127 routeEnd];
    }
    if (v122 >= [v127 routeStart])
    {
      unsigned int v122 = [v127 routeEnd];
      goto LABEL_162;
    }
    v128 = v204;
    if (v204 >= v205)
    {
      v130 = (char *)v203;
      int64_t v131 = v204 - (unsigned char *)v203;
      uint64_t v132 = (v204 - (unsigned char *)v203) >> 3;
      unint64_t v133 = v132 + 1;
      if ((unint64_t)(v132 + 1) >> 61) {
        abort();
      }
      uint64_t v134 = v205 - (unsigned char *)v203;
      if ((v205 - (unsigned char *)v203) >> 2 > v133) {
        unint64_t v133 = v134 >> 2;
      }
      if ((unint64_t)v134 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v135 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v135 = v133;
      }
      if (v135 >> 61) {
        goto LABEL_211;
      }
      v136 = (char *)operator new(8 * v135);
      v137 = (unsigned int *)&v136[8 * v132];
      unsigned int *v137 = v124;
      v137[1] = v122;
      if (v128 == v130)
      {
        v139 = (unsigned int *)&v136[8 * v132];
      }
      else
      {
        unint64_t v138 = v128 - 8 - v130;
        if (v138 < 0x58)
        {
          v139 = (unsigned int *)&v136[8 * v132];
          goto LABEL_158;
        }
        v139 = (unsigned int *)&v136[8 * v132];
        if ((unint64_t)(v128 - &v136[v131]) < 0x20) {
          goto LABEL_217;
        }
        uint64_t v140 = (v138 >> 3) + 1;
        v141 = &v136[8 * v132 - 16];
        v142 = v128 - 16;
        uint64_t v143 = v140 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v144 = *(_OWORD *)v142;
          *((_OWORD *)v141 - 1) = *((_OWORD *)v142 - 1);
          *(_OWORD *)v141 = v144;
          v141 -= 32;
          v142 -= 32;
          v143 -= 4;
        }
        while (v143);
        v139 = &v137[-2 * (v140 & 0x3FFFFFFFFFFFFFFCLL)];
        v128 -= 8 * (v140 & 0x3FFFFFFFFFFFFFFCLL);
        if (v140 != (v140 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_217:
          do
          {
LABEL_158:
            uint64_t v145 = *((void *)v128 - 1);
            v128 -= 8;
            *((void *)v139 - 1) = v145;
            v139 -= 2;
          }
          while (v128 != v130);
        }
      }
      v129 = (char *)(v137 + 2);
      v203 = v139;
      v204 = (char *)(v137 + 2);
      v205 = &v136[8 * v135];
      if (v130) {
        operator delete(v130);
      }
      goto LABEL_161;
    }
    *(_DWORD *)v204 = v124;
    *((_DWORD *)v128 + 1) = v122;
    v129 = v128 + 8;
LABEL_161:
    v204 = v129;
    unsigned int v124 = [v127 routeStart];
    unsigned int v122 = [v127 routeEnd];
LABEL_162:

    unsigned int v123 = v125 + 1;
  }
  v146 = v204;
  if (v204 < v205)
  {
    *(_DWORD *)v204 = v124;
    *((_DWORD *)v146 + 1) = v122;
    v147 = v146 + 8;
    goto LABEL_181;
  }
  v148 = v203;
  int64_t v149 = v204 - (unsigned char *)v203;
  uint64_t v150 = (v204 - (unsigned char *)v203) >> 3;
  unint64_t v151 = v150 + 1;
  if ((unint64_t)(v150 + 1) >> 61) {
    abort();
  }
  uint64_t v152 = v205 - (unsigned char *)v203;
  if ((v205 - (unsigned char *)v203) >> 2 > v151) {
    unint64_t v151 = v152 >> 2;
  }
  if ((unint64_t)v152 >= 0x7FFFFFFFFFFFFFF8) {
    unint64_t v153 = 0x1FFFFFFFFFFFFFFFLL;
  }
  else {
    unint64_t v153 = v151;
  }
  if (v153 >> 61) {
LABEL_211:
  }
    std::__throw_bad_array_new_length[abi:nn180100]();
  v154 = (char *)operator new(8 * v153);
  v155 = (unsigned int *)&v154[8 * v150];
  v156 = &v154[8 * v153];
  unsigned int *v155 = v124;
  v155[1] = v122;
  v147 = (char *)(v155 + 2);
  if (v146 != v148)
  {
    unint64_t v157 = v146 - v148 - 8;
    if (v157 < 0x58) {
      goto LABEL_218;
    }
    if ((unint64_t)(v146 - &v154[v149]) < 0x20) {
      goto LABEL_218;
    }
    uint64_t v158 = (v157 >> 3) + 1;
    v159 = &v154[8 * v150 - 16];
    v160 = v146 - 16;
    uint64_t v161 = v158 & 0x3FFFFFFFFFFFFFFCLL;
    do
    {
      long long v162 = *(_OWORD *)v160;
      *((_OWORD *)v159 - 1) = *((_OWORD *)v160 - 1);
      *(_OWORD *)v159 = v162;
      v159 -= 32;
      v160 -= 32;
      v161 -= 4;
    }
    while (v161);
    v155 -= 2 * (v158 & 0x3FFFFFFFFFFFFFFCLL);
    v146 -= 8 * (v158 & 0x3FFFFFFFFFFFFFFCLL);
    if (v158 != (v158 & 0x3FFFFFFFFFFFFFFCLL))
    {
LABEL_218:
      do
      {
        uint64_t v163 = *((void *)v146 - 1);
        v146 -= 8;
        *((void *)v155 - 1) = v163;
        v155 -= 2;
      }
      while (v146 != v148);
    }
  }
  v203 = v155;
  v204 = v147;
  v205 = v156;
  if (v148) {
    operator delete(v148);
  }
LABEL_181:
  v204 = v147;
LABEL_182:
  long long v201 = 0u;
  long long v202 = 0u;
  long long v199 = 0u;
  long long v200 = 0u;
  v164 = [(GEOComposedRoute *)self->_composedRoute sections];
  uint64_t v165 = [v164 countByEnumeratingWithState:&v199 objects:v219 count:16];
  if (v165)
  {
    uint64_t v166 = *(void *)v200;
    do
    {
      for (uint64_t m = 0; m != v165; ++m)
      {
        if (*(void *)v200 != v166) {
          objc_enumerationMutation(v164);
        }
        v168 = [*(id *)(*((void *)&v199 + 1) + 8 * m) pathsForRenderRegion:v190 inOverlay:self excludedSegments:&v203 elevationSource:a9 elevationSourceContext:a10];
        [v189 addObjectsFromArray:v168];
      }
      uint64_t v165 = [v164 countByEnumeratingWithState:&v199 objects:v219 count:16];
    }
    while (v165);
  }

  [v189 sortUsingComparator:&__block_literal_global_25810];
  if (v203)
  {
    v204 = (char *)v203;
    operator delete(v203);
  }
  if (__p) {
    operator delete(__p);
  }
LABEL_193:
  if (self->_traffic && ![(GEOComposedRoute *)self->_composedRoute transportType])
  {
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v193 = 0u;
    long long v194 = 0u;
    long long v191 = 0u;
    long long v192 = 0u;
    id v14 = v189;
    uint64_t v170 = [v14 countByEnumeratingWithState:&v191 objects:v217 count:16];
    if (v170)
    {
      uint64_t v171 = *(void *)v192;
      do
      {
        for (uint64_t n = 0; n != v170; ++n)
        {
          if (*(void *)v192 != v171) {
            objc_enumerationMutation(v14);
          }
          v173 = *(void **)(*((void *)&v191 + 1) + 8 * n);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v174 = v173;
            [v174 splitTrafficSegmentationAndAddTo:v20 with:self->_trafficSegments.__ptr_.__value_ shouldSnap:v183 isGradientTraffic:v182];
          }
          else
          {
            [v20 addObject:v173];
          }
        }
        uint64_t v170 = [v14 countByEnumeratingWithState:&v191 objects:v217 count:16];
      }
      while (v170);
    }

    goto LABEL_13;
  }
  id v20 = v189;
LABEL_196:

  return v20;
}

uint64_t __167__VKPolylineOverlay_getPathsForRenderRegion_shouldSnapToRoads_shouldGenerateSnapPath_verifySnapping_isGradientTraffic_observer_elevationSource_elevationSourceContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  id v6 = v4;
  id v7 = v5;
  uint64_t v8 = [v6 routeStart];
  uint64_t v9 = [v7 routeStart];
  if (v8 < v9
    || v8 == v9 && (LODWORD(v10) = HIDWORD(v8), *((float *)&v8 + 1) < *((float *)&v9 + 1)))
  {
    uint64_t v11 = -1;
  }
  else
  {
    uint64_t v12 = objc_msgSend(v6, "routeStart", v10);
    uint64_t v13 = [v7 routeStart];
    float v14 = fabsf(*((float *)&v12 + 1) - *((float *)&v13 + 1));
    uint64_t v11 = v12 != v13 || v14 >= 0.00000011921;
  }

  return v11;
}

- (void)createMatchedSegmentAndAddToPaths:(id)a3 section:(id)a4 pathStartIndex:(unsigned int)a5 pathEndIndex:(unsigned int)a6 shouldGenerateSnapPath:(BOOL)a7 elevationSource:(void *)a8 elevationSourceContext:(void *)a9
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v11 = *(void *)&a5;
  id v28 = a3;
  id v14 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbon);
  objc_msgSend(WeakRetained, "setNumPathsMatching:", (unsigned __int16)(objc_msgSend(WeakRetained, "numPathsMatching") + 1));

  id v16 = objc_loadWeakRetained((id *)&self->_routeRibbon);
  uint64_t v17 = [v16 pathMatcher];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __153__VKPolylineOverlay_createMatchedSegmentAndAddToPaths_section_pathStartIndex_pathEndIndex_shouldGenerateSnapPath_elevationSource_elevationSourceContext___block_invoke;
  v29[3] = &unk_1E5A93348;
  v29[4] = self;
  [v17 matchRouteFromStart:v11 toEnd:v10 finishedHandler:v29];

  if (a7)
  {
    id v18 = objc_loadWeakRetained((id *)&self->_routeRibbon);
    uint64_t v19 = [v18 pathMatcher];
    id v20 = [v19 matchedSegmentsFromStart:v11 toEnd:v10];

    if (!v20 || ![v20 count]) {
      goto LABEL_10;
    }
    uint64_t v21 = [v20 count];
    v22 = [v20 objectAtIndexedSubscript:0];
    if ([v22 startRouteCoordinate] == v11)
    {
      v23 = [v20 objectAtIndexedSubscript:v21 - 1];
      int v24 = [v23 endRouteCoordinate];

      if (v24 != v10)
      {
LABEL_10:

        goto LABEL_11;
      }
      int v25 = [(GEOComposedRoute *)self->_composedRoute transportType];
      uint64_t v26 = off_1E5A8B120;
      if (v25) {
        uint64_t v26 = off_1E5A8B1F8;
      }
      v22 = (void *)[objc_alloc(*v26) initWithOverlay:self section:v14 routeStartIndex:v11 routeEndIndex:v10 matchedPathSegments:v20 elevationSource:a8 elevationSourceContext:a9];
      [v28 addObject:v22];
      [(VKPolylineOverlay *)self _setNeedsLayout];
    }

    goto LABEL_10;
  }
LABEL_11:
}

void __153__VKPolylineOverlay_createMatchedSegmentAndAddToPaths_section_pathStartIndex_pathEndIndex_shouldGenerateSnapPath_elevationSource_elevationSourceContext___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = (id *)(*(void *)(a1 + 32) + 32);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _addMatchedSegments:v4];

  id v6 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  objc_msgSend(v6, "setNumPathsMatching:", (unsigned __int16)(objc_msgSend(v6, "numPathsMatching") - 1));
}

- (BOOL)_meetsMinimumPathLengthBetweenStart:(unsigned int)a3 end:(unsigned int)a4
{
  [(GEOComposedRoute *)self->_composedRoute pointAt:a3];
  unsigned int v7 = a3 + 1;
  double v8 = 0.0;
  do
  {
    unsigned int v9 = v7;
    if (v7 > a4) {
      break;
    }
    [(GEOComposedRoute *)self->_composedRoute pointAt:v7];
    GEOCalculateDistance();
    double v8 = v10 + v8;
    unsigned int v7 = v9 + 1;
  }
  while (v8 < 100.0);
  return v9 <= a4;
}

- (void)clearSnappedPathsForObserver:(id)a3
{
  self->_isReadyForSnapping = 0;
  [(GEOComposedRoute *)self->_composedRoute clearSnappedPathsForObserver:a3];
}

- (void)updateTraffic:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = (GEOComposedRouteTraffic *)a3;
  if (GEOGetVectorKitRouteLog_onceToken != -1) {
    dispatch_once(&GEOGetVectorKitRouteLog_onceToken, &__block_literal_global_33);
  }
  id v6 = (id)GEOGetVectorKitRouteLog_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v18 = 134218242;
    uint64_t v19 = self;
    __int16 v20 = 2112;
    uint64_t v21 = v5;
    _os_log_impl(&dword_1A1780000, v6, OS_LOG_TYPE_INFO, "VKPolylineOverlay %p updateTraffic: %@", (uint8_t *)&v18, 0x16u);
  }

  if (self->_traffic != v5) {
    objc_storeStrong((id *)&self->_traffic, a3);
  }
  if (![(VKPolylineOverlay *)self containsTransit])
  {
    *((void *)self->_trafficSegments.__ptr_.__value_ + 1) = *(void *)self->_trafficSegments.__ptr_.__value_;
    if (v5)
    {
      unint64_t v7 = [(GEOComposedRouteTraffic *)v5 trafficColorOffsetsCount];
      unint64_t v8 = [(GEOComposedRouteTraffic *)v5 trafficColorsCount];
      if (v8 >= v7) {
        unint64_t v9 = v7;
      }
      else {
        unint64_t v9 = v8;
      }
      if (v9)
      {
        uint64_t v10 = [(GEOComposedRouteTraffic *)v5 trafficColors];
        uint64_t v11 = [(GEOComposedRouteTraffic *)v5 trafficColorOffsets];
        if (v9 >= 2)
        {
          unint64_t v12 = v9 - 1;
          uint64_t v13 = (unsigned int *)(v11 + 4);
          id v14 = (unsigned __int8 *)v10;
          do
          {
            unsigned int v16 = *v13++;
            unsigned int v15 = v16;
            unsigned int v17 = *v14;
            v14 += 4;
            md::TrafficSegmentsAlongRoute::addSegmentAt((md::TrafficSegmentsAlongRoute *)self->_trafficSegments.__ptr_.__value_, v15, v17);
            --v12;
          }
          while (v12);
        }
        md::TrafficSegmentsAlongRoute::addSegmentAt((md::TrafficSegmentsAlongRoute *)self->_trafficSegments.__ptr_.__value_, 0xFFFFFFFF, *(unsigned __int8 *)(v10 + 4 * v9 - 4));
      }
      else
      {
        md::TrafficSegmentsAlongRoute::addSegmentAt((md::TrafficSegmentsAlongRoute *)self->_trafficSegments.__ptr_.__value_, 0xFFFFFFFF, 4);
      }
    }
    self->_trafficTimeStamp = CFAbsoluteTimeGetCurrent();
    [(VKPolylineOverlay *)self _setNeedsLayout];
  }
}

- (_NSRange)sectionRangeForBounds:()Box<double
{
  double v3 = a3._maximum._e[1];
  double v4 = a3._maximum._e[0];
  double v5 = a3._minimum._e[1];
  double v6 = a3._minimum._e[0];
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = [(GEOComposedRoute *)self->_composedRoute sections];
  unint64_t v9 = [v8 count];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [(GEOComposedRoute *)self->_composedRoute sections];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  unint64_t v12 = v9 - 1;
  if (v11)
  {
    int v13 = 0;
    uint64_t v14 = *(void *)v26;
    do
    {
      uint64_t v15 = 0;
      uint64_t v16 = v13;
      v13 += v11;
      do
      {
        if (*(void *)v26 != v14) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v25 + 1) + 8 * v15) vkBounds];
        if (v4 > v20)
        {
          BOOL v21 = v6 < v18;
          if (v3 <= v17) {
            BOOL v21 = 0;
          }
          if (v9 >= v16 + v15) {
            unint64_t v22 = v16 + v15;
          }
          else {
            unint64_t v22 = v9;
          }
          if (v21 && v5 < v19)
          {
            unint64_t v12 = v16 + v15;
            unint64_t v9 = v22;
          }
        }
        ++v15;
      }
      while (v11 != v15);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  NSUInteger v23 = v12 - v9 + 1;
  NSUInteger v24 = v9;
  result.length = v23;
  result.locatiouint64_t n = v24;
  return result;
}

- (GEOMapRegion)boundingMapRegion
{
  return (GEOMapRegion *)[(GEOComposedRoute *)self->_composedRoute boundingMapRegion];
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)coordinate
{
  v2 = [(GEOComposedRoute *)self->_composedRoute boundingMapRegion];
  [v2 southLat];
  double v4 = v3;
  [v2 northLat];
  double v6 = v5;
  [v2 westLng];
  double v8 = v7;
  [v2 eastLng];
  double v9 = (v6 + v4) * 0.5;
  double v11 = (v10 + v8) * 0.5;

  double v12 = v9;
  double v13 = v11;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (BOOL)containsTransit
{
  return [(GEOComposedRoute *)self->_composedRoute transportType] == 1;
}

- (void)setRouteRibbon:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routeRibbon);

  double v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_routeRibbon, obj);
    id v6 = objc_loadWeakRetained((id *)&self->_routeRibbonObserver);
    id v7 = objc_loadWeakRetained((id *)&self->_routeRibbon);
    [v6 polylineOverlay:self didUpdateRouteRibbon:v7];

    double v5 = obj;
  }
}

- (void)_setNeedsLayout
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  double v3 = self->_observers;
  uint64_t v4 = [(__CFSet *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setNeedsLayoutForPolyline:", self, (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(__CFSet *)v3 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)removeObserver:(id)a3
{
  id value = a3;
  observers = self->_observers;
  if (observers) {
    CFSetRemoveValue(observers, value);
  }
  [(GEOComposedRoute *)self->_composedRoute clearSnappedPathsForObserver:value];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  observers = self->_observers;
  if (!observers)
  {
    CFSetCallBacks v6 = *(CFSetCallBacks *)byte_1EF590828;
    observers = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v6);
    self->_observers = observers;
  }
  CFSetAddValue(observers, v4);
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  objc_storeWeak((id *)&self->_routeRibbon, 0);
  [(GEOComposedRoute *)self->_composedRoute unregisterObserver:self];
  observers = self->_observers;
  if (observers) {
    CFRelease(observers);
  }
  v5.receiver = self;
  v5.super_class = (Class)VKPolylineOverlay;
  [(VKPolylineOverlay *)&v5 dealloc];
}

- (VKPolylineOverlay)initWithComposedRoute:(id)a3 traffic:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VKPolylineOverlay;
  long long v9 = [(VKPolylineOverlay *)&v14 init];
  long long v10 = v9;
  double v11 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_composedRoute, a3);
    [(GEOComposedRoute *)v11->_composedRoute registerObserver:v11];
    if (![(VKPolylineOverlay *)v11 containsTransit])
    {
      objc_storeStrong((id *)&v10->_traffic, a4);
      operator new();
    }
    uint64_t v12 = v11;
  }

  return v11;
}

@end