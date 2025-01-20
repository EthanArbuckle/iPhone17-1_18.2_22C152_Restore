@interface VKVenueGroup
- (StrokeBufferSizing)bufferSizingForStrokesOnSection:(SEL)a3 styles:(const void *)a4 edges:(const void *)a5;
- (VKVenueGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 layer:(int)a5 buildingId:(unint64_t)a6 contentScale:(float)a7;
- (VKVenueGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 layer:(int)a5 buildingId:(unint64_t)a6 contentScale:(float)a7 storage:(shared_ptr<md::MeshSetStorage>)a8;
- (__n128)addWallStrokesForSection:edges:attributes:styles:cullingMask:accessor:;
- (__n128)addWallsForSection:edges:attributes:styles:cullingMask:accessor:;
- (const)generateEdgeListForPolygonSection:(const void *)a3 key:(const void *)a4;
- (const)venueWallEndMeshes;
- (const)venueWallHorizontalStrokeMeshes;
- (const)venueWallMeshes;
- (const)venueWallVerticalStrokeMeshes;
- (float)maximumSectionLength;
- (id).cxx_construct;
- (int)layer;
- (unint64_t)buildingId;
- (unint64_t)verticalStrokeCountForSection:(const void *)a3 styles:(const void *)a4 edges:(const void *)a5;
- (void)addStrokeForSection:(const void *)a3 paddedCount:(unsigned int)a4 key:(pair<const void *) attributes:(unsigned long>)a5 styles:(const void *)a6 cullingMask:(void *)a7 accessor:(unsigned int)a8;
- (void)addWallStrokesForSection:(const void *)a3 edges:(const void *)a4 attributes:(const void *)a5 styles:(void *)a6 cullingMask:(unsigned int)a7 accessor:(ResourceAccessor *)a8;
- (void)addWallStrokesForSection:edges:attributes:styles:cullingMask:accessor:;
- (void)addWallsForSection:(const void *)a3 edges:(const void *)a4 attributes:(const void *)a5 styles:(void *)a6 cullingMask:(unsigned int)a7 accessor:(ResourceAccessor *)a8;
- (void)addWallsForSection:edges:attributes:styles:cullingMask:accessor:;
- (void)didFinishAddingData;
- (void)prepareToGenerateWallStrokesForSection:(const void *)a3 styles:(const void *)a4 edges:(const void *)a5;
- (void)prepareToGenerateWallsForSection:(const void *)a3 styles:(void *)a4 edges:(const void *)a5;
- (void)prepareToStrokeSection:(const void *)a3 key:(const void *)a4 styles:(void *)a5 paddedCount:(unsigned int)a6;
- (void)updateTextures:(unsigned __int8)a3 textureManager:(void *)a4;
- (void)wallTexture;
- (void)willAddDataWithAccessor:(ResourceAccessor *)a3;
@end

@implementation VKVenueGroup

- (id).cxx_construct
{
  *((unsigned char *)self + 3128) = 0;
  *((unsigned char *)self + 3320) = 0;
  *((unsigned char *)self + 3512) = 0;
  *((unsigned char *)self + 3704) = 0;
  *((void *)self + 488) = 0;
  *((void *)self + 489) = 0;
  *((void *)self + 487) = 0;
  *((void *)self + 491) = 0;
  *((void *)self + 492) = 0;
  *((void *)self + 490) = 0;
  *((void *)self + 494) = 0;
  *((void *)self + 495) = 0;
  *((void *)self + 493) = 0;
  *((void *)self + 497) = 0;
  *((void *)self + 498) = 0;
  *((void *)self + 496) = 0;
  *(_OWORD *)((char *)self + 3992) = 0u;
  *(_OWORD *)((char *)self + 4008) = 0u;
  *((_DWORD *)self + 1006) = 1065353216;
  *((void *)self + 506) = 0;
  *((void *)self + 507) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_wallTexture.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  p_venueWalls = &self->_venueWalls;
  next = self->_venueWalls.__table_.__p1_.__value_.__next_;
  if (next)
  {
    do
    {
      v10 = (void *)*next;
      v11 = (void *)next[4];
      if (v11)
      {
        next[5] = v11;
        operator delete(v11);
      }
      operator delete(next);
      next = v10;
    }
    while (v10);
  }
  value = p_venueWalls->__table_.__bucket_list_.__ptr_.__value_;
  p_venueWalls->__table_.__bucket_list_.__ptr_.__value_ = 0;
  if (value) {
    operator delete(value);
  }
  begin = (char *)self->_venueWallVerticalStrokeMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_venueWallVerticalStrokeMeshes.__end_;
    v9 = self->_venueWallVerticalStrokeMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        v12 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v12 && !atomic_fetch_add(&v12->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v12->__on_zero_shared)(v12, a2);
          std::__shared_weak_count::__release_weak(v12);
        }
        end -= 16;
      }
      while (end != begin);
      v9 = self->_venueWallVerticalStrokeMeshes.__begin_;
    }
    self->_venueWallVerticalStrokeMeshes.__end_ = begin;
    operator delete(v9);
  }
  v13 = (char *)self->_venueWallHorizontalStrokeMeshes.__begin_;
  if (v13)
  {
    v14 = (char *)self->_venueWallHorizontalStrokeMeshes.__end_;
    v15 = self->_venueWallHorizontalStrokeMeshes.__begin_;
    if (v14 != v13)
    {
      do
      {
        v16 = (std::__shared_weak_count *)*((void *)v14 - 1);
        if (v16 && !atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v16->__on_zero_shared)(v16, a2);
          std::__shared_weak_count::__release_weak(v16);
        }
        v14 -= 16;
      }
      while (v14 != v13);
      v15 = self->_venueWallHorizontalStrokeMeshes.__begin_;
    }
    self->_venueWallHorizontalStrokeMeshes.__end_ = v13;
    operator delete(v15);
  }
  v17 = (char *)self->_venueWallEndMeshes.__begin_;
  if (v17)
  {
    v18 = (char *)self->_venueWallEndMeshes.__end_;
    v19 = self->_venueWallEndMeshes.__begin_;
    if (v18 != v17)
    {
      do
      {
        v20 = (std::__shared_weak_count *)*((void *)v18 - 1);
        if (v20 && !atomic_fetch_add(&v20->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v20->__on_zero_shared)(v20, a2);
          std::__shared_weak_count::__release_weak(v20);
        }
        v18 -= 16;
      }
      while (v18 != v17);
      v19 = self->_venueWallEndMeshes.__begin_;
    }
    self->_venueWallEndMeshes.__end_ = v17;
    operator delete(v19);
  }
  v21 = (char *)self->_venueWallMeshes.__begin_;
  if (v21)
  {
    v22 = (char *)self->_venueWallMeshes.__end_;
    v23 = self->_venueWallMeshes.__begin_;
    if (v22 != v21)
    {
      do
      {
        v24 = (std::__shared_weak_count *)*((void *)v22 - 1);
        if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v24->__on_zero_shared)(v24, a2);
          std::__shared_weak_count::__release_weak(v24);
        }
        v22 -= 16;
      }
      while (v22 != v21);
      v23 = self->_venueWallMeshes.__begin_;
    }
    self->_venueWallMeshes.__end_ = v21;
    operator delete(v23);
  }
  if (self->_venueWallVerticalStrokeMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallVerticalStrokeMeshInfo._value);
    self->_venueWallVerticalStrokeMeshInfo._hasValue = 0;
  }
  if (self->_venueWallHorizontalStrokeMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallHorizontalStrokeMeshInfo._value);
    self->_venueWallHorizontalStrokeMeshInfo._hasValue = 0;
  }
  if (self->_venueWallEndCapMeshInfo._hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallEndCapMeshInfo._value);
    self->_venueWallEndCapMeshInfo._hasValue = 0;
  }
  p_venueWallMeshInfo = &self->_venueWallMeshInfo;
  if (p_venueWallMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_venueWallMeshInfo->_value);
    p_venueWallMeshInfo->_hasValue = 0;
  }
}

- (int)layer
{
  return self->_layer;
}

- (void)updateTextures:(unsigned __int8)a3 textureManager:(void *)a4
{
  unsigned int v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)VKVenueGroup;
  -[VKPolygonGroup updateTextures:textureManager:](&v22, sel_updateTextures_textureManager_);
  LOWORD(v18.__ptr_) = 0;
  v7 = [(VKPolygonalItemGroup *)self styleQueries:&v18];
  uint64_t v8 = **v7;
  v9 = (std::__shared_weak_count *)(*v7)[1];
  __p.__r_.__value_.__r.__words[0] = v8;
  __p.__r_.__value_.__l.__size_ = (std::string::size_type)v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  gss::QueryableLocker<gss::PropertyID>::QueryableLocker(v20, v8, (uint64_t)v9);
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    if (v21) {
      goto LABEL_6;
    }
LABEL_14:
    p_wallTexture = &self->_wallTexture;
    cntrl = self->_wallTexture.__cntrl_;
    p_wallTexture->__ptr_ = 0;
    p_wallTexture->__cntrl_ = 0;
    if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
    goto LABEL_25;
  }
  if (!v21) {
    goto LABEL_14;
  }
LABEL_6:
  if (v5 >= 0x17) {
    unsigned int v10 = 23;
  }
  else {
    unsigned int v10 = v5;
  }
  gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&__p, *(void *)(v20[0] + 24), 0x152u, v10, 2);
  std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
    std::string::size_type size = __p.__r_.__value_.__l.__size_;
  }
  if (size)
  {
    [(VKPolygonGroup *)self _textureForName:&__p textureManager:a4];
    shared_ptr<ggl::Texture2D> v12 = v18;
  }
  else
  {
    shared_ptr<ggl::Texture2D> v12 = (shared_ptr<ggl::Texture2D>)0;
  }
  v15 = &self->_wallTexture;
  shared_ptr<ggl::Texture2D> v18 = (shared_ptr<ggl::Texture2D>)0;
  v16 = self->_wallTexture.__cntrl_;
  shared_ptr<ggl::Texture2D> *v15 = v12;
  if (v16 && !atomic_fetch_add((atomic_ullong *volatile)v16 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v16 + 16))(v16);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v16);
  }
  v17 = (std::__shared_weak_count *)v18.__cntrl_;
  if (v18.__cntrl_ && !atomic_fetch_add((atomic_ullong *volatile)v18.__cntrl_ + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
    if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
LABEL_24:
  }
    operator delete(__p.__r_.__value_.__l.__data_);
LABEL_25:
  gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)v20);
}

- (void)addStrokeForSection:(const void *)a3 paddedCount:(unsigned int)a4 key:(pair<const void *) attributes:(unsigned long>)a5 styles:(const void *)a6 cullingMask:(void *)a7 accessor:(unsigned int)a8
{
  unint64_t var1 = a5.var1;
  var0 = a5.var0;
  pair<const void *, unsigned long> v18 = a5;
  v17.receiver = self;
  v17.super_class = (Class)VKVenueGroup;
  -[VKPolygonGroup addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:](&v17, sel_addStrokeForSection_paddedCount_key_attributes_styles_cullingMask_accessor_, a3, *(void *)&a4, a8, a9);
  v15 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long> const&>,std::tuple<>>((uint64_t)&self->_venueWalls, (unint64_t)var0, var1, &v18);
  v16 = v15 + 4;
  if (v15[5] != v15[4])
  {
    [(VKVenueGroup *)self addWallsForSection:a3 edges:v16 attributes:a6 styles:a7 cullingMask:a8 accessor:a9];
    [(VKVenueGroup *)self addWallStrokesForSection:a3 edges:v16 attributes:a6 styles:a7 cullingMask:a8 accessor:a9];
  }
}

- (void)addWallStrokesForSection:(const void *)a3 edges:(const void *)a4 attributes:(const void *)a5 styles:(void *)a6 cullingMask:(unsigned int)a7 accessor:(ResourceAccessor *)a8
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_super v17 = self;
  unsigned int v16 = a7;
  uint64_t v15 = *((void *)a3 + 11);
  -[VKVenueGroup bufferSizingForStrokesOnSection:styles:edges:](self, "bufferSizingForStrokesOnSection:styles:edges:");
  v13 = operator new(0x40uLL);
  void *v13 = &unk_1EF56CAF8;
  v13[1] = a4;
  v13[2] = &v15;
  v13[3] = a3;
  v13[4] = &v17;
  v13[5] = a5;
  v13[6] = a6;
  v13[7] = &v16;
  char v21 = v13;
  *(void *)buf = *(unsigned __int16 *)&self->_anon_dc8[138];
  *(void *)&buf[8] = *(void *)buf;
  uint64_t v14 = *(unsigned int *)&self->_anon_dc8[140];
  v18[0] = v14;
  v18[1] = v14;
  if (v13)
  {
    (*(void (**)(void *, uint8_t *, void *, unsigned __int8 *, unsigned __int8 *))(*v13 + 48))(v13, buf, v18, &self->_anon_dc8[40], &self->_anon_dc8[88]);
    *(_WORD *)&self->_anon_dc8[138] = *(_WORD *)&self->_anon_dc8[138];
    *(_DWORD *)&self->_anon_dc8[140] = *(_DWORD *)&self->_anon_dc8[140];
    if (v21 == v20)
    {
      (*(void (**)(void *))(v20[0] + 32))(v20);
    }
    else if (v21)
    {
      (*(void (**)(void *))(*v21 + 40))(v21);
    }
  }
  else
  {
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
  }
}

- (void)addWallStrokesForSection:edges:attributes:styles:cullingMask:accessor:
{
}

- (__n128)addWallStrokesForSection:edges:attributes:styles:cullingMask:accessor:
{
  v2 = (char *)operator new(0x40uLL);
  *(void *)v2 = &unk_1EF56CAF8;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  *((void *)v2 + 7) = *(void *)(a1 + 56);
  return result;
}

