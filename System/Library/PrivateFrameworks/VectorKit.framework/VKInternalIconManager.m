@interface VKInternalIconManager
+ (int64_t)convertGrlSizeGroup:(unsigned __int8)a3;
+ (unsigned)convertSizeGroup:(int64_t)a3;
- (BOOL)isCachingAtlases;
- (VKInternalIconManager)init;
- (id).cxx_construct;
- (id)_startTileGroupObserver;
- (id)imageForDataID:(unsigned int)a3 text:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7;
- (id)imageForIconID:(unsigned int)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6;
- (id)imageForImageSourceKey:(id)a3;
- (id)imageForKey:(unsigned int)a3 value:(unsigned int)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7;
- (id)imageForName:(id)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6;
- (id)imageForStyleAttributes:(id)a3 styleManager:(shared_ptr<gss:(float)a5 :(int64_t)a6 StylesheetManager<gss:(id)a7 :PropertyID>>)a4 contentScale:sizeGroup:modifiers:;
- (id)imageForStyleAttributes:(id)a3 withStylesheetName:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7;
- (id)init:(shared_ptr<grl:(shared_ptr<md::StylesheetVendor>)a4 :IconManager>)a3 stylesheetVendor:;
- (uint64_t)_startTileGroupObserver;
- (unsigned)darkVariant;
- (unsigned)styleAttributeTransitSystemTypeKey;
- (unsigned)styleAttributeTransitTypeKey;
- (unsigned)trafficIncidentTypeKey;
- (void)_purgeStyleManagers;
- (void)_startTileGroupObserver;
- (void)dealloc;
- (void)purge;
- (void)purgeNonsharedResources;
- (void)setIsCachingAtlases:(BOOL)a3;
@end

@implementation VKInternalIconManager

- (id)imageForStyleAttributes:(id)a3 withStylesheetName:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v62 = v12;
  [NSString stringWithFormat:@"%@-%f", v13, a5];
  v69 = &unk_1EF559F18;
  id v70 = (id)objc_claimAutoreleasedReturnValue();
  long long v68 = 0uLL;
  __dst[0] = &self->_nameToStyleManagerLock;
  v15 = (geo::read_write_lock *)pthread_rwlock_rdlock(&self->_nameToStyleManagerLock._lock);
  if (v15) {
    geo::read_write_lock::logFailure(v15, (uint64_t)"read lock", v16);
  }
  p_pair1 = &self->_nameToStyleManager.__tree_.__pair1_;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    v19 = &self->_nameToStyleManager.__tree_.__pair1_;
    do
    {
      BOOL v20 = NSStringMapComparison::operator()((uint64_t)&left[2], (uint64_t)&v69);
      p_value__2 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **)&left->__value__2;
      if (!v20)
      {
        p_value__2 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **)left;
        v19 = left;
      }
      left = *p_value__2;
    }
    while (*p_value__2);
    if (v19 == p_pair1 || NSStringMapComparison::operator()((uint64_t)&v69, (uint64_t)&v19[2]))
    {
      v22 = 0;
      left = 0;
    }
    else
    {
      left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)v19[3].__value__2._allocator;
      v22 = (std::__shared_weak_count *)v19[4].__value_.__left_;
      if (v22) {
        atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
      }
      *(void *)&long long v68 = left;
      *((void *)&v68 + 1) = v22;
    }
  }
  else
  {
    v22 = 0;
  }
  v23 = (geo::read_write_lock *)pthread_rwlock_unlock(&self->_nameToStyleManagerLock._lock);
  if (v23) {
    geo::read_write_lock::logFailure(v23, (uint64_t)"unlock", v24);
  }
  if (!left)
  {
    int64_t v28 = a6;
    uint64_t v29 = [v13 UTF8String];
    v26 = 0;
    if (!self->_stylesheetVendor.__ptr_) {
      goto LABEL_38;
    }
    v30 = (const char *)v29;
    if (!v29) {
      goto LABEL_38;
    }
    p_lock = &self->_nameToStyleManagerLock._lock;
    v31 = (geo::read_write_lock *)pthread_rwlock_wrlock(&self->_nameToStyleManagerLock._lock);
    if (v31) {
      geo::read_write_lock::logFailure(v31, (uint64_t)"write lock", v32);
    }
    v33 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)p_pair1->__value_.__left_;
    if (p_pair1->__value_.__left_)
    {
      v34 = &self->_nameToStyleManager.__tree_.__pair1_;
      do
      {
        BOOL v35 = NSStringMapComparison::operator()((uint64_t)&v33[2], (uint64_t)&v69);
        v36 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **)&v33->__value__2;
        if (!v35)
        {
          v36 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> **)v33;
          v34 = v33;
        }
        v33 = *v36;
      }
      while (*v36);
      if (v34 != p_pair1 && !NSStringMapComparison::operator()((uint64_t)&v69, (uint64_t)&v34[2]))
      {
        allocator = v34[3].__value__2._allocator;
        v52 = (atomic_ullong *)v34[4].__value_.__left_;
        if (v52) {
          atomic_fetch_add_explicit(v52 + 1, 1uLL, memory_order_relaxed);
        }
        *(void *)&long long v68 = allocator;
        *((void *)&v68 + 1) = v52;
        a6 = v28;
        id v12 = v62;
        if (v22) {
          goto LABEL_80;
        }
        goto LABEL_82;
      }
    }
    size_t v37 = strlen(v30);
    if (v37 >= 0x7FFFFFFFFFFFFFF8) {
      abort();
    }
    v38 = (void *)v37;
    if (v37 >= 0x17)
    {
      uint64_t v42 = (v37 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v37 | 7) != 0x17) {
        uint64_t v42 = v37 | 7;
      }
      uint64_t v43 = v42 + 1;
      v39 = (void **)operator new(v42 + 1);
      __dst[1] = v38;
      unint64_t v65 = v43 | 0x8000000000000000;
      __dst[0] = v39;
    }
    else
    {
      HIBYTE(v65) = v37;
      v39 = __dst;
      if (!v37) {
        goto LABEL_48;
      }
    }
    memmove(v39, v30, (size_t)v38);
LABEL_48:
    a6 = v28;
    *((unsigned char *)v38 + (void)v39) = 0;
    id v12 = v62;
    gss::StyleManagerExtension::initWithName<gss::PropertyID>(&v66, (uint64_t)__dst, 0, (uint64_t)self->_stylesheetVendor.__ptr_, a5);
    long long v44 = v66;
    long long v66 = 0uLL;
    v45 = (std::__shared_weak_count *)*((void *)&v68 + 1);
    long long v68 = v44;
    if (v45 && !atomic_fetch_add(&v45->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
    v46 = (std::__shared_weak_count *)*((void *)&v66 + 1);
    if (*((void *)&v66 + 1)
      && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v66 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
    if (SHIBYTE(v65) < 0) {
      operator delete(__dst[0]);
    }
    uint64_t v47 = *(void *)(v68 + 520);
    v48 = *(std::__shared_weak_count **)(v68 + 528);
    if (v48)
    {
      atomic_fetch_add_explicit(&v48->__shared_owners_, 1uLL, memory_order_relaxed);
      if (!atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v48->__on_zero_shared)(v48);
        std::__shared_weak_count::__release_weak(v48);
      }
    }
    if (!v47) {
      operator new();
    }
    if (*((unsigned char *)self->_iconManager.__ptr_ + 88)) {
      goto LABEL_82;
    }
    v49 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)p_pair1->__value_.__left_;
    if (p_pair1->__value_.__left_)
    {
      while (1)
      {
        while (1)
        {
          v50 = v49;
          uint64_t v51 = (uint64_t)&v49[2];
          if (!NSStringMapComparison::operator()((uint64_t)&v69, (uint64_t)&v49[2])) {
            break;
          }
          v49 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)v50->__value_.__left_;
          p_pair1 = v50;
          if (!v50->__value_.__left_) {
            goto LABEL_74;
          }
        }
        if (!NSStringMapComparison::operator()(v51, (uint64_t)&v69)) {
          break;
        }
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)&v50->__value__2;
        v49 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, geo::StdAllocator<std::__tree_node<std::__value_type<geo::_retain_ptr<NSString *, geo::_retain_objc_arc, geo::_release_objc_arc, geo::_hash_objc, geo::_equal_objc>, std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>, void *>, mdm::Allocator>> *)v50->__value__2._allocator;
        if (!v49) {
          goto LABEL_74;
        }
      }
      uint64_t v54 = (uint64_t)p_pair1->__value_.__left_;
      if (p_pair1->__value_.__left_)
      {
LABEL_77:
        long long v59 = v68;
        if (*((void *)&v68 + 1)) {
          atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v68 + 1) + 8), 1uLL, memory_order_relaxed);
        }
        v22 = *(std::__shared_weak_count **)(v54 + 64);
        *(_OWORD *)(v54 + 56) = v59;
        if (v22)
        {
LABEL_80:
          if (!atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
          {
            ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
            std::__shared_weak_count::__release_weak(v22);
          }
        }
LABEL_82:
        v60 = (geo::read_write_lock *)pthread_rwlock_unlock(p_lock);
        if (v60) {
          geo::read_write_lock::logFailure(v60, (uint64_t)"unlock", v61);
        }
        v22 = (std::__shared_weak_count *)*((void *)&v68 + 1);
        long long v63 = v68;
        if (!*((void *)&v68 + 1)) {
          goto LABEL_20;
        }
        goto LABEL_19;
      }
    }
    else
    {
      v50 = &self->_nameToStyleManager.__tree_.__pair1_;
    }
