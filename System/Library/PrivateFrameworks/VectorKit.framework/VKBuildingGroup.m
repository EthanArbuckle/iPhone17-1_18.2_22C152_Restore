@interface VKBuildingGroup
- (BOOL)addPointyRoofForBuilding:(void *)a3 buildingModel:(unsigned __int8)a4 scaleThreshold:(float)a5 styleIndex:(float)a6;
- (BOOL)canConstructPointyRoofForPolygon:(void *)a3 building:(void *)a4 buildingModel:(unsigned __int8)a5 scaleThreshold:(float)a6;
- (VKBuildingGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6;
- (__n128)addBuilding:index:ofTotal:accessor:triangulator:prepareExtrusion:forRoofStyle:scaleThreshold:;
- (const)commitRangesToExtrusionFillRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long;
- (const)commitRangesToExtrusionStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long;
- (const)commitRangesToPointyRoofFillRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long;
- (const)commitRangesToPointyRoofStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long;
- (const)commitRangesToPointyRoofTopRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long;
- (const)extrusionFillMeshVendor;
- (const)extrusionStrokeMeshVendor;
- (const)pointyRoofFillMeshVendor;
- (const)pointyRoofStrokeMeshVendor;
- (id).cxx_construct;
- (unsigned)maxAttributeSetsPerGroup;
- (void)addBuilding:(void *)a3 index:(unint64_t)a4 ofTotal:(unint64_t)a5 accessor:(ResourceAccessor *)a6 triangulator:(void *)a7 prepareExtrusion:(BOOL)a8 forRoofStyle:(unsigned __int8)a9 scaleThreshold:(float)a10;
- (void)addBuilding:index:ofTotal:accessor:triangulator:prepareExtrusion:forRoofStyle:scaleThreshold:;
- (void)addExtrusionForBuilding:(void *)a3 index:(unint64_t)a4 ofTotal:(unint64_t)a5;
- (void)didFinishAddingData;
- (void)fillMeshesForPointyRoofs;
- (void)prepareForBuilding:(void *)a3 forRoofStyle:(unsigned __int8)a4 scaleThreshold:(float)a5;
- (void)strokeMeshes;
- (void)styleQueriesForPointyRoofs:(BOOL)a3 selected:(BOOL)a4;
- (void)updateWithStyleManager:(const void *)a3;
- (void)willAddDataWithAccessor:(ResourceAccessor *)a3;
@end

@implementation VKBuildingGroup

- (id).cxx_construct
{
  *((unsigned char *)self + 2840) = 0;
  *((unsigned char *)self + 3032) = 0;
  *((void *)self + 404) = 0;
  *((void *)self + 405) = 0;
  *((void *)self + 403) = 0;
  *((void *)self + 407) = 0;
  *((void *)self + 408) = 0;
  *((void *)self + 406) = 0;
  *((void *)self + 409) = 0;
  *((void *)self + 410) = 0;
  *((void *)self + 411) = 0;
  *((void *)self + 412) = 0;
  *(_OWORD *)((char *)self + 3304) = 0u;
  *(_OWORD *)((char *)self + 3320) = 0u;
  *(_OWORD *)((char *)self + 3336) = 0u;
  *(_OWORD *)((char *)self + 3352) = 0u;
  *(_OWORD *)((char *)self + 3368) = 0u;
  *(_OWORD *)((char *)self + 3384) = 0u;
  *(_OWORD *)((char *)self + 3400) = 0u;
  *(_OWORD *)((char *)self + 3416) = 0u;
  *(_OWORD *)((char *)self + 3432) = 0u;
  *(_OWORD *)((char *)self + 3448) = 0u;
  *(_OWORD *)((char *)self + 3464) = 0u;
  *(_OWORD *)((char *)self + 3480) = 0u;
  *(_OWORD *)((char *)self + 3496) = 0u;
  *(_OWORD *)((char *)self + 3512) = 0u;
  *(_OWORD *)((char *)self + 3528) = 0u;
  *(_OWORD *)((char *)self + 3544) = 0u;
  *(_OWORD *)((char *)self + 3560) = 0u;
  *(_OWORD *)((char *)self + 3576) = 0u;
  *(_OWORD *)((char *)self + 3592) = 0u;
  *(_OWORD *)((char *)self + 3608) = 0u;
  *(_OWORD *)((char *)self + 3624) = 0u;
  *(_OWORD *)((char *)self + 3640) = 0u;
  *(_OWORD *)((char *)self + 3656) = 0u;
  *(_OWORD *)((char *)self + 3672) = 0u;
  *(_OWORD *)((char *)self + 3688) = 0u;
  *(_OWORD *)((char *)self + 3704) = 0u;
  *(_OWORD *)((char *)self + 3720) = 0u;
  *(_OWORD *)((char *)self + 3736) = 0u;
  *(_OWORD *)((char *)self + 3752) = 0u;
  *(_OWORD *)((char *)self + 3768) = 0u;
  *(_OWORD *)((char *)self + 3784) = 0u;
  *(_OWORD *)((char *)self + 3800) = 0u;
  *(_OWORD *)((char *)self + 3816) = 0u;
  *(_OWORD *)((char *)self + 3832) = 0u;
  *(_OWORD *)((char *)self + 3848) = 0u;
  *(_OWORD *)((char *)self + 3864) = 0u;
  *(_OWORD *)((char *)self + 3880) = 0u;
  *(_OWORD *)((char *)self + 3896) = 0u;
  *(_OWORD *)((char *)self + 3912) = 0u;
  *(_OWORD *)((char *)self + 3928) = 0u;
  *(_OWORD *)((char *)self + 3944) = 0u;
  *(_OWORD *)((char *)self + 3960) = 0u;
  *(_OWORD *)((char *)self + 3976) = 0u;
  *(_OWORD *)((char *)self + 3992) = 0u;
  *(_OWORD *)((char *)self + 4008) = 0u;
  *(_OWORD *)((char *)self + 4024) = 0u;
  *(_OWORD *)((char *)self + 4040) = 0u;
  *(_OWORD *)((char *)self + 4056) = 0u;
  *(_OWORD *)((char *)self + 4072) = 0u;
  *(_OWORD *)((char *)self + 4088) = 0u;
  *(_OWORD *)((char *)self + 4104) = 0u;
  *(_OWORD *)((char *)self + 4120) = 0u;
  *(_OWORD *)((char *)self + 4136) = 0u;
  *(_OWORD *)((char *)self + 4152) = 0u;
  *(_OWORD *)((char *)self + 4168) = 0u;
  *(_OWORD *)((char *)self + 4184) = 0u;
  *(_OWORD *)((char *)self + 4200) = 0u;
  *(_OWORD *)((char *)self + 4216) = 0u;
  *(_OWORD *)((char *)self + 4232) = 0u;
  *(_OWORD *)((char *)self + 4248) = 0u;
  *(_OWORD *)((char *)self + 4264) = 0u;
  *(_OWORD *)((char *)self + 4280) = 0u;
  *(_OWORD *)((char *)self + 4296) = 0u;
  *(_OWORD *)((char *)self + 4312) = 0u;
  *(_OWORD *)((char *)self + 4328) = 0u;
  *(_OWORD *)((char *)self + 4344) = 0u;
  *(_OWORD *)((char *)self + 4360) = 0u;
  *(_OWORD *)((char *)self + 4376) = 0u;
  *(_OWORD *)((char *)self + 4392) = 0u;
  *(_OWORD *)((char *)self + 4408) = 0u;
  *(_OWORD *)((char *)self + 4424) = 0u;
  *(_OWORD *)((char *)self + 4440) = 0u;
  *(_OWORD *)((char *)self + 4456) = 0u;
  *(_OWORD *)((char *)self + 4472) = 0u;
  *(_OWORD *)((char *)self + 4488) = 0u;
  *(_OWORD *)((char *)self + 4504) = 0u;
  *(_OWORD *)((char *)self + 4520) = 0u;
  *(_OWORD *)((char *)self + 4536) = 0u;
  *(_OWORD *)((char *)self + 4552) = 0u;
  *(_OWORD *)((char *)self + 4568) = 0u;
  *(_OWORD *)((char *)self + 4584) = 0u;
  *(_OWORD *)((char *)self + 4600) = 0u;
  *(_OWORD *)((char *)self + 4616) = 0u;
  *(_OWORD *)((char *)self + 4632) = 0u;
  *(_OWORD *)((char *)self + 4648) = 0u;
  *(_OWORD *)((char *)self + 4664) = 0u;
  *(_OWORD *)((char *)self + 4680) = 0u;
  *(_OWORD *)((char *)self + 4696) = 0u;
  *(_OWORD *)((char *)self + 4712) = 0u;
  *(_OWORD *)((char *)self + 4728) = 0u;
  *(_OWORD *)((char *)self + 4744) = 0u;
  *(_OWORD *)((char *)self + 4760) = 0u;
  *(_OWORD *)((char *)self + 4776) = 0u;
  *(_OWORD *)((char *)self + 4792) = 0u;
  *(_OWORD *)((char *)self + 4808) = 0u;
  *(_OWORD *)((char *)self + 4824) = 0u;
  *(_OWORD *)((char *)self + 4840) = 0u;
  *(_OWORD *)((char *)self + 4856) = 0u;
  *(_OWORD *)((char *)self + 4872) = 0u;
  *(_OWORD *)((char *)self + 4888) = 0u;
  *(_OWORD *)((char *)self + 4904) = 0u;
  *(_OWORD *)((char *)self + 4920) = 0u;
  *(_OWORD *)((char *)self + 4936) = 0u;
  *(_OWORD *)((char *)self + 4952) = 0u;
  *(_OWORD *)((char *)self + 4968) = 0u;
  *(_OWORD *)((char *)self + 4984) = 0u;
  *(_OWORD *)((char *)self + 5000) = 0u;
  *(_OWORD *)((char *)self + 5016) = 0u;
  *(_OWORD *)((char *)self + 5032) = 0u;
  *(_OWORD *)((char *)self + 5048) = 0u;
  *(_OWORD *)((char *)self + 5064) = 0u;
  *(_OWORD *)((char *)self + 5080) = 0u;
  *(_OWORD *)((char *)self + 5096) = 0u;
  *(_OWORD *)((char *)self + 5112) = 0u;
  *(_OWORD *)((char *)self + 5128) = 0u;
  *(_OWORD *)((char *)self + 5144) = 0u;
  *(_OWORD *)((char *)self + 5160) = 0u;
  *(_OWORD *)((char *)self + 5176) = 0u;
  *(_OWORD *)((char *)self + 5192) = 0u;
  *(_OWORD *)((char *)self + 5208) = 0u;
  *((void *)self + 654) = 0;
  *((void *)self + 655) = 0;
  *((void *)self + 653) = 0;
  *((void *)self + 657) = 0;
  *((void *)self + 658) = 0;
  *((void *)self + 656) = 0;
  *((void *)self + 660) = 0;
  *((void *)self + 661) = 0;
  *((void *)self + 659) = 0;
  *((void *)self + 663) = 0;
  *((void *)self + 664) = 0;
  *((void *)self + 662) = 0;
  return self;
}

- (void).cxx_destruct
{
  p_selectedFlatRoofStyleQueries = &self->_selectedFlatRoofStyleQueries;
  begin = (char *)self->_selectedFlatRoofStyleQueries.__begin_;
  if (begin)
  {
    end = (char *)self->_selectedFlatRoofStyleQueries.__end_;
    v6 = self->_selectedFlatRoofStyleQueries.__begin_;
    if (end != begin)
    {
      do
      {
        v7 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v7 && !atomic_fetch_add(&v7->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v7->__on_zero_shared)(v7, a2);
          std::__shared_weak_count::__release_weak(v7);
        }
        end -= 16;
      }
      while (end != begin);
      v6 = p_selectedFlatRoofStyleQueries->__begin_;
    }
    p_selectedFlatRoofStyleQueries->__end_ = begin;
    operator delete(v6);
  }
  v8 = (char *)self->_selectedStyleQueries.__begin_;
  if (v8)
  {
    v9 = (char *)self->_selectedStyleQueries.__end_;
    v10 = self->_selectedStyleQueries.__begin_;
    if (v9 != v8)
    {
      do
      {
        v11 = (std::__shared_weak_count *)*((void *)v9 - 1);
        if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v11->__on_zero_shared)(v11, a2);
          std::__shared_weak_count::__release_weak(v11);
        }
        v9 -= 16;
      }
      while (v9 != v8);
      v10 = self->_selectedStyleQueries.__begin_;
    }
    self->_selectedStyleQueries.__end_ = v8;
    operator delete(v10);
  }
  v12 = (char *)self->_flatRoofStyleQueries.__begin_;
  if (v12)
  {
    v13 = (char *)self->_flatRoofStyleQueries.__end_;
    v14 = self->_flatRoofStyleQueries.__begin_;
    if (v13 != v12)
    {
      do
      {
        v15 = (std::__shared_weak_count *)*((void *)v13 - 1);
        if (v15 && !atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v15->__on_zero_shared)(v15, a2);
          std::__shared_weak_count::__release_weak(v15);
        }
        v13 -= 16;
      }
      while (v13 != v12);
      v14 = self->_flatRoofStyleQueries.__begin_;
    }
    self->_flatRoofStyleQueries.__end_ = v12;
    operator delete(v14);
  }
  v16 = (char *)self->_styleQueries.__begin_;
  if (v16)
  {
    v17 = (char *)self->_styleQueries.__end_;
    v18 = self->_styleQueries.__begin_;
    if (v17 != v16)
    {
      do
      {
        v19 = (std::__shared_weak_count *)*((void *)v17 - 1);
        if (v19 && !atomic_fetch_add(&v19->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v19->__on_zero_shared)(v19, a2);
          std::__shared_weak_count::__release_weak(v19);
        }
        v17 -= 16;
      }
      while (v17 != v16);
      v18 = self->_styleQueries.__begin_;
    }
    self->_styleQueries.__end_ = v16;
    operator delete(v18);
  }
  p_styleQueries = &self->_styleQueries;
  v21 = (VKBuildingGroup *)&self->_styleQueries;
  do
  {
    v24 = (objc_class *)v21[-1]._selectedFlatRoofStyleQueries.__begin_;
    v21 = (VKBuildingGroup *)((char *)v21 - 24);
    v23 = v24;
    if (v24)
    {
      v25 = (objc_class *)p_styleQueries[-1].__end_;
      Class isa = v23;
      if (v25 != v23)
      {
        v26 = (objc_class *)p_styleQueries[-1].__end_;
        do
        {
          v28 = (void *)*((void *)v26 - 3);
          v26 = (objc_class *)((char *)v26 - 24);
          v27 = v28;
          if (v28)
          {
            *((void *)v25 - 2) = v27;
            operator delete(v27);
          }
          v25 = v26;
        }
        while (v26 != v23);
        Class isa = v21->super.super.isa;
      }
      p_styleQueries[-1].__end_ = v23;
      operator delete(isa);
    }
    p_styleQueries = (vector<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>, std::allocator<std::shared_ptr<gss::StylesheetQuery<gss::PropertyID>>>> *)v21;
  }
  while (v21 != (VKBuildingGroup *)&self->_pointyRoofStrokeCullingGroups);
  p_pointyRoofStrokeCullingGroups = &self->_pointyRoofStrokeCullingGroups;
  v30 = (VKBuildingGroup *)&self->_pointyRoofStrokeCullingGroups;
  do
  {
    v33 = (objc_class *)v30[-1]._selectedFlatRoofStyleQueries.__begin_;
    v30 = (VKBuildingGroup *)((char *)v30 - 24);
    v32 = v33;
    if (v33)
    {
      v34 = (objc_class *)p_pointyRoofStrokeCullingGroups[-1].__elems_[15].__end_;
      Class v31 = v32;
      if (v34 != v32)
      {
        v35 = (objc_class *)p_pointyRoofStrokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v37 = (void *)*((void *)v35 - 3);
          v35 = (objc_class *)((char *)v35 - 24);
          v36 = v37;
          if (v37)
          {
            *((void *)v34 - 2) = v36;
            operator delete(v36);
          }
          v34 = v35;
        }
        while (v35 != v32);
        Class v31 = v30->super.super.isa;
      }
      p_pointyRoofStrokeCullingGroups[-1].__elems_[15].__end_ = v32;
      operator delete(v31);
    }
    p_pointyRoofStrokeCullingGroups = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v30;
  }
  while (v30 != (VKBuildingGroup *)&self->_pointyRoofFillCullingGroups);
  p_pointyRoofFillCullingGroups = &self->_pointyRoofFillCullingGroups;
  v39 = (VKBuildingGroup *)&self->_pointyRoofFillCullingGroups;
  do
  {
    v42 = (objc_class *)v39[-1]._selectedFlatRoofStyleQueries.__begin_;
    v39 = (VKBuildingGroup *)((char *)v39 - 24);
    v41 = v42;
    if (v42)
    {
      v43 = (objc_class *)p_pointyRoofFillCullingGroups[-1].__elems_[15].__end_;
      Class v40 = v41;
      if (v43 != v41)
      {
        v44 = (objc_class *)p_pointyRoofFillCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v46 = (void *)*((void *)v44 - 3);
          v44 = (objc_class *)((char *)v44 - 24);
          v45 = v46;
          if (v46)
          {
            *((void *)v43 - 2) = v45;
            operator delete(v45);
          }
          v43 = v44;
        }
        while (v44 != v41);
        Class v40 = v39->super.super.isa;
      }
      p_pointyRoofFillCullingGroups[-1].__elems_[15].__end_ = v41;
      operator delete(v40);
    }
    p_pointyRoofFillCullingGroups = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v39;
  }
  while (v39 != (VKBuildingGroup *)&self->_fillCullingGroupsForPointyRoofs);
  p_fillCullingGroupsForPointyRoofs = &self->_fillCullingGroupsForPointyRoofs;
  v48 = (VKBuildingGroup *)&self->_fillCullingGroupsForPointyRoofs;
  do
  {
    v51 = (objc_class *)v48[-1]._selectedFlatRoofStyleQueries.__begin_;
    v48 = (VKBuildingGroup *)((char *)v48 - 24);
    v50 = v51;
    if (v51)
    {
      v52 = (objc_class *)p_fillCullingGroupsForPointyRoofs[-1].__elems_[15].__end_;
      Class v49 = v50;
      if (v52 != v50)
      {
        v53 = (objc_class *)p_fillCullingGroupsForPointyRoofs[-1].__elems_[15].__end_;
        do
        {
          v55 = (void *)*((void *)v53 - 3);
          v53 = (objc_class *)((char *)v53 - 24);
          v54 = v55;
          if (v55)
          {
            *((void *)v52 - 2) = v54;
            operator delete(v54);
          }
          v52 = v53;
        }
        while (v53 != v50);
        Class v49 = v48->super.super.isa;
      }
      p_fillCullingGroupsForPointyRoofs[-1].__elems_[15].__end_ = v50;
      operator delete(v49);
    }
    p_fillCullingGroupsForPointyRoofs = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v48;
  }
  while (v48 != (VKBuildingGroup *)&self->_extrusionStrokeCullingGroups);
  p_extrusionStrokeCullingGroups = &self->_extrusionStrokeCullingGroups;
  v57 = (VKBuildingGroup *)&self->_extrusionStrokeCullingGroups;
  do
  {
    v60 = (objc_class *)v57[-1]._selectedFlatRoofStyleQueries.__begin_;
    v57 = (VKBuildingGroup *)((char *)v57 - 24);
    v59 = v60;
    if (v60)
    {
      v61 = (objc_class *)p_extrusionStrokeCullingGroups[-1].__elems_[15].__end_;
      Class v58 = v59;
      if (v61 != v59)
      {
        v62 = (objc_class *)p_extrusionStrokeCullingGroups[-1].__elems_[15].__end_;
        do
        {
          v64 = (void *)*((void *)v62 - 3);
          v62 = (objc_class *)((char *)v62 - 24);
          v63 = v64;
          if (v64)
          {
            *((void *)v61 - 2) = v63;
            operator delete(v63);
          }
          v61 = v62;
        }
        while (v62 != v59);
        Class v58 = v57->super.super.isa;
      }
      p_extrusionStrokeCullingGroups[-1].__elems_[15].__end_ = v59;
      operator delete(v58);
    }
    p_extrusionStrokeCullingGroups = (array<std::vector<std::vector<FeatureRange>>, 16UL> *)v57;
  }
  while (v57 != (VKBuildingGroup *)&self->_extrusionFillCullingGroups);
  value = self->_pointyRoofStrokeMeshVendor.__ptr_.__value_;
  self->_pointyRoofStrokeMeshVendor.__ptr_.__value_ = 0;
  if (value)
  {
    v66 = (void *)*value;
    if (*value)
    {
      v67 = (void *)value[1];
      v68 = (void *)*value;
      if (v67 != v66)
      {
        do
        {
          uint64_t v70 = *--v67;
          uint64_t v69 = v70;
          void *v67 = 0;
          if (v70) {
            (*(void (**)(uint64_t, void *))(*(void *)v69 + 8))(v69, v68);
          }
        }
        while (v67 != v66);
        v68 = (void *)*value;
      }
      value[1] = v66;
      (*(void (**)(void, void *, void))(*(void *)value[3] + 40))(value[3], v68, value[2] - (void)v68);
    }
    MEMORY[0x1A6239270](value, 0x20C40DC1BFBCFLL);
  }
  v71 = self->_pointyRoofFillMeshVendor.__ptr_.__value_;
  self->_pointyRoofFillMeshVendor.__ptr_.__value_ = 0;
  if (v71)
  {
    v72 = (void *)*v71;
    if (*v71)
    {
      v73 = (void *)v71[1];
      v74 = (void *)*v71;
      if (v73 != v72)
      {
        do
        {
          uint64_t v76 = *--v73;
          uint64_t v75 = v76;
          void *v73 = 0;
          if (v76) {
            (*(void (**)(uint64_t, void *))(*(void *)v75 + 8))(v75, v74);
          }
        }
        while (v73 != v72);
        v74 = (void *)*v71;
      }
      v71[1] = v72;
      (*(void (**)(void, void *, void))(*(void *)v71[3] + 40))(v71[3], v74, v71[2] - (void)v74);
    }
    MEMORY[0x1A6239270](v71, 0x20C40DC1BFBCFLL);
  }
  v77 = self->_extrusionStrokeMeshVendor.__ptr_.__value_;
  self->_extrusionStrokeMeshVendor.__ptr_.__value_ = 0;
  if (v77)
  {
    v78 = (void *)*v77;
    if (*v77)
    {
      v79 = (void *)v77[1];
      v80 = (void *)*v77;
      if (v79 != v78)
      {
        do
        {
          uint64_t v82 = *--v79;
          uint64_t v81 = v82;
          void *v79 = 0;
          if (v82) {
            (*(void (**)(uint64_t, void *))(*(void *)v81 + 8))(v81, v80);
          }
        }
        while (v79 != v78);
        v80 = (void *)*v77;
      }
      v77[1] = v78;
      (*(void (**)(void, void *, void))(*(void *)v77[3] + 40))(v77[3], v80, v77[2] - (void)v80);
    }
    MEMORY[0x1A6239270](v77, 0x20C40DC1BFBCFLL);
  }
  v83 = self->_extrusionFillMeshVendor.__ptr_.__value_;
  self->_extrusionFillMeshVendor.__ptr_.__value_ = 0;
  if (v83)
  {
    v84 = (void *)*v83;
    if (*v83)
    {
      v85 = (void *)v83[1];
      v86 = (void *)*v83;
      if (v85 != v84)
      {
        do
        {
          uint64_t v88 = *--v85;
          uint64_t v87 = v88;
          void *v85 = 0;
          if (v88) {
            (*(void (**)(uint64_t, void *))(*(void *)v87 + 8))(v87, v86);
          }
        }
        while (v85 != v84);
        v86 = (void *)*v83;
      }
      v83[1] = v84;
      (*(void (**)(void, void *, void))(*(void *)v83[3] + 40))(v83[3], v86, v83[2] - (void)v86);
    }
    MEMORY[0x1A6239270](v83, 0x20C40DC1BFBCFLL);
  }
  v89 = (char *)self->_fillMeshesForPointyRoofs.__begin_;
  if (v89)
  {
    v90 = (char *)self->_fillMeshesForPointyRoofs.__end_;
    v91 = self->_fillMeshesForPointyRoofs.__begin_;
    if (v90 != v89)
    {
      do
      {
        v92 = (std::__shared_weak_count *)*((void *)v90 - 1);
        if (v92 && !atomic_fetch_add(&v92->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v92->__on_zero_shared)(v92);
          std::__shared_weak_count::__release_weak(v92);
        }
        v90 -= 16;
      }
      while (v90 != v89);
      v91 = self->_fillMeshesForPointyRoofs.__begin_;
    }
    self->_fillMeshesForPointyRoofs.__end_ = v89;
    operator delete(v91);
  }
  v93 = (char *)self->_strokeMeshes.__begin_;
  if (v93)
  {
    v94 = (char *)self->_strokeMeshes.__end_;
    v95 = self->_strokeMeshes.__begin_;
    if (v94 != v93)
    {
      do
      {
        v96 = (std::__shared_weak_count *)*((void *)v94 - 1);
        if (v96 && !atomic_fetch_add(&v96->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
          std::__shared_weak_count::__release_weak(v96);
        }
        v94 -= 16;
      }
      while (v94 != v93);
      v95 = self->_strokeMeshes.__begin_;
    }
    self->_strokeMeshes.__end_ = v93;
    operator delete(v95);
  }
  if (self->_fillMeshInfoForPointyRoofs._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_fillMeshInfoForPointyRoofs._value);
    self->_fillMeshInfoForPointyRoofs._hasValue = 0;
  }
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  if (p_strokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_strokeMeshInfo->_value);
    p_strokeMeshInfo->_hasValue = 0;
  }
}