- (void)addWallsForSection:(const void *)a3 edges:(const void *)a4 attributes:(const void *)a5 styles:(void *)a6 cullingMask:(unsigned int)a7 accessor:(ResourceAccessor *)a8
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  v103 = self;
  unsigned int v102 = a7;
  unint64_t v13 = *((void *)a3 + 11);
  if (v13)
  {
    unint64_t v14 = 0;
    uint64_t v15 = 0;
    unsigned int v16 = *(unsigned __int8 **)a6;
    uint64_t v17 = *((void *)a3 + 8);
    do
    {
      int v18 = *v16;
      v16 += 12;
      if (v18 && ((*(void *)(v17 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
        v15 += (~*(void *)(v17 + ((((v13 + v14 - 1) % v13) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ((v13 + v14 - 1) % v13)) & 1;
      }
      ++v14;
    }
    while (v13 != v14);
  }
  else
  {
    uint64_t v15 = 0;
  }
  uint64_t v19 = *((void *)a4 + 1);
  uint64_t v20 = 4 * v13;
  uint64_t v21 = v19 - *(void *)a4;
  if (v19 == *(void *)a4) {
    unint64_t v22 = 0;
  }
  else {
    unint64_t v22 = v20;
  }
  v23 = operator new(0x38uLL);
  void *v23 = &unk_1EF56CA68;
  v23[1] = &v103;
  v23[2] = a5;
  v23[3] = a6;
  v23[4] = a3;
  v23[5] = a4;
  v23[6] = &v102;
  v114 = v23;
  if (v22 < 0x10000)
  {
    unint64_t v26 = 0x924924924924924ALL * (v21 >> 3);
    p_venueWallMeshInfo = &self->_venueWallMeshInfo;
    unsigned int v28 = *(unsigned __int16 *)&self->_anon_c48[138];
    if (v22 > (unsigned __int16)~(_WORD)v28)
    {
      unsigned __int8 v29 = self->_anon_c48[136] + 1;
      self->_anon_c48[136] = v29;
      *(_WORD *)&self->_anon_c48[138] = 0;
      *(_DWORD *)&self->_anon_c48[140] = 0;
      uint64_t v30 = **(void **)(*(void *)(*(void *)&self->_anon_c48[16] + 16 * v29) + 64);
      uint64_t v31 = *(unsigned __int16 *)(*(void *)&self->_venueWallMeshInfo._value.type + 8 * v29);
      memset(buf, 0, sizeof(buf));
      uint64_t v32 = *(void *)(v30 + 8) * v31;
      v24.n128_u64[0] = (unint64_t)a8;
      *(void *)&long long v33 = a8;
      *((void *)&v33 + 1) = v30;
      __n128 v96 = v24;
      if (v32)
      {
        if (a8 && *(unsigned char *)(v30 + 17) != 2)
        {
          long long v92 = v33;
          uint64_t v34 = (*((uint64_t (**)(void))a8->var0 + 7))();
          long long v33 = v92;
        }
        else
        {
          uint64_t v34 = *(void *)(v30 + 72);
        }
      }
      else
      {
        uint64_t v34 = 0;
      }
      *(_OWORD *)buf = v33;
      unint64_t v107 = 0;
      unint64_t v108 = v32;
      uint64_t v110 = v34;
      __int16 v109 = 257;
      ggl::BufferMemory::operator=((uint64_t *)&p_venueWallMeshInfo[3]._value, (uint64_t)buf);
      *(void *)&long long v35 = v96.n128_u64[0];
      if (v110)
      {
        unint64_t v37 = v107;
        unint64_t v36 = v108;
        if (v108 != v107)
        {
          v38 = *(void **)&buf[8];
          int v39 = v109;
          int v40 = HIBYTE(v109);
          if (*(void *)buf && *(unsigned char *)(*(void *)&buf[8] + 17) != 2)
          {
            int v91 = v109;
            int v93 = HIBYTE(v109);
            (*(void (**)(__n128))(**(void **)buf + 64))(v96);
            int v39 = v91;
            int v40 = v93;
            *(void *)&long long v35 = v96.n128_u64[0];
          }
          if (v39 && !v40)
          {
            unint64_t v42 = v38[7];
            unint64_t v41 = v38[8];
            if (v41 == v42) {
              unint64_t v42 = v38[10] - v38[9];
            }
            if (v37 < v42) {
              unint64_t v42 = v37;
            }
            if (v41 <= v36) {
              unint64_t v41 = v36;
            }
            if (v41 == v42) {
              unint64_t v41 = v42 + v38[10] - v38[9];
            }
            v38[7] = v42;
            v38[8] = v41;
          }
        }
      }
      uint64_t v43 = p_venueWallMeshInfo[9]._value.data[0];
      uint64_t v44 = *(void *)(*(void *)(*(void *)&p_venueWallMeshInfo[2]._hasValue + 16 * v43) + 96);
      uint64_t v45 = *(unsigned int *)(*(void *)&p_venueWallMeshInfo->_value.type + 8 * v43 + 4);
      memset(buf, 0, sizeof(buf));
      uint64_t v46 = *(void *)(v44 + 8) * v45;
      *((void *)&v35 + 1) = v44;
      if (v46)
      {
        if (a8 && *(unsigned char *)(v44 + 17) != 2)
        {
          long long v97 = v35;
          uint64_t v47 = (*((uint64_t (**)(void))a8->var0 + 7))();
          long long v35 = v97;
        }
        else
        {
          uint64_t v47 = *(void *)(v44 + 72);
        }
      }
      else
      {
        uint64_t v47 = 0;
      }
      *(_OWORD *)buf = v35;
      unint64_t v107 = 0;
      unint64_t v108 = v46;
      uint64_t v110 = v47;
      __int16 v109 = 257;
      ggl::BufferMemory::operator=((uint64_t *)&p_venueWallMeshInfo[6]._value, (uint64_t)buf);
      if (v110)
      {
        unint64_t v49 = v107;
        unint64_t v48 = v108;
        if (v108 != v107)
        {
          v50 = *(void **)&buf[8];
          int v51 = v109;
          int v52 = HIBYTE(v109);
          if (*(void *)buf && *(unsigned char *)(*(void *)&buf[8] + 17) != 2)
          {
            int v94 = v109;
            int v98 = HIBYTE(v109);
            (*(void (**)(void))(**(void **)buf + 64))();
            int v51 = v94;
            int v52 = v98;
          }
          if (v51 && !v52)
          {
            unint64_t v54 = v50[7];
            unint64_t v53 = v50[8];
            if (v53 == v54) {
              unint64_t v54 = v50[10] - v50[9];
            }
            if (v49 < v54) {
              unint64_t v54 = v49;
            }
            if (v53 <= v48) {
              unint64_t v53 = v48;
            }
            if (v53 == v54) {
              unint64_t v53 = v54 + v50[10] - v50[9];
            }
            v50[7] = v54;
            v50[8] = v53;
          }
        }
      }
      unsigned int v28 = WORD1(p_venueWallMeshInfo[9]._value.type);
      v23 = v114;
    }
    *(void *)buf = v28;
    *(void *)&buf[8] = v22 + v28;
    unint64_t v55 = v26 + HIDWORD(p_venueWallMeshInfo[9]._value.type);
    uint64_t type_high = HIDWORD(p_venueWallMeshInfo[9]._value.type);
    unint64_t v105 = v55;
    if (!v23) {
      goto LABEL_130;
    }
    (*(void (**)(void *, uint8_t *, uint64_t *, ValueUnion *, ValueUnion *))(*v23 + 48))(v23, buf, &type_high, &p_venueWallMeshInfo[3]._value, &p_venueWallMeshInfo[6]._value);
    WORD1(p_venueWallMeshInfo[9]._value.type) += v22;
    HIDWORD(p_venueWallMeshInfo[9]._value.type) += v26;
  }
  else
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    v25 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1780000, v25, OS_LOG_TYPE_ERROR, "MeshSet: Cannot write points for polygons: polygon is too big", buf, 2u);
    }
  }
  uint64_t v56 = 6 * v15;
  if (v114 == v113)
  {
    (*(void (**)(void *))(v113[0] + 32))(v113);
    if (!v56) {
      return;
    }
    goto LABEL_71;
  }
  if (v114) {
    (*(void (**)(void *))(*v114 + 40))(v114);
  }
  if (v56)
  {
LABEL_71:
    v57 = v103;
    v58 = operator new(0x30uLL);
    unint64_t v60 = 4 * v15;
    void *v58 = &unk_1EF56CAB0;
    v58[1] = &v103;
    v58[2] = a5;
    v58[3] = a6;
    v58[4] = a3;
    v58[5] = &v102;
    v112 = v58;
    if ((unint64_t)(4 * v15) >= 0x10000)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
      }
      v61 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1780000, v61, OS_LOG_TYPE_ERROR, "MeshSet: Cannot write points for polygons: polygon is too big", buf, 2u);
      }

      goto LABEL_125;
    }
    p_venueWallEndCapMeshInfo = &v57->_venueWallEndCapMeshInfo;
    unsigned int v63 = *(unsigned __int16 *)&v57->_anon_d08[138];
    if (v60 > (unsigned __int16)~(_WORD)v63)
    {
      unsigned __int8 v64 = v57->_anon_d08[136] + 1;
      v57->_anon_d08[136] = v64;
      *(_WORD *)&v57->_anon_d08[138] = 0;
      *(_DWORD *)&v57->_anon_d08[140] = 0;
      uint64_t v65 = **(void **)(*(void *)(*(void *)&v57->_anon_d08[16] + 16 * v64) + 64);
      uint64_t v66 = *(unsigned __int16 *)(*(void *)&v57->_venueWallEndCapMeshInfo._value.type + 8 * v64);
      memset(buf, 0, sizeof(buf));
      uint64_t v67 = *(void *)(v65 + 8) * v66;
      v59.n128_u64[0] = (unint64_t)a8;
      *(void *)&long long v68 = a8;
      *((void *)&v68 + 1) = v65;
      __n128 v99 = v59;
      if (v67)
      {
        if (a8 && *(unsigned char *)(v65 + 17) != 2)
        {
          long long v95 = v68;
          uint64_t v69 = (*((uint64_t (**)(void))a8->var0 + 7))();
          long long v68 = v95;
        }
        else
        {
          uint64_t v69 = *(void *)(v65 + 72);
        }
      }
      else
      {
        uint64_t v69 = 0;
      }
      *(_OWORD *)buf = v68;
      unint64_t v107 = 0;
      unint64_t v108 = v67;
      uint64_t v110 = v69;
      __int16 v109 = 257;
      ggl::BufferMemory::operator=((uint64_t *)&v57->_anon_d08[40], (uint64_t)buf);
      *(void *)&long long v70 = v99.n128_u64[0];
      if (v110)
      {
        unint64_t v72 = v107;
        unint64_t v71 = v108;
        if (v108 != v107)
        {
          v73 = *(void **)&buf[8];
          int v74 = v109;
          int v75 = HIBYTE(v109);
          if (*(void *)buf && *(unsigned char *)(*(void *)&buf[8] + 17) != 2)
          {
            (*(void (**)(__n128))(**(void **)buf + 64))(v99);
            *(void *)&long long v70 = v99.n128_u64[0];
          }
          if (v74 && !v75)
          {
            unint64_t v77 = v73[7];
            unint64_t v76 = v73[8];
            if (v76 == v77) {
              unint64_t v77 = v73[10] - v73[9];
            }
            if (v72 < v77) {
              unint64_t v77 = v72;
            }
            if (v76 <= v71) {
              unint64_t v76 = v71;
            }
            if (v76 == v77) {
              unint64_t v76 = v77 + v73[10] - v73[9];
            }
            v73[7] = v77;
            v73[8] = v76;
          }
        }
      }
      uint64_t v78 = v57->_anon_d08[136];
      uint64_t v79 = *(void *)(*(void *)(*(void *)&v57->_anon_d08[16] + 16 * v78) + 96);
      uint64_t v80 = *(unsigned int *)(*(void *)&v57->_venueWallEndCapMeshInfo._value.type + 8 * v78 + 4);
      memset(buf, 0, sizeof(buf));
      uint64_t v81 = *(void *)(v79 + 8) * v80;
      *((void *)&v70 + 1) = v79;
      if (v81)
      {
        if (a8 && *(unsigned char *)(v79 + 17) != 2)
        {
          long long v100 = v70;
          uint64_t v82 = (*((uint64_t (**)(void))a8->var0 + 7))();
          long long v70 = v100;
        }
        else
        {
          uint64_t v82 = *(void *)(v79 + 72);
        }
      }
      else
      {
        uint64_t v82 = 0;
      }
      *(_OWORD *)buf = v70;
      unint64_t v107 = 0;
      unint64_t v108 = v81;
      uint64_t v110 = v82;
      __int16 v109 = 257;
      ggl::BufferMemory::operator=((uint64_t *)&v57->_anon_d08[88], (uint64_t)buf);
      if (v110)
      {
        unint64_t v84 = v107;
        unint64_t v83 = v108;
        if (v108 != v107)
        {
          v85 = *(void **)&buf[8];
          int v86 = v109;
          int v87 = HIBYTE(v109);
          if (*(void *)buf && *(unsigned char *)(*(void *)&buf[8] + 17) != 2) {
            (*(void (**)(void))(**(void **)buf + 64))();
          }
          if (v86 && !v87)
          {
            unint64_t v89 = v85[7];
            unint64_t v88 = v85[8];
            if (v88 == v89) {
              unint64_t v89 = v85[10] - v85[9];
            }
            if (v84 < v89) {
              unint64_t v89 = v84;
            }
            if (v88 <= v83) {
              unint64_t v88 = v83;
            }
            if (v88 == v89) {
              unint64_t v88 = v89 + v85[10] - v85[9];
            }
            v85[7] = v89;
            v85[8] = v88;
          }
        }
      }
      unsigned int v63 = WORD1(p_venueWallEndCapMeshInfo[9]._value.type);
      v58 = v112;
    }
    *(void *)buf = v63;
    *(void *)&buf[8] = v60 + v63;
    uint64_t v90 = v56 + HIDWORD(p_venueWallEndCapMeshInfo[9]._value.type);
    uint64_t type_high = HIDWORD(p_venueWallEndCapMeshInfo[9]._value.type);
    unint64_t v105 = v90;
    if (v58)
    {
      (*(void (**)(void *, uint8_t *, uint64_t *, ValueUnion *, ValueUnion *))(*v58 + 48))(v58, buf, &type_high, &p_venueWallEndCapMeshInfo[3]._value, &p_venueWallEndCapMeshInfo[6]._value);
      WORD1(p_venueWallEndCapMeshInfo[9]._value.type) += v60;
      HIDWORD(p_venueWallEndCapMeshInfo[9]._value.type) += v56;
LABEL_125:
      if (v112 == v111)
      {
        (*(void (**)(void *))(v111[0] + 32))(v111);
      }
      else if (v112)
      {
        (*(void (**)(void))(*v112 + 40))();
      }
      return;
    }
LABEL_130:
    std::__throw_bad_function_call[abi:nn180100]();
    __break(1u);
  }
}

- (void)addWallsForSection:edges:attributes:styles:cullingMask:accessor:
{
}

- (__n128)addWallsForSection:edges:attributes:styles:cullingMask:accessor:
{
  v2 = (char *)operator new(0x38uLL);
  *(void *)v2 = &unk_1EF56CA68;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  return result;
}

- (void)didFinishAddingData
{
  v94.receiver = self;
  v94.super_class = (Class)VKVenueGroup;
  [(VKPolygonGroup *)&v94 didFinishAddingData];
  p_venueWallMeshInfo = &self->_venueWallMeshInfo;
  uint64_t v4 = *(void *)&self->_anon_c48[160];
  if (v4 && *(void *)v4 == *(void *)&self->_anon_c48[144]) {
    *(unsigned char *)(v4 + 80) = 1;
  }
  unsigned int v5 = *(md::MeshSetStorage **)&self->_anon_c48[152];
  if (v5) {
    md::MeshSetStorage::finalize(v5);
  }
  uint64_t v98 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_c48[40], (uint64_t)__p);
  if (v98)
  {
    v7 = (char *)v96[0];
    v6 = (char *)v96[1];
    if (v96[1] != v96[0])
    {
      uint64_t v8 = __p[1];
      int v9 = v97;
      int v10 = BYTE1(v97);
      if (__p[0] && *((unsigned char *)__p[1] + 17) != 2) {
        (*(void (**)(void))(*(void *)__p[0] + 64))();
      }
      if (v9 && !v10)
      {
        shared_ptr<ggl::Texture2D> v12 = (char *)v8[7];
        v11 = (char *)v8[8];
        if (v11 == v12) {
          shared_ptr<ggl::Texture2D> v12 = (char *)(v8[10] - v8[9]);
        }
        if (v7 < v12) {
          shared_ptr<ggl::Texture2D> v12 = v7;
        }
        if (v11 <= v6) {
          v11 = v6;
        }
        if (v11 == v12) {
          v11 = &v12[v8[10] - v8[9]];
        }
        v8[7] = v12;
        v8[8] = v11;
      }
    }
  }
  uint64_t v98 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_c48[88], (uint64_t)__p);
  if (v98)
  {
    unint64_t v14 = (char *)v96[0];
    unint64_t v13 = (char *)v96[1];
    if (v96[1] != v96[0])
    {
      uint64_t v15 = __p[1];
      int v16 = v97;
      int v17 = BYTE1(v97);
      if (__p[0] && *((unsigned char *)__p[1] + 17) != 2) {
        (*(void (**)(void))(*(void *)__p[0] + 64))();
      }
      if (v16 && !v17)
      {
        uint64_t v19 = (char *)v15[7];
        int v18 = (char *)v15[8];
        if (v18 == v19) {
          uint64_t v19 = (char *)(v15[10] - v15[9]);
        }
        if (v14 < v19) {
          uint64_t v19 = v14;
        }
        if (v18 <= v13) {
          int v18 = v13;
        }
        if (v18 == v19) {
          int v18 = &v19[v15[10] - v15[9]];
        }
        v15[7] = v19;
        v15[8] = v18;
      }
    }
  }
  p_venueWallMeshes = &self->_venueWallMeshes;
  begin = (char *)self->_venueWallMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_venueWallMeshes.__end_;
    v23 = self->_venueWallMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        __n128 v24 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v24 && !atomic_fetch_add(&v24->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
          std::__shared_weak_count::__release_weak(v24);
        }
        end -= 16;
      }
      while (end != begin);
      v23 = p_venueWallMeshes->__begin_;
    }
    self->_venueWallMeshes.__end_ = begin;
    operator delete(v23);
    p_venueWallMeshes->__begin_ = 0;
    self->_venueWallMeshes.__end_ = 0;
    self->_venueWallMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_venueWallMeshes->__begin_ = *(_OWORD *)&self->_anon_c48[16];
  self->_venueWallMeshes.__end_cap_.__value_ = *(void **)&self->_anon_c48[32];
  *(void *)&self->_anon_c48[16] = 0;
  *(void *)&self->_anon_c48[24] = 0;
  *(void *)&self->_anon_c48[32] = 0;
  p_venueWallEndCapMeshInfo = &self->_venueWallEndCapMeshInfo;
  uint64_t v26 = *(void *)&self->_anon_d08[160];
  if (v26 && *(void *)v26 == *(void *)&self->_anon_d08[144]) {
    *(unsigned char *)(v26 + 80) = 1;
  }
  v27 = *(md::MeshSetStorage **)&self->_anon_d08[152];
  if (v27) {
    md::MeshSetStorage::finalize(v27);
  }
  uint64_t v98 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_d08[40], (uint64_t)__p);
  if (v98)
  {
    unsigned __int8 v29 = (char *)v96[0];
    unsigned int v28 = (char *)v96[1];
    if (v96[1] != v96[0])
    {
      uint64_t v30 = __p[1];
      int v31 = v97;
      int v32 = BYTE1(v97);
      if (__p[0] && *((unsigned char *)__p[1] + 17) != 2) {
        (*(void (**)(void))(*(void *)__p[0] + 64))();
      }
      if (v31 && !v32)
      {
        uint64_t v34 = (char *)v30[7];
        long long v33 = (char *)v30[8];
        if (v33 == v34) {
          uint64_t v34 = (char *)(v30[10] - v30[9]);
        }
        if (v29 < v34) {
          uint64_t v34 = v29;
        }
        if (v33 <= v28) {
          long long v33 = v28;
        }
        if (v33 == v34) {
          long long v33 = &v34[v30[10] - v30[9]];
        }
        v30[7] = v34;
        v30[8] = v33;
      }
    }
  }
  uint64_t v98 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_d08[88], (uint64_t)__p);
  if (v98)
  {
    unint64_t v36 = (char *)v96[0];
    long long v35 = (char *)v96[1];
    if (v96[1] != v96[0])
    {
      unint64_t v37 = __p[1];
      int v38 = v97;
      int v39 = BYTE1(v97);
      if (__p[0] && *((unsigned char *)__p[1] + 17) != 2) {
        (*(void (**)(void))(*(void *)__p[0] + 64))();
      }
      if (v38 && !v39)
      {
        unint64_t v41 = (char *)v37[7];
        int v40 = (char *)v37[8];
        if (v40 == v41) {
          unint64_t v41 = (char *)(v37[10] - v37[9]);
        }
        if (v36 < v41) {
          unint64_t v41 = v36;
        }
        if (v40 <= v35) {
          int v40 = v35;
        }
        if (v40 == v41) {
          int v40 = &v41[v37[10] - v37[9]];
        }
        v37[7] = v41;
        v37[8] = v40;
      }
    }
  }
  p_venueWallEndMeshes = &self->_venueWallEndMeshes;
  uint64_t v43 = (char *)self->_venueWallEndMeshes.__begin_;
  if (v43)
  {
    uint64_t v44 = (char *)self->_venueWallEndMeshes.__end_;
    uint64_t v45 = self->_venueWallEndMeshes.__begin_;
    if (v44 != v43)
    {
      do
      {
        uint64_t v46 = (std::__shared_weak_count *)*((void *)v44 - 1);
        if (v46 && !atomic_fetch_add(&v46->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
          std::__shared_weak_count::__release_weak(v46);
        }
        v44 -= 16;
      }
      while (v44 != v43);
      uint64_t v45 = p_venueWallEndMeshes->__begin_;
    }
    self->_venueWallEndMeshes.__end_ = v43;
    operator delete(v45);
    p_venueWallEndMeshes->__begin_ = 0;
    self->_venueWallEndMeshes.__end_ = 0;
    self->_venueWallEndMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_venueWallEndMeshes->__begin_ = *(_OWORD *)&self->_anon_d08[16];
  self->_venueWallEndMeshes.__end_cap_.__value_ = *(void **)&self->_anon_d08[32];
  *(void *)&self->_anon_d08[16] = 0;
  *(void *)&self->_anon_d08[24] = 0;
  *(void *)&self->_anon_d08[32] = 0;
  p_venueWallHorizontalStrokeMeshInfo = &self->_venueWallHorizontalStrokeMeshInfo;
  uint64_t v48 = *(void *)&self->_anon_dc8[160];
  if (v48 && *(void *)v48 == *(void *)&self->_anon_dc8[144]) {
    *(unsigned char *)(v48 + 80) = 1;
  }
  unint64_t v49 = *(md::MeshSetStorage **)&self->_anon_dc8[152];
  if (v49) {
    md::MeshSetStorage::finalize(v49);
  }
  uint64_t v98 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_dc8[40], (uint64_t)__p);
  if (v98)
  {
    int v51 = (char *)v96[0];
    v50 = (char *)v96[1];
    if (v96[1] != v96[0])
    {
      int v52 = __p[1];
      int v53 = v97;
      int v54 = BYTE1(v97);
      if (__p[0] && *((unsigned char *)__p[1] + 17) != 2) {
        (*(void (**)(void))(*(void *)__p[0] + 64))();
      }
      if (v53 && !v54)
      {
        uint64_t v56 = (char *)v52[7];
        unint64_t v55 = (char *)v52[8];
        if (v55 == v56) {
          uint64_t v56 = (char *)(v52[10] - v52[9]);
        }
        if (v51 < v56) {
          uint64_t v56 = v51;
        }
        if (v55 <= v50) {
          unint64_t v55 = v50;
        }
        if (v55 == v56) {
          unint64_t v55 = &v56[v52[10] - v52[9]];
        }
        v52[7] = v56;
        v52[8] = v55;
      }
    }
  }
  uint64_t v98 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_dc8[88], (uint64_t)__p);
  if (v98)
  {
    v58 = (char *)v96[0];
    v57 = (char *)v96[1];
    if (v96[1] != v96[0])
    {
      __n128 v59 = __p[1];
      int v60 = v97;
      int v61 = BYTE1(v97);
      if (__p[0] && *((unsigned char *)__p[1] + 17) != 2) {
        (*(void (**)(void))(*(void *)__p[0] + 64))();
      }
      if (v60 && !v61)
      {
        unsigned int v63 = (char *)v59[7];
        v62 = (char *)v59[8];
        if (v62 == v63) {
          unsigned int v63 = (char *)(v59[10] - v59[9]);
        }
        if (v58 < v63) {
          unsigned int v63 = v58;
        }
        if (v62 <= v57) {
          v62 = v57;
        }
        if (v62 == v63) {
          v62 = &v63[v59[10] - v59[9]];
        }
        v59[7] = v63;
        v59[8] = v62;
      }
    }
  }
  p_venueWallHorizontalStrokeMeshes = &self->_venueWallHorizontalStrokeMeshes;
  uint64_t v65 = (char *)self->_venueWallHorizontalStrokeMeshes.__begin_;
  if (v65)
  {
    uint64_t v66 = (char *)self->_venueWallHorizontalStrokeMeshes.__end_;
    uint64_t v67 = self->_venueWallHorizontalStrokeMeshes.__begin_;
    if (v66 != v65)
    {
      do
      {
        long long v68 = (std::__shared_weak_count *)*((void *)v66 - 1);
        if (v68 && !atomic_fetch_add(&v68->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v68->__on_zero_shared)(v68);
          std::__shared_weak_count::__release_weak(v68);
        }
        v66 -= 16;
      }
      while (v66 != v65);
      uint64_t v67 = p_venueWallHorizontalStrokeMeshes->__begin_;
    }
    self->_venueWallHorizontalStrokeMeshes.__end_ = v65;
    operator delete(v67);
    p_venueWallHorizontalStrokeMeshes->__begin_ = 0;
    self->_venueWallHorizontalStrokeMeshes.__end_ = 0;
    self->_venueWallHorizontalStrokeMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_venueWallHorizontalStrokeMeshes->__begin_ = *(_OWORD *)&self->_anon_dc8[16];
  self->_venueWallHorizontalStrokeMeshes.__end_cap_.__value_ = *(void **)&self->_anon_dc8[32];
  *(void *)&self->_anon_dc8[16] = 0;
  *(void *)&self->_anon_dc8[24] = 0;
  *(void *)&self->_anon_dc8[32] = 0;
  p_venueWallVerticalStrokeMeshInfo = &self->_venueWallVerticalStrokeMeshInfo;
  uint64_t v70 = *(void *)&self->_anon_e88[160];
  if (v70 && *(void *)v70 == *(void *)&self->_anon_e88[144]) {
    *(unsigned char *)(v70 + 80) = 1;
  }
  unint64_t v71 = *(md::MeshSetStorage **)&self->_anon_e88[152];
  if (v71) {
    md::MeshSetStorage::finalize(v71);
  }
  uint64_t v98 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_e88[40], (uint64_t)__p);
  if (v98)
  {
    v73 = (char *)v96[0];
    unint64_t v72 = (char *)v96[1];
    if (v96[1] != v96[0])
    {
      int v74 = __p[1];
      int v75 = v97;
      int v76 = BYTE1(v97);
      if (__p[0] && *((unsigned char *)__p[1] + 17) != 2) {
        (*(void (**)(void))(*(void *)__p[0] + 64))();
      }
      if (v75 && !v76)
      {
        uint64_t v78 = (char *)v74[7];
        unint64_t v77 = (char *)v74[8];
        if (v77 == v78) {
          uint64_t v78 = (char *)(v74[10] - v74[9]);
        }
        if (v73 < v78) {
          uint64_t v78 = v73;
        }
        if (v77 <= v72) {
          unint64_t v77 = v72;
        }
        if (v77 == v78) {
          unint64_t v77 = &v78[v74[10] - v74[9]];
        }
        v74[7] = v78;
        v74[8] = v77;
      }
    }
  }
  uint64_t v98 = 0;
  __p[0] = 0;
  __p[1] = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_e88[88], (uint64_t)__p);
  if (v98)
  {
    uint64_t v80 = (char *)v96[0];
    uint64_t v79 = (char *)v96[1];
    if (v96[1] != v96[0])
    {
      uint64_t v81 = __p[1];
      int v82 = v97;
      int v83 = BYTE1(v97);
      if (__p[0] && *((unsigned char *)__p[1] + 17) != 2) {
        (*(void (**)(void))(*(void *)__p[0] + 64))();
      }
      if (v82 && !v83)
      {
        v85 = (char *)v81[7];
        unint64_t v84 = (char *)v81[8];
        if (v84 == v85) {
          v85 = (char *)(v81[10] - v81[9]);
        }
        if (v80 < v85) {
          v85 = v80;
        }
        if (v84 <= v79) {
          unint64_t v84 = v79;
        }
        if (v84 == v85) {
          unint64_t v84 = &v85[v81[10] - v81[9]];
        }
        v81[7] = v85;
        v81[8] = v84;
      }
    }
  }
  p_venueWallVerticalStrokeMeshes = &self->_venueWallVerticalStrokeMeshes;
  int v87 = (char *)self->_venueWallVerticalStrokeMeshes.__begin_;
  if (v87)
  {
    unint64_t v88 = (char *)self->_venueWallVerticalStrokeMeshes.__end_;
    unint64_t v89 = self->_venueWallVerticalStrokeMeshes.__begin_;
    if (v88 != v87)
    {
      do
      {
        uint64_t v90 = (std::__shared_weak_count *)*((void *)v88 - 1);
        if (v90 && !atomic_fetch_add(&v90->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v90->__on_zero_shared)(v90);
          std::__shared_weak_count::__release_weak(v90);
        }
        v88 -= 16;
      }
      while (v88 != v87);
      unint64_t v89 = p_venueWallVerticalStrokeMeshes->__begin_;
      p_venueWallMeshInfo = &self->_venueWallMeshInfo;
      p_venueWallEndCapMeshInfo = &self->_venueWallEndCapMeshInfo;
    }
    self->_venueWallVerticalStrokeMeshes.__end_ = v87;
    operator delete(v89);
    p_venueWallVerticalStrokeMeshes->__begin_ = 0;
    self->_venueWallVerticalStrokeMeshes.__end_ = 0;
    self->_venueWallVerticalStrokeMeshes.__end_cap_.__value_ = 0;
  }
  *(_OWORD *)&p_venueWallVerticalStrokeMeshes->__begin_ = *(_OWORD *)&self->_anon_e88[16];
  self->_venueWallVerticalStrokeMeshes.__end_cap_.__value_ = *(void **)&self->_anon_e88[32];
  *(void *)&self->_anon_e88[16] = 0;
  *(void *)&self->_anon_e88[24] = 0;
  *(void *)&self->_anon_e88[32] = 0;
  if (p_venueWallMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_venueWallMeshInfo->_value);
    p_venueWallMeshInfo->_hasValue = 0;
  }
  if (p_venueWallEndCapMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_venueWallEndCapMeshInfo->_value);
    p_venueWallEndCapMeshInfo->_hasValue = 0;
  }
  if (p_venueWallHorizontalStrokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallHorizontalStrokeMeshInfo._value);
    p_venueWallHorizontalStrokeMeshInfo->_hasValue = 0;
  }
  if (p_venueWallVerticalStrokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&self->_venueWallVerticalStrokeMeshInfo._value);
    p_venueWallVerticalStrokeMeshInfo->_hasValue = 0;
  }
  *(_OWORD *)std::string __p = 0u;
  *(_OWORD *)__n128 v96 = 0u;
  int v97 = 1065353216;
  std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__move_assign((uint64_t)&self->_venueWalls, (uint64_t *)__p);
  int v91 = v96[0];
  if (v96[0])
  {
    do
    {
      long long v92 = (void *)*v91;
      int v93 = (void *)v91[4];
      if (v93)
      {
        v91[5] = v93;
        operator delete(v93);
      }
      operator delete(v91);
      int v91 = v92;
    }
    while (v92);
  }
  if (__p[0]) {
    operator delete(__p[0]);
  }
}

