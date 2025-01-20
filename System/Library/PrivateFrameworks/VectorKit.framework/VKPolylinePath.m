@interface VKPolylinePath
- (BOOL)hasCompletedMapMatching;
- (BOOL)isMapMatched;
- (GEOComposedRouteSection)section;
- (Matrix<float,)convertCoordinateToTile:(id *)a3;
- (NSArray)matchedPathSegments;
- (PolylineCoordinate)routeEnd;
- (PolylineCoordinate)routeStart;
- (VKPolylinePath)initWithOverlay:(id)a3 section:(id)a4 matchedPathSegments:(id)a5;
- (VKPolylinePath)initWithOverlay:(id)a3 section:(id)a4 routeStartIndex:(unsigned int)a5 routeEndIndex:(unsigned int)a6 matchedPathSegments:(id)a7 elevationSource:(void *)a8 elevationSourceContext:(void *)a9;
- (const)gradientTrafficAtIndex:(unsigned int)a3;
- (const)polylineCoordinates;
- (double)startDistance;
- (float)laneHalfWidthAtIndex:(unsigned int)a3;
- (id).cxx_construct;
- (id)description;
- (unsigned)pointCount;
- (void)points;
- (void)setRouteEnd:(PolylineCoordinate)a3;
- (void)setRouteStart:(PolylineCoordinate)a3;
- (void)setStartDistance:(double)a3;
@end

@implementation VKPolylinePath

- (id).cxx_construct
{
  *(void *)((char *)self + 84) = 0xBF80000000000000;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 4) = 0u;
  *(void *)((char *)self + 92) = 0xBF80000000000000;
  return self;
}

- (void).cxx_destruct
{
  begin = self->_polylineCoordinates.__begin_;
  if (begin)
  {
    self->_polylineCoordinates.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_points.__begin_;
  if (v4)
  {
    self->_points.__end_ = v4;
    operator delete(v4);
  }
  objc_storeStrong((id *)&self->_matchedPathSegments, 0);
  objc_destroyWeak((id *)&self->_section);
  objc_destroyWeak((id *)&self->_overlay);
}

- (void)setStartDistance:(double)a3
{
  self->_startDistance = a3;
}

- (double)startDistance
{
  return self->_startDistance;
}

- (NSArray)matchedPathSegments
{
  return self->_matchedPathSegments;
}

- (GEOComposedRouteSection)section
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_section);
  return (GEOComposedRouteSection *)WeakRetained;
}

- (void)setRouteEnd:(PolylineCoordinate)a3
{
  self->_routeEnd = a3;
}

- (PolylineCoordinate)routeEnd
{
  return self->_routeEnd;
}

- (void)setRouteStart:(PolylineCoordinate)a3
{
  self->_routeStart = a3;
}

- (PolylineCoordinate)routeStart
{
  return self->_routeStart;
}

- (id)description
{
  if (self->_matchedPathSegments) {
    v2 = "yes";
  }
  else {
    v2 = "no";
  }
  return (id)[NSString stringWithFormat:@"<VKPolylinePath %p>: %f - %f, snappedPath:%s", self, (float)(self->_routeStart.offset + (float)self->_routeStart.index), (float)(self->_routeEnd.offset + (float)self->_routeEnd.index), v2];
}

- (Matrix<float,)convertCoordinateToTile:(id *)a3
{
  GEOMapPoint3DForCoordinate();
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_section);
  v11 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained bounds];
    double v12 = v25;
    double v13 = v24;
    double v15 = v27;
    double v14 = v26;
    double v16 = v29;
    double v17 = v28;
  }
  else
  {
    double v16 = 0.0;
    double v14 = 0.0;
    double v12 = 0.0;
    double v17 = 0.0;
    double v15 = 0.0;
    double v13 = 0.0;
  }
  float v18 = (v5 - v13) / v15;
  float v19 = (v17 - v7 + v12) / v17;
  float v20 = (v9 - v14) / v16;

  float v21 = v18;
  float v22 = v19;
  float v23 = v20;
  result._e[2] = v23;
  result._e[1] = v22;
  result._e[0] = v21;
  return result;
}

- (BOOL)isMapMatched
{
  return self->_matchedPathSegments != 0;
}

- (BOOL)hasCompletedMapMatching
{
  return self->_matchedPathSegments != 0;
}

- (float)laneHalfWidthAtIndex:(unsigned int)a3
{
  return 1.85;
}