- (void)updateWithStyleManager:(const void *)a3
{
  v5 = [(VKPolygonalItemGroup *)self attributeSets];
  uint64_t v7 = v5[3];
  uint64_t v6 = v5[4];
  p_styleQueries = &self->_styleQueries;
  begin = (char *)self->_styleQueries.__begin_;
  for (i = (char *)self->_styleQueries.__end_; i != begin; i -= 16)
  {
    v11 = (std::__shared_weak_count *)*((void *)i - 1);
    if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  uint64_t v12 = v6 - v7;
  self->_styleQueries.__end_ = begin;
  p_flatRoofStyleQueries = &self->_flatRoofStyleQueries;
  v14 = (char *)self->_flatRoofStyleQueries.__begin_;
  for (j = (char *)self->_flatRoofStyleQueries.__end_; j != v14; j -= 16)
  {
    v16 = (std::__shared_weak_count *)*((void *)j - 1);
    if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
      std::__shared_weak_count::__release_weak(v16);
    }
  }
  unint64_t v47 = v12 >> 4;
  self->_flatRoofStyleQueries.__end_ = v14;
  v17 = self;
  p_selectedStyleQueries = &self->_selectedStyleQueries;
  v19 = (char *)self->_selectedStyleQueries.__begin_;
  for (k = (char *)self->_selectedStyleQueries.__end_; k != v19; k -= 16)
  {
    v21 = (std::__shared_weak_count *)*((void *)k - 1);
    if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
      std::__shared_weak_count::__release_weak(v21);
    }
  }
  self->_selectedStyleQueries.__end_ = v19;
  p_selectedFlatRoofStyleQueries = &self->_selectedFlatRoofStyleQueries;
  v23 = (char *)v17->_selectedFlatRoofStyleQueries.__begin_;
  for (m = (char *)v17->_selectedFlatRoofStyleQueries.__end_; m != v23; m -= 16)
  {
    v25 = (std::__shared_weak_count *)*((void *)m - 1);
    if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
      std::__shared_weak_count::__release_weak(v25);
    }
  }
  p_selectedFlatRoofStyleQueries->__end_ = v23;
  std::vector<std::shared_ptr<md::GEOVectorTileResource>>::reserve((uint64_t)p_styleQueries, v47);
  std::vector<std::shared_ptr<md::GEOVectorTileResource>>::reserve((uint64_t)p_flatRoofStyleQueries, v47);
  std::vector<std::shared_ptr<md::GEOVectorTileResource>>::reserve((uint64_t)p_selectedStyleQueries, v47);
  std::vector<std::shared_ptr<md::GEOVectorTileResource>>::reserve((uint64_t)p_selectedFlatRoofStyleQueries, v47);
  uint64_t v26 = v5[3];
  if (v5[4] != v26)
  {
    uint64_t v27 = 0;
    unint64_t v28 = 0;
    while (1)
    {
      memset(v57, 0, sizeof(v57));
      char v58 = 1;
      *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v57, 0x10002u) = 1;
      md::createFeatureAttributeSet((gss::Allocator *)v55, (uint64_t *)(v26 + v27));
      uint64_t v29 = *(void *)a3;
      *(void *)((char *)&v52 + 7) = 0;
      *(void *)&long long v52 = 0;
      HIBYTE(v52) = 1;
      gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((uint64_t **)&v49, v29, (gss::FeatureAttributeSet *)v55, (gss::QueryOverrides *)&v52);
      end = p_styleQueries->__end_;
      if (end >= p_styleQueries->__end_cap_.__value_)
      {
        Class v31 = std::vector<std::shared_ptr<gdc::LayerDataRequest>>::__push_back_slow_path<std::shared_ptr<gdc::LayerDataRequest>>((char **)p_styleQueries, (uint64_t)&v49);
        v32 = (std::__shared_weak_count *)*((void *)&v49 + 1);
        p_styleQueries->__end_ = v31;
        if (v32 && !atomic_fetch_add(&v32->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
      }
      else
      {
        _OWORD *end = v49;
        p_styleQueries->__end_ = end + 1;
      }
      gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((uint64_t **)&v52, *(void *)a3, (gss::FeatureAttributeSet *)v55, (gss::QueryOverrides *)v57);
      v34 = p_selectedStyleQueries->__end_;
      if (v34 >= p_selectedStyleQueries->__end_cap_.__value_)
      {
        v33 = std::vector<std::shared_ptr<gdc::LayerDataRequest>>::__push_back_slow_path<std::shared_ptr<gdc::LayerDataRequest>>((char **)p_selectedStyleQueries, (uint64_t)&v52);
        v35 = (std::__shared_weak_count *)*((void *)&v52 + 1);
        p_selectedStyleQueries->__end_ = v33;
        if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v35->__on_zero_shared)(v35);
          std::__shared_weak_count::__release_weak(v35);
        }
      }
      else
      {
        _OWORD *v34 = v52;
        p_selectedStyleQueries->__end_ = v34 + 1;
      }
      long long v49 = 0uLL;
      v50 = 0;
      uint64_t v51 = gss::Allocator::instance((gss::Allocator *)v33);
      v36 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v51 + 16))(v51, 8, 4);
      *(void *)&long long v49 = v36;
      v50 = (char *)(v36 + 1);
      if (v36) {
        void *v36 = 0x100000013;
      }
      *((void *)&v49 + 1) = v36 + 1;
      gss::FeatureAttributeSet::setByReplacingAttributes((gss::Allocator *)v55, (unsigned int **)&v49, (unsigned int **)&v52);
      if ((void)v49)
      {
        *((void *)&v49 + 1) = v49;
        (*(void (**)(uint64_t, void, char *))(*(void *)v51 + 40))(v51, v49, &v50[-v49]);
      }
      uint64_t v37 = *(void *)a3;
      *(void *)((char *)&v49 + 7) = 0;
      *(void *)&long long v49 = 0;
      HIBYTE(v49) = 1;
      gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((uint64_t **)&v48, v37, (gss::FeatureAttributeSet *)&v52, (gss::QueryOverrides *)&v49);
      v38 = p_flatRoofStyleQueries->__end_;
      if (v38 >= p_flatRoofStyleQueries->__end_cap_.__value_)
      {
        v39 = std::vector<std::shared_ptr<gdc::LayerDataRequest>>::__push_back_slow_path<std::shared_ptr<gdc::LayerDataRequest>>((char **)p_flatRoofStyleQueries, (uint64_t)&v48);
        Class v40 = (std::__shared_weak_count *)*((void *)&v48 + 1);
        p_flatRoofStyleQueries->__end_ = v39;
        if (v40 && !atomic_fetch_add(&v40->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
          std::__shared_weak_count::__release_weak(v40);
        }
      }
      else
      {
        _OWORD *v38 = v48;
        p_flatRoofStyleQueries->__end_ = v38 + 1;
      }
      gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((uint64_t **)&v49, *(void *)a3, (gss::FeatureAttributeSet *)&v52, (gss::QueryOverrides *)v57);
      v42 = p_selectedFlatRoofStyleQueries->__end_;
      if (v42 < p_selectedFlatRoofStyleQueries->__end_cap_.__value_) {
        break;
      }
      v41 = std::vector<std::shared_ptr<gdc::LayerDataRequest>>::__push_back_slow_path<std::shared_ptr<gdc::LayerDataRequest>>((char **)p_selectedFlatRoofStyleQueries, (uint64_t)&v49);
      v44 = (std::__shared_weak_count *)*((void *)&v49 + 1);
      p_selectedFlatRoofStyleQueries->__end_ = v41;
      if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
        std::__shared_weak_count::__release_weak(v44);
        uint64_t v43 = v52;
        if (!(void)v52) {
          goto LABEL_54;
        }
LABEL_53:
        *((void *)&v52 + 1) = v43;
        v41 = (char *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v54 + 40))(v54, v43, v53 - v43);
        goto LABEL_54;
      }
      uint64_t v43 = v52;
      if ((void)v52) {
        goto LABEL_53;
      }
LABEL_54:
      if (v55[0])
      {
        v55[1] = v55[0];
        v41 = (char *)(*(uint64_t (**)(uint64_t, void, void))(*(void *)v56 + 40))(v56, v55[0], v55[2] - v55[0]);
      }
      if (!v57[14])
      {
        uint64_t v45 = *(void *)v57;
        if (*(void *)v57)
        {
          uint64_t v46 = gss::Allocator::instance((gss::Allocator *)v41);
          (*(void (**)(uint64_t, uint64_t, void))(*(void *)v46 + 40))(v46, v45, *(unsigned __int16 *)&v57[12]);
        }
      }
      ++v28;
      uint64_t v26 = v5[3];
      v27 += 16;
      if (v28 >= (v5[4] - v26) >> 4) {
        return;
      }
    }
    _OWORD *v42 = v49;
    p_selectedFlatRoofStyleQueries->__end_ = v42 + 1;
    uint64_t v43 = v52;
    if (!(void)v52) {
      goto LABEL_54;
    }
    goto LABEL_53;
  }
}

