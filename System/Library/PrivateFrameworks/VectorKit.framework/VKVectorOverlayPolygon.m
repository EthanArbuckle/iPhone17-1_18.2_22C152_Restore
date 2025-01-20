@interface VKVectorOverlayPolygon
- (Range<signed)worldIndexes;
- (VKVectorOverlayPolygon)initWithMapPoints:(id *)a3 count:(unint64_t)a4;
- (id).cxx_construct;
- (shared_ptr<geo::Polygon2<double>>)simplifiedGeometryAtZoomLevel:(unsigned __int8)a3;
@end

@implementation VKVectorOverlayPolygon

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 4) = 0;
  *((_DWORD *)self + 10) = 0;
  return self;
}

- (void).cxx_destruct
{
  value = self->_simplifiedGeometryCache.__ptr_.__value_;
  self->_simplifiedGeometryCache.__ptr_.__value_ = 0;
  if (value)
  {
    v4 = geo::Cache<unsigned long,std::shared_ptr<md::LabelIcon>,std::hash<unsigned long>,geo::LRUPolicy>::~Cache(value);
    MEMORY[0x1A6239270](v4, 0x10A0C407D9D2971);
  }
  cntrl = self->_geometry.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (Range<signed)worldIndexes
{
  return self->_worldIndexes;
}

- (shared_ptr<geo::Polygon2<double>>)simplifiedGeometryAtZoomLevel:(unsigned __int8)a3
{
  unsigned int v4 = a3;
  v5 = self;
  v6 = v3;
  unsigned __int8 v210 = a3;
  p_simplifiedGeometryCacheLock = &self->_simplifiedGeometryCacheLock;
  os_unfair_lock_lock(&self->_simplifiedGeometryCacheLock._lock);
  value = v5->_simplifiedGeometryCache.__ptr_.__value_;
  v9 = value + 6;
  unint64_t v10 = value[2];
  if (v10)
  {
    uint8x8_t v11 = (uint8x8_t)vcnt_s8((int8x8_t)v10);
    v11.i16[0] = vaddlv_u8(v11);
    if (v11.u32[0] > 1uLL)
    {
      unint64_t v12 = v4;
      if (v10 <= v4) {
        unint64_t v12 = v4 % v10;
      }
    }
    else
    {
      unint64_t v12 = (v10 - 1) & v4;
    }
    v13 = *(uint64_t ****)(value[1] + 8 * v12);
    if (v13)
    {
      v14 = *v13;
      if (v14)
      {
        if (v11.u32[0] < 2uLL)
        {
          unint64_t v15 = v10 - 1;
          while (1)
          {
            v17 = v14[1];
            if (v17 == (uint64_t *)v4)
            {
              if (*((unsigned __int8 *)v14 + 16) == v4) {
                goto LABEL_22;
              }
            }
            else if (((unint64_t)v17 & v15) != v12)
            {
              goto LABEL_25;
            }
            v14 = (uint64_t **)*v14;
            if (!v14) {
              goto LABEL_25;
            }
          }
        }
        do
        {
          unint64_t v16 = (unint64_t)v14[1];
          if (v16 == v4)
          {
            if (*((unsigned __int8 *)v14 + 16) == v4)
            {
LABEL_22:
              v9 = (uint64_t *)value[7];
              v18 = v14[3];
              if (v9 != v18)
              {
                v19 = (uint64_t *)v18[1];
                if (v19 != v9)
                {
                  uint64_t v20 = *v18;
                  *(void *)(v20 + 8) = v19;
                  *(void *)v18[1] = v20;
                  uint64_t v21 = *v9;
                  *(void *)(v21 + 8) = v18;
                  uint64_t *v18 = v21;
                  uint64_t *v9 = (uint64_t)v18;
                  v18[1] = (uint64_t)v9;
                  v9 = (uint64_t *)value[7];
                  value = v5->_simplifiedGeometryCache.__ptr_.__value_;
                }
              }
              break;
            }
          }
          else
          {
            if (v16 >= v10) {
              v16 %= v10;
            }
            if (v16 != v12) {
              break;
            }
          }
          v14 = (uint64_t **)*v14;
        }
        while (v14);
      }
    }
  }
LABEL_25:
  if (value + 6 != v9)
  {
    v22 = (atomic_ullong *)v9[4];
    *v6 = (void *)v9[3];
    v6[1] = v22;
    if (v22) {
      atomic_fetch_add_explicit(v22 + 1, 1uLL, memory_order_relaxed);
    }
    goto LABEL_289;
  }
  if (v4 <= 0x12) {
    double v23 = (double)(1 << (19 - v4)) / *MEMORY[0x1E4F63F10];
  }
  else {
    double v23 = 1.0e-10;
  }
  ptr = (char **)v5->_geometry.__ptr_;
  v25 = ptr[1];
  uint64_t v26 = v25 - *ptr;
  if (v25 == *ptr)
  {
    v27 = 0;
    v29 = 0;
    v28 = 0;
    v30 = ptr[1];
  }
  else
  {
    if (v26 < 0) {
      abort();
    }
    v27 = (char *)operator new(v25 - *ptr);
    v28 = &v27[16 * (v26 >> 4)];
    v29 = &v27[v26];
    v25 = *ptr;
    v30 = ptr[1];
  }
  unint64_t v31 = (v30 - v25) >> 4;
  if ((unint64_t)(v30 - v25) > 0x2F)
  {
    uint64_t v209 = 1;
    *(void *)v27 = *(void *)v25;
    *((void *)v27 + 1) = *((void *)v25 + 1);
    unint64_t v36 = v31 - 1;
    geo::dpSimplify<geo::Mercator2<double>>((uint64_t)v25, 0, v31 - 1, (uint64_t)v27, &v209, v23);
    v37 = &v25[16 * v36];
    uint64_t v38 = v209;
    unint64_t v31 = ++v209;
    v39 = &v27[16 * v38];
    *(void *)v39 = *(void *)v37;
    *((void *)v39 + 1) = *((void *)v37 + 1);
  }
  else
  {
    if (v30 != v25)
    {
      v32 = v27 + 8;
      v33 = (uint64_t *)(v25 + 8);
      unint64_t v34 = v31;
      do
      {
        *(v32 - 1) = *(v33 - 1);
        uint64_t v35 = *v33;
        v33 += 2;
        void *v32 = v35;
        v32 += 2;
        --v34;
      }
      while (v34);
    }
    uint64_t v209 = v31;
  }
  unint64_t v40 = (v29 - v27) >> 4;
  BOOL v41 = v31 >= v40;
  unint64_t v42 = v31 - v40;
  if (v31 <= v40)
  {
    v48 = &v27[16 * v31];
    if (v41) {
      v46 = v29;
    }
    else {
      v46 = v48;
    }
  }
  else if (v42 <= (v28 - v29) >> 4)
  {
    v46 = &v29[16 * v42];
  }
  else
  {
    if (v31 >> 60) {
      abort();
    }
    if ((v28 - v27) >> 3 > v31) {
      unint64_t v31 = (v28 - v27) >> 3;
    }
    if ((unint64_t)(v28 - v27) >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v43 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v43 = v31;
    }
    if (v43 >> 60) {
LABEL_291:
    }
      std::__throw_bad_array_new_length[abi:nn180100]();
    v44 = (char *)operator new(16 * v43);
    v45 = &v44[16 * v40];
    v28 = &v44[16 * v43];
    v46 = &v45[16 * v42];
    if (v29 != v27)
    {
      unint64_t v47 = (v29 - v27 - 16) & 0xFFFFFFFFFFFFFFF0;
      v45 = &v44[v29 - v27 - v47 - 16];
      memcpy(v45, &v29[-v47 - 16], v47 + 16);
    }
    if (v27) {
      operator delete(v27);
    }
    v27 = v45;
  }
  v49 = (std::__shared_weak_count *)operator new(0x30uLL);
  v50 = v49;
  v49->__shared_owners_ = 0;
  p_shared_owners = &v49->__shared_owners_;
  v49->__shared_weak_owners_ = 0;
  v49->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF582F98;
  v49[1].__vftable = (std::__shared_weak_count_vtbl *)v27;
  v49[1].__shared_owners_ = (uint64_t)v46;
  v49[1].__shared_weak_owners_ = (uint64_t)v28;
  uint64_t v203 = (uint64_t)&v49[1];
  v207 = &v49[1].__vftable;
  v208 = v49;
  uint64_t v52 = v46 - v27;
  v53 = v5->_geometry.__ptr_;
  if (v46 - v27 == v53[1] - *v53)
  {
    uint64_t v54 = (uint64_t)v5->_simplifiedGeometryCache.__ptr_.__value_;
    goto LABEL_61;
  }
  if ((unint64_t)v52 <= 0x2F)
  {
    uint64_t v54 = (uint64_t)v5->_simplifiedGeometryCache.__ptr_.__value_;
    goto LABEL_283;
  }
  v198 = &v49->__shared_owners_;
  v200 = v5;
  v201 = v6;
  v202 = p_simplifiedGeometryCacheLock;
  if (v52 < 0) {
    abort();
  }
  unint64_t v58 = v52 >> 4;
  v59 = (char *)operator new(24 * (v52 >> 4));
  v61 = (void *)v203;
  v62 = v59;
  v199 = v50;
  unint64_t v63 = v58 - 1;
  if (*(_OWORD *)v27 != *(_OWORD *)&v27[16 * v58 - 16]) {
    unint64_t v63 = v58;
  }
  unint64_t v204 = v63;
  if (v63)
  {
    uint64_t v64 = 0;
    v65 = &v59[24 * v58];
    unint64_t v66 = (unint64_t)v59;
    while (1)
    {
      v67 = (unint64_t *)(*v61 + 16 * v64);
      uint64_t v68 = v64 + 1;
      unint64_t v69 = (v64 + 1) % v58;
      v70 = (double *)(*v61 + 16 * v69);
      v60.n128_u64[0] = *v67;
      if (*(double *)v67 >= *v70)
      {
        if (*(double *)v67 == *v70)
        {
          v60.n128_u64[0] = v67[1];
          BOOL v71 = v60.n128_f64[0] < v70[1];
          if (v66 < (unint64_t)v65) {
            goto LABEL_80;
          }
        }
        else
        {
          BOOL v71 = 0;
          if (v66 < (unint64_t)v65)
          {
LABEL_80:
            *(void *)unint64_t v66 = v64;
            *(void *)(v66 + 8) = v69;
            v72 = (char *)(v66 + 24);
            *(unsigned char *)(v66 + 16) = v71;
            goto LABEL_100;
          }
        }
      }
      else
      {
        BOOL v71 = 1;
        if (v66 < (unint64_t)v65) {
          goto LABEL_80;
        }
      }
      unint64_t v73 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v66 - (void)v62) >> 3) + 1;
      if (v73 > 0xAAAAAAAAAAAAAAALL) {
        abort();
      }
      if (0x5555555555555556 * ((v65 - v62) >> 3) > v73) {
        unint64_t v73 = 0x5555555555555556 * ((v65 - v62) >> 3);
      }
      if (0xAAAAAAAAAAAAAAABLL * ((v65 - v62) >> 3) >= 0x555555555555555) {
        unint64_t v74 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v74 = v73;
      }
      if (v74 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_291;
      }
      v75 = (char *)operator new(24 * v74);
      v76 = &v75[8 * ((uint64_t)(v66 - (void)v62) >> 3)];
      *(void *)v76 = v64;
      *((void *)v76 + 1) = v69;
      v76[16] = v71;
      if ((char *)v66 == v62)
      {
        v78 = &v75[8 * ((uint64_t)(v66 - (void)v62) >> 3)];
      }
      else
      {
        v77 = &v75[8 * ((uint64_t)(v66 - (void)v62) >> 3)];
        do
        {
          __n128 v60 = *(__n128 *)(v66 - 24);
          v78 = v77 - 24;
          *(v77 - 8) = *(unsigned char *)(v66 - 8);
          *(__n128 *)(v77 - 24) = v60;
          v66 -= 24;
          v77 -= 24;
        }
        while ((char *)v66 != v62);
      }
      v65 = &v75[24 * v74];
      v72 = v76 + 24;
      if (v62) {
        operator delete(v62);
      }
      v62 = v78;
      v61 = (void *)v203;
LABEL_100:
      BOOL v79 = !v71;
      if (v72 < v65)
      {
        *(void *)v72 = v69;
        *((void *)v72 + 1) = v64;
        unint64_t v66 = (unint64_t)(v72 + 24);
        v72[16] = v79;
      }
      else
      {
        unint64_t v80 = 0xAAAAAAAAAAAAAAABLL * ((v72 - v62) >> 3) + 1;
        if (v80 > 0xAAAAAAAAAAAAAAALL) {
          abort();
        }
        if (0x5555555555555556 * ((v65 - v62) >> 3) > v80) {
          unint64_t v80 = 0x5555555555555556 * ((v65 - v62) >> 3);
        }
        if (0xAAAAAAAAAAAAAAABLL * ((v65 - v62) >> 3) >= 0x555555555555555) {
          unint64_t v81 = 0xAAAAAAAAAAAAAAALL;
        }
        else {
          unint64_t v81 = v80;
        }
        if (v81 > 0xAAAAAAAAAAAAAAALL) {
          goto LABEL_291;
        }
        v82 = (char *)operator new(24 * v81);
        v83 = &v82[8 * ((v72 - v62) >> 3)];
        *(void *)v83 = v69;
        *((void *)v83 + 1) = v64;
        v83[16] = v79;
        if (v72 == v62)
        {
          v85 = &v82[8 * ((v72 - v62) >> 3)];
        }
        else
        {
          v84 = &v82[8 * ((v72 - v62) >> 3)];
          do
          {
            __n128 v60 = *(__n128 *)(v72 - 24);
            v85 = v84 - 24;
            *(v84 - 8) = *(v72 - 8);
            *(__n128 *)(v84 - 24) = v60;
            v72 -= 24;
            v84 -= 24;
          }
          while (v72 != v62);
        }
        v65 = &v82[24 * v81];
        unint64_t v66 = (unint64_t)(v83 + 24);
        if (v62) {
          operator delete(v62);
        }
        v62 = v85;
      }
      uint64_t v64 = v68;
      if (v68 == v204) {
        goto LABEL_117;
      }
    }
  }
  unint64_t v66 = (unint64_t)v59;
