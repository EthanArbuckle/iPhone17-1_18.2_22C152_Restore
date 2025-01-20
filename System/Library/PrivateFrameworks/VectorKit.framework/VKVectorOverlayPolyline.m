@interface VKVectorOverlayPolyline
- (PolylineWithElevation)simplifiedGeometryAtZoomLevel:(SEL)a3;
- (Range<signed)worldIndexes;
- (VKVectorOverlayPolyline)initWithMapPoints:(id *)a3 elevations:(const double *)a4 count:(unint64_t)a5 needsElevationCorrection:(BOOL)a6;
- (id).cxx_construct;
@end

@implementation VKVectorOverlayPolyline

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  *((_DWORD *)self + 18) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

- (void).cxx_destruct
{
  value = self->_simplifiedGeometryCache.__ptr_.__value_;
  self->_simplifiedGeometryCache.__ptr_.__value_ = 0;
  if (value)
  {
    std::__list_imp<std::pair<unsigned char,PolylineWithElevation>>::clear(value + 6);
    v4 = (void *)value[3];
    if (v4)
    {
      do
      {
        v5 = (void *)*v4;
        operator delete(v4);
        v4 = v5;
      }
      while (v5);
    }
    v6 = (void *)value[1];
    value[1] = 0;
    if (v6) {
      operator delete(v6);
    }
    MEMORY[0x1A6239270](value, 0x10A0C407D9D2971);
  }
  begin = self->_elevations.__begin_;
  if (begin)
  {
    self->_elevations.__end_ = begin;
    operator delete(begin);
  }
  v8 = self->_points.__begin_;
  if (v8)
  {
    self->_points.__end_ = v8;
    operator delete(v8);
  }
}

- (Range<signed)worldIndexes
{
  return self->_worldIndexes;
}

- (PolylineWithElevation)simplifiedGeometryAtZoomLevel:(SEL)a3
{
  unsigned int v4 = a4;
  v153 = 0;
  v154 = 0;
  v151 = 0;
  v152 = 0;
  p_simplifiedGeometryCacheLock = &self->_simplifiedGeometryCacheLock;
  os_unfair_lock_lock(&self->_simplifiedGeometryCacheLock._lock);
  value = self->_simplifiedGeometryCache.__ptr_.__value_;
  v9 = value + 6;
  unint64_t v10 = v4;
  unint64_t v11 = value[2];
  if (v11)
  {
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)v11);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.u32[0] > 1uLL)
    {
      unint64_t v13 = v4;
      if (v11 <= v4) {
        unint64_t v13 = v4 % v11;
      }
    }
    else
    {
      unint64_t v13 = (v11 - 1) & v4;
    }
    v14 = *(uint64_t ****)(value[1] + 8 * v13);
    if (v14)
    {
      v15 = *v14;
      if (v15)
      {
        if (v12.u32[0] < 2uLL)
        {
          unint64_t v16 = v11 - 1;
          while (1)
          {
            v18 = v15[1];
            if (v18 == (uint64_t *)v4)
            {
              if (*((unsigned __int8 *)v15 + 16) == v4) {
                goto LABEL_22;
              }
            }
            else if (((unint64_t)v18 & v16) != v13)
            {
              goto LABEL_25;
            }
            v15 = (uint64_t **)*v15;
            if (!v15) {
              goto LABEL_25;
            }
          }
        }
        do
        {
          unint64_t v17 = (unint64_t)v15[1];
          if (v17 == v4)
          {
            if (*((unsigned __int8 *)v15 + 16) == v4)
            {
LABEL_22:
              v9 = (uint64_t *)value[7];
              v19 = v15[3];
              if (v9 != v19)
              {
                v20 = (uint64_t *)v19[1];
                if (v20 != v9)
                {
                  uint64_t v21 = *v19;
                  *(void *)(v21 + 8) = v20;
                  *(void *)v19[1] = v21;
                  uint64_t v22 = *v9;
                  *(void *)(v22 + 8) = v19;
                  uint64_t *v19 = v22;
                  uint64_t *v9 = (uint64_t)v19;
                  v19[1] = (uint64_t)v9;
                  v9 = (uint64_t *)value[7];
                  value = self->_simplifiedGeometryCache.__ptr_.__value_;
                }
              }
              break;
            }
          }
          else
          {
            if (v17 >= v11) {
              v17 %= v11;
            }
            if (v17 != v13) {
              break;
            }
          }
          v15 = (uint64_t **)*v15;
        }
        while (v15);
      }
    }
  }
