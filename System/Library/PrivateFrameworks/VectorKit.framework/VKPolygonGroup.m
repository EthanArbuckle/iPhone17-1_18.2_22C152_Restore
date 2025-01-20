@interface VKPolygonGroup
- (BOOL)addFillForSection:(const void *)a3 precision:(unsigned __int8)a4 styleIndex:(unsigned int)a5 cullingMask:(unsigned int)a6 accessor:(ResourceAccessor *)a7 triangulator:(void *)a8;
- (FeatureAttributeSet)styleAttributes;
- (VKPolygonGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6;
- (VKPolygonGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6 storage:(shared_ptr<md::MeshSetStorage>)a7;
- (__n128)addFillForSection:precision:styleIndex:cullingMask:accessor:triangulator:;
- (char)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:;
- (id).cxx_construct;
- (id)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:;
- (shared_ptr<ggl::Texture2D>)_textureForName:(const void *)a3 textureManager:(void *)a4;
- (uint64_t)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:;
- (unsigned)createStrokePointStyleList:(void *)a3 section:(unint64_t)a4 outPointStyles:(void *)a5 withRounder:(PolygonRound *)a6;
- (unsigned)initialStyleIndexForSection:(const void *)a3 attributes:(const void *)a4 styles:(const void *)a5;
- (unsigned)styleIndexForAttributes:(const void *)a3 edgePair:(const GeoCodecsFeatureStylePair *)a4;
- (void)addFillForSection:precision:styleIndex:cullingMask:accessor:triangulator:;
- (void)addPolygon:(void *)a3 accessor:(ResourceAccessor *)a4 triangulator:(void *)a5 withRounder:(PolygonRound *)a6;
- (void)addStrokeForSection:(const void *)a3 paddedCount:(unsigned int)a4 key:(pair<const void *) attributes:(unsigned long>)a5 styles:(const void *)a6 cullingMask:(void *)a7 accessor:(unsigned int)a8;
- (void)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:;
- (void)didFinishAddingData;
- (void)enclosePointsInBoundingBox:(const void *)a3 count:(unint64_t)a4;
- (void)prepareForPolygon:(void *)a3 withRounder:(PolygonRound *)a4;
- (void)prepareToFillSection:(const void *)a3;
- (void)prepareToStrokeSection:(const void *)a3 key:(const void *)a4 styles:(void *)a5 paddedCount:(unsigned int)a6;
- (void)setNeedsTextureUpdate;
- (void)sourceRoofTexture;
- (void)sourceTexture;
- (void)strokeMeshes;
- (void)targetRoofTexture;
- (void)targetTexture;
- (void)updateTextures:(unsigned __int8)a3 textureManager:(void *)a4;
- (void)updateTexturesIfNecessary:(float)a3 textureManager:(void *)a4;
- (void)willAddDataWithAccessor:(ResourceAccessor *)a3;
@end

@implementation VKPolygonGroup

- (id).cxx_construct
{
  *((unsigned char *)self + 2840) = 0;
  *((void *)self + 380) = 0;
  *((void *)self + 381) = 0;
  *((void *)self + 379) = 0;
  *((void *)self + 382) = 0;
  *((void *)self + 383) = 0;
  *((void *)self + 384) = 0;
  *((void *)self + 385) = 0;
  *((void *)self + 386) = 0;
  *((void *)self + 387) = 0;
  *((void *)self + 388) = 0;
  *((void *)self + 389) = 0;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_targetRoofTexture.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  }
  v4 = self->_sourceRoofTexture.__cntrl_;
  if (v4 && !atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v4 + 16))(v4, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
  v5 = self->_targetTexture.__cntrl_;
  if (v5 && !atomic_fetch_add((atomic_ullong *volatile)v5 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v5 + 16))(v5, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v5);
  }
  v6 = self->_sourceTexture.__cntrl_;
  if (v6 && !atomic_fetch_add((atomic_ullong *volatile)v6 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v6 + 16))(v6, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v6);
  }
  begin = (char *)self->_strokeMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_strokeMeshes.__end_;
    v9 = self->_strokeMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        v10 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *, SEL))v10->__on_zero_shared)(v10, a2);
          std::__shared_weak_count::__release_weak(v10);
        }
        end -= 16;
      }
      while (end != begin);
      v9 = self->_strokeMeshes.__begin_;
    }
    self->_strokeMeshes.__end_ = begin;
    operator delete(v9);
  }
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  if (p_strokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_strokeMeshInfo->_value);
    p_strokeMeshInfo->_hasValue = 0;
  }
}

- (void)updateTextures:(unsigned __int8)a3 textureManager:(void *)a4
{
  unsigned int v5 = a3;
  [(VKPolygonalItemGroup *)self updateCachedStyles];
  LOWORD(__p.__r_.__value_.__l.__data_) = 0;
  v7 = [(VKPolygonalItemGroup *)self styleQueries:&__p];
  uint64_t v8 = **v7;
  v9 = (std::__shared_weak_count *)(*v7)[1];
  v37.__r_.__value_.__r.__words[0] = v8;
  v37.__r_.__value_.__l.__size_ = (std::string::size_type)v9;
  if (v9) {
    atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  gss::QueryableLocker<gss::PropertyID>::QueryableLocker(v38, v8, (uint64_t)v9);
  if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
    std::__shared_weak_count::__release_weak(v9);
    if (v39)
    {
LABEL_6:
      if (v5 >= 0x17) {
        unsigned int v10 = 23;
      }
      else {
        unsigned int v10 = v5;
      }
      gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&v37, *(void *)(v38[0] + 24), 0x88u, v10, 2);
      std::string::size_type size = HIBYTE(v37.__r_.__value_.__r.__words[2]);
      if ((v37.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type size = v37.__r_.__value_.__l.__size_;
      }
      if (size)
      {
        [(VKPolygonGroup *)self _textureForName:&v37 textureManager:a4];
        shared_ptr<ggl::Texture2D> v12 = *(shared_ptr<ggl::Texture2D> *)&__p.__r_.__value_.__l.__data_;
      }
      else
      {
        shared_ptr<ggl::Texture2D> v12 = (shared_ptr<ggl::Texture2D>)0;
      }
      *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
      cntrl = self->_sourceTexture.__cntrl_;
      self->_sourceTexture = v12;
      if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(__shared_weak_count *))(*(void *)cntrl + 16))(cntrl);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
      }
      v18 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
      if (__p.__r_.__value_.__l.__size_
        && !atomic_fetch_add((atomic_ullong *volatile)(__p.__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
      }
      unint64_t v19 = *(void *)(v38[0] + 24);
      unsigned int v20 = *(unsigned __int8 *)(v19 + 12);
      if (v20 == 2)
      {
        if (gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(void *)(v38[0] + 24), 0x88u, v10, 0)) {
          goto LABEL_37;
        }
        unsigned int v20 = 1;
      }
      if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v19, 0x88u, v10, v20))
      {
        v23 = self->_targetTexture.__cntrl_;
        self->_targetTexture.__ptr_ = 0;
        self->_targetTexture.__cntrl_ = 0;
        if (v23 && !atomic_fetch_add((atomic_ullong *volatile)v23 + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          (*(void (**)(__shared_weak_count *))(*(void *)v23 + 16))(v23);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v23);
        }
        goto LABEL_52;
      }
LABEL_37:
      gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&__p, v19, 0x88u, v10, 1);
      std::string::size_type v21 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v21 = __p.__r_.__value_.__l.__size_;
      }
      if (v21)
      {
        [(VKPolygonGroup *)self _textureForName:&__p textureManager:a4];
        shared_ptr<ggl::Texture2D> v22 = *(shared_ptr<ggl::Texture2D> *)&v35.__r_.__value_.__l.__data_;
      }
      else
      {
        shared_ptr<ggl::Texture2D> v22 = (shared_ptr<ggl::Texture2D>)0;
      }
      *(_OWORD *)&v35.__r_.__value_.__l.__data_ = 0uLL;
      v24 = self->_targetTexture.__cntrl_;
      self->_targetTexture = v22;
      if (v24 && !atomic_fetch_add((atomic_ullong *volatile)v24 + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(__shared_weak_count *))(*(void *)v24 + 16))(v24);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v24);
      }
      if (!v35.__r_.__value_.__l.__size_
        || atomic_fetch_add((atomic_ullong *volatile)(v35.__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_52;
        }
        goto LABEL_51;
      }
      (*(void (**)(std::string::size_type))(*(void *)v35.__r_.__value_.__l.__size_ + 16))(v35.__r_.__value_.__l.__size_);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v35.__r_.__value_.__l.__size_);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
LABEL_51:
      }
        operator delete(__p.__r_.__value_.__l.__data_);
LABEL_52:
      gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&__p, *(void *)(v38[0] + 24), 0x14Du, v10, 2);
      std::string::size_type v25 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v25 = __p.__r_.__value_.__l.__size_;
      }
      if (v25)
      {
        [(VKPolygonGroup *)self _textureForName:&__p textureManager:a4];
        shared_ptr<ggl::Texture2D> v26 = *(shared_ptr<ggl::Texture2D> *)&v35.__r_.__value_.__l.__data_;
      }
      else
      {
        shared_ptr<ggl::Texture2D> v26 = (shared_ptr<ggl::Texture2D>)0;
      }
      *(_OWORD *)&v35.__r_.__value_.__l.__data_ = 0uLL;
      v27 = self->_sourceRoofTexture.__cntrl_;
      self->_sourceRoofTexture = v26;
      if (v27 && !atomic_fetch_add((atomic_ullong *volatile)v27 + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(__shared_weak_count *))(*(void *)v27 + 16))(v27);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v27);
      }
      if (v35.__r_.__value_.__l.__size_
        && !atomic_fetch_add((atomic_ullong *volatile)(v35.__r_.__value_.__l.__size_ + 8), 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(std::string::size_type))(*(void *)v35.__r_.__value_.__l.__size_ + 16))(v35.__r_.__value_.__l.__size_);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v35.__r_.__value_.__l.__size_);
      }
      unint64_t v28 = *(void *)(v38[0] + 24);
      unsigned int v29 = *(unsigned __int8 *)(v28 + 12);
      if (v29 == 2)
      {
        if (gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(void *)(v38[0] + 24), 0x14Du, v10, 0)) {
          goto LABEL_67;
        }
        unsigned int v29 = 1;
      }
      if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v28, 0x14Du, v10, v29))
      {
        v32 = self->_targetRoofTexture.__cntrl_;
        self->_targetRoofTexture.__ptr_ = 0;
        self->_targetRoofTexture.__cntrl_ = 0;
        if (v32 && !atomic_fetch_add((atomic_ullong *volatile)v32 + 1, 0xFFFFFFFFFFFFFFFFLL))
        {
          (*(void (**)(__shared_weak_count *))(*(void *)v32 + 16))(v32);
          std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v32);
          if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_81;
          }
          goto LABEL_86;
        }
        goto LABEL_80;
      }
