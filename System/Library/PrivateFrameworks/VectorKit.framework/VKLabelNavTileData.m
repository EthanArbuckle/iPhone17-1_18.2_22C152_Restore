@interface VKLabelNavTileData
- (BOOL)oppositeCarriagewayJunctionsValid;
- (NSMutableArray)oppositeCarriagewayJunctions;
- (VKLabelNavTileData)initWithTile:(const void *)a3;
- (__n128)_findTileEdgeJunctions;
- (__n128)findOppositeCarriagewayJunctionsWithRouteFeatures:distanceThreshold:;
- (const)tile;
- (id).cxx_construct;
- (id)findTileEdgeJunctionAtCoordinate:()Matrix<float;
- (id)junctionAtCoordinate:()Matrix<float;
- (id)junctionForGeoJunction:(GeoCodecsConnectivityJunction *)a3;
- (uint64_t)_findTileEdgeJunctions;
- (void)_findTileEdgeJunctions;
- (void)addJunction:(id)a3;
- (void)appendNavJunctionsInWorldRect:(const void *)a3 junctions:(id)a4;
- (void)findOppositeCarriagewayJunctionsWithRouteFeatures:(void *)a3 distanceThreshold:(double)a4;
- (void)findOppositeCarriagewayJunctionsWithRouteFeatures:distanceThreshold:;
- (void)initializeJunctionInfos;
- (void)setOppositeCarriagewayJunctionsValid:(BOOL)a3;
@end

@implementation VKLabelNavTileData

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 7) = 0;
  v2 = &md::SignedDistanceFieldGenerator::_hypotCache[32854];
  {
    id v5 = self;
    v2 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    int v4 = v3;
    self = v5;
    if (v4) {
      operator new();
    }
  }
  *((void *)self + 10) = *((void *)v2 + 91);
  return self;
}

- (void).cxx_destruct
{
  begin = self->_junctionInfos.__begin_;
  if (begin)
  {
    self->_junctionInfos.__end_ = begin;
    (*(void (**)(Allocator *, LabelNavJunctionInfo *, int64_t))(*(void *)self->_junctionInfos.__end_cap_.__value__2._allocator
                                                                                + 40))(self->_junctionInfos.__end_cap_.__value__2._allocator, begin, self->_junctionInfos.__end_cap_.__value_ - begin);
  }
  objc_storeStrong((id *)&self->_oppositeCarriagewayJunctions, 0);
  objc_storeStrong((id *)&self->_tileEdgeJunctions, 0);
  objc_storeStrong((id *)&self->_geoJunctionToJunctionMap, 0);
  cntrl = self->_tile.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
}

- (const)tile
{
  return &self->_tile;
}

- (NSMutableArray)oppositeCarriagewayJunctions
{
  return self->_oppositeCarriagewayJunctions;
}

- (void)setOppositeCarriagewayJunctionsValid:(BOOL)a3
{
  self->_oppositeCarriagewayJunctionsValid = a3;
}

- (BOOL)oppositeCarriagewayJunctionsValid
{
  return self->_oppositeCarriagewayJunctionsValid;
}