- (BOOL)addPointyRoofForBuilding:(void *)a3 buildingModel:(unsigned __int8)a4 scaleThreshold:(float)a5 styleIndex:(float)a6
{
  unsigned int v8 = a4;
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = *((unsigned int *)a3 + 25);
  uint64_t v12 = *((void *)a3 + 5);
  v13 = +[VKPlatform sharedPlatform];
  if ([v13 supports3DBuildingStrokes])
  {
    uint64_t v14 = *((void *)a3 + 3);
    uint64_t v15 = *(unsigned __int8 *)(v14 + 33);
    if (*(unsigned char *)(v14 + 33))
    {
      uint64_t v16 = 0;
      v17 = *(int **)v14;
      v18 = v17;
      while (1)
      {
        int v19 = *v18;
        v18 += 2;
        if (v19 == 35) {
          break;
        }
        if (v15 == ++v16) {
          goto LABEL_6;
        }
      }
      BOOL v20 = v17[2 * v16 + 1] != 0;
    }
    else
    {
LABEL_6:
      BOOL v20 = 1;
    }
  }
  else
  {
    BOOL v20 = 0;
  }

  BOOL v21 = 0;
  if (v11)
  {
    unint64_t v22 = 0;
    uint64_t v23 = 32 * v8;
    v133 = (void *)((char *)&g_gglBaseRanges + v23);
    int v24 = (int)a6;
    v132 = (void *)((char *)&g_gglRoofRanges + v23);
    v121 = (uint64_t *)((char *)&g_gglEdgeRanges + 16 * v8);
    v130 = v121 + 1;
    p_boundingBox = &self->super._boundingBox;
    v138 = (float *)((char *)&g_gglBuildingBoundingBoxes + 24 * v8);
    float v25 = 2.0;
    float v26 = 0.5;
    float v118 = a5;
    uint64_t v119 = v12;
    v120 = self;
    BOOL v117 = v20;
    do
    {
      unint64_t v144 = 0;
      uint64_t v27 = geo::codec::multiSectionFeaturePoints(a3, v22, &v144);
      if (v27)
      {
        if (v144 >= 2)
        {
          uint64_t v143 = 0;
          float v142 = 0.0;
          _computeScaleRotationTranslation((uint64_t)v27, v144, (float *)&v143, &v142, v141);
          float v28 = *((float *)&v143 + 1);
          if (*((float *)&v143 + 1) != 0.0)
          {
            float v29 = *(float *)&v143;
            if (*(float *)&v143 != 0.0)
            {
              BOOL v30 = (float)(*(float *)&v143 / *((float *)&v143 + 1)) > v25
                 || (float)(*(float *)&v143 / *((float *)&v143 + 1)) < v26;
              BOOL v31 = !v30 && *(float *)&v143 <= a5;
              if (v31 && *((float *)&v143 + 1) <= a5)
              {
                uint64_t v139 = v143;
                float v134 = fminf(*(float *)&v143, *((float *)&v143 + 1));
                float v140 = v134;
                float v33 = v142;
                _transformAndAddMesh((uint64_t)&g_gglBaseVertices + 28 * *v133, 40, (int16x8_t *)((char *)&g_gglBaseIndices + 2 * v133[2]), 0x3CuLL, v138, (int *)self->_pointyRoofFillMeshVendor.__ptr_.__value_, (uint64_t)&self->_pointyRoofFillCullingGroups, v24, v142, v12, (float *)&v139, v141, p_boundingBox->_minimum._e);
                _transformAndAddMesh((uint64_t)&g_gglRoofVertices + 28 * *v132, v132[1], (int16x8_t *)((char *)&g_gglRoofIndices + 2 * v132[2]), v132[3], v138, (int *)self->_pointyRoofFillMeshVendor.__ptr_.__value_, (uint64_t)&self->_pointyRoofFillCullingGroups, v24, v33, v12, (float *)&v139, v141, p_boundingBox->_minimum._e);
                if (v20)
                {
                  uint64_t v34 = *v130;
                  if (*v130)
                  {
                    float v35 = *v138;
                    float v36 = v138[1];
                    float v38 = v138[3];
                    float v37 = v138[4];
                    uint64_t v128 = *v121;
                    uint64_t v39 = *(void *)(*((void *)self->_pointyRoofStrokeMeshVendor.__ptr_.__value_ + 1) - 8);
                    uint64_t v40 = **(void **)(v39 + 64);
                    unint64_t v41 = *(void *)(v40 + 8);
                    unint64_t v42 = (*(void *)(v40 + 48) - *(void *)(v40 + 40)) / v41;
                    unint64_t v43 = v42 + 4 * v34;
                    if (v43 >= 0x10000) {
                      ggl::MeshVendor<ggl::PrefilteredLine::PrefilteredLineMesh>::_allocateNewMesh();
                    }
                    unint64_t v44 = v41 * v43;
                    uint64_t v45 = *(void *)(v40 + 72);
                    unint64_t v46 = *(void *)(v40 + 80) - v45;
                    if (v44 != v46)
                    {
                      if (v44 <= v46)
                      {
                        if (v44 < v46) {
                          *(void *)(v40 + 80) = v45 + v44;
                        }
                      }
                      else
                      {
                        uint64_t v47 = *(void *)(*((void *)self->_pointyRoofStrokeMeshVendor.__ptr_.__value_ + 1) - 8);
                        std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v40 + 72, v44 - v46);
                        uint64_t v39 = v47;
                      }
                      long long v48 = *(std::__shared_weak_count **)(v40 + 32);
                      *(void *)(v40 + 24) = 0;
                      *(void *)(v40 + 32) = 0;
                      if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                      {
                        uint64_t v49 = v39;
                        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
                        std::__shared_weak_count::__release_weak(v48);
                        uint64_t v39 = v49;
                      }
                      *(void *)(v40 + 120) = 0;
                      *(_DWORD *)(v40 + 112) = 0;
                      uint64_t v50 = *(void *)(v40 + 80) - *(void *)(v40 + 72);
                      *(void *)(v40 + 40) = 0;
                      *(void *)(v40 + 48) = v50;
                      *(void *)(v40 + 56) = 0;
                      *(void *)(v40 + 64) = v50;
                      uint64_t v40 = **(void **)(v39 + 64);
                    }
                    uint64_t v51 = 0;
                    long long v151 = 0uLL;
                    uint64_t v52 = *(void *)(v40 + 8);
                    uint64_t v53 = v52 * v42;
                    unint64_t v54 = v52 * v43;
                    if (v54 != v53) {
                      uint64_t v51 = *(void *)(v40 + 72) + v53;
                    }
                    *(void *)&long long v55 = 0;
                    *((void *)&v55 + 1) = v40;
                    long long v151 = v55;
                    unint64_t v152 = v53;
                    unint64_t v153 = v54;
                    uint64_t v155 = v51;
                    __int16 v154 = 1;
                    uint64_t v56 = *(void *)(v39 + 96);
                    unint64_t v57 = *(void *)(v56 + 8);
                    unint64_t v58 = (*(void *)(v56 + 48) - *(void *)(v56 + 40)) / v57;
                    unint64_t v131 = v58 + 6 * v34;
                    unint64_t v59 = v57 * v131;
                    uint64_t v60 = *(void *)(v56 + 72);
                    unint64_t v61 = *(void *)(v56 + 80) - v60;
                    uint64_t v12 = v119;
                    self = v120;
                    float v126 = v38;
                    float v127 = v37;
                    float v124 = v36;
                    float v125 = v35;
                    unint64_t v129 = v58;
                    if (v57 * v131 == v61)
                    {
                      float v62 = v33;
                    }
                    else
                    {
                      if (v57 * v131 <= v61)
                      {
                        if (v59 < v61) {
                          *(void *)(v56 + 80) = v60 + v59;
                        }
                      }
                      else
                      {
                        unint64_t v63 = (*(void *)(v56 + 48) - *(void *)(v56 + 40)) / v57;
                        std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v56 + 72, v57 * v131 - v61);
                        unint64_t v58 = v63;
                      }
                      v64 = *(std::__shared_weak_count **)(v56 + 32);
                      *(void *)(v56 + 24) = 0;
                      *(void *)(v56 + 32) = 0;
                      if (v64 && !atomic_fetch_add(&v64->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
                      {
                        ((void (*)(std::__shared_weak_count *))v64->__on_zero_shared)(v64);
                        std::__shared_weak_count::__release_weak(v64);
                        unint64_t v58 = v129;
                      }
                      float v62 = v33;
                      *(void *)(v56 + 120) = 0;
                      *(_DWORD *)(v56 + 112) = 0;
                      uint64_t v60 = *(void *)(v56 + 72);
                      uint64_t v65 = *(void *)(v56 + 80) - v60;
                      *(void *)(v56 + 40) = 0;
                      *(void *)(v56 + 48) = v65;
                      *(void *)(v56 + 56) = 0;
                      *(void *)(v56 + 64) = v65;
                      unint64_t v57 = *(void *)(v56 + 8);
                      unint64_t v59 = v57 * v131;
                    }
                    long long v146 = 0uLL;
                    uint64_t v66 = v57 * v58;
                    *(void *)&long long v67 = 0;
                    *((void *)&v67 + 1) = v56;
                    uint64_t v68 = v60 + v66;
                    if (v59 == v66) {
                      uint64_t v69 = 0;
                    }
                    else {
                      uint64_t v69 = v68;
                    }
                    long long v146 = v67;
                    unint64_t v147 = v66;
                    unint64_t v148 = v59;
                    uint64_t v150 = v69;
                    __int16 v149 = 1;
                    float v70 = v141[0];
                    float v71 = v120->super._boundingBox._minimum._e[0];
                    float v72 = v120->super._boundingBox._minimum._e[2];
                    float v73 = v120->super._boundingBox._maximum._e[0] - v71;
                    float v122 = v120->super._boundingBox._minimum._e[1];
                    float v123 = v141[1];
                    float v74 = v120->super._boundingBox._maximum._e[1] - v122;
                    float v75 = v120->super._boundingBox._maximum._e[2] - v72;
                    if (v73 >= 0.0) {
                      float v76 = 65535.0 / v73;
                    }
                    else {
                      float v76 = INFINITY;
                    }
                    if (v74 >= 0.0) {
                      float v77 = 65535.0 / v74;
                    }
                    else {
                      float v77 = INFINITY;
                    }
                    if (v75 >= 0.0) {
                      float v78 = 65535.0 / v75;
                    }
                    else {
                      float v78 = INFINITY;
                    }
                    __float2 v80 = __sincosf_stret(v62);
                    *(float *)v79.i32 = v80.__sinval;
                    float v81 = v123 - v122;
                    uint64_t v82 = (float *)((char *)&g_gglEdges + 24 * v128 + 12);
                    v83 = (_WORD *)(v155 + 32);
                    do
                    {
                      float v84 = *(v82 - 3) * v29;
                      float v85 = *(v82 - 2) * v28;
                      float v86 = *v82 * v29;
                      float v87 = v82[1] * v28;
                      float v88 = (float)((float)(v70 + (float)(v84 * v80.__cosval))
                                  - (float)(v71 + (float)(v85 * v80.__sinval)))
                          * v76;
                      int v89 = (int)(float)((float)((float)(v81 + (float)(v84 * v80.__sinval)) + (float)(v85 * v80.__cosval))
                                       * v77);
                      int v90 = (int)(float)((float)-(float)(v72 - (float)(*(v82 - 1) * v134)) * v78);
                      int v91 = (int)(float)((float)((float)(v70 + (float)(v86 * v80.__cosval))
                                               - (float)(v71 + (float)(v87 * v80.__sinval)))
                                       * v76);
                      int v92 = (int)(float)((float)((float)(v81 + (float)(v86 * v80.__sinval)) + (float)(v87 * v80.__cosval))
                                       * v77);
                      int v93 = (int)(float)((float)-(float)(v72 - (float)(v82[2] * v134)) * v78);
                      *(v83 - 16) = (int)v88;
                      *(v83 - 15) = v89;
                      *((_DWORD *)v83 - 7) = (unsigned __int16)v90;
                      *(v83 - 12) = v91;
                      *(v83 - 11) = v92;
                      *(v83 - 10) = v93;
                      *(v83 - 9) = v24;
                      *(v83 - 8) = (int)v88;
                      *(v83 - 7) = v89;
                      *(v83 - 6) = v90;
                      *(v83 - 5) = 256;
                      *(v83 - 4) = v91;
                      *(v83 - 3) = v92;
                      *(v83 - 2) = v93;
                      *(v83 - 1) = v24;
                      _WORD *v83 = (int)v88;
                      v83[1] = v89;
                      v83[2] = v90;
                      v83[3] = 1;
                      v83[4] = v91;
                      v83[5] = v92;
                      v83[6] = v93;
                      v83[7] = v24;
                      v83[8] = (int)v88;
                      v83[9] = v89;
                      v83[10] = v90;
                      v83[11] = 257;
                      v83[12] = v91;
                      v83[13] = v92;
                      v83[14] = v93;
                      v83[15] = v24;
                      *(_WORD *)uint64_t v69 = v42;
                      int16x4_t v94 = vuzp1_s16((int16x4_t)vadd_s32(vdup_n_s32(v42), (int32x2_t)0x200000001), v79);
                      v82 += 6;
                      *(int16x4_t *)(v69 + 2) = vzip1_s16(v94, vrev32_s16(v94));
                      *(_WORD *)(v69 + 10) = v42 + 3;
                      v69 += 12;
                      v42 += 4;
                      v83 += 32;
                      --v34;
                    }
                    while (v34);
                    float v95 = (float)(v124 * v28) * v80.__cosval;
                    float v96 = v70 + (float)((float)(v125 * v29) * v80.__cosval);
                    float v97 = v123 + (float)((float)(v125 * v29) * v80.__sinval);
                    float v98 = v70 + (float)((float)(v126 * v29) * v80.__cosval);
                    float v99 = v123 + (float)((float)(v126 * v29) * v80.__sinval);
                    float v100 = (float)(v127 * v28) * v80.__cosval;
                    v156[0] = v96 - (float)(v80.__sinval * (float)(v124 * v28));
                    v156[1] = v97 + v95;
                    v156[2] = v98 - (float)(v80.__sinval * (float)(v124 * v28));
                    v156[3] = v99 + v95;
                    v156[4] = v98 - (float)(v80.__sinval * (float)(v127 * v28));
                    v156[5] = v99 + v100;
                    v156[6] = v96 - (float)(v80.__sinval * (float)(v127 * v28));
                    v156[7] = v97 + v100;
                    __int16 v101 = ggl::CullingGrid::intersectedCellsForRibbon(4uLL, v156, 1);
                    v145[0] = v129;
                    v145[1] = v131;
                    v145[2] = v119;
                    _addRangeToList((uint64_t)&v120->_pointyRoofStrokeCullingGroups, v101, 0, v145);
                    a5 = v118;
                    float v25 = 2.0;
                    float v26 = 0.5;
                    if (v150)
                    {
                      unint64_t v103 = v147;
                      unint64_t v102 = v148;
                      if (v148 != v147)
                      {
                        long long v104 = v146;
                        int v105 = v149;
                        int v106 = HIBYTE(v149);
                        if ((void)v146 && *(unsigned char *)(*((void *)&v146 + 1) + 17) != 2)
                        {
                          int v135 = v149;
                          (*(void (**)(void))(*(void *)v146 + 64))();
                          int v105 = v135;
                        }
                        if (v105 && !v106)
                        {
                          unint64_t v107 = *(void *)(*((void *)&v104 + 1) + 56);
                          unint64_t v108 = *(void *)(*((void *)&v104 + 1) + 64);
                          if (v108 == v107) {
                            unint64_t v107 = *(void *)(*((void *)&v104 + 1) + 80)
                          }
                                 - *(void *)(*((void *)&v104 + 1) + 72);
                          if (v103 < v107) {
                            unint64_t v107 = v103;
                          }
                          if (v108 <= v102) {
                            unint64_t v108 = v102;
                          }
                          if (v108 == v107) {
                            unint64_t v108 = v107
                          }
                                 + *(void *)(*((void *)&v104 + 1) + 80)
                                 - *(void *)(*((void *)&v104 + 1) + 72);
                          *(void *)(*((void *)&v104 + 1) + 56) = v107;
                          *(void *)(*((void *)&v104 + 1) + 64) = v108;
                        }
                      }
                    }
                    if (v155)
                    {
                      unint64_t v110 = v152;
                      unint64_t v109 = v153;
                      if (v153 != v152)
                      {
                        long long v111 = v151;
                        int v112 = v154;
                        int v113 = HIBYTE(v154);
                        if ((void)v151 && *(unsigned char *)(*((void *)&v151 + 1) + 17) != 2)
                        {
                          int v136 = v154;
                          (*(void (**)(void))(*(void *)v151 + 64))();
                          int v112 = v136;
                        }
                        if (v112 && !v113)
                        {
                          unint64_t v114 = *(void *)(*((void *)&v111 + 1) + 56);
                          unint64_t v115 = *(void *)(*((void *)&v111 + 1) + 64);
                          if (v115 == v114) {
                            unint64_t v114 = *(void *)(*((void *)&v111 + 1) + 80)
                          }
                                 - *(void *)(*((void *)&v111 + 1) + 72);
                          if (v110 < v114) {
                            unint64_t v114 = v110;
                          }
                          if (v115 <= v109) {
                            unint64_t v115 = v109;
                          }
                          if (v115 == v114) {
                            unint64_t v115 = v114
                          }
                                 + *(void *)(*((void *)&v111 + 1) + 80)
                                 - *(void *)(*((void *)&v111 + 1) + 72);
                          *(void *)(*((void *)&v111 + 1) + 56) = v114;
                          *(void *)(*((void *)&v111 + 1) + 64) = v115;
                        }
                      }
                    }
                    BOOL v20 = v117;
                  }
                }
                BOOL v21 = 1;
              }
            }
          }
        }
      }
      ++v22;
    }
    while (v22 != v11);
  }
  return v21;
}

- (BOOL)canConstructPointyRoofForPolygon:(void *)a3 building:(void *)a4 buildingModel:(unsigned __int8)a5 scaleThreshold:(float)a6
{
  unint64_t v6 = *((unsigned int *)a3 + 25);
  if (v6)
  {
    unint64_t v9 = 0;
    BOOL v10 = 1;
    while (1)
    {
      unint64_t v20 = 0;
      uint64_t v11 = geo::codec::multiSectionFeaturePoints(a3, v9, &v20);
      if (v11)
      {
        if (v20 > 1)
        {
          uint64_t v19 = 0;
          _computeScaleRotationTranslation((uint64_t)v11, v20, (float *)&v19, &v18, v17);
          if (*((float *)&v19 + 1) != 0.0 && *(float *)&v19 != 0.0)
          {
            float v12 = *(float *)&v19 / *((float *)&v19 + 1);
            BOOL v13 = *((float *)&v19 + 1) <= a6 && *(float *)&v19 <= a6;
            BOOL v14 = !v13 || v12 < 0.5;
            if (!v14 && v12 <= 2.0) {
              break;
            }
          }
        }
      }
      BOOL v10 = ++v9 < v6;
      if (v6 == v9) {
        return 0;
      }
    }
  }
  else
  {
    return 0;
  }
  return v10;
}

