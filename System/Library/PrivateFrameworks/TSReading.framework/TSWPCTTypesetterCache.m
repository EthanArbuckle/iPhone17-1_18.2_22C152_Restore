@interface TSWPCTTypesetterCache
- (id).cxx_construct;
- (shared_ptr<TSWPParagraphTypesetter>)cachedTypesetterForParagraphIdentifier:(unint64_t)a3;
- (void)addTypesetterForParagraphIdentifier:(unint64_t)a3 typesetter:(shared_ptr<TSWPParagraphTypesetter>)a4;
- (void)clearCache;
- (void)dealloc;
- (void)p_limitCacheSize:(unint64_t)a3;
- (void)removeTypesetterForParagraphIndex:(unint64_t)a3;
@end

@implementation TSWPCTTypesetterCache

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 1) = (char *)self + 16;
  return self;
}

- (shared_ptr<TSWPParagraphTypesetter>)cachedTypesetterForParagraphIdentifier:(unint64_t)a3
{
  void *v3 = 0;
  v3[1] = 0;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *)self->_typesetters.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  v5 = left;
  if (left)
  {
    v7 = p_pair1;
    do
    {
      unint64_t v8 = (unint64_t)v5[4].__value_.__left_;
      BOOL v9 = v8 >= a3;
      if (v8 >= a3) {
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> **)v5;
      }
      else {
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> **)&v5[1];
      }
      if (v9) {
        v7 = v5;
      }
      v5 = *v10;
    }
    while (*v10);
    if (v7 != p_pair1 && v7[4].__value_.__left_ <= (void *)a3)
    {
      v12 = v7[5].__value_.__left_;
      v11 = (atomic_ullong *)v7[6].__value_.__left_;
      if (v11) {
        atomic_fetch_add_explicit(v11 + 1, 1uLL, memory_order_relaxed);
      }
      void *v3 = v12;
      v3[1] = v11;
    }
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (TSWPParagraphTypesetter *)p_pair1;
  return result;
}

- (void)dealloc
{
  [(TSWPCTTypesetterCache *)self clearCache];
  v3.receiver = self;
  v3.super_class = (Class)TSWPCTTypesetterCache;
  [(TSWPCTTypesetterCache *)&v3 dealloc];
}

- (void)clearCache
{
  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  std::__tree<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>>>::destroy((uint64_t)&self->_typesetters, (void *)self->_typesetters.__tree_.__pair1_.__value_.__left_);
  p_pair1[-1].__value_.__left_ = p_pair1;
  p_pair1->__value_.__left_ = 0;
  p_pair1[1].__value_.__left_ = 0;
}

- (void)removeTypesetterForParagraphIndex:(unint64_t)a3
{
  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  left = self->_typesetters.__tree_.__pair1_.__value_.__left_;
  if (left)
  {
    p_typesetters = (uint64_t **)&self->_typesetters;
    v6 = (uint64_t *)p_pair1;
    do
    {
      unint64_t v7 = left[4];
      BOOL v8 = v7 >= a3;
      if (v7 >= a3) {
        BOOL v9 = left;
      }
      else {
        BOOL v9 = left + 1;
      }
      if (v8) {
        v6 = left;
      }
      left = (void *)*v9;
    }
    while (*v9);
    if (v6 != (uint64_t *)p_pair1 && v6[4] <= a3) {
      std::__tree<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>>>::erase(p_typesetters, v6);
    }
  }
}

- (void)addTypesetterForParagraphIdentifier:(unint64_t)a3 typesetter:(shared_ptr<TSWPParagraphTypesetter>)a4
{
  unint64_t v12 = a3;
  if (*(void *)a4.var0)
  {
    var0 = a4.var0;
    v13 = &v12;
    v6 = std::__tree<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>>>::__emplace_unique_key_args<unsigned long,std::piecewise_construct_t const&,std::tuple<unsigned long const&>,std::tuple<>>((uint64_t **)&self->_typesetters, &v12, (uint64_t)&std::piecewise_construct, (uint64_t **)&v13);
    uint64_t v8 = *(void *)var0;
    uint64_t v7 = *((void *)var0 + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    BOOL v9 = (std::__shared_weak_count *)v6[6];
    v6[5] = v8;
    v6[6] = v7;
    if (v9) {
      std::__shared_weak_count::__release_shared[abi:nn180100](v9);
    }
    [(TSWPCTTypesetterCache *)self p_limitCacheSize:v12];
    if (self->_typesetters.__tree_.__pair3_.__value_ >= 2)
    {
      v10 = (void *)[MEMORY[0x263F7C7F0] currentHandler];
      uint64_t v11 = [NSString stringWithUTF8String:"-[TSWPCTTypesetterCache addTypesetterForParagraphIdentifier:typesetter:]"];
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPCTTypesetterCache.mm"), 57, @"too many entries in our typesetter cache");
    }
  }
}

- (void)p_limitCacheSize:(unint64_t)a3
{
  if (self->_typesetters.__tree_.__pair3_.__value_ >= 2)
  {
    p_pair1 = &self->_typesetters.__tree_.__pair1_;
    left = (uint64_t *)self->_typesetters.__tree_.__pair1_.__value_.__left_;
    if (left)
    {
      do
      {
        v5 = left;
        left = (uint64_t *)left[1];
      }
      while (left);
    }
    else
    {
      do
      {
        v5 = (uint64_t *)p_pair1[2].__value_.__left_;
        BOOL v6 = *v5 == (void)p_pair1;
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<TSWPParagraphTypesetter>>, void *>>> *)v5;
      }
      while (v6);
    }
    p_typesetters = (uint64_t **)&self->_typesetters;
    if (v5[4] == a3) {
      v5 = *p_typesetters;
    }
    std::__tree<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::__map_value_compare<unsigned long,std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>,std::less<unsigned long>,true>,std::allocator<std::__value_type<unsigned long,std::shared_ptr<TSWPParagraphTypesetter>>>>::erase(p_typesetters, v5);
  }
}

@end