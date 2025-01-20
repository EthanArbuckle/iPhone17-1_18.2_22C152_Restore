@interface CRLWPFontMetricsCache
+ (id)sharedCache;
- (BOOL)p_findEntryForFont:(__CTFont *)a3 outHeightInfo:(CRLWPFontHeightInfo *)a4 outWidths:(unint64_t *)a5 outCollision:(BOOL *)a6;
- (CRLWPFontHeightInfo)fontHeightInfoForFont:(SEL)a3;
- (CRLWPFontHeightInfo)p_fontHeightInfoForFont:(SEL)a3 outWidths:(__CTFont *)a4;
- (CRLWPFontMetricsCache)init;
- (id).cxx_construct;
- (unint64_t)supportedFractionalWidthsForFont:(__CTFont *)a3;
- (void)dealloc;
- (void)p_addEntryForFont:(__CTFont *)a3 heightInfo:(const CRLWPFontHeightInfo *)a4 widths:(unint64_t)a5;
- (void)validateFontHeightInfo:(const CRLWPFontHeightInfo *)a3 description:(id)a4;
@end

@implementation CRLWPFontMetricsCache

+ (id)sharedCache
{
  if (qword_1016A9360 != -1) {
    dispatch_once(&qword_1016A9360, &stru_1014E4210);
  }
  v2 = (void *)qword_1016A9368;

  return v2;
}

- (CRLWPFontMetricsCache)init
{
  v5.receiver = self;
  v5.super_class = (Class)CRLWPFontMetricsCache;
  v2 = [(CRLWPFontMetricsCache *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_maxCacheSize = 32;
    pthread_rwlock_init(&v2->_lock, 0);
  }
  return v3;
}

- (void)dealloc
{
  pthread_rwlock_destroy(&self->_lock);
  begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *)self->_fontHashToInfoMap.__tree_.__begin_node_;
  if (begin_node != &self->_fontHashToInfoMap.__tree_.__pair1_)
  {
    do
    {
      CFRelease(begin_node[18].__value_.__left_);
      left = (CRLWPFontMetricsCache *)begin_node[1].__value_.__left_;
      if (left)
      {
        do
        {
          objc_super v5 = left;
          left = (CRLWPFontMetricsCache *)left->super.isa;
        }
        while (left);
      }
      else
      {
        do
        {
          objc_super v5 = (CRLWPFontMetricsCache *)begin_node[2].__value_.__left_;
          BOOL v6 = v5->super.isa == (Class)begin_node;
          begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *)v5;
        }
        while (!v6);
      }
      begin_node = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *)v5;
    }
    while (v5 != (CRLWPFontMetricsCache *)&self->_fontHashToInfoMap.__tree_.__pair1_);
  }
  v7.receiver = self;
  v7.super_class = (Class)CRLWPFontMetricsCache;
  [(CRLWPFontMetricsCache *)&v7 dealloc];
}

- (CRLWPFontHeightInfo)fontHeightInfoForFont:(SEL)a3
{
  uint64_t v5 = 0;
  return [(CRLWPFontMetricsCache *)self p_fontHeightInfoForFont:a4 outWidths:&v5];
}