- (void)addExtrusionForBuilding:(void *)a3 index:(unint64_t)a4 ofTotal:(unint64_t)a5
{
  v5 = a3;
  uint64_t v295 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *((unsigned int *)a3 + 25);
  v251 = self;
  if (v6)
  {
    uint64_t v7 = (char *)operator new(4 * v6);
    v255 = &v7[4 * v6];
    self = v251;
  }
  else
  {
    v255 = 0;
    uint64_t v7 = 0;
  }
  unint64_t v250 = v5[5];
  __int16 v8 = [(VKPolygonalItemGroup *)self indexForGeoFeatureAttributes:v5 + 3];
  v249 = (int ***)(v5 + 3);
  v287 = (float *)&v287;
  v288 = &v287;
  uint64_t v289 = 0;
  v267 = v5;
  uint64_t v259 = v6;
  if (!v6)
  {
    __p = v7;
    uint64_t v253 = 0;
    __int16 v258 = 0;
    uint64_t v55 = 0;
    v284 = &v284;
    v285 = &v284;
    uint64_t v286 = 0;
    goto LABEL_73;
  }
  int v9 = 0;
  unint64_t v10 = 0;
  uint64_t v11 = v7;
  do
  {
    *(void *)&long long v279 = 0;
    float v12 = (float *)geo::codec::multiSectionFeaturePoints(v5, v10, &v279);
    int v13 = ggl::CullingGrid::intersectedCellsForRibbon(v279, v12, 1);
    int v261 = v13;
    if (v11 < v255)
    {
      *(_DWORD *)uint64_t v11 = v13;
      BOOL v14 = v11 + 4;
      goto LABEL_26;
    }
    v264 = v11;
    int64_t v15 = v11 - v7;
    uint64_t v16 = (v11 - v7) >> 2;
    unint64_t v17 = v16 + 1;
    if ((unint64_t)(v16 + 1) >> 62) {
      abort();
    }
    if ((v255 - v7) >> 1 > v17) {
      unint64_t v17 = (v255 - v7) >> 1;
    }
    if ((unint64_t)(v255 - v7) >= 0x7FFFFFFFFFFFFFFCLL) {
      unint64_t v18 = 0x3FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v17;
    }
    if (v18)
    {
      if (v18 >> 62) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      uint64_t v19 = v5;
      unint64_t v20 = v18;
      BOOL v21 = (char *)operator new(4 * v18);
      unint64_t v18 = v20;
      v5 = v19;
    }
    else
    {
      BOOL v21 = 0;
    }
    unint64_t v22 = &v21[4 * v16];
    *(_DWORD *)unint64_t v22 = v261;
    BOOL v14 = v22 + 4;
    if (v264 != v7)
    {
      unint64_t v23 = v264 - 4 - v7;
      if (v23 >= 0xBC)
      {
        if (&v21[v15 - 4 - (v23 & 0xFFFFFFFFFFFFFFFCLL)] > &v21[v15 - 4])
        {
          int v24 = v264;
        }
        else if (&v264[-(v23 & 0xFFFFFFFFFFFFFFFCLL) - 4] > v264 - 4)
        {
          int v24 = v264;
        }
        else if ((unint64_t)(v264 - &v21[v15]) >= 0x20)
        {
          uint64_t v49 = (v23 >> 2) + 1;
          int v24 = &v264[-4 * (v49 & 0x7FFFFFFFFFFFFFF8)];
          uint64_t v50 = &v21[v15 - 16];
          uint64_t v51 = (long long *)(v264 - 16);
          uint64_t v52 = v49 & 0x7FFFFFFFFFFFFFF8;
          do
          {
            long long v53 = *v51;
            *((_OWORD *)v50 - 1) = *(v51 - 1);
            *(_OWORD *)uint64_t v50 = v53;
            v50 -= 32;
            v51 -= 2;
            v52 -= 8;
          }
          while (v52);
          v22 -= 4 * (v49 & 0x7FFFFFFFFFFFFFF8);
          if (v49 == (v49 & 0x7FFFFFFFFFFFFFF8)) {
            goto LABEL_23;
          }
        }
        else
        {
          int v24 = v264;
        }
      }
      else
      {
        int v24 = v264;
      }
      do
      {
        int v25 = *((_DWORD *)v24 - 1);
        v24 -= 4;
        *((_DWORD *)v22 - 1) = v25;
        v22 -= 4;
      }
      while (v24 != v7);
    }
LABEL_23:
    v255 = &v21[4 * v18];
    if (v7) {
      operator delete(v7);
    }
    uint64_t v7 = v22;
LABEL_26:
    int v257 = v9;
    __p = v7;
    float v26 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)v5, v10);
    v265 = v14;
    unint64_t v252 = v10;
    float v27 = geo::codec::buildingFootprintBaseHeight((uint64_t)v5, v10);
    unint64_t v28 = v279;
    if ((void)v279)
    {
      float v29 = v27;
      uint64_t v30 = 0;
      uint64_t v31 = v289;
      v32 = v287;
      float v33 = v12 + 1;
      uint64_t v34 = v279 - 1;
      do
      {
        if (v34 == v30) {
          uint64_t v35 = 0;
        }
        else {
          uint64_t v35 = v30 + 1;
        }
        float v36 = &v12[2 * ((v28 + v30 - 1) % v28)];
        float v37 = &v12[2 * v35];
        float v38 = *(v33 - 1);
        float v39 = *v33;
        float v40 = *v36;
        float v41 = v36[1];
        float v42 = *v37;
        float v43 = v37[1];
        unint64_t v44 = (float *)operator new(0x48uLL);
        v44[4] = v38;
        v44[5] = v39;
        v44[6] = v26;
        v44[7] = v42;
        v44[8] = v43;
        v44[9] = v26;
        *((void *)v44 + 5) = v30;
        *((void *)v44 + 6) = v35;
        *((void *)v44 + 7) = v30;
        *((void *)v44 + 8) = v35;
        *(void *)unint64_t v44 = v32;
        *((void *)v44 + 1) = &v287;
        *((void *)v32 + 1) = v44;
        uint64_t v45 = v31 + 1;
        v287 = v44;
        uint64_t v289 = v31 + 1;
        if (fabsf((float)((float)((float)(v42 - v38) * (float)(v38 - v40))+ (float)((float)(v43 - v39) * (float)(v39 - v41)))/ sqrtf((float)((float)((float)(v38 - v40) * (float)(v38 - v40))+ (float)((float)(v39 - v41) * (float)(v39 - v41)))* (float)((float)((float)(v42 - v38) * (float)(v42 - v38))+ (float)((float)(v43 - v39) * (float)(v43 - v39))))) <= 0.93969)
        {
          int v46 = *((_DWORD *)v33 - 1);
          float v47 = *v33;
          long long v48 = (float *)operator new(0x48uLL);
          *((_DWORD *)v48 + 4) = v46;
          v48[5] = v47;
          v48[6] = v29;
          *((_DWORD *)v48 + 7) = v46;
          v48[8] = v47;
          v48[9] = v26;
          *((void *)v48 + 5) = v30;
          *((void *)v48 + 6) = v30;
          *((void *)v48 + 7) = v30;
          *((void *)v48 + 8) = v30;
          *(void *)long long v48 = v44;
          *((void *)v48 + 1) = &v287;
          *((void *)v44 + 1) = v48;
          uint64_t v45 = v31 + 2;
          unint64_t v44 = v48;
          v287 = v48;
          uint64_t v289 = v31 + 2;
        }
        ++v30;
        v33 += 2;
        v32 = v44;
        uint64_t v31 = v45;
      }
      while (v28 != v30);
    }
    int v9 = v261 | v257;
    unint64_t v10 = v252 + 1;
    LODWORD(v6) = v259;
    uint64_t v7 = __p;
    uint64_t v11 = v265;
    v5 = v267;
  }
  while (v252 + 1 != v259);
  unint64_t v54 = v288;
  v284 = &v284;
  v285 = &v284;
  uint64_t v286 = 0;
  if (v288 != &v287)
  {
    do
    {
      unint64_t v57 = (float **)v54[1];
      if (v57 == &v287) {
        break;
      }
      unint64_t v58 = v54 + 2;
      unint64_t v59 = v54[1];
      while (*v58 != *((void *)v59 + 2)
           || *((_DWORD *)v54 + 6) != (unint64_t)*((unsigned int *)v59 + 6)
           || *(float **)((char *)v54 + 28) != *(float **)(v59 + 7)
           || *((_DWORD *)v54 + 9) != (unint64_t)*((unsigned int *)v59 + 9))
      {
        if (*v58 == *(void *)(v59 + 7)
          && *((_DWORD *)v54 + 6) == (unint64_t)*((unsigned int *)v59 + 9)
          && *(float **)((char *)v54 + 28) == *((float **)v59 + 2)
          && *((_DWORD *)v54 + 9) == (unint64_t)*((unsigned int *)v59 + 6))
        {
          break;
        }
        unint64_t v59 = (float *)*((void *)v59 + 1);
        if (v59 == (float *)&v287) {
          goto LABEL_48;
        }
      }
      v64 = operator new(0x48uLL);
      long long v65 = *(_OWORD *)v58;
      long long v66 = *((_OWORD *)v54 + 2);
      long long v67 = *((_OWORD *)v54 + 3);
      v64[8] = v54[8];
      *((_OWORD *)v64 + 2) = v66;
      *((_OWORD *)v64 + 3) = v67;
      *((_OWORD *)v64 + 1) = v65;
      uint64_t v68 = v284;
      void *v64 = v284;
      v64[1] = &v284;
      v68[1] = v64;
      v284 = v64;
      ++v286;
      uint64_t v69 = *(float **)v59;
      *((void *)v69 + 1) = *((void *)v59 + 1);
      **((void **)v59 + 1) = v69;
      --v289;
      operator delete(v59);
      float v70 = *v54;
      float v71 = v54[1];
      *((void *)v70 + 1) = v71;
      *(void *)v54[1] = v70;
      --v289;
      operator delete(v54);
      unint64_t v57 = *(float ***)(*(void *)v71 + 8);
LABEL_48:
      unint64_t v54 = v57;
    }
    while (v57 != &v287);
  }
  uint64_t v55 = 0;
  unint64_t v56 = 0;
  do
  {
    *(void *)&long long v279 = 0;
    geo::codec::multiSectionFeaturePoints(v267, v56, &v279);
    v55 += v279;
    ++v56;
  }
  while (v259 != v56);
  __int16 v258 = v261 | v257;
  uint64_t v253 = v289;
LABEL_73:
  value = v251->_extrusionFillMeshVendor.__ptr_.__value_;
  uint64_t v73 = *(void *)(value[1] - 8);
  uint64_t v74 = **(void **)(v73 + 64);
  unint64_t v75 = *(void *)(v74 + 8);
  unint64_t v76 = (*(void *)(v74 + 48) - *(void *)(v74 + 40)) / v75;
  unint64_t v77 = v76 + 4 * v55;
  if (v77 >= 0x10000) {
    ggl::MeshVendor<ggl::BuildingFacade::BuildingMesh>::_allocateNewMesh();
  }
  uint64_t v262 = value[1];
  int v256 = *(_DWORD *)value;
  unint64_t v78 = v75 * v77;
  uint64_t v79 = *(void *)(v74 + 72);
  unint64_t v80 = *(void *)(v74 + 80) - v79;
  float v81 = __p;
  if (v78 != v80)
  {
    if (v78 <= v80)
    {
      if (v78 < v80) {
        *(void *)(v74 + 80) = v79 + v78;
      }
    }
    else
    {
      std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v74 + 72, v78 - v80);
    }
    uint64_t v82 = *(std::__shared_weak_count **)(v74 + 32);
    *(void *)(v74 + 24) = 0;
    *(void *)(v74 + 32) = 0;
    if (v82 && !atomic_fetch_add(&v82->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
      std::__shared_weak_count::__release_weak(v82);
    }
    *(void *)(v74 + 120) = 0;
    *(_DWORD *)(v74 + 112) = 0;
    uint64_t v83 = *(void *)(v74 + 80) - *(void *)(v74 + 72);
    *(void *)(v74 + 40) = 0;
    *(void *)(v74 + 48) = v83;
    *(void *)(v74 + 56) = 0;
    *(void *)(v74 + 64) = v83;
    uint64_t v74 = **(void **)(v73 + 64);
  }
  uint64_t v84 = 0;
  uint64_t v85 = 6 * v55;
  long long v279 = 0uLL;
  uint64_t v86 = *(void *)(v74 + 8);
  uint64_t v87 = v86 * v76;
  unint64_t v88 = v86 * v77;
  *(void *)&long long v89 = 0;
  *((void *)&v89 + 1) = v74;
  if (v88 != v87) {
    uint64_t v84 = *(void *)(v74 + 72) + v87;
  }
  long long v279 = v89;
  unint64_t v280 = v87;
  unint64_t v281 = v88;
  uint64_t v283 = v84;
  __int16 v282 = 1;
  uint64_t v90 = *(void *)(v73 + 96);
  unint64_t v91 = *(void *)(v90 + 8);
  unint64_t v266 = (*(void *)(v90 + 48) - *(void *)(v90 + 40)) / v91;
  unint64_t v92 = v266 + v85;
  unint64_t v93 = v91 * (v266 + v85);
  uint64_t v94 = *(void *)(v90 + 72);
  unint64_t v95 = *(void *)(v90 + 80) - v94;
  if (v93 != v95)
  {
    if (v93 <= v95)
    {
      if (v93 < v95) {
        *(void *)(v90 + 80) = v94 + v93;
      }
    }
    else
    {
      std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v90 + 72, v93 - v95);
    }
    float v96 = *(std::__shared_weak_count **)(v90 + 32);
    *(void *)(v90 + 24) = 0;
    *(void *)(v90 + 32) = 0;
    if (v96 && !atomic_fetch_add(&v96->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
      std::__shared_weak_count::__release_weak(v96);
    }
    *(void *)(v90 + 120) = 0;
    *(_DWORD *)(v90 + 112) = 0;
    uint64_t v94 = *(void *)(v90 + 72);
    uint64_t v97 = *(void *)(v90 + 80) - v94;
    *(void *)(v90 + 40) = 0;
    *(void *)(v90 + 48) = v97;
    *(void *)(v90 + 56) = 0;
    *(void *)(v90 + 64) = v97;
    unint64_t v91 = *(void *)(v90 + 8);
    unint64_t v93 = v91 * v92;
  }
  long long v274 = 0uLL;
  uint64_t v98 = v91 * v266;
  *(void *)&long long v99 = 0;
  *((void *)&v99 + 1) = v90;
  uint64_t v100 = v94 + v98;
  if (v93 == v98) {
    uint64_t v100 = 0;
  }
  long long v274 = v99;
  unint64_t v275 = v98;
  unint64_t v276 = v93;
  uint64_t v278 = v100;
  __int16 v277 = 1;
  __int16 v101 = +[VKPlatform sharedPlatform];
  if ([v101 supports3DBuildingStrokes])
  {
    if (!*((unsigned char *)*v249 + 33))
    {
LABEL_102:

      goto LABEL_105;
    }
    uint64_t v102 = 0;
    unint64_t v103 = **v249;
    while (1)
    {
      int v104 = *v103;
      v103 += 2;
      if (v104 == 35) {
        break;
      }
      if (*((unsigned __int8 *)*v249 + 33) == ++v102) {
        goto LABEL_102;
      }
    }
    BOOL v105 = (**v249)[2 * v102 + 1] == 0;

    if (!v105)
    {
LABEL_105:
      int v106 = v251->_extrusionStrokeMeshVendor.__ptr_.__value_;
      uint64_t v107 = v106[1];
      uint64_t v108 = *(void *)(v107 - 8);
      uint64_t v109 = **(void **)(v108 + 64);
      unint64_t v110 = *(void *)(v109 + 8);
      unint64_t v111 = (*(void *)(v109 + 48) - *(void *)(v109 + 40)) / v110;
      unint64_t v112 = v111 + 4 * v253;
      if (v112 >= 0x10000) {
        ggl::MeshVendor<ggl::PrefilteredLine::PrefilteredLineMesh>::_allocateNewMesh();
      }
      uint64_t v113 = 3 * v253;
      unsigned int v114 = v107 - *(_DWORD *)v106;
      unint64_t v115 = v110 * v112;
      uint64_t v116 = *(void *)(v109 + 72);
      unint64_t v117 = *(void *)(v109 + 80) - v116;
      float v81 = __p;
      if (v115 != v117)
      {
        if (v115 <= v117)
        {
          if (v115 < v117) {
            *(void *)(v109 + 80) = v116 + v115;
          }
        }
        else
        {
          std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v109 + 72, v115 - v117);
          uint64_t v113 = 3 * v253;
        }
        float v118 = *(std::__shared_weak_count **)(v109 + 32);
        *(void *)(v109 + 24) = 0;
        *(void *)(v109 + 32) = 0;
        if (v118 && !atomic_fetch_add(&v118->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          uint64_t v254 = v113;
          ((void (*)(std::__shared_weak_count *))v118->__on_zero_shared)(v118);
          std::__shared_weak_count::__release_weak(v118);
          uint64_t v113 = v254;
        }
        *(void *)(v109 + 120) = 0;
        *(_DWORD *)(v109 + 112) = 0;
        uint64_t v119 = *(void *)(v109 + 80) - *(void *)(v109 + 72);
        *(void *)(v109 + 40) = 0;
        *(void *)(v109 + 48) = v119;
        *(void *)(v109 + 56) = 0;
        *(void *)(v109 + 64) = v119;
        uint64_t v109 = **(void **)(v108 + 64);
      }
      uint64_t v120 = 0;
      uint64_t v121 = 2 * v113;
      long long v290 = 0uLL;
      uint64_t v122 = *(void *)(v109 + 8);
      uint64_t v123 = v122 * v111;
      unint64_t v124 = v122 * v112;
      *(void *)&long long v125 = 0;
      *((void *)&v125 + 1) = v109;
      if (v124 != v123) {
        uint64_t v120 = *(void *)(v109 + 72) + v123;
      }
      unsigned __int8 v126 = (v114 >> 3) - 1;
      long long v290 = v125;
      unint64_t v291 = v123;
      unint64_t v292 = v124;
      uint64_t v294 = v120;
      __int16 v293 = 1;
      uint64_t v127 = *(void *)(v108 + 96);
      unint64_t v128 = *(void *)(v127 + 8);
      unint64_t v129 = (*(void *)(v127 + 48) - *(void *)(v127 + 40)) / v128;
      unint64_t v130 = v129 + v121;
      unint64_t v131 = v128 * (v129 + v121);
      uint64_t v132 = *(void *)(v127 + 72);
      unint64_t v133 = *(void *)(v127 + 80) - v132;
      if (v131 != v133)
      {
        if (v131 <= v133)
        {
          if (v131 < v133) {
            *(void *)(v127 + 80) = v132 + v131;
          }
        }
        else
        {
          std::vector<unsigned char,geo::StdAllocator<unsigned char,mdm::Allocator>>::__append(v127 + 72, v131 - v133);
        }
        float v134 = *(std::__shared_weak_count **)(v127 + 32);
        *(void *)(v127 + 24) = 0;
        *(void *)(v127 + 32) = 0;
        if (v134 && !atomic_fetch_add(&v134->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v134->__on_zero_shared)(v134);
          std::__shared_weak_count::__release_weak(v134);
        }
        *(void *)(v127 + 120) = 0;
        *(_DWORD *)(v127 + 112) = 0;
        uint64_t v132 = *(void *)(v127 + 72);
        uint64_t v135 = *(void *)(v127 + 80) - v132;
        *(void *)(v127 + 40) = 0;
        *(void *)(v127 + 48) = v135;
        *(void *)(v127 + 56) = 0;
        *(void *)(v127 + 64) = v135;
        unint64_t v128 = *(void *)(v127 + 8);
        unint64_t v131 = v128 * v130;
      }
      long long v269 = 0uLL;
      uint64_t v136 = v128 * v129;
      *(void *)&long long v137 = 0;
      *((void *)&v137 + 1) = v127;
      uint64_t v138 = v132 + v136;
      if (v131 == v136) {
        uint64_t v139 = 0;
      }
      else {
        uint64_t v139 = v138;
      }
      long long v269 = v137;
      unint64_t v270 = v136;
      unint64_t v271 = v131;
      uint64_t v273 = v139;
      __int16 v272 = 1;
      v268[0] = v129;
      v268[1] = v130;
      v268[2] = v250;
      _addRangeToList((uint64_t)&v251->_extrusionStrokeCullingGroups, v258, v126, v268);
      v140.i32[0] = LODWORD(v251->super._boundingBox._minimum._e[0]);
      float v141 = v251->super._boundingBox._minimum._e[1];
      float v142 = v251->super._boundingBox._minimum._e[2];
      float v143 = v251->super._boundingBox._maximum._e[0] - *(float *)v140.i32;
      float v144 = v251->super._boundingBox._maximum._e[1] - v141;
      float v145 = v251->super._boundingBox._maximum._e[2] - v142;
      if (v143 >= 0.0) {
        float v146 = 65535.0 / v143;
      }
      else {
        float v146 = INFINITY;
      }
      if (v144 >= 0.0) {
        float v147 = 65535.0 / v144;
      }
      else {
        float v147 = INFINITY;
      }
      if (v145 >= 0.0) {
        float v148 = 65535.0 / v145;
      }
      else {
        float v148 = INFINITY;
      }
      __int16 v149 = (float *)v288;
      LODWORD(v6) = v259;
      if (v288 != &v287)
      {
        uint64_t v150 = (_WORD *)(v294 + 32);
        do
        {
          int v151 = (int)(float)((float)(v149[4] - *(float *)v140.i32) * v146);
          int v152 = (int)(float)((float)(v149[5] - v141) * v147);
          int v153 = (int)(float)((float)(v149[6] - v142) * v148);
          int v154 = (int)(float)((float)(v149[7] - *(float *)v140.i32) * v146);
          int v155 = (int)(float)((float)(v149[8] - v141) * v147);
          int v156 = (int)(float)((float)(v149[9] - v142) * v148);
          *(v150 - 16) = v151;
          *(v150 - 15) = v152;
          *((_DWORD *)v150 - 7) = (unsigned __int16)v153;
          *(v150 - 12) = v154;
          *(v150 - 11) = v155;
          *(v150 - 10) = v156;
          *(v150 - 9) = v8;
          *(v150 - 8) = v151;
          *(v150 - 7) = v152;
          *(v150 - 6) = v153;
          *(v150 - 5) = 256;
          *(v150 - 4) = v154;
          *(v150 - 3) = v155;
          *(v150 - 2) = v156;
          *(v150 - 1) = v8;
          *uint64_t v150 = v151;
          v150[1] = v152;
          v150[2] = v153;
          v150[3] = 1;
          v150[4] = v154;
          v150[5] = v155;
          v150[6] = v156;
          v150[7] = v8;
          v150[8] = v151;
          v150[9] = v152;
          v150[10] = v153;
          v150[11] = 257;
          v150[12] = v154;
          v150[13] = v155;
          v150[14] = v156;
          v150[15] = v8;
          *(_WORD *)uint64_t v139 = v111;
          int16x4_t v157 = vuzp1_s16((int16x4_t)vadd_s32(vdup_n_s32(v111), (int32x2_t)0x200000001), v140);
          *(int16x4_t *)(v139 + 2) = vzip1_s16(v157, vrev32_s16(v157));
          *(_WORD *)(v139 + 10) = v111 + 3;
          __int16 v149 = (float *)*((void *)v149 + 1);
          v139 += 12;
          v111 += 4;
          v150 += 32;
        }
        while (v149 != (float *)&v287);
        uint64_t v139 = v273;
      }
      if (v139)
      {
        unint64_t v158 = v270;
        unint64_t v159 = v271;
        if (v271 != v270)
        {
          long long v160 = v269;
          int v161 = v272;
          int v162 = HIBYTE(v272);
          if ((void)v269 && *(unsigned char *)(*((void *)&v269 + 1) + 17) != 2)
          {
            int v163 = v272;
            (*(void (**)(void))(*(void *)v269 + 64))();
            int v161 = v163;
          }
          if (v161 && !v162)
          {
            unint64_t v165 = *(void *)(*((void *)&v160 + 1) + 56);
            unint64_t v164 = *(void *)(*((void *)&v160 + 1) + 64);
            if (v164 == v165) {
              unint64_t v165 = *(void *)(*((void *)&v160 + 1) + 80) - *(void *)(*((void *)&v160 + 1) + 72);
            }
            if (v158 < v165) {
              unint64_t v165 = v158;
            }
            if (v164 <= v159) {
              unint64_t v164 = v159;
            }
            if (v164 == v165) {
              unint64_t v164 = v165 + *(void *)(*((void *)&v160 + 1) + 80) - *(void *)(*((void *)&v160 + 1) + 72);
            }
            *(void *)(*((void *)&v160 + 1) + 56) = v165;
            *(void *)(*((void *)&v160 + 1) + 64) = v164;
          }
        }
      }
      if (v294)
      {
        unint64_t v167 = v291;
        unint64_t v166 = v292;
        if (v292 != v291)
        {
          v168 = (void *)*((void *)&v290 + 1);
          int v169 = v293;
          int v170 = HIBYTE(v293);
          if ((void)v290 && *(unsigned char *)(*((void *)&v290 + 1) + 17) != 2) {
            (*(void (**)(void))(*(void *)v290 + 64))();
          }
          if (v169 && !v170)
          {
            unint64_t v172 = v168[7];
            unint64_t v171 = v168[8];
            if (v171 == v172) {
              unint64_t v172 = v168[10] - v168[9];
            }
            if (v167 < v172) {
              unint64_t v172 = v167;
            }
            if (v171 <= v166) {
              unint64_t v171 = v166;
            }
            if (v171 == v172) {
              unint64_t v171 = v172 + v168[10] - v168[9];
            }
            v168[7] = v172;
            v168[8] = v171;
          }
        }
      }
    }
  }
  else
  {
  }
  if (v55)
  {
    v173 = (_WORD *)(v278 + 6);
    do
    {
      __int16 v174 = v76 + 1;
      *(v173 - 3) = v76 + 1;
      *(v173 - 2) = v76;
      *(v173 - 1) = v76 + 2;
      _WORD *v173 = v76 + 2;
      __int16 v175 = v76 + 3;
      v76 += 4;
      v173[1] = v175;
      v173[2] = v174;
      v173 += 6;
      --v55;
    }
    while (v55);
  }
  [(VKPolygonalItemGroup *)v251 size];
  if (v6)
  {
    unint64_t v179 = 0;
    uint64_t v180 = 0;
    uint64_t v181 = 0;
    float v182 = 1.0 / v176;
    float v183 = 1.0 / v177;
    unsigned int v263 = (((v262 - v256) >> 3) - 1);
    float v184 = 1.0 / v178;
    do
    {
      float v185 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)v267, v179);
      float v186 = geo::codec::buildingFootprintBaseHeight((uint64_t)v267, v179);
      float v187 = v185 - v186;
      if ((float)(v185 - v186) < 0.0)
      {
        long long v269 = 0uLL;
        v188 = (std::__shared_weak_count *)v267[1];
        if (v188)
        {
          v188 = std::__shared_weak_count::lock(v188);
          v189 = v188;
          *((void *)&v269 + 1) = v188;
          if (v188)
          {
            v188 = (std::__shared_weak_count *)*v267;
            *(void *)&long long v269 = *v267;
          }
        }
        else
        {
          v189 = 0;
        }
        geo::codec::VectorTile::key((geo::codec::VectorTile *)v188);
        *(void *)&long long v290 = GEOTileKeyMake();
        *((void *)&v290 + 1) = v190;
        if (v189 && !atomic_fetch_add(&v189->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v189->__on_zero_shared)(v189);
          std::__shared_weak_count::__release_weak(v189);
        }
        NSLog((NSString *)@"baseHeight (%f) > height (%f) for feature in tile %d.%d.%d", v186, v185, ((*(void *)((char *)&v290 + 1) >> 46) | (*(_DWORD *)((char *)&v290 + 9) << 18)) & 0x3FFFFFF, ((*(unsigned int *)((char *)&v290 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v290 + 13) | (HIBYTE(v290) << 16)) << 32)) >> 8) & 0x3FFFFFF, (*(void *)((char *)&v290 + 1) >> 40) & 0x3FLL);
        float v187 = 0.0;
        float v186 = v185;
      }
      *(void *)&long long v269 = 0;
      v191 = geo::codec::multiSectionFeaturePoints(v267, v179, &v269);
      int v192 = *(_DWORD *)&v81[4 * v179];
      *(void *)&long long v290 = v181 + v266;
      *((void *)&v290 + 1) = v181 + v266 + 6 * v269;
      unint64_t v291 = v250;
      _addRangeToList((uint64_t)&v251->_extrusionFillCullingGroups, v192, v263, &v290);
      uint64_t v193 = v269;
      if ((void)v269)
      {
        unint64_t v194 = 0;
        uint64_t v195 = v283;
        v196 = (float *)v191 + 1;
        uint64_t v197 = 16 * v180 + 59;
        do
        {
          unint64_t v198 = v194 + 1;
          if (v194 + 1 == v193) {
            unint64_t v199 = 0;
          }
          else {
            unint64_t v199 = v194 + 1;
          }
          v200 = (float *)&v191[v199];
          float v201 = *v200;
          float v202 = v200[1];
          float v203 = *(v196 - 1);
          float v204 = *v200 - v203;
          float v205 = v202 - *v196;
          float v206 = sqrtf((float)(v204 * v204) + (float)(v205 * v205));
          int v207 = (int)((float)(v206 * 133.33) + 0.5);
          if (v207) {
            BOOL v208 = (int)(float)(v187 * 133.33) == 0;
          }
          else {
            BOOL v208 = 1;
          }
          int v209 = v208;
          float v210 = 1.0 / v206;
          int v211 = (int)(float)(v210 * (float)(127.0 * v205));
          int v212 = (int)(float)((float)(v204 * -127.0) * v210);
          if (v187 < 0.025) {
            int v209 = 1;
          }
          BOOL v213 = v209 == 0;
          if (v209) {
            __int16 v214 = 0;
          }
          else {
            __int16 v214 = (int)(float)(v187 * 133.33);
          }
          float v215 = v251->super._boundingBox._minimum._e[0];
          float v216 = v251->super._boundingBox._minimum._e[1];
          float v217 = v251->super._boundingBox._minimum._e[2];
          int v218 = (int)(float)((float)((float)(v203 - v215) * 65535.0) * v182);
          int v219 = (int)(float)((float)((float)(*v196 - v216) * 65535.0) * v183);
          int v220 = (int)(float)((float)((float)(v186 - v217) * 65535.0) * v184);
          uint64_t v221 = v195 + v197;
          *(_WORD *)(v221 - 59) = v218;
          *(_WORD *)(v221 - 57) = v219;
          *(_DWORD *)(v221 - 55) = (unsigned __int16)v220;
          *(unsigned char *)(v221 - 51) = v211;
          *(unsigned char *)(v221 - 50) = v212;
          *(unsigned char *)(v221 - 49) = 0;
          *(unsigned char *)(v221 - 48) = v8;
          int v222 = (int)(float)((float)((float)(v185 - v217) * 65535.0) * v184);
          *(_WORD *)(v221 - 43) = v218;
          *(_WORD *)(v221 - 41) = v219;
          *(_WORD *)(v221 - 39) = v222;
          *(_WORD *)(v221 - 37) = v214;
          *(unsigned char *)(v221 - 35) = v211;
          *(unsigned char *)(v221 - 34) = v212;
          *(unsigned char *)(v221 - 33) = 0;
          *(unsigned char *)(v221 - 32) = v8;
          int v223 = (int)(float)((float)((float)(v201 - v215) * 65535.0) * v182);
          int v224 = (int)(float)((float)((float)(v202 - v216) * 65535.0) * v183);
          uint64_t v195 = v283;
          v225 = (unsigned char *)(v283 + v197);
          *(_WORD *)(v283 + v197 - 27) = v223;
          __int16 v226 = (_WORD)v207 << 8;
          if (!v213) {
            __int16 v226 = 0;
          }
          *(_WORD *)(v225 - 25) = v224;
          *(_WORD *)(v225 - 23) = v220;
          *(_WORD *)(v225 - 21) = v226;
          *(v225 - 19) = v211;
          *(v225 - 18) = v212;
          *(v225 - 17) = 0;
          *(v225 - 16) = v8;
          *(_WORD *)(v225 - 11) = v223;
          *(_WORD *)(v225 - 9) = v224;
          *(_WORD *)(v225 - 7) = v222;
          *(_WORD *)(v225 - 5) = v226 + v214;
          *(v225 - 3) = v211;
          *(v225 - 2) = v212;
          *(v225 - 1) = 0;
          unsigned char *v225 = v8;
          v180 += 4;
          v181 += 6;
          uint64_t v193 = v269;
          v196 += 2;
          v197 += 64;
          unint64_t v194 = v198;
        }
        while (v198 < (unint64_t)v269);
      }
      ++v179;
    }
    while (v179 != v259);
  }
  if (v278)
  {
    unint64_t v228 = v275;
    unint64_t v227 = v276;
    if (v276 != v275)
    {
      long long v229 = v274;
      int v230 = v277;
      int v231 = HIBYTE(v277);
      if ((void)v274 && *(unsigned char *)(*((void *)&v274 + 1) + 17) != 2) {
        (*(void (**)(void))(*(void *)v274 + 64))();
      }
      if (v230 && !v231)
      {
        unint64_t v233 = *(void *)(*((void *)&v229 + 1) + 56);
        unint64_t v232 = *(void *)(*((void *)&v229 + 1) + 64);
        if (v232 == v233) {
          unint64_t v233 = *(void *)(*((void *)&v229 + 1) + 80) - *(void *)(*((void *)&v229 + 1) + 72);
        }
        if (v228 < v233) {
          unint64_t v233 = v228;
        }
        if (v232 <= v227) {
          unint64_t v232 = v227;
        }
        if (v232 == v233) {
          unint64_t v232 = v233 + *(void *)(*((void *)&v229 + 1) + 80) - *(void *)(*((void *)&v229 + 1) + 72);
        }
        *(void *)(*((void *)&v229 + 1) + 56) = v233;
        *(void *)(*((void *)&v229 + 1) + 64) = v232;
      }
    }
  }
  if (v283)
  {
    unint64_t v235 = v280;
    unint64_t v234 = v281;
    if (v281 != v280)
    {
      long long v236 = v279;
      int v237 = v282;
      int v238 = HIBYTE(v282);
      if ((void)v279 && *(unsigned char *)(*((void *)&v279 + 1) + 17) != 2) {
        (*(void (**)(void))(*(void *)v279 + 64))();
      }
      if (v237 && !v238)
      {
        unint64_t v240 = *(void *)(*((void *)&v236 + 1) + 56);
        unint64_t v239 = *(void *)(*((void *)&v236 + 1) + 64);
        if (v239 == v240) {
          unint64_t v240 = *(void *)(*((void *)&v236 + 1) + 80) - *(void *)(*((void *)&v236 + 1) + 72);
        }
        if (v235 < v240) {
          unint64_t v240 = v235;
        }
        if (v239 <= v234) {
          unint64_t v239 = v234;
        }
        if (v239 == v240) {
          unint64_t v239 = v240 + *(void *)(*((void *)&v236 + 1) + 80) - *(void *)(*((void *)&v236 + 1) + 72);
        }
        *(void *)(*((void *)&v236 + 1) + 56) = v240;
        *(void *)(*((void *)&v236 + 1) + 64) = v239;
      }
    }
  }
  if (v286)
  {
    v242 = v284;
    v241 = v285;
    uint64_t v243 = *v285;
    *(void *)(v243 + 8) = v284[1];
    *(void *)v242[1] = v243;
    uint64_t v286 = 0;
    if (v241 != &v284)
    {
      do
      {
        v244 = (void *)v241[1];
        operator delete(v241);
        v241 = v244;
      }
      while (v244 != &v284);
    }
  }
  if (v289)
  {
    v246 = v287;
    v245 = v288;
    v247 = *v288;
    *((void *)v247 + 1) = *((void *)v287 + 1);
    **((void **)v246 + 1) = v247;
    uint64_t v289 = 0;
    if (v245 != &v287)
    {
      do
      {
        v248 = (float **)v245[1];
        operator delete(v245);
        v245 = v248;
      }
      while (v248 != &v287);
    }
  }
  if (__p) {
    operator delete(__p);
  }
}

