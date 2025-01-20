@interface VKPolygonalItemGroup
- (BOOL)canAcceptPolygon:(void *)a3;
- (BOOL)hasFeatureId:(unint64_t)a3;
- (BOOL)isFixedSize;
- (Matrix<float,)centroid;
- (Matrix<float,)size;
- (VKPolygonalItemGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6;
- (VKPolygonalItemGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6 storage:(shared_ptr<md::MeshSetStorage>)a7;
- (const)attributeSets;
- (const)commitRangesToFillRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long;
- (const)commitRangesToHorizontalVenueWallStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5;
- (const)commitRangesToStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long;
- (const)commitRangesToVenueWallEndCapRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5;
- (const)commitRangesToVenueWallRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5;
- (const)commitRangesToVerticalVenueWallStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5;
- (const)featureIds;
- (const)maxPoint;
- (const)origin;
- (float)tileZoom;
- (id).cxx_construct;
- (unsigned)cullingMask;
- (unsigned)indexForGeoFeatureAttributes:(const void *)a3;
- (unsigned)maxAttributeSetsPerGroup;
- (void)clearRouteAttributes;
- (void)didFinishAddingData;
- (void)fillMeshes;
- (void)setRouteAttributes:(const PolygonRouteAttributes *)a3;
- (void)styleQueries:(const StyleQueryOverride *)a3;
- (void)updateCachedStyles;
- (void)willAddDataWithAccessor:(ResourceAccessor *)a3;
@end

@implementation VKPolygonalItemGroup

- (id).cxx_construct
{
  self->_fillMeshInfo._hasValue = 0;
  bzero(&self->_fillMeshes, 0x948uLL);
  self->_polygonEdges.__table_.__p3_.__value_ = 1.0;
  self->_featureIds.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_featureIds.__table_.__p1_.__value_.__next_ = 0u;
  self->_featureIds.__table_.__p3_.__value_ = 1.0;
  self->_attributeSets._set.__tree_.__pair1_.__value_.__left_ = 0;
  *(_OWORD *)&self->_attributeSets._set.__tree_.__pair3_.__value_ = 0u;
  *(_OWORD *)&self->_fillRenderItemBatchers.__begin_ = 0u;
  *(_OWORD *)&self->_fillRenderItemBatchers.__end_cap_.__value_ = 0u;
  *(_OWORD *)&self->_strokeRenderItemBatchers.__end_ = 0u;
  self->_attributeSets._set.__tree_.__begin_node_ = &self->_attributeSets._set.__tree_.__pair1_;
  *(_OWORD *)&self->_attributeSets._array.__end_ = 0u;
  self->_attributeSets._array.__end_cap_.__value__2._allocator = (Allocator *)geo::codec::Allocator::instance(v3);
  self->_styleQueries.__table_.__bucket_list_ = 0u;
  *(_OWORD *)&self->_styleQueries.__table_.__p1_.__value_.__next_ = 0u;
  self->_styleQueries.__table_.__p3_.__value_ = 1.0;
  self->_styleManager = 0u;
  *(__shared_weak_count **)((char *)&self->_styleManager.__cntrl_ + 6) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_styleManager.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    next = self->_styleQueries.__table_.__p1_.__value_.__next_;
    if (!next) {
      goto LABEL_16;
    }
  }
  else
  {
    next = self->_styleQueries.__table_.__p1_.__value_.__next_;
    if (!next) {
      goto LABEL_16;
    }
  }
  do
  {
    v6 = (void *)*next;
    uint64_t v7 = next[3];
    if (v7)
    {
      uint64_t v8 = next[4];
      v5 = (void *)next[3];
      if (v8 != v7)
      {
        do
        {
          v9 = *(std::__shared_weak_count **)(v8 - 8);
          if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *, SEL))v9->__on_zero_shared)(v9, a2);
            std::__shared_weak_count::__release_weak(v9);
          }
          v8 -= 16;
        }
        while (v8 != v7);
        v5 = (void *)next[3];
      }
      next[4] = v7;
      operator delete(v5);
    }
    operator delete(next);
    next = v6;
  }
  while (v6);