- (const)polylineCoordinates
{
  return &self->_polylineCoordinates;
}

- (void)points
{
  return self->_points.__begin_;
}

- (unsigned)pointCount
{
  return -1431655765 * ((unint64_t)((char *)self->_points.__end_ - (char *)self->_points.__begin_) >> 2);
}

- (const)gradientTrafficAtIndex:(unsigned int)a3
{
  return &self->_gradientTraffic;
}

- (VKPolylinePath)initWithOverlay:(id)a3 section:(id)a4 routeStartIndex:(unsigned int)a5 routeEndIndex:(unsigned int)a6 matchedPathSegments:(id)a7 elevationSource:(void *)a8 elevationSourceContext:(void *)a9
{
  uint64_t v219 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  v186 = v14;
  double v17 = [(VKPolylinePath *)self initWithOverlay:v14 section:v15 matchedPathSegments:v16];
  float v18 = v17;
  if (!v17) {
    goto LABEL_175;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&v17->_section);
  float v20 = [WeakRetained composedRouteSegment];

  v184 = v20;
  v185 = [v20 composedRoute];
  v18->_routeStart.index = a5;
  v18->_routeStart.offset = 0.0;
  v18->_routeEnd.index = a6;
  v18->_routeEnd.offset = 0.0;
  v197 = v15;
  id v198 = v16;
  if (v16)
  {
    long long v215 = 0u;
    long long v216 = 0u;
    long long v213 = 0u;
    long long v214 = 0u;
    id v21 = v16;
    unint64_t v22 = 0;
    uint64_t v23 = [v21 countByEnumeratingWithState:&v213 objects:v218 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v214;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v214 != v24) {
            objc_enumerationMutation(v21);
          }
          v22 += [*(id *)(*((void *)&v213 + 1) + 8 * i) pointCount];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v213 objects:v218 count:16];
      }
      while (v23);
    }

    begin = (char *)v18->_points.__begin_;
    if (0xAAAAAAAAAAAAAAABLL * (((char *)v18->_points.__end_cap_.__value_ - (char *)begin) >> 2) < v22)
    {
      if (v22 > 0x1555555555555555) {
        goto LABEL_181;
      }
      end = (char *)v18->_points.__end_;
      double v28 = (char *)operator new(12 * v22);
      double v29 = &v28[12 * ((end - begin) / 12)];
      v30 = v29;
      if (end != begin)
      {
        v30 = &v28[12 * ((end - begin) / 12)];
        do
        {
          uint64_t v31 = *(void *)(end - 12);
          end -= 12;
          int v32 = *((_DWORD *)end + 2);
          *(void *)(v30 - 12) = v31;
          v30 -= 12;
          *((_DWORD *)v30 + 2) = v32;
        }
        while (end != begin);
      }
      v18->_points.__begin_ = v30;
      v18->_points.__end_ = v29;
      v18->_points.__end_cap_.__value_ = &v28[12 * v22];
      if (begin) {
        operator delete(begin);
      }
    }
    v33 = (char *)v18->_polylineCoordinates.__begin_;
    if (v22 <= ((char *)v18->_polylineCoordinates.__end_cap_.__value_ - v33) >> 3)
    {
LABEL_39:
      long long v211 = 0u;
      long long v212 = 0u;
      long long v209 = 0u;
      long long v210 = 0u;
      id obj = v21;
      uint64_t v61 = [obj countByEnumeratingWithState:&v209 objects:v217 count:16];
      if (!v61) {
        goto LABEL_105;
      }
      uint64_t v188 = *(void *)v210;
      if (a8) {
        BOOL v62 = a9 == 0;
      }
      else {
        BOOL v62 = 1;
      }
      int v63 = !v62;
      int v193 = v63;
      while (1)
      {
        uint64_t v189 = 0;
        uint64_t v195 = v61;
        do
        {
          if (*(void *)v210 != v188) {
            objc_enumerationMutation(obj);
          }
          unint64_t v64 = 0;
          v65 = *(void **)(*((void *)&v209 + 1) + 8 * v189);
          while (v64 < [v65 pointCount])
          {
            [v65 locationCoordinateAt:v64];
            uint64_t v68 = v67;
            uint64_t v70 = v69;
            uint64_t v72 = v71;
            GEOMapPoint3DForCoordinate();
            double v74 = v73;
            double v76 = v75;
            double v78 = v77;
            if (v15)
            {
              [v15 bounds];
              double v80 = *((double *)&v206 + 1);
              double v79 = *(double *)&v206;
              double v82 = *((double *)&v207 + 1);
              double v81 = *(double *)&v207;
              double v83 = *((double *)&v208 + 1);
              double v84 = *(double *)&v208;
            }
            else
            {
              long long v207 = 0u;
              long long v208 = 0u;
              double v83 = 0.0;
              double v81 = 0.0;
              double v80 = 0.0;
              double v84 = 0.0;
              long long v206 = 0u;
              double v82 = 0.0;
              double v79 = 0.0;
            }
            float v85 = (v78 - v81) / v83;
            if (v193)
            {
              double v191 = v82;
              double v192 = v74;
              double v86 = v76;
              double v87 = v84;
              double v88 = v79;
              v205[0] = v68;
              v205[1] = v70;
              v205[2] = v72;
              uint64_t v89 = (*(uint64_t (**)(void *, void *, void *))(*(void *)a8 + 16))(a8, v205, a9);
              if ((v89 & 0xFF00000000) != 0) {
                float v85 = *(float *)&v89;
              }
              double v79 = v88;
              double v84 = v87;
              double v76 = v86;
              double v82 = v191;
              double v74 = v192;
            }
            float v90 = (v74 - v79) / v82;
            float v91 = (v84 - v76 + v80) / v84;
            v93 = (float *)v18->_points.__end_;
            unint64_t value = (unint64_t)v18->_points.__end_cap_.__value_;
            if ((unint64_t)v93 >= value)
            {
              v95 = (float *)v18->_points.__begin_;
              unint64_t v96 = 0xAAAAAAAAAAAAAAABLL * (v93 - v95) + 1;
              if (v96 > 0x1555555555555555) {
                abort();
              }
              unint64_t v97 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(value - (void)v95) >> 2);
              if (2 * v97 > v96) {
                unint64_t v96 = 2 * v97;
              }
              if (v97 >= 0xAAAAAAAAAAAAAAALL) {
                unint64_t v98 = 0x1555555555555555;
              }
              else {
                unint64_t v98 = v96;
              }
              if (v98)
              {
                if (v98 > 0x1555555555555555) {
                  goto LABEL_176;
                }
                v99 = (char *)operator new(12 * v98);
              }
              else
              {
                v99 = 0;
              }
              v100 = (float *)&v99[4 * (v93 - v95)];
              float *v100 = v90;
              v100[1] = v91;
              v100[2] = v85;
              v101 = v100;
              if (v93 != v95)
              {
                do
                {
                  uint64_t v102 = *(void *)(v93 - 3);
                  v93 -= 3;
                  int v103 = *((_DWORD *)v93 + 2);
                  *(void *)(v101 - 3) = v102;
                  v101 -= 3;
                  *((_DWORD *)v101 + 2) = v103;
                }
                while (v93 != v95);
                v93 = (float *)v18->_points.__begin_;
              }
              v94 = v100 + 3;
              v18->_points.__begin_ = v101;
              v18->_points.__end_ = v100 + 3;
              v18->_points.__end_cap_.__value_ = &v99[12 * v98];
              if (v93) {
                operator delete(v93);
              }
            }
            else
            {
              float *v93 = v90;
              v93[1] = v91;
              v94 = v93 + 3;
              v93[2] = v85;
            }
            v18->_points.__end_ = v94;
            unint64_t v104 = [v65 routeCoordinateAt:v64];
            int v105 = v104;
            unint64_t v106 = HIDWORD(v104);
            float v107 = *((float *)&v104 + 1);
            v109 = (float *)v18->_polylineCoordinates.__end_;
            unint64_t v108 = (unint64_t)v18->_polylineCoordinates.__end_cap_.__value_;
            if ((unint64_t)v109 < v108)
            {
              *(void *)v109 = v104;
              if (*((float *)&v104 + 1) >= 1.0)
              {
                *(_DWORD *)v109 = vcvtms_u32_f32(*((float *)&v104 + 1)) + v104;
                v109[1] = *((float *)&v104 + 1) - floorf(*((float *)&v104 + 1));
              }
              v66 = (PolylineCoordinate *)(v109 + 2);
              id v15 = v197;
              id v16 = v198;
              uint64_t v61 = v195;
              goto LABEL_53;
            }
            v110 = (float *)v18->_polylineCoordinates.__begin_;
            uint64_t v111 = ((char *)v109 - (char *)v110) >> 3;
            unint64_t v112 = v111 + 1;
            if ((unint64_t)(v111 + 1) >> 61) {
              abort();
            }
            uint64_t v113 = v108 - (void)v110;
            if (v113 >> 2 > v112) {
              unint64_t v112 = v113 >> 2;
            }
            if ((unint64_t)v113 >= 0x7FFFFFFFFFFFFFF8) {
              unint64_t v114 = 0x1FFFFFFFFFFFFFFFLL;
            }
            else {
              unint64_t v114 = v112;
            }
            if (v114 >> 61) {
              goto LABEL_176;
            }
            v115 = (char *)operator new(8 * v114);
            v116 = (float *)&v115[8 * v111];
            *(_DWORD *)v116 = v105;
            *((_DWORD *)v116 + 1) = v106;
            if (v107 >= 1.0)
            {
              *(_DWORD *)v116 = vcvtms_u32_f32(v107) + v105;
              v116[1] = v107 - floorf(v107);
            }
            if (v109 != v110)
            {
              unint64_t v117 = (char *)(v109 - 2) - (char *)v110;
              if (v117 < 0x58)
              {
                v118 = (float *)&v115[8 * v111];
                goto LABEL_99;
              }
              v118 = (float *)&v115[8 * v111];
              if ((unint64_t)((char *)v110 - v115) < 0x20) {
                goto LABEL_184;
              }
              uint64_t v119 = (v117 >> 3) + 1;
              v120 = &v115[8 * v111 - 16];
              v121 = v109 - 4;
              uint64_t v122 = v119 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v123 = *(_OWORD *)v121;
                *((_OWORD *)v120 - 1) = *((_OWORD *)v121 - 1);
                *(_OWORD *)v120 = v123;
                v120 -= 32;
                v121 -= 8;
                v122 -= 4;
              }
              while (v122);
              v118 = &v116[-2 * (v119 & 0x3FFFFFFFFFFFFFFCLL)];
              v109 -= 2 * (v119 & 0x3FFFFFFFFFFFFFFCLL);
              if (v119 != (v119 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_184:
                do
                {
LABEL_99:
                  uint64_t v124 = *((void *)v109 - 1);
                  v109 -= 2;
                  *((void *)v118 - 1) = v124;
                  v118 -= 2;
                }
                while (v109 != v110);
              }
              v109 = v110;
              id v15 = v197;
              goto LABEL_101;
            }
            v118 = (float *)&v115[8 * v111];
            id v15 = v197;
LABEL_101:
            v66 = (PolylineCoordinate *)(v116 + 2);
            v18->_polylineCoordinates.__begin_ = (PolylineCoordinate *)v118;
            v18->_polylineCoordinates.__end_ = (PolylineCoordinate *)(v116 + 2);
            v18->_polylineCoordinates.__end_cap_.__value_ = (PolylineCoordinate *)&v115[8 * v114];
            uint64_t v61 = v195;
            if (v109) {
              operator delete(v109);
            }
            id v16 = v198;
LABEL_53:
            v18->_polylineCoordinates.__end_ = v66;
            ++v64;
          }
          ++v189;
        }
        while (v189 != v61);
        uint64_t v61 = [obj countByEnumeratingWithState:&v209 objects:v217 count:16];
        if (!v61)
        {
LABEL_105:

          goto LABEL_174;
        }
      }
    }
    if (!(v22 >> 61))
    {
      v34 = v18->_polylineCoordinates.__end_;
      v35 = (char *)operator new(8 * v22);
      uint64_t v36 = (char *)v34 - v33;
      v37 = (PolylineCoordinate *)&v35[((char *)v34 - v33) & 0xFFFFFFFFFFFFFFF8];
      v38 = (char *)v37;
      if (v34 == (PolylineCoordinate *)v33) {
        goto LABEL_37;
      }
      if ((unint64_t)(v36 - 8) >= 0x58)
      {
        v38 = &v35[((char *)v34 - v33) & 0xFFFFFFFFFFFFFFF8];
        if ((char *)v34 - v35 - (v36 & 0xFFFFFFFFFFFFFFF8) >= 0x20)
        {
          uint64_t v54 = v36 >> 3;
          unint64_t v55 = ((unint64_t)(v36 - 8) >> 3) + 1;
          v56 = &v35[8 * v54 - 16];
          v57 = v34 - 2;
          uint64_t v58 = v55 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v59 = *(_OWORD *)&v57->index;
            *((_OWORD *)v56 - 1) = *(_OWORD *)&v57[-2].index;
            *(_OWORD *)v56 = v59;
            v56 -= 32;
            v57 -= 4;
            v58 -= 4;
          }
          while (v58);
          v38 = (char *)&v37[-(v55 & 0x3FFFFFFFFFFFFFFCLL)];
          v34 -= v55 & 0x3FFFFFFFFFFFFFFCLL;
          if (v55 == (v55 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_37:
            v18->_polylineCoordinates.__begin_ = (PolylineCoordinate *)v38;
            v18->_polylineCoordinates.__end_ = v37;
            v18->_polylineCoordinates.__end_cap_.__value_ = (PolylineCoordinate *)&v35[8 * v22];
            if (v33) {
              operator delete(v33);
            }
            goto LABEL_39;
          }
        }
      }
      else
      {
        v38 = &v35[((char *)v34 - v33) & 0xFFFFFFFFFFFFFFF8];
      }
      do
      {
        PolylineCoordinate v60 = v34[-1];
        --v34;
        *((PolylineCoordinate *)v38 - 1) = v60;
        v38 -= 8;
      }
      while (v34 != (PolylineCoordinate *)v33);
      goto LABEL_37;
    }