LABEL_74:
    uint64_t v54 = (*(uint64_t (**)(Allocator *, uint64_t, uint64_t))(*(void *)self->_nameToStyleManager.__tree_.__pair1_.__value__2._allocator
                                                                   + 16))(self->_nameToStyleManager.__tree_.__pair1_.__value__2._allocator, 72, 8);
    *(void *)(v54 + 32) = &unk_1EF559F18;
    *(void *)(v54 + 40) = 0;
    id v55 = v70;
    v56 = *(void **)(v54 + 40);
    *(void *)(v54 + 40) = v55;

    *(void *)(v54 + 56) = 0;
    *(void *)(v54 + 64) = 0;
    *(void *)uint64_t v54 = 0;
    *(void *)(v54 + 8) = 0;
    *(void *)(v54 + 16) = v50;
    p_pair1->__value_.__left_ = (void *)v54;
    v57 = *(void **)self->_nameToStyleManager.__tree_.__begin_node_;
    v58 = (uint64_t *)v54;
    if (v57)
    {
      self->_nameToStyleManager.__tree_.__begin_node_ = v57;
      v58 = (uint64_t *)p_pair1->__value_.__left_;
    }
    std::__tree_balance_after_insert[abi:nn180100]<std::__tree_node_base<void *> *>((uint64_t *)self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_, v58);
    ++self->_nameToStyleManager.__tree_.__pair3_.__value_;
    id v12 = v62;
    goto LABEL_77;
  }
  *(void *)&long long v63 = left;
  *((void *)&v63 + 1) = v22;
  if (v22) {
LABEL_19:
  }
    atomic_fetch_add_explicit(&v22->__shared_owners_, 1uLL, memory_order_relaxed);