- (void)addBuilding:(void *)a3 index:(unint64_t)a4 ofTotal:(unint64_t)a5 accessor:(ResourceAccessor *)a6 triangulator:(void *)a7 prepareExtrusion:(BOOL)a8 forRoofStyle:(unsigned __int8)a9 scaleThreshold:(float)a10
{
  BOOL v10 = a8;
  uint64_t v125 = *MEMORY[0x1E4F143B8];
  uint64_t v18 = *((unsigned int *)a3 + 25);
  uint64_t v113 = *((void *)a3 + 5);
  unsigned int v114 = self;
  unsigned int v19 = [(VKPolygonalItemGroup *)self indexForGeoFeatureAttributes:(char *)a3 + 24];
  char v112 = v19;
  BOOL v96 = v10;
  if (a9 == 1)
  {
    unsigned int v20 = v19;
    BOOL PointyRoofForBuilding = _shouldMakePointyRoofForBuilding((uint64_t)a3);
    BOOL v111 = PointyRoofForBuilding;
    if (PointyRoofForBuilding)
    {
      *(float *)&double v23 = (float)v20;
      *(float *)&double v22 = a10;
      BOOL v24 = [(VKBuildingGroup *)self addPointyRoofForBuilding:a3 buildingModel:*((_DWORD *)a3 + 10) & 1 scaleThreshold:v22 styleIndex:v23];
      BOOL v111 = v24;
    }
    else
    {
      BOOL v24 = 0;
    }
  }
  else
  {
    BOOL v24 = 0;
    BOOL v111 = 0;
  }
  [(VKPolygonalItemGroup *)self size];
  v110[0] = v25;
  v110[1] = v26;
  v110[2] = v27;
  if (v18)
  {
    unint64_t v93 = a4;
    unint64_t v94 = a5;
    unint64_t v28 = 0;
    p_boundingBox = &self->super._boundingBox;
    unint64_t v95 = a6;
    while (1)
    {
      uint64_t v108 = 0;
      unint64_t v109 = 0;
      uint64_t v108 = (float *)geo::codec::multiSectionFeaturePoints(a3, v28, &v109);
      if (geo::codec::multiSectionFeaturePrecision((uint64_t)a3) <= 0x10)
      {
        float v107 = 0.0;
        float v107 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)a3, v28);
        unint64_t v29 = v109;
        if (v109 >= 3)
        {
          int v106 = 0;
          uint64_t v30 = v108;
          int v106 = ggl::CullingGrid::intersectedCellsForRibbon(v109, v108, 1);
          v114->super._cullingMask |= v106;
          md::Triangulator<float>::triangulate((uint64_t)a7, (uint64_t)v30, v29, v31, v32, v33, v34, v35, v36);
          uint64_t v38 = *((void *)a7 + 11);
          uint64_t v37 = *((void *)a7 + 12);
          uint64_t v39 = v37 - v38;
          if (v37 != v38)
          {
            float v40 = v114;
            float v41 = &OBJC_IVAR___VKBuildingGroup__fillMeshInfoForPointyRoofs;
            if (!v111) {
              float v41 = &OBJC_IVAR___VKPolygonalItemGroup__fillMeshInfo;
            }
            uint64_t v42 = *v41;
            unint64_t v43 = v109;
            unint64_t v44 = operator new(0x68uLL);
            void *v44 = &unk_1EF56BE08;
            v44[1] = &v109;
            v44[2] = &v108;
            v44[3] = &v107;
            v44[4] = p_boundingBox;
            v44[5] = v110;
            v44[6] = &v112;
            v44[7] = a7;
            v44[8] = &v111;
            v44[9] = &v114;
            v44[10] = &v106;
            v44[11] = (char *)v40 + v42;
            v44[12] = &v113;
            unint64_t v124 = v44;
            md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::writePoints((uint64_t)&v40->super._fillMeshInfo + v42, v43, v39 >> 1, (unint64_t)a6, (uint64_t)v123, v45);
            if (v124 == v123)
            {
              (*(void (**)(void *))(v123[0] + 32))(v123);
            }
            else if (v124)
            {
              (*(void (**)(void *))(*v124 + 40))(v124);
            }
            md::PolygonSection::PolygonSection((uint64_t)v98, a3, v28);
            *(void *)&long long buf = a3;
            *((void *)&buf + 1) = v28;
            int v46 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long>&&>,std::tuple<>>((uint64_t)&v114->super._polygonEdges, (unint64_t)a3, v28, &buf);
            uint64_t v47 = v46[4];
            uint64_t v48 = v46[5];
            uint64_t v49 = v46 + 4;
            uint64_t v50 = v48 - v47;
            if (v48 != v47)
            {
              uint64_t v51 = a6;
              unint64_t v52 = v109;
              long long v53 = v114;
              uint64_t v122 = 0;
              unint64_t v54 = operator new(0x60uLL);
              void *v54 = &unk_1EF56BE50;
              v54[1] = &v109;
              v54[2] = &v108;
              v54[3] = &v107;
              v54[4] = p_boundingBox;
              v54[5] = v110;
              v54[6] = v98;
              v54[7] = &v112;
              v54[8] = v49;
              v54[9] = &v114;
              v54[10] = &v106;
              v54[11] = &v113;
              unint64_t v55 = 2 * v52;
              uint64_t v122 = v54;
              if (v55 < 0x10000)
              {
                p_strokeMeshInfo = &v53->_strokeMeshInfo;
                uint64_t v58 = WORD1(p_strokeMeshInfo[9]._value.type);
                if (v55 > (v58 ^ 0xFFFFuLL))
                {
                  unsigned __int8 v59 = p_strokeMeshInfo[9]._value.data[0] + 1;
                  p_strokeMeshInfo[9]._value.data[0] = v59;
                  WORD1(p_strokeMeshInfo[9]._value.type) = 0;
                  HIDWORD(p_strokeMeshInfo[9]._value.type) = 0;
                  uint64_t v60 = **(void **)(*(void *)(*(void *)&p_strokeMeshInfo[2]._hasValue + 16 * v59) + 64);
                  uint64_t v61 = *(unsigned __int16 *)(*(void *)&p_strokeMeshInfo->_value.type + 8 * v59);
                  long long buf = 0uLL;
                  uint64_t v62 = *(void *)(v60 + 8) * v61;
                  if (v62)
                  {
                    if (v51 && *(unsigned char *)(v60 + 17) != 2) {
                      uint64_t v63 = (*((uint64_t (**)(ResourceAccessor *, uint64_t, void, uint64_t, uint64_t, uint64_t))v51->var0
                    }
                             + 7))(v51, v60, 0, v62, 1, 1);
                    else {
                      uint64_t v63 = *(void *)(v60 + 72);
                    }
                  }
                  else
                  {
                    uint64_t v63 = 0;
                  }
                  *(void *)&long long v64 = v95;
                  *((void *)&v64 + 1) = v60;
                  long long buf = v64;
                  unint64_t v117 = 0;
                  unint64_t v118 = v62;
                  uint64_t v120 = v63;
                  __int16 v119 = 257;
                  ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[3]._value, (uint64_t)&buf);
                  if (v120)
                  {
                    unint64_t v66 = v117;
                    unint64_t v65 = v118;
                    if (v118 != v117)
                    {
                      long long v67 = (void *)*((void *)&buf + 1);
                      int v68 = v119;
                      int v69 = HIBYTE(v119);
                      if ((void)buf && *(unsigned char *)(*((void *)&buf + 1) + 17) != 2)
                      {
                        unint64_t v91 = (void *)*((void *)&buf + 1);
                        int v87 = v119;
                        int v89 = HIBYTE(v119);
                        (*(void (**)(void))(*(void *)buf + 64))(buf);
                        int v68 = v87;
                        int v69 = v89;
                        long long v67 = v91;
                      }
                      if (v68 && !v69)
                      {
                        unint64_t v70 = v67[7];
                        unint64_t v71 = v67[8];
                        if (v71 == v70) {
                          unint64_t v70 = v67[10] - v67[9];
                        }
                        if (v66 < v70) {
                          unint64_t v70 = v66;
                        }
                        if (v71 <= v65) {
                          unint64_t v71 = v65;
                        }
                        if (v71 == v70) {
                          unint64_t v71 = v70 + v67[10] - v67[9];
                        }
                        v67[7] = v70;
                        v67[8] = v71;
                      }
                    }
                  }
                  uint64_t v72 = p_strokeMeshInfo[9]._value.data[0];
                  uint64_t v73 = *(void *)(*(void *)(*(void *)&p_strokeMeshInfo[2]._hasValue + 16 * v72) + 96);
                  uint64_t v74 = *(unsigned int *)(*(void *)&p_strokeMeshInfo->_value.type + 8 * v72 + 4);
                  long long buf = 0uLL;
                  uint64_t v75 = *(void *)(v73 + 8) * v74;
                  if (v75)
                  {
                    if (v51 && *(unsigned char *)(v73 + 17) != 2) {
                      uint64_t v76 = (*((uint64_t (**)(ResourceAccessor *, uint64_t, void, uint64_t, uint64_t, uint64_t))v51->var0
                    }
                             + 7))(v51, v73, 0, v75, 1, 1);
                    else {
                      uint64_t v76 = *(void *)(v73 + 72);
                    }
                  }
                  else
                  {
                    uint64_t v76 = 0;
                  }
                  *(void *)&long long v77 = v95;
                  *((void *)&v77 + 1) = v73;
                  long long buf = v77;
                  unint64_t v117 = 0;
                  unint64_t v118 = v75;
                  uint64_t v120 = v76;
                  __int16 v119 = 257;
                  ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[6]._value, (uint64_t)&buf);
                  if (v120)
                  {
                    unint64_t v79 = v117;
                    unint64_t v78 = v118;
                    if (v118 != v117)
                    {
                      unint64_t v80 = (void *)*((void *)&buf + 1);
                      int v81 = v119;
                      int v82 = HIBYTE(v119);
                      if ((void)buf && *(unsigned char *)(*((void *)&buf + 1) + 17) != 2)
                      {
                        unint64_t v92 = (void *)*((void *)&buf + 1);
                        int v88 = v119;
                        int v90 = HIBYTE(v119);
                        (*(void (**)(void))(*(void *)buf + 64))(buf);
                        int v81 = v88;
                        int v82 = v90;
                        unint64_t v80 = v92;
                      }
                      if (v81 && !v82)
                      {
                        unint64_t v83 = v80[7];
                        unint64_t v84 = v80[8];
                        if (v84 == v83) {
                          unint64_t v83 = v80[10] - v80[9];
                        }
                        if (v79 < v83) {
                          unint64_t v83 = v79;
                        }
                        if (v84 <= v78) {
                          unint64_t v84 = v78;
                        }
                        if (v84 == v83) {
                          unint64_t v84 = v83 + v80[10] - v80[9];
                        }
                        v80[7] = v83;
                        v80[8] = v84;
                      }
                    }
                  }
                  uint64_t v58 = WORD1(p_strokeMeshInfo[9]._value.type);
                  unint64_t v54 = v122;
                }
                unint64_t v85 = 0x924924924924924ALL * (v50 >> 3);
                *(void *)&long long buf = v58;
                *((void *)&buf + 1) = v55 + v58;
                unint64_t v86 = v85 + HIDWORD(p_strokeMeshInfo[9]._value.type);
                v115[0] = HIDWORD(p_strokeMeshInfo[9]._value.type);
                v115[1] = v86;
                if (!v54)
                {
                  std::__throw_bad_function_call[abi:nn180100]();
                  __break(1u);
                  return;
                }
                a6 = v51;
                (*(void (**)(void *, long long *, void *, ValueUnion *, ValueUnion *))(*v54 + 48))(v54, &buf, v115, &p_strokeMeshInfo[3]._value, &p_strokeMeshInfo[6]._value);
                WORD1(p_strokeMeshInfo[9]._value.type) += v55;
                HIDWORD(p_strokeMeshInfo[9]._value.type) += v85;
              }
              else
              {
                if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
                  dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
                }
                unint64_t v56 = (id)GEOGetVectorKitVKDefaultLog_log;
                if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
                {
                  LOWORD(buf) = 0;
                  _os_log_impl(&dword_1A1780000, v56, OS_LOG_TYPE_ERROR, "MeshSet: Cannot write points for polygons: polygon is too big", (uint8_t *)&buf, 2u);
                }
              }
              if (v122 == v121)
              {
                (*(void (**)(void *))(v121[0] + 32))(v121);
              }
              else if (v122)
              {
                (*(void (**)(void *))(*v122 + 40))(v122);
              }
            }
            v98[0] = &unk_1EF534428;
            if (__p)
            {
              BOOL v105 = __p;
              operator delete(__p);
            }
            if (v103) {
              operator delete(v103);
            }
            if (v101)
            {
              uint64_t v102 = v101;
              operator delete(v101);
            }
            if (v99)
            {
              uint64_t v100 = v99;
              operator delete(v99);
            }
          }
        }
      }
      if (v18 == ++v28)
      {
        BOOL v24 = v111;
        a4 = v93;
        a5 = v94;
        break;
      }
    }
  }
  if (v96 && !v24) {
    [(VKBuildingGroup *)v114 addExtrusionForBuilding:a3 index:a4 ofTotal:a5];
  }
}