LABEL_117:
  unint64_t v86 = 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v66 - (void)v62) >> 3));
  *(void *)&v215.f64[0] = v61;
  if ((char *)v66 == v62) {
    uint64_t v87 = 0;
  }
  else {
    uint64_t v87 = v86;
  }
  std::__introsort<std::_ClassicAlgPolicy,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::{lambda(BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo const&)#1} &,BOOL geo::Intersect::isSelfIntersecting<double>(std::vector<gm::Matrix<double,2,1>> const&,BOOL)::EventInfo*,false>(v62, v66, (uint64_t **)&v215, v87, 1, v60);
  v218 = 0;
  uint64_t v219 = 0;
  v217 = &v218;
  if ((char *)v66 == v62)
  {
    int v89 = 0;
    v50 = v199;
    goto LABEL_279;
  }
  v88 = v62;
  v50 = v199;
LABEL_125:
  if (!v88[16])
  {
    uint64_t v142 = 16 * *((void *)v88 + 1);
    float64x2_t v143 = vsubq_f64(*(float64x2_t *)(*v61 + 16 * *(void *)v88), *(float64x2_t *)(*v61 + v142));
    float64x2_t v215 = *(float64x2_t *)(*v61 + v142);
    float64x2_t v216 = v143;
    v144 = v218;
    if (!v218) {
      goto LABEL_124;
    }
    float64x2_t v145 = vaddq_f64(v215, v143);
    v146 = (uint64_t *)&v218;
    v147 = v218;
    while (1)
    {
      while (1)
      {
        v149 = (float64_t *)(v147 + 4);
        v150 = v146;
        if (v147[4] == *(void *)&v215.f64[0] && v147[5] == *(void *)&v215.f64[1])
        {
          float64x2_t v152 = *((float64x2_t *)v147 + 2);
          float64x2_t v153 = vaddq_f64(*((float64x2_t *)v147 + 3), v152);
          float64x2_t v220 = v145;
          float64x2_t v221 = v153;
          if (*(void *)&v153.f64[0] == *(void *)&v145.f64[0] && *(void *)&v153.f64[1] == *(void *)&v145.f64[1]) {
            goto LABEL_203;
          }
        }
        else
        {
          v152.f64[0] = *v149;
        }
        if (v152.f64[0] > v215.f64[0]) {
          break;
        }
        double v159 = *((double *)v147 + 5);
        double v158 = *((double *)v147 + 6);
        double v160 = *((double *)v147 + 7);
        double v161 = -(v160 * (v215.f64[0] - v152.f64[0]) - (v215.f64[1] - v159) * v158);
        if (v161 != 0.0)
        {
          if (v161 > 0.0) {
            goto LABEL_226;
          }
          goto LABEL_203;
        }
        if (v152.f64[0] == v158 + v152.f64[0])
        {
          if (v159 < v215.f64[1]) {
            goto LABEL_226;
          }
          goto LABEL_203;
        }
        if (-(v160 * (v215.f64[0] - v152.f64[0] + v143.f64[0]) - (v215.f64[1] - v159 + v143.f64[1]) * v158) <= 0.0) {
          goto LABEL_203;
        }
LABEL_226:
        int v148 = 1;
        v147 = (uint64_t *)v147[1];
        if (!v147)
        {
LABEL_227:
          if (v146 != (uint64_t *)&v218)
          {
            v162 = v148 ? (float64x2_t *)(v150 + 4) : (float64x2_t *)v149;
            if (!geo::Intersect::SHSegmentComparator<double>::operator()(&v215, v162))
            {
              if (v146 != (uint64_t *)v217)
              {
                uint64_t v163 = *v146;
                v164 = v146;
                if (*v146)
                {
                  do
                  {
                    uint64_t v165 = v163;
                    uint64_t v163 = *(void *)(v163 + 8);
                  }
                  while (v163);
                }
                else
                {
                  do
                  {
                    uint64_t v165 = v164[2];
                    BOOL v113 = *(void *)v165 == (void)v164;
                    v164 = (uint64_t *)v165;
                  }
                  while (v113);
                }
                v166 = (uint64_t *)v146[1];
                v167 = v146;
                if (v166)
                {
                  do
                  {
                    v168 = (uint64_t **)v166;
                    v166 = (uint64_t *)*v166;
                  }
                  while (v166);
                }
                else
                {
                  do
                  {
                    v168 = (uint64_t **)v167[2];
                    BOOL v113 = *v168 == v167;
                    v167 = (uint64_t *)v168;
                  }
                  while (!v113);
                }
                if (v168 != &v218)
                {
                  double v169 = *(double *)(v165 + 48);
                  double v170 = *(double *)(v165 + 56);
                  double v172 = *((double *)v168 + 6);
                  double v171 = *((double *)v168 + 7);
                  double v173 = -(v170 * v172 - v171 * v169);
                  if (v173 != 0.0)
                  {
                    double v174 = 1.0 / v173;
                    double v175 = *(double *)(v165 + 32) + v169;
                    double v176 = *((double *)v168 + 4);
                    double v177 = *((double *)v168 + 5);
                    double v178 = *(double *)(v165 + 40) + v170;
                    double v179 = -((v178 - v177) * v172 - (v175 - v176) * v171) * v174;
                    if (v179 >= 0.0 && v179 <= 1.0)
                    {
                      double v181 = -((v175 - v176) * v170 - (v178 - v177) * v169) * v174;
                      if (v181 >= 0.0
                        && v181 <= 1.0
                        && (*(uint64_t **)(v165 + 32) != v168[4] || *(void *)(v165 + 40) != (void)v168[5]))
                      {
                        double v184 = v176 + v172;
                        double v185 = v177 + v171;
                        v221.f64[0] = v184;
                        v221.f64[1] = v185;
                        uint64_t v187 = *(void *)(v165 + 32);
                        uint64_t v186 = *(void *)(v165 + 40);
                        if (v187 != *(void *)&v184 || v186 != *(void *)&v185)
                        {
                          v220.f64[0] = v175;
                          v220.f64[1] = v178;
                          v190 = v168[4];
                          v189 = v168[5];
                          if (*(uint64_t **)&v175 != v190 || *(void *)&v178 != (void)v189)
                          {
                            double v213 = v175;
                            double v214 = v178;
                            double v211 = v184;
                            double v212 = v185;
                            if (*(void *)&v175 != *(void *)&v184 || *(void *)&v178 != *(void *)&v185) {
                              goto LABEL_278;
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
              v193 = (uint64_t *)v146[1];
              v194 = v146;
              if (v193)
              {
                do
                {
                  v195 = (uint64_t **)v193;
                  v193 = (uint64_t *)*v193;
                }
                while (v193);
              }
              else
              {
                do
                {
                  v195 = (uint64_t **)v194[2];
                  BOOL v113 = *v195 == v194;
                  v194 = (uint64_t *)v195;
                }
                while (!v113);
              }
              if (v146 == (uint64_t *)v217) {
                v217 = v195;
              }
              --v219;
              std::__tree_remove[abi:nn180100]<std::__tree_node_base<void *> *>(v144, v146);
              operator delete(v146);
            }
          }
LABEL_124:
          v88 += 24;
          if (v88 == (char *)v66)
          {
            int v89 = 0;
            goto LABEL_279;
          }
          goto LABEL_125;
        }
      }
      double v155 = *((double *)v147 + 5) - v215.f64[1];
      double v156 = v152.f64[0] - v215.f64[0];
      double v157 = -(v156 * v143.f64[1] - v155 * v143.f64[0]);
      if (v157 == 0.0)
      {
        if (-((*((double *)v147 + 6) + v156) * v143.f64[1] - (*((double *)v147 + 7) + v155) * v143.f64[0]) > 0.0) {
          goto LABEL_203;
        }
        goto LABEL_226;
      }
      if (v157 < 0.0) {
        goto LABEL_226;
      }
LABEL_203:
      int v148 = 0;
      v146 = v147;
      v147 = (uint64_t *)*v147;
      if (!v147) {
        goto LABEL_227;
      }
    }
  }
  float64x2_t v90 = vsubq_f64(*(float64x2_t *)(*v61 + 16 * *((void *)v88 + 1)), *(float64x2_t *)(*v61 + 16 * *(void *)v88));
  float64x2_t v215 = *(float64x2_t *)(*v61 + 16 * *(void *)v88);
  float64x2_t v216 = v90;
  float64x2_t v205 = v90;
  v91 = &v218;
  v92 = &v218;
  if (v218)
  {
    v93 = (float64x2_t *)v218;
    while (1)
    {
      while (1)
      {
        v92 = (uint64_t **)v93;
        v94 = v93 + 2;
        if (!geo::Intersect::SHSegmentComparator<double>::operator()(&v215, v93 + 2)) {
          break;
        }
        v93 = (float64x2_t *)*v92;
        v91 = v92;
        if (!*v92) {
          goto LABEL_132;
        }
      }
      if (!geo::Intersect::SHSegmentComparator<double>::operator()(v94, &v215)) {
        break;
      }
      v91 = v92 + 1;
      v93 = (float64x2_t *)v92[1];
      if (!v93) {
        goto LABEL_132;
      }
    }
  }
  else
  {
LABEL_132:
    v95 = (uint64_t **)operator new(0x40uLL);
    float64x2_t v96 = v216;
    *((float64x2_t *)v95 + 2) = v215;
    *((float64x2_t *)v95 + 3) = v96;
    *v95 = 0;
    v95[1] = 0;
    v95[2] = (uint64_t *)v92;
    *v91 = (uint64_t *)v95;
    v97 = (uint64_t *)v95;
    if (*v217)
    {
      v217 = (uint64_t **)*v217;
      v97 = *v91;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(v218, v97);
    ++v219;
    if (v217 == v95) {
      goto LABEL_199;
    }
    v98 = *v95;
    v99 = v95;
    if (*v95)
    {
      do
      {
        v100 = v98;
        v98 = (uint64_t *)v98[1];
      }
      while (v98);
    }
    else
    {
      do
      {
        v100 = v99[2];
        BOOL v113 = *v100 == (void)v99;
        v99 = (uint64_t **)v100;
      }
      while (v113);
    }
    double v101 = *((double *)v100 + 6);
    double v102 = *((double *)v100 + 7);
    double v103 = -(v205.f64[1] * v101 - v102 * v205.f64[0]);
    if (v103 == 0.0) {
      goto LABEL_199;
    }
    double v104 = 1.0 / v103;
    double v105 = v215.f64[0] + v205.f64[0];
    double v106 = *((double *)v100 + 4);
    double v107 = *((double *)v100 + 5);
    double v108 = v215.f64[1] + v205.f64[1] - v107;
    double v109 = -(v108 * v101 - (v215.f64[0] + v205.f64[0] - v106) * v102) * v104;
    if (v109 < 0.0 || v109 > 1.0) {
      goto LABEL_199;
    }
    double v111 = -((v105 - v106) * v205.f64[1] - v108 * v205.f64[0]) * v104;
    if (v111 < 0.0 || v111 > 1.0) {
      goto LABEL_199;
    }
    BOOL v113 = v100[4] == *(void *)&v215.f64[0] && v100[5] == *(void *)&v215.f64[1];
    if (v113) {
      goto LABEL_199;
    }
    v221.f64[0] = v215.f64[0] + v205.f64[0];
    v221.f64[1] = v215.f64[1] + v205.f64[1];
    uint64_t v115 = v100[4];
    uint64_t v114 = v100[5];
    if (v115 == *(void *)&v105 && v114 == COERCE__INT64(v215.f64[1] + v205.f64[1])) {
      goto LABEL_199;
    }
    double v117 = v106 + v101;
    double v118 = v107 + v102;
    v220.f64[0] = v117;
    v220.f64[1] = v118;
    BOOL v119 = *(void *)&v117 == *(void *)&v215.f64[0] && *(void *)&v118 == *(void *)&v215.f64[1];
    if (v119
      || ((double v213 = v117,
           double v214 = v118,
           double v211 = v215.f64[0] + v205.f64[0],
           double v212 = v215.f64[1] + v205.f64[1],
           *(void *)&v117 == *(void *)&v105)
        ? (BOOL v120 = *(void *)&v118 == COERCE__INT64(v215.f64[1] + v205.f64[1]))
        : (BOOL v120 = 0),
          v120))
    {
LABEL_199:
      v121 = (double *)v95[1];
      if (v121)
      {
        do
        {
          v122 = v121;
          v121 = *(double **)v121;
        }
        while (v121);
      }
      else
      {
        do
        {
          v122 = (double *)v95[2];
          BOOL v113 = *(void *)v122 == (void)v95;
          v95 = (uint64_t **)v122;
        }
        while (!v113);
      }
      if (v122 == (double *)&v218) {
        goto LABEL_124;
      }
      double v123 = v122[6];
      double v124 = v122[7];
      double v125 = -(v205.f64[1] * v123 - v124 * v205.f64[0]);
      if (v125 == 0.0) {
        goto LABEL_124;
      }
      double v126 = v122[4];
      double v127 = v122[5];
      double v128 = v215.f64[0] + v205.f64[0] - v126;
      double v129 = v215.f64[1] + v205.f64[1] - v127;
      double v130 = -(v129 * v123 - v128 * v124) * (1.0 / v125);
      if (v130 < 0.0 || v130 > 1.0) {
        goto LABEL_124;
      }
      double v132 = -(v128 * v205.f64[1] - v129 * v205.f64[0]) * (1.0 / v125);
      if (v132 < 0.0 || v132 > 1.0) {
        goto LABEL_124;
      }
      if (*((void *)v122 + 4) == *(void *)&v215.f64[0] && *((void *)v122 + 5) == *(void *)&v215.f64[1]) {
        goto LABEL_124;
      }
      v221.f64[0] = v215.f64[0] + v205.f64[0];
      v221.f64[1] = v215.f64[1] + v205.f64[1];
      uint64_t v136 = *((void *)v122 + 4);
      uint64_t v135 = *((void *)v122 + 5);
      if (v136 == COERCE__INT64(v215.f64[0] + v205.f64[0]) && v135 == COERCE__INT64(v215.f64[1] + v205.f64[1])) {
        goto LABEL_124;
      }
      double v138 = v126 + v123;
      double v139 = v127 + v124;
      v220.f64[0] = v138;
      v220.f64[1] = v139;
      if (*(void *)&v138 == *(void *)&v215.f64[0] && *(void *)&v139 == *(void *)&v215.f64[1]) {
        goto LABEL_124;
      }
      double v213 = v138;
      double v214 = v139;
      double v211 = v215.f64[0] + v205.f64[0];
      double v212 = v215.f64[1] + v205.f64[1];
      if (*(void *)&v138 == COERCE__INT64(v215.f64[0] + v205.f64[0])
        && *(void *)&v139 == COERCE__INT64(v215.f64[1] + v205.f64[1]))
      {
        goto LABEL_124;
      }
    }
  }
LABEL_278:
  int v89 = 1;
LABEL_279:
  std::__tree<std::pair<md::MapTileData *,BOOL>>::destroy(v218);
  if (v62)
  {
    operator delete(v62);
    v5 = v200;
    v6 = v201;
    uint64_t v54 = (uint64_t)v200->_simplifiedGeometryCache.__ptr_.__value_;
    p_simplifiedGeometryCacheLock = v202;
    p_shared_owners = v198;
    if (v89)
    {
LABEL_281:
      v53 = v5->_geometry.__ptr_;
LABEL_61:
      cntrl = (std::__shared_weak_count *)v5->_geometry.__cntrl_;
      v206 = cntrl;
      if (cntrl) {
        atomic_fetch_add_explicit(&cntrl->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      geo::Cache<unsigned char,std::shared_ptr<geo::Polygon2<double>>,std::hash<unsigned char>,geo::LRUPolicy>::insert(v54, &v210, (uint64_t)v53, cntrl);
      if (v206 && !atomic_fetch_add(&v206->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v206->__on_zero_shared)(v206);
        std::__shared_weak_count::__release_weak(v206);
      }
      v56 = v5->_geometry.__cntrl_;
      *v6 = v5->_geometry.__ptr_;
      v6[1] = v56;
      if (!v56)
      {
        v57 = v208;
        if (!v208) {
          goto LABEL_289;
        }
LABEL_287:
        if (!atomic_fetch_add(&v57->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
          std::__shared_weak_count::__release_weak(v57);
        }
        goto LABEL_289;
      }
LABEL_286:
      atomic_fetch_add_explicit((atomic_ullong *volatile)v56 + 1, 1uLL, memory_order_relaxed);
      v57 = v208;
      if (!v208) {
        goto LABEL_289;
      }
      goto LABEL_287;
    }
  }
  else
  {
    v5 = v200;
    v6 = v201;
    uint64_t v54 = (uint64_t)v200->_simplifiedGeometryCache.__ptr_.__value_;
    p_simplifiedGeometryCacheLock = v202;
    p_shared_owners = v198;
    if (v89) {
      goto LABEL_281;
    }
  }
LABEL_283:
  atomic_fetch_add_explicit(&v50->__shared_owners_, 1uLL, memory_order_relaxed);
  geo::Cache<unsigned char,std::shared_ptr<geo::Polygon2<double>>,std::hash<unsigned char>,geo::LRUPolicy>::insert(v54, &v210, v203, v50);
  if (!atomic_fetch_add(p_shared_owners, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
    std::__shared_weak_count::__release_weak(v50);
  }
  v56 = (__shared_weak_count *)v208;
  *v6 = v207;
  v6[1] = v208;
  if (v208) {
    goto LABEL_286;
  }
LABEL_289:
  os_unfair_lock_unlock(&p_simplifiedGeometryCacheLock->_lock);
  result.__cntrl_ = v197;
  result.__ptr_ = v196;
  return result;
}

- (VKVectorOverlayPolygon)initWithMapPoints:(id *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    v5.receiver = self;
    v5.super_class = (Class)VKVectorOverlayPolygon;
    if ([(VKVectorOverlayPolygon *)&v5 init]) {
      operator new();
    }
    self = 0;
  }

  return 0;
}

@end