LABEL_25:
  if (value + 6 != v9)
  {
    retstr->var0.var0 = (void *)v9[3];
    uint64_t v23 = v9[4];
    retstr->var0.var1 = (__shared_weak_count *)v23;
    if (v23) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v23 + 8), 1uLL, memory_order_relaxed);
    }
    retstr->var1.var0 = (void *)v9[5];
    uint64_t v24 = v9[6];
    retstr->var1.var1 = (__shared_weak_count *)v24;
    if (v24) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v24 + 8), 1uLL, memory_order_relaxed);
    }
    os_unfair_lock_unlock(&p_simplifiedGeometryCacheLock->_lock);
    goto LABEL_31;
  }
  if (v4 <= 0x12) {
    double v27 = (double)(1 << (19 - v4)) / *MEMORY[0x1E4F63F10];
  }
  else {
    double v27 = 1.0e-10;
  }
  v28 = (std::vector<std::pair<unsigned long, const char *>> *)operator new(0x30uLL);
  v29 = (atomic_ullong *)v28;
  v28->__end_ = 0;
  v28->__end_cap_.__value_ = 0;
  v28->__begin_ = (std::vector<std::pair<unsigned long, const char *>>::pointer)&unk_1EF58B230;
  v28[1].__begin_ = 0;
  v30 = v28 + 1;
  v28[1].__end_ = 0;
  v28[1].__end_cap_.__value_ = 0;
  v153 = v28 + 1;
  v154 = (std::__shared_weak_count *)v28;
  int64_t v31 = (char *)self->_points.__end_ - (char *)self->_points.__begin_;
  if (v31) {
    std::vector<geo::Mercator2<double>>::__append(v28 + 1, v31 >> 4);
  }
  begin = self->_elevations.__begin_;
  v147 = retstr;
  if (self->_elevations.__end_ == begin)
  {
    v41 = self->_points.__begin_;
    end = self->_points.__end_;
    unint64_t v42 = (end - (unsigned char *)v41) >> 4;
    p_first = &v30->__begin_->first;
    if ((unint64_t)(end - (unsigned char *)v41) > 0x2F)
    {
      unint64_t v150 = 1;
      void *p_first = *v41;
      p_first[1] = v41[1];
      unint64_t v63 = v42 - 1;
      geo::dpSimplify<geo::Mercator2<double>>((uint64_t)v41, 0, v63, (uint64_t)p_first, &v150, v27);
      v34 = 0;
      v35 = 0;
      v64 = &v41[2 * v63];
      uint64_t v65 = v150;
      unint64_t v42 = ++v150;
      v66 = &p_first[2 * v65];
      void *v66 = *v64;
      v66[1] = v64[1];
    }
    else
    {
      if (end != (unsigned char *)v41)
      {
        v44 = p_first + 1;
        v45 = v41 + 1;
        unint64_t v46 = v42;
        do
        {
          *(v44 - 1) = *(v45 - 1);
          uint64_t v47 = *v45;
          v45 += 2;
          void *v44 = v47;
          v44 += 2;
          --v46;
        }
        while (v46);
      }
      v34 = 0;
      v35 = 0;
      unint64_t v150 = v42;
    }
  }
  else
  {
    v33 = (std::__shared_weak_count *)operator new(0x30uLL);
    v34 = (atomic_ullong *)v33;
    v33->__shared_owners_ = 0;
    v33->__shared_weak_owners_ = 0;
    v33->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF58B348;
    v33[1].__vftable = 0;
    v35 = v33 + 1;
    v33[1].__shared_owners_ = 0;
    v33[1].__shared_weak_owners_ = 0;
    v151 = &v33[1].__vftable;
    v152 = v33;
    v36 = self->_points.__begin_;
    v37 = self->_points.__end_;
    v146 = p_simplifiedGeometryCacheLock;
    if (v37 == v36)
    {
      v38 = 0;
      v39 = self->_points.__end_;
    }
    else
    {
      std::vector<double>::__append((uint64_t)&v33[1], (v37 - v36) >> 4);
      begin = self->_elevations.__begin_;
      v36 = self->_points.__begin_;
      v37 = self->_points.__end_;
      v38 = v35->__vftable;
      v39 = v36;
    }
    uint64_t v48 = v37 - v36;
    unint64_t v42 = v48 >> 4;
    v49 = &v30->__begin_->first;
    v145 = v30;
    if ((unint64_t)v48 > 0x2F)
    {
      void *v49 = *v39;
      v49[1] = v39[1];
      v54 = *(void (__cdecl **)(std::__shared_weak_count *__hidden))begin;
      unint64_t v150 = 1;
      v38->~__shared_weak_count = v54;
      unint64_t v55 = v42 - 1;
      v56 = v38;
      geo::dpSimplify<geo::Mercator2<double>>((uint64_t)v39, (uint64_t)begin, 0, v55, (uint64_t)v49, (uint64_t)v38, (uint64_t *)&v150, v27);
      v57 = &v39[2 * v55];
      uint64_t v58 = v150;
      v59 = &v49[2 * v150];
      void *v59 = *v57;
      v59[1] = v57[1];
      double v60 = begin[v55];
      unint64_t v42 = v58 + 1;
      unint64_t v150 = v58 + 1;
      *((double *)&v56->~__shared_weak_count + v58) = v60;
    }
    else
    {
      if (v37 != (unsigned char *)v39)
      {
        v50 = v49 + 1;
        v51 = v39 + 1;
        uint64_t v52 = v48 >> 4;
        do
        {
          *(v50 - 1) = *(v51 - 1);
          uint64_t v53 = *v51;
          v51 += 2;
          void *v50 = v53;
          v50 += 2;
          --v52;
        }
        while (v52);
      }
      memcpy(v38, begin, (unint64_t)v48 >> 1);
      unint64_t v150 = v42;
    }
    atomic_ullong v61 = v34[3];
    unint64_t v62 = (v34[4] - v61) >> 3;
    p_simplifiedGeometryCacheLock = v146;
    if (v42 <= v62)
    {
      v30 = v145;
      if (v42 < v62) {
        v34[4] = v61 + 8 * v42;
      }
    }
    else
    {
      std::vector<double>::__append((uint64_t)v35, v42 - v62);
      v30 = v145;
    }
  }
  atomic_ullong v67 = v29[3];
  unint64_t v68 = (v29[4] - v67) >> 4;
  if (v42 <= v68)
  {
    if (v42 < v68) {
      v29[4] = v67 + 16 * v42;
    }
  }
  else
  {
    std::vector<geo::Mercator2<double>>::__append(v30, v42 - v68);
  }
  v147->var0.var0 = v30;
  v147->var0.var1 = (__shared_weak_count *)v29;
  v69 = v29 + 1;
  atomic_fetch_add_explicit(v29 + 1, 1uLL, memory_order_relaxed);
  v147->var1.var0 = v35;
  v147->var1.var1 = (__shared_weak_count *)v34;
  if (v34)
  {
    atomic_fetch_add_explicit(v34 + 1, 1uLL, memory_order_relaxed);
    v70 = (char *)self->_simplifiedGeometryCache.__ptr_.__value_;
    v148 = (std::__shared_weak_count *)v29;
    atomic_fetch_add_explicit(v69, 1uLL, memory_order_relaxed);
    v149 = (std::__shared_weak_count *)v34;
    atomic_fetch_add_explicit(v34 + 1, 1uLL, memory_order_relaxed);
    unint64_t v71 = (unint64_t)(v70 + 48);
    v72 = v70 + 8;
    v155 = v30;
    v156 = (std::__shared_weak_count *)v29;
    atomic_fetch_add_explicit(v69, 1uLL, memory_order_relaxed);
    v157 = v35;
    v158 = v34;
    atomic_fetch_add_explicit(v34 + 1, 1uLL, memory_order_relaxed);
    int8x8_t v73 = *(int8x8_t *)(v70 + 16);
    if (!*(void *)&v73) {
      goto LABEL_98;
    }
  }
  else
  {
    v70 = (char *)self->_simplifiedGeometryCache.__ptr_.__value_;
    v148 = (std::__shared_weak_count *)v29;
    atomic_fetch_add_explicit(v69, 1uLL, memory_order_relaxed);
    v149 = 0;
    unint64_t v71 = (unint64_t)(v70 + 48);
    v72 = v70 + 8;
    v155 = v30;
    v156 = (std::__shared_weak_count *)v29;
    atomic_fetch_add_explicit(v69, 1uLL, memory_order_relaxed);
    v157 = v35;
    v158 = 0;
    int8x8_t v73 = *(int8x8_t *)(v70 + 16);
    if (!*(void *)&v73) {
      goto LABEL_98;
    }
  }
  uint8x8_t v74 = (uint8x8_t)vcnt_s8(v73);
  v74.i16[0] = vaddlv_u8(v74);
  if (v74.u32[0] > 1uLL)
  {
    unint64_t v75 = v10;
    if (*(void *)&v73 <= v10) {
      unint64_t v75 = v10 % *(void *)&v73;
    }
  }
  else
  {
    unint64_t v75 = (v73.i32[0] - 1) & v10;
  }
  v76 = *(uint64_t ****)(*((void *)v70 + 1) + 8 * v75);
  if (v76)
  {
    v77 = *v76;
    if (*v76)
    {
      if (v74.u32[0] < 2uLL)
      {
        uint64_t v78 = *(void *)&v73 - 1;
        while (1)
        {
          v80 = v77[1];
          if (v80 == (uint64_t *)v10)
          {
            if (*((unsigned __int8 *)v77 + 16) == v10) {
              goto LABEL_90;
            }
          }
          else if (((unint64_t)v80 & v78) != v75)
          {
            goto LABEL_98;
          }
          v77 = (uint64_t **)*v77;
          if (!v77) {
            goto LABEL_98;
          }
        }
      }
      do
      {
        unint64_t v79 = (unint64_t)v77[1];
        if (v79 == v10)
        {
          if (*((unsigned __int8 *)v77 + 16) == v10)
          {
LABEL_90:
            v81 = v77[3];
            uint64_t v82 = *v81;
            *(void *)(v82 + 8) = v81[1];
            *(void *)v81[1] = v82;
            --*((void *)v70 + 8);
            v83 = (std::__shared_weak_count *)v81[6];
            if (v83 && !atomic_fetch_add(&v83->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v83->__on_zero_shared)(v83);
              std::__shared_weak_count::__release_weak(v83);
            }
            v84 = (std::__shared_weak_count *)v81[4];
            if (v84 && !atomic_fetch_add(&v84->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v84->__on_zero_shared)(v84);
              std::__shared_weak_count::__release_weak(v84);
            }
            operator delete(v81);
            std::__hash_table<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::__unordered_map_hasher<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,true>,std::__unordered_map_equal<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::equal_to<gdc::LayerDataRequestKey>,gdc::LayerDataRequestKeyHash,true>,std::allocator<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>>>::remove((uint64_t)__p, v72, v77);
            if (__p[0]) {
              operator delete(__p[0]);
            }
            break;
          }
        }
        else
        {
          if (v79 >= *(void *)&v73) {
            v79 %= *(void *)&v73;
          }
          if (v79 != v75) {
            break;
          }
        }
        v77 = (uint64_t **)*v77;
      }
      while (v77);
    }
  }