LABEL_20:
  *(float *)&double v25 = a5;
  v26 = [(VKInternalIconManager *)self imageForStyleAttributes:v12 styleManager:&v63 contentScale:a6 sizeGroup:v14 modifiers:v25];
  v27 = (std::__shared_weak_count *)*((void *)&v63 + 1);
  if (*((void *)&v63 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v63 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
LABEL_38:
  v40 = (std::__shared_weak_count *)*((void *)&v68 + 1);
  if (*((void *)&v68 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v68 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
    std::__shared_weak_count::__release_weak(v40);
  }
  v69 = &unk_1EF559F18;

  return v26;
}

- (id)imageForIconID:(unsigned int)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v10 = (grl::Allocator *)a6;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  int v23 = 1065353216;
  char v24 = 4;
  __int16 v26 = -1;
  int v25 = 0;
  char v27 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  uint64_t v28 = 0;
  uint64_t v31 = grl::Allocator::instance(v10);
  grl::IconRequestOptions::setContentScale((float *)&v23, a4);
  v11 = (grl::Allocator *)grl::IconRequestOptions::setSizeGroup((uint64_t)&v23, +[VKInternalIconManager convertSizeGroup:a5]);
  if (v10)
  {
    grl::IconRequestOptions::setVariant((uint64_t)&v23, [(grl::Allocator *)v10 variant]);
    grl::IconRequestOptions::setDataVariant((uint64_t)&v23, [(grl::Allocator *)v10 secondaryVariant]);
    grl::IconRequestOptions::setCountryCode((uint64_t)&v23, [(grl::Allocator *)v10 countryCode]);
    ptr = self->_iconManager.__ptr_;
    id v13 = (grl::Allocator *)[(grl::Allocator *)v10 cppModifiers];
    uint64_t v35 = 0;
    long long v36 = (unint64_t)grl::Allocator::instance(v13);
    v34 = &v35;
    grl::IconManager::imageForIconID((uint64_t)ptr, a3, (uint64_t)v13, (uint64_t)&v23);
  }
  v34 = 0;
  long long v36 = 0u;
  memset(v42, 0, sizeof(v42));
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v35 = _D0;
  BYTE14(v36) = 0;
  long long v41 = 0uLL;
  *((void *)&v41 + 1) = grl::Allocator::instance(v11);
  memset(v42, 0, 56);
  *((void *)&v40 + 1) = &v41;
  uint64_t v43 = 0;
  v19 = self->_iconManager.__ptr_;
  v22[0] = 0;
  v22[1] = grl::Allocator::instance(*((grl::Allocator **)&v41 + 1));
  v22[2] = 0;
  v21 = v22;
  grl::IconManager::imageForIconID((uint64_t)v19, a3, (uint64_t)&v34, (uint64_t)&v23);
}

- (id)imageForStyleAttributes:(id)a3 styleManager:(shared_ptr<gss:(float)a5 :(int64_t)a6 StylesheetManager<gss:(id)a7 :PropertyID>>)a4 contentScale:sizeGroup:modifiers:
{
  cntrl = a4.__cntrl_;
  ptr = (uint64_t *)a4.__ptr_;
  id v12 = a3;
  id v13 = (VKIconModifiers *)(id)a6;
  id v14 = v13;
  if (!self->_iconManager.__ptr_ || !v12 || !*ptr) {
    goto LABEL_124;
  }
  if (!v13) {
    id v14 = objc_alloc_init(VKIconModifiers);
  }
  memset(v94, 0, sizeof(v94));
  char v95 = 1;
  if ([(VKIconModifiers *)v14 transitMode])
  {
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x10001u) = 0;
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x1000Du) = 2;
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x1000Eu) = 0;
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x10033u) = 0;
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x1003Cu) = 1;
  }
  if ([(VKIconModifiers *)v14 navMode]) {
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x10000u) = 3;
  }
  if ([(VKIconModifiers *)v14 interactive]) {
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x10002u) = 2;
  }
  if ([(VKIconModifiers *)v14 nightMode]) {
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x10001u) = 1;
  }
  if ([(VKIconModifiers *)v14 elevated]) {
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x10051u) = 1;
  }
  if ([(VKIconModifiers *)v14 isSearchResult])
  {
    __int16 v15 = [(VKIconModifiers *)v14 nightMode];
    BOOL v16 = [(VKIconModifiers *)v14 transitMode];
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x10001u) = v15;
    v17 = (_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x1000Du);
    if (v16) {
      __int16 v18 = 2;
    }
    else {
      __int16 v18 = 0;
    }
    _WORD *v17 = v18;
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x1000Eu) = 0;
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x10033u) = 1;
    *(_WORD *)geo::intern_linear_map<gss::StyleAttribute,unsigned short,geo::StdAllocator<unsigned char,gss::Allocator>,30ul>::operator[]((uint64_t *)v94, 0x1003Cu) = 1;
  }
  [v12 featureStyleAttributesPtr];
  long long v80 = *(_OWORD *)v89;
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = *(_OWORD *)v89;
  *(_OWORD *)v89 = 0uLL;
  md::createFeatureAttributeSet((gss::Allocator *)v92, (uint64_t *)&__p);
  if (*((void *)&v80 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v80 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(void))(**((void **)&v80 + 1) + 16))(*((void *)&v80 + 1));
    std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v80 + 1));
  }
  v19 = (std::__shared_weak_count *)v89[1];
  if (v89[1] && !atomic_fetch_add((atomic_ullong *volatile)(v89[1] + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  gss::StylesheetManager<gss::PropertyID>::styleQueryForFeatureAttributes((uint64_t **)&v91, *ptr, (gss::FeatureAttributeSet *)v92, (gss::QueryOverrides *)v94);
  uint64_t v21 = v91;
  if (!(void)v91)
  {
    long long v39 = (std::__shared_weak_count *)*((void *)&v91 + 1);
    if (*((void *)&v91 + 1)) {
      goto LABEL_117;
    }
    goto LABEL_119;
  }
  v22 = (std::__shared_weak_count *)*((void *)&v91 + 1);
  *(_OWORD *)&__p.__r_.__value_.__l.__data_ = v91;
  if (*((void *)&v91 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v91 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  gss::QueryableLocker<gss::PropertyID>::QueryableLocker(v89, v21, (uint64_t)v22);
  if (v22 && !atomic_fetch_add(&v22->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
    std::__shared_weak_count::__release_weak(v22);
  }
  if (v90)
  {
    unsigned int v23 = [(VKIconModifiers *)v14 zoom];
    uint64_t v24 = *(void *)(v89[0] + 24);
    if (v23 >= 0x17) {
      unsigned int v25 = 23;
    }
    else {
      unsigned int v25 = v23;
    }
    unsigned int v26 = *(unsigned __int8 *)(v24 + 12);
    if (v26 == 2)
    {
      if (gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(void *)(v89[0] + 24), 0x71u, v25, 0)) {
        goto LABEL_41;
      }
      unsigned int v26 = 1;
    }
    if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v24, 0x71u, v25, v26)) {
      goto LABEL_50;
    }
LABEL_41:
    unsigned int v27 = [(VKIconModifiers *)v14 zoom];
    if (v27 >= 0x17) {
      unsigned int v28 = 23;
    }
    else {
      unsigned int v28 = v27;
    }
    gss::RenderStyle<gss::PropertyID>::valueForKeyAtZ<std::string>(&__p, *(void *)(v89[0] + 24), 0x71u, v28, 1);
    std::string::size_type size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0) {
      std::string::size_type size = __p.__r_.__value_.__l.__size_;
    }
    if (size)
    {
      unsigned int v30 = grl::IconManager::identifierForName((uint64_t)self->_iconManager.__ptr_, (uint64_t)&__p, a5);
      if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0) {
        goto LABEL_49;
      }
    }
    else
    {
      unsigned int v30 = 0;
      if ((*((unsigned char *)&__p.__r_.__value_.__s + 23) & 0x80) == 0)
      {
LABEL_49:
        if (v30) {
          goto LABEL_66;
        }
LABEL_50:
        unsigned int v31 = [(VKIconModifiers *)v14 zoom];
        uint64_t v32 = *(void *)(v89[0] + 24);
        if (v31 >= 0x17) {
          unsigned int v33 = 23;
        }
        else {
          unsigned int v33 = v31;
        }
        unsigned int v34 = *(unsigned __int8 *)(v32 + 12);
        if (v34 == 2)
        {
          __p.__r_.__value_.__s.__data_[0] = 1;
          LOBYTE(v81) = 1;
          unsigned int v35 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v32, 0xBAu, v33, 0, &__p);
          gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v32, 0xBAu, v33, 1u, &v81);
          if (v35) {
            goto LABEL_55;
          }
        }
        else
        {
          unsigned int v35 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(*(void *)(v89[0] + 24), 0xBAu, v33, v34, 0);
          if (v35)
          {
LABEL_55:
            uint64_t v36 = 0;
            unint64_t v37 = 0;
            int v38 = 0;
            while (v37 < [v12 countAttrs])
            {
              if (*(_DWORD *)([v12 v] + v36) == v35) {
                int v38 = *(_DWORD *)([v12 v] + v36 + 4);
              }
              ++v37;
              v36 += 8;
            }
LABEL_65:
            unsigned int v30 = grl::IconManager::identifierForMapKeyValue((uint64_t)self->_iconManager.__ptr_, v35, v38, 1, a5);
            if (v30)
            {
LABEL_66:
              unsigned int v40 = [(VKIconModifiers *)v14 zoom];
              LOBYTE(v83) = 1;
              uint64_t v41 = *(void *)(v89[0] + 24);
              if (v40 >= 0x17) {
                unsigned int v42 = 23;
              }
              else {
                unsigned int v42 = v40;
              }
              unsigned int v43 = *(unsigned __int8 *)(v41 + 12);
              if (v43 == 2)
              {
                __p.__r_.__value_.__s.__data_[0] = 1;
                LOBYTE(v81) = 1;
                int v44 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v41, 0x16Cu, v42, 0, &__p);
                gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v41, 0x16Cu, v42, 1u, &v81);
                int v45 = (__p.__r_.__value_.__s.__data_[0] | v81) != 0;
              }
              else
              {
                int v44 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(*(void *)(v89[0] + 24), 0x16Cu, v42, v43, &v83);
                int v45 = v83;
              }
              __int16 v46 = [(VKIconModifiers *)v14 variant];
              if (v45) {
                __int16 v47 = v44;
              }
              else {
                __int16 v47 = v46;
              }
              unsigned int v48 = [(VKIconModifiers *)v14 zoom];
              LOBYTE(v83) = 1;
              uint64_t v49 = *(void *)(v89[0] + 24);
              if (v48 >= 0x17) {
                unsigned int v50 = 23;
              }
              else {
                unsigned int v50 = v48;
              }
              unsigned int v51 = *(unsigned __int8 *)(v49 + 12);
              if (v51 == 2)
              {
                __p.__r_.__value_.__s.__data_[0] = 1;
                LOBYTE(v81) = 1;
                int v52 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v49, 0x174u, v50, 0, &__p);
                gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v49, 0x174u, v50, 1u, &v81);
                int v53 = (__p.__r_.__value_.__s.__data_[0] | v81) != 0;
              }
              else
              {
                int v52 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(*(void *)(v89[0] + 24), 0x174u, v50, v51, &v83);
                int v53 = v83;
              }
              __int16 v54 = [(VKIconModifiers *)v14 secondaryVariant];
              if (v53) {
                __int16 v55 = v52;
              }
              else {
                __int16 v55 = v54;
              }
              unsigned int v56 = [(VKIconModifiers *)v14 zoom];
              uint64_t v57 = *(void *)(v89[0] + 24);
              if (v56 >= 0x17) {
                unsigned int v58 = 23;
              }
              else {
                unsigned int v58 = v56;
              }
              unsigned int v59 = *(unsigned __int8 *)(v57 + 12);
              if (v59 == 2)
              {
                if (gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(void *)(v89[0] + 24), 0x162u, v58, 0))goto LABEL_92; {
                unsigned int v59 = 1;
                }
              }
              if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v57, 0x162u, v58, v59))
              {
                LOBYTE(cntrl) = +[VKInternalIconManager convertSizeGroup:cntrl];
                goto LABEL_99;
              }
LABEL_92:
              unsigned int v60 = [(VKIconModifiers *)v14 zoom];
              uint64_t v61 = *(void *)(v89[0] + 24);
              if (v60 >= 0x17) {
                unsigned int v62 = 23;
              }
              else {
                unsigned int v62 = v60;
              }
              unsigned int v63 = *(unsigned __int8 *)(v61 + 12);
              if (v63 == 2)
              {
                __p.__r_.__value_.__s.__data_[0] = 1;
                LOBYTE(v81) = 1;
                LODWORD(cntrl) = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v61, 0x162u, v62, 0, &__p);
                gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(v61, 0x162u, v62, 1u, &v81);
              }
              else
              {
                LODWORD(cntrl) = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<unsigned int>(*(void *)(v89[0] + 24), 0x162u, v62, v63, 0);
              }