LABEL_181:
    abort();
  }
  int v39 = [v15 startPointIndex];
  unint64_t v40 = a6 - a5 + 1;
  v41 = (char *)v18->_points.__begin_;
  if (0xAAAAAAAAAAAAAAABLL * (((char *)v18->_points.__end_cap_.__value_ - (char *)v41) >> 2) < v40)
  {
    v42 = (char *)v18->_points.__end_;
    v43 = (char *)operator new(12 * v40);
    v44 = &v43[12 * ((v42 - v41) / 12)];
    v45 = v44;
    if (v42 != v41)
    {
      v45 = &v43[12 * ((v42 - v41) / 12)];
      do
      {
        uint64_t v46 = *(void *)(v42 - 12);
        v42 -= 12;
        int v47 = *((_DWORD *)v42 + 2);
        *(void *)(v45 - 12) = v46;
        v45 -= 12;
        *((_DWORD *)v45 + 2) = v47;
      }
      while (v42 != v41);
    }
    v18->_points.__begin_ = v45;
    v18->_points.__end_ = v44;
    v18->_points.__end_cap_.__value_ = &v43[12 * v40];
    if (v41) {
      operator delete(v41);
    }
  }
  v48 = v18->_polylineCoordinates.__begin_;
  if (v40 > v18->_polylineCoordinates.__end_cap_.__value_ - v48)
  {
    v49 = v18->_polylineCoordinates.__end_;
    v50 = (char *)operator new(8 * v40);
    uint64_t v51 = (char *)v49 - (char *)v48;
    v52 = (PolylineCoordinate *)&v50[((char *)v49 - (char *)v48) & 0xFFFFFFFFFFFFFFF8];
    v53 = (char *)v52;
    if (v49 == v48) {
      goto LABEL_111;
    }
    if ((unint64_t)(v51 - 8) >= 0x58)
    {
      v53 = &v50[((char *)v49 - (char *)v48) & 0xFFFFFFFFFFFFFFF8];
      if ((char *)v49 - v50 - (v51 & 0xFFFFFFFFFFFFFFF8) >= 0x20)
      {
        uint64_t v125 = v51 >> 3;
        unint64_t v126 = ((unint64_t)(v51 - 8) >> 3) + 1;
        v127 = &v50[8 * v125 - 16];
        v128 = v49 - 2;
        uint64_t v129 = v126 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v130 = *(_OWORD *)&v128->index;
          *((_OWORD *)v127 - 1) = *(_OWORD *)&v128[-2].index;
          *(_OWORD *)v127 = v130;
          v127 -= 32;
          v128 -= 4;
          v129 -= 4;
        }
        while (v129);
        v53 = (char *)&v52[-(v126 & 0x3FFFFFFFFFFFFFFCLL)];
        v49 -= v126 & 0x3FFFFFFFFFFFFFFCLL;
        if (v126 == (v126 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_111:
          v18->_polylineCoordinates.__begin_ = (PolylineCoordinate *)v53;
          v18->_polylineCoordinates.__end_ = v52;
          v18->_polylineCoordinates.__end_cap_.__value_ = (PolylineCoordinate *)&v50[8 * v40];
          if (v48) {
            operator delete(v48);
          }
          goto LABEL_113;
        }
      }
    }
    else
    {
      v53 = &v50[((char *)v49 - (char *)v48) & 0xFFFFFFFFFFFFFFF8];
    }
    do
    {
      PolylineCoordinate v131 = v49[-1];
      --v49;
      *((PolylineCoordinate *)v53 - 1) = v131;
      v53 -= 8;
    }
    while (v49 != v48);
    goto LABEL_111;
  }