LABEL_98:
  v85 = operator new(0x38uLL);
  v86 = v85;
  v85[16] = v10;
  v87 = v156;
  *((void *)v85 + 3) = v155;
  *((void *)v85 + 4) = v87;
  if (v87) {
    atomic_fetch_add_explicit(&v87->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v88 = (std::__shared_weak_count *)v158;
  *((void *)v85 + 5) = v157;
  *((void *)v85 + 6) = v88;
  if (v88) {
    atomic_fetch_add_explicit(&v88->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  *(void *)v85 = v71;
  v89 = (void *)*((void *)v70 + 7);
  *((void *)v85 + 1) = v89;
  void *v89 = v85;
  uint64_t v90 = *((void *)v70 + 8) + 1;
  *((void *)v70 + 7) = v85;
  *((void *)v70 + 8) = v90;
  unint64_t v91 = *((void *)v70 + 2);
  if (v91)
  {
    uint8x8_t v92 = (uint8x8_t)vcnt_s8((int8x8_t)v91);
    v92.i16[0] = vaddlv_u8(v92);
    if (v92.u32[0] > 1uLL)
    {
      unint64_t v71 = v10;
      if (v91 <= v10) {
        unint64_t v71 = v10 % v91;
      }
    }
    else
    {
      unint64_t v71 = (v91 - 1) & v10;
    }
    v93 = *(uint64_t ****)(*((void *)v70 + 1) + 8 * v71);
    if (v93)
    {
      v94 = *v93;
      if (v94)
      {
        if (v92.u32[0] < 2uLL)
        {
          while (1)
          {
            v96 = v94[1];
            if (v96 == (uint64_t *)v10)
            {
              if (*((unsigned __int8 *)v94 + 16) == v10) {
                goto LABEL_190;
              }
            }
            else if (((unint64_t)v96 & (v91 - 1)) != v71)
            {
              goto LABEL_123;
            }
            v94 = (uint64_t **)*v94;
            if (!v94) {
              goto LABEL_123;
            }
          }
        }
        do
        {
          unint64_t v95 = (unint64_t)v94[1];
          if (v95 == v10)
          {
            if (*((unsigned __int8 *)v94 + 16) == v10) {
              goto LABEL_190;
            }
          }
          else
          {
            if (v95 >= v91) {
              v95 %= v91;
            }
            if (v95 != v71) {
              break;
            }
          }
          v94 = (uint64_t **)*v94;
        }
        while (v94);
      }
    }
  }
LABEL_123:
  v97 = operator new(0x20uLL);
  void *v97 = 0;
  v97[1] = v10;
  *((unsigned char *)v97 + 16) = v10;
  v97[3] = v86;
  float v98 = (float)(unint64_t)(*((void *)v70 + 4) + 1);
  float v99 = *((float *)v70 + 10);
  if (v91 && (float)(v99 * (float)v91) >= v98)
  {
    unint64_t v10 = v71;
    goto LABEL_180;
  }
  BOOL v100 = 1;
  if (v91 >= 3) {
    BOOL v100 = (v91 & (v91 - 1)) != 0;
  }
  unint64_t v101 = v100 | (2 * v91);
  unint64_t v102 = vcvtps_u32_f32(v98 / v99);
  if (v101 <= v102) {
    size_t prime = v102;
  }
  else {
    size_t prime = v101;
  }
  if (prime == 1)
  {
    size_t prime = 2;
  }
  else if ((prime & (prime - 1)) != 0)
  {
    size_t prime = std::__next_prime(prime);
    unint64_t v91 = *((void *)v70 + 2);
  }
  if (prime <= v91)
  {
    if (prime >= v91) {
      goto LABEL_176;
    }
    unint64_t v116 = vcvtps_u32_f32((float)*((unint64_t *)v70 + 4) / *((float *)v70 + 10));
    if (v91 < 3 || (uint8x8_t v117 = (uint8x8_t)vcnt_s8((int8x8_t)v91), v117.i16[0] = vaddlv_u8(v117), v117.u32[0] > 1uLL))
    {
      unint64_t v116 = std::__next_prime(v116);
    }
    else
    {
      uint64_t v118 = 1 << -(char)__clz(v116 - 1);
      if (v116 >= 2) {
        unint64_t v116 = v118;
      }
    }
    if (prime <= v116) {
      size_t prime = v116;
    }
    if (prime >= v91) {
      goto LABEL_176;
    }
    if (!prime)
    {
      v123 = (void *)*((void *)v70 + 1);
      *((void *)v70 + 1) = 0;
      if (v123) {
        operator delete(v123);
      }
      *((void *)v70 + 2) = 0;
      goto LABEL_176;
    }
  }
  if (prime >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  v104 = operator new(8 * prime);
  v105 = (void *)*((void *)v70 + 1);
  *((void *)v70 + 1) = v104;
  if (v105) {
    operator delete(v105);
  }
  uint64_t v106 = 0;
  *((void *)v70 + 2) = prime;
  do
    *(void *)(*((void *)v70 + 1) + 8 * v106++) = 0;
  while (prime != v106);
  v108 = v70 + 24;
  v107 = (void *)*((void *)v70 + 3);
  if (v107)
  {
    size_t v109 = v107[1];
    size_t v110 = prime - 1;
    if ((prime & (prime - 1)) == 0)
    {
      size_t v111 = v109 & v110;
      *(void *)(*((void *)v70 + 1) + 8 * v111) = v108;
      while (1)
      {
        v112 = (void *)*v107;
        if (!*v107) {
          break;
        }
        size_t v113 = v112[1] & v110;
        if (v113 == v111)
        {
          v107 = (void *)*v107;
        }
        else
        {
          uint64_t v114 = *((void *)v70 + 1);
          if (*(void *)(v114 + 8 * v113))
          {
            void *v107 = *v112;
            uint64_t v115 = 8 * v113;
            void *v112 = **(void **)(*((void *)v70 + 1) + v115);
            **(void **)(*((void *)v70 + 1) + v115) = v112;
          }
          else
          {
            *(void *)(v114 + 8 * v113) = v107;
            v107 = v112;
            size_t v111 = v113;
          }
        }
      }
      goto LABEL_176;
    }
    if (v109 >= prime) {
      v109 %= prime;
    }
    *(void *)(*((void *)v70 + 1) + 8 * v109) = v108;
    v119 = (void *)*v107;
    if (!*v107) {
      goto LABEL_176;
    }
    do
    {
      size_t v121 = v119[1];
      if (v121 >= prime) {
        v121 %= prime;
      }
      if (v121 != v109)
      {
        uint64_t v122 = *((void *)v70 + 1);
        if (!*(void *)(v122 + 8 * v121))
        {
          *(void *)(v122 + 8 * v121) = v107;
          goto LABEL_162;
        }
        void *v107 = *v119;
        uint64_t v120 = 8 * v121;
        void *v119 = **(void **)(*((void *)v70 + 1) + v120);
        **(void **)(*((void *)v70 + 1) + v120) = v119;
        v119 = v107;
      }
      size_t v121 = v109;
LABEL_162:
      v107 = v119;
      v119 = (void *)*v119;
      size_t v109 = v121;
    }
    while (v119);
  }
LABEL_176:
  unint64_t v91 = *((void *)v70 + 2);
  if ((v91 & (v91 - 1)) != 0)
  {
    if (v91 <= v10) {
      v10 %= v91;
    }
  }
  else
  {
    unint64_t v10 = (v91 - 1) & v10;
  }
LABEL_180:
  uint64_t v124 = *((void *)v70 + 1);
  v125 = *(void **)(v124 + 8 * v10);
  if (v125)
  {
    void *v97 = *v125;
LABEL_188:
    void *v125 = v97;
    goto LABEL_189;
  }
  void *v97 = *((void *)v70 + 3);
  *((void *)v70 + 3) = v97;
  *(void *)(v124 + 8 * v10) = v70 + 24;
  if (*v97)
  {
    unint64_t v126 = *(void *)(*v97 + 8);
    if ((v91 & (v91 - 1)) != 0)
    {
      if (v126 >= v91) {
        v126 %= v91;
      }
    }
    else
    {
      v126 &= v91 - 1;
    }
    v125 = (void *)(*((void *)v70 + 1) + 8 * v126);
    goto LABEL_188;
  }
LABEL_189:
  ++*((void *)v70 + 4);
LABEL_190:
  if (v88 && !atomic_fetch_add(&v88->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
    std::__shared_weak_count::__release_weak(v88);
  }
  v127 = v156;
  if (v156 && !atomic_fetch_add(&v156->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v127->__on_zero_shared)(v127);
    std::__shared_weak_count::__release_weak(v127);
  }
  while (*((void *)v70 + 8) > *(void *)v70)
  {
    uint64_t v128 = *((void *)v70 + 6);
    unint64_t v129 = *(unsigned __int8 *)(v128 + 16);
    v130 = *(std::__shared_weak_count **)(v128 + 32);
    if (v130) {
      atomic_fetch_add_explicit(&v130->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v131 = *(std::__shared_weak_count **)(v128 + 48);
    if (v131) {
      atomic_fetch_add_explicit(&v131->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    v132 = (uint64_t *)*((void *)v70 + 6);
    uint64_t v133 = *v132;
    *(void *)(v133 + 8) = v132[1];
    *(void *)v132[1] = v133;
    --*((void *)v70 + 8);
    v134 = (std::__shared_weak_count *)v132[6];
    if (v134 && !atomic_fetch_add(&v134->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v134->__on_zero_shared)(v134);
      std::__shared_weak_count::__release_weak(v134);
      v135 = (std::__shared_weak_count *)v132[4];
      if (!v135) {
        goto LABEL_209;
      }
    }
    else
    {
      v135 = (std::__shared_weak_count *)v132[4];
      if (!v135) {
        goto LABEL_209;
      }
    }
    if (!atomic_fetch_add(&v135->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v135->__on_zero_shared)(v135);
      std::__shared_weak_count::__release_weak(v135);
    }
LABEL_209:
    operator delete(v132);
    int8x8_t v136 = *(int8x8_t *)(v70 + 16);
    if (v136)
    {
      uint8x8_t v137 = (uint8x8_t)vcnt_s8(v136);
      v137.i16[0] = vaddlv_u8(v137);
      if (v137.u32[0] > 1uLL)
      {
        unint64_t v138 = v129;
        if (*(void *)&v136 <= v129) {
          unint64_t v138 = v129 % *(void *)&v136;
        }
      }
      else
      {
        unint64_t v138 = (v136.i32[0] - 1) & v129;
      }
      v139 = *(uint64_t ****)(*((void *)v70 + 1) + 8 * v138);
      if (v139)
      {
        v140 = *v139;
        if (*v139)
        {
          if (v137.u32[0] < 2uLL)
          {
            uint64_t v141 = *(void *)&v136 - 1;
            while (1)
            {
              v143 = v140[1];
              if (v143 == (uint64_t *)v129)
              {
                if (*((unsigned __int8 *)v140 + 16) == v129) {
                  goto LABEL_230;
                }
              }
              else if (((unint64_t)v143 & v141) != v138)
              {
                goto LABEL_232;
              }
              v140 = (uint64_t **)*v140;
              if (!v140) {
                goto LABEL_232;
              }
            }
          }
          do
          {
            unint64_t v142 = (unint64_t)v140[1];
            if (v142 == v129)
            {
              if (*((unsigned __int8 *)v140 + 16) == v129)
              {
LABEL_230:
                std::__hash_table<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::__unordered_map_hasher<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,gdc::LayerDataRequestKeyHash,std::equal_to<gdc::LayerDataRequestKey>,true>,std::__unordered_map_equal<gdc::LayerDataRequestKey,std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>,std::equal_to<gdc::LayerDataRequestKey>,gdc::LayerDataRequestKeyHash,true>,std::allocator<std::__hash_value_type<gdc::LayerDataRequestKey,std::tuple<md::DaVinciGroundRenderable *,gdc::Entity>>>>::remove((uint64_t)__p, v72, v140);
                if (__p[0]) {
                  operator delete(__p[0]);
                }
                break;
              }
            }
            else
            {
              if (v142 >= *(void *)&v136) {
                v142 %= *(void *)&v136;
              }
              if (v142 != v138) {
                break;
              }
            }
            v140 = (uint64_t **)*v140;
          }
          while (v140);
        }
      }
    }
LABEL_232:
    if (v131 && !atomic_fetch_add(&v131->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v131->__on_zero_shared)(v131);
      std::__shared_weak_count::__release_weak(v131);
      if (v130)
      {
LABEL_235:
        if (!atomic_fetch_add(&v130->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v130->__on_zero_shared)(v130);
          std::__shared_weak_count::__release_weak(v130);
        }
      }
    }
    else if (v130)
    {
      goto LABEL_235;
    }
  }
  if (v149 && !atomic_fetch_add(&v149->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v149->__on_zero_shared)(v149);
    std::__shared_weak_count::__release_weak(v149);
  }
  if (v148 && !atomic_fetch_add(&v148->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
    std::__shared_weak_count::__release_weak(v148);
  }
  v144 = v152;
  os_unfair_lock_unlock(&p_simplifiedGeometryCacheLock->_lock);
  if (v144 && !atomic_fetch_add(&v144->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v144->__on_zero_shared)(v144);
    std::__shared_weak_count::__release_weak(v144);
  }
LABEL_31:
  v26 = v154;
  if (v154 && !atomic_fetch_add(&v154->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
  return result;
}

- (VKVectorOverlayPolyline)initWithMapPoints:(id *)a3 elevations:(const double *)a4 count:(unint64_t)a5 needsElevationCorrection:(BOOL)a6
{
  v7.receiver = self;
  v7.super_class = (Class)VKVectorOverlayPolyline;
  if ([(VKVectorOverlayPolyline *)&v7 init]) {
    operator new();
  }

  return 0;
}

@end