- (CRLWPFontHeightInfo)p_fontHeightInfoForFont:(SEL)a3 outWidths:(__CTFont *)a4
{
  *retstr = *(CRLWPFontHeightInfo *)byte_1011763E8;
  if (!a4)
  {
    int v9 = +[CRLAssertionHandler _atomicIncrementAssertCount];
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4230);
    }
    if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
      sub_10108F030(v9);
    }
    if (qword_101719A70 != -1) {
      dispatch_once(&qword_101719A70, &stru_1014E4250);
    }
    v10 = off_10166B4A0;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      v11 = +[CRLAssertionHandler packedBacktraceString];
      sub_101069C40(v11, (uint64_t)v30, v9);
    }

    v12 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontMetricsCache p_fontHeightInfoForFont:outWidths:]");
    v13 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontMetricsCache.mm"];
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 54, 0, "invalid nil value for '%{public}s'", "font");
  }
  pthread_rwlock_rdlock(&self->_lock);
  char v28 = 0;
  unsigned __int8 v14 = [(CRLWPFontMetricsCache *)self p_findEntryForFont:a4 outHeightInfo:retstr outWidths:a5 outCollision:&v28];
  result = (CRLWPFontHeightInfo *)pthread_rwlock_unlock(&self->_lock);
  if ((v14 & 1) == 0)
  {
    double Size = sub_1001CE41C(a4);
    retstr->double ascent = CTFontGetAscent(a4);
    retstr->double descent = CTFontGetDescent(a4);
    retstr->capHeight = CTFontGetCapHeight(a4);
    retstr->xHeight = CTFontGetXHeight(a4);
    retstr->underlinePosition = CTFontGetUnderlinePosition(a4);
    retstr->underlineThickness = CTFontGetUnderlineThickness(a4);
    CGFloat Leading = CTFontGetLeading(a4);
    double ascent = retstr->ascent;
    double descent = retstr->descent;
    if (ascent == 0.0 && descent == 0.0 && Leading == 0.0)
    {
      int v20 = +[CRLAssertionHandler _atomicIncrementAssertCount];
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E4270);
      }
      if (os_log_type_enabled((os_log_t)off_10166B4A0, OS_LOG_TYPE_ERROR)) {
        sub_10108EFA8();
      }
      if (qword_101719A70 != -1) {
        dispatch_once(&qword_101719A70, &stru_1014E4290);
      }
      v21 = off_10166B4A0;
      if (os_log_type_enabled((os_log_t)v21, OS_LOG_TYPE_ERROR))
      {
        v22 = +[CRLAssertionHandler packedBacktraceString];
        sub_101069C40(v22, (uint64_t)v29, v20);
      }

      v23 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLWPFontMetricsCache p_fontHeightInfoForFont:outWidths:]");
      v24 = +[NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLWP/Fonts/CRLWPFontMetricsCache.mm"];
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 78, 0, "Bad metrics for font %{public}@", a4);

      double Size = CTFontGetSize(a4);
      double descent = Size * 0.5;
      retstr->double descent = Size * 0.5;
      retstr->double ascent = Size * 0.5;
      double ascent = Size * 0.5;
    }
    if (retstr->capHeight <= 0.0) {
      retstr->capHeight = ascent;
    }
    retstr->leadingAbove = Size - ascent - descent - Leading;
    retstr->leadingBelow = Leading;
    v25 = [(__CTFont *)a4 description];
    [(CRLWPFontMetricsCache *)self validateFontHeightInfo:retstr description:v25];

    if (!v28)
    {
      pthread_rwlock_wrlock(&self->_lock);
      unsigned __int8 v26 = [(CRLWPFontMetricsCache *)self p_findEntryForFont:a4 outHeightInfo:retstr outWidths:a5 outCollision:&v28];
      if (v28) {
        char v27 = 1;
      }
      else {
        char v27 = v26;
      }
      if ((v27 & 1) == 0) {
        [(CRLWPFontMetricsCache *)self p_addEntryForFont:a4 heightInfo:retstr widths:*a5];
      }
      return (CRLWPFontHeightInfo *)pthread_rwlock_unlock(&self->_lock);
    }
  }
  return result;
}

- (unint64_t)supportedFractionalWidthsForFont:(__CTFont *)a3
{
  unint64_t v4 = 0;
  [(CRLWPFontMetricsCache *)self p_fontHeightInfoForFont:a3 outWidths:&v4];
  return v4;
}

- (void)validateFontHeightInfo:(const CRLWPFontHeightInfo *)a3 description:(id)a4
{
}

- (BOOL)p_findEntryForFont:(__CTFont *)a3 outHeightInfo:(CRLWPFontHeightInfo *)a4 outWidths:(unint64_t *)a5 outCollision:(BOOL *)a6
{
  CFHashCode v11 = CFHash(a3);
  left = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> *)self->_fontHashToInfoMap.__tree_.__pair1_.__value_.__left_;
  p_pair1 = &self->_fontHashToInfoMap.__tree_.__pair1_;
  v12 = left;
  if (!left) {
    goto LABEL_12;
  }
  v15 = p_pair1;
  do
  {
    CFHashCode v16 = (CFHashCode)v12[4].__value_.__left_;
    BOOL v17 = v16 >= v11;
    if (v16 >= v11) {
      v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> **)v12;
    }
    else {
      v18 = (__compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<unsigned long, CRLWPFontMetricsCacheEntry>, void *>>> **)&v12[1];
    }
    if (v17) {
      v15 = v12;
    }
    v12 = *v18;
  }
  while (*v18);
  if (v15 != p_pair1 && (void *)v11 >= v15[4].__value_.__left_)
  {
    *a6 = 0;
    int v20 = (__CTFont *)v15[18].__value_.__left_;
    if (v20 == a3 || (int v19 = CFEqual(v20, a3)) != 0)
    {
      long long v21 = *(_OWORD *)&v15[7].__value_.__left_;
      *(_OWORD *)&a4->spaceBefore = *(_OWORD *)&v15[5].__value_.__left_;
      *(_OWORD *)&a4->double ascent = v21;
      long long v22 = *(_OWORD *)&v15[9].__value_.__left_;
      long long v23 = *(_OWORD *)&v15[11].__value_.__left_;
      long long v24 = *(_OWORD *)&v15[15].__value_.__left_;
      *(_OWORD *)&a4->verticalHeight = *(_OWORD *)&v15[13].__value_.__left_;
      *(_OWORD *)&a4->underlinePosition = v24;
      *(_OWORD *)&a4->double descent = v22;
      *(_OWORD *)&a4->leadingBelow = v23;
      *a5 = (unint64_t)v15[17].__value_.__left_;
      LOBYTE(v19) = 1;
    }
    else
    {
      *a6 = 1;
    }
  }
  else
  {
LABEL_12:
    LOBYTE(v19) = 0;
    *a6 = 0;
  }
  return v19;
}