- (void)addBuilding:index:ofTotal:accessor:triangulator:prepareExtrusion:forRoofStyle:scaleThreshold:
{
}

- (__n128)addBuilding:index:ofTotal:accessor:triangulator:prepareExtrusion:forRoofStyle:scaleThreshold:
{
  v2 = (char *)operator new(0x68uLL);
  *(void *)v2 = &unk_1EF56BE08;
  *(_OWORD *)(v2 + 40) = *(_OWORD *)(a1 + 40);
  *(_OWORD *)(v2 + 56) = *(_OWORD *)(a1 + 56);
  *(_OWORD *)(v2 + 72) = *(_OWORD *)(a1 + 72);
  *(_OWORD *)(v2 + 88) = *(_OWORD *)(a1 + 88);
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  __n128 result = *(__n128 *)(a1 + 24);
  *(__n128 *)(v2 + 24) = result;
  return result;
}

- (void)didFinishAddingData
{
  v33.receiver = self;
  v33.super_class = (Class)VKBuildingGroup;
  [(VKPolygonalItemGroup *)&v33 didFinishAddingData];
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  uint64_t v4 = *(void *)&self->_anon_b28[160];
  if (v4 && *(void *)v4 == *(void *)&self->_anon_b28[144]) {
    *(unsigned char *)(v4 + 80) = 1;
  }
  v5 = *(md::MeshSetStorage **)&self->_anon_b28[152];
  if (v5) {
    md::MeshSetStorage::finalize(v5);
  }
  uint64_t v40 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_b28[40], (uint64_t)&v34);
  if (v40)
  {
    unint64_t v7 = v36;
    unint64_t v6 = v37;
    if (v37 != v36)
    {
      __int16 v8 = (void *)v35;
      int v9 = v38;
      int v10 = v39;
      if (v34 && *(unsigned char *)(v35 + 17) != 2) {
        (*(void (**)(void))(*(void *)v34 + 64))();
      }
      if (v9 && !v10)
      {
        unint64_t v12 = v8[7];
        unint64_t v11 = v8[8];
        if (v11 == v12) {
          unint64_t v12 = v8[10] - v8[9];
        }
        if (v7 < v12) {
          unint64_t v12 = v7;
        }
        if (v11 <= v6) {
          unint64_t v11 = v6;
        }
        if (v11 == v12) {
          unint64_t v11 = v12 + v8[10] - v8[9];
        }
        v8[7] = v12;
        v8[8] = v11;
      }
    }
  }
  uint64_t v40 = 0;
  uint64_t v34 = 0;
  uint64_t v35 = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_b28[88], (uint64_t)&v34);
  if (v40)
  {
    unint64_t v14 = v36;
    unint64_t v13 = v37;
    if (v37 != v36)
    {
      int64_t v15 = (void *)v35;
      int v16 = v38;
      int v17 = v39;
      if (v34 && *(unsigned char *)(v35 + 17) != 2) {
        (*(void (**)(void))(*(void *)v34 + 64))();
      }
      if (v16 && !v17)
      {
        unint64_t v19 = v15[7];
        unint64_t v18 = v15[8];
        if (v18 == v19) {
          unint64_t v19 = v15[10] - v15[9];
        }
        if (v14 < v19) {
          unint64_t v19 = v14;
        }
        if (v18 <= v13) {
          unint64_t v18 = v13;
        }
        if (v18 == v19) {
          unint64_t v18 = v19 + v15[10] - v15[9];
        }
        v15[7] = v19;
        v15[8] = v18;
      }
    }
  }
  p_strokeMeshes = &self->_strokeMeshes;
  begin = (char *)self->_strokeMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_strokeMeshes.__end_;
    double v23 = self->_strokeMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        BOOL v24 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
        end -= 16;
      }
      while (end != begin);
      double v23 = p_strokeMeshes->__begin_;
    }
    self->_strokeMeshes.__end_ = begin;
    operator delete(v23);
    p_strokeMeshes->__begin_ = 0;
    self->_strokeMeshes.__end_ = 0;
    self->_strokeMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_strokeMeshes->__begin_ = *(_OWORD *)&self->_anon_b28[16];
  self->_strokeMeshes.__end_cap_.__value_ = *(void **)&self->_anon_b28[32];
  *(void *)&self->_anon_b28[16] = 0;
  *(void *)&self->_anon_b28[24] = 0;
  *(void *)&self->_anon_b28[32] = 0;
  p_fillMeshInfoForPointyRoofs = &self->_fillMeshInfoForPointyRoofs;
  p_value = &self->_fillMeshInfoForPointyRoofs._value;
  int v27 = md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::finishedWriting((uint64_t *)&self->_fillMeshInfoForPointyRoofs._value);
  p_fillMeshesForPointyRoofs = &self->_fillMeshesForPointyRoofs;
  unint64_t v29 = (char *)self->_fillMeshesForPointyRoofs.__begin_;
  if (v29)
  {
    uint64_t v30 = (char *)self->_fillMeshesForPointyRoofs.__end_;
    float32x4_t v31 = self->_fillMeshesForPointyRoofs.__begin_;
    if (v30 != v29)
    {
      do
      {
        double v32 = (std::__shared_weak_count *)*((void *)v30 - 1);
        if (v32 && !atomic_fetch_add(&v32->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
          std::__shared_weak_count::__release_weak(v32);
        }
        v30 -= 16;
      }
      while (v30 != v29);
      float32x4_t v31 = p_fillMeshesForPointyRoofs->__begin_;
    }
    p_fillMeshesForPointyRoofs->__end_ = v29;
    operator delete(v31);
    p_fillMeshesForPointyRoofs->__begin_ = 0;
    p_fillMeshesForPointyRoofs->__end_ = 0;
    p_fillMeshesForPointyRoofs->__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_fillMeshesForPointyRoofs->__begin_ = *(_OWORD *)v27;
  p_fillMeshesForPointyRoofs->__end_cap_.__value_ = (void *)v27[2];
  uint64_t *v27 = 0;
  v27[1] = 0;
  v27[2] = 0;
  if (p_strokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_strokeMeshInfo->_value);
    p_strokeMeshInfo->_hasValue = 0;
  }
  if (p_fillMeshInfoForPointyRoofs->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)p_value);
    p_fillMeshInfoForPointyRoofs->_hasValue = 0;
  }
}