- (void)findOppositeCarriagewayJunctionsWithRouteFeatures:(void *)a3 distanceThreshold:(double)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (!self->_oppositeCarriagewayJunctionsValid)
  {
    self->_oppositeCarriagewayJunctionsValid = 1;
    if (self->_junctionInfos.__begin_ == self->_junctionInfos.__end_) {
      [(VKLabelNavTileData *)self initializeJunctionInfos];
    }
    [(NSMutableArray *)self->_oppositeCarriagewayJunctions removeAllObjects];
    begin = self->_junctionInfos.__begin_;
    end = self->_junctionInfos.__end_;
    if (begin != end)
    {
      p_tile = &self->_tile;
      while (1)
      {
        v8 = [(NSMapTable *)self->_geoJunctionToJunctionMap objectForKey:*(void *)begin];
        v9 = v8;
        if (!v8) {
          break;
        }
        if (![(VKLabelNavJunction *)v8 isOnRoute])
        {
          if (![(VKLabelNavJunction *)v9 isOnDualCarriageway]) {
            break;
          }
          [(NSMutableArray *)self->_oppositeCarriagewayJunctions addObject:v9];
        }
LABEL_122:

        begin = (LabelNavJunctionInfo *)((char *)begin + 32);
        if (begin == end) {
          return;
        }
      }
      v94 = 0;
      v95 = 0;
      uint64_t v96 = 0;
      {
        operator new();
      }
      uint64_t v97 = mdm::Allocator::instance(void)::alloc;
      unsigned __int8 v93 = 8;
      v10 = (uint64_t *)*((void *)p_tile->__ptr_ + 3);
      uint64_t v12 = *v10;
      v11 = (std::__shared_weak_count *)v10[1];
      uint64_t v91 = v12;
      v92 = v11;
      if (v11) {
        atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      v13 = *(unsigned int **)begin;
      v98[0] = &unk_1EF56CC18;
      v98[1] = &v93;
      v98[2] = &v94;
      v99 = v98;
      geo::codec::forEachEdgeOnJunction(&v91, v13, (uint64_t)v98);
      if (v99 == v98)
      {
        (*(void (**)(void *))(v98[0] + 32))(v98);
      }
      else if (v99)
      {
        (*(void (**)(void))(*v99 + 40))();
      }
      unint64_t v14 = 126 - 2 * __clz(((char *)v95 - (char *)v94) >> 5);
      if (v95 == v94) {
        uint64_t v15 = 0;
      }
      else {
        uint64_t v15 = v14;
      }
      std::__introsort<std::_ClassicAlgPolicy,std::__less<void,void> &,std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>> *,false>(v94, v95, v15, 1);
      v16 = v94;
      v17 = v95;
      if (v94 != v95)
      {
        v18 = v94 + 4;
        if (v94 + 4 != v95)
        {
          v19 = v94;
          while (1)
          {
            uint64_t v20 = *((unsigned __int8 *)v19 + 23);
            if ((v20 & 0x80u) == 0) {
              v21 = (const void *)*((unsigned __int8 *)v19 + 23);
            }
            else {
              v21 = v19[1];
            }
            v22 = (const void *)*((unsigned __int8 *)v19 + 55);
            int v23 = (char)v22;
            if ((char)v22 < 0) {
              v22 = v19[5];
            }
            if (v21 == v22) {
              break;
            }
LABEL_25:
            v18 += 4;
            v19 += 4;
            if (v18 == v17) {
              goto LABEL_71;
            }
          }
          if (v23 >= 0) {
            v24 = (unsigned __int8 *)v18;
          }
          else {
            v24 = (unsigned __int8 *)*v18;
          }
          if ((v20 & 0x80) != 0)
          {
            if (!memcmp(*v19, v24, (size_t)v19[1])) {
              goto LABEL_40;
            }
            goto LABEL_25;
          }
          if (*((unsigned char *)v19 + 23))
          {
            uint64_t v25 = 0;
            while (*((unsigned __int8 *)v19 + v25) == v24[v25])
            {
              if (v20 == ++v25) {
                goto LABEL_40;
              }
            }
            goto LABEL_25;
          }
LABEL_40:
          if (v19 != v17)
          {
            v26 = v19 + 8;
            if (v19 + 8 != v17)
            {
              v27 = v19 + 4;
              while (1)
              {
                v29 = v27;
                v27 = v26;
                uint64_t v30 = *((unsigned __int8 *)v19 + 23);
                if ((v30 & 0x80u) == 0) {
                  v31 = (const void *)*((unsigned __int8 *)v19 + 23);
                }
                else {
                  v31 = v19[1];
                }
                v32 = (const void *)*((unsigned __int8 *)v29 + 55);
                int v33 = (char)v32;
                if ((char)v32 < 0) {
                  v32 = v29[5];
                }
                if (v31 != v32) {
                  goto LABEL_44;
                }
                if (v33 >= 0) {
                  v34 = (unsigned __int8 *)v27;
                }
                else {
                  v34 = (unsigned __int8 *)*v27;
                }
                if ((v30 & 0x80) != 0)
                {
                  if (memcmp(*v19, v34, (size_t)v19[1])) {
                    goto LABEL_44;
                  }
                }
                else if (*((unsigned char *)v19 + 23))
                {
                  uint64_t v35 = 0;
                  while (*((unsigned __int8 *)v19 + v35) == v34[v35])
                  {
                    if (v30 == ++v35) {
                      goto LABEL_47;
                    }
                  }
LABEL_44:
                  if (*((char *)v19 + 55) < 0) {
                    (*(void (**)(const void *, const void *, unint64_t))(*(void *)v19[7] + 40))(v19[7], v19[4], (unint64_t)v19[6] & 0x7FFFFFFFFFFFFFFFLL);
                  }
                  v19 += 4;
                  long long v28 = *(_OWORD *)v27;
                  v19[2] = v27[2];
                  *(_OWORD *)v19 = v28;
                  *((unsigned char *)v29 + 55) = 0;
                  *(unsigned char *)v27 = 0;
                }
LABEL_47:
                v26 = v27 + 4;
                if (v27 + 4 == v17)
                {
                  v16 = v94;
                  v17 = v95;
                  break;
                }
              }
            }
            v36 = v19 + 4;
            if (v17 != v36)
            {
              while (v17 != v36)
              {
                if (*((char *)v17 - 9) < 0) {
                  (*(void (**)(void, void, unint64_t))(*(void *)*(v17 - 1) + 40))(*(v17 - 1), *(v17 - 4), (unint64_t)*(v17 - 2) & 0x7FFFFFFFFFFFFFFFLL);
                }
                v17 -= 4;
              }
              v95 = v36;
              v16 = v94;
              v17 = v36;
            }
          }
        }
      }
LABEL_71:
      if (v16 != v17)
      {
        double v37 = *((double *)begin + 1);
        double v38 = *((double *)begin + 2);
        unsigned int v39 = v93;
        do
        {
          v40 = std::__hash_table<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::__unordered_map_hasher<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,std::__unordered_map_equal<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,std::equal_to<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,std::hash<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>,true>,geo::StdAllocator<std::__hash_value_type<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>,std::shared_ptr<md::LabelDedupingGroup>>,mdm::Allocator>>::find<std::basic_string<char,std::char_traits<char>,geo::StdAllocator<char,mdm::Allocator>>>(a3, (uint64_t)v16);
          if (v40)
          {
            uint64_t v41 = v40[6];
            uint64_t v43 = *(void *)(v41 + 64);
            uint64_t v42 = *(void *)(v41 + 72);
            while (v43 != v42)
            {
              if (v39 <= *(unsigned __int8 *)(v43 + 48))
              {
                v47 = *(double **)v43;
                uint64_t v48 = *(void *)(v43 + 8) - *(void *)v43;
                uint64_t v49 = v48 >> 4;
                if ((unint64_t)v48 < 0x11)
                {
                  unint64_t v51 = 0;
                  double v55 = 0.0;
                  double v56 = 1.79769313e308;
                }
                else
                {
                  unint64_t v50 = 0;
                  unint64_t v51 = 0;
                  double v54 = *v47;
                  double v53 = v47[1];
                  v52 = v47 + 3;
                  double v55 = 0.0;
                  double v56 = 1.79769313e308;
                  do
                  {
                    double v58 = *(v52 - 1);
                    double v59 = *v52;
                    double v60 = v58 - v54;
                    double v61 = *v52 - v53;
                    double v62 = v60 * v60 + v61 * v61;
                    double v63 = 0.0;
                    if (v62 > 1.0e-15) {
                      double v63 = fmin(fmax(((v37 - v54) * v60 + (v38 - v53) * v61) / v62, 0.0), 1.0);
                    }
                    double v57 = (v37 - (v54 + v63 * v60)) * (v37 - (v54 + v63 * v60))
                        + (v38 - (v53 + v63 * v61)) * (v38 - (v53 + v63 * v61));
                    if (v57 < v56)
                    {
                      double v55 = v63;
                      unint64_t v51 = v50;
                    }
                    ++v50;
                    double v56 = fmin(v57, v56);
                    v52 += 2;
                    double v53 = v59;
                    double v54 = v58;
                  }
                  while (v49 - 1 != v50);
                }
                if (v51 || v55 > 0.1)
                {
                  unint64_t v44 = v49 - 1;
                  BOOL v45 = v55 >= 0.99 && v51 >= v44;
                  if (!v45 && v56 <= a4)
                  {
                    if (!v9)
                    {
                      v9 = [[VKLabelNavJunction alloc] initWithGEOJunction:*(void *)begin routeOffset:0xBF80000000000000 tile:p_tile];
                      [(VKLabelNavTileData *)self addJunction:v9];
                    }
                    [(VKLabelNavJunction *)v9 setDepthFromRoute:1];
                    [(VKLabelNavJunction *)v9 setIsOnDualCarriageway:1];
                    v64 = (id *)(v43 + 32);
                    uint64_t v65 = [*(id *)(v43 + 32) routeOffset];
                    v66 = (id *)(v43 + 40);
                    uint64_t v67 = [*(id *)(v43 + 40) routeOffset];
                    LODWORD(v69) = HIDWORD(v65);
                    if (*((float *)&v65 + 1) < 0.0 || (LODWORD(v68) = HIDWORD(v67), *((float *)&v67 + 1) < 0.0))
                    {
                      if (*((float *)&v65 + 1) >= 0.0) {
                        v84 = (id *)(v43 + 32);
                      }
                      else {
                        v84 = (id *)(v43 + 40);
                      }
                      -[VKLabelNavJunction setRouteOffset:](v9, "setRouteOffset:", objc_msgSend(*v84, "routeOffset", v69, v68));
                    }
                    else
                    {
                      unsigned int v70 = objc_msgSend(*v64, "routeOffset", v69, v68);
                      LODWORD(v71) = (unint64_t)[*v64 routeOffset] >> 32;
                      unsigned int v72 = [*v66 routeOffset];
                      uint64_t v73 = [*v66 routeOffset];
                      uint64_t v74 = *(void *)(v43 + 8);
                      double v76 = **(double **)v43;
                      double v75 = *(double *)(*(void *)v43 + 8);
                      double v77 = *(double *)(v74 - 16) - v76;
                      double v78 = *(double *)(v74 - 8) - v75;
                      double v79 = v77 * v77 + v78 * v78;
                      double v80 = 0.0;
                      if (v79 > 1.0e-15) {
                        double v80 = fmin(fmax(((v37 - v76) * v77 + (v38 - v75) * v78) / v79, 0.0), 1.0);
                      }
                      double v81 = v71 + (double)v70 + v80 * ((double)v72 - (v71 + (double)v70) + *((float *)&v73 + 1));
                      unsigned int v82 = v81;
                      float v83 = v81 - trunc(v81);
                      if (v83 >= 1.0)
                      {
                        v82 += vcvtms_u32_f32(v83);
                        float v83 = v83 - floorf(v83);
                      }
                      [(VKLabelNavJunction *)v9 setRouteOffset:v82 | ((unint64_t)LODWORD(v83) << 32)];
                    }
                    [(NSMutableArray *)self->_oppositeCarriagewayJunctions addObject:v9];
                    goto LABEL_111;
                  }
                }
              }
              v43 += 56;
            }
          }
          v16 += 4;
        }
        while (v16 != v17);
      }
LABEL_111:
      v85 = v92;
      if (v92 && !atomic_fetch_add(&v92->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
        std::__shared_weak_count::__release_weak(v85);
      }
      v86 = v94;
      if (v94)
      {
        v87 = v95;
        v88 = v94;
        if (v95 != v94)
        {
          do
          {
            if (*((char *)v87 - 9) < 0) {
              (*(void (**)(void, void, unint64_t))(*(void *)*(v87 - 1) + 40))(*(v87 - 1), *(v87 - 4), (unint64_t)*(v87 - 2) & 0x7FFFFFFFFFFFFFFFLL);
            }
            v87 -= 4;
          }
          while (v87 != v86);
          v88 = v94;
        }
        v95 = v86;
        (*(void (**)(uint64_t, const void **, uint64_t))(*(void *)v97 + 40))(v97, v88, v96 - (void)v88);
      }
      goto LABEL_122;
    }
  }
}

- (void)findOppositeCarriagewayJunctionsWithRouteFeatures:distanceThreshold:
{
}

- (__n128)findOppositeCarriagewayJunctionsWithRouteFeatures:distanceThreshold:
{
  v2 = (char *)operator new(0x18uLL);
  *(void *)v2 = &unk_1EF56CC18;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

- (void)appendNavJunctionsInWorldRect:(const void *)a3 junctions:(id)a4
{
  id v13 = a4;
  begin = self->_junctionInfos.__begin_;
  end = self->_junctionInfos.__end_;
  if (begin != end
    || ([(VKLabelNavTileData *)self initializeJunctionInfos],
        begin = self->_junctionInfos.__begin_,
        end = self->_junctionInfos.__end_,
        begin != end))
  {
    do
    {
      double v8 = *((double *)begin + 1);
      if (v8 >= *(double *)a3)
      {
        double v9 = *((double *)begin + 2);
        BOOL v10 = v8 >= *((double *)a3 + 2) || v9 < *((double *)a3 + 1);
        if (!v10 && v9 < *((double *)a3 + 3))
        {
          uint64_t v12 = [(NSMapTable *)self->_geoJunctionToJunctionMap objectForKey:*(void *)begin];
          if (!v12)
          {
            uint64_t v12 = [[VKLabelNavJunction alloc] initWithGEOJunction:*(void *)begin routeOffset:0xBF80000000000000 tile:&self->_tile];
            [(VKLabelNavTileData *)self addJunction:v12];
          }
          [v13 addObject:v12];

          end = self->_junctionInfos.__end_;
        }
      }
      begin = (LabelNavJunctionInfo *)((char *)begin + 32);
    }
    while (begin != end);
  }
}

- (void)initializeJunctionInfos
{
  if (self->_junctionInfos.__begin_ == self->_junctionInfos.__end_)
  {
    uint64_t v3 = *((void *)self->_tile.__ptr_ + 3);
    int v4 = *(geo::codec::VectorTile **)v3;
    id v5 = *(std::__shared_weak_count **)(v3 + 8);
    v40 = *(geo::codec::VectorTile **)v3;
    uint64_t v41 = v5;
    if (v5) {
      atomic_fetch_add_explicit(&v5->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    unint64_t v6 = geo::codec::VectorTile::junctionsCount(v4);
    unint64_t v7 = v6;
    begin = self->_junctionInfos.__begin_;
    if (v6 > (self->_junctionInfos.__end_cap_.__value_ - begin) >> 5)
    {
      if (v6 >> 59) {
        abort();
      }
      end = self->_junctionInfos.__end_;
      uint64_t v10 = (*(uint64_t (**)(Allocator *, unint64_t, uint64_t))(*(void *)self->_junctionInfos.__end_cap_.__value__2._allocator
                                                                              + 16))(self->_junctionInfos.__end_cap_.__value__2._allocator, 32 * v6, 8);
      uint64_t v12 = self->_junctionInfos.__begin_;
      v11 = self->_junctionInfos.__end_;
      id v13 = (LabelNavJunctionInfo *)(v10 + ((end - begin) & 0xFFFFFFFFFFFFFFE0));
      if (v11 != v12)
      {
        do
        {
          long long v14 = *((_OWORD *)v11 - 1);
          *((_OWORD *)v13 - 2) = *((_OWORD *)v11 - 2);
          *((_OWORD *)v13 - 1) = v14;
          id v13 = (LabelNavJunctionInfo *)((char *)v13 - 32);
          v11 = (LabelNavJunctionInfo *)((char *)v11 - 32);
        }
        while (v11 != v12);
        v11 = self->_junctionInfos.__begin_;
      }
      self->_junctionInfos.__begin_ = v13;
      self->_junctionInfos.__end_ = (LabelNavJunctionInfo *)(v10 + ((end - begin) & 0xFFFFFFFFFFFFFFE0));
      value = self->_junctionInfos.__end_cap_.__value_;
      self->_junctionInfos.__end_cap_.__value_ = (LabelNavJunctionInfo *)(v10 + 32 * v7);
      if (v11) {
        (*(void (**)(Allocator *, LabelNavJunctionInfo *, int64_t))(*(void *)self->_junctionInfos.__end_cap_.__value__2._allocator
      }
                                                                                    + 40))(self->_junctionInfos.__end_cap_.__value__2._allocator, v11, value - v11);
    }
    v16 = (_DWORD *)geo::codec::VectorTile::junctions(v4);
    if (v16)
    {
      for (unint64_t i = 0; i < geo::codec::VectorTile::junctionsCount(v4); ++i)
      {
        if (*v16)
        {
          uint64_t v19 = geo::codec::VectorTile::pointsOnRoad(v4);
          int v4 = v40;
          uint64_t v20 = (unsigned int *)(v19 + 16 * v16[1]);
          v21 = (void *)(geo::codec::VectorTile::lines(v40) + 168 * v20[1]);
          uint64_t v39 = 0;
          float64x2_t v22 = vmlaq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 312), vcvtq_f64_f32((float32x2_t)geo::codec::multiSectionFeaturePoints(v21, v20[2], &v39)[v20[3]]), vsubq_f64(*(float64x2_t *)((char *)self->_tile.__ptr_ + 328), *(float64x2_t *)((char *)self->_tile.__ptr_ + 312)));
          int v23 = self->_junctionInfos.__end_;
          v24 = self->_junctionInfos.__end_cap_.__value_;
          if (v23 >= v24)
          {
            uint64_t v25 = self->_junctionInfos.__begin_;
            uint64_t v26 = (v23 - v25) >> 5;
            unint64_t v27 = v26 + 1;
            if ((unint64_t)(v26 + 1) >> 59) {
              abort();
            }
            uint64_t v28 = v24 - v25;
            if (v28 >> 4 > v27) {
              unint64_t v27 = v28 >> 4;
            }
            if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFE0) {
              uint64_t v29 = 0x7FFFFFFFFFFFFFFLL;
            }
            else {
              uint64_t v29 = v27;
            }
            if (v29)
            {
              float64x2_t v38 = v22;
              uint64_t v30 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)self->_junctionInfos.__end_cap_.__value__2._allocator
                                                                             + 16))(self->_junctionInfos.__end_cap_.__value__2._allocator, 32 * v29, 8);
              uint64_t v31 = v30 + 32 * v26;
              v32 = (LabelNavJunctionInfo *)(v30 + 32 * v29);
              if (v30)
              {
                *(void *)uint64_t v31 = v16;
                *(float64x2_t *)(v31 + 8) = v38;
                *(void *)(v31 + 24) = 0;
              }
            }
            else
            {
              v32 = 0;
              uint64_t v31 = 32 * v26;
            }
            v34 = self->_junctionInfos.__begin_;
            int v33 = self->_junctionInfos.__end_;
            uint64_t v35 = (LabelNavJunctionInfo *)v31;
            if (v33 != v34)
            {
              do
              {
                long long v36 = *((_OWORD *)v33 - 1);
                *((_OWORD *)v35 - 2) = *((_OWORD *)v33 - 2);
                *((_OWORD *)v35 - 1) = v36;
                uint64_t v35 = (LabelNavJunctionInfo *)((char *)v35 - 32);
                int v33 = (LabelNavJunctionInfo *)((char *)v33 - 32);
              }
              while (v33 != v34);
              int v33 = self->_junctionInfos.__begin_;
            }
            v18 = (LabelNavJunctionInfo *)(v31 + 32);
            self->_junctionInfos.__begin_ = v35;
            self->_junctionInfos.__end_ = (LabelNavJunctionInfo *)(v31 + 32);
            double v37 = self->_junctionInfos.__end_cap_.__value_;
            self->_junctionInfos.__end_cap_.__value_ = v32;
            if (v33) {
              (*(void (**)(Allocator *, LabelNavJunctionInfo *, int64_t))(*(void *)self->_junctionInfos.__end_cap_.__value__2._allocator
            }
                                                                                          + 40))(self->_junctionInfos.__end_cap_.__value__2._allocator, v33, v37 - v33);
          }
          else
          {
            if (v23)
            {
              *(void *)int v23 = v16;
              *(float64x2_t *)((char *)v23 + 8) = v22;
              *((void *)v23 + 3) = 0;
            }
            v18 = (LabelNavJunctionInfo *)((char *)v23 + 32);
          }
          self->_junctionInfos.__end_ = v18;
        }
        v16 += 8;
      }
      id v5 = v41;
    }
    if (v5 && !atomic_fetch_add(&v5->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
}

- (id)findTileEdgeJunctionAtCoordinate:()Matrix<float
{
  float v3 = a3._e[1];
  float v4 = a3._e[0];
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!self->_foundTileEdgeJunctions) {
    [(VKLabelNavTileData *)self _findTileEdgeJunctions];
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unint64_t v6 = self->_tileEdgeJunctions;
  id v7 = (id)[(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (unint64_t i = 0; i != v7; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "tileCoordinate", (void)v15);
        BOOL v13 = vabds_f32(*(float *)&v12, v4) < 0.0005;
        *(float *)&double v12 = vabds_f32(v11, v3);
        BOOL v13 = v13 && *(float *)&v12 < 0.0005;
        if (v13)
        {
          id v7 = v10;
          goto LABEL_16;
        }
      }
      id v7 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16, v12);
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_16:

  return v7;
}

- (void)_findTileEdgeJunctions
{
}

- (uint64_t)_findTileEdgeJunctions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  float v3 = *a2;
  uint64_t v9 = 0;
  uint64_t v8 = geo::codec::multiSectionFeaturePoints(v3, 0, &v9);
  float v4 = *(uint64_t **)(a1 + 8);
  uint64_t v5 = *(void *)(a1 + 16);
  unint64_t v6 = operator new(0x20uLL);
  *unint64_t v6 = &unk_1EF590D68;
  v6[1] = &v9;
  v6[2] = &v8;
  v6[3] = v5;
  float v11 = v6;
  geo::codec::forEachEdgeInRoad(v4, (uint64_t)v3, 1, (uint64_t)v10);
  uint64_t result = (uint64_t)v11;
  if (v11 == v10) {
    return (*(uint64_t (**)(void *))(v10[0] + 32))(v10);
  }
  if (v11) {
    return (*(uint64_t (**)(void))(*v11 + 40))();
  }
  return result;
}