LABEL_113:
  unsigned int v196 = a5;
  if (v40)
  {
    uint64_t v132 = 0;
    int v133 = a5 - v39;
    if (a8) {
      BOOL v134 = a9 == 0;
    }
    else {
      BOOL v134 = 1;
    }
    int v135 = !v134;
    int v194 = v135;
    while (1)
    {
      uint64_t v138 = [v15 points] + 12 * (v133 + v132);
      int v140 = *(_DWORD *)v138;
      int v139 = *(_DWORD *)(v138 + 4);
      float v141 = *(float *)(v138 + 8);
      if (v194)
      {
        id v15 = v197;
        if (v197)
        {
          [v197 bounds];
        }
        else
        {
          long long v203 = 0u;
          long long v204 = 0u;
          long long v202 = 0u;
        }
        id v16 = 0;
        GEOCoordinate3DForMapPoint();
        double v143 = v142;
        v201[0] = v144;
        v201[1] = v145;
        *(double *)&v201[2] = v142;
        uint64_t v146 = (*(uint64_t (**)(void *, void *, void *))(*(void *)a8 + 16))(a8, v201, a9);
        float v147 = (v146 & 0xFF00000000) != 0 ? *(float *)&v146 : v143;
        if (v197)
        {
          [v197 bounds];
          double v148 = v200;
          [v197 bounds];
          double v149 = v199;
        }
        else
        {
          double v149 = 0.0;
          double v148 = 0.0;
        }
        float v141 = (v147 - v148) / v149;
      }
      else
      {
        id v15 = v197;
        id v16 = 0;
      }
      v151 = v18->_points.__end_;
      unint64_t v150 = (unint64_t)v18->_points.__end_cap_.__value_;
      if ((unint64_t)v151 >= v150)
      {
        v153 = v18->_points.__begin_;
        unint64_t v154 = 0xAAAAAAAAAAAAAAABLL * (v151 - v153) + 1;
        if (v154 > 0x1555555555555555) {
          abort();
        }
        unint64_t v155 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v150 - (void)v153) >> 2);
        if (2 * v155 > v154) {
          unint64_t v154 = 2 * v155;
        }
        unint64_t v156 = v155 >= 0xAAAAAAAAAAAAAAALL ? 0x1555555555555555 : v154;
        if (v156)
        {
          if (v156 > 0x1555555555555555) {
            goto LABEL_176;
          }
          v157 = (char *)operator new(12 * v156);
        }
        else
        {
          v157 = 0;
        }
        v158 = &v157[4 * (v151 - v153)];
        *(_DWORD *)v158 = v140;
        *((_DWORD *)v158 + 1) = v139;
        *((float *)v158 + 2) = v141;
        v159 = v158;
        if (v151 != v153)
        {
          do
          {
            uint64_t v160 = *(void *)(v151 - 3);
            v151 -= 3;
            int v161 = v151[2];
            *(void *)(v159 - 12) = v160;
            v159 -= 12;
            *((_DWORD *)v159 + 2) = v161;
          }
          while (v151 != v153);
          v151 = v18->_points.__begin_;
        }
        v152 = v158 + 12;
        v18->_points.__begin_ = v159;
        v18->_points.__end_ = v158 + 12;
        v18->_points.__end_cap_.__value_ = &v157[12 * v156];
        id v16 = 0;
        if (v151) {
          operator delete(v151);
        }
        id v15 = v197;
      }
      else
      {
        _DWORD *v151 = v140;
        v151[1] = v139;
        v152 = v151 + 3;
        *((float *)v151 + 2) = v141;
      }
      v18->_points.__end_ = v152;
      unsigned int v162 = v132 + v196;
      v164 = (char *)v18->_polylineCoordinates.__end_;
      unint64_t v163 = (unint64_t)v18->_polylineCoordinates.__end_cap_.__value_;
      if ((unint64_t)v164 >= v163) {
        break;
      }
      *(_DWORD *)v164 = v162;
      *((_DWORD *)v164 + 1) = 0;
      v136 = (PolylineCoordinate *)(v164 + 8);
      unint64_t v137 = v40;