LABEL_16:
  value = self->_styleQueries.__table_.__bucket_list_.__ptr_.__value_;
  self->_styleQueries.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  begin = (char *)self->_attributeSets._array.__begin_;
  if (begin)
  {
    end = (char *)self->_attributeSets._array.__end_;
    v13 = self->_attributeSets._array.__begin_;
    if (end != begin)
    {
      do
      {
        v14 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v14 && !atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, void *))v14->__on_zero_shared)(v14, v13);
          std::__shared_weak_count::__release_weak(v14);
        }
        end -= 16;
      }
      while (end != begin);
      v13 = self->_attributeSets._array.__begin_;
    }
    self->_attributeSets._array.__end_ = begin;
    (*(void (**)(Allocator *, void *, int64_t))(*(void *)self->_attributeSets._array.__end_cap_.__value__2._allocator
                                                                + 40))(self->_attributeSets._array.__end_cap_.__value__2._allocator, v13, (char *)self->_attributeSets._array.__end_cap_.__value_ - (char *)v13);
  }
  std::__tree<gdc::LayerDataWithWorld>::destroy((void *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_);
  v15 = self->_strokeRenderItemBatchers.__begin_;
  if (v15)
  {
    std::vector<ggl::Batcher>::__base_destruct_at_end[abi:nn180100]((uint64_t)&self->_strokeRenderItemBatchers, (uint64_t)v15);
    operator delete(self->_strokeRenderItemBatchers.__begin_);
  }
  v16 = self->_fillRenderItemBatchers.__begin_;
  if (v16)
  {
    std::vector<ggl::Batcher>::__base_destruct_at_end[abi:nn180100]((uint64_t)&self->_fillRenderItemBatchers, (uint64_t)v16);
    operator delete(self->_fillRenderItemBatchers.__begin_);
  }
  v17 = self->_featureIds.__table_.__p1_.__value_.__next_;
  if (v17)
  {
    do
    {
      v18 = (void *)*v17;
      operator delete(v17);
      v17 = v18;
    }
    while (v18);
  }
  v19 = self->_featureIds.__table_.__bucket_list_.__ptr_.__value_;
  self->_featureIds.__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v19) {
    operator delete(v19);
  }
  p_polygonEdges = &self->_polygonEdges;
  v21 = self->_polygonEdges.__table_.__p1_.__value_.__next_;
  if (v21)
  {
    do
    {
      v25 = (void *)*v21;
      v26 = (void *)v21[4];
      if (v26)
      {
        v21[5] = v26;
        operator delete(v26);
      }
      operator delete(v21);
      v21 = v25;
    }
    while (v25);
  }
  v22 = p_polygonEdges->__table_.__bucket_list_.__ptr_.__value_;
  p_polygonEdges->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (v22) {
    operator delete(v22);
  }
  p_venueWallVerticalStrokeCullingGroups = &self->_venueWallVerticalStrokeCullingGroups;
  v24 = &self->_polygonEdges;
  do
  {
    v29 = (void **)v24[-1].__table_.__p1_.__value_.__next_;
    v24 = (unordered_map<std::pair<const void *, unsigned long>, std::vector<md::Edge>, std::hash<md::SectionKey>, std::equal_to<std::pair<const void *, unsigned long>>, std::allocator<std::pair<const std::pair<const void *, unsigned long>, std::vector<md::Edge>>>> *)((char *)v24 - 24);
    v28 = v29;
    if (v29)
    {
      unint64_t v30 = p_polygonEdges[-1].__table_.__p2_.__value_;
      v27 = v28;
      if ((void **)v30 != v28)
      {
        unint64_t v31 = p_polygonEdges[-1].__table_.__p2_.__value_;
        do
        {
          v33 = *(void **)(v31 - 24);
          v31 -= 24;
          v32 = v33;
          if (v33)
          {
            *(void *)(v30 - 16) = v32;
            operator delete(v32);
          }
          unint64_t v30 = v31;
        }
        while ((void **)v31 != v28);
        v27 = v24->__table_.__bucket_list_.__ptr_.__value_;
      }
      p_polygonEdges[-1].__table_.__p2_.__value_ = (unint64_t)v28;
      operator delete(v27);
    }
    p_polygonEdges = v24;
  }
  while (v24 != (unordered_map<std::pair<const void *, unsigned long>, std::vector<md::Edge>, std::hash<md::SectionKey>, std::equal_to<std::pair<const void *, unsigned long>>, std::allocator<std::pair<const std::pair<const void *, unsigned long>, std::vector<md::Edge>>>> *)p_venueWallVerticalStrokeCullingGroups);
  p_venueWallHorizontalStrokeCullingGroups = &self->_venueWallHorizontalStrokeCullingGroups;
  v35 = &self->_venueWallVerticalStrokeCullingGroups;
  do
  {
    v38 = (char *)v35[-1].__elems_[15].__begin_;
    v35 = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)((char *)v35 - 24);
    v37 = v38;
    if (v38)
    {
      v39 = (char *)p_venueWallVerticalStrokeCullingGroups[-1].__elems_[15].__end_;
      v36 = v37;
      if (v39 != v37)
      {
        v40 = (char *)p_venueWallVerticalStrokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v42 = (void *)*((void *)v40 - 3);
          v40 -= 24;
          v41 = v42;
          if (v42)
          {
            *((void *)v39 - 2) = v41;
            operator delete(v41);
          }
          v39 = v40;
        }
        while (v40 != v37);
        v36 = v35->__elems_[0].__begin_;
      }
      p_venueWallVerticalStrokeCullingGroups[-1].__elems_[15].__end_ = v37;
      operator delete(v36);
    }
    p_venueWallVerticalStrokeCullingGroups = v35;
  }
  while (v35 != p_venueWallHorizontalStrokeCullingGroups);
  p_venueEndCapCullingGroups = &self->_venueEndCapCullingGroups;
  v44 = &self->_venueWallHorizontalStrokeCullingGroups;
  do
  {
    v47 = (char *)v44[-1].__elems_[15].__begin_;
    v44 = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)((char *)v44 - 24);
    v46 = v47;
    if (v47)
    {
      v48 = (char *)p_venueWallHorizontalStrokeCullingGroups[-1].__elems_[15].__end_;
      v45 = v46;
      if (v48 != v46)
      {
        v49 = (char *)p_venueWallHorizontalStrokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v51 = (void *)*((void *)v49 - 3);
          v49 -= 24;
          v50 = v51;
          if (v51)
          {
            *((void *)v48 - 2) = v50;
            operator delete(v50);
          }
          v48 = v49;
        }
        while (v49 != v46);
        v45 = v44->__elems_[0].__begin_;
      }
      p_venueWallHorizontalStrokeCullingGroups[-1].__elems_[15].__end_ = v46;
      operator delete(v45);
    }
    p_venueWallHorizontalStrokeCullingGroups = v44;
  }
  while (v44 != p_venueEndCapCullingGroups);
  p_venueCullingGroups = &self->_venueCullingGroups;
  v53 = &self->_venueEndCapCullingGroups;
  do
  {
    v56 = (char *)v53[-1].__elems_[15].__begin_;
    v53 = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)((char *)v53 - 24);
    v55 = v56;
    if (v56)
    {
      v57 = (char *)p_venueEndCapCullingGroups[-1].__elems_[15].__end_;
      v54 = v55;
      if (v57 != v55)
      {
        v58 = (char *)p_venueEndCapCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v60 = (void *)*((void *)v58 - 3);
          v58 -= 24;
          v59 = v60;
          if (v60)
          {
            *((void *)v57 - 2) = v59;
            operator delete(v59);
          }
          v57 = v58;
        }
        while (v58 != v55);
        v54 = v53->__elems_[0].__begin_;
      }
      p_venueEndCapCullingGroups[-1].__elems_[15].__end_ = v55;
      operator delete(v54);
    }
    p_venueEndCapCullingGroups = v53;
  }
  while (v53 != p_venueCullingGroups);
  p_strokeCullingGroups = &self->_strokeCullingGroups;
  v62 = &self->_venueCullingGroups;
  do
  {
    v65 = (char *)v62[-1].__elems_[15].__begin_;
    v62 = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)((char *)v62 - 24);
    v64 = v65;
    if (v65)
    {
      v66 = (char *)p_venueCullingGroups[-1].__elems_[15].__end_;
      v63 = v64;
      if (v66 != v64)
      {
        v67 = (char *)p_venueCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v69 = (void *)*((void *)v67 - 3);
          v67 -= 24;
          v68 = v69;
          if (v69)
          {
            *((void *)v66 - 2) = v68;
            operator delete(v68);
          }
          v66 = v67;
        }
        while (v67 != v64);
        v63 = v62->__elems_[0].__begin_;
      }
      p_venueCullingGroups[-1].__elems_[15].__end_ = v64;
      operator delete(v63);
    }
    p_venueCullingGroups = v62;
  }
  while (v62 != p_strokeCullingGroups);
  v70 = (VKPolygonalItemGroup *)&self->_strokeCullingGroups;
  do
  {
    ptr = (objc_class *)v70[-1]._styleManager.__ptr_;
    v70 = (VKPolygonalItemGroup *)((char *)v70 - 24);
    v72 = ptr;
    if (ptr)
    {
      v74 = (objc_class *)p_strokeCullingGroups[-1].__elems_[15].__end_;
      Class isa = v72;
      if (v74 != v72)
      {
        v75 = (objc_class *)p_strokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v77 = (void *)*((void *)v75 - 3);
          v75 = (objc_class *)((char *)v75 - 24);
          v76 = v77;
          if (v77)
          {
            *((void *)v74 - 2) = v76;
            operator delete(v76);
          }
          v74 = v75;
        }
        while (v75 != v72);
        Class isa = v70->super.isa;
      }
      p_strokeCullingGroups[-1].__elems_[15].__end_ = v72;
      operator delete(isa);
    }
    p_strokeCullingGroups = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v70;
  }
  while (v70 != (VKPolygonalItemGroup *)&self->_fillCullingGroups);
  v78 = self->_meshStorage.__cntrl_;
  if (v78 && !atomic_fetch_add((atomic_ullong *volatile)v78 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v78 + 16))(v78);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v78);
    v79 = (char *)self->_fillMeshes.__begin_;
    if (!v79) {
      goto LABEL_112;
    }
  }
  else
  {
    v79 = (char *)self->_fillMeshes.__begin_;
    if (!v79) {
      goto LABEL_112;
    }
  }
  v80 = (char *)self->_fillMeshes.__end_;
  v81 = v79;
  if (v80 != v79)
  {
    do
    {
      v82 = (std::__shared_weak_count *)*((void *)v80 - 1);
      if (v82 && !atomic_fetch_add(&v82->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
        std::__shared_weak_count::__release_weak(v82);
      }
      v80 -= 16;
    }
    while (v80 != v79);
    v81 = self->_fillMeshes.__begin_;
  }
  self->_fillMeshes.__end_ = v79;
  operator delete(v81);
LABEL_112:
  if (self->_fillMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_fillMeshInfo._value);
    self->_fillMeshInfo._hasValue = 0;
  }
}

- (Matrix<float,)centroid
{
  float v2 = self->_centroid._e[0];
  float v3 = self->_centroid._e[1];
  result._e[1] = v3;
  result._e[0] = v2;
  return result;
}