LABEL_99:
              unsigned int v64 = [(VKIconModifiers *)v14 zoom];
              uint64_t v65 = *(void *)(v89[0] + 24);
              if (v64 >= 0x17) {
                unsigned int v66 = 23;
              }
              else {
                unsigned int v66 = v64;
              }
              unsigned int v67 = *(unsigned __int8 *)(v65 + 12);
              if (v67 == 2)
              {
                if (gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(*(void *)(v89[0] + 24), 0xDAu, v66, 0))
                {
LABEL_106:
                  long long v68 = [(VKIconModifiers *)v14 cppModifiers];
                  unsigned int v69 = [(VKIconModifiers *)v14 zoom];
                  uint64_t v70 = *(void *)(v89[0] + 24);
                  if (v69 >= 0x17) {
                    unsigned int v71 = 23;
                  }
                  else {
                    unsigned int v71 = v69;
                  }
                  unsigned int v72 = *(unsigned __int8 *)(v70 + 12);
                  if (v72 == 2)
                  {
                    __p.__r_.__value_.__s.__data_[0] = 1;
                    LOBYTE(v81) = 1;
                    int v73 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v70, 0xDAu, v71, 0, &__p);
                    gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(v70, 0xDAu, v71, 1u, &v81);
                  }
                  else
                  {
                    int v73 = *gss::RenderStyle<gss::PropertyID>::styleValueForKeyAtZ<float>(*(void *)(v89[0] + 24), 0xDAu, v71, v72, 0);
                  }
                  grl::IconModifiers::setOpacity(v68, *(float *)&v73);
LABEL_113:
                  unsigned __int16 v88 = 0;
                  uint64_t ValueForAttributeKey = gss::FeatureAttributeSet::getValueForAttributeKey(v92, 4, &v88);
                  if ((ValueForAttributeKey & 1) == 0) {
                    unsigned __int16 v88 = -1;
                  }
                  LODWORD(__p.__r_.__value_.__l.__data_) = 1065353216;
                  __p.__r_.__value_.__s.__data_[4] = 4;
                  WORD1(__p.__r_.__value_.__r.__words[1]) = -1;
                  *(_DWORD *)((char *)__p.__r_.__value_.__r.__words + 6) = 0;
                  __p.__r_.__value_.__s.__data_[12] = 0;
                  uint64_t v85 = 0;
                  uint64_t v86 = 0;
                  __p.__r_.__value_.__r.__words[2] = 0;
                  uint64_t v87 = grl::Allocator::instance((grl::Allocator *)ValueForAttributeKey);
                  grl::IconRequestOptions::setContentScale((float *)&__p, a5);
                  grl::IconRequestOptions::setSizeGroup((uint64_t)&__p, (char)cntrl);
                  grl::IconRequestOptions::setVariant((uint64_t)&__p, v47);
                  grl::IconRequestOptions::setDataVariant((uint64_t)&__p, v55);
                  grl::IconRequestOptions::setCountryCode((uint64_t)&__p, v88);
                  v75 = self->_iconManager.__ptr_;
                  v76 = [(VKIconModifiers *)v14 cppModifiers];
                  v82[0] = 0;
                  v82[1] = grl::Allocator::instance(v76);
                  v82[2] = 0;
                  v81 = v82;
                  grl::IconManager::imageForIconID((uint64_t)v75, v30, (uint64_t)v76, (uint64_t)&__p);
                }
                unsigned int v67 = 1;
              }
              if (!gss::RenderStyle<gss::PropertyID>::hasValueForKeyAtZAtEnd(v65, 0xDAu, v66, v67)) {
                goto LABEL_113;
              }
              goto LABEL_106;
            }
            goto LABEL_71;
          }
        }
        int v38 = 0;
        goto LABEL_65;
      }
    }
    operator delete(__p.__r_.__value_.__l.__data_);
    goto LABEL_49;
  }
LABEL_71:
  BOOL v20 = (gss::Allocator *)gss::QueryableLocker<gss::PropertyID>::~QueryableLocker((uint64_t)v89);
  long long v39 = (std::__shared_weak_count *)*((void *)&v91 + 1);
  if (*((void *)&v91 + 1))
  {
LABEL_117:
    if (!atomic_fetch_add(&v39->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
      std::__shared_weak_count::__release_weak(v39);
    }
  }
LABEL_119:
  if (v92[0])
  {
    v92[1] = v92[0];
    BOOL v20 = (gss::Allocator *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v93 + 40))(v93, v92[0], v92[2] - v92[0]);
  }
  if (!v94[14])
  {
    uint64_t v77 = *(void *)v94;
    if (*(void *)v94)
    {
      uint64_t v78 = gss::Allocator::instance(v20);
      (*(void (**)(uint64_t, uint64_t, void))(*(void *)v78 + 40))(v78, v77, *(unsigned __int16 *)&v94[12]);
    }
  }
LABEL_124:

  return 0;
}

+ (unsigned)convertSizeGroup:(int64_t)a3
{
  if ((unint64_t)a3 >= 0xA) {
    return 4;
  }
  else {
    return a3;
  }
}

+ (int64_t)convertGrlSizeGroup:(unsigned __int8)a3
{
  if (a3 >= 0xAu) {
    return 4;
  }
  else {
    return a3;
  }
}

- (void)_startTileGroupObserver
{
  objc_destroyWeak((id *)(a1 + 8));
  JUMPOUT(0x1A6239270);
}

- (VKInternalIconManager)init
{
  v16.receiver = self;
  v16.super_class = (Class)VKInternalIconManager;
  v2 = [(VKInternalIconManager *)&v16 init];
  v3 = v2;
  v4 = v2;
  if (v2)
  {
    v2->_isSharedIconManager = 0;
    v15.__cntrl_ = (__shared_weak_count *)objc_alloc_init(VKResourceManager);
    objc_storeStrong((id *)&v3->_resourceManager._obj, v15.__cntrl_);
    v5 = v15.__cntrl_;
    cntrl = v15.__cntrl_;
    v15.__cntrl_ = 0;

    v15.__ptr_ = (StylesheetVendor *)&unk_1EF559758;
    v7 = v4->_resourceManager._obj;
    std::allocate_shared[abi:nn180100]<md::StylesheetVendor,std::allocator<md::StylesheetVendor>,VKResourceManager * {__strong},void>(&v15, v7);
    shared_ptr<md::StylesheetVendor> v8 = v15;
    shared_ptr<md::StylesheetVendor> v15 = (shared_ptr<md::StylesheetVendor>)0;
    v9 = (std::__shared_weak_count *)v4->_stylesheetVendor.__cntrl_;
    v4->_stylesheetVendor = v8;
    if (v9 && !atomic_fetch_add(&v9->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
    v10 = (std::__shared_weak_count *)v15.__cntrl_;
    if (v15.__cntrl_ && !atomic_fetch_add((atomic_ullong *volatile)v15.__cntrl_ + 1, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }

    md::StylesheetVendor::setupTileGroupObservationProxy((md::StylesheetVendor *)v4->_stylesheetVendor.__ptr_);
    v11 = operator new(0x170uLL);
    v11[1] = 0;
    v11[2] = 0;
    void *v11 = &unk_1EF580C60;
    id v12 = md::GeoResourceProvider::GeoResourceProvider((md::GeoResourceProvider *)(v11 + 3));
    id v13 = (std::__shared_weak_count *)v4->_resourceProvider.__cntrl_;
    v4->_resourceProvider.__ptr_ = (GeoResourceProvider *)v12;
    v4->_resourceProvider.__cntrl_ = (__shared_weak_count *)v11;
    if (v13)
    {
      if (!atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
      {
        ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
        std::__shared_weak_count::__release_weak(v13);
      }
    }
    operator new();
  }

  return 0;
}

- (id)init:(shared_ptr<grl:(shared_ptr<md::StylesheetVendor>)a4 :IconManager>)a3 stylesheetVendor:
{
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v16.receiver = self;
  v16.super_class = (Class)VKInternalIconManager;
  v6 = [(VKInternalIconManager *)&v16 init];
  v7 = v6;
  if (v6)
  {
    v6->_isSharedIconManager = 1;
    v9 = *(IconManager **)ptr;
    uint64_t v8 = *((void *)ptr + 1);
    if (v8) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v8 + 8), 1uLL, memory_order_relaxed);
    }
    v10 = (std::__shared_weak_count *)v6->_iconManager.__cntrl_;
    v6->_iconManager.__ptr_ = v9;
    v6->_iconManager.__cntrl_ = (__shared_weak_count *)v8;
    if (v10 && !atomic_fetch_add(&v10->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
    id v12 = *(StylesheetVendor **)cntrl;
    uint64_t v11 = *((void *)cntrl + 1);
    if (v11) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v11 + 8), 1uLL, memory_order_relaxed);
    }
    id v13 = (std::__shared_weak_count *)v7->_stylesheetVendor.__cntrl_;
    v7->_stylesheetVendor.__ptr_ = v12;
    v7->_stylesheetVendor.__cntrl_ = (__shared_weak_count *)v11;
    if (v13 && !atomic_fetch_add(&v13->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
    [(VKInternalIconManager *)v7 _startTileGroupObserver];
    id v14 = v7;
  }

  return v7;
}

- (id).cxx_construct
{
  *(_OWORD *)&self->_nameToStyleManagerLock._lock.__sig = 0u;
  p_nameToStyleManagerLock = &self->_nameToStyleManagerLock;
  *(void *)&p_nameToStyleManagerLock->_lock.__opaque[184] = 0;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[152] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[168] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[120] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[136] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[88] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[104] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[56] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[72] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[24] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[40] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock->_lock.__opaque[8] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock[-1]._lock.__opaque[160] = 0u;
  *(_OWORD *)&p_nameToStyleManagerLock[-1]._lock.__opaque[176] = 0u;
  v4 = (geo::read_write_lock *)pthread_rwlock_init(&p_nameToStyleManagerLock->_lock, 0);
  if (v4) {
    geo::read_write_lock::logFailure(v4, (uint64_t)"initialization", v5);
  }
  self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_ = 0;
  p_pair1 = &self->_nameToStyleManager.__tree_.__pair1_;
  v7 = &md::SignedDistanceFieldGenerator::_hypotCache[32854];
  {
    v7 = md::SignedDistanceFieldGenerator::_hypotCache + 131416;
    p_pair1 = &self->_nameToStyleManager.__tree_.__pair1_;
    if (v9) {
      operator new();
    }
  }
  self->_nameToStyleManager.__tree_.__pair1_.__value__2._allocator = (Allocator *)*((void *)v7 + 91);
  self->_nameToStyleManager.__tree_.__pair3_.__value_ = 0;
  self->_nameToStyleManager.__tree_.__begin_node_ = p_pair1;
  self->_manifestTileGroupObserverProxy._vptr$_retain_ptr = (void **)&unk_1EF559CF8;
  self->_manifestTileGroupObserverProxy._obj = 0;
  self->_resourceManager._vptr$_retain_ptr = (void **)&unk_1EF559758;
  self->_resourceManager._obj = 0;
  self->_resourceProvider = 0u;
  self->_fontManager = 0u;
  return self;
}

- (void).cxx_destruct
{
  cntrl = self->_fontManager.__cntrl_;
  if (cntrl && !atomic_fetch_add((atomic_ullong *volatile)cntrl + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)cntrl + 16))(cntrl, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    v4 = self->_resourceProvider.__cntrl_;
    if (!v4) {
      goto LABEL_7;
    }
  }
  else
  {
    v4 = self->_resourceProvider.__cntrl_;
    if (!v4) {
      goto LABEL_7;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v4 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *, SEL))(*(void *)v4 + 16))(v4, a2);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v4);
  }