LABEL_67:
      gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&v35, v28, 0x14Du, v10, 1);
      std::string::size_type v30 = HIBYTE(v35.__r_.__value_.__r.__words[2]);
      if ((v35.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
        std::string::size_type v30 = v35.__r_.__value_.__l.__size_;
      }
      if (v30)
      {
        [(VKPolygonGroup *)self _textureForName:&v35 textureManager:a4];
        shared_ptr<ggl::Texture2D> v31 = v34;
      }
      else
      {
        shared_ptr<ggl::Texture2D> v31 = (shared_ptr<ggl::Texture2D>)0;
      }
      v33 = self->_targetRoofTexture.__cntrl_;
      self->_targetRoofTexture = v31;
      if (v33 && !atomic_fetch_add((atomic_ullong *volatile)v33 + 1, 0xFFFFFFFFFFFFFFFFLL))
      {
        (*(void (**)(__shared_weak_count *))(*(void *)v33 + 16))(v33);
        std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v33);
      }
      if (SHIBYTE(v35.__r_.__value_.__r.__words[2]) < 0)
      {
        operator delete(v35.__r_.__value_.__l.__data_);
        if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
        {
LABEL_81:
          if ((SHIBYTE(v37.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
            goto LABEL_82;
          }
LABEL_87:
          operator delete(v37.__r_.__value_.__l.__data_);
          goto LABEL_82;
        }
LABEL_86:
        operator delete(__p.__r_.__value_.__l.__data_);
        if ((SHIBYTE(v37.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
          goto LABEL_82;
        }
        goto LABEL_87;
      }
LABEL_80:
      if ((SHIBYTE(__p.__r_.__value_.__r.__words[2]) & 0x80000000) == 0) {
        goto LABEL_81;
      }
      goto LABEL_86;
    }
  }
  else if (v39)
  {
    goto LABEL_6;
  }
  v13 = self->_sourceTexture.__cntrl_;
  self->_sourceTexture.__ptr_ = 0;
  self->_sourceTexture.__cntrl_ = 0;
  if (v13 && !atomic_fetch_add((atomic_ullong *volatile)v13 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v13 + 16))(v13);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v13);
  }
  v14 = self->_targetTexture.__cntrl_;
  self->_targetTexture.__ptr_ = 0;
  self->_targetTexture.__cntrl_ = 0;
  if (v14 && !atomic_fetch_add((atomic_ullong *volatile)v14 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v14 + 16))(v14);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v14);
  }
  v15 = self->_sourceRoofTexture.__cntrl_;
  self->_sourceRoofTexture.__ptr_ = 0;
  self->_sourceRoofTexture.__cntrl_ = 0;
  if (v15 && !atomic_fetch_add((atomic_ullong *volatile)v15 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v15 + 16))(v15);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v15);
  }
  v16 = self->_targetRoofTexture.__cntrl_;
  self->_targetRoofTexture.__ptr_ = 0;
  self->_targetRoofTexture.__cntrl_ = 0;
  if (v16 && !atomic_fetch_add((atomic_ullong *volatile)v16 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v16 + 16))(v16);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v16);
  }
LABEL_82:
  self->_lastResolvedZoom = v5;
  gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)v38);
}

- (void)addStrokeForSection:(const void *)a3 paddedCount:(unsigned int)a4 key:(pair<const void *) attributes:(unsigned long>)a5 styles:(const void *)a6 cullingMask:(void *)a7 accessor:(unsigned int)a8
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  pair<const void *, unsigned long> v57 = a5;
  v14 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long> const&>,std::tuple<>>((uint64_t)&self->super._polygonEdges, (unint64_t)a5.var0, a5.var1, &v57);
  uint64_t v15 = v14[4];
  uint64_t v16 = v14[5];
  v17 = v14 + 4;
  uint64_t v18 = v16 - v15;
  if (v16 != v15)
  {
    unint64_t v19 = self;
    unsigned int v20 = operator new(0x38uLL);
    *unsigned int v20 = &unk_1EF56CCA8;
    v20[1] = a3;
    v20[2] = a6;
    v20[3] = a7;
    v20[4] = v19;
    v20[5] = v17;
    *((_DWORD *)v20 + 12) = a8;
    v65 = v20;
    if (a4 < 0x8000)
    {
      p_strokeMeshInfo = &v19->_strokeMeshInfo;
      unint64_t v24 = 0x924924924924924ALL * (v18 >> 3);
      unint64_t v25 = 2 * a4;
      unsigned int v26 = *(unsigned __int16 *)&v19->_anon_b28[138];
      if (v25 > (unsigned __int16)~(_WORD)v26)
      {
        unsigned __int8 v27 = v19->_anon_b28[136] + 1;
        v19->_anon_b28[136] = v27;
        *(_WORD *)&v19->_anon_b28[138] = 0;
        *(_DWORD *)&v19->_anon_b28[140] = 0;
        uint64_t v28 = **(void **)(*(void *)(*(void *)&v19->_anon_b28[16] + 16 * v27) + 64);
        uint64_t v29 = *(unsigned __int16 *)(*(void *)&v19->_strokeMeshInfo._value.type + 8 * v27);
        memset(buf, 0, sizeof(buf));
        uint64_t v30 = *(void *)(v28 + 8) * v29;
        v21.n128_u64[0] = (unint64_t)a9;
        *(void *)&long long v31 = a9;
        *((void *)&v31 + 1) = v28;
        __n128 v55 = v21;
        if (v30)
        {
          if (a9 && *(unsigned char *)(v28 + 17) != 2)
          {
            long long v54 = v31;
            uint64_t v32 = (*((uint64_t (**)(ResourceAccessor *))a9->var0 + 7))(a9);
            long long v31 = v54;
          }
          else
          {
            uint64_t v32 = *(void *)(v28 + 72);
          }
        }
        else
        {
          uint64_t v32 = 0;
        }
        *(_OWORD *)buf = v31;
        unint64_t v60 = 0;
        unint64_t v61 = v30;
        uint64_t v63 = v32;
        __int16 v62 = 257;
        ggl::BufferMemory::operator=((uint64_t *)&v19->_anon_b28[40], (uint64_t)buf);
        *(void *)&long long v33 = v55.n128_u64[0];
        if (v63)
        {
          unint64_t v35 = v60;
          unint64_t v34 = v61;
          if (v61 != v60)
          {
            v36 = *(void **)&buf[8];
            int v37 = v62;
            int v38 = HIBYTE(v62);
            if (*(void *)buf && *(unsigned char *)(*(void *)&buf[8] + 17) != 2)
            {
              (*(void (**)(__n128))(**(void **)buf + 64))(v55);
              *(void *)&long long v33 = v55.n128_u64[0];
            }
            if (v37 && !v38)
            {
              unint64_t v40 = v36[7];
              unint64_t v39 = v36[8];
              if (v39 == v40) {
                unint64_t v40 = v36[10] - v36[9];
              }
              if (v35 < v40) {
                unint64_t v40 = v35;
              }
              if (v39 <= v34) {
                unint64_t v39 = v34;
              }
              if (v39 == v40) {
                unint64_t v39 = v40 + v36[10] - v36[9];
              }
              v36[7] = v40;
              v36[8] = v39;
            }
          }
        }
        uint64_t v41 = p_strokeMeshInfo[9]._value.data[0];
        uint64_t v42 = *(void *)(*(void *)(*(void *)&p_strokeMeshInfo[2]._hasValue + 16 * v41) + 96);
        uint64_t v43 = *(unsigned int *)(*(void *)&p_strokeMeshInfo->_value.type + 8 * v41 + 4);
        memset(buf, 0, sizeof(buf));
        uint64_t v44 = *(void *)(v42 + 8) * v43;
        *((void *)&v33 + 1) = v42;
        if (v44)
        {
          if (a9 && *(unsigned char *)(v42 + 17) != 2)
          {
            long long v56 = v33;
            uint64_t v45 = (*((uint64_t (**)(ResourceAccessor *))a9->var0 + 7))(a9);
            long long v33 = v56;
          }
          else
          {
            uint64_t v45 = *(void *)(v42 + 72);
          }
        }
        else
        {
          uint64_t v45 = 0;
        }
        *(_OWORD *)buf = v33;
        unint64_t v60 = 0;
        unint64_t v61 = v44;
        uint64_t v63 = v45;
        __int16 v62 = 257;
        ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[6]._value, (uint64_t)buf);
        if (v63)
        {
          unint64_t v47 = v60;
          unint64_t v46 = v61;
          if (v61 != v60)
          {
            v48 = *(void **)&buf[8];
            int v49 = v62;
            int v50 = HIBYTE(v62);
            if (*(void *)buf && *(unsigned char *)(*(void *)&buf[8] + 17) != 2) {
              (*(void (**)(void))(**(void **)buf + 64))();
            }
            if (v49 && !v50)
            {
              unint64_t v52 = v48[7];
              unint64_t v51 = v48[8];
              if (v51 == v52) {
                unint64_t v52 = v48[10] - v48[9];
              }
              if (v47 < v52) {
                unint64_t v52 = v47;
              }
              if (v51 <= v46) {
                unint64_t v51 = v46;
              }
              if (v51 == v52) {
                unint64_t v51 = v52 + v48[10] - v48[9];
              }
              v48[7] = v52;
              v48[8] = v51;
            }
          }
        }
        unsigned int v26 = WORD1(p_strokeMeshInfo[9]._value.type);
        unsigned int v20 = v65;
      }
      *(void *)buf = v26;
      *(void *)&buf[8] = v25 + v26;
      unint64_t v53 = v24 + HIDWORD(p_strokeMeshInfo[9]._value.type);
      v58[0] = HIDWORD(p_strokeMeshInfo[9]._value.type);
      v58[1] = v53;
      if (!v20)
      {
        std::__throw_bad_function_call[abi:nn180100]();
        __break(1u);
        return;
      }
      (*(void (**)(void *, uint8_t *, void *, ValueUnion *, ValueUnion *))(*v20 + 48))(v20, buf, v58, &p_strokeMeshInfo[3]._value, &p_strokeMeshInfo[6]._value);
      WORD1(p_strokeMeshInfo[9]._value.type) += v25;
      HIDWORD(p_strokeMeshInfo[9]._value.type) += v24;
    }
    else
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
      }
      shared_ptr<ggl::Texture2D> v22 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1780000, v22, OS_LOG_TYPE_ERROR, "MeshSet: Cannot write points for polygons: polygon is too big", buf, 2u);
      }
    }
    if (v65 == v64)
    {
      (*(void (**)(void *))(v64[0] + 32))(v64);
    }
    else if (v65)
    {
      (*(void (**)(void))(*v65 + 40))();
    }
  }
}

- (void)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:
{
  JUMPOUT(0x1A6239270);
}

- (id)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:
{
  *(void *)a2 = &unk_1EF56CCA8;
  long long v4 = *(_OWORD *)(a1 + 8);
  *(void *)(a2 + 24) = *(void *)(a1 + 24);
  *(_OWORD *)(a2 + 8) = v4;
  id result = *(id *)(a1 + 32);
  *(void *)(a2 + 32) = result;
  int v6 = *(_DWORD *)(a1 + 48);
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  *(_DWORD *)(a2 + 48) = v6;
  return result;
}

- (char)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:
{
  v2 = (char *)operator new(0x38uLL);
  *(void *)v2 = &unk_1EF56CCA8;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  v3 = *(void **)(a1 + 32);
  *((void *)v2 + 3) = *(void *)(a1 + 24);
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 40);
  *((void *)v2 + 4) = v4;
  *((void *)v2 + 5) = v5;
  *((_DWORD *)v2 + 12) = *(_DWORD *)(a1 + 48);
  return v2;
}

- (uint64_t)addStrokeForSection:paddedCount:key:attributes:styles:cullingMask:accessor:
{
  return a1;
}