- (__n128)_findTileEdgeJunctions
{
  v2 = (char *)operator new(0x18uLL);
  *(void *)v2 = &unk_1EF590D20;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

- (void)addJunction:(id)a3
{
  id v4 = a3;
  if ([v4 geoJunction]) {
    -[NSMapTable setObject:forKey:](self->_geoJunctionToJunctionMap, "setObject:forKey:", v4, [v4 geoJunction]);
  }
  else {
    [(NSMutableArray *)self->_tileEdgeJunctions addObject:v4];
  }
}

- (id)junctionAtCoordinate:()Matrix<float
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  Matrix<float, 2, 1> v15 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  float v3 = self->_tileEdgeJunctions;
  id v4 = (id)[(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (unint64_t i = 0; i != v4; unint64_t i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v7 tileCoordinate];
        if (__PAIR64__(v9, v8) == v15)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = (id)[(NSMutableArray *)v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)junctionForGeoJunction:(GeoCodecsConnectivityJunction *)a3
{
  return [(NSMapTable *)self->_geoJunctionToJunctionMap objectForKey:a3];
}

- (VKLabelNavTileData)initWithTile:(const void *)a3
{
  v17.receiver = self;
  v17.super_class = (Class)VKLabelNavTileData;
  id v4 = [(VKLabelNavTileData *)&v17 init];
  uint64_t v5 = v4;
  if (v4)
  {
    id v7 = *(LabelTile **)a3;
    uint64_t v6 = *((void *)a3 + 1);
    if (v6) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v6 + 8), 1uLL, memory_order_relaxed);
    }
    cntrl = (std::__shared_weak_count *)v4->_tile.__cntrl_;
    v4->_tile.__ptr_ = v7;
    v4->_tile.__cntrl_ = (__shared_weak_count *)v6;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F28E10]) initWithKeyOptions:1282 valueOptions:0 capacity:5];
    geoJunctionToJunctionMap = v5->_geoJunctionToJunctionMap;
    v5->_geoJunctionToJunctionMap = (NSMapTable *)v9;

    long long v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    tileEdgeJunctions = v5->_tileEdgeJunctions;
    v5->_tileEdgeJunctions = v11;

    long long v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    oppositeCarriagewayJunctions = v5->_oppositeCarriagewayJunctions;
    v5->_oppositeCarriagewayJunctions = v13;

    Matrix<float, 2, 1> v15 = v5;
  }

  return v5;
}

@end