LABEL_7:
  self->_resourceManager._vptr$_retain_ptr = (void **)&unk_1EF559758;

  self->_manifestTileGroupObserverProxy._vptr$_retain_ptr = (void **)&unk_1EF559CF8;
  std::__tree<std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,std::__map_value_compare<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,NSStringMapComparison,true>,geo::StdAllocator<std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,mdm::Allocator>>::destroy((uint64_t)&self->_nameToStyleManager, (uint64_t)self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_);
  v5 = (geo::read_write_lock *)pthread_rwlock_destroy(&self->_nameToStyleManagerLock._lock);
  if (v5) {
    geo::read_write_lock::logFailure(v5, (uint64_t)"destruction", v6);
  }
  v7 = self->_stylesheetVendor.__cntrl_;
  if (v7 && !atomic_fetch_add((atomic_ullong *volatile)v7 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v7 + 16))(v7);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v7);
    uint64_t v8 = self->_iconManager.__cntrl_;
    if (!v8) {
      return;
    }
  }
  else
  {
    uint64_t v8 = self->_iconManager.__cntrl_;
    if (!v8) {
      return;
    }
  }
  if (!atomic_fetch_add((atomic_ullong *volatile)v8 + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    (*(void (**)(__shared_weak_count *))(*(void *)v8 + 16))(v8);
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v8);
  }
}

- (void)purgeNonsharedResources
{
  if (!self->_isSharedIconManager)
  {
    [(VKInternalIconManager *)self purge];
    ptr = self->_stylesheetVendor.__ptr_;
    if (ptr)
    {
      md::StylesheetVendor::resetStylesheetCache((os_unfair_lock_s *)ptr);
    }
  }
}

- (void)purge
{
  ptr = self->_iconManager.__ptr_;
  if (ptr) {
    grl::IconManager::removeAllPacks((grl::IconManager *)ptr);
  }
  [(VKInternalIconManager *)self _purgeStyleManagers];
}

- (void)dealloc
{
  [(VKInternalIconManager *)self purge];
  v3.receiver = self;
  v3.super_class = (Class)VKInternalIconManager;
  [(VKInternalIconManager *)&v3 dealloc];
}

- (void)setIsCachingAtlases:(BOOL)a3
{
  *((unsigned char *)self->_iconManager.__ptr_ + 88) = !a3;
}

- (BOOL)isCachingAtlases
{
  ptr = self->_iconManager.__ptr_;
  return ptr && *((unsigned char *)ptr + 88) == 0;
}

- (unsigned)darkVariant
{
  return 3;
}

- (unsigned)trafficIncidentTypeKey
{
  return 65544;
}

- (unsigned)styleAttributeTransitSystemTypeKey
{
  return 49;
}

- (unsigned)styleAttributeTransitTypeKey
{
  return 37;
}

- (id)imageForName:(id)a3 contentScale:(float)a4 sizeGroup:(int64_t)a5 modifiers:(id)a6
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  uint64_t v11 = (grl::Allocator *)a6;
  id v12 = v11;
  if (!v10)
  {
    id v18 = 0;
    goto LABEL_53;
  }
  long long v61 = 0uLL;
  int v52 = 1065353216;
  char v53 = 4;
  __int16 v55 = -1;
  int v54 = 0;
  char v56 = 0;
  uint64_t v58 = 0;
  uint64_t v59 = 0;
  uint64_t v57 = 0;
  uint64_t v60 = grl::Allocator::instance(v11);
  grl::IconRequestOptions::setContentScale((float *)&v52, a4);
  grl::IconRequestOptions::setSizeGroup((uint64_t)&v52, +[VKInternalIconManager convertSizeGroup:a5]);
  if (!v12)
  {
    ptr = self->_iconManager.__ptr_;
    BOOL v20 = (const char *)[v10 UTF8String];
    size_t v21 = strlen(v20);
    if (v21 > 0x7FFFFFFFFFFFFFF7) {
      abort();
    }
    v22 = (void *)v21;
    if (v21 >= 0x17)
    {
      uint64_t v30 = (v21 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v21 | 7) != 0x17) {
        uint64_t v30 = v21 | 7;
      }
      uint64_t v31 = v30 + 1;
      unsigned int v23 = operator new(v30 + 1);
      __p[1] = v22;
      unint64_t v50 = v31 | 0x8000000000000000;
      __p[0] = v23;
    }
    else
    {
      HIBYTE(v50) = v21;
      unsigned int v23 = __p;
      if (!v21)
      {
LABEL_27:
        *((unsigned char *)v22 + (void)v23) = 0;
        __dst = 0;
        long long v64 = 0u;
        uint64_t v71 = 0;
        memset(v70, 0, sizeof(v70));
        long long v67 = 0u;
        long long v68 = 0u;
        long long v65 = 0u;
        long long v66 = 0u;
        __asm { FMOV            V0.2S, #1.0 }
        size_t __dst_8 = _D0;
        BYTE14(v64) = 0;
        long long v69 = 0uLL;
        *((void *)&v69 + 1) = grl::Allocator::instance((grl::Allocator *)v21);
        memset(v70, 0, 56);
        *((void *)&v68 + 1) = &v69;
        uint64_t v71 = 0;
        grl::IconManager::imageForName((uint64_t)ptr, (uint64_t)__p, (uint64_t)&__dst, (float *)&v52, 0, &v51);
        long long v37 = v51;
        long long v51 = 0uLL;
        int v38 = (std::__shared_weak_count *)*((void *)&v61 + 1);
        long long v61 = v37;
        if (v38 && !atomic_fetch_add(&v38->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
          std::__shared_weak_count::__release_weak(v38);
        }
        long long v39 = (std::__shared_weak_count *)*((void *)&v51 + 1);
        if (*((void *)&v51 + 1)
          && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v51 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
          std::__shared_weak_count::__release_weak(v39);
        }
        grl::IconModifiers::~IconModifiers((grl::IconModifiers *)&__dst);
        if ((SHIBYTE(v50) & 0x80000000) == 0) {
          goto LABEL_36;
        }
        uint64_t v29 = __p[0];
        goto LABEL_35;
      }
    }
    size_t v21 = (size_t)memmove(v23, v20, (size_t)v22);
    goto LABEL_27;
  }
  grl::IconRequestOptions::setVariant((uint64_t)&v52, [(grl::Allocator *)v12 variant]);
  grl::IconRequestOptions::setDataVariant((uint64_t)&v52, [(grl::Allocator *)v12 secondaryVariant]);
  grl::IconRequestOptions::setCountryCode((uint64_t)&v52, [(grl::Allocator *)v12 countryCode]);
  id v13 = self->_iconManager.__ptr_;
  id v14 = (const char *)[v10 UTF8String];
  size_t v15 = strlen(v14);
  if (v15 > 0x7FFFFFFFFFFFFFF7) {
    abort();
  }
  size_t v16 = v15;
  if (v15 >= 0x17)
  {
    uint64_t v24 = (v15 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v15 | 7) != 0x17) {
      uint64_t v24 = v15 | 7;
    }
    uint64_t v25 = v24 + 1;
    p_dst = operator new(v24 + 1);
    size_t __dst_8 = v16;
    *(void *)&long long v64 = v25 | 0x8000000000000000;
    __dst = p_dst;
  }
  else
  {
    BYTE7(v64) = v15;
    p_dst = &__dst;
    if (!v15) {
      goto LABEL_16;
    }
  }
  memmove(p_dst, v14, v16);