- (unsigned)initialStyleIndexForSection:(const void *)a3 attributes:(const void *)a4 styles:(const void *)a5
{
  uint64_t v5 = *((void *)a5 + 1);
  while (v5 != *(void *)a5)
  {
    int v6 = *(unsigned __int8 *)(v5 - 12);
    v5 -= 12;
    if (v6)
    {
      uint64_t v8 = *(void *)(v5 + 4);
      return [(VKPolygonGroup *)self styleIndexForAttributes:a4 edgePair:&v8];
    }
  }
  return [(VKPolygonalItemGroup *)self indexForGeoFeatureAttributes:a4];
}

- (unsigned)styleIndexForAttributes:(const void *)a3 edgePair:(const GeoCodecsFeatureStylePair *)a4
{
  geo::codec::copyFeatureStyleAttributes((uint64_t *)a3, &v22);
  uint64_t v6 = v22;
  uint64_t v7 = *(unsigned __int8 *)(v22 + 33);
  uint64_t v8 = *(int **)v22;
  if (*(unsigned char *)(v22 + 33))
  {
    unsigned int var0 = a4->var0;
    if (v7 >= 0x20)
    {
      uint64_t v10 = 0;
      v14 = *(int **)v22;
      while (1)
      {
        int v15 = *v14;
        v14 += 2;
        if (v15 == var0) {
          break;
        }
        if (v7 == ++v10) {
          goto LABEL_12;
        }
      }
    }
    else
    {
      uint64_t v10 = 0;
      v11 = *(int **)v22;
      while (1)
      {
        int v12 = *v11;
        v11 += 2;
        if (v12 == var0) {
          break;
        }
        if (v7 == ++v10) {
          goto LABEL_6;
        }
      }
    }
    v8[2 * v10 + 1] = a4->var1;
  }
  else
  {
LABEL_6:
    *(GeoCodecsFeatureStylePair *)&v8[2 * v7] = *a4;
    unsigned __int8 v13 = *(unsigned char *)(v6 + 33) + 1;
    *(unsigned char *)(v6 + 33) = v13;
    qsort(*(void **)v6, v13, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
    uint64_t v6 = v22;
  }
LABEL_12:
  uint64_t v20 = v6;
  __n128 v21 = v23;
  if (v23) {
    atomic_fetch_add_explicit(&v23->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  unsigned __int8 v16 = [(VKPolygonalItemGroup *)self indexForGeoFeatureAttributes:&v20];
  v17 = v21;
  if (v21 && !atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
    std::__shared_weak_count::__release_weak(v17);
  }
  uint64_t v18 = v23;
  if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  return v16;
}

- (BOOL)addFillForSection:(const void *)a3 precision:(unsigned __int8)a4 styleIndex:(unsigned int)a5 cullingMask:(unsigned int)a6 accessor:(ResourceAccessor *)a7 triangulator:(void *)a8
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v31 = self;
  unsigned int v29 = a6;
  unsigned int v30 = a5;
  md::Triangulator<float>::triangulate((uint64_t)a8, *((void *)a3 + 1), *((void *)a3 + 11), v8, v9, v10, v11, v12, v13);
  uint64_t v19 = *((void *)a8 + 11);
  uint64_t v18 = *((void *)a8 + 12);
  if (v18 != v19)
  {
    [(VKPolygonalItemGroup *)self size];
    v28[0] = v20;
    v28[1] = v21;
    uint64_t v27 = *(void *)self->super._boundingBox._minimum._e;
    unint64_t v22 = *((void *)a3 + 11);
    uint64_t v23 = (uint64_t)(*((void *)a8 + 12) - *((void *)a8 + 11)) >> 1;
    unint64_t v24 = operator new(0x40uLL);
    void *v24 = &unk_1EF56CC60;
    v24[1] = a3;
    v24[2] = &v27;
    v24[3] = v28;
    v24[4] = &v30;
    v24[5] = a8;
    v24[6] = &v31;
    v24[7] = &v29;
    long long v33 = v24;
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::writePoints((uint64_t)&self->super._fillMeshInfo._value, v22, v23, (unint64_t)a7, (uint64_t)v32, v25);
    if (v33 == v32)
    {
      (*(void (**)(void *))(v32[0] + 32))(v32);
    }
    else if (v33)
    {
      (*(void (**)(void))(*v33 + 40))();
    }
  }
  return v18 != v19;
}

- (void)addFillForSection:precision:styleIndex:cullingMask:accessor:triangulator:
{
}

- (__n128)addFillForSection:precision:styleIndex:cullingMask:accessor:triangulator:
{
  v2 = (char *)operator new(0x40uLL);
  *(void *)v2 = &unk_1EF56CC60;
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 8);
  *(_OWORD *)(v2 + 24) = *(_OWORD *)(a1 + 24);
  __n128 result = *(__n128 *)(a1 + 40);
  *(__n128 *)(v2 + 40) = result;
  *((void *)v2 + 7) = *(void *)(a1 + 56);
  return result;
}

- (void)addPolygon:(void *)a3 accessor:(ResourceAccessor *)a4 triangulator:(void *)a5 withRounder:(PolygonRound *)a6
{
  uint64_t v9 = *((unsigned int *)a3 + 25);
  unint64_t v21 = 0;
  StrokeSpecifications = geo::codec::polygonFeatureGetStrokeSpecifications(a3, (uint64_t *)&v21);
  -[VKPolygonalItemGroup indexForGeoFeatureAttributes:](self, "indexForGeoFeatureAttributes:");
  if (v9)
  {
    unint64_t v11 = 0;
    unint64_t v12 = 0;
    unsigned __int8 v16 = StrokeSpecifications + 4;
    do
    {
      if (v11 < v21)
      {
        float32x4_t v13 = (unsigned int *)&v16[16 * v11];
        while (1)
        {
          unsigned int v14 = *v13;
          v13 += 4;
          if (v14 >= v12) {
            break;
          }
          if (v21 == ++v11)
          {
            unint64_t v11 = v21;
            break;
          }
        }
      }
      unint64_t v20 = 0;
      int v15 = (float *)geo::codec::multiSectionFeaturePoints(a3, v12, &v20);
      std::string __p = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      [(VKPolygonGroup *)self createStrokePointStyleList:a3 section:v12 outPointStyles:&__p withRounder:a6];
      if (geo::codec::multiSectionFeaturePrecision((uint64_t)a3) <= 0x10 && v20 >= 3)
      {
        self->super._cullingMask |= ggl::CullingGrid::intersectedCellsForRibbon(v20, v15, 1);
        if (a6) {
          operator new();
        }
        operator new();
      }
      if (__p)
      {
        uint64_t v18 = __p;
        operator delete(__p);
      }
      ++v12;
    }
    while (v12 != v9);
  }
}

- (void)didFinishAddingData
{
  v26.receiver = self;
  v26.super_class = (Class)VKPolygonGroup;
  [(VKPolygonalItemGroup *)&v26 didFinishAddingData];
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  uint64_t v4 = *(void *)&self->_anon_b28[160];
  if (v4 && *(void *)v4 == *(void *)&self->_anon_b28[144]) {
    *(unsigned char *)(v4 + 80) = 1;
  }
  uint64_t v5 = *(md::MeshSetStorage **)&self->_anon_b28[152];
  if (v5) {
    md::MeshSetStorage::finalize(v5);
  }
  uint64_t v33 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_b28[40], (uint64_t)&v27);
  if (v33)
  {
    unint64_t v7 = v29;
    unint64_t v6 = v30;
    if (v30 != v29)
    {
      float32x4_t v8 = (void *)v28;
      int v9 = v31;
      int v10 = v32;
      if (v27 && *(unsigned char *)(v28 + 17) != 2) {
        (*(void (**)(void))(*(void *)v27 + 64))();
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
  uint64_t v33 = 0;
  uint64_t v27 = 0;
  uint64_t v28 = 0;
  ggl::BufferMemory::operator=((uint64_t *)&self->_anon_b28[88], (uint64_t)&v27);
  if (v33)
  {
    unint64_t v14 = v29;
    unint64_t v13 = v30;
    if (v30 != v29)
    {
      int v15 = (void *)v28;
      int v16 = v31;
      int v17 = v32;
      if (v27 && *(unsigned char *)(v28 + 17) != 2) {
        (*(void (**)(void))(*(void *)v27 + 64))();
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
  unint64_t v20 = &self->_anon_b28[16];
  p_strokeMeshes = &self->_strokeMeshes;
  begin = (char *)self->_strokeMeshes.__begin_;
  if (begin)
  {
    end = (char *)self->_strokeMeshes.__end_;
    unint64_t v24 = self->_strokeMeshes.__begin_;
    if (end != begin)
    {
      do
      {
        __n128 v25 = (std::__shared_weak_count *)*((void *)end - 1);
        if (v25 && !atomic_fetch_add(&v25->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
          std::__shared_weak_count::__release_weak(v25);
        }
        end -= 16;
      }
      while (end != begin);
      unint64_t v24 = p_strokeMeshes->__begin_;
    }
    p_strokeMeshes->__end_ = begin;
    operator delete(v24);
    p_strokeMeshes->__begin_ = 0;
    p_strokeMeshes->__end_ = 0;
    p_strokeMeshes->__end_cap_.__value_ = 0;
  }
  *(optional<md::MeshSet<ggl::PolygonCommonStroke::MeshMesh, ggl::PolygonCommonStroke::DefaultVbo>> *)&p_strokeMeshes->__begin_ = p_strokeMeshInfo[2];
  p_strokeMeshes->__end_cap_.__value_ = *(void **)&p_strokeMeshInfo[3]._hasValue;
  *(void *)unint64_t v20 = 0;
  p_strokeMeshInfo[2]._value.type = 0.0;
  *(void *)&p_strokeMeshInfo[3]._hasValue = 0;
  if (p_strokeMeshInfo->_hasValue)
  {
    md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)&p_strokeMeshInfo->_value);
    p_strokeMeshInfo->_hasValue = 0;
  }
}

- (void)willAddDataWithAccessor:(ResourceAccessor *)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  v73.receiver = self;
  v73.super_class = (Class)VKPolygonGroup;
  -[VKPolygonalItemGroup willAddDataWithAccessor:](&v73, sel_willAddDataWithAccessor_);
  p_strokeMeshInfo = &self->_strokeMeshInfo;
  unint64_t v7 = *(uint64_t **)&self->_anon_b28[152];
  if (v7) {
    md::MeshSetStorage::prepareStorage(v7, a3);
  }
  uint64_t v66 = a3;
  double type = self->_strokeMeshInfo._value.type;
  uint64_t v8 = *(void *)self->_anon_b28;
  if (*(void *)&type != v8)
  {
    v67 = &self->_strokeMeshInfo;
    int v10 = &qword_1EB32C000;
    while (1)
    {
      if (!**(_WORD **)&type || !*(_DWORD *)(*(void *)&type + 4)) {
        goto LABEL_6;
      }
      uint64_t v11 = *(void *)&p_strokeMeshInfo[10]._hasValue;
      if (*(unsigned char *)(v11 + 40)
        && (unint64_t v12 = *(void **)&p_strokeMeshInfo[11]._hasValue) != 0
        && *v12 == v11
        && (uint64_t v13 = v12[1] * (unsigned __int16)**(_WORD **)&type,
            uint64_t v14 = v12[8],
            uint64_t v15 = v12[4],
            v14 + v13 <= (unint64_t)(v12[5] - v15)))
      {
        *(void *)&long long v77 = v15 + v14;
        *((void *)&v77 + 1) = v15 + v14 + v13;
        v12[8] = v14 + v13;
        v74 = "Polygon Stroke Vertex Data";
        uint64_t v39 = v12[14];
        if (!v39)
        {
          std::__throw_bad_function_call[abi:nn180100]();
          _Unwind_Resume(v65);
        }
        (*(void (**)(long long *__return_ptr))(*(void *)v39 + 48))(&v76);
        uint64_t v11 = *(void *)&p_strokeMeshInfo[10]._hasValue;
      }
      else
      {
        long long v76 = 0uLL;
      }
      md::MeshSetStorage::buildSubIndexData(&v74, v11, *(void **)&p_strokeMeshInfo[11]._hasValue, (uint64_t)"Polygon Stroke Index Data", *(unsigned int *)(*(void *)&type + 4));
      long long v70 = v76;
      int v16 = (std::__shared_weak_count *)*((void *)&v76 + 1);
      if (*((void *)&v76 + 1)) {
        atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v76 + 1) + 8), 1uLL, memory_order_relaxed);
      }
      int v17 = (char *)operator new(0xA8uLL);
      *((void *)v17 + 1) = 0;
      *((void *)v17 + 2) = 0;
      *(void *)int v17 = &unk_1EF5882B8;
      unint64_t v18 = v75;
      v68 = v74;
      if (v75) {
        atomic_fetch_add_explicit(&v75->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      {
        {
          ggl::MeshTyped<ggl::PolygonCommonStroke::DefaultVbo>::attributesReflection(void)::r = (uint64_t)&ggl::PolygonCommonStroke::defaultVboReflection;
        }
        ggl::MeshTyped<ggl::PolygonCommonStroke::DefaultVbo>::typedReflection(void)::r = (uint64_t)&ggl::MeshTyped<ggl::PolygonCommonStroke::DefaultVbo>::attributesReflection(void)::r;
        unk_1EB32B680 = 1;
      }
      unint64_t v19 = v17 + 24;
      *((void *)v17 + 11) = 0;
      *((void *)v17 + 7) = 0;
      *((void *)v17 + 8) = 0;
      *((_DWORD *)v17 + 18) = 0;
      *((void *)v17 + 3) = &unk_1EF5606B0;
      *((void *)v17 + 4) = "Polygon Stroke Mesh";
      *((void *)v17 + 5) = &unk_1EF5606D0;
      *((void *)v17 + 6) = 0;
      *((void *)v17 + 10) = &ggl::MeshTyped<ggl::PolygonCommonStroke::DefaultVbo>::typedReflection(void)::r;
      *((void *)v17 + 12) = 0;
      *((void *)v17 + 13) = 0;
      {
        operator new();
      }
      uint64_t v20 = v10[287];
      *((void *)v17 + 18) = 0;
      *((void *)v17 + 15) = 0;
      *((void *)v17 + 16) = 0;
      *((void *)v17 + 14) = v20;
      {
        operator new();
      }
      *((void *)v17 + 19) = v10[287];
      *((void *)v17 + 20) = 0;
      *((void *)v17 + 17) = v17 + 144;
      *((void *)v17 + 3) = &unk_1EF562520;
      *((void *)v17 + 5) = &unk_1EF562540;
      long long v77 = v70;
      if (v16) {
        atomic_fetch_add_explicit(&v16->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      std::vector<std::shared_ptr<ggl::VertexData>,geo::StdAllocator<std::shared_ptr<ggl::VertexData>,ggl::Allocator>>::__assign_with_size[abi:nn180100]<std::shared_ptr<ggl::VertexData> const*,std::shared_ptr<ggl::VertexData> const*>((uint64_t)(v17 + 88), (uint64_t *)&v77, (uint64_t *)&v78, 1uLL);
      unint64_t v21 = (std::__shared_weak_count *)*((void *)&v77 + 1);
      if (*((void *)&v77 + 1))
      {
        if (!atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v77 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL)) {
          break;
        }
      }
      if (v18) {
        goto LABEL_26;
      }
LABEL_27:
      unint64_t v22 = (std::__shared_weak_count *)*((void *)v17 + 16);
      *((void *)v17 + 15) = v68;
      *((void *)v17 + 16) = v18;
      if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
      *unint64_t v19 = &unk_1EF55F400;
      *((void *)v17 + 5) = &unk_1EF55F420;
      if (v18 && !atomic_fetch_add(&v18->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
        std::__shared_weak_count::__release_weak(v18);
        p_strokeMeshInfo = v67;
        if (!v16) {
          goto LABEL_38;
        }
      }
      else
      {
        p_strokeMeshInfo = v67;
        if (!v16) {
          goto LABEL_38;
        }
      }
      if (!atomic_fetch_add(&v16->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v16->__on_zero_shared)(v16);
        std::__shared_weak_count::__release_weak(v16);
      }
LABEL_38:
      double v24 = p_strokeMeshInfo[2]._value.type;
      unint64_t v23 = *(void *)&p_strokeMeshInfo[3]._hasValue;
      if (*(void *)&v24 >= v23)
      {
        objc_super v26 = *(void **)&p_strokeMeshInfo[2]._hasValue;
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
          std::__throw_bad_array_new_length[abi:nn180100]();
        }
        unsigned __int8 v31 = (char *)operator new(16 * v30);
        v5.n128_u64[0] = (unint64_t)(v17 + 24);
        v5.n128_u64[1] = (unint64_t)v17;
        unsigned __int8 v32 = (__n128 *)&v31[16 * v27];
        uint64_t v33 = &v31[16 * v30];
        __n128 *v32 = v5;
        __n128 v25 = v32 + 1;
        if (*(void **)&v24 == v26)
        {
          *(void *)&p_strokeMeshInfo[2]._hasValue = v32;
          *(void *)&p_strokeMeshInfo[2]._value.double type = v25;
          *(void *)&p_strokeMeshInfo[3]._hasValue = v33;
        }
        else
        {
          do
          {
            __n128 v34 = *(__n128 *)(*(void *)&v24 - 16);
            *(void *)&v24 -= 16;
            v5.n128_u64[1] = v34.n128_u64[1];
            v32[-1] = v34;
            --v32;
            **(void **)&double v24 = 0;
            *(void *)(*(void *)&v24 + 8) = 0;
          }
          while (*(void **)&v24 != v26);
          double v24 = *(double *)&p_strokeMeshInfo[2]._hasValue;
          double v35 = p_strokeMeshInfo[2]._value.type;
          *(void *)&p_strokeMeshInfo[2]._hasValue = v32;
          *(void *)&p_strokeMeshInfo[2]._value.double type = v25;
          *(void *)&p_strokeMeshInfo[3]._hasValue = v33;
          while (*(void *)&v35 != *(void *)&v24)
          {
            v36 = *(std::__shared_weak_count **)(*(void *)&v35 - 8);
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
        **(void **)&double v24 = v19;
        *(void *)(*(void *)&v24 + 8) = v17;
        __n128 v25 = (__n128 *)(*(void *)&v24 + 16);
      }
      *(void *)&p_strokeMeshInfo[2]._value.double type = v25;
      int v37 = v75;
      if (v75 && !atomic_fetch_add(&v75->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
        int v38 = (std::__shared_weak_count *)*((void *)&v76 + 1);
        if (*((void *)&v76 + 1))
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
        int v38 = (std::__shared_weak_count *)*((void *)&v76 + 1);
        if (*((void *)&v76 + 1)) {
          goto LABEL_61;
        }
      }
      uint64_t v8 = *(void *)&p_strokeMeshInfo[1]._hasValue;
      int v10 = &qword_1EB32C000;
LABEL_6:
      *(void *)&type += 8;
      if (*(void *)&type == v8) {
        goto LABEL_76;
      }
    }
    ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
    std::__shared_weak_count::__release_weak(v21);
    if (!v18) {
      goto LABEL_27;
    }
LABEL_26:
    atomic_fetch_add_explicit(&v18->__shared_owners_, 1uLL, memory_order_relaxed);
    goto LABEL_27;
  }
LABEL_76:
  uint64_t v40 = *(void *)&p_strokeMeshInfo[2]._hasValue;
  if (v40 != *(void *)&p_strokeMeshInfo[2]._value.type)
  {
    uint64_t v41 = **(void **)(*(void *)v40 + 64);
    uint64_t v42 = **(unsigned __int16 **)&p_strokeMeshInfo->_value.type;
    long long v77 = 0uLL;
    uint64_t v43 = *(void *)(v41 + 8) * v42;
    v5.n128_u64[0] = (unint64_t)v66;
    *(void *)&long long v44 = v66;
    *((void *)&v44 + 1) = v41;
    __n128 v71 = v5;
    if (v43)
    {
      if (v66 && *(unsigned char *)(v41 + 17) != 2)
      {
        long long v69 = v44;
        uint64_t v45 = (*((uint64_t (**)(ResourceAccessor *))v66->var0 + 7))(v66);
        long long v44 = v69;
      }
      else
      {
        uint64_t v45 = *(void *)(v41 + 72);
      }
    }
    else
    {
      uint64_t v45 = 0;
    }
    long long v77 = v44;
    unint64_t v78 = 0;
    unint64_t v79 = v43;
    uint64_t v81 = v45;
    __int16 v80 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[3]._value, (uint64_t)&v77);
    *(void *)&long long v46 = v71.n128_u64[0];
    if (v81)
    {
      unint64_t v48 = v78;
      unint64_t v47 = v79;
      if (v79 != v78)
      {
        long long v49 = v77;
        int v50 = v80;
        int v51 = HIBYTE(v80);
        if ((void)v77 && *(unsigned char *)(*((void *)&v77 + 1) + 17) != 2)
        {
          (*(void (**)(__n128))(*(void *)v77 + 64))(v71);
          *(void *)&long long v46 = v71.n128_u64[0];
        }
        if (v50 && !v51)
        {
          unint64_t v53 = *(void *)(*((void *)&v49 + 1) + 56);
          unint64_t v52 = *(void *)(*((void *)&v49 + 1) + 64);
          if (v52 == v53) {
            unint64_t v53 = *(void *)(*((void *)&v49 + 1) + 80) - *(void *)(*((void *)&v49 + 1) + 72);
          }
          if (v48 < v53) {
            unint64_t v53 = v48;
          }
          if (v52 <= v47) {
            unint64_t v52 = v47;
          }
          if (v52 == v53) {
            unint64_t v52 = v53 + *(void *)(*((void *)&v49 + 1) + 80) - *(void *)(*((void *)&v49 + 1) + 72);
          }
          *(void *)(*((void *)&v49 + 1) + 56) = v53;
          *(void *)(*((void *)&v49 + 1) + 64) = v52;
        }
      }
    }
    uint64_t v54 = *(void *)(**(void **)&p_strokeMeshInfo[2]._hasValue + 96);
    uint64_t v55 = *(unsigned int *)(*(void *)&p_strokeMeshInfo->_value.type + 4);
    long long v77 = 0uLL;
    uint64_t v56 = *(void *)(v54 + 8) * v55;
    *((void *)&v46 + 1) = v54;
    if (v56)
    {
      if (v66 && *(unsigned char *)(v54 + 17) != 2)
      {
        long long v72 = v46;
        uint64_t v57 = (*((uint64_t (**)(ResourceAccessor *))v66->var0 + 7))(v66);
        long long v46 = v72;
      }
      else
      {
        uint64_t v57 = *(void *)(v54 + 72);
      }
    }
    else
    {
      uint64_t v57 = 0;
    }
    long long v77 = v46;
    unint64_t v78 = 0;
    unint64_t v79 = v56;
    uint64_t v81 = v57;
    __int16 v80 = 257;
    ggl::BufferMemory::operator=((uint64_t *)&p_strokeMeshInfo[6]._value, (uint64_t)&v77);
    if (v81)
    {
      unint64_t v59 = v78;
      unint64_t v58 = v79;
      if (v79 != v78)
      {
        long long v60 = v77;
        int v61 = v80;
        int v62 = HIBYTE(v80);
        if ((void)v77 && *(unsigned char *)(*((void *)&v77 + 1) + 17) != 2) {
          (*(void (**)(void))(*(void *)v77 + 64))();
        }
        if (v61 && !v62)
        {
          unint64_t v64 = *(void *)(*((void *)&v60 + 1) + 56);
          unint64_t v63 = *(void *)(*((void *)&v60 + 1) + 64);
          if (v63 == v64) {
            unint64_t v64 = *(void *)(*((void *)&v60 + 1) + 80) - *(void *)(*((void *)&v60 + 1) + 72);
          }
          if (v59 < v64) {
            unint64_t v64 = v59;
          }
          if (v63 <= v58) {
            unint64_t v63 = v58;
          }
          if (v63 == v64) {
            unint64_t v63 = v64 + *(void *)(*((void *)&v60 + 1) + 80) - *(void *)(*((void *)&v60 + 1) + 72);
          }
          *(void *)(*((void *)&v60 + 1) + 56) = v64;
          *(void *)(*((void *)&v60 + 1) + 64) = v63;
        }
      }
    }
  }
}

- (void)prepareToStrokeSection:(const void *)a3 key:(const void *)a4 styles:(void *)a5 paddedCount:(unsigned int)a6
{
  int v9 = std::__hash_table<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::__unordered_map_hasher<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::hash<std::pair<void const*,unsigned long>>,std::equal_to<std::pair<void const*,unsigned long>>,true>,std::__unordered_map_equal<std::pair<void const*,unsigned long>,std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>,std::equal_to<std::pair<void const*,unsigned long>>,std::hash<std::pair<void const*,unsigned long>>,true>,std::allocator<std::__hash_value_type<std::pair<void const*,unsigned long>,std::vector<md::Edge>>>>::__emplace_unique_key_args<std::pair<void const*,unsigned long>,std::piecewise_construct_t const&,std::tuple<std::pair<void const*,unsigned long> const&>,std::tuple<>>((uint64_t)&self->super._polygonEdges, *(void *)a4, *((void *)a4 + 1), a4);
  int v10 = a3;
  uint64_t v11 = v9;
  unint64_t v12 = *((void *)a3 + 11);
  uint64_t v13 = (unsigned char *)v9[4];
  unsigned int v85 = a6;
  v86 = v10;
  v83 = self;
  if (0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v9[6] - (void)v13) >> 3) < v12)
  {
    if (v12 > 0x492492492492492) {
      goto LABEL_71;
    }
    uint64_t v14 = (unsigned char *)v9[5];
    uint64_t v15 = (char *)operator new(56 * v12);
    int v16 = &v15[56 * ((v14 - v13) / 56)];
    int v17 = v16;
    if (v14 != v13)
    {
      unint64_t v18 = &v15[56 * ((v14 - v13) / 56)];
      do
      {
        int v17 = v18 - 56;
        long long v19 = *(_OWORD *)(v14 - 56);
        long long v20 = *(_OWORD *)(v14 - 40);
        long long v21 = *(_OWORD *)(v14 - 24);
        *((void *)v18 - 1) = *((void *)v14 - 1);
        *(_OWORD *)(v18 - 24) = v21;
        *(_OWORD *)(v18 - 40) = v20;
        *(_OWORD *)(v18 - 56) = v19;
        v14 -= 56;
        v18 -= 56;
      }
      while (v14 != v13);
    }
    v11[4] = v17;
    v11[5] = v16;
    v11[6] = &v15[56 * v12];
    int v10 = v86;
    if (v13)
    {
      operator delete(v13);
      int v10 = v86;
      unint64_t v12 = v86[11];
    }
  }
  unint64_t v22 = a5;
  if (v12)
  {
    int v23 = 0;
    unint64_t v24 = 0;
    unint64_t v25 = a6;
    unint64_t v84 = a6;
    do
    {
      uint64_t v27 = *(unsigned __int8 *)(*v22 + 12 * v24) + (uint64_t)v23;
      if ((*(void *)(v10[8] + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v24))
      {
        unint64_t v26 = v24 + 1;
        int v23 = v27 + 1;
      }
      else
      {
        uint64_t v28 = v10[1];
        uint64_t v29 = (int *)(v28 + 8 * v24);
        int v31 = *v29;
        int v30 = v29[1];
        unint64_t v26 = v24 + 1;
        unsigned __int8 v32 = (int *)(v28 + 8 * ((v24 + 1) % v12));
        int v34 = *v32;
        int v33 = v32[1];
        int v23 = v27 + 1;
        uint64_t v35 = ((int)v27 + 1) % a6;
        unint64_t v36 = (v24 + 1) % v25;
        int v38 = (char *)v11[5];
        unint64_t v37 = v11[6];
        if ((unint64_t)v38 >= v37)
        {
          uint64_t v40 = (char *)v11[4];
          unint64_t v41 = 0x6DB6DB6DB6DB6DB7 * ((v38 - v40) >> 3) + 1;
          if (v41 > 0x492492492492492) {
            goto LABEL_71;
          }
          unint64_t v42 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v37 - (void)v40) >> 3);
          if (2 * v42 > v41) {
            unint64_t v41 = 2 * v42;
          }
          if (v42 >= 0x249249249249249) {
            unint64_t v43 = 0x492492492492492;
          }
          else {
            unint64_t v43 = v41;
          }
          if (v43 > 0x492492492492492) {
            goto LABEL_72;
          }
          uint64_t v88 = 56 * v43;
          long long v44 = (char *)operator new(56 * v43);
          uint64_t v45 = &v44[8 * ((v38 - v40) >> 3)];
          *(_DWORD *)uint64_t v45 = v31;
          *((_DWORD *)v45 + 1) = v30;
          *((_DWORD *)v45 + 2) = 0;
          *((_DWORD *)v45 + 3) = v34;
          *((_DWORD *)v45 + 4) = v33;
          *((_DWORD *)v45 + 5) = 0;
          *((void *)v45 + 3) = (int)v27;
          *((void *)v45 + 4) = v35;
          *((void *)v45 + 5) = v24;
          *((void *)v45 + 6) = v36;
          if (v38 == v40)
          {
            unint64_t v47 = &v44[8 * ((v38 - v40) >> 3)];
            a6 = v85;
          }
          else
          {
            long long v46 = &v44[8 * ((v38 - v40) >> 3)];
            a6 = v85;
            do
            {
              unint64_t v47 = v46 - 56;
              long long v48 = *(_OWORD *)(v38 - 56);
              long long v49 = *(_OWORD *)(v38 - 40);
              long long v50 = *(_OWORD *)(v38 - 24);
              *((void *)v46 - 1) = *((void *)v38 - 1);
              *(_OWORD *)(v46 - 24) = v50;
              *(_OWORD *)(v46 - 40) = v49;
              *(_OWORD *)(v46 - 56) = v48;
              v38 -= 56;
              v46 -= 56;
            }
            while (v38 != v40);
          }
          uint64_t v39 = v45 + 56;
          v11[4] = v47;
          v11[5] = v45 + 56;
          v11[6] = &v44[v88];
          if (v40) {
            operator delete(v40);
          }
          int v10 = v86;
          unint64_t v22 = a5;
          unint64_t v25 = v84;
        }
        else
        {
          *(_DWORD *)int v38 = v31;
          *((_DWORD *)v38 + 1) = v30;
          *((_DWORD *)v38 + 2) = 0;
          *((_DWORD *)v38 + 3) = v34;
          *((_DWORD *)v38 + 4) = v33;
          *((_DWORD *)v38 + 5) = 0;
          *((void *)v38 + 3) = v27;
          *((void *)v38 + 4) = v35;
          uint64_t v39 = v38 + 56;
          *((void *)v38 + 5) = v24;
          *((void *)v38 + 6) = v36;
        }
        v11[5] = v39;
        unint64_t v12 = v10[11];
      }
      unint64_t v24 = v26;
    }
    while (v26 < v12);
  }
  uint64_t v51 = v11[5] - v11[4];
  if (v51)
  {
    if (a6 >= 0x8000)
    {
      if (GEOGetVectorKitVKDefaultLog_onceToken != -1) {
        dispatch_once(&GEOGetVectorKitVKDefaultLog_onceToken, &__block_literal_global_5_16469);
      }
      unint64_t v52 = (id)GEOGetVectorKitVKDefaultLog_log;
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A1780000, v52, OS_LOG_TYPE_ERROR, "MeshSet: Cannot prepare space polygons points: polygon is too large", buf, 2u);
      }

      return;
    }
    unint64_t v53 = 2 * a6;
    unint64_t v54 = 0x924924924924924ALL * (v51 >> 3);
    uint64_t v55 = *(char **)v83->_anon_b28;
    __int16 v56 = *((_WORD *)v55 - 4);
    if (v53 <= (unsigned __int16)~v56)
    {
      *((_WORD *)v55 - 4) = v56 + 2 * a6;
      *((_DWORD *)v55 - 1) += v54;
LABEL_59:
      uint64_t v76 = *(void *)&v83->_anon_b28[144];
      long long v77 = *(void **)&v83->_anon_b28[160];
      unint64_t v78 = *(std::__shared_weak_count **)&v83->_anon_b28[168];
      if (v78) {
        atomic_fetch_add_explicit(&v78->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      if (v77 && *v77 == v76 && !*(unsigned char *)(v76 + 40))
      {
        uint64_t v79 = 48 * a6;
        unint64_t v80 = *(void *)(v76 + 8) + v54;
        *(void *)v76 += v79;
        *(void *)(v76 + 8) = v80;
        uint64_t v81 = v77[2] + v79;
        unint64_t v82 = v77[3] + v54;
        v77[2] = v81;
        v77[3] = v82;
      }
      if (v78 && !atomic_fetch_add(&v78->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v78->__on_zero_shared)(v78);
        std::__shared_weak_count::__release_weak(v78);
      }
      return;
    }
    unint64_t v57 = *(void *)&v83->_anon_b28[8];
    if ((unint64_t)v55 < v57)
    {
      *(_WORD *)uint64_t v55 = 2 * a6;
      *((_DWORD *)v55 + 1) = v54;
      unint64_t v58 = v55 + 8;
LABEL_58:
      *(void *)v83->_anon_b28 = v58;
      goto LABEL_59;
    }
    double type = v83->_strokeMeshInfo._value.type;
    uint64_t v60 = (uint64_t)&v55[-*(void *)&type] >> 3;
    unint64_t v61 = v60 + 1;
    if (!((unint64_t)(v60 + 1) >> 61))
    {
      uint64_t v62 = v57 - *(void *)&type;
      if (v62 >> 2 > v61) {
        unint64_t v61 = v62 >> 2;
      }
      BOOL v63 = (unint64_t)v62 >= 0x7FFFFFFFFFFFFFF8;
      unint64_t v64 = 0x1FFFFFFFFFFFFFFFLL;
      if (!v63) {
        unint64_t v64 = v61;
      }
      if (v64 >> 61) {
LABEL_72:
      }
        std::__throw_bad_array_new_length[abi:nn180100]();
      uint64_t v65 = 8 * v64;
      uint64_t v66 = operator new(8 * v64);
      v67 = &v66[8 * v60];
      v68 = &v66[v65];
      *(_WORD *)v67 = v53;
      *((_DWORD *)v67 + 1) = v54;
      unint64_t v58 = v67 + 8;
      if (v55 != *(char **)&type)
      {
        unint64_t v69 = (unint64_t)&v55[-*(void *)&type - 8];
        if (v69 < 0x58) {
          goto LABEL_75;
        }
        if (*(void *)&type - (void)v66 < 0x20uLL) {
          goto LABEL_75;
        }
        uint64_t v70 = (v69 >> 3) + 1;
        __n128 v71 = &v66[8 * v60 - 16];
        long long v72 = v55 - 16;
        uint64_t v73 = v70 & 0x3FFFFFFFFFFFFFFCLL;
        do
        {
          long long v74 = *(_OWORD *)v72;
          *(v71 - 1) = *((_OWORD *)v72 - 1);
          *__n128 v71 = v74;
          v71 -= 2;
          v72 -= 32;
          v73 -= 4;
        }
        while (v73);
        v67 -= 8 * (v70 & 0x3FFFFFFFFFFFFFFCLL);
        v55 -= 8 * (v70 & 0x3FFFFFFFFFFFFFFCLL);
        if (v70 != (v70 & 0x3FFFFFFFFFFFFFFCLL))
        {
LABEL_75:
          do
          {
            uint64_t v75 = *((void *)v55 - 1);
            v55 -= 8;
            *((void *)v67 - 1) = v75;
            v67 -= 8;
          }
          while (v55 != *(char **)&type);
        }
      }
      *(void *)&v83->_strokeMeshInfo._value.double type = v67;
      *(void *)v83->_anon_b28 = v58;
      *(void *)&v83->_anon_b28[8] = v68;
      if (type != 0.0) {
        operator delete(*(void **)&type);
      }
      a6 = v85;
      goto LABEL_58;
    }
LABEL_71:
    abort();
  }
}

- (void)prepareToFillSection:(const void *)a3
{
}

- (void)enclosePointsInBoundingBox:(const void *)a3 count:(unint64_t)a4
{
  if (a4)
  {
    int8x16_t v4 = *(int8x16_t *)self->super._boundingBox._minimum._e;
    float32x2_t v5 = *(float32x2_t *)&self->super._boundingBox._maximum._e[1];
    unint64_t v6 = (char *)a3 + 4;
    do
    {
      v7.i32[3] = v4.i32[3];
      v7.i64[0] = *(void *)(v6 - 4);
      v7.i32[2] = 0;
      float32x4_t v8 = (float32x4_t)v4;
      v8.i32[3] = *((_DWORD *)v6 - 1);
      int8x16_t v9 = (int8x16_t)vcgtq_f32(v8, v7);
      v7.i32[3] = *((_DWORD *)v6 - 1);
      int8x16_t v4 = vbslq_s8(v9, (int8x16_t)v7, v4);
      *(int8x16_t *)self->super._boundingBox._minimum._e = v4;
      float32x2_t v5 = vmaxnm_f32(v5, (float32x2_t)v7.u32[1]);
      *(float32x2_t *)&self->super._boundingBox._maximum._e[1] = v5;
      v6 += 8;
      --a4;
    }
    while (a4);
  }
}

- (void)prepareForPolygon:(void *)a3 withRounder:(PolygonRound *)a4
{
  uint64_t v7 = *((unsigned int *)a3 + 25);
  unint64_t v40 = 0;
  StrokeSpecifications = geo::codec::polygonFeatureGetStrokeSpecifications(a3, (uint64_t *)&v40);
  [(VKPolygonalItemGroup *)self indexForGeoFeatureAttributes:(char *)a3 + 24];
  if (v40)
  {
    for (unint64_t i = 0; i < v40; ++i)
    {
      uint64_t v10 = *(unsigned int *)&StrokeSpecifications[16 * i + 12];
      geo::codec::copyFeatureStyleAttributes((uint64_t *)a3 + 3, &__p);
      uint64_t v11 = (void **)__p;
      uint64_t v12 = *((unsigned __int8 *)__p + 33);
      uint64_t v13 = *(int **)__p;
      if (*((unsigned char *)__p + 33))
      {
        if (v12 >= 0x20)
        {
          uint64_t v14 = 0;
          unint64_t v18 = *(int **)__p;
          while (1)
          {
            int v19 = *v18;
            v18 += 2;
            if (v19 == 56) {
              break;
            }
            if (v12 == ++v14) {
              goto LABEL_15;
            }
          }
        }
        else
        {
          uint64_t v14 = 0;
          uint64_t v15 = *(int **)__p;
          while (1)
          {
            int v16 = *v15;
            v15 += 2;
            if (v16 == 56) {
              break;
            }
            if (v12 == ++v14) {
              goto LABEL_9;
            }
          }
        }
        v13[2 * v14 + 1] = v10;
      }
      else
      {
LABEL_9:
        *(void *)&v13[2 * v12] = (v10 << 32) | 0x38;
        unsigned __int8 v17 = *((unsigned char *)v11 + 33) + 1;
        *((unsigned char *)v11 + 33) = v17;
        qsort(*v11, v17, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
        uint64_t v11 = (void **)__p;
      }
LABEL_15:
      int v38 = v11;
      uint64_t v39 = v35;
      if (v35) {
        atomic_fetch_add_explicit(&v35->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      [(VKPolygonalItemGroup *)self indexForGeoFeatureAttributes:&v38];
      long long v20 = v39;
      if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
        std::__shared_weak_count::__release_weak(v20);
        long long v21 = v35;
        if (v35)
        {
LABEL_20:
          if (!atomic_fetch_add(&v21->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
            std::__shared_weak_count::__release_weak(v21);
          }
        }
      }
      else
      {
        long long v21 = v35;
        if (v35) {
          goto LABEL_20;
        }
      }
    }
  }
  geo::codec::copyFeatureStyleAttributes((uint64_t *)a3 + 3, &v38);
  unint64_t v22 = v38;
  uint64_t v23 = *((unsigned __int8 *)v38 + 33);
  unint64_t v24 = *v38;
  if (*((unsigned char *)v38 + 33))
  {
    if (v23 >= 0x20)
    {
      uint64_t v25 = 0;
      uint64_t v29 = (int *)*v38;
      while (1)
      {
        int v30 = *v29;
        v29 += 2;
        if (v30 == 56) {
          break;
        }
        if (v23 == ++v25) {
          goto LABEL_35;
        }
      }
    }
    else
    {
      uint64_t v25 = 0;
      unint64_t v26 = (int *)*v38;
      while (1)
      {
        int v27 = *v26;
        v26 += 2;
        if (v27 == 56) {
          break;
        }
        if (v23 == ++v25) {
          goto LABEL_29;
        }
      }
    }
    v24[2 * v25 + 1] = 1;
  }
  else
  {
LABEL_29:
    *(void *)&v24[2 * v23] = 0x100000038;
    unsigned __int8 v28 = *((unsigned char *)v22 + 33) + 1;
    *((unsigned char *)v22 + 33) = v28;
    qsort(*v22, v28, 8uLL, (int (__cdecl *)(const void *, const void *))FeatureStyleAttributes::compareStylePairs);
    unint64_t v22 = v38;
  }
LABEL_35:
  std::string __p = v22;
  uint64_t v35 = v39;
  if (v39) {
    atomic_fetch_add_explicit(&v39->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  [(VKPolygonalItemGroup *)self indexForGeoFeatureAttributes:&__p];
  int v31 = v35;
  if (v35 && !atomic_fetch_add(&v35->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
    std::__shared_weak_count::__release_weak(v31);
    if (!v7) {
      goto LABEL_49;
    }
  }
  else if (!v7)
  {
    goto LABEL_49;
  }
  for (unint64_t j = 0; j != v7; ++j)
  {
    unint64_t v37 = 0;
    geo::codec::multiSectionFeaturePoints(a3, j, &v37);
    std::string __p = 0;
    uint64_t v35 = 0;
    uint64_t v36 = 0;
    [(VKPolygonGroup *)self createStrokePointStyleList:a3 section:j outPointStyles:&__p withRounder:a4];
    if (v37 >= 3)
    {
      if (a4) {
        operator new();
      }
      operator new();
    }
    if (__p)
    {
      uint64_t v35 = (std::__shared_weak_count *)__p;
      operator delete(__p);
    }
  }
LABEL_49:
  int v33 = v39;
  if (v39 && !atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
    std::__shared_weak_count::__release_weak(v33);
  }
}

- (unsigned)createStrokePointStyleList:(void *)a3 section:(unint64_t)a4 outPointStyles:(void *)a5 withRounder:(PolygonRound *)a6
{
  v84[3] = *MEMORY[0x1E4F143B8];
  unint64_t v83 = 0;
  StrokeSpecifications = geo::codec::polygonFeatureGetStrokeSpecifications(a3, (uint64_t *)&v83);
  unint64_t v82 = 0;
  CharacteristicPoints = geo::codec::polygonFeatureGetCharacteristicPoints(a3, (uint64_t *)&v82);
  if (v83)
  {
    unint64_t v10 = 0;
    uint64_t v11 = (unsigned int *)(StrokeSpecifications + 4);
    while (1)
    {
      unsigned int v12 = *v11;
      v11 += 4;
      if (v12 >= a4) {
        break;
      }
      if (v83 == ++v10)
      {
        unint64_t v10 = v83;
        break;
      }
    }
    unint64_t v13 = v82;
    if (v82) {
      goto LABEL_7;
    }
  }
  else
  {
    unint64_t v10 = 0;
    unint64_t v13 = v82;
    if (v82)
    {
LABEL_7:
      unint64_t v14 = 0;
      uint64_t v15 = (unsigned int *)(CharacteristicPoints + 8);
      while (1)
      {
        unsigned int v16 = *v15;
        v15 += 25;
        if (v16 >= a4) {
          goto LABEL_13;
        }
        if (v13 == ++v14)
        {
          unint64_t v14 = v13;
          goto LABEL_13;
        }
      }
    }
  }
  unint64_t v14 = 0;
LABEL_13:
  unint64_t v81 = 0;
  v68 = geo::codec::multiSectionFeaturePoints(a3, a4, &v81);
  unint64_t v18 = v81;
  if (v81 < 3)
  {
    unsigned int v19 = 0;
    unint64_t v64 = *(char **)a5;
    *unint64_t v64 = 0;
    *(void *)(v64 + 4) = 56;
    return v19;
  }
  unsigned int v19 = 0;
  unint64_t v20 = 0;
  uint64_t v77 = 0;
  unint64_t v21 = v14;
  uint64_t v70 = a6;
  unint64_t v67 = a4;
  do
  {
    if (v10 < v83)
    {
      unint64_t v22 = &StrokeSpecifications[16 * v10];
      if (*((_DWORD *)v22 + 1) == a4 && v20 == *((_DWORD *)v22 + 2))
      {
        uint64_t v77 = *(unsigned int *)&StrokeSpecifications[16 * v10++ + 12];
        LODWORD(v23) = 1;
        int v78 = 1;
        if (a6) {
          goto LABEL_40;
        }
        goto LABEL_21;
      }
    }
    if (v21 >= v82
      || (unsigned __int8 v28 = &CharacteristicPoints[100 * v21], *((_DWORD *)v28 + 2) != a4)
      || v20 != *((_DWORD *)v28 + 3))
    {
      if (!v21
        || (int v30 = &CharacteristicPoints[100 * v21], *((_DWORD *)v30 - 23) != a4)
        || (int v31 = v30 - 100, v20 != *((_DWORD *)v31 + 3) + 1))
      {
        LODWORD(v23) = 0;
        int v78 = 0;
        if (a6) {
          goto LABEL_40;
        }
        goto LABEL_21;
      }
      LODWORD(v23) = v31[28] & 1;
      if (v31[28]) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = v77;
      }
      uint64_t v77 = v32;
      int v78 = v23;
      if (!a6) {
        goto LABEL_21;
      }
LABEL_40:
      unint64_t v76 = v21;
      unint64_t v33 = v20 + 1;
      uint64_t v34 = v68[(v20 + 1) % v18];
      v17.i64[0] = v68[v20];
      v84[0] = v68[(v20 + v18 - 1) % v18];
      v84[1] = v17.i64[0];
      uint64_t __p = v17.i64[0];
      v84[2] = v34;
      if (vmaxv_u16((uint16x4_t)vmovn_s32(vceqq_f32((float32x4_t)vzip1q_s32(v17, v17), (float32x4_t)xmmword_1A28FF920))))
      {
        uint64_t v35 = (float *)operator new(8uLL);
        *(void *)uint64_t v35 = __p;
        uint64_t v36 = v35 + 2;
        LODWORD(v23) = v78;
      }
      else
      {
        md::PolygonRound::smoothTwoSegments(&v79, &a6->var0, (float *)v84);
        uint64_t v35 = v79;
        uint64_t v36 = v80;
        if (v80 == v79)
        {
LABEL_63:
          if (v35) {
            operator delete(v35);
          }
          unint64_t v20 = v33;
          unint64_t v21 = v76;
          goto LABEL_16;
        }
      }
      unint64_t v72 = v20 + 1;
      unint64_t v73 = v10;
      uint64_t v37 = 0;
      __pa = v35;
      unint64_t v38 = ((char *)v36 - (char *)v35) >> 3;
      uint64_t v39 = (v77 << 32) | 0x38;
      int v40 = v23 + 1;
      if (v38 <= 1) {
        uint64_t v41 = 1;
      }
      else {
        uint64_t v41 = v38;
      }
      unint64_t v42 = (char *)*((void *)a5 + 1);
      do
      {
        unint64_t v43 = *((void *)a5 + 2);
        if ((unint64_t)v42 < v43)
        {
          *unint64_t v42 = v23;
          *(void *)(v42 + 4) = v39;
          v42 += 12;
        }
        else
        {
          long long v44 = *(char **)a5;
          unint64_t v23 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v42[-*(void *)a5] >> 2);
          unint64_t v45 = v23 + 1;
          if (v23 + 1 > 0x1555555555555555) {
            abort();
          }
          unint64_t v46 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v43 - (void)v44) >> 2);
          if (2 * v46 > v45) {
            unint64_t v45 = 2 * v46;
          }
          if (v46 >= 0xAAAAAAAAAAAAAAALL) {
            unint64_t v47 = 0x1555555555555555;
          }
          else {
            unint64_t v47 = v45;
          }
          if (v47 > 0x1555555555555555) {
            goto LABEL_83;
          }
          long long v48 = (char *)operator new(12 * v47);
          long long v49 = &v48[12 * v23];
          LOBYTE(v23) = v78;
          *long long v49 = v78;
          *(void *)(v49 + 4) = v39;
          for (unint64_t i = v49; v42 != v44; *((_DWORD *)i + 2) = v52)
          {
            uint64_t v51 = *(void *)(v42 - 12);
            v42 -= 12;
            int v52 = *((_DWORD *)v42 + 2);
            *(void *)(i - 12) = v51;
            i -= 12;
          }
          unint64_t v42 = v49 + 12;
          *(void *)a5 = i;
          *((void *)a5 + 1) = v49 + 12;
          *((void *)a5 + 2) = &v48[12 * v47];
          if (v44) {
            operator delete(v44);
          }
        }
        *((void *)a5 + 1) = v42;
        v19 += v40;
        ++v37;
      }
      while (v37 != v41);
      a6 = v70;
      a4 = v67;
      unint64_t v33 = v72;
      unint64_t v10 = v73;
      uint64_t v35 = __pa;
      goto LABEL_63;
    }
    LODWORD(v23) = v28[28] & 1;
    if (v28[28]) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = v77;
    }
    uint64_t v77 = v29;
    ++v21;
    int v78 = v23;
    if (a6) {
      goto LABEL_40;
    }
LABEL_21:
    uint64_t v25 = (char *)*((void *)a5 + 1);
    unint64_t v24 = *((void *)a5 + 2);
    if ((unint64_t)v25 >= v24)
    {
      unint64_t v53 = *(char **)a5;
      unint64_t v54 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)&v25[-*(void *)a5] >> 2);
      unint64_t v55 = v54 + 1;
      if (v54 + 1 > 0x1555555555555555) {
        abort();
      }
      unint64_t v56 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v24 - (void)v53) >> 2);
      if (2 * v56 > v55) {
        unint64_t v55 = 2 * v56;
      }
      if (v56 >= 0xAAAAAAAAAAAAAAALL) {
        unint64_t v57 = 0x1555555555555555;
      }
      else {
        unint64_t v57 = v55;
      }
      if (v57 > 0x1555555555555555) {
LABEL_83:
      }
        std::__throw_bad_array_new_length[abi:nn180100]();
      unint64_t v58 = v21;
      unint64_t v59 = (char *)operator new(12 * v57);
      uint64_t v60 = &v59[12 * v54];
      *uint64_t v60 = v78;
      *(void *)(v60 + 4) = (v77 << 32) | 0x38;
      for (unint64_t j = v60; v25 != v53; *((_DWORD *)j + 2) = v63)
      {
        uint64_t v62 = *(void *)(v25 - 12);
        v25 -= 12;
        int v63 = *((_DWORD *)v25 + 2);
        *(void *)(j - 12) = v62;
        j -= 12;
      }
      int v27 = v60 + 12;
      *(void *)a5 = j;
      *((void *)a5 + 1) = v60 + 12;
      *((void *)a5 + 2) = &v59[12 * v57];
      if (v53) {
        operator delete(v53);
      }
      unint64_t v21 = v58;
      a6 = v70;
      int v26 = v78;
    }
    else
    {
      *uint64_t v25 = v23;
      *(void *)(v25 + 4) = (v77 << 32) | 0x38;
      int v26 = v23;
      int v27 = v25 + 12;
    }
    *((void *)a5 + 1) = v27;
    v19 += v26 + 1;
    ++v20;
LABEL_16:
    unint64_t v18 = v81;
  }
  while (v20 < v81);
  uint64_t v65 = *(char **)a5;
  if (*(_DWORD *)(*((void *)a5 + 1) - 4) != *(_DWORD *)(*(void *)a5 + 8) && !*v65)
  {
    char *v65 = 1;
    ++v19;
  }
  return v19;
}