LABEL_122:
      v18->_polylineCoordinates.__end_ = v136;
      if (++v132 == v137) {
        goto LABEL_174;
      }
    }
    v165 = (char *)v18->_polylineCoordinates.__begin_;
    uint64_t v166 = (v164 - v165) >> 3;
    unint64_t v167 = v166 + 1;
    if ((unint64_t)(v166 + 1) >> 61) {
      abort();
    }
    uint64_t v168 = v163 - (void)v165;
    if (v168 >> 2 > v167) {
      unint64_t v167 = v168 >> 2;
    }
    if ((unint64_t)v168 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v169 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v169 = v167;
    }
    if (v169 >> 61) {
LABEL_176:
    }
      std::__throw_bad_array_new_length[abi:nn180100]();
    v170 = operator new(8 * v169);
    v171 = (PolylineCoordinate *)&v170[8 * v166];
    v171->index = v162;
    v171->offset = 0.0;
    int64_t v172 = v164 - v165;
    if (v164 == v165)
    {
      v165 = v164;
      v174 = (PolylineCoordinate *)&v170[8 * v166];
      unint64_t v137 = v40;
    }
    else
    {
      unint64_t v173 = v172 - 8;
      unint64_t v137 = v40;
      if ((unint64_t)(v172 - 8) < 0x58)
      {
        v174 = (PolylineCoordinate *)&v170[8 * v166];
        goto LABEL_169;
      }
      v174 = (PolylineCoordinate *)&v170[8 * v166];
      if ((unint64_t)(v165 - v170) < 0x20) {
        goto LABEL_185;
      }
      uint64_t v175 = (v173 >> 3) + 1;
      v176 = &v170[8 * v166 - 16];
      v177 = v164 - 16;
      uint64_t v178 = v175 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v179 = *(_OWORD *)v177;
        *(v176 - 1) = *((_OWORD *)v177 - 1);
        _OWORD *v176 = v179;
        v176 -= 2;
        v177 -= 32;
        v178 -= 4;
      }
      while (v178);
      v174 = &v171[-(v175 & 0x3FFFFFFFFFFFFFFCLL)];
      v164 -= 8 * (v175 & 0x3FFFFFFFFFFFFFFCLL);
      if (v175 != (v175 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_185:
        do
        {
LABEL_169:
          PolylineCoordinate v180 = (PolylineCoordinate)*((void *)v164 - 1);
          v164 -= 8;
          v174[-1] = v180;
          --v174;
        }
        while (v164 != v165);
        v165 = (char *)v18->_polylineCoordinates.__begin_;
      }
    }
    v136 = v171 + 1;
    v18->_polylineCoordinates.__begin_ = v174;
    v18->_polylineCoordinates.__end_ = v171 + 1;
    v18->_polylineCoordinates.__end_cap_.__value_ = (PolylineCoordinate *)&v170[8 * v169];
    if (v165) {
      operator delete(v165);
    }
    id v15 = v197;
    id v16 = 0;
    goto LABEL_122;
  }
LABEL_174:
  [v15 lengthScaleFactor];
  v18->_sectionLengthScaleFactor = v181;
  [v185 stepDistanceFromPoint:0 toPoint:*(void *)&v18->_routeStart];
  v18->_startDistance = v182;

LABEL_175:
  return v18;
}

- (VKPolylinePath)initWithOverlay:(id)a3 section:(id)a4 matchedPathSegments:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)VKPolylinePath;
  v11 = [(VKPolylinePath *)&v14 init];
  double v12 = v11;
  if (v11)
  {
    v11->_gradientTraffic.blend = 0.0;
    *(_WORD *)&v11->_gradientTraffic.start = 771;
    objc_storeWeak((id *)&v11->_overlay, v8);
    objc_storeWeak((id *)&v12->_section, v9);
    v12->_startDistance = -1.0;
    objc_storeStrong((id *)&v12->_matchedPathSegments, a5);
  }

  return v12;
}

@end