- (BOOL)isFixedSize
{
  return self->_isFixedSize;
}

- (unsigned)cullingMask
{
  return self->_cullingMask;
}

- (void)clearRouteAttributes
{
  self->_hasRouteAttributes = 0;
  [(VKPolygonalItemGroup *)self updateCachedStyles];
}

- (void)setRouteAttributes:(const PolygonRouteAttributes *)a3
{
  self->_hasRouteAttributes = 1;
  unsigned int routeSignificance = a3->routeSignificance;
  *(_WORD *)&self->_routeAttributes.routeProximity = *(_WORD *)&a3->routeProximity;
  self->_routeAttributes.unsigned int routeSignificance = routeSignificance;
  [(VKPolygonalItemGroup *)self updateCachedStyles];
}

- (void)updateCachedStyles
{
  float v2 = self;
  p_styleQueries = &self->_styleQueries;
  v83 = &self->_styleQueries;
  if (self->_styleQueries.__table_.__p2_.__value_)
  {
    next = self->_styleQueries.__table_.__p1_.__value_.__next_;
    if (next)
    {
      do
      {
        v6 = (void *)*next;
        uint64_t v7 = next[3];
        if (v7)
        {
          uint64_t v8 = next[4];
          v5 = (void *)next[3];
          if (v8 != v7)
          {
            do
            {
              v9 = *(std::__shared_weak_count **)(v8 - 8);
              if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *, SEL))v9->__on_zero_shared)(v9, a2);
                std::__shared_weak_count::__release_weak(v9);
              }
              v8 -= 16;
            }
            while (v8 != v7);
            v5 = (void *)next[3];
            p_styleQueries = v83;
          }
          next[4] = v7;
          operator delete(v5);
        }
        operator delete(next);
        next = v6;
      }
      while (v6);
    }
    v2->_styleQueries.__table_.__p1_.__value_.__next_ = 0;
    unint64_t value = v2->_styleQueries.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
    if (value)
    {
      for (uint64_t i = 0; i != value; ++i)
        p_styleQueries->__table_.__bucket_list_.__ptr_.__value_[i] = 0;
    }
    v2->_styleQueries.__table_.__p2_.__value_ = 0;
  }
  uint64_t v93 = 0x101010000010000;
  begin = (uint64_t *)v2->_attributeSets._array.__begin_;
  if (v2->_attributeSets._array.__end_ != begin)
  {
    uint64_t v13 = 0;
    do
    {
      uint64_t v80 = v13;
      FeatureAttributeSet = md::createFeatureAttributeSet((gss::Allocator *)&v89, &begin[2 * v13]);
      uint64_t v85 = v92;
      v16 = v89;
      v15 = v90;
      uint64_t v17 = v90 - v89;
      if (v90 == v89)
      {
        unint64_t v21 = 0;
        v18 = 0;
        if (v89) {
          goto LABEL_28;
        }
      }
      else
      {
        if (v17 < 0) {
          abort();
        }
        FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, int64_t, uint64_t))(*(void *)v92 + 16))(v92, v90 - v89, 4);
        v18 = FeatureAttributeSet;
        uint64_t v19 = 0;
        uint64_t v20 = v17 >> 3;
        do
        {
          if ((gss::Allocator *)((char *)FeatureAttributeSet + v19)) {
            *(void *)((char *)FeatureAttributeSet + v19) = *(void *)&v16[v19];
          }
          v19 += 8;
        }
        while (&v16[v19] != v15);
        uint64_t v17 = (uint64_t)FeatureAttributeSet + v19;
        unint64_t v21 = (unint64_t)FeatureAttributeSet + 8 * v20;
        v16 = v89;
        if (v89)
        {
LABEL_28:
          v90 = v16;
          FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, char *, int64_t))(*(void *)v92 + 40))(v92, v16, v91 - v16);
        }
      }
      if (v2->_hasRouteAttributes)
      {
        if (!v2->_routeAttributes.hasRouteSignificance)
        {
          unint64_t v22 = v17;
          goto LABEL_63;
        }
        if (v17 < v21)
        {
          if (v17)
          {
            *(_DWORD *)uint64_t v17 = 44;
            *(_WORD *)(v17 + 4) = v2->_routeAttributes.routeSignificance;
          }
          unint64_t v22 = v17 + 8;
LABEL_63:
          __int16 routeProximity = v2->_routeAttributes.routeProximity;
          unint64_t v81 = v21;
          if (v22 < v21)
          {
            if (v22)
            {
              *(_DWORD *)unint64_t v22 = 44;
              *(_WORD *)(v22 + 4) = routeProximity;
            }
            uint64_t v17 = v22 + 8;
            goto LABEL_91;
          }
          uint64_t v37 = (uint64_t)(v22 - (void)v18) >> 3;
          unint64_t v38 = v37 + 1;
          if ((unint64_t)(v37 + 1) >> 61) {
            abort();
          }
          if ((uint64_t)(v21 - (void)v18) >> 2 > v38) {
            unint64_t v38 = (uint64_t)(v21 - (void)v18) >> 2;
          }
          if (v21 - (unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
            uint64_t v39 = 0x1FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v39 = v38;
          }
          if (v39)
          {
            FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v85 + 16))(v85, 8 * v39, 4);
            uint64_t v40 = (uint64_t)FeatureAttributeSet + 8 * v37;
            uint64_t v39 = (uint64_t)FeatureAttributeSet + 8 * v39;
            if (FeatureAttributeSet)
            {
              *(_DWORD *)uint64_t v40 = 44;
              *(_WORD *)(v40 + 4) = routeProximity;
            }
            unint64_t v41 = v22 - (void)v18;
            if ((gss::Allocator *)v22 != v18)
            {
LABEL_77:
              unint64_t v42 = v41 - 8;
              if (v42 < 0x38 || v22 - v40 < 0x20)
              {
                v44 = (gss::Allocator *)v22;
                uint64_t v49 = v40;
              }
              else
              {
                uint64_t v43 = (v42 >> 3) + 1;
                v44 = (gss::Allocator *)(v22 - 8 * (v43 & 0x3FFFFFFFFFFFFFFCLL));
                v45 = (_OWORD *)(v40 - 16);
                v46 = (long long *)(v22 - 16);
                uint64_t v47 = v43 & 0x3FFFFFFFFFFFFFFCLL;
                do
                {
                  long long v48 = *v46;
                  *(v45 - 1) = *(v46 - 1);
                  _OWORD *v45 = v48;
                  v45 -= 2;
                  v46 -= 2;
                  v47 -= 4;
                }
                while (v47);
                uint64_t v49 = v40 - 8 * (v43 & 0x3FFFFFFFFFFFFFFCLL);
                if (v43 == (v43 & 0x3FFFFFFFFFFFFFFCLL))
                {
LABEL_88:
                  unint64_t v22 = (unint64_t)v18;
                  uint64_t v17 = v40 + 8;
                  if (v18) {
LABEL_89:
                  }
                    FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, unint64_t, unint64_t))(*(void *)v85 + 40))(v85, v22, v81 - v22);
LABEL_90:
                  unint64_t v81 = v39;
                  v18 = (gss::Allocator *)v49;
                  goto LABEL_91;
                }
              }
              do
              {
                uint64_t v50 = *((void *)v44 - 1);
                v44 = (gss::Allocator *)((char *)v44 - 8);
                *(void *)(v49 - 8) = v50;
                v49 -= 8;
              }
              while (v44 != v18);
              goto LABEL_88;
            }
          }
          else
          {
            uint64_t v40 = 8 * v37;
            unint64_t v41 = v22 - (void)v18;
            if ((gss::Allocator *)v22 != v18) {
              goto LABEL_77;
            }
          }
          uint64_t v49 = v40;
          uint64_t v17 = v40 + 8;
          if (v22) {
            goto LABEL_89;
          }
          goto LABEL_90;
        }
        uint64_t v23 = (v17 - (uint64_t)v18) >> 3;
        unint64_t v24 = v23 + 1;
        unint64_t v82 = v21;
        if ((unint64_t)(v23 + 1) >> 61) {
          abort();
        }
        if ((uint64_t)(v21 - (void)v18) >> 2 > v24) {
          unint64_t v24 = (uint64_t)(v21 - (void)v18) >> 2;
        }
        if (v21 - (unint64_t)v18 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v21 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v24;
        }
        if (v21)
        {
          FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, unint64_t, uint64_t))(*(void *)v85 + 16))(v85, 8 * v21, 4);
          uint64_t v25 = (uint64_t)FeatureAttributeSet + 8 * v23;
          unint64_t v21 = (unint64_t)FeatureAttributeSet + 8 * v21;
          if (FeatureAttributeSet)
          {
            *(_DWORD *)uint64_t v25 = 44;
            *(_WORD *)(v25 + 4) = v2->_routeAttributes.routeSignificance;
          }
          uint64_t v26 = v17 - (void)v18;
          if ((gss::Allocator *)v17 != v18)
          {
LABEL_49:
            unint64_t v27 = v26 - 8;
            if (v27 < 0x38 || (unint64_t)(v17 - v25) < 0x20)
            {
              uint64_t v29 = v17;
              uint64_t v34 = v25;
            }
            else
            {
              uint64_t v28 = (v27 >> 3) + 1;
              uint64_t v29 = v17 - 8 * (v28 & 0x3FFFFFFFFFFFFFFCLL);
              unint64_t v30 = (_OWORD *)(v25 - 16);
              unint64_t v31 = (long long *)(v17 - 16);
              uint64_t v32 = v28 & 0x3FFFFFFFFFFFFFFCLL;
              do
              {
                long long v33 = *v31;
                *(v30 - 1) = *(v31 - 1);
                *unint64_t v30 = v33;
                v30 -= 2;
                v31 -= 2;
                v32 -= 4;
              }
              while (v32);
              uint64_t v34 = v25 - 8 * (v28 & 0x3FFFFFFFFFFFFFFCLL);
              if (v28 == (v28 & 0x3FFFFFFFFFFFFFFCLL))
              {
LABEL_60:
                uint64_t v17 = (uint64_t)v18;
                unint64_t v22 = v25 + 8;
                if (v18) {
LABEL_61:
                }
                  FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, uint64_t, unint64_t))(*(void *)v85 + 40))(v85, v17, v82 - v17);