- (void)p_addEntryForFont:(__CTFont *)a3 heightInfo:(const CRLWPFontHeightInfo *)a4 widths:(unint64_t)a5
{
  CFHashCode v9 = CFHash(a3);
  CFHashCode v24 = v9;
  v10 = operator new(0x18uLL);
  next = self->_fontHashList.__end_.__next_;
  void *v10 = &self->_fontHashList;
  v10[1] = next;
  v10[2] = v9;
  void *next = v10;
  unint64_t v12 = self->_fontHashList.__size_alloc_.__value_ + 1;
  self->_fontHashList.__end_.__next_ = v10;
  self->_fontHashList.__size_alloc_.__value_ = v12;
  v25 = &v24;
  v13 = sub_10023D0B4((uint64_t **)&self->_fontHashToInfoMap, &v24, (uint64_t)&unk_101174E70, &v25);
  long long v14 = *(_OWORD *)&a4->spaceBefore;
  *(_OWORD *)(v13 + 7) = *(_OWORD *)&a4->ascent;
  *(_OWORD *)(v13 + 5) = v14;
  long long v15 = *(_OWORD *)&a4->descent;
  long long v16 = *(_OWORD *)&a4->leadingBelow;
  long long v17 = *(_OWORD *)&a4->verticalHeight;
  *(_OWORD *)(v13 + 15) = *(_OWORD *)&a4->underlinePosition;
  *(_OWORD *)(v13 + 13) = v17;
  *(_OWORD *)(v13 + 11) = v16;
  *(_OWORD *)(v13 + 9) = v15;
  v25 = &v24;
  sub_10023D0B4((uint64_t **)&self->_fontHashToInfoMap, &v24, (uint64_t)&unk_101174E70, &v25)[17] = (uint64_t *)a5;
  v18 = (uint64_t *)CFRetain(a3);
  v25 = &v24;
  sub_10023D0B4((uint64_t **)&self->_fontHashToInfoMap, &v24, (uint64_t)&unk_101174E70, &v25)[18] = v18;
  maxCachedouble Size = self->_maxCacheSize;
  unsigned int v20 = self->_cacheSize + 1;
  self->_cachedouble Size = v20;
  if (v20 > maxCacheSize)
  {
    v25 = (unint64_t *)((char *)self->_fontHashList.__end_.__prev_ + 16);
    long long v21 = sub_10023D0B4((uint64_t **)&self->_fontHashToInfoMap, v25, (uint64_t)&unk_101174E70, &v25);
    CFRelease(v21[18]);
    sub_10023D194((uint64_t)&self->_fontHashToInfoMap, (unint64_t *)self->_fontHashList.__end_.__prev_ + 2);
    prev = (uint64_t *)self->_fontHashList.__end_.__prev_;
    uint64_t v23 = *prev;
    *(void *)(v23 + 8) = prev[1];
    *(void *)prev[1] = v23;
    --self->_fontHashList.__size_alloc_.__value_;
    operator delete(prev);
    --self->_cacheSize;
  }
}

- (void).cxx_destruct
{
  sub_10001BC78((uint64_t)&self->_fontHashToInfoMap, (void *)self->_fontHashToInfoMap.__tree_.__pair1_.__value_.__left_);

  sub_10023D050(&self->_fontHashList.__end_.__prev_);
}

- (id).cxx_construct
{
  *((void *)self + 1) = (char *)self + 8;
  *((void *)self + 2) = (char *)self + 8;
  *((void *)self + 6) = 0;
  *((void *)self + 5) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = (char *)self + 40;
  return self;
}

@end