LABEL_16:
  *((unsigned char *)p_dst + v16) = 0;
  grl::IconManager::imageForName((uint64_t)v13, (uint64_t)&__dst, [(grl::Allocator *)v12 cppModifiers], (float *)&v52, 0, __p);
  long long v26 = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  unsigned int v27 = (std::__shared_weak_count *)*((void *)&v61 + 1);
  long long v61 = v26;
  if (v27 && !atomic_fetch_add(&v27->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
  unsigned int v28 = (std::__shared_weak_count *)__p[1];
  if (__p[1] && !atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
    std::__shared_weak_count::__release_weak(v28);
    if ((SBYTE7(v64) & 0x80000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_22;
  }
  if (SBYTE7(v64) < 0)
  {
LABEL_22:
    uint64_t v29 = __dst;
LABEL_35:
    operator delete(v29);
  }
LABEL_36:
  id v18 = (id)v61;
  if ((void)v61)
  {
    unsigned int v40 = [VKIconImage alloc];
    id v47 = v18;
    unsigned int v48 = (std::__shared_weak_count *)*((void *)&v61 + 1);
    if (*((void *)&v61 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v61 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    id v18 = [(VKIconImage *)v40 init:&v47];
    uint64_t v41 = v48;
    if (v48 && !atomic_fetch_add(&v48->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
      std::__shared_weak_count::__release_weak(v41);
    }
  }
  uint64_t v42 = v57;
  if (v57)
  {
    uint64_t v43 = v58;
    uint64_t v44 = v57;
    if (v58 != v57)
    {
      do
      {
        if (*(char *)(v43 - 1) < 0) {
          operator delete(*(void **)(v43 - 24));
        }
        v43 -= 24;
      }
      while (v43 != v42);
      uint64_t v44 = v57;
    }
    uint64_t v58 = v42;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v60 + 40))(v60, v44, v59 - v44);
  }
  int v45 = (std::__shared_weak_count *)*((void *)&v61 + 1);
  if (*((void *)&v61 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v61 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }
LABEL_53:

  return v18;
}

- (id)imageForKey:(unsigned int)a3 value:(unsigned int)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v12 = (grl::Allocator *)a7;
  long long v41 = 0uLL;
  int v32 = 1065353216;
  char v33 = 4;
  __int16 v35 = -1;
  int v34 = 0;
  char v36 = 0;
  uint64_t v38 = 0;
  uint64_t v39 = 0;
  uint64_t v37 = 0;
  uint64_t v40 = grl::Allocator::instance(v12);
  grl::IconRequestOptions::setContentScale((float *)&v32, a5);
  id v13 = (grl::Allocator *)grl::IconRequestOptions::setSizeGroup((uint64_t)&v32, +[VKInternalIconManager convertSizeGroup:a6]);
  if (!v12)
  {
    *(void *)&long long v42 = 0;
    long long v43 = 0u;
    memset(v49, 0, sizeof(v49));
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    __asm { FMOV            V0.2S, #1.0 }
    *((void *)&v42 + 1) = _D0;
    BYTE14(v43) = 0;
    long long v48 = 0uLL;
    *((void *)&v48 + 1) = grl::Allocator::instance(v13);
    memset(v49, 0, 56);
    *((void *)&v47 + 1) = &v48;
    uint64_t v50 = 0;
    grl::IconManager::imageForKeyValue((uint64_t)self->_iconManager.__ptr_, a3, a4, (const grl::IconModifiers *)&v42, (float *)&v32, 0, &v31);
    id v14 = (std::__shared_weak_count *)*((void *)&v31 + 1);
    uint64_t v15 = v31;
    long long v41 = v31;
    grl::IconModifiers::~IconModifiers((grl::IconModifiers *)&v42);
    if (v15) {
      goto LABEL_3;
    }
LABEL_9:
    id v17 = 0;
    goto LABEL_10;
  }
  grl::IconRequestOptions::setVariant((uint64_t)&v32, [(grl::Allocator *)v12 variant]);
  grl::IconRequestOptions::setDataVariant((uint64_t)&v32, [(grl::Allocator *)v12 secondaryVariant]);
  grl::IconRequestOptions::setCountryCode((uint64_t)&v32, [(grl::Allocator *)v12 countryCode]);
  grl::IconManager::imageForKeyValue((uint64_t)self->_iconManager.__ptr_, a3, a4, (const grl::IconModifiers *)[(grl::Allocator *)v12 cppModifiers], (float *)&v32, 0, &v42);
  id v14 = (std::__shared_weak_count *)*((void *)&v42 + 1);
  uint64_t v15 = v42;
  long long v41 = v42;
  if (!(void)v42) {
    goto LABEL_9;
  }
LABEL_3:
  size_t v16 = [VKIconImage alloc];
  uint64_t v29 = v15;
  uint64_t v30 = v14;
  if (v14) {
    atomic_fetch_add_explicit(&v14->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  id v17 = [(VKIconImage *)v16 init:&v29];
  id v18 = v30;
  if (v30 && !atomic_fetch_add(&v30->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
    std::__shared_weak_count::__release_weak(v18);
  }
LABEL_10:
  uint64_t v24 = v37;
  if (v37)
  {
    uint64_t v25 = v38;
    uint64_t v26 = v37;
    if (v38 != v37)
    {
      do
      {
        if (*(char *)(v25 - 1) < 0) {
          operator delete(*(void **)(v25 - 24));
        }
        v25 -= 24;
      }
      while (v25 != v24);
      uint64_t v26 = v37;
    }
    uint64_t v38 = v24;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v40 + 40))(v40, v26, v39 - v26);
  }
  unsigned int v27 = (std::__shared_weak_count *)*((void *)&v41 + 1);
  if (*((void *)&v41 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v41 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }

  return v17;
}

- (id)imageForDataID:(unsigned int)a3 text:(id)a4 contentScale:(float)a5 sizeGroup:(int64_t)a6 modifiers:(id)a7
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = (grl::Allocator *)a7;
  long long v65 = 0uLL;
  int v56 = 1065353216;
  char v57 = 4;
  __int16 v59 = -1;
  int v58 = 0;
  char v60 = 0;
  uint64_t v62 = 0;
  uint64_t v63 = 0;
  uint64_t v61 = 0;
  uint64_t v64 = grl::Allocator::instance(v13);
  grl::IconRequestOptions::setContentScale((float *)&v56, a5);
  id v14 = (grl::Allocator *)grl::IconRequestOptions::setSizeGroup((uint64_t)&v56, +[VKInternalIconManager convertSizeGroup:a6]);
  if (!v12)
  {
    if (v13)
    {
      grl::IconRequestOptions::setVariant((uint64_t)&v56, [(grl::Allocator *)v13 variant]);
      grl::IconRequestOptions::setDataVariant((uint64_t)&v56, [(grl::Allocator *)v13 secondaryVariant]);
      grl::IconRequestOptions::setCountryCode((uint64_t)&v56, [(grl::Allocator *)v13 countryCode]);
      grl::IconManager::imageForDataID((uint64_t)self->_iconManager.__ptr_, a3, [(grl::Allocator *)v13 cppModifiers], (float *)&v56, 0, &__dst);
      long long v65 = __dst;
      id v20 = (id)__dst;
      if (!(void)__dst) {
        goto LABEL_45;
      }
      goto LABEL_40;
    }
    ptr = self->_iconManager.__ptr_;
    *(void *)&long long __dst = 0;
    long long v67 = 0u;
    long long v74 = 0u;
    memset(v73, 0, sizeof(v73));
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    __asm { FMOV            V0.2S, #1.0 }
    *((void *)&__dst + 1) = _D0;
    BYTE14(v67) = 0;
    long long v72 = 0uLL;
    *((void *)&v72 + 1) = grl::Allocator::instance(v14);
    memset(v73, 0, 56);
    *((void *)&v71 + 1) = &v72;
    uint64_t v75 = 0;
    grl::IconManager::imageForDataID((uint64_t)ptr, a3, (uint64_t)&__dst, (float *)&v56, 0, __p);
    long long v37 = *(_OWORD *)__p;
    __p[0] = 0;
    __p[1] = 0;
    long long v65 = v37;
    grl::IconModifiers::~IconModifiers((grl::IconModifiers *)&__dst);
    goto LABEL_39;
  }
  if (!v13)
  {
    size_t v21 = self->_iconManager.__ptr_;
    v22 = (const char *)[v12 UTF8String];
    size_t v23 = strlen(v22);
    if (v23 > 0x7FFFFFFFFFFFFFF7) {
      abort();
    }
    uint64_t v24 = (void *)v23;
    if (v23 >= 0x17)
    {
      uint64_t v38 = (v23 & 0xFFFFFFFFFFFFFFF8) + 8;
      if ((v23 | 7) != 0x17) {
        uint64_t v38 = v23 | 7;
      }
      uint64_t v39 = v38 + 1;
      uint64_t v25 = operator new(v38 + 1);
      __p[1] = v24;
      unint64_t v54 = v39 | 0x8000000000000000;
      __p[0] = v25;
    }
    else
    {
      HIBYTE(v54) = v23;
      uint64_t v25 = __p;
      if (!v23)
      {
LABEL_30:
        *((unsigned char *)v24 + (void)v25) = 0;
        *(void *)&long long __dst = 0;
        long long v67 = 0u;
        uint64_t v75 = 0;
        long long v74 = 0u;
        memset(v73, 0, sizeof(v73));
        long long v70 = 0u;
        long long v71 = 0u;
        long long v68 = 0u;
        long long v69 = 0u;
        __asm { FMOV            V0.2S, #1.0 }
        *((void *)&__dst + 1) = _D0;
        BYTE14(v67) = 0;
        long long v72 = 0uLL;
        *((void *)&v72 + 1) = grl::Allocator::instance((grl::Allocator *)v23);
        memset(v73, 0, 56);
        *((void *)&v71 + 1) = &v72;
        uint64_t v75 = 0;
        grl::IconManager::imageForDataIDAndText((uint64_t)v21, a3, (char *)__p, (uint64_t)&__dst, (float *)&v56, 0, &v55);
        long long v41 = v55;
        long long v55 = 0uLL;
        long long v42 = (std::__shared_weak_count *)*((void *)&v65 + 1);
        long long v65 = v41;
        if (v42 && !atomic_fetch_add(&v42->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v42->__on_zero_shared)(v42);
          std::__shared_weak_count::__release_weak(v42);
        }
        long long v43 = (std::__shared_weak_count *)*((void *)&v55 + 1);
        if (*((void *)&v55 + 1)
          && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v55 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
        {
          ((void (*)(std::__shared_weak_count *))v43->__on_zero_shared)(v43);
          std::__shared_weak_count::__release_weak(v43);
        }
        grl::IconModifiers::~IconModifiers((grl::IconModifiers *)&__dst);
        if (SHIBYTE(v54) < 0) {
          operator delete(__p[0]);
        }
        goto LABEL_39;
      }
    }
    size_t v23 = (size_t)memmove(v25, v22, (size_t)v24);
    goto LABEL_30;
  }
  grl::IconRequestOptions::setVariant((uint64_t)&v56, [(grl::Allocator *)v13 variant]);
  grl::IconRequestOptions::setDataVariant((uint64_t)&v56, [(grl::Allocator *)v13 secondaryVariant]);
  grl::IconRequestOptions::setCountryCode((uint64_t)&v56, [(grl::Allocator *)v13 countryCode]);
  uint64_t v15 = self->_iconManager.__ptr_;
  size_t v16 = (const char *)[v12 UTF8String];
  size_t v17 = strlen(v16);
  if (v17 > 0x7FFFFFFFFFFFFFF7) {
    abort();
  }
  size_t v18 = v17;
  if (v17 >= 0x17)
  {
    uint64_t v26 = (v17 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v17 | 7) != 0x17) {
      uint64_t v26 = v17 | 7;
    }
    uint64_t v27 = v26 + 1;
    p_dst = (long long *)operator new(v26 + 1);
    *((void *)&__dst + 1) = v18;
    *(void *)&long long v67 = v27 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
    goto LABEL_17;
  }
  BYTE7(v67) = v17;
  p_dst = &__dst;
  if (v17) {
LABEL_17:
  }
    memmove(p_dst, v16, v18);
  *((unsigned char *)p_dst + v18) = 0;
  grl::IconManager::imageForDataIDAndText((uint64_t)v15, a3, (char *)&__dst, [(grl::Allocator *)v13 cppModifiers], (float *)&v56, 0, __p);
  long long v28 = *(_OWORD *)__p;
  __p[0] = 0;
  __p[1] = 0;
  uint64_t v29 = (std::__shared_weak_count *)*((void *)&v65 + 1);
  long long v65 = v28;
  if (v29 && !atomic_fetch_add(&v29->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
    std::__shared_weak_count::__release_weak(v29);
  }
  uint64_t v30 = (std::__shared_weak_count *)__p[1];
  if (!__p[1] || atomic_fetch_add((atomic_ullong *volatile)__p[1] + 1, 0xFFFFFFFFFFFFFFFFLL))
  {
    if ((SBYTE7(v67) & 0x80000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_24;
  }
  ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
  std::__shared_weak_count::__release_weak(v30);
  if (SBYTE7(v67) < 0) {
LABEL_24:
  }
    operator delete((void *)__dst);
LABEL_39:
  id v20 = (id)v65;
  if (!(void)v65) {
    goto LABEL_45;
  }
LABEL_40:
  long long v44 = [VKIconImage alloc];
  id v51 = v20;
  int v52 = (std::__shared_weak_count *)*((void *)&v65 + 1);
  if (*((void *)&v65 + 1)) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v65 + 1) + 8), 1uLL, memory_order_relaxed);
  }
  id v20 = [(VKIconImage *)v44 init:&v51];
  long long v45 = v52;
  if (v52 && !atomic_fetch_add(&v52->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
    std::__shared_weak_count::__release_weak(v45);
  }
LABEL_45:
  uint64_t v46 = v61;
  if (v61)
  {
    uint64_t v47 = v62;
    uint64_t v48 = v61;
    if (v62 != v61)
    {
      do
      {
        if (*(char *)(v47 - 1) < 0) {
          operator delete(*(void **)(v47 - 24));
        }
        v47 -= 24;
      }
      while (v47 != v46);
      uint64_t v48 = v61;
    }
    uint64_t v62 = v46;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v64 + 40))(v64, v48, v63 - v48);
  }
  uint64_t v49 = (std::__shared_weak_count *)*((void *)&v65 + 1);
  if (*((void *)&v65 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v65 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
    std::__shared_weak_count::__release_weak(v49);
  }

  return v20;
}

- (id)imageForImageSourceKey:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  v4 = (grl::Allocator *)a3;
  int v42 = 1065353216;
  char v43 = 4;
  __int16 v45 = -1;
  int v44 = 0;
  char v46 = 0;
  uint64_t v48 = 0;
  uint64_t v49 = 0;
  uint64_t v47 = 0;
  uint64_t v50 = grl::Allocator::instance(v4);
  [(grl::Allocator *)v4 contentScale];
  grl::IconRequestOptions::setContentScale((float *)&v42, v5);
  grl::IconRequestOptions::setSizeGroup((uint64_t)&v42, +[VKInternalIconManager convertSizeGroup:[(grl::Allocator *)v4 sizeGroup]]);
  grl::IconRequestOptions::setVariant((uint64_t)&v42, [(grl::Allocator *)v4 variant]);
  grl::IconRequestOptions::setDataVariant((uint64_t)&v42, [(grl::Allocator *)v4 secondaryVariant]);
  grl::IconRequestOptions::setCountryCode((uint64_t)&v42, [(grl::Allocator *)v4 countryCode]);
  long long v41 = 0uLL;
  if ([(grl::Allocator *)v4 keyType] != 5)
  {
    if ([(grl::Allocator *)v4 keyType] != 2)
    {
      id v21 = 0;
      goto LABEL_28;
    }
    ptr = self->_iconManager.__ptr_;
    unsigned int v13 = [(grl::Allocator *)v4 iconAttributeKey];
    id v14 = (grl::Allocator *)[(grl::Allocator *)v4 iconAttributeValue];
    int v15 = (int)v14;
    uint64_t v51 = 0;
    long long v53 = 0u;
    long long v60 = 0u;
    memset(v59, 0, sizeof(v59));
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    __asm { FMOV            V0.2S, #1.0 }
    uint64_t v52 = _D0;
    BYTE14(v53) = 0;
    long long v58 = 0uLL;
    *((void *)&v58 + 1) = grl::Allocator::instance(v14);
    memset(v59, 0, 56);
    *((void *)&v57 + 1) = &v58;
    uint64_t v61 = 0;
    grl::IconManager::imageForKeyValue((uint64_t)ptr, v13, v15, (const grl::IconModifiers *)&v51, (float *)&v42, 0, &__dst);
    long long v35 = __dst;
    long long __dst = 0uLL;
    long long v41 = v35;
    grl::IconModifiers::~IconModifiers((grl::IconModifiers *)&v51);
    id v21 = (id)v35;
    if (!(void)v35) {
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  v6 = self->_iconManager.__ptr_;
  id v7 = [(grl::Allocator *)v4 imageName];
  uint64_t v8 = (const char *)[v7 UTF8String];
  size_t v9 = strlen(v8);
  if (v9 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v10 = v9;
  if (v9 >= 0x17)
  {
    uint64_t v22 = (v9 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v9 | 7) != 0x17) {
      uint64_t v22 = v9 | 7;
    }
    uint64_t v23 = v22 + 1;
    p_dst = (long long *)operator new(v22 + 1);
    *((void *)&__dst + 1) = v10;
    unint64_t v39 = v23 | 0x8000000000000000;
    *(void *)&long long __dst = p_dst;
  }
  else
  {
    HIBYTE(v39) = v9;
    p_dst = &__dst;
    if (!v9) {
      goto LABEL_14;
    }
  }
  size_t v9 = (size_t)memmove(p_dst, v8, v10);
LABEL_14:
  *((unsigned char *)p_dst + v10) = 0;
  uint64_t v51 = 0;
  long long v53 = 0u;
  uint64_t v61 = 0;
  long long v60 = 0u;
  memset(v59, 0, sizeof(v59));
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v52 = _D0;
  BYTE14(v53) = 0;
  long long v58 = 0uLL;
  *((void *)&v58 + 1) = grl::Allocator::instance((grl::Allocator *)v9);
  memset(v59, 0, 56);
  *((void *)&v57 + 1) = &v58;
  uint64_t v61 = 0;
  grl::IconManager::imageForName((uint64_t)v6, (uint64_t)&__dst, (uint64_t)&v51, (float *)&v42, 0, &v40);
  long long v25 = v40;
  long long v40 = 0uLL;
  uint64_t v26 = (std::__shared_weak_count *)*((void *)&v41 + 1);
  long long v41 = v25;
  if (v26 && !atomic_fetch_add(&v26->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
    std::__shared_weak_count::__release_weak(v26);
  }
  uint64_t v27 = (std::__shared_weak_count *)*((void *)&v40 + 1);
  if (*((void *)&v40 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v40 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
    std::__shared_weak_count::__release_weak(v27);
  }
  grl::IconModifiers::~IconModifiers((grl::IconModifiers *)&v51);
  if (SHIBYTE(v39) < 0) {
    operator delete((void *)__dst);
  }

  id v21 = (id)v41;
  if ((void)v41)
  {
LABEL_23:
    long long v28 = [VKIconImage alloc];
    id v36 = v21;
    long long v37 = (std::__shared_weak_count *)*((void *)&v41 + 1);
    if (*((void *)&v41 + 1)) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(*((void *)&v41 + 1) + 8), 1uLL, memory_order_relaxed);
    }
    id v21 = -[VKIconImage init:](v28, "init:", &v36, v35);
    uint64_t v29 = v37;
    if (v37 && !atomic_fetch_add(&v37->__shared_owners_, 0xFFFFFFFFFFFFFFFFLL))
    {
      ((void (*)(std::__shared_weak_count *))v29->__on_zero_shared)(v29);
      std::__shared_weak_count::__release_weak(v29);
    }
  }
LABEL_28:
  uint64_t v30 = (std::__shared_weak_count *)*((void *)&v41 + 1);
  if (*((void *)&v41 + 1)
    && !atomic_fetch_add((atomic_ullong *volatile)(*((void *)&v41 + 1) + 8), 0xFFFFFFFFFFFFFFFFLL))
  {
    ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
    std::__shared_weak_count::__release_weak(v30);
  }
  uint64_t v31 = v47;
  if (v47)
  {
    uint64_t v32 = v48;
    uint64_t v33 = v47;
    if (v48 != v47)
    {
      do
      {
        if (*(char *)(v32 - 1) < 0) {
          operator delete(*(void **)(v32 - 24));
        }
        v32 -= 24;
      }
      while (v32 != v31);
      uint64_t v33 = v47;
    }
    uint64_t v48 = v31;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)v50 + 40))(v50, v33, v49 - v33);
  }

  return v21;
}

- (void)_purgeStyleManagers
{
  p_nameToStyleManagerLock = &self->_nameToStyleManagerLock;
  v4 = (geo::read_write_lock *)pthread_rwlock_wrlock(&self->_nameToStyleManagerLock._lock);
  if (v4) {
    geo::read_write_lock::logFailure(v4, (uint64_t)"write lock", v5);
  }
  left = self->_nameToStyleManager.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_nameToStyleManager.__tree_.__pair1_;
  std::__tree<std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,std::__map_value_compare<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,NSStringMapComparison,true>,geo::StdAllocator<std::__value_type<geo::_retain_ptr<NSString * {__strong},geo::_retain_objc_arc,geo::_release_objc_arc,geo::_hash_objc,geo::_equal_objc>,std::shared_ptr<gss::StylesheetManager<gss::PropertyID>>>,mdm::Allocator>>::destroy((uint64_t)&p_pair1[-1].__value__2, (uint64_t)left);
  p_pair1[1].__value_.__left_ = 0;
  p_pair1[-1].__value__2._allocator = (Allocator *)p_pair1;
  p_pair1->__value_.__left_ = 0;
  uint64_t v8 = (geo::read_write_lock *)pthread_rwlock_unlock(&p_nameToStyleManagerLock->_lock);
  if (v8)
  {
    geo::read_write_lock::logFailure(v8, (uint64_t)"unlock", v9);
  }
}

- (id)_startTileGroupObserver
{
  v1 = (id *)(a1 + 8);
  v2 = (id *)operator new(0x10uLL);
  id *v2 = &unk_1EF56C708;
  objc_copyWeak(v2 + 1, v1);
  return v2;
}

- (uint64_t)_startTileGroupObserver
{
  return a1;
}

@end