LABEL_62:
                v18 = (gss::Allocator *)v34;
                goto LABEL_63;
              }
            }
            do
            {
              uint64_t v35 = *(void *)(v29 - 8);
              v29 -= 8;
              *(void *)(v34 - 8) = v35;
              v34 -= 8;
            }
            while ((gss::Allocator *)v29 != v18);
            goto LABEL_60;
          }
        }
        else
        {
          uint64_t v25 = 8 * v23;
          uint64_t v26 = v17 - (void)v18;
          if ((gss::Allocator *)v17 != v18) {
            goto LABEL_49;
          }
        }
        uint64_t v34 = v25;
        unint64_t v22 = v25 + 8;
        if (v17) {
          goto LABEL_61;
        }
        goto LABEL_62;
      }
      unint64_t v81 = v21;
LABEL_91:
      uint64_t v51 = 0;
      uint64_t v52 = v17 - (void)v18;
      uint64_t v84 = (v17 - (uint64_t)v18) >> 3;
      v53 = (unsigned __int8 *)&v93;
      do
      {
        __int16 v54 = *v53;
        memset(v87, 0, sizeof(v87));
        uint64_t v55 = gss::Allocator::instance(FeatureAttributeSet);
        uint64_t v56 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v55 + 16))(v55, 26, 1);
        *(void *)v87 = v56;
        *(_WORD *)&v87[8] = 18;
        *(_WORD *)&v87[12] = 4;
        *(_DWORD *)uint64_t v56 = 65538;
        *(_WORD *)(v56 + 18) = v54;
        *(_DWORD *)(v56 + 4) = 65613;
        *(_WORD *)(v56 + 20) = 0;
        *(_WORD *)&v87[10] = 2;
        char v88 = 0;
        *(_WORD *)(v56 + 20) = *((unsigned __int8 *)&v93 + 2 * v51 + 1);
        uint64_t ptr = (uint64_t)v2->_styleManager.__ptr_;
        v89 = 0;
        v90 = 0;
        v91 = 0;
        uint64_t v92 = v85;
        if ((gss::Allocator *)v17 != v18)
        {
          if (v52 < 0) {
            abort();
          }
          v59 = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v85 + 16))(v85, v52, 4);
          v89 = v59;
          v90 = v59;
          v91 = &v59[8 * v84];
          v60 = v18;
          do
          {
            if (v59) {
              *(void *)v59 = *(void *)v60;
            }
            v60 = (gss::Allocator *)((char *)v60 + 8);
            v59 += 8;
          }
          while (v60 != (gss::Allocator *)v17);
          v90 = v59;
        }
        gss::FeatureAttributeSet::sort((gss::FeatureAttributeSet *)&v89);
        gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((uint64_t **)&v86, ptr, (gss::FeatureAttributeSet *)&v89, (gss::QueryOverrides *)v87);
        v61 = v18;
        v63 = (_OWORD *)*((void *)v57 + 1);
        unint64_t v62 = *((void *)v57 + 2);
        if ((unint64_t)v63 >= v62)
        {
          uint64_t v65 = ((uint64_t)v63 - *(void *)v57) >> 4;
          if ((unint64_t)(v65 + 1) >> 60) {
            abort();
          }
          uint64_t v66 = v62 - *(void *)v57;
          uint64_t v67 = v66 >> 3;
          if (v66 >> 3 <= (unint64_t)(v65 + 1)) {
            uint64_t v67 = v65 + 1;
          }
          if ((unint64_t)v66 >= 0x7FFFFFFFFFFFFFF0) {
            unint64_t v68 = 0xFFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v68 = v67;
          }
          if (v68 >> 60) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          FeatureAttributeSet = (gss::Allocator *)operator new(16 * v68);
          v69 = (_OWORD *)((char *)FeatureAttributeSet + 16 * v65);
          _OWORD *v69 = v86;
          v64 = v69 + 1;
          v70 = (char *)FeatureAttributeSet + 16 * v68;
          long long v86 = 0uLL;
          v71 = *(void **)v57;
          v72 = (void *)*((void *)v57 + 1);
          if (v72 == *(void **)v57)
          {
            *(void *)v57 = v69;
            *((void *)v57 + 1) = v64;
            *((void *)v57 + 2) = v70;
            if (!v72) {
              goto LABEL_120;
            }
LABEL_119:
            operator delete(v72);
            goto LABEL_120;
          }
          do
          {
            long long v73 = *((_OWORD *)v72 - 1);
            v72 -= 2;
            *--v69 = v73;
            void *v72 = 0;
            v72[1] = 0;
          }
          while (v72 != v71);
          v72 = *(void **)v57;
          v74 = (void *)*((void *)v57 + 1);
          *(void *)v57 = v69;
          *((void *)v57 + 1) = v64;
          *((void *)v57 + 2) = v70;
          if (v74 != v72)
          {
            v75 = v2;
            do
            {
              v76 = (std::__shared_weak_count *)*(v74 - 1);
              if (v76 && !atomic_fetch_add(&v76->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
              {
                ((void (*)(std::__shared_weak_count *))v76->__on_zero_shared)(v76);
                std::__shared_weak_count::__release_weak(v76);
              }
              v74 -= 2;
            }
            while (v74 != v72);
            float v2 = v75;
          }
          p_styleQueries = v83;
          if (v72) {
            goto LABEL_119;
          }
        }
        else
        {
          _OWORD *v63 = v86;
          v64 = v63 + 1;
          long long v86 = 0uLL;
        }
LABEL_120:
        *((void *)v57 + 1) = v64;
        v77 = (std::__shared_weak_count *)*((void *)&v86 + 1);
        if (*((void *)&v86 + 1)
          && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v86 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
          std::__shared_weak_count::__release_weak(v77);
        }
        v18 = v61;
        if (v89)
        {
          v90 = v89;
          FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, char *, int64_t))(*(void *)v92 + 40))(v92, v89, v91 - v89);
        }
        if (!v87[14])
        {
          uint64_t v78 = *(void *)v87;
          if (*(void *)v87)
          {
            uint64_t v79 = gss::Allocator::instance(FeatureAttributeSet);
            FeatureAttributeSet = (gss::Allocator *)(*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v79 + 40))(v79, v78, *(unsigned __int16 *)&v87[12]);
          }
        }
        ++v51;
        v53 = (unsigned __int8 *)&v93 + 2 * v51;
      }
      while (v51 != 4);
      if (v61) {
        (*(void (**)(uint64_t, gss::Allocator *, unint64_t))(*(void *)v85 + 40))(v85, v61, v81 - (void)v61);
      }
      uint64_t v13 = v80 + 1;
      begin = (uint64_t *)v2->_attributeSets._array.__begin_;
    }
    while (v80 + 1 < (unint64_t)(((char *)v2->_attributeSets._array.__end_ - (char *)begin) >> 4));
  }
}