- (void)strokeMeshes
{
  return &self->_strokeMeshes;
}

- (void)updateTexturesIfNecessary:(float)a3 textureManager:(void *)a4
{
  if (self->_lastResolvedZoom != (int)a3) {
    -[VKPolygonGroup updateTextures:textureManager:](self, "updateTextures:textureManager:");
  }
}

- (void)setNeedsTextureUpdate
{
  self->_lastResolvedZoom = -1;
}

- (FeatureAttributeSet)styleAttributes
{
  int8x16_t v4 = *(uint64_t **)([(VKPolygonalItemGroup *)self attributeSets] + 24);
  return (FeatureAttributeSet *)md::createFeatureAttributeSet((gss::Allocator *)retstr, v4);
}

- (shared_ptr<ggl::Texture2D>)_textureForName:(const void *)a3 textureManager:(void *)a4
{
  float32x4_t v8 = v4;
  int8x16_t v9 = (std::__shared_weak_count *)operator new(0x58uLL);
  v9->__shared_owners_ = 0;
  v9->__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF583858;
  v9[1].__shared_weak_owners_ = 0;
  v9[2].__vftable = 0;
  v9[1].__shared_owners_ = 0;
  LODWORD(v9[2].__shared_owners_) = 0;
  v9->__shared_weak_owners_ = 0;
  v9[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1EF55AE58;
  *(_OWORD *)((char *)&v9[2].__shared_owners_ + 4) = xmmword_1A28FC7B0;
  *(std::__shared_weak_count_vtbl **)((char *)&v9[3].__vftable + 4) = (std::__shared_weak_count_vtbl *)0x100000001;
  HIDWORD(v9[3].__shared_owners_) = 0;
  unint64_t v22 = v9 + 1;
  unint64_t v23 = v9;
  unint64_t v10 = *(void **)a4;
  float contentScale = self->super._contentScale;
  v19[0] = (uint64_t)&v9[1];
  v19[1] = (uint64_t)v9;
  atomic_fetch_add_explicit(&v9->__shared_owners_, 1uLL, memory_order_relaxed);
  md::TextureManager::texture(&v20, v10, (uint64_t)a3, v19, 0, contentScale);
  if (atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    uint64_t v14 = v20;
    if (v20) {
      goto LABEL_3;
    }
LABEL_8:
    *float32x4_t v8 = 0;
    v8[1] = 0;
    int32x4_t v17 = v21;
    if (!v21) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
  std::__shared_weak_count::__release_weak(v9);
  uint64_t v14 = v20;
  if (!v20) {
    goto LABEL_8;
  }
LABEL_3:
  uint64_t v16 = *(void *)(v14 + 32);
  uint64_t v15 = *(void *)(v14 + 40);
  *float32x4_t v8 = v16;
  v8[1] = v15;
  if (v15) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v15 + 8), 1uLL, memory_order_relaxed);
  }
  int32x4_t v17 = v21;
  if (v21)
  {
LABEL_9:
    if (!atomic_fetch_add(&v17->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
LABEL_11:
  unint64_t v18 = v23;
  if (v23 && !atomic_fetch_add(&v23->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
  result.__cntrl_ = v13;
  result.__ptr_ = v12;
  return result;
}

- (VKPolygonGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6 storage:(shared_ptr<md::MeshSetStorage>)a7
{
  ptr = a7.__ptr_;
  float32x4_t v8 = (std::__shared_weak_count *)*((void *)a7.__ptr_ + 1);
  uint64_t v64 = *(void *)a7.__ptr_;
  uint64_t v65 = v8;
  if (v8) {
    atomic_fetch_add_explicit(&v8->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v63.receiver = self;
  v63.super_class = (Class)VKPolygonGroup;
  int8x16_t v9 = -[VKPolygonalItemGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](&v63, sel_initWithStyleQuery_tileZoom_fixedAroundCentroid_contentScale_storage_, a3, a5, &v64, a7.__cntrl_);
  unint64_t v10 = v9;
  uint64_t v11 = v65;
  if (v65 && !atomic_fetch_add(&v65->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
    if (!v10) {
      return v10;
    }
  }
  else if (!v9)
  {
    return v10;
  }
  v10->_lastResolvedZoom = -1;
  uint64_t v12 = *(void *)ptr;
  LOBYTE(v62[0]) = 0;
  memset((char *)v62 + 2, 0, 38);
  memset(v55, 0, sizeof(v55));
  v56[0] = 0u;
  uint64_t v61 = 0;
  v59[0] = 0uLL;
  uint64_t v58 = 0;
  *((void *)&v62[0] + 1) = v12;
  if (!v12) {
    operator new();
  }
  unint64_t v13 = (char *)operator new(0x90uLL);
  *((void *)v13 + 1) = 0;
  *((void *)v13 + 2) = 0;
  *(void *)unint64_t v13 = &unk_1EF580F00;
  *((void *)v13 + 3) = v12;
  uint64_t v14 = v13 + 24;
  *((void *)v13 + 4) = 24;
  *(_OWORD *)(v13 + 40) = 0u;
  *(_OWORD *)(v13 + 56) = 0u;
  *(_OWORD *)(v13 + 72) = 0u;
  *(_OWORD *)(v13 + 88) = 0u;
  v13[104] = 0;
  *((void *)v13 + 17) = v13 + 112;
  *((void *)v13 + 14) = &unk_1EF570BA8;
  *(void *)&long long v66 = v13 + 24;
  *((void *)&v66 + 1) = v13;
  uint64_t v16 = (uint64_t **)(v12 + 24);
  uint64_t v15 = *(uint64_t **)(v12 + 24);
  if (v15)
  {
    while (1)
    {
      while (1)
      {
        int32x4_t v17 = (uint64_t **)v15;
        unint64_t v18 = v15[4];
        if ((unint64_t)v14 >= v18) {
          break;
        }
        uint64_t v15 = *v17;
        uint64_t v16 = v17;
        if (!*v17) {
          goto LABEL_15;
        }
      }
      if (v18 >= (unint64_t)v14) {
        break;
      }
      uint64_t v15 = v17[1];
      if (!v15)
      {
        uint64_t v16 = v17 + 1;
        goto LABEL_15;
      }
    }
  }
  else
  {
    int32x4_t v17 = (uint64_t **)(v12 + 24);
LABEL_15:
    unsigned int v19 = (uint64_t *)operator new(0x30uLL);
    v19[4] = (uint64_t)v14;
    v19[5] = (uint64_t)v13;
    atomic_fetch_add_explicit((atomic_ullong *volatile)v13 + 1, 1uLL, memory_order_relaxed);
    *unsigned int v19 = 0;
    v19[1] = 0;
    uint64_t v19[2] = (uint64_t)v17;
    char *v16 = v19;
    uint64_t v20 = **(void **)(v12 + 16);
    if (v20)
    {
      *(void *)(v12 + 16) = v20;
      unsigned int v19 = *v16;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>(*(uint64_t **)(v12 + 24), v19);
    ++*(void *)(v12 + 32);
  }
  long long v21 = v66;
  long long v66 = 0uLL;
  unint64_t v22 = *(std::__shared_weak_count **)&v62[2];
  *(_OWORD *)((char *)&v62[1] + 8) = v21;
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  unint64_t v23 = (std::__shared_weak_count *)*((void *)&v66 + 1);
  if (*((void *)&v66 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v66 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
    std::__shared_weak_count::__release_weak(v23);
  }
  unint64_t v24 = (char *)*((void *)&v55[0] + 1);
  if (*((void *)&v55[0] + 1) >= *(void *)&v55[1])
  {
    int v26 = *(char **)&v55[0];
    uint64_t v27 = *((void *)&v55[0] + 1) - *(void *)&v55[0];
    uint64_t v28 = (uint64_t)(*((void *)&v55[0] + 1) - *(void *)&v55[0]) >> 3;
    unint64_t v29 = v28 + 1;
    if ((unint64_t)(v28 + 1) >> 61) {
      abort();
    }
    uint64_t v30 = *(void *)&v55[1] - *(void *)&v55[0];
    if ((uint64_t)(*(void *)&v55[1] - *(void *)&v55[0]) >> 2 > v29) {
      unint64_t v29 = v30 >> 2;
    }
    if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v31 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v31 = v29;
    }
    if (v31 >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    uint64_t v32 = (char *)operator new(8 * v31);
    unint64_t v33 = &v32[8 * v28];
    uint64_t v34 = &v32[8 * v31];
    *(_WORD *)unint64_t v33 = 0;
    *((_DWORD *)v33 + 1) = 0;
    uint64_t v25 = v33 + 8;
    if (v24 != v26)
    {
      unint64_t v35 = v24 - v26 - 8;
      if (v35 < 0x58) {
        goto LABEL_68;
      }
      if ((unint64_t)(&v24[-v27] - v32) < 0x20) {
        goto LABEL_68;
      }
      uint64_t v36 = (v35 >> 3) + 1;
      uint64_t v37 = &v32[8 * v28 - 16];
      unint64_t v38 = v24 - 16;
      uint64_t v39 = v36 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v40 = *(_OWORD *)v38;
        *((_OWORD *)v37 - 1) = *((_OWORD *)v38 - 1);
        *(_OWORD *)uint64_t v37 = v40;
        v37 -= 32;
        v38 -= 32;
        v39 -= 4;
      }
      while (v39);
      v33 -= 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
      v24 -= 8 * (v36 & 0x3FFFFFFFFFFFFFFCLL);
      if (v36 != (v36 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_68:
        do
        {
          uint64_t v41 = *((void *)v24 - 1);
          v24 -= 8;
          *((void *)v33 - 1) = v41;
          v33 -= 8;
        }
        while (v24 != v26);
      }
    }
    *(void *)&v55[0] = v33;
    *((void *)&v55[0] + 1) = v25;
    *(void *)&v55[1] = v34;
    if (v26) {
      operator delete(v26);
    }
  }
  else
  {
    **((_WORD **)&v55[0] + 1) = 0;
    *((_DWORD *)v24 + 1) = 0;
    uint64_t v25 = v24 + 8;
  }
  *((void *)&v55[0] + 1) = v25;
  p_value = (void **)&v10->_strokeMeshInfo._value;
  if (v10->_strokeMeshInfo._hasValue)
  {
    unint64_t v43 = *p_value;
    if (*p_value)
    {
      *(void *)v10->_anon_b28 = v43;
      operator delete(v43);
      *p_value = 0;
      *(void *)v10->_anon_b28 = 0;
      *(void *)&v10->_anon_b28[8] = 0;
    }
    *(_OWORD *)v10->_strokeMeshInfo._value.data = v55[0];
    *(void *)&v10->_anon_b28[8] = *(void *)&v55[1];
    memset(v55, 0, 24);
    long long v44 = (void **)&v10->_anon_b28[16];
    uint64_t v45 = *(void *)&v10->_anon_b28[16];
    if (v45)
    {
      uint64_t v46 = *(void *)&v10->_anon_b28[24];
      unint64_t v47 = *(void **)&v10->_anon_b28[16];
      if (v46 != v45)
      {
        do
        {
          long long v48 = *(std::__shared_weak_count **)(v46 - 8);
          if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
            std::__shared_weak_count::__release_weak(v48);
          }
          v46 -= 16;
        }
        while (v46 != v45);
        unint64_t v47 = *v44;
      }
      *(void *)&v10->_anon_b28[24] = v45;
      operator delete(v47);
      *long long v44 = 0;
      *(void *)&v10->_anon_b28[24] = 0;
      *(void *)&v10->_anon_b28[32] = 0;
    }
    *(_OWORD *)&v10->_anon_b28[16] = *(_OWORD *)((char *)&v55[1] + 8);
    *(void *)&v10->_anon_b28[32] = *((void *)&v55[2] + 1);
    memset((char *)&v55[1] + 8, 0, 24);
    ggl::BufferMemory::operator=((uint64_t *)&v10->_anon_b28[40], (uint64_t)v56);
    ggl::BufferMemory::operator=((uint64_t *)&v10->_anon_b28[88], (uint64_t)v59);
    *(_OWORD *)&v10->_anon_b28[136] = v62[0];
    uint64_t v50 = *(void *)&v62[1];
    *(void *)&v62[1] = 0;
    uint64_t v51 = *(void *)&v10->_anon_b28[152];
    *(void *)&v10->_anon_b28[152] = v50;
    if (v51) {
      std::default_delete<md::MeshSetStorage>::operator()[abi:nn180100](v51);
    }
    long long v52 = *(_OWORD *)((char *)&v62[1] + 8);
    *((void *)&v62[1] + 1) = 0;
    *(void *)&v62[2] = 0;
    unint64_t v53 = *(std::__shared_weak_count **)&v10->_anon_b28[168];
    *(_OWORD *)&v10->_anon_b28[160] = v52;
    if (v53 && !atomic_fetch_add(&v53->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
      std::__shared_weak_count::__release_weak(v53);
    }
  }
  else
  {
    *p_value = 0;
    *(void *)v10->_anon_b28 = 0;
    *(void *)&v10->_anon_b28[8] = 0;
    *(_OWORD *)v10->_strokeMeshInfo._value.data = v55[0];
    *(void *)&v10->_anon_b28[8] = *(void *)&v55[1];
    memset(v55, 0, 24);
    *(void *)&v10->_anon_b28[16] = 0;
    *(void *)&v10->_anon_b28[24] = 0;
    *(void *)&v10->_anon_b28[32] = 0;
    *(_OWORD *)&v10->_anon_b28[16] = *(_OWORD *)((char *)&v55[1] + 8);
    *(void *)&v10->_anon_b28[32] = *((void *)&v55[2] + 1);
    memset((char *)&v55[1] + 8, 0, 24);
    *(_OWORD *)&v10->_anon_b28[40] = v56[0];
    *(_OWORD *)&v10->_anon_b28[56] = v56[1];
    *(_WORD *)&v10->_anon_b28[72] = v57;
    *(void *)&v10->_anon_b28[80] = v58;
    uint64_t v58 = 0;
    v56[0] = 0uLL;
    *(_OWORD *)&v10->_anon_b28[88] = v59[0];
    *(_OWORD *)&v10->_anon_b28[104] = v59[1];
    *(_WORD *)&v10->_anon_b28[120] = v60;
    *(void *)&v10->_anon_b28[128] = v61;
    uint64_t v61 = 0;
    v59[0] = 0uLL;
    *(_OWORD *)&v10->_anon_b28[136] = v62[0];
    long long v49 = v62[1];
    *(void *)&v62[1] = 0;
    *(_OWORD *)&v10->_anon_b28[152] = v49;
    *(void *)&v10->_anon_b28[168] = *(void *)&v62[2];
    *((void *)&v62[1] + 1) = 0;
    *(void *)&v62[2] = 0;
    v10->_strokeMeshInfo._hasValue = 1;
  }
  md::MeshSet<ggl::PolygonBase::CompressedMeshMesh,ggl::PolygonBase::CompressedVbo>::~MeshSet((uint64_t)v55);
  return v10;
}

- (VKPolygonGroup)initWithStyleQuery:(void *)a3 tileZoom:(float)a4 fixedAroundCentroid:(const void *)a5 contentScale:(float)a6
{
  uint64_t v9 = 0;
  unint64_t v10 = 0;
  unint64_t v6 = -[VKPolygonGroup initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:](self, "initWithStyleQuery:tileZoom:fixedAroundCentroid:contentScale:storage:", a3, a5, &v9);
  uint64_t v7 = v10;
  if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
    std::__shared_weak_count::__release_weak(v7);
  }

  return v6;
}

- (void)targetRoofTexture
{
  return self->_targetRoofTexture.__ptr_;
}

- (void)sourceRoofTexture
{
  return self->_sourceRoofTexture.__ptr_;
}

- (void)targetTexture
{
  return self->_targetTexture.__ptr_;
}

- (void)sourceTexture
{
  return self->_sourceTexture.__ptr_;
}

@end