- (void)willAddDataWithAccessor:(ResourceAccessor *)a3
{
  uint64_t v273 = *MEMORY[0x1E4F143B8];
  v264.receiver = self;
  v264.super_class = (Class)VKVenueGroup;
  -[VKPolygonGroup willAddDataWithAccessor:](&v264, sel_willAddDataWithAccessor_);
  v246 = self;
  p_venueWallMeshInfo = &self->_venueWallMeshInfo;
  v6 = *(uint64_t **)&self->_anon_c48[152];
  if (v6) {
    md::MeshSetStorage::prepareStorage(v6, a3);
  }
  double type = self->_venueWallMeshInfo._value.type;
  uint64_t v7 = *(void *)self->_anon_c48;
  if (*(void *)&type != v7)
  {
    while (1)
    {
      if (!**(_WORD **)&type || !*(_DWORD *)(*(void *)&type + 4)) {
        goto LABEL_6;
      }
      uint64_t v9 = *(void *)&p_venueWallMeshInfo[10]._hasValue;
      if (*(unsigned char *)(v9 + 40)
        && (int v10 = *(void **)&p_venueWallMeshInfo[11]._hasValue) != 0
        && *v10 == v9
        && (uint64_t v11 = v10[1] * (unsigned __int16)**(_WORD **)&type,
            uint64_t v12 = v10[8],
            uint64_t v13 = v10[4],
            v12 + v11 <= (unint64_t)(v10[5] - v13)))
      {
        *(void *)&long long v268 = v13 + v12;
        *((void *)&v268 + 1) = v13 + v12 + v11;
        v10[8] = v12 + v11;
        v265 = "Venue Wall Vertex Data";
        uint64_t v39 = v10[14];
        if (!v39) {
LABEL_487:
        }
          std::__throw_bad_function_call[abi:nn180100]();
        (*(void (**)(long long *__return_ptr))(*(void *)v39 + 48))(&v267);
        uint64_t v9 = *(void *)&p_venueWallMeshInfo[10]._hasValue;
      }
      else
      {
        long long v267 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v265, v9, *(void **)&p_venueWallMeshInfo[11]._hasValue, (uint64_t)"Venue Wall Index Data", *(unsigned int *)(*(void *)&type + 4));
      long long v252 = v267;
      unint64_t v14 = (std::__shared_weak_count *)*((void *)&v267 + 1);
      if (*((void *)&v267 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v267 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      uint64_t v15 = (char *)operator new(0xA8uLL);
      *((void *)v15 + 1) = 0;
      *((void *)v15 + 2) = 0;
      *(void *)uint64_t v15 = &unk_1EF58A008;
      int v16 = v265;
      int v17 = v266;
      if (v266) {
        atomic_fetch_add_explicit(&v266->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      {
        {
          ggl::MeshTyped<ggl::VenueWall::DefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::VenueWall::defaultVboReflection;
        }
        ggl::MeshTyped<ggl::VenueWall::DefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::VenueWall::DefaultVbo>::attributesReflection(void)::r;
        unk_1EB32B7C0 = 1;
      }
      int v18 = v15 + 24;
      *((void *)v15 + 11) = 0;
      *((void *)v15 + 7) = 0;
      *((void *)v15 + 8) = 0;
      *((_DWORD *)v15 + 18) = 0;
      *((void *)v15 + 3) = &unk_1EF5606B0;
      *((void *)v15 + 4) = "Venue Wall Mesh";
      *((void *)v15 + 5) = &unk_1EF5606D0;
      *((void *)v15 + 6) = 0;
      *((void *)v15 + 10) = &ggl::MeshTyped<ggl::VenueWall::DefaultVbo>::typedReflection(void)::r;
      *((void *)v15 + 12) = 0;
      *((void *)v15 + 13) = 0;
      {
        operator new();
      }
      uint64_t v19 = &qword_1EB32C000;
      uint64_t v20 = ggl::Allocator::instance(void)::alloc;
      *((void *)v15 + 18) = 0;
      *((void *)v15 + 15) = 0;
      *((void *)v15 + 16) = 0;
      *((void *)v15 + 14) = v20;
      {
        uint64_t v19 = &qword_1EB32C000;
        if (v40) {
          operator new();
        }
      }
      *((void *)v15 + 19) = v19[287];
      *((void *)v15 + 20) = 0;
      *((void *)v15 + 17) = v15 + 144;
      *((void *)v15 + 3) = &unk_1EF562CA0;
      *((void *)v15 + 5) = &unk_1EF562CC0;
      long long v268 = v252;
      if (v14) {
        atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v15 + 88), (uint64_t *)&v268, (uint64_t *)&v269, 1uLL);
      uint64_t v21 = (std::__shared_weak_count *)*((void *)&v268 + 1);
      if (*((void *)&v268 + 1))
      {
        if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v268 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      if (v17) {
        goto LABEL_26;
      }
LABEL_27:
      unint64_t v22 = (std::__shared_weak_count *)*((void *)v15 + 16);
      *((void *)v15 + 15) = v16;
      *((void *)v15 + 16) = v17;
      if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
      void *v18 = &unk_1EF563070;
      *((void *)v15 + 5) = &unk_1EF563090;
      if (v17 && !atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
        if (!v14) {
          goto LABEL_38;
        }
      }
      else if (!v14)
      {
        goto LABEL_38;
      }
      if (!atomic_fetch_add(&v14->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
LABEL_38:
      double v24 = p_venueWallMeshInfo[2]._value.type;
      unint64_t v23 = *(void *)&p_venueWallMeshInfo[3]._hasValue;
      if (*(void *)&v24 >= v23)
      {
        uint64_t v26 = *(void **)&p_venueWallMeshInfo[2]._hasValue;
        uint64_t v27 = (uint64_t)(*(void *)&v24 - (void)v26) >> 4;
        unint64_t v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 60) {
          abort();
        }
        uint64_t v29 = v23 - (void)v26;
        if (v29 >> 3 > v28) {
          unint64_t v28 = v29 >> 3;
        }
        if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v30 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v30 = v28;
        }
        if (v30 >> 60) {
LABEL_482:
        }
          std::__throw_bad_array_new_length[abi:nn180100]();
        int v31 = (char *)operator new(16 * v30);
        v4.n128_u64[0] = (unint64_t)(v15 + 24);
        v4.n128_u64[1] = (unint64_t)v15;
        int v32 = (__n128 *)&v31[16 * v27];
        long long v33 = &v31[16 * v30];
        *int v32 = v4;
        v25 = v32 + 1;
        if (*(void **)&v24 == v26)
        {
          *(void *)&p_venueWallMeshInfo[2]._hasValue = v32;
          *(void *)&p_venueWallMeshInfo[2]._value.double type = v25;
          *(void *)&p_venueWallMeshInfo[3]._hasValue = v33;
        }
        else
        {
          do
          {
            __n128 v34 = *(__n128 *)(*(void *)&v24 - 16);
            *(void *)&v24 -= 16;
            v4.n128_u64[1] = v34.n128_u64[1];
            v32[-1] = v34;
            --v32;
            **(void **)&double v24 = 0;
            *(void *)(*(void *)&v24 + 8) = 0;
          }
          while (*(void **)&v24 != v26);
          double v24 = *(double *)&p_venueWallMeshInfo[2]._hasValue;
          double v35 = p_venueWallMeshInfo[2]._value.type;
          *(void *)&p_venueWallMeshInfo[2]._hasValue = v32;
          *(void *)&p_venueWallMeshInfo[2]._value.double type = v25;
          *(void *)&p_venueWallMeshInfo[3]._hasValue = v33;
          while (*(void *)&v35 != *(void *)&v24)
          {
            unint64_t v36 = *(std::__shared_weak_count **)(*(void *)&v35 - 8);
            if (v36 && !atomic_fetch_add(&v36->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
              std::__shared_weak_count::__release_weak(v36);
            }
            *(void *)&v35 -= 16;
          }
        }
        if (v24 != 0.0) {
          operator delete(*(void **)&v24);
        }
      }
      else
      {
        **(void **)&double v24 = v18;
        *(void *)(*(void *)&v24 + 8) = v15;
        v25 = (__n128 *)(*(void *)&v24 + 16);
      }
      *(void *)&p_venueWallMeshInfo[2]._value.double type = v25;
      unint64_t v37 = v266;
      if (v266 && !atomic_fetch_add(&v266->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
        int v38 = (std::__shared_weak_count *)*((void *)&v267 + 1);
        if (*((void *)&v267 + 1))
        {
LABEL_61:
          if (!atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
            std::__shared_weak_count::__release_weak(v38);
          }
        }
      }
      else
      {
        int v38 = (std::__shared_weak_count *)*((void *)&v267 + 1);
        if (*((void *)&v267 + 1)) {
          goto LABEL_61;
        }
      }
      uint64_t v7 = *(void *)&p_venueWallMeshInfo[1]._hasValue;
LABEL_6:
      *(void *)&type += 8;
      if (*(void *)&type == v7) {
        goto LABEL_76;
      }
    }
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
    if (!v17) {
      goto LABEL_27;
    }
LABEL_26:
    atomic_fetch_add_explicit(&v17->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_27;
  }
LABEL_76:
  uint64_t v41 = *(void *)&p_venueWallMeshInfo[2]._hasValue;
  if (v41 != *(void *)&p_venueWallMeshInfo[2]._value.type)
  {
    uint64_t v42 = **(void **)(*(void *)v41 + 64);
    uint64_t v43 = **(unsigned __int16 **)&p_venueWallMeshInfo->_value.type;
    long long v268 = 0uLL;
    uint64_t v44 = *(void *)(v42 + 8) * v43;
    v4.n128_u64[0] = (unint64_t)a3;
    *(void *)&long long v45 = a3;
    *((void *)&v45 + 1) = v42;
    __n128 v253 = v4;
    if (v44)
    {
      if (a3 && *(unsigned char *)(v42 + 17) != 2)
      {
        long long v248 = v45;
        uint64_t v46 = (*((uint64_t (**)(void))a3->var0 + 7))();
        long long v45 = v248;
      }
      else
      {
        uint64_t v46 = *(void *)(v42 + 72);
      }
    }
    else
    {
      uint64_t v46 = 0;
    }
    long long v268 = v45;
    unint64_t v269 = 0;
    unint64_t v270 = v44;
    uint64_t v272 = v46;
    __int16 v271 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_venueWallMeshInfo[3]._value, (uint64_t)&v268);
    *(void *)&long long v47 = v253.n128_u64[0];
    if (v272)
    {
      unint64_t v49 = v269;
      unint64_t v48 = v270;
      if (v270 != v269)
      {
        long long v50 = v268;
        int v51 = v271;
        int v52 = HIBYTE(v271);
        if ((void)v268 && *(unsigned char *)(*((void *)&v268 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(void *)v268 + 64))(v253);
          *(void *)&long long v47 = v253.n128_u64[0];
        }
        if (v51 && !v52)
        {
          unint64_t v54 = *(void *)(*((void *)&v50 + 1) + 56);
          unint64_t v53 = *(void *)(*((void *)&v50 + 1) + 64);
          if (v53 == v54) {
            unint64_t v54 = *(void *)(*((void *)&v50 + 1) + 80) - *(void *)(*((void *)&v50 + 1) + 72);
          }
          if (v49 < v54) {
            unint64_t v54 = v49;
          }
          if (v53 <= v48) {
            unint64_t v53 = v48;
          }
          if (v53 == v54) {
            unint64_t v53 = v54 + *(void *)(*((void *)&v50 + 1) + 80) - *(void *)(*((void *)&v50 + 1) + 72);
          }
          *(void *)(*((void *)&v50 + 1) + 56) = v54;
          *(void *)(*((void *)&v50 + 1) + 64) = v53;
        }
      }
    }
    uint64_t v55 = *(void *)(**(void **)&p_venueWallMeshInfo[2]._hasValue + 96);
    uint64_t v56 = *(unsigned int *)(*(void *)&p_venueWallMeshInfo->_value.type + 4);
    long long v268 = 0uLL;
    uint64_t v57 = *(void *)(v55 + 8) * v56;
    *((void *)&v47 + 1) = v55;
    if (v57)
    {
      if (a3 && *(unsigned char *)(v55 + 17) != 2)
      {
        long long v254 = v47;
        uint64_t v58 = (*((uint64_t (**)(void))a3->var0 + 7))();
        long long v47 = v254;
      }
      else
      {
        uint64_t v58 = *(void *)(v55 + 72);
      }
    }
    else
    {
      uint64_t v58 = 0;
    }
    long long v268 = v47;
    unint64_t v269 = 0;
    unint64_t v270 = v57;
    uint64_t v272 = v58;
    __int16 v271 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_venueWallMeshInfo[6]._value, (uint64_t)&v268);
    if (v272)
    {
      unint64_t v60 = v269;
      unint64_t v59 = v270;
      if (v270 != v269)
      {
        long long v61 = v268;
        int v62 = v271;
        int v63 = HIBYTE(v271);
        if ((void)v268 && *(unsigned char *)(*((void *)&v268 + 1) + 17) != 2) {
          (*(void (**)(void))(*(void *)v268 + 64))();
        }
        if (v62 && !v63)
        {
          unint64_t v65 = *(void *)(*((void *)&v61 + 1) + 56);
          unint64_t v64 = *(void *)(*((void *)&v61 + 1) + 64);
          if (v64 == v65) {
            unint64_t v65 = *(void *)(*((void *)&v61 + 1) + 80) - *(void *)(*((void *)&v61 + 1) + 72);
          }
          if (v60 < v65) {
            unint64_t v65 = v60;
          }
          if (v64 <= v59) {
            unint64_t v64 = v59;
          }
          if (v64 == v65) {
            unint64_t v64 = v65 + *(void *)(*((void *)&v61 + 1) + 80) - *(void *)(*((void *)&v61 + 1) + 72);
          }
          *(void *)(*((void *)&v61 + 1) + 56) = v65;
          *(void *)(*((void *)&v61 + 1) + 64) = v64;
        }
      }
    }
  }
  uint64_t v66 = *(uint64_t **)&v246->_anon_d08[152];
  if (v66) {
    md::MeshSetStorage::prepareStorage(v66, a3);
  }
  double v68 = v246->_venueWallEndCapMeshInfo._value.type;
  uint64_t v67 = *(unsigned __int16 **)v246->_anon_d08;
  if (*(unsigned __int16 **)&v68 != v67)
  {
    while (1)
    {
      if (!**(_WORD **)&v68 || !*(_DWORD *)(*(void *)&v68 + 4)) {
        goto LABEL_126;
      }
      uint64_t v69 = *(void *)&v246->_anon_d08[144];
      if (*(unsigned char *)(v69 + 40)
        && (uint64_t v70 = *(void **)&v246->_anon_d08[160]) != 0
        && *v70 == v69
        && (uint64_t v71 = v70[1] * (unsigned __int16)**(_WORD **)&v68,
            uint64_t v72 = v70[8],
            uint64_t v73 = v70[4],
            v72 + v71 <= (unint64_t)(v70[5] - v73)))
      {
        *(void *)&long long v268 = v73 + v72;
        *((void *)&v268 + 1) = v73 + v72 + v71;
        v70[8] = v72 + v71;
        v265 = "Venue Wall End Cap Vertex Data";
        uint64_t v99 = v70[14];
        if (!v99) {
          goto LABEL_487;
        }
        (*(void (**)(long long *__return_ptr))(*(void *)v99 + 48))(&v267);
        uint64_t v69 = *(void *)&v246->_anon_d08[144];
      }
      else
      {
        long long v267 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v265, v69, *(void **)&v246->_anon_d08[160], (uint64_t)"Venue Wall End Cap Index Data", *(unsigned int *)(*(void *)&v68 + 4));
      long long v255 = v267;
      int v74 = (std::__shared_weak_count *)*((void *)&v267 + 1);
      if (*((void *)&v267 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v267 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      int v75 = (char *)operator new(0xA8uLL);
      *((void *)v75 + 1) = 0;
      *((void *)v75 + 2) = 0;
      *(void *)int v75 = &unk_1EF589F28;
      int v76 = v265;
      unint64_t v77 = v266;
      if (v266) {
        atomic_fetch_add_explicit(&v266->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      {
        {
          ggl::MeshTyped<ggl::VenueWall::EndCapVbo>::attributesReflection(void)::r = (uint64_t)&ggl::VenueWall::endCapVboReflection;
        }
        ggl::MeshTyped<ggl::VenueWall::EndCapVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::VenueWall::EndCapVbo>::attributesReflection(void)::r;
        unk_1EB32B7E0 = 1;
      }
      uint64_t v78 = v75 + 24;
      *((void *)v75 + 11) = 0;
      *((void *)v75 + 7) = 0;
      *((void *)v75 + 8) = 0;
      *((_DWORD *)v75 + 18) = 0;
      *((void *)v75 + 3) = &unk_1EF5606B0;
      *((void *)v75 + 4) = "Venue Wall End Cap Mesh";
      *((void *)v75 + 5) = &unk_1EF5606D0;
      *((void *)v75 + 6) = 0;
      *((void *)v75 + 10) = &ggl::MeshTyped<ggl::VenueWall::EndCapVbo>::typedReflection(void)::r;
      *((void *)v75 + 12) = 0;
      *((void *)v75 + 13) = 0;
      {
        operator new();
      }
      uint64_t v79 = &qword_1EB32C000;
      uint64_t v80 = ggl::Allocator::instance(void)::alloc;
      *((void *)v75 + 18) = 0;
      *((void *)v75 + 15) = 0;
      *((void *)v75 + 16) = 0;
      *((void *)v75 + 14) = v80;
      {
        uint64_t v79 = &qword_1EB32C000;
        if (v100) {
          operator new();
        }
      }
      *((void *)v75 + 19) = v79[287];
      *((void *)v75 + 20) = 0;
      *((void *)v75 + 17) = v75 + 144;
      *((void *)v75 + 3) = &unk_1EF562CE0;
      *((void *)v75 + 5) = &unk_1EF562D00;
      long long v268 = v255;
      if (v74) {
        atomic_fetch_add_explicit(&v74->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v75 + 88), (uint64_t *)&v268, (uint64_t *)&v269, 1uLL);
      uint64_t v81 = (std::__shared_weak_count *)*((void *)&v268 + 1);
      if (*((void *)&v268 + 1))
      {
        if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v268 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      if (v77) {
        goto LABEL_146;
      }
LABEL_147:
      int v82 = (std::__shared_weak_count *)*((void *)v75 + 16);
      *((void *)v75 + 15) = v76;
      *((void *)v75 + 16) = v77;
      if (v82 && !atomic_fetch_add(&v82->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
        std::__shared_weak_count::__release_weak(v82);
      }
      *uint64_t v78 = &unk_1EF562F40;
      *((void *)v75 + 5) = &unk_1EF562F60;
      if (v77 && !atomic_fetch_add(&v77->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v77->__on_zero_shared)(v77);
        std::__shared_weak_count::__release_weak(v77);
        if (!v74) {
          goto LABEL_158;
        }
      }
      else if (!v74)
      {
        goto LABEL_158;
      }
      if (!atomic_fetch_add(&v74->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v74->__on_zero_shared)(v74);
        std::__shared_weak_count::__release_weak(v74);
      }
LABEL_158:
      unint64_t v84 = *(char **)&v246->_anon_d08[24];
      unint64_t v83 = *(void *)&v246->_anon_d08[32];
      if ((unint64_t)v84 >= v83)
      {
        int v86 = *(char **)&v246->_anon_d08[16];
        uint64_t v87 = (v84 - v86) >> 4;
        unint64_t v88 = v87 + 1;
        if ((unint64_t)(v87 + 1) >> 60) {
          abort();
        }
        uint64_t v89 = v83 - (void)v86;
        if (v89 >> 3 > v88) {
          unint64_t v88 = v89 >> 3;
        }
        if ((unint64_t)v89 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v90 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v90 = v88;
        }
        if (v90 >> 60) {
          goto LABEL_482;
        }
        int v91 = (char *)operator new(16 * v90);
        v4.n128_u64[0] = (unint64_t)(v75 + 24);
        v4.n128_u64[1] = (unint64_t)v75;
        long long v92 = (__n128 *)&v91[16 * v87];
        int v93 = &v91[16 * v90];
        *long long v92 = v4;
        v85 = v92 + 1;
        if (v84 == v86)
        {
          *(void *)&v246->_anon_d08[16] = v92;
          *(void *)&v246->_anon_d08[24] = v85;
          *(void *)&v246->_anon_d08[32] = v93;
        }
        else
        {
          do
          {
            __n128 v94 = *((__n128 *)v84 - 1);
            v84 -= 16;
            v4.n128_u64[1] = v94.n128_u64[1];
            v92[-1] = v94;
            --v92;
            *(void *)unint64_t v84 = 0;
            *((void *)v84 + 1) = 0;
          }
          while (v84 != v86);
          unint64_t v84 = *(char **)&v246->_anon_d08[16];
          long long v95 = *(char **)&v246->_anon_d08[24];
          *(void *)&v246->_anon_d08[16] = v92;
          *(void *)&v246->_anon_d08[24] = v85;
          *(void *)&v246->_anon_d08[32] = v93;
          while (v95 != v84)
          {
            __n128 v96 = (std::__shared_weak_count *)*((void *)v95 - 1);
            if (v96 && !atomic_fetch_add(&v96->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
              std::__shared_weak_count::__release_weak(v96);
            }
            v95 -= 16;
          }
        }
        if (v84) {
          operator delete(v84);
        }
      }
      else
      {
        *(void *)unint64_t v84 = v78;
        *((void *)v84 + 1) = v75;
        v85 = (__n128 *)(v84 + 16);
      }
      *(void *)&v246->_anon_d08[24] = v85;
      int v97 = v266;
      if (v266 && !atomic_fetch_add(&v266->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
        std::__shared_weak_count::__release_weak(v97);
        uint64_t v98 = (std::__shared_weak_count *)*((void *)&v267 + 1);
        if (*((void *)&v267 + 1))
        {
LABEL_181:
          if (!atomic_fetch_add(&v98->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v98->__on_zero_shared)(v98);
            std::__shared_weak_count::__release_weak(v98);
          }
        }
      }
      else
      {
        uint64_t v98 = (std::__shared_weak_count *)*((void *)&v267 + 1);
        if (*((void *)&v267 + 1)) {
          goto LABEL_181;
        }
      }
      uint64_t v67 = *(unsigned __int16 **)v246->_anon_d08;
LABEL_126:
      *(void *)&v68 += 8;
      if (*(unsigned __int16 **)&v68 == v67) {
        goto LABEL_196;
      }
    }
    ((void (*)(std::__shared_weak_count *))v81->__on_zero_shared)(v81);
    std::__shared_weak_count::__release_weak(v81);
    if (!v77) {
      goto LABEL_147;
    }
LABEL_146:
    atomic_fetch_add_explicit(&v77->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_147;
  }
LABEL_196:
  uint64_t v101 = *(void *)&v246->_anon_d08[16];
  if (v101 != *(void *)&v246->_anon_d08[24])
  {
    uint64_t v102 = **(void **)(*(void *)v101 + 64);
    uint64_t v103 = **(unsigned __int16 **)&v246->_venueWallEndCapMeshInfo._value.type;
    long long v268 = 0uLL;
    uint64_t v104 = *(void *)(v102 + 8) * v103;
    v4.n128_u64[0] = (unint64_t)a3;
    *(void *)&long long v105 = a3;
    *((void *)&v105 + 1) = v102;
    __n128 v256 = v4;
    if (v104)
    {
      if (a3 && *(unsigned char *)(v102 + 17) != 2)
      {
        long long v249 = v105;
        uint64_t v106 = (*((uint64_t (**)(void))a3->var0 + 7))();
        long long v105 = v249;
      }
      else
      {
        uint64_t v106 = *(void *)(v102 + 72);
      }
    }
    else
    {
      uint64_t v106 = 0;
    }
    long long v268 = v105;
    unint64_t v269 = 0;
    unint64_t v270 = v104;
    uint64_t v272 = v106;
    __int16 v271 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v246->_anon_d08[40], (uint64_t)&v268);
    *(void *)&long long v107 = v256.n128_u64[0];
    if (v272)
    {
      unint64_t v109 = v269;
      unint64_t v108 = v270;
      if (v270 != v269)
      {
        long long v110 = v268;
        int v111 = v271;
        int v112 = HIBYTE(v271);
        if ((void)v268 && *(unsigned char *)(*((void *)&v268 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(void *)v268 + 64))(v256);
          *(void *)&long long v107 = v256.n128_u64[0];
        }
        if (v111 && !v112)
        {
          unint64_t v114 = *(void *)(*((void *)&v110 + 1) + 56);
          unint64_t v113 = *(void *)(*((void *)&v110 + 1) + 64);
          if (v113 == v114) {
            unint64_t v114 = *(void *)(*((void *)&v110 + 1) + 80) - *(void *)(*((void *)&v110 + 1) + 72);
          }
          if (v109 < v114) {
            unint64_t v114 = v109;
          }
          if (v113 <= v108) {
            unint64_t v113 = v108;
          }
          if (v113 == v114) {
            unint64_t v113 = v114 + *(void *)(*((void *)&v110 + 1) + 80) - *(void *)(*((void *)&v110 + 1) + 72);
          }
          *(void *)(*((void *)&v110 + 1) + 56) = v114;
          *(void *)(*((void *)&v110 + 1) + 64) = v113;
        }
      }
    }
    uint64_t v115 = *(void *)(**(void **)&v246->_anon_d08[16] + 96);
    uint64_t v116 = *(unsigned int *)(*(void *)&v246->_venueWallEndCapMeshInfo._value.type + 4);
    long long v268 = 0uLL;
    uint64_t v117 = *(void *)(v115 + 8) * v116;
    *((void *)&v107 + 1) = v115;
    if (v117)
    {
      if (a3 && *(unsigned char *)(v115 + 17) != 2)
      {
        long long v257 = v107;
        uint64_t v118 = (*((uint64_t (**)(void))a3->var0 + 7))();
        long long v107 = v257;
      }
      else
      {
        uint64_t v118 = *(void *)(v115 + 72);
      }
    }
    else
    {
      uint64_t v118 = 0;
    }
    long long v268 = v107;
    unint64_t v269 = 0;
    unint64_t v270 = v117;
    uint64_t v272 = v118;
    __int16 v271 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v246->_anon_d08[88], (uint64_t)&v268);
    if (v272)
    {
      unint64_t v120 = v269;
      unint64_t v119 = v270;
      if (v270 != v269)
      {
        long long v121 = v268;
        int v122 = v271;
        int v123 = HIBYTE(v271);
        if ((void)v268 && *(unsigned char *)(*((void *)&v268 + 1) + 17) != 2) {
          (*(void (**)(void))(*(void *)v268 + 64))();
        }
        if (v122 && !v123)
        {
          unint64_t v125 = *(void *)(*((void *)&v121 + 1) + 56);
          unint64_t v124 = *(void *)(*((void *)&v121 + 1) + 64);
          if (v124 == v125) {
            unint64_t v125 = *(void *)(*((void *)&v121 + 1) + 80) - *(void *)(*((void *)&v121 + 1) + 72);
          }
          if (v120 < v125) {
            unint64_t v125 = v120;
          }
          if (v124 <= v119) {
            unint64_t v124 = v119;
          }
          if (v124 == v125) {
            unint64_t v124 = v125 + *(void *)(*((void *)&v121 + 1) + 80) - *(void *)(*((void *)&v121 + 1) + 72);
          }
          *(void *)(*((void *)&v121 + 1) + 56) = v125;
          *(void *)(*((void *)&v121 + 1) + 64) = v124;
        }
      }
    }
  }
  v126 = *(uint64_t **)&v246->_anon_dc8[152];
  if (v126) {
    md::MeshSetStorage::prepareStorage(v126, a3);
  }
  double v128 = v246->_venueWallHorizontalStrokeMeshInfo._value.type;
  v127 = *(unsigned __int16 **)v246->_anon_dc8;
  if (*(unsigned __int16 **)&v128 != v127)
  {
    while (1)
    {
      if (!**(_WORD **)&v128 || !*(_DWORD *)(*(void *)&v128 + 4)) {
        goto LABEL_246;
      }
      uint64_t v129 = *(void *)&v246->_anon_dc8[144];
      if (*(unsigned char *)(v129 + 40)
        && (v130 = *(void **)&v246->_anon_dc8[160]) != 0
        && *v130 == v129
        && (uint64_t v131 = v130[1] * (unsigned __int16)**(_WORD **)&v128,
            uint64_t v132 = v130[8],
            uint64_t v133 = v130[4],
            v132 + v131 <= (unint64_t)(v130[5] - v133)))
      {
        *(void *)&long long v268 = v133 + v132;
        *((void *)&v268 + 1) = v133 + v132 + v131;
        v130[8] = v132 + v131;
        v265 = "Venue Wall Horizontal Stroke Vertex Data";
        uint64_t v159 = v130[14];
        if (!v159) {
          goto LABEL_487;
        }
        (*(void (**)(long long *__return_ptr))(*(void *)v159 + 48))(&v267);
        uint64_t v129 = *(void *)&v246->_anon_dc8[144];
      }
      else
      {
        long long v267 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v265, v129, *(void **)&v246->_anon_dc8[160], (uint64_t)"Venue Wall Horizontal Stroke Index Data", *(unsigned int *)(*(void *)&v128 + 4));
      long long v258 = v267;
      v134 = (std::__shared_weak_count *)*((void *)&v267 + 1);
      if (*((void *)&v267 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v267 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      v135 = (char *)operator new(0xA8uLL);
      *((void *)v135 + 1) = 0;
      *((void *)v135 + 2) = 0;
      *(void *)v135 = &unk_1EF583B68;
      v136 = v265;
      v137 = v266;
      if (v266) {
        atomic_fetch_add_explicit(&v266->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      {
        {
          ggl::MeshTyped<ggl::Venue3DStroke::HorizontalDefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::Venue3DStroke::horizontalDefaultVboReflection;
        }
        ggl::MeshTyped<ggl::Venue3DStroke::HorizontalDefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::Venue3DStroke::HorizontalDefaultVbo>::attributesReflection(void)::r;
        *(void *)algn_1EB32B550 = 1;
      }
      v138 = v135 + 24;
      *((void *)v135 + 11) = 0;
      *((void *)v135 + 7) = 0;
      *((void *)v135 + 8) = 0;
      *((_DWORD *)v135 + 18) = 0;
      *((void *)v135 + 3) = &unk_1EF5606B0;
      *((void *)v135 + 4) = "Venue Wall Horizontal Stroke Mesh";
      *((void *)v135 + 5) = &unk_1EF5606D0;
      *((void *)v135 + 6) = 0;
      *((void *)v135 + 10) = &ggl::MeshTyped<ggl::Venue3DStroke::HorizontalDefaultVbo>::typedReflection(void)::r;
      *((void *)v135 + 12) = 0;
      *((void *)v135 + 13) = 0;
      {
        operator new();
      }
      v139 = &qword_1EB32C000;
      uint64_t v140 = ggl::Allocator::instance(void)::alloc;
      *((void *)v135 + 18) = 0;
      *((void *)v135 + 15) = 0;
      *((void *)v135 + 16) = 0;
      *((void *)v135 + 14) = v140;
      {
        v139 = &qword_1EB32C000;
        if (v160) {
          operator new();
        }
      }
      *((void *)v135 + 19) = v139[287];
      *((void *)v135 + 20) = 0;
      *((void *)v135 + 17) = v135 + 144;
      *((void *)v135 + 3) = &unk_1EF5620A0;
      *((void *)v135 + 5) = &unk_1EF5620C0;
      long long v268 = v258;
      if (v134) {
        atomic_fetch_add_explicit(&v134->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v135 + 88), (uint64_t *)&v268, (uint64_t *)&v269, 1uLL);
      v141 = (std::__shared_weak_count *)*((void *)&v268 + 1);
      if (*((void *)&v268 + 1))
      {
        if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v268 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      if (v137) {
        goto LABEL_266;
      }
LABEL_267:
      v142 = (std::__shared_weak_count *)*((void *)v135 + 16);
      *((void *)v135 + 15) = v136;
      *((void *)v135 + 16) = v137;
      if (v142 && !atomic_fetch_add(&v142->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v142->__on_zero_shared)(v142);
        std::__shared_weak_count::__release_weak(v142);
      }
      void *v138 = &unk_1EF55B300;
      *((void *)v135 + 5) = &unk_1EF55B320;
      if (v137 && !atomic_fetch_add(&v137->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v137->__on_zero_shared)(v137);
        std::__shared_weak_count::__release_weak(v137);
        if (!v134) {
          goto LABEL_278;
        }
      }
      else if (!v134)
      {
        goto LABEL_278;
      }
      if (!atomic_fetch_add(&v134->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v134->__on_zero_shared)(v134);
        std::__shared_weak_count::__release_weak(v134);
      }
LABEL_278:
      v144 = *(char **)&v246->_anon_dc8[24];
      unint64_t v143 = *(void *)&v246->_anon_dc8[32];
      if ((unint64_t)v144 >= v143)
      {
        v146 = *(char **)&v246->_anon_dc8[16];
        uint64_t v147 = (v144 - v146) >> 4;
        unint64_t v148 = v147 + 1;
        if ((unint64_t)(v147 + 1) >> 60) {
          abort();
        }
        uint64_t v149 = v143 - (void)v146;
        if (v149 >> 3 > v148) {
          unint64_t v148 = v149 >> 3;
        }
        if ((unint64_t)v149 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v150 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v150 = v148;
        }
        if (v150 >> 60) {
          goto LABEL_482;
        }
        v151 = (char *)operator new(16 * v150);
        v4.n128_u64[0] = (unint64_t)(v135 + 24);
        v4.n128_u64[1] = (unint64_t)v135;
        v152 = (__n128 *)&v151[16 * v147];
        v153 = &v151[16 * v150];
        __n128 *v152 = v4;
        v145 = v152 + 1;
        if (v144 == v146)
        {
          *(void *)&v246->_anon_dc8[16] = v152;
          *(void *)&v246->_anon_dc8[24] = v145;
          *(void *)&v246->_anon_dc8[32] = v153;
        }
        else
        {
          do
          {
            __n128 v154 = *((__n128 *)v144 - 1);
            v144 -= 16;
            v4.n128_u64[1] = v154.n128_u64[1];
            v152[-1] = v154;
            --v152;
            *(void *)v144 = 0;
            *((void *)v144 + 1) = 0;
          }
          while (v144 != v146);
          v144 = *(char **)&v246->_anon_dc8[16];
          v155 = *(char **)&v246->_anon_dc8[24];
          *(void *)&v246->_anon_dc8[16] = v152;
          *(void *)&v246->_anon_dc8[24] = v145;
          *(void *)&v246->_anon_dc8[32] = v153;
          while (v155 != v144)
          {
            v156 = (std::__shared_weak_count *)*((void *)v155 - 1);
            if (v156 && !atomic_fetch_add(&v156->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v156->__on_zero_shared)(v156);
              std::__shared_weak_count::__release_weak(v156);
            }
            v155 -= 16;
          }
        }
        if (v144) {
          operator delete(v144);
        }
      }
      else
      {
        *(void *)v144 = v138;
        *((void *)v144 + 1) = v135;
        v145 = (__n128 *)(v144 + 16);
      }
      *(void *)&v246->_anon_dc8[24] = v145;
      v157 = v266;
      if (v266 && !atomic_fetch_add(&v266->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v157->__on_zero_shared)(v157);
        std::__shared_weak_count::__release_weak(v157);
        v158 = (std::__shared_weak_count *)*((void *)&v267 + 1);
        if (*((void *)&v267 + 1))
        {
LABEL_301:
          if (!atomic_fetch_add(&v158->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v158->__on_zero_shared)(v158);
            std::__shared_weak_count::__release_weak(v158);
          }
        }
      }
      else
      {
        v158 = (std::__shared_weak_count *)*((void *)&v267 + 1);
        if (*((void *)&v267 + 1)) {
          goto LABEL_301;
        }
      }
      v127 = *(unsigned __int16 **)v246->_anon_dc8;
LABEL_246:
      *(void *)&v128 += 8;
      if (*(unsigned __int16 **)&v128 == v127) {
        goto LABEL_316;
      }
    }
    ((void (*)(std::__shared_weak_count *))v141->__on_zero_shared)(v141);
    std::__shared_weak_count::__release_weak(v141);
    if (!v137) {
      goto LABEL_267;
    }
LABEL_266:
    atomic_fetch_add_explicit(&v137->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_267;
  }
LABEL_316:
  uint64_t v161 = *(void *)&v246->_anon_dc8[16];
  if (v161 != *(void *)&v246->_anon_dc8[24])
  {
    uint64_t v162 = **(void **)(*(void *)v161 + 64);
    uint64_t v163 = **(unsigned __int16 **)&v246->_venueWallHorizontalStrokeMeshInfo._value.type;
    long long v268 = 0uLL;
    uint64_t v164 = *(void *)(v162 + 8) * v163;
    v4.n128_u64[0] = (unint64_t)a3;
    *(void *)&long long v165 = a3;
    *((void *)&v165 + 1) = v162;
    __n128 v259 = v4;
    if (v164)
    {
      if (a3 && *(unsigned char *)(v162 + 17) != 2)
      {
        long long v250 = v165;
        uint64_t v166 = (*((uint64_t (**)(void))a3->var0 + 7))();
        long long v165 = v250;
      }
      else
      {
        uint64_t v166 = *(void *)(v162 + 72);
      }
    }
    else
    {
      uint64_t v166 = 0;
    }
    long long v268 = v165;
    unint64_t v269 = 0;
    unint64_t v270 = v164;
    uint64_t v272 = v166;
    __int16 v271 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v246->_anon_dc8[40], (uint64_t)&v268);
    *(void *)&long long v167 = v259.n128_u64[0];
    if (v272)
    {
      unint64_t v169 = v269;
      unint64_t v168 = v270;
      if (v270 != v269)
      {
        long long v170 = v268;
        int v171 = v271;
        int v172 = HIBYTE(v271);
        if ((void)v268 && *(unsigned char *)(*((void *)&v268 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(void *)v268 + 64))(v259);
          *(void *)&long long v167 = v259.n128_u64[0];
        }
        if (v171 && !v172)
        {
          unint64_t v174 = *(void *)(*((void *)&v170 + 1) + 56);
          unint64_t v173 = *(void *)(*((void *)&v170 + 1) + 64);
          if (v173 == v174) {
            unint64_t v174 = *(void *)(*((void *)&v170 + 1) + 80) - *(void *)(*((void *)&v170 + 1) + 72);
          }
          if (v169 < v174) {
            unint64_t v174 = v169;
          }
          if (v173 <= v168) {
            unint64_t v173 = v168;
          }
          if (v173 == v174) {
            unint64_t v173 = v174 + *(void *)(*((void *)&v170 + 1) + 80) - *(void *)(*((void *)&v170 + 1) + 72);
          }
          *(void *)(*((void *)&v170 + 1) + 56) = v174;
          *(void *)(*((void *)&v170 + 1) + 64) = v173;
        }
      }
    }
    uint64_t v175 = *(void *)(**(void **)&v246->_anon_dc8[16] + 96);
    uint64_t v176 = *(unsigned int *)(*(void *)&v246->_venueWallHorizontalStrokeMeshInfo._value.type + 4);
    long long v268 = 0uLL;
    uint64_t v177 = *(void *)(v175 + 8) * v176;
    *((void *)&v167 + 1) = v175;
    if (v177)
    {
      if (a3 && *(unsigned char *)(v175 + 17) != 2)
      {
        long long v260 = v167;
        uint64_t v178 = (*((uint64_t (**)(void))a3->var0 + 7))();
        long long v167 = v260;
      }
      else
      {
        uint64_t v178 = *(void *)(v175 + 72);
      }
    }
    else
    {
      uint64_t v178 = 0;
    }
    long long v268 = v167;
    unint64_t v269 = 0;
    unint64_t v270 = v177;
    uint64_t v272 = v178;
    __int16 v271 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v246->_anon_dc8[88], (uint64_t)&v268);
    if (v272)
    {
      unint64_t v180 = v269;
      unint64_t v179 = v270;
      if (v270 != v269)
      {
        long long v181 = v268;
        int v182 = v271;
        int v183 = HIBYTE(v271);
        if ((void)v268 && *(unsigned char *)(*((void *)&v268 + 1) + 17) != 2) {
          (*(void (**)(void))(*(void *)v268 + 64))();
        }
        if (v182 && !v183)
        {
          unint64_t v185 = *(void *)(*((void *)&v181 + 1) + 56);
          unint64_t v184 = *(void *)(*((void *)&v181 + 1) + 64);
          if (v184 == v185) {
            unint64_t v185 = *(void *)(*((void *)&v181 + 1) + 80) - *(void *)(*((void *)&v181 + 1) + 72);
          }
          if (v180 < v185) {
            unint64_t v185 = v180;
          }
          if (v184 <= v179) {
            unint64_t v184 = v179;
          }
          if (v184 == v185) {
            unint64_t v184 = v185 + *(void *)(*((void *)&v181 + 1) + 80) - *(void *)(*((void *)&v181 + 1) + 72);
          }
          *(void *)(*((void *)&v181 + 1) + 56) = v185;
          *(void *)(*((void *)&v181 + 1) + 64) = v184;
        }
      }
    }
  }
  v186 = *(uint64_t **)&v246->_anon_e88[152];
  if (v186) {
    md::MeshSetStorage::prepareStorage(v186, a3);
  }
  double v188 = v246->_venueWallVerticalStrokeMeshInfo._value.type;
  v187 = *(unsigned __int16 **)v246->_anon_e88;
  if (*(unsigned __int16 **)&v188 != v187)
  {
    while (1)
    {
      if (!**(_WORD **)&v188 || !*(_DWORD *)(*(void *)&v188 + 4)) {
        goto LABEL_366;
      }
      uint64_t v189 = *(void *)&v246->_anon_e88[144];
      if (*(unsigned char *)(v189 + 40)
        && (v190 = *(void **)&v246->_anon_e88[160]) != 0
        && *v190 == v189
        && (uint64_t v191 = v190[1] * (unsigned __int16)**(_WORD **)&v188,
            uint64_t v192 = v190[8],
            uint64_t v193 = v190[4],
            v192 + v191 <= (unint64_t)(v190[5] - v193)))
      {
        *(void *)&long long v268 = v193 + v192;
        *((void *)&v268 + 1) = v193 + v192 + v191;
        v190[8] = v192 + v191;
        v265 = "Venue Wall Vertical Stroke Vertex Data";
        uint64_t v219 = v190[14];
        if (!v219) {
          goto LABEL_487;
        }
        (*(void (**)(long long *__return_ptr))(*(void *)v219 + 48))(&v267);
        uint64_t v189 = *(void *)&v246->_anon_e88[144];
      }
      else
      {
        long long v267 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v265, v189, *(void **)&v246->_anon_e88[160], (uint64_t)"Venue Wall Vertical Stroke Index Data", *(unsigned int *)(*(void *)&v188 + 4));
      long long v261 = v267;
      v194 = (std::__shared_weak_count *)*((void *)&v267 + 1);
      if (*((void *)&v267 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v267 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      v195 = (char *)operator new(0xA8uLL);
      *((void *)v195 + 1) = 0;
      *((void *)v195 + 2) = 0;
      *(void *)v195 = &unk_1EF583B30;
      v196 = v265;
      v197 = v266;
      if (v266) {
        atomic_fetch_add_explicit(&v266->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      {
        {
          ggl::MeshTyped<ggl::Venue3DStroke::VerticalDefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::Venue3DStroke::verticalDefaultVboReflection;
        }
        ggl::MeshTyped<ggl::Venue3DStroke::VerticalDefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::Venue3DStroke::VerticalDefaultVbo>::attributesReflection(void)::r;
        unk_1EB32B528 = 1;
      }
      v198 = v195 + 24;
      *((void *)v195 + 11) = 0;
      *((void *)v195 + 7) = 0;
      *((void *)v195 + 8) = 0;
      *((_DWORD *)v195 + 18) = 0;
      *((void *)v195 + 3) = &unk_1EF5606B0;
      *((void *)v195 + 4) = "Venue Wall Vertical Stroke Mesh";
      *((void *)v195 + 5) = &unk_1EF5606D0;
      *((void *)v195 + 6) = 0;
      *((void *)v195 + 10) = &ggl::MeshTyped<ggl::Venue3DStroke::VerticalDefaultVbo>::typedReflection(void)::r;
      *((void *)v195 + 12) = 0;
      *((void *)v195 + 13) = 0;
      {
        operator new();
      }
      v199 = &qword_1EB32C000;
      uint64_t v200 = ggl::Allocator::instance(void)::alloc;
      *((void *)v195 + 18) = 0;
      *((void *)v195 + 15) = 0;
      *((void *)v195 + 16) = 0;
      *((void *)v195 + 14) = v200;
      {
        v199 = &qword_1EB32C000;
        if (v220) {
          operator new();
        }
      }
      *((void *)v195 + 19) = v199[287];
      *((void *)v195 + 20) = 0;
      *((void *)v195 + 17) = v195 + 144;
      *((void *)v195 + 3) = &unk_1EF562060;
      *((void *)v195 + 5) = &unk_1EF562080;
      long long v268 = v261;
      if (v194) {
        atomic_fetch_add_explicit(&v194->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v195 + 88), (uint64_t *)&v268, (uint64_t *)&v269, 1uLL);
      v201 = (std::__shared_weak_count *)*((void *)&v268 + 1);
      if (*((void *)&v268 + 1))
      {
        if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v268 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      if (v197) {
        goto LABEL_386;
      }
LABEL_387:
      v202 = (std::__shared_weak_count *)*((void *)v195 + 16);
      *((void *)v195 + 15) = v196;
      *((void *)v195 + 16) = v197;
      if (v202 && !atomic_fetch_add(&v202->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v202->__on_zero_shared)(v202);
        std::__shared_weak_count::__release_weak(v202);
      }
      void *v198 = &unk_1EF55B2C0;
      *((void *)v195 + 5) = &unk_1EF55B2E0;
      if (v197 && !atomic_fetch_add(&v197->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v197->__on_zero_shared)(v197);
        std::__shared_weak_count::__release_weak(v197);
        if (!v194) {
          goto LABEL_398;
        }
      }
      else if (!v194)
      {
        goto LABEL_398;
      }
      if (!atomic_fetch_add(&v194->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v194->__on_zero_shared)(v194);
        std::__shared_weak_count::__release_weak(v194);
      }
LABEL_398:
      v204 = *(char **)&v246->_anon_e88[24];
      unint64_t v203 = *(void *)&v246->_anon_e88[32];
      if ((unint64_t)v204 >= v203)
      {
        v206 = *(char **)&v246->_anon_e88[16];
        uint64_t v207 = (v204 - v206) >> 4;
        unint64_t v208 = v207 + 1;
        if ((unint64_t)(v207 + 1) >> 60) {
          abort();
        }
        uint64_t v209 = v203 - (void)v206;
        if (v209 >> 3 > v208) {
          unint64_t v208 = v209 >> 3;
        }
        if ((unint64_t)v209 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v210 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v210 = v208;
        }
        if (v210 >> 60) {
          goto LABEL_482;
        }
        v211 = (char *)operator new(16 * v210);
        v4.n128_u64[0] = (unint64_t)(v195 + 24);
        v4.n128_u64[1] = (unint64_t)v195;
        v212 = (__n128 *)&v211[16 * v207];
        v213 = &v211[16 * v210];
        __n128 *v212 = v4;
        v205 = v212 + 1;
        if (v204 == v206)
        {
          *(void *)&v246->_anon_e88[16] = v212;
          *(void *)&v246->_anon_e88[24] = v205;
          *(void *)&v246->_anon_e88[32] = v213;
        }
        else
        {
          do
          {
            __n128 v214 = *((__n128 *)v204 - 1);
            v204 -= 16;
            v4.n128_u64[1] = v214.n128_u64[1];
            v212[-1] = v214;
            --v212;
            *(void *)v204 = 0;
            *((void *)v204 + 1) = 0;
          }
          while (v204 != v206);
          v204 = *(char **)&v246->_anon_e88[16];
          v215 = *(char **)&v246->_anon_e88[24];
          *(void *)&v246->_anon_e88[16] = v212;
          *(void *)&v246->_anon_e88[24] = v205;
          *(void *)&v246->_anon_e88[32] = v213;
          while (v215 != v204)
          {
            v216 = (std::__shared_weak_count *)*((void *)v215 - 1);
            if (v216 && !atomic_fetch_add(&v216->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
            {
              ((void (*)(std::__shared_weak_count *))v216->__on_zero_shared)(v216);
              std::__shared_weak_count::__release_weak(v216);
            }
            v215 -= 16;
          }
        }
        if (v204) {
          operator delete(v204);
        }
      }
      else
      {
        *(void *)v204 = v198;
        *((void *)v204 + 1) = v195;
        v205 = (__n128 *)(v204 + 16);
      }
      *(void *)&v246->_anon_e88[24] = v205;
      v217 = v266;
      if (v266 && !atomic_fetch_add(&v266->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v217->__on_zero_shared)(v217);
        std::__shared_weak_count::__release_weak(v217);
        v218 = (std::__shared_weak_count *)*((void *)&v267 + 1);
        if (*((void *)&v267 + 1))
        {
LABEL_421:
          if (!atomic_fetch_add(&v218->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v218->__on_zero_shared)(v218);
            std::__shared_weak_count::__release_weak(v218);
          }
        }
      }
      else
      {
        v218 = (std::__shared_weak_count *)*((void *)&v267 + 1);
        if (*((void *)&v267 + 1)) {
          goto LABEL_421;
        }
      }
      v187 = *(unsigned __int16 **)v246->_anon_e88;
LABEL_366:
      *(void *)&v188 += 8;
      if (*(unsigned __int16 **)&v188 == v187) {
        goto LABEL_436;
      }
    }
    ((void (*)(std::__shared_weak_count *))v201->__on_zero_shared)(v201);
    std::__shared_weak_count::__release_weak(v201);
    if (!v197) {
      goto LABEL_387;
    }
LABEL_386:
    atomic_fetch_add_explicit(&v197->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_387;
  }
LABEL_436:
  uint64_t v221 = *(void *)&v246->_anon_e88[16];
  if (v221 != *(void *)&v246->_anon_e88[24])
  {
    uint64_t v222 = **(void **)(*(void *)v221 + 64);
    uint64_t v223 = **(unsigned __int16 **)&v246->_venueWallVerticalStrokeMeshInfo._value.type;
    long long v268 = 0uLL;
    uint64_t v224 = *(void *)(v222 + 8) * v223;
    v4.n128_u64[0] = (unint64_t)a3;
    *(void *)&long long v225 = a3;
    *((void *)&v225 + 1) = v222;
    __n128 v262 = v4;
    if (v224)
    {
      if (a3 && *(unsigned char *)(v222 + 17) != 2)
      {
        long long v251 = v225;
        uint64_t v226 = (*((uint64_t (**)(void))a3->var0 + 7))();
        long long v225 = v251;
      }
      else
      {
        uint64_t v226 = *(void *)(v222 + 72);
      }
    }
    else
    {
      uint64_t v226 = 0;
    }
    long long v268 = v225;
    unint64_t v269 = 0;
    unint64_t v270 = v224;
    uint64_t v272 = v226;
    __int16 v271 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v246->_anon_e88[40], (uint64_t)&v268);
    *(void *)&long long v227 = v262.n128_u64[0];
    if (v272)
    {
      unint64_t v229 = v269;
      unint64_t v228 = v270;
      if (v270 != v269)
      {
        long long v230 = v268;
        int v231 = v271;
        int v232 = HIBYTE(v271);
        if ((void)v268 && *(unsigned char *)(*((void *)&v268 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(void *)v268 + 64))(v262);
          *(void *)&long long v227 = v262.n128_u64[0];
        }
        if (v231 && !v232)
        {
          unint64_t v234 = *(void *)(*((void *)&v230 + 1) + 56);
          unint64_t v233 = *(void *)(*((void *)&v230 + 1) + 64);
          if (v233 == v234) {
            unint64_t v234 = *(void *)(*((void *)&v230 + 1) + 80) - *(void *)(*((void *)&v230 + 1) + 72);
          }
          if (v229 < v234) {
            unint64_t v234 = v229;
          }
          if (v233 <= v228) {
            unint64_t v233 = v228;
          }
          if (v233 == v234) {
            unint64_t v233 = v234 + *(void *)(*((void *)&v230 + 1) + 80) - *(void *)(*((void *)&v230 + 1) + 72);
          }
          *(void *)(*((void *)&v230 + 1) + 56) = v234;
          *(void *)(*((void *)&v230 + 1) + 64) = v233;
        }
      }
    }
    uint64_t v235 = *(void *)(**(void **)&v246->_anon_e88[16] + 96);
    uint64_t v236 = *(unsigned int *)(*(void *)&v246->_venueWallVerticalStrokeMeshInfo._value.type + 4);
    long long v268 = 0uLL;
    uint64_t v237 = *(void *)(v235 + 8) * v236;
    *((void *)&v227 + 1) = v235;
    if (v237)
    {
      if (a3 && *(unsigned char *)(v235 + 17) != 2)
      {
        long long v263 = v227;
        uint64_t v238 = (*((uint64_t (**)(void))a3->var0 + 7))();
        long long v227 = v263;
      }
      else
      {
        uint64_t v238 = *(void *)(v235 + 72);
      }
    }
    else
    {
      uint64_t v238 = 0;
    }
    long long v268 = v227;
    unint64_t v269 = 0;
    unint64_t v270 = v237;
    uint64_t v272 = v238;
    __int16 v271 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&v246->_anon_e88[88], (uint64_t)&v268);
    if (v272)
    {
      unint64_t v240 = v269;
      unint64_t v239 = v270;
      if (v270 != v269)
      {
        long long v241 = v268;
        int v242 = v271;
        int v243 = HIBYTE(v271);
        if ((void)v268 && *(unsigned char *)(*((void *)&v268 + 1) + 17) != 2) {
          (*(void (**)(void))(*(void *)v268 + 64))();
        }
        if (v242 && !v243)
        {
          unint64_t v245 = *(void *)(*((void *)&v241 + 1) + 56);
          unint64_t v244 = *(void *)(*((void *)&v241 + 1) + 64);
          if (v244 == v245) {
            unint64_t v245 = *(void *)(*((void *)&v241 + 1) + 80) - *(void *)(*((void *)&v241 + 1) + 72);
          }
          if (v240 < v245) {
            unint64_t v245 = v240;
          }
          if (v244 <= v239) {
            unint64_t v244 = v239;
          }
          if (v244 == v245) {
            unint64_t v244 = v245 + *(void *)(*((void *)&v241 + 1) + 80) - *(void *)(*((void *)&v241 + 1) + 72);
          }
          *(void *)(*((void *)&v241 + 1) + 56) = v245;
          *(void *)(*((void *)&v241 + 1) + 64) = v244;
        }
      }
    }
  }
}

- (void)prepareToStrokeSection:(const void *)a3 key:(const void *)a4 styles:(void *)a5 paddedCount:(unsigned int)a6
{
  v11.receiver = self;
  v11.super_class = (Class)VKVenueGroup;
  [(VKPolygonGroup *)&v11 prepareToStrokeSection:a3 key:a4 styles:a5 paddedCount:*(void *)&a6];
  int v10 = [(VKVenueGroup *)self generateEdgeListForPolygonSection:a3 key:a4];
  [(VKVenueGroup *)self prepareToGenerateWallsForSection:a3 styles:a5 edges:v10];
  [(VKVenueGroup *)self prepareToGenerateWallStrokesForSection:a3 styles:a5 edges:v10];
}

- (void)prepareToGenerateWallStrokesForSection:(const void *)a3 styles:(const void *)a4 edges:(const void *)a5
{
  [(VKVenueGroup *)self bufferSizingForStrokesOnSection:a3 styles:a4 edges:a5];
  uint64_t v6 = *(void *)self->_anon_dc8;
  *(_WORD *)(v6 - 8) = *(_WORD *)(v6 - 8);
  *(_DWORD *)(v6 - 4) = *(_DWORD *)(v6 - 4);
  uint64_t v7 = *(void *)&self->_anon_dc8[144];
  uint64_t v8 = *(void **)&self->_anon_dc8[160];
  uint64_t v9 = *(std::__shared_weak_count **)&self->_anon_dc8[168];
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v8 && *v8 == v7 && !*(unsigned char *)(v7 + 40))
  {
    uint64_t v10 = *(void *)(v7 + 8);
    *(void *)uint64_t v7 = *(void *)v7;
    *(void *)(v7 + 8) = v10;
    uint64_t v11 = v8[3];
    v8[2] = v8[2];
    v8[3] = v11;
  }
  if (v9)
  {
    if (!atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
}

- (void)prepareToGenerateWallsForSection:(const void *)a3 styles:(void *)a4 edges:(const void *)a5
{
  unint64_t v6 = *((void *)a3 + 11);
  if (v6)
  {
    unint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = *(unsigned __int8 **)a4;
    uint64_t v10 = *((void *)a3 + 8);
    do
    {
      int v11 = *v9;
      v9 += 12;
      if (v11 && ((*(void *)(v10 + ((v7 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v7) & 1) == 0) {
        v8 += (~*(void *)(v10 + ((((v6 + v7 - 1) % v6) >> 3) & 0x1FFFFFFFFFFFFFF8)) >> ((v6 + v7 - 1) % v6)) & 1;
      }
      ++v7;
    }
    while (v6 != v7);
  }
  else
  {
    uint64_t v8 = 0;
  }
  uint64_t v12 = *((void *)a5 + 1) - *(void *)a5;
  if (v12) {
    unint64_t v13 = 4 * v6;
  }
  else {
    unint64_t v13 = 0;
  }
  float v14 = *((float *)a3 + 34);
  BOOL v15 = v14 == 0.0 && v6 >= 2;
  if (v15)
  {
    uint64_t v16 = 0;
    uint64_t v17 = *((void *)a3 + 1);
    do
    {
      if (v6 - 1 == v16) {
        uint64_t v18 = 0;
      }
      else {
        uint64_t v18 = v16 + 1;
      }
      float32x2_t v19 = vsub_f32(*(float32x2_t *)(v17 + 8 * v18), *(float32x2_t *)(v17 + 8 * v16));
      float v14 = sqrtf(vaddv_f32(vmul_f32(v19, v19))) + v14;
      *((float *)a3 + 34) = v14;
      ++v16;
    }
    while (v6 != v16);
  }
  self->_maximumSectionLength = fmaxf(self->_maximumSectionLength, v14);
  if (v13 < 0x10000)
  {
    unint64_t v21 = 0x924924924924924ALL * (v12 >> 3);
    unint64_t v22 = *(void *)self->_anon_c48;
    __int16 v23 = *(_WORD *)(v22 - 8);
    if (v13 <= (unsigned __int16)~v23)
    {
      *(_WORD *)(v22 - 8) = v23 + v13;
      *(_DWORD *)(v22 - 4) += v21;
    }
    else
    {
      unint64_t v24 = *(void *)&self->_anon_c48[8];
      if (v22 >= v24)
      {
        double type = self->_venueWallMeshInfo._value.type;
        uint64_t v27 = (uint64_t)(v22 - *(void *)&type) >> 3;
        unint64_t v28 = v27 + 1;
        if ((unint64_t)(v27 + 1) >> 61) {
          goto LABEL_94;
        }
        uint64_t v29 = v24 - *(void *)&type;
        if (v29 >> 2 > v28) {
          unint64_t v28 = v29 >> 2;
        }
        BOOL v15 = (unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8;
        unint64_t v30 = 0x1FFFFFFFFFFFFFFFLL;
        if (!v15) {
          unint64_t v30 = v28;
        }
        if (v30 >> 61) {
          goto LABEL_95;
        }
        uint64_t v31 = 8 * v30;
        int v32 = (char *)operator new(8 * v30);
        *(void *)&double v33 = &v32[8 * v27];
        __n128 v34 = &v32[v31];
        **(_WORD **)&double v33 = v13;
        *(_DWORD *)(*(void *)&v33 + 4) = v21;
        uint64_t v25 = *(void *)&v33 + 8;
        if (v22 != *(void *)&type)
        {
          unint64_t v35 = v22 - *(void *)&type - 8;
          if (v35 < 0x58) {
            goto LABEL_98;
          }
          if (*(void *)&type - (void)v32 < 0x20uLL) {
            goto LABEL_98;
          }
          uint64_t v36 = (v35 >> 3) + 1;
          unint64_t v37 = &v32[8 * v27 - 16];
          int v38 = (long long *)(v22 - 16);
          uint64_t v39 = v36 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v40 = *v38;
            *((_OWORD *)v37 - 1) = *(v38 - 1);
            *(_OWORD *)unint64_t v37 = v40;
            v37 -= 32;
            v38 -= 2;
            v39 -= 4;
          }
          while (v39);
          *(void *)&v33 -= 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
          v22 -= 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
          if (v36 != (v36 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_98:
            do
            {
              uint64_t v41 = *(void *)(v22 - 8);
              v22 -= 8;
              *(void *)(*(void *)&v33 - 8) = v41;
              *(void *)&v33 -= 8;
            }
            while (v22 != *(void *)&type);
          }
        }
        self->_venueWallMeshInfo._value.double type = v33;
        *(void *)self->_anon_c48 = v25;
        *(void *)&self->_anon_c48[8] = v34;
        if (type != 0.0) {
          operator delete(*(void **)&type);
        }
      }
      else
      {
        *(_WORD *)unint64_t v22 = v13;
        *(_DWORD *)(v22 + 4) = v21;
        uint64_t v25 = v22 + 8;
      }
      *(void *)self->_anon_c48 = v25;
    }
    uint64_t v42 = *(void *)&self->_anon_c48[144];
    uint64_t v43 = *(void **)&self->_anon_c48[160];
    uint64_t v44 = *(std::__shared_weak_count **)&self->_anon_c48[168];
    if (v44) {
      atomic_fetch_add_explicit(&v44->__shared_owners_, 1uLL, memory_order_relaxed);
    }
    if (v43 && *v43 == v42 && !*(unsigned char *)(v42 + 40))
    {
      unint64_t v45 = *(void *)(v42 + 8) + v21;
      *(void *)v42 += 24 * v13;
      *(void *)(v42 + 8) = v45;
      unint64_t v46 = v43[3] + v21;
      v43[2] += 24 * v13;
      v43[3] = v46;
    }
    if (v44 && !atomic_fetch_add(&v44->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *, SEL))v44->__on_zero_shared)(v44, a2);
      std::__shared_weak_count::__release_weak(v44);
    }
  }
  else
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    uint64_t v20 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v76[0] = 0;
      _os_log_impl(&dword_1A1780000, v20, OS_LOG_TYPE_ERROR, "MeshSet: Cannot prepare space polygons points: polygon is too large", (uint8_t *)v76, 2u);
    }
  }
  uint64_t v47 = 6 * v8;
  if (!(6 * v8)) {
    return;
  }
  unint64_t v48 = 4 * v8;
  if (!(4 * v8)) {
    return;
  }
  if (v48 >= 0x10000)
  {
    if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
      dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
    }
    unint64_t v49 = (id)GEOGetVectorKitVKDefaultLog_log;
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A1780000, v49, OS_LOG_TYPE_ERROR, "MeshSet: Cannot prepare space polygons points: polygon is too large", buf, 2u);
    }

    return;
  }
  p_venueWallEndCapMeshInfo = &self->_venueWallEndCapMeshInfo;
  unint64_t v51 = *(void *)self->_anon_d08;
  __int16 v52 = *(_WORD *)(v51 - 8);
  if (v48 > (unsigned __int16)~v52)
  {
    unint64_t v53 = *(void *)&self->_anon_d08[8];
    if (v51 < v53)
    {
      *(_WORD *)unint64_t v51 = v48;
      *(_DWORD *)(v51 + 4) = v47;
      unint64_t v54 = (char *)(v51 + 8);
LABEL_83:
      *(void *)&p_venueWallEndCapMeshInfo[1]._hasValue = v54;
      goto LABEL_84;
    }
    double v55 = self->_venueWallEndCapMeshInfo._value.type;
    uint64_t v56 = (uint64_t)(v51 - *(void *)&v55) >> 3;
    unint64_t v57 = v56 + 1;
    if (!((unint64_t)(v56 + 1) >> 61))
    {
      uint64_t v58 = v53 - *(void *)&v55;
      if (v58 >> 2 > v57) {
        unint64_t v57 = v58 >> 2;
      }
      BOOL v15 = (unint64_t)v58 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v59 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v15) {
        unint64_t v59 = v57;
      }
      if (!(v59 >> 61))
      {
        uint64_t v60 = 8 * v59;
        long long v61 = (char *)operator new(8 * v59);
        int v62 = &v61[8 * v56];
        int v63 = &v61[v60];
        *(_WORD *)int v62 = v48;
        *((_DWORD *)v62 + 1) = v47;
        unint64_t v54 = v62 + 8;
        if (v51 != *(void *)&v55)
        {
          unint64_t v64 = v51 - *(void *)&v55 - 8;
          if (v64 < 0x58) {
            goto LABEL_99;
          }
          if (*(void *)&v55 - (void)v61 < 0x20uLL) {
            goto LABEL_99;
          }
          uint64_t v65 = (v64 >> 3) + 1;
          uint64_t v66 = &v61[8 * v56 - 16];
          uint64_t v67 = (long long *)(v51 - 16);
          uint64_t v68 = v65 & 0x3FFFFFFFFFFFFFFCLL;
          do
          {
            long long v69 = *v67;
            *((_OWORD *)v66 - 1) = *(v67 - 1);
            *(_OWORD *)uint64_t v66 = v69;
            v66 -= 32;
            v67 -= 2;
            v68 -= 4;
          }
          while (v68);
          v62 -= 8 * (v65 & 0x3FFFFFFFFFFFFFFCLL);
          v51 -= 8 * (v65 & 0x3FFFFFFFFFFFFFFCLL);
          if (v65 != (v65 & 0x3FFFFFFFFFFFFFFCLL))
          {
LABEL_99:
            do
            {
              uint64_t v70 = *(void *)(v51 - 8);
              v51 -= 8;
              *((void *)v62 - 1) = v70;
              v62 -= 8;
            }
            while (v51 != *(void *)&v55);
          }
        }
        *(void *)&p_venueWallEndCapMeshInfo->_value.double type = v62;
        *(void *)&p_venueWallEndCapMeshInfo[1]._hasValue = v54;
        *(void *)&p_venueWallEndCapMeshInfo[1]._value.double type = v63;
        if (v55 != 0.0) {
          operator delete(*(void **)&v55);
        }
        goto LABEL_83;
      }
LABEL_95:
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
LABEL_94:
    abort();
  }
  *(_WORD *)(v51 - 8) = v52 + v48;
  *(_DWORD *)(v51 - 4) += v47;
LABEL_84:
  uint64_t v71 = *(void *)&p_venueWallEndCapMeshInfo[10]._hasValue;
  uint64_t v72 = *(void **)&p_venueWallEndCapMeshInfo[11]._hasValue;
  uint64_t v73 = *(std::__shared_weak_count **)&p_venueWallEndCapMeshInfo[11]._value.type;
  if (v73) {
    atomic_fetch_add_explicit(&v73->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  if (v72 && *v72 == v71 && !*(unsigned char *)(v71 + 40))
  {
    uint64_t v74 = *(void *)(v71 + 8) + v47;
    *(void *)v71 += 96 * v8;
    *(void *)(v71 + 8) = v74;
    uint64_t v75 = v72[3] + v47;
    v72[2] += 96 * v8;
    v72[3] = v75;
  }
  if (v73 && !atomic_fetch_add(&v73->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v73->__on_zero_shared)(v73);
    std::__shared_weak_count::__release_weak(v73);
  }
}

- (StrokeBufferSizing)bufferSizingForStrokesOnSection:(SEL)a3 styles:(const void *)a4 edges:(const void *)a5
{
  __n128 result = -[VKVenueGroup verticalStrokeCountForSection:styles:edges:](self, "verticalStrokeCountForSection:styles:edges:", a4, a5);
  uint64_t v9 = (uint64_t)(*((void *)a6 + 1) - *(void *)a6) >> 3;
  retstr->var0 = 0xB6DB6DB6DB6DB6DCLL * v9;
  retstr->unint64_t var1 = 0x924924924924924ALL * v9;
  retstr->var2 = 4 * (void)result;
  retstr->var3 = 6 * (void)result;
  return result;
}

- (unint64_t)verticalStrokeCountForSection:(const void *)a3 styles:(const void *)a4 edges:(const void *)a5
{
  uint64_t v5 = *(void *)a5;
  uint64_t v6 = *((void *)a5 + 1);
  if (*(void *)a5 == v6) {
    return 0;
  }
  unint64_t result = 0;
  do
  {
    uint64_t v8 = *(void *)(v5 + 24);
    if ((fabsf(vaddv_f32(vmul_f32(*(float32x2_t *)(*((void *)a3 + 2) + 8 * v8), *(float32x2_t *)(*((void *)a3 + 5)
                                                                                                  + 8 * v8)))) <= 0.93969
       || *(unsigned char *)(*(void *)a4 + 12 * v8))
      && (*(void *)(*((void *)a3 + 8)
                    + ((((unint64_t)(v8 + *((void *)a3 + 11) - 1) % *((void *)a3 + 11)) >> 3) & 0x1FFFFFFFFFFFFFF8)) & (1 << ((unint64_t)(v8 + *((void *)a3 + 11) - 1) % *((void *)a3 + 11)))) == 0)
    {
      ++result;
    }
    v5 += 56;
  }
  while (v5 != v6);
  return result;
}

- (const)generateEdgeListForPolygonSection:(const void *)a3 key:(const void *)a4
{
  uint64_t v5 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long> const&>,std::tuple<>>((uint64_t)&self->_venueWalls, *(void *)a4, *((void *)a4 + 1), a4);
  uint64_t v6 = v5;
  unint64_t v7 = (void **)(v5 + 4);
  uint64_t v8 = (unsigned char *)v5[4];
  unint64_t v9 = *((void *)a3 + 11);
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v5[6] - (void)v8) >> 3) >= v9)
  {
    if (!v9) {
      return v7;
    }
LABEL_11:
    unint64_t v18 = 0;
    while (1)
    {
      if ((*(void *)(*((void *)a3 + 8) + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v18))
      {
        unint64_t v19 = v18 + 1;
      }
      else
      {
        uint64_t v20 = *((void *)a3 + 1);
        unint64_t v21 = (int *)(v20 + 8 * v18);
        int v23 = *v21;
        int v22 = v21[1];
        unint64_t v19 = v18 + 1;
        unint64_t v24 = (v18 + 1) % v9;
        uint64_t v25 = (int *)(v20 + 8 * v24);
        int v27 = *v25;
        int v26 = v25[1];
        uint64_t v29 = (char *)v6[5];
        unint64_t v28 = v6[6];
        if ((unint64_t)v29 >= v28)
        {
          uint64_t v31 = (char *)*v7;
          uint64_t v32 = 0x6DB6DB6DB6DB6DB7 * ((v29 - (unsigned char *)*v7) >> 3);
          unint64_t v33 = v32 + 1;
          if ((unint64_t)(v32 + 1) > 0x492492492492492) {
            goto LABEL_33;
          }
          unint64_t v34 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v28 - (void)v31) >> 3);
          if (2 * v34 > v33) {
            unint64_t v33 = 2 * v34;
          }
          if (v34 >= 0x249249249249249) {
            unint64_t v35 = 0x492492492492492;
          }
          else {
            unint64_t v35 = v33;
          }
          if (v35 > 0x492492492492492) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v36 = 56 * v35;
          unint64_t v37 = (char *)operator new(56 * v35);
          int v38 = &v37[56 * v32];
          *(_DWORD *)int v38 = v23;
          *((_DWORD *)v38 + 1) = v22;
          *((_DWORD *)v38 + 2) = 0;
          *((_DWORD *)v38 + 3) = v27;
          *((_DWORD *)v38 + 4) = v26;
          *((_DWORD *)v38 + 5) = 0;
          *((void *)v38 + 3) = v18;
          *((void *)v38 + 4) = v24;
          *((void *)v38 + 5) = v18;
          *((void *)v38 + 6) = v24;
          if (v29 == v31)
          {
            long long v40 = &v37[56 * v32];
          }
          else
          {
            uint64_t v39 = &v37[56 * v32];
            do
            {
              long long v40 = v39 - 56;
              long long v41 = *(_OWORD *)(v29 - 56);
              long long v42 = *(_OWORD *)(v29 - 40);
              long long v43 = *(_OWORD *)(v29 - 24);
              *((void *)v39 - 1) = *((void *)v29 - 1);
              *(_OWORD *)(v39 - 24) = v43;
              *(_OWORD *)(v39 - 40) = v42;
              *(_OWORD *)(v39 - 56) = v41;
              v29 -= 56;
              v39 -= 56;
            }
            while (v29 != v31);
          }
          uint64_t v44 = &v37[v36];
          unint64_t v30 = v38 + 56;
          v6[4] = v40;
          v6[5] = v38 + 56;
          v6[6] = v44;
          if (v31) {
            operator delete(v31);
          }
        }
        else
        {
          *(_DWORD *)uint64_t v29 = v23;
          *((_DWORD *)v29 + 1) = v22;
          *((_DWORD *)v29 + 2) = 0;
          *((_DWORD *)v29 + 3) = v27;
          *((_DWORD *)v29 + 4) = v26;
          *((_DWORD *)v29 + 5) = 0;
          *((void *)v29 + 3) = v18;
          *((void *)v29 + 4) = v24;
          unint64_t v30 = v29 + 56;
          *((void *)v29 + 5) = v18;
          *((void *)v29 + 6) = v24;
        }
        v6[5] = v30;
        unint64_t v9 = *((void *)a3 + 11);
      }
      unint64_t v18 = v19;
      if (v19 >= v9) {
        return v7;
      }
    }
  }
  if (v9 > 0x492492492492492) {
LABEL_33:
  }
    abort();
  uint64_t v10 = (unsigned char *)v5[5];
  int v11 = (char *)operator new(56 * v9);
  uint64_t v12 = &v11[56 * ((v10 - v8) / 56)];
  unint64_t v13 = v12;
  if (v10 != v8)
  {
    float v14 = &v11[56 * ((v10 - v8) / 56)];
    do
    {
      unint64_t v13 = v14 - 56;
      long long v15 = *(_OWORD *)(v10 - 56);
      long long v16 = *(_OWORD *)(v10 - 40);
      long long v17 = *(_OWORD *)(v10 - 24);
      *((void *)v14 - 1) = *((void *)v10 - 1);
      *(_OWORD *)(v14 - 24) = v17;
      *(_OWORD *)(v14 - 40) = v16;
      *(_OWORD *)(v14 - 56) = v15;
      v10 -= 56;
      v14 -= 56;
    }
    while (v10 != v8);
  }
  v6[4] = v13;
  v6[5] = v12;
  v6[6] = &v11[56 * v9];
  if (v8)
  {
    operator delete(v8);
    unint64_t v9 = *((void *)a3 + 11);
  }
  if (v9) {
    goto LABEL_11;
  }
  return v7;
}

- (void)wallTexture
{
  return self->_wallTexture.__ptr_;
}

- (float)maximumSectionLength
{
  return self->_maximumSectionLength;
}

- (unint64_t)buildingId
{
  return self->_buildingId;
}

- (const)venueWallVerticalStrokeMeshes
{
  return &self->_venueWallVerticalStrokeMeshes;
}

- (const)venueWallHorizontalStrokeMeshes
{
  return &self->_venueWallHorizontalStrokeMeshes;
}

- (const)venueWallEndMeshes
{
  return &self->_venueWallEndMeshes;
}

- (const)venueWallMeshes
{
  return &self->_venueWallMeshes;
}

- (VKVenueGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 layer:(int)a5 buildingId:(unint64_t)a6 contentScale:(float)a7
{
  uint64_t v10 = 0;
  int v11 = 0;
  unint64_t v7 = -[VKPolygonGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](self, "initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:", a3, 0, &v10);
  uint64_t v8 = v11;
  if (v11 && !atomic_fetch_add(&v11->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
    std::__shared_weak_count::__release_weak(v8);
  }

  return v7;
}

- (VKVenueGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 layer:(int)a5 buildingId:(unint64_t)a6 contentScale:(float)a7 storage:(shared_ptr<md::MeshSetStorage>)a8
{
  ptr = a8.__ptr_;
  int v11 = (std::__shared_weak_count *)*((void *)a8.__ptr_ + 1);
  uint64_t v193 = *(void *)a8.__ptr_;
  v194 = v11;
  if (v11) {
    atomic_fetch_add_explicit(&v11->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v192.receiver = self;
  v192.super_class = (Class)VKVenueGroup;
  uint64_t v12 = -[VKPolygonGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](&v192, sel_initWithStyleQuery_tileZoom_fixedAroundCentroid_contentScale_storage_, a3, 0, &v193);
  unint64_t v13 = v12;
  float v14 = v194;
  if (v194 && !atomic_fetch_add(&v194->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
    std::__shared_weak_count::__release_weak(v14);
    if (!v13) {
      return v13;
    }
  }
  else if (!v12)
  {
    return v13;
  }
  v13->_layer = a5;
  unint64_t v180 = v13;
  v13->_buildingId = a6;
  uint64_t v15 = *(void *)ptr;
  LOBYTE(v191[0]) = 0;
  memset((char *)v191 + 2, 0, 38);
  long long v181 = 0u;
  memset(v182, 0, sizeof(v182));
  long long v183 = 0u;
  uint64_t v190 = 0;
  long long v187 = 0uLL;
  uint64_t v186 = 0;
  *((void *)&v191[0] + 1) = v15;
  if (!v15) {
    operator new();
  }
  long long v16 = (char *)operator new(0x90uLL);
  *((void *)v16 + 1) = 0;
  *((void *)v16 + 2) = 0;
  *(void *)long long v16 = &unk_1EF580F00;
  *((void *)v16 + 3) = v15;
  long long v17 = v16 + 24;
  *((void *)v16 + 4) = 24;
  *(_OWORD *)(v16 + 40) = 0u;
  *(_OWORD *)(v16 + 56) = 0u;
  *(_OWORD *)(v16 + 72) = 0u;
  *(_OWORD *)(v16 + 88) = 0u;
  v16[104] = 0;
  *((void *)v16 + 17) = v16 + 112;
  *((void *)v16 + 14) = &unk_1EF570BF0;
  *(void *)&long long v195 = v16 + 24;
  *((void *)&v195 + 1) = v16;
  unint64_t v19 = (uint64_t **)(v15 + 24);
  unint64_t v18 = *(uint64_t **)(v15 + 24);
  if (v18)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v20 = (uint64_t **)v18;
        unint64_t v21 = v18[4];
        if ((unint64_t)v17 >= v21) {
          break;
        }
        unint64_t v18 = *v20;
        unint64_t v19 = v20;
        if (!*v20) {
          goto LABEL_15;
        }
      }
      if (v21 >= (unint64_t)v17) {
        break;
      }
      unint64_t v18 = v20[1];
      if (!v18)
      {
        unint64_t v19 = v20 + 1;
        goto LABEL_15;
      }
    }
  }
  else
  {
    uint64_t v20 = (uint64_t **)(v15 + 24);
LABEL_15:
    int v22 = (uint64_t *)operator new(0x30uLL);
    v22[4] = (uint64_t)v17;
    v22[5] = (uint64_t)v16;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v16 + 1, 1uLL, memory_order_relaxed);
    uint64_t *v22 = 0;
    v22[1] = 0;
    v22[2] = (uint64_t)v20;
    uint64_t *v19 = v22;
    uint64_t v23 = **(void **)(v15 + 16);
    if (v23)
    {
      *(void *)(v15 + 16) = v23;
      int v22 = *v19;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v15 + 24), v22);
    ++*(void *)(v15 + 32);
  }
  long long v24 = v195;
  long long v195 = 0uLL;
  uint64_t v25 = *(std::__shared_weak_count **)&v191[2];
  *(_OWORD *)((char *)&v191[1] + 8) = v24;
  if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
    std::__shared_weak_count::__release_weak(v25);
  }
  int v26 = (std::__shared_weak_count *)*((void *)&v195 + 1);
  if (*((void *)&v195 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v195 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
  int v27 = (char *)*((void *)&v181 + 1);
  if (*((void *)&v181 + 1) >= *(void *)&v182[0])
  {
    uint64_t v29 = (char *)v181;
    uint64_t v30 = *((void *)&v181 + 1) - v181;
    uint64_t v31 = (uint64_t)(*((void *)&v181 + 1) - v181) >> 3;
    unint64_t v32 = v31 + 1;
    if ((unint64_t)(v31 + 1) >> 61) {
      abort();
    }
    uint64_t v33 = *(void *)&v182[0] - v181;
    if ((uint64_t)(*(void *)&v182[0] - v181) >> 2 > v32) {
      unint64_t v32 = v33 >> 2;
    }
    if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v34 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v34 = v32;
    }
    if (v34 >> 61) {
      goto LABEL_227;
    }
    unint64_t v35 = (char *)operator new(8 * v34);
    uint64_t v36 = &v35[8 * v31];
    *(_WORD *)uint64_t v36 = 0;
    *((_DWORD *)v36 + 1) = 0;
    unint64_t v28 = v36 + 8;
    if (v27 != v29)
    {
      unint64_t v37 = v27 - v29 - 8;
      if (v37 < 0x58) {
        goto LABEL_234;
      }
      if ((unint64_t)(&v27[-v30] - v35) < 0x20) {
        goto LABEL_234;
      }
      uint64_t v38 = (v37 >> 3) + 1;
      uint64_t v39 = &v35[8 * v31 - 16];
      long long v40 = v27 - 16;
      uint64_t v41 = v38 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v42 = *(_OWORD *)v40;
        *((_OWORD *)v39 - 1) = *((_OWORD *)v40 - 1);
        *(_OWORD *)uint64_t v39 = v42;
        v39 -= 32;
        v40 -= 32;
        v41 -= 4;
      }
      while (v41);
      v36 -= 8 * (v38 & 0x3FFFFFFFFFFFFFFCLL);
      v27 -= 8 * (v38 & 0x3FFFFFFFFFFFFFFCLL);
      if (v38 != (v38 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_234:
        do
        {
          uint64_t v43 = *((void *)v27 - 1);
          v27 -= 8;
          *((void *)v36 - 1) = v43;
          v36 -= 8;
        }
        while (v27 != v29);
      }
    }
    *(void *)&long long v181 = v36;
    *((void *)&v181 + 1) = v28;
    *(void *)&v182[0] = &v35[8 * v34];
    if (v29) {
      operator delete(v29);
    }
  }
  else
  {
    **((_WORD **)&v181 + 1) = 0;
    *((_DWORD *)v27 + 1) = 0;
    unint64_t v28 = v27 + 8;
  }
  *((void *)&v181 + 1) = v28;
  p_value = (void **)&v13->_venueWallMeshInfo._value;
  if (v13->_venueWallMeshInfo._hasValue)
  {
    unint64_t v45 = *p_value;
    if (*p_value)
    {
      *(void *)v13->_anon_c48 = v45;
      operator delete(v45);
      *p_value = 0;
      *(void *)v13->_anon_c48 = 0;
      *(void *)&v13->_anon_c48[8] = 0;
    }
    *(_OWORD *)v13->_venueWallMeshInfo._value.data = v181;
    *(void *)&v13->_anon_c48[8] = *(void *)&v182[0];
    long long v181 = 0uLL;
    *(void *)&v182[0] = 0;
    unint64_t v46 = (void **)&v13->_anon_c48[16];
    uint64_t v47 = *(void *)&v13->_anon_c48[16];
    if (v47)
    {
      uint64_t v48 = *(void *)&v13->_anon_c48[24];
      unint64_t v49 = *(void **)&v13->_anon_c48[16];
      if (v48 != v47)
      {
        do
        {
          long long v50 = *(std::__shared_weak_count **)(v48 - 8);
          if (v50 && !atomic_fetch_add(&v50->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
            std::__shared_weak_count::__release_weak(v50);
          }
          v48 -= 16;
        }
        while (v48 != v47);
        unint64_t v49 = *v46;
      }
      *(void *)&v13->_anon_c48[24] = v47;
      operator delete(v49);
      *unint64_t v46 = 0;
      *(void *)&v13->_anon_c48[24] = 0;
      *(void *)&v13->_anon_c48[32] = 0;
    }
    *(_OWORD *)&v13->_anon_c48[16] = *(_OWORD *)((char *)v182 + 8);
    *(void *)&v13->_anon_c48[32] = *((void *)&v182[1] + 1);
    memset((char *)v182 + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v13->_anon_c48[40], (uint64_t)&v183);
    ggl::BufferMemory::operator=((uint64_t *)&v13->_anon_c48[88], (uint64_t)&v187);
    *(_OWORD *)&v13->_anon_c48[136] = v191[0];
    uint64_t v52 = *(void *)&v191[1];
    *(void *)&v191[1] = 0;
    uint64_t v53 = *(void *)&v13->_anon_c48[152];
    *(void *)&v13->_anon_c48[152] = v52;
    if (v53) {
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v53);
    }
    long long v54 = *(_OWORD *)((char *)&v191[1] + 8);
    *((void *)&v191[1] + 1) = 0;
    *(void *)&v191[2] = 0;
    double v55 = *(std::__shared_weak_count **)&v13->_anon_c48[168];
    *(_OWORD *)&v13->_anon_c48[160] = v54;
    if (v55 && !atomic_fetch_add(&v55->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }
  else
  {
    *p_value = 0;
    *(void *)v13->_anon_c48 = 0;
    *(void *)&v13->_anon_c48[8] = 0;
    *(_OWORD *)v13->_venueWallMeshInfo._value.data = v181;
    *(void *)&v13->_anon_c48[8] = *(void *)&v182[0];
    long long v181 = 0uLL;
    *(void *)&v182[0] = 0;
    *(void *)&v13->_anon_c48[16] = 0;
    *(void *)&v13->_anon_c48[24] = 0;
    *(void *)&v13->_anon_c48[32] = 0;
    *(_OWORD *)&v13->_anon_c48[16] = *(_OWORD *)((char *)v182 + 8);
    *(void *)&v13->_anon_c48[32] = *((void *)&v182[1] + 1);
    memset((char *)v182 + 8, 0, 24);
    *(_OWORD *)&v13->_anon_c48[40] = v183;
    *(_OWORD *)&v13->_anon_c48[56] = v184;
    *(_WORD *)&v13->_anon_c48[72] = v185;
    *(void *)&v13->_anon_c48[80] = v186;
    uint64_t v186 = 0;
    long long v183 = 0uLL;
    *(_OWORD *)&v13->_anon_c48[88] = v187;
    *(_OWORD *)&v13->_anon_c48[104] = v188;
    *(_WORD *)&v13->_anon_c48[120] = v189;
    *(void *)&v13->_anon_c48[128] = v190;
    uint64_t v190 = 0;
    long long v187 = 0uLL;
    *(_OWORD *)&v13->_anon_c48[136] = v191[0];
    long long v51 = v191[1];
    *(void *)&v191[1] = 0;
    *(_OWORD *)&v13->_anon_c48[152] = v51;
    *(void *)&v13->_anon_c48[168] = *(void *)&v191[2];
    *((void *)&v191[1] + 1) = 0;
    *(void *)&v191[2] = 0;
    v13->_venueWallMeshInfo._hasValue = 1;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v181);
  uint64_t v56 = *(void *)ptr;
  LOBYTE(v191[0]) = 0;
  memset((char *)v191 + 2, 0, 38);
  long long v181 = 0u;
  memset(v182, 0, sizeof(v182));
  long long v183 = 0u;
  uint64_t v190 = 0;
  long long v187 = 0uLL;
  uint64_t v186 = 0;
  *((void *)&v191[0] + 1) = v56;
  if (!v56) {
    operator new();
  }
  unint64_t v57 = (char *)operator new(0x90uLL);
  *((void *)v57 + 1) = 0;
  *((void *)v57 + 2) = 0;
  *(void *)unint64_t v57 = &unk_1EF580F00;
  *((void *)v57 + 3) = v56;
  uint64_t v58 = v57 + 24;
  *((void *)v57 + 4) = 24;
  *(_OWORD *)(v57 + 40) = 0u;
  *(_OWORD *)(v57 + 56) = 0u;
  *(_OWORD *)(v57 + 72) = 0u;
  *(_OWORD *)(v57 + 88) = 0u;
  v57[104] = 0;
  *((void *)v57 + 17) = v57 + 112;
  *((void *)v57 + 14) = &unk_1EF570C38;
  *(void *)&long long v195 = v57 + 24;
  *((void *)&v195 + 1) = v57;
  uint64_t v60 = (uint64_t **)(v56 + 24);
  unint64_t v59 = *(uint64_t **)(v56 + 24);
  if (v59)
  {
    while (1)
    {
      while (1)
      {
        long long v61 = (uint64_t **)v59;
        unint64_t v62 = v59[4];
        if ((unint64_t)v58 >= v62) {
          break;
        }
        unint64_t v59 = *v61;
        uint64_t v60 = v61;
        if (!*v61) {
          goto LABEL_72;
        }
      }
      if (v62 >= (unint64_t)v58) {
        break;
      }
      unint64_t v59 = v61[1];
      if (!v59)
      {
        uint64_t v60 = v61 + 1;
        goto LABEL_72;
      }
    }
  }
  else
  {
    long long v61 = (uint64_t **)(v56 + 24);
LABEL_72:
    int v63 = (uint64_t *)operator new(0x30uLL);
    v63[4] = (uint64_t)v58;
    v63[5] = (uint64_t)v57;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v57 + 1, 1uLL, memory_order_relaxed);
    *int v63 = 0;
    v63[1] = 0;
    v63[2] = (uint64_t)v61;
    *uint64_t v60 = v63;
    uint64_t v64 = **(void **)(v56 + 16);
    if (v64)
    {
      *(void *)(v56 + 16) = v64;
      int v63 = *v60;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v56 + 24), v63);
    ++*(void *)(v56 + 32);
  }
  long long v65 = v195;
  long long v195 = 0uLL;
  uint64_t v66 = *(std::__shared_weak_count **)&v191[2];
  *(_OWORD *)((char *)&v191[1] + 8) = v65;
  if (v66 && !atomic_fetch_add(&v66->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
    std::__shared_weak_count::__release_weak(v66);
  }
  uint64_t v67 = (std::__shared_weak_count *)*((void *)&v195 + 1);
  if (*((void *)&v195 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v195 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v67->__on_zero_shared)(v67);
    std::__shared_weak_count::__release_weak(v67);
  }
  uint64_t v68 = (char *)*((void *)&v181 + 1);
  if (*((void *)&v181 + 1) >= *(void *)&v182[0])
  {
    uint64_t v70 = (char *)v181;
    uint64_t v71 = *((void *)&v181 + 1) - v181;
    uint64_t v72 = (uint64_t)(*((void *)&v181 + 1) - v181) >> 3;
    unint64_t v73 = v72 + 1;
    if ((unint64_t)(v72 + 1) >> 61) {
      abort();
    }
    uint64_t v74 = *(void *)&v182[0] - v181;
    if ((uint64_t)(*(void *)&v182[0] - v181) >> 2 > v73) {
      unint64_t v73 = v74 >> 2;
    }
    if ((unint64_t)v74 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v75 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v75 = v73;
    }
    if (v75 >> 61) {
      goto LABEL_227;
    }
    int v76 = (char *)operator new(8 * v75);
    unint64_t v77 = &v76[8 * v72];
    *(_WORD *)unint64_t v77 = 0;
    *((_DWORD *)v77 + 1) = 0;
    long long v69 = v77 + 8;
    if (v68 != v70)
    {
      unint64_t v78 = v68 - v70 - 8;
      if (v78 < 0x58) {
        goto LABEL_235;
      }
      if ((unint64_t)(&v68[-v71] - v76) < 0x20) {
        goto LABEL_235;
      }
      uint64_t v79 = (v78 >> 3) + 1;
      uint64_t v80 = &v76[8 * v72 - 16];
      uint64_t v81 = v68 - 16;
      uint64_t v82 = v79 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v83 = *(_OWORD *)v81;
        *((_OWORD *)v80 - 1) = *((_OWORD *)v81 - 1);
        *(_OWORD *)uint64_t v80 = v83;
        v80 -= 32;
        v81 -= 32;
        v82 -= 4;
      }
      while (v82);
      v77 -= 8 * (v79 & 0x3FFFFFFFFFFFFFFCLL);
      v68 -= 8 * (v79 & 0x3FFFFFFFFFFFFFFCLL);
      if (v79 != (v79 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_235:
        do
        {
          uint64_t v84 = *((void *)v68 - 1);
          v68 -= 8;
          *((void *)v77 - 1) = v84;
          v77 -= 8;
        }
        while (v68 != v70);
      }
    }
    *(void *)&long long v181 = v77;
    *((void *)&v181 + 1) = v69;
    *(void *)&v182[0] = &v76[8 * v75];
    if (v70) {
      operator delete(v70);
    }
  }
  else
  {
    **((_WORD **)&v181 + 1) = 0;
    *((_DWORD *)v68 + 1) = 0;
    long long v69 = v68 + 8;
  }
  *((void *)&v181 + 1) = v69;
  v85 = (void **)&v13->_venueWallEndCapMeshInfo._value;
  if (v13->_venueWallEndCapMeshInfo._hasValue)
  {
    int v86 = *v85;
    if (*v85)
    {
      *(void *)v13->_anon_d08 = v86;
      operator delete(v86);
      __n128 *v85 = 0;
      *(void *)v13->_anon_d08 = 0;
      *(void *)&v13->_anon_d08[8] = 0;
    }
    *(_OWORD *)v13->_venueWallEndCapMeshInfo._value.data = v181;
    *(void *)&v13->_anon_d08[8] = *(void *)&v182[0];
    long long v181 = 0uLL;
    *(void *)&v182[0] = 0;
    uint64_t v87 = (void **)&v13->_anon_d08[16];
    uint64_t v88 = *(void *)&v13->_anon_d08[16];
    if (v88)
    {
      uint64_t v89 = *(void *)&v13->_anon_d08[24];
      unint64_t v90 = *(void **)&v13->_anon_d08[16];
      if (v89 != v88)
      {
        do
        {
          int v91 = *(std::__shared_weak_count **)(v89 - 8);
          if (v91 && !atomic_fetch_add(&v91->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
            std::__shared_weak_count::__release_weak(v91);
          }
          v89 -= 16;
        }
        while (v89 != v88);
        unint64_t v90 = *v87;
      }
      *(void *)&v13->_anon_d08[24] = v88;
      operator delete(v90);
      *uint64_t v87 = 0;
      *(void *)&v13->_anon_d08[24] = 0;
      *(void *)&v13->_anon_d08[32] = 0;
    }
    *(_OWORD *)&v13->_anon_d08[16] = *(_OWORD *)((char *)v182 + 8);
    *(void *)&v13->_anon_d08[32] = *((void *)&v182[1] + 1);
    memset((char *)v182 + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v13->_anon_d08[40], (uint64_t)&v183);
    ggl::BufferMemory::operator=((uint64_t *)&v13->_anon_d08[88], (uint64_t)&v187);
    *(_OWORD *)&v13->_anon_d08[136] = v191[0];
    uint64_t v93 = *(void *)&v191[1];
    *(void *)&v191[1] = 0;
    uint64_t v94 = *(void *)&v13->_anon_d08[152];
    *(void *)&v13->_anon_d08[152] = v93;
    if (v94) {
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v94);
    }
    long long v95 = *(_OWORD *)((char *)&v191[1] + 8);
    *((void *)&v191[1] + 1) = 0;
    *(void *)&v191[2] = 0;
    __n128 v96 = *(std::__shared_weak_count **)&v13->_anon_d08[168];
    *(_OWORD *)&v13->_anon_d08[160] = v95;
    if (v96 && !atomic_fetch_add(&v96->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v96->__on_zero_shared)(v96);
      std::__shared_weak_count::__release_weak(v96);
    }
  }
  else
  {
    __n128 *v85 = 0;
    *(void *)v13->_anon_d08 = 0;
    *(void *)&v13->_anon_d08[8] = 0;
    *(_OWORD *)v13->_venueWallEndCapMeshInfo._value.data = v181;
    *(void *)&v13->_anon_d08[8] = *(void *)&v182[0];
    long long v181 = 0uLL;
    *(void *)&v182[0] = 0;
    *(void *)&v13->_anon_d08[16] = 0;
    *(void *)&v13->_anon_d08[24] = 0;
    *(void *)&v13->_anon_d08[32] = 0;
    *(_OWORD *)&v13->_anon_d08[16] = *(_OWORD *)((char *)v182 + 8);
    *(void *)&v13->_anon_d08[32] = *((void *)&v182[1] + 1);
    memset((char *)v182 + 8, 0, 24);
    *(_OWORD *)&v13->_anon_d08[40] = v183;
    *(_OWORD *)&v13->_anon_d08[56] = v184;
    *(_WORD *)&v13->_anon_d08[72] = v185;
    *(void *)&v13->_anon_d08[80] = v186;
    uint64_t v186 = 0;
    long long v183 = 0uLL;
    *(_OWORD *)&v13->_anon_d08[88] = v187;
    *(_OWORD *)&v13->_anon_d08[104] = v188;
    *(_WORD *)&v13->_anon_d08[120] = v189;
    *(void *)&v13->_anon_d08[128] = v190;
    uint64_t v190 = 0;
    long long v187 = 0uLL;
    *(_OWORD *)&v13->_anon_d08[136] = v191[0];
    long long v92 = v191[1];
    *(void *)&v191[1] = 0;
    *(_OWORD *)&v13->_anon_d08[152] = v92;
    *(void *)&v13->_anon_d08[168] = *(void *)&v191[2];
    *((void *)&v191[1] + 1) = 0;
    *(void *)&v191[2] = 0;
    v13->_venueWallEndCapMeshInfo._hasValue = 1;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v181);
  uint64_t v97 = *(void *)ptr;
  LOBYTE(v191[0]) = 0;
  memset((char *)v191 + 2, 0, 38);
  long long v181 = 0u;
  memset(v182, 0, sizeof(v182));
  long long v183 = 0u;
  uint64_t v190 = 0;
  long long v187 = 0uLL;
  uint64_t v186 = 0;
  *((void *)&v191[0] + 1) = v97;
  if (!v97) {
    operator new();
  }
  uint64_t v98 = (char *)operator new(0x90uLL);
  *((void *)v98 + 1) = 0;
  *((void *)v98 + 2) = 0;
  *(void *)uint64_t v98 = &unk_1EF580F00;
  *((void *)v98 + 3) = v97;
  uint64_t v99 = v98 + 24;
  *((void *)v98 + 4) = 40;
  *(_OWORD *)(v98 + 40) = 0u;
  *(_OWORD *)(v98 + 56) = 0u;
  *(_OWORD *)(v98 + 72) = 0u;
  *(_OWORD *)(v98 + 88) = 0u;
  v98[104] = 0;
  *((void *)v98 + 17) = v98 + 112;
  *((void *)v98 + 14) = &unk_1EF570B18;
  *(void *)&long long v195 = v98 + 24;
  *((void *)&v195 + 1) = v98;
  uint64_t v101 = (uint64_t **)(v97 + 24);
  int v100 = *(uint64_t **)(v97 + 24);
  if (v100)
  {
    while (1)
    {
      while (1)
      {
        uint64_t v102 = (uint64_t **)v100;
        unint64_t v103 = v100[4];
        if ((unint64_t)v99 >= v103) {
          break;
        }
        int v100 = *v102;
        uint64_t v101 = v102;
        if (!*v102) {
          goto LABEL_126;
        }
      }
      if (v103 >= (unint64_t)v99) {
        break;
      }
      int v100 = v102[1];
      if (!v100)
      {
        uint64_t v101 = v102 + 1;
        goto LABEL_126;
      }
    }
  }
  else
  {
    uint64_t v102 = (uint64_t **)(v97 + 24);
LABEL_126:
    uint64_t v104 = (uint64_t *)operator new(0x30uLL);
    v104[4] = (uint64_t)v99;
    v104[5] = (uint64_t)v98;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v98 + 1, 1uLL, memory_order_relaxed);
    *uint64_t v104 = 0;
    v104[1] = 0;
    v104[2] = (uint64_t)v102;
    *uint64_t v101 = v104;
    uint64_t v105 = **(void **)(v97 + 16);
    if (v105)
    {
      *(void *)(v97 + 16) = v105;
      uint64_t v104 = *v101;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v97 + 24), v104);
    ++*(void *)(v97 + 32);
  }
  long long v106 = v195;
  long long v195 = 0uLL;
  long long v107 = *(std::__shared_weak_count **)&v191[2];
  *(_OWORD *)((char *)&v191[1] + 8) = v106;
  if (v107 && !atomic_fetch_add(&v107->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
    std::__shared_weak_count::__release_weak(v107);
  }
  unint64_t v108 = (std::__shared_weak_count *)*((void *)&v195 + 1);
  if (*((void *)&v195 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v195 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v108->__on_zero_shared)(v108);
    std::__shared_weak_count::__release_weak(v108);
  }
  unint64_t v109 = (char *)*((void *)&v181 + 1);
  if (*((void *)&v181 + 1) >= *(void *)&v182[0])
  {
    int v111 = (char *)v181;
    uint64_t v112 = *((void *)&v181 + 1) - v181;
    uint64_t v113 = (uint64_t)(*((void *)&v181 + 1) - v181) >> 3;
    unint64_t v114 = v113 + 1;
    if ((unint64_t)(v113 + 1) >> 61) {
      abort();
    }
    uint64_t v115 = *(void *)&v182[0] - v181;
    if ((uint64_t)(*(void *)&v182[0] - v181) >> 2 > v114) {
      unint64_t v114 = v115 >> 2;
    }
    if ((unint64_t)v115 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v116 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v116 = v114;
    }
    if (v116 >> 61) {
      goto LABEL_227;
    }
    uint64_t v117 = (char *)operator new(8 * v116);
    uint64_t v118 = &v117[8 * v113];
    *(_WORD *)uint64_t v118 = 0;
    *((_DWORD *)v118 + 1) = 0;
    long long v110 = v118 + 8;
    if (v109 != v111)
    {
      unint64_t v119 = v109 - v111 - 8;
      if (v119 < 0x58) {
        goto LABEL_236;
      }
      if ((unint64_t)(&v109[-v112] - v117) < 0x20) {
        goto LABEL_236;
      }
      uint64_t v120 = (v119 >> 3) + 1;
      long long v121 = &v117[8 * v113 - 16];
      int v122 = v109 - 16;
      uint64_t v123 = v120 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v124 = *(_OWORD *)v122;
        *((_OWORD *)v121 - 1) = *((_OWORD *)v122 - 1);
        *(_OWORD *)long long v121 = v124;
        v121 -= 32;
        v122 -= 32;
        v123 -= 4;
      }
      while (v123);
      v118 -= 8 * (v120 & 0x3FFFFFFFFFFFFFFCLL);
      v109 -= 8 * (v120 & 0x3FFFFFFFFFFFFFFCLL);
      if (v120 != (v120 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_236:
        do
        {
          uint64_t v125 = *((void *)v109 - 1);
          v109 -= 8;
          *((void *)v118 - 1) = v125;
          v118 -= 8;
        }
        while (v109 != v111);
      }
    }
    *(void *)&long long v181 = v118;
    *((void *)&v181 + 1) = v110;
    *(void *)&v182[0] = &v117[8 * v116];
    if (v111) {
      operator delete(v111);
    }
  }
  else
  {
    **((_WORD **)&v181 + 1) = 0;
    *((_DWORD *)v109 + 1) = 0;
    long long v110 = v109 + 8;
  }
  *((void *)&v181 + 1) = v110;
  v126 = (void **)&v13->_venueWallHorizontalStrokeMeshInfo._value;
  if (v13->_venueWallHorizontalStrokeMeshInfo._hasValue)
  {
    v127 = *v126;
    if (*v126)
    {
      *(void *)v13->_anon_dc8 = v127;
      operator delete(v127);
      uint64_t *v126 = 0;
      *(void *)v13->_anon_dc8 = 0;
      *(void *)&v13->_anon_dc8[8] = 0;
    }
    *(_OWORD *)v13->_venueWallHorizontalStrokeMeshInfo._value.data = v181;
    *(void *)&v13->_anon_dc8[8] = *(void *)&v182[0];
    long long v181 = 0uLL;
    *(void *)&v182[0] = 0;
    double v128 = (void **)&v13->_anon_dc8[16];
    uint64_t v129 = *(void *)&v13->_anon_dc8[16];
    if (v129)
    {
      uint64_t v130 = *(void *)&v13->_anon_dc8[24];
      uint64_t v131 = *(void **)&v13->_anon_dc8[16];
      if (v130 != v129)
      {
        do
        {
          uint64_t v132 = *(std::__shared_weak_count **)(v130 - 8);
          if (v132 && !atomic_fetch_add(&v132->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v132->__on_zero_shared)(v132);
            std::__shared_weak_count::__release_weak(v132);
          }
          v130 -= 16;
        }
        while (v130 != v129);
        uint64_t v131 = *v128;
      }
      *(void *)&v13->_anon_dc8[24] = v129;
      operator delete(v131);
      *double v128 = 0;
      *(void *)&v13->_anon_dc8[24] = 0;
      *(void *)&v13->_anon_dc8[32] = 0;
    }
    *(_OWORD *)&v13->_anon_dc8[16] = *(_OWORD *)((char *)v182 + 8);
    *(void *)&v13->_anon_dc8[32] = *((void *)&v182[1] + 1);
    memset((char *)v182 + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v13->_anon_dc8[40], (uint64_t)&v183);
    ggl::BufferMemory::operator=((uint64_t *)&v13->_anon_dc8[88], (uint64_t)&v187);
    *(_OWORD *)&v13->_anon_dc8[136] = v191[0];
    uint64_t v134 = *(void *)&v191[1];
    *(void *)&v191[1] = 0;
    uint64_t v135 = *(void *)&v13->_anon_dc8[152];
    *(void *)&v13->_anon_dc8[152] = v134;
    if (v135) {
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v135);
    }
    long long v136 = *(_OWORD *)((char *)&v191[1] + 8);
    *((void *)&v191[1] + 1) = 0;
    *(void *)&v191[2] = 0;
    v137 = *(std::__shared_weak_count **)&v13->_anon_dc8[168];
    *(_OWORD *)&v13->_anon_dc8[160] = v136;
    if (v137 && !atomic_fetch_add(&v137->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v137->__on_zero_shared)(v137);
      std::__shared_weak_count::__release_weak(v137);
    }
  }
  else
  {
    uint64_t *v126 = 0;
    *(void *)v13->_anon_dc8 = 0;
    *(void *)&v13->_anon_dc8[8] = 0;
    *(_OWORD *)v13->_venueWallHorizontalStrokeMeshInfo._value.data = v181;
    *(void *)&v13->_anon_dc8[8] = *(void *)&v182[0];
    long long v181 = 0uLL;
    *(void *)&v182[0] = 0;
    *(void *)&v13->_anon_dc8[16] = 0;
    *(void *)&v13->_anon_dc8[24] = 0;
    *(void *)&v13->_anon_dc8[32] = 0;
    *(_OWORD *)&v13->_anon_dc8[16] = *(_OWORD *)((char *)v182 + 8);
    *(void *)&v13->_anon_dc8[32] = *((void *)&v182[1] + 1);
    memset((char *)v182 + 8, 0, 24);
    *(_OWORD *)&v13->_anon_dc8[40] = v183;
    *(_OWORD *)&v13->_anon_dc8[56] = v184;
    *(_WORD *)&v13->_anon_dc8[72] = v185;
    *(void *)&v13->_anon_dc8[80] = v186;
    uint64_t v186 = 0;
    long long v183 = 0uLL;
    *(_OWORD *)&v13->_anon_dc8[88] = v187;
    *(_OWORD *)&v13->_anon_dc8[104] = v188;
    *(_WORD *)&v13->_anon_dc8[120] = v189;
    *(void *)&v13->_anon_dc8[128] = v190;
    uint64_t v190 = 0;
    long long v187 = 0uLL;
    *(_OWORD *)&v13->_anon_dc8[136] = v191[0];
    long long v133 = v191[1];
    *(void *)&v191[1] = 0;
    *(_OWORD *)&v13->_anon_dc8[152] = v133;
    *(void *)&v13->_anon_dc8[168] = *(void *)&v191[2];
    *((void *)&v191[1] + 1) = 0;
    *(void *)&v191[2] = 0;
    v13->_venueWallHorizontalStrokeMeshInfo._hasValue = 1;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v181);
  uint64_t v138 = *(void *)ptr;
  LOBYTE(v191[0]) = 0;
  memset((char *)v191 + 2, 0, 38);
  long long v181 = 0u;
  memset(v182, 0, sizeof(v182));
  long long v183 = 0u;
  uint64_t v190 = 0;
  long long v187 = 0uLL;
  uint64_t v186 = 0;
  *((void *)&v191[0] + 1) = v138;
  if (!v138) {
    operator new();
  }
  v139 = (char *)operator new(0x90uLL);
  *((void *)v139 + 1) = 0;
  *((void *)v139 + 2) = 0;
  *(void *)v139 = &unk_1EF580F00;
  *((void *)v139 + 3) = v138;
  uint64_t v140 = v139 + 24;
  *((void *)v139 + 4) = 32;
  *(_OWORD *)(v139 + 40) = 0u;
  *(_OWORD *)(v139 + 56) = 0u;
  *(_OWORD *)(v139 + 72) = 0u;
  *(_OWORD *)(v139 + 88) = 0u;
  v139[104] = 0;
  *((void *)v139 + 17) = v139 + 112;
  *((void *)v139 + 14) = &unk_1EF570AD0;
  *(void *)&long long v195 = v139 + 24;
  *((void *)&v195 + 1) = v139;
  v142 = (uint64_t **)(v138 + 24);
  v141 = *(uint64_t **)(v138 + 24);
  if (v141)
  {
    while (1)
    {
      while (1)
      {
        unint64_t v143 = (uint64_t **)v141;
        unint64_t v144 = v141[4];
        if ((unint64_t)v140 >= v144) {
          break;
        }
        v141 = *v143;
        v142 = v143;
        if (!*v143) {
          goto LABEL_180;
        }
      }
      if (v144 >= (unint64_t)v140) {
        break;
      }
      v141 = v143[1];
      if (!v141)
      {
        v142 = v143 + 1;
        goto LABEL_180;
      }
    }
  }
  else
  {
    unint64_t v143 = (uint64_t **)(v138 + 24);
LABEL_180:
    v145 = (uint64_t *)operator new(0x30uLL);
    v145[4] = (uint64_t)v140;
    v145[5] = (uint64_t)v139;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v139 + 1, 1uLL, memory_order_relaxed);
    uint64_t *v145 = 0;
    v145[1] = 0;
    v145[2] = (uint64_t)v143;
    std::__shared_weak_count *v142 = v145;
    uint64_t v146 = **(void **)(v138 + 16);
    if (v146)
    {
      *(void *)(v138 + 16) = v146;
      v145 = *v142;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v138 + 24), v145);
    ++*(void *)(v138 + 32);
  }
  long long v147 = v195;
  long long v195 = 0uLL;
  unint64_t v148 = *(std::__shared_weak_count **)&v191[2];
  *(_OWORD *)((char *)&v191[1] + 8) = v147;
  if (v148 && !atomic_fetch_add(&v148->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
    std::__shared_weak_count::__release_weak(v148);
  }
  uint64_t v149 = (std::__shared_weak_count *)*((void *)&v195 + 1);
  if (*((void *)&v195 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v195 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v149->__on_zero_shared)(v149);
    std::__shared_weak_count::__release_weak(v149);
  }
  unint64_t v150 = (char *)*((void *)&v181 + 1);
  if (*((void *)&v181 + 1) >= *(void *)&v182[0])
  {
    v152 = (char *)v181;
    uint64_t v153 = *((void *)&v181 + 1) - v181;
    uint64_t v154 = (uint64_t)(*((void *)&v181 + 1) - v181) >> 3;
    unint64_t v155 = v154 + 1;
    if ((unint64_t)(v154 + 1) >> 61) {
      abort();
    }
    uint64_t v156 = *(void *)&v182[0] - v181;
    if ((uint64_t)(*(void *)&v182[0] - v181) >> 2 > v155) {
      unint64_t v155 = v156 >> 2;
    }
    if ((unint64_t)v156 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v157 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v157 = v155;
    }
    if (!(v157 >> 61))
    {
      v158 = (char *)operator new(8 * v157);
      uint64_t v159 = &v158[8 * v154];
      *(_WORD *)uint64_t v159 = 0;
      *((_DWORD *)v159 + 1) = 0;
      v151 = v159 + 8;
      if (v150 != v152)
      {
        unint64_t v160 = v150 - v152 - 8;
        if (v160 < 0x58) {
          goto LABEL_237;
        }
        if ((unint64_t)(&v150[-v153] - v158) < 0x20) {
          goto LABEL_237;
        }
        uint64_t v161 = (v160 >> 3) + 1;
        uint64_t v162 = &v158[8 * v154 - 16];
        uint64_t v163 = v150 - 16;
        uint64_t v164 = v161 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v165 = *(_OWORD *)v163;
          *((_OWORD *)v162 - 1) = *((_OWORD *)v163 - 1);
          *(_OWORD *)uint64_t v162 = v165;
          v162 -= 32;
          v163 -= 32;
          v164 -= 4;
        }
        while (v164);
        v159 -= 8 * (v161 & 0x3FFFFFFFFFFFFFFCLL);
        v150 -= 8 * (v161 & 0x3FFFFFFFFFFFFFFCLL);
        if (v161 != (v161 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_237:
          do
          {
            uint64_t v166 = *((void *)v150 - 1);
            v150 -= 8;
            *((void *)v159 - 1) = v166;
            v159 -= 8;
          }
          while (v150 != v152);
        }
      }
      *(void *)&long long v181 = v159;
      *((void *)&v181 + 1) = v151;
      *(void *)&v182[0] = &v158[8 * v157];
      if (v152) {
        operator delete(v152);
      }
      goto LABEL_207;
    }
LABEL_227:
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  **((_WORD **)&v181 + 1) = 0;
  *((_DWORD *)v150 + 1) = 0;
  v151 = v150 + 8;
LABEL_207:
  *((void *)&v181 + 1) = v151;
  unint64_t v13 = v180;
  long long v167 = (void **)&v180->_venueWallVerticalStrokeMeshInfo._value;
  if (v180->_venueWallVerticalStrokeMeshInfo._hasValue)
  {
    unint64_t v168 = *v167;
    if (*v167)
    {
      *(void *)v180->_anon_e88 = v168;
      operator delete(v168);
      *long long v167 = 0;
      *(void *)v180->_anon_e88 = 0;
      *(void *)&v180->_anon_e88[8] = 0;
    }
    *(_OWORD *)v180->_venueWallVerticalStrokeMeshInfo._value.data = v181;
    *(void *)&v180->_anon_e88[8] = *(void *)&v182[0];
    long long v181 = 0uLL;
    *(void *)&v182[0] = 0;
    unint64_t v169 = (void **)&v180->_anon_e88[16];
    uint64_t v170 = *(void *)&v180->_anon_e88[16];
    if (v170)
    {
      uint64_t v171 = *(void *)&v180->_anon_e88[24];
      int v172 = *(void **)&v180->_anon_e88[16];
      if (v171 != v170)
      {
        do
        {
          unint64_t v173 = *(std::__shared_weak_count **)(v171 - 8);
          if (v173 && !atomic_fetch_add(&v173->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v173->__on_zero_shared)(v173);
            std::__shared_weak_count::__release_weak(v173);
          }
          v171 -= 16;
        }
        while (v171 != v170);
        int v172 = *v169;
        unint64_t v13 = v180;
      }
      *(void *)&v180->_anon_e88[24] = v170;
      operator delete(v172);
      *unint64_t v169 = 0;
      *(void *)&v180->_anon_e88[24] = 0;
      *(void *)&v180->_anon_e88[32] = 0;
    }
    *(_OWORD *)&v180->_anon_e88[16] = *(_OWORD *)((char *)v182 + 8);
    *(void *)&v180->_anon_e88[32] = *((void *)&v182[1] + 1);
    memset((char *)v182 + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v180->_anon_e88[40], (uint64_t)&v183);
    ggl::BufferMemory::operator=((uint64_t *)&v180->_anon_e88[88], (uint64_t)&v187);
    *(_OWORD *)&v180->_anon_e88[136] = v191[0];
    uint64_t v175 = *(void *)&v191[1];
    *(void *)&v191[1] = 0;
    uint64_t v176 = *(void *)&v180->_anon_e88[152];
    *(void *)&v180->_anon_e88[152] = v175;
    if (v176) {
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v176);
    }
    long long v177 = *(_OWORD *)((char *)&v191[1] + 8);
    *((void *)&v191[1] + 1) = 0;
    *(void *)&v191[2] = 0;
    uint64_t v178 = *(std::__shared_weak_count **)&v180->_anon_e88[168];
    *(_OWORD *)&v180->_anon_e88[160] = v177;
    if (v178 && !atomic_fetch_add(&v178->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v178->__on_zero_shared)(v178);
      std::__shared_weak_count::__release_weak(v178);
    }
  }
  else
  {
    *long long v167 = 0;
    *(void *)v180->_anon_e88 = 0;
    *(void *)&v180->_anon_e88[8] = 0;
    *(_OWORD *)v180->_venueWallVerticalStrokeMeshInfo._value.data = v181;
    *(void *)&v180->_anon_e88[8] = *(void *)&v182[0];
    long long v181 = 0uLL;
    *(void *)&v182[0] = 0;
    *(void *)&v180->_anon_e88[16] = 0;
    *(void *)&v180->_anon_e88[24] = 0;
    *(void *)&v180->_anon_e88[32] = 0;
    *(_OWORD *)&v180->_anon_e88[16] = *(_OWORD *)((char *)v182 + 8);
    *(void *)&v180->_anon_e88[32] = *((void *)&v182[1] + 1);
    memset((char *)v182 + 8, 0, 24);
    *(_OWORD *)&v180->_anon_e88[40] = v183;
    *(_OWORD *)&v180->_anon_e88[56] = v184;
    *(_WORD *)&v180->_anon_e88[72] = v185;
    *(void *)&v180->_anon_e88[80] = v186;
    uint64_t v186 = 0;
    long long v183 = 0uLL;
    *(_OWORD *)&v180->_anon_e88[88] = v187;
    *(_OWORD *)&v180->_anon_e88[104] = v188;
    *(_WORD *)&v180->_anon_e88[120] = v189;
    *(void *)&v180->_anon_e88[128] = v190;
    uint64_t v190 = 0;
    long long v187 = 0uLL;
    *(_OWORD *)&v180->_anon_e88[136] = v191[0];
    long long v174 = v191[1];
    *(void *)&v191[1] = 0;
    *(_OWORD *)&v180->_anon_e88[152] = v174;
    *(void *)&v180->_anon_e88[168] = *(void *)&v191[2];
    *((void *)&v191[1] + 1) = 0;
    *(void *)&v191[2] = 0;
    v180->_venueWallVerticalStrokeMeshInfo._hasValue = 1;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&v181);
  return v13;
}

@end