- (const)featureIds
{
  return &self->_featureIds;
}

- (BOOL)hasFeatureId:(unint64_t)a3
{
  unint64_t value = self->_featureIds.__table_.__bucket_list_.__ptr_.__value__2.__data_.__value_;
  if (value)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)value);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] > 1uLL)
    {
      unint64_t v5 = a3;
      if (value <= a3) {
        unint64_t v5 = a3 % value;
      }
    }
    else
    {
      unint64_t v5 = (value - 1) & a3;
    }
    v6 = self->_featureIds.__table_.__bucket_list_.__ptr_.__value_[v5];
    if (v6)
    {
      v6 = (void *)*v6;
      if (v6)
      {
        if (v4.u32[0] < 2uLL)
        {
          unint64_t v7 = value - 1;
          while (1)
          {
            uint64_t v9 = v6[1];
            if (v9 == a3)
            {
              if (v6[2] == a3) {
                return v6 != 0;
              }
            }
            else if ((v9 & v7) != v5)
            {
              goto LABEL_21;
            }
            v6 = (void *)*v6;
            if (!v6) {
              return v6 != 0;
            }
          }
        }
        do
        {
          unint64_t v8 = v6[1];
          if (v8 == a3)
          {
            if (v6[2] == a3) {
              return v6 != 0;
            }
          }
          else
          {
            if (v8 >= value) {
              v8 %= value;
            }
            if (v8 != v5) {
              goto LABEL_21;
            }
          }
          v6 = (void *)*v6;
        }
        while (v6);
      }
    }
  }
  else
  {
LABEL_21:
    v6 = 0;
  }
  return v6 != 0;
}

- (BOOL)canAcceptPolygon:(void *)a3
{
  int64_t v5 = (char *)self->_attributeSets._array.__end_ - (char *)self->_attributeSets._array.__begin_;
  if ([(VKPolygonalItemGroup *)self maxAttributeSetsPerGroup] > (unint64_t)(v5 >> 4)) {
    return 1;
  }
  p_pair1 = &self->_attributeSets._set.__tree_.__pair1_;
  left = (char *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_;
  if (!left) {
    goto LABEL_10;
  }
  uint64_t v9 = *((void *)a3 + 3);
  v10 = &self->_attributeSets._set.__tree_.__pair1_;
  do
  {
    BOOL v11 = FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(*((void *)left + 4), v9);
    v12 = (char **)(left + 8);
    if (!v11)
    {
      v12 = (char **)left;
      v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)left;
    }
    left = *v12;
  }
  while (*v12);
  if (v10 == p_pair1
    || FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(v9, (uint64_t)v10[4].__value_.__left_))
  {
LABEL_10:
    v10 = p_pair1;
  }
  return v10 != p_pair1;
}

- (void)didFinishAddingData
{
  p_unint64_t value = &self->_fillMeshInfo._value;
  uint8x8_t v4 = md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::finishedWriting((uint64_t *)&self->_fillMeshInfo._value);
  p_fillMeshes = &self->_fillMeshes;
  begin = (char *)self->_fillMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_fillMeshes.__end_;
    unint64_t v8 = self->_fillMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        uint64_t v9 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
          std::__shared_weak_count::__release_weak(v9);
        }
        end -= 16;
      }
      while (end != begin);
      unint64_t v8 = p_fillMeshes->__begin_;
    }
    self->_fillMeshes.__end_ = begin;
    operator delete(v8);
    p_fillMeshes->__begin_ = 0;
    self->_fillMeshes.__end_ = 0;
    self->_fillMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&self->_fillMeshes.__begin_ = *(_OWORD *)v4;
  self->_fillMeshes.__end_cap_.__value_ = (void *)v4[2];
  *uint8x8_t v4 = 0;
  v4[1] = 0;
  v4[2] = 0;
  if (self->_fillMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)p_value);
    self->_fillMeshInfo._hasValue = 0;
  }
  *(_OWORD *)__p = 0u;
  *(_OWORD *)unint64_t v30 = 0u;
  int v31 = 1065353216;
  std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__move_assign((uint64_t)&self->_polygonEdges, (uint64_t *)__p);
  v10 = v30[0];
  if (v30[0])
  {
    do
    {
      uint64_t v19 = (void *)*v10;
      uint64_t v20 = (void *)v10[4];
      if (v20)
      {
        v10[5] = v20;
        operator delete(v20);
      }
      operator delete(v10);
      v10 = v19;
    }
    while (v19);
  }
  if (__p[0]) {
    operator delete(__p[0]);
  }
  uint64_t v11 = 0;
  p_featureIds = &self->_featureIds;
  do
  {
    uint64_t v13 = &self->_fillCullingGroups.__elems_[v11];
    v14 = (uint64_t *)v13->__begin_;
    v15 = (uint64_t *)v13->__end_;
    while (v14 != v15)
    {
      uint64_t v16 = *v14;
      uint64_t v17 = v14[1];
      while (v16 != v17)
      {
        unint64_t v18 = *(void *)(v16 + 16);
        if (v18) {
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)&self->_featureIds, v18, *(void *)(v16 + 16));
        }
        v16 += 24;
      }
      v14 += 3;
    }
    ++v11;
  }
  while (v11 != 16);
  uint64_t v21 = 0;
  p_venueCullingGroups = &self->_venueCullingGroups;
  do
  {
    uint64_t v23 = &p_venueCullingGroups->__elems_[v21];
    unint64_t v24 = (uint64_t *)v23->__begin_;
    uint64_t v25 = (uint64_t *)v23->__end_;
    while (v24 != v25)
    {
      uint64_t v26 = *v24;
      uint64_t v27 = v24[1];
      while (v26 != v27)
      {
        unint64_t v28 = *(void *)(v26 + 16);
        if (v28) {
          std::__hash_table<unsigned long long,std::hash<unsigned long long>,std::equal_to<unsigned long long>,std::allocator<unsigned long long>>::__emplace_unique_key_args<unsigned long long,unsigned long long const&>((uint64_t)p_featureIds, v28, *(void *)(v26 + 16));
        }
        v26 += 24;
      }
      v24 += 3;
    }
    ++v21;
  }
  while (v21 != 16);
}

- (void)willAddDataWithAccessor:(ResourceAccessor *)a3
{
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::createMeshes((uint64_t *)&self->_fillMeshInfo._value, (uint64_t)"Polygon Fill Mesh", (uint64_t)"Polygon Fill Vertex Data", (uint64_t)"Polygon Fill Index Data", a3, v3);
}

- (unsigned)indexForGeoFeatureAttributes:(const void *)a3
{
  p_pair1 = &self->_attributeSets._set.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_;
  uint64_t v7 = *(void *)a3;
  unint64_t v8 = &self->_attributeSets._set.__tree_.__pair1_;
  if (!left)
  {
LABEL_13:
    uint64_t v13 = (uint64_t *)operator new(0x30uLL);
    v14 = v13;
    uint64_t v15 = *((void *)a3 + 1);
    v13[4] = v7;
    v13[5] = v15;
    if (v15) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t *v13 = 0;
    v13[1] = 0;
    v13[2] = (uint64_t)v8;
    p_pair1->__value_.__left_ = v13;
    uint64_t v16 = *(void **)self->_attributeSets._set.__tree_.__begin_node_;
    if (v16)
    {
      self->_attributeSets._set.__tree_.__begin_node_ = v16;
      v14 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_, v14);
    ++self->_attributeSets._set.__tree_.__pair3_.__value_;
LABEL_18:
    end = (char *)self->_attributeSets._array.__end_;
    unint64_t value = (char *)self->_attributeSets._array.__end_cap_.__value_;
    if (end >= value)
    {
      begin = self->_attributeSets._array.__begin_;
      uint64_t v22 = (end - begin) >> 4;
      unint64_t v23 = v22 + 1;
      if ((unint64_t)(v22 + 1) >> 60) {
        abort();
      }
      uint64_t v24 = value - begin;
      if (v24 >> 3 > v23) {
        unint64_t v23 = v24 >> 3;
      }
      if ((unint64_t)v24 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v23 = 0xFFFFFFFFFFFFFFFLL;
      }
      if (v23)
      {
        uint64_t v25 = 16 * v23;
        uint64_t v26 = (*(uint64_t (**)(Allocator *, unint64_t, uint64_t))(*(void *)self->_attributeSets._array.__end_cap_.__value__2._allocator
                                                                                + 16))(self->_attributeSets._array.__end_cap_.__value__2._allocator, 16 * v23, 8);
        uint64_t v27 = (_OWORD *)(v26 + 16 * v22);
        unint64_t v23 = v26 + v25;
        if (v26)
        {
          long long v28 = *(_OWORD *)a3;
          *uint64_t v27 = *(_OWORD *)a3;
          if (*((void *)&v28 + 1)) {
            atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v28 + 1) + 8), 1uLL, memory_order_relaxed);
          }
        }
      }
      else
      {
        uint64_t v27 = (_OWORD *)(16 * v22);
      }
      uint64_t v20 = v27 + 1;
      uint64_t v34 = self->_attributeSets._array.__end_;
      uint64_t v35 = self->_attributeSets._array.__begin_;
      if (v34 == v35)
      {
        self->_attributeSets._array.__begin_ = v27;
        self->_attributeSets._array.__end_ = v20;
        unint64_t v38 = self->_attributeSets._array.__end_cap_.__value_;
        self->_attributeSets._array.__end_cap_.__value_ = (void *)v23;
      }
      else
      {
        do
        {
          long long v36 = *((_OWORD *)v34 - 1);
          v34 -= 2;
          *--uint64_t v27 = v36;
          *uint64_t v34 = 0;
          v34[1] = 0;
        }
        while (v34 != v35);
        uint64_t v34 = self->_attributeSets._array.__begin_;
        uint64_t v37 = self->_attributeSets._array.__end_;
        self->_attributeSets._array.__begin_ = v27;
        self->_attributeSets._array.__end_ = v20;
        unint64_t v38 = self->_attributeSets._array.__end_cap_.__value_;
        for (self->_attributeSets._array.__end_cap_.__value_ = (void *)v23; v37 != v34; v37 -= 2)
        {
          uint64_t v39 = (std::__shared_weak_count *)*(v37 - 1);
          if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
            std::__shared_weak_count::__release_weak(v39);
          }
        }
      }
      if (v34) {
        (*(void (**)(Allocator *, void *, int64_t))(*(void *)self->_attributeSets._array.__end_cap_.__value__2._allocator
      }
                                                                      + 40))(self->_attributeSets._array.__end_cap_.__value__2._allocator, v34, v38 - (unsigned char *)v34);
    }
    else
    {
      if (end)
      {
        uint64_t v19 = *((void *)a3 + 1);
        *(void *)end = *(void *)a3;
        *((void *)end + 1) = v19;
        if (v19) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(v19 + 8), 1uLL, memory_order_relaxed);
        }
      }
      uint64_t v20 = end + 16;
    }
    self->_attributeSets._array.__end_ = v20;
    return ((int64_t)((uint64_t)v20 - (unint64_t)self->_attributeSets._array.__begin_) >> 4) - 1;
  }
  uint64_t v9 = (char *)self->_attributeSets._set.__tree_.__pair1_.__value_.__left_;
  do
  {
    BOOL v10 = FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(*((void *)v9 + 4), v7);
    uint64_t v11 = (char **)(v9 + 8);
    if (!v10)
    {
      uint64_t v11 = (char **)v9;
      unint64_t v8 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)v9;
    }
    uint64_t v9 = *v11;
  }
  while (*v11);
  if (v8 == p_pair1
    || FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(v7, (uint64_t)v8[4].__value_.__left_))
  {
    while (1)
    {
      while (1)
      {
        unint64_t v8 = left;
        uint64_t v12 = (uint64_t)left[4].__value_.__left_;
        if (!FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(v7, v12)) {
          break;
        }
        left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)left->__value_.__left_;
        p_pair1 = v8;
        if (!v8->__value_.__left_) {
          goto LABEL_13;
        }
      }
      if (!FeatureStyleAttributesSet::FeatureStyleAttributesCompare::operator()(v12, v7)) {
        goto LABEL_18;
      }
      p_pair1 = left + 1;
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::shared_ptr<const FeatureStyleAttributes>, void *>>> *)left[1].__value_.__left_;
      if (!left) {
        goto LABEL_13;
      }
    }
  }
  uint64_t v29 = self->_attributeSets._array.__begin_;
  uint64_t v30 = (char *)self->_attributeSets._array.__end_ - (char *)v29;
  if (v30)
  {
    unint64_t v31 = v30 >> 4;
    if (v31 <= 1) {
      uint64_t v32 = 1;
    }
    else {
      uint64_t v32 = v31;
    }
    if (*(unsigned char *)(v7 + 33))
    {
      uint64_t v30 = 0;
      unint64_t v33 = *(unsigned __int8 *)(v7 + 33);
      while (1)
      {
        uint64_t v41 = v29[2 * v30];
        if (v33 == *(unsigned __int8 *)(v41 + 33))
        {
          unint64_t v42 = *(_DWORD **)v7;
          uint64_t v43 = *(_DWORD **)v41;
          if (**(_DWORD **)v7 == *v43 && v42[1] == v43[1]) {
            break;
          }
        }
LABEL_53:
        if (++v30 == v32) {
          goto LABEL_65;
        }
      }
      v44 = v43 + 3;
      v45 = v42 + 3;
      uint64_t v46 = 1;
      while (v33 != v46)
      {
        unint64_t v47 = v46;
        if (*(v45 - 1) == *(v44 - 1))
        {
          int v49 = *v45;
          v45 += 2;
          int v48 = v49;
          int v50 = *v44;
          v44 += 2;
          ++v46;
          if (v48 == v50) {
            continue;
          }
        }
        if (v47 >= v33) {
          return v30;
        }
        goto LABEL_53;
      }
    }
    else
    {
      uint64_t v30 = 0;
      while (*(unsigned char *)(*v29 + 33))
      {
        ++v30;
        v29 += 2;
        if (v32 == v30)
        {
LABEL_65:
          LOBYTE(v30) = v32;
          return v30;
        }
      }
    }
  }
  return v30;
}

- (const)commitRangesToVerticalVenueWallStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5
{
  uint64_t v9 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_venueWallVerticalStrokeCullingGroups = &self->_venueWallVerticalStrokeCullingGroups;
  v17[0] = &unk_1EF577370;
  unint64_t v18 = v17;
  *((void *)a3 + 1) = *(void *)a3;
  do
  {
    if ((a5 >> v9))
    {
      begin = (char *)p_venueWallVerticalStrokeCullingGroups->__elems_[v9].__begin_;
      if (0xAAAAAAAAAAAAAAABLL
         * (((char *)p_venueWallVerticalStrokeCullingGroups->__elems_[v9].__end_ - (char *)begin) >> 3) > a4)
      {
        uint64_t v12 = &begin[24 * a4];
        uint64_t v13 = *(void *)v12;
        uint64_t v14 = *((void *)v12 + 1);
        while (v13 != v14)
        {
          uint64_t v16 = *(void *)(v13 + 16);
          if (!v18)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(void *, uint64_t *))(*v18 + 48))(v18, &v16))
          {
            if (*(void *)(v13 + 8) != *(void *)v13) {
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v13);
            }
          }
          v13 += 24;
        }
      }
    }
    ++v9;
  }
  while (v9 != 16);
  if (v18 == v17)
  {
    v5.n128_f64[0] = (*(double (**)(void *, SEL))(v17[0] + 32))(v17, a2);
  }
  else if (v18)
  {
    (*(void (**)(void *))(*v18 + 40))(v18);
  }
  return ggl::Batcher::commit((long long **)a3, 0xC8u, v5);
}

- (const)commitRangesToHorizontalVenueWallStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5
{
  uint64_t v9 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_venueWallHorizontalStrokeCullingGroups = &self->_venueWallHorizontalStrokeCullingGroups;
  v17[0] = &unk_1EF577370;
  unint64_t v18 = v17;
  *((void *)a3 + 1) = *(void *)a3;
  do
  {
    if ((a5 >> v9))
    {
      begin = (char *)p_venueWallHorizontalStrokeCullingGroups->__elems_[v9].__begin_;
      if (0xAAAAAAAAAAAAAAABLL
         * (((char *)p_venueWallHorizontalStrokeCullingGroups->__elems_[v9].__end_ - (char *)begin) >> 3) > a4)
      {
        uint64_t v12 = &begin[24 * a4];
        uint64_t v13 = *(void *)v12;
        uint64_t v14 = *((void *)v12 + 1);
        while (v13 != v14)
        {
          uint64_t v16 = *(void *)(v13 + 16);
          if (!v18)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(void *, uint64_t *))(*v18 + 48))(v18, &v16))
          {
            if (*(void *)(v13 + 8) != *(void *)v13) {
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v13);
            }
          }
          v13 += 24;
        }
      }
    }
    ++v9;
  }
  while (v9 != 16);
  if (v18 == v17)
  {
    v5.n128_f64[0] = (*(double (**)(void *, SEL))(v17[0] + 32))(v17, a2);
  }
  else if (v18)
  {
    (*(void (**)(void *))(*v18 + 40))(v18);
  }
  return ggl::Batcher::commit((long long **)a3, 0xC8u, v5);
}

- (const)commitRangesToVenueWallEndCapRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5
{
  uint64_t v9 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_venueEndCapCullingGroups = &self->_venueEndCapCullingGroups;
  v17[0] = &unk_1EF577370;
  unint64_t v18 = v17;
  *((void *)a3 + 1) = *(void *)a3;
  do
  {
    if ((a5 >> v9))
    {
      begin = (char *)p_venueEndCapCullingGroups->__elems_[v9].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_venueEndCapCullingGroups->__elems_[v9].__end_ - (char *)begin) >> 3) > a4)
      {
        uint64_t v12 = &begin[24 * a4];
        uint64_t v13 = *(void *)v12;
        uint64_t v14 = *((void *)v12 + 1);
        while (v13 != v14)
        {
          uint64_t v16 = *(void *)(v13 + 16);
          if (!v18)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(void *, uint64_t *))(*v18 + 48))(v18, &v16))
          {
            if (*(void *)(v13 + 8) != *(void *)v13) {
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v13);
            }
          }
          v13 += 24;
        }
      }
    }
    ++v9;
  }
  while (v9 != 16);
  if (v18 == v17)
  {
    v5.n128_f64[0] = (*(double (**)(void *, SEL))(v17[0] + 32))(v17, a2);
  }
  else if (v18)
  {
    (*(void (**)(void *))(*v18 + 40))(v18);
  }
  return ggl::Batcher::commit((long long **)a3, 0xC8u, v5);
}

- (const)commitRangesToVenueWallRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5
{
  uint64_t v9 = 0;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  p_venueCullingGroups = &self->_venueCullingGroups;
  v17[0] = &unk_1EF577370;
  unint64_t v18 = v17;
  *((void *)a3 + 1) = *(void *)a3;
  do
  {
    if ((a5 >> v9))
    {
      begin = (char *)p_venueCullingGroups->__elems_[v9].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_venueCullingGroups->__elems_[v9].__end_ - (char *)begin) >> 3) > a4)
      {
        uint64_t v12 = &begin[24 * a4];
        uint64_t v13 = *(void *)v12;
        uint64_t v14 = *((void *)v12 + 1);
        while (v13 != v14)
        {
          uint64_t v16 = *(void *)(v13 + 16);
          if (!v18)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(void *, uint64_t *))(*v18 + 48))(v18, &v16))
          {
            if (*(void *)(v13 + 8) != *(void *)v13) {
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v13);
            }
          }
          v13 += 24;
        }
      }
    }
    ++v9;
  }
  while (v9 != 16);
  if (v18 == v17)
  {
    v5.n128_f64[0] = (*(double (**)(void *, SEL))(v17[0] + 32))(v17, a2);
  }
  else if (v18)
  {
    (*(void (**)(void *))(*v18 + 40))(v18);
  }
  return ggl::Batcher::commit((long long **)a3, 0xC8u, v5);
}

- (const)commitRangesToStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      uint64_t v21 = v20;
      (*(void (**)(function<BOOL (unsigned long long)> *, void *))(*(void *)a6->var0.var0.__lx + 24))(a6, v20);
    }
    else
    {
      uint64_t v21 = (void *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(void *)var1->var0.var0.__lx
                                                                                            + 16))(var1, a2);
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v12 = 0;
  p_strokeCullingGroups = &self->_strokeCullingGroups;
  *((void *)a3 + 1) = *(void *)a3;
  do
  {
    if ((a5 >> v12))
    {
      begin = (char *)p_strokeCullingGroups->__elems_[v12].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_strokeCullingGroups->__elems_[v12].__end_ - (char *)begin) >> 3) > a4)
      {
        uint64_t v15 = &begin[24 * a4];
        uint64_t v16 = *(void *)v15;
        uint64_t v17 = *((void *)v15 + 1);
        while (v16 != v17)
        {
          uint64_t v19 = *(void *)(v16 + 16);
          if (!v21)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(void *, uint64_t *))(*v21 + 48))(v21, &v19))
          {
            if (*(void *)(v16 + 8) != *(void *)v16) {
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v16);
            }
          }
          v16 += 24;
        }
      }
    }
    ++v12;
  }
  while (v12 != 16);
  if (v21 == v20)
  {
    v6.n128_f64[0] = (*(double (**)(void *))(v20[0] + 32))(v20);
  }
  else if (v21)
  {
    (*(void (**)(void *))(*v21 + 40))(v21);
  }
  return ggl::Batcher::commit((long long **)a3, 0, v6);
}