- (void)willAddDataWithAccessor:(ResourceAccessor *)a3
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v74.receiver = self;
  v74.super_class = (Class)VKBuildingGroup;
  -[VKPolygonalItemGroup willAddDataWithAccessor:](&v74, sel_willAddDataWithAccessor_);
  int v68 = self;
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  unint64_t v7 = *(uint64_t **)&p_strokeMeshInfo[10]._value.type;
  if (v7) {
    md::MeshSetStorage::prepareStorage(v7, a3);
  }
  int v69 = a3;
  double type = p_strokeMeshInfo->_value.type;
  __int16 v8 = *(unsigned __int16 **)&p_strokeMeshInfo[1]._hasValue;
  if (*(unsigned __int16 **)&type != v8)
  {
    while (1)
    {
      if (!**(_WORD **)&type || !*(_DWORD *)(*(void *)&type + 4)) {
        goto LABEL_6;
      }
      uint64_t v10 = *(void *)&p_strokeMeshInfo[10]._hasValue;
      if (*(unsigned char *)(v10 + 40)
        && (unint64_t v11 = *(void **)&p_strokeMeshInfo[11]._hasValue) != 0
        && *v11 == v10
        && (uint64_t v12 = v11[1] * (unsigned __int16)**(_WORD **)&type,
            uint64_t v13 = v11[8],
            uint64_t v14 = v11[4],
            v13 + v12 <= (unint64_t)(v11[5] - v14)))
      {
        *(void *)&long long v78 = v14 + v13;
        *((void *)&v78 + 1) = v14 + v13 + v12;
        v11[8] = v13 + v12;
        uint64_t v75 = "Polygon Stroke Index Data";
        uint64_t v40 = v11[14];
        if (!v40)
        {
          std::__throw_bad_function_call[abi:nn180100]();
          _Unwind_Resume(v67);
        }
        (*(void (**)(long long *__return_ptr))(*(void *)v40 + 48))(&v77);
        uint64_t v10 = *(void *)&p_strokeMeshInfo[10]._hasValue;
      }
      else
      {
        long long v77 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v75, v10, *(void **)&p_strokeMeshInfo[11]._hasValue, (uint64_t)"Polygon Stroke Vertex Data", *(unsigned int *)(*(void *)&type + 4));
      long long v71 = v77;
      int64_t v15 = (std::__shared_weak_count *)*((void *)&v77 + 1);
      if (*((void *)&v77 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v77 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      int v16 = (char *)operator new(0xA8uLL);
      *((void *)v16 + 1) = 0;
      *((void *)v16 + 2) = 0;
      *(void *)int v16 = &unk_1EF5880C0;
      int v17 = v75;
      unint64_t v18 = v76;
      if (v76) {
        atomic_fetch_add_explicit(&v76->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      {
        {
          ggl::MeshTyped<ggl::BuildingFlatStroke::DefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::BuildingFlatStroke::defaultVboReflection;
        }
        ggl::MeshTyped<ggl::BuildingFlatStroke::DefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::BuildingFlatStroke::DefaultVbo>::attributesReflection(void)::r;
        unk_1EB32B638 = 1;
      }
      unint64_t v19 = v16 + 24;
      *((void *)v16 + 11) = 0;
      *((void *)v16 + 7) = 0;
      *((void *)v16 + 8) = 0;
      *((_DWORD *)v16 + 18) = 0;
      *((void *)v16 + 3) = &unk_1EF5606B0;
      *((void *)v16 + 4) = "Polygon Stroke Mesh";
      *((void *)v16 + 5) = &unk_1EF5606D0;
      *((void *)v16 + 6) = 0;
      *((void *)v16 + 10) = &ggl::MeshTyped<ggl::BuildingFlatStroke::DefaultVbo>::typedReflection(void)::r;
      *((void *)v16 + 12) = 0;
      *((void *)v16 + 13) = 0;
      {
        operator new();
      }
      unsigned int v20 = &qword_1EB32C000;
      uint64_t v21 = ggl::Allocator::instance(void)::alloc;
      *((void *)v16 + 18) = 0;
      *((void *)v16 + 15) = 0;
      *((void *)v16 + 16) = 0;
      *((void *)v16 + 14) = v21;
      {
        unsigned int v20 = &qword_1EB32C000;
        if (v41) {
          operator new();
        }
      }
      *((void *)v16 + 19) = v20[287];
      *((void *)v16 + 20) = 0;
      *((void *)v16 + 17) = v16 + 144;
      *((void *)v16 + 3) = &unk_1EF562460;
      *((void *)v16 + 5) = &unk_1EF562480;
      long long v78 = v71;
      if (v15) {
        atomic_fetch_add_explicit(&v15->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v16 + 88), (uint64_t *)&v78, (uint64_t *)&v79, 1uLL);
      double v22 = (std::__shared_weak_count *)*((void *)&v78 + 1);
      if (*((void *)&v78 + 1))
      {
        if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v78 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      if (v18) {
        goto LABEL_26;
      }
LABEL_27:
      double v23 = (std::__shared_weak_count *)*((void *)v16 + 16);
      *((void *)v16 + 15) = v17;
      *((void *)v16 + 16) = v18;
      if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
        std::__shared_weak_count::__release_weak(v23);
      }
      void *v19 = &unk_1EF55F0D8;
      *((void *)v16 + 5) = &unk_1EF55F0F8;
      if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
        if (!v15) {
          goto LABEL_38;
        }
      }
      else if (!v15)
      {
        goto LABEL_38;
      }
      if (!atomic_fetch_add(&v15->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
LABEL_38:
      double v25 = p_strokeMeshInfo[2]._value.type;
      unint64_t v24 = *(void *)&p_strokeMeshInfo[3]._hasValue;
      if (*(void *)&v25 >= v24)
      {
        int v27 = *(void **)&p_strokeMeshInfo[2]._hasValue;
        uint64_t v28 = (uint64_t)(*(void *)&v25 - (void)v27) >> 4;
        unint64_t v29 = v28 + 1;
        if ((unint64_t)(v28 + 1) >> 60) {
          abort();
        }
        uint64_t v30 = v24 - (void)v27;
        if (v30 >> 3 > v29) {
          unint64_t v29 = v30 >> 3;
        }
        if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v31 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v31 = v29;
        }
        if (v31 >> 60) {
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        double v32 = (char *)operator new(16 * v31);
        v5.n128_u64[0] = (unint64_t)(v16 + 24);
        v5.n128_u64[1] = (unint64_t)v16;
        objc_super v33 = (__n128 *)&v32[16 * v28];
        uint64_t v34 = &v32[16 * v31];
        __n128 *v33 = v5;
        int v26 = v33 + 1;
        if (*(void **)&v25 == v27)
        {
          *(void *)&p_strokeMeshInfo[2]._hasValue = v33;
          *(void *)&p_strokeMeshInfo[2]._value.double type = v26;
          *(void *)&p_strokeMeshInfo[3]._hasValue = v34;
        }
        else
        {
          do
          {
            __n128 v35 = *(__n128 *)(*(void *)&v25 - 16);
            *(void *)&v25 -= 16;
            __n128 v5 = v35;
            v33[-1] = v35;
            --v33;
            **(void **)&double v25 = 0;
            *(void *)(*(void *)&v25 + 8) = 0;
          }
          while (*(void **)&v25 != v27);
          double v25 = *(double *)&p_strokeMeshInfo[2]._hasValue;
          double v36 = p_strokeMeshInfo[2]._value.type;
          *(void *)&p_strokeMeshInfo[2]._hasValue = v33;
          *(void *)&p_strokeMeshInfo[2]._value.double type = v26;
          *(void *)&p_strokeMeshInfo[3]._hasValue = v34;
          while (*(void *)&v36 != *(void *)&v25)
          {
            unint64_t v37 = *(std::__shared_weak_count **)(*(void *)&v36 - 8);
            if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
              std::__shared_weak_count::__release_weak(v37);
            }
            *(void *)&v36 -= 16;
          }
        }
        if (v25 != 0.0) {
          operator delete(*(void **)&v25);
        }
      }
      else
      {
        **(void **)&double v25 = v19;
        *(void *)(*(void *)&v25 + 8) = v16;
        int v26 = (__n128 *)(*(void *)&v25 + 16);
      }
      *(void *)&p_strokeMeshInfo[2]._value.double type = v26;
      unsigned __int8 v38 = v76;
      if (v76 && !atomic_fetch_add(&v76->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
        std::__shared_weak_count::__release_weak(v38);
        unsigned __int8 v39 = (std::__shared_weak_count *)*((void *)&v77 + 1);
        if (*((void *)&v77 + 1))
        {
LABEL_61:
          if (!atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
            std::__shared_weak_count::__release_weak(v39);
          }
        }
      }
      else
      {
        unsigned __int8 v39 = (std::__shared_weak_count *)*((void *)&v77 + 1);
        if (*((void *)&v77 + 1)) {
          goto LABEL_61;
        }
      }
      __int16 v8 = *(unsigned __int16 **)&p_strokeMeshInfo[1]._hasValue;
LABEL_6:
      *(void *)&type += 8;
      if (*(unsigned __int16 **)&type == v8) {
        goto LABEL_76;
      }
    }
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
    if (!v18) {
      goto LABEL_27;
    }
LABEL_26:
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_27;
  }
LABEL_76:
  uint64_t v42 = *(void *)&p_strokeMeshInfo[2]._hasValue;
  if (v42 != *(void *)&p_strokeMeshInfo[2]._value.type)
  {
    uint64_t v43 = **(void **)(*(void *)v42 + 64);
    uint64_t v44 = **(unsigned __int16 **)&p_strokeMeshInfo->_value.type;
    long long v78 = 0uLL;
    uint64_t v45 = *(void *)(v43 + 8) * v44;
    v5.n128_u64[0] = (unint64_t)v69;
    *(void *)&long long v46 = v69;
    *((void *)&v46 + 1) = v43;
    __n128 v72 = v5;
    if (v45)
    {
      if (v69 && *(unsigned char *)(v43 + 17) != 2)
      {
        long long v70 = v46;
        uint64_t v47 = (*((uint64_t (**)(ResourceAccessor *))v69->var0 + 7))(v69);
        long long v46 = v70;
      }
      else
      {
        uint64_t v47 = *(void *)(v43 + 72);
      }
    }
    else
    {
      uint64_t v47 = 0;
    }
    long long v78 = v46;
    unint64_t v79 = 0;
    unint64_t v80 = v45;
    uint64_t v82 = v47;
    __int16 v81 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[3]._value, (uint64_t)&v78);
    *(void *)&long long v48 = v72.n128_u64[0];
    if (v82)
    {
      unint64_t v50 = v79;
      unint64_t v49 = v80;
      if (v80 != v79)
      {
        long long v51 = v78;
        int v52 = v81;
        int v53 = HIBYTE(v81);
        if ((void)v78 && *(unsigned char *)(*((void *)&v78 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(void *)v78 + 64))(v72);
          *(void *)&long long v48 = v72.n128_u64[0];
        }
        if (v52 && !v53)
        {
          unint64_t v55 = *(void *)(*((void *)&v51 + 1) + 56);
          unint64_t v54 = *(void *)(*((void *)&v51 + 1) + 64);
          if (v54 == v55) {
            unint64_t v55 = *(void *)(*((void *)&v51 + 1) + 80) - *(void *)(*((void *)&v51 + 1) + 72);
          }
          if (v50 < v55) {
            unint64_t v55 = v50;
          }
          if (v54 <= v49) {
            unint64_t v54 = v49;
          }
          if (v54 == v55) {
            unint64_t v54 = v55 + *(void *)(*((void *)&v51 + 1) + 80) - *(void *)(*((void *)&v51 + 1) + 72);
          }
          *(void *)(*((void *)&v51 + 1) + 56) = v55;
          *(void *)(*((void *)&v51 + 1) + 64) = v54;
        }
      }
    }
    uint64_t v56 = *(void *)(**(void **)&p_strokeMeshInfo[2]._hasValue + 96);
    uint64_t v57 = *(unsigned int *)(*(void *)&p_strokeMeshInfo->_value.type + 4);
    long long v78 = 0uLL;
    uint64_t v58 = *(void *)(v56 + 8) * v57;
    *((void *)&v48 + 1) = v56;
    if (v58)
    {
      if (v69 && *(unsigned char *)(v56 + 17) != 2)
      {
        long long v73 = v48;
        uint64_t v59 = (*((uint64_t (**)(ResourceAccessor *))v69->var0 + 7))(v69);
        long long v48 = v73;
      }
      else
      {
        uint64_t v59 = *(void *)(v56 + 72);
      }
    }
    else
    {
      uint64_t v59 = 0;
    }
    long long v78 = v48;
    unint64_t v79 = 0;
    unint64_t v80 = v58;
    uint64_t v82 = v59;
    __int16 v81 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[6]._value, (uint64_t)&v78);
    if (v82)
    {
      unint64_t v61 = v79;
      unint64_t v60 = v80;
      if (v80 != v79)
      {
        long long v62 = v78;
        int v63 = v81;
        int v64 = HIBYTE(v81);
        if ((void)v78 && *(unsigned char *)(*((void *)&v78 + 1) + 17) != 2) {
          (*(void (**)(void))(*(void *)v78 + 64))();
        }
        if (v63 && !v64)
        {
          unint64_t v66 = *(void *)(*((void *)&v62 + 1) + 56);
          unint64_t v65 = *(void *)(*((void *)&v62 + 1) + 64);
          if (v65 == v66) {
            unint64_t v66 = *(void *)(*((void *)&v62 + 1) + 80) - *(void *)(*((void *)&v62 + 1) + 72);
          }
          if (v61 < v66) {
            unint64_t v66 = v61;
          }
          if (v65 <= v60) {
            unint64_t v65 = v60;
          }
          if (v65 == v66) {
            unint64_t v65 = v66 + *(void *)(*((void *)&v62 + 1) + 80) - *(void *)(*((void *)&v62 + 1) + 72);
          }
          *(void *)(*((void *)&v62 + 1) + 56) = v66;
          *(void *)(*((void *)&v62 + 1) + 64) = v65;
        }
      }
    }
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::createMeshes((uint64_t *)&v68->_fillMeshInfoForPointyRoofs._value, (uint64_t)"Flat Building Roof Mesh", (uint64_t)"Flat Building Roof Vertex Data", (uint64_t)"Flat Building Roof Index Data", v69, v5);
}

- (void)prepareForBuilding:(void *)a3 forRoofStyle:(unsigned __int8)a4 scaleThreshold:(float)a5
{
  int v6 = a4;
  unint64_t v7 = a3;
  uint64_t v181 = *MEMORY[0x1E4F143B8];
  uint64_t v154 = *((unsigned int *)a3 + 25);
  [(VKPolygonalItemGroup *)self indexForGeoFeatureAttributes:(char *)a3 + 24];
  BOOL v150 = 0;
  if (v7 && v6 == 1)
  {
    if (_shouldMakePointyRoofForBuilding((uint64_t)v7))
    {
      *(float *)&double v9 = a5;
      BOOL v150 = [(VKBuildingGroup *)self canConstructPointyRoofForPolygon:v7 building:v7 buildingModel:v7[10] & 1 scaleThreshold:v9];
    }
    else
    {
      BOOL v150 = 0;
    }
  }
  float v177 = &v177;
  float v178 = &v177;
  uint64_t v179 = 0;
  __int16 v174 = &v174;
  __int16 v175 = &v174;
  uint64_t v176 = 0;
  if (v154)
  {
    unint64_t v10 = 0;
    int v153 = v7;
    do
    {
      v165[0] = 0;
      unint64_t v11 = geo::codec::multiSectionFeaturePoints(v7, v10, v165);
      float v12 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)v7, v10);
      uint64_t v13 = v165[0];
      if (v165[0])
      {
        float v14 = v12;
        uint64_t v15 = 0;
        int v16 = v174;
        uint64_t v17 = v165[0] - 1;
        uint64_t v18 = v176 + 1;
        do
        {
          uint64_t v19 = v11[v15];
          if (v17 == v15) {
            uint64_t v20 = 0;
          }
          else {
            uint64_t v20 = v15 + 1;
          }
          uint64_t v21 = v11[v20];
          double v22 = operator new(0x48uLL);
          v22[2] = v19;
          uint64_t v23 = v18 + v15;
          *((float *)v22 + 6) = v14;
          *(void *)((char *)v22 + 28) = v21;
          *((float *)v22 + 9) = v14;
          v22[5] = v15;
          v22[6] = v20;
          v22[7] = v15;
          v22[8] = v20;
          *double v22 = v16;
          v22[1] = &v174;
          v16[1] = v22;
          ++v15;
          int v16 = v22;
          __int16 v174 = v22;
          uint64_t v176 = v23;
        }
        while (v13 != v15);
      }
      ++v10;
      unint64_t v7 = v153;
    }
    while (v10 != v154);
    unint64_t v24 = v175;
    if (v175 != &v174)
    {
      do
      {
        double v25 = (void *)v24[1];
        if (v25 == &v174) {
          break;
        }
        int v26 = v24 + 2;
        uint64_t v27 = v24[1];
        while (*v26 != *(void *)(v27 + 16)
             || *((_DWORD *)v24 + 6) != (unint64_t)*(unsigned int *)(v27 + 24)
             || *(void *)((char *)v24 + 28) != *(void *)(v27 + 28)
             || *((_DWORD *)v24 + 9) != (unint64_t)*(unsigned int *)(v27 + 36))
        {
          if (*v26 == *(void *)(v27 + 28)
            && *((_DWORD *)v24 + 6) == (unint64_t)*(unsigned int *)(v27 + 36)
            && *(void *)((char *)v24 + 28) == *(void *)(v27 + 16)
            && *((_DWORD *)v24 + 9) == (unint64_t)*(unsigned int *)(v27 + 24))
          {
            break;
          }
          uint64_t v27 = *(void *)(v27 + 8);
          if ((void **)v27 == &v174) {
            goto LABEL_18;
          }
        }
        double v32 = operator new(0x48uLL);
        long long v33 = *(_OWORD *)v26;
        long long v34 = *((_OWORD *)v24 + 2);
        long long v35 = *((_OWORD *)v24 + 3);
        v32[8] = v24[8];
        *((_OWORD *)v32 + 2) = v34;
        *((_OWORD *)v32 + 3) = v35;
        *((_OWORD *)v32 + 1) = v33;
        double v36 = v177;
        void *v32 = v177;
        v32[1] = &v177;
        v36[1] = v32;
        float v177 = v32;
        ++v179;
        unint64_t v37 = *(void **)v27;
        v37[1] = *(void *)(v27 + 8);
        **(void **)(v27 + 8) = v37;
        --v176;
        operator delete((void *)v27);
        uint64_t v38 = *v24;
        uint64_t v39 = v24[1];
        *(void *)(v38 + 8) = v39;
        *(void *)v24[1] = v38;
        --v176;
        operator delete(v24);
        double v25 = *(void **)(*(void *)v39 + 8);
LABEL_18:
        unint64_t v24 = v25;
      }
      while (v25 != &v174);
    }
    unint64_t v40 = 0;
    if (v150) {
      int v41 = &OBJC_IVAR___VKBuildingGroup__fillMeshInfoForPointyRoofs;
    }
    else {
      int v41 = &OBJC_IVAR___VKPolygonalItemGroup__fillMeshInfo;
    }
    __int16 v149 = v41;
    uint64_t v42 = v153;
    while (1)
    {
      unint64_t v173 = 0;
      uint64_t v43 = (float32x2_t *)geo::codec::multiSectionFeaturePoints(v42, v40, &v173);
      if (v173 >= 3) {
        break;
      }
LABEL_46:
      if (++v40 == v154)
      {
        if (v176)
        {
          float v141 = v174;
          int16x4_t v140 = v175;
          uint64_t v142 = *v175;
          *(void *)(v142 + 8) = v174[1];
          *(void *)v141[1] = v142;
          uint64_t v176 = 0;
          if (v140 != &v174)
          {
            do
            {
              float v143 = (void *)v140[1];
              operator delete(v140);
              int16x4_t v140 = v143;
            }
            while (v143 != &v174);
          }
        }
        goto LABEL_174;
      }
    }
    uint64_t v44 = v43;
    float v155 = geo::codec::buildingFootprintExtrusionHeight((uint64_t)v42, v40);
    float v45 = geo::codec::buildingFootprintBaseHeight((uint64_t)v42, v40);
    unint64_t v46 = v173;
    float32x2_t v47 = *(float32x2_t *)self->super._boundingBox._minimum._e;
    int8x8_t v48 = *(int8x8_t *)&self->super._boundingBox._minimum._e[2];
    unint64_t v49 = v44;
    for (float32x2_t i = *(float32x2_t *)&self->super._boundingBox._maximum._e[1]; v46; --v46)
    {
      float32x2_t v51 = *v49++;
      float32x2_t v52 = (float32x2_t)vrev64_s32((int32x2_t)v51);
      float32x2_t v47 = vminnm_f32(v51, v47);
      int8x8_t v48 = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(v52.u32[1], v48.u32[0]), (float32x2_t)__PAIR64__(v48.u32[1], LODWORD(v155))), (int8x8_t)__PAIR64__(v52.u32[1], LODWORD(v155)), v48);
      *(float32x2_t *)&long long v53 = v47;
      *((int8x8_t *)&v53 + 1) = v48;
      *(_OWORD *)self->super._boundingBox._minimum._e = v53;
      v52.f32[1] = v155;
      float32x2_t i = vmaxnm_f32(i, v52);
      *(float32x2_t *)&self->super._boundingBox._maximum._e[1] = i;
    }
    int32x2_t v54 = (int32x2_t)*v44;
    *(float32x2_t *)self->super._boundingBox._minimum._e = vminnm_f32(*v44, v47);
    float32x2_t v55 = (float32x2_t)vrev64_s32(v54);
    *(int8x8_t *)&self->super._boundingBox._minimum._e[2] = vbsl_s8((int8x8_t)vcgt_f32((float32x2_t)__PAIR64__(v55.u32[1], v48.u32[0]), (float32x2_t)__PAIR64__(v48.u32[1], LODWORD(v45))), (int8x8_t)__PAIR64__(v55.u32[1], LODWORD(v45)), v48);
    v55.f32[1] = v45;
    *(float32x2_t *)&self->super._boundingBox._maximum._e[1] = vmaxnm_f32(i, v55);
    md::PolygonSection::PolygonSection((uint64_t)v165, v42, v40);
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::prepareSpaceForPoints((uint64_t)&self->super._fillMeshInfo + *v149, v173, 3 * v173 - 6);
    if (v150)
    {
      uint64_t v164 = 0;
      float v163 = 0.0;
      uint64_t v162 = 0;
      _computeScaleRotationTranslation((uint64_t)v44, v173, (float *)&v164, &v163, (float *)&v162);
      if (*((float *)&v164 + 1) != 0.0 && *(float *)&v164 != 0.0)
      {
        BOOL v56 = (float)(*(float *)&v164 / *((float *)&v164 + 1)) > 2.0
           || (float)(*(float *)&v164 / *((float *)&v164 + 1)) < 0.5;
        BOOL v57 = !v56 && *(float *)&v164 <= a5;
        if (v57 && *((float *)&v164 + 1) <= a5)
        {
          float v151 = *((float *)&v164 + 1);
          float v148 = *(float *)&v164;
          __float2 v59 = __sincosf_stret(v163 * 0.5);
          *(void *)&long long v60 = v162;
          *((void *)&v60 + 1) = 0x3F80000000000000;
          *(float *)v61.i32 = 1.0 - (float)((float)(v59.__sinval + v59.__sinval) * v59.__sinval);
          *(float *)v62.i32 = -(float)((float)(v59.__sinval + v59.__sinval) * v59.__cosval);
          v62.i32[1] = v61.i32[0];
          *(float *)&v61.i32[1] = (float)(v59.__sinval + v59.__sinval) * v59.__cosval;
          float32x4_t v63 = (float32x4_t)vzip1q_s32(v61, v61);
          int8x16_t v64 = (int8x16_t)vmulq_f32(v63, (float32x4_t)xmmword_1A28FCDD0);
          float32x4_t v65 = vmlaq_f32((float32x4_t)vextq_s8(v64, v64, 8uLL), (float32x4_t)xmmword_1A28FCEA0, v63);
          float32x4_t v66 = (float32x4_t)vzip1q_s32(v62, v62);
          int8x16_t v67 = (int8x16_t)vmulq_f32(v66, (float32x4_t)xmmword_1A28FCDD0);
          *(float32x4_t *)uint64_t v180 = v65;
          *(float32x4_t *)&v180[16] = vmlaq_f32((float32x4_t)vextq_s8(v67, v67, 8uLL), (float32x4_t)xmmword_1A28FCEA0, v66);
          float32x4_t v68 = (float32x4_t)vzip1q_s32((int32x4_t)LODWORD(v148), (int32x4_t)LODWORD(v148));
          int8x16_t v69 = (int8x16_t)vmulq_f32(v68, *(float32x4_t *)&v180[8]);
          v65.i64[1] = *(void *)&v180[24];
          float32x4_t v70 = vmlaq_f32((float32x4_t)vextq_s8(v69, v69, 8uLL), v65, v68);
          v67.i32[0] = 0;
          *(float *)&v67.i32[1] = v151;
          float32x4_t v71 = (float32x4_t)vzip1q_s32((int32x4_t)v67.u64[0], (int32x4_t)v67.u64[0]);
          int8x16_t v72 = (int8x16_t)vmulq_f32(v71, *(float32x4_t *)&v180[8]);
          *(float32x4_t *)long long buf = v70;
          *(float32x4_t *)&buf[16] = vmlaq_f32((float32x4_t)vextq_s8(v72, v72, 8uLL), v65, v71);
          float32x4_t v160 = vmulq_n_f32((float32x4_t)xmmword_1A28FCE90, fminf(v148, v151));
          long long v161 = v60;
          long long v73 = (uint64_t *)((char *)&g_gglBuildingBoundingBoxes + 24 * (v42[5] & 1));
          int8x16_t v157 = (int8x16_t)xmmword_1A28FC710;
          float32x2_t v158 = (float32x2_t)0x80000000800000;
          *(void *)uint64_t v180 = &unk_1EF57D5F0;
          *(void *)&v180[8] = &v157;
          *(void *)&v180[16] = buf;
          *(void *)&v180[24] = v180;
          gm::Box<float,3>::forEachCorner(v73, (uint64_t)v180);
          if (*(unsigned char **)&v180[24] == v180)
          {
            (*(void (**)(unsigned char *))(*(void *)v180 + 32))(v180);
          }
          else if (*(void *)&v180[24])
          {
            (*(void (**)(void))(**(void **)&v180[24] + 40))();
          }
          float32x4_t v74 = (float32x4_t)v157;
          v74.i32[3] = HIDWORD(*(_OWORD *)self->super._boundingBox._minimum._e);
          float32x4_t v75 = *(float32x4_t *)self->super._boundingBox._minimum._e;
          v75.i32[3] = v157.i32[3];
          *(int8x16_t *)self->super._boundingBox._minimum._e = vbslq_s8((int8x16_t)vcgtq_f32(v75, v74), v157, *(int8x16_t *)self->super._boundingBox._minimum._e);
          *(float32x2_t *)&self->super._boundingBox._maximum._e[1] = vmaxnm_f32(*(float32x2_t *)&self->super._boundingBox._maximum._e[1], v158);
        }
      }
    }
    *(void *)long long buf = v42;
    *(void *)&buf[8] = v40;
    uint64_t v76 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long>&&>,std::tuple<>>((uint64_t)&self->super._polygonEdges, (unint64_t)v42, v40, buf);
    long long v77 = v76;
    unint64_t v78 = v173;
    unint64_t v79 = (unsigned char *)v76[4];
    if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v76[6] - (void)v79) >> 3) < v173)
    {
      if (v173 > 0x492492492492492) {
        abort();
      }
      unint64_t v80 = (unsigned char *)v76[5];
      __int16 v81 = (char *)operator new(56 * v173);
      uint64_t v82 = &v81[56 * ((v80 - v79) / 56)];
      uint64_t v83 = v82;
      if (v80 != v79)
      {
        unint64_t v84 = &v81[56 * ((v80 - v79) / 56)];
        do
        {
          uint64_t v83 = v84 - 56;
          long long v85 = *(_OWORD *)(v80 - 56);
          long long v86 = *(_OWORD *)(v80 - 40);
          long long v87 = *(_OWORD *)(v80 - 24);
          *((void *)v84 - 1) = *((void *)v80 - 1);
          *(_OWORD *)(v84 - 24) = v87;
          *(_OWORD *)(v84 - 40) = v86;
          *(_OWORD *)(v84 - 56) = v85;
          v80 -= 56;
          v84 -= 56;
        }
        while (v80 != v79);
      }
      v77[4] = v83;
      v77[5] = v82;
      v77[6] = &v81[56 * v78];
      if (v79)
      {
        operator delete(v79);
        unint64_t v78 = v173;
      }
    }
    unint64_t v152 = v40;
    if (v78)
    {
      uint64_t v88 = 0;
      do
      {
        unint64_t v90 = v88 + 1;
        if (v88 + 1 == v78) {
          uint64_t v91 = 0;
        }
        else {
          uint64_t v91 = v88 + 1;
        }
        *(float32x2_t *)long long buf = v44[v88];
        *(float *)&buf[8] = v155;
        *(float32x2_t *)&buf[12] = v44[v91];
        *(float *)&buf[20] = v155;
        *(void *)&buf[24] = v88;
        v160.i64[0] = v91;
        v160.i64[1] = v88;
        *(void *)&long long v161 = v91;
        for (j = v178; ; j = (void *)j[1])
        {
          if (j == &v177) {
            goto LABEL_107;
          }
          if (j[2] == *(void *)buf
            && *((_DWORD *)j + 6) == (unint64_t)*(unsigned int *)&buf[8]
            && *(void *)((char *)j + 28) == *(void *)&buf[12]
            && *((_DWORD *)j + 9) == (unint64_t)*(unsigned int *)&buf[20])
          {
            break;
          }
          if (j[2] == *(void *)&buf[12]
            && *((_DWORD *)j + 6) == (unint64_t)*(unsigned int *)&buf[20]
            && *(void *)((char *)j + 28) == *(void *)buf
            && *((_DWORD *)j + 9) == (unint64_t)*(unsigned int *)&buf[8])
          {
            break;
          }
        }
        if (j == &v177)
        {
LABEL_107:
          uint64_t v98 = (char *)v77[5];
          unint64_t v97 = v77[6];
          if ((unint64_t)v98 < v97)
          {
            *(_OWORD *)uint64_t v98 = *(_OWORD *)buf;
            *((_OWORD *)v98 + 1) = *(_OWORD *)&buf[16];
            *((float32x4_t *)v98 + 2) = v160;
            *((void *)v98 + 6) = v161;
            int v89 = v98 + 56;
          }
          else
          {
            long long v99 = (unsigned char *)v77[4];
            unint64_t v100 = 0x6DB6DB6DB6DB6DB7 * ((v98 - v99) >> 3) + 1;
            if (v100 > 0x492492492492492) {
              abort();
            }
            unint64_t v101 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v97 - (void)v99) >> 3);
            if (2 * v101 > v100) {
              unint64_t v100 = 2 * v101;
            }
            if (v101 >= 0x249249249249249) {
              unint64_t v102 = 0x492492492492492;
            }
            else {
              unint64_t v102 = v100;
            }
            if (v102)
            {
              if (v102 > 0x492492492492492) {
                goto LABEL_179;
              }
              unint64_t v103 = (char *)operator new(56 * v102);
            }
            else
            {
              unint64_t v103 = 0;
            }
            int v104 = &v103[8 * ((v98 - v99) >> 3)];
            long long v105 = *(_OWORD *)&buf[16];
            *(_OWORD *)int v104 = *(_OWORD *)buf;
            *((_OWORD *)v104 + 1) = v105;
            *((float32x4_t *)v104 + 2) = v160;
            *((void *)v104 + 6) = v161;
            int v106 = v104;
            if (v98 != v99)
            {
              do
              {
                long long v107 = *(_OWORD *)(v98 - 56);
                long long v108 = *(_OWORD *)(v98 - 40);
                long long v109 = *(_OWORD *)(v98 - 24);
                *((void *)v106 - 1) = *((void *)v98 - 1);
                *(_OWORD *)(v106 - 24) = v109;
                *(_OWORD *)(v106 - 40) = v108;
                *(_OWORD *)(v106 - 56) = v107;
                v106 -= 56;
                v98 -= 56;
              }
              while (v98 != v99);
              uint64_t v98 = (char *)v77[4];
            }
            int v89 = v104 + 56;
            v77[4] = v106;
            v77[5] = v104 + 56;
            v77[6] = &v103[56 * v102];
            if (v98)
            {
              operator delete(v98);
              unint64_t v78 = v173;
            }
          }
          v77[5] = v89;
        }
        uint64_t v88 = v90;
      }
      while (v90 < v78);
    }
    uint64_t v110 = v77[5] - v77[4];
    if (!v110)
    {
LABEL_163:
      v165[0] = &unk_1EF534428;
      unint64_t v40 = v152;
      if (__p)
      {
        unint64_t v172 = __p;
        operator delete(__p);
      }
      uint64_t v42 = v153;
      if (v170) {
        operator delete(v170);
      }
      if (v168)
      {
        int v169 = v168;
        operator delete(v168);
      }
      if (v166)
      {
        unint64_t v167 = v166;
        operator delete(v166);
      }
      goto LABEL_46;
    }
    unint64_t v111 = 2 * v78;
    if (2 * v78 >= 0x10000)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
      }
      char v112 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A1780000, v112, OS_LOG_TYPE_ERROR, "MeshSet: Cannot prepare space polygons points: polygon is too large", buf, 2u);
      }

      goto LABEL_163;
    }
    unint64_t v113 = 0x924924924924924ALL * (v110 >> 3);
    p_value = &self->_strokeMeshInfo._value;
    unint64_t v115 = *(char **)self->_anon_b28;
    __int16 v116 = *((_WORD *)v115 - 4);
    if (v111 <= (unsigned __int16)~v116)
    {
      *((_WORD *)v115 - 4) = v116 + v111;
      *((_DWORD *)v115 - 1) += v113;
LABEL_154:
      uint64_t v135 = *(void *)&self->_anon_b28[144];
      uint64_t v136 = *(void **)&self->_anon_b28[160];
      long long v137 = *(std::__shared_weak_count **)&self->_anon_b28[168];
      if (v137) {
        atomic_fetch_add_explicit(&v137->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v136 && *v136 == v135 && !*(unsigned char *)(v135 + 40))
      {
        unint64_t v138 = *(void *)(v135 + 8) + v113;
        *(void *)v135 += 32 * v78;
        *(void *)(v135 + 8) = v138;
        unint64_t v139 = v136[3] + v113;
        v136[2] += 32 * v78;
        v136[3] = v139;
      }
      if (v137 && !atomic_fetch_add(&v137->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v137->__on_zero_shared)(v137);
        std::__shared_weak_count::__release_weak(v137);
      }
      goto LABEL_163;
    }
    unint64_t v117 = *(void *)&self->_anon_b28[8];
    if ((unint64_t)v115 < v117)
    {
      *(_WORD *)unint64_t v115 = v111;
      *((_DWORD *)v115 + 1) = v113;
      unint64_t v118 = v115 + 8;
LABEL_153:
      *(void *)self->_anon_b28 = v118;
      goto LABEL_154;
    }
    double type = p_value->type;
    uint64_t v120 = (uint64_t)&v115[-*(void *)&p_value->type];
    unint64_t v121 = (v120 >> 3) + 1;
    if (v121 >> 61) {
      abort();
    }
    unint64_t v156 = v113;
    uint64_t v122 = v117 - *(void *)&type;
    if (v122 >> 2 > v121) {
      unint64_t v121 = v122 >> 2;
    }
    if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v123 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v123 = v121;
    }
    if (v123 >> 61) {
LABEL_179:
    }
      std::__throw_bad_array_new_length[abi:nn180100]();
    unint64_t v124 = (char *)operator new(8 * v123);
    uint64_t v125 = &v124[8 * (v120 >> 3)];
    *(_WORD *)uint64_t v125 = v111;
    unint64_t v113 = v156;
    *((_DWORD *)v125 + 1) = v156;
    unsigned __int8 v126 = &v115[-*(void *)&type];
    if (v115 == *(char **)&type)
    {
      unint64_t v128 = &v124[8 * (v120 >> 3)];
      goto LABEL_151;
    }
    uint64_t v127 = v126 - 8;
    if ((unint64_t)(v126 - 8) >= 0x58)
    {
      unint64_t v128 = &v124[8 * (v120 >> 3)];
      if ((unint64_t)(v115 - &v124[v120]) >= 0x20)
      {
        uint64_t v129 = ((unint64_t)v127 >> 3) + 1;
        unint64_t v130 = &v124[v120 - 16];
        unint64_t v131 = v115 - 16;
        uint64_t v132 = v129 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v133 = *(_OWORD *)v131;
          *((_OWORD *)v130 - 1) = *((_OWORD *)v131 - 1);
          *(_OWORD *)unint64_t v130 = v133;
          v130 -= 32;
          v131 -= 32;
          v132 -= 4;
        }
        while (v132);
        unint64_t v128 = &v125[-8 * (v129 & 0x3FFFFFFFFFFFFFFCLL)];
        v115 -= 8 * (v129 & 0x3FFFFFFFFFFFFFFCLL);
        if (v129 == (v129 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_151:
          unint64_t v118 = v125 + 8;
          *(void *)&p_value->double type = v128;
          *(void *)self->_anon_b28 = v125 + 8;
          *(void *)&self->_anon_b28[8] = &v124[8 * v123];
          if (type != 0.0)
          {
            operator delete(*(void **)&type);
            unint64_t v113 = v156;
          }
          goto LABEL_153;
        }
      }
    }
    else
    {
      unint64_t v128 = &v124[8 * (v120 >> 3)];
    }
    do
    {
      uint64_t v134 = *((void *)v115 - 1);
      v115 -= 8;
      *((void *)v128 - 1) = v134;
      v128 -= 8;
    }
    while (v115 != *(char **)&type);
    goto LABEL_151;
  }
