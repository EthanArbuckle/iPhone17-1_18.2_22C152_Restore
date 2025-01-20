@interface CRLWPCTTypesetterCache
- (id).cxx_construct;
- (shared_ptr<CRLWPParagraphTypesetter>)cachedTypesetterForParagraphIdentifier:(unint64_t)a3;
- (void)addTypesetterForParagraphIdentifier:(unint64_t)a3 typesetter:(shared_ptr<CRLWPParagraphTypesetter>)a4;
- (void)clearCache;
- (void)dealloc;
- (void)p_limitCacheSize:(unint64_t)a3;
- (void)removeTypesetterForParagraphIndex:(unint64_t)a3;
@end

@implementation CRLWPCTTypesetterCache

- (void)dealloc
{
  [(CRLWPCTTypesetterCache *)self clearCache];
  v3.receiver = self;
  v3.super_class = (Class)CRLWPCTTypesetterCache;
  [(CRLWPCTTypesetterCache *)&v3 dealloc];
}

- (shared_ptr<CRLWPParagraphTypesetter>)cachedTypesetterForParagraphIdentifier:(unint64_t)a3
{
  *objc_super v3 = 0;
  v3[1] = 0;
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *)self->_typesetters.__tree_.__pair1_.__value_.__left_;
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
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> **)v5;
      }
      else {
        v10 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> **)&v5[1];
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
      *objc_super v3 = v12;
      v3[1] = v11;
    }
  }
  result.var1 = (__shared_weak_count *)a2;
  result.var0 = (CRLWPParagraphTypesetter *)p_pair1;
  return result;
}

- (void)addTypesetterForParagraphIdentifier:(unint64_t)a3 typesetter:(shared_ptr<CRLWPParagraphTypesetter>)a4
{
  unint64_t v16 = a3;
  if (*(void *)a4.var0)
  {
    var0 = a4.var0;
    *(void *)buf = &v16;
    v6 = sub_1001AF668((uint64_t **)&self->_typesetters, &v16, (uint64_t)&unk_101174E70, (uint64_t **)buf);
    uint64_t v8 = *(void *)var0;
    uint64_t v7 = *((void *)var0 + 1);
    if (v7) {
      atomic_fetch_add_explicit((atomic_ullong *volatile)(v7 + 8), 1uLL, memory_order_relaxed);
    }
    BOOL v9 = (std::__shared_weak_count *)v6[6];
    v6[5] = v8;
    v6[6] = v7;
    if (v9) {
      sub_100039CE8(v9);
    }
    -[CRLWPCTTypesetterCache p_limitCacheSize:](self, "p_limitCacheSize:", v16, v16);
    if (self->_typesetters.__tree_.__pair3_.__value_ >= 0x41)
    {
      int v10 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DE068);
      }
      v11 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_101084714(v10, v11);
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014DE088);
      }
      v12 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v12, OS_LOG_TYPE_ERROR))
      {
        v13 = +[CRLAssertionHandler packedBacktraceString];
        sub_10106CDAC(v13, buf, v10, (os_log_t)v12);
      }

      v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPCTTypesetterCache addTypesetterForParagraphIdentifier:typesetter:]");
      v15 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/CRLWPCTTypesetterCache.mm"];
      +[CRLAssertionHandler handleFailureInFunction:v14 file:v15 lineNumber:43 isFatal:0 description:"too many entries in our typesetter cache"];
    }
  }
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
      sub_1001AF72C(p_typesetters, v6);
    }
  }
}

- (void)clearCache
{
  p_pair1 = &self->_typesetters.__tree_.__pair1_;
  sub_1001AF76C((uint64_t)&self->_typesetters, (void *)self->_typesetters.__tree_.__pair1_.__value_.__left_);
  p_pair1[-1].__value_.__left_ = p_pair1;
  p_pair1->__value_.__left_ = 0;
  p_pair1[1].__value_.__left_ = 0;
}

- (void)p_limitCacheSize:(unint64_t)a3
{
  if (self->_typesetters.__tree_.__pair3_.__value_ >= 0x41)
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
        p_pair1 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, std::shared_ptr<CRLWPParagraphTypesetter>>, void *>>> *)v5;
      }
      while (v6);
    }
    p_typesetters = (uint64_t **)&self->_typesetters;
    if (v5[4] == a3) {
      v5 = *p_typesetters;
    }
    sub_1001AF72C(p_typesetters, v5);
  }
}

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

@end