- (const)commitRangesToFillRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      uint64_t v21 = v20;
      (*(void (**)(function<BOOL (unsigned long long)> *, void *))(*(void *)a6->var0.var0.__lx + 24))(a6, v20);
    }
    else
    {
      uint64_t v21 = (void *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(void *)var1->var0.var0.__lx
                                                                                            + 16))(var1, a2);
    }
  }
  else
  {
    uint64_t v21 = 0;
  }
  uint64_t v12 = 0;
  p_fillCullingGroups = &self->_fillCullingGroups;
  *((void *)a3 + 1) = *(void *)a3;
  do
  {
    if ((a5 >> v12))
    {
      begin = (char *)p_fillCullingGroups->__elems_[v12].__begin_;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)p_fillCullingGroups->__elems_[v12].__end_ - (char *)begin) >> 3) > a4)
      {
        uint64_t v15 = &begin[24 * a4];
        uint64_t v16 = *(void *)v15;
        uint64_t v17 = *((void *)v15 + 1);
        while (v16 != v17)
        {
          uint64_t v19 = *(void *)(v16 + 16);
          if (!v21)
          {
            std::__throw_bad_function_call[abi:nn180100]();
            __break(1u);
          }
          if ((*(unsigned int (**)(void *, uint64_t *))(*v21 + 48))(v21, &v19))
          {
            if (*(void *)(v16 + 8) != *(void *)v16) {
              gm::MultiRange<unsigned long>::push_back((char **)a3, (_OWORD *)v16);
            }
          }
          v16 += 24;
        }
      }
    }
    ++v12;
  }
  while (v12 != 16);
  if (v21 == v20)
  {
    v6.n128_f64[0] = (*(double (**)(void *))(v20[0] + 32))(v20);
  }
  else if (v21)
  {
    (*(void (**)(void *))(*v21 + 40))(v21);
  }
  return ggl::Batcher::commit((long long **)a3, 0, v6);
}

- (void)fillMeshes
{
  return &self->_fillMeshes;
}

- (float)tileZoom
{
  return self->_tileZoom;
}

- (void)styleQueries:(const StyleQueryOverride *)a3
{
}

- (Matrix<float,)size
{
  float32x2_t v2 = vmaxnm_f32(vsub_f32(*(float32x2_t *)self->_boundingBox._maximum._e, *(float32x2_t *)self->_boundingBox._minimum._e), 0);
  float v3 = fmaxf(self->_boundingBox._maximum._e[2] - self->_boundingBox._minimum._e[2], 0.0);
  float v4 = v2.f32[1];
  result._e[0] = v2.f32[0];
  result._e[2] = v3;
  result._e[1] = v4;
  return result;
}

- (const)maxPoint
{
  return &self->_boundingBox._maximum;
}

- (const)origin
{
  return &self->_boundingBox;
}

- (const)attributeSets
{
  return &self->_attributeSets;
}

- (unsigned)maxAttributeSetsPerGroup
{
  return 16;
}

- (VKPolygonalItemGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6 storage:(shared_ptr<md::MeshSetStorage>)a7
{
  uint64_t ptr = a7.__ptr_;
  v42.receiver = self;
  v42.super_class = (Class)VKPolygonalItemGroup;
  uint64_t v12 = [(VKPolygonalItemGroup *)&v42 init];
  uint64_t v13 = v12;
  if (v12)
  {
    v12->_tileZoom = a4;
    v12->_contentScale = a6;
    uint64_t v14 = *(void *)a3;
    uint64_t v15 = *(std::__shared_weak_count **)(v14 + 16);
    if (v15 && (uint64_t v15 = std::__shared_weak_count::lock(v15)) != 0) {
      uint64_t v16 = *(void **)(v14 + 8);
    }
    else {
      uint64_t v16 = 0;
    }
    v13->_styleManager.__ptr_ = v16;
    cntrl = (std::__shared_weak_count *)v13->_styleManager.__cntrl_;
    v13->_styleManager.__cntrl_ = (__shared_weak_count *)v15;
    if (cntrl && !atomic_fetch_add(&cntrl->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
      std::__shared_weak_count::__release_weak(cntrl);
    }
    *(_OWORD *)v13->_boundingBox._minimum._e = xmmword_1A28FE640;
    *(void *)&v13->_boundingBox._maximum._e[1] = 0x80000000800000;
    if (a5)
    {
      v13->_centroid._e[0] = *(float *)a5;
      float v18 = *((float *)a5 + 1);
      char v19 = 1;
    }
    else
    {
      char v19 = 0;
      v13->_centroid._e[0] = 0.0;
      float v18 = 0.0;
    }
    v13->_isFixedSize = v19;
    v13->_centroid._e[1] = v18;
    uint64_t v21 = *(MeshSetStorage **)ptr;
    uint64_t v20 = *((void *)ptr + 1);
    if (v20) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v20 + 8), 1uLL, memory_order_relaxed);
    }
    uint64_t v22 = (std::__shared_weak_count *)v13->_meshStorage.__cntrl_;
    v13->_meshStorage.__ptr_ = v21;
    v13->_meshStorage.__cntrl_ = (__shared_weak_count *)v20;
    if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::MeshSet((uint64_t)&v25, (uint64_t)v13->_meshStorage.__ptr_);
    if (v13->_fillMeshInfo._hasValue)
    {
      md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::operator=((uint64_t)&v13->_fillMeshInfo._value, (uint64_t)&v25);
    }
    else
    {
      *(_OWORD *)v13->_fillMeshInfo._value.data = v25;
      *(void *)&v13->_anon_18[8] = v26;
      long long v25 = 0uLL;
      *(_OWORD *)&v13->_anon_18[16] = v27;
      *(void *)&v13->_anon_18[32] = v28;
      uint64_t v26 = 0;
      long long v27 = 0uLL;
      uint64_t v28 = 0;
      *(_OWORD *)&v13->_anon_18[40] = v29;
      *(_OWORD *)&v13->_anon_18[56] = v30;
      v13->_anon_18[72] = v31;
      v13->_anon_18[73] = v32;
      *(void *)&v13->_anon_18[80] = v33;
      long long v29 = 0uLL;
      *(_OWORD *)&v13->_anon_18[88] = v34;
      *(_OWORD *)&v13->_anon_18[104] = v35;
      v13->_anon_18[120] = v36;
      v13->_anon_18[121] = v37;
      *(void *)&v13->_anon_18[128] = v38;
      uint64_t v33 = 0;
      long long v34 = 0uLL;
      uint64_t v38 = 0;
      *(_OWORD *)&v13->_anon_18[136] = v39;
      long long v23 = v40;
      long long v40 = 0uLL;
      *(_OWORD *)&v13->_anon_18[152] = v23;
      *(void *)&v13->_anon_18[168] = v41;
      uint64_t v41 = 0;
      v13->_fillMeshInfo._hasValue = 1;
    }
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v25);
  }
  return v13;
}

- (VKPolygonalItemGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6
{
  uint64_t v9 = 0;
  BOOL v10 = 0;
  __n128 v6 = -[VKPolygonalItemGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](self, "initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:", a3, a5, &v9);
  uint64_t v7 = v10;
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }

  return v6;
}

@end