LABEL_174:
  if (v179)
  {
    float v145 = v177;
    float v144 = v178;
    uint64_t v146 = *v178;
    *(void *)(v146 + 8) = v177[1];
    *(void *)v145[1] = v146;
    uint64_t v179 = 0;
    if (v144 != &v177)
    {
      do
      {
        float v147 = (void *)v144[1];
        operator delete(v144);
        float v144 = v147;
      }
      while (v147 != &v177);
    }
  }
}

- (const)commitRangesToPointyRoofStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      float v14 = v13;
      (*(void (**)(function<BOOL (unsigned long long)> *, void *))(*(void *)a6->var0.var0.__lx + 24))(a6, v13);
    }
    else
    {
      float v14 = (void *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(void *)var1->var0.var0.__lx
                                                                                            + 16))(var1, a2);
    }
  }
  else
  {
    float v14 = 0;
  }
  _setupRenderItemBatcherForCullingMask((uint64_t)a3, a4, (uint64_t)&self->_pointyRoofStrokeCullingGroups, a5, (uint64_t)v13);
  if (v14 == v13)
  {
    v11.n128_f64[0] = (*(double (**)(void *))(v13[0] + 32))(v13);
  }
  else if (v14)
  {
    (*(void (**)(void))(*v14 + 40))();
  }
  return ggl::Batcher::commit((long long **)a3, 0, v11);
}

- (const)commitRangesToPointyRoofFillRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      float v14 = v13;
      (*(void (**)(function<BOOL (unsigned long long)> *, void *))(*(void *)a6->var0.var0.__lx + 24))(a6, v13);
    }
    else
    {
      float v14 = (void *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(void *)var1->var0.var0.__lx
                                                                                            + 16))(var1, a2);
    }
  }
  else
  {
    float v14 = 0;
  }
  _setupRenderItemBatcherForCullingMask((uint64_t)a3, a4, (uint64_t)&self->_pointyRoofFillCullingGroups, a5, (uint64_t)v13);
  if (v14 == v13)
  {
    v11.n128_f64[0] = (*(double (**)(void *))(v13[0] + 32))(v13);
  }
  else if (v14)
  {
    (*(void (**)(void))(*v14 + 40))();
  }
  return ggl::Batcher::commit((long long **)a3, 0, v11);
}

- (const)commitRangesToPointyRoofTopRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      float v14 = v13;
      (*(void (**)(function<BOOL (unsigned long long)> *, void *))(*(void *)a6->var0.var0.__lx + 24))(a6, v13);
    }
    else
    {
      float v14 = (void *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(void *)var1->var0.var0.__lx
                                                                                            + 16))(var1, a2);
    }
  }
  else
  {
    float v14 = 0;
  }
  _setupRenderItemBatcherForCullingMask((uint64_t)a3, a4, (uint64_t)&self->_fillCullingGroupsForPointyRoofs, a5, (uint64_t)v13);
  if (v14 == v13)
  {
    v11.n128_f64[0] = (*(double (**)(void *))(v13[0] + 32))(v13);
  }
  else if (v14)
  {
    (*(void (**)(void))(*v14 + 40))();
  }
  return ggl::Batcher::commit((long long **)a3, 0, v11);
}

- (const)commitRangesToExtrusionStrokeRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      float v14 = v13;
      (*(void (**)(function<BOOL (unsigned long long)> *, void *))(*(void *)a6->var0.var0.__lx + 24))(a6, v13);
    }
    else
    {
      float v14 = (void *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(void *)var1->var0.var0.__lx
                                                                                            + 16))(var1, a2);
    }
  }
  else
  {
    float v14 = 0;
  }
  _setupRenderItemBatcherForCullingMask((uint64_t)a3, a4, (uint64_t)&self->_extrusionStrokeCullingGroups, a5, (uint64_t)v13);
  if (v14 == v13)
  {
    v11.n128_f64[0] = (*(double (**)(void *))(v13[0] + 32))(v13);
  }
  else if (v14)
  {
    (*(void (**)(void))(*v14 + 40))();
  }
  return ggl::Batcher::commit((long long **)a3, 0, v11);
}

- (const)commitRangesToExtrusionFillRenderItemBatcher:(void *)a3 forMeshAtIndex:(unint64_t)a4 cullingMask:(unsigned int)a5 featureIdPredicate:(function<BOOL (unsigned long)long
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  var1 = (function<BOOL (unsigned long long)> *)a6->var0.var1;
  if (var1)
  {
    if (var1 == a6)
    {
      float v14 = v13;
      (*(void (**)(function<BOOL (unsigned long long)> *, void *))(*(void *)a6->var0.var0.__lx + 24))(a6, v13);
    }
    else
    {
      float v14 = (void *)(*(uint64_t (**)(function<BOOL (unsigned long long)> *, SEL))(*(void *)var1->var0.var0.__lx
                                                                                            + 16))(var1, a2);
    }
  }
  else
  {
    float v14 = 0;
  }
  _setupRenderItemBatcherForCullingMask((uint64_t)a3, a4, (uint64_t)&self->_extrusionFillCullingGroups, a5, (uint64_t)v13);
  if (v14 == v13)
  {
    v11.n128_f64[0] = (*(double (**)(void *))(v13[0] + 32))(v13);
  }
  else if (v14)
  {
    (*(void (**)(void))(*v14 + 40))();
  }
  return ggl::Batcher::commit((long long **)a3, 0, v11);
}

- (void)styleQueriesForPointyRoofs:(BOOL)a3 selected:(BOOL)a4
{
  uint64_t v4 = &OBJC_IVAR___VKBuildingGroup__selectedFlatRoofStyleQueries;
  if (a3) {
    uint64_t v4 = &OBJC_IVAR___VKBuildingGroup__selectedStyleQueries;
  }
  __n128 v5 = &OBJC_IVAR___VKBuildingGroup__flatRoofStyleQueries;
  if (a3) {
    __n128 v5 = &OBJC_IVAR___VKBuildingGroup__styleQueries;
  }
  if (!a4) {
    uint64_t v4 = v5;
  }
  return (char *)self + *v4;
}

- (unsigned)maxAttributeSetsPerGroup
{
  return 8;
}

- (const)pointyRoofStrokeMeshVendor
{
  return self->_pointyRoofStrokeMeshVendor.__ptr_.__value_;
}

- (const)pointyRoofFillMeshVendor
{
  return self->_pointyRoofFillMeshVendor.__ptr_.__value_;
}

- (void)fillMeshesForPointyRoofs
{
  return &self->_fillMeshesForPointyRoofs;
}

- (const)extrusionStrokeMeshVendor
{
  return self->_extrusionStrokeMeshVendor.__ptr_.__value_;
}

- (const)extrusionFillMeshVendor
{
  return self->_extrusionFillMeshVendor.__ptr_.__value_;
}

- (void)strokeMeshes
{
  return &self->_strokeMeshes;
}

- (VKBuildingGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6
{
  v7.receiver = self;
  v7.super_class = (Class)VKBuildingGroup;
  if (-[VKPolygonalItemGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:](&v7, sel_initWithStyleQuery_tileZoom_fixedAroundCentroid_contentScale_, a3, a5))
  {
    operator new();
  }
